ValueMetadata *type metadata accessor for HelpRequested()
{
  return &type metadata for HelpRequested;
}

unint64_t sub_10007522C(uint64_t a1)
{
  unint64_t result = sub_100075254();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100075254()
{
  unint64_t result = qword_1000C5C00;
  if (!qword_1000C5C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C00);
  }
  return result;
}

unint64_t sub_1000752A8(uint64_t a1)
{
  unint64_t result = sub_1000752D0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000752D0()
{
  unint64_t result = qword_1000C5C08;
  if (!qword_1000C5C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C08);
  }
  return result;
}

unint64_t sub_100075324(uint64_t a1)
{
  unint64_t result = sub_10007534C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10007534C()
{
  unint64_t result = qword_1000C5C10;
  if (!qword_1000C5C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C10);
  }
  return result;
}

unint64_t sub_1000753A0(uint64_t a1)
{
  unint64_t result = sub_1000753C8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000753C8()
{
  unint64_t result = qword_1000C5C18;
  if (!qword_1000C5C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C18);
  }
  return result;
}

uint64_t sub_10007541C()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return _swift_deallocObject(v0, 81, 7);
}

unint64_t sub_100075470()
{
  unint64_t result = qword_1000C5C28;
  if (!qword_1000C5C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C28);
  }
  return result;
}

uint64_t sub_1000754C4()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 32))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  int v1 = *(unsigned __int8 *)(v0 + 96);
  if (v1 != 255) {
    sub_10002EBFC(*(void *)(v0 + 80), *(void *)(v0 + 88), v1);
  }

  return _swift_deallocObject(v0, 97, 7);
}

uint64_t sub_10007552C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_1000709E0(a1, a2, a3, *(void *)(v3 + 16), (uint64_t *)(v3 + 24), *(unsigned char *)(v3 + 73), *(void *)(v3 + 80), *(void *)(v3 + 88), *(unsigned char *)(v3 + 96));
}

uint64_t sub_100075564()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void *sub_1000755AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100084188(a1, a2, a3, a4, a5, a6, a7, *(void *(**)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16), *(void *)(v7 + 24), *(void *)(v7 + 32), *(void *)(v7 + 40), *(void *)(v7 + 48));
}

uint64_t sub_1000755E0()
{
  if (*(void *)(v0 + 16) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100075638(uint64_t a1, uint64_t a2)
{
  return sub_1000844F4(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_10007565C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_10002EBFC(a1, a2, a3);
  }
  return a1;
}

unint64_t sub_100075670()
{
  unint64_t result = qword_1000C5C48;
  if (!qword_1000C5C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C48);
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerateCompletions.CodingKeys()
{
  return &type metadata for GenerateCompletions.CodingKeys;
}

unsigned char *_s14ArgumentParser19GenerateCompletionsV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
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
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100075778);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AutodetectedGenerateCompletions.CodingKeys()
{
  return &type metadata for AutodetectedGenerateCompletions.CodingKeys;
}

unint64_t sub_1000757B4()
{
  unint64_t result = qword_1000C5C60;
  if (!qword_1000C5C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C60);
  }
  return result;
}

unint64_t sub_10007580C()
{
  unint64_t result = qword_1000C5C68;
  if (!qword_1000C5C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C68);
  }
  return result;
}

unint64_t sub_100075864()
{
  unint64_t result = qword_1000C5C70;
  if (!qword_1000C5C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C70);
  }
  return result;
}

unint64_t sub_1000758BC()
{
  unint64_t result = qword_1000C5C78;
  if (!qword_1000C5C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C78);
  }
  return result;
}

unint64_t sub_100075914()
{
  unint64_t result = qword_1000C5C80;
  if (!qword_1000C5C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C80);
  }
  return result;
}

unint64_t sub_10007596C()
{
  unint64_t result = qword_1000C5C88;
  if (!qword_1000C5C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C88);
  }
  return result;
}

void sub_1000759C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::UInt v5 = *(void *)(a4 + 16);
  Hasher._combine(_:)(v5);
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = a4 + 40;
    do
    {
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      v6 += 16;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
}

Swift::Int sub_100075A98()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  Hasher.init(_seed:)();
  sub_1000759C8((uint64_t)v5, v1, v2, v3);
  return Hasher._finalize()();
}

void sub_100075AF4(uint64_t a1)
{
  sub_1000759C8(a1, *v1, v1[1], v1[2]);
}

Swift::Int sub_100075B00()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  Hasher.init(_seed:)();
  sub_1000759C8((uint64_t)v5, v1, v2, v3);
  return Hasher._finalize()();
}

uint64_t sub_100075B58(void *a1, void *a2)
{
  uint64_t v2 = (void *)a1[2];
  uint64_t v3 = (void *)a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    return 0;
  }

  return sub_10005F640(v2, v3);
}

uint64_t sub_100075BCC(uint64_t a1, uint64_t a2, char *a3)
{
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    a3 = sub_10005FA90(0, *((void *)a3 + 2) + 1, 1, a3);
  }
  unint64_t v7 = *((void *)a3 + 2);
  unint64_t v6 = *((void *)a3 + 3);
  if (v7 >= v6 >> 1) {
    a3 = sub_10005FA90((char *)(v6 > 1), v7 + 1, 1, a3);
  }
  *((void *)a3 + 2) = v7 + 1;
  v8 = &a3[16 * v7];
  *((void *)v8 + 4) = a1;
  *((void *)v8 + 5) = a2;
  swift_bridgeObjectRelease();
  sub_100003DD0(&qword_1000C50C8);
  sub_100067408();
  uint64_t v9 = BidirectionalCollection<>.joined(separator:)();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_100075CD4()
{
  return sub_100075BCC(*(void *)v0, *(void *)(v0 + 8), *(char **)(v0 + 16));
}

uint64_t sub_100075CE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v5 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  unint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 32))(v7);
  uint64_t v8 = dispatch thunk of CodingKey.stringValue.getter();
  uint64_t v10 = v8;
  int64_t v11 = *(void *)(a2 + 16);
  if (v11)
  {
    uint64_t v21 = v9;
    uint64_t v22 = v8;
    uint64_t v24 = v3;
    v26 = _swiftEmptyArrayStorage;
    sub_100056F98(0, v11, 0);
    uint64_t v23 = a2;
    uint64_t v12 = a2 + 32;
    v13 = v26;
    do
    {
      sub_1000356C0(v12, (uint64_t)v25);
      sub_100005090(v25, v25[3]);
      uint64_t v14 = dispatch thunk of CodingKey.stringValue.getter();
      uint64_t v16 = v15;
      sub_100005128((uint64_t)v25);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100056F98(0, v13[2] + 1, 1);
        v13 = v26;
      }
      unint64_t v18 = v13[2];
      unint64_t v17 = v13[3];
      if (v18 >= v17 >> 1)
      {
        sub_100056F98((char *)(v17 > 1), v18 + 1, 1);
        v13 = v26;
      }
      v13[2] = v18 + 1;
      v19 = &v13[2 * v18];
      v19[4] = v14;
      v19[5] = v16;
      v12 += 40;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    uint64_t v3 = v24;
    uint64_t v10 = v22;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  return v10;
}

uint64_t sub_100075F04(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_10005868C(a1, a2);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  if (v12)
  {
    if (v10 == 95 && v12 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0) {
        goto LABEL_7;
      }
    }
    sub_100034DE0(1uLL, a1, a2);
    swift_bridgeObjectRelease();
    a1 = static String._fromSubstring(_:)();
    swift_bridgeObjectRelease();
  }
LABEL_7:
  if (a4)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v14 = (char *)a5;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v14 = sub_10005FA90(0, *(void *)(a5 + 16) + 1, 1, (char *)a5);
    }
    unint64_t v16 = *((void *)v14 + 2);
    unint64_t v15 = *((void *)v14 + 3);
    if (v16 >= v15 >> 1) {
      uint64_t v14 = sub_10005FA90((char *)(v15 > 1), v16 + 1, 1, v14);
    }
    *((void *)v14 + 2) = v16 + 1;
    unint64_t v17 = &v14[16 * v16];
    *((void *)v17 + 4) = a3;
    *((void *)v17 + 5) = a4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t destroy for InputKey()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s14ArgumentParser8InputKeyVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for InputKey(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for InputKey(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for InputKey(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InputKey(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InputKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InputKey()
{
  return &type metadata for InputKey;
}

unint64_t sub_10007628C()
{
  unint64_t result = qword_1000C5C90;
  if (!qword_1000C5C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C90);
  }
  return result;
}

ValueMetadata *type metadata accessor for InputOrigin()
{
  return &type metadata for InputOrigin;
}

uint64_t sub_1000762F0(Swift::UInt a1, Swift::UInt a2, __int16 a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (sub_10006F550(a1, a2, a3 & 0x1FF, a4) & 1) != 0 || (uint64_t v10 = v4, (sub_10006F550(a1, a2, a3 & 0x1FF, v4)))
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_100061630((uint64_t)v9, a1, a2, a3 & 0x1FF);
    return v10;
  }
  return v4;
}

BOOL sub_10007639C(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 17)) {
    return 0;
  }
  if (*(unsigned char *)(a2 + 17)) {
    return 1;
  }
  if (*(void *)a1 < *(void *)a2) {
    return 1;
  }
  if (*(void *)a1 != *(void *)a2) {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 16) & 1) == 0) {
    return (*(unsigned char *)(a2 + 16) & 1) == 0 && *(void *)(a1 + 8) < *(void *)(a2 + 8);
  }
  return (*(unsigned char *)(a2 + 16) & 1) == 0;
}

uint64_t sub_10007640C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100076480(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void))sub_100076424);
}

BOOL sub_100076424(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5, __int16 a6)
{
  if ((a6 & 0x100) == 0)
  {
    if ((a3 & 0x100) != 0 || a4 < a1) {
      return 0;
    }
    if (a4 == a1)
    {
      if ((a6 & 1) == 0) {
        return (a3 & 1) != 0 || a5 >= a2;
      }
      if ((a3 & 1) == 0) {
        return 0;
      }
    }
  }
  return 1;
}

uint64_t sub_100076468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100076480(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void))sub_1000764BC);
}

uint64_t sub_100076480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void))
{
  return a5(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16) | (*(unsigned __int8 *)(a1 + 17) << 8), *(void *)a2, *(void *)(a2 + 8), *(unsigned __int8 *)(a2 + 16) | (*(unsigned __int8 *)(a2 + 17) << 8));
}

BOOL sub_1000764BC(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5, __int16 a6)
{
  if ((a3 & 0x100) == 0)
  {
    if ((a6 & 0x100) != 0 || a1 < a4) {
      return 0;
    }
    if (a1 == a4)
    {
      if ((a3 & 1) == 0) {
        return (a6 & 1) != 0 || a2 >= a5;
      }
      if ((a6 & 1) == 0) {
        return 0;
      }
    }
  }
  return 1;
}

BOOL sub_100076500(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 17)) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 17)) {
    return 1;
  }
  if (*(void *)a2 < *(void *)a1) {
    return 1;
  }
  if (*(void *)a2 != *(void *)a1) {
    return 0;
  }
  if ((*(unsigned char *)(a2 + 16) & 1) == 0) {
    return (*(unsigned char *)(a1 + 16) & 1) == 0 && *(void *)(a2 + 8) < *(void *)(a1 + 8);
  }
  return (*(unsigned char *)(a1 + 16) & 1) == 0;
}

Swift::Int sub_100076570()
{
  Swift::UInt v1 = *(void *)v0;
  Swift::UInt v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  char v4 = *(unsigned char *)(v0 + 17);
  Hasher.init(_seed:)();
  Swift::UInt v5 = 0;
  if ((v4 & 1) == 0)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
    if (v3)
    {
      Swift::UInt v5 = 0;
    }
    else
    {
      Hasher._combine(_:)(1uLL);
      Swift::UInt v5 = v2;
    }
  }
  Hasher._combine(_:)(v5);
  return Hasher._finalize()();
}

void sub_100076600()
{
  if ((*(unsigned char *)(v0 + 17) & 1) != 0
    || (char v1 = *(unsigned char *)(v0 + 16),
        Swift::UInt v3 = *(void *)v0,
        Swift::UInt v2 = *(void *)(v0 + 8),
        Hasher._combine(_:)(1uLL),
        Hasher._combine(_:)(v3),
        (v1 & 1) != 0))
  {
    Swift::UInt v2 = 0;
  }
  else
  {
    Hasher._combine(_:)(1uLL);
  }
  Hasher._combine(_:)(v2);
}

Swift::Int sub_100076668()
{
  Swift::UInt v2 = *(void *)v0;
  Swift::UInt v1 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  char v4 = *(unsigned char *)(v0 + 17);
  Hasher.init(_seed:)();
  if (v4 & 1) != 0 || (Hasher._combine(_:)(1uLL), Hasher._combine(_:)(v2), (v3)) {
    Swift::UInt v1 = 0;
  }
  else {
    Hasher._combine(_:)(1uLL);
  }
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_1000766F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 17);
  if ((*(unsigned char *)(a1 + 17) & 1) == 0)
  {
    if ((v2 & 1) == 0 && *(void *)a1 == *(void *)a2)
    {
      if (*(unsigned char *)(a1 + 16))
      {
        if (*(unsigned char *)(a2 + 16)) {
          return 1;
        }
      }
      else if ((*(unsigned char *)(a2 + 16) & 1) == 0 && *(void *)(a1 + 8) == *(void *)(a2 + 8))
      {
        return 1;
      }
    }
    return 0;
  }
  return v2;
}

Swift::Int sub_100076748(Swift::Int *a1, uint64_t *a2)
{
  return sub_100076794(*a1, *a2);
}

uint64_t sub_100076754@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100076A54(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

Swift::Int sub_100076794(Swift::Int result, uint64_t a2)
{
  if (result != a2)
  {
    Swift::Int v3 = result;
    if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
      return 0;
    }
    int64_t v4 = 0;
    Swift::Int v26 = result + 56;
    uint64_t v5 = 1 << *(unsigned char *)(result + 32);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(result + 56);
    int64_t v27 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = a2 + 56;
LABEL_7:
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      int64_t v28 = v4;
      unint64_t v10 = v9 | (v4 << 6);
LABEL_25:
      uint64_t v15 = *(void *)(v3 + 48) + 24 * v10;
      Swift::UInt v16 = *(void *)v15;
      Swift::UInt v17 = *(void *)(v15 + 8);
      char v18 = *(unsigned char *)(v15 + 16);
      char v19 = *(unsigned char *)(v15 + 17);
      Hasher.init(_seed:)();
      if (v19 & 1) != 0 || (Hasher._combine(_:)(1uLL), Hasher._combine(_:)(v16), (v18))
      {
        Swift::UInt v20 = 0;
      }
      else
      {
        Hasher._combine(_:)(1uLL);
        Swift::UInt v20 = v17;
      }
      Hasher._combine(_:)(v20);
      uint64_t result = Hasher._finalize()();
      uint64_t v21 = -1 << *(unsigned char *)(a2 + 32);
      unint64_t v22 = result & ~v21;
      if ((*(void *)(v8 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22))
      {
        uint64_t v23 = ~v21;
        while (1)
        {
          uint64_t v24 = *(void *)(a2 + 48) + 24 * v22;
          if (*(unsigned char *)(v24 + 17))
          {
            if (v19)
            {
              int64_t v4 = v28;
              goto LABEL_7;
            }
          }
          else
          {
            if (*(void *)v24 == v16) {
              char v25 = v19;
            }
            else {
              char v25 = 1;
            }
            if ((v25 & 1) == 0)
            {
              if (*(unsigned char *)(v24 + 16))
              {
                if (v18)
                {
                  int64_t v4 = v28;
                  goto LABEL_7;
                }
              }
              else if ((v18 & 1) == 0 && *(void *)(v24 + 8) == v17)
              {
                int64_t v4 = v28;
                goto LABEL_7;
              }
            }
          }
          unint64_t v22 = (v22 + 1) & v23;
          if (((*(void *)(v8 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
            return 0;
          }
        }
      }
      return 0;
    }
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
LABEL_49:
      __break(1u);
      return result;
    }
    if (v11 < v27)
    {
      unint64_t v12 = *(void *)(v26 + 8 * v11);
      int64_t v13 = v4 + 1;
      if (v12) {
        goto LABEL_24;
      }
      int64_t v13 = v4 + 2;
      if (v4 + 2 >= v27) {
        return 1;
      }
      unint64_t v12 = *(void *)(v26 + 8 * v13);
      if (v12) {
        goto LABEL_24;
      }
      int64_t v13 = v4 + 3;
      if (v4 + 3 >= v27) {
        return 1;
      }
      unint64_t v12 = *(void *)(v26 + 8 * v13);
      if (v12) {
        goto LABEL_24;
      }
      int64_t v13 = v4 + 4;
      if (v4 + 4 >= v27) {
        return 1;
      }
      unint64_t v12 = *(void *)(v26 + 8 * v13);
      if (v12)
      {
LABEL_24:
        unint64_t v7 = (v12 - 1) & v12;
        int64_t v28 = v13;
        unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
        goto LABEL_25;
      }
      uint64_t v14 = v4 + 5;
      if (v4 + 5 < v27)
      {
        unint64_t v12 = *(void *)(v26 + 8 * v14);
        if (v12)
        {
          int64_t v13 = v4 + 5;
          goto LABEL_24;
        }
        while (1)
        {
          int64_t v13 = v14 + 1;
          if (__OFADD__(v14, 1)) {
            goto LABEL_49;
          }
          if (v13 >= v27) {
            return 1;
          }
          unint64_t v12 = *(void *)(v26 + 8 * v13);
          ++v14;
          if (v12) {
            goto LABEL_24;
          }
        }
      }
    }
  }
  return 1;
}

uint64_t sub_100076A54(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_10006FFD0();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v10 = result;
  if (v2)
  {
    int64_t v4 = (unsigned __int8 *)(a1 + 49);
    do
    {
      Swift::UInt v5 = *(void *)(v4 - 17);
      Swift::UInt v6 = *(void *)(v4 - 9);
      int v7 = *(v4 - 1);
      int v8 = *v4;
      v4 += 24;
      sub_100061630((uint64_t)v9, v5, v6, v7 | (v8 << 8));
      --v2;
    }
    while (v2);
    return v10;
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for InputOrigin.Element(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for InputOrigin.Element(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 18)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for InputOrigin.Element(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_WORD *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 18) = v3;
  return result;
}

uint64_t sub_100076B3C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100076B58(uint64_t result, int a2)
{
  if (a2)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 17) = 1;
  }
  else
  {
    *(unsigned char *)(result + 17) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for InputOrigin.Element()
{
  return &type metadata for InputOrigin.Element;
}

unint64_t sub_100076B90()
{
  unint64_t result = qword_1000C5C98;
  if (!qword_1000C5C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5C98);
  }
  return result;
}

uint64_t destroy for Name(uint64_t a1)
{
  return sub_10002ECB8(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s14ArgumentParser4NameOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1000319B8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Name(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1000319B8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_10002ECB8(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for Name(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_10002ECB8(v4, v5, v6);
  return a1;
}

uint64_t sub_100076CE4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_100076CF0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = *(unsigned char *)(result + 16) & 1 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for Name()
{
  return &type metadata for Name;
}

unint64_t sub_100076D18()
{
  unint64_t result = qword_1000C5CA0[0];
  if (!qword_1000C5CA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000C5CA0);
  }
  return result;
}

uint64_t sub_100076D6C(Swift::String a1, unsigned __int8 a2)
{
  if (!(a2 >> 6))
  {
    uint64_t v3 = 11565;
LABEL_6:
    uint64_t v5 = v3;
    String.append(_:)(a1);
    return v5;
  }
  if (a2 >> 6 != 1)
  {
    uint64_t v3 = 45;
    goto LABEL_6;
  }
  uint64_t v5 = 0;
  v2._countAndFlagsBits = 45;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  Character.write<A>(to:)();
  return v5;
}

Swift::Int sub_100076E18(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  Hasher.init(_seed:)();
  if (!(a3 >> 6))
  {
    Swift::UInt v4 = 0;
LABEL_6:
    Hasher._combine(_:)(v4);
    String.hash(into:)();
    return Hasher._finalize()();
  }
  if (a3 >> 6 != 1)
  {
    Swift::UInt v4 = 2;
    goto LABEL_6;
  }
  Hasher._combine(_:)(1uLL);
  Character.hash(into:)();
  Hasher._combine(_:)(a3 & 1);
  return Hasher._finalize()();
}

uint64_t sub_100076ECC(uint64_t a1, uint64_t a2)
{
  Swift::String v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void *)a2;
  Swift::UInt v4 = *(void **)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 16);
  v14._countAndFlagsBits = *(void *)a1;
  v14._object = v2;
  uint64_t v7 = sub_100076D6C(v14, v5);
  uint64_t v9 = v8;
  v15._countAndFlagsBits = v3;
  v15._object = v4;
  if (v7 == sub_100076D6C(v15, v6) && v9 == v10) {
    char v12 = 0;
  }
  else {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

uint64_t sub_100076F78(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 16);
  uint64_t v5 = sub_100076D6C(*(Swift::String *)a2, *(unsigned char *)(a2 + 16));
  uint64_t v7 = v6;
  v13._countAndFlagsBits = v2;
  v13._object = v3;
  if (v5 == sub_100076D6C(v13, v4) && v7 == v8)
  {
    swift_bridgeObjectRelease_n();
    char v11 = 1;
  }
  else
  {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v11 = v10 ^ 1;
  }
  return v11 & 1;
}

uint64_t sub_100077030(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void *)a2;
  unsigned __int8 v4 = *(void **)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 16);
  v15._countAndFlagsBits = *(void *)a1;
  v15._object = v2;
  uint64_t v7 = sub_100076D6C(v15, v5);
  uint64_t v9 = v8;
  v16._countAndFlagsBits = v3;
  v16._object = v4;
  if (v7 == sub_100076D6C(v16, v6) && v9 == v10)
  {
    swift_bridgeObjectRelease_n();
    char v13 = 1;
  }
  else
  {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v13 = v12 ^ 1;
  }
  return v13 & 1;
}

uint64_t sub_1000770E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 16);
  uint64_t v5 = sub_100076D6C(*(Swift::String *)a2, *(unsigned char *)(a2 + 16));
  uint64_t v7 = v6;
  v12._countAndFlagsBits = v2;
  v12._object = v3;
  if (v5 == sub_100076D6C(v12, v4) && v7 == v8) {
    char v10 = 0;
  }
  else {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_100077194(uint64_t a1, uint64_t a2)
{
  return sub_1000774B4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

Swift::Int sub_1000771B0()
{
  return sub_100076E18(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

void sub_1000771BC()
{
  unsigned int v1 = *(unsigned __int8 *)(v0 + 16);
  if (v1 >> 6)
  {
    if (v1 >> 6 == 1)
    {
      Swift::UInt8 v2 = v1 & 1;
      Hasher._combine(_:)(1uLL);
      Character.hash(into:)();
      Hasher._combine(_:)(v2);
      return;
    }
    Swift::UInt v3 = 2;
  }
  else
  {
    Swift::UInt v3 = 0;
  }
  Hasher._combine(_:)(v3);

  String.hash(into:)();
}

Swift::Int sub_100077270()
{
  unsigned int v1 = *(unsigned __int8 *)(v0 + 16);
  Hasher.init(_seed:)();
  if (!(v1 >> 6))
  {
    Swift::UInt v2 = 0;
LABEL_6:
    Hasher._combine(_:)(v2);
    String.hash(into:)();
    return Hasher._finalize()();
  }
  if (v1 >> 6 != 1)
  {
    Swift::UInt v2 = 2;
    goto LABEL_6;
  }
  Hasher._combine(_:)(1uLL);
  Character.hash(into:)();
  Hasher._combine(_:)(v1 & 1);
  return Hasher._finalize()();
}

BOOL sub_10007731C(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 14;
  swift_bridgeObjectRetain();
  if (v5 == a3 >> 14)
  {
LABEL_10:
    object = String.Iterator.next()().value._object;
    swift_bridgeObjectRelease();
    BOOL v13 = object == 0;
  }
  else
  {
    swift_bridgeObjectRetain();
    while (1)
    {
      while (1)
      {
        uint64_t v7 = Substring.subscript.getter();
        uint64_t v9 = v8;
        unint64_t v10 = Substring.index(after:)();
        Swift::String_optional v11 = String.Iterator.next()();
        if (!v11.value._object)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          BOOL v13 = 1;
          goto LABEL_13;
        }
        if (v7 != v11.value._countAndFlagsBits || v11.value._object != v9) {
          break;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v5 == v10 >> 14)
        {
LABEL_9:
          swift_bridgeObjectRelease();
          goto LABEL_10;
        }
      }
      char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0) {
        break;
      }
      if (v5 == v10 >> 14) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    BOOL v13 = 0;
  }
LABEL_13:
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_1000774B4(uint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a3 >> 6)
  {
    if (a3 >> 6 == 1)
    {
      if ((a6 & 0xC0) == 0x40)
      {
        if (a1 == a4 && a2 == a5 || (v8 = _stringCompareWithSmolCheck(_:_:expecting:)(), char v9 = 0, (v8 & 1) != 0)) {
          char v9 = ((a3 & 1) == 0) ^ a6;
        }
        return v9 & 1;
      }
      goto LABEL_13;
    }
    if ((a6 & 0xC0) != 0x80)
    {
LABEL_13:
      char v9 = 0;
      return v9 & 1;
    }
  }
  else if (a6 >= 0x40u)
  {
    goto LABEL_13;
  }
  if (a1 == a4 && a2 == a5)
  {
    char v9 = 1;
    return v9 & 1;
  }

  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10007758C(unint64_t a1, unint64_t a2)
{
  if (sub_10007731C(11565, 0xE200000000000000, a1, a2))
  {
    unint64_t v4 = Substring.index(_:offsetBy:limitedBy:)();
    if (v5) {
      unint64_t v4 = a2;
    }
    if (a2 >> 14 >= v4 >> 14)
    {
LABEL_12:
      Substring.subscript.getter();
      swift_bridgeObjectRelease();
      uint64_t v7 = static String._fromSubstring(_:)();
      goto LABEL_13;
    }
    __break(1u);
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = Substring.distance(from:to:)();
  swift_bridgeObjectRelease();
  if (v6 != 2)
  {
    unint64_t v8 = Substring.index(_:offsetBy:limitedBy:)();
    if (v9) {
      unint64_t v8 = a2;
    }
    if (a2 >> 14 >= v8 >> 14) {
      goto LABEL_12;
    }
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((a2 ^ a1) >= 0x4000)
  {
    Substring.index(before:)();
    uint64_t v7 = Substring.subscript.getter();
LABEL_13:
    swift_bridgeObjectRelease();
    return v7;
  }
LABEL_16:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_1000777A0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_100077838(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  Swift::UInt v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 0x10uLL) {
    uint64_t v5 = 16;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *(void *)a2;
    *Swift::UInt v3 = *(void *)a2;
    Swift::UInt v3 = (void *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
  }
  else
  {
    unsigned int v9 = a2[v5];
    unsigned int v10 = v9 - 2;
    if (v9 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a2;
          goto LABEL_19;
        case 2:
          int v12 = *(unsigned __int16 *)a2;
          goto LABEL_19;
        case 3:
          int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_19;
        case 4:
          int v12 = *(_DWORD *)a2;
LABEL_19:
          int v13 = (v12 | (v10 << (8 * v5))) + 2;
          unsigned int v9 = v12 + 2;
          if (v5 < 4) {
            unsigned int v9 = v13;
          }
          break;
        default:
          break;
      }
    }
    if (v9 != 1)
    {
      (*(void (**)(void *))(v4 + 16))(a1);
      *((unsigned char *)v3 + v5) = 0;
      return v3;
    }
    uint64_t v14 = *((void *)a2 + 1);
    *Swift::UInt v3 = *(void *)a2;
    v3[1] = v14;
    *((unsigned char *)v3 + v5) = 1;
  }
  swift_retain();
  return v3;
}

uint64_t sub_1000779B0(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 0x10) {
    unint64_t v2 = 16;
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
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

void *sub_100077AB0(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    uint64_t v4 = 16;
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
    *a1 = *(void *)a2;
    a1[1] = v10;
    swift_retain();
    char v11 = 1;
  }
  else
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v11 = 0;
  }
  *((unsigned char *)a1 + v4) = v11;
  return a1;
}

unsigned __int8 *sub_100077BEC(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16;
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
      swift_release();
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
      uint64_t v18 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v18;
      a1[v7] = 1;
      swift_retain();
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      a1[v7] = 0;
    }
  }
  return a1;
}

_OWORD *sub_100077E08(_OWORD *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    uint64_t v4 = 16;
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

unsigned __int8 *sub_100077F40(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16;
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
      swift_release();
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

uint64_t sub_100078158(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 16;
  if (*(void *)(v3 + 64) > 0x10uLL) {
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

void sub_10007828C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x10) {
    unint64_t v5 = 16;
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
        JUMPOUT(0x100078454);
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

uint64_t sub_10007847C(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 16;
  if (*(void *)(v2 + 64) > 0x10uLL) {
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

void sub_100078534(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    size_t v4 = 16;
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

uint64_t type metadata accessor for Parsed()
{
  return sub_10003A4F0();
}

uint64_t sub_100078624@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v38 = a4;
  uint64_t v37 = a3;
  uint64_t v36 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = type metadata accessor for Parsed();
  __chkstk_darwin(v6);
  unsigned int v8 = (char *)&v29 - v7;
  uint64_t v9 = type metadata accessor for Optional();
  uint64_t v35 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  int v12 = (char *)&v29 - v11;
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v29 - v14;
  uint64_t v51 = a1;
  sub_1000356C0(a1, (uint64_t)v47);
  sub_100003DD0(&qword_1000C5460);
  if (swift_dynamicCast())
  {
    v32 = v12;
    v33 = v15;
    uint64_t v30 = v9;
    uint64_t v31 = v6;
    uint64_t v34 = v13;
    uint64_t v16 = v51;
    v49[1] = v43;
    v49[2] = v44;
    v49[3] = v45;
    char v50 = v46;
    v48[0] = v39;
    v48[1] = v40;
    v48[2] = v41;
    v49[0] = v42;
    sub_100063E3C((uint64_t)v49, (uint64_t)&v39, &qword_1000C5888);
    v29 = v49;
    if (*((void *)&v39 + 1))
    {
      sub_100063E3C((uint64_t)&v40 + 8, (uint64_t)v47, &qword_1000C5360);
      sub_1000418BC((uint64_t)&v39);
    }
    else
    {
      sub_1000556DC((uint64_t)&v39, &qword_1000C5888);
      memset(v47, 0, 32);
    }
    char v19 = v8;
    Swift::UInt v20 = v33;
    uint64_t v21 = v34;
    unint64_t v22 = v32;
    sub_100003DD0(&qword_1000C5360);
    char v23 = swift_dynamicCast();
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
    if (v23)
    {
      v24(v22, 0, 1, AssociatedTypeWitness);
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v20, v22, AssociatedTypeWitness);
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v19, v20, AssociatedTypeWitness);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, uint64_t))(v37 + 40))(v19, v36);
      sub_100005128(v16);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v20, AssociatedTypeWitness);
    }
    else
    {
      v24(v22, 1, 1, AssociatedTypeWitness);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v22, v30);
      sub_100063E3C((uint64_t)v29, (uint64_t)&v39, &qword_1000C5888);
      uint64_t v25 = *((void *)&v39 + 1);
      if (*((void *)&v39 + 1))
      {
        uint64_t v26 = v39;
        uint64_t v27 = v40;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1000418BC((uint64_t)&v39);
        sub_100063E04((uint64_t)v48, (uint64_t)&v39);
      }
      else
      {
        sub_1000556DC((uint64_t)&v39, &qword_1000C5888);
        sub_100063E04((uint64_t)v48, (uint64_t)&v39);
        uint64_t v26 = *((void *)&v40 + 1);
        uint64_t v27 = *((void *)&v41 + 1);
        uint64_t v25 = v41;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_100049788((uint64_t)&v39);
      sub_10002FDE0();
      swift_allocError();
      *(void *)uint64_t v28 = v26;
      *(void *)(v28 + 8) = v25;
      *(void *)(v28 + 16) = v27;
      *(_OWORD *)(v28 + 24) = 0u;
      *(_OWORD *)(v28 + 40) = 0u;
      *(_OWORD *)(v28 + 56) = 0u;
      *(void *)(v28 + 72) = 0;
      *(unsigned char *)(v28 + 80) = 11;
      swift_willThrow();
      sub_100005128(v16);
    }
    return sub_100049788((uint64_t)v48);
  }
  else
  {
    char v46 = 0;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
    sub_1000556DC((uint64_t)&v39, &qword_1000C5468);
    sub_10002FDE0();
    swift_allocError();
    *(void *)uint64_t v17 = 3;
    *(_OWORD *)(v17 + 8) = 0u;
    *(_OWORD *)(v17 + 24) = 0u;
    *(_OWORD *)(v17 + 40) = 0u;
    *(_OWORD *)(v17 + 56) = 0u;
    *(void *)(v17 + 72) = 0;
    *(unsigned char *)(v17 + 80) = 15;
    swift_willThrow();
    return sub_100005128(v51);
  }
}

uint64_t sub_100078B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return sub_100078BC0(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_100078BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_getAssociatedTypeWitness();
  uint64_t v10 = type metadata accessor for Parsed();
  __chkstk_darwin(v10);
  int v12 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))((char *)&v15 - v11);
  (*(void (**)(uint64_t, uint64_t))(a5 + 32))(a4, a5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = (*v12)(a1, a2, a3);
    swift_release();
    return v13;
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t sub_100078D30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  type metadata accessor for Parsed();

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100078D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return sub_100078BC0(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_100078DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return sub_100078BC0(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_100078E74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v27 = a4;
  uint64_t v41 = a3;
  uint64_t v28 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v22 = *(void *)(v7 - 8);
  uint64_t v23 = v7;
  __chkstk_darwin(v7);
  uint64_t v24 = (char *)&v22 - v8;
  uint64_t v26 = type metadata accessor for Parsed();
  uint64_t v9 = __chkstk_darwin(v26);
  uint64_t v25 = (char *)&v22 - v10;
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v22 - v15;
  sub_1000356C0(a1, (uint64_t)v38);
  dispatch thunk of Decodable.init(from:)();
  if (!v4)
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v14, AssociatedTypeWitness);
LABEL_10:
    Swift::UInt v20 = v25;
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v25, v16, AssociatedTypeWitness);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, uint64_t))(v41 + 40))(v20, v28);
    sub_100005128(a1);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, AssociatedTypeWitness);
  }
  sub_1000356C0(a1, (uint64_t)v37);
  sub_100003DD0(&qword_1000C5460);
  if (swift_dynamicCast())
  {
    v39[1] = v33;
    v39[2] = v34;
    v39[3] = v35;
    char v40 = v36;
    v38[0] = v29;
    v38[1] = v30;
    v38[2] = v31;
    v39[0] = v32;
    sub_100063E3C((uint64_t)v39, (uint64_t)&v29, &qword_1000C5888);
    sub_100049788((uint64_t)v38);
    if (*((void *)&v29 + 1))
    {
      sub_100063E3C((uint64_t)&v30 + 8, (uint64_t)v37, &qword_1000C5360);
      sub_1000418BC((uint64_t)&v29);
    }
    else
    {
      sub_1000556DC((uint64_t)&v29, &qword_1000C5888);
      memset(v37, 0, 32);
    }
    sub_100003DD0(&qword_1000C5360);
    uint64_t v17 = v24;
    char v18 = swift_dynamicCast();
    char v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    if (v18)
    {
      v19(v17, 0, 1, AssociatedTypeWitness);
      swift_errorRelease();
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v17, AssociatedTypeWitness);
      goto LABEL_10;
    }
    v19(v17, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v23);
  }
  else
  {
    char v36 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v29 = 0u;
    sub_1000556DC((uint64_t)&v29, &qword_1000C5468);
  }
  swift_willThrow();
  return sub_100005128(a1);
}

uint64_t sub_1000792DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return sub_100078BC0(a1, a2, a3, a4, WitnessTable);
}

uint64_t destroy for ParsedValues()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ParsedValues(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ParsedValues(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ParsedArgument(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ParsedValues(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ParsedValues(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ParsedValues(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ParsedValues()
{
  return &type metadata for ParsedValues;
}

uint64_t destroy for ParsedValues.Element(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 48)) {
    sub_100005128(a1 + 24);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ParsedValues.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  unsigned int v5 = (_OWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v6)
  {
    *(void *)(a1 + 48) = v6;
    (**(void (***)(uint64_t, _OWORD *, uint64_t))(v6 - 8))(a1 + 24, v5, v6);
  }
  else
  {
    long long v7 = v5[1];
    *(_OWORD *)(a1 + 24) = *v5;
    *(_OWORD *)(a1 + 40) = v7;
  }
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ParsedValues.Element(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 48))
  {
    if (v4)
    {
      *(void *)(a1 + 48) = v4;
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 24, a2 + 24);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v5;
    goto LABEL_8;
  }
  if (!v4)
  {
    sub_100005128(a1 + 24);
    goto LABEL_7;
  }
  sub_10005A5D8((uint64_t *)(a1 + 24), (uint64_t *)(a2 + 24));
LABEL_8:
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

__n128 initializeWithTake for ParsedValues.Element(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ParsedValues.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 48)) {
    sub_100005128(a1 + 24);
  }
  long long v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = v5;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParsedValues.Element(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ParsedValues.Element(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ParsedValues.Element()
{
  return &type metadata for ParsedValues.Element;
}

uint64_t sub_100079914(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t *))
{
  long long v12 = v6[1];
  long long v27 = *v6;
  long long v28 = v12;
  uint64_t v29 = *((void *)v6 + 4);
  sub_100079B10(a1, a2, a3, (uint64_t)&v18);
  if (*((void *)&v18 + 1))
  {
    v24[1] = v20;
    long long v25 = v21;
    char v26 = v22;
    long long v23 = v18;
    v24[0] = v19;
  }
  else
  {
    uint64_t v13 = type metadata accessor for Array();
    *(void *)&long long v23 = a1;
    *((void *)&v23 + 1) = a2;
    *(void *)&v24[0] = a3;
    *((void *)&v24[0] + 1) = a5;
    *(void *)&long long v25 = v13;
    *((void *)&v25 + 1) = &_swiftEmptySetSingleton;
    char v26 = 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1000556DC((uint64_t)&v18, &qword_1000C5888);
  }
  sub_100041854((uint64_t)v24 + 8, (uint64_t)&v18);
  if (!*((void *)&v19 + 1))
  {
    sub_1000556DC((uint64_t)&v18, &qword_1000C5360);
    goto LABEL_8;
  }
  type metadata accessor for Array();
  if (!swift_dynamicCast())
  {
LABEL_8:
    uint64_t v17 = a5;
    swift_bridgeObjectRetain();
  }
  if (v26 == 1)
  {
    type metadata accessor for Array();
    Array.removeAll(keepingCapacity:)(0);
    char v26 = 0;
  }
  a6(&v17);
  uint64_t v14 = v17;
  *((void *)&v19 + 1) = type metadata accessor for Array();
  *(void *)&long long v18 = v14;
  sub_100070170((uint64_t)&v18, (uint64_t)v24 + 8);
  uint64_t v15 = swift_bridgeObjectRetain();
  sub_10005F4C8(v15);
  sub_10007A218((uint64_t *)&v23);
  return sub_1000418BC((uint64_t)&v23);
}

uint64_t sub_100079B10@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *v4;
  if (*(void *)(v6 + 16))
  {
    uint64_t v9 = result;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_100060C94(v9, a2, a3);
    if (v11)
    {
      sub_100063EA0(*(void *)(v6 + 56) + 72 * v10, a4);
    }
    else
    {
      *(unsigned char *)(a4 + 64) = 0;
      *(_OWORD *)(a4 + 32) = 0u;
      *(_OWORD *)(a4 + 48) = 0u;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    *(unsigned char *)(a4 + 64) = 0;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  return result;
}

uint64_t sub_100079BE4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (*(void *)(a1 + 8))
  {
    long long v8 = *(_OWORD *)(a1 + 48);
    v13[2] = *(_OWORD *)(a1 + 32);
    v13[3] = v8;
    char v14 = *(unsigned char *)(a1 + 64);
    long long v9 = *(_OWORD *)(a1 + 16);
    v13[0] = *(_OWORD *)a1;
    v13[1] = v9;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_10007BC98((uint64_t)v13, a2, a3, a4, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v12;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000556DC(a1, &qword_1000C5888);
    sub_10007B8CC(a2, a3, a4, (uint64_t)v13);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_1000556DC((uint64_t)v13, &qword_1000C5888);
  }
}

uint64_t sub_100079CE8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(char *), uint64_t a7, uint64_t a8)
{
  uint64_t v51 = a7;
  v52 = a6;
  uint64_t v53 = a4;
  uint64_t v49 = type metadata accessor for Optional();
  uint64_t v48 = *(void *)(v49 - 8);
  uint64_t v14 = __chkstk_darwin(v49);
  uint64_t v16 = (char *)&v43 - v15;
  uint64_t v17 = *(void *)(a8 - 8);
  uint64_t v18 = __chkstk_darwin(v14);
  long long v20 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v18);
  v55 = (char *)&v43 - v22;
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v43 - v23;
  long long v25 = v8[1];
  long long v64 = *v8;
  long long v65 = v25;
  v54 = v8;
  uint64_t v66 = *((void *)v8 + 4);
  uint64_t v47 = a1;
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  sub_100079B10(v26, v28, a3, (uint64_t)v58);
  uint64_t v30 = a5;
  long long v31 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v31(v24, a5, a8);
  if (*((void *)&v58[0] + 1))
  {
    char v50 = *(void (**)(char *, uint64_t))(v17 + 8);
    v50(v24, a8);
    v61[1] = v58[2];
    long long v62 = v58[3];
    char v63 = v59;
    long long v60 = v58[0];
    v61[0] = v58[1];
  }
  else
  {
    uint64_t v57 = a8;
    long long v32 = sub_10000A954(v56);
    v31((char *)v32, (uint64_t)v24, a8);
    uint64_t v46 = a5;
    long long v45 = v20;
    long long v33 = *(void (**)(char *, uint64_t))(v17 + 8);
    long long v44 = v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v50 = v33;
    v33(v24, a8);
    long long v20 = v45;
    uint64_t v30 = v46;
    *(void *)&long long v60 = v47;
    *((void *)&v60 + 1) = v27;
    long long v31 = v44;
    *(void *)&v61[0] = v29;
    sub_100055858((uint64_t)v56, (uint64_t)v61 + 8);
    *((void *)&v62 + 1) = &_swiftEmptySetSingleton;
    char v63 = 1;
    sub_1000556DC((uint64_t)v58, &qword_1000C5888);
  }
  sub_100041854((uint64_t)v61 + 8, (uint64_t)v56);
  sub_100003DD0(&qword_1000C5360);
  int v34 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v16, v34 ^ 1u, 1, a8);
  v31(v20, v30, a8);
  int v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, a8);
  char v36 = v55;
  if (v35 == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v55, v20, a8);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v16, v49);
    uint64_t v37 = v50;
  }
  else
  {
    uint64_t v38 = v50;
    v50(v20, a8);
    long long v39 = v16;
    uint64_t v37 = v38;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v36, v39, a8);
  }
  v52(v36);
  uint64_t v57 = a8;
  char v40 = sub_10000A954(v56);
  v31((char *)v40, (uint64_t)v36, a8);
  sub_100070170((uint64_t)v56, (uint64_t)v61 + 8);
  uint64_t v41 = swift_bridgeObjectRetain();
  sub_10005F4C8(v41);
  sub_10007A218((uint64_t *)&v60);
  v37(v36, a8);
  return sub_1000418BC((uint64_t)&v60);
}

uint64_t sub_10007A218(uint64_t *a1)
{
  uint64_t v3 = *v1;
  if (*(void *)(v3 + 16))
  {
    uint64_t v5 = *a1;
    uint64_t v4 = a1[1];
    uint64_t v6 = (void *)a1[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_100060C94(v5, v4, v6);
    if (v8)
    {
      sub_100063EA0(*(void *)(v3 + 56) + 72 * v7, (uint64_t)&v17);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((void *)&v17 + 1))
      {
        v22[2] = v19;
        v22[3] = v20;
        char v23 = v21;
        v22[0] = v17;
        v22[1] = v18;
        sub_100063EA0((uint64_t)a1, (uint64_t)&v17);
        uint64_t v9 = swift_bridgeObjectRetain();
        sub_10005F4C8(v9);
        long long v10 = v17;
        char v11 = (void *)v18;
        sub_100063EA0((uint64_t)&v17, (uint64_t)v16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_100079BE4((uint64_t)v16, v10, *((uint64_t *)&v10 + 1), v11);
        sub_1000418BC((uint64_t)&v17);
        return sub_1000418BC((uint64_t)v22);
      }
    }
    else
    {
      char v21 = 0;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
  }
  sub_1000556DC((uint64_t)&v17, &qword_1000C5888);
  uint64_t v13 = *a1;
  uint64_t v14 = a1[1];
  uint64_t v15 = (void *)a1[2];
  sub_100063EA0((uint64_t)a1, (uint64_t)v22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_100079BE4((uint64_t)v22, v13, v14, v15);
}

void *sub_10007A3CC()
{
  unint64_t v1 = v0;
  sub_100003DD0(qword_1000C5608);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    __n128 result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  __n128 result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    __n128 result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    if (!v25) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 24 * v15;
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = *(void *)(v4 + 48) + v16;
    unsigned __int8 v23 = *(unsigned char *)(v17 + 16);
    *(void *)uint64_t v22 = *(void *)v17;
    *(void *)(v22 + 8) = v19;
    *(unsigned char *)(v22 + 16) = v23;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    __n128 result = (void *)sub_1000319B8(v18, v19, v23);
  }
  int64_t v26 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_10007A570()
{
  unint64_t v1 = v0;
  sub_100003DD0(&qword_1000C5D28);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    __n128 result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  __n128 result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    __n128 result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 24 * v15;
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = 72 * v15;
    long long v28 = *(_OWORD *)(v17 + 8);
    sub_100063EA0(*(void *)(v2 + 56) + 72 * v15, (uint64_t)v29);
    uint64_t v20 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v20 = v18;
    *(_OWORD *)(v20 + 8) = v28;
    uint64_t v21 = *(void *)(v4 + 56) + v19;
    *(_OWORD *)uint64_t v21 = v29[0];
    long long v22 = v29[1];
    long long v23 = v29[2];
    long long v24 = v29[3];
    *(unsigned char *)(v21 + 64) = v30;
    *(_OWORD *)(v21 + 32) = v23;
    *(_OWORD *)(v21 + 48) = v24;
    *(_OWORD *)(v21 + 16) = v22;
    swift_bridgeObjectRetain();
    __n128 result = (void *)swift_bridgeObjectRetain();
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

void *sub_10007A784()
{
  unint64_t v1 = v0;
  sub_100003DD0(&qword_1000C5D38);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    __n128 result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  __n128 result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    __n128 result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
      goto LABEL_28;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    __n128 result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10007A93C()
{
  unint64_t v1 = v0;
  sub_100003DD0(&qword_1000C5D30);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    __n128 result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  __n128 result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    __n128 result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    swift_retain();
    __n128 result = (void *)swift_retain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10007AAE8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100003DD0(qword_1000C5608);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_44;
  }
  int v35 = v2;
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v37 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  char v36 = a2;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_20;
    }
    if (__OFADD__(v13++, 1)) {
      goto LABEL_46;
    }
    if (v13 >= v37) {
      break;
    }
    unint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v38 + 8 * v13);
    if (!v20)
    {
      int64_t v21 = v13 + 1;
      if (v13 + 1 >= v37)
      {
LABEL_37:
        swift_release();
        uint64_t v3 = v35;
        if ((a2 & 1) == 0) {
          goto LABEL_44;
        }
        goto LABEL_40;
      }
      unint64_t v20 = *(void *)(v38 + 8 * v21);
      if (!v20)
      {
        while (1)
        {
          int64_t v13 = v21 + 1;
          if (__OFADD__(v21, 1)) {
            break;
          }
          if (v13 >= v37) {
            goto LABEL_37;
          }
          unint64_t v20 = *(void *)(v38 + 8 * v13);
          ++v21;
          if (v20) {
            goto LABEL_19;
          }
        }
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
        return result;
      }
      ++v13;
    }
LABEL_19:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_20:
    uint64_t v22 = *(void *)(v5 + 48) + 24 * v17;
    uint64_t v24 = *(void *)v22;
    uint64_t v23 = *(void *)(v22 + 8);
    unsigned int v25 = *(unsigned __int8 *)(v22 + 16);
    uint64_t v39 = *(void *)(*(void *)(v5 + 56) + 8 * v17);
    if ((a2 & 1) == 0) {
      sub_1000319B8(v24, v23, v25);
    }
    Hasher.init(_seed:)();
    if (v25 >> 6)
    {
      if (v25 >> 6 == 1)
      {
        Hasher._combine(_:)(1uLL);
        Character.hash(into:)();
        a2 = v36;
        Hasher._combine(_:)(v25 & 1);
        goto LABEL_28;
      }
      Swift::UInt v26 = 2;
    }
    else
    {
      Swift::UInt v26 = 0;
    }
    Hasher._combine(_:)(v26);
    String.hash(into:)();
LABEL_28:
    uint64_t result = Hasher._finalize()();
    uint64_t v27 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }
        BOOL v32 = v29 == v31;
        if (v29 == v31) {
          unint64_t v29 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v11 + 8 * v29);
      }
      while (v33 == -1);
      unint64_t v14 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v15 = *(void *)(v7 + 48) + 24 * v14;
    *(void *)uint64_t v15 = v24;
    *(void *)(v15 + 8) = v23;
    *(unsigned char *)(v15 + 16) = v25;
    *(void *)(*(void *)(v7 + 56) + 8 * v14) = v39;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v19 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_40:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v19, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v19 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_44:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10007AE58(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100003DD0(&qword_1000C5D28);
  char v48 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_45;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v47 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  long long v45 = v2;
  int64_t v46 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  for (int64_t i = 0; ; int64_t i = v49)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (i << 6);
      goto LABEL_22;
    }
    int64_t v23 = i + 1;
    if (__OFADD__(i, 1))
    {
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
      return result;
    }
    if (v23 >= v46) {
      break;
    }
    uint64_t v24 = v47;
    unint64_t v25 = v47[v23];
    ++i;
    if (!v25)
    {
      int64_t i = v23 + 1;
      if (v23 + 1 >= v46) {
        goto LABEL_38;
      }
      unint64_t v25 = v47[i];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v46)
        {
LABEL_38:
          swift_release();
          uint64_t v3 = v45;
          if ((v48 & 1) == 0) {
            goto LABEL_45;
          }
          goto LABEL_41;
        }
        unint64_t v25 = v47[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t i = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_47;
            }
            if (i >= v46) {
              goto LABEL_38;
            }
            unint64_t v25 = v47[i];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t i = v26;
      }
    }
LABEL_21:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (i << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v5 + 48) + 24 * v22;
    uint64_t v28 = *(void *)v27;
    uint64_t v29 = *(void *)(v5 + 56) + 72 * v22;
    uint64_t v30 = *(void *)(v27 + 16);
    int64_t v49 = i;
    long long v50 = *(_OWORD *)(v27 + 8);
    if (v48)
    {
      long long v51 = *(_OWORD *)v29;
      long long v31 = *(_OWORD *)(v29 + 16);
      long long v32 = *(_OWORD *)(v29 + 32);
      long long v33 = *(_OWORD *)(v29 + 48);
      char v55 = *(unsigned char *)(v29 + 64);
      long long v53 = v32;
      long long v54 = v33;
      long long v52 = v31;
    }
    else
    {
      sub_100063EA0(v29, (uint64_t)&v51);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    Hasher._combine(_:)(*(void *)(v30 + 16));
    uint64_t v34 = *(void *)(v30 + 16);
    if (v34)
    {
      uint64_t v35 = v5;
      swift_bridgeObjectRetain();
      uint64_t v36 = v30 + 40;
      do
      {
        swift_bridgeObjectRetain();
        String.hash(into:)();
        swift_bridgeObjectRelease();
        v36 += 16;
        --v34;
      }
      while (v34);
      swift_bridgeObjectRelease();
      uint64_t v5 = v35;
    }
    uint64_t result = Hasher._finalize()();
    uint64_t v37 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v38 = result & ~v37;
    unint64_t v39 = v38 >> 6;
    if (((-1 << v38) & ~*(void *)(v11 + 8 * (v38 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v38) & ~*(void *)(v11 + 8 * (v38 >> 6)))) | v38 & 0x7FFFFFFFFFFFFFC0;
      long long v15 = v50;
    }
    else
    {
      char v40 = 0;
      unint64_t v41 = (unint64_t)(63 - v37) >> 6;
      long long v15 = v50;
      do
      {
        if (++v39 == v41 && (v40 & 1) != 0)
        {
          __break(1u);
          goto LABEL_46;
        }
        BOOL v42 = v39 == v41;
        if (v39 == v41) {
          unint64_t v39 = 0;
        }
        v40 |= v42;
        uint64_t v43 = *(void *)(v11 + 8 * v39);
      }
      while (v43 == -1);
      unint64_t v14 = __clz(__rbit64(~v43)) + (v39 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v16 = *(void *)(v7 + 48) + 24 * v14;
    *(void *)uint64_t v16 = v28;
    *(_OWORD *)(v16 + 8) = v15;
    uint64_t v17 = *(void *)(v7 + 56) + 72 * v14;
    *(_OWORD *)uint64_t v17 = v51;
    long long v18 = v52;
    long long v19 = v53;
    long long v20 = v54;
    *(unsigned char *)(v17 + 64) = v55;
    *(_OWORD *)(v17 + 32) = v19;
    *(_OWORD *)(v17 + 48) = v20;
    *(_OWORD *)(v17 + 16) = v18;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v45;
  uint64_t v24 = v47;
  if ((v48 & 1) == 0) {
    goto LABEL_45;
  }
LABEL_41:
  uint64_t v44 = 1 << *(unsigned char *)(v5 + 32);
  if (v44 >= 64) {
    bzero(v24, ((unint64_t)(v44 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v44;
  }
  *(void *)(v5 + 16) = 0;
LABEL_45:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10007B264(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100003DD0(&qword_1000C5D38);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
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
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    long long v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *long long v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10007B57C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100003DD0(&qword_1000C5D30);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v32 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v31 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v31) {
          goto LABEL_33;
        }
        unint64_t v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v21 = v32[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v32 = -1 << v30;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v31) {
                  goto LABEL_33;
                }
                unint64_t v21 = v32[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = 8 * v19;
      Swift::UInt v28 = *(void *)(*(void *)(v5 + 48) + v27);
      uint64_t v29 = *(void *)(*(void *)(v5 + 56) + v27);
      if ((a2 & 1) == 0)
      {
        swift_retain();
        swift_retain();
      }
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v28);
      uint64_t result = Hasher._finalize()();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = 8 * v16;
      *(void *)(*(void *)(v7 + 48) + v17) = v28;
      *(void *)(*(void *)(v7 + 56) + v17) = v29;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_10007B860(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 24 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  v6[2] = a4;
  uint64_t v7 = a6[7] + 72 * result;
  *(unsigned char *)(v7 + 64) = *(unsigned char *)(a5 + 64);
  long long v8 = *(_OWORD *)(a5 + 48);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)(a5 + 32);
  *(_OWORD *)(v7 + 48) = v8;
  long long v9 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)a5;
  *(_OWORD *)(v7 + 16) = v9;
  uint64_t v10 = a6[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a6[2] = v12;
  }
  return result;
}

double sub_10007B8CC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_100060C94(a1, a2, a3);
  LOBYTE(a3) = v11;
  swift_bridgeObjectRelease();
  if (a3)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v5;
    uint64_t v18 = *v5;
    *uint64_t v5 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10007A570();
      uint64_t v13 = v18;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v13 + 56) + 72 * v10;
    long long v15 = *(_OWORD *)(v14 + 48);
    *(_OWORD *)(a4 + 32) = *(_OWORD *)(v14 + 32);
    *(_OWORD *)(a4 + 48) = v15;
    *(unsigned char *)(a4 + 64) = *(unsigned char *)(v14 + 64);
    long long v16 = *(_OWORD *)(v14 + 16);
    *(_OWORD *)a4 = *(_OWORD *)v14;
    *(_OWORD *)(a4 + 16) = v16;
    sub_10007BA00(v10, v13);
    *uint64_t v5 = v13;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(unsigned char *)(a4 + 64) = 0;
    double result = 0.0;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  return result;
}

unint64_t sub_10007BA00(unint64_t result, uint64_t a2)
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
      unint64_t v28 = v8;
      do
      {
        uint64_t v9 = *(void *)(*(void *)(a2 + 48) + 24 * v6 + 16);
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Hasher._combine(_:)(*(void *)(v9 + 16));
        uint64_t v10 = *(void *)(v9 + 16);
        if (v10)
        {
          uint64_t v11 = v4;
          swift_bridgeObjectRetain();
          uint64_t v12 = v9 + 40;
          do
          {
            swift_bridgeObjectRetain();
            String.hash(into:)();
            swift_bridgeObjectRelease();
            v12 += 16;
            --v10;
          }
          while (v10);
          swift_bridgeObjectRelease();
          uint64_t v4 = v11;
          unint64_t v8 = v28;
        }
        Swift::Int v13 = Hasher._finalize()();
        swift_bridgeObjectRelease();
        double result = swift_bridgeObjectRelease();
        unint64_t v14 = v13 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v14 < v8) {
            goto LABEL_5;
          }
        }
        else if (v14 >= v8)
        {
          goto LABEL_15;
        }
        if (v3 >= (uint64_t)v14)
        {
LABEL_15:
          uint64_t v15 = *(void *)(a2 + 48);
          unint64_t v16 = v15 + 24 * v3;
          uint64_t v17 = (long long *)(v15 + 24 * v6);
          if (v3 != v6 || v16 >= (unint64_t)v17 + 24)
          {
            long long v18 = *v17;
            *(void *)(v16 + 16) = *((void *)v17 + 2);
            *(_OWORD *)unint64_t v16 = v18;
          }
          uint64_t v19 = *(void *)(a2 + 56);
          double result = v19 + 72 * v3;
          int64_t v20 = (const void *)(v19 + 72 * v6);
          if (72 * v3 < (uint64_t)(72 * v6) || result >= (unint64_t)v20 + 72 || (v21 = v3 == v6, int64_t v3 = v6, !v21))
          {
            double result = (unint64_t)memmove((void *)result, v20, 0x48uLL);
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *int64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10007BC98(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  unint64_t v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_100060C94(a2, a3, a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a5 & 1) == 0)
  {
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_10007A570();
      goto LABEL_7;
    }
    sub_10007AE58(v17, a5 & 1);
    unint64_t v23 = sub_100060C94(a2, a3, a4);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      int64_t v20 = *v6;
      if (v18) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v20 = *v6;
  if (v18)
  {
LABEL_8:
    uint64_t v21 = v20[7] + 72 * v14;
    return sub_10007BE08(a1, v21);
  }
LABEL_13:
  sub_10007B860(v14, a2, a3, (uint64_t)a4, a1, v20);
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_10007BE08(uint64_t a1, uint64_t a2)
{
  return a2;
}

void destroy for ParserError(uint64_t a1)
{
}

uint64_t initializeWithCopy for ParserError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  char v14 = *(unsigned char *)(a2 + 80);
  sub_100070308(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(unsigned char *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for ParserError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v24 = *(void *)(a2 + 72);
  char v25 = *(unsigned char *)(a2 + 80);
  sub_100070308(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  char v22 = *(unsigned char *)(a1 + 80);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v24;
  *(unsigned char *)(a1 + 80) = v25;
  sub_100070508(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

__n128 initializeWithTake for ParserError(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for ParserError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 80);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  char v14 = *(unsigned char *)(a1 + 80);
  long long v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  long long v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = v3;
  sub_100070508(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParserError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF1 && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 241);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 0xF) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ParserError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 - 241;
    if (a3 >= 0xF1) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF1) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10007C190(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 80) <= 0xEu) {
    return *(unsigned __int8 *)(a1 + 80);
  }
  else {
    return (*(_DWORD *)a1 + 15);
  }
}

uint64_t sub_10007C1A8(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xF)
  {
    *(void *)__n128 result = a2 - 15;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)(result + 72) = 0;
    LOBYTE(a2) = 15;
  }
  *(unsigned char *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ParserError()
{
  return &type metadata for ParserError;
}

uint64_t destroy for InternalParseError(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)(result + 56);
  if (v1 >= 4) {
    unsigned int v1 = *(_DWORD *)result + 4;
  }
  if (!v1)
  {
    if (*(void *)(result + 24)) {
      sub_100005128(result);
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for InternalParseError(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 56);
  if (v4 >= 4) {
    unsigned int v4 = *(_DWORD *)a2 + 4;
  }
  switch(v4)
  {
    case 0u:
      uint64_t v5 = *(void *)(a2 + 24);
      if (v5)
      {
        *(void *)(a1 + 24) = v5;
        (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
      }
      else
      {
        long long v7 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v7;
      }
      uint64_t v8 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v8;
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(unsigned char *)(a1 + 56) = 0;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 1u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(unsigned char *)(a1 + 56) = 1;
      break;
    case 2u:
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 56) = 2;
      break;
    case 3u:
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 56) = 3;
      break;
    default:
      long long v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
      break;
  }
  return a1;
}

uint64_t assignWithCopy for InternalParseError(uint64_t a1, long long *a2)
{
  if ((long long *)a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 56);
    if (v4 >= 4) {
      unsigned int v4 = *(_DWORD *)a1 + 4;
    }
    if (!v4)
    {
      if (*(void *)(a1 + 24)) {
        sub_100005128(a1);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    unsigned int v5 = *((unsigned __int8 *)a2 + 56);
    if (v5 >= 4) {
      unsigned int v5 = *(_DWORD *)a2 + 4;
    }
    switch(v5)
    {
      case 0u:
        uint64_t v6 = *((void *)a2 + 3);
        if (v6)
        {
          *(void *)(a1 + 24) = v6;
          (**(void (***)(uint64_t, long long *))(v6 - 8))(a1, a2);
        }
        else
        {
          long long v10 = a2[1];
          *(_OWORD *)a1 = *a2;
          *(_OWORD *)(a1 + 16) = v10;
        }
        *(void *)(a1 + 32) = *((void *)a2 + 4);
        *(void *)(a1 + 40) = *((void *)a2 + 5);
        *(void *)(a1 + 48) = *((void *)a2 + 6);
        *(unsigned char *)(a1 + 56) = 0;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 1u:
        *(_OWORD *)a1 = *a2;
        *(unsigned char *)(a1 + 56) = 1;
        break;
      case 2u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 56) = 2;
        break;
      case 3u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 56) = 3;
        break;
      default:
        long long v7 = *a2;
        long long v8 = a2[1];
        long long v9 = a2[2];
        *(_OWORD *)(a1 + 41) = *(long long *)((char *)a2 + 41);
        *(_OWORD *)(a1 + 16) = v8;
        *(_OWORD *)(a1 + 32) = v9;
        *(_OWORD *)a1 = v7;
        break;
    }
  }
  return a1;
}

__n128 initializeWithTake for SplitArguments.Element(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for InternalParseError(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 56);
    if (v4 >= 4) {
      unsigned int v4 = *(_DWORD *)a1 + 4;
    }
    if (!v4)
    {
      if (*(void *)(a1 + 24)) {
        sub_100005128(a1);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 56);
    if (v5 >= 4) {
      unsigned int v5 = *(_DWORD *)a2 + 4;
    }
    switch(v5)
    {
      case 0u:
        long long v6 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v6;
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        *(unsigned char *)(a1 + 56) = 0;
        return a1;
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v8 = 1;
        goto LABEL_16;
      case 2u:
        *(void *)a1 = *(void *)a2;
        char v8 = 2;
        goto LABEL_16;
      case 3u:
        *(void *)a1 = *(void *)a2;
        char v8 = 3;
LABEL_16:
        *(unsigned char *)(a1 + 56) = v8;
        break;
      default:
        long long v7 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v7;
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
        break;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for InternalParseError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 57)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 56);
  if (v3 >= 5) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for InternalParseError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_OWORD *)(result + 41) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_DWORD *)__n128 result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 57) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 56) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10007C6DC(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 56);
  if (result >= 4) {
    return (*(_DWORD *)a1 + 4);
  }
  return result;
}

uint64_t sub_10007C6F8(uint64_t result, unsigned int a2)
{
  if (a2 > 3)
  {
    *(void *)(result + 48) = 0;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_DWORD *)uint64_t result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 56) = a2;
  return result;
}

ValueMetadata *type metadata accessor for InternalParseError()
{
  return &type metadata for InternalParseError;
}

uint64_t sub_10007C734@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *v4;
  uint64_t v7 = v4[1];
  uint64_t result = sub_10007FC4C(a1, a2, a3 & 0x1FF, *v4, v7);
  int64x2_t v9 = 0uLL;
  if (v10) {
    goto LABEL_16;
  }
  if (v7 < 0)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  int64_t v11 = result;
  int64_t v12 = *(void *)(v6 + 16);
  if (v12 < (unint64_t)v7 || v12 < result) {
    goto LABEL_20;
  }
  if (result >= v7)
  {
    if (result != v12)
    {
      uint64_t v14 = v6 + (result << 6) + 48;
      while (1)
      {
        if (v11 >= v12)
        {
          __break(1u);
          goto LABEL_19;
        }
        if (*(unsigned char *)(v14 + 40)) {
          break;
        }
        ++v11;
        v14 += 64;
        if (v12 == v11) {
          goto LABEL_16;
        }
      }
      if ((*(void *)v14 & 0x6000000000000000) != 0x2000000000000000) {
        goto LABEL_16;
      }
      uint64_t v15 = *(void *)(v14 - 16);
      uint64_t v16 = *(void *)(v14 - 8);
      uint64_t v17 = *(void *)(v14 + 24);
      int64x2_t v18 = vdupq_n_s64(1uLL);
      v18.i64[0] = *(void *)(v14 + 32);
      int64x2_t v19 = v18;
      sub_100063FAC(v15, v16, *(void *)v14);
      uint64_t result = sub_10007E3A0((uint64_t)v4, v11);
      int64x2_t v9 = v19;
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v17 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
LABEL_17:
    *(void *)a4 = v17;
    *(int64x2_t *)(a4 + 8) = v9;
    *(void *)(a4 + 24) = v15;
    *(void *)(a4 + 32) = v16;
    return result;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_10007C858@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, void *a4@<X8>)
{
  uint64_t v6 = *v4;
  uint64_t v7 = v4[1];
  uint64_t result = sub_10007FC4C(a1, a2, a3 & 0x1FF, *v4, v7);
  if (v9) {
    goto LABEL_16;
  }
  if (v7 < 0)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  int64_t v10 = result;
  int64_t v11 = *(void *)(v6 + 16);
  if (v11 < (unint64_t)v7 || v11 < result) {
    goto LABEL_24;
  }
  if (result < v7) {
    goto LABEL_25;
  }
  if (result == v11)
  {
LABEL_16:
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    goto LABEL_17;
  }
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v13 = v6 + (v10 << 6) + 48;
  while (1)
  {
    if (v10 >= v11)
    {
      __break(1u);
      goto LABEL_23;
    }
    uint64_t v14 = (*(void *)v13 >> 61) & 3;
    if (v14) {
      break;
    }
LABEL_10:
    ++v10;
    v13 += 64;
    if (v11 == v10)
    {
      uint64_t result = swift_bridgeObjectRelease();
      goto LABEL_16;
    }
  }
  if (v14 == 2)
  {
    uint64_t result = sub_10006FDE4(*(void *)(v13 - 16), *(void *)(v13 - 8), *(void *)v13);
    goto LABEL_10;
  }
  uint64_t result = swift_bridgeObjectRelease();
  int64_t v20 = *(void *)(v6 + 16);
  if (v20 < v7) {
    goto LABEL_26;
  }
  if (v10 >= v20)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  unint64_t v21 = *(void *)v13;
  if ((*(void *)v13 & 0x6000000000000000) != 0x2000000000000000) {
    goto LABEL_28;
  }
  uint64_t v18 = *(void *)(v13 - 16);
  uint64_t v19 = *(void *)(v13 - 8);
  uint64_t v17 = *(unsigned __int8 *)(v13 + 40);
  uint64_t v22 = v13 + 24;
  uint64_t v15 = *(void *)(v13 + 24);
  uint64_t v16 = *(void *)(v22 + 8);
  sub_100063FAC(v18, v19, v21);
  uint64_t result = sub_10007E3A0((uint64_t)v4, v10);
LABEL_17:
  *a4 = v15;
  a4[1] = v16;
  a4[2] = v17;
  a4[3] = v18;
  a4[4] = v19;
  return result;
}

uint64_t sub_10007C9C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *v4;
  uint64_t v7 = v4[1];
  uint64_t result = sub_10007FC4C(a1, a2, a3 & 0x1FF, *v4, v7);
  int64x2_t v9 = 0uLL;
  if (v10) {
    goto LABEL_13;
  }
  if (v7 < 0)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    return result;
  }
  int64_t v11 = *(void *)(v6 + 16);
  if (v11 < (unint64_t)v7 || v11 < result) {
    goto LABEL_20;
  }
  if (result < v7) {
    goto LABEL_21;
  }
  if (result != v11)
  {
    uint64_t v13 = (unsigned char *)(v6 + (result << 6) + 88);
    while (1)
    {
      if (result >= v11)
      {
        __break(1u);
        goto LABEL_19;
      }
      if (*v13) {
        break;
      }
      ++result;
      v13 += 64;
      if (v11 == result) {
        goto LABEL_13;
      }
    }
    unint64_t v14 = *((void *)v13 - 2);
    uint64_t v16 = *((void *)v13 - 1);
    uint64_t result = sub_10007E504(v14, v16, 1);
    if ((v14 & 0x8000000000000000) != 0) {
      goto LABEL_22;
    }
    uint64_t v17 = v4[2];
    if (v14 < *(void *)(v17 + 16))
    {
      uint64_t v15 = *(void *)(v17 + 16 * v14 + 32);
      uint64_t result = swift_bridgeObjectRetain();
      int64x2_t v9 = vdupq_n_s64(1uLL);
      v9.i64[0] = v16;
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_13:
  unint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t result = 0;
LABEL_14:
  *(void *)a4 = v14;
  *(int64x2_t *)(a4 + 8) = v9;
  *(void *)(a4 + 24) = v15;
  *(void *)(a4 + 32) = result;
  return result;
}

uint64_t sub_10007CAD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1[1];
  uint64_t v4 = *(void *)(*v1 + 16);
  if (v4 < v3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v3 < 0)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  long long v5 = 0uLL;
  if (v3 != v4)
  {
    uint64_t v6 = *v1 + (v3 << 6) + 48;
    while (v3 < v4)
    {
      if ((*(void *)v6 & 0x6000000000000000) == 0x2000000000000000)
      {
        uint64_t v8 = *(void *)(v6 - 16);
        uint64_t v9 = *(void *)(v6 - 8);
        long long v11 = *(_OWORD *)(v6 + 24);
        uint64_t v7 = *(unsigned __int8 *)(v6 + 40);
        sub_100063FAC(v8, v9, *(void *)v6);
        uint64_t result = sub_10007E6C4(v3);
        long long v5 = v11;
        goto LABEL_10;
      }
      ++v3;
      v6 += 64;
      if (v4 == v3) {
        goto LABEL_8;
      }
    }
    __break(1u);
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
LABEL_10:
  *(_OWORD *)a1 = v5;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  return result;
}

void *sub_10007CBB4(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result[2];
  if (v3 < a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (a2 < 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v6 = result;
  uint64_t v7 = v3 - a2;
  if (v3 == a2)
  {
    uint64_t v8 = (char *)_swiftEmptyArrayStorage;
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_10007F04C(v6 + 4, a2, (2 * v3) | 1, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_10007F258((uint64_t)v13, a3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v14;
  }
  if (v3 > (unint64_t)a2)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = &v6[8 * a2 + 11];
    uint64_t v8 = (char *)_swiftEmptyArrayStorage;
    do
    {
      if (*v9 == 1)
      {
        uint64_t v10 = *((void *)v9 - 2);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v8 = sub_100060538(0, *((void *)v8 + 2) + 1, 1, v8);
        }
        unint64_t v12 = *((void *)v8 + 2);
        unint64_t v11 = *((void *)v8 + 3);
        if (v12 >= v11 >> 1) {
          uint64_t v8 = sub_100060538((char *)(v11 > 1), v12 + 1, 1, v8);
        }
        *((void *)v8 + 2) = v12 + 1;
        *(void *)&v8[8 * v12 + 32] = v10;
      }
      v9 += 64;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10007CD60(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v6 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
LABEL_11:
    unint64_t v11 = String.count.getter();
    if (v11 < 2)
    {
      sub_100003DD0(&qword_1000C5700);
      unint64_t v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_1000A2660;
      *(void *)(v3 + 32) = a1;
      *(void *)(v3 + 40) = a2;
      *(void *)(v3 + 48) = 0x2000000000000000;
      *(void *)(v3 + 56) = 0;
      *(void *)(v3 + 64) = 0;
      *(void *)(v3 + 72) = a3;
      *(void *)(v3 + 80) = 0;
      *(unsigned char *)(v3 + 88) = 1;
      swift_bridgeObjectRetain();
      return v3;
    }
    if (v11 != 2) {
      goto LABEL_25;
    }
    sub_100003DD0(&qword_1000C5700);
    uint64_t v12 = swift_allocObject();
    unint64_t v3 = v12;
    *(_OWORD *)(v12 + 16) = xmmword_1000A2660;
    *(void *)(v12 + 32) = 0;
    *(void *)(v12 + 40) = 0;
    *(void *)(v12 + 48) = 0x4000000000000000;
    *(void *)(v12 + 56) = 0;
    *(void *)(v12 + 64) = 0;
    *(void *)(v12 + 72) = a3;
    goto LABEL_15;
  }
  unint64_t v7 = 0;
  unint64_t v8 = 4 * v6;
  unint64_t v3 = 15;
  while (1)
  {
    if (String.subscript.getter() == 45 && v10 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0) {
      break;
    }
LABEL_7:
    unint64_t v3 = String.index(after:)();
    unint64_t v7 = v3 >> 14;
    if (v3 >> 14 == v8) {
      goto LABEL_11;
    }
  }
  uint64_t v13 = String.distance(from:to:)();
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v14 = v13;
  uint64_t v15 = String.subscript.getter();
  if (v14 == 1)
  {
    unint64_t v17 = v15;
    unint64_t v18 = v16;
    swift_bridgeObjectRetain();
    sub_10007F5F4(v17, v18, v49);
    if (v46)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      return v3;
    }
    uint64_t v43 = v49[0];
    uint64_t v44 = v49[1];
    uint64_t v23 = v49[3];
    uint64_t v47 = v49[2];
    uint64_t v24 = v49[4];
    sub_10006FEB8((uint64_t)v49, (uint64_t)&v52);
    if (v53 < 0)
    {
      v53 &= ~0x8000000000000000;
    }
    else
    {
      sub_10006FF14(&v52, &v54);
      sub_10006FF14(&v54, &v55);
      if (v56 >> 6 > 1u)
      {
        v56 &= 0x3Fu;
        sub_1000319B8(v43, v44, v47);
        char v25 = sub_100069BC8();
        sub_10006FF70(v49);
        goto LABEL_33;
      }
      v56 &= 0x3Fu;
    }
    char v25 = _swiftEmptyArrayStorage;
LABEL_33:
    uint64_t v26 = v25[2];
    if (v26)
    {
      if (v26 != 1)
      {
        swift_bridgeObjectRelease();
        sub_100003DD0(&qword_1000C5700);
        unint64_t v3 = swift_allocObject();
        *(_OWORD *)(v3 + 16) = xmmword_1000A2660;
        *(void *)(v3 + 32) = v43;
        *(void *)(v3 + 40) = v44;
        *(void *)(v3 + 48) = v47;
        *(void *)(v3 + 56) = v23;
        *(void *)(v3 + 64) = v24;
        *(void *)(v3 + 72) = a3;
        *(void *)(v3 + 80) = 0;
        *(unsigned char *)(v3 + 88) = 1;
        uint64_t v31 = v25[2];
        if (v31)
        {
          uint64_t v32 = v25 + 9;
          do
          {
            uint64_t v33 = *(v32 - 4);
            uint64_t v45 = *(v32 - 5);
            uint64_t v34 = *(v32 - 3);
            uint64_t v35 = *(v32 - 2);
            uint64_t v36 = *(v32 - 1);
            uint64_t v37 = *v32;
            sub_100063FCC(v33, v34, v35);
            unint64_t v39 = *(void *)(v3 + 16);
            unint64_t v38 = *(void *)(v3 + 24);
            unint64_t v40 = v39 + 1;
            if (v39 >= v38 >> 1)
            {
              BOOL v42 = sub_100060434((char *)(v38 > 1), v39 + 1, 1, (char *)v3);
              unint64_t v40 = v39 + 1;
              unint64_t v3 = (unint64_t)v42;
            }
            v32 += 6;
            *(void *)(v3 + 16) = v40;
            unint64_t v41 = v3 + (v39 << 6);
            *(void *)(v41 + 32) = v33;
            *(void *)(v41 + 40) = v34;
            *(void *)(v41 + 48) = v35;
            *(void *)(v41 + 56) = v36;
            *(void *)(v41 + 64) = v37;
            *(void *)(v41 + 72) = a3;
            *(void *)(v41 + 80) = v45;
            *(unsigned char *)(v41 + 88) = 0;
            --v31;
          }
          while (v31);
        }
        goto LABEL_21;
      }
      sub_10006FF70(v49);
      swift_bridgeObjectRelease();
      sub_100003DD0(&qword_1000C5700);
      uint64_t v27 = swift_allocObject();
      *(_OWORD *)(v27 + 16) = xmmword_1000A2660;
      if ((v17 ^ v18) >> 14)
      {
        unint64_t v3 = v27;
        uint64_t v28 = Substring.subscript.getter();
        uint64_t v30 = v29;
        swift_bridgeObjectRelease();
        *(void *)(v3 + 32) = v28;
        *(void *)(v3 + 40) = v30;
        *(void *)(v3 + 48) = 64;
        *(void *)(v3 + 56) = 0;
        *(void *)(v3 + 64) = 0;
LABEL_24:
        *(void *)(v3 + 72) = a3;
        *(void *)(v3 + 80) = 0;
        *(unsigned char *)(v3 + 88) = 1;
        return v3;
      }
LABEL_46:
      uint64_t result = swift_bridgeObjectRelease();
      __break(1u);
      return result;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100003DD0(&qword_1000C5700);
    uint64_t v12 = swift_allocObject();
    unint64_t v3 = v12;
    *(_OWORD *)(v12 + 16) = xmmword_1000A2660;
    *(void *)(v12 + 32) = v43;
    *(void *)(v12 + 40) = v44;
    *(void *)(v12 + 48) = v47;
    *(void *)(v12 + 56) = v23;
    *(void *)(v12 + 64) = v24;
    *(void *)(v12 + 72) = a3;
LABEL_15:
    *(void *)(v12 + 80) = 0;
    *(unsigned char *)(v12 + 88) = 1;
    return v3;
  }
  if (!v14)
  {
    swift_bridgeObjectRelease();
    sub_100003DD0(&qword_1000C5700);
    unint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_1000A2660;
    *(void *)(v3 + 32) = a1;
    *(void *)(v3 + 40) = a2;
    *(void *)(v3 + 48) = 0x2000000000000000;
    *(void *)(v3 + 56) = 0;
    *(void *)(v3 + 64) = 0;
    *(void *)(v3 + 72) = a3;
    *(void *)(v3 + 80) = 0;
    *(unsigned char *)(v3 + 88) = 1;
    swift_bridgeObjectRetain();
    return v3;
  }
  swift_bridgeObjectRelease();
  if (v14 == 2)
  {
    sub_100003DD0(&qword_1000C5700);
    unint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_1000A2660;
    swift_bridgeObjectRetain();
    sub_10007D394(a1, a2, (uint64_t *)v50);
    uint64_t v19 = v51;
    long long v20 = v50[1];
    *(_OWORD *)(v3 + 32) = v50[0];
    *(_OWORD *)(v3 + 48) = v20;
    *(void *)(v3 + 64) = v19;
    goto LABEL_24;
  }
LABEL_25:
  sub_10002FDE0();
  swift_allocError();
  *(void *)uint64_t v21 = a1;
  *(void *)(v21 + 8) = a2;
  *(_OWORD *)(v21 + 16) = 0u;
  *(_OWORD *)(v21 + 32) = 0u;
  *(_OWORD *)(v21 + 48) = 0u;
  *(_OWORD *)(v21 + 64) = 0u;
  *(unsigned char *)(v21 + 80) = 5;
  swift_bridgeObjectRetain();
  swift_willThrow();
  return v3;
}

unint64_t sub_10007D394@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v6 = sub_1000875A0(61, 0xE100000000000000, a1, a2);
  if (v7)
  {
    uint64_t v9 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0) {
      uint64_t v9 = a1;
    }
    uint64_t v10 = v9 << 16;
    if ((a2 & 0x1000000000000000) == 0 || (a1 & 0x800000000000000) != 0) {
      unint64_t v8 = v10 | 7;
    }
    else {
      unint64_t v8 = v10 | 0xB;
    }
  }
  else
  {
    unint64_t v8 = v6;
  }
  unint64_t v11 = String.subscript.getter();
  unint64_t v13 = v12;
  sub_1000149F8(v8, a1, a2);
  unint64_t v15 = v14;
  unint64_t result = Substring.index(_:offsetBy:limitedBy:)();
  if (v17) {
    unint64_t result = v15;
  }
  if (v15 >> 14 < result >> 14)
  {
    __break(1u);
  }
  else
  {
    uint64_t v18 = Substring.subscript.getter();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_10007758C(v11, v13);
    uint64_t v23 = v22;
    unsigned __int8 v25 = v24;
    if ((v18 ^ v20) >> 14)
    {
      uint64_t v26 = static String._fromSubstring(_:)();
      uint64_t v27 = v29;
      swift_bridgeObjectRelease();
      unint64_t result = swift_bridgeObjectRelease();
      unint64_t v28 = v25 | 0x8000000000000000;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t result = swift_bridgeObjectRelease();
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      unint64_t v28 = v25;
    }
    *a3 = v21;
    a3[1] = v23;
    a3[2] = v28;
    a3[3] = v26;
    a3[4] = v27;
  }
  return result;
}

unint64_t sub_10007D560()
{
  sub_10006FEB8(v0, (uint64_t)&v14);
  unsigned __int8 v1 = v15;
  if (v15 < 0)
  {
    v15 &= ~0x8000000000000000;
    uint64_t v4 = v16;
    long long v5 = v17;
    v19.n128_u64[0] = sub_100076D6C(v14, v1);
    v19.n128_u64[1] = v6;
    v7._countAndFlagsBits = 61;
    v7._object = (void *)0xE100000000000000;
    String.append(_:)(v7);
    v8._countAndFlagsBits = v4;
    v8._object = v5;
    String.append(_:)(v8);
    return v19.n128_u64[0];
  }
  sub_10006FF14((__n128 *)&v14, &v18);
  sub_10006FF14(&v18, &v19);
  int v2 = v20 >> 6;
  if (!v2)
  {
    v20 &= 0x3Fu;
    unint64_t v11 = v19.n128_u64[1];
    unint64_t v10 = v19.n128_u64[0];
    uint64_t v12 = 11565;
LABEL_8:
    uint64_t v13 = v12;
    String.append(_:)(*(Swift::String *)&v10);
    return v13;
  }
  if (v2 != 1)
  {
    v20 &= 0x3Fu;
    unint64_t v11 = v19.n128_u64[1];
    unint64_t v10 = v19.n128_u64[0];
    uint64_t v12 = 45;
    goto LABEL_8;
  }
  v20 &= 0x3Fu;
  uint64_t v13 = 0;
  v3._countAndFlagsBits = 45;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  Character.write<A>(to:)();
  return v13;
}

uint64_t sub_10007D688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10007D718(a1, a2, a3, a4, (void (*)(uint64_t, unsigned char *))sub_10006FEB8, (uint64_t (*)(unsigned char *, unsigned char *))sub_10007E9DC);
}

unint64_t sub_10007D6B4()
{
  sub_10006FEB8(v0, (uint64_t)v2);
  return sub_10007D560();
}

uint64_t sub_10007D6EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10007D718(a1, a2, a3, a4, (void (*)(uint64_t, unsigned char *))sub_10004B100, (uint64_t (*)(unsigned char *, unsigned char *))sub_10007EC9C);
}

uint64_t sub_10007D718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, unsigned char *), uint64_t (*a6)(unsigned char *, unsigned char *))
{
  a5(a1, v10);
  a5(a2, v11);
  return a6(v10, v11) & 1;
}

uint64_t sub_10007D780(uint64_t a1, uint64_t a2)
{
  sub_10006FEB8(a1, (uint64_t)v12);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  int v6 = *(unsigned __int8 *)(a1 + 56);
  sub_10006FEB8(a2, (uint64_t)v13);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  int v9 = *(unsigned __int8 *)(a2 + 56);
  if ((sub_10007EC9C((uint64_t)v12, (uint64_t)v13) & 1) != 0 && v5 == v8)
  {
    if (v6)
    {
      if (v9) {
        return 1;
      }
    }
    else
    {
      if (v4 == v7) {
        int v11 = v9;
      }
      else {
        int v11 = 1;
      }
      if (v11 != 1) {
        return 1;
      }
    }
  }
  return 0;
}

Swift::Int sub_10007D81C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10007D864()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10007D890()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL sub_10007D8D4(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL sub_10007D8E8(void *a1, void *a2)
{
  return *a2 >= *a1;
}

BOOL sub_10007D8FC(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL sub_10007D910(void *a1, void *a2)
{
  return *a2 < *a1;
}

Swift::Int sub_10007D924()
{
  Swift::UInt v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  Hasher.init(_seed:)();
  Swift::UInt v3 = 0;
  if ((v2 & 1) == 0)
  {
    Hasher._combine(_:)(1uLL);
    Swift::UInt v3 = v1;
  }
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

void sub_10007D984()
{
  if (*(unsigned char *)(v0 + 8))
  {
    Swift::UInt v1 = 0;
  }
  else
  {
    Swift::UInt v1 = *(void *)v0;
    Hasher._combine(_:)(1uLL);
  }
  Hasher._combine(_:)(v1);
}

Swift::Int sub_10007D9CC()
{
  Swift::UInt v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  Hasher.init(_seed:)();
  if (v2) {
    Swift::UInt v1 = 0;
  }
  else {
    Hasher._combine(_:)(1uLL);
  }
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10007DA2C(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    if ((*(unsigned char *)(a2 + 8) & 1) == 0) {
      return 1;
    }
  }
  else
  {
    if (*(void *)a1 >= *(void *)a2) {
      char v2 = 1;
    }
    if ((v2 & 1) == 0) {
      return 1;
    }
  }
  return 0;
}

uint64_t sub_10007DA64(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a1 + 8);
  if (*(unsigned char *)(a2 + 8) == 1)
  {
    if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
      return 0;
    }
  }
  else
  {
    if (*(void *)a2 >= *(void *)a1) {
      char v2 = 1;
    }
    if ((v2 & 1) == 0) {
      return 0;
    }
  }
  return 1;
}

uint64_t sub_10007DA9C(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    if ((*(unsigned char *)(a2 + 8) & 1) == 0) {
      return 0;
    }
  }
  else
  {
    if (*(void *)a1 >= *(void *)a2) {
      char v2 = 1;
    }
    if ((v2 & 1) == 0) {
      return 0;
    }
  }
  return 1;
}

uint64_t sub_10007DAD4(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a1 + 8);
  if (*(unsigned char *)(a2 + 8) == 1)
  {
    if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
      return 1;
    }
  }
  else
  {
    if (*(void *)a2 >= *(void *)a1) {
      char v2 = 1;
    }
    if ((v2 & 1) == 0) {
      return 1;
    }
  }
  return 0;
}

BOOL sub_10007DB0C(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 8) == 1) {
    return (*(unsigned char *)(a2 + 8) & 1) != 0;
  }
  if (*(unsigned char *)(a2 + 8)) {
    return 0;
  }
  return *(void *)a1 == *(void *)a2;
}

Swift::Int sub_10007DB48()
{
  Swift::UInt v1 = *(void *)v0;
  Swift::UInt v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  Swift::UInt v4 = 0;
  if ((v3 & 1) == 0)
  {
    Hasher._combine(_:)(1uLL);
    Swift::UInt v4 = v2;
  }
  Hasher._combine(_:)(v4);
  return Hasher._finalize()();
}

void sub_10007DBBC()
{
  Swift::UInt v1 = *(void *)(v0 + 8);
  char v2 = *(unsigned char *)(v0 + 16);
  Hasher._combine(_:)(*(void *)v0);
  if (v2) {
    Swift::UInt v1 = 0;
  }
  else {
    Hasher._combine(_:)(1uLL);
  }
  Hasher._combine(_:)(v1);
}

Swift::Int sub_10007DC10()
{
  Swift::UInt v2 = *(void *)v0;
  Swift::UInt v1 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v2);
  if (v3) {
    Swift::UInt v1 = 0;
  }
  else {
    Hasher._combine(_:)(1uLL);
  }
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10007DC84(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 < *(void *)a2) {
    return 1;
  }
  if (*(void *)a1 == *(void *)a2)
  {
    int v3 = *(unsigned __int8 *)(a2 + 16);
    if (*(unsigned char *)(a1 + 16))
    {
      if ((v3 & 1) == 0) {
        return 1;
      }
    }
    else
    {
      if (*(void *)(a1 + 8) >= *(void *)(a2 + 8)) {
        int v3 = 1;
      }
      if (v3 != 1) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_10007DCD4(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < *(void *)a1) {
    return 0;
  }
  if (*(void *)a2 == *(void *)a1)
  {
    int v3 = *(unsigned __int8 *)(a1 + 16);
    if (*(unsigned char *)(a2 + 16))
    {
      if ((v3 & 1) == 0) {
        return 0;
      }
    }
    else
    {
      if (*(void *)(a2 + 8) >= *(void *)(a1 + 8)) {
        int v3 = 1;
      }
      if (v3 != 1) {
        return 0;
      }
    }
  }
  return 1;
}

uint64_t sub_10007DD24(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 < *(void *)a2) {
    return 0;
  }
  if (*(void *)a1 == *(void *)a2)
  {
    int v3 = *(unsigned __int8 *)(a2 + 16);
    if (*(unsigned char *)(a1 + 16))
    {
      if ((v3 & 1) == 0) {
        return 0;
      }
    }
    else
    {
      if (*(void *)(a1 + 8) >= *(void *)(a2 + 8)) {
        int v3 = 1;
      }
      if (v3 != 1) {
        return 0;
      }
    }
  }
  return 1;
}

uint64_t sub_10007DD74(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < *(void *)a1) {
    return 1;
  }
  if (*(void *)a2 == *(void *)a1)
  {
    int v3 = *(unsigned __int8 *)(a1 + 16);
    if (*(unsigned char *)(a2 + 16))
    {
      if ((v3 & 1) == 0) {
        return 1;
      }
    }
    else
    {
      if (*(void *)(a2 + 8) >= *(void *)(a1 + 8)) {
        int v3 = 1;
      }
      if (v3 != 1) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_10007DDC4(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 == *(void *)a2)
  {
    int v2 = *(unsigned __int8 *)(a2 + 16);
    if (*(unsigned char *)(a1 + 16) == 1)
    {
      if (v2) {
        return 1;
      }
    }
    else
    {
      if (*(void *)(a1 + 8) != *(void *)(a2 + 8)) {
        int v2 = 1;
      }
      if (v2 != 1) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_10007DE10(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  int v3 = (void *)a1[2];
  uint64_t v4 = a2[1];
  uint64_t v5 = (void *)a2[2];
  if ((sub_10005F708(*a1, *a2) & 1) == 0 || v2 != v4) {
    return 0;
  }

  return sub_10005F640(v3, v5);
}

unint64_t sub_10007DE88()
{
  sub_10006FEB8(v0, (uint64_t)v19);
  sub_10006FEB8((uint64_t)v19, (uint64_t)&v20);
  uint64_t v1 = (v21 >> 61) & 3;
  if (!v1)
  {
    v21 &= 0x9FFFFFFFFFFFFFFFLL;
    sub_10006FEB8((uint64_t)&v20, (uint64_t)v22);
    sub_10006FEB8((uint64_t)v22, (uint64_t)&v23);
    unsigned __int8 v4 = v24;
    if (v24 < 0)
    {
      v24 &= ~0x8000000000000000;
      uint64_t v7 = v25;
      uint64_t v8 = v26;
      uint64_t v9 = sub_100076D6C(v23, v4);
      unint64_t v11 = v10;
      v28._unint64_t countAndFlagsBits = 0x2065756C6176203BLL;
      v28._unint64_t object = (void *)0xE900000000000027;
      v12._unint64_t countAndFlagsBits = v7;
      v12._unint64_t object = v8;
      String.append(_:)(v12);
      v13._unint64_t countAndFlagsBits = 39;
      v13._unint64_t object = (void *)0xE100000000000000;
      String.append(_:)(v13);
      Swift::String v14 = v28;
      v28._unint64_t countAndFlagsBits = v9;
      v28._unint64_t object = (void *)v11;
      swift_bridgeObjectRetain();
      String.append(_:)(v14);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v28._countAndFlagsBits;
    }
    sub_10006FF14((__n128 *)&v23, &v27);
    sub_10006FF14(&v27, (__n128 *)&v28);
    int v5 = v29 >> 6;
    if (v5)
    {
      if (v5 == 1)
      {
        v29 &= 0x3Fu;
        uint64_t v18 = 0;
        v6._unint64_t countAndFlagsBits = 45;
        v6._unint64_t object = (void *)0xE100000000000000;
        String.append(_:)(v6);
        Character.write<A>(to:)();
        return v18;
      }
      v29 &= 0x3Fu;
      unint64_t object = (unint64_t)v28._object;
      unint64_t countAndFlagsBits = v28._countAndFlagsBits;
      uint64_t v17 = 45;
    }
    else
    {
      v29 &= 0x3Fu;
      unint64_t object = (unint64_t)v28._object;
      unint64_t countAndFlagsBits = v28._countAndFlagsBits;
      uint64_t v17 = 11565;
    }
    uint64_t v18 = v17;
    String.append(_:)(*(Swift::String *)&countAndFlagsBits);
    return v18;
  }
  if (v1 != 1) {
    return 0x74616E696D726574;
  }
  v21 &= 0x9FFFFFFFFFFFFFFFLL;
  v23._unint64_t countAndFlagsBits = 0x272065756C6176;
  v23._unint64_t object = (void *)0xE700000000000000;
  String.append(_:)(v20);
  v2._unint64_t countAndFlagsBits = 39;
  v2._unint64_t object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  return v23._countAndFlagsBits;
}

unint64_t sub_10007E0A4()
{
  return sub_10007DE88();
}

uint64_t sub_10007E0E8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return dispatch thunk of CustomStringConvertible.description.getter();
  }
  uint64_t v6 = dispatch thunk of CustomStringConvertible.description.getter();
  v3._unint64_t countAndFlagsBits = 46;
  v3._unint64_t object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  v4._unint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10007E1A0()
{
  return sub_10007E0E8(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

void sub_10007E1AC(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)a1;
  Swift::String v4 = *(void **)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  char v9 = *(unsigned char *)(a1 + 56);
  uint64_t v10 = (v6 >> 61) & 3;
  if (v10)
  {
    if (v10 != 1)
    {
      v18._unint64_t countAndFlagsBits = sub_10007E0E8(v7, v8, v9);
      String.append(_:)(v18);
      swift_bridgeObjectRelease();
      uint64_t v19 = 757932125;
      unint64_t v20 = 0xE400000000000000;
LABEL_9:
      String.append(_:)(*(Swift::String *)&v19);
      goto LABEL_10;
    }
    v11._unint64_t countAndFlagsBits = sub_10007E0E8(v7, v8, v9);
    String.append(_:)(v11);
    swift_bridgeObjectRelease();
    v12._unint64_t countAndFlagsBits = 2564189;
    v12._unint64_t object = (void *)0xE300000000000000;
    String.append(_:)(v12);
    uint64_t v13 = v5;
    Swift::String v14 = v4;
LABEL_8:
    String.append(_:)(*(Swift::String *)&v13);
    uint64_t v19 = 39;
    unint64_t v20 = 0xE100000000000000;
    goto LABEL_9;
  }
  if ((v6 & 0x8000000000000000) != 0)
  {
    uint64_t v21 = *(void *)(a1 + 24);
    uint64_t v22 = *(void **)(a1 + 32);
    v23._unint64_t countAndFlagsBits = sub_10007E0E8(v7, v8, v9);
    String.append(_:)(v23);
    swift_bridgeObjectRelease();
    v24._unint64_t countAndFlagsBits = 8285;
    v24._unint64_t object = (void *)0xE200000000000000;
    String.append(_:)(v24);
    v28._unint64_t countAndFlagsBits = v5;
    v28._unint64_t object = v4;
    v25._unint64_t countAndFlagsBits = sub_100076D6C(v28, v6);
    String.append(_:)(v25);
    swift_bridgeObjectRelease();
    v26._unint64_t countAndFlagsBits = 10045;
    v26._unint64_t object = (void *)0xE200000000000000;
    String.append(_:)(v26);
    uint64_t v13 = v21;
    Swift::String v14 = v22;
    goto LABEL_8;
  }
  v15._unint64_t countAndFlagsBits = sub_10007E0E8(v7, v8, v9);
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  v16._unint64_t countAndFlagsBits = 8285;
  v16._unint64_t object = (void *)0xE200000000000000;
  String.append(_:)(v16);
  v27._unint64_t countAndFlagsBits = v5;
  v27._unint64_t object = v4;
  v17._unint64_t countAndFlagsBits = sub_100076D6C(v27, v6);
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
LABEL_10:
  *a2 = 91;
  a2[1] = 0xE100000000000000;
}

void sub_10007E398()
{
  sub_10007FE48(*v0, v0[1]);
}

uint64_t sub_10007E3A0(uint64_t result, int64_t a2)
{
  int64_t v2 = *(void *)(result + 8);
  if (v2 <= a2)
  {
    Swift::String v3 = (char **)result;
    if (v2 != a2)
    {
      uint64_t v4 = a2;
      uint64_t v5 = *(char **)result;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *Swift::String v3 = v5;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        goto LABEL_16;
      }
      while (1)
      {
        uint64_t v7 = (v4 << 6) + 88;
        int64_t v17 = v2;
        while (v2 < v4)
        {
          unint64_t v8 = v4 - 1;
          if (v4 < 1) {
            goto LABEL_13;
          }
          unint64_t v9 = *((void *)v5 + 2);
          if (v8 >= v9) {
            goto LABEL_14;
          }
          uint64_t v10 = &v5[v7];
          uint64_t v4 = *(void *)&v5[v7 - 120];
          uint64_t v11 = *(void *)&v5[v7 - 112];
          uint64_t v21 = v5;
          int64_t v2 = *(void *)&v5[v7 - 104];
          uint64_t v5 = *(char **)&v5[v7 - 96];
          uint64_t v12 = *((void *)v10 - 11);
          uint64_t v19 = *((void *)v10 - 9);
          uint64_t v20 = *((void *)v10 - 10);
          char v18 = *(v10 - 64);
          sub_100063FAC(v4, v11, v2);
          *Swift::String v3 = v21;
          unint64_t v13 = v8 + 1;
          if (v13 >= v9) {
            goto LABEL_15;
          }
          uint64_t v14 = *((void *)v10 - 7);
          uint64_t v15 = *((void *)v10 - 6);
          unint64_t v16 = *((void *)v10 - 5);
          *((void *)v10 - 7) = v4;
          *((void *)v10 - 6) = v11;
          *((void *)v10 - 5) = v2;
          *((void *)v10 - 4) = v5;
          *((void *)v10 - 3) = v12;
          *((void *)v10 - 2) = v20;
          *((void *)v10 - 1) = v19;
          *uint64_t v10 = v18;
          unint64_t result = sub_10006FDE4(v14, v15, v16);
          uint64_t v5 = *v3;
          v7 -= 64;
          uint64_t v4 = v13 - 1;
          int64_t v2 = v17;
          if (v13 - 1 == v17) {
            goto LABEL_10;
          }
        }
        __break(1u);
LABEL_13:
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        uint64_t v5 = sub_1000639BC((uint64_t)v5);
      }
    }
LABEL_10:
    if (__OFADD__(v2, 1)) {
      __break(1u);
    }
    else {
      v3[1] = (char *)(v2 + 1);
    }
  }
  return result;
}

uint64_t sub_10007E504(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = *(void *)(*v3 + 16);
  if (v6 < v5)
  {
    __break(1u);
    goto LABEL_43;
  }
  if (v5 < 0)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (v5 != v6)
  {
    uint64_t v8 = result;
    uint64_t v9 = v3[1];
    if (v5 < (unint64_t)v6)
    {
      uint64_t v10 = (uint64_t *)(v4 + (v5 << 6) + 72);
      uint64_t v9 = v3[1];
      while (1)
      {
        uint64_t v11 = *v10;
        v10 += 8;
        BOOL v12 = v11 <= result;
        if (v11 == result) {
          break;
        }
        if (!v12 || v6 - 1 == v9++) {
          return result;
        }
      }
    }
    if (v9 < v6)
    {
      if ((a3 & 1) == 0)
      {
        if (v9 < v5)
        {
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
          goto LABEL_48;
        }
        if (*(unsigned char *)(v4 + (v9 << 6) + 88) == 1)
        {
          unint64_t result = sub_10007E6C4(v9++);
          uint64_t v4 = *v3;
          uint64_t v5 = v3[1];
        }
        if (v5 < 0) {
          goto LABEL_46;
        }
        uint64_t v14 = *(void *)(v4 + 16);
        if (v14 < (unint64_t)v5 || v14 < v9) {
          goto LABEL_47;
        }
        if (v9 < v5)
        {
LABEL_48:
          __break(1u);
          goto LABEL_49;
        }
        if (v9 == v14) {
          return result;
        }
        char v18 = (unsigned char *)(v4 + (v9 << 6) + 88);
        while (v9 < v14)
        {
          if (*((void *)v18 - 2) == v8 && (*v18 & 1) == 0 && *((void *)v18 - 1) == a2)
          {
            return sub_10007E6C4(v9);
          }
          ++v9;
          v18 += 64;
          if (v14 == v9) {
            return result;
          }
        }
LABEL_44:
        __break(1u);
        goto LABEL_45;
      }
      if (v9 < v5)
      {
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      uint64_t v15 = (uint64_t *)(v4 + (v9 << 6) + 72);
      int64_t v16 = v9;
      while (1)
      {
        uint64_t v17 = *v15;
        v15 += 8;
        if (v17 != result) {
          break;
        }
        if (v6 == ++v16)
        {
          int64_t v16 = *(void *)(*v3 + 16);
          break;
        }
      }
      if (v16 < v9) {
        goto LABEL_50;
      }
      return sub_10007E818(v9, v16);
    }
  }
  return result;
}

uint64_t sub_10007E6C4(uint64_t result)
{
  uint64_t v2 = (uint64_t)v1[1];
  if (v2 <= result)
  {
    if (v2 != result)
    {
      uint64_t v3 = result;
      char v18 = *v1;
      int64_t v16 = v1;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_17:
      }
        char v18 = sub_1000639BC((uint64_t)v18);
      uint64_t v4 = (uint64_t)&v18[64 * v3 + 32];
      uint64_t v17 = v2;
      do
      {
        if (v2 >= v3)
        {
          __break(1u);
LABEL_14:
          __break(1u);
LABEL_15:
          __break(1u);
LABEL_16:
          __break(1u);
          goto LABEL_17;
        }
        unint64_t v5 = v3 - 1;
        if (v3 < 1) {
          goto LABEL_14;
        }
        unint64_t v6 = *((void *)v18 + 2);
        if (v5 >= v6) {
          goto LABEL_15;
        }
        uint64_t v3 = *(void *)(v4 - 64);
        uint64_t v2 = *(void *)(v4 - 56);
        unint64_t v7 = *(void *)(v4 - 48);
        uint64_t v8 = *(void *)(v4 - 40);
        uint64_t v9 = *(void *)(v4 - 32);
        uint64_t v19 = *(void *)(v4 - 24);
        uint64_t v10 = *(void *)(v4 - 16);
        char v11 = *(unsigned char *)(v4 - 8);
        sub_100063FAC(v3, v2, v7);
        unint64_t v12 = v5 + 1;
        if (v12 >= v6) {
          goto LABEL_16;
        }
        uint64_t v13 = *(void *)v4;
        uint64_t v14 = *(void *)(v4 + 8);
        unint64_t v15 = *(void *)(v4 + 16);
        *(void *)uint64_t v4 = v3;
        *(void *)(v4 + 8) = v2;
        *(void *)(v4 + 16) = v7;
        *(void *)(v4 + 24) = v8;
        *(void *)(v4 + 32) = v9;
        *(void *)(v4 + 40) = v19;
        *(void *)(v4 + 48) = v10;
        *(unsigned char *)(v4 + 56) = v11;
        unint64_t result = sub_10006FDE4(v13, v14, v15);
        v4 -= 64;
        uint64_t v3 = v12 - 1;
        uint64_t v2 = v17;
      }
      while (v12 - 1 != v17);
      uint64_t v1 = v16;
      *int64_t v16 = v18;
    }
    if (__OFADD__(v2, 1)) {
      __break(1u);
    }
    else {
      v1[1] = (char *)(v2 + 1);
    }
  }
  return result;
}

uint64_t sub_10007E818(uint64_t result, unint64_t a2)
{
  uint64_t v4 = result;
  uint64_t v25 = (uint64_t)v2[1];
  if (v25 >= result) {
    goto LABEL_10;
  }
  Swift::String v24 = *v2;
  Swift::String v23 = v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_19;
  }
  while (1)
  {
    uint64_t v21 = v4;
    unint64_t v22 = a2;
    uint64_t v5 = v4;
    unint64_t v6 = &v24[64 * v4];
    do
    {
      BOOL v7 = __OFSUB__(a2--, 1);
      if (v7)
      {
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
      if (v5-- < 1) {
        goto LABEL_14;
      }
      unint64_t v9 = *((void *)v24 + 2);
      if (v5 >= v9) {
        goto LABEL_15;
      }
      uint64_t v10 = *((void *)v6 - 4);
      uint64_t v11 = *((void *)v6 - 3);
      unint64_t v12 = *((void *)v6 - 2);
      uint64_t v13 = *((void *)v6 - 1);
      uint64_t v14 = *(void *)v6;
      uint64_t v4 = *((void *)v6 + 1);
      uint64_t v27 = *((void *)v6 + 2);
      char v26 = v6[24];
      sub_100063FAC(v10, v11, v12);
      if (a2 >= v9) {
        goto LABEL_16;
      }
      uint64_t v15 = (uint64_t)&v24[64 * a2 + 32];
      uint64_t v16 = *(void *)v15;
      uint64_t v17 = *(void *)(v15 + 8);
      unint64_t v18 = *(void *)(v15 + 16);
      *(void *)uint64_t v15 = v10;
      *(void *)(v15 + 8) = v11;
      *(void *)(v15 + 16) = v12;
      *(void *)(v15 + 24) = v13;
      *(void *)(v15 + 32) = v14;
      *(void *)(v15 + 40) = v4;
      *(void *)(v15 + 48) = v27;
      *(unsigned char *)(v15 + 56) = v26;
      unint64_t result = sub_10006FDE4(v16, v17, v18);
      v6 -= 64;
    }
    while (v25 < v5);
    a2 = v22;
    uint64_t v2 = v23;
    *Swift::String v23 = v24;
    uint64_t v4 = v21;
LABEL_10:
    unint64_t v19 = a2 - v4;
    if (__OFSUB__(a2, v4))
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    BOOL v7 = __OFADD__(v25, v19);
    uint64_t v20 = (char *)(v25 + v19);
    if (!v7) {
      break;
    }
LABEL_18:
    __break(1u);
LABEL_19:
    Swift::String v24 = sub_1000639BC((uint64_t)v24);
  }
  v2[1] = v20;
  return result;
}

uint64_t sub_10007E990(uint64_t result, uint64_t a2, __int16 a3)
{
  if ((a3 & 0x100) == 0) {
    return sub_10007E504(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_10007E9C0(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 16) < result)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (result < 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_10007E9DC(uint64_t a1, uint64_t a2)
{
  sub_10006FEB8(a1, (uint64_t)&v31);
  unsigned __int8 v3 = v32;
  if ((v32 & 0x8000000000000000) == 0)
  {
    sub_10006FF14(&v31, &v35);
    sub_10006FEB8(a2, (uint64_t)&v27);
    if (v28 < 0) {
      goto LABEL_32;
    }
    sub_10006FF14(&v27, &v24);
    sub_10006FF14(&v35, &v36);
    int v4 = v37;
    int v5 = v37 >> 6;
    if (v5)
    {
      if (v5 == 1)
      {
        v37 &= 0x3Fu;
        __n128 v6 = v36;
        sub_10006FF14(&v24, &v25);
        int v7 = v26;
        if ((v26 & 0xC0) == 0x40)
        {
          v26 &= 0x3Fu;
          if (*(_OWORD *)&v6 == *(_OWORD *)&v25)
          {
            if ((v4 ^ v7)) {
              goto LABEL_32;
            }
          }
          else
          {
            char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
            if (((v4 ^ v7) & 1) != 0 || (v21 & 1) == 0) {
              goto LABEL_32;
            }
          }
LABEL_38:
          char v20 = 1;
          return v20 & 1;
        }
LABEL_32:
        char v20 = 0;
        return v20 & 1;
      }
      v37 &= 0x3Fu;
      unint64_t v18 = v36.n128_u64[1];
      unint64_t v17 = v36.n128_u64[0];
      sub_10006FF14(&v24, &v25);
      if ((v26 & 0xC0) != 0x80) {
        goto LABEL_32;
      }
      v26 &= 0x3Fu;
    }
    else
    {
      v37 &= 0x3Fu;
      unint64_t v18 = v36.n128_u64[1];
      unint64_t v17 = v36.n128_u64[0];
      sub_10006FF14(&v24, &v25);
      if (v26 >= 0x40u) {
        goto LABEL_32;
      }
    }
    if (__PAIR128__(v18, v17) != *(_OWORD *)&v25 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_32;
    }
    goto LABEL_38;
  }
  v32 &= ~0x8000000000000000;
  __n128 v8 = v31;
  uint64_t v9 = v33;
  uint64_t v10 = v34;
  sub_10006FEB8(a2, (uint64_t)&v27);
  unsigned __int8 v11 = v28;
  if ((v28 & 0x8000000000000000) == 0)
  {
    sub_10006FF14(&v27, &v36);
    goto LABEL_32;
  }
  int v12 = v3;
  v28 &= ~0x8000000000000000;
  unsigned int v13 = v11;
  int v14 = v3 >> 6;
  uint64_t v16 = v29;
  uint64_t v15 = v30;
  if (!v14)
  {
    if (v13 >= 0x40) {
      goto LABEL_32;
    }
    goto LABEL_27;
  }
  if (v14 != 1)
  {
    if ((v13 & 0xC0) != 0x80) {
      goto LABEL_32;
    }
LABEL_27:
    if (*(_OWORD *)&v8 == *(_OWORD *)&v27) {
      goto LABEL_36;
    }
    char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
    char v20 = 0;
    if (v19) {
      goto LABEL_36;
    }
    return v20 & 1;
  }
  if ((v13 & 0xC0) != 0x40) {
    goto LABEL_32;
  }
  if (*(_OWORD *)&v8 == *(_OWORD *)&v27)
  {
    if ((v12 ^ v13)) {
      goto LABEL_32;
    }
LABEL_36:
    if (v9 != v16 || v10 != v15)
    {
      char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
      return v20 & 1;
    }
    goto LABEL_38;
  }
  char v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
  char v20 = 0;
  if ((v12 ^ v13) & 1) == 0 && (v23) {
    goto LABEL_36;
  }
  return v20 & 1;
}

uint64_t sub_10007EC9C(uint64_t a1, uint64_t a2)
{
  sub_10006FEB8(a1, (uint64_t)v37);
  uint64_t v3 = (v38 >> 61) & 3;
  if (!v3)
  {
    v38 &= 0x9FFFFFFFFFFFFFFFLL;
    sub_10006FEB8((uint64_t)v37, (uint64_t)v39);
    sub_10006FEB8(a2, (uint64_t)v27);
    if ((v28 & 0x6000000000000000) != 0) {
      goto LABEL_46;
    }
    v28 &= 0x9FFFFFFFFFFFFFFFLL;
    sub_10006FEB8((uint64_t)v27, (uint64_t)v29);
    sub_10006FEB8((uint64_t)v39, (uint64_t)&v40);
    unsigned __int8 v7 = v41;
    if ((v41 & 0x8000000000000000) == 0)
    {
      sub_10006FF14((__n128 *)&v40, &v43);
      sub_10006FEB8((uint64_t)v29, (uint64_t)&v33);
      if (v34 < 0) {
        goto LABEL_46;
      }
      sub_10006FF14(&v33, &v30);
      sub_10006FF14(&v43, &v44);
      int v8 = v45;
      int v9 = v45 >> 6;
      if (v9)
      {
        if (v9 == 1)
        {
          v45 &= 0x3Fu;
          __n128 v10 = v44;
          sub_10006FF14(&v30, &v31);
          int v11 = v32;
          if ((v32 & 0xC0) == 0x40)
          {
            v32 &= 0x3Fu;
            if (*(_OWORD *)&v10 == *(_OWORD *)&v31)
            {
              if (((v8 ^ v11) & 1) == 0) {
                goto LABEL_18;
              }
            }
            else
            {
              char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
              if ((v8 ^ v11) & 1) == 0 && (v24) {
                goto LABEL_18;
              }
            }
          }
LABEL_46:
          char v6 = 0;
          return v6 & 1;
        }
        v45 &= 0x3Fu;
        unint64_t v23 = v44.n128_u64[1];
        unint64_t v22 = v44.n128_u64[0];
        sub_10006FF14(&v30, &v31);
        if ((v32 & 0xC0) != 0x80) {
          goto LABEL_46;
        }
        v32 &= 0x3Fu;
      }
      else
      {
        v45 &= 0x3Fu;
        unint64_t v23 = v44.n128_u64[1];
        unint64_t v22 = v44.n128_u64[0];
        sub_10006FF14(&v30, &v31);
        if (v32 >= 0x40u) {
          goto LABEL_46;
        }
      }
      if (__PAIR128__(v23, v22) == *(_OWORD *)&v31) {
        goto LABEL_18;
      }
LABEL_45:
      if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
        goto LABEL_18;
      }
      goto LABEL_46;
    }
    v41 &= ~0x8000000000000000;
    int8x16_t v14 = v40;
    int8x16_t v15 = v42;
    sub_10006FEB8((uint64_t)v29, (uint64_t)&v33);
    unsigned __int8 v16 = v34;
    if ((v34 & 0x8000000000000000) == 0)
    {
      sub_10006FF14(&v33, &v44);
      goto LABEL_46;
    }
    int v17 = v7;
    v34 &= ~0x8000000000000000;
    unsigned int v18 = v16;
    int v19 = v7 >> 6;
    unint64_t v21 = v35;
    unint64_t v20 = v36;
    if (v19)
    {
      if (v19 == 1)
      {
        if ((v18 & 0xC0) != 0x40) {
          goto LABEL_46;
        }
        if (*(_OWORD *)&v14 == *(_OWORD *)&v33)
        {
          if ((v17 ^ v18)) {
            goto LABEL_46;
          }
        }
        else
        {
          char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
          if (((v17 ^ v18) & 1) != 0 || (v25 & 1) == 0) {
            goto LABEL_46;
          }
        }
        goto LABEL_44;
      }
      if ((v18 & 0xC0) != 0x80) {
        goto LABEL_46;
      }
    }
    else if (v18 >= 0x40)
    {
      goto LABEL_46;
    }
    if (*(_OWORD *)&v14 != *(_OWORD *)&v33 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_46;
    }
LABEL_44:
    if (*(_OWORD *)&v15 == __PAIR128__(v20, v21)) {
      goto LABEL_18;
    }
    goto LABEL_45;
  }
  if (v3 != 1)
  {
    sub_10006FEB8(a2, (uint64_t)&v40);
    if ((v41 & 0x6000000000000000) == 0x4000000000000000 && v41 == 0x4000000000000000)
    {
      int8x16_t v12 = vorrq_s8(v42, v40);
      int8x16_t v13 = vextq_s8(v12, v12, 8uLL);
      if (!*(void *)&vorr_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL))) {
        goto LABEL_18;
      }
    }
    goto LABEL_46;
  }
  v38 &= 0x9FFFFFFFFFFFFFFFLL;
  unint64_t v4 = v37[0];
  unint64_t v5 = v37[1];
  sub_10006FEB8(a2, (uint64_t)&v40);
  if ((v41 & 0x6000000000000000) != 0x2000000000000000) {
    goto LABEL_46;
  }
  v41 &= 0x9FFFFFFFFFFFFFFFLL;
  if (__PAIR128__(v5, v4) == *(_OWORD *)&v40)
  {
LABEL_18:
    char v6 = 1;
    return v6 & 1;
  }
  char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
  return v6 & 1;
}

void *sub_10007F04C(void *result, uint64_t a2, unint64_t a3, void *a4)
{
  int64_t v4 = a3 >> 1;
  if (a3 >> 1 != a2)
  {
    uint64_t v6 = a2;
    unint64_t v28 = a3 >> 1;
    uint64_t v29 = a2;
    __n128 v27 = result;
    do
    {
      uint64_t v7 = v6;
      while (1)
      {
        if (v7 < a2 || v6 >= v4) {
          goto LABEL_32;
        }
        int v8 = &result[8 * v6];
        uint64_t v9 = *v8;
        uint64_t v10 = v8[1];
        unint64_t v11 = v8[2];
        uint64_t v12 = v8[3];
        ++v6;
        BOOL v13 = (v11 & 0x6000000000000000) == 0x4000000000000000 && v11 == 0x4000000000000000;
        if (!v13 || (v10 | *v8 | v12 | v8[4]) != 0)
        {
          uint64_t v15 = v8[5];
          char v16 = *((unsigned char *)v8 + 56);
          if (v16) {
            goto LABEL_25;
          }
          uint64_t v17 = a4[2];
          if (!v17) {
            goto LABEL_25;
          }
          if (a4[4] != v15)
          {
            if (v17 == 1) {
              goto LABEL_25;
            }
            if (a4[5] != v15) {
              break;
            }
          }
        }
LABEL_5:
        if (v6 == v4) {
          return _swiftEmptyArrayStorage;
        }
      }
      if (v17 != 2)
      {
        uint64_t v18 = 6;
        while (1)
        {
          uint64_t v19 = v18 - 3;
          if (__OFADD__(v18 - 4, 1)) {
            break;
          }
          if (a4[v18] == v15) {
            goto LABEL_5;
          }
          ++v18;
          if (v19 == v17) {
            goto LABEL_25;
          }
        }
        __break(1u);
LABEL_32:
        __break(1u);
        return result;
      }
LABEL_25:
      uint64_t v30 = v8[6];
      uint64_t v31 = v8[4];
      sub_100063FAC(v9, v10, v11);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100057038(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      int64_t v4 = v28;
      a2 = v29;
      unint64_t v21 = _swiftEmptyArrayStorage[2];
      unint64_t v20 = _swiftEmptyArrayStorage[3];
      unint64_t v22 = v21 + 1;
      unint64_t result = v27;
      uint64_t v23 = v31;
      if (v21 >= v20 >> 1)
      {
        unint64_t v25 = v21 + 1;
        unint64_t v26 = _swiftEmptyArrayStorage[2];
        sub_100057038((char *)(v20 > 1), v21 + 1, 1);
        unint64_t v22 = v25;
        unint64_t v21 = v26;
        uint64_t v23 = v31;
        unint64_t result = v27;
        int64_t v4 = v28;
        a2 = v29;
      }
      _swiftEmptyArrayStorage[2] = v22;
      char v24 = &_swiftEmptyArrayStorage[8 * v21];
      v24[4] = v9;
      v24[5] = v10;
      v24[6] = v11;
      v24[7] = v12;
      v24[8] = v23;
      v24[9] = v15;
      v24[10] = v30;
      *((unsigned char *)v24 + 88) = v16;
    }
    while (v6 != v4);
  }
  return _swiftEmptyArrayStorage;
}

void *sub_10007F258(uint64_t a1, uint64_t a2)
{
  int64_t v3 = *(void *)(a1 + 16);
  unint64_t result = _swiftEmptyArrayStorage;
  if (!v3) {
    return result;
  }
  int8x16_t v42 = _swiftEmptyArrayStorage;
  sub_100057078(0, v3, 0);
  unint64_t result = _swiftEmptyArrayStorage;
  uint64_t v33 = a2 + 32;
  uint64_t v34 = a2;
  for (uint64_t i = a1 + 48; ; i += 64)
  {
    uint64_t v7 = *(void *)(i - 16);
    int v8 = *(void **)(i - 8);
    unint64_t v9 = *(void *)i;
    uint64_t v10 = *(void *)(i + 8);
    unint64_t v11 = *(void **)(i + 16);
    Swift::UInt v12 = *(void *)(i + 24);
    Swift::UInt v37 = *(void *)(i + 32);
    unint64_t v38 = result;
    unsigned int v36 = *(unsigned __int8 *)(i + 40);
    if (v36 == 1) {
      break;
    }
    if ((v9 & 0x6000000000000000) == 0)
    {
      int v19 = v9 >> 6;
      if ((v9 & 0x8000000000000000) != 0)
      {
        unint64_t v32 = *(void *)i;
        if (v9 >> 6)
        {
          if (v19 == 1)
          {
            uint64_t v39 = 0;
            unint64_t v40 = 0xE000000000000000;
            unint64_t v21 = v9;
            uint64_t v22 = v10;
            uint64_t v23 = v11;
            sub_100063FAC(v7, (uint64_t)v8, v21);
            v24._unint64_t countAndFlagsBits = 45;
            v24._unint64_t object = (void *)0xE100000000000000;
            String.append(_:)(v24);
            Character.write<A>(to:)();
LABEL_29:
            v30._unint64_t countAndFlagsBits = 61;
            v30._unint64_t object = (void *)0xE100000000000000;
            String.append(_:)(v30);
            v31._unint64_t countAndFlagsBits = v22;
            v31._unint64_t object = v23;
            String.append(_:)(v31);
            unint64_t v14 = v40;
            uint64_t v35 = v39;
            unint64_t v9 = v32;
            goto LABEL_11;
          }
          uint64_t v39 = 45;
          unint64_t v27 = 0xE100000000000000;
        }
        else
        {
          uint64_t v39 = 11565;
          unint64_t v27 = 0xE200000000000000;
        }
        unint64_t v40 = v27;
        unint64_t v28 = v9;
        uint64_t v22 = v10;
        uint64_t v23 = v11;
        sub_100063FAC(v7, (uint64_t)v8, v28);
        v29._unint64_t countAndFlagsBits = v7;
        v29._unint64_t object = v8;
        String.append(_:)(v29);
        goto LABEL_29;
      }
      if (v9 >> 6)
      {
        if (v19 == 1)
        {
          uint64_t v39 = 0;
          unint64_t v40 = 0xE000000000000000;
          sub_100063FAC(v7, (uint64_t)v8, v9);
          v20._unint64_t countAndFlagsBits = 45;
          v20._unint64_t object = (void *)0xE100000000000000;
          String.append(_:)(v20);
          Character.write<A>(to:)();
LABEL_25:
          unint64_t v14 = v40;
          uint64_t v35 = v39;
          goto LABEL_11;
        }
        uint64_t v39 = 45;
        unint64_t v25 = 0xE100000000000000;
      }
      else
      {
        uint64_t v39 = 11565;
        unint64_t v25 = 0xE200000000000000;
      }
      unint64_t v40 = v25;
      sub_100063FAC(v7, (uint64_t)v8, v9);
      v26._unint64_t countAndFlagsBits = v7;
      v26._unint64_t object = v8;
      String.append(_:)(v26);
      goto LABEL_25;
    }
    if ((v12 & 0x8000000000000000) != 0) {
      goto LABEL_33;
    }
    if (v12 >= *(void *)(v34 + 16)) {
      goto LABEL_34;
    }
LABEL_10:
    BOOL v13 = (uint64_t *)(v33 + 16 * v12);
    unint64_t v14 = v13[1];
    uint64_t v35 = *v13;
    sub_100063FAC(v7, (uint64_t)v8, v9);
    swift_bridgeObjectRetain();
LABEL_11:
    sub_10006FFD0();
    uint64_t v41 = Set.init(minimumCapacity:)();
    sub_100061630((uint64_t)&v39, v12, v37, v36);
    uint64_t v15 = v41;
    sub_10006FDE4(v7, (uint64_t)v8, v9);
    unint64_t result = v38;
    int8x16_t v42 = v38;
    unint64_t v17 = v38[2];
    unint64_t v16 = v38[3];
    if (v17 >= v16 >> 1)
    {
      sub_100057078((void *)(v16 > 1), v17 + 1, 1);
      unint64_t result = v42;
    }
    result[2] = v17 + 1;
    uint64_t v18 = &result[3 * v17];
    v18[4] = v15;
    v18[5] = v35;
    v18[6] = v14;
    if (!--v3) {
      return result;
    }
  }
  if ((v12 & 0x8000000000000000) == 0)
  {
    if (v12 >= *(void *)(v34 + 16)) {
      goto LABEL_32;
    }
    goto LABEL_10;
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

unint64_t sub_10007F5F4@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t result = sub_100087424(61, 0xE100000000000000, a1, a2);
  if (v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = Substring.distance(from:to:)();
    unint64_t result = swift_bridgeObjectRelease();
    if (v15 == 1)
    {
      if ((a2 ^ a1) < 0x4000)
      {
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
      swift_bridgeObjectRetain();
      uint64_t v16 = Substring.subscript.getter();
      uint64_t v18 = v17;
      unint64_t result = swift_bridgeObjectRelease_n();
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      unint64_t v21 = 64;
    }
    else
    {
      uint64_t v16 = static String._fromSubstring(_:)();
      uint64_t v18 = v22;
      unint64_t result = swift_bridgeObjectRelease();
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      unint64_t v21 = 128;
    }
LABEL_18:
    *a3 = v16;
    a3[1] = v18;
    a3[2] = v21;
    a3[3] = v19;
    a3[4] = v20;
    return result;
  }
  if (a1 >> 14 > result >> 14)
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v8 = Substring.subscript.getter();
  if ((v8 ^ v9) < 0x4000)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v10 = Substring.distance(from:to:)();
    unint64_t result = swift_bridgeObjectRelease();
    if (v10 != 1)
    {
      uint64_t v11 = static String._fromSubstring(_:)();
      BOOL v13 = v26;
      unsigned __int8 v14 = 0x80;
      goto LABEL_15;
    }
    if (a1 >> 14 != a2 >> 14)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = Substring.subscript.getter();
      BOOL v13 = v12;
      swift_bridgeObjectRelease();
      unsigned __int8 v14 = 64;
LABEL_15:
      swift_bridgeObjectRelease();
      v32._unint64_t countAndFlagsBits = v11;
      v32._unint64_t object = v13;
      uint64_t v27 = sub_100076D6C(v32, v14);
      uint64_t v29 = v28;
      sub_10002ECB8(v11, (uint64_t)v13, v14);
      sub_10002FDE0();
      swift_allocError();
      *(void *)uint64_t v30 = v27;
      *(void *)(v30 + 8) = v29;
      *(_OWORD *)(v30 + 16) = 0u;
      *(_OWORD *)(v30 + 32) = 0u;
      *(_OWORD *)(v30 + 48) = 0u;
      *(_OWORD *)(v30 + 64) = 0u;
      *(unsigned char *)(v30 + 80) = 5;
      return swift_willThrow();
    }
    goto LABEL_22;
  }
  unint64_t result = Substring.index(after:)();
  if (a2 >> 14 >= result >> 14)
  {
    unint64_t v21 = 0x8000000000000040;
    Substring.subscript.getter();
    swift_bridgeObjectRelease();
    uint64_t v19 = static String._fromSubstring(_:)();
    uint64_t v20 = v23;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v24 = Substring.distance(from:to:)();
    swift_bridgeObjectRelease();
    if (v24 == 1)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = Substring.subscript.getter();
      uint64_t v18 = v25;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = static String._fromSubstring(_:)();
      uint64_t v18 = v31;
      unint64_t v21 = 0x8000000000000080;
    }
    unint64_t result = swift_bridgeObjectRelease();
    goto LABEL_18;
  }
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

char *sub_10007F9CC(uint64_t a1)
{
  uint64_t v2 = v1;
  int64_t v4 = (char *)_swiftEmptyArrayStorage;
  unint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = 0;
    char v7 = (uint64_t *)(a1 + 56);
    unint64_t v26 = v5 - 1;
    while (1)
    {
      uint64_t v9 = *(v7 - 3);
      unint64_t v8 = *(v7 - 2);
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_10007CD60(v9, v8, v6);
      if (v2)
      {
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        int64_t v4 = (char *)_swiftEmptyArrayStorage;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v4;
      }
      uint64_t v11 = (void *)v10;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_10005EAE8((uint64_t)v11);
      if (!v11[2]) {
        goto LABEL_30;
      }
      uint64_t v12 = v11[4];
      uint64_t v13 = v11[5];
      uint64_t v14 = v11[6];
      uint64_t v15 = v11[7];
      uint64_t v16 = v11[8];
      swift_bridgeObjectRelease();
      if ((v14 & 0x6000000000000000) == 0x4000000000000000)
      {
        BOOL v18 = v14 == 0x4000000000000000 && (v13 | v12 | v15 | v16) == 0;
        if (v26 == v6 || v18)
        {
          if (v26 == v6)
          {
LABEL_17:
            swift_unknownObjectRelease();
            return (char *)_swiftEmptyArrayStorage;
          }
          uint64_t v19 = v6 + 1;
          if (v6 + 1 < v5)
          {
            int64_t v4 = (char *)_swiftEmptyArrayStorage;
            swift_unknownObjectRetain();
            do
            {
              uint64_t v21 = *(v7 - 1);
              uint64_t v20 = *v7;
              swift_bridgeObjectRetain();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                int64_t v4 = sub_100060434(0, *((void *)v4 + 2) + 1, 1, v4);
              }
              unint64_t v23 = *((void *)v4 + 2);
              unint64_t v22 = *((void *)v4 + 3);
              if (v23 >= v22 >> 1) {
                int64_t v4 = sub_100060434((char *)(v22 > 1), v23 + 1, 1, v4);
              }
              uint64_t v24 = &v4[64 * v23];
              *((void *)v24 + 8) = 0;
              *((void *)v24 + 9) = v19;
              v7 += 2;
              *((void *)v4 + 2) = v23 + 1;
              *((void *)v24 + 4) = v21;
              *((void *)v24 + 5) = v20;
              *((void *)v24 + 6) = 0x2000000000000000;
              *((void *)v24 + 7) = 0;
              *((void *)v24 + 10) = 0;
              ++v19;
              v24[88] = 1;
            }
            while (v5 != v19);
            swift_unknownObjectRelease_n();
            return v4;
          }
LABEL_29:
          __break(1u);
LABEL_30:
          unint64_t result = (char *)swift_bridgeObjectRelease();
          __break(1u);
          return result;
        }
      }
      else if (v26 == v6)
      {
        goto LABEL_17;
      }
      ++v6;
      v7 += 2;
      uint64_t v2 = 0;
      if (v5 == v6)
      {
        __break(1u);
        goto LABEL_29;
      }
    }
  }
  return v4;
}

uint64_t sub_10007FC4C(uint64_t result, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  if ((a3 & 0x100) != 0) {
    return 0;
  }
  uint64_t v5 = *(void *)(a4 + 16);
  if (v5 < a5)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if ((a5 & 0x8000000000000000) == 0)
  {
    if (v5 != a5)
    {
      uint64_t v6 = (unsigned __int8 *)(a4 + (a5 << 6) + 88);
      while (a5 < v5)
      {
        uint64_t v7 = *((void *)v6 - 2);
        if (v7 > result) {
          return a5;
        }
        if (v7 == result)
        {
          int v8 = *v6;
          if (a3)
          {
            if ((v8 & 1) == 0) {
              return a5;
            }
          }
          else
          {
            if (*((void *)v6 - 1) <= a2) {
              int v8 = 1;
            }
            if (v8 != 1) {
              return a5;
            }
          }
        }
        if (__OFADD__(a5, 1)) {
          goto LABEL_20;
        }
        ++a5;
        v6 += 64;
        if (a5 == v5) {
          return 0;
        }
      }
      __break(1u);
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    return 0;
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_10007FCF0@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = *(void *)(result + 16);
  if ((uint64_t)v4 < (uint64_t)a2)
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v4 == a2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    char v12 = 0;
    unint64_t v13 = 0x7FFFFFF3ELL;
LABEL_7:
    *(void *)a3 = v5;
    *(void *)(a3 + 8) = v6;
    *(void *)(a3 + 16) = v7;
    *(void *)(a3 + 24) = v8;
    *(void *)(a3 + 32) = v9;
    *(void *)(a3 + 40) = v13;
    *(void *)(a3 + 48) = v10;
    *(void *)(a3 + 56) = v11;
    *(void *)(a3 + 64) = v5;
    *(void *)(a3 + 72) = v6;
    *(unsigned char *)(a3 + 80) = v12;
    return result;
  }
  if (v4 > a2)
  {
    uint64_t v14 = result + (a2 << 6);
    uint64_t v8 = *(void *)(v14 + 32);
    uint64_t v9 = *(void *)(v14 + 40);
    unint64_t v13 = *(void *)(v14 + 48);
    uint64_t v10 = *(void *)(v14 + 56);
    uint64_t v11 = *(void *)(v14 + 64);
    uint64_t v5 = *(void *)(v14 + 72);
    uint64_t v6 = *(void *)(v14 + 80);
    uint64_t v7 = *(unsigned __int8 *)(v14 + 88);
    unint64_t result = sub_100063FAC(v8, v9, v13);
    char v12 = v7;
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_10007FDD0(uint64_t result, unint64_t a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if ((uint64_t)v2 < (uint64_t)a2)
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }
  if (v2 == a2) {
    return 0;
  }
  if ((uint64_t)(v2 - a2) > 1) {
    return 1;
  }
  if (v2 <= a2) {
    goto LABEL_16;
  }
  uint64_t v3 = result + (a2 << 6);
  int8x16_t v4 = vorrq_s8(*(int8x16_t *)(v3 + 32), *(int8x16_t *)(v3 + 56));
  int8x8_t v5 = vorr_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL));
  return *(void *)(v3 + 48) != 0x4000000000000000 || *(void *)&v5 != 0;
}

void sub_10007FE48(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *(void *)(a1 + 16);
  if (v19 < a2)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v2 = v19 - a2;
  if (v19 == a2) {
    return;
  }
  uint64_t v24 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  sub_100056F98(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    int8x8_t v5 = v24;
    uint64_t v6 = a2;
    uint64_t v7 = (unsigned char *)(a1 + (a2 << 6) + 88);
    uint64_t v18 = v2;
    while (1)
    {
      uint64_t v8 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        break;
      }
      if (v6 + v4 >= v19 || v4 >= v2) {
        goto LABEL_14;
      }
      uint64_t v9 = *((void *)v7 - 1);
      char v10 = *v7;
      long long v11 = *(_OWORD *)(v7 - 40);
      v20[0] = *(_OWORD *)(v7 - 56);
      v20[1] = v11;
      v20[2] = *(_OWORD *)(v7 - 24);
      uint64_t v21 = v9;
      char v22 = v10;
      sub_10007E1AC((uint64_t)v20, v23);
      uint64_t v13 = v23[0];
      uint64_t v12 = v23[1];
      uint64_t v24 = v5;
      unint64_t v15 = v5[2];
      unint64_t v14 = v5[3];
      if (v15 >= v14 >> 1)
      {
        sub_100056F98((char *)(v14 > 1), v15 + 1, 1);
        uint64_t v6 = a2;
        int8x8_t v5 = v24;
      }
      v5[2] = v15 + 1;
      uint64_t v16 = &v5[2 * v15];
      v16[4] = v13;
      v16[5] = v12;
      ++v4;
      v7 += 64;
      uint64_t v2 = v18;
      if (v8 == v18)
      {
        swift_bridgeObjectRelease();
        *(void *)&v20[0] = v5;
        sub_100003DD0(&qword_1000C50C8);
        sub_100067408();
        BidirectionalCollection<>.joined(separator:)();
        swift_bridgeObjectRelease();
        return;
      }
    }
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_17:
  __break(1u);
}

ValueMetadata *type metadata accessor for SplitArguments.InputIndex()
{
  return &type metadata for SplitArguments.InputIndex;
}

uint64_t destroy for ParsedArgument(void *a1, uint64_t a2)
{
  return sub_1000803E4(a1, a2, (uint64_t (*)(void, void, void, void, void))sub_10006FE04);
}

void *initializeWithCopy for ParsedArgument(void *a1, void *a2, uint64_t a3)
{
  return sub_10008012C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))sub_100063FCC);
}

uint64_t *assignWithCopy for ParsedArgument(uint64_t *a1, void *a2, uint64_t a3)
{
  return sub_1000801C4(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))sub_100063FCC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10006FE04);
}

void *assignWithTake for ParsedArgument(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100080268(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10006FE04);
}

uint64_t sub_1000800B8(uint64_t a1)
{
  return *(void *)(a1 + 16) >> 63;
}

uint64_t sub_1000800C4(uint64_t result)
{
  *(void *)(result + 16) &= ~0x8000000000000000;
  return result;
}

uint64_t sub_1000800D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = *(void *)(result + 16) & 0xC1 | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for ParsedArgument()
{
  return &type metadata for ParsedArgument;
}

uint64_t destroy for SplitArguments.Element.Value(void *a1, uint64_t a2)
{
  return sub_1000803E4(a1, a2, (uint64_t (*)(void, void, void, void, void))sub_10006FDE4);
}

void *initializeWithCopy for SplitArguments.Element.Value(void *a1, void *a2, uint64_t a3)
{
  return sub_10008012C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))sub_100063FAC);
}

void *sub_10008012C(void *a1, void *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = a2[4];
  a4(*a2, v6, v7, v8, v9);
  *a1 = v5;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  a1[4] = v9;
  return a1;
}

uint64_t *assignWithCopy for SplitArguments.Element.Value(uint64_t *a1, void *a2, uint64_t a3)
{
  return sub_1000801C4(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))sub_100063FAC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10006FDE4);
}

uint64_t *sub_1000801C4(uint64_t *a1, void *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v10 = a2[3];
  uint64_t v11 = a2[4];
  a4(*a2, v8, v9, v10, v11);
  uint64_t v12 = *a1;
  uint64_t v13 = a1[1];
  uint64_t v14 = a1[2];
  uint64_t v15 = a1[3];
  uint64_t v16 = a1[4];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v9;
  a1[3] = v10;
  a1[4] = v11;
  a5(v12, v13, v14, v15, v16);
  return a1;
}

void *assignWithTake for SplitArguments.Element.Value(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100080268(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10006FDE4);
}

void *sub_100080268(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *a1;
  uint64_t v9 = a1[1];
  uint64_t v8 = a1[2];
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v12;
  a1[4] = v6;
  a4(v7, v9, v8, v10, v11);
  return a1;
}

uint64_t _s14ArgumentParser14ParsedArgumentOwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unsigned int v2 = (*(void *)(a1 + 16) >> 3) & 0xFFFFFFE0 | (*(void *)(a1 + 16) >> 1) & 0x1F;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t sub_10008030C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)unint64_t result = 0;
      *(void *)(result + 8) = 0;
      *(void *)(result + 24) = 0;
      *(void *)(result + 32) = 0;
      *(void *)(result + 16) = (8 * -a2) & 0x7FFFFFF00 | (2 * (-a2 & 0x1FLL));
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_100080368(uint64_t a1)
{
  if (((*(void *)(a1 + 16) >> 61) & 2) != 0) {
    return (*(_DWORD *)a1 + 2);
  }
  else {
    return (*(void *)(a1 + 16) >> 61) & 3;
  }
}

uint64_t sub_100080388(uint64_t result)
{
  *(void *)(result + 16) &= 0x9FFFFFFFFFFFFFFFLL;
  return result;
}

uint64_t sub_100080398(uint64_t result, uint64_t a2)
{
  if (a2 < 2)
  {
    *(void *)(result + 16) = *(void *)(result + 16) & 0x80000000000000C1 | (a2 << 61);
  }
  else
  {
    *(void *)unint64_t result = (a2 - 2);
    *(_OWORD *)(result + 8) = xmmword_1000A3ED0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SplitArguments.Element.Value()
{
  return &type metadata for SplitArguments.Element.Value;
}

uint64_t sub_1000803E4(void *a1, uint64_t a2, uint64_t (*a3)(void, void, void, void, void))
{
  return a3(*a1, a1[1], a1[2], a1[3], a1[4]);
}

uint64_t initializeWithCopy for SplitArguments.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  sub_100063FAC(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t assignWithCopy for SplitArguments.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  sub_100063FAC(*(void *)a2, v5, v6);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  unint64_t v11 = *(void *)(a1 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  sub_10006FDE4(v9, v10, v11);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v12 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v12;
  return a1;
}

uint64_t assignWithTake for SplitArguments.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  sub_10006FDE4(v4, v5, v6);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for SplitArguments.Element(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unsigned int v2 = (*(void *)(a1 + 16) >> 3) & 0xFFFFFFE0 | (*(void *)(a1 + 16) >> 1) & 0x1F;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for SplitArguments.Element(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
      *(void *)unint64_t result = 0;
      *(void *)(result + 8) = 0;
      *(void *)(result + 24) = 0;
      *(void *)(result + 32) = 0;
      *(void *)(result + 16) = (8 * -a2) & 0x7FFFFFF00 | (2 * (-a2 & 0x1FLL));
      return result;
    }
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SplitArguments.Element()
{
  return &type metadata for SplitArguments.Element;
}

uint64_t getEnumTagSinglePayload for SplitArguments.Index(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SplitArguments.Index(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SplitArguments.Index()
{
  return &type metadata for SplitArguments.Index;
}

uint64_t destroy for SplitArguments()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s14ArgumentParser14SplitArgumentsVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SplitArguments(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for SplitArguments(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SplitArguments()
{
  return &type metadata for SplitArguments;
}

unint64_t sub_1000807D8()
{
  unint64_t result = qword_1000C5D40;
  if (!qword_1000C5D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5D40);
  }
  return result;
}

unint64_t sub_100080830()
{
  unint64_t result = qword_1000C5D48;
  if (!qword_1000C5D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5D48);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SplitArguments.SubIndex(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SplitArguments.SubIndex(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SplitArguments.SubIndex(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_1000808E8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100080904(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SplitArguments.SubIndex()
{
  return &type metadata for SplitArguments.SubIndex;
}

unint64_t sub_100080938()
{
  unint64_t result = qword_1000C5D50;
  if (!qword_1000C5D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5D50);
  }
  return result;
}

void *sub_10008098C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  __n128 v44 = _swiftEmptyArrayStorage;
  sub_100056F98(0, v1, 0);
  uint64_t v3 = 0;
  uint64_t v4 = _swiftEmptyArrayStorage;
  uint64_t v5 = a1 + 32;
  uint64_t v31 = a1 + 32;
  do
  {
    unint64_t v6 = (_OWORD *)(v5 + 192 * v3);
    long long v7 = v6[9];
    long long v40 = v6[8];
    long long v41 = v7;
    long long v8 = v6[11];
    long long v42 = v6[10];
    long long v43 = v8;
    long long v9 = v6[5];
    long long v36 = v6[4];
    long long v37 = v9;
    long long v10 = v6[7];
    long long v38 = v6[6];
    long long v39 = v10;
    long long v11 = v6[1];
    v33[0] = *v6;
    v33[1] = v11;
    long long v12 = v6[3];
    long long v34 = v6[2];
    long long v35 = v12;
    unint64_t v14 = *((void *)&v37 + 1);
    uint64_t v13 = v38;
    unint64_t v15 = BYTE7(v38) & 0xF;
    if ((v38 & 0x2000000000000000) == 0) {
      unint64_t v15 = *((void *)&v37 + 1) & 0xFFFFFFFFFFFFLL;
    }
    if (v15)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v16 = (void *)v34;
      uint64_t v17 = _swiftEmptyArrayStorage;
      if (*(void *)&v33[0] >= 2uLL) {
        uint64_t v17 = (void *)swift_bridgeObjectRetain();
      }
      uint64_t v18 = v17[2];
      if (v18)
      {
        uint64_t v19 = v17 + 4;
        do
        {
          unsigned int v20 = *((unsigned __int8 *)v19 + 16);
          if (v20 >> 6 != 1)
          {
            unint64_t v14 = *v19;
            uint64_t v13 = v19[1];
            sub_10002E940((uint64_t)v33);
            sub_1000319B8(v14, v13, v20);
            swift_bridgeObjectRelease();
            sub_10002EAFC((uint64_t)v33);
            goto LABEL_21;
          }
          v19 += 3;
          --v18;
        }
        while (v18);
        unint64_t v14 = v17[4];
        uint64_t v21 = v17[5];
        unsigned int v22 = *((unsigned __int8 *)v17 + 48);
        sub_10002E940((uint64_t)v33);
        swift_bridgeObjectRetain();
        uint64_t v32 = v21;
        sub_1000319B8(v14, v21, v22);
        swift_bridgeObjectRelease();
        if (v22 >> 6)
        {
          uint64_t v5 = v31;
          swift_bridgeObjectRelease();
          sub_10002EAFC((uint64_t)v33);
        }
        else
        {
          swift_bridgeObjectRelease();
          sub_10002EAFC((uint64_t)v33);
          uint64_t v5 = v31;
        }
        uint64_t v13 = v32;
      }
      else
      {
        sub_10002E940((uint64_t)v33);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (v16[2])
        {
          uint64_t v23 = v16[4];
          unint64_t v24 = v16[5];
          swift_bridgeObjectRetain();
          unint64_t v14 = sub_100055A44(45, 0xE100000000000000, v23, v24);
          uint64_t v26 = v25;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_10002EAFC((uint64_t)v33);
          uint64_t v13 = v26;
        }
        else
        {
          swift_bridgeObjectRelease();
          sub_10002EAFC((uint64_t)v33);
          uint64_t v13 = 0xE500000000000000;
          unint64_t v14 = 0x65756C6176;
        }
      }
    }
LABEL_21:
    __n128 v44 = v4;
    unint64_t v28 = v4[2];
    unint64_t v27 = v4[3];
    if (v28 >= v27 >> 1)
    {
      sub_100056F98((char *)(v27 > 1), v28 + 1, 1);
      uint64_t v4 = v44;
    }
    ++v3;
    v4[2] = v28 + 1;
    uint64_t v29 = &v4[2 * v28];
    _OWORD v29[4] = v14;
    v29[5] = v13;
  }
  while (v3 != v1);
  return v4;
}

void *sub_100080C54(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100056F98(0, v1, 0);
    uint64_t v3 = (uint64_t *)(a1 + 96);
    do
    {
      uint64_t v5 = *(v3 - 1);
      uint64_t v4 = *v3;
      unint64_t v7 = _swiftEmptyArrayStorage[2];
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain();
      if (v7 >= v6 >> 1) {
        sub_100056F98((char *)(v6 > 1), v7 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v7 + 1;
      long long v8 = &_swiftEmptyArrayStorage[2 * v7];
      v8[4] = v5;
      v8[5] = v4;
      v3 += 24;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

void *sub_100080D2C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100056F98(0, v1, 0);
    uint64_t v3 = (uint64_t *)(a1 + 112);
    do
    {
      uint64_t v5 = *(v3 - 1);
      uint64_t v4 = *v3;
      unint64_t v7 = _swiftEmptyArrayStorage[2];
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain();
      if (v7 >= v6 >> 1) {
        sub_100056F98((char *)(v6 > 1), v7 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v7 + 1;
      long long v8 = &_swiftEmptyArrayStorage[2 * v7];
      v8[4] = v5;
      v8[5] = v4;
      v3 += 24;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

void *sub_100080E04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_100082D60(a1, a2);
  swift_bridgeObjectRelease();
  return v2;
}

char *sub_100080E54(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = 32;
  uint64_t v4 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    unint64_t result = *(char **)(a1 + v3);
    unint64_t v6 = (unint64_t)result >= 2 ? *(void **)(a1 + v3) : _swiftEmptyArrayStorage;
    uint64_t v7 = v6[2];
    int64_t v8 = *((void *)v4 + 2);
    int64_t v9 = v8 + v7;
    if (__OFADD__(v8, v7)) {
      break;
    }
    sub_10002EA30((unint64_t)result);
    unint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (result && v9 <= *((void *)v4 + 3) >> 1)
    {
      if (v6[2]) {
        goto LABEL_17;
      }
    }
    else
    {
      if (v8 <= v9) {
        int64_t v10 = v8 + v7;
      }
      else {
        int64_t v10 = v8;
      }
      unint64_t result = sub_10005FB94(result, v10, 1, v4);
      uint64_t v4 = result;
      if (v6[2])
      {
LABEL_17:
        if ((*((void *)v4 + 3) >> 1) - *((void *)v4 + 2) < v7) {
          goto LABEL_26;
        }
        unint64_t result = (char *)swift_arrayInitWithCopy();
        if (v7)
        {
          uint64_t v11 = *((void *)v4 + 2);
          BOOL v12 = __OFADD__(v11, v7);
          uint64_t v13 = v11 + v7;
          if (v12) {
            goto LABEL_27;
          }
          *((void *)v4 + 2) = v13;
        }
        goto LABEL_4;
      }
    }
    if (v7) {
      goto LABEL_25;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    v3 += 192;
    if (!--v1)
    {
      swift_bridgeObjectRelease();
      return v4;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

char *sub_100080FA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v2 = (uint64_t *)(swift_bridgeObjectRetain() + 56);
  uint64_t v3 = (char *)_swiftEmptyArrayStorage;
  do
  {
    uint64_t v5 = *v2;
    if (*v2)
    {
      uint64_t v6 = *(v2 - 1);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_10005FA90(0, *((void *)v3 + 2) + 1, 1, v3);
      }
      unint64_t v8 = *((void *)v3 + 2);
      unint64_t v7 = *((void *)v3 + 3);
      if (v8 >= v7 >> 1) {
        uint64_t v3 = sub_10005FA90((char *)(v7 > 1), v8 + 1, 1, v3);
      }
      *((void *)v3 + 2) = v8 + 1;
      uint64_t v4 = &v3[16 * v8];
      *((void *)v4 + 4) = v6;
      *((void *)v4 + 5) = v5;
    }
    v2 += 24;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1000810AC()
{
  uint64_t v1 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for JSONEncoder.OutputFormatting();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = &v21[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  unint64_t v8 = &v21[-v7];
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  static JSONEncoder.OutputFormatting.prettyPrinted.getter();
  dispatch thunk of JSONEncoder.outputFormatting.setter();
  static JSONEncoder.OutputFormatting.sortedKeys.getter();
  int64_t v9 = (void (*)(_OWORD *, void))dispatch thunk of JSONEncoder.outputFormatting.modify();
  sub_100081334(v8, (uint64_t)v6);
  int64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v10(v8, v2);
  v9(v22, 0);
  long long v11 = v0[3];
  v22[2] = v0[2];
  v22[3] = v11;
  long long v12 = v0[5];
  _OWORD v22[4] = v0[4];
  v22[5] = v12;
  long long v13 = v0[1];
  v22[0] = *v0;
  v22[1] = v13;
  sub_10008160C((uint64_t)v0);
  sub_100081694();
  uint64_t v14 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v16 = v15;
  sub_1000816E8((uint64_t)v0);
  static String.Encoding.utf8.getter();
  uint64_t v17 = String.init(data:encoding:)();
  if (v18)
  {
    uint64_t v19 = v17;
    sub_10001C0D0(v14, v16);
    swift_release();
  }
  else
  {
    sub_10001C0D0(v14, v16);
    swift_release();
    return 0;
  }
  return v19;
}

uint64_t sub_100081334(char *a1, uint64_t a2)
{
  unint64_t v28 = a1;
  uint64_t v4 = sub_100003DD0(&qword_1000C5D60);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v26 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v23 - v7;
  uint64_t v9 = type metadata accessor for JSONEncoder.OutputFormatting();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  long long v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v23 - v14;
  unint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v25 = v2;
  v16(v13, v2, v9);
  uint64_t v23 = sub_100081770(&qword_1000C5D68);
  dispatch thunk of SetAlgebra.intersection(_:)();
  sub_100081770(&qword_1000C5D70);
  uint64_t v24 = a2;
  char v17 = dispatch thunk of static Equatable.== infix(_:_:)() ^ 1;
  uint64_t v27 = v4;
  uint64_t v18 = &v8[*(int *)(v4 + 48)];
  unsigned char *v8 = v17 & 1;
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    uint64_t v20 = v24;
    v16(v18, v24, v9);
    v16(v13, v20, v9);
    dispatch thunk of SetAlgebra.formUnion(_:)();
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  }
  else
  {
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v19(v18, v15, v9);
  }
  uint64_t v21 = &v26[*(int *)(v27 + 48)];
  v19(v21, v18, v9);
  v19(v28, v21, v9);
  return v17 & 1;
}

uint64_t sub_10008160C(uint64_t a1)
{
  return a1;
}

unint64_t sub_100081694()
{
  unint64_t result = qword_1000C5D58;
  if (!qword_1000C5D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5D58);
  }
  return result;
}

uint64_t sub_1000816E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100081770(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for JSONEncoder.OutputFormatting();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_1000817B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v20 = sub_100053C7C(*(void *)(a1 + 16 * v1 + 16), *(void *)(*(void *)(a1 + 16 * v1 + 24) + 8), 2, 0, 0, 0);
    uint64_t v21 = v3;
    sub_1000340B8(a1, (uint64_t)v22);
    sub_10002B998((uint64_t)v22, (uint64_t)v19, &qword_1000C5148);
    sub_10002B998((uint64_t)v22, (uint64_t)v33, &qword_1000C5148);
    if (sub_1000353CC((uint64_t)v33) != 1)
    {
      sub_10002B998((uint64_t)v19, (uint64_t)&v34, &qword_1000C5148);
      v51[8] = v42;
      v51[9] = v43;
      v51[10] = v44;
      v51[11] = v45;
      v51[4] = v38;
      v51[5] = v39;
      v51[6] = v40;
      v51[7] = v41;
      v51[0] = v34;
      v51[1] = v35;
      v51[2] = v36;
      v51[3] = v37;
      sub_100069D00((uint64_t)v51);
      sub_1000353E4((uint64_t)v22);
    }
    uint64_t v4 = sub_100033E90(0, a1);
    if (*(void *)(v4 + 16))
    {
      v46[0] = 0xD000000000000016;
      v46[1] = 0x80000001000A9300;
      long long v47 = xmmword_1000A3EC0;
      uint64_t v49 = 0;
      uint64_t v48 = 0;
      char v50 = 0;
      sub_10006746C((uint64_t)_swiftEmptyArrayStorage, 1, (uint64_t)v46, 0, 0, 0, 0xE000000000000000, (uint64_t)_swiftEmptyArrayStorage, (uint64_t)&v23, 0);
      *(void *)uint64_t v7 = v4;
      *(_OWORD *)&v7[8] = v23;
      *(void *)&v7[24] = v24;
      long long v8 = v25;
      LOBYTE(v9) = v26;
      *((void *)&v9 + 1) = v27;
      long long v10 = v28;
      long long v11 = v29;
      *(void *)&long long v12 = v30;
      BYTE8(v12) = v31;
      long long v13 = v32;
      long long v14 = 0uLL;
      LOWORD(v15) = 4;
      *((void *)&v15 + 1) = String.init(argument:);
      *(void *)&long long v16 = 0;
      BYTE8(v16) = 0;
      char v17 = String.init(argument:);
      uint64_t v18 = 0;
      long long v36 = v25;
      long long v37 = v9;
      long long v34 = *(_OWORD *)v7;
      long long v35 = *(_OWORD *)&v7[16];
      long long v41 = v32;
      long long v39 = v29;
      long long v40 = v12;
      long long v38 = v28;
      long long v45 = (unint64_t)String.init(argument:);
      long long v44 = v16;
      long long v43 = v15;
      long long v42 = 0uLL;
      sub_100069D00((uint64_t)&v34);
      sub_10002EAFC((uint64_t)v7);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    return (void *)v20;
  }
  else
  {
    uint64_t v5 = _swiftEmptyArrayStorage;
    sub_100083AB4((uint64_t)_swiftEmptyArrayStorage);
  }
  return v5;
}

uint64_t sub_100081A48(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = _swiftEmptyArrayStorage;
  v116 = _swiftEmptyArrayStorage;
  unint64_t v117 = sub_100083AB4((uint64_t)_swiftEmptyArrayStorage);
  int64_t v5 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v76 = a2;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v5)
  {
LABEL_87:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v4;
  }
  int64_t v7 = 0;
  unint64_t v80 = a1 + 32;
  unint64_t v78 = a1;
  int64_t v79 = v5;
  while (1)
  {
    if (v7 >= v5)
    {
      __break(1u);
LABEL_89:
      __break(1u);
LABEL_90:
      __break(1u);
      goto LABEL_91;
    }
    if (v7 < 0) {
      goto LABEL_89;
    }
    int64_t v17 = *(void *)(a1 + 16);
    if (v7 >= (unint64_t)v17) {
      goto LABEL_90;
    }
    uint64_t v18 = (long long *)(v80 + 192 * v7);
    long long v19 = v18[9];
    long long v113 = v18[8];
    *(_OWORD *)v114 = v19;
    long long v20 = v18[11];
    *(_OWORD *)&v114[16] = v18[10];
    long long v115 = v20;
    long long v21 = v18[5];
    long long v109 = v18[4];
    long long v110 = v21;
    long long v22 = v18[7];
    long long v111 = v18[6];
    long long v112 = v22;
    long long v23 = v18[1];
    long long v105 = *v18;
    long long v106 = v23;
    long long v24 = v18[3];
    long long v107 = v18[2];
    long long v108 = v24;
    char v25 = v24;
    unint64_t v26 = v7 + 1;
    uint64_t v27 = *((void *)&v106 + 1);
    unint64_t v81 = v110;
    unint64_t v28 = v109;
    unint64_t v29 = v111;
    long long v89 = *(_OWORD *)&v114[8];
    long long v90 = v113;
    long long v91 = v115;
    long long v92 = v107;
    char v88 = BYTE8(v111);
    uint64_t v86 = *((void *)&v112 + 1);
    uint64_t v87 = v112;
    char v84 = v114[1];
    char v85 = v114[0];
    char v83 = v114[24];
    uint64_t v82 = *((void *)&v105 + 1);
    unint64_t v93 = v105;
    if (v24 != 1)
    {
      uint64_t v8 = *((void *)&v108 + 1);
      unint64_t v9 = a1;
      uint64_t v10 = v106;
      uint64_t v11 = *((void *)&v110 + 1);
      uint64_t v12 = *((void *)&v109 + 1);
      sub_10002E940((uint64_t)&v105);
      uint64_t v13 = v27;
      int64_t v14 = v26;
      uint64_t v15 = v10;
      a1 = v9;
      unint64_t v16 = v81;
      goto LABEL_4;
    }
    if (v26 != v5) {
      break;
    }
    int64_t v14 = v5;
LABEL_54:
    sub_100003DD0(&qword_1000C5230);
    uint64_t result = swift_initStackObject();
    *(_OWORD *)(result + 16) = xmmword_1000A2660;
    unint64_t v49 = v105;
    long long v51 = v111;
    long long v50 = v112;
    long long v52 = v110;
    *(_OWORD *)(result + 96) = v109;
    *(_OWORD *)(result + 112) = v52;
    long long v54 = v107;
    long long v53 = v108;
    long long v55 = v106;
    *(_OWORD *)(result + 32) = v105;
    *(_OWORD *)(result + 48) = v55;
    long long v57 = *(_OWORD *)&v114[16];
    long long v56 = v115;
    long long v58 = *(_OWORD *)v114;
    *(_OWORD *)(result + 160) = v113;
    *(_OWORD *)(result + 176) = v58;
    *(_OWORD *)(result + 192) = v57;
    *(_OWORD *)(result + 208) = v56;
    *(_OWORD *)(result + 128) = v51;
    *(_OWORD *)(result + 144) = v50;
    *(_OWORD *)(result + 64) = v54;
    *(_OWORD *)(result + 80) = v53;
    if (v14 <= v7) {
      goto LABEL_94;
    }
    if (v5 < v14) {
      goto LABEL_95;
    }
    *(void *)&long long v94 = result;
    sub_10002E940((uint64_t)&v105);
    sub_10002E940((uint64_t)&v105);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10005EEA4(v26, v14, a1, v76);
    uint64_t v59 = v94;
    if (v49 >= 2)
    {
      long long v60 = sub_100080E54(v94);
      sub_10002EBEC(v93);
      unint64_t v93 = (unint64_t)v60;
    }
    v61 = sub_10008098C(v59);
    uint64_t v62 = v61[2];
    if (v62)
    {
      char v63 = v61 + 5;
      while (1)
      {
        uint64_t v11 = *(v63 - 1);
        unint64_t v29 = *v63;
        uint64_t v64 = HIBYTE(*v63) & 0xF;
        if ((*v63 & 0x2000000000000000) == 0) {
          uint64_t v64 = v11 & 0xFFFFFFFFFFFFLL;
        }
        if (v64) {
          break;
        }
        v63 += 2;
        if (!--v62) {
          goto LABEL_64;
        }
      }
      swift_bridgeObjectRetain();
    }
    else
    {
LABEL_64:
      uint64_t v11 = 0;
      unint64_t v29 = 0xE000000000000000;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v65 = sub_100080FA8(v59);
    if (*((void *)v65 + 2))
    {
      uint64_t v15 = *((void *)v65 + 4);
      uint64_t v66 = *((void *)v65 + 5);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v66 = 0;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v67 = sub_100080C54(v59);
    uint64_t v68 = v67[2];
    if (v68)
    {
      v69 = v67 + 5;
      while (1)
      {
        uint64_t v8 = *(v69 - 1);
        unint64_t v28 = *v69;
        uint64_t v70 = HIBYTE(*v69) & 0xF;
        if ((*v69 & 0x2000000000000000) == 0) {
          uint64_t v70 = v8 & 0xFFFFFFFFFFFFLL;
        }
        if (v70) {
          break;
        }
        v69 += 2;
        if (!--v68) {
          goto LABEL_75;
        }
      }
      swift_bridgeObjectRetain();
    }
    else
    {
LABEL_75:
      uint64_t v8 = 0;
      unint64_t v28 = 0xE000000000000000;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v71 = sub_100080D2C(v59);
    swift_bridgeObjectRelease();
    uint64_t v72 = v71[2];
    if (v72)
    {
      v73 = v71 + 5;
      while (1)
      {
        uint64_t v12 = *(v73 - 1);
        unint64_t v74 = *v73;
        uint64_t v75 = HIBYTE(*v73) & 0xF;
        if ((*v73 & 0x2000000000000000) == 0) {
          uint64_t v75 = v12 & 0xFFFFFFFFFFFFLL;
        }
        if (v75) {
          break;
        }
        v73 += 2;
        if (!--v72) {
          goto LABEL_83;
        }
      }
      swift_bridgeObjectRetain();
    }
    else
    {
LABEL_83:
      uint64_t v12 = 0;
      unint64_t v74 = 0xE000000000000000;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v16 = v74;
    a1 = v78;
    char v25 = 1;
    uint64_t v13 = v66;
LABEL_4:
    *(void *)&long long v94 = v93;
    *((void *)&v94 + 1) = v82;
    *(void *)&long long v95 = v15;
    *((void *)&v95 + 1) = v13;
    long long v96 = v92;
    LOBYTE(v97) = v25 & 1;
    *((void *)&v97 + 1) = v8;
    *(void *)&long long v98 = v28;
    *((void *)&v98 + 1) = v12;
    *(void *)&long long v99 = v16;
    *((void *)&v99 + 1) = v11;
    *(void *)&long long v100 = v29;
    BYTE8(v100) = v88;
    *(void *)&long long v101 = v87;
    *((void *)&v101 + 1) = v86;
    long long v102 = v90;
    v103[0] = v85;
    v103[1] = v84;
    *(_OWORD *)&v103[8] = v89;
    v103[24] = v83 & 1;
    long long v104 = v91;
    v118[0] = v94;
    v118[1] = v95;
    v118[9] = *(_OWORD *)v103;
    v118[2] = v92;
    v118[3] = v97;
    v118[7] = v101;
    v118[8] = v90;
    v118[5] = v99;
    v118[6] = v100;
    v118[4] = v98;
    v118[11] = v91;
    v118[10] = *(_OWORD *)&v103[16];
    sub_10002E940((uint64_t)&v94);
    sub_100069D00((uint64_t)v118);
    sub_10002EAFC((uint64_t)&v94);
    uint64_t result = sub_10002EAFC((uint64_t)&v94);
    int64_t v7 = v14;
    int64_t v5 = v79;
    if (v14 == v79)
    {
      uint64_t v4 = v116;
      goto LABEL_87;
    }
  }
  uint64_t v30 = *(void *)(v107 + 16);
  int64_t v77 = v17;
  uint64_t v31 = v107 + 32;
  int64_t v14 = v7 + 1;
  while (v14 < v5)
  {
    if (v14 >= v17) {
      goto LABEL_92;
    }
    uint64_t v32 = *(void *)(v80 + 192 * v14 + 32);
    if (*(void *)(v32 + 16) != v30) {
      goto LABEL_52;
    }
    if (v30 && v32 != (void)v92)
    {
      uint64_t v33 = 0;
      uint64_t v34 = v32 + 32;
      while (1)
      {
        long long v35 = (uint64_t *)(v34 + 24 * v33);
        uint64_t result = *v35;
        long long v36 = (void *)v35[2];
        long long v37 = (void *)(v31 + 24 * v33);
        long long v38 = (void *)v37[2];
        if (*v35 != *v37 || v35[1] != v37[1])
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            break;
          }
        }
        uint64_t v40 = v36[2];
        if (v40 != v38[2]) {
          break;
        }
        if (v40) {
          BOOL v41 = v36 == v38;
        }
        else {
          BOOL v41 = 1;
        }
        if (!v41)
        {
          uint64_t result = v36[4];
          if (result != v38[4] || v36[5] != v38[5])
          {
            uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              break;
            }
          }
          if (v40 != 1)
          {
            uint64_t result = v36[6];
            if (result != v38[6] || v36[7] != v38[7])
            {
              uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
              if ((result & 1) == 0) {
                break;
              }
            }
            uint64_t v44 = v40 - 2;
            if (v44)
            {
              long long v45 = v38 + 9;
              uint64_t v46 = v36 + 9;
              do
              {
                uint64_t result = *(v46 - 1);
                if (result != *(v45 - 1) || *v46 != *v45)
                {
                  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
                  if ((result & 1) == 0) {
                    goto LABEL_53;
                  }
                }
                v45 += 2;
                v46 += 2;
              }
              while (--v44);
            }
          }
        }
        if (++v33 == v30) {
          goto LABEL_49;
        }
      }
LABEL_53:
      a1 = v78;
      int64_t v5 = v79;
      unint64_t v26 = v7 + 1;
      goto LABEL_54;
    }
LABEL_49:
    if (__OFADD__(v14++, 1)) {
      goto LABEL_93;
    }
    int64_t v5 = v79;
    unint64_t v26 = v7 + 1;
    int64_t v17 = v77;
    if (v14 == v79)
    {
      int64_t v14 = v79;
LABEL_52:
      a1 = v78;
      goto LABEL_54;
    }
  }
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
  return result;
}

uint64_t sub_100082130@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  void (*v18)(_OWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t i;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  uint64_t v46;
  uint64_t v47;
  long long v48;
  uint64_t v49;
  unint64_t v50;
  long long v51;
  long long v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  uint64_t v56;
  void (*v57)(_OWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v59;
  void *v60;
  void v61[2];
  uint64_t v62;
  void v63[14];
  uint64_t v64;
  void v65[17];
  void v66[17];
  _OWORD v67[2];
  long long v68;
  long long v69;
  long long v70;
  long long v71;
  long long v72;
  long long v73;
  uint64_t v74;
  void v75[17];
  _OWORD v76[5];
  uint64_t v77;
  unsigned char v78[136];
  unsigned char v79[136];
  unsigned char v80[16];
  unsigned char v81[16];
  _OWORD v82[12];
  uint64_t v83;
  uint64_t v84;
  void v85[4];

  uint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    uint64_t v3 = result;
    uint64_t v4 = v2 - 1;
    BOOL v9 = v2 == 1;
    uint64_t v5 = result + 16 * (v2 - 1);
    uint64_t v7 = *(void *)(v5 + 32);
    uint64_t v6 = *(void *)(v5 + 40);
    int64_t v8 = v4 & 0x7FFFFFFFFFFFFFFFLL;
    BOOL v9 = v9 || v8 == 0;
    uint64_t v59 = *(void *)(v5 + 40);
    if (v9)
    {
      long long v60 = _swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(void *)&v82[0] = _swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
      sub_100056F98(0, v8, 0);
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v11 = v3 + 40;
      do
      {
        uint64_t v12 = (*(uint64_t (**)(void))(*(void *)v11 + 24))();
        uint64_t v14 = v13;
        *(void *)&v82[0] = v10;
        unint64_t v16 = v10[2];
        unint64_t v15 = v10[3];
        if (v16 >= v15 >> 1)
        {
          sub_100056F98((char *)(v15 > 1), v16 + 1, 1);
          uint64_t v10 = *(void **)&v82[0];
        }
        v10[2] = v16 + 1;
        int64_t v17 = &v10[2 * v16];
        v17[4] = v12;
        v17[5] = v14;
        v11 += 16;
        --v8;
      }
      while (v8);
      long long v60 = v10;
      (*(void (**)(void *__return_ptr))(*(void *)(v3 + 40) + 16))(v61);
      sub_10002B998((uint64_t)&v62, (uint64_t)v81, &qword_1000C5110);
      sub_10002FB5C((uint64_t)v81);
      sub_10002DDE4((uint64_t)v61);
      sub_10002B998((uint64_t)v81, (uint64_t)&v83, &qword_1000C5110);
      uint64_t v6 = v59;
      if (v84) {
        sub_100082700(0, 0, v83, v84);
      }
    }
    uint64_t v18 = *(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t))(v6 + 16);
    v18(v63, v7, v6);
    sub_10002DDE4((uint64_t)v63);
    sub_10002B998((uint64_t)&v64, (uint64_t)v80, &qword_1000C5720);
    sub_10002B998((uint64_t)v80, (uint64_t)v85, &qword_1000C5720);
    if (v85[0])
    {
      (*(void (**)(void *__return_ptr))(v85[1] + 16))(v65);
      long long v55 = v65[1];
      long long v56 = v65[0];
      swift_bridgeObjectRetain();
      sub_10002DDE4((uint64_t)v65);
    }
    else
    {
      long long v55 = 0;
      long long v56 = 0;
    }
    long long v57 = v18;
    v18(v66, v7, v6);
    long long v19 = v66[13];
    swift_bridgeObjectRetain();
    sub_10002DDE4((uint64_t)v66);
    swift_bridgeObjectRetain();
    long long v54 = sub_100080E04(v19, v3);
    swift_bridgeObjectRelease();
    long long v20 = sub_1000817B4(v3);
    long long v22 = v21;
    swift_bridgeObjectRelease();
    long long v23 = sub_100081A48((unint64_t)v20, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v24 = *(void *)(v23 + 16);
    if (v24)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v25 = v24 - 1;
      unint64_t v26 = (char *)_swiftEmptyArrayStorage;
      for (uint64_t i = 32; ; i += 192)
      {
        unint64_t v28 = *(_OWORD *)(v23 + i);
        unint64_t v29 = *(_OWORD *)(v23 + i + 16);
        uint64_t v30 = *(_OWORD *)(v23 + i + 32);
        v82[3] = *(_OWORD *)(v23 + i + 48);
        v82[2] = v30;
        v82[1] = v29;
        v82[0] = v28;
        uint64_t v31 = *(_OWORD *)(v23 + i + 64);
        uint64_t v32 = *(_OWORD *)(v23 + i + 80);
        uint64_t v33 = *(_OWORD *)(v23 + i + 96);
        v82[7] = *(_OWORD *)(v23 + i + 112);
        v82[6] = v33;
        v82[5] = v32;
        v82[4] = v31;
        uint64_t v34 = *(_OWORD *)(v23 + i + 128);
        long long v35 = *(_OWORD *)(v23 + i + 144);
        long long v36 = *(_OWORD *)(v23 + i + 160);
        v82[11] = *(_OWORD *)(v23 + i + 176);
        v82[10] = v36;
        v82[9] = v35;
        v82[8] = v34;
        sub_10002E940((uint64_t)v82);
        sub_1000829A4((uint64_t)v82, (uint64_t)v78);
        sub_10002B998((uint64_t)v78, (uint64_t)v75, &qword_1000C5D78);
        sub_10002EAFC((uint64_t)v82);
        sub_10002B998((uint64_t)v78, (uint64_t)v79, &qword_1000C5D78);
        if (sub_100082D0C((uint64_t)v79) != 1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v26 = sub_100060868(0, *((void *)v26 + 2) + 1, 1, v26);
          }
          long long v38 = *((void *)v26 + 2);
          long long v37 = *((void *)v26 + 3);
          if (v38 >= v37 >> 1) {
            unint64_t v26 = sub_100060868((char *)(v37 > 1), v38 + 1, 1, v26);
          }
          sub_10002B998((uint64_t)v75, (uint64_t)v67, &qword_1000C5D78);
          *((void *)v26 + 2) = v38 + 1;
          long long v39 = &v26[136 * v38];
          *((_OWORD *)v39 + 2) = v67[0];
          uint64_t v40 = v70;
          long long v42 = v67[1];
          BOOL v41 = v68;
          *((_OWORD *)v39 + 5) = v69;
          *((_OWORD *)v39 + 6) = v40;
          *((_OWORD *)v39 + 3) = v42;
          *((_OWORD *)v39 + 4) = v41;
          uint64_t v44 = v72;
          long long v43 = v73;
          long long v45 = v71;
          *((void *)v39 + 20) = v74;
          *((_OWORD *)v39 + 8) = v44;
          *((_OWORD *)v39 + 9) = v43;
          *((_OWORD *)v39 + 7) = v45;
        }
        if (!v25) {
          break;
        }
        --v25;
      }
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v26 = (char *)_swiftEmptyArrayStorage;
    }
    long long v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v59 + 24))(v7, v59);
    long long v47 = v46;
    v57(v67, v7, v59);
    uint64_t v48 = v68;
    swift_bridgeObjectRetain();
    sub_10002DDE4((uint64_t)v67);
    v57(v75, v7, v59);
    unint64_t v49 = v75[8];
    long long v50 = v75[9];
    swift_bridgeObjectRetain();
    sub_10002DDE4((uint64_t)v75);
    CommandInfoV0.init(superCommands:commandName:abstract:discussion:defaultSubcommand:subcommands:arguments:)((uint64_t)v60, v53, v47, v48, *((unint64_t *)&v48 + 1), v49, v50, v56, v76, v55, (uint64_t)v54, (uint64_t)v26);
    uint64_t result = swift_unknownObjectRelease();
    long long v51 = v76[3];
    *(_OWORD *)(a2 + 32) = v76[2];
    *(_OWORD *)(a2 + 48) = v51;
    *(_OWORD *)(a2 + 64) = v76[4];
    *(void *)(a2 + 80) = v77;
    long long v52 = v76[1];
    *(_OWORD *)a2 = v76[0];
    *(_OWORD *)(a2 + 16) = v52;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000826C0(uint64_t result, uint64_t a2)
{
  if ((result & 0x8000000000000000) == 0) {
    return a2;
  }
  __break(1u);
  return result;
}

unint64_t sub_100082700(unint64_t result, int64_t a2, uint64_t a3, uint64_t a4)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v6 = *v4;
  int64_t v7 = *((void *)*v4 + 2);
  if (v7 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v8 = result;
  unint64_t v9 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  int64_t v11 = v7 + v10;
  if (__OFADD__(v7, v10))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v11 > *((void *)v6 + 3) >> 1)
  {
    if (v7 <= v11) {
      int64_t v15 = v7 + v10;
    }
    else {
      int64_t v15 = v7;
    }
    uint64_t v6 = sub_10005FA90(isUniquelyReferenced_nonNull_native, v15, 1, v6);
  }
  unint64_t v16 = &v6[16 * v8 + 32];
  uint64_t result = swift_arrayDestroy();
  if (!v10) {
    goto LABEL_19;
  }
  uint64_t v17 = *((void *)v6 + 2);
  BOOL v18 = __OFSUB__(v17, a2);
  uint64_t v19 = v17 - a2;
  if (v18) {
    goto LABEL_25;
  }
  uint64_t result = (unint64_t)(v16 + 16);
  long long v20 = &v6[16 * a2 + 32];
  if (v16 + 16 != v20 || result >= (unint64_t)&v20[16 * v19]) {
    uint64_t result = (unint64_t)memmove((void *)result, v20, 16 * v19);
  }
  uint64_t v21 = *((void *)v6 + 2);
  BOOL v18 = __OFADD__(v21, v10);
  uint64_t v22 = v21 + v10;
  if (!v18)
  {
    *((void *)v6 + 2) = v22;
LABEL_19:
    *(void *)unint64_t v16 = a3;
    *((void *)v16 + 1) = a4;
    *uint64_t v4 = v6;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

_OWORD *sub_100082830(void *a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = malloc(0x240uLL);
  *a1 = result;
  if (a2 < a3 || a2 >= a4)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (a2 < 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(void *)(a5 + 16) > (unint64_t)a2)
  {
    int64_t v11 = (_OWORD *)(a5 + 192 * a2);
    long long v13 = v11[10];
    long long v12 = v11[11];
    long long v14 = v11[9];
    result[8] = v13;
    result[9] = v12;
    long long v15 = v11[11];
    long long v17 = v11[12];
    long long v16 = v11[13];
    result[10] = v17;
    result[11] = v16;
    long long v19 = v11[6];
    long long v18 = v11[7];
    long long v20 = v11[5];
    result[4] = v19;
    result[5] = v18;
    long long v21 = v11[7];
    long long v23 = v11[8];
    long long v22 = v11[9];
    result[6] = v23;
    result[7] = v22;
    long long v24 = v11[3];
    *uint64_t result = v11[2];
    result[1] = v24;
    long long v25 = v11[5];
    long long v27 = v11[2];
    long long v26 = v11[3];
    long long v28 = v11[4];
    result[2] = v28;
    result[3] = v25;
    result[20] = v13;
    result[21] = v15;
    long long v29 = v11[13];
    result[22] = v17;
    result[23] = v29;
    result[16] = v19;
    result[17] = v21;
    result[18] = v23;
    result[19] = v14;
    result[12] = v27;
    result[13] = v26;
    result[14] = v28;
    result[15] = v20;
    sub_10002E940((uint64_t)result);
    return sub_100082938;
  }
LABEL_8:
  __break(1u);
  return result;
}

void sub_100082938(_OWORD **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (uint64_t)(*a1 + 24);
  long long v3 = v1[21];
  v1[32] = v1[20];
  v1[33] = v3;
  long long v4 = v1[23];
  v1[34] = v1[22];
  v1[35] = v4;
  long long v5 = v1[17];
  v1[28] = v1[16];
  v1[29] = v5;
  long long v6 = v1[19];
  v1[30] = v1[18];
  v1[31] = v6;
  long long v7 = v1[13];
  v1[24] = v1[12];
  v1[25] = v7;
  long long v8 = v1[15];
  v1[26] = v1[14];
  v1[27] = v8;
  sub_10002EAFC(v2);

  free(v1);
}

uint64_t sub_1000829A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v4 = *(void **)a1;
  if (*(void *)a1)
  {
    if (v4 == (void *)1)
    {
      sub_100082D30((uint64_t)v50);
      sub_10002B998((uint64_t)v50, (uint64_t)v55, &qword_1000C5D78);
      return sub_10002B998((uint64_t)v55, a2, &qword_1000C5D78);
    }
    sub_10002EAA0(a1 + 152, (uint64_t)v53);
    sub_10002EAA0((uint64_t)v53, (uint64_t)v54);
    if (v54[16]) {
      char v5 = 1;
    }
    else {
      char v5 = 2;
    }
    char v47 = v5;
  }
  else
  {
    char v47 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v45 = *(void *)(a1 + 24);
  uint64_t v46 = *(void *)(a1 + 16);
  uint64_t v43 = *(void *)(a1 + 40);
  unint64_t v40 = *(void *)(a1 + 64);
  uint64_t v41 = *(void *)(a1 + 56);
  uint64_t v39 = *(void *)(a1 + 72);
  long long v51 = *(_OWORD *)(a1 + 88);
  unint64_t v7 = *(void *)(a1 + 120);
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v8 = *(void *)(a1 + 112) & 0xFFFFFFFFFFFFLL;
  }
  int v9 = *(unsigned __int8 *)(a1 + 104);
  if (v8)
  {
    uint64_t v44 = *(void *)(a1 + 112);
    unint64_t v42 = *(void *)(a1 + 120);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v44 = 0;
    unint64_t v42 = 0;
  }
  unint64_t v10 = _swiftEmptyArrayStorage;
  if ((unint64_t)v4 >= 2)
  {
    swift_bridgeObjectRetain();
    unint64_t v10 = v4;
  }
  int64_t v11 = v10[2];
  uint64_t v48 = a2;
  if (v11)
  {
    int v34 = v9;
    unint64_t v35 = (unint64_t)v4;
    char v37 = v6;
    v55[0] = _swiftEmptyArrayStorage;
    sub_100057128(0, v11, 0);
    long long v12 = (void *)v55[0];
    long long v13 = (unsigned __int8 *)(v10 + 6);
    do
    {
      uint64_t v14 = *((void *)v13 - 2);
      uint64_t v15 = *((void *)v13 - 1);
      unsigned int v16 = *v13;
      sub_1000319B8(v14, v15, *v13);
      v55[0] = v12;
      unint64_t v18 = v12[2];
      unint64_t v17 = v12[3];
      if (v18 >= v17 >> 1)
      {
        sub_100057128((char *)(v17 > 1), v18 + 1, 1);
        long long v12 = (void *)v55[0];
      }
      v12[2] = v18 + 1;
      long long v19 = &v12[3 * v18];
      *((unsigned char *)v19 + 32) = v16 >> 6;
      v13 += 24;
      v19[5] = v14;
      v19[6] = v15;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    long long v4 = (void *)v35;
    LOBYTE(v6) = v37;
    int v9 = v34;
    if (v35 < 2) {
      goto LABEL_22;
    }
LABEL_24:
    swift_bridgeObjectRetain();
    goto LABEL_25;
  }
  swift_bridgeObjectRelease();
  long long v12 = _swiftEmptyArrayStorage;
  if ((unint64_t)v4 >= 2) {
    goto LABEL_24;
  }
LABEL_22:
  long long v4 = _swiftEmptyArrayStorage;
LABEL_25:
  uint64_t v20 = sub_100065334((uint64_t)v4);
  uint64_t v22 = v21;
  unsigned __int8 v24 = v23;
  unsigned int v25 = v23;
  swift_bridgeObjectRelease();
  if (v25 <= 0xFD) {
    uint64_t v26 = v24 >> 6;
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t v38 = v26;
  if (v25 <= 0xFD) {
    uint64_t v27 = v20;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v36 = v27;
  if (v25 <= 0xFD) {
    uint64_t v28 = v22;
  }
  else {
    uint64_t v28 = 0;
  }
  long long v52 = v51;
  uint64_t v29 = v51 & 0xFFFFFFFFFFFFLL;
  if ((*((void *)&v51 + 1) & 0x2000000000000000) != 0) {
    uint64_t v29 = HIBYTE(*((void *)&v51 + 1)) & 0xFLL;
  }
  if (v29)
  {
    long long v49 = v51;
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1000655C4((void *)a1, (unint64_t *)&v49);
    sub_100031A24((uint64_t)&v52);
  }
  long long v30 = v49;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v31 = swift_bridgeObjectRetain();
  ArgumentInfoV0.init(kind:shouldDisplay:sectionTitle:isOptional:isRepeating:names:preferredName:valueName:defaultValue:allValues:abstract:discussion:)(v47, v9 == 0, v44, v42, v6 & 1, (v6 & 2) != 0, (uint64_t)v12, v38, (uint64_t)v50, v36, v28, v30, *((unint64_t *)&v30 + 1), v46, v45, v43, v41, v40, v39,
    v31);
  v32._unint64_t countAndFlagsBits = (uint64_t)v50;
  String.init(argument:)(v32);
  sub_10002B998((uint64_t)v50, (uint64_t)v55, &qword_1000C5D78);
  a2 = v48;
  return sub_10002B998((uint64_t)v55, a2, &qword_1000C5D78);
}

uint64_t sub_100082D0C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

double sub_100082D30(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 1;
  double result = 0.0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  return result;
}

void *sub_100082D60(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_1000570E8(0, v2, 0);
    char v5 = (long long *)(a1 + 32);
    do
    {
      long long v18 = *v5;
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v7 = (char *)a2;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        unint64_t v7 = sub_10005FFD8(0, *(void *)(a2 + 16) + 1, 1, (char *)a2);
      }
      unint64_t v9 = *((void *)v7 + 2);
      unint64_t v8 = *((void *)v7 + 3);
      if (v9 >= v8 >> 1) {
        unint64_t v7 = sub_10005FFD8((char *)(v8 > 1), v9 + 1, 1, v7);
      }
      *((void *)v7 + 2) = v9 + 1;
      *(_OWORD *)&v7[16 * v9 + 32] = v18;
      sub_100082130(v19, v7);
      unint64_t v11 = _swiftEmptyArrayStorage[2];
      unint64_t v10 = _swiftEmptyArrayStorage[3];
      if (v11 >= v10 >> 1) {
        sub_1000570E8((char *)(v10 > 1), v11 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v11 + 1;
      long long v12 = &_swiftEmptyArrayStorage[11 * v11];
      long long v13 = v19[1];
      *((_OWORD *)v12 + 2) = v19[0];
      *((_OWORD *)v12 + 3) = v13;
      long long v14 = v19[2];
      long long v15 = v19[3];
      long long v16 = v19[4];
      v12[14] = v20;
      *((_OWORD *)v12 + 5) = v15;
      *((_OWORD *)v12 + 6) = v16;
      *((_OWORD *)v12 + 4) = v14;
      ++v5;
      --v2;
    }
    while (v2);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t destroy for HelpCommand(uint64_t a1)
{
  sub_100053658(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  sub_100002804(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HelpCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_100074B60(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  char v9 = *(unsigned char *)(a2 + 40);
  sub_10000264C(v7, v8, v9);
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HelpCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_100074B60(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_100053658(v7, v8, v9);
  uint64_t v10 = *(void *)(a2 + 24);
  uint64_t v11 = *(void *)(a2 + 32);
  char v12 = *(unsigned char *)(a2 + 40);
  sub_10000264C(v10, v11, v12);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  char v15 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 24) = v10;
  *(void *)(a1 + 32) = v11;
  *(unsigned char *)(a1 + 40) = v12;
  sub_100002804(v13, v14, v15);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for HelpCommand(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_100053658(v5, v6, v7);
  char v8 = *(unsigned char *)(a2 + 40);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = v8;
  sub_100002804(v9, v10, v11);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for HelpCommand(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HelpCommand(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)double result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HelpCommand()
{
  return &type metadata for HelpCommand;
}

uint64_t sub_10008318C(uint64_t a1)
{
  uint64_t v38 = *(void *)(a1 + 16);
  if (!v38) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  uint64_t v37 = a1 + 32;
  unint64_t v1 = (_OWORD *)swift_bridgeObjectRetain();
  uint64_t v2 = 0;
  long long v3 = v1[11];
  long long v48 = v1[10];
  long long v49 = v3;
  long long v4 = v1[13];
  long long v50 = v1[12];
  long long v51 = v4;
  long long v5 = v1[7];
  long long v44 = v1[6];
  long long v45 = v5;
  long long v6 = v1[9];
  long long v46 = v1[8];
  long long v47 = v6;
  long long v7 = v1[3];
  long long v40 = v1[2];
  long long v41 = v7;
  long long v8 = v1[4];
  long long v9 = v1[5];
  uint64_t v10 = 1;
  char v11 = _swiftEmptyArrayStorage;
  while (1)
  {
    long long v42 = v8;
    long long v43 = v9;
    uint64_t v12 = v10;
    unint64_t v13 = v40;
    uint64_t v14 = (unint64_t)v40 >= 2 ? (void *)v40 : _swiftEmptyArrayStorage;
    int64_t v15 = v14[2];
    if (v15)
    {
      uint64_t v39 = v10;
      long long v52 = v11;
      sub_10002E940((uint64_t)&v40);
      sub_10002EA30(v13);
      sub_100057108(0, v15, 0);
      long long v16 = (unsigned __int8 *)(v14 + 6);
      do
      {
        uint64_t v17 = *((void *)v16 - 2);
        uint64_t v18 = *((void *)v16 - 1);
        if ((*v16 & 0xC0) == 0x40) {
          unsigned __int8 v19 = 64;
        }
        else {
          unsigned __int8 v19 = *v16;
        }
        sub_1000319B8(*((void *)v16 - 2), *((void *)v16 - 1), *v16);
        unint64_t v21 = _swiftEmptyArrayStorage[2];
        unint64_t v20 = _swiftEmptyArrayStorage[3];
        if (v21 >= v20 >> 1) {
          sub_100057108((void *)(v20 > 1), v21 + 1, 1);
        }
        v16 += 24;
        _swiftEmptyArrayStorage[2] = v21 + 1;
        uint64_t v22 = &_swiftEmptyArrayStorage[4 * v21];
        _OWORD v22[4] = v17;
        v22[5] = v18;
        *((unsigned char *)v22 + 48) = v19;
        v22[7] = v2;
        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease();
      uint64_t result = sub_10002EAFC((uint64_t)&v40);
      char v11 = v52;
      uint64_t v12 = v39;
    }
    else
    {
      sub_10002EA30(v40);
      uint64_t result = swift_bridgeObjectRelease();
    }
    uint64_t v24 = _swiftEmptyArrayStorage[2];
    int64_t v25 = v11[2];
    int64_t v26 = v25 + v24;
    if (__OFADD__(v25, v24)) {
      break;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) != 0 && v26 <= v11[3] >> 1)
    {
      if (_swiftEmptyArrayStorage[2]) {
        goto LABEL_20;
      }
    }
    else
    {
      if (v25 <= v26) {
        int64_t v30 = v25 + v24;
      }
      else {
        int64_t v30 = v25;
      }
      uint64_t result = (uint64_t)sub_10005FCAC((void *)result, v30, 1, v11);
      char v11 = (void *)result;
      if (_swiftEmptyArrayStorage[2])
      {
LABEL_20:
        if ((v11[3] >> 1) - v11[2] < v24) {
          goto LABEL_36;
        }
        sub_100003DD0(&qword_1000C56B0);
        uint64_t result = swift_arrayInitWithCopy();
        if (v24)
        {
          uint64_t v27 = v11[2];
          BOOL v28 = __OFADD__(v27, v24);
          uint64_t v29 = v27 + v24;
          if (v28) {
            goto LABEL_37;
          }
          v11[2] = v29;
        }
        goto LABEL_29;
      }
    }
    if (v24) {
      goto LABEL_35;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    if (v12 == v38)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v11;
    }
    unint64_t v31 = (long long *)(v37 + 192 * v12);
    long long v32 = v31[9];
    long long v48 = v31[8];
    long long v49 = v32;
    long long v33 = v31[11];
    long long v50 = v31[10];
    long long v51 = v33;
    long long v34 = v31[5];
    long long v44 = v31[4];
    long long v45 = v34;
    long long v35 = v31[7];
    long long v46 = v31[6];
    long long v47 = v35;
    long long v36 = v31[1];
    long long v40 = *v31;
    long long v41 = v36;
    long long v8 = v31[2];
    long long v9 = v31[3];
    uint64_t v10 = v12 + 1;
    uint64_t v2 = v12;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10008346C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  if (*(void *)(a6 + 16))
  {
    *(void *)&long long v42 = a6;
    *((void *)&v42 + 1) = sub_100084DC0;
    uint64_t v43 = 0;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10003A450(a4);
    swift_bridgeObjectRetain();
    sub_10003A4DC(a7, a8, a9);
    sub_100003DD0(&qword_1000C5D90);
    sub_100084FB0();
    uint64_t v16 = BidirectionalCollection<>.joined(separator:)();
    uint64_t v18 = v17;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10003A450(a4);
    swift_bridgeObjectRetain();
    sub_10003A4DC(a7, a8, a9);
    uint64_t v16 = 0;
    uint64_t v18 = 0;
  }
  if (a9 == 255) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = a7;
  }
  if (a9 == 255) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = a8;
  }
  uint64_t v37 = v20;
  uint64_t v38 = v19;
  if (a9 == 255) {
    char v21 = 4;
  }
  else {
    char v21 = a9;
  }
  char v36 = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10003A4DC(a7, a8, a9);
  sub_10006746C((uint64_t)_swiftEmptyArrayStorage, 3, (uint64_t)a4, v16, v18, a1, a2, a3, (uint64_t)&v42, 0);
  long long v28 = v42;
  uint64_t v22 = v43;
  char v35 = v45;
  long long v33 = v47;
  long long v34 = v46;
  uint64_t v23 = v48;
  uint64_t v32 = v49;
  char v31 = v50;
  uint64_t v29 = v52;
  uint64_t v30 = v51;
  uint64_t v24 = (void *)swift_allocObject();
  _OWORD v24[2] = sub_1000730F0;
  v24[3] = 0;
  v24[4] = a1;
  v24[5] = a2;
  v24[6] = a3;
  uint64_t v40 = a6;
  int64_t v25 = (void *)swift_allocObject();
  v25[2] = 0;
  sub_10002B998((uint64_t)&v40, (uint64_t)(v25 + 3), &qword_1000C5DA0);
  void v25[4] = a1;
  v25[5] = a2;
  v25[6] = a3;
  char v41 = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10007565C(a7, a8, a9);
  sub_100003DD0(&qword_1000C5230);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_1000A2660;
  *(void *)(v26 + 32) = 0;
  *(_OWORD *)(v26 + 40) = v28;
  *(void *)(v26 + 56) = v22;
  *(_OWORD *)(v26 + 64) = v44;
  *(unsigned char *)(v26 + 80) = v35;
  *(_OWORD *)(v26 + 88) = v34;
  *(_OWORD *)(v26 + 104) = v33;
  *(void *)(v26 + 120) = v23;
  *(void *)(v26 + 128) = v32;
  *(unsigned char *)(v26 + 136) = v31;
  *(void *)(v26 + 144) = v30;
  *(void *)(v26 + 152) = v29;
  *(void *)(v26 + 160) = v38;
  *(void *)(v26 + 168) = v37;
  *(unsigned char *)(v26 + 176) = v36;
  *(unsigned char *)(v26 + 177) = a5;
  *(void *)(v26 + 184) = sub_10008506C;
  *(void *)(v26 + 192) = v24;
  *(unsigned char *)(v26 + 200) = v41;
  *(void *)(v26 + 208) = sub_1000850F8;
  *(void *)(v26 + 216) = v25;
  return sub_100083798(v26);
}

uint64_t sub_100083798(uint64_t a1)
{
  sub_100083AB4((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_10008318C(v2);
  swift_bridgeObjectRelease();
  if (*(void *)(v3 + 16))
  {
    sub_100003DD0(qword_1000C5608);
    long long v4 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    long long v4 = &_swiftEmptyDictionarySingleton;
  }
  long long v6 = v4;
  sub_10008511C(v3, 1, &v6);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100083858(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void (*a6)(void **))
{
  uint64_t v12 = *v6;
  if (*(void *)(v12 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v13 = sub_100060C94(a1, a2, a3);
    if (v14)
    {
      sub_100063EA0(*(void *)(v12 + 56) + 72 * v13, (uint64_t)&v20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((void *)&v20 + 1))
      {
        v26[1] = v22;
        long long v27 = v23;
        char v28 = v24;
        long long v25 = v20;
        v26[0] = v21;
        goto LABEL_8;
      }
    }
    else
    {
      char v24 = 0;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v24 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
  }
  uint64_t v15 = sub_100003DD0(&qword_1000C50C8);
  *(void *)&long long v25 = a1;
  *((void *)&v25 + 1) = a2;
  *(void *)&v26[0] = a3;
  *((void *)&v26[0] + 1) = a5;
  *(void *)&long long v27 = v15;
  *((void *)&v27 + 1) = &_swiftEmptySetSingleton;
  char v28 = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000556DC((uint64_t)&v20, &qword_1000C5888);
LABEL_8:
  sub_100063E3C((uint64_t)v26 + 8, (uint64_t)&v20, &qword_1000C5360);
  if (!*((void *)&v21 + 1))
  {
    sub_1000556DC((uint64_t)&v20, &qword_1000C5360);
    goto LABEL_12;
  }
  sub_100003DD0(&qword_1000C50C8);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v19 = a5;
    swift_bridgeObjectRetain();
  }
  if (v28 == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = _swiftEmptyArrayStorage;
    char v28 = 0;
  }
  a6(&v19);
  uint64_t v16 = v19;
  *((void *)&v21 + 1) = sub_100003DD0(&qword_1000C50C8);
  *(void *)&long long v20 = v16;
  sub_100070170((uint64_t)&v20, (uint64_t)v26 + 8);
  uint64_t v17 = swift_bridgeObjectRetain();
  sub_10005F4C8(v17);
  sub_10007A218((uint64_t *)&v25);
  return sub_1000418BC((uint64_t)&v25);
}

unint64_t sub_100083AB4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003DD0(qword_1000C5608);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  long long v4 = (void *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    int v7 = *((unsigned __int8 *)v4 - 8);
    uint64_t v8 = *v4;
    sub_1000319B8(v5, v6, *((unsigned char *)v4 - 8));
    unint64_t result = sub_100060BB4(v5, v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = v2[6] + 24 * result;
    *(void *)uint64_t v11 = v5;
    *(void *)(v11 + 8) = v6;
    *(unsigned char *)(v11 + 16) = v7;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v14;
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

unint64_t sub_100083BF0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003DD0(&qword_1000C5D28);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  uint64_t v4 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_100063E3C(v4, (uint64_t)&v18, &qword_1000C5DD0);
    uint64_t v5 = v18;
    uint64_t v6 = v19;
    int v7 = v20;
    unint64_t result = sub_100060C94(v18, v19, v20);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 24 * result);
    *char v10 = v5;
    v10[1] = v6;
    v10[2] = (uint64_t)v7;
    uint64_t v11 = v2[7] + 72 * result;
    *(_OWORD *)uint64_t v11 = v21;
    long long v12 = v22;
    long long v13 = v23;
    long long v14 = v24;
    *(unsigned char *)(v11 + 64) = v25;
    *(_OWORD *)(v11 + 32) = v13;
    *(_OWORD *)(v11 + 48) = v14;
    *(_OWORD *)(v11 + 16) = v12;
    uint64_t v15 = v2[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v2[2] = v17;
    v4 += 96;
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

unint64_t sub_100083D5C(uint64_t a1)
{
  uint64_t v2 = sub_100003DD0(&qword_1000C5DC0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    int v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003DD0(&qword_1000C5DC8);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  int v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  char v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100063E3C(v12, (uint64_t)v5, &qword_1000C5DC0);
    unint64_t result = sub_100060D20((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for CodingUserInfoKey();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    unint64_t result = (unint64_t)sub_100063EFC(v9, (_OWORD *)(v7[7] + 32 * v16));
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
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

unint64_t sub_100083F5C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003DD0(&qword_1000C5D38);
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
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000247D8(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
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

void *sub_100084078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *(*a8)(uint64_t *__return_ptr, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  unint64_t result = a8(&v15, a10, a11, a12, a1, a2, a3, a4, a5, a6);
  if (!v12)
  {
    __chkstk_darwin(result);
    sub_100083858(a10, a11, a12, a1, _swiftEmptyArrayStorage, (void (*)(void **))sub_1000853DC);
    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_100084188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *(*a8)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  unint64_t result = a8(v19, a10, a11, a12, a1, a2, a3, a4, a5, a6);
  if (!v12)
  {
    v18[3] = &type metadata for String;
    v18[0] = v19[0];
    v18[1] = v19[1];
    sub_100063E3C((uint64_t)v18, (uint64_t)v16, &qword_1000C5360);
    v15[0] = a10;
    v15[1] = a11;
    v15[2] = a12;
    v16[4] = a1;
    char v17 = 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10007A218(v15);
    sub_1000418BC((uint64_t)v15);
    sub_1000556DC((uint64_t)v18, &qword_1000C5360);
    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_1000842AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *(*a8)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  unint64_t result = a8(v19, a10, a11, a12, a1, a2, a3, a4, a5, a6);
  if (!v12)
  {
    v18[3] = (char *)&type metadata for Any + 8;
    v18[0] = swift_allocObject();
    sub_100055680((uint64_t)v19, v18[0] + 16);
    sub_100063E3C((uint64_t)v18, (uint64_t)v16, &qword_1000C5360);
    v15[0] = a10;
    v15[1] = a11;
    v15[2] = a12;
    v16[4] = a1;
    char v17 = 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10007A218(v15);
    sub_1000418BC((uint64_t)v15);
    sub_1000556DC((uint64_t)v18, &qword_1000C5360);
    return (void *)sub_100005128((uint64_t)v19);
  }
  return result;
}

uint64_t sub_1000843E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 != 1)
  {
    uint64_t v11 = a1;
    swift_bridgeObjectRetain();
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    long long v16 = 0u;
    long long v17 = 0u;
    goto LABEL_6;
  }
  uint64_t v11 = sub_100076A54((uint64_t)&off_1000BC378);
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  *((void *)&v17 + 1) = sub_100003DD0(&qword_1000C50C8);
  *(void *)&long long v16 = a4;
LABEL_6:
  sub_100063E3C((uint64_t)&v16, (uint64_t)v14, &qword_1000C5360);
  v13[0] = a5;
  v13[1] = a6;
  v13[2] = a7;
  v14[4] = v11;
  char v15 = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10007A218(v13);
  sub_1000418BC((uint64_t)v13);
  swift_bridgeObjectRelease();
  return sub_1000556DC((uint64_t)&v16, &qword_1000C5360);
}

uint64_t sub_1000844F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 != 1)
  {
    uint64_t v13 = a1;
    swift_bridgeObjectRetain();
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    long long v18 = 0u;
    long long v19 = 0u;
    goto LABEL_6;
  }
  uint64_t v13 = sub_100076A54((uint64_t)&off_1000BC3B0);
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  *((void *)&v19 + 1) = &type metadata for String;
  *(void *)&long long v18 = a4;
  *((void *)&v18 + 1) = a5;
LABEL_6:
  sub_100063E3C((uint64_t)&v18, (uint64_t)v16, &qword_1000C5360);
  v15[0] = a6;
  v15[1] = a7;
  v15[2] = a8;
  v16[4] = v13;
  char v17 = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10007A218(v15);
  sub_1000418BC((uint64_t)v15);
  swift_bridgeObjectRelease();
  return sub_1000556DC((uint64_t)&v18, &qword_1000C5360);
}

uint64_t sub_100084608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 == 1)
  {
    uint64_t v11 = sub_100076A54((uint64_t)&off_1000BC3E8);
  }
  else
  {
    uint64_t v11 = a1;
    swift_bridgeObjectRetain();
  }
  sub_100063E3C(a4, (uint64_t)&v13, &qword_1000C5360);
  if (v15[0])
  {
    *((void *)&v18 + 1) = (char *)&type metadata for Any + 8;
    *(void *)&long long v17 = swift_allocObject();
    sub_100063EFC(&v13, (_OWORD *)(v17 + 16));
  }
  else
  {
    sub_1000556DC((uint64_t)&v13, &qword_1000C5360);
    long long v17 = 0u;
    long long v18 = 0u;
  }
  sub_100063E3C((uint64_t)&v17, (uint64_t)v15, &qword_1000C5360);
  *(void *)&long long v13 = a5;
  *((void *)&v13 + 1) = a6;
  uint64_t v14 = a7;
  v15[4] = v11;
  char v16 = 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10007A218((uint64_t *)&v13);
  sub_1000418BC((uint64_t)&v13);
  swift_bridgeObjectRelease();
  return sub_1000556DC((uint64_t)&v17, &qword_1000C5360);
}

uint64_t sub_10008475C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  swift_bridgeObjectRetain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10005FA90(0, *(void *)(v6 + 16) + 1, 1, (char *)v6);
    uint64_t v6 = result;
  }
  unint64_t v9 = *(void *)(v6 + 16);
  unint64_t v8 = *(void *)(v6 + 24);
  if (v9 >= v8 >> 1)
  {
    uint64_t result = (uint64_t)sub_10005FA90((char *)(v8 > 1), v9 + 1, 1, (char *)v6);
    uint64_t v6 = result;
  }
  *(void *)(v6 + 16) = v9 + 1;
  unint64_t v10 = v6 + 16 * v9;
  *(void *)(v10 + 32) = a2;
  *(void *)(v10 + 40) = a3;
  *a1 = v6;
  return result;
}

double sub_10008480C()
{
  uint64_t v0 = sub_100043564((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  *(void *)&double result = 1886152040;
  xmmword_1000C6560 = xmmword_1000A3EE0;
  qword_1000C6570 = 0;
  unk_1000C6578 = 0;
  *(void *)&xmmword_1000C6580 = 0xD000000000000021;
  *((void *)&xmmword_1000C6580 + 1) = 0x80000001000A9940;
  qword_1000C6590 = 0;
  unk_1000C6598 = 0;
  *(void *)&xmmword_1000C65A0 = 0;
  *((void *)&xmmword_1000C65A0 + 1) = 0xE000000000000000;
  qword_1000C65B0 = 0;
  unk_1000C65B8 = 0xE000000000000000;
  LOBYTE(xmmword_1000C65C0) = 1;
  *((void *)&xmmword_1000C65C0 + 1) = _swiftEmptyArrayStorage;
  unk_1000C65D0 = 0;
  qword_1000C65D8 = 0;
  qword_1000C65E0 = v0;
  return result;
}

uint64_t (*sub_1000848BC(char a1))(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v2 = sub_100043564((uint64_t)&off_1000BC060);
  swift_bridgeObjectRelease();
  swift_arrayDestroy();
  v5[0] = xmmword_1000A3EC0;
  v5[1] = xmmword_1000A3EC0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  char v8 = 2;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(unsigned char *)(v3 + 24) = a1;
  sub_10002B998((uint64_t)v5, v3 + 32, &qword_1000C5158);
  return sub_10003C760;
}

uint64_t sub_100084998()
{
  if (*v0) {
    return 1886152040;
  }
  else {
    return 0x616D6D6F63627573;
  }
}

uint64_t sub_1000849D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000853E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000849FC(uint64_t a1)
{
  unint64_t v2 = sub_100085768();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100084A38(uint64_t a1)
{
  unint64_t v2 = sub_100085768();

  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_100084A74@<Q0>(uint64_t a1@<X8>)
{
  if (qword_1000C50B8 != -1) {
    swift_once();
  }
  long long v12 = xmmword_1000C65C0;
  long long v13 = unk_1000C65D0;
  uint64_t v14 = qword_1000C65E0;
  long long v8 = xmmword_1000C6580;
  long long v9 = *(_OWORD *)&qword_1000C6590;
  long long v10 = xmmword_1000C65A0;
  long long v11 = *(_OWORD *)&qword_1000C65B0;
  long long v6 = xmmword_1000C6560;
  __n128 v7 = *(__n128 *)&qword_1000C6570;
  sub_100084E24((uint64_t)&v6);
  long long v2 = v13;
  *(_OWORD *)(a1 + 96) = v12;
  *(_OWORD *)(a1 + 112) = v2;
  *(void *)(a1 + 128) = v14;
  long long v3 = v9;
  *(_OWORD *)(a1 + 32) = v8;
  *(_OWORD *)(a1 + 48) = v3;
  long long v4 = v11;
  *(_OWORD *)(a1 + 64) = v10;
  *(_OWORD *)(a1 + 80) = v4;
  __n128 result = v7;
  *(_OWORD *)a1 = v6;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_100084B2C()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 56);
  sub_10005857C();
  swift_allocError();
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = v2;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 73) = 0u;
  swift_bridgeObjectRetain();
  return swift_willThrow();
}

uint64_t (*sub_100084BA0@<X0>(uint64_t a1@<X8>))(uint64_t a1, unint64_t a2, uint64_t a3)
{
  char v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v2 = swift_allocObject();
  sub_10002B998((uint64_t)v5, v2 + 16, &qword_1000C5158);
  *(unsigned char *)(v2 + 65) = 0;
  *(void *)(v2 + 80) = 0;
  *(void *)(v2 + 88) = 0;
  *(void *)(v2 + 72) = _swiftEmptyArrayStorage;
  *(unsigned char *)(v2 + 96) = -1;
  __n128 result = sub_1000848BC(0);
  *(void *)a1 = sub_100084F24;
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = sub_10003C760;
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = _swiftEmptyArrayStorage;
  *(unsigned char *)(a1 + 56) = 0;
  return result;
}

double sub_100084C6C@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_1000854E4(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    a2[2] = v7[0];
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 41) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

unint64_t sub_100084CB8(uint64_t a1)
{
  unint64_t result = sub_100084CE0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100084CE0()
{
  unint64_t result = qword_1000C5D80;
  if (!qword_1000C5D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5D80);
  }
  return result;
}

unint64_t sub_100084D34(uint64_t a1)
{
  unint64_t result = sub_100084D5C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100084D5C()
{
  unint64_t result = qword_1000C5D88;
  if (!qword_1000C5D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5D88);
  }
  return result;
}

uint64_t sub_100084DB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = 2 * a2;
  return result;
}

uint64_t sub_100084DC0@<X0>(void *a1@<X8>)
{
  uint64_t result = _print_unlocked<A, B>(_:_:)();
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  return result;
}

uint64_t sub_100084E24(uint64_t a1)
{
  return a1;
}

uint64_t sub_100084EBC()
{
  if (*(void *)(v0 + 24))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  int v1 = *(unsigned __int8 *)(v0 + 96);
  if (v1 != 255) {
    sub_10002EBFC(*(void *)(v0 + 80), *(void *)(v0 + 88), v1);
  }

  return _swift_deallocObject(v0, 97, 7);
}

uint64_t sub_100084F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10008346C(a1, a2, a3, (uint64_t *)(v3 + 16), *(unsigned char *)(v3 + 65), *(void *)(v3 + 72), *(void *)(v3 + 80), *(void *)(v3 + 88), *(unsigned char *)(v3 + 96));
}

uint64_t sub_100084F5C()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return _swift_deallocObject(v0, 81, 7);
}

unint64_t sub_100084FB0()
{
  unint64_t result = qword_1000C5D98;
  if (!qword_1000C5D98)
  {
    sub_1000046A8(&qword_1000C5D90);
    sub_100067408();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5D98);
  }
  return result;
}

uint64_t sub_100085024()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void *sub_10008506C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100084078(a1, a2, a3, a4, a5, a6, a7, *(void *(**)(uint64_t *__return_ptr, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16), *(void *)(v7 + 24), *(void *)(v7 + 32), *(void *)(v7 + 40), *(void **)(v7 + 48));
}

uint64_t sub_1000850A0()
{
  if (*(void *)(v0 + 16) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000850F8(uint64_t a1, uint64_t a2)
{
  return sub_1000843E0(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_10008511C(uint64_t result, char a2, void *a3)
{
  if (*(void *)(result + 16))
  {
    uint64_t v5 = result;
    uint64_t v43 = *(void *)(result + 16);
    uint64_t v7 = *(void *)(result + 32);
    uint64_t v6 = *(void *)(result + 40);
    int v8 = *(unsigned __int8 *)(result + 48);
    uint64_t v42 = *(void *)(result + 56);
    long long v9 = (void *)*a3;
    sub_1000319B8(v7, v6, v8);
    unint64_t v11 = sub_100060BB4(v7, v6, v8);
    uint64_t v12 = v9[2];
    BOOL v13 = (v10 & 1) == 0;
    unint64_t result = v12 + v13;
    if (__OFADD__(v12, v13))
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    char v14 = v10;
    if (v9[3] < result)
    {
      sub_10007AAE8(result, a2 & 1);
      unint64_t result = sub_100060BB4(v7, v6, v8);
      if ((v14 & 1) != (v15 & 1))
      {
LABEL_26:
        unint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
        __break(1u);
        return result;
      }
      unint64_t v11 = result;
      char v16 = (void *)*a3;
      if ((v14 & 1) == 0) {
        goto LABEL_11;
      }
LABEL_9:
      uint64_t v17 = 8 * v11;
      uint64_t v18 = *(void *)(v16[7] + 8 * v11);
      unint64_t result = sub_10002ECB8(v7, v6, v8);
      *(void *)(v16[7] + v17) = v18;
LABEL_13:
      uint64_t v23 = v43 - 1;
      if (v43 == 1) {
        return result;
      }
      for (uint64_t i = (void *)(v5 + 88); ; i += 4)
      {
        uint64_t v28 = *(i - 3);
        uint64_t v27 = *(i - 2);
        int v29 = *((unsigned __int8 *)i - 8);
        uint64_t v30 = *i;
        char v31 = (void *)*a3;
        sub_1000319B8(v28, v27, *((unsigned char *)i - 8));
        unint64_t result = sub_100060BB4(v28, v27, v29);
        uint64_t v33 = v31[2];
        BOOL v34 = (v32 & 1) == 0;
        BOOL v21 = __OFADD__(v33, v34);
        uint64_t v35 = v33 + v34;
        if (v21) {
          break;
        }
        char v36 = v32;
        if (v31[3] < v35)
        {
          sub_10007AAE8(v35, 1);
          unint64_t result = sub_100060BB4(v28, v27, v29);
          if ((v36 & 1) != (v37 & 1)) {
            goto LABEL_26;
          }
        }
        uint64_t v38 = (void *)*a3;
        if (v36)
        {
          uint64_t v25 = 8 * result;
          uint64_t v26 = *(void *)(v38[7] + 8 * result);
          unint64_t result = sub_10002ECB8(v28, v27, v29);
          *(void *)(v38[7] + v25) = v26;
        }
        else
        {
          v38[((unint64_t)result >> 6) + 8] |= 1 << result;
          uint64_t v39 = v38[6] + 24 * result;
          *(void *)uint64_t v39 = v28;
          *(void *)(v39 + 8) = v27;
          *(unsigned char *)(v39 + 16) = v29;
          *(void *)(v38[7] + 8 * result) = v30;
          uint64_t v40 = v38[2];
          BOOL v21 = __OFADD__(v40, 1);
          uint64_t v41 = v40 + 1;
          if (v21) {
            goto LABEL_25;
          }
          v38[2] = v41;
        }
        if (!--v23) {
          return result;
        }
      }
      goto LABEL_24;
    }
    if (a2)
    {
      char v16 = (void *)*a3;
      if (v10) {
        goto LABEL_9;
      }
    }
    else
    {
      unint64_t result = (uint64_t)sub_10007A3CC();
      char v16 = (void *)*a3;
      if (v14) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v16[(v11 >> 6) + 8] |= 1 << v11;
    uint64_t v19 = v16[6] + 24 * v11;
    *(void *)uint64_t v19 = v7;
    *(void *)(v19 + 8) = v6;
    *(unsigned char *)(v19 + 16) = v8;
    *(void *)(v16[7] + 8 * v11) = v42;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v16[2] = v22;
    goto LABEL_13;
  }
  return result;
}

uint64_t sub_1000853DC(uint64_t *a1)
{
  return sub_10008475C(a1, **(void **)(v1 + 16), *(void *)(*(void *)(v1 + 16) + 8));
}

uint64_t sub_1000853E8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x616D6D6F63627573 && a2 == 0xEB0000000073646ELL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1886152040 && a2 == 0xE400000000000000)
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

uint64_t sub_1000854E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = a2;
  uint64_t v4 = sub_100003DD0(&qword_1000C5DA8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000848BC(0);
  uint64_t v9 = v8;
  sub_100005090(a1, a1[3]);
  sub_100085768();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    sub_100002804((uint64_t)sub_10003C760, v9, 1);
    return sub_100005128((uint64_t)a1);
  }
  else
  {
    uint64_t v10 = v5;
    uint64_t v11 = v9;
    uint64_t v12 = v16;
    sub_100003DD0(&qword_1000C50C8);
    char v18 = 0;
    sub_1000857BC();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v13 = v19;
    char v17 = 1;
    char v15 = KeyedDecodingContainer.decode(_:forKey:)();
    sub_100002804((uint64_t)sub_10003C760, v11, 1);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v4);
    uint64_t result = sub_100005128((uint64_t)a1);
    *(void *)uint64_t v12 = v13;
    *(void *)(v12 + 8) = 0;
    *(unsigned char *)(v12 + 16) = 0;
    *(void *)(v12 + 24) = v15 & 1;
    *(void *)(v12 + 32) = 0;
    *(unsigned char *)(v12 + 40) = 0;
    *(void *)(v12 + 48) = _swiftEmptyArrayStorage;
    *(unsigned char *)(v12 + 56) = 0;
  }
  return result;
}

unint64_t sub_100085768()
{
  unint64_t result = qword_1000C5DB0;
  if (!qword_1000C5DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5DB0);
  }
  return result;
}

unint64_t sub_1000857BC()
{
  unint64_t result = qword_1000C5DB8;
  if (!qword_1000C5DB8)
  {
    sub_1000046A8(&qword_1000C50C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5DB8);
  }
  return result;
}

uint64_t sub_100085828@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  sub_1000848BC(0);
  int64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    uint64_t v16 = v6;
    char v17 = a2;
    swift_bridgeObjectRetain();
    sub_100056F98(0, v7, 0);
    uint64_t v8 = a1 + 40;
    do
    {
      uint64_t v9 = (*(uint64_t (**)(void))(*(void *)v8 + 24))();
      uint64_t v11 = v10;
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1) {
        sub_100056F98((char *)(v12 > 1), v13 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v13 + 1;
      char v14 = &_swiftEmptyArrayStorage[2 * v13];
      v14[4] = v9;
      void v14[5] = v11;
      v8 += 16;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
    uint64_t result = sub_100002804((uint64_t)sub_10003C760, v16, 1);
    a2 = v17;
  }
  else
  {
    uint64_t result = sub_100002804((uint64_t)sub_10003C760, v6, 1);
  }
  *(void *)a3 = _swiftEmptyArrayStorage;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 32) = 0;
  *(unsigned char *)(a3 + 40) = 0;
  *(void *)(a3 + 48) = a1;
  *(unsigned char *)(a3 + 56) = a2;
  return result;
}

unint64_t sub_1000859A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_100003DD0(&qword_1000C5D30);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  long long v13 = *(_OWORD *)(a1 + 32);
  unint64_t result = sub_100060D84(*(void *)(a1 + 32));
  if (v5)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    swift_retain();
    return (unint64_t)v3;
  }
  uint64_t v6 = (long long *)(a1 + 48);
  uint64_t v7 = v1 - 1;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v13;
    *(void *)(v3[7] + 8 * result) = *((void *)&v13 + 1);
    uint64_t v8 = v3[2];
    BOOL v9 = __OFADD__(v8, 1);
    uint64_t v10 = v8 + 1;
    if (v9) {
      break;
    }
    v3[2] = v10;
    if (!v7) {
      goto LABEL_8;
    }
    long long v11 = *v6++;
    long long v13 = v11;
    swift_retain();
    swift_retain();
    unint64_t result = sub_100060D84(v11);
    --v7;
    if (v12) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100085ABC()
{
  sub_100005128(v0 + 16);

  return _swift_deallocObject(v0, 48, 7);
}

unsigned char *storeEnumTagSinglePayload for HelpCommand.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x100085BC0);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HelpCommand.CodingKeys()
{
  return &type metadata for HelpCommand.CodingKeys;
}

unint64_t sub_100085BFC()
{
  unint64_t result = qword_1000C5DD8;
  if (!qword_1000C5DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5DD8);
  }
  return result;
}

unint64_t sub_100085C54()
{
  unint64_t result = qword_1000C5DE0;
  if (!qword_1000C5DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5DE0);
  }
  return result;
}

unint64_t sub_100085CAC()
{
  unint64_t result = qword_1000C5DE8;
  if (!qword_1000C5DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5DE8);
  }
  return result;
}

uint64_t sub_100085D00(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0;
  }
  String.index(before:)();
  return String.subscript.getter();
}

void *sub_100085D80(uint64_t a1, uint64_t *a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  int v3 = _swiftEmptyArrayStorage;
  if (v2)
  {
    sub_1000570C8(0, v2, 0);
    uint64_t v5 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v7 = *(v5 - 1);
      uint64_t v6 = *v5;
      uint64_t v8 = *a2;
      uint64_t v9 = *(void *)(*a2 + 16);
      swift_bridgeObjectRetain();
      if (v9)
      {
        swift_bridgeObjectRetain_n();
        unint64_t v10 = sub_1000247D8(v7, v6);
        if (v11)
        {
          int v3 = *(void **)(*(void *)(v8 + 56) + 8 * v10);
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease_n();
      }
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1) {
        sub_1000570C8((char *)(v12 > 1), v13 + 1, 1);
      }
      v5 += 2;
      _swiftEmptyArrayStorage[2] = v13 + 1;
      char v14 = &_swiftEmptyArrayStorage[6 * v13];
      v14[4] = v7;
      void v14[5] = v6;
      v14[6] = v3;
      v14[7] = 0;
      v14[8] = 0xE000000000000000;
      *((unsigned char *)v14 + 72) = 0;
      --v2;
      int v3 = _swiftEmptyArrayStorage;
    }
    while (v2);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100085ECC(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v81 = 0;
    TIOCGWINSZ.getter();
    a1 = 80;
    ioctl(_:_:_:)();
  }
  unint64_t v78 = v2;
  uint64_t v4 = v2[5];
  uint64_t v80 = v4;
  int64_t v5 = *(void *)(v4 + 16);
  uint64_t v6 = _swiftEmptyArrayStorage;
  if (v5)
  {
    uint64_t v81 = (uint64_t)_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_100056F98(0, v5, 0);
    uint64_t v6 = _swiftEmptyArrayStorage;
    uint64_t v7 = v4 + 64;
    do
    {
      uint64_t v8 = *(void *)(v7 - 32);
      unint64_t v9 = *(void *)(v7 - 24);
      uint64_t v10 = *(void *)(v7 - 16);
      sub_10008B744(v8, v9);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_10008B49C(a1, v8, v9, v10);
      uint64_t v13 = v12;
      sub_10008B758(v8, v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v81 = (uint64_t)v6;
      unint64_t v15 = v6[2];
      unint64_t v14 = v6[3];
      if (v15 >= v14 >> 1)
      {
        sub_100056F98((char *)(v14 > 1), v15 + 1, 1);
        uint64_t v6 = (void *)v81;
      }
      _OWORD v6[2] = v15 + 1;
      uint64_t v16 = &v6[2 * v15];
      v16[4] = v11;
      void v16[5] = v13;
      v7 += 48;
      --v5;
    }
    while (v5);
    sub_10002BAD0((uint64_t)&v80);
  }
  uint64_t v17 = v6[2];
  char v18 = _swiftEmptyArrayStorage;
  if (v17)
  {
    uint64_t v19 = v6 + 5;
    do
    {
      uint64_t v23 = *(v19 - 1);
      uint64_t v24 = *v19;
      uint64_t v25 = HIBYTE(*v19) & 0xF;
      if ((*v19 & 0x2000000000000000) == 0) {
        uint64_t v25 = v23 & 0xFFFFFFFFFFFFLL;
      }
      if (v25)
      {
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v81 = (uint64_t)v18;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_100056F98(0, v18[2] + 1, 1);
          char v18 = (void *)v81;
        }
        unint64_t v21 = v18[2];
        unint64_t v20 = v18[3];
        if (v21 >= v20 >> 1)
        {
          sub_100056F98((char *)(v20 > 1), v21 + 1, 1);
          char v18 = (void *)v81;
        }
        v18[2] = v21 + 1;
        uint64_t v22 = &v18[2 * v21];
        _OWORD v22[4] = v23;
        v22[5] = v24;
      }
      v19 += 2;
      --v17;
    }
    while (v17);
  }
  swift_bridgeObjectRelease();
  uint64_t v81 = (uint64_t)v18;
  sub_100003DD0(&qword_1000C50C8);
  sub_100005178((unint64_t *)&qword_1000C50D0, &qword_1000C50C8);
  uint64_t v27 = BidirectionalCollection<>.joined(separator:)();
  int v29 = v28;
  uint64_t result = swift_release();
  char v31 = v78;
  uint64_t v32 = v78[1];
  unint64_t v33 = v78[2];
  uint64_t v34 = HIBYTE(v33) & 0xF;
  if ((v33 & 0x2000000000000000) == 0) {
    uint64_t v34 = v32 & 0xFFFFFFFFFFFFLL;
  }
  if (v34)
  {
    uint64_t v81 = 0x574549565245564FLL;
    unint64_t v82 = 0xEA0000000000203ALL;
    swift_bridgeObjectRetain();
    v35._unint64_t countAndFlagsBits = v32;
    v35._unint64_t object = (void *)v33;
    String.append(_:)(v35);
    swift_bridgeObjectRelease();
    uint64_t v36 = sub_100086580(a1, 0, v81, v82);
    unint64_t v38 = v37;
    swift_bridgeObjectRelease();
    uint64_t v81 = v36;
    unint64_t v82 = v38;
    swift_bridgeObjectRetain();
    v39._unint64_t countAndFlagsBits = 2570;
    v39._unint64_t object = (void *)0xE200000000000000;
    String.append(_:)(v39);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v40 = v81;
  }
  else
  {
    uint64_t v40 = 0;
  }
  uint64_t v41 = v78[5];
  uint64_t v42 = *(void *)(v41 + 16);
  if (!v42) {
    goto LABEL_37;
  }
  uint64_t v43 = v41 + 48;
  while (*(void *)(v43 - 8) != 1)
  {
    v43 += 48;
    if (!--v42) {
      goto LABEL_37;
    }
  }
  if (*(void *)(*(void *)v43 + 16))
  {
    uint64_t v75 = v40;
    uint64_t v76 = v27;
    int64_t v77 = v29;
    uint64_t v44 = *v78;
    uint64_t v79 = v44;
    int64_t v45 = *(void *)(v44 + 16);
    if (!v45)
    {
      __break(1u);
      return result;
    }
    uint64_t v81 = (uint64_t)_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_100056F98(0, v45, 0);
    uint64_t v46 = v81;
    uint64_t v47 = v44 + 40;
    do
    {
      uint64_t v48 = (*(uint64_t (**)(void))(*(void *)v47 + 24))();
      uint64_t v50 = v49;
      uint64_t v81 = v46;
      unint64_t v52 = *(void *)(v46 + 16);
      unint64_t v51 = *(void *)(v46 + 24);
      if (v52 >= v51 >> 1)
      {
        sub_100056F98((char *)(v51 > 1), v52 + 1, 1);
        uint64_t v46 = v81;
      }
      *(void *)(v46 + 16) = v52 + 1;
      uint64_t v53 = v46 + 16 * v52;
      *(void *)(v53 + 32) = v48;
      *(void *)(v53 + 40) = v50;
      v47 += 16;
      --v45;
    }
    while (v45);
    sub_10002BAD0((uint64_t)&v79);
    (*(void (**)(uint64_t *__return_ptr))(*(void *)(v44 + 40) + 16))(&v81);
    sub_10002B998((uint64_t)&v83, (uint64_t)v84, &qword_1000C5110);
    sub_10002FB5C((uint64_t)v84);
    sub_10002DDE4((uint64_t)&v81);
    sub_10002B998((uint64_t)v84, (uint64_t)&v85, &qword_1000C5110);
    if (v86) {
      sub_100082700(0, 0, v85, v86);
    }
    int v29 = v77;
    char v31 = v78;
    uint64_t v40 = v75;
    uint64_t v27 = v76;
    if (!*(void *)(v46 + 16)) {
      __break(1u);
    }
    sub_100082700(1uLL, 1, 1886152040, 0xE400000000000000);
    _StringGuts.grow(_:)(43);
    swift_bridgeObjectRelease();
    uint64_t v70 = BidirectionalCollection<>.joined(separator:)();
    uint64_t v72 = v71;
    swift_bridgeObjectRelease();
    v73._unint64_t countAndFlagsBits = v70;
    v73._unint64_t object = v72;
    String.append(_:)(v73);
    swift_bridgeObjectRelease();
    v74._unint64_t object = (void *)0x80000001000A9970;
    v74._unint64_t countAndFlagsBits = 0xD000000000000021;
    String.append(_:)(v74);
    uint64_t v54 = 0x272065655320200ALL;
    long long v55 = (void *)0xE800000000000000;
  }
  else
  {
LABEL_37:
    uint64_t v54 = 0;
    long long v55 = (void *)0xE000000000000000;
  }
  uint64_t v57 = v31[3];
  unint64_t v56 = v31[4];
  uint64_t v58 = HIBYTE(v56) & 0xF;
  if ((v56 & 0x2000000000000000) == 0) {
    uint64_t v58 = v57 & 0xFFFFFFFFFFFFLL;
  }
  if (v58)
  {
    swift_bridgeObjectRetain();
    sub_100087DD4(7, v57, v56);
    uint64_t v60 = v59;
    uint64_t v62 = v61;
    swift_bridgeObjectRelease();
    v63._unint64_t countAndFlagsBits = v60;
    v63._unint64_t object = v62;
    String.append(_:)(v63);
    swift_bridgeObjectRelease();
    v64._unint64_t countAndFlagsBits = 2570;
    v64._unint64_t object = (void *)0xE200000000000000;
    String.append(_:)(v64);
    uint64_t v65 = 0x203A4547415355;
    unint64_t v66 = 0xE700000000000000;
  }
  else
  {
    uint64_t v65 = 0;
    unint64_t v66 = 0xE000000000000000;
  }
  unint64_t v67 = v66;
  String.append(_:)(*(Swift::String *)&v65);
  swift_bridgeObjectRelease();
  v68._unint64_t countAndFlagsBits = v27;
  v68._unint64_t object = v29;
  String.append(_:)(v68);
  swift_bridgeObjectRelease();
  v69._unint64_t countAndFlagsBits = v54;
  v69._unint64_t object = v55;
  String.append(_:)(v69);
  swift_bridgeObjectRelease();
  return v40;
}

uint64_t sub_100086580(uint64_t a1, Swift::Int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(a1, a2))
  {
LABEL_133:
    __break(1u);
    goto LABEL_134;
  }
  if (v8 < 1) {
    return 0;
  }
  unint64_t v9 = 0;
  v139 = (char *)_swiftEmptyArrayStorage;
  uint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v132 = 4 * v10;
  unint64_t v5 = 15;
  v129 = (char *)(a1 - a2);
LABEL_11:
  unint64_t v4 = String.subscript.getter();
  unint64_t v23 = v22;
  unint64_t v7 = v24;
  unint64_t v6 = v25;
  uint64_t v26 = Substring.index(_:offsetBy:limitedBy:)();
  if (v27) {
    unint64_t v28 = v23;
  }
  else {
    unint64_t v28 = v26;
  }
  if (v28 >> 14 < v4 >> 14)
  {
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
    goto LABEL_133;
  }
  unint64_t v29 = Substring.subscript.getter();
  unint64_t v31 = v30;
  unint64_t v4 = v32;
  swift_bridgeObjectRelease();
  uint64_t v8 = v29 >> 14;
  if (v31 >> 14 == v29 >> 14)
  {
    if (v8 == v132) {
      goto LABEL_116;
    }
    goto LABEL_17;
  }
  unint64_t v7 = Substring.index(before:)();
  BOOL v41 = Substring.subscript.getter() == 10 && v40 == 0xE100000000000000;
  if (v41) {
    goto LABEL_48;
  }
  unint64_t v6 = v40;
  unint64_t v137 = v29 >> 14;
  uint64_t v8 = v4;
  unint64_t v4 = v9;
  unint64_t v42 = v7;
  char v43 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v43)
  {
    swift_bridgeObjectRelease();
    unint64_t v7 = v42;
    unint64_t v9 = v4;
LABEL_50:
    if (v9 > v7 >> 14) {
      goto LABEL_131;
    }
    unint64_t v60 = String.subscript.getter();
    uint64_t v62 = v61;
    unint64_t v5 = v63;
    unint64_t v135 = v63;
    unint64_t v136 = v64 >> 14;
    if (v64 >> 14 == v60 >> 14)
    {
      unint64_t v6 = Substring.subscript.getter();
      uint64_t v12 = v11;
      uint64_t v14 = v13;
      uint64_t v16 = v15;
      uint64_t v17 = sub_10005FED4(0, 1, 1, (char *)_swiftEmptyArrayStorage);
      unint64_t v19 = *((void *)v17 + 2);
      unint64_t v18 = *((void *)v17 + 3);
      unint64_t v7 = v19 + 1;
      if (v19 >= v18 >> 1) {
        uint64_t v17 = sub_10005FED4((char *)(v18 > 1), v19 + 1, 1, v17);
      }
      *((void *)v17 + 2) = v7;
      unint64_t v20 = &v17[32 * v19];
      *((void *)v20 + 4) = v6;
      unint64_t v21 = v20 + 32;
      goto LABEL_9;
    }
    swift_bridgeObjectRetain();
    unint64_t v65 = v60;
    uint64_t v8 = v60;
    unint64_t v7 = v60;
    v138 = (char *)_swiftEmptyArrayStorage;
    uint64_t v66 = v62;
    while (1)
    {
      uint64_t v67 = Substring.subscript.getter();
      unint64_t v4 = v68;
      if (v67 == 10 && v68 == 0xE100000000000000) {
        break;
      }
      unint64_t v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v6) {
        goto LABEL_59;
      }
      unint64_t v65 = Substring.index(after:)();
LABEL_54:
      if (v136 == v65 >> 14)
      {
        if (v136 < v7 >> 14) {
          goto LABEL_132;
        }
        unint64_t v7 = Substring.subscript.getter();
        uint64_t v12 = v80;
        uint64_t v14 = v81;
        uint64_t v16 = v82;
        swift_bridgeObjectRelease();
        if (swift_isUniquelyReferenced_nonNull_native()) {
          uint64_t v17 = v138;
        }
        else {
          uint64_t v17 = sub_10005FED4(0, *((void *)v138 + 2) + 1, 1, v138);
        }
        unint64_t v6 = *((void *)v17 + 2);
        unint64_t v83 = *((void *)v17 + 3);
        if (v6 >= v83 >> 1) {
          uint64_t v17 = sub_10005FED4((char *)(v83 > 1), v6 + 1, 1, v17);
        }
        *((void *)v17 + 2) = v6 + 1;
        char v84 = &v17[32 * v6];
        *((void *)v84 + 4) = v7;
        unint64_t v21 = v84 + 32;
LABEL_9:
        unint64_t v4 = (unint64_t)v17;
        v21[1] = v12;
        v21[2] = v14;
        v21[3] = v16;
        swift_bridgeObjectRelease();
        sub_10005F2DC(v4);
LABEL_10:
        unint64_t v5 = String.index(after:)();
        unint64_t v9 = v5 >> 14;
        uint64_t v8 = (uint64_t)v129;
        if (v132 < v5 >> 14) {
          goto LABEL_129;
        }
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
LABEL_59:
    if (v65 >> 14 < (unint64_t)v8 >> 14)
    {
      __break(1u);
      goto LABEL_128;
    }
    uint64_t v69 = v66;
    uint64_t v70 = Substring.subscript.getter();
    uint64_t v72 = v71;
    unint64_t v6 = v73;
    uint64_t v75 = v74;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      uint64_t v76 = v138;
    }
    else {
      uint64_t v76 = sub_10005FED4(0, *((void *)v138 + 2) + 1, 1, v138);
    }
    unint64_t v78 = *((void *)v76 + 2);
    unint64_t v77 = *((void *)v76 + 3);
    unint64_t v4 = v78 + 1;
    if (v78 >= v77 >> 1) {
      uint64_t v76 = sub_10005FED4((char *)(v77 > 1), v78 + 1, 1, v76);
    }
    *((void *)v76 + 2) = v4;
    v138 = v76;
    uint64_t v79 = &v76[32 * v78];
    *((void *)v79 + 4) = v70;
    *((void *)v79 + 5) = v72;
    *((void *)v79 + 6) = v6;
    *((void *)v79 + 7) = v75;
    uint64_t v66 = v69;
    unint64_t v5 = v135;
    unint64_t v65 = Substring.index(after:)();
    uint64_t v8 = v65;
    unint64_t v7 = v65;
    goto LABEL_54;
  }
  BOOL v41 = v137 == v42 >> 14;
  unint64_t v9 = v4;
  unint64_t v4 = v8;
  if (v41) {
    goto LABEL_37;
  }
  unint64_t v7 = Substring.index(before:)();
  uint64_t v58 = Substring.subscript.getter();
  unint64_t v6 = v59;
  if (v58 == 10 && v59 == 0xE100000000000000)
  {
LABEL_48:
    swift_bridgeObjectRelease();
LABEL_49:
    swift_bridgeObjectRelease();
    goto LABEL_50;
  }
  unint64_t v131 = v7;
  char v87 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v87) {
    goto LABEL_77;
  }
  if (v137 == v131 >> 14) {
    goto LABEL_37;
  }
  unint64_t v7 = Substring.index(before:)();
  uint64_t v101 = Substring.subscript.getter();
  unint64_t v6 = v102;
  if (v101 == 10 && v102 == 0xE100000000000000) {
    goto LABEL_48;
  }
  unint64_t v131 = v7;
  char v103 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v103)
  {
LABEL_77:
    swift_bridgeObjectRelease();
    unint64_t v7 = v131;
    goto LABEL_50;
  }
  if (v137 != v131 >> 14)
  {
    do
    {
      unint64_t v7 = Substring.index(before:)();
      if (Substring.subscript.getter() == 10 && v104 == 0xE100000000000000) {
        goto LABEL_48;
      }
      unint64_t v6 = v104;
      uint64_t v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v8) {
        goto LABEL_49;
      }
    }
    while (v137 != v7 >> 14);
  }
LABEL_37:
  uint64_t v8 = v29 >> 14;
  if (v31 >> 14 == v132) {
    goto LABEL_116;
  }
  unint64_t v7 = Substring.index(before:)();
  uint64_t v53 = Substring.subscript.getter();
  unint64_t v6 = v54;
  if (v53 == 32 && v54 == 0xE100000000000000) {
    goto LABEL_40;
  }
  unint64_t v85 = v7;
  char v86 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v86)
  {
LABEL_73:
    swift_bridgeObjectRelease();
    unint64_t v7 = v85;
    goto LABEL_74;
  }
  if (v137 == v85 >> 14) {
    goto LABEL_17;
  }
  unint64_t v7 = Substring.index(before:)();
  uint64_t v92 = Substring.subscript.getter();
  unint64_t v6 = v93;
  if (v92 == 32 && v93 == 0xE100000000000000) {
    goto LABEL_40;
  }
  unint64_t v85 = v7;
  char v94 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v94) {
    goto LABEL_73;
  }
  if (v137 == v85 >> 14) {
    goto LABEL_17;
  }
  unint64_t v7 = Substring.index(before:)();
  uint64_t v95 = Substring.subscript.getter();
  unint64_t v6 = v96;
  if (v95 == 32 && v96 == 0xE100000000000000) {
    goto LABEL_40;
  }
  unint64_t v85 = v7;
  char v97 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v97) {
    goto LABEL_73;
  }
  if (v137 == v85 >> 14)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    unint64_t v33 = String.subscript.getter();
    unint64_t v4 = v34;
    unint64_t v36 = v35 >> 14;
    unint64_t v37 = v33 >> 14;
    if (v33 >> 14 != v35 >> 14)
    {
      unint64_t v7 = v33;
      uint64_t v38 = Substring.subscript.getter();
      unint64_t v6 = v39;
      if (v38 == 32 && v39 == 0xE100000000000000) {
        goto LABEL_20;
      }
      unint64_t v130 = v7;
      char v44 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v44)
      {
        swift_bridgeObjectRelease();
        unint64_t v7 = v130;
        goto LABEL_29;
      }
      unint64_t v55 = Substring.index(after:)();
      unint64_t v37 = v55 >> 14;
      if (v55 >> 14 != v36)
      {
        unint64_t v7 = v55;
        uint64_t v56 = Substring.subscript.getter();
        unint64_t v6 = v57;
        if (v56 == 32 && v57 == 0xE100000000000000)
        {
LABEL_20:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_29;
        }
        uint64_t v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v8)
        {
          swift_bridgeObjectRelease();
LABEL_29:
          if (v37 >= v9) {
            goto LABEL_30;
          }
          goto LABEL_130;
        }
        while (1)
        {
          unint64_t v88 = Substring.index(after:)();
          unint64_t v37 = v88 >> 14;
          if (v88 >> 14 == v36) {
            break;
          }
          uint64_t v8 = v88;
          uint64_t v89 = Substring.subscript.getter();
          unint64_t v6 = v90;
          if (v89 == 32 && v90 == 0xE100000000000000)
          {
            swift_bridgeObjectRelease();
LABEL_112:
            swift_bridgeObjectRelease();
            unint64_t v7 = v8;
            goto LABEL_29;
          }
          char v91 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v91) {
            goto LABEL_112;
          }
        }
      }
    }
LABEL_116:
    swift_bridgeObjectRelease();
    unint64_t v4 = sub_1000149F8(v5, a3, a4);
    unint64_t v5 = v107;
    unint64_t v6 = v108;
    unint64_t v7 = v109;
    uint64_t v8 = (uint64_t)v139;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_135;
    }
    goto LABEL_117;
  }
  while (1)
  {
    unint64_t v7 = Substring.index(before:)();
    if (Substring.subscript.getter() == 32 && v98 == 0xE100000000000000) {
      break;
    }
    unint64_t v6 = v98;
    unint64_t v85 = v7;
    char v100 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v100) {
      goto LABEL_73;
    }
    if (v137 == v85 >> 14) {
      goto LABEL_17;
    }
  }
LABEL_40:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_74:
  if (v9 <= v7 >> 14)
  {
LABEL_30:
    unint64_t v4 = String.subscript.getter();
    uint64_t v46 = v45;
    uint64_t v48 = v47;
    unint64_t v7 = v49;
    unint64_t v6 = (unint64_t)v139;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v6 = (unint64_t)sub_10005FED4(0, *((void *)v139 + 2) + 1, 1, v139);
    }
    unint64_t v51 = *(void *)(v6 + 16);
    unint64_t v50 = *(void *)(v6 + 24);
    if (v51 >= v50 >> 1) {
      unint64_t v6 = (unint64_t)sub_10005FED4((char *)(v50 > 1), v51 + 1, 1, (char *)v6);
    }
    *(void *)(v6 + 16) = v51 + 1;
    unint64_t v52 = (void *)(v6 + 32 * v51);
    v52[4] = v4;
    v52[5] = v46;
    v52[6] = v48;
    v52[7] = v7;
    v139 = (char *)v6;
    goto LABEL_10;
  }
LABEL_134:
  __break(1u);
LABEL_135:
  uint64_t v8 = (uint64_t)sub_10005FED4(0, *(void *)(v8 + 16) + 1, 1, (char *)v8);
LABEL_117:
  unint64_t v111 = *(void *)(v8 + 16);
  unint64_t v110 = *(void *)(v8 + 24);
  unint64_t v112 = v111 + 1;
  if (v111 >= v110 >> 1) {
    uint64_t v8 = (uint64_t)sub_10005FED4((char *)(v110 > 1), v111 + 1, 1, (char *)v8);
  }
  *(void *)(v8 + 16) = v112;
  long long v113 = (char *)(v8 + 32 * v111);
  *((void *)v113 + 4) = v4;
  *((void *)v113 + 5) = v5;
  v113 += 32;
  *((void *)v113 + 2) = v6;
  *((void *)v113 + 3) = v7;
  swift_bridgeObjectRetain();
  sub_100056FD8(0, v111 + 1, 0);
  v114 = (uint64_t *)(v8 + 56);
  do
  {
    uint64_t v115 = *(v114 - 3);
    uint64_t v116 = *(v114 - 2);
    uint64_t v117 = *(v114 - 1);
    uint64_t v118 = *v114;
    swift_bridgeObjectRetain();
    if ((v116 ^ (unint64_t)v115) >= 0x4000)
    {
      v119._unint64_t countAndFlagsBits = 32;
      v119._unint64_t object = (void *)0xE100000000000000;
      String.init(repeating:count:)(v119, a2);
      Substring.distance(from:to:)();
      String.count.getter();
      swift_bridgeObjectRetain();
      static String._fromSubstring(_:)();
      String.append<A>(contentsOf:)();
      Substring.init(_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      static String._fromSubstring(_:)();
      swift_bridgeObjectRelease();
      sub_100035330();
      String.append<A>(contentsOf:)();
      uint64_t v115 = Substring.init(_:)();
      uint64_t v116 = v120;
      uint64_t v117 = v121;
      uint64_t v123 = v122;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      uint64_t v118 = v123;
    }
    unint64_t v125 = _swiftEmptyArrayStorage[2];
    unint64_t v124 = _swiftEmptyArrayStorage[3];
    if (v125 >= v124 >> 1) {
      sub_100056FD8((char *)(v124 > 1), v125 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v125 + 1;
    v126 = &_swiftEmptyArrayStorage[4 * v125];
    v126[4] = v115;
    v126[5] = v116;
    v126[6] = v117;
    v126[7] = v118;
    v114 += 4;
    --v112;
  }
  while (v112);
  swift_bridgeObjectRelease_n();
  sub_100003DD0(&qword_1000C50D8);
  sub_100005178(&qword_1000C50E0, &qword_1000C50D8);
  sub_10002E898();
  uint64_t v106 = Sequence<>.joined(separator:)();
  swift_bridgeObjectRelease();
  return v106;
}

unint64_t sub_100087424(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v14 = a4 >> 14;
  if (a4 >> 14 == a3 >> 14) {
    return 0;
  }
  if (Substring.subscript.getter() == a1 && v8 == a2)
  {
    unint64_t v4 = a3;
LABEL_6:
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v9)
    {
      return a3;
    }
    else
    {
      while (1)
      {
        unint64_t v11 = Substring.index(after:)();
        if (v11 >> 14 == v14) {
          return 0;
        }
        unint64_t v4 = v11;
        if (Substring.subscript.getter() == a1 && v12 == a2) {
          goto LABEL_6;
        }
        char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v10) {
          return v4;
        }
      }
    }
  }
  return v4;
}

unint64_t sub_1000875A0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 4 * v4;
  unint64_t v8 = 15;
  while (String.subscript.getter() != a1 || v9 != a2)
  {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v10) {
      return v8;
    }
    unint64_t v8 = String.index(after:)();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_100087690(uint64_t a1)
{
  v3._uint64_t countAndFlagsBits = 32;
  v3._unint64_t object = (void *)0xE100000000000000;
  uint64_t countAndFlagsBits = String.init(repeating:count:)(v3, 2)._countAndFlagsBits;
  uint64_t v5 = *v1;
  unint64_t v6 = (void *)v1[1];
  uint64_t v32 = countAndFlagsBits;
  swift_bridgeObjectRetain();
  v7._uint64_t countAndFlagsBits = v5;
  v7._unint64_t object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = v1[2];
  unint64_t v9 = v1[3];
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_100086580(a1, 26, v8, v9);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t v14 = v1[4];
  unint64_t v13 = v1[5];
  uint64_t v15 = HIBYTE(v13) & 0xF;
  if ((v13 & 0x2000000000000000) == 0) {
    uint64_t v15 = v14 & 0xFFFFFFFFFFFFLL;
  }
  if (v15)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100086580(a1, 8, v14, v13);
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    unint64_t v33 = v18;
    swift_bridgeObjectRetain();
    v19._uint64_t countAndFlagsBits = 10;
    v19._unint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    uint64_t v21 = v16;
    unint64_t v20 = v33;
  }
  else
  {
    uint64_t v21 = 0;
    unint64_t v20 = (void *)0xE000000000000000;
  }
  uint64_t v22 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v22 = v8 & 0xFFFFFFFFFFFFLL;
  }
  if (v22)
  {
    if (String.count.getter() >= 26)
    {
      v27._uint64_t countAndFlagsBits = v10;
      v27._unint64_t object = v12;
      String.append(_:)(v27);
      swift_bridgeObjectRelease();
      uint64_t v24 = 10;
      uint64_t v26 = (void *)0xE100000000000000;
    }
    else
    {
      swift_bridgeObjectRetain();
      unint64_t v23 = String.count.getter();
      sub_100034DE0(v23, v10, (unint64_t)v12);
      swift_bridgeObjectRelease();
      uint64_t v24 = static String._fromSubstring(_:)();
      uint64_t v26 = v25;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v24 = 0;
    uint64_t v26 = (void *)0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  v28._uint64_t countAndFlagsBits = v24;
  v28._unint64_t object = v26;
  String.append(_:)(v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v29._uint64_t countAndFlagsBits = 10;
  v29._unint64_t object = (void *)0xE100000000000000;
  String.append(_:)(v29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v30._uint64_t countAndFlagsBits = v21;
  v30._unint64_t object = v20;
  String.append(_:)(v30);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v32;
}

Swift::Int sub_100087918()
{
  return Hasher._finalize()();
}

uint64_t sub_1000879CC()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100087A7C()
{
  return Hasher._finalize()();
}

uint64_t sub_100087B2C(_OWORD *a1, long long *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = *a2;
  long long v4 = a2[1];
  _OWORD v7[2] = a1[2];
  v8[0] = v3;
  long long v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_100089A9C(v7, v8) & 1;
}

uint64_t sub_100087B74()
{
  unint64_t v1 = v0[1];
  uint64_t v2 = 0x616D6D6F63627553;
  uint64_t v3 = 0x736E6F6974704FLL;
  if (v1 != 2) {
    uint64_t v3 = *v0;
  }
  if (v1 != 1) {
    uint64_t v2 = v3;
  }
  if (v1) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = 0x746E656D75677241;
  }
  sub_10008B744(*v0, v1);
  return v4;
}

uint64_t sub_100087C0C(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = a2[1];
  switch(v3)
  {
    case 0:
      return !v4;
    case 1:
      return v4 == 1;
    case 2:
      return v4 == 2;
  }
  if (v4 < 3) {
    return 0;
  }
  if (*a1 == *a2 && v3 == v4) {
    return 1;
  }
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100087C84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10008F9F0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL sub_100087CEC(void *a1)
{
  unint64_t v1 = a1[1];
  uint64_t v2 = *a1 & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(v1) & 0xF;
  }
  return v2 != 0;
}

uint64_t sub_100087D0C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  *a2 = v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

void sub_100087D18(void *a1@<X8>)
{
  *a1 = &_swiftEmptyArrayStorage;
}

uint64_t sub_100087D28()
{
  uint64_t v2 = *(void *)(v0 + 24);
  unint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v3 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3) {
    return 0;
  }
  swift_bridgeObjectRetain();
  sub_100087DD4(7, v2, v1);
  uint64_t v5 = v4;
  Swift::String v7 = v6;
  swift_bridgeObjectRelease();
  v8._uint64_t countAndFlagsBits = v5;
  v8._unint64_t object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  return 0x203A6567617355;
}

void sub_100087DD4(Swift::Int a1, uint64_t a2, unint64_t a3)
{
  uint64_t v27 = 10;
  unint64_t v28 = 0xE100000000000000;
  unint64_t v25 = &v27;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1000342C0(1, 0, sub_10002E878, (uint64_t)v24, a2, a3);
  Swift::String v7 = v6;
  if (*((void *)v6 + 2) == 2)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = static String._fromSubstring(_:)();
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    uint64_t v27 = v8;
    unint64_t v28 = v10;
    v11._uint64_t countAndFlagsBits = 10;
    v11._unint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v11);
    if (*((void *)v7 + 2) < 2uLL)
    {
      __break(1u);
    }
    else
    {
      unint64_t v12 = *((void *)v7 + 8);
      unint64_t v13 = *((void *)v7 + 9);
      uint64_t v14 = *((void *)v7 + 10);
      swift_bridgeObjectRetain();
      uint64_t v15 = swift_bridgeObjectRelease();
      v26[0] = 10;
      v26[1] = 0xE100000000000000;
      __chkstk_darwin(v15);
      void v23[2] = v26;
      swift_bridgeObjectRetain();
      unint64_t v16 = sub_1000346E0(0x7FFFFFFFFFFFFFFFLL, 0, sub_100015564, (uint64_t)v23, v12, v13, v14);
      v17._uint64_t countAndFlagsBits = 32;
      v17._unint64_t object = (void *)0xE100000000000000;
      String.init(repeating:count:)(v17, a1);
      unint64_t v18 = sub_100034E90(v16);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v26[0] = v18;
      sub_100003DD0(&qword_1000C50D8);
      sub_100005178(&qword_1000C50E0, &qword_1000C50D8);
      sub_10002E898();
      uint64_t v19 = Sequence<>.joined(separator:)();
      uint64_t v21 = v20;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v22._uint64_t countAndFlagsBits = v19;
      v22._unint64_t object = v21;
      String.append(_:)(v22);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v27 = (uint64_t)v6;
    sub_100003DD0(&qword_1000C50D8);
    sub_100005178(&qword_1000C50E0, &qword_1000C50D8);
    sub_10002E898();
    Sequence<>.joined(separator:)();
    swift_bridgeObjectRelease();
  }
}

BOOL sub_1000880BC()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return 0;
  }
  for (uint64_t i = v1 + 48; *(void *)(i - 8) != 1; i += 48)
  {
    if (!--v2) {
      return 0;
    }
  }
  return *(void *)(*(void *)i + 16) != 0;
}

char *sub_100088100(char a1)
{
  uint64_t v2 = 1886152040;
  if (String.subscript.getter() == 95 && v3 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v5)
  {
LABEL_8:
    sub_100034DE0(1uLL, 1886152040, 0xE400000000000000);
    uint64_t v2 = static String._fromSubstring(_:)();
    unint64_t v6 = v7;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  unint64_t v6 = 0xE400000000000000;
LABEL_9:
  swift_bridgeObjectRetain();
  uint64_t v8 = swift_bridgeObjectRetain();
  unint64_t v9 = sub_100089B50(v8, v2, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  uint64_t v10 = *((void *)v9 + 2);
  if (!v10)
  {
    swift_bridgeObjectRelease();
    unint64_t v12 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  Swift::String v11 = (unsigned __int8 *)(v9 + 48);
  unint64_t v12 = (char *)_swiftEmptyArrayStorage;
  do
  {
    uint64_t v15 = *((void *)v11 - 2);
    uint64_t v14 = (void *)*((void *)v11 - 1);
    unsigned int v16 = *v11;
    if (a1)
    {
      if (v16 >> 6)
      {
        if (v16 >> 6 == 1) {
          goto LABEL_12;
        }
        uint64_t v24 = 0;
        unint64_t v25 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        v17._uint64_t countAndFlagsBits = v15;
        v17._unint64_t object = v14;
        String.append(_:)(v17);
        v18._uint64_t countAndFlagsBits = 45;
        v18._unint64_t object = (void *)0xE100000000000000;
        String.append(_:)(v18);
        _print_unlocked<A, B>(_:_:)();
        sub_10002ECB8(v15, (uint64_t)v14, v16);
        uint64_t v15 = 0;
        uint64_t v14 = (void *)0xE000000000000000;
        LOBYTE(v16) = 0x80;
      }
      else
      {
        uint64_t v24 = 0;
        unint64_t v25 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        v19._uint64_t countAndFlagsBits = v15;
        v19._unint64_t object = v14;
        String.append(_:)(v19);
        v20._uint64_t countAndFlagsBits = 45;
        v20._unint64_t object = (void *)0xE100000000000000;
        String.append(_:)(v20);
        _print_unlocked<A, B>(_:_:)();
        sub_10002ECB8(v15, (uint64_t)v14, v16);
        LOBYTE(v16) = 0;
        uint64_t v15 = 0;
        uint64_t v14 = (void *)0xE000000000000000;
      }
    }
    else
    {
      sub_1000319B8(*((void *)v11 - 2), *((void *)v11 - 1), *v11);
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v12 = sub_10005FB94(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v22 = *((void *)v12 + 2);
    unint64_t v21 = *((void *)v12 + 3);
    if (v22 >= v21 >> 1) {
      unint64_t v12 = sub_10005FB94((char *)(v21 > 1), v22 + 1, 1, v12);
    }
    *((void *)v12 + 2) = v22 + 1;
    unint64_t v13 = &v12[24 * v22];
    *((void *)v13 + 4) = v15;
    *((void *)v13 + 5) = v14;
    v13[48] = v16;
LABEL_12:
    v11 += 24;
    --v10;
  }
  while (v10);
  swift_bridgeObjectRelease_n();
LABEL_25:
  uint64_t v24 = v12;
  swift_bridgeObjectRetain();
  sub_100088420(&v24);
  swift_bridgeObjectRelease();
  return v24;
}

uint64_t sub_100088420(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100089A48((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_10008848C(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_10008848C(uint64_t *a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  uint64_t result = _minimumMergeRunLength(_:)(v4);
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_179;
    }
    if (v4) {
      return sub_100089030(0, v4, 1, a1);
    }
    return result;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_178;
  }
  uint64_t v135 = result;
  unint64_t v132 = a1;
  if (v4 <= 1)
  {
    uint64_t v8 = (char *)_swiftEmptyArrayStorage;
    v144 = (char *)&_swiftEmptyArrayStorage[4];
    v134 = _swiftEmptyArrayStorage;
    if (v4 != 1)
    {
      unint64_t v11 = _swiftEmptyArrayStorage[2];
LABEL_144:
      if (v11 >= 2)
      {
        uint64_t v126 = *v132;
        do
        {
          unint64_t v127 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_173;
          }
          if (!v126) {
            goto LABEL_186;
          }
          uint64_t v128 = *(void *)&v8[16 * v127 + 32];
          uint64_t v129 = *(void *)&v8[16 * v11 + 24];
          uint64_t result = sub_100089304((char *)(v126 + 24 * v128), (char *)(v126 + 24 * *(void *)&v8[16 * v11 + 16]), v126 + 24 * v129, v144);
          if (v2) {
            break;
          }
          if (v129 < v128) {
            goto LABEL_174;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_100089A34((uint64_t)v8);
            uint64_t v8 = (char *)result;
          }
          if (v127 >= *((void *)v8 + 2)) {
            goto LABEL_175;
          }
          unint64_t v130 = &v8[16 * v127 + 32];
          *(void *)unint64_t v130 = v128;
          *((void *)v130 + 1) = v129;
          unint64_t v131 = *((void *)v8 + 2);
          if (v11 > v131) {
            goto LABEL_176;
          }
          uint64_t result = (uint64_t)memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v131 - v11));
          *((void *)v8 + 2) = v131 - 1;
          unint64_t v11 = v131 - 1;
        }
        while (v131 > 2);
      }
LABEL_155:
      swift_bridgeObjectRelease();
      v134[2] = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v7 = v6 >> 1;
    uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(result + 16) = v7;
    v134 = (void *)result;
    v144 = (char *)(result + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v133 = *a1 + 64;
  uint64_t v8 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v141 = v4;
  uint64_t v145 = *a1;
  while (2)
  {
    Swift::Int v12 = v9;
    Swift::Int v13 = v9 + 1;
    Swift::Int v142 = v9;
    if (v9 + 1 >= v4) {
      goto LABEL_64;
    }
    unint64_t v136 = v8;
    uint64_t v138 = v2;
    uint64_t v14 = v10 + 24 * v13;
    uint64_t v15 = *(void *)v14;
    unsigned int v16 = *(void **)(v14 + 8);
    unsigned int v17 = *(unsigned __int8 *)(v14 + 16);
    uint64_t v18 = v10 + 24 * v9;
    uint64_t v19 = *(void *)v18;
    Swift::String v20 = *(void **)(v18 + 8);
    unsigned int v21 = *(unsigned __int8 *)(v18 + 16);
    if (v21 >> 6)
    {
      if (v21 >> 6 == 1)
      {
        uint64_t v152 = 0;
        unint64_t v158 = 0xE000000000000000;
        sub_1000319B8(v15, (uint64_t)v16, v17);
        sub_1000319B8(v19, (uint64_t)v20, v21);
        v22._uint64_t countAndFlagsBits = 45;
        v22._unint64_t object = (void *)0xE100000000000000;
        String.append(_:)(v22);
        Character.write<A>(to:)();
        goto LABEL_22;
      }
      uint64_t v152 = 45;
      unint64_t v23 = 0xE100000000000000;
    }
    else
    {
      uint64_t v152 = 11565;
      unint64_t v23 = 0xE200000000000000;
    }
    unint64_t v158 = v23;
    sub_1000319B8(v15, (uint64_t)v16, v17);
    sub_1000319B8(v19, (uint64_t)v20, v21);
    v24._uint64_t countAndFlagsBits = v19;
    v24._unint64_t object = v20;
    String.append(_:)(v24);
LABEL_22:
    uint64_t v25 = v152;
    unint64_t v26 = v158;
    if (v17 >> 6)
    {
      if (v17 >> 6 == 1)
      {
        uint64_t v153 = 0;
        unint64_t v159 = 0xE000000000000000;
        v27._uint64_t countAndFlagsBits = 45;
        v27._unint64_t object = (void *)0xE100000000000000;
        String.append(_:)(v27);
        Character.write<A>(to:)();
        goto LABEL_28;
      }
      uint64_t v153 = 45;
      unint64_t v28 = 0xE100000000000000;
    }
    else
    {
      uint64_t v153 = 11565;
      unint64_t v28 = 0xE200000000000000;
    }
    unint64_t v159 = v28;
    v29._uint64_t countAndFlagsBits = v15;
    v29._unint64_t object = v16;
    String.append(_:)(v29);
LABEL_28:
    if (v25 == v153 && v26 == v159) {
      int v150 = 0;
    }
    else {
      int v150 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10002ECB8(v19, (uint64_t)v20, v21);
    uint64_t result = sub_10002ECB8(v15, (uint64_t)v16, v17);
    Swift::Int v4 = v141;
    Swift::Int v12 = v142;
    Swift::Int v13 = v142 + 2;
    if (v142 + 2 >= v141) {
      goto LABEL_55;
    }
    Swift::Int v146 = v142 + 2;
    Swift::String v30 = (unsigned __int8 *)(v133 + 24 * v142);
    while (1)
    {
      uint64_t v31 = *((void *)v30 - 2);
      uint64_t v32 = (void *)*((void *)v30 - 1);
      unsigned int v33 = *v30;
      uint64_t v35 = *((void *)v30 - 5);
      unint64_t v34 = (void *)*((void *)v30 - 4);
      unsigned int v36 = *(v30 - 24);
      uint64_t v164 = v31;
      if (v36 >> 6)
      {
        if (v36 >> 6 == 1)
        {
          uint64_t v154 = 0;
          unint64_t v160 = 0xE000000000000000;
          sub_1000319B8(v31, (uint64_t)v32, v33);
          sub_1000319B8(v35, (uint64_t)v34, v36);
          v37._uint64_t countAndFlagsBits = 45;
          v37._unint64_t object = (void *)0xE100000000000000;
          String.append(_:)(v37);
          Character.write<A>(to:)();
          goto LABEL_40;
        }
        uint64_t v154 = 45;
        unint64_t v38 = 0xE100000000000000;
      }
      else
      {
        uint64_t v154 = 11565;
        unint64_t v38 = 0xE200000000000000;
      }
      unint64_t v160 = v38;
      sub_1000319B8(v31, (uint64_t)v32, v33);
      sub_1000319B8(v35, (uint64_t)v34, v36);
      v39._uint64_t countAndFlagsBits = v35;
      v39._unint64_t object = v34;
      String.append(_:)(v39);
LABEL_40:
      uint64_t v40 = v154;
      unint64_t v41 = v160;
      if (!(v33 >> 6))
      {
        uint64_t v155 = 11565;
        unint64_t v43 = 0xE200000000000000;
LABEL_45:
        unint64_t v161 = v43;
        v44._uint64_t countAndFlagsBits = v164;
        v44._unint64_t object = v32;
        String.append(_:)(v44);
        goto LABEL_46;
      }
      if (v33 >> 6 != 1)
      {
        uint64_t v155 = 45;
        unint64_t v43 = 0xE100000000000000;
        goto LABEL_45;
      }
      uint64_t v155 = 0;
      unint64_t v161 = 0xE000000000000000;
      v42._uint64_t countAndFlagsBits = 45;
      v42._unint64_t object = (void *)0xE100000000000000;
      String.append(_:)(v42);
      Character.write<A>(to:)();
LABEL_46:
      int v45 = v40 == v155 && v41 == v161 ? 0 : _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10002ECB8(v35, (uint64_t)v34, v36);
      uint64_t result = sub_10002ECB8(v164, (uint64_t)v32, v33);
      if ((v150 ^ v45)) {
        break;
      }
      v30 += 24;
      if (v141 == ++v146)
      {
        Swift::Int v4 = v141;
        Swift::Int v13 = v141;
        goto LABEL_54;
      }
    }
    Swift::Int v4 = v141;
    Swift::Int v13 = v146;
LABEL_54:
    Swift::Int v12 = v142;
LABEL_55:
    uint64_t v8 = v136;
    uint64_t v2 = v138;
    uint64_t v10 = v145;
    if (v150)
    {
      if (v13 < v12) {
        goto LABEL_180;
      }
      if (v12 < v13)
      {
        uint64_t v46 = 24 * v13;
        uint64_t v47 = 24 * v12;
        Swift::Int v48 = v13;
        do
        {
          if (v12 != --v48)
          {
            if (!v145) {
              goto LABEL_185;
            }
            uint64_t v49 = v145 + v47;
            uint64_t v50 = v145 + v46;
            char v51 = *(unsigned char *)(v145 + v47 + 16);
            long long v52 = *(_OWORD *)(v145 + v47);
            uint64_t v53 = *(void *)(v145 + v46 - 8);
            *(_OWORD *)uint64_t v49 = *(_OWORD *)(v145 + v46 - 24);
            *(void *)(v49 + 16) = v53;
            *(_OWORD *)(v50 - 24) = v52;
            *(unsigned char *)(v50 - 8) = v51;
          }
          ++v12;
          v46 -= 24;
          v47 += 24;
        }
        while (v12 < v48);
        Swift::Int v12 = v142;
      }
    }
LABEL_64:
    if (v13 >= v4) {
      goto LABEL_96;
    }
    if (__OFSUB__(v13, v12)) {
      goto LABEL_177;
    }
    if (v13 - v12 >= v135)
    {
LABEL_95:
      Swift::Int v12 = v142;
      goto LABEL_96;
    }
    Swift::Int v12 = v142;
    Swift::Int v54 = v142 + v135;
    if (__OFADD__(v142, v135)) {
      goto LABEL_181;
    }
    if (v54 >= v4) {
      Swift::Int v54 = v4;
    }
    if (v54 >= v142)
    {
      if (v13 != v54)
      {
        uint64_t v139 = v2;
        Swift::Int v140 = v54;
        unint64_t v137 = v8;
        uint64_t v55 = v10 + 24 * v13;
        while (1)
        {
          Swift::Int v147 = v13;
          Swift::Int v56 = v142;
          uint64_t v143 = v55;
          uint64_t v57 = v55;
          while (1)
          {
            uint64_t v58 = *(void *)v55;
            uint64_t v59 = *(void *)(v55 + 8);
            unsigned int v60 = *(unsigned __int8 *)(v55 + 16);
            uint64_t v62 = *(void *)(v57 - 24);
            v57 -= 24;
            uint64_t v61 = v62;
            unint64_t v63 = *(void **)(v55 - 16);
            unsigned int v64 = *(unsigned __int8 *)(v55 - 8);
            uint64_t v165 = *(void *)v55;
            v151 = (void *)v59;
            uint64_t v149 = v62;
            if (v64 >> 6)
            {
              if (v64 >> 6 == 1)
              {
                uint64_t v156 = 0;
                unint64_t v162 = 0xE000000000000000;
                sub_1000319B8(v58, v59, v60);
                sub_1000319B8(v61, (uint64_t)v63, v64);
                v65._uint64_t countAndFlagsBits = 45;
                v65._unint64_t object = (void *)0xE100000000000000;
                String.append(_:)(v65);
                Character.write<A>(to:)();
                goto LABEL_82;
              }
              uint64_t v156 = 45;
              unint64_t v66 = 0xE100000000000000;
            }
            else
            {
              uint64_t v156 = 11565;
              unint64_t v66 = 0xE200000000000000;
            }
            unint64_t v162 = v66;
            sub_1000319B8(v58, v59, v60);
            sub_1000319B8(v61, (uint64_t)v63, v64);
            v67._uint64_t countAndFlagsBits = v61;
            v67._unint64_t object = v63;
            String.append(_:)(v67);
LABEL_82:
            uint64_t v68 = v156;
            unint64_t v69 = v162;
            if (!(v60 >> 6))
            {
              uint64_t v157 = 11565;
              unint64_t v71 = 0xE200000000000000;
LABEL_87:
              unint64_t v163 = v71;
              v72._uint64_t countAndFlagsBits = v165;
              v72._unint64_t object = v151;
              String.append(_:)(v72);
              goto LABEL_88;
            }
            if (v60 >> 6 != 1)
            {
              uint64_t v157 = 45;
              unint64_t v71 = 0xE100000000000000;
              goto LABEL_87;
            }
            uint64_t v157 = 0;
            unint64_t v163 = 0xE000000000000000;
            v70._uint64_t countAndFlagsBits = 45;
            v70._unint64_t object = (void *)0xE100000000000000;
            String.append(_:)(v70);
            Character.write<A>(to:)();
LABEL_88:
            if (v68 == v157 && v69 == v163) {
              break;
            }
            char v73 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_10002ECB8(v149, (uint64_t)v63, v64);
            uint64_t result = sub_10002ECB8(v165, (uint64_t)v151, v60);
            if ((v73 & 1) == 0) {
              goto LABEL_74;
            }
            if (!v145) {
              goto LABEL_183;
            }
            char v74 = *(unsigned char *)(v55 + 16);
            long long v75 = *(_OWORD *)v55;
            *(_OWORD *)uint64_t v55 = *(_OWORD *)v57;
            *(void *)(v55 + 16) = *(void *)(v57 + 16);
            *(_OWORD *)(v55 - 24) = v75;
            *(unsigned char *)(v55 - 8) = v74;
            ++v56;
            uint64_t v55 = v57;
            if (v147 == v56) {
              goto LABEL_74;
            }
          }
          swift_bridgeObjectRelease_n();
          sub_10002ECB8(v149, (uint64_t)v63, v64);
          uint64_t result = sub_10002ECB8(v165, (uint64_t)v151, v60);
LABEL_74:
          Swift::Int v13 = v147 + 1;
          uint64_t v55 = v143 + 24;
          if (v147 + 1 == v140)
          {
            uint64_t v2 = v139;
            Swift::Int v13 = v140;
            uint64_t v8 = v137;
            uint64_t v10 = v145;
            goto LABEL_95;
          }
        }
      }
LABEL_96:
      if (v13 < v12) {
        goto LABEL_172;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_100089938(0, *((void *)v8 + 2) + 1, 1, v8);
        uint64_t v8 = (char *)result;
      }
      unint64_t v77 = *((void *)v8 + 2);
      unint64_t v76 = *((void *)v8 + 3);
      unint64_t v11 = v77 + 1;
      if (v77 >= v76 >> 1)
      {
        uint64_t result = (uint64_t)sub_100089938((char *)(v76 > 1), v77 + 1, 1, v8);
        uint64_t v8 = (char *)result;
      }
      *((void *)v8 + 2) = v11;
      unint64_t v78 = v8 + 32;
      uint64_t v79 = &v8[16 * v77 + 32];
      *(void *)uint64_t v79 = v142;
      *((void *)v79 + 1) = v13;
      Swift::Int v148 = v13;
      if (!v77)
      {
        unint64_t v11 = 1;
LABEL_14:
        Swift::Int v4 = v141;
        Swift::Int v9 = v148;
        if (v148 >= v141) {
          goto LABEL_144;
        }
        continue;
      }
LABEL_102:
      unint64_t v80 = v11 - 1;
      if (v11 >= 4)
      {
        unint64_t v85 = &v78[2 * v11];
        uint64_t v86 = *(v85 - 8);
        uint64_t v87 = *(v85 - 7);
        BOOL v91 = __OFSUB__(v87, v86);
        uint64_t v88 = v87 - v86;
        if (v91) {
          goto LABEL_161;
        }
        uint64_t v90 = *(v85 - 6);
        uint64_t v89 = *(v85 - 5);
        BOOL v91 = __OFSUB__(v89, v90);
        uint64_t v83 = v89 - v90;
        char v84 = v91;
        if (v91) {
          goto LABEL_162;
        }
        unint64_t v92 = v11 - 2;
        unint64_t v93 = &v78[2 * v11 - 4];
        uint64_t v95 = *v93;
        uint64_t v94 = v93[1];
        BOOL v91 = __OFSUB__(v94, v95);
        uint64_t v96 = v94 - v95;
        if (v91) {
          goto LABEL_163;
        }
        BOOL v91 = __OFADD__(v83, v96);
        uint64_t v97 = v83 + v96;
        if (v91) {
          goto LABEL_165;
        }
        if (v97 >= v88)
        {
          uint64_t v115 = &v78[2 * v80];
          uint64_t v117 = *v115;
          uint64_t v116 = v115[1];
          BOOL v91 = __OFSUB__(v116, v117);
          uint64_t v118 = v116 - v117;
          if (v91) {
            goto LABEL_171;
          }
          BOOL v108 = v83 < v118;
        }
        else
        {
LABEL_115:
          if (v84) {
            goto LABEL_164;
          }
          unint64_t v92 = v11 - 2;
          unint64_t v98 = &v78[2 * v11 - 4];
          uint64_t v100 = *v98;
          uint64_t v99 = v98[1];
          BOOL v101 = __OFSUB__(v99, v100);
          uint64_t v102 = v99 - v100;
          char v103 = v101;
          if (v101) {
            goto LABEL_166;
          }
          unint64_t v104 = &v78[2 * v80];
          uint64_t v106 = *v104;
          uint64_t v105 = v104[1];
          BOOL v91 = __OFSUB__(v105, v106);
          uint64_t v107 = v105 - v106;
          if (v91) {
            goto LABEL_168;
          }
          if (__OFADD__(v102, v107)) {
            goto LABEL_170;
          }
          if (v102 + v107 < v83) {
            goto LABEL_127;
          }
          BOOL v108 = v83 < v107;
        }
        if (v108) {
          unint64_t v80 = v92;
        }
      }
      else
      {
        if (v11 == 3)
        {
          uint64_t v82 = *((void *)v8 + 4);
          uint64_t v81 = *((void *)v8 + 5);
          BOOL v91 = __OFSUB__(v81, v82);
          uint64_t v83 = v81 - v82;
          char v84 = v91;
          goto LABEL_115;
        }
        uint64_t v109 = *((void *)v8 + 4);
        uint64_t v110 = *((void *)v8 + 5);
        BOOL v91 = __OFSUB__(v110, v109);
        uint64_t v102 = v110 - v109;
        char v103 = v91;
LABEL_127:
        if (v103) {
          goto LABEL_167;
        }
        unint64_t v111 = &v78[2 * v80];
        uint64_t v113 = *v111;
        uint64_t v112 = v111[1];
        BOOL v91 = __OFSUB__(v112, v113);
        uint64_t v114 = v112 - v113;
        if (v91) {
          goto LABEL_169;
        }
        if (v114 < v102) {
          goto LABEL_14;
        }
      }
      unint64_t v119 = v80 - 1;
      if (v80 - 1 >= v11)
      {
        __break(1u);
LABEL_158:
        __break(1u);
LABEL_159:
        __break(1u);
LABEL_160:
        __break(1u);
LABEL_161:
        __break(1u);
LABEL_162:
        __break(1u);
LABEL_163:
        __break(1u);
LABEL_164:
        __break(1u);
LABEL_165:
        __break(1u);
LABEL_166:
        __break(1u);
LABEL_167:
        __break(1u);
LABEL_168:
        __break(1u);
LABEL_169:
        __break(1u);
LABEL_170:
        __break(1u);
LABEL_171:
        __break(1u);
LABEL_172:
        __break(1u);
LABEL_173:
        __break(1u);
LABEL_174:
        __break(1u);
LABEL_175:
        __break(1u);
LABEL_176:
        __break(1u);
LABEL_177:
        __break(1u);
LABEL_178:
        __break(1u);
LABEL_179:
        __break(1u);
LABEL_180:
        __break(1u);
LABEL_181:
        __break(1u);
        break;
      }
      if (!v10) {
        goto LABEL_184;
      }
      uint64_t v120 = v10;
      uint64_t v121 = &v78[2 * v119];
      uint64_t v122 = *v121;
      uint64_t v123 = &v78[2 * v80];
      uint64_t v124 = v123[1];
      uint64_t result = sub_100089304((char *)(v120 + 24 * *v121), (char *)(v120 + 24 * *v123), v120 + 24 * v124, v144);
      if (v2) {
        goto LABEL_155;
      }
      if (v124 < v122) {
        goto LABEL_158;
      }
      if (v80 > *((void *)v8 + 2)) {
        goto LABEL_159;
      }
      *uint64_t v121 = v122;
      v78[2 * v119 + 1] = v124;
      unint64_t v125 = *((void *)v8 + 2);
      if (v80 >= v125) {
        goto LABEL_160;
      }
      unint64_t v11 = v125 - 1;
      uint64_t result = (uint64_t)memmove(&v78[2 * v80], v123 + 2, 16 * (v125 - 1 - v80));
      *((void *)v8 + 2) = v125 - 1;
      uint64_t v10 = v145;
      if (v125 <= 2) {
        goto LABEL_14;
      }
      goto LABEL_102;
    }
    break;
  }
  __break(1u);
LABEL_183:
  __break(1u);
LABEL_184:
  __break(1u);
LABEL_185:
  __break(1u);
LABEL_186:
  __break(1u);
  return result;
}

uint64_t sub_100089030(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v24 = result;
  uint64_t v27 = a3;
  if (a3 != a2)
  {
    uint64_t v26 = *a4;
    uint64_t v4 = *a4 + 24 * a3;
LABEL_6:
    uint64_t v5 = v24;
    uint64_t v25 = v4;
    uint64_t v6 = v4;
    while (1)
    {
      uint64_t v34 = *(void *)v4;
      Swift::String v29 = *(void **)(v4 + 8);
      unsigned int v7 = *(unsigned __int8 *)(v4 + 16);
      uint64_t v9 = *(void *)(v6 - 24);
      v6 -= 24;
      uint64_t v8 = v9;
      uint64_t v10 = *(void **)(v4 - 16);
      unsigned int v11 = *(unsigned __int8 *)(v4 - 8);
      uint64_t v28 = (uint64_t)v10;
      if (v11 >> 6)
      {
        if (v11 >> 6 == 1)
        {
          uint64_t v30 = 0;
          unint64_t v32 = 0xE000000000000000;
          sub_1000319B8(v34, (uint64_t)v29, v7);
          sub_1000319B8(v8, (uint64_t)v10, v11);
          v12._uint64_t countAndFlagsBits = 45;
          v12._unint64_t object = (void *)0xE100000000000000;
          String.append(_:)(v12);
          Character.write<A>(to:)();
          goto LABEL_13;
        }
        uint64_t v30 = 45;
        unint64_t v13 = 0xE100000000000000;
      }
      else
      {
        uint64_t v30 = 11565;
        unint64_t v13 = 0xE200000000000000;
      }
      unint64_t v32 = v13;
      sub_1000319B8(v34, (uint64_t)v29, v7);
      sub_1000319B8(v8, (uint64_t)v10, v11);
      v14._uint64_t countAndFlagsBits = v8;
      v14._unint64_t object = v10;
      String.append(_:)(v14);
LABEL_13:
      uint64_t v15 = v30;
      unint64_t v16 = v32;
      if (!(v7 >> 6))
      {
        uint64_t v31 = 11565;
        unint64_t v18 = 0xE200000000000000;
LABEL_18:
        unint64_t v33 = v18;
        v19._uint64_t countAndFlagsBits = v34;
        v19._unint64_t object = v29;
        String.append(_:)(v19);
        goto LABEL_19;
      }
      if (v7 >> 6 != 1)
      {
        uint64_t v31 = 45;
        unint64_t v18 = 0xE100000000000000;
        goto LABEL_18;
      }
      uint64_t v31 = 0;
      unint64_t v33 = 0xE000000000000000;
      v17._uint64_t countAndFlagsBits = 45;
      v17._unint64_t object = (void *)0xE100000000000000;
      String.append(_:)(v17);
      Character.write<A>(to:)();
LABEL_19:
      if (v15 == v31 && v16 == v33)
      {
        swift_bridgeObjectRelease_n();
        sub_10002ECB8(v8, v28, v11);
        uint64_t result = sub_10002ECB8(v34, (uint64_t)v29, v7);
LABEL_5:
        uint64_t v4 = v25 + 24;
        if (++v27 == a2) {
          return result;
        }
        goto LABEL_6;
      }
      char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10002ECB8(v8, v28, v11);
      uint64_t result = sub_10002ECB8(v34, (uint64_t)v29, v7);
      if ((v20 & 1) == 0) {
        goto LABEL_5;
      }
      if (!v26)
      {
        __break(1u);
        return result;
      }
      char v21 = *(unsigned char *)(v4 + 16);
      long long v22 = *(_OWORD *)v4;
      *(_OWORD *)uint64_t v4 = *(_OWORD *)v6;
      *(void *)(v4 + 16) = *(void *)(v6 + 16);
      *(_OWORD *)(v4 - 24) = v22;
      *(unsigned char *)(v4 - 8) = v21;
      ++v5;
      uint64_t v4 = v6;
      if (v27 == v5) {
        goto LABEL_5;
      }
    }
  }
  return result;
}

uint64_t sub_100089304(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = __src;
  uint64_t v6 = __dst;
  int64_t v7 = __src - __dst;
  int64_t v8 = (__src - __dst) / 24;
  uint64_t v9 = a3 - (void)__src;
  uint64_t v10 = (uint64_t)(a3 - (void)__src) / 24;
  if (v8 >= v10)
  {
    uint64_t v31 = 24 * v10;
    if (a4 != __src || &__src[v31] <= a4) {
      memmove(a4, __src, 24 * v10);
    }
    Swift::String v12 = &v4[v31];
    if (v6 >= v5 || v9 < 24) {
      goto LABEL_66;
    }
    unint64_t v32 = a3 - 24;
    unsigned int v64 = v6;
    unint64_t v66 = v4;
    while (1)
    {
      uint64_t v33 = *((void *)v12 - 3);
      uint64_t v34 = (void *)*((void *)v12 - 2);
      uint64_t v35 = v12 - 24;
      unsigned int v36 = *(v12 - 8);
      uint64_t v37 = *((void *)v5 - 3);
      unint64_t v38 = v5 - 24;
      unsigned int v60 = (void *)*((void *)v5 - 2);
      unsigned int v39 = *(v5 - 8);
      unint64_t v76 = v5;
      uint64_t v62 = v12;
      uint64_t v57 = v37;
      unsigned __int8 v56 = *(v5 - 8);
      if (v39 >> 6)
      {
        if (v39 >> 6 == 1)
        {
          uint64_t v69 = 0;
          unint64_t v73 = 0xE000000000000000;
          sub_1000319B8(v33, (uint64_t)v34, v36);
          sub_1000319B8(v37, (uint64_t)v60, v39);
          v40._uint64_t countAndFlagsBits = 45;
          v40._unint64_t object = (void *)0xE100000000000000;
          String.append(_:)(v40);
          Character.write<A>(to:)();
          goto LABEL_43;
        }
        uint64_t v69 = 45;
        unint64_t v41 = 0xE100000000000000;
      }
      else
      {
        uint64_t v69 = 11565;
        unint64_t v41 = 0xE200000000000000;
      }
      unint64_t v73 = v41;
      sub_1000319B8(v33, (uint64_t)v34, v36);
      sub_1000319B8(v37, (uint64_t)v60, v39);
      v42._uint64_t countAndFlagsBits = v37;
      v42._unint64_t object = v60;
      String.append(_:)(v42);
LABEL_43:
      uint64_t v44 = v69;
      unint64_t v43 = v73;
      unsigned __int8 v58 = v36;
      if (!(v36 >> 6))
      {
        uint64_t v70 = 11565;
        unint64_t v46 = 0xE200000000000000;
LABEL_48:
        unint64_t v74 = v46;
        v47._uint64_t countAndFlagsBits = v33;
        v47._unint64_t object = v34;
        String.append(_:)(v47);
        goto LABEL_49;
      }
      if (v36 >> 6 != 1)
      {
        uint64_t v70 = 45;
        unint64_t v46 = 0xE100000000000000;
        goto LABEL_48;
      }
      uint64_t v70 = 0;
      unint64_t v74 = 0xE000000000000000;
      v45._uint64_t countAndFlagsBits = 45;
      v45._unint64_t object = (void *)0xE100000000000000;
      String.append(_:)(v45);
      Character.write<A>(to:)();
LABEL_49:
      uint64_t v48 = (uint64_t)v34;
      if (v44 == v70 && v43 == v74)
      {
        uint64_t v49 = v33;
        char v50 = 0;
      }
      else
      {
        uint64_t v49 = v33;
        char v50 = _stringCompareWithSmolCheck(_:_:expecting:)();
      }
      char v51 = (char *)(v32 + 24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10002ECB8(v57, (uint64_t)v60, v56);
      sub_10002ECB8(v49, v48, v58);
      if (v50)
      {
        uint64_t v4 = v66;
        Swift::String v12 = v62;
        if (v51 == v76)
        {
          uint64_t v5 = v38;
          unint64_t v52 = (unint64_t)v64;
          if (v32 < (unint64_t)v76) {
            goto LABEL_64;
          }
          goto LABEL_63;
        }
        uint64_t v5 = v38;
      }
      else
      {
        uint64_t v4 = v66;
        unint64_t v38 = v35;
        if (v51 == v62)
        {
          Swift::String v12 = v35;
          uint64_t v5 = v76;
          unint64_t v52 = (unint64_t)v64;
          if (v32 < (unint64_t)v62) {
            goto LABEL_64;
          }
          goto LABEL_63;
        }
        Swift::String v12 = v35;
        uint64_t v5 = v76;
      }
      unint64_t v52 = (unint64_t)v64;
LABEL_63:
      long long v53 = *(_OWORD *)v38;
      *(void *)(v32 + 16) = *((void *)v38 + 2);
      *(_OWORD *)unint64_t v32 = v53;
LABEL_64:
      if ((unint64_t)v5 > v52)
      {
        v32 -= 24;
        if (v12 > v4) {
          continue;
        }
      }
      goto LABEL_66;
    }
  }
  size_t v11 = 24 * v8;
  if (a4 != __dst || &__dst[v11] <= a4) {
    memmove(a4, __dst, v11);
  }
  Swift::String v12 = &v4[v11];
  if ((unint64_t)v5 < a3 && v7 >= 24)
  {
    uint64_t v61 = &v4[v11];
    do
    {
      unint64_t v63 = v6;
      Swift::String v65 = v4;
      uint64_t v14 = *(void *)v5;
      unint64_t v13 = (void *)*((void *)v5 + 1);
      unsigned int v15 = v5[16];
      uint64_t v16 = *(void *)v4;
      Swift::String v17 = (void *)*((void *)v4 + 1);
      unsigned int v18 = v4[16];
      long long v75 = v5;
      if (v18 >> 6)
      {
        if (v18 >> 6 == 1)
        {
          uint64_t v67 = 0;
          unint64_t v71 = 0xE000000000000000;
          sub_1000319B8(v14, (uint64_t)v13, v15);
          sub_1000319B8(v16, (uint64_t)v17, v18);
          v19._uint64_t countAndFlagsBits = 45;
          v19._unint64_t object = (void *)0xE100000000000000;
          String.append(_:)(v19);
          Character.write<A>(to:)();
          goto LABEL_14;
        }
        uint64_t v67 = 45;
        unint64_t v20 = 0xE100000000000000;
      }
      else
      {
        uint64_t v67 = 11565;
        unint64_t v20 = 0xE200000000000000;
      }
      unint64_t v71 = v20;
      sub_1000319B8(v14, (uint64_t)v13, v15);
      sub_1000319B8(v16, (uint64_t)v17, v18);
      v21._uint64_t countAndFlagsBits = v16;
      v21._unint64_t object = v17;
      String.append(_:)(v21);
LABEL_14:
      uint64_t v23 = v67;
      unint64_t v22 = v71;
      if (!(v15 >> 6))
      {
        uint64_t v68 = 11565;
        unint64_t v25 = 0xE200000000000000;
LABEL_19:
        unint64_t v72 = v25;
        v26._uint64_t countAndFlagsBits = v14;
        v26._unint64_t object = v13;
        String.append(_:)(v26);
        goto LABEL_20;
      }
      if (v15 >> 6 != 1)
      {
        uint64_t v68 = 45;
        unint64_t v25 = 0xE100000000000000;
        goto LABEL_19;
      }
      uint64_t v68 = 0;
      unint64_t v72 = 0xE000000000000000;
      v24._uint64_t countAndFlagsBits = 45;
      v24._unint64_t object = (void *)0xE100000000000000;
      String.append(_:)(v24);
      Character.write<A>(to:)();
LABEL_20:
      if (v23 == v68 && v22 == v72)
      {
        swift_bridgeObjectRelease_n();
        sub_10002ECB8(v16, (uint64_t)v17, v18);
        sub_10002ECB8(v14, (uint64_t)v13, v15);
LABEL_26:
        Swift::String v29 = v63;
        uint64_t v28 = v65;
        uint64_t v4 = v65 + 24;
        uint64_t v5 = v75;
        if (v63 == v65) {
          goto LABEL_28;
        }
LABEL_27:
        long long v30 = *(_OWORD *)v28;
        *((void *)v29 + 2) = *((void *)v28 + 2);
        *(_OWORD *)Swift::String v29 = v30;
        goto LABEL_28;
      }
      char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10002ECB8(v16, (uint64_t)v17, v18);
      sub_10002ECB8(v14, (uint64_t)v13, v15);
      if ((v27 & 1) == 0) {
        goto LABEL_26;
      }
      uint64_t v28 = v75;
      uint64_t v5 = v75 + 24;
      Swift::String v29 = v63;
      uint64_t v4 = v65;
      if (v63 != v75) {
        goto LABEL_27;
      }
LABEL_28:
      uint64_t v6 = v29 + 24;
      Swift::String v12 = v61;
    }
    while (v4 < v61 && (unint64_t)v5 < a3);
  }
  uint64_t v5 = v6;
LABEL_66:
  size_t v54 = 24 * ((v12 - v4) / 24);
  if (v5 != v4 || v5 >= &v4[v54]) {
    memmove(v5, v4, v54);
  }
  return 1;
}

char *sub_100089938(char *result, int64_t a2, char a3, char *a4)
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
    sub_100003DD0(&qword_1000C5DF0);
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
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_100089A34(uint64_t a1)
{
  return sub_100089938(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_100089A48(uint64_t a1)
{
  return sub_100057148(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_100089A5C(uint64_t a1)
{
  return sub_100057D6C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

BOOL sub_100089A70(uint64_t a1)
{
  return *(void *)(a1 + 8) != 0;
}

uint64_t sub_100089A80@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = a1[1];
  if (result)
  {
    *a2 = *a1;
    a2[1] = result;
    return swift_bridgeObjectRetain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100089A9C(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (v8 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0, (v8 & 1) != 0))
    {
      if (a1[4] == a2[4] && a1[5] == a2[5])
      {
        return 1;
      }
      else
      {
        return _stringCompareWithSmolCheck(_:_:expecting:)();
      }
    }
  }
  return result;
}

char *sub_100089B50(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v4 = a2 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v22 = v4;
    char v5 = (unsigned __int8 *)(swift_bridgeObjectRetain() + 48);
    unint64_t v6 = (char *)_swiftEmptyArrayStorage;
    while (1)
    {
      uint64_t v7 = *((void *)v5 - 2);
      uint64_t v8 = *((void *)v5 - 1);
      unsigned int v9 = *v5;
      if (!(v9 >> 6)) {
        break;
      }
      if (v9 >> 6 == 1)
      {
        char v10 = v9 & 1 | 0x40;
LABEL_9:
        unint64_t v11 = *((void *)v5 - 2);
        uint64_t v12 = *((void *)v5 - 1);
        goto LABEL_10;
      }
      if (v8 | v7 || v9 != 128)
      {
        if (!v22)
        {
          _StringGuts.grow(_:)(54);
          v19._uint64_t countAndFlagsBits = 0x272079654BLL;
          v19._unint64_t object = (void *)0xE500000000000000;
          String.append(_:)(v19);
          swift_bridgeObjectRetain();
          v20._uint64_t countAndFlagsBits = a2;
          v20._unint64_t object = (void *)a3;
          String.append(_:)(v20);
          swift_bridgeObjectRelease();
          v21._unint64_t object = (void *)0x80000001000A9670;
          v21._uint64_t countAndFlagsBits = 0xD00000000000002FLL;
          String.append(_:)(v21);
          uint64_t result = (char *)_assertionFailure(_:_:file:line:flags:)();
          __break(1u);
          return result;
        }
        swift_bridgeObjectRetain();
        unint64_t v11 = String.subscript.getter();
        uint64_t v12 = v17;
        swift_bridgeObjectRelease();
        char v10 = 64;
      }
      else
      {
        swift_bridgeObjectRetain();
        unint64_t v11 = sub_100055A44(45, 0xE100000000000000, a2, a3);
        uint64_t v12 = v16;
        swift_bridgeObjectRelease();
        char v10 = 0;
      }
LABEL_10:
      sub_1000439B8(v7, v8, v9);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v6 = sub_10005FB94(0, *((void *)v6 + 2) + 1, 1, v6);
      }
      unint64_t v14 = *((void *)v6 + 2);
      unint64_t v13 = *((void *)v6 + 3);
      if (v14 >= v13 >> 1) {
        unint64_t v6 = sub_10005FB94((char *)(v13 > 1), v14 + 1, 1, v6);
      }
      v5 += 24;
      *((void *)v6 + 2) = v14 + 1;
      unsigned int v15 = &v6[24 * v14];
      *((void *)v15 + 4) = v11;
      *((void *)v15 + 5) = v12;
      v15[48] = v10;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return v6;
      }
    }
    char v10 = (_BYTE)v9 << 7;
    goto LABEL_9;
  }
  return (char *)_swiftEmptyArrayStorage;
}

char *sub_100089DDC(uint64_t a1, uint64_t a2)
{
  void (*v8)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void v21[12];
  char v22;
  void v23[17];
  unsigned char v24[16];
  void v25[3];
  uint64_t v26;

  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return (char *)_swiftEmptyArrayStorage;
  }
  unsigned int v18 = a2 + 112;
  uint64_t v3 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  uint64_t v4 = (char *)_swiftEmptyArrayStorage;
  do
  {
    uint64_t v7 = *(v3 - 1);
    uint64_t v6 = *v3;
    uint64_t v8 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(*v3 + 16);
    v8(v21, v7, *v3);
    sub_10002DDE4((uint64_t)v21);
    if (v22)
    {
      unsigned int v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v7, v6);
      unint64_t v11 = v10;
      Swift::String v26 = v9;
      Swift::String v19 = v9;
      Swift::String v20 = v10;
      sub_10002B998(v18, (uint64_t)v24, &qword_1000C5720);
      sub_10002B998((uint64_t)v24, (uint64_t)v25, &qword_1000C5720);
      if (v25[0] && v7 == v25[0])
      {
        v12._uint64_t countAndFlagsBits = 0x6C75616665642820;
        v12._unint64_t object = (void *)0xEA00000000002974;
        String.append(_:)(v12);
        unint64_t v11 = v20;
        Swift::String v26 = v19;
      }
      v8(v23, v7, v6);
      unint64_t v14 = v23[4];
      unint64_t v13 = v23[5];
      swift_bridgeObjectRetain();
      sub_10002DDE4((uint64_t)v23);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v4 = sub_10006074C(0, *((void *)v4 + 2) + 1, 1, v4);
      }
      uint64_t v16 = *((void *)v4 + 2);
      unsigned int v15 = *((void *)v4 + 3);
      if (v16 >= v15 >> 1) {
        uint64_t v4 = sub_10006074C((char *)(v15 > 1), v16 + 1, 1, v4);
      }
      *((void *)v4 + 2) = v16 + 1;
      char v5 = &v4[48 * v16];
      *((void *)v5 + 4) = v26;
      *((void *)v5 + 5) = v11;
      *((void *)v5 + 6) = v14;
      *((void *)v5 + 7) = v13;
      *((void *)v5 + 8) = 0;
      *((void *)v5 + 9) = 0xE000000000000000;
    }
    v3 += 2;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  return v4;
}

void *sub_100089FE0(uint64_t a1, int a2)
{
  if (!*(void *)(a1 + 16)) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v118 = *(void *)(a1 + 16);
  unint64_t v136 = sub_100083F5C((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v119 = a1;
  uint64_t v7 = sub_100031C40(a2, a1);
  unint64_t v8 = (unint64_t)v7;
  uint64_t v122 = v9;
  uint64_t v10 = v7[2];
  unint64_t v11 = 0;
  if (!v10)
  {
    uint64_t v124 = (char *)_swiftEmptyArrayStorage;
    uint64_t v121 = (char *)_swiftEmptyArrayStorage;
LABEL_118:
    (*(void (**)(uint64_t *__return_ptr))(*(void *)(v119 + 16 * v118 + 24) + 16))(&v137);
    uint64_t v108 = swift_bridgeObjectRetain();
    uint64_t v10 = (uint64_t)sub_100089DDC(v108, (uint64_t)&v137);
    swift_bridgeObjectRelease();
    sub_10002DDE4((uint64_t)&v137);
    sub_100003DD0(&qword_1000C56D8);
    uint64_t v109 = swift_allocObject();
    *(_OWORD *)(v109 + 16) = xmmword_1000A2660;
    *(void *)(v109 + 32) = 0;
    *(void *)(v109 + 40) = 0;
    *(void *)(v109 + 48) = v121;
    *(void *)(v109 + 56) = 0;
    *(void *)(v109 + 64) = 0xE000000000000000;
    *(unsigned char *)(v109 + 72) = 0;
    swift_bridgeObjectRetain();
    uint64_t v110 = swift_bridgeObjectRetain();
    uint64_t v12 = (uint64_t)sub_100085D80(v110, (uint64_t *)&v136);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    sub_10005EDB4(v12);
    unint64_t v2 = *(void *)(v109 + 16);
    int64_t v3 = v2 + 2;
    if (__OFADD__(v2, 2))
    {
LABEL_140:
      __break(1u);
    }
    else
    {
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || (uint64_t v12 = v109, v3 > *(void *)(v109 + 24) >> 1))
      {
        if ((uint64_t)v2 <= v3) {
          int64_t v112 = v2 + 2;
        }
        else {
          int64_t v112 = v2;
        }
        uint64_t v12 = (uint64_t)sub_100060634(isUniquelyReferenced_nonNull_native, v112, 1, (char *)v109);
      }
      int64_t v3 = *(void *)(v12 + 16);
      unint64_t v4 = *(void *)(v12 + 24);
      unint64_t v2 = v3 + 1;
      swift_bridgeObjectRetain();
      if (v3 < v4 >> 1) {
        goto LABEL_126;
      }
    }
    uint64_t v12 = (uint64_t)sub_100060634((char *)(v4 > 1), v2, 1, (char *)v12);
LABEL_126:
    *(void *)(v12 + 16) = v2;
    uint64_t v113 = v12 + 48 * v3;
    *(_OWORD *)(v113 + 32) = xmmword_1000A3EF0;
    *(void *)(v113 + 48) = v124;
    *(void *)(v113 + 56) = 0;
    *(void *)(v113 + 64) = 0xE000000000000000;
    *(unsigned char *)(v113 + 72) = 0;
    unint64_t v114 = *(void *)(v12 + 24);
    int64_t v115 = v3 + 2;
    swift_bridgeObjectRetain();
    if (v2 >= v114 >> 1) {
      uint64_t v12 = (uint64_t)sub_100060634((char *)(v114 > 1), v115, 1, (char *)v12);
    }
    *(void *)(v12 + 16) = v115;
    unint64_t v116 = v12 + 48 * v2;
    *(_OWORD *)(v116 + 32) = xmmword_1000A3F00;
    *(void *)(v116 + 48) = v10;
    *(void *)(v116 + 56) = 0;
    *(void *)(v116 + 64) = 0xE000000000000000;
    *(unsigned char *)(v116 + 72) = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10008B968((uint64_t)v11);
    return (void *)v12;
  }
  uint64_t v12 = 0;
  uint64_t v128 = v7 + 4;
  uint64_t v126 = (char *)_swiftEmptyArrayStorage;
  uint64_t v127 = v7[2];
  uint64_t v123 = v7;
  uint64_t v124 = (char *)_swiftEmptyArrayStorage;
  uint64_t v121 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    if (v12 >= v10)
    {
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
      goto LABEL_140;
    }
    if (v12 < 0) {
      goto LABEL_131;
    }
    int64_t v14 = *(void *)(v8 + 16);
    if (v12 >= (unint64_t)v14) {
      goto LABEL_132;
    }
    unsigned int v15 = (long long *)&v128[24 * v12];
    long long v16 = *v15;
    long long v17 = v15[1];
    long long v18 = v15[3];
    long long v148 = v15[2];
    long long v149 = v18;
    long long v146 = v16;
    long long v147 = v17;
    long long v19 = v15[4];
    long long v20 = v15[5];
    long long v21 = v15[7];
    long long v152 = v15[6];
    long long v153 = v21;
    long long v150 = v19;
    long long v151 = v20;
    long long v22 = v15[8];
    long long v23 = v15[9];
    long long v24 = v15[11];
    long long v156 = v15[10];
    long long v157 = v24;
    long long v154 = v22;
    long long v155 = v23;
    unint64_t v4 = *((void *)&v147 + 1);
    uint64_t v129 = v147;
    uint64_t v25 = v153;
    uint64_t v134 = v151;
    unint64_t v135 = *((void *)&v153 + 1);
    unint64_t v2 = v12 + 1;
    uint64_t v132 = *((void *)&v150 + 1);
    uint64_t v133 = v153;
    if (v149)
    {
      uint64_t v125 = *((void *)&v147 + 1);
      int64_t v3 = v10;
      if (v2 != v10)
      {
        uint64_t v120 = v11;
        unint64_t v11 = *(void (**)(void *@<X8>))(v148 + 16);
        int64_t v3 = v12 + 1;
        uint64_t v131 = v148;
        unint64_t v2 = v148 + 32;
        while (1)
        {
          if (v3 >= v10) {
            goto LABEL_133;
          }
          if (v3 >= v14) {
            goto LABEL_134;
          }
          uint64_t v38 = v128[24 * v3 + 4];
          if (*(void (**)(void *@<X8>))(v38 + 16) != v11) {
            goto LABEL_58;
          }
          if (v11 && v38 != v131) {
            break;
          }
LABEL_55:
          if (__OFADD__(v3++, 1)) {
            goto LABEL_136;
          }
          uint64_t v10 = v127;
          unint64_t v8 = (unint64_t)v123;
          if (v3 == v127)
          {
            int64_t v3 = v127;
LABEL_58:
            unint64_t v11 = v120;
LABEL_60:
            unint64_t v2 = v12 + 1;
            goto LABEL_61;
          }
        }
        uint64_t v10 = 0;
        uint64_t v39 = v38 + 32;
        while (1)
        {
          Swift::String v40 = (void *)(v39 + 24 * v10);
          unint64_t v41 = (void *)v40[2];
          Swift::String v42 = (void *)(v2 + 24 * v10);
          unint64_t v43 = (void *)v42[2];
          BOOL v44 = *v40 == *v42 && v40[1] == v42[1];
          if (!v44 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
            break;
          }
          unint64_t v4 = v41[2];
          if (v4 != v43[2]) {
            break;
          }
          if (v4) {
            BOOL v45 = v41 == v43;
          }
          else {
            BOOL v45 = 1;
          }
          if (!v45)
          {
            BOOL v46 = v41[4] == v43[4] && v41[5] == v43[5];
            if (!v46 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
              break;
            }
            if (v4 != 1)
            {
              BOOL v47 = v41[6] == v43[6] && v41[7] == v43[7];
              if (!v47 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
                break;
              }
              v4 -= 2;
              if (v4)
              {
                uint64_t v48 = v43 + 9;
                uint64_t v49 = v41 + 9;
                do
                {
                  BOOL v50 = *(v49 - 1) == *(v48 - 1) && *v49 == *v48;
                  if (!v50 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
                    goto LABEL_59;
                  }
                  v48 += 2;
                  v49 += 2;
                }
                while (--v4);
              }
            }
          }
          if ((void (*)(void *@<X8>))++v10 == v11) {
            goto LABEL_55;
          }
        }
LABEL_59:
        unint64_t v8 = (unint64_t)v123;
        unint64_t v11 = v120;
        uint64_t v10 = v127;
        goto LABEL_60;
      }
LABEL_61:
      sub_100003DD0(&qword_1000C5230);
      unint64_t v52 = (_OWORD *)swift_allocObject();
      long long v53 = v154;
      long long v54 = v156;
      long long v55 = v157;
      v52[11] = v155;
      v52[12] = v54;
      v52[13] = v55;
      long long v56 = v150;
      long long v57 = v152;
      long long v58 = v153;
      v52[7] = v151;
      v52[8] = v57;
      v52[9] = v58;
      v52[10] = v53;
      long long v59 = v146;
      long long v60 = v147;
      v52[1] = xmmword_1000A2660;
      v52[2] = v59;
      long long v61 = v148;
      long long v62 = v149;
      v52[3] = v60;
      v52[4] = v61;
      v52[5] = v62;
      v52[6] = v56;
      if (v3 <= v12) {
        goto LABEL_137;
      }
      if (v10 < v3) {
        goto LABEL_138;
      }
      uint64_t v137 = (uint64_t)v52;
      sub_10002E940((uint64_t)&v146);
      sub_10002E940((uint64_t)&v146);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_10005EEA4(v2, v3, v8, v122);
      uint64_t v63 = v137;
      uint64_t v138 = sub_100087C84;
      uint64_t v139 = 0;
      swift_bridgeObjectRetain();
      sub_100003DD0(&qword_1000C5E50);
      sub_10008B8A8(&qword_1000C5E58, &qword_1000C5E50, &qword_1000C5E60, &qword_1000C5E68);
      uint64_t v64 = BidirectionalCollection<>.joined(separator:)();
      uint64_t v66 = v65;
      swift_bridgeObjectRelease();
      uint64_t v67 = v125;
      if (v125)
      {
        uint64_t v137 = 0x746C756166656428;
        uint64_t v138 = (uint64_t (*)@<X0>(uint64_t *@<X8>))0xEA0000000000203ALL;
        uint64_t v68 = v129;
        String.append(_:)(*(Swift::String *)(&v67 - 1));
        v69._uint64_t countAndFlagsBits = 41;
        v69._unint64_t object = (void *)0xE100000000000000;
        String.append(_:)(v69);
        uint64_t v70 = 0x746C756166656428;
        unint64_t v71 = 0xEA0000000000203ALL;
      }
      else
      {
        uint64_t v70 = 0;
        unint64_t v71 = 0xE000000000000000;
      }
      uint64_t v72 = *(void *)(v63 + 16);
      uint64_t v130 = v64;
      if (v72)
      {
        unint64_t v73 = (uint64_t *)(v63 + 96);
        while (1)
        {
          uint64_t v75 = *(v73 - 1);
          uint64_t v74 = *v73;
          uint64_t v76 = HIBYTE(*v73) & 0xF;
          if ((*v73 & 0x2000000000000000) == 0) {
            uint64_t v76 = v75 & 0xFFFFFFFFFFFFLL;
          }
          if (v76) {
            break;
          }
          v73 += 24;
          if (!--v72) {
            goto LABEL_73;
          }
        }
        uint64_t v30 = v66;
        swift_bridgeObjectRetain();
      }
      else
      {
LABEL_73:
        uint64_t v30 = v66;
        uint64_t v75 = 0;
        uint64_t v74 = 0;
      }
      swift_bridgeObjectRelease();
      sub_100003DD0(&qword_1000C5DF8);
      uint64_t v77 = swift_allocObject();
      *(_OWORD *)(v77 + 16) = xmmword_1000A2CD0;
      *(void *)(v77 + 32) = v75;
      *(void *)(v77 + 40) = v74;
      *(void *)(v77 + 48) = v70;
      *(void *)(v77 + 56) = v71;
      uint64_t v137 = v77;
      uint64_t v138 = (uint64_t (*)@<X0>(uint64_t *@<X8>))sub_100087CE8;
      uint64_t v139 = 0;
      Swift::Int v140 = sub_100089A70;
      uint64_t v141 = 0;
      Swift::Int v142 = sub_100089A80;
      uint64_t v143 = 0;
      v144 = sub_100087CEC;
      uint64_t v145 = 0;
      sub_100003DD0(&qword_1000C5E00);
      sub_10008B7A8(&qword_1000C5E08, &qword_1000C5E00, (void (*)(void))sub_10008B76C);
      uint64_t v10 = BidirectionalCollection<>.joined(separator:)();
      unint64_t v4 = v78;
      swift_bridgeObjectRelease();
      uint64_t v25 = v133;
    }
    else
    {
      uint64_t v26 = *((void *)&v149 + 1);
      uint64_t v27 = v150;
      sub_10002E940((uint64_t)&v146);
      uint64_t v28 = sub_10008F9F0();
      uint64_t v30 = v29;
      uint64_t v130 = v28;
      if (v4)
      {
        uint64_t v31 = HIBYTE(v4) & 0xF;
        uint64_t v32 = v129;
        int64_t v33 = v12 + 1;
        if ((v4 & 0x2000000000000000) == 0) {
          uint64_t v31 = v129 & 0xFFFFFFFFFFFFLL;
        }
        if (v31)
        {
          unint64_t v34 = v4;
          String.append(_:)(*(Swift::String *)&v32);
          v35._uint64_t countAndFlagsBits = 41;
          v35._unint64_t object = (void *)0xE100000000000000;
          String.append(_:)(v35);
          uint64_t v37 = 0x746C756166656428;
          unint64_t v36 = 0xEA0000000000203ALL;
        }
        else
        {
          uint64_t v37 = 0;
          unint64_t v36 = 0;
        }
      }
      else
      {
        int64_t v33 = v12 + 1;
        unint64_t v36 = 0;
        uint64_t v37 = v129;
      }
      sub_100003DD0(&qword_1000C5DF8);
      uint64_t v79 = swift_allocObject();
      *(_OWORD *)(v79 + 16) = xmmword_1000A2CD0;
      *(void *)(v79 + 32) = v26;
      *(void *)(v79 + 40) = v27;
      *(void *)(v79 + 48) = v37;
      *(void *)(v79 + 56) = v36;
      uint64_t v137 = v79;
      uint64_t v138 = (uint64_t (*)@<X0>(uint64_t *@<X8>))sub_100087CE8;
      uint64_t v139 = 0;
      Swift::Int v140 = sub_100089A70;
      uint64_t v141 = 0;
      Swift::Int v142 = sub_100089A80;
      uint64_t v143 = 0;
      v144 = sub_10008C4B4;
      uint64_t v145 = 0;
      swift_bridgeObjectRetain();
      sub_100003DD0(&qword_1000C5E00);
      sub_10008B7A8(&qword_1000C5E08, &qword_1000C5E00, (void (*)(void))sub_10008B76C);
      uint64_t v10 = BidirectionalCollection<>.joined(separator:)();
      unint64_t v4 = v80;
      swift_bridgeObjectRelease();
      int64_t v3 = v33;
    }
    uint64_t v12 = v3;
    int64_t v3 = v135;
    if ((v135 & 0x2000000000000000) != 0) {
      uint64_t v81 = HIBYTE(v135) & 0xF;
    }
    else {
      uint64_t v81 = v25 & 0xFFFFFFFFFFFFLL;
    }
    sub_1000673F8(&v146, &v158);
    if (!v81)
    {
      sub_1000673F8(&v158, v159);
      if (v159[0])
      {
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v124 = sub_10006074C(0, *((void *)v124 + 2) + 1, 1, v124);
        }
        unint64_t v2 = *((void *)v124 + 2);
        unint64_t v96 = *((void *)v124 + 3);
        if (v2 >= v96 >> 1) {
          uint64_t v124 = sub_10006074C((char *)(v96 > 1), v2 + 1, 1, v124);
        }
        *((void *)v124 + 2) = v2 + 1;
        unint64_t v13 = &v124[48 * v2];
        *((void *)v13 + 4) = v130;
        *((void *)v13 + 5) = v30;
        *((void *)v13 + 6) = v10;
        *((void *)v13 + 7) = v4;
        *((void *)v13 + 8) = v132;
        *((void *)v13 + 9) = v134;
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v121 = sub_10006074C(0, *((void *)v121 + 2) + 1, 1, v121);
        }
        unint64_t v2 = *((void *)v121 + 2);
        unint64_t v106 = *((void *)v121 + 3);
        if (v2 >= v106 >> 1) {
          uint64_t v121 = sub_10006074C((char *)(v106 > 1), v2 + 1, 1, v121);
        }
        *((void *)v121 + 2) = v2 + 1;
        uint64_t v107 = &v121[48 * v2];
        *((void *)v107 + 4) = v130;
        *((void *)v107 + 5) = v30;
        *((void *)v107 + 6) = v10;
        *((void *)v107 + 7) = v4;
        *((void *)v107 + 8) = v132;
        *((void *)v107 + 9) = v134;
        swift_bridgeObjectRelease();
      }
      sub_10002EAFC((uint64_t)&v146);
      goto LABEL_6;
    }
    uint64_t v82 = (void *)v136;
    uint64_t v83 = *(void *)(v136 + 16);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_10008B93C(&v158);
    if (!v83
      || (swift_bridgeObjectRetain(), sub_1000247D8(v25, v135), char v85 = v84, swift_bridgeObjectRelease(), (v85 & 1) == 0))
    {
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v126 = sub_10005FA90(0, *((void *)v126 + 2) + 1, 1, v126);
      }
      unint64_t v87 = *((void *)v126 + 2);
      unint64_t v86 = *((void *)v126 + 3);
      if (v87 >= v86 >> 1) {
        uint64_t v126 = sub_10005FA90((char *)(v86 > 1), v87 + 1, 1, v126);
      }
      *((void *)v126 + 2) = v87 + 1;
      uint64_t v88 = &v126[16 * v87];
      *((void *)v88 + 4) = v25;
      *((void *)v88 + 5) = v135;
      uint64_t v82 = (void *)v136;
    }
    sub_10008B968((uint64_t)v11);
    unint64_t v2 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v137 = (uint64_t)v82;
    int64_t v3 = sub_1000247D8(v25, v135);
    uint64_t v90 = v82[2];
    BOOL v91 = (v89 & 1) == 0;
    uint64_t v92 = v90 + v91;
    if (__OFADD__(v90, v91)) {
      goto LABEL_135;
    }
    char v93 = v89;
    if (v82[3] >= v92)
    {
      if ((v2 & 1) == 0)
      {
        sub_10007A784();
        uint64_t v82 = (void *)v137;
      }
      goto LABEL_100;
    }
    sub_10007B264(v92, v2);
    uint64_t v82 = (void *)v137;
    unint64_t v94 = sub_1000247D8(v133, v135);
    if ((v93 & 1) != (v95 & 1)) {
      break;
    }
    int64_t v3 = v94;
LABEL_100:
    unint64_t v136 = (unint64_t)v82;
    swift_bridgeObjectRelease();
    if ((v93 & 1) == 0)
    {
      v82[((unint64_t)v3 >> 6) + 8] |= 1 << v3;
      uint64_t v97 = (uint64_t *)(v82[6] + 16 * v3);
      unint64_t v11 = (void (*)(void *@<X8>))v135;
      *uint64_t v97 = v133;
      v97[1] = v135;
      *(void *)(v82[7] + 8 * v3) = _swiftEmptyArrayStorage;
      uint64_t v98 = v82[2];
      unint64_t v2 = v98 + 1;
      BOOL v99 = __OFADD__(v98, 1);
      swift_bridgeObjectRetain();
      if (v99) {
        goto LABEL_139;
      }
      v82[2] = v2;
    }
    swift_bridgeObjectRetain();
    uint64_t v100 = v82[7];
    swift_bridgeObjectRelease();
    BOOL v101 = *(char **)(v100 + 8 * v3);
    char v102 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v100 + 8 * v3) = v101;
    if ((v102 & 1) == 0)
    {
      BOOL v101 = sub_10006074C(0, *((void *)v101 + 2) + 1, 1, v101);
      *(void *)(v100 + 8 * v3) = v101;
    }
    unint64_t v104 = *((void *)v101 + 2);
    unint64_t v103 = *((void *)v101 + 3);
    unint64_t v2 = v104 + 1;
    if (v104 >= v103 >> 1)
    {
      BOOL v101 = sub_10006074C((char *)(v103 > 1), v104 + 1, 1, v101);
      *(void *)(v100 + 8 * v3) = v101;
    }
    *((void *)v101 + 2) = v2;
    uint64_t v105 = &v101[48 * v104];
    *((void *)v105 + 4) = v130;
    *((void *)v105 + 5) = v30;
    *((void *)v105 + 6) = v10;
    *((void *)v105 + 7) = v4;
    *((void *)v105 + 8) = v132;
    *((void *)v105 + 9) = v134;
    sub_10008B978(&v158);
    swift_bridgeObjectRelease();
    sub_10002EAFC((uint64_t)&v146);
    swift_bridgeObjectRelease();
    unint64_t v11 = sub_100087D18;
LABEL_6:
    uint64_t v10 = v127;
    if (v12 == v127) {
      goto LABEL_118;
    }
  }
  uint64_t result = (void *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_10008ADD8@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  void (*v55)(void *__return_ptr, void);
  uint64_t v56;
  unsigned char v57[24];
  void v58[2];
  uint64_t v59;
  void v60[6];
  uint64_t v61;
  void v62[10];
  uint64_t v63;
  void v64[4];
  long long v65;
  void v66[8];
  long long v67;
  _OWORD v68[4];
  uint64_t v69;
  void *v70;
  long long v71;
  long long v72;
  uint64_t v73;
  unsigned char v74[16];
  unsigned char v75[16];
  long long v76;
  uint64_t v77;
  uint64_t v78;

  int64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  uint64_t v5 = a1 + 16 * v3;
  uint64_t v6 = *(void *)(v5 + 16);
  long long v56 = *(void *)(v5 + 24);
  uint64_t v7 = sub_100053C7C(v6, *(void *)(v56 + 8), a2, 0, 0, 0);
  uint64_t v51 = v8;
  uint64_t v52 = v7;
  *(void *)long long v57 = a1;
  *(void *)&v68[0] = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  sub_100056F98(0, v3, 0);
  uint64_t v9 = _swiftEmptyArrayStorage;
  uint64_t v10 = a1 + 40;
  do
  {
    uint64_t v11 = (*(uint64_t (**)(void))(*(void *)v10 + 24))();
    uint64_t v13 = v12;
    *(void *)&v68[0] = v9;
    unint64_t v15 = v9[2];
    unint64_t v14 = v9[3];
    if (v15 >= v14 >> 1)
    {
      sub_100056F98((char *)(v14 > 1), v15 + 1, 1);
      uint64_t v9 = *(void **)&v68[0];
    }
    v9[2] = v15 + 1;
    long long v16 = &v9[2 * v15];
    v16[4] = v11;
    void v16[5] = v13;
    v10 += 16;
    --v3;
  }
  while (v3);
  *(void *)&v68[0] = v9;
  sub_100003DD0(&qword_1000C50C8);
  sub_100005178((unint64_t *)&qword_1000C50D0, &qword_1000C50C8);
  uint64_t v17 = BidirectionalCollection<>.joined(separator:)();
  long long v19 = v18;
  swift_release();
  (*(void (**)(void *__return_ptr))(*(void *)(a1 + 40) + 16))(v58);
  sub_10002B998((uint64_t)&v59, (uint64_t)v75, &qword_1000C5110);
  sub_10002FB5C((uint64_t)v75);
  sub_10002DDE4((uint64_t)v58);
  sub_10002B998((uint64_t)v75, (uint64_t)&v76, &qword_1000C5110);
  if (*((void *)&v76 + 1))
  {
    v68[0] = v76;
    v20._uint64_t countAndFlagsBits = 32;
    v20._unint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v20);
    v21._uint64_t countAndFlagsBits = v17;
    v21._unint64_t object = v19;
    String.append(_:)(v21);
    swift_bridgeObjectRelease();
    long long v19 = (void *)*((void *)&v68[0] + 1);
    uint64_t v17 = *(void *)&v68[0];
  }
  long long v55 = *(void (**)(void *__return_ptr, void))(v56 + 16);
  v55(v60, v6);
  sub_10002B998((uint64_t)&v61, (uint64_t)v74, &qword_1000C5110);
  sub_10002FB5C((uint64_t)v74);
  sub_10002DDE4((uint64_t)v60);
  sub_10002B998((uint64_t)v74, (uint64_t)&v77, &qword_1000C5110);
  uint64_t v22 = v78;
  if (!v78)
  {
    sub_100003DD0(&qword_1000C58F0);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_1000A2660;
    *(void *)(v23 + 32) = v52;
    *(void *)(v23 + 40) = v51;
    sub_100083AB4((uint64_t)_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_1000971E4(v23);
    uint64_t v25 = swift_bridgeObjectRetain();
    uint64_t v26 = sub_10008318C(v25);
    swift_release();
    if (*(void *)(v26 + 16))
    {
      sub_100003DD0(qword_1000C5608);
      uint64_t v27 = (void *)static _DictionaryStorage.allocate(capacity:)();
    }
    else
    {
      uint64_t v27 = &_swiftEmptyDictionarySingleton;
    }
    *(void *)&v68[0] = v27;
    sub_10008511C(v26, 1, v68);
    swift_bridgeObjectRelease();
    uint64_t v28 = *(void *)&v68[0];
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v29 = sub_10008F368(v17, v19, v24, v28);
    unint64_t v31 = v30;
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    *(void *)&v68[0] = v29;
    *((void *)&v68[0] + 1) = v31;
    swift_bridgeObjectRetain();
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v55)(v62, v6, v56);
    uint64_t v32 = v63;
    unint64_t v73 = v63;
    swift_bridgeObjectRetain();
    sub_10002DDE4((uint64_t)v62);
    uint64_t v33 = *(void *)(v32 + 16);
    sub_10002BAD0((uint64_t)&v73);
    if (!v33)
    {
      swift_bridgeObjectRelease();
LABEL_22:
      uint64_t v22 = *((void *)&v68[0] + 1);
      uint64_t v50 = *(void *)&v68[0];
      goto LABEL_23;
    }
    uint64_t v34 = sub_100085D00(v29, v31);
    uint64_t v36 = v35;
    swift_bridgeObjectRelease();
    if (v36)
    {
      if (v34 == 32 && v36 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
LABEL_21:
        v39._uint64_t countAndFlagsBits = 0x6D6D6F636275733CLL;
        v39._unint64_t object = (void *)0xEC0000003E646E61;
        String.append(_:)(v39);
        goto LABEL_22;
      }
      char v37 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v37) {
        goto LABEL_21;
      }
    }
    v38._uint64_t countAndFlagsBits = 32;
    v38._unint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v38);
    goto LABEL_21;
  }
  uint64_t v50 = v77;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_23:
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v55)(v64, v6, v56);
  uint64_t v72 = v65;
  long long v40 = v65;
  swift_bridgeObjectRetain();
  sub_10002DDE4((uint64_t)v64);
  *(_OWORD *)&v57[8] = v72;
  swift_bridgeObjectRetain();
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v55)(v66, v6, v56);
  unint64_t v71 = v67;
  long long v41 = v67;
  swift_bridgeObjectRetain();
  sub_10002DDE4((uint64_t)v66);
  sub_100031A24((uint64_t)&v71);
  uint64_t v42 = HIBYTE(*((void *)&v41 + 1)) & 0xFLL;
  if ((*((void *)&v41 + 1) & 0x2000000000000000) == 0) {
    uint64_t v42 = v41 & 0xFFFFFFFFFFFFLL;
  }
  if (v42)
  {
    sub_100031A24((uint64_t)&v72);
    uint64_t v43 = HIBYTE(*((void *)&v40 + 1)) & 0xFLL;
    if ((*((void *)&v40 + 1) & 0x2000000000000000) == 0) {
      uint64_t v43 = v40 & 0xFFFFFFFFFFFFLL;
    }
    if (v43)
    {
      v44._uint64_t countAndFlagsBits = 10;
      v44._unint64_t object = (void *)0xE100000000000000;
      String.append(_:)(v44);
    }
    ((void (*)(_OWORD *__return_ptr, uint64_t, uint64_t))v55)(v68, v6, v56);
    uint64_t v45 = v69;
    BOOL v46 = v70;
    swift_bridgeObjectRetain();
    sub_10002DDE4((uint64_t)v68);
    v47._uint64_t countAndFlagsBits = v45;
    v47._unint64_t object = v46;
    String.append(_:)(v47);
    swift_bridgeObjectRelease();
    v48._uint64_t countAndFlagsBits = 10;
    v48._unint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v48);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100031A24((uint64_t)&v72);
  }
  uint64_t result = (uint64_t)sub_100089FE0(a1, a2);
  *(_OWORD *)a3 = *(_OWORD *)v57;
  *(void *)(a3 + 16) = *(void *)&v57[16];
  *(void *)(a3 + 24) = v50;
  *(void *)(a3 + 32) = v22;
  *(void *)(a3 + 40) = result;
  *(void *)(a3 + 48) = _swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_10008B49C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  int64_t v4 = *(void *)(a4 + 16);
  if (!v4) {
    return 0;
  }
  swift_bridgeObjectRetain();
  sub_100056F98(0, v4, 0);
  uint64_t v7 = a4 + 72;
  do
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100087690(a1);
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v12 = _swiftEmptyArrayStorage[2];
    unint64_t v11 = _swiftEmptyArrayStorage[3];
    if (v12 >= v11 >> 1) {
      sub_100056F98((char *)(v11 > 1), v12 + 1, 1);
    }
    v7 += 48;
    _swiftEmptyArrayStorage[2] = v12 + 1;
    uint64_t v13 = &_swiftEmptyArrayStorage[2 * v12];
    _OWORD v13[4] = v8;
    v13[5] = v10;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease();
  sub_100003DD0(&qword_1000C50C8);
  sub_100005178((unint64_t *)&qword_1000C50D0, &qword_1000C50C8);
  uint64_t v14 = BidirectionalCollection<>.joined(separator:)();
  long long v16 = v15;
  swift_release();
  Swift::String v17 = String.uppercased()();
  sub_10008B744(a2, a3);
  swift_bridgeObjectRelease();
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._uint64_t countAndFlagsBits = 2618;
  v18._unint64_t object = (void *)0xE200000000000000;
  String.append(_:)(v18);
  swift_bridgeObjectRetain();
  v19._uint64_t countAndFlagsBits = v14;
  v19._unint64_t object = v16;
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10008B744(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10008B758(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10008B76C()
{
  return sub_10008B7A8(&qword_1000C5E10, &qword_1000C5E18, (void (*)(void))sub_10008B814);
}

uint64_t sub_10008B7A8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000046A8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10008B814()
{
  unint64_t result = qword_1000C5E20;
  if (!qword_1000C5E20)
  {
    sub_1000046A8(&qword_1000C5E28);
    sub_10008B8A8(&qword_1000C5E30, &qword_1000C5E38, &qword_1000C5E40, &qword_1000C5E48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5E20);
  }
  return result;
}

uint64_t sub_10008B8A8(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000046A8(a2);
    sub_100005178(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t *sub_10008B93C(unint64_t *a1)
{
  return a1;
}

uint64_t sub_10008B968(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t *sub_10008B978(unint64_t *a1)
{
  return a1;
}

void *initializeWithCopy for HelpGenerator.Section.Element(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HelpGenerator.Section.Element(void *a1, void *a2)
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
  return a1;
}

__n128 initializeWithTake for HelpGenerator.Section.Element(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for HelpGenerator.Section.Element(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HelpGenerator.Section.Element(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HelpGenerator.Section.Element(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HelpGenerator.Section.Element()
{
  return &type metadata for HelpGenerator.Section.Element;
}

uint64_t destroy for HelpGenerator()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for HelpGenerator(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HelpGenerator(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HelpGenerator(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for HelpGenerator()
{
  return &type metadata for HelpGenerator;
}

uint64_t destroy for HelpGenerator.Section(uint64_t a1)
{
  if (*(void *)(a1 + 8) >= 3uLL) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HelpGenerator.Section(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 >= 3)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HelpGenerator.Section(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 8) >= 3uLL)
  {
    if (v4 >= 3)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_10008BF44(a1);
    goto LABEL_6;
  }
  if (v4 < 3)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
LABEL_8:
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t sub_10008BF44(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for HelpGenerator.Section(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for HelpGenerator.Section(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) >= 3uLL)
  {
    unint64_t v4 = *(void *)(a2 + 8);
    if (v4 >= 3)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v4;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_10008BF44(a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for HelpGenerator.Section(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HelpGenerator.Section(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HelpGenerator.Section()
{
  return &type metadata for HelpGenerator.Section;
}

unint64_t sub_10008C0DC()
{
  unint64_t result = qword_1000C5E70;
  if (!qword_1000C5E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5E70);
  }
  return result;
}

void *initializeWithCopy for HelpGenerator.DiscussionSection(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HelpGenerator.DiscussionSection(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for HelpGenerator.DiscussionSection(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for HelpGenerator.DiscussionSection()
{
  return &type metadata for HelpGenerator.DiscussionSection;
}

unint64_t destroy for HelpGenerator.Section.Header(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s14ArgumentParser13HelpGeneratorV7SectionV6HeaderOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for HelpGenerator.Section.Header(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HelpGenerator.Section.Header(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HelpGenerator.Section.Header(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HelpGenerator.Section.Header(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_10008C454(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_10008C46C(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for HelpGenerator.Section.Header()
{
  return &type metadata for HelpGenerator.Section.Header;
}

uint64_t sub_10008C49C(uint64_t a1, uint64_t a2)
{
  return String.init(argument:)(*(Swift::String *)&a1).value._countAndFlagsBits;
}

uint64_t sub_10008C4B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7 && a7 != 2)
  {
    if (a7 != 1) {
      return result;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }

  return swift_bridgeObjectRetain();
}

uint64_t destroy for MessageInfo(uint64_t a1)
{
  return sub_1000536A4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
}

uint64_t initializeWithCopy for MessageInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_10008C4B8(*(void *)a2, v4, v5, v6, v7, v8, v9);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for MessageInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_10008C4B8(*(void *)a2, v4, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  char v16 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v9;
  sub_1000536A4(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

uint64_t assignWithTake for MessageInfo(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 48);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  char v11 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v3;
  sub_1000536A4(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 49)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)uint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 48) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10008C744(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48);
}

uint64_t sub_10008C74C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessageInfo()
{
  return &type metadata for MessageInfo;
}

void sub_10008C764(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v255 = a1;
  swift_errorRetain();
  uint64_t v8 = sub_100003DD0(&qword_1000C58A0);
  uint64_t v9 = swift_dynamicCast();
  uint64_t v246 = a4;
  if (v9)
  {
    uint64_t v244 = v8;
    *(void *)&long long v245 = a3;
    uint64_t v10 = *((void *)&v261 + 1);
    v242 = (void *)v261;
    unint64_t v12 = v262;
    uint64_t v11 = v263;
    uint64_t v13 = v264;
    uint64_t v14 = v266;
    switch(v267)
    {
      case 0u:
        uint64_t v15 = swift_bridgeObjectRetain();
        sub_10008ADD8(v15, SDWORD2(v261), (uint64_t)&v274);
        swift_bridgeObjectRelease();
        uint64_t v240 = sub_100085ECC(0, 1);
        unint64_t v12 = v16;
        swift_errorRelease();
        swift_bridgeObjectRelease();
        sub_100070508(*((uint64_t *)&v261 + 1), v262, v263, *((uint64_t *)&v263 + 1), v264, BYTE8(v264), v265, *((uint64_t *)&v265 + 1), v266, *((uint64_t *)&v266 + 1), 0);
        sub_100054768((uint64_t)&v274);
        swift_errorRelease();
        uint64_t v17 = 0;
        uint64_t v244 = 0;
        *(void *)&long long v245 = 0;
        uint64_t v243 = 0;
        char v18 = 0;
        uint64_t v10 = v240;
        goto LABEL_125;
      case 1u:
        uint64_t v252 = *((void *)&v264 + 1);
        uint64_t v253 = *((void *)&v265 + 1);
        uint64_t v250 = v263;
        v251 = (_OWORD *)v262;
        uint64_t v254 = v265;
        uint64_t v243 = a2;
        uint64_t v244 = sub_100052FD4();
        uint64_t v249 = v52;
        sub_100070308(*((uint64_t *)&v261 + 1), v262, v263, *((uint64_t *)&v263 + 1), v264, BYTE8(v264), v265, *((uint64_t *)&v265 + 1), v266, *((uint64_t *)&v266 + 1), 1);
        uint64_t v248 = *((void *)&v266 + 1);
        uint64_t v241 = v266;
        uint64_t v247 = *((void *)&v263 + 1);
        sub_100070308(*((uint64_t *)&v261 + 1), v262, v263, *((uint64_t *)&v263 + 1), v264, BYTE8(v264), v265, *((uint64_t *)&v265 + 1), v266, *((uint64_t *)&v266 + 1), 1);
        uint64_t v238 = *((void *)&v261 + 1);
        uint64_t v53 = sub_10002FB88(v244, v249, *((uint64_t *)&v261 + 1), v262);
        uint64_t v244 = v153;
        uint64_t v249 = sub_10002F49C(v53, v153, v154, v155);
        uint64_t v240 = v156;
        swift_errorRelease();
        swift_bridgeObjectRelease();
        sub_100070508(*((uint64_t *)&v261 + 1), v262, v263, *((uint64_t *)&v263 + 1), v264, BYTE8(v264), v265, *((uint64_t *)&v265 + 1), v266, *((uint64_t *)&v266 + 1), 1);
        sub_100070508(*((uint64_t *)&v261 + 1), v262, v263, *((uint64_t *)&v263 + 1), v264, BYTE8(v264), v265, *((uint64_t *)&v265 + 1), v266, *((uint64_t *)&v266 + 1), 1);
        swift_bridgeObjectRelease();
        goto LABEL_77;
      case 2u:
        swift_errorRelease();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_100070508(*((uint64_t *)&v261 + 1), v262, v263, *((uint64_t *)&v263 + 1), v264, BYTE8(v264), v265, *((uint64_t *)&v265 + 1), v266, *((uint64_t *)&v266 + 1), 2);
        swift_errorRelease();
        uint64_t v17 = 0;
        uint64_t v244 = 0;
        *(void *)&long long v245 = 0;
        uint64_t v243 = 0;
        char v18 = 0;
        goto LABEL_125;
      case 0xFu:
        uint64_t v54 = v264 | *((void *)&v264 + 1) | v265;
        uint64_t v55 = *((void *)&v265 + 1) | v266 | *((void *)&v266 + 1);
        if (!((unint64_t)v263 | v262 | *((void *)&v261 + 1) | *((void *)&v263 + 1) | v54 | v55))
        {
          uint64_t v254 = v265;
          uint64_t v247 = *((void *)&v263 + 1);
          uint64_t v252 = *((void *)&v264 + 1);
          int64_t v157 = v242[2];
          unint64_t v158 = _swiftEmptyArrayStorage;
          uint64_t v250 = v263;
          v251 = (_OWORD *)v262;
          uint64_t v253 = *((void *)&v265 + 1);
          uint64_t v248 = *((void *)&v266 + 1);
          uint64_t v241 = v266;
          if (v157)
          {
            uint64_t v238 = *((void *)&v261 + 1);
            uint64_t v239 = a1;
            uint64_t v249 = v264;
            *(void *)&long long v268 = _swiftEmptyArrayStorage;
            swift_bridgeObjectRetain();
            sub_100056F98(0, v157, 0);
            unint64_t v158 = _swiftEmptyArrayStorage;
            unint64_t v159 = v242 + 5;
            do
            {
              (*(void (**)(uint64_t *__return_ptr))(*v159 + 16))(&v274);
              long long v160 = v280;
              swift_bridgeObjectRetain();
              sub_10002DDE4((uint64_t)&v274);
              *(void *)&long long v268 = v158;
              unint64_t v162 = v158[2];
              unint64_t v161 = v158[3];
              if (v162 >= v161 >> 1)
              {
                sub_100056F98((char *)(v161 > 1), v162 + 1, 1);
                unint64_t v158 = (void *)v268;
              }
              v158[2] = v162 + 1;
              *(_OWORD *)&v158[2 * v162 + 4] = v160;
              v159 += 2;
              --v157;
            }
            while (v157);
            uint64_t v9 = swift_bridgeObjectRelease();
            uint64_t v10 = v238;
            uint64_t v13 = v249;
            uint64_t v11 = v250;
          }
          *(void *)&long long v268 = v158;
          uint64_t v165 = v158[2];
          if (v165)
          {
            uint64_t v166 = v165 - 1;
            v167 = &v158[2 * v165 + 3];
            while (1)
            {
              uint64_t v168 = *(v167 - 1) & 0xFFFFFFFFFFFFLL;
              if ((*v167 & 0x2000000000000000) != 0) {
                uint64_t v168 = HIBYTE(*v167) & 0xFLL;
              }
              if (v168) {
                break;
              }
              v167 -= 2;
              if (--v166 == -1)
              {
                uint64_t v169 = v11;
                uint64_t v170 = v10;
                uint64_t v171 = v13;
                goto LABEL_72;
              }
            }
            uint64_t v169 = v11;
            uint64_t v170 = v10;
            uint64_t v171 = v13;
          }
          else
          {
            uint64_t v169 = v11;
            uint64_t v170 = v10;
            uint64_t v171 = v13;
          }
LABEL_72:
          __chkstk_darwin(v9);
          v235 = &v268;
          v177 = sub_100034D28((void *(*)(uint64_t *__return_ptr, uint64_t *))sub_10008E8B8, (uint64_t)&v233, v175, v176);
          unint64_t v179 = v178;
          swift_bridgeObjectRelease();
          unint64_t v180 = 0xD000000000000013;
          if (v179) {
            unint64_t v180 = (unint64_t)v177;
          }
          uint64_t v249 = v180;
          unint64_t v181 = 0x80000001000A99F0;
          if (v179) {
            unint64_t v181 = v179;
          }
          uint64_t v240 = v181;
          swift_errorRelease();
          swift_bridgeObjectRelease();
          uint64_t v182 = v248;
          uint64_t v183 = v241;
          uint64_t v184 = v170;
          uint64_t v185 = v170;
          uint64_t v187 = (uint64_t)v251;
          unsigned __int8 v186 = v252;
          uint64_t v188 = v169;
          uint64_t v189 = v247;
          uint64_t v191 = v253;
          uint64_t v190 = v254;
          sub_100070508(v185, (uint64_t)v251, v188, v247, v171, v252, v254, v253, v241, v248, 15);
          sub_100070508(v184, v187, v250, v189, v171, v186, v190, v191, v183, v182, 15);
LABEL_77:
          swift_errorRelease();
          uint64_t v17 = 0;
          uint64_t v244 = 0;
          *(void *)&long long v245 = 0;
          uint64_t v243 = 0;
          char v18 = 0;
          uint64_t v10 = v249;
          goto LABEL_124;
        }
        if (*((void *)&v261 + 1) == 1 && !((unint64_t)v263 | v262 | *((void *)&v263 + 1) | v54 | v55))
        {
          uint64_t v56 = swift_bridgeObjectRetain();
          sub_100082130(v56, (uint64_t)&v268);
          long long v275 = v268;
          uint64_t v274 = 0;
          uint64_t v276 = v269;
          long long v277 = v270;
          long long v278 = v271;
          long long v279 = v272;
          long long v280 = v273;
          uint64_t v10 = sub_1000810AC();
          unint64_t v58 = v57;
          swift_errorRelease();
          swift_bridgeObjectRelease();
          sub_100070508(1, v262, v263, *((uint64_t *)&v263 + 1), v264, BYTE8(v264), v265, *((uint64_t *)&v265 + 1), v266, *((uint64_t *)&v266 + 1), 15);
          sub_1000547D0((uint64_t)&v268);
          swift_errorRelease();
          uint64_t v17 = 0;
          uint64_t v244 = 0;
          *(void *)&long long v245 = 0;
          uint64_t v243 = 0;
          char v18 = 0;
          unint64_t v12 = v58;
LABEL_125:
          uint64_t v43 = v246;
          goto LABEL_126;
        }
LABEL_13:
        uint64_t v243 = a2;
        uint64_t v45 = v242;
        uint64_t v252 = *((void *)&v264 + 1);
        uint64_t v51 = *((void *)&v261 + 1);
        swift_bridgeObjectRetain();
        sub_100070308(*((uint64_t *)&v261 + 1), v262, v263, *((uint64_t *)&v263 + 1), v264, BYTE8(v264), v265, *((uint64_t *)&v265 + 1), v266, *((uint64_t *)&v266 + 1), v267);
        swift_bridgeObjectRelease();
        uint64_t v240 = v267;
        uint64_t v50 = *((void *)&v265 + 1);
        uint64_t v49 = v265;
        uint64_t v248 = *((void *)&v266 + 1);
        v251 = (_OWORD *)v262;
        uint64_t v247 = *((void *)&v263 + 1);
        uint64_t v47 = v263;
        sub_100070508(*((uint64_t *)&v261 + 1), v262, v263, *((uint64_t *)&v263 + 1), v264, BYTE8(v264), v265, *((uint64_t *)&v265 + 1), v266, *((uint64_t *)&v266 + 1), v267);
        swift_errorRelease();
        uint64_t v48 = v264;
        break;
      default:
        goto LABEL_13;
    }
LABEL_14:
    uint64_t v238 = v51;
    uint64_t v239 = a1;
    uint64_t v241 = v14;
    uint64_t v249 = v48;
    uint64_t v250 = v47;
    uint64_t v253 = v50;
    uint64_t v254 = v49;
    uint64_t v59 = swift_bridgeObjectRetain();
    sub_10008ADD8(v59, 0, (uint64_t)&v268);
    swift_bridgeObjectRelease();
    uint64_t v60 = sub_100087D28();
    unint64_t v62 = v61;
    sub_100054768((uint64_t)&v268);
    uint64_t v237 = v60;
    uint64_t v259 = v60;
    unint64_t v260 = v62;
    int64_t v63 = v45[2];
    v242 = v45;
    if (v63)
    {
      uint64_t v274 = (uint64_t)_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_100056F98(0, v63, 0);
      uint64_t v64 = (void *)v274;
      uint64_t v65 = v45 + 5;
      do
      {
        uint64_t v66 = (*(uint64_t (**)(void))(*v65 + 24))();
        uint64_t v68 = v67;
        uint64_t v274 = (uint64_t)v64;
        unint64_t v70 = v64[2];
        unint64_t v69 = v64[3];
        if (v70 >= v69 >> 1)
        {
          sub_100056F98((char *)(v69 > 1), v70 + 1, 1);
          uint64_t v64 = (void *)v274;
        }
        v64[2] = v70 + 1;
        unint64_t v71 = &v64[2 * v70];
        v71[4] = v66;
        v71[5] = v68;
        v65 += 2;
        --v63;
      }
      while (v63);
      uint64_t v45 = v242;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v64 = _swiftEmptyArrayStorage;
    }
    uint64_t v274 = (uint64_t)v64;
    sub_100003DD0(&qword_1000C50C8);
    sub_100067408();
    uint64_t v72 = BidirectionalCollection<>.joined(separator:)();
    uint64_t v74 = v73;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v75 = sub_100033E90(0, (uint64_t)v45);
    uint64_t v76 = sub_100065334(v75);
    unint64_t v78 = v77;
    unsigned __int8 v80 = v79;
    unsigned int v81 = v79;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v81 <= 0xFD)
    {
      uint64_t v83 = HIBYTE(v62) & 0xF;
      if ((v62 & 0x2000000000000000) == 0) {
        uint64_t v83 = v237 & 0xFFFFFFFFFFFFLL;
      }
      if (v83)
      {
        v84._uint64_t countAndFlagsBits = 10;
        v84._unint64_t object = (void *)0xE100000000000000;
        String.append(_:)(v84);
      }
      uint64_t v274 = 0;
      *(void *)&long long v275 = 0xE000000000000000;
      _StringGuts.grow(_:)(35);
      swift_bridgeObjectRelease();
      uint64_t v274 = 0x27206565532020;
      *(void *)&long long v275 = 0xE700000000000000;
      v85._uint64_t countAndFlagsBits = v72;
      v85._unint64_t object = v74;
      String.append(_:)(v85);
      swift_bridgeObjectRelease();
      v86._uint64_t countAndFlagsBits = 32;
      v86._unint64_t object = (void *)0xE100000000000000;
      String.append(_:)(v86);
      v281._uint64_t countAndFlagsBits = v76;
      v281._unint64_t object = v78;
      uint64_t v87 = sub_100076D6C(v281, v80);
      char v89 = v88;
      sub_10002ECD0(v76, (uint64_t)v78, v80);
      v90._uint64_t countAndFlagsBits = v87;
      v90._unint64_t object = v89;
      String.append(_:)(v90);
      swift_bridgeObjectRelease();
      v91._uint64_t countAndFlagsBits = 0xD000000000000017;
      v91._unint64_t object = (void *)0x80000001000A99D0;
      String.append(_:)(v91);
      v92._uint64_t countAndFlagsBits = v274;
      v92._unint64_t object = (void *)v275;
      String.append(_:)(v92);
      uint64_t v82 = v238;
    }
    else
    {
      uint64_t v82 = v238;
    }
    swift_bridgeObjectRelease();
    uint64_t v93 = v254;
    uint64_t v94 = (uint64_t)v251;
    if (v240 == 14)
    {
      unsigned __int8 v96 = v252;
      sub_100003DD0(&qword_1000C50C0);
      uint64_t v97 = v247;
      uint64_t v98 = swift_allocObject();
      *(_OWORD *)(v98 + 16) = xmmword_1000A2660;
      *(void *)(v98 + 32) = sub_100052FD4();
      *(void *)(v98 + 40) = v99;
      sub_100070308(v82, v94, v250, v97, v249, v96, v93, v253, v241, v248, 14);
      sub_10008ADD8(v98, 0, (uint64_t)&v274);
      swift_bridgeObjectRelease();
      uint64_t v100 = sub_100085ECC(0, 1);
      char v102 = v101;
      sub_100054768((uint64_t)&v274);
      *(void *)&long long v261 = 10;
      *((void *)&v261 + 1) = 0xE100000000000000;
      v103._uint64_t countAndFlagsBits = v100;
      v103._unint64_t object = v102;
      String.append(_:)(v103);
      swift_bridgeObjectRelease();
      uint64_t v237 = 10;
      *(void *)&long long v245 = 0xE100000000000000;
    }
    else
    {
      if (v240 == 13)
      {
        *(void *)&long long v261 = v82;
        sub_10008E838(v82, (uint64_t)v251, v250, v247, v249, v252, v254, v253, v241, v248, 0xDu);
        swift_errorRetain();
        if (swift_dynamicCast())
        {
          swift_bridgeObjectRelease();
          v242 = (void *)v274;
          uint64_t v240 = v275;
          *(void *)&long long v245 = v260;
          swift_errorRelease();
          sub_10008E858(v82, (uint64_t)v251, v250, v247, v249, v252, v254, v253, v241, v248, 0xDu);
          uint64_t v95 = v82;
          uint64_t v17 = v259;
          sub_10008E858(v95, (uint64_t)v251, v250, v247, v249, v252, v254, v253, v241, v248, 0xDu);
          swift_errorRelease();
          char v18 = 1;
          uint64_t v243 = 0xE000000000000000;
          uint64_t v244 = 0;
LABEL_32:
          uint64_t v10 = (uint64_t)v242;
LABEL_124:
          unint64_t v12 = v240;
          goto LABEL_125;
        }
        uint64_t v104 = v254;
        swift_errorRelease();
        uint64_t v258 = v82;
        swift_errorRetain();
        if (!swift_dynamicCast())
        {
          swift_bridgeObjectRelease();
          swift_errorRelease();
          uint64_t v274 = v82;
          swift_errorRetain();
          unint64_t v78 = v251;
          uint64_t v93 = v254;
          uint64_t v163 = v247;
          if (swift_dynamicCast())
          {
            swift_bridgeObjectRelease();
            swift_errorRelease();
            uint64_t v164 = v82;
            sub_10008E858(v82, (uint64_t)v251, v250, v247, v249, v252, v254, v253, v241, v248, 0xDu);
            uint64_t v17 = v261;
            sub_10008E858(v164, (uint64_t)v251, v250, v247, v249, v252, v254, v253, v241, v248, 0xDu);
            swift_errorRelease();
            uint64_t v10 = 0;
            uint64_t v244 = 0;
            *(void *)&long long v245 = 0;
            uint64_t v243 = 0;
            char v18 = 2;
            unint64_t v12 = 0xE000000000000000;
            goto LABEL_125;
          }
          swift_errorRelease();
          uint64_t v255 = v82;
          swift_errorRetain();
          sub_100003DD0(&qword_1000C5E78);
          if (swift_dynamicCast())
          {
            sub_10004B100((long long *)&v274, (uint64_t)&v261);
            sub_100005090(&v261, v263);
            dispatch thunk of LocalizedError.errorDescription.getter();
            uint64_t v173 = v172;
            swift_bridgeObjectRelease();
            if (v173)
            {
              sub_100005090(&v261, v263);
              uint64_t v240 = dispatch thunk of LocalizedError.errorDescription.getter();
              v242 = (void *)v174;
              if (v174)
              {
                swift_bridgeObjectRelease();
                swift_errorRelease();
                sub_10008E858(v82, (uint64_t)v251, v250, v247, v249, v252, v254, v253, v241, v248, 0xDu);
                sub_10008E858(v82, (uint64_t)v251, v250, v247, v249, v252, v254, v253, v241, v248, 0xDu);
                sub_100005128((uint64_t)&v261);
                swift_errorRelease();
                uint64_t v244 = 0;
                *(void *)&long long v245 = 0;
                uint64_t v243 = 0;
                char v18 = 2;
                uint64_t v17 = 1;
                uint64_t v10 = v240;
                unint64_t v12 = (unint64_t)v242;
                goto LABEL_125;
              }
LABEL_130:
              sub_10008E858(v82, (uint64_t)v78, v250, v247, v249, v252, v93, v253, v241, v248, 0xDu);
              __break(1u);
              JUMPOUT(0x10008E58CLL);
            }
            swift_bridgeObjectRelease();
            sub_100005128((uint64_t)&v261);
            uint64_t v163 = v247;
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          swift_errorRelease();
          swift_getErrorValue();
          swift_getDynamicType();
          sub_10008E878();
          if (swift_dynamicCastMetatype())
          {
            swift_getErrorValue();
            uint64_t v223 = Error.localizedDescription.getter();
          }
          else
          {
            uint64_t v274 = v82;
            swift_errorRetain();
            uint64_t v223 = String.init<A>(describing:)();
          }
          v242 = (void *)v223;
          uint64_t v240 = v224;
          swift_errorRelease();
          sub_10008E858(v82, (uint64_t)v251, v250, v163, v249, v252, v254, v253, v241, v248, 0xDu);
          sub_10008E858(v82, (uint64_t)v251, v250, v163, v249, v252, v254, v253, v241, v248, 0xDu);
          uint64_t v244 = 0;
          *(void *)&long long v245 = 0;
          uint64_t v243 = 0;
          char v18 = 2;
          uint64_t v17 = 1;
          goto LABEL_32;
        }
        swift_bridgeObjectRelease();
        uint64_t v10 = v255;
        uint64_t v144 = (uint64_t)v251;
        uint64_t v93 = v254;
        if (v257)
        {
          if (v257 == 1)
          {
            swift_errorRelease();
            uint64_t v240 = v256;
            sub_10008E858(v238, (uint64_t)v251, v250, v247, v249, v252, v254, v253, v241, v248, 0xDu);
            swift_bridgeObjectRelease();
            LOBYTE(v235) = 13;
            uint64_t v233 = v241;
            uint64_t v234 = v248;
            uint64_t v145 = v238;
            uint64_t v146 = (uint64_t)v251;
            uint64_t v147 = v250;
            uint64_t v148 = v247;
            uint64_t v149 = v249;
            unsigned __int8 v150 = v252;
            uint64_t v151 = v254;
            uint64_t v152 = v253;
LABEL_123:
            sub_10008E858(v145, v146, v147, v148, v149, v150, v151, v152, v233, v234, v235);
            swift_errorRelease();
            uint64_t v17 = 0;
            uint64_t v244 = 0;
            *(void *)&long long v245 = 0;
            uint64_t v243 = 0;
            char v18 = 0;
            goto LABEL_124;
          }
          uint64_t v206 = v250;
          if (!v255)
          {
            uint64_t v222 = v253;
LABEL_122:
            sub_100082130((uint64_t)v242, (uint64_t)&v261);
            long long v275 = v261;
            uint64_t v274 = 0;
            uint64_t v276 = v262;
            long long v277 = v263;
            long long v278 = v264;
            long long v279 = v265;
            long long v280 = v266;
            uint64_t v10 = sub_1000810AC();
            uint64_t v240 = v230;
            swift_errorRelease();
            sub_10008E858(v238, v144, v206, v247, v249, v252, v93, v222, v241, v248, 0xDu);
            sub_1000547D0((uint64_t)&v261);
            LOBYTE(v235) = 13;
            uint64_t v233 = v241;
            uint64_t v234 = v248;
            uint64_t v145 = v238;
            uint64_t v147 = v250;
            uint64_t v146 = (uint64_t)v251;
            uint64_t v148 = v247;
            uint64_t v149 = v249;
            unsigned __int8 v150 = v252;
            uint64_t v151 = v93;
            uint64_t v152 = v222;
            goto LABEL_123;
          }
          swift_bridgeObjectRelease();
          uint64_t v207 = sub_100052FD4();
          unint64_t v78 = sub_10007370C(v207, v208);
          uint64_t v210 = v209;
          uint64_t v104 = v211;
          unint64_t v212 = sub_10009643C((uint64_t)v78, v255);
          unint64_t v213 = v212;
          if (v212 >> 62)
          {
            uint64_t v105 = _CocoaArrayWrapper.endIndex.getter();
            if (v105)
            {
LABEL_93:
              uint64_t v243 = v104;
              uint64_t v244 = v210;
              uint64_t v274 = (uint64_t)_swiftEmptyArrayStorage;
              sub_100056FF8(0, v105 & ~(v105 >> 63), 0);
              if ((v105 & 0x8000000000000000) == 0)
              {
                uint64_t v214 = 0;
                v215 = (void *)v274;
                do
                {
                  if ((v213 & 0xC000000000000001) != 0) {
                    uint64_t v216 = specialized _ArrayBuffer._getElementSlowPath(_:)();
                  }
                  else {
                    uint64_t v216 = swift_retain();
                  }
                  long long v245 = *(_OWORD *)(v216 + 16);
                  swift_release();
                  uint64_t v217 = (uint64_t)v215;
                  uint64_t v274 = (uint64_t)v215;
                  unint64_t v219 = v215[2];
                  unint64_t v218 = v215[3];
                  if (v219 >= v218 >> 1)
                  {
                    sub_100056FF8((char *)(v218 > 1), v219 + 1, 1);
                    uint64_t v217 = v274;
                  }
                  ++v214;
                  *(void *)(v217 + 16) = v219 + 1;
                  v215 = (void *)v217;
                  *(_OWORD *)(v217 + 16 * v219 + 32) = v245;
                  uint64_t v93 = v254;
                }
                while (v105 != v214);
                swift_bridgeObjectRelease();
                v221 = v215;
                goto LABEL_118;
              }
              goto LABEL_128;
            }
          }
          else
          {
            uint64_t v105 = *(void *)((v212 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v105) {
              goto LABEL_93;
            }
          }
          swift_bridgeObjectRelease();
          v221 = _swiftEmptyArrayStorage;
LABEL_118:
          if (v221[2])
          {
            v242 = v221;
          }
          else
          {
            swift_bridgeObjectRelease();
            sub_100003DD0(&qword_1000C50C0);
            uint64_t v228 = swift_allocObject();
            *(_OWORD *)(v228 + 16) = xmmword_1000A2660;
            long long v229 = v78[1];
            v242 = (void *)v228;
            *(_OWORD *)(v228 + 32) = v229;
          }
          swift_release();
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t v222 = v253;
          uint64_t v144 = (uint64_t)v251;
          goto LABEL_122;
        }
        uint64_t v192 = v250;
        if (!v255)
        {
LABEL_115:
          sub_10008ADD8((uint64_t)v242, 0, (uint64_t)&v274);
          swift_bridgeObjectRelease();
          uint64_t v10 = sub_100085ECC(0, 1);
          uint64_t v240 = v227;
          swift_errorRelease();
          sub_10008E858(v238, v144, v192, v247, v249, v252, v104, v253, v241, v248, 0xDu);
          sub_100054768((uint64_t)&v274);
          LOBYTE(v235) = 13;
          uint64_t v233 = v241;
          uint64_t v234 = v248;
          uint64_t v145 = v238;
          uint64_t v147 = v250;
          uint64_t v146 = (uint64_t)v251;
          uint64_t v148 = v247;
          uint64_t v149 = v249;
          unsigned __int8 v150 = v252;
          uint64_t v151 = v104;
          uint64_t v152 = v253;
          goto LABEL_123;
        }
        swift_bridgeObjectRelease();
        uint64_t v193 = sub_100052FD4();
        unint64_t v78 = sub_10007370C(v193, v194);
        uint64_t v196 = v195;
        uint64_t v244 = v197;
        unint64_t v198 = sub_10009643C((uint64_t)v78, v255);
        unint64_t v199 = v198;
        if (v198 >> 62)
        {
          uint64_t v105 = _CocoaArrayWrapper.endIndex.getter();
          if (v105) {
            goto LABEL_81;
          }
        }
        else
        {
          uint64_t v105 = *(void *)((v198 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v105)
          {
LABEL_81:
            uint64_t v243 = v196;
            uint64_t v274 = (uint64_t)_swiftEmptyArrayStorage;
            sub_100056FF8(0, v105 & ~(v105 >> 63), 0);
            if (v105 < 0)
            {
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              swift_bridgeObjectRelease();
              sub_10008E858(v105, (uint64_t)v251, v250, v247, v249, v252, v104, v253, v241, v248, v240);
              __break(1u);
              goto LABEL_130;
            }
            uint64_t v200 = 0;
            v201 = (void *)v274;
            do
            {
              if ((v199 & 0xC000000000000001) != 0) {
                uint64_t v202 = specialized _ArrayBuffer._getElementSlowPath(_:)();
              }
              else {
                uint64_t v202 = swift_retain();
              }
              long long v245 = *(_OWORD *)(v202 + 16);
              swift_release();
              uint64_t v203 = (uint64_t)v201;
              uint64_t v274 = (uint64_t)v201;
              unint64_t v205 = v201[2];
              unint64_t v204 = v201[3];
              if (v205 >= v204 >> 1)
              {
                sub_100056FF8((char *)(v204 > 1), v205 + 1, 1);
                uint64_t v203 = v274;
              }
              ++v200;
              *(void *)(v203 + 16) = v205 + 1;
              v201 = (void *)v203;
              *(_OWORD *)(v203 + 16 * v205 + 32) = v245;
              uint64_t v93 = v254;
            }
            while (v105 != v200);
            swift_bridgeObjectRelease();
            v220 = v201;
            goto LABEL_111;
          }
        }
        swift_bridgeObjectRelease();
        v220 = _swiftEmptyArrayStorage;
LABEL_111:
        uint64_t v104 = v93;
        if (v220[2])
        {
          v242 = v220;
        }
        else
        {
          swift_bridgeObjectRelease();
          sub_100003DD0(&qword_1000C50C0);
          uint64_t v225 = swift_allocObject();
          *(_OWORD *)(v225 + 16) = xmmword_1000A2660;
          long long v226 = v78[1];
          v242 = (void *)v225;
          *(_OWORD *)(v225 + 32) = v226;
        }
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v144 = (uint64_t)v251;
        goto LABEL_115;
      }
      uint64_t v237 = v259;
      sub_10008E838(v82, (uint64_t)v251, v250, v247, v249, v252, v254, v253, v241, v248, v240);
      *(void *)&long long v245 = v260;
      swift_bridgeObjectRetain();
    }
    uint64_t v104 = v93;
    uint64_t v105 = v82;
    uint64_t v106 = v45[2];
    if (v106)
    {
      uint64_t v107 = &v45[2 * v106];
      uint64_t v109 = v107[2];
      uint64_t v108 = v107[3];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v243 = sub_100053C7C(v109, *(void *)(v108 + 8), 0, 0, 0, 0);
      uint64_t v244 = sub_10002FDE0();
      swift_allocError();
      uint64_t v110 = v250;
      uint64_t v111 = (uint64_t)v251;
      *(void *)uint64_t v112 = v82;
      *(void *)(v112 + 8) = v111;
      *(void *)(v112 + 16) = v110;
      uint64_t v113 = v110;
      uint64_t v114 = v247;
      uint64_t v115 = v248;
      *(void *)(v112 + 24) = v247;
      uint64_t v116 = v114;
      uint64_t v247 = v114;
      uint64_t v117 = v249;
      *(void *)(v112 + 32) = v249;
      uint64_t v118 = v117;
      LOBYTE(v117) = v252;
      *(void *)(v112 + 40) = v252;
      *(void *)(v112 + 48) = v93;
      uint64_t v119 = v253;
      uint64_t v121 = v240;
      uint64_t v120 = v241;
      *(void *)(v112 + 56) = v253;
      *(void *)(v112 + 64) = v120;
      *(void *)(v112 + 72) = v115;
      *(unsigned char *)(v112 + 80) = v121;
      sub_100070308(v82, v111, v113, v116, v118, v117, v93, v119, v120, v115, v121);
      unint64_t v122 = sub_10008FDC0();
      uint64_t v123 = v111;
      unint64_t v125 = v124;
      swift_errorRelease();
      if (v125) {
        uint64_t v126 = v122;
      }
      else {
        uint64_t v126 = 0;
      }
      v242 = (void *)v126;
      unint64_t v127 = 0xE000000000000000;
      if (v125) {
        unint64_t v127 = v125;
      }
      unint64_t v236 = v127;
      swift_allocError();
      *(void *)uint64_t v128 = v82;
      *(void *)(v128 + 8) = v123;
      uint64_t v130 = v249;
      uint64_t v129 = v250;
      uint64_t v131 = v247;
      *(void *)(v128 + 16) = v250;
      *(void *)(v128 + 24) = v131;
      uint64_t v132 = v252;
      uint64_t v133 = v253;
      *(void *)(v128 + 32) = v130;
      *(void *)(v128 + 40) = v132;
      uint64_t v134 = v254;
      *(void *)(v128 + 48) = v254;
      *(void *)(v128 + 56) = v133;
      *(void *)(v128 + 64) = v120;
      *(void *)(v128 + 72) = v115;
      unsigned __int8 v135 = v121;
      *(unsigned char *)(v128 + 80) = v121;
      LOBYTE(v235) = v121;
      uint64_t v240 = v121;
      uint64_t v234 = v115;
      uint64_t v136 = v115;
      uint64_t v248 = v115;
      uint64_t v233 = v120;
      uint64_t v137 = v82;
      uint64_t v138 = v131;
      sub_100070308(v82, v123, v129, v131, v130, v132, v134, v133, v233, v234, (char)v235);
      uint64_t v139 = sub_1000900F0();
      unint64_t v141 = v140;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      if (v141) {
        uint64_t v142 = v139;
      }
      else {
        uint64_t v142 = 0;
      }
      unint64_t v143 = 0xE000000000000000;
      if (v141) {
        unint64_t v143 = v141;
      }
      uint64_t v243 = v143;
      uint64_t v244 = v142;
      swift_errorRelease();
      sub_10008E858(v137, (uint64_t)v251, v250, v138, v249, v252, v254, v253, v241, v136, v135);
      sub_10008E858(v137, (uint64_t)v251, v250, v138, v249, v252, v254, v253, v241, v248, v240);
      char v18 = 1;
      uint64_t v10 = (uint64_t)v242;
      unint64_t v12 = v236;
      uint64_t v17 = v237;
      goto LABEL_125;
    }
    goto LABEL_129;
  }
  swift_errorRelease();
  *(void *)&long long v268 = a1;
  swift_errorRetain();
  if (!swift_dynamicCast())
  {
    uint64_t v244 = v8;
    swift_errorRelease();
    sub_100003DD0(&qword_1000C50C0);
    uint64_t v44 = a2;
    uint64_t v45 = (void *)swift_allocObject();
    *((_OWORD *)v45 + 1) = xmmword_1000A2660;
    *(void *)&long long v245 = a3;
    uint64_t v243 = v44;
    v45[4] = sub_100052FD4();
    v45[5] = v46;
    swift_errorRetain();
    v251 = 0;
    uint64_t v252 = 0;
    uint64_t v47 = 0;
    uint64_t v247 = 0;
    uint64_t v248 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    uint64_t v14 = 0;
    uint64_t v240 = 13;
    uint64_t v51 = a1;
    goto LABEL_14;
  }
  uint64_t v19 = *((void *)&v275 + 1);
  uint64_t v249 = v275;
  uint64_t v250 = v274;
  uint64_t v239 = a1;
  uint64_t v20 = v276;
  uint64_t v21 = v277;
  uint64_t v253 = v278;
  uint64_t v254 = *((void *)&v277 + 1);
  uint64_t v22 = *((void *)&v279 + 1);
  v251 = (_OWORD *)v279;
  uint64_t v252 = *((void *)&v278 + 1);
  char v23 = v280;
  sub_100003DD0(&qword_1000C50C0);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_1000A2660;
  *(void *)(v24 + 32) = sub_100052FD4();
  *(void *)(v24 + 40) = v25;
  sub_10005857C();
  uint64_t v26 = swift_allocError();
  uint64_t v28 = v249;
  uint64_t v27 = v250;
  *(void *)uint64_t v29 = v24;
  *(void *)(v29 + 8) = v27;
  *(void *)(v29 + 16) = v28;
  *(void *)(v29 + 24) = v19;
  uint64_t v30 = v19;
  uint64_t v31 = v20;
  uint64_t v247 = v21;
  uint64_t v248 = v20;
  *(void *)(v29 + 32) = v20;
  *(void *)(v29 + 40) = v21;
  uint64_t v32 = v21;
  uint64_t v34 = v253;
  unsigned __int8 v33 = v254;
  *(void *)(v29 + 48) = v254;
  *(void *)(v29 + 56) = v34;
  uint64_t v36 = (uint64_t)v251;
  uint64_t v35 = v252;
  *(void *)(v29 + 64) = v252;
  *(void *)(v29 + 72) = v36;
  *(void *)(v29 + 80) = v22;
  *(unsigned char *)(v29 + 88) = v23;
  uint64_t v37 = v27;
  uint64_t v38 = v28;
  uint64_t v39 = v30;
  sub_100070308(v27, v28, v30, v31, v32, v33, v34, v35, v36, v22, v23);
  sub_10008C764(&v261, v26, a2, a3);
  unint64_t v41 = *((void *)&v261 + 1);
  uint64_t v40 = v261;
  uint64_t v17 = v262;
  uint64_t v244 = *((void *)&v263 + 1);
  *(void *)&long long v245 = v263;
  uint64_t v243 = v264;
  char v18 = BYTE8(v264);
  swift_errorRelease();
  LOBYTE(v235) = v23;
  uint64_t v42 = v39;
  uint64_t v10 = v40;
  uint64_t v43 = v246;
  unint64_t v12 = v41;
  sub_100070508(v37, v38, v42, v248, v247, v254, v253, v252, (uint64_t)v251, v22, (char)v235);
  swift_errorRelease();
LABEL_126:
  *(void *)uint64_t v43 = v10;
  *(void *)(v43 + 8) = v12;
  uint64_t v231 = v245;
  *(void *)(v43 + 16) = v17;
  *(void *)(v43 + 24) = v231;
  uint64_t v232 = v243;
  *(void *)(v43 + 32) = v244;
  *(void *)(v43 + 40) = v232;
  *(unsigned char *)(v43 + 48) = v18;
}

uint64_t sub_10008E5CC(uint64_t a1, uint64_t a2)
{
  sub_100053590(v2, (uint64_t)v30);
  sub_100053590(v2, (uint64_t)&v31);
  if (v37)
  {
    if (v37 == 1)
    {
      uint64_t v5 = v31;
      unint64_t v6 = v32;
      uint64_t v7 = v33;
      uint64_t v8 = v34;
      uint64_t v9 = v35;
      unint64_t v10 = v36;
      uint64_t v11 = HIBYTE(v36) & 0xF;
      if ((v36 & 0x2000000000000000) == 0) {
        uint64_t v11 = v35 & 0xFFFFFFFFFFFFLL;
      }
      if (v11)
      {
        String.append(_:)(*(Swift::String *)&v9);
        v12._uint64_t countAndFlagsBits = 10;
        v12._unint64_t object = (void *)0xE100000000000000;
        String.append(_:)(v12);
        uint64_t v14 = 0x20203A706C6548;
        uint64_t v13 = (void *)0xE700000000000000;
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v13 = (void *)0xE000000000000000;
      }
      uint64_t v21 = HIBYTE(v6) & 0xF;
      if ((v6 & 0x2000000000000000) == 0) {
        uint64_t v21 = v5 & 0xFFFFFFFFFFFFLL;
      }
      if (v21)
      {
        uint64_t v29 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
        v22._uint64_t countAndFlagsBits = 8250;
        v22._unint64_t object = (void *)0xE200000000000000;
        String.append(_:)(v22);
        v23._uint64_t countAndFlagsBits = v5;
        v23._unint64_t object = (void *)v6;
        String.append(_:)(v23);
        v24._uint64_t countAndFlagsBits = 10;
        v24._unint64_t object = (void *)0xE100000000000000;
        String.append(_:)(v24);
        uint64_t v21 = v29;
      }
      uint64_t v28 = v21;
      swift_bridgeObjectRetain();
      v25._uint64_t countAndFlagsBits = v14;
      v25._unint64_t object = v13;
      String.append(_:)(v25);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v26._uint64_t countAndFlagsBits = v7;
      v26._unint64_t object = v8;
      String.append(_:)(v26);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = v31;
      uint64_t v17 = (void *)v32;
      uint64_t v18 = HIBYTE(v32) & 0xF;
      if ((v32 & 0x2000000000000000) == 0) {
        uint64_t v18 = v31 & 0xFFFFFFFFFFFFLL;
      }
      if (!v18) {
        return 0;
      }
      uint64_t v28 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
      v19._uint64_t countAndFlagsBits = 8250;
      v19._unint64_t object = (void *)0xE200000000000000;
      String.append(_:)(v19);
      v20._uint64_t countAndFlagsBits = v16;
      v20._unint64_t object = v17;
      String.append(_:)(v20);
    }
    return v28;
  }
  else
  {
    uint64_t v15 = v31;
    swift_bridgeObjectRetain();
  }
  return v15;
}

unint64_t *sub_10008E7F4@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  unint64_t v3 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(void *)(*(void *)a2 + 16))
  {
    uint64_t v4 = *(void *)a2 + 16 * v3;
    uint64_t v5 = *(void *)(v4 + 40);
    *a3 = *(void *)(v4 + 32);
    a3[1] = v5;
    return (unint64_t *)swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

void sub_10008E838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 != 255) {
    sub_100070308(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  }
}

void sub_10008E858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 != 255) {
    sub_100070508(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  }
}

unint64_t sub_10008E878()
{
  unint64_t result = qword_1000C5E80[0];
  if (!qword_1000C5E80[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_1000C5E80);
  }
  return result;
}

unint64_t *sub_10008E8B8@<X0>(unint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_10008E7F4(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_10008E8D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, void *a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_8:
    sub_100035580(&v31);
    uint64_t v28 = &v31;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  long long v11 = *(_OWORD *)(a1 + 176);
  long long v39 = *(_OWORD *)(a1 + 160);
  long long v40 = v11;
  long long v12 = *(_OWORD *)(a1 + 208);
  long long v41 = *(_OWORD *)(a1 + 192);
  long long v42 = v12;
  long long v13 = *(_OWORD *)(a1 + 112);
  long long v35 = *(_OWORD *)(a1 + 96);
  long long v36 = v13;
  long long v14 = *(_OWORD *)(a1 + 144);
  long long v37 = *(_OWORD *)(a1 + 128);
  long long v38 = v14;
  long long v15 = *(_OWORD *)(a1 + 48);
  long long v31 = *(_OWORD *)(a1 + 32);
  long long v32 = v15;
  long long v16 = *(_OWORD *)(a1 + 80);
  long long v33 = *(_OWORD *)(a1 + 64);
  long long v34 = v16;
  if ((sub_10008EFF8(a2, a3, a4, v33) & 1) == 0)
  {
    uint64_t v17 = 224;
    while (--v8)
    {
      uint64_t v18 = v17 + 192;
      Swift::String v19 = (long long *)(a1 + v17);
      long long v20 = v19[9];
      long long v39 = v19[8];
      long long v40 = v20;
      long long v21 = v19[11];
      long long v41 = v19[10];
      long long v42 = v21;
      long long v22 = v19[5];
      long long v35 = v19[4];
      long long v36 = v22;
      long long v23 = v19[7];
      long long v37 = v19[6];
      long long v38 = v23;
      long long v24 = v19[1];
      long long v31 = *v19;
      long long v32 = v24;
      long long v25 = v19[3];
      long long v33 = v19[2];
      long long v34 = v25;
      char v26 = sub_10008EFF8(a2, a3, a4, v33);
      uint64_t v17 = v18;
      if (v26) {
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_6:
  sub_10002E940((uint64_t)&v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v30[8] = v39;
  v30[9] = v40;
  v30[10] = v41;
  v30[11] = v42;
  v30[4] = v35;
  v30[5] = v36;
  v30[6] = v37;
  v30[7] = v38;
  v30[0] = v31;
  v30[1] = v32;
  v30[2] = v33;
  v30[3] = v34;
  v27._uint64_t countAndFlagsBits = (uint64_t)v30;
  String.init(argument:)(v27);
  uint64_t v28 = v30;
LABEL_9:
  sub_1000641E0((uint64_t)v28, a5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10008EA84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, int a4@<W4>, uint64_t a5@<X8>)
{
  uint64_t v8 = a5;
  uint64_t v50 = *(void *)(a1 + 16);
  if (v50)
  {
    uint64_t v10 = a1 + 32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v11 = 0;
    long long v12 = *(_OWORD *)(a1 + 176);
    long long v46 = *(_OWORD *)(a1 + 160);
    long long v47 = v12;
    long long v13 = *(_OWORD *)(a1 + 208);
    long long v48 = *(_OWORD *)(a1 + 192);
    long long v49 = v13;
    long long v14 = *(_OWORD *)(a1 + 112);
    long long v42 = *(_OWORD *)(a1 + 96);
    long long v43 = v14;
    long long v15 = *(_OWORD *)(a1 + 144);
    long long v44 = *(_OWORD *)(a1 + 128);
    long long v45 = v15;
    long long v16 = *(_OWORD *)(a1 + 48);
    long long v38 = *(_OWORD *)(a1 + 32);
    long long v39 = v16;
    long long v17 = *(_OWORD *)(a1 + 80);
    long long v40 = *(_OWORD *)(a1 + 64);
    long long v41 = v17;
    uint64_t v36 = v10;
    while (1)
    {
      uint64_t v18 = _swiftEmptyArrayStorage;
      if ((unint64_t)v38 >= 2)
      {
        sub_10002EA30(v38);
        uint64_t v18 = (void *)v38;
      }
      uint64_t v19 = v18[2];
      if (v19) {
        break;
      }
      swift_bridgeObjectRelease();
LABEL_29:
      if (++v11 == v50)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10002ECB8(a2, a3, a4);
        uint64_t v8 = a5;
        goto LABEL_33;
      }
      char v26 = (long long *)(v10 + 192 * v11);
      long long v27 = v26[9];
      long long v46 = v26[8];
      long long v47 = v27;
      long long v28 = v26[11];
      long long v48 = v26[10];
      long long v49 = v28;
      long long v29 = v26[5];
      long long v42 = v26[4];
      long long v43 = v29;
      long long v30 = v26[7];
      long long v44 = v26[6];
      long long v45 = v30;
      long long v31 = v26[1];
      long long v38 = *v26;
      long long v39 = v31;
      long long v32 = v26[3];
      long long v40 = v26[2];
      long long v41 = v32;
    }
    long long v20 = (unsigned __int8 *)(v18 + 6);
    while (1)
    {
      uint64_t v21 = *((void *)v20 - 2);
      uint64_t v22 = *((void *)v20 - 1);
      unsigned int v23 = *v20;
      if (v23 >> 6)
      {
        if (v23 >> 6 == 1)
        {
          if ((a4 & 0xC0) == 0x40)
          {
            BOOL v24 = v21 == a2 && v22 == a3;
            if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)()) && ((a4 ^ v23) & 1) == 0) {
              goto LABEL_31;
            }
          }
          goto LABEL_8;
        }
        if ((a4 & 0xC0) != 0x80) {
          goto LABEL_8;
        }
      }
      else if (a4 >= 0x40u)
      {
        goto LABEL_8;
      }
      BOOL v25 = v21 == a2 && v22 == a3;
      if (v25 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
LABEL_31:
        sub_10002E940((uint64_t)&v38);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10002ECB8(a2, a3, a4);
        v37[8] = v46;
        v37[9] = v47;
        v37[10] = v48;
        v37[11] = v49;
        v37[4] = v42;
        v37[5] = v43;
        v37[6] = v44;
        v37[7] = v45;
        v37[0] = v38;
        v37[1] = v39;
        void v37[2] = v40;
        v37[3] = v41;
        v33._uint64_t countAndFlagsBits = (uint64_t)v37;
        String.init(argument:)(v33);
        return sub_1000641E0((uint64_t)v37, a5);
      }
LABEL_8:
      v20 += 24;
      if (!--v19)
      {
        swift_bridgeObjectRelease();
        uint64_t v10 = v36;
        goto LABEL_29;
      }
    }
  }
  sub_10002ECB8(a2, a3, a4);
LABEL_33:
  sub_100035580(&v38);
  return sub_1000641E0((uint64_t)&v38, v8);
}

uint64_t sub_10008ED48()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)v0;
  if (!*(void *)v0)
  {
    v30[0] = 60;
    v30[1] = 0xE100000000000000;
    Swift::String v4 = *(Swift::String *)(v0 + 88);
    long long v35 = *(_OWORD *)(v0 + 72);
    Swift::String v36 = v4;
    long long v37 = *(_OWORD *)(v0 + 104);
    uint64_t v38 = *(void *)(v0 + 120);
    long long v5 = *(_OWORD *)(v0 + 24);
    long long v31 = *(_OWORD *)(v0 + 8);
    long long v32 = v5;
    long long v6 = *(_OWORD *)(v0 + 56);
    long long v33 = *(_OWORD *)(v0 + 40);
    long long v34 = v6;
    Swift::String v39 = v36;
    uint64_t v7 = v36._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (((uint64_t)v36._object & 0x2000000000000000) != 0) {
      uint64_t v7 = ((unint64_t)v36._object >> 56) & 0xF;
    }
    if (v7)
    {
      Swift::String v29 = v36;
      swift_bridgeObjectRetain();
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_1000655C4((void *)v0, (unint64_t *)&v29);
      sub_100031A24((uint64_t)&v39);
    }
    String.append(_:)(v29);
    swift_bridgeObjectRelease();
    v23._uint64_t countAndFlagsBits = 62;
    v23._unint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v23);
    return v30[0];
  }
  if (v2 == 1) {
    return 0;
  }
  uint64_t v8 = sub_100065334(v2);
  if (v10 <= 0xFDu)
  {
    uint64_t v11 = v8;
    long long v12 = v9;
    unsigned __int8 v13 = v10;
    sub_10002EAA0(v1 + 152, (uint64_t)v30);
    sub_10002EAA0((uint64_t)v30, (uint64_t)&v39);
    v14._uint64_t countAndFlagsBits = v11;
    v14._unint64_t object = v12;
    if (v40 == 1)
    {
      uint64_t v15 = sub_100076D6C(v14, v13);
      uint64_t v17 = v16;
      sub_10002ECD0(v11, (uint64_t)v12, v13);
      uint64_t v27 = v15;
      uint64_t v28 = v17;
      v18._uint64_t countAndFlagsBits = 15392;
      v18._unint64_t object = (void *)0xE200000000000000;
      String.append(_:)(v18);
      Swift::String v19 = *(Swift::String *)(v1 + 88);
      long long v35 = *(_OWORD *)(v1 + 72);
      Swift::String v36 = v19;
      long long v37 = *(_OWORD *)(v1 + 104);
      uint64_t v38 = *(void *)(v1 + 120);
      long long v20 = *(_OWORD *)(v1 + 24);
      long long v31 = *(_OWORD *)(v1 + 8);
      long long v32 = v20;
      long long v21 = *(_OWORD *)(v1 + 56);
      long long v33 = *(_OWORD *)(v1 + 40);
      long long v34 = v21;
      Swift::String v29 = v19;
      uint64_t v22 = v19._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
      if (((uint64_t)v19._object & 0x2000000000000000) != 0) {
        uint64_t v22 = ((unint64_t)v19._object >> 56) & 0xF;
      }
      if (v22)
      {
        Swift::String v26 = v36;
        swift_bridgeObjectRetain();
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_1000655C4((void *)v1, (unint64_t *)&v26);
        sub_100031A24((uint64_t)&v29);
      }
      String.append(_:)(v26);
      swift_bridgeObjectRelease();
      v24._uint64_t countAndFlagsBits = 62;
      v24._unint64_t object = (void *)0xE100000000000000;
      String.append(_:)(v24);
      return v27;
    }
    else
    {
      uint64_t v3 = sub_100076D6C(v14, v13);
      sub_10002ECD0(v11, (uint64_t)v12, v13);
    }
    return v3;
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10008EFF8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 16);
  if (v4)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a4 + 32;
    long long v21 = a3 + 9;
    do
    {
      unsigned __int8 v10 = (void *)(v9 + 24 * v8);
      uint64_t v11 = (void *)v10[2];
      BOOL v12 = *v10 == a1 && v10[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        uint64_t v13 = v11[2];
        if (v13 == a3[2])
        {
          if (!v13 || v11 == a3) {
            return 1;
          }
          BOOL v14 = v11[4] == a3[4] && v11[5] == a3[5];
          if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            if (v13 == 1) {
              return 1;
            }
            BOOL v15 = v11[6] == a3[6] && v11[7] == a3[7];
            if (v15 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              uint64_t v16 = v13 - 2;
              if (!v16) {
                return 1;
              }
              uint64_t v17 = v11 + 9;
              for (uint64_t i = v21; ; i += 2)
              {
                BOOL v19 = *(v17 - 1) == *(i - 1) && *v17 == *i;
                if (!v19 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
                  break;
                }
                v17 += 2;
                if (!--v16) {
                  return 1;
                }
              }
            }
          }
        }
      }
      ++v8;
    }
    while (v8 != v4);
  }
  return 0;
}

void *sub_10008F160(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v18 = swift_bridgeObjectRetain();
    uint64_t v2 = (unsigned char *)(v18 + 48);
    uint64_t v3 = v1;
    do
    {
      char v7 = *v2;
      if ((*v2 & 0xC0) == 0x40)
      {
        uint64_t v9 = *((void *)v2 - 2);
        uint64_t v8 = *((void *)v2 - 1);
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_100057098(0, _swiftEmptyArrayStorage[2] + 1, 1);
        }
        unint64_t v5 = _swiftEmptyArrayStorage[2];
        unint64_t v4 = _swiftEmptyArrayStorage[3];
        if (v5 >= v4 >> 1) {
          sub_100057098((char *)(v4 > 1), v5 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v5 + 1;
        long long v6 = &_swiftEmptyArrayStorage[3 * v5];
        v6[4] = v9;
        v6[5] = v8;
        *((unsigned char *)v6 + 48) = v7;
      }
      v2 += 24;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    unsigned __int8 v10 = (unsigned __int8 *)(v18 + 48);
    do
    {
      unsigned __int8 v14 = *v10;
      if ((*v10 & 0xC0) != 0x40)
      {
        uint64_t v15 = *((void *)v10 - 2);
        uint64_t v16 = *((void *)v10 - 1);
        sub_1000319B8(v15, v16, *v10);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_100057098(0, _swiftEmptyArrayStorage[2] + 1, 1);
        }
        unint64_t v12 = _swiftEmptyArrayStorage[2];
        unint64_t v11 = _swiftEmptyArrayStorage[3];
        if (v12 >= v11 >> 1) {
          sub_100057098((char *)(v11 > 1), v12 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v12 + 1;
        uint64_t v13 = &_swiftEmptyArrayStorage[3 * v12];
        _OWORD v13[4] = v15;
        v13[5] = v16;
        *((unsigned char *)v13 + 48) = v14;
      }
      v10 += 24;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  sub_10005ECC4((uint64_t)_swiftEmptyArrayStorage);
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10008F368(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_100056B14(a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v9 = v8[2];
  if (v9)
  {
    v86._uint64_t countAndFlagsBits = a1;
    v86._unint64_t object = a2;
    if (v9 < 0xD)
    {
      sub_100056F98(0, v9, 0);
      uint64_t v35 = 4;
      do
      {
        long long v36 = *(_OWORD *)&v8[v35];
        long long v37 = *(_OWORD *)&v8[v35 + 2];
        long long v38 = *(_OWORD *)&v8[v35 + 6];
        long long v104 = *(_OWORD *)&v8[v35 + 4];
        long long v105 = v38;
        long long v102 = v36;
        long long v103 = v37;
        long long v39 = *(_OWORD *)&v8[v35 + 8];
        long long v40 = *(_OWORD *)&v8[v35 + 10];
        long long v41 = *(_OWORD *)&v8[v35 + 14];
        long long v108 = *(_OWORD *)&v8[v35 + 12];
        long long v109 = v41;
        long long v106 = v39;
        long long v107 = v40;
        long long v42 = *(_OWORD *)&v8[v35 + 16];
        long long v43 = *(_OWORD *)&v8[v35 + 18];
        long long v44 = *(_OWORD *)&v8[v35 + 22];
        long long v112 = *(_OWORD *)&v8[v35 + 20];
        long long v113 = v44;
        long long v110 = v42;
        long long v111 = v43;
        sub_10002E940((uint64_t)&v102);
        v88._uint64_t countAndFlagsBits = sub_10008ED48();
        v88._unint64_t object = v45;
        char v46 = BYTE8(v102);
        if ((BYTE8(v102) & 2) != 0)
        {
          v47._uint64_t countAndFlagsBits = 774778400;
          v47._unint64_t object = (void *)0xE400000000000000;
          String.append(_:)(v47);
        }
        if (v46)
        {
          v101._uint64_t countAndFlagsBits = 91;
          v101._unint64_t object = (void *)0xE100000000000000;
          String.append(_:)(v88);
          swift_bridgeObjectRelease();
          v48._uint64_t countAndFlagsBits = 93;
          v48._unint64_t object = (void *)0xE100000000000000;
          String.append(_:)(v48);
          Swift::String v88 = v101;
        }
        if (BYTE1(v111) == 5)
        {
          v101._uint64_t countAndFlagsBits = 2108717;
          v101._unint64_t object = (void *)0xE300000000000000;
          String.append(_:)(v88);
          swift_bridgeObjectRelease();
          sub_10002EAFC((uint64_t)&v102);
          unint64_t object = (void *)0xE300000000000000;
          uint64_t countAndFlagsBits = 2108717;
        }
        else
        {
          sub_10002EAFC((uint64_t)&v102);
          unint64_t object = v88._object;
          uint64_t countAndFlagsBits = v88._countAndFlagsBits;
        }
        unint64_t v52 = _swiftEmptyArrayStorage[2];
        unint64_t v51 = _swiftEmptyArrayStorage[3];
        if (v52 >= v51 >> 1) {
          sub_100056F98((char *)(v51 > 1), v52 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v52 + 1;
        uint64_t v53 = &_swiftEmptyArrayStorage[2 * v52];
        v53[4] = countAndFlagsBits;
        v53[5] = object;
        v35 += 24;
        --v9;
      }
      while (v9);
      swift_release();
      sub_100003DD0(&qword_1000C50C8);
      sub_100005178((unint64_t *)&qword_1000C50D0, &qword_1000C50C8);
      uint64_t v56 = BidirectionalCollection<>.joined(separator:)();
      unint64_t v58 = v57;
      swift_release();
      swift_bridgeObjectRetain();
      v59._uint64_t countAndFlagsBits = 32;
      v59._unint64_t object = (void *)0xE100000000000000;
      String.append(_:)(v59);
      v60._uint64_t countAndFlagsBits = v56;
      v60._unint64_t object = v58;
      String.append(_:)(v60);
      swift_bridgeObjectRelease();
      return v86._countAndFlagsBits;
    }
    else
    {
      unint64_t v10 = v9 - 1;
      uint64_t v11 = 4;
      unint64_t v12 = _swiftEmptyArrayStorage;
      while (1)
      {
        Swift::String v13 = *(Swift::String *)&v8[v11];
        long long v14 = *(_OWORD *)&v8[v11 + 2];
        long long v15 = *(_OWORD *)&v8[v11 + 6];
        long long v90 = *(_OWORD *)&v8[v11 + 4];
        long long v91 = v15;
        Swift::String v88 = v13;
        long long v89 = v14;
        long long v16 = *(_OWORD *)&v8[v11 + 8];
        long long v17 = *(_OWORD *)&v8[v11 + 10];
        long long v18 = *(_OWORD *)&v8[v11 + 12];
        long long v95 = *(_OWORD *)&v8[v11 + 14];
        long long v93 = v17;
        long long v94 = v18;
        long long v92 = v16;
        long long v19 = *(_OWORD *)&v8[v11 + 16];
        long long v20 = *(_OWORD *)&v8[v11 + 18];
        long long v21 = *(_OWORD *)&v8[v11 + 22];
        long long v98 = *(_OWORD *)&v8[v11 + 20];
        long long v99 = v21;
        long long v96 = v19;
        long long v97 = v20;
        if (!v88._countAndFlagsBits || ((uint64_t)v88._object & 1) == 0)
        {
          sub_10002E940((uint64_t)&v88);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v100 = v12;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_100056FB8(0, v12[2] + 1, 1);
            unint64_t v12 = v100;
          }
          unint64_t v24 = v12[2];
          unint64_t v23 = v12[3];
          if (v24 >= v23 >> 1)
          {
            sub_100056FB8((char *)(v23 > 1), v24 + 1, 1);
            unint64_t v12 = v100;
          }
          v12[2] = v24 + 1;
          BOOL v25 = &v12[24 * v24];
          Swift::String v26 = v88;
          long long v27 = v89;
          long long v28 = v91;
          void v25[4] = v90;
          v25[5] = v28;
          v25[2] = v26;
          v25[3] = v27;
          long long v29 = v92;
          long long v30 = v93;
          long long v31 = v95;
          v25[8] = v94;
          v25[9] = v31;
          v25[6] = v29;
          v25[7] = v30;
          long long v32 = v96;
          long long v33 = v97;
          long long v34 = v99;
          v25[12] = v98;
          v25[13] = v34;
          v25[10] = v32;
          v25[11] = v33;
        }
        if (!v10) {
          break;
        }
        --v10;
        v11 += 24;
      }
      swift_release();
      int64_t v54 = v12[2];
      if ((unint64_t)(v54 - 13) >= 0xFFFFFFFFFFFFFFF4)
      {
        sub_100056F98(0, v54, 0);
        uint64_t v61 = 4;
        do
        {
          long long v62 = *(_OWORD *)&v12[v61];
          long long v63 = *(_OWORD *)&v12[v61 + 2];
          long long v64 = *(_OWORD *)&v12[v61 + 6];
          long long v104 = *(_OWORD *)&v12[v61 + 4];
          long long v105 = v64;
          long long v102 = v62;
          long long v103 = v63;
          long long v65 = *(_OWORD *)&v12[v61 + 8];
          long long v66 = *(_OWORD *)&v12[v61 + 10];
          long long v67 = *(_OWORD *)&v12[v61 + 14];
          long long v108 = *(_OWORD *)&v12[v61 + 12];
          long long v109 = v67;
          long long v106 = v65;
          long long v107 = v66;
          long long v68 = *(_OWORD *)&v12[v61 + 16];
          long long v69 = *(_OWORD *)&v12[v61 + 18];
          long long v70 = *(_OWORD *)&v12[v61 + 22];
          long long v112 = *(_OWORD *)&v12[v61 + 20];
          long long v113 = v70;
          long long v110 = v68;
          long long v111 = v69;
          sub_10002E940((uint64_t)&v102);
          v101._uint64_t countAndFlagsBits = sub_10008ED48();
          v101._unint64_t object = v71;
          char v72 = BYTE8(v102);
          if ((BYTE8(v102) & 2) != 0)
          {
            v73._uint64_t countAndFlagsBits = 774778400;
            v73._unint64_t object = (void *)0xE400000000000000;
            String.append(_:)(v73);
          }
          if (v72)
          {
            v87._uint64_t countAndFlagsBits = 91;
            v87._unint64_t object = (void *)0xE100000000000000;
            String.append(_:)(v101);
            swift_bridgeObjectRelease();
            v74._uint64_t countAndFlagsBits = 93;
            v74._unint64_t object = (void *)0xE100000000000000;
            String.append(_:)(v74);
            Swift::String v101 = v87;
          }
          if (BYTE1(v111) == 5)
          {
            String.append(_:)(v101);
            swift_bridgeObjectRelease();
            sub_10002EAFC((uint64_t)&v102);
            uint64_t v75 = (void *)0xE300000000000000;
            uint64_t v76 = 2108717;
          }
          else
          {
            sub_10002EAFC((uint64_t)&v102);
            uint64_t v75 = v101._object;
            uint64_t v76 = v101._countAndFlagsBits;
          }
          unint64_t v78 = _swiftEmptyArrayStorage[2];
          unint64_t v77 = _swiftEmptyArrayStorage[3];
          if (v78 >= v77 >> 1) {
            sub_100056F98((char *)(v77 > 1), v78 + 1, 1);
          }
          _swiftEmptyArrayStorage[2] = v78 + 1;
          unsigned __int8 v79 = &_swiftEmptyArrayStorage[2 * v78];
          v79[4] = v76;
          v79[5] = v75;
          v61 += 24;
          --v54;
        }
        while (v54);
        swift_release();
        v101._uint64_t countAndFlagsBits = (uint64_t)_swiftEmptyArrayStorage;
        sub_100003DD0(&qword_1000C50C8);
        sub_100005178((unint64_t *)&qword_1000C50D0, &qword_1000C50C8);
        uint64_t v80 = BidirectionalCollection<>.joined(separator:)();
        uint64_t v82 = v81;
        swift_release();
        v101._uint64_t countAndFlagsBits = 0;
        v101._unint64_t object = (void *)0xE000000000000000;
        _StringGuts.grow(_:)(17);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        Swift::String v101 = v86;
        v83._uint64_t countAndFlagsBits = 0x6F6974706F3C5B20;
        v83._unint64_t object = (void *)0xED0000205D3E736ELL;
        String.append(_:)(v83);
        v84._uint64_t countAndFlagsBits = v80;
        v84._unint64_t object = v82;
        String.append(_:)(v84);
        swift_bridgeObjectRelease();
        return v101._countAndFlagsBits;
      }
      else
      {
        swift_release();
        *(void *)&long long v102 = v86._countAndFlagsBits;
        *((void *)&v102 + 1) = a2;
        swift_bridgeObjectRetain();
        v55._uint64_t countAndFlagsBits = 0x6E6F6974706F3C20;
        v55._unint64_t object = (void *)0xEA00000000003E73;
        String.append(_:)(v55);
        return v102;
      }
    }
  }
  else
  {
    swift_release();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10008F9F0()
{
  uint64_t v1 = v0;
  unint64_t v2 = *v0;
  if (!v2)
  {
    v36[0] = 60;
    v36[1] = 0xE100000000000000;
    Swift::String v4 = *(Swift::String *)(v1 + 11);
    long long v41 = *(_OWORD *)(v1 + 9);
    Swift::String v42 = v4;
    long long v43 = *(_OWORD *)(v1 + 13);
    unint64_t v44 = v1[15];
    long long v5 = *(_OWORD *)(v1 + 3);
    long long v37 = *(_OWORD *)(v1 + 1);
    long long v38 = v5;
    long long v6 = *(_OWORD *)(v1 + 7);
    long long v39 = *(_OWORD *)(v1 + 5);
    long long v40 = v6;
    Swift::String v45 = v42;
    uint64_t v7 = v42._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (((uint64_t)v42._object & 0x2000000000000000) != 0) {
      uint64_t v7 = ((unint64_t)v42._object >> 56) & 0xF;
    }
    if (v7)
    {
      Swift::String v35 = v42;
      swift_bridgeObjectRetain();
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_1000655C4(v1, (unint64_t *)&v35);
      sub_100031A24((uint64_t)&v45);
    }
    String.append(_:)(v35);
    swift_bridgeObjectRelease();
    v22._uint64_t countAndFlagsBits = 62;
    v22._unint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v22);
    return v36[0];
  }
  if (v2 == 1) {
    return 0;
  }
  uint64_t v8 = swift_bridgeObjectRetain();
  unint64_t v9 = sub_10008F160(v8);
  sub_10002EBEC(v2);
  int64_t v10 = v9[2];
  if (!v10)
  {
    swift_bridgeObjectRelease();
    uint64_t countAndFlagsBits = _swiftEmptyArrayStorage;
    goto LABEL_23;
  }
  v45._uint64_t countAndFlagsBits = (uint64_t)_swiftEmptyArrayStorage;
  sub_100056F98(0, v10, 0);
  uint64_t countAndFlagsBits = _swiftEmptyArrayStorage;
  unint64_t v12 = (unsigned __int8 *)(v9 + 6);
  do
  {
    uint64_t v14 = *((void *)v12 - 2);
    Swift::String v13 = (void *)*((void *)v12 - 1);
    unsigned int v15 = *v12;
    if (v15 >> 6)
    {
      if (v15 >> 6 == 1)
      {
        *(void *)&long long v37 = 0;
        *((void *)&v37 + 1) = 0xE000000000000000;
        swift_bridgeObjectRetain();
        v16._uint64_t countAndFlagsBits = 45;
        v16._unint64_t object = (void *)0xE100000000000000;
        String.append(_:)(v16);
        Character.write<A>(to:)();
        goto LABEL_16;
      }
      *(void *)&long long v37 = 45;
      unint64_t v17 = 0xE100000000000000;
    }
    else
    {
      *(void *)&long long v37 = 11565;
      unint64_t v17 = 0xE200000000000000;
    }
    *((void *)&v37 + 1) = v17;
    swift_bridgeObjectRetain();
    v18._uint64_t countAndFlagsBits = v14;
    v18._unint64_t object = v13;
    String.append(_:)(v18);
LABEL_16:
    sub_10002ECB8(v14, (uint64_t)v13, v15);
    long long v19 = v37;
    v45._uint64_t countAndFlagsBits = (uint64_t)countAndFlagsBits;
    unint64_t v21 = countAndFlagsBits[2];
    unint64_t v20 = countAndFlagsBits[3];
    if (v21 >= v20 >> 1)
    {
      sub_100056F98((char *)(v20 > 1), v21 + 1, 1);
      uint64_t countAndFlagsBits = (void *)v45._countAndFlagsBits;
    }
    v12 += 24;
    countAndFlagsBits[2] = v21 + 1;
    *(_OWORD *)&countAndFlagsBits[2 * v21 + 4] = v19;
    --v10;
  }
  while (v10);
  swift_bridgeObjectRelease();
LABEL_23:
  *(void *)&long long v37 = countAndFlagsBits;
  sub_100003DD0(&qword_1000C50C8);
  sub_100005178((unint64_t *)&qword_1000C50D0, &qword_1000C50C8);
  uint64_t v3 = BidirectionalCollection<>.joined(separator:)();
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  sub_10002EAA0((uint64_t)(v1 + 19), (uint64_t)v36);
  sub_10002EAA0((uint64_t)v36, (uint64_t)&v45);
  if (v46)
  {
    uint64_t v33 = v3;
    uint64_t v34 = v24;
    v25._uint64_t countAndFlagsBits = 15392;
    v25._unint64_t object = (void *)0xE200000000000000;
    String.append(_:)(v25);
    Swift::String v26 = *(Swift::String *)(v1 + 11);
    long long v41 = *(_OWORD *)(v1 + 9);
    Swift::String v42 = v26;
    long long v43 = *(_OWORD *)(v1 + 13);
    unint64_t v44 = v1[15];
    long long v27 = *(_OWORD *)(v1 + 3);
    long long v37 = *(_OWORD *)(v1 + 1);
    long long v38 = v27;
    long long v28 = *(_OWORD *)(v1 + 7);
    long long v39 = *(_OWORD *)(v1 + 5);
    long long v40 = v28;
    Swift::String v35 = v26;
    uint64_t v29 = v26._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (((uint64_t)v26._object & 0x2000000000000000) != 0) {
      uint64_t v29 = ((unint64_t)v26._object >> 56) & 0xF;
    }
    if (v29)
    {
      Swift::String v32 = v42;
      swift_bridgeObjectRetain();
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_1000655C4(v1, (unint64_t *)&v32);
      sub_100031A24((uint64_t)&v35);
    }
    String.append(_:)(v32);
    swift_bridgeObjectRelease();
    v30._uint64_t countAndFlagsBits = 62;
    v30._unint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v30);
    return v33;
  }
  return v3;
}

unint64_t sub_10008FDC0()
{
  swift_errorRetain();
  sub_100003DD0(&qword_1000C58A0);
  if (swift_dynamicCast())
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100070308(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
    unint64_t v1 = sub_10009098C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100070508(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
    sub_100070508(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_5:
    swift_errorRelease();
    return v1;
  }
  swift_errorRelease();
  swift_errorRetain();
  if (swift_dynamicCast())
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100070308(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
    unint64_t v1 = sub_10009098C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100070508(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
    swift_bridgeObjectRelease();
    sub_100070508(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_5;
  }
  swift_errorRelease();
  return 0;
}

uint64_t sub_1000900F0()
{
  swift_errorRetain();
  sub_100003DD0(&qword_1000C58A0);
  if (swift_dynamicCast())
  {
    switch(v17)
    {
      case 7u:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_100070308(v7, v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, 7);
        uint64_t v0 = sub_10009181C(v8, v9, (int)v10);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100070508(v7, v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, 7);
        sub_100070508(v7, v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, 7);
        goto LABEL_21;
      case 0xBu:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_100070308(v7, v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, 11);
        uint64_t v0 = sub_1000919E8(v7, v8, v9);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100070508(v7, v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, 11);
        sub_100070508(v7, v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, 11);
        goto LABEL_21;
      case 0xCu:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_100070308(v7, v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, 12);
        swift_errorRetain();
        uint64_t v0 = sub_1000956B8(v8, v9, v10, v13, v14, v15);
        swift_errorRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100070508(v7, v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, 12);
        sub_100070508(v7, v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, 12);
LABEL_21:
        swift_errorRelease();
        return v0;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100070308(v7, v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100070508(v7, v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, v17);
    sub_100070508(v7, v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, v17);
LABEL_20:
    uint64_t v0 = 0;
    goto LABEL_21;
  }
  swift_errorRelease();
  swift_errorRetain();
  if (swift_dynamicCast())
  {
    switch(v18)
    {
      case 7:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v1 = v12;
        unsigned __int8 v3 = v13;
        sub_100070308(v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, v17, 7);
        uint64_t v6 = sub_10009181C((uint64_t)v9, v10, v11);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v2 = (uint64_t)v15;
        sub_100070508(v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, v17, 7);
        swift_bridgeObjectRelease();
        char v4 = 7;
        break;
      case 11:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v1 = v12;
        unsigned __int8 v3 = v13;
        sub_100070308(v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, v17, 11);
        uint64_t v6 = sub_1000919E8(v8, (uint64_t)v9, v10);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v2 = (uint64_t)v15;
        sub_100070508(v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, v17, 11);
        swift_bridgeObjectRelease();
        char v4 = 11;
        break;
      case 12:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_100070308(v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, v17, 12);
        swift_errorRetain();
        uint64_t v6 = sub_1000956B8((uint64_t)v9, v10, v11, v14, (uint64_t)v15, v16);
        swift_errorRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v1 = v12;
        unsigned __int8 v3 = v13;
        uint64_t v2 = (uint64_t)v15;
        sub_100070508(v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, v17, 12);
        swift_bridgeObjectRelease();
        char v4 = 12;
        break;
      default:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_100070308(v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, v17, v18);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100070508(v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, v17, v18);
        swift_bridgeObjectRelease();
        sub_100070508(v8, (uint64_t)v9, (uint64_t)v10, v11, v12, v13, v14, (uint64_t)v15, (uint64_t)v16, v17, v18);
        goto LABEL_20;
    }
    uint64_t v0 = v6;
    sub_100070508(v8, (uint64_t)v9, (uint64_t)v10, v11, v1, v3, v14, v2, (uint64_t)v16, v17, v4);
    goto LABEL_21;
  }
  swift_errorRelease();
  return 0;
}

unint64_t sub_10009098C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v7 = *(void *)(v0 + 64);
  uint64_t v8 = *(void *)(v0 + 72);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v10 = *(void *)(v0 + 88);
  uint64_t v11 = 0;
  switch(*(unsigned char *)(v0 + 96))
  {
    case 3:
      if (!v2) {
        return sub_100094108();
      }
      uint64_t v59 = *(void *)(v0 + 80);
      uint64_t v12 = *(void *)(v0 + 40);
      uint64_t v13 = *(void *)(v0 + 48);
      uint64_t v52 = v13;
      uint64_t v14 = v12;
      uint64_t v15 = *(void *)(v0 + 56);
      uint64_t v16 = *(void *)(v0 + 64);
      sub_100070308(v1, v2, v4, v12, v13, v5, v7, v8, v9, v10, 3);
      uint64_t v11 = sub_100093F40(v1, (void *)v2);
      sub_100070508(v1, v2, v4, v14, v52, v15, v16, v8, v59, v10, 3);
      return v11;
    case 4:
      uint64_t v60 = *(void *)(v0 + 80);
      uint64_t v17 = *(void **)(v0 + 48);
      uint64_t v53 = (uint64_t)v17;
      uint64_t v55 = *(void *)(v0 + 64);
      uint64_t v18 = *(void *)(v0 + 40);
      uint64_t v19 = *(void *)(v0 + 56);
      sub_100070308(v1, v2, v4, v18, (uint64_t)v17, v5, v7, v8, v9, v10, 4);
      uint64_t v11 = (uint64_t)sub_100094664(v18, v17, v19);
      sub_100070508(v1, v2, v4, v18, v53, v19, v55, v8, v60, v10, 4);
      return v11;
    case 5:
      uint64_t v20 = *(void *)(v0 + 80);
      uint64_t v57 = *(void *)(v0 + 72);
      uint64_t v21 = *(void *)(v0 + 40);
      unsigned __int8 v22 = *(void *)(v0 + 56);
      uint64_t v23 = *(void *)(v0 + 64);
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(18);
      swift_bridgeObjectRelease();
      *(void *)&long long v76 = 0xD000000000000010;
      *((void *)&v76 + 1) = 0x80000001000A9AB0;
      v24._uint64_t countAndFlagsBits = v1;
      v24._unint64_t object = (void *)v2;
      String.append(_:)(v24);
      char v25 = 5;
      goto LABEL_7;
    case 6:
      *(void *)&long long v76 = 0;
      *((void *)&v76 + 1) = 0xE000000000000000;
      uint64_t v20 = v9;
      uint64_t v57 = v8;
      uint64_t v21 = v3;
      unsigned __int8 v22 = v5;
      uint64_t v23 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(19);
      v26._uint64_t countAndFlagsBits = 0xD000000000000011;
      v26._unint64_t object = (void *)0x80000001000A9A90;
      String.append(_:)(v26);
      Character.write<A>(to:)();
      char v25 = 6;
LABEL_7:
      sub_100070508(v1, v2, v4, v21, v6, v22, v23, v57, v20, v10, v25);
      return v76;
    case 7:
      swift_bridgeObjectRetain();
      sub_1000319B8(v2, v4, v3);
      uint64_t v11 = sub_100094A30(v2, (void *)v4, v3);
      sub_10002ECB8(v2, v4, v3);
      goto LABEL_17;
    case 8:
      *(void *)&long long v76 = 0;
      *((void *)&v76 + 1) = 0xE000000000000000;
      unsigned __int8 v27 = v5;
      uint64_t v28 = v7;
      sub_1000319B8(v3, v6, v5);
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(64);
      v29._uint64_t countAndFlagsBits = 0x6974706F20656854;
      v29._unint64_t object = (void *)0xEC00000027206E6FLL;
      String.append(_:)(v29);
      v88._uint64_t countAndFlagsBits = v3;
      v88._unint64_t object = (void *)v6;
      v30._uint64_t countAndFlagsBits = sub_100076D6C(v88, v27);
      String.append(_:)(v30);
      swift_bridgeObjectRelease();
      v31._uint64_t countAndFlagsBits = 0xD000000000000020;
      v31._unint64_t object = (void *)0x80000001000A9AD0;
      String.append(_:)(v31);
      v32._uint64_t countAndFlagsBits = v28;
      v32._unint64_t object = (void *)v8;
      String.append(_:)(v32);
      v33._unint64_t object = (void *)0x80000001000A9B00;
      v33._uint64_t countAndFlagsBits = 0xD000000000000010;
      String.append(_:)(v33);
      swift_bridgeObjectRelease();
      sub_10002ECB8(v3, v6, v27);
      return v76;
    case 9:
      uint64_t v61 = *(void *)(v0 + 80);
      uint64_t v34 = *(void *)(v0 + 40);
      uint64_t v35 = *(void *)(v0 + 48);
      uint64_t v54 = v35;
      uint64_t v36 = v34;
      uint64_t v37 = *(void *)(v0 + 56);
      uint64_t v38 = *(void *)(v0 + 64);
      sub_100070308(v1, v2, v4, v34, v35, v5, v7, v8, v9, v10, 9);
      uint64_t v11 = sub_100094B84((void *)v1);
      sub_100070508(v1, v2, v4, v36, v54, v37, v38, v8, v61, v10, 9);
      return v11;
    case 0xA:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_100094DCC(v1, v2, v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v11;
    case 0xB:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_100091354(v1, v2, (char *)v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v11;
    case 0xC:
      long long v62 = *(void **)(v0 + 80);
      uint64_t v39 = *(void *)(v0 + 48);
      unsigned __int8 v40 = *(void *)(v0 + 40);
      uint64_t v50 = *(void *)(v0 + 40);
      long long v41 = *(void **)(v0 + 56);
      uint64_t v42 = *(void *)(v0 + 64);
      sub_100070308(v1, v2, v4, v50, v39, v5, v7, v8, v9, v10, 12);
      uint64_t v11 = sub_10009513C(v2, (void *)v4, v40, v39, v41, v42, v8, v62, v10);
      swift_errorRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10002ECD0(v2, v4, v50);
LABEL_17:
      swift_bridgeObjectRelease();
      return v11;
    case 0xD:
      uint64_t v58 = *(void *)(v0 + 72);
      uint64_t v63 = *(void *)(v0 + 80);
      uint64_t v56 = *(void *)(v0 + 64);
      uint64_t v51 = *(void *)(v0 + 56);
      uint64_t v75 = *(void *)(v0 + 16);
      swift_errorRetain();
      swift_errorRetain();
      sub_100003DD0(&qword_1000C58A0);
      sub_100003DD0(&qword_1000C5E78);
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_35;
      }
      sub_10004B100(&v76, (uint64_t)&v64);
      sub_100005090(&v64, v67);
      uint64_t v11 = dispatch thunk of LocalizedError.errorDescription.getter();
      char v43 = 13;
      goto LABEL_29;
    case 0xE:
      uint64_t v58 = *(void *)(v0 + 72);
      uint64_t v63 = *(void *)(v0 + 80);
      uint64_t v56 = *(void *)(v0 + 64);
      uint64_t v51 = *(void *)(v0 + 56);
      uint64_t v75 = *(void *)(v0 + 16);
      swift_errorRetain();
      swift_errorRetain();
      sub_100003DD0(&qword_1000C58A0);
      if (swift_dynamicCast())
      {
        uint64_t v49 = *(void *)(v0 + 8);
        *(void *)&long long v76 = *(void *)v0;
        *((void *)&v76 + 1) = v49;
        uint64_t v77 = v64;
        uint64_t v78 = v65;
        uint64_t v79 = v66;
        uint64_t v80 = v67;
        uint64_t v81 = v68;
        uint64_t v82 = v69;
        uint64_t v83 = v70;
        uint64_t v84 = v71;
        uint64_t v85 = v72;
        uint64_t v86 = v73;
        char v87 = v74;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_100070308(v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74);
        uint64_t v11 = sub_10009098C();
        sub_100070508(v1, v2, v4, v3, v6, v51, v56, v58, v63, v10, 14);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100070508(v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74);
        sub_100070508(v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74);
LABEL_30:
        swift_errorRelease();
        return v11;
      }
      swift_errorRelease();
      uint64_t v75 = v1;
      swift_errorRetain();
      sub_100003DD0(&qword_1000C5E78);
      if (swift_dynamicCast())
      {
        sub_10004B100(&v76, (uint64_t)&v64);
        sub_100005090(&v64, v67);
        uint64_t v11 = dispatch thunk of LocalizedError.errorDescription.getter();
        char v43 = 14;
LABEL_29:
        sub_100070508(v1, v2, v4, v3, v6, v51, v56, v58, v63, v10, v43);
        sub_100005128((uint64_t)&v64);
        goto LABEL_30;
      }
LABEL_35:
      swift_errorRelease();
      *(void *)&long long v76 = v1;
      return String.init<A>(describing:)();
    case 0xF:
      uint64_t v44 = v6 | v5 | v7;
      uint64_t v45 = v8 | v9 | v10;
      if (!(v4 | v2 | v1 | v3 | v44 | v45)) {
        return 0;
      }
      uint64_t v46 = v4 | v2 | v3 | v44 | v45;
      if (v1 == 1 && !v46) {
        return 0;
      }
      if (v1 == 2 && !v46) {
        return 0xD00000000000004BLL;
      }
      if (v1 == 3 && v46 == 0) {
        return 0xD000000000000043;
      }
      return 0xD00000000000001CLL;
    default:
      return v11;
  }
}

uint64_t sub_100091354(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v7 = *v3;
  uint64_t v62 = v3[1];
  uint64_t v63 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10002B9FC((uint64_t)&v63);
  sub_10002B9FC((uint64_t)&v62);
  uint64_t v8 = sub_100094F80(v7, a1, a2, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10002BAD0((uint64_t)&v63);
  sub_10002BAD0((uint64_t)&v62);
  uint64_t v9 = *(void *)(v8 + 16);
  if (!v9)
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
    uint64_t v31 = _swiftEmptyArrayStorage[2];
    if (v31) {
      goto LABEL_17;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    *(void *)&long long v52 = 0;
    *((void *)&v52 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(86);
    v34._uint64_t countAndFlagsBits = 0xD000000000000022;
    v34._unint64_t object = (void *)0x80000001000A9DD0;
    String.append(_:)(v34);
    v35._uint64_t countAndFlagsBits = sub_100075BCC(a1, a2, a3);
    String.append(_:)(v35);
    swift_bridgeObjectRelease();
    unint64_t v36 = 0xD000000000000032;
    unint64_t v37 = 0x80000001000A9E00;
LABEL_24:
    String.append(_:)(*(Swift::String *)&v36);
    return v52;
  }
  uint64_t v41 = a1;
  uint64_t v42 = a3;
  swift_bridgeObjectRetain();
  uint64_t v10 = v9 - 1;
  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  for (uint64_t i = 32; ; i += 192)
  {
    long long v13 = *(_OWORD *)(v8 + i);
    long long v14 = *(_OWORD *)(v8 + i + 16);
    long long v15 = *(_OWORD *)(v8 + i + 48);
    long long v54 = *(_OWORD *)(v8 + i + 32);
    *(_OWORD *)uint64_t v55 = v15;
    long long v52 = v13;
    long long v53 = v14;
    long long v16 = *(_OWORD *)(v8 + i + 64);
    long long v17 = *(_OWORD *)(v8 + i + 80);
    long long v18 = *(_OWORD *)(v8 + i + 112);
    long long v57 = *(_OWORD *)(v8 + i + 96);
    long long v58 = v18;
    *(_OWORD *)&v55[16] = v16;
    long long v56 = v17;
    long long v19 = *(_OWORD *)(v8 + i + 128);
    long long v20 = *(_OWORD *)(v8 + i + 144);
    long long v21 = *(_OWORD *)(v8 + i + 176);
    *(_OWORD *)&v60[16] = *(_OWORD *)(v8 + i + 160);
    long long v61 = v21;
    long long v59 = v19;
    *(_OWORD *)uint64_t v60 = v20;
    if (!BYTE8(v57))
    {
      char v22 = BYTE8(v52);
      int v23 = v60[1];
      *(void *)&v44[0] = v52;
      *((void *)&v44[0] + 1) = *((void *)&v52 + 1) & 0xFFFFFFFFFFFFFFFELL;
      v44[1] = v53;
      v44[2] = v54;
      v45[0] = v55[0];
      *(_OWORD *)&v45[8] = *(_OWORD *)&v55[8];
      *(void *)&v45[24] = *(void *)&v55[24];
      long long v46 = v56;
      *(void *)&long long v47 = v57;
      BYTE8(v47) = 0;
      long long v48 = v58;
      long long v49 = v59;
      *(_WORD *)uint64_t v50 = *(_WORD *)v60;
      *(_OWORD *)&v50[8] = *(_OWORD *)&v60[8];
      v50[24] = v60[24];
      long long v51 = v61;
      long long v70 = v47;
      long long v71 = v58;
      long long v68 = *(_OWORD *)&v45[16];
      long long v69 = v56;
      long long v66 = v54;
      long long v67 = *(_OWORD *)v45;
      long long v64 = v44[0];
      long long v65 = v53;
      long long v74 = *(_OWORD *)&v50[16];
      long long v75 = v61;
      long long v72 = v59;
      long long v73 = *(_OWORD *)v50;
      sub_10002E940((uint64_t)&v52);
      sub_10002E940((uint64_t)&v52);
      v43._uint64_t countAndFlagsBits = sub_10008ED48();
      v43._unint64_t object = v24;
      if ((v22 & 2) != 0)
      {
        v25._uint64_t countAndFlagsBits = 774778400;
        v25._unint64_t object = (void *)0xE400000000000000;
        String.append(_:)(v25);
      }
      if (v23 == 5)
      {
        String.append(_:)(v43);
        swift_bridgeObjectRelease();
        sub_10002EAFC((uint64_t)v44);
        sub_10002EAFC((uint64_t)&v52);
        uint64_t countAndFlagsBits = 2108717;
        unint64_t object = 0xE300000000000000;
      }
      else
      {
        sub_10002EAFC((uint64_t)v44);
        sub_10002EAFC((uint64_t)&v52);
        unint64_t object = (unint64_t)v43._object;
        uint64_t countAndFlagsBits = v43._countAndFlagsBits;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v11 = sub_10005FA90(0, *((void *)v11 + 2) + 1, 1, v11);
      }
      unint64_t v29 = *((void *)v11 + 2);
      unint64_t v28 = *((void *)v11 + 3);
      if (v29 >= v28 >> 1) {
        uint64_t v11 = sub_10005FA90((char *)(v28 > 1), v29 + 1, 1, v11);
      }
      *((void *)v11 + 2) = v29 + 1;
      Swift::String v30 = &v11[16 * v29];
      *((void *)v30 + 4) = countAndFlagsBits;
      *((void *)v30 + 5) = object;
    }
    if (!v10) {
      break;
    }
    --v10;
  }
  swift_bridgeObjectRelease_n();
  a1 = v41;
  a3 = v42;
  uint64_t v31 = *((void *)v11 + 2);
  if (!v31) {
    goto LABEL_21;
  }
LABEL_17:
  if (v31 != 1)
  {
    *(void *)&long long v52 = v11;
    sub_100003DD0(&qword_1000C50C8);
    sub_100005178((unint64_t *)&qword_1000C50D0, &qword_1000C50C8);
    uint64_t v32 = BidirectionalCollection<>.joined(separator:)();
    Swift::String v33 = v38;
    swift_bridgeObjectRelease();
    *(void *)&long long v52 = 0;
    *((void *)&v52 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(20);
    swift_bridgeObjectRelease();
    *(void *)&long long v52 = 0xD000000000000011;
    *((void *)&v52 + 1) = 0x80000001000A9D90;
    goto LABEL_23;
  }
  *(void *)&long long v52 = 0;
  *((void *)&v52 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease();
  *(void *)&long long v52 = 0xD00000000000001BLL;
  *((void *)&v52 + 1) = 0x80000001000A9DB0;
  if (*((void *)v11 + 2))
  {
    uint64_t v32 = *((void *)v11 + 4);
    Swift::String v33 = (void *)*((void *)v11 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
LABEL_23:
    v39._uint64_t countAndFlagsBits = v32;
    v39._unint64_t object = v33;
    String.append(_:)(v39);
    swift_bridgeObjectRelease();
    unint64_t v36 = 39;
    unint64_t v37 = 0xE100000000000000;
    goto LABEL_24;
  }
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_10009181C(uint64_t a1, void *a2, int a3)
{
  uint64_t v7 = *v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000319B8(a1, (uint64_t)a2, a3);
  sub_10008EA84(v7, a1, (uint64_t)a2, a3, (uint64_t)v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000641E0((uint64_t)v20, (uint64_t)v22);
  sub_1000641E0((uint64_t)v22, (uint64_t)v23);
  if (sub_1000353CC((uint64_t)v23) == 1) {
    return 0;
  }
  v21[8] = v29;
  v21[9] = v30;
  v21[10] = v31;
  v21[11] = v32;
  v21[4] = v25;
  v21[5] = v26;
  v21[6] = v27;
  v21[7] = v28;
  v21[0] = v23[0];
  v21[1] = v23[1];
  v21[2] = v23[2];
  v21[3] = v24;
  uint64_t v9 = *((void *)&v24 + 1);
  uint64_t v10 = (void *)v25;
  uint64_t v11 = *((void *)&v26 + 1);
  unint64_t v12 = v27;
  swift_bridgeObjectRetain();
  v33._uint64_t countAndFlagsBits = a1;
  v33._unint64_t object = a2;
  v20[0] = sub_100076D6C(v33, a3);
  v20[1] = v13;
  v14._uint64_t countAndFlagsBits = 15392;
  v14._unint64_t object = (void *)0xE200000000000000;
  String.append(_:)(v14);
  if ((v12 & 0x2000000000000000) != 0) {
    uint64_t v15 = HIBYTE(v12) & 0xF;
  }
  else {
    uint64_t v15 = v11 & 0xFFFFFFFFFFFFLL;
  }
  swift_bridgeObjectRetain();
  if (!v15)
  {
    sub_1000655C4(v21, v19);
    swift_bridgeObjectRelease();
    uint64_t v11 = v19[0];
    unint64_t v12 = v19[1];
  }
  v16._uint64_t countAndFlagsBits = v11;
  v16._unint64_t object = (void *)v12;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._uint64_t countAndFlagsBits = 2105406;
  v17._unint64_t object = (void *)0xE300000000000000;
  String.append(_:)(v17);
  v18._uint64_t countAndFlagsBits = v9;
  v18._unint64_t object = v10;
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  sub_1000353E4((uint64_t)v22);
  return v20[0];
}

uint64_t sub_1000919E8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10008E8D8(v7, a1, a2, a3, (uint64_t)v38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000641E0((uint64_t)v38, (uint64_t)v53);
  sub_1000641E0((uint64_t)v53, (uint64_t)v54);
  if (sub_1000353CC((uint64_t)v54) == 1) {
    return 0;
  }
  sub_1000641E0((uint64_t)v53, (uint64_t)v35);
  uint64_t v8 = v37;
  uint64_t v30 = v36;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  long long v31 = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000353E4((uint64_t)v53);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_100094F80(v7, a1, a2, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v9 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  long long v10 = *(_OWORD *)(v9 + 176);
  long long v40 = *(_OWORD *)(v9 + 160);
  long long v41 = v10;
  long long v11 = *(_OWORD *)(v9 + 208);
  long long v42 = *(_OWORD *)(v9 + 192);
  long long v43 = v11;
  long long v12 = *(_OWORD *)(v9 + 112);
  *(_OWORD *)&v39[64] = *(_OWORD *)(v9 + 96);
  *(_OWORD *)&v39[80] = v12;
  long long v13 = *(_OWORD *)(v9 + 144);
  *(_OWORD *)&v39[96] = *(_OWORD *)(v9 + 128);
  *(_OWORD *)&v39[112] = v13;
  long long v14 = *(_OWORD *)(v9 + 48);
  *(_OWORD *)Swift::String v39 = *(_OWORD *)(v9 + 32);
  *(_OWORD *)&v39[16] = v14;
  long long v15 = *(_OWORD *)(v9 + 80);
  *(_OWORD *)&v39[32] = *(_OWORD *)(v9 + 64);
  *(_OWORD *)&v39[48] = v15;
  Swift::String v16 = *(void **)v39;
  sub_10002E940((uint64_t)v39);
  swift_bridgeObjectRelease();
  if ((unint64_t)v16 >= 2) {
    swift_bridgeObjectRetain();
  }
  else {
    Swift::String v16 = _swiftEmptyArrayStorage;
  }
  long long v48 = *(_OWORD *)&v39[72];
  long long v49 = *(_OWORD *)&v39[88];
  long long v50 = *(_OWORD *)&v39[104];
  uint64_t v51 = *(void *)&v39[120];
  long long v44 = *(_OWORD *)&v39[8];
  long long v45 = *(_OWORD *)&v39[24];
  long long v46 = *(_OWORD *)&v39[40];
  long long v47 = *(_OWORD *)&v39[56];
  Swift::String v52 = *(Swift::String *)&v39[88];
  if (v16[2])
  {
    uint64_t v18 = v16[4];
    long long v19 = (void *)v16[5];
    unsigned __int8 v20 = *((unsigned char *)v16 + 48);
    sub_1000319B8(v18, (uint64_t)v19, v20);
    swift_bridgeObjectRelease();
    v55._uint64_t countAndFlagsBits = v18;
    v55._unint64_t object = v19;
    uint64_t v21 = sub_100076D6C(v55, v20);
    unint64_t v23 = v22;
    sub_10002ECB8(v18, (uint64_t)v19, v20);
    uint64_t v33 = v21;
    unint64_t v34 = v23;
    v24._uint64_t countAndFlagsBits = 15392;
    v24._unint64_t object = (void *)0xE200000000000000;
    String.append(_:)(v24);
    uint64_t v25 = v52._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (((uint64_t)v52._object & 0x2000000000000000) != 0) {
      uint64_t v25 = ((unint64_t)v52._object >> 56) & 0xF;
    }
    if (v25)
    {
      Swift::String v32 = v52;
      swift_bridgeObjectRetain();
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_1000655C4(v39, (unint64_t *)&v32);
      sub_100031A24((uint64_t)&v52);
    }
    long long v27 = v31;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v33 = 60;
    unint64_t v34 = 0xE100000000000000;
    uint64_t v26 = v52._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (((uint64_t)v52._object & 0x2000000000000000) != 0) {
      uint64_t v26 = ((unint64_t)v52._object >> 56) & 0xF;
    }
    long long v27 = v31;
    if (v26)
    {
      Swift::String v32 = v52;
      swift_bridgeObjectRetain();
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_1000655C4(v39, (unint64_t *)&v32);
      sub_100031A24((uint64_t)&v52);
    }
  }
  String.append(_:)(v32);
  swift_bridgeObjectRelease();
  v28._uint64_t countAndFlagsBits = 2105406;
  v28._unint64_t object = (void *)0xE300000000000000;
  String.append(_:)(v28);
  v29._uint64_t countAndFlagsBits = v30;
  v29._unint64_t object = v27;
  String.append(_:)(v29);
  swift_bridgeObjectRelease();
  sub_10002EAFC((uint64_t)v39);
  return v33;
}

unint64_t sub_100091DCC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v7 = *v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000319B8(a1, a2, a3);
  sub_10008EA84(v7, a1, a2, a3, (uint64_t)v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000641E0((uint64_t)v20, (uint64_t)v22);
  sub_1000641E0((uint64_t)v22, (uint64_t)v23);
  uint64_t v8 = 0;
  if (sub_1000353CC((uint64_t)v23) != 1)
  {
    sub_1000641E0((uint64_t)v22, (uint64_t)v12);
    uint64_t v8 = *((void *)&v13 + 1);
    if ((v14 & 0x2000000000000000) != 0) {
      unint64_t v9 = BYTE7(v14) & 0xF;
    }
    else {
      unint64_t v9 = *((void *)&v13 + 1) & 0xFFFFFFFFFFFFLL;
    }
    v21[8] = v16;
    v21[9] = v17;
    v21[10] = v18;
    v21[11] = v19;
    v21[4] = v12[4];
    v21[5] = v13;
    v21[6] = v14;
    v21[7] = v15;
    v21[0] = v12[0];
    v21[1] = v12[1];
    v21[2] = v12[2];
    v21[3] = v12[3];
    swift_bridgeObjectRetain();
    if (v9)
    {
      sub_1000353E4((uint64_t)v22);
    }
    else
    {
      sub_1000655C4(v21, &v11);
      swift_bridgeObjectRelease();
      sub_1000353E4((uint64_t)v22);
      return v11;
    }
  }
  return v8;
}

void sub_100091F3C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = String.count.getter();
  uint64_t v71 = a1;
  unint64_t v72 = a2;
  uint64_t v9 = String.count.getter();
  if (v8 < 1 || v9 < 1) {
    return;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v10 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v10 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if ((a4 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(a4) & 0xF;
  }
  else {
    uint64_t v11 = a3 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v68 = 4 * v11;
  unint64_t v69 = 4 * v10;
  uint64_t v70 = a3;
  unint64_t v12 = 0;
  if (!v11)
  {
    int v21 = 0;
LABEL_22:
    unint64_t v13 = 15;
    goto LABEL_25;
  }
  if (!v10)
  {
    int v21 = 1;
    goto LABEL_22;
  }
  unint64_t v13 = 15;
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = String.subscript.getter();
    uint64_t v16 = v15;
    if (v14 == String.subscript.getter() && v16 == v17)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_16;
    }
    char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0) {
      break;
    }
LABEL_16:
    a3 = v70;
    unint64_t v19 = String.index(after:)();
    unint64_t v20 = String.index(after:)();
    unint64_t v13 = v20;
    unint64_t v12 = v19 >> 14;
    if (v19 >> 14 >= v68)
    {
      int v21 = 0;
      goto LABEL_25;
    }
    if (v69 <= v20 >> 14)
    {
      int v21 = 1;
      goto LABEL_25;
    }
  }
  int v21 = 1;
  a3 = v70;
LABEL_25:
  uint64_t v22 = 7;
  if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0) {
    uint64_t v23 = 11;
  }
  else {
    uint64_t v23 = 7;
  }
  unint64_t v24 = v23 | (v11 << 16);
  if (((v72 >> 60) & ((v71 & 0x800000000000000) == 0)) != 0) {
    uint64_t v22 = 11;
  }
  unint64_t v25 = v22 | (v10 << 16);
  unint64_t v26 = v13 >> 14;
  if (v21 && v26 < v69)
  {
    uint64_t v65 = v23 | (v11 << 16);
    uint64_t v27 = String.index(before:)();
    unint64_t v67 = v25;
    unint64_t v28 = String.index(before:)();
    unint64_t v63 = v27;
    uint64_t v29 = String.subscript.getter();
    uint64_t v31 = v30;
    if (v29 == String.subscript.getter() && v31 == v32)
    {
      swift_bridgeObjectRelease_n();
      unint64_t v26 = v13 >> 14;
LABEL_36:
      unint64_t v24 = v63;
      if (v12 >= v63 >> 14)
      {
        unint64_t v25 = v28;
      }
      else
      {
        unint64_t v25 = v28;
        if (v26 < v28 >> 14)
        {
          while (1)
          {
            unint64_t v66 = v24;
            unint64_t v34 = String.index(before:)();
            unint64_t v35 = String.index(before:)();
            uint64_t v36 = String.subscript.getter();
            uint64_t v38 = v37;
            if (v36 == String.subscript.getter() && v38 == v39)
            {
              swift_bridgeObjectRelease_n();
              unint64_t v26 = v13 >> 14;
            }
            else
            {
              char v40 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              unint64_t v26 = v13 >> 14;
              unint64_t v24 = v66;
              if ((v40 & 1) == 0) {
                goto LABEL_47;
              }
            }
            if (v12 >= v34 >> 14) {
              break;
            }
            unint64_t v25 = v35;
            unint64_t v24 = v34;
            if (v26 >= v35 >> 14) {
              goto LABEL_47;
            }
          }
          unint64_t v25 = v35;
          unint64_t v24 = v34;
        }
      }
    }
    else
    {
      char v33 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v26 = v13 >> 14;
      unint64_t v24 = v65;
      unint64_t v25 = v67;
      if (v33) {
        goto LABEL_36;
      }
    }
  }
LABEL_47:
  if (v12 == v68 && v26 == v69) {
    return;
  }
  if (v12 >= v24 >> 14 || v26 >= v25 >> 14)
  {
    String.distance(from:to:)();
    return;
  }
  String.subscript.getter();
  String.subscript.getter();
  swift_bridgeObjectRetain();
  uint64_t v60 = Substring.distance(from:to:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v41 = Substring.distance(from:to:)();
  swift_bridgeObjectRelease();
  uint64_t v42 = v41 + 1;
  if (__OFADD__(v41, 1))
  {
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  if (v42 < 0)
  {
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  if (v41 == -1)
  {
    long long v43 = (char *)_swiftEmptyArrayStorage;
  }
  else
  {
    long long v43 = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)();
    *((void *)v43 + 2) = v42;
    bzero(v43 + 32, 8 * v41 + 8);
  }
  if (v41 < 0) {
    goto LABEL_100;
  }
  long long v44 = (char *)sub_100056E94(0, v41);
  if (v60 < 1 || !v41) {
    goto LABEL_101;
  }
  long long v45 = v44;
  uint64_t v46 = 1;
  uint64_t v62 = v41;
  while (1)
  {
    if (swift_isUniquelyReferenced_nonNull_native())
    {
      long long v47 = v43;
      if (!*((void *)v43 + 2)) {
        break;
      }
      goto LABEL_65;
    }
    long long v47 = sub_100063A74((uint64_t)v43);
    if (!*((void *)v47 + 2)) {
      break;
    }
LABEL_65:
    uint64_t v48 = 0;
    unint64_t v49 = 0;
    uint64_t v61 = v46;
    *((void *)v47 + 4) = v46;
    long long v64 = v47;
    do
    {
      long long v50 = v45;
      unint64_t v73 = v49 + 1;
      uint64_t v51 = Substring.subscript.getter();
      uint64_t v53 = v52;
      if (v51 == Substring.subscript.getter() && v53 == v54)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v55 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v55 & 1) == 0)
        {
          if (v73 >= *((void *)v50 + 2)) {
            goto LABEL_93;
          }
          long long v45 = v50;
          long long v47 = v64;
          unint64_t v57 = *((void *)v64 + 2);
          if (v49 >= v57) {
            goto LABEL_94;
          }
          uint64_t v58 = *(void *)&v45[v48 + 32];
          if (v58 >= *(void *)&v64[v48 + 32]) {
            uint64_t v58 = *(void *)&v64[v48 + 32];
          }
          if (v58 >= *(void *)&v45[v48 + 40]) {
            uint64_t v58 = *(void *)&v45[v48 + 40];
          }
          BOOL v59 = __OFADD__(v58, 1);
          uint64_t v56 = v58 + 1;
          if (v59) {
            goto LABEL_95;
          }
          if (v73 >= v57) {
            goto LABEL_96;
          }
          goto LABEL_66;
        }
      }
      if (v49 >= *((void *)v50 + 2))
      {
        __break(1u);
LABEL_92:
        __break(1u);
LABEL_93:
        __break(1u);
LABEL_94:
        __break(1u);
LABEL_95:
        __break(1u);
LABEL_96:
        __break(1u);
LABEL_97:
        __break(1u);
        goto LABEL_98;
      }
      long long v45 = v50;
      long long v47 = v64;
      if (v73 >= *((void *)v64 + 2)) {
        goto LABEL_92;
      }
      uint64_t v56 = *(void *)&v45[v48 + 32];
LABEL_66:
      *(void *)&v47[v48 + 40] = v56;
      Substring.index(after:)();
      ++v49;
      v48 += 8;
      uint64_t v41 = v62;
    }
    while (v62 != v49);
    Substring.index(after:)();
    if (v46 == v60) {
      goto LABEL_89;
    }
    long long v43 = v45;
    long long v45 = v47;
    ++v46;
    if (__OFADD__(v61, 1)) {
      goto LABEL_97;
    }
  }
  __break(1u);
LABEL_89:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v41 < *((void *)v47 + 2))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_102:
  __break(1u);
}

uint64_t sub_10009275C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = (char *)sub_100056D9C(v3);
  swift_bridgeObjectRelease();
  uint64_t v21 = (uint64_t)v4;
  swift_retain();
  sub_100093024((char **)&v21);
  swift_release();
  if (*(void *)(v21 + 16))
  {
    unint64_t v5 = *(void *)(v21 + 32);
    uint64_t v6 = *(void *)(v21 + 40);
    char v7 = *(unsigned char *)(v21 + 48);
    char v8 = *(unsigned char *)(v21 + 49);
    swift_release();
    if ((v8 & 1) == 0)
    {
      uint64_t v21 = 39;
      unint64_t v22 = 0xE100000000000000;
      if ((v5 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v5 < *(void *)(a2 + 16))
      {
        uint64_t v9 = a2 + 16 * v5;
        uint64_t v10 = *(void *)(v9 + 32);
        uint64_t v11 = *(void **)(v9 + 40);
        swift_bridgeObjectRetain();
        v12._uint64_t countAndFlagsBits = v10;
        v12._unint64_t object = v11;
        String.append(_:)(v12);
        swift_bridgeObjectRelease();
        v13._uint64_t countAndFlagsBits = 39;
        v13._unint64_t object = (void *)0xE100000000000000;
        String.append(_:)(v13);
        uint64_t v15 = (char *)v21;
        uint64_t v14 = (void *)v22;
        if (v7)
        {
LABEL_8:
          uint64_t v21 = 0x2067616C66;
          unint64_t v22 = 0xE500000000000000;
          v19._uint64_t countAndFlagsBits = (uint64_t)v15;
          v19._unint64_t object = v14;
          String.append(_:)(v19);
          swift_bridgeObjectRelease();
          return v21;
        }
        if (!__OFADD__(v6, 2))
        {
          String.index(_:offsetBy:)();
          uint64_t v21 = 0;
          unint64_t v22 = 0xE000000000000000;
          v16._uint64_t countAndFlagsBits = 39;
          v16._unint64_t object = (void *)0xE100000000000000;
          String.append(_:)(v16);
          String.subscript.getter();
          Character.write<A>(to:)();
          swift_bridgeObjectRelease();
          v17._uint64_t countAndFlagsBits = 0x206E692027;
          v17._unint64_t object = (void *)0xE500000000000000;
          String.append(_:)(v17);
          v18._uint64_t countAndFlagsBits = (uint64_t)v15;
          v18._unint64_t object = v14;
          String.append(_:)(v18);
          swift_bridgeObjectRelease();
          uint64_t v15 = (char *)v21;
          uint64_t v14 = (void *)v22;
          goto LABEL_8;
        }
        goto LABEL_14;
      }
      __break(1u);
LABEL_14:
      __break(1u);
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
  }
  else
  {
    swift_release();
  }
  return 0;
}

uint64_t sub_10009294C(uint64_t a1, uint64_t a2)
{
  if (!a1)
  {
    sub_1000641E0(a2, (uint64_t)&v9);
    if (sub_1000353CC((uint64_t)&v9) == 1) {
      return 0;
    }
    v21[8] = v17;
    v21[9] = v18;
    v21[10] = v19;
    v21[11] = v20;
    v21[4] = v13;
    v21[5] = v14;
    v21[6] = v15;
    v21[7] = v16;
    v21[0] = v9;
    v21[1] = v10;
    v21[2] = v11;
    v21[3] = v12;
    return sub_100092B40();
  }
  swift_errorRetain();
  sub_100003DD0(&qword_1000C58A0);
  sub_100003DD0(&qword_1000C5E78);
  if (!swift_dynamicCast()) {
    goto LABEL_10;
  }
  sub_10004B100(v21, (uint64_t)&v9);
  sub_100005090(&v9, *((uint64_t *)&v10 + 1));
  dispatch thunk of LocalizedError.errorDescription.getter();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  if (!v4)
  {
    sub_100005128((uint64_t)&v9);
LABEL_10:
    swift_errorRelease();
    *(void *)&v21[0] = a1;
    swift_errorRetain();
    swift_errorRetain();
    v8._uint64_t countAndFlagsBits = String.init<A>(describing:)();
    *(void *)&v21[0] = 8250;
    *((void *)&v21[0] + 1) = 0xE200000000000000;
    String.append(_:)(v8);
    swift_bridgeObjectRelease();
    swift_errorRelease();
    return *(void *)&v21[0];
  }
  sub_100005090(&v9, *((uint64_t *)&v10 + 1));
  uint64_t result = dispatch thunk of LocalizedError.errorDescription.getter();
  if (v6)
  {
    String.append(_:)(*(Swift::String *)&result);
    swift_bridgeObjectRelease();
    uint64_t v7 = 8250;
    sub_100005128((uint64_t)&v9);
    swift_errorRelease();
    return v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_100092B40()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v36 = v1;
  unint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return 0;
  }
  if (v2 > 5)
  {
    swift_bridgeObjectRetain();
    sub_100056F98(0, v2, 0);
    long long v12 = (void **)(v1 + 40);
    do
    {
      uint64_t v13 = (uint64_t)*(v12 - 1);
      long long v14 = *v12;
      swift_bridgeObjectRetain();
      v15._uint64_t countAndFlagsBits = v13;
      v15._unint64_t object = v14;
      String.append(_:)(v15);
      swift_bridgeObjectRelease();
      unint64_t v17 = _swiftEmptyArrayStorage[2];
      unint64_t v16 = _swiftEmptyArrayStorage[3];
      if (v17 >= v16 >> 1) {
        sub_100056F98((char *)(v16 > 1), v17 + 1, 1);
      }
      v12 += 2;
      _swiftEmptyArrayStorage[2] = v17 + 1;
      long long v18 = &_swiftEmptyArrayStorage[2 * v17];
      void v18[4] = 539828256;
      v18[5] = 0xE400000000000000;
      --v2;
    }
    while (v2);
    sub_10002BAD0((uint64_t)&v36);
    sub_100003DD0(&qword_1000C50C8);
    sub_100005178((unint64_t *)&qword_1000C50D0, &qword_1000C50C8);
    uint64_t v28 = BidirectionalCollection<>.joined(separator:)();
    uint64_t v30 = v29;
    swift_release();
    _StringGuts.grow(_:)(41);
    swift_bridgeObjectRelease();
    unint64_t v35 = 0xD000000000000027;
    v31._uint64_t countAndFlagsBits = v28;
    v31._unint64_t object = v30;
    String.append(_:)(v31);
    swift_bridgeObjectRelease();
    return v35;
  }
  swift_bridgeObjectRetain();
  sub_100056F98(0, v2, 0);
  uint64_t v3 = (void **)(v1 + 40);
  do
  {
    uint64_t v4 = (uint64_t)*(v3 - 1);
    unint64_t v5 = *v3;
    swift_bridgeObjectRetain();
    v6._uint64_t countAndFlagsBits = v4;
    v6._unint64_t object = v5;
    String.append(_:)(v6);
    v7._uint64_t countAndFlagsBits = 39;
    v7._unint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    unint64_t v9 = _swiftEmptyArrayStorage[2];
    unint64_t v8 = _swiftEmptyArrayStorage[3];
    if (v9 >= v8 >> 1) {
      sub_100056F98((char *)(v8 > 1), v9 + 1, 1);
    }
    v3 += 2;
    _swiftEmptyArrayStorage[2] = v9 + 1;
    long long v10 = &_swiftEmptyArrayStorage[2 * v9 + 4];
    *long long v10 = 39;
    v10[1] = 0xE100000000000000;
    --v2;
  }
  while (v2);
  sub_10002BAD0((uint64_t)&v36);
  if (_swiftEmptyArrayStorage[2] <= 2uLL)
  {
    sub_100003DD0(&qword_1000C50C8);
    sub_100005178((unint64_t *)&qword_1000C50D0, &qword_1000C50C8);
    uint64_t v19 = BidirectionalCollection<>.joined(separator:)();
    uint64_t v21 = v32;
    swift_release();
    goto LABEL_18;
  }
  sub_1000826C0(1, (uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRetain();
  sub_100003DD0(&qword_1000C5130);
  sub_100005178(&qword_1000C5138, &qword_1000C5130);
  uint64_t v19 = BidirectionalCollection<>.joined(separator:)();
  uint64_t v21 = v20;
  swift_unknownObjectRelease();
  uint64_t v22 = _swiftEmptyArrayStorage[2];
  if (v22)
  {
    uint64_t v23 = &_swiftEmptyArrayStorage[2 * v22 + 4];
    uint64_t v24 = *(v23 - 2);
    unint64_t v25 = (void *)*(v23 - 1);
    swift_bridgeObjectRetain();
    swift_release();
    v26._uint64_t countAndFlagsBits = v24;
    v26._unint64_t object = v25;
    String.append(_:)(v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v27._uint64_t countAndFlagsBits = 544370464;
    v27._unint64_t object = (void *)0xE400000000000000;
    String.append(_:)(v27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_18:
    _StringGuts.grow(_:)(27);
    swift_bridgeObjectRelease();
    unint64_t v35 = 0xD000000000000018;
    v33._uint64_t countAndFlagsBits = v19;
    v33._unint64_t object = v21;
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
    v34._uint64_t countAndFlagsBits = 46;
    v34._unint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v34);
    return v35;
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_100092FD4(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v1 = result;
    if (result)
    {
      uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(result + 16) = v1;
    }
    else
    {
      return (uint64_t)_swiftEmptyArrayStorage;
    }
  }
  return result;
}

uint64_t sub_100093024(char **a1)
{
  unint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_100089A5C((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_100093090(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_100093090(uint64_t *a1)
{
  unint64_t v2 = a1;
  Swift::Int v3 = a1[1];
  uint64_t result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_169;
    }
    if (v3) {
      return sub_1000937D8(0, v3, 1, v2);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_168;
  }
  uint64_t v6 = result;
  if (v3 <= 1)
  {
    unint64_t v8 = (char *)_swiftEmptyArrayStorage;
    uint64_t v100 = (char *)&_swiftEmptyArrayStorage[4];
    long long v96 = _swiftEmptyArrayStorage;
    if (v3 != 1)
    {
      unint64_t v11 = _swiftEmptyArrayStorage[2];
      if (v11 < 2) {
        goto LABEL_146;
      }
      goto LABEL_134;
    }
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(result + 16) = v7;
    long long v96 = (void *)result;
    uint64_t v100 = (char *)(result + 32);
  }
  Swift::Int v9 = 0;
  long long v95 = v2;
  uint64_t v10 = *v2;
  unint64_t v8 = (char *)_swiftEmptyArrayStorage;
  uint64_t v97 = v6;
  Swift::Int v98 = v3;
  while (2)
  {
    Swift::Int v12 = v9 + 1;
    if (v9 + 1 >= v3) {
      goto LABEL_53;
    }
    uint64_t v13 = v10 + 24 * v12;
    if (*(unsigned char *)(v13 + 17)) {
      goto LABEL_17;
    }
    uint64_t v16 = v10 + 24 * v9;
    if ((*(unsigned char *)(v16 + 17) & 1) == 0 && *(void *)v13 >= *(void *)v16)
    {
      if (*(void *)v13 == *(void *)v16)
      {
        if (*(unsigned char *)(v13 + 16))
        {
          if ((*(unsigned char *)(v16 + 16) & 1) == 0) {
            goto LABEL_21;
          }
        }
        else if ((*(unsigned char *)(v16 + 16) & 1) == 0 && *(void *)(v13 + 8) < *(void *)(v16 + 8))
        {
          goto LABEL_21;
        }
      }
LABEL_17:
      Swift::Int v14 = v9 + 2;
      if (v9 + 2 >= v3) {
        goto LABEL_52;
      }
      int v15 = 0;
      goto LABEL_23;
    }
LABEL_21:
    Swift::Int v14 = v9 + 2;
    if (v9 + 2 >= v3) {
      goto LABEL_46;
    }
    int v15 = 1;
LABEL_23:
    if (v3 <= v14 + 1) {
      Swift::Int v17 = v14 + 1;
    }
    else {
      Swift::Int v17 = v3;
    }
    long long v18 = (unsigned char *)(v10 + 17 + 24 * v14);
    do
    {
      if ((*v18 & 1) == 0)
      {
        uint64_t v19 = v10 + 24 * v12;
        if ((*(unsigned char *)(v19 + 17) & 1) != 0 || (uint64_t v20 = *(void *)(v18 - 17), v20 < *(void *)v19))
        {
LABEL_32:
          if ((v15 & 1) == 0) {
            goto LABEL_52;
          }
          goto LABEL_28;
        }
        if (v20 == *(void *)v19)
        {
          if (*(v18 - 1))
          {
            if ((*(unsigned char *)(v19 + 16) & 1) == 0) {
              goto LABEL_32;
            }
          }
          else if ((*(unsigned char *)(v19 + 16) & 1) == 0 && *(void *)(v18 - 9) < *(void *)(v19 + 8))
          {
            if (!v15) {
              goto LABEL_52;
            }
            goto LABEL_28;
          }
        }
      }
      if (v15)
      {
        Swift::Int v17 = v14;
        goto LABEL_45;
      }
LABEL_28:
      Swift::Int v12 = v14;
      v18 += 24;
      ++v14;
    }
    while (v14 < v3);
    if (!v15) {
      goto LABEL_63;
    }
LABEL_45:
    Swift::Int v14 = v17;
    if (v17 < v9) {
      goto LABEL_170;
    }
LABEL_46:
    if (v9 < v14)
    {
      uint64_t v21 = 24 * v14;
      uint64_t v22 = 24 * v9;
      Swift::Int v23 = v14;
      Swift::Int v24 = v9;
      do
      {
        if (v24 != --v23)
        {
          if (!v10) {
            goto LABEL_175;
          }
          uint64_t v25 = v10 + v22;
          uint64_t v26 = v10 + v21;
          char v27 = *(unsigned char *)(v10 + v22 + 16);
          char v28 = *(unsigned char *)(v10 + v22 + 17);
          long long v29 = *(_OWORD *)(v10 + v22);
          uint64_t v30 = *(void *)(v10 + v21 - 8);
          *(_OWORD *)uint64_t v25 = *(_OWORD *)(v10 + v21 - 24);
          *(void *)(v25 + 16) = v30;
          *(_OWORD *)(v26 - 24) = v29;
          *(unsigned char *)(v26 - 8) = v27;
          *(unsigned char *)(v26 - 7) = v28;
        }
        ++v24;
        v21 -= 24;
        v22 += 24;
      }
      while (v24 < v23);
    }
LABEL_52:
    Swift::Int v12 = v14;
LABEL_53:
    if (v12 >= v3) {
      goto LABEL_62;
    }
    if (__OFSUB__(v12, v9)) {
      goto LABEL_167;
    }
    if (v12 - v9 >= v6)
    {
LABEL_62:
      Swift::Int v17 = v12;
      goto LABEL_63;
    }
    if (__OFADD__(v9, v6)) {
      goto LABEL_171;
    }
    if (v9 + v6 >= v3) {
      Swift::Int v17 = v3;
    }
    else {
      Swift::Int v17 = v9 + v6;
    }
    if (v17 >= v9)
    {
      if (v12 == v17) {
        goto LABEL_62;
      }
      uint64_t v80 = v10 - 24 + 24 * v12;
      do
      {
        Swift::Int v81 = v9;
        uint64_t v82 = v80;
        do
        {
          if (*(unsigned char *)(v82 + 41)) {
            break;
          }
          uint64_t v83 = v82 + 24;
          uint64_t v84 = *(void *)(v82 + 24);
          uint64_t v85 = *(void *)(v82 + 32);
          char v86 = *(unsigned char *)(v82 + 40);
          if ((*(unsigned char *)(v82 + 17) & 1) == 0 && v84 >= *(void *)v82)
          {
            if (v84 != *(void *)v82) {
              break;
            }
            if (*(unsigned char *)(v82 + 40))
            {
              if (*(unsigned char *)(v82 + 16)) {
                break;
              }
            }
            else if ((*(unsigned char *)(v82 + 16) & 1) != 0 || v85 >= *(void *)(v82 + 8))
            {
              break;
            }
          }
          if (!v10) {
            goto LABEL_173;
          }
          long long v87 = *(_OWORD *)v82;
          uint64_t v88 = *(void *)(v82 + 16);
          *(void *)uint64_t v82 = v84;
          *(void *)(v82 + 8) = v85;
          *(unsigned char *)(v82 + 16) = v86;
          *(unsigned char *)(v82 + 17) = 0;
          v82 -= 24;
          *(_OWORD *)uint64_t v83 = v87;
          *(void *)(v83 + 16) = v88;
          ++v81;
        }
        while (v12 != v81);
        ++v12;
        v80 += 24;
      }
      while (v12 != v17);
LABEL_63:
      if (v17 < v9) {
        goto LABEL_162;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_100089938(0, *((void *)v8 + 2) + 1, 1, v8);
        unint64_t v8 = (char *)result;
      }
      unint64_t v32 = *((void *)v8 + 2);
      unint64_t v31 = *((void *)v8 + 3);
      unint64_t v11 = v32 + 1;
      Swift::Int v99 = v17;
      if (v32 >= v31 >> 1)
      {
        uint64_t result = (uint64_t)sub_100089938((char *)(v31 > 1), v32 + 1, 1, v8);
        unint64_t v8 = (char *)result;
      }
      *((void *)v8 + 2) = v11;
      Swift::String v33 = v8 + 32;
      Swift::String v34 = &v8[16 * v32 + 32];
      *(void *)Swift::String v34 = v9;
      *((void *)v34 + 1) = v99;
      if (v32)
      {
        while (2)
        {
          unint64_t v35 = v11 - 1;
          if (v11 >= 4)
          {
            char v40 = &v33[2 * v11];
            uint64_t v41 = *(v40 - 8);
            uint64_t v42 = *(v40 - 7);
            BOOL v46 = __OFSUB__(v42, v41);
            uint64_t v43 = v42 - v41;
            if (v46) {
              goto LABEL_151;
            }
            uint64_t v45 = *(v40 - 6);
            uint64_t v44 = *(v40 - 5);
            BOOL v46 = __OFSUB__(v44, v45);
            uint64_t v38 = v44 - v45;
            char v39 = v46;
            if (v46) {
              goto LABEL_152;
            }
            unint64_t v47 = v11 - 2;
            uint64_t v48 = &v33[2 * v11 - 4];
            uint64_t v50 = *v48;
            uint64_t v49 = v48[1];
            BOOL v46 = __OFSUB__(v49, v50);
            uint64_t v51 = v49 - v50;
            if (v46) {
              goto LABEL_153;
            }
            BOOL v46 = __OFADD__(v38, v51);
            uint64_t v52 = v38 + v51;
            if (v46) {
              goto LABEL_155;
            }
            if (v52 >= v43)
            {
              uint64_t v70 = &v33[2 * v35];
              uint64_t v72 = *v70;
              uint64_t v71 = v70[1];
              BOOL v46 = __OFSUB__(v71, v72);
              uint64_t v73 = v71 - v72;
              if (v46) {
                goto LABEL_161;
              }
              BOOL v63 = v38 < v73;
            }
            else
            {
LABEL_82:
              if (v39) {
                goto LABEL_154;
              }
              unint64_t v47 = v11 - 2;
              uint64_t v53 = &v33[2 * v11 - 4];
              uint64_t v55 = *v53;
              uint64_t v54 = v53[1];
              BOOL v56 = __OFSUB__(v54, v55);
              uint64_t v57 = v54 - v55;
              char v58 = v56;
              if (v56) {
                goto LABEL_156;
              }
              BOOL v59 = &v33[2 * v35];
              uint64_t v61 = *v59;
              uint64_t v60 = v59[1];
              BOOL v46 = __OFSUB__(v60, v61);
              uint64_t v62 = v60 - v61;
              if (v46) {
                goto LABEL_158;
              }
              if (__OFADD__(v57, v62)) {
                goto LABEL_160;
              }
              if (v57 + v62 < v38) {
                goto LABEL_94;
              }
              BOOL v63 = v38 < v62;
            }
            if (v63) {
              unint64_t v35 = v47;
            }
          }
          else
          {
            if (v11 == 3)
            {
              uint64_t v37 = *((void *)v8 + 4);
              uint64_t v36 = *((void *)v8 + 5);
              BOOL v46 = __OFSUB__(v36, v37);
              uint64_t v38 = v36 - v37;
              char v39 = v46;
              goto LABEL_82;
            }
            uint64_t v64 = *((void *)v8 + 4);
            uint64_t v65 = *((void *)v8 + 5);
            BOOL v46 = __OFSUB__(v65, v64);
            uint64_t v57 = v65 - v64;
            char v58 = v46;
LABEL_94:
            if (v58) {
              goto LABEL_157;
            }
            unint64_t v66 = &v33[2 * v35];
            uint64_t v68 = *v66;
            uint64_t v67 = v66[1];
            BOOL v46 = __OFSUB__(v67, v68);
            uint64_t v69 = v67 - v68;
            if (v46) {
              goto LABEL_159;
            }
            if (v69 < v57) {
              goto LABEL_14;
            }
          }
          unint64_t v74 = v35 - 1;
          if (v35 - 1 >= v11)
          {
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
LABEL_158:
            __break(1u);
LABEL_159:
            __break(1u);
LABEL_160:
            __break(1u);
LABEL_161:
            __break(1u);
LABEL_162:
            __break(1u);
LABEL_163:
            __break(1u);
LABEL_164:
            __break(1u);
LABEL_165:
            __break(1u);
LABEL_166:
            __break(1u);
LABEL_167:
            __break(1u);
LABEL_168:
            __break(1u);
LABEL_169:
            __break(1u);
LABEL_170:
            __break(1u);
LABEL_171:
            __break(1u);
            goto LABEL_172;
          }
          if (!v10) {
            goto LABEL_174;
          }
          long long v75 = &v33[2 * v74];
          uint64_t v76 = *v75;
          uint64_t v77 = &v33[2 * v35];
          uint64_t v78 = v77[1];
          uint64_t result = sub_100093898((char *)(v10 + 24 * *v75), (char *)(v10 + 24 * *v77), v10 + 24 * v78, v100);
          if (v1) {
            goto LABEL_146;
          }
          if (v78 < v76) {
            goto LABEL_148;
          }
          if (v35 > *((void *)v8 + 2)) {
            goto LABEL_149;
          }
          *long long v75 = v76;
          v33[2 * v74 + 1] = v78;
          unint64_t v79 = *((void *)v8 + 2);
          if (v35 >= v79) {
            goto LABEL_150;
          }
          unint64_t v11 = v79 - 1;
          uint64_t result = (uint64_t)memmove(&v33[2 * v35], v77 + 2, 16 * (v79 - 1 - v35));
          *((void *)v8 + 2) = v79 - 1;
          if (v79 <= 2) {
            goto LABEL_14;
          }
          continue;
        }
      }
      unint64_t v11 = 1;
LABEL_14:
      Swift::Int v3 = v98;
      Swift::Int v9 = v99;
      uint64_t v6 = v97;
      if (v99 >= v98)
      {
        unint64_t v2 = v95;
        if (v11 < 2)
        {
LABEL_146:
          swift_bridgeObjectRelease();
          v96[2] = 0;
          return swift_bridgeObjectRelease();
        }
LABEL_134:
        uint64_t v89 = *v2;
        while (1)
        {
          unint64_t v90 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_163;
          }
          if (!v89) {
            goto LABEL_176;
          }
          uint64_t v91 = *(void *)&v8[16 * v90 + 32];
          uint64_t v92 = *(void *)&v8[16 * v11 + 24];
          uint64_t result = sub_100093898((char *)(v89 + 24 * v91), (char *)(v89 + 24 * *(void *)&v8[16 * v11 + 16]), v89 + 24 * v92, v100);
          if (v1) {
            goto LABEL_146;
          }
          if (v92 < v91) {
            goto LABEL_164;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_100089A34((uint64_t)v8);
            unint64_t v8 = (char *)result;
          }
          if (v90 >= *((void *)v8 + 2)) {
            goto LABEL_165;
          }
          long long v93 = &v8[16 * v90 + 32];
          *(void *)long long v93 = v91;
          *((void *)v93 + 1) = v92;
          unint64_t v94 = *((void *)v8 + 2);
          if (v11 > v94) {
            goto LABEL_166;
          }
          uint64_t result = (uint64_t)memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v94 - v11));
          *((void *)v8 + 2) = v94 - 1;
          unint64_t v11 = v94 - 1;
          if (v94 <= 2) {
            goto LABEL_146;
          }
        }
      }
      continue;
    }
    break;
  }
LABEL_172:
  __break(1u);
LABEL_173:
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  __break(1u);
  return result;
}

uint64_t sub_1000937D8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 24 * a3 - 24;
LABEL_5:
    uint64_t v6 = result;
    uint64_t v7 = v5;
    while (1)
    {
      if (*(unsigned char *)(v7 + 41))
      {
LABEL_4:
        ++a3;
        v5 += 24;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v8 = v7 + 24;
      uint64_t v9 = *(void *)(v7 + 24);
      uint64_t v10 = *(void *)(v7 + 32);
      char v11 = *(unsigned char *)(v7 + 40);
      if ((*(unsigned char *)(v7 + 17) & 1) == 0 && v9 >= *(void *)v7)
      {
        if (v9 != *(void *)v7) {
          goto LABEL_4;
        }
        if (*(unsigned char *)(v7 + 40))
        {
          if (*(unsigned char *)(v7 + 16)) {
            goto LABEL_4;
          }
        }
        else if ((*(unsigned char *)(v7 + 16) & 1) != 0 || v10 >= *(void *)(v7 + 8))
        {
          goto LABEL_4;
        }
      }
      if (!v4) {
        break;
      }
      long long v12 = *(_OWORD *)v7;
      uint64_t v13 = *(void *)(v7 + 16);
      *(void *)uint64_t v7 = v9;
      *(void *)(v7 + 8) = v10;
      *(unsigned char *)(v7 + 16) = v11;
      *(unsigned char *)(v7 + 17) = 0;
      v7 -= 24;
      *(_OWORD *)uint64_t v8 = v12;
      *(void *)(v8 + 16) = v13;
      if (a3 == ++v6) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100093898(char *__src, char *__dst, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __dst;
  uint64_t v7 = __src;
  int64_t v8 = __dst - __src;
  int64_t v9 = (__dst - __src) / 24;
  uint64_t v10 = a3 - (void)__dst;
  uint64_t v11 = (uint64_t)(a3 - (void)__dst) / 24;
  if (v9 >= v11)
  {
    uint64_t v17 = 24 * v11;
    if (a4 != __dst || &__dst[v17] <= a4) {
      memmove(a4, __dst, 24 * v11);
    }
    uint64_t v13 = &v4[v17];
    if (v7 >= v6 || v10 < 24) {
      goto LABEL_56;
    }
    unint64_t v18 = a3 - 24;
    while (1)
    {
      uint64_t v19 = (char *)(v18 + 24);
      uint64_t v20 = *((void *)v13 - 3);
      if (*(v13 - 7)) {
        break;
      }
      uint64_t v21 = v6 - 24;
      uint64_t v23 = *((void *)v6 - 3);
      if ((*(v6 - 7) & 1) == 0 && v20 >= v23)
      {
        if (v20 != v23) {
          break;
        }
        if (*(v13 - 8))
        {
          if (*(v6 - 8)) {
            break;
          }
        }
        else if ((*(v6 - 8) & 1) != 0 || *((void *)v13 - 2) >= *((void *)v6 - 2))
        {
          break;
        }
      }
      if (v19 != v6)
      {
        v6 -= 24;
        goto LABEL_49;
      }
      BOOL v22 = v18 >= (unint64_t)v6;
      v6 -= 24;
      if (v22) {
        goto LABEL_49;
      }
LABEL_50:
      if (v6 > v7)
      {
        v18 -= 24;
        if (v13 > v4) {
          continue;
        }
      }
      goto LABEL_56;
    }
    uint64_t v21 = v13 - 24;
    if (v19 != v13)
    {
      v13 -= 24;
LABEL_49:
      long long v24 = *(_OWORD *)v21;
      *(void *)(v18 + 16) = *((void *)v21 + 2);
      *(_OWORD *)unint64_t v18 = v24;
      goto LABEL_50;
    }
    BOOL v22 = v18 >= (unint64_t)v13;
    v13 -= 24;
    if (v22) {
      goto LABEL_49;
    }
    goto LABEL_50;
  }
  size_t v12 = 24 * v9;
  if (a4 != __src || &__src[v12] <= a4) {
    memmove(a4, __src, v12);
  }
  uint64_t v13 = &v4[v12];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    while ((v6[17] & 1) == 0)
    {
      if ((v4[17] & 1) == 0 && *(void *)v6 >= *(void *)v4)
      {
        if (*(void *)v6 != *(void *)v4) {
          break;
        }
        if (v6[16])
        {
          if (v4[16]) {
            break;
          }
        }
        else if ((v4[16] & 1) != 0 || *((void *)v6 + 1) >= *((void *)v4 + 1))
        {
          break;
        }
      }
      Swift::Int v14 = v6;
      BOOL v15 = v7 == v6;
      v6 += 24;
      if (!v15) {
        goto LABEL_9;
      }
LABEL_10:
      v7 += 24;
      if (v4 >= v13 || (unint64_t)v6 >= a3) {
        goto LABEL_55;
      }
    }
    Swift::Int v14 = v4;
    BOOL v15 = v7 == v4;
    v4 += 24;
    if (v15) {
      goto LABEL_10;
    }
LABEL_9:
    long long v16 = *(_OWORD *)v14;
    *((void *)v7 + 2) = *((void *)v14 + 2);
    *(_OWORD *)uint64_t v7 = v16;
    goto LABEL_10;
  }
LABEL_55:
  uint64_t v6 = v7;
LABEL_56:
  uint64_t v25 = (unsigned __int128)((v13 - v4) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
  size_t v26 = 24 * ((v25 >> 2) + ((unint64_t)v25 >> 63));
  if (v6 != v4 || v6 >= &v4[v26]) {
    memmove(v6, v4, v26);
  }
  return 1;
}

uint64_t sub_100093B50(uint64_t result)
{
  unint64_t v1 = 0;
  unint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = result + 48;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  unint64_t v5 = v4 + 1;
  uint64_t v6 = (unsigned __int8 *)(v3 + 24 * v1);
  while (1)
  {
    if (v2 == v1) {
      return (uint64_t)_swiftEmptyArrayStorage;
    }
    if (v5 == ++v1) {
      break;
    }
    uint64_t v7 = v6 + 24;
    unsigned __int8 v8 = *v6;
    int v9 = *v6 & 0xC0;
    v6 += 24;
    if (v9 != 64)
    {
      uint64_t v15 = v3;
      uint64_t v10 = *((void *)v7 - 5);
      uint64_t v11 = *((void *)v7 - 4);
      sub_1000319B8(v10, v11, v8);
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        uint64_t result = (uint64_t)sub_100057098(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1) {
        uint64_t result = (uint64_t)sub_100057098((char *)(v12 > 1), v13 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v13 + 1;
      Swift::Int v14 = &_swiftEmptyArrayStorage[3 * v13];
      v14[4] = v10;
      void v14[5] = v11;
      *((unsigned char *)v14 + 48) = v8;
      uint64_t v3 = v15;
      goto LABEL_2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100093C88(uint64_t result, uint64_t a2, void *a3, unsigned __int8 a4, uint64_t a5)
{
  v29._unint64_t object = a3;
  v29._uint64_t countAndFlagsBits = a2;
  unint64_t v5 = *(void *)(result + 16);
  if (v5)
  {
    unint64_t v6 = 0;
    int v7 = a4 >> 6;
    uint64_t v8 = result + 48;
    uint64_t v28 = -(uint64_t)v5;
    uint64_t v26 = result + 48;
    unint64_t v27 = *(void *)(result + 16);
    do
    {
      if (v6 <= v5) {
        unint64_t v9 = v5;
      }
      else {
        unint64_t v9 = v6;
      }
      uint64_t v31 = -(uint64_t)v9;
      for (uint64_t i = (unsigned __int8 *)(v8 + 24 * v6++); ; i += 24)
      {
        if (v31 + v6 == 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v12 = *((void *)i - 2);
        uint64_t v11 = (void *)*((void *)i - 1);
        unsigned int v13 = *i;
        if (v13 >> 6)
        {
          if (v13 >> 6 == 1)
          {
            swift_bridgeObjectRetain();
            v14._uint64_t countAndFlagsBits = 45;
            v14._unint64_t object = (void *)0xE100000000000000;
            String.append(_:)(v14);
            Character.write<A>(to:)();
            uint64_t v15 = 0;
            unint64_t v16 = 0xE000000000000000;
            if (!v7) {
              goto LABEL_11;
            }
            goto LABEL_15;
          }
          uint64_t v33 = 45;
          unint64_t v18 = 0xE100000000000000;
        }
        else
        {
          uint64_t v33 = 11565;
          unint64_t v18 = 0xE200000000000000;
        }
        unint64_t v34 = v18;
        swift_bridgeObjectRetain();
        v19._uint64_t countAndFlagsBits = v12;
        v19._unint64_t object = v11;
        String.append(_:)(v19);
        uint64_t v15 = v33;
        unint64_t v16 = v34;
        if (!v7)
        {
LABEL_11:
          uint64_t v32 = 11565;
          unint64_t v17 = 0xE200000000000000;
          goto LABEL_18;
        }
LABEL_15:
        if (v7 == 1)
        {
          uint64_t v32 = 0;
          unint64_t v35 = 0xE000000000000000;
          v20._uint64_t countAndFlagsBits = 45;
          v20._unint64_t object = (void *)0xE100000000000000;
          String.append(_:)(v20);
          Character.write<A>(to:)();
          goto LABEL_19;
        }
        uint64_t v32 = 45;
        unint64_t v17 = 0xE100000000000000;
LABEL_18:
        unint64_t v35 = v17;
        String.append(_:)(v29);
LABEL_19:
        sub_100091F3C(v32, v35, v15, v16);
        uint64_t v22 = v21;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v22 < a5) {
          break;
        }
        uint64_t result = sub_10002ECB8(v12, (uint64_t)v11, v13);
        ++v6;
        if (v28 + v6 == 1) {
          return (uint64_t)_swiftEmptyArrayStorage;
        }
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        uint64_t result = (uint64_t)sub_100057098(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v24 = _swiftEmptyArrayStorage[2];
      unint64_t v23 = _swiftEmptyArrayStorage[3];
      if (v24 >= v23 >> 1) {
        uint64_t result = (uint64_t)sub_100057098((char *)(v23 > 1), v24 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v24 + 1;
      uint64_t v25 = &_swiftEmptyArrayStorage[3 * v24];
      void v25[4] = v12;
      v25[5] = v11;
      *((unsigned char *)v25 + 48) = v13;
      uint64_t v8 = v26;
      unint64_t v5 = v27;
    }
    while (v28 + v6);
  }
  return (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_100093F40(uint64_t a1, void *a2)
{
  _StringGuts.grow(_:)(111);
  v4._unint64_t object = (void *)0x80000001000A9BC0;
  v4._uint64_t countAndFlagsBits = 0xD000000000000027;
  String.append(_:)(v4);
  v5._uint64_t countAndFlagsBits = a1;
  v5._unint64_t object = a2;
  String.append(_:)(v5);
  v6._uint64_t countAndFlagsBits = 0xD000000000000044;
  v6._unint64_t object = (void *)0x80000001000A9BF0;
  String.append(_:)(v6);
  uint64_t v7 = 3;
  sub_100056F98(0, 3, 0);
  uint64_t v8 = (uint64_t *)&unk_1000BC1E8;
  do
  {
    uint64_t v10 = *(v8 - 1);
    uint64_t v9 = *v8;
    unint64_t v12 = _swiftEmptyArrayStorage[2];
    unint64_t v11 = _swiftEmptyArrayStorage[3];
    swift_bridgeObjectRetain();
    if (v12 >= v11 >> 1) {
      sub_100056F98((char *)(v11 > 1), v12 + 1, 1);
    }
    v8 += 2;
    _swiftEmptyArrayStorage[2] = v12 + 1;
    unsigned int v13 = &_swiftEmptyArrayStorage[2 * v12];
    _OWORD v13[4] = v10;
    v13[5] = v9;
    --v7;
  }
  while (v7);
  sub_100003DD0(&qword_1000C50C8);
  sub_100005178((unint64_t *)&qword_1000C50D0, &qword_1000C50C8);
  uint64_t v14 = BidirectionalCollection<>.joined(separator:)();
  unint64_t v16 = v15;
  swift_bridgeObjectRelease();
  v17._uint64_t countAndFlagsBits = v14;
  v17._unint64_t object = v16;
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100094108()
{
  _StringGuts.grow(_:)(103);
  v0._unint64_t object = (void *)0x80000001000A9C40;
  v0._uint64_t countAndFlagsBits = 0xD000000000000065;
  String.append(_:)(v0);
  uint64_t v1 = 3;
  sub_100056F98(0, 3, 0);
  unint64_t v2 = (uint64_t *)&unk_1000BC1E8;
  do
  {
    uint64_t v4 = *(v2 - 1);
    uint64_t v3 = *v2;
    unint64_t v6 = _swiftEmptyArrayStorage[2];
    unint64_t v5 = _swiftEmptyArrayStorage[3];
    swift_bridgeObjectRetain();
    if (v6 >= v5 >> 1) {
      sub_100056F98((char *)(v5 > 1), v6 + 1, 1);
    }
    v2 += 2;
    _swiftEmptyArrayStorage[2] = v6 + 1;
    uint64_t v7 = &_swiftEmptyArrayStorage[2 * v6];
    v7[4] = v4;
    v7[5] = v3;
    --v1;
  }
  while (v1);
  sub_100003DD0(&qword_1000C50C8);
  sub_100005178((unint64_t *)&qword_1000C50D0, &qword_1000C50C8);
  uint64_t v8 = BidirectionalCollection<>.joined(separator:)();
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  v11._uint64_t countAndFlagsBits = v8;
  v11._unint64_t object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100094294(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 a4)
{
  unint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return 0;
  }
  uint64_t countAndFlagsBits = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  unsigned __int8 v9 = *(unsigned char *)(a1 + 48);
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000319B8(countAndFlagsBits, (uint64_t)v7, v9);
  if (v4 == 1) {
    goto LABEL_37;
  }
  int v11 = a4 >> 6;
  uint64_t v12 = a1 + 48;
  uint64_t v38 = -(uint64_t)v4;
  unint64_t v13 = 1;
  uint64_t v35 = a1 + 48;
  unint64_t v36 = v4;
  while (2)
  {
    v41._uint64_t countAndFlagsBits = countAndFlagsBits;
    v41._unint64_t object = v7;
    unsigned __int8 v37 = v9;
    int v39 = v9 >> 6;
    if (v13 <= v4) {
      unint64_t v14 = v4;
    }
    else {
      unint64_t v14 = v13;
    }
    uint64_t v40 = -(uint64_t)v14;
    uint64_t v15 = (unsigned __int8 *)(v12 + 24 * v13++);
    while (1)
    {
      if (v40 + v13 == 1)
      {
        __break(1u);
        return result;
      }
      uint64_t countAndFlagsBits = *((void *)v15 - 2);
      uint64_t v7 = (void *)*((void *)v15 - 1);
      unsigned int v42 = *v15;
      if (v42 >> 6)
      {
        if (v42 >> 6 == 1)
        {
          swift_bridgeObjectRetain();
          v16._uint64_t countAndFlagsBits = 45;
          v16._unint64_t object = (void *)0xE100000000000000;
          String.append(_:)(v16);
          Character.write<A>(to:)();
          uint64_t v17 = 0;
          unint64_t v18 = 0xE000000000000000;
          if (!v11) {
            goto LABEL_12;
          }
          goto LABEL_16;
        }
        uint64_t v45 = 45;
        unint64_t v20 = 0xE100000000000000;
      }
      else
      {
        uint64_t v45 = 11565;
        unint64_t v20 = 0xE200000000000000;
      }
      unint64_t v48 = v20;
      swift_bridgeObjectRetain();
      v21._uint64_t countAndFlagsBits = countAndFlagsBits;
      v21._unint64_t object = v7;
      String.append(_:)(v21);
      uint64_t v17 = v45;
      unint64_t v18 = v48;
      if (!v11)
      {
LABEL_12:
        uint64_t v44 = 11565;
        unint64_t v19 = 0xE200000000000000;
        goto LABEL_19;
      }
LABEL_16:
      if (v11 == 1)
      {
        uint64_t v44 = 0;
        unint64_t v49 = 0xE000000000000000;
        v22._uint64_t countAndFlagsBits = 45;
        v22._unint64_t object = (void *)0xE100000000000000;
        String.append(_:)(v22);
        Character.write<A>(to:)();
        goto LABEL_20;
      }
      uint64_t v44 = 45;
      unint64_t v19 = 0xE100000000000000;
LABEL_19:
      unint64_t v49 = v19;
      v23._uint64_t countAndFlagsBits = a2;
      v23._unint64_t object = a3;
      String.append(_:)(v23);
LABEL_20:
      sub_100091F3C(v44, v49, v17, v18);
      uint64_t v25 = v24;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v39)
      {
        if (v39 == 1)
        {
          v26._uint64_t countAndFlagsBits = 45;
          v26._unint64_t object = (void *)0xE100000000000000;
          String.append(_:)(v26);
          Character.write<A>(to:)();
          uint64_t v27 = 0;
          unint64_t v28 = 0xE000000000000000;
          if (!v11) {
            goto LABEL_23;
          }
          goto LABEL_27;
        }
        uint64_t v47 = 45;
        unint64_t v30 = 0xE100000000000000;
      }
      else
      {
        uint64_t v47 = 11565;
        unint64_t v30 = 0xE200000000000000;
      }
      unint64_t v50 = v30;
      String.append(_:)(v41);
      uint64_t v27 = v47;
      unint64_t v28 = v50;
      if (!v11)
      {
LABEL_23:
        uint64_t v46 = 11565;
        unint64_t v29 = 0xE200000000000000;
        goto LABEL_30;
      }
LABEL_27:
      if (v11 == 1)
      {
        uint64_t v46 = 0;
        unint64_t v51 = 0xE000000000000000;
        v31._uint64_t countAndFlagsBits = 45;
        v31._unint64_t object = (void *)0xE100000000000000;
        String.append(_:)(v31);
        Character.write<A>(to:)();
        goto LABEL_31;
      }
      uint64_t v46 = 45;
      unint64_t v29 = 0xE100000000000000;
LABEL_30:
      unint64_t v51 = v29;
      v32._uint64_t countAndFlagsBits = a2;
      v32._unint64_t object = a3;
      String.append(_:)(v32);
LABEL_31:
      sub_100091F3C(v46, v51, v27, v28);
      uint64_t v34 = v33;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v25 < v34) {
        break;
      }
      uint64_t result = sub_10002ECB8(countAndFlagsBits, (uint64_t)v7, v42);
      ++v13;
      v15 += 24;
      if (v38 + v13 == 1)
      {
        uint64_t countAndFlagsBits = v41._countAndFlagsBits;
        goto LABEL_37;
      }
    }
    uint64_t result = sub_10002ECB8(v41._countAndFlagsBits, (uint64_t)v41._object, v37);
    uint64_t v12 = v35;
    unint64_t v4 = v36;
    unsigned __int8 v9 = v42;
    if (v38 + v13) {
      continue;
    }
    break;
  }
LABEL_37:
  swift_bridgeObjectRelease();
  return countAndFlagsBits;
}

char *sub_100094664(uint64_t a1, void *a2, unsigned __int8 a3)
{
  unsigned __int8 v4 = a3;
  unint64_t v5 = a2;
  uint64_t v6 = a1;
  if ((a3 & 0xC0) == 0x40)
  {
    _StringGuts.grow(_:)(19);
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  uint64_t v7 = *v3;
  uint64_t v8 = v3[1];
  uint64_t v43 = v7;
  uint64_t v9 = *(void *)(v7 + 16);
  if (!v9)
  {
    int v11 = (char *)_swiftEmptyArrayStorage;
LABEL_25:
    sub_1000319B8(v6, (uint64_t)v5, v4);
    uint64_t v22 = sub_100093C88((uint64_t)v11, v6, v5, v4, 4);
    sub_10002ECB8(v6, (uint64_t)v5, v4);
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_100093B50(v22);
    swift_bridgeObjectRelease();
    sub_1000319B8(v6, (uint64_t)v5, v4);
    uint64_t v24 = sub_100094294(v23, v6, v5, v4);
    Swift::String v26 = v25;
    unsigned __int8 v28 = v27;
    unsigned int v29 = v27;
    sub_10002ECB8(v6, (uint64_t)v5, v4);
    swift_bridgeObjectRelease();
    if (v29 <= 0xFD)
    {
      _StringGuts.grow(_:)(39);
      swift_bridgeObjectRelease();
      v45._uint64_t countAndFlagsBits = v6;
      v45._unint64_t object = v5;
      v33._uint64_t countAndFlagsBits = sub_100076D6C(v45, v4);
      String.append(_:)(v33);
      swift_bridgeObjectRelease();
      v34._uint64_t countAndFlagsBits = 0xD000000000000011;
      v34._unint64_t object = (void *)0x80000001000A9CD0;
      String.append(_:)(v34);
      v46._uint64_t countAndFlagsBits = v24;
      v46._unint64_t object = v26;
      uint64_t v35 = sub_100076D6C(v46, v28);
      unsigned __int8 v37 = v36;
      sub_10002ECD0(v24, (uint64_t)v26, v28);
      v38._uint64_t countAndFlagsBits = v35;
      v38._unint64_t object = v37;
      String.append(_:)(v38);
      swift_bridgeObjectRelease();
      uint64_t v31 = 16167;
      unint64_t v32 = 0xE200000000000000;
      goto LABEL_29;
    }
    _StringGuts.grow(_:)(19);
    swift_bridgeObjectRelease();
LABEL_27:
    v44._uint64_t countAndFlagsBits = v6;
    v44._unint64_t object = v5;
    v30._uint64_t countAndFlagsBits = sub_100076D6C(v44, v4);
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    uint64_t v31 = 39;
    unint64_t v32 = 0xE100000000000000;
LABEL_29:
    String.append(_:)(*(Swift::String *)&v31);
    return (char *)0xD000000000000010;
  }
  uint64_t v42 = v8;
  uint64_t v10 = (unint64_t *)(v7 + 32);
  sub_10002B9FC((uint64_t)&v43);
  sub_10002B9FC((uint64_t)&v42);
  sub_10002B9FC((uint64_t)&v43);
  sub_10002B9FC((uint64_t)&v42);
  int v11 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    unint64_t v13 = *v10;
    v10 += 24;
    uint64_t result = (char *)v13;
    unint64_t v14 = v13 >= 2 ? result : (char *)_swiftEmptyArrayStorage;
    uint64_t v15 = *((void *)v14 + 2);
    int64_t v16 = *((void *)v11 + 2);
    int64_t v17 = v16 + v15;
    if (__OFADD__(v16, v15)) {
      break;
    }
    sub_10002EA30((unint64_t)result);
    uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (result && v17 <= *((void *)v11 + 3) >> 1)
    {
      if (*((void *)v14 + 2)) {
        goto LABEL_19;
      }
    }
    else
    {
      if (v16 <= v17) {
        int64_t v18 = v16 + v15;
      }
      else {
        int64_t v18 = v16;
      }
      uint64_t result = sub_10005FB94(result, v18, 1, v11);
      int v11 = result;
      if (*((void *)v14 + 2))
      {
LABEL_19:
        if ((*((void *)v11 + 3) >> 1) - *((void *)v11 + 2) < v15) {
          goto LABEL_32;
        }
        uint64_t result = (char *)swift_arrayInitWithCopy();
        if (v15)
        {
          uint64_t v19 = *((void *)v11 + 2);
          BOOL v20 = __OFADD__(v19, v15);
          uint64_t v21 = v19 + v15;
          if (v20) {
            goto LABEL_33;
          }
          *((void *)v11 + 2) = v21;
        }
        goto LABEL_6;
      }
    }
    if (v15) {
      goto LABEL_31;
    }
LABEL_6:
    swift_bridgeObjectRelease();
    if (!--v9)
    {
      sub_10002BAD0((uint64_t)&v43);
      sub_10002BAD0((uint64_t)&v42);
      sub_10002BAD0((uint64_t)&v43);
      sub_10002BAD0((uint64_t)&v42);
      unsigned __int8 v4 = a3;
      uint64_t v6 = a1;
      unint64_t v5 = a2;
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

unint64_t sub_100094A30(uint64_t a1, void *a2, int a3)
{
  unsigned __int8 v3 = a3;
  unint64_t v6 = sub_100091DCC(a1, (uint64_t)a2, a3);
  if (v7)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v7;
    _StringGuts.grow(_:)(27);
    swift_bridgeObjectRelease();
    v17._uint64_t countAndFlagsBits = a1;
    v17._unint64_t object = a2;
    v10._uint64_t countAndFlagsBits = sub_100076D6C(v17, v3);
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    v11._uint64_t countAndFlagsBits = 15392;
    v11._unint64_t object = (void *)0xE200000000000000;
    String.append(_:)(v11);
    v12._uint64_t countAndFlagsBits = v8;
    v12._unint64_t object = v9;
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
    uint64_t v13 = 10046;
    unint64_t v14 = 0xE200000000000000;
  }
  else
  {
    _StringGuts.grow(_:)(22);
    swift_bridgeObjectRelease();
    v18._uint64_t countAndFlagsBits = a1;
    v18._unint64_t object = a2;
    v15._uint64_t countAndFlagsBits = sub_100076D6C(v18, v3);
    String.append(_:)(v15);
    swift_bridgeObjectRelease();
    uint64_t v13 = 39;
    unint64_t v14 = 0xE100000000000000;
  }
  String.append(_:)(*(Swift::String *)&v13);
  return 0xD000000000000013;
}

unint64_t sub_100094B84(void *a1)
{
  int64_t v1 = a1[2];
  if (v1)
  {
    if (v1 == 1)
    {
      _StringGuts.grow(_:)(24);
      swift_bridgeObjectRelease();
      unint64_t v21 = 0xD000000000000015;
      uint64_t v3 = a1[5];
      unsigned __int8 v4 = (void *)a1[6];
      swift_bridgeObjectRetain();
      v5._uint64_t countAndFlagsBits = v3;
      v5._unint64_t object = v4;
      String.append(_:)(v5);
    }
    else
    {
      sub_100056F98(0, v1, 0);
      unint64_t v6 = a1 + 6;
      int64_t v7 = v1;
      do
      {
        uint64_t v9 = *(v6 - 1);
        uint64_t v8 = *v6;
        unint64_t v11 = _swiftEmptyArrayStorage[2];
        unint64_t v10 = _swiftEmptyArrayStorage[3];
        swift_bridgeObjectRetain();
        if (v11 >= v10 >> 1) {
          sub_100056F98((char *)(v10 > 1), v11 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v11 + 1;
        Swift::String v12 = &_swiftEmptyArrayStorage[2 * v11];
        v12[4] = v9;
        _OWORD v12[5] = v8;
        v6 += 3;
        --v7;
      }
      while (v7);
      sub_100003DD0(&qword_1000C50C8);
      sub_100005178((unint64_t *)&qword_1000C50D0, &qword_1000C50C8);
      uint64_t v13 = BidirectionalCollection<>.joined(separator:)();
      Swift::String v15 = v14;
      swift_release();
      _StringGuts.grow(_:)(29);
      uint64_t v16 = dispatch thunk of CustomStringConvertible.description.getter();
      swift_bridgeObjectRelease();
      unint64_t v21 = v16;
      v17._uint64_t countAndFlagsBits = 0xD000000000000018;
      v17._unint64_t object = (void *)0x80000001000A9D10;
      String.append(_:)(v17);
      v18._uint64_t countAndFlagsBits = v13;
      v18._unint64_t object = v15;
      String.append(_:)(v18);
    }
    swift_bridgeObjectRelease();
    v19._uint64_t countAndFlagsBits = 39;
    v19._unint64_t object = (void *)0xE100000000000000;
    String.append(_:)(v19);
    return v21;
  }
  return v1;
}

uint64_t sub_100094DCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10009275C(a2, a3);
  if (v6)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
  }
  else
  {
    v9._uint64_t countAndFlagsBits = 0x6E6F697469736F70;
    v9._unint64_t object = (void *)0xE900000000000020;
    String.append(_:)(v9);
    _print_unlocked<A, B>(_:_:)();
    uint64_t v7 = 0;
    uint64_t v8 = (void *)0xE000000000000000;
  }
  uint64_t v10 = sub_10009275C(a1, a3);
  if (v11)
  {
    uint64_t v12 = v10;
    uint64_t v13 = v11;
  }
  else
  {
    v14._uint64_t countAndFlagsBits = 0x6E6F697469736F70;
    v14._unint64_t object = (void *)0xE900000000000020;
    String.append(_:)(v14);
    _print_unlocked<A, B>(_:_:)();
    uint64_t v12 = 0;
    uint64_t v13 = (void *)0xE000000000000000;
  }
  _StringGuts.grow(_:)(52);
  v15._unint64_t object = (void *)0x80000001000A9D50;
  v15._uint64_t countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v15);
  v16._uint64_t countAndFlagsBits = v7;
  v16._unint64_t object = v8;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
  v17._unint64_t object = (void *)0x80000001000A9D70;
  String.append(_:)(v17);
  v18._uint64_t countAndFlagsBits = v12;
  v18._unint64_t object = v13;
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100094F80(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v4 = *(void *)(result + 16);
  if (!v4) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  unint64_t v8 = 0;
  uint64_t v9 = result + 32;
  uint64_t v10 = _swiftEmptyArrayStorage;
  uint64_t v32 = result + 32;
  do
  {
    if (v8 <= v4) {
      unint64_t v11 = v4;
    }
    else {
      unint64_t v11 = v8;
    }
    uint64_t v12 = (long long *)(v9 + 192 * v8);
    for (unint64_t i = v8; ; ++i)
    {
      if (v11 == i)
      {
        __break(1u);
        return result;
      }
      long long v14 = v12[9];
      long long v41 = v12[8];
      long long v42 = v14;
      long long v15 = v12[11];
      long long v43 = v12[10];
      long long v44 = v15;
      long long v16 = v12[5];
      long long v37 = v12[4];
      long long v38 = v16;
      long long v17 = v12[7];
      long long v39 = v12[6];
      long long v40 = v17;
      long long v18 = v12[1];
      long long v33 = *v12;
      long long v34 = v18;
      long long v19 = v12[3];
      long long v35 = v12[2];
      long long v36 = v19;
      unint64_t v8 = i + 1;
      uint64_t result = sub_10008EFF8(a2, a3, a4, v35);
      if (result) {
        break;
      }
      v12 += 12;
      if (v4 == v8) {
        return (uint64_t)v10;
      }
    }
    sub_10002E940((uint64_t)&v33);
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    Swift::String v45 = v10;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_100056FB8(0, v10[2] + 1, 1);
      uint64_t v10 = v45;
    }
    unint64_t v21 = v10[2];
    unint64_t v20 = v10[3];
    if (v21 >= v20 >> 1)
    {
      uint64_t result = (uint64_t)sub_100056FB8((char *)(v20 > 1), v21 + 1, 1);
      uint64_t v10 = v45;
    }
    v10[2] = v21 + 1;
    uint64_t v22 = &v10[24 * v21];
    long long v23 = v33;
    long long v24 = v34;
    long long v25 = v36;
    _OWORD v22[4] = v35;
    v22[5] = v25;
    void v22[2] = v23;
    v22[3] = v24;
    long long v26 = v37;
    long long v27 = v38;
    long long v28 = v40;
    v22[8] = v39;
    v22[9] = v28;
    _OWORD v22[6] = v26;
    v22[7] = v27;
    long long v29 = v41;
    long long v30 = v42;
    long long v31 = v44;
    v22[12] = v43;
    v22[13] = v31;
    v22[10] = v29;
    v22[11] = v30;
    uint64_t v9 = v32;
  }
  while (v4 - 1 != i);
  return (uint64_t)v10;
}

uint64_t sub_10009513C(uint64_t a1, void *a2, unsigned __int8 a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9)
{
  uint64_t v17 = *v9;
  uint64_t v73 = v9[1];
  uint64_t v74 = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10002B9FC((uint64_t)&v74);
  sub_10002B9FC((uint64_t)&v73);
  uint64_t v18 = sub_100094F80(v17, a6, a7, a8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10002BAD0((uint64_t)&v74);
  sub_10002BAD0((uint64_t)&v73);
  if (*(void *)(v18 + 16))
  {
    long long v20 = *(_OWORD *)(v18 + 32);
    long long v19 = *(_OWORD *)(v18 + 48);
    long long v21 = *(_OWORD *)(v18 + 80);
    *(_OWORD *)&v76[32] = *(_OWORD *)(v18 + 64);
    *(_OWORD *)&v76[48] = v21;
    long long v22 = *(_OWORD *)(v18 + 96);
    long long v23 = *(_OWORD *)(v18 + 112);
    long long v24 = *(_OWORD *)(v18 + 144);
    *(_OWORD *)&v76[96] = *(_OWORD *)(v18 + 128);
    *(_OWORD *)&v76[112] = v24;
    *(_OWORD *)&v76[64] = v22;
    *(_OWORD *)&v76[80] = v23;
    long long v25 = *(_OWORD *)(v18 + 160);
    long long v26 = *(_OWORD *)(v18 + 176);
    long long v27 = *(_OWORD *)(v18 + 208);
    long long v79 = *(_OWORD *)(v18 + 192);
    long long v80 = v27;
    long long v77 = v25;
    long long v78 = v26;
    *(_OWORD *)uint64_t v76 = v20;
    *(_OWORD *)&v76[16] = v19;
    long long v69 = *(_OWORD *)(v18 + 160);
    long long v70 = *(_OWORD *)(v18 + 176);
    long long v71 = *(_OWORD *)(v18 + 192);
    long long v72 = *(_OWORD *)(v18 + 208);
    long long v65 = *(_OWORD *)(v18 + 96);
    long long v66 = *(_OWORD *)(v18 + 112);
    long long v67 = *(_OWORD *)(v18 + 128);
    long long v68 = *(_OWORD *)(v18 + 144);
    long long v61 = *(_OWORD *)(v18 + 32);
    long long v62 = *(_OWORD *)(v18 + 48);
    long long v63 = *(_OWORD *)(v18 + 64);
    long long v64 = *(_OWORD *)(v18 + 80);
    sub_10002E940((uint64_t)v76);
    swift_bridgeObjectRelease();
    long long v85 = *(_OWORD *)&v76[72];
    long long v86 = *(_OWORD *)&v76[88];
    long long v87 = *(_OWORD *)&v76[104];
    uint64_t v88 = *(void *)&v76[120];
    long long v81 = *(_OWORD *)&v76[8];
    long long v82 = *(_OWORD *)&v76[24];
    long long v83 = *(_OWORD *)&v76[40];
    long long v84 = *(_OWORD *)&v76[56];
    long long v89 = *(_OWORD *)&v76[88];
    v75[10] = v71;
    v75[11] = v72;
    v75[8] = v69;
    v75[9] = v70;
    v75[6] = v67;
    v75[7] = v68;
    v75[4] = v65;
    v75[5] = v66;
    v75[2] = v63;
    v75[3] = v64;
    v75[0] = v61;
    v75[1] = v62;
    v28._uint64_t countAndFlagsBits = (uint64_t)v75;
    String.init(argument:)(v28);
    uint64_t v29 = v89 & 0xFFFFFFFFFFFFLL;
    if ((*((void *)&v89 + 1) & 0x2000000000000000) != 0) {
      uint64_t v29 = HIBYTE(*((void *)&v89 + 1)) & 0xFLL;
    }
    if (v29)
    {
      *(_OWORD *)unint64_t v90 = v89;
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_10002E940((uint64_t)v76);
      sub_10002FB5C((uint64_t)&v89);
      sub_1000655C4(v76, v90);
      sub_100031A24((uint64_t)&v89);
      sub_10002EAFC((uint64_t)v76);
    }
    long long v31 = (void *)v90[1];
    uint64_t v30 = v90[0];
    sub_1000641E0((uint64_t)v75, (uint64_t)v90);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_100035580(v76);
    sub_1000641E0((uint64_t)v76, (uint64_t)v90);
    uint64_t v30 = 0;
    long long v31 = 0;
  }
  sub_1000641E0((uint64_t)v90, (uint64_t)v75);
  uint64_t v32 = sub_10009294C(a9, (uint64_t)v75);
  long long v34 = v33;
  if (!v31)
  {
    uint64_t v40 = v32;
    if (a3 <= 0xFDu)
    {
      sub_1000319B8(a1, (uint64_t)a2, a3);
      _StringGuts.grow(_:)(36);
      swift_bridgeObjectRelease();
      v51._uint64_t countAndFlagsBits = a4;
      v51._unint64_t object = a5;
      String.append(_:)(v51);
      v52._unint64_t object = (void *)0x80000001000A9E40;
      v52._uint64_t countAndFlagsBits = 0xD000000000000012;
      String.append(_:)(v52);
      v92._uint64_t countAndFlagsBits = a1;
      v92._unint64_t object = a2;
      uint64_t v53 = sub_100076D6C(v92, a3);
      uint64_t v55 = v54;
      sub_10002ECD0(a1, (uint64_t)a2, a3);
      v56._uint64_t countAndFlagsBits = v53;
      v56._unint64_t object = v55;
      String.append(_:)(v56);
      swift_bridgeObjectRelease();
      uint64_t v42 = 39;
      unint64_t v43 = 0xE100000000000000;
    }
    else
    {
      _StringGuts.grow(_:)(28);
      swift_bridgeObjectRelease();
      v41._uint64_t countAndFlagsBits = a4;
      v41._unint64_t object = a5;
      String.append(_:)(v41);
      uint64_t v42 = 0x766E692073692027;
      unint64_t v43 = 0xED00002E64696C61;
    }
    String.append(_:)(*(Swift::String *)&v42);
    v57._uint64_t countAndFlagsBits = v40;
    v57._unint64_t object = v34;
    String.append(_:)(v57);
    goto LABEL_17;
  }
  uint64_t v59 = v32;
  if (a3 > 0xFDu)
  {
    _StringGuts.grow(_:)(38);
    swift_bridgeObjectRelease();
    v35._uint64_t countAndFlagsBits = a4;
    v35._unint64_t object = a5;
    String.append(_:)(v35);
    v36._uint64_t countAndFlagsBits = 0xD000000000000013;
    v36._unint64_t object = (void *)0x80000001000A9E60;
    String.append(_:)(v36);
    v37._uint64_t countAndFlagsBits = v30;
    v37._unint64_t object = v31;
    String.append(_:)(v37);
    v38._uint64_t countAndFlagsBits = 10046;
    v38._unint64_t object = (void *)0xE200000000000000;
    String.append(_:)(v38);
    v39._uint64_t countAndFlagsBits = v59;
    v39._unint64_t object = v34;
    String.append(_:)(v39);
    swift_bridgeObjectRelease();
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  sub_1000319B8(a1, (uint64_t)a2, a3);
  _StringGuts.grow(_:)(41);
  swift_bridgeObjectRelease();
  v44._uint64_t countAndFlagsBits = a4;
  v44._unint64_t object = a5;
  String.append(_:)(v44);
  v45._unint64_t object = (void *)0x80000001000A9E40;
  v45._uint64_t countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v45);
  v91._uint64_t countAndFlagsBits = a1;
  v91._unint64_t object = a2;
  v46._uint64_t countAndFlagsBits = sub_100076D6C(v91, a3);
  String.append(_:)(v46);
  swift_bridgeObjectRelease();
  v47._uint64_t countAndFlagsBits = 15392;
  v47._unint64_t object = (void *)0xE200000000000000;
  String.append(_:)(v47);
  v48._uint64_t countAndFlagsBits = v30;
  v48._unint64_t object = v31;
  String.append(_:)(v48);
  v49._uint64_t countAndFlagsBits = 10046;
  v49._unint64_t object = (void *)0xE200000000000000;
  String.append(_:)(v49);
  v50._uint64_t countAndFlagsBits = v59;
  v50._unint64_t object = v34;
  String.append(_:)(v50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10002ECD0(a1, (uint64_t)a2, a3);
LABEL_18:
  sub_1000353E4((uint64_t)v90);
  return 0x756C617620656854;
}

uint64_t sub_1000956B8(uint64_t a1, void *a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v13 = *v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10008E8D8(v13, a4, a5, a6, (uint64_t)v34);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000641E0((uint64_t)v34, (uint64_t)v49);
  sub_1000641E0((uint64_t)v49, (uint64_t)v50);
  if (sub_1000353CC((uint64_t)v50) == 1) {
    return 0;
  }
  sub_1000641E0((uint64_t)v49, (uint64_t)v31);
  long long v14 = v33;
  uint64_t v29 = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000353E4((uint64_t)v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_100094F80(v13, a4, a5, a6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v15 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  long long v16 = *(_OWORD *)(v15 + 176);
  long long v36 = *(_OWORD *)(v15 + 160);
  long long v37 = v16;
  long long v17 = *(_OWORD *)(v15 + 208);
  long long v38 = *(_OWORD *)(v15 + 192);
  long long v39 = v17;
  long long v18 = *(_OWORD *)(v15 + 112);
  *(_OWORD *)&v35[64] = *(_OWORD *)(v15 + 96);
  *(_OWORD *)&v35[80] = v18;
  long long v19 = *(_OWORD *)(v15 + 144);
  *(_OWORD *)&v35[96] = *(_OWORD *)(v15 + 128);
  *(_OWORD *)&v35[112] = v19;
  long long v20 = *(_OWORD *)(v15 + 48);
  *(_OWORD *)Swift::String v35 = *(_OWORD *)(v15 + 32);
  *(_OWORD *)&v35[16] = v20;
  long long v21 = *(_OWORD *)(v15 + 80);
  *(_OWORD *)&v35[32] = *(_OWORD *)(v15 + 64);
  *(_OWORD *)&v35[48] = v21;
  sub_10002E940((uint64_t)v35);
  swift_bridgeObjectRelease();
  long long v44 = *(_OWORD *)&v35[72];
  Swift::String v45 = *(Swift::String *)&v35[88];
  long long v46 = *(_OWORD *)&v35[104];
  uint64_t v47 = *(void *)&v35[120];
  long long v40 = *(_OWORD *)&v35[8];
  long long v41 = *(_OWORD *)&v35[24];
  long long v42 = *(_OWORD *)&v35[40];
  long long v43 = *(_OWORD *)&v35[56];
  long long v48 = *(_OWORD *)&v35[88];
  uint64_t v22 = *(void *)&v35[88] & 0xFFFFFFFFFFFFLL;
  if ((*(void *)&v35[96] & 0x2000000000000000) != 0) {
    uint64_t v22 = HIBYTE(*(void *)&v35[96]) & 0xFLL;
  }
  if (v22)
  {
    Swift::String v30 = v45;
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1000655C4(v35, (unint64_t *)&v30);
    sub_100031A24((uint64_t)&v48);
  }
  sub_10002EAFC((uint64_t)v35);
  Swift::String v24 = v30;
  if (a3 <= 0xFDu)
  {
    v51._uint64_t countAndFlagsBits = a1;
    v51._unint64_t object = a2;
    v30._uint64_t countAndFlagsBits = sub_100076D6C(v51, a3);
    v30._unint64_t object = v25;
    v26._uint64_t countAndFlagsBits = 15392;
    v26._unint64_t object = (void *)0xE200000000000000;
    String.append(_:)(v26);
  }
  else
  {
    v30._uint64_t countAndFlagsBits = 60;
    v30._unint64_t object = (void *)0xE100000000000000;
  }
  String.append(_:)(v24);
  v27._uint64_t countAndFlagsBits = 2105406;
  v27._unint64_t object = (void *)0xE300000000000000;
  String.append(_:)(v27);
  v28._uint64_t countAndFlagsBits = v29;
  v28._unint64_t object = v14;
  String.append(_:)(v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v30._countAndFlagsBits;
}

ValueMetadata *type metadata accessor for Platform.StandardError()
{
  return &type metadata for Platform.StandardError;
}

unint64_t sub_100095A20(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    unint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    unint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  swift_bridgeObjectRetain();
  if (!v4)
  {
LABEL_26:
    return swift_bridgeObjectRelease();
  }
  uint64_t v5 = (a1 >> 59) & 1;
  if ((a2 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  uint64_t v6 = 4 << v5;
  unint64_t v7 = 15;
  while (1)
  {
    unint64_t v9 = v7 & 0xC;
    unint64_t result = v7;
    if (v9 == v6) {
      unint64_t result = sub_100095BE0(v7, a1, a2);
    }
    unint64_t v11 = result >> 16;
    if (result >> 16 >= v4) {
      break;
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
      unint64_t result = String.UTF8View._foreignSubscript(position:)();
      unsigned __int8 v12 = result;
      if (v9 != v6) {
        goto LABEL_20;
      }
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v13[0] = a1;
      v13[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      unsigned __int8 v12 = *((unsigned char *)v13 + v11);
      if (v9 != v6) {
        goto LABEL_20;
      }
    }
    else
    {
      unint64_t result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      if ((a1 & 0x1000000000000000) == 0) {
        unint64_t result = _StringObject.sharedUTF8.getter();
      }
      unsigned __int8 v12 = *(unsigned char *)(result + v11);
      if (v9 != v6)
      {
LABEL_20:
        if ((a2 & 0x1000000000000000) == 0) {
          goto LABEL_8;
        }
        goto LABEL_21;
      }
    }
    unint64_t result = sub_100095BE0(v7, a1, a2);
    unint64_t v7 = result;
    if ((a2 & 0x1000000000000000) == 0)
    {
LABEL_8:
      unint64_t v7 = (v7 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_9;
    }
LABEL_21:
    if (v4 <= v7 >> 16) {
      goto LABEL_30;
    }
    unint64_t v7 = String.UTF8View._foreignIndex(after:)();
LABEL_9:
    unint64_t v8 = (FILE *)stderr.getter();
    putc(v12, v8);
    if (4 * v4 == v7 >> 14) {
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_100095BC8(unint64_t a1, unint64_t a2)
{
  return sub_100095A20(a1, a2);
}

uint64_t sub_100095BE0(unsigned __int16 a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_100095C5C()
{
  if (!getenv("SHELL")) {
    return 0;
  }
  uint64_t v0 = String.init(cString:)();
  unint64_t v2 = v1;
  v7[0] = 47;
  v7[1] = 0xE100000000000000;
  __chkstk_darwin(v0);
  _OWORD v6[2] = v7;
  swift_bridgeObjectRetain();
  char v3 = sub_1000342C0(0x7FFFFFFFFFFFFFFFLL, 1, sub_10002E878, (uint64_t)v6, v0, v2);
  swift_bridgeObjectRelease();
  if (!*((void *)v3 + 2))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  uint64_t v4 = static String._fromSubstring(_:)();
  swift_bridgeObjectRelease_n();
  return v4;
}

uint64_t sub_100095D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a1 - 8);
  __chkstk_darwin(a1);
  unint64_t v9 = &v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_getAssociatedTypeWitness();
  uint64_t v17 = Set.init()();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a1);
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  long long v16 = &v17;
  uint64_t v10 = Sequence.filter(_:)();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100095ED0(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v11 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1, AssociatedTypeWitness);
  type metadata accessor for Set();
  char v9 = Set.insert(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, AssociatedTypeWitness);
  return v9 & 1;
}

uint64_t sub_100096030(uint64_t a1)
{
  return sub_100095ED0(a1) & 1;
}

uint64_t sub_100096054()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100096100(Swift::UInt a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v5 = sub_100060D84(a1);
      if (v6)
      {
        uint64_t v4 = *(void *)(*(void *)(a2 + 56) + 8 * v5);
        swift_retain();
        return v4;
      }
    }
    return 0;
  }
  swift_retain();
  uint64_t v3 = __CocoaDictionary.lookup(_:)();
  swift_release();
  if (!v3) {
    return 0;
  }
  swift_unknownObjectRetain();
  sub_100003DD0(&qword_1000C58E0);
  swift_dynamicCast();
  uint64_t v4 = v8;
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_1000961DC()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100096284()
{
  sub_1000961DC();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Tree()
{
  return sub_10003A4F0();
}

BOOL sub_1000962F4(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_100096300()
{
  Hasher._combine(_:)(v0);
}

Swift::Int sub_10009632C()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v0);
  return Hasher._finalize()();
}

Swift::Int sub_100096374()
{
  return sub_10009632C();
}

void sub_100096398()
{
}

Swift::Int sub_1000963BC()
{
  return Hasher._finalize()();
}

BOOL sub_1000963FC(uint64_t *a1, uint64_t *a2)
{
  return sub_1000962F4(*a1, *a2);
}

uint64_t sub_100096420()
{
  return swift_getWitnessTable();
}

uint64_t sub_10009643C(uint64_t a1, uint64_t a2)
{
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0) {
    goto LABEL_108;
  }
LABEL_2:
  uint64_t v3 = &_swiftEmptySetSingleton;
LABEL_3:
  unint64_t v71 = (unint64_t)v3;
  sub_100003DD0(&qword_1000C5F08);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000A3F10;
  *(void *)(v4 + 32) = a1;
  Swift::UInt v65 = v4;
  specialized Array._endMutation()();
  Swift::UInt v5 = v65;
  Swift::UInt v70 = v65;
  uint64_t v6 = sub_1000859A0((uint64_t)_swiftEmptyArrayStorage);
  swift_retain();
  Swift::Int v7 = 0;
  while (1)
  {
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v8 < v7)
      {
LABEL_111:
        __break(1u);
LABEL_112:
        __break(1u);
LABEL_113:
        sub_100003DD0(&qword_1000C58E0);
        uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
        __break(1u);
        return result;
      }
      swift_bridgeObjectRetain();
      uint64_t v51 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v51 < v7) {
        goto LABEL_112;
      }
      swift_bridgeObjectRetain();
      a1 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (a1 < v8) {
        goto LABEL_103;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      a1 = v8;
      if (v8 < (unint64_t)v7) {
        goto LABEL_102;
      }
    }
    if (v8 < 0) {
      goto LABEL_104;
    }
    if ((v5 & 0xC000000000000001) != 0 && v7 != v8)
    {
      if (v7 >= (unint64_t)v8) {
        goto LABEL_107;
      }
      Swift::Int v9 = v7;
      do
      {
        sub_100003DD0(&qword_1000C58E0);
        _ArrayBuffer._typeCheckSlowPath(_:)(v9++);
      }
      while (v8 != v9);
    }
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      a1 = _CocoaArrayWrapper.subscript.getter();
      uint64_t v10 = v13;
      int64_t v12 = v14;
      unint64_t v11 = v15;
      swift_bridgeObjectRelease();
    }
    else
    {
      a1 = v5 & 0xFFFFFFFFFFFFFF8;
      uint64_t v10 = (v5 & 0xFFFFFFFFFFFFFF8) + 32;
      unint64_t v11 = (2 * v8) | 1;
      swift_bridgeObjectRetain();
      int64_t v12 = v7;
    }
    if (v12 == v11 >> 1)
    {
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      Swift::String v52 = _swiftEmptyArrayStorage;
      goto LABEL_95;
    }
    if (v12 >= (uint64_t)(v11 >> 1)) {
      goto LABEL_105;
    }
    Swift::UInt v16 = *(void *)(v10 + 8 * v12);
    swift_retain();
    swift_unknownObjectRelease();
    BOOL v17 = __OFADD__(v7++, 1);
    if (v17)
    {
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      if (!_CocoaArrayWrapper.endIndex.getter()) {
        goto LABEL_2;
      }
      uint64_t v3 = (void *)sub_100097B4C((unint64_t)_swiftEmptyArrayStorage);
      goto LABEL_3;
    }
    if (*(void *)(v16 + 16) == a2) {
      break;
    }
    swift_retain();
    sub_1000617EC(&v65, v16);
    swift_release();
    swift_beginAccess();
    Swift::UInt v61 = v16;
    a1 = *(void *)(v16 + 40);
    if ((unint64_t)a1 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v18) {
        goto LABEL_92;
      }
LABEL_23:
      unint64_t v19 = 0;
      unint64_t v20 = v71;
      unint64_t v63 = v71 & 0xC000000000000001;
      unint64_t v64 = a1 & 0xC000000000000001;
      Swift::Int v58 = v7;
      uint64_t v59 = a1 + 32;
      uint64_t v60 = a1 & 0xFFFFFFFFFFFFFF8;
      long long v62 = (char *)(v71 + 56);
      while (2)
      {
        while (2)
        {
          if (v64)
          {
            Swift::UInt v21 = specialized _ArrayBuffer._getElementSlowPath(_:)();
            BOOL v17 = __OFADD__(v19++, 1);
            if (v17) {
              goto LABEL_96;
            }
          }
          else
          {
            if (v19 >= *(void *)(v60 + 16)) {
              goto LABEL_99;
            }
            Swift::UInt v21 = *(void *)(v59 + 8 * v19);
            swift_retain();
            BOOL v17 = __OFADD__(v19++, 1);
            if (v17)
            {
LABEL_96:
              __break(1u);
LABEL_97:
              __break(1u);
              goto LABEL_98;
            }
          }
          if (v63)
          {
            swift_bridgeObjectRetain();
            swift_retain();
            char v22 = __CocoaSet.contains(_:)();
            swift_bridgeObjectRelease();
            swift_release();
            if (v22) {
              goto LABEL_24;
            }
          }
          else if (*(void *)(v20 + 16))
          {
            Hasher.init(_seed:)();
            Hasher._combine(_:)(v21);
            Swift::Int v23 = Hasher._finalize()();
            uint64_t v24 = -1 << *(unsigned char *)(v20 + 32);
            unint64_t v25 = v23 & ~v24;
            if ((*(void *)&v62[(v25 >> 3) & 0xFFFFFFFFFFFFFF8] >> v25))
            {
              uint64_t v26 = *(void *)(v20 + 48);
              if (*(void *)(v26 + 8 * v25) == v21)
              {
LABEL_24:
                swift_release();
                if (v19 == v18) {
                  goto LABEL_4;
                }
                continue;
              }
              uint64_t v27 = ~v24;
              while (1)
              {
                unint64_t v25 = (v25 + 1) & v27;
                if (((*(void *)&v62[(v25 >> 3) & 0xFFFFFFFFFFFFFF8] >> v25) & 1) == 0) {
                  break;
                }
                if (*(void *)(v26 + 8 * v25) == v21) {
                  goto LABEL_24;
                }
              }
            }
          }
          break;
        }
        uint64_t v28 = a1;
        Swift::UInt v29 = v70;
        if (!(v70 >> 62))
        {
          a1 = *(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (a1) {
            goto LABEL_43;
          }
LABEL_52:
          swift_bridgeObjectRelease();
          swift_retain();
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          if (*(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          if ((v6 & 0xC000000000000001) != 0)
          {
LABEL_55:
            if (v6 < 0) {
              uint64_t v32 = v6;
            }
            else {
              uint64_t v32 = v6 & 0xFFFFFFFFFFFFFF8;
            }
            swift_retain();
            uint64_t v33 = __CocoaDictionary.count.getter();
            if (__OFADD__(v33, 1)) {
              goto LABEL_100;
            }
            uint64_t v6 = sub_100096F10(v32, v33 + 1);
            goto LABEL_73;
          }
LABEL_72:
          swift_retain();
LABEL_73:
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          Swift::UInt v65 = v6;
          unint64_t v41 = sub_100060D84(v21);
          uint64_t v42 = *(void *)(v6 + 16);
          BOOL v43 = (v40 & 1) == 0;
          uint64_t v44 = v42 + v43;
          if (__OFADD__(v42, v43)) {
            goto LABEL_97;
          }
          a1 = v40;
          if (*(void *)(v6 + 24) >= v44)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              sub_10007A93C();
            }
          }
          else
          {
            sub_10007B57C(v44, isUniquelyReferenced_nonNull_native);
            unint64_t v45 = sub_100060D84(v21);
            if ((a1 & 1) != (v46 & 1)) {
              goto LABEL_113;
            }
            unint64_t v41 = v45;
          }
          uint64_t v6 = v65;
          uint64_t v47 = 8 * v41;
          if (a1)
          {
            uint64_t v48 = *(void *)(v65 + 56);
            swift_release();
            *(void *)(v48 + v47) = v61;
          }
          else
          {
            *(void *)(v65 + 8 * (v41 >> 6) + 64) |= 1 << v41;
            *(void *)(*(void *)(v6 + 48) + 8 * v41) = v21;
            *(void *)(*(void *)(v6 + 56) + 8 * v41) = v61;
            uint64_t v49 = *(void *)(v6 + 16);
            BOOL v17 = __OFADD__(v49, 1);
            uint64_t v50 = v49 + 1;
            if (v17) {
              goto LABEL_101;
            }
            *(void *)(v6 + 16) = v50;
            swift_retain();
          }
          swift_release();
          swift_bridgeObjectRelease();
          a1 = v28;
          if (v19 == v18)
          {
LABEL_4:
            swift_release();
            Swift::Int v7 = v58;
            goto LABEL_5;
          }
          continue;
        }
        break;
      }
      swift_bridgeObjectRetain();
      a1 = _CocoaArrayWrapper.endIndex.getter();
      if (!a1) {
        goto LABEL_52;
      }
LABEL_43:
      if ((v29 & 0xC000000000000001) != 0)
      {
        uint64_t v34 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        swift_unknownObjectRelease();
        if (v34 != v21)
        {
          if (a1 == 1) {
            goto LABEL_52;
          }
          uint64_t v35 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          swift_unknownObjectRelease();
          if (v35 != v21)
          {
            if (a1 == 2) {
              goto LABEL_52;
            }
            uint64_t v36 = 2;
            while (1)
            {
              uint64_t v37 = specialized _ArrayBuffer._getElementSlowPath(_:)();
              uint64_t v56 = v36 + 1;
              if (__OFADD__(v36, 1))
              {
                __break(1u);
                goto LABEL_111;
              }
              uint64_t v38 = v37;
              swift_unknownObjectRelease();
              if (v38 == v21) {
                break;
              }
              ++v36;
              if (v56 == a1) {
                goto LABEL_52;
              }
            }
            swift_bridgeObjectRelease();
            if ((v6 & 0xC000000000000001) != 0) {
              goto LABEL_55;
            }
            goto LABEL_72;
          }
        }
      }
      else if (*(void *)(v29 + 32) != v21)
      {
        if (a1 == 1) {
          goto LABEL_52;
        }
        if (*(void *)(v29 + 40) != v21)
        {
          if (a1 != 2)
          {
            uint64_t v30 = 6;
            while (1)
            {
              uint64_t v31 = v30 - 3;
              if (__OFADD__(v30 - 4, 1)) {
                break;
              }
              if (*(void *)(v29 + 8 * v30) == v21) {
                goto LABEL_71;
              }
              ++v30;
              if (v31 == a1) {
                goto LABEL_52;
              }
            }
LABEL_98:
            __break(1u);
LABEL_99:
            __break(1u);
LABEL_100:
            __break(1u);
LABEL_101:
            __break(1u);
LABEL_102:
            __break(1u);
LABEL_103:
            __break(1u);
LABEL_104:
            __break(1u);
LABEL_105:
            __break(1u);
            goto LABEL_106;
          }
          goto LABEL_52;
        }
      }
LABEL_71:
      swift_bridgeObjectRelease();
      if ((v6 & 0xC000000000000001) != 0) {
        goto LABEL_55;
      }
      goto LABEL_72;
    }
    uint64_t v18 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v18) {
      goto LABEL_23;
    }
LABEL_92:
    swift_release();
LABEL_5:
    swift_bridgeObjectRelease();
    Swift::UInt v5 = v70;
  }
  swift_bridgeObjectRelease();
  uint64_t v53 = swift_allocObject();
  *(void *)(v53 + 16) = v6;
  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = sub_100097E44;
  *(void *)(v54 + 24) = v53;
  Swift::UInt v65 = v16;
  char v66 = 1;
  long long v67 = sub_100097E84;
  uint64_t v68 = v54;
  char v69 = 0;
  Swift::String v52 = (void *)sub_100096CCC();
LABEL_95:
  swift_bridgeObjectRelease();
  return (uint64_t)v52;
}

unint64_t sub_100096CCC()
{
  uint64_t v13 = *(void *)v0;
  char v14 = *(unsigned char *)(v0 + 8);
  sub_100097EB0((uint64_t)&v13);
  swift_retain();
  unint64_t v1 = sub_10009753C((uint64_t *)v0);
  sub_100097EDC((uint64_t)&v13);
  swift_release();
  unint64_t v12 = v1;
  if ((v1 & 0x8000000000000000) != 0 || (v1 & 0x4000000000000000) != 0) {
    goto LABEL_37;
  }
  uint64_t v2 = *(void *)(v1 + 16);
  sub_100097EDC((uint64_t)&v13);
  swift_release();
  unint64_t v3 = (unint64_t)v2 >> 1;
  while ((unint64_t)(v2 + 1) >= 3)
  {
    unint64_t v1 = 0;
    while (1)
    {
      unint64_t v4 = v1 + 1;
      unint64_t v5 = v2 - (v1 + 1);
      if (__OFSUB__(v2, v1 + 1)) {
        break;
      }
      if (v1 != v5)
      {
        uint64_t v6 = v12;
        if ((v12 & 0xC000000000000001) != 0)
        {
          uint64_t v8 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if ((v1 & 0x8000000000000000) != 0) {
            goto LABEL_31;
          }
          unint64_t v7 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v1 >= v7) {
            goto LABEL_32;
          }
          uint64_t v8 = *(void *)(v12 + 8 * v1 + 32);
          swift_retain();
          if ((v5 & 0x8000000000000000) != 0) {
            goto LABEL_33;
          }
          if (v5 >= v7) {
            goto LABEL_35;
          }
          uint64_t v9 = *(void *)(v12 + 32 + 8 * v5);
          swift_retain();
        }
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v12 & 0x8000000000000000) != 0
          || (v12 & 0x4000000000000000) != 0)
        {
          uint64_t v6 = sub_1000639E4(v12);
          unint64_t v12 = v6;
        }
        swift_release();
        *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 8 * v1 + 0x20) = v9;
        specialized Array._endMutation()();
        unint64_t v1 = v12;
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v12 & 0x8000000000000000) != 0
          || (v12 & 0x4000000000000000) != 0)
        {
          unint64_t v1 = sub_1000639E4(v12);
          unint64_t v12 = v1;
        }
        if ((v5 & 0x8000000000000000) != 0) {
          goto LABEL_34;
        }
        if (v5 >= *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_36;
        }
        swift_release();
        *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20) = v8;
        specialized Array._endMutation()();
      }
      unint64_t v1 = v4;
      if (v3 == v4) {
        return v12;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    swift_retain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_release();
    sub_100097EDC((uint64_t)&v13);
    swift_release();
    if (v2 >= 0) {
      uint64_t v11 = v2;
    }
    else {
      uint64_t v11 = v2 + 1;
    }
    if (v2 < -1) {
      __break(1u);
    }
    unint64_t v3 = v11 >> 1;
  }
  return v1;
}

Swift::Int sub_100096F10(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100003DD0(&qword_1000C5D30);
    uint64_t v2 = static _DictionaryStorage.convert(_:capacity:)();
    uint64_t v17 = v2;
    __CocoaDictionary.makeIterator()();
    for (; __CocoaDictionary.Iterator.next()(); ++*(void *)(v2 + 16))
    {
      sub_100003DD0(&qword_1000C58E0);
      swift_dynamicCast();
      swift_dynamicCast();
      unint64_t v10 = *(void *)(v2 + 16);
      if (*(void *)(v2 + 24) <= v10)
      {
        sub_10007B57C(v10 + 1, 1);
        uint64_t v2 = v17;
      }
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v16);
      Swift::Int result = Hasher._finalize()();
      uint64_t v4 = v2 + 64;
      uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v6 = result & ~v5;
      unint64_t v7 = v6 >> 6;
      if (((-1 << v6) & ~*(void *)(v2 + 64 + 8 * (v6 >> 6))) != 0)
      {
        unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 64 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v11 = 0;
        unint64_t v12 = (unint64_t)(63 - v5) >> 6;
        do
        {
          if (++v7 == v12 && (v11 & 1) != 0)
          {
            __break(1u);
            return result;
          }
          BOOL v13 = v7 == v12;
          if (v7 == v12) {
            unint64_t v7 = 0;
          }
          v11 |= v13;
          uint64_t v14 = *(void *)(v4 + 8 * v7);
        }
        while (v14 == -1);
        unint64_t v8 = __clz(__rbit64(~v14)) + (v7 << 6);
      }
      *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
      uint64_t v9 = 8 * v8;
      *(void *)(*(void *)(v2 + 48) + v9) = v16;
      *(void *)(*(void *)(v2 + 56) + v9) = v15;
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

uint64_t sub_100097144(uint64_t *a1, void (*a2)(uint64_t *__return_ptr, uint64_t *))
{
  uint64_t v3 = *a1;
  if (*((unsigned char *)a1 + 8) == 1)
  {
    *((unsigned char *)a1 + 8) = 0;
    swift_retain();
  }
  else if (v3)
  {
    uint64_t v7 = *a1;
    swift_retain();
    a2(&v8, &v7);
    swift_release();
    uint64_t v5 = v8;
    swift_retain();
    swift_release();
    *a1 = v5;
    return v5;
  }
  return v3;
}

uint64_t sub_1000971E4(uint64_t a1)
{
  uint64_t v54 = a1 + 32;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  uint64_t v53 = result + 56;
  unint64_t v6 = _swiftEmptyArrayStorage;
  uint64_t v7 = &_swiftEmptyArrayStorage[4];
LABEL_3:
  unint64_t v9 = *(void *)(a1 + 16);
  if (v5 == v9) {
    goto LABEL_32;
  }
  uint64_t v56 = v4;
  if (v5 >= v9)
  {
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  unint64_t v10 = v6;
  uint64_t v11 = 16 * v5;
  unint64_t v12 = (uint64_t *)(v54 + 16 * v5);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000558E8(v3);
  ++v5;
  uint64_t v15 = (uint64_t *)(v53 + v11);
  uint64_t v3 = v14;
  if (!v14) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v8 = *(void *)(v3 + 16);
  if (v8)
  {
    unint64_t v19 = 0;
    uint64_t v20 = v13;
    unint64_t v6 = v10;
    uint64_t v4 = v56;
    while (1)
    {
      if (v19 >= v8) {
        goto LABEL_37;
      }
      Swift::UInt v21 = (_OWORD *)(v3 + 192 * v19);
      long long v22 = v21[2];
      long long v23 = v21[3];
      long long v24 = v21[5];
      long long v60 = v21[4];
      long long v61 = v24;
      long long v58 = v22;
      long long v59 = v23;
      long long v25 = v21[6];
      long long v26 = v21[7];
      long long v27 = v21[9];
      long long v64 = v21[8];
      long long v65 = v27;
      long long v62 = v25;
      long long v63 = v26;
      long long v28 = v21[10];
      long long v29 = v21[11];
      long long v30 = v21[13];
      long long v68 = v21[12];
      long long v69 = v30;
      long long v66 = v28;
      long long v67 = v29;
      uint64_t v55 = v20;
      if (v4)
      {
        uint64_t result = sub_10002E940((uint64_t)&v58);
        uint64_t v31 = v6;
      }
      else
      {
        unint64_t v32 = v6[3];
        if ((uint64_t)((v32 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_39;
        }
        int64_t v33 = v32 & 0xFFFFFFFFFFFFFFFELL;
        if (v33 <= 1) {
          uint64_t v34 = 1;
        }
        else {
          uint64_t v34 = v33;
        }
        sub_100003DD0(&qword_1000C5230);
        uint64_t v31 = (void *)swift_allocObject();
        uint64_t v35 = (uint64_t)(j__malloc_size(v31) - 32) / 192;
        v31[2] = v34;
        v31[3] = 2 * v35;
        uint64_t v36 = v6[3] >> 1;
        uint64_t v7 = &v31[24 * v36 + 4];
        uint64_t v37 = v35 & 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v4 = v37 - v36;
        if (v6[2])
        {
          uint64_t v57 = v37 - v36;
          uint64_t v38 = v6;
          if (v31 < v6 || v31 + 4 >= &v6[24 * v36 + 4])
          {
            long long v39 = v6 + 4;
            sub_10002E940((uint64_t)&v58);
          }
          else
          {
            long long v39 = v6 + 4;
            sub_10002E940((uint64_t)&v58);
            if (v31 == v38) {
              goto LABEL_27;
            }
          }
          memmove(v31 + 4, v39, 192 * v36);
LABEL_27:
          v38[2] = 0;
          uint64_t result = swift_release();
          uint64_t v4 = v57;
          goto LABEL_28;
        }
        sub_10002E940((uint64_t)&v58);
        uint64_t result = swift_release();
      }
LABEL_28:
      BOOL v40 = __OFSUB__(v4--, 1);
      if (v40) {
        goto LABEL_38;
      }
      ++v19;
      long long v41 = v58;
      long long v42 = v59;
      long long v43 = v61;
      void v7[2] = v60;
      _OWORD v7[3] = v43;
      *uint64_t v7 = v41;
      v7[1] = v42;
      long long v44 = v62;
      long long v45 = v63;
      long long v46 = v65;
      v7[6] = v64;
      v7[7] = v46;
      v7[4] = v44;
      v7[5] = v45;
      long long v47 = v66;
      long long v48 = v67;
      long long v49 = v69;
      v7[10] = v68;
      v7[11] = v49;
      v7[8] = v47;
      v7[9] = v48;
      v7 += 12;
      unint64_t v6 = v31;
      uint64_t v20 = v55;
      if (v3)
      {
        unint64_t v8 = *(void *)(v3 + 16);
        if (v19 != v8) {
          continue;
        }
      }
      goto LABEL_3;
    }
  }
LABEL_7:
  while (1)
  {
    unint64_t v16 = *(void *)(a1 + 16);
    if (v5 == v16) {
      break;
    }
    if (v5 >= v16) {
      goto LABEL_36;
    }
    uint64_t v18 = *(v15 - 1);
    uint64_t v17 = *v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = sub_1000558E8(v3);
    ++v5;
    v15 += 2;
    uint64_t v13 = v17;
    uint64_t v3 = v18;
    if (v18) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = v10;
  uint64_t v4 = v56;
LABEL_32:
  swift_bridgeObjectRelease();
  uint64_t result = sub_1000558E8(v3);
  unint64_t v50 = v6[3];
  if (v50 < 2) {
    return (uint64_t)v6;
  }
  unint64_t v51 = v50 >> 1;
  BOOL v40 = __OFSUB__(v51, v4);
  uint64_t v52 = v51 - v4;
  if (!v40)
  {
    _OWORD v6[2] = v52;
    return (uint64_t)v6;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10009753C(uint64_t *a1)
{
  void (*v1)(uint64_t *__return_ptr, uint64_t *);
  char v2;
  uint64_t result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;

  long long v25 = *a1;
  long long v26 = *((unsigned char *)a1 + 8);
  unint64_t v1 = (void (*)(uint64_t *__return_ptr, uint64_t *))a1[2];
  uint64_t v2 = *((unsigned char *)a1 + 32);
  long long v23 = v25;
  long long v24 = v26;
  sub_100097EB0((uint64_t)&v25);
  swift_retain();
  if (v2)
  {
    unint64_t v6 = 0;
    unint64_t v5 = _swiftEmptyArrayStorage;
  }
  else
  {
    swift_retain();
    v1(&v22, &v23);
    uint64_t result = swift_release();
    uint64_t v4 = v22;
    unint64_t v5 = _swiftEmptyArrayStorage;
    unint64_t v6 = 0;
    if (v22)
    {
      uint64_t v7 = &_swiftEmptyArrayStorage[4];
      while (1)
      {
        if (!v6)
        {
          unint64_t v8 = v5[3];
          if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_29;
          }
          unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
          if (v9 <= 1) {
            unint64_t v10 = 1;
          }
          else {
            unint64_t v10 = v9;
          }
          sub_100003DD0(&qword_1000C5F08);
          uint64_t v11 = (void *)swift_allocObject();
          unint64_t v12 = j__malloc_size(v11);
          uint64_t v13 = v12 - 32;
          if (v12 < 32) {
            uint64_t v13 = v12 - 25;
          }
          uint64_t v14 = v13 >> 3;
          v11[2] = v10;
          v11[3] = (2 * (v13 >> 3)) | 1;
          uint64_t v15 = (unint64_t)(v11 + 4);
          unint64_t v16 = v5[3] >> 1;
          if (v5[2])
          {
            if (v11 != v5 || v15 >= (unint64_t)&v5[v16 + 4]) {
              memmove(v11 + 4, v5 + 4, 8 * v16);
            }
            uint64_t v5[2] = 0;
          }
          uint64_t v7 = (void *)(v15 + 8 * v16);
          unint64_t v6 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - v16;
          uint64_t result = swift_release();
          unint64_t v5 = v11;
        }
        uint64_t v18 = __OFSUB__(v6--, 1);
        if (v18) {
          break;
        }
        *v7++ = v4;
        swift_retain();
        v1(&v22, &v23);
        uint64_t result = swift_release();
        uint64_t v4 = v22;
        if (!v22) {
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
LABEL_24:
  swift_release();
  uint64_t result = swift_release();
  unint64_t v19 = v5[3];
  if (v19 < 2) {
    return (uint64_t)v5;
  }
  uint64_t v20 = v19 >> 1;
  uint64_t v18 = __OFSUB__(v20, v6);
  Swift::UInt v21 = v20 - v6;
  if (!v18)
  {
    uint64_t v5[2] = v21;
    return (uint64_t)v5;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100097720@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  Swift::UInt v4 = swift_retain();
  uint64_t v5 = sub_100096100(v4, a1);
  uint64_t result = swift_release();
  *a2 = v5;
  return result;
}

void *sub_100097770(uint64_t a1, uint64_t a2)
{
  void (*v6)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void v14[13];
  uint64_t v15;
  uint64_t v16;

  sub_100003DD0(&qword_1000C58E0);
  uint64_t v5 = (void *)swift_allocObject();
  swift_weakInit();
  uint64_t v5[2] = a1;
  _OWORD v5[3] = a2;
  swift_weakAssign();
  v5[5] = _swiftEmptyArrayStorage;
  unint64_t v6 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(a2 + 16);
  swift_retain();
  v6(v14, a1, a2);
  uint64_t v7 = v15;
  unint64_t v16 = v15;
  swift_bridgeObjectRetain();
  sub_10002DDE4((uint64_t)v14);
  unint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    unint64_t v9 = (void *)(v7 + 40);
    while (1)
    {
      unint64_t v10 = *(v9 - 1);
      uint64_t v11 = *v9;
      if (v10 == a1)
      {
        sub_10002BAD0((uint64_t)&v16);
        swift_release();
        sub_100074ED0();
        sub_100097F20();
        swift_allocError();
        *unint64_t v12 = a1;
        v12[1] = v11;
        swift_willThrow();
        goto LABEL_10;
      }
      sub_100097770(v10, *v9);
      if (v2) {
        break;
      }
      swift_beginAccess();
      swift_retain();
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v5[5] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v5[5] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      swift_endAccess();
      swift_weakAssign();
      swift_release();
      v9 += 2;
      if (!--v8) {
        goto LABEL_8;
      }
    }
    sub_10002BAD0((uint64_t)&v16);
    swift_release_n();
  }
  else
  {
LABEL_8:
    sub_10002BAD0((uint64_t)&v16);
LABEL_10:
    swift_release();
  }
  return v5;
}

Swift::Int sub_100097984(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100003DD0(&qword_1000C58B0);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = v1;
    uint64_t v26 = a1 + 32;
    while (1)
    {
      uint64_t v6 = v26 + 24 * v4;
      Swift::UInt v7 = *(void *)v6;
      Swift::UInt v8 = *(void *)(v6 + 8);
      char v9 = *(unsigned char *)(v6 + 16);
      char v10 = *(unsigned char *)(v6 + 17);
      Hasher.init(_seed:)();
      if (v10 & 1) != 0 || (Hasher._combine(_:)(1uLL), Hasher._combine(_:)(v7), (v9))
      {
        Swift::UInt v11 = 0;
      }
      else
      {
        Hasher._combine(_:)(1uLL);
        Swift::UInt v11 = v8;
      }
      Hasher._combine(_:)(v11);
      Swift::Int result = Hasher._finalize()();
      uint64_t v13 = ~(-1 << *(unsigned char *)(v3 + 32));
      unint64_t v14 = result & v13;
      unint64_t v15 = (result & (unint64_t)v13) >> 6;
      uint64_t v16 = *(void *)(v5 + 8 * v15);
      uint64_t v17 = 1 << (result & v13);
      uint64_t v18 = *(void *)(v3 + 48);
      if ((v17 & v16) != 0)
      {
        do
        {
          uint64_t v23 = v18 + 24 * v14;
          if (*(unsigned char *)(v23 + 17))
          {
            if (v10) {
              goto LABEL_3;
            }
          }
          else
          {
            if (*(void *)v23 == v7) {
              char v24 = v10;
            }
            else {
              char v24 = 1;
            }
            if ((v24 & 1) == 0)
            {
              if (*(unsigned char *)(v23 + 16))
              {
                if (v9) {
                  goto LABEL_3;
                }
              }
              else if ((v9 & 1) == 0 && *(void *)(v23 + 8) == v8)
              {
                goto LABEL_3;
              }
            }
          }
          unint64_t v14 = (v14 + 1) & v13;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v5 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
        }
        while ((v16 & (1 << v14)) != 0);
      }
      *(void *)(v5 + 8 * v15) = v17 | v16;
      uint64_t v19 = v18 + 24 * v14;
      *(void *)uint64_t v19 = v7;
      *(void *)(v19 + 8) = v8;
      *(unsigned char *)(v19 + 16) = v9;
      *(unsigned char *)(v19 + 17) = v10;
      uint64_t v20 = *(void *)(v3 + 16);
      BOOL v21 = __OFADD__(v20, 1);
      uint64_t v22 = v20 + 1;
      if (v21) {
        break;
      }
      *(void *)(v3 + 16) = v22;
LABEL_3:
      if (++v4 == v25) {
        return v3;
      }
    }
    __break(1u);
  }
  else
  {
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return result;
}

unint64_t sub_100097B4C(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    Swift::Int result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100003DD0(&qword_1000C58E8);
      Swift::Int result = static _SetStorage.allocate(capacity:)();
      uint64_t v3 = (unsigned char *)result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (!v2)
  {
LABEL_4:
    uint64_t v5 = *(void *)(v4 + 16);
    if (!v5) {
      return (unint64_t)v3;
    }
    goto LABEL_9;
  }
LABEL_8:
  swift_bridgeObjectRetain();
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
  Swift::Int result = swift_bridgeObjectRelease();
  if (!v5) {
    return (unint64_t)v3;
  }
LABEL_9:
  Swift::UInt v7 = v3 + 56;
  if ((v1 & 0xC000000000000001) == 0)
  {
    uint64_t v20 = 0;
    unint64_t v21 = v1 + 32;
    uint64_t v22 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (1)
    {
      if (v20 == v22) {
        goto LABEL_35;
      }
      Swift::UInt v25 = *(void *)(v21 + 8 * v20);
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v25);
      Swift::Int result = Hasher._finalize()();
      uint64_t v26 = -1 << v3[32];
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      uint64_t v29 = *(void *)&v7[8 * (v27 >> 6)];
      uint64_t v30 = 1 << v27;
      uint64_t v31 = *((void *)v3 + 6);
      if (((1 << v27) & v29) == 0) {
        goto LABEL_23;
      }
      if (*(void *)(v31 + 8 * v27) != v25) {
        break;
      }
LABEL_25:
      if (++v20 == v5) {
        return (unint64_t)v3;
      }
    }
    uint64_t v32 = ~v26;
    while (1)
    {
      unint64_t v27 = (v27 + 1) & v32;
      unint64_t v28 = v27 >> 6;
      uint64_t v29 = *(void *)&v7[8 * (v27 >> 6)];
      uint64_t v30 = 1 << v27;
      if ((v29 & (1 << v27)) == 0) {
        break;
      }
      if (*(void *)(v31 + 8 * v27) == v25) {
        goto LABEL_25;
      }
    }
LABEL_23:
    *(void *)&v7[8 * v28] = v30 | v29;
    *(void *)(v31 + 8 * v27) = v25;
    uint64_t v23 = *((void *)v3 + 2);
    BOOL v9 = __OFADD__(v23, 1);
    uint64_t v24 = v23 + 1;
    if (v9) {
      goto LABEL_36;
    }
    *((void *)v3 + 2) = v24;
    Swift::Int result = swift_retain();
    goto LABEL_25;
  }
  uint64_t v8 = 0;
  while (1)
  {
    Swift::Int result = specialized _ArrayBuffer._getElementSlowPath(_:)();
    BOOL v9 = __OFADD__(v8++, 1);
    if (v9) {
      break;
    }
    Swift::UInt v10 = result;
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v10);
    Swift::Int result = Hasher._finalize()();
    uint64_t v11 = -1 << v3[32];
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)&v7[8 * (v12 >> 6)];
    uint64_t v15 = 1 << v12;
    uint64_t v16 = *((void *)v3 + 6);
    if (((1 << v12) & v14) == 0) {
      goto LABEL_19;
    }
    if (*(void *)(v16 + 8 * v12) == v10)
    {
LABEL_11:
      swift_unknownObjectRelease();
      if (v8 == v5) {
        return (unint64_t)v3;
      }
    }
    else
    {
      uint64_t v17 = ~v11;
      while (1)
      {
        unint64_t v12 = (v12 + 1) & v17;
        unint64_t v13 = v12 >> 6;
        uint64_t v14 = *(void *)&v7[8 * (v12 >> 6)];
        uint64_t v15 = 1 << v12;
        if ((v14 & (1 << v12)) == 0) {
          break;
        }
        if (*(void *)(v16 + 8 * v12) == v10) {
          goto LABEL_11;
        }
      }
LABEL_19:
      *(void *)&v7[8 * v13] = v15 | v14;
      *(void *)(v16 + 8 * v12) = v10;
      uint64_t v18 = *((void *)v3 + 2);
      BOOL v9 = __OFADD__(v18, 1);
      uint64_t v19 = v18 + 1;
      if (v9) {
        goto LABEL_34;
      }
      *((void *)v3 + 2) = v19;
      if (v8 == v5) {
        return (unint64_t)v3;
      }
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_100097E0C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100097E44@<X0>(uint64_t *a1@<X8>)
{
  return sub_100097720(*(void *)(v1 + 16), a1);
}

uint64_t sub_100097E4C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100097E84@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100097144(a1, *(void (**)(uint64_t *__return_ptr, uint64_t *))(v2 + 16));
  *a2 = result;
  return result;
}

uint64_t sub_100097EB0(uint64_t a1)
{
  return a1;
}

uint64_t sub_100097EDC(uint64_t a1)
{
  return a1;
}

uint64_t _s19InitializationErrorOMa()
{
  return sub_10003A4F0();
}

unint64_t sub_100097F20()
{
  unint64_t result = qword_1000C5F10[0];
  if (!qword_1000C5F10[0])
  {
    sub_100074ED0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000C5F10);
  }
  return result;
}

uint64_t sub_100097F78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 0);
}

uint64_t ToolInfoHeader.serializationVersion.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

unint64_t sub_100097F88()
{
  return 0xD000000000000014;
}

uint64_t sub_100097FA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result = sub_10009C6F4(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_100097FD4(uint64_t a1)
{
  unint64_t v2 = sub_10009819C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100098010(uint64_t a1)
{
  unint64_t v2 = sub_10009819C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ToolInfoHeader.init(from:)(void *a1)
{
  uint64_t v3 = sub_100003DD0(&qword_1000C5F98);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t)sub_100005090(a1, a1[3]);
  sub_10009819C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    uint64_t v7 = KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_100005128((uint64_t)a1);
  return v7;
}

unint64_t sub_10009819C()
{
  unint64_t result = qword_1000CE670;
  if (!qword_1000CE670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000CE670);
  }
  return result;
}

uint64_t sub_1000981F0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100003DD0(&qword_1000C5F98);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005090(a1, a1[3]);
  sub_10009819C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100005128((uint64_t)a1);
  }
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_100005128((uint64_t)a1);
  *a2 = v9;
  return result;
}

uint64_t ToolInfoV0.serializationVersion.getter()
{
  return *(void *)v0;
}

void *ToolInfoV0.command.getter@<X0>(void *a1@<X8>)
{
  return sub_100098360((void *)(v1 + 8), a1);
}

void *sub_100098360(void *a1, void *a2)
{
  return initializeWithCopy for CommandInfoV0(a2, a1);
}

uint64_t ToolInfoV0.command.setter(uint64_t a1)
{
  return sub_100098378(a1, v1 + 8);
}

uint64_t sub_100098378(uint64_t a1, uint64_t a2)
{
  return assignWithTake for CommandInfoV0(a2, a1);
}

Swift::String_optional (__swiftcall *ToolInfoV0.command.modify())(Swift::String argument)
{
  return String.init(argument:);
}

__n128 ToolInfoV0.init(command:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 16);
  *(void *)a2 = 0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)a1;
  *(void *)(a2 + 24) = v2;
  long long v3 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 48) = v3;
  __n128 result = *(__n128 *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 72);
  *(__n128 *)(a2 + 64) = result;
  *(_OWORD *)(a2 + 80) = v5;
  return result;
}

uint64_t ToolInfoV0.hash(into:)(uint64_t a1)
{
  Hasher._combine(_:)(*v1);
  sub_10008160C((uint64_t)v1);
  CommandInfoV0.hash(into:)(a1);

  return sub_1000816E8((uint64_t)v1);
}

uint64_t static ToolInfoV0.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 == *(void *)a2)
  {
    long long v2 = *(_OWORD *)(a1 + 56);
    v10[2] = *(_OWORD *)(a1 + 40);
    v10[3] = v2;
    v10[4] = *(_OWORD *)(a1 + 72);
    uint64_t v11 = *(void *)(a1 + 88);
    long long v3 = *(_OWORD *)(a1 + 24);
    v10[0] = *(_OWORD *)(a1 + 8);
    v10[1] = v3;
    long long v4 = *(_OWORD *)(a2 + 56);
    v8[2] = *(_OWORD *)(a2 + 40);
    _OWORD v8[3] = v4;
    v8[4] = *(_OWORD *)(a2 + 72);
    uint64_t v9 = *(void *)(a2 + 88);
    long long v5 = *(_OWORD *)(a2 + 24);
    v8[0] = *(_OWORD *)(a2 + 8);
    v8[1] = v5;
    char v6 = _s22ArgumentParserToolInfo07CommandD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v10, (uint64_t)v8);
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_100098500()
{
  if (*v0) {
    return 0x646E616D6D6F63;
  }
  else {
    return 0xD000000000000014;
  }
}

uint64_t sub_100098540@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10009CE94(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100098568(uint64_t a1)
{
  unint64_t v2 = sub_10009CDEC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000985A4(uint64_t a1)
{
  unint64_t v2 = sub_10009CDEC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ToolInfoV0.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100003DD0(&qword_1000C5FA0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100005090(a1, a1[3]);
  sub_10009CDEC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v13) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    long long v9 = *(_OWORD *)(v3 + 56);
    long long v15 = *(_OWORD *)(v3 + 40);
    long long v16 = v9;
    long long v17 = *(_OWORD *)(v3 + 72);
    uint64_t v18 = *(void *)(v3 + 88);
    long long v10 = *(_OWORD *)(v3 + 24);
    long long v13 = *(_OWORD *)(v3 + 8);
    long long v14 = v10;
    v12[15] = 1;
    sub_10009CE40();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int ToolInfoV0.hashValue.getter()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(*(void *)v0);
  long long v1 = *(_OWORD *)(v0 + 56);
  long long v7 = *(_OWORD *)(v0 + 40);
  long long v8 = v1;
  long long v9 = *(_OWORD *)(v0 + 72);
  uint64_t v10 = *(void *)(v0 + 88);
  long long v2 = *(_OWORD *)(v0 + 24);
  long long v5 = *(_OWORD *)(v0 + 8);
  long long v6 = v2;
  sub_10008160C(v0);
  CommandInfoV0.hash(into:)((uint64_t)v4);
  sub_1000816E8(v0);
  return Hasher._finalize()();
}

double ToolInfoV0.init(from:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_10009CF84(a1, (uint64_t *)v8);
  if (!v2)
  {
    long long v5 = v8[3];
    a2[2] = v8[2];
    a2[3] = v5;
    long long v6 = v8[5];
    a2[4] = v8[4];
    a2[5] = v6;
    double result = *(double *)v8;
    long long v7 = v8[1];
    *a2 = v8[0];
    a2[1] = v7;
  }
  return result;
}

uint64_t sub_100098850(void *a1)
{
  return ToolInfoV0.encode(to:)(a1);
}

Swift::Int sub_100098868()
{
  Swift::UInt v2 = *v0;
  Swift::UInt v1 = v0[1];
  Swift::UInt v4 = v0[2];
  Swift::UInt v3 = v0[3];
  Swift::UInt v5 = v0[5];
  Swift::UInt v6 = v0[7];
  Swift::UInt v12 = v0[6];
  Swift::UInt v13 = v0[4];
  Swift::UInt v7 = v0[9];
  Swift::UInt v11 = v0[8];
  Swift::UInt v8 = v0[10];
  Swift::UInt v9 = v0[11];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v2);
  Swift::UInt v15 = v1;
  Swift::UInt v16 = v4;
  Swift::UInt v17 = v3;
  Swift::UInt v18 = v13;
  Swift::UInt v19 = v5;
  Swift::UInt v20 = v12;
  Swift::UInt v21 = v6;
  Swift::UInt v22 = v11;
  Swift::UInt v23 = v7;
  Swift::UInt v24 = v8;
  Swift::UInt v25 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  CommandInfoV0.hash(into:)((uint64_t)v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_10009898C(uint64_t a1)
{
  Hasher._combine(_:)(*v1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  CommandInfoV0.hash(into:)(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100098AB4()
{
  Swift::UInt v2 = *v0;
  Swift::UInt v1 = v0[1];
  Swift::UInt v4 = v0[2];
  Swift::UInt v3 = v0[3];
  Swift::UInt v5 = v0[5];
  Swift::UInt v6 = v0[7];
  Swift::UInt v12 = v0[6];
  Swift::UInt v13 = v0[4];
  Swift::UInt v7 = v0[9];
  Swift::UInt v11 = v0[8];
  Swift::UInt v8 = v0[10];
  Swift::UInt v9 = v0[11];
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v2);
  Swift::UInt v15 = v1;
  Swift::UInt v16 = v4;
  Swift::UInt v17 = v3;
  Swift::UInt v18 = v13;
  Swift::UInt v19 = v5;
  Swift::UInt v20 = v12;
  Swift::UInt v21 = v6;
  Swift::UInt v22 = v11;
  Swift::UInt v23 = v7;
  Swift::UInt v24 = v8;
  Swift::UInt v25 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  CommandInfoV0.hash(into:)((uint64_t)v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_100098BD4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  long long v3 = *(_OWORD *)(a1 + 7);
  v12[2] = *(_OWORD *)(a1 + 5);
  v12[3] = v3;
  v12[4] = *(_OWORD *)(a1 + 9);
  uint64_t v13 = a1[11];
  long long v4 = *(_OWORD *)(a1 + 3);
  v12[0] = *(_OWORD *)(a1 + 1);
  v12[1] = v4;
  uint64_t v5 = *a2;
  long long v6 = *(_OWORD *)(a2 + 3);
  v14[0] = *(_OWORD *)(a2 + 1);
  v14[1] = v6;
  long long v7 = *(_OWORD *)(a2 + 5);
  long long v8 = *(_OWORD *)(a2 + 7);
  long long v9 = *(_OWORD *)(a2 + 9);
  uint64_t v15 = a2[11];
  v14[3] = v8;
  v14[4] = v9;
  v14[2] = v7;
  if (v2 == v5) {
    char v10 = _s22ArgumentParserToolInfo07CommandD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v12, (uint64_t)v14);
  }
  else {
    char v10 = 0;
  }
  return v10 & 1;
}

uint64_t CommandInfoV0.superCommands.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *Swift::UInt v1 = a1;
  return result;
}

uint64_t ArgumentInfoV0.sectionTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ArgumentInfoV0.sectionTitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t CommandInfoV0.abstract.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CommandInfoV0.abstract.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.isOptional.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t CommandInfoV0.discussion.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CommandInfoV0.discussion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.preferredName.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t CommandInfoV0.defaultSubcommand.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CommandInfoV0.defaultSubcommand.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return result;
}

Swift::String_optional (__swiftcall *CommandInfoV0.defaultSubcommand.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t CommandInfoV0.subcommands.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CommandInfoV0.subcommands.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 72) = a1;
  return result;
}

Swift::String_optional (__swiftcall *CommandInfoV0.subcommands.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t CommandInfoV0.arguments.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CommandInfoV0.arguments.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = a1;
  return result;
}

uint64_t CommandInfoV0.init(superCommands:commandName:abstract:discussion:defaultSubcommand:subcommands:arguments:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, unint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v17 = a1;
  if (!*(void *)(a1 + 16))
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = 0;
  }
  unint64_t v19 = a10;
  if ((a5 & 0x2000000000000000) != 0) {
    uint64_t v20 = HIBYTE(a5) & 0xF;
  }
  else {
    uint64_t v20 = a4 & 0xFFFFFFFFFFFFLL;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v20)
  {
    swift_bridgeObjectRelease();
    a4 = 0;
    a5 = 0;
  }
  uint64_t v21 = a11;
  if ((a7 & 0x2000000000000000) != 0) {
    uint64_t v22 = HIBYTE(a7) & 0xF;
  }
  else {
    uint64_t v22 = a6 & 0xFFFFFFFFFFFFLL;
  }
  swift_bridgeObjectRetain();
  if (v22)
  {
    uint64_t v23 = a12;
    if (!a10) {
      goto LABEL_18;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    a6 = 0;
    a7 = 0;
    uint64_t v23 = a12;
    if (!a10) {
      goto LABEL_18;
    }
  }
  uint64_t v24 = HIBYTE(a10) & 0xF;
  if ((a10 & 0x2000000000000000) == 0) {
    uint64_t v24 = a8 & 0xFFFFFFFFFFFFLL;
  }
  if (v24)
  {
LABEL_18:
    swift_bridgeObjectRetain();
    if (*(void *)(a11 + 16)) {
      goto LABEL_19;
    }
LABEL_22:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v21 = 0;
    if (*(void *)(v23 + 16)) {
      goto LABEL_20;
    }
LABEL_23:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v23 = 0;
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a8 = 0;
  unint64_t v19 = 0;
  if (!*(void *)(a11 + 16)) {
    goto LABEL_22;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  if (!*(void *)(v23 + 16)) {
    goto LABEL_23;
  }
LABEL_20:
  swift_bridgeObjectRetain();
LABEL_24:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease_n();
  *a9 = v17;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = v19;
  a9[9] = v21;
  a9[10] = v23;
  return result;
}

void CommandInfoV0.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  if (*v1)
  {
    Hasher._combine(_:)(1u);
    Swift::UInt v4 = *(void *)(v3 + 16);
    Hasher._combine(_:)(v4);
    if (v4)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = v3 + 40;
      do
      {
        swift_bridgeObjectRetain();
        String.hash(into:)();
        swift_bridgeObjectRelease();
        v5 += 16;
        --v4;
      }
      while (v4);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  if (v1[4])
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    if (v1[6]) {
      goto LABEL_9;
    }
  }
  else
  {
    Hasher._combine(_:)(0);
    if (v1[6])
    {
LABEL_9:
      Hasher._combine(_:)(1u);
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      if (v1[8]) {
        goto LABEL_10;
      }
      goto LABEL_22;
    }
  }
  Hasher._combine(_:)(0);
  if (v1[8])
  {
LABEL_10:
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t v6 = v1[9];
    if (v6) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  Hasher._combine(_:)(0);
  uint64_t v6 = v1[9];
  if (v6)
  {
LABEL_11:
    Hasher._combine(_:)(1u);
    Swift::UInt v7 = *(void *)(v6 + 16);
    Hasher._combine(_:)(v7);
    if (v7)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = 32;
      do
      {
        long long v9 = *(_OWORD *)(v6 + v8 + 16);
        v24[0] = *(_OWORD *)(v6 + v8);
        v24[1] = v9;
        long long v10 = *(_OWORD *)(v6 + v8 + 32);
        long long v11 = *(_OWORD *)(v6 + v8 + 48);
        long long v12 = *(_OWORD *)(v6 + v8 + 64);
        uint64_t v25 = *(void *)(v6 + v8 + 80);
        v24[3] = v11;
        v24[4] = v12;
        _OWORD v24[2] = v10;
        sub_10009D220((uint64_t)v24);
        CommandInfoV0.hash(into:)(a1);
        sub_1000547D0((uint64_t)v24);
        v8 += 88;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
    }
    uint64_t v13 = v1[10];
    if (v13) {
      goto LABEL_16;
    }
LABEL_24:
    Hasher._combine(_:)(0);
    return;
  }
LABEL_23:
  Hasher._combine(_:)(0);
  uint64_t v13 = v1[10];
  if (!v13) {
    goto LABEL_24;
  }
LABEL_16:
  Hasher._combine(_:)(1u);
  Swift::UInt v14 = *(void *)(v13 + 16);
  Hasher._combine(_:)(v14);
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = 32;
    do
    {
      v22[0] = *(_OWORD *)(v13 + v15);
      long long v16 = *(_OWORD *)(v13 + v15 + 16);
      long long v17 = *(_OWORD *)(v13 + v15 + 32);
      long long v18 = *(_OWORD *)(v13 + v15 + 64);
      v22[3] = *(_OWORD *)(v13 + v15 + 48);
      _OWORD v22[4] = v18;
      v22[1] = v16;
      void v22[2] = v17;
      long long v19 = *(_OWORD *)(v13 + v15 + 80);
      long long v20 = *(_OWORD *)(v13 + v15 + 96);
      long long v21 = *(_OWORD *)(v13 + v15 + 112);
      uint64_t v23 = *(void *)(v13 + v15 + 128);
      _OWORD v22[6] = v20;
      v22[7] = v21;
      v22[5] = v19;
      sub_10009D2A8((uint64_t)v22);
      ArgumentInfoV0.hash(into:)(a1);
      sub_10009D33C((uint64_t)v22);
      v15 += 136;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_100099410(char a1)
{
  unint64_t result = 0x6D6F437265707573;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4E646E616D6D6F63;
      break;
    case 2:
      unint64_t result = 0x7463617274736261;
      break;
    case 3:
      unint64_t result = 0x6973737563736964;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
      unint64_t result = 0x616D6D6F63627573;
      break;
    case 6:
      unint64_t result = 0x746E656D75677261;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_100099520()
{
  return sub_100099410(*v0);
}

uint64_t sub_100099528@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10009D478(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100099550(uint64_t a1)
{
  unint64_t v2 = sub_10009D3D0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10009958C(uint64_t a1)
{
  unint64_t v2 = sub_10009D3D0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t CommandInfoV0.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100003DD0(&qword_1000C5FB0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005090(a1, a1[3]);
  sub_10009D3D0();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  sub_10002B998(v3, (uint64_t)v15, &qword_1000C5FB8);
  sub_10002B998((uint64_t)v15, (uint64_t)v12, &qword_1000C5FB8);
  char v11 = 0;
  sub_100003DD0(&qword_1000C5FC0);
  sub_1000A0DB0(&qword_1000C5FC8);
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  if (!v2)
  {
    v12[0] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v12[0] = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v12[0] = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v12[0] = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    sub_10002B998(v3 + 72, (uint64_t)v14, &qword_1000C5FD0);
    sub_10002B998((uint64_t)v14, (uint64_t)v12, &qword_1000C5FD0);
    char v11 = 5;
    sub_100003DD0(&qword_1000C5FD8);
    sub_1000A0EBC(&qword_1000C5FE0, &qword_1000C5FD8, (void (*)(void))sub_10009CE40);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    sub_10002B998(v3 + 80, (uint64_t)v13, &qword_1000C5FE8);
    sub_10002B998((uint64_t)v13, (uint64_t)v12, &qword_1000C5FE8);
    char v11 = 6;
    sub_100003DD0(&qword_1000C5FF0);
    sub_1000A0EBC(&qword_1000C5FF8, &qword_1000C5FF0, (void (*)(void))sub_10009D424);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int CommandInfoV0.hashValue.getter()
{
  Hasher.init(_seed:)();
  CommandInfoV0.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

double CommandInfoV0.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10009D7C4(a1, v7);
  if (!v2)
  {
    long long v5 = v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v7[4];
    *(void *)(a2 + 80) = v8;
    double result = *(double *)v7;
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_1000999EC(void *a1)
{
  return CommandInfoV0.encode(to:)(a1);
}

Swift::Int sub_100099A3C()
{
  Hasher.init(_seed:)();
  CommandInfoV0.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

uint64_t sub_100099A78(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  void v7[2] = *(_OWORD *)(a1 + 32);
  _OWORD v7[3] = v2;
  v7[4] = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 80);
  long long v3 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  v9[2] = *(_OWORD *)(a2 + 32);
  v9[3] = v4;
  v9[4] = *(_OWORD *)(a2 + 64);
  uint64_t v10 = *(void *)(a2 + 80);
  long long v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  return _s22ArgumentParserToolInfo07CommandD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v7, (uint64_t)v9) & 1;
}

ArgumentParserToolInfo::ArgumentInfoV0::NameInfoV0::KindV0_optional __swiftcall ArgumentInfoV0.NameInfoV0.KindV0.init(rawValue:)(Swift::String rawValue)
{
  v1._rawValue = &off_1000BF920;
  return (ArgumentParserToolInfo::ArgumentInfoV0::NameInfoV0::KindV0_optional)sub_10009E2E0(rawValue, v1);
}

uint64_t ArgumentInfoV0.NameInfoV0.KindV0.rawValue.getter(char a1)
{
  if (!a1) {
    return 1735290732;
  }
  if (a1 == 1) {
    return 0x74726F6873;
  }
  return 0xD000000000000012;
}

uint64_t sub_100099B54(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100099B60(*a1, *a2);
}

uint64_t sub_100099B60(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x74726F6873;
    }
    else {
      unint64_t v3 = 0xD000000000000012;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE500000000000000;
    }
    else {
      unint64_t v4 = 0x80000001000A9F00;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0x74726F6873;
      }
      else {
        unint64_t v6 = 0xD000000000000012;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE500000000000000;
      }
      else {
        unint64_t v7 = 0x80000001000A9F00;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE400000000000000;
    unint64_t v3 = 1735290732;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1735290732)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_100099C64(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xEA00000000006C61;
  uint64_t v3 = 0x6E6F697469736F70;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x6E6F6974706FLL;
    }
    else {
      uint64_t v5 = 1734437990;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE600000000000000;
    }
    else {
      unint64_t v6 = 0xE400000000000000;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  uint64_t v5 = 0x6E6F697469736F70;
  unint64_t v6 = 0xEA00000000006C61;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      uint64_t v3 = 0x6E6F6974706FLL;
    }
    else {
      uint64_t v3 = 1734437990;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xE600000000000000;
    }
    else {
      unint64_t v2 = 0xE400000000000000;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_100099D68@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &off_1000BF920;
  unint64_t result = sub_10009E2E0(*a1, v3);
  *a2 = result;
  return result;
}

void sub_100099DA0(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE400000000000000;
  unint64_t v4 = 0xE500000000000000;
  unint64_t v5 = 0x74726F6873;
  if (v2 != 1)
  {
    unint64_t v5 = 0xD000000000000012;
    unint64_t v4 = 0x80000001000A9F00;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 1735290732;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_100099DF8()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100099E58()
{
  return RawRepresentable<>.encode(to:)();
}

Swift::Int sub_100099EA8()
{
  return Hasher._finalize()();
}

uint64_t sub_100099F44()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100099FCC()
{
  return Hasher._finalize()();
}

uint64_t ArgumentInfoV0.kind.setter(uint64_t result)
{
  *Swift::OpaquePointer v1 = result;
  return result;
}

uint64_t ArgumentInfoV0.NameInfoV0.name.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t ArgumentInfoV0.NameInfoV0.hash(into:)()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10009A160()
{
  if (*v0) {
    return 1701667182;
  }
  else {
    return 1684957547;
  }
}

uint64_t sub_10009A184@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10009E04C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10009A1AC(uint64_t a1)
{
  unint64_t v2 = sub_10009DFA4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10009A1E8(uint64_t a1)
{
  unint64_t v2 = sub_10009DFA4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ArgumentInfoV0.NameInfoV0.encode(to:)(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  v12[1] = a4;
  uint64_t v7 = sub_100003DD0(&qword_1000C6008);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005090(a1, a1[3]);
  sub_10009DFA4();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v15 = a2;
  char v14 = 0;
  sub_10009DFF8();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v4)
  {
    char v13 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

Swift::Int ArgumentInfoV0.NameInfoV0.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t ArgumentInfoV0.NameInfoV0.init(from:)(void *a1)
{
  return sub_10009E120(a1);
}

uint64_t sub_10009A49C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10009E120(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_10009A4CC(void *a1)
{
  return ArgumentInfoV0.NameInfoV0.encode(to:)(a1, *(unsigned char *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16));
}

Swift::Int sub_10009A4EC()
{
  return ArgumentInfoV0.NameInfoV0.hashValue.getter();
}

uint64_t sub_10009A4F8()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10009A5B8()
{
  return Hasher._finalize()();
}

uint64_t sub_10009A67C(uint64_t a1, uint64_t a2)
{
  return _s22ArgumentParserToolInfo0aD2V0V04NamedE0V23__derived_struct_equalsySbAE_AEtFZ_0(*(unsigned char *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16));
}

ArgumentParserToolInfo::ArgumentInfoV0::KindV0_optional __swiftcall ArgumentInfoV0.KindV0.init(rawValue:)(Swift::String rawValue)
{
  v1._rawValue = &off_1000BF988;
  return (ArgumentParserToolInfo::ArgumentInfoV0::KindV0_optional)sub_10009E2E0(rawValue, v1);
}

uint64_t ArgumentInfoV0.KindV0.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x6E6F697469736F70;
  }
  if (a1 == 1) {
    return 0x6E6F6974706FLL;
  }
  return 1734437990;
}

uint64_t sub_10009A704(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100099C64(*a1, *a2);
}

unint64_t sub_10009A710@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &off_1000BF988;
  unint64_t result = sub_10009E2E0(*a1, v3);
  *a2 = result;
  return result;
}

void sub_10009A748(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEA00000000006C61;
  unint64_t v4 = 0xE600000000000000;
  uint64_t v5 = 0x6E6F6974706FLL;
  if (v2 != 1)
  {
    uint64_t v5 = 1734437990;
    unint64_t v4 = 0xE400000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6E6F697469736F70;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_10009A7A0()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10009A800()
{
  return RawRepresentable<>.encode(to:)();
}

Swift::Int sub_10009A850()
{
  return Hasher._finalize()();
}

uint64_t sub_10009A8EC()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10009A974()
{
  return Hasher._finalize()();
}

uint64_t ArgumentInfoV0.kind.getter()
{
  return *v0;
}

uint64_t ArgumentInfoV0.shouldDisplay.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ArgumentInfoV0.shouldDisplay.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.shouldDisplay.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t ArgumentInfoV0.isOptional.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t ArgumentInfoV0.isOptional.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

uint64_t ArgumentInfoV0.isRepeating.getter()
{
  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t ArgumentInfoV0.isRepeating.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 25) = result;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.isRepeating.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t ArgumentInfoV0.names.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ArgumentInfoV0.names.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t variable initialization expression of ArgumentInfoV0.preferredName()
{
  return 0;
}

uint64_t ArgumentInfoV0.preferredName.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ArgumentInfoV0.preferredName.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = swift_bridgeObjectRelease();
  v3[5] = a1;
  v3[6] = a2;
  v3[7] = a3;
  return result;
}

uint64_t ArgumentInfoV0.allValues.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ArgumentInfoV0.allValues.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 96) = a1;
  return result;
}

uint64_t ArgumentInfoV0.abstract.getter()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ArgumentInfoV0.abstract.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 104) = a1;
  *(void *)(v2 + 112) = a2;
  return result;
}

uint64_t ArgumentInfoV0.discussion.getter()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ArgumentInfoV0.discussion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = a2;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.discussion.modify())(Swift::String argument)
{
  return String.init(argument:);
}

__n128 ArgumentInfoV0.init(kind:shouldDisplay:sectionTitle:isOptional:isRepeating:names:preferredName:valueName:defaultValue:allValues:abstract:discussion:)@<Q0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X2>, unint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t a13, uint64_t a14, unint64_t a15, uint64_t a16, uint64_t a17, unint64_t a18, uint64_t a19, unint64_t a20)
{
  uint64_t v20 = a7;
  unint64_t v23 = a15;
  uint64_t v25 = a12;
  unint64_t v24 = a13;
  if (a7)
  {
    uint64_t v26 = *(void *)(a7 + 16);
    swift_bridgeObjectRetain();
    if (!v26)
    {
      swift_bridgeObjectRelease();
      uint64_t v20 = 0;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  uint64_t v27 = a16;
  uint64_t v28 = a14;
  if (!a13) {
    goto LABEL_9;
  }
  uint64_t v29 = HIBYTE(a13) & 0xF;
  if ((a13 & 0x2000000000000000) == 0) {
    uint64_t v29 = a12 & 0xFFFFFFFFFFFFLL;
  }
  if (!v29)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v25 = 0;
    unint64_t v24 = 0;
  }
  else
  {
LABEL_9:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  unint64_t v30 = a18;
  uint64_t v51 = v25;
  if (a15)
  {
    unint64_t v31 = a4;
    uint64_t v32 = HIBYTE(a15) & 0xF;
    if ((a15 & 0x2000000000000000) == 0) {
      uint64_t v32 = a14 & 0xFFFFFFFFFFFFLL;
    }
    if (!v32)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v28 = 0;
      unint64_t v23 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    unint64_t v31 = a4;
  }
  swift_bridgeObjectRetain();
LABEL_18:
  unint64_t v33 = a20;
  uint64_t v50 = v28;
  if (a16)
  {
    uint64_t v34 = *(void *)(a16 + 16);
    swift_bridgeObjectRetain();
    if (!v34)
    {
      swift_bridgeObjectRelease();
      uint64_t v27 = 0;
    }
    uint64_t v35 = a19;
    if (!a18) {
      goto LABEL_27;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = a19;
    if (!a18) {
      goto LABEL_27;
    }
  }
  uint64_t v36 = HIBYTE(a18) & 0xF;
  if ((a18 & 0x2000000000000000) == 0) {
    uint64_t v36 = a17 & 0xFFFFFFFFFFFFLL;
  }
  if (!v36)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v43 = 0;
    unint64_t v30 = 0;
    uint64_t v37 = a10;
    if (!a20) {
      goto LABEL_33;
    }
    goto LABEL_30;
  }
LABEL_27:
  uint64_t v43 = a17;
  swift_bridgeObjectRetain();
  uint64_t v37 = a10;
  if (!a20) {
    goto LABEL_33;
  }
LABEL_30:
  uint64_t v38 = HIBYTE(a20) & 0xF;
  if ((a20 & 0x2000000000000000) == 0) {
    uint64_t v38 = v35 & 0xFFFFFFFFFFFFLL;
  }
  if (!v38)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v35 = 0;
    unint64_t v33 = 0;
    goto LABEL_35;
  }
LABEL_33:
  swift_bridgeObjectRetain();
LABEL_35:
  LOBYTE(v52) = a1;
  BYTE1(v52) = a2 & 1;
  *((void *)&v52 + 1) = a3;
  v53.n128_u64[0] = v31;
  v53.n128_u8[8] = a5 & 1;
  v53.n128_u8[9] = a6 & 1;
  *(void *)&long long v54 = v20;
  *((void *)&v54 + 1) = a8;
  *(void *)&long long v55 = v37;
  *((void *)&v55 + 1) = a11;
  *(void *)&long long v56 = v51;
  *((void *)&v56 + 1) = v24;
  *(void *)&long long v57 = v50;
  *((void *)&v57 + 1) = v23;
  *(void *)&long long v58 = v27;
  *((void *)&v58 + 1) = v43;
  *(void *)&long long v59 = v30;
  *((void *)&v59 + 1) = v35;
  unint64_t v60 = v33;
  sub_10009D2A8((uint64_t)&v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10009D33C((uint64_t)&v52);
  long long v39 = v59;
  *(_OWORD *)(a9 + 96) = v58;
  *(_OWORD *)(a9 + 112) = v39;
  *(void *)(a9 + 128) = v60;
  long long v40 = v55;
  *(_OWORD *)(a9 + 32) = v54;
  *(_OWORD *)(a9 + 48) = v40;
  long long v41 = v57;
  *(_OWORD *)(a9 + 64) = v56;
  *(_OWORD *)(a9 + 80) = v41;
  __n128 result = v53;
  *(_OWORD *)a9 = v52;
  *(__n128 *)(a9 + 16) = result;
  return result;
}

void ArgumentInfoV0.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(*(unsigned char *)(v2 + 1) & 1);
  if (*(void *)(v2 + 16))
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Hasher._combine(_:)(*(unsigned char *)(v2 + 24) & 1);
  Hasher._combine(_:)(*(unsigned char *)(v2 + 25) & 1);
  uint64_t v4 = *(void *)(v2 + 32);
  if (v4)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    sub_10009C5F8(a1, v4);
    swift_bridgeObjectRelease();
    if (*(void *)(v2 + 56)) {
      goto LABEL_6;
    }
  }
  else
  {
    Hasher._combine(_:)(0);
    if (*(void *)(v2 + 56))
    {
LABEL_6:
      Hasher._combine(_:)(1u);
      swift_bridgeObjectRetain_n();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease_n();
      if (*(void *)(v2 + 72)) {
        goto LABEL_7;
      }
      goto LABEL_20;
    }
  }
  Hasher._combine(_:)(0);
  if (*(void *)(v2 + 72))
  {
LABEL_7:
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    if (*(void *)(v2 + 88)) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  Hasher._combine(_:)(0);
  if (*(void *)(v2 + 88))
  {
LABEL_8:
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t v5 = *(void *)(v2 + 96);
    if (v5) {
      goto LABEL_9;
    }
LABEL_22:
    Hasher._combine(_:)(0);
    if (*(void *)(v2 + 112)) {
      goto LABEL_14;
    }
LABEL_23:
    Hasher._combine(_:)(0);
    if (*(void *)(v2 + 128)) {
      goto LABEL_15;
    }
LABEL_24:
    Hasher._combine(_:)(0);
    return;
  }
LABEL_21:
  Hasher._combine(_:)(0);
  uint64_t v5 = *(void *)(v2 + 96);
  if (!v5) {
    goto LABEL_22;
  }
LABEL_9:
  Hasher._combine(_:)(1u);
  Swift::UInt v6 = *(void *)(v5 + 16);
  Hasher._combine(_:)(v6);
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = v5 + 40;
    do
    {
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      v7 += 16;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
  }
  if (!*(void *)(v2 + 112)) {
    goto LABEL_23;
  }
LABEL_14:
  Hasher._combine(_:)(1u);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  if (!*(void *)(v2 + 128)) {
    goto LABEL_24;
  }
LABEL_15:
  Hasher._combine(_:)(1u);
  swift_bridgeObjectRetain();
  String.hash(into:)();

  swift_bridgeObjectRelease();
}

uint64_t sub_10009B2D0(char a1)
{
  uint64_t result = 1684957547;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6944646C756F6873;
      break;
    case 2:
      uint64_t result = 0x546E6F6974636573;
      break;
    case 3:
      uint64_t result = 0x6E6F6974704F7369;
      break;
    case 4:
      uint64_t result = 0x7461657065527369;
      break;
    case 5:
      uint64_t result = 0x73656D616ELL;
      break;
    case 6:
      uint64_t result = 0x6572726566657270;
      break;
    case 7:
      uint64_t result = 0x6D614E65756C6176;
      break;
    case 8:
      uint64_t result = 0x56746C7561666564;
      break;
    case 9:
      uint64_t result = 0x65756C61566C6C61;
      break;
    case 10:
      uint64_t result = 0x7463617274736261;
      break;
    case 11:
      uint64_t result = 0x6973737563736964;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10009B484()
{
  return sub_10009B2D0(*v0);
}

uint64_t sub_10009B48C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10009E424(a1, a2);
  *a3 = result;
  return result;
}

void sub_10009B4B4(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_10009B4C0(uint64_t a1)
{
  unint64_t v2 = sub_10009E328();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10009B4FC(uint64_t a1)
{
  unint64_t v2 = sub_10009E328();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ArgumentInfoV0.encode(to:)(void *a1)
{
  unint64_t v3 = v1;
  uint64_t v5 = sub_100003DD0(&qword_1000C6018);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_100005090(a1, a1[3]);
  sub_10009E328();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11[0] = *v3;
  char v12 = 0;
  sub_10009E37C();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v11[0] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[0] = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v11[0] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[0] = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    sub_10002B998((uint64_t)(v3 + 32), (uint64_t)v15, &qword_1000C6028);
    sub_10002B998((uint64_t)v15, (uint64_t)v11, &qword_1000C6028);
    char v12 = 5;
    sub_100003DD0(&qword_1000C6030);
    sub_1000A0EBC(&qword_1000C6038, &qword_1000C6030, (void (*)(void))sub_10009E3D0);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    sub_10002B998((uint64_t)(v3 + 40), (uint64_t)v14, &qword_1000C6048);
    sub_10002B998((uint64_t)v14, (uint64_t)v11, &qword_1000C6048);
    char v12 = 6;
    sub_10009E3D0();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    v11[0] = 7;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v11[0] = 8;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    sub_10002B998((uint64_t)(v3 + 96), (uint64_t)v13, &qword_1000C5FB8);
    sub_10002B998((uint64_t)v13, (uint64_t)v11, &qword_1000C5FB8);
    char v12 = 9;
    sub_100003DD0(&qword_1000C5FC0);
    sub_1000A0DB0(&qword_1000C5FC8);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    v11[0] = 10;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v11[0] = 11;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int ArgumentInfoV0.hashValue.getter()
{
  Hasher.init(_seed:)();
  ArgumentInfoV0.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

__n128 ArgumentInfoV0.init(from:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10009E990(a1, (uint64_t)v8);
  if (!v2)
  {
    long long v5 = v8[7];
    *(_OWORD *)(a2 + 96) = v8[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(void *)(a2 + 128) = v9;
    long long v6 = v8[3];
    *(_OWORD *)(a2 + 32) = v8[2];
    *(_OWORD *)(a2 + 48) = v6;
    long long v7 = v8[5];
    *(_OWORD *)(a2 + 64) = v8[4];
    *(_OWORD *)(a2 + 80) = v7;
    __n128 result = (__n128)v8[1];
    *(_OWORD *)a2 = v8[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_10009BA08(void *a1)
{
  return ArgumentInfoV0.encode(to:)(a1);
}

Swift::Int sub_10009BA60()
{
  Hasher.init(_seed:)();
  ArgumentInfoV0.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

uint64_t sub_10009BA9C(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 112);
  v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v2;
  uint64_t v12 = *(void *)(a1 + 128);
  long long v3 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v3;
  long long v4 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v4;
  long long v5 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v5;
  long long v6 = *(_OWORD *)(a2 + 112);
  v13[6] = *(_OWORD *)(a2 + 96);
  v13[7] = v6;
  uint64_t v14 = *(void *)(a2 + 128);
  long long v7 = *(_OWORD *)(a2 + 48);
  void v13[2] = *(_OWORD *)(a2 + 32);
  uint64_t v13[3] = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  _OWORD v13[4] = *(_OWORD *)(a2 + 64);
  v13[5] = v8;
  long long v9 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v9;
  return _s22ArgumentParserToolInfo0aD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((unsigned __int8 *)v11, (uint64_t)v13) & 1;
}

uint64_t sub_10009BB20(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  long long v3 = (uint64_t *)(a2 + 48);
  long long v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v7 = *(v4 - 1);
    uint64_t v6 = *v4;
    int v8 = *((unsigned __int8 *)v4 - 16);
    int v9 = *((unsigned __int8 *)v3 - 16);
    uint64_t v11 = *(v3 - 1);
    uint64_t v10 = *v3;
    v3 += 3;
    v4 += 3;
    if (v8 == 1) {
      unint64_t v12 = 0x74726F6873;
    }
    else {
      unint64_t v12 = 0xD000000000000012;
    }
    unint64_t v13 = 0x80000001000A9F00;
    if (v8 == 1) {
      unint64_t v13 = 0xE500000000000000;
    }
    if (v8) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = 1735290732;
    }
    if (v8) {
      unint64_t v15 = v13;
    }
    else {
      unint64_t v15 = 0xE400000000000000;
    }
    unint64_t v16 = 0x80000001000A9F00;
    if (v9 == 1) {
      unint64_t v17 = 0x74726F6873;
    }
    else {
      unint64_t v17 = 0xD000000000000012;
    }
    if (v9 == 1) {
      unint64_t v16 = 0xE500000000000000;
    }
    if (v9) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 1735290732;
    }
    if (v9) {
      unint64_t v19 = v16;
    }
    else {
      unint64_t v19 = 0xE400000000000000;
    }
    if (v14 == v18 && v15 == v19)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease_n();
      goto LABEL_33;
    }
    char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0) {
      break;
    }
LABEL_33:
    if (v7 == v11 && v6 == v10)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v5 & 1) == 0) {
        return 0;
      }
    }
    if (!--v2) {
      return 1;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10009BD24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t v3 = 0;
  uint64_t v4 = a1 + 32;
  uint64_t v5 = a2 + 32;
  uint64_t v50 = a1 + 32;
  uint64_t v51 = *(void *)(a1 + 16);
  uint64_t v49 = a2 + 32;
  while (1)
  {
    uint64_t v54 = v3;
    uint64_t v6 = 88 * v3;
    uint64_t v7 = *(void **)(v4 + 88 * v3);
    uint64_t v8 = *(void *)(v4 + 88 * v3 + 8);
    uint64_t v9 = *(void *)(v4 + 88 * v3 + 24);
    uint64_t v67 = *(void *)(v4 + 88 * v3 + 16);
    uint64_t v10 = *(void *)(v4 + 88 * v3 + 40);
    uint64_t v62 = *(void *)(v4 + v6 + 32);
    uint64_t v12 = *(void *)(v4 + v6 + 48);
    uint64_t v11 = *(void *)(v4 + v6 + 56);
    uint64_t v13 = *(void *)(v4 + v6 + 64);
    uint64_t v14 = *(void *)(v4 + v6 + 72);
    uint64_t v59 = *(void *)(v4 + v6 + 80);
    unint64_t v15 = (void *)(v5 + v6);
    unint64_t v16 = (void *)*v15;
    uint64_t v17 = v15[3];
    uint64_t v68 = v15[2];
    uint64_t v64 = v15[4];
    long long v65 = (void *)*v15;
    uint64_t v52 = v11;
    uint64_t v53 = v15[5];
    uint64_t v63 = v15[6];
    uint64_t v55 = v15[7];
    uint64_t v57 = v15[8];
    uint64_t v58 = v15[9];
    uint64_t v56 = v15[10];
    long long v66 = v7;
    uint64_t v60 = v15[1];
    if (!v7)
    {
      if (v16) {
        return 0;
      }
      goto LABEL_28;
    }
    if (!v16) {
      return 0;
    }
    uint64_t v18 = v7[2];
    if (v18 != v16[2]) {
      return 0;
    }
    if (v18 && v7 != v16)
    {
      uint64_t result = v7[4];
      if (result != v65[4] || v7[5] != v65[5])
      {
        uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
        if ((result & 1) == 0) {
          return 0;
        }
      }
      uint64_t v22 = v18 - 1;
      if (v18 != 1) {
        break;
      }
    }
LABEL_28:
    if ((v8 != v60 || v67 != v68) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      return 0;
    }
    uint64_t v61 = v12;
    if (v62)
    {
      uint64_t v26 = v63;
      if (!v64 || (v9 != v17 || v62 != v64) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        return 0;
      }
    }
    else
    {
      uint64_t v26 = v63;
      if (v64) {
        return 0;
      }
    }
    if (v61)
    {
      uint64_t v27 = v59;
      if (!v26) {
        return 0;
      }
      uint64_t v28 = v14;
      uint64_t v29 = v13;
      if ((v10 != v53 || v61 != v26) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        return 0;
      }
    }
    else
    {
      uint64_t v28 = v14;
      uint64_t v29 = v13;
      uint64_t v27 = v59;
      if (v26) {
        return 0;
      }
    }
    if (v29)
    {
      uint64_t v30 = v58;
      uint64_t v31 = v56;
      if (!v57 || (v52 != v55 || v29 != v57) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        return 0;
      }
    }
    else
    {
      uint64_t v30 = v58;
      uint64_t v31 = v56;
      if (v57) {
        return 0;
      }
    }
    if (v28)
    {
      if (!v30) {
        return 0;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v32 = sub_10009BD24(v28, v30);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v32 & 1) == 0)
      {
LABEL_76:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_80;
      }
      if (!v27)
      {
LABEL_66:
        if (v31) {
          goto LABEL_78;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        goto LABEL_71;
      }
    }
    else
    {
      if (v30) {
        return 0;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!v27) {
        goto LABEL_66;
      }
    }
    if (!v31) {
      goto LABEL_76;
    }
    uint64_t v33 = *(void *)(v27 + 16);
    if (v33 != *(void *)(v31 + 16))
    {
LABEL_78:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_79;
    }
    if (v33)
    {
      if (v27 != v31)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v34 = 32;
        while (1)
        {
          v69[0] = *(_OWORD *)(v27 + v34);
          long long v35 = *(_OWORD *)(v27 + v34 + 16);
          long long v36 = *(_OWORD *)(v27 + v34 + 32);
          long long v37 = *(_OWORD *)(v27 + v34 + 64);
          v69[3] = *(_OWORD *)(v27 + v34 + 48);
          v69[4] = v37;
          v69[1] = v35;
          v69[2] = v36;
          long long v38 = *(_OWORD *)(v27 + v34 + 80);
          long long v39 = *(_OWORD *)(v27 + v34 + 96);
          long long v40 = *(_OWORD *)(v27 + v34 + 112);
          uint64_t v70 = *(void *)(v27 + v34 + 128);
          v69[6] = v39;
          v69[7] = v40;
          v69[5] = v38;
          v71[0] = *(_OWORD *)(v31 + v34);
          long long v41 = *(_OWORD *)(v31 + v34 + 16);
          long long v42 = *(_OWORD *)(v31 + v34 + 32);
          long long v43 = *(_OWORD *)(v31 + v34 + 64);
          v71[3] = *(_OWORD *)(v31 + v34 + 48);
          v71[4] = v43;
          v71[1] = v41;
          v71[2] = v42;
          long long v44 = *(_OWORD *)(v31 + v34 + 80);
          long long v45 = *(_OWORD *)(v31 + v34 + 96);
          long long v46 = *(_OWORD *)(v31 + v34 + 112);
          uint64_t v72 = *(void *)(v31 + v34 + 128);
          v71[6] = v45;
          v71[7] = v46;
          v71[5] = v44;
          sub_10009D2A8((uint64_t)v69);
          sub_10009D2A8((uint64_t)v71);
          char v47 = _s22ArgumentParserToolInfo0aD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((unsigned __int8 *)v69, (uint64_t)v71);
          sub_10009D33C((uint64_t)v71);
          sub_10009D33C((uint64_t)v69);
          if ((v47 & 1) == 0) {
            break;
          }
          v34 += 136;
          if (!--v33)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            uint64_t v48 = v54;
            goto LABEL_72;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_79:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_80:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
LABEL_71:
    uint64_t v48 = v54;
LABEL_72:
    uint64_t v3 = v48 + 1;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    uint64_t v4 = v50;
    uint64_t v5 = v49;
    if (v3 == v51) {
      return result;
    }
  }
  unint64_t v23 = v65 + 7;
  unint64_t v24 = v66 + 7;
  while (v22)
  {
    uint64_t result = *(v24 - 1);
    if (result != *(v23 - 1) || *v24 != *v23)
    {
      uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((result & 1) == 0) {
        return 0;
      }
    }
    v23 += 2;
    v24 += 2;
    if (!--v22) {
      goto LABEL_28;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10009C4F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v14 = 1;
    }
    else
    {
      uint64_t v3 = a1 + 32;
      uint64_t v4 = a2 + 32;
      uint64_t v5 = v2 - 1;
      do
      {
        long long v6 = *(_OWORD *)(v3 + 112);
        v18[6] = *(_OWORD *)(v3 + 96);
        v18[7] = v6;
        uint64_t v19 = *(void *)(v3 + 128);
        long long v7 = *(_OWORD *)(v3 + 48);
        v18[2] = *(_OWORD *)(v3 + 32);
        v18[3] = v7;
        long long v8 = *(_OWORD *)(v3 + 80);
        void v18[4] = *(_OWORD *)(v3 + 64);
        v18[5] = v8;
        long long v9 = *(_OWORD *)(v3 + 16);
        v18[0] = *(_OWORD *)v3;
        v18[1] = v9;
        long long v10 = *(_OWORD *)(v4 + 112);
        v20[6] = *(_OWORD *)(v4 + 96);
        v20[7] = v10;
        uint64_t v21 = *(void *)(v4 + 128);
        long long v11 = *(_OWORD *)(v4 + 48);
        v20[2] = *(_OWORD *)(v4 + 32);
        _OWORD v20[3] = v11;
        long long v12 = *(_OWORD *)(v4 + 80);
        v20[4] = *(_OWORD *)(v4 + 64);
        v20[5] = v12;
        long long v13 = *(_OWORD *)(v4 + 16);
        v20[0] = *(_OWORD *)v4;
        v20[1] = v13;
        sub_10009D2A8((uint64_t)v18);
        sub_10009D2A8((uint64_t)v20);
        char v14 = _s22ArgumentParserToolInfo0aD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((unsigned __int8 *)v18, (uint64_t)v20);
        sub_10009D33C((uint64_t)v20);
        sub_10009D33C((uint64_t)v18);
        BOOL v16 = v5-- != 0;
        if ((v14 & 1) == 0) {
          break;
        }
        v3 += 136;
        v4 += 136;
      }
      while (v16);
    }
  }
  else
  {
    char v14 = 0;
  }
  return v14 & 1;
}

void sub_10009C5F8(uint64_t a1, uint64_t a2)
{
  Swift::UInt v3 = *(void *)(a2 + 16);
  Hasher._combine(_:)(v3);
  if (v3)
  {
    uint64_t v4 = a2 + 48;
    do
    {
      v4 += 24;
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease_n();
      --v3;
    }
    while (v3);
  }
}

uint64_t sub_10009C6F4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x80000001000A9F30)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t _s22ArgumentParserToolInfo0aD2V0V23__derived_struct_equalsySbAC_ACtFZ_0(unsigned __int8 *a1, uint64_t a2)
{
  int v3 = *a1;
  unint64_t v4 = 0xE600000000000000;
  uint64_t v5 = 0x6E6F6974706FLL;
  if (v3 != 1)
  {
    uint64_t v5 = 1734437990;
    unint64_t v4 = 0xE400000000000000;
  }
  if (*a1) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0x6E6F697469736F70;
  }
  if (v3) {
    unint64_t v7 = v4;
  }
  else {
    unint64_t v7 = 0xEA00000000006C61;
  }
  unint64_t v9 = 0xE600000000000000;
  uint64_t v10 = 0x6E6F6974706FLL;
  if (*(unsigned char *)a2 != 1)
  {
    uint64_t v10 = 1734437990;
    unint64_t v9 = 0xE400000000000000;
  }
  if (*(unsigned char *)a2) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0x6E6F697469736F70;
  }
  if (*(unsigned char *)a2) {
    unint64_t v12 = v9;
  }
  else {
    unint64_t v12 = 0xEA00000000006C61;
  }
  if (v6 == v11 && v7 == v12)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v13 & 1) == 0) {
      return result;
    }
  }
  if ((a1[1] ^ *(unsigned __int8 *)(a2 + 1))) {
    return 0;
  }
  uint64_t v15 = *((void *)a1 + 2);
  uint64_t v16 = *(void *)(a2 + 16);
  if (v15)
  {
    if (!v16) {
      return 0;
    }
    if (*((void *)a1 + 1) != *(void *)(a2 + 8) || v15 != v16)
    {
      char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
      uint64_t result = 0;
      if ((v17 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v16)
  {
    return 0;
  }
  if ((a1[24] ^ *(unsigned __int8 *)(a2 + 24)) & 1) != 0 || ((a1[25] ^ *(unsigned __int8 *)(a2 + 25))) {
    return 0;
  }
  uint64_t v18 = *(void *)(a2 + 32);
  if (*((void *)a1 + 4))
  {
    if (!v18) {
      return 0;
    }
    swift_bridgeObjectRetain();
    uint64_t v19 = swift_bridgeObjectRetain();
    char v20 = sub_10009BB20(v19, v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0) {
      return 0;
    }
  }
  else if (v18)
  {
    return 0;
  }
  uint64_t v21 = *((void *)a1 + 7);
  uint64_t v22 = *(void *)(a2 + 56);
  if (v21)
  {
    if (!v22) {
      return 0;
    }
    unint64_t v23 = 1735290732;
    int v24 = *((void *)a1 + 5);
    if (*((void *)a1 + 5))
    {
      if (v24 == 1) {
        unint64_t v25 = 0x74726F6873;
      }
      else {
        unint64_t v25 = 0xD000000000000012;
      }
      if (v24 == 1) {
        unint64_t v26 = 0xE500000000000000;
      }
      else {
        unint64_t v26 = 0x80000001000A9F00;
      }
    }
    else
    {
      unint64_t v26 = 0xE400000000000000;
      unint64_t v25 = 1735290732;
    }
    int v27 = *(void *)(a2 + 40);
    if (*(void *)(a2 + 40))
    {
      if (v27 == 1) {
        unint64_t v23 = 0x74726F6873;
      }
      else {
        unint64_t v23 = 0xD000000000000012;
      }
      if (v27 == 1) {
        unint64_t v28 = 0xE500000000000000;
      }
      else {
        unint64_t v28 = 0x80000001000A9F00;
      }
    }
    else
    {
      unint64_t v28 = 0xE400000000000000;
    }
    uint64_t v29 = *((void *)a1 + 6);
    uint64_t v30 = *(void *)(a2 + 48);
    if (v25 == v23 && v26 == v28)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v31 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 0;
      }
    }
    if (v29 == v30 && v21 == v22)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v32 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = 0;
      if ((v32 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v22)
  {
    return 0;
  }
  uint64_t v33 = *((void *)a1 + 9);
  uint64_t v34 = *(void *)(a2 + 72);
  if (v33)
  {
    if (!v34) {
      return 0;
    }
    if (*((void *)a1 + 8) != *(void *)(a2 + 64) || v33 != v34)
    {
      char v35 = _stringCompareWithSmolCheck(_:_:expecting:)();
      uint64_t result = 0;
      if ((v35 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v34)
  {
    return 0;
  }
  uint64_t v36 = *((void *)a1 + 11);
  uint64_t v37 = *(void *)(a2 + 88);
  if (v36)
  {
    if (!v37) {
      return 0;
    }
    if (*((void *)a1 + 10) != *(void *)(a2 + 80) || v36 != v37)
    {
      char v38 = _stringCompareWithSmolCheck(_:_:expecting:)();
      uint64_t result = 0;
      if ((v38 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v37)
  {
    return 0;
  }
  long long v39 = (void *)*((void *)a1 + 12);
  long long v40 = *(void **)(a2 + 96);
  if (v39)
  {
    if (!v40 || (sub_10005F640(v39, v40) & 1) == 0) {
      return 0;
    }
  }
  else if (v40)
  {
    return 0;
  }
  uint64_t v41 = *((void *)a1 + 14);
  uint64_t v42 = *(void *)(a2 + 112);
  if (!v41)
  {
    if (v42) {
      return 0;
    }
LABEL_93:
    uint64_t v44 = *((void *)a1 + 16);
    uint64_t v45 = *(void *)(a2 + 128);
    if (v44)
    {
      if (v45
        && (*((void *)a1 + 15) == *(void *)(a2 + 120) && v44 == v45
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
      {
        return 1;
      }
    }
    else if (!v45)
    {
      return 1;
    }
    return 0;
  }
  if (!v42) {
    return 0;
  }
  if (*((void *)a1 + 13) == *(void *)(a2 + 104) && v41 == v42) {
    goto LABEL_93;
  }
  char v43 = _stringCompareWithSmolCheck(_:_:expecting:)();
  uint64_t result = 0;
  if (v43) {
    goto LABEL_93;
  }
  return result;
}

uint64_t _s22ArgumentParserToolInfo07CommandD2V0V23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  if (v4)
  {
    if (!v5 || (sub_10005F640(v4, v5) & 1) == 0) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  BOOL v6 = *(void *)(a1 + 8) == *(void *)(a2 + 8) && *(void *)(a1 + 16) == *(void *)(a2 + 16);
  if (v6 || (v7 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0, (v7 & 1) != 0))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a2 + 32);
    if (v9)
    {
      if (!v10) {
        return 0;
      }
      if (*(void *)(a1 + 24) != *(void *)(a2 + 24) || v9 != v10)
      {
        char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t result = 0;
        if ((v11 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v10)
    {
      return 0;
    }
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a2 + 48);
    if (v12)
    {
      if (!v13) {
        return 0;
      }
      if (*(void *)(a1 + 40) != *(void *)(a2 + 40) || v12 != v13)
      {
        char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t result = 0;
        if ((v14 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v13)
    {
      return 0;
    }
    uint64_t v15 = *(void *)(a1 + 64);
    uint64_t v16 = *(void *)(a2 + 64);
    if (v15)
    {
      if (!v16) {
        return 0;
      }
      if (*(void *)(a1 + 56) != *(void *)(a2 + 56) || v15 != v16)
      {
        char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t result = 0;
        if ((v17 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v16)
    {
      return 0;
    }
    uint64_t v18 = *(void *)(a2 + 72);
    if (*(void *)(a1 + 72))
    {
      if (!v18) {
        return 0;
      }
      swift_bridgeObjectRetain();
      uint64_t v19 = swift_bridgeObjectRetain();
      char v20 = sub_10009BD24(v19, v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0) {
        return 0;
      }
    }
    else if (v18)
    {
      return 0;
    }
    uint64_t v21 = *(void *)(a2 + 80);
    if (*(void *)(a1 + 80))
    {
      if (v21)
      {
        swift_bridgeObjectRetain();
        uint64_t v22 = swift_bridgeObjectRetain();
        char v23 = sub_10009C4F0(v22, v21);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v23) {
          return 1;
        }
      }
    }
    else if (!v21)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_10009CDEC()
{
  unint64_t result = qword_1000CE678;
  if (!qword_1000CE678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000CE678);
  }
  return result;
}

unint64_t sub_10009CE40()
{
  unint64_t result = qword_1000C5FA8;
  if (!qword_1000C5FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C5FA8);
  }
  return result;
}

uint64_t sub_10009CE94(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x80000001000A9F30
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646E616D6D6F63 && a2 == 0xE700000000000000)
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

uint64_t sub_10009CF84@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100003DD0((uint64_t *)&unk_1000C60F0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005090(a1, a1[3]);
  sub_10009CDEC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100005128((uint64_t)a1);
  }
  LOBYTE(v30) = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  char v41 = 1;
  sub_1000A0E68();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v10 = v32;
  uint64_t v28 = v33;
  uint64_t v29 = v31;
  uint64_t v27 = v35;
  uint64_t v11 = v36;
  uint64_t v25 = v30;
  uint64_t v26 = v37;
  uint64_t v12 = v39;
  uint64_t v22 = v38;
  uint64_t v23 = v34;
  uint64_t v24 = v40;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v14 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100005128((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = v11;
  swift_bridgeObjectRelease();
  uint64_t v17 = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v18 = v25;
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v9;
  a2[1] = v18;
  a2[2] = v29;
  a2[3] = v13;
  a2[4] = v28;
  a2[5] = v17;
  a2[6] = v27;
  a2[7] = v16;
  a2[8] = v26;
  a2[9] = v15;
  uint64_t v20 = v24;
  a2[10] = v12;
  a2[11] = v20;
  return result;
}

uint64_t sub_10009D220(uint64_t a1)
{
  return a1;
}

uint64_t sub_10009D2A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10009D33C(uint64_t a1)
{
  return a1;
}

unint64_t sub_10009D3D0()
{
  unint64_t result = qword_1000CE680;
  if (!qword_1000CE680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000CE680);
  }
  return result;
}

unint64_t sub_10009D424()
{
  unint64_t result = qword_1000C6000;
  if (!qword_1000C6000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C6000);
  }
  return result;
}

uint64_t sub_10009D478(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D6F437265707573 && a2 == 0xED000073646E616DLL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4E646E616D6D6F63 && a2 == 0xEB00000000656D61 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7463617274736261 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6973737563736964 && a2 == 0xEA00000000006E6FLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001000A9F50 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x616D6D6F63627573 && a2 == 0xEB0000000073646ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x746E656D75677261 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_10009D7C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_100003DD0(&qword_1000C60C8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005090(a1, a1[3]);
  sub_10009D3D0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    sub_100005128((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_100003DD0(&qword_1000C5FC0);
    char v42 = 0;
    sub_1000A0DB0(&qword_1000C60B0);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    uint64_t v9 = v43;
    LOBYTE(v43) = 1;
    swift_bridgeObjectRetain();
    uint64_t v39 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v40 = v9;
    LOBYTE(v43) = 2;
    uint64_t v11 = v10;
    swift_bridgeObjectRetain();
    uint64_t v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v41 = v11;
    uint64_t v14 = v13;
    uint64_t v38 = v12;
    LOBYTE(v43) = 3;
    swift_bridgeObjectRetain();
    uint64_t v15 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v36 = a2;
    uint64_t v37 = v14;
    LOBYTE(v43) = 4;
    uint64_t v17 = v16;
    swift_bridgeObjectRetain();
    uint64_t v18 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v20 = v19;
    uint64_t v33 = v18;
    uint64_t v34 = v15;
    uint64_t v35 = v17;
    sub_100003DD0(&qword_1000C5FD8);
    char v42 = 5;
    sub_1000A0EBC(&qword_1000C60D0, &qword_1000C5FD8, (void (*)(void))sub_1000A0E68);
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    uint64_t v21 = v43;
    sub_100003DD0(&qword_1000C5FF0);
    char v42 = 6;
    sub_1000A0EBC(&qword_1000C60E0, &qword_1000C5FF0, (void (*)(void))sub_1000A0F28);
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v22 = v43;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_100005128((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v23 = v35;
    swift_bridgeObjectRelease();
    uint64_t v24 = v37;
    swift_bridgeObjectRelease();
    uint64_t v25 = v41;
    swift_bridgeObjectRelease();
    uint64_t v26 = v40;
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v28 = v36;
    uint64_t v29 = v39;
    *uint64_t v36 = v26;
    v28[1] = v29;
    uint64_t v30 = v38;
    v28[2] = v25;
    v28[3] = v30;
    uint64_t v31 = v34;
    v28[4] = v24;
    v28[5] = v31;
    uint64_t v32 = v33;
    v28[6] = v23;
    v28[7] = v32;
    v28[8] = v20;
    v28[9] = v21;
    v28[10] = v22;
  }
  return result;
}

uint64_t _s22ArgumentParserToolInfo0aD2V0V04NamedE0V23__derived_struct_equalsySbAE_AEtFZ_0(unsigned __int8 a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, uint64_t a5, uint64_t a6)
{
  int v10 = a1;
  if (!a1)
  {
    unint64_t v12 = 0xE400000000000000;
    unint64_t v11 = 1735290732;
    int v13 = a4;
    if (a4) {
      goto LABEL_9;
    }
LABEL_18:
    unint64_t v15 = 0xE400000000000000;
    if (v11 != 1735290732) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (a1 == 1) {
    unint64_t v11 = 0x74726F6873;
  }
  else {
    unint64_t v11 = 0xD000000000000012;
  }
  if (v10 == 1) {
    unint64_t v12 = 0xE500000000000000;
  }
  else {
    unint64_t v12 = 0x80000001000A9F00;
  }
  int v13 = a4;
  if (!a4) {
    goto LABEL_18;
  }
LABEL_9:
  if (v13 == 1) {
    unint64_t v14 = 0x74726F6873;
  }
  else {
    unint64_t v14 = 0xD000000000000012;
  }
  if (v13 == 1) {
    unint64_t v15 = 0xE500000000000000;
  }
  else {
    unint64_t v15 = 0x80000001000A9F00;
  }
  if (v11 != v14)
  {
LABEL_21:
    char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v16 & 1) == 0) {
      return result;
    }
    goto LABEL_22;
  }
LABEL_19:
  if (v12 != v15) {
    goto LABEL_21;
  }
  swift_bridgeObjectRelease_n();
LABEL_22:
  if (a2 == a5 && a3 == a6) {
    return 1;
  }

  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

unint64_t sub_10009DFA4()
{
  unint64_t result = qword_1000CE688;
  if (!qword_1000CE688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000CE688);
  }
  return result;
}

unint64_t sub_10009DFF8()
{
  unint64_t result = qword_1000C6010;
  if (!qword_1000C6010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C6010);
  }
  return result;
}

uint64_t sub_10009E04C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1684957547 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000)
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

uint64_t sub_10009E120(void *a1)
{
  uint64_t v3 = sub_100003DD0(&qword_1000C60B8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  sub_100005090(a1, v7);
  sub_10009DFA4();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    v9[14] = 0;
    sub_1000A0E14();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v7 = v9[15];
    v9[13] = 1;
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_100005128((uint64_t)a1);
  return v7;
}

unint64_t sub_10009E2E0(Swift::String string, Swift::OpaquePointer cases)
{
  unint64_t object = string._object;
  v3._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v3._unint64_t object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)(cases, v3);
  swift_bridgeObjectRelease();
  if (v5 >= 3) {
    return 3;
  }
  else {
    return v5;
  }
}

unint64_t sub_10009E328()
{
  unint64_t result = qword_1000CE690[0];
  if (!qword_1000CE690[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000CE690);
  }
  return result;
}

unint64_t sub_10009E37C()
{
  unint64_t result = qword_1000C6020;
  if (!qword_1000C6020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C6020);
  }
  return result;
}

unint64_t sub_10009E3D0()
{
  unint64_t result = qword_1000C6040;
  if (!qword_1000C6040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C6040);
  }
  return result;
}

uint64_t sub_10009E424(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1684957547 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6944646C756F6873 && a2 == 0xED000079616C7073 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x546E6F6974636573 && a2 == 0xEC000000656C7469 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F6974704F7369 && a2 == 0xEA00000000006C61 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7461657065527369 && a2 == 0xEB00000000676E69 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x73656D616ELL && a2 == 0xE500000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6572726566657270 && a2 == 0xED0000656D614E64 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6D614E65756C6176 && a2 == 0xE900000000000065 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x56746C7561666564 && a2 == 0xEC00000065756C61 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x65756C61566C6C61 && a2 == 0xE900000000000073 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x7463617274736261 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6973737563736964 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

uint64_t sub_10009E990@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100003DD0(&qword_1000C6090);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  uint64_t v64 = a1;
  sub_100005090(a1, v9);
  sub_10009E328();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    uint64_t v99 = v2;
LABEL_4:
    sub_100005128((uint64_t)v64);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  uint64_t v63 = v6;
  LOBYTE(v65) = 0;
  sub_1000A0D08();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  int v10 = v74;
  LOBYTE(v74) = 1;
  int v11 = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v74) = 2;
  uint64_t v13 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v15 = v14;
  int v62 = v10;
  LOBYTE(v74) = 3;
  swift_bridgeObjectRetain();
  int v59 = KeyedDecodingContainer.decode(_:forKey:)();
  int v60 = v11;
  uint64_t v61 = v15;
  LOBYTE(v74) = 4;
  int v57 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v58 = v13;
  sub_100003DD0(&qword_1000C6030);
  LOBYTE(v65) = 5;
  sub_1000A0EBC(&qword_1000C60A0, &qword_1000C6030, (void (*)(void))sub_1000A0D5C);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  uint64_t v16 = v74;
  LOBYTE(v65) = 6;
  sub_1000A0D5C();
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  uint64_t v17 = v74;
  uint64_t v55 = v75;
  uint64_t v56 = v16;
  LOBYTE(v74) = 7;
  uint64_t v18 = v76;
  swift_bridgeObjectRetain();
  uint64_t v52 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v53 = v17;
  uint64_t v54 = v18;
  LOBYTE(v74) = 8;
  uint64_t v20 = v19;
  swift_bridgeObjectRetain();
  uint64_t v21 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v99 = 0;
  uint64_t v23 = v21;
  uint64_t v24 = v22;
  uint64_t v25 = v20;
  uint64_t v51 = a2;
  sub_100003DD0(&qword_1000C5FC0);
  LOBYTE(v65) = 9;
  sub_1000A0DB0(&qword_1000C60B0);
  uint64_t v26 = v24;
  swift_bridgeObjectRetain();
  uint64_t v27 = v99;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  uint64_t v99 = v27;
  if (v27)
  {
    (*(void (**)(char *, uint64_t))(v63 + 8))(v8, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  uint64_t v28 = v74;
  LOBYTE(v74) = 10;
  uint64_t v50 = v28;
  swift_bridgeObjectRetain();
  uint64_t v29 = v99;
  uint64_t v30 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v99 = v29;
  if (v29)
  {
    (*(void (**)(char *, uint64_t))(v63 + 8))(v8, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  uint64_t v32 = v30;
  uint64_t v33 = v31;
  char v94 = 11;
  swift_bridgeObjectRetain();
  uint64_t v34 = v99;
  uint64_t v49 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v99 = v34;
  if (v34)
  {
    (*(void (**)(char *, uint64_t))(v63 + 8))(v8, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  uint64_t v36 = v35;
  int v48 = v60 & 1;
  int v37 = v59 & 1;
  int v59 = v57 & 1;
  int v60 = v37;
  (*(void (**)(char *, uint64_t))(v63 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  LOBYTE(v65) = v62;
  BYTE1(v65) = v48;
  *((void *)&v65 + 1) = v58;
  *(void *)&long long v66 = v61;
  BYTE8(v66) = v60;
  BYTE9(v66) = v59;
  uint64_t v38 = v54;
  *(void *)&long long v67 = v56;
  *((void *)&v67 + 1) = v53;
  *(void *)&long long v68 = v55;
  *((void *)&v68 + 1) = v54;
  *(void *)&long long v69 = v52;
  *((void *)&v69 + 1) = v25;
  uint64_t v47 = v23;
  *(void *)&long long v70 = v23;
  *((void *)&v70 + 1) = v26;
  *(void *)&long long v71 = v50;
  *((void *)&v71 + 1) = v32;
  *(void *)&long long v72 = v33;
  *((void *)&v72 + 1) = v49;
  uint64_t v73 = v36;
  sub_10009D2A8((uint64_t)&v65);
  uint64_t v39 = v61;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v40 = v25;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v41 = v50;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100005128((uint64_t)v64);
  LOBYTE(v74) = v62;
  BYTE1(v74) = v48;
  *(_DWORD *)((char *)&v74 + 2) = v97;
  HIWORD(v74) = v98;
  uint64_t v75 = v58;
  uint64_t v76 = v39;
  char v77 = v60;
  char v78 = v59;
  int v79 = v95;
  __int16 v80 = v96;
  uint64_t v81 = v56;
  uint64_t v82 = v53;
  uint64_t v83 = v55;
  uint64_t v84 = v38;
  uint64_t v85 = v52;
  uint64_t v86 = v40;
  uint64_t v87 = v47;
  uint64_t v88 = v26;
  uint64_t v89 = v41;
  uint64_t v90 = v32;
  uint64_t v91 = v33;
  uint64_t v92 = v49;
  uint64_t v93 = v36;
  uint64_t result = sub_10009D33C((uint64_t)&v74);
  long long v42 = v72;
  uint64_t v43 = v51;
  *(_OWORD *)(v51 + 96) = v71;
  *(_OWORD *)(v43 + 112) = v42;
  *(void *)(v43 + 128) = v73;
  long long v44 = v68;
  *(_OWORD *)(v43 + 32) = v67;
  *(_OWORD *)(v43 + 48) = v44;
  long long v45 = v70;
  *(_OWORD *)(v43 + 64) = v69;
  *(_OWORD *)(v43 + 80) = v45;
  long long v46 = v66;
  *(_OWORD *)uint64_t v43 = v65;
  *(_OWORD *)(v43 + 16) = v46;
  return result;
}

unint64_t sub_10009F2C0()
{
  unint64_t result = qword_1000C6050;
  if (!qword_1000C6050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C6050);
  }
  return result;
}

unint64_t sub_10009F318()
{
  unint64_t result = qword_1000C6058;
  if (!qword_1000C6058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C6058);
  }
  return result;
}

unint64_t sub_10009F370()
{
  unint64_t result = qword_1000C6060;
  if (!qword_1000C6060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C6060);
  }
  return result;
}

unint64_t sub_10009F3C8()
{
  unint64_t result = qword_1000C6068;
  if (!qword_1000C6068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C6068);
  }
  return result;
}

unint64_t sub_10009F420()
{
  unint64_t result = qword_1000C6070;
  if (!qword_1000C6070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C6070);
  }
  return result;
}

unint64_t sub_10009F478()
{
  unint64_t result = qword_1000C6078;
  if (!qword_1000C6078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C6078);
  }
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoHeader()
{
  return &type metadata for ToolInfoHeader;
}

uint64_t destroy for ToolInfoV0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ToolInfoV0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ToolInfoV0(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ToolInfoV0(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for ToolInfoV0(uint64_t a1, uint64_t a2)
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
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolInfoV0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ToolInfoV0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoV0()
{
  return &type metadata for ToolInfoV0;
}

uint64_t destroy for CommandInfoV0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CommandInfoV0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CommandInfoV0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for CommandInfoV0(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for CommandInfoV0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CommandInfoV0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CommandInfoV0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CommandInfoV0()
{
  return &type metadata for CommandInfoV0;
}

uint64_t destroy for ArgumentInfoV0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ArgumentInfoV0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v5;
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  uint64_t v7 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v7;
  uint64_t v8 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v8;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ArgumentInfoV0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ArgumentInfoV0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for ArgumentInfoV0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArgumentInfoV0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 136)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ArgumentInfoV0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 136) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 136) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0()
{
  return &type metadata for ArgumentInfoV0;
}

uint64_t destroy for ArgumentInfoV0.NameInfoV0()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s22ArgumentParserToolInfo14ArgumentInfoV0V10NameInfoV0VwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ArgumentInfoV0.NameInfoV0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ArgumentInfoV0.NameInfoV0(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ArgumentInfoV0.NameInfoV0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArgumentInfoV0.NameInfoV0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ArgumentInfoV0.NameInfoV0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.NameInfoV0()
{
  return &type metadata for ArgumentInfoV0.NameInfoV0;
}

unsigned char *initializeBufferWithCopyOfBuffer for ArgumentInfoV0.KindV0(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.NameInfoV0.KindV0()
{
  return &type metadata for ArgumentInfoV0.NameInfoV0.KindV0;
}

unsigned char *_s22ArgumentParserToolInfo14ArgumentInfoV0V6KindV0Owst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x1000A0278);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.KindV0()
{
  return &type metadata for ArgumentInfoV0.KindV0;
}

uint64_t getEnumTagSinglePayload for ArgumentInfoV0.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ArgumentInfoV0.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *__n128 result = a2 + 11;
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
        JUMPOUT(0x1000A040CLL);
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
          *__n128 result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.CodingKeys()
{
  return &type metadata for ArgumentInfoV0.CodingKeys;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.NameInfoV0.CodingKeys()
{
  return &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for CommandInfoV0.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *__n128 result = a2 + 6;
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
        JUMPOUT(0x1000A0524);
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
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CommandInfoV0.CodingKeys()
{
  return &type metadata for CommandInfoV0.CodingKeys;
}

unsigned char *_s22ArgumentParserToolInfo14ArgumentInfoV0V10NameInfoV0V10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x1000A0628);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoV0.CodingKeys()
{
  return &type metadata for ToolInfoV0.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ToolInfoHeader.CodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
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
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1000A0700);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoHeader.CodingKeys()
{
  return &type metadata for ToolInfoHeader.CodingKeys;
}

unint64_t sub_1000A073C()
{
  unint64_t result = qword_1000CF520[0];
  if (!qword_1000CF520[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000CF520);
  }
  return result;
}

unint64_t sub_1000A0794()
{
  unint64_t result = qword_1000CF730[0];
  if (!qword_1000CF730[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000CF730);
  }
  return result;
}

unint64_t sub_1000A07EC()
{
  unint64_t result = qword_1000CF940[0];
  if (!qword_1000CF940[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000CF940);
  }
  return result;
}

unint64_t sub_1000A0844()
{
  unint64_t result = qword_1000CFB50[0];
  if (!qword_1000CFB50[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000CFB50);
  }
  return result;
}

unint64_t sub_1000A089C()
{
  unint64_t result = qword_1000CFD60[0];
  if (!qword_1000CFD60[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000CFD60);
  }
  return result;
}

unint64_t sub_1000A08F4()
{
  unint64_t result = qword_1000CFE70;
  if (!qword_1000CFE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000CFE70);
  }
  return result;
}

unint64_t sub_1000A094C()
{
  unint64_t result = qword_1000CFE78;
  if (!qword_1000CFE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000CFE78);
  }
  return result;
}

unint64_t sub_1000A09A4()
{
  unint64_t result = qword_1000CFF00;
  if (!qword_1000CFF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000CFF00);
  }
  return result;
}

unint64_t sub_1000A09FC()
{
  unint64_t result = qword_1000CFF08[0];
  if (!qword_1000CFF08[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000CFF08);
  }
  return result;
}

unint64_t sub_1000A0A54()
{
  unint64_t result = qword_1000CFF90;
  if (!qword_1000CFF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000CFF90);
  }
  return result;
}

unint64_t sub_1000A0AAC()
{
  unint64_t result = qword_1000CFF98[0];
  if (!qword_1000CFF98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000CFF98);
  }
  return result;
}

unint64_t sub_1000A0B04()
{
  unint64_t result = qword_1000D0020;
  if (!qword_1000D0020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000D0020);
  }
  return result;
}

unint64_t sub_1000A0B5C()
{
  unint64_t result = qword_1000D0028[0];
  if (!qword_1000D0028[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000D0028);
  }
  return result;
}

unint64_t sub_1000A0BB4()
{
  unint64_t result = qword_1000D00B0;
  if (!qword_1000D00B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000D00B0);
  }
  return result;
}

unint64_t sub_1000A0C0C()
{
  unint64_t result = qword_1000D00B8[0];
  if (!qword_1000D00B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000D00B8);
  }
  return result;
}

unint64_t sub_1000A0C60()
{
  unint64_t result = qword_1000C6080;
  if (!qword_1000C6080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C6080);
  }
  return result;
}

unint64_t sub_1000A0CB4()
{
  unint64_t result = qword_1000C6088;
  if (!qword_1000C6088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C6088);
  }
  return result;
}

unint64_t sub_1000A0D08()
{
  unint64_t result = qword_1000C6098;
  if (!qword_1000C6098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C6098);
  }
  return result;
}

unint64_t sub_1000A0D5C()
{
  unint64_t result = qword_1000C60A8;
  if (!qword_1000C60A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C60A8);
  }
  return result;
}

uint64_t sub_1000A0DB0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000046A8(&qword_1000C5FC0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000A0E14()
{
  unint64_t result = qword_1000C60C0;
  if (!qword_1000C60C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C60C0);
  }
  return result;
}

unint64_t sub_1000A0E68()
{
  unint64_t result = qword_1000C60D8;
  if (!qword_1000C60D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C60D8);
  }
  return result;
}

uint64_t sub_1000A0EBC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000046A8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000A0F28()
{
  unint64_t result = qword_1000C60E8;
  if (!qword_1000C60E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000C60E8);
  }
  return result;
}

uint64_t static JSONEncoder.OutputFormatting.sortedKeys.getter()
{
  return static JSONEncoder.OutputFormatting.sortedKeys.getter();
}

uint64_t static JSONEncoder.OutputFormatting.prettyPrinted.getter()
{
  return static JSONEncoder.OutputFormatting.prettyPrinted.getter();
}

uint64_t type metadata accessor for JSONEncoder.OutputFormatting()
{
  return type metadata accessor for JSONEncoder.OutputFormatting();
}

uint64_t dispatch thunk of JSONEncoder.outputFormatting.modify()
{
  return dispatch thunk of JSONEncoder.outputFormatting.modify();
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

uint64_t dispatch thunk of LocalizedError.errorDescription.getter()
{
  return dispatch thunk of LocalizedError.errorDescription.getter();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t TIOCGWINSZ.getter()
{
  return TIOCGWINSZ.getter();
}

uint64_t ioctl(_:_:_:)()
{
  return ioctl(_:_:_:)();
}

uint64_t stderr.getter()
{
  return stderr.getter();
}

uint64_t Array.init()()
{
  return Array.init()();
}

uint64_t Set.init()()
{
  return Set.init()();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

Swift::String __swiftcall Character.lowercased()()
{
  uint64_t v0 = Character.lowercased()();
  result._unint64_t object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall Character.uppercased()()
{
  uint64_t v0 = Character.uppercased()();
  result._unint64_t object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t Character.isLowercase.getter()
{
  return Character.isLowercase.getter();
}

uint64_t Character._isLowercased.getter()
{
  return Character._isLowercased.getter();
}

uint64_t Character._isUppercased.getter()
{
  return Character._isUppercased.getter();
}

uint64_t Character._isSingleScalar.getter()
{
  return Character._isSingleScalar.getter();
}

uint64_t Character.hash(into:)()
{
  return Character.hash(into:)();
}

uint64_t Character.write<A>(to:)()
{
  return Character.write<A>(to:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.init(utf8String:)()
{
  return String.init(utf8String:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._unint64_t object = v1;
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

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = String.Iterator.next()();
  result.value._unint64_t object = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.distance(from:to:)()
{
  return String.distance(from:to:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

Swift::String __swiftcall String.init(repeating:count:)(Swift::String repeating, Swift::Int count)
{
  uint64_t v2 = String.init(repeating:count:)(repeating._countAndFlagsBits, repeating._object, count);
  result._unint64_t object = v3;
  result._uint64_t countAndFlagsBits = v2;
  return result;
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return String.init<A>(_:radix:uppercase:)();
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

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return dispatch thunk of Sequence.underestimatedCount.getter();
}

uint64_t Sequence.enumerated()()
{
  return Sequence.enumerated()();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t Sequence.lazy.getter()
{
  return Sequence.lazy.getter();
}

uint64_t Sequence.filter(_:)()
{
  return Sequence.filter(_:)();
}

uint64_t Sequence<>.joined(separator:)()
{
  return Sequence<>.joined(separator:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t dispatch thunk of RawRepresentable.init(rawValue:)()
{
  return dispatch thunk of RawRepresentable.init(rawValue:)();
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

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t Array.count.getter()
{
  return Array.count.getter();
}

uint64_t Array.append(_:)()
{
  return Array.append(_:)();
}

uint64_t Array.endIndex.getter()
{
  return Array.endIndex.getter();
}

Swift::Void __swiftcall Array.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t Array.subscript.getter()
{
  return Array.subscript.getter();
}

uint64_t dispatch thunk of Decodable.init(from:)()
{
  return dispatch thunk of Decodable.init(from:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.insert(_:)()
{
  return Set.insert(_:)();
}

uint64_t type metadata accessor for Set()
{
  return type metadata accessor for Set();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t Collection.isEmpty.getter()
{
  return Collection.isEmpty.getter();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t Substring.index(after:)()
{
  return Substring.index(after:)();
}

uint64_t Substring.index(before:)()
{
  return Substring.index(before:)();
}

uint64_t Substring.index(_:offsetBy:limitedBy:)()
{
  return Substring.index(_:offsetBy:limitedBy:)();
}

uint64_t Substring.distance(from:to:)()
{
  return Substring.distance(from:to:)();
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

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t StringProtocol.write<A>(toFile:atomically:encoding:)()
{
  return StringProtocol.write<A>(toFile:atomically:encoding:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t dispatch thunk of SetAlgebra.intersection(_:)()
{
  return dispatch thunk of SetAlgebra.intersection(_:)();
}

uint64_t dispatch thunk of SetAlgebra.formUnion(_:)()
{
  return dispatch thunk of SetAlgebra.formUnion(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

uint64_t static CommandLine.arguments.getter()
{
  return static CommandLine.arguments.getter();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t dispatch thunk of static CaseIterable.allCases.getter()
{
  return dispatch thunk of static CaseIterable.allCases.getter();
}

uint64_t type metadata accessor for LazySequence()
{
  return type metadata accessor for LazySequence();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return _decodeScalar(_:startingAt:)();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t ContiguousArray.append(_:)()
{
  return ContiguousArray.append(_:)();
}

uint64_t ContiguousArray.init()()
{
  return ContiguousArray.init()();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return type metadata accessor for ContiguousArray();
}

uint64_t type metadata accessor for LazyMapSequence()
{
  return type metadata accessor for LazyMapSequence();
}

uint64_t dispatch thunk of _AnySequenceBox._makeIterator()()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t TextOutputStream._writeASCII(_:)()
{
  return TextOutputStream._writeASCII(_:)();
}

Swift::Void __swiftcall TextOutputStream._lock()()
{
}

Swift::Void __swiftcall TextOutputStream._unlock()()
{
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return type metadata accessor for CodingUserInfoKey();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t __CocoaDictionary.count.getter()
{
  return __CocoaDictionary.count.getter();
}

uint64_t __CocoaDictionary.lookup(_:)()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t type metadata accessor for EnumeratedSequence()
{
  return type metadata accessor for EnumeratedSequence();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.convert(_:capacity:)()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

uint64_t LazySequenceProtocol.map<A>(_:)()
{
  return LazySequenceProtocol.map<A>(_:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
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

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return type metadata accessor for KeyedDecodingContainer();
}

uint64_t KeyedDecodingContainer.init<A>(_:)()
{
  return KeyedDecodingContainer.init<A>(_:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
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

uint64_t UnkeyedDecodingContainer.decodeIfPresent(_:)()
{
  return UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

{
  return UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

{
  return UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

{
  return UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

{
  return UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

{
  return UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

{
  return UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

uint64_t UnkeyedDecodingContainer.decodeIfPresent<A>(_:)()
{
  return UnkeyedDecodingContainer.decodeIfPresent<A>(_:)();
}

uint64_t UnkeyedDecodingContainer.decode(_:)()
{
  return UnkeyedDecodingContainer.decode(_:)();
}

{
  return UnkeyedDecodingContainer.decode(_:)();
}

uint64_t dispatch thunk of LosslessStringConvertible.init(_:)()
{
  return dispatch thunk of LosslessStringConvertible.init(_:)();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t SingleValueDecodingContainer.decode(_:)()
{
  return SingleValueDecodingContainer.decode(_:)();
}

{
  return SingleValueDecodingContainer.decode(_:)();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainerProtocol.decode(_:forKey:)()
{
  return KeyedDecodingContainerProtocol.decode(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decode(_:forKey:)();
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

uint64_t print<A>(_:separator:terminator:to:)()
{
  return print<A>(_:separator:terminator:to:)();
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

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t Mirror.init(reflecting:)()
{
  return Mirror.init(reflecting:)();
}

uint64_t Mirror.children.getter()
{
  return Mirror.children.getter();
}

uint64_t type metadata accessor for Mirror()
{
  return type metadata accessor for Mirror();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t Unicode.Scalar.Properties.isLowercase.getter()
{
  return Unicode.Scalar.Properties.isLowercase.getter();
}

uint64_t Unicode.Scalar.Properties.isUppercase.getter()
{
  return Unicode.Scalar.Properties.isUppercase.getter();
}

uint64_t Unicode.Scalar.Properties.isCased.getter()
{
  return Unicode.Scalar.Properties.isCased.getter();
}

uint64_t type metadata accessor for Unicode.Scalar.Properties()
{
  return type metadata accessor for Unicode.Scalar.Properties();
}

uint64_t Unicode.Scalar.properties.getter()
{
  return Unicode.Scalar.properties.getter();
}

uint64_t dispatch thunk of CodingKey.stringValue.getter()
{
  return dispatch thunk of CodingKey.stringValue.getter();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return __swift_stdlib_strtof_clocale();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_kernel_object(ipc_space_read_t task, mach_port_name_t name, unsigned int *object_type, unsigned int *object_addr)
{
  return _mach_port_kernel_object(task, name, object_type, object_addr);
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

Class object_getClass(id a1)
{
  return _object_getClass(a1);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int putc(int a1, FILE *a2)
{
  return _putc(a1, a2);
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return _setvbuf(a1, a2, a3, a4);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
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

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
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

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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

uint64_t swift_reflection_actorInfo()
{
  return _swift_reflection_actorInfo();
}

uint64_t swift_reflection_allocationMetadataPointer()
{
  return _swift_reflection_allocationMetadataPointer();
}

uint64_t swift_reflection_asyncTaskInfo()
{
  return _swift_reflection_asyncTaskInfo();
}

uint64_t swift_reflection_asyncTaskSlabAllocations()
{
  return _swift_reflection_asyncTaskSlabAllocations();
}

uint64_t swift_reflection_copyDemangledNameForProtocolDescriptor()
{
  return _swift_reflection_copyDemangledNameForProtocolDescriptor();
}

uint64_t swift_reflection_copyNameForTypeRef()
{
  return _swift_reflection_copyNameForTypeRef();
}

uint64_t swift_reflection_createReflectionContextWithDataLayout()
{
  return _swift_reflection_createReflectionContextWithDataLayout();
}

uint64_t swift_reflection_genericArgumentCountOfTypeRef()
{
  return _swift_reflection_genericArgumentCountOfTypeRef();
}

uint64_t swift_reflection_genericArgumentOfTypeRef()
{
  return _swift_reflection_genericArgumentOfTypeRef();
}

uint64_t swift_reflection_infoForTypeRef()
{
  return _swift_reflection_infoForTypeRef();
}

uint64_t swift_reflection_iterateConformanceCache()
{
  return _swift_reflection_iterateConformanceCache();
}

uint64_t swift_reflection_iterateMetadataAllocationBacktraces()
{
  return _swift_reflection_iterateMetadataAllocationBacktraces();
}

uint64_t swift_reflection_iterateMetadataAllocations()
{
  return _swift_reflection_iterateMetadataAllocations();
}

uint64_t swift_reflection_metadataAllocationCacheNode()
{
  return _swift_reflection_metadataAllocationCacheNode();
}

uint64_t swift_reflection_metadataAllocationTagName()
{
  return _swift_reflection_metadataAllocationTagName();
}

uint64_t swift_reflection_metadataForObject()
{
  return _swift_reflection_metadataForObject();
}

uint64_t swift_reflection_metadataIsActor()
{
  return _swift_reflection_metadataIsActor();
}

uint64_t swift_reflection_nextJob()
{
  return _swift_reflection_nextJob();
}

uint64_t swift_reflection_ownsAddressStrict()
{
  return _swift_reflection_ownsAddressStrict();
}

uint64_t swift_reflection_typeRefForMetadata()
{
  return _swift_reflection_typeRefForMetadata();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
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

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return _task_for_pid(target_tport, pid, t);
}

kern_return_t task_generate_corpse(task_read_t task, mach_port_t *corpse_task_port)
{
  return _task_generate_corpse(task, corpse_task_port);
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return _task_threads(target_task, act_list, act_listCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return _thread_info(target_act, flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}