void sub_100005260(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  id v11;
  uint64_t v12;
  uint64_t OpaqueTypeConformance2;
  uint64_t v14;
  char *v15;
  NSString *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  sub_10001F300();
  __chkstk_darwin();
  v2 = sub_10000590C(&qword_10002C290);
  v26 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_10000590C(&qword_10002C298);
  v27 = *(void *)(v29 - 8);
  __chkstk_darwin();
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000590C(&qword_10002C2A0);
  v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  v28 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = qword_10002C200;
  swift_bridgeObjectRetain();
  v10 = (NSString *)sub_10001F4C0();
  v11 = (id)PKLocalizedString(v10);

  v23 = v7;
  v24 = a1;
  v22 = v8;
  if (v11)
  {
    sub_10001F4F0();
  }
  sub_10001F2F0();
  sub_10000590C(&qword_10002C2A8);
  sub_100005F0C();
  sub_100005F60(&qword_10002C2B8, &qword_10002C2A8);
  sub_10001F310();
  v12 = sub_100005F60(&qword_10002C2C0, &qword_10002C290);
  sub_10001EF30();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v2);
  v32 = v2;
  v33 = v12;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v15 = v28;
  v14 = v29;
  sub_10001EF40();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v14);
  v16 = (NSString *)sub_10001F4C0();
  v17 = (id)PKLocalizedString(v16);

  if (v17)
  {
    v18 = sub_10001F4F0();
    v20 = v19;

    v32 = v18;
    v33 = v20;
    v30 = v14;
    v31 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    sub_100005FA4();
    v21 = v23;
    sub_10001EF10();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v21);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000056E8()
{
  return Label.init(title:icon:)(sub_10000573C, 0, sub_1000057E0, 0, &type metadata for Text, &type metadata for Image, &protocol witness table for Text, &protocol witness table for Image);
}

void sub_10000573C(uint64_t a1@<X8>)
{
  v2 = (NSString *)sub_10001F4C0();
  id v3 = (id)PKLocalizedString(v2);

  if (v3)
  {
    sub_10001F4F0();

    sub_100005FA4();
    *(void *)a1 = sub_10001F120();
    *(void *)(a1 + 8) = v4;
    *(unsigned char *)(a1 + 16) = v5 & 1;
    *(void *)(a1 + 24) = v6;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000057E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001F250();
  *a1 = result;
  return result;
}

uint64_t sub_10000582C(long long *a1)
{
  long long v2 = *a1;
  if (sub_10001E484(2, 17, 0, 0)) {
    return swift_getOpaqueTypeMetadata2();
  }
  else {
    return v2;
  }
}

uint64_t sub_1000058A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (sub_10001E484(2, 17, 0, 0)) {
    return swift_getOpaqueTypeConformance2();
  }
  return v1;
}

uint64_t sub_10000590C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005950(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005998(uint64_t a1, uint64_t a2)
{
  return sub_100005B04(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000059B0(uint64_t a1, id *a2)
{
  uint64_t result = sub_10001F4D0();
  *a2 = 0;
  return result;
}

uint64_t sub_100005A28(uint64_t a1, id *a2)
{
  char v3 = sub_10001F4E0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100005AA8@<X0>(void *a1@<X8>)
{
  sub_10001F4F0();
  NSString v2 = sub_10001F4C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100005AEC(uint64_t a1, uint64_t a2)
{
  return sub_100005B04(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005B04(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_10001F4F0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100005B48()
{
  sub_10001F4F0();
  sub_10001F510();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100005B9C()
{
  sub_10001F4F0();
  sub_10001F5E0();
  sub_10001F510();
  Swift::Int v0 = sub_10001F600();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100005C10()
{
  uint64_t v0 = sub_10001F4F0();
  uint64_t v2 = v1;
  if (v0 == sub_10001F4F0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_10001F5D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100005C9C@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_10001F4C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100005CE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001F4F0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for PKAnalyticsKey()
{
  if (!qword_10002C260)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10002C260);
    }
  }
}

ValueMetadata *type metadata accessor for LaunchWalletControl()
{
  return &type metadata for LaunchWalletControl;
}

uint64_t sub_100005D78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005D94(uint64_t a1)
{
  uint64_t v2 = sub_100005EC8(&qword_10002C280);
  uint64_t v3 = sub_100005EC8(&qword_10002C288);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005E2C()
{
  return sub_100005EC8(&qword_10002C268);
}

uint64_t sub_100005E60()
{
  return sub_100005EC8(&qword_10002C270);
}

uint64_t sub_100005E94()
{
  return sub_100005EC8(&qword_10002C278);
}

uint64_t sub_100005EC8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PKAnalyticsKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100005F0C()
{
  unint64_t result = qword_10002C2B0;
  if (!qword_10002C2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C2B0);
  }
  return result;
}

uint64_t sub_100005F60(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005950(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100005FA4()
{
  unint64_t result = qword_10002C2C8;
  if (!qword_10002C2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C2C8);
  }
  return result;
}

uint64_t sub_100005FF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_1000060FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10001ECC0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_1000061C8(uint64_t a1)
{
  uint64_t v2 = sub_10001ECC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_release();
}

uint64_t sub_10000623C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001ECC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_1000062BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001ECC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100006348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001ECC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1000063C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001ECC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_100006448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000645C);
}

uint64_t sub_10000645C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001ECC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10000651C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006530);
}

uint64_t sub_100006530(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10001ECC0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for LiveActivityView()
{
  uint64_t result = qword_10002C328;
  if (!qword_10002C328) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100006638()
{
  uint64_t result = sub_10001ECC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000066D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000066EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10001ECC0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000590C(&qword_10002C360);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000590C(&qword_10002C368);
  __chkstk_darwin(v11);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = *(void *)(sub_10001EC00() + 16);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  if (v14 > 2)
  {
    char v16 = sub_10001EC90();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (v16) {
      uint64_t v15 = 0x402C000000000000;
    }
    else {
      uint64_t v15 = 0x4020000000000000;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v15 = 0x402C000000000000;
  }
  *(void *)unint64_t v10 = sub_10001EEC0();
  *((void *)v10 + 1) = v15;
  v10[16] = 0;
  uint64_t v17 = sub_10000590C(&qword_10002C370);
  sub_100006974(v2, (uint64_t)&v10[*(int *)(v17 + 44)]);
  char v18 = sub_10001EFB0();
  sub_10001ED10();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  sub_10000B308((uint64_t)v10, (uint64_t)v13, &qword_10002C360);
  v27 = &v13[*(int *)(v11 + 36)];
  char *v27 = v18;
  *((void *)v27 + 1) = v20;
  *((void *)v27 + 2) = v22;
  *((void *)v27 + 3) = v24;
  *((void *)v27 + 4) = v26;
  v27[40] = 0;
  sub_10000B36C((uint64_t)v10, &qword_10002C360);
  return sub_10000B2A4((uint64_t)v13, a1, &qword_10002C368);
}

uint64_t sub_100006974@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000590C(&qword_10002C378);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  unint64_t v10 = (char *)&v20 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v20 - v11;
  *(void *)unint64_t v10 = sub_10001EEA0();
  *((void *)v10 + 1) = 0x4028000000000000;
  v10[16] = 0;
  uint64_t v13 = sub_10000590C(&qword_10002C380);
  sub_100006AE4(a1, (uint64_t)&v10[*(int *)(v13 + 44)]);
  sub_10000B2A4((uint64_t)v10, (uint64_t)v12, &qword_10002C378);
  uint64_t v14 = sub_10001EBF0();
  uint64_t v16 = v15;
  if (v15) {
    uint64_t v17 = v14;
  }
  else {
    uint64_t v17 = 0;
  }
  sub_10000B308((uint64_t)v12, (uint64_t)v7, &qword_10002C378);
  sub_10000B308((uint64_t)v7, a2, &qword_10002C378);
  char v18 = (uint64_t *)(a2 + *(int *)(sub_10000590C(&qword_10002C388) + 48));
  *char v18 = v17;
  v18[1] = v16;
  swift_bridgeObjectRetain();
  sub_10000B36C((uint64_t)v12, &qword_10002C378);
  swift_bridgeObjectRelease();
  return sub_10000B36C((uint64_t)v7, &qword_10002C378);
}

uint64_t sub_100006AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000590C(&qword_10002C390);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v103 = (uint64_t)&v82 - v8;
  uint64_t v9 = sub_10000590C(&qword_10002C398);
  __chkstk_darwin(v9);
  uint64_t v101 = (uint64_t)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_10001EEB0();
  uint64_t v11 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  v98 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_10001ED70();
  __chkstk_darwin(v96);
  v99 = (char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_10000590C(&qword_10002C3A0);
  uint64_t v14 = __chkstk_darwin(v97);
  uint64_t v87 = (uint64_t)&v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  char v18 = (_OWORD *)((char *)&v82 - v17);
  __chkstk_darwin(v16);
  uint64_t v102 = (uint64_t)&v82 - v19;
  uint64_t v20 = type metadata accessor for LiveActivityView();
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v100 = (uint64_t)&v82 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v82 - v23;
  uint64_t v104 = sub_10001EC80();
  uint64_t v26 = v25;
  unint64_t v27 = *(void *)(sub_10001EC00() + 16);
  swift_bridgeObjectRelease();
  sub_10000ABD8(a1, (uint64_t)v24, (uint64_t (*)(void))type metadata accessor for LiveActivityView);
  uint64_t v86 = v9;
  if (v27 < 3)
  {
    sub_10000AC88((uint64_t)v24, (uint64_t (*)(void))type metadata accessor for LiveActivityView);
  }
  else
  {
    char v28 = sub_10001EC90();
    sub_10000AC88((uint64_t)v24, (uint64_t (*)(void))type metadata accessor for LiveActivityView);
    if ((v28 & 1) == 0)
    {
      PKFloatCeilToPixel();
      PKFloatCeilToPixel();
      goto LABEL_6;
    }
  }
  PKFloatCeilToPixel();
  PKFloatFloorToPixel();
LABEL_6:
  uint64_t v29 = *(void *)(a1 + *(int *)(v20 + 20));
  swift_retain();
  swift_bridgeObjectRetain();
  v95 = sub_10001B2A4(v104, v26);
  swift_bridgeObjectRelease();
  sub_10001F2C0();
  sub_10001ED50();
  uint64_t v90 = v118;
  int v84 = v119;
  uint64_t v91 = v120;
  int v83 = v121;
  uint64_t v93 = v122;
  uint64_t v92 = v123;
  unsigned __int8 v30 = sub_10001EFC0();
  char v31 = sub_10001EFD0();
  char v32 = sub_10001EFF0();
  sub_10001EFF0();
  if (sub_10001EFF0() != v30) {
    char v32 = sub_10001EFF0();
  }
  sub_10001EFF0();
  char v33 = sub_10001EFF0();
  v89 = v7;
  uint64_t v88 = a2;
  if (v33 != v31) {
    char v32 = sub_10001EFF0();
  }
  sub_10001ED10();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  unsigned __int8 v42 = sub_10001EFE0();
  char v43 = sub_10001F000();
  char v44 = sub_10001EFF0();
  sub_10001EFF0();
  if (sub_10001EFF0() != v42) {
    char v44 = sub_10001EFF0();
  }
  sub_10001EFF0();
  char v45 = sub_10001EFF0();
  uint64_t v94 = a1;
  if (v45 != v43) {
    char v44 = sub_10001EFF0();
  }
  uint64_t v46 = v86;
  uint64_t v47 = v85;
  char v107 = v84;
  char v106 = v83;
  char v105 = 0;
  sub_10001ED10();
  *(void *)&long long v108 = v104;
  *((void *)&v108 + 1) = v26;
  v48 = v95;
  *(void *)&long long v109 = v95;
  *((void *)&v109 + 1) = v29;
  *(void *)&long long v110 = v90;
  BYTE8(v110) = v107;
  *(void *)&long long v111 = v91;
  BYTE8(v111) = v106;
  *(void *)&long long v112 = v93;
  *((void *)&v112 + 1) = v92;
  LOBYTE(v113) = v32;
  *((void *)&v113 + 1) = v35;
  *(void *)&long long v114 = v37;
  *((void *)&v114 + 1) = v39;
  *(void *)&long long v115 = v41;
  BYTE8(v115) = v105;
  LOBYTE(v116) = v44;
  *((void *)&v116 + 1) = v49;
  *(void *)v117 = v50;
  *(void *)&v117[8] = v51;
  *(void *)&v117[16] = v52;
  v117[24] = 0;
  v53 = v98;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v98, enum case for RoundedCornerStyle.continuous(_:), v47);
  v54 = v99;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v99[*(int *)(v96 + 20)], v53, v47);
  __asm { FMOV            V0.2D, #4.0 }
  _OWORD *v54 = _Q0;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v53, v47);
  uint64_t v60 = v101;
  sub_10000ABD8((uint64_t)v54, v101, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v60 + *(int *)(v46 + 36)) = 256;
  sub_10000B308(v60, (uint64_t)v18 + *(int *)(v97 + 36), &qword_10002C398);
  long long v61 = v115;
  long long v62 = *(_OWORD *)v117;
  v18[8] = v116;
  v18[9] = v62;
  *(_OWORD *)((char *)v18 + 153) = *(_OWORD *)&v117[9];
  long long v63 = v113;
  v18[4] = v112;
  v18[5] = v63;
  v18[6] = v114;
  v18[7] = v61;
  long long v64 = v109;
  *char v18 = v108;
  v18[1] = v64;
  long long v65 = v111;
  v18[2] = v110;
  v18[3] = v65;
  sub_10000AC40((uint64_t)&v108);
  sub_10000B36C(v60, &qword_10002C398);
  sub_10000AC88((uint64_t)v54, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  swift_release();
  swift_bridgeObjectRelease();

  uint64_t v66 = (uint64_t)v18;
  uint64_t v67 = v102;
  sub_10000B2A4(v66, v102, &qword_10002C3A0);
  uint64_t v68 = v103;
  uint64_t v69 = v94;
  sub_100007480(v103);
  uint64_t v70 = *(void *)(sub_10001EC00() + 16);
  swift_bridgeObjectRelease();
  uint64_t v71 = v69;
  uint64_t v72 = v100;
  sub_10000ABD8(v71, v100, (uint64_t (*)(void))type metadata accessor for LiveActivityView);
  if (v70)
  {
    char v73 = sub_10001EC90();
    sub_10000AC88(v72, (uint64_t (*)(void))type metadata accessor for LiveActivityView);
    char v74 = v73 & 1;
    char v75 = v73 ^ 1;
  }
  else
  {
    sub_10000AC88(v72, (uint64_t (*)(void))type metadata accessor for LiveActivityView);
    char v75 = 0;
    char v74 = 1;
  }
  uint64_t v76 = (uint64_t)v89;
  uint64_t v77 = v88;
  uint64_t v78 = v87;
  sub_10000B308(v67, v87, &qword_10002C3A0);
  sub_10000B308(v68, v76, &qword_10002C390);
  sub_10000B308(v78, v77, &qword_10002C3A0);
  uint64_t v79 = sub_10000590C(&qword_10002C3A8);
  sub_10000B308(v76, v77 + *(int *)(v79 + 48), &qword_10002C390);
  uint64_t v80 = v77 + *(int *)(v79 + 64);
  *(void *)uint64_t v80 = 0;
  *(unsigned char *)(v80 + 8) = v74;
  *(unsigned char *)(v80 + 9) = v75 & 1;
  sub_10000B36C(v68, &qword_10002C390);
  sub_10000B36C(v67, &qword_10002C3A0);
  sub_10000B36C(v76, &qword_10002C390);
  return sub_10000B36C(v78, &qword_10002C3A0);
}

uint64_t sub_100007480@<X0>(uint64_t a1@<X8>)
{
  uint64_t v87 = a1;
  uint64_t v2 = sub_10001F110();
  uint64_t v74 = *(void *)(v2 - 8);
  uint64_t v75 = v2;
  __chkstk_darwin(v2);
  char v73 = (char *)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000590C(&qword_10002C3B0);
  __chkstk_darwin(v4 - 8);
  uint64_t v70 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_10000590C(&qword_10002C3B8);
  __chkstk_darwin(v67);
  uint64_t v72 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_10000590C(&qword_10002C3C0);
  __chkstk_darwin(v68);
  uint64_t v71 = (uint64_t)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_10000590C(&qword_10002C3C8);
  uint64_t v8 = __chkstk_darwin(v69);
  uint64_t v77 = (uint64_t)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v76 = (uint64_t)&v66 - v10;
  uint64_t v82 = sub_10000590C(&qword_10002C3D0);
  __chkstk_darwin(v82);
  uint64_t v78 = (uint64_t *)((char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v79 = sub_10000590C(&qword_10002C3D8);
  __chkstk_darwin(v79);
  uint64_t v81 = (uint64_t)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_10000590C(&qword_10002C3E0);
  __chkstk_darwin(v86);
  int v83 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_10000590C(&qword_10002C3E8);
  __chkstk_darwin(v80);
  uint64_t v15 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_10000590C(&qword_10002C3F0);
  __chkstk_darwin(v84);
  uint64_t v17 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_10000590C(&qword_10002C3F8);
  __chkstk_darwin(v85);
  uint64_t v19 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10000590C(&qword_10002C400);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_10000590C(&qword_10002C408);
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v66 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_10000590C(&qword_10002C410);
  __chkstk_darwin(v26);
  char v28 = (char *)&v66 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_10001EC90())
  {
    *(void *)char v28 = sub_10001EED0();
    *((void *)v28 + 1) = 0;
    v28[16] = 0;
    uint64_t v29 = sub_10000590C(&qword_10002C478);
    sub_1000080C0(v1, (uint64_t)&v28[*(int *)(v29 + 44)]);
    sub_10000B308((uint64_t)v28, (uint64_t)v22, &qword_10002C410);
    swift_storeEnumTagMultiPayload();
    sub_100005F60(&qword_10002C450, &qword_10002C410);
    sub_100005F60(&qword_10002C458, &qword_10002C3F0);
    sub_10001EF80();
    sub_10000B308((uint64_t)v25, (uint64_t)v19, &qword_10002C408);
    swift_storeEnumTagMultiPayload();
    sub_10000ACF8();
    sub_10000ADB8();
    sub_10001EF80();
    sub_10000B36C((uint64_t)v25, &qword_10002C408);
    uint64_t v30 = (uint64_t)v28;
    char v31 = &qword_10002C410;
  }
  else
  {
    uint64_t v66 = v23;
    uint64_t v32 = *(void *)(sub_10001EC00() + 16);
    swift_bridgeObjectRelease();
    if (v32)
    {
      unint64_t v33 = *(void *)(sub_10001EC00() + 16);
      swift_bridgeObjectRelease();
      uint64_t v34 = (uint64_t)v19;
      if (v33 > 2)
      {
        uint64_t v39 = sub_10001EED0();
        uint64_t v40 = (uint64_t)v78;
        *uint64_t v78 = v39;
        *(void *)(v40 + 8) = 0x4018000000000000;
        *(unsigned char *)(v40 + 16) = 0;
        uint64_t v84 = v40 + *(int *)(sub_10000590C(&qword_10002C418) + 44);
        char v41 = sub_10001EFA0();
        uint64_t v42 = (uint64_t)v70;
        *uint64_t v70 = v41;
        uint64_t v43 = sub_10000590C(&qword_10002C420);
        sub_100009AAC((uint64_t)v1, 2, v42 + *(int *)(v43 + 44));
        uint64_t v45 = v74;
        uint64_t v44 = v75;
        uint64_t v46 = v73;
        (*(void (**)(char *, void, uint64_t))(v74 + 104))(v73, enum case for Text.TruncationMode.tail(_:), v75);
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v48 = (uint64_t)v72;
        uint64_t v49 = (uint64_t *)&v72[*(int *)(v67 + 36)];
        uint64_t v50 = sub_10000590C(&qword_10002C428);
        (*(void (**)(char *, char *, uint64_t))(v45 + 16))((char *)v49 + *(int *)(v50 + 28), v46, v44);
        *uint64_t v49 = KeyPath;
        sub_10000B308(v42, v48, &qword_10002C3B0);
        (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v44);
        sub_10000B36C(v42, &qword_10002C3B0);
        uint64_t v51 = swift_getKeyPath();
        uint64_t v52 = v71;
        sub_10000B308(v48, v71, &qword_10002C3B8);
        uint64_t v53 = v52 + *(int *)(v68 + 36);
        *(void *)uint64_t v53 = v51;
        *(unsigned char *)(v53 + 8) = 0;
        sub_10000B36C(v48, &qword_10002C3B8);
        uint64_t v54 = sub_10001F200();
        uint64_t v55 = v77;
        sub_10000B308(v52, v77, &qword_10002C3C0);
        *(void *)(v55 + *(int *)(v69 + 36)) = v54;
        sub_10000B36C(v52, &qword_10002C3C0);
        uint64_t v56 = v76;
        sub_10000B2A4(v55, v76, &qword_10002C3C8);
        uint64_t v57 = sub_10001EC00();
        sub_100017C4C(v57, 3, 0x403A000000000000, 0, (uint64_t)v88, 0.0);
        swift_bridgeObjectRelease();
        sub_10000B308(v56, v55, &qword_10002C3C8);
        uint64_t v58 = v88[0];
        uint64_t v59 = v88[1];
        uint64_t v60 = v88[2];
        LOBYTE(v45) = v89;
        uint64_t v61 = v90;
        uint64_t v62 = v84;
        sub_10000B308(v55, v84, &qword_10002C3C8);
        uint64_t v63 = v62 + *(int *)(sub_10000590C(&qword_10002C430) + 48);
        *(void *)uint64_t v63 = v58;
        *(void *)(v63 + 8) = v59;
        *(void *)(v63 + 16) = v60;
        *(unsigned char *)(v63 + 24) = v45 & 1;
        *(void *)(v63 + 32) = v61;
        swift_bridgeObjectRetain();
        sub_10000B36C(v56, &qword_10002C3C8);
        swift_bridgeObjectRelease();
        sub_10000B36C(v55, &qword_10002C3C8);
        uint64_t v36 = &qword_10002C3D0;
        sub_10000B308(v40, v81, &qword_10002C3D0);
        swift_storeEnumTagMultiPayload();
        sub_100005F60(&qword_10002C438, &qword_10002C3E8);
        sub_100005F60(&qword_10002C440, &qword_10002C3D0);
        uint64_t v64 = (uint64_t)v83;
        sub_10001EF80();
        sub_10000B308(v64, v34, &qword_10002C3E0);
        swift_storeEnumTagMultiPayload();
        sub_10000ACF8();
        sub_10000ADB8();
        sub_10001EF80();
        sub_10000B36C(v64, &qword_10002C3E0);
        uint64_t v30 = v40;
      }
      else
      {
        *(void *)uint64_t v15 = sub_10001EEA0();
        *((void *)v15 + 1) = 0;
        v15[16] = 0;
        uint64_t v35 = sub_10000590C(&qword_10002C468);
        sub_100009654((uint64_t)v1, (uint64_t)&v15[*(int *)(v35 + 44)]);
        uint64_t v36 = &qword_10002C3E8;
        sub_10000B308((uint64_t)v15, v81, &qword_10002C3E8);
        swift_storeEnumTagMultiPayload();
        sub_100005F60(&qword_10002C438, &qword_10002C3E8);
        sub_100005F60(&qword_10002C440, &qword_10002C3D0);
        uint64_t v37 = (uint64_t)v83;
        sub_10001EF80();
        sub_10000B308(v37, (uint64_t)v19, &qword_10002C3E0);
        swift_storeEnumTagMultiPayload();
        sub_10000ACF8();
        sub_10000ADB8();
        sub_10001EF80();
        sub_10000B36C(v37, &qword_10002C3E0);
        uint64_t v30 = (uint64_t)v15;
      }
      char v31 = v36;
    }
    else
    {
      *(void *)uint64_t v17 = sub_10001EED0();
      *((void *)v17 + 1) = 0;
      v17[16] = 0;
      uint64_t v38 = sub_10000590C(&qword_10002C470);
      sub_10000890C((uint64_t)&v17[*(int *)(v38 + 44)]);
      sub_10000B308((uint64_t)v17, (uint64_t)v22, &qword_10002C3F0);
      swift_storeEnumTagMultiPayload();
      sub_100005F60(&qword_10002C450, &qword_10002C410);
      sub_100005F60(&qword_10002C458, &qword_10002C3F0);
      sub_10001EF80();
      sub_10000B308((uint64_t)v25, (uint64_t)v19, &qword_10002C408);
      swift_storeEnumTagMultiPayload();
      sub_10000ACF8();
      sub_10000ADB8();
      sub_10001EF80();
      sub_10000B36C((uint64_t)v25, &qword_10002C408);
      uint64_t v30 = (uint64_t)v17;
      char v31 = &qword_10002C3F0;
    }
  }
  return sub_10000B36C(v30, v31);
}

void sub_1000080C0(void (*a1)(char *, char *, uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v85 = a2;
  uint64_t v86 = a1;
  uint64_t v2 = sub_10001F0D0();
  uint64_t v92 = *(void *)(v2 - 8);
  uint64_t v93 = v2;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v91 = (char *)v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000590C(&qword_10002C480);
  uint64_t v89 = *(void *)(v4 - 8);
  uint64_t v90 = v4;
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  int v83 = (char *)v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v97 = (char *)v78 - v7;
  uint64_t v96 = sub_10000590C(&qword_10002C488);
  uint64_t v8 = __chkstk_darwin(v96);
  uint64_t v81 = (char *)v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v78 - v10;
  uint64_t v95 = sub_10000590C(&qword_10002C490);
  uint64_t v12 = __chkstk_darwin(v95);
  uint64_t v84 = (uint64_t)v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v79 = (uint64_t)v78 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v82 = (uint64_t)v78 - v17;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v78 - v18;
  uint64_t v88 = sub_10000590C(&qword_10002C498);
  uint64_t v20 = __chkstk_darwin(v88);
  uint64_t v80 = (uint64_t)v78 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v87 = (uint64_t)v78 - v23;
  __chkstk_darwin(v22);
  uint64_t v94 = (uint64_t)v78 - v24;
  uint64_t v98 = sub_10001ECB0();
  uint64_t v99 = v25;
  v78[2] = sub_100005FA4();
  uint64_t v26 = sub_10001F120();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  char v32 = v31 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v98 = v26;
  uint64_t v99 = v28;
  char v100 = v32;
  uint64_t v101 = v30;
  uint64_t v102 = KeyPath;
  uint64_t v103 = 1;
  char v104 = 0;
  sub_10001F060();
  uint64_t v34 = sub_10000590C(&qword_10002C4A0);
  unint64_t v35 = sub_10000AE84();
  v78[1] = v34;
  v78[0] = v35;
  sub_10001F180();
  sub_10000AF24(v26, v28, v32);
  swift_release();
  swift_bridgeObjectRelease();
  if (sub_10001EC60())
  {
    uint64_t v36 = sub_10001F0B0();
  }
  else
  {
    sub_10001F0C0();
    uint64_t v38 = v91;
    uint64_t v37 = v92;
    uint64_t v39 = v93;
    (*(void (**)(char *, void, uint64_t))(v92 + 104))(v91, enum case for Font.Leading.tight(_:), v93);
    uint64_t v36 = sub_10001F0E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v39);
  }
  uint64_t v40 = swift_getKeyPath();
  uint64_t v41 = v89;
  uint64_t v42 = v90;
  uint64_t v43 = v97;
  uint64_t v86 = *(void (**)(char *, char *, uint64_t))(v89 + 16);
  v86(v11, v97, v90);
  uint64_t v44 = (uint64_t *)&v11[*(int *)(v96 + 36)];
  *uint64_t v44 = v40;
  v44[1] = v36;
  uint64_t v97 = *(char **)(v41 + 8);
  ((void (*)(char *, uint64_t))v97)(v43, v42);
  uint64_t v45 = sub_10001F200();
  sub_10000B308((uint64_t)v11, (uint64_t)v19, &qword_10002C488);
  *(void *)&v19[*(int *)(v95 + 36)] = v45;
  sub_10000B36C((uint64_t)v11, &qword_10002C488);
  uint64_t v46 = swift_getKeyPath();
  uint64_t v47 = v87;
  sub_10000B308((uint64_t)v19, v87, &qword_10002C490);
  uint64_t v48 = (uint64_t *)(v47 + *(int *)(v88 + 36));
  uint64_t *v48 = v46;
  v48[1] = 0x3FE999999999999ALL;
  sub_10000B36C((uint64_t)v19, &qword_10002C490);
  sub_10000B2A4(v47, v94, &qword_10002C498);
  uint64_t v49 = (NSString *)sub_10001F4C0();
  id v50 = (id)PKLocalizedTicketingString(v49);

  if (v50)
  {
    uint64_t v51 = sub_10001F4F0();
    uint64_t v53 = v52;

    uint64_t v98 = v51;
    uint64_t v99 = v53;
    uint64_t v54 = sub_10001F120();
    uint64_t v56 = v55;
    uint64_t v58 = v57;
    char v60 = v59 & 1;
    uint64_t v61 = swift_getKeyPath();
    uint64_t v98 = v54;
    uint64_t v99 = v56;
    char v100 = v60;
    uint64_t v101 = v58;
    uint64_t v102 = v61;
    uint64_t v103 = 1;
    char v104 = 0;
    sub_10001F080();
    uint64_t v62 = v83;
    sub_10001F180();
    sub_10000AF24(v54, v56, v60);
    swift_release();
    swift_bridgeObjectRelease();
    sub_10001F030();
    uint64_t v64 = v91;
    uint64_t v63 = v92;
    uint64_t v65 = v93;
    (*(void (**)(char *, void, uint64_t))(v92 + 104))(v91, enum case for Font.Leading.tight(_:), v93);
    uint64_t v66 = sub_10001F0E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v64, v65);
    uint64_t v67 = swift_getKeyPath();
    uint64_t v68 = (uint64_t)v81;
    v86(v81, v62, v42);
    uint64_t v69 = (uint64_t *)(v68 + *(int *)(v96 + 36));
    *uint64_t v69 = v67;
    v69[1] = v66;
    ((void (*)(char *, uint64_t))v97)(v62, v42);
    uint64_t v70 = sub_10001F1E0();
    uint64_t v71 = v79;
    sub_10000B308(v68, v79, &qword_10002C488);
    *(void *)(v71 + *(int *)(v95 + 36)) = v70;
    sub_10000B36C(v68, &qword_10002C488);
    uint64_t v72 = v82;
    sub_10000B2A4(v71, v82, &qword_10002C490);
    uint64_t v73 = v94;
    uint64_t v74 = v80;
    sub_10000B308(v94, v80, &qword_10002C498);
    uint64_t v75 = v84;
    sub_10000B308(v72, v84, &qword_10002C490);
    uint64_t v76 = v85;
    sub_10000B308(v74, v85, &qword_10002C498);
    uint64_t v77 = sub_10000590C(&qword_10002C4C0);
    sub_10000B308(v75, v76 + *(int *)(v77 + 48), &qword_10002C490);
    sub_10000B36C(v72, &qword_10002C490);
    sub_10000B36C(v73, &qword_10002C498);
    sub_10000B36C(v75, &qword_10002C490);
    sub_10000B36C(v74, &qword_10002C498);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000890C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v126 = a1;
  uint64_t v93 = sub_10000590C(&qword_10002C428);
  __chkstk_darwin(v93);
  uint64_t v97 = (void *)((char *)v91 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v96 = sub_10001F110();
  uint64_t v95 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  uint64_t v94 = (char *)v91 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_10000590C(&qword_10002C4C8);
  __chkstk_darwin(v92);
  uint64_t v98 = (char *)v91 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_10000590C(&qword_10002C4D0);
  __chkstk_darwin(v100);
  uint64_t v99 = (uint64_t)v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_10000590C(&qword_10002C4D8);
  uint64_t v107 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  char v105 = (char *)v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_10000590C(&qword_10002C4E0);
  __chkstk_darwin(v101);
  char v104 = (char *)v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = sub_10000590C(&qword_10002C4E8);
  __chkstk_darwin(v103);
  uint64_t v106 = (uint64_t)v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = sub_10000590C(&qword_10002C4F0);
  uint64_t v119 = *(void *)(v121 - 8);
  __chkstk_darwin(v121);
  uint64_t v102 = (uint64_t)v91 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000590C(&qword_10002C4F8);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v122 = (uint64_t)v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v120 = (uint64_t)v91 - v12;
  uint64_t v13 = sub_10001F0D0();
  uint64_t v124 = *(void *)(v13 - 8);
  uint64_t v125 = v13;
  __chkstk_darwin(v13);
  uint64_t v123 = (char *)v91 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_10000590C(&qword_10002C480);
  uint64_t v117 = *(void *)(v109 - 8);
  __chkstk_darwin(v109);
  uint64_t v16 = (char *)v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_10000590C(&qword_10002C488);
  __chkstk_darwin(v112);
  long long v114 = (char *)v91 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = sub_10000590C(&qword_10002C490);
  __chkstk_darwin(v113);
  uint64_t v115 = (uint64_t)v91 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = sub_10000590C(&qword_10002C498);
  uint64_t v19 = __chkstk_darwin(v111);
  uint64_t v118 = (uint64_t)v91 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v110 = (uint64_t)v91 - v22;
  __chkstk_darwin(v21);
  uint64_t v127 = (uint64_t)v91 - v23;
  uint64_t v128 = sub_10001ECB0();
  uint64_t v129 = v24;
  v91[1] = sub_100005FA4();
  uint64_t v25 = sub_10001F120();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  char v31 = v30 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v128 = v25;
  uint64_t v129 = v27;
  char v130 = v31;
  uint64_t v131 = v29;
  uint64_t v132 = KeyPath;
  uint64_t v133 = 1;
  char v134 = 0;
  sub_10001F060();
  sub_10000590C(&qword_10002C4A0);
  sub_10000AE84();
  long long v116 = v16;
  sub_10001F180();
  sub_10000AF24(v25, v27, v31);
  swift_release();
  swift_bridgeObjectRelease();
  if (sub_10001EC60())
  {
    uint64_t v33 = sub_10001F0B0();
  }
  else
  {
    sub_10001F0C0();
    unint64_t v35 = v123;
    uint64_t v34 = v124;
    uint64_t v36 = v125;
    (*(void (**)(char *, void, uint64_t))(v124 + 104))(v123, enum case for Font.Leading.tight(_:), v125);
    uint64_t v33 = sub_10001F0E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
  }
  uint64_t v37 = v126;
  uint64_t v38 = v109;
  uint64_t v39 = swift_getKeyPath();
  uint64_t v40 = v116;
  uint64_t v41 = v117;
  uint64_t v42 = (uint64_t)v114;
  (*(void (**)(char *, char *, uint64_t))(v117 + 16))(v114, v116, v38);
  uint64_t v43 = (uint64_t *)(v42 + *(int *)(v112 + 36));
  *uint64_t v43 = v39;
  v43[1] = v33;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v38);
  uint64_t v44 = sub_10001F200();
  uint64_t v45 = v115;
  sub_10000B308(v42, v115, &qword_10002C488);
  *(void *)(v45 + *(int *)(v113 + 36)) = v44;
  sub_10000B36C(v42, &qword_10002C488);
  uint64_t v46 = swift_getKeyPath();
  uint64_t v47 = v110;
  sub_10000B308(v45, v110, &qword_10002C490);
  uint64_t v48 = (uint64_t *)(v47 + *(int *)(v111 + 36));
  uint64_t *v48 = v46;
  v48[1] = 0x3FE999999999999ALL;
  sub_10000B36C(v45, &qword_10002C490);
  sub_10000B2A4(v47, v127, &qword_10002C498);
  uint64_t v49 = sub_10001EC50();
  if (v50)
  {
    uint64_t v128 = v49;
    uint64_t v129 = v50;
    uint64_t v51 = sub_10001F120();
    uint64_t v53 = v52;
    uint64_t v117 = v54;
    char v56 = v55 & 1;
    uint64_t v57 = swift_getKeyPath();
    uint64_t v58 = v95;
    char v59 = v94;
    uint64_t v60 = v96;
    (*(void (**)(char *, void, uint64_t))(v95 + 104))(v94, enum case for Text.TruncationMode.tail(_:), v96);
    uint64_t v61 = swift_getKeyPath();
    uint64_t v62 = v97;
    (*(void (**)(char *, char *, uint64_t))(v58 + 16))((char *)v97 + *(int *)(v93 + 28), v59, v60);
    *uint64_t v62 = v61;
    uint64_t v63 = (uint64_t)v98;
    sub_10000B308((uint64_t)v62, (uint64_t)&v98[*(int *)(v92 + 36)], &qword_10002C428);
    *(void *)uint64_t v63 = v51;
    *(void *)(v63 + 8) = v53;
    *(unsigned char *)(v63 + 16) = v56;
    *(void *)(v63 + 24) = v117;
    *(void *)(v63 + 32) = v57;
    *(void *)(v63 + 40) = 1;
    *(unsigned char *)(v63 + 48) = 0;
    sub_10000AF44(v51, v53, v56);
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v64 = (uint64_t)v62;
    uint64_t v37 = v126;
    sub_10000B36C(v64, &qword_10002C428);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v60);
    sub_10000AF24(v51, v53, v56);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v65 = swift_getKeyPath();
    uint64_t v66 = v99;
    sub_10000B308(v63, v99, &qword_10002C4C8);
    uint64_t v67 = v66 + *(int *)(v100 + 36);
    *(void *)uint64_t v67 = v65;
    *(unsigned char *)(v67 + 8) = 0;
    sub_10000B36C(v63, &qword_10002C4C8);
    sub_10001F090();
    sub_10000AF54();
    uint64_t v68 = v105;
    sub_10001F180();
    sub_10000B36C(v66, &qword_10002C4D0);
    sub_10001F020();
    uint64_t v70 = v123;
    uint64_t v69 = v124;
    uint64_t v71 = v125;
    (*(void (**)(char *, void, uint64_t))(v124 + 104))(v123, enum case for Font.Leading.tight(_:), v125);
    uint64_t v72 = sub_10001F0E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v71);
    uint64_t v73 = swift_getKeyPath();
    uint64_t v74 = v107;
    uint64_t v75 = (uint64_t)v104;
    uint64_t v76 = v108;
    (*(void (**)(char *, char *, uint64_t))(v107 + 16))(v104, v68, v108);
    uint64_t v77 = (uint64_t *)(v75 + *(int *)(v101 + 36));
    *uint64_t v77 = v73;
    v77[1] = v72;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v68, v76);
    uint64_t v78 = sub_10001F1E0();
    uint64_t v79 = v106;
    sub_10000B308(v75, v106, &qword_10002C4E0);
    *(void *)(v79 + *(int *)(v103 + 36)) = v78;
    sub_10000B36C(v75, &qword_10002C4E0);
    uint64_t v80 = swift_getKeyPath();
    uint64_t v81 = v102;
    sub_10000B308(v79, v102, &qword_10002C4E8);
    uint64_t v82 = v121;
    int v83 = (uint64_t *)(v81 + *(int *)(v121 + 36));
    *int v83 = v80;
    v83[1] = 0x3FE999999999999ALL;
    sub_10000B36C(v79, &qword_10002C4E8);
    uint64_t v84 = v120;
    sub_10000B2A4(v81, v120, &qword_10002C4F0);
    uint64_t v85 = 0;
  }
  else
  {
    uint64_t v85 = 1;
    uint64_t v84 = v120;
    uint64_t v82 = v121;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v119 + 56))(v84, v85, 1, v82);
  uint64_t v86 = v127;
  uint64_t v87 = v118;
  sub_10000B308(v127, v118, &qword_10002C498);
  uint64_t v88 = v122;
  sub_10000B308(v84, v122, &qword_10002C4F8);
  sub_10000B308(v87, v37, &qword_10002C498);
  uint64_t v89 = sub_10000590C(&qword_10002C500);
  sub_10000B308(v88, v37 + *(int *)(v89 + 48), &qword_10002C4F8);
  sub_10000B36C(v84, &qword_10002C4F8);
  sub_10000B36C(v86, &qword_10002C498);
  sub_10000B36C(v88, &qword_10002C4F8);
  return sub_10000B36C(v87, &qword_10002C498);
}

uint64_t sub_100009654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v44 = a2;
  uint64_t v43 = sub_10001F110();
  uint64_t v3 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000590C(&qword_10002C3B0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000590C(&qword_10002C3B8);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000590C(&qword_10002C3C0);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_10000590C(&qword_10002C3C8) - 8;
  uint64_t v17 = __chkstk_darwin(v42);
  uint64_t v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v41 = (uint64_t)&v40 - v20;
  *uint64_t v8 = sub_10001EFA0();
  uint64_t v21 = sub_10000590C(&qword_10002C420);
  sub_100009AAC(a1, 3, (uint64_t)&v8[*(int *)(v21 + 44)]);
  uint64_t v22 = v43;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Text.TruncationMode.tail(_:), v43);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v24 = (uint64_t *)&v12[*(int *)(v10 + 44)];
  uint64_t v25 = sub_10000590C(&qword_10002C428);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v24 + *(int *)(v25 + 28), v5, v22);
  *uint64_t v24 = KeyPath;
  sub_10000B308((uint64_t)v8, (uint64_t)v12, &qword_10002C3B0);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v22);
  sub_10000B36C((uint64_t)v8, &qword_10002C3B0);
  uint64_t v26 = swift_getKeyPath();
  sub_10000B308((uint64_t)v12, (uint64_t)v16, &qword_10002C3B8);
  uint64_t v27 = &v16[*(int *)(v14 + 44)];
  *(void *)uint64_t v27 = v26;
  v27[8] = 0;
  sub_10000B36C((uint64_t)v12, &qword_10002C3B8);
  uint64_t v28 = sub_10001F200();
  sub_10000B308((uint64_t)v16, (uint64_t)v19, &qword_10002C3C0);
  *(void *)&v19[*(int *)(v42 + 44)] = v28;
  sub_10000B36C((uint64_t)v16, &qword_10002C3C0);
  uint64_t v29 = v41;
  sub_10000B2A4((uint64_t)v19, v41, &qword_10002C3C8);
  uint64_t v30 = sub_10001EC00();
  sub_100017C4C(v30, 6, 0, 1, (uint64_t)v45, 26.0);
  swift_bridgeObjectRelease();
  sub_10000B308(v29, (uint64_t)v19, &qword_10002C3C8);
  uint64_t v31 = v45[0];
  uint64_t v32 = v45[1];
  uint64_t v33 = v45[2];
  LOBYTE(KeyPath) = v46;
  uint64_t v34 = v47;
  uint64_t v35 = v44;
  sub_10000B308((uint64_t)v19, v44, &qword_10002C3C8);
  uint64_t v36 = sub_10000590C(&qword_10002C530);
  uint64_t v37 = v35 + *(int *)(v36 + 48);
  *(void *)uint64_t v37 = 0x4028000000000000;
  *(unsigned char *)(v37 + 8) = 0;
  uint64_t v38 = v35 + *(int *)(v36 + 64);
  *(void *)uint64_t v38 = v31;
  *(void *)(v38 + 8) = v32;
  *(void *)(v38 + 16) = v33;
  *(unsigned char *)(v38 + 24) = KeyPath & 1;
  *(void *)(v38 + 32) = v34;
  swift_bridgeObjectRetain();
  sub_10000B36C(v29, &qword_10002C3C8);
  swift_bridgeObjectRelease();
  return sub_10000B36C((uint64_t)v19, &qword_10002C3C8);
}

uint64_t sub_100009AAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v62 = a1;
  uint64_t v63 = a2;
  uint64_t v67 = a3;
  uint64_t v66 = sub_10000590C(&qword_10002C538) - 8;
  uint64_t v3 = __chkstk_darwin(v66);
  uint64_t v64 = (uint64_t)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v65 = (uint64_t)&v53 - v5;
  uint64_t v68 = sub_10001F0D0();
  uint64_t v73 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_10000590C(&qword_10002C480);
  uint64_t v74 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v72 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_10000590C(&qword_10002C488) - 8;
  uint64_t v9 = __chkstk_darwin(v70);
  uint64_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v71 = (uint64_t)&v53 - v12;
  uint64_t v75 = sub_10001ECB0();
  uint64_t v76 = v13;
  unint64_t v61 = sub_100005FA4();
  uint64_t v14 = sub_10001F120();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v75 = v14;
  uint64_t v76 = v16;
  char v77 = v20;
  uint64_t v78 = v18;
  uint64_t v79 = KeyPath;
  uint64_t v80 = 1;
  char v81 = 0;
  sub_10001F060();
  uint64_t v60 = sub_10000590C(&qword_10002C4A0);
  unint64_t v59 = sub_10000AE84();
  sub_10001F180();
  sub_10000AF24(v14, v16, v20);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10001F0B0();
  unsigned int v58 = enum case for Font.Leading.tight(_:);
  uint64_t v22 = v73;
  uint64_t v57 = *(void (**)(char *))(v73 + 104);
  uint64_t v23 = v68;
  v57(v7);
  uint64_t v53 = v7;
  uint64_t v24 = sub_10001F0E0();
  swift_release();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v22 + 8);
  uint64_t v73 = v22 + 8;
  char v56 = v25;
  v25(v7, v23);
  uint64_t v26 = swift_getKeyPath();
  uint64_t v27 = v74;
  char v55 = *(void (**)(char *, char *, uint64_t))(v74 + 16);
  uint64_t v28 = v72;
  uint64_t v29 = v69;
  v55(v11, v72, v69);
  uint64_t v30 = (uint64_t *)&v11[*(int *)(v70 + 44)];
  *uint64_t v30 = v26;
  v30[1] = v24;
  uint64_t v31 = *(void (**)(char *, uint64_t))(v27 + 8);
  uint64_t v74 = v27 + 8;
  uint64_t v54 = v31;
  v31(v28, v29);
  sub_10000B2A4((uint64_t)v11, v71, &qword_10002C488);
  uint64_t v75 = sub_10001ECB0();
  uint64_t v76 = v32;
  uint64_t v33 = sub_10001F120();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  LOBYTE(v16) = v38 & 1;
  uint64_t v39 = swift_getKeyPath();
  uint64_t v75 = v33;
  uint64_t v76 = v35;
  char v77 = v16;
  uint64_t v78 = v37;
  uint64_t v79 = v39;
  uint64_t v80 = v63;
  char v81 = 0;
  sub_10001F090();
  sub_10001F180();
  sub_10000AF24(v33, v35, v16);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10001F020();
  uint64_t v40 = v53;
  uint64_t v41 = v68;
  ((void (*)(char *, void, uint64_t))v57)(v53, v58, v68);
  uint64_t v42 = sub_10001F0E0();
  swift_release();
  v56(v40, v41);
  uint64_t v43 = swift_getKeyPath();
  uint64_t v44 = v72;
  uint64_t v45 = v69;
  v55(v11, v72, v69);
  char v46 = (uint64_t *)&v11[*(int *)(v70 + 44)];
  *char v46 = v43;
  v46[1] = v42;
  v54(v44, v45);
  uint64_t v47 = v64;
  sub_10000B308((uint64_t)v11, v64, &qword_10002C488);
  *(_WORD *)(v47 + *(int *)(v66 + 44)) = 256;
  sub_10000B36C((uint64_t)v11, &qword_10002C488);
  uint64_t v48 = v65;
  sub_10000B2A4(v47, v65, &qword_10002C538);
  uint64_t v49 = v71;
  sub_10000B308(v71, (uint64_t)v11, &qword_10002C488);
  sub_10000B308(v48, v47, &qword_10002C538);
  uint64_t v50 = v67;
  sub_10000B308((uint64_t)v11, v67, &qword_10002C488);
  uint64_t v51 = sub_10000590C(&qword_10002C540);
  sub_10000B308(v47, v50 + *(int *)(v51 + 48), &qword_10002C538);
  sub_10000B36C(v48, &qword_10002C538);
  sub_10000B36C(v49, &qword_10002C488);
  sub_10000B36C(v47, &qword_10002C538);
  return sub_10000B36C((uint64_t)v11, &qword_10002C488);
}

uint64_t sub_10000A114()
{
  return sub_10001F1A0();
}

uint64_t sub_10000A134@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t v30 = a3;
  uint64_t v3 = sub_10000590C(&qword_10002C560);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v27 - v7;
  uint64_t v9 = sub_10001F290();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000590C(&qword_10002C568);
  uint64_t v14 = v13 - 8;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  char v19 = (char *)&v27 - v18;
  sub_10001F280();
  uint64_t v20 = sub_10001F1E0();
  char v21 = sub_10001EFB0();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v17, v12, v9);
  uint64_t v22 = &v17[*(int *)(v14 + 44)];
  *(void *)uint64_t v22 = v20;
  v22[8] = v21;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_10000B2A4((uint64_t)v17, (uint64_t)v19, &qword_10002C568);
  *(void *)uint64_t v8 = sub_10001EEA0();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v23 = sub_10000590C(&qword_10002C570);
  sub_10000A3FC(v28, v29, (uint64_t)&v8[*(int *)(v23 + 44)]);
  sub_10000B308((uint64_t)v19, (uint64_t)v17, &qword_10002C568);
  sub_10000B308((uint64_t)v8, (uint64_t)v6, &qword_10002C560);
  uint64_t v24 = v30;
  sub_10000B308((uint64_t)v17, v30, &qword_10002C568);
  uint64_t v25 = sub_10000590C(&qword_10002C578);
  sub_10000B308((uint64_t)v6, v24 + *(int *)(v25 + 48), &qword_10002C560);
  sub_10000B36C((uint64_t)v8, &qword_10002C560);
  sub_10000B36C((uint64_t)v19, &qword_10002C568);
  sub_10000B36C((uint64_t)v6, &qword_10002C560);
  return sub_10000B36C((uint64_t)v17, &qword_10002C568);
}

uint64_t sub_10000A3FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v74 = a3;
  uint64_t v5 = sub_10001F0D0();
  uint64_t v72 = *(void *)(v5 - 8);
  uint64_t v73 = v5;
  __chkstk_darwin(v5);
  uint64_t v71 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000590C(&qword_10002C428) - 8;
  __chkstk_darwin(v7);
  unsigned int v58 = (uint64_t *)((char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_10001F110();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_10000590C(&qword_10002C4C8) - 8;
  __chkstk_darwin(v57);
  uint64_t v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_10000590C(&qword_10002C4D0);
  __chkstk_darwin(v61);
  uint64_t v59 = (uint64_t)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10000590C(&qword_10002C4D8);
  uint64_t v69 = *(void *)(v16 - 8);
  uint64_t v70 = v16;
  __chkstk_darwin(v16);
  uint64_t v60 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_10000590C(&qword_10002C4E0) - 8;
  __chkstk_darwin(v66);
  uint64_t v63 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_10000590C(&qword_10002C4E8) - 8;
  __chkstk_darwin(v68);
  uint64_t v64 = (uint64_t)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_10000590C(&qword_10002C4F0) - 8;
  uint64_t v20 = __chkstk_darwin(v67);
  uint64_t v62 = (uint64_t)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v65 = (uint64_t)&v54 - v22;
  uint64_t v75 = a1;
  uint64_t v76 = a2;
  sub_100005FA4();
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_10001F120();
  uint64_t v25 = v24;
  uint64_t v55 = v26;
  LOBYTE(a2) = v27 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v56 = v10;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Text.TruncationMode.tail(_:), v9);
  uint64_t v29 = swift_getKeyPath();
  uint64_t v30 = *(int *)(v7 + 36);
  uint64_t v31 = v58;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v58 + v30, v12, v9);
  *uint64_t v31 = v29;
  sub_10000B308((uint64_t)v31, (uint64_t)&v14[*(int *)(v57 + 44)], &qword_10002C428);
  *(void *)uint64_t v14 = v23;
  *((void *)v14 + 1) = v25;
  v14[16] = a2;
  *((void *)v14 + 3) = v55;
  *((void *)v14 + 4) = KeyPath;
  *((void *)v14 + 5) = 2;
  v14[48] = 0;
  sub_10000AF44(v23, v25, a2);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000B36C((uint64_t)v31, &qword_10002C428);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v12, v9);
  sub_10000AF24(v23, v25, a2);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v32 = swift_getKeyPath();
  uint64_t v33 = v59;
  sub_10000B308((uint64_t)v14, v59, &qword_10002C4C8);
  uint64_t v34 = v33 + *(int *)(v61 + 36);
  *(void *)uint64_t v34 = v32;
  *(unsigned char *)(v34 + 8) = 0;
  sub_10000B36C((uint64_t)v14, &qword_10002C4C8);
  sub_10001F080();
  sub_10000AF54();
  uint64_t v35 = v60;
  sub_10001F180();
  sub_10000B36C(v33, &qword_10002C4D0);
  sub_10001F020();
  uint64_t v37 = v71;
  uint64_t v36 = v72;
  uint64_t v38 = v73;
  (*(void (**)(char *, void, uint64_t))(v72 + 104))(v71, enum case for Font.Leading.tight(_:), v73);
  uint64_t v39 = sub_10001F0E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v38);
  uint64_t v40 = swift_getKeyPath();
  uint64_t v42 = v69;
  uint64_t v41 = v70;
  uint64_t v43 = (uint64_t)v63;
  (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v63, v35, v70);
  uint64_t v44 = (uint64_t *)(v43 + *(int *)(v66 + 44));
  *uint64_t v44 = v40;
  v44[1] = v39;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v41);
  uint64_t v45 = sub_10001F1E0();
  uint64_t v46 = v64;
  sub_10000B308(v43, v64, &qword_10002C4E0);
  *(void *)(v46 + *(int *)(v68 + 44)) = v45;
  sub_10000B36C(v43, &qword_10002C4E0);
  uint64_t v47 = swift_getKeyPath();
  uint64_t v48 = v62;
  sub_10000B308(v46, v62, &qword_10002C4E8);
  uint64_t v49 = (uint64_t *)(v48 + *(int *)(v67 + 44));
  *uint64_t v49 = v47;
  v49[1] = 0x3FE999999999999ALL;
  sub_10000B36C(v46, &qword_10002C4E8);
  uint64_t v50 = v65;
  sub_10000B2A4(v48, v65, &qword_10002C4F0);
  sub_10000B308(v50, v48, &qword_10002C4F0);
  uint64_t v51 = v74;
  sub_10000B308(v48, v74, &qword_10002C4F0);
  uint64_t v52 = v51 + *(int *)(sub_10000590C(&qword_10002C580) + 48);
  *(void *)uint64_t v52 = 0;
  *(unsigned char *)(v52 + 8) = 1;
  sub_10000B36C(v50, &qword_10002C4F0);
  return sub_10000B36C(v48, &qword_10002C4F0);
}

uint64_t sub_10000AB7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  *(void *)a1 = sub_10001EEC0();
  *(void *)(a1 + 8) = 0x4026000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v5 = sub_10000590C(&qword_10002C558);
  return sub_10000A134(v4, v3, a1 + *(int *)(v5 + 44));
}

uint64_t sub_10000ABD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000AC40(uint64_t a1)
{
  id v2 = *(id *)(a1 + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10000AC88(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000ACF8()
{
  unint64_t result = qword_10002C448;
  if (!qword_10002C448)
  {
    sub_100005950(&qword_10002C408);
    sub_100005F60(&qword_10002C450, &qword_10002C410);
    sub_100005F60(&qword_10002C458, &qword_10002C3F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C448);
  }
  return result;
}

unint64_t sub_10000ADB8()
{
  unint64_t result = qword_10002C460;
  if (!qword_10002C460)
  {
    sub_100005950(&qword_10002C3E0);
    sub_100005F60(&qword_10002C438, &qword_10002C3E8);
    sub_100005F60(&qword_10002C440, &qword_10002C3D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C460);
  }
  return result;
}

unint64_t sub_10000AE84()
{
  unint64_t result = qword_10002C4A8;
  if (!qword_10002C4A8)
  {
    sub_100005950(&qword_10002C4A0);
    sub_100005F60(&qword_10002C4B0, &qword_10002C4B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C4A8);
  }
  return result;
}

uint64_t sub_10000AF24(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000AF44(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_10000AF54()
{
  unint64_t result = qword_10002C508;
  if (!qword_10002C508)
  {
    sub_100005950(&qword_10002C4D0);
    sub_10000AFF4();
    sub_100005F60(&qword_10002C520, &qword_10002C528);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C508);
  }
  return result;
}

unint64_t sub_10000AFF4()
{
  unint64_t result = qword_10002C510;
  if (!qword_10002C510)
  {
    sub_100005950(&qword_10002C4C8);
    sub_10000AE84();
    sub_100005F60(&qword_10002C518, &qword_10002C428);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C510);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for PassLiveActivityMessage(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PassLiveActivityMessage()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for PassLiveActivityMessage(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PassLiveActivityMessage(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for PassLiveActivityMessage(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PassLiveActivityMessage(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PassLiveActivityMessage(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PassLiveActivityMessage()
{
  return &type metadata for PassLiveActivityMessage;
}

unint64_t sub_10000B1E8()
{
  unint64_t result = qword_10002C548;
  if (!qword_10002C548)
  {
    sub_100005950(&qword_10002C368);
    sub_100005F60(&qword_10002C550, &qword_10002C360);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C548);
  }
  return result;
}

uint64_t sub_10000B288()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000B2A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000590C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B308(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000590C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B36C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000590C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000B3C8()
{
  return sub_100005F60(&qword_10002C588, &qword_10002C590);
}

ValueMetadata *type metadata accessor for PassLiveActivityWidget()
{
  return &type metadata for PassLiveActivityWidget;
}

uint64_t sub_10000B41C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000B438@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v28 = a2;
  uint64_t v2 = sub_10000590C(&qword_10002C5B8);
  __chkstk_darwin(v2 - 8);
  uint64_t v26 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10001ECC0();
  uint64_t v25 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001F1D0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for LiveActivityView();
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000590C(&qword_10002C5A8);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v23 = v13;
  uint64_t v24 = v14;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000590C(&qword_10002C5C0);
  sub_10001F3C0();
  *(void *)&v12[*(int *)(v10 + 20)] = v22;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Color.RGBColorSpace.sRGB(_:), v6);
  swift_retain();
  sub_10001F210();
  uint64_t v17 = sub_10001244C(&qword_10002C5B0, (void (*)(uint64_t))type metadata accessor for LiveActivityView);
  sub_10001F140();
  swift_release();
  sub_100013964((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for LiveActivityView);
  sub_10001F3C0();
  uint64_t v18 = (uint64_t)v26;
  sub_10001ECA0();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v27);
  uint64_t v29 = v10;
  uint64_t v30 = v17;
  swift_getOpaqueTypeConformance2();
  uint64_t v19 = v23;
  sub_10001F150();
  sub_10000B36C(v18, &qword_10002C5B8);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v16, v19);
}

uint64_t sub_10000B81C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v79 = a3;
  uint64_t v5 = sub_10000590C(&qword_10002C5B8);
  __chkstk_darwin(v5 - 8);
  uint64_t v78 = (char *)v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10001ECC0();
  uint64_t v76 = *(void *)(v7 - 8);
  char v77 = (void (*)(void, void))v7;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v75 = (char *)v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v71 = (char *)v62 - v11;
  __chkstk_darwin(v10);
  uint64_t v70 = (char *)v62 - v12;
  uint64_t v13 = sub_10001F3B0();
  uint64_t v73 = *(void *)(v13 - 8);
  uint64_t v74 = v13;
  __chkstk_darwin(v13);
  uint64_t v82 = (char *)v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000590C(&qword_10002C5C0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v66 = (char *)v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v18);
  int v83 = (char *)v62 - v20;
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)v62 - v21;
  uint64_t v81 = sub_10001F360();
  uint64_t v84 = *(void *)(v81 - 8);
  uint64_t v23 = __chkstk_darwin(v81);
  uint64_t v69 = (char *)v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v80 = (char *)v62 - v26;
  __chkstk_darwin(v25);
  uint64_t v72 = (char *)v62 - v27;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  uint64_t v29 = a1;
  uint64_t v85 = a1;
  v28(v22, a1, v15);
  uint64_t v30 = *(unsigned __int8 *)(v16 + 80);
  v62[1] = v30 | 7;
  uint64_t v31 = swift_allocObject();
  uint64_t v68 = v31;
  uint64_t v63 = a2;
  *(void *)(v31 + 16) = a2;
  v62[0] = *(void *)(v16 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v62[0])(v31 + ((v30 + 24) & ~v30), v22, v15);
  v28(v83, v29, v15);
  uint64_t v32 = (v30 + 16) & ~v30;
  uint64_t v65 = v32 + v17;
  unint64_t v33 = (v32 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v64 = v33 + 8;
  uint64_t v34 = swift_allocObject();
  uint64_t v67 = v34;
  uint64_t v35 = (void (*)(uint64_t, char *, uint64_t))v62[0];
  ((void (*)(uint64_t, char *, uint64_t))v62[0])(v34 + v32, v83, v15);
  *(void *)(v34 + v33) = a2;
  uint64_t v36 = v66;
  uint64_t v37 = v85;
  v28(v66, v85, v15);
  uint64_t v65 = swift_allocObject();
  v35(v65 + v32, v36, v15);
  v28(v36, v37, v15);
  uint64_t v38 = swift_allocObject();
  int v83 = (char *)v15;
  v35(v38 + v32, v36, v15);
  *(void *)(v38 + v33) = v63;
  swift_retain_n();
  sub_10000590C(&qword_10002C5C8);
  sub_10000590C(&qword_10002C5D0);
  sub_10000590C(&qword_10002C5D8);
  sub_100005F60(&qword_10002C5E0, &qword_10002C5C8);
  sub_100012944(&qword_10002C5E8, &qword_10002C5D0, (void (*)(void))sub_100012878);
  sub_100012A74();
  uint64_t v39 = v69;
  sub_10001F340();
  LOBYTE(v28) = sub_10001EFE0();
  unsigned __int8 v40 = sub_10001F000();
  sub_10001EFF0();
  sub_10001EFF0();
  if (sub_10001EFF0() != v28) {
    sub_10001EFF0();
  }
  sub_10001EFF0();
  if (sub_10001EFF0() != v40) {
    sub_10001EFF0();
  }
  uint64_t v42 = v76;
  uint64_t v41 = v77;
  uint64_t v44 = v73;
  uint64_t v43 = v74;
  uint64_t v45 = v82;
  sub_10001F3A0();
  sub_10001F330();
  uint64_t v46 = *(void (**)(char *, uint64_t))(v44 + 8);
  v46(v45, v43);
  uint64_t v47 = *(void (**)(void, void))(v84 + 8);
  v84 += 8;
  char v77 = v47;
  v47(v39, v81);
  uint64_t v48 = v70;
  sub_10001F3C0();
  unint64_t v49 = *(void *)(sub_10001EC00() + 16);
  swift_bridgeObjectRelease();
  uint64_t v50 = v71;
  (*(void (**)(char *, char *, void (*)(void, void)))(v42 + 16))(v71, v48, v41);
  if (v49 >= 3) {
    char v51 = sub_10001EC90();
  }
  else {
    char v51 = 1;
  }
  uint64_t v52 = *(void (**)(char *, void))(v42 + 8);
  v52(v50, v41);
  v52(v48, v41);
  if ((v51 & 1) != 0
    || (unsigned __int8 v53 = sub_10001EFD0(), sub_10001EFF0(), sub_10001EFF0(), sub_10001EFF0() != v53))
  {
    sub_10001EFF0();
  }
  uint64_t v54 = v82;
  sub_10001F3A0();
  uint64_t v55 = v72;
  uint64_t v56 = v80;
  sub_10001F330();
  v46(v54, v43);
  uint64_t v57 = v81;
  unsigned int v58 = (uint64_t (*)(char *, uint64_t))v77;
  v77(v56, v81);
  uint64_t v59 = v75;
  sub_10001F3C0();
  uint64_t v60 = (uint64_t)v78;
  sub_10001ECA0();
  v52(v59, v41);
  sub_10001F350();
  sub_10000B36C(v60, &qword_10002C5B8);
  return v58(v55, v57);
}

uint64_t sub_10000C0B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10001ECC0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000590C(&qword_10002C5C0);
  sub_10001F3C0();
  sub_10000C1A4((uint64_t)v7, a1, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10000C1A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = a3;
  uint64_t v23 = sub_10000590C(&qword_10002C6B0);
  uint64_t v21 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10000590C(&qword_10002C6B8);
  uint64_t v19 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10001F470();
  __chkstk_darwin(v9 - 8);
  uint64_t v18 = sub_10000590C(&qword_10002C6C0);
  uint64_t v10 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F450();
  uint64_t v29 = a2;
  uint64_t v30 = a1;
  uint64_t v13 = sub_10000590C(&qword_10002C6C8);
  unint64_t v14 = sub_1000132B0();
  sub_10001F420();
  sub_10001F460();
  uint64_t v27 = a2;
  uint64_t v28 = a1;
  sub_10000590C(&qword_10002C6E8);
  uint64_t v15 = sub_100005950(&qword_10002C6F0);
  uint64_t v16 = sub_100013358(&qword_10002C6F8, &qword_10002C6F0, (void (*)(void))sub_1000133E0, (void (*)(void))sub_10001355C);
  uint64_t v31 = v15;
  unint64_t v32 = v16;
  swift_getOpaqueTypeConformance2();
  sub_10001F420();
  uint64_t v26 = v12;
  sub_10000590C(&qword_10002C790);
  uint64_t v31 = v13;
  unint64_t v32 = v14;
  swift_getOpaqueTypeConformance2();
  sub_10001F430();
  uint64_t v24 = v6;
  uint64_t v25 = v8;
  sub_10000590C(&qword_10002C5C8);
  sub_100005F60(&qword_10002C5E0, &qword_10002C5C8);
  sub_10001F430();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v23);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v18);
}

uint64_t sub_10000C5F0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v77 = a2;
  uint64_t v73 = sub_10000590C(&qword_10002C398);
  __chkstk_darwin(v73);
  uint64_t v4 = (char *)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_10001EEB0();
  uint64_t v5 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v71 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_10001ED70();
  __chkstk_darwin(v69);
  uint64_t v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_10000590C(&qword_10002C3A0);
  __chkstk_darwin(v70);
  uint64_t v10 = (_OWORD *)((char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v74 = sub_10000590C(&qword_10002C5D0);
  __chkstk_darwin(v74);
  uint64_t v75 = (uint64_t)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001ECC0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000590C(&qword_10002C5C0);
  sub_10001F3C0();
  uint64_t v16 = sub_10001EC80();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  PKFloatCeilToPixel();
  PKFloatFloorToPixel();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v68 = v16;
  uint64_t v76 = a1;
  uint64_t v19 = sub_10001B2A4(v16, v18);
  swift_bridgeObjectRelease();
  sub_10001F2C0();
  sub_10001ED50();
  uint64_t v64 = v91;
  int v63 = v92;
  uint64_t v65 = v93;
  int v62 = v94;
  uint64_t v67 = v95;
  uint64_t v66 = v96;
  LOBYTE(v15) = sub_10001EFC0();
  unsigned __int8 v20 = sub_10001EFD0();
  char v21 = sub_10001EFF0();
  sub_10001EFF0();
  if (sub_10001EFF0() != v15) {
    char v21 = sub_10001EFF0();
  }
  sub_10001EFF0();
  if (sub_10001EFF0() != v20) {
    char v21 = sub_10001EFF0();
  }
  sub_10001ED10();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  unsigned __int8 v30 = sub_10001EFE0();
  unsigned __int8 v31 = sub_10001F000();
  char v32 = sub_10001EFF0();
  sub_10001EFF0();
  if (sub_10001EFF0() != v30) {
    char v32 = sub_10001EFF0();
  }
  sub_10001EFF0();
  if (sub_10001EFF0() != v31) {
    char v32 = sub_10001EFF0();
  }
  char v80 = v63;
  char v79 = v62;
  char v78 = 0;
  sub_10001ED10();
  *(void *)&long long v81 = v68;
  *((void *)&v81 + 1) = v18;
  *(void *)&long long v82 = v19;
  *((void *)&v82 + 1) = v76;
  *(void *)&long long v83 = v64;
  BYTE8(v83) = v80;
  *(void *)&long long v84 = v65;
  BYTE8(v84) = v79;
  *(void *)&long long v85 = v67;
  *((void *)&v85 + 1) = v66;
  LOBYTE(v86) = v21;
  *((void *)&v86 + 1) = v23;
  *(void *)&long long v87 = v25;
  *((void *)&v87 + 1) = v27;
  *(void *)&long long v88 = v29;
  BYTE8(v88) = v78;
  LOBYTE(v89) = v32;
  *((void *)&v89 + 1) = v33;
  *(void *)uint64_t v90 = v34;
  *(void *)&v90[8] = v35;
  *(void *)&v90[16] = v36;
  v90[24] = 0;
  uint64_t v37 = v71;
  uint64_t v38 = v19;
  uint64_t v39 = v72;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v71, enum case for RoundedCornerStyle.continuous(_:), v72);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(&v8[*(int *)(v69 + 20)], v37, v39);
  __asm { FMOV            V0.2D, #2.0 }
  *(_OWORD *)uint64_t v8 = _Q0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v37, v39);
  sub_1000130E4((uint64_t)v8, (uint64_t)v4);
  *(_WORD *)&v4[*(int *)(v73 + 36)] = 256;
  sub_10000B308((uint64_t)v4, (uint64_t)v10 + *(int *)(v70 + 36), &qword_10002C398);
  long long v45 = v88;
  long long v46 = *(_OWORD *)v90;
  v10[8] = v89;
  v10[9] = v46;
  *(_OWORD *)((char *)v10 + 153) = *(_OWORD *)&v90[9];
  long long v47 = v86;
  v10[4] = v85;
  v10[5] = v47;
  v10[6] = v87;
  v10[7] = v45;
  long long v48 = v82;
  *uint64_t v10 = v81;
  v10[1] = v48;
  long long v49 = v84;
  v10[2] = v83;
  v10[3] = v49;
  sub_10000AC40((uint64_t)&v81);
  sub_10000B36C((uint64_t)v4, &qword_10002C398);
  sub_100013964((uint64_t)v8, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  swift_release();
  swift_bridgeObjectRelease();

  LOBYTE(v39) = sub_10001EFE0();
  sub_10001ED10();
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v58 = v75;
  sub_10000B308((uint64_t)v10, v75, &qword_10002C3A0);
  uint64_t v59 = v58 + *(int *)(v74 + 36);
  *(unsigned char *)uint64_t v59 = v39;
  *(void *)(v59 + 8) = v51;
  *(void *)(v59 + 16) = v53;
  *(void *)(v59 + 24) = v55;
  *(void *)(v59 + 32) = v57;
  *(unsigned char *)(v59 + 40) = 0;
  sub_10000B36C((uint64_t)v10, &qword_10002C3A0);
  return sub_10000B2A4(v58, v77, &qword_10002C5D0);
}

uint64_t sub_10000CD80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v1 = sub_10000590C(&qword_10002C658);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000590C(&qword_10002C648);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  __chkstk_darwin(v4);
  uint64_t v37 = (uint64_t)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001ECC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v37 - v11;
  sub_10000590C(&qword_10002C5C0);
  sub_10001F3C0();
  uint64_t v13 = sub_10001EC10();
  unint64_t v15 = v14;
  uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v12, v6);
  if (!v15) {
    goto LABEL_5;
  }
  uint64_t v17 = v13;
  sub_10001F3C0();
  uint64_t v18 = sub_10001EC70();
  unint64_t v20 = v19;
  v16(v10, v6);
  if (!v20)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    uint64_t v35 = 1;
    uint64_t v32 = v39;
    uint64_t v34 = v40;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56))(v34, v35, 1, v32);
  }
  *(void *)uint64_t v3 = sub_10001EEC0();
  *((void *)v3 + 1) = 0;
  v3[16] = 0;
  uint64_t v21 = sub_10000590C(&qword_10002C660);
  sub_10000D0B4(v17, v15, v18, v20, (uint64_t)&v3[*(int *)(v21 + 44)]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v22 = sub_10001F000();
  sub_10001ED10();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v31 = v37;
  sub_10000B308((uint64_t)v3, v37, &qword_10002C658);
  uint64_t v32 = v39;
  uint64_t v33 = v31 + *(int *)(v39 + 36);
  *(unsigned char *)uint64_t v33 = v22;
  *(void *)(v33 + 8) = v24;
  *(void *)(v33 + 16) = v26;
  *(void *)(v33 + 24) = v28;
  *(void *)(v33 + 32) = v30;
  *(unsigned char *)(v33 + 40) = 0;
  sub_10000B36C((uint64_t)v3, &qword_10002C658);
  uint64_t v34 = v40;
  sub_10000B2A4(v31, v40, &qword_10002C648);
  uint64_t v35 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56))(v34, v35, 1, v32);
}

uint64_t sub_10000D0B4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v74 = a4;
  uint64_t v73 = a3;
  uint64_t v77 = a5;
  uint64_t v82 = sub_10000590C(&qword_10002C668);
  uint64_t v87 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  uint64_t v8 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_10000590C(&qword_10002C670);
  uint64_t v86 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  char v79 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_10000590C(&qword_10002C678) - 8;
  __chkstk_darwin(v84);
  char v80 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_10000590C(&qword_10002C680) - 8;
  uint64_t v11 = __chkstk_darwin(v85);
  uint64_t v76 = (uint64_t)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v75 = (uint64_t)&v64 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v78 = (uint64_t)&v64 - v16;
  __chkstk_darwin(v15);
  uint64_t v83 = (uint64_t)&v64 - v17;
  uint64_t v88 = a1;
  unint64_t v89 = a2;
  unint64_t v72 = sub_100005FA4();
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_10001F120();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t OpaqueTypeConformance2 = v21;
  LOBYTE(a1) = v23 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v25 = sub_10001F0F0();
  uint64_t v26 = swift_getKeyPath();
  uint64_t v88 = v18;
  unint64_t v89 = v20;
  char v90 = a1;
  uint64_t v91 = v22;
  uint64_t v92 = KeyPath;
  uint64_t v93 = 1;
  char v94 = 0;
  uint64_t v95 = v26;
  uint64_t v96 = v25;
  uint64_t v27 = sub_10000590C(&qword_10002C688);
  unint64_t v28 = sub_1000131B4();
  uint64_t v65 = v8;
  uint64_t v67 = v27;
  unint64_t v66 = v28;
  sub_10001F190();
  sub_10000AF24(v18, v20, a1);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10001F070();
  uint64_t v88 = v27;
  unint64_t v89 = v28;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v29 = v79;
  uint64_t v30 = v82;
  sub_10001F180();
  uint64_t v31 = *(void (**)(char *, uint64_t))(v87 + 8);
  v87 += 8;
  uint64_t v70 = v31;
  v31(v8, v30);
  uint64_t v32 = sub_10001F1E0();
  uint64_t v33 = v86;
  uint64_t v69 = *(void (**)(char *, char *, uint64_t))(v86 + 16);
  uint64_t v35 = (uint64_t)v80;
  uint64_t v34 = v81;
  v69(v80, v29, v81);
  *(void *)(v35 + *(int *)(v84 + 44)) = v32;
  uint64_t v36 = *(void (**)(char *, uint64_t))(v33 + 8);
  uint64_t v86 = v33 + 8;
  uint64_t v68 = v36;
  v36(v29, v34);
  uint64_t v37 = swift_getKeyPath();
  uint64_t v38 = v78;
  sub_10000B308(v35, v78, &qword_10002C678);
  uint64_t v39 = (uint64_t *)(v38 + *(int *)(v85 + 44));
  *uint64_t v39 = v37;
  v39[1] = 0x3FE999999999999ALL;
  sub_10000B36C(v35, &qword_10002C678);
  sub_10000B2A4(v38, v83, &qword_10002C680);
  uint64_t v88 = v73;
  unint64_t v89 = v74;
  swift_bridgeObjectRetain();
  uint64_t v40 = sub_10001F120();
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  LOBYTE(a1) = v45 & 1;
  uint64_t v46 = swift_getKeyPath();
  uint64_t v47 = sub_10001F100();
  uint64_t v48 = swift_getKeyPath();
  uint64_t v88 = v40;
  unint64_t v89 = v42;
  char v90 = a1;
  uint64_t v91 = v44;
  uint64_t v92 = v46;
  uint64_t v93 = 1;
  char v94 = 0;
  uint64_t v95 = v48;
  uint64_t v96 = v47;
  long long v49 = v65;
  sub_10001F190();
  sub_10000AF24(v40, v42, a1);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10001F090();
  uint64_t v50 = v79;
  uint64_t v51 = v82;
  sub_10001F180();
  v70(v49, v51);
  uint64_t v52 = sub_10001F200();
  uint64_t v53 = (uint64_t)v80;
  uint64_t v54 = v81;
  v69(v80, v50, v81);
  *(void *)(v53 + *(int *)(v84 + 44)) = v52;
  v68(v50, v54);
  uint64_t v55 = swift_getKeyPath();
  uint64_t v56 = v75;
  sub_10000B308(v53, v75, &qword_10002C678);
  uint64_t v57 = (uint64_t *)(v56 + *(int *)(v85 + 44));
  *uint64_t v57 = v55;
  v57[1] = 0x3FECCCCCCCCCCCCDLL;
  sub_10000B36C(v53, &qword_10002C678);
  uint64_t v58 = v78;
  sub_10000B2A4(v56, v78, &qword_10002C680);
  uint64_t v59 = v83;
  sub_10000B308(v83, v56, &qword_10002C680);
  uint64_t v60 = v76;
  sub_10000B308(v58, v76, &qword_10002C680);
  uint64_t v61 = v77;
  sub_10000B308(v56, v77, &qword_10002C680);
  uint64_t v62 = sub_10000590C(&qword_10002C6A8);
  sub_10000B308(v60, v61 + *(int *)(v62 + 48), &qword_10002C680);
  sub_10000B36C(v58, &qword_10002C680);
  sub_10000B36C(v59, &qword_10002C680);
  sub_10000B36C(v60, &qword_10002C680);
  return sub_10000B36C(v56, &qword_10002C680);
}

uint64_t sub_10000D7F8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v79 = a2;
  uint64_t v75 = sub_10000590C(&qword_10002C398);
  __chkstk_darwin(v75);
  uint64_t v4 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_10001EEB0();
  uint64_t v5 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  uint64_t v73 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_10001ED70();
  __chkstk_darwin(v71);
  uint64_t v8 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_10000590C(&qword_10002C3A0);
  __chkstk_darwin(v72);
  uint64_t v10 = (_OWORD *)((char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v77 = sub_10000590C(&qword_10002C5D0);
  __chkstk_darwin(v77);
  uint64_t v78 = (uint64_t)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001ECC0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000590C(&qword_10002C5C0);
  sub_10001F3C0();
  uint64_t v16 = sub_10001EC80();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  PKFloatCeilToPixel();
  PKFloatFloorToPixel();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v70 = v16;
  uint64_t v76 = a1;
  uint64_t v19 = sub_10001B2A4(v16, v18);
  swift_bridgeObjectRelease();
  sub_10001F2C0();
  sub_10001ED50();
  uint64_t v66 = v93;
  int v65 = v94;
  uint64_t v67 = v95;
  int v64 = v96;
  uint64_t v69 = v97;
  uint64_t v68 = v98;
  LOBYTE(v15) = sub_10001EFC0();
  unsigned __int8 v20 = sub_10001EFD0();
  char v21 = sub_10001EFF0();
  sub_10001EFF0();
  if (sub_10001EFF0() != v15) {
    char v21 = sub_10001EFF0();
  }
  sub_10001EFF0();
  if (sub_10001EFF0() != v20) {
    char v21 = sub_10001EFF0();
  }
  sub_10001ED10();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  unsigned __int8 v30 = sub_10001EFE0();
  unsigned __int8 v31 = sub_10001F000();
  char v32 = sub_10001EFF0();
  sub_10001EFF0();
  if (sub_10001EFF0() != v30) {
    char v32 = sub_10001EFF0();
  }
  sub_10001EFF0();
  if (sub_10001EFF0() != v31) {
    char v32 = sub_10001EFF0();
  }
  char v82 = v65;
  char v81 = v64;
  char v80 = 0;
  sub_10001ED10();
  *(void *)&long long v83 = v70;
  *((void *)&v83 + 1) = v18;
  *(void *)&long long v84 = v19;
  *((void *)&v84 + 1) = v76;
  *(void *)&long long v85 = v66;
  BYTE8(v85) = v82;
  *(void *)&long long v86 = v67;
  BYTE8(v86) = v81;
  *(void *)&long long v87 = v69;
  *((void *)&v87 + 1) = v68;
  LOBYTE(v88) = v21;
  *((void *)&v88 + 1) = v23;
  *(void *)&long long v89 = v25;
  *((void *)&v89 + 1) = v27;
  *(void *)&long long v90 = v29;
  BYTE8(v90) = v80;
  LOBYTE(v91) = v32;
  *((void *)&v91 + 1) = v33;
  *(void *)uint64_t v92 = v34;
  *(void *)&v92[8] = v35;
  *(void *)&v92[16] = v36;
  v92[24] = 0;
  uint64_t v37 = v73;
  uint64_t v38 = v19;
  uint64_t v39 = v74;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v73, enum case for RoundedCornerStyle.continuous(_:), v74);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(&v8[*(int *)(v71 + 20)], v37, v39);
  __asm { FMOV            V0.2D, #2.0 }
  *(_OWORD *)uint64_t v8 = _Q0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v37, v39);
  sub_1000130E4((uint64_t)v8, (uint64_t)v4);
  *(_WORD *)&v4[*(int *)(v75 + 36)] = 256;
  sub_10000B308((uint64_t)v4, (uint64_t)v10 + *(int *)(v72 + 36), &qword_10002C398);
  long long v45 = v90;
  long long v46 = *(_OWORD *)v92;
  v10[8] = v91;
  v10[9] = v46;
  *(_OWORD *)((char *)v10 + 153) = *(_OWORD *)&v92[9];
  long long v47 = v88;
  v10[4] = v87;
  v10[5] = v47;
  v10[6] = v89;
  v10[7] = v45;
  long long v48 = v84;
  *uint64_t v10 = v83;
  v10[1] = v48;
  long long v49 = v86;
  v10[2] = v85;
  v10[3] = v49;
  sub_10000AC40((uint64_t)&v83);
  sub_10000B36C((uint64_t)v4, &qword_10002C398);
  sub_100013964((uint64_t)v8, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  swift_release();
  swift_bridgeObjectRelease();

  LOBYTE(v38) = sub_10001EFE0();
  unsigned __int8 v50 = sub_10001F000();
  char v51 = sub_10001EFF0();
  sub_10001EFF0();
  if (sub_10001EFF0() != v38) {
    char v51 = sub_10001EFF0();
  }
  sub_10001EFF0();
  if (sub_10001EFF0() != v50) {
    char v51 = sub_10001EFF0();
  }
  sub_10001ED10();
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v60 = v78;
  sub_10000B308((uint64_t)v10, v78, &qword_10002C3A0);
  uint64_t v61 = v60 + *(int *)(v77 + 36);
  *(unsigned char *)uint64_t v61 = v51;
  *(void *)(v61 + 8) = v53;
  *(void *)(v61 + 16) = v55;
  *(void *)(v61 + 24) = v57;
  *(void *)(v61 + 32) = v59;
  *(unsigned char *)(v61 + 40) = 0;
  sub_10000B36C((uint64_t)v10, &qword_10002C3A0);
  return sub_10000B2A4(v60, v79, &qword_10002C5D0);
}

uint64_t sub_10000DFEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_10000590C(&qword_10002C6E0);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013794(a2);
  double v11 = v10;
  sub_100013030(v10);
  if (v11 <= 66.0) {
    double v12 = 4.0;
  }
  else {
    double v12 = 6.0;
  }
  uint64_t v13 = sub_10001F1F0();
  uint64_t v14 = sub_10001F2B0();
  uint64_t v16 = v15;
  sub_10000E140(a1, (uint64_t)v9, v12);
  uint64_t v17 = (uint64_t *)&v9[*(int *)(v7 + 44)];
  *uint64_t v17 = v14;
  v17[1] = v16;
  uint64_t v18 = sub_10000590C(&qword_10002C6C8);
  sub_10000B308((uint64_t)v9, (uint64_t)a3 + *(int *)(v18 + 36), &qword_10002C6E0);
  *a3 = v13;
  return sub_10000B36C((uint64_t)v9, &qword_10002C6E0);
}

uint64_t sub_10000E140@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, double a3@<D3>)
{
  uint64_t v57 = a2;
  uint64_t v55 = sub_10000590C(&qword_10002C398);
  __chkstk_darwin(v55);
  uint64_t v52 = (uint64_t)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_10001EEB0();
  uint64_t v6 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_10001ED70();
  __chkstk_darwin(v50);
  double v10 = (double *)((char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v51 = sub_10000590C(&qword_10002C3A0);
  __chkstk_darwin(v51);
  double v12 = (_OWORD *)((char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_10001EC80();
  uint64_t v15 = v14;
  swift_retain();
  uint64_t v16 = v15;
  uint64_t v56 = a1;
  uint64_t v53 = sub_10001B2A4(v13, v15);
  sub_10001F2C0();
  sub_10001ED50();
  uint64_t v46 = v71;
  int v45 = v72;
  uint64_t v47 = v73;
  int v44 = v74;
  uint64_t v49 = v75;
  uint64_t v48 = v76;
  LOBYTE(a1) = sub_10001EFC0();
  unsigned __int8 v17 = sub_10001EFD0();
  char v18 = sub_10001EFF0();
  sub_10001EFF0();
  if (sub_10001EFF0() != a1) {
    char v18 = sub_10001EFF0();
  }
  sub_10001EFF0();
  if (sub_10001EFF0() != v17) {
    char v18 = sub_10001EFF0();
  }
  sub_10001ED10();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  unsigned __int8 v27 = sub_10001EFE0();
  unsigned __int8 v28 = sub_10001F000();
  char v29 = sub_10001EFF0();
  sub_10001EFF0();
  if (sub_10001EFF0() != v27) {
    char v29 = sub_10001EFF0();
  }
  sub_10001EFF0();
  if (sub_10001EFF0() != v28) {
    char v29 = sub_10001EFF0();
  }
  char v60 = v45;
  char v59 = v44;
  char v58 = 0;
  sub_10001ED10();
  *(void *)&long long v61 = v13;
  *((void *)&v61 + 1) = v16;
  unsigned __int8 v30 = v53;
  *(void *)&long long v62 = v53;
  *((void *)&v62 + 1) = v56;
  *(void *)&long long v63 = v46;
  BYTE8(v63) = v60;
  *(void *)&long long v64 = v47;
  BYTE8(v64) = v59;
  *(void *)&long long v65 = v49;
  *((void *)&v65 + 1) = v48;
  LOBYTE(v66) = v18;
  *((void *)&v66 + 1) = v20;
  *(void *)&long long v67 = v22;
  *((void *)&v67 + 1) = v24;
  *(void *)&long long v68 = v26;
  BYTE8(v68) = v58;
  LOBYTE(v69) = v29;
  *((void *)&v69 + 1) = v31;
  *(void *)uint64_t v70 = v32;
  *(void *)&v70[8] = v33;
  *(void *)&v70[16] = v34;
  v70[24] = 0;
  uint64_t v35 = v54;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for RoundedCornerStyle.continuous(_:), v54);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v10 + *(int *)(v50 + 20), v8, v35);
  *double v10 = a3;
  v10[1] = a3;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v35);
  uint64_t v36 = v52;
  sub_1000130E4((uint64_t)v10, v52);
  *(_WORD *)(v36 + *(int *)(v55 + 36)) = 256;
  sub_10000B308(v36, (uint64_t)v12 + *(int *)(v51 + 36), &qword_10002C398);
  long long v37 = v68;
  long long v38 = *(_OWORD *)v70;
  v12[8] = v69;
  v12[9] = v38;
  *(_OWORD *)((char *)v12 + 153) = *(_OWORD *)&v70[9];
  long long v39 = v66;
  v12[4] = v65;
  v12[5] = v39;
  v12[6] = v67;
  v12[7] = v37;
  long long v40 = v62;
  *double v12 = v61;
  v12[1] = v40;
  long long v41 = v64;
  v12[2] = v63;
  v12[3] = v41;
  sub_10000AC40((uint64_t)&v61);
  sub_10000B36C(v36, &qword_10002C398);
  sub_100013964((uint64_t)v10, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  swift_release();
  swift_bridgeObjectRelease();

  return sub_10000B2A4((uint64_t)v12, v57, &qword_10002C3A0);
}

uint64_t sub_10000E740(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10001F490();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000590C(&qword_10002C6F0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E8E4(a2, (uint64_t)v9);
  sub_10001F480();
  sub_100013358(&qword_10002C6F8, &qword_10002C6F0, (void (*)(void))sub_1000133E0, (void (*)(void))sub_10001355C);
  sub_10001F130();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_10000B36C((uint64_t)v9, &qword_10002C6F0);
}

uint64_t sub_10000E8E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v149 = a2;
  uint64_t v131 = sub_10001F110();
  uint64_t v130 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  uint64_t v129 = (char *)&v118 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000590C(&qword_10002C7A8);
  __chkstk_darwin(v4 - 8);
  uint64_t v126 = (char *)&v118 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = sub_10000590C(&qword_10002C7B0);
  __chkstk_darwin(v123);
  uint64_t v128 = (char *)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_10000590C(&qword_10002C7B8);
  __chkstk_darwin(v124);
  uint64_t v127 = (uint64_t)&v118 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_10000590C(&qword_10002C7C0);
  uint64_t v8 = __chkstk_darwin(v125);
  uint64_t v133 = (uint64_t)&v118 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v132 = (uint64_t)&v118 - v10;
  uint64_t v11 = sub_10000590C(&qword_10002C788);
  __chkstk_darwin(v11 - 8);
  v135 = (uint64_t *)((char *)&v118 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v142 = sub_10000590C(&qword_10002C778);
  uint64_t v13 = __chkstk_darwin(v142);
  uint64_t v134 = (uint64_t)&v118 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v136 = (uint64_t)&v118 - v15;
  uint64_t v140 = sub_10000590C(&qword_10002C7C8);
  __chkstk_darwin(v140);
  uint64_t v141 = (uint64_t)&v118 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000590C(&qword_10002C7D0);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v119 = (uint64_t)&v118 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v118 = (uint64_t *)((char *)&v118 - v20);
  uint64_t v21 = sub_10000590C(&qword_10002C768);
  __chkstk_darwin(v21 - 8);
  uint64_t v121 = (uint64_t *)((char *)&v118 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v138 = sub_10000590C(&qword_10002C758);
  uint64_t v23 = __chkstk_darwin(v138);
  uint64_t v120 = (uint64_t)&v118 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v122 = (uint64_t)&v118 - v25;
  uint64_t v148 = sub_10000590C(&qword_10002C748);
  __chkstk_darwin(v148);
  v139 = (char *)&v118 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10000590C(&qword_10002C3E8);
  __chkstk_darwin(v27 - 8);
  char v29 = (char *)&v118 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = sub_10000590C(&qword_10002C738);
  uint64_t v30 = __chkstk_darwin(v146);
  uint64_t v32 = (char *)&v118 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v137 = (uint64_t)&v118 - v33;
  uint64_t v150 = sub_10000590C(&qword_10002C7D8);
  __chkstk_darwin(v150);
  uint64_t v147 = (uint64_t)&v118 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = sub_10000590C(&qword_10002C7E0);
  __chkstk_darwin(v143);
  uint64_t v144 = (uint64_t)&v118 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = sub_10000590C(&qword_10002C708);
  __chkstk_darwin(v151);
  v145 = (char *)&v118 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_10000590C(&qword_10002C3F0);
  uint64_t v38 = __chkstk_darwin(v37 - 8);
  long long v40 = (char *)&v118 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v38);
  uint64_t v42 = (char *)&v118 - v41;
  uint64_t v43 = sub_10000590C(&qword_10002C728);
  __chkstk_darwin(v43 - 8);
  int v45 = (char *)&v118 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_10000590C(&qword_10002C718);
  uint64_t v47 = __chkstk_darwin(v46);
  uint64_t v49 = (char *)&v118 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v47);
  uint64_t v51 = (char *)&v118 - v50;
  uint64_t v52 = a1;
  uint64_t v53 = *(void *)(sub_10001EC00() + 16);
  swift_bridgeObjectRelease();
  if (v53)
  {
    uint64_t v54 = v144;
    uint64_t v55 = (uint64_t)v145;
    uint64_t v56 = v146;
    unint64_t v57 = *(void *)(sub_10001EC00() + 16);
    swift_bridgeObjectRelease();
    if (v57 > 2)
    {
      if (sub_10001EC90())
      {
        uint64_t v72 = sub_10001EEA0();
        uint64_t v73 = (uint64_t)v121;
        *uint64_t v121 = v72;
        *(void *)(v73 + 8) = 0;
        *(unsigned char *)(v73 + 16) = 0;
        uint64_t v74 = v73 + *(int *)(sub_10000590C(&qword_10002C800) + 44);
        uint64_t v75 = sub_10001EED0();
        uint64_t v76 = (uint64_t)v118;
        *uint64_t v118 = v75;
        *(void *)(v76 + 8) = 0;
        *(unsigned char *)(v76 + 16) = 0;
        uint64_t v77 = sub_10000590C(&qword_10002C808);
        sub_100010CAC(v52, v76 + *(int *)(v77 + 44));
        uint64_t v78 = v119;
        sub_10000B308(v76, v119, &qword_10002C7D0);
        sub_10000B308(v78, v74, &qword_10002C7D0);
        uint64_t v79 = v74 + *(int *)(sub_10000590C(&qword_10002C810) + 48);
        *(void *)uint64_t v79 = 0;
        *(unsigned char *)(v79 + 8) = 0;
        sub_10000B36C(v76, &qword_10002C7D0);
        sub_10000B36C(v78, &qword_10002C7D0);
        sub_100013794(v52);
        unint64_t v80 = PKUIGetMinScreenWidthType();
        sub_100013948(v80);
        sub_10001F2C0();
        sub_10001ED50();
        uint64_t v81 = v120;
        sub_10000B308(v73, v120, &qword_10002C768);
        char v82 = (_OWORD *)(v81 + *(int *)(v138 + 36));
        long long v83 = v156;
        *char v82 = v155;
        v82[1] = v83;
        v82[2] = v157;
        sub_10000B36C(v73, &qword_10002C768);
        long long v84 = &qword_10002C758;
        uint64_t v85 = v122;
        sub_10000B2A4(v81, v122, &qword_10002C758);
        sub_10000B308(v85, v141, &qword_10002C758);
      }
      else
      {
        uint64_t v87 = sub_10001EED0();
        uint64_t v88 = (uint64_t)v135;
        uint64_t *v135 = v87;
        *(void *)(v88 + 8) = 0;
        *(unsigned char *)(v88 + 16) = 0;
        uint64_t v89 = v88 + *(int *)(sub_10000590C(&qword_10002C7E8) + 44);
        char v90 = sub_10001EFA0();
        uint64_t v91 = (uint64_t)v126;
        *uint64_t v126 = v90;
        uint64_t v92 = sub_10000590C(&qword_10002C7F0);
        sub_100011AA4(v52, v91 + *(int *)(v92 + 44));
        uint64_t v93 = v130;
        unsigned __int8 v94 = v129;
        uint64_t v95 = v131;
        (*(void (**)(char *, void, uint64_t))(v130 + 104))(v129, enum case for Text.TruncationMode.tail(_:), v131);
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v97 = (uint64_t)v128;
        uint64_t v98 = (uint64_t *)&v128[*(int *)(v123 + 36)];
        uint64_t v99 = sub_10000590C(&qword_10002C428);
        (*(void (**)(char *, char *, uint64_t))(v93 + 16))((char *)v98 + *(int *)(v99 + 28), v94, v95);
        uint64_t *v98 = KeyPath;
        sub_10000B308(v91, v97, &qword_10002C7A8);
        (*(void (**)(char *, uint64_t))(v93 + 8))(v94, v95);
        sub_10000B36C(v91, &qword_10002C7A8);
        uint64_t v100 = swift_getKeyPath();
        uint64_t v101 = v52;
        uint64_t v102 = v127;
        sub_10000B308(v97, v127, &qword_10002C7B0);
        uint64_t v103 = v102 + *(int *)(v124 + 36);
        *(void *)uint64_t v103 = v100;
        *(unsigned char *)(v103 + 8) = 0;
        sub_10000B36C(v97, &qword_10002C7B0);
        uint64_t v104 = sub_10001F200();
        uint64_t v105 = v133;
        sub_10000B308(v102, v133, &qword_10002C7B8);
        *(void *)(v105 + *(int *)(v125 + 36)) = v104;
        sub_10000B36C(v102, &qword_10002C7B8);
        uint64_t v106 = v132;
        sub_10000B2A4(v105, v132, &qword_10002C7C0);
        uint64_t v107 = sub_10001EC00();
        sub_100017C4C(v107, 3, 0x402C000000000000, 0, (uint64_t)v152, 0.0);
        swift_bridgeObjectRelease();
        sub_10000B308(v106, v105, &qword_10002C7C0);
        uint64_t v109 = v152[0];
        uint64_t v108 = v152[1];
        uint64_t v110 = v152[2];
        LOBYTE(v94) = v153;
        uint64_t v111 = v154;
        sub_10000B308(v105, v89, &qword_10002C7C0);
        uint64_t v112 = v89 + *(int *)(sub_10000590C(&qword_10002C7F8) + 48);
        *(void *)uint64_t v112 = v109;
        *(void *)(v112 + 8) = v108;
        *(void *)(v112 + 16) = v110;
        *(unsigned char *)(v112 + 24) = v94 & 1;
        *(void *)(v112 + 32) = v111;
        swift_bridgeObjectRetain();
        sub_10000B36C(v106, &qword_10002C7C0);
        swift_bridgeObjectRelease();
        sub_10000B36C(v105, &qword_10002C7C0);
        sub_100013794(v101);
        unint64_t v113 = PKUIGetMinScreenWidthType();
        sub_100013948(v113);
        sub_10001F2C0();
        sub_10001ED50();
        uint64_t v114 = v134;
        sub_10000B308(v88, v134, &qword_10002C788);
        uint64_t v115 = (_OWORD *)(v114 + *(int *)(v142 + 36));
        long long v116 = v156;
        *uint64_t v115 = v155;
        v115[1] = v116;
        v115[2] = v157;
        sub_10000B36C(v88, &qword_10002C788);
        long long v84 = &qword_10002C778;
        uint64_t v85 = v136;
        sub_10000B2A4(v114, v136, &qword_10002C778);
        sub_10000B308(v85, v141, &qword_10002C778);
      }
      swift_storeEnumTagMultiPayload();
      sub_100013598();
      sub_100013638();
      uint64_t v86 = (uint64_t)v139;
      sub_10001EF80();
      sub_10000B36C(v85, v84);
      long long v62 = &qword_10002C748;
      sub_10000B308(v86, v147, &qword_10002C748);
      swift_storeEnumTagMultiPayload();
      sub_1000133E0();
      sub_10001355C();
      sub_10001EF80();
      uint64_t v64 = v86;
    }
    else
    {
      *(void *)char v29 = sub_10001EEA0();
      *((void *)v29 + 1) = 0;
      v29[16] = 0;
      uint64_t v58 = sub_10000590C(&qword_10002C468);
      sub_100010858(v52, (uint64_t)&v29[*(int *)(v58 + 44)]);
      sub_100013794(v52);
      unint64_t v59 = PKUIGetMinScreenWidthType();
      sub_100013948(v59);
      sub_10001F2C0();
      sub_10001ED50();
      sub_10000B308((uint64_t)v29, (uint64_t)v32, &qword_10002C3E8);
      char v60 = &v32[*(int *)(v56 + 36)];
      long long v61 = v156;
      *(_OWORD *)char v60 = v155;
      *((_OWORD *)v60 + 1) = v61;
      *((_OWORD *)v60 + 2) = v157;
      sub_10000B36C((uint64_t)v29, &qword_10002C3E8);
      long long v62 = &qword_10002C738;
      uint64_t v63 = v137;
      sub_10000B2A4((uint64_t)v32, v137, &qword_10002C738);
      sub_10000B308(v63, v54, &qword_10002C738);
      swift_storeEnumTagMultiPayload();
      sub_10001341C();
      sub_1000134BC();
      sub_10001EF80();
      sub_10000B308(v55, v147, &qword_10002C708);
      swift_storeEnumTagMultiPayload();
      sub_1000133E0();
      sub_10001355C();
      sub_10001EF80();
      sub_10000B36C(v55, &qword_10002C708);
      uint64_t v64 = v63;
    }
  }
  else
  {
    *(void *)int v45 = sub_10001EEA0();
    *((void *)v45 + 1) = 0;
    v45[16] = 0;
    uint64_t v65 = (uint64_t)&v45[*(int *)(sub_10000590C(&qword_10002C818) + 44)];
    *(void *)uint64_t v42 = sub_10001EED0();
    *((void *)v42 + 1) = 0;
    v42[16] = 0;
    uint64_t v66 = sub_10000590C(&qword_10002C470);
    sub_10000FB68(v52, (uint64_t)&v42[*(int *)(v66 + 44)]);
    sub_10000B308((uint64_t)v42, (uint64_t)v40, &qword_10002C3F0);
    sub_10000B308((uint64_t)v40, v65, &qword_10002C3F0);
    uint64_t v67 = v65 + *(int *)(sub_10000590C(&qword_10002C820) + 48);
    *(void *)uint64_t v67 = 0;
    *(unsigned char *)(v67 + 8) = 0;
    sub_10000B36C((uint64_t)v42, &qword_10002C3F0);
    sub_10000B36C((uint64_t)v40, &qword_10002C3F0);
    sub_100013794(v52);
    unint64_t v68 = PKUIGetMinScreenWidthType();
    sub_100013948(v68);
    sub_10001F2C0();
    sub_10001ED50();
    sub_10000B308((uint64_t)v45, (uint64_t)v49, &qword_10002C728);
    long long v69 = &v49[*(int *)(v46 + 36)];
    long long v70 = v156;
    *(_OWORD *)long long v69 = v155;
    *((_OWORD *)v69 + 1) = v70;
    *((_OWORD *)v69 + 2) = v157;
    sub_10000B36C((uint64_t)v45, &qword_10002C728);
    long long v62 = &qword_10002C718;
    sub_10000B2A4((uint64_t)v49, (uint64_t)v51, &qword_10002C718);
    sub_10000B308((uint64_t)v51, v144, &qword_10002C718);
    swift_storeEnumTagMultiPayload();
    sub_10001341C();
    sub_1000134BC();
    uint64_t v71 = (uint64_t)v145;
    sub_10001EF80();
    sub_10000B308(v71, v147, &qword_10002C708);
    swift_storeEnumTagMultiPayload();
    sub_1000133E0();
    sub_10001355C();
    sub_10001EF80();
    sub_10000B36C(v71, &qword_10002C708);
    uint64_t v64 = (uint64_t)v51;
  }
  return sub_10000B36C(v64, v62);
}

uint64_t sub_10000FB68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v116 = a1;
  uint64_t v126 = a2;
  uint64_t v98 = sub_10000590C(&qword_10002C428);
  __chkstk_darwin(v98);
  uint64_t v102 = (void *)((char *)v96 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v101 = sub_10001F110();
  uint64_t v100 = *(void *)(v101 - 8);
  __chkstk_darwin(v101);
  uint64_t v99 = (char *)v96 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_10000590C(&qword_10002C4C8);
  __chkstk_darwin(v97);
  uint64_t v103 = (char *)v96 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_10000590C(&qword_10002C4D0);
  __chkstk_darwin(v105);
  uint64_t v104 = (uint64_t)v96 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = sub_10000590C(&qword_10002C4D8);
  uint64_t v112 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  uint64_t v110 = (char *)v96 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_10000590C(&qword_10002C4E0);
  __chkstk_darwin(v107);
  uint64_t v109 = (char *)v96 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_10000590C(&qword_10002C4E8);
  __chkstk_darwin(v108);
  uint64_t v111 = (uint64_t)v96 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000590C(&qword_10002C4F0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v123 = v9;
  uint64_t v124 = v10;
  __chkstk_darwin(v9);
  uint64_t v106 = (uint64_t)v96 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000590C(&qword_10002C4F8);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v125 = (uint64_t)v96 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v122 = (uint64_t)v96 - v15;
  uint64_t v128 = sub_10001F0D0();
  uint64_t v130 = *(void *)(v128 - 8);
  __chkstk_darwin(v128);
  uint64_t v127 = (char *)v96 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000590C(&qword_10002C480);
  uint64_t v120 = *(void (***)(char *, char *, char *))(v17 - 8);
  uint64_t v121 = (char *)v17;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)v96 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_10000590C(&qword_10002C488) - 8;
  __chkstk_darwin(v117);
  uint64_t v114 = (char *)v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_10000590C(&qword_10002C490) - 8;
  __chkstk_darwin(v119);
  uint64_t v115 = (uint64_t)v96 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = sub_10000590C(&qword_10002C498) - 8;
  uint64_t v22 = __chkstk_darwin(v118);
  uint64_t v24 = (char *)v96 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v129 = (uint64_t)v96 - v25;
  uint64_t v131 = sub_10001ECB0();
  uint64_t v132 = v26;
  v96[1] = sub_100005FA4();
  uint64_t v27 = sub_10001F120();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  char v33 = v32 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v131 = v27;
  uint64_t v132 = v29;
  char v133 = v33;
  uint64_t v134 = v31;
  uint64_t v135 = KeyPath;
  uint64_t v136 = 1;
  char v137 = 0;
  sub_10001F090();
  sub_10000590C(&qword_10002C4A0);
  sub_10000AE84();
  sub_10001F180();
  sub_10000AF24(v27, v29, v33);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10001F020();
  int v35 = enum case for Font.Leading.tight(_:);
  uint64_t v36 = v130;
  uint64_t v37 = v130 + 104;
  uint64_t v38 = v127;
  uint64_t v39 = v128;
  v96[0] = *(void *)(v130 + 104);
  ((void (*)(char *, void, uint64_t))v96[0])(v127, enum case for Font.Leading.tight(_:), v128);
  uint64_t v40 = sub_10001F0E0();
  swift_release();
  uint64_t v41 = v36 + 8;
  uint64_t v42 = *(void (***)(char *, char *, char *))(v36 + 8);
  uint64_t v130 = v41;
  ((void (*)(char *, uint64_t))v42)(v38, v39);
  uint64_t v43 = swift_getKeyPath();
  int v45 = v120;
  uint64_t v44 = (uint64_t)v121;
  uint64_t v46 = (uint64_t)v114;
  v120[2](v114, v19, v121);
  uint64_t v47 = (uint64_t *)(v46 + *(int *)(v117 + 44));
  *uint64_t v47 = v43;
  v47[1] = v40;
  ((void (*)(char *, uint64_t))v45[1])(v19, v44);
  uint64_t v48 = sub_10001F200();
  uint64_t v49 = v115;
  sub_10000B308(v46, v115, &qword_10002C488);
  *(void *)(v49 + *(int *)(v119 + 44)) = v48;
  sub_10000B36C(v46, &qword_10002C488);
  uint64_t v50 = swift_getKeyPath();
  sub_10000B308(v49, (uint64_t)v24, &qword_10002C490);
  uint64_t v51 = (uint64_t *)&v24[*(int *)(v118 + 44)];
  *uint64_t v51 = v50;
  v51[1] = 0x3FE999999999999ALL;
  sub_10000B36C(v49, &qword_10002C490);
  uint64_t v121 = v24;
  sub_10000B2A4((uint64_t)v24, v129, &qword_10002C498);
  uint64_t v52 = sub_10001EC50();
  if (v53)
  {
    uint64_t v131 = v52;
    uint64_t v132 = v53;
    uint64_t v54 = sub_10001F120();
    uint64_t v119 = v37;
    uint64_t v56 = v55;
    uint64_t v117 = v57;
    char v59 = v58 & 1;
    uint64_t v60 = swift_getKeyPath();
    LODWORD(v118) = v35;
    uint64_t v61 = v60;
    uint64_t v120 = v42;
    uint64_t v62 = v100;
    uint64_t v63 = v99;
    uint64_t v64 = v101;
    (*(void (**)(char *, void, uint64_t))(v100 + 104))(v99, enum case for Text.TruncationMode.tail(_:), v101);
    uint64_t v65 = swift_getKeyPath();
    uint64_t v66 = v102;
    (*(void (**)(char *, char *, uint64_t))(v62 + 16))((char *)v102 + *(int *)(v98 + 28), v63, v64);
    *uint64_t v66 = v65;
    uint64_t v67 = (uint64_t)v103;
    sub_10000B308((uint64_t)v66, (uint64_t)&v103[*(int *)(v97 + 36)], &qword_10002C428);
    *(void *)uint64_t v67 = v54;
    *(void *)(v67 + 8) = v56;
    *(unsigned char *)(v67 + 16) = v59;
    *(void *)(v67 + 24) = v117;
    *(void *)(v67 + 32) = v61;
    *(void *)(v67 + 40) = 1;
    *(unsigned char *)(v67 + 48) = 0;
    sub_10000AF44(v54, v56, v59);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_10000B36C((uint64_t)v66, &qword_10002C428);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v63, v64);
    sub_10000AF24(v54, v56, v59);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v68 = swift_getKeyPath();
    uint64_t v69 = v104;
    sub_10000B308(v67, v104, &qword_10002C4C8);
    uint64_t v70 = v69 + *(int *)(v105 + 36);
    *(void *)uint64_t v70 = v68;
    *(unsigned char *)(v70 + 8) = 2;
    sub_10000B36C(v67, &qword_10002C4C8);
    sub_10001F060();
    sub_10000AF54();
    uint64_t v71 = v110;
    sub_10001F180();
    sub_10000B36C(v69, &qword_10002C4D0);
    sub_10001F030();
    uint64_t v73 = v127;
    uint64_t v72 = v128;
    ((void (*)(char *, void, uint64_t))v96[0])(v127, v118, v128);
    uint64_t v74 = sub_10001F0E0();
    swift_release();
    ((void (*)(char *, uint64_t))v120)(v73, v72);
    uint64_t v75 = swift_getKeyPath();
    uint64_t v76 = v112;
    uint64_t v77 = (uint64_t)v109;
    uint64_t v78 = v113;
    (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v109, v71, v113);
    uint64_t v79 = (uint64_t *)(v77 + *(int *)(v107 + 36));
    *uint64_t v79 = v75;
    v79[1] = v74;
    (*(void (**)(char *, uint64_t))(v76 + 8))(v71, v78);
    uint64_t v80 = sub_10001F1E0();
    uint64_t v81 = v111;
    sub_10000B308(v77, v111, &qword_10002C4E0);
    *(void *)(v81 + *(int *)(v108 + 36)) = v80;
    sub_10000B36C(v77, &qword_10002C4E0);
    uint64_t v82 = swift_getKeyPath();
    uint64_t v83 = v106;
    sub_10000B308(v81, v106, &qword_10002C4E8);
    uint64_t v84 = v123;
    uint64_t v85 = (uint64_t *)(v83 + *(int *)(v123 + 36));
    *uint64_t v85 = v82;
    v85[1] = 0x3FE999999999999ALL;
    sub_10000B36C(v81, &qword_10002C4E8);
    uint64_t v86 = v83;
    uint64_t v87 = v122;
    sub_10000B2A4(v86, v122, &qword_10002C4F0);
    uint64_t v88 = 0;
    uint64_t v89 = v84;
  }
  else
  {
    uint64_t v87 = v122;
    uint64_t v89 = v123;
    uint64_t v88 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v124 + 56))(v87, v88, 1, v89);
  uint64_t v90 = v129;
  uint64_t v91 = (uint64_t)v121;
  sub_10000B308(v129, (uint64_t)v121, &qword_10002C498);
  uint64_t v92 = v125;
  sub_10000B308(v87, v125, &qword_10002C4F8);
  uint64_t v93 = v126;
  sub_10000B308(v91, v126, &qword_10002C498);
  uint64_t v94 = sub_10000590C(&qword_10002C500);
  sub_10000B308(v92, v93 + *(int *)(v94 + 48), &qword_10002C4F8);
  sub_10000B36C(v87, &qword_10002C4F8);
  sub_10000B36C(v90, &qword_10002C498);
  sub_10000B36C(v92, &qword_10002C4F8);
  return sub_10000B36C(v91, &qword_10002C498);
}

uint64_t sub_100010858@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v44 = a2;
  uint64_t v43 = sub_10001F110();
  uint64_t v3 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000590C(&qword_10002C3B0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000590C(&qword_10002C3B8);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000590C(&qword_10002C3C0);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_10000590C(&qword_10002C3C8) - 8;
  uint64_t v17 = __chkstk_darwin(v42);
  uint64_t v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v41 = (uint64_t)&v40 - v20;
  *uint64_t v8 = sub_10001EFA0();
  uint64_t v21 = sub_10000590C(&qword_10002C420);
  sub_10001144C(a1, (uint64_t)&v8[*(int *)(v21 + 44)]);
  uint64_t v22 = v43;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Text.TruncationMode.tail(_:), v43);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v24 = (uint64_t *)&v12[*(int *)(v10 + 44)];
  uint64_t v25 = sub_10000590C(&qword_10002C428);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v24 + *(int *)(v25 + 28), v5, v22);
  *uint64_t v24 = KeyPath;
  sub_10000B308((uint64_t)v8, (uint64_t)v12, &qword_10002C3B0);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v22);
  sub_10000B36C((uint64_t)v8, &qword_10002C3B0);
  uint64_t v26 = swift_getKeyPath();
  sub_10000B308((uint64_t)v12, (uint64_t)v16, &qword_10002C3B8);
  uint64_t v27 = &v16[*(int *)(v14 + 44)];
  *(void *)uint64_t v27 = v26;
  v27[8] = 0;
  sub_10000B36C((uint64_t)v12, &qword_10002C3B8);
  uint64_t v28 = sub_10001F200();
  sub_10000B308((uint64_t)v16, (uint64_t)v19, &qword_10002C3C0);
  *(void *)&v19[*(int *)(v42 + 44)] = v28;
  sub_10000B36C((uint64_t)v16, &qword_10002C3C0);
  uint64_t v29 = v41;
  sub_10000B2A4((uint64_t)v19, v41, &qword_10002C3C8);
  uint64_t v30 = sub_10001EC00();
  sub_100017C4C(v30, 3, 0, 1, (uint64_t)v45, 20.0);
  swift_bridgeObjectRelease();
  sub_10000B308(v29, (uint64_t)v19, &qword_10002C3C8);
  uint64_t v31 = v45[0];
  uint64_t v32 = v45[1];
  uint64_t v33 = v45[2];
  LOBYTE(KeyPath) = v46;
  uint64_t v34 = v47;
  uint64_t v35 = v44;
  sub_10000B308((uint64_t)v19, v44, &qword_10002C3C8);
  uint64_t v36 = sub_10000590C(&qword_10002C530);
  uint64_t v37 = v35 + *(int *)(v36 + 48);
  *(void *)uint64_t v37 = 0x402C000000000000;
  *(unsigned char *)(v37 + 8) = 0;
  uint64_t v38 = v35 + *(int *)(v36 + 64);
  *(void *)uint64_t v38 = v31;
  *(void *)(v38 + 8) = v32;
  *(void *)(v38 + 16) = v33;
  *(unsigned char *)(v38 + 24) = KeyPath & 1;
  *(void *)(v38 + 32) = v34;
  swift_bridgeObjectRetain();
  sub_10000B36C(v29, &qword_10002C3C8);
  swift_bridgeObjectRelease();
  return sub_10000B36C((uint64_t)v19, &qword_10002C3C8);
}

void sub_100010CAC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v79 = a2;
  uint64_t v3 = sub_10000590C(&qword_10002C828);
  uint64_t v75 = *(void *)(v3 - 8);
  uint64_t v76 = v3;
  __chkstk_darwin(v3);
  uint64_t v73 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_10000590C(&qword_10002C830);
  __chkstk_darwin(v71);
  uint64_t v74 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_10000590C(&qword_10002C838);
  uint64_t v6 = __chkstk_darwin(v72);
  uint64_t v78 = (uint64_t)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v70 = (uint64_t)&v68 - v9;
  __chkstk_darwin(v8);
  uint64_t v77 = (uint64_t)&v68 - v10;
  uint64_t v11 = sub_10001F110();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000590C(&qword_10002C3B0);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10000590C(&qword_10002C3B8);
  uint64_t v19 = v18 - 8;
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v68 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_10000590C(&qword_10002C3C0);
  uint64_t v23 = v22 - 8;
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v68 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_10000590C(&qword_10002C3C8) - 8;
  uint64_t v26 = __chkstk_darwin(v80);
  uint64_t v69 = (uint64_t)&v68 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v30 = (char *)&v68 - v29;
  __chkstk_darwin(v28);
  uint64_t v81 = (uint64_t)&v68 - v31;
  *uint64_t v17 = sub_10001EFA0();
  uint64_t v32 = sub_10000590C(&qword_10002C420);
  sub_10001144C(a1, (uint64_t)&v17[*(int *)(v32 + 44)]);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for Text.TruncationMode.tail(_:), v11);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v34 = (uint64_t *)&v21[*(int *)(v19 + 44)];
  uint64_t v35 = sub_10000590C(&qword_10002C428);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))((char *)v34 + *(int *)(v35 + 28), v14, v11);
  *uint64_t v34 = KeyPath;
  sub_10000B308((uint64_t)v17, (uint64_t)v21, &qword_10002C3B0);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_10000B36C((uint64_t)v17, &qword_10002C3B0);
  uint64_t v36 = swift_getKeyPath();
  sub_10000B308((uint64_t)v21, (uint64_t)v25, &qword_10002C3B8);
  uint64_t v37 = &v25[*(int *)(v23 + 44)];
  *(void *)uint64_t v37 = v36;
  v37[8] = 2;
  sub_10000B36C((uint64_t)v21, &qword_10002C3B8);
  uint64_t v38 = sub_10001F200();
  sub_10000B308((uint64_t)v25, (uint64_t)v30, &qword_10002C3C0);
  *(void *)&v30[*(int *)(v80 + 44)] = v38;
  sub_10000B36C((uint64_t)v25, &qword_10002C3C0);
  sub_10000B2A4((uint64_t)v30, v81, &qword_10002C3C8);
  uint64_t v39 = (NSString *)sub_10001F4C0();
  id v40 = (id)PKLocalizedTicketingString(v39);

  if (v40)
  {
    uint64_t v41 = sub_10001F4F0();
    uint64_t v43 = v42;

    uint64_t v82 = v41;
    uint64_t v83 = v43;
    sub_100005FA4();
    uint64_t v44 = sub_10001F120();
    uint64_t v46 = v45;
    uint64_t v48 = v47;
    uint64_t v80 = v47;
    char v50 = v49 & 1;
    uint64_t v51 = swift_getKeyPath();
    uint64_t v52 = sub_10001F030();
    uint64_t v53 = swift_getKeyPath();
    uint64_t v82 = v44;
    uint64_t v83 = v46;
    char v84 = v50;
    uint64_t v85 = v48;
    uint64_t v86 = v51;
    uint64_t v87 = 1;
    char v88 = 0;
    uint64_t v89 = v53;
    uint64_t v90 = v52;
    sub_10001F080();
    sub_10000590C(&qword_10002C688);
    sub_1000131B4();
    uint64_t v54 = v73;
    sub_10001F180();
    sub_10000AF24(v44, v46, v50);
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v55 = sub_10001F1E0();
    uint64_t v57 = (uint64_t)v74;
    uint64_t v56 = v75;
    uint64_t v58 = v76;
    (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v74, v54, v76);
    *(void *)(v57 + *(int *)(v71 + 36)) = v55;
    (*(void (**)(char *, uint64_t))(v56 + 8))(v54, v58);
    uint64_t v59 = swift_getKeyPath();
    uint64_t v60 = v70;
    sub_10000B308(v57, v70, &qword_10002C830);
    uint64_t v61 = (uint64_t *)(v60 + *(int *)(v72 + 36));
    *uint64_t v61 = v59;
    v61[1] = 0x3FE999999999999ALL;
    sub_10000B36C(v57, &qword_10002C830);
    uint64_t v62 = v77;
    sub_10000B2A4(v60, v77, &qword_10002C838);
    uint64_t v63 = v81;
    uint64_t v64 = v69;
    sub_10000B308(v81, v69, &qword_10002C3C8);
    uint64_t v65 = v78;
    sub_10000B308(v62, v78, &qword_10002C838);
    uint64_t v66 = v79;
    sub_10000B308(v64, v79, &qword_10002C3C8);
    uint64_t v67 = sub_10000590C(&qword_10002C840);
    sub_10000B308(v65, v66 + *(int *)(v67 + 48), &qword_10002C838);
    sub_10000B36C(v62, &qword_10002C838);
    sub_10000B36C(v63, &qword_10002C3C8);
    sub_10000B36C(v65, &qword_10002C838);
    sub_10000B36C(v64, &qword_10002C3C8);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10001144C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v62 = a1;
  uint64_t v66 = a2;
  uint64_t v65 = sub_10000590C(&qword_10002C538) - 8;
  uint64_t v2 = __chkstk_darwin(v65);
  uint64_t v63 = (uint64_t)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v64 = (uint64_t)&v52 - v4;
  uint64_t v67 = sub_10001F0D0();
  uint64_t v72 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  uint64_t v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_10000590C(&qword_10002C480);
  uint64_t v73 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v71 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_10000590C(&qword_10002C488) - 8;
  uint64_t v8 = __chkstk_darwin(v69);
  uint64_t v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v70 = (uint64_t)&v52 - v11;
  uint64_t v74 = sub_10001ECB0();
  uint64_t v75 = v12;
  unint64_t v61 = sub_100005FA4();
  uint64_t v13 = sub_10001F120();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v74 = v13;
  uint64_t v75 = v15;
  char v76 = v19;
  uint64_t v77 = v17;
  uint64_t v78 = KeyPath;
  uint64_t v79 = 1;
  char v80 = 0;
  sub_10001F060();
  uint64_t v60 = sub_10000590C(&qword_10002C4A0);
  unint64_t v59 = sub_10000AE84();
  sub_10001F180();
  sub_10000AF24(v13, v15, v19);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10001F0C0();
  unsigned int v58 = enum case for Font.Leading.tight(_:);
  uint64_t v21 = v72;
  uint64_t v57 = *(void (**)(char *))(v72 + 104);
  uint64_t v22 = v67;
  v57(v6);
  uint64_t v53 = v6;
  uint64_t v23 = sub_10001F0E0();
  swift_release();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v21 + 8);
  uint64_t v72 = v21 + 8;
  uint64_t v56 = v24;
  v24(v6, v22);
  uint64_t v25 = swift_getKeyPath();
  uint64_t v26 = v73;
  uint64_t v55 = *(void (**)(char *, char *, uint64_t))(v73 + 16);
  uint64_t v27 = v71;
  uint64_t v28 = v68;
  v55(v10, v71, v68);
  uint64_t v29 = (uint64_t *)&v10[*(int *)(v69 + 44)];
  *uint64_t v29 = v25;
  v29[1] = v23;
  uint64_t v30 = *(void (**)(char *, uint64_t))(v26 + 8);
  uint64_t v73 = v26 + 8;
  uint64_t v54 = v30;
  v30(v27, v28);
  sub_10000B2A4((uint64_t)v10, v70, &qword_10002C488);
  uint64_t v74 = sub_10001ECB0();
  uint64_t v75 = v31;
  uint64_t v32 = sub_10001F120();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  LOBYTE(v15) = v37 & 1;
  uint64_t v38 = swift_getKeyPath();
  uint64_t v74 = v32;
  uint64_t v75 = v34;
  char v76 = v15;
  uint64_t v77 = v36;
  uint64_t v78 = v38;
  uint64_t v79 = 2;
  char v80 = 0;
  sub_10001F090();
  sub_10001F180();
  sub_10000AF24(v32, v34, v15);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10001F020();
  uint64_t v39 = v53;
  uint64_t v40 = v67;
  ((void (*)(char *, void, uint64_t))v57)(v53, v58, v67);
  uint64_t v41 = sub_10001F0E0();
  swift_release();
  v56(v39, v40);
  uint64_t v42 = swift_getKeyPath();
  uint64_t v43 = v71;
  uint64_t v44 = v68;
  v55(v10, v71, v68);
  uint64_t v45 = (uint64_t *)&v10[*(int *)(v69 + 44)];
  *uint64_t v45 = v42;
  v45[1] = v41;
  v54(v43, v44);
  uint64_t v46 = v63;
  sub_10000B308((uint64_t)v10, v63, &qword_10002C488);
  *(_WORD *)(v46 + *(int *)(v65 + 44)) = 256;
  sub_10000B36C((uint64_t)v10, &qword_10002C488);
  uint64_t v47 = v64;
  sub_10000B2A4(v46, v64, &qword_10002C538);
  uint64_t v48 = v70;
  sub_10000B308(v70, (uint64_t)v10, &qword_10002C488);
  sub_10000B308(v47, v46, &qword_10002C538);
  uint64_t v49 = v66;
  sub_10000B308((uint64_t)v10, v66, &qword_10002C488);
  uint64_t v50 = sub_10000590C(&qword_10002C540);
  sub_10000B308(v46, v49 + *(int *)(v50 + 48), &qword_10002C538);
  sub_10000B36C(v47, &qword_10002C538);
  sub_10000B36C(v48, &qword_10002C488);
  sub_10000B36C(v46, &qword_10002C538);
  return sub_10000B36C((uint64_t)v10, &qword_10002C488);
}

uint64_t sub_100011AA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v83 = a1;
  uint64_t v87 = a2;
  uint64_t v86 = sub_10000590C(&qword_10002C848) - 8;
  uint64_t v2 = __chkstk_darwin(v86);
  uint64_t v84 = (uint64_t)&v73 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v85 = (uint64_t)&v73 - v4;
  uint64_t v90 = sub_10001F0D0();
  uint64_t v95 = *(void *)(v90 - 8);
  __chkstk_darwin(v90);
  uint64_t v89 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_10000590C(&qword_10002C480);
  uint64_t v96 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  uint64_t v7 = (char *)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_10000590C(&qword_10002C488) - 8;
  __chkstk_darwin(v92);
  char v88 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_10000590C(&qword_10002C850) - 8;
  uint64_t v9 = __chkstk_darwin(v93);
  uint64_t v11 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v94 = (uint64_t)&v73 - v12;
  uint64_t v97 = sub_10001ECB0();
  uint64_t v98 = v13;
  unint64_t v82 = sub_100005FA4();
  uint64_t v14 = sub_10001F120();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v97 = v14;
  uint64_t v98 = v16;
  char v99 = v20;
  uint64_t v100 = v18;
  uint64_t v101 = KeyPath;
  uint64_t v102 = 1;
  char v103 = 0;
  sub_10001F060();
  uint64_t v81 = sub_10000590C(&qword_10002C4A0);
  unint64_t v80 = sub_10000AE84();
  sub_10001F180();
  sub_10000AF24(v14, v16, v20);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10001F0C0();
  unsigned int v79 = enum case for Font.Leading.tight(_:);
  uint64_t v22 = v95;
  uint64_t v77 = *(void (**)(char *))(v95 + 104);
  uint64_t v78 = v95 + 104;
  uint64_t v23 = v89;
  uint64_t v24 = v90;
  v77(v89);
  uint64_t v25 = sub_10001F0E0();
  swift_release();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v22 + 8);
  uint64_t v95 = v22 + 8;
  char v76 = v26;
  v26(v23, v24);
  uint64_t v27 = swift_getKeyPath();
  uint64_t v28 = v96;
  uint64_t v75 = *(void (**)(char *, char *, uint64_t))(v96 + 16);
  uint64_t v29 = (uint64_t)v88;
  uint64_t v30 = v91;
  v75(v88, v7, v91);
  uint64_t v31 = (uint64_t *)(v29 + *(int *)(v92 + 44));
  *uint64_t v31 = v27;
  v31[1] = v25;
  uint64_t v32 = *(void (**)(char *, uint64_t))(v28 + 8);
  uint64_t v96 = v28 + 8;
  uint64_t v74 = v32;
  v32(v7, v30);
  LOBYTE(v27) = sub_10001EFD0();
  sub_10001ED10();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  sub_10000B308(v29, (uint64_t)v11, &qword_10002C488);
  uint64_t v41 = &v11[*(int *)(v93 + 44)];
  *uint64_t v41 = v27;
  *((void *)v41 + 1) = v34;
  *((void *)v41 + 2) = v36;
  *((void *)v41 + 3) = v38;
  *((void *)v41 + 4) = v40;
  v41[40] = 0;
  sub_10000B36C(v29, &qword_10002C488);
  sub_10000B2A4((uint64_t)v11, v94, &qword_10002C850);
  uint64_t v97 = sub_10001ECB0();
  uint64_t v98 = v42;
  uint64_t v43 = sub_10001F120();
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  char v49 = v48 & 1;
  uint64_t v50 = swift_getKeyPath();
  uint64_t v97 = v43;
  uint64_t v98 = v45;
  char v99 = v49;
  uint64_t v100 = v47;
  uint64_t v101 = v50;
  uint64_t v102 = 2;
  char v103 = 0;
  sub_10001F090();
  sub_10001F180();
  sub_10000AF24(v43, v45, v49);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10001F020();
  uint64_t v51 = v89;
  uint64_t v52 = v90;
  ((void (*)(char *, void, uint64_t))v77)(v89, v79, v90);
  uint64_t v53 = sub_10001F0E0();
  swift_release();
  v76(v51, v52);
  uint64_t v54 = swift_getKeyPath();
  uint64_t v55 = (uint64_t)v88;
  uint64_t v56 = v91;
  v75(v88, v7, v91);
  uint64_t v57 = (uint64_t *)(v55 + *(int *)(v92 + 44));
  *uint64_t v57 = v54;
  v57[1] = v53;
  v74(v7, v56);
  LOBYTE(v54) = sub_10001EFD0();
  sub_10001ED10();
  uint64_t v59 = v58;
  uint64_t v61 = v60;
  uint64_t v63 = v62;
  uint64_t v65 = v64;
  sub_10000B308(v55, (uint64_t)v11, &qword_10002C488);
  uint64_t v66 = &v11[*(int *)(v93 + 44)];
  *uint64_t v66 = v54;
  *((void *)v66 + 1) = v59;
  *((void *)v66 + 2) = v61;
  *((void *)v66 + 3) = v63;
  *((void *)v66 + 4) = v65;
  v66[40] = 0;
  sub_10000B36C(v55, &qword_10002C488);
  uint64_t v67 = v84;
  sub_10000B308((uint64_t)v11, v84, &qword_10002C850);
  *(_WORD *)(v67 + *(int *)(v86 + 44)) = 256;
  sub_10000B36C((uint64_t)v11, &qword_10002C850);
  uint64_t v68 = v85;
  sub_10000B2A4(v67, v85, &qword_10002C848);
  uint64_t v69 = v94;
  sub_10000B308(v94, (uint64_t)v11, &qword_10002C850);
  sub_10000B308(v68, v67, &qword_10002C848);
  uint64_t v70 = v87;
  sub_10000B308((uint64_t)v11, v87, &qword_10002C850);
  uint64_t v71 = sub_10000590C(&qword_10002C858);
  sub_10000B308(v67, v70 + *(int *)(v71 + 48), &qword_10002C848);
  sub_10000B36C(v68, &qword_10002C848);
  sub_10000B36C(v69, &qword_10002C850);
  sub_10000B36C(v67, &qword_10002C848);
  return sub_10000B36C((uint64_t)v11, &qword_10002C850);
}

id sub_10001224C@<X0>(void *a1@<X8>)
{
  type metadata accessor for PassLiveActivityImageProvider();
  uint64_t v2 = (void *)swift_allocObject();
  v2[3] = 0;
  v2[4] = 0;
  v2[2] = 0;
  id result = [self sharedInstance];
  v2[5] = result;
  *a1 = v2;
  return result;
}

uint64_t sub_1000122B4()
{
  return sub_10001F400();
}

uint64_t sub_10001243C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B438(v1, a1);
}

uint64_t sub_100012444@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000B81C(a1, v2, a2);
}

uint64_t sub_10001244C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100012494()
{
  uint64_t v1 = sub_10000590C(&qword_10002C5C0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100012564@<X0>(uint64_t a1@<X8>)
{
  sub_10000590C(&qword_10002C5C0);
  uint64_t v3 = *(void *)(v1 + 16);

  return sub_10000C0B4(v3, a1);
}

uint64_t sub_1000125E0()
{
  return sub_1000127C4((uint64_t (*)(unint64_t, uint64_t))sub_10000C5F0);
}

uint64_t sub_1000125F8()
{
  uint64_t v1 = sub_10000590C(&qword_10002C5C0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001268C@<X0>(uint64_t a1@<X8>)
{
  sub_10000590C(&qword_10002C5C0);

  return sub_10000CD80(a1);
}

uint64_t sub_100012704()
{
  uint64_t v1 = sub_10000590C(&qword_10002C5C0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_1000127AC()
{
  return sub_1000127C4((uint64_t (*)(unint64_t, uint64_t))sub_10000D7F8);
}

uint64_t sub_1000127C4(uint64_t (*a1)(unint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(sub_10000590C(&qword_10002C5C0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v1 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));

  return a1(v1 + v3, v4);
}

unint64_t sub_100012878()
{
  unint64_t result = qword_10002C5F0;
  if (!qword_10002C5F0)
  {
    sub_100005950(&qword_10002C3A0);
    sub_100012944(&qword_10002C5F8, &qword_10002C600, (void (*)(void))sub_1000129C0);
    sub_100005F60(&qword_10002C630, &qword_10002C398);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C5F0);
  }
  return result;
}

uint64_t sub_100012944(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005950(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000129C0()
{
  return sub_100012944(&qword_10002C608, &qword_10002C610, (void (*)(void))sub_1000129F0);
}

uint64_t sub_1000129F0()
{
  return sub_100012944(&qword_10002C618, &qword_10002C620, (void (*)(void))sub_100012A20);
}

unint64_t sub_100012A20()
{
  unint64_t result = qword_10002C628;
  if (!qword_10002C628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C628);
  }
  return result;
}

unint64_t sub_100012A74()
{
  unint64_t result = qword_10002C638;
  if (!qword_10002C638)
  {
    sub_100005950(&qword_10002C5D8);
    sub_100012AE8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C638);
  }
  return result;
}

unint64_t sub_100012AE8()
{
  unint64_t result = qword_10002C640;
  if (!qword_10002C640)
  {
    sub_100005950(&qword_10002C648);
    sub_100005F60(&qword_10002C650, &qword_10002C658);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C640);
  }
  return result;
}

uint64_t sub_100012B88@<X0>(char *a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_10000590C(&qword_10002C798);
  uint64_t v27 = *(void *)(v1 - 8);
  uint64_t v2 = v27;
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v25 - v5;
  uint64_t v7 = sub_10000590C(&qword_10002C790);
  uint64_t v28 = *(void *)(v7 - 8);
  uint64_t v8 = v28;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v25 - v12;
  sub_10000590C(&qword_10002C6B0);
  sub_10001F440();
  sub_10000590C(&qword_10002C6B8);
  uint64_t v26 = v6;
  sub_10001F410();
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v15 = v11;
  v14(v11, v13, v7);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  uint64_t v17 = v29;
  uint64_t v18 = v6;
  uint64_t v19 = v1;
  v16(v29, v18, v1);
  char v20 = v30;
  v14(v30, v15, v7);
  uint64_t v21 = sub_10000590C(&qword_10002C7A0);
  v16(&v20[*(int *)(v21 + 48)], v17, v19);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v27 + 8);
  v22(v26, v19);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v28 + 8);
  v23(v13, v7);
  v22(v17, v19);
  return ((uint64_t (*)(char *, uint64_t))v23)(v15, v7);
}

uint64_t sub_100012E38@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_10001EE50();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100012E6C()
{
  return sub_10001EE60();
}

uint64_t sub_100012E9C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10001EDD0();
  *a1 = v3;
  return result;
}

uint64_t sub_100012EC8()
{
  return sub_10001EDE0();
}

uint64_t sub_100012EF0()
{
  return sub_10001ED90();
}

uint64_t sub_100012F14(uint64_t a1)
{
  uint64_t v2 = sub_10001F110();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_10001EDA0();
}

uint64_t sub_100012FDC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001EE10();
  *a1 = result;
  return result;
}

uint64_t sub_100013008()
{
  return sub_10001EE20();
}

double sub_100013030(double a1)
{
  if (a1 <= 24.0) {
    goto LABEL_6;
  }
  if (a1 <= 49.0)
  {
    PKFloatFloorToPixel();
    goto LABEL_9;
  }
  if (a1 <= 56.0)
  {
    PKFloatRoundToPixel();
    goto LABEL_9;
  }
  if (a1 <= 66.0)
  {
LABEL_6:
    PKFloatCeilToPixel();
LABEL_9:
    double v2 = -v3;
    PKFloatFloorToPixel();
    return v2;
  }
  PKFloatRoundToPixel();
  double v2 = -v1;
  PKFloatCeilToPixel();
  return v2;
}

uint64_t sub_1000130E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001ED70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013148@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_10001EE50();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10001317C()
{
  return sub_10001EE60();
}

unint64_t sub_1000131B4()
{
  unint64_t result = qword_10002C690;
  if (!qword_10002C690)
  {
    sub_100005950(&qword_10002C688);
    sub_10000AE84();
    sub_100005F60(&qword_10002C698, &qword_10002C6A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C690);
  }
  return result;
}

uint64_t sub_100013254@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10001EDD0();
  *a1 = v3;
  return result;
}

uint64_t sub_100013280()
{
  return sub_10001EDE0();
}

uint64_t sub_1000132A8@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000DFEC(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_1000132B0()
{
  unint64_t result = qword_10002C6D0;
  if (!qword_10002C6D0)
  {
    sub_100005950(&qword_10002C6C8);
    sub_100005F60(&qword_10002C6D8, &qword_10002C6E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C6D0);
  }
  return result;
}

uint64_t sub_100013350()
{
  return sub_10000E740(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100013358(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005950(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000133E0()
{
  return sub_100013358(&qword_10002C700, &qword_10002C708, (void (*)(void))sub_10001341C, (void (*)(void))sub_1000134BC);
}

unint64_t sub_10001341C()
{
  unint64_t result = qword_10002C710;
  if (!qword_10002C710)
  {
    sub_100005950(&qword_10002C718);
    sub_100005F60(&qword_10002C720, &qword_10002C728);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C710);
  }
  return result;
}

unint64_t sub_1000134BC()
{
  unint64_t result = qword_10002C730;
  if (!qword_10002C730)
  {
    sub_100005950(&qword_10002C738);
    sub_100005F60(&qword_10002C438, &qword_10002C3E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C730);
  }
  return result;
}

uint64_t sub_10001355C()
{
  return sub_100013358(&qword_10002C740, &qword_10002C748, (void (*)(void))sub_100013598, (void (*)(void))sub_100013638);
}

unint64_t sub_100013598()
{
  unint64_t result = qword_10002C750;
  if (!qword_10002C750)
  {
    sub_100005950(&qword_10002C758);
    sub_100005F60(&qword_10002C760, &qword_10002C768);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C750);
  }
  return result;
}

unint64_t sub_100013638()
{
  unint64_t result = qword_10002C770;
  if (!qword_10002C770)
  {
    sub_100005950(&qword_10002C778);
    sub_100005F60(&qword_10002C780, &qword_10002C788);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C770);
  }
  return result;
}

uint64_t sub_1000136D8()
{
  return sub_10001F410();
}

uint64_t sub_100013710@<X0>(char *a1@<X8>)
{
  return sub_100012B88(a1);
}

uint64_t sub_100013718()
{
  return sub_10001ED90();
}

uint64_t sub_100013740@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001EE10();
  *a1 = result;
  return result;
}

uint64_t sub_10001376C()
{
  return sub_10001EE20();
}

double sub_100013794(uint64_t a1)
{
  uint64_t v2 = sub_10001ECC0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(sub_10001EC00() + 16);
  swift_bridgeObjectRelease();
  if (v6)
  {
    char v7 = sub_10001EC90();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    if (v7)
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return 52.0;
    }
    else
    {
      unint64_t v11 = *(void *)(sub_10001EC00() + 16);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      double result = 72.0;
      if (v11 < 3) {
        return 52.0;
      }
    }
  }
  else
  {
    sub_10001EC50();
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    double result = 44.0;
    if (!v10) {
      return 38.0;
    }
  }
  return result;
}

double sub_100013948(unint64_t a1)
{
  double result = 0.0;
  if (a1 <= 0xE) {
    return dbl_100020490[a1];
  }
  return result;
}

uint64_t sub_100013964(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000139C4()
{
  return sub_100005F60(&qword_10002C860, &qword_10002C868);
}

ValueMetadata *type metadata accessor for NearbyPeerPaymentControl()
{
  return &type metadata for NearbyPeerPaymentControl;
}

uint64_t sub_100013A10()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_100013A2C(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v1 = sub_10001F300();
  __chkstk_darwin(v1 - 8);
  uint64_t v31 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001ECF0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000590C(&qword_10002C880);
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v26 - v11;
  uint64_t v13 = sub_10000590C(&qword_10002C888);
  uint64_t v27 = *(void *)(v13 - 8);
  uint64_t v28 = v13;
  __chkstk_darwin(v13);
  uint64_t v33 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = qword_10002C870;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringTable.nearbyPeerPayment(_:), v3);
  swift_bridgeObjectRetain();
  id v15 = (id)PKPassKitBundle();
  if (v15)
  {
    uint64_t v16 = v15;
    sub_10001ECE0();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_10001F2F0();
    sub_10000590C(&qword_10002C890);
    sub_100014140();
    sub_100005F60(&qword_10002C8A0, &qword_10002C890);
    sub_10001F310();
    if (qword_10002C248 != -1) {
      swift_once();
    }
    sub_10001F320();
    uint64_t v17 = *(void (**)(char *, uint64_t))(v32 + 8);
    v17(v10, v7);
    uint64_t v18 = sub_100005F60(&qword_10002C8A8, &qword_10002C880);
    uint64_t v19 = v33;
    sub_10001EF40();
    v17(v12, v7);
    char v20 = (NSString *)sub_10001F4C0();
    id v21 = (id)PKLocalizedNearbyPeerPaymentString(v20);

    if (v21)
    {
      uint64_t v22 = sub_10001F4F0();
      uint64_t v24 = v23;

      uint64_t v36 = v22;
      uint64_t v37 = v24;
      uint64_t v34 = v7;
      uint64_t v35 = v18;
      swift_getOpaqueTypeConformance2();
      sub_100005FA4();
      uint64_t v25 = v28;
      sub_10001EF10();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v19, v25);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

__n128 sub_100013F14@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10001EEA0();
  sub_100013F70((uint64_t)&v6);
  char v3 = v7;
  __n128 result = v8;
  long long v5 = v6;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 40) = v3;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

id sub_100013F70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10001ECF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  long long v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringTable.nearbyPeerPayment(_:), v2);
  id result = (id)PKPassKitBundle();
  if (result)
  {
    char v7 = result;
    uint64_t v8 = sub_10001ECE0();
    uint64_t v10 = v9;

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v18[0] = v8;
    v18[1] = v10;
    sub_100005FA4();
    uint64_t v11 = sub_10001F120();
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    LOBYTE(v8) = v16 & 1;
    uint64_t v17 = sub_10001F250();
    *(void *)a1 = v11;
    *(void *)(a1 + 8) = v13;
    *(unsigned char *)(a1 + 16) = v8;
    *(void *)(a1 + 24) = v15;
    *(void *)(a1 + 32) = v17;
    sub_10000AF44(v11, v13, v8);
    swift_bridgeObjectRetain();
    sub_10000AF24(v11, v13, v8);
    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_100014140()
{
  unint64_t result = qword_10002C898;
  if (!qword_10002C898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C898);
  }
  return result;
}

uint64_t sub_100014194()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100014264()
{
  type metadata accessor for PassLiveActivityImageProvider();
  uint64_t v0 = (void *)swift_allocObject();
  v0[3] = 0;
  v0[4] = 0;
  v0[2] = 0;
  v0[5] = [self sharedInstance];
  swift_retain();
  sub_10000590C(&qword_10002C8B8);
  sub_10001ED30();
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10001433C()
{
  unint64_t result = qword_10002C8B0;
  if (!qword_10002C8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C8B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for PassbookLockedWidgetsExtensionBundle()
{
  return &type metadata for PassbookLockedWidgetsExtensionBundle;
}

uint64_t sub_1000143A0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000143C0()
{
  unint64_t result = qword_10002C8C0;
  if (!qword_10002C8C0)
  {
    sub_100005950(&qword_10002C8C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C8C0);
  }
  return result;
}

void *sub_10001441C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100014428(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100014430@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100014444@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100014458@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_10001446C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_10001449C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1000144C8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1000144EC(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100014500(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100014514(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100014528@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_10001453C(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100014550(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100014564(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100014578()
{
  return *v0 == 0;
}

uint64_t sub_100014588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_1000145A0(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_1000145B4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1000145C4(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_1000145D0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1000145E4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_1000198F8(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

BOOL sub_100014624(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100014638()
{
  Swift::UInt v1 = *v0;
  sub_10001F5E0();
  sub_10001F5F0(v1);
  return sub_10001F600();
}

void sub_100014680()
{
  sub_10001F5F0(*v0);
}

Swift::Int sub_1000146AC()
{
  Swift::UInt v1 = *v0;
  sub_10001F5E0();
  sub_10001F5F0(v1);
  return sub_10001F600();
}

void sub_1000146F0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v251 = a1;
  uint64_t v241 = a2;
  uint64_t v239 = sub_10000590C(&qword_10002CA60);
  __chkstk_darwin(v239);
  uint64_t v240 = (uint64_t)&v187 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000590C(&qword_10002CA68);
  __chkstk_darwin(v4 - 8);
  v217 = (char *)&v187 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v212 = sub_10000590C(&qword_10002CA70);
  uint64_t v211 = *(void *)(v212 - 8);
  __chkstk_darwin(v212);
  v209 = (char *)&v187 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v215 = sub_10000590C(&qword_10002CA78);
  uint64_t v214 = *(void *)(v215 - 8);
  __chkstk_darwin(v215);
  v213 = (char *)&v187 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v210 = sub_10000590C(&qword_10002CA80);
  __chkstk_darwin(v210);
  v216 = (char *)&v187 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v205 = sub_10000590C(&qword_10002CA88);
  __chkstk_darwin(v205);
  uint64_t v207 = (uint64_t)&v187 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v227 = sub_10000590C(&qword_10002CA90);
  uint64_t v10 = __chkstk_darwin(v227);
  uint64_t v206 = (uint64_t)&v187 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v208 = (uint64_t)&v187 - v12;
  uint64_t v225 = sub_10000590C(&qword_10002CA98);
  __chkstk_darwin(v225);
  uint64_t v226 = (uint64_t)&v187 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v189 = sub_10000590C(&qword_10002C428);
  __chkstk_darwin(v189);
  v193 = (uint64_t *)((char *)&v187 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v192 = sub_10001F110();
  uint64_t v191 = *(void *)(v192 - 8);
  __chkstk_darwin(v192);
  v190 = (char *)&v187 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v188 = sub_10000590C(&qword_10002C4C8);
  __chkstk_darwin(v188);
  v194 = (char *)&v187 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v199 = sub_10000590C(&qword_10002CAA0);
  __chkstk_darwin(v199);
  uint64_t v196 = (uint64_t)&v187 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v204 = sub_10000590C(&qword_10002CAA8);
  uint64_t v201 = *(void *)(v204 - 8);
  __chkstk_darwin(v204);
  v198 = (char *)&v187 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v203 = sub_10000590C(&qword_10002CAB0);
  uint64_t v200 = *(void *)(v203 - 8);
  __chkstk_darwin(v203);
  v197 = (char *)&v187 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v223 = sub_10000590C(&qword_10002CAB8);
  uint64_t v20 = __chkstk_darwin(v223);
  v195 = (char *)&v187 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v202 = (uint64_t)&v187 - v22;
  uint64_t v237 = sub_10000590C(&qword_10002CAC0);
  __chkstk_darwin(v237);
  v224 = (char *)&v187 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v248 = sub_10001ED60();
  uint64_t v249 = *(void *)(v248 - 8);
  uint64_t v24 = __chkstk_darwin(v248);
  v247 = (char *)&v187 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v246 = (uint64_t)&v187 - v26;
  uint64_t v27 = sub_10000590C(&qword_10002CAC8);
  uint64_t v28 = __chkstk_darwin(v27 - 8);
  v238 = (char *)&v187 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  v236 = (char *)&v187 - v30;
  uint64_t v31 = sub_10001F0D0();
  uint64_t v32 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v34 = (char *)&v187 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v253 = sub_10000590C(&qword_10002C828);
  uint64_t v258 = *(void *)(v253 - 8);
  uint64_t v35 = __chkstk_darwin(v253);
  v222 = (char *)&v187 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35);
  v244 = (char *)&v187 - v37;
  uint64_t v252 = sub_10000590C(&qword_10002CAD0);
  uint64_t v257 = *(void *)(v252 - 8);
  uint64_t v38 = __chkstk_darwin(v252);
  v220 = (char *)&v187 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v38);
  v245 = (char *)&v187 - v40;
  uint64_t v254 = sub_10000590C(&qword_10002CAD8);
  uint64_t v41 = __chkstk_darwin(v254);
  v219 = (char *)&v187 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __chkstk_darwin(v41);
  uint64_t v221 = (uint64_t)&v187 - v44;
  uint64_t v45 = __chkstk_darwin(v43);
  v256 = (char *)&v187 - v46;
  __chkstk_darwin(v45);
  uint64_t v255 = (uint64_t)&v187 - v47;
  v250 = (int *)type metadata accessor for SeatingAttributesTableColumn();
  char v48 = (uint64_t *)(a1 + v250[5]);
  unint64_t v49 = v48[1];
  uint64_t v259 = *v48;
  unint64_t v260 = v49;
  unint64_t v50 = sub_100005FA4();
  swift_bridgeObjectRetain();
  unint64_t v228 = v50;
  uint64_t v51 = sub_10001F120();
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v243 = v54;
  char v57 = v56 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v242 = KeyPath;
  sub_10001F100();
  uint64_t v59 = *(void (**)(void))(v32 + 104);
  unsigned int v229 = enum case for Font.Leading.tight(_:);
  uint64_t v231 = v32 + 104;
  v230 = (void (*)(char *, void, uint64_t))v59;
  v59(v34);
  uint64_t v60 = sub_10001F0E0();
  swift_release();
  uint64_t v61 = *(void (**)(char *, uint64_t))(v32 + 8);
  v233 = v34;
  uint64_t v235 = v31;
  uint64_t v234 = v32 + 8;
  v232 = v61;
  v61(v34, v31);
  uint64_t v62 = swift_getKeyPath();
  uint64_t v259 = v51;
  unint64_t v260 = v53;
  LOBYTE(v261) = v57;
  uint64_t v262 = v55;
  uint64_t v263 = KeyPath;
  uint64_t v264 = 1;
  char v265 = 0;
  uint64_t v266 = v62;
  uint64_t v267 = v60;
  sub_10001F080();
  uint64_t v63 = sub_10000590C(&qword_10002C688);
  uint64_t v64 = sub_100019644((unint64_t *)&qword_10002C690, &qword_10002C688, (void (*)(void))sub_10000AE84);
  uint64_t v65 = v244;
  sub_10001F180();
  uint64_t v66 = v51;
  uint64_t v67 = v251;
  sub_10000AF24(v66, v53, v57);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v243 = v63;
  uint64_t v259 = v63;
  unint64_t v260 = v64;
  uint64_t v242 = v64;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v69 = v245;
  uint64_t v70 = v253;
  sub_10001F190();
  uint64_t v71 = *(char **)(v258 + 8);
  v258 += 8;
  v244 = v71;
  ((void (*)(char *, uint64_t))v71)(v65, v70);
  uint64_t v72 = sub_10001F1E0();
  uint64_t v74 = (uint64_t)v256;
  uint64_t v73 = v257;
  uint64_t v75 = v252;
  v218 = *(void (**)(char *, char *, uint64_t))(v257 + 16);
  v218(v256, v69, v252);
  *(void *)(v74 + *(int *)(v254 + 36)) = v72;
  char v76 = *(char **)(v73 + 8);
  uint64_t v257 = v73 + 8;
  v245 = v76;
  ((void (*)(char *, uint64_t))v76)(v69, v75);
  sub_10000B2A4(v74, v255, &qword_10002CAD8);
  uint64_t v77 = v246;
  sub_1000172E4(v246);
  sub_100019184(&qword_10002CAE0);
  uint64_t v78 = v247;
  uint64_t v79 = v248;
  sub_10001F570();
  sub_100019184(&qword_10002CAE8);
  uint64_t v80 = v79;
  LOBYTE(v79) = sub_10001F4B0();
  uint64_t v81 = *(void (**)(char *, uint64_t))(v249 + 8);
  v81(v78, v80);
  v81((char *)v77, v80);
  if (v79)
  {
    unint64_t v82 = v250;
    uint64_t v83 = (uint64_t *)(v67 + v250[6]);
    uint64_t v85 = *v83;
    unint64_t v84 = v83[1];
    swift_bridgeObjectRetain();
    NSString v86 = sub_10001F4C0();
    swift_bridgeObjectRelease();
    id v87 = [self colorFromString:v86];

    if (!v87)
    {
      uint64_t v259 = v85;
      unint64_t v260 = v84;
      swift_bridgeObjectRetain();
      uint64_t v257 = sub_10001F120();
      uint64_t v258 = v106;
      uint64_t v108 = v107;
      char v110 = v109 & 1;
      uint64_t v111 = swift_getKeyPath();
      uint64_t v112 = v191;
      uint64_t v113 = v190;
      uint64_t v114 = v192;
      (*(void (**)(char *, void, uint64_t))(v191 + 104))(v190, enum case for Text.TruncationMode.tail(_:), v192);
      uint64_t v115 = swift_getKeyPath();
      uint64_t v116 = v193;
      (*(void (**)(char *, char *, uint64_t))(v112 + 16))((char *)v193 + *(int *)(v189 + 28), v113, v114);
      *uint64_t v116 = v115;
      uint64_t v117 = (uint64_t)v194;
      sub_10000B308((uint64_t)v116, (uint64_t)&v194[*(int *)(v188 + 36)], &qword_10002C428);
      uint64_t v119 = v257;
      uint64_t v118 = v258;
      *(void *)uint64_t v117 = v257;
      *(void *)(v117 + 8) = v108;
      *(unsigned char *)(v117 + 16) = v110;
      *(void *)(v117 + 24) = v118;
      *(void *)(v117 + 32) = v111;
      *(void *)(v117 + 40) = 1;
      *(unsigned char *)(v117 + 48) = 0;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_10000AF44(v119, v108, v110);
      sub_10000B36C((uint64_t)v116, &qword_10002C428);
      (*(void (**)(char *, uint64_t))(v112 + 8))(v113, v114);
      sub_10000AF24(v119, v108, v110);
      swift_release();
      swift_bridgeObjectRelease();
      int v120 = *(unsigned __int8 *)(v67 + v250[7]);
      uint64_t v121 = (uint64_t)v236;
      if (v120)
      {
        uint64_t v122 = (uint64_t)v238;
        uint64_t v123 = (uint64_t)v256;
        if (v120 == 1) {
          sub_10001F040();
        }
        else {
          sub_10001F010();
        }
      }
      else
      {
        sub_10001F030();
        uint64_t v122 = (uint64_t)v238;
        uint64_t v123 = (uint64_t)v256;
      }
      v168 = v233;
      uint64_t v169 = v235;
      v230(v233, v229, v235);
      uint64_t v170 = sub_10001F0E0();
      swift_release();
      v232(v168, v169);
      uint64_t v171 = swift_getKeyPath();
      uint64_t v172 = v196;
      sub_10000B308(v117, v196, &qword_10002C4C8);
      uint64_t v173 = v199;
      v174 = (uint64_t *)(v172 + *(int *)(v199 + 36));
      uint64_t *v174 = v171;
      v174[1] = v170;
      sub_10000B36C(v117, &qword_10002C4C8);
      sub_10001F080();
      uint64_t v175 = sub_100019644(&qword_10002CB48, &qword_10002CAA0, (void (*)(void))sub_10000AFF4);
      v176 = v198;
      sub_10001F180();
      sub_10000B36C(v172, &qword_10002CAA0);
      uint64_t v259 = v173;
      unint64_t v260 = v175;
      swift_getOpaqueTypeConformance2();
      v177 = v197;
      uint64_t v178 = v204;
      sub_10001F190();
      (*(void (**)(char *, uint64_t))(v201 + 8))(v176, v178);
      uint64_t v179 = sub_10001F200();
      uint64_t v180 = v200;
      v181 = v195;
      uint64_t v182 = v203;
      (*(void (**)(char *, char *, uint64_t))(v200 + 16))(v195, v177, v203);
      *(void *)&v181[*(int *)(v223 + 36)] = v179;
      (*(void (**)(char *, uint64_t))(v180 + 8))(v177, v182);
      uint64_t v183 = (uint64_t)v181;
      uint64_t v184 = v202;
      sub_10000B2A4(v183, v202, &qword_10002CAB8);
      sub_10000B308(v184, v226, &qword_10002CAB8);
      swift_storeEnumTagMultiPayload();
      sub_100019244();
      sub_100019510();
      uint64_t v166 = (uint64_t)v224;
      sub_10001EF80();
      sub_10000B36C(v184, &qword_10002CAB8);
      uint64_t v136 = v241;
      uint64_t v167 = v240;
      goto LABEL_23;
    }
    uint64_t v88 = sub_10001F230();
    uint64_t v89 = v82[7];
    if (*(unsigned char *)(v67 + v89))
    {
      if (*(unsigned char *)(v67 + v89) == 1) {
        uint64_t v90 = sub_10001F0B0();
      }
      else {
        uint64_t v90 = sub_10001F040();
      }
    }
    else
    {
      uint64_t v90 = sub_10001F020();
    }
    uint64_t v137 = v90;
    uint64_t v138 = swift_getKeyPath();
    uint64_t v259 = v88;
    unint64_t v260 = v138;
    uint64_t v261 = v137;
    sub_10001F080();
    uint64_t v139 = sub_10000590C(&qword_10002CB10);
    unint64_t v140 = sub_100019470();
    uint64_t v141 = v209;
    sub_10001F180();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v259 = v139;
    unint64_t v260 = v140;
    swift_getOpaqueTypeConformance2();
    uint64_t v142 = v213;
    uint64_t v143 = v212;
    sub_10001F190();
    (*(void (**)(char *, uint64_t))(v211 + 8))(v141, v143);
    uint64_t v144 = (uint64_t)v217;
    sub_10001EEE0();
    uint64_t v145 = sub_10001EEF0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v145 - 8) + 56))(v144, 0, 1, v145);
    uint64_t v146 = swift_getKeyPath();
    uint64_t v147 = (uint64_t)v216;
    uint64_t v148 = (uint64_t *)&v216[*(int *)(v210 + 36)];
    uint64_t v149 = sub_10000590C(&qword_10002CB28);
    sub_10000B308(v144, (uint64_t)v148 + *(int *)(v149 + 28), &qword_10002CA68);
    *uint64_t v148 = v146;
    uint64_t v150 = v214;
    uint64_t v151 = v215;
    (*(void (**)(uint64_t, char *, uint64_t))(v214 + 16))(v147, v142, v215);
    sub_10000B36C(v144, &qword_10002CA68);
    (*(void (**)(char *, uint64_t))(v150 + 8))(v142, v151);
    if ([v87 CGColor])
    {
      uint64_t v152 = sub_10001F1C0();
      uint64_t v153 = v207;
      sub_10000B308(v147, v207, &qword_10002CA80);
      *(void *)(v153 + *(int *)(v205 + 36)) = v152;
      sub_10000B36C(v147, &qword_10002CA80);
      LOBYTE(v152) = sub_10001EFC0();
      sub_10001ED10();
      uint64_t v155 = v154;
      uint64_t v157 = v156;
      uint64_t v159 = v158;
      uint64_t v161 = v160;
      uint64_t v162 = v206;
      sub_10000B308(v153, v206, &qword_10002CA88);
      uint64_t v163 = v162 + *(int *)(v227 + 36);
      *(unsigned char *)uint64_t v163 = v152;
      *(void *)(v163 + 8) = v155;
      *(void *)(v163 + 16) = v157;
      *(void *)(v163 + 24) = v159;
      *(void *)(v163 + 32) = v161;
      *(unsigned char *)(v163 + 40) = 0;
      sub_10000B36C(v153, &qword_10002CA88);
      uint64_t v164 = v162;
      uint64_t v165 = v208;
      sub_10000B2A4(v164, v208, &qword_10002CA90);
      sub_10000B308(v165, v226, &qword_10002CA90);
      swift_storeEnumTagMultiPayload();
      sub_100019244();
      sub_100019510();
      uint64_t v166 = (uint64_t)v224;
      sub_10001EF80();

      sub_10000B36C(v165, &qword_10002CA90);
      uint64_t v136 = v241;
      uint64_t v167 = v240;
      uint64_t v122 = (uint64_t)v238;
      uint64_t v121 = (uint64_t)v236;
      uint64_t v123 = (uint64_t)v256;
LABEL_23:
      sub_10000B308(v166, v167, &qword_10002CAC0);
      swift_storeEnumTagMultiPayload();
      sub_1000191C8();
      sub_1000196E8();
      sub_10001EF80();
      sub_10000B36C(v166, &qword_10002CAC0);
LABEL_24:
      uint64_t v185 = v255;
      sub_10000B308(v255, v123, &qword_10002CAD8);
      sub_10000B308(v121, v122, &qword_10002CAC8);
      sub_10000B308(v123, v136, &qword_10002CAD8);
      uint64_t v186 = sub_10000590C(&qword_10002CB58);
      sub_10000B308(v122, v136 + *(int *)(v186 + 48), &qword_10002CAC8);
      sub_10000B36C(v121, &qword_10002CAC8);
      sub_10000B36C(v185, &qword_10002CAD8);
      sub_10000B36C(v122, &qword_10002CAC8);
      sub_10000B36C(v123, &qword_10002CAD8);
      return;
    }
  }
  else
  {
    uint64_t v91 = v250;
    uint64_t v92 = (NSString *)sub_10001F4C0();
    id v93 = (id)PKLocalizedTicketingString(v92);

    if (v93)
    {
      uint64_t v94 = sub_10001F4F0();
      unint64_t v96 = v95;

      uint64_t v259 = v94;
      unint64_t v260 = v96;
      uint64_t v97 = sub_10001F120();
      uint64_t v99 = v98;
      char v101 = v100;
      uint64_t v103 = v102;
      uint64_t v104 = swift_getKeyPath();
      int v105 = *(unsigned __int8 *)(v67 + v91[7]);
      uint64_t v187 = OpaqueTypeConformance2;
      if (v105)
      {
        if (v105 == 1) {
          sub_10001F040();
        }
        else {
          sub_10001F010();
        }
      }
      else
      {
        sub_10001F030();
      }
      uint64_t v124 = v233;
      uint64_t v125 = v235;
      v230(v233, v229, v235);
      uint64_t v126 = sub_10001F0E0();
      swift_release();
      v232(v124, v125);
      uint64_t v127 = swift_getKeyPath();
      uint64_t v259 = v97;
      unint64_t v260 = v99;
      LOBYTE(v261) = v101 & 1;
      uint64_t v262 = v103;
      uint64_t v263 = v104;
      uint64_t v264 = 1;
      char v265 = 0;
      uint64_t v266 = v127;
      uint64_t v267 = v126;
      sub_10001F080();
      uint64_t v128 = v222;
      sub_10001F180();
      sub_10000AF24(v97, v99, v101 & 1);
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v129 = v220;
      uint64_t v130 = v253;
      sub_10001F190();
      ((void (*)(char *, uint64_t))v244)(v128, v130);
      uint64_t v131 = sub_10001F200();
      uint64_t v132 = v219;
      uint64_t v133 = v252;
      v218(v219, v129, v252);
      *(void *)&v132[*(int *)(v254 + 36)] = v131;
      ((void (*)(char *, uint64_t))v245)(v129, v133);
      uint64_t v134 = (uint64_t)v132;
      uint64_t v135 = v221;
      sub_10000B2A4(v134, v221, &qword_10002CAD8);
      sub_10000B308(v135, v240, &qword_10002CAD8);
      swift_storeEnumTagMultiPayload();
      sub_1000191C8();
      sub_1000196E8();
      uint64_t v121 = (uint64_t)v236;
      sub_10001EF80();
      sub_10000B36C(v135, &qword_10002CAD8);
      uint64_t v136 = v241;
      uint64_t v122 = (uint64_t)v238;
      uint64_t v123 = (uint64_t)v256;
      goto LABEL_24;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_100016274@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_10000590C(&qword_10002CA20);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_10001EEC0();
  *((void *)v5 + 1) = 0xC000000000000000;
  v5[16] = 0;
  uint64_t v6 = sub_10000590C(&qword_10002CA28);
  sub_1000146F0(v1, (uint64_t)&v5[*(int *)(v6 + 44)]);
  *a1 = sub_10001F2C0();
  a1[1] = v7;
  uint64_t v8 = sub_10000590C(&qword_10002CA30);
  sub_100016348((uint64_t)v5, (uint64_t)a1 + *(int *)(v8 + 44));
  return sub_10000B36C((uint64_t)v5, &qword_10002CA20);
}

void sub_100016348(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v46 = a2;
  uint64_t v2 = sub_10000590C(&qword_10002CA20);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v47 = (uint64_t)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v45 = (uint64_t)&v38 - v5;
  uint64_t v6 = sub_10000590C(&qword_10002CA38);
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v42 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000590C(&qword_10002CA40);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_10000590C(&qword_10002CA48);
  __chkstk_darwin(v40);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_10000590C(&qword_10002CA50);
  uint64_t v14 = __chkstk_darwin(v39);
  uint64_t v43 = (uint64_t)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v38 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v38 - v19;
  uint64_t v21 = (NSString *)sub_10001F4C0();
  id v22 = (id)PKLocalizedTicketingString(v21);

  if (v22)
  {
    uint64_t v23 = sub_10001F4F0();
    uint64_t v25 = v24;

    uint64_t v48 = v23;
    uint64_t v49 = v25;
    sub_100005FA4();
    uint64_t v26 = sub_10001F120();
    uint64_t v28 = v27;
    uint64_t v48 = v26;
    uint64_t v49 = v27;
    char v30 = v29 & 1;
    char v50 = v29 & 1;
    uint64_t v51 = v31;
    sub_10001F1B0();
    sub_10000AF24(v26, v28, v30);
    swift_bridgeObjectRelease();
    sub_10001F2C0();
    __n128 v32 = sub_1000167EC(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v11, 0.0, 1, 0.0, 0);
    (*(void (**)(char *, uint64_t, __n128))(v41 + 8))(v8, v42, v32);
    sub_10000B308((uint64_t)v11, (uint64_t)v13, &qword_10002CA40);
    *(_WORD *)&v13[*(int *)(v40 + 36)] = 0;
    sub_10000B36C((uint64_t)v11, &qword_10002CA40);
    sub_10000B308((uint64_t)v13, (uint64_t)v18, &qword_10002CA48);
    *(void *)&v18[*(int *)(v39 + 36)] = 0;
    sub_10000B36C((uint64_t)v13, &qword_10002CA48);
    sub_10000B2A4((uint64_t)v18, (uint64_t)v20, &qword_10002CA50);
    uint64_t v33 = v45;
    sub_10000B308(v44, v45, &qword_10002CA20);
    uint64_t v34 = v43;
    sub_10000B308((uint64_t)v20, v43, &qword_10002CA50);
    uint64_t v35 = v47;
    sub_10000B308(v33, v47, &qword_10002CA20);
    uint64_t v36 = v46;
    sub_10000B308(v34, v46, &qword_10002CA50);
    uint64_t v37 = sub_10000590C(&qword_10002CA58);
    sub_10000B308(v35, v36 + *(int *)(v37 + 48), &qword_10002CA20);
    sub_10000B36C(v33, &qword_10002CA20);
    sub_10000B36C((uint64_t)v20, &qword_10002CA50);
    sub_10000B36C(v35, &qword_10002CA20);
    sub_10000B36C(v34, &qword_10002CA50);
  }
  else
  {
    __break(1u);
  }
}

__n128 sub_1000167EC@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_10001F540();
    uint64_t v23 = (void *)sub_10001EF90();
    sub_10001ED00();
  }
  sub_10001ED80();
  uint64_t v24 = sub_10000590C(&qword_10002CA38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = (_OWORD *)(a9 + *(int *)(sub_10000590C(&qword_10002CA40) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *uint64_t v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

uint64_t sub_1000169D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v3 = sub_10000590C(&qword_10002C8E0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v51 = (uint64_t)&KeyPath - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v50 = (uint64_t)&KeyPath - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v49 = (uint64_t)&KeyPath - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&KeyPath - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&KeyPath - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&KeyPath - v16;
  uint64_t v18 = *(void *)(a1 + 8);
  if ((v18 & 4) != 0)
  {
    uint64_t v20 = sub_10001EE90();
    uint64_t v21 = *(void *)(a1 + 32);
    *(void *)uint64_t v17 = v20;
    *((void *)v17 + 1) = v21;
    v17[16] = 0;
    uint64_t v47 = &v17[*(int *)(sub_10000590C(&qword_10002C8F8) + 44)];
    uint64_t v22 = *(void *)(*(void *)a1 + 16);
    uint64_t v52 = 0;
    uint64_t v53 = v22;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v23 = swift_allocObject();
    long long v24 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v23 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v23 + 32) = v24;
    *(void *)(v23 + 48) = *(void *)(a1 + 32);
    *(unsigned char *)(v23 + 56) = 2;
    swift_bridgeObjectRetain();
    sub_10000590C(&qword_10002C900);
    sub_10000590C(&qword_10002C908);
    sub_1000182AC();
    sub_100005F60(&qword_10002C920, &qword_10002C908);
    sub_10001F2A0();
    uint64_t v25 = sub_10000590C(&qword_10002C8E8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v17, 0, 1, v25);
  }
  else
  {
    uint64_t v19 = sub_10000590C(&qword_10002C8E8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 1, 1, v19);
  }
  if ((v18 & 2) != 0)
  {
    uint64_t v27 = sub_10001EE90();
    uint64_t v28 = *(void *)(a1 + 32);
    *(void *)uint64_t v15 = v27;
    *((void *)v15 + 1) = v28;
    v15[16] = 0;
    uint64_t v47 = &v15[*(int *)(sub_10000590C(&qword_10002C8F8) + 44)];
    uint64_t v29 = *(void *)(*(void *)a1 + 16);
    uint64_t v52 = 0;
    uint64_t v53 = v29;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v30 = swift_allocObject();
    long long v31 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v30 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v30 + 32) = v31;
    *(void *)(v30 + 48) = *(void *)(a1 + 32);
    *(unsigned char *)(v30 + 56) = 1;
    swift_bridgeObjectRetain();
    sub_10000590C(&qword_10002C900);
    sub_10000590C(&qword_10002C908);
    sub_1000182AC();
    sub_100005F60(&qword_10002C920, &qword_10002C908);
    sub_10001F2A0();
    uint64_t v32 = sub_10000590C(&qword_10002C8E8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v15, 0, 1, v32);
  }
  else
  {
    uint64_t v26 = sub_10000590C(&qword_10002C8E8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v15, 1, 1, v26);
  }
  if (v18)
  {
    uint64_t v34 = sub_10001EE90();
    uint64_t v35 = *(void *)(a1 + 32);
    *(void *)uint64_t v12 = v34;
    *((void *)v12 + 1) = v35;
    v12[16] = 0;
    sub_10000590C(&qword_10002C8F8);
    uint64_t v36 = *(void *)(*(void *)a1 + 16);
    uint64_t v52 = 0;
    uint64_t v53 = v36;
    swift_getKeyPath();
    uint64_t v37 = swift_allocObject();
    long long v38 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v37 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v37 + 32) = v38;
    *(void *)(v37 + 48) = *(void *)(a1 + 32);
    *(unsigned char *)(v37 + 56) = 0;
    swift_bridgeObjectRetain();
    sub_10000590C(&qword_10002C900);
    sub_10000590C(&qword_10002C908);
    sub_1000182AC();
    sub_100005F60(&qword_10002C920, &qword_10002C908);
    sub_10001F2A0();
    uint64_t v39 = sub_10000590C(&qword_10002C8E8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v12, 0, 1, v39);
  }
  else
  {
    uint64_t v33 = sub_10000590C(&qword_10002C8E8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v12, 1, 1, v33);
  }
  uint64_t v40 = v49;
  sub_10000B308((uint64_t)v17, v49, &qword_10002C8E0);
  uint64_t v41 = v50;
  sub_10000B308((uint64_t)v15, v50, &qword_10002C8E0);
  uint64_t v42 = v51;
  sub_10000B308((uint64_t)v12, v51, &qword_10002C8E0);
  uint64_t v43 = v48;
  sub_10000B308(v40, v48, &qword_10002C8E0);
  uint64_t v44 = sub_10000590C(&qword_10002C8F0);
  sub_10000B308(v41, v43 + *(int *)(v44 + 48), &qword_10002C8E0);
  sub_10000B308(v42, v43 + *(int *)(v44 + 64), &qword_10002C8E0);
  sub_10000B36C((uint64_t)v12, &qword_10002C8E0);
  sub_10000B36C((uint64_t)v15, &qword_10002C8E0);
  sub_10000B36C((uint64_t)v17, &qword_10002C8E0);
  sub_10000B36C(v42, &qword_10002C8E0);
  sub_10000B36C(v41, &qword_10002C8E0);
  return sub_10000B36C(v40, &qword_10002C8E0);
}

uint64_t sub_100017094@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = (int *)type metadata accessor for SeatingAttributesTableColumn();
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v14 = (uint64_t *)((char *)&v30 - v13);
  unint64_t v15 = *a1;
  if ((*a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  unint64_t v16 = *(void *)(*(void *)a2 + 16);
  if (v15 >= v16)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  uint64_t v17 = *(void *)a2 + 32 * v15;
  uint64_t v33 = a4;
  uint64_t v31 = a2;
  uint64_t v18 = *(void *)(v17 + 32);
  uint64_t v32 = *(void *)(v17 + 40);
  uint64_t v19 = v32;
  char v20 = a3;
  uint64_t v21 = sub_10001F500();
  uint64_t v23 = v22;
  *uint64_t v14 = swift_getKeyPath();
  sub_10000590C(&qword_10002C928);
  swift_storeEnumTagMultiPayload();
  long long v24 = (uint64_t *)((char *)v14 + v8[5]);
  *long long v24 = v18;
  v24[1] = v19;
  uint64_t v25 = (uint64_t *)((char *)v14 + v8[6]);
  *uint64_t v25 = v21;
  v25[1] = v23;
  *((unsigned char *)v14 + v8[7]) = v20;
  sub_10000B2A4(v31 + 16, (uint64_t)v34, &qword_10002C930);
  sub_10000B2A4((uint64_t)v34, (uint64_t)&v35, &qword_10002C930);
  char v26 = v36 & 1 | (v15 >= v16 - 1);
  if (v26) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = v35;
  }
  sub_1000183F0((uint64_t)v14, (uint64_t)v11);
  uint64_t v28 = v33;
  sub_1000183F0((uint64_t)v11, v33);
  uint64_t v29 = v28 + *(int *)(sub_10000590C(&qword_10002C938) + 48);
  *(void *)uint64_t v29 = v27;
  *(unsigned char *)(v29 + 8) = 0;
  *(unsigned char *)(v29 + 9) = v26;
  swift_bridgeObjectRetain();
  sub_100018454((uint64_t)v14);
  return sub_100018454((uint64_t)v11);
}

uint64_t sub_100017288@<X0>(unsigned char *a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  uint64_t v7 = *(void *)(v1 + 32);
  *a1 = sub_10001EFA0();
  uint64_t v4 = sub_10000590C(&qword_10002C8D8);
  return sub_1000169D8((uint64_t)v6, (uint64_t)&a1[*(int *)(v4 + 44)]);
}

uint64_t sub_1000172E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10001EE80();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000590C(&qword_10002C928);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B308(v2, (uint64_t)v10, &qword_10002C928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_10001ED60();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_10001F540();
    uint64_t v14 = sub_10001EF90();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_100017638(0xD000000000000010, 0x800000010001FC80, &v17);
      _os_log_impl((void *)&_mh_execute_header, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10001EE70();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_100017570(uint64_t a1)
{
  uint64_t v2 = sub_10001ED60();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_10001EDC0();
}

unint64_t sub_100017638(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_10001770C(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001989C((uint64_t)v12, *a3);
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
      sub_10001989C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001984C((uint64_t)v12);
  return v7;
}

unint64_t sub_10001770C(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_10001780C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_10001F590();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

char *sub_10001780C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_1000178A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000179A8(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000179A8((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_1000178A4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_100017940(v2, 0);
      unint64_t result = (void *)sub_10001F580();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_10001F530();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100017940(uint64_t a1, uint64_t a2)
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
  sub_10000590C(&qword_10002CB60);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1000179A8(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000590C(&qword_10002CB60);
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
  os_log_type_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100017A94(uint64_t a1)
{
  uint64_t v2 = sub_10000590C(&qword_10002CA68);
  __chkstk_darwin(v2 - 8);
  sub_10000B308(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_10002CA68);
  return sub_10001EE00();
}

char *sub_100017B28(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100017B48(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_100017B48(char *result, int64_t a2, char a3, char *a4)
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
    sub_10000590C(&qword_10002C8D0);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  os_log_type_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
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

uint64_t sub_100017C4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v39 = sub_10001EC40();
  uint64_t v12 = *(void *)(v39 - 8);
  uint64_t result = __chkstk_darwin(v39);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v16 = *(void *)(a1 + 16);
  uint64_t v17 = &_swiftEmptyArrayStorage;
  if (v16)
  {
    uint64_t v31 = a2;
    uint64_t v32 = a3;
    uint64_t v33 = a5;
    int v34 = a4;
    uint64_t v40 = &_swiftEmptyArrayStorage;
    sub_100017B28(0, v16, 0);
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    uint64_t v18 = v12 + 16;
    uint64_t v20 = a1 + ((*(unsigned __int8 *)(v18 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 64));
    uint64_t v36 = *(void *)(v18 + 56);
    uint64_t v37 = v19;
    uint64_t v35 = (void (**)(char *, uint64_t))(v18 - 8);
    uint64_t v38 = v18;
    do
    {
      uint64_t v21 = v39;
      v37(v15, v20, v39);
      uint64_t v22 = sub_10001EC20();
      uint64_t v24 = v23;
      uint64_t v25 = sub_10001EC30();
      uint64_t v27 = v26;
      (*v35)(v15, v21);
      uint64_t v17 = v40;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_100017B28(0, v17[2] + 1, 1);
        uint64_t v17 = v40;
      }
      unint64_t v29 = v17[2];
      unint64_t v28 = v17[3];
      if (v29 >= v28 >> 1)
      {
        uint64_t result = (uint64_t)sub_100017B28((char *)(v28 > 1), v29 + 1, 1);
        uint64_t v17 = v40;
      }
      v17[2] = v29 + 1;
      uint64_t v30 = &v17[4 * v29];
      v30[4] = v22;
      v30[5] = v24;
      v30[6] = v25;
      v30[7] = v27;
      v20 += v36;
      --v16;
    }
    while (v16);
    LOBYTE(a4) = v34;
    a3 = v32;
    a5 = v33;
    a2 = v31;
  }
  *(void *)a5 = v17;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  *(unsigned char *)(a5 + 24) = a4 & 1;
  *(double *)(a5 + 32) = a6;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SeatingAttributesTable.Item(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SeatingAttributesTable.Item()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SeatingAttributesTable.Item(void *a1, void *a2)
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

void *assignWithCopy for SeatingAttributesTable.Item(void *a1, void *a2)
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

__n128 initializeWithTake for SeatingAttributesTable.Item(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for SeatingAttributesTable.Item(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for SeatingAttributesTable.Item(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SeatingAttributesTable.Item(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SeatingAttributesTable.Item()
{
  return &type metadata for SeatingAttributesTable.Item;
}

uint64_t destroy for SeatingAttributesTable()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SeatingAttributesTable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SeatingAttributesTable(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

__n128 initializeWithTake for SeatingAttributesTable(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SeatingAttributesTable(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SeatingAttributesTable(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SeatingAttributesTable(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SeatingAttributesTable()
{
  return &type metadata for SeatingAttributesTable;
}

uint64_t sub_10001824C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100018268()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 57, 7);
}

uint64_t sub_1000182A0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100017094(a1, v2 + 16, *(unsigned char *)(v2 + 56), a2);
}

unint64_t sub_1000182AC()
{
  unint64_t result = qword_10002C910;
  if (!qword_10002C910)
  {
    sub_100005950(&qword_10002C900);
    sub_100018328();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C910);
  }
  return result;
}

unint64_t sub_100018328()
{
  unint64_t result = qword_10002C918;
  if (!qword_10002C918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C918);
  }
  return result;
}

uint64_t type metadata accessor for SeatingAttributesTableColumn()
{
  uint64_t result = qword_10002C9A0;
  if (!qword_10002C9A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000183C8()
{
  return sub_10001EDB0();
}

uint64_t sub_1000183F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SeatingAttributesTableColumn();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018454(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SeatingAttributesTableColumn();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1000184B0(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_10000590C(&qword_10002C928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10001ED60();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    int64_t v11 = (void *)((char *)a1 + v9);
    uint64_t v12 = (void *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *int64_t v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = (void *)((char *)a1 + v10);
    uint64_t v15 = (void *)((char *)a2 + v10);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1000185FC(uint64_t a1)
{
  sub_10000590C(&qword_10002C928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_10001ED60();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_1000186B0(void *a1, void *a2, int *a3)
{
  sub_10000590C(&qword_10002C928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10001ED60();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)((char *)a1 + v8);
  uint64_t v13 = (void *)((char *)a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1000187AC(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_10000B36C((uint64_t)a1, &qword_10002C928);
    sub_10000590C(&qword_10002C928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10001ED60();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

char *sub_1000188E8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10000590C(&qword_10002C928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10001ED60();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *sub_1000189D0(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_10000B36C((uint64_t)a1, &qword_10002C928);
    uint64_t v6 = sub_10000590C(&qword_10002C928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10001ED60();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v17 = *(void *)v15;
  uint64_t v16 = *((void *)v15 + 1);
  *(void *)uint64_t v14 = v17;
  *((void *)v14 + 1) = v16;
  swift_bridgeObjectRelease();
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

uint64_t sub_100018AF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100018B08);
}

uint64_t sub_100018B08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000590C(&qword_10002C940);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100018BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100018BE4);
}

uint64_t sub_100018BE4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10000590C(&qword_10002C940);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

void sub_100018CA8()
{
  sub_100018D48();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100018D48()
{
  if (!qword_10002C9B0)
  {
    sub_10001ED60();
    unint64_t v0 = sub_10001ED20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002C9B0);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for SeatingAttributesTableSize(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SeatingAttributesTableSize(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SeatingAttributesTableSize(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x100018F0CLL);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_100018F34(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100018F3C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SeatingAttributesTableSize()
{
  return &type metadata for SeatingAttributesTableSize;
}

ValueMetadata *type metadata accessor for SeatingAttributesTableSize.Set()
{
  return &type metadata for SeatingAttributesTableSize.Set;
}

uint64_t sub_100018F64()
{
  return sub_100005F60(&qword_10002C9E8, &qword_10002C9F0);
}

unint64_t sub_100018FA4()
{
  unint64_t result = qword_10002C9F8;
  if (!qword_10002C9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C9F8);
  }
  return result;
}

unint64_t sub_100018FFC()
{
  unint64_t result = qword_10002CA00;
  if (!qword_10002CA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CA00);
  }
  return result;
}

unint64_t sub_100019054()
{
  unint64_t result = qword_10002CA08;
  if (!qword_10002CA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CA08);
  }
  return result;
}

unint64_t sub_1000190AC()
{
  unint64_t result = qword_10002CA10;
  if (!qword_10002CA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CA10);
  }
  return result;
}

unint64_t sub_100019104()
{
  unint64_t result = qword_10002CA18;
  if (!qword_10002CA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CA18);
  }
  return result;
}

uint64_t sub_100019158()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100019184(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001ED60();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000191C8()
{
  unint64_t result = qword_10002CAF0;
  if (!qword_10002CAF0)
  {
    sub_100005950(&qword_10002CAC0);
    sub_100019244();
    sub_100019510();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CAF0);
  }
  return result;
}

unint64_t sub_100019244()
{
  unint64_t result = qword_10002CAF8;
  if (!qword_10002CAF8)
  {
    sub_100005950(&qword_10002CA90);
    sub_1000192C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CAF8);
  }
  return result;
}

unint64_t sub_1000192C0()
{
  unint64_t result = qword_10002CB00;
  if (!qword_10002CB00)
  {
    sub_100005950(&qword_10002CA88);
    sub_100019360();
    sub_100005F60(&qword_10002CB30, &qword_10002CB38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CB00);
  }
  return result;
}

unint64_t sub_100019360()
{
  unint64_t result = qword_10002CB08;
  if (!qword_10002CB08)
  {
    sub_100005950(&qword_10002CA80);
    sub_100005950(&qword_10002CA70);
    sub_100005950(&qword_10002CB10);
    sub_100019470();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_100005F60(&qword_10002CB20, &qword_10002CB28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CB08);
  }
  return result;
}

unint64_t sub_100019470()
{
  unint64_t result = qword_10002CB18;
  if (!qword_10002CB18)
  {
    sub_100005950(&qword_10002CB10);
    sub_100005F60(&qword_10002C698, &qword_10002C6A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CB18);
  }
  return result;
}

unint64_t sub_100019510()
{
  unint64_t result = qword_10002CB40;
  if (!qword_10002CB40)
  {
    sub_100005950(&qword_10002CAB8);
    sub_100005950(&qword_10002CAA8);
    sub_100005950(&qword_10002CAA0);
    sub_100019644(&qword_10002CB48, &qword_10002CAA0, (void (*)(void))sub_10000AFF4);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_100005F60(&qword_10002CB30, &qword_10002CB38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CB40);
  }
  return result;
}

uint64_t sub_100019644(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005950(a2);
    a3();
    sub_100005F60(&qword_10002C698, &qword_10002C6A0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000196E8()
{
  unint64_t result = qword_10002CB50;
  if (!qword_10002CB50)
  {
    sub_100005950(&qword_10002CAD8);
    sub_100005950(&qword_10002C828);
    sub_100005950(&qword_10002C688);
    sub_100019644((unint64_t *)&qword_10002C690, &qword_10002C688, (void (*)(void))sub_10000AE84);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_100005F60(&qword_10002CB30, &qword_10002CB38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CB50);
  }
  return result;
}

uint64_t sub_100019824()
{
  return sub_10001EDF0();
}

uint64_t sub_10001984C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001989C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000198F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  unsigned int v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_100019930()
{
  return sub_100005F60(&qword_10002CB68, &qword_10002CB70);
}

ValueMetadata *type metadata accessor for IconDeepLink()
{
  return &type metadata for IconDeepLink;
}

uint64_t sub_100019990()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_1000199AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v63 = a1;
  uint64_t v1 = sub_10001ECF0();
  uint64_t v73 = *(void *)(v1 - 8);
  uint64_t v74 = v1;
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v68 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v70 = (char *)&v58 - v4;
  uint64_t v5 = sub_10000590C(&qword_10002C250);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_10000590C(&qword_10002CBA8);
  uint64_t v9 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_10000590C(&qword_10002CBB0);
  uint64_t v67 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_10000590C(&qword_10002CBB8);
  uint64_t v58 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v72 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000590C(&qword_10002CBC0);
  uint64_t v61 = *(void *)(v15 - 8);
  uint64_t v62 = v15;
  __chkstk_darwin(v15);
  uint64_t v59 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001AB1C();
  sub_10001AB70();
  swift_bridgeObjectRetain();
  sub_10001F3D0();
  uint64_t v17 = sub_100005F60(&qword_10002C258, &qword_10002C250);
  sub_10001EF50();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10000590C(&qword_10002CBD8);
  uint64_t v18 = sub_10001F2E0();
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_100020A50;
  (*(void (**)(unint64_t, void, uint64_t))(v19 + 104))(v21 + v20, enum case for WidgetFamily.accessoryCircular(_:), v18);
  uint64_t v75 = v5;
  uint64_t v76 = v17;
  uint64_t v22 = v70;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v66 = v13;
  uint64_t v24 = v69;
  sub_10001EF20();
  uint64_t v25 = v73;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v24);
  uint64_t v26 = *(void (**)(void))(v25 + 104);
  unsigned int v65 = enum case for LocalizedStringTable.nearbyPeerPayment(_:);
  uint64_t v64 = (void (*)(char *, void, uint64_t))v26;
  v26(v22);
  id result = (id)PKPassKitBundle();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  unint64_t v28 = result;
  uint64_t v29 = sub_10001ECE0();
  uint64_t v31 = v30;

  uint64_t v32 = *(char **)(v25 + 8);
  uint64_t v33 = v22;
  uint64_t v34 = v74;
  uint64_t v73 = v25 + 8;
  uint64_t v70 = v32;
  ((void (*)(char *, uint64_t))v32)(v33, v74);
  uint64_t v75 = v29;
  uint64_t v76 = v31;
  sub_100005FA4();
  uint64_t v35 = sub_10001F120();
  uint64_t v37 = v36;
  char v39 = v38 & 1;
  uint64_t v75 = v24;
  uint64_t v76 = OpaqueTypeConformance2;
  uint64_t v40 = swift_getOpaqueTypeConformance2();
  uint64_t v41 = v71;
  uint64_t v42 = v66;
  sub_10001EF60();
  sub_10000AF24(v35, v37, v39);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v42, v41);
  uint64_t v43 = v68;
  v64(v68, v65, v34);
  id result = (id)PKPassKitBundle();
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v44 = result;
  uint64_t v45 = sub_10001ECE0();
  uint64_t v47 = v46;

  ((void (*)(char *, uint64_t))v70)(v43, v74);
  uint64_t v75 = v45;
  uint64_t v76 = v47;
  uint64_t v48 = sub_10001F120();
  uint64_t v50 = v49;
  char v52 = v51 & 1;
  uint64_t v75 = v71;
  uint64_t v76 = v40;
  uint64_t v53 = swift_getOpaqueTypeConformance2();
  uint64_t v55 = v59;
  uint64_t v54 = v60;
  char v56 = v72;
  sub_10001EF00();
  sub_10000AF24(v48, v50, v52);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v56, v54);
  if (qword_10002C248 != -1) {
    swift_once();
  }
  uint64_t v75 = v54;
  uint64_t v76 = v53;
  swift_getOpaqueTypeConformance2();
  uint64_t v57 = v62;
  sub_10001EF70();
  return (id)(*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v55, v57);
}

uint64_t sub_10001A1F0()
{
  uint64_t v0 = sub_10000590C(&qword_10002CB90);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001F250();
  uint64_t v4 = sub_10001F050();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 1, 1, v4);
  uint64_t v5 = sub_10001F0A0();
  sub_10001A3DC((uint64_t)v2);
  uint64_t KeyPath = swift_getKeyPath();
  v9[1] = v3;
  v9[2] = KeyPath;
  v9[3] = v5;
  if (qword_10002C240 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_10000590C(&qword_10002C5B8);
  sub_10001AA7C(v7, (uint64_t)qword_10002E7A8);
  sub_10000590C(&qword_10002CB10);
  sub_100019470();
  sub_10001F150();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_10001A398@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_10001EEA0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  sub_10000590C(&qword_10002CB88);
  return sub_10001A1F0();
}

uint64_t sub_10001A3DC(uint64_t a1)
{
  uint64_t v2 = sub_10000590C(&qword_10002CB90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001A43C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10001EB90();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_10001A4AC(uint64_t a1, void (*a2)(char *))
{
  uint64_t v3 = type metadata accessor for NearbyPeerPaymentWidgetSimpleEntry();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001EB80();
  a2(v5);
  return sub_10001AE40((uint64_t)v5);
}

uint64_t sub_10001A53C(uint64_t a1, void (*a2)(char *))
{
  uint64_t v15 = a2;
  uint64_t v2 = sub_10001F3F0();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_10000590C(&qword_10002CBF8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for NearbyPeerPaymentWidgetSimpleEntry();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001EB80();
  sub_10000590C(&qword_10002CC00);
  unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100020A50;
  sub_10001ADDC((uint64_t)v10, v12 + v11);
  sub_10001F3E0();
  sub_10001AD38();
  sub_10001F4A0();
  v15(v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_10001AE40((uint64_t)v10);
}

uint64_t sub_10001A770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10001A824;
  return TimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10001A824()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001A918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10001B28C;
  return TimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_10001A9CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001EE30();
  *a1 = result;
  return result;
}

uint64_t sub_10001A9F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001EE30();
  *a1 = result;
  return result;
}

uint64_t sub_10001AA24()
{
  return sub_10001EE40();
}

uint64_t sub_10001AA50()
{
  return sub_10001EE40();
}

uint64_t sub_10001AA7C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

ValueMetadata *type metadata accessor for NearbyPeerPaymentWidget()
{
  return &type metadata for NearbyPeerPaymentWidget;
}

uint64_t sub_10001AAC4()
{
  return sub_100005F60(&qword_10002CB98, &qword_10002CBA0);
}

uint64_t sub_10001AB00()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001AB1C()
{
  unint64_t result = qword_10002CBC8;
  if (!qword_10002CBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CBC8);
  }
  return result;
}

unint64_t sub_10001AB70()
{
  unint64_t result = qword_10002CBD0;
  if (!qword_10002CBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CBD0);
  }
  return result;
}

ValueMetadata *type metadata accessor for NearbyPeerPaymentTimelineProvider()
{
  return &type metadata for NearbyPeerPaymentTimelineProvider;
}

uint64_t sub_10001ABD4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001AD38()
{
  unint64_t result = qword_10002CBE0[0];
  if (!qword_10002CBE0[0])
  {
    type metadata accessor for NearbyPeerPaymentWidgetSimpleEntry();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10002CBE0);
  }
  return result;
}

uint64_t type metadata accessor for NearbyPeerPaymentWidgetSimpleEntry()
{
  uint64_t result = qword_10002CC60;
  if (!qword_10002CC60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001ADDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NearbyPeerPaymentWidgetSimpleEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001AE40(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NearbyPeerPaymentWidgetSimpleEntry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001AE9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001EB90();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_10001AF08(uint64_t a1)
{
  uint64_t v2 = sub_10001EB90();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_10001AF6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001EB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10001AFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001EB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_10001B034(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001EB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10001B098(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001EB90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_10001B0FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001B110);
}

uint64_t sub_10001B110(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001EB90();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10001B17C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001B190);
}

uint64_t sub_10001B190(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001EB90();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_10001B200()
{
  uint64_t result = sub_10001EB90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

double sub_10001B290()
{
  double result = 63.0;
  xmmword_10002E730 = xmmword_100020C40;
  return result;
}

void *sub_10001B2A4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2[4];
  if (v5)
  {
    BOOL v6 = v2[3] == a1 && v5 == a2;
    if (v6 || (sub_10001F5D0() & 1) != 0)
    {
      uint64_t v7 = (void *)v2[2];
      id v8 = v7;
      return v7;
    }
  }
  uint64_t v9 = (void *)v2[2];
  v2[2] = 0;

  uint64_t v10 = (void *)v2[5];
  if (!v10) {
    return 0;
  }
  NSString v11 = sub_10001F4C0();
  id v12 = [v10 passWithUniqueID:v11];

  if (!v12) {
    return 0;
  }
  id v13 = [objc_allocWithZone((Class)PKPassView) initWithPass:v12 content:5];
  if (!v13)
  {

    return 0;
  }
  uint64_t v14 = v13;
  if (qword_10002C210 != -1) {
    swift_once();
  }
  id v15 = [v14 snapshotOfFrontFaceWithRequestedSize:xmmword_10002E730];
  uint64_t v7 = v15;
  if (v15)
  {
    uint64_t v16 = (void *)v2[2];
    v2[2] = v15;
    id v17 = v15;

    v2[3] = a1;
    v2[4] = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    [v12 flushLoadedImageSets];
  }

  return v7;
}

uint64_t sub_10001B438()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for PassLiveActivityImageProvider()
{
  return self;
}

uint64_t destroy for PassLiveActivityImage(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *initializeWithCopy for PassLiveActivityImage(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v5 = (void *)a2[2];
  uint64_t v4 = a2[3];
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  id v6 = v5;
  swift_retain();
  return a1;
}

void *assignWithCopy for PassLiveActivityImage(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[2];
  uint64_t v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PassLiveActivityImage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PassLiveActivityImage()
{
  return &type metadata for PassLiveActivityImage;
}

uint64_t sub_10001B618()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_10001B634@<D0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10001F240();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v8 = a1;
    sub_10001F220();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
    uint64_t v9 = sub_10001F260();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v14 = v9;
    uint64_t v15 = 0;
    __int16 v16 = 1;
    char v17 = 0;
    swift_retain();
    sub_10000590C(&qword_10002CD80);
    sub_10001B838();
    sub_10001EF80();
    swift_release();
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    __int16 v16 = 0;
    char v17 = 1;
    sub_10000590C(&qword_10002CD80);
    sub_10001B838();
    sub_10001EF80();
  }
  double result = *(double *)&v18;
  __int16 v11 = v19;
  char v12 = v20;
  *(_OWORD *)a2 = v18;
  *(_WORD *)(a2 + 16) = v11;
  *(unsigned char *)(a2 + 18) = v12;
  return result;
}

double sub_10001B830@<D0>(uint64_t a1@<X8>)
{
  return sub_10001B634(*(void **)(v1 + 16), a1);
}

unint64_t sub_10001B838()
{
  unint64_t result = qword_10002CD88;
  if (!qword_10002CD88)
  {
    sub_100005950(&qword_10002CD80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CD88);
  }
  return result;
}

unint64_t sub_10001B8B0()
{
  unint64_t result = qword_10002CD90;
  if (!qword_10002CD90)
  {
    sub_100005950(&qword_10002CD98);
    sub_10001B838();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CD90);
  }
  return result;
}

unint64_t sub_10001B930()
{
  unint64_t result = qword_10002CDA0;
  if (!qword_10002CDA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CDA0);
  }
  return result;
}

unint64_t sub_10001B988()
{
  unint64_t result = qword_10002CDA8;
  if (!qword_10002CDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CDA8);
  }
  return result;
}

uint64_t sub_10001B9DC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10001BA10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001BA60()
{
  uint64_t v0 = sub_10001EB40();
  sub_10001C5B8(v0, qword_10002E740);
  sub_10001AA7C(v0, (uint64_t)qword_10002E740);
  return sub_10001EB30();
}

uint64_t sub_10001BAC8(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_10001EA10();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  sub_10000590C(&qword_10002C5B8);
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  uint64_t v3 = sub_10001EB70();
  v1[8] = v3;
  v1[9] = *(void *)(v3 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  uint64_t v4 = sub_10001EB20();
  v1[13] = v4;
  v1[14] = *(void *)(v4 - 8);
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  return _swift_task_switch(sub_10001BCAC, 0, 0);
}

uint64_t sub_10001BCAC()
{
  sub_10001C40C();
  id v1 = [objc_allocWithZone((Class)PKPeerPaymentService) init];
  id v2 = [v1 account];

  if (v2)
  {
    id v3 = v2;
    if ([v3 supportsDeviceTap])
    {
      uint64_t v4 = v0 + 16;
      uint64_t v5 = v0[8];
      uint64_t v6 = v0[9];
      uint64_t v7 = v0[7];
      sub_10001EB10();
      sub_10001F4F0();
      sub_10001EB00();
      sub_10001F4F0();
      sub_10001EAE0();
      v29._countAndFlagsBits = sub_10001F4F0();
      sub_10001F520(v29);
      swift_bridgeObjectRelease();
      sub_10001EAF0();
      sub_10001EAD0();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5) == 1)
      {
        sub_10001C510(v0[7]);
        sub_10001E970();
        sub_10001C570(&qword_10002CDD0, (void (*)(uint64_t))&type metadata accessor for AppIntentError);
        swift_allocError();
        sub_10001E960();
        swift_willThrow();

LABEL_8:
        (*(void (**)(void, uint64_t))(v0[14] + 8))(*v4, v0[13]);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        __int16 v11 = (uint64_t (*)(void))v0[1];
        goto LABEL_12;
      }
      uint64_t v14 = v0 + 12;
      uint64_t v17 = v0[12];
      uint64_t v18 = v0[11];
      uint64_t v19 = v0[8];
      uint64_t v20 = v0[9];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v17, v0[7], v19);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v18, v17, v19);
      sub_10001EA20();
      sub_10001C570(&qword_10002CDD8, (void (*)(uint64_t))&type metadata accessor for OpenURLIntent);
      sub_10001E9F0();

      goto LABEL_11;
    }
  }
  uint64_t v4 = v0 + 15;
  uint64_t v8 = v0[8];
  uint64_t v9 = v0[9];
  uint64_t v10 = v0[6];
  sub_10001EB10();
  sub_10001F4F0();
  sub_10001EB00();
  sub_10001EAD0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v10, 1, v8) == 1)
  {
    sub_10001C510(v0[6]);
    sub_10001E970();
    sub_10001C570(&qword_10002CDD0, (void (*)(uint64_t))&type metadata accessor for AppIntentError);
    swift_allocError();
    sub_10001E960();
    swift_willThrow();
    id v3 = v2;
    goto LABEL_8;
  }
  uint64_t v13 = v0[10];
  uint64_t v12 = v0[11];
  uint64_t v14 = v0 + 10;
  uint64_t v15 = v0[8];
  uint64_t v16 = v0[9];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v13, v0[6], v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v12, v13, v15);
  sub_10001EA20();
  sub_10001C570(&qword_10002CDD8, (void (*)(uint64_t))&type metadata accessor for OpenURLIntent);
  sub_10001E9F0();
  id v3 = v2;
LABEL_11:

  uint64_t v21 = *v4;
  uint64_t v22 = *v14;
  uint64_t v23 = v0[13];
  uint64_t v24 = v0[14];
  uint64_t v25 = v0[9];
  uint64_t v26 = v0[8];
  (*(void (**)(uint64_t, uint64_t))(v0[4] + 8))(v0[5], v0[3]);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v22, v26);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v21, v23);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  __int16 v11 = (uint64_t (*)(void))v0[1];
LABEL_12:
  return v11();
}

uint64_t sub_10001C208@<X0>(uint64_t a1@<X8>)
{
  if (qword_10002C218 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001EB40();
  uint64_t v3 = sub_10001AA7C(v2, (uint64_t)qword_10002E740);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10001C2B8()
{
  return 1;
}

uint64_t sub_10001C2C8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10001A824;
  return sub_10001BAC8(a1);
}

uint64_t sub_10001C360(uint64_t a1)
{
  unint64_t v2 = sub_100014140();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for NearbyPeerPaymentFromControlCenter()
{
  return &type metadata for NearbyPeerPaymentFromControlCenter;
}

unint64_t sub_10001C3B0()
{
  unint64_t result = qword_10002CDB8;
  if (!qword_10002CDB8)
  {
    sub_100005950(&qword_10002CDC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CDB8);
  }
  return result;
}

uint64_t sub_10001C40C()
{
  [self beginSubjectReporting:PKAnalyticsSubjectAppleCash];
  sub_10000590C(&qword_10002CDE0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100020D00;
  uint64_t v1 = (void *)PKAnalyticsReportPageTagKey;
  *(void *)(inited + 32) = PKAnalyticsReportPageTagKey;
  *(void *)(inited + 40) = sub_10001F4F0();
  *(void *)(inited + 48) = v2;
  uint64_t v3 = (void *)PKAnalyticsReportButtonTagKey;
  *(void *)(inited + 56) = PKAnalyticsReportButtonTagKey;
  *(void *)(inited + 64) = sub_10001F4F0();
  *(void *)(inited + 72) = v4;
  uint64_t v5 = (void *)PKAnalyticsReportPeerPaymentP2PSideKey;
  *(void *)(inited + 80) = PKAnalyticsReportPeerPaymentP2PSideKey;
  *(void *)(inited + 88) = sub_10001F4F0();
  *(void *)(inited + 96) = v6;
  id v7 = v1;
  id v8 = v3;
  id v9 = v5;
  sub_10001C6CC(inited);
  sub_10001F2D0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001C510(uint64_t a1)
{
  uint64_t v2 = sub_10000590C(&qword_10002C5B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001C570(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_10001C5B8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_10001C620()
{
  unint64_t result = qword_10002CDE8;
  if (!qword_10002CDE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CDE8);
  }
  return result;
}

unint64_t sub_10001C678()
{
  unint64_t result = qword_10002CDF0;
  if (!qword_10002CDF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CDF0);
  }
  return result;
}

unint64_t sub_10001C6CC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000590C(&qword_10002CEB0);
  uint64_t v2 = (void *)sub_10001F5A0();
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
    uint64_t v5 = *(v4 - 1);
    uint64_t v6 = *v4;
    id v7 = (id)*(v4 - 2);
    swift_bridgeObjectRetain();
    unint64_t result = sub_10001DAF8((uint64_t)v7);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v7;
    uint64_t v10 = (void *)(v2[7] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_10001C7E4(uint64_t a1)
{
  uint64_t v2 = sub_10000590C(&qword_10002CE88);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    id v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000590C(&qword_10002CE90);
  uint64_t v6 = sub_10001F5A0();
  id v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = v6 + 64;
  uint64_t v10 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v11 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10001DD94(v10, (uint64_t)v5);
    unint64_t result = sub_10001DD30();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v7[7];
    uint64_t v16 = sub_10001EA80();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v5, v16);
    uint64_t v17 = v7[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v7[2] = v19;
    v10 += v11;
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

uint64_t sub_10001C9A8(uint64_t a1)
{
  return sub_10001D0C8(a1, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, qword_10002E758, (uint64_t (*)(unint64_t, unint64_t))&LocalizedStringResource.init(stringLiteral:));
}

uint64_t sub_10001C9DC()
{
  uint64_t v0 = sub_10001EAC0();
  sub_10001C5B8(v0, qword_10002E770);
  uint64_t v1 = sub_10001AA7C(v0, (uint64_t)qword_10002E770);
  uint64_t v2 = enum case for IntentAuthenticationPolicy.alwaysAllowed(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);

  return v3(v1, v2, v0);
}

id sub_10001CA64()
{
  uint64_t v0 = sub_10000590C(&qword_10002C5B8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001EB70();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10001EB20();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = self;
  if ([v11 contactlessInterfaceCanBePresentedFromSource:2])
  {
    id result = [v11 sharedInstance];
    if (result)
    {
      char v13 = result;
      [result presentContactlessInterfaceForDefaultPassFromSource:2 completion:0];

      return (id)sub_10001EA00();
    }
    __break(1u);
    goto LABEL_9;
  }
  sub_10001EB10();
  sub_10001F4F0();
  sub_10001EB00();
  sub_10001EAD0();
  id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if (result == 1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  id result = [self defaultWorkspace];
  if (result)
  {
    uint64_t v15 = result;
    sub_10001EB50(v14);
    uint64_t v17 = v16;
    [v15 openSensitiveURL:v16 withOptions:0];

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return (id)sub_10001EA00();
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_10001CD48()
{
  return sub_10001EA40();
}

uint64_t sub_10001CD6C()
{
  return sub_10001EA50();
}

void (*sub_10001CD90(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10001EA30();
  return sub_10001CDEC;
}

void sub_10001CDEC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_10001CE40()
{
  unint64_t result = qword_10002CDF8;
  if (!qword_10002CDF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CDF8);
  }
  return result;
}

unint64_t sub_10001CE98()
{
  unint64_t result = qword_10002CE00;
  if (!qword_10002CE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE00);
  }
  return result;
}

uint64_t sub_10001CEEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001CF08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001D6A0(a1, a2, a3, (void (*)(void))sub_100005F0C);
}

uint64_t sub_10001CF34@<X0>(uint64_t a1@<X8>)
{
  return sub_10001D5D0(&qword_10002C220, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10002E758, a1);
}

uint64_t sub_10001CF6C()
{
  return 0;
}

uint64_t sub_10001CF74@<X0>(uint64_t a1@<X8>)
{
  return sub_10001D5D0(&qword_10002C228, (uint64_t (*)(void))&type metadata accessor for IntentAuthenticationPolicy, (uint64_t)qword_10002E770, a1);
}

uint64_t sub_10001CFAC()
{
  sub_10001CA64();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return sub_10001E0E4(v1);
}

uint64_t sub_10001D030@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001DDFC();
  *a1 = result;
  return result;
}

uint64_t sub_10001D058(uint64_t a1)
{
  unint64_t v2 = sub_100005F0C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10001D094(uint64_t a1)
{
  return sub_10001D0C8(a1, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, qword_10002E788, (uint64_t (*)(unint64_t, unint64_t))&TypeDisplayRepresentation.init(stringLiteral:));
}

uint64_t sub_10001D0C8(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(unint64_t, unint64_t))
{
  uint64_t v6 = a2(0);
  sub_10001C5B8(v6, a3);
  sub_10001AA7C(v6, (uint64_t)a3);
  return a4(0xD000000000000013, 0x800000010001FDA0);
}

unint64_t sub_10001D13C()
{
  sub_10000590C(&qword_10002CE80);
  sub_10000590C(&qword_10002CE88);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100020A50;
  sub_10001EA70();
  unint64_t result = sub_10001C7E4(v0);
  qword_10002E7A0 = result;
  return result;
}

unint64_t sub_10001D208()
{
  unint64_t result = qword_10002CE10;
  if (!qword_10002CE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE10);
  }
  return result;
}

Swift::Int sub_10001D25C()
{
  return sub_10001F600();
}

uint64_t sub_10001D2AC()
{
  return sub_10001F510();
}

Swift::Int sub_10001D2C0()
{
  return sub_10001F600();
}

uint64_t sub_10001D30C@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100029640;
  v7._object = v3;
  Swift::Int v5 = sub_10001F5C0(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_10001D360(void *a1@<X8>)
{
  *a1 = 0x68636E75616CLL;
  a1[1] = 0xE600000000000000;
}

unint64_t sub_10001D37C()
{
  unint64_t result = qword_10002CE18;
  if (!qword_10002CE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE18);
  }
  return result;
}

unint64_t sub_10001D3D4()
{
  unint64_t result = qword_10002CE20;
  if (!qword_10002CE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE20);
  }
  return result;
}

void *sub_10001D428()
{
  return &protocol witness table for String;
}

unint64_t sub_10001D438()
{
  unint64_t result = qword_10002CE28;
  if (!qword_10002CE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE28);
  }
  return result;
}

unint64_t sub_10001D490()
{
  unint64_t result = qword_10002CE30;
  if (!qword_10002CE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE30);
  }
  return result;
}

unint64_t sub_10001D4E8()
{
  unint64_t result = qword_10002CE38;
  if (!qword_10002CE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE38);
  }
  return result;
}

unint64_t sub_10001D540()
{
  unint64_t result = qword_10002CE40;
  if (!qword_10002CE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE40);
  }
  return result;
}

uint64_t sub_10001D598@<X0>(uint64_t a1@<X8>)
{
  return sub_10001D5D0(&qword_10002C230, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10002E788, a1);
}

uint64_t sub_10001D5D0@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_10001AA7C(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10001D674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001D6A0(a1, a2, a3, (void (*)(void))sub_10001D6E8);
}

uint64_t sub_10001D6A0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001D6E8()
{
  unint64_t result = qword_10002CE48;
  if (!qword_10002CE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE48);
  }
  return result;
}

uint64_t sub_10001D73C(uint64_t a1)
{
  unint64_t v2 = sub_10001D6E8();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001D78C()
{
  unint64_t result = qword_10002CE50;
  if (!qword_10002CE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE50);
  }
  return result;
}

unint64_t sub_10001D7E4()
{
  unint64_t result = qword_10002CE58;
  if (!qword_10002CE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE58);
  }
  return result;
}

unint64_t sub_10001D83C()
{
  unint64_t result = qword_10002CE60;
  if (!qword_10002CE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE60);
  }
  return result;
}

uint64_t sub_10001D890()
{
  if (qword_10002C238 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_10001D8EC(uint64_t a1)
{
  unint64_t v2 = sub_10001D540();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10001D938()
{
  return sub_100005F60(&qword_10002CE68, &qword_10002CE70);
}

void sub_10001D974(void *a1@<X8>)
{
  *a1 = &off_100029678;
}

uint64_t getEnumTagSinglePayload for LaunchFromControlCenterEnum(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for LaunchFromControlCenterEnum(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10001DA74);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchFromControlCenterEnum()
{
  return &type metadata for LaunchFromControlCenterEnum;
}

ValueMetadata *type metadata accessor for LaunchFromControlCenter()
{
  return &type metadata for LaunchFromControlCenter;
}

uint64_t sub_10001DABC()
{
  return sub_100005F60(&qword_10002CE78, &qword_10002CDC0);
}

unint64_t sub_10001DAF8(uint64_t a1)
{
  sub_10001F4F0();
  sub_10001F5E0();
  sub_10001F510();
  Swift::Int v2 = sub_10001F600();
  swift_bridgeObjectRelease();

  return sub_10001DB8C(a1, v2);
}

unint64_t sub_10001DB8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_10001F4F0();
    uint64_t v8 = v7;
    if (v6 == sub_10001F4F0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_10001F5D0();
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
          uint64_t v13 = sub_10001F4F0();
          uint64_t v15 = v14;
          if (v13 == sub_10001F4F0() && v15 == v16) {
            break;
          }
          char v18 = sub_10001F5D0();
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

uint64_t sub_10001DD04(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_10001DD30()
{
  sub_10001F5E0();
  sub_10001F510();
  Swift::Int v0 = sub_10001F600();

  return sub_10001DD04(v0);
}

uint64_t sub_10001DD94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000590C(&qword_10002CE88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001DDFC()
{
  uint64_t v17 = sub_10001EA90();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000590C(&qword_10002CE98);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_10000590C(&qword_10002CEA0);
  __chkstk_darwin(v9 - 8);
  char v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001EB40();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_10000590C(&qword_10002CEA8);
  sub_10001EB30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 1;
  uint64_t v14 = sub_10001E9E0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_10001D6E8();
  return sub_10001EA60();
}

uint64_t sub_10001E0E4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001E0F0()
{
  uint64_t v0 = sub_10000590C(&qword_10002C5B8);
  sub_10001C5B8(v0, qword_10002E7A8);
  sub_10001AA7C(v0, (uint64_t)qword_10002E7A8);
  v3._countAndFlagsBits = sub_10001F4F0();
  sub_10001F520(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 47;
  v4._object = (void *)0xE100000000000000;
  sub_10001F520(v4);
  v5._countAndFlagsBits = sub_10001F4F0();
  sub_10001F520(v5);
  swift_bridgeObjectRelease();
  sub_10001EB60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10001E1E4()
{
  uint64_t v0 = sub_10001EBE0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  Swift::String v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000590C(&qword_10002CEB8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001EBD0();
  sub_10001EBC0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v7 = sub_10001EBB0();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    uint64_t result = sub_10001E3E8((uint64_t)v6);
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v11 = sub_10001EBA0();
    uint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    v15[2] = v11;
    v15[3] = v13;
    v15[0] = 21333;
    v15[1] = 0xE200000000000000;
    sub_100005FA4();
    uint64_t v14 = sub_10001F550();
    uint64_t result = swift_bridgeObjectRelease();
    BOOL v10 = v14 == 0;
  }
  byte_10002E7C0 = v10;
  return result;
}

uint64_t sub_10001E3E8(uint64_t a1)
{
  uint64_t v2 = sub_10000590C(&qword_10002CEB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001E448()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10001E47C()
{
  return sub_10001E628(1);
}

uint64_t sub_10001E484(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_10002E718 == -1)
  {
    if (qword_10002E720) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_10002E718, 0, (dispatch_function_t)sub_10001E620);
    if (qword_10002E720) {
      return _availability_version_check();
    }
  }
  if (qword_10002E710 == -1)
  {
    BOOL v8 = dword_10002E700 < a2;
    if (dword_10002E700 > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_10002E710, 0, (dispatch_function_t)sub_10001E47C);
    BOOL v8 = dword_10002E700 < a2;
    if (dword_10002E700 > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_10002E704 > a3) {
    return 1;
  }
  return dword_10002E704 >= a3 && dword_10002E708 >= a4;
}

uint64_t sub_10001E620()
{
  return sub_10001E628(0);
}

uint64_t sub_10001E628(uint64_t result)
{
  uint64_t v1 = (uint64_t (**)(void))qword_10002E720;
  if (qword_10002E720) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (&__availability_version_check)
    {
      uint64_t v1 = &__availability_version_check;
      qword_10002E720 = (uint64_t)&__availability_version_check;
    }
    if (!v1 || result != 0)
    {
      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        uint64_t v4 = *(unsigned __int8 **)result;
        uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            uint64_t v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  BOOL v10 = (uint64_t (*)(uint64_t))result;
                  uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    uint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        uint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &dword_10002E700, &dword_10002E704, &dword_10002E708);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001E960()
{
  return static AppIntentError.Unrecoverable.unknown.getter();
}

uint64_t sub_10001E970()
{
  return type metadata accessor for AppIntentError();
}

uint64_t sub_10001E990()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_10001E9A0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_10001E9B0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10001E9C0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10001E9E0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10001E9F0()
{
  return static IntentResult.result<A>(opensIntent:)();
}

uint64_t sub_10001EA00()
{
  return static IntentResult.result<>()();
}

uint64_t sub_10001EA10()
{
  return type metadata accessor for OpenURLIntent();
}

uint64_t sub_10001EA20()
{
  return OpenURLIntent.init(_:)();
}

uint64_t sub_10001EA30()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_10001EA40()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10001EA50()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10001EA60()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_10001EA70()
{
  return DisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_10001EA80()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_10001EA90()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10001EAB0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10001EAC0()
{
  return type metadata accessor for IntentAuthenticationPolicy();
}

uint64_t sub_10001EAD0()
{
  return URLComponents.url.getter();
}

uint64_t sub_10001EAE0()
{
  return URLComponents.host.setter();
}

uint64_t sub_10001EAF0()
{
  return URLComponents.path.setter();
}

uint64_t sub_10001EB00()
{
  return URLComponents.scheme.setter();
}

uint64_t sub_10001EB10()
{
  return URLComponents.init()();
}

uint64_t sub_10001EB20()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_10001EB30()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10001EB40()
{
  return type metadata accessor for LocalizedStringResource();
}

void sub_10001EB50(NSURL *retstr@<X8>)
{
}

uint64_t sub_10001EB60()
{
  return URL.init(string:)();
}

uint64_t sub_10001EB70()
{
  return type metadata accessor for URL();
}

uint64_t sub_10001EB80()
{
  return Date.init()();
}

uint64_t sub_10001EB90()
{
  return type metadata accessor for Date();
}

uint64_t sub_10001EBA0()
{
  return Locale.Region.identifier.getter();
}

uint64_t sub_10001EBB0()
{
  return type metadata accessor for Locale.Region();
}

uint64_t sub_10001EBC0()
{
  return Locale.region.getter();
}

uint64_t sub_10001EBD0()
{
  return static Locale.current.getter();
}

uint64_t sub_10001EBE0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10001EBF0()
{
  return PassLiveActivityAttributes.ContentState.eventLiveMessage.getter();
}

uint64_t sub_10001EC00()
{
  return PassLiveActivityAttributes.ContentState.attributes.getter();
}

uint64_t sub_10001EC10()
{
  return PassLiveActivityAttributes.ContentState.compactTitle.getter();
}

uint64_t sub_10001EC20()
{
  return PassLiveActivityAttributes.ContentState.SeatAttribute.label.getter();
}

uint64_t sub_10001EC30()
{
  return PassLiveActivityAttributes.ContentState.SeatAttribute.value.getter();
}

uint64_t sub_10001EC40()
{
  return type metadata accessor for PassLiveActivityAttributes.ContentState.SeatAttribute();
}

uint64_t sub_10001EC50()
{
  return PassLiveActivityAttributes.ContentState.admissionLevel.getter();
}

uint64_t sub_10001EC60()
{
  return PassLiveActivityAttributes.ContentState.hasSportsTitle.getter();
}

uint64_t sub_10001EC70()
{
  return PassLiveActivityAttributes.ContentState.compactSubtitle.getter();
}

uint64_t sub_10001EC80()
{
  return PassLiveActivityAttributes.ContentState.seedUniqueIdentifier.getter();
}

uint64_t sub_10001EC90()
{
  return PassLiveActivityAttributes.ContentState.seatsSpanMultipleSections.getter();
}

uint64_t sub_10001ECA0()
{
  return PassLiveActivityAttributes.ContentState.url.getter();
}

uint64_t sub_10001ECB0()
{
  return PassLiveActivityAttributes.ContentState.title.getter();
}

uint64_t sub_10001ECC0()
{
  return type metadata accessor for PassLiveActivityAttributes.ContentState();
}

uint64_t sub_10001ECD0()
{
  return type metadata accessor for PassLiveActivityAttributes();
}

uint64_t sub_10001ECE0()
{
  return localizedString(for:table:bundle:)();
}

uint64_t sub_10001ECF0()
{
  return type metadata accessor for LocalizedStringTable();
}

uint64_t sub_10001ED00()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10001ED10()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_10001ED20()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_10001ED30()
{
  return TupleWidget.init(_:)();
}

uint64_t sub_10001ED40()
{
  return static WidgetBundle.main()();
}

uint64_t sub_10001ED50()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_10001ED60()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t sub_10001ED70()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_10001ED80()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_10001ED90()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_10001EDA0()
{
  return EnvironmentValues.truncationMode.setter();
}

uint64_t sub_10001EDB0()
{
  return EnvironmentValues.redactionReasons.getter();
}

uint64_t sub_10001EDC0()
{
  return EnvironmentValues.redactionReasons.setter();
}

uint64_t sub_10001EDD0()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_10001EDE0()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_10001EDF0()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t sub_10001EE00()
{
  return EnvironmentValues.symbolRenderingMode.setter();
}

uint64_t sub_10001EE10()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_10001EE20()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_10001EE30()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_10001EE40()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_10001EE50()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_10001EE60()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_10001EE70()
{
  return EnvironmentValues.init()();
}

uint64_t sub_10001EE80()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_10001EE90()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t sub_10001EEA0()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_10001EEB0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_10001EEC0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_10001EED0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_10001EEE0()
{
  return static SymbolRenderingMode.palette.getter();
}

uint64_t sub_10001EEF0()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t sub_10001EF00()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_10001EF10()
{
  return WidgetConfiguration.description<A>(_:)();
}

uint64_t sub_10001EF20()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_10001EF30()
{
  return WidgetConfiguration.showsContextualMenu(_:)();
}

uint64_t sub_10001EF40()
{
  return WidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_10001EF50()
{
  return WidgetConfiguration._contentMarginsDisabled()();
}

uint64_t sub_10001EF60()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_10001EF70()
{
  return WidgetConfiguration.enabled(_:)();
}

uint64_t sub_10001EF80()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10001EF90()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_10001EFA0()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t sub_10001EFB0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10001EFC0()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_10001EFD0()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_10001EFE0()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_10001EFF0()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_10001F000()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_10001F010()
{
  return static Font.largeTitle.getter();
}

uint64_t sub_10001F020()
{
  return static Font.subheadline.getter();
}

uint64_t sub_10001F030()
{
  return static Font.body.getter();
}

uint64_t sub_10001F040()
{
  return static Font.title.getter();
}

uint64_t sub_10001F050()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_10001F060()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_10001F070()
{
  return static Font.Weight.medium.getter();
}

uint64_t sub_10001F080()
{
  return static Font.Weight.regular.getter();
}

uint64_t sub_10001F090()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_10001F0A0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_10001F0B0()
{
  return static Font.title2.getter();
}

uint64_t sub_10001F0C0()
{
  return static Font.title3.getter();
}

uint64_t sub_10001F0D0()
{
  return type metadata accessor for Font.Leading();
}

uint64_t sub_10001F0E0()
{
  return Font.leading(_:)();
}

uint64_t sub_10001F0F0()
{
  return static Font.caption2.getter();
}

uint64_t sub_10001F100()
{
  return static Font.footnote.getter();
}

uint64_t sub_10001F110()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t sub_10001F120()
{
  return Text.init<A>(_:)();
}

uint64_t sub_10001F130()
{
  return View.dynamicIsland(verticalPlacement:)();
}

uint64_t sub_10001F140()
{
  return View.activityBackgroundTint(_:)();
}

uint64_t sub_10001F150()
{
  return View.widgetURL(_:)();
}

uint64_t sub_10001F160()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10001F170()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10001F180()
{
  return View.fontWeight(_:)();
}

uint64_t sub_10001F190()
{
  return View.monospaced(_:)();
}

uint64_t sub_10001F1A0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10001F1B0()
{
  return View.privacySensitive(_:)();
}

uint64_t sub_10001F1C0()
{
  return Color.init(cgColor:)();
}

uint64_t sub_10001F1D0()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_10001F1E0()
{
  return static Color.gray.getter();
}

uint64_t sub_10001F1F0()
{
  return static Color.clear.getter();
}

uint64_t sub_10001F200()
{
  return static Color.white.getter();
}

uint64_t sub_10001F210()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_10001F220()
{
  return Image.init(uiImage:)();
}

uint64_t sub_10001F230()
{
  return Image.init(systemName:)();
}

uint64_t sub_10001F240()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_10001F250()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_10001F260()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_10001F280()
{
  return Divider.init()();
}

uint64_t sub_10001F290()
{
  return type metadata accessor for Divider();
}

uint64_t sub_10001F2A0()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_10001F2B0()
{
  return static Alignment.bottomLeading.getter();
}

uint64_t sub_10001F2C0()
{
  return static Alignment.center.getter();
}

uint64_t sub_10001F2D0()
{
  return static Analytics.trackPeerPaymentButtonTap(with:)();
}

uint64_t sub_10001F2E0()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_10001F2F0()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_10001F300()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_10001F310()
{
  return ControlButton.init<A>(kind:intent:displayName:preferredSize:title:affordances:)();
}

uint64_t sub_10001F320()
{
  return ControlButton.disabled(_:)();
}

uint64_t sub_10001F330()
{
  return DynamicIsland.contentMargins(_:_:for:)();
}

uint64_t sub_10001F340()
{
  return DynamicIsland.init<A, B, C, D>(expanded:compactLeading:compactTrailing:minimal:)();
}

uint64_t sub_10001F350()
{
  return DynamicIsland.widgetURL(_:)();
}

uint64_t sub_10001F360()
{
  return type metadata accessor for DynamicIsland();
}

uint64_t sub_10001F370()
{
  return TimelineEntry.relevance.getter();
}

uint64_t sub_10001F3A0()
{
  return static DynamicIslandMode.expanded.getter();
}

uint64_t sub_10001F3B0()
{
  return type metadata accessor for DynamicIslandMode();
}

uint64_t sub_10001F3C0()
{
  return ActivityViewContext.state.getter();
}

uint64_t sub_10001F3D0()
{
  return StaticConfiguration.init<A>(kind:provider:content:)();
}

uint64_t sub_10001F3E0()
{
  return static TimelineReloadPolicy.never.getter();
}

uint64_t sub_10001F3F0()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_10001F400()
{
  return ActivityConfiguration.init<A>(for:content:dynamicIsland:)();
}

uint64_t sub_10001F410()
{
  return DynamicIslandExpandedRegion._viewRepresentation.getter();
}

uint64_t sub_10001F420()
{
  return DynamicIslandExpandedRegion.init(_:priority:content:)();
}

uint64_t sub_10001F430()
{
  return DynamicIslandExpandedContent.init(content:)();
}

uint64_t sub_10001F440()
{
  return DynamicIslandExpandedContent.content.getter();
}

uint64_t sub_10001F450()
{
  return static DynamicIslandExpandedRegionPosition.leading.getter();
}

uint64_t sub_10001F460()
{
  return static DynamicIslandExpandedRegionPosition.trailing.getter();
}

uint64_t sub_10001F470()
{
  return type metadata accessor for DynamicIslandExpandedRegionPosition();
}

uint64_t sub_10001F480()
{
  return static DynamicIslandExpandedRegionVerticalPlacement.belowIfTooWide.getter();
}

uint64_t sub_10001F490()
{
  return type metadata accessor for DynamicIslandExpandedRegionVerticalPlacement();
}

uint64_t sub_10001F4A0()
{
  return Timeline.init(entries:policy:)();
}

uint64_t sub_10001F4B0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10001F4C0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001F4D0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10001F4E0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10001F4F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F500()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_10001F510()
{
  return String.hash(into:)();
}

void sub_10001F520(Swift::String a1)
{
}

Swift::Int sub_10001F530()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10001F540()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10001F550()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t sub_10001F570()
{
  return dispatch thunk of SetAlgebra.init()();
}

uint64_t sub_10001F580()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10001F590()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10001F5A0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_10001F5C0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10001F5D0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001F5E0()
{
  return Hasher.init(_seed:)();
}

void sub_10001F5F0(Swift::UInt a1)
{
}

Swift::Int sub_10001F600()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t PKFloatCeilToPixel()
{
  return _PKFloatCeilToPixel();
}

uint64_t PKFloatFloorToPixel()
{
  return _PKFloatFloorToPixel();
}

uint64_t PKFloatRoundToPixel()
{
  return _PKFloatRoundToPixel();
}

uint64_t PKPassKitBundle()
{
  return _PKPassKitBundle();
}

uint64_t PKUIGetMinScreenWidthType()
{
  return _PKUIGetMinScreenWidthType();
}

uint64_t PKLocalizedString(NSString *a1)
{
  return PKLocalizedString(a1);
}

uint64_t PKLocalizedTicketingString(NSString *a1)
{
  return PKLocalizedTicketingString(a1);
}

uint64_t PKLocalizedNearbyPeerPaymentString(NSString *a1)
{
  return PKLocalizedNearbyPeerPaymentString(a1);
}

uint64_t _availability_version_check()
{
  return __availability_version_check();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
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

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}