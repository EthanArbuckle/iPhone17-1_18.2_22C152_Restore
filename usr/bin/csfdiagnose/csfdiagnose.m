int main(int argc, const char **argv, const char **envp)
{
  passwd *v3;
  passwd *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = getpwnam("mobile");
  qword_100028820 = (uint64_t)v3;
  if (v3)
  {
    v4 = v3;
    if (!geteuid())
    {
      sub_100004ACC(&qword_100028078);
      v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_10001F850;
      *(void *)(v5 + 56) = &type metadata for String;
      *(void *)(v5 + 32) = 0xD00000000000002BLL;
      *(void *)(v5 + 40) = 0x8000000100020B00;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease();
      v6 = setuid(v4->pw_uid);
      v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_10001F850;
      *(void *)(v7 + 56) = &type metadata for String;
      v8 = 0xD000000000000022;
      if (!v6) {
        v8 = 0xD00000000000001FLL;
      }
      v9 = 0x8000000100020B60;
      if (v6) {
        v9 = 0x8000000100020B30;
      }
      *(void *)(v7 + 32) = v8;
      *(void *)(v7 + 40) = v9;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease();
    }
  }
  type metadata accessor for GMDiagnostics(0);
  sub_100004A74();
  static ParsableCommand.main()();
  return 0;
}

unint64_t sub_100004A74()
{
  unint64_t result = qword_100028070;
  if (!qword_100028070)
  {
    type metadata accessor for GMDiagnostics(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028070);
  }
  return result;
}

uint64_t sub_100004ACC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_100004B10@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100004B1C(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_100004B28@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100004B3C(void *result)
{
  *v1 &= *result;
  return result;
}

BOOL sub_100004B50(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100004B64(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100004B78(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_100004B8C(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100004ACC(&qword_100028080);
    v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    v8((void *)((char *)a1 + a3[7]), (void *)((char *)a2 + a3[7]), v7);
    uint64_t v10 = a3[8];
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    uint64_t v13 = sub_100004ACC(&qword_100028088);
    v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    v14(v11, v12, v13);
    v14((char *)a1 + a3[9], (char *)a2 + a3[9], v13);
  }
  return a1;
}

uint64_t sub_100004D00(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_100004ACC(&qword_100028080);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[7], v4);
  uint64_t v6 = a1 + a2[8];
  uint64_t v7 = sub_100004ACC(&qword_100028088);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v10)((void *)(v7 - 8), v6, v7);
  uint64_t v8 = a1 + a2[9];

  return v10(v8, v7);
}

uint64_t sub_100004E0C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004ACC(&qword_100028080);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  v7(a1 + a3[7], a2 + a3[7], v6);
  uint64_t v9 = a3[8];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_100004ACC(&qword_100028088);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  v13(v10, v11, v12);
  v13(a1 + a3[9], a2 + a3[9], v12);
  return a1;
}

uint64_t sub_100004F30(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004ACC(&qword_100028080);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  v7(a1 + a3[7], a2 + a3[7], v6);
  uint64_t v8 = a3[8];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100004ACC(&qword_100028088);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24);
  v12(v9, v10, v11);
  v12(a1 + a3[9], a2 + a3[9], v11);
  return a1;
}

uint64_t sub_100005058(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004ACC(&qword_100028080);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  v7(a1 + a3[7], a2 + a3[7], v6);
  uint64_t v9 = a3[8];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_100004ACC(&qword_100028088);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32);
  v13(v10, v11, v12);
  v13(a1 + a3[9], a2 + a3[9], v12);
  return a1;
}

uint64_t sub_10000517C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004ACC(&qword_100028080);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  v7(a1 + a3[7], a2 + a3[7], v6);
  uint64_t v9 = a3[8];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_100004ACC(&qword_100028088);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40);
  v13(v10, v11, v12);
  v13(a1 + a3[9], a2 + a3[9], v12);
  return a1;
}

uint64_t sub_1000052A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000052B4);
}

uint64_t sub_1000052B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004ACC(&qword_100028080);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 254)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = sub_100004ACC(&qword_100028088);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 32);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_1000053F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005408);
}

uint64_t sub_100005408(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100004ACC(&qword_100028080);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 254)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  else
  {
    uint64_t v11 = sub_100004ACC(&qword_100028088);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 32);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for GMDiagnostics(uint64_t a1)
{
  return sub_100014EA0(a1, (uint64_t *)&unk_1000280E8);
}

void sub_100005558()
{
  sub_100005664(319, &qword_1000280F8, (uint64_t (*)(void, void *))&type metadata accessor for Option);
  if (v0 <= 0x3F)
  {
    sub_100005664(319, (unint64_t *)&unk_100028100, (uint64_t (*)(void, void *))&type metadata accessor for Flag);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100005664(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void *))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, &type metadata for Bool);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1000056B4()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100005744;
  return sub_10000AE88();
}

uint64_t sub_100005744()
{
  swift_task_dealloc();
  if (v0) {
    swift_errorRelease();
  }
  return _swift_task_switch(sub_10000585C, 0, 0);
}

void sub_10000585C()
{
}

uint64_t sub_10000588C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10001C7A0(a1, &qword_100028150);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t sub_100005A38(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000017;
      break;
    case 2:
      unint64_t result = 0x696B726F7774656ELL;
      break;
    case 3:
      unint64_t result = 1685289331;
      break;
    case 4:
      unint64_t result = 1852797802;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100005AE0(void *a1)
{
  uint64_t v3 = sub_100004ACC(&qword_1000286F0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015678(a1, a1[3]);
  sub_10001D7D8();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v13 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    char v12 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v11 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v10 = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v9 = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_100005CC8()
{
  return sub_100005A38(*v0);
}

uint64_t sub_100005CD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001B00C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100005CF8()
{
  return 0;
}

void sub_100005D04(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_100005D10(uint64_t a1)
{
  unint64_t v2 = sub_10001D7D8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100005D4C(uint64_t a1)
{
  unint64_t v2 = sub_10001D7D8();

  return CodingKey.debugDescription.getter(a1, v2);
}

int8x8_t sub_100005D88@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4 = sub_10001B210(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4 & 1;
    uint64x2_t v6 = (uint64x2_t)vdupq_n_s64(v4);
    int16x8_t v7 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v6, (uint64x2_t)xmmword_10001F8A0), (int32x4_t)vshlq_u64(v6, (uint64x2_t)xmmword_10001F890));
    *(int8x8_t *)v7.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v7), (int8x8_t)0x1000100010001);
    int8x8_t result = vmovn_s16(v7);
    *(_DWORD *)(a2 + 1) = result.i32[0];
  }
  return result;
}

uint64_t sub_100005DEC(void *a1)
{
  return sub_100005AE0(a1);
}

uint64_t sub_100005E58(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v12 = a4;
  uint64_t v6 = sub_100004ACC(&qword_1000285A0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015678(a1, a1[3]);
  sub_10001C5E8();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v14 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v4)
  {
    char v13 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_100005FCC()
{
  if (*v0) {
    return 0x6573556E6163;
  }
  else {
    return 0x4965727574616566;
  }
}

uint64_t sub_100006008@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001B46C(a1, a2);
  *a3 = result;
  return result;
}

void sub_100006030(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000603C(uint64_t a1)
{
  unint64_t v2 = sub_10001C5E8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100006078(uint64_t a1)
{
  unint64_t v2 = sub_10001C5E8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000060B4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10001B564(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6 & 1;
  }
  return result;
}

uint64_t sub_1000060E8(void *a1)
{
  return sub_100005E58(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_100006108(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v11[0] = a4;
  uint64_t v6 = sub_100004ACC(&qword_1000285C0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015678(a1, a1[3]);
  sub_10001C63C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v13 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v4)
  {
    v11[1] = v11[0];
    char v12 = 1;
    type metadata accessor for TicketStatus();
    sub_100013690(&qword_1000285C8, (void (*)(uint64_t))&type metadata accessor for TicketStatus);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1000062CC()
{
  if (*v0) {
    return 0x737574617473;
  }
  else {
    return 7955819;
  }
}

uint64_t sub_1000062FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001B750(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100006324(uint64_t a1)
{
  unint64_t v2 = sub_10001C63C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100006360(uint64_t a1)
{
  unint64_t v2 = sub_10001C63C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000639C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10001B82C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_1000063CC(void *a1)
{
  return sub_100006108(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_1000063EC(void *a1)
{
  uint64_t v3 = sub_100004ACC(&qword_100028608);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015678(a1, a1[3]);
  sub_10001C6E4();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v12 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    type metadata accessor for Diagnostics.AFMFollowUpDiagnostics(0);
    char v11 = 1;
    type metadata accessor for Date();
    sub_100013690(&qword_1000285F0, (void (*)(uint64_t))&type metadata accessor for Date);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    char v10 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v9 = 3;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100006610@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v4 = sub_100004ACC(&qword_1000281E8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  char v9 = (char *)&v22 - v8;
  uint64_t v10 = sub_100004ACC(&qword_1000285F8);
  uint64_t v25 = *(void *)(v10 - 8);
  uint64_t v26 = v10;
  __chkstk_darwin(v10);
  char v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = (int *)type metadata accessor for Diagnostics.AFMFollowUpDiagnostics(0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  v27 = a1;
  sub_100015678(a1, v16);
  sub_10001C6E4();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_100015710((uint64_t)v27);
  }
  v23 = v7;
  uint64_t v17 = v25;
  char v31 = 0;
  uint64_t v18 = (uint64_t)v15;
  *uint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)() & 1;
  type metadata accessor for Date();
  char v30 = 1;
  uint64_t v19 = sub_100013690(&qword_1000285E0, (void (*)(uint64_t))&type metadata accessor for Date);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  uint64_t v22 = v19;
  sub_100015578((uint64_t)v9, v18 + v13[5], &qword_1000281E8);
  char v29 = 2;
  *(unsigned char *)(v18 + v13[6]) = KeyedDecodingContainer.decode(_:forKey:)() & 1;
  char v28 = 3;
  uint64_t v20 = (uint64_t)v23;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v26);
  sub_100015578(v20, v18 + v13[7], &qword_1000281E8);
  sub_10001C738(v18, v24, type metadata accessor for Diagnostics.AFMFollowUpDiagnostics);
  sub_100015710((uint64_t)v27);
  return sub_100014594(v18, type metadata accessor for Diagnostics.AFMFollowUpDiagnostics);
}

uint64_t sub_1000069D8(void *a1)
{
  uint64_t v3 = sub_100004ACC(&qword_1000285E8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100015678(a1, a1[3]);
  sub_10001C690();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    type metadata accessor for Diagnostics.ADMFollowUpDiagnostics(0);
    v8[14] = 1;
    type metadata accessor for Date();
    sub_100013690(&qword_1000285F0, (void (*)(uint64_t))&type metadata accessor for Date);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100006B90@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = sub_100004ACC(&qword_1000281E8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004ACC(&qword_1000285D0);
  uint64_t v19 = *(void *)(v7 - 8);
  uint64_t v20 = v7;
  __chkstk_darwin(v7);
  char v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Diagnostics.ADMFollowUpDiagnostics(0);
  __chkstk_darwin(v10);
  char v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015678(a1, a1[3]);
  sub_10001C690();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v13 = v19;
    uint64_t v14 = v20;
    char v22 = 0;
    unsigned char *v12 = KeyedDecodingContainer.decode(_:forKey:)() & 1;
    type metadata accessor for Date();
    char v21 = 1;
    sub_100013690(&qword_1000285E0, (void (*)(uint64_t))&type metadata accessor for Date);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v14);
    uint64_t v15 = v18;
    sub_100015578((uint64_t)v6, (uint64_t)&v12[*(int *)(v10 + 20)], &qword_1000281E8);
    sub_100015064((uint64_t)v12, v15, type metadata accessor for Diagnostics.ADMFollowUpDiagnostics);
  }
  return sub_100015710((uint64_t)a1);
}

BOOL sub_100006E4C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_100006E60()
{
  Hasher._combine(_:)(*v0);
}

unint64_t sub_100006E8C()
{
  unint64_t result = 0x46746E6553736168;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x65746144746E6573;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100006F34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001BA78(a1, a2);
  *a3 = result;
  return result;
}

void sub_100006F5C(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_100006F68(uint64_t a1)
{
  unint64_t v2 = sub_10001C6E4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100006FA4(uint64_t a1)
{
  unint64_t v2 = sub_10001C6E4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100006FE0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100006610(a1, a2);
}

uint64_t sub_100006FF8(void *a1)
{
  return sub_1000063EC(a1);
}

BOOL sub_100007010(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100007028()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_100007070()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_1000070B4()
{
  if (*v0) {
    return 0x65746144746E6573;
  }
  else {
    return 0x46746E6553736168;
  }
}

uint64_t sub_1000070FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001BC4C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100007124(uint64_t a1)
{
  unint64_t v2 = sub_10001C690();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007160(uint64_t a1)
{
  unint64_t v2 = sub_10001C690();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000719C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100006B90(a1, a2);
}

uint64_t sub_1000071B4(void *a1)
{
  return sub_1000069D8(a1);
}

uint64_t sub_1000071CC()
{
  return 1;
}

uint64_t sub_1000071DC()
{
  return 0x6574617473;
}

uint64_t sub_1000071F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
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

void sub_100007280(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10000728C(uint64_t a1)
{
  unint64_t v2 = sub_10001D82C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000072C8(uint64_t a1)
{
  unint64_t v2 = sub_10001D82C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007304@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1000079F0(a1, &qword_100028758, (void (*)(void))sub_10001D82C, a2);
}

uint64_t sub_100007340(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100007B9C(a1, a2, a3, &qword_100028700, (void (*)(void))sub_10001D82C);
}

uint64_t sub_10000737C()
{
  return 0x64656C62616E65;
}

uint64_t sub_100007398(uint64_t a1)
{
  unint64_t v2 = sub_10001D880();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000073D4(uint64_t a1)
{
  unint64_t v2 = sub_10001D880();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007410@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1000079F0(a1, &qword_100028760, (void (*)(void))sub_10001D880, a2);
}

uint64_t sub_10000744C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100007B9C(a1, a2, a3, &qword_100028710, (void (*)(void))sub_10001D880);
}

uint64_t sub_100007488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x64656C62616E65 && a2 == 0xE700000000000000)
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

uint64_t sub_100007520(uint64_t a1)
{
  unint64_t v2 = sub_10001D8D4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000755C(uint64_t a1)
{
  unint64_t v2 = sub_10001D8D4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007598@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1000079F0(a1, &qword_100028768, (void (*)(void))sub_10001D8D4, a2);
}

uint64_t sub_1000075D4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100007B9C(a1, a2, a3, &qword_100028720, (void (*)(void))sub_10001D8D4);
}

uint64_t sub_100007610()
{
  return 0x6E49646574706FLL;
}

uint64_t sub_100007628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6E49646574706FLL && a2 == 0xE700000000000000)
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

uint64_t sub_1000076C0(uint64_t a1)
{
  unint64_t v2 = sub_10001D928();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000076FC(uint64_t a1)
{
  unint64_t v2 = sub_10001D928();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007738@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1000079F0(a1, &qword_100028770, (void (*)(void))sub_10001D928, a2);
}

uint64_t sub_100007774(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100007B9C(a1, a2, a3, &qword_100028730, (void (*)(void))sub_10001D928);
}

Swift::Int sub_1000077B0()
{
  return Hasher._finalize()();
}

void sub_1000077F4()
{
}

Swift::Int sub_10000781C()
{
  return Hasher._finalize()();
}

uint64_t sub_10000785C()
{
  return 0x6C69617465527369;
}

uint64_t sub_100007880@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6C69617465527369 && a2 == 0xEE00656369766544)
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

uint64_t sub_10000793C(uint64_t a1)
{
  unint64_t v2 = sub_10001D97C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007978(uint64_t a1)
{
  unint64_t v2 = sub_10001D97C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000079B4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1000079F0(a1, &qword_100028778, (void (*)(void))sub_10001D97C, a2);
}

uint64_t sub_1000079F0@<X0>(void *a1@<X0>, uint64_t *a2@<X3>, void (*a3)(void)@<X4>, unsigned char *a4@<X8>)
{
  uint64_t v13 = a4;
  uint64_t v7 = sub_100004ACC(a2);
  uint64_t v14 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  char v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015678(a1, a1[3]);
  a3();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v4) {
    return sub_100015710((uint64_t)a1);
  }
  char v10 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v7);
  uint64_t result = sub_100015710((uint64_t)a1);
  *uint64_t v13 = v10 & 1;
  return result;
}

uint64_t sub_100007B60(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100007B9C(a1, a2, a3, &qword_100028740, (void (*)(void))sub_10001D97C);
}

uint64_t sub_100007B9C(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t v12 = a5;
  uint64_t v6 = sub_100004ACC(a4);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015678(a1, a1[3]);
  v12();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_100007CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a3;
  v4[10] = a4;
  v4[7] = a1;
  v4[8] = a2;
  v4[11] = sub_100004ACC(&qword_1000281D8);
  v4[12] = swift_task_alloc();
  v4[13] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for FrameworkDiagnostics.DiagnosticKey();
  v4[14] = v5;
  v4[15] = *(void *)(v5 - 8);
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  v4[18] = swift_task_alloc();
  v4[19] = sub_100004ACC(&qword_1000281E0);
  v4[20] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Diagnostics.AFMFollowUpDiagnostics(0);
  v4[21] = v6;
  v4[22] = *(void *)(v6 - 8);
  v4[23] = swift_task_alloc();
  sub_100004ACC(&qword_1000281E8);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  sub_100004ACC(&qword_1000281F0);
  v4[26] = swift_task_alloc();
  v4[27] = swift_task_alloc();
  sub_100004ACC(&qword_1000281F8);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  v4[30] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for SiriAssistantLocale();
  v4[31] = v7;
  v4[32] = *(void *)(v7 - 8);
  v4[33] = swift_task_alloc();
  return _swift_task_switch(sub_100007FB8, 0, 0);
}

char *sub_100007FB8()
{
  uint64_t v2 = v0[32];
  uint64_t v1 = v0[33];
  uint64_t v3 = v0[31];
  type metadata accessor for EligibilityFetcher();
  uint64_t v4 = (void *)static EligibilityFetcher.current.getter();
  char v88 = Eligibility.deviceEligibile.getter();

  SiriAssistantLocale.init()();
  uint64_t v87 = SiriAssistantLocale.current.getter();
  unint64_t v86 = v5;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  type metadata accessor for FeatureCache();
  static FeatureCache.shared.getter();
  unint64_t v6 = FeatureCache.allFeatures(forDSID:ignoreTTL:)();
  swift_release();
  sub_100004ACC(&qword_100028200);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001F850;
  static FeatureCache.shared.getter();
  uint64_t v8 = FeatureCache.cachedFeature(identifier:altDSID:allowAnySession:ignoreTTL:)();
  swift_release();
  *(void *)(inited + 32) = v8;
  specialized Array._endMutation()();
  uint64_t v9 = sub_100008D94(inited);
  swift_bridgeObjectRelease();
  sub_100013D80((unint64_t)v9);
  unint64_t v10 = v6;
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v89 = v0;
  if (v11)
  {
    uint64_t result = sub_100014070(0, v11 & ~(v11 >> 63), 0);
    if (v11 < 0)
    {
      __break(1u);
      return result;
    }
    if ((v6 & 0xC000000000000001) != 0)
    {
      uint64_t v13 = 0;
      do
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
        uint64_t v14 = CloudFeature.featureID.getter();
        uint64_t v16 = v15;
        char v17 = CloudFeature.canUse.getter();
        swift_unknownObjectRelease();
        unint64_t v19 = _swiftEmptyArrayStorage[2];
        unint64_t v18 = _swiftEmptyArrayStorage[3];
        if (v19 >= v18 >> 1) {
          sub_100014070((char *)(v18 > 1), v19 + 1, 1);
        }
        ++v13;
        _swiftEmptyArrayStorage[2] = v19 + 1;
        uint64_t v20 = (char *)&_swiftEmptyArrayStorage[3 * v19];
        *((void *)v20 + 4) = v14;
        *((void *)v20 + 5) = v16;
        v20[48] = v17 & 1;
      }
      while (v11 != v13);
    }
    else
    {
      uint64_t v21 = 0;
      do
      {
        id v22 = *(id *)(v10 + 8 * v21 + 32);
        uint64_t v23 = CloudFeature.featureID.getter();
        uint64_t v25 = v24;
        char v26 = CloudFeature.canUse.getter();

        unint64_t v28 = _swiftEmptyArrayStorage[2];
        unint64_t v27 = _swiftEmptyArrayStorage[3];
        if (v28 >= v27 >> 1) {
          sub_100014070((char *)(v27 > 1), v28 + 1, 1);
        }
        ++v21;
        _swiftEmptyArrayStorage[2] = v28 + 1;
        char v29 = (char *)&_swiftEmptyArrayStorage[3 * v28];
        *((void *)v29 + 4) = v23;
        *((void *)v29 + 5) = v25;
        v29[48] = v26 & 1;
      }
      while (v11 != v21);
    }
  }
  swift_bridgeObjectRelease();
  type metadata accessor for TicketCache();
  static TicketCache.shared.getter();
  uint64_t v30 = TicketCache.allTickets(forDSID:)();
  swift_release();
  int64_t v31 = *(void *)(v30 + 16);
  if (v31)
  {
    sub_100014050(0, v31, 0);
    v32 = (void **)(v30 + 48);
    do
    {
      uint64_t v33 = (uint64_t)*(v32 - 2);
      uint64_t v34 = (uint64_t)*(v32 - 1);
      v35 = *v32;
      swift_bridgeObjectRetain_n();
      id v36 = v35;
      uint64_t v37 = Ticket.status.getter();
      swift_bridgeObjectRelease();

      unint64_t v39 = _swiftEmptyArrayStorage[2];
      unint64_t v38 = _swiftEmptyArrayStorage[3];
      if (v39 >= v38 >> 1) {
        sub_100014050((char *)(v38 > 1), v39 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v39 + 1;
      v40 = &_swiftEmptyArrayStorage[3 * v39];
      v40[4] = v33;
      v40[5] = v34;
      v40[6] = v37;
      v32 += 3;
      --v31;
    }
    while (v31);
    swift_bridgeObjectRelease();
    uint64_t v0 = v89;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  type metadata accessor for FollowUp();
  if (FollowUp.__allocating_init()())
  {
    dispatch thunk of FollowUp.dateSentCFU.getter();
    id v41 = [self hasEngagedWithCFUDate];
    uint64_t v42 = v0[24];
    if (v41)
    {
      v43 = v41;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v44 = type metadata accessor for Date();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v42, 0, 1, v44);
    }
    else
    {
      uint64_t v44 = type metadata accessor for Date();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v42, 1, 1, v44);
    }
    uint64_t v79 = v0[29];
    uint64_t v81 = v0[30];
    v83 = (unsigned char *)v0[27];
    uint64_t v47 = v89[25];
    uint64_t v48 = v89[24];
    v49 = (BOOL *)v89[23];
    uint64_t v50 = v89[22];
    v51 = (int *)v89[21];
    type metadata accessor for Date();
    v52 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 48);
    BOOL *v49 = v52(v47, 1, v44) != 1;
    sub_100015000(v47, (uint64_t)&v49[v51[5]], &qword_1000281E8);
    BOOL v53 = v52(v48, 1, v44) != 1;
    uint64_t v0 = v89;
    sub_10001C7A0(v47, &qword_1000281E8);
    v49[v51[6]] = v53;
    sub_100015578(v48, (uint64_t)&v49[v51[7]], &qword_1000281E8);
    sub_100015064((uint64_t)v49, v79, type metadata accessor for Diagnostics.AFMFollowUpDiagnostics);
    (*(void (**)(uint64_t, void, uint64_t, int *))(v50 + 56))(v79, 0, 1, v51);
    sub_100015578(v79, v81, &qword_1000281F8);
    char v54 = dispatch thunk of FollowUp.hasSentADMCFU.getter();
    uint64_t v55 = type metadata accessor for Diagnostics.ADMFollowUpDiagnostics(0);
    dispatch thunk of FollowUp.dateSentADMCFU.getter();
    swift_release();
    unsigned char *v83 = v54 & 1;
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v83, 0, 1, v55);
  }
  else
  {
    uint64_t v45 = v0[27];
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[22] + 56))(v0[30], 1, 1, v0[21]);
    uint64_t v46 = type metadata accessor for Diagnostics.ADMFollowUpDiagnostics(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v45, 1, 1, v46);
  }
  uint64_t v56 = v0[27];
  uint64_t v57 = v0[26];
  uint64_t v58 = v0[18];
  uint64_t v59 = v0[14];
  uint64_t v60 = v0[15];
  sub_100015000(v0[30], v0[28], &qword_1000281F8);
  sub_100015000(v56, v57, &qword_1000281F0);
  type metadata accessor for GMBypass();
  char v90 = static GMBypass.gmEligibilityBypass()();
  char v85 = static GMBypass.admBypassState()();
  type metadata accessor for GMAssetsBypass();
  char v84 = static GMAssetsBypass.gmAssetsBypass()();
  type metadata accessor for GMOptIn();
  v61 = (void *)static GMOptIn.shared.getter();
  char v82 = dispatch thunk of GMOptIn.isOptedIn.getter();

  type metadata accessor for SystemProperties();
  static SystemProperties.shared.getter();
  char v80 = dispatch thunk of SystemProperties.isRetailDevice.getter();
  swift_release();
  v62 = *(void (**)(uint64_t, void, uint64_t))(v60 + 104);
  v62(v58, enum case for FrameworkDiagnostics.DiagnosticKey.featureRequest(_:), v59);
  sub_100014ED8(&qword_100028208, &qword_100028210);
  sub_100014ED8(&qword_100028218, &qword_100028220);
  static FrameworkDiagnostics.fetchDiagnostic<A>(forKey:)();
  v63 = *(void (**)(void, void))(v0[15] + 8);
  v63(v0[18], v0[14]);
  v62(v0[17], enum case for FrameworkDiagnostics.DiagnosticKey.afmAssets(_:), v0[14]);
  sub_100014F6C(&qword_100028228, &qword_100028230);
  sub_100014F6C(&qword_100028238, &qword_100028240);
  static FrameworkDiagnostics.fetchDiagnostic<A>(forKey:)();
  v63(v0[17], v0[14]);
  v62(v0[16], enum case for FrameworkDiagnostics.DiagnosticKey.admAssets(_:), v0[14]);
  static FrameworkDiagnostics.fetchDiagnostic<A>(forKey:)();
  uint64_t v64 = v0[30];
  uint64_t v65 = v0[27];
  v63(v0[16], v0[14]);
  sub_10001C7A0(v65, &qword_1000281F0);
  sub_10001C7A0(v64, &qword_1000281F8);
  uint64_t v66 = v0[28];
  uint64_t v67 = v0[26];
  uint64_t v68 = v0[20];
  uint64_t v69 = v0[12];
  uint64_t v70 = v0[13];
  unint64_t v71 = v0[10];
  uint64_t v72 = v0[7];
  unint64_t v73 = 0x8000000100021700;
  if (v86) {
    unint64_t v73 = v86;
  }
  unint64_t v74 = 0xD000000000000018;
  if (v86) {
    unint64_t v74 = v87;
  }
  *(unsigned char *)uint64_t v72 = v71 & 1;
  uint64x2_t v75 = (uint64x2_t)vdupq_n_s64(v71);
  int16x8_t v76 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v75, (uint64x2_t)xmmword_10001F8A0), (int32x4_t)vshlq_u64(v75, (uint64x2_t)xmmword_10001F890));
  *(int8x8_t *)v76.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v76), (int8x8_t)0x1000100010001);
  *(_DWORD *)(v72 + 1) = vmovn_s16(v76).u32[0];
  *(unsigned char *)(v72 + 5) = v88 & 1;
  *(void *)(v72 + 8) = v74;
  *(void *)(v72 + 16) = v73;
  *(void *)(v72 + 24) = _swiftEmptyArrayStorage;
  *(void *)(v72 + 32) = _swiftEmptyArrayStorage;
  v77 = (int *)type metadata accessor for Diagnostics(0);
  sub_100015578(v66, v72 + v77[9], &qword_1000281F8);
  sub_100015578(v67, v72 + v77[10], &qword_1000281F0);
  *(unsigned char *)(v72 + v77[11]) = v90 & 1;
  *(unsigned char *)(v72 + v77[12]) = v85 & 1;
  *(unsigned char *)(v72 + v77[13]) = v84 & 1;
  *(unsigned char *)(v72 + v77[14]) = v82 & 1;
  *(unsigned char *)(v72 + v77[15]) = v80 & 1;
  sub_100015578(v68, v72 + v77[16], &qword_1000281E0);
  sub_100015578(v70, v72 + v77[17], &qword_1000281D8);
  sub_100015578(v69, v72 + v77[18], &qword_1000281D8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v78 = (uint64_t (*)(void))v0[1];
  return (char *)v78();
}

void *sub_100008D94(uint64_t a1)
{
  uint64_t result = &_swiftEmptyArrayStorage;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v3; ++i)
    {
      unint64_t v5 = *(void **)(a1 + 8 * i + 32);
      if (v5)
      {
        id v6 = v5;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
    }
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_100008E74(uint64_t a1)
{
  uint64_t v33 = type metadata accessor for FollowUp.IneligibilityReason();
  uint64_t v3 = *(void *)(v33 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v32 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  int64_t v31 = (char *)v27 - v6;
  int64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = _swiftEmptyArrayStorage;
  if (!v7) {
    return (uint64_t)v8;
  }
  v27[0] = v1;
  uint64_t v34 = _swiftEmptyArrayStorage;
  sub_100014090(0, v7, 0);
  uint64_t result = sub_1000153E8(a1);
  int64_t v10 = result;
  int v12 = v11;
  char v14 = v13 & 1;
  uint64_t v29 = a1;
  uint64_t v30 = a1 + 56;
  v27[2] = v3 + 32;
  v27[3] = v3 + 16;
  v27[1] = v3 + 8;
  uint64_t v28 = v3;
  while ((v10 & 0x8000000000000000) == 0 && v10 < 1 << *(unsigned char *)(a1 + 32))
  {
    if (((*(void *)(v30 + (((unint64_t)v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
      goto LABEL_15;
    }
    if (*(_DWORD *)(a1 + 36) != v12) {
      goto LABEL_16;
    }
    int64_t v15 = *(void *)(a1 + 48) + *(void *)(v3 + 72) * v10;
    uint64_t v16 = v31;
    uint64_t v17 = v33;
    (*(void (**)(char *, int64_t, uint64_t))(v3 + 16))(v31, v15, v33);
    unint64_t v18 = v32;
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v32, v16, v17);
    uint64_t v19 = FollowUp.IneligibilityReason.rawValue.getter();
    uint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v18, v17);
    uint64_t v8 = v34;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_100014090(0, v8[2] + 1, 1);
      uint64_t v8 = v34;
    }
    unint64_t v23 = v8[2];
    unint64_t v22 = v8[3];
    if (v23 >= v22 >> 1)
    {
      sub_100014090((char *)(v22 > 1), v23 + 1, 1);
      uint64_t v8 = v34;
    }
    v8[2] = v23 + 1;
    uint64_t v24 = &v8[2 * v23];
    v24[4] = v19;
    v24[5] = v21;
    a1 = v29;
    uint64_t result = sub_100015488(v10, v12, v14 & 1, v29);
    int64_t v10 = result;
    int v12 = v25;
    char v14 = v26 & 1;
    --v7;
    uint64_t v3 = v28;
    if (!v7)
    {
      sub_10001556C(result, v25, v26 & 1);
      return (uint64_t)v8;
    }
  }
  __break(1u);
LABEL_15:
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

void *sub_10000913C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100014090(0, v1, 0);
    uint64_t v3 = (void **)(a1 + 56);
    do
    {
      uint64_t v4 = (uint64_t)*(v3 - 3);
      uint64_t v5 = *(v3 - 2);
      uint64_t v7 = (uint64_t)*(v3 - 1);
      uint64_t v6 = *v3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v8._countAndFlagsBits = v4;
      v8._object = v5;
      String.append(_:)(v8);
      v9._countAndFlagsBits = 8250;
      v9._object = (void *)0xE200000000000000;
      String.append(_:)(v9);
      if (v6) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 0x3E6C696E3CLL;
      }
      if (v6) {
        int v11 = v6;
      }
      else {
        int v11 = (void *)0xE500000000000000;
      }
      swift_bridgeObjectRetain();
      v12._countAndFlagsBits = v10;
      v12._object = v11;
      String.append(_:)(v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = _swiftEmptyArrayStorage[2];
      unint64_t v13 = _swiftEmptyArrayStorage[3];
      if (v14 >= v13 >> 1) {
        sub_100014090((char *)(v13 > 1), v14 + 1, 1);
      }
      v3 += 4;
      _swiftEmptyArrayStorage[2] = v14 + 1;
      int64_t v15 = &_swiftEmptyArrayStorage[2 * v14];
      v15[4] = 8237;
      v15[5] = 0xE200000000000000;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

unint64_t sub_1000092A8(char a1)
{
  unint64_t result = 0x72756769666E6F63;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x656C61636F6CLL;
      break;
    case 3:
      unint64_t result = 0x7365727574616566;
      break;
    case 4:
      unint64_t result = 0x7374656B636974;
      break;
    case 5:
      unint64_t result = 0x6F6C6C6F466D6661;
      break;
    case 6:
      unint64_t result = 0x6F6C6C6F466D6461;
      break;
    case 7:
      unint64_t result = 0x737361707962;
      break;
    case 8:
      unint64_t result = 0x73617079426D6461;
      break;
    case 9:
      unint64_t result = 0x7079427465737361;
      break;
    case 10:
      unint64_t result = 0x6E4974706FLL;
      break;
    case 11:
      unint64_t result = 0x65446C6961746572;
      break;
    case 12:
      unint64_t result = 0xD000000000000012;
      break;
    case 13:
    case 14:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100009488(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100004ACC(&qword_100028510);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  Swift::String v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015678(a1, a1[3]);
  sub_10001AD18();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v9 = *(unsigned char *)(v3 + 1);
  char v10 = *(unsigned char *)(v3 + 2);
  char v11 = *(unsigned char *)(v3 + 3);
  char v12 = *(unsigned char *)(v3 + 4);
  LOBYTE(v16) = *(unsigned char *)v3;
  BYTE1(v16) = v9;
  BYTE2(v16) = v10;
  BYTE3(v16) = v11;
  BYTE4(v16) = v12;
  char v17 = 0;
  sub_10001AD6C();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    LOBYTE(v16) = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v16) = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    uint64_t v16 = *(void *)(v3 + 24);
    char v17 = 3;
    sub_100004ACC(&qword_100028528);
    sub_10001C8A4(&qword_100028530, &qword_100028528, (void (*)(void))sub_10001ADC0);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    uint64_t v16 = *(void *)(v3 + 32);
    char v17 = 4;
    sub_100004ACC(&qword_100028540);
    sub_10001C8A4(&qword_100028548, &qword_100028540, (void (*)(void))sub_10001AE14);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    unint64_t v13 = (int *)type metadata accessor for Diagnostics(0);
    LOBYTE(v16) = 5;
    type metadata accessor for Diagnostics.AFMFollowUpDiagnostics(0);
    sub_100013690(&qword_100028558, (void (*)(uint64_t))type metadata accessor for Diagnostics.AFMFollowUpDiagnostics);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    LOBYTE(v16) = 6;
    type metadata accessor for Diagnostics.ADMFollowUpDiagnostics(0);
    sub_100013690(&qword_100028560, (void (*)(uint64_t))type metadata accessor for Diagnostics.ADMFollowUpDiagnostics);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    LOBYTE(v16) = *(unsigned char *)(v3 + v13[11]);
    char v17 = 7;
    sub_10001AE68();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v16) = *(unsigned char *)(v3 + v13[12]);
    char v17 = 8;
    sub_10001AEBC();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v16) = *(unsigned char *)(v3 + v13[13]);
    char v17 = 9;
    sub_10001AF10();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v16) = *(unsigned char *)(v3 + v13[14]);
    char v17 = 10;
    sub_10001AF64();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v16) = *(unsigned char *)(v3 + v13[15]);
    char v17 = 11;
    sub_10001AFB8();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v16) = 12;
    type metadata accessor for FeatureRequestDiagnostic();
    sub_100013690(&qword_100028220, (void (*)(uint64_t))&type metadata accessor for FeatureRequestDiagnostic);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    LOBYTE(v16) = 13;
    type metadata accessor for AssetDiagnostics();
    sub_100013690(&qword_100028240, (void (*)(uint64_t))&type metadata accessor for AssetDiagnostics);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    LOBYTE(v16) = 14;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100009AD0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v3 = sub_100004ACC(&qword_1000281D8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v35 = (uint64_t)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v33 - v6;
  uint64_t v8 = sub_100004ACC(&qword_1000281E0);
  __chkstk_darwin(v8 - 8);
  char v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004ACC(&qword_1000281F0);
  __chkstk_darwin(v11 - 8);
  unint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100004ACC(&qword_1000281F8);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_100004ACC(&qword_100028610);
  uint64_t v17 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v41 = (int *)type metadata accessor for Diagnostics(0);
  __chkstk_darwin(v41);
  v40 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a1[3];
  unint64_t v38 = a1;
  sub_100015678(a1, v21);
  sub_10001AD18();
  id v36 = v19;
  uint64_t v22 = v39;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v22) {
    return sub_100015710((uint64_t)v38);
  }
  uint64_t v23 = (uint64_t)v16;
  uint64_t v33 = v7;
  uint64_t v39 = v17;
  char v43 = 0;
  sub_10001C7FC();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v24 = v41;
  char v25 = BYTE1(v42);
  char v26 = BYTE2(v42);
  char v27 = BYTE3(v42);
  char v28 = BYTE4(v42);
  uint64_t v29 = v40;
  unsigned char *v40 = v42;
  v29[1] = v25;
  v29[2] = v26;
  v29[3] = v27;
  v29[4] = v28;
  LOBYTE(v42) = 1;
  v29[5] = KeyedDecodingContainer.decode(_:forKey:)() & 1;
  LOBYTE(v42) = 2;
  *((void *)v29 + 1) = KeyedDecodingContainer.decode(_:forKey:)();
  *((void *)v29 + 2) = v30;
  sub_100004ACC(&qword_100028528);
  char v43 = 3;
  sub_10001C8A4(&qword_100028620, &qword_100028528, (void (*)(void))sub_10001C850);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  *((void *)v29 + 3) = v42;
  sub_100004ACC(&qword_100028540);
  char v43 = 4;
  sub_10001C8A4(&qword_100028630, &qword_100028540, (void (*)(void))sub_10001C910);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  *((void *)v29 + 4) = v42;
  type metadata accessor for Diagnostics.AFMFollowUpDiagnostics(0);
  LOBYTE(v42) = 5;
  sub_100013690(&qword_100028640, (void (*)(uint64_t))type metadata accessor for Diagnostics.AFMFollowUpDiagnostics);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  sub_100015578(v23, (uint64_t)&v29[v24[9]], &qword_1000281F8);
  type metadata accessor for Diagnostics.ADMFollowUpDiagnostics(0);
  LOBYTE(v42) = 6;
  sub_100013690(&qword_100028648, (void (*)(uint64_t))type metadata accessor for Diagnostics.ADMFollowUpDiagnostics);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  sub_100015578((uint64_t)v13, (uint64_t)&v29[v24[10]], &qword_1000281F0);
  char v43 = 7;
  sub_10001C964();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v29[v24[11]] = v42;
  char v43 = 8;
  sub_10001C9B8();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v29[v24[12]] = v42;
  char v43 = 9;
  sub_10001CA0C();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v40[v41[13]] = v42;
  char v43 = 10;
  sub_10001CA60();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v40[v41[14]] = v42;
  char v43 = 11;
  sub_10001CAB4();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v40[v41[15]] = v42;
  type metadata accessor for FeatureRequestDiagnostic();
  LOBYTE(v42) = 12;
  sub_100013690(&qword_100028210, (void (*)(uint64_t))&type metadata accessor for FeatureRequestDiagnostic);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  sub_100015578((uint64_t)v10, (uint64_t)&v40[v41[16]], &qword_1000281E0);
  type metadata accessor for AssetDiagnostics();
  LOBYTE(v42) = 13;
  sub_100013690(&qword_100028230, (void (*)(uint64_t))&type metadata accessor for AssetDiagnostics);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  sub_100015578((uint64_t)v33, (uint64_t)&v40[v41[17]], &qword_1000281D8);
  LOBYTE(v42) = 14;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v36, v37);
  uint64_t v31 = (uint64_t)v40;
  sub_100015578(v35, (uint64_t)&v40[v41[18]], &qword_1000281D8);
  sub_10001C738(v31, v34, type metadata accessor for Diagnostics);
  sub_100015710((uint64_t)v38);
  return sub_100014594(v31, type metadata accessor for Diagnostics);
}

unint64_t sub_10000A610()
{
  return sub_1000092A8(*v0);
}

uint64_t sub_10000A618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001BD64(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000A640(unsigned char *a1@<X8>)
{
  *a1 = 15;
}

uint64_t sub_10000A64C(uint64_t a1)
{
  unint64_t v2 = sub_10001AD18();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000A688(uint64_t a1)
{
  unint64_t v2 = sub_10001AD18();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000A6C4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100009AD0(a1, a2);
}

uint64_t sub_10000A6DC(void *a1)
{
  return sub_100009488(a1);
}

uint64_t sub_10000A6F4(__int16 a1)
{
  unint64_t v2 = (char *)_swiftEmptyArrayStorage;
  if (a1)
  {
    unint64_t v2 = sub_100013F4C(0, 1, 1, (char *)_swiftEmptyArrayStorage);
    unint64_t v5 = *((void *)v2 + 2);
    unint64_t v4 = *((void *)v2 + 3);
    if (v5 >= v4 >> 1) {
      unint64_t v2 = sub_100013F4C((char *)(v4 > 1), v5 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v5 + 1;
    uint64_t v6 = &v2[16 * v5];
    *((void *)v6 + 4) = 0xD000000000000063;
    *((void *)v6 + 5) = 0x8000000100021A20;
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_100013F4C(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v8 = *((void *)v2 + 2);
  unint64_t v7 = *((void *)v2 + 3);
  if (v8 >= v7 >> 1) {
    unint64_t v2 = sub_100013F4C((char *)(v7 > 1), v8 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v8 + 1;
  uint64_t v9 = &v2[16 * v8];
  *((void *)v9 + 4) = 0xD000000000000044;
  *((void *)v9 + 5) = 0x80000001000219D0;
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_20:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_100013F4C(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v11 = *((void *)v2 + 2);
  unint64_t v10 = *((void *)v2 + 3);
  if (v11 >= v10 >> 1) {
    unint64_t v2 = sub_100013F4C((char *)(v10 > 1), v11 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v11 + 1;
  uint64_t v12 = &v2[16 * v11];
  *((void *)v12 + 4) = 0xD000000000000038;
  *((void *)v12 + 5) = 0x8000000100021990;
  if ((a1 & 0x10) == 0)
  {
LABEL_5:
    if ((a1 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_25:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_100013F4C(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v14 = *((void *)v2 + 2);
  unint64_t v13 = *((void *)v2 + 3);
  if (v14 >= v13 >> 1) {
    unint64_t v2 = sub_100013F4C((char *)(v13 > 1), v14 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v14 + 1;
  uint64_t v15 = &v2[16 * v14];
  *((void *)v15 + 4) = 0xD000000000000064;
  *((void *)v15 + 5) = 0x8000000100021920;
  if ((a1 & 0x20) == 0)
  {
LABEL_6:
    if ((a1 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_30:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_100013F4C(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v17 = *((void *)v2 + 2);
  unint64_t v16 = *((void *)v2 + 3);
  if (v17 >= v16 >> 1) {
    unint64_t v2 = sub_100013F4C((char *)(v16 > 1), v17 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v17 + 1;
  uint64_t v18 = &v2[16 * v17];
  *((void *)v18 + 4) = 0xD000000000000034;
  *((void *)v18 + 5) = 0x80000001000218E0;
  if ((a1 & 0x40) == 0)
  {
LABEL_7:
    if ((a1 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_35:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_100013F4C(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v20 = *((void *)v2 + 2);
  unint64_t v19 = *((void *)v2 + 3);
  if (v20 >= v19 >> 1) {
    unint64_t v2 = sub_100013F4C((char *)(v19 > 1), v20 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v20 + 1;
  uint64_t v21 = &v2[16 * v20];
  *((void *)v21 + 4) = 0xD00000000000004CLL;
  *((void *)v21 + 5) = 0x8000000100021890;
  if ((a1 & 0x80) == 0)
  {
LABEL_8:
    if ((a1 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_45;
  }
LABEL_40:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_100013F4C(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v23 = *((void *)v2 + 2);
  unint64_t v22 = *((void *)v2 + 3);
  if (v23 >= v22 >> 1) {
    unint64_t v2 = sub_100013F4C((char *)(v22 > 1), v23 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v23 + 1;
  uint64_t v24 = &v2[16 * v23];
  *((void *)v24 + 4) = 0xD0000000000000D5;
  *((void *)v24 + 5) = 0x80000001000217B0;
  if ((a1 & 0x100) == 0)
  {
LABEL_9:
    if ((a1 & 0x200) == 0) {
      goto LABEL_10;
    }
LABEL_50:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v2 = sub_100013F4C(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v29 = *((void *)v2 + 2);
    unint64_t v28 = *((void *)v2 + 3);
    int64_t v3 = v29 + 1;
    if (v29 >= v28 >> 1) {
      unint64_t v2 = sub_100013F4C((char *)(v28 > 1), v29 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v3;
    uint64_t v30 = &v2[16 * v29];
    *((void *)v30 + 4) = 0xD000000000000024;
    *((void *)v30 + 5) = 0x8000000100021720;
    goto LABEL_55;
  }
LABEL_45:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_100013F4C(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v26 = *((void *)v2 + 2);
  unint64_t v25 = *((void *)v2 + 3);
  if (v26 >= v25 >> 1) {
    unint64_t v2 = sub_100013F4C((char *)(v25 > 1), v26 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v26 + 1;
  char v27 = &v2[16 * v26];
  *((void *)v27 + 4) = 0xD00000000000005DLL;
  *((void *)v27 + 5) = 0x8000000100021750;
  if ((a1 & 0x200) != 0) {
    goto LABEL_50;
  }
LABEL_10:
  int64_t v3 = *((void *)v2 + 2);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    goto LABEL_60;
  }
LABEL_55:
  swift_bridgeObjectRetain();
  sub_100014090(0, v3, 0);
  uint64_t v31 = (void **)(v2 + 40);
  do
  {
    uint64_t v32 = (uint64_t)*(v31 - 1);
    uint64_t v33 = *v31;
    swift_bridgeObjectRetain();
    v34._countAndFlagsBits = v32;
    v34._object = v33;
    String.append(_:)(v34);
    swift_bridgeObjectRelease();
    unint64_t v36 = _swiftEmptyArrayStorage[2];
    unint64_t v35 = _swiftEmptyArrayStorage[3];
    if (v36 >= v35 >> 1) {
      sub_100014090((char *)(v35 > 1), v36 + 1, 1);
    }
    v31 += 2;
    _swiftEmptyArrayStorage[2] = v36 + 1;
    uint64_t v37 = &_swiftEmptyArrayStorage[2 * v36];
    v37[4] = 8237;
    v37[5] = 0xE200000000000000;
    --v3;
  }
  while (v3);
  swift_bridgeObjectRelease_n();
LABEL_60:
  sub_100004ACC(&qword_100028180);
  sub_100015760(&qword_100028188, &qword_100028180);
  uint64_t v38 = BidirectionalCollection<>.joined(separator:)();
  v40 = v39;
  swift_bridgeObjectRelease();
  v41._countAndFlagsBits = v38;
  v41._object = v40;
  String.append(_:)(v41);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10000AD3C()
{
  uint64_t v0 = sub_100004ACC(&qword_1000282A8);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for CommandConfiguration();
  sub_100015614(v3, qword_1000288A0);
  sub_1000155DC(v3, (uint64_t)qword_1000288A0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_10000AE88()
{
  v1[93] = v0;
  uint64_t v2 = type metadata accessor for AvailabilityStatus();
  v1[94] = v2;
  v1[95] = *(void *)(v2 - 8);
  v1[96] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for AvailabilityModel();
  v1[97] = v3;
  v1[98] = *(void *)(v3 - 8);
  v1[99] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for FollowUp.IneligibilityReason();
  v1[100] = v4;
  v1[101] = *(void *)(v4 - 8);
  v1[102] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for SiriAssistantLocale();
  v1[103] = v5;
  v1[104] = *(void *)(v5 - 8);
  v1[105] = swift_task_alloc();
  type metadata accessor for String.Encoding();
  v1[106] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for JSONEncoder.DateEncodingStrategy();
  v1[107] = v6;
  v1[108] = *(void *)(v6 - 8);
  v1[109] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for JSONEncoder.OutputFormatting();
  v1[110] = v7;
  v1[111] = *(void *)(v7 - 8);
  v1[112] = swift_task_alloc();
  v1[113] = type metadata accessor for Diagnostics(0);
  v1[114] = swift_task_alloc();
  v1[115] = type metadata accessor for GMDiagnostics(0);
  v1[116] = swift_task_alloc();
  return _swift_task_switch(sub_10000B1A0, 0, 0);
}

uint64_t sub_10000B1A0()
{
  uint64_t v1 = self;
  v0[117] = v1;
  id v2 = [v1 defaultStore];
  v0[118] = v2;
  if (v2)
  {
    uint64_t v3 = v2;
    v0[10] = v0;
    v0[15] = v0 + 80;
    v0[11] = sub_10000B2CC;
    uint64_t v4 = swift_continuation_init();
    v0[57] = _NSConcreteStackBlock;
    v0[58] = 0x40000000;
    v0[59] = sub_100011F78;
    v0[60] = &unk_100024B28;
    v0[61] = v4;
    [v3 aa_primaryAppleAccountWithCompletion:v0 + 57];
    id v2 = v0 + 10;
  }
  else
  {
    __break(1u);
  }
  return _swift_continuation_await(v2);
}

uint64_t sub_10000B2CC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 952) = v1;
  if (v1) {
    id v2 = sub_1000109FC;
  }
  else {
    id v2 = sub_10000B3DC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000B3DC()
{
  uint64_t v98 = v0;
  uint64_t v1 = (unsigned char *)(v0 + 1210);
  id v2 = *(void **)(v0 + 944);
  uint64_t v3 = *(void *)(v0 + 928);
  uint64_t v4 = *(void *)(v0 + 744);
  id v96 = *(id *)(v0 + 640);
  *(void *)(v0 + 960) = v96;

  sub_100004ACC(&qword_100028088);
  Flag.wrappedValue.getter();
  int v5 = *(unsigned __int8 *)(v0 + 1223);
  sub_10001C738(v4, v3, type metadata accessor for GMDiagnostics);
  if (v5 == 1)
  {
    sub_100014594(*(void *)(v0 + 928), type metadata accessor for GMDiagnostics);
    goto LABEL_4;
  }
  uint64_t v6 = *(void *)(v0 + 928);
  Flag.wrappedValue.getter();
  int v7 = *(unsigned __int8 *)(v0 + 1214);
  sub_100014594(v6, type metadata accessor for GMDiagnostics);
  if (v7 == 1)
  {
LABEL_4:
    int v8 = *(unsigned __int8 *)(*(void *)(v0 + 744) + *(int *)(*(void *)(v0 + 920) + 20));
    sub_100004ACC(&qword_100028080);
    Option.wrappedValue.getter();
    int v9 = *(unsigned __int8 *)(v0 + 1220);
    Flag.wrappedValue.getter();
    int v10 = *(unsigned __int8 *)(v0 + 1221);
    Flag.wrappedValue.getter();
    int v11 = *(unsigned __int8 *)(v0 + 1222);
    if (v96 && (id v12 = objc_msgSend(v96, "aa_altDSID")) != 0)
    {
      unint64_t v13 = v12;
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v16 = v15;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v16 = 0;
    }
    *(void *)(v0 + 968) = v16;
    unint64_t v17 = (void *)swift_task_alloc();
    uint64_t v18 = &_mh_execute_header;
    if (!v11) {
      uint64_t v18 = 0;
    }
    uint64_t v19 = 0x1000000;
    if (!v10) {
      uint64_t v19 = 0;
    }
    uint64_t v20 = 0x10000;
    if (!v9) {
      uint64_t v20 = 0;
    }
    *(void *)(v0 + 976) = v17;
    uint64_t v21 = v20 | v19;
    uint64_t v22 = 256;
    if (!v8) {
      uint64_t v22 = 0;
    }
    *unint64_t v17 = v0;
    v17[1] = sub_10000C3B4;
    uint64_t v23 = *(void *)(v0 + 912);
    return sub_100007CDC(v23, v14, v16, v21 | (unint64_t)v18 | v22);
  }
  *(void *)(v0 + 992) = sub_100004ACC(&qword_100028080);
  Option.wrappedValue.getter();
  if (*(unsigned char *)(v0 + 1213))
  {
    char v25 = 2;
  }
  else
  {
    type metadata accessor for GMAssetsBypass();
    char v25 = static GMAssetsBypass.gmAssetsBypass()() & 1;
  }
  *(unsigned char *)(v0 + 1224) = v25;
  uint64_t v26 = *(void *)(v0 + 920);
  uint64_t v93 = *(void *)(v0 + 840);
  uint64_t v94 = *(void *)(v0 + 832);
  uint64_t v95 = *(void *)(v0 + 824);
  uint64_t v27 = *(void *)(v0 + 744);
  *(void *)(v0 + 1000) = type metadata accessor for GMAssetsBypass();
  static GMAssetsBypass.setGMEligibilityBypass(_:)();
  *(void *)(v0 + 1008) = sub_100004ACC(&qword_100028078);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_10001F850;
  *(void *)(v28 + 56) = &type metadata for String;
  *(void *)(v28 + 32) = 0xD000000000000041;
  *(void *)(v28 + 40) = 0x8000000100020BA0;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease();
  *(void *)(v29 + 56) = &type metadata for String;
  *(void *)(v29 + 32) = 0xD000000000000019;
  *(void *)(v29 + 40) = 0x8000000100020BF0;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease();
  v97[0] = 0xD00000000000001CLL;
  v97[1] = 0x8000000100020C10;
  uint64_t v31 = *(int *)(v26 + 20);
  *(_DWORD *)(v0 + 1200) = v31;
  int v32 = *(unsigned __int8 *)(v27 + v31);
  if (v32) {
    uint64_t v33 = 1702195828;
  }
  else {
    uint64_t v33 = 0x65736C6166;
  }
  if (v32) {
    unint64_t v34 = 0xE400000000000000;
  }
  else {
    unint64_t v34 = 0xE500000000000000;
  }
  unint64_t v35 = v34;
  String.append(_:)(*(Swift::String *)&v33);
  swift_bridgeObjectRelease();
  *(void *)(v30 + 56) = &type metadata for String;
  *(void *)(v30 + 32) = v97[0];
  *(void *)(v30 + 40) = v97[1];
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_10001F850;
  strcpy((char *)v97, "--networking ");
  HIWORD(v97[1]) = -4864;
  *(_DWORD *)(v0 + 1204) = *(_DWORD *)(v26 + 28);
  Option.wrappedValue.getter();
  if (*(unsigned char *)(v0 + 1211)) {
    uint64_t v37 = 1702195828;
  }
  else {
    uint64_t v37 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + 1211)) {
    unint64_t v38 = 0xE400000000000000;
  }
  else {
    unint64_t v38 = 0xE500000000000000;
  }
  unint64_t v39 = v38;
  String.append(_:)(*(Swift::String *)&v37);
  swift_bridgeObjectRelease();
  uint64_t v40 = v97[0];
  uint64_t v41 = v97[1];
  *(void *)(v36 + 56) = &type metadata for String;
  *(void *)(v36 + 32) = v40;
  *(void *)(v36 + 40) = v41;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_10001F850;
  strcpy((char *)v97, "--sysd ");
  v97[1] = 0xE700000000000000;
  Flag.wrappedValue.getter();
  if (*v1) {
    uint64_t v43 = 1702195828;
  }
  else {
    uint64_t v43 = 0x65736C6166;
  }
  if (*v1) {
    unint64_t v44 = 0xE400000000000000;
  }
  else {
    unint64_t v44 = 0xE500000000000000;
  }
  unint64_t v45 = v44;
  String.append(_:)(*(Swift::String *)&v43);
  swift_bridgeObjectRelease();
  uint64_t v46 = v97[0];
  uint64_t v47 = v97[1];
  *(void *)(v42 + 56) = &type metadata for String;
  *(void *)(v42 + 32) = v46;
  *(void *)(v42 + 40) = v47;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_10001F850;
  strcpy((char *)v97, "--json ");
  v97[1] = 0xE700000000000000;
  Flag.wrappedValue.getter();
  if (*(unsigned char *)(v0 + 1216)) {
    uint64_t v49 = 1702195828;
  }
  else {
    uint64_t v49 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + 1216)) {
    unint64_t v50 = 0xE400000000000000;
  }
  else {
    unint64_t v50 = 0xE500000000000000;
  }
  unint64_t v51 = v50;
  String.append(_:)(*(Swift::String *)&v49);
  swift_bridgeObjectRelease();
  uint64_t v52 = v97[0];
  uint64_t v53 = v97[1];
  *(void *)(v48 + 56) = &type metadata for String;
  *(void *)(v48 + 32) = v52;
  *(void *)(v48 + 40) = v53;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_10001F850;
  v55._countAndFlagsBits = 0x6967696C655F736FLL;
  v55._object = (void *)0xEE007974696C6962;
  String.append(_:)(v55);
  *(void *)(v54 + 56) = &type metadata for String;
  *(void *)(v54 + 32) = 2106122;
  *(void *)(v54 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v56 = swift_allocObject();
  *(_OWORD *)(v56 + 16) = xmmword_10001F850;
  *(void *)(v56 + 56) = &type metadata for String;
  *(void *)(v56 + 32) = 0xD0000000000000DDLL;
  *(void *)(v56 + 40) = 0x8000000100020C30;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = xmmword_10001F850;
  v97[0] = 2106122;
  v97[1] = 0xE300000000000000;
  v58._countAndFlagsBits = 0x656C61636F4CLL;
  v58._object = (void *)0xE600000000000000;
  String.append(_:)(v58);
  *(void *)(v57 + 56) = &type metadata for String;
  *(void *)(v57 + 32) = 2106122;
  *(void *)(v57 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  SiriAssistantLocale.init()();
  uint64_t v59 = SiriAssistantLocale.current.getter();
  v61 = v60;
  (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v93, v95);
  uint64_t v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_10001F850;
  if (v61)
  {
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease();
    v63._countAndFlagsBits = v59;
    v63._object = v61;
    String.append(_:)(v63);
    swift_bridgeObjectRelease();
    v64._countAndFlagsBits = 46;
    v64._object = (void *)0xE100000000000000;
    String.append(_:)(v64);
    unint64_t v65 = 0x80000001000216B0;
    *(void *)(v62 + 56) = &type metadata for String;
    *(void *)(v62 + 32) = 0xD000000000000016;
  }
  else
  {
    *(void *)(v62 + 56) = &type metadata for String;
    *(void *)(v62 + 32) = 0xD000000000000033;
    unint64_t v65 = 0x8000000100020D10;
  }
  *(void *)(v62 + 40) = v65;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v66 = swift_allocObject();
  *(_OWORD *)(v66 + 16) = xmmword_10001F850;
  v97[0] = 2106122;
  v97[1] = 0xE300000000000000;
  v67._countAndFlagsBits = 0x2065727574616546;
  v67._object = (void *)0xEB00000000495053;
  String.append(_:)(v67);
  *(void *)(v66 + 56) = &type metadata for String;
  *(void *)(v66 + 32) = 2106122;
  *(void *)(v66 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  Option.wrappedValue.getter();
  LODWORD(v66) = *(unsigned __int8 *)(v0 + 1212);
  uint64_t v68 = swift_allocObject();
  *(_OWORD *)(v68 + 16) = xmmword_10001F850;
  *(void *)(v68 + 56) = &type metadata for String;
  if (v66 == 1)
  {
    *(void *)(v68 + 32) = 0xD00000000000002BLL;
    *(void *)(v68 + 40) = 0x8000000100021650;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v69 = (void *)swift_task_alloc();
    *(void *)(v0 + 1016) = v69;
    uint64_t v70 = type metadata accessor for CloudFeature();
    *uint64_t v69 = v0;
    v69[1] = sub_10000C8DC;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 664, 0, 0, 0x29286E7572, 0xE500000000000000, sub_100011F84, 0, v70);
  }
  else
  {
    *(void *)(v68 + 32) = 0xD00000000000003DLL;
    *(void *)(v68 + 40) = 0x8000000100020D50;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    type metadata accessor for FeatureCache();
    static FeatureCache.shared.getter();
    if (v96)
    {
      id v71 = [v96 aa_altDSID];
      if (v71)
      {
        uint64_t v72 = v71;
        static String._unconditionallyBridgeFromObjectiveC(_:)();
      }
    }
    unint64_t v73 = (void *)FeatureCache.cachedFeature(identifier:altDSID:allowAnySession:ignoreTTL:)();
    swift_release();
    swift_bridgeObjectRelease();
    if (v73)
    {
      uint64_t v74 = swift_allocObject();
      *(_OWORD *)(v74 + 16) = xmmword_10001F850;
      id v75 = v73;
      _StringGuts.grow(_:)(38);
      swift_bridgeObjectRelease();
      v97[0] = 0xD000000000000024;
      v97[1] = 0x8000000100021620;
      char v76 = CloudFeature.canUse.getter();
      BOOL v77 = (v76 & 1) == 0;
      if (v76) {
        uint64_t v78 = 1702195828;
      }
      else {
        uint64_t v78 = 0x65736C6166;
      }
      if (v77) {
        unint64_t v79 = 0xE500000000000000;
      }
      else {
        unint64_t v79 = 0xE400000000000000;
      }
      unint64_t v80 = v79;
      String.append(_:)(*(Swift::String *)&v78);
      swift_bridgeObjectRelease();
      uint64_t v81 = v97[0];
      uint64_t v82 = v97[1];
      *(void *)(v74 + 56) = &type metadata for String;
      *(void *)(v74 + 32) = v81;
      *(void *)(v74 + 40) = v82;
      print(_:separator:terminator:)();
    }
    else
    {
      uint64_t v83 = swift_allocObject();
      *(_OWORD *)(v83 + 16) = xmmword_10001F850;
      *(void *)(v83 + 56) = &type metadata for String;
      *(void *)(v83 + 32) = 0xD00000000000001ALL;
      *(void *)(v83 + 40) = 0x8000000100020D90;
      print(_:separator:terminator:)();
    }
    *(void *)(v0 + 1040) = v73;
    *(void *)(v0 + 1032) = 0;
    swift_bridgeObjectRelease();
    static FeatureCache.shared.getter();
    uint64_t v84 = FeatureCache.persistentDomain.getter();
    swift_release();
    uint64_t v85 = swift_allocObject();
    *(_OWORD *)(v85 + 16) = xmmword_10001F850;
    if (v84)
    {
      _StringGuts.grow(_:)(40);
      swift_bridgeObjectRelease();
      v86._countAndFlagsBits = Dictionary.Keys.description.getter();
      String.append(_:)(v86);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v87 = 0x80000001000215F0;
      *(void *)(v85 + 56) = &type metadata for String;
      *(void *)(v85 + 32) = 0xD000000000000026;
    }
    else
    {
      *(void *)(v85 + 56) = &type metadata for String;
      *(void *)(v85 + 32) = 0xD00000000000001BLL;
      unint64_t v87 = 0x8000000100020DB0;
    }
    *(void *)(v85 + 40) = v87;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v88 = swift_allocObject();
    *(_OWORD *)(v88 + 16) = xmmword_10001F850;
    v89._countAndFlagsBits = 0xD000000000000017;
    v89._object = (void *)0x8000000100020DD0;
    String.append(_:)(v89);
    *(void *)(v88 + 56) = &type metadata for String;
    *(void *)(v88 + 32) = 2106122;
    *(void *)(v88 + 40) = 0xE300000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    char v90 = self;
    *(void *)(v0 + 1048) = v90;
    NSString v91 = String._bridgeToObjectiveC()();
    *(void *)(v0 + 1056) = v91;
    *(void *)(v0 + 208) = v0;
    *(void *)(v0 + 248) = v0 + 696;
    *(void *)(v0 + 216) = sub_10000CDCC;
    uint64_t v92 = swift_continuation_init();
    *(void *)(v0 + 416) = _NSConcreteStackBlock;
    *(void *)(v0 + 424) = 0x40000000;
    *(void *)(v0 + 432) = sub_100012158;
    *(void *)(v0 + 440) = &unk_100024B40;
    *(void *)(v0 + 448) = v92;
    [v90 getTicketStatusFromCacheForFeature:v91 completionHandler:v0 + 416];
    return _swift_continuation_await(v0 + 208);
  }
}

uint64_t sub_10000C3B4()
{
  *(void *)(*(void *)v1 + 984) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_100010AF0;
  }
  else
  {
    swift_bridgeObjectRelease();
    id v2 = sub_10000C4D0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000C4D0()
{
  uint64_t v18 = v0[123];
  uint64_t v1 = v0[109];
  uint64_t v2 = v0[108];
  uint64_t v17 = v0[107];
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  sub_100004ACC(&qword_1000281B0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10001F8B0;
  static JSONEncoder.OutputFormatting.prettyPrinted.getter();
  static JSONEncoder.OutputFormatting.sortedKeys.getter();
  v0[89] = v3;
  sub_100013690(&qword_1000281B8, (void (*)(uint64_t))&type metadata accessor for JSONEncoder.OutputFormatting);
  sub_100004ACC(&qword_1000281C0);
  sub_100015760(&qword_1000281C8, &qword_1000281C0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  dispatch thunk of JSONEncoder.outputFormatting.setter();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for JSONEncoder.DateEncodingStrategy.iso8601(_:), v17);
  dispatch thunk of JSONEncoder.dateEncodingStrategy.setter();
  sub_100013690(&qword_1000281D0, (void (*)(uint64_t))type metadata accessor for Diagnostics);
  uint64_t v4 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  uint64_t v6 = (void *)v0[120];
  uint64_t v7 = v0[114];
  if (v18)
  {
    sub_100014594(v0[114], type metadata accessor for Diagnostics);
    swift_release();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    int v8 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    uint64_t v9 = v4;
    unint64_t v10 = v5;
    static String.Encoding.utf8.getter();
    uint64_t v11 = String.init(data:encoding:)();
    if (v12) {
      unint64_t v13 = v11;
    }
    else {
      unint64_t v13 = 0xD00000000000002ELL;
    }
    if (v12) {
      unint64_t v14 = v12;
    }
    else {
      unint64_t v14 = 0x80000001000216D0;
    }
    sub_100004ACC(&qword_100028078);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_10001F850;
    *(void *)(v15 + 56) = &type metadata for String;
    *(void *)(v15 + 32) = v13;
    *(void *)(v15 + 40) = v14;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    sub_1000145F4(v9, v10);
    swift_release();

    sub_100014594(v7, type metadata accessor for Diagnostics);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    int v8 = (uint64_t (*)(void))v0[1];
  }
  return v8();
}

uint64_t sub_10000C8DC()
{
  *(void *)(*(void *)v1 + 1024) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100010BE8;
  }
  else {
    uint64_t v2 = sub_10000C9F0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000C9F0()
{
  uint64_t v1 = (void *)v0[83];
  uint64_t v2 = v0[128];
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10001F850;
  id v4 = v1;
  _StringGuts.grow(_:)(38);
  swift_bridgeObjectRelease();
  char v5 = CloudFeature.canUse.getter();
  BOOL v6 = (v5 & 1) == 0;
  if (v5) {
    uint64_t v7 = 1702195828;
  }
  else {
    uint64_t v7 = 0x65736C6166;
  }
  if (v6) {
    unint64_t v8 = 0xE500000000000000;
  }
  else {
    unint64_t v8 = 0xE400000000000000;
  }
  unint64_t v9 = v8;
  String.append(_:)(*(Swift::String *)&v7);
  swift_bridgeObjectRelease();
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD000000000000024;
  *(void *)(v3 + 40) = 0x8000000100021620;
  print(_:separator:terminator:)();

  v0[130] = v1;
  v0[129] = v2;
  swift_bridgeObjectRelease();
  type metadata accessor for FeatureCache();
  static FeatureCache.shared.getter();
  uint64_t v10 = FeatureCache.persistentDomain.getter();
  swift_release();
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10001F850;
  if (v10)
  {
    _StringGuts.grow(_:)(40);
    swift_bridgeObjectRelease();
    v12._countAndFlagsBits = Dictionary.Keys.description.getter();
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v13 = 0x80000001000215F0;
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 32) = 0xD000000000000026;
  }
  else
  {
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 32) = 0xD00000000000001BLL;
    unint64_t v13 = 0x8000000100020DB0;
  }
  *(void *)(v11 + 40) = v13;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10001F850;
  v15._object = (void *)0x8000000100020DD0;
  v15._countAndFlagsBits = 0xD000000000000017;
  String.append(_:)(v15);
  *(void *)(v14 + 56) = &type metadata for String;
  *(void *)(v14 + 32) = 2106122;
  *(void *)(v14 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v16 = self;
  v0[131] = v16;
  NSString v17 = String._bridgeToObjectiveC()();
  v0[132] = v17;
  v0[26] = v0;
  v0[31] = v0 + 87;
  v0[27] = sub_10000CDCC;
  uint64_t v18 = swift_continuation_init();
  v0[52] = _NSConcreteStackBlock;
  v0[53] = 0x40000000;
  v0[54] = sub_100012158;
  v0[55] = &unk_100024B40;
  v0[56] = v18;
  [v16 getTicketStatusFromCacheForFeature:v17 completionHandler:v0 + 52];
  return _swift_continuation_await(v0 + 26);
}

uint64_t sub_10000CDCC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 240);
  *(void *)(*(void *)v0 + 1064) = v1;
  if (v1) {
    uint64_t v2 = sub_100011004;
  }
  else {
    uint64_t v2 = sub_10000CEDC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000CEDC()
{
  uint64_t v62 = v0;
  uint64_t v1 = *(void **)(v0 + 696);

  if (v1)
  {
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_10001F850;
    _StringGuts.grow(_:)(44);
    swift_bridgeObjectRelease();
    unint64_t v60 = 0xD00000000000002ALL;
    unint64_t v61 = 0x80000001000215C0;
    id v3 = [v1 description];
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    BOOL v6 = v5;

    v7._countAndFlagsBits = v4;
    v7._object = v6;
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    *(void *)(v2 + 56) = &type metadata for String;
    *(void *)(v2 + 32) = v60;
    *(void *)(v2 + 40) = v61;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_10001F850;
    *(void *)(v8 + 56) = &type metadata for String;
    *(void *)(v8 + 32) = 0xD000000000000035;
    *(void *)(v8 + 40) = 0x8000000100021580;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = *(void *)(v0 + 1032);
  *(void *)(v0 + 1072) = v9;
  uint64_t v10 = *(void *)(v0 + 960);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10001F850;
  strcpy((char *)v58, "All tickets:\n");
  HIWORD(v58[1]) = -4864;
  type metadata accessor for TicketCache();
  static TicketCache.shared.getter();
  uint64_t v55 = v9;
  uint64_t v56 = (void *)v11;
  if (v10)
  {
    id v12 = [*(id *)(v0 + 960) aa_altDSID];
    if (v12)
    {
      unint64_t v13 = v12;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
  }
  uint64_t v14 = TicketCache.allTickets(forDSID:)();
  swift_release();
  swift_bridgeObjectRelease();
  int64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    uint64_t v59 = _swiftEmptyArrayStorage;
    sub_100014090(0, v15, 0);
    uint64_t v16 = _swiftEmptyArrayStorage;
    NSString v17 = (void **)(v14 + 48);
    do
    {
      uint64_t v19 = (uint64_t)*(v17 - 2);
      uint64_t v18 = *(v17 - 1);
      uint64_t v20 = *v17;
      unint64_t v60 = 8237;
      unint64_t v61 = 0xE200000000000000;
      swift_bridgeObjectRetain();
      id v21 = v20;
      v22._countAndFlagsBits = v19;
      v22._object = v18;
      String.append(_:)(v22);
      v23._countAndFlagsBits = 8250;
      v23._object = (void *)0xE200000000000000;
      String.append(_:)(v23);
      id v24 = [v21 description];
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v27 = v26;

      v28._countAndFlagsBits = v25;
      v28._object = v27;
      String.append(_:)(v28);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      uint64_t v59 = v16;
      unint64_t v30 = v16[2];
      unint64_t v29 = v16[3];
      if (v30 >= v29 >> 1)
      {
        sub_100014090((char *)(v29 > 1), v30 + 1, 1);
        uint64_t v16 = v59;
      }
      v16[2] = v30 + 1;
      uint64_t v31 = &v16[2 * v30];
      v31[4] = 8237;
      v31[5] = 0xE200000000000000;
      v17 += 3;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v16 = _swiftEmptyArrayStorage;
  }
  *(void *)(v0 + 632) = v16;
  *(void *)(v0 + 1080) = sub_100004ACC(&qword_100028180);
  *(void *)(v0 + 1088) = sub_100015760(&qword_100028188, &qword_100028180);
  uint64_t v32 = BidirectionalCollection<>.joined(separator:)();
  unint64_t v34 = v33;
  swift_bridgeObjectRelease();
  v35._countAndFlagsBits = v32;
  v35._object = v34;
  String.append(_:)(v35);
  swift_bridgeObjectRelease();
  uint64_t v36 = v58[0];
  uint64_t v37 = v58[1];
  v56[7] = &type metadata for String;
  v56[4] = v36;
  v56[5] = v37;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_10001F850;
  unint64_t v60 = 2106122;
  unint64_t v61 = 0xE300000000000000;
  v39._object = (void *)0x8000000100020E70;
  v39._countAndFlagsBits = 0xD000000000000018;
  String.append(_:)(v39);
  *(void *)(v38 + 56) = &type metadata for String;
  *(void *)(v38 + 32) = 2106122;
  *(void *)(v38 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  Option.wrappedValue.getter();
  if (*(unsigned char *)(v0 + 1219))
  {
    uint64_t v40 = *(void **)(v0 + 1048);
    NSString v41 = String._bridgeToObjectiveC()();
    *(void *)(v0 + 1096) = v41;
    *(void *)(v0 + 272) = v0;
    *(void *)(v0 + 312) = v0 + 704;
    *(void *)(v0 + 280) = sub_10000D770;
    uint64_t v42 = swift_continuation_init();
    *(void *)(v0 + 336) = _NSConcreteStackBlock;
    *(void *)(v0 + 344) = 0x40000000;
    *(void *)(v0 + 352) = sub_100012230;
    *(void *)(v0 + 360) = &unk_100024B88;
    *(void *)(v0 + 368) = v42;
    [v40 getTicketStatusForFeature:v41 completionHandler:v0 + 336];
    return _swift_continuation_await(v0 + 272);
  }
  else
  {
    uint64_t v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_10001F850;
    *(void *)(v43 + 56) = &type metadata for String;
    *(void *)(v43 + 32) = 0xD000000000000055;
    *(void *)(v43 + 40) = 0x8000000100020E90;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1112) = v55;
    uint64_t v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_10001F850;
    unint64_t v60 = 2106122;
    unint64_t v61 = 0xE300000000000000;
    v45._countAndFlagsBits = 0x7055776F6C6C6F46;
    v45._object = (void *)0xEE00295546432820;
    String.append(_:)(v45);
    *(void *)(v44 + 56) = &type metadata for String;
    *(void *)(v44 + 32) = 2106122;
    *(void *)(v44 + 40) = 0xE300000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    sub_10001E328();
    sub_10001E46C();
    type metadata accessor for FollowUp();
    uint64_t v46 = FollowUp.__allocating_init()();
    *(void *)(v0 + 1120) = v46;
    uint64_t v47 = v0;
    if (v46)
    {
      uint64_t v57 = (char *)&async function pointer to dispatch thunk of FollowUp.ineligibilityReasons(oldFeature:newFeature:)
          + async function pointer to dispatch thunk of FollowUp.ineligibilityReasons(oldFeature:newFeature:);
      uint64_t v48 = (void *)swift_task_alloc();
      *(void *)(v0 + 1128) = v48;
      *uint64_t v48 = v0;
      v48[1] = sub_10000DBEC;
      uint64_t v49 = *(void *)(v0 + 1040);
      return ((uint64_t (*)(void, uint64_t))v57)(0, v49);
    }
    else
    {
      unint64_t v50 = *(void **)(v0 + 1040);
      unint64_t v51 = *(void **)(v47 + 960);
      uint64_t v52 = swift_allocObject();
      *(_OWORD *)(v52 + 16) = xmmword_10001F850;
      *(void *)(v52 + 56) = &type metadata for String;
      *(void *)(v52 + 32) = 0xD000000000000025;
      *(void *)(v52 + 40) = 0x8000000100020EF0;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease();

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v53 = *(uint64_t (**)(void))(v47 + 8);
      return v53();
    }
  }
}

uint64_t sub_10000D770()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 304);
  *(void *)(*(void *)v0 + 1104) = v1;
  if (v1) {
    uint64_t v2 = sub_100011848;
  }
  else {
    uint64_t v2 = sub_10000D880;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000D880()
{
  uint64_t v1 = *(void **)(v0 + 704);

  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(46);
  swift_bridgeObjectRelease();
  id v3 = [v1 description];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v6 = v5;

  v7._countAndFlagsBits = v4;
  v7._object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 32) = 0xD00000000000002CLL;
  *(void *)(v2 + 40) = 0x8000000100021550;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();

  *(void *)(v0 + 1112) = *(void *)(v0 + 1072);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10001F850;
  v9._countAndFlagsBits = 0x7055776F6C6C6F46;
  v9._object = (void *)0xEE00295546432820;
  String.append(_:)(v9);
  *(void *)(v8 + 56) = &type metadata for String;
  *(void *)(v8 + 32) = 2106122;
  *(void *)(v8 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  sub_10001E328();
  sub_10001E46C();
  type metadata accessor for FollowUp();
  uint64_t v10 = FollowUp.__allocating_init()();
  *(void *)(v0 + 1120) = v10;
  if (v10)
  {
    uint64_t v18 = (char *)&async function pointer to dispatch thunk of FollowUp.ineligibilityReasons(oldFeature:newFeature:)
        + async function pointer to dispatch thunk of FollowUp.ineligibilityReasons(oldFeature:newFeature:);
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 1128) = v11;
    void *v11 = v0;
    v11[1] = sub_10000DBEC;
    uint64_t v12 = *(void *)(v0 + 1040);
    return ((uint64_t (*)(void, uint64_t))v18)(0, v12);
  }
  else
  {
    uint64_t v14 = *(void **)(v0 + 1040);
    int64_t v15 = *(void **)(v0 + 960);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_10001F850;
    *(void *)(v16 + 56) = &type metadata for String;
    *(void *)(v16 + 32) = 0xD000000000000025;
    *(void *)(v16 + 40) = 0x8000000100020EF0;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    NSString v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17();
  }
}

uint64_t sub_10000DBEC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 1136) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000DCEC, 0, 0);
}

uint64_t sub_10000DCEC()
{
  uint64_t v1 = *(void *)(v0 + 1136);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2 == 1)
  {
    uint64_t v5 = *(void *)(v0 + 816);
    uint64_t v6 = *(void *)(v0 + 808);
    uint64_t v7 = *(void *)(v0 + 800);
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, enum case for FollowUp.IneligibilityReason.hadPreviousAccess(_:), v7);
    char v8 = sub_1000122F0(v5, v1);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    uint64_t v1 = *(void *)(v0 + 1136);
    if (v8)
    {
      swift_bridgeObjectRelease();
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_10001F850;
      *(void *)(v9 + 56) = &type metadata for String;
      *(void *)(v9 + 32) = 0xD000000000000022;
      *(void *)(v9 + 40) = 0x8000000100021480;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease();
      uint64_t v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_10001F850;
      *(void *)(v3 + 56) = &type metadata for String;
      *(void *)(v3 + 32) = 0xD000000000000051;
      uint64_t v4 = "Note: CFU showing will be contingent on whether the device previously had access.";
      goto LABEL_6;
    }
  }
  else if (!v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_10001F850;
    *(void *)(v3 + 56) = &type metadata for String;
    *(void *)(v3 + 32) = 0xD000000000000022;
    uint64_t v4 = "User is fully eligible to see CFU.";
LABEL_6:
    unint64_t v10 = (unint64_t)(v4 - 32) | 0x8000000000000000;
    uint64_t v11 = *(void *)(v0 + 1112);
    goto LABEL_8;
  }
  uint64_t v11 = *(void *)(v0 + 1112);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(44);
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_100014430(v1);
  sub_100008E74(v12);
  swift_release();
  v13._countAndFlagsBits = Array.description.getter();
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v10 = 0x8000000100020F20;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD00000000000002ALL;
LABEL_8:
  *(void *)(v0 + 1144) = v11;
  *(void *)(v3 + 40) = v10;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10001F850;
  v15._countAndFlagsBits = 0xD000000000000011;
  v15._object = (void *)0x8000000100020F50;
  String.append(_:)(v15);
  *(void *)(v14 + 56) = &type metadata for String;
  *(void *)(v14 + 32) = 2106122;
  *(void *)(v14 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  Option.wrappedValue.getter();
  int v16 = *(unsigned __int8 *)(v0 + 1218);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_10001F850;
  *(void *)(v17 + 56) = &type metadata for String;
  if (v16 == 1)
  {
    *(void *)(v17 + 32) = 0xD000000000000054;
    *(void *)(v17 + 40) = 0x8000000100021420;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    type metadata accessor for AvailabilityManager();
    *(void *)(v0 + 1152) = static AvailabilityManager.shared.getter();
    unint64_t v73 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of AvailabilityManager.fetch()
                                          + async function pointer to dispatch thunk of AvailabilityManager.fetch());
    uint64_t v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 1160) = v18;
    *uint64_t v18 = v0;
    v18[1] = sub_10000EBE4;
    uint64_t v19 = *(void *)(v0 + 792);
    return v73(v19);
  }
  *(void *)(v17 + 32) = 0xD000000000000045;
  *(void *)(v17 + 40) = 0x8000000100020F70;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  type metadata accessor for AvailabilityManager();
  static AvailabilityManager.shared.getter();
  dispatch thunk of AvailabilityManager.cached()();
  swift_release();
  Option.wrappedValue.getter();
  if ((*(unsigned char *)(v0 + 1217) & 1) == 0)
  {
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_10001F850;
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 32) = 0xD00000000000005FLL;
    *(void *)(v21 + 40) = 0x8000000100020FC0;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
  }
  uint64_t v22 = *(void *)(v0 + 768);
  uint64_t v23 = *(void *)(v0 + 760);
  uint64_t v24 = *(void *)(v0 + 752);
  AvailabilityModel.status.getter();
  int v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 88))(v22, v24);
  if (v25 == enum case for AvailabilityStatus.unavailable(_:))
  {
    uint64_t v26 = *(uint64_t **)(v0 + 768);
    (*(void (**)(uint64_t *, void))(*(void *)(v0 + 760) + 96))(v26, *(void *)(v0 + 752));
    uint64_t v27 = *v26;
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_10001F850;
    _StringGuts.grow(_:)(29);
    swift_bridgeObjectRelease();
    v29._countAndFlagsBits = sub_10000A6F4(v27);
    String.append(_:)(v29);
    swift_bridgeObjectRelease();
    unint64_t v30 = 0x8000000100021020;
    *(void *)(v28 + 56) = &type metadata for String;
    *(void *)(v28 + 32) = 0xD00000000000001BLL;
  }
  else
  {
    if (v25 == enum case for AvailabilityStatus.available(_:))
    {
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_10001F850;
      *(void *)(v28 + 56) = &type metadata for String;
      *(void *)(v28 + 32) = 0xD00000000000001FLL;
      uint64_t v31 = "User has full access: available";
    }
    else
    {
      if (v25 != enum case for AvailabilityStatus.limited(_:))
      {
        uint64_t v70 = *(void *)(v0 + 752);

        uint64_t v71 = v70;
        uint64_t v72 = v70;
        return _diagnoseUnexpectedEnumCase<A>(type:)(v71, v72);
      }
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_10001F850;
      *(void *)(v28 + 56) = &type metadata for String;
      *(void *)(v28 + 32) = 0xD000000000000020;
      uint64_t v31 = "User has limited access: limited";
    }
    unint64_t v30 = (unint64_t)(v31 - 32) | 0x8000000000000000;
  }
  *(void *)(v28 + 40) = v30;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_10001F850;
  v33._countAndFlagsBits = 0xD000000000000018;
  v33._object = (void *)0x8000000100021040;
  String.append(_:)(v33);
  *(void *)(v32 + 56) = &type metadata for String;
  *(void *)(v32 + 32) = 2106122;
  *(void *)(v32 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  Option.wrappedValue.getter();
  if (*(unsigned char *)(v0 + 1215) != 1)
  {
    uint64_t v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_10001F850;
    *(void *)(v37 + 56) = &type metadata for String;
    *(void *)(v37 + 32) = 0xD00000000000003BLL;
    *(void *)(v37 + 40) = 0x8000000100021060;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_10001F850;
    v39._object = (void *)0x80000001000210A0;
    v39._countAndFlagsBits = 0xD000000000000013;
    String.append(_:)(v39);
    *(void *)(v38 + 56) = &type metadata for String;
    *(void *)(v38 + 32) = 2106122;
    *(void *)(v38 + 40) = 0xE300000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_10001F850;
    _StringGuts.grow(_:)(80);
    v41._countAndFlagsBits = 0xD00000000000004ELL;
    v41._object = (void *)0x80000001000210C0;
    String.append(_:)(v41);
    type metadata accessor for GMOptIn();
    uint64_t v42 = (void *)static GMOptIn.shared.getter();
    char v43 = dispatch thunk of GMOptIn.isOptedInGlobalDomain.getter();

    if (v43) {
      uint64_t v44 = 1702195828;
    }
    else {
      uint64_t v44 = 0x65736C6166;
    }
    if (v43) {
      unint64_t v45 = 0xE400000000000000;
    }
    else {
      unint64_t v45 = 0xE500000000000000;
    }
    unint64_t v46 = v45;
    String.append(_:)(*(Swift::String *)&v44);
    swift_bridgeObjectRelease();
    *(void *)(v40 + 56) = &type metadata for String;
    *(void *)(v40 + 32) = 0;
    *(void *)(v40 + 40) = 0xE000000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_10001F850;
    _StringGuts.grow(_:)(28);
    swift_bridgeObjectRelease();
    uint64_t v48 = (void *)static GMOptIn.shared.getter();
    char v49 = dispatch thunk of GMOptIn.isOptedIn.getter();

    if (v49) {
      uint64_t v50 = 1702195828;
    }
    else {
      uint64_t v50 = 0x65736C6166;
    }
    if (v49) {
      unint64_t v51 = 0xE400000000000000;
    }
    else {
      unint64_t v51 = 0xE500000000000000;
    }
    unint64_t v52 = v51;
    String.append(_:)(*(Swift::String *)&v50);
    swift_bridgeObjectRelease();
    *(void *)(v47 + 56) = &type metadata for String;
    *(void *)(v47 + 32) = 0xD00000000000001ALL;
    *(void *)(v47 + 40) = 0x8000000100021110;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v53 = swift_allocObject();
    *(_OWORD *)(v53 + 16) = xmmword_10001F850;
    v54._object = (void *)0x8000000100021130;
    v54._countAndFlagsBits = 0xD000000000000013;
    String.append(_:)(v54);
    *(void *)(v53 + 56) = &type metadata for String;
    *(void *)(v53 + 32) = 2106122;
    *(void *)(v53 + 40) = 0xE300000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    type metadata accessor for DefaultsMigrator();
    uint64_t v55 = static DefaultsMigrator.diagnostics()();
    if (*(void *)(v55 + 16))
    {
      uint64_t v56 = swift_allocObject();
      *(_OWORD *)(v56 + 16) = xmmword_10001F850;
      *(void *)(v0 + 680) = v55;
      uint64_t v57 = BidirectionalCollection<>.joined(separator:)();
      unint64_t v59 = v58;
      swift_bridgeObjectRelease();
      *(void *)(v56 + 56) = &type metadata for String;
      *(void *)(v56 + 32) = v57;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v56 = swift_allocObject();
      *(_OWORD *)(v56 + 16) = xmmword_10001F850;
      *(void *)(v56 + 56) = &type metadata for String;
      *(void *)(v56 + 32) = 0xD00000000000002CLL;
      unint64_t v59 = 0x8000000100021330;
    }
    unint64_t v60 = *(void **)(v0 + 936);
    *(void *)(v56 + 40) = v59;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = xmmword_10001F850;
    v62._countAndFlagsBits = 0xD00000000000001ELL;
    v62._object = (void *)0x8000000100021150;
    String.append(_:)(v62);
    *(void *)(v61 + 56) = &type metadata for String;
    *(void *)(v61 + 32) = 2106122;
    *(void *)(v61 + 40) = 0xE300000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v63 = swift_allocObject();
    *(_OWORD *)(v63 + 16) = xmmword_10001F850;
    *(void *)(v63 + 56) = &type metadata for String;
    *(void *)(v63 + 32) = 0xD000000000000047;
    *(void *)(v63 + 40) = 0x8000000100021170;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v64 = swift_allocObject();
    *(_OWORD *)(v64 + 16) = xmmword_10001F850;
    *(void *)(v64 + 56) = &type metadata for String;
    *(void *)(v64 + 32) = 0xD000000000000046;
    *(void *)(v64 + 40) = 0x80000001000211C0;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v65 = swift_allocObject();
    *(_OWORD *)(v65 + 16) = xmmword_10001F850;
    *(void *)(v65 + 56) = &type metadata for String;
    *(void *)(v65 + 32) = 0xD000000000000048;
    *(void *)(v65 + 40) = 0x8000000100021210;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v66 = swift_allocObject();
    *(_OWORD *)(v66 + 16) = xmmword_10001F850;
    v67._countAndFlagsBits = 0x634120656C707041;
    v67._object = (void *)0xED0000746E756F63;
    String.append(_:)(v67);
    *(void *)(v66 + 56) = &type metadata for String;
    *(void *)(v66 + 32) = 2106122;
    *(void *)(v66 + 40) = 0xE300000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    id v68 = [v60 defaultStore];
    *(void *)(v0 + 1184) = v68;
    if (v68)
    {
      uint64_t v69 = v68;
      *(void *)(v0 + 144) = v0;
      *(void *)(v0 + 184) = v0 + 688;
      *(void *)(v0 + 152) = sub_1000102A0;
      *(void *)(v0 + 528) = swift_continuation_init();
      *(void *)(v0 + 496) = _NSConcreteStackBlock;
      *(void *)(v0 + 504) = 0x40000000;
      *(void *)(v0 + 512) = sub_100011F78;
      *(void *)(v0 + 520) = &unk_100024B58;
      [v69 aa_primaryAppleAccountWithCompletion:v0 + 496];
      uint64_t v36 = v0 + 144;
      goto LABEL_40;
    }

    __break(1u);
    return _diagnoseUnexpectedEnumCase<A>(type:)(v71, v72);
  }
  type metadata accessor for Assets();
  unint64_t v34 = (void *)static Assets.shared.getter();
  *(void *)(v0 + 1168) = v34;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 1208;
  *(void *)(v0 + 24) = sub_10000F7C8;
  uint64_t v35 = swift_continuation_init();
  *(void *)(v0 + 376) = _NSConcreteStackBlock;
  *(void *)(v0 + 384) = 0x40000000;
  *(void *)(v0 + 392) = sub_100012504;
  *(void *)(v0 + 400) = &unk_100024B70;
  *(void *)(v0 + 408) = v35;
  [v34 assetStatusWithCompletionHandler:v0 + 376];
  uint64_t v36 = v0 + 16;
LABEL_40:
  return _swift_continuation_await(v36);
}

uint64_t sub_10000EBE4()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_10000ECFC, 0, 0);
}

uint64_t sub_10000ECFC()
{
  Option.wrappedValue.getter();
  if ((*(unsigned char *)(v0 + 1217) & 1) == 0)
  {
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_10001F850;
    *(void *)(v1 + 56) = &type metadata for String;
    *(void *)(v1 + 32) = 0xD00000000000005FLL;
    *(void *)(v1 + 40) = 0x8000000100020FC0;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
  }
  uint64_t v2 = *(void *)(v0 + 768);
  uint64_t v3 = *(void *)(v0 + 760);
  uint64_t v4 = *(void *)(v0 + 752);
  AvailabilityModel.status.getter();
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v4);
  if (v5 == enum case for AvailabilityStatus.unavailable(_:))
  {
    uint64_t v6 = *(uint64_t **)(v0 + 768);
    (*(void (**)(uint64_t *, void))(*(void *)(v0 + 760) + 96))(v6, *(void *)(v0 + 752));
    uint64_t v7 = *v6;
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_10001F850;
    _StringGuts.grow(_:)(29);
    swift_bridgeObjectRelease();
    v9._countAndFlagsBits = sub_10000A6F4(v7);
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    unint64_t v10 = 0x8000000100021020;
    *(void *)(v8 + 56) = &type metadata for String;
    *(void *)(v8 + 32) = 0xD00000000000001BLL;
  }
  else
  {
    if (v5 == enum case for AvailabilityStatus.available(_:))
    {
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_10001F850;
      *(void *)(v8 + 56) = &type metadata for String;
      *(void *)(v8 + 32) = 0xD00000000000001FLL;
      uint64_t v11 = "User has full access: available";
    }
    else
    {
      if (v5 != enum case for AvailabilityStatus.limited(_:))
      {
        uint64_t v50 = *(void *)(v0 + 752);

        uint64_t v51 = v50;
        uint64_t v52 = v50;
        return _diagnoseUnexpectedEnumCase<A>(type:)(v51, v52);
      }
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_10001F850;
      *(void *)(v8 + 56) = &type metadata for String;
      *(void *)(v8 + 32) = 0xD000000000000020;
      uint64_t v11 = "User has limited access: limited";
    }
    unint64_t v10 = (unint64_t)(v11 - 32) | 0x8000000000000000;
  }
  *(void *)(v8 + 40) = v10;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10001F850;
  v13._countAndFlagsBits = 0xD000000000000018;
  v13._object = (void *)0x8000000100021040;
  String.append(_:)(v13);
  *(void *)(v12 + 56) = &type metadata for String;
  *(void *)(v12 + 32) = 2106122;
  *(void *)(v12 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  Option.wrappedValue.getter();
  if (*(unsigned char *)(v0 + 1215) != 1)
  {
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_10001F850;
    *(void *)(v17 + 56) = &type metadata for String;
    *(void *)(v17 + 32) = 0xD00000000000003BLL;
    *(void *)(v17 + 40) = 0x8000000100021060;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_10001F850;
    v19._object = (void *)0x80000001000210A0;
    v19._countAndFlagsBits = 0xD000000000000013;
    String.append(_:)(v19);
    *(void *)(v18 + 56) = &type metadata for String;
    *(void *)(v18 + 32) = 2106122;
    *(void *)(v18 + 40) = 0xE300000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_10001F850;
    _StringGuts.grow(_:)(80);
    v21._countAndFlagsBits = 0xD00000000000004ELL;
    v21._object = (void *)0x80000001000210C0;
    String.append(_:)(v21);
    type metadata accessor for GMOptIn();
    uint64_t v22 = (void *)static GMOptIn.shared.getter();
    char v23 = dispatch thunk of GMOptIn.isOptedInGlobalDomain.getter();

    if (v23) {
      uint64_t v24 = 1702195828;
    }
    else {
      uint64_t v24 = 0x65736C6166;
    }
    if (v23) {
      unint64_t v25 = 0xE400000000000000;
    }
    else {
      unint64_t v25 = 0xE500000000000000;
    }
    unint64_t v26 = v25;
    String.append(_:)(*(Swift::String *)&v24);
    swift_bridgeObjectRelease();
    *(void *)(v20 + 56) = &type metadata for String;
    *(void *)(v20 + 32) = 0;
    *(void *)(v20 + 40) = 0xE000000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_10001F850;
    _StringGuts.grow(_:)(28);
    swift_bridgeObjectRelease();
    uint64_t v28 = (void *)static GMOptIn.shared.getter();
    char v29 = dispatch thunk of GMOptIn.isOptedIn.getter();

    if (v29) {
      uint64_t v30 = 1702195828;
    }
    else {
      uint64_t v30 = 0x65736C6166;
    }
    if (v29) {
      unint64_t v31 = 0xE400000000000000;
    }
    else {
      unint64_t v31 = 0xE500000000000000;
    }
    unint64_t v32 = v31;
    String.append(_:)(*(Swift::String *)&v30);
    swift_bridgeObjectRelease();
    *(void *)(v27 + 56) = &type metadata for String;
    *(void *)(v27 + 32) = 0xD00000000000001ALL;
    *(void *)(v27 + 40) = 0x8000000100021110;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_10001F850;
    v34._object = (void *)0x8000000100021130;
    v34._countAndFlagsBits = 0xD000000000000013;
    String.append(_:)(v34);
    *(void *)(v33 + 56) = &type metadata for String;
    *(void *)(v33 + 32) = 2106122;
    *(void *)(v33 + 40) = 0xE300000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    type metadata accessor for DefaultsMigrator();
    uint64_t v35 = static DefaultsMigrator.diagnostics()();
    if (*(void *)(v35 + 16))
    {
      uint64_t v36 = swift_allocObject();
      *(_OWORD *)(v36 + 16) = xmmword_10001F850;
      *(void *)(v0 + 680) = v35;
      uint64_t v37 = BidirectionalCollection<>.joined(separator:)();
      unint64_t v39 = v38;
      swift_bridgeObjectRelease();
      *(void *)(v36 + 56) = &type metadata for String;
      *(void *)(v36 + 32) = v37;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v36 = swift_allocObject();
      *(_OWORD *)(v36 + 16) = xmmword_10001F850;
      *(void *)(v36 + 56) = &type metadata for String;
      *(void *)(v36 + 32) = 0xD00000000000002CLL;
      unint64_t v39 = 0x8000000100021330;
    }
    uint64_t v40 = *(void **)(v0 + 936);
    *(void *)(v36 + 40) = v39;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_10001F850;
    v42._countAndFlagsBits = 0xD00000000000001ELL;
    v42._object = (void *)0x8000000100021150;
    String.append(_:)(v42);
    *(void *)(v41 + 56) = &type metadata for String;
    *(void *)(v41 + 32) = 2106122;
    *(void *)(v41 + 40) = 0xE300000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_10001F850;
    *(void *)(v43 + 56) = &type metadata for String;
    *(void *)(v43 + 32) = 0xD000000000000047;
    *(void *)(v43 + 40) = 0x8000000100021170;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_10001F850;
    *(void *)(v44 + 56) = &type metadata for String;
    *(void *)(v44 + 32) = 0xD000000000000046;
    *(void *)(v44 + 40) = 0x80000001000211C0;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_10001F850;
    *(void *)(v45 + 56) = &type metadata for String;
    *(void *)(v45 + 32) = 0xD000000000000048;
    *(void *)(v45 + 40) = 0x8000000100021210;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_10001F850;
    v47._countAndFlagsBits = 0x634120656C707041;
    v47._object = (void *)0xED0000746E756F63;
    String.append(_:)(v47);
    *(void *)(v46 + 56) = &type metadata for String;
    *(void *)(v46 + 32) = 2106122;
    *(void *)(v46 + 40) = 0xE300000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    id v48 = [v40 defaultStore];
    *(void *)(v0 + 1184) = v48;
    if (v48)
    {
      char v49 = v48;
      *(void *)(v0 + 144) = v0;
      *(void *)(v0 + 184) = v0 + 688;
      *(void *)(v0 + 152) = sub_1000102A0;
      *(void *)(v0 + 528) = swift_continuation_init();
      *(void *)(v0 + 496) = _NSConcreteStackBlock;
      *(void *)(v0 + 504) = 0x40000000;
      *(void *)(v0 + 512) = sub_100011F78;
      *(void *)(v0 + 520) = &unk_100024B58;
      [v49 aa_primaryAppleAccountWithCompletion:v0 + 496];
      uint64_t v16 = v0 + 144;
      goto LABEL_29;
    }

    __break(1u);
    return _diagnoseUnexpectedEnumCase<A>(type:)(v51, v52);
  }
  type metadata accessor for Assets();
  uint64_t v14 = (void *)static Assets.shared.getter();
  *(void *)(v0 + 1168) = v14;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 1208;
  *(void *)(v0 + 24) = sub_10000F7C8;
  uint64_t v15 = swift_continuation_init();
  *(void *)(v0 + 376) = _NSConcreteStackBlock;
  *(void *)(v0 + 384) = 0x40000000;
  *(void *)(v0 + 392) = sub_100012504;
  *(void *)(v0 + 400) = &unk_100024B70;
  *(void *)(v0 + 408) = v15;
  [v14 assetStatusWithCompletionHandler:v0 + 376];
  uint64_t v16 = v0 + 16;
LABEL_29:
  return _swift_continuation_await(v16);
}

uint64_t sub_10000F7C8()
{
  return _swift_task_switch(sub_10000F8A8, 0, 0);
}

uint64_t sub_10000F8A8()
{
  int v1 = *(unsigned __int8 *)(v0 + 1208);
  int v13 = *(unsigned __int8 *)(v0 + 1209);
  swift_unknownObjectRelease();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(35);
  swift_bridgeObjectRelease();
  if (v1) {
    uint64_t v3 = 1702195828;
  }
  else {
    uint64_t v3 = 0x65736C6166;
  }
  if (v1) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  unint64_t v5 = v4;
  String.append(_:)(*(Swift::String *)&v3);
  swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 32) = 0xD000000000000021;
  *(void *)(v2 + 40) = 0x8000000100021370;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(37);
  swift_bridgeObjectRelease();
  if (v13) {
    uint64_t v7 = 1702195828;
  }
  else {
    uint64_t v7 = 0x65736C6166;
  }
  if (v13) {
    unint64_t v8 = 0xE400000000000000;
  }
  else {
    unint64_t v8 = 0xE500000000000000;
  }
  unint64_t v9 = v8;
  String.append(_:)(*(Swift::String *)&v7);
  swift_bridgeObjectRelease();
  *(void *)(v6 + 56) = &type metadata for String;
  *(void *)(v6 + 32) = 0xD000000000000023;
  *(void *)(v6 + 40) = 0x80000001000213A0;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 1176) = v10;
  *unint64_t v10 = v0;
  v10[1] = sub_10000FAE4;
  uint64_t v11 = *(void *)(v0 + 792);
  return sub_10001E584(v11);
}

uint64_t sub_10000FAE4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000FBE0, 0, 0);
}

uint64_t sub_10000FBE0()
{
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10001F850;
  v2._object = (void *)0x80000001000210A0;
  v2._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v2);
  *(void *)(v1 + 56) = &type metadata for String;
  *(void *)(v1 + 32) = 2106122;
  *(void *)(v1 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(80);
  v4._countAndFlagsBits = 0xD00000000000004ELL;
  v4._object = (void *)0x80000001000210C0;
  String.append(_:)(v4);
  type metadata accessor for GMOptIn();
  unint64_t v5 = (void *)static GMOptIn.shared.getter();
  char v6 = dispatch thunk of GMOptIn.isOptedInGlobalDomain.getter();

  if (v6) {
    uint64_t v7 = 1702195828;
  }
  else {
    uint64_t v7 = 0x65736C6166;
  }
  if (v6) {
    unint64_t v8 = 0xE400000000000000;
  }
  else {
    unint64_t v8 = 0xE500000000000000;
  }
  unint64_t v9 = v8;
  String.append(_:)(*(Swift::String *)&v7);
  swift_bridgeObjectRelease();
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 40) = 0xE000000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(28);
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)static GMOptIn.shared.getter();
  char v12 = dispatch thunk of GMOptIn.isOptedIn.getter();

  if (v12) {
    uint64_t v13 = 1702195828;
  }
  else {
    uint64_t v13 = 0x65736C6166;
  }
  if (v12) {
    unint64_t v14 = 0xE400000000000000;
  }
  else {
    unint64_t v14 = 0xE500000000000000;
  }
  unint64_t v15 = v14;
  String.append(_:)(*(Swift::String *)&v13);
  swift_bridgeObjectRelease();
  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 32) = 0xD00000000000001ALL;
  *(void *)(v10 + 40) = 0x8000000100021110;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10001F850;
  v17._object = (void *)0x8000000100021130;
  v17._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v17);
  *(void *)(v16 + 56) = &type metadata for String;
  *(void *)(v16 + 32) = 2106122;
  *(void *)(v16 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  type metadata accessor for DefaultsMigrator();
  uint64_t v18 = static DefaultsMigrator.diagnostics()();
  if (*(void *)(v18 + 16))
  {
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_10001F850;
    *(void *)(v0 + 680) = v18;
    uint64_t v20 = BidirectionalCollection<>.joined(separator:)();
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    *(void *)(v19 + 56) = &type metadata for String;
    *(void *)(v19 + 32) = v20;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_10001F850;
    *(void *)(v19 + 56) = &type metadata for String;
    *(void *)(v19 + 32) = 0xD00000000000002CLL;
    unint64_t v22 = 0x8000000100021330;
  }
  char v23 = *(void **)(v0 + 936);
  *(void *)(v19 + 40) = v22;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_10001F850;
  v25._countAndFlagsBits = 0xD00000000000001ELL;
  v25._object = (void *)0x8000000100021150;
  String.append(_:)(v25);
  *(void *)(v24 + 56) = &type metadata for String;
  *(void *)(v24 + 32) = 2106122;
  *(void *)(v24 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_10001F850;
  *(void *)(v26 + 56) = &type metadata for String;
  *(void *)(v26 + 32) = 0xD000000000000047;
  *(void *)(v26 + 40) = 0x8000000100021170;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_10001F850;
  *(void *)(v27 + 56) = &type metadata for String;
  *(void *)(v27 + 32) = 0xD000000000000046;
  *(void *)(v27 + 40) = 0x80000001000211C0;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_10001F850;
  *(void *)(v28 + 56) = &type metadata for String;
  *(void *)(v28 + 32) = 0xD000000000000048;
  *(void *)(v28 + 40) = 0x8000000100021210;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_10001F850;
  v30._countAndFlagsBits = 0x634120656C707041;
  v30._object = (void *)0xED0000746E756F63;
  String.append(_:)(v30);
  *(void *)(v29 + 56) = &type metadata for String;
  *(void *)(v29 + 32) = 2106122;
  *(void *)(v29 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  id v31 = [v23 defaultStore];
  *(void *)(v0 + 1184) = v31;
  if (v31)
  {
    unint64_t v32 = v31;
    *(void *)(v0 + 144) = v0;
    *(void *)(v0 + 184) = v0 + 688;
    *(void *)(v0 + 152) = sub_1000102A0;
    *(void *)(v0 + 528) = swift_continuation_init();
    *(void *)(v0 + 496) = _NSConcreteStackBlock;
    *(void *)(v0 + 504) = 0x40000000;
    *(void *)(v0 + 512) = sub_100011F78;
    *(void *)(v0 + 520) = &unk_100024B58;
    [v32 aa_primaryAppleAccountWithCompletion:v0 + 496];
    uint64_t v33 = v0 + 144;
  }
  else
  {

    __break(1u);
  }
  return _swift_continuation_await(v33);
}

uint64_t sub_1000102A0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 176);
  *(void *)(*(void *)v0 + 1192) = v1;
  if (v1) {
    Swift::String v2 = sub_100011BB8;
  }
  else {
    Swift::String v2 = sub_1000103B0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000103B0()
{
  uint64_t v1 = *(void **)(v0 + 688);

  if (v1)
  {
    if (*(unsigned char *)(*(void *)(v0 + 744) + *(int *)(v0 + 1200)) == 1)
    {
      sub_100004ACC(&qword_100028198);
      uint64_t v2 = swift_allocObject();
      *(_OWORD *)(v2 + 16) = xmmword_10001F8C0;
      *(void *)(v2 + 32) = 1701667182;
      *(void *)(v2 + 40) = 0xE400000000000000;
      id v3 = [v1 aa_fullName];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v7 = v6;
      }
      else
      {
        uint64_t v5 = 0;
        uint64_t v7 = 0;
      }
      *(void *)(v2 + 48) = v5;
      *(void *)(v2 + 56) = v7;
      *(void *)(v2 + 64) = 0x6C69616D65;
      *(void *)(v2 + 72) = 0xE500000000000000;
      id v10 = [v1 aa_primaryEmail];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v14 = v13;
      }
      else
      {
        uint64_t v12 = 0;
        uint64_t v14 = 0;
      }
      *(void *)(v2 + 80) = v12;
      *(void *)(v2 + 88) = v14;
      *(void *)(v2 + 96) = 0x44495344746C61;
      *(void *)(v2 + 104) = 0xE700000000000000;
      id v15 = [v1 aa_altDSID];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v19 = v18;
      }
      else
      {
        uint64_t v17 = 0;
        uint64_t v19 = 0;
      }
      *(void *)(v2 + 112) = v17;
      *(void *)(v2 + 120) = v19;
      *(void *)(v2 + 128) = 1684632420;
      *(void *)(v2 + 136) = 0xE400000000000000;
      id v20 = [v1 aa_personID];
      if (v20)
      {
        unint64_t v21 = v20;
        uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v24 = v23;
      }
      else
      {
        uint64_t v22 = 0;
        uint64_t v24 = 0;
      }
      *(void *)(v2 + 144) = v22;
      *(void *)(v2 + 152) = v24;
      Swift::String v25 = sub_10000913C(v2);
      swift_setDeallocating();
      sub_100004ACC(&qword_1000281A0);
      swift_arrayDestroy();
      swift_deallocClassInstance();
      uint64_t v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_10001F850;
      _StringGuts.grow(_:)(50);
      swift_bridgeObjectRelease();
      *(void *)(v0 + 736) = v25;
      uint64_t v27 = BidirectionalCollection<>.joined(separator:)();
      uint64_t v29 = v28;
      swift_bridgeObjectRelease();
      v30._countAndFlagsBits = v27;
      v30._object = v29;
      String.append(_:)(v30);
      swift_bridgeObjectRelease();
      *(void *)(v26 + 56) = &type metadata for String;
      *(void *)(v26 + 32) = 0xD000000000000030;
      *(void *)(v26 + 40) = 0x80000001000212F0;
    }
    else
    {
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_10001F850;
      *(void *)(v9 + 56) = &type metadata for String;
      *(void *)(v9 + 32) = 0xD000000000000015;
      *(void *)(v9 + 40) = 0x80000001000212D0;
    }
    print(_:separator:terminator:)();
  }
  else
  {
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_10001F850;
    *(void *)(v8 + 56) = &type metadata for String;
    *(void *)(v8 + 32) = 0xD000000000000018;
    *(void *)(v8 + 40) = 0x80000001000212B0;
    print(_:separator:terminator:)();
  }
  swift_bridgeObjectRelease();
  id v31 = *(void **)(v0 + 1040);
  int v32 = *(unsigned __int8 *)(v0 + 1224);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_10001F850;
  v34._countAndFlagsBits = 0x44206C6961746552;
  v34._object = (void *)0xEB000000006F6D65;
  String.append(_:)(v34);
  *(void *)(v33 + 56) = &type metadata for String;
  *(void *)(v33 + 32) = 2106122;
  *(void *)(v33 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  type metadata accessor for SystemProperties();
  static SystemProperties.shared.getter();
  char v35 = dispatch thunk of SystemProperties.isRetailDevice.getter();
  swift_release();
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  if (v35) {
    uint64_t v37 = 1702195828;
  }
  else {
    uint64_t v37 = 0x65736C6166;
  }
  if (v35) {
    unint64_t v38 = 0xE400000000000000;
  }
  else {
    unint64_t v38 = 0xE500000000000000;
  }
  unint64_t v39 = v38;
  String.append(_:)(*(Swift::String *)&v37);
  swift_bridgeObjectRelease();
  *(void *)(v36 + 56) = &type metadata for String;
  *(void *)(v36 + 32) = 0xD000000000000016;
  *(void *)(v36 + 40) = 0x8000000100021290;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  if (v32 == 2)
  {
    uint64_t v40 = *(void **)(v0 + 960);
    (*(void (**)(void, void))(*(void *)(v0 + 784) + 8))(*(void *)(v0 + 792), *(void *)(v0 + 776));

    swift_release();
  }
  else
  {
    uint64_t v41 = *(void **)(v0 + 960);
    uint64_t v42 = *(void *)(v0 + 792);
    uint64_t v43 = *(void *)(v0 + 784);
    uint64_t v44 = *(void *)(v0 + 776);
    static GMAssetsBypass.setGMEligibilityBypass(_:)();

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v44);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v45 = *(uint64_t (**)(void))(v0 + 8);
  return v45();
}

uint64_t sub_1000109FC()
{
  uint64_t v1 = *(void **)(v0 + 944);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100010AF0()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100010BE8()
{
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(36);
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  v2._countAndFlagsBits = Error.localizedDescription.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  *(void *)(v1 + 56) = &type metadata for String;
  *(void *)(v1 + 32) = 0xD000000000000022;
  *(void *)(v1 + 40) = 0x8000000100021680;
  print(_:separator:terminator:)();
  swift_errorRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10001F850;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD00000000000001ALL;
  *(void *)(v3 + 40) = 0x8000000100020D90;
  print(_:separator:terminator:)();
  *(_OWORD *)(v0 + 1032) = 0u;
  swift_bridgeObjectRelease();
  type metadata accessor for FeatureCache();
  static FeatureCache.shared.getter();
  uint64_t v4 = FeatureCache.persistentDomain.getter();
  swift_release();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001F850;
  if (v4)
  {
    _StringGuts.grow(_:)(40);
    swift_bridgeObjectRelease();
    v6._countAndFlagsBits = Dictionary.Keys.description.getter();
    String.append(_:)(v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v7 = 0x80000001000215F0;
    *(void *)(v5 + 56) = &type metadata for String;
    *(void *)(v5 + 32) = 0xD000000000000026;
  }
  else
  {
    *(void *)(v5 + 56) = &type metadata for String;
    *(void *)(v5 + 32) = 0xD00000000000001BLL;
    unint64_t v7 = 0x8000000100020DB0;
  }
  *(void *)(v5 + 40) = v7;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10001F850;
  v9._object = (void *)0x8000000100020DD0;
  v9._countAndFlagsBits = 0xD000000000000017;
  String.append(_:)(v9);
  *(void *)(v8 + 56) = &type metadata for String;
  *(void *)(v8 + 32) = 2106122;
  *(void *)(v8 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  id v10 = self;
  *(void *)(v0 + 1048) = v10;
  NSString v11 = String._bridgeToObjectiveC()();
  *(void *)(v0 + 1056) = v11;
  *(void *)(v0 + 208) = v0;
  *(void *)(v0 + 248) = v0 + 696;
  *(void *)(v0 + 216) = sub_10000CDCC;
  uint64_t v12 = swift_continuation_init();
  *(void *)(v0 + 416) = _NSConcreteStackBlock;
  *(void *)(v0 + 424) = 0x40000000;
  *(void *)(v0 + 432) = sub_100012158;
  *(void *)(v0 + 440) = &unk_100024B40;
  *(void *)(v0 + 448) = v12;
  [v10 getTicketStatusFromCacheForFeature:v11 completionHandler:v0 + 416];
  return _swift_continuation_await(v0 + 208);
}

uint64_t sub_100011004()
{
  unint64_t v59 = v0;
  uint64_t v1 = (void *)v0[132];
  swift_willThrow();

  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(35);
  swift_bridgeObjectRelease();
  unint64_t v57 = 0xD000000000000021;
  unint64_t v58 = 0x8000000100020E40;
  swift_getErrorValue();
  v3._countAndFlagsBits = Error.localizedDescription.getter();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 32) = v57;
  *(void *)(v2 + 40) = v58;
  print(_:separator:terminator:)();
  uint64_t v4 = v0;
  swift_bridgeObjectRelease();
  swift_errorRelease();
  v0[134] = 0;
  uint64_t v5 = v0[120];
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001F850;
  strcpy((char *)v55, "All tickets:\n");
  HIWORD(v55[1]) = -4864;
  type metadata accessor for TicketCache();
  static TicketCache.shared.getter();
  uint64_t v53 = (void *)v6;
  if (v5)
  {
    id v7 = [v4[120] aa_altDSID];
    if (v7)
    {
      uint64_t v8 = v7;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
  }
  uint64_t v9 = TicketCache.allTickets(forDSID:)();
  swift_release();
  swift_bridgeObjectRelease();
  int64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint64_t v56 = _swiftEmptyArrayStorage;
    sub_100014090(0, v10, 0);
    NSString v11 = _swiftEmptyArrayStorage;
    uint64_t v12 = (void **)(v9 + 48);
    do
    {
      uint64_t v14 = (uint64_t)*(v12 - 2);
      uint64_t v13 = *(v12 - 1);
      id v15 = *v12;
      unint64_t v57 = 8237;
      unint64_t v58 = 0xE200000000000000;
      swift_bridgeObjectRetain();
      id v16 = v15;
      v17._countAndFlagsBits = v14;
      v17._object = v13;
      String.append(_:)(v17);
      v18._countAndFlagsBits = 8250;
      v18._object = (void *)0xE200000000000000;
      String.append(_:)(v18);
      id v19 = [v16 description];
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v22 = v21;

      v23._countAndFlagsBits = v20;
      v23._object = v22;
      String.append(_:)(v23);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v56 = v11;
      unint64_t v25 = v11[2];
      unint64_t v24 = v11[3];
      if (v25 >= v24 >> 1)
      {
        sub_100014090((char *)(v24 > 1), v25 + 1, 1);
        NSString v11 = v56;
      }
      void v11[2] = v25 + 1;
      uint64_t v26 = &v11[2 * v25];
      v26[4] = 8237;
      v26[5] = 0xE200000000000000;
      v12 += 3;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    NSString v11 = _swiftEmptyArrayStorage;
  }
  v4[79] = v11;
  v4[135] = sub_100004ACC(&qword_100028180);
  v4[136] = sub_100015760(&qword_100028188, &qword_100028180);
  uint64_t v27 = BidirectionalCollection<>.joined(separator:)();
  uint64_t v29 = v28;
  swift_bridgeObjectRelease();
  v30._countAndFlagsBits = v27;
  v30._object = v29;
  String.append(_:)(v30);
  swift_bridgeObjectRelease();
  uint64_t v31 = v55[0];
  uint64_t v32 = v55[1];
  v53[7] = &type metadata for String;
  v53[4] = v31;
  v53[5] = v32;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_10001F850;
  unint64_t v57 = 2106122;
  unint64_t v58 = 0xE300000000000000;
  v34._object = (void *)0x8000000100020E70;
  v34._countAndFlagsBits = 0xD000000000000018;
  String.append(_:)(v34);
  *(void *)(v33 + 56) = &type metadata for String;
  *(void *)(v33 + 32) = 2106122;
  *(void *)(v33 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  Option.wrappedValue.getter();
  if (*((unsigned char *)v4 + 1219))
  {
    char v35 = v4 + 88;
    uint64_t v36 = v4 + 42;
    uint64_t v37 = v4 + 34;
    unint64_t v38 = v4;
    unint64_t v39 = (void *)v4[131];
    NSString v40 = String._bridgeToObjectiveC()();
    v38[137] = v40;
    v38[34] = v38;
    v38[39] = v35;
    v38[35] = sub_10000D770;
    uint64_t v41 = swift_continuation_init();
    v38[42] = _NSConcreteStackBlock;
    v38[43] = 0x40000000;
    v38[44] = sub_100012230;
    v38[45] = &unk_100024B88;
    v38[46] = v41;
    [v39 getTicketStatusForFeature:v40 completionHandler:v36];
    return _swift_continuation_await(v37);
  }
  else
  {
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_10001F850;
    *(void *)(v42 + 56) = &type metadata for String;
    *(void *)(v42 + 32) = 0xD000000000000055;
    *(void *)(v42 + 40) = 0x8000000100020E90;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    v4[139] = 0;
    uint64_t v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_10001F850;
    unint64_t v57 = 2106122;
    unint64_t v58 = 0xE300000000000000;
    v44._countAndFlagsBits = 0x7055776F6C6C6F46;
    v44._object = (void *)0xEE00295546432820;
    String.append(_:)(v44);
    *(void *)(v43 + 56) = &type metadata for String;
    *(void *)(v43 + 32) = 2106122;
    *(void *)(v43 + 40) = 0xE300000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    sub_10001E328();
    sub_10001E46C();
    type metadata accessor for FollowUp();
    uint64_t v45 = FollowUp.__allocating_init()();
    v4[140] = v45;
    if (v45)
    {
      uint64_t v54 = (char *)&async function pointer to dispatch thunk of FollowUp.ineligibilityReasons(oldFeature:newFeature:)
          + async function pointer to dispatch thunk of FollowUp.ineligibilityReasons(oldFeature:newFeature:);
      uint64_t v46 = (void *)swift_task_alloc();
      v4[141] = v46;
      *uint64_t v46 = v4;
      v46[1] = sub_10000DBEC;
      uint64_t v47 = v4[130];
      return ((uint64_t (*)(void, uint64_t))v54)(0, v47);
    }
    else
    {
      id v48 = (void *)v4[130];
      char v49 = (void *)v4[120];
      uint64_t v50 = swift_allocObject();
      *(_OWORD *)(v50 + 16) = xmmword_10001F850;
      *(void *)(v50 + 56) = &type metadata for String;
      *(void *)(v50 + 32) = 0xD000000000000025;
      *(void *)(v50 + 40) = 0x8000000100020EF0;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease();

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v51 = (uint64_t (*)(void))v4[1];
      return v51();
    }
  }
}

uint64_t sub_100011848()
{
  uint64_t v1 = (void *)v0[137];
  swift_willThrow();

  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(56);
  v3._countAndFlagsBits = 0xD000000000000036;
  v3._object = (void *)0x8000000100021510;
  String.append(_:)(v3);
  swift_getErrorValue();
  v4._countAndFlagsBits = Error.localizedDescription.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 40) = 0xE000000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  v0[139] = 0;
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001F850;
  v6._countAndFlagsBits = 0x7055776F6C6C6F46;
  v6._object = (void *)0xEE00295546432820;
  String.append(_:)(v6);
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 32) = 2106122;
  *(void *)(v5 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  sub_10001E328();
  sub_10001E46C();
  type metadata accessor for FollowUp();
  uint64_t v7 = FollowUp.__allocating_init()();
  v0[140] = v7;
  if (v7)
  {
    id v15 = (char *)&async function pointer to dispatch thunk of FollowUp.ineligibilityReasons(oldFeature:newFeature:)
        + async function pointer to dispatch thunk of FollowUp.ineligibilityReasons(oldFeature:newFeature:);
    uint64_t v8 = (void *)swift_task_alloc();
    v0[141] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_10000DBEC;
    uint64_t v9 = v0[130];
    return ((uint64_t (*)(void, uint64_t))v15)(0, v9);
  }
  else
  {
    NSString v11 = (void *)v0[130];
    uint64_t v12 = (void *)v0[120];
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_10001F850;
    *(void *)(v13 + 56) = &type metadata for String;
    *(void *)(v13 + 32) = 0xD000000000000025;
    *(void *)(v13 + 40) = 0x8000000100020EF0;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
    return v14();
  }
}

uint64_t sub_100011BB8()
{
  uint64_t v1 = *(void *)(v0 + 1192);
  uint64_t v2 = *(void **)(v0 + 1184);
  swift_willThrow();

  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(36);
  *(void *)(v0 + 608) = 0;
  *(void *)(v0 + 616) = 0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000022;
  v4._object = (void *)0x8000000100021260;
  String.append(_:)(v4);
  *(void *)(v0 + 720) = v1;
  sub_100004ACC(&qword_100028190);
  _print_unlocked<A, B>(_:_:)();
  uint64_t v5 = *(void *)(v0 + 608);
  uint64_t v6 = *(void *)(v0 + 616);
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v6;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  uint64_t v7 = *(void **)(v0 + 1040);
  int v8 = *(unsigned __int8 *)(v0 + 1224);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10001F850;
  v10._countAndFlagsBits = 0x44206C6961746552;
  v10._object = (void *)0xEB000000006F6D65;
  String.append(_:)(v10);
  *(void *)(v9 + 56) = &type metadata for String;
  *(void *)(v9 + 32) = 2106122;
  *(void *)(v9 + 40) = 0xE300000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  type metadata accessor for SystemProperties();
  static SystemProperties.shared.getter();
  char v11 = dispatch thunk of SystemProperties.isRetailDevice.getter();
  swift_release();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  if (v11) {
    uint64_t v13 = 1702195828;
  }
  else {
    uint64_t v13 = 0x65736C6166;
  }
  if (v11) {
    unint64_t v14 = 0xE400000000000000;
  }
  else {
    unint64_t v14 = 0xE500000000000000;
  }
  unint64_t v15 = v14;
  String.append(_:)(*(Swift::String *)&v13);
  swift_bridgeObjectRelease();
  *(void *)(v12 + 56) = &type metadata for String;
  *(void *)(v12 + 32) = 0xD000000000000016;
  *(void *)(v12 + 40) = 0x8000000100021290;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  if (v8 == 2)
  {
    uint64_t v16 = *(void **)(v0 + 960);
    (*(void (**)(void, void))(*(void *)(v0 + 784) + 8))(*(void *)(v0 + 792), *(void *)(v0 + 776));

    swift_release();
  }
  else
  {
    Swift::String v17 = *(void **)(v0 + 960);
    uint64_t v18 = *(void *)(v0 + 792);
    uint64_t v19 = *(void *)(v0 + 784);
    uint64_t v20 = *(void *)(v0 + 776);
    static GMAssetsBypass.setGMEligibilityBypass(_:)();

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_100011F78(uint64_t a1, void *a2, void *a3)
{
  return sub_100012164(a1, a2, a3, &qword_1000282A0);
}

uint64_t sub_100011F84(uint64_t a1)
{
  uint64_t v2 = sub_100004ACC(&qword_100028268);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  sub_100015290();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  static CSFFeatureManager.requestFeature(id:completion:)();
  return swift_release();
}

uint64_t sub_1000120E8(void *a1, char a2)
{
  if (a2)
  {
    swift_errorRetain();
    sub_100004ACC(&qword_100028268);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    id v2 = a1;
    sub_100004ACC(&qword_100028268);
    return CheckedContinuation.resume(returning:)();
  }
}

uint64_t sub_100012158(uint64_t a1, void *a2, void *a3)
{
  return sub_100012164(a1, a2, a3, &qword_100028298);
}

uint64_t sub_100012164(uint64_t a1, void *a2, void *a3, uint64_t *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100004ACC(&qword_100028190);
    uint64_t v6 = swift_allocError();
    *uint64_t v7 = a3;
    id v8 = a3;
    return _swift_continuation_throwingResumeWithError(v4, v6);
  }
  else
  {
    uint64_t v13 = a2;
    uint64_t v10 = *(void *)(*(void *)(v4 + 64) + 40);
    id v11 = a2;
    sub_100015578((uint64_t)&v13, v10, a4);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_100012230(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100004ACC(&qword_100028190);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    a1 = v3;
    a2 = (void *)v5;
    return _swift_continuation_throwingResumeWithError(a1, a2);
  }
  if (!a2)
  {
    __break(1u);
    return _swift_continuation_throwingResumeWithError(a1, a2);
  }
  **(void **)(*(void *)(v3 + 64) + 40) = a2;
  id v8 = a2;

  return swift_continuation_throwingResume();
}

uint64_t sub_1000122F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for FollowUp.IneligibilityReason();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (sub_100013690(&qword_100028278, (void (*)(uint64_t))&type metadata accessor for FollowUp.IneligibilityReason), uint64_t v7 = dispatch thunk of Hashable._rawHashValue(seed:)(), v8 = -1 << *(unsigned char *)(a2 + 32), v9 = v7 & ~v8, v10 = a2 + 56, ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    unint64_t v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      sub_100013690(&qword_100028280, (void (*)(uint64_t))&type metadata accessor for FollowUp.IneligibilityReason);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_100012504(uint64_t a1, char a2, char a3)
{
  uint64_t v3 = *(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40);
  *uint64_t v3 = a2;
  v3[1] = a3;
  return _swift_continuation_resume();
}

unint64_t sub_10001252C(char a1)
{
  unint64_t result = 1819047270;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000017;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0x696B726F7774656ELL;
      break;
    case 4:
      unint64_t result = 1685289331;
      break;
    case 5:
      unint64_t result = 1852797802;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000125E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for SingleValueParsingStrategy();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100004ACC(&qword_1000282B0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004ACC(&qword_1000282B8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v9 - 8);
  char v22 = 0;
  static NameSpecification.long.getter();
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v10 = type metadata accessor for ArgumentHelp();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  uint64_t v20 = v11 + 56;
  v12(v8, 0, 1, v10);
  uint64_t v13 = type metadata accessor for CompletionKind();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v19 = v14 + 56;
  v18(v5, 1, 1, v13);
  static SingleValueParsingStrategy.next.getter();
  Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  char v15 = (int *)type metadata accessor for GMDiagnostics(0);
  *(unsigned char *)(a1 + v15[5]) = 0;
  *(unsigned char *)(a1 + v15[6]) = 0;
  v17[1] = a1 + v15[7];
  char v21 = 1;
  static NameSpecification.long.getter();
  ArgumentHelp.init(stringLiteral:)();
  v12(v8, 0, 1, v10);
  v18(v5, 1, 1, v13);
  static SingleValueParsingStrategy.next.getter();
  Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  static NameSpecification.long.getter();
  v12(v8, 1, 1, v10);
  Flag<A>.init(wrappedValue:name:help:)();
  static NameSpecification.long.getter();
  v12(v8, 1, 1, v10);
  return Flag<A>.init(wrappedValue:name:help:)();
}

uint64_t sub_10001298C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v64 = a1;
  uint64_t v48 = a2;
  uint64_t v52 = sub_100004ACC(&qword_100028088);
  uint64_t v50 = *(void *)(v52 - 8);
  uint64_t v2 = __chkstk_darwin(v52);
  char v49 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v51 = (char *)&v48 - v4;
  uint64_t v59 = sub_100004ACC(&qword_100028080);
  uint64_t v57 = *(void *)(v59 - 8);
  uint64_t v5 = __chkstk_darwin(v59);
  uint64_t v54 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  unint64_t v58 = (char *)&v48 - v7;
  uint64_t v60 = sub_100004ACC(&qword_1000282C0);
  uint64_t v56 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v66 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SingleValueParsingStrategy();
  __chkstk_darwin(v9 - 8);
  id v68 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004ACC(&qword_1000282B0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100004ACC(&qword_1000282B8);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v17 - 8);
  uint64_t v18 = type metadata accessor for GMDiagnostics(0);
  uint64_t v19 = (int *)(v18 - 8);
  __chkstk_darwin(v18);
  char v21 = (char *)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v76 = 0;
  static NameSpecification.long.getter();
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v67 = type metadata accessor for ArgumentHelp();
  uint64_t v63 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56);
  v63(v16, 0, 1, v67);
  uint64_t v22 = type metadata accessor for CompletionKind();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  Swift::String v62 = (char *)(v23 + 56);
  v61(v13, 1, 1, v22);
  static SingleValueParsingStrategy.next.getter();
  unint64_t v24 = v13;
  Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  uint64_t v55 = v19[7];
  v21[v55] = 0;
  uint64_t v53 = v19[8];
  v21[v53] = 0;
  unint64_t v25 = &v21[v19[9]];
  char v75 = 1;
  static NameSpecification.long.getter();
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v26 = v63;
  v63(v16, 0, 1, v67);
  v61(v24, 1, 1, v22);
  static SingleValueParsingStrategy.next.getter();
  Swift::String v62 = v25;
  Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  uint64_t v27 = &v21[v19[10]];
  static NameSpecification.long.getter();
  uint64_t v28 = v67;
  v26(v16, 1, 1, v67);
  Flag<A>.init(wrappedValue:name:help:)();
  uint64_t v29 = v19[11];
  Swift::String v30 = v64;
  id v68 = v21;
  uint64_t v31 = &v21[v29];
  static NameSpecification.long.getter();
  v26(v16, 1, 1, v28);
  Flag<A>.init(wrappedValue:name:help:)();
  sub_100015678(v30, v30[3]);
  sub_1000156BC();
  uint64_t v32 = v65;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v32)
  {
    uint64_t v47 = (uint64_t)v68;
  }
  else
  {
    uint64_t v33 = v27;
    uint64_t v34 = v57;
    char v74 = 0;
    sub_100015760(&qword_1000282D0, &qword_100028080);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v34 + 40);
    uint64_t v37 = v68;
    v36(v68, v58, v59);
    char v73 = 1;
    char v38 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v57 = v34 + 40;
    v37[v55] = v38 & 1;
    char v72 = 2;
    char v39 = KeyedDecodingContainer.decode(_:forKey:)();
    NSString v40 = v54;
    v37[v53] = v39 & 1;
    char v71 = 3;
    uint64_t v41 = v59;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v36(v62, v40, v41);
    char v70 = 4;
    sub_100015760(&qword_1000282D8, &qword_100028088);
    uint64_t v42 = v51;
    uint64_t v43 = v52;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    Swift::String v44 = *(void (**)(char *, char *, uint64_t))(v50 + 40);
    v50 += 40;
    v44(v33, v42, v43);
    char v69 = 5;
    uint64_t v45 = v60;
    uint64_t v46 = v66;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v46, v45);
    uint64_t v47 = (uint64_t)v68;
    v44(v31, v49, v43);
    sub_10001C738(v47, v48, type metadata accessor for GMDiagnostics);
  }
  sub_100015710((uint64_t)v30);
  return sub_100014594(v47, type metadata accessor for GMDiagnostics);
}

unint64_t sub_10001326C()
{
  return sub_10001252C(*v0);
}

uint64_t sub_100013274@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001C398(a1, a2);
  *a3 = result;
  return result;
}

void sub_10001329C(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_1000132A8(uint64_t a1)
{
  unint64_t v2 = sub_1000156BC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000132E4(uint64_t a1)
{
  unint64_t v2 = sub_1000156BC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100013320@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028068 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_1000155DC(v2, (uint64_t)qword_1000288A0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void sub_1000133CC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(a1 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(a1 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004ACC(&qword_100028150);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_10001C738(v2, (uint64_t)v5, type metadata accessor for GMDiagnostics);
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  sub_100015064((uint64_t)v5, v11 + v10, type metadata accessor for GMDiagnostics);
  sub_10000588C((uint64_t)v8, (uint64_t)&unk_100028160, v11);
  swift_release();
  id v12 = [self mainRunLoop];
  [v12 run];
}

void sub_1000135BC()
{
}

uint64_t sub_1000135D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001298C(a1, a2);
}

uint64_t sub_1000135F0()
{
  return sub_100013690(&qword_100028140, (void (*)(uint64_t))type metadata accessor for GMDiagnostics);
}

uint64_t sub_100013638(uint64_t a1)
{
  uint64_t result = sub_100013690((unint64_t *)&qword_100028070, (void (*)(uint64_t))type metadata accessor for GMDiagnostics);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100013690(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000136D8()
{
  return sub_100013690(&qword_100028148, (void (*)(uint64_t))type metadata accessor for GMDiagnostics);
}

uint64_t sub_100013720()
{
  uint64_t v1 = (int *)(type metadata accessor for GMDiagnostics(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_unknownObjectRelease();
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_100004ACC(&qword_100028080);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(v6 + v1[9], v7);
  uint64_t v9 = v6 + v1[10];
  uint64_t v10 = sub_100004ACC(&qword_100028088);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  v11(v6 + v1[11], v10);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_10001389C()
{
  type metadata accessor for GMDiagnostics(0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000139A8;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_100005744;
  return sub_10000AE88();
}

uint64_t sub_1000139A8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100013A9C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100013B78;
  return v6(a1);
}

uint64_t sub_100013B78()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100013C70()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100013CA8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000139A8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100028168 + dword_100028168);
  return v6(a1, v4);
}

uint64_t type metadata accessor for Diagnostics(uint64_t a1)
{
  return sub_100014EA0(a1, (uint64_t *)&unk_100028468);
}

uint64_t sub_100013D80(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_1000150D0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

char *sub_100013F4C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100004ACC(&qword_100028288);
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
  BOOL v13 = v10 + 32;
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
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_100014050(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000140F8(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_100014070(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100014214(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_100014090(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001432C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1000140B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

char *sub_1000140F8(char *result, int64_t a2, char a3, char *a4)
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
    sub_100004ACC(&qword_100028248);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
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

char *sub_100014214(char *result, int64_t a2, char a3, char *a4)
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
    sub_100004ACC(&qword_100028250);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
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

char *sub_10001432C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100004ACC(&qword_100028288);
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
  BOOL v13 = v10 + 32;
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_100014430(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_10001464C((unint64_t *)((char *)&v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, v2);
    swift_release();
    if (v1) {
      swift_willThrow();
    }
  }
  else
  {
    int64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v6 = sub_10001464C((unint64_t *)v7, v4, v2);
    swift_release();
    swift_slowDealloc();
  }
  return v6;
}

uint64_t sub_100014594(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000145F4(uint64_t a1, unint64_t a2)
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

uint64_t sub_10001464C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = a2;
  uint64_t v28 = a1;
  uint64_t v4 = type metadata accessor for FollowUp.IneligibilityReason();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v32 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v26 - v9;
  int64_t v11 = 0;
  uint64_t v37 = a3;
  uint64_t v12 = *(void *)(a3 + 56);
  uint64_t v29 = 0;
  uint64_t v30 = a3 + 56;
  uint64_t v13 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & v12;
  int64_t v31 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v36 = v5 + 16;
  unsigned int v35 = enum case for FollowUp.IneligibilityReason.hadPreviousAccess(_:);
  uint64_t v33 = v5 + 8;
  uint64_t v34 = v5 + 104;
  while (1)
  {
    if (v15)
    {
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_5;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v21 >= v31) {
      goto LABEL_24;
    }
    unint64_t v22 = *(void *)(v30 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v31) {
        goto LABEL_24;
      }
      unint64_t v22 = *(void *)(v30 + 8 * v11);
      if (!v22)
      {
        int64_t v11 = v21 + 2;
        if (v21 + 2 >= v31) {
          goto LABEL_24;
        }
        unint64_t v22 = *(void *)(v30 + 8 * v11);
        if (!v22) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v15 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v10, *(void *)(v37 + 48) + *(void *)(v5 + 72) * v17, v4);
    uint64_t v18 = v32;
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v32, v35, v4);
    sub_100013690(&qword_100028280, (void (*)(uint64_t))&type metadata accessor for FollowUp.IneligibilityReason);
    char v19 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
    v20(v18, v4);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v20)(v10, v4);
    if ((v19 & 1) == 0)
    {
      *(unint64_t *)((char *)v28 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      if (__OFADD__(v29++, 1))
      {
        __break(1u);
LABEL_24:
        uint64_t v25 = v37;
        swift_retain();
        return sub_10001499C(v28, v27, v29, v25);
      }
    }
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v31) {
    goto LABEL_24;
  }
  unint64_t v22 = *(void *)(v30 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v31) {
      goto LABEL_24;
    }
    unint64_t v22 = *(void *)(v30 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_10001499C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = a1;
  uint64_t v7 = type metadata accessor for FollowUp.IneligibilityReason();
  uint64_t v37 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return (uint64_t)&_swiftEmptySetSingleton;
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  sub_100004ACC(&qword_100028290);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v10 = result;
  uint64_t v33 = a2;
  if (a2 < 1) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = *v34;
  }
  uint64_t v13 = 0;
  uint64_t v14 = result + 56;
  unsigned int v35 = (uint64_t (**)(unint64_t, char *, uint64_t))(v37 + 32);
  uint64_t v36 = v37 + 16;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v16 = v15 | (v13 << 6);
    }
    else
    {
      uint64_t v17 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_40;
      }
      if (v17 >= v33)
      {
LABEL_37:
        swift_release();
        return v10;
      }
      unint64_t v18 = v34[v17];
      ++v13;
      if (!v18)
      {
        uint64_t v13 = v17 + 1;
        if (v17 + 1 >= v33) {
          goto LABEL_37;
        }
        unint64_t v18 = v34[v13];
        if (!v18)
        {
          uint64_t v13 = v17 + 2;
          if (v17 + 2 >= v33) {
            goto LABEL_37;
          }
          unint64_t v18 = v34[v13];
          if (!v18)
          {
            uint64_t v19 = v17 + 3;
            if (v19 >= v33) {
              goto LABEL_37;
            }
            unint64_t v18 = v34[v19];
            if (!v18)
            {
              while (1)
              {
                uint64_t v13 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_37;
                }
                unint64_t v18 = v34[v13];
                ++v19;
                if (v18) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v13 = v19;
          }
        }
      }
LABEL_24:
      unint64_t v12 = (v18 - 1) & v18;
      unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
    }
    uint64_t v20 = a4;
    uint64_t v21 = *(void *)(a4 + 48);
    uint64_t v22 = *(void *)(v37 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v37 + 16))(v9, v21 + v22 * v16, v7);
    sub_100013690(&qword_100028278, (void (*)(uint64_t))&type metadata accessor for FollowUp.IneligibilityReason);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v23 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v29 = v25 == v28;
        if (v25 == v28) {
          unint64_t v25 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v14 + 8 * v25);
      }
      while (v30 == -1);
      unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
    }
    *(void *)(v14 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
    uint64_t result = (*v35)(*(void *)(v10 + 48) + v26 * v22, v9, v7);
    ++*(void *)(v10 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v20;
    if (!a3) {
      goto LABEL_37;
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

void (*sub_100014D28(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100014DD8(v6, a2, a3);
  return sub_100014D90;
}

void sub_100014D90(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_100014DD8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_100014E58;
  }
  __break(1u);
  return result;
}

void sub_100014E58(id *a1)
{
}

uint64_t type metadata accessor for Diagnostics.AFMFollowUpDiagnostics(uint64_t a1)
{
  return sub_100014EA0(a1, qword_1000283D0);
}

uint64_t type metadata accessor for Diagnostics.ADMFollowUpDiagnostics(uint64_t a1)
{
  return sub_100014EA0(a1, (uint64_t *)&unk_100028338);
}

uint64_t sub_100014EA0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100014ED8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000140B0(&qword_1000281E0);
    sub_100013690(a2, (void (*)(uint64_t))&type metadata accessor for FeatureRequestDiagnostic);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100014F6C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000140B0(&qword_1000281D8);
    sub_100013690(a2, (void (*)(uint64_t))&type metadata accessor for AssetDiagnostics);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100015000(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004ACC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100015064(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000150D0(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_100015760(&qword_100028260, &qword_100028258);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_100004ACC(&qword_100028258);
            uint64_t v10 = sub_100014D28(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        type metadata accessor for CloudFeature();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_100015290()
{
  unint64_t result = qword_100028270;
  if (!qword_100028270)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100028270);
  }
  return result;
}

uint64_t sub_1000152D0()
{
  uint64_t v1 = sub_100004ACC(&qword_100028268);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100015364(void *a1, char a2)
{
  char v3 = a2 & 1;
  sub_100004ACC(&qword_100028268);

  return sub_1000120E8(a1, v3);
}

uint64_t sub_1000153E8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

int64_t sub_100015488(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (unint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001556C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100015578(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004ACC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000155DC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100015614(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void *sub_100015678(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000156BC()
{
  unint64_t result = qword_1000282C8;
  if (!qword_1000282C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000282C8);
  }
  return result;
}

uint64_t sub_100015710(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100015760(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000140B0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for GMDiagnostics.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GMDiagnostics.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GMDiagnostics.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x100015910);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GMDiagnostics.CodingKeys()
{
  return &type metadata for GMDiagnostics.CodingKeys;
}

uint64_t destroy for Diagnostics.SanitizedFeature()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s11csfdiagnose11DiagnosticsV16SanitizedFeatureVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Diagnostics.SanitizedFeature(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for Diagnostics.SanitizedFeature(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Diagnostics.SanitizedFeature(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for Diagnostics.SanitizedFeature(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Diagnostics.SanitizedFeature(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Diagnostics.SanitizedFeature()
{
  return &type metadata for Diagnostics.SanitizedFeature;
}

void destroy for Diagnostics.SanitizedTicket(uint64_t a1)
{
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void **)(a1 + 16);
}

void *_s11csfdiagnose11DiagnosticsV15SanitizedTicketVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for Diagnostics.SanitizedTicket(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for Diagnostics.SanitizedTicket(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Diagnostics.SanitizedTicket(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for Diagnostics.SanitizedTicket(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Diagnostics.SanitizedTicket(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Diagnostics.SanitizedTicket()
{
  return &type metadata for Diagnostics.SanitizedTicket;
}

uint64_t *sub_100015CA8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    id v6 = (char *)a1 + v5;
    BOOL v7 = (char *)a2 + v5;
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    {
      uint64_t v10 = sub_100004ACC(&qword_1000281E8);
      memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t sub_100015E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(v2, v3);
  }
  return result;
}

unsigned char *sub_100015EE0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = sub_100004ACC(&qword_1000281E8);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *sub_100015FF4(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 1, v7);
  int v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v12 = sub_100004ACC(&qword_1000281E8);
    memcpy(v5, v6, *(void *)(*(void *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

unsigned char *sub_10001616C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = sub_100004ACC(&qword_1000281E8);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *sub_100016280(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 1, v7);
  int v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v12 = sub_100004ACC(&qword_1000281E8);
    memcpy(v5, v6, *(void *)(*(void *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v5, v6, v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

uint64_t sub_1000163F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001640C);
}

uint64_t sub_100016410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100016424);
}

void sub_100016428()
{
  sub_10001ABBC(319, (unint64_t *)&unk_100028348, (void (*)(uint64_t))&type metadata accessor for Date);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *sub_1000164DC(unsigned char *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = &a1[v7];
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for Date();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = sub_100004ACC(&qword_1000281E8);
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v15 = a3[7];
    *((unsigned char *)v4 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    unint64_t v16 = (char *)v4 + v15;
    uint64_t v17 = (char *)a2 + v15;
    if (v12(v17, 1, v10))
    {
      uint64_t v18 = sub_100004ACC(&qword_1000281E8);
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v17, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v10);
    }
  }
  return v4;
}

uint64_t sub_1000166FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v5 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (!v6(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 28);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v7, 1, v5);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    return v9(v7, v5);
  }
  return result;
}

unsigned char *sub_100016830(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = sub_100004ACC(&qword_1000281E8);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  if (v11(v15, 1, v9))
  {
    uint64_t v16 = sub_100004ACC(&qword_1000281E8);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  return a1;
}

unsigned char *sub_100016A00(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = sub_100004ACC(&qword_1000281E8);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  a1[a3[6]] = a2[a3[6]];
  uint64_t v15 = a3[7];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v16, v17, v9);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = sub_100004ACC(&qword_1000281E8);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
  return a1;
}

unsigned char *sub_100016C90(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = sub_100004ACC(&qword_1000281E8);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  if (v11(v15, 1, v9))
  {
    uint64_t v16 = sub_100004ACC(&qword_1000281E8);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  return a1;
}

unsigned char *sub_100016E60(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = sub_100004ACC(&qword_1000281E8);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v16, v17, v9);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = sub_100004ACC(&qword_1000281E8);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v16, v17, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
  return a1;
}

uint64_t sub_1000170EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100017100);
}

uint64_t sub_100017104(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *a1;
    BOOL v5 = v4 >= 2;
    int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v10 = sub_100004ACC(&qword_1000281E8);
    uint64_t v11 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    int v13 = &a1[*(int *)(a3 + 20)];
    return v11(v13, a2, v12);
  }
}

uint64_t sub_1000171B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000171CC);
}

unsigned char *sub_1000171D0(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  BOOL v5 = result;
  if (a3 == 254)
  {
    *uint64_t result = a2 + 1;
  }
  else
  {
    uint64_t v7 = sub_100004ACC(&qword_1000281E8);
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100017278()
{
  sub_10001ABBC(319, (unint64_t *)&unk_100028348, (void (*)(uint64_t))&type metadata accessor for Date);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *sub_100017330(uint64_t a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(_WORD *)(a1 + 4) = *((_WORD *)a2 + 2);
    uint64_t v6 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v6;
    uint64_t v7 = a2[4];
    uint64_t v8 = a3[9];
    __dst = (unsigned char *)(a1 + v8);
    uint64_t v9 = (char *)a2 + v8;
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v7;
    uint64_t v10 = (int *)type metadata accessor for Diagnostics.AFMFollowUpDiagnostics(0);
    uint64_t v11 = *((void *)v10 - 1);
    uint64_t v12 = *(unsigned int (**)(unsigned char *, uint64_t, int *))(v11 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = sub_100004ACC(&qword_1000281F8);
      memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v57 = v11;
      unsigned char *__dst = *v9;
      uint64_t v15 = v10[5];
      uint64_t v16 = &__dst[v15];
      uint64_t v17 = &v9[v15];
      uint64_t v18 = type metadata accessor for Date();
      uint64_t v19 = *(void *)(v18 - 8);
      unint64_t v58 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v19 + 48);
      if (v58(v17, 1, v18))
      {
        uint64_t v20 = sub_100004ACC(&qword_1000281E8);
        memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v19 + 16))(v16, v17, v18);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      }
      __dst[v10[6]] = v9[v10[6]];
      uint64_t v21 = v10[7];
      uint64_t v22 = &__dst[v21];
      uint64_t v23 = &v9[v21];
      if (v58(v23, 1, v18))
      {
        uint64_t v24 = sub_100004ACC(&qword_1000281E8);
        memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v19 + 16))(v22, v23, v18);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v19 + 56))(v22, 0, 1, v18);
      }
      (*(void (**)(unsigned char *, void, uint64_t, int *))(v57 + 56))(__dst, 0, 1, v10);
    }
    uint64_t v25 = a3[10];
    unint64_t v26 = (char *)v4 + v25;
    char v27 = (char *)a2 + v25;
    uint64_t v28 = type metadata accessor for Diagnostics.ADMFollowUpDiagnostics(0);
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
    {
      uint64_t v30 = sub_100004ACC(&qword_1000281F0);
      memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      *unint64_t v26 = *v27;
      uint64_t v31 = *(int *)(v28 + 20);
      uint64_t v32 = &v26[v31];
      uint64_t v33 = &v27[v31];
      uint64_t v34 = type metadata accessor for Date();
      uint64_t v35 = *(void *)(v34 - 8);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
      {
        uint64_t v36 = sub_100004ACC(&qword_1000281E8);
        memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v35 + 16))(v32, v33, v34);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
      }
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
    uint64_t v37 = a3[12];
    *((unsigned char *)v4 + a3[11]) = *((unsigned char *)a2 + a3[11]);
    *((unsigned char *)v4 + v37) = *((unsigned char *)a2 + v37);
    uint64_t v38 = a3[14];
    *((unsigned char *)v4 + a3[13]) = *((unsigned char *)a2 + a3[13]);
    *((unsigned char *)v4 + v38) = *((unsigned char *)a2 + v38);
    uint64_t v39 = a3[16];
    *((unsigned char *)v4 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    NSString v40 = (char *)v4 + v39;
    uint64_t v41 = (char *)a2 + v39;
    uint64_t v42 = type metadata accessor for FeatureRequestDiagnostic();
    uint64_t v43 = *(void *)(v42 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v41, 1, v42))
    {
      uint64_t v44 = sub_100004ACC(&qword_1000281E0);
      memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v40, v41, v42);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
    }
    uint64_t v45 = a3[17];
    uint64_t v46 = (char *)v4 + v45;
    uint64_t v47 = (char *)a2 + v45;
    uint64_t v48 = type metadata accessor for AssetDiagnostics();
    uint64_t v49 = *(void *)(v48 - 8);
    uint64_t v50 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48);
    if (v50(v47, 1, v48))
    {
      uint64_t v51 = sub_100004ACC(&qword_1000281D8);
      memcpy(v46, v47, *(void *)(*(void *)(v51 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v46, v47, v48);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
    }
    uint64_t v52 = a3[18];
    uint64_t v53 = (char *)v4 + v52;
    uint64_t v54 = (char *)a2 + v52;
    if (v50(v54, 1, v48))
    {
      uint64_t v55 = sub_100004ACC(&qword_1000281D8);
      memcpy(v53, v54, *(void *)(*(void *)(v55 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v53, v54, v48);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v53, 0, 1, v48);
    }
  }
  return v4;
}

uint64_t sub_100017A9C(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[9];
  uint64_t v5 = type metadata accessor for Diagnostics.AFMFollowUpDiagnostics(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    uint64_t v6 = v4 + *(int *)(v5 + 20);
    uint64_t v7 = type metadata accessor for Date();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    if (!v9(v6, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    }
    uint64_t v10 = v4 + *(int *)(v5 + 28);
    if (!v9(v10, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v7);
    }
  }
  uint64_t v11 = a1 + a2[10];
  uint64_t v12 = type metadata accessor for Diagnostics.ADMFollowUpDiagnostics(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v11, 1, v12))
  {
    uint64_t v13 = v11 + *(int *)(v12 + 20);
    uint64_t v14 = type metadata accessor for Date();
    uint64_t v15 = *(void *)(v14 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    }
  }
  uint64_t v16 = a1 + a2[16];
  uint64_t v17 = type metadata accessor for FeatureRequestDiagnostic();
  uint64_t v18 = *(void *)(v17 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17)) {
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  }
  uint64_t v19 = a1 + a2[17];
  uint64_t v20 = type metadata accessor for AssetDiagnostics();
  uint64_t v25 = *(void *)(v20 - 8);
  uint64_t v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48);
  if (!v21(v19, 1, v20)) {
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v19, v20);
  }
  uint64_t v22 = a1 + a2[18];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v21)(v22, 1, v20);
  if (!result)
  {
    uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8);
    return v24(v22, v20);
  }
  return result;
}

uint64_t sub_100017E88(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = a3[9];
  __dst = (unsigned char *)(a1 + v7);
  uint64_t v8 = (unsigned char *)(a2 + v7);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  uint64_t v9 = type metadata accessor for Diagnostics.AFMFollowUpDiagnostics(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = sub_100004ACC(&qword_1000281F8);
    memcpy(__dst, v8, *(void *)(*(void *)(v12 - 8) + 64));
    uint64_t v13 = a3;
  }
  else
  {
    uint64_t v58 = v10;
    unsigned char *__dst = *v8;
    uint64_t v14 = *(int *)(v9 + 20);
    uint64_t v15 = &__dst[v14];
    uint64_t v16 = &v8[v14];
    uint64_t v17 = type metadata accessor for Date();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v59 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v18 + 48);
    uint64_t v60 = v9;
    uint64_t v57 = v18;
    if (v59(v16, 1, v17))
    {
      uint64_t v19 = sub_100004ACC(&qword_1000281E8);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    uint64_t v13 = a3;
    uint64_t v20 = v60;
    __dst[*(int *)(v60 + 24)] = v8[*(int *)(v60 + 24)];
    uint64_t v21 = *(int *)(v60 + 28);
    uint64_t v22 = &__dst[v21];
    uint64_t v23 = &v8[v21];
    if (v59(v23, 1, v17))
    {
      uint64_t v24 = sub_100004ACC(&qword_1000281E8);
      memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v57 + 16))(v22, v23, v17);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v57 + 56))(v22, 0, 1, v17);
      uint64_t v20 = v60;
    }
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v58 + 56))(__dst, 0, 1, v20);
  }
  uint64_t v25 = v13[10];
  unint64_t v26 = (unsigned char *)(a1 + v25);
  char v27 = (unsigned char *)(a2 + v25);
  uint64_t v28 = type metadata accessor for Diagnostics.ADMFollowUpDiagnostics(0);
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    uint64_t v30 = sub_100004ACC(&qword_1000281F0);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    *unint64_t v26 = *v27;
    uint64_t v31 = *(int *)(v28 + 20);
    uint64_t v32 = &v26[v31];
    uint64_t v33 = &v27[v31];
    uint64_t v34 = type metadata accessor for Date();
    uint64_t v35 = *(void *)(v34 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
    {
      uint64_t v36 = sub_100004ACC(&qword_1000281E8);
      memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v35 + 16))(v32, v33, v34);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
    }
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  uint64_t v37 = v13[12];
  *(unsigned char *)(a1 + v13[11]) = *(unsigned char *)(a2 + v13[11]);
  *(unsigned char *)(a1 + v37) = *(unsigned char *)(a2 + v37);
  uint64_t v38 = v13[14];
  *(unsigned char *)(a1 + v13[13]) = *(unsigned char *)(a2 + v13[13]);
  *(unsigned char *)(a1 + v38) = *(unsigned char *)(a2 + v38);
  uint64_t v39 = v13[16];
  *(unsigned char *)(a1 + v13[15]) = *(unsigned char *)(a2 + v13[15]);
  NSString v40 = (void *)(a1 + v39);
  uint64_t v41 = (const void *)(a2 + v39);
  uint64_t v42 = type metadata accessor for FeatureRequestDiagnostic();
  uint64_t v43 = *(void *)(v42 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v43 + 48))(v41, 1, v42))
  {
    uint64_t v44 = sub_100004ACC(&qword_1000281E0);
    memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v43 + 16))(v40, v41, v42);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
  }
  uint64_t v45 = v13[17];
  uint64_t v46 = (void *)(a1 + v45);
  uint64_t v47 = (const void *)(a2 + v45);
  uint64_t v48 = type metadata accessor for AssetDiagnostics();
  uint64_t v49 = *(void *)(v48 - 8);
  uint64_t v50 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v49 + 48);
  if (v50(v47, 1, v48))
  {
    uint64_t v51 = sub_100004ACC(&qword_1000281D8);
    memcpy(v46, v47, *(void *)(*(void *)(v51 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v49 + 16))(v46, v47, v48);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
  }
  uint64_t v52 = v13[18];
  uint64_t v53 = (void *)(a1 + v52);
  uint64_t v54 = (const void *)(a2 + v52);
  if (v50(v54, 1, v48))
  {
    uint64_t v55 = sub_100004ACC(&qword_1000281D8);
    memcpy(v53, v54, *(void *)(*(void *)(v55 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v49 + 16))(v53, v54, v48);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v49 + 56))(v53, 0, 1, v48);
  }
  return a1;
}

uint64_t sub_1000185B8(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(unsigned char *)(a1 + 3) = *(unsigned char *)(a2 + 3);
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(unsigned char *)(a1 + 5) = *(unsigned char *)(a2 + 5);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[9];
  uint64_t v7 = (unsigned char *)(a1 + v6);
  uint64_t v8 = (unsigned char *)(a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for Diagnostics.AFMFollowUpDiagnostics(0);
  uint64_t v10 = *((void *)v9 - 1);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, int *))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      *uint64_t v7 = *v8;
      uint64_t v22 = v9[5];
      uint64_t v23 = &v7[v22];
      uint64_t v95 = &v8[v22];
      uint64_t v24 = type metadata accessor for Date();
      uint64_t v91 = *(void *)(v24 - 8);
      uint64_t v93 = v23;
      uint64_t v25 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v91 + 48);
      LODWORD(v23) = v25(v23, 1, v24);
      int v26 = v25(v95, 1, v24);
      if (v23)
      {
        if (v26)
        {
          uint64_t v27 = sub_100004ACC(&qword_1000281E8);
          memcpy(v93, v95, *(void *)(*(void *)(v27 - 8) + 64));
          uint64_t v28 = v91;
        }
        else
        {
          uint64_t v28 = v91;
          (*(void (**)(void *, unsigned char *, uint64_t))(v91 + 16))(v93, v95, v24);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v91 + 56))(v93, 0, 1, v24);
        }
      }
      else
      {
        uint64_t v28 = v91;
        if (v26)
        {
          (*(void (**)(void *, uint64_t))(v91 + 8))(v93, v24);
          uint64_t v83 = sub_100004ACC(&qword_1000281E8);
          memcpy(v93, v95, *(void *)(*(void *)(v83 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, unsigned char *, uint64_t))(v91 + 24))(v93, v95, v24);
        }
      }
      v7[v9[6]] = v8[v9[6]];
      uint64_t v84 = v9[7];
      uint64_t v85 = &v7[v84];
      Swift::String v86 = &v8[v84];
      int v87 = v25(v85, 1, v24);
      int v88 = v25(v86, 1, v24);
      if (v87)
      {
        if (!v88)
        {
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v28 + 16))(v85, v86, v24);
          (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v28 + 56))(v85, 0, 1, v24);
          goto LABEL_17;
        }
      }
      else
      {
        if (!v88)
        {
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v28 + 24))(v85, v86, v24);
          goto LABEL_17;
        }
        (*(void (**)(unsigned char *, uint64_t))(v28 + 8))(v85, v24);
      }
      size_t v19 = *(void *)(*(void *)(sub_100004ACC(&qword_1000281E8) - 8) + 64);
      uint64_t v20 = v85;
      uint64_t v21 = v86;
LABEL_8:
      memcpy(v20, v21, v19);
      goto LABEL_17;
    }
    sub_100014594((uint64_t)v7, type metadata accessor for Diagnostics.AFMFollowUpDiagnostics);
LABEL_7:
    size_t v19 = *(void *)(*(void *)(sub_100004ACC(&qword_1000281F8) - 8) + 64);
    uint64_t v20 = v7;
    uint64_t v21 = v8;
    goto LABEL_8;
  }
  if (v13) {
    goto LABEL_7;
  }
  char v90 = a3;
  *uint64_t v7 = *v8;
  uint64_t v14 = v9[5];
  uint64_t v92 = &v7[v14];
  uint64_t v15 = &v8[v14];
  uint64_t v16 = type metadata accessor for Date();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v94 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v17 + 48);
  uint64_t v89 = v17;
  if (v94(v15, 1, v16))
  {
    uint64_t v18 = sub_100004ACC(&qword_1000281E8);
    memcpy(v92, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v17 + 16))(v92, v15, v16);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v17 + 56))(v92, 0, 1, v16);
  }
  v7[v9[6]] = v8[v9[6]];
  uint64_t v29 = v9[7];
  uint64_t v30 = &v7[v29];
  uint64_t v31 = &v8[v29];
  a3 = v90;
  if (v94(v31, 1, v16))
  {
    uint64_t v32 = sub_100004ACC(&qword_1000281E8);
    memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v89 + 16))(v30, v31, v16);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v89 + 56))(v30, 0, 1, v16);
  }
  (*(void (**)(unsigned char *, void, uint64_t, int *))(v10 + 56))(v7, 0, 1, v9);
LABEL_17:
  uint64_t v33 = a3[10];
  uint64_t v34 = (unsigned char *)(a1 + v33);
  uint64_t v35 = (unsigned char *)(a2 + v33);
  uint64_t v36 = type metadata accessor for Diagnostics.ADMFollowUpDiagnostics(0);
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v37 + 48);
  int v39 = v38(v34, 1, v36);
  int v40 = v38(v35, 1, v36);
  if (!v39)
  {
    if (!v40)
    {
      *uint64_t v34 = *v35;
      uint64_t v50 = *(int *)(v36 + 20);
      uint64_t v51 = &v34[v50];
      uint64_t v52 = &v35[v50];
      uint64_t v53 = type metadata accessor for Date();
      uint64_t v54 = *(void *)(v53 - 8);
      uint64_t v55 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v54 + 48);
      int v56 = v55(v51, 1, v53);
      int v57 = v55(v52, 1, v53);
      if (v56)
      {
        if (!v57)
        {
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v54 + 16))(v51, v52, v53);
          (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, v53);
          goto LABEL_30;
        }
      }
      else
      {
        if (!v57)
        {
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v54 + 24))(v51, v52, v53);
          goto LABEL_30;
        }
        (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v51, v53);
      }
      size_t v47 = *(void *)(*(void *)(sub_100004ACC(&qword_1000281E8) - 8) + 64);
      uint64_t v48 = v51;
      uint64_t v49 = v52;
LABEL_24:
      memcpy(v48, v49, v47);
      goto LABEL_30;
    }
    sub_100014594((uint64_t)v34, type metadata accessor for Diagnostics.ADMFollowUpDiagnostics);
LABEL_23:
    size_t v47 = *(void *)(*(void *)(sub_100004ACC(&qword_1000281F0) - 8) + 64);
    uint64_t v48 = v34;
    uint64_t v49 = v35;
    goto LABEL_24;
  }
  if (v40) {
    goto LABEL_23;
  }
  *uint64_t v34 = *v35;
  uint64_t v41 = *(int *)(v36 + 20);
  uint64_t v42 = &v34[v41];
  uint64_t v43 = &v35[v41];
  uint64_t v44 = type metadata accessor for Date();
  uint64_t v45 = *(void *)(v44 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v45 + 48))(v43, 1, v44))
  {
    uint64_t v46 = sub_100004ACC(&qword_1000281E8);
    memcpy(v42, v43, *(void *)(*(void *)(v46 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v45 + 16))(v42, v43, v44);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v45 + 56))(v42, 0, 1, v44);
  }
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
LABEL_30:
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  uint64_t v58 = a3[16];
  uint64_t v59 = (void *)(a1 + v58);
  uint64_t v60 = (void *)(a2 + v58);
  uint64_t v61 = type metadata accessor for FeatureRequestDiagnostic();
  uint64_t v62 = *(void *)(v61 - 8);
  uint64_t v63 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v62 + 48);
  int v64 = v63(v59, 1, v61);
  int v65 = v63(v60, 1, v61);
  if (v64)
  {
    if (!v65)
    {
      (*(void (**)(void *, void *, uint64_t))(v62 + 16))(v59, v60, v61);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v62 + 56))(v59, 0, 1, v61);
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (v65)
  {
    (*(void (**)(void *, uint64_t))(v62 + 8))(v59, v61);
LABEL_35:
    uint64_t v66 = sub_100004ACC(&qword_1000281E0);
    memcpy(v59, v60, *(void *)(*(void *)(v66 - 8) + 64));
    goto LABEL_36;
  }
  (*(void (**)(void *, void *, uint64_t))(v62 + 24))(v59, v60, v61);
LABEL_36:
  uint64_t v67 = a3[17];
  id v68 = (void *)(a1 + v67);
  char v69 = (void *)(a2 + v67);
  uint64_t v70 = type metadata accessor for AssetDiagnostics();
  uint64_t v71 = *(void *)(v70 - 8);
  char v72 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v71 + 48);
  int v73 = v72(v68, 1, v70);
  int v74 = v72(v69, 1, v70);
  if (v73)
  {
    if (!v74)
    {
      (*(void (**)(void *, void *, uint64_t))(v71 + 16))(v68, v69, v70);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v71 + 56))(v68, 0, 1, v70);
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (v74)
  {
    (*(void (**)(void *, uint64_t))(v71 + 8))(v68, v70);
LABEL_41:
    uint64_t v75 = sub_100004ACC(&qword_1000281D8);
    memcpy(v68, v69, *(void *)(*(void *)(v75 - 8) + 64));
    goto LABEL_42;
  }
  (*(void (**)(void *, void *, uint64_t))(v71 + 24))(v68, v69, v70);
LABEL_42:
  uint64_t v76 = a3[18];
  BOOL v77 = (void *)(a1 + v76);
  uint64_t v78 = (void *)(a2 + v76);
  int v79 = v72((void *)(a1 + v76), 1, v70);
  int v80 = v72(v78, 1, v70);
  if (!v79)
  {
    if (!v80)
    {
      (*(void (**)(void *, void *, uint64_t))(v71 + 24))(v77, v78, v70);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v71 + 8))(v77, v70);
    goto LABEL_47;
  }
  if (v80)
  {
LABEL_47:
    uint64_t v81 = sub_100004ACC(&qword_1000281D8);
    memcpy(v77, v78, *(void *)(*(void *)(v81 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v71 + 16))(v77, v78, v70);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v71 + 56))(v77, 0, 1, v70);
  return a1;
}

uint64_t sub_100019270(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = a3[9];
  uint64_t v7 = (unsigned char *)(a1 + v6);
  uint64_t v8 = (unsigned char *)(a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for Diagnostics.AFMFollowUpDiagnostics(0);
  uint64_t v10 = *((void *)v9 - 1);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, int *))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_100004ACC(&qword_1000281F8);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    *uint64_t v7 = *v8;
    uint64_t v12 = v9[5];
    __dst = &v7[v12];
    int v13 = &v8[v12];
    uint64_t v14 = type metadata accessor for Date();
    uint64_t v15 = *(void *)(v14 - 8);
    __src = v13;
    int v57 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48);
    uint64_t v16 = v13;
    uint64_t v17 = v14;
    uint64_t v55 = v15;
    if (v57(v16, 1, v14))
    {
      uint64_t v18 = sub_100004ACC(&qword_1000281E8);
      memcpy(__dst, __src, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, void *, uint64_t))(v15 + 32))(__dst, __src, v17);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v17);
    }
    v7[v9[6]] = v8[v9[6]];
    uint64_t v19 = v9[7];
    uint64_t v20 = &v7[v19];
    uint64_t v21 = &v8[v19];
    if (v57(v21, 1, v17))
    {
      uint64_t v22 = sub_100004ACC(&qword_1000281E8);
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v55 + 32))(v20, v21, v17);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v55 + 56))(v20, 0, 1, v17);
    }
    (*(void (**)(unsigned char *, void, uint64_t, int *))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v23 = a3[10];
  uint64_t v24 = (unsigned char *)(a1 + v23);
  uint64_t v25 = (unsigned char *)(a2 + v23);
  uint64_t v26 = type metadata accessor for Diagnostics.ADMFollowUpDiagnostics(0);
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
  {
    uint64_t v28 = sub_100004ACC(&qword_1000281F0);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    *uint64_t v24 = *v25;
    uint64_t v29 = *(int *)(v26 + 20);
    uint64_t v30 = &v24[v29];
    uint64_t v31 = &v25[v29];
    uint64_t v32 = type metadata accessor for Date();
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
    {
      uint64_t v34 = sub_100004ACC(&qword_1000281E8);
      memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v33 + 32))(v30, v31, v32);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
    }
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  uint64_t v35 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v35) = *(unsigned char *)(a2 + v35);
  uint64_t v36 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v36) = *(unsigned char *)(a2 + v36);
  uint64_t v37 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  uint64_t v38 = (void *)(a1 + v37);
  int v39 = (const void *)(a2 + v37);
  uint64_t v40 = type metadata accessor for FeatureRequestDiagnostic();
  uint64_t v41 = *(void *)(v40 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40))
  {
    uint64_t v42 = sub_100004ACC(&qword_1000281E0);
    memcpy(v38, v39, *(void *)(*(void *)(v42 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v41 + 32))(v38, v39, v40);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
  }
  uint64_t v43 = a3[17];
  uint64_t v44 = (void *)(a1 + v43);
  uint64_t v45 = (const void *)(a2 + v43);
  uint64_t v46 = type metadata accessor for AssetDiagnostics();
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v47 + 48);
  if (v48(v45, 1, v46))
  {
    uint64_t v49 = sub_100004ACC(&qword_1000281D8);
    memcpy(v44, v45, *(void *)(*(void *)(v49 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v47 + 32))(v44, v45, v46);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v47 + 56))(v44, 0, 1, v46);
  }
  uint64_t v50 = a3[18];
  uint64_t v51 = (void *)(a1 + v50);
  uint64_t v52 = (const void *)(a2 + v50);
  if (v48(v52, 1, v46))
  {
    uint64_t v53 = sub_100004ACC(&qword_1000281D8);
    memcpy(v51, v52, *(void *)(*(void *)(v53 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v47 + 32))(v51, v52, v46);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v47 + 56))(v51, 0, 1, v46);
  }
  return a1;
}

uint64_t sub_100019978(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(unsigned char *)(a1 + 3) = *(unsigned char *)(a2 + 3);
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(unsigned char *)(a1 + 5) = *(unsigned char *)(a2 + 5);
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[9];
  uint64_t v8 = (unsigned char *)(a1 + v7);
  uint64_t v9 = (unsigned char *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for Diagnostics.AFMFollowUpDiagnostics(0);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(unsigned char *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      *uint64_t v8 = *v9;
      uint64_t v23 = v10[5];
      uint64_t v24 = &v8[v23];
      uint64_t v98 = &v9[v23];
      uint64_t v25 = type metadata accessor for Date();
      uint64_t v94 = *(void *)(v25 - 8);
      id v96 = v24;
      uint64_t v26 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v94 + 48);
      LODWORD(v24) = v26(v24, 1, v25);
      int v27 = v26(v98, 1, v25);
      if (v24)
      {
        if (v27)
        {
          uint64_t v28 = sub_100004ACC(&qword_1000281E8);
          memcpy(v96, v98, *(void *)(*(void *)(v28 - 8) + 64));
          uint64_t v29 = v94;
        }
        else
        {
          uint64_t v29 = v94;
          (*(void (**)(void *, unsigned char *, uint64_t))(v94 + 32))(v96, v98, v25);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v94 + 56))(v96, 0, 1, v25);
        }
      }
      else
      {
        uint64_t v29 = v94;
        if (v27)
        {
          (*(void (**)(void *, uint64_t))(v94 + 8))(v96, v25);
          uint64_t v86 = sub_100004ACC(&qword_1000281E8);
          memcpy(v96, v98, *(void *)(*(void *)(v86 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, unsigned char *, uint64_t))(v94 + 40))(v96, v98, v25);
        }
      }
      v8[v10[6]] = v9[v10[6]];
      uint64_t v87 = v10[7];
      int v88 = &v8[v87];
      uint64_t v89 = &v9[v87];
      int v90 = v26(v88, 1, v25);
      int v91 = v26(v89, 1, v25);
      if (v90)
      {
        if (!v91)
        {
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v29 + 32))(v88, v89, v25);
          (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v29 + 56))(v88, 0, 1, v25);
          goto LABEL_17;
        }
      }
      else
      {
        if (!v91)
        {
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v29 + 40))(v88, v89, v25);
          goto LABEL_17;
        }
        (*(void (**)(unsigned char *, uint64_t))(v29 + 8))(v88, v25);
      }
      size_t v20 = *(void *)(*(void *)(sub_100004ACC(&qword_1000281E8) - 8) + 64);
      uint64_t v21 = v88;
      uint64_t v22 = v89;
LABEL_8:
      memcpy(v21, v22, v20);
      goto LABEL_17;
    }
    sub_100014594((uint64_t)v8, type metadata accessor for Diagnostics.AFMFollowUpDiagnostics);
LABEL_7:
    size_t v20 = *(void *)(*(void *)(sub_100004ACC(&qword_1000281F8) - 8) + 64);
    uint64_t v21 = v8;
    uint64_t v22 = v9;
    goto LABEL_8;
  }
  if (v14) {
    goto LABEL_7;
  }
  uint64_t v93 = a3;
  *uint64_t v8 = *v9;
  uint64_t v15 = v10[5];
  uint64_t v95 = &v8[v15];
  uint64_t v16 = &v9[v15];
  uint64_t v17 = type metadata accessor for Date();
  uint64_t v18 = *(void *)(v17 - 8);
  v97 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v18 + 48);
  uint64_t v92 = v18;
  if (v97(v16, 1, v17))
  {
    uint64_t v19 = sub_100004ACC(&qword_1000281E8);
    memcpy(v95, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v18 + 32))(v95, v16, v17);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v18 + 56))(v95, 0, 1, v17);
  }
  v8[v10[6]] = v9[v10[6]];
  uint64_t v30 = v10[7];
  uint64_t v31 = &v8[v30];
  uint64_t v32 = &v9[v30];
  a3 = v93;
  if (v97(v32, 1, v17))
  {
    uint64_t v33 = sub_100004ACC(&qword_1000281E8);
    memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v92 + 32))(v31, v32, v17);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v92 + 56))(v31, 0, 1, v17);
  }
  (*(void (**)(unsigned char *, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
LABEL_17:
  uint64_t v34 = a3[10];
  uint64_t v35 = (unsigned char *)(a1 + v34);
  uint64_t v36 = (unsigned char *)(a2 + v34);
  uint64_t v37 = type metadata accessor for Diagnostics.ADMFollowUpDiagnostics(0);
  uint64_t v38 = *(void *)(v37 - 8);
  int v39 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v38 + 48);
  int v40 = v39(v35, 1, v37);
  int v41 = v39(v36, 1, v37);
  if (!v40)
  {
    if (!v41)
    {
      unsigned char *v35 = *v36;
      uint64_t v51 = *(int *)(v37 + 20);
      uint64_t v52 = &v35[v51];
      uint64_t v53 = &v36[v51];
      uint64_t v54 = type metadata accessor for Date();
      uint64_t v55 = *(void *)(v54 - 8);
      int v56 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v55 + 48);
      int v57 = v56(v52, 1, v54);
      int v58 = v56(v53, 1, v54);
      if (v57)
      {
        if (!v58)
        {
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v55 + 32))(v52, v53, v54);
          (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v55 + 56))(v52, 0, 1, v54);
          goto LABEL_30;
        }
      }
      else
      {
        if (!v58)
        {
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v55 + 40))(v52, v53, v54);
          goto LABEL_30;
        }
        (*(void (**)(unsigned char *, uint64_t))(v55 + 8))(v52, v54);
      }
      size_t v48 = *(void *)(*(void *)(sub_100004ACC(&qword_1000281E8) - 8) + 64);
      uint64_t v49 = v52;
      uint64_t v50 = v53;
LABEL_24:
      memcpy(v49, v50, v48);
      goto LABEL_30;
    }
    sub_100014594((uint64_t)v35, type metadata accessor for Diagnostics.ADMFollowUpDiagnostics);
LABEL_23:
    size_t v48 = *(void *)(*(void *)(sub_100004ACC(&qword_1000281F0) - 8) + 64);
    uint64_t v49 = v35;
    uint64_t v50 = v36;
    goto LABEL_24;
  }
  if (v41) {
    goto LABEL_23;
  }
  unsigned char *v35 = *v36;
  uint64_t v42 = *(int *)(v37 + 20);
  uint64_t v43 = &v35[v42];
  uint64_t v44 = &v36[v42];
  uint64_t v45 = type metadata accessor for Date();
  uint64_t v46 = *(void *)(v45 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v46 + 48))(v44, 1, v45))
  {
    uint64_t v47 = sub_100004ACC(&qword_1000281E8);
    memcpy(v43, v44, *(void *)(*(void *)(v47 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v46 + 32))(v43, v44, v45);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
  }
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
LABEL_30:
  uint64_t v59 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v59) = *(unsigned char *)(a2 + v59);
  uint64_t v60 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v60) = *(unsigned char *)(a2 + v60);
  uint64_t v61 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  uint64_t v62 = (void *)(a1 + v61);
  uint64_t v63 = (void *)(a2 + v61);
  uint64_t v64 = type metadata accessor for FeatureRequestDiagnostic();
  uint64_t v65 = *(void *)(v64 - 8);
  uint64_t v66 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v65 + 48);
  int v67 = v66(v62, 1, v64);
  int v68 = v66(v63, 1, v64);
  if (v67)
  {
    if (!v68)
    {
      (*(void (**)(void *, void *, uint64_t))(v65 + 32))(v62, v63, v64);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v65 + 56))(v62, 0, 1, v64);
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (v68)
  {
    (*(void (**)(void *, uint64_t))(v65 + 8))(v62, v64);
LABEL_35:
    uint64_t v69 = sub_100004ACC(&qword_1000281E0);
    memcpy(v62, v63, *(void *)(*(void *)(v69 - 8) + 64));
    goto LABEL_36;
  }
  (*(void (**)(void *, void *, uint64_t))(v65 + 40))(v62, v63, v64);
LABEL_36:
  uint64_t v70 = a3[17];
  uint64_t v71 = (void *)(a1 + v70);
  char v72 = (void *)(a2 + v70);
  uint64_t v73 = type metadata accessor for AssetDiagnostics();
  uint64_t v74 = *(void *)(v73 - 8);
  uint64_t v75 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v74 + 48);
  int v76 = v75(v71, 1, v73);
  int v77 = v75(v72, 1, v73);
  if (v76)
  {
    if (!v77)
    {
      (*(void (**)(void *, void *, uint64_t))(v74 + 32))(v71, v72, v73);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v74 + 56))(v71, 0, 1, v73);
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (v77)
  {
    (*(void (**)(void *, uint64_t))(v74 + 8))(v71, v73);
LABEL_41:
    uint64_t v78 = sub_100004ACC(&qword_1000281D8);
    memcpy(v71, v72, *(void *)(*(void *)(v78 - 8) + 64));
    goto LABEL_42;
  }
  (*(void (**)(void *, void *, uint64_t))(v74 + 40))(v71, v72, v73);
LABEL_42:
  uint64_t v79 = a3[18];
  int v80 = (void *)(a1 + v79);
  uint64_t v81 = (void *)(a2 + v79);
  int v82 = v75((void *)(a1 + v79), 1, v73);
  int v83 = v75(v81, 1, v73);
  if (!v82)
  {
    if (!v83)
    {
      (*(void (**)(void *, void *, uint64_t))(v74 + 40))(v80, v81, v73);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v74 + 8))(v80, v73);
    goto LABEL_47;
  }
  if (v83)
  {
LABEL_47:
    uint64_t v84 = sub_100004ACC(&qword_1000281D8);
    memcpy(v80, v81, *(void *)(*(void *)(v84 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v74 + 32))(v80, v81, v73);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v74 + 56))(v80, 0, 1, v73);
  return a1;
}

uint64_t sub_10001A604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001A618);
}

uint64_t sub_10001A618(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_100004ACC(&qword_1000281F8);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[9];
LABEL_11:
    int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v14(a1 + v11, a2, v9);
  }
  uint64_t v12 = sub_100004ACC(&qword_1000281F0);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[10];
    goto LABEL_11;
  }
  uint64_t v13 = sub_100004ACC(&qword_1000281E0);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a3[16];
    goto LABEL_11;
  }
  uint64_t v15 = sub_100004ACC(&qword_1000281D8);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a3[17];

  return v16(v18, a2, v17);
}

uint64_t sub_10001A7EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001A800);
}

uint64_t sub_10001A800(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_100004ACC(&qword_1000281F8);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[9];
LABEL_9:
    int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v14(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = sub_100004ACC(&qword_1000281F0);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[10];
    goto LABEL_9;
  }
  uint64_t v13 = sub_100004ACC(&qword_1000281E0);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[16];
    goto LABEL_9;
  }
  uint64_t v15 = sub_100004ACC(&qword_1000281D8);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = v5 + a4[17];

  return v16(v18, a2, a2, v17);
}

void sub_10001A9D4()
{
  sub_10001ABBC(319, &qword_100028478, (void (*)(uint64_t))type metadata accessor for Diagnostics.AFMFollowUpDiagnostics);
  if (v0 <= 0x3F)
  {
    sub_10001ABBC(319, &qword_100028480, (void (*)(uint64_t))type metadata accessor for Diagnostics.ADMFollowUpDiagnostics);
    if (v1 <= 0x3F)
    {
      sub_10001ABBC(319, &qword_100028488, (void (*)(uint64_t))&type metadata accessor for FeatureRequestDiagnostic);
      if (v2 <= 0x3F)
      {
        sub_10001ABBC(319, (unint64_t *)&unk_100028490, (void (*)(uint64_t))&type metadata accessor for AssetDiagnostics);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_10001ABBC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_10001AC14()
{
  unint64_t result = qword_1000284F8;
  if (!qword_1000284F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000284F8);
  }
  return result;
}

unint64_t sub_10001AC6C()
{
  unint64_t result = qword_100028500;
  if (!qword_100028500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028500);
  }
  return result;
}

unint64_t sub_10001ACC4()
{
  unint64_t result = qword_100028508;
  if (!qword_100028508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028508);
  }
  return result;
}

unint64_t sub_10001AD18()
{
  unint64_t result = qword_100028518;
  if (!qword_100028518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028518);
  }
  return result;
}

unint64_t sub_10001AD6C()
{
  unint64_t result = qword_100028520;
  if (!qword_100028520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028520);
  }
  return result;
}

unint64_t sub_10001ADC0()
{
  unint64_t result = qword_100028538;
  if (!qword_100028538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028538);
  }
  return result;
}

unint64_t sub_10001AE14()
{
  unint64_t result = qword_100028550;
  if (!qword_100028550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028550);
  }
  return result;
}

unint64_t sub_10001AE68()
{
  unint64_t result = qword_100028568;
  if (!qword_100028568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028568);
  }
  return result;
}

unint64_t sub_10001AEBC()
{
  unint64_t result = qword_100028570;
  if (!qword_100028570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028570);
  }
  return result;
}

unint64_t sub_10001AF10()
{
  unint64_t result = qword_100028578;
  if (!qword_100028578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028578);
  }
  return result;
}

unint64_t sub_10001AF64()
{
  unint64_t result = qword_100028580;
  if (!qword_100028580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028580);
  }
  return result;
}

unint64_t sub_10001AFB8()
{
  unint64_t result = qword_100028588;
  if (!qword_100028588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028588);
  }
  return result;
}

uint64_t sub_10001B00C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000100021C90
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000100021B90 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x696B726F7774656ELL && a2 == 0xEA0000000000676ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1685289331 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1852797802 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

unint64_t sub_10001B210(void *a1)
{
  uint64_t v3 = sub_100004ACC(&qword_100028750);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100015678(a1, a1[3]);
  sub_10001D7D8();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1) {
    return sub_100015710((uint64_t)a1);
  }
  char v22 = 0;
  char v7 = KeyedDecodingContainer.decode(_:forKey:)();
  char v21 = 1;
  char v8 = KeyedDecodingContainer.decode(_:forKey:)();
  char v20 = 2;
  char v9 = KeyedDecodingContainer.decode(_:forKey:)();
  char v19 = 3;
  int v17 = KeyedDecodingContainer.decode(_:forKey:)();
  char v18 = 4;
  char v11 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_100015710((uint64_t)a1);
  uint64_t v12 = &_mh_execute_header;
  if ((v11 & 1) == 0) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = 0x1000000;
  if ((v17 & 1) == 0) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = 0x10000;
  if ((v9 & 1) == 0) {
    uint64_t v14 = 0;
  }
  uint64_t v15 = 256;
  if ((v8 & 1) == 0) {
    uint64_t v15 = 0;
  }
  return v15 & 0xFFFFFFFFFFFFFFFELL | v7 & 1 | v14 | v13 | (unint64_t)v12;
}

uint64_t sub_10001B46C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4965727574616566 && a2 == 0xE900000000000044;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6573556E6163 && a2 == 0xE600000000000000)
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

uint64_t sub_10001B564(void *a1)
{
  uint64_t v3 = sub_100004ACC(&qword_100028590);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  sub_100015678(a1, a1[3]);
  sub_10001C5E8();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    sub_100015710((uint64_t)a1);
  }
  else
  {
    v9[15] = 0;
    uint64_t v7 = KeyedDecodingContainer.decode(_:forKey:)();
    v9[14] = 1;
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    sub_100015710((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_10001B750(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x737574617473 && a2 == 0xE600000000000000)
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

uint64_t sub_10001B82C(void *a1)
{
  uint64_t v3 = sub_100004ACC(&qword_1000285A8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  sub_100015678(a1, a1[3]);
  sub_10001C63C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    sub_100015710((uint64_t)a1);
  }
  else
  {
    char v12 = 0;
    uint64_t v7 = KeyedDecodingContainer.decode(_:forKey:)();
    type metadata accessor for TicketStatus();
    v10[15] = 1;
    sub_100013690(&qword_1000285B8, (void (*)(uint64_t))&type metadata accessor for TicketStatus);
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    id v9 = v11;
    sub_100015710((uint64_t)a1);

    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_10001BA78(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x46746E6553736168 && a2 == 0xEF7055776F6C6C6FLL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746144746E6573 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000100021C50 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000100021C70)
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

uint64_t sub_10001BC4C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x46746E6553736168 && a2 == 0xEF7055776F6C6C6FLL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746144746E6573 && a2 == 0xE800000000000000)
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

uint64_t sub_10001BD64(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x72756769666E6F63 && a2 == 0xED00006E6F697461;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100021BD0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7365727574616566 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7374656B636974 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6F6C6C6F466D6661 && a2 == 0xEB00000000705577 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6F6C6C6F466D6461 && a2 == 0xEB00000000705577 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x737361707962 && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x73617079426D6461 && a2 == 0xE900000000000073 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x7079427465737361 && a2 == 0xEB00000000737361 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6E4974706FLL && a2 == 0xE500000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x65446C6961746572 && a2 == 0xEA00000000006F6DLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000100021BF0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000100021C10 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000100021C30)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 14;
    }
    else {
      return 15;
    }
  }
}

uint64_t sub_10001C398(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1819047270 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000100021B90 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000100021BB0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x696B726F7774656ELL && a2 == 0xEA0000000000676ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1685289331 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 1852797802 && a2 == 0xE400000000000000)
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

unint64_t sub_10001C5E8()
{
  unint64_t result = qword_100028598;
  if (!qword_100028598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028598);
  }
  return result;
}

unint64_t sub_10001C63C()
{
  unint64_t result = qword_1000285B0;
  if (!qword_1000285B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285B0);
  }
  return result;
}

unint64_t sub_10001C690()
{
  unint64_t result = qword_1000285D8;
  if (!qword_1000285D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285D8);
  }
  return result;
}

unint64_t sub_10001C6E4()
{
  unint64_t result = qword_100028600;
  if (!qword_100028600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028600);
  }
  return result;
}

uint64_t sub_10001C738(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001C7A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004ACC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10001C7FC()
{
  unint64_t result = qword_100028618;
  if (!qword_100028618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028618);
  }
  return result;
}

unint64_t sub_10001C850()
{
  unint64_t result = qword_100028628;
  if (!qword_100028628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028628);
  }
  return result;
}

uint64_t sub_10001C8A4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000140B0(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001C910()
{
  unint64_t result = qword_100028638;
  if (!qword_100028638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028638);
  }
  return result;
}

unint64_t sub_10001C964()
{
  unint64_t result = qword_100028650;
  if (!qword_100028650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028650);
  }
  return result;
}

unint64_t sub_10001C9B8()
{
  unint64_t result = qword_100028658;
  if (!qword_100028658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028658);
  }
  return result;
}

unint64_t sub_10001CA0C()
{
  unint64_t result = qword_100028660;
  if (!qword_100028660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028660);
  }
  return result;
}

unint64_t sub_10001CA60()
{
  unint64_t result = qword_100028668;
  if (!qword_100028668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028668);
  }
  return result;
}

unint64_t sub_10001CAB4()
{
  unint64_t result = qword_100028670;
  if (!qword_100028670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028670);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Diagnostics.AFMFollowUpDiagnostics.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Diagnostics.AFMFollowUpDiagnostics.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x10001CC64);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_10001CC8C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001CC94(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Diagnostics.AFMFollowUpDiagnostics.CodingKeys()
{
  return &type metadata for Diagnostics.AFMFollowUpDiagnostics.CodingKeys;
}

unsigned char *sub_10001CCB4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Diagnostics.ADMFollowUpDiagnostics.CodingKeys()
{
  return &type metadata for Diagnostics.ADMFollowUpDiagnostics.CodingKeys;
}

ValueMetadata *type metadata accessor for Diagnostics.SanitizedTicket.CodingKeys()
{
  return &type metadata for Diagnostics.SanitizedTicket.CodingKeys;
}

uint64_t _s11csfdiagnose11DiagnosticsV22ADMFollowUpDiagnosticsV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s11csfdiagnose11DiagnosticsV22ADMFollowUpDiagnosticsV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001CE3CLL);
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

ValueMetadata *type metadata accessor for Diagnostics.SanitizedFeature.CodingKeys()
{
  return &type metadata for Diagnostics.SanitizedFeature.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Diagnostics.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
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
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Diagnostics.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *unint64_t result = a2 + 14;
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
        JUMPOUT(0x10001CFD0);
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
          *unint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Diagnostics.CodingKeys()
{
  return &type metadata for Diagnostics.CodingKeys;
}

ValueMetadata *type metadata accessor for Diagnostics.RetailDemoDiagnostics()
{
  return &type metadata for Diagnostics.RetailDemoDiagnostics;
}

ValueMetadata *type metadata accessor for Diagnostics.OptInDiagnostics()
{
  return &type metadata for Diagnostics.OptInDiagnostics;
}

ValueMetadata *type metadata accessor for Diagnostics.GMAssetBypassDiagnostics()
{
  return &type metadata for Diagnostics.GMAssetBypassDiagnostics;
}

ValueMetadata *type metadata accessor for Diagnostics.GMADMBypassDiagnostics()
{
  return &type metadata for Diagnostics.GMADMBypassDiagnostics;
}

uint64_t _s11csfdiagnose11DiagnosticsV19GMBypassDiagnosticsVwet_0(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s11csfdiagnose11DiagnosticsV19GMBypassDiagnosticsVwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001D1BCLL);
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

ValueMetadata *type metadata accessor for Diagnostics.GMBypassDiagnostics()
{
  return &type metadata for Diagnostics.GMBypassDiagnostics;
}

uint64_t initializeBufferWithCopyOfBuffer for Diagnostics.Configuration(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for Diagnostics.Configuration(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[5]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Diagnostics.Configuration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 5) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 5) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Diagnostics.Configuration()
{
  return &type metadata for Diagnostics.Configuration;
}

unint64_t sub_10001D2B4()
{
  unint64_t result = qword_100028678;
  if (!qword_100028678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028678);
  }
  return result;
}

unint64_t sub_10001D30C()
{
  unint64_t result = qword_100028680;
  if (!qword_100028680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028680);
  }
  return result;
}

unint64_t sub_10001D364()
{
  unint64_t result = qword_100028688;
  if (!qword_100028688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028688);
  }
  return result;
}

unint64_t sub_10001D3BC()
{
  unint64_t result = qword_100028690;
  if (!qword_100028690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028690);
  }
  return result;
}

unint64_t sub_10001D414()
{
  unint64_t result = qword_100028698;
  if (!qword_100028698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028698);
  }
  return result;
}

unint64_t sub_10001D46C()
{
  unint64_t result = qword_1000286A0;
  if (!qword_1000286A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286A0);
  }
  return result;
}

unint64_t sub_10001D4C4()
{
  unint64_t result = qword_1000286A8;
  if (!qword_1000286A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286A8);
  }
  return result;
}

unint64_t sub_10001D51C()
{
  unint64_t result = qword_1000286B0;
  if (!qword_1000286B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286B0);
  }
  return result;
}

unint64_t sub_10001D574()
{
  unint64_t result = qword_1000286B8;
  if (!qword_1000286B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286B8);
  }
  return result;
}

unint64_t sub_10001D5CC()
{
  unint64_t result = qword_1000286C0;
  if (!qword_1000286C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286C0);
  }
  return result;
}

unint64_t sub_10001D624()
{
  unint64_t result = qword_1000286C8;
  if (!qword_1000286C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286C8);
  }
  return result;
}

unint64_t sub_10001D67C()
{
  unint64_t result = qword_1000286D0;
  if (!qword_1000286D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286D0);
  }
  return result;
}

unint64_t sub_10001D6D4()
{
  unint64_t result = qword_1000286D8;
  if (!qword_1000286D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286D8);
  }
  return result;
}

unint64_t sub_10001D72C()
{
  unint64_t result = qword_1000286E0;
  if (!qword_1000286E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286E0);
  }
  return result;
}

unint64_t sub_10001D784()
{
  unint64_t result = qword_1000286E8;
  if (!qword_1000286E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286E8);
  }
  return result;
}

unint64_t sub_10001D7D8()
{
  unint64_t result = qword_1000286F8;
  if (!qword_1000286F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286F8);
  }
  return result;
}

unint64_t sub_10001D82C()
{
  unint64_t result = qword_100028708;
  if (!qword_100028708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028708);
  }
  return result;
}

unint64_t sub_10001D880()
{
  unint64_t result = qword_100028718;
  if (!qword_100028718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028718);
  }
  return result;
}

unint64_t sub_10001D8D4()
{
  unint64_t result = qword_100028728;
  if (!qword_100028728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028728);
  }
  return result;
}

unint64_t sub_10001D928()
{
  unint64_t result = qword_100028738;
  if (!qword_100028738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028738);
  }
  return result;
}

unint64_t sub_10001D97C()
{
  unint64_t result = qword_100028748;
  if (!qword_100028748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028748);
  }
  return result;
}

uint64_t sub_10001D9DC()
{
  return 0;
}

ValueMetadata *type metadata accessor for Diagnostics.RetailDemoDiagnostics.CodingKeys()
{
  return &type metadata for Diagnostics.RetailDemoDiagnostics.CodingKeys;
}

ValueMetadata *type metadata accessor for Diagnostics.OptInDiagnostics.CodingKeys()
{
  return &type metadata for Diagnostics.OptInDiagnostics.CodingKeys;
}

ValueMetadata *type metadata accessor for Diagnostics.GMAssetBypassDiagnostics.CodingKeys()
{
  return &type metadata for Diagnostics.GMAssetBypassDiagnostics.CodingKeys;
}

ValueMetadata *type metadata accessor for Diagnostics.GMADMBypassDiagnostics.CodingKeys()
{
  return &type metadata for Diagnostics.GMADMBypassDiagnostics.CodingKeys;
}

uint64_t _s11csfdiagnose11DiagnosticsV21RetailDemoDiagnosticsV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s11csfdiagnose11DiagnosticsV21RetailDemoDiagnosticsV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10001DB10);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Diagnostics.GMBypassDiagnostics.CodingKeys()
{
  return &type metadata for Diagnostics.GMBypassDiagnostics.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Diagnostics.Configuration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Diagnostics.Configuration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x10001DCA4);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Diagnostics.Configuration.CodingKeys()
{
  return &type metadata for Diagnostics.Configuration.CodingKeys;
}

unint64_t sub_10001DCE0()
{
  unint64_t result = qword_100028780;
  if (!qword_100028780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028780);
  }
  return result;
}

unint64_t sub_10001DD38()
{
  unint64_t result = qword_100028788;
  if (!qword_100028788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028788);
  }
  return result;
}

unint64_t sub_10001DD90()
{
  unint64_t result = qword_100028790;
  if (!qword_100028790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028790);
  }
  return result;
}

unint64_t sub_10001DDE8()
{
  unint64_t result = qword_100028798;
  if (!qword_100028798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028798);
  }
  return result;
}

unint64_t sub_10001DE40()
{
  unint64_t result = qword_1000287A0;
  if (!qword_1000287A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287A0);
  }
  return result;
}

unint64_t sub_10001DE98()
{
  unint64_t result = qword_1000287A8;
  if (!qword_1000287A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287A8);
  }
  return result;
}

unint64_t sub_10001DEF0()
{
  unint64_t result = qword_1000287B0;
  if (!qword_1000287B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287B0);
  }
  return result;
}

unint64_t sub_10001DF48()
{
  unint64_t result = qword_1000287B8;
  if (!qword_1000287B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287B8);
  }
  return result;
}

unint64_t sub_10001DFA0()
{
  unint64_t result = qword_1000287C0;
  if (!qword_1000287C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287C0);
  }
  return result;
}

unint64_t sub_10001DFF8()
{
  unint64_t result = qword_1000287C8;
  if (!qword_1000287C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287C8);
  }
  return result;
}

unint64_t sub_10001E050()
{
  unint64_t result = qword_1000287D0;
  if (!qword_1000287D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287D0);
  }
  return result;
}

unint64_t sub_10001E0A8()
{
  unint64_t result = qword_1000287D8;
  if (!qword_1000287D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287D8);
  }
  return result;
}

unint64_t sub_10001E100()
{
  unint64_t result = qword_1000287E0;
  if (!qword_1000287E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287E0);
  }
  return result;
}

unint64_t sub_10001E158()
{
  unint64_t result = qword_1000287E8;
  if (!qword_1000287E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287E8);
  }
  return result;
}

unint64_t sub_10001E1B0()
{
  unint64_t result = qword_1000287F0;
  if (!qword_1000287F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287F0);
  }
  return result;
}

unint64_t sub_10001E208()
{
  unint64_t result = qword_1000287F8;
  if (!qword_1000287F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287F8);
  }
  return result;
}

unint64_t sub_10001E260()
{
  unint64_t result = qword_100028800;
  if (!qword_100028800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028800);
  }
  return result;
}

unint64_t sub_10001E2B8()
{
  unint64_t result = qword_100028808;
  if (!qword_100028808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100028808);
  }
  return result;
}

uint64_t sub_10001E328()
{
  sub_100004ACC(&qword_100028078);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(60);
  v1._object = (void *)0x8000000100021D60;
  v1._countAndFlagsBits = 0xD00000000000003ALL;
  String.append(_:)(v1);
  type metadata accessor for FollowUp();
  unsigned __int8 v2 = static FollowUp.hasEngagedWithCFUGlobalDomain.getter();
  int v3 = v2;
  uint64_t v4 = 1702195828;
  if ((v2 & 1) == 0) {
    uint64_t v4 = 0x65736C6166;
  }
  unint64_t v5 = 0xE400000000000000;
  if ((v2 & 1) == 0) {
    unint64_t v5 = 0xE500000000000000;
  }
  if (v2 == 2) {
    uint64_t v6 = 0x756C6176206F6E3CLL;
  }
  else {
    uint64_t v6 = v4;
  }
  if (v3 == 2) {
    unint64_t v7 = 0xEA00000000003E65;
  }
  else {
    unint64_t v7 = v5;
  }
  unint64_t v8 = v7;
  String.append(_:)(*(Swift::String *)&v6);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0xE000000000000000;
  print(_:separator:terminator:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10001E46C()
{
  sub_100004ACC(&qword_100028078);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10001F850;
  _StringGuts.grow(_:)(33);
  swift_bridgeObjectRelease();
  type metadata accessor for FollowUp();
  char v1 = static FollowUp.hasEngagedWithCFU.getter();
  BOOL v2 = (v1 & 1) == 0;
  if (v1) {
    uint64_t v3 = 1702195828;
  }
  else {
    uint64_t v3 = 0x65736C6166;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  unint64_t v5 = v4;
  String.append(_:)(*(Swift::String *)&v3);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 32) = 0xD00000000000001FLL;
  *(void *)(v0 + 40) = 0x8000000100021D40;
  print(_:separator:terminator:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10001E584(uint64_t a1)
{
  v1[2] = a1;
  sub_100004ACC(&qword_100028818);
  v1[3] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for ReleaseReason();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return _swift_task_switch(sub_10001E674, 0, 0);
}

uint64_t sub_10001E674()
{
  v0[7] = sub_100004ACC(&qword_100028078);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10001F850;
  *(void *)(v1 + 56) = &type metadata for String;
  *(void *)(v1 + 32) = 0xD000000000000023;
  *(void *)(v1 + 40) = 0x8000000100021CB0;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[8] = v2;
  void *v2 = v0;
  v2[1] = sub_10001E77C;
  uint64_t v3 = v0[3];
  return AvailabilityModel.shouldReleaseModels()(v3);
}

uint64_t sub_10001E77C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001E878, 0, 0);
}

uint64_t sub_10001E878()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[3];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_10001EA80(v3);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_10001F850;
    *(void *)(v4 + 56) = &type metadata for String;
    *(void *)(v4 + 32) = 0xD000000000000023;
    *(void *)(v4 + 40) = 0x8000000100021CE0;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = v0[6];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v5, v3, v1);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_10001F850;
    _StringGuts.grow(_:)(44);
    swift_bridgeObjectRelease();
    v7._countAndFlagsBits = ReleaseReason.rawValue.getter();
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    *(void *)(v6 + 56) = &type metadata for String;
    *(void *)(v6 + 32) = 0xD00000000000002ALL;
    *(void *)(v6 + 40) = 0x8000000100021D10;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10001EA80(uint64_t a1)
{
  uint64_t v2 = sub_100004ACC(&qword_100028818);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t dispatch thunk of JSONEncoder.outputFormatting.setter()
{
  return dispatch thunk of JSONEncoder.outputFormatting.setter();
}

uint64_t type metadata accessor for JSONEncoder.DateEncodingStrategy()
{
  return type metadata accessor for JSONEncoder.DateEncodingStrategy();
}

uint64_t dispatch thunk of JSONEncoder.dateEncodingStrategy.setter()
{
  return dispatch thunk of JSONEncoder.dateEncodingStrategy.setter();
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

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t ArgumentHelp.init(stringLiteral:)()
{
  return ArgumentHelp.init(stringLiteral:)();
}

uint64_t type metadata accessor for ArgumentHelp()
{
  return type metadata accessor for ArgumentHelp();
}

uint64_t type metadata accessor for CompletionKind()
{
  return type metadata accessor for CompletionKind();
}

uint64_t static ParsableCommand._commandName.getter()
{
  return static ParsableCommand._commandName.getter();
}

uint64_t static ParsableCommand.main()()
{
  return static ParsableCommand.main()();
}

uint64_t static NameSpecification.long.getter()
{
  return static NameSpecification.long.getter();
}

uint64_t type metadata accessor for NameSpecification()
{
  return type metadata accessor for NameSpecification();
}

uint64_t static ParsableArguments._errorLabel.getter()
{
  return static ParsableArguments._errorLabel.getter();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ParsableArguments.validate()()
{
}

uint64_t CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)()
{
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t type metadata accessor for CommandConfiguration()
{
  return type metadata accessor for CommandConfiguration();
}

uint64_t static SingleValueParsingStrategy.next.getter()
{
  return static SingleValueParsingStrategy.next.getter();
}

uint64_t type metadata accessor for SingleValueParsingStrategy()
{
  return type metadata accessor for SingleValueParsingStrategy();
}

uint64_t Flag.wrappedValue.getter()
{
  return Flag.wrappedValue.getter();
}

uint64_t Flag<A>.init(wrappedValue:name:help:)()
{
  return Flag<A>.init(wrappedValue:name:help:)();
}

uint64_t Option.wrappedValue.getter()
{
  return Option.wrappedValue.getter();
}

uint64_t Option<A>.init(wrappedValue:name:parsing:help:completion:)()
{
  return Option<A>.init(wrappedValue:name:parsing:help:completion:)();
}

uint64_t CloudFeature.canUse.getter()
{
  return CloudFeature.canUse.getter();
}

uint64_t CloudFeature.featureID.getter()
{
  return CloudFeature.featureID.getter();
}

uint64_t type metadata accessor for CloudFeature()
{
  return type metadata accessor for CloudFeature();
}

uint64_t Eligibility.deviceEligibile.getter()
{
  return Eligibility.deviceEligibile.getter();
}

uint64_t TicketCache.allTickets(forDSID:)()
{
  return TicketCache.allTickets(forDSID:)();
}

uint64_t static TicketCache.shared.getter()
{
  return static TicketCache.shared.getter();
}

uint64_t type metadata accessor for TicketCache()
{
  return type metadata accessor for TicketCache();
}

uint64_t FeatureCache.allFeatures(forDSID:ignoreTTL:)()
{
  return FeatureCache.allFeatures(forDSID:ignoreTTL:)();
}

uint64_t FeatureCache.cachedFeature(identifier:altDSID:allowAnySession:ignoreTTL:)()
{
  return FeatureCache.cachedFeature(identifier:altDSID:allowAnySession:ignoreTTL:)();
}

uint64_t FeatureCache.persistentDomain.getter()
{
  return FeatureCache.persistentDomain.getter();
}

uint64_t static FeatureCache.shared.getter()
{
  return static FeatureCache.shared.getter();
}

uint64_t type metadata accessor for FeatureCache()
{
  return type metadata accessor for FeatureCache();
}

uint64_t type metadata accessor for TicketStatus()
{
  return type metadata accessor for TicketStatus();
}

uint64_t ReleaseReason.rawValue.getter()
{
  return ReleaseReason.rawValue.getter();
}

uint64_t type metadata accessor for ReleaseReason()
{
  return type metadata accessor for ReleaseReason();
}

uint64_t static GMAssetsBypass.setGMEligibilityBypass(_:)()
{
  return static GMAssetsBypass.setGMEligibilityBypass(_:)();
}

uint64_t static GMAssetsBypass.gmAssetsBypass()()
{
  return static GMAssetsBypass.gmAssetsBypass()();
}

uint64_t type metadata accessor for GMAssetsBypass()
{
  return type metadata accessor for GMAssetsBypass();
}

uint64_t type metadata accessor for AssetDiagnostics()
{
  return type metadata accessor for AssetDiagnostics();
}

uint64_t static DefaultsMigrator.diagnostics()()
{
  return static DefaultsMigrator.diagnostics()();
}

uint64_t type metadata accessor for DefaultsMigrator()
{
  return type metadata accessor for DefaultsMigrator();
}

uint64_t dispatch thunk of SystemProperties.isRetailDevice.getter()
{
  return dispatch thunk of SystemProperties.isRetailDevice.getter();
}

uint64_t static SystemProperties.shared.getter()
{
  return static SystemProperties.shared.getter();
}

uint64_t type metadata accessor for SystemProperties()
{
  return type metadata accessor for SystemProperties();
}

uint64_t AvailabilityModel.status.getter()
{
  return AvailabilityModel.status.getter();
}

uint64_t type metadata accessor for AvailabilityModel()
{
  return type metadata accessor for AvailabilityModel();
}

uint64_t type metadata accessor for AvailabilityStatus()
{
  return type metadata accessor for AvailabilityStatus();
}

uint64_t static EligibilityFetcher.current.getter()
{
  return static EligibilityFetcher.current.getter();
}

uint64_t type metadata accessor for EligibilityFetcher()
{
  return type metadata accessor for EligibilityFetcher();
}

uint64_t dispatch thunk of AvailabilityManager.cached()()
{
  return dispatch thunk of AvailabilityManager.cached()();
}

uint64_t static AvailabilityManager.shared.getter()
{
  return static AvailabilityManager.shared.getter();
}

uint64_t type metadata accessor for AvailabilityManager()
{
  return type metadata accessor for AvailabilityManager();
}

uint64_t SiriAssistantLocale.current.getter()
{
  return SiriAssistantLocale.current.getter();
}

uint64_t SiriAssistantLocale.init()()
{
  return SiriAssistantLocale.init()();
}

uint64_t type metadata accessor for SiriAssistantLocale()
{
  return type metadata accessor for SiriAssistantLocale();
}

uint64_t type metadata accessor for FrameworkDiagnostics.DiagnosticKey()
{
  return type metadata accessor for FrameworkDiagnostics.DiagnosticKey();
}

uint64_t static FrameworkDiagnostics.fetchDiagnostic<A>(forKey:)()
{
  return static FrameworkDiagnostics.fetchDiagnostic<A>(forKey:)();
}

uint64_t type metadata accessor for FeatureRequestDiagnostic()
{
  return type metadata accessor for FeatureRequestDiagnostic();
}

uint64_t static Assets.shared.getter()
{
  return static Assets.shared.getter();
}

uint64_t type metadata accessor for Assets()
{
  return type metadata accessor for Assets();
}

uint64_t Ticket.status.getter()
{
  return Ticket.status.getter();
}

uint64_t dispatch thunk of GMOptIn.isOptedIn.getter()
{
  return dispatch thunk of GMOptIn.isOptedIn.getter();
}

uint64_t dispatch thunk of GMOptIn.isOptedInGlobalDomain.getter()
{
  return dispatch thunk of GMOptIn.isOptedInGlobalDomain.getter();
}

uint64_t static GMOptIn.shared.getter()
{
  return static GMOptIn.shared.getter();
}

uint64_t type metadata accessor for GMOptIn()
{
  return type metadata accessor for GMOptIn();
}

uint64_t dispatch thunk of FollowUp.dateSentCFU.getter()
{
  return dispatch thunk of FollowUp.dateSentCFU.getter();
}

uint64_t dispatch thunk of FollowUp.hasSentADMCFU.getter()
{
  return dispatch thunk of FollowUp.hasSentADMCFU.getter();
}

uint64_t dispatch thunk of FollowUp.dateSentADMCFU.getter()
{
  return dispatch thunk of FollowUp.dateSentADMCFU.getter();
}

uint64_t static FollowUp.hasEngagedWithCFU.getter()
{
  return static FollowUp.hasEngagedWithCFU.getter();
}

uint64_t FollowUp.IneligibilityReason.rawValue.getter()
{
  return FollowUp.IneligibilityReason.rawValue.getter();
}

uint64_t type metadata accessor for FollowUp.IneligibilityReason()
{
  return type metadata accessor for FollowUp.IneligibilityReason();
}

uint64_t static FollowUp.hasEngagedWithCFUGlobalDomain.getter()
{
  return static FollowUp.hasEngagedWithCFUGlobalDomain.getter();
}

uint64_t FollowUp.__allocating_init()()
{
  return FollowUp.__allocating_init()();
}

uint64_t type metadata accessor for FollowUp()
{
  return type metadata accessor for FollowUp();
}

uint64_t static GMBypass.admBypassState()()
{
  return static GMBypass.admBypassState()();
}

uint64_t static GMBypass.gmEligibilityBypass()()
{
  return static GMBypass.gmEligibilityBypass()();
}

uint64_t type metadata accessor for GMBypass()
{
  return type metadata accessor for GMBypass();
}

uint64_t Dictionary.Keys.description.getter()
{
  return Dictionary.Keys.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
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

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
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

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static CSFFeatureManager.requestFeature(id:completion:)()
{
  return static CSFFeatureManager.requestFeature(id:completion:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
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

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
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

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
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

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return _geteuid();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

int setuid(uid_t a1)
{
  return _setuid(a1);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}