_OWORD *sub_100BF1EF8(_OWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  v4 = type metadata accessor for LollipopDetailViewModel(0);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    *a1 = *a2;
    v5 = (int *)type metadata accessor for TitleAndDetailLollipopDetailViewModel(0);
    v6 = v5[5];
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = type metadata accessor for AttributedString();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    *(_OWORD *)((char *)a1 + v5[6]) = *(_OWORD *)((char *)a2 + v5[6]);
    *(_OWORD *)((char *)a1 + v5[7]) = *(_OWORD *)((char *)a2 + v5[7]);
    *(_OWORD *)((char *)a1 + v5[8]) = *(_OWORD *)((char *)a2 + v5[8]);
    *(_OWORD *)((char *)a1 + v5[9]) = *(_OWORD *)((char *)a2 + v5[9]);
    *(_OWORD *)((char *)a1 + v5[10]) = *(_OWORD *)((char *)a2 + v5[10]);
    *((unsigned char *)a1 + v5[11]) = *((unsigned char *)a2 + v5[11]);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
  }
  return a1;
}

_OWORD *sub_100BF2028(_OWORD *a1, _OWORD *a2)
{
  if (a1 != a2)
  {
    sub_100BF2750((uint64_t)a1, (void (*)(void))type metadata accessor for LollipopDetailViewModel);
    uint64_t v4 = type metadata accessor for LollipopDetailViewModel(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      *a1 = *a2;
      v5 = (int *)type metadata accessor for TitleAndDetailLollipopDetailViewModel(0);
      uint64_t v6 = v5[5];
      v7 = (char *)a1 + v6;
      v8 = (char *)a2 + v6;
      uint64_t v9 = type metadata accessor for AttributedString();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
      *(_OWORD *)((char *)a1 + v5[6]) = *(_OWORD *)((char *)a2 + v5[6]);
      *(_OWORD *)((char *)a1 + v5[7]) = *(_OWORD *)((char *)a2 + v5[7]);
      *(_OWORD *)((char *)a1 + v5[8]) = *(_OWORD *)((char *)a2 + v5[8]);
      *(_OWORD *)((char *)a1 + v5[9]) = *(_OWORD *)((char *)a2 + v5[9]);
      *(_OWORD *)((char *)a1 + v5[10]) = *(_OWORD *)((char *)a2 + v5[10]);
      *((unsigned char *)a1 + v5[11]) = *((unsigned char *)a2 + v5[11]);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100BF217C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100BF2190);
}

uint64_t sub_100BF2190(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LollipopDetailViewModel(0);

  return _s7Weather24LocationCompositionStateOwet_0(a1, a2, v4);
}

uint64_t sub_100BF21D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100BF21EC);
}

uint64_t sub_100BF21EC()
{
  type metadata accessor for LollipopDetailViewModel(0);
  uint64_t v0 = sub_10016350C();

  return _s7Weather24LocationCompositionStateOwst_0(v0, v1, v2, v3);
}

uint64_t type metadata accessor for LollipopDetailView(uint64_t a1)
{
  return sub_10018678C(a1, qword_100EB8718);
}

uint64_t sub_100BF224C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100BF2FC4(a1, a2, a3, type metadata accessor for LollipopDetailViewModel);
}

uint64_t sub_100BF2264()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100BF2280()
{
  type metadata accessor for TitleAndDetailLollipopDetailView(0);
  sub_100162E4C();
  __chkstk_darwin(v1);
  sub_1001626E0();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = type metadata accessor for TitleAndDetailLollipopDetailViewModel(0);
  __chkstk_darwin(v5 - 8);
  sub_1001626E0();
  uint64_t v8 = v7 - v6;
  sub_10017DF08(&qword_100EB8750);
  sub_100162E4C();
  __chkstk_darwin(v9);
  sub_1001626E0();
  uint64_t v12 = v11 - v10;
  type metadata accessor for LollipopDetailViewModel(0);
  sub_100162E4C();
  __chkstk_darwin(v13);
  sub_1001626E0();
  uint64_t v16 = v15 - v14;
  sub_100BF25D8(v0, v15 - v14, (void (*)(void))type metadata accessor for LollipopDetailViewModel);
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    sub_1004CAF64(v16, v8);
    sub_100BF25D8(v8, v4, (void (*)(void))type metadata accessor for TitleAndDetailLollipopDetailViewModel);
    sub_100BF25D8(v4, v12, (void (*)(void))type metadata accessor for TitleAndDetailLollipopDetailView);
    swift_storeEnumTagMultiPayload();
    sub_10017DF08(&qword_100EB8758);
    sub_100BF262C();
    sub_100BF2700();
    sub_10019F9A4();
    _ConditionalContent<>.init(storage:)();
    sub_100BF2750(v4, (void (*)(void))type metadata accessor for TitleAndDetailLollipopDetailView);
    return sub_100BF2750(v8, (void (*)(void))type metadata accessor for TitleAndDetailLollipopDetailViewModel);
  }
  else
  {
    sub_100BF2668();
    sub_100BF26B4();
    _ConditionalContent<>.init(storage:)();
    *(_OWORD *)uint64_t v12 = v18;
    *(_OWORD *)(v12 + 16) = v19;
    *(_OWORD *)(v12 + 32) = v20;
    *(_OWORD *)(v12 + 48) = v21;
    *(_WORD *)(v12 + 64) = v22;
    *(unsigned char *)(v12 + 66) = v23;
    swift_storeEnumTagMultiPayload();
    sub_10017DF08(&qword_100EB8758);
    sub_100BF262C();
    sub_100BF2700();
    sub_10019F9A4();
    return _ConditionalContent<>.init(storage:)();
  }
}

uint64_t type metadata accessor for TitleAndDetailLollipopDetailView(uint64_t a1)
{
  return sub_10018678C(a1, qword_100EB87D8);
}

uint64_t sub_100BF25D8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100162E4C();
  uint64_t v4 = sub_10011BFA4();
  v5(v4);
  return a2;
}

uint64_t sub_100BF262C()
{
  return sub_100BF30C4(&qword_100EB8760, &qword_100EB8758, (void (*)(void))sub_100BF2668, (void (*)(void))sub_100BF26B4);
}

unint64_t sub_100BF2668()
{
  unint64_t result = qword_100EB8768;
  if (!qword_100EB8768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8768);
  }
  return result;
}

unint64_t sub_100BF26B4()
{
  unint64_t result = qword_100EB8770;
  if (!qword_100EB8770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8770);
  }
  return result;
}

unint64_t sub_100BF2700()
{
  unint64_t result = qword_100EB8778;
  if (!qword_100EB8778)
  {
    type metadata accessor for TitleAndDetailLollipopDetailView(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8778);
  }
  return result;
}

uint64_t sub_100BF2750(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_100162E4C();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

void *sub_100BF27A8(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for TitleAndDetailLollipopDetailViewModel(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v33 = *a2;
    *a1 = *a2;
    a1 = (void *)(v33 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = (int *)v4;
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(v4 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for AttributedString();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = v6[6];
    uint64_t v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (void *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = v6[7];
    long long v18 = (void *)((char *)a1 + v17);
    long long v19 = (void *)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    *long long v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = v6[8];
    __int16 v22 = (void *)((char *)a1 + v21);
    char v23 = (void *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *__int16 v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = v6[9];
    v26 = (void *)((char *)a1 + v25);
    v27 = (void *)((char *)a2 + v25);
    uint64_t v28 = v27[1];
    void *v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = v6[10];
    v30 = (void *)((char *)a1 + v29);
    v31 = (void *)((char *)a2 + v29);
    uint64_t v32 = v31[1];
    void *v30 = *v31;
    v30[1] = v32;
    *((unsigned char *)a1 + v6[11]) = *((unsigned char *)a2 + v6[11]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100BF293C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for TitleAndDetailLollipopDetailViewModel(0) + 20);
  uint64_t v3 = type metadata accessor for AttributedString();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_100BF2A14(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  int v5 = (int *)type metadata accessor for TitleAndDetailLollipopDetailViewModel(0);
  uint64_t v6 = v5[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for AttributedString();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = v5[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = v5[7];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = v5[8];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = v5[9];
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (void *)((char *)a2 + v23);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = v5[10];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  *((unsigned char *)a1 + v5[11]) = *((unsigned char *)a2 + v5[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_100BF2B58(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for TitleAndDetailLollipopDetailViewModel(0);
  uint64_t v5 = v4[5];
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for AttributedString();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  uint64_t v9 = v4[6];
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = (void *)((char *)a2 + v9);
  *uint64_t v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = v4[7];
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = v4[8];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = v4[9];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = v4[10];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  *uint64_t v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + v4[11]) = *((unsigned char *)a2 + v4[11]);
  return a1;
}

_OWORD *sub_100BF2CEC(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  uint64_t v4 = (int *)type metadata accessor for TitleAndDetailLollipopDetailViewModel(0);
  uint64_t v5 = v4[5];
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for AttributedString();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  *(_OWORD *)((char *)a1 + v4[6]) = *(_OWORD *)((char *)a2 + v4[6]);
  *(_OWORD *)((char *)a1 + v4[7]) = *(_OWORD *)((char *)a2 + v4[7]);
  *(_OWORD *)((char *)a1 + v4[8]) = *(_OWORD *)((char *)a2 + v4[8]);
  *(_OWORD *)((char *)a1 + v4[9]) = *(_OWORD *)((char *)a2 + v4[9]);
  *(_OWORD *)((char *)a1 + v4[10]) = *(_OWORD *)((char *)a2 + v4[10]);
  *((unsigned char *)a1 + v4[11]) = *((unsigned char *)a2 + v4[11]);
  return a1;
}

void *sub_100BF2DC8(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = (int *)type metadata accessor for TitleAndDetailLollipopDetailViewModel(0);
  uint64_t v6 = v5[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for AttributedString();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = v5[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = v5[7];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = v5[8];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = v5[9];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  void *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  uint64_t v30 = v5[10];
  v31 = (void *)((char *)a1 + v30);
  uint64_t v32 = (void *)((char *)a2 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  void *v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + v5[11]) = *((unsigned char *)a2 + v5[11]);
  return a1;
}

uint64_t sub_100BF2EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100BF2F10);
}

uint64_t sub_100BF2F10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TitleAndDetailLollipopDetailViewModel(0);

  return _s7Weather24LocationCompositionStateOwet_0(a1, a2, v4);
}

uint64_t sub_100BF2F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100BF2F6C);
}

uint64_t sub_100BF2F6C()
{
  type metadata accessor for TitleAndDetailLollipopDetailViewModel(0);
  uint64_t v0 = sub_10016350C();

  return _s7Weather24LocationCompositionStateOwst_0(v0, v1, v2, v3);
}

uint64_t sub_100BF2FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100BF2FC4(a1, a2, a3, type metadata accessor for TitleAndDetailLollipopDetailViewModel);
}

uint64_t sub_100BF2FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TitleAndUnitLollipopDetailView()
{
  return &type metadata for TitleAndUnitLollipopDetailView;
}

ValueMetadata *type metadata accessor for SingleTitleLollipopDetailView()
{
  return &type metadata for SingleTitleLollipopDetailView;
}

uint64_t sub_100BF3074()
{
  return sub_100BF30C4(&qword_100EB8810, &qword_100EB8818, (void (*)(void))sub_100BF262C, (void (*)(void))sub_100BF2700);
}

uint64_t sub_100BF30C4(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10018C6DC(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100BF314C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_100BF3168()
{
  qword_100EB86B8 = 0x4000000000000000;
}

uint64_t sub_100BF3178@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = static HorizontalAlignment.center.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  sub_10017DF08(&qword_100EB8820);
  uint64_t v2 = (uint64_t *)sub_100180D0C();
  return sub_100BF31B8(v2, v3);
}

uint64_t sub_100BF31B8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  v51 = a2;
  uint64_t v3 = sub_10017DF08(&qword_100EB8828);
  __chkstk_darwin(v3 - 8);
  uint64_t v50 = (uint64_t)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v49 = (uint64_t *)((char *)&v42 - v6);
  uint64_t v7 = sub_10017DF08(&qword_100E63F80);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (uint64_t)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Font.TextStyle();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[1];
  uint64_t v52 = *a1;
  uint64_t v53 = v14;
  sub_10014A85C();
  swift_bridgeObjectRetain();
  uint64_t v15 = Text.init<A>(_:)();
  uint64_t v17 = v16;
  LOBYTE(v14) = v18 & 1;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for Font.TextStyle.footnote(_:), v10);
  uint64_t v19 = type metadata accessor for Font.Design();
  _s7Weather24LocationCompositionStateOwst_0(v9, 1, 1, v19);
  static Font.system(_:design:weight:)();
  sub_1001781AC(v9, &qword_100E63F80);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  static Font.Weight.medium.getter();
  Font.weight(_:)();
  swift_release();
  uint64_t v20 = Text.font(_:)();
  uint64_t v22 = v21;
  LOBYTE(v9) = v23;
  swift_release();
  sub_100191924(v15, v17, v14);
  swift_bridgeObjectRelease();
  static Color.secondary.getter();
  uint64_t v24 = Text.foregroundColor(_:)();
  uint64_t v26 = v25;
  char v28 = v27;
  uint64_t v48 = v29;
  swift_release();
  sub_100191924(v20, v22, v9 & 1);
  swift_bridgeObjectRelease();
  uint64_t v30 = static VerticalAlignment.firstTextBaseline.getter();
  if (qword_100E62BF8 != -1) {
    swift_once();
  }
  uint64_t v31 = qword_100EB86B8;
  char v32 = v28 & 1;
  uint64_t v33 = (uint64_t)v49;
  uint64_t *v49 = v30;
  *(void *)(v33 + 8) = v31;
  *(unsigned char *)(v33 + 16) = 0;
  uint64_t v34 = sub_10017DF08(&qword_100EB8830);
  sub_100BF364C(a1, v33 + *(int *)(v34 + 44));
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v47 = v52;
  int v46 = v53;
  uint64_t v45 = v54;
  int v44 = v55;
  uint64_t v35 = v57;
  uint64_t v43 = v56;
  uint64_t v36 = v50;
  sub_10006DF38(v33, v50, &qword_100EB8828);
  v37 = v51;
  void *v51 = 0x4018000000000000;
  *((unsigned char *)v37 + 8) = 0;
  v37[2] = v24;
  v37[3] = v26;
  *((unsigned char *)v37 + 32) = v32;
  char v38 = v32;
  v37[5] = v48;
  uint64_t v39 = sub_10017DF08(&qword_100EB8838);
  sub_10006DF38(v36, (uint64_t)v37 + *(int *)(v39 + 64), &qword_100EB8828);
  v40 = (char *)v37 + *(int *)(v39 + 80);
  *(void *)v40 = 0;
  v40[8] = 1;
  *((void *)v40 + 2) = v47;
  v40[24] = v46;
  *((void *)v40 + 4) = v45;
  v40[40] = v44;
  *((void *)v40 + 6) = v43;
  *((void *)v40 + 7) = v35;
  sub_100190CC4(v24, v26, v38);
  swift_bridgeObjectRetain();
  sub_1001781AC(v33, &qword_100EB8828);
  sub_1001781AC(v36, &qword_100EB8828);
  sub_100191924(v24, v26, v38);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100BF364C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v83 = a2;
  uint64_t v3 = type metadata accessor for Font.Leading();
  uint64_t v81 = *(void *)(v3 - 8);
  uint64_t v82 = v3;
  __chkstk_darwin(v3);
  v80 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10017DF08(&qword_100E63F80);
  __chkstk_darwin(v5 - 8);
  uint64_t v77 = (uint64_t)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Font.TextStyle();
  uint64_t v75 = *(void *)(v7 - 8);
  uint64_t v76 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_10017DF08(&qword_100EAADC0);
  __chkstk_darwin(v71);
  uint64_t v11 = (uint64_t *)((char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = type metadata accessor for Image.Scale();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10017DF08(&qword_100E7DFA0);
  __chkstk_darwin(v16 - 8);
  char v18 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_10017DF08(&qword_100E6F770);
  __chkstk_darwin(v70);
  uint64_t v20 = (uint64_t *)((char *)&v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v74 = sub_10017DF08(&qword_100E76A00);
  __chkstk_darwin(v74);
  uint64_t v22 = (char *)&v70 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_10017DF08(&qword_100EB8840);
  __chkstk_darwin(v23 - 8);
  uint64_t v79 = (uint64_t)&v70 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v78 = (uint64_t)&v70 - v26;
  uint64_t v27 = a1[3];
  uint64_t v72 = a1[2];
  uint64_t v73 = v27;
  if (a1[5])
  {
    swift_bridgeObjectRetain();
    Image.init(systemName:)();
    static Image.TemplateRenderingMode.macSafeOriginal.getter();
    uint64_t v28 = type metadata accessor for Image.TemplateRenderingMode();
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v18, 0, 1, v28);
    uint64_t v29 = Image.renderingMode(_:)();
    swift_release();
    sub_1001781AC((uint64_t)v18, &qword_100E7DFA0);
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for Image.Scale.small(_:), v12);
    uint64_t KeyPath = swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))((char *)v11 + *(int *)(v71 + 28), v15, v12);
    *uint64_t v11 = KeyPath;
    sub_10006DF38((uint64_t)v11, (uint64_t)v20 + *(int *)(v70 + 36), &qword_100EAADC0);
    *uint64_t v20 = v29;
    swift_retain();
    sub_1001781AC((uint64_t)v11, &qword_100EAADC0);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    swift_release();
    uint64_t v31 = enum case for Font.TextStyle.largeTitle(_:);
    uint64_t v33 = v75;
    uint64_t v32 = v76;
    (*(void (**)(char *, void, uint64_t))(v75 + 104))(v9, enum case for Font.TextStyle.largeTitle(_:), v76);
    uint64_t v34 = type metadata accessor for Font.Design();
    uint64_t v35 = v77;
    _s7Weather24LocationCompositionStateOwst_0(v77, 1, 1, v34);
    uint64_t v36 = static Font.system(_:design:weight:)();
    sub_1001781AC(v35, &qword_100E63F80);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v32);
    uint64_t v37 = swift_getKeyPath();
    sub_10006DF38((uint64_t)v20, (uint64_t)v22, &qword_100E6F770);
    uint64_t v38 = (uint64_t)v20;
    uint64_t v39 = v9;
    uint64_t v40 = v74;
    v41 = (uint64_t *)&v22[*(int *)(v74 + 36)];
    uint64_t *v41 = v37;
    v41[1] = v36;
    sub_1001781AC(v38, &qword_100E6F770);
    uint64_t v42 = (uint64_t)v22;
    uint64_t v43 = v78;
    sub_100BF6F44(v42, v78);
    uint64_t v44 = v40;
    uint64_t v9 = v39;
    uint64_t v45 = v43;
    _s7Weather24LocationCompositionStateOwst_0(v43, 0, 1, v44);
  }
  else
  {
    uint64_t v45 = v78;
    _s7Weather24LocationCompositionStateOwst_0(v78, 1, 1, v74);
    uint64_t v31 = enum case for Font.TextStyle.largeTitle(_:);
    uint64_t v32 = v76;
    uint64_t v35 = v77;
    uint64_t v33 = v75;
  }
  uint64_t v84 = v72;
  uint64_t v85 = v73;
  sub_10014A85C();
  swift_bridgeObjectRetain();
  uint64_t v46 = Text.init<A>(_:)();
  uint64_t v48 = v47;
  char v50 = v49 & 1;
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 104))(v9, v31, v32);
  uint64_t v51 = type metadata accessor for Font.Design();
  _s7Weather24LocationCompositionStateOwst_0(v35, 1, 1, v51);
  static Font.system(_:design:weight:)();
  sub_1001781AC(v35, &qword_100E63F80);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v32);
  uint64_t v53 = v80;
  uint64_t v52 = v81;
  uint64_t v54 = v82;
  (*(void (**)(char *, void, uint64_t))(v81 + 104))(v80, enum case for Font.Leading.tight(_:), v82);
  Font.leading(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v54);
  static Font.Weight.bold.getter();
  Font.weight(_:)();
  swift_release();
  uint64_t v55 = Text.font(_:)();
  uint64_t v57 = v56;
  LOBYTE(v52) = v58;
  swift_release();
  sub_100191924(v46, v48, v50);
  swift_bridgeObjectRelease();
  static Color.primary.getter();
  uint64_t v59 = Text.foregroundColor(_:)();
  uint64_t v61 = v60;
  char v63 = v62;
  uint64_t v65 = v64;
  swift_release();
  LOBYTE(v48) = v63 & 1;
  sub_100191924(v55, v57, v52 & 1);
  swift_bridgeObjectRelease();
  uint64_t v66 = v79;
  sub_10006DF38(v45, v79, &qword_100EB8840);
  uint64_t v67 = v83;
  sub_10006DF38(v66, v83, &qword_100EB8840);
  uint64_t v68 = v67 + *(int *)(sub_10017DF08(&qword_100EB8848) + 48);
  *(void *)uint64_t v68 = v59;
  *(void *)(v68 + 8) = v61;
  *(unsigned char *)(v68 + 16) = v48;
  *(void *)(v68 + 24) = v65;
  sub_100190CC4(v59, v61, v48);
  swift_bridgeObjectRetain();
  sub_1001781AC(v45, &qword_100EB8840);
  sub_100191924(v59, v61, v48);
  swift_bridgeObjectRelease();
  return sub_1001781AC(v66, &qword_100EB8840);
}

uint64_t sub_100BF3EC4@<X0>(uint64_t a1@<X8>)
{
  return sub_100BF3178(a1);
}

void sub_100BF3F00()
{
  qword_100F52490 = 0x4000000000000000;
}

uint64_t sub_100BF3F10@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = static HorizontalAlignment.center.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  sub_10017DF08(&qword_100EB8850);
  uint64_t v2 = (uint64_t *)sub_100180D0C();
  return sub_100BF3F50(v2, v3);
}

uint64_t sub_100BF3F50@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v3 = sub_10017DF08(&qword_100EB8858);
  __chkstk_darwin(v3 - 8);
  uint64_t v50 = (uint64_t)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  char v49 = (uint64_t *)((char *)&v42 - v6);
  uint64_t v7 = sub_10017DF08(&qword_100E63F80);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (uint64_t)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Font.TextStyle();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[1];
  uint64_t v52 = *a1;
  uint64_t v53 = v14;
  sub_10014A85C();
  swift_bridgeObjectRetain();
  uint64_t v15 = Text.init<A>(_:)();
  uint64_t v17 = v16;
  LOBYTE(v14) = v18 & 1;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for Font.TextStyle.footnote(_:), v10);
  uint64_t v19 = type metadata accessor for Font.Design();
  _s7Weather24LocationCompositionStateOwst_0(v9, 1, 1, v19);
  static Font.system(_:design:weight:)();
  sub_1001781AC(v9, &qword_100E63F80);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  static Font.Weight.medium.getter();
  Font.weight(_:)();
  swift_release();
  uint64_t v20 = Text.font(_:)();
  uint64_t v22 = v21;
  LOBYTE(v9) = v23;
  swift_release();
  sub_100191924(v15, v17, v14);
  swift_bridgeObjectRelease();
  static Color.secondary.getter();
  uint64_t v24 = Text.foregroundColor(_:)();
  uint64_t v26 = v25;
  char v28 = v27;
  uint64_t v48 = v29;
  swift_release();
  sub_100191924(v20, v22, v9 & 1);
  swift_bridgeObjectRelease();
  uint64_t v30 = static VerticalAlignment.firstTextBaseline.getter();
  if (qword_100E62C00 != -1) {
    swift_once();
  }
  uint64_t v31 = qword_100F52490;
  char v32 = v28 & 1;
  uint64_t v33 = (uint64_t)v49;
  uint64_t *v49 = v30;
  *(void *)(v33 + 8) = v31;
  *(unsigned char *)(v33 + 16) = 0;
  uint64_t v34 = sub_10017DF08(&qword_100EB8860);
  sub_100BF43E4(a1, v33 + *(int *)(v34 + 44));
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v47 = v52;
  int v46 = v53;
  uint64_t v45 = v54;
  int v44 = v55;
  uint64_t v35 = v57;
  uint64_t v43 = v56;
  uint64_t v36 = v50;
  sub_10006DF38(v33, v50, &qword_100EB8858);
  uint64_t v37 = v51;
  void *v51 = 0x4018000000000000;
  *((unsigned char *)v37 + 8) = 0;
  v37[2] = v24;
  v37[3] = v26;
  *((unsigned char *)v37 + 32) = v32;
  char v38 = v32;
  v37[5] = v48;
  uint64_t v39 = sub_10017DF08(&qword_100EB8868);
  sub_10006DF38(v36, (uint64_t)v37 + *(int *)(v39 + 64), &qword_100EB8858);
  uint64_t v40 = (char *)v37 + *(int *)(v39 + 80);
  *(void *)uint64_t v40 = 0;
  v40[8] = 1;
  *((void *)v40 + 2) = v47;
  v40[24] = v46;
  *((void *)v40 + 4) = v45;
  v40[40] = v44;
  *((void *)v40 + 6) = v43;
  *((void *)v40 + 7) = v35;
  sub_100190CC4(v24, v26, v38);
  swift_bridgeObjectRetain();
  sub_1001781AC(v33, &qword_100EB8858);
  sub_1001781AC(v36, &qword_100EB8858);
  sub_100191924(v24, v26, v38);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100BF43E4@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v90 = a2;
  uint64_t v3 = sub_10017DF08(&qword_100E63F80);
  __chkstk_darwin(v3 - 8);
  uint64_t v87 = (uint64_t)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = type metadata accessor for Font.TextStyle();
  uint64_t v85 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  uint64_t v84 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_10017DF08(&qword_100EAADC0);
  __chkstk_darwin(v83);
  uint64_t v7 = (uint64_t *)((char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for Image.Scale();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10017DF08(&qword_100E7DFA0);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_10017DF08(&qword_100E6F770);
  __chkstk_darwin(v82);
  uint64_t v16 = (uint64_t *)((char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v91 = sub_10017DF08(&qword_100E76A00);
  __chkstk_darwin(v91);
  char v18 = (char *)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10017DF08(&qword_100EB8840);
  __chkstk_darwin(v19 - 8);
  uint64_t v89 = (uint64_t)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  char v23 = (char *)&v81 - v22;
  v88 = a1;
  memcpy(__dst, a1, 0x42uLL);
  if (__dst[7])
  {
    swift_bridgeObjectRetain();
    Image.init(systemName:)();
    static Image.TemplateRenderingMode.macSafeOriginal.getter();
    uint64_t v24 = type metadata accessor for Image.TemplateRenderingMode();
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v14, 0, 1, v24);
    uint64_t v25 = Image.renderingMode(_:)();
    swift_release();
    sub_1001781AC((uint64_t)v14, &qword_100E7DFA0);
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for Image.Scale.small(_:), v8);
    uint64_t KeyPath = swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)v7 + *(int *)(v83 + 28), v11, v8);
    uint64_t *v7 = KeyPath;
    sub_10006DF38((uint64_t)v7, (uint64_t)v16 + *(int *)(v82 + 36), &qword_100EAADC0);
    *uint64_t v16 = v25;
    swift_retain();
    sub_1001781AC((uint64_t)v7, &qword_100EAADC0);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_release();
    uint64_t v27 = v85;
    char v28 = v84;
    uint64_t v29 = v86;
    (*(void (**)(char *, void, uint64_t))(v85 + 104))(v84, enum case for Font.TextStyle.largeTitle(_:), v86);
    uint64_t v30 = type metadata accessor for Font.Design();
    uint64_t v31 = v87;
    _s7Weather24LocationCompositionStateOwst_0(v87, 1, 1, v30);
    uint64_t v32 = static Font.system(_:design:weight:)();
    sub_1001781AC(v31, &qword_100E63F80);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
    uint64_t v33 = swift_getKeyPath();
    sub_10006DF38((uint64_t)v16, (uint64_t)v18, &qword_100E6F770);
    uint64_t v34 = v91;
    uint64_t v35 = (uint64_t *)&v18[*(int *)(v91 + 36)];
    *uint64_t v35 = v33;
    v35[1] = v32;
    sub_1001781AC((uint64_t)v16, &qword_100E6F770);
    sub_100BF6F44((uint64_t)v18, (uint64_t)v23);
    uint64_t v36 = 0;
    uint64_t v37 = v34;
  }
  else
  {
    uint64_t v36 = 1;
    uint64_t v37 = v91;
  }
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v23, v36, 1, v37);
  v92 = v23;
  if ((__dst[8] & 0x100) != 0)
  {
    uint64_t v58 = sub_100BF4E64((uint64_t)__dst);
    uint64_t v60 = v59;
    uint64_t v62 = v61;
    char v44 = v63 & 1;
    uint64_t v64 = sub_100BF5074((uint64_t)__dst);
    uint64_t v66 = v65;
    char v93 = v44;
    char v68 = v67 & 1;
    uint64_t v104 = v58;
    uint64_t v105 = v60;
    char v106 = v44;
    uint64_t v107 = v62;
    uint64_t v108 = v64;
    uint64_t v109 = v65;
    char v110 = v67 & 1;
    uint64_t v111 = v69;
    sub_100190CC4(v58, v60, v44);
    swift_bridgeObjectRetain();
    sub_100190CC4(v64, v66, v68);
    swift_bridgeObjectRetain();
    sub_100190CC4(v58, v60, v44);
    swift_bridgeObjectRetain();
    sub_100190CC4(v64, v66, v68);
    swift_bridgeObjectRetain();
    sub_100191924(v64, v66, v68);
    swift_bridgeObjectRelease();
    sub_100191924(v58, v60, v93);
    swift_bridgeObjectRelease();
    sub_1006E8CC8((uint64_t)&v104, (uint64_t)&v94);
    uint64_t v51 = v94;
    uint64_t v83 = v95;
    uint64_t v85 = v96;
    uint64_t v84 = v97;
    uint64_t v91 = v98;
    uint64_t v52 = v100;
    uint64_t v87 = v99;
    v88 = v101;
    LODWORD(v86) = v102;
    sub_100191924(v58, v60, v44);
    swift_bridgeObjectRelease();
    sub_100191924(v64, v66, v68);
    swift_bridgeObjectRelease();
    uint64_t v70 = v66;
    uint64_t v54 = v83;
    sub_100191924(v64, v70, v68);
    swift_bridgeObjectRelease();
    uint64_t v55 = v58;
    uint64_t v57 = (uint64_t)v84;
    uint64_t v56 = v60;
  }
  else
  {
    uint64_t v38 = sub_100BF5074((uint64_t)__dst);
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    char v44 = v43 & 1;
    uint64_t v45 = sub_100BF4E64((uint64_t)__dst);
    uint64_t v47 = v46;
    char v93 = v44;
    char v49 = v48 & 1;
    uint64_t v104 = v38;
    uint64_t v105 = v40;
    char v106 = v44;
    uint64_t v107 = v42;
    uint64_t v108 = v45;
    uint64_t v109 = v46;
    char v110 = v48 & 1;
    uint64_t v111 = v50;
    sub_100190CC4(v38, v40, v44);
    swift_bridgeObjectRetain();
    sub_100190CC4(v45, v47, v49);
    swift_bridgeObjectRetain();
    sub_100190CC4(v38, v40, v44);
    swift_bridgeObjectRetain();
    sub_100190CC4(v45, v47, v49);
    swift_bridgeObjectRetain();
    sub_100191924(v45, v47, v49);
    swift_bridgeObjectRelease();
    sub_100191924(v38, v40, v93);
    swift_bridgeObjectRelease();
    sub_1006E8F74((uint64_t)&v104, (uint64_t)&v94);
    uint64_t v51 = v94;
    uint64_t v83 = v95;
    uint64_t v85 = v96;
    uint64_t v84 = v97;
    uint64_t v91 = v98;
    uint64_t v52 = v100;
    uint64_t v87 = v99;
    v88 = v101;
    LODWORD(v86) = v102;
    sub_100191924(v38, v40, v44);
    swift_bridgeObjectRelease();
    sub_100191924(v45, v47, v49);
    swift_bridgeObjectRelease();
    uint64_t v53 = v47;
    uint64_t v54 = v83;
    sub_100191924(v45, v53, v49);
    swift_bridgeObjectRelease();
    uint64_t v55 = v38;
    uint64_t v56 = v40;
    uint64_t v57 = (uint64_t)v84;
  }
  sub_100191924(v55, v56, v44);
  uint64_t v71 = v85;
  swift_bridgeObjectRelease();
  uint64_t v72 = v90;
  uint64_t v73 = v89;
  sub_10006DF38((uint64_t)v92, v89, &qword_100EB8840);
  sub_10006DF38(v73, v72, &qword_100EB8840);
  uint64_t v74 = v72 + *(int *)(sub_10017DF08(&qword_100EB8870) + 48);
  uint64_t v75 = v51;
  *(void *)uint64_t v74 = v51;
  *(void *)(v74 + 8) = v54;
  uint64_t v76 = v54;
  *(void *)(v74 + 16) = v71;
  *(void *)(v74 + 24) = v57;
  uint64_t v77 = v91;
  uint64_t v78 = v87;
  *(void *)(v74 + 32) = v91;
  *(void *)(v74 + 40) = v78;
  uint64_t v79 = v88;
  *(void *)(v74 + 48) = v52;
  *(void *)(v74 + 56) = v79;
  *(unsigned char *)(v74 + 64) = v86;
  sub_100BF6FAC(v75, v76, v71, v57, v77, v78, v52);
  sub_1001781AC((uint64_t)v92, &qword_100EB8840);
  sub_100BF7020(v75, v76, v71, v57, v77, v78, v52);
  return sub_1001781AC(v73, &qword_100EB8840);
}

uint64_t sub_100BF4E64(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Text.Scale();
  uint64_t v23 = *(void *)(v2 - 8);
  uint64_t v24 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v25 = *(void *)(a1 + 32);
  uint64_t v26 = v5;
  sub_10014A85C();
  swift_bridgeObjectRetain();
  uint64_t v6 = Text.init<A>(_:)();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  sub_100BF51A8(a1);
  uint64_t v11 = Text.font(_:)();
  uint64_t v13 = v12;
  char v15 = v14;
  swift_release();
  sub_100191924(v6, v8, v10);
  swift_bridgeObjectRelease();
  static Color.primary.getter();
  uint64_t v16 = Text.foregroundColor(_:)();
  uint64_t v18 = v17;
  char v20 = v19;
  swift_release();
  sub_100191924(v11, v13, v15 & 1);
  swift_bridgeObjectRelease();
  static Text.Scale.secondary.getter();
  uint64_t v21 = Text.textScale(_:isEnabled:)();
  sub_100191924(v16, v18, v20 & 1);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v24);
  return v21;
}

uint64_t sub_100BF5074(uint64_t a1)
{
  sub_10014A85C();
  swift_bridgeObjectRetain();
  uint64_t v2 = Text.init<A>(_:)();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_100BF51A8(a1);
  uint64_t v7 = Text.font(_:)();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  sub_100191924(v2, v4, v6);
  swift_bridgeObjectRelease();
  static Color.primary.getter();
  uint64_t v12 = Text.foregroundColor(_:)();
  swift_release();
  sub_100191924(v7, v9, v11 & 1);
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_100BF51A8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Font.Leading();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10017DF08(&qword_100E63F80);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Font.TextStyle();
  __n128 v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v14 = *(void (**)(char *, void, uint64_t, __n128))(v13 + 104);
  char v15 = (void (**)(char *, uint64_t))(v13 + 8);
  if (*(unsigned char *)(a1 + 64))
  {
    v14(v12, enum case for Font.TextStyle.title(_:), v9, v10);
    uint64_t v16 = type metadata accessor for Font.Design();
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v8, 1, 1, v16);
    static Font.system(_:design:weight:)();
    sub_1001781AC((uint64_t)v8, &qword_100E63F80);
    (*v15)(v12, v9);
    static Font.Weight.semibold.getter();
  }
  else
  {
    v14(v12, enum case for Font.TextStyle.largeTitle(_:), v9, v10);
    uint64_t v17 = type metadata accessor for Font.Design();
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v8, 1, 1, v17);
    static Font.system(_:design:weight:)();
    sub_1001781AC((uint64_t)v8, &qword_100E63F80);
    (*v15)(v12, v9);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Font.Leading.tight(_:), v2);
    Font.leading(_:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    static Font.Weight.bold.getter();
  }
  uint64_t v18 = Font.weight(_:)();
  swift_release();
  return v18;
}

uint64_t sub_100BF54A8@<X0>(uint64_t a1@<X8>)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_100BF3F10(a1);
}

uint64_t sub_100BF54EC@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = static HorizontalAlignment.center.getter();
  *(void *)(a1 + 8) = 0xBFF0000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  sub_10017DF08(&qword_100EB8878);
  uint64_t v2 = sub_100180D0C();
  return sub_100BF5530(v2, v3);
}

uint64_t sub_100BF5530@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v86 = a2;
  uint64_t v3 = sub_10017DF08(&qword_100E63F80);
  __chkstk_darwin(v3 - 8);
  uint64_t v85 = (uint64_t)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = type metadata accessor for Font.TextStyle();
  uint64_t v83 = *(void *)(v84 - 8);
  __chkstk_darwin(v84);
  uint64_t v82 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_10017DF08(&qword_100EB8880);
  __chkstk_darwin(v78);
  uint64_t v76 = (uint64_t *)((char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_10017DF08(&qword_100EB8888);
  uint64_t v90 = *(void *)(v7 - 8);
  uint64_t v91 = v7;
  __chkstk_darwin(v7);
  v88 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v89 = (char *)&v72 - v10;
  uint64_t v74 = type metadata accessor for TypesettingLanguageAwareLineHeightRatio();
  uint64_t v73 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  uint64_t v12 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = a1;
  uint64_t v13 = *(char **)(a1 + 8);
  char v93 = *(char **)a1;
  uint64_t v94 = v13;
  unint64_t v77 = sub_10014A85C();
  swift_bridgeObjectRetain();
  uint64_t v14 = Text.init<A>(_:)();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  static Font.footnote.getter();
  static Font.Weight.medium.getter();
  Font.weight(_:)();
  swift_release();
  uint64_t v19 = Text.font(_:)();
  uint64_t v21 = v20;
  LOBYTE(a1) = v22;
  swift_release();
  sub_100191924(v14, v16, v18);
  swift_bridgeObjectRelease();
  static Color.secondary.getter();
  uint64_t v23 = Text.foregroundColor(_:)();
  uint64_t v25 = v24;
  LOBYTE(v16) = v26;
  swift_release();
  sub_100191924(v19, v21, a1 & 1);
  swift_bridgeObjectRelease();
  static TypesettingLanguageAwareLineHeightRatio.disable.getter();
  uint64_t v81 = Text.typesettingLanguageAwareLineHeightRatio(_:isEnabled:)();
  uint64_t v80 = v27;
  uint64_t v79 = v28;
  int v87 = v29 & 1;
  sub_100191924(v23, v25, v16 & 1);
  swift_bridgeObjectRelease();
  uint64_t v30 = *(void (**)(char *, uint64_t))(v73 + 8);
  uint64_t v31 = v74;
  v30(v12, v74);
  uint64_t v32 = static VerticalAlignment.firstTextBaseline.getter();
  swift_beginAccess();
  double v33 = sub_100AB55B4();
  swift_release();
  swift_release();
  uint64_t v34 = (uint64_t)v76;
  *uint64_t v76 = v32;
  *(double *)(v34 + 8) = v33;
  *(unsigned char *)(v34 + 16) = 0;
  uint64_t v35 = sub_10017DF08(&qword_100EB8890);
  uint64_t v36 = v75;
  sub_100BF5E48(v75, v34 + *(int *)(v35 + 44));
  static TypesettingLanguageAwareLineHeightRatio.disable.getter();
  sub_1001246C8(&qword_100EB8898, &qword_100EB8880);
  uint64_t v37 = v88;
  View.typesettingLanguageAwareLineHeightRatio(_:isEnabled:)();
  v30(v12, v31);
  sub_1001781AC(v34, &qword_100EB8880);
  (*(void (**)(char *, char *, uint64_t))(v90 + 32))(v89, v37, v91);
  uint64_t v38 = (char **)(v36 + *(int *)(type metadata accessor for TitleAndDetailLollipopDetailViewModel(0) + 36));
  uint64_t v39 = v38[1];
  char v93 = *v38;
  uint64_t v94 = v39;
  swift_bridgeObjectRetain();
  uint64_t v40 = Text.init<A>(_:)();
  uint64_t v42 = v41;
  LOBYTE(v12) = v43 & 1;
  uint64_t v44 = v83;
  uint64_t v45 = v82;
  uint64_t v46 = v84;
  (*(void (**)(char *, void, uint64_t))(v83 + 104))(v82, enum case for Font.TextStyle.caption2(_:), v84);
  uint64_t v47 = type metadata accessor for Font.Design();
  uint64_t v48 = v85;
  _s7Weather24LocationCompositionStateOwst_0(v85, 1, 1, v47);
  static Font.system(_:design:weight:)();
  sub_1001781AC(v48, &qword_100E63F80);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
  static Font.Weight.medium.getter();
  Font.weight(_:)();
  swift_release();
  uint64_t v49 = Text.font(_:)();
  uint64_t v51 = v50;
  LOBYTE(v44) = v52;
  swift_release();
  sub_100191924(v40, v42, (char)v12);
  swift_bridgeObjectRelease();
  static Color.secondary.getter();
  uint64_t v84 = Text.foregroundColor(_:)();
  uint64_t v83 = v53;
  LOBYTE(v42) = v54;
  uint64_t v85 = v55;
  swift_release();
  LOBYTE(v12) = v42 & 1;
  sub_100191924(v49, v51, v44 & 1);
  swift_bridgeObjectRelease();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v82 = v93;
  LODWORD(v78) = v94;
  unint64_t v77 = v95;
  LODWORD(v76) = v96;
  uint64_t v75 = v97;
  uint64_t v74 = v98;
  LOBYTE(v51) = v87;
  char v92 = v87;
  uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v90 + 16);
  uint64_t v57 = v88;
  uint64_t v58 = v91;
  v56(v88, v89, v91);
  uint64_t v59 = v86;
  *uint64_t v86 = 0x4018000000000000;
  *((unsigned char *)v59 + 8) = 0;
  uint64_t v60 = v81;
  uint64_t v61 = v80;
  v59[2] = v81;
  v59[3] = v61;
  *((unsigned char *)v59 + 32) = v51;
  v59[5] = v79;
  uint64_t v62 = (char *)v59;
  char v63 = (int *)sub_10017DF08(&qword_100EB88A0);
  v56(&v62[v63[16]], v57, v58);
  uint64_t v64 = &v62[v63[20]];
  uint64_t v65 = v84;
  uint64_t v66 = v83;
  *(void *)uint64_t v64 = v84;
  *((void *)v64 + 1) = v66;
  v64[16] = (char)v12;
  *((void *)v64 + 3) = v85;
  char v67 = &v62[v63[24]];
  *(void *)char v67 = 0;
  v67[8] = 1;
  *((void *)v67 + 2) = v82;
  v67[24] = v78;
  *((void *)v67 + 4) = v77;
  v67[40] = (char)v76;
  uint64_t v68 = v74;
  *((void *)v67 + 6) = v75;
  *((void *)v67 + 7) = v68;
  sub_100190CC4(v60, v61, v87);
  swift_bridgeObjectRetain();
  sub_100190CC4(v65, v66, (char)v12);
  uint64_t v69 = *(void (**)(char *, uint64_t))(v90 + 8);
  swift_bridgeObjectRetain();
  uint64_t v70 = v91;
  v69(v89, v91);
  sub_100191924(v65, v66, (char)v12);
  swift_bridgeObjectRelease();
  v69(v88, v70);
  sub_100191924(v60, v61, v92);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100BF5E48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v95 = a2;
  uint64_t v3 = sub_10017DF08(&qword_100EB88A8);
  __chkstk_darwin(v3);
  uint64_t v93 = (uint64_t)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10017DF08(&qword_100E63F80);
  __chkstk_darwin(v5 - 8);
  uint64_t v90 = (uint64_t)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Font.TextStyle();
  uint64_t v88 = *(void *)(v7 - 8);
  uint64_t v89 = v7;
  __chkstk_darwin(v7);
  int v87 = (char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_10017DF08(&qword_100EAADC0);
  __chkstk_darwin(v84);
  uint64_t v10 = (uint64_t *)((char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = type metadata accessor for Image.Scale();
  uint64_t v85 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10017DF08(&qword_100E7DFA0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10017DF08(&qword_100E6F770);
  __chkstk_darwin(v17);
  uint64_t v19 = (uint64_t *)((char *)&v82 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v91 = sub_10017DF08(&qword_100E76A00);
  __chkstk_darwin(v91);
  uint64_t v86 = (uint64_t)&v82 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10017DF08(&qword_100EB8840);
  __chkstk_darwin(v21 - 8);
  uint64_t v92 = (uint64_t)&v82 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v94 = (uint64_t)&v82 - v24;
  uint64_t v25 = sub_10017DF08(&qword_100EB88B0);
  __chkstk_darwin(v25);
  uint64_t v27 = (char *)&v82 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for TitleAndDetailLollipopDetailViewModel(0);
  int v29 = *(unsigned __int8 *)(a1 + *(int *)(v28 + 44));
  uint64_t v96 = v3;
  if (v29 == 1)
  {
    uint64_t v30 = sub_100BF6840(a1);
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    int v36 = v35 & 1;
    uint64_t v37 = sub_100BF6B1C(a1);
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    char v43 = v42 & 1;
    sub_100190CC4(v30, v32, v36);
    swift_bridgeObjectRetain();
    sub_100190CC4(v37, v39, v43);
    swift_bridgeObjectRetain();
    uint64_t v93 = v32;
    uint64_t v94 = v30;
    LODWORD(v92) = v36;
    sub_100190CC4(v30, v32, v36);
    swift_bridgeObjectRetain();
    sub_100190CC4(v37, v39, v43);
    swift_bridgeObjectRetain();
    sub_100191924(v37, v39, v43);
    swift_bridgeObjectRelease();
    sub_100191924(v30, v32, v36);
    swift_bridgeObjectRelease();
    *(void *)uint64_t v27 = v30;
    *((void *)v27 + 1) = v32;
    v27[16] = v36;
    *((void *)v27 + 3) = v34;
    *((void *)v27 + 4) = v37;
    *((void *)v27 + 5) = v39;
    v27[48] = v43;
    *((void *)v27 + 7) = v41;
    swift_storeEnumTagMultiPayload();
    sub_10017DF08(&qword_100E8F118);
    sub_1001246C8(&qword_100E8F120, &qword_100E8F118);
    sub_1001246C8(&qword_100EB88C0, &qword_100EB88A8);
    _ConditionalContent<>.init(storage:)();
    sub_100191924(v37, v39, v43);
    swift_bridgeObjectRelease();
    sub_100191924(v94, v93, v92);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v82 = v25;
    uint64_t v83 = v27;
    if (*(void *)(a1 + *(int *)(v28 + 32) + 8))
    {
      swift_bridgeObjectRetain();
      Image.init(systemName:)();
      static Image.TemplateRenderingMode.macSafeOriginal.getter();
      uint64_t v45 = type metadata accessor for Image.TemplateRenderingMode();
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v16, 0, 1, v45);
      uint64_t v46 = Image.renderingMode(_:)();
      swift_release();
      sub_1001781AC((uint64_t)v16, &qword_100E7DFA0);
      uint64_t v47 = v85;
      (*(void (**)(char *, void, uint64_t))(v85 + 104))(v13, enum case for Image.Scale.small(_:), v11);
      uint64_t KeyPath = swift_getKeyPath();
      (*(void (**)(char *, char *, uint64_t))(v47 + 16))((char *)v10 + *(int *)(v84 + 28), v13, v11);
      *uint64_t v10 = KeyPath;
      sub_10006DF38((uint64_t)v10, (uint64_t)v19 + *(int *)(v17 + 36), &qword_100EAADC0);
      *uint64_t v19 = v46;
      swift_retain();
      sub_1001781AC((uint64_t)v10, &qword_100EAADC0);
      (*(void (**)(char *, uint64_t))(v47 + 8))(v13, v11);
      swift_release();
      uint64_t v50 = v87;
      uint64_t v49 = v88;
      uint64_t v51 = v89;
      (*(void (**)(char *, void, uint64_t))(v88 + 104))(v87, enum case for Font.TextStyle.largeTitle(_:), v89);
      uint64_t v52 = type metadata accessor for Font.Design();
      uint64_t v53 = v90;
      _s7Weather24LocationCompositionStateOwst_0(v90, 1, 1, v52);
      uint64_t v54 = static Font.system(_:design:weight:)();
      sub_1001781AC(v53, &qword_100E63F80);
      (*(void (**)(char *, uint64_t))(v49 + 8))(v50, v51);
      uint64_t v55 = swift_getKeyPath();
      uint64_t v56 = v86;
      sub_10006DF38((uint64_t)v19, v86, &qword_100E6F770);
      uint64_t v57 = v91;
      uint64_t v58 = (uint64_t *)(v56 + *(int *)(v91 + 36));
      *uint64_t v58 = v55;
      v58[1] = v54;
      sub_1001781AC((uint64_t)v19, &qword_100E6F770);
      uint64_t v59 = v94;
      sub_100BF6F44(v56, v94);
      uint64_t v60 = 0;
    }
    else
    {
      uint64_t v60 = 1;
      uint64_t v59 = v94;
      uint64_t v57 = v91;
    }
    _s7Weather24LocationCompositionStateOwst_0(v59, v60, 1, v57);
    uint64_t v61 = sub_100BF6B1C(a1);
    uint64_t v91 = v62;
    uint64_t v64 = v63;
    int v66 = v65 & 1;
    uint64_t v67 = sub_100BF6840(a1);
    uint64_t v69 = v68;
    uint64_t v71 = v70;
    char v73 = v72 & 1;
    uint64_t v74 = v92;
    sub_10006DF38(v59, v92, &qword_100EB8840);
    char v97 = v66;
    uint64_t v75 = v93;
    sub_10006DF38(v74, v93, &qword_100EB8840);
    uint64_t v76 = sub_10017DF08(&qword_100EB88B8);
    uint64_t v77 = v75 + *(int *)(v76 + 48);
    uint64_t v78 = v91;
    *(void *)uint64_t v77 = v61;
    *(void *)(v77 + 8) = v78;
    int v79 = v66;
    *(unsigned char *)(v77 + 16) = v66;
    *(void *)(v77 + 24) = v64;
    uint64_t v80 = v75 + *(int *)(v76 + 64);
    *(void *)uint64_t v80 = v67;
    *(void *)(v80 + 8) = v69;
    *(unsigned char *)(v80 + 16) = v73;
    *(void *)(v80 + 24) = v71;
    uint64_t v81 = v78;
    LODWORD(v90) = v79;
    sub_100190CC4(v61, v78, v79);
    swift_bridgeObjectRetain();
    sub_100190CC4(v67, v69, v73);
    swift_bridgeObjectRetain();
    uint64_t v89 = v61;
    sub_100190CC4(v61, v81, v79);
    uint64_t v88 = v64;
    swift_bridgeObjectRetain();
    sub_100190CC4(v67, v69, v73);
    swift_bridgeObjectRetain();
    sub_100191924(v67, v69, v73);
    swift_bridgeObjectRelease();
    sub_100191924(v61, v81, v97);
    swift_bridgeObjectRelease();
    sub_1001781AC(v74, &qword_100EB8840);
    sub_10006DF38(v75, (uint64_t)v83, &qword_100EB88A8);
    swift_storeEnumTagMultiPayload();
    sub_10017DF08(&qword_100E8F118);
    sub_1001246C8(&qword_100E8F120, &qword_100E8F118);
    sub_1001246C8(&qword_100EB88C0, &qword_100EB88A8);
    _ConditionalContent<>.init(storage:)();
    sub_1001781AC(v75, &qword_100EB88A8);
    sub_100191924(v67, v69, v73);
    swift_bridgeObjectRelease();
    sub_100191924(v89, v91, v90);
    swift_bridgeObjectRelease();
    return sub_1001781AC(v94, &qword_100EB8840);
  }
}

uint64_t sub_100BF6840(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Text.Scale();
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v35 = v2;
  __chkstk_darwin(v2);
  uint64_t v33 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (uint64_t *)(a1 + *(int *)(type metadata accessor for TitleAndDetailLollipopDetailViewModel(0) + 28));
  uint64_t v5 = v4[1];
  uint64_t v38 = *v4;
  uint64_t v39 = v5;
  sub_10014A85C();
  swift_bridgeObjectRetain();
  uint64_t v6 = Text.init<A>(_:)();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  swift_beginAccess();
  double v11 = sub_100AB55B4();
  *(void *)&long long v36 = v12;
  *((void *)&v36 + 1) = v13;
  double v37 = v11;
  sub_100AB5628();
  uint64_t v14 = xmmword_100EAEB98;
  xmmword_100EAEB98 = v36;
  qword_100EAEBA8 = *(void *)&v37;
  swift_endAccess();
  sub_1004846F4(v14);
  uint64_t v15 = Text.font(_:)();
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  sub_100191924(v6, v8, v10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  double v20 = sub_100AB55B4();
  *(void *)&long long v36 = v21;
  *((void *)&v36 + 1) = v22;
  double v37 = v20;
  sub_100AB5670();
  uint64_t v23 = xmmword_100EAEB98;
  xmmword_100EAEB98 = v36;
  qword_100EAEBA8 = *(void *)&v37;
  swift_endAccess();
  sub_1004846F4(v23);
  uint64_t v24 = Text.foregroundColor(_:)();
  uint64_t v26 = v25;
  char v28 = v27 & 1;
  sub_100191924(v15, v17, v19);
  swift_release();
  swift_bridgeObjectRelease();
  int v29 = v33;
  static Text.Scale.secondary.getter();
  uint64_t v30 = Text.textScale(_:isEnabled:)();
  sub_100191924(v24, v26, v28);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v29, v35);
  return v30;
}

uint64_t sub_100BF6B1C(uint64_t a1)
{
  uint64_t v31 = type metadata accessor for Font.Leading();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10017DF08(&qword_100E63F80);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Font.TextStyle();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  double v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for AttributedString();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for TitleAndDetailLollipopDetailViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1 + *(int *)(v16 + 20), v12);
  uint64_t v17 = Text.init(_:)();
  uint64_t v19 = v18;
  v30[1] = v20;
  LOBYTE(v13) = v21 & 1;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for Font.TextStyle.largeTitle(_:), v8);
  uint64_t v22 = type metadata accessor for Font.Design();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v7, 1, 1, v22);
  static Font.system(_:design:weight:)();
  sub_1001781AC((uint64_t)v7, &qword_100E63F80);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v23 = v31;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for Font.Leading.tight(_:), v31);
  Font.leading(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v23);
  static Font.Weight.bold.getter();
  Font.weight(_:)();
  swift_release();
  uint64_t v24 = Text.font(_:)();
  uint64_t v26 = v25;
  LOBYTE(v8) = v27;
  swift_release();
  sub_100191924(v17, v19, v13);
  swift_bridgeObjectRelease();
  static Color.primary.getter();
  uint64_t v28 = Text.foregroundColor(_:)();
  swift_release();
  sub_100191924(v24, v26, v8 & 1);
  swift_bridgeObjectRelease();
  return v28;
}

uint64_t sub_100BF6EFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100BF6F18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100BF6F44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10017DF08(&qword_100E76A00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100BF6FAC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  char v9 = a7 & 1;
  sub_100190CC4(a1, a2, a3 & 1);
  swift_bridgeObjectRetain();
  sub_100190CC4(a5, a6, v9);

  return swift_bridgeObjectRetain();
}

uint64_t sub_100BF7020(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  char v9 = a7 & 1;
  sub_100191924(a1, a2, a3 & 1);
  swift_bridgeObjectRelease();
  sub_100191924(a5, a6, v9);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100BF7094()
{
  return sub_1001246C8(&qword_100EB88C8, &qword_100EB88D0);
}

uint64_t sub_100BF70D0()
{
  return sub_1001246C8(&qword_100EB88D8, &qword_100EB88E0);
}

uint64_t sub_100BF710C()
{
  return sub_1001246C8(&qword_100EB88E8, &qword_100EB88F0);
}

uint64_t sub_100BF7148(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  LOBYTE(v6) = DetailKind.init(rawValue:)(*(Swift::String *)&a1);
  if (v6 == 2)
  {
    if (a4)
    {
      v8._countAndFlagsBits = a3;
      v8._object = a4;
      v9.value = TemperatureKind.init(rawValue:)(v8).value;
      if (v9.value) {
        unsigned int v10 = 4;
      }
      else {
        unsigned int v10 = 3;
      }
      if (v9.value == Weather_TemperatureKind_unknownDefault) {
        return 2;
      }
      else {
        return v10;
      }
    }
    else
    {
      return 2;
    }
  }
  else if (v6 == 17)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  else
  {
    uint64_t v7 = v6;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_100BF71E4()
{
  uint64_t v0 = sub_10017DF08(&qword_100E62CC8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for LocalizedStringResource();
  __chkstk_darwin(v3);
  uint64_t v4 = type metadata accessor for TypeDisplayRepresentation();
  sub_100097814(v4, static DetailKind.typeDisplayRepresentation);
  sub_1002102B0(v4, (uint64_t)static DetailKind.typeDisplayRepresentation);
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v3);
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t DetailKind.typeDisplayRepresentation.unsafeMutableAddressor()
{
  if (qword_100E62C08 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for TypeDisplayRepresentation();

  return sub_1002102B0(v0, (uint64_t)static DetailKind.typeDisplayRepresentation);
}

uint64_t static DetailKind.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100E62C08 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for TypeDisplayRepresentation();
  uint64_t v3 = sub_1002102B0(v2, (uint64_t)static DetailKind.typeDisplayRepresentation);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static DetailKind.typeDisplayRepresentation.setter(uint64_t a1)
{
  if (qword_100E62C08 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for TypeDisplayRepresentation();
  uint64_t v3 = sub_1002102B0(v2, (uint64_t)static DetailKind.typeDisplayRepresentation);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static DetailKind.typeDisplayRepresentation.modify())()
{
  if (qword_100E62C08 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for TypeDisplayRepresentation();
  sub_1002102B0(v0, (uint64_t)static DetailKind.typeDisplayRepresentation);
  swift_beginAccess();
  return j__swift_endAccess_0;
}

Weather::DetailKind_optional __swiftcall DetailKind.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v1 = _findStringSwitchCaseWithCache(cases:string:cache:)();
  swift_bridgeObjectRelease();
  if (v1 >= 0x11) {
    return (Weather::DetailKind_optional)17;
  }
  else {
    return (Weather::DetailKind_optional)v1;
  }
}

uint64_t sub_100BF7620()
{
  uint64_t v0 = sub_10017DF08(&qword_100E6B3E0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10017DF08(&qword_100E62CC8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LocalizedStringResource();
  uint64_t v22 = *(unsigned char **)(v6 - 8);
  uint64_t v23 = v6 - 8;
  uint64_t v24 = v22;
  __chkstk_darwin(v6);
  sub_10017DF08(&qword_100EB8968);
  uint64_t v7 = (int *)(sub_10017DF08(&qword_100EB8970) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(*(void *)v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v7 + 80);
  uint64_t v9 = *(void *)(*(void *)v7 + 72);
  uint64_t v10 = swift_allocObject();
  uint64_t v25 = v10;
  *(_OWORD *)(v10 + 16) = xmmword_100C831E0;
  double v11 = (unsigned char *)(v10 + v8);
  *double v11 = 0;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v6);
  uint64_t v12 = type metadata accessor for DisplayRepresentation.Image();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v12);
  DisplayRepresentation.init(title:subtitle:image:)();
  v11[v9] = 1;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v6);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v12);
  DisplayRepresentation.init(title:subtitle:image:)();
  v11[2 * v9] = 16;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v6);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v12);
  DisplayRepresentation.init(title:subtitle:image:)();
  uint64_t v21 = v9;
  uint64_t v28 = v11;
  v11[3 * v9] = 2;
  LocalizedStringResource.init(stringLiteral:)();
  uint64_t v27 = v6;
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v6);
  uint64_t v26 = v12;
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v12);
  DisplayRepresentation.init(title:subtitle:image:)();
  uint64_t v13 = &v11[4 * v9];
  v20[1] = &v13[v7[14]];
  *uint64_t v13 = 3;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v6);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v12);
  sub_10017DF08(&qword_100E7F258);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100C251B0;
  LocalizedStringResource.init(stringLiteral:)();
  DisplayRepresentation.init(title:subtitle:image:synonyms:)();
  uint64_t v14 = v21;
  uint64_t v15 = &v28[5 * v21];
  uint64_t v24 = &v15[v7[14]];
  *uint64_t v15 = 4;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v27);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v26);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100C25ED0;
  LocalizedStringResource.init(stringLiteral:)();
  LocalizedStringResource.init(stringLiteral:)();
  DisplayRepresentation.init(title:subtitle:image:synonyms:)();
  uint64_t v16 = v28;
  v28[6 * v14] = 5;
  LocalizedStringResource.init(stringLiteral:)();
  uint64_t v17 = v27;
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v27);
  uint64_t v18 = v26;
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v26);
  DisplayRepresentation.init(title:subtitle:image:)();
  v16[7 * v14] = 6;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v17);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v18);
  DisplayRepresentation.init(title:subtitle:image:)();
  v16[8 * v14] = 7;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v17);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v18);
  DisplayRepresentation.init(title:subtitle:image:)();
  v16[9 * v14] = 8;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v17);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v18);
  DisplayRepresentation.init(title:subtitle:image:)();
  v16[10 * v14] = 9;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v17);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v18);
  DisplayRepresentation.init(title:subtitle:image:)();
  v16[11 * v14] = 10;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v17);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v18);
  DisplayRepresentation.init(title:subtitle:image:)();
  v16[12 * v14] = 11;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v17);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v18);
  DisplayRepresentation.init(title:subtitle:image:)();
  v16[13 * v14] = 12;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v17);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v18);
  DisplayRepresentation.init(title:subtitle:image:)();
  v16[14 * v14] = 13;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v17);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v18);
  DisplayRepresentation.init(title:subtitle:image:)();
  v16[15 * v14] = 14;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v17);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v18);
  DisplayRepresentation.init(title:subtitle:image:)();
  v16[16 * v14] = 15;
  LocalizedStringResource.init(stringLiteral:)();
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v5, 1, 1, v17);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v2, 1, 1, v18);
  DisplayRepresentation.init(title:subtitle:image:)();
  type metadata accessor for DisplayRepresentation();
  sub_100BF89D4();
  uint64_t result = Dictionary.init(dictionaryLiteral:)();
  static DetailKind.caseDisplayRepresentations = result;
  return result;
}

uint64_t *DetailKind.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_100E62C10 != -1) {
    swift_once();
  }
  return &static DetailKind.caseDisplayRepresentations;
}

uint64_t static DetailKind.caseDisplayRepresentations.getter()
{
  if (qword_100E62C10 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static DetailKind.caseDisplayRepresentations.setter(uint64_t a1)
{
  if (qword_100E62C10 != -1) {
    swift_once();
  }
  swift_beginAccess();
  static DetailKind.caseDisplayRepresentations = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static DetailKind.caseDisplayRepresentations.modify())()
{
  if (qword_100E62C10 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess_0;
}

_UNKNOWN **static DetailKind.allCases.getter()
{
  return &off_100E08E60;
}

unint64_t DetailKind.rawValue.getter(char a1)
{
  unint64_t result = 0x696C617551726961;
  switch(a1)
  {
    case 1:
    case 16:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0x6F697469646E6F63;
      break;
    case 3:
      unint64_t result = 0x6B694C736C656566;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
      unint64_t result = 0x79746964696D7568;
      break;
    case 6:
      unint64_t result = 1852796781;
      break;
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    case 8:
      unint64_t result = 0x6572757373657270;
      break;
    case 9:
      unint64_t result = 0x53657369726E7573;
      break;
    case 10:
    case 11:
    case 12:
      unint64_t result = 0x74617265706D6574;
      break;
    case 13:
      unint64_t result = 0x7865646E497675;
      break;
    case 14:
      unint64_t result = 0x696C696269736976;
      break;
    case 15:
      unint64_t result = 1684957559;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100BF84CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10088B8F0(*a1, *a2);
}

unint64_t sub_100BF84DC()
{
  unint64_t result = qword_100EB88F8;
  if (!qword_100EB88F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB88F8);
  }
  return result;
}

Swift::Int sub_100BF8528()
{
  return sub_1006526B0(*v0);
}

uint64_t sub_100BF8530(uint64_t a1)
{
  return sub_1002C324C(a1, *v1);
}

Swift::Int sub_100BF8538(uint64_t a1)
{
  return sub_1002C4194(a1, *v1);
}

Weather::DetailKind_optional sub_100BF8540@<W0>(Swift::String *a1@<X0>, Weather::DetailKind_optional *a2@<X8>)
{
  result.value = DetailKind.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

unint64_t sub_100BF8570@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DetailKind.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100BF85A0()
{
  unint64_t result = qword_100EB8900;
  if (!qword_100EB8900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8900);
  }
  return result;
}

unint64_t sub_100BF85F0()
{
  unint64_t result = qword_100EB8908;
  if (!qword_100EB8908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8908);
  }
  return result;
}

unint64_t sub_100BF8640()
{
  unint64_t result = qword_100EB8910;
  if (!qword_100EB8910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8910);
  }
  return result;
}

unint64_t sub_100BF8690()
{
  unint64_t result = qword_100EB8918;
  if (!qword_100EB8918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8918);
  }
  return result;
}

unint64_t sub_100BF86E0()
{
  unint64_t result = qword_100EB8920;
  if (!qword_100EB8920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8920);
  }
  return result;
}

unint64_t sub_100BF8730()
{
  unint64_t result = qword_100EB8928;
  if (!qword_100EB8928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8928);
  }
  return result;
}

unint64_t sub_100BF8780()
{
  unint64_t result = qword_100EB8930;
  if (!qword_100EB8930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8930);
  }
  return result;
}

uint64_t sub_100BF87CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = DetailKind.typeDisplayRepresentation.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v3 = type metadata accessor for TypeDisplayRepresentation();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a1, v2, v3);
}

uint64_t sub_100BF8848()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100BF8898()
{
  unint64_t result = qword_100EB8938;
  if (!qword_100EB8938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8938);
  }
  return result;
}

uint64_t sub_100BF88E4(uint64_t a1)
{
  unint64_t v2 = sub_100BF8898();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100BF8934()
{
  unint64_t result = qword_100EB8940;
  if (!qword_100EB8940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8940);
  }
  return result;
}

unint64_t sub_100BF8984()
{
  unint64_t result = qword_100EB8948;
  if (!qword_100EB8948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8948);
  }
  return result;
}

unint64_t sub_100BF89D4()
{
  unint64_t result = qword_100EB8950;
  if (!qword_100EB8950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8950);
  }
  return result;
}

uint64_t sub_100BF8A20()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100BF8A6C(uint64_t a1)
{
  unint64_t v2 = sub_100BF8780();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100BF8ABC()
{
  unint64_t result = qword_100EB8958;
  if (!qword_100EB8958)
  {
    sub_10018C6DC(&qword_100EB8960);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8958);
  }
  return result;
}

void sub_100BF8B10(void *a1@<X8>)
{
  *a1 = &off_100E08E60;
}

unsigned char *storeEnumTagSinglePayload for DetailKind(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *unint64_t result = a2 + 16;
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
        JUMPOUT(0x100BF8BECLL);
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
          *unint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DetailKind()
{
  return &type metadata for DetailKind;
}

uint64_t sub_100BF8C24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v57 = type metadata accessor for AutomationInfo(0);
  sub_100162E4C();
  __chkstk_darwin(v3);
  sub_1001626E0();
  uint64_t v56 = v5 - v4;
  type metadata accessor for AccessibilityChildBehavior();
  sub_100179C0C();
  uint64_t v54 = v7;
  uint64_t v55 = v6;
  __chkstk_darwin(v6);
  sub_1001626E0();
  uint64_t v8 = sub_10017DF08(&qword_100EB8A20);
  __chkstk_darwin(v8 - 8);
  sub_1001626E0();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_10017DF08(&qword_100EB8A28);
  sub_100162E4C();
  __chkstk_darwin(v13);
  sub_1001626E0();
  uint64_t v16 = v15 - v14;
  sub_10017DF08(&qword_100EB8A30);
  sub_100179C0C();
  uint64_t v52 = v17;
  uint64_t v53 = v18;
  __chkstk_darwin(v17);
  sub_1001626E0();
  uint64_t v19 = sub_10017DF08(&qword_100E7A0F0);
  __chkstk_darwin(v19 - 8);
  sub_1001626E0();
  uint64_t v22 = v21 - v20;
  uint64_t v23 = *(void *)(v2 + 144);
  char v24 = *(unsigned char *)(v2 + 152);
  sub_100195B7C(v23, v24);
  sub_100149AE8();
  char v26 = v25;
  sub_10018F6D8(v23, v24);
  if (v26) {
    uint64_t v27 = 0x4030000000000000;
  }
  else {
    uint64_t v27 = 0;
  }
  *(void *)uint64_t v11 = static HorizontalAlignment.leading.getter();
  *(void *)(v11 + 8) = 0;
  *(unsigned char *)(v11 + 16) = 1;
  uint64_t v28 = sub_10017DF08(&qword_100EB8A38);
  sub_100BF8FE0(v2, v27, (v26 & 1) == 0, v11 + *(int *)(v28 + 44));
  char v29 = static Edge.Set.top.getter();
  EdgeInsets.init(_all:)();
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  sub_10006DF38(v11, v16, &qword_100EB8A20);
  uint64_t v38 = v16 + *(int *)(v12 + 36);
  *(unsigned char *)uint64_t v38 = v29;
  *(void *)(v38 + 8) = v31;
  *(void *)(v38 + 16) = v33;
  *(void *)(v38 + 24) = v35;
  *(void *)(v38 + 32) = v37;
  *(unsigned char *)(v38 + 40) = 0;
  sub_100178110(v11, &qword_100EB8A20);
  static AccessibilityChildBehavior.combine.getter();
  unint64_t v39 = sub_100BFC6A8();
  View.accessibilityElement(children:)();
  sub_100162F0C();
  v40();
  sub_100178110(v16, &qword_100EB8A28);
  uint64_t v59 = v12;
  swift_getOpaqueTypeConformance2();
  View.accessibilityRespondsToUserInteraction(_:)();
  sub_100162F0C();
  v41();
  type metadata accessor for AutomationCellInfo(0);
  uint64_t v42 = v56;
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  sub_10048D6A0(v56, v43, v44, v45, v46, v47, v48, v49, v51, v52, v53, v54, v55, v56, v57, a1, v59, v39, v60, v61);
  sub_10014D078(v42, (void (*)(void))type metadata accessor for AutomationInfo);
  return sub_100178110(v22, &qword_100E7A0F0);
}

uint64_t sub_100BF8FE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v82 = a3;
  uint64_t v83 = a2;
  uint64_t v84 = a4;
  uint64_t v5 = sub_10017DF08(&qword_100EB8A50);
  __chkstk_darwin(v5 - 8);
  uint64_t v85 = (uint64_t)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v81 = (uint64_t)&v73 - v8;
  uint64_t v9 = sub_10017DF08(&qword_100EB8A58);
  __chkstk_darwin(v9 - 8);
  uint64_t v80 = (uint64_t)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v79 = (uint64_t)&v73 - v12;
  uint64_t v78 = sub_10017DF08(&qword_100EB8A60);
  __chkstk_darwin(v78);
  uint64_t v74 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v75 = (char *)&v73 - v15;
  uint64_t v16 = sub_10017DF08(&qword_100EB8A68);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_10017DF08(&qword_100EB8A70);
  __chkstk_darwin(v77);
  uint64_t v20 = (char *)&v73 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v73 - v22;
  uint64_t v24 = type metadata accessor for AirQualityComponentView();
  __chkstk_darwin(v24 - 8);
  char v26 = (char *)&v73 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10017DF08(&qword_100EB8A78);
  __chkstk_darwin(v27 - 8);
  uint64_t v76 = (uint64_t)&v73 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  uint64_t v31 = (char *)&v73 - v30;
  memcpy(__dst, (const void *)a1, sizeof(__dst));
  uint64_t v32 = *(void *)(a1 + 144);
  char v33 = *(unsigned char *)(a1 + 152);
  sub_100195B7C(v32, v33);
  sub_100149AE8();
  char v35 = v34;
  sub_10018F6D8(v32, v33);
  uint64_t v87 = sub_10079F60C(v35 & 1);
  uint64_t v86 = v36;
  uint64_t v37 = *(void *)(a1 + 112);
  char v38 = *(unsigned char *)(a1 + 120);
  sub_100195B7C(v37, v38);
  sub_100149AE8();
  char v40 = v39;
  sub_10018F6D8(v37, v38);
  sub_100BFC748(a1, (uint64_t)v26, (void (*)(void))type metadata accessor for AirQualityComponentView);
  if (v40)
  {
    sub_10014D078((uint64_t)v26, (void (*)(void))type metadata accessor for AirQualityComponentView);
LABEL_4:
    uint64_t v45 = *(void *)(a1 + 112);
    char v46 = *(unsigned char *)(a1 + 120);
    sub_100195B7C(v45, v46);
    sub_100149AE8();
    sub_10018F6D8(v45, v46);
    swift_retain();
    sub_100195B7C(v45, v46);
    sub_100149AE8();
    char v48 = v47;
    sub_10018F6D8(v45, v46);
    memcpy(v88, (const void *)a1, sizeof(v88));
    if (v48)
    {
      sub_10079F7A8();
      uint64_t v50 = v49;
    }
    else
    {
      uint64_t v50 = sub_10079F7A8();
    }
    swift_release();
    uint64_t v51 = (uint64_t)v31;
    *(void *)uint64_t v20 = static HorizontalAlignment.leading.getter();
    *((void *)v20 + 1) = 0;
    v20[16] = 1;
    uint64_t v52 = sub_10017DF08(&qword_100EB8AA0);
    sub_100BFA718(a1, v50, &v20[*(int *)(v52 + 44)]);
    swift_release();
    swift_release();
    uint64_t v53 = &qword_100EB8A70;
    sub_10020E72C((uint64_t)v20, (uint64_t)v23, &qword_100EB8A70);
    sub_10006DF38((uint64_t)v23, (uint64_t)v18, &qword_100EB8A70);
    swift_storeEnumTagMultiPayload();
    sub_1001246C8(&qword_100EB8A88, &qword_100EB8A70);
    goto LABEL_13;
  }
  uint64_t v41 = *((void *)v26 + 18);
  char v42 = v26[152];
  sub_100195B7C(v41, v42);
  sub_100149AE8();
  char v44 = v43;
  sub_10018F6D8(v41, v42);
  sub_10014D078((uint64_t)v26, (void (*)(void))type metadata accessor for AirQualityComponentView);
  if (v44) {
    goto LABEL_4;
  }
  unsigned __int8 v54 = static Axis.Set.horizontal.getter();
  unsigned __int8 v55 = static Axis.Set.vertical.getter();
  char v56 = Axis.Set.init(rawValue:)();
  Axis.Set.init(rawValue:)();
  if (Axis.Set.init(rawValue:)() != v54) {
    char v56 = Axis.Set.init(rawValue:)();
  }
  Axis.Set.init(rawValue:)();
  uint64_t v51 = (uint64_t)v31;
  if (Axis.Set.init(rawValue:)() != v55) {
    char v56 = Axis.Set.init(rawValue:)();
  }
  uint64_t v57 = v74;
  *uint64_t v74 = v56;
  uint64_t v58 = sub_10017DF08(&qword_100EB8A80);
  sub_100BF98B8((const void *)a1, v86, (uint64_t)&v57[*(int *)(v58 + 44)]);
  uint64_t v53 = &qword_100EB8A60;
  uint64_t v59 = (uint64_t)v57;
  uint64_t v23 = v75;
  sub_10020E72C(v59, (uint64_t)v75, &qword_100EB8A60);
  sub_10006DF38((uint64_t)v23, (uint64_t)v18, &qword_100EB8A60);
  swift_storeEnumTagMultiPayload();
  sub_1001246C8(&qword_100EB8A88, &qword_100EB8A70);
LABEL_13:
  sub_1001246C8(&qword_100EB8A90, &qword_100EB8A60);
  _ConditionalContent<>.init(storage:)();
  sub_100178110((uint64_t)v23, v53);
  uint64_t v60 = v79;
  sub_100BF9AD8(v79);
  uint64_t v61 = v81;
  sub_100BF9E60(v81);
  uint64_t v62 = v76;
  sub_10006DF38(v51, v76, &qword_100EB8A78);
  uint64_t v63 = v80;
  sub_10006DF38(v60, v80, &qword_100EB8A58);
  uint64_t v64 = v85;
  sub_10006DF38(v61, v85, &qword_100EB8A50);
  uint64_t v65 = v84;
  sub_10006DF38(v62, v84, &qword_100EB8A78);
  uint64_t v66 = v51;
  uint64_t v67 = (int *)sub_10017DF08(&qword_100EB8A98);
  uint64_t v68 = v65 + v67[12];
  uint64_t v69 = v83;
  *(void *)uint64_t v68 = v83;
  char v70 = v82 & 1;
  *(unsigned char *)(v68 + 8) = v82 & 1;
  sub_10006DF38(v63, v65 + v67[16], &qword_100EB8A58);
  uint64_t v71 = v65 + v67[20];
  *(void *)uint64_t v71 = v69;
  *(unsigned char *)(v71 + 8) = v70;
  sub_10006DF38(v64, v65 + v67[24], &qword_100EB8A50);
  swift_release();
  swift_release();
  sub_100178110(v61, &qword_100EB8A50);
  sub_100178110(v60, &qword_100EB8A58);
  sub_100178110(v66, &qword_100EB8A78);
  sub_100178110(v64, &qword_100EB8A50);
  sub_100178110(v63, &qword_100EB8A58);
  return sub_100178110(v62, &qword_100EB8A78);
}

uint64_t sub_100BF98B8@<X0>(const void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v4 = sub_10017DF08(&qword_100EB8A70);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v23 - v8;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v23 - v11;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v23 - v14;
  memcpy(__dst, a1, sizeof(__dst));
  uint64_t v16 = sub_10079F7A8();
  swift_release();
  *(void *)uint64_t v15 = static HorizontalAlignment.leading.getter();
  *((void *)v15 + 1) = 0;
  v15[16] = 1;
  uint64_t v17 = sub_10017DF08(&qword_100EB8AA0);
  sub_100BFA718((uint64_t)a1, v16, &v15[*(int *)(v17 + 44)]);
  swift_release();
  sub_10079F7A8();
  uint64_t v19 = v18;
  swift_release();
  *(void *)uint64_t v12 = static HorizontalAlignment.leading.getter();
  *((void *)v12 + 1) = 0;
  v12[16] = 1;
  sub_100BFA718((uint64_t)a1, v19, &v12[*(int *)(v17 + 44)]);
  swift_release();
  sub_10006DF38((uint64_t)v15, (uint64_t)v9, &qword_100EB8A70);
  sub_10006DF38((uint64_t)v12, (uint64_t)v6, &qword_100EB8A70);
  uint64_t v20 = v24;
  sub_10006DF38((uint64_t)v9, v24, &qword_100EB8A70);
  uint64_t v21 = sub_10017DF08(&qword_100EB8B08);
  sub_10006DF38((uint64_t)v6, v20 + *(int *)(v21 + 48), &qword_100EB8A70);
  sub_100178110((uint64_t)v12, &qword_100EB8A70);
  sub_100178110((uint64_t)v15, &qword_100EB8A70);
  sub_100178110((uint64_t)v6, &qword_100EB8A70);
  return sub_100178110((uint64_t)v9, &qword_100EB8A70);
}

uint64_t sub_100BF9AD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v28 = a1;
  uint64_t v3 = type metadata accessor for HorizontalBarPointView();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_10017DF08(&qword_100E7B498);
  __chkstk_darwin(v25);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10017DF08(&qword_100EB8B00);
  __chkstk_darwin(v27);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_10017DF08(&qword_100EB8A58);
  __chkstk_darwin(v26);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(v1 + 128);
  char v14 = *(unsigned char *)(v2 + 136);
  sub_100195B7C(v13, v14);
  sub_100149AE8();
  char v16 = v15;
  sub_10018F6D8(v13, v14);
  if (v16) {
    static Color.black.getter();
  }
  else {
    static Color.white.getter();
  }
  swift_bridgeObjectRetain();
  Gradient.init(stops:)();
  HorizontalBarPointView.init(point:pointColor:gradient:)();
  type metadata accessor for AirQualityComponentView();
  sub_10017DF08(&qword_100E7DDF0);
  ScaledValue.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v8, v6, v3);
  uint64_t v17 = &v8[*(int *)(v25 + 36)];
  long long v18 = v30;
  *(_OWORD *)uint64_t v17 = v29;
  *((_OWORD *)v17 + 1) = v18;
  *((_OWORD *)v17 + 2) = v31;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v19 = *(void *)(v2 + 144);
  char v20 = *(unsigned char *)(v2 + 152);
  sub_100195B7C(v19, v20);
  sub_100149AE8();
  char v22 = v21;
  sub_10018F6D8(v19, v20);
  sub_10006DF38((uint64_t)v8, (uint64_t)v10, &qword_100E7B498);
  uint64_t v23 = &v10[*(int *)(v27 + 36)];
  *uint64_t v23 = 0;
  v23[1] = v22 & 1;
  sub_100178110((uint64_t)v8, &qword_100E7B498);
  sub_10006DF38((uint64_t)v10, (uint64_t)v12, &qword_100EB8B00);
  v12[*(int *)(v26 + 36)] = 0;
  sub_100178110((uint64_t)v10, &qword_100EB8B00);
  return sub_10020E72C((uint64_t)v12, v28, &qword_100EB8A58);
}

uint64_t sub_100BF9E60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AttributedString();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v80 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10017DF08(&qword_100E651D0);
  __chkstk_darwin(v6);
  uint64_t v98 = (uint64_t)v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10017DF08(&qword_100E6D330);
  __chkstk_darwin(v8 - 8);
  uint64_t v97 = (uint64_t)v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v80 - v11;
  uint64_t v13 = sub_10017DF08(&qword_100E863B0);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v95 = (char *)v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_10017DF08(&qword_100EB8AD0);
  __chkstk_darwin(v94);
  uint64_t v96 = (char *)v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10017DF08(&qword_100EB8AD8);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)v80 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10017DF08(&qword_100EB8AE0);
  __chkstk_darwin(v20 - 8);
  char v22 = (char *)v80 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_10017DF08(&qword_100EB8AE8);
  __chkstk_darwin(v23);
  __chkstk_darwin(v24);
  uint64_t v28 = *(void *)(v1 + 72);
  if (v28)
  {
    v80[2] = v6;
    uint64_t v81 = v14;
    uint64_t v82 = v13;
    uint64_t v83 = v17;
    uint64_t v84 = v19;
    uint64_t v85 = (uint64_t)v80 - v26;
    uint64_t v86 = v27;
    uint64_t v87 = v22;
    uint64_t v88 = v25;
    uint64_t v89 = v5;
    uint64_t v90 = a1;
    v80[0] = *(void *)(v1 + 64);
    __dst[0] = v80[0];
    __dst[1] = v28;
    uint64_t v29 = v28;
    sub_10014A85C();
    v80[1] = v29;
    swift_bridgeObjectRetain();
    uint64_t v30 = Text.init<A>(_:)();
    uint64_t v32 = v31;
    int v93 = v33 & 1;
    uint64_t v34 = static Font.subheadline.getter();
    uint64_t v35 = static Font.footnote.getter();
    uint64_t v36 = *(void *)(v1 + 112);
    char v37 = *(unsigned char *)(v1 + 120);
    sub_100195B7C(v36, v37);
    sub_100149AE8();
    char v39 = v38;
    sub_10018F6D8(v36, v37);
    sub_100BFB52C((uint64_t)v12);
    uint64_t v40 = type metadata accessor for Font.Leading();
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v12, 0, 1, v40);
    uint64_t v41 = v97;
    sub_10006DF38((uint64_t)v12, v97, &qword_100E6D330);
    swift_retain();
    swift_retain();
    sub_10014A8A8(v34, v35, v39 & 1, v41);
    LOBYTE(v41) = v93;
    uint64_t v42 = Text.font(_:)();
    uint64_t v92 = v43;
    int v91 = v44;
    uint64_t v97 = v1;
    uint64_t v46 = v45;
    swift_release();
    swift_release();
    swift_release();
    sub_100191924(v30, v32, v41);
    swift_bridgeObjectRelease();
    sub_100178110((uint64_t)v12, &qword_100E6D330);
    __dst[0] = v42;
    __dst[1] = v92;
    LOBYTE(__dst[2]) = v91 & 1;
    __dst[3] = v46;
    uint64_t v47 = v97;
    uint64_t v48 = v98;
    sub_100BFB294(v98);
    type metadata accessor for DynamicTypeSize();
    sub_100BFCB74(&qword_100E651F0, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
    uint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
    if (result)
    {
      sub_1001246C8((unint64_t *)&unk_100EAADB0, &qword_100E651D0);
      uint64_t v50 = v95;
      View.dynamicTypeSize<A>(_:)();
      sub_100178110(v48, &qword_100E651D0);
      sub_100191924(__dst[0], __dst[1], __dst[2]);
      swift_bridgeObjectRelease();
      uint64_t v51 = *(void *)(v47 + 144);
      char v52 = *(unsigned char *)(v47 + 152);
      sub_100195B7C(v51, v52);
      sub_100149AE8();
      char v54 = v53;
      sub_10018F6D8(v51, v52);
      uint64_t v55 = v81;
      uint64_t v56 = (uint64_t)v96;
      uint64_t v57 = v82;
      (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v96, v50, v82);
      uint64_t v58 = (unsigned char *)(v56 + *(int *)(v94 + 36));
      *uint64_t v58 = 0;
      v58[1] = v54 & 1;
      (*(void (**)(char *, uint64_t))(v55 + 8))(v50, v57);
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v60 = (uint64_t)v84;
      sub_10006DF38(v56, (uint64_t)v84, &qword_100EB8AD0);
      uint64_t v61 = v60 + *(int *)(v83 + 36);
      *(void *)uint64_t v61 = KeyPath;
      *(unsigned char *)(v61 + 8) = 0;
      sub_100178110(v56, &qword_100EB8AD0);
      memcpy(__dst, (const void *)v47, sizeof(__dst));
      sub_10079F91C((uint64_t)v89);
      uint64_t v62 = Text.init(_:)();
      uint64_t v64 = v63;
      LOBYTE(v50) = v65 & 1;
      sub_100BFC84C();
      uint64_t v66 = (uint64_t)v87;
      View.accessibilityLabel(_:)();
      sub_100191924(v62, v64, (char)v50);
      swift_bridgeObjectRelease();
      sub_100178110(v60, &qword_100EB8AD8);
      int v67 = *(unsigned __int8 *)(v47 + 96);
      uint64_t v68 = *(void *)(v47 + 112);
      LOBYTE(v55) = *(unsigned char *)(v47 + 120);
      sub_100195B7C(v68, v55);
      sub_100149AE8();
      char v70 = v69;
      sub_10018F6D8(v68, v55);
      uint64_t v71 = 2;
      if (v70) {
        uint64_t v71 = 3;
      }
      if (v67) {
        uint64_t v72 = v71;
      }
      else {
        uint64_t v72 = 4;
      }
      uint64_t v73 = swift_getKeyPath();
      uint64_t v74 = v86;
      sub_10006DF38(v66, v86, &qword_100EB8AE0);
      uint64_t v75 = v88;
      uint64_t v76 = v74 + *(int *)(v88 + 36);
      *(void *)uint64_t v76 = v73;
      *(void *)(v76 + 8) = v72;
      *(unsigned char *)(v76 + 16) = 0;
      sub_100178110(v66, &qword_100EB8AE0);
      uint64_t v77 = v85;
      sub_10020E72C(v74, v85, &qword_100EB8AE8);
      uint64_t v78 = v77;
      uint64_t v79 = v90;
      sub_10020E72C(v78, v90, &qword_100EB8AE8);
      return _s7Weather24LocationCompositionStateOwst_0(v79, 0, 1, v75);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    return _s7Weather24LocationCompositionStateOwst_0(a1, 1, 1, v25);
  }
  return result;
}

uint64_t sub_100BFA718@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, unsigned char *a3@<X8>)
{
  uint64_t v110 = a2;
  v115 = a3;
  uint64_t v4 = type metadata accessor for _BlendModeEffect();
  __chkstk_darwin(v4 - 8);
  uint64_t v107 = &v90[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = type metadata accessor for AirQualityComponentView();
  __chkstk_darwin(v6 - 8);
  v101 = &v90[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v105 = type metadata accessor for BlendMode();
  uint64_t v104 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  v103 = &v90[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v102 = sub_10017DF08(&qword_100E63F78);
  __chkstk_darwin(v102);
  char v106 = &v90[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v108 = sub_10017DF08(&qword_100EB8AA8);
  __chkstk_darwin(v108);
  uint64_t v109 = &v90[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v113 = sub_10017DF08(&qword_100EB8AB0);
  uint64_t v99 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  uint64_t v98 = &v90[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v12);
  uint64_t v97 = &v90[-v13];
  uint64_t v14 = sub_10017DF08(&qword_100EB8AB8);
  __chkstk_darwin(v14 - 8);
  v114 = &v90[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v16);
  v112 = &v90[-v17];
  uint64_t v116 = sub_10017DF08(&qword_100E651D0);
  __chkstk_darwin(v116);
  uint64_t v19 = &v90[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v119 = sub_10017DF08(&qword_100E863B0);
  uint64_t v118 = *(void *)(v119 - 8);
  __chkstk_darwin(v119);
  uint64_t v21 = &v90[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v22);
  v117 = &v90[-v23];
  memcpy(__dst, (const void *)a1, sizeof(__dst));
  uint64_t v120 = a1;
  uint64_t v24 = *(void *)(a1 + 144);
  char v25 = *(unsigned char *)(a1 + 152);
  sub_100195B7C(v24, v25);
  sub_100149AE8();
  char v27 = v26;
  sub_10018F6D8(v24, v25);
  v123[0] = sub_10079F3F0(v27 & 1);
  v123[1] = v28;
  unint64_t v100 = sub_10014A85C();
  uint64_t v29 = Text.init<A>(_:)();
  uint64_t v31 = v30;
  char v33 = v32 & 1;
  uint64_t v34 = Text.font(_:)();
  uint64_t v36 = v35;
  char v38 = v37;
  uint64_t v40 = v39;
  sub_100191924(v29, v31, v33);
  swift_bridgeObjectRelease();
  v123[0] = v34;
  v123[1] = v36;
  char v41 = v38 & 1;
  uint64_t v42 = v120;
  LOBYTE(v123[2]) = v41;
  v123[3] = v40;
  sub_100BFB294((uint64_t)v19);
  uint64_t v43 = type metadata accessor for DynamicTypeSize();
  uint64_t v44 = sub_100BFCB74(&qword_100E651F0, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
  if ((result & 1) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v96 = v44;
  uint64_t v95 = sub_1001246C8((unint64_t *)&unk_100EAADB0, &qword_100E651D0);
  View.dynamicTypeSize<A>(_:)();
  sub_100178110((uint64_t)v19, &qword_100E651D0);
  sub_100191924(v123[0], v123[1], v123[2]);
  swift_bridgeObjectRelease();
  uint64_t v46 = v118;
  uint64_t v47 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v118 + 32);
  uint64_t v48 = v117;
  uint64_t v111 = v21;
  uint64_t v49 = v119;
  v47(v117, v21, v119);
  memcpy(v123, (const void *)v42, sizeof(v123));
  uint64_t v50 = *(void *)(v42 + 144);
  char v51 = *(unsigned char *)(v42 + 152);
  sub_100195B7C(v50, v51);
  sub_100149AE8();
  char v53 = v52;
  sub_10018F6D8(v50, v51);
  uint64_t v54 = sub_10079F5BC(v53 & 1);
  if (!v55)
  {
    uint64_t v61 = 1;
    uint64_t v62 = v113;
    uint64_t v63 = (uint64_t)v112;
    uint64_t v64 = v111;
LABEL_11:
    _s7Weather24LocationCompositionStateOwst_0(v63, v61, 1, v62);
    uint64_t v85 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v46 + 16);
    v85(v64, v48, v49);
    uint64_t v86 = v114;
    sub_10006DF38(v63, (uint64_t)v114, &qword_100EB8AB8);
    uint64_t v87 = v115;
    v85(v115, v64, v49);
    uint64_t v88 = sub_10017DF08(&qword_100EB8AC0);
    sub_10006DF38((uint64_t)v86, (uint64_t)&v87[*(int *)(v88 + 48)], &qword_100EB8AB8);
    sub_100178110(v63, &qword_100EB8AB8);
    uint64_t v89 = *(void (**)(unsigned char *, uint64_t))(v46 + 8);
    v89(v48, v49);
    sub_100178110((uint64_t)v86, &qword_100EB8AB8);
    return ((uint64_t (*)(unsigned char *, uint64_t))v89)(v64, v49);
  }
  char v56 = v123[12];
  uint64_t v121 = v54;
  uint64_t v122 = v55;
  uint64_t v93 = Text.init<A>(_:)();
  uint64_t v92 = v57;
  int v91 = v58;
  unint64_t v100 = v59;
  uint64_t v60 = v101;
  sub_100BFC748(v42, (uint64_t)v101, (void (*)(void))type metadata accessor for AirQualityComponentView);
  uint64_t v94 = v43;
  if (v56)
  {
    uint64_t v65 = *((void *)v60 + 14);
    char v66 = v60[120];
    sub_100195B7C(v65, v66);
    sub_100149AE8();
    char v68 = v67;
    sub_10018F6D8(v65, v66);
    sub_10014D078((uint64_t)v60, (void (*)(void))type metadata accessor for AirQualityComponentView);
    if (v68)
    {
      char v69 = (unsigned int *)&enum case for BlendMode.plusLighter(_:);
      goto LABEL_9;
    }
  }
  else
  {
    sub_10014D078((uint64_t)v60, (void (*)(void))type metadata accessor for AirQualityComponentView);
  }
  char v69 = (unsigned int *)&enum case for BlendMode.normal(_:);
LABEL_9:
  uint64_t v70 = v104;
  uint64_t v71 = v103;
  uint64_t v72 = v105;
  (*(void (**)(unsigned char *, void, uint64_t))(v104 + 104))(v103, *v69, v105);
  uint64_t v73 = (uint64_t)v107;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v70 + 16))(v107, v71, v72);
  uint64_t v74 = (uint64_t)v106;
  sub_100BFC748(v73, (uint64_t)&v106[*(int *)(v102 + 36)], (void (*)(void))&type metadata accessor for _BlendModeEffect);
  uint64_t v75 = v93;
  uint64_t v76 = v92;
  *(void *)uint64_t v74 = v93;
  *(void *)(v74 + 8) = v76;
  char v77 = v91 & 1;
  *(unsigned char *)(v74 + 16) = v91 & 1;
  *(void *)(v74 + 24) = v100;
  sub_100190CC4(v75, v76, v77);
  swift_bridgeObjectRetain();
  sub_10014D078(v73, (void (*)(void))&type metadata accessor for _BlendModeEffect);
  (*(void (**)(unsigned char *, uint64_t))(v70 + 8))(v71, v72);
  sub_100191924(v75, v76, v77);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v79 = v109;
  sub_10006DF38(v74, (uint64_t)v109, &qword_100E63F78);
  uint64_t v80 = (uint64_t *)&v79[*(int *)(v108 + 36)];
  uint64_t v81 = v110;
  uint64_t *v80 = KeyPath;
  v80[1] = v81;
  swift_retain();
  sub_100178110(v74, &qword_100E63F78);
  sub_100BFB294((uint64_t)v19);
  uint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v64 = v111;
  if (result)
  {
    sub_100BFC7A4();
    uint64_t v82 = v98;
    View.dynamicTypeSize<A>(_:)();
    sub_100178110((uint64_t)v19, &qword_100E651D0);
    sub_100178110((uint64_t)v79, &qword_100EB8AA8);
    uint64_t v83 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v99 + 32);
    uint64_t v84 = v97;
    uint64_t v62 = v113;
    v83(v97, v82, v113);
    uint64_t v63 = (uint64_t)v112;
    v83(v112, v84, v62);
    uint64_t v61 = 0;
    uint64_t v49 = v119;
    uint64_t v46 = v118;
    uint64_t v48 = v117;
    goto LABEL_11;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_100BFB294@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v2 = type metadata accessor for ContentSizeCategory();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = type metadata accessor for AirQualityComponentView();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v1 + *(int *)(v12 + 36);
  uint64_t v14 = *(void *)v13;
  char v15 = *(unsigned char *)(v13 + 8);
  sub_100195B7C(*(void *)v13, v15);
  sub_1005D1EBC();
  int v17 = v16;
  sub_10018F6D8(v14, v15);
  sub_100BFC748(v1, (uint64_t)v11, (void (*)(void))type metadata accessor for AirQualityComponentView);
  if (v17 != 1)
  {
    sub_10014D078((uint64_t)v11, (void (*)(void))type metadata accessor for AirQualityComponentView);
    uint64_t v20 = v26;
    goto LABEL_5;
  }
  sub_10014E6E8();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for ContentSizeCategory.medium(_:), v2);
  BOOL v18 = sub_1007DE734((uint64_t)v8, (uint64_t)v5);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v3 + 8);
  v19(v5, v2);
  v19(v8, v2);
  sub_10014D078((uint64_t)v11, (void (*)(void))type metadata accessor for AirQualityComponentView);
  uint64_t v20 = v26;
  if (!v18)
  {
LABEL_5:
    uint64_t v21 = (unsigned int *)&enum case for DynamicTypeSize.accessibility5(_:);
    goto LABEL_6;
  }
  uint64_t v21 = (unsigned int *)&enum case for DynamicTypeSize.xLarge(_:);
LABEL_6:
  uint64_t v22 = *v21;
  uint64_t v23 = type metadata accessor for DynamicTypeSize();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 104))(v20, v22, v23);
}

uint64_t sub_100BFB52C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Locale.Language();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v25[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_10017DF08(&qword_100E63DC0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = &v25[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for Locale();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v25[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static Locale.languageIdentifier.getter();
  Locale.init(identifier:)();
  sub_10017DF08(&qword_100E63D90);
  inited = (_OWORD *)swift_initStackObject();
  inited[1] = xmmword_100C31870;
  inited[2] = xmmword_100C83490;
  inited[3] = xmmword_100C834A0;
  inited[4] = xmmword_100C834B0;
  inited[5] = xmmword_100C834C0;
  Locale.language.getter();
  Locale.Language.languageCode.getter();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v14 = type metadata accessor for Locale.LanguageCode();
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v8, 1, v14) == 1)
  {
    sub_100178110((uint64_t)v8, &qword_100E63DC0);
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v15 = Locale.LanguageCode.identifier.getter();
    uint64_t v16 = v17;
    (*(void (**)(unsigned char *, uint64_t))(*(void *)(v14 - 8) + 8))(v8, v14);
  }
  uint64_t v18 = *((void *)inited + 2);
  if (!v18)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_1006BB148();
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
    uint64_t v21 = (unsigned int *)&enum case for Font.Leading.tight(_:);
    goto LABEL_19;
  }
  uint64_t v19 = (void *)inited + 5;
  while (!*v19)
  {
    if (!v16) {
      goto LABEL_18;
    }
LABEL_15:
    v19 += 2;
    if (!--v18) {
      goto LABEL_16;
    }
  }
  if (!v16) {
    goto LABEL_15;
  }
  BOOL v20 = *(v19 - 1) == v15 && *v19 == v16;
  if (!v20 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
LABEL_18:
  swift_setDeallocating();
  sub_1006BB148();
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v21 = (unsigned int *)&enum case for Font.Leading.standard(_:);
LABEL_19:
  uint64_t v22 = *v21;
  uint64_t v23 = type metadata accessor for Font.Leading();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 104))(a1, v22, v23);
}

BOOL sub_100BFB8B8()
{
  sub_10019C26C();
  EnvironmentValues.subscript.getter();
  return (v1 & 7) == 0;
}

uint64_t sub_100BFB8FC(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v20 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    uint64_t v7 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v7;
    uint64_t v8 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v8;
    uint64_t v9 = a2[10];
    *(void *)(a1 + 72) = a2[9];
    *(void *)(a1 + 80) = v9;
    *(void *)(a1 + 88) = a2[11];
    *(_WORD *)(a1 + 96) = *((_WORD *)a2 + 48);
    uint64_t v10 = a2[14];
    *(void *)(a1 + 104) = a2[13];
    char v11 = *((unsigned char *)a2 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100195B7C(v10, v11);
    *(void *)(v4 + 112) = v10;
    *(unsigned char *)(v4 + 120) = v11;
    uint64_t v12 = a2[16];
    char v13 = *((unsigned char *)a2 + 136);
    sub_100195B7C(v12, v13);
    *(void *)(v4 + 128) = v12;
    *(unsigned char *)(v4 + 136) = v13;
    uint64_t v14 = a2[18];
    char v15 = *((unsigned char *)a2 + 152);
    sub_100195B7C(v14, v15);
    *(void *)(v4 + 144) = v14;
    *(unsigned char *)(v4 + 152) = v15;
    uint64_t v16 = a3[8];
    uint64_t v17 = (void *)(v4 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    sub_10017DF08(&qword_100E63BC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = type metadata accessor for ContentSizeCategory();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *uint64_t v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v21 = a3[9];
    uint64_t v22 = v4 + v21;
    uint64_t v23 = (uint64_t)a2 + v21;
    uint64_t v24 = *(void *)v23;
    char v25 = *(unsigned char *)(v23 + 8);
    sub_100195B7C(*(void *)v23, v25);
    *(void *)uint64_t v22 = v24;
    *(unsigned char *)(v22 + 8) = v25;
    uint64_t v26 = a3[10];
    uint64_t v27 = v4 + v26;
    uint64_t v28 = (uint64_t)a2 + v26;
    uint64_t v29 = sub_10017DF08(&qword_100E7DDF0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
  }
  return v4;
}

uint64_t sub_100BFBB58(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10018F6D8(*(void *)(a1 + 112), *(unsigned char *)(a1 + 120));
  sub_10018F6D8(*(void *)(a1 + 128), *(unsigned char *)(a1 + 136));
  sub_10018F6D8(*(void *)(a1 + 144), *(unsigned char *)(a1 + 152));
  uint64_t v4 = a1 + a2[8];
  sub_10017DF08(&qword_100E63BC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for ContentSizeCategory();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  sub_10018F6D8(*(void *)(a1 + a2[9]), *(unsigned char *)(a1 + a2[9] + 8));
  uint64_t v6 = a1 + a2[10];
  uint64_t v7 = sub_10017DF08(&qword_100E7DDF0);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

uint64_t sub_100BFBCA0(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(_WORD *)(a1 + 96) = *(_WORD *)(a2 + 96);
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  char v10 = *(unsigned char *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100195B7C(v9, v10);
  *(void *)(a1 + 112) = v9;
  *(unsigned char *)(a1 + 120) = v10;
  uint64_t v11 = *(void *)(a2 + 128);
  char v12 = *(unsigned char *)(a2 + 136);
  sub_100195B7C(v11, v12);
  *(void *)(a1 + 128) = v11;
  *(unsigned char *)(a1 + 136) = v12;
  uint64_t v13 = *(void *)(a2 + 144);
  char v14 = *(unsigned char *)(a2 + 152);
  sub_100195B7C(v13, v14);
  *(void *)(a1 + 144) = v13;
  *(unsigned char *)(a1 + 152) = v14;
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  sub_10017DF08(&qword_100E63BC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = type metadata accessor for ContentSizeCategory();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    *uint64_t v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = a3[9];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = *(void *)v21;
  char v23 = *(unsigned char *)(v21 + 8);
  sub_100195B7C(*(void *)v21, v23);
  *(void *)uint64_t v20 = v22;
  *(unsigned char *)(v20 + 8) = v23;
  uint64_t v24 = a3[10];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = sub_10017DF08(&qword_100E7DDF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  return a1;
}

uint64_t sub_100BFBEAC(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 112);
  char v7 = *(unsigned char *)(a2 + 120);
  sub_100195B7C(v6, v7);
  uint64_t v8 = *(void *)(a1 + 112);
  char v9 = *(unsigned char *)(a1 + 120);
  *(void *)(a1 + 112) = v6;
  *(unsigned char *)(a1 + 120) = v7;
  sub_10018F6D8(v8, v9);
  uint64_t v10 = *(void *)(a2 + 128);
  char v11 = *(unsigned char *)(a2 + 136);
  sub_100195B7C(v10, v11);
  uint64_t v12 = *(void *)(a1 + 128);
  char v13 = *(unsigned char *)(a1 + 136);
  *(void *)(a1 + 128) = v10;
  *(unsigned char *)(a1 + 136) = v11;
  sub_10018F6D8(v12, v13);
  uint64_t v14 = *(void *)(a2 + 144);
  char v15 = *(unsigned char *)(a2 + 152);
  sub_100195B7C(v14, v15);
  uint64_t v16 = *(void *)(a1 + 144);
  char v17 = *(unsigned char *)(a1 + 152);
  *(void *)(a1 + 144) = v14;
  *(unsigned char *)(a1 + 152) = v15;
  sub_10018F6D8(v16, v17);
  if (a1 != a2)
  {
    uint64_t v18 = a3[8];
    uint64_t v19 = (void *)(a1 + v18);
    uint64_t v20 = (void *)(a2 + v18);
    sub_100178110(a1 + v18, &qword_100E63BC8);
    sub_10017DF08(&qword_100E63BC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = type metadata accessor for ContentSizeCategory();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    }
    else
    {
      *uint64_t v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v22 = a3[9];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  uint64_t v25 = *(void *)v24;
  char v26 = *(unsigned char *)(v24 + 8);
  sub_100195B7C(*(void *)v24, v26);
  uint64_t v27 = *(void *)v23;
  char v28 = *(unsigned char *)(v23 + 8);
  *(void *)uint64_t v23 = v25;
  *(unsigned char *)(v23 + 8) = v26;
  sub_10018F6D8(v27, v28);
  uint64_t v29 = a3[10];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  uint64_t v32 = sub_10017DF08(&qword_100E7DDF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 24))(v30, v31, v32);
  return a1;
}

uint64_t sub_100BFC150(uint64_t a1, uint64_t a2, int *a3)
{
  memcpy((void *)a1, (const void *)a2, 0x70uLL);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  uint64_t v6 = a3[8];
  char v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_10017DF08(&qword_100E63BC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = type metadata accessor for ContentSizeCategory();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[9];
  uint64_t v12 = a3[10];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  uint64_t v15 = a1 + v12;
  uint64_t v16 = a2 + v12;
  uint64_t v17 = sub_10017DF08(&qword_100E7DDF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

uint64_t sub_100BFC2C8(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  char v10 = *(unsigned char *)(a2 + 120);
  uint64_t v11 = *(void *)(a1 + 112);
  char v12 = *(unsigned char *)(a1 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = v10;
  sub_10018F6D8(v11, v12);
  char v13 = *(unsigned char *)(a2 + 136);
  uint64_t v14 = *(void *)(a1 + 128);
  char v15 = *(unsigned char *)(a1 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(unsigned char *)(a1 + 136) = v13;
  sub_10018F6D8(v14, v15);
  char v16 = *(unsigned char *)(a2 + 152);
  uint64_t v17 = *(void *)(a1 + 144);
  char v18 = *(unsigned char *)(a1 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(unsigned char *)(a1 + 152) = v16;
  sub_10018F6D8(v17, v18);
  if (a1 != a2)
  {
    uint64_t v19 = a3[8];
    uint64_t v20 = (void *)(a1 + v19);
    uint64_t v21 = (const void *)(a2 + v19);
    sub_100178110(a1 + v19, &qword_100E63BC8);
    uint64_t v22 = sub_10017DF08(&qword_100E63BC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = type metadata accessor for ContentSizeCategory();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v23 - 8) + 32))(v20, v21, v23);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
  }
  uint64_t v24 = a3[9];
  uint64_t v25 = a1 + v24;
  char v26 = (uint64_t *)(a2 + v24);
  uint64_t v27 = *v26;
  LOBYTE(v26) = *((unsigned char *)v26 + 8);
  uint64_t v28 = *(void *)v25;
  char v29 = *(unsigned char *)(v25 + 8);
  *(void *)uint64_t v25 = v27;
  *(unsigned char *)(v25 + 8) = (_BYTE)v26;
  sub_10018F6D8(v28, v29);
  uint64_t v30 = a3[10];
  uint64_t v31 = a1 + v30;
  uint64_t v32 = a2 + v30;
  uint64_t v33 = sub_10017DF08(&qword_100E7DDF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 40))(v31, v32, v33);
  return a1;
}

uint64_t sub_100BFC4FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100BFC510);
}

uint64_t sub_100BFC510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    sub_10017DF08((uint64_t *)&unk_100EAA530);
    sub_100162F30();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 32);
    }
    else
    {
      uint64_t v10 = sub_10017DF08(&qword_100E7DDF0);
      uint64_t v11 = *(int *)(a3 + 40);
    }
    return _s7Weather24LocationCompositionStateOwet_0(a1 + v11, a2, v10);
  }
}

uint64_t sub_100BFC5C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100BFC5D8);
}

uint64_t sub_100BFC5D8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 40) = (a2 - 1);
  }
  else
  {
    sub_10017DF08((uint64_t *)&unk_100EAA530);
    sub_100162F30();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 32);
    }
    else
    {
      uint64_t v10 = sub_10017DF08(&qword_100E7DDF0);
      uint64_t v11 = *(int *)(a4 + 40);
    }
    return _s7Weather24LocationCompositionStateOwst_0(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_100BFC688()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100BFC6A8()
{
  unint64_t result = qword_100EB8A40;
  if (!qword_100EB8A40)
  {
    sub_10018C6DC(&qword_100EB8A28);
    sub_1001246C8(&qword_100EB8A48, &qword_100EB8A20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8A40);
  }
  return result;
}

uint64_t sub_100BFC748(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100162E4C();
  uint64_t v4 = sub_10011BFA4();
  v5(v4);
  return a2;
}

unint64_t sub_100BFC7A4()
{
  unint64_t result = qword_100EB8AC8;
  if (!qword_100EB8AC8)
  {
    sub_10018C6DC(&qword_100EB8AA8);
    sub_1004486BC();
    sub_1001246C8(&qword_100E65218, &qword_100E65220);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8AC8);
  }
  return result;
}

unint64_t sub_100BFC84C()
{
  unint64_t result = qword_100EB8AF0;
  if (!qword_100EB8AF0)
  {
    sub_10018C6DC(&qword_100EB8AD8);
    sub_100BFC8EC();
    sub_1001246C8(&qword_100E77CF0, &qword_100E77CF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8AF0);
  }
  return result;
}

unint64_t sub_100BFC8EC()
{
  unint64_t result = qword_100EB8AF8;
  if (!qword_100EB8AF8)
  {
    sub_10018C6DC(&qword_100EB8AD0);
    sub_10018C6DC(&qword_100E651D0);
    sub_1001246C8((unint64_t *)&unk_100EAADB0, &qword_100E651D0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8AF8);
  }
  return result;
}

unint64_t sub_100BFC9E8()
{
  unint64_t result = qword_100EB8B10;
  if (!qword_100EB8B10)
  {
    sub_10018C6DC(&qword_100E7A0F8);
    sub_100BFCA94();
    sub_100BFCB74((unint64_t *)&qword_100E66BF8, (void (*)(uint64_t))type metadata accessor for AutomationInfoViewModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8B10);
  }
  return result;
}

unint64_t sub_100BFCA94()
{
  unint64_t result = qword_100EB8B18;
  if (!qword_100EB8B18)
  {
    sub_10018C6DC(&qword_100E7A0F0);
    sub_10018C6DC(&qword_100EB8A28);
    sub_100BFC6A8();
    swift_getOpaqueTypeConformance2();
    sub_100BFCB74((unint64_t *)&qword_100EAACA0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8B18);
  }
  return result;
}

uint64_t sub_100BFCB74(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100BFCBBC(uint64_t a1)
{
  uint64_t v2 = v1;
  type metadata accessor for PreviewLocation();
  sub_100162E4C();
  __chkstk_darwin(v4);
  sub_1001626E0();
  uint64_t v7 = v6 - v5;
  sub_10056D9DC(a1, v6 - v5);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  sub_100159340(v7, (void (*)(void))type metadata accessor for PreviewLocation);
  if (EnumCaseMultiPayload == 2)
  {
    sub_1001B1E64((void *)(v2 + 200), *(void *)(v2 + 224));
    sub_100478FBC();
  }
  return sub_100BFCC88(a1);
}

uint64_t sub_100BFCC88(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SearchLocation();
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (void **)((char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for LocationOfInterest();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Location();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  char v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for PreviewLocation();
  __chkstk_darwin(v13);
  char v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10056D9DC(a1, (uint64_t)v15);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v15, v5);
      LocationOfInterest.location.getter();
      sub_100A41D0C((uint64_t)v12, 0, v23, v24, v25, v26, v27, v28, v39, (uint64_t)v40, v41, v42, v43, v44, v45, v46, v47, v48, v49,
        v50);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      break;
    case 2u:
      sub_100477D6C((uint64_t)v15, (uint64_t)v4);
      char v29 = *v4;
      if (*v4)
      {
        sub_1001B1E64(v40 + 14, v40[17]);
        id v30 = v29;
        id v31 = [v30 w_calloutTitle];
        uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v34 = v33;

        LocalSearchRequestManager.performLocalSearch(with:calloutTitle:)(v30, v32, v34);
        swift_bridgeObjectRelease();
        sub_100BFD714();

        swift_release();
      }
      uint64_t result = sub_100159340((uint64_t)v4, (void (*)(void))type metadata accessor for SearchLocation);
      break;
    case 3u:
      uint64_t v35 = *((void *)v15 + 2);
      uint64_t v36 = *((void *)v15 + 3);
      sub_1001B1E64(v40 + 9, v40[12]);
      dispatch thunk of GeocodeManagerType.reverseGeocode(coordinate:)();
      uint64_t v37 = swift_allocObject();
      *(void *)(v37 + 16) = v35;
      *(void *)(v37 + 24) = v36;
      char v38 = (void *)zalgo.getter();
      Promise.then<A>(on:closure:)();
      swift_release();
      swift_release();

      sub_100BFD714();
      uint64_t result = swift_release();
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
      sub_100A41D0C((uint64_t)v12, 0, v16, v17, v18, v19, v20, v21, v39, (uint64_t)v40, v41, v42, v43, v44, v45, v46, v47, v48, v49,
        v50);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      break;
  }
  return result;
}

uint64_t sub_100BFD0C8()
{
  sub_1001B1E64((void *)(v0 + 200), *(void *)(v0 + 224));
  sub_10081B8DC();
  sub_100478FEC();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100BFD128(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10017DF08(&qword_100E639E8);
  __chkstk_darwin(v6 - 8);
  sub_1001626E0();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for Location();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_1001626E0();
  uint64_t v14 = v13 - v12;
  type metadata accessor for PreviewLocation();
  sub_100162E4C();
  __chkstk_darwin(v15);
  sub_1001626E0();
  uint64_t v18 = v17 - v16;
  sub_10056D9DC(a1, v17 - v16);
  LODWORD(a1) = swift_getEnumCaseMultiPayload();
  sub_100159340(v18, (void (*)(void))type metadata accessor for PreviewLocation);
  if (a1 == 2)
  {
    sub_10081B708(v9);
    if (_s7Weather24LocationCompositionStateOwet_0(v9, 1, v10) == 1)
    {
      sub_1001781AC(v9, &qword_100E639E8);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v14, v9, v10);
      uint64_t v19 = sub_1001B1E64((void *)(v3 + 200), *(void *)(v3 + 224));
      Location.id.getter();
      if (*(void *)(*v19 + 24)) {
        sub_100A31B44();
      }
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v10);
    }
  }
  return sub_100BFCC88(a2);
}

uint64_t sub_100BFD354()
{
  type metadata accessor for MainAction();
  sub_100162E4C();
  __chkstk_darwin(v1);
  sub_10019F9BC();
  swift_storeEnumTagMultiPayload();
  type metadata accessor for ModalViewAction();
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  sub_10017B1A4();
  sub_100180D1C();
  sub_1001781AC((uint64_t)v3, (uint64_t *)&unk_100EA01F0);
  sub_100159340(v0, (void (*)(void))type metadata accessor for MainAction);
  return swift_release();
}

uint64_t sub_100BFD430(uint64_t a1, char a2)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v2 + 16);
  sub_10017DF08(&qword_100E63480);
  uint64_t v6 = *(void *)(type metadata accessor for MainAction() - 8);
  uint64_t v7 = *(void *)(v6 + 72);
  unint64_t v8 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100C25ED0;
  unint64_t v10 = v9 + v8;
  uint64_t v11 = *(int *)(sub_10017DF08(&qword_100E6F628) + 48);
  type metadata accessor for Location();
  sub_100162E4C();
  (*(void (**)(unint64_t, uint64_t))(v12 + 16))(v10, a1);
  *(unsigned char *)(v10 + v11) = a2;
  type metadata accessor for LocationsAction();
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  *(unsigned char *)(v10 + v7) = a2;
  type metadata accessor for LocationPreviewViewAction();
  swift_storeEnumTagMultiPayload();
  type metadata accessor for ModalViewAction();
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  sub_1001AB0B0((uint64_t)v17, (uint64_t)v14);
  uint64_t v15 = v9;
  char v16 = 0;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1001AB2DC((uint64_t)v14, v5);
  sub_1001781AC((uint64_t)v14, &qword_100E63488);
  swift_bridgeObjectRelease();
  sub_1001781AC((uint64_t)v17, (uint64_t *)&unk_100EA01F0);
  return swift_release();
}

uint64_t sub_100BFD638()
{
  type metadata accessor for MainAction();
  sub_100162E4C();
  __chkstk_darwin(v1);
  sub_10019F9BC();
  swift_storeEnumTagMultiPayload();
  type metadata accessor for ModalViewAction();
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  sub_10017B1A4();
  sub_100180D1C();
  sub_1001781AC((uint64_t)v3, (uint64_t *)&unk_100EA01F0);
  sub_100159340(v0, (void (*)(void))type metadata accessor for MainAction);
  return swift_release();
}

void sub_100BFD714()
{
  type metadata accessor for Location();
  firstly<A>(closure:)();
  sub_1001AB3E0();
  uint64_t v0 = (void *)static OS_dispatch_queue.main.getter();
  Promise.then<A, B>(on:disposeOn:closure:)();
  swift_release();

  id v1 = (id)zalgo.getter();
  Promise.error(on:closure:)();
  swift_release();
  swift_release();
}

uint64_t sub_100BFD840()
{
  uint64_t v0 = type metadata accessor for Location();
  __chkstk_darwin(v0 - 8);
  Location.preservingName(_:)();
  sub_10017DF08(&qword_100E965D0);
  swift_allocObject();
  return Promise.init(value:)();
}

uint64_t sub_100BFD900(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MainAction();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(uint64_t (**)(uint64_t))(a2 + 16);
  uint64_t v8 = type metadata accessor for Location();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6, a1, v8);
  type metadata accessor for LocationPreviewViewAction();
  swift_storeEnumTagMultiPayload();
  type metadata accessor for ModalViewAction();
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  swift_retain();
  sub_1001AAF58((uint64_t)v6, (uint64_t)v10, v7);
  sub_1001781AC((uint64_t)v10, (uint64_t *)&unk_100EA01F0);
  sub_100159340((uint64_t)v6, (void (*)(void))type metadata accessor for MainAction);
  return swift_release();
}

uint64_t sub_100BFDA6C()
{
  swift_release();
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v0 + 32);
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v0 + 72);
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v0 + 112);
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v0 + 152);
  swift_release();
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v0 + 200);
  return v0;
}

uint64_t sub_100BFDABC()
{
  sub_100BFDA6C();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LocationPreviewInteractor()
{
  return self;
}

uint64_t sub_100BFDB14()
{
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_100BFDB4C()
{
  return sub_100BFD840();
}

uint64_t sub_100BFDB68()
{
  return swift_retain();
}

uint64_t sub_100BFDB84(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x8000000100CC15B0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x6F4665726F666562 && a2 == 0xEC0000007265746FLL;
    if (v5 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6E6564646968 && a2 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_100BFDCE0(char a1)
{
  if (!a1) {
    return 0xD000000000000012;
  }
  if (a1 == 1) {
    return 0x6F4665726F666562;
  }
  return 0x6E6564646968;
}

uint64_t sub_100BFDD40(void *a1, char a2)
{
  sub_10017DF08(&qword_100EB8C30);
  sub_100179C0C();
  uint64_t v27 = v5;
  uint64_t v28 = v4;
  __chkstk_darwin(v4);
  sub_100109314();
  uint64_t v26 = v6;
  sub_10017DF08(&qword_100EB8C38);
  sub_100179C0C();
  uint64_t v24 = v8;
  uint64_t v25 = v7;
  __chkstk_darwin(v7);
  sub_1001626E0();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_10017DF08(&qword_100EB8C40);
  sub_100179C0C();
  uint64_t v23 = v13;
  __chkstk_darwin(v14);
  sub_1001626E0();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = sub_10017DF08(&qword_100EB8C48);
  sub_100179C0C();
  uint64_t v20 = v19;
  __chkstk_darwin(v21);
  sub_100125FF8();
  sub_1001B1E64(a1, a1[3]);
  sub_100BFE6C0();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (a2)
  {
    if (a2 == 1)
    {
      sub_100BFE758();
      sub_100178FC0();
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v11, v25);
    }
    else
    {
      sub_100BFE70C();
      sub_100178FC0();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    }
  }
  else
  {
    sub_100BFE7A4();
    sub_100178FC0();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v17, v12);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8))(v2, v18);
}

char *sub_100BFDFBC(void *a1)
{
  uint64_t v36 = sub_10017DF08(&qword_100EB8BF0);
  sub_100179C0C();
  uint64_t v39 = v3;
  __chkstk_darwin(v4);
  sub_100109314();
  uint64_t v41 = v5;
  sub_10017DF08(&qword_100EB8BF8);
  sub_100179C0C();
  uint64_t v37 = v7;
  uint64_t v38 = v6;
  __chkstk_darwin(v6);
  sub_1001626E0();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_10017DF08(&qword_100EB8C00);
  sub_100179C0C();
  uint64_t v35 = v12;
  __chkstk_darwin(v13);
  sub_100125FF8();
  uint64_t v14 = sub_10017DF08(&qword_100EB8C08);
  sub_100179C0C();
  uint64_t v40 = v15;
  __chkstk_darwin(v16);
  sub_1001626E0();
  uint64_t v19 = (char *)(v18 - v17);
  sub_1001B1E64(a1, a1[3]);
  sub_100BFE6C0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v42) {
    goto LABEL_9;
  }
  uint64_t v43 = (uint64_t)a1;
  uint64_t v20 = KeyedDecodingContainer.allKeys.getter();
  uint64_t v21 = *(void *)(v20 + 16);
  if (!v21
    || (uint64_t v22 = v19,
        uint64_t v19 = (char *)*(unsigned __int8 *)(v20 + 32),
        sub_100723214(1, v21, v20, v20 + 32, 0, (2 * v21) | 1),
        uint64_t v24 = v23,
        unint64_t v26 = v25,
        swift_bridgeObjectRelease(),
        v24 != v26 >> 1))
  {
    uint64_t v27 = type metadata accessor for DecodingError();
    swift_allocError();
    char v29 = v28;
    uint64_t v19 = (char *)v28 + *(int *)(sub_10017DF08(&qword_100E67280) + 48);
    *char v29 = &type metadata for ReportWeatherTipPlacement;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v27 - 8) + 104))(v29, enum case for DecodingError.typeMismatch(_:), v27);
    swift_willThrow();
    swift_unknownObjectRelease();
    uint64_t v30 = sub_100179EA4();
    v31(v30);
    a1 = (void *)v43;
LABEL_9:
    _s7Weather29UVIDescriptorViewModelFactoryVwxx_0((uint64_t)a1);
    return v19;
  }
  if (v19)
  {
    if (v19 == 1)
    {
      sub_100BFE758();
      sub_10018519C();
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v10, v38);
    }
    else
    {
      sub_100BFE70C();
      sub_10018519C();
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v36);
    }
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v22, v14);
  }
  else
  {
    sub_100BFE7A4();
    sub_10018519C();
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v1, v11);
    swift_unknownObjectRelease();
    uint64_t v33 = sub_100179EA4();
    v34(v33);
  }
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v43);
  return v19;
}

uint64_t sub_100BFE468(uint64_t a1)
{
  unint64_t v2 = sub_100BFE7A4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100BFE4A4(uint64_t a1)
{
  unint64_t v2 = sub_100BFE7A4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100BFE4E0(uint64_t a1)
{
  unint64_t v2 = sub_100BFE758();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100BFE51C(uint64_t a1)
{
  unint64_t v2 = sub_100BFE758();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100BFE558()
{
  return sub_100BFDCE0(*v0);
}

uint64_t sub_100BFE560@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100BFDB84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100BFE588(uint64_t a1)
{
  unint64_t v2 = sub_100BFE6C0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100BFE5C4(uint64_t a1)
{
  unint64_t v2 = sub_100BFE6C0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100BFE600(uint64_t a1)
{
  unint64_t v2 = sub_100BFE70C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100BFE63C(uint64_t a1)
{
  unint64_t v2 = sub_100BFE70C();

  return CodingKey.debugDescription.getter(a1, v2);
}

char *sub_100BFE678@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100BFDFBC(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_100BFE6A4(void *a1)
{
  return sub_100BFDD40(a1, *v1);
}

unint64_t sub_100BFE6C0()
{
  unint64_t result = qword_100EB8C10;
  if (!qword_100EB8C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C10);
  }
  return result;
}

unint64_t sub_100BFE70C()
{
  unint64_t result = qword_100EB8C18;
  if (!qword_100EB8C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C18);
  }
  return result;
}

unint64_t sub_100BFE758()
{
  unint64_t result = qword_100EB8C20;
  if (!qword_100EB8C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C20);
  }
  return result;
}

unint64_t sub_100BFE7A4()
{
  unint64_t result = qword_100EB8C28;
  if (!qword_100EB8C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C28);
  }
  return result;
}

ValueMetadata *type metadata accessor for ReportWeatherTipPlacement.CodingKeys()
{
  return &type metadata for ReportWeatherTipPlacement.CodingKeys;
}

ValueMetadata *type metadata accessor for ReportWeatherTipPlacement.AfterDailyForecastCodingKeys()
{
  return &type metadata for ReportWeatherTipPlacement.AfterDailyForecastCodingKeys;
}

ValueMetadata *type metadata accessor for ReportWeatherTipPlacement.BeforeFooterCodingKeys()
{
  return &type metadata for ReportWeatherTipPlacement.BeforeFooterCodingKeys;
}

ValueMetadata *type metadata accessor for ReportWeatherTipPlacement.HiddenCodingKeys()
{
  return &type metadata for ReportWeatherTipPlacement.HiddenCodingKeys;
}

unsigned char *_s7Weather25ReportWeatherTipPlacementOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x100BFE900);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReportWeatherTipPlacement()
{
  return &type metadata for ReportWeatherTipPlacement;
}

unint64_t sub_100BFE93C()
{
  unint64_t result = qword_100EB8C50;
  if (!qword_100EB8C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C50);
  }
  return result;
}

unint64_t sub_100BFE98C()
{
  unint64_t result = qword_100EB8C58;
  if (!qword_100EB8C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C58);
  }
  return result;
}

unint64_t sub_100BFE9DC()
{
  unint64_t result = qword_100EB8C60;
  if (!qword_100EB8C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C60);
  }
  return result;
}

unint64_t sub_100BFEA2C()
{
  unint64_t result = qword_100EB8C68;
  if (!qword_100EB8C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C68);
  }
  return result;
}

unint64_t sub_100BFEA7C()
{
  unint64_t result = qword_100EB8C70;
  if (!qword_100EB8C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C70);
  }
  return result;
}

unint64_t sub_100BFEACC()
{
  unint64_t result = qword_100EB8C78;
  if (!qword_100EB8C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C78);
  }
  return result;
}

unint64_t sub_100BFEB1C()
{
  unint64_t result = qword_100EB8C80;
  if (!qword_100EB8C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C80);
  }
  return result;
}

unint64_t sub_100BFEB6C()
{
  unint64_t result = qword_100EB8C88;
  if (!qword_100EB8C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C88);
  }
  return result;
}

unint64_t sub_100BFEBBC()
{
  unint64_t result = qword_100EB8C90;
  if (!qword_100EB8C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C90);
  }
  return result;
}

unint64_t sub_100BFEC0C()
{
  unint64_t result = qword_100EB8C98;
  if (!qword_100EB8C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8C98);
  }
  return result;
}

ValueMetadata *type metadata accessor for AddLocationAlertState()
{
  return &type metadata for AddLocationAlertState;
}

uint64_t sub_100BFEC6C(char a1)
{
  if (a1) {
    return 0xD000000000000013;
  }
  else {
    return 0x6E6564646968;
  }
}

uint64_t sub_100BFECA4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6564646968 && a2 == 0xE600000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000100CBAE60)
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

uint64_t sub_100BFED8C(void *a1, char a2)
{
  sub_10017DF08(&qword_100EB8CD8);
  sub_100179C0C();
  uint64_t v24 = v4;
  uint64_t v25 = v3;
  __chkstk_darwin(v3);
  sub_1001626E0();
  uint64_t v7 = v6 - v5;
  uint64_t v23 = sub_10017DF08(&qword_100EB8CE0);
  sub_100179C0C();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_1001626E0();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_10017DF08(&qword_100EB8CE8);
  sub_100179C0C();
  uint64_t v16 = v15;
  __chkstk_darwin(v17);
  sub_1001626E0();
  uint64_t v20 = v19 - v18;
  sub_1001B1E64(a1, a1[3]);
  sub_100BFF5A8();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v21 = (uint64_t (**)(uint64_t, uint64_t))(v16 + 8);
  if (a2)
  {
    sub_100BFF5F4();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v7, v25);
  }
  else
  {
    sub_100BFF640();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v23);
  }
  return (*v21)(v20, v14);
}

uint64_t sub_100BFEFAC(uint64_t a1)
{
  uint64_t v37 = sub_10017DF08(&qword_100EB8CA8);
  sub_100179C0C();
  uint64_t v35 = v2;
  __chkstk_darwin(v3);
  sub_1001626E0();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_10017DF08(&qword_100EB8CB0);
  sub_100179C0C();
  uint64_t v34 = v8;
  __chkstk_darwin(v9);
  sub_1001626E0();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_10017DF08(&qword_100EB8CB8);
  sub_100179C0C();
  uint64_t v36 = v14;
  __chkstk_darwin(v15);
  sub_1001626E0();
  uint64_t v18 = v17 - v16;
  sub_1001B1E64((void *)a1, *(void *)(a1 + 24));
  sub_100BFF5A8();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v38) {
    goto LABEL_8;
  }
  uint64_t v39 = a1;
  uint64_t v19 = KeyedDecodingContainer.allKeys.getter();
  uint64_t v20 = *(void *)(v19 + 16);
  if (!v20
    || (a1 = *(unsigned __int8 *)(v19 + 32),
        sub_100723214(1, v20, v19, v19 + 32, 0, (2 * v20) | 1),
        uint64_t v22 = v21,
        unint64_t v24 = v23,
        swift_bridgeObjectRelease(),
        v22 != v24 >> 1))
  {
    uint64_t v27 = v18;
    uint64_t v28 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v30 = v29;
    sub_10017DF08(&qword_100E67280);
    void *v30 = &type metadata for AddLocationAlertState;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v28 - 8) + 104))(v30, enum case for DecodingError.typeMismatch(_:), v28);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v27, v13);
    a1 = v39;
LABEL_8:
    _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(a1);
    return a1;
  }
  if (a1)
  {
    sub_100BFF5F4();
    sub_10017A110();
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v6, v37);
    swift_unknownObjectRelease();
    uint64_t v25 = sub_10018124C();
    v26(v25);
    a1 = a1;
  }
  else
  {
    sub_100BFF640();
    sub_10017A110();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v12, v7);
    swift_unknownObjectRelease();
    uint64_t v32 = sub_10018124C();
    v33(v32);
  }
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v39);
  return a1;
}

uint64_t sub_100BFF374()
{
  return sub_100BFEC6C(*v0);
}

uint64_t sub_100BFF37C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100BFECA4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100BFF3A4(uint64_t a1)
{
  unint64_t v2 = sub_100BFF5A8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100BFF3E0(uint64_t a1)
{
  unint64_t v2 = sub_100BFF5A8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100BFF41C(uint64_t a1)
{
  unint64_t v2 = sub_100BFF5F4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100BFF458(uint64_t a1)
{
  unint64_t v2 = sub_100BFF5F4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100BFF494(uint64_t a1)
{
  unint64_t v2 = sub_100BFF640();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100BFF4D0(uint64_t a1)
{
  unint64_t v2 = sub_100BFF640();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100BFF50C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100BFEFAC(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_100BFF53C(void *a1)
{
  return sub_100BFED8C(a1, *v1);
}

unint64_t sub_100BFF55C()
{
  unint64_t result = qword_100EB8CA0;
  if (!qword_100EB8CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8CA0);
  }
  return result;
}

unint64_t sub_100BFF5A8()
{
  unint64_t result = qword_100EB8CC0;
  if (!qword_100EB8CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8CC0);
  }
  return result;
}

unint64_t sub_100BFF5F4()
{
  unint64_t result = qword_100EB8CC8;
  if (!qword_100EB8CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8CC8);
  }
  return result;
}

unint64_t sub_100BFF640()
{
  unint64_t result = qword_100EB8CD0;
  if (!qword_100EB8CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8CD0);
  }
  return result;
}

unsigned char *_s7Weather21AddLocationAlertStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100BFF758);
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

ValueMetadata *type metadata accessor for AddLocationAlertState.CodingKeys()
{
  return &type metadata for AddLocationAlertState.CodingKeys;
}

ValueMetadata *type metadata accessor for AddLocationAlertState.HiddenCodingKeys()
{
  return &type metadata for AddLocationAlertState.HiddenCodingKeys;
}

ValueMetadata *type metadata accessor for AddLocationAlertState.ExceedLocationLimitCodingKeys()
{
  return &type metadata for AddLocationAlertState.ExceedLocationLimitCodingKeys;
}

unint64_t sub_100BFF7B4()
{
  unint64_t result = qword_100EB8CF0;
  if (!qword_100EB8CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8CF0);
  }
  return result;
}

unint64_t sub_100BFF804()
{
  unint64_t result = qword_100EB8CF8;
  if (!qword_100EB8CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8CF8);
  }
  return result;
}

unint64_t sub_100BFF854()
{
  unint64_t result = qword_100EB8D00;
  if (!qword_100EB8D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8D00);
  }
  return result;
}

unint64_t sub_100BFF8A4()
{
  unint64_t result = qword_100EB8D08;
  if (!qword_100EB8D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8D08);
  }
  return result;
}

unint64_t sub_100BFF8F4()
{
  unint64_t result = qword_100EB8D10;
  if (!qword_100EB8D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8D10);
  }
  return result;
}

unint64_t sub_100BFF944()
{
  unint64_t result = qword_100EB8D18;
  if (!qword_100EB8D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8D18);
  }
  return result;
}

unint64_t sub_100BFF994()
{
  unint64_t result = qword_100EB8D20;
  if (!qword_100EB8D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8D20);
  }
  return result;
}

void sub_100BFF9E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v49 = type metadata accessor for Location();
  uint64_t v7 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = type metadata accessor for LocationOfInterestType();
  uint64_t v9 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  char v51 = (char *)v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = type metadata accessor for LocationOfInterest();
  uint64_t v11 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v63 = (char *)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v55 = (char *)v46 - v14;
  __chkstk_darwin(v15);
  char v56 = (char *)v46 - v16;
  __n128 v18 = __chkstk_darwin(v17);
  char v68 = (char *)v46 - v19;
  uint64_t v73 = _swiftEmptyArrayStorage;
  uint64_t v67 = a1;
  uint64_t v54 = *(void *)(a1 + 16);
  if (!v54)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  v46[1] = v3;
  unint64_t v20 = 0;
  uint64_t v50 = (void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v57 = (void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v47 = (void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v61 = a2;
  uint64_t v62 = (void (**)(char *, char *, uint64_t))(v11 + 32);
  uint64_t v58 = a3;
  uint64_t v21 = v68;
  uint64_t v22 = v69;
  unint64_t v23 = v56;
  uint64_t v66 = v11 + 16;
  uint64_t v53 = v11;
  while (v20 < *(void *)(v67 + 16))
  {
    unint64_t v24 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v64 = *(void *)(v11 + 72);
    unint64_t v65 = v24;
    uint64_t v25 = *(void (**)(char *, unint64_t, uint64_t, __n128))(v11 + 16);
    v25(v21, v67 + v24 + v64 * v20, v22, v18);
    LocationOfInterest.searchDisplayAddress.getter();
    Swift::String v26 = String.lowercased()();
    swift_bridgeObjectRelease();
    Swift::String v72 = v26;
    uint64_t v21 = v68;
    uint64_t v70 = a2;
    uint64_t v71 = a3;
    uint64_t v27 = a3;
    unint64_t v28 = sub_1002AE218();
    unint64_t v59 = sub_1002AE264();
    unint64_t v60 = v28;
    char v29 = BidirectionalCollection<>.starts<A>(with:)();
    uint64_t v22 = v69;
    swift_bridgeObjectRelease();
    ((void (*)(char *, char *, uint64_t))v25)(v23, v21, v22);
    if (v29)
    {
      uint64_t v30 = *v57;
      (*v57)(v23, v22);
      id v31 = v55;
      ((void (*)(char *, char *, uint64_t))v25)(v55, v21, v22);
LABEL_7:
      uint64_t v11 = v53;
      v30(v31, v22);
LABEL_8:
      uint64_t v38 = *v62;
      (*v62)(v63, v21, v22);
      uint64_t v39 = v73;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v23 = v56;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1007F3A88();
        uint64_t v39 = v73;
      }
      a3 = v58;
      a2 = v61;
      unint64_t v41 = v39[2];
      if (v41 >= v39[3] >> 1)
      {
        sub_1007F3A88();
        uint64_t v39 = v73;
      }
      v39[2] = v41 + 1;
      uint64_t v42 = (char *)v39 + v65 + v41 * v64;
      uint64_t v22 = v69;
      v38(v42, v63, v69);
      uint64_t v73 = v39;
      uint64_t v21 = v68;
      goto LABEL_13;
    }
    uint64_t v32 = v23;
    uint64_t v33 = v51;
    uint64_t v34 = v57;
    LocationOfInterest.type.getter();
    LocationOfInterestType.title.getter();
    (*v50)(v33, v52);
    Swift::String v35 = String.lowercased()();
    uint64_t v22 = v69;
    swift_bridgeObjectRelease();
    Swift::String v72 = v35;
    uint64_t v70 = v61;
    uint64_t v71 = v27;
    char v36 = BidirectionalCollection<>.starts<A>(with:)();
    swift_bridgeObjectRelease();
    uint64_t v30 = *v34;
    uint64_t v37 = v32;
    uint64_t v21 = v68;
    v30(v37, v22);
    id v31 = v55;
    ((void (*)(char *, char *, uint64_t))v25)(v55, v21, v22);
    if (v36) {
      goto LABEL_7;
    }
    uint64_t v43 = v48;
    LocationOfInterest.location.getter();
    Location.name.getter();
    (*v47)(v43, v49);
    Swift::String v44 = String.lowercased()();
    uint64_t v22 = v69;
    swift_bridgeObjectRelease();
    Swift::String v72 = v44;
    uint64_t v70 = v61;
    uint64_t v71 = v58;
    char v45 = BidirectionalCollection<>.starts<A>(with:)();
    swift_bridgeObjectRelease();
    v30(v31, v22);
    uint64_t v11 = v53;
    if (v45) {
      goto LABEL_8;
    }
    v30(v21, v22);
    a3 = v58;
    a2 = v61;
    unint64_t v23 = v56;
LABEL_13:
    if (v54 == ++v20) {
      goto LABEL_17;
    }
  }
  __break(1u);
}

void sub_100C00074(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = type metadata accessor for LocationOfInterest();
  uint64_t v5 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  char v29 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v20 - v9;
  uint64_t v30 = _swiftEmptyArrayStorage;
  uint64_t v28 = *(void *)(a1 + 16);
  if (v28)
  {
    unint64_t v11 = 0;
    uint64_t v22 = a2;
    unint64_t v23 = (void (**)(char *, uint64_t))(v5 + 8);
    Swift::String v26 = (void (**)(char *, char *, uint64_t))(v5 + 32);
    uint64_t v27 = v5 + 16;
    uint64_t v21 = a1;
    uint64_t v12 = v24;
    while (v11 < *(void *)(a1 + 16))
    {
      unint64_t v13 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      uint64_t v14 = *(void *)(v5 + 72);
      (*(void (**)(char *, unint64_t, uint64_t, __n128))(v5 + 16))(v10, a1 + v13 + v14 * v11, v12, v8);
      char v15 = sub_1009028B8((uint64_t)v10, a2);
      if (v2)
      {
        (*v23)(v10, v12);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        return;
      }
      if (v15)
      {
        uint64_t v25 = *v26;
        v25(v29, v10, v12);
        uint64_t v16 = v30;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1007F3A88();
          uint64_t v16 = v30;
        }
        unint64_t v17 = v16[2];
        if (v17 >= v16[3] >> 1)
        {
          sub_1007F3A88();
          uint64_t v16 = v30;
        }
        v16[2] = v17 + 1;
        unint64_t v18 = (unint64_t)v16 + v13 + v17 * v14;
        uint64_t v19 = v24;
        v25((char *)v18, v29, v24);
        uint64_t v30 = v16;
        uint64_t v12 = v19;
        a1 = v21;
        a2 = v22;
      }
      else
      {
        (*v23)(v10, v12);
      }
      if (v28 == ++v11) {
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_100C00338(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v67 = a2;
  uint64_t v64 = type metadata accessor for LocationsState();
  sub_100162E4C();
  __chkstk_darwin(v4);
  sub_1001626E0();
  unint64_t v65 = (uint64_t *)(v6 - v5);
  uint64_t v7 = type metadata accessor for SearchLocation();
  *(void *)&long long v66 = *(void *)(v7 - 8);
  __chkstk_darwin(v7 - 8);
  *(void *)&long long v68 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  unint64_t v11 = (uint64_t *)((char *)&v62 - v10);
  uint64_t object = type metadata accessor for SearchViewState.ViewState(0);
  sub_100162E4C();
  __chkstk_darwin(v13);
  sub_1001626E0();
  uint64_t v16 = (uint64_t *)(v15 - v14);
  uint64_t v17 = sub_10017DF08(&qword_100E66408);
  __chkstk_darwin(v17 - 8);
  sub_1001626E0();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = type metadata accessor for ViewState(0);
  uint64_t v22 = v21 - 8;
  __chkstk_darwin(v21);
  sub_1001626E0();
  uint64_t v25 = v24 - v23;
  unint64_t v26 = type metadata accessor for SearchViewState(0);
  sub_100162E4C();
  __chkstk_darwin(v27);
  sub_1001626E0();
  uint64_t v30 = (uint64_t *)(v29 - v28);
  sub_100113AE8(a1 + OBJC_IVAR____TtCV7Weather9MainState8_Storage_view, v25, (void (*)(void))type metadata accessor for ViewState);
  sub_10052E3A0(v25 + *(int *)(v22 + 40), v20);
  sub_10013F170(v25, (void (*)(void))type metadata accessor for ViewState);
  if (_s7Weather24LocationCompositionStateOwet_0(v20, 1, v26) == 1)
  {
    sub_100C0124C(v20);
    *(double *)&long long v31 = sub_10017DDA0();
    char v33 = -1;
  }
  else
  {
    sub_10011E66C(v20, (uint64_t)v30, (void (*)(void))type metadata accessor for SearchViewState);
    uint64_t v25 = a1 + OBJC_IVAR____TtCV7Weather9MainState8_Storage_environment;
    swift_beginAccess();
    if (*(unsigned char *)(v25 + 2) == 4)
    {
      sub_100C00D2C((uint64_t)&v69);
      uint64_t v22 = v69;
      uint64_t v25 = v70;
      unint64_t v26 = v71;
      uint64_t v34 = (uint64_t)v30;
      uint64_t v30 = v72;
      id v2 = v73;
      uint64_t object = v74;
      a1 = v75;
      long long v68 = v76;
      long long v66 = v77;
      unint64_t v11 = v78;
      Swift::String v35 = type metadata accessor for SearchViewState;
LABEL_5:
      sub_10013F170(v34, (void (*)(void))v35);
      long long v32 = v66;
      long long v31 = v68;
      char v33 = 1;
    }
    else
    {
      sub_100113AE8((uint64_t)v30 + *(int *)(v26 + 20), (uint64_t)v16, (void (*)(void))type metadata accessor for SearchViewState.ViewState);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v40 = *v16;
          unint64_t v41 = _swiftEmptyArrayStorage;
          uint64_t v69 = _swiftEmptyArrayStorage;
          unint64_t v65 = *(uint64_t **)(v40 + 16);
          if (v65)
          {
            uint64_t v42 = 0;
            uint64_t v63 = a1;
            uint64_t v62 = v40;
            do
            {
              if ((unint64_t)v42 >= *(void *)(v40 + 16))
              {
                __break(1u);
                JUMPOUT(0x100C00D18);
              }
              unint64_t v43 = (*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
              uint64_t v44 = *(void *)(v66 + 72);
              sub_100113AE8(v40 + v43 + v44 * (void)v42, (uint64_t)v11, (void (*)(void))type metadata accessor for SearchLocation);
              if (*v11)
              {
                uint64_t object = (uint64_t)v2;
                char v45 = v30;
                sub_10011E66C((uint64_t)v11, v68, (void (*)(void))type metadata accessor for SearchLocation);
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  sub_1007F3754();
                }
                uint64_t v46 = v69;
                unint64_t v47 = v69[2];
                if (v47 >= v69[3] >> 1)
                {
                  sub_1007F3754();
                  uint64_t v46 = v69;
                }
                void v46[2] = v47 + 1;
                sub_10011E66C(v68, (uint64_t)v46 + v43 + v47 * v44, (void (*)(void))type metadata accessor for SearchLocation);
                uint64_t v30 = v45;
                a1 = v63;
                uint64_t v40 = v62;
              }
              else
              {
                sub_10013F170((uint64_t)v11, (void (*)(void))type metadata accessor for SearchLocation);
              }
              uint64_t v42 = (uint64_t *)((char *)v42 + 1);
            }
            while (v65 != v42);
            unint64_t v41 = v69;
          }
          swift_bridgeObjectRelease();
          Swift::String v56 = String.lowercased()();
          if ((static Settings.HomeAndWork.homeAndWorkLabelEnabled.getter() & 1) != 0
            && (static Settings.Features.homeAndWorkEnabled.getter() & 1) != 0)
          {
            uint64_t object = *(void *)(a1 + OBJC_IVAR____TtCV7Weather9MainState8_Storage_locations + *(int *)(v64 + 28));
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            sub_100BFF9E0(object, v56._countAndFlagsBits, (uint64_t)v56._object);
            type metadata accessor for LocationOfInterest();
            uint64_t v22 = Array.sorting<A>(on:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v22 = (uint64_t)_swiftEmptyArrayStorage;
          }
          swift_bridgeObjectRelease();
          uint64_t v25 = (uint64_t)v41;
          if (!v41[2] && !*(void *)(v22 + 16))
          {
            swift_bridgeObjectRelease();
            swift_release();
            uint64_t v59 = *v30;
            uint64_t v60 = v30[1];
            swift_bridgeObjectRetain();
            sub_100C00EE4(v59, v60, (uint64_t)&v69);
            uint64_t v22 = v69;
            uint64_t v25 = v70;
            unint64_t v26 = v71;
            uint64_t v16 = v30;
            sub_10019F9E8();
            uint64_t v39 = type metadata accessor for SearchViewState;
            goto LABEL_9;
          }
          uint64_t v57 = (uint64_t)v30;
          unint64_t v26 = *v30;
          uint64_t v30 = (uint64_t *)v30[1];
          swift_bridgeObjectRetain();
          id v2 = (id)sub_100C010F4(v26, (uint64_t)v30);
          uint64_t object = v58;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_10013F170(v57, (void (*)(void))type metadata accessor for SearchViewState);
          a1 = 0;
          unint64_t v11 = 0;
          char v33 = 0;
          long long v31 = 0uLL;
          long long v32 = 0uLL;
          break;
        case 2u:
          sub_10013F170((uint64_t)v30, (void (*)(void))type metadata accessor for SearchViewState);
          *(double *)&long long v31 = sub_10017DDA0();
          char v33 = 3;
          break;
        case 3u:
          if ((static Settings.HomeAndWork.homeAndWorkLabelEnabled.getter() & 1) != 0
            && (static Settings.Features.homeAndWorkEnabled.getter() & 1) != 0)
          {
            uint64_t v48 = (uint64_t)v65;
            uint64_t v49 = sub_100113AE8(a1 + OBJC_IVAR____TtCV7Weather9MainState8_Storage_locations, (uint64_t)v65, (void (*)(void))type metadata accessor for LocationsState);
            __chkstk_darwin(v49);
            swift_bridgeObjectRetain();
            sub_100887154();
            uint64_t object = v50;
            swift_bridgeObjectRelease();
            uint64_t v51 = swift_bridgeObjectRetain();
            sub_100C00074(v51, object);
            uint64_t v22 = v52;
            sub_10013F170(v48, (void (*)(void))type metadata accessor for LocationsState);
            if (*(void *)(v22 + 16))
            {
              id v2 = [self mainBundle];
              v79._uint64_t object = (void *)0x8000000100CC1600;
              v53._countAndFlagsBits = 0x73746C75736552;
              v53._uint64_t object = (void *)0xE700000000000000;
              v54._countAndFlagsBits = 0;
              v54._uint64_t object = (void *)0xE000000000000000;
              v79._countAndFlagsBits = 0xD00000000000004FLL;
              uint64_t object = (uint64_t)NSLocalizedString(_:tableName:bundle:value:comment:)(v53, (Swift::String_optional)0, (NSBundle)v2, v54, v79)._object;

              uint64_t v25 = static String.localizedStringWithFormat(_:_:)();
              unint64_t v26 = v55;
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v25 = sub_100C010F4(*v30, v30[1]);
              unint64_t v26 = v61;
            }
            sub_10013F170((uint64_t)v30, (void (*)(void))type metadata accessor for SearchViewState);
            *(double *)&long long v31 = sub_10017B1C4();
          }
          else
          {
            sub_10013F170((uint64_t)v30, (void (*)(void))type metadata accessor for SearchViewState);
            uint64_t v25 = 0;
            *(double *)&long long v31 = sub_10017B1C4();
            unint64_t v26 = 0xE000000000000000;
            uint64_t v22 = (uint64_t)_swiftEmptyArrayStorage;
          }
          break;
        case 4u:
          sub_10013F170((uint64_t)v30, (void (*)(void))type metadata accessor for SearchViewState);
          uint64_t v25 = 0;
          unint64_t v26 = 0;
          uint64_t v30 = 0;
          id v2 = 0;
          uint64_t object = 0;
          a1 = 0;
          unint64_t v11 = 0;
          long long v31 = 0uLL;
          char v33 = 3;
          long long v32 = 0uLL;
          uint64_t v22 = 1;
          break;
        default:
          uint64_t v37 = *v30;
          uint64_t v38 = v30[1];
          swift_bridgeObjectRetain();
          sub_100C00EE4(v37, v38, (uint64_t)&v69);
          uint64_t v22 = v69;
          uint64_t v25 = v70;
          unint64_t v26 = v71;
          unint64_t v65 = v30;
          sub_10019F9E8();
          sub_10013F170((uint64_t)v65, (void (*)(void))type metadata accessor for SearchViewState);
          uint64_t v39 = type metadata accessor for SearchViewState.ViewState;
LABEL_9:
          Swift::String v35 = v39;
          uint64_t v34 = (uint64_t)v16;
          goto LABEL_5;
      }
    }
  }
  char v36 = v67;
  *uint64_t v67 = v22;
  v36[1] = v25;
  v36[2] = v26;
  v36[3] = (uint64_t)v30;
  v36[4] = (uint64_t)v2;
  v36[5] = object;
  v36[6] = a1;
  *(_OWORD *)(v36 + 7) = v31;
  *(_OWORD *)(v36 + 9) = v32;
  v36[11] = (uint64_t)v11;
  *((unsigned char *)v36 + 96) = v33;
}

uint64_t sub_100C00D2C@<X0>(uint64_t a1@<X8>)
{
  id v2 = self;
  id v3 = [v2 mainBundle];
  v18._countAndFlagsBits = 0xD00000000000003ELL;
  v18._uint64_t object = (void *)0x8000000100CC1730;
  v4._uint64_t object = (void *)0x8000000100CC16F0;
  v5._uint64_t object = (void *)0x8000000100CC1710;
  v4._countAndFlagsBits = 0xD000000000000012;
  v5._countAndFlagsBits = 0xD000000000000012;
  Swift::String v6 = NSLocalizedString(_:tableName:bundle:value:comment:)(v4, (Swift::String_optional)0, (NSBundle)v3, v5, v18);

  id v7 = [v2 mainBundle];
  v19._countAndFlagsBits = 0xD000000000000040;
  v19._uint64_t object = (void *)0x8000000100CC17E0;
  v8._uint64_t object = (void *)0x8000000100CC1770;
  v8._countAndFlagsBits = 0x1000000000000064;
  v9._countAndFlagsBits = 0;
  v9._uint64_t object = (void *)0xE000000000000000;
  Swift::String v10 = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v9, v19);

  uint64_t v11 = sub_100881B40();
  uint64_t v13 = v12;
  static Color.blue.getter();
  uint64_t v14 = Color.hex.getter();
  uint64_t v16 = v15;
  uint64_t result = swift_release();
  *(unsigned char *)a1 = 1;
  *(void *)(a1 + 8) = 0xD000000000000014;
  *(void *)(a1 + 16) = 0x8000000100CB5150;
  *(Swift::String *)(a1 + 24) = v6;
  *(Swift::String *)(a1 + 40) = v10;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v16;
  return result;
}

uint64_t sub_100C00EE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  Swift::String v6 = self;
  id v7 = [v6 mainBundle];
  v22._countAndFlagsBits = 0xD000000000000039;
  v22._uint64_t object = (void *)0x8000000100CC1650;
  v8._countAndFlagsBits = 0x6C75736552206F4ELL;
  v8._uint64_t object = (void *)0xEA00000000007374;
  v9._countAndFlagsBits = 0;
  v9._uint64_t object = (void *)0xE000000000000000;
  Swift::String v10 = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v9, v22);

  id v11 = [v6 mainBundle];
  v23._countAndFlagsBits = 0xD00000000000003BLL;
  v23._uint64_t object = (void *)0x8000000100CC16B0;
  v12._uint64_t object = (void *)0x8000000100CC1690;
  v12._countAndFlagsBits = 0xD00000000000001ALL;
  v13._countAndFlagsBits = 0;
  v13._uint64_t object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v23);

  sub_10017DF08(&qword_100E64020);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100C251B0;
  *(void *)(v14 + 56) = &type metadata for String;
  *(void *)(v14 + 64) = sub_10012B7C0();
  *(void *)(v14 + 32) = a1;
  *(void *)(v14 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v15 = static String.localizedStringWithFormat(_:_:)();
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  static Color.blue.getter();
  uint64_t v18 = Color.hex.getter();
  uint64_t v20 = v19;
  uint64_t result = swift_release();
  *(unsigned char *)a3 = 1;
  *(void *)(a3 + 8) = 0x697966696E67616DLL;
  *(void *)(a3 + 16) = 0xEF7373616C67676ELL;
  *(Swift::String *)(a3 + 24) = v10;
  *(void *)(a3 + 40) = v15;
  *(void *)(a3 + 48) = v17;
  *(void *)(a3 + 56) = 0;
  *(void *)(a3 + 64) = 0;
  *(void *)(a3 + 72) = 0;
  *(void *)(a3 + 80) = v18;
  *(void *)(a3 + 88) = v20;
  return result;
}

uint64_t sub_100C010F4(uint64_t a1, uint64_t a2)
{
  id v4 = [self mainBundle];
  v10._countAndFlagsBits = 0xD00000000000001FLL;
  v10._uint64_t object = (void *)0x8000000100CBD6F0;
  v5._uint64_t object = (void *)0x8000000100CBD6D0;
  v5._countAndFlagsBits = 0xD000000000000010;
  v6._countAndFlagsBits = 0;
  v6._uint64_t object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v5, (Swift::String_optional)0, (NSBundle)v4, v6, v10);

  sub_10017DF08(&qword_100E64020);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100C251B0;
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = sub_10012B7C0();
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v8 = static String.localizedStringWithFormat(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t type metadata accessor for SearchViewModelFactory()
{
  return self;
}

uint64_t sub_100C0124C(uint64_t a1)
{
  uint64_t v2 = sub_10017DF08(&qword_100E66408);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100C012AC@<X0>(uint64_t a1@<X8>)
{
  return sub_1009026AC(a1);
}

uint64_t sub_100C012C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100C012E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v39 = sub_10017DF08(&qword_100E737F8);
  sub_100162E4C();
  __chkstk_darwin(v2);
  sub_10016278C();
  uint64_t v38 = v3 - v4;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v36 - v6;
  HourPrecipitationDetailInnerView = (int *)type metadata accessor for NextHourPrecipitationDetailInnerView();
  sub_100162E4C();
  __chkstk_darwin(v9);
  sub_10016278C();
  uint64_t v12 = v10 - v11;
  __chkstk_darwin(v13);
  uint64_t v40 = (uint64_t)&v36 - v14;
  uint64_t HourPrecipitationDetailView = type metadata accessor for NextHourPrecipitationDetailViewModel.Model(0);
  sub_100162E4C();
  __chkstk_darwin(v16);
  sub_10016278C();
  uint64_t v19 = v17 - v18;
  __chkstk_darwin(v20);
  Swift::String v22 = (char *)&v36 - v21;
  uint64_t v41 = sub_10017DF08(&qword_100EB8DC0);
  sub_100162E4C();
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v36 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t HourPrecipitationDetailViewModel = type metadata accessor for NextHourPrecipitationDetailViewModel(0);
  __chkstk_darwin(HourPrecipitationDetailViewModel - 8);
  uint64_t v28 = (char *)&v36 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_10024FBC4();
  swift_release();
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v28, 1, HourPrecipitationDetailView) == 1)
  {
    swift_storeEnumTagMultiPayload();
    sub_100C08514(&qword_100EB8DC8, (void (*)(uint64_t))type metadata accessor for NextHourPrecipitationDetailInnerView);
    return _ConditionalContent<>.init(storage:)();
  }
  else
  {
    uint64_t v37 = v22;
    sub_100C08564((uint64_t)v28, (uint64_t)v22, (void (*)(void))type metadata accessor for NextHourPrecipitationDetailViewModel.Model);
    sub_100C085B8((uint64_t)v22, v19, (void (*)(void))type metadata accessor for NextHourPrecipitationDetailViewModel.Model);
    sub_1001E9994(v1 + 16, (uint64_t)v49);
    uint64_t v30 = *(void *)(v1 + 56);
    uint64_t v31 = v12 + HourPrecipitationDetailInnerView[6];
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    char v45 = 1;
    swift_retain();
    sub_10017DF08(&qword_100E827E8);
    State.init(wrappedValue:)();
    char v32 = v47;
    uint64_t v33 = v48;
    *(_OWORD *)uint64_t v31 = v46;
    *(unsigned char *)(v31 + 16) = v32;
    *(void *)(v31 + 24) = v33;
    uint64_t HourPrecipitationChartView = type metadata accessor for NextHourPrecipitationChartViewModel.Point();
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v7, 1, 1, HourPrecipitationChartView);
    sub_10006DF38((uint64_t)v7, v38, &qword_100E737F8);
    State.init(wrappedValue:)();
    sub_100178110((uint64_t)v7, &qword_100E737F8);
    sub_100C08564(v19, v12 + HourPrecipitationDetailInnerView[5], (void (*)(void))type metadata accessor for NextHourPrecipitationDetailViewModel.Model);
    sub_1001262E4(v49, v12);
    *(void *)(v12 + HourPrecipitationDetailInnerView[8]) = v30;
    uint64_t v35 = v40;
    sub_100C08564(v12, v40, (void (*)(void))type metadata accessor for NextHourPrecipitationDetailInnerView);
    sub_100C085B8(v35, (uint64_t)v25, (void (*)(void))type metadata accessor for NextHourPrecipitationDetailInnerView);
    swift_storeEnumTagMultiPayload();
    sub_100C08514(&qword_100EB8DC8, (void (*)(uint64_t))type metadata accessor for NextHourPrecipitationDetailInnerView);
    _ConditionalContent<>.init(storage:)();
    sub_100C0860C(v35, (void (*)(void))type metadata accessor for NextHourPrecipitationDetailInnerView);
    return sub_100C0860C((uint64_t)v37, (void (*)(void))type metadata accessor for NextHourPrecipitationDetailViewModel.Model);
  }
}

uint64_t type metadata accessor for NextHourPrecipitationDetailInnerView()
{
  uint64_t result = qword_100EB8E30;
  if (!qword_100EB8E30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100C017DC(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v34 = *a2;
    *(void *)a1 = *a2;
    uint64_t v35 = v34 + ((v5 + 16) & ~(unint64_t)v5);
    goto LABEL_34;
  }
  long long v7 = *(_OWORD *)(a2 + 3);
  *(_OWORD *)(a1 + 24) = v7;
  (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
  unint64_t v100 = a3;
  v101 = a2;
  uint64_t v8 = a3[5];
  uint64_t v102 = a1;
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)((char *)a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = v10[3];
  v9[2] = v10[2];
  v9[3] = v12;
  v9[4] = v10[4];
  uint64_t HourPrecipitationDetailView = type metadata accessor for NextHourPrecipitationDetailViewModel.Model(0);
  uint64_t v14 = *(int *)(HourPrecipitationDetailView + 28);
  uint64_t v105 = (char *)v9 + v14;
  uint64_t v15 = (char *)v10 + v14;
  uint64_t HourPrecipitationChartViewModel = type metadata accessor for NextHourPrecipitationChartViewModel();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(HourPrecipitationChartViewModel - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17(v105, v15, HourPrecipitationChartViewModel);
  uint64_t v18 = *(int *)(HourPrecipitationDetailView + 32);
  uint64_t v19 = v10;
  uint64_t v20 = (void *)((char *)v9 + v18);
  uint64_t v104 = v19;
  uint64_t v106 = HourPrecipitationDetailView;
  uint64_t v21 = (char *)v19 + v18;
  uint64_t v22 = *(void *)((char *)v19 + v18 + 8);
  *uint64_t v20 = *(void *)((char *)v19 + v18);
  v20[1] = v22;
  uint64_t v23 = type metadata accessor for ConditionDetailMapViewModel();
  uint64_t v24 = *(int *)(v23 + 20);
  uint64_t v25 = (char *)v20 + v24;
  unint64_t v26 = &v21[v24];
  uint64_t v27 = type metadata accessor for Location();
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16);
  swift_bridgeObjectRetain();
  v28(v25, v26, v27);
  v103 = (int *)v23;
  uint64_t v29 = *(int *)(v23 + 24);
  uint64_t v30 = (void *)((char *)v20 + v29);
  uint64_t v31 = &v21[v29];
  uint64_t v32 = type metadata accessor for WeatherData(0);
  if (!_s7Weather24LocationCompositionStateOwet_0((uint64_t)v31, 1, v32))
  {
    uint64_t v36 = *((void *)v31 + 1);
    void *v30 = *(void *)v31;
    v30[1] = v36;
    uint64_t v37 = (int *)v32;
    uint64_t v38 = *(int *)(v32 + 20);
    uint64_t v39 = (char *)v30 + v38;
    uint64_t v40 = &v31[v38];
    uint64_t v41 = type metadata accessor for Locale();
    swift_bridgeObjectRetain();
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v40, 1, v41))
    {
      uint64_t v42 = sub_10017DF08(&qword_100E63730);
      memcpy(v39, v40, *(void *)(*(void *)(v42 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v39, 0, 1, v41);
    }
    uint64_t v43 = (uint64_t)v37;
    uint64_t v44 = v37[6];
    char v45 = (char *)v30 + v44;
    long long v46 = &v31[v44];
    uint64_t v47 = type metadata accessor for WeatherDataModel();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 16))(v45, v46, v47);
    uint64_t v48 = v37[7];
    uint64_t v49 = (char *)v30 + v48;
    uint64_t v50 = &v31[v48];
    uint64_t v51 = sub_10017DF08(&qword_100E63738);
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v50, 1, v51))
    {
      uint64_t v52 = type metadata accessor for WeatherData.CachingState(0);
      memcpy(v49, v50, *(void *)(*(void *)(v52 - 8) + 64));
    }
    else
    {
      uint64_t v53 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 16))(v49, v50, v53);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v49, 0, 1, v51);
    }
    uint64_t v54 = v37[8];
    unint64_t v55 = (void *)((char *)v30 + v54);
    Swift::String v56 = &v31[v54];
    uint64_t v57 = type metadata accessor for WeatherData.WeatherStatisticsState(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v60 = type metadata accessor for WeatherStatisticsModel();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v60 - 8) + 16))(v55, v56, v60);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(v55, v56, *(void *)(*(void *)(v57 - 8) + 64));
        goto LABEL_17;
      }
      uint64_t v59 = *((void *)v56 + 1);
      *unint64_t v55 = *(void *)v56;
      v55[1] = v59;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
LABEL_17:
    uint64_t v61 = v37[9];
    uint64_t v62 = (char *)v30 + v61;
    uint64_t v63 = &v31[v61];
    uint64_t v64 = type metadata accessor for WeatherDataOverrides();
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v63, 1, v64))
    {
      uint64_t v65 = sub_10017DF08(&qword_100E63740);
      memcpy(v62, v63, *(void *)(*(void *)(v65 - 8) + 64));
    }
    else
    {
      uint64_t v66 = type metadata accessor for Date();
      if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v63, 1, v66))
      {
        uint64_t v67 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
        memcpy(v62, v63, *(void *)(*(void *)(v67 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 16))(v62, v63, v66);
        _s7Weather24LocationCompositionStateOwst_0((uint64_t)v62, 0, 1, v66);
      }
      uint64_t v68 = *(int *)(v64 + 20);
      uint64_t v69 = &v62[v68];
      uint64_t v70 = &v63[v68];
      if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v70, 1, v66))
      {
        uint64_t v71 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
        memcpy(v69, v70, *(void *)(*(void *)(v71 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 16))(v69, v70, v66);
        _s7Weather24LocationCompositionStateOwst_0((uint64_t)v69, 0, 1, v66);
      }
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v62, 0, 1, v64);
    }
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v30, 0, 1, v43);
    goto LABEL_27;
  }
  uint64_t v33 = sub_10017DF08(&qword_100E63850);
  memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
LABEL_27:
  uint64_t v72 = v103[7];
  uint64_t v73 = (void *)((char *)v20 + v72);
  uint64_t v74 = &v21[v72];
  uint64_t v75 = *((void *)v74 + 1);
  *uint64_t v73 = *(void *)v74;
  v73[1] = v75;
  uint64_t v76 = v103[8];
  long long v77 = (char *)v20 + v76;
  uint64_t v78 = &v21[v76];
  uint64_t v79 = type metadata accessor for WeatherMapOverlayKind();
  uint64_t v80 = *(void (**)(char *, char *, uint64_t))(*(void *)(v79 - 8) + 16);
  swift_bridgeObjectRetain();
  v80(v77, v78, v79);
  *((unsigned char *)v20 + v103[9]) = v21[v103[9]];
  uint64_t v81 = *(int *)(v106 + 36);
  uint64_t v82 = (char *)v9 + v81;
  uint64_t v83 = (uint64_t)v104 + v81;
  uint64_t v84 = type metadata accessor for TimeZone();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v84 - 8) + 16))(v82, v83, v84);
  uint64_t v85 = *(int *)(v106 + 40);
  uint64_t v86 = (char *)v9 + v85;
  uint64_t v87 = (char *)v104 + v85;
  uint64_t v88 = sub_10017DF08(&qword_100E6E900);
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v87, 1, v88))
  {
    uint64_t v89 = sub_10017DF08(&qword_100E6E8F8);
    memcpy(v86, v87, *(void *)(*(void *)(v89 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v88 - 8) + 16))(v86, v87, v88);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v86, 0, 1, v88);
  }
  uint64_t v35 = v102;
  uint64_t v90 = v100[6];
  uint64_t v91 = v100[7];
  uint64_t v92 = v102 + v90;
  uint64_t v93 = (uint64_t)v101 + v90;
  *(_OWORD *)uint64_t v92 = *(_OWORD *)v93;
  *(unsigned char *)(v92 + 16) = *(unsigned char *)(v93 + 16);
  *(void *)(v92 + 24) = *(void *)(v93 + 24);
  uint64_t v94 = (char *)(v102 + v91);
  uint64_t v95 = (char *)v101 + v91;
  uint64_t HourPrecipitationChartView = type metadata accessor for NextHourPrecipitationChartViewModel.Point();
  swift_retain();
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v95, 1, HourPrecipitationChartView))
  {
    uint64_t v97 = sub_10017DF08(&qword_100E737F8);
    memcpy(v94, v95, *(void *)(*(void *)(v97 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(HourPrecipitationChartView - 8) + 16))(v94, v95, HourPrecipitationChartView);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v94, 0, 1, HourPrecipitationChartView);
  }
  uint64_t v98 = sub_10017DF08(&qword_100EB8DD0);
  *(void *)&v94[*(int *)(v98 + 28)] = *(void *)&v95[*(int *)(v98 + 28)];
  *(void *)(v102 + v100[8]) = *(uint64_t *)((char *)v101 + v100[8]);
  swift_retain();
LABEL_34:
  swift_retain();
  return v35;
}

uint64_t sub_100C020C4(uint64_t a1, uint64_t a2)
{
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(a1);
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t HourPrecipitationDetailView = (int *)type metadata accessor for NextHourPrecipitationDetailViewModel.Model(0);
  uint64_t v6 = v4 + HourPrecipitationDetailView[7];
  uint64_t HourPrecipitationChartViewModel = type metadata accessor for NextHourPrecipitationChartViewModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(HourPrecipitationChartViewModel - 8) + 8))(v6, HourPrecipitationChartViewModel);
  uint64_t v8 = v4 + HourPrecipitationDetailView[8];
  swift_bridgeObjectRelease();
  uint64_t v9 = (int *)type metadata accessor for ConditionDetailMapViewModel();
  uint64_t v10 = v8 + v9[5];
  uint64_t v11 = type metadata accessor for Location();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = v8 + v9[6];
  uint64_t v13 = (int *)type metadata accessor for WeatherData(0);
  if (!_s7Weather24LocationCompositionStateOwet_0(v12, 1, (uint64_t)v13))
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = v12 + v13[5];
    uint64_t v15 = type metadata accessor for Locale();
    if (!_s7Weather24LocationCompositionStateOwet_0(v14, 1, v15)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
    }
    uint64_t v16 = v12 + v13[6];
    uint64_t v17 = type metadata accessor for WeatherDataModel();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
    uint64_t v18 = v12 + v13[7];
    uint64_t v19 = sub_10017DF08(&qword_100E63738);
    if (!_s7Weather24LocationCompositionStateOwet_0(v18, 1, v19))
    {
      uint64_t v20 = type metadata accessor for Date();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v18, v20);
    }
    uint64_t v21 = v12 + v13[8];
    type metadata accessor for WeatherData.WeatherStatisticsState(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v23 = type metadata accessor for WeatherStatisticsModel();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(v21, v23);
    }
    else if (!EnumCaseMultiPayload)
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v24 = v12 + v13[9];
    uint64_t v25 = type metadata accessor for WeatherDataOverrides();
    if (!_s7Weather24LocationCompositionStateOwet_0(v24, 1, v25))
    {
      uint64_t v26 = type metadata accessor for Date();
      if (!_s7Weather24LocationCompositionStateOwet_0(v24, 1, v26)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8))(v24, v26);
      }
      uint64_t v27 = v24 + *(int *)(v25 + 20);
      if (!_s7Weather24LocationCompositionStateOwet_0(v27, 1, v26)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8))(v27, v26);
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v28 = v8 + v9[8];
  uint64_t v29 = type metadata accessor for WeatherMapOverlayKind();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);
  uint64_t v30 = v4 + HourPrecipitationDetailView[9];
  uint64_t v31 = type metadata accessor for TimeZone();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8))(v30, v31);
  uint64_t v32 = v4 + HourPrecipitationDetailView[10];
  uint64_t v33 = sub_10017DF08(&qword_100E6E900);
  if (!_s7Weather24LocationCompositionStateOwet_0(v32, 1, v33)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 8))(v32, v33);
  }
  swift_release();
  uint64_t v34 = a1 + *(int *)(a2 + 28);
  uint64_t HourPrecipitationChartView = type metadata accessor for NextHourPrecipitationChartViewModel.Point();
  if (!_s7Weather24LocationCompositionStateOwet_0(v34, 1, HourPrecipitationChartView)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(HourPrecipitationChartView - 8) + 8))(v34, HourPrecipitationChartView);
  }
  sub_10017DF08(&qword_100EB8DD0);
  swift_release();

  return swift_release();
}

uint64_t sub_100C025B0(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v94 = a3;
  uint64_t v95 = a2;
  uint64_t v7 = a3[5];
  uint64_t v96 = a1;
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  void *v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = *(void *)(a2 + v7 + 24);
  v8[2] = *(void *)(a2 + v7 + 16);
  v8[3] = v11;
  v8[4] = *(void *)(a2 + v7 + 32);
  uint64_t HourPrecipitationDetailView = type metadata accessor for NextHourPrecipitationDetailViewModel.Model(0);
  uint64_t v13 = *(int *)(HourPrecipitationDetailView + 28);
  uint64_t v99 = (char *)v8 + v13;
  uint64_t v14 = v9 + v13;
  uint64_t HourPrecipitationChartViewModel = type metadata accessor for NextHourPrecipitationChartViewModel();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(HourPrecipitationChartViewModel - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v16(v99, v14, HourPrecipitationChartViewModel);
  uint64_t v98 = v9;
  uint64_t v100 = HourPrecipitationDetailView;
  uint64_t v17 = *(int *)(HourPrecipitationDetailView + 32);
  uint64_t v97 = v8;
  uint64_t v18 = (void *)((char *)v8 + v17);
  uint64_t v19 = v9 + v17;
  uint64_t v20 = *(void *)(v9 + v17 + 8);
  *uint64_t v18 = *(void *)(v9 + v17);
  v18[1] = v20;
  uint64_t v21 = (int *)type metadata accessor for ConditionDetailMapViewModel();
  uint64_t v22 = v21[5];
  uint64_t v23 = (char *)v18 + v22;
  uint64_t v24 = v19 + v22;
  uint64_t v25 = type metadata accessor for Location();
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16);
  swift_bridgeObjectRetain();
  v26(v23, v24, v25);
  uint64_t v27 = v21[6];
  uint64_t v28 = (void *)((char *)v18 + v27);
  uint64_t v29 = (void *)(v19 + v27);
  uint64_t v30 = (int *)type metadata accessor for WeatherData(0);
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v29, 1, (uint64_t)v30))
  {
    uint64_t v31 = sub_10017DF08(&qword_100E63850);
    memcpy(v28, v29, *(void *)(*(void *)(v31 - 8) + 64));
    goto LABEL_25;
  }
  uint64_t v32 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v32;
  uint64_t v33 = v30[5];
  uint64_t v34 = (char *)v28 + v33;
  uint64_t v35 = (char *)v29 + v33;
  uint64_t v36 = type metadata accessor for Locale();
  swift_bridgeObjectRetain();
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v35, 1, v36))
  {
    uint64_t v37 = sub_10017DF08(&qword_100E63730);
    memcpy(v34, v35, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v34, 0, 1, v36);
  }
  uint64_t v38 = v30[6];
  uint64_t v39 = (char *)v28 + v38;
  uint64_t v40 = (char *)v29 + v38;
  uint64_t v41 = type metadata accessor for WeatherDataModel();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  uint64_t v42 = v30[7];
  uint64_t v43 = (char *)v28 + v42;
  uint64_t v44 = (char *)v29 + v42;
  uint64_t v45 = sub_10017DF08(&qword_100E63738);
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v44, 1, v45))
  {
    uint64_t v46 = type metadata accessor for WeatherData.CachingState(0);
    memcpy(v43, v44, *(void *)(*(void *)(v46 - 8) + 64));
  }
  else
  {
    uint64_t v47 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 16))(v43, v44, v47);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v43, 0, 1, v45);
  }
  uint64_t v48 = v30[8];
  uint64_t v49 = (void *)((char *)v28 + v48);
  uint64_t v50 = (void *)((char *)v29 + v48);
  uint64_t v51 = type metadata accessor for WeatherData.WeatherStatisticsState(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v54 = type metadata accessor for WeatherStatisticsModel();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v54 - 8) + 16))(v49, v50, v54);
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(v49, v50, *(void *)(*(void *)(v51 - 8) + 64));
      goto LABEL_15;
    }
    uint64_t v53 = v50[1];
    void *v49 = *v50;
    v49[1] = v53;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
LABEL_15:
  uint64_t v55 = v30[9];
  Swift::String v56 = (char *)v28 + v55;
  uint64_t v57 = (char *)v29 + v55;
  uint64_t v58 = type metadata accessor for WeatherDataOverrides();
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v57, 1, v58))
  {
    uint64_t v59 = sub_10017DF08(&qword_100E63740);
    memcpy(v56, v57, *(void *)(*(void *)(v59 - 8) + 64));
  }
  else
  {
    uint64_t v60 = type metadata accessor for Date();
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v57, 1, v60))
    {
      uint64_t v61 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
      memcpy(v56, v57, *(void *)(*(void *)(v61 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 16))(v56, v57, v60);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v56, 0, 1, v60);
    }
    uint64_t v62 = *(int *)(v58 + 20);
    uint64_t v63 = &v56[v62];
    uint64_t v64 = &v57[v62];
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v64, 1, v60))
    {
      uint64_t v65 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
      memcpy(v63, v64, *(void *)(*(void *)(v65 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 16))(v63, v64, v60);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v63, 0, 1, v60);
    }
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v56, 0, 1, v58);
  }
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v28, 0, 1, (uint64_t)v30);
LABEL_25:
  uint64_t v66 = v21[7];
  uint64_t v67 = (void *)((char *)v18 + v66);
  uint64_t v68 = (void *)(v19 + v66);
  uint64_t v69 = v68[1];
  *uint64_t v67 = *v68;
  v67[1] = v69;
  uint64_t v70 = v21[8];
  uint64_t v71 = (char *)v18 + v70;
  uint64_t v72 = v19 + v70;
  uint64_t v73 = type metadata accessor for WeatherMapOverlayKind();
  uint64_t v74 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v73 - 8) + 16);
  swift_bridgeObjectRetain();
  v74(v71, v72, v73);
  *((unsigned char *)v18 + v21[9]) = *(unsigned char *)(v19 + v21[9]);
  uint64_t v75 = *(int *)(v100 + 36);
  uint64_t v76 = (char *)v97 + v75;
  uint64_t v77 = v98 + v75;
  uint64_t v78 = type metadata accessor for TimeZone();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v78 - 8) + 16))(v76, v77, v78);
  uint64_t v79 = *(int *)(v100 + 40);
  uint64_t v80 = (char *)v97 + v79;
  uint64_t v81 = (const void *)(v98 + v79);
  uint64_t v82 = sub_10017DF08(&qword_100E6E900);
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v81, 1, v82))
  {
    uint64_t v83 = sub_10017DF08(&qword_100E6E8F8);
    memcpy(v80, v81, *(void *)(*(void *)(v83 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(*(void *)(v82 - 8) + 16))(v80, v81, v82);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v80, 0, 1, v82);
  }
  uint64_t v84 = v94[6];
  uint64_t v85 = v94[7];
  uint64_t v86 = v96 + v84;
  uint64_t v87 = v95 + v84;
  *(_OWORD *)uint64_t v86 = *(_OWORD *)v87;
  *(unsigned char *)(v86 + 16) = *(unsigned char *)(v87 + 16);
  *(void *)(v86 + 24) = *(void *)(v87 + 24);
  uint64_t v88 = (char *)(v96 + v85);
  uint64_t v89 = (char *)(v95 + v85);
  uint64_t HourPrecipitationChartView = type metadata accessor for NextHourPrecipitationChartViewModel.Point();
  swift_retain();
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v89, 1, HourPrecipitationChartView))
  {
    uint64_t v91 = sub_10017DF08(&qword_100E737F8);
    memcpy(v88, v89, *(void *)(*(void *)(v91 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(HourPrecipitationChartView - 8) + 16))(v88, v89, HourPrecipitationChartView);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v88, 0, 1, HourPrecipitationChartView);
  }
  uint64_t v92 = sub_10017DF08(&qword_100EB8DD0);
  *(void *)&v88[*(int *)(v92 + 28)] = *(void *)&v89[*(int *)(v92 + 28)];
  *(void *)(v96 + v94[8]) = *(void *)(v95 + v94[8]);
  swift_retain();
  swift_retain();
  return v96;
}

uint64_t *sub_100C02E38(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a2;
  int v5 = a1;
  sub_1000C1E18(a1, a2);
  v154 = a3;
  uint64_t v6 = a3[5];
  uint64_t v7 = (uint64_t *)((char *)v5 + v6);
  uint64_t v8 = (uint64_t *)((char *)v4 + v6);
  void *v7 = *(uint64_t *)((char *)v4 + v6);
  v7[1] = *(uint64_t *)((char *)v4 + v6 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7[2] = v8[2];
  v7[3] = v8[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7[4] = v8[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t HourPrecipitationDetailView = type metadata accessor for NextHourPrecipitationDetailViewModel.Model(0);
  uint64_t v10 = *(int *)(HourPrecipitationDetailView + 28);
  uint64_t v11 = (char *)v7 + v10;
  uint64_t v12 = (char *)v8 + v10;
  uint64_t HourPrecipitationChartViewModel = type metadata accessor for NextHourPrecipitationChartViewModel();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(HourPrecipitationChartViewModel - 8) + 24))(v11, v12, HourPrecipitationChartViewModel);
  uint64_t v155 = HourPrecipitationDetailView;
  uint64_t v14 = *(int *)(HourPrecipitationDetailView + 32);
  uint64_t v15 = (void *)((char *)v7 + v14);
  uint64_t v16 = (char *)v8 + v14;
  *uint64_t v15 = *(void *)((char *)v8 + v14);
  v15[1] = *(void *)((char *)v8 + v14 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = type metadata accessor for ConditionDetailMapViewModel();
  uint64_t v18 = *(int *)(v17 + 20);
  uint64_t v19 = (char *)v15 + v18;
  uint64_t v20 = &v16[v18];
  uint64_t v21 = type metadata accessor for Location();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  v157 = (int *)v17;
  uint64_t v22 = *(int *)(v17 + 24);
  uint64_t v23 = (void *)((char *)v15 + v22);
  uint64_t v24 = &v16[v22];
  uint64_t v25 = (int *)type metadata accessor for WeatherData(0);
  LODWORD(v19) = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v23, 1, (uint64_t)v25);
  int v26 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v24, 1, (uint64_t)v25);
  v156 = v8;
  if (v19)
  {
    if (v26)
    {
      uint64_t v27 = v15;
LABEL_6:
      uint64_t v28 = &qword_100E63850;
LABEL_7:
      uint64_t v29 = sub_10017DF08(v28);
      memcpy(v23, v24, *(void *)(*(void *)(v29 - 8) + 64));
LABEL_8:
      uint64_t v30 = v154;
LABEL_47:
      uint64_t v87 = v155;
      goto LABEL_48;
    }
    __dst = v16;
    v149 = v5;
    v152 = v4;
    *uint64_t v23 = *(void *)v24;
    v23[1] = *((void *)v24 + 1);
    uint64_t v31 = v25[5];
    uint64_t v32 = (char *)v23 + v31;
    uint64_t v33 = &v24[v31];
    uint64_t v34 = type metadata accessor for Locale();
    swift_bridgeObjectRetain();
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v33, 1, v34))
    {
      uint64_t v35 = sub_10017DF08(&qword_100E63730);
      memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v32, 0, 1, v34);
    }
    uint64_t v42 = v25[6];
    uint64_t v43 = (char *)v23 + v42;
    uint64_t v44 = &v24[v42];
    uint64_t v45 = type metadata accessor for WeatherDataModel();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 16))(v43, v44, v45);
    uint64_t v46 = v25[7];
    uint64_t v47 = (char *)v23 + v46;
    uint64_t v48 = &v24[v46];
    uint64_t v49 = sub_10017DF08(&qword_100E63738);
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v48, 1, v49))
    {
      uint64_t v50 = type metadata accessor for WeatherData.CachingState(0);
      memcpy(v47, v48, *(void *)(*(void *)(v50 - 8) + 64));
    }
    else
    {
      uint64_t v51 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(v47, v48, v51);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v47, 0, 1, v49);
    }
    uint64_t v16 = __dst;
    uint64_t v52 = v25[8];
    uint64_t v53 = (void *)((char *)v23 + v52);
    uint64_t v54 = &v24[v52];
    uint64_t v55 = type metadata accessor for WeatherData.WeatherStatisticsState(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v57 = type metadata accessor for WeatherStatisticsModel();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v57 - 8) + 16))(v53, v54, v57);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(v53, v54, *(void *)(*(void *)(v55 - 8) + 64));
        goto LABEL_24;
      }
      *uint64_t v53 = *(void *)v54;
      v53[1] = *((void *)v54 + 1);
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
LABEL_24:
    uint64_t v58 = v25[9];
    uint64_t v59 = (char *)v23 + v58;
    uint64_t v60 = &v24[v58];
    uint64_t v61 = type metadata accessor for WeatherDataOverrides();
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v60, 1, v61))
    {
      uint64_t v62 = v59;
      uint64_t v27 = v15;
      uint64_t v63 = sub_10017DF08(&qword_100E63740);
      memcpy(v62, v60, *(void *)(*(void *)(v63 - 8) + 64));
    }
    else
    {
      uint64_t v64 = type metadata accessor for Date();
      if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v60, 1, v64))
      {
        uint64_t v65 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
        memcpy(v59, v60, *(void *)(*(void *)(v65 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 16))(v59, v60, v64);
        _s7Weather24LocationCompositionStateOwst_0((uint64_t)v59, 0, 1, v64);
      }
      uint64_t v84 = *(int *)(v61 + 20);
      uint64_t v145 = (uint64_t)v59;
      __dstb = &v59[v84];
      uint64_t v85 = &v60[v84];
      uint64_t v27 = v15;
      if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v85, 1, v64))
      {
        uint64_t v86 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
        memcpy(__dstb, v85, *(void *)(*(void *)(v86 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 16))(__dstb, v85, v64);
        _s7Weather24LocationCompositionStateOwst_0((uint64_t)__dstb, 0, 1, v64);
      }
      _s7Weather24LocationCompositionStateOwst_0(v145, 0, 1, v61);
    }
    int v5 = v149;
    uint64_t v4 = v152;
    uint64_t v30 = v154;
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v23, 0, 1, (uint64_t)v25);
    goto LABEL_47;
  }
  if (v26)
  {
    uint64_t v27 = v15;
    sub_100C0860C((uint64_t)v23, (void (*)(void))type metadata accessor for WeatherData);
    goto LABEL_6;
  }
  __dsta = v16;
  v150 = v5;
  v153 = v4;
  *uint64_t v23 = *(void *)v24;
  v23[1] = *((void *)v24 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v36 = v25[5];
  uint64_t v37 = (char *)v23 + v36;
  uint64_t v38 = &v24[v36];
  uint64_t v39 = type metadata accessor for Locale();
  int v40 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v37, 1, v39);
  int v41 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v38, 1, v39);
  if (v40)
  {
    if (!v41)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v38, v39);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v37, 0, 1, v39);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  uint64_t v66 = *(void *)(v39 - 8);
  if (v41)
  {
    (*(void (**)(char *, uint64_t))(v66 + 8))(v37, v39);
LABEL_30:
    uint64_t v67 = sub_10017DF08(&qword_100E63730);
    memcpy(v37, v38, *(void *)(*(void *)(v67 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v66 + 24))(v37, v38, v39);
LABEL_31:
  uint64_t v68 = v25[6];
  uint64_t v69 = (char *)v23 + v68;
  uint64_t v70 = &v24[v68];
  uint64_t v71 = type metadata accessor for WeatherDataModel();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 24))(v69, v70, v71);
  uint64_t v72 = v25[7];
  uint64_t v73 = (char *)v23 + v72;
  uint64_t v74 = &v24[v72];
  uint64_t v75 = sub_10017DF08(&qword_100E63738);
  LODWORD(v70) = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v73, 1, v75);
  int v76 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v74, 1, v75);
  if (v70)
  {
    if (!v76)
    {
      uint64_t v77 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v77 - 8) + 16))(v73, v74, v77);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v73, 0, 1, v75);
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  if (v76)
  {
    sub_100178110((uint64_t)v73, &qword_100E63738);
LABEL_36:
    uint64_t v78 = type metadata accessor for WeatherData.CachingState(0);
    memcpy(v73, v74, *(void *)(*(void *)(v78 - 8) + 64));
    goto LABEL_37;
  }
  uint64_t v129 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v129 - 8) + 24))(v73, v74, v129);
LABEL_37:
  int v5 = v150;
  uint64_t v4 = v153;
  uint64_t v16 = __dsta;
  if (v150 == v153) {
    goto LABEL_67;
  }
  uint64_t v79 = v25[8];
  uint64_t v80 = (void *)((char *)v23 + v79);
  uint64_t v81 = &v24[v79];
  sub_100C0860C((uint64_t)v23 + v79, (void (*)(void))type metadata accessor for WeatherData.WeatherStatisticsState);
  uint64_t v82 = type metadata accessor for WeatherData.WeatherStatisticsState(0);
  int v83 = swift_getEnumCaseMultiPayload();
  if (v83 == 1)
  {
    uint64_t v122 = type metadata accessor for WeatherStatisticsModel();
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v122 - 8) + 16))(v80, v81, v122);
  }
  else
  {
    if (v83)
    {
      memcpy(v80, v81, *(void *)(*(void *)(v82 - 8) + 64));
      goto LABEL_66;
    }
    void *v80 = *(void *)v81;
    v80[1] = *((void *)v81 + 1);
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
LABEL_66:
  int v5 = v150;
  uint64_t v4 = v153;
LABEL_67:
  uint64_t v123 = v25[9];
  uint64_t v23 = (void *)((char *)v23 + v123);
  v24 += v123;
  uint64_t v124 = type metadata accessor for WeatherDataOverrides();
  int v125 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v23, 1, v124);
  int v126 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v24, 1, v124);
  if (v125)
  {
    if (!v126)
    {
      uint64_t v127 = type metadata accessor for Date();
      if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v24, 1, v127))
      {
        uint64_t v128 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
        memcpy(v23, v24, *(void *)(*(void *)(v128 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, char *, uint64_t))(*(void *)(v127 - 8) + 16))(v23, v24, v127);
        _s7Weather24LocationCompositionStateOwst_0((uint64_t)v23, 0, 1, v127);
      }
      uint64_t v133 = *(int *)(v124 + 20);
      v151 = (char *)v23 + v133;
      v134 = &v24[v133];
      uint64_t v27 = v15;
      if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v134, 1, v127))
      {
        uint64_t v135 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
        memcpy(v151, v134, *(void *)(*(void *)(v135 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v127 - 8) + 16))(v151, v134, v127);
        _s7Weather24LocationCompositionStateOwst_0((uint64_t)v151, 0, 1, v127);
      }
      uint64_t v4 = v153;
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v23, 0, 1, v124);
      goto LABEL_8;
    }
    uint64_t v27 = v15;
    goto LABEL_72;
  }
  if (v126)
  {
    uint64_t v27 = v15;
    sub_100C0860C((uint64_t)v23, (void (*)(void))type metadata accessor for WeatherDataOverrides);
LABEL_72:
    uint64_t v28 = &qword_100E63740;
    goto LABEL_7;
  }
  uint64_t v130 = type metadata accessor for Date();
  int v131 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v23, 1, v130);
  int v132 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v24, 1, v130);
  if (v131)
  {
    if (!v132)
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v130 - 8) + 16))(v23, v24, v130);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v23, 0, 1, v130);
      goto LABEL_88;
    }
    goto LABEL_87;
  }
  uint64_t v136 = *(void *)(v130 - 8);
  if (v132)
  {
    (*(void (**)(void *, uint64_t))(v136 + 8))(v23, v130);
LABEL_87:
    uint64_t v137 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
    memcpy(v23, v24, *(void *)(*(void *)(v137 - 8) + 64));
    goto LABEL_88;
  }
  (*(void (**)(void *, char *, uint64_t))(v136 + 24))(v23, v24, v130);
LABEL_88:
  uint64_t v138 = *(int *)(v124 + 20);
  v139 = (char *)v23 + v138;
  v140 = &v24[v138];
  int v141 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v139, 1, v130);
  int v142 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v140, 1, v130);
  uint64_t v27 = v15;
  if (!v141)
  {
    uint64_t v143 = *(void *)(v130 - 8);
    uint64_t v30 = v154;
    if (!v142)
    {
      (*(void (**)(char *, char *, uint64_t))(v143 + 24))(v139, v140, v130);
      goto LABEL_94;
    }
    (*(void (**)(char *, uint64_t))(v143 + 8))(v139, v130);
    goto LABEL_93;
  }
  uint64_t v30 = v154;
  if (v142)
  {
LABEL_93:
    uint64_t v144 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
    memcpy(v139, v140, *(void *)(*(void *)(v144 - 8) + 64));
    goto LABEL_94;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v130 - 8) + 16))(v139, v140, v130);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v139, 0, 1, v130);
LABEL_94:
  uint64_t v4 = v153;
  uint64_t v87 = v155;
  uint64_t v16 = __dsta;
LABEL_48:
  uint64_t v88 = v157[7];
  uint64_t v89 = (void *)((char *)v27 + v88);
  uint64_t v90 = &v16[v88];
  *uint64_t v89 = *(void *)v90;
  v89[1] = *((void *)v90 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v91 = v157[8];
  uint64_t v92 = (char *)v27 + v91;
  uint64_t v93 = v16;
  uint64_t v94 = &v16[v91];
  uint64_t v95 = type metadata accessor for WeatherMapOverlayKind();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v95 - 8) + 24))(v92, v94, v95);
  *((unsigned char *)v27 + v157[9]) = v93[v157[9]];
  uint64_t v96 = *(int *)(v87 + 36);
  uint64_t v97 = (char *)v7 + v96;
  uint64_t v98 = (char *)v156 + v96;
  uint64_t v99 = type metadata accessor for TimeZone();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v99 - 8) + 24))(v97, v98, v99);
  uint64_t v100 = *(int *)(v87 + 40);
  v101 = (char *)v7 + v100;
  uint64_t v102 = (char *)v156 + v100;
  uint64_t v103 = sub_10017DF08(&qword_100E6E900);
  int v104 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v101, 1, v103);
  int v105 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v102, 1, v103);
  if (v104)
  {
    if (!v105)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v103 - 8) + 16))(v101, v102, v103);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v101, 0, 1, v103);
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  uint64_t v106 = *(void *)(v103 - 8);
  if (v105)
  {
    (*(void (**)(char *, uint64_t))(v106 + 8))(v101, v103);
LABEL_53:
    uint64_t v107 = sub_10017DF08(&qword_100E6E8F8);
    memcpy(v101, v102, *(void *)(*(void *)(v107 - 8) + 64));
    goto LABEL_54;
  }
  (*(void (**)(char *, char *, uint64_t))(v106 + 24))(v101, v102, v103);
LABEL_54:
  uint64_t v108 = v30[6];
  uint64_t v109 = (char *)v5 + v108;
  uint64_t v110 = (char *)v4 + v108;
  long long v111 = *(_OWORD *)v110;
  v109[16] = v110[16];
  *(_OWORD *)uint64_t v109 = v111;
  *((void *)v109 + 3) = *((void *)v110 + 3);
  swift_retain();
  swift_release();
  uint64_t v112 = v30[7];
  uint64_t v113 = (char *)v5 + v112;
  v114 = (char *)v4 + v112;
  uint64_t HourPrecipitationChartView = type metadata accessor for NextHourPrecipitationChartViewModel.Point();
  int v116 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v113, 1, HourPrecipitationChartView);
  int v117 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v114, 1, HourPrecipitationChartView);
  if (!v116)
  {
    uint64_t v118 = *(void *)(HourPrecipitationChartView - 8);
    if (!v117)
    {
      (*(void (**)(char *, char *, uint64_t))(v118 + 24))(v113, v114, HourPrecipitationChartView);
      goto LABEL_60;
    }
    (*(void (**)(char *, uint64_t))(v118 + 8))(v113, HourPrecipitationChartView);
    goto LABEL_59;
  }
  if (v117)
  {
LABEL_59:
    uint64_t v119 = sub_10017DF08(&qword_100E737F8);
    memcpy(v113, v114, *(void *)(*(void *)(v119 - 8) + 64));
    goto LABEL_60;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(HourPrecipitationChartView - 8) + 16))(v113, v114, HourPrecipitationChartView);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v113, 0, 1, HourPrecipitationChartView);
LABEL_60:
  uint64_t v120 = sub_10017DF08(&qword_100EB8DD0);
  *(void *)&v113[*(int *)(v120 + 28)] = *(void *)&v114[*(int *)(v120 + 28)];
  swift_retain();
  swift_release();
  *(uint64_t *)((char *)v5 + v30[8]) = *(uint64_t *)((char *)v4 + v30[8]);
  swift_retain();
  swift_release();
  return v5;
}

uint64_t sub_100C04028(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(a2 + v7 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(a2 + v7 + 32);
  uint64_t HourPrecipitationDetailView = type metadata accessor for NextHourPrecipitationDetailViewModel.Model(0);
  uint64_t v12 = *(int *)(HourPrecipitationDetailView + 28);
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  uint64_t HourPrecipitationChartViewModel = type metadata accessor for NextHourPrecipitationChartViewModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(HourPrecipitationChartViewModel - 8) + 32))(v13, v14, HourPrecipitationChartViewModel);
  uint64_t v90 = HourPrecipitationDetailView;
  uint64_t v16 = *(int *)(HourPrecipitationDetailView + 32);
  uint64_t v17 = v8 + v16;
  uint64_t v18 = v9 + v16;
  *(_OWORD *)(v8 + v16) = *(_OWORD *)(v9 + v16);
  uint64_t v19 = type metadata accessor for ConditionDetailMapViewModel();
  uint64_t v20 = *(int *)(v19 + 20);
  uint64_t v21 = v17 + v20;
  uint64_t v22 = v18 + v20;
  uint64_t v23 = type metadata accessor for Location();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
  uint64_t v91 = (int *)v19;
  uint64_t v24 = *(int *)(v19 + 24);
  uint64_t v25 = (_OWORD *)(v17 + v24);
  int v26 = (_OWORD *)(v18 + v24);
  uint64_t v27 = (int *)type metadata accessor for WeatherData(0);
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v26, 1, (uint64_t)v27))
  {
    uint64_t v28 = sub_10017DF08(&qword_100E63850);
    memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    uint64_t v87 = v3;
    uint64_t v88 = v4;
    *uint64_t v25 = *v26;
    uint64_t v29 = v27[5];
    uint64_t v89 = v25;
    uint64_t v30 = (char *)v25 + v29;
    uint64_t v31 = (char *)v26 + v29;
    uint64_t v32 = type metadata accessor for Locale();
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v31, 1, v32))
    {
      uint64_t v33 = sub_10017DF08(&qword_100E63730);
      memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v30, 0, 1, v32);
    }
    uint64_t v34 = v27[6];
    uint64_t v35 = (char *)v89 + v34;
    uint64_t v36 = (char *)v26 + v34;
    uint64_t v37 = type metadata accessor for WeatherDataModel();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 32))(v35, v36, v37);
    uint64_t v38 = v27[7];
    uint64_t v39 = (char *)v89 + v38;
    int v40 = (char *)v26 + v38;
    uint64_t v41 = sub_10017DF08(&qword_100E63738);
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v40, 1, v41))
    {
      uint64_t v42 = type metadata accessor for WeatherData.CachingState(0);
      memcpy(v39, v40, *(void *)(*(void *)(v42 - 8) + 64));
    }
    else
    {
      uint64_t v43 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 32))(v39, v40, v43);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v39, 0, 1, v41);
    }
    uint64_t v44 = v27[8];
    uint64_t v45 = (char *)v89 + v44;
    uint64_t v46 = (char *)v26 + v44;
    uint64_t v47 = type metadata accessor for WeatherData.WeatherStatisticsState(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v48 = type metadata accessor for WeatherStatisticsModel();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 32))(v45, v46, v48);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v45, v46, *(void *)(*(void *)(v47 - 8) + 64));
    }
    uint64_t v49 = v27[9];
    uint64_t v50 = (uint64_t)v89;
    uint64_t v51 = (char *)v89 + v49;
    uint64_t v52 = (char *)v26 + v49;
    uint64_t v53 = type metadata accessor for WeatherDataOverrides();
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v52, 1, v53))
    {
      uint64_t v54 = sub_10017DF08(&qword_100E63740);
      memcpy(v51, v52, *(void *)(*(void *)(v54 - 8) + 64));
      uint64_t v3 = v87;
      uint64_t v4 = v88;
    }
    else
    {
      __dst = v51;
      uint64_t v55 = type metadata accessor for Date();
      if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v52, 1, v55))
      {
        uint64_t v56 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
        uint64_t v57 = __dst;
        memcpy(__dst, v52, *(void *)(*(void *)(v56 - 8) + 64));
      }
      else
      {
        uint64_t v57 = __dst;
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 32))(__dst, v52, v55);
        _s7Weather24LocationCompositionStateOwst_0((uint64_t)__dst, 0, 1, v55);
      }
      uint64_t v58 = *(int *)(v53 + 20);
      uint64_t v85 = &v57[v58];
      uint64_t v59 = &v52[v58];
      if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)&v52[v58], 1, v55))
      {
        uint64_t v60 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
        memcpy(v85, v59, *(void *)(*(void *)(v60 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 32))(v85, v59, v55);
        _s7Weather24LocationCompositionStateOwst_0((uint64_t)v85, 0, 1, v55);
      }
      uint64_t v3 = v87;
      uint64_t v4 = v88;
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)__dst, 0, 1, v53);
      uint64_t v50 = (uint64_t)v89;
    }
    _s7Weather24LocationCompositionStateOwst_0(v50, 0, 1, (uint64_t)v27);
  }
  *(_OWORD *)(v17 + v91[7]) = *(_OWORD *)(v18 + v91[7]);
  uint64_t v61 = v91[8];
  uint64_t v62 = v17 + v61;
  uint64_t v63 = v18 + v61;
  uint64_t v64 = type metadata accessor for WeatherMapOverlayKind();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 32))(v62, v63, v64);
  *(unsigned char *)(v17 + v91[9]) = *(unsigned char *)(v18 + v91[9]);
  uint64_t v65 = *(int *)(v90 + 36);
  uint64_t v66 = v8 + v65;
  uint64_t v67 = v9 + v65;
  uint64_t v68 = type metadata accessor for TimeZone();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 32))(v66, v67, v68);
  uint64_t v69 = *(int *)(v90 + 40);
  uint64_t v70 = (void *)(v8 + v69);
  uint64_t v71 = (const void *)(v9 + v69);
  uint64_t v72 = sub_10017DF08(&qword_100E6E900);
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v71, 1, v72))
  {
    uint64_t v73 = sub_10017DF08(&qword_100E6E8F8);
    memcpy(v70, v71, *(void *)(*(void *)(v73 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v72 - 8) + 32))(v70, v71, v72);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v70, 0, 1, v72);
  }
  uint64_t v74 = v3[6];
  uint64_t v75 = v3[7];
  int v76 = (_OWORD *)(a1 + v74);
  uint64_t v77 = (_OWORD *)(v4 + v74);
  long long v78 = v77[1];
  *int v76 = *v77;
  v76[1] = v78;
  uint64_t v79 = (char *)(a1 + v75);
  uint64_t v80 = (char *)(v4 + v75);
  uint64_t HourPrecipitationChartView = type metadata accessor for NextHourPrecipitationChartViewModel.Point();
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v80, 1, HourPrecipitationChartView))
  {
    uint64_t v82 = sub_10017DF08(&qword_100E737F8);
    memcpy(v79, v80, *(void *)(*(void *)(v82 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(HourPrecipitationChartView - 8) + 32))(v79, v80, HourPrecipitationChartView);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v79, 0, 1, HourPrecipitationChartView);
  }
  uint64_t v83 = sub_10017DF08(&qword_100EB8DD0);
  *(void *)&v79[*(int *)(v83 + 28)] = *(void *)&v80[*(int *)(v83 + 28)];
  *(void *)(a1 + v3[8]) = *(void *)(v4 + v3[8]);
  return a1;
}

uint64_t sub_100C04820(uint64_t a1, uint64_t a2, int *a3)
{
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  void *v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_bridgeObjectRelease();
  v8[4] = v9[4];
  swift_bridgeObjectRelease();
  uint64_t HourPrecipitationDetailView = type metadata accessor for NextHourPrecipitationDetailViewModel.Model(0);
  uint64_t v13 = *(int *)(HourPrecipitationDetailView + 28);
  uint64_t v14 = (char *)v8 + v13;
  uint64_t v15 = (char *)v9 + v13;
  uint64_t HourPrecipitationChartViewModel = type metadata accessor for NextHourPrecipitationChartViewModel();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(HourPrecipitationChartViewModel - 8) + 40))(v14, v15, HourPrecipitationChartViewModel);
  uint64_t v157 = HourPrecipitationDetailView;
  uint64_t v17 = *(int *)(HourPrecipitationDetailView + 32);
  uint64_t v18 = (void *)((char *)v8 + v17);
  uint64_t v19 = (char *)v9 + v17;
  uint64_t v20 = *(void *)((char *)v9 + v17 + 8);
  *uint64_t v18 = *(void *)((char *)v9 + v17);
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = type metadata accessor for ConditionDetailMapViewModel();
  uint64_t v22 = *(int *)(v21 + 20);
  uint64_t v23 = (char *)v18 + v22;
  uint64_t v24 = &v19[v22];
  uint64_t v25 = type metadata accessor for Location();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 40))(v23, v24, v25);
  v158 = (int *)v21;
  uint64_t v26 = *(int *)(v21 + 24);
  __dst = v18;
  uint64_t v27 = (void *)((char *)v18 + v26);
  uint64_t v28 = &v19[v26];
  uint64_t v29 = (int *)type metadata accessor for WeatherData(0);
  LODWORD(v23) = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v27, 1, (uint64_t)v29);
  uint64_t v159 = (uint64_t)v29;
  int v30 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v28, 1, (uint64_t)v29);
  if (!v23)
  {
    if (v30)
    {
      sub_100C0860C((uint64_t)v27, (void (*)(void))type metadata accessor for WeatherData);
      goto LABEL_7;
    }
    v150 = v19;
    uint64_t v152 = a2;
    v154 = a3;
    uint64_t v39 = *((void *)v28 + 1);
    void *v27 = *(void *)v28;
    v27[1] = v39;
    swift_bridgeObjectRelease();
    uint64_t v40 = v29[5];
    uint64_t v41 = (char *)v27 + v40;
    uint64_t v42 = &v28[v40];
    uint64_t v43 = type metadata accessor for Locale();
    int v44 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v41, 1, v43);
    int v45 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v42, 1, v43);
    if (v44)
    {
      if (!v45)
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 32))(v41, v42, v43);
        _s7Weather24LocationCompositionStateOwst_0((uint64_t)v41, 0, 1, v43);
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v68 = *(void *)(v43 - 8);
      if (!v45)
      {
        (*(void (**)(char *, char *, uint64_t))(v68 + 40))(v41, v42, v43);
LABEL_25:
        uint64_t v70 = v29[6];
        uint64_t v71 = (char *)v27 + v70;
        uint64_t v72 = &v28[v70];
        uint64_t v73 = type metadata accessor for WeatherDataModel();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 40))(v71, v72, v73);
        uint64_t v74 = v29[7];
        uint64_t v75 = (char *)v27 + v74;
        int v76 = &v28[v74];
        uint64_t v77 = sub_10017DF08(&qword_100E63738);
        LODWORD(v72) = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v75, 1, v77);
        int v78 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v76, 1, v77);
        if (v72)
        {
          if (!v78)
          {
            uint64_t v79 = type metadata accessor for Date();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v79 - 8) + 32))(v75, v76, v79);
            _s7Weather24LocationCompositionStateOwst_0((uint64_t)v75, 0, 1, v77);
            goto LABEL_31;
          }
        }
        else
        {
          if (!v78)
          {
            uint64_t v98 = type metadata accessor for Date();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v98 - 8) + 40))(v75, v76, v98);
LABEL_31:
            a2 = v152;
            a3 = v154;
            uint64_t v37 = __dst;
            if (a1 != v152)
            {
              uint64_t v81 = *(int *)(v159 + 32);
              uint64_t v82 = (char *)v27 + v81;
              uint64_t v83 = &v28[v81];
              sub_100C0860C((uint64_t)v27 + v81, (void (*)(void))type metadata accessor for WeatherData.WeatherStatisticsState);
              uint64_t v84 = type metadata accessor for WeatherData.WeatherStatisticsState(0);
              if (swift_getEnumCaseMultiPayload() == 1)
              {
                uint64_t v85 = type metadata accessor for WeatherStatisticsModel();
                (*(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 32))(v82, v83, v85);
                swift_storeEnumTagMultiPayload();
              }
              else
              {
                memcpy(v82, v83, *(void *)(*(void *)(v84 - 8) + 64));
              }
              a2 = v152;
              a3 = v154;
            }
            uint64_t v86 = *(int *)(v159 + 36);
            uint64_t v87 = (char *)v27 + v86;
            uint64_t v88 = &v28[v86];
            uint64_t v89 = type metadata accessor for WeatherDataOverrides();
            int v90 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v87, 1, v89);
            int v91 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v88, 1, v89);
            if (v90)
            {
              if (!v91)
              {
                uint64_t v92 = type metadata accessor for Date();
                if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v88, 1, v92))
                {
                  uint64_t v93 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
                  memcpy(v87, v88, *(void *)(*(void *)(v93 - 8) + 64));
                }
                else
                {
                  (*(void (**)(char *, char *, uint64_t))(*(void *)(v92 - 8) + 32))(v87, v88, v92);
                  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v87, 0, 1, v92);
                }
                uint64_t v102 = *(int *)(v89 + 20);
                uint64_t v103 = &v87[v102];
                int v104 = &v88[v102];
                if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v104, 1, v92))
                {
                  uint64_t v105 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
                  memcpy(v103, v104, *(void *)(*(void *)(v105 - 8) + 64));
                }
                else
                {
                  (*(void (**)(char *, char *, uint64_t))(*(void *)(v92 - 8) + 32))(v103, v104, v92);
                  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v103, 0, 1, v92);
                }
                a3 = v154;
                _s7Weather24LocationCompositionStateOwst_0((uint64_t)v87, 0, 1, v89);
                goto LABEL_59;
              }
LABEL_42:
              uint64_t v94 = sub_10017DF08(&qword_100E63740);
              memcpy(v87, v88, *(void *)(*(void *)(v94 - 8) + 64));
LABEL_59:
              uint64_t v38 = v157;
LABEL_60:
              uint64_t v19 = v150;
              goto LABEL_61;
            }
            if (v91)
            {
              sub_100C0860C((uint64_t)v87, (void (*)(void))type metadata accessor for WeatherDataOverrides);
              goto LABEL_42;
            }
            uint64_t v99 = type metadata accessor for Date();
            int v100 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v87, 1, v99);
            int v101 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v88, 1, v99);
            if (v100)
            {
              if (!v101)
              {
                (*(void (**)(char *, char *, uint64_t))(*(void *)(v99 - 8) + 32))(v87, v88, v99);
                _s7Weather24LocationCompositionStateOwst_0((uint64_t)v87, 0, 1, v99);
                goto LABEL_79;
              }
            }
            else
            {
              uint64_t v140 = *(void *)(v99 - 8);
              if (!v101)
              {
                (*(void (**)(char *, char *, uint64_t))(v140 + 40))(v87, v88, v99);
LABEL_79:
                uint64_t v142 = *(int *)(v89 + 20);
                uint64_t v143 = &v87[v142];
                uint64_t v144 = &v88[v142];
                int v145 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v143, 1, v99);
                int v146 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v144, 1, v99);
                if (v145)
                {
                  uint64_t v38 = v157;
                  if (!v146)
                  {
                    (*(void (**)(char *, char *, uint64_t))(*(void *)(v99 - 8) + 32))(v143, v144, v99);
                    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v143, 0, 1, v99);
LABEL_85:
                    a3 = v154;
                    goto LABEL_60;
                  }
                }
                else
                {
                  uint64_t v147 = *(void *)(v99 - 8);
                  uint64_t v38 = v157;
                  if (!v146)
                  {
                    (*(void (**)(char *, char *, uint64_t))(v147 + 40))(v143, v144, v99);
                    goto LABEL_85;
                  }
                  (*(void (**)(char *, uint64_t))(v147 + 8))(v143, v99);
                }
                uint64_t v148 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
                memcpy(v143, v144, *(void *)(*(void *)(v148 - 8) + 64));
                goto LABEL_85;
              }
              (*(void (**)(char *, uint64_t))(v140 + 8))(v87, v99);
            }
            uint64_t v141 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
            memcpy(v87, v88, *(void *)(*(void *)(v141 - 8) + 64));
            goto LABEL_79;
          }
          sub_100178110((uint64_t)v75, &qword_100E63738);
        }
        uint64_t v80 = type metadata accessor for WeatherData.CachingState(0);
        memcpy(v75, v76, *(void *)(*(void *)(v80 - 8) + 64));
        goto LABEL_31;
      }
      (*(void (**)(char *, uint64_t))(v68 + 8))(v41, v43);
    }
    uint64_t v69 = sub_10017DF08(&qword_100E63730);
    memcpy(v41, v42, *(void *)(*(void *)(v69 - 8) + 64));
    goto LABEL_25;
  }
  if (v30)
  {
LABEL_7:
    uint64_t v36 = sub_10017DF08(&qword_100E63850);
    memcpy(v27, v28, *(void *)(*(void *)(v36 - 8) + 64));
    uint64_t v37 = __dst;
    uint64_t v38 = v157;
    goto LABEL_61;
  }
  uint64_t v151 = a2;
  v153 = a3;
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  uint64_t v31 = v29[5];
  uint64_t v32 = (char *)v27 + v31;
  uint64_t v33 = &v28[v31];
  uint64_t v34 = type metadata accessor for Locale();
  v149 = v19;
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v33, 1, v34))
  {
    uint64_t v35 = sub_10017DF08(&qword_100E63730);
    memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v32, 0, 1, v34);
  }
  uint64_t v46 = v29[6];
  uint64_t v47 = (char *)v27 + v46;
  uint64_t v48 = &v28[v46];
  uint64_t v49 = type metadata accessor for WeatherDataModel();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 32))(v47, v48, v49);
  uint64_t v50 = v29[7];
  uint64_t v51 = (char *)v27 + v50;
  uint64_t v52 = &v28[v50];
  uint64_t v53 = sub_10017DF08(&qword_100E63738);
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v52, 1, v53))
  {
    uint64_t v54 = type metadata accessor for WeatherData.CachingState(0);
    memcpy(v51, v52, *(void *)(*(void *)(v54 - 8) + 64));
  }
  else
  {
    uint64_t v55 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 32))(v51, v52, v55);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v51, 0, 1, v53);
  }
  uint64_t v19 = v149;
  uint64_t v37 = __dst;
  uint64_t v56 = *(int *)(v159 + 32);
  uint64_t v57 = (char *)v27 + v56;
  uint64_t v58 = &v28[v56];
  uint64_t v59 = type metadata accessor for WeatherData.WeatherStatisticsState(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v60 = type metadata accessor for WeatherStatisticsModel();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 32))(v57, v58, v60);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v57, v58, *(void *)(*(void *)(v59 - 8) + 64));
  }
  uint64_t v61 = *(int *)(v159 + 36);
  uint64_t v62 = (char *)v27 + v61;
  uint64_t v63 = &v28[v61];
  uint64_t v64 = type metadata accessor for WeatherDataOverrides();
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v63, 1, v64))
  {
    uint64_t v65 = sub_10017DF08(&qword_100E63740);
    memcpy(v62, v63, *(void *)(*(void *)(v65 - 8) + 64));
  }
  else
  {
    uint64_t v66 = type metadata accessor for Date();
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v63, 1, v66))
    {
      uint64_t v67 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
      memcpy(v62, v63, *(void *)(*(void *)(v67 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32))(v62, v63, v66);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v62, 0, 1, v66);
    }
    uint64_t v95 = *(int *)(v64 + 20);
    __dsta = &v62[v95];
    uint64_t v96 = &v63[v95];
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v96, 1, v66))
    {
      uint64_t v97 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
      memcpy(__dsta, v96, *(void *)(*(void *)(v97 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32))(__dsta, v96, v66);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)__dsta, 0, 1, v66);
    }
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v62, 0, 1, v64);
  }
  a2 = v151;
  a3 = v153;
  uint64_t v38 = v157;
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v27, 0, 1, v159);
LABEL_61:
  uint64_t v106 = v158[7];
  uint64_t v107 = &v37[v106];
  uint64_t v108 = &v19[v106];
  uint64_t v110 = *(void *)v108;
  uint64_t v109 = *((void *)v108 + 1);
  *uint64_t v107 = v110;
  v107[1] = v109;
  swift_bridgeObjectRelease();
  uint64_t v111 = v158[8];
  uint64_t v112 = &v37[v111];
  uint64_t v113 = v19;
  v114 = &v19[v111];
  uint64_t v115 = type metadata accessor for WeatherMapOverlayKind();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v115 - 8) + 40))(v112, v114, v115);
  v37[v158[9]] = v113[v158[9]];
  uint64_t v116 = *(int *)(v38 + 36);
  int v117 = (char *)v8 + v116;
  uint64_t v118 = (char *)v9 + v116;
  uint64_t v119 = type metadata accessor for TimeZone();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v119 - 8) + 40))(v117, v118, v119);
  uint64_t v120 = *(int *)(v38 + 40);
  uint64_t v121 = (char *)v8 + v120;
  uint64_t v122 = (char *)v9 + v120;
  uint64_t v123 = sub_10017DF08(&qword_100E6E900);
  LODWORD(v113) = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v121, 1, v123);
  int v124 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v122, 1, v123);
  if (v113)
  {
    if (!v124)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v123 - 8) + 32))(v121, v122, v123);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v121, 0, 1, v123);
      goto LABEL_67;
    }
    goto LABEL_66;
  }
  uint64_t v125 = *(void *)(v123 - 8);
  if (v124)
  {
    (*(void (**)(char *, uint64_t))(v125 + 8))(v121, v123);
LABEL_66:
    uint64_t v126 = sub_10017DF08(&qword_100E6E8F8);
    memcpy(v121, v122, *(void *)(*(void *)(v126 - 8) + 64));
    goto LABEL_67;
  }
  (*(void (**)(char *, char *, uint64_t))(v125 + 40))(v121, v122, v123);
LABEL_67:
  uint64_t v127 = a3[6];
  uint64_t v128 = a1 + v127;
  uint64_t v129 = a2 + v127;
  *(_OWORD *)uint64_t v128 = *(_OWORD *)v129;
  *(unsigned char *)(v128 + 16) = *(unsigned char *)(v129 + 16);
  *(void *)(v128 + 24) = *(void *)(v129 + 24);
  swift_release();
  uint64_t v130 = a3[7];
  int v131 = (char *)(a1 + v130);
  int v132 = (char *)(a2 + v130);
  uint64_t HourPrecipitationChartView = type metadata accessor for NextHourPrecipitationChartViewModel.Point();
  int v134 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v131, 1, HourPrecipitationChartView);
  int v135 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v132, 1, HourPrecipitationChartView);
  if (!v134)
  {
    uint64_t v136 = *(void *)(HourPrecipitationChartView - 8);
    if (!v135)
    {
      (*(void (**)(char *, char *, uint64_t))(v136 + 40))(v131, v132, HourPrecipitationChartView);
      goto LABEL_73;
    }
    (*(void (**)(char *, uint64_t))(v136 + 8))(v131, HourPrecipitationChartView);
    goto LABEL_72;
  }
  if (v135)
  {
LABEL_72:
    uint64_t v137 = sub_10017DF08(&qword_100E737F8);
    memcpy(v131, v132, *(void *)(*(void *)(v137 - 8) + 64));
    goto LABEL_73;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(HourPrecipitationChartView - 8) + 32))(v131, v132, HourPrecipitationChartView);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v131, 0, 1, HourPrecipitationChartView);
LABEL_73:
  uint64_t v138 = sub_10017DF08(&qword_100EB8DD0);
  *(void *)&v131[*(int *)(v138 + 28)] = *(void *)&v132[*(int *)(v138 + 28)];
  swift_release();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_release();
  return a1;
}

uint64_t sub_100C05964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100C05978);
}

uint64_t sub_100C05978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    type metadata accessor for NextHourPrecipitationDetailViewModel.Model(0);
    sub_100162F30();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v10 = sub_10017DF08(&qword_100EB8DD0);
      uint64_t v11 = *(int *)(a3 + 28);
    }
    return _s7Weather24LocationCompositionStateOwet_0(a1 + v11, a2, v10);
  }
}

uint64_t sub_100C05A28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100C05A3C);
}

uint64_t sub_100C05A3C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    type metadata accessor for NextHourPrecipitationDetailViewModel.Model(0);
    sub_100162F30();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = sub_10017DF08(&qword_100EB8DD0);
      uint64_t v11 = *(int *)(a4 + 28);
    }
    return _s7Weather24LocationCompositionStateOwst_0(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_100C05AE8()
{
  type metadata accessor for NextHourPrecipitationDetailViewModel.Model(319);
  if (v0 <= 0x3F)
  {
    sub_100C05BD0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100C05BD0()
{
  if (!qword_100EB8E40)
  {
    sub_10018C6DC(&qword_100E737F8);
    unint64_t v0 = type metadata accessor for State();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100EB8E40);
    }
  }
}

unint64_t sub_100C05C30()
{
  unint64_t result = qword_100EB8E80;
  if (!qword_100EB8E80)
  {
    sub_10018C6DC(&qword_100EB8E88);
    sub_100C08514(&qword_100EB8DC8, (void (*)(uint64_t))type metadata accessor for NextHourPrecipitationDetailInnerView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8E80);
  }
  return result;
}

uint64_t sub_100C05CDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100C05CF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v94 = a1;
  uint64_t v88 = type metadata accessor for AutomationInfo(0);
  __chkstk_darwin(v88);
  uint64_t v89 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = type metadata accessor for ScrollIndicatorVisibility();
  uint64_t v86 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  uint64_t v77 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_10017DF08(&qword_100E651D0);
  __chkstk_darwin(v76);
  uint64_t v95 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_10017DF08(&qword_100EB8E90);
  uint64_t v74 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v93 = (char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_10017DF08(&qword_100EB8E98);
  uint64_t v80 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v96 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_10017DF08(&qword_100E7A140);
  uint64_t v84 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  uint64_t v82 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10017DF08(&qword_100E7A148);
  __chkstk_darwin(v9 - 8);
  uint64_t v79 = (uint64_t)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v78 = (uint64_t)&v74 - v12;
  __chkstk_darwin(v13);
  uint64_t v83 = (uint64_t)&v74 - v14;
  uint64_t HourPrecipitationDetailInnerView = type metadata accessor for NextHourPrecipitationDetailInnerView();
  uint64_t v16 = HourPrecipitationDetailInnerView - 8;
  __chkstk_darwin(HourPrecipitationDetailInnerView);
  uint64_t v97 = (uint64_t)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = (char *)type metadata accessor for Location();
  uint64_t v18 = *((void *)v92 - 1);
  __chkstk_darwin(v92);
  int v91 = (char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for DetailType();
  uint64_t v90 = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t HourPrecipitationDetailView = type metadata accessor for NextHourPrecipitationDetailViewModel.Model(0);
  uint64_t v25 = HourPrecipitationDetailView - 8;
  __chkstk_darwin(HourPrecipitationDetailView);
  uint64_t v27 = (char *)&v74 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for DetailViewVisibilityTrackerModel();
  uint64_t v29 = v28 - 8;
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v74 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100C085B8((uint64_t)v2 + *(int *)(v16 + 28), (uint64_t)v27, (void (*)(void))type metadata accessor for NextHourPrecipitationDetailViewModel.Model);
  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v23, enum case for DetailType.nextHourPrecipitation(_:), v20);
  uint64_t v32 = *(int *)(v25 + 40);
  uint64_t v33 = type metadata accessor for ConditionDetailMapViewModel();
  uint64_t v35 = v91;
  uint64_t v34 = (uint64_t)v92;
  (*(void (**)(char *, char *, char *))(v18 + 16))(v91, &v27[v32 + *(int *)(v33 + 20)], v92);
  sub_100C0860C((uint64_t)v27, (void (*)(void))type metadata accessor for NextHourPrecipitationDetailViewModel.Model);
  uint64_t v36 = &v31[*(int *)(v29 + 32)];
  uint64_t v37 = enum case for DetailViewOrigin.component(_:);
  uint64_t v38 = type metadata accessor for DetailViewOrigin();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 104))(v36, v37, v38);
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v31, v23, v90);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v31[*(int *)(v29 + 28)], v35, v34);
  uint64_t v40 = v2[3];
  uint64_t v39 = v2[4];
  uint64_t v41 = sub_1001B1E64(v2, v40);
  v103[3] = v40;
  uint64_t v42 = *(void *)(v39 + 8);
  uint64_t v43 = v94;
  v103[4] = v42;
  int v44 = sub_100170694(v103);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v40 - 8) + 16))(v44, v41, v40);
  id v45 = [self mainBundle];
  v104._countAndFlagsBits = 0xD000000000000030;
  v104._uint64_t object = (void *)0x8000000100CC1830;
  v46._uint64_t object = (void *)0x8000000100CABE00;
  v46._countAndFlagsBits = 0xD000000000000017;
  v47._countAndFlagsBits = 0;
  v47._uint64_t object = (void *)0xE000000000000000;
  Swift::String v48 = NSLocalizedString(_:tableName:bundle:value:comment:)(v46, (Swift::String_optional)0, (NSBundle)v45, v47, v104);

  uint64_t v49 = v93;
  uint64_t v50 = v97;
  sub_100C085B8((uint64_t)v2, v97, (void (*)(void))type metadata accessor for NextHourPrecipitationDetailInnerView);
  *uint64_t v43 = swift_getKeyPath();
  sub_10017DF08(&qword_100E65310);
  swift_storeEnumTagMultiPayload();
  uint64_t v51 = (int *)sub_10017DF08(&qword_100EB8EA0);
  uint64_t v52 = (uint64_t)v43 + v51[9];
  uint64_t v92 = v31;
  sub_100C085B8((uint64_t)v31, v52, (void (*)(void))type metadata accessor for DetailViewVisibilityTrackerModel);
  sub_1001E9994((uint64_t)v103, (uint64_t)v43 + v51[10]);
  *(Swift::String *)((char *)v43 + v51[11]) = v48;
  uint64_t v53 = (uint64_t)v95;
  uint64_t v54 = (uint64_t *)((char *)v43 + v51[12]);
  *uint64_t v54 = 0;
  v54[1] = 0;
  *((unsigned char *)v43 + v51[13]) = 0;
  uint64_t v55 = (uint64_t *)((char *)v43 + v51[14]);
  *uint64_t v55 = 0;
  v55[1] = 0;
  *((unsigned char *)v43 + v51[15]) = 1;
  static Axis.Set.vertical.getter();
  uint64_t v98 = v50;
  sub_10017DF08(&qword_100EB8EA8);
  sub_100C07F14();
  ScrollView.init(_:showsIndicators:content:)();
  uint64_t v56 = enum case for DynamicTypeSize.accessibility1(_:);
  uint64_t v57 = type metadata accessor for DynamicTypeSize();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 104))(v53, v56, v57);
  sub_100C08514(&qword_100E651F0, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
  if (result)
  {
    uint64_t v59 = sub_1001246C8(&qword_100EB8EC8, &qword_100EB8E90);
    uint64_t v60 = sub_1001246C8((unint64_t *)&unk_100EAADB0, &qword_100E651D0);
    uint64_t v61 = v75;
    uint64_t v62 = v76;
    View.dynamicTypeSize<A>(_:)();
    sub_100178110(v53, &qword_100E651D0);
    (*(void (**)(char *, uint64_t))(v74 + 8))(v49, v61);
    uint64_t v63 = v77;
    static ScrollIndicatorVisibility.never.getter();
    unsigned __int8 v64 = static Axis.Set.vertical.getter();
    unsigned __int8 v65 = static Axis.Set.horizontal.getter();
    Axis.Set.init(rawValue:)();
    Axis.Set.init(rawValue:)();
    if (Axis.Set.init(rawValue:)() != v64) {
      Axis.Set.init(rawValue:)();
    }
    Axis.Set.init(rawValue:)();
    if (Axis.Set.init(rawValue:)() != v65) {
      Axis.Set.init(rawValue:)();
    }
    uint64_t v99 = v61;
    uint64_t v100 = v62;
    uint64_t v101 = v59;
    uint64_t v102 = v60;
    swift_getOpaqueTypeConformance2();
    uint64_t v66 = v82;
    uint64_t v67 = v81;
    uint64_t v68 = v96;
    View.scrollIndicators(_:axes:)();
    (*(void (**)(char *, uint64_t))(v86 + 8))(v63, v87);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v68, v67);
    type metadata accessor for AutomationViewInfo(0);
    uint64_t v69 = (uint64_t)v89;
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
    uint64_t v70 = v79;
    sub_10048D6C8(v69, v79);
    sub_100C0860C(v69, (void (*)(void))type metadata accessor for AutomationInfo);
    (*(void (**)(char *, uint64_t))(v84 + 8))(v66, v85);
    uint64_t v71 = v78;
    sub_10024D364(v70, v78, &qword_100E7A148);
    uint64_t v72 = v71;
    uint64_t v73 = v83;
    sub_10024D364(v72, v83, &qword_100E7A148);
    sub_100C0860C(v97, (void (*)(void))type metadata accessor for NextHourPrecipitationDetailInnerView);
    _s7Weather29UVIDescriptorViewModelFactoryVwxx_0((uint64_t)v103);
    sub_100C0860C((uint64_t)v92, (void (*)(void))type metadata accessor for DetailViewVisibilityTrackerModel);
    return sub_10024D364(v73, (uint64_t)v43 + v51[16], &qword_100E7A148);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100C06940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10017DF08(&qword_100EB8EC0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = static HorizontalAlignment.leading.getter();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v7 = sub_10017DF08(&qword_100EB8ED0);
  sub_100C06A7C(a1, (uint64_t)&v6[*(int *)(v7 + 44)]);
  char v8 = static Edge.Set.bottom.getter();
  swift_beginAccess();
  sub_10059263C();
  EdgeInsets.init(_all:)();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  sub_10006DF38((uint64_t)v6, a2, &qword_100EB8EC0);
  uint64_t v17 = a2 + *(int *)(sub_10017DF08(&qword_100EB8EA8) + 36);
  *(unsigned char *)uint64_t v17 = v8;
  *(void *)(v17 + 8) = v10;
  *(void *)(v17 + 16) = v12;
  *(void *)(v17 + 24) = v14;
  *(void *)(v17 + 32) = v16;
  *(unsigned char *)(v17 + 40) = 0;
  return sub_100178110((uint64_t)v6, &qword_100EB8EC0);
}

uint64_t sub_100C06A7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v143 = a2;
  uint64_t v3 = type metadata accessor for ConditionDetailMapViewModel();
  __chkstk_darwin(v3 - 8);
  uint64_t v138 = (uint64_t)v109 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = type metadata accessor for ConditionDetailMapView();
  __chkstk_darwin(v137);
  uint64_t v142 = (void *)((char *)v109 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v6);
  uint64_t v141 = (uint64_t)v109 - v7;
  uint64_t HourPrecipitationDetailInnerView = type metadata accessor for NextHourPrecipitationDetailInnerView();
  uint64_t v9 = (int *)(HourPrecipitationDetailInnerView - 8);
  uint64_t v133 = *(void *)(HourPrecipitationDetailInnerView - 8);
  __chkstk_darwin(HourPrecipitationDetailInnerView);
  uint64_t v134 = v10;
  uint64_t v135 = (uint64_t)v109 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = sub_10017DF08(&qword_100E87E88);
  uint64_t v139 = *(void *)(v140 - 8);
  __chkstk_darwin(v140);
  v149 = (char *)v109 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v150 = (char *)v109 - v13;
  uint64_t v144 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v144);
  int v132 = (double *)((char *)v109 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v122 = type metadata accessor for DynamicTypeSize();
  uint64_t v121 = *(void *)(v122 - 8);
  __chkstk_darwin(v122);
  uint64_t v118 = (char *)v109 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10017DF08(&qword_100E73B58);
  __chkstk_darwin(v16 - 8);
  uint64_t v115 = (char *)v109 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t HourPrecipitationChartViewModel = type metadata accessor for NextHourPrecipitationChartViewModel();
  uint64_t v112 = *(void *)(HourPrecipitationChartViewModel - 8);
  __chkstk_darwin(HourPrecipitationChartViewModel);
  uint64_t v111 = (char *)v109 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t HourPrecipitationChartView = type metadata accessor for NextHourPrecipitationChartView();
  uint64_t v117 = *(void *)(HourPrecipitationChartView - 8);
  __chkstk_darwin(HourPrecipitationChartView);
  v114 = (char *)v109 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_10017DF08(&qword_100EB8ED8);
  uint64_t v123 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  uint64_t v110 = (char *)v109 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = sub_10017DF08(&qword_100EB8EE0);
  __chkstk_darwin(v120);
  uint64_t v127 = (char *)v109 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_10017DF08(&qword_100EB8EE8);
  __chkstk_darwin(v119);
  uint64_t v128 = (char *)v109 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_10017DF08(&qword_100EB8EF0);
  __chkstk_darwin(v126);
  uint64_t v130 = (char *)v109 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = sub_10017DF08(&qword_100EB8EF8);
  __chkstk_darwin(v129);
  uint64_t v148 = (uint64_t)v109 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v147 = (uint64_t)v109 - v26;
  uint64_t v27 = sub_10017DF08(&qword_100E737F8);
  __chkstk_darwin(v27 - 8);
  uint64_t v29 = (char *)v109 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for DetailHeroChartLollipopModel(0);
  __chkstk_darwin(v30 - 8);
  int v145 = (void *)((char *)v109 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v32 = type metadata accessor for DetailHeroChartHeaderView();
  uint64_t v33 = v32 - 8;
  __chkstk_darwin(v32);
  uint64_t v146 = (uint64_t)v109 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35);
  uint64_t v37 = (void *)((char *)v109 - v36);
  uint64_t v38 = (void *)(a1 + v9[7]);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  uint64_t v41 = v38[3];
  int v131 = (void *)v38[2];
  v109[3] = a1 + v9[9];
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v109[2] = sub_10017DF08(&qword_100EB8DD0);
  State.wrappedValue.getter();
  uint64_t v42 = v9[8];
  uint64_t v136 = a1;
  uint64_t v43 = (long long *)(a1 + v42);
  LOBYTE(v42) = *((unsigned char *)v43 + 16);
  uint64_t v44 = *((void *)v43 + 3);
  long long v152 = *v43;
  LOBYTE(v153) = v42;
  *((void *)&v153 + 1) = v44;
  v109[1] = sub_10017DF08(&qword_100E82C80);
  State.wrappedValue.getter();
  id v45 = v145;
  sub_1003E6D8C((uint64_t)v29, v155, v156, v145);
  sub_100178110((uint64_t)v29, &qword_100E737F8);
  void *v37 = v40;
  v37[1] = v39;
  v37[2] = v40;
  v37[3] = v39;
  Swift::String v46 = v131;
  v37[4] = v131;
  v37[5] = v41;
  v37[6] = v46;
  v37[7] = v41;
  sub_100C08564((uint64_t)v45, (uint64_t)v37 + *(int *)(v33 + 28), (void (*)(void))type metadata accessor for DetailHeroChartLollipopModel);
  int v145 = v37;
  Swift::String v47 = v110;
  *(void *)&long long v152 = 0x3FF0000000000000;
  sub_100146A70();
  ScaledMetric.init(wrappedValue:)();
  uint64_t HourPrecipitationDetailView = type metadata accessor for NextHourPrecipitationDetailViewModel.Model(0);
  uint64_t v48 = *(int *)(HourPrecipitationDetailView + 28);
  int v131 = v38;
  (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v111, (char *)v38 + v48, HourPrecipitationChartViewModel);
  char v49 = *((unsigned char *)v43 + 16);
  uint64_t v50 = *((void *)v43 + 3);
  long long v155 = *v43;
  LOBYTE(v156) = v49;
  *((void *)&v156 + 1) = v50;
  State.projectedValue.getter();
  long long v158 = v152;
  long long v159 = v153;
  char v160 = v154;
  uint64_t v51 = (uint64_t)v115;
  State.projectedValue.getter();
  uint64_t v52 = sub_10017DF08(&qword_100E73B90);
  _s7Weather24LocationCompositionStateOwst_0(v51, 0, 1, v52);
  uint64_t v53 = v114;
  NextHourPrecipitationChartView.init(model:lollipopPoint:selectedData:lollipopEnabled:)();
  uint64_t v54 = v121;
  uint64_t v55 = v118;
  uint64_t v56 = v122;
  (*(void (**)(char *, void, uint64_t))(v121 + 104))(v118, enum case for DynamicTypeSize.large(_:), v122);
  sub_100C08514(&qword_100E73B98, (void (*)(uint64_t))&type metadata accessor for NextHourPrecipitationChartView);
  uint64_t v57 = HourPrecipitationChartView;
  View.dynamicTypeSize(_:)();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v56);
  (*(void (**)(char *, uint64_t))(v117 + 8))(v53, v57);
  if (qword_100E62450 != -1) {
    swift_once();
  }
  swift_beginAccess();
  sub_10058C858();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v58 = v123;
  uint64_t v59 = (uint64_t)v127;
  uint64_t v60 = v124;
  (*(void (**)(char *, char *, uint64_t))(v123 + 16))(v127, v47, v124);
  uint64_t v61 = (_OWORD *)(v59 + *(int *)(v120 + 36));
  long long v62 = v153;
  *uint64_t v61 = v152;
  v61[1] = v62;
  v61[2] = v154;
  (*(void (**)(char *, uint64_t))(v58 + 8))(v47, v60);
  uint64_t v124 = static Alignment.center.getter();
  uint64_t v123 = v63;
  uint64_t v64 = (uint64_t)v128;
  uint64_t v65 = (uint64_t)&v128[*(int *)(v119 + 36)];
  swift_beginAccess();
  double v66 = sub_10058C830();
  uint64_t v67 = v132;
  uint64_t v68 = (char *)v132 + *(int *)(v144 + 20);
  uint64_t v69 = enum case for RoundedCornerStyle.continuous(_:);
  LODWORD(v122) = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v70 = type metadata accessor for RoundedCornerStyle();
  uint64_t v121 = *(void *)(*(void *)(v70 - 8) + 104);
  ((void (*)(char *, uint64_t, uint64_t))v121)(v68, v69, v70);
  *uint64_t v67 = v66;
  v67[1] = v66;
  uint64_t v71 = sub_10058C87C();
  swift_endAccess();
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  sub_100C085B8((uint64_t)v67, v65, (void (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v72 = v65 + *(int *)(sub_10017DF08(&qword_100E7D380) + 36);
  long long v73 = v156;
  *(_OWORD *)uint64_t v72 = v155;
  *(_OWORD *)(v72 + 16) = v73;
  *(void *)(v72 + 32) = v157;
  uint64_t v74 = sub_10017DF08(&qword_100E7D388);
  *(void *)(v65 + *(int *)(v74 + 52)) = v71;
  *(_WORD *)(v65 + *(int *)(v74 + 56)) = 256;
  uint64_t v75 = static Alignment.center.getter();
  uint64_t v77 = v76;
  uint64_t v78 = (uint64_t *)(v65 + *(int *)(sub_10017DF08(&qword_100E7D390) + 36));
  *uint64_t v78 = v75;
  v78[1] = v77;
  sub_100C0860C((uint64_t)v67, (void (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v79 = (uint64_t *)(v65 + *(int *)(sub_10017DF08(&qword_100E7D398) + 36));
  uint64_t v80 = v123;
  *uint64_t v79 = v124;
  v79[1] = v80;
  sub_10024D364(v59, v64, &qword_100EB8EE0);
  double v81 = sub_10058C830();
  ((void (*)(char *, void, uint64_t))v121)((char *)v67 + *(int *)(v144 + 20), v122, v70);
  *uint64_t v67 = v81;
  v67[1] = v81;
  uint64_t v82 = (uint64_t)v130;
  uint64_t v83 = (uint64_t)&v130[*(int *)(v126 + 36)];
  sub_100C085B8((uint64_t)v67, v83, (void (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v83 + *(int *)(sub_10017DF08(&qword_100E744A8) + 36)) = 256;
  sub_10006DF38(v64, v82, &qword_100EB8EE8);
  sub_100C0860C((uint64_t)v67, (void (*)(void))&type metadata accessor for RoundedRectangle);
  sub_100178110(v64, &qword_100EB8EE8);
  swift_beginAccess();
  double v84 = sub_10052E644();
  double v85 = sub_10052E644();
  LOBYTE(v83) = static Edge.Set.all.getter();
  uint64_t v86 = v148;
  sub_10006DF38(v82, v148, &qword_100EB8EF0);
  uint64_t v87 = v86 + *(int *)(v129 + 36);
  *(unsigned char *)uint64_t v87 = v83;
  *(void *)(v87 + 8) = 0;
  *(double *)(v87 + 16) = v84;
  *(void *)(v87 + 24) = 0;
  *(double *)(v87 + 32) = v85;
  *(unsigned char *)(v87 + 40) = 0;
  sub_100178110(v82, &qword_100EB8EF0);
  uint64_t v88 = v147;
  sub_10024D364(v86, v147, &qword_100EB8EF8);
  uint64_t v89 = v131;
  uint64_t v151 = v131[4];
  uint64_t v90 = v135;
  sub_100C085B8(v136, v135, (void (*)(void))type metadata accessor for NextHourPrecipitationDetailInnerView);
  unint64_t v91 = (*(unsigned __int8 *)(v133 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v133 + 80);
  uint64_t v92 = swift_allocObject();
  sub_100C08564(v90, v92 + v91, (void (*)(void))type metadata accessor for NextHourPrecipitationDetailInnerView);
  swift_bridgeObjectRetain();
  sub_10017DF08(&qword_100E81F20);
  sub_10017DF08(&qword_100E66E38);
  sub_1001246C8(&qword_100E81F30, &qword_100E81F20);
  sub_1001246C8((unint64_t *)&qword_100E87EE0, &qword_100E66E38);
  sub_100C08514(&qword_100E81F40, (void (*)(uint64_t))type metadata accessor for ConditionDetailPlatterViewModel);
  ForEach<>.init(_:content:)();
  uint64_t v93 = v138;
  sub_100C085B8((uint64_t)v89 + *(int *)(HourPrecipitationDetailView + 32), v138, (void (*)(void))type metadata accessor for ConditionDetailMapViewModel);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v95 = (uint64_t)v142;
  *uint64_t v142 = KeyPath;
  *(void *)(v95 + 8) = 0;
  *(_WORD *)(v95 + 16) = 0;
  uint64_t v96 = v137;
  sub_100C08564(v93, v95 + *(int *)(v137 + 20), (void (*)(void))type metadata accessor for ConditionDetailMapViewModel);
  uint64_t v97 = (void *)(v95 + *(int *)(v96 + 24));
  void *v97 = 0;
  v97[1] = 0;
  uint64_t v98 = v141;
  sub_100C08564(v95, v141, (void (*)(void))type metadata accessor for ConditionDetailMapView);
  uint64_t v99 = v146;
  sub_100C085B8((uint64_t)v145, v146, (void (*)(void))type metadata accessor for DetailHeroChartHeaderView);
  sub_10006DF38(v88, v86, &qword_100EB8EF8);
  uint64_t v100 = v139;
  uint64_t v101 = *(void (**)(char *, char *, uint64_t))(v139 + 16);
  uint64_t v102 = v140;
  v101(v149, v150, v140);
  sub_100C085B8(v98, v95, (void (*)(void))type metadata accessor for ConditionDetailMapView);
  uint64_t v103 = v99;
  uint64_t v104 = v143;
  sub_100C085B8(v103, v143, (void (*)(void))type metadata accessor for DetailHeroChartHeaderView);
  uint64_t v105 = (int *)sub_10017DF08(&qword_100EB8F00);
  sub_10006DF38(v86, v104 + v105[12], &qword_100EB8EF8);
  uint64_t v106 = v149;
  v101((char *)(v104 + v105[16]), v149, v102);
  sub_100C085B8(v95, v104 + v105[20], (void (*)(void))type metadata accessor for ConditionDetailMapView);
  sub_100C0860C(v98, (void (*)(void))type metadata accessor for ConditionDetailMapView);
  uint64_t v107 = *(void (**)(char *, uint64_t))(v100 + 8);
  v107(v150, v102);
  sub_100178110(v147, &qword_100EB8EF8);
  sub_100C0860C((uint64_t)v145, (void (*)(void))type metadata accessor for DetailHeroChartHeaderView);
  sub_100C0860C(v95, (void (*)(void))type metadata accessor for ConditionDetailMapView);
  v107(v106, v102);
  sub_100178110(v148, &qword_100EB8EF8);
  return sub_100C0860C(v146, (void (*)(void))type metadata accessor for DetailHeroChartHeaderView);
}

uint64_t sub_100C07D74@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for ConditionDetailPlatterViewModel(0);
  __chkstk_darwin(v6 - 8);
  char v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100C085B8(a1, (uint64_t)v8, (void (*)(void))type metadata accessor for ConditionDetailPlatterViewModel);
  uint64_t v9 = a2[3];
  uint64_t v10 = a2[4];
  uint64_t v11 = sub_1001B1E64(a2, v9);
  v18[3] = v9;
  v18[4] = *(void *)(v10 + 8);
  uint64_t v12 = sub_100170694(v18);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v12, v11, v9);
  sub_100C085B8((uint64_t)v8, a3, (void (*)(void))type metadata accessor for ConditionDetailPlatterViewModel);
  uint64_t v13 = (int *)sub_10017DF08(&qword_100E66E38);
  sub_1001E9994((uint64_t)v18, a3 + v13[10]);
  *(unsigned char *)(a3 + v13[9]) = 0;
  uint64_t v14 = (void *)(a3 + v13[11]);
  *uint64_t v14 = 0;
  v14[1] = 0;
  uint64_t v15 = v13[12];
  swift_beginAccess();
  *(double *)(a3 + v15) = sub_100592380();
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0((uint64_t)v18);
  return sub_100C0860C((uint64_t)v8, (void (*)(void))type metadata accessor for ConditionDetailPlatterViewModel);
}

uint64_t sub_100C07F0C@<X0>(uint64_t a1@<X8>)
{
  return sub_100C06940(*(void *)(v1 + 16), a1);
}

unint64_t sub_100C07F14()
{
  unint64_t result = qword_100EB8EB0;
  if (!qword_100EB8EB0)
  {
    sub_10018C6DC(&qword_100EB8EA8);
    sub_1001246C8(&qword_100EB8EB8, &qword_100EB8EC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB8EB0);
  }
  return result;
}

uint64_t sub_100C07FB4()
{
  uint64_t HourPrecipitationDetailInnerView = type metadata accessor for NextHourPrecipitationDetailInnerView();
  uint64_t v37 = *(unsigned __int8 *)(*(void *)(HourPrecipitationDetailInnerView - 8) + 80);
  uint64_t v2 = v0 + ((v37 + 16) & ~v37);
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v2);
  uint64_t v3 = v2 + *(int *)(HourPrecipitationDetailInnerView + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t HourPrecipitationDetailView = (int *)type metadata accessor for NextHourPrecipitationDetailViewModel.Model(0);
  type metadata accessor for NextHourPrecipitationChartViewModel();
  sub_100162E4C();
  sub_100162F0C();
  v5();
  uint64_t v6 = v3 + HourPrecipitationDetailView[8];
  swift_bridgeObjectRelease();
  uint64_t v7 = type metadata accessor for ConditionDetailMapViewModel();
  type metadata accessor for Location();
  sub_100162E4C();
  sub_100162F0C();
  v8();
  uint64_t v9 = v6 + *(int *)(v7 + 24);
  uint64_t v10 = (int *)type metadata accessor for WeatherData(0);
  if (!sub_10017B1E8())
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = v9 + v10[5];
    uint64_t v12 = type metadata accessor for Locale();
    if (!_s7Weather24LocationCompositionStateOwet_0(v11, 1, v12))
    {
      sub_100162880();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
    type metadata accessor for WeatherDataModel();
    sub_100162E4C();
    sub_100162F0C();
    v14();
    uint64_t v15 = v9 + v10[7];
    uint64_t v16 = sub_10017DF08(&qword_100E63738);
    if (!_s7Weather24LocationCompositionStateOwet_0(v15, 1, v16))
    {
      type metadata accessor for Date();
      sub_100162E4C();
      (*(void (**)(uint64_t))(v17 + 8))(v15);
    }
    uint64_t v18 = v9 + v10[8];
    type metadata accessor for WeatherData.WeatherStatisticsState(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      type metadata accessor for WeatherStatisticsModel();
      sub_100162E4C();
      (*(void (**)(uint64_t))(v20 + 8))(v18);
    }
    else if (!EnumCaseMultiPayload)
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v21 = v9 + v10[9];
    uint64_t v22 = type metadata accessor for WeatherDataOverrides();
    if (!_s7Weather24LocationCompositionStateOwet_0(v21, 1, v22))
    {
      uint64_t v23 = type metadata accessor for Date();
      if (!sub_10017B1E8())
      {
        sub_100162880();
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v21, v23);
      }
      uint64_t v25 = v21 + *(int *)(v22 + 20);
      if (!sub_10017B1E8())
      {
        sub_100162880();
        (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v23);
      }
    }
  }
  swift_bridgeObjectRelease();
  type metadata accessor for WeatherMapOverlayKind();
  sub_100162E4C();
  sub_100162F0C();
  v27();
  uint64_t v28 = v3 + HourPrecipitationDetailView[9];
  type metadata accessor for TimeZone();
  sub_100162E4C();
  sub_100162F0C();
  v29();
  uint64_t v30 = v3 + HourPrecipitationDetailView[10];
  uint64_t v31 = sub_10017DF08(&qword_100E6E900);
  if (!sub_1001632AC(v31))
  {
    sub_100162880();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v30, v28);
  }
  swift_release();
  uint64_t v33 = v2 + *(int *)(HourPrecipitationDetailInnerView + 28);
  uint64_t HourPrecipitationChartView = type metadata accessor for NextHourPrecipitationChartViewModel.Point();
  if (!sub_1001632AC(HourPrecipitationChartView))
  {
    sub_100162880();
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v33, v28);
  }
  sub_10017DF08(&qword_100EB8DD0);
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_100C08494@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for NextHourPrecipitationDetailInnerView() - 8);
  uint64_t v6 = (void *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));

  return sub_100C07D74(a1, v6, a2);
}

uint64_t sub_100C08514(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100C08564(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100162E4C();
  uint64_t v4 = sub_100126010();
  v5(v4);
  return a2;
}

uint64_t sub_100C085B8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100162E4C();
  uint64_t v4 = sub_10011BFA4();
  v5(v4);
  return a2;
}

uint64_t sub_100C0860C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_100162E4C();
  sub_100162F0C();
  v3();
  return a1;
}

uint64_t sub_100C08660()
{
  return sub_1001246C8(&qword_100EB8F08, &qword_100EB8EA0);
}

uint64_t NotificationsOptInMonitor.deinit()
{
  swift_release();
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v0 + 32);
  swift_release();
  swift_release();

  return v0;
}

uint64_t NotificationsOptInMonitor.__deallocating_deinit()
{
  NotificationsOptInMonitor.deinit();

  return swift_deallocClassInstance();
}

uint64_t sub_100C0871C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = type metadata accessor for OSSignpostID();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  return _swift_task_switch(sub_100C087DC, 0, 0);
}

uint64_t sub_100C087DC()
{
  id v1 = *(id *)(v0[2] + 104);
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  sub_100189780();
  id v2 = [self currentNotificationCenter];
  id v3 = [v2 notificationSettings];

  static os_signpost_type_t.end.getter();
  sub_100189780();
  if ([v3 authorizationStatus])
  {
    swift_retain();
    asyncMain(block:)();
    swift_release();
  }
  else
  {
    if (qword_100E627D8 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_1002102B0(v4, (uint64_t)qword_100F51EA0);
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Notification authorizationStatus is notDetermined but user default has notification enabled. Reset authorization flags", v7, 2u);
      swift_slowDealloc();
    }

    swift_retain();
    asyncMain(block:)();

    swift_release();
  }
  (*(void (**)(void, void))(v0[4] + 8))(v0[5], v0[3]);
  swift_task_dealloc();
  char v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100C08A18(uint64_t a1)
{
  type metadata accessor for MainAction();
  sub_100162E4C();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(uint64_t (**)(uint64_t))(a1 + 16);
  type metadata accessor for NotificationsOptInAction();
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  swift_retain();
  sub_1001AAF58((uint64_t)v4, (uint64_t)v7, v5);
  sub_100178110((uint64_t)v7, (uint64_t *)&unk_100EA01F0);
  sub_1001C6714((uint64_t)v4, (void (*)(void))type metadata accessor for MainAction);
  return swift_release();
}

uint64_t sub_100C08B20()
{
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_100C08B60()
{
  return sub_100C08A18(v0);
}

uint64_t sub_100C08B80()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_100C08BC0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10004A90C;
  return sub_100C0871C(a1, v4, v5, v6);
}

uint64_t sub_100C08C74()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_100C08CAC()
{
  return sub_100C08A18(v0);
}

uint64_t sub_100C08CCC()
{
  return sub_100C08A18(v0);
}

uint64_t sub_100C08CEC(char a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  *(unsigned char *)(v4 + 24) = a1;
  swift_retain();
  asyncMain(block:)();

  return swift_release();
}

uint64_t sub_100C08D70(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for MainAction();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(uint64_t (**)(uint64_t))(a1 + 16);
  *uint64_t v6 = a2;
  v6[1] = 1;
  type metadata accessor for EnvironmentAction();
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  swift_retain();
  sub_1001AAF58((uint64_t)v6, (uint64_t)v9, v7);
  sub_1001781AC((uint64_t)v9, (uint64_t *)&unk_100EA01F0);
  sub_1001ABE70((uint64_t)v6);
  return swift_release();
}

uint64_t _s7Weather26NetworkConnectivityMonitorC29applicationDidEnterBackgroundyyF_0()
{
  if (*(void *)(v0 + 32))
  {
    swift_retain();
    NWPathMonitor.cancel()();
    swift_release();
  }
  *(void *)(v0 + 32) = 0;
  swift_release();
  if (*(void *)(v0 + 40))
  {
    swift_retain();
    sub_10090B108();
    swift_release();
  }
  *(void *)(v0 + 40) = 0;

  return swift_release();
}

uint64_t NetworkConnectivityMonitor.deinit()
{
  swift_release();
  swift_release();
  swift_release();

  return v0;
}

uint64_t NetworkConnectivityMonitor.__deallocating_deinit()
{
  NetworkConnectivityMonitor.deinit();

  return swift_deallocClassInstance();
}

uint64_t sub_100C08F78()
{
  swift_weakDestroy();

  return swift_deallocObject();
}

uint64_t sub_100C08FB0(char a1)
{
  return sub_100C08CEC(a1, v1);
}

uint64_t sub_100C08FB8()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_100C08FF0()
{
  return sub_100C08D70(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_100C08FFC()
{
  type metadata accessor for NWPath();
  sub_100162E4C();
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_100C09098()
{
  return swift_release();
}

id *sub_100C09170()
{
  swift_release();

  swift_bridgeObjectRelease();
  uint64_t v1 = (char *)v0 + *((void *)*v0 + 17);
  uint64_t v2 = type metadata accessor for Published();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_100C09218()
{
  sub_100C09170();

  return swift_deallocClassInstance();
}

uint64_t sub_100C09270()
{
  swift_release();
  sub_100289798(v0 + 32);

  return v0;
}

uint64_t sub_100C092A0()
{
  sub_100C09270();

  return swift_deallocClassInstance();
}

uint64_t sub_100C092D4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v10 = v9 + v7;
  unint64_t v11 = ((v10 + ((v8 + 49) & ~v8)) & ~v8) + v9;
  int v12 = v7 & 0x100000;
  if (v8 > 7 || v12 != 0 || v11 > 0x18)
  {
    uint64_t v15 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v15 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16));
    swift_retain();
  }
  else
  {
    uint64_t v16 = ~v8;
    uint64_t v17 = a2[3];
    if (v17)
    {
      uint64_t v18 = a2[4];
      *(void *)(a1 + 24) = v17;
      *(void *)(a1 + 32) = v18;
      (**(void (***)(uint64_t, uint64_t *))(v17 - 8))(a1, a2);
    }
    else
    {
      long long v19 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v19;
      *(void *)(a1 + 32) = a2[4];
    }
    *(void *)(v4 + 40) = a2[5];
    *(unsigned char *)(v4 + 48) = *((unsigned char *)a2 + 48);
    uint64_t v20 = (uint64_t)a2 + v8;
    uint64_t v21 = (v4 + v8 + 49) & v16;
    uint64_t v22 = (v20 + 49) & v16;
    uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_bridgeObjectRetain();
    v23(v21, v22, v5);
    v23((v10 + v21) & v16, (v10 + v22) & v16, v5);
  }
  return v4;
}

uint64_t sub_100C09474(uint64_t a1, long long *a2, uint64_t a3)
{
  uint64_t v6 = *((void *)a2 + 3);
  if (!*(void *)(a1 + 24))
  {
    if (v6)
    {
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v6 - 8))(a1, a2);
      goto LABEL_8;
    }
LABEL_7:
    long long v7 = *a2;
    long long v8 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v7;
    *(_OWORD *)(a1 + 16) = v8;
    goto LABEL_8;
  }
  if (!v6)
  {
    _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(a1);
    goto LABEL_7;
  }
  sub_1000C1E18((uint64_t *)a1, (uint64_t *)a2);
LABEL_8:
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24);
  uint64_t v12 = v10 + 24;
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = ((unint64_t)a2 + v13 + 49) & ~v13;
  v11((v13 + 49 + a1) & ~v13, v14, v9);
  v11((*(void *)(v12 + 40) + v13 + ((v13 + 49 + a1) & ~v13)) & ~v13, (*(void *)(v12 + 40) + v13 + v14) & ~v13, v9);
  return a1;
}

uint64_t sub_100C095C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  long long v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  uint64_t v8 = v6 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v9 + 49 + a1) & ~v9;
  uint64_t v11 = (v9 + 49 + a2) & ~v9;
  v7(v10, v11, v5);
  v7((*(void *)(v8 + 32) + v9 + v10) & ~v9, (*(void *)(v8 + 32) + v9 + v11) & ~v9, v5);
  return a1;
}

uint64_t sub_100C09694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24)) {
    _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(a1);
  }
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 40);
  uint64_t v11 = v9 + 40;
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = (v12 + 49 + a2) & ~v12;
  v10((v12 + 49 + a1) & ~v12, v13, v8);
  v10((*(void *)(v11 + 24) + v12 + ((v12 + 49 + a1) & ~v12)) & ~v12, (*(void *)(v11 + 24) + v12 + v13) & ~v12, v8);
  return a1;
}

uint64_t sub_100C09780(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v9 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v10 = ((*(void *)(*(void *)(v4 - 8) + 64) + v7 + ((v7 + 49) & ~v7)) & ~v7)
      + *(void *)(*(void *)(v4 - 8) + 64);
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_23:
      if ((v6 & 0x80000000) != 0) {
        return _s7Weather24LocationCompositionStateOwet_0(((unint64_t)a1 + v7 + 49) & ~v7, v6, v4);
      }
      unint64_t v16 = *((void *)a1 + 5);
      if (v16 >= 0xFFFFFFFF) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((unsigned char *)a1 + v10)) {
    goto LABEL_23;
  }
LABEL_15:
  int v15 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v15 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *a1;
        break;
      case 3:
        LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v8 + (v10 | v15) + 1;
}

void sub_100C0991C(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = *(void *)(*(void *)(v6 - 8) + 64);
  uint64_t v12 = (v11 + v10 + ((v10 + 49) & ~v10)) & ~v10;
  size_t v13 = v12 + v11;
  char v14 = 8 * (v12 + v11);
  BOOL v15 = a3 >= v9;
  unsigned int v16 = a3 - v9;
  if (v16 != 0 && v15)
  {
    if (v13 <= 3)
    {
      unsigned int v20 = ((v16 + ~(-1 << v14)) >> v14) + 1;
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
  }
  else
  {
    int v17 = 0;
  }
  if (v9 < a2)
  {
    unsigned int v18 = ~v9 + a2;
    if (v13 < 4)
    {
      int v19 = (v18 >> v14) + 1;
      if (v13)
      {
        int v21 = v18 & ~(-1 << v14);
        bzero(a1, v13);
        if (v13 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if (v13 == 2)
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
      bzero(a1, v13);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v17)
    {
      case 1:
        a1[v13] = v19;
        return;
      case 2:
        *(_WORD *)&a1[v13] = v19;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v13] = v19;
        return;
      default:
        return;
    }
  }
  switch(v17)
  {
    case 1:
      a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x100C09B88);
    case 4:
      *(_DWORD *)&a1[v13] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v8 & 0x80000000) != 0)
        {
          unint64_t v22 = (unint64_t)&a1[v10 + 49] & ~v10;
          _s7Weather24LocationCompositionStateOwst_0(v22, a2, v8, v6);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *((void *)a1 + 5) = 0;
          *(_OWORD *)(a1 + 24) = 0u;
          *(_OWORD *)(a1 + 8) = 0u;
          a1[48] = 0;
          *(void *)a1 = a2 ^ 0x80000000;
        }
        else
        {
          *((void *)a1 + 5) = (a2 - 1);
        }
      }
      return;
  }
}

uint64_t sub_100C09BB8()
{
  return 24;
}

__n128 sub_100C09BC4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_100C09BD8(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v49 = a4;
  unint64_t v50 = a5;
  uint64_t v58 = a2;
  uint64_t v54 = type metadata accessor for VisibleLocationFinishedLoadingEvent.EndReason();
  sub_100179C0C();
  uint64_t v52 = v8;
  __chkstk_darwin(v9);
  sub_100109314();
  uint64_t v53 = v10;
  type metadata accessor for VisibleLocationFinishedLoadingEvent();
  sub_100179C0C();
  uint64_t v56 = v12;
  uint64_t v57 = v11;
  __chkstk_darwin(v11);
  sub_100109314();
  uint64_t v55 = v13;
  uint64_t v14 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
  __chkstk_darwin(v14 - 8);
  sub_100158494();
  __chkstk_darwin(v15);
  int v17 = (char *)&v45 - v16;
  uint64_t v18 = type metadata accessor for Date();
  sub_100179C0C();
  uint64_t v20 = v19;
  __chkstk_darwin(v21);
  sub_100162EF8();
  uint64_t v51 = v22;
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v45 - v24;
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v45 - v27;
  uint64_t v29 = a3 + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_startLoadTime;
  swift_beginAccess();
  sub_10006DF38(v29, (uint64_t)v17, (uint64_t *)&unk_100E73CA0);
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v17, 1, v18) == 1) {
    return sub_100178160((uint64_t)v17, (uint64_t *)&unk_100E73CA0);
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v28, v17, v18);
  unint64_t v31 = *(void *)(a3
                  + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_lastAssumedVisibleLocationID
                  + 8);
  if (v31)
  {
    uint64_t v32 = *(void *)(a3
                    + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_lastAssumedVisibleLocationID);
    swift_bridgeObjectRetain();
    sub_10004B4C4(v32, v31, a1);
    if (v33)
    {
      sub_100164FC8();
      v42();
      return swift_bridgeObjectRelease();
    }
    Date.distance(to:)();
    uint64_t v35 = v34;
    _s7Weather24LocationCompositionStateOwst_0(v5, 1, 1, v18);
    swift_beginAccess();
    sub_1001E75A0(v5, v29);
    swift_endAccess();
    swift_bridgeObjectRetain();
    uint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.default.getter();
    int v38 = v37;
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v39 = swift_slowAlloc();
      int v47 = v38;
      uint64_t v40 = v39;
      uint64_t v41 = swift_slowAlloc();
      uint64_t v48 = v41;
      *(_DWORD *)uint64_t v40 = 141558787;
      uint64_t v59 = 1752392040;
      v60[0] = v41;
      os_log_t v46 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v40 + 12) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v59 = sub_10016414C(v32, v31, v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v40 + 22) = 2048;
      uint64_t v59 = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v40 + 32) = 2080;
      uint64_t v59 = sub_10016414C(v49, v50, v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v36 = v46;
      _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v47, "%{private,mask.hash}s was loading while visible to user for %f seconds; is no longer visible. Reason=%s",
        (uint8_t *)v40,
        0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
    v43(v25, v28, v18);
    v43(v51, v58, v18);
    (*(void (**)(uint64_t, void, uint64_t))(v52 + 104))(v53, enum case for VisibleLocationFinishedLoadingEvent.EndReason.locationNoLongerVisible(_:), v54);
    uint64_t v44 = v55;
    VisibleLocationFinishedLoadingEvent.init(location:startTime:endTime:endReason:loadingBeganDuringObservation:)();
    sub_1001B1E64((void *)(a3 + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_backend), *(void *)(a3 + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_backend + 24));
    dispatch thunk of WeatherDataVisibleLocationLoadingTelemetryBackend.record(event:)();
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v44, v57);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v28, v18);
}

void sub_100C0A178(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = a2;
  uint64_t v4 = sub_10017DF08((uint64_t *)&unk_100E73CA0);
  __chkstk_darwin(v4 - 8);
  uint64_t v36 = (uint64_t)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LocationWeatherDataState(0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10017DF08(&qword_100E63848);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10017DF08(&qword_100E63770);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  int v17 = (char *)&v35 - v16;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v35 - v19;
  uint64_t v37 = v2;
  uint64_t v21 = *(void *)(v2
                  + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_lastAssumedVisibleLocationID
                  + 8);
  if (v21)
  {
    uint64_t v22 = *(void *)(v2
                    + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_lastAssumedVisibleLocationID);
    uint64_t v23 = *(void *)(a1 + OBJC_IVAR____TtCV7Weather9MainState8_Storage_weatherData + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1001BBE9C(v22, v21, v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_storeEnumTagMultiPayload();
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v17, 0, 1, v6);
    uint64_t v24 = (uint64_t)&v11[*(int *)(v9 + 48)];
    sub_10006DF38((uint64_t)v20, (uint64_t)v11, &qword_100E63770);
    sub_10006DF38((uint64_t)v17, v24, &qword_100E63770);
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v11, 1, v6) == 1)
    {
      sub_100178160((uint64_t)v17, &qword_100E63770);
      sub_100178160((uint64_t)v20, &qword_100E63770);
      if (_s7Weather24LocationCompositionStateOwet_0(v24, 1, v6) == 1)
      {
        sub_100178160((uint64_t)v11, &qword_100E63770);
        uint64_t v25 = v37;
LABEL_9:
        uint64_t v28 = type metadata accessor for Date();
        uint64_t v29 = v36;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v36, v35, v28);
        _s7Weather24LocationCompositionStateOwst_0(v29, 0, 1, v28);
        uint64_t v30 = v25 + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_startLoadTime;
        swift_beginAccess();
        sub_1001E75A0(v29, v30);
        swift_endAccess();
        char v31 = 0;
LABEL_11:
        *(unsigned char *)(v25 + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_loadBeganDuringObservation) = v31;
        return;
      }
    }
    else
    {
      sub_10006DF38((uint64_t)v11, (uint64_t)v14, &qword_100E63770);
      if (_s7Weather24LocationCompositionStateOwet_0(v24, 1, v6) != 1)
      {
        sub_100164E28(v24, (uint64_t)v8, (void (*)(void))type metadata accessor for LocationWeatherDataState);
        sub_100866548();
        char v27 = v26;
        sub_100159398((uint64_t)v8, (void (*)(void))type metadata accessor for LocationWeatherDataState);
        sub_100178160((uint64_t)v17, &qword_100E63770);
        sub_100178160((uint64_t)v20, &qword_100E63770);
        sub_100159398((uint64_t)v14, (void (*)(void))type metadata accessor for LocationWeatherDataState);
        sub_100178160((uint64_t)v11, &qword_100E63770);
        uint64_t v25 = v37;
        if (v27) {
          goto LABEL_9;
        }
LABEL_10:
        uint64_t v32 = type metadata accessor for Date();
        char v31 = 1;
        uint64_t v33 = v36;
        _s7Weather24LocationCompositionStateOwst_0(v36, 1, 1, v32);
        uint64_t v34 = v25 + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_startLoadTime;
        swift_beginAccess();
        sub_1001E75A0(v33, v34);
        swift_endAccess();
        goto LABEL_11;
      }
      sub_100178160((uint64_t)v17, &qword_100E63770);
      sub_100178160((uint64_t)v20, &qword_100E63770);
      sub_100159398((uint64_t)v14, (void (*)(void))type metadata accessor for LocationWeatherDataState);
    }
    sub_100178160((uint64_t)v11, &qword_100E63848);
    uint64_t v25 = v37;
    goto LABEL_10;
  }
}

void sub_100C0A670(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v52 = a3;
  uint64_t v53 = a2;
  uint64_t v54 = a1;
  uint64_t active = type metadata accessor for LocationViewerActiveLocationState();
  __chkstk_darwin(active - 8);
  uint64_t v49 = (uint64_t)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = type metadata accessor for ViewState.SecondaryViewState(0);
  __chkstk_darwin(v50);
  uint64_t v6 = (uint64_t *)((char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = (int *)type metadata accessor for ViewState(0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ModalViewState(0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for LocationPreviewViewAction();
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v49 - v17;
  uint64_t v19 = type metadata accessor for ModalViewAction();
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1001669EC(v54, (uint64_t)v21, (void (*)(void))type metadata accessor for ModalViewAction);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_100164E28((uint64_t)v21, (uint64_t)v18, (void (*)(void))type metadata accessor for LocationPreviewViewAction);
    sub_1001669EC((uint64_t)v18, (uint64_t)v15, (void (*)(void))type metadata accessor for LocationPreviewViewAction);
    int v27 = swift_getEnumCaseMultiPayload();
    if (v27 != 3)
    {
      if (v27 != 1)
      {
        uint64_t v28 = v52;
        uint64_t v29 = v53;
        uint64_t v30 = v51;
        sub_100C09BD8(v53, v52, v51, 0xD00000000000001ALL, 0x8000000100CC1AD0);
        uint64_t v31 = sub_100177428(v29);
        uint64_t v32 = (uint64_t *)(v30
                        + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_lastAssumedVisibleLocationID);
        *uint64_t v32 = v31;
        v32[1] = v33;
        swift_bridgeObjectRelease();
        sub_100C0A178(v29, (uint64_t)v28);
      }
      sub_100159398((uint64_t)v18, (void (*)(void))type metadata accessor for LocationPreviewViewAction);
      uint64_t v34 = (uint64_t)v15;
      uint64_t v35 = (void (*)(void))type metadata accessor for LocationPreviewViewAction;
      goto LABEL_19;
    }
    uint64_t v36 = v53;
    uint64_t v37 = v12;
    sub_1001669EC(v53 + OBJC_IVAR____TtCV7Weather9MainState8_Storage_modalView, (uint64_t)v12, (void (*)(void))type metadata accessor for ModalViewState);
    if (swift_getEnumCaseMultiPayload() == 4) {
      goto LABEL_18;
    }
    uint64_t v38 = v51;
    sub_100C09BD8(v36, v52, v51, 0xD00000000000001DLL, 0x8000000100CC1AB0);
    uint64_t v39 = (uint64_t)v9;
    sub_1001669EC(v36 + OBJC_IVAR____TtCV7Weather9MainState8_Storage_view, (uint64_t)v9, (void (*)(void))type metadata accessor for ViewState);
    sub_1001669EC((uint64_t)&v9[v7[5]], (uint64_t)v6, (void (*)(void))type metadata accessor for ViewState.SecondaryViewState);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v40 = v38;
      sub_100159398((uint64_t)v6, (void (*)(void))type metadata accessor for ViewState.SecondaryViewState);
    }
    else
    {
      uint64_t v41 = *v6;
      if (*(void *)(v39 + v7[9] + 8) != 1
        || (id v42 = [self currentDevice],
            [v42 userInterfaceIdiom],
            v42,
            (*(unsigned char *)(v39 + v7[7]) & 1) != 0))
      {
        uint64_t v40 = v38;
        sub_100159398(v39, (void (*)(void))type metadata accessor for ViewState);
        uint64_t v43 = v49;
        sub_1001669EC(v41 + OBJC_IVAR____TtCV7Weather23LocationViewerViewState8_Storage_activeLocationState, v49, (void (*)(void))type metadata accessor for LocationViewerActiveLocationState);
        swift_release();
        uint64_t v44 = sub_1001782AC();
        uint64_t v46 = v45;
        sub_100159398(v43, (void (*)(void))type metadata accessor for LocationViewerActiveLocationState);
        int v47 = v52;
LABEL_17:
        uint64_t v48 = (uint64_t *)(v40
                        + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_lastAssumedVisibleLocationID);
        *uint64_t v48 = v44;
        v48[1] = v46;
        swift_bridgeObjectRelease();
        sub_100C0A178(v36, (uint64_t)v47);
LABEL_18:
        sub_100159398((uint64_t)v18, (void (*)(void))type metadata accessor for LocationPreviewViewAction);
        uint64_t v35 = (void (*)(void))type metadata accessor for ModalViewState;
        uint64_t v34 = (uint64_t)v37;
        goto LABEL_19;
      }
      uint64_t v40 = v38;
      swift_release();
    }
    int v47 = v52;
    sub_100159398(v39, (void (*)(void))type metadata accessor for ViewState);
    uint64_t v44 = 0;
    uint64_t v46 = 0;
    goto LABEL_17;
  }
  if (EnumCaseMultiPayload == 4)
  {
    uint64_t v23 = v53;
    uint64_t v24 = sub_100177428(v53);
    uint64_t v25 = (uint64_t *)(v51
                    + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_lastAssumedVisibleLocationID);
    *uint64_t v25 = v24;
    v25[1] = v26;
    swift_bridgeObjectRelease();
    sub_100C0A178(v23, (uint64_t)v52);
    return;
  }
  uint64_t v35 = (void (*)(void))type metadata accessor for ModalViewAction;
  uint64_t v34 = (uint64_t)v21;
LABEL_19:
  sub_100159398(v34, v35);
}

uint64_t sub_100C0AC94(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v65 = a3;
  uint64_t v64 = a2;
  uint64_t v67 = a1;
  uint64_t v61 = type metadata accessor for SearchViewAction();
  __chkstk_darwin(v61);
  uint64_t v63 = (uint64_t)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v62 = (uint64_t)&v56 - v5;
  uint64_t v6 = type metadata accessor for Location();
  uint64_t v57 = *(void *)(v6 - 8);
  uint64_t v58 = v6;
  __chkstk_darwin(v6);
  uint64_t v56 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for InteractiveMapViewAction();
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v60 = (char *)&v56 - v12;
  uint64_t v13 = type metadata accessor for LocationViewerViewAction();
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Location.Identifier();
  uint64_t v59 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for ListViewAction();
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v56 - v23;
  uint64_t v25 = type metadata accessor for ViewAction();
  __chkstk_darwin(v25);
  int v27 = (char *)&v56 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1001669EC(v67, (uint64_t)v27, (void (*)(void))type metadata accessor for ViewAction);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      sub_100164E28((uint64_t)v27, (uint64_t)v24, (void (*)(void))type metadata accessor for ListViewAction);
      sub_1001669EC((uint64_t)v24, (uint64_t)v21, (void (*)(void))type metadata accessor for ListViewAction);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v28 = v59;
        (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v18, v21, v16);
        uint64_t v29 = Location.Identifier.id.getter();
        uint64_t v30 = (uint64_t *)(v66
                        + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_lastAssumedVisibleLocationID);
        uint64_t *v30 = v29;
        v30[1] = v31;
        swift_bridgeObjectRelease();
        sub_100C0A178(v64, (uint64_t)v65);
        (*(void (**)(char *, uint64_t))(v28 + 8))(v18, v16);
        uint64_t v32 = type metadata accessor for ListViewAction;
        goto LABEL_15;
      }
      uint64_t v41 = type metadata accessor for ListViewAction;
      sub_100159398((uint64_t)v24, (void (*)(void))type metadata accessor for ListViewAction);
      uint64_t v34 = (uint64_t)v21;
      goto LABEL_17;
    case 1u:
      sub_100164E28((uint64_t)v27, (uint64_t)v15, (void (*)(void))type metadata accessor for LocationViewerViewAction);
      sub_100C0B5CC((uint64_t)v15, v64, v65);
      uint64_t v33 = type metadata accessor for LocationViewerViewAction;
      uint64_t v34 = (uint64_t)v15;
      return sub_100159398(v34, (void (*)(void))v33);
    case 3u:
      uint64_t v35 = v62;
      sub_100164E28((uint64_t)v27, v62, (void (*)(void))type metadata accessor for SearchViewAction);
      uint64_t v36 = v63;
      sub_1001669EC(v35, v63, (void (*)(void))type metadata accessor for SearchViewAction);
      if (swift_getEnumCaseMultiPayload() == 5)
      {
        uint64_t v37 = v64;
        uint64_t v38 = sub_100177428(v64);
        uint64_t v39 = (uint64_t *)(v66
                        + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_lastAssumedVisibleLocationID);
        *uint64_t v39 = v38;
        v39[1] = v40;
        swift_bridgeObjectRelease();
        sub_100C0A178(v37, (uint64_t)v65);
      }
      uint64_t v41 = type metadata accessor for SearchViewAction;
      sub_100159398(v35, (void (*)(void))type metadata accessor for SearchViewAction);
      uint64_t v34 = v36;
      goto LABEL_17;
    case 4u:
      uint64_t v24 = v60;
      sub_100164E28((uint64_t)v27, (uint64_t)v60, (void (*)(void))type metadata accessor for InteractiveMapViewAction);
      sub_1001669EC((uint64_t)v24, (uint64_t)v10, (void (*)(void))type metadata accessor for InteractiveMapViewAction);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 6)
      {
        sub_100C09BD8(v64, v65, v66, 0xD00000000000001FLL, 0x8000000100CC1B50);
        uint64_t v32 = type metadata accessor for InteractiveMapViewAction;
LABEL_15:
        uint64_t v33 = v32;
        uint64_t v34 = (uint64_t)v24;
      }
      else
      {
        if (EnumCaseMultiPayload == 4)
        {
          uint64_t v44 = v56;
          uint64_t v43 = v57;
          uint64_t v45 = v58;
          (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v56, v10, v58);
          uint64_t v46 = Location.id.getter();
          uint64_t v48 = v47;
          (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v45);
          sub_100159398((uint64_t)v24, (void (*)(void))type metadata accessor for InteractiveMapViewAction);
          uint64_t v49 = (uint64_t *)(v66
                          + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_lastAssumedVisibleLocationID);
          uint64_t *v49 = v46;
          v49[1] = v48;
          return swift_bridgeObjectRelease();
        }
        uint64_t v41 = type metadata accessor for InteractiveMapViewAction;
        sub_100159398((uint64_t)v24, (void (*)(void))type metadata accessor for InteractiveMapViewAction);
        uint64_t v34 = (uint64_t)v10;
LABEL_17:
        uint64_t v33 = v41;
      }
      return sub_100159398(v34, (void (*)(void))v33);
    case 9u:
      uint64_t v51 = v64;
      uint64_t v52 = sub_100177428(v64);
      uint64_t v53 = v66;
      uint64_t v54 = (uint64_t *)(v66
                      + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_lastAssumedVisibleLocationID);
      *uint64_t v54 = v52;
      v54[1] = v55;
      swift_bridgeObjectRelease();
      return sub_100C09BD8(v51, v65, v53, 0xD00000000000001ALL, 0x8000000100CC1B10);
    default:
      uint64_t v33 = type metadata accessor for ViewAction;
      uint64_t v34 = (uint64_t)v27;
      return sub_100159398(v34, (void (*)(void))v33);
  }
}

uint64_t sub_100C0B40C(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for PreviewLocation();
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ActivityAction();
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1001669EC(a1, (uint64_t)v13, (void (*)(void))type metadata accessor for ActivityAction);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100164E28((uint64_t)v13, (uint64_t)v10, (void (*)(void))type metadata accessor for PreviewLocation);
    sub_100C09BD8(a2, a3, v4, 0xD00000000000001ALL, 0x8000000100CC1A90);
    sub_10081B8DC();
    uint64_t v14 = (void *)(v4
                   + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_lastAssumedVisibleLocationID);
    *uint64_t v14 = v15;
    v14[1] = v16;
    swift_bridgeObjectRelease();
    sub_100C0A178(a2, (uint64_t)a3);
    uint64_t v17 = type metadata accessor for PreviewLocation;
    uint64_t v18 = (uint64_t)v10;
  }
  else
  {
    uint64_t v17 = type metadata accessor for ActivityAction;
    uint64_t v18 = (uint64_t)v13;
  }
  return sub_100159398(v18, (void (*)(void))v17);
}

uint64_t sub_100C0B5CC(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for LocationModel();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for LocationViewerViewAction();
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1001669EC(a1, (uint64_t)v14, (void (*)(void))type metadata accessor for LocationViewerViewAction);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 0:
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v14, v8);
      sub_100C09BD8(a2, a3, v4, 0xD00000000000001BLL, 0x8000000100CC1B30);
      uint64_t v21 = LocationModel.id.getter();
      uint64_t v22 = (uint64_t *)(v4
                      + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_lastAssumedVisibleLocationID);
      *uint64_t v22 = v21;
      v22[1] = v23;
      swift_bridgeObjectRelease();
      sub_100C0A178(a2, (uint64_t)a3);
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    case 6:
      uint64_t v25 = OBJC_IVAR____TtCV7Weather9MainState8_Storage_view;
      uint64_t result = type metadata accessor for ViewState(0);
      if (*(void *)(a2 + *(int *)(result + 36) + v25 + 8) != 1) {
        return result;
      }
      uint64_t v20 = 0xD00000000000001ALL;
      unint64_t v16 = 0x8000000100CC1B10;
      uint64_t v17 = a2;
      uint64_t v18 = a3;
      uint64_t v19 = v4;
      return sub_100C09BD8(v17, v18, v19, v20, v16);
    case 5:
      unint64_t v16 = 0x8000000100CC1AF0;
      uint64_t v17 = a2;
      uint64_t v18 = a3;
      uint64_t v19 = v4;
      uint64_t v20 = 0xD00000000000001BLL;
      return sub_100C09BD8(v17, v18, v19, v20, v16);
  }
  return sub_100159398((uint64_t)v14, (void (*)(void))type metadata accessor for LocationViewerViewAction);
}

uint64_t sub_100C0B858@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v42 = type metadata accessor for _RegexFactory();
  uint64_t v50 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v4 = (char *)v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10017DF08(&qword_100EB9458);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v43 = v5;
  uint64_t v44 = v6;
  __chkstk_darwin(v5);
  uint64_t v41 = (uint64_t)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v40 = (char *)v37 - v9;
  uint64_t v10 = sub_10017DF08(&qword_100EB9428);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v48 = v10;
  uint64_t v49 = v11;
  __chkstk_darwin(v10);
  uint64_t v39 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v46 = (char *)v37 - v14;
  uint64_t v15 = sub_10017DF08(&qword_100EB9460);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)v37 - v20;
  __chkstk_darwin(v22);
  uint64_t v47 = (char *)v37 - v23;
  uint64_t v55 = 0x6E6F697461636F4CLL;
  uint64_t v56 = 0xEB000000003A4449;
  sub_1002AE264();
  static RegexComponentBuilder.buildExpression<A>(_:)();
  uint64_t v52 = a1;
  sub_100C0C310((void (*)(uint64_t))sub_100C0D26C);
  uint64_t v24 = sub_1001246C8(&qword_100EB9468, &qword_100EB9460);
  static RegexComponentBuilder.buildExpression<A>(_:)();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v16 + 8);
  v25(v21, v15);
  uint64_t v38 = v25;
  v37[2] = v16 + 8;
  uint64_t v53 = 58;
  unint64_t v54 = 0xE100000000000000;
  static RegexComponentBuilder.buildExpression<A>(_:)();
  uint64_t v51 = a1;
  sub_100C0C310((void (*)(uint64_t))sub_100C0D29C);
  v37[1] = v24;
  static RegexComponentBuilder.buildExpression<A>(_:)();
  v25(v18, v15);
  uint64_t v53 = v57;
  unint64_t v54 = v58;
  static RegexComponentBuilder.buildPartialBlock<A>(first:)();
  swift_bridgeObjectRelease();
  makeFactory()();
  sub_1001246C8(&qword_100EB9470, &qword_100EB9428);
  uint64_t v26 = v39;
  uint64_t v27 = v48;
  _RegexFactory.ignoreCapturesInTypedOutput<A>(_:)();
  sub_10017DF08(&qword_100EB9478);
  uint64_t v28 = (uint64_t)v40;
  _RegexFactory.accumulate<A, B, C>(_:_:)();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v49 + 8);
  v49 += 8;
  v29(v26, v27);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v50 + 8);
  v50 += 8;
  uint64_t v31 = v42;
  v30(v4, v42);
  uint64_t v32 = v41;
  sub_100C0CC70(v28, v55, v56, v41);
  swift_bridgeObjectRelease();
  makeFactory()();
  sub_10017DF08(&qword_100EB9448);
  sub_1001246C8(&qword_100EB9480, &qword_100EB9458);
  uint64_t v33 = v43;
  _RegexFactory.accumulate<A, B, C>(_:_:)();
  v30(v4, v31);
  uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
  v34(v32, v33);
  v34(v28, v33);
  v29(v46, v48);
  uint64_t v35 = (uint64_t (*)(char *, uint64_t))v38;
  v38(v21, v15);
  return v35(v47, v15);
}

uint64_t sub_100C0BE94@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  v15[0] = a1;
  v15[1] = a2;
  uint64_t v2 = sub_10017DF08(&qword_100EB9428);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v15 - v7;
  uint64_t v9 = type metadata accessor for _RegexFactory();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  makeFactory()();
  sub_1001246C8(&qword_100EB9470, &qword_100EB9428);
  _RegexFactory.ignoreCapturesInTypedOutput<A>(_:)();
  sub_10017DF08(&qword_100EB9438);
  sub_1001246C8(&qword_100EB9498, &qword_100EB9438);
  _RegexFactory.ignoreCapturesInTypedOutput<A>(_:)();
  _RegexFactory.accumulate<A, B, C>(_:_:)();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v3 + 8);
  v13(v5, v2);
  v13(v8, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_100C0C0F4@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  v16[1] = a3;
  uint64_t v5 = sub_10017DF08(&qword_100EB9428);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v10 = type metadata accessor for _RegexFactory();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = makeFactory()();
  a2(v14);
  sub_1001246C8(&qword_100EB9470, &qword_100EB9428);
  _RegexFactory.oneOrMore<A, B>(_:_:)();
  sub_100178160(a1, &qword_100EB9430);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return OneOrMore.init(_:)();
}

uint64_t sub_100C0C310(void (*a1)(uint64_t))
{
  uint64_t v2 = sub_10017DF08(&qword_100EB9428);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10017DF08(&qword_100EB9458);
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = type metadata accessor for _RegexFactory();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = makeFactory()();
  a1(v11);
  sub_10017DF08(&qword_100EB9478);
  sub_1001246C8(&qword_100EB9470, &qword_100EB9428);
  _RegexFactory.capture<A, B>(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return Capture.init(_:)();
}

uint64_t sub_100C0C540@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v48 = a2;
  uint64_t v51 = a3;
  sub_10017DF08(&qword_100EB9438);
  sub_100179C0C();
  uint64_t v49 = v4;
  uint64_t v50 = v5;
  __chkstk_darwin(v4);
  sub_100162EF8();
  uint64_t v45 = v6;
  __chkstk_darwin(v7);
  uint64_t v46 = (char *)&v38 - v8;
  uint64_t v9 = sub_10017DF08(&qword_100EB9428);
  sub_100179C0C();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v38 - v16;
  uint64_t v44 = (uint64_t (*)(char *, uint64_t))type metadata accessor for _RegexFactory();
  sub_100179C0C();
  __chkstk_darwin(v18);
  sub_1001626E0();
  uint64_t v19 = sub_10017DF08(&qword_100EB9430);
  __chkstk_darwin(v19 - 8);
  sub_1001626E0();
  uint64_t v22 = v21 - v20;
  uint64_t v23 = sub_10017DF08(&qword_100EB9488);
  sub_100179C0C();
  uint64_t v53 = v24;
  __chkstk_darwin(v25);
  sub_100158494();
  __chkstk_darwin(v26);
  uint64_t v52 = (char *)&v38 - v27;
  uint64_t v40 = type metadata accessor for RegexRepetitionBehavior();
  _s7Weather24LocationCompositionStateOwst_0(v22, 1, 1, v40);
  makeFactory()();
  sub_100C0C9E4();
  sub_1001246C8(&qword_100EB9470, &qword_100EB9428);
  uint64_t v39 = v17;
  uint64_t v41 = v9;
  _RegexFactory.zeroOrMore<A, B>(_:_:)();
  sub_100178160(v22, &qword_100EB9430);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v43 = v11 + 8;
  v42(v14, v9);
  sub_100164FC8();
  v28();
  ZeroOrMore.init(_:)();
  sub_1001246C8(&qword_100EB9490, &qword_100EB9488);
  uint64_t v38 = v23;
  static RegexComponentBuilder.buildExpression<A>(_:)();
  uint64_t v29 = *(uint64_t (**)(char *, uint64_t))(v53 + 8);
  v53 += 8;
  uint64_t v44 = v29;
  v29(v3, v23);
  _s7Weather24LocationCompositionStateOwst_0(v22, 1, 1, v40);
  uint64_t v54 = v47;
  uint64_t v30 = v45;
  sub_100C0C0F4(v22, v48, v45);
  sub_1001246C8(&qword_100EB9498, &qword_100EB9438);
  uint64_t v31 = (uint64_t)v46;
  static RegexComponentBuilder.buildExpression<A>(_:)();
  uint64_t v32 = *(void (**)(void))(v50 + 8);
  sub_100164FC8();
  v32();
  static RegexComponentBuilder.buildExpression<A>(_:)();
  uint64_t v33 = v39;
  uint64_t v34 = v38;
  static RegexComponentBuilder.buildPartialBlock<A>(first:)();
  sub_100C0BE94(v31, (uint64_t)v14);
  sub_100C0BE94(v30, v51);
  uint64_t v35 = v41;
  uint64_t v36 = v42;
  v42(v14, v41);
  v36(v33, v35);
  sub_100164FC8();
  v32();
  sub_100164FC8();
  v32();
  return v44(v52, v34);
}

uint64_t sub_100C0C9E4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100C0CA68()
{
  type metadata accessor for _RegexFactory();
  sub_100179C0C();
  __chkstk_darwin(v1);
  sub_10012B938();
  uint64_t v14 = sub_10017DF08(&qword_100EB9428);
  sub_100179C0C();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_1001626E0();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_10017DF08(&qword_100EB9438);
  sub_100179C0C();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_10011C760();
  sub_1001246C8(&qword_100EB9498, &qword_100EB9438);
  static RegexComponentBuilder.buildExpression<A>(_:)();
  sub_1002AE264();
  static RegexComponentBuilder.buildExpression<A>(_:)();
  static RegexComponentBuilder.buildPartialBlock<A>(first:)();
  makeFactory()();
  sub_100C0D0C0(v7, v15, v16);
  sub_100164FC8();
  v12();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v14);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v0, v8);
}

uint64_t sub_100C0CC70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v15[0] = a4;
  v15[1] = a1;
  uint64_t v6 = sub_10017DF08(&qword_100EB9428);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for _RegexFactory();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  makeFactory()();
  void v15[2] = a2;
  v15[3] = a3;
  sub_1002AE264();
  _RegexFactory.ignoreCapturesInTypedOutput<A>(_:)();
  sub_10017DF08(&qword_100EB9478);
  sub_10017DF08(&qword_100EB9458);
  sub_1001246C8(&qword_100EB9480, &qword_100EB9458);
  sub_1001246C8(&qword_100EB9470, &qword_100EB9428);
  _RegexFactory.accumulate<A, B, C>(_:_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_100C0CE94()
{
  type metadata accessor for Logger();
  sub_100162E4C();
  uint64_t v1 = sub_100162728();
  v2(v1);
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v0 + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_queue);
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v0 + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_backend);
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v0 + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_clock);
  sub_100178160(v0 + OBJC_IVAR____TtC7Weather42WeatherDataVisibleLocationLoadingTelemetry_startLoadTime, (uint64_t *)&unk_100E73CA0);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100C0CF44()
{
  sub_100C0CE94();

  return swift_deallocClassInstance();
}

uint64_t sub_100C0CF9C()
{
  return type metadata accessor for WeatherDataVisibleLocationLoadingTelemetry();
}

uint64_t sub_100C0CFA4()
{
  uint64_t v1 = *(void *)(sub_10017DF08(&qword_100EB9408) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  swift_release();
  swift_release();
  if (*(void *)(v0 + v2 + 32)) {
    _s7Weather29UVIDescriptorViewModelFactoryVwxx_0(v0 + v2 + 8);
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  type metadata accessor for Date();
  sub_100162E4C();
  uint64_t v3 = sub_100162728();
  v4(v3);

  return swift_deallocObject();
}

uint64_t sub_100C0D0C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10017DF08(&qword_100EB9428);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v14 - v10;
  v14[0] = a2;
  v14[1] = a3;
  sub_1001246C8(&qword_100EB9470, &qword_100EB9428);
  _RegexFactory.ignoreCapturesInTypedOutput<A>(_:)();
  sub_1002AE264();
  _RegexFactory.ignoreCapturesInTypedOutput<A>(_:)();
  _RegexFactory.accumulate<A, B, C>(_:_:)();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v6 + 8);
  v12(v8, v5);
  return ((uint64_t (*)(char *, uint64_t))v12)(v11, v5);
}

uint64_t sub_100C0D264@<X0>(uint64_t a1@<X8>)
{
  return sub_100C0B858(*(void *)(v1 + 16), a1);
}

uint64_t sub_100C0D26C@<X0>(uint64_t a1@<X8>)
{
  return sub_100C0C540(*(void *)(v1 + 16), (void (*)(uint64_t))sub_100C0D2E8, a1);
}

uint64_t sub_100C0D29C@<X0>(uint64_t a1@<X8>)
{
  return sub_100C0C540(*(void *)(v1 + 16), (void (*)(uint64_t))sub_100C0D2CC, a1);
}

uint64_t sub_100C0D2CC()
{
  return sub_100C0CA68();
}

uint64_t *sub_100C0D2EC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Date();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for TimeZone();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
    uint64_t v14 = a3[9];
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = type metadata accessor for ConditionUnits();
    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18(v15, v16, v17);
    uint64_t v19 = a3[10];
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = type metadata accessor for ExtremaResult();
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v21, 1, v22))
    {
      uint64_t v23 = sub_10017DF08(&qword_100E6BCB0);
      memcpy(v20, v21, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v20, 0, 1, v22);
    }
    uint64_t v25 = a3[11];
    uint64_t v26 = (char *)a1 + v25;
    uint64_t v27 = (char *)a2 + v25;
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)a2 + v25, 1, v22))
    {
      uint64_t v28 = sub_10017DF08(&qword_100E6BCB0);
      memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v26, v27, v22);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v26, 0, 1, v22);
    }
    uint64_t v29 = a3[12];
    uint64_t v30 = (char *)a1 + v29;
    uint64_t v31 = (char *)a2 + v29;
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)a2 + v29, 1, v22))
    {
      uint64_t v32 = sub_10017DF08(&qword_100E6BCB0);
      memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v30, v31, v22);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v30, 0, 1, v22);
    }
    uint64_t v33 = a3[13];
    uint64_t v34 = (char *)a1 + v33;
    uint64_t v35 = (char *)a2 + v33;
    if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v35, 1, v22))
    {
      uint64_t v36 = sub_10017DF08(&qword_100E6BCB0);
      memcpy(v34, v35, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v34, v35, v22);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v34, 0, 1, v22);
    }
  }
  return a1;
}

uint64_t sub_100C0D708(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for Date();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = type metadata accessor for TimeZone();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = a1 + a2[9];
  uint64_t v9 = type metadata accessor for ConditionUnits();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + a2[10];
  uint64_t v11 = type metadata accessor for ExtremaResult();
  if (!_s7Weather24LocationCompositionStateOwet_0(v10, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  uint64_t v12 = a1 + a2[11];
  if (!_s7Weather24LocationCompositionStateOwet_0(v12, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v12, v11);
  }
  uint64_t v13 = a1 + a2[12];
  if (!_s7Weather24LocationCompositionStateOwet_0(v13, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v13, v11);
  }
  uint64_t v14 = a1 + a2[13];
  uint64_t result = _s7Weather24LocationCompositionStateOwet_0(v14, 1, v11);
  if (!result)
  {
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
    return v16(v14, v11);
  }
  return result;
}

uint64_t sub_100C0D984(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for TimeZone();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = type metadata accessor for ConditionUnits();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17(v14, v15, v16);
  uint64_t v18 = a3[10];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  uint64_t v21 = type metadata accessor for ExtremaResult();
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v20, 1, v21))
  {
    uint64_t v22 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v19, 0, 1, v21);
  }
  uint64_t v23 = a3[11];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (const void *)(a2 + v23);
  if (_s7Weather24LocationCompositionStateOwet_0(a2 + v23, 1, v21))
  {
    uint64_t v26 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v21 - 8) + 16))(v24, v25, v21);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v24, 0, 1, v21);
  }
  uint64_t v27 = a3[12];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (const void *)(a2 + v27);
  if (_s7Weather24LocationCompositionStateOwet_0(a2 + v27, 1, v21))
  {
    uint64_t v30 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v21 - 8) + 16))(v28, v29, v21);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v28, 0, 1, v21);
  }
  uint64_t v31 = a3[13];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (const void *)(a2 + v31);
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v33, 1, v21))
  {
    uint64_t v34 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v21 - 8) + 16))(v32, v33, v21);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v32, 0, 1, v21);
  }
  return a1;
}

uint64_t sub_100C0DD50(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for TimeZone();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[9];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for ConditionUnits();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = a3[10];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = type metadata accessor for ExtremaResult();
  int v20 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v17, 1, v19);
  int v21 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v18, 1, v19);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v17, 0, 1, v19);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v22 = *(void *)(v19 - 8);
  if (v21)
  {
    (*(void (**)(void *, uint64_t))(v22 + 8))(v17, v19);
LABEL_6:
    uint64_t v23 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v17, v18, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v22 + 24))(v17, v18, v19);
LABEL_7:
  uint64_t v24 = a3[11];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (const void *)(a2 + v24);
  int v27 = _s7Weather24LocationCompositionStateOwet_0(a1 + v24, 1, v19);
  int v28 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v26, 1, v19);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 16))(v25, v26, v19);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v25, 0, 1, v19);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v29 = *(void *)(v19 - 8);
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v29 + 8))(v25, v19);
LABEL_12:
    uint64_t v30 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v25, v26, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, const void *, uint64_t))(v29 + 24))(v25, v26, v19);
LABEL_13:
  uint64_t v31 = a3[12];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (const void *)(a2 + v31);
  int v34 = _s7Weather24LocationCompositionStateOwet_0(a1 + v31, 1, v19);
  int v35 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v33, 1, v19);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 16))(v32, v33, v19);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v32, 0, 1, v19);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v36 = *(void *)(v19 - 8);
  if (v35)
  {
    (*(void (**)(void *, uint64_t))(v36 + 8))(v32, v19);
LABEL_18:
    uint64_t v37 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v32, v33, *(void *)(*(void *)(v37 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, const void *, uint64_t))(v36 + 24))(v32, v33, v19);
LABEL_19:
  uint64_t v38 = a3[13];
  uint64_t v39 = (void *)(a1 + v38);
  uint64_t v40 = (const void *)(a2 + v38);
  int v41 = _s7Weather24LocationCompositionStateOwet_0(a1 + v38, 1, v19);
  int v42 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v40, 1, v19);
  if (!v41)
  {
    uint64_t v43 = *(void *)(v19 - 8);
    if (!v42)
    {
      (*(void (**)(void *, const void *, uint64_t))(v43 + 24))(v39, v40, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v43 + 8))(v39, v19);
    goto LABEL_24;
  }
  if (v42)
  {
LABEL_24:
    uint64_t v44 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v39, v40, *(void *)(*(void *)(v44 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 16))(v39, v40, v19);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v39, 0, 1, v19);
  return a1;
}

uint64_t sub_100C0E324(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for TimeZone();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = type metadata accessor for ConditionUnits();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  uint64_t v17 = a3[10];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (const void *)(a2 + v17);
  uint64_t v20 = type metadata accessor for ExtremaResult();
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v19, 1, v20))
  {
    uint64_t v21 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v18, 0, 1, v20);
  }
  uint64_t v22 = a3[11];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  if (_s7Weather24LocationCompositionStateOwet_0(a2 + v22, 1, v20))
  {
    uint64_t v25 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v20 - 8) + 32))(v23, v24, v20);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v23, 0, 1, v20);
  }
  uint64_t v26 = a3[12];
  int v27 = (void *)(a1 + v26);
  int v28 = (const void *)(a2 + v26);
  if (_s7Weather24LocationCompositionStateOwet_0(a2 + v26, 1, v20))
  {
    uint64_t v29 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v20 - 8) + 32))(v27, v28, v20);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v27, 0, 1, v20);
  }
  uint64_t v30 = a3[13];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (const void *)(a2 + v30);
  if (_s7Weather24LocationCompositionStateOwet_0((uint64_t)v32, 1, v20))
  {
    uint64_t v33 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v20 - 8) + 32))(v31, v32, v20);
    _s7Weather24LocationCompositionStateOwst_0((uint64_t)v31, 0, 1, v20);
  }
  return a1;
}

uint64_t sub_100C0E6CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for TimeZone();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[9];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for ConditionUnits();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[10];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = type metadata accessor for ExtremaResult();
  int v20 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v17, 1, v19);
  int v21 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v18, 1, v19);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v17, 0, 1, v19);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v22 = *(void *)(v19 - 8);
  if (v21)
  {
    (*(void (**)(void *, uint64_t))(v22 + 8))(v17, v19);
LABEL_6:
    uint64_t v23 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v17, v18, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v22 + 40))(v17, v18, v19);
LABEL_7:
  uint64_t v24 = a3[11];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (const void *)(a2 + v24);
  int v27 = _s7Weather24LocationCompositionStateOwet_0(a1 + v24, 1, v19);
  int v28 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v26, 1, v19);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 32))(v25, v26, v19);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v25, 0, 1, v19);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v29 = *(void *)(v19 - 8);
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v29 + 8))(v25, v19);
LABEL_12:
    uint64_t v30 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v25, v26, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, const void *, uint64_t))(v29 + 40))(v25, v26, v19);
LABEL_13:
  uint64_t v31 = a3[12];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (const void *)(a2 + v31);
  int v34 = _s7Weather24LocationCompositionStateOwet_0(a1 + v31, 1, v19);
  int v35 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v33, 1, v19);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 32))(v32, v33, v19);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v32, 0, 1, v19);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v36 = *(void *)(v19 - 8);
  if (v35)
  {
    (*(void (**)(void *, uint64_t))(v36 + 8))(v32, v19);
LABEL_18:
    uint64_t v37 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v32, v33, *(void *)(*(void *)(v37 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, const void *, uint64_t))(v36 + 40))(v32, v33, v19);
LABEL_19:
  uint64_t v38 = a3[13];
  uint64_t v39 = (void *)(a1 + v38);
  uint64_t v40 = (const void *)(a2 + v38);
  int v41 = _s7Weather24LocationCompositionStateOwet_0(a1 + v38, 1, v19);
  int v42 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v40, 1, v19);
  if (!v41)
  {
    uint64_t v43 = *(void *)(v19 - 8);
    if (!v42)
    {
      (*(void (**)(void *, const void *, uint64_t))(v43 + 40))(v39, v40, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v43 + 8))(v39, v19);
    goto LABEL_24;
  }
  if (v42)
  {
LABEL_24:
    uint64_t v44 = sub_10017DF08(&qword_100E6BCB0);
    memcpy(v39, v40, *(void *)(*(void *)(v44 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 32))(v39, v40, v19);
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v39, 0, 1, v19);
  return a1;
}

uint64_t sub_100C0EC90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100C0ECA4);
}

uint64_t sub_100C0ECA4(uint64_t a1, uint64_t a2, int *a3)
{
  type metadata accessor for Date();
  sub_100162F30();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_13:
    return _s7Weather24LocationCompositionStateOwet_0(v9, a2, v8);
  }
  type metadata accessor for TimeZone();
  sub_100162F30();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v12 = a3[6];
LABEL_12:
    uint64_t v9 = a1 + v12;
    goto LABEL_13;
  }
  if (a2 != 0x7FFFFFFF)
  {
    type metadata accessor for ConditionUnits();
    sub_100162F30();
    if (*(_DWORD *)(v16 + 84) == a2)
    {
      uint64_t v8 = v15;
      uint64_t v12 = a3[9];
    }
    else
    {
      uint64_t v8 = sub_10017DF08(&qword_100E6BCB0);
      uint64_t v12 = a3[10];
    }
    goto LABEL_12;
  }
  unint64_t v13 = *(void *)(a1 + a3[7]);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t sub_100C0EDA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100C0EDB4);
}

void sub_100C0EDB4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  type metadata accessor for Date();
  sub_100162F30();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    type metadata accessor for TimeZone();
    sub_100162F30();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[6];
    }
    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(void *)(a1 + a4[7]) = (a2 - 1);
        return;
      }
      type metadata accessor for ConditionUnits();
      sub_100162F30();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[9];
      }
      else
      {
        uint64_t v10 = sub_10017DF08(&qword_100E6BCB0);
        uint64_t v14 = a4[10];
      }
    }
    uint64_t v11 = a1 + v14;
  }

  _s7Weather24LocationCompositionStateOwst_0(v11, a2, a2, v10);
}

uint64_t type metadata accessor for PastDataComparisonTextContext()
{
  uint64_t result = qword_100EB94F8;
  if (!qword_100EB94F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100C0EEF4()
{
  type metadata accessor for Date();
  if (v0 <= 0x3F)
  {
    type metadata accessor for TimeZone();
    if (v1 <= 0x3F)
    {
      type metadata accessor for ConditionUnits();
      if (v2 <= 0x3F)
      {
        sub_100312A24();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

uint64_t type metadata accessor for NoAqiContentView()
{
  return sub_100109098();
}

uint64_t sub_100C0F060()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100C0F0A4@<X0>(uint64_t a1@<X0>, __int16 a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v57 = a7;
  uint64_t v58 = a6;
  uint64_t v45 = a4;
  uint64_t v52 = a3;
  v70[0] = a5;
  v70[1] = a5;
  v70[2] = a5;
  v70[3] = a5;
  int v9 = a2;
  unsigned int v10 = a2 & 0x100;
  v70[4] = a5;
  v70[5] = a5;
  v70[6] = a5;
  v70[7] = a5;
  sub_100179D2C();
  uint64_t v50 = sub_10017F7C0();
  uint64_t v56 = type metadata accessor for Group();
  sub_100179C0C();
  uint64_t v53 = v11;
  __chkstk_darwin(v12);
  sub_100162EF8();
  uint64_t v55 = v13;
  __chkstk_darwin(v14);
  uint64_t v54 = (uint64_t)&v41 - v15;
  v70[0] = type metadata accessor for Optional();
  v70[1] = a5;
  v70[2] = a5;
  v70[3] = a5;
  v70[4] = a5;
  sub_100179D2C();
  sub_10017F7C0();
  uint64_t v51 = type metadata accessor for Group();
  sub_100179C0C();
  uint64_t v49 = v16;
  __chkstk_darwin(v17);
  sub_100162EF8();
  uint64_t v59 = v18;
  __chkstk_darwin(v19);
  uint64_t v60 = (uint64_t)&v41 - v20;
  if (v9)
  {
    if (v9 == 1)
    {
      if (v10)
      {
        int v21 = &unk_100E700F0;
        goto LABEL_11;
      }
    }
    else if (v10)
    {
      int v21 = &unk_100E70440;
      goto LABEL_11;
    }
    int v21 = &unk_100E70298;
    goto LABEL_11;
  }
  if (v10) {
    int v21 = &unk_100E6FDA0;
  }
  else {
    int v21 = &unk_100E6FF48;
  }
LABEL_11:
  memcpy(v70, v21, sizeof(v70));
  uint64_t v22 = memcpy(v69, v70, sizeof(v69));
  __chkstk_darwin(v22);
  uint64_t v23 = v58;
  *(&v41 - 8) = a5;
  *(&v41 - 7) = v23;
  *(&v41 - 6) = a1;
  *((unsigned char *)&v41 - 40) = v9;
  uint64_t v44 = a1;
  int v42 = v9;
  unsigned int v43 = v10 >> 8;
  *((unsigned char *)&v41 - 39) = BYTE1(v10);
  uint64_t v24 = v45;
  *(&v41 - 4) = v52;
  *(&v41 - 3) = v24;
  *(&v41 - 2) = (uint64_t)v69;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v26 = v59;
  Group<A>.init(content:)();
  uint64_t v68 = WitnessTable;
  uint64_t v27 = v51;
  uint64_t v46 = swift_getWitnessTable();
  sub_100121584(v26, v27, v60);
  uint64_t v28 = v49;
  uint64_t v47 = *(uint64_t (**)(uint64_t, uint64_t))(v49 + 8);
  uint64_t v48 = v49 + 8;
  uint64_t v29 = v47(v26, v27);
  __chkstk_darwin(v29);
  uint64_t v30 = v58;
  *(&v41 - 8) = a5;
  *(&v41 - 7) = v30;
  *(&v41 - 6) = v44;
  *((unsigned char *)&v41 - 40) = v42;
  *((unsigned char *)&v41 - 39) = v43;
  *(&v41 - 4) = v31;
  *(&v41 - 3) = v24;
  *(&v41 - 2) = (uint64_t)v69;
  uint64_t v32 = swift_getWitnessTable();
  uint64_t v33 = v55;
  Group<A>.init(content:)();
  uint64_t v67 = v32;
  uint64_t v34 = v56;
  uint64_t v58 = swift_getWitnessTable();
  uint64_t v35 = v54;
  sub_100121584(v33, v34, v54);
  uint64_t v36 = v53;
  uint64_t v37 = *(void (**)(void))(v53 + 8);
  sub_10017C768();
  v37();
  uint64_t v38 = v59;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v59, v60, v27);
  uint64_t v65 = v38;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v33, v35, v34);
  uint64_t v66 = v33;
  uint64_t v63 = v27;
  uint64_t v64 = v34;
  uint64_t v61 = v46;
  uint64_t v62 = v58;
  sub_1006E9080();
  sub_10017C768();
  v37();
  uint64_t v39 = v47;
  v47(v60, v27);
  sub_10017C768();
  v37();
  return v39(v38, v27);
}

uint64_t sub_100C0F568@<X0>(uint64_t a1@<X0>, void (*a2)(char *, void, void, void, void)@<X2>, void *a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v79 = a3;
  uint64_t v78 = a2;
  uint64_t v76 = a6;
  uint64_t v87 = *(void *)(a4 - 8);
  __chkstk_darwin(a1);
  uint64_t v77 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v86 = (char *)&v72 - v11;
  __chkstk_darwin(v12);
  double v85 = (char *)&v72 - v13;
  __chkstk_darwin(v14);
  double v84 = (char *)&v72 - v15;
  __chkstk_darwin(v16);
  uint64_t v75 = (char *)&v72 - v17;
  __chkstk_darwin(v18);
  uint64_t v83 = (char *)&v72 - v19;
  __chkstk_darwin(v20);
  uint64_t v90 = (char *)&v72 - v21;
  __chkstk_darwin(v22);
  uint64_t v91 = (uint64_t)&v72 - v23;
  uint64_t v24 = sub_10017DF08(&qword_100E64E80);
  __chkstk_darwin(v24 - 8);
  uint64_t v26 = (char *)&v72 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for LocationComponentContainerViewModel();
  __chkstk_darwin(v27);
  uint64_t v29 = (char *)&v72 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v32 = (char *)&v72 - v31;
  uint64_t v89 = type metadata accessor for Optional();
  uint64_t v81 = *(void *)(v89 - 8);
  __chkstk_darwin(v89);
  uint64_t v34 = (char *)&v72 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35);
  uint64_t v88 = (char *)&v72 - v36;
  uint64_t v82 = a1;
  uint64_t v37 = a1 + OBJC_IVAR____TtCV7Weather12NoAqiContent8_Storage_map;
  swift_beginAccess();
  sub_10027A764(v37, (uint64_t)v26);
  BOOL v38 = _s7Weather24LocationCompositionStateOwet_0((uint64_t)v26, 1, v27) == 1;
  uint64_t v80 = v34;
  if (v38)
  {
    sub_10027A7CC((uint64_t)v26);
  }
  else
  {
    sub_10027A82C((uint64_t)v26, (uint64_t)v32);
    sub_10027A890((uint64_t)(v79 + 20), (uint64_t)v108);
    sub_10027A890((uint64_t)v108, (uint64_t)v109);
    if (v110 != 1)
    {
      uint64_t v40 = (uint64_t)v90;
      v78(v32, v109[0], v109[1], v109[2], v109[3]);
      sub_1001F2B74((uint64_t)v32);
      uint64_t v41 = v91;
      uint64_t v39 = a5;
      sub_100121584(v40, a4, v91);
      int v42 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
      v42(v40, a4);
      sub_100121584(v41, a4, (uint64_t)v34);
      v42(v41, a4);
      _s7Weather24LocationCompositionStateOwst_0((uint64_t)v34, 0, 1, a4);
      goto LABEL_8;
    }
    sub_1001F2B74((uint64_t)v32);
  }
  _s7Weather24LocationCompositionStateOwst_0((uint64_t)v34, 1, 1, a4);
  uint64_t v39 = a5;
LABEL_8:
  sub_1000CA354();
  unsigned int v43 = *(void (**)(char *, uint64_t))(v81 + 8);
  uint64_t v74 = (v81 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v43(v34, v89);
  uint64_t v44 = v82;
  sub_1001F3734(*(void *)(v82 + 16) + OBJC_IVAR____TtCV7Weather28LocationCommonViewComponents8_Storage_hourlyForecast, (uint64_t)v29);
  uint64_t v45 = v79;
  uint64_t v46 = (uint64_t)v90;
  uint64_t v47 = v78;
  v78(v29, v79[12], v79[13], v79[14], v79[15]);
  sub_1001F2B74((uint64_t)v29);
  sub_100121584(v46, a4, v91);
  uint64_t v73 = v39;
  uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
  v48(v46, a4);
  sub_1001F3734(*(void *)(v44 + 16) + OBJC_IVAR____TtCV7Weather28LocationCommonViewComponents8_Storage_dailyForecast, (uint64_t)v29);
  uint64_t v49 = (uint64_t)v83;
  v47(v29, v45[4], v45[5], v45[6], v45[7]);
  sub_1001F2B74((uint64_t)v29);
  uint64_t v50 = v46;
  uint64_t v51 = v49;
  sub_100121584(v49, a4, v50);
  v48(v49, a4);
  uint64_t v52 = v82;
  sub_1001F3734(*(void *)(v82 + 16) + OBJC_IVAR____TtCV7Weather28LocationCommonViewComponents8_Storage_uvIndex, (uint64_t)v29);
  uint64_t v53 = (uint64_t)v75;
  v47(v29, v45[41], v45[42], v45[43], v45[44]);
  sub_1001F2B74((uint64_t)v29);
  uint64_t v54 = v51;
  uint64_t v55 = v73;
  sub_100121584(v53, a4, v54);
  v48(v53, a4);
  sub_1001F3734(*(void *)(v52 + 16) + OBJC_IVAR____TtCV7Weather28LocationCommonViewComponents8_Storage_sunriseSunset, (uint64_t)v29);
  uint64_t v56 = v45[37];
  uint64_t v57 = v45[38];
  uint64_t v58 = v45[39];
  uint64_t v59 = v45[40];
  uint64_t v60 = (uint64_t)v84;
  v47(v29, v56, v57, v58, v59);
  sub_1001F2B74((uint64_t)v29);
  uint64_t v61 = v55;
  sub_100121584(v60, a4, v53);
  v48(v60, a4);
  uint64_t v62 = v81 + 16;
  uint64_t v63 = v80;
  (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v80, v88, v89);
  uint64_t v103 = v63;
  uint64_t v64 = *(void (**)(uint64_t, uint64_t, uint64_t))(v87 + 16);
  v64(v60, v91, a4);
  uint64_t v104 = v60;
  uint64_t v65 = v85;
  v64((uint64_t)v85, (uint64_t)v90, a4);
  uint64_t v105 = v65;
  uint64_t v66 = v86;
  uint64_t v67 = v83;
  v64((uint64_t)v86, (uint64_t)v83, a4);
  uint64_t v106 = v66;
  uint64_t v68 = v77;
  v64((uint64_t)v77, v53, a4);
  uint64_t v107 = v68;
  uint64_t v69 = v89;
  uint64_t v98 = v89;
  uint64_t v99 = a4;
  uint64_t v100 = a4;
  uint64_t v101 = a4;
  uint64_t v102 = a4;
  uint64_t v92 = v61;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v94 = v61;
  uint64_t v95 = v61;
  uint64_t v96 = v61;
  uint64_t v97 = v61;
  sub_1006E9080();
  v48(v53, a4);
  v48((uint64_t)v67, a4);
  v48((uint64_t)v90, a4);
  v48(v91, a4);
  uint64_t v70 = *(void (**)(char *, uint64_t))(v62 - 8);
  v70(v88, v69);
  v48((uint64_t)v68, a4);
  v48((uint64_t)v86, a4);
  v48((uint64_t)v85, a4);
  v48((uint64_t)v84, a4);
  return ((uint64_t (*)(char *, uint64_t))v70)(v80, v69);
}

uint64_t sub_100C0FED0@<X0>(uint64_t a1@<X0>, void (*a2)(char *, uint64_t, uint64_t, uint64_t, uint64_t)@<X2>, uint64_t *a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v102 = a5;
  uint64_t v84 = a6;
  uint64_t v10 = type metadata accessor for LocationComponentContainerViewModel();
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = *(void *)(a4 - 8);
  uint64_t v13 = v82;
  __chkstk_darwin(v14);
  uint64_t v83 = (char *)&v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v98 = (char *)&v82 - v17;
  __chkstk_darwin(v18);
  uint64_t v97 = (char *)&v82 - v19;
  __chkstk_darwin(v20);
  uint64_t v96 = (char *)&v82 - v21;
  __chkstk_darwin(v22);
  uint64_t v95 = (char *)&v82 - v23;
  __chkstk_darwin(v24);
  uint64_t v93 = (char *)&v82 - v25;
  __chkstk_darwin(v26);
  uint64_t v92 = (char *)&v82 - v27;
  __chkstk_darwin(v28);
  uint64_t v90 = (char *)&v82 - v29;
  __chkstk_darwin(v30);
  uint64_t v89 = (char *)&v82 - v31;
  __chkstk_darwin(v32);
  uint64_t v101 = (char *)&v82 - v33;
  __chkstk_darwin(v34);
  uint64_t v87 = (char *)&v82 - v35;
  __chkstk_darwin(v36);
  uint64_t v86 = (char *)&v82 - v37;
  __chkstk_darwin(v38);
  uint64_t v100 = (char *)&v82 - v39;
  __chkstk_darwin(v40);
  int v42 = (char *)&v82 - v41;
  __chkstk_darwin(v43);
  uint64_t v45 = (char *)&v82 - v44;
  __chkstk_darwin(v46);
  uint64_t v48 = (char *)&v82 - v47;
  uint64_t v94 = (char *)&v82 - v47;
  sub_1001F3734(*(void *)(a1 + 16) + OBJC_IVAR____TtCV7Weather28LocationCommonViewComponents8_Storage_wind, (uint64_t)v12);
  uint64_t v49 = a3[49];
  uint64_t v50 = a3[50];
  uint64_t v51 = a3[51];
  uint64_t v52 = a3[52];
  uint64_t v99 = a2;
  a2(v12, v49, v50, v51, v52);
  sub_1001F2B74((uint64_t)v12);
  sub_100121584((uint64_t)v45, a4, (uint64_t)v48);
  uint64_t v53 = *(void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v91 = v45;
  v53(v45, a4);
  sub_1001F3734(*(void *)(a1 + 16) + OBJC_IVAR____TtCV7Weather28LocationCommonViewComponents8_Storage_precipitationTotal, (uint64_t)v12);
  a2(v12, a3[33], a3[34], a3[35], a3[36]);
  sub_1001F2B74((uint64_t)v12);
  sub_100121584((uint64_t)v42, a4, (uint64_t)v45);
  uint64_t v88 = v42;
  v53(v42, a4);
  uint64_t v85 = a1;
  sub_1001F3734(*(void *)(a1 + 16) + OBJC_IVAR____TtCV7Weather28LocationCommonViewComponents8_Storage_feelsLike, (uint64_t)v12);
  uint64_t v54 = (uint64_t)v100;
  v99(v12, a3[8], a3[9], a3[10], a3[11]);
  sub_1001F2B74((uint64_t)v12);
  sub_100121584(v54, a4, (uint64_t)v42);
  uint64_t v55 = v54;
  v53((char *)v54, a4);
  sub_1001F3734(*(void *)(a1 + 16) + OBJC_IVAR____TtCV7Weather28LocationCommonViewComponents8_Storage_humidity, (uint64_t)v12);
  uint64_t v56 = (uint64_t)v86;
  uint64_t v57 = v99;
  v99(v12, a3[16], a3[17], a3[18], a3[19]);
  sub_1001F2B74((uint64_t)v12);
  sub_100121584(v56, a4, v55);
  v53((char *)v56, a4);
  sub_1001F3734(*(void *)(v85 + 16) + OBJC_IVAR____TtCV7Weather28LocationCommonViewComponents8_Storage_visibility, (uint64_t)v12);
  uint64_t v58 = (uint64_t)v87;
  v57(v12, a3[45], a3[46], a3[47], a3[48]);
  sub_1001F2B74((uint64_t)v12);
  uint64_t v59 = v58;
  sub_100121584(v58, a4, v56);
  v53((char *)v58, a4);
  uint64_t v60 = v85;
  sub_1001F3734(*(void *)(v85 + 16) + OBJC_IVAR____TtCV7Weather28LocationCommonViewComponents8_Storage_pressure, (uint64_t)v12);
  uint64_t v61 = (uint64_t)v101;
  uint64_t v62 = v99;
  v99(v12, a3[29], a3[30], a3[31], a3[32]);
  sub_1001F2B74((uint64_t)v12);
  sub_100121584(v61, a4, v59);
  v53((char *)v61, a4);
  sub_1001F3734(*(void *)(v60 + 16) + OBJC_IVAR____TtCV7Weather28LocationCommonViewComponents8_Storage_moon, (uint64_t)v12);
  uint64_t v63 = (uint64_t)v89;
  v62(v12, a3[25], a3[26], a3[27], a3[28]);
  sub_1001F2B74((uint64_t)v12);
  sub_100121584(v63, a4, (uint64_t)v101);
  v53((char *)v63, a4);
  sub_1001F3734(*(void *)(v60 + 16) + OBJC_IVAR____TtCV7Weather28LocationCommonViewComponents8_Storage_averages, (uint64_t)v12);
  uint64_t v64 = *a3;
  uint64_t v65 = a3[1];
  uint64_t v66 = a3[2];
  uint64_t v67 = a3[3];
  uint64_t v68 = (uint64_t)v90;
  v62(v12, v64, v65, v66, v67);
  sub_1001F2B74((uint64_t)v12);
  sub_100121584(v68, a4, v63);
  v53((char *)v68, a4);
  uint64_t v69 = *(void (**)(uint64_t, char *, uint64_t))(v82 + 16);
  v69(v68, v94, a4);
  uint64_t v119 = v68;
  uint64_t v70 = v92;
  v69((uint64_t)v92, v91, a4);
  uint64_t v120 = v70;
  uint64_t v71 = v93;
  v69((uint64_t)v93, v88, a4);
  uint64_t v121 = v71;
  uint64_t v72 = v95;
  v69((uint64_t)v95, v100, a4);
  uint64_t v122 = v72;
  uint64_t v73 = v96;
  uint64_t v74 = v86;
  v69((uint64_t)v96, v86, a4);
  uint64_t v123 = v73;
  uint64_t v75 = v97;
  uint64_t v76 = v87;
  v69((uint64_t)v97, v87, a4);
  uint64_t v124 = v75;
  uint64_t v77 = v98;
  uint64_t v78 = (uint64_t)v101;
  v69((uint64_t)v98, v101, a4);
  uint64_t v125 = v77;
  uint64_t v79 = v83;
  uint64_t v80 = v89;
  v69((uint64_t)v83, v89, a4);
  uint64_t v126 = v79;
  uint64_t v111 = a4;
  uint64_t v112 = a4;
  uint64_t v113 = a4;
  uint64_t v114 = a4;
  uint64_t v115 = a4;
  uint64_t v116 = a4;
  uint64_t v117 = a4;
  uint64_t v118 = a4;
  uint64_t v103 = v102;
  uint64_t v104 = v102;
  uint64_t v105 = v102;
  uint64_t v106 = v102;
  uint64_t v107 = v102;
  uint64_t v108 = v102;
  uint64_t v109 = v102;
  uint64_t v110 = v102;
  sub_1006E9080();
  v53(v80, a4);
  v53((char *)v78, a4);
  v53(v76, a4);
  v53(v74, a4);
  v53(v100, a4);
  v53(v88, a4);
  v53(v91, a4);
  v53(v94, a4);
  v53(v79, a4);
  v53(v98, a4);
  v53(v97, a4);
  v53(v96, a4);
  v53(v95, a4);
  v53(v93, a4);
  v53(v92, a4);
  return ((uint64_t (*)(char *, uint64_t))v53)(v90, a4);
}

uint64_t sub_100C10918@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(unsigned char *)(v2 + 9)) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  return sub_100C0F0A4(*(void *)v2, v3 | *(unsigned __int8 *)(v2 + 8), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(a1 + 16), *(void *)(a1 + 24), a2);
}

uint64_t sub_100C10944()
{
  return sub_100C10974((uint64_t (*)(void, void, void, void, void, void, void))sub_100C0F568);
}

uint64_t sub_100C1095C()
{
  return sub_100C10974((uint64_t (*)(void, void, void, void, void, void, void))sub_100C0FED0);
}

uint64_t sub_100C10974(uint64_t (*a1)(void, void, void, void, void, void, void))
{
  if (*(unsigned char *)(v1 + 41)) {
    int v2 = 256;
  }
  else {
    int v2 = 0;
  }
  return a1(*(void *)(v1 + 32), v2 | *(unsigned __int8 *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100C109A8()
{
  return swift_getWitnessTable();
}

id WeatherIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for WeatherIntent();
  id v9 = sub_100188618((uint64_t)v11.super_class, "initWithCoder:", v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id WeatherIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithIdentifier:v6 backingStore:a3];

  return v7;
}

id WeatherIntent.__allocating_init(domain:verb:parametersByName:)()
{
  NSString v2 = sub_10017DDF8();
  swift_bridgeObjectRelease();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (v1)
  {
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  id v5 = [objc_allocWithZone(v0) initWithDomain:v2 verb:v3 parametersByName:v4.super.isa];

  return v5;
}

id WeatherIntent.init(domain:verb:parametersByName:)()
{
  NSString v2 = sub_10017DDF8();
  swift_bridgeObjectRelease();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (v1)
  {
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for WeatherIntent();
  [v7 initWithDomain:v2 verb:v3 parametersByName:v4.super.isa];

  return v5;
}

id WeatherIntent.__deallocating_deinit()
{
  return sub_100C113A4(type metadata accessor for WeatherIntent);
}

unint64_t WeatherIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

Swift::Int sub_100C10DB8()
{
  return sub_100652640(*v0);
}

void sub_100C10DC0(int a1)
{
  sub_1002C3468(a1, *v1);
}

Swift::Int sub_100C10DC8(uint64_t a1)
{
  return sub_1002C4068(a1, *v1);
}

unint64_t sub_100C10DD0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = WeatherIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t WeatherIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___WeatherIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_100C10E98(uint64_t a1)
{
  NSString v3 = (void *)(v1 + OBJC_IVAR___WeatherIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *NSString v3 = a1;
  return result;
}

char *WeatherIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return WeatherIntentResponse.init(code:userActivity:)(a1, a2);
}

char *WeatherIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)[v2 init];
  NSString v6 = &v5[OBJC_IVAR___WeatherIntentResponse_code];
  swift_beginAccess();
  *(void *)NSString v6 = a1;
  objc_super v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id WeatherIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___WeatherIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WeatherIntentResponse();
  return [super init];
}

uint64_t type metadata accessor for WeatherIntentResponse()
{
  return self;
}

id WeatherLocation.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id WeatherIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___WeatherIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for WeatherIntentResponse();
  id v9 = sub_100188618((uint64_t)v11.super_class, "initWithCoder:", v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id WeatherIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithBackingStore:a1];

  return v3;
}

id WeatherIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___WeatherIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for WeatherIntentResponse();
  id v9 = sub_100188618((uint64_t)v11.super_class, "initWithBackingStore:", v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id WeatherIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }
  id v3 = [objc_allocWithZone(v1) initWithPropertiesByName:v2.super.isa];

  return v3;
}

id WeatherIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___WeatherIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for WeatherIntentResponse();
  id v9 = sub_100188618((uint64_t)v11.super_class, "initWithPropertiesByName:", v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id WeatherIntentResponse.__deallocating_deinit()
{
  return sub_100C113A4(type metadata accessor for WeatherIntentResponse);
}

id sub_100C113A4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

unint64_t sub_100C113E0()
{
  unint64_t result = qword_100EB95D8;
  if (!qword_100EB95D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100EB95D8);
  }
  return result;
}

uint64_t sub_100C1142C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WeatherIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100C11458(uint64_t *a1)
{
  return sub_100C10E98(*a1);
}

ValueMetadata *type metadata accessor for WeatherIntentResponseCode()
{
  return &type metadata for WeatherIntentResponseCode;
}

id WeatherLocation.__allocating_init(identifier:display:pronunciationHint:)()
{
  sub_10017DE18();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (v1)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  id v6 = [objc_allocWithZone(v0) initWithIdentifier:v3 displayString:v4 pronunciationHint:v5];

  return v6;
}

id WeatherLocation.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for WeatherLocation();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id WeatherLocation.__deallocating_deinit()
{
  return sub_100C11BCC(type metadata accessor for WeatherLocation);
}

id static WeatherLocationResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___WeatherLocationResolutionResult;
  [super successWithResolvedObject:a1];

  return v2;
}

id static WeatherLocationResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_100C117A4();
    swift_bridgeObjectRetain();
    _bridgeCocoaArray<A>(_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
    sub_100C117A4();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_100C117A4();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___WeatherLocationResolutionResult;
  [super disambiguationWithObjectsToDisambiguate:isa];

  return v3;
}

unint64_t sub_100C117A4()
{
  unint64_t result = qword_100EB9658;
  if (!qword_100EB9658)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100EB9658);
  }
  return result;
}

id static WeatherLocationResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___WeatherLocationResolutionResult;
  [super confirmationRequiredWithObjectToConfirm:a1];

  return v2;
}

void static WeatherLocationResolutionResult.success(with:)()
{
}

void static WeatherLocationResolutionResult.disambiguation(with:)()
{
}

void static WeatherLocationResolutionResult.confirmationRequired(with:)()
{
}

id WeatherLocationResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithJSONDictionary:isa forIntent:a2];

  return v6;
}

id WeatherLocationResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for WeatherLocationResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, "initWithJSONDictionary:forIntent:", isa, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for WeatherLocationResolutionResult()
{
  return self;
}

id WeatherLocationResolutionResult.__deallocating_deinit()
{
  return sub_100C11BCC(type metadata accessor for WeatherLocationResolutionResult);
}

id sub_100C11BCC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100C11C28(void *a1, NSObject *a2)
{
  objc_super v3 = [a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown error when requesting me-card. %@", (uint8_t *)&v4, 0xCu);
}

uint64_t AppDependency.wrappedValue.getter()
{
  return AppDependency.wrappedValue.getter();
}

uint64_t AppDependency.__allocating_init(key:manager:)()
{
  return AppDependency.__allocating_init(key:manager:)();
}

uint64_t AppDependencyManager.addWeatherDependencies(from:)()
{
  return AppDependencyManager.addWeatherDependencies(from:)();
}

uint64_t AppDependencyManager.add<A>(key:dependency:)()
{
  return AppDependencyManager.add<A>(key:dependency:)();
}

uint64_t static AppDependencyManager.shared.getter()
{
  return static AppDependencyManager.shared.getter();
}

uint64_t type metadata accessor for AppDependencyManager()
{
  return type metadata accessor for AppDependencyManager();
}

uint64_t type metadata accessor for AppEntityVisualState()
{
  return type metadata accessor for AppEntityVisualState();
}

uint64_t static AppIntent.openAppWhenRun.getter()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t static AppIntent.description.getter()
{
  return static AppIntent.description.getter();
}

uint64_t static AppIntent.parameterSummary.getter()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t static AppIntent.authenticationPolicy.getter()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t static IntentResult.result<>()()
{
  return static IntentResult.result<>()();
}

uint64_t EntityProperty.wrappedValue.modify()
{
  return EntityProperty.wrappedValue.modify();
}

uint64_t EntityProperty.wrappedValue.getter()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t EntityProperty.wrappedValue.setter()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t EntityProperty.projectedValue.getter()
{
  return EntityProperty.projectedValue.getter();
}

uint64_t EntityProperty<>.init(title:)()
{
  return EntityProperty<>.init(title:)();
}

{
  return EntityProperty<>.init(title:)();
}

uint64_t IntentParameter.projectedValue.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:resolvers:)()
{
  return IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:resolvers:)();
}

uint64_t IntentParameter<>.init(title:description:kind:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:kind:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t type metadata accessor for IntentDescription()
{
  return type metadata accessor for IntentDescription();
}

uint64_t IntentDescription.init(_:categoryName:searchKeywords:)()
{
  return IntentDescription.init(_:categoryName:searchKeywords:)();
}

uint64_t ContainsComparator.init<>(mappingTransform:)()
{
  return ContainsComparator.init<>(mappingTransform:)();
}

uint64_t static EntityPropertyQuery.findIntentDescription.getter()
{
  return static EntityPropertyQuery.findIntentDescription.getter();
}

uint64_t EntityQueryProperty.__allocating_init<>(_:comparators:)()
{
  return EntityQueryProperty.__allocating_init<>(_:comparators:)();
}

uint64_t DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:)()
{
  return DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:)();
}

uint64_t type metadata accessor for DisplayRepresentation.Image()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:synonyms:)()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:)()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t type metadata accessor for DisplayRepresentation()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t EntityQueryProperties.init(properties:)()
{
  return EntityQueryProperties.init(properties:)();
}

uint64_t static DynamicOptionsProvider.useForParameterResolution.getter()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t static IntentParameterSummary.ParameterKeyPathsBuilder.buildBlock(_:)()
{
  return static IntentParameterSummary.ParameterKeyPathsBuilder.buildBlock(_:)();
}

uint64_t static IntentParameterSummary.ParameterKeyPathsBuilder.buildExpression<A>(_:)()
{
  return static IntentParameterSummary.ParameterKeyPathsBuilder.buildExpression<A>(_:)();
}

uint64_t IntentParameterSummary.init(_:table:)()
{
  return IntentParameterSummary.init(_:table:)();
}

uint64_t IntentParameterSummary.init(_:table:_:)()
{
  return IntentParameterSummary.init(_:table:_:)();
}

uint64_t ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)()
{
  return ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)();
}

Swift::Void __swiftcall ParameterSummaryString.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t ParameterSummaryString.init(stringInterpolation:)()
{
  return ParameterSummaryString.init(stringInterpolation:)();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t IntentURLRepresentation.StringInterpolation.appendInterpolation<A, B>(_:)()
{
  return IntentURLRepresentation.StringInterpolation.appendInterpolation<A, B>(_:)();
}

Swift::Void __swiftcall IntentURLRepresentation.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t IntentURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return IntentURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t IntentURLRepresentation.init(stringInterpolation:)()
{
  return IntentURLRepresentation.init(stringInterpolation:)();
}

uint64_t static ParameterSummaryBuilder.buildBlock<A>(_:)()
{
  return static ParameterSummaryBuilder.buildBlock<A>(_:)();
}

uint64_t static ParameterSummaryBuilder.buildExpression<A>(_:)()
{
  return static ParameterSummaryBuilder.buildExpression<A>(_:)();
}

uint64_t static PersistentlyIdentifiable.persistentIdentifier.getter()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t EntityQuerySortingOptions.init(content:)()
{
  return EntityQuerySortingOptions.init(content:)();
}

uint64_t TypeDisplayRepresentation.init(name:numericFormat:)()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t type metadata accessor for TypeDisplayRepresentation()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t type metadata accessor for HasValueComparisonOperator()
{
  return type metadata accessor for HasValueComparisonOperator();
}

uint64_t static ParameterSummaryCaseBuilder.buildBlock<A, B>(_:_:)()
{
  return static ParameterSummaryCaseBuilder.buildBlock<A, B>(_:_:)();
}

uint64_t static ParameterSummaryCaseBuilder.buildExpression<A>(_:)()
{
  return static ParameterSummaryCaseBuilder.buildExpression<A>(_:)();
}

uint64_t static EntityQueryPropertiesBuilder.buildBlock(_:)()
{
  return static EntityQueryPropertiesBuilder.buildBlock(_:)();
}

uint64_t static EntityQueryPropertiesBuilder.buildExpression(_:)()
{
  return static EntityQueryPropertiesBuilder.buildExpression(_:)();
}

uint64_t static ResolverSpecificationBuilder.buildExpression<A>(_:)()
{
  return static ResolverSpecificationBuilder.buildExpression<A>(_:)();
}

uint64_t static ResolverSpecificationBuilder.buildPartialBlock<A, each B>(accumulated:next:)()
{
  return static ResolverSpecificationBuilder.buildPartialBlock<A, each B>(accumulated:next:)();
}

uint64_t static ResolverSpecificationBuilder.buildPartialBlock<A>(first:)()
{
  return static ResolverSpecificationBuilder.buildPartialBlock<A>(first:)();
}

uint64_t static EntityQueryComparatorsBuilder.buildBlock(_:)()
{
  return static EntityQueryComparatorsBuilder.buildBlock(_:)();
}

uint64_t static EntityQueryComparatorsBuilder.buildExpression(_:)()
{
  return static EntityQueryComparatorsBuilder.buildExpression(_:)();
}

uint64_t EntityQuerySortableByProperty.init<A>(_:)()
{
  return EntityQuerySortableByProperty.init<A>(_:)();
}

uint64_t ParameterSummaryCaseCondition.init(_:_:)()
{
  return ParameterSummaryCaseCondition.init(_:_:)();
}

uint64_t ParameterSummaryWhenCondition.init<A>(_:_:_:otherwise:)()
{
  return ParameterSummaryWhenCondition.init<A>(_:_:_:otherwise:)();
}

uint64_t ParameterSummarySwitchCondition.init(_:_:)()
{
  return ParameterSummarySwitchCondition.init(_:_:)();
}

uint64_t static EntityQuerySortingOptionsBuilder.buildBlock(_:)()
{
  return static EntityQuerySortingOptionsBuilder.buildBlock(_:)();
}

uint64_t static EntityQuerySortingOptionsBuilder.buildExpression(_:)()
{
  return static EntityQuerySortingOptionsBuilder.buildExpression(_:)();
}

uint64_t ParameterSummaryDefaultCaseCondition.init(_:)()
{
  return ParameterSummaryDefaultCaseCondition.init(_:)();
}

uint64_t static CocoaError.fileReadNoSuchFile.getter()
{
  return static CocoaError.fileReadNoSuchFile.getter();
}

uint64_t type metadata accessor for CocoaError.Code()
{
  return type metadata accessor for CocoaError.Code();
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

uint64_t Measurement<>.beaufortCategory(useExtendedScale:)()
{
  return Measurement<>.beaufortCategory(useExtendedScale:)();
}

uint64_t static Measurement.< infix<A, B>(_:_:)()
{
  return static Measurement.< infix<A, B>(_:_:)();
}

uint64_t static Measurement.== infix<A, B>(_:_:)()
{
  return static Measurement.== infix<A, B>(_:_:)();
}

uint64_t Measurement.unit.getter()
{
  return Measurement.unit.getter();
}

uint64_t Measurement.init(value:unit:)()
{
  return Measurement.init(value:unit:)();
}

uint64_t Measurement.value.getter()
{
  return Measurement.value.getter();
}

uint64_t Measurement.rounded.getter()
{
  return Measurement.rounded.getter();
}

uint64_t Measurement.formatted<A>(_:placeholder:unitManager:)()
{
  return Measurement.formatted<A>(_:placeholder:unitManager:)();
}

uint64_t static Measurement<>.maxVisibility(for:)()
{
  return static Measurement<>.maxVisibility(for:)();
}

uint64_t Measurement<>.convertAndRoundPrecipitation(unitManager:)()
{
  return Measurement<>.convertAndRoundPrecipitation(unitManager:)();
}

uint64_t Measurement<>.formattedAndClampedVisibility.getter()
{
  return Measurement<>.formattedAndClampedVisibility.getter();
}

uint64_t Measurement<>.formattedAndClampedVisibilityWithUnit.getter()
{
  return Measurement<>.formattedAndClampedVisibilityWithUnit.getter();
}

uint64_t Measurement<>.converted(usage:scaling:)()
{
  return Measurement<>.converted(usage:scaling:)();
}

uint64_t Measurement<>.converted(rounded:)()
{
  return Measurement<>.converted(rounded:)();
}

uint64_t Measurement<>.FormatStyle.init(width:locale:usage:numberFormatStyle:)()
{
  return Measurement<>.FormatStyle.init(width:locale:usage:numberFormatStyle:)();
}

uint64_t static Measurement<>.FormatStyle.UnitWidth.abbreviated.getter()
{
  return static Measurement<>.FormatStyle.UnitWidth.abbreviated.getter();
}

uint64_t static Measurement<>.FormatStyle.UnitWidth.narrow.getter()
{
  return static Measurement<>.FormatStyle.UnitWidth.narrow.getter();
}

uint64_t static Measurement<>.+ infix(_:_:)()
{
  return static Measurement<>.+ infix(_:_:)();
}

uint64_t static Measurement<>.- infix(_:_:)()
{
  return static Measurement<>.- infix(_:_:)();
}

uint64_t Measurement<>.converted(to:)()
{
  return Measurement<>.converted(to:)();
}

uint64_t Measurement<>.formatted<A>(_:)()
{
  return Measurement<>.formatted<A>(_:)();
}

uint64_t type metadata accessor for Measurement()
{
  return type metadata accessor for Measurement();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
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

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t URLQueryItem.name.getter()
{
  return URLQueryItem.name.getter();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.queryItems.setter()
{
  return URLComponents.queryItems.setter();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.port.getter()
{
  return URLComponents.port.getter();
}

uint64_t URLComponents.init(string:)()
{
  return URLComponents.init(string:)();
}

uint64_t URLComponents.string.getter()
{
  return URLComponents.string.getter();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
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

uint64_t DateComponents.day.getter()
{
  return DateComponents.day.getter();
}

uint64_t DateComponents.day.setter()
{
  return DateComponents.day.setter();
}

uint64_t DateComponents.hour.getter()
{
  return DateComponents.hour.getter();
}

uint64_t DateComponents.hour.setter()
{
  return DateComponents.hour.setter();
}

uint64_t DateComponents.year.getter()
{
  return DateComponents.year.getter();
}

uint64_t DateComponents.year.setter()
{
  return DateComponents.year.setter();
}

uint64_t DateComponents.month.getter()
{
  return DateComponents.month.getter();
}

uint64_t DateComponents.month.setter()
{
  return DateComponents.month.setter();
}

uint64_t DateComponents.minute.setter()
{
  return DateComponents.minute.setter();
}

uint64_t DateComponents.second.setter()
{
  return DateComponents.second.setter();
}

uint64_t DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t DateComponents.timeZone.setter()
{
  return DateComponents.timeZone.setter();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t AttributeScopes.FoundationAttributes.link.getter()
{
  return AttributeScopes.FoundationAttributes.link.getter();
}

uint64_t AttributeScopes.AccessibilityAttributes.accessibilitySpeechSpellsOutCharacters.getter()
{
  return AttributeScopes.AccessibilityAttributes.accessibilitySpeechSpellsOutCharacters.getter();
}

uint64_t AttributeScopes.UIKitAttributes.paragraphStyle.getter()
{
  return AttributeScopes.UIKitAttributes.paragraphStyle.getter();
}

uint64_t AttributeScopes.UIKitAttributes.foregroundColor.getter()
{
  return AttributeScopes.UIKitAttributes.foregroundColor.getter();
}

uint64_t AttributeScopes.UIKitAttributes.font.getter()
{
  return AttributeScopes.UIKitAttributes.font.getter();
}

uint64_t AttributeScopes.SwiftUIAttributes.underlineStyle.getter()
{
  return AttributeScopes.SwiftUIAttributes.underlineStyle.getter();
}

uint64_t AttributeScopes.SwiftUIAttributes.foregroundColor.getter()
{
  return AttributeScopes.SwiftUIAttributes.foregroundColor.getter();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t AttributedString.characters.getter()
{
  return AttributedString.characters.getter();
}

uint64_t type metadata accessor for AttributedString.CharacterView()
{
  return type metadata accessor for AttributedString.CharacterView();
}

uint64_t AttributedString.subscript.setter()
{
  return AttributedString.subscript.setter();
}

uint64_t AttributedString.init(stringLiteral:)()
{
  return AttributedString.init(stringLiteral:)();
}

uint64_t AttributedString.removeSubrange<A>(_:)()
{
  return AttributedString.removeSubrange<A>(_:)();
}

uint64_t AttributedString.replaceSubrange<A, B>(_:with:)()
{
  return AttributedString.replaceSubrange<A, B>(_:with:)();
}

uint64_t static AttributedString.+ infix(_:_:)()
{
  return static AttributedString.+ infix(_:_:)();
}

uint64_t static AttributedString.== infix(_:_:)()
{
  return static AttributedString.== infix(_:_:)();
}

uint64_t AttributedString.Runs.Run.attributes.getter()
{
  return AttributedString.Runs.Run.attributes.getter();
}

uint64_t AttributedString.Runs.Run.range.getter()
{
  return AttributedString.Runs.Run.range.getter();
}

uint64_t type metadata accessor for AttributedString.Runs.Run()
{
  return type metadata accessor for AttributedString.Runs.Run();
}

uint64_t type metadata accessor for AttributedString.Runs.Index()
{
  return type metadata accessor for AttributedString.Runs.Index();
}

uint64_t type metadata accessor for AttributedString.Runs()
{
  return type metadata accessor for AttributedString.Runs();
}

uint64_t AttributedString.runs.getter()
{
  return AttributedString.runs.getter();
}

uint64_t static AttributedString.makeLowercaseSmallCapsStyledString(localized:bundle:comment:_:)()
{
  return static AttributedString.makeLowercaseSmallCapsStyledString(localized:bundle:comment:_:)();
}

uint64_t AttributedString.with(font:)()
{
  return AttributedString.with(font:)();
}

uint64_t AttributedString.init(markdown:fallback:)()
{
  return AttributedString.init(markdown:fallback:)();
}

uint64_t AttributedString.init(localized:bundle:linkA:linkB:)()
{
  return AttributedString.init(localized:bundle:linkA:linkB:)();
}

uint64_t AttributedString.init()()
{
  return AttributedString.init()();
}

uint64_t type metadata accessor for AttributedString()
{
  return type metadata accessor for AttributedString();
}

uint64_t AttributedString.init(_:attributes:)()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t AttributedString.subscript.modify()
{
  return AttributedString.subscript.modify();
}

uint64_t AttributedString.init(_:)()
{
  return AttributedString.init(_:)();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._uint64_t object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t AttributeContainer.subscript.getter()
{
  return AttributeContainer.subscript.getter();
}

uint64_t AttributeContainer.init()()
{
  return AttributeContainer.init()();
}

uint64_t type metadata accessor for AttributeContainer()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t static _ErrorCodeProtocol.~= infix(_:_:)()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t AttributedSubstring.subscript.setter()
{
  return AttributedSubstring.subscript.setter();
}

uint64_t static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
}

uint64_t static PredicateExpressions.build_Arg<A>(_:)()
{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

uint64_t dispatch thunk of NSKeyValueObservation.invalidate()()
{
  return dispatch thunk of NSKeyValueObservation.invalidate()();
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return AttributeDynamicLookup.subscript.getter();
}

{
  return AttributeDynamicLookup.subscript.getter();
}

{
  return AttributeDynamicLookup.subscript.getter();
}

{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t type metadata accessor for LocalizedStringResource.BundleDescription()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t LocalizedStringResource.init(stringInterpolation:)()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t LocalizedStringResource.init(_:table:locale:bundle:comment:)()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t AttributedStringProtocol.range<A>(of:options:locale:)()
{
  return AttributedStringProtocol.range<A>(of:options:locale:)();
}

uint64_t FloatingPointFormatStyle.init(locale:)()
{
  return FloatingPointFormatStyle.init(locale:)();
}

uint64_t FloatingPointFormatStyle.Percent.init(locale:)()
{
  return FloatingPointFormatStyle.Percent.init(locale:)();
}

uint64_t FloatingPointFormatStyle.Percent.precision(_:)()
{
  return FloatingPointFormatStyle.Percent.precision(_:)();
}

uint64_t FloatingPointFormatStyle.precision(_:)()
{
  return FloatingPointFormatStyle.precision(_:)();
}

uint64_t NSKeyValueObservedChange.newValue.getter()
{
  return NSKeyValueObservedChange.newValue.getter();
}

uint64_t static MeasurementFormatUnitUsage.general.getter()
{
  return static MeasurementFormatUnitUsage.general.getter();
}

uint64_t _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)()
{
  return _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
}

uint64_t static NumberFormatStyleConfiguration.SignDisplayStrategy.never.getter()
{
  return static NumberFormatStyleConfiguration.SignDisplayStrategy.never.getter();
}

uint64_t static NumberFormatStyleConfiguration.SignDisplayStrategy.always(includingZero:)()
{
  return static NumberFormatStyleConfiguration.SignDisplayStrategy.always(includingZero:)();
}

uint64_t static NumberFormatStyleConfiguration.SignDisplayStrategy.automatic.getter()
{
  return static NumberFormatStyleConfiguration.SignDisplayStrategy.automatic.getter();
}

uint64_t type metadata accessor for NumberFormatStyleConfiguration.SignDisplayStrategy()
{
  return type metadata accessor for NumberFormatStyleConfiguration.SignDisplayStrategy();
}

uint64_t static NumberFormatStyleConfiguration.Precision.fractionLength(_:)()
{
  return static NumberFormatStyleConfiguration.Precision.fractionLength(_:)();
}

uint64_t static NumberFormatStyleConfiguration.Precision.fractionLength<A>(_:)()
{
  return static NumberFormatStyleConfiguration.Precision.fractionLength<A>(_:)();
}

uint64_t type metadata accessor for NumberFormatStyleConfiguration.Precision()
{
  return type metadata accessor for NumberFormatStyleConfiguration.Precision();
}

uint64_t static FormatStyleCapitalizationContext.unknown.getter()
{
  return static FormatStyleCapitalizationContext.unknown.getter();
}

uint64_t type metadata accessor for FormatStyleCapitalizationContext()
{
  return type metadata accessor for FormatStyleCapitalizationContext();
}

uint64_t static URL.read(from:)()
{
  return static URL.read(from:)();
}

uint64_t URL.write(to:)()
{
  return URL.write(to:)();
}

Swift::String_optional __swiftcall URL.queryItem(for:)(Swift::String a1)
{
  uint64_t v1 = URL.queryItem(for:)(a1._countAndFlagsBits, a1._object);
  result.value._uint64_t object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.init(fileURLWithPath:isDirectory:)()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.deletingPathExtension()()
{
  return URL.deletingPathExtension()();
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return URL.appendingPathComponent(_:isDirectory:)();
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
  result._uint64_t object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.append<A>(path:directoryHint:)()
{
  return URL.append<A>(path:directoryHint:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t URL.applyWeatherSourceQueryParams(for:)()
{
  return URL.applyWeatherSourceQueryParams(for:)();
}

uint64_t type metadata accessor for URL.WeatherSourcePar()
{
  return type metadata accessor for URL.WeatherSourcePar();
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.InlineData.init(_:)()
{
  return Data.InlineData.init(_:)();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data.LargeSlice.init(_:)()
{
  return Data.LargeSlice.init(_:)();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

uint64_t Data.InlineSlice.init(_:)()
{
  return Data.InlineSlice.init(_:)();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t Data._Representation.init(count:)()
{
  return Data._Representation.init(count:)();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return Data._Representation.append(contentsOf:)();
}

uint64_t Data._Representation.init(_:)()
{
  return Data._Representation.init(_:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = Data.base64EncodedString(options:)(options);
  result._uint64_t object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t Data.count.getter()
{
  return Data.count.getter();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t Date.init(timeIntervalSinceReferenceDate:)()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t Date.addMinutes(_:calendar:)()
{
  return Date.addMinutes(_:calendar:)();
}

uint64_t static Date.read(from:)()
{
  return static Date.read(from:)();
}

uint64_t Date.write(to:)()
{
  return Date.write(to:)();
}

uint64_t type metadata accessor for Date.FormatStyle.TimeStyle()
{
  return type metadata accessor for Date.FormatStyle.TimeStyle();
}

uint64_t type metadata accessor for Date.FormatStyle.DateStyle()
{
  return type metadata accessor for Date.FormatStyle.DateStyle();
}

uint64_t Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)()
{
  return Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)();
}

uint64_t static Date.FormatStyle.Symbol.Weekday.abbreviated.getter()
{
  return static Date.FormatStyle.Symbol.Weekday.abbreviated.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Weekday()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Weekday();
}

uint64_t Date.FormatStyle.weekday(_:)()
{
  return Date.FormatStyle.weekday(_:)();
}

uint64_t type metadata accessor for Date.FormatStyle()
{
  return type metadata accessor for Date.FormatStyle();
}

uint64_t Date.wc_addDays(_:calendar:)()
{
  return Date.wc_addDays(_:calendar:)();
}

uint64_t Date.wc_addHours(_:calendar:)()
{
  return Date.wc_addHours(_:calendar:)();
}

uint64_t Date.isWithinHour(of:)()
{
  return Date.isWithinHour(of:)();
}

uint64_t Date.wc_addMinutes(_:calendar:)()
{
  return Date.wc_addMinutes(_:calendar:)();
}

uint64_t Date.wc_addSeconds(_:calendar:)()
{
  return Date.wc_addSeconds(_:calendar:)();
}

uint64_t Date.hour(timeZone:formatStyle:)()
{
  return Date.hour(timeZone:formatStyle:)();
}

uint64_t Date.noon(timeZone:)()
{
  return Date.noon(timeZone:)();
}

uint64_t Date.midnight(timeZone:)()
{
  return Date.midnight(timeZone:)();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

uint64_t Date.zeroMinutes(timeZone:)()
{
  return Date.zeroMinutes(timeZone:)();
}

uint64_t static Date.distantFuture.getter()
{
  return static Date.distantFuture.getter();
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

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date.== infix(_:_:)()
{
  return static Date.== infix(_:_:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.distance(to:)()
{
  return Date.distance(to:)();
}

uint64_t Date.startOfDay(timeZone:)()
{
  return Date.startOfDay(timeZone:)();
}

uint64_t Date.startOfDay.getter()
{
  return Date.startOfDay.getter();
}

uint64_t Date.isSameMonth(as:timeZone:)()
{
  return Date.isSameMonth(as:timeZone:)();
}

uint64_t Date.zeroSeconds.getter()
{
  return Date.zeroSeconds.getter();
}

uint64_t Date.formattedTime(timeZone:)()
{
  return Date.formattedTime(timeZone:)();
}

uint64_t Date.formattedYear(timeZone:)()
{
  return Date.formattedYear(timeZone:)();
}

uint64_t Date.formattedHours(timeZone:forAccessibility:)()
{
  return Date.formattedHours(timeZone:forAccessibility:)();
}

uint64_t Date.shortDayOfWeek(timeZone:isStandalone:)()
{
  return Date.shortDayOfWeek(timeZone:isStandalone:)();
}

uint64_t static Date.uses24HourTime()()
{
  return static Date.uses24HourTime()();
}

uint64_t Date.fullMonthAndYear(in:)()
{
  return Date.fullMonthAndYear(in:)();
}

uint64_t Date.formattedShortMonth(timeZone:)()
{
  return Date.formattedShortMonth(timeZone:)();
}

uint64_t Date.formattedMonthAndDay(timeZone:)()
{
  return Date.formattedMonthAndDay(timeZone:)();
}

uint64_t Date.hourAndMinuteIsLater(than:calendar:)()
{
  return Date.hourAndMinuteIsLater(than:calendar:)();
}

uint64_t Date.secondsSinceMidnight(calendar:)()
{
  return Date.secondsSinceMidnight(calendar:)();
}

uint64_t Date.formattedHoursForText(timeZone:)()
{
  return Date.formattedHoursForText(timeZone:)();
}

uint64_t Date.formattedMonthDayTime(timeZone:)()
{
  return Date.formattedMonthDayTime(timeZone:)();
}

uint64_t Date.formattedMonthDayYear(timeZone:)()
{
  return Date.formattedMonthDayYear(timeZone:)();
}

uint64_t Date.formattedShortMonthAndDay(timeZone:)()
{
  return Date.formattedShortMonthAndDay(timeZone:)();
}

uint64_t Date.standaloneNarrowDayOfWeek(in:)()
{
  return Date.standaloneNarrowDayOfWeek(in:)();
}

uint64_t Date.accessibilityFormattedTime(timeZone:)()
{
  return Date.accessibilityFormattedTime(timeZone:)();
}

uint64_t static Date.formattedShortMonthAndDayRange(date1:date2:timeZone:)()
{
  return static Date.formattedShortMonthAndDayRange(date1:date2:timeZone:)();
}

uint64_t Date.dayOfWeek(timeZone:context:)()
{
  return Date.dayOfWeek(timeZone:context:)();
}

uint64_t Date.isDaytime(sunrise:sunset:)()
{
  return Date.isDaytime(sunrise:sunset:)();
}

uint64_t Date.isSameDay(as:timeZone:)()
{
  return Date.isSameDay(as:timeZone:)();
}

uint64_t Date.formatted<A>(_:)()
{
  return Date.formatted<A>(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.write(to:)()
{
  return UUID.write(to:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static Locale.read(from:)()
{
  return static Locale.read(from:)();
}

uint64_t Locale.write(to:)()
{
  return Locale.write(to:)();
}

uint64_t Locale.init(identifier:)()
{
  return Locale.init(identifier:)();
}

uint64_t Locale.identifier.getter()
{
  return Locale.identifier.getter();
}

uint64_t Locale.LanguageCode.identifier.getter()
{
  return Locale.LanguageCode.identifier.getter();
}

uint64_t type metadata accessor for Locale.LanguageCode()
{
  return type metadata accessor for Locale.LanguageCode();
}

uint64_t static Locale.languageIdentifier.getter()
{
  return static Locale.languageIdentifier.getter();
}

uint64_t Locale.NumberingSystem.identifier.getter()
{
  return Locale.NumberingSystem.identifier.getter();
}

uint64_t type metadata accessor for Locale.NumberingSystem()
{
  return type metadata accessor for Locale.NumberingSystem();
}

uint64_t Locale.numberingSystem.getter()
{
  return Locale.numberingSystem.getter();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)Locale._bridgeToObjectiveC()();
}

uint64_t static Locale.autoupdatingCurrent.getter()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t static Locale.availableIdentifiers.getter()
{
  return static Locale.availableIdentifiers.getter();
}

uint64_t static Locale.== infix(_:_:)()
{
  return static Locale.== infix(_:_:)();
}

uint64_t Locale.Region.identifier.getter()
{
  return Locale.Region.identifier.getter();
}

uint64_t type metadata accessor for Locale.Region()
{
  return type metadata accessor for Locale.Region();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t Locale.Language.prefersFullTemperatureScale.getter()
{
  return Locale.Language.prefersFullTemperatureScale.getter();
}

uint64_t Locale.Language.prefersObjectiveTemperatureTerminology.getter()
{
  return Locale.Language.prefersObjectiveTemperatureTerminology.getter();
}

uint64_t Locale.Language.isCJK.getter()
{
  return Locale.Language.isCJK.getter();
}

uint64_t Locale.Language.isHebrew.getter()
{
  return Locale.Language.isHebrew.getter();
}

uint64_t Locale.Language.languageCode.getter()
{
  return Locale.Language.languageCode.getter();
}

uint64_t Locale.Language.region.getter()
{
  return Locale.Language.region.getter();
}

uint64_t type metadata accessor for Locale.Language()
{
  return type metadata accessor for Locale.Language();
}

uint64_t Locale.calendar.getter()
{
  return Locale.calendar.getter();
}

uint64_t Locale.language.getter()
{
  return Locale.language.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t static Calendar.Identifier.== infix(_:_:)()
{
  return static Calendar.Identifier.== infix(_:_:)();
}

uint64_t type metadata accessor for Calendar.Identifier()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t Calendar.init(identifier:)()
{
  return Calendar.init(identifier:)();
}

uint64_t Calendar.identifier.getter()
{
  return Calendar.identifier.getter();
}

uint64_t Calendar.ordinality(of:in:for:)()
{
  return Calendar.ordinality(of:in:for:)();
}

uint64_t Calendar.startOfDay(for:)()
{
  return Calendar.startOfDay(for:)();
}

uint64_t static Calendar.currentCalendar(with:)()
{
  return static Calendar.currentCalendar(with:)();
}

uint64_t static Calendar.gregorianCalendar(with:)()
{
  return static Calendar.gregorianCalendar(with:)();
}

uint64_t Calendar.isDateInToday(_:)()
{
  return Calendar.isDateInToday(_:)();
}

uint64_t type metadata accessor for Calendar.MatchingPolicy()
{
  return type metadata accessor for Calendar.MatchingPolicy();
}

uint64_t Calendar.dateComponents(_:from:to:)()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t Calendar.dateComponents(_:from:)()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t Calendar.enumerateDates(startingAfter:matching:matchingPolicy:repeatedTimePolicy:direction:using:)()
{
  return Calendar.enumerateDates(startingAfter:matching:matchingPolicy:repeatedTimePolicy:direction:using:)();
}

uint64_t type metadata accessor for Calendar.SearchDirection()
{
  return type metadata accessor for Calendar.SearchDirection();
}

uint64_t Calendar.isDateInWeekend(_:)()
{
  return Calendar.isDateInWeekend(_:)();
}

uint64_t Calendar.isDateInYesterday(_:)()
{
  return Calendar.isDateInYesterday(_:)();
}

uint64_t type metadata accessor for Calendar.RepeatedTimePolicy()
{
  return type metadata accessor for Calendar.RepeatedTimePolicy();
}

uint64_t static Calendar.autoupdatingCurrent.getter()
{
  return static Calendar.autoupdatingCurrent.getter();
}

uint64_t static Calendar.== infix(_:_:)()
{
  return static Calendar.== infix(_:_:)();
}

uint64_t Calendar.date(bySettingHour:minute:second:of:matchingPolicy:repeatedTimePolicy:direction:)()
{
  return Calendar.date(bySettingHour:minute:second:of:matchingPolicy:repeatedTimePolicy:direction:)();
}

uint64_t Calendar.date(from:)()
{
  return Calendar.date(from:)();
}

uint64_t Calendar.date(byAdding:to:wrappingComponents:)()
{
  return Calendar.date(byAdding:to:wrappingComponents:)();
}

uint64_t Calendar.date(byAdding:value:to:wrappingComponents:)()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t Calendar.date(bySetting:value:of:)()
{
  return Calendar.date(bySetting:value:of:)();
}

uint64_t Calendar.range(of:in:for:)()
{
  return Calendar.range(of:in:for:)();
}

uint64_t Calendar.isDate(_:inSameDayAs:)()
{
  return Calendar.isDate(_:inSameDayAs:)();
}

uint64_t Calendar.isDate(_:equalTo:toGranularity:)()
{
  return Calendar.isDate(_:equalTo:toGranularity:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t Calendar.timeZone.getter()
{
  return Calendar.timeZone.getter();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t Calendar.withTimeZone(_:)()
{
  return Calendar.withTimeZone(_:)();
}

uint64_t Calendar.component(_:from:)()
{
  return Calendar.component(_:from:)();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t IndexSet.startIndex.getter()
{
  return IndexSet.startIndex.getter();
}

uint64_t type metadata accessor for IndexSet.Index()
{
  return type metadata accessor for IndexSet.Index();
}

uint64_t IndexSet.first.getter()
{
  return IndexSet.first.getter();
}

uint64_t IndexSet.init(integer:)()
{
  return IndexSet.init(integer:)();
}

uint64_t type metadata accessor for IndexSet()
{
  return type metadata accessor for IndexSet();
}

uint64_t IndexSet.subscript.getter()
{
  return IndexSet.subscript.getter();
}

uint64_t static TimeZone.read(from:)()
{
  return static TimeZone.read(from:)();
}

uint64_t TimeZone.write(to:)()
{
  return TimeZone.write(to:)();
}

uint64_t TimeZone.init(identifier:)()
{
  return TimeZone.init(identifier:)();
}

uint64_t TimeZone.identifier.getter()
{
  return TimeZone.identifier.getter();
}

uint64_t TimeZone.secondsFromGMT(for:)()
{
  return TimeZone.secondsFromGMT(for:)();
}

uint64_t TimeZone.init(secondsFromGMT:)()
{
  return TimeZone.init(secondsFromGMT:)();
}

NSTimeZone __swiftcall TimeZone._bridgeToObjectiveC()()
{
  return (NSTimeZone)TimeZone._bridgeToObjectiveC()();
}

uint64_t static TimeZone.autoupdatingCurrent.getter()
{
  return static TimeZone.autoupdatingCurrent.getter();
}

uint64_t static TimeZone.== infix(_:_:)()
{
  return static TimeZone.== infix(_:_:)();
}

uint64_t static TimeZone._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static TimeZone.current.getter()
{
  return static TimeZone.current.getter();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)IndexPath._bridgeToObjectiveC()();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t IndexPath.init(row:section:)()
{
  return IndexPath.init(row:section:)();
}

uint64_t IndexPath.row.getter()
{
  return IndexPath.row.getter();
}

uint64_t IndexPath.item.getter()
{
  return IndexPath.item.getter();
}

uint64_t IndexPath.section.getter()
{
  return IndexPath.section.getter();
}

uint64_t type metadata accessor for IndexPath()
{
  return type metadata accessor for IndexPath();
}

uint64_t DayWeather.restOfDayForecast.getter()
{
  return DayWeather.restOfDayForecast.getter();
}

uint64_t DayWeather.conditionOfRelevance(isToday:)()
{
  return DayWeather.conditionOfRelevance(isToday:)();
}

uint64_t DayWeather.precipitationOfRelevance(isToday:)()
{
  return DayWeather.precipitationOfRelevance(isToday:)();
}

uint64_t DayWeather.symbolName.getter()
{
  return DayWeather.symbolName.getter();
}

uint64_t DayWeather.humidityMax.getter()
{
  return DayWeather.humidityMax.getter();
}

uint64_t DayWeather.humidityMin.getter()
{
  return DayWeather.humidityMin.getter();
}

uint64_t DayWeather.windSpeedAvg.getter()
{
  return DayWeather.windSpeedAvg.getter();
}

uint64_t DayWeather.windSpeedMax.getter()
{
  return DayWeather.windSpeedMax.getter();
}

uint64_t DayWeather.highWindSpeed.getter()
{
  return DayWeather.highWindSpeed.getter();
}

uint64_t DayWeather.precipitation.getter()
{
  return DayWeather.precipitation.getter();
}

uint64_t DayWeather.visibilityMax.getter()
{
  return DayWeather.visibilityMax.getter();
}

uint64_t DayWeather.visibilityMin.getter()
{
  return DayWeather.visibilityMin.getter();
}

uint64_t DayWeather.lowTemperature.getter()
{
  return DayWeather.lowTemperature.getter();
}

uint64_t DayWeather.rainfallAmount.getter()
{
  return DayWeather.rainfallAmount.getter();
}

uint64_t DayWeather.rainfallAmount.setter()
{
  return DayWeather.rainfallAmount.setter();
}

uint64_t DayWeather.snowfallAmount.getter()
{
  return DayWeather.snowfallAmount.getter();
}

uint64_t DayWeather.daytimeForecast.getter()
{
  return DayWeather.daytimeForecast.getter();
}

uint64_t DayWeather.highTemperature.getter()
{
  return DayWeather.highTemperature.getter();
}

uint64_t DayWeather.highTemperature.setter()
{
  return DayWeather.highTemperature.setter();
}

uint64_t DayWeather.maximumHumidity.getter()
{
  return DayWeather.maximumHumidity.getter();
}

uint64_t DayWeather.minimumHumidity.getter()
{
  return DayWeather.minimumHumidity.getter();
}

uint64_t DayWeather.windGustSpeedMax.getter()
{
  return DayWeather.windGustSpeedMax.getter();
}

uint64_t DayWeather.maximumVisibility.getter()
{
  return DayWeather.maximumVisibility.getter();
}

uint64_t DayWeather.minimumVisibility.getter()
{
  return DayWeather.minimumVisibility.getter();
}

uint64_t DayWeather.overnightForecast.getter()
{
  return DayWeather.overnightForecast.getter();
}

uint64_t DayWeather.lowTemperatureTime.getter()
{
  return DayWeather.lowTemperatureTime.getter();
}

uint64_t DayWeather.highTemperatureTime.getter()
{
  return DayWeather.highTemperatureTime.getter();
}

uint64_t DayWeather.precipitationAmount.getter()
{
  return DayWeather.precipitationAmount.getter();
}

uint64_t DayWeather.precipitationChance.getter()
{
  return DayWeather.precipitationChance.getter();
}

uint64_t DayWeather.precipitationAmountByType.getter()
{
  return DayWeather.precipitationAmountByType.getter();
}

uint64_t static DayWeather.== infix(_:_:)()
{
  return static DayWeather.== infix(_:_:)();
}

uint64_t DayWeather.sun.getter()
{
  return DayWeather.sun.getter();
}

uint64_t DayWeather.date.getter()
{
  return DayWeather.date.getter();
}

uint64_t DayWeather.date.setter()
{
  return DayWeather.date.setter();
}

uint64_t DayWeather.init(date:condition:symbolName:highTemperature:highTemperatureTime:lowTemperature:lowTemperatureTime:humidity:humidityMax:humidityMin:maximumHumidity:minimumHumidity:precipitation:precipitationChance:rainfallAmount:snowfallAmount:precipitationAmountByType:sun:moon:uvIndex:visibilityMax:visibilityMin:maximumVisibility:minimumVisibility:wind:highWindSpeed:windGustSpeedMax:windSpeedAvg:windSpeedMax:daytimeForecast:overnightForecast:restOfDayForecast:)()
{
  return DayWeather.init(date:condition:symbolName:highTemperature:highTemperatureTime:lowTemperature:lowTemperatureTime:humidity:humidityMax:humidityMin:maximumHumidity:minimumHumidity:precipitation:precipitationChance:rainfallAmount:snowfallAmount:precipitationAmountByType:sun:moon:uvIndex:visibilityMax:visibilityMin:maximumVisibility:minimumVisibility:wind:highWindSpeed:windGustSpeedMax:windSpeedAvg:windSpeedMax:daytimeForecast:overnightForecast:restOfDayForecast:)();
}

uint64_t static DayWeather.mock()()
{
  return static DayWeather.mock()();
}

uint64_t DayWeather.moon.getter()
{
  return DayWeather.moon.getter();
}

uint64_t DayWeather.wind.getter()
{
  return DayWeather.wind.getter();
}

uint64_t DayWeather.uvIndex.getter()
{
  return DayWeather.uvIndex.getter();
}

uint64_t DayWeather.humidity.getter()
{
  return DayWeather.humidity.getter();
}

uint64_t DayWeather.condition.getter()
{
  return DayWeather.condition.getter();
}

uint64_t DayWeather.condition.setter()
{
  return DayWeather.condition.setter();
}

uint64_t type metadata accessor for DayWeather()
{
  return type metadata accessor for DayWeather();
}

uint64_t HourWeather.thirdValue(for:units:useCase:)()
{
  return HourWeather.thirdValue(for:units:useCase:)();
}

uint64_t HourWeather.secondValue(for:units:useCase:)()
{
  return HourWeather.secondValue(for:units:useCase:)();
}

uint64_t HourWeather.chanceOfRain.getter()
{
  return HourWeather.chanceOfRain.getter();
}

uint64_t type metadata accessor for HourWeather.SecondValueUseCase()
{
  return type metadata accessor for HourWeather.SecondValueUseCase();
}

uint64_t HourWeather.cloudCover.getter()
{
  return HourWeather.cloudCover.getter();
}

uint64_t HourWeather.isDaylight.getter()
{
  return HourWeather.isDaylight.getter();
}

uint64_t HourWeather.symbolName.getter()
{
  return HourWeather.symbolName.getter();
}

uint64_t HourWeather.visibility.getter()
{
  return HourWeather.visibility.getter();
}

uint64_t HourWeather.temperature.getter()
{
  return HourWeather.temperature.getter();
}

uint64_t HourWeather.cloudCoverLow.getter()
{
  return HourWeather.cloudCoverLow.getter();
}

uint64_t HourWeather.cloudCoverMid.getter()
{
  return HourWeather.cloudCoverMid.getter();
}

uint64_t HourWeather.precipitation.getter()
{
  return HourWeather.precipitation.getter();
}

uint64_t HourWeather.pressureTrend.getter()
{
  return HourWeather.pressureTrend.getter();
}

uint64_t HourWeather.cloudCoverHigh.getter()
{
  return HourWeather.cloudCoverHigh.getter();
}

uint64_t HourWeather.snowfallAmount.getter()
{
  return HourWeather.snowfallAmount.getter();
}

uint64_t HourWeather.apparentTemperature.getter()
{
  return HourWeather.apparentTemperature.getter();
}

uint64_t HourWeather.precipitationAmount.getter()
{
  return HourWeather.precipitationAmount.getter();
}

uint64_t HourWeather.precipitationChance.getter()
{
  return HourWeather.precipitationChance.getter();
}

uint64_t HourWeather.cloudCoverByAltitude.getter()
{
  return HourWeather.cloudCoverByAltitude.getter();
}

uint64_t HourWeather.apparentPrecipitationIntensity.getter()
{
  return HourWeather.apparentPrecipitationIntensity.getter();
}

uint64_t HourWeather.date.getter()
{
  return HourWeather.date.getter();
}

uint64_t HourWeather.init(date:cloudCover:cloudCoverLow:cloudCoverMid:cloudCoverHigh:cloudCoverByAltitude:condition:symbolName:dewPoint:humidity:isDaylight:precipitation:precipitationChance:precipitationAmount:snowfallAmount:apparentPrecipitationIntensity:pressure:pressureTrend:temperature:apparentTemperature:uvIndex:visibility:wind:)()
{
  return HourWeather.init(date:cloudCover:cloudCoverLow:cloudCoverMid:cloudCoverHigh:cloudCoverByAltitude:condition:symbolName:dewPoint:humidity:isDaylight:precipitation:precipitationChance:precipitationAmount:snowfallAmount:apparentPrecipitationIntensity:pressure:pressureTrend:temperature:apparentTemperature:uvIndex:visibility:wind:)();
}

uint64_t HourWeather.wind.getter()
{
  return HourWeather.wind.getter();
}

uint64_t HourWeather.uvIndex.getter()
{
  return HourWeather.uvIndex.getter();
}

uint64_t HourWeather.dewPoint.getter()
{
  return HourWeather.dewPoint.getter();
}

uint64_t HourWeather.humidity.getter()
{
  return HourWeather.humidity.getter();
}

uint64_t HourWeather.pressure.getter()
{
  return HourWeather.pressure.getter();
}

uint64_t HourWeather.condition.getter()
{
  return HourWeather.condition.getter();
}

uint64_t type metadata accessor for HourWeather()
{
  return type metadata accessor for HourWeather();
}

uint64_t DailyWeatherStatistics.baselineStartDate.getter()
{
  return DailyWeatherStatistics.baselineStartDate.getter();
}

uint64_t DailyWeatherStatistics.init(days:baselineStartDate:metadata:)()
{
  return DailyWeatherStatistics.init(days:baselineStartDate:metadata:)();
}

uint64_t DailyWeatherStatistics.days.getter()
{
  return DailyWeatherStatistics.days.getter();
}

uint64_t DailyWeatherStatistics.metadata.getter()
{
  return DailyWeatherStatistics.metadata.getter();
}

uint64_t DailyWeatherSummary.init(days:metadata:)()
{
  return DailyWeatherSummary.init(days:metadata:)();
}

uint64_t DailyWeatherSummary.days.getter()
{
  return DailyWeatherSummary.days.getter();
}

uint64_t DailyWeatherSummary.metadata.getter()
{
  return DailyWeatherSummary.metadata.getter();
}

uint64_t HourlyWeatherStatistics.baselineStartDate.getter()
{
  return HourlyWeatherStatistics.baselineStartDate.getter();
}

uint64_t HourlyWeatherStatistics.init(hours:baselineStartDate:metadata:)()
{
  return HourlyWeatherStatistics.init(hours:baselineStartDate:metadata:)();
}

uint64_t HourlyWeatherStatistics.hours.getter()
{
  return HourlyWeatherStatistics.hours.getter();
}

uint64_t HourlyWeatherStatistics.metadata.getter()
{
  return HourlyWeatherStatistics.metadata.getter();
}

uint64_t MinuteWeather.precipitation.getter()
{
  return MinuteWeather.precipitation.getter();
}

uint64_t MinuteWeather.precipitationChance.getter()
{
  return MinuteWeather.precipitationChance.getter();
}

uint64_t MinuteWeather.precipitationIntensity.getter()
{
  return MinuteWeather.precipitationIntensity.getter();
}

uint64_t MinuteWeather.apparentPrecipitationIntensity.getter()
{
  return MinuteWeather.apparentPrecipitationIntensity.getter();
}

uint64_t MinuteWeather.date.getter()
{
  return MinuteWeather.date.getter();
}

uint64_t MinuteWeather.init(date:precipitation:precipitationChance:precipitationIntensity:apparentPrecipitationIntensity:)()
{
  return MinuteWeather.init(date:precipitation:precipitationChance:precipitationIntensity:apparentPrecipitationIntensity:)();
}

uint64_t type metadata accessor for MinuteWeather()
{
  return type metadata accessor for MinuteWeather();
}

uint64_t CurrentWeather.requiresAdditionalContrast.getter()
{
  return CurrentWeather.requiresAdditionalContrast.getter();
}

uint64_t CurrentWeather.predominateCloudAltitudeKind.getter()
{
  return CurrentWeather.predominateCloudAltitudeKind.getter();
}

uint64_t CurrentWeather.cloudCover.getter()
{
  return CurrentWeather.cloudCover.getter();
}

uint64_t CurrentWeather.isDaylight.getter()
{
  return CurrentWeather.isDaylight.getter();
}

uint64_t CurrentWeather.symbolName.getter()
{
  return CurrentWeather.symbolName.getter();
}

uint64_t CurrentWeather.visibility.getter()
{
  return CurrentWeather.visibility.getter();
}

uint64_t CurrentWeather.temperature.getter()
{
  return CurrentWeather.temperature.getter();
}

uint64_t CurrentWeather.cloudCoverLow.getter()
{
  return CurrentWeather.cloudCoverLow.getter();
}

uint64_t CurrentWeather.cloudCoverMid.getter()
{
  return CurrentWeather.cloudCoverMid.getter();
}

uint64_t CurrentWeather.pressureTrend.getter()
{
  return CurrentWeather.pressureTrend.getter();
}

uint64_t CurrentWeather.cloudCoverHigh.getter()
{
  return CurrentWeather.cloudCoverHigh.getter();
}

uint64_t CurrentWeather.lowTemperature.getter()
{
  return CurrentWeather.lowTemperature.getter();
}

uint64_t CurrentWeather.rainfallAmount.getter()
{
  return CurrentWeather.rainfallAmount.getter();
}

uint64_t CurrentWeather.snowfallAmount.getter()
{
  return CurrentWeather.snowfallAmount.getter();
}

uint64_t CurrentWeather.highTemperature.getter()
{
  return CurrentWeather.highTemperature.getter();
}

uint64_t CurrentWeather.apparentTemperature.getter()
{
  return CurrentWeather.apparentTemperature.getter();
}

uint64_t CurrentWeather.precipitationAmount.getter()
{
  return CurrentWeather.precipitationAmount.getter();
}

uint64_t CurrentWeather.cloudCoverByAltitude.getter()
{
  return CurrentWeather.cloudCoverByAltitude.getter();
}

uint64_t CurrentWeather.conditionDescription.getter()
{
  return CurrentWeather.conditionDescription.getter();
}

uint64_t CurrentWeather.precipitationIntensity.getter()
{
  return CurrentWeather.precipitationIntensity.getter();
}

uint64_t static CurrentWeather.== infix(_:_:)()
{
  return static CurrentWeather.== infix(_:_:)();
}

uint64_t CurrentWeather.apparentPrecipitationIntensity.getter()
{
  return CurrentWeather.apparentPrecipitationIntensity.getter();
}

uint64_t CurrentWeather.nextHourPrecipitationAmountByType.getter()
{
  return CurrentWeather.nextHourPrecipitationAmountByType.getter();
}

uint64_t CurrentWeather.pastHourPrecipitationAmountByType.getter()
{
  return CurrentWeather.pastHourPrecipitationAmountByType.getter();
}

uint64_t CurrentWeather.nextSixHoursPrecipitationAmountByType.getter()
{
  return CurrentWeather.nextSixHoursPrecipitationAmountByType.getter();
}

uint64_t CurrentWeather.pastSixHoursPrecipitationAmountByType.getter()
{
  return CurrentWeather.pastSixHoursPrecipitationAmountByType.getter();
}

uint64_t CurrentWeather.nextTwentyFourHoursPrecipitationAmountByType.getter()
{
  return CurrentWeather.nextTwentyFourHoursPrecipitationAmountByType.getter();
}

uint64_t CurrentWeather.pastTwentyFourHoursPrecipitationAmountByType.getter()
{
  return CurrentWeather.pastTwentyFourHoursPrecipitationAmountByType.getter();
}

uint64_t CurrentWeather.date.getter()
{
  return CurrentWeather.date.getter();
}

uint64_t CurrentWeather.init(date:cloudCover:cloudCoverLow:cloudCoverMid:cloudCoverHigh:cloudCoverByAltitude:condition:symbolName:dewPoint:humidity:precipitationIntensity:pressure:pressureTrend:rainfallAmount:snowfallAmount:pastHourPrecipitationAmountByType:pastSixHoursPrecipitationAmountByType:pastTwentyFourHoursPrecipitationAmountByType:nextHourPrecipitationAmountByType:nextSixHoursPrecipitationAmountByType:nextTwentyFourHoursPrecipitationAmountByType:apparentPrecipitationIntensity:isDaylight:temperature:apparentTemperature:highTemperature:lowTemperature:uvIndex:visibility:wind:metadata:)()
{
  return CurrentWeather.init(date:cloudCover:cloudCoverLow:cloudCoverMid:cloudCoverHigh:cloudCoverByAltitude:condition:symbolName:dewPoint:humidity:precipitationIntensity:pressure:pressureTrend:rainfallAmount:snowfallAmount:pastHourPrecipitationAmountByType:pastSixHoursPrecipitationAmountByType:pastTwentyFourHoursPrecipitationAmountByType:nextHourPrecipitationAmountByType:nextSixHoursPrecipitationAmountByType:nextTwentyFourHoursPrecipitationAmountByType:apparentPrecipitationIntensity:isDaylight:temperature:apparentTemperature:highTemperature:lowTemperature:uvIndex:visibility:wind:metadata:)();
}

uint64_t CurrentWeather.wind.getter()
{
  return CurrentWeather.wind.getter();
}

uint64_t CurrentWeather.uvIndex.getter()
{
  return CurrentWeather.uvIndex.getter();
}

uint64_t CurrentWeather.dewPoint.getter()
{
  return CurrentWeather.dewPoint.getter();
}

uint64_t CurrentWeather.humidity.getter()
{
  return CurrentWeather.humidity.getter();
}

uint64_t CurrentWeather.metadata.getter()
{
  return CurrentWeather.metadata.getter();
}

uint64_t CurrentWeather.pressure.getter()
{
  return CurrentWeather.pressure.getter();
}

uint64_t CurrentWeather.condition.getter()
{
  return CurrentWeather.condition.getter();
}

uint64_t type metadata accessor for CurrentWeather()
{
  return type metadata accessor for CurrentWeather();
}

uint64_t MonthlyWeatherStatistics.baselineStartDate.getter()
{
  return MonthlyWeatherStatistics.baselineStartDate.getter();
}

uint64_t MonthlyWeatherStatistics.init(months:baselineStartDate:metadata:)()
{
  return MonthlyWeatherStatistics.init(months:baselineStartDate:metadata:)();
}

uint64_t MonthlyWeatherStatistics.months.getter()
{
  return MonthlyWeatherStatistics.months.getter();
}

uint64_t MonthlyWeatherStatistics.metadata.getter()
{
  return MonthlyWeatherStatistics.metadata.getter();
}

uint64_t type metadata accessor for MonthlyWeatherStatistics()
{
  return type metadata accessor for MonthlyWeatherStatistics();
}

uint64_t type metadata accessor for WeatherImportance()
{
  return type metadata accessor for WeatherImportance();
}

uint64_t WeatherAttribution.init(serviceName:legalPageURL:squareMarkURL:combinedMarkDarkURL:combinedMarkLightURL:)()
{
  return WeatherAttribution.init(serviceName:legalPageURL:squareMarkURL:combinedMarkDarkURL:combinedMarkLightURL:)();
}

uint64_t WeatherAttribution.serviceName.getter()
{
  return WeatherAttribution.serviceName.getter();
}

uint64_t WeatherAttribution.legalPageURL.getter()
{
  return WeatherAttribution.legalPageURL.getter();
}

uint64_t WeatherAttribution.squareMarkURL.getter()
{
  return WeatherAttribution.squareMarkURL.getter();
}

uint64_t WeatherAttribution.combinedMarkDarkURL.getter()
{
  return WeatherAttribution.combinedMarkDarkURL.getter();
}

uint64_t WeatherAttribution.combinedMarkLightURL.getter()
{
  return WeatherAttribution.combinedMarkLightURL.getter();
}

uint64_t WeatherAttribution.init(name:sourceURL:logoURL:)()
{
  return WeatherAttribution.init(name:sourceURL:logoURL:)();
}

uint64_t WeatherAttribution.sourceURL.getter()
{
  return WeatherAttribution.sourceURL.getter();
}

uint64_t type metadata accessor for WeatherAttribution()
{
  return type metadata accessor for WeatherAttribution();
}

uint64_t WeatherAvailability.airQualityAvailability.getter()
{
  return WeatherAvailability.airQualityAvailability.getter();
}

uint64_t WeatherAvailability.alertAvailability.getter()
{
  return WeatherAvailability.alertAvailability.getter();
}

uint64_t WeatherAvailability.init(minuteAvailability:alertAvailability:airQualityAvailability:)()
{
  return WeatherAvailability.init(minuteAvailability:alertAvailability:airQualityAvailability:)();
}

uint64_t WeatherAvailability.minuteAvailability.getter()
{
  return WeatherAvailability.minuteAvailability.getter();
}

uint64_t type metadata accessor for WeatherAvailability.AvailabilityKind()
{
  return type metadata accessor for WeatherAvailability.AvailabilityKind();
}

uint64_t type metadata accessor for WeatherAvailability()
{
  return type metadata accessor for WeatherAvailability();
}

uint64_t type metadata accessor for WeatherSeverityKind()
{
  return type metadata accessor for WeatherSeverityKind();
}

uint64_t static WeatherServiceCaching.Options.allowsExpiredData.getter()
{
  return static WeatherServiceCaching.Options.allowsExpiredData.getter();
}

uint64_t type metadata accessor for WeatherServiceCaching.Options()
{
  return type metadata accessor for WeatherServiceCaching.Options();
}

uint64_t static WeatherServiceCaching.enabled.getter()
{
  return static WeatherServiceCaching.enabled.getter();
}

uint64_t static WeatherServiceCaching.disabled.getter()
{
  return static WeatherServiceCaching.disabled.getter();
}

uint64_t type metadata accessor for WeatherServiceCaching()
{
  return type metadata accessor for WeatherServiceCaching();
}

uint64_t WeatherNetworkActivity.createNWActivity()()
{
  return WeatherNetworkActivity.createNWActivity()();
}

uint64_t type metadata accessor for WeatherNetworkActivity.Label()
{
  return type metadata accessor for WeatherNetworkActivity.Label();
}

uint64_t type metadata accessor for WeatherNetworkActivity.Domain()
{
  return type metadata accessor for WeatherNetworkActivity.Domain();
}

uint64_t WeatherNetworkActivity.init(domain:label:token:parentToken:)()
{
  return WeatherNetworkActivity.init(domain:label:token:parentToken:)();
}

uint64_t type metadata accessor for WeatherNetworkActivity()
{
  return type metadata accessor for WeatherNetworkActivity();
}

uint64_t WeatherStatisticsModel.init(hourlyTemperatureStatistics:dailyPrecipitationStatistics:monthlyTemperatureStatistics:monthlyPrecipitationStatistics:dailyPrecipitationSummary:)()
{
  return WeatherStatisticsModel.init(hourlyTemperatureStatistics:dailyPrecipitationStatistics:monthlyTemperatureStatistics:monthlyPrecipitationStatistics:dailyPrecipitationSummary:)();
}

uint64_t WeatherStatisticsModel.hourlyTemperatureStatistics.getter()
{
  return WeatherStatisticsModel.hourlyTemperatureStatistics.getter();
}

uint64_t WeatherStatisticsModel.dailyPrecipitationStatistics.getter()
{
  return WeatherStatisticsModel.dailyPrecipitationStatistics.getter();
}

uint64_t WeatherStatisticsModel.monthlyTemperatureStatistics.getter()
{
  return WeatherStatisticsModel.monthlyTemperatureStatistics.getter();
}

uint64_t WeatherStatisticsModel.monthlyPrecipitationStatistics.getter()
{
  return WeatherStatisticsModel.monthlyPrecipitationStatistics.getter();
}

uint64_t WeatherStatisticsModel.dailyPrecipitationSummary.getter()
{
  return WeatherStatisticsModel.dailyPrecipitationSummary.getter();
}

uint64_t static WeatherStatisticsModel.== infix(_:_:)()
{
  return static WeatherStatisticsModel.== infix(_:_:)();
}

uint64_t type metadata accessor for WeatherStatisticsModel()
{
  return type metadata accessor for WeatherStatisticsModel();
}

uint64_t WeatherServiceLastFetched.date.getter()
{
  return WeatherServiceLastFetched.date.getter();
}

uint64_t type metadata accessor for WeatherServiceLastFetched()
{
  return type metadata accessor for WeatherServiceLastFetched();
}

uint64_t WeatherServiceFetchOptions.cachingOptions.setter()
{
  return WeatherServiceFetchOptions.cachingOptions.setter();
}

uint64_t WeatherServiceFetchOptions.init(countryCode:timeZone:locationOptions:cachingOptions:treatmentIdentifiers:networkActivity:needsMarineData:needsTwilightData:)()
{
  return WeatherServiceFetchOptions.init(countryCode:timeZone:locationOptions:cachingOptions:treatmentIdentifiers:networkActivity:needsMarineData:needsTwilightData:)();
}

uint64_t WeatherServiceFetchOptions.requestDenyList.modify()
{
  return WeatherServiceFetchOptions.requestDenyList.modify();
}

uint64_t WeatherServiceFetchOptions.now.setter()
{
  return WeatherServiceFetchOptions.now.setter();
}

uint64_t type metadata accessor for WeatherServiceFetchOptions()
{
  return type metadata accessor for WeatherServiceFetchOptions();
}

uint64_t static WeatherAQIScaleCacheManager.shared.getter()
{
  return static WeatherAQIScaleCacheManager.shared.getter();
}

uint64_t type metadata accessor for WeatherAQIScaleCacheManager()
{
  return type metadata accessor for WeatherAQIScaleCacheManager();
}

uint64_t WeatherServiceLocationOptions.init(decimalPrecision:limitsPrecision:)()
{
  return WeatherServiceLocationOptions.init(decimalPrecision:limitsPrecision:)();
}

uint64_t type metadata accessor for WeatherServiceLocationOptions()
{
  return type metadata accessor for WeatherServiceLocationOptions();
}

uint64_t WeatherServiceFetchOptionsProvider.init(geocodeManager:)()
{
  return WeatherServiceFetchOptionsProvider.init(geocodeManager:)();
}

uint64_t type metadata accessor for WeatherServiceFetchOptionsProvider()
{
  return type metadata accessor for WeatherServiceFetchOptionsProvider();
}

uint64_t static WeatherAlert.Prominence.== infix(_:_:)()
{
  return static WeatherAlert.Prominence.== infix(_:_:)();
}

uint64_t type metadata accessor for WeatherAlert.Prominence()
{
  return type metadata accessor for WeatherAlert.Prominence();
}

uint64_t WeatherAlert.prominence.getter()
{
  return WeatherAlert.prominence.getter();
}

uint64_t WeatherAlert.detailsURL.getter()
{
  return WeatherAlert.detailsURL.getter();
}

uint64_t WeatherAlert.init(detailsURL:source:expirationDate:issuedDate:onsetTime:endDate:summary:region:severity:importance:metadata:id:)()
{
  return WeatherAlert.init(detailsURL:source:expirationDate:issuedDate:onsetTime:endDate:summary:region:severity:importance:metadata:id:)();
}

uint64_t WeatherAlert.init(detailsURL:source:date:expirationDate:issuedDate:onsetTime:endDate:summary:description:details:region:severity:importance:metadata:id:)()
{
  return WeatherAlert.init(detailsURL:source:date:expirationDate:issuedDate:onsetTime:endDate:summary:description:details:region:severity:importance:metadata:id:)();
}

uint64_t WeatherAlert.importance.getter()
{
  return WeatherAlert.importance.getter();
}

uint64_t WeatherAlert.issuedDate.getter()
{
  return WeatherAlert.issuedDate.getter();
}

uint64_t WeatherAlert.description.getter()
{
  return WeatherAlert.description.getter();
}

uint64_t WeatherAlert.expirationDate.getter()
{
  return WeatherAlert.expirationDate.getter();
}

uint64_t WeatherAlert.id.getter()
{
  return WeatherAlert.id.getter();
}

uint64_t WeatherAlert.date.getter()
{
  return WeatherAlert.date.getter();
}

uint64_t WeatherAlert.region.getter()
{
  return WeatherAlert.region.getter();
}

uint64_t WeatherAlert.source.getter()
{
  return WeatherAlert.source.getter();
}

uint64_t WeatherAlert.details.getter()
{
  return WeatherAlert.details.getter();
}

uint64_t WeatherAlert.endDate.getter()
{
  return WeatherAlert.endDate.getter();
}

uint64_t WeatherAlert.summary.getter()
{
  return WeatherAlert.summary.getter();
}

uint64_t WeatherAlert.metadata.getter()
{
  return WeatherAlert.metadata.getter();
}

uint64_t WeatherAlert.severity.getter()
{
  return WeatherAlert.severity.getter();
}

uint64_t WeatherAlert.onsetTime.getter()
{
  return WeatherAlert.onsetTime.getter();
}

uint64_t type metadata accessor for WeatherAlert()
{
  return type metadata accessor for WeatherAlert();
}

uint64_t WeatherChange.lowTemperature.getter()
{
  return WeatherChange.lowTemperature.getter();
}

uint64_t WeatherChange.highTemperature.getter()
{
  return WeatherChange.highTemperature.getter();
}

uint64_t WeatherChange.dayPrecipitationAmount.getter()
{
  return WeatherChange.dayPrecipitationAmount.getter();
}

uint64_t WeatherChange.nightPrecipitationAmount.getter()
{
  return WeatherChange.nightPrecipitationAmount.getter();
}

uint64_t WeatherChange.date.getter()
{
  return WeatherChange.date.getter();
}

uint64_t WeatherChange.init(date:highTemperature:lowTemperature:dayPrecipitationAmount:nightPrecipitationAmount:)()
{
  return WeatherChange.init(date:highTemperature:lowTemperature:dayPrecipitationAmount:nightPrecipitationAmount:)();
}

uint64_t type metadata accessor for WeatherChange()
{
  return type metadata accessor for WeatherChange();
}

uint64_t WeatherChanges.init(changes:metadata:)()
{
  return WeatherChanges.init(changes:metadata:)();
}

uint64_t WeatherChanges.changes.getter()
{
  return WeatherChanges.changes.getter();
}

uint64_t WeatherChanges.metadata.getter()
{
  return WeatherChanges.metadata.getter();
}

uint64_t type metadata accessor for WeatherChanges()
{
  return type metadata accessor for WeatherChanges();
}

uint64_t WeatherService.fetchWeather<A, B, C, D, E, F, G, H, I, J>(for:including:_:_:_:_:_:_:_:_:_:options:completion:)()
{
  return WeatherService.fetchWeather<A, B, C, D, E, F, G, H, I, J>(for:including:_:_:_:_:_:_:_:_:_:options:completion:)();
}

uint64_t WeatherService.fetchWeather<A, B, C, D, E, F, G, H, I, J, K>(for:including:_:_:_:_:_:_:_:_:_:_:options:completion:)()
{
  return WeatherService.fetchWeather<A, B, C, D, E, F, G, H, I, J, K>(for:including:_:_:_:_:_:_:_:_:_:_:options:completion:)();
}

uint64_t WeatherService.cachedWeather<A, B, C, D, E, F, G, H, I, J>(for:including:_:_:_:_:_:_:_:_:_:options:)()
{
  return WeatherService.cachedWeather<A, B, C, D, E, F, G, H, I, J>(for:including:_:_:_:_:_:_:_:_:_:options:)();
}

uint64_t WeatherService.fetchStatistics(for:calendar:options:timeZone:completion:)()
{
  return WeatherService.fetchStatistics(for:calendar:options:timeZone:completion:)();
}

uint64_t WeatherService.lastServerFetch<each A>(for:including:options:)()
{
  return WeatherService.lastServerFetch<each A>(for:including:options:)();
}

uint64_t WeatherService.init(scaleCacheManager:endpoint:caching:networkMonitor:authenticator:fetchOptionsProvider:serviceConfigurationProvider:)()
{
  return WeatherService.init(scaleCacheManager:endpoint:caching:networkMonitor:authenticator:fetchOptionsProvider:serviceConfigurationProvider:)();
}

uint64_t WeatherService.fetchAvailableDataSets(for:timeZone:locationDecimalPrecision:countryCode:completion:)()
{
  return WeatherService.fetchAvailableDataSets(for:timeZone:locationDecimalPrecision:countryCode:completion:)();
}

uint64_t static WeatherService.statisticsPastDaysToFetch.getter()
{
  return static WeatherService.statisticsPastDaysToFetch.getter();
}

uint64_t type metadata accessor for WeatherService()
{
  return type metadata accessor for WeatherService();
}

uint64_t WeatherMetadata.attribution.getter()
{
  return WeatherMetadata.attribution.getter();
}

uint64_t WeatherMetadata.expirationDate.getter()
{
  return WeatherMetadata.expirationDate.getter();
}

uint64_t WeatherMetadata.expirationDate.setter()
{
  return WeatherMetadata.expirationDate.setter();
}

uint64_t WeatherMetadata.date.getter()
{
  return WeatherMetadata.date.getter();
}

uint64_t WeatherMetadata.date.setter()
{
  return WeatherMetadata.date.setter();
}

uint64_t WeatherMetadata.init(date:expirationDate:attribution:)()
{
  return WeatherMetadata.init(date:expirationDate:attribution:)();
}

uint64_t WeatherMetadata.init(date:expirationDate:latitude:longitude:attribution:)()
{
  return WeatherMetadata.init(date:expirationDate:latitude:longitude:attribution:)();
}

uint64_t WeatherMetadata.init(date:expirationDate:latitude:longitude:)()
{
  return WeatherMetadata.init(date:expirationDate:latitude:longitude:)();
}

uint64_t static WeatherMetadata.mock()()
{
  return static WeatherMetadata.mock()();
}

uint64_t WeatherMetadata.latitude.getter()
{
  return WeatherMetadata.latitude.getter();
}

uint64_t WeatherMetadata.longitude.getter()
{
  return WeatherMetadata.longitude.getter();
}

uint64_t type metadata accessor for WeatherMetadata()
{
  return type metadata accessor for WeatherMetadata();
}

uint64_t type metadata accessor for WeatherSeverity()
{
  return type metadata accessor for WeatherSeverity();
}

uint64_t WeatherCondition.conditionIcon(isDaylight:isFilled:forLightBackground:)()
{
  return WeatherCondition.conditionIcon(isDaylight:isFilled:forLightBackground:)();
}

uint64_t WeatherCondition.isPrecipitation.getter()
{
  return WeatherCondition.isPrecipitation.getter();
}

Swift::String_optional __swiftcall WeatherCondition.conditionIconName(isDaytime:)(Swift::Bool isDaytime)
{
  uint64_t v1 = WeatherCondition.conditionIconName(isDaytime:)(isDaytime);
  result.value._uint64_t object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t WeatherCondition.description.getter()
{
  return WeatherCondition.description.getter();
}

uint64_t static WeatherCondition.allCases.getter()
{
  return static WeatherCondition.allCases.getter();
}

uint64_t WeatherCondition.rawValue.getter()
{
  return WeatherCondition.rawValue.getter();
}

uint64_t type metadata accessor for WeatherCondition()
{
  return type metadata accessor for WeatherCondition();
}

uint64_t WeatherDataModel.init(currentWeather:minuteForecast:hourlyForecast:dailyForecast:airQuality:weatherChanges:weatherAlerts:availability:historicalComparisons:historicalFacts:)()
{
  return WeatherDataModel.init(currentWeather:minuteForecast:hourlyForecast:dailyForecast:airQuality:weatherChanges:weatherAlerts:availability:historicalComparisons:historicalFacts:)();
}

uint64_t WeatherDataModel.currentWeather.getter()
{
  return WeatherDataModel.currentWeather.getter();
}

uint64_t WeatherDataModel.currentWeather.setter()
{
  return WeatherDataModel.currentWeather.setter();
}

uint64_t WeatherDataModel.rainExpectation.getter()
{
  return WeatherDataModel.rainExpectation.getter();
}

uint64_t WeatherDataModel.airQuality.getter()
{
  return WeatherDataModel.airQuality.getter();
}

uint64_t WeatherDataModel.availability.getter()
{
  return WeatherDataModel.availability.getter();
}

uint64_t WeatherDataModel.dailyForecast.getter()
{
  return WeatherDataModel.dailyForecast.getter();
}

uint64_t WeatherDataModel.dailyForecast.setter()
{
  return WeatherDataModel.dailyForecast.setter();
}

uint64_t WeatherDataModel.weatherAlerts.getter()
{
  return WeatherDataModel.weatherAlerts.getter();
}

uint64_t WeatherDataModel.hourlyForecast.getter()
{
  return WeatherDataModel.hourlyForecast.getter();
}

uint64_t WeatherDataModel.minuteForecast.getter()
{
  return WeatherDataModel.minuteForecast.getter();
}

uint64_t WeatherDataModel.weatherChanges.getter()
{
  return WeatherDataModel.weatherChanges.getter();
}

uint64_t WeatherDataModel.historicalFacts.getter()
{
  return WeatherDataModel.historicalFacts.getter();
}

uint64_t WeatherDataModel.historicalComparisons.getter()
{
  return WeatherDataModel.historicalComparisons.getter();
}

uint64_t static WeatherDataModel.== infix(_:_:)()
{
  return static WeatherDataModel.== infix(_:_:)();
}

uint64_t WeatherDataModel.isExpired.getter()
{
  return WeatherDataModel.isExpired.getter();
}

uint64_t type metadata accessor for WeatherDataModel()
{
  return type metadata accessor for WeatherDataModel();
}

uint64_t AirQuality.displayDescription.getter()
{
  return AirQuality.displayDescription.getter();
}

uint64_t AirQuality.pollutants.getter()
{
  return AirQuality.pollutants.getter();
}

uint64_t AirQuality.learnMoreURL.getter()
{
  return AirQuality.learnMoreURL.getter();
}

uint64_t AirQuality.isSignificant.getter()
{
  return AirQuality.isSignificant.getter();
}

uint64_t AirQuality.expirationDate.getter()
{
  return AirQuality.expirationDate.getter();
}

uint64_t AirQuality.init(measurementDate:expirationDate:scaleIdentifier:scale:index:currentScaleCategory:isSignificant:providerAttribution:learnMoreURL:pollutants:primaryPollutant:previousDayComparison:source:metadata:)()
{
  return AirQuality.init(measurementDate:expirationDate:scaleIdentifier:scale:index:currentScaleCategory:isSignificant:providerAttribution:learnMoreURL:pollutants:primaryPollutant:previousDayComparison:source:metadata:)();
}

uint64_t AirQuality.measurementDate.getter()
{
  return AirQuality.measurementDate.getter();
}

uint64_t AirQuality.init(scaleIdentifier:scale:index:currentScaleCategory:isSignificant:providerAttribution:learnMoreURL:pollutants:primaryPollutant:previousDayComparison:source:metadata:)()
{
  return AirQuality.init(scaleIdentifier:scale:index:currentScaleCategory:isSignificant:providerAttribution:learnMoreURL:pollutants:primaryPollutant:previousDayComparison:source:metadata:)();
}

uint64_t AirQuality.scaleIdentifier.getter()
{
  return AirQuality.scaleIdentifier.getter();
}

uint64_t AirQuality.primaryPollutant.getter()
{
  return AirQuality.primaryPollutant.getter();
}

uint64_t AirQuality.providerAttribution.getter()
{
  return AirQuality.providerAttribution.getter();
}

uint64_t AirQuality.currentScaleCategory.getter()
{
  return AirQuality.currentScaleCategory.getter();
}

uint64_t AirQuality.previousDayComparison.getter()
{
  return AirQuality.previousDayComparison.getter();
}

uint64_t static AirQuality.== infix(_:_:)()
{
  return static AirQuality.== infix(_:_:)();
}

uint64_t AirQuality.index.getter()
{
  return AirQuality.index.getter();
}

uint64_t AirQuality.scale.getter()
{
  return AirQuality.scale.getter();
}

uint64_t AirQuality.source.getter()
{
  return AirQuality.source.getter();
}

uint64_t AirQuality.metadata.getter()
{
  return AirQuality.metadata.getter();
}

uint64_t type metadata accessor for AirQuality()
{
  return type metadata accessor for AirQuality();
}

uint64_t MoonEvents.init(phase:moonrise:moonset:)()
{
  return MoonEvents.init(phase:moonrise:moonset:)();
}

uint64_t MoonEvents.phase.getter()
{
  return MoonEvents.phase.getter();
}

uint64_t MoonEvents.moonset.getter()
{
  return MoonEvents.moonset.getter();
}

uint64_t MoonEvents.moonrise.getter()
{
  return MoonEvents.moonrise.getter();
}

uint64_t type metadata accessor for MoonEvents()
{
  return type metadata accessor for MoonEvents();
}

uint64_t Percentiles.p10.getter()
{
  return Percentiles.p10.getter();
}

uint64_t Percentiles.init(p10:p50:p90:)()
{
  return Percentiles.init(p10:p50:p90:)();
}

uint64_t Percentiles.p50.getter()
{
  return Percentiles.p50.getter();
}

uint64_t Percentiles.p90.getter()
{
  return Percentiles.p90.getter();
}

uint64_t WDSEndpoint.portOverrideProvider.getter()
{
  return WDSEndpoint.portOverrideProvider.getter();
}

uint64_t WDSEndpoint.url.getter()
{
  return WDSEndpoint.url.getter();
}

uint64_t WDSEndpoint.init(url:portOverrideProvider:)()
{
  return WDSEndpoint.init(url:portOverrideProvider:)();
}

{
  return WDSEndpoint.init(url:portOverrideProvider:)();
}

uint64_t WDSEndpoint.init(url:)()
{
  return WDSEndpoint.init(url:)();
}

uint64_t type metadata accessor for WDSEndpoint()
{
  return type metadata accessor for WDSEndpoint();
}

{
  return type metadata accessor for WDSEndpoint();
}

NSAttributedString __swiftcall AirPollutant.displayName(for:)(CTFontRef a1)
{
  return (NSAttributedString)AirPollutant.displayName(for:)(a1);
}

NSAttributedString __swiftcall AirPollutant.displayDescription(for:)(CTFontRef a1)
{
  return (NSAttributedString)AirPollutant.displayDescription(for:)(a1);
}

uint64_t AirPollutant.formattedValueString.getter()
{
  return AirPollutant.formattedValueString.getter();
}

uint64_t AirPollutant.standaloneDisplayName.getter()
{
  return AirPollutant.standaloneDisplayName.getter();
}

NSAttributedString_optional __swiftcall AirPollutant.abbreviatedDisplayName(font:)(CTFontRef font)
{
  uint64_t v1 = (objc_class *)AirPollutant.abbreviatedDisplayName(font:)(font);
  result.value.super.Class isa = v1;
  result.is_nil = v2;
  return result;
}

uint64_t AirPollutant.displayUnit.getter()
{
  return AirPollutant.displayUnit.getter();
}

uint64_t AirPollutant.init(kind:amount:displayUnit:)()
{
  return AirPollutant.init(kind:amount:displayUnit:)();
}

uint64_t AirPollutant.init(kind:amount:)()
{
  return AirPollutant.init(kind:amount:)();
}

uint64_t AirPollutant.kind.getter()
{
  return AirPollutant.kind.getter();
}

uint64_t AirPollutant.amount.getter()
{
  return AirPollutant.amount.getter();
}

uint64_t type metadata accessor for AirPollutant()
{
  return type metadata accessor for AirPollutant();
}

uint64_t GeocodeStore.init()()
{
  return GeocodeStore.init()();
}

uint64_t type metadata accessor for GeocodeStore()
{
  return type metadata accessor for GeocodeStore();
}

{
  return type metadata accessor for GeocodeStore();
}

uint64_t LocationInfo.expiration.getter()
{
  return LocationInfo.expiration.getter();
}

uint64_t LocationInfo.countryCode.getter()
{
  return LocationInfo.countryCode.getter();
}

uint64_t LocationInfo.preciseName.getter()
{
  return LocationInfo.preciseName.getter();
}

uint64_t LocationInfo.primaryName.getter()
{
  return LocationInfo.primaryName.getter();
}

uint64_t LocationInfo.secondaryName.getter()
{
  return LocationInfo.secondaryName.getter();
}

uint64_t LocationInfo.date.getter()
{
  return LocationInfo.date.getter();
}

uint64_t LocationInfo.timeZone.getter()
{
  return LocationInfo.timeZone.getter();
}

uint64_t type metadata accessor for LocationInfo()
{
  return type metadata accessor for LocationInfo();
}

{
  return type metadata accessor for LocationInfo();
}

uint64_t type metadata accessor for NextHourData()
{
  return type metadata accessor for NextHourData();
}

uint64_t static AQIScaleStore.locationPath.getter()
{
  return static AQIScaleStore.locationPath.getter();
}

uint64_t type metadata accessor for AQIScaleStore()
{
  return type metadata accessor for AQIScaleStore();
}

uint64_t MinuteSummary.precipitation.getter()
{
  return MinuteSummary.precipitation.getter();
}

uint64_t MinuteSummary.expirationDate.getter()
{
  return MinuteSummary.expirationDate.getter();
}

uint64_t MinuteSummary.precipitationKind.getter()
{
  return MinuteSummary.precipitationKind.getter();
}

uint64_t MinuteSummary.precipitationChance.getter()
{
  return MinuteSummary.precipitationChance.getter();
}

uint64_t MinuteSummary.apparentPrecipitationIntensity.getter()
{
  return MinuteSummary.apparentPrecipitationIntensity.getter();
}

uint64_t MinuteSummary.date.getter()
{
  return MinuteSummary.date.getter();
}

uint64_t MinuteSummary.init(date:expirationDate:precipitation:precipitationKind:precipitationChance:apparentPrecipitationIntensity:)()
{
  return MinuteSummary.init(date:expirationDate:precipitation:precipitationKind:precipitationChance:apparentPrecipitationIntensity:)();
}

uint64_t MinuteSummary.init(date:expirationDate:precipitation:precipitationChance:apparentPrecipitationIntensity:)()
{
  return MinuteSummary.init(date:expirationDate:precipitation:precipitationChance:apparentPrecipitationIntensity:)();
}

uint64_t type metadata accessor for MinuteSummary()
{
  return type metadata accessor for MinuteSummary();
}

uint64_t type metadata accessor for NextHourToken()
{
  return type metadata accessor for NextHourToken();
}

uint64_t Precipitation.chartColor.getter()
{
  return Precipitation.chartColor.getter();
}

uint64_t Precipitation.standaloneDescription.getter()
{
  return Precipitation.standaloneDescription.getter();
}

Swift::String_optional __swiftcall Precipitation.accessibilityDescription(with:)(Swift::Double with)
{
  uint64_t v1 = Precipitation.accessibilityDescription(with:)(with);
  result.value._uint64_t object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t Precipitation.accessibilityDescription.getter()
{
  return Precipitation.accessibilityDescription.getter();
}

uint64_t static Precipitation.mock(kind:)()
{
  return static Precipitation.mock(kind:)();
}

uint64_t type metadata accessor for Precipitation()
{
  return type metadata accessor for Precipitation();
}

uint64_t PressureTrend.symbolName.getter()
{
  return PressureTrend.symbolName.getter();
}

uint64_t type metadata accessor for PressureTrend()
{
  return type metadata accessor for PressureTrend();
}

uint64_t type metadata accessor for TrendBaseline.Kind()
{
  return type metadata accessor for TrendBaseline.Kind();
}

uint64_t TrendBaseline.init(kind:value:startDate:)()
{
  return TrendBaseline.init(kind:value:startDate:)();
}

uint64_t TrendBaseline.kind.getter()
{
  return TrendBaseline.kind.getter();
}

uint64_t TrendBaseline.value.getter()
{
  return TrendBaseline.value.getter();
}

uint64_t TrendBaseline.startDate.getter()
{
  return TrendBaseline.startDate.getter();
}

uint64_t type metadata accessor for TrendBaseline()
{
  return type metadata accessor for TrendBaseline();
}

uint64_t type metadata accessor for AirQualityData()
{
  return type metadata accessor for AirQualityData();
}

uint64_t GeocodeManager.init(service:store:)()
{
  return GeocodeManager.init(service:store:)();
}

uint64_t type metadata accessor for GeocodeManager()
{
  return type metadata accessor for GeocodeManager();
}

uint64_t GeocodeService.init()()
{
  return GeocodeService.init()();
}

uint64_t type metadata accessor for GeocodeService()
{
  return type metadata accessor for GeocodeService();
}

uint64_t HistoricalFact.token.getter()
{
  return HistoricalFact.token.getter();
}

uint64_t type metadata accessor for HistoricalFact.Period()
{
  return type metadata accessor for HistoricalFact.Period();
}

uint64_t HistoricalFact.period.getter()
{
  return HistoricalFact.period.getter();
}

uint64_t HistoricalFact.heading.getter()
{
  return HistoricalFact.heading.getter();
}

uint64_t HistoricalFact.message.getter()
{
  return HistoricalFact.message.getter();
}

uint64_t type metadata accessor for HistoricalFact.Argument()
{
  return type metadata accessor for HistoricalFact.Argument();
}

uint64_t HistoricalFact.metadata.getter()
{
  return HistoricalFact.metadata.getter();
}

uint64_t type metadata accessor for HistoricalFact.Condition()
{
  return type metadata accessor for HistoricalFact.Condition();
}

uint64_t HistoricalFact.arguments.getter()
{
  return HistoricalFact.arguments.getter();
}

uint64_t HistoricalFact.init(condition:period:token:heading:message:arguments:metadata:)()
{
  return HistoricalFact.init(condition:period:token:heading:message:arguments:metadata:)();
}

uint64_t HistoricalFact.condition.getter()
{
  return HistoricalFact.condition.getter();
}

uint64_t type metadata accessor for HistoricalFact()
{
  return type metadata accessor for HistoricalFact();
}

uint64_t NextHourMinute.perceivedIntensity.getter()
{
  return NextHourMinute.perceivedIntensity.getter();
}

uint64_t NextHourMinute.precipitationChance.getter()
{
  return NextHourMinute.precipitationChance.getter();
}

uint64_t NextHourMinute.precipitationIntensity.getter()
{
  return NextHourMinute.precipitationIntensity.getter();
}

uint64_t NextHourMinute.startDate.getter()
{
  return NextHourMinute.startDate.getter();
}

uint64_t NextHourMinute.init(startDate:precipitationChance:precipitationIntensity:perceivedIntensity:)()
{
  return NextHourMinute.init(startDate:precipitationChance:precipitationIntensity:perceivedIntensity:)();
}

uint64_t type metadata accessor for NextHourMinute()
{
  return type metadata accessor for NextHourMinute();
}

uint64_t SnowfallAmount.amountLiquidEquivalent.getter()
{
  return SnowfallAmount.amountLiquidEquivalent.getter();
}

uint64_t SnowfallAmount.maximumLiquidEquivalent.getter()
{
  return SnowfallAmount.maximumLiquidEquivalent.getter();
}

uint64_t SnowfallAmount.minimumLiquidEquivalent.getter()
{
  return SnowfallAmount.minimumLiquidEquivalent.getter();
}

uint64_t SnowfallAmount.amount.getter()
{
  return SnowfallAmount.amount.getter();
}

uint64_t SnowfallAmount.maximum.getter()
{
  return SnowfallAmount.maximum.getter();
}

uint64_t SnowfallAmount.minimum.getter()
{
  return SnowfallAmount.minimum.getter();
}

uint64_t type metadata accessor for SnowfallAmount()
{
  return type metadata accessor for SnowfallAmount();
}

uint64_t AirQualityScale.gradientStops.getter()
{
  return AirQualityScale.gradientStops.getter();
}

Swift::Double __swiftcall AirQualityScale.fraction(for:)(Swift::Int a1)
{
  AirQualityScale.fraction(for:)(a1);
  return result;
}

uint64_t AirQualityScale.categories.getter()
{
  return AirQualityScale.categories.getter();
}

uint64_t AirQualityScale.init(identifier:displayName:shortDisplayName:longDisplayName:displayLabel:isNumerical:range:categories:gradient:)()
{
  return AirQualityScale.init(identifier:displayName:shortDisplayName:longDisplayName:displayLabel:isNumerical:range:categories:gradient:)();
}

uint64_t AirQualityScale.identifier.getter()
{
  return AirQualityScale.identifier.getter();
}

uint64_t AirQualityScale.displayName.getter()
{
  return AirQualityScale.displayName.getter();
}

uint64_t AirQualityScale.isNumerical.getter()
{
  return AirQualityScale.isNumerical.getter();
}

uint64_t AirQualityScale.displayLabel.getter()
{
  return AirQualityScale.displayLabel.getter();
}

uint64_t AirQualityScale.longDisplayName.getter()
{
  return AirQualityScale.longDisplayName.getter();
}

uint64_t AirQualityScale.shortDisplayName.getter()
{
  return AirQualityScale.shortDisplayName.getter();
}

uint64_t AirQualityScale.range.getter()
{
  return AirQualityScale.range.getter();
}

uint64_t AirQualityScale.gradient.getter()
{
  return AirQualityScale.gradient.getter();
}

uint64_t type metadata accessor for AirQualityScale()
{
  return type metadata accessor for AirQualityScale();
}

uint64_t DayPartForecast.cloudCover.getter()
{
  return DayPartForecast.cloudCover.getter();
}

uint64_t DayPartForecast.isDaylight.getter()
{
  return DayPartForecast.isDaylight.getter();
}

uint64_t DayPartForecast.forecastEnd.getter()
{
  return DayPartForecast.forecastEnd.getter();
}

uint64_t DayPartForecast.init(forecastStart:forecastEnd:cloudCover:cloudCoverByAltitude:condition:highTemperature:lowTemperature:precipitation:precipitationAmountByType:precipitationChance:precipitationIntensityMax:perceivedPrecipitationIntensityMax:isDaylight:maximumHumidity:minimumHumidity:maximumVisibility:minimumVisibility:wind:highWindSpeed:humidity:)()
{
  return DayPartForecast.init(forecastStart:forecastEnd:cloudCover:cloudCoverByAltitude:condition:highTemperature:lowTemperature:precipitation:precipitationAmountByType:precipitationChance:precipitationIntensityMax:perceivedPrecipitationIntensityMax:isDaylight:maximumHumidity:minimumHumidity:maximumVisibility:minimumVisibility:wind:highWindSpeed:humidity:)();
}

uint64_t DayPartForecast.forecastStart.getter()
{
  return DayPartForecast.forecastStart.getter();
}

uint64_t DayPartForecast.highWindSpeed.getter()
{
  return DayPartForecast.highWindSpeed.getter();
}

uint64_t DayPartForecast.precipitation.getter()
{
  return DayPartForecast.precipitation.getter();
}

uint64_t DayPartForecast.lowTemperature.getter()
{
  return DayPartForecast.lowTemperature.getter();
}

uint64_t DayPartForecast.highTemperature.getter()
{
  return DayPartForecast.highTemperature.getter();
}

uint64_t DayPartForecast.maximumHumidity.getter()
{
  return DayPartForecast.maximumHumidity.getter();
}

uint64_t DayPartForecast.minimumHumidity.getter()
{
  return DayPartForecast.minimumHumidity.getter();
}

uint64_t DayPartForecast.maximumVisibility.getter()
{
  return DayPartForecast.maximumVisibility.getter();
}

uint64_t DayPartForecast.minimumVisibility.getter()
{
  return DayPartForecast.minimumVisibility.getter();
}

uint64_t DayPartForecast.precipitationChance.getter()
{
  return DayPartForecast.precipitationChance.getter();
}

uint64_t DayPartForecast.cloudCoverByAltitude.getter()
{
  return DayPartForecast.cloudCoverByAltitude.getter();
}

uint64_t DayPartForecast.precipitationAmountByType.getter()
{
  return DayPartForecast.precipitationAmountByType.getter();
}

uint64_t DayPartForecast.precipitationIntensityMax.getter()
{
  return DayPartForecast.precipitationIntensityMax.getter();
}

uint64_t DayPartForecast.perceivedPrecipitationIntensityMax.getter()
{
  return DayPartForecast.perceivedPrecipitationIntensityMax.getter();
}

uint64_t DayPartForecast.wind.getter()
{
  return DayPartForecast.wind.getter();
}

uint64_t DayPartForecast.humidity.getter()
{
  return DayPartForecast.humidity.getter();
}

uint64_t DayPartForecast.condition.getter()
{
  return DayPartForecast.condition.getter();
}

uint64_t type metadata accessor for DayPartForecast()
{
  return type metadata accessor for DayPartForecast();
}

uint64_t HistoricalFacts.init(facts:)()
{
  return HistoricalFacts.init(facts:)();
}

uint64_t HistoricalFacts.facts.getter()
{
  return HistoricalFacts.facts.getter();
}

uint64_t type metadata accessor for HistoricalFacts()
{
  return type metadata accessor for HistoricalFacts();
}

uint64_t MinuteCondition.parameters.getter()
{
  return MinuteCondition.parameters.getter();
}

uint64_t MinuteCondition.expirationDate.getter()
{
  return MinuteCondition.expirationDate.getter();
}

uint64_t MinuteCondition.longDescription.getter()
{
  return MinuteCondition.longDescription.getter();
}

uint64_t MinuteCondition.shortDescription.getter()
{
  return MinuteCondition.shortDescription.getter();
}

uint64_t MinuteCondition.date.getter()
{
  return MinuteCondition.date.getter();
}

uint64_t MinuteCondition.init(date:expirationDate:shift:)()
{
  return MinuteCondition.init(date:expirationDate:shift:)();
}

uint64_t MinuteCondition.shift.getter()
{
  return MinuteCondition.shift.getter();
}

uint64_t MinuteCondition.token.getter()
{
  return MinuteCondition.token.getter();
}

uint64_t type metadata accessor for MinuteCondition()
{
  return type metadata accessor for MinuteCondition();
}

uint64_t NextHourSummary.precipitation.getter()
{
  return NextHourSummary.precipitation.getter();
}

uint64_t NextHourSummary.perceivedIntensity.getter()
{
  return NextHourSummary.perceivedIntensity.getter();
}

uint64_t NextHourSummary.precipitationChance.getter()
{
  return NextHourSummary.precipitationChance.getter();
}

uint64_t NextHourSummary.apparentPrecipitationIntensity.getter()
{
  return NextHourSummary.apparentPrecipitationIntensity.getter();
}

uint64_t NextHourSummary.endDate.getter()
{
  return NextHourSummary.endDate.getter();
}

uint64_t NextHourSummary.init(startDate:endDate:precipitation:precipitationChance:apparentPrecipitationIntensity:perceivedIntensity:)()
{
  return NextHourSummary.init(startDate:endDate:precipitation:precipitationChance:apparentPrecipitationIntensity:perceivedIntensity:)();
}

uint64_t NextHourSummary.startDate.getter()
{
  return NextHourSummary.startDate.getter();
}

uint64_t type metadata accessor for NextHourSummary()
{
  return type metadata accessor for NextHourSummary();
}

uint64_t type metadata accessor for AirPollutantKind()
{
  return type metadata accessor for AirPollutantKind();
}

uint64_t type metadata accessor for AirPollutantUnit()
{
  return type metadata accessor for AirPollutantUnit();
}

uint64_t AirQualitySource.description.getter()
{
  return AirQualitySource.description.getter();
}

uint64_t AirQualitySource.init(kind:description:)()
{
  return AirQualitySource.init(kind:description:)();
}

uint64_t AirQualitySource.kind.getter()
{
  return AirQualitySource.kind.getter();
}

uint64_t type metadata accessor for AirQualitySource()
{
  return type metadata accessor for AirQualitySource();
}

uint64_t ArticlePlacement.init(articles:location:)()
{
  return ArticlePlacement.init(articles:location:)();
}

uint64_t ArticlePlacement.articles.getter()
{
  return ArticlePlacement.articles.getter();
}

uint64_t ArticlePlacement.location.getter()
{
  return ArticlePlacement.location.getter();
}

uint64_t type metadata accessor for ArticlePlacement()
{
  return type metadata accessor for ArticlePlacement();
}

uint64_t static AvailableDataSets.historicalFacts.getter()
{
  return static AvailableDataSets.historicalFacts.getter();
}

uint64_t static AvailableDataSets.forecastNextHour.getter()
{
  return static AvailableDataSets.forecastNextHour.getter();
}

uint64_t static AvailableDataSets.all.getter()
{
  return static AvailableDataSets.all.getter();
}

uint64_t AvailableDataSets.init(rawValue:)()
{
  return AvailableDataSets.init(rawValue:)();
}

uint64_t AvailableDataSets.rawValue.getter()
{
  return AvailableDataSets.rawValue.getter();
}

uint64_t type metadata accessor for AvailableDataSets()
{
  return type metadata accessor for AvailableDataSets();
}

uint64_t NextHourCondition.parameters.getter()
{
  return NextHourCondition.parameters.getter();
}

uint64_t NextHourCondition.expirationDate.getter()
{
  return NextHourCondition.expirationDate.getter();
}

uint64_t NextHourCondition.longDescription.getter()
{
  return NextHourCondition.longDescription.getter();
}

uint64_t NextHourCondition.shortDescription.getter()
{
  return NextHourCondition.shortDescription.getter();
}

uint64_t NextHourCondition.date.getter()
{
  return NextHourCondition.date.getter();
}

uint64_t NextHourCondition.shift.getter()
{
  return NextHourCondition.shift.getter();
}

uint64_t NextHourCondition.token.getter()
{
  return NextHourCondition.token.getter();
}

uint64_t type metadata accessor for NextHourCondition()
{
  return type metadata accessor for NextHourCondition();
}

uint64_t type metadata accessor for PrecipitationShift.Kind()
{
  return type metadata accessor for PrecipitationShift.Kind();
}

uint64_t PrecipitationShift.date.getter()
{
  return PrecipitationShift.date.getter();
}

uint64_t PrecipitationShift.init(date:nextDate:kind:)()
{
  return PrecipitationShift.init(date:nextDate:kind:)();
}

uint64_t PrecipitationShift.kind.getter()
{
  return PrecipitationShift.kind.getter();
}

uint64_t PrecipitationShift.nextDate.getter()
{
  return PrecipitationShift.nextDate.getter();
}

uint64_t type metadata accessor for PrecipitationShift()
{
  return type metadata accessor for PrecipitationShift();
}

uint64_t PrecipitationAmount.nextSixHours.getter()
{
  return PrecipitationAmount.nextSixHours.getter();
}

uint64_t PrecipitationAmount.pastSixHours.getter()
{
  return PrecipitationAmount.pastSixHours.getter();
}

uint64_t PrecipitationAmount.nextTwentyFourHours.getter()
{
  return PrecipitationAmount.nextTwentyFourHours.getter();
}

uint64_t PrecipitationAmount.pastTwentyFourHours.getter()
{
  return PrecipitationAmount.pastTwentyFourHours.getter();
}

uint64_t PrecipitationAmount.nextHour.getter()
{
  return PrecipitationAmount.nextHour.getter();
}

uint64_t PrecipitationAmount.init(pastHour:pastSixHours:pastTwentyFourHours:nextHour:nextSixHours:nextTwentyFourHours:)()
{
  return PrecipitationAmount.init(pastHour:pastSixHours:pastTwentyFourHours:nextHour:nextSixHours:nextTwentyFourHours:)();
}

uint64_t PrecipitationAmount.pastHour.getter()
{
  return PrecipitationAmount.pastHour.getter();
}

uint64_t type metadata accessor for PrecipitationAmount()
{
  return type metadata accessor for PrecipitationAmount();
}

uint64_t ProviderAttribution.init(name:logoURL:)()
{
  return ProviderAttribution.init(name:logoURL:)();
}

uint64_t ProviderAttribution.name.getter()
{
  return ProviderAttribution.name.getter();
}

uint64_t ProviderAttribution.logoURL.getter()
{
  return ProviderAttribution.logoURL.getter();
}

uint64_t type metadata accessor for ProviderAttribution()
{
  return type metadata accessor for ProviderAttribution();
}

uint64_t AirPollutantCategory.init(description:number:)()
{
  return AirPollutantCategory.init(description:number:)();
}

uint64_t AirPollutantCategory.description.getter()
{
  return AirPollutantCategory.description.getter();
}

uint64_t AirPollutantCategory.number.getter()
{
  return AirPollutantCategory.number.getter();
}

uint64_t type metadata accessor for AirQualitySourceKind()
{
  return type metadata accessor for AirQualitySourceKind();
}

uint64_t CloudCoverByAltitude.init(low:medium:high:)()
{
  return CloudCoverByAltitude.init(low:medium:high:)();
}

uint64_t CloudCoverByAltitude.low.getter()
{
  return CloudCoverByAltitude.low.getter();
}

uint64_t CloudCoverByAltitude.high.getter()
{
  return CloudCoverByAltitude.high.getter();
}

uint64_t CloudCoverByAltitude.medium.getter()
{
  return CloudCoverByAltitude.medium.getter();
}

uint64_t type metadata accessor for CloudCoverByAltitude()
{
  return type metadata accessor for CloudCoverByAltitude();
}

uint64_t static HistoricalComparison.mockPrecipitation(trend:)()
{
  return static HistoricalComparison.mockPrecipitation(trend:)();
}

uint64_t static HistoricalComparison.mockMaximumTemperature(trend:)()
{
  return static HistoricalComparison.mockMaximumTemperature(trend:)();
}

uint64_t type metadata accessor for HistoricalComparison()
{
  return type metadata accessor for HistoricalComparison();
}

uint64_t DayTemperatureSummary.lowTemperature.getter()
{
  return DayTemperatureSummary.lowTemperature.getter();
}

uint64_t DayTemperatureSummary.highTemperature.getter()
{
  return DayTemperatureSummary.highTemperature.getter();
}

uint64_t DayTemperatureSummary.init(date:lowTemperature:highTemperature:)()
{
  return DayTemperatureSummary.init(date:lowTemperature:highTemperature:)();
}

uint64_t DayTemperatureSummary.date.getter()
{
  return DayTemperatureSummary.date.getter();
}

uint64_t HistoricalComparisons.init(comparisons:metadata:)()
{
  return HistoricalComparisons.init(comparisons:metadata:)();
}

uint64_t HistoricalComparisons.comparisons.getter()
{
  return HistoricalComparisons.comparisons.getter();
}

uint64_t HistoricalComparisons.hasValidData.getter()
{
  return HistoricalComparisons.hasValidData.getter();
}

uint64_t HistoricalComparisons.hasDeviationsFromTrend.getter()
{
  return HistoricalComparisons.hasDeviationsFromTrend.getter();
}

uint64_t static HistoricalComparisons.mock(comparisons:)()
{
  return static HistoricalComparisons.mock(comparisons:)();
}

uint64_t HistoricalComparisons.metadata.getter()
{
  return HistoricalComparisons.metadata.getter();
}

uint64_t type metadata accessor for HistoricalComparisons()
{
  return type metadata accessor for HistoricalComparisons();
}

uint64_t NextHourPrecipitation.conditions.getter()
{
  return NextHourPrecipitation.conditions.getter();
}

uint64_t NextHourPrecipitation.expirationDate.getter()
{
  return NextHourPrecipitation.expirationDate.getter();
}

uint64_t NextHourPrecipitation.minutes.getter()
{
  return NextHourPrecipitation.minutes.getter();
}

uint64_t NextHourPrecipitation.init(startDate:expirationDate:conditions:summaries:minutes:)()
{
  return NextHourPrecipitation.init(startDate:expirationDate:conditions:summaries:minutes:)();
}

uint64_t NextHourPrecipitation.startDate.getter()
{
  return NextHourPrecipitation.startDate.getter();
}

uint64_t NextHourPrecipitation.summaries.getter()
{
  return NextHourPrecipitation.summaries.getter();
}

uint64_t type metadata accessor for NextHourPrecipitation()
{
  return type metadata accessor for NextHourPrecipitation();
}

uint64_t type metadata accessor for AirPollutantMeasurement()
{
  return type metadata accessor for AirPollutantMeasurement();
}

uint64_t AirQualityScaleCategory.init(description:number:color:recommendation:range:glyph:)()
{
  return AirQualityScaleCategory.init(description:number:color:recommendation:range:glyph:)();
}

uint64_t AirQualityScaleCategory.description.getter()
{
  return AirQualityScaleCategory.description.getter();
}

uint64_t AirQualityScaleCategory.recommendation.getter()
{
  return AirQualityScaleCategory.recommendation.getter();
}

uint64_t AirQualityScaleCategory.color.getter()
{
  return AirQualityScaleCategory.color.getter();
}

uint64_t AirQualityScaleCategory.glyph.getter()
{
  return AirQualityScaleCategory.glyph.getter();
}

uint64_t AirQualityScaleCategory.range.getter()
{
  return AirQualityScaleCategory.range.getter();
}

uint64_t AirQualityScaleCategory.number.getter()
{
  return AirQualityScaleCategory.number.getter();
}

uint64_t type metadata accessor for AirQualityScaleCategory()
{
  return type metadata accessor for AirQualityScaleCategory();
}

uint64_t AirQualityScaleGradient.init(stops:)()
{
  return AirQualityScaleGradient.init(stops:)();
}

uint64_t AirQualityScaleGradient.stops.getter()
{
  return AirQualityScaleGradient.stops.getter();
}

uint64_t type metadata accessor for AirQualityScaleGradient()
{
  return type metadata accessor for AirQualityScaleGradient();
}

uint64_t DayPrecipitationSummary.snowfallAmount.getter()
{
  return DayPrecipitationSummary.snowfallAmount.getter();
}

uint64_t DayPrecipitationSummary.precipitationAmount.getter()
{
  return DayPrecipitationSummary.precipitationAmount.getter();
}

uint64_t DayPrecipitationSummary.date.getter()
{
  return DayPrecipitationSummary.date.getter();
}

uint64_t DayPrecipitationSummary.init(date:precipitationAmount:snowfallAmount:)()
{
  return DayPrecipitationSummary.init(date:precipitationAmount:snowfallAmount:)();
}

uint64_t type metadata accessor for DayPrecipitationSummary()
{
  return type metadata accessor for DayPrecipitationSummary();
}

uint64_t type metadata accessor for ArticlePlacementLocation()
{
  return type metadata accessor for ArticlePlacementLocation();
}

uint64_t HourTemperatureStatistics.percentiles.getter()
{
  return HourTemperatureStatistics.percentiles.getter();
}

uint64_t HourTemperatureStatistics.init(hour:percentiles:)()
{
  return HourTemperatureStatistics.init(hour:percentiles:)();
}

uint64_t HourTemperatureStatistics.hour.getter()
{
  return HourTemperatureStatistics.hour.getter();
}

uint64_t type metadata accessor for HourTemperatureStatistics()
{
  return type metadata accessor for HourTemperatureStatistics();
}

uint64_t PrecipitationAmountByType.snowfallAmount.getter()
{
  return PrecipitationAmountByType.snowfallAmount.getter();
}

uint64_t PrecipitationAmountByType.precipitation.getter()
{
  return PrecipitationAmountByType.precipitation.getter();
}

uint64_t PrecipitationAmountByType.hail.getter()
{
  return PrecipitationAmountByType.hail.getter();
}

uint64_t PrecipitationAmountByType.init(hail:mixed:rainfall:sleet:precipitation:snowfallAmount:)()
{
  return PrecipitationAmountByType.init(hail:mixed:rainfall:sleet:precipitation:snowfallAmount:)();
}

uint64_t static PrecipitationAmountByType.mock()()
{
  return static PrecipitationAmountByType.mock()();
}

uint64_t PrecipitationAmountByType.mixed.getter()
{
  return PrecipitationAmountByType.mixed.getter();
}

uint64_t PrecipitationAmountByType.sleet.getter()
{
  return PrecipitationAmountByType.sleet.getter();
}

uint64_t PrecipitationAmountByType.rainfall.getter()
{
  return PrecipitationAmountByType.rainfall.getter();
}

uint64_t type metadata accessor for PrecipitationAmountByType()
{
  return type metadata accessor for PrecipitationAmountByType();
}

uint64_t DayPrecipitationStatistics.averagePrecipitationAmount.getter()
{
  return DayPrecipitationStatistics.averagePrecipitationAmount.getter();
}

uint64_t DayPrecipitationStatistics.day.getter()
{
  return DayPrecipitationStatistics.day.getter();
}

uint64_t type metadata accessor for DayPrecipitationStatistics()
{
  return type metadata accessor for DayPrecipitationStatistics();
}

uint64_t MonthTemperatureStatistics.averageLowTemperature.getter()
{
  return MonthTemperatureStatistics.averageLowTemperature.getter();
}

uint64_t MonthTemperatureStatistics.averageHighTemperature.getter()
{
  return MonthTemperatureStatistics.averageHighTemperature.getter();
}

uint64_t MonthTemperatureStatistics.month.getter()
{
  return MonthTemperatureStatistics.month.getter();
}

uint64_t type metadata accessor for MonthTemperatureStatistics()
{
  return type metadata accessor for MonthTemperatureStatistics();
}

uint64_t type metadata accessor for NextHourPerceivedIntensity()
{
  return type metadata accessor for NextHourPerceivedIntensity();
}

uint64_t ProductRequirementsFactory.AppRequiredProducts.airQuality.getter()
{
  return ProductRequirementsFactory.AppRequiredProducts.airQuality.getter();
}

uint64_t ProductRequirementsFactory.AppRequiredProducts.availability.getter()
{
  return ProductRequirementsFactory.AppRequiredProducts.availability.getter();
}

uint64_t ProductRequirementsFactory.AppRequiredProducts.historicalComparisons.getter()
{
  return ProductRequirementsFactory.AppRequiredProducts.historicalComparisons.getter();
}

uint64_t ProductRequirementsFactory.AppRequiredProducts.news.getter()
{
  return ProductRequirementsFactory.AppRequiredProducts.news.getter();
}

uint64_t ProductRequirementsFactory.AppRequiredProducts.daily.getter()
{
  return ProductRequirementsFactory.AppRequiredProducts.daily.getter();
}

uint64_t ProductRequirementsFactory.AppRequiredProducts.alerts.getter()
{
  return ProductRequirementsFactory.AppRequiredProducts.alerts.getter();
}

uint64_t ProductRequirementsFactory.AppRequiredProducts.hourly.getter()
{
  return ProductRequirementsFactory.AppRequiredProducts.hourly.getter();
}

uint64_t ProductRequirementsFactory.AppRequiredProducts.changes.getter()
{
  return ProductRequirementsFactory.AppRequiredProducts.changes.getter();
}

uint64_t ProductRequirementsFactory.AppRequiredProducts.current.getter()
{
  return ProductRequirementsFactory.AppRequiredProducts.current.getter();
}

uint64_t ProductRequirementsFactory.AppRequiredProducts.minutely.getter()
{
  return ProductRequirementsFactory.AppRequiredProducts.minutely.getter();
}

uint64_t type metadata accessor for ProductRequirementsFactory.AppRequiredProducts()
{
  return type metadata accessor for ProductRequirementsFactory.AppRequiredProducts();
}

uint64_t ProductRequirementsFactory.AppGeoRequiredProducts.airQuality.getter()
{
  return ProductRequirementsFactory.AppGeoRequiredProducts.airQuality.getter();
}

uint64_t ProductRequirementsFactory.AppGeoRequiredProducts.availability.getter()
{
  return ProductRequirementsFactory.AppGeoRequiredProducts.availability.getter();
}

uint64_t ProductRequirementsFactory.AppGeoRequiredProducts.locationInfo.getter()
{
  return ProductRequirementsFactory.AppGeoRequiredProducts.locationInfo.getter();
}

uint64_t ProductRequirementsFactory.AppGeoRequiredProducts.historicalComparisons.getter()
{
  return ProductRequirementsFactory.AppGeoRequiredProducts.historicalComparisons.getter();
}

uint64_t ProductRequirementsFactory.AppGeoRequiredProducts.news.getter()
{
  return ProductRequirementsFactory.AppGeoRequiredProducts.news.getter();
}

uint64_t ProductRequirementsFactory.AppGeoRequiredProducts.daily.getter()
{
  return ProductRequirementsFactory.AppGeoRequiredProducts.daily.getter();
}

uint64_t ProductRequirementsFactory.AppGeoRequiredProducts.alerts.getter()
{
  return ProductRequirementsFactory.AppGeoRequiredProducts.alerts.getter();
}

uint64_t ProductRequirementsFactory.AppGeoRequiredProducts.hourly.getter()
{
  return ProductRequirementsFactory.AppGeoRequiredProducts.hourly.getter();
}

uint64_t ProductRequirementsFactory.AppGeoRequiredProducts.changes.getter()
{
  return ProductRequirementsFactory.AppGeoRequiredProducts.changes.getter();
}

uint64_t ProductRequirementsFactory.AppGeoRequiredProducts.current.getter()
{
  return ProductRequirementsFactory.AppGeoRequiredProducts.current.getter();
}

uint64_t ProductRequirementsFactory.AppGeoRequiredProducts.minutely.getter()
{
  return ProductRequirementsFactory.AppGeoRequiredProducts.minutely.getter();
}

uint64_t type metadata accessor for ProductRequirementsFactory.AppGeoRequiredProducts()
{
  return type metadata accessor for ProductRequirementsFactory.AppGeoRequiredProducts();
}

uint64_t AirQualityScaleGradientStop.color.getter()
{
  return AirQualityScaleGradientStop.color.getter();
}

uint64_t AirQualityScaleGradientStop.init(location:color:)()
{
  return AirQualityScaleGradientStop.init(location:color:)();
}

uint64_t AirQualityScaleGradientStop.location.getter()
{
  return AirQualityScaleGradientStop.location.getter();
}

uint64_t type metadata accessor for AirQualityScaleGradientStop()
{
  return type metadata accessor for AirQualityScaleGradientStop();
}

uint64_t static MinuteForecastStringBuilder.buildIntensityString(for:)()
{
  return static MinuteForecastStringBuilder.buildIntensityString(for:)();
}

uint64_t type metadata accessor for MinuteForecastStringBuilder()
{
  return type metadata accessor for MinuteForecastStringBuilder();
}

uint64_t MonthPrecipitationStatistics.averagePrecipitationAmount.getter()
{
  return MonthPrecipitationStatistics.averagePrecipitationAmount.getter();
}

uint64_t MonthPrecipitationStatistics.month.getter()
{
  return MonthPrecipitationStatistics.month.getter();
}

uint64_t type metadata accessor for MonthPrecipitationStatistics()
{
  return type metadata accessor for MonthPrecipitationStatistics();
}

uint64_t type metadata accessor for PrecipitationRelevancyWindow()
{
  return type metadata accessor for PrecipitationRelevancyWindow();
}

uint64_t ApparentPrecipitationIntensity.standaloneDescription.getter()
{
  return ApparentPrecipitationIntensity.standaloneDescription.getter();
}

uint64_t ApparentPrecipitationIntensity.init(value:category:)()
{
  return ApparentPrecipitationIntensity.init(value:category:)();
}

uint64_t ApparentPrecipitationIntensity.value.getter()
{
  return ApparentPrecipitationIntensity.value.getter();
}

uint64_t type metadata accessor for ApparentPrecipitationIntensity()
{
  return type metadata accessor for ApparentPrecipitationIntensity();
}

uint64_t dispatch thunk of ProductRequirementsFactoryType.appRequiredProducts(for:)()
{
  return dispatch thunk of ProductRequirementsFactoryType.appRequiredProducts(for:)();
}

uint64_t dispatch thunk of ProductRequirementsFactoryType.appGeoRequiredProducts(for:)()
{
  return dispatch thunk of ProductRequirementsFactoryType.appGeoRequiredProducts(for:)();
}

uint64_t type metadata accessor for AirQualityPreviousDayComparison()
{
  return type metadata accessor for AirQualityPreviousDayComparison();
}

uint64_t ApparentPrecipitationIntensityCategory.standaloneDescription.getter()
{
  return ApparentPrecipitationIntensityCategory.standaloneDescription.getter();
}

uint64_t ApparentPrecipitationIntensityCategory.rangeValue.getter()
{
  return ApparentPrecipitationIntensityCategory.rangeValue.getter();
}

uint64_t static ApparentPrecipitationIntensityCategory.allCases.getter()
{
  return static ApparentPrecipitationIntensityCategory.allCases.getter();
}

uint64_t type metadata accessor for ApparentPrecipitationIntensityCategory()
{
  return type metadata accessor for ApparentPrecipitationIntensityCategory();
}

uint64_t News.init(placements:)()
{
  return News.init(placements:)();
}

uint64_t News.placements.getter()
{
  return News.placements.getter();
}

uint64_t static News.== infix(_:_:)()
{
  return static News.== infix(_:_:)();
}

uint64_t type metadata accessor for News()
{
  return type metadata accessor for News();
}

uint64_t Wind.CompassDirection.abbreviation.getter()
{
  return Wind.CompassDirection.abbreviation.getter();
}

uint64_t Wind.init(compassDirection:direction:speed:gust:)()
{
  return Wind.init(compassDirection:direction:speed:gust:)();
}

uint64_t Wind.compassDirection.getter()
{
  return Wind.compassDirection.getter();
}

uint64_t Wind.gust.getter()
{
  return Wind.gust.getter();
}

uint64_t Wind.speed.getter()
{
  return Wind.speed.getter();
}

uint64_t Wind.direction.getter()
{
  return Wind.direction.getter();
}

uint64_t type metadata accessor for Wind()
{
  return type metadata accessor for Wind();
}

uint64_t Trend.currentValue.getter()
{
  return Trend.currentValue.getter();
}

uint64_t static Trend.== infix(_:_:)()
{
  return static Trend.== infix(_:_:)();
}

uint64_t Trend.init(baseline:currentValue:deviation:)()
{
  return Trend.init(baseline:currentValue:deviation:)();
}

uint64_t Trend.baseline.getter()
{
  return Trend.baseline.getter();
}

uint64_t Trend.deviation.getter()
{
  return Trend.deviation.getter();
}

uint64_t static Trend<>.mock(baselineKind:baselineValue:currentValue:deviation:baselineStartDate:)()
{
  return static Trend<>.mock(baselineKind:baselineValue:currentValue:deviation:baselineStartDate:)();
}

{
  return static Trend<>.mock(baselineKind:baselineValue:currentValue:deviation:baselineStartDate:)();
}

uint64_t Article.headlineOverride.getter()
{
  return Article.headlineOverride.getter();
}

uint64_t Article.supportedStorefronts.getter()
{
  return Article.supportedStorefronts.getter();
}

uint64_t static Article.== infix(_:_:)()
{
  return static Article.== infix(_:_:)();
}

uint64_t Article.init(id:supportedStorefronts:locale:headlineOverride:phenomena:alertIds:)()
{
  return Article.init(id:supportedStorefronts:locale:headlineOverride:phenomena:alertIds:)();
}

uint64_t Article.id.getter()
{
  return Article.id.getter();
}

uint64_t Article.locale.getter()
{
  return Article.locale.getter();
}

uint64_t Article.alertIds.getter()
{
  return Article.alertIds.getter();
}

uint64_t Article.phenomena.getter()
{
  return Article.phenomena.getter();
}

uint64_t type metadata accessor for Article()
{
  return type metadata accessor for Article();
}

uint64_t UVIndex.ExposureCategory.localizedString.getter()
{
  return UVIndex.ExposureCategory.localizedString.getter();
}

uint64_t UVIndex.ExposureCategory.rangeValue.getter()
{
  return UVIndex.ExposureCategory.rangeValue.getter();
}

uint64_t static UVIndex.ExposureCategory.allCases.getter()
{
  return static UVIndex.ExposureCategory.allCases.getter();
}

uint64_t UVIndex.ExposureCategory.rawValue.getter()
{
  return UVIndex.ExposureCategory.rawValue.getter();
}

uint64_t UVIndex.init(value:category:)()
{
  return UVIndex.init(value:category:)();
}

uint64_t UVIndex.value.getter()
{
  return UVIndex.value.getter();
}

uint64_t UVIndex.category.getter()
{
  return UVIndex.category.getter();
}

uint64_t type metadata accessor for UVIndex()
{
  return type metadata accessor for UVIndex();
}

uint64_t Forecast<>.numberOfHoursWithPrecipitation(withinHoursFromNow:minimumChance:)()
{
  return Forecast<>.numberOfHoursWithPrecipitation(withinHoursFromNow:minimumChance:)();
}

uint64_t Forecast.startIndex.getter()
{
  return Forecast.startIndex.getter();
}

uint64_t Forecast.minuteSummary.getter()
{
  return Forecast.minuteSummary.getter();
}

uint64_t Forecast.minuteSummaries.getter()
{
  return Forecast.minuteSummaries.getter();
}

uint64_t Forecast.minuteConditions.getter()
{
  return Forecast.minuteConditions.getter();
}

uint64_t static Forecast.== infix(_:_:)()
{
  return static Forecast.== infix(_:_:)();
}

uint64_t Forecast.forecast.getter()
{
  return Forecast.forecast.getter();
}

uint64_t Forecast.metadata.getter()
{
  return Forecast.metadata.getter();
}

uint64_t Forecast<>.todaysWeather(today:timeZone:)()
{
  return Forecast<>.todaysWeather(today:timeZone:)();
}

uint64_t Forecast<>.humidity(for:timeZone:)()
{
  return Forecast<>.humidity(for:timeZone:)();
}

uint64_t Forecast<>.isRelevant(in:)()
{
  return Forecast<>.isRelevant(in:)();
}

uint64_t Forecast<>.init(_:summary:conditions:summaries:metadata:)()
{
  return Forecast<>.init(_:summary:conditions:summaries:metadata:)();
}

uint64_t type metadata accessor for Forecast()
{
  return type metadata accessor for Forecast();
}

uint64_t Forecast.init(_:minuteSummary:minuteConditions:minuteSummaries:metadata:)()
{
  return Forecast.init(_:minuteSummary:minuteConditions:minuteSummaries:metadata:)();
}

uint64_t Forecast.init(_:metadata:)()
{
  return Forecast.init(_:metadata:)();
}

uint64_t Forecast.subscript.getter()
{
  return Forecast.subscript.getter();
}

uint64_t type metadata accessor for Deviation()
{
  return type metadata accessor for Deviation();
}

uint64_t static MoonPhase.Hemisphere.== infix(_:_:)()
{
  return static MoonPhase.Hemisphere.== infix(_:_:)();
}

uint64_t MoonPhase.Hemisphere.init(latitude:)()
{
  return MoonPhase.Hemisphere.init(latitude:)();
}

uint64_t type metadata accessor for MoonPhase.Hemisphere()
{
  return type metadata accessor for MoonPhase.Hemisphere();
}

uint64_t MoonPhase.symbolName(for:)()
{
  return MoonPhase.symbolName(for:)();
}

uint64_t MoonPhase.illuminatedFraction.getter()
{
  return MoonPhase.illuminatedFraction.getter();
}

uint64_t MoonPhase.description.getter()
{
  return MoonPhase.description.getter();
}

uint64_t MoonPhase.accessibilityDescription.getter()
{
  return MoonPhase.accessibilityDescription.getter();
}

uint64_t MoonPhase.rawValue.getter()
{
  return MoonPhase.rawValue.getter();
}

uint64_t SunEvents.nauticalDawn.getter()
{
  return SunEvents.nauticalDawn.getter();
}

uint64_t SunEvents.nauticalDusk.getter()
{
  return SunEvents.nauticalDusk.getter();
}

uint64_t SunEvents.solarMidnight.getter()
{
  return SunEvents.solarMidnight.getter();
}

uint64_t SunEvents.init(astronomicalDawn:nauticalDawn:civilDawn:sunrise:solarNoon:sunset:civilDusk:nauticalDusk:astronomicalDusk:solarMidnight:)()
{
  return SunEvents.init(astronomicalDawn:nauticalDawn:civilDawn:sunrise:solarNoon:sunset:civilDusk:nauticalDusk:astronomicalDusk:solarMidnight:)();
}

uint64_t SunEvents.astronomicalDawn.getter()
{
  return SunEvents.astronomicalDawn.getter();
}

uint64_t SunEvents.astronomicalDusk.getter()
{
  return SunEvents.astronomicalDusk.getter();
}

uint64_t static SunEvents.== infix(_:_:)()
{
  return static SunEvents.== infix(_:_:)();
}

uint64_t SunEvents.sunset.getter()
{
  return SunEvents.sunset.getter();
}

uint64_t SunEvents.sunrise.getter()
{
  return SunEvents.sunrise.getter();
}

uint64_t SunEvents.civilDawn.getter()
{
  return SunEvents.civilDawn.getter();
}

uint64_t SunEvents.civilDusk.getter()
{
  return SunEvents.civilDusk.getter();
}

uint64_t SunEvents.solarNoon.getter()
{
  return SunEvents.solarNoon.getter();
}

uint64_t type metadata accessor for SunEvents()
{
  return type metadata accessor for SunEvents();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.didSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.willSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t static Settings.Container.testSuite.getter()
{
  return static Settings.Container.testSuite.getter();
}

uint64_t static Settings.WeatherEnvironment.apsEnvironment.getter()
{
  return static Settings.WeatherEnvironment.apsEnvironment.getter();
}

uint64_t static Settings.WeatherEnvironment.contentEnvironment.getter()
{
  return static Settings.WeatherEnvironment.contentEnvironment.getter();
}

uint64_t static Settings.WeatherEnvironment.localServerURL.getter()
{
  return static Settings.WeatherEnvironment.localServerURL.getter();
}

uint64_t static Settings.WeatherEnvironment.localServerPort.getter()
{
  return static Settings.WeatherEnvironment.localServerPort.getter();
}

uint64_t static Settings.ActiveUser.resetActiveUserStatusOnNextLaunch.getter()
{
  return static Settings.ActiveUser.resetActiveUserStatusOnNextLaunch.getter();
}

uint64_t static Settings.HomeAndWork.homeAndWorkLabelEnabled.getter()
{
  return static Settings.HomeAndWork.homeAndWorkLabelEnabled.getter();
}

uint64_t static Settings.Notifications.Precipitation.evaluate.getter()
{
  return static Settings.Notifications.Precipitation.evaluate.getter();
}

uint64_t static Settings.Notifications.Precipitation.Overrides.nextCondition.getter()
{
  return static Settings.Notifications.Precipitation.Overrides.nextCondition.getter();
}

uint64_t static Settings.Notifications.Precipitation.Overrides.currentCondition.getter()
{
  return static Settings.Notifications.Precipitation.Overrides.currentCondition.getter();
}

uint64_t static Settings.Notifications.Precipitation.Overrides.date.getter()
{
  return static Settings.Notifications.Precipitation.Overrides.date.getter();
}

uint64_t static Settings.Notifications.Precipitation.Overrides.location.getter()
{
  return static Settings.Notifications.Precipitation.Overrides.location.getter();
}

uint64_t static Settings.Notifications.Precipitation.Overrides.intensity.getter()
{
  return static Settings.Notifications.Precipitation.Overrides.intensity.getter();
}

uint64_t type metadata accessor for Settings.Notifications.Precipitation.Overrides()
{
  return type metadata accessor for Settings.Notifications.Precipitation.Overrides();
}

uint64_t static Settings.Notifications.Precipitation.overrides.getter()
{
  return static Settings.Notifications.Precipitation.overrides.getter();
}

uint64_t static Settings.Notifications.Severe.debugNotifications.getter()
{
  return static Settings.Notifications.Severe.debugNotifications.getter();
}

uint64_t static Settings.Notifications.Severe.useGlobalChannelMap.getter()
{
  return static Settings.Notifications.Severe.useGlobalChannelMap.getter();
}

uint64_t static Settings.Notifications.Severe.filterIncomingEvents.getter()
{
  return static Settings.Notifications.Severe.filterIncomingEvents.getter();
}

uint64_t static Settings.Notifications.Severe.simulateAlertUpdates.getter()
{
  return static Settings.Notifications.Severe.simulateAlertUpdates.getter();
}

uint64_t static Settings.SavedLocations.useCoherence.getter()
{
  return static Settings.SavedLocations.useCoherence.getter();
}

uint64_t static Settings.SavedLocations.forceMigrateToCoherence.getter()
{
  return static Settings.SavedLocations.forceMigrateToCoherence.getter();
}

uint64_t static Settings.SavedLocations.removeCoherenceContainer.getter()
{
  return static Settings.SavedLocations.removeCoherenceContainer.getter();
}

uint64_t static Settings.LocationsOfInterest.mockedHomeAndWorkLocation.getter()
{
  return static Settings.LocationsOfInterest.mockedHomeAndWorkLocation.getter();
}

uint64_t static Settings.InternationalAuthenticity.verticalHeroForceInAllLocales.getter()
{
  return static Settings.InternationalAuthenticity.verticalHeroForceInAllLocales.getter();
}

uint64_t static Settings.InternationalAuthenticity.verticalHeroEnabledForCurrentLocale.getter()
{
  return static Settings.InternationalAuthenticity.verticalHeroEnabledForCurrentLocale.getter();
}

uint64_t static Settings.Beaufort.forceEnabled.getter()
{
  return static Settings.Beaufort.forceEnabled.getter();
}

uint64_t static Settings.Features.homeAndWork.getter()
{
  return static Settings.Features.homeAndWork.getter();
}

uint64_t static Settings.Features.homeAndWorkEnabled.getter()
{
  return static Settings.Features.homeAndWorkEnabled.getter();
}

uint64_t static Settings.Identity.resetReportWeatherUserIdentifierOnNextLaunch.getter()
{
  return static Settings.Identity.resetReportWeatherUserIdentifierOnNextLaunch.getter();
}

uint64_t static Settings.Identity.resetAllOnNextLaunch.getter()
{
  return static Settings.Identity.resetAllOnNextLaunch.getter();
}

uint64_t static Settings.Identity.resetUserIdentifierOnNextLaunch.getter()
{
  return static Settings.Identity.resetUserIdentifierOnNextLaunch.getter();
}

uint64_t static Settings.Identity.resetPrivateUserIdentifierOnNextLaunch.getter()
{
  return static Settings.Identity.resetPrivateUserIdentifierOnNextLaunch.getter();
}

uint64_t static Settings.Location.mockedCurrentLocation.getter()
{
  return static Settings.Location.mockedCurrentLocation.getter();
}

uint64_t static Settings.StubData.singleCity.getter()
{
  return static Settings.StubData.singleCity.getter();
}

uint64_t static Settings.StubData.includeNextHourPrecipitation.getter()
{
  return static Settings.StubData.includeNextHourPrecipitation.getter();
}

uint64_t static Settings.AppConfig.clearConfigCacheOnNextLaunch.getter()
{
  return static Settings.AppConfig.clearConfigCacheOnNextLaunch.getter();
}

uint64_t static Settings.AppConfig.forceDefault.getter()
{
  return static Settings.AppConfig.forceDefault.getter();
}

uint64_t static Settings.AppConfig.disableNetworkTelemetry.getter()
{
  return static Settings.AppConfig.disableNetworkTelemetry.getter();
}

uint64_t static Settings.Geocoding.bypassGreenTea.getter()
{
  return static Settings.Geocoding.bypassGreenTea.getter();
}

uint64_t static Settings.Geocoding.clearReverseGeocodingCacheOnNextLaunch.getter()
{
  return static Settings.Geocoding.clearReverseGeocodingCacheOnNextLaunch.getter();
}

uint64_t static Settings.Geocoding.bypassReverseGeocodingCache.getter()
{
  return static Settings.Geocoding.bypassReverseGeocodingCache.getter();
}

uint64_t static Settings.Geocoding.useBackgroundReverseGeocodingPriority.getter()
{
  return static Settings.Geocoding.useBackgroundReverseGeocodingPriority.getter();
}

uint64_t static Settings.Geocoding.clearGeocodingCacheOnNextLaunch.getter()
{
  return static Settings.Geocoding.clearGeocodingCacheOnNextLaunch.getter();
}

uint64_t static Settings.Geocoding.bypassGeocodingCache.getter()
{
  return static Settings.Geocoding.bypassGeocodingCache.getter();
}

uint64_t static Settings.Geocoding.clientServerSideRevGeo.getter()
{
  return static Settings.Geocoding.clientServerSideRevGeo.getter();
}

uint64_t static Settings.Geocoding.clearCurrentLocationCacheOnNextLaunch.getter()
{
  return static Settings.Geocoding.clearCurrentLocationCacheOnNextLaunch.getter();
}

uint64_t static Settings.Maps.disableBlending.getter()
{
  return static Settings.Maps.disableBlending.getter();
}

uint64_t static Settings.Maps.showDebugConsole.getter()
{
  return static Settings.Maps.showDebugConsole.getter();
}

uint64_t static Settings.Maps.improvedLoadingBar.getter()
{
  return static Settings.Maps.improvedLoadingBar.getter();
}

uint64_t static Settings.Maps.resetZoomLevelsPreset.getter()
{
  return static Settings.Maps.resetZoomLevelsPreset.getter();
}

uint64_t static Settings.Maps.disableMetadataCaching.getter()
{
  return static Settings.Maps.disableMetadataCaching.getter();
}

uint64_t static Settings.Maps.useClientHashRendering.getter()
{
  return static Settings.Maps.useClientHashRendering.getter();
}

uint64_t static Settings.Maps.useMergedPrecipitation.getter()
{
  return static Settings.Maps.useMergedPrecipitation.getter();
}

uint64_t static Settings.Maps.resetLocalStoragePreset.getter()
{
  return static Settings.Maps.resetLocalStoragePreset.getter();
}

uint64_t static Settings.Maps.forceSeparateRadarEndpoints.getter()
{
  return static Settings.Maps.forceSeparateRadarEndpoints.getter();
}

uint64_t static Settings.Maps.disableMapOverlaySonification.getter()
{
  return static Settings.Maps.disableMapOverlaySonification.getter();
}

uint64_t static Settings.Maps.resetTransparentOverlaysPreset.getter()
{
  return static Settings.Maps.resetTransparentOverlaysPreset.getter();
}

uint64_t static Settings.Maps.interactiveMapRefreshIntervalMinutes.getter()
{
  return static Settings.Maps.interactiveMapRefreshIntervalMinutes.getter();
}

uint64_t static Settings.Maps.disableMapLocationAccessibilityModels.getter()
{
  return static Settings.Maps.disableMapLocationAccessibilityModels.getter();
}

uint64_t static Settings.Maps.cdn.getter()
{
  return static Settings.Maps.cdn.getter();
}

uint64_t static Settings.Maps.source.getter()
{
  return static Settings.Maps.source.getter();
}

uint64_t static Settings.Maps.Requests.implicationTimerMs.getter()
{
  return static Settings.Maps.Requests.implicationTimerMs.getter();
}

uint64_t static Settings.Maps.Requests.maxRequestConcurrency.getter()
{
  return static Settings.Maps.Requests.maxRequestConcurrency.getter();
}

uint64_t type metadata accessor for Settings.Maps.Requests()
{
  return type metadata accessor for Settings.Maps.Requests();
}

uint64_t static Settings.Maps.requests.getter()
{
  return static Settings.Maps.requests.getter();
}

uint64_t static Settings.Maps.Overrides.windZoomLevel.getter()
{
  return static Settings.Maps.Overrides.windZoomLevel.getter();
}

uint64_t static Settings.Maps.Overrides.defaultOverlayKind.getter()
{
  return static Settings.Maps.Overrides.defaultOverlayKind.getter();
}

uint64_t static Settings.Maps.Overrides.disableWindOverlay.getter()
{
  return static Settings.Maps.Overrides.disableWindOverlay.getter();
}

uint64_t static Settings.Maps.Overrides.airQualityZoomLevel.getter()
{
  return static Settings.Maps.Overrides.airQualityZoomLevel.getter();
}

uint64_t static Settings.Maps.Overrides.temperatureZoomLevel.getter()
{
  return static Settings.Maps.Overrides.temperatureZoomLevel.getter();
}

uint64_t static Settings.Maps.Overrides.radarZoomLevelThreshold.getter()
{
  return static Settings.Maps.Overrides.radarZoomLevelThreshold.getter();
}

uint64_t static Settings.Maps.Overrides.precipitationRadarZoomLevel.getter()
{
  return static Settings.Maps.Overrides.precipitationRadarZoomLevel.getter();
}

uint64_t static Settings.Maps.Overrides.precipitationForecastZoomLevel.getter()
{
  return static Settings.Maps.Overrides.precipitationForecastZoomLevel.getter();
}

uint64_t static Settings.Maps.Overrides.precipitationRadarIsRainingZoomLevel.getter()
{
  return static Settings.Maps.Overrides.precipitationRadarIsRainingZoomLevel.getter();
}

uint64_t static Settings.Maps.Overrides.precipitationForecastRainsInNextHourZoomLevel.getter()
{
  return static Settings.Maps.Overrides.precipitationForecastRainsInNextHourZoomLevel.getter();
}

uint64_t type metadata accessor for Settings.Maps.Overrides()
{
  return type metadata accessor for Settings.Maps.Overrides();
}

uint64_t static Settings.Maps.overrides.getter()
{
  return static Settings.Maps.overrides.getter();
}

uint64_t static Settings.Daemon.clearWeatherDataCacheOnNextLaunch.getter()
{
  return static Settings.Daemon.clearWeatherDataCacheOnNextLaunch.getter();
}

uint64_t static Settings.Daemon.clearWeatherAvailableDataSetsCacheOnNextLaunch.getter()
{
  return static Settings.Daemon.clearWeatherAvailableDataSetsCacheOnNextLaunch.getter();
}

uint64_t static Settings.Daemon.fetchesWeatherData.getter()
{
  return static Settings.Daemon.fetchesWeatherData.getter();
}

uint64_t static Settings.Daemon.useDemoWeatherData.getter()
{
  return static Settings.Daemon.useDemoWeatherData.getter();
}

uint64_t static Settings.Daemon.disableCaching.getter()
{
  return static Settings.Daemon.disableCaching.getter();
}

uint64_t static Settings.Daemon.enableFlatbuffers.getter()
{
  return static Settings.Daemon.enableFlatbuffers.getter();
}

uint64_t static Settings.Daemon.disableStatisticsCaching.getter()
{
  return static Settings.Daemon.disableStatisticsCaching.getter();
}

uint64_t static Settings.Daemon.enableStatisticsFlatbuffers.getter()
{
  return static Settings.Daemon.enableStatisticsFlatbuffers.getter();
}

uint64_t static Settings.Daemon.forceQAAndNoAuthOnSimulator.getter()
{
  return static Settings.Daemon.forceQAAndNoAuthOnSimulator.getter();
}

uint64_t static Settings.Daemon.treatmentIdentifierOverrides.getter()
{
  return static Settings.Daemon.treatmentIdentifierOverrides.getter();
}

uint64_t static Settings.Daemon.enablePushLocationViewLoadData.getter()
{
  return static Settings.Daemon.enablePushLocationViewLoadData.getter();
}

uint64_t static Settings.Daemon.clearAQIScalesCacheOnNextLaunch.getter()
{
  return static Settings.Daemon.clearAQIScalesCacheOnNextLaunch.getter();
}

uint64_t static Settings.Daemon.clearCachedJWTTokenOnNextLaunch.getter()
{
  return static Settings.Daemon.clearCachedJWTTokenOnNextLaunch.getter();
}

uint64_t static Settings.Daemon.disableAvailableDataSetsCaching.getter()
{
  return static Settings.Daemon.disableAvailableDataSetsCaching.getter();
}

uint64_t static Settings.Daemon.mangleCachedJWTTokenOnNextLaunch.getter()
{
  return static Settings.Daemon.mangleCachedJWTTokenOnNextLaunch.getter();
}

uint64_t static Settings.Daemon.enableSendFlatbufferSchemaVersion.getter()
{
  return static Settings.Daemon.enableSendFlatbufferSchemaVersion.getter();
}

uint64_t static Settings.Daemon.clearDailySummaryCacheOnNextLaunch.getter()
{
  return static Settings.Daemon.clearDailySummaryCacheOnNextLaunch.getter();
}

uint64_t static Settings.Daemon.clearDailyStatisticsCacheOnNextLaunch.getter()
{
  return static Settings.Daemon.clearDailyStatisticsCacheOnNextLaunch.getter();
}

uint64_t static Settings.Daemon.clearHourlyStatisticsCacheOnNextLaunch.getter()
{
  return static Settings.Daemon.clearHourlyStatisticsCacheOnNextLaunch.getter();
}

uint64_t static Settings.Daemon.clearMonthlyStatisticsCacheOnNextLaunch.getter()
{
  return static Settings.Daemon.clearMonthlyStatisticsCacheOnNextLaunch.getter();
}

uint64_t static Settings.WeatherAnalytics.Geocode.samplingRate.getter()
{
  return static Settings.WeatherAnalytics.Geocode.samplingRate.getter();
}

uint64_t static Settings.WeatherAnalytics.Location.samplingRate.getter()
{
  return static Settings.WeatherAnalytics.Location.samplingRate.getter();
}

uint64_t static Settings.WeatherAnalytics.Debugging.disableWidgetAnalytics.getter()
{
  return static Settings.WeatherAnalytics.Debugging.disableWidgetAnalytics.getter();
}

uint64_t static Settings.WeatherAnalytics.Debugging.batchDebugging.getter()
{
  return static Settings.WeatherAnalytics.Debugging.batchDebugging.getter();
}

uint64_t static Settings.WeatherAnalytics.Debugging.disableAnalytics.getter()
{
  return static Settings.WeatherAnalytics.Debugging.disableAnalytics.getter();
}

uint64_t static Settings.WeatherAnalytics.Debugging.sessionName.getter()
{
  return static Settings.WeatherAnalytics.Debugging.sessionName.getter();
}

uint64_t static Settings.WeatherAnalytics.Debugging.forceSendCDNServer.getter()
{
  return static Settings.WeatherAnalytics.Debugging.forceSendCDNServer.getter();
}

uint64_t static Settings.WeatherAnalytics.Debugging.maxUploadRetryCount.getter()
{
  return static Settings.WeatherAnalytics.Debugging.maxUploadRetryCount.getter();
}

uint64_t static Settings.WeatherAnalytics.Debugging.sendAppSessionStartAndEventsForNonDnuUsers.getter()
{
  return static Settings.WeatherAnalytics.Debugging.sendAppSessionStartAndEventsForNonDnuUsers.getter();
}

uint64_t static Settings.WeatherAnalytics.Debugging.batchSize.getter()
{
  return static Settings.WeatherAnalytics.Debugging.batchSize.getter();
}

uint64_t static Settings.WeatherAnalytics.Telemetry.bypassSampling.getter()
{
  return static Settings.WeatherAnalytics.Telemetry.bypassSampling.getter();
}

uint64_t static Settings.WeatherAlert.forceAlertToLowProminence.getter()
{
  return static Settings.WeatherAlert.forceAlertToLowProminence.getter();
}

uint64_t static Settings.WeatherAlert.forceAlertToHighProminence.getter()
{
  return static Settings.WeatherAlert.forceAlertToHighProminence.getter();
}

uint64_t static Settings.VFX.moonEnabled.getter()
{
  return static Settings.VFX.moonEnabled.getter();
}

uint64_t static Settings.VFX.foregroundEffects.getter()
{
  return static Settings.VFX.foregroundEffects.getter();
}

uint64_t type metadata accessor for Settings.VFX.AnimatedBackgrounds.AnimationKind()
{
  return type metadata accessor for Settings.VFX.AnimatedBackgrounds.AnimationKind();
}

uint64_t Settings.VFX.AnimatedBackgrounds.listAnimationKind.getter()
{
  return Settings.VFX.AnimatedBackgrounds.listAnimationKind.getter();
}

uint64_t Settings.VFX.AnimatedBackgrounds.locationAnimationKind.getter()
{
  return Settings.VFX.AnimatedBackgrounds.locationAnimationKind.getter();
}

uint64_t static Settings.VFX.animatedBackgrounds.getter()
{
  return static Settings.VFX.animatedBackgrounds.getter();
}

uint64_t static Settings.VFX.listVfxCellsEnabled.getter()
{
  return static Settings.VFX.listVfxCellsEnabled.getter();
}

uint64_t static Settings.VFX.vfxCollisionEnabled.getter()
{
  return static Settings.VFX.vfxCollisionEnabled.getter();
}

uint64_t static Settings.VFX.overrideConditionBackground.getter()
{
  return static Settings.VFX.overrideConditionBackground.getter();
}

uint64_t static Settings.VFX.allListVfxBackgroundsEnabled.getter()
{
  return static Settings.VFX.allListVfxBackgroundsEnabled.getter();
}

uint64_t static Settings.VFX.overrideConditionBackgroundDate.getter()
{
  return static Settings.VFX.overrideConditionBackgroundDate.getter();
}

uint64_t type metadata accessor for PresetItem()
{
  return type metadata accessor for PresetItem();
}

uint64_t PresetItem.init(_:label:actions:)()
{
  return PresetItem.init(_:label:actions:)();
}

uint64_t type metadata accessor for FeatureFlag()
{
  return type metadata accessor for FeatureFlag();
}

uint64_t FeatureFlag.init(_:label:invertValue:)()
{
  return FeatureFlag.init(_:label:invertValue:)();
}

uint64_t FeatureFlag.init<A>(_:label:isEnabled:setEnabled:)()
{
  return FeatureFlag.init<A>(_:label:isEnabled:setEnabled:)();
}

uint64_t FeatureFlag.init(_:label:)()
{
  return FeatureFlag.init(_:label:)();
}

uint64_t dispatch thunk of Configurable.setting<A>(_:)()
{
  return dispatch thunk of Configurable.setting<A>(_:)();
}

uint64_t Configurable.setting<A>(_:)()
{
  return Configurable.setting<A>(_:)();
}

uint64_t FeatureFlags.enableAllItem(title:)()
{
  return FeatureFlags.enableAllItem(title:)();
}

uint64_t FeatureFlags.items.getter()
{
  return FeatureFlags.items.getter();
}

uint64_t type metadata accessor for FeatureFlags()
{
  return type metadata accessor for FeatureFlags();
}

uint64_t FeatureFlags.init(_:)()
{
  return FeatureFlags.init(_:)();
}

uint64_t type metadata accessor for FeatureState()
{
  return type metadata accessor for FeatureState();
}

uint64_t dispatch thunk of SettingGroup.setEnabled(_:)()
{
  return dispatch thunk of SettingGroup.setEnabled(_:)();
}

uint64_t SettingGroup.init(key:defaultValue:access:)()
{
  return SettingGroup.init(key:defaultValue:access:)();
}

uint64_t dispatch thunk of SettingGroup.isEnabled.getter()
{
  return dispatch thunk of SettingGroup.isEnabled.getter();
}

uint64_t SettingGroup.deinit()
{
  return SettingGroup.deinit();
}

uint64_t type metadata accessor for SettingAction.PostInstruction()
{
  return type metadata accessor for SettingAction.PostInstruction();
}

uint64_t dispatch thunk of SettingAction.then(_:)()
{
  return dispatch thunk of SettingAction.then(_:)();
}

uint64_t type metadata accessor for SettingAction()
{
  return type metadata accessor for SettingAction();
}

uint64_t SettingAction.init(_:_:)()
{
  return SettingAction.init(_:_:)();
}

uint64_t SettingReader.read<A>(_:)()
{
  return SettingReader.read<A>(_:)();
}

uint64_t static SettingReader.shared.getter()
{
  return static SettingReader.shared.getter();
}

uint64_t SettingReader.isEnabled(_:with:)()
{
  return SettingReader.isEnabled(_:with:)();
}

uint64_t type metadata accessor for SettingReader()
{
  return type metadata accessor for SettingReader();
}

uint64_t type metadata accessor for ChangeBehavior()
{
  return type metadata accessor for ChangeBehavior();
}

uint64_t static SettingActions.restart.getter()
{
  return static SettingActions.restart.getter();
}

uint64_t SettingProperty.wrappedValue.getter()
{
  return SettingProperty.wrappedValue.getter();
}

uint64_t SettingProperty.wrappedValue.setter()
{
  return SettingProperty.wrappedValue.setter();
}

uint64_t SettingProperty.init(_:)()
{
  return SettingProperty.init(_:)();
}

uint64_t type metadata accessor for SettingCellStyle.ButtonStyle()
{
  return type metadata accessor for SettingCellStyle.ButtonStyle();
}

uint64_t type metadata accessor for SettingCellStyle()
{
  return type metadata accessor for SettingCellStyle();
}

uint64_t dispatch thunk of PresetApplicatorType.set<A>(_:to:)()
{
  return dispatch thunk of PresetApplicatorType.set<A>(_:to:)();
}

uint64_t Item<>.init(_:label:resetBehavior:type:)()
{
  return Item<>.init(_:label:resetBehavior:type:)();
}

uint64_t Item<>.init(_:label:resetBehavior:actions:)()
{
  return Item<>.init(_:label:resetBehavior:actions:)();
}

{
  return Item<>.init(_:label:resetBehavior:actions:)();
}

uint64_t Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)()
{
  return Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)();
}

uint64_t Page.init(title:_:)()
{
  return Page.init(title:_:)();
}

uint64_t Group.init(title:footer:group:_:)()
{
  return Group.init(title:footer:group:_:)();
}

uint64_t Group.init(title:footer:_:)()
{
  return Group.init(title:footer:_:)();
}

uint64_t type metadata accessor for Group()
{
  return type metadata accessor for Group();
}

{
  return type metadata accessor for Group();
}

uint64_t type metadata accessor for Access()
{
  return type metadata accessor for Access();
}

uint64_t static Domain.weatherInternal.getter()
{
  return static Domain.weatherInternal.getter();
}

uint64_t type metadata accessor for Domain()
{
  return type metadata accessor for Domain();
}

uint64_t Option.init(label:value:description:)()
{
  return Option.init(label:value:description:)();
}

uint64_t Preset.init(extends:apply:)()
{
  return Preset.init(extends:apply:)();
}

uint64_t type metadata accessor for Preset()
{
  return type metadata accessor for Preset();
}

uint64_t Setting<>.init(_:defaultValue:domain:access:options:)()
{
  return Setting<>.init(_:defaultValue:domain:access:options:)();
}

uint64_t Setting<>.init(_:defaultValue:access:)()
{
  return Setting<>.init(_:defaultValue:access:)();
}

uint64_t Setting<>.init(_:defaultValue:domain:access:)()
{
  return Setting<>.init(_:defaultValue:domain:access:)();
}

uint64_t Setting<>.init(_:defaultValue:min:max:access:)()
{
  return Setting<>.init(_:defaultValue:min:max:access:)();
}

uint64_t Setting.init(_:defaultValue:domain:access:)()
{
  return Setting.init(_:defaultValue:domain:access:)();
}

uint64_t AppGroup.containerURL.getter()
{
  return AppGroup.containerURL.getter();
}

uint64_t static AppGroup.weather.getter()
{
  return static AppGroup.weather.getter();
}

uint64_t type metadata accessor for AppGroup()
{
  return type metadata accessor for AppGroup();
}

uint64_t Groupable.isVisible.getter()
{
  return Groupable.isVisible.getter();
}

uint64_t ResetItem.init(layout:)()
{
  return ResetItem.init(layout:)();
}

uint64_t type metadata accessor for ResetItem()
{
  return type metadata accessor for ResetItem();
}

uint64_t dispatch thunk of Updatable.save<A>(setting:value:)()
{
  return dispatch thunk of Updatable.save<A>(setting:value:)();
}

uint64_t dispatch thunk of Updatable.apply(preset:)()
{
  return dispatch thunk of Updatable.apply(preset:)();
}

uint64_t Updatable.save<A>(setting:value:)()
{
  return Updatable.save<A>(setting:value:)();
}

uint64_t Updatable.apply(preset:)()
{
  return Updatable.apply(preset:)();
}

uint64_t dispatch thunk of AutomationWeatherDataManagerType.setupStubData()()
{
  return dispatch thunk of AutomationWeatherDataManagerType.setupStubData()();
}

uint64_t ReportWeatherConfiguration.onlineFeedbackURL.getter()
{
  return ReportWeatherConfiguration.onlineFeedbackURL.getter();
}

uint64_t type metadata accessor for ReportWeatherConfiguration()
{
  return type metadata accessor for ReportWeatherConfiguration();
}

uint64_t type metadata accessor for WeatherIntentType()
{
  return type metadata accessor for WeatherIntentType();
}

uint64_t WeatherAlertEntity.boundingBox.getter()
{
  return WeatherAlertEntity.boundingBox.getter();
}

uint64_t WeatherAlertEntity.alertIdentifier.getter()
{
  return WeatherAlertEntity.alertIdentifier.getter();
}

uint64_t WeatherAlertEntity.channelIdentifier.getter()
{
  return WeatherAlertEntity.channelIdentifier.getter();
}

uint64_t WeatherAlertEntity.id.getter()
{
  return WeatherAlertEntity.id.getter();
}

uint64_t WeatherAlertEntity.created.getter()
{
  return WeatherAlertEntity.created.getter();
}

uint64_t type metadata accessor for WeatherAlertEntity()
{
  return type metadata accessor for WeatherAlertEntity();
}

uint64_t WeatherDataConfiguration.offlineDataFreshnessInterval.getter()
{
  return WeatherDataConfiguration.offlineDataFreshnessInterval.getter();
}

uint64_t WeatherDataConfiguration.intervalBetweenUpdates.getter()
{
  return WeatherDataConfiguration.intervalBetweenUpdates.getter();
}

uint64_t WeatherDataConfiguration.extendedRefreshHintInterval.getter()
{
  return WeatherDataConfiguration.extendedRefreshHintInterval.getter();
}

uint64_t WeatherDataConfiguration.currentLocationCertaintyRadius.getter()
{
  return WeatherDataConfiguration.currentLocationCertaintyRadius.getter();
}

uint64_t type metadata accessor for WeatherDataConfiguration()
{
  return type metadata accessor for WeatherDataConfiguration();
}

uint64_t dispatch thunk of WeatherIntentHandlerType.handleActivity(_:)()
{
  return dispatch thunk of WeatherIntentHandlerType.handleActivity(_:)();
}

uint64_t type metadata accessor for WeatherMenuConfiguration()
{
  return type metadata accessor for WeatherMenuConfiguration();
}

uint64_t WeatherCoalescedLocationResult.coalescedLocations.getter()
{
  return WeatherCoalescedLocationResult.coalescedLocations.getter();
}

uint64_t type metadata accessor for WeatherCoalescedLocationResult()
{
  return type metadata accessor for WeatherCoalescedLocationResult();
}

uint64_t type metadata accessor for WeatherMapOverlayServiceSource()
{
  return type metadata accessor for WeatherMapOverlayServiceSource();
}

uint64_t WeatherDataServiceConfiguration.needsTwilightData.getter()
{
  return WeatherDataServiceConfiguration.needsTwilightData.getter();
}

uint64_t type metadata accessor for WeatherDataServiceConfiguration()
{
  return type metadata accessor for WeatherDataServiceConfiguration();
}

uint64_t dispatch thunk of WeatherLocationCoalescenceManagerType.coalesceLocations(currentLocation:locationList:locationsOfInterest:displayContextByLocation:)()
{
  return dispatch thunk of WeatherLocationCoalescenceManagerType.coalesceLocations(currentLocation:locationList:locationsOfInterest:displayContextByLocation:)();
}

uint64_t dispatch thunk of WeatherLocationCoalescenceManagerType.coalesceLocations(currentLocation:locationList:locationsOfInterest:)()
{
  return dispatch thunk of WeatherLocationCoalescenceManagerType.coalesceLocations(currentLocation:locationList:locationsOfInterest:)();
}

uint64_t dispatch thunk of WeatherLocationCoalescenceManagerType.matchLocationsOfInterest(for:locationsOfInterest:)()
{
  return dispatch thunk of WeatherLocationCoalescenceManagerType.matchLocationsOfInterest(for:locationsOfInterest:)();
}

uint64_t type metadata accessor for SyncedData()
{
  return type metadata accessor for SyncedData();
}

uint64_t CountryCode.value.getter()
{
  return CountryCode.value.getter();
}

uint64_t SystemClock.init()()
{
  return SystemClock.init()();
}

uint64_t type metadata accessor for SystemClock()
{
  return type metadata accessor for SystemClock();
}

uint64_t UnitManager.preferredWindUnit.getter()
{
  return UnitManager.preferredWindUnit.getter();
}

uint64_t UnitManager.preferredDistanceUnit.getter()
{
  return UnitManager.preferredDistanceUnit.getter();
}

uint64_t UnitManager.preferredPressureUnit.getter()
{
  return UnitManager.preferredPressureUnit.getter();
}

uint64_t UnitManager.preferredTemperatureUnit.getter()
{
  return UnitManager.preferredTemperatureUnit.getter();
}

uint64_t UnitManager.setPreferredDistanceUnit(_:)()
{
  return UnitManager.setPreferredDistanceUnit(_:)();
}

uint64_t UnitManager.setPreferredPressureUnit(_:)()
{
  return UnitManager.setPreferredPressureUnit(_:)();
}

uint64_t UnitManager.setPreferredWindSpeedUnit(_:)()
{
  return UnitManager.setPreferredWindSpeedUnit(_:)();
}

uint64_t UnitManager.systemWideTemperatureUnit.getter()
{
  return UnitManager.systemWideTemperatureUnit.getter();
}

uint64_t UnitManager.preferredPrecipitationUnit.getter()
{
  return UnitManager.preferredPrecipitationUnit.getter();
}

uint64_t UnitManager.setPreferredTemperatureUnit(_:)()
{
  return UnitManager.setPreferredTemperatureUnit(_:)();
}

uint64_t UnitManager.setPreferredPrecipitationUnit(_:)()
{
  return UnitManager.setPreferredPrecipitationUnit(_:)();
}

uint64_t UnitManager.conditionUnits(locale:)()
{
  return UnitManager.conditionUnits(locale:)();
}

uint64_t UnitManager.visibility.getter()
{
  return UnitManager.visibility.getter();
}

uint64_t UnitManager.temperature.getter()
{
  return UnitManager.temperature.getter();
}

uint64_t static UnitManager.Notification.didUpdateUnits.getter()
{
  return static UnitManager.Notification.didUpdateUnits.getter();
}

uint64_t UnitManager.hasPreferredUnits.getter()
{
  return UnitManager.hasPreferredUnits.getter();
}

Swift::Void __swiftcall UnitManager.resetPreferredUnits()()
{
}

uint64_t UnitManager.precipitationRainfall.getter()
{
  return UnitManager.precipitationRainfall.getter();
}

uint64_t UnitManager.availableDistanceUnits.getter()
{
  return UnitManager.availableDistanceUnits.getter();
}

uint64_t UnitManager.availablePressureUnits.getter()
{
  return UnitManager.availablePressureUnits.getter();
}

uint64_t UnitManager.availableWindSpeedUnits.getter()
{
  return UnitManager.availableWindSpeedUnits.getter();
}

Swift::Void __swiftcall UnitManager.refreshUnitsFromStorage()()
{
}

uint64_t UnitManager.availableTemperatureUnits.getter()
{
  return UnitManager.availableTemperatureUnits.getter();
}

uint64_t UnitManager.availablePrecipitationUnits.getter()
{
  return UnitManager.availablePrecipitationUnits.getter();
}

uint64_t UnitManager.pressure.getter()
{
  return UnitManager.pressure.getter();
}

uint64_t static UnitManager.standard.getter()
{
  return static UnitManager.standard.getter();
}

uint64_t UnitManager.windGust.getter()
{
  return UnitManager.windGust.getter();
}

uint64_t UnitManager.windSpeed.getter()
{
  return UnitManager.windSpeed.getter();
}

uint64_t type metadata accessor for UnitManager()
{
  return type metadata accessor for UnitManager();
}

uint64_t static GeocodeStore.location.getter()
{
  return static GeocodeStore.location.getter();
}

uint64_t UnitDefaults.visibility.getter()
{
  return UnitDefaults.visibility.getter();
}

uint64_t UnitDefaults.temperature.getter()
{
  return UnitDefaults.temperature.getter();
}

uint64_t UnitDefaults.precipitationRainfall.getter()
{
  return UnitDefaults.precipitationRainfall.getter();
}

uint64_t UnitDefaults.precipitationSnowfall.getter()
{
  return UnitDefaults.precipitationSnowfall.getter();
}

uint64_t UnitDefaults.init(locale:)()
{
  return UnitDefaults.init(locale:)();
}

uint64_t UnitDefaults.pressure.getter()
{
  return UnitDefaults.pressure.getter();
}

uint64_t UnitDefaults.windGust.getter()
{
  return UnitDefaults.windGust.getter();
}

uint64_t UnitDefaults.windSpeed.getter()
{
  return UnitDefaults.windSpeed.getter();
}

uint64_t type metadata accessor for UnitDefaults()
{
  return type metadata accessor for UnitDefaults();
}

uint64_t UserIdentity.reportWeatherIdentifier.getter()
{
  return UserIdentity.reportWeatherIdentifier.getter();
}

uint64_t UserIdentity.identifier.getter()
{
  return UserIdentity.identifier.getter();
}

uint64_t UserIdentity.privateIdentifier.getter()
{
  return UserIdentity.privateIdentifier.getter();
}

uint64_t UserIdentity.startDate.getter()
{
  return UserIdentity.startDate.getter();
}

uint64_t type metadata accessor for UserIdentity()
{
  return type metadata accessor for UserIdentity();
}

uint64_t LocationModel.coalesceLocation.getter()
{
  return LocationModel.coalesceLocation.getter();
}

uint64_t LocationModel.coalesceLocationIdentifier.getter()
{
  return LocationModel.coalesceLocationIdentifier.getter();
}

uint64_t LocationModel.coalesceLocationID.getter()
{
  return LocationModel.coalesceLocationID.getter();
}

uint64_t LocationModel.coordinate.getter()
{
  return LocationModel.coordinate.getter();
}

uint64_t LocationModel.identifier.getter()
{
  return LocationModel.identifier.getter();
}

uint64_t LocationModel.locationOfInterest.getter()
{
  return LocationModel.locationOfInterest.getter();
}

uint64_t static LocationModel.== infix(_:_:)()
{
  return static LocationModel.== infix(_:_:)();
}

uint64_t LocationModel.id.getter()
{
  return LocationModel.id.getter();
}

uint64_t LocationModel.kind.getter()
{
  return LocationModel.kind.getter();
}

uint64_t LocationModel.name.getter()
{
  return LocationModel.name.getter();
}

uint64_t LocationModel.init(location:locationOfInterest:)()
{
  return LocationModel.init(location:locationOfInterest:)();
}

uint64_t LocationModel.location.getter()
{
  return LocationModel.location.getter();
}

uint64_t LocationModel.timeZone.getter()
{
  return LocationModel.timeZone.getter();
}

uint64_t type metadata accessor for LocationModel()
{
  return type metadata accessor for LocationModel();
}

uint64_t SavedLocation.identifier.getter()
{
  return SavedLocation.identifier.getter();
}

uint64_t SavedLocation.Placeholder.init(identifier:searchTitle:searchSubtitle:)()
{
  return SavedLocation.Placeholder.init(identifier:searchTitle:searchSubtitle:)();
}

uint64_t SavedLocation.Placeholder.identifier.getter()
{
  return SavedLocation.Placeholder.identifier.getter();
}

uint64_t SavedLocation.Placeholder.searchTitle.getter()
{
  return SavedLocation.Placeholder.searchTitle.getter();
}

uint64_t SavedLocation.Placeholder.searchSubtitle.getter()
{
  return SavedLocation.Placeholder.searchSubtitle.getter();
}

uint64_t type metadata accessor for SavedLocation.Placeholder()
{
  return type metadata accessor for SavedLocation.Placeholder();
}

uint64_t static SavedLocation.areListsEqual(_:_:)()
{
  return static SavedLocation.areListsEqual(_:_:)();
}

uint64_t static SavedLocation.== infix(_:_:)()
{
  return static SavedLocation.== infix(_:_:)();
}

uint64_t SavedLocation.id.getter()
{
  return SavedLocation.id.getter();
}

uint64_t SavedLocation.name.getter()
{
  return SavedLocation.name.getter();
}

uint64_t SavedLocation.location.getter()
{
  return SavedLocation.location.getter();
}

uint64_t type metadata accessor for SavedLocation()
{
  return type metadata accessor for SavedLocation();
}

uint64_t static ConfiguredUnit.== infix(_:_:)()
{
  return static ConfiguredUnit.== infix(_:_:)();
}

uint64_t type metadata accessor for ConfiguredUnit()
{
  return type metadata accessor for ConfiguredUnit();
}

uint64_t static LocationEntity.makeFromLocation(_:name:)()
{
  return static LocationEntity.makeFromLocation(_:name:)();
}

uint64_t static LocationEntity.== infix(_:_:)()
{
  return static LocationEntity.== infix(_:_:)();
}

uint64_t LocationEntity.id.getter()
{
  return LocationEntity.id.getter();
}

uint64_t LocationEntity.name.getter()
{
  return LocationEntity.name.getter();
}

uint64_t LocationEntity.placemark.getter()
{
  return LocationEntity.placemark.getter();
}

uint64_t type metadata accessor for LocationEntity()
{
  return type metadata accessor for LocationEntity();
}

uint64_t CurrentLocation.coordinate.getter()
{
  return CurrentLocation.coordinate.getter();
}

uint64_t CurrentLocation.identifier.getter()
{
  return CurrentLocation.identifier.getter();
}

uint64_t static CurrentLocation.placeholderIdentifier.getter()
{
  return static CurrentLocation.placeholderIdentifier.getter();
}

uint64_t static CurrentLocation.== infix(_:_:)()
{
  return static CurrentLocation.== infix(_:_:)();
}

uint64_t CurrentLocation.id.getter()
{
  return CurrentLocation.id.getter();
}

uint64_t CurrentLocation.name.getter()
{
  return CurrentLocation.name.getter();
}

uint64_t CurrentLocation.location.getter()
{
  return CurrentLocation.location.getter();
}

uint64_t type metadata accessor for CurrentLocation()
{
  return type metadata accessor for CurrentLocation();
}

uint64_t static MapsExperiments.isPinnedMapEnabledOnIpad.getter()
{
  return static MapsExperiments.isPinnedMapEnabledOnIpad.getter();
}

uint64_t type metadata accessor for MapsExperiments()
{
  return type metadata accessor for MapsExperiments();
}

uint64_t dispatch thunk of UnitManagerType.precipitationRainfall.getter()
{
  return dispatch thunk of UnitManagerType.precipitationRainfall.getter();
}

uint64_t ActiveUserStatus.isFirstLaunchOfDay(now:)()
{
  return ActiveUserStatus.isFirstLaunchOfDay(now:)();
}

uint64_t ActiveUserStatus.isFirstLaunchOfMonth(now:)()
{
  return ActiveUserStatus.isFirstLaunchOfMonth(now:)();
}

uint64_t ActiveUserStatus.secretId.getter()
{
  return ActiveUserStatus.secretId.getter();
}

uint64_t type metadata accessor for ActiveUserStatus()
{
  return type metadata accessor for ActiveUserStatus();
}

uint64_t AppConfiguration.reportWeather.getter()
{
  return AppConfiguration.reportWeather.getter();
}

uint64_t AppConfiguration.locationsConfiguration.getter()
{
  return AppConfiguration.locationsConfiguration.getter();
}

uint64_t AppConfiguration.weatherData.getter()
{
  return AppConfiguration.weatherData.getter();
}

uint64_t AppConfiguration.treatmentIDs.getter()
{
  return AppConfiguration.treatmentIDs.getter();
}

uint64_t AppConfiguration.init(lastRefreshed:appConfigRefreshTimeInterval:locationDecimalPrecision:reverseGeocodingRefreshTimeInterval:appStoreReview:endpoints:features:geocode:historicalFacts:locationsConfiguration:maps:namedNetworkConfigurations:network:news:notifications:privacy:widgetPrivacy:providerAttribution:reportWeather:temperatureScale:unitConfiguration:weatherData:weatherDataService:weatherMenu:widget:languageConfigs:fallbackLanguage:treatmentIDs:segmentSetIDs:)()
{
  return AppConfiguration.init(lastRefreshed:appConfigRefreshTimeInterval:locationDecimalPrecision:reverseGeocodingRefreshTimeInterval:appStoreReview:endpoints:features:geocode:historicalFacts:locationsConfiguration:maps:namedNetworkConfigurations:network:news:notifications:privacy:widgetPrivacy:providerAttribution:reportWeather:temperatureScale:unitConfiguration:weatherData:weatherDataService:weatherMenu:widget:languageConfigs:fallbackLanguage:treatmentIDs:segmentSetIDs:)();
}

uint64_t AppConfiguration.notifications.getter()
{
  return AppConfiguration.notifications.getter();
}

uint64_t AppConfiguration.segmentSetIDs.getter()
{
  return AppConfiguration.segmentSetIDs.getter();
}

uint64_t AppConfiguration.appStoreReview.getter()
{
  return AppConfiguration.appStoreReview.getter();
}

uint64_t AppConfiguration.endpointConfig(for:)()
{
  return AppConfiguration.endpointConfig(for:)();
}

uint64_t AppConfiguration.temperatureScale.getter()
{
  return AppConfiguration.temperatureScale.getter();
}

uint64_t AppConfiguration.weatherDataService.getter()
{
  return AppConfiguration.weatherDataService.getter();
}

uint64_t AppConfiguration.providerAttribution.getter()
{
  return AppConfiguration.providerAttribution.getter();
}

uint64_t AppConfiguration.locationDecimalPrecision.getter()
{
  return AppConfiguration.locationDecimalPrecision.getter();
}

uint64_t static AppConfiguration.== infix(_:_:)()
{
  return static AppConfiguration.== infix(_:_:)();
}

uint64_t AppConfiguration.reverseGeocodingRefreshTimeInterval.getter()
{
  return AppConfiguration.reverseGeocodingRefreshTimeInterval.getter();
}

uint64_t AppConfiguration.maps.getter()
{
  return AppConfiguration.maps.getter();
}

uint64_t AppConfiguration.news.getter()
{
  return AppConfiguration.news.getter();
}

uint64_t static AppConfiguration.read(from:)()
{
  return static AppConfiguration.read(from:)();
}

uint64_t AppConfiguration.write(to:)()
{
  return AppConfiguration.write(to:)();
}

uint64_t AppConfiguration.widget.getter()
{
  return AppConfiguration.widget.getter();
}

uint64_t AppConfiguration.privacy.getter()
{
  return AppConfiguration.privacy.getter();
}

uint64_t type metadata accessor for AppConfiguration()
{
  return type metadata accessor for AppConfiguration();
}

uint64_t dispatch thunk of GeocodeStoreType.saveLocation(_:for:)()
{
  return dispatch thunk of GeocodeStoreType.saveLocation(_:for:)();
}

uint64_t dispatch thunk of GeocodeStoreType.queryLocation(for:)()
{
  return dispatch thunk of GeocodeStoreType.queryLocation(for:)();
}

uint64_t dispatch thunk of GeocodeStoreType.deleteLocation(for:)()
{
  return dispatch thunk of GeocodeStoreType.deleteLocation(for:)();
}

uint64_t dispatch thunk of GeocodeStoreType.deleteAllLocations(satisfying:)()
{
  return dispatch thunk of GeocodeStoreType.deleteAllLocations(satisfying:)();
}

uint64_t MapsConfiguration.windOverlayEnabled.getter()
{
  return MapsConfiguration.windOverlayEnabled.getter();
}

uint64_t type metadata accessor for MapsConfiguration.OverlayKind()
{
  return type metadata accessor for MapsConfiguration.OverlayKind();
}

uint64_t MapsConfiguration.enableExitOvlInfo.getter()
{
  return MapsConfiguration.enableExitOvlInfo.getter();
}

uint64_t MapsConfiguration.defaultOverlayKind.getter()
{
  return MapsConfiguration.defaultOverlayKind.getter();
}

uint64_t type metadata accessor for MapsConfiguration()
{
  return type metadata accessor for MapsConfiguration();
}

uint64_t type metadata accessor for NewsConfiguration.SeverePlacement()
{
  return type metadata accessor for NewsConfiguration.SeverePlacement();
}

uint64_t NewsConfiguration.severePlacement.getter()
{
  return NewsConfiguration.severePlacement.getter();
}

uint64_t type metadata accessor for NewsConfiguration.TrendingPlacement()
{
  return type metadata accessor for NewsConfiguration.TrendingPlacement();
}

uint64_t NewsConfiguration.trendingPlacement.getter()
{
  return NewsConfiguration.trendingPlacement.getter();
}

uint64_t NewsConfiguration.enabled.getter()
{
  return NewsConfiguration.enabled.getter();
}

uint64_t type metadata accessor for NewsConfiguration()
{
  return type metadata accessor for NewsConfiguration();
}

uint64_t NotificationStore.subscriptions.getter()
{
  return NotificationStore.subscriptions.getter();
}

uint64_t NotificationStore.weatherAlerts.getter()
{
  return NotificationStore.weatherAlerts.getter();
}

uint64_t NotificationStore.fetchSchedules.getter()
{
  return NotificationStore.fetchSchedules.getter();
}

uint64_t NotificationStore.incomingMessages.getter()
{
  return NotificationStore.incomingMessages.getter();
}

uint64_t NotificationStore.deliverySchedules.getter()
{
  return NotificationStore.deliverySchedules.getter();
}

uint64_t NotificationStore.severeNotifications.getter()
{
  return NotificationStore.severeNotifications.getter();
}

uint64_t static NotificationStore.location.getter()
{
  return static NotificationStore.location.getter();
}

uint64_t type metadata accessor for NotificationStore()
{
  return type metadata accessor for NotificationStore();
}

uint64_t UnitConfiguration.Temperature.asUnit.getter()
{
  return UnitConfiguration.Temperature.asUnit.getter();
}

uint64_t UnitConfiguration.Temperature.description.getter()
{
  return UnitConfiguration.Temperature.description.getter();
}

uint64_t UnitConfiguration.Temperature.symbol.getter()
{
  return UnitConfiguration.Temperature.symbol.getter();
}

uint64_t type metadata accessor for UnitConfiguration.Temperature()
{
  return type metadata accessor for UnitConfiguration.Temperature();
}

uint64_t UnitConfiguration.Precipitation.asUnit.getter()
{
  return UnitConfiguration.Precipitation.asUnit.getter();
}

uint64_t UnitConfiguration.Precipitation.description.getter()
{
  return UnitConfiguration.Precipitation.description.getter();
}

uint64_t UnitConfiguration.Precipitation.symbol.getter()
{
  return UnitConfiguration.Precipitation.symbol.getter();
}

uint64_t type metadata accessor for UnitConfiguration.Precipitation()
{
  return type metadata accessor for UnitConfiguration.Precipitation();
}

uint64_t UnitConfiguration.Precipitation.init(_:)()
{
  return UnitConfiguration.Precipitation.init(_:)();
}

uint64_t UnitConfiguration.Distance.asUnit.getter()
{
  return UnitConfiguration.Distance.asUnit.getter();
}

uint64_t UnitConfiguration.Distance.description.getter()
{
  return UnitConfiguration.Distance.description.getter();
}

uint64_t UnitConfiguration.Distance.symbol.getter()
{
  return UnitConfiguration.Distance.symbol.getter();
}

uint64_t type metadata accessor for UnitConfiguration.Distance()
{
  return type metadata accessor for UnitConfiguration.Distance();
}

uint64_t UnitConfiguration.Distance.init(_:)()
{
  return UnitConfiguration.Distance.init(_:)();
}

uint64_t UnitConfiguration.Pressure.asUnit.getter()
{
  return UnitConfiguration.Pressure.asUnit.getter();
}

uint64_t UnitConfiguration.Pressure.description.getter()
{
  return UnitConfiguration.Pressure.description.getter();
}

uint64_t UnitConfiguration.Pressure.symbol.getter()
{
  return UnitConfiguration.Pressure.symbol.getter();
}

uint64_t type metadata accessor for UnitConfiguration.Pressure()
{
  return type metadata accessor for UnitConfiguration.Pressure();
}

uint64_t UnitConfiguration.Pressure.init(_:)()
{
  return UnitConfiguration.Pressure.init(_:)();
}

uint64_t UnitConfiguration.WindSpeed.asUnit.getter()
{
  return UnitConfiguration.WindSpeed.asUnit.getter();
}

uint64_t UnitConfiguration.WindSpeed.description.getter()
{
  return UnitConfiguration.WindSpeed.description.getter();
}

uint64_t UnitConfiguration.WindSpeed.symbol.getter()
{
  return UnitConfiguration.WindSpeed.symbol.getter();
}

uint64_t type metadata accessor for UnitConfiguration.WindSpeed()
{
  return type metadata accessor for UnitConfiguration.WindSpeed();
}

uint64_t UnitConfiguration.WindSpeed.init(_:)()
{
  return UnitConfiguration.WindSpeed.init(_:)();
}

uint64_t type metadata accessor for UnitConfiguration()
{
  return type metadata accessor for UnitConfiguration();
}

uint64_t ContentEnvironment.description.getter()
{
  return ContentEnvironment.description.getter();
}

uint64_t dispatch thunk of GeocodeManagerType.reverseGeocode(coordinate:)()
{
  return dispatch thunk of GeocodeManagerType.reverseGeocode(coordinate:)();
}

uint64_t dispatch thunk of GeocodeManagerType.reverseGeocode(placeholder:ignoreTimeZoneExpiration:qos:)()
{
  return dispatch thunk of GeocodeManagerType.reverseGeocode(placeholder:ignoreTimeZoneExpiration:qos:)();
}

uint64_t dispatch thunk of GeocodeManagerType.reverseGeocode(location:forceUpdate:ignoreTimeZoneExpiration:qos:)()
{
  return dispatch thunk of GeocodeManagerType.reverseGeocode(location:forceUpdate:ignoreTimeZoneExpiration:qos:)();
}

uint64_t dispatch thunk of GeocodeManagerType.register(callbacks:)()
{
  return dispatch thunk of GeocodeManagerType.register(callbacks:)();
}

uint64_t GeocodeManagerType.reverseGeocode(placeholder:ignoreTimeZoneExpiration:)()
{
  return GeocodeManagerType.reverseGeocode(placeholder:ignoreTimeZoneExpiration:)();
}

uint64_t GeocodeManagerType.reverseGeocode(location:forceUpdate:ignoreTimeZoneExpiration:)()
{
  return GeocodeManagerType.reverseGeocode(location:forceUpdate:ignoreTimeZoneExpiration:)();
}

uint64_t LocationOfInterest.fullAddress.getter()
{
  return LocationOfInterest.fullAddress.getter();
}

uint64_t LocationOfInterest.shortAddress.getter()
{
  return LocationOfInterest.shortAddress.getter();
}

uint64_t LocationOfInterest.searchDisplayAddress.getter()
{
  return LocationOfInterest.searchDisplayAddress.getter();
}

uint64_t static LocationOfInterest.== infix(_:_:)()
{
  return static LocationOfInterest.== infix(_:_:)();
}

uint64_t static LocationOfInterest.read(from:)()
{
  return static LocationOfInterest.read(from:)();
}

uint64_t LocationOfInterest.type.getter()
{
  return LocationOfInterest.type.getter();
}

uint64_t LocationOfInterest.write(to:)()
{
  return LocationOfInterest.write(to:)();
}

uint64_t LocationOfInterest.location.getter()
{
  return LocationOfInterest.location.getter();
}

uint64_t LocationOfInterest.imageName.getter()
{
  return LocationOfInterest.imageName.getter();
}

uint64_t type metadata accessor for LocationOfInterest()
{
  return type metadata accessor for LocationOfInterest();
}

Swift::Bool __swiftcall PrivacySamplerType.canRecord(samplingRate:)(Swift::Float samplingRate)
{
  return PrivacySamplerType.canRecord(samplingRate:)(samplingRate);
}

uint64_t SubscriptionEntity.precipitation.getter()
{
  return SubscriptionEntity.precipitation.getter();
}

uint64_t SubscriptionEntity.id.getter()
{
  return SubscriptionEntity.id.getter();
}

uint64_t SubscriptionEntity.severe.getter()
{
  return SubscriptionEntity.severe.getter();
}

uint64_t SubscriptionEntity.created.getter()
{
  return SubscriptionEntity.created.getter();
}

uint64_t SubscriptionEntity.location.getter()
{
  return SubscriptionEntity.location.getter();
}

uint64_t SubscriptionEntity.modified.getter()
{
  return SubscriptionEntity.modified.getter();
}

uint64_t type metadata accessor for SubscriptionEntity()
{
  return type metadata accessor for SubscriptionEntity();
}

uint64_t UserIdentityChange.change.getter()
{
  return UserIdentityChange.change.getter();
}

uint64_t type metadata accessor for UserIdentityChange()
{
  return type metadata accessor for UserIdentityChange();
}

uint64_t FetchScheduleEntity.subscription.getter()
{
  return FetchScheduleEntity.subscription.getter();
}

uint64_t FetchScheduleEntity.id.getter()
{
  return FetchScheduleEntity.id.getter();
}

uint64_t FetchScheduleEntity.date.getter()
{
  return FetchScheduleEntity.date.getter();
}

uint64_t FetchScheduleEntity.valid.getter()
{
  return FetchScheduleEntity.valid.getter();
}

uint64_t FetchScheduleEntity.created.getter()
{
  return FetchScheduleEntity.created.getter();
}

uint64_t FetchScheduleEntity.modified.getter()
{
  return FetchScheduleEntity.modified.getter();
}

uint64_t type metadata accessor for FetchScheduleEntity()
{
  return type metadata accessor for FetchScheduleEntity();
}

uint64_t dispatch thunk of IdentityServiceType.addObserver(_:)()
{
  return dispatch thunk of IdentityServiceType.addObserver(_:)();
}

uint64_t dispatch thunk of IdentityServiceType.identity.getter()
{
  return dispatch thunk of IdentityServiceType.identity.getter();
}

uint64_t type metadata accessor for LocationDetailsKind()
{
  return type metadata accessor for LocationDetailsKind();
}

uint64_t static LocationIndexMapper.makeMapping(from:savedLocations:)()
{
  return static LocationIndexMapper.makeMapping(from:savedLocations:)();
}

uint64_t dispatch thunk of LocationManagerType.currentLocation.getter()
{
  return dispatch thunk of LocationManagerType.currentLocation.getter();
}

uint64_t dispatch thunk of LocationManagerType.addObserver(_:)()
{
  return dispatch thunk of LocationManagerType.addObserver(_:)();
}

uint64_t dispatch thunk of LocationManagerType.removeObserver(_:)()
{
  return dispatch thunk of LocationManagerType.removeObserver(_:)();
}

uint64_t dispatch thunk of LocationManagerType.limitsPrecision.getter()
{
  return dispatch thunk of LocationManagerType.limitsPrecision.getter();
}

uint64_t dispatch thunk of LocationManagerType.currentCLLocation.getter()
{
  return dispatch thunk of LocationManagerType.currentCLLocation.getter();
}

uint64_t dispatch thunk of LocationManagerType.requestAuthorization()()
{
  return dispatch thunk of LocationManagerType.requestAuthorization()();
}

uint64_t dispatch thunk of LocationManagerType.requestAlwaysAuthorization()()
{
  return dispatch thunk of LocationManagerType.requestAlwaysAuthorization()();
}

uint64_t WidgetConfiguration.timelineReloadDebouncingInterval.getter()
{
  return WidgetConfiguration.timelineReloadDebouncingInterval.getter();
}

uint64_t type metadata accessor for WidgetConfiguration()
{
  return type metadata accessor for WidgetConfiguration();
}

uint64_t type metadata accessor for GeocodeConfiguration()
{
  return type metadata accessor for GeocodeConfiguration();
}

uint64_t static LocationDetailEntity.== infix(_:_:)()
{
  return static LocationDetailEntity.== infix(_:_:)();
}

uint64_t LocationDetailEntity.init(location:date:kind:)()
{
  return LocationDetailEntity.init(location:date:kind:)();
}

uint64_t type metadata accessor for LocationDetailEntity()
{
  return type metadata accessor for LocationDetailEntity();
}

uint64_t type metadata accessor for NetworkConfiguration()
{
  return type metadata accessor for NetworkConfiguration();
}

uint64_t PrivacyConfiguration.reportWeatherEventSubmissionDrivenIdentifierResetCount.getter()
{
  return PrivacyConfiguration.reportWeatherEventSubmissionDrivenIdentifierResetCount.getter();
}

uint64_t PrivacyConfiguration.allowAppSessionEventForNonDNUUsers.getter()
{
  return PrivacyConfiguration.allowAppSessionEventForNonDNUUsers.getter();
}

uint64_t type metadata accessor for PrivacyConfiguration()
{
  return type metadata accessor for PrivacyConfiguration();
}

uint64_t dispatch thunk of UnitSetupManagerType.setupClient()()
{
  return dispatch thunk of UnitSetupManagerType.setupClient()();
}

uint64_t type metadata accessor for CachedCurrentLocation.EmbeddedLocation()
{
  return type metadata accessor for CachedCurrentLocation.EmbeddedLocation();
}

uint64_t CachedCurrentLocation.embeddedLocation.getter()
{
  return CachedCurrentLocation.embeddedLocation.getter();
}

uint64_t type metadata accessor for CachedCurrentLocation()
{
  return type metadata accessor for CachedCurrentLocation();
}

uint64_t EndpointConfiguration.useDynamicPortForWeatherData.getter()
{
  return EndpointConfiguration.useDynamicPortForWeatherData.getter();
}

uint64_t EndpointConfiguration.weatherDataURL.getter()
{
  return EndpointConfiguration.weatherDataURL.getter();
}

uint64_t type metadata accessor for EndpointConfiguration()
{
  return type metadata accessor for EndpointConfiguration();
}

uint64_t type metadata accessor for FeaturesConfiguration()
{
  return type metadata accessor for FeaturesConfiguration();
}

uint64_t IncomingMessageEntity.id.getter()
{
  return IncomingMessageEntity.id.getter();
}

uint64_t IncomingMessageEntity.date.getter()
{
  return IncomingMessageEntity.date.getter();
}

uint64_t IncomingMessageEntity.channel.getter()
{
  return IncomingMessageEntity.channel.getter();
}

uint64_t IncomingMessageEntity.userInfo.getter()
{
  return IncomingMessageEntity.userInfo.getter();
}

uint64_t IncomingMessageEntity.messageID.getter()
{
  return IncomingMessageEntity.messageID.getter();
}

uint64_t type metadata accessor for IncomingMessageEntity()
{
  return type metadata accessor for IncomingMessageEntity();
}

uint64_t static LocationMetadataStore.location.getter()
{
  return static LocationMetadataStore.location.getter();
}

uint64_t type metadata accessor for LocationMetadataStore()
{
  return type metadata accessor for LocationMetadataStore();
}

uint64_t static SavedLocationsManager.maxAllowedLocationsCount.getter()
{
  return static SavedLocationsManager.maxAllowedLocationsCount.getter();
}

uint64_t type metadata accessor for SavedLocationsManager()
{
  return type metadata accessor for SavedLocationsManager();
}

uint64_t dispatch thunk of SyncedDataManagerType.removeAll()()
{
  return dispatch thunk of SyncedDataManagerType.removeAll()();
}

uint64_t DeliveryScheduleEntity.notification.getter()
{
  return DeliveryScheduleEntity.notification.getter();
}

uint64_t DeliveryScheduleEntity.id.getter()
{
  return DeliveryScheduleEntity.id.getter();
}

uint64_t DeliveryScheduleEntity.date.getter()
{
  return DeliveryScheduleEntity.date.getter();
}

uint64_t DeliveryScheduleEntity.state.getter()
{
  return DeliveryScheduleEntity.state.getter();
}

uint64_t DeliveryScheduleEntity.created.getter()
{
  return DeliveryScheduleEntity.created.getter();
}

uint64_t DeliveryScheduleEntity.modified.getter()
{
  return DeliveryScheduleEntity.modified.getter();
}

uint64_t type metadata accessor for DeliveryScheduleEntity()
{
  return type metadata accessor for DeliveryScheduleEntity();
}

uint64_t LocationDisplayContext.init(canActAsLocationOfInterest:)()
{
  return LocationDisplayContext.init(canActAsLocationOfInterest:)();
}

uint64_t type metadata accessor for LocationDisplayContext()
{
  return type metadata accessor for LocationDisplayContext();
}

uint64_t static LocationOfInterestType.== infix(_:_:)()
{
  return static LocationOfInterestType.== infix(_:_:)();
}

uint64_t LocationOfInterestType.title.getter()
{
  return LocationOfInterestType.title.getter();
}

uint64_t type metadata accessor for LocationOfInterestType()
{
  return type metadata accessor for LocationOfInterestType();
}

uint64_t LocationsConfiguration.locationsOfInterestSupportURLiOS.getter()
{
  return LocationsConfiguration.locationsOfInterestSupportURLiOS.getter();
}

uint64_t LocationsConfiguration.shouldTrackComponentExposureEvents.getter()
{
  return LocationsConfiguration.shouldTrackComponentExposureEvents.getter();
}

uint64_t type metadata accessor for LocationsConfiguration()
{
  return type metadata accessor for LocationsConfiguration();
}

uint64_t static UserIdentityChangeKind.userIdentity.getter()
{
  return static UserIdentityChangeKind.userIdentity.getter();
}

uint64_t static UserIdentityChangeKind.privateUserIdentity.getter()
{
  return static UserIdentityChangeKind.privateUserIdentity.getter();
}

uint64_t type metadata accessor for UserIdentityChangeKind()
{
  return type metadata accessor for UserIdentityChangeKind();
}

uint64_t dispatch thunk of LocationMatchHelperType.isSameLocation(first:second:)()
{
  return dispatch thunk of LocationMatchHelperType.isSameLocation(first:second:)();
}

uint64_t dispatch thunk of LocationMatchHelperType.isSameLocation(firstName:secondName:distance:)()
{
  return dispatch thunk of LocationMatchHelperType.isSameLocation(firstName:secondName:distance:)();
}

uint64_t NotificationSubscription.precipitation.getter()
{
  return NotificationSubscription.precipitation.getter();
}

uint64_t NotificationSubscription.severeEnabled.getter()
{
  return NotificationSubscription.severeEnabled.getter();
}

uint64_t NotificationSubscription.precipitationEnabled.getter()
{
  return NotificationSubscription.precipitationEnabled.getter();
}

uint64_t NotificationSubscription.Kind.containsAny(_:)()
{
  return NotificationSubscription.Kind.containsAny(_:)();
}

uint64_t NotificationSubscription.Kind.description.getter()
{
  return NotificationSubscription.Kind.description.getter();
}

uint64_t NotificationSubscription.Kind.init(precipitation:severe:)()
{
  return NotificationSubscription.Kind.init(precipitation:severe:)();
}

uint64_t static NotificationSubscription.Kind.precipitation.getter()
{
  return static NotificationSubscription.Kind.precipitation.getter();
}

uint64_t static NotificationSubscription.Kind.all.getter()
{
  return static NotificationSubscription.Kind.all.getter();
}

uint64_t static NotificationSubscription.Kind.none.getter()
{
  return static NotificationSubscription.Kind.none.getter();
}

uint64_t static NotificationSubscription.Kind.severe.getter()
{
  return static NotificationSubscription.Kind.severe.getter();
}

uint64_t type metadata accessor for NotificationSubscription.Kind()
{
  return type metadata accessor for NotificationSubscription.Kind();
}

uint64_t NotificationSubscription.kind.getter()
{
  return NotificationSubscription.kind.getter();
}

uint64_t NotificationSubscription.severe.getter()
{
  return NotificationSubscription.severe.getter();
}

uint64_t NotificationSubscription.Location.locationOverride.getter()
{
  return NotificationSubscription.Location.locationOverride.getter();
}

uint64_t NotificationSubscription.Location.id.getter()
{
  return NotificationSubscription.Location.id.getter();
}

uint64_t NotificationSubscription.Location.kind.getter()
{
  return NotificationSubscription.Location.kind.getter();
}

uint64_t static NotificationSubscription.Location.current.getter()
{
  return static NotificationSubscription.Location.current.getter();
}

uint64_t NotificationSubscription.Location.init(location:locationOverride:)()
{
  return NotificationSubscription.Location.init(location:locationOverride:)();
}

uint64_t NotificationSubscription.Location.location.getter()
{
  return NotificationSubscription.Location.location.getter();
}

uint64_t type metadata accessor for NotificationSubscription.Location()
{
  return type metadata accessor for NotificationSubscription.Location();
}

uint64_t NotificationSubscription.Location.init(_:)()
{
  return NotificationSubscription.Location.init(_:)();
}

uint64_t NotificationSubscription.location.getter()
{
  return NotificationSubscription.location.getter();
}

uint64_t type metadata accessor for NotificationSubscription()
{
  return type metadata accessor for NotificationSubscription();
}

uint64_t SevereNotificationEntity.notification.getter()
{
  return SevereNotificationEntity.notification.getter();
}

uint64_t SevereNotificationEntity.subscription.getter()
{
  return SevereNotificationEntity.subscription.getter();
}

uint64_t SevereNotificationEntity.alertIdentifier.getter()
{
  return SevereNotificationEntity.alertIdentifier.getter();
}

uint64_t SevereNotificationEntity.id.getter()
{
  return SevereNotificationEntity.id.getter();
}

uint64_t SevereNotificationEntity.date.getter()
{
  return SevereNotificationEntity.date.getter();
}

uint64_t SevereNotificationEntity.alert.getter()
{
  return SevereNotificationEntity.alert.getter();
}

uint64_t type metadata accessor for SevereNotificationEntity()
{
  return type metadata accessor for SevereNotificationEntity();
}

uint64_t dispatch thunk of AppLaunchCountManagerType.appLaunchCount.getter()
{
  return dispatch thunk of AppLaunchCountManagerType.appLaunchCount.getter();
}

uint64_t dispatch thunk of AppLaunchCountManagerType.appLaunchCount.setter()
{
  return dispatch thunk of AppLaunchCountManagerType.appLaunchCount.setter();
}

uint64_t type metadata accessor for LocationManagerUpdateType()
{
  return type metadata accessor for LocationManagerUpdateType();
}

uint64_t PrecipitationNotification.identifier.getter()
{
  return PrecipitationNotification.identifier.getter();
}

uint64_t type metadata accessor for PrecipitationNotification.Kind()
{
  return type metadata accessor for PrecipitationNotification.Kind();
}

uint64_t PrecipitationNotification.date.getter()
{
  return PrecipitationNotification.date.getter();
}

uint64_t PrecipitationNotification.kind.getter()
{
  return PrecipitationNotification.kind.getter();
}

uint64_t PrecipitationNotification.forecast.getter()
{
  return PrecipitationNotification.forecast.getter();
}

uint64_t PrecipitationNotification.starting.getter()
{
  return PrecipitationNotification.starting.getter();
}

uint64_t PrecipitationNotification.stopping.getter()
{
  return PrecipitationNotification.stopping.getter();
}

uint64_t PrecipitationNotification.intensity.getter()
{
  return PrecipitationNotification.intensity.getter();
}

uint64_t type metadata accessor for PrecipitationNotification()
{
  return type metadata accessor for PrecipitationNotification();
}

uint64_t dispatch thunk of SavedLocationsManagerType.savedLocations.getter()
{
  return dispatch thunk of SavedLocationsManagerType.savedLocations.getter();
}

uint64_t dispatch thunk of SavedLocationsManagerType.updateSavedLocationTimeZones(_:)()
{
  return dispatch thunk of SavedLocationsManagerType.updateSavedLocationTimeZones(_:)();
}

uint64_t dispatch thunk of SavedLocationsManagerType.updatedSavedLocationsLegacy(_:)()
{
  return dispatch thunk of SavedLocationsManagerType.updatedSavedLocationsLegacy(_:)();
}

uint64_t dispatch thunk of SavedLocationsManagerType.dataStatus.getter()
{
  return dispatch thunk of SavedLocationsManagerType.dataStatus.getter();
}

uint64_t dispatch thunk of SavedLocationsManagerType.addObserver(_:)()
{
  return dispatch thunk of SavedLocationsManagerType.addObserver(_:)();
}

uint64_t dispatch thunk of SavedLocationsManagerType.moveLocation(from:to:)()
{
  return dispatch thunk of SavedLocationsManagerType.moveLocation(from:to:)();
}

uint64_t dispatch thunk of SavedLocationsManagerType.removeLocation(at:)()
{
  return dispatch thunk of SavedLocationsManagerType.removeLocation(at:)();
}

uint64_t StubPPTWeatherDataManager.setupStubData(for:defaultCondition:)()
{
  return StubPPTWeatherDataManager.setupStubData(for:defaultCondition:)();
}

uint64_t StubPPTWeatherDataManager.setupStubData(for:)()
{
  return StubPPTWeatherDataManager.setupStubData(for:)();
}

uint64_t type metadata accessor for StubPPTWeatherDataManager.CoordinateString()
{
  return type metadata accessor for StubPPTWeatherDataManager.CoordinateString();
}

uint64_t type metadata accessor for StubPPTWeatherDataManager()
{
  return type metadata accessor for StubPPTWeatherDataManager();
}

uint64_t static LocationsOfInterestManager.standard.getter()
{
  return static LocationsOfInterestManager.standard.getter();
}

uint64_t type metadata accessor for LocationsOfInterestManager()
{
  return type metadata accessor for LocationsOfInterestManager();
}

uint64_t NotificationsConfiguration.learnMoreURL.getter()
{
  return NotificationsConfiguration.learnMoreURL.getter();
}

uint64_t type metadata accessor for NotificationsConfiguration()
{
  return type metadata accessor for NotificationsConfiguration();
}

uint64_t type metadata accessor for WidgetPrivacyConfiguration()
{
  return type metadata accessor for WidgetPrivacyConfiguration();
}

uint64_t dispatch thunk of AppConfigurationManagerType.appConfiguration.getter()
{
  return dispatch thunk of AppConfigurationManagerType.appConfiguration.getter();
}

uint64_t dispatch thunk of AppConfigurationManagerType.addObserver(_:)()
{
  return dispatch thunk of AppConfigurationManagerType.addObserver(_:)();
}

uint64_t dispatch thunk of AppConfigurationManagerType.removeObserver(_:)()
{
  return dispatch thunk of AppConfigurationManagerType.removeObserver(_:)();
}

uint64_t AppConfigurationManagerType.fetchAppConfig()()
{
  return AppConfigurationManagerType.fetchAppConfig()();
}

uint64_t AppStoreReviewConfiguration.appReviewEnabled.getter()
{
  return AppStoreReviewConfiguration.appReviewEnabled.getter();
}

uint64_t AppStoreReviewConfiguration.reviewPromptSamplingRate.getter()
{
  return AppStoreReviewConfiguration.reviewPromptSamplingRate.getter();
}

uint64_t AppStoreReviewConfiguration.timeIntervalBetweenPrompts.getter()
{
  return AppStoreReviewConfiguration.timeIntervalBetweenPrompts.getter();
}

uint64_t AppStoreReviewConfiguration.savedLocationsCountThreshold.getter()
{
  return AppStoreReviewConfiguration.savedLocationsCountThreshold.getter();
}

uint64_t type metadata accessor for AppStoreReviewConfiguration()
{
  return type metadata accessor for AppStoreReviewConfiguration();
}

uint64_t dispatch thunk of IdentityRotationManagerType.rotateReportWeatherIdentifier()()
{
  return dispatch thunk of IdentityRotationManagerType.rotateReportWeatherIdentifier()();
}

uint64_t dispatch thunk of IdentityRotationManagerType.rotateIdentifiersIfNeeded()()
{
  return dispatch thunk of IdentityRotationManagerType.rotateIdentifiersIfNeeded()();
}

uint64_t dispatch thunk of LocationMetadataManagerType.addObserver(_:)()
{
  return dispatch thunk of LocationMetadataManagerType.addObserver(_:)();
}

uint64_t dispatch thunk of LocationMetadataManagerType.resolveAddress(for:)()
{
  return dispatch thunk of LocationMetadataManagerType.resolveAddress(for:)();
}

uint64_t dispatch thunk of LocationMetadataManagerType.availableAddress(for:)()
{
  return dispatch thunk of LocationMetadataManagerType.availableAddress(for:)();
}

uint64_t dispatch thunk of LocationMetadataManagerType.resolveCountryCode(for:)()
{
  return dispatch thunk of LocationMetadataManagerType.resolveCountryCode(for:)();
}

uint64_t dispatch thunk of LocationMetadataManagerType.availableCountryCode(for:)()
{
  return dispatch thunk of LocationMetadataManagerType.availableCountryCode(for:)();
}

uint64_t dispatch thunk of LocationMetadataManagerType.requiresShowingAddresses.getter()
{
  return dispatch thunk of LocationMetadataManagerType.requiresShowingAddresses.getter();
}

uint64_t type metadata accessor for HistoricalFactsConfiguration()
{
  return type metadata accessor for HistoricalFactsConfiguration();
}

uint64_t LocationOfInterestMatchResult.locationsOfInterest.getter()
{
  return LocationOfInterestMatchResult.locationsOfInterest.getter();
}

uint64_t type metadata accessor for LocationOfInterestMatchResult()
{
  return type metadata accessor for LocationOfInterestMatchResult();
}

uint64_t dispatch thunk of NotificationsManagerProxyType.evaluate()()
{
  return dispatch thunk of NotificationsManagerProxyType.evaluate()();
}

uint64_t dispatch thunk of NotificationsManagerProxyType.schedule()()
{
  return dispatch thunk of NotificationsManagerProxyType.schedule()();
}

uint64_t dispatch thunk of NotificationsManagerProxyType.validate()()
{
  return dispatch thunk of NotificationsManagerProxyType.validate()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.didTapAllowNotifications()()
{
  return dispatch thunk of NotificationsOptInManagerType.didTapAllowNotifications()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.tappedAllowNotifications()()
{
  return dispatch thunk of NotificationsOptInManagerType.tappedAllowNotifications()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.resetTappedAllowNotifications()()
{
  return dispatch thunk of NotificationsOptInManagerType.resetTappedAllowNotifications()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.didDismissTip(for:)()
{
  return dispatch thunk of NotificationsOptInManagerType.didDismissTip(for:)();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.enteredSettingsApp()()
{
  return dispatch thunk of NotificationsOptInManagerType.enteredSettingsApp()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.severeAcknowledged()()
{
  return dispatch thunk of NotificationsOptInManagerType.severeAcknowledged()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.didTapAllowLocation()()
{
  return dispatch thunk of NotificationsOptInManagerType.didTapAllowLocation()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.tappedAllowLocation()()
{
  return dispatch thunk of NotificationsOptInManagerType.tappedAllowLocation()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.dismissedLocationIds()()
{
  return dispatch thunk of NotificationsOptInManagerType.dismissedLocationIds()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.lastTipDismissalDate()()
{
  return dispatch thunk of NotificationsOptInManagerType.lastTipDismissalDate()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.listViewTipDismissed()()
{
  return dispatch thunk of NotificationsOptInManagerType.listViewTipDismissed()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.didDismissListViewTip()()
{
  return dispatch thunk of NotificationsOptInManagerType.didDismissListViewTip()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.resetEnteredSettingsApp()()
{
  return dispatch thunk of NotificationsOptInManagerType.resetEnteredSettingsApp()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.tipDismissalOverThreshold()()
{
  return dispatch thunk of NotificationsOptInManagerType.tipDismissalOverThreshold()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.resubscriptionTipDismissed()()
{
  return dispatch thunk of NotificationsOptInManagerType.resubscriptionTipDismissed()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.didDismissResubscriptionTip()()
{
  return dispatch thunk of NotificationsOptInManagerType.didDismissResubscriptionTip()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.loweredPermissionsSheetShown()()
{
  return dispatch thunk of NotificationsOptInManagerType.loweredPermissionsSheetShown()();
}

uint64_t dispatch thunk of NotificationsOptInManagerType.didShowLoweredPermissionsSheet()()
{
  return dispatch thunk of NotificationsOptInManagerType.didShowLoweredPermissionsSheet()();
}

uint64_t TemperatureScaleConfiguration.gradientValueRange(for:)()
{
  return TemperatureScaleConfiguration.gradientValueRange(for:)();
}

uint64_t static TemperatureScaleConfiguration.== infix(_:_:)()
{
  return static TemperatureScaleConfiguration.== infix(_:_:)();
}

uint64_t static TemperatureScaleConfiguration.read(from:)()
{
  return static TemperatureScaleConfiguration.read(from:)();
}

uint64_t TemperatureScaleConfiguration.write(to:)()
{
  return TemperatureScaleConfiguration.write(to:)();
}

uint64_t TemperatureScaleConfiguration.Gradient.stops.getter()
{
  return TemperatureScaleConfiguration.Gradient.stops.getter();
}

uint64_t static TemperatureScaleConfiguration.Gradient.default.getter()
{
  return static TemperatureScaleConfiguration.Gradient.default.getter();
}

uint64_t type metadata accessor for TemperatureScaleConfiguration.Gradient()
{
  return type metadata accessor for TemperatureScaleConfiguration.Gradient();
}

uint64_t TemperatureScaleConfiguration.init(gradient:)()
{
  return TemperatureScaleConfiguration.init(gradient:)();
}

uint64_t TemperatureScaleConfiguration.gradient.getter()
{
  return TemperatureScaleConfiguration.gradient.getter();
}

uint64_t TemperatureScaleConfiguration.ColorStop.color.getter()
{
  return TemperatureScaleConfiguration.ColorStop.color.getter();
}

uint64_t TemperatureScaleConfiguration.ColorStop.location.getter()
{
  return TemperatureScaleConfiguration.ColorStop.location.getter();
}

uint64_t type metadata accessor for TemperatureScaleConfiguration.ColorStop()
{
  return type metadata accessor for TemperatureScaleConfiguration.ColorStop();
}

uint64_t type metadata accessor for TemperatureScaleConfiguration()
{
  return type metadata accessor for TemperatureScaleConfiguration();
}

uint64_t dispatch thunk of LocationsOfInterestManagerType.setupLocationsOfInterestPushing(nanoPreferencesSynchronizer:)()
{
  return dispatch thunk of LocationsOfInterestManagerType.setupLocationsOfInterestPushing(nanoPreferencesSynchronizer:)();
}

uint64_t dispatch thunk of LocationsOfInterestManagerType.locations.getter()
{
  return dispatch thunk of LocationsOfInterestManagerType.locations.getter();
}

uint64_t dispatch thunk of LocationsOfInterestManagerType.locations.setter()
{
  return dispatch thunk of LocationsOfInterestManagerType.locations.setter();
}

uint64_t dispatch thunk of CurrentLocationCacheManagerType.readCachedLocation()()
{
  return dispatch thunk of CurrentLocationCacheManagerType.readCachedLocation()();
}

uint64_t type metadata accessor for SavedLocationsManagerDataStatus()
{
  return type metadata accessor for SavedLocationsManagerDataStatus();
}

uint64_t ProviderAttributionConfiguration.hideLocationViewDataProviderLogos.getter()
{
  return ProviderAttributionConfiguration.hideLocationViewDataProviderLogos.getter();
}

uint64_t ProviderAttributionConfiguration.mapDataLearnMoreURL.getter()
{
  return ProviderAttributionConfiguration.mapDataLearnMoreURL.getter();
}

uint64_t ProviderAttributionConfiguration.featureAvailabilityURL.getter()
{
  return ProviderAttributionConfiguration.featureAvailabilityURL.getter();
}

uint64_t type metadata accessor for ProviderAttributionConfiguration()
{
  return type metadata accessor for ProviderAttributionConfiguration();
}

uint64_t dispatch thunk of LocationDisplayContextManagerType.fetchDisplayContextByLocation()()
{
  return dispatch thunk of LocationDisplayContextManagerType.fetchDisplayContextByLocation()();
}

Swift::String __swiftcall GeocodeManagerGetCurrentCountryCode()()
{
  uint64_t CurrentCountry = GeocodeManagerGetCurrentCountryCode()();
  result._uint64_t object = v1;
  result._countAndFlagsBits = CurrentCountry;
  return result;
}

uint64_t dispatch thunk of NotificationSubscriptionManagerType.isSubscriptionAvailable.getter()
{
  return dispatch thunk of NotificationSubscriptionManagerType.isSubscriptionAvailable.getter();
}

uint64_t dispatch thunk of NotificationSubscriptionManagerType.updateSubscription(for:)()
{
  return dispatch thunk of NotificationSubscriptionManagerType.updateSubscription(for:)();
}

uint64_t dispatch thunk of NotificationSubscriptionManagerType.addObserver(_:)()
{
  return dispatch thunk of NotificationSubscriptionManagerType.addObserver(_:)();
}

uint64_t dispatch thunk of NotificationSubscriptionManagerType.unsubscribe(from:for:)()
{
  return dispatch thunk of NotificationSubscriptionManagerType.unsubscribe(from:for:)();
}

uint64_t dispatch thunk of NotificationSubscriptionManagerType.subscription(with:)()
{
  return dispatch thunk of NotificationSubscriptionManagerType.subscription(with:)();
}

uint64_t dispatch thunk of NotificationSubscriptionManagerType.subscriptions(of:)()
{
  return dispatch thunk of NotificationSubscriptionManagerType.subscriptions(of:)();
}

uint64_t dispatch thunk of NotificationSubscriptionManagerType.resubscribedAfterDeviceRestoreOnce()()
{
  return dispatch thunk of NotificationSubscriptionManagerType.resubscribedAfterDeviceRestoreOnce()();
}

uint64_t dispatch thunk of NotificationSubscriptionManagerType.setResubscribedAfterDeviceRestoreOnce()()
{
  return dispatch thunk of NotificationSubscriptionManagerType.setResubscribedAfterDeviceRestoreOnce()();
}

uint64_t dispatch thunk of NotificationAuthorizationManagerType.requestAuthorization()()
{
  return dispatch thunk of NotificationAuthorizationManagerType.requestAuthorization()();
}

uint64_t dispatch thunk of NotificationAuthorizationManagerType.requestAuthorization(_:)()
{
  return dispatch thunk of NotificationAuthorizationManagerType.requestAuthorization(_:)();
}

uint64_t dispatch thunk of Clock.time.getter()
{
  return dispatch thunk of Clock.time.getter();
}

uint64_t Assembly.init()()
{
  return Assembly.init()();
}

{
  return Assembly.init()();
}

{
  return Assembly.init()();
}

{
  return Assembly.init()();
}

{
  return Assembly.init()();
}

{
  return Assembly.init()();
}

uint64_t type metadata accessor for Assembly()
{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

{
  return type metadata accessor for Assembly();
}

uint64_t static Beaufort.maxExtendedLevel.getter()
{
  return static Beaufort.maxExtendedLevel.getter();
}

uint64_t static Beaufort.symbol(level:)()
{
  return static Beaufort.symbol(level:)();
}

uint64_t Beaufort.Category.color.getter()
{
  return Beaufort.Category.color.getter();
}

uint64_t Beaufort.Category.name.getter()
{
  return Beaufort.Category.name.getter();
}

Swift::String __swiftcall Beaufort.Category.Range.formattedRange(forAccessibility:includeUnit:)(Swift::Bool forAccessibility, Swift::Bool includeUnit)
{
  uint64_t v2 = Beaufort.Category.Range.formattedRange(forAccessibility:includeUnit:)(forAccessibility, includeUnit);
  result._uint64_t object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

Swift::String __swiftcall Beaufort.Category.Range.formattedRange(forAccessibility:)(Swift::Bool forAccessibility)
{
  uint64_t v1 = Beaufort.Category.Range.formattedRange(forAccessibility:)(forAccessibility);
  result._uint64_t object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t type metadata accessor for Beaufort.Category.Range()
{
  return type metadata accessor for Beaufort.Category.Range();
}

uint64_t Beaufort.Category.level.getter()
{
  return Beaufort.Category.level.getter();
}

uint64_t Beaufort.Category.range(in:)()
{
  return Beaufort.Category.range(in:)();
}

uint64_t type metadata accessor for Beaufort.Category()
{
  return type metadata accessor for Beaufort.Category();
}

uint64_t static Beaufort.maxLevel.getter()
{
  return static Beaufort.maxLevel.getter();
}

uint64_t static Location.currentLocationID.getter()
{
  return static Location.currentLocationID.getter();
}

uint64_t static Location.currentLocationIntentID.getter()
{
  return static Location.currentLocationIntentID.getter();
}

uint64_t Location.Identifier.intentIdentifier.getter()
{
  return Location.Identifier.intentIdentifier.getter();
}

uint64_t Location.Identifier.coordinate.getter()
{
  return Location.Identifier.coordinate.getter();
}

uint64_t static Location.Identifier.== infix(_:_:)()
{
  return static Location.Identifier.== infix(_:_:)();
}

uint64_t Location.Identifier.id.getter()
{
  return Location.Identifier.id.getter();
}

uint64_t Location.Identifier.Kind.rawValue.getter()
{
  return Location.Identifier.Kind.rawValue.getter();
}

uint64_t Location.Identifier.kind.getter()
{
  return Location.Identifier.kind.getter();
}

uint64_t Location.Identifier.name.getter()
{
  return Location.Identifier.name.getter();
}

uint64_t Location.Identifier.with(id:name:coordinate:)()
{
  return Location.Identifier.with(id:name:coordinate:)();
}

uint64_t Location.Identifier.uniqueID.getter()
{
  return Location.Identifier.uniqueID.getter();
}

uint64_t type metadata accessor for Location.Identifier()
{
  return type metadata accessor for Location.Identifier();
}

uint64_t Location.coordinate.getter()
{
  return Location.coordinate.getter();
}

uint64_t Location.init(identifier:timeZone:lastRefreshDate:searchTitle:searchSubtitle:preciseName:)()
{
  return Location.init(identifier:timeZone:lastRefreshDate:searchTitle:searchSubtitle:preciseName:)();
}

uint64_t Location.identifier.getter()
{
  return Location.identifier.getter();
}

uint64_t Location.inlineName.getter()
{
  return Location.inlineName.getter();
}

uint64_t Location.preciseName.getter()
{
  return Location.preciseName.getter();
}

uint64_t Location.searchTitle.getter()
{
  return Location.searchTitle.getter();
}

uint64_t Location.secondaryName.getter()
{
  return Location.secondaryName.getter();
}

uint64_t Location.preservingName(_:)()
{
  return Location.preservingName(_:)();
}

uint64_t Location.searchSubtitle.getter()
{
  return Location.searchSubtitle.getter();
}

uint64_t Location.lastRefreshDate.getter()
{
  return Location.lastRefreshDate.getter();
}

uint64_t Location.sanitizedSecondaryName.getter()
{
  return Location.sanitizedSecondaryName.getter();
}

uint64_t static Location.sanitizedSecondaryName(_:name:)()
{
  return static Location.sanitizedSecondaryName(_:name:)();
}

uint64_t static Location.== infix(_:_:)()
{
  return static Location.== infix(_:_:)();
}

uint64_t Location.init(id:name:timeZone:coordinate:lastRefreshDate:searchTitle:searchSubtitle:preciseName:secondaryName:)()
{
  return Location.init(id:name:timeZone:coordinate:lastRefreshDate:searchTitle:searchSubtitle:preciseName:secondaryName:)();
}

uint64_t Location.init(id:name:timeZone:coordinate:lastRefreshDate:searchTitle:searchSubtitle:preciseName:)()
{
  return Location.init(id:name:timeZone:coordinate:lastRefreshDate:searchTitle:searchSubtitle:preciseName:)();
}

uint64_t Location.id.getter()
{
  return Location.id.getter();
}

uint64_t Location.kind.getter()
{
  return Location.kind.getter();
}

uint64_t Location.name.getter()
{
  return Location.name.getter();
}

uint64_t static Location.read(from:)()
{
  return static Location.read(from:)();
}

uint64_t Location.with(identifier:timeZone:lastRefreshDate:searchTitle:searchSubtitle:preciseName:secondaryName:)()
{
  return Location.with(identifier:timeZone:lastRefreshDate:searchTitle:searchSubtitle:preciseName:secondaryName:)();
}

uint64_t Location.write(to:)()
{
  return Location.write(to:)();
}

uint64_t static Location.london.getter()
{
  return static Location.london.getter();
}

uint64_t static Location.current.getter()
{
  return static Location.current.getter();
}

uint64_t static Location.newYork.getter()
{
  return static Location.newYork.getter();
}

uint64_t Location.timeZone.getter()
{
  return Location.timeZone.getter();
}

uint64_t static Location.cupertino.getter()
{
  return static Location.cupertino.getter();
}

uint64_t Location.hashValue.getter()
{
  return Location.hashValue.getter();
}

uint64_t static Location.jerusalem.getter()
{
  return static Location.jerusalem.getter();
}

uint64_t type metadata accessor for Location()
{
  return type metadata accessor for Location();
}

uint64_t Debouncer.execute(_:)()
{
  return Debouncer.execute(_:)();
}

uint64_t type metadata accessor for Debouncer()
{
  return type metadata accessor for Debouncer();
}

uint64_t type metadata accessor for WeatherMapPurpose()
{
  return type metadata accessor for WeatherMapPurpose();
}

uint64_t WeatherMapDelegate.canAddLocation(_:)()
{
  return WeatherMapDelegate.canAddLocation(_:)();
}

uint64_t WeatherMapDelegate.canViewLocation(_:)()
{
  return WeatherMapDelegate.canViewLocation(_:)();
}

uint64_t WeatherMapDelegate.handleLocationAction(_:)()
{
  return WeatherMapDelegate.handleLocationAction(_:)();
}

uint64_t WeatherMapDelegate.provideZoomController()()
{
  return WeatherMapDelegate.provideZoomController()();
}

uint64_t WeatherMapDelegate.providePreviewViewController()()
{
  return WeatherMapDelegate.providePreviewViewController()();
}

uint64_t static WeatherMapBackground.backgroundColor(for:)()
{
  return static WeatherMapBackground.backgroundColor(for:)();
}

uint64_t type metadata accessor for WeatherMapDisplayMode.SnapshotTransition()
{
  return type metadata accessor for WeatherMapDisplayMode.SnapshotTransition();
}

uint64_t type metadata accessor for WeatherMapDisplayMode.SnapshotSizingBehavior()
{
  return type metadata accessor for WeatherMapDisplayMode.SnapshotSizingBehavior();
}

uint64_t type metadata accessor for WeatherMapDisplayMode()
{
  return type metadata accessor for WeatherMapDisplayMode();
}

uint64_t static WeatherMapOverlayKind.== infix(_:_:)()
{
  return static WeatherMapOverlayKind.== infix(_:_:)();
}

uint64_t static WeatherMapOverlayKind.read(from:)()
{
  return static WeatherMapOverlayKind.read(from:)();
}

uint64_t WeatherMapOverlayKind.write(to:)()
{
  return WeatherMapOverlayKind.write(to:)();
}

uint64_t type metadata accessor for WeatherMapOverlayKind()
{
  return type metadata accessor for WeatherMapOverlayKind();
}

Swift::String __swiftcall WeatherMapStallStatistics.description()()
{
  uint64_t v0 = WeatherMapStallStatistics.description()();
  result._uint64_t object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t WeatherMapStallStatistics.tasksStalled.getter()
{
  return WeatherMapStallStatistics.tasksStalled.getter();
}

uint64_t WeatherMapStallStatistics.activeTasksCount.getter()
{
  return WeatherMapStallStatistics.activeTasksCount.getter();
}

uint64_t WeatherMapStallStatistics.avgStalledTimeMs.getter()
{
  return WeatherMapStallStatistics.avgStalledTimeMs.getter();
}

uint64_t type metadata accessor for WeatherMapStallStatistics()
{
  return type metadata accessor for WeatherMapStallStatistics();
}

Swift::String __swiftcall WeatherMapSessionStatistics.description()()
{
  uint64_t v0 = WeatherMapSessionStatistics.description()();
  result._uint64_t object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t WeatherMapSessionStatistics.RequestCounters.requests.getter()
{
  return WeatherMapSessionStatistics.RequestCounters.requests.getter();
}

uint64_t type metadata accessor for WeatherMapSessionStatistics.RequestCounters()
{
  return type metadata accessor for WeatherMapSessionStatistics.RequestCounters();
}

uint64_t WeatherMapSessionStatistics.requestCounters.getter()
{
  return WeatherMapSessionStatistics.requestCounters.getter();
}

uint64_t WeatherMapSessionStatistics.ResponseCounters.error.getter()
{
  return WeatherMapSessionStatistics.ResponseCounters.error.getter();
}

uint64_t WeatherMapSessionStatistics.ResponseCounters.success.getter()
{
  return WeatherMapSessionStatistics.ResponseCounters.success.getter();
}

uint64_t WeatherMapSessionStatistics.ResponseCounters.cancelled.getter()
{
  return WeatherMapSessionStatistics.ResponseCounters.cancelled.getter();
}

uint64_t type metadata accessor for WeatherMapSessionStatistics.ResponseCounters()
{
  return type metadata accessor for WeatherMapSessionStatistics.ResponseCounters();
}

uint64_t WeatherMapSessionStatistics.responseCounters.getter()
{
  return WeatherMapSessionStatistics.responseCounters.getter();
}

uint64_t WeatherMapSessionStatistics.Timing.avgResponseTimeMs.getter()
{
  return WeatherMapSessionStatistics.Timing.avgResponseTimeMs.getter();
}

uint64_t type metadata accessor for WeatherMapSessionStatistics.Timing()
{
  return type metadata accessor for WeatherMapSessionStatistics.Timing();
}

uint64_t WeatherMapSessionStatistics.timing.getter()
{
  return WeatherMapSessionStatistics.timing.getter();
}

uint64_t type metadata accessor for WeatherMapSessionStatistics()
{
  return type metadata accessor for WeatherMapSessionStatistics();
}

uint64_t dispatch thunk of WeatherMapZoomControllerType.currentZoomLevel.getter()
{
  return dispatch thunk of WeatherMapZoomControllerType.currentZoomLevel.getter();
}

uint64_t type metadata accessor for WeatherMapPreviewLocationState()
{
  return type metadata accessor for WeatherMapPreviewLocationState();
}

uint64_t dispatch thunk of WeatherMapZoomControllerDelegate.didRequestCurrentZoomLevel(_:)()
{
  return dispatch thunk of WeatherMapZoomControllerDelegate.didRequestCurrentZoomLevel(_:)();
}

uint64_t static WeatherMapPrecipitationOverlayKind.== infix(_:_:)()
{
  return static WeatherMapPrecipitationOverlayKind.== infix(_:_:)();
}

uint64_t type metadata accessor for WeatherMapPrecipitationOverlayKind()
{
  return type metadata accessor for WeatherMapPrecipitationOverlayKind();
}

uint64_t WeatherMapPerformanceTestConditions.with(location:zoomLevel:)()
{
  return WeatherMapPerformanceTestConditions.with(location:zoomLevel:)();
}

uint64_t WeatherMapPerformanceTestConditions.init(location:zoomLevel:)()
{
  return WeatherMapPerformanceTestConditions.init(location:zoomLevel:)();
}

uint64_t type metadata accessor for WeatherMapPerformanceTestConditions()
{
  return type metadata accessor for WeatherMapPerformanceTestConditions();
}

uint64_t dispatch thunk of WeatherMapOverlayMetaDataRefresherType.refreshMetadata(purpose:)()
{
  return dispatch thunk of WeatherMapOverlayMetaDataRefresherType.refreshMetadata(purpose:)();
}

uint64_t WeatherMap.init(displayMode:preferredMapSize:locations:overlayKind:selectedLocationId:weatherData:options:cacheIdentifier:isPreferredForCachedInstance:debugIdentifier:)()
{
  return WeatherMap.init(displayMode:preferredMapSize:locations:overlayKind:selectedLocationId:weatherData:options:cacheIdentifier:isPreferredForCachedInstance:debugIdentifier:)();
}

uint64_t WeatherMap.init<A, B>(displayMode:locations:overlayKind:selectedLocationId:weatherData:options:cacheIdentifier:isPreferredForCachedInstance:debugIdentifier:supplementaryOverlay:contentStatusBanner:)()
{
  return WeatherMap.init<A, B>(displayMode:locations:overlayKind:selectedLocationId:weatherData:options:cacheIdentifier:isPreferredForCachedInstance:debugIdentifier:supplementaryOverlay:contentStatusBanner:)();
}

uint64_t type metadata accessor for WeatherMap.LocationAction()
{
  return type metadata accessor for WeatherMap.LocationAction();
}

uint64_t static WeatherMap.Event.== infix(_:_:)()
{
  return static WeatherMap.Event.== infix(_:_:)();
}

uint64_t type metadata accessor for WeatherMap.Event.Overlay()
{
  return type metadata accessor for WeatherMap.Event.Overlay();
}

uint64_t type metadata accessor for WeatherMap.Event()
{
  return type metadata accessor for WeatherMap.Event();
}

uint64_t type metadata accessor for WeatherMap()
{
  return type metadata accessor for WeatherMap();
}

uint64_t static ButtonGroup.Button.overlayMenu.getter()
{
  return static ButtonGroup.Button.overlayMenu.getter();
}

uint64_t static ButtonGroup.Button.locationPicker.getter()
{
  return static ButtonGroup.Button.locationPicker.getter();
}

uint64_t static ButtonGroup.Button.currentLocation(isPermissionGranted:openSettings:)()
{
  return static ButtonGroup.Button.currentLocation(isPermissionGranted:openSettings:)();
}

uint64_t ButtonGroup.Button.accessibilityLabel(_:)()
{
  return ButtonGroup.Button.accessibilityLabel(_:)();
}

uint64_t type metadata accessor for ButtonGroup.Button.Content()
{
  return type metadata accessor for ButtonGroup.Button.Content();
}

uint64_t static ButtonGroup.Button.dismiss(_:identifier:handler:)()
{
  return static ButtonGroup.Button.dismiss(_:identifier:handler:)();
}

uint64_t type metadata accessor for ButtonGroup.Button()
{
  return type metadata accessor for ButtonGroup.Button();
}

uint64_t ButtonGroup.Button.init(_:identifier:handler:)()
{
  return ButtonGroup.Button.init(_:identifier:handler:)();
}

uint64_t type metadata accessor for ButtonGroup.Alignment()
{
  return type metadata accessor for ButtonGroup.Alignment();
}

uint64_t ButtonGroup.init(alignment:buttons:)()
{
  return ButtonGroup.init(alignment:buttons:)();
}

uint64_t type metadata accessor for ButtonGroup()
{
  return type metadata accessor for ButtonGroup();
}

uint64_t static ButtonsBuilder.buildBlock(_:)()
{
  return static ButtonsBuilder.buildBlock(_:)();
}

uint64_t static ButtonsBuilder.buildOptional(_:)()
{
  return static ButtonsBuilder.buildOptional(_:)();
}

uint64_t static ButtonsBuilder.buildExpression(_:)()
{
  return static ButtonsBuilder.buildExpression(_:)();
}

uint64_t static RainExpectation.== infix(_:_:)()
{
  return static RainExpectation.== infix(_:_:)();
}

uint64_t type metadata accessor for RainExpectation()
{
  return type metadata accessor for RainExpectation();
}

uint64_t static ButtonGroupsBuilder.buildBlock(_:)()
{
  return static ButtonGroupsBuilder.buildBlock(_:)();
}

uint64_t static ButtonGroupsBuilder.buildOptional(_:)()
{
  return static ButtonGroupsBuilder.buildOptional(_:)();
}

uint64_t static ButtonGroupsBuilder.buildExpression(_:)()
{
  return static ButtonGroupsBuilder.buildExpression(_:)();
}

Swift::Void __swiftcall AppSessionManager.appSessionDidTerminate(timeout:)(Swift::Double timeout)
{
}

Swift::Void __swiftcall AppSessionManager.startAppSession()()
{
}

uint64_t AppSessionManager.createSessionManager(with:)()
{
  return AppSessionManager.createSessionManager(with:)();
}

uint64_t AppSessionManager.wasPriorSessionCrashDetected.getter()
{
  return AppSessionManager.wasPriorSessionCrashDetected.getter();
}

uint64_t type metadata accessor for AppSessionManager()
{
  return type metadata accessor for AppSessionManager();
}

uint64_t SessionData.init(key:data:)()
{
  return SessionData.init(key:data:)();
}

uint64_t AccessTracker.diagnosticSubmissionAllowed.getter()
{
  return AccessTracker.diagnosticSubmissionAllowed.getter();
}

uint64_t AccessTracker.clearStack<A>(of:includeParentTrackers:)()
{
  return AccessTracker.clearStack<A>(of:includeParentTrackers:)();
}

Swift::Void __swiftcall AccessTracker.leaveGroup()()
{
}

uint64_t AccessTracker.explicitTime<A>(_:startTime:)()
{
  return AccessTracker.explicitTime<A>(_:startTime:)();
}

uint64_t AccessTracker.explicitSubmit<A>(_:submitTime:completion:)()
{
  return AccessTracker.explicitSubmit<A>(_:submitTime:completion:)();
}

uint64_t AccessTracker.push<A>(data:traits:file:line:)()
{
  return AccessTracker.push<A>(data:traits:file:line:)();
}

uint64_t AccessTracker.time<A>(_:submitAndRestartWithSession:)()
{
  return AccessTracker.time<A>(_:submitAndRestartWithSession:)();
}

uint64_t AccessTracker.submit<A>(_:onlyIfTimed:userInfo:completion:)()
{
  return AccessTracker.submit<A>(_:onlyIfTimed:userInfo:completion:)();
}

uint64_t type metadata accessor for DataEventTrait()
{
  return type metadata accessor for DataEventTrait();
}

uint64_t type metadata accessor for FlushProcessor()
{
  return type metadata accessor for FlushProcessor();
}

uint64_t SessionManager.processorManager.getter()
{
  return SessionManager.processorManager.getter();
}

uint64_t SessionManager.transaction(_:)()
{
  return SessionManager.transaction(_:)();
}

uint64_t SessionManager.end(endDate:completion:)()
{
  return SessionManager.end(endDate:completion:)();
}

uint64_t SessionManager.push<A>(_:traits:file:line:)()
{
  return SessionManager.push<A>(_:traits:file:line:)();
}

uint64_t SessionManager.start(for:identifier:startDate:timestampJitter:)()
{
  return SessionManager.start(for:identifier:startDate:timestampJitter:)();
}

uint64_t static SessionManager.Options.gracefulNoSessionEventSubmission.getter()
{
  return static SessionManager.Options.gracefulNoSessionEventSubmission.getter();
}

uint64_t static SessionManager.Options.gracefulEventCreation.getter()
{
  return static SessionManager.Options.gracefulEventCreation.getter();
}

uint64_t type metadata accessor for SessionManager.Options()
{
  return type metadata accessor for SessionManager.Options();
}

uint64_t SessionManager.tracker.getter()
{
  return SessionManager.tracker.getter();
}

uint64_t type metadata accessor for SessionManager()
{
  return type metadata accessor for SessionManager();
}

uint64_t SessionObserver.dispose(on:)()
{
  return SessionObserver.dispose(on:)();
}

uint64_t type metadata accessor for TimestampJitter()
{
  return type metadata accessor for TimestampJitter();
}

uint64_t ProcessorManager.add(eventProcessor:)()
{
  return ProcessorManager.add(eventProcessor:)();
}

uint64_t LazyEventProcessor.init(underlyingProcessorProvider:)()
{
  return LazyEventProcessor.init(underlyingProcessorProvider:)();
}

Swift::Void __swiftcall LazyEventProcessor.resolve()()
{
}

uint64_t type metadata accessor for LazyEventProcessor()
{
  return type metadata accessor for LazyEventProcessor();
}

uint64_t AccessSessionManager.push<A>(_:traits:file:line:)()
{
  return AccessSessionManager.push<A>(_:traits:file:line:)();
}

uint64_t LoggingEventProcessor.__allocating_init(logFormat:)()
{
  return LoggingEventProcessor.__allocating_init(logFormat:)();
}

uint64_t type metadata accessor for LoggingEventProcessor()
{
  return type metadata accessor for LoggingEventProcessor();
}

uint64_t type metadata accessor for UploadBatchEventConfig()
{
  return type metadata accessor for UploadBatchEventConfig();
}

uint64_t UploadBatchEventProcessor.__allocating_init(client:endpoint:contentType:config:)()
{
  return UploadBatchEventProcessor.__allocating_init(client:endpoint:contentType:config:)();
}

uint64_t type metadata accessor for UploadBatchEventProcessor()
{
  return type metadata accessor for UploadBatchEventProcessor();
}

uint64_t type metadata accessor for LoggingEventProcessorFormat()
{
  return type metadata accessor for LoggingEventProcessorFormat();
}

uint64_t SessionManagerConfiguration.init(options:flushProcessor:timestampJitter:privacyValidationProvider:)()
{
  return SessionManagerConfiguration.init(options:flushProcessor:timestampJitter:privacyValidationProvider:)();
}

uint64_t type metadata accessor for SessionManagerConfiguration()
{
  return type metadata accessor for SessionManagerConfiguration();
}

uint64_t Client.buildNumber.getter()
{
  return Client.buildNumber.getter();
}

uint64_t Client.__allocating_init(bundle:)()
{
  return Client.__allocating_init(bundle:)();
}

uint64_t Client.version.getter()
{
  return Client.version.getter();
}

uint64_t type metadata accessor for Client()
{
  return type metadata accessor for Client();
}

uint64_t type metadata accessor for Session.Kind()
{
  return type metadata accessor for Session.Kind();
}

uint64_t Tracker.timeDiagnosticEvent<A>(_:)()
{
  return Tracker.timeDiagnosticEvent<A>(_:)();
}

uint64_t Tracker.submitDiagnosticEvent<A>(_:onlyIfTimed:completion:)()
{
  return Tracker.submitDiagnosticEvent<A>(_:onlyIfTimed:completion:)();
}

uint64_t Tracker.diagnosticSubmissionAllowed.getter()
{
  return Tracker.diagnosticSubmissionAllowed.getter();
}

uint64_t Tracker.enterGroup(groupName:contentType:)()
{
  return Tracker.enterGroup(groupName:contentType:)();
}

uint64_t Tracker.transaction(block:)()
{
  return Tracker.transaction(block:)();
}

uint64_t Tracker.onSessionChange(block:)()
{
  return Tracker.onSessionChange(block:)();
}

uint64_t Tracker.push<A>(data:traits:file:line:)()
{
  return Tracker.push<A>(data:traits:file:line:)();
}

uint64_t Tracker.chain(name:identifier:)()
{
  return Tracker.chain(name:identifier:)();
}

uint64_t type metadata accessor for Tracker()
{
  return type metadata accessor for Tracker();
}

uint64_t CGFloat.clamp(min:max:)()
{
  return CGFloat.clamp(min:max:)();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t static RegexComponentBuilder.buildExpression<A>(_:)()
{
  return static RegexComponentBuilder.buildExpression<A>(_:)();
}

uint64_t static RegexComponentBuilder.buildPartialBlock<A>(first:)()
{
  return static RegexComponentBuilder.buildPartialBlock<A>(first:)();
}

uint64_t ZeroOrMore.init(_:)()
{
  return ZeroOrMore.init(_:)();
}

uint64_t makeFactory()()
{
  return makeFactory()();
}

uint64_t type metadata accessor for CharacterClass()
{
  return type metadata accessor for CharacterClass();
}

uint64_t Capture.init(_:)()
{
  return Capture.init(_:)();
}

uint64_t OneOrMore.init(_:)()
{
  return OneOrMore.init(_:)();
}

uint64_t Definition.whenTesting(_:_:)()
{
  return Definition.whenTesting(_:_:)();
}

uint64_t Definition.thenConfigure<A>(as:configuration:)()
{
  return Definition.thenConfigure<A>(as:configuration:)();
}

uint64_t Definition.thenConfigure(_:)()
{
  return Definition.thenConfigure(_:)();
}

uint64_t Definition.inScope(_:)()
{
  return Definition.inScope(_:)();
}

uint64_t dispatch thunk of Disposable.dispose(on:)()
{
  return dispatch thunk of Disposable.dispose(on:)();
}

uint64_t MockServer.listeningPort.getter()
{
  return MockServer.listeningPort.getter();
}

uint64_t static MockServer.shared.getter()
{
  return static MockServer.shared.getter();
}

uint64_t type metadata accessor for MockServer()
{
  return type metadata accessor for MockServer();
}

uint64_t type metadata accessor for ScenePhase()
{
  return type metadata accessor for ScenePhase();
}

{
  return type metadata accessor for ScenePhase();
}

Swift::Void __swiftcall UnfairLock.lock()()
{
}

Swift::Void __swiftcall UnfairLock.unlock()()
{
}

uint64_t static UnfairLock.Options.dataSynchronization.getter()
{
  return static UnfairLock.Options.dataSynchronization.getter();
}

uint64_t type metadata accessor for UnfairLock.Options()
{
  return type metadata accessor for UnfairLock.Options();
}

uint64_t UnfairLock.init(options:)()
{
  return UnfairLock.init(options:)();
}

uint64_t type metadata accessor for UnfairLock()
{
  return type metadata accessor for UnfairLock();
}

uint64_t syncOnMain(_:)()
{
  return syncOnMain(_:)();
}

uint64_t dispatch thunk of ContextType.use<A>(_:for:name:)()
{
  return dispatch thunk of ContextType.use<A>(_:for:name:)();
}

uint64_t type metadata accessor for LazyOptions()
{
  return type metadata accessor for LazyOptions();
}

uint64_t static Capabilities.isInternalBuild()()
{
  return static Capabilities.isInternalBuild()();
}

uint64_t type metadata accessor for Capabilities()
{
  return type metadata accessor for Capabilities();
}

uint64_t static CodableError.read(from:)()
{
  return static CodableError.read(from:)();
}

uint64_t CodableError.write(to:)()
{
  return CodableError.write(to:)();
}

uint64_t CodableError.errorCode.getter()
{
  return CodableError.errorCode.getter();
}

uint64_t type metadata accessor for CodableError()
{
  return type metadata accessor for CodableError();
}

uint64_t CodableError.init(_:)()
{
  return CodableError.init(_:)();
}

uint64_t type metadata accessor for NetworkProxy()
{
  return type metadata accessor for NetworkProxy();
}

uint64_t dispatch thunk of ResolverType.resolve<A>(_:name:)()
{
  return dispatch thunk of ResolverType.resolve<A>(_:name:)();
}

{
  return dispatch thunk of ResolverType.resolve<A>(_:name:)();
}

uint64_t dispatch thunk of ResolverType.resolve<A>(_:with:)()
{
  return dispatch thunk of ResolverType.resolve<A>(_:with:)();
}

uint64_t dispatch thunk of ResolverType.resolve<A>(_:)()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t type metadata accessor for BinaryDecoder.Error()
{
  return type metadata accessor for BinaryDecoder.Error();
}

uint64_t static BinaryDecoder.decode<A>(_:from:)()
{
  return static BinaryDecoder.decode<A>(_:from:)();
}

uint64_t type metadata accessor for BinaryDecoder()
{
  return type metadata accessor for BinaryDecoder();
}

uint64_t static BinaryEncoder.encode<A>(_:)()
{
  return static BinaryEncoder.encode<A>(_:)();
}

uint64_t type metadata accessor for BinaryEncoder()
{
  return type metadata accessor for BinaryEncoder();
}

uint64_t type metadata accessor for CallbackScope()
{
  return type metadata accessor for CallbackScope();
}

uint64_t SingletonPool.init()()
{
  return SingletonPool.init()();
}

uint64_t type metadata accessor for SingletonPool()
{
  return type metadata accessor for SingletonPool();
}

uint64_t simulateCrash(_:_:)()
{
  return simulateCrash(_:_:)();
}

uint64_t dispatch thunk of AsyncOperation.completion.setter()
{
  return dispatch thunk of AsyncOperation.completion.setter();
}

uint64_t PromiseDeduper.init(options:)()
{
  return PromiseDeduper.init(options:)();
}

uint64_t PromiseDeduper.promise(key:createBlock:)()
{
  return PromiseDeduper.promise(key:createBlock:)();
}

uint64_t ProxyContainer.public.getter()
{
  return ProxyContainer.public.getter();
}

uint64_t ProxyContainer.private.getter()
{
  return ProxyContainer.private.getter();
}

uint64_t ProxyContainer.callback.getter()
{
  return ProxyContainer.callback.getter();
}

uint64_t SafeCollection.subscript.getter()
{
  return SafeCollection.subscript.getter();
}

uint64_t AsyncObservable.next(value:quiet:)()
{
  return AsyncObservable.next(value:quiet:)();
}

uint64_t AsyncObservable.init(value:)()
{
  return AsyncObservable.init(value:)();
}

uint64_t AsyncObservable.onNext(on:eager:block:)()
{
  return AsyncObservable.onNext(on:eager:block:)();
}

uint64_t dispatch thunk of static BinaryDecodable.read(from:)()
{
  return dispatch thunk of static BinaryDecodable.read(from:)();
}

uint64_t dispatch thunk of BinaryEncodable.write(to:)()
{
  return dispatch thunk of BinaryEncodable.write(to:)();
}

uint64_t StartupTaskType.run()()
{
  return StartupTaskType.run()();
}

uint64_t StartupTaskType.group.getter()
{
  return StartupTaskType.group.getter();
}

uint64_t URLHandlerMatch.url.getter()
{
  return URLHandlerMatch.url.getter();
}

uint64_t type metadata accessor for URLHandlerMatch.Values()
{
  return type metadata accessor for URLHandlerMatch.Values();
}

uint64_t URLHandlerMatch.Values.subscript.getter()
{
  return URLHandlerMatch.Values.subscript.getter();
}

uint64_t URLHandlerMatch.values.getter()
{
  return URLHandlerMatch.values.getter();
}

uint64_t type metadata accessor for URLHandlerMatch()
{
  return type metadata accessor for URLHandlerMatch();
}

uint64_t NetworkOperation.__allocating_init(endpoint:parameters:headers:networkProxy:earliestBeginDate:)()
{
  return NetworkOperation.__allocating_init(endpoint:parameters:headers:networkProxy:earliestBeginDate:)();
}

uint64_t dispatch thunk of ShortDescribable.shortDescription.getter()
{
  return dispatch thunk of ShortDescribable.shortDescription.getter();
}

uint64_t ShortDescribable.description.getter()
{
  return ShortDescribable.description.getter();
}

uint64_t ShortDescription.init(name:_:)()
{
  return ShortDescription.init(name:_:)();
}

uint64_t type metadata accessor for FrameworkAssembly()
{
  return type metadata accessor for FrameworkAssembly();
}

{
  return type metadata accessor for FrameworkAssembly();
}

Swift::Void __swiftcall SceneStateMonitor.sceneDidDisconnect()()
{
}

Swift::Void __swiftcall SceneStateMonitor.sceneWillResignActive(with:)(Swift::String with)
{
}

Swift::Void __swiftcall SceneStateMonitor.sceneDidEnterBackground(with:)(Swift::String with)
{
}

Swift::Void __swiftcall SceneStateMonitor.sceneDidEnterBackground()()
{
}

Swift::Void __swiftcall SceneStateMonitor.sceneWillEnterForeground()()
{
}

uint64_t URLHandlerContext.clientContext.getter()
{
  return URLHandlerContext.clientContext.getter();
}

uint64_t URLHandlerContext.match.getter()
{
  return URLHandlerContext.match.getter();
}

uint64_t URLHandlerManager.add<A>(handler:)()
{
  return URLHandlerManager.add<A>(handler:)();
}

uint64_t URLHandlerManager.add<A>(processor:)()
{
  return URLHandlerManager.add<A>(processor:)();
}

uint64_t URLHandlerManager.handle(url:context:)()
{
  return URLHandlerManager.handle(url:context:)();
}

uint64_t URLHandlerManager.init()()
{
  return URLHandlerManager.init()();
}

uint64_t type metadata accessor for URLHandlerPattern.Param()
{
  return type metadata accessor for URLHandlerPattern.Param();
}

uint64_t URLHandlerPattern.init(scheme:host:path:fragment:params:conditions:)()
{
  return URLHandlerPattern.init(scheme:host:path:fragment:params:conditions:)();
}

uint64_t URLHandlerPattern.init(scheme:host:path:fragment:)()
{
  return URLHandlerPattern.init(scheme:host:path:fragment:)();
}

uint64_t type metadata accessor for URLHandlerPattern()
{
  return type metadata accessor for URLHandlerPattern();
}

Swift::Void __swiftcall DebugCacheRegistry.clearCache()()
{
}

uint64_t DebugCacheRegistry.registerContentsOfDirectory(_:)()
{
  return DebugCacheRegistry.registerContentsOfDirectory(_:)();
}

uint64_t type metadata accessor for DebugCacheRegistry()
{
  return type metadata accessor for DebugCacheRegistry();
}

uint64_t ObservableResolver.resolve<A>(_:)()
{
  return ObservableResolver.resolve<A>(_:)();
}

uint64_t type metadata accessor for ObservableResolver()
{
  return type metadata accessor for ObservableResolver();
}

uint64_t ObservableResolver.init(_:)()
{
  return ObservableResolver.init(_:)();
}

uint64_t StartupTaskManager.onStartup(run:)()
{
  return StartupTaskManager.onStartup(run:)();
}

uint64_t StartupTaskManager.startAllTasks(launchOptions:phase:)()
{
  return StartupTaskManager.startAllTasks(launchOptions:phase:)();
}

uint64_t type metadata accessor for StartupTaskManager()
{
  return type metadata accessor for StartupTaskManager();
}

uint64_t type metadata accessor for PromiseDeduperFlags()
{
  return type metadata accessor for PromiseDeduperFlags();
}

uint64_t dispatch thunk of ShortDescriptionType.describe(withIndentation:)()
{
  return dispatch thunk of ShortDescriptionType.describe(withIndentation:)();
}

uint64_t RegistrationContainer.lazy(block:)()
{
  return RegistrationContainer.lazy(block:)();
}

uint64_t RegistrationContainer.register<A>(_:name:factory:)()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t dispatch thunk of ScenePhaseManagerType.addObserver(_:)()
{
  return dispatch thunk of ScenePhaseManagerType.addObserver(_:)();
}

uint64_t dispatch thunk of ScenePhaseManagerType.onChange(old:new:)()
{
  return dispatch thunk of ScenePhaseManagerType.onChange(old:new:)();
}

uint64_t dispatch thunk of SceneStateManagerType.sceneWillConnectToSession(withOptions:)()
{
  return dispatch thunk of SceneStateManagerType.sceneWillConnectToSession(withOptions:)();
}

uint64_t dispatch thunk of SceneStateManagerType.add(monitor:)()
{
  return dispatch thunk of SceneStateManagerType.add(monitor:)();
}

uint64_t SceneConnectionOptions.connectionOptions.getter()
{
  return SceneConnectionOptions.connectionOptions.getter();
}

uint64_t SceneConnectionOptions.isEmpty.getter()
{
  return SceneConnectionOptions.isEmpty.getter();
}

uint64_t type metadata accessor for SceneConnectionOptions()
{
  return type metadata accessor for SceneConnectionOptions();
}

Swift::Void __swiftcall ApplicationStateMonitor.applicationDidEnterBackground()()
{
}

Swift::Void __swiftcall ApplicationStateMonitor.applicationDidFinishLaunching(withOptions:)(Swift::OpaquePointer_optional withOptions)
{
}

Swift::Void __swiftcall ApplicationStateMonitor.applicationWillEnterForeground()()
{
}

uint64_t OnlyOnceDeferredPromise.promise.getter()
{
  return OnlyOnceDeferredPromise.promise.getter();
}

uint64_t OnlyOnceDeferredPromise.resolve(_:)()
{
  return OnlyOnceDeferredPromise.resolve(_:)();
}

uint64_t OnlyOnceDeferredPromise.init()()
{
  return OnlyOnceDeferredPromise.init()();
}

uint64_t dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)()
{
  return dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
}

{
  return dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
}

uint64_t type metadata accessor for StartupTaskExecutionPhase()
{
  return type metadata accessor for StartupTaskExecutionPhase();
}

uint64_t static FixedSizeTypeBinaryCodable.read(from:)()
{
  return static FixedSizeTypeBinaryCodable.read(from:)();
}

uint64_t FixedSizeTypeBinaryCodable.write(to:)()
{
  return FixedSizeTypeBinaryCodable.write(to:)();
}

uint64_t dispatch thunk of ApplicationStateManagerType.applicationDidFinishLaunching(withOptions:)()
{
  return dispatch thunk of ApplicationStateManagerType.applicationDidFinishLaunching(withOptions:)();
}

uint64_t dispatch thunk of ApplicationStateManagerType.add(monitor:)()
{
  return dispatch thunk of ApplicationStateManagerType.add(monitor:)();
}

uint64_t type metadata accessor for ApplicationStateLaunchOptionKey()
{
  return type metadata accessor for ApplicationStateLaunchOptionKey();
}

uint64_t type metadata accessor for JSON()
{
  return type metadata accessor for JSON();
}

uint64_t dispatch thunk of Lazy.value.getter()
{
  return dispatch thunk of Lazy.value.getter();
}

uint64_t Lazy.init(options:loadBlock:)()
{
  return Lazy.init(options:loadBlock:)();
}

uint64_t Lock.sync<A>(_:)()
{
  return Lock.sync<A>(_:)();
}

uint64_t when<A>(on:_:)()
{
  return when<A>(on:_:)();
}

{
  return when<A>(on:_:)();
}

uint64_t Cache.init()()
{
  return Cache.init()();
}

uint64_t Cache.init(_:)()
{
  return Cache.init(_:)();
}

uint64_t Cache.subscript.getter()
{
  return Cache.subscript.getter();
}

uint64_t Cache.subscript.setter()
{
  return Cache.subscript.setter();
}

uint64_t type metadata accessor for Scope()
{
  return type metadata accessor for Scope();
}

uint64_t when2<A, B>(on:_:_:)()
{
  return when2<A, B>(on:_:_:)();
}

uint64_t zalgo.getter()
{
  return zalgo.getter();
}

uint64_t Atomic.init(wrappedValue:)()
{
  return Atomic.init(wrappedValue:)();
}

uint64_t Atomic.wrappedValue.getter()
{
  return Atomic.wrappedValue.getter();
}

uint64_t Atomic.wrappedValue.setter()
{
  return Atomic.wrappedValue.setter();
}

uint64_t Promise.asOptional()()
{
  return Promise.asOptional()();
}

uint64_t Promise.then<A>(on:closure:)()
{
  return Promise.then<A>(on:closure:)();
}

{
  return Promise.then<A>(on:closure:)();
}

uint64_t Promise.then<A, B>(on:disposeOn:closure:)()
{
  return Promise.then<A, B>(on:disposeOn:closure:)();
}

{
  return Promise.then<A, B>(on:disposeOn:closure:)();
}

uint64_t Promise.error(on:closure:)()
{
  return Promise.error(on:closure:)();
}

uint64_t Promise.init(error:)()
{
  return Promise.init(error:)();
}

uint64_t Promise.init(value:)()
{
  return Promise.init(value:)();
}

uint64_t Promise.always(on:closure:)()
{
  return Promise.always(on:closure:)();
}

uint64_t Promise.recover(on:closure:)()
{
  return Promise.recover(on:closure:)();
}

uint64_t Promise.init(resolver:)()
{
  return Promise.init(resolver:)();
}

uint64_t firstly<A, B>(on:disposeOn:closure:)()
{
  return firstly<A, B>(on:disposeOn:closure:)();
}

uint64_t firstly<A>(closure:)()
{
  return firstly<A>(closure:)();
}

uint64_t LRUCache.cache(value:for:expires:)()
{
  return LRUCache.cache(value:for:expires:)();
}

uint64_t LRUCache.init(maxSize:)()
{
  return LRUCache.init(maxSize:)();
}

uint64_t LRUCache.subscript.getter()
{
  return LRUCache.subscript.getter();
}

uint64_t NonEmpty.rawElements.modify()
{
  return NonEmpty.rawElements.modify();
}

uint64_t NonEmpty.makeIterator()()
{
  return NonEmpty.makeIterator()();
}

uint64_t NonEmpty.map<A>(_:)()
{
  return NonEmpty.map<A>(_:)();
}

uint64_t NonEmpty.max<>()()
{
  return NonEmpty.max<>()();
}

uint64_t NonEmpty.count.getter()
{
  return NonEmpty.count.getter();
}

uint64_t NonEmpty.first.getter()
{
  return NonEmpty.first.getter();
}

uint64_t NonEmpty.elements.getter()
{
  return NonEmpty.elements.getter();
}

uint64_t NonEmpty.init<A>(arrayWith:_:)()
{
  return NonEmpty.init<A>(arrayWith:_:)();
}

uint64_t NonEmpty<>.last.getter()
{
  return NonEmpty<>.last.getter();
}

uint64_t static NonEmpty<>.== infix(_:_:)()
{
  return static NonEmpty<>.== infix(_:_:)();
}

uint64_t type metadata accessor for NonEmpty()
{
  return type metadata accessor for NonEmpty();
}

uint64_t NonEmpty.init(_:)()
{
  return NonEmpty.init(_:)();
}

uint64_t type metadata accessor for Container.Environment()
{
  return type metadata accessor for Container.Environment();
}

uint64_t Container.resolver.getter()
{
  return Container.resolver.getter();
}

uint64_t type metadata accessor for Container.TestSuite()
{
  return type metadata accessor for Container.TestSuite();
}

uint64_t type metadata accessor for Container()
{
  return type metadata accessor for Container();
}

uint64_t asyncMain(block:)()
{
  return asyncMain(block:)();
}

uint64_t WeatherDataRequest.rawValue.getter()
{
  return WeatherDataRequest.rawValue.getter();
}

uint64_t WeatherInterpolator.reduce(_:from:to:clampRange:useMonotone:)()
{
  return WeatherInterpolator.reduce(_:from:to:clampRange:useMonotone:)();
}

uint64_t WeatherDataRequestOptions.needsTwilightData.getter()
{
  return WeatherDataRequestOptions.needsTwilightData.getter();
}

uint64_t WeatherDataRequestOptions.locationOptions.getter()
{
  return WeatherDataRequestOptions.locationOptions.getter();
}

uint64_t WeatherDataRequestOptions.treatmentIdentifiers.getter()
{
  return WeatherDataRequestOptions.treatmentIdentifiers.getter();
}

uint64_t WeatherDataRequestOptions.timeZone.getter()
{
  return WeatherDataRequestOptions.timeZone.getter();
}

uint64_t static WeatherStatisticsDataStore.location.getter()
{
  return static WeatherStatisticsDataStore.location.getter();
}

uint64_t type metadata accessor for WeatherStatisticsDataStore()
{
  return type metadata accessor for WeatherStatisticsDataStore();
}

uint64_t WeatherRequestLocationOptions.decimalPrecision.getter()
{
  return WeatherRequestLocationOptions.decimalPrecision.getter();
}

uint64_t type metadata accessor for WeatherRequestLocationOptions()
{
  return type metadata accessor for WeatherRequestLocationOptions();
}

uint64_t WeatherModel.MissingProductError.product.getter()
{
  return WeatherModel.MissingProductError.product.getter();
}

uint64_t type metadata accessor for WeatherModel.MissingProductError()
{
  return type metadata accessor for WeatherModel.MissingProductError();
}

uint64_t type metadata accessor for WeatherProduct()
{
  return type metadata accessor for WeatherProduct();
}

uint64_t static WeatherDataStore.location.getter()
{
  return static WeatherDataStore.location.getter();
}

uint64_t type metadata accessor for WeatherDataStore()
{
  return type metadata accessor for WeatherDataStore();
}

uint64_t LocationInfo.init(metadata:primaryName:secondaryName:preciseName:countryCode:timeZone:)()
{
  return LocationInfo.init(metadata:primaryName:secondaryName:preciseName:countryCode:timeZone:)();
}

uint64_t type metadata accessor for ConditionCode()
{
  return type metadata accessor for ConditionCode();
}

uint64_t ExtremaResult.maxDate.getter()
{
  return ExtremaResult.maxDate.getter();
}

uint64_t ExtremaResult.minDate.getter()
{
  return ExtremaResult.minDate.getter();
}

uint64_t ExtremaResult.init(maxValue:maxDate:minValue:minDate:)()
{
  return ExtremaResult.init(maxValue:maxDate:minValue:minDate:)();
}

uint64_t ExtremaResult.maxValue.getter()
{
  return ExtremaResult.maxValue.getter();
}

uint64_t ExtremaResult.minValue.getter()
{
  return ExtremaResult.minValue.getter();
}

uint64_t type metadata accessor for ExtremaResult()
{
  return type metadata accessor for ExtremaResult();
}

uint64_t type metadata accessor for ForecastSummary.Intensity()
{
  return type metadata accessor for ForecastSummary.Intensity();
}

uint64_t type metadata accessor for WDSClientErrors()
{
  return type metadata accessor for WDSClientErrors();
}

uint64_t DemoDataProvider.demoData(named:subdirectory:)()
{
  return DemoDataProvider.demoData(named:subdirectory:)();
}

uint64_t DemoDataProvider.init()()
{
  return DemoDataProvider.init()();
}

uint64_t type metadata accessor for DemoDataProvider()
{
  return type metadata accessor for DemoDataProvider();
}

uint64_t type metadata accessor for NextHourForecast()
{
  return type metadata accessor for NextHourForecast();
}

uint64_t type metadata accessor for PrecipitationType()
{
  return type metadata accessor for PrecipitationType();
}

uint64_t InterpolationElement.date.getter()
{
  return InterpolationElement.date.getter();
}

uint64_t InterpolationElement.init(value:date:)()
{
  return InterpolationElement.init(value:date:)();
}

uint64_t InterpolationElement.value.getter()
{
  return InterpolationElement.value.getter();
}

uint64_t type metadata accessor for InterpolationElement()
{
  return type metadata accessor for InterpolationElement();
}

uint64_t MidpointInterpolator.InterpolationMode.init(_:)()
{
  return MidpointInterpolator.InterpolationMode.init(_:)();
}

uint64_t type metadata accessor for MidpointInterpolator.InterpolationMode()
{
  return type metadata accessor for MidpointInterpolator.InterpolationMode();
}

uint64_t MidpointInterpolator.interpolationValue(data:date:interpolationMode:)()
{
  return MidpointInterpolator.interpolationValue(data:date:interpolationMode:)();
}

uint64_t MidpointInterpolator.init()()
{
  return MidpointInterpolator.init()();
}

uint64_t type metadata accessor for MidpointInterpolator()
{
  return type metadata accessor for MidpointInterpolator();
}

uint64_t type metadata accessor for WDSJWTAuthenticatorService.Errors()
{
  return type metadata accessor for WDSJWTAuthenticatorService.Errors();
}

uint64_t dispatch thunk of WDSAuthenticatorFactoryType.makeAuthenticator(for:)()
{
  return dispatch thunk of WDSAuthenticatorFactoryType.makeAuthenticator(for:)();
}

uint64_t type metadata accessor for Metadata.Units()
{
  return type metadata accessor for Metadata.Units();
}

uint64_t Metadata.init(readTime:expireTime:reportedTime:version:latitude:longitude:language:providerName:providerLogo:temporarilyUnavailable:units:attributionURL:)()
{
  return Metadata.init(readTime:expireTime:reportedTime:version:latitude:longitude:language:providerName:providerLogo:temporarilyUnavailable:units:attributionURL:)();
}

uint64_t type metadata accessor for Metadata()
{
  return type metadata accessor for Metadata();
}

uint64_t type metadata accessor for ReportWeatherExposureEvent()
{
  return type metadata accessor for ReportWeatherExposureEvent();
}

uint64_t type metadata accessor for ReportWeatherEvent()
{
  return type metadata accessor for ReportWeatherEvent();
}

uint64_t type metadata accessor for ReportWeatherDNUEvent()
{
  return type metadata accessor for ReportWeatherDNUEvent();
}

uint64_t dispatch thunk of WeatherDataVisibleLocationLoadingTelemetryBackend.record(event:)()
{
  return dispatch thunk of WeatherDataVisibleLocationLoadingTelemetryBackend.record(event:)();
}

{
  return dispatch thunk of WeatherDataVisibleLocationLoadingTelemetryBackend.record(event:)();
}

uint64_t WeatherJSONData.init(json:)()
{
  return WeatherJSONData.init(json:)();
}

uint64_t type metadata accessor for WeatherJSONData()
{
  return type metadata accessor for WeatherJSONData();
}

uint64_t type metadata accessor for CloudCover()
{
  return type metadata accessor for CloudCover();
}

uint64_t type metadata accessor for DetailType()
{
  return type metadata accessor for DetailType();
}

uint64_t DeviceData.init(deviceModel:devicePlatform:osInstallVariant:osVersion:osBundleVersion:)()
{
  return DeviceData.init(deviceModel:devicePlatform:osInstallVariant:osVersion:osBundleVersion:)();
}

uint64_t type metadata accessor for DeviceData()
{
  return type metadata accessor for DeviceData();
}

uint64_t DeviceInfo.buildVersion.getter()
{
  return DeviceInfo.buildVersion.getter();
}

uint64_t DeviceInfo.productVersion.getter()
{
  return DeviceInfo.productVersion.getter();
}

uint64_t DeviceInfo.marketingProductName.getter()
{
  return DeviceInfo.marketingProductName.getter();
}

uint64_t static DeviceInfo.current.getter()
{
  return static DeviceInfo.current.getter();
}

uint64_t type metadata accessor for DeviceInfo()
{
  return type metadata accessor for DeviceInfo();
}

uint64_t type metadata accessor for EmbedState()
{
  return type metadata accessor for EmbedState();
}

uint64_t type metadata accessor for MapOverlay()
{
  return type metadata accessor for MapOverlay();
}

uint64_t type metadata accessor for AQIFeedback()
{
  return type metadata accessor for AQIFeedback();
}

uint64_t SessionData.init(utcOffset:languageCode:countryCode:startMethod:productType:locationAccess:cellularRadioAccessTechnology:userSegmentationTreatmentIDs:userSegmentationSegmentSetIDs:)()
{
  return SessionData.init(utcOffset:languageCode:countryCode:startMethod:productType:locationAccess:cellularRadioAccessTechnology:userSegmentationTreatmentIDs:userSegmentationSegmentSetIDs:)();
}

uint64_t type metadata accessor for SessionData()
{
  return type metadata accessor for SessionData();
}

uint64_t StartMethod.init(referringApplication:)()
{
  return StartMethod.init(referringApplication:)();
}

uint64_t type metadata accessor for StartMethod()
{
  return type metadata accessor for StartMethod();
}

uint64_t type metadata accessor for LinkTapEvent()
{
  return type metadata accessor for LinkTapEvent();
}

uint64_t LocationData.init(latitudeDouble:longitudeDouble:)()
{
  return LocationData.init(latitudeDouble:longitudeDouble:)();
}

uint64_t type metadata accessor for LocationData()
{
  return type metadata accessor for LocationData();
}

uint64_t type metadata accessor for MapViewEvent()
{
  return type metadata accessor for MapViewEvent();
}

uint64_t ReferralData.init(referringApplication:referringUrl:)()
{
  return ReferralData.init(referringApplication:referringUrl:)();
}

uint64_t type metadata accessor for ReferralData()
{
  return type metadata accessor for ReferralData();
}

uint64_t type metadata accessor for WindFeedback()
{
  return type metadata accessor for WindFeedback();
}

uint64_t ComponentData.init(type:)()
{
  return ComponentData.init(type:)();
}

uint64_t type metadata accessor for ComponentData()
{
  return type metadata accessor for ComponentData();
}

uint64_t type metadata accessor for ComponentType()
{
  return type metadata accessor for ComponentType();
}

uint64_t Configuration.isEnabled.getter()
{
  return Configuration.isEnabled.getter();
}

uint64_t type metadata accessor for Configuration()
{
  return type metadata accessor for Configuration();
}

uint64_t type metadata accessor for ListViewEvent()
{
  return type metadata accessor for ListViewEvent();
}

uint64_t DetailViewData.init(type:)()
{
  return DetailViewData.init(type:)();
}

uint64_t type metadata accessor for DetailViewData()
{
  return type metadata accessor for DetailViewData();
}

uint64_t DevicePlatform.init(rawValue:)()
{
  return DevicePlatform.init(rawValue:)();
}

uint64_t type metadata accessor for DevicePlatform()
{
  return type metadata accessor for DevicePlatform();
}

uint64_t MapOverlayData.init(overlay:)()
{
  return MapOverlayData.init(overlay:)();
}

uint64_t type metadata accessor for MapOverlayData()
{
  return type metadata accessor for MapOverlayData();
}

uint64_t SessionEndData.init(endReason:)()
{
  return SessionEndData.init(endReason:)();
}

uint64_t type metadata accessor for SessionEndData()
{
  return type metadata accessor for SessionEndData();
}

uint64_t AQIFeedbackData.init(reportedAQI:currentAQI:)()
{
  return AQIFeedbackData.init(reportedAQI:currentAQI:)();
}

uint64_t type metadata accessor for AQIFeedbackData()
{
  return type metadata accessor for AQIFeedbackData();
}

uint64_t type metadata accessor for DetailViewEvent()
{
  return type metadata accessor for DetailViewEvent();
}

uint64_t ForecastAgeData.init(fetchDate:)()
{
  return ForecastAgeData.init(fetchDate:)();
}

uint64_t type metadata accessor for ForecastAgeData()
{
  return type metadata accessor for ForecastAgeData();
}

uint64_t OrientationData.init(deviceOrientation:interfaceOrientation:)()
{
  return OrientationData.init(deviceOrientation:interfaceOrientation:)();
}

uint64_t type metadata accessor for OrientationData()
{
  return type metadata accessor for OrientationData();
}

uint64_t PrivateUserData.init(privateUserID:)()
{
  return PrivateUserData.init(privateUserID:)();
}

uint64_t type metadata accessor for PrivateUserData()
{
  return type metadata accessor for PrivateUserData();
}

uint64_t type metadata accessor for DetailViewOrigin()
{
  return type metadata accessor for DetailViewOrigin();
}

uint64_t type metadata accessor for FirstLaunchEvent()
{
  return type metadata accessor for FirstLaunchEvent();
}

uint64_t GeocodeTelemetry.init(backend:clock:)()
{
  return GeocodeTelemetry.init(backend:clock:)();
}

uint64_t type metadata accessor for GeocodeTelemetry()
{
  return type metadata accessor for GeocodeTelemetry();
}

uint64_t type metadata accessor for OsInstallVariant()
{
  return type metadata accessor for OsInstallVariant();
}

uint64_t type metadata accessor for TemperatureScale()
{
  return type metadata accessor for TemperatureScale();
}

uint64_t WindFeedbackData.init(reportedWind:currrentWind:currrentWindGust:)()
{
  return WindFeedbackData.init(reportedWind:currrentWind:currrentWindGust:)();
}

uint64_t type metadata accessor for WindFeedbackData()
{
  return type metadata accessor for WindFeedbackData();
}

uint64_t type metadata accessor for DeviceOrientation()
{
  return type metadata accessor for DeviceOrientation();
}

uint64_t type metadata accessor for LocationViewEvent()
{
  return type metadata accessor for LocationViewEvent();
}

uint64_t MapEmbedStateData.init(embedState:)()
{
  return MapEmbedStateData.init(embedState:)();
}

uint64_t type metadata accessor for MapEmbedStateData()
{
  return type metadata accessor for MapEmbedStateData();
}

uint64_t type metadata accessor for AppSessionEndEvent()
{
  return type metadata accessor for AppSessionEndEvent();
}

uint64_t CoarseLocationData.init(status:)()
{
  return CoarseLocationData.init(status:)();
}

uint64_t type metadata accessor for CoarseLocationData()
{
  return type metadata accessor for CoarseLocationData();
}

uint64_t type metadata accessor for LocationAccessData()
{
  return type metadata accessor for LocationAccessData();
}

uint64_t AQIAvailabilityData.init(isAQIAvailable:)()
{
  return AQIAvailabilityData.init(isAQIAvailable:)();
}

uint64_t type metadata accessor for AQIAvailabilityData()
{
  return type metadata accessor for AQIAvailabilityData();
}

uint64_t type metadata accessor for MapExitOverlayEvent()
{
  return type metadata accessor for MapExitOverlayEvent();
}

uint64_t type metadata accessor for TemperatureFeedback()
{
  return type metadata accessor for TemperatureFeedback();
}

uint64_t type metadata accessor for AppSessionStartEvent()
{
  return type metadata accessor for AppSessionStartEvent();
}

uint64_t type metadata accessor for CoarseLocationStatus()
{
  return type metadata accessor for CoarseLocationStatus();
}

uint64_t FirstLaunchEventData.init(eventID:date:isFirstLaunchOfMonth:isDnu:utcOffset:languageCode:countryCode:osVersion:osBuild:)()
{
  return FirstLaunchEventData.init(eventID:date:isFirstLaunchOfMonth:isDnu:utcOffset:languageCode:countryCode:osVersion:osBuild:)();
}

uint64_t type metadata accessor for FirstLaunchEventData()
{
  return type metadata accessor for FirstLaunchEventData();
}

uint64_t dispatch thunk of GeocodingSamplerType.canGeocodeLocation(_:)()
{
  return dispatch thunk of GeocodingSamplerType.canGeocodeLocation(_:)();
}

uint64_t type metadata accessor for InterfaceOrientation()
{
  return type metadata accessor for InterfaceOrientation();
}

uint64_t TemperatureScaleData.init(temperatureScale:)()
{
  return TemperatureScaleData.init(temperatureScale:)();
}

uint64_t type metadata accessor for TemperatureScaleData()
{
  return type metadata accessor for TemperatureScaleData();
}

uint64_t TemperatureScaleData.init(_:)()
{
  return TemperatureScaleData.init(_:)();
}

uint64_t ComponentPositionData.init(row:column:)()
{
  return ComponentPositionData.init(row:column:)();
}

uint64_t type metadata accessor for ComponentPositionData()
{
  return type metadata accessor for ComponentPositionData();
}

uint64_t LocationConditionData.init(locationCondition:temperature:temperatureHigh:temperatureLow:)()
{
  return LocationConditionData.init(locationCondition:temperature:temperatureHigh:temperatureLow:)();
}

uint64_t type metadata accessor for LocationConditionData()
{
  return type metadata accessor for LocationConditionData();
}

uint64_t type metadata accessor for ComponentExposureEvent()
{
  return type metadata accessor for ComponentExposureEvent();
}

uint64_t ConditionsFeedbackData.init(sunnyReport:cloudCoverReport:rainReport:sleetReport:snowReport:)()
{
  return ConditionsFeedbackData.init(sunnyReport:cloudCoverReport:rainReport:sleetReport:snowReport:)();
}

uint64_t type metadata accessor for ConditionsFeedbackData()
{
  return type metadata accessor for ConditionsFeedbackData();
}

uint64_t MapStallStatisticsData.init(activeTaskCount:tasksStalled:avgTimeTaskStalled:)()
{
  return MapStallStatisticsData.init(activeTaskCount:tasksStalled:avgTimeTaskStalled:)();
}

uint64_t type metadata accessor for MapStallStatisticsData()
{
  return type metadata accessor for MapStallStatisticsData();
}

uint64_t type metadata accessor for PrecipitationIntensity()
{
  return type metadata accessor for PrecipitationIntensity();
}

uint64_t type metadata accessor for DescriptionFeedbackData()
{
  return type metadata accessor for DescriptionFeedbackData();
}

uint64_t type metadata accessor for ProviderDataOrigination()
{
  return type metadata accessor for ProviderDataOrigination();
}

uint64_t TemperatureFeedbackData.init(reportedTemperature:currrentDewPoint:)()
{
  return TemperatureFeedbackData.init(reportedTemperature:currrentDewPoint:)();
}

uint64_t type metadata accessor for TemperatureFeedbackData()
{
  return type metadata accessor for TemperatureFeedbackData();
}

uint64_t LocationListPositionData.init(position:)()
{
  return LocationListPositionData.init(position:)();
}

uint64_t type metadata accessor for LocationListPositionData()
{
  return type metadata accessor for LocationListPositionData();
}

uint64_t MapSessionStatisticsData.init(totalCalls:successfulCalls:cancelledCalls:errorCalls:avgTime:)()
{
  return MapSessionStatisticsData.init(totalCalls:successfulCalls:cancelledCalls:errorCalls:avgTime:)();
}

uint64_t type metadata accessor for MapSessionStatisticsData()
{
  return type metadata accessor for MapSessionStatisticsData();
}

uint64_t NotificationSettingsData.init(isNotificationsEnabled:isCurrentLocationPrecipitationNotificationEnabled:isOtherLocationsPrecipitationNotificationEnabled:isCurrentLocationSevereNotificationEnabled:isOtherLocationsSevereNotificationEnabled:)()
{
  return NotificationSettingsData.init(isNotificationsEnabled:isCurrentLocationPrecipitationNotificationEnabled:isOtherLocationsPrecipitationNotificationEnabled:isCurrentLocationSevereNotificationEnabled:isOtherLocationsSevereNotificationEnabled:)();
}

uint64_t type metadata accessor for NotificationSettingsData()
{
  return type metadata accessor for NotificationSettingsData();
}

uint64_t DetailViewOriginationData.init(origin:componentData:)()
{
  return DetailViewOriginationData.init(origin:componentData:)();
}

uint64_t type metadata accessor for DetailViewOriginationData()
{
  return type metadata accessor for DetailViewOriginationData();
}

uint64_t type metadata accessor for FollowingLocationListData()
{
  return type metadata accessor for FollowingLocationListData();
}

uint64_t LocationViewLoadErrorData.init(errorDescriptions:missingCurrent:missingDaily:missingHourly:insufficientDays:insufficientHours:unexpectedDateFormat:missingResponse:failedToCreateResponseModel:invalidAuthorization:responseFailed:invalidJWTResponse:invalidBundleIdentifier:failedToGenerateSigningRequestData:invalidServerResponseForJWTToken:)()
{
  return LocationViewLoadErrorData.init(errorDescriptions:missingCurrent:missingDaily:missingHourly:insufficientDays:insufficientHours:unexpectedDateFormat:missingResponse:failedToCreateResponseModel:invalidAuthorization:responseFailed:invalidJWTResponse:invalidBundleIdentifier:failedToGenerateSigningRequestData:invalidServerResponseForJWTToken:)();
}

uint64_t type metadata accessor for LocationViewLoadErrorData()
{
  return type metadata accessor for LocationViewLoadErrorData();
}

uint64_t type metadata accessor for FollowingLocationListEvent()
{
  return type metadata accessor for FollowingLocationListEvent();
}

uint64_t dispatch thunk of LocationPrivacySamplerType.canRecordLocation(_:)()
{
  return dispatch thunk of LocationPrivacySamplerType.canRecordLocation(_:)();
}

uint64_t LocationViewLoadPerfLogData.init(offlineDuration:emptyDuration:populatedDuration:dataFirstAppearedDate:firstWeatherDataAge:)()
{
  return LocationViewLoadPerfLogData.init(offlineDuration:emptyDuration:populatedDuration:dataFirstAppearedDate:firstWeatherDataAge:)();
}

uint64_t type metadata accessor for LocationViewLoadPerfLogData()
{
  return type metadata accessor for LocationViewLoadPerfLogData();
}

uint64_t type metadata accessor for OtherConditionsFeedbackData()
{
  return type metadata accessor for OtherConditionsFeedbackData();
}

uint64_t type metadata accessor for CellularRadioAccessTechnology()
{
  return type metadata accessor for CellularRadioAccessTechnology();
}

uint64_t dispatch thunk of LocationAccessDataProviderType.locationAccessData.getter()
{
  return dispatch thunk of LocationAccessDataProviderType.locationAccessData.getter();
}

uint64_t VisibleLocationFailedLoadingEvent.init(location:startTime:endTime:errorDescription:)()
{
  return VisibleLocationFailedLoadingEvent.init(location:startTime:endTime:errorDescription:)();
}

uint64_t type metadata accessor for VisibleLocationFailedLoadingEvent()
{
  return type metadata accessor for VisibleLocationFailedLoadingEvent();
}

uint64_t VisibleLocationFinishedLoadingEvent.init(location:startTime:endTime:endReason:loadingBeganDuringObservation:)()
{
  return VisibleLocationFinishedLoadingEvent.init(location:startTime:endTime:endReason:loadingBeganDuringObservation:)();
}

uint64_t type metadata accessor for VisibleLocationFinishedLoadingEvent.EndReason()
{
  return type metadata accessor for VisibleLocationFinishedLoadingEvent.EndReason();
}

uint64_t type metadata accessor for VisibleLocationFinishedLoadingEvent()
{
  return type metadata accessor for VisibleLocationFinishedLoadingEvent();
}

uint64_t dispatch thunk of CellularRadioAccessTechnologyProviderType.cellularRadioAccessTechnology.getter()
{
  return dispatch thunk of CellularRadioAccessTechnologyProviderType.cellularRadioAccessTechnology.getter();
}

uint64_t AQIData.init(index:category:scale:providerDataOrigination:)()
{
  return AQIData.init(index:category:scale:providerDataOrigination:)();
}

uint64_t type metadata accessor for AQIData()
{
  return type metadata accessor for AQIData();
}

uint64_t AppData.init(appVersion:appBuildNumber:)()
{
  return AppData.init(appVersion:appBuildNumber:)();
}

uint64_t type metadata accessor for AppData()
{
  return type metadata accessor for AppData();
}

uint64_t URLData.init(url:linkType:)()
{
  return URLData.init(url:linkType:)();
}

uint64_t type metadata accessor for URLData()
{
  return type metadata accessor for URLData();
}

uint64_t type metadata accessor for LinkType()
{
  return type metadata accessor for LinkType();
}

uint64_t UserData.init(userID:userStartDate:)()
{
  return UserData.init(userID:userStartDate:)();
}

uint64_t type metadata accessor for UserData()
{
  return type metadata accessor for UserData();
}

uint64_t ViewData.init(viewSessionID:viewType:viewAction:)()
{
  return ViewData.init(viewSessionID:viewType:viewAction:)();
}

uint64_t type metadata accessor for ViewData()
{
  return type metadata accessor for ViewData();
}

uint64_t type metadata accessor for ViewType()
{
  return type metadata accessor for ViewType();
}

uint64_t ZoomData.init(level:)()
{
  return ZoomData.init(level:)();
}

uint64_t type metadata accessor for ZoomData()
{
  return type metadata accessor for ZoomData();
}

uint64_t type metadata accessor for Condition()
{
  return type metadata accessor for Condition();
}

uint64_t DebugData.init(name:)()
{
  return DebugData.init(name:)();
}

uint64_t type metadata accessor for DebugData()
{
  return type metadata accessor for DebugData();
}

uint64_t type metadata accessor for EndReason()
{
  return type metadata accessor for EndReason();
}

uint64_t WeatherValueCalculationContext.init(hourWeather:dayWeather:chartCondition:units:currentWeather:timeZone:)()
{
  return WeatherValueCalculationContext.init(hourWeather:dayWeather:chartCondition:units:currentWeather:timeZone:)();
}

uint64_t WeatherValueCalculationContext.hourWeather.getter()
{
  return WeatherValueCalculationContext.hourWeather.getter();
}

uint64_t WeatherValueCalculationContext.chartCondition.getter()
{
  return WeatherValueCalculationContext.chartCondition.getter();
}

uint64_t WeatherValueCalculationContext.units.getter()
{
  return WeatherValueCalculationContext.units.getter();
}

uint64_t WeatherValueCalculationContext.timeZone.getter()
{
  return WeatherValueCalculationContext.timeZone.getter();
}

uint64_t type metadata accessor for WeatherValueCalculationContext()
{
  return type metadata accessor for WeatherValueCalculationContext();
}

uint64_t static ShadowModel.clear.getter()
{
  return static ShadowModel.clear.getter();
}

uint64_t type metadata accessor for ShadowModel()
{
  return type metadata accessor for ShadowModel();
}

uint64_t ChartLineMark.init(chartData:dateExtrema:xAxisRange:yAxisRange:lineStyle:colorSchemeContrast:shadow:useSecondValue:showAccessibilityLabels:)()
{
  return ChartLineMark.init(chartData:dateExtrema:xAxisRange:yAxisRange:lineStyle:colorSchemeContrast:shadow:useSecondValue:showAccessibilityLabels:)();
}

uint64_t type metadata accessor for ChartLineMark()
{
  return type metadata accessor for ChartLineMark();
}

uint64_t type metadata accessor for AttributedText()
{
  return type metadata accessor for AttributedText();
}

uint64_t AttributedText.init(_:accessibilityAttributedText:onInteraction:)()
{
  return AttributedText.init(_:accessibilityAttributedText:onInteraction:)();
}

uint64_t ChartAreaStyle.init(gradient:opacity:)()
{
  return ChartAreaStyle.init(gradient:opacity:)();
}

uint64_t type metadata accessor for ChartAreaStyle()
{
  return type metadata accessor for ChartAreaStyle();
}

uint64_t type metadata accessor for ChartLineColor()
{
  return type metadata accessor for ChartLineColor();
}

uint64_t ChartLineStyle.areaStyle.getter()
{
  return ChartLineStyle.areaStyle.getter();
}

uint64_t ChartLineStyle.halfLineWidth.getter()
{
  return ChartLineStyle.halfLineWidth.getter();
}

uint64_t ChartLineStyle.init(strokeStyle:lineThickness:lineColor:lineDash:opacity:opacityIncreasedContrast:areaStyle:)()
{
  return ChartLineStyle.init(strokeStyle:lineThickness:lineColor:lineDash:opacity:opacityIncreasedContrast:areaStyle:)();
}

uint64_t ChartLineStyle.strokeStyle.getter()
{
  return ChartLineStyle.strokeStyle.getter();
}

uint64_t type metadata accessor for ChartLineStyle()
{
  return type metadata accessor for ChartLineStyle();
}

uint64_t ConditionUnits.visibility.getter()
{
  return ConditionUnits.visibility.getter();
}

uint64_t ConditionUnits.temperature.getter()
{
  return ConditionUnits.temperature.getter();
}

uint64_t ConditionUnits.precipitationTotal.getter()
{
  return ConditionUnits.precipitationTotal.getter();
}

uint64_t static ConditionUnits.== infix(_:_:)()
{
  return static ConditionUnits.== infix(_:_:)();
}

uint64_t ConditionUnits.pressure.getter()
{
  return ConditionUnits.pressure.getter();
}

uint64_t ConditionUnits.windGust.getter()
{
  return ConditionUnits.windGust.getter();
}

uint64_t ConditionUnits.windSpeed.getter()
{
  return ConditionUnits.windSpeed.getter();
}

uint64_t type metadata accessor for ConditionUnits()
{
  return type metadata accessor for ConditionUnits();
}

uint64_t IsSameDayCache.startOfDay(_:calendar:)()
{
  return IsSameDayCache.startOfDay(_:calendar:)();
}

uint64_t IsSameDayCache.init()()
{
  return IsSameDayCache.init()();
}

uint64_t type metadata accessor for IsSameDayCache()
{
  return type metadata accessor for IsSameDayCache();
}

uint64_t ChartAreaSeries.init(chartData:dateExtrema:visibleDateRange:yAxisRange:areaStyle:halfLineWidth:useSecondValue:)()
{
  return ChartAreaSeries.init(chartData:dateExtrema:visibleDateRange:yAxisRange:areaStyle:halfLineWidth:useSecondValue:)();
}

uint64_t type metadata accessor for ChartAreaSeries()
{
  return type metadata accessor for ChartAreaSeries();
}

uint64_t static ChartValueLabel.with(label:)()
{
  return static ChartValueLabel.with(label:)();
}

uint64_t DetailCondition.symbolName.getter()
{
  return DetailCondition.symbolName.getter();
}

uint64_t DetailCondition.description.getter()
{
  return DetailCondition.description.getter();
}

uint64_t DetailCondition.filledSymbolName.getter()
{
  return DetailCondition.filledSymbolName.getter();
}

uint64_t DetailCondition.usesCustomSymbol.getter()
{
  return DetailCondition.usesCustomSymbol.getter();
}

uint64_t DetailCondition.presentsTwoCharts.getter()
{
  return DetailCondition.presentsTwoCharts.getter();
}

uint64_t DetailCondition.accessibilityLabel.getter()
{
  return DetailCondition.accessibilityLabel.getter();
}

uint64_t static DetailCondition.== infix(_:_:)()
{
  return static DetailCondition.== infix(_:_:)();
}

uint64_t static DetailCondition.read(from:)()
{
  return static DetailCondition.read(from:)();
}

uint64_t DetailCondition.title.getter()
{
  return DetailCondition.title.getter();
}

uint64_t DetailCondition.write(to:)()
{
  return DetailCondition.write(to:)();
}

uint64_t DetailCondition.rawValue.getter()
{
  return DetailCondition.rawValue.getter();
}

uint64_t DetailCondition.subtitle.getter()
{
  return DetailCondition.subtitle.getter();
}

uint64_t type metadata accessor for DetailCondition()
{
  return type metadata accessor for DetailCondition();
}

uint64_t ChartSeriesValues.seriesMaxValue.getter()
{
  return ChartSeriesValues.seriesMaxValue.getter();
}

uint64_t ChartSeriesValues.seriesMinValue.getter()
{
  return ChartSeriesValues.seriesMinValue.getter();
}

uint64_t ChartSeriesValues.seriesMaxThirdValue.getter()
{
  return ChartSeriesValues.seriesMaxThirdValue.getter();
}

uint64_t ChartSeriesValues.seriesMinThirdValue.getter()
{
  return ChartSeriesValues.seriesMinThirdValue.getter();
}

uint64_t ChartSeriesValues.seriesMaxSecondValue.getter()
{
  return ChartSeriesValues.seriesMaxSecondValue.getter();
}

uint64_t ChartSeriesValues.seriesMinSecondValue.getter()
{
  return ChartSeriesValues.seriesMinSecondValue.getter();
}

uint64_t ChartSeriesValues.interpolationElements.getter()
{
  return ChartSeriesValues.interpolationElements.getter();
}

uint64_t OverviewTableView.init(model:rowVerticalPadding:rowHorizontalPadding:showDividerOnFirstRow:titleFont:valueFont:)()
{
  return OverviewTableView.init(model:rowVerticalPadding:rowHorizontalPadding:showDividerOnFirstRow:titleFont:valueFont:)();
}

uint64_t type metadata accessor for OverviewTableView()
{
  return type metadata accessor for OverviewTableView();
}

uint64_t type metadata accessor for ChartPeakMarkStyle()
{
  return type metadata accessor for ChartPeakMarkStyle();
}

uint64_t DetailChartExtrema.maxThirdValue.getter()
{
  return DetailChartExtrema.maxThirdValue.getter();
}

uint64_t DetailChartExtrema.minThirdValue.getter()
{
  return DetailChartExtrema.minThirdValue.getter();
}

uint64_t DetailChartExtrema.maxSecondValue.getter()
{
  return DetailChartExtrema.maxSecondValue.getter();
}

uint64_t DetailChartExtrema.minSecondValue.getter()
{
  return DetailChartExtrema.minSecondValue.getter();
}

uint64_t static DetailChartExtrema.== infix(_:_:)()
{
  return static DetailChartExtrema.== infix(_:_:)();
}

uint64_t DetailChartExtrema.maxValue.getter()
{
  return DetailChartExtrema.maxValue.getter();
}

uint64_t DetailChartExtrema.init(minValue:maxValue:minSecondValue:maxSecondValue:minThirdValue:maxThirdValue:)()
{
  return DetailChartExtrema.init(minValue:maxValue:minSecondValue:maxSecondValue:minThirdValue:maxThirdValue:)();
}

uint64_t DetailChartExtrema.minValue.getter()
{
  return DetailChartExtrema.minValue.getter();
}

uint64_t type metadata accessor for DetailChartExtrema()
{
  return type metadata accessor for DetailChartExtrema();
}

uint64_t static ChartDarkeningScrim.dimmingEffect.getter()
{
  return static ChartDarkeningScrim.dimmingEffect.getter();
}

uint64_t static ChartDarkeningScrim.hashPatternEffect.getter()
{
  return static ChartDarkeningScrim.hashPatternEffect.getter();
}

uint64_t type metadata accessor for ChartDarkeningScrim()
{
  return type metadata accessor for ChartDarkeningScrim();
}

uint64_t type metadata accessor for ChartLineStrokeStyle()
{
  return type metadata accessor for ChartLineStrokeStyle();
}

uint64_t ChartPointMarkSeries.init(markers:markStyle:symbolSize:labelFont:fallbackLabelColor:)()
{
  return ChartPointMarkSeries.init(markers:markStyle:symbolSize:labelFont:fallbackLabelColor:)();
}

uint64_t type metadata accessor for ChartPointMarkSeries()
{
  return type metadata accessor for ChartPointMarkSeries();
}

uint64_t DetailChartCondition.shouldInterpolateLollipop.getter()
{
  return DetailChartCondition.shouldInterpolateLollipop.getter();
}

uint64_t DetailChartCondition.interpolatedValueClampRange.getter()
{
  return DetailChartCondition.interpolatedValueClampRange.getter();
}

uint64_t static DetailChartCondition.chanceOfRainNowHourThreshold.getter()
{
  return static DetailChartCondition.chanceOfRainNowHourThreshold.getter();
}

uint64_t DetailChartCondition.id.getter()
{
  return DetailChartCondition.id.getter();
}

uint64_t DetailChartCondition.title.getter()
{
  return DetailChartCondition.title.getter();
}

uint64_t type metadata accessor for DetailChartCondition()
{
  return type metadata accessor for DetailChartCondition();
}

uint64_t static DetailChartDataPoint.== infix(_:_:)()
{
  return static DetailChartDataPoint.== infix(_:_:)();
}

uint64_t DetailChartDataPoint.date.getter()
{
  return DetailChartDataPoint.date.getter();
}

uint64_t DetailChartDataPoint.init(date:value:)()
{
  return DetailChartDataPoint.init(date:value:)();
}

uint64_t DetailChartDataPoint.value.getter()
{
  return DetailChartDataPoint.value.getter();
}

uint64_t type metadata accessor for DetailChartDataPoint()
{
  return type metadata accessor for DetailChartDataPoint();
}

uint64_t static TemperatureChartKind.== infix(_:_:)()
{
  return static TemperatureChartKind.== infix(_:_:)();
}

uint64_t TemperatureChartKind.title.getter()
{
  return TemperatureChartKind.title.getter();
}

uint64_t TemperatureChartKind.summary.getter()
{
  return TemperatureChartKind.summary.getter();
}

uint64_t static TemperatureChartKind.allCases.getter()
{
  return static TemperatureChartKind.allCases.getter();
}

uint64_t type metadata accessor for TemperatureChartKind()
{
  return type metadata accessor for TemperatureChartKind();
}

uint64_t DaylightStringBuilder.makeLollipopDaylightString(for:location:sunEvents:timeZone:)()
{
  return DaylightStringBuilder.makeLollipopDaylightString(for:location:sunEvents:timeZone:)();
}

uint64_t DaylightStringBuilder.makeLollipopPolarDaylightString(for:location:timeZone:)()
{
  return DaylightStringBuilder.makeLollipopPolarDaylightString(for:location:timeZone:)();
}

uint64_t static DaylightStringBuilder.== infix(_:_:)()
{
  return static DaylightStringBuilder.== infix(_:_:)();
}

uint64_t DaylightStringBuilder.init()()
{
  return DaylightStringBuilder.init()();
}

uint64_t type metadata accessor for DaylightStringBuilder()
{
  return type metadata accessor for DaylightStringBuilder();
}

uint64_t type metadata accessor for DominantPrecipitation()
{
  return type metadata accessor for DominantPrecipitation();
}

uint64_t static ChartOcclusionHashView.Style.default.getter()
{
  return static ChartOcclusionHashView.Style.default.getter();
}

uint64_t type metadata accessor for ChartOcclusionHashView.Style()
{
  return type metadata accessor for ChartOcclusionHashView.Style();
}

uint64_t ChartOcclusionHashView.init(width:height:style:)()
{
  return ChartOcclusionHashView.init(width:height:style:)();
}

uint64_t static ChartPastDataTreatment.== infix(_:_:)()
{
  return static ChartPastDataTreatment.== infix(_:_:)();
}

uint64_t type metadata accessor for ChartPastDataTreatment()
{
  return type metadata accessor for ChartPastDataTreatment();
}

uint64_t type metadata accessor for DetailChartDataElement.ValueLabel()
{
  return type metadata accessor for DetailChartDataElement.ValueLabel();
}

uint64_t DetailChartDataElement.valueLabel.getter()
{
  return DetailChartDataElement.valueLabel.getter();
}

uint64_t DetailChartDataElement.secondValue.getter()
{
  return DetailChartDataElement.secondValue.getter();
}

uint64_t DetailChartDataElement.accessibilityDateString.getter()
{
  return DetailChartDataElement.accessibilityDateString.getter();
}

uint64_t DetailChartDataElement.accessibilityValueDescription.getter()
{
  return DetailChartDataElement.accessibilityValueDescription.getter();
}

uint64_t DetailChartDataElement.id.getter()
{
  return DetailChartDataElement.id.getter();
}

uint64_t DetailChartDataElement.date.getter()
{
  return DetailChartDataElement.date.getter();
}

uint64_t DetailChartDataElement.init(date:value:secondValue:thirdValue:valueLabel:dateLabel:accessibilityDateString:accessibilityValueDescription:color:textColor:)()
{
  return DetailChartDataElement.init(date:value:secondValue:thirdValue:valueLabel:dateLabel:accessibilityDateString:accessibilityValueDescription:color:textColor:)();
}

uint64_t DetailChartDataElement.color.getter()
{
  return DetailChartDataElement.color.getter();
}

uint64_t DetailChartDataElement.value.getter()
{
  return DetailChartDataElement.value.getter();
}

uint64_t DetailChartDataElement.dateLabel.getter()
{
  return DetailChartDataElement.dateLabel.getter();
}

uint64_t type metadata accessor for DetailChartDataElement()
{
  return type metadata accessor for DetailChartDataElement();
}

uint64_t static OverviewTableViewModel.== infix(_:_:)()
{
  return static OverviewTableViewModel.== infix(_:_:)();
}

uint64_t OverviewTableViewModel.init(rows:)()
{
  return OverviewTableViewModel.init(rows:)();
}

uint64_t type metadata accessor for OverviewTableViewModel()
{
  return type metadata accessor for OverviewTableViewModel();
}

uint64_t CompactOverviewTableView.init(model:columnSpacing:columnHorizontalPadding:showDividerOnFirstRow:)()
{
  return CompactOverviewTableView.init(model:columnSpacing:columnHorizontalPadding:showDividerOnFirstRow:)();
}

uint64_t type metadata accessor for CompactOverviewTableView()
{
  return type metadata accessor for CompactOverviewTableView();
}

uint64_t static DetailChartGradientModel.windGradientModel(startValue:windSpeedUnit:)()
{
  return static DetailChartGradientModel.windGradientModel(startValue:windSpeedUnit:)();
}

uint64_t DetailChartGradientModel.linearGradient(minValue:maxValue:colorSchemeContrast:)()
{
  return DetailChartGradientModel.linearGradient(minValue:maxValue:colorSchemeContrast:)();
}

uint64_t static DetailChartGradientModel.== infix(_:_:)()
{
  return static DetailChartGradientModel.== infix(_:_:)();
}

uint64_t DetailChartGradientModel.init(gradient:startValue:endValue:)()
{
  return DetailChartGradientModel.init(gradient:startValue:endValue:)();
}

uint64_t type metadata accessor for DetailChartGradientModel()
{
  return type metadata accessor for DetailChartGradientModel();
}

uint64_t DetailChartLollipopPoint.init(x:y:)()
{
  return DetailChartLollipopPoint.init(x:y:)();
}

uint64_t DetailChartLollipopPoint.x.getter()
{
  return DetailChartLollipopPoint.x.getter();
}

uint64_t DetailChartLollipopPoint.y.getter()
{
  return DetailChartLollipopPoint.y.getter();
}

uint64_t type metadata accessor for DetailChartLollipopPoint()
{
  return type metadata accessor for DetailChartLollipopPoint();
}

uint64_t type metadata accessor for OverviewTableValueString()
{
  return type metadata accessor for OverviewTableValueString();
}

uint64_t dispatch thunk of DaylightStringBuilderType.makeDaylightString(for:sunEvents:timeZone:calendar:)()
{
  return dispatch thunk of DaylightStringBuilderType.makeDaylightString(for:sunEvents:timeZone:calendar:)();
}

uint64_t OverviewTableRowViewModel.init(id:title:value:shouldDividerHavePadding:)()
{
  return OverviewTableRowViewModel.init(id:title:value:shouldDividerHavePadding:)();
}

{
  return OverviewTableRowViewModel.init(id:title:value:shouldDividerHavePadding:)();
}

uint64_t OverviewTableRowViewModel.init(title:value:shouldDividerHavePadding:)()
{
  return OverviewTableRowViewModel.init(title:value:shouldDividerHavePadding:)();
}

uint64_t OverviewTableRowViewModel.value.getter()
{
  return OverviewTableRowViewModel.value.getter();
}

uint64_t type metadata accessor for OverviewTableRowViewModel()
{
  return type metadata accessor for OverviewTableRowViewModel();
}

uint64_t HumidityTitleStringBuilder.init()()
{
  return HumidityTitleStringBuilder.init()();
}

uint64_t type metadata accessor for HumidityTitleStringBuilder()
{
  return type metadata accessor for HumidityTitleStringBuilder();
}

uint64_t dispatch thunk of SunElevationCalculatorType.getElevation(for:on:)()
{
  return dispatch thunk of SunElevationCalculatorType.getElevation(for:on:)();
}

uint64_t dispatch thunk of PrecipitationCalculatorType.findUniquePrecipitation(currentWeather:dailyForecast:)()
{
  return dispatch thunk of PrecipitationCalculatorType.findUniquePrecipitation(currentWeather:dailyForecast:)();
}

uint64_t dispatch thunk of PrecipitationCalculatorType.apparentPrecipitationIntensityForDisplay(from:)()
{
  return dispatch thunk of PrecipitationCalculatorType.apparentPrecipitationIntensityForDisplay(from:)();
}

uint64_t dispatch thunk of UVISummaryStringBuilderType.makeTodayDescription(from:timeZone:currentUVIndex:hourlyForecast:)()
{
  return dispatch thunk of UVISummaryStringBuilderType.makeTodayDescription(from:timeZone:currentUVIndex:hourlyForecast:)();
}

uint64_t CurrentMarkerValueCalculator.init(midpointInterpolator:detailChartDataPointValueCalculator:)()
{
  return CurrentMarkerValueCalculator.init(midpointInterpolator:detailChartDataPointValueCalculator:)();
}

uint64_t type metadata accessor for CurrentMarkerValueCalculator()
{
  return type metadata accessor for CurrentMarkerValueCalculator();
}

uint64_t PrecipitationTotalHeroString.isDescriptionAllowedToShowNext24HourTotal.getter()
{
  return PrecipitationTotalHeroString.isDescriptionAllowedToShowNext24HourTotal.getter();
}

uint64_t PrecipitationTotalHeroString.shortSubtitle.getter()
{
  return PrecipitationTotalHeroString.shortSubtitle.getter();
}

uint64_t PrecipitationTotalHeroString.type.getter()
{
  return PrecipitationTotalHeroString.type.getter();
}

uint64_t PrecipitationTotalHeroString.amount.getter()
{
  return PrecipitationTotalHeroString.amount.getter();
}

uint64_t type metadata accessor for PrecipitationTotalHeroString()
{
  return type metadata accessor for PrecipitationTotalHeroString();
}

uint64_t SunriseSunsetChartBackground.opacity.getter()
{
  return SunriseSunsetChartBackground.opacity.getter();
}

uint64_t SunriseSunsetChartBackground.gradient.getter()
{
  return SunriseSunsetChartBackground.gradient.getter();
}

uint64_t SunriseSunsetChartBackground.init(gradient:opacity:)()
{
  return SunriseSunsetChartBackground.init(gradient:opacity:)();
}

uint64_t type metadata accessor for SunriseSunsetChartBackground()
{
  return type metadata accessor for SunriseSunsetChartBackground();
}

uint64_t WindChartHeaderStringBuilder.init()()
{
  return WindChartHeaderStringBuilder.init()();
}

uint64_t type metadata accessor for WindChartHeaderStringBuilder()
{
  return type metadata accessor for WindChartHeaderStringBuilder();
}

uint64_t dispatch thunk of WindPlatterStringBuilderType.makeSummaryString(currentWeather:extrema:secondaryValueExtrema:date:calendar:timeZone:units:)()
{
  return dispatch thunk of WindPlatterStringBuilderType.makeSummaryString(currentWeather:extrema:secondaryValueExtrema:date:calendar:timeZone:units:)();
}

uint64_t static WindComponentCompassViewModel.== infix(_:_:)()
{
  return static WindComponentCompassViewModel.== infix(_:_:)();
}

uint64_t WindComponentCompassViewModel.init(style:angle:primaryLabel:secondaryLabel:primaryLabelLineLimit:northString:eastString:southString:westString:)()
{
  return WindComponentCompassViewModel.init(style:angle:primaryLabel:secondaryLabel:primaryLabelLineLimit:northString:eastString:southString:westString:)();
}

uint64_t type metadata accessor for WindComponentCompassViewModel()
{
  return type metadata accessor for WindComponentCompassViewModel();
}

uint64_t WindComponentCompassViewStyle.canPrimaryLabelShowWindDirection.getter()
{
  return WindComponentCompassViewStyle.canPrimaryLabelShowWindDirection.getter();
}

uint64_t type metadata accessor for WindComponentCompassViewStyle()
{
  return type metadata accessor for WindComponentCompassViewStyle();
}

uint64_t dispatch thunk of HumidityTitleStringBuilderType.makeAttributedHumidityString(_:symbolFont:symbolColor:symbolSpacing:)()
{
  return dispatch thunk of HumidityTitleStringBuilderType.makeAttributedHumidityString(_:symbolFont:symbolColor:symbolSpacing:)();
}

uint64_t PrecipitationTotalStringAmount.formattedAccessibleString.getter()
{
  return PrecipitationTotalStringAmount.formattedAccessibleString.getter();
}

uint64_t PrecipitationTotalStringAmount.formattedString.getter()
{
  return PrecipitationTotalStringAmount.formattedString.getter();
}

uint64_t type metadata accessor for PrecipitationTotalStringAmount()
{
  return type metadata accessor for PrecipitationTotalStringAmount();
}

uint64_t static ChartViewModelInterpolationMode.== infix(_:_:)()
{
  return static ChartViewModelInterpolationMode.== infix(_:_:)();
}

uint64_t type metadata accessor for ChartViewModelInterpolationMode()
{
  return type metadata accessor for ChartViewModelInterpolationMode();
}

uint64_t type metadata accessor for ConditionDetailChartHeaderInput.HeaderKind()
{
  return type metadata accessor for ConditionDetailChartHeaderInput.HeaderKind();
}

uint64_t static ConditionDetailChartHeaderInput.== infix(_:_:)()
{
  return static ConditionDetailChartHeaderInput.== infix(_:_:)();
}

uint64_t ConditionDetailChartHeaderInput.init(kind:condition:hourlyForecast:selectedDate:timeZone:)()
{
  return ConditionDetailChartHeaderInput.init(kind:condition:hourlyForecast:selectedDate:timeZone:)();
}

uint64_t ConditionDetailChartHeaderInput.condition.getter()
{
  return ConditionDetailChartHeaderInput.condition.getter();
}

uint64_t type metadata accessor for ConditionDetailChartHeaderInput()
{
  return type metadata accessor for ConditionDetailChartHeaderInput();
}

uint64_t SunriseSunsetDetailChartContent.init(model:style:sampleBlocks:)()
{
  return SunriseSunsetDetailChartContent.init(model:style:sampleBlocks:)();
}

uint64_t type metadata accessor for SunriseSunsetDetailChartContent()
{
  return type metadata accessor for SunriseSunsetDetailChartContent();
}

uint64_t UVIndexChartHeaderStringBuilder.init()()
{
  return UVIndexChartHeaderStringBuilder.init()();
}

uint64_t type metadata accessor for UVIndexChartHeaderStringBuilder()
{
  return type metadata accessor for UVIndexChartHeaderStringBuilder();
}

uint64_t dispatch thunk of CurrentMarkerValueCalculatorType.value(for:hourlyWeather:currentWeather:dayWeather:units:timeZone:maxRange:interpolationMode:)()
{
  return dispatch thunk of CurrentMarkerValueCalculatorType.value(for:hourlyWeather:currentWeather:dayWeather:units:timeZone:maxRange:interpolationMode:)();
}

uint64_t HumidityChartHeaderStringBuilder.init(humidityTitleStringBuilder:)()
{
  return HumidityChartHeaderStringBuilder.init(humidityTitleStringBuilder:)();
}

uint64_t type metadata accessor for HumidityChartHeaderStringBuilder()
{
  return type metadata accessor for HumidityChartHeaderStringBuilder();
}

uint64_t dispatch thunk of HumidityPlatterStringBuilderType.makeL2SummaryString(hourlyForecast:dayWeather:date:calendar:timeZone:units:)()
{
  return dispatch thunk of HumidityPlatterStringBuilderType.makeL2SummaryString(hourlyForecast:dayWeather:date:calendar:timeZone:units:)();
}

uint64_t PressureChartHeaderStringBuilder.init()()
{
  return PressureChartHeaderStringBuilder.init()();
}

uint64_t type metadata accessor for PressureChartHeaderStringBuilder()
{
  return type metadata accessor for PressureChartHeaderStringBuilder();
}

uint64_t dispatch thunk of PressurePlatterStringBuilderType.makeFutureDayString(for:hourlyForecast:extrema:timeZone:units:)()
{
  return dispatch thunk of PressurePlatterStringBuilderType.makeFutureDayString(for:hourlyForecast:extrema:timeZone:units:)();
}

uint64_t dispatch thunk of PressurePlatterStringBuilderType.makeYesterdayString(for:hourlyForecast:extrema:timeZone:units:)()
{
  return dispatch thunk of PressurePlatterStringBuilderType.makeYesterdayString(for:hourlyForecast:extrema:timeZone:units:)();
}

uint64_t dispatch thunk of PressurePlatterStringBuilderType.makeTodayString(from:hourlyForecast:extrema:timeZone:units:)()
{
  return dispatch thunk of PressurePlatterStringBuilderType.makeTodayString(from:hourlyForecast:extrema:timeZone:units:)();
}

uint64_t dispatch thunk of AirQualityDetailStringBuilderType.attributionDescription(for:)()
{
  return dispatch thunk of AirQualityDetailStringBuilderType.attributionDescription(for:)();
}

uint64_t SunriseSunsetDetailChartViewModel.SunEventAccessibilityModel.label.getter()
{
  return SunriseSunsetDetailChartViewModel.SunEventAccessibilityModel.label.getter();
}

uint64_t SunriseSunsetDetailChartViewModel.SunEventAccessibilityModel.value.getter()
{
  return SunriseSunsetDetailChartViewModel.SunEventAccessibilityModel.value.getter();
}

uint64_t type metadata accessor for SunriseSunsetDetailChartViewModel.SunEventAccessibilityModel()
{
  return type metadata accessor for SunriseSunsetDetailChartViewModel.SunEventAccessibilityModel();
}

uint64_t SunriseSunsetDetailChartViewModel.chartMaxYValue.getter()
{
  return SunriseSunsetDetailChartViewModel.chartMaxYValue.getter();
}

uint64_t SunriseSunsetDetailChartViewModel.chartMinYValue.getter()
{
  return SunriseSunsetDetailChartViewModel.chartMinYValue.getter();
}

uint64_t SunriseSunsetDetailChartViewModel.chartBackground.getter()
{
  return SunriseSunsetDetailChartViewModel.chartBackground.getter();
}

uint64_t SunriseSunsetDetailChartViewModel.shouldTriggerHaptic(currentDate:previousDate:)()
{
  return SunriseSunsetDetailChartViewModel.shouldTriggerHaptic(currentDate:previousDate:)();
}

uint64_t SunriseSunsetDetailChartViewModel.sunEventAccessibilityModels.getter()
{
  return SunriseSunsetDetailChartViewModel.sunEventAccessibilityModels.getter();
}

uint64_t static SunriseSunsetDetailChartViewModel.== infix(_:_:)()
{
  return static SunriseSunsetDetailChartViewModel.== infix(_:_:)();
}

uint64_t SunriseSunsetDetailChartViewModel.xDomain.getter()
{
  return SunriseSunsetDetailChartViewModel.xDomain.getter();
}

uint64_t SunriseSunsetDetailChartViewModel.location.getter()
{
  return SunriseSunsetDetailChartViewModel.location.getter();
}

uint64_t SunriseSunsetDetailChartViewModel.init(chartData:sunLocation:location:twilightCivil:twilightNautical:twilightAstronomical:startDate:sunEventAccessibilityModels:chartBackground:)()
{
  return SunriseSunsetDetailChartViewModel.init(chartData:sunLocation:location:twilightCivil:twilightNautical:twilightAstronomical:startDate:sunEventAccessibilityModels:chartBackground:)();
}

uint64_t SunriseSunsetDetailChartViewModel.chartData.getter()
{
  return SunriseSunsetDetailChartViewModel.chartData.getter();
}

uint64_t type metadata accessor for SunriseSunsetDetailChartViewModel()
{
  return type metadata accessor for SunriseSunsetDetailChartViewModel();
}

uint64_t WindComponentCompassContainerView.init(model:showCircleOutline:primaryLabelFont:secondaryLabelFont:)()
{
  return WindComponentCompassContainerView.init(model:showCircleOutline:primaryLabelFont:secondaryLabelFont:)();
}

uint64_t type metadata accessor for WindComponentCompassContainerView()
{
  return type metadata accessor for WindComponentCompassContainerView();
}

uint64_t dispatch thunk of ConditionsPlatterStringBuilderType.makeForecastPlatterWeatherDescription(from:timeZone:dayWeather:currentWeather:hourlyForecast:dailyForecast:weatherChanges:units:)()
{
  return dispatch thunk of ConditionsPlatterStringBuilderType.makeForecastPlatterWeatherDescription(from:timeZone:dayWeather:currentWeather:hourlyForecast:dailyForecast:weatherChanges:units:)();
}

uint64_t dispatch thunk of ConditionsPlatterStringBuilderType.makeDailySummaryPlatterWeatherDescription(from:timeZone:hourlyForecast:dayWeather:isYesterday:units:)()
{
  return dispatch thunk of ConditionsPlatterStringBuilderType.makeDailySummaryPlatterWeatherDescription(from:timeZone:hourlyForecast:dayWeather:isYesterday:units:)();
}

uint64_t PrecipitationTotalPlatterViewModel.RowModel.colorModel.getter()
{
  return PrecipitationTotalPlatterViewModel.RowModel.colorModel.getter();
}

uint64_t PrecipitationTotalPlatterViewModel.RowModel.accessibilityLabel.getter()
{
  return PrecipitationTotalPlatterViewModel.RowModel.accessibilityLabel.getter();
}

uint64_t PrecipitationTotalPlatterViewModel.RowModel.accessibilityAmount.getter()
{
  return PrecipitationTotalPlatterViewModel.RowModel.accessibilityAmount.getter();
}

uint64_t PrecipitationTotalPlatterViewModel.RowModel.label.getter()
{
  return PrecipitationTotalPlatterViewModel.RowModel.label.getter();
}

uint64_t PrecipitationTotalPlatterViewModel.RowModel.amount.getter()
{
  return PrecipitationTotalPlatterViewModel.RowModel.amount.getter();
}

uint64_t type metadata accessor for PrecipitationTotalPlatterViewModel.RowModel()
{
  return type metadata accessor for PrecipitationTotalPlatterViewModel.RowModel();
}

uint64_t PrecipitationTotalPlatterViewModel.ColorModel.color.getter()
{
  return PrecipitationTotalPlatterViewModel.ColorModel.color.getter();
}

uint64_t type metadata accessor for PrecipitationTotalPlatterViewModel.ColorModel()
{
  return type metadata accessor for PrecipitationTotalPlatterViewModel.ColorModel();
}

uint64_t PrecipitationTotalPlatterViewModel.SectionModel.rows.getter()
{
  return PrecipitationTotalPlatterViewModel.SectionModel.rows.getter();
}

uint64_t PrecipitationTotalPlatterViewModel.SectionModel.title.getter()
{
  return PrecipitationTotalPlatterViewModel.SectionModel.title.getter();
}

uint64_t type metadata accessor for PrecipitationTotalPlatterViewModel.SectionModel()
{
  return type metadata accessor for PrecipitationTotalPlatterViewModel.SectionModel();
}

uint64_t static PrecipitationTotalPlatterViewModel.== infix(_:_:)()
{
  return static PrecipitationTotalPlatterViewModel.== infix(_:_:)();
}

uint64_t PrecipitationTotalPlatterViewModel.sections.getter()
{
  return PrecipitationTotalPlatterViewModel.sections.getter();
}

uint64_t type metadata accessor for PrecipitationTotalPlatterViewModel()
{
  return type metadata accessor for PrecipitationTotalPlatterViewModel();
}

uint64_t SevereAlertComponentStringsBuilder.longAlertDescription(for:location:)()
{
  return SevereAlertComponentStringsBuilder.longAlertDescription(for:location:)();
}

uint64_t SevereAlertComponentStringsBuilder.SevereAlertSummary.description.getter()
{
  return SevereAlertComponentStringsBuilder.SevereAlertSummary.description.getter();
}

uint64_t SevereAlertComponentStringsBuilder.SevereAlertSummary.footer.getter()
{
  return SevereAlertComponentStringsBuilder.SevereAlertSummary.footer.getter();
}

uint64_t type metadata accessor for SevereAlertComponentStringsBuilder.SevereAlertSummary()
{
  return type metadata accessor for SevereAlertComponentStringsBuilder.SevereAlertSummary();
}

uint64_t SevereAlertComponentStringsBuilder.descriptions(for:location:currentDate:bulletString:)()
{
  return SevereAlertComponentStringsBuilder.descriptions(for:location:currentDate:bulletString:)();
}

Swift::String __swiftcall SevereAlertComponentStringsBuilder.title(for:characterLimit:)(Swift::OpaquePointer a1, Swift::Int characterLimit)
{
  uint64_t v2 = SevereAlertComponentStringsBuilder.title(for:characterLimit:)(a1._rawValue, characterLimit);
  result._uint64_t object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t SevereAlertComponentStringsBuilder.summary(alertDescriptions:events:location:currentDate:)()
{
  return SevereAlertComponentStringsBuilder.summary(alertDescriptions:events:location:currentDate:)();
}

uint64_t SevereAlertComponentStringsBuilder.init()()
{
  return SevereAlertComponentStringsBuilder.init()();
}

uint64_t type metadata accessor for SevereAlertComponentStringsBuilder()
{
  return type metadata accessor for SevereAlertComponentStringsBuilder();
}

uint64_t UVIndexComponentDescriptionContext.init(currentWeather:dailyForecast:hourlyForecast:timeZone:)()
{
  return UVIndexComponentDescriptionContext.init(currentWeather:dailyForecast:hourlyForecast:timeZone:)();
}

uint64_t type metadata accessor for UVIndexComponentDescriptionContext()
{
  return type metadata accessor for UVIndexComponentDescriptionContext();
}

uint64_t VisibilityChartHeaderStringBuilder.init()()
{
  return VisibilityChartHeaderStringBuilder.init()();
}

uint64_t type metadata accessor for VisibilityChartHeaderStringBuilder()
{
  return type metadata accessor for VisibilityChartHeaderStringBuilder();
}

uint64_t dispatch thunk of VisibilityPlatterStringBuilderType.makeSummaryString(currentWeather:extrema:date:calendar:timeZone:units:)()
{
  return dispatch thunk of VisibilityPlatterStringBuilderType.makeSummaryString(currentWeather:extrema:date:calendar:timeZone:units:)();
}

uint64_t dispatch thunk of VisibilityPlatterStringBuilderType.makeVisibilityWithUnitString(visibility:units:)()
{
  return dispatch thunk of VisibilityPlatterStringBuilderType.makeVisibilityWithUnitString(visibility:units:)();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStyleType.title1Font.getter()
{
  return dispatch thunk of ConditionDetailChartHeaderStyleType.title1Font.getter();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStyleType.title2Font.getter()
{
  return dispatch thunk of ConditionDetailChartHeaderStyleType.title2Font.getter();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStyleType.title3Font.getter()
{
  return dispatch thunk of ConditionDetailChartHeaderStyleType.title3Font.getter();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStyleType.topPadding.getter()
{
  return dispatch thunk of ConditionDetailChartHeaderStyleType.topPadding.getter();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStyleType.title1Color.getter()
{
  return dispatch thunk of ConditionDetailChartHeaderStyleType.title1Color.getter();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStyleType.title2Color.getter()
{
  return dispatch thunk of ConditionDetailChartHeaderStyleType.title2Color.getter();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStyleType.title3Color.getter()
{
  return dispatch thunk of ConditionDetailChartHeaderStyleType.title3Color.getter();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStyleType.bottomPadding.getter()
{
  return dispatch thunk of ConditionDetailChartHeaderStyleType.bottomPadding.getter();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStyleType.preferredHeight.getter()
{
  return dispatch thunk of ConditionDetailChartHeaderStyleType.preferredHeight.getter();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStyleType.subtitleFontWeight.getter()
{
  return dispatch thunk of ConditionDetailChartHeaderStyleType.subtitleFontWeight.getter();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStyleType.title2LeadingPadding.getter()
{
  return dispatch thunk of ConditionDetailChartHeaderStyleType.title2LeadingPadding.getter();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStyleType.title3LeadingPadding.getter()
{
  return dispatch thunk of ConditionDetailChartHeaderStyleType.title3LeadingPadding.getter();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStyleType.applySecondaryTextScaleToTitle2.getter()
{
  return dispatch thunk of ConditionDetailChartHeaderStyleType.applySecondaryTextScaleToTitle2.getter();
}

uint64_t TemperatureChartHeaderStringBuilder.init()()
{
  return TemperatureChartHeaderStringBuilder.init()();
}

uint64_t type metadata accessor for TemperatureChartHeaderStringBuilder()
{
  return type metadata accessor for TemperatureChartHeaderStringBuilder();
}

uint64_t ChanceOfRainChartHeaderStringBuilder.init()()
{
  return ChanceOfRainChartHeaderStringBuilder.init()();
}

uint64_t type metadata accessor for ChanceOfRainChartHeaderStringBuilder()
{
  return type metadata accessor for ChanceOfRainChartHeaderStringBuilder();
}

uint64_t SunriseSunsetDetailChartContentStyle.horizonLineWidth.getter()
{
  return SunriseSunsetDetailChartContentStyle.horizonLineWidth.getter();
}

uint64_t SunriseSunsetDetailChartContentStyle.TwilightSunColors.init(twilightCivil:twilightNautical:twilightAstronomical:)()
{
  return SunriseSunsetDetailChartContentStyle.TwilightSunColors.init(twilightCivil:twilightNautical:twilightAstronomical:)();
}

uint64_t type metadata accessor for SunriseSunsetDetailChartContentStyle.TwilightSunColors()
{
  return type metadata accessor for SunriseSunsetDetailChartContentStyle.TwilightSunColors();
}

uint64_t SunriseSunsetDetailChartContentStyle.init(nightLineGradient:dayLineGradient:daySunImage:nightSunImage:dayNightLineWidth:horizonLineWidth:horizonLineColor:horizonLineShadow:sunImageWidth:nightSunColor:nightSunSymbolSize:twilightSunColors:twilightSunSymbolSize:)()
{
  return SunriseSunsetDetailChartContentStyle.init(nightLineGradient:dayLineGradient:daySunImage:nightSunImage:dayNightLineWidth:horizonLineWidth:horizonLineColor:horizonLineShadow:sunImageWidth:nightSunColor:nightSunSymbolSize:twilightSunColors:twilightSunSymbolSize:)();
}

uint64_t static SunriseSunsetDetailChartContentStyle.defaultDayLineGradient.getter()
{
  return static SunriseSunsetDetailChartContentStyle.defaultDayLineGradient.getter();
}

uint64_t static SunriseSunsetDetailChartContentStyle.defaultNightLineGradient.getter()
{
  return static SunriseSunsetDetailChartContentStyle.defaultNightLineGradient.getter();
}

uint64_t type metadata accessor for SunriseSunsetDetailChartContentStyle()
{
  return type metadata accessor for SunriseSunsetDetailChartContentStyle();
}

uint64_t ConditionDetailChartHeaderStringModel.reverseChartTitle.getter()
{
  return ConditionDetailChartHeaderStringModel.reverseChartTitle.getter();
}

uint64_t ConditionDetailChartHeaderStringModel.symbolName.getter()
{
  return ConditionDetailChartHeaderStringModel.symbolName.getter();
}

uint64_t ConditionDetailChartHeaderStringModel.accessibilityDescription.getter()
{
  return ConditionDetailChartHeaderStringModel.accessibilityDescription.getter();
}

uint64_t ConditionDetailChartHeaderStringModel.subtitleTruncationAlternative.getter()
{
  return ConditionDetailChartHeaderStringModel.subtitleTruncationAlternative.getter();
}

uint64_t static ConditionDetailChartHeaderStringModel.== infix(_:_:)()
{
  return static ConditionDetailChartHeaderStringModel.== infix(_:_:)();
}

uint64_t ConditionDetailChartHeaderStringModel.title1.getter()
{
  return ConditionDetailChartHeaderStringModel.title1.getter();
}

uint64_t ConditionDetailChartHeaderStringModel.title2.getter()
{
  return ConditionDetailChartHeaderStringModel.title2.getter();
}

uint64_t ConditionDetailChartHeaderStringModel.title3.getter()
{
  return ConditionDetailChartHeaderStringModel.title3.getter();
}

uint64_t ConditionDetailChartHeaderStringModel.subtitle.getter()
{
  return ConditionDetailChartHeaderStringModel.subtitle.getter();
}

uint64_t type metadata accessor for ConditionDetailChartHeaderStringModel()
{
  return type metadata accessor for ConditionDetailChartHeaderStringModel();
}

uint64_t dispatch thunk of DetailChartSeriesValuesCalculatorType.seriesValuesByCondition(conditions:calendar:now:currentWeather:minuteForecast:hourlyForecast:dayWeather:units:timeZone:)()
{
  return dispatch thunk of DetailChartSeriesValuesCalculatorType.seriesValuesByCondition(conditions:calendar:now:currentWeather:minuteForecast:hourlyForecast:dayWeather:units:timeZone:)();
}

uint64_t dispatch thunk of DetailChartSeriesValuesCalculatorType.calculateSelectedSecondaryExtrema(condition:primaryChartCondition:interpolationMode:hourlyForecast:units:date:)()
{
  return dispatch thunk of DetailChartSeriesValuesCalculatorType.calculateSelectedSecondaryExtrema(condition:primaryChartCondition:interpolationMode:hourlyForecast:units:date:)();
}

uint64_t dispatch thunk of PrecipitationPlatterStringBuilderType.makeFutureDayString(for:dayWeather:timeZone:units:)()
{
  return dispatch thunk of PrecipitationPlatterStringBuilderType.makeFutureDayString(for:dayWeather:timeZone:units:)();
}

uint64_t dispatch thunk of PrecipitationPlatterStringBuilderType.makeYesterdayString(for:dayWeather:timeZone:units:)()
{
  return dispatch thunk of PrecipitationPlatterStringBuilderType.makeYesterdayString(for:dayWeather:timeZone:units:)();
}

uint64_t dispatch thunk of PrecipitationPlatterStringBuilderType.makeTodayString(from:dayWeather:dailyForecast:hourlyForecast:timeZone:)()
{
  return dispatch thunk of PrecipitationPlatterStringBuilderType.makeTodayString(from:dayWeather:dailyForecast:hourlyForecast:timeZone:)();
}

uint64_t dispatch thunk of SunriseSunsetTableViewModelFactoryType.makeViewModel(from:timeZone:calendar:)()
{
  return dispatch thunk of SunriseSunsetTableViewModelFactoryType.makeViewModel(from:timeZone:calendar:)();
}

uint64_t dispatch thunk of SunriseSunsetTableViewModelFactoryType.makePolarViewModel(from:forecast:timeZone:calendar:type:)()
{
  return dispatch thunk of SunriseSunsetTableViewModelFactoryType.makePolarViewModel(from:forecast:timeZone:calendar:type:)();
}

uint64_t dispatch thunk of DetailChartDataPointValueCalculatorType.accessibilityValueDescription(for:)()
{
  return dispatch thunk of DetailChartDataPointValueCalculatorType.accessibilityValueDescription(for:)();
}

uint64_t dispatch thunk of DetailChartDataPointValueCalculatorType.value(for:)()
{
  return dispatch thunk of DetailChartDataPointValueCalculatorType.value(for:)();
}

uint64_t dispatch thunk of PrecipitationTotalHeroStringBuilderType.buildTodayString(currentWeather:hourlyForecast:dayWeather:timeZone:)()
{
  return dispatch thunk of PrecipitationTotalHeroStringBuilderType.buildTodayString(currentWeather:hourlyForecast:dayWeather:timeZone:)();
}

uint64_t SunriseSunsetPolarSunEventStringBuilder.makeString(for:currentDate:nextEvent:timeZone:)()
{
  return SunriseSunsetPolarSunEventStringBuilder.makeString(for:currentDate:nextEvent:timeZone:)();
}

uint64_t SunriseSunsetPolarSunEventStringBuilder.makeTitle(currentDate:nextEvent:timeZone:)()
{
  return SunriseSunsetPolarSunEventStringBuilder.makeTitle(currentDate:nextEvent:timeZone:)();
}

uint64_t SunriseSunsetPolarSunEventStringBuilder.init()()
{
  return SunriseSunsetPolarSunEventStringBuilder.init()();
}

uint64_t type metadata accessor for SunriseSunsetPolarSunEventStringBuilder()
{
  return type metadata accessor for SunriseSunsetPolarSunEventStringBuilder();
}

uint64_t PrecipitationComponentDescriptionContext.init(currentWeather:dailyForecast:hourlyForecast:timeZone:heroStringPrecipitationType:isAllowedToShowNext24HourTotal:)()
{
  return PrecipitationComponentDescriptionContext.init(currentWeather:dailyForecast:hourlyForecast:timeZone:heroStringPrecipitationType:isAllowedToShowNext24HourTotal:)();
}

uint64_t type metadata accessor for PrecipitationComponentDescriptionContext()
{
  return type metadata accessor for PrecipitationComponentDescriptionContext();
}

uint64_t SunriseSunsetDetailChartViewModelFactory.init(sunElevationCalculator:chartBackgroundFactory:)()
{
  return SunriseSunsetDetailChartViewModelFactory.init(sunElevationCalculator:chartBackgroundFactory:)();
}

uint64_t type metadata accessor for SunriseSunsetDetailChartViewModelFactory()
{
  return type metadata accessor for SunriseSunsetDetailChartViewModelFactory();
}

uint64_t PrecipitationTotalChartHeaderStringBuilder.init(precipitationTotalHeroStringBuilder:)()
{
  return PrecipitationTotalChartHeaderStringBuilder.init(precipitationTotalHeroStringBuilder:)();
}

uint64_t type metadata accessor for PrecipitationTotalChartHeaderStringBuilder()
{
  return type metadata accessor for PrecipitationTotalChartHeaderStringBuilder();
}

uint64_t dispatch thunk of ConditionDetailChartHeaderStringBuilderType.makeModel(from:units:extrema:secondaryValueExtrema:style:)()
{
  return dispatch thunk of ConditionDetailChartHeaderStringBuilderType.makeModel(from:units:extrema:secondaryValueExtrema:style:)();
}

uint64_t dispatch thunk of SunriseSunsetDetailChartViewModelFactoryType.makeViewModel(location:startDate:numberOfMinutesShownOnChart:currentWeather:sunEvents:cachedElevations:cachedDateHoursString:)()
{
  return dispatch thunk of SunriseSunsetDetailChartViewModelFactoryType.makeViewModel(location:startDate:numberOfMinutesShownOnChart:currentWeather:sunEvents:cachedElevations:cachedDateHoursString:)();
}

uint64_t TemperatureFeelsLikeChartHeaderStringBuilder.init()()
{
  return TemperatureFeelsLikeChartHeaderStringBuilder.init()();
}

uint64_t type metadata accessor for TemperatureFeelsLikeChartHeaderStringBuilder()
{
  return type metadata accessor for TemperatureFeelsLikeChartHeaderStringBuilder();
}

uint64_t dispatch thunk of PrecipitationTotalPlatterViewModelFactoryType.makeModel(currentWeather:dayWeather:unit:timeZone:)()
{
  return dispatch thunk of PrecipitationTotalPlatterViewModelFactoryType.makeModel(currentWeather:dayWeather:unit:timeZone:)();
}

uint64_t DayPhase.uppercaseDescription.getter()
{
  return DayPhase.uppercaseDescription.getter();
}

uint64_t DayPhase.init(sunEvents:date:elevation:)()
{
  return DayPhase.init(sunEvents:date:elevation:)();
}

uint64_t type metadata accessor for DayPhase()
{
  return type metadata accessor for DayPhase();
}

uint64_t ChartKind.isBarChart.getter()
{
  return ChartKind.isBarChart.getter();
}

uint64_t ChartKind.isContinuous.getter()
{
  return ChartKind.isContinuous.getter();
}

uint64_t ChartKind.showSecondLine.getter()
{
  return ChartKind.showSecondLine.getter();
}

uint64_t static ChartKind.== infix(_:_:)()
{
  return static ChartKind.== infix(_:_:)();
}

uint64_t type metadata accessor for ChartKind()
{
  return type metadata accessor for ChartKind();
}

uint64_t static PolarType.== infix(_:_:)()
{
  return static PolarType.== infix(_:_:)();
}

uint64_t type metadata accessor for PolarType()
{
  return type metadata accessor for PolarType();
}

uint64_t _RegexFactory.accumulate<A, B, C>(_:_:)()
{
  return _RegexFactory.accumulate<A, B, C>(_:_:)();
}

uint64_t _RegexFactory.zeroOrMore<A, B>(_:_:)()
{
  return _RegexFactory.zeroOrMore<A, B>(_:_:)();
}

uint64_t _RegexFactory.ignoreCapturesInTypedOutput<A>(_:)()
{
  return _RegexFactory.ignoreCapturesInTypedOutput<A>(_:)();
}

uint64_t _RegexFactory.capture<A, B>(_:)()
{
  return _RegexFactory.capture<A, B>(_:)();
}

uint64_t _RegexFactory.oneOrMore<A, B>(_:_:)()
{
  return _RegexFactory.oneOrMore<A, B>(_:_:)();
}

uint64_t type metadata accessor for _RegexFactory()
{
  return type metadata accessor for _RegexFactory();
}

uint64_t static RegexComponent<>.digit.getter()
{
  return static RegexComponent<>.digit.getter();
}

uint64_t type metadata accessor for RegexRepetitionBehavior()
{
  return type metadata accessor for RegexRepetitionBehavior();
}

uint64_t Regex.init(_regexString:version:)()
{
  return Regex.init(_regexString:version:)();
}

uint64_t Regex.init<A>(_:)()
{
  return Regex.init<A>(_:)();
}

uint64_t Regex.wholeMatch(in:)()
{
  return Regex.wholeMatch(in:)();
}

uint64_t Regex.Match.subscript.getter()
{
  return Regex.Match.subscript.getter();
}

uint64_t Regex.Match.output.getter()
{
  return Regex.Match.output.getter();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return os_signpost(_:dso:log:name:signpostID:_:_:)();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t OSSignpostID.init(log:)()
{
  return OSSignpostID.init(log:)();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OSSignpostID.init(_:)()
{
  return OSSignpostID.init(_:)();
}

uint64_t static Logger.activeUser.getter()
{
  return static Logger.activeUser.getter();
}

uint64_t static Logger.automation.getter()
{
  return static Logger.automation.getter();
}

uint64_t static Logger.savedLocations.getter()
{
  return static Logger.savedLocations.getter();
}

uint64_t static Logger.locale.getter()
{
  return static Logger.locale.getter();
}

uint64_t static Logger.geocode.getter()
{
  return static Logger.geocode.getter();
}

uint64_t static Logger.intents.getter()
{
  return static Logger.intents.getter();
}

uint64_t static Logger.privacy.getter()
{
  return static Logger.privacy.getter();
}

uint64_t static Logger.identity.getter()
{
  return static Logger.identity.getter();
}

uint64_t static Logger.mapNetwork.getter()
{
  return static Logger.mapNetwork.getter();
}

uint64_t static Logger.map.getter()
{
  return static Logger.map.getter();
}

uint64_t static Logger.airPollutant.getter()
{
  return static Logger.airPollutant.getter();
}

uint64_t static Logger.sunriseSunset.getter()
{
  return static Logger.sunriseSunset.getter();
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

uint64_t dispatch thunk of VFXScene.effects.getter()
{
  return dispatch thunk of VFXScene.effects.getter();
}

uint64_t dispatch thunk of VFXEffect.scene.getter()
{
  return dispatch thunk of VFXEffect.scene.getter();
}

uint64_t type metadata accessor for VFXEffect()
{
  return type metadata accessor for VFXEffect();
}

uint64_t type metadata accessor for Expression()
{
  return type metadata accessor for Expression();
}

uint64_t == infix(_:_:)()
{
  return == infix(_:_:)();
}

uint64_t JSON.value.getter()
{
  return JSON.value.getter();
}

uint64_t dispatch thunk of Query.all()()
{
  return dispatch thunk of Query.all()();
}

uint64_t dispatch thunk of Query.first(_:orderBy:)()
{
  return dispatch thunk of Query.first(_:orderBy:)();
}

uint64_t dispatch thunk of Query.where(_:orderBy:limit:)()
{
  return dispatch thunk of Query.where(_:orderBy:limit:)();
}

uint64_t dispatch thunk of Table.query.getter()
{
  return dispatch thunk of Table.query.getter();
}

uint64_t dispatch thunk of Table.delete.getter()
{
  return dispatch thunk of Table.delete.getter();
}

uint64_t dispatch thunk of Column.value.getter()
{
  return dispatch thunk of Column.value.getter();
}

uint64_t dispatch thunk of Delete.all()()
{
  return dispatch thunk of Delete.all()();
}

uint64_t type metadata accessor for OrderBy()
{
  return type metadata accessor for OrderBy();
}

uint64_t Database.Location.path.getter()
{
  return Database.Location.path.getter();
}

uint64_t type metadata accessor for Database.Location()
{
  return type metadata accessor for Database.Location();
}

uint64_t type metadata accessor for DebugModel()
{
  return type metadata accessor for DebugModel();
}

uint64_t DebugBundle.displayVersion.getter()
{
  return DebugBundle.displayVersion.getter();
}

uint64_t DebugBundle.name.getter()
{
  return DebugBundle.name.getter();
}

uint64_t DebugBundle.init(bundle:)()
{
  return DebugBundle.init(bundle:)();
}

uint64_t type metadata accessor for DebugBundle()
{
  return type metadata accessor for DebugBundle();
}

uint64_t static Accessibility.shouldAlwaysShowHoverUI.getter()
{
  return static Accessibility.shouldAlwaysShowHoverUI.getter();
}

uint64_t type metadata accessor for ContainerScope()
{
  return type metadata accessor for ContainerScope();
}

uint64_t ToolbarManager.__allocating_init(commandCenter:template:)()
{
  return ToolbarManager.__allocating_init(commandCenter:template:)();
}

uint64_t type metadata accessor for ToolbarManager()
{
  return type metadata accessor for ToolbarManager();
}

uint64_t dispatch thunk of DebugDataSource.add(_:_:)()
{
  return dispatch thunk of DebugDataSource.add(_:_:)();
}

uint64_t DebugDataSource.init()()
{
  return DebugDataSource.init()();
}

uint64_t type metadata accessor for DebugDataSource()
{
  return type metadata accessor for DebugDataSource();
}

uint64_t type metadata accessor for ToolbarTemplate()
{
  return type metadata accessor for ToolbarTemplate();
}

uint64_t ContainerManager.init(singletonPool:bundleAssemblies:assemblies:)()
{
  return ContainerManager.init(singletonPool:bundleAssemblies:assemblies:)();
}

uint64_t ContainerManager.containerEnvironment.getter()
{
  return ContainerManager.containerEnvironment.getter();
}

uint64_t ContainerManager.container(for:)()
{
  return ContainerManager.container(for:)();
}

uint64_t type metadata accessor for ContainerManager()
{
  return type metadata accessor for ContainerManager();
}

uint64_t JSONTextViewController.init(jsonText:)()
{
  return JSONTextViewController.init(jsonText:)();
}

uint64_t type metadata accessor for JSONTextViewController()
{
  return type metadata accessor for JSONTextViewController();
}

uint64_t AppBackgroundTaskManager.init()()
{
  return AppBackgroundTaskManager.init()();
}

uint64_t type metadata accessor for AppBackgroundTaskManager()
{
  return type metadata accessor for AppBackgroundTaskManager();
}

uint64_t type metadata accessor for DebugNavigationController()
{
  return type metadata accessor for DebugNavigationController();
}

uint64_t ShortcutItemHandlerManager.add(_:)()
{
  return ShortcutItemHandlerManager.add(_:)();
}

Swift::Bool __swiftcall ShortcutItemHandlerManager.handle(shortcutItem:)(UIApplicationShortcutItem shortcutItem)
{
  return ShortcutItemHandlerManager.handle(shortcutItem:)(shortcutItem.super.isa);
}

uint64_t type metadata accessor for ShortcutItemHandlerManager()
{
  return type metadata accessor for ShortcutItemHandlerManager();
}

uint64_t ShortcutItemHandlerPattern.init(predicate:)()
{
  return ShortcutItemHandlerPattern.init(predicate:)();
}

uint64_t type metadata accessor for ShortcutItemHandlerPattern()
{
  return type metadata accessor for ShortcutItemHandlerPattern();
}

uint64_t Debounce.run(finished:)()
{
  return Debounce.run(finished:)();
}

uint64_t Debounce.init(delay:block:)()
{
  return Debounce.init(delay:block:)();
}

uint64_t type metadata accessor for JSONText()
{
  return type metadata accessor for JSONText();
}

uint64_t JSONText.init(_:)()
{
  return JSONText.init(_:)();
}

uint64_t JSONView.init(value:)()
{
  return JSONView.init(value:)();
}

uint64_t type metadata accessor for JSONView()
{
  return type metadata accessor for JSONView();
}

uint64_t DebugItem.init(title:model:)()
{
  return DebugItem.init(title:model:)();
}

uint64_t type metadata accessor for DebugItem()
{
  return type metadata accessor for DebugItem();
}

uint64_t static UIListContentConfiguration.subtitleCell()()
{
  return static UIListContentConfiguration.subtitleCell()();
}

uint64_t UIListContentConfiguration.secondaryText.setter()
{
  return UIListContentConfiguration.secondaryText.setter();
}

uint64_t UIListContentConfiguration.TextProperties.lineBreakMode.setter()
{
  return UIListContentConfiguration.TextProperties.lineBreakMode.setter();
}

uint64_t UIListContentConfiguration.TextProperties.numberOfLines.setter()
{
  return UIListContentConfiguration.TextProperties.numberOfLines.setter();
}

uint64_t UIListContentConfiguration.TextProperties.adjustsFontSizeToFitWidth.setter()
{
  return UIListContentConfiguration.TextProperties.adjustsFontSizeToFitWidth.setter();
}

uint64_t UIListContentConfiguration.TextProperties.color.setter()
{
  return UIListContentConfiguration.TextProperties.color.setter();
}

uint64_t UIListContentConfiguration.textProperties.modify()
{
  return UIListContentConfiguration.textProperties.modify();
}

uint64_t UIListContentConfiguration.secondaryTextProperties.modify()
{
  return UIListContentConfiguration.secondaryTextProperties.modify();
}

uint64_t static UIListContentConfiguration.cell()()
{
  return static UIListContentConfiguration.cell()();
}

uint64_t UIListContentConfiguration.text.setter()
{
  return UIListContentConfiguration.text.setter();
}

uint64_t static UIListContentConfiguration.valueCell()()
{
  return static UIListContentConfiguration.valueCell()();
}

uint64_t type metadata accessor for UIListContentConfiguration()
{
  return type metadata accessor for UIListContentConfiguration();
}

uint64_t ChartProxy.plotAreaSize.getter()
{
  return ChartProxy.plotAreaSize.getter();
}

uint64_t ChartProxy.plotAreaFrame.getter()
{
  return ChartProxy.plotAreaFrame.getter();
}

uint64_t ChartProxy.value<A>(atX:as:)()
{
  return ChartProxy.value<A>(atX:as:)();
}

uint64_t ChartProxy.yDomain<A>(dataType:)()
{
  return ChartProxy.yDomain<A>(dataType:)();
}

uint64_t ChartProxy.plotSize.getter()
{
  return ChartProxy.plotSize.getter();
}

uint64_t ChartProxy.position<A>(forX:)()
{
  return ChartProxy.position<A>(forX:)();
}

uint64_t ChartProxy.position<A>(forY:)()
{
  return ChartProxy.position<A>(forY:)();
}

uint64_t type metadata accessor for ChartProxy()
{
  return type metadata accessor for ChartProxy();
}

uint64_t AxisContent.compositingLayer<A>(style:)()
{
  return AxisContent.compositingLayer<A>(style:)();
}

uint64_t static ScaleDomain<>.automatic<A>(includesZero:reversed:dataType:modifyInferredDomain:)()
{
  return static ScaleDomain<>.automatic<A>(includesZero:reversed:dataType:modifyInferredDomain:)();
}

uint64_t static ScaleDomain<>.automatic(includesZero:reversed:)()
{
  return static ScaleDomain<>.automatic(includesZero:reversed:)();
}

uint64_t AxisGridLine.init(centered:stroke:)()
{
  return AxisGridLine.init(centered:stroke:)();
}

uint64_t type metadata accessor for AxisGridLine()
{
  return type metadata accessor for AxisGridLine();
}

uint64_t static ChartContent._makeChartContent(content:inputs:)()
{
  return static ChartContent._makeChartContent(content:inputs:)();
}

uint64_t static ChartContent._chartContentCount(inputs:)()
{
  return static ChartContent._chartContentCount(inputs:)();
}

uint64_t static ChartContent._layoutChartContent(_:_:)()
{
  return static ChartContent._layoutChartContent(_:_:)();
}

uint64_t static ChartContent._renderChartContent(_:_:)()
{
  return static ChartContent._renderChartContent(_:_:)();
}

uint64_t ChartContent.annotation<A>(position:alignment:spacing:overflowResolution:content:)()
{
  return ChartContent.annotation<A>(position:alignment:spacing:overflowResolution:content:)();
}

uint64_t ChartContent.symbolSize(_:)()
{
  return ChartContent.symbolSize(_:)();
}

uint64_t ChartContent.cornerRadius(_:style:)()
{
  return ChartContent.cornerRadius(_:style:)();
}

uint64_t ChartContent.foregroundStyle<A>(_:)()
{
  return ChartContent.foregroundStyle<A>(_:)();
}

uint64_t ChartContent.accessibilityLabel<A>(_:)()
{
  return ChartContent.accessibilityLabel<A>(_:)();
}

uint64_t ChartContent.accessibilityValue<A>(_:)()
{
  return ChartContent.accessibilityValue<A>(_:)();
}

uint64_t ChartContent.accessibilityHidden(_:)()
{
  return ChartContent.accessibilityHidden(_:)();
}

uint64_t ChartContent.interpolationMethod(_:)()
{
  return ChartContent.interpolationMethod(_:)();
}

uint64_t ChartContent.alignsMarkStylesWithPlotArea(_:)()
{
  return ChartContent.alignsMarkStylesWithPlotArea(_:)();
}

uint64_t ChartContent.mask<A>(content:)()
{
  return ChartContent.mask<A>(content:)();
}

uint64_t ChartContent.offset(x:yStart:yEnd:)()
{
  return ChartContent.offset(x:yStart:yEnd:)();
}

uint64_t ChartContent.shadow(color:radius:x:y:)()
{
  return ChartContent.shadow(color:radius:x:y:)();
}

uint64_t ChartContent.symbol<A>(_:)()
{
  return ChartContent.symbol<A>(_:)();
}

uint64_t ChartContent.blendMode(_:)()
{
  return ChartContent.blendMode(_:)();
}

uint64_t ChartContent.lineStyle(_:)()
{
  return ChartContent.lineStyle(_:)();
}

uint64_t RectangleMark.init<A>(x:yStart:yEnd:width:)()
{
  return RectangleMark.init<A>(x:yStart:yEnd:width:)();
}

uint64_t RectangleMark.init(xStart:xEnd:yStart:yEnd:)()
{
  return RectangleMark.init(xStart:xEnd:yStart:yEnd:)();
}

uint64_t RectangleMark.init<A, B>(xStart:xEnd:yStart:yEnd:)()
{
  return RectangleMark.init<A, B>(xStart:xEnd:yStart:yEnd:)();
}

uint64_t type metadata accessor for RectangleMark()
{
  return type metadata accessor for RectangleMark();
}

uint64_t static AxisMarkPreset.aligned.getter()
{
  return static AxisMarkPreset.aligned.getter();
}

uint64_t static AxisMarkPreset.extended.getter()
{
  return static AxisMarkPreset.extended.getter();
}

uint64_t static AxisMarkPreset.automatic.getter()
{
  return static AxisMarkPreset.automatic.getter();
}

uint64_t type metadata accessor for AxisMarkPreset()
{
  return type metadata accessor for AxisMarkPreset();
}

uint64_t static AxisMarkValues.stride<A>(by:roundLowerBound:roundUpperBound:)()
{
  return static AxisMarkValues.stride<A>(by:roundLowerBound:roundUpperBound:)();
}

uint64_t static AxisMarkValues.stride(by:count:roundLowerBound:roundUpperBound:calendar:)()
{
  return static AxisMarkValues.stride(by:count:roundLowerBound:roundUpperBound:calendar:)();
}

uint64_t static AxisMarkValues.automatic.getter()
{
  return static AxisMarkValues.automatic.getter();
}

uint64_t type metadata accessor for AxisMarkValues()
{
  return type metadata accessor for AxisMarkValues();
}

uint64_t AxisValueLabel.init(centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:content:)()
{
  return AxisValueLabel.init(centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:content:)();
}

uint64_t static PlottableValue.value<>(_:_:unit:calendar:)()
{
  return static PlottableValue.value<>(_:_:unit:calendar:)();
}

uint64_t static PlottableValue.value(_:_:)()
{
  return static PlottableValue.value(_:_:)();
}

uint64_t static AxisMarkPosition.bottom.getter()
{
  return static AxisMarkPosition.bottom.getter();
}

uint64_t static AxisMarkPosition.trailing.getter()
{
  return static AxisMarkPosition.trailing.getter();
}

uint64_t static AxisMarkPosition.automatic.getter()
{
  return static AxisMarkPosition.automatic.getter();
}

uint64_t type metadata accessor for AxisMarkPosition()
{
  return type metadata accessor for AxisMarkPosition();
}

uint64_t static ChartSymbolShape<>.circle.getter()
{
  return static ChartSymbolShape<>.circle.getter();
}

uint64_t static AnnotationPosition.bottomTrailing.getter()
{
  return static AnnotationPosition.bottomTrailing.getter();
}

uint64_t static AnnotationPosition.bottom.getter()
{
  return static AnnotationPosition.bottom.getter();
}

uint64_t type metadata accessor for AnnotationPosition()
{
  return type metadata accessor for AnnotationPosition();
}

uint64_t static PositionScaleRange<>.plotDimension(startPadding:endPadding:)()
{
  return static PositionScaleRange<>.plotDimension(startPadding:endPadding:)();
}

uint64_t static PositionScaleRange<>.plotDimension.getter()
{
  return static PositionScaleRange<>.plotDimension.getter();
}

uint64_t InterpolationMethod.init(_:)()
{
  return InterpolationMethod.init(_:)();
}

uint64_t type metadata accessor for AutomaticScaleDomain()
{
  return type metadata accessor for AutomaticScaleDomain();
}

uint64_t BasicChartSymbolShape.strokeBorder(lineWidth:)()
{
  return BasicChartSymbolShape.strokeBorder(lineWidth:)();
}

uint64_t type metadata accessor for BasicChartSymbolShape()
{
  return type metadata accessor for BasicChartSymbolShape();
}

uint64_t type metadata accessor for PlotDimensionScaleRange()
{
  return type metadata accessor for PlotDimensionScaleRange();
}

uint64_t static AxisValueLabelOrientation.automatic.getter()
{
  return static AxisValueLabelOrientation.automatic.getter();
}

uint64_t type metadata accessor for AxisValueLabelOrientation()
{
  return type metadata accessor for AxisValueLabelOrientation();
}

uint64_t AnnotationOverflowResolution.init(x:y:)()
{
  return AnnotationOverflowResolution.init(x:y:)();
}

uint64_t static AnnotationOverflowResolution.Boundary.plot.getter()
{
  return static AnnotationOverflowResolution.Boundary.plot.getter();
}

uint64_t type metadata accessor for AnnotationOverflowResolution.Boundary()
{
  return type metadata accessor for AnnotationOverflowResolution.Boundary();
}

uint64_t static AnnotationOverflowResolution.Strategy.fit(to:)()
{
  return static AnnotationOverflowResolution.Strategy.fit(to:)();
}

uint64_t type metadata accessor for AnnotationOverflowResolution.Strategy()
{
  return type metadata accessor for AnnotationOverflowResolution.Strategy();
}

uint64_t static AnnotationOverflowResolution.automatic.getter()
{
  return static AnnotationOverflowResolution.automatic.getter();
}

uint64_t type metadata accessor for AnnotationOverflowResolution()
{
  return type metadata accessor for AnnotationOverflowResolution();
}

uint64_t static AxisValueLabelCollisionResolution.disabled.getter()
{
  return static AxisValueLabelCollisionResolution.disabled.getter();
}

uint64_t static AxisValueLabelCollisionResolution.automatic.getter()
{
  return static AxisValueLabelCollisionResolution.automatic.getter();
}

uint64_t type metadata accessor for AxisValueLabelCollisionResolution()
{
  return type metadata accessor for AxisValueLabelCollisionResolution();
}

uint64_t Plot.init(content:)()
{
  return Plot.init(content:)();
}

uint64_t Chart.init(content:)()
{
  return Chart.init(content:)();
}

uint64_t BarMark.init<A, B>(x:y:width:height:stacking:)()
{
  return BarMark.init<A, B>(x:y:width:height:stacking:)();
}

uint64_t type metadata accessor for BarMark()
{
  return type metadata accessor for BarMark();
}

uint64_t AreaMark.init<A, B, C>(x:yStart:yEnd:series:)()
{
  return AreaMark.init<A, B, C>(x:yStart:yEnd:series:)();
}

uint64_t type metadata accessor for AreaMark()
{
  return type metadata accessor for AreaMark();
}

uint64_t AxisMark.foregroundStyle<A>(_:)()
{
  return AxisMark.foregroundStyle<A>(_:)();
}

uint64_t AxisMark.offset(x:y:)()
{
  return AxisMark.offset(x:y:)();
}

uint64_t static AxisTick.Length.longestLabel.getter()
{
  return static AxisTick.Length.longestLabel.getter();
}

uint64_t static AxisTick.Length.automatic.getter()
{
  return static AxisTick.Length.automatic.getter();
}

uint64_t type metadata accessor for AxisTick.Length()
{
  return type metadata accessor for AxisTick.Length();
}

uint64_t AxisTick.init(centered:length:stroke:)()
{
  return AxisTick.init(centered:length:stroke:)();
}

uint64_t type metadata accessor for AxisTick()
{
  return type metadata accessor for AxisTick();
}

uint64_t LineMark.init<A, B, C>(x:y:series:)()
{
  return LineMark.init<A, B, C>(x:y:series:)();
}

uint64_t type metadata accessor for LineMark()
{
  return type metadata accessor for LineMark();
}

uint64_t AxisMarks.init(preset:position:values:content:)()
{
  return AxisMarks.init(preset:position:values:content:)();
}

uint64_t AxisMarks.init<A>(preset:position:values:content:)()
{
  return AxisMarks.init<A>(preset:position:values:content:)();
}

uint64_t AxisValue.as<A>(_:)()
{
  return AxisValue.as<A>(_:)();
}

uint64_t AxisValue.isLast.getter()
{
  return AxisValue.isLast.getter();
}

uint64_t AxisValue.isFirst.getter()
{
  return AxisValue.isFirst.getter();
}

uint64_t type metadata accessor for AxisValue()
{
  return type metadata accessor for AxisValue();
}

uint64_t PointMark.init<A>(x:y:)()
{
  return PointMark.init<A>(x:y:)();
}

uint64_t PointMark.init<A, B>(x:y:)()
{
  return PointMark.init<A, B>(x:y:)();
}

uint64_t type metadata accessor for PointMark()
{
  return type metadata accessor for PointMark();
}

uint64_t type metadata accessor for ScaleType()
{
  return type metadata accessor for ScaleType();
}

uint64_t Tip.invalidate(reason:)()
{
  return Tip.invalidate(reason:)();
}

uint64_t Tip.statusUpdates.getter()
{
  return Tip.statusUpdates.getter();
}

uint64_t Tip.id.getter()
{
  return Tip.id.getter();
}

uint64_t Tip.status.getter()
{
  return Tip.status.getter();
}

uint64_t Tip.actions.getter()
{
  return Tip.actions.getter();
}

uint64_t TipView.init(_:arrowEdge:action:)()
{
  return TipView.init(_:arrowEdge:action:)();
}

uint64_t TipGroup.currentTip.getter()
{
  return TipGroup.currentTip.getter();
}

uint64_t type metadata accessor for TipGroup.Priority()
{
  return type metadata accessor for TipGroup.Priority();
}

uint64_t type metadata accessor for TipGroup()
{
  return type metadata accessor for TipGroup();
}

uint64_t TipGroup.init(_:_:)()
{
  return TipGroup.init(_:_:)();
}

uint64_t static Tips.hideTipsForTesting(_:)()
{
  return static Tips.hideTipsForTesting(_:)();
}

uint64_t static Tips.showTipsForTesting(_:)()
{
  return static Tips.showTipsForTesting(_:)();
}

uint64_t static Tips.hideAllTipsForTesting()()
{
  return static Tips.hideAllTipsForTesting()();
}

uint64_t static Tips.RuleBuilder.buildExpression(_:)()
{
  return static Tips.RuleBuilder.buildExpression(_:)();
}

uint64_t static Tips.RuleBuilder.buildPartialBlock(accumulated:next:)()
{
  return static Tips.RuleBuilder.buildPartialBlock(accumulated:next:)();
}

uint64_t static Tips.RuleBuilder.buildPartialBlock(first:)()
{
  return static Tips.RuleBuilder.buildPartialBlock(first:)();
}

uint64_t static Tips.GroupBuilder.buildPartialBlock(accumulated:next:)()
{
  return static Tips.GroupBuilder.buildPartialBlock(accumulated:next:)();
}

uint64_t static Tips.GroupBuilder.buildPartialBlock(first:)()
{
  return static Tips.GroupBuilder.buildPartialBlock(first:)();
}

uint64_t static Tips.OptionsBuilder.buildExpression<A>(_:)()
{
  return static Tips.OptionsBuilder.buildExpression<A>(_:)();
}

uint64_t static Tips.OptionsBuilder.buildFinalResult<A>(_:)()
{
  return static Tips.OptionsBuilder.buildFinalResult<A>(_:)();
}

uint64_t static Tips.OptionsBuilder.buildPartialBlock<A, B>(accumulated:next:)()
{
  return static Tips.OptionsBuilder.buildPartialBlock<A, B>(accumulated:next:)();
}

uint64_t static Tips.OptionsBuilder.buildPartialBlock<A>(first:)()
{
  return static Tips.OptionsBuilder.buildPartialBlock<A>(first:)();
}

uint64_t static Tips.resetDatastore()()
{
  return static Tips.resetDatastore()();
}

uint64_t type metadata accessor for Tips.MaxDisplayCount()
{
  return type metadata accessor for Tips.MaxDisplayCount();
}

uint64_t Tips.MaxDisplayCount.init(_:)()
{
  return Tips.MaxDisplayCount.init(_:)();
}

uint64_t static Tips.ParameterOption.transient.getter()
{
  return static Tips.ParameterOption.transient.getter();
}

uint64_t type metadata accessor for Tips.ParameterOption()
{
  return type metadata accessor for Tips.ParameterOption();
}

uint64_t static Tips.InvalidationReason.== infix(_:_:)()
{
  return static Tips.InvalidationReason.== infix(_:_:)();
}

uint64_t type metadata accessor for Tips.InvalidationReason()
{
  return type metadata accessor for Tips.InvalidationReason();
}

uint64_t static Tips.ConfigurationOption.DisplayFrequency.daily.getter()
{
  return static Tips.ConfigurationOption.DisplayFrequency.daily.getter();
}

uint64_t static Tips.ConfigurationOption.DisplayFrequency.immediate.getter()
{
  return static Tips.ConfigurationOption.DisplayFrequency.immediate.getter();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.DisplayFrequency()
{
  return type metadata accessor for Tips.ConfigurationOption.DisplayFrequency();
}

uint64_t static Tips.ConfigurationOption.displayFrequency(_:)()
{
  return static Tips.ConfigurationOption.displayFrequency(_:)();
}

uint64_t static Tips.ConfigurationOption.DatastoreLocation.applicationDefault.getter()
{
  return static Tips.ConfigurationOption.DatastoreLocation.applicationDefault.getter();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.DatastoreLocation()
{
  return type metadata accessor for Tips.ConfigurationOption.DatastoreLocation();
}

uint64_t static Tips.ConfigurationOption.datastoreLocation(_:)()
{
  return static Tips.ConfigurationOption.datastoreLocation(_:)();
}

uint64_t type metadata accessor for Tips.ConfigurationOption()
{
  return type metadata accessor for Tips.ConfigurationOption();
}

uint64_t type metadata accessor for Tips.IgnoresDisplayFrequency()
{
  return type metadata accessor for Tips.IgnoresDisplayFrequency();
}

uint64_t Tips.IgnoresDisplayFrequency.init(_:)()
{
  return Tips.IgnoresDisplayFrequency.init(_:)();
}

uint64_t type metadata accessor for Tips.Rule()
{
  return type metadata accessor for Tips.Rule();
}

uint64_t Tips.Rule.init<A>(_:_:)()
{
  return Tips.Rule.init<A>(_:_:)();
}

uint64_t Tips.Action.init(id:perform:_:)()
{
  return Tips.Action.init(id:perform:_:)();
}

uint64_t Tips.Action.with(index:)()
{
  return Tips.Action.with(index:)();
}

uint64_t type metadata accessor for Tips.Action()
{
  return type metadata accessor for Tips.Action();
}

uint64_t type metadata accessor for Tips.Status()
{
  return type metadata accessor for Tips.Status();
}

uint64_t Tips.Parameter.wrappedValue.getter()
{
  return Tips.Parameter.wrappedValue.getter();
}

uint64_t Tips.Parameter.wrappedValue.setter()
{
  return Tips.Parameter.wrappedValue.setter();
}

uint64_t Tips.Parameter.init<A>(_:_:_:_:)()
{
  return Tips.Parameter.init<A>(_:_:_:_:)();
}

uint64_t static Tips.configure(_:)()
{
  return static Tips.configure(_:)();
}

uint64_t type metadata accessor for Publishers.Drop()
{
  return type metadata accessor for Publishers.Drop();
}

uint64_t type metadata accessor for Publishers.Debounce()
{
  return type metadata accessor for Publishers.Debounce();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t static ObservableObject.environmentStore.getter()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t PassthroughSubject.send(_:)()
{
  return PassthroughSubject.send(_:)();
}

uint64_t PassthroughSubject.init()()
{
  return PassthroughSubject.init()();
}

uint64_t CurrentValueSubject.send(_:)()
{
  return CurrentValueSubject.send(_:)();
}

uint64_t CurrentValueSubject.value.getter()
{
  return CurrentValueSubject.value.getter();
}

uint64_t type metadata accessor for CurrentValueSubject()
{
  return type metadata accessor for CurrentValueSubject();
}

uint64_t CurrentValueSubject.__allocating_init(_:)()
{
  return CurrentValueSubject.__allocating_init(_:)();
}

uint64_t CurrentValueSubject.init(_:)()
{
  return CurrentValueSubject.init(_:)();
}

Swift::Void __swiftcall ObservableObjectPublisher.send()()
{
}

uint64_t type metadata accessor for ObservableObjectPublisher()
{
  return type metadata accessor for ObservableObjectPublisher();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t Publisher.scan<A>(_:_:)()
{
  return Publisher.scan<A>(_:_:)();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher.debounce<A>(for:scheduler:options:)()
{
  return Publisher.debounce<A>(for:scheduler:options:)();
}

uint64_t Publisher.throttle<A>(for:scheduler:latest:)()
{
  return Publisher.throttle<A>(for:scheduler:latest:)();
}

uint64_t Publisher.dropFirst(_:)()
{
  return Publisher.dropFirst(_:)();
}

uint64_t Publisher<>.removeDuplicates()()
{
  return Publisher<>.removeDuplicates()();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t NWActivity.parentActivity.getter()
{
  return NWActivity.parentActivity.getter();
}

uint64_t NWActivity.parentActivity.setter()
{
  return NWActivity.parentActivity.setter();
}

uint64_t type metadata accessor for NWActivity.CompletionReason()
{
  return type metadata accessor for NWActivity.CompletionReason();
}

uint64_t NWActivity.label.getter()
{
  return NWActivity.label.getter();
}

uint64_t NWActivity.token.getter()
{
  return NWActivity.token.getter();
}

uint64_t NWActivity.domain.getter()
{
  return NWActivity.domain.getter();
}

Swift::Void __swiftcall NWActivity.activate()()
{
}

uint64_t NWActivity.complete(reason:)()
{
  return NWActivity.complete(reason:)();
}

uint64_t type metadata accessor for NWInterface.InterfaceType()
{
  return type metadata accessor for NWInterface.InterfaceType();
}

uint64_t NWInterface.type.getter()
{
  return NWInterface.type.getter();
}

uint64_t type metadata accessor for NWInterface()
{
  return type metadata accessor for NWInterface();
}

uint64_t NWPathMonitor.pathUpdateHandler.setter()
{
  return NWPathMonitor.pathUpdateHandler.setter();
}

uint64_t NWPathMonitor.start(queue:)()
{
  return NWPathMonitor.start(queue:)();
}

Swift::Void __swiftcall NWPathMonitor.cancel()()
{
}

uint64_t NWPathMonitor.init()()
{
  return NWPathMonitor.init()();
}

uint64_t type metadata accessor for NWPathMonitor()
{
  return type metadata accessor for NWPathMonitor();
}

uint64_t NWPath.availableInterfaces.getter()
{
  return NWPath.availableInterfaces.getter();
}

uint64_t type metadata accessor for NWPath.Status()
{
  return type metadata accessor for NWPath.Status();
}

uint64_t NWPath.status.getter()
{
  return NWPath.status.getter();
}

uint64_t type metadata accessor for NWPath()
{
  return type metadata accessor for NWPath();
}

uint64_t NewsArticleView.init(identifiers:)()
{
  return NewsArticleView.init(identifiers:)();
}

uint64_t type metadata accessor for NewsArticleView()
{
  return type metadata accessor for NewsArticleView();
}

uint64_t type metadata accessor for NewsChannelLogoCollection.LogoTheme()
{
  return type metadata accessor for NewsChannelLogoCollection.LogoTheme();
}

uint64_t NewsChannelLogoCollection.url(for:)()
{
  return NewsChannelLogoCollection.url(for:)();
}

uint64_t type metadata accessor for NewsChannelLogoCollection()
{
  return type metadata accessor for NewsChannelLogoCollection();
}

uint64_t NewsArticle.publishDate.getter()
{
  return NewsArticle.publishDate.getter();
}

uint64_t NewsArticle.thumbnailURL.getter()
{
  return NewsArticle.thumbnailURL.getter();
}

uint64_t NewsArticle.id.getter()
{
  return NewsArticle.id.getter();
}

uint64_t NewsArticle.url.getter()
{
  return NewsArticle.url.getter();
}

uint64_t NewsArticle.title.getter()
{
  return NewsArticle.title.getter();
}

uint64_t NewsArticle.channel.getter()
{
  return NewsArticle.channel.getter();
}

uint64_t NewsChannel.id.getter()
{
  return NewsChannel.id.getter();
}

uint64_t NewsChannel.logo.getter()
{
  return NewsChannel.logo.getter();
}

uint64_t NewsChannel.name.getter()
{
  return NewsChannel.name.getter();
}

uint64_t NewsService.storeFrontID.getter()
{
  return NewsService.storeFrontID.getter();
}

uint64_t static NewsService.shared.getter()
{
  return static NewsService.shared.getter();
}

uint64_t type metadata accessor for NewsService()
{
  return type metadata accessor for NewsService();
}

uint64_t Animatable<>.animatableData.modify()
{
  return Animatable<>.animatableData.modify();
}

uint64_t static Animatable<>._makeAnimatable(value:inputs:)()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t static Animatable._makeAnimatable(value:inputs:)()
{
  return static Animatable._makeAnimatable(value:inputs:)();
}

uint64_t static ButtonRole.destructive.getter()
{
  return static ButtonRole.destructive.getter();
}

uint64_t static ButtonRole.cancel.getter()
{
  return static ButtonRole.cancel.getter();
}

uint64_t type metadata accessor for ButtonRole()
{
  return type metadata accessor for ButtonRole();
}

uint64_t static EdgeInsets.== infix(_:_:)()
{
  return static EdgeInsets.== infix(_:_:)();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t LabelGroup.init(content:)()
{
  return LabelGroup.init(content:)();
}

uint64_t LazyHStack.init(alignment:spacing:pinnedViews:content:)()
{
  return LazyHStack.init(alignment:spacing:pinnedViews:content:)();
}

uint64_t LazyVStack.init(alignment:spacing:pinnedViews:content:)()
{
  return LazyVStack.init(alignment:spacing:pinnedViews:content:)();
}

uint64_t type metadata accessor for LazyVStack()
{
  return type metadata accessor for LazyVStack();
}

uint64_t static ScenePhase.== infix(_:_:)()
{
  return static ScenePhase.== infix(_:_:)();
}

uint64_t ScrollView.scrollsContentToBeginningInRightToLeft.setter()
{
  return ScrollView.scrollsContentToBeginningInRightToLeft.setter();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t static ColorScheme.== infix(_:_:)()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t DragGesture.init<A>(minimumDistance:coordinateSpace:)()
{
  return DragGesture.init<A>(minimumDistance:coordinateSpace:)();
}

uint64_t DragGesture.Value.translation.getter()
{
  return DragGesture.Value.translation.getter();
}

uint64_t DragGesture.Value.predictedEndLocation.getter()
{
  return DragGesture.Value.predictedEndLocation.getter();
}

uint64_t DragGesture.Value.predictedEndTranslation.getter()
{
  return DragGesture.Value.predictedEndTranslation.getter();
}

uint64_t DragGesture.Value.location.getter()
{
  return DragGesture.Value.location.getter();
}

uint64_t type metadata accessor for DragGesture()
{
  return type metadata accessor for DragGesture();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t Environment.init<A>(_:)()
{
  return Environment.init<A>(_:)();
}

uint64_t static GestureMask.all.getter()
{
  return static GestureMask.all.getter();
}

uint64_t static ShadowStyle.drop(color:radius:x:y:)()
{
  return static ShadowStyle.drop(color:radius:x:y:)();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t static StrokeStyle.rounded(lineWidth:dash:)()
{
  return static StrokeStyle.rounded(lineWidth:dash:)();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t ToolbarItem<>.init(placement:content:)()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t Transaction.animationReason.setter()
{
  return Transaction.animationReason.setter();
}

uint64_t Transaction.disablesAnimations.getter()
{
  return Transaction.disablesAnimations.getter();
}

uint64_t Transaction.disablesAnimations.setter()
{
  return Transaction.disablesAnimations.setter();
}

uint64_t Transaction.addAnimationCompletion(criteria:_:)()
{
  return Transaction.addAnimationCompletion(criteria:_:)();
}

uint64_t Transaction.animationFrameInterval.setter()
{
  return Transaction.animationFrameInterval.setter();
}

uint64_t Transaction.disablesPageScrollAnimations.setter()
{
  return Transaction.disablesPageScrollAnimations.setter();
}

uint64_t Transaction.animation.getter()
{
  return Transaction.animation.getter();
}

uint64_t Transaction.animation.setter()
{
  return Transaction.animation.setter();
}

uint64_t Transaction.init(animation:)()
{
  return Transaction.init(animation:)();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t type metadata accessor for WindowGroup()
{
  return type metadata accessor for WindowGroup();
}

uint64_t type metadata accessor for _LayoutRoot()
{
  return type metadata accessor for _LayoutRoot();
}

uint64_t _LayoutRoot.init(_:)()
{
  return _LayoutRoot.init(_:)();
}

uint64_t static DividerStyle<>.quaternary.getter()
{
  return static DividerStyle<>.quaternary.getter();
}

uint64_t static DividerStyle<>.primary.getter()
{
  return static DividerStyle<>.primary.getter();
}

uint64_t static DividerStyle<>.vibrant.getter()
{
  return static DividerStyle<>.vibrant.getter();
}

uint64_t ProgressView<>.init<>()()
{
  return ProgressView<>.init<>()();
}

uint64_t ScaledMetric.init(wrappedValue:relativeTo:)()
{
  return ScaledMetric.init(wrappedValue:relativeTo:)();
}

uint64_t ScaledMetric.init(wrappedValue:)()
{
  return ScaledMetric.init(wrappedValue:)();
}

uint64_t ScaledMetric.wrappedValue.getter()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t type metadata accessor for ScaledMetric()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t static SceneBuilder.buildBlock<A>(_:)()
{
  return static SceneBuilder.buildBlock<A>(_:)();
}

uint64_t static TabViewStyle<>.lazyPage.getter()
{
  return static TabViewStyle<>.lazyPage.getter();
}

uint64_t static VerticalEdge.Set.all.getter()
{
  return static VerticalEdge.Set.all.getter();
}

uint64_t VerticalEdge.rawValue.getter()
{
  return VerticalEdge.rawValue.getter();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t ViewThatFits.init(in:content:)()
{
  return ViewThatFits.init(in:content:)();
}

uint64_t type metadata accessor for ViewThatFits()
{
  return type metadata accessor for ViewThatFits();
}

uint64_t VisualEffect.scaleEffect(x:y:anchor:)()
{
  return VisualEffect.scaleEffect(x:y:anchor:)();
}

uint64_t VisualEffect.offset(x:y:)()
{
  return VisualEffect.offset(x:y:)();
}

uint64_t VisualEffect.opacity(_:)()
{
  return VisualEffect.opacity(_:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t AnyShapeStyle.init<A>(_:)()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t static AnyTransition.asymmetric(insertion:removal:)()
{
  return static AnyTransition.asymmetric(insertion:removal:)();
}

uint64_t static AnyTransition.scale(scale:anchor:)()
{
  return static AnyTransition.scale(scale:anchor:)();
}

uint64_t static AnyTransition.opacity.getter()
{
  return static AnyTransition.opacity.getter();
}

uint64_t AnyTransition.combined(with:)()
{
  return AnyTransition.combined(with:)();
}

uint64_t static AnyTransition.identity.getter()
{
  return static AnyTransition.identity.getter();
}

uint64_t static AnyTransition.modifier<A>(active:identity:)()
{
  return static AnyTransition.modifier<A>(active:identity:)();
}

uint64_t AnyTransition.animation(_:)()
{
  return AnyTransition.animation(_:)();
}

uint64_t AnyTransition.init<A>(_:)()
{
  return AnyTransition.init<A>(_:)();
}

uint64_t GeometryProxy.safeAreaInsets.getter()
{
  return GeometryProxy.safeAreaInsets.getter();
}

uint64_t GeometryProxy.frameClippedToScrollViews(in:)()
{
  return GeometryProxy.frameClippedToScrollViews(in:)();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t GeometryProxy.frame(in:)()
{
  return GeometryProxy.frame(in:)();
}

uint64_t GeometryProxy.frame<A>(in:)()
{
  return GeometryProxy.frame<A>(in:)();
}

uint64_t GeometryProxy.bounds(of:)()
{
  return GeometryProxy.bounds(of:)();
}

uint64_t type metadata accessor for GeometryProxy()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t GeometryProxy.subscript.getter()
{
  return GeometryProxy.subscript.getter();
}

uint64_t LayoutSubview.sizeThatFits(_:)()
{
  return LayoutSubview.sizeThatFits(_:)();
}

uint64_t LayoutSubview.place(at:anchor:proposal:)()
{
  return LayoutSubview.place(at:anchor:proposal:)();
}

uint64_t type metadata accessor for LayoutSubview()
{
  return type metadata accessor for LayoutSubview();
}

uint64_t LayoutSubview.subscript.getter()
{
  return LayoutSubview.subscript.getter();
}

uint64_t static OpenURLAction.Result.handled.getter()
{
  return static OpenURLAction.Result.handled.getter();
}

uint64_t OpenURLAction.init(handler:)()
{
  return OpenURLAction.init(handler:)();
}

uint64_t type metadata accessor for OpenURLAction()
{
  return type metadata accessor for OpenURLAction();
}

uint64_t static PreferenceKey._isReadableByHost.getter()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t static PreferenceKey._includesRemovedValues.getter()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t type metadata accessor for _TaskModifier()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t type metadata accessor for _VariadicView.Tree()
{
  return type metadata accessor for _VariadicView.Tree();
}

uint64_t _VariadicView.Tree.init(_:content:)()
{
  return _VariadicView.Tree.init(_:content:)();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t static EnvironmentKey._valuesEqual(_:_:)()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t GeometryReader.init(content:)()
{
  return GeometryReader.init(content:)();
}

uint64_t type metadata accessor for GeometryReader()
{
  return type metadata accessor for GeometryReader();
}

uint64_t type metadata accessor for LayoutSubviews()
{
  return type metadata accessor for LayoutSubviews();
}

uint64_t LayoutSubviews.subscript.getter()
{
  return LayoutSubviews.subscript.getter();
}

{
  return LayoutSubviews.subscript.getter();
}

uint64_t static LinearGradient.fallback.getter()
{
  return static LinearGradient.fallback.getter();
}

uint64_t LinearGradient.init(_:)()
{
  return LinearGradient.init(_:)();
}

uint64_t LinearGradient.init(gradient:startPoint:endPoint:)()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t NavigationLink.init(destination:label:)()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t type metadata accessor for NavigationLink()
{
  return type metadata accessor for NavigationLink();
}

uint64_t type metadata accessor for NavigationPath()
{
  return type metadata accessor for NavigationPath();
}

uint64_t NavigationView.init(content:)()
{
  return NavigationView.init(content:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t OpenURLOptions.uiSceneOpenURLOptions.getter()
{
  return OpenURLOptions.uiSceneOpenURLOptions.getter();
}

uint64_t type metadata accessor for OpenURLOptions()
{
  return type metadata accessor for OpenURLOptions();
}

uint64_t PlainListStyle.init()()
{
  return PlainListStyle.init()();
}

uint64_t type metadata accessor for PlainListStyle()
{
  return type metadata accessor for PlainListStyle();
}

uint64_t ScrollPosition.init<A>(idType:)()
{
  return ScrollPosition.init<A>(idType:)();
}

uint64_t type metadata accessor for ScrollPosition()
{
  return type metadata accessor for ScrollPosition();
}

uint64_t ViewDimensions.subscript.getter()
{
  return ViewDimensions.subscript.getter();
}

uint64_t type metadata accessor for CoordinateSpace()
{
  return type metadata accessor for CoordinateSpace();
}

uint64_t static DynamicProperty._propertyBehaviors.getter()
{
  return static DynamicProperty._propertyBehaviors.getter();
}

Swift::Void __swiftcall DynamicProperty.update()()
{
}

uint64_t DynamicTypeSize.isAccessibilitySize.getter()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t static DynamicTypeSize.< infix(_:_:)()
{
  return static DynamicTypeSize.< infix(_:_:)();
}

uint64_t static DynamicTypeSize.== infix(_:_:)()
{
  return static DynamicTypeSize.== infix(_:_:)();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t DynamicTypeSize.init(_:)()
{
  return DynamicTypeSize.init(_:)();
}

uint64_t GraphicsContext.translateBy(x:y:)()
{
  return GraphicsContext.translateBy(x:y:)();
}

uint64_t GraphicsContext.fill(_:with:style:)()
{
  return GraphicsContext.fill(_:with:style:)();
}

uint64_t GraphicsContext.rotate(by:)()
{
  return GraphicsContext.rotate(by:)();
}

uint64_t static GraphicsContext.Shading.conicGradient(_:center:angle:options:)()
{
  return static GraphicsContext.Shading.conicGradient(_:center:angle:options:)();
}

uint64_t static GraphicsContext.Shading.color(_:)()
{
  return static GraphicsContext.Shading.color(_:)();
}

uint64_t type metadata accessor for GraphicsContext.Shading()
{
  return type metadata accessor for GraphicsContext.Shading();
}

uint64_t GraphicsContext.blendMode.setter()
{
  return GraphicsContext.blendMode.setter();
}

uint64_t LayoutDirection.temperatureOffsetDirection.getter()
{
  return LayoutDirection.temperatureOffsetDirection.getter();
}

uint64_t static LayoutDirection.== infix(_:_:)()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t type metadata accessor for LayoutDirection()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t MenuPickerStyle.init()()
{
  return MenuPickerStyle.init()();
}

uint64_t type metadata accessor for MenuPickerStyle()
{
  return type metadata accessor for MenuPickerStyle();
}

uint64_t ModifiedContent<>.accessibilityCustomContent(_:)()
{
  return ModifiedContent<>.accessibilityCustomContent(_:)();
}

uint64_t ModifiedContent<>.accessibilityHint(_:)()
{
  return ModifiedContent<>.accessibilityHint(_:)();
}

uint64_t ModifiedContent<>.accessibilityLabel(_:)()
{
  return ModifiedContent<>.accessibilityLabel(_:)();
}

uint64_t ModifiedContent<>.accessibilityLabel<A>(_:)()
{
  return ModifiedContent<>.accessibilityLabel<A>(_:)();
}

uint64_t ModifiedContent<>.accessibilityValue(_:)()
{
  return ModifiedContent<>.accessibilityValue(_:)();
}

uint64_t ModifiedContent<>.accessibilityValue<A>(_:)()
{
  return ModifiedContent<>.accessibilityValue<A>(_:)();
}

uint64_t ModifiedContent<>.accessibilityHidden(_:)()
{
  return ModifiedContent<>.accessibilityHidden(_:)();
}

uint64_t ModifiedContent<>.accessibilityAddTraits(_:)()
{
  return ModifiedContent<>.accessibilityAddTraits(_:)();
}

uint64_t ModifiedContent<>.accessibilityInputLabels<A>(_:)()
{
  return ModifiedContent<>.accessibilityInputLabels<A>(_:)();
}

uint64_t ModifiedContent<>.accessibilityRemoveTraits(_:)()
{
  return ModifiedContent<>.accessibilityRemoveTraits(_:)();
}

uint64_t ModifiedContent<>.accessibilityAdjustableAction(_:)()
{
  return ModifiedContent<>.accessibilityAdjustableAction(_:)();
}

uint64_t ModifiedContent<>.accessibilityRespondsToUserInteraction(_:)()
{
  return ModifiedContent<>.accessibilityRespondsToUserInteraction(_:)();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t NavigationStack.init<>(root:)()
{
  return NavigationStack.init<>(root:)();
}

uint64_t type metadata accessor for NavigationStack()
{
  return type metadata accessor for NavigationStack();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t static SafeAreaRegions.container.getter()
{
  return static SafeAreaRegions.container.getter();
}

uint64_t ScrollViewProxy.scrollTo<A>(_:anchor:)()
{
  return ScrollViewProxy.scrollTo<A>(_:anchor:)();
}

uint64_t type metadata accessor for ScrollViewProxy()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t withTransaction<A>(_:_:)()
{
  return withTransaction<A>(_:_:)();
}

uint64_t DefaultMenuStyle.init()()
{
  return DefaultMenuStyle.init()();
}

uint64_t type metadata accessor for DefaultMenuStyle()
{
  return type metadata accessor for DefaultMenuStyle();
}

uint64_t type metadata accessor for LegibilityWeight()
{
  return type metadata accessor for LegibilityWeight();
}

uint64_t static PageTabViewStyle.IndexDisplayMode.never.getter()
{
  return static PageTabViewStyle.IndexDisplayMode.never.getter();
}

uint64_t type metadata accessor for PageTabViewStyle.IndexDisplayMode()
{
  return type metadata accessor for PageTabViewStyle.IndexDisplayMode();
}

uint64_t PageTabViewStyle.init(indexDisplayMode:)()
{
  return PageTabViewStyle.init(indexDisplayMode:)();
}

uint64_t type metadata accessor for PageTabViewStyle()
{
  return type metadata accessor for PageTabViewStyle();
}

uint64_t PlainButtonStyle.init()()
{
  return PlainButtonStyle.init()();
}

uint64_t type metadata accessor for PlainButtonStyle()
{
  return type metadata accessor for PlainButtonStyle();
}

Swift::Void __swiftcall PresentationMode.dismiss()()
{
}

uint64_t type metadata accessor for PresentationMode()
{
  return type metadata accessor for PresentationMode();
}

uint64_t static ProposedViewSize.unspecified.getter()
{
  return static ProposedViewSize.unspecified.getter();
}

uint64_t static RedactionReasons.placeholder.getter()
{
  return static RedactionReasons.placeholder.getter();
}

uint64_t type metadata accessor for RedactionReasons()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t RoundedRectangle.path(in:)()
{
  return RoundedRectangle.path(in:)();
}

uint64_t type metadata accessor for RoundedRectangle._Inset()
{
  return type metadata accessor for RoundedRectangle._Inset();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t ScrollEventState.isScrolling.getter()
{
  return ScrollEventState.isScrolling.getter();
}

uint64_t type metadata accessor for ScrollEventState()
{
  return type metadata accessor for ScrollEventState();
}

uint64_t type metadata accessor for TagValueTraitKey.Value()
{
  return type metadata accessor for TagValueTraitKey.Value();
}

uint64_t type metadata accessor for TagValueTraitKey()
{
  return type metadata accessor for TagValueTraitKey();
}

uint64_t static ToolbarPlacement.navigationBar.getter()
{
  return static ToolbarPlacement.navigationBar.getter();
}

uint64_t type metadata accessor for ToolbarPlacement()
{
  return type metadata accessor for ToolbarPlacement();
}

uint64_t type metadata accessor for _BlendModeEffect()
{
  return type metadata accessor for _BlendModeEffect();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t type metadata accessor for _OverlayModifier()
{
  return type metadata accessor for _OverlayModifier();
}

uint64_t static ContentShapeKinds.dragPreview.getter()
{
  return static ContentShapeKinds.dragPreview.getter();
}

uint64_t type metadata accessor for ContentShapeKinds()
{
  return type metadata accessor for ContentShapeKinds();
}

uint64_t static CustomHoverEffect<>.automatic.getter()
{
  return static CustomHoverEffect<>.automatic.getter();
}

uint64_t type metadata accessor for EmptyVisualEffect()
{
  return type metadata accessor for EmptyVisualEffect();
}

uint64_t EnvironmentObject.error()()
{
  return EnvironmentObject.error()();
}

uint64_t EnvironmentObject.init()()
{
  return EnvironmentObject.init()();
}

uint64_t EnvironmentValues.sunriseSunsetNightLineColor.getter()
{
  return EnvironmentValues.sunriseSunsetNightLineColor.getter();
}

uint64_t EnvironmentValues.sunriseSunsetNightLineColor.setter()
{
  return EnvironmentValues.sunriseSunsetNightLineColor.setter();
}

uint64_t EnvironmentValues.imageScale.getter()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t EnvironmentValues.imageScale.setter()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t EnvironmentValues.scenePhase.getter()
{
  return EnvironmentValues.scenePhase.getter();
}

uint64_t EnvironmentValues.scenePhase.setter()
{
  return EnvironmentValues.scenePhase.setter();
}

uint64_t EnvironmentValues.preferredMapSize.getter()
{
  return EnvironmentValues.preferredMapSize.getter();
}

uint64_t EnvironmentValues.preferredMapSize.setter()
{
  return EnvironmentValues.preferredMapSize.setter();
}

uint64_t EnvironmentValues.accentColor.getter()
{
  return EnvironmentValues.accentColor.getter();
}

uint64_t EnvironmentValues.accentColor.setter()
{
  return EnvironmentValues.accentColor.setter();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t EnvironmentValues.isSearching.getter()
{
  return EnvironmentValues.isSearching.getter();
}

uint64_t EnvironmentValues.displayScale.getter()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t EnvironmentValues.displayScale.setter()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t EnvironmentValues.sizeCategory.getter()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t EnvironmentValues.sizeCategory.setter()
{
  return EnvironmentValues.sizeCategory.setter();
}

uint64_t EnvironmentValues.dismissSearch.getter()
{
  return EnvironmentValues.dismissSearch.getter();
}

uint64_t EnvironmentValues.listRowSpacing.getter()
{
  return EnvironmentValues.listRowSpacing.getter();
}

uint64_t EnvironmentValues.listRowSpacing.setter()
{
  return EnvironmentValues.listRowSpacing.setter();
}

uint64_t EnvironmentValues._startSearching.getter()
{
  return EnvironmentValues._startSearching.getter();
}

uint64_t EnvironmentValues.dynamicTypeSize.getter()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t EnvironmentValues.dynamicTypeSize.setter()
{
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.layoutDirection.getter()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t EnvironmentValues.allowsTightening.getter()
{
  return EnvironmentValues.allowsTightening.getter();
}

uint64_t EnvironmentValues.allowsTightening.setter()
{
  return EnvironmentValues.allowsTightening.setter();
}

uint64_t EnvironmentValues.finishLaunchTest.getter()
{
  return EnvironmentValues.finishLaunchTest.getter();
}

uint64_t EnvironmentValues.legibilityWeight.getter()
{
  return EnvironmentValues.legibilityWeight.getter();
}

uint64_t EnvironmentValues.presentationMode.getter()
{
  return EnvironmentValues.presentationMode.getter();
}

uint64_t EnvironmentValues.redactionReasons.getter()
{
  return EnvironmentValues.redactionReasons.getter();
}

uint64_t EnvironmentValues.redactionReasons.setter()
{
  return EnvironmentValues.redactionReasons.setter();
}

uint64_t EnvironmentValues.minimumScaleFactor.getter()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t EnvironmentValues.minimumScaleFactor.setter()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t EnvironmentValues.colorSchemeContrast.getter()
{
  return EnvironmentValues.colorSchemeContrast.getter();
}

uint64_t EnvironmentValues.horizontalSizeClass.getter()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t EnvironmentValues.symbolRenderingMode.getter()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t EnvironmentValues.symbolRenderingMode.setter()
{
  return EnvironmentValues.symbolRenderingMode.setter();
}

uint64_t EnvironmentValues.accessibilityEnabled.getter()
{
  return EnvironmentValues.accessibilityEnabled.getter();
}

uint64_t EnvironmentValues.accessibilityEnabled.setter()
{
  return EnvironmentValues.accessibilityEnabled.setter();
}

uint64_t EnvironmentValues.fontResolutionContext.getter()
{
  return EnvironmentValues.fontResolutionContext.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.effectiveForegroundStyle.getter()
{
  return EnvironmentValues.effectiveForegroundStyle.getter();
}

uint64_t EnvironmentValues.accessibilityInvertColors.getter()
{
  return EnvironmentValues.accessibilityInvertColors.getter();
}

uint64_t EnvironmentValues.accessibilityVoiceOverEnabled.getter()
{
  return EnvironmentValues.accessibilityVoiceOverEnabled.getter();
}

uint64_t EnvironmentValues.accessibilityReduceTransparency.getter()
{
  return EnvironmentValues.accessibilityReduceTransparency.getter();
}

uint64_t EnvironmentValues.accessibilitySwitchControlEnabled.getter()
{
  return EnvironmentValues.accessibilitySwitchControlEnabled.getter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.locale.getter()
{
  return EnvironmentValues.locale.getter();
}

uint64_t EnvironmentValues.locale.setter()
{
  return EnvironmentValues.locale.setter();
}

uint64_t EnvironmentValues.openURL.getter()
{
  return EnvironmentValues.openURL.getter();
}

uint64_t EnvironmentValues.openURL.setter()
{
  return EnvironmentValues.openURL.setter();
}

uint64_t EnvironmentValues.editMode.getter()
{
  return EnvironmentValues.editMode.getter();
}

uint64_t EnvironmentValues.editMode.setter()
{
  return EnvironmentValues.editMode.setter();
}

uint64_t EnvironmentValues.textCase.getter()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t EnvironmentValues.textCase.setter()
{
  return EnvironmentValues.textCase.setter();
}

uint64_t EnvironmentValues.timeZone.getter()
{
  return EnvironmentValues.timeZone.getter();
}

uint64_t EnvironmentValues.timeZone.setter()
{
  return EnvironmentValues.timeZone.setter();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t EnvironmentValues.tintColor.getter()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t EnvironmentValues.tintColor.setter()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t EnvironmentValues.subscript.getter()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t EnvironmentValues.subscript.setter()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t InlinePickerStyle.init()()
{
  return InlinePickerStyle.init()();
}

uint64_t type metadata accessor for InlinePickerStyle()
{
  return type metadata accessor for InlinePickerStyle();
}

uint64_t static ListPaddingAnchor.safeArea.getter()
{
  return static ListPaddingAnchor.safeArea.getter();
}

uint64_t type metadata accessor for ListPaddingAnchor()
{
  return type metadata accessor for ListPaddingAnchor();
}

uint64_t type metadata accessor for NavigationBarItem.TitleDisplayMode()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t OpacityTransition.init()()
{
  return OpacityTransition.init()();
}

uint64_t type metadata accessor for OpacityTransition()
{
  return type metadata accessor for OpacityTransition();
}

Swift::Void __swiftcall StartSearchAction.callAsFunction()()
{
}

uint64_t type metadata accessor for StartSearchAction()
{
  return type metadata accessor for StartSearchAction();
}

uint64_t static SwipeActionsStyle.rounded(radius:)()
{
  return static SwipeActionsStyle.rounded(radius:)();
}

uint64_t type metadata accessor for SwipeActionsStyle()
{
  return type metadata accessor for SwipeActionsStyle();
}

uint64_t static VerticalAlignment.lastTextBaseline.getter()
{
  return static VerticalAlignment.lastTextBaseline.getter();
}

uint64_t static VerticalAlignment.firstTextBaseline.getter()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t static VerticalAlignment.top.getter()
{
  return static VerticalAlignment.top.getter();
}

uint64_t static VerticalAlignment.bottom.getter()
{
  return static VerticalAlignment.bottom.getter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t type metadata accessor for _UnaryViewAdaptor()
{
  return type metadata accessor for _UnaryViewAdaptor();
}

uint64_t _UnaryViewAdaptor.init(_:)()
{
  return _UnaryViewAdaptor.init(_:)();
}

uint64_t type metadata accessor for ColorRenderingMode()
{
  return type metadata accessor for ColorRenderingMode();
}

uint64_t EllipticalGradient.init(colors:center:startRadiusFraction:endRadiusFraction:)()
{
  return EllipticalGradient.init(colors:center:startRadiusFraction:endRadiusFraction:)();
}

uint64_t IdentityTransition.init()()
{
  return IdentityTransition.init()();
}

uint64_t type metadata accessor for IdentityTransition()
{
  return type metadata accessor for IdentityTransition();
}

uint64_t LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

uint64_t LocalizedStringKey.StringInterpolation.appendInterpolation(_:)()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for LocalizedStringKey.StringInterpolation()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t LocalizedStringKey.init(stringInterpolation:)()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t LocalizedStringKey.init(_:)()
{
  return LocalizedStringKey.init(_:)();
}

uint64_t static PresentationSizing<>.form.getter()
{
  return static PresentationSizing<>.form.getter();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static AccessibilityTraits.isSelected.getter()
{
  return static AccessibilityTraits.isSelected.getter();
}

uint64_t static AccessibilityTraits.updatesFrequently.getter()
{
  return static AccessibilityTraits.updatesFrequently.getter();
}

uint64_t static AccessibilityTraits.isModal.getter()
{
  return static AccessibilityTraits.isModal.getter();
}

uint64_t static AccessibilityTraits.isButton.getter()
{
  return static AccessibilityTraits.isButton.getter();
}

uint64_t static AccessibilityTraits.isHeader.getter()
{
  return static AccessibilityTraits.isHeader.getter();
}

uint64_t type metadata accessor for AccessibilityTraits()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t static ColorSchemeContrast.== infix(_:_:)()
{
  return static ColorSchemeContrast.== infix(_:_:)();
}

uint64_t type metadata accessor for ColorSchemeContrast()
{
  return type metadata accessor for ColorSchemeContrast();
}

uint64_t ContentSizeCategory.isAccessibilityCategory.getter()
{
  return ContentSizeCategory.isAccessibilityCategory.getter();
}

uint64_t type metadata accessor for ContentSizeCategory()
{
  return type metadata accessor for ContentSizeCategory();
}

Swift::Void __swiftcall DismissSearchAction.callAsFunction()()
{
}

uint64_t type metadata accessor for DismissSearchAction()
{
  return type metadata accessor for DismissSearchAction();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t static HorizontalAlignment.trailing.getter()
{
  return static HorizontalAlignment.trailing.getter();
}

uint64_t NavigationSplitView.init<>(columnVisibility:sidebar:detail:)()
{
  return NavigationSplitView.init<>(columnVisibility:sidebar:detail:)();
}

uint64_t static SymbolRenderingMode.monochrome.getter()
{
  return static SymbolRenderingMode.monochrome.getter();
}

uint64_t static SymbolRenderingMode.hierarchical.getter()
{
  return static SymbolRenderingMode.hierarchical.getter();
}

uint64_t type metadata accessor for SymbolRenderingMode()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t TupleToolbarContent.init(_:)()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for _ConditionalContent()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t type metadata accessor for AutomaticHoverEffect()
{
  return type metadata accessor for AutomaticHoverEffect();
}

uint64_t type metadata accessor for LazyPageTabViewStyle()
{
  return type metadata accessor for LazyPageTabViewStyle();
}

uint64_t type metadata accessor for LocalCoordinateSpace()
{
  return type metadata accessor for LocalCoordinateSpace();
}

uint64_t type metadata accessor for NamedCoordinateSpace()
{
  return type metadata accessor for NamedCoordinateSpace();
}

uint64_t static NavigationTransition<>.zoom<A>(sourceID:in:)()
{
  return static NavigationTransition<>.zoom<A>(sourceID:in:)();
}

uint64_t RectangleCornerRadii.init(topLeft:topRight:bottomRight:bottomLeft:)()
{
  return RectangleCornerRadii.init(topLeft:topRight:bottomRight:bottomLeft:)();
}

uint64_t static SearchFieldPlacement.navigationBarDrawer(displayMode:)()
{
  return static SearchFieldPlacement.navigationBarDrawer(displayMode:)();
}

uint64_t static SearchFieldPlacement.NavigationBarDrawerDisplayMode.always.getter()
{
  return static SearchFieldPlacement.NavigationBarDrawerDisplayMode.always.getter();
}

uint64_t type metadata accessor for SearchFieldPlacement.NavigationBarDrawerDisplayMode()
{
  return type metadata accessor for SearchFieldPlacement.NavigationBarDrawerDisplayMode();
}

uint64_t type metadata accessor for SearchFieldPlacement()
{
  return type metadata accessor for SearchFieldPlacement();
}

uint64_t SegmentedPickerStyle.init()()
{
  return SegmentedPickerStyle.init()();
}

uint64_t type metadata accessor for SegmentedPickerStyle()
{
  return type metadata accessor for SegmentedPickerStyle();
}

uint64_t static ToolbarItemPlacement.primaryAction.getter()
{
  return static ToolbarItemPlacement.primaryAction.getter();
}

uint64_t static ToolbarItemPlacement.cancellationAction.getter()
{
  return static ToolbarItemPlacement.cancellationAction.getter();
}

uint64_t static ToolbarItemPlacement.confirmationAction.getter()
{
  return static ToolbarItemPlacement.confirmationAction.getter();
}

uint64_t static ToolbarItemPlacement.navigationBarLeading.getter()
{
  return static ToolbarItemPlacement.navigationBarLeading.getter();
}

uint64_t static ToolbarItemPlacement.navigationBarTrailing.getter()
{
  return static ToolbarItemPlacement.navigationBarTrailing.getter();
}

uint64_t static ToolbarItemPlacement.principal.getter()
{
  return static ToolbarItemPlacement.principal.getter();
}

uint64_t type metadata accessor for ToolbarItemPlacement()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t BorderlessButtonStyle.init()()
{
  return BorderlessButtonStyle.init()();
}

uint64_t type metadata accessor for BorderlessButtonStyle()
{
  return type metadata accessor for BorderlessButtonStyle();
}

uint64_t InsetGroupedListStyle.init()()
{
  return InsetGroupedListStyle.init()();
}

uint64_t type metadata accessor for InsetGroupedListStyle()
{
  return type metadata accessor for InsetGroupedListStyle();
}

uint64_t type metadata accessor for PinnedScrollableViews()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t static ToolbarContentBuilder.buildBlock<A>(_:)()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t static ToolbarContentBuilder.buildIf<A>(_:)()
{
  return static ToolbarContentBuilder.buildIf<A>(_:)();
}

uint64_t type metadata accessor for _TraitWritingModifier()
{
  return type metadata accessor for _TraitWritingModifier();
}

uint64_t type metadata accessor for _ViewModifier_Content()
{
  return type metadata accessor for _ViewModifier_Content();
}

Swift::Void __swiftcall FinishLaunchTestAction.callAsFunction()()
{
}

uint64_t type metadata accessor for FinishLaunchTestAction()
{
  return type metadata accessor for FinishLaunchTestAction();
}

uint64_t type metadata accessor for FormPresentationSizing()
{
  return type metadata accessor for FormPresentationSizing();
}

uint64_t static HierarchicalShapeStyle.quaternary.getter()
{
  return static HierarchicalShapeStyle.quaternary.getter();
}

uint64_t static HierarchicalShapeStyle.primary.getter()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t static HierarchicalShapeStyle.tertiary.getter()
{
  return static HierarchicalShapeStyle.tertiary.getter();
}

uint64_t static HierarchicalShapeStyle.secondary.getter()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t type metadata accessor for PlaceholderContentView()
{
  return type metadata accessor for PlaceholderContentView();
}

uint64_t ScrollEventStateReader.init(content:)()
{
  return ScrollEventStateReader.init(content:)();
}

uint64_t type metadata accessor for ScrollEventStateReader()
{
  return type metadata accessor for ScrollEventStateReader();
}

uint64_t type metadata accessor for UnevenRoundedRectangle()
{
  return type metadata accessor for UnevenRoundedRectangle();
}

uint64_t type metadata accessor for UserInterfaceSizeClass()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t static AccessibilityActionKind.escape.getter()
{
  return static AccessibilityActionKind.escape.getter();
}

uint64_t static AccessibilityActionKind.default.getter()
{
  return static AccessibilityActionKind.default.getter();
}

uint64_t type metadata accessor for AccessibilityActionKind()
{
  return type metadata accessor for AccessibilityActionKind();
}

uint64_t static CoordinateSpaceProtocol<>.local.getter()
{
  return static CoordinateSpaceProtocol<>.local.getter();
}

uint64_t static CoordinateSpaceProtocol<>.scrollView(axis:)()
{
  return static CoordinateSpaceProtocol<>.scrollView(axis:)();
}

uint64_t static CoordinateSpaceProtocol<>.scrollView.getter()
{
  return static CoordinateSpaceProtocol<>.scrollView.getter();
}

uint64_t static CoordinateSpaceProtocol<>.named<A>(_:)()
{
  return static CoordinateSpaceProtocol<>.named<A>(_:)();
}

uint64_t type metadata accessor for LabelStyleConfiguration.Icon()
{
  return type metadata accessor for LabelStyleConfiguration.Icon();
}

uint64_t LabelStyleConfiguration.icon.getter()
{
  return LabelStyleConfiguration.icon.getter();
}

uint64_t type metadata accessor for LabelStyleConfiguration.Title()
{
  return type metadata accessor for LabelStyleConfiguration.Title();
}

uint64_t LabelStyleConfiguration.title.getter()
{
  return LabelStyleConfiguration.title.getter();
}

uint64_t _GeometryActionModifier.init(value:action:)()
{
  return _GeometryActionModifier.init(value:action:)();
}

uint64_t type metadata accessor for _GeometryActionModifier()
{
  return type metadata accessor for _GeometryActionModifier();
}

uint64_t type metadata accessor for ButtonStyleConfiguration.Label()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t ButtonStyleConfiguration.label.getter()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t ButtonStyleConfiguration.isPressed.getter()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t static NavigationSplitViewStyle<>.balanced.getter()
{
  return static NavigationSplitViewStyle<>.balanced.getter();
}

uint64_t type metadata accessor for ZoomNavigationTransition()
{
  return type metadata accessor for ZoomNavigationTransition();
}

uint64_t BorderlessButtonMenuStyle.init()()
{
  return BorderlessButtonMenuStyle.init()();
}

uint64_t type metadata accessor for BorderlessButtonMenuStyle()
{
  return type metadata accessor for BorderlessButtonMenuStyle();
}

uint64_t CircularProgressViewStyle.init()()
{
  return CircularProgressViewStyle.init()();
}

uint64_t type metadata accessor for CircularProgressViewStyle()
{
  return type metadata accessor for CircularProgressViewStyle();
}

uint64_t static MatchedGeometryProperties.frame.getter()
{
  return static MatchedGeometryProperties.frame.getter();
}

uint64_t static MatchedGeometryProperties.clipRect.getter()
{
  return static MatchedGeometryProperties.clipRect.getter();
}

uint64_t static MatchedGeometryProperties.position.getter()
{
  return static MatchedGeometryProperties.position.getter();
}

uint64_t static ScrollIndicatorVisibility.never.getter()
{
  return static ScrollIndicatorVisibility.never.getter();
}

uint64_t type metadata accessor for ScrollIndicatorVisibility()
{
  return type metadata accessor for ScrollIndicatorVisibility();
}

uint64_t _ValueTransactionModifier.init(value:transform:)()
{
  return _ValueTransactionModifier.init(value:transform:)();
}

uint64_t type metadata accessor for _ValueTransactionModifier()
{
  return type metadata accessor for _ValueTransactionModifier();
}

uint64_t static AccessibilityChildBehavior.ignore.getter()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t static AccessibilityChildBehavior.combine.getter()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t static AccessibilityChildBehavior.contain.getter()
{
  return static AccessibilityChildBehavior.contain.getter();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t PagingScrollTargetBehavior.init()()
{
  return PagingScrollTargetBehavior.init()();
}

uint64_t type metadata accessor for PagingScrollTargetBehavior()
{
  return type metadata accessor for PagingScrollTargetBehavior();
}

uint64_t UIViewRepresentableContext.coordinator.getter()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t type metadata accessor for _OverlayPreferenceModifier()
{
  return type metadata accessor for _OverlayPreferenceModifier();
}

uint64_t static AnimationCompletionCriteria.logicallyComplete.getter()
{
  return static AnimationCompletionCriteria.logicallyComplete.getter();
}

uint64_t type metadata accessor for AnimationCompletionCriteria()
{
  return type metadata accessor for AnimationCompletionCriteria();
}

uint64_t UIApplicationDelegateAdaptor.wrappedValue.getter()
{
  return UIApplicationDelegateAdaptor.wrappedValue.getter();
}

uint64_t type metadata accessor for UIApplicationDelegateAdaptor()
{
  return type metadata accessor for UIApplicationDelegateAdaptor();
}

uint64_t UIApplicationDelegateAdaptor.init(_:)()
{
  return UIApplicationDelegateAdaptor.init(_:)();
}

uint64_t type metadata accessor for AccessibilityCustomContentKey()
{
  return type metadata accessor for AccessibilityCustomContentKey();
}

uint64_t AccessibilityCustomContentKey.init(_:)()
{
  return AccessibilityCustomContentKey.init(_:)();
}

uint64_t type metadata accessor for NavigationSplitViewVisibility()
{
  return type metadata accessor for NavigationSplitViewVisibility();
}

uint64_t UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t static UIViewControllerRepresentable._layoutOptions(_:)()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t UIViewControllerRepresentable._identifiedViewTree(in:)()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewControllerRepresentable.body.getter()
{
  return UIViewControllerRepresentable.body.getter();
}

Swift::Void __swiftcall AXChartDescriptorRepresentable.updateChartDescriptor(_:)(AXChartDescriptor a1)
{
}

uint64_t type metadata accessor for AccessibilityAttachmentModifier()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t type metadata accessor for AccessibilityCustomContentEntry()
{
  return type metadata accessor for AccessibilityCustomContentEntry();
}

uint64_t AccessibilityCustomContentEntry.init(_:value:importance:)()
{
  return AccessibilityCustomContentEntry.init(_:value:importance:)();
}

uint64_t static AccessibilityAdjustmentDirection.== infix(_:_:)()
{
  return static AccessibilityAdjustmentDirection.== infix(_:_:)();
}

uint64_t type metadata accessor for AccessibilityAdjustmentDirection()
{
  return type metadata accessor for AccessibilityAdjustmentDirection();
}

uint64_t type metadata accessor for BalancedNavigationSplitViewStyle()
{
  return type metadata accessor for BalancedNavigationSplitViewStyle();
}

uint64_t type metadata accessor for PrimitiveButtonStyleConfiguration.Label()
{
  return type metadata accessor for PrimitiveButtonStyleConfiguration.Label();
}

uint64_t PrimitiveButtonStyleConfiguration.label.getter()
{
  return PrimitiveButtonStyleConfiguration.label.getter();
}

Swift::Void __swiftcall PrimitiveButtonStyleConfiguration.trigger()()
{
}

uint64_t type metadata accessor for PrimitiveButtonStyleConfiguration()
{
  return type metadata accessor for PrimitiveButtonStyleConfiguration();
}

uint64_t MatchedTransitionSourceConfiguration.background(_:)()
{
  return MatchedTransitionSourceConfiguration.background(_:)();
}

uint64_t MatchedTransitionSourceConfiguration.clipShape(_:)()
{
  return MatchedTransitionSourceConfiguration.clipShape(_:)();
}

uint64_t UIViewControllerRepresentableContext.coordinator.getter()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t static TypesettingLanguageAwareLineHeightRatio.disable.getter()
{
  return static TypesettingLanguageAwareLineHeightRatio.disable.getter();
}

uint64_t type metadata accessor for TypesettingLanguageAwareLineHeightRatio()
{
  return type metadata accessor for TypesettingLanguageAwareLineHeightRatio();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t type metadata accessor for EmptyMatchedTransitionSourceConfiguration()
{
  return type metadata accessor for EmptyMatchedTransitionSourceConfiguration();
}

uint64_t static Axis.Set.horizontal.getter()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t Axis.Set.init(rawValue:)()
{
  return Axis.Set.init(rawValue:)();
}

uint64_t static Axis.Set.vertical.getter()
{
  return static Axis.Set.vertical.getter();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t Edge.Set.init(rawValue:)()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
}

uint64_t Edge.init(rawValue:)()
{
  return Edge.init(rawValue:)();
}

uint64_t static Font.system(_:weight:)()
{
  return static Font.system(_:weight:)();
}

uint64_t Font.capHeight(in:)()
{
  return Font.capHeight(in:)();
}

uint64_t static Font.largeTitle.getter()
{
  return static Font.largeTitle.getter();
}

uint64_t static Font.subheadline.getter()
{
  return static Font.subheadline.getter();
}

uint64_t Font.monospacedDigit()()
{
  return Font.monospacedDigit()();
}

uint64_t static Font.body.getter()
{
  return static Font.body.getter();
}

uint64_t Font.bold()()
{
  return Font.bold()();
}

uint64_t static Font.title.getter()
{
  return static Font.title.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.Weight.bold.getter()
{
  return static Font.Weight.bold.getter();
}

uint64_t static Font.Weight.thin.getter()
{
  return static Font.Weight.thin.getter();
}

uint64_t static Font.Weight.light.getter()
{
  return static Font.Weight.light.getter();
}

uint64_t static Font.Weight.medium.getter()
{
  return static Font.Weight.medium.getter();
}

uint64_t static Font.Weight.regular.getter()
{
  return static Font.Weight.regular.getter();
}

uint64_t static Font.Weight.semibold.getter()
{
  return static Font.Weight.semibold.getter();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t static Font.system(_:design:weight:)()
{
  return static Font.system(_:design:weight:)();
}

uint64_t static Font.title2.getter()
{
  return static Font.title2.getter();
}

uint64_t static Font.title3.getter()
{
  return static Font.title3.getter();
}

uint64_t Font.weight(_:)()
{
  return Font.weight(_:)();
}

uint64_t type metadata accessor for Font.Context()
{
  return type metadata accessor for Font.Context();
}

uint64_t type metadata accessor for Font.Leading()
{
  return type metadata accessor for Font.Leading();
}

uint64_t static Font.caption.getter()
{
  return static Font.caption.getter();
}

uint64_t Font.leading(_:)()
{
  return Font.leading(_:)();
}

uint64_t static Font.caption2.getter()
{
  return static Font.caption2.getter();
}

uint64_t static Font.footnote.getter()
{
  return static Font.footnote.getter();
}

uint64_t static Font.headline.getter()
{
  return static Font.headline.getter();
}

uint64_t type metadata accessor for Font.TextStyle()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t Font.smallCaps()()
{
  return Font.smallCaps()();
}

uint64_t Font.init(_:)()
{
  return Font.init(_:)();
}

uint64_t Link.init(destination:label:)()
{
  return Link.init(destination:label:)();
}

uint64_t List.init(selection:content:)()
{
  return List.init(selection:content:)();
}

uint64_t List<>.init(content:)()
{
  return List<>.init(content:)();
}

uint64_t type metadata accessor for List()
{
  return type metadata accessor for List();
}

uint64_t Menu.init(content:label:)()
{
  return Menu.init(content:label:)();
}

uint64_t type metadata accessor for Menu()
{
  return type metadata accessor for Menu();
}

uint64_t Path.cgPath.getter()
{
  return Path.cgPath.getter();
}

uint64_t Path.addPath(_:transform:)()
{
  return Path.addPath(_:transform:)();
}

uint64_t Path.strokedPath(_:)()
{
  return Path.strokedPath(_:)();
}

uint64_t Path.init(roundedRect:cornerRadius:style:)()
{
  return Path.init(roundedRect:cornerRadius:style:)();
}

uint64_t Path.addRoundedRect(in:cornerSize:style:transform:)()
{
  return Path.addRoundedRect(in:cornerSize:style:transform:)();
}

uint64_t Path.move(to:)()
{
  return Path.move(to:)();
}

uint64_t Path.addLine(to:)()
{
  return Path.addLine(to:)();
}

uint64_t Path.addCurve(to:control1:control2:)()
{
  return Path.addCurve(to:control1:control2:)();
}

uint64_t Path.init(ellipseIn:)()
{
  return Path.init(ellipseIn:)();
}

uint64_t Path.init()()
{
  return Path.init()();
}

uint64_t Path.init(_:)()
{
  return Path.init(_:)();
}

{
  return Path.init(_:)();
}

{
  return Path.init(_:)();
}

uint64_t Text.init(temporalString:font:)()
{
  return Text.init(temporalString:font:)();
}

uint64_t Text.fontWeight(_:)()
{
  return Text.fontWeight(_:)();
}

uint64_t type metadata accessor for Text.WritingMode()
{
  return type metadata accessor for Text.WritingMode();
}

uint64_t Text.Measurements.numberOfLines(of:in:writingMode:)()
{
  return Text.Measurements.numberOfLines(of:in:writingMode:)();
}

uint64_t Text.Measurements.size(of:in:writingMode:)()
{
  return Text.Measurements.size(of:in:writingMode:)();
}

uint64_t Text.Measurements.init()()
{
  return Text.Measurements.init()();
}

uint64_t type metadata accessor for Text.Measurements()
{
  return type metadata accessor for Text.Measurements();
}

uint64_t Text.baselineOffset(_:)()
{
  return Text.baselineOffset(_:)();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t Text.monospacedDigit()()
{
  return Text.monospacedDigit()();
}

uint64_t Text.accessibilityLabel(_:)()
{
  return Text.accessibilityLabel(_:)();
}

uint64_t Text.accessibilityLabel<A>(_:)()
{
  return Text.accessibilityLabel<A>(_:)();
}

uint64_t static Text.+ infix(_:_:)()
{
  return static Text.+ infix(_:_:)();
}

uint64_t static Text.== infix(_:_:)()
{
  return static Text.== infix(_:_:)();
}

uint64_t Text.typesettingLanguageAwareLineHeightRatio(_:isEnabled:)()
{
  return Text.typesettingLanguageAwareLineHeightRatio(_:isEnabled:)();
}

uint64_t type metadata accessor for Text.Case()
{
  return type metadata accessor for Text.Case();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t static Text.Scale.default.getter()
{
  return static Text.Scale.default.getter();
}

uint64_t static Text.Scale.secondary.getter()
{
  return static Text.Scale.secondary.getter();
}

uint64_t type metadata accessor for Text.Scale()
{
  return type metadata accessor for Text.Scale();
}

uint64_t static Text.Sizing.adjustsForOversizedCharacters.getter()
{
  return static Text.Sizing.adjustsForOversizedCharacters.getter();
}

uint64_t type metadata accessor for Text.Sizing()
{
  return type metadata accessor for Text.Sizing();
}

uint64_t Text.shadow(color:radius:x:y:)()
{
  return Text.shadow(color:radius:x:y:)();
}

uint64_t static Text.DateStyle.time.getter()
{
  return static Text.DateStyle.time.getter();
}

uint64_t type metadata accessor for Text.DateStyle()
{
  return type metadata accessor for Text.DateStyle();
}

uint64_t static Text.LineStyle.single.getter()
{
  return static Text.LineStyle.single.getter();
}

uint64_t type metadata accessor for Text.LineStyle()
{
  return type metadata accessor for Text.LineStyle();
}

uint64_t Text.textScale(_:isEnabled:)()
{
  return Text.textScale(_:isEnabled:)();
}

uint64_t Text.init(_:style:)()
{
  return Text.init(_:style:)();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t Text.init(_:)()
{
  return Text.init(_:)();
}

{
  return Text.init(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t View.appEntity<A>(_:state:)()
{
  return View.appEntity<A>(_:state:)();
}

uint64_t View.offsetXWithinBounds(_:)()
{
  return View.offsetXWithinBounds(_:)();
}

uint64_t View.setForegroundEffect(_:)()
{
  return View.setForegroundEffect(_:)();
}

uint64_t View.statusBarPreserving(preferredColorScheme:)()
{
  return View.statusBarPreserving(preferredColorScheme:)();
}

uint64_t View.enableForegroundEffects()()
{
  return View.enableForegroundEffects()();
}

uint64_t View.setForegroundEffectContainer()()
{
  return View.setForegroundEffectContainer()();
}

uint64_t View.isHidden(_:defaultAccessibilityHidden:)()
{
  return View.isHidden(_:defaultAccessibilityHidden:)();
}

uint64_t View.performanceTestConditions(_:)()
{
  return View.performanceTestConditions(_:)();
}

uint64_t View.buttons(_:buttons:)()
{
  return View.buttons(_:buttons:)();
}

uint64_t View.delegate(_:)()
{
  return View.delegate(_:)();
}

uint64_t View.overviewTableBackground(_:_:)()
{
  return View.overviewTableBackground(_:_:)();
}

uint64_t View.chartXAxis<A>(content:)()
{
  return View.chartXAxis<A>(content:)();
}

uint64_t View.chartYAxis<A>(content:)()
{
  return View.chartYAxis<A>(content:)();
}

uint64_t View.chartXScale<A>(range:type:)()
{
  return View.chartXScale<A>(range:type:)();
}

uint64_t View.chartXScale<A>(domain:type:)()
{
  return View.chartXScale<A>(domain:type:)();
}

uint64_t View.chartYScale<A, B>(domain:range:type:)()
{
  return View.chartYScale<A, B>(domain:range:type:)();
}

uint64_t View.chartOverlay<A>(alignment:content:)()
{
  return View.chartOverlay<A>(alignment:content:)();
}

uint64_t View.chartBackground<A>(alignment:content:)()
{
  return View.chartBackground<A>(alignment:content:)();
}

uint64_t View.tipBackground<A>(_:)()
{
  return View.tipBackground<A>(_:)();
}

uint64_t View.navigationSplitViewStyle<A>(_:)()
{
  return View.navigationSplitViewStyle<A>(_:)();
}

uint64_t View.tabViewStyle<A>(_:)()
{
  return View.tabViewStyle<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.progressViewStyle<A>(_:)()
{
  return View.progressViewStyle<A>(_:)();
}

uint64_t View.background<A>(alignment:content:)()
{
  return View.background<A>(alignment:content:)();
}

uint64_t View.background<A, B>(_:in:fillStyle:)()
{
  return View.background<A, B>(_:in:fillStyle:)();
}

uint64_t View.background<A>(_:alignment:)()
{
  return View.background<A>(_:alignment:)();
}

uint64_t View.fontWeight(_:)()
{
  return View.fontWeight(_:)();
}

uint64_t View.labelStyle<A>(_:)()
{
  return View.labelStyle<A>(_:)();
}

uint64_t View.searchable(text:placement:prompt:)()
{
  return View.searchable(text:placement:prompt:)();
}

uint64_t View.textSizing(_:)()
{
  return View.textSizing(_:)();
}

uint64_t View.transition(_:)()
{
  return View.transition(_:)();
}

uint64_t View.accentColor(_:)()
{
  return View.accentColor(_:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

{
  return View.buttonStyle<A>(_:)();
}

uint64_t View.colorScheme(_:)()
{
  return View.colorScheme(_:)();
}

uint64_t View.environment<A>(_:)()
{
  return View.environment<A>(_:)();
}

uint64_t View.environment<A>(_:_:)()
{
  return View.environment<A>(_:_:)();
}

uint64_t View.hoverEffect<A>(_:isEnabled:)()
{
  return View.hoverEffect<A>(_:isEnabled:)();
}

uint64_t View.listPadding(_:_:anchor:)()
{
  return View.listPadding(_:_:anchor:)();
}

uint64_t View.onDisappear(perform:)()
{
  return View.onDisappear(perform:)();
}

uint64_t View.pickerStyle<A>(_:)()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t View.transaction<A>(_:body:)()
{
  return View.transaction<A>(_:body:)();
}

uint64_t View.transaction(_:)()
{
  return View.transaction(_:)();
}

uint64_t View.dividerStyle<A>(_:)()
{
  return View.dividerStyle<A>(_:)();
}

uint64_t View.drawingGroup(opaque:colorMode:)()
{
  return View.drawingGroup(opaque:colorMode:)();
}

uint64_t View.keyboardType(_:)()
{
  return View.keyboardType(_:)();
}

uint64_t View.labelsHidden()()
{
  return View.labelsHidden()();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t View.swipeActions<A>(edge:allowsFullSwipe:isPresented:content:)()
{
  return View.swipeActions<A>(edge:allowsFullSwipe:isPresented:content:)();
}

uint64_t View.swipeActions<A>(edge:allowsFullSwipe:style:content:)()
{
  return View.swipeActions<A>(edge:allowsFullSwipe:style:content:)();
}

uint64_t View.visualEffect<A>(_:)()
{
  return View.visualEffect<A>(_:)();
}

uint64_t View.accessibility(removeTraits:)()
{
  return View.accessibility(removeTraits:)();
}

uint64_t View.accessibility(label:)()
{
  return View.accessibility(label:)();
}

uint64_t View.accessibility(hidden:)()
{
  return View.accessibility(hidden:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.listBackground(_:)()
{
  return View.listBackground(_:)();
}

uint64_t View.listBackground<A>(_:)()
{
  return View.listBackground<A>(_:)();
}

uint64_t View.scrollDisabled(_:)()
{
  return View.scrollDisabled(_:)();
}

uint64_t View.scrollPosition<A>(id:anchor:)()
{
  return View.scrollPosition<A>(id:anchor:)();
}

uint64_t View.dynamicTypeSize(_:)()
{
  return View.dynamicTypeSize(_:)();
}

uint64_t View.dynamicTypeSize<A>(_:)()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t View.fullScreenCover<A>(isPresented:onDismiss:content:)()
{
  return View.fullScreenCover<A>(isPresented:onDismiss:content:)();
}

uint64_t View.monospacedDigit()()
{
  return View.monospacedDigit()();
}

uint64_t View.navigationTitle(_:)()
{
  return View.navigationTitle(_:)();
}

{
  return View.navigationTitle(_:)();
}

uint64_t View.navigationTitle<A>(_:)()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t View._fullScreenSheet<A>(isPresented:onDismiss:content:)()
{
  return View._fullScreenSheet<A>(isPresented:onDismiss:content:)();
}

uint64_t View._onButtonGesture(pressing:perform:)()
{
  return View._onButtonGesture(pressing:perform:)();
}

uint64_t View.allowsHitTesting(_:)()
{
  return View.allowsHitTesting(_:)();
}

uint64_t View.listRowSeparator(_:edges:)()
{
  return View.listRowSeparator(_:edges:)();
}

uint64_t View.scrollIndicators(_:axes:)()
{
  return View.scrollIndicators(_:axes:)();
}

uint64_t View.accessibilityHint(_:)()
{
  return View.accessibilityHint(_:)();
}

uint64_t View.accessibilityHint<A>(_:)()
{
  return View.accessibilityHint<A>(_:)();
}

uint64_t View.gestureRecognizer<A>(_:)()
{
  return View.gestureRecognizer<A>(_:)();
}

uint64_t View.onContinuousHover<A>(coordinateSpace:perform:)()
{
  return View.onContinuousHover<A>(coordinateSpace:perform:)();
}

uint64_t View.systemColorScheme()()
{
  return View.systemColorScheme()();
}

uint64_t View.toolbarBackground(_:for:)()
{
  return View.toolbarBackground(_:for:)();
}

uint64_t View.toolbarBackground<A>(_:for:)()
{
  return View.toolbarBackground<A>(_:for:)();
}

uint64_t View.accessibilityLabel(_:)()
{
  return View.accessibilityLabel(_:)();
}

{
  return View.accessibilityLabel(_:)();
}

uint64_t View.accessibilityLabel<A>(_:)()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t View.accessibilityValue(_:)()
{
  return View.accessibilityValue(_:)();
}

uint64_t View.accessibilityValue<A>(_:)()
{
  return View.accessibilityValue<A>(_:)();
}

uint64_t View.navigationBarItems<A>(trailing:)()
{
  return View.navigationBarItems<A>(trailing:)();
}

uint64_t View.onLongPressGesture(minimumDuration:maximumDistance:pressing:perform:)()
{
  return View.onLongPressGesture(minimumDuration:maximumDistance:pressing:perform:)();
}

uint64_t View.presentationSizing<A>(_:)()
{
  return View.presentationSizing<A>(_:)();
}

uint64_t View.scrollTargetLayout(isEnabled:)()
{
  return View.scrollTargetLayout(isEnabled:)();
}

uint64_t View.accessibilityAction(_:_:)()
{
  return View.accessibilityAction(_:_:)();
}

uint64_t View.accessibilityHidden(_:)()
{
  return View.accessibilityHidden(_:)();
}

uint64_t View.navigationBarHidden(_:)()
{
  return View.navigationBarHidden(_:)();
}

uint64_t View.accessibilityElement(children:)()
{
  return View.accessibilityElement(children:)();
}

uint64_t View.navigationTransition<A>(_:)()
{
  return View.navigationTransition<A>(_:)();
}

uint64_t View.scrollTargetBehavior<A>(_:)()
{
  return View.scrollTargetBehavior<A>(_:)();
}

uint64_t View.transformEnvironment<A>(_:transform:)()
{
  return View.transformEnvironment<A>(_:transform:)();
}

uint64_t View.accessibilityChildren<A>(children:)()
{
  return View.accessibilityChildren<A>(children:)();
}

uint64_t View.disableAutocorrection(_:)()
{
  return View.disableAutocorrection(_:)();
}

uint64_t View.matchedGeometryEffect<A, B>(id:in:clipShape:properties:anchor:isSource:)()
{
  return View.matchedGeometryEffect<A, B>(id:in:clipShape:properties:anchor:isSource:)();
}

uint64_t View.searchVibrancyEnabled(_:)()
{
  return View.searchVibrancyEnabled(_:)();
}

uint64_t View.accessibilityAddTraits(_:)()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t View.containerRelativeFrame(_:alignment:)()
{
  return View.containerRelativeFrame(_:alignment:)();
}

uint64_t View.overlayPreferenceValue<A, B>(_:alignment:_:)()
{
  return View.overlayPreferenceValue<A, B>(_:alignment:_:)();
}

uint64_t View.accessibilityIdentifier(_:)()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t View.matchedTransitionSource<A, B>(id:in:configuration:)()
{
  return View.matchedTransitionSource<A, B>(id:in:configuration:)();
}

uint64_t View.accessibilityInputLabels<A>(_:)()
{
  return View.accessibilityInputLabels<A>(_:)();
}

uint64_t View.onScrollVisibilityChange(threshold:_:)()
{
  return View.onScrollVisibilityChange(threshold:_:)();
}

uint64_t View.accessibilityRemoveTraits(uiTraits:)()
{
  return View.accessibilityRemoveTraits(uiTraits:)();
}

uint64_t View.navigationDestinationScope()()
{
  return View.navigationDestinationScope()();
}

uint64_t View.accessibilityRepresentation<A>(representation:)()
{
  return View.accessibilityRepresentation<A>(representation:)();
}

uint64_t View.accessibilityChartDescriptor<A>(_:)()
{
  return View.accessibilityChartDescriptor<A>(_:)();
}

uint64_t View.navigationBarTitleDisplayMode(_:)()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t View.id<A>(_:)()
{
  return View.id<A>(_:)();
}

uint64_t View.accessibilityIgnoresInvertColors(_:)()
{
  return View.accessibilityIgnoresInvertColors(_:)();
}

uint64_t View.accessibilityShowsLargeContentViewer<A>(_:)()
{
  return View.accessibilityShowsLargeContentViewer<A>(_:)();
}

uint64_t View.accessibilityRespondsToUserInteraction(_:)()
{
  return View.accessibilityRespondsToUserInteraction(_:)();
}

uint64_t View.typesettingLanguageAwareLineHeightRatio(_:isEnabled:)()
{
  return View.typesettingLanguageAwareLineHeightRatio(_:isEnabled:)();
}

uint64_t View.alert(isPresented:content:)()
{
  return View.alert(isPresented:content:)();
}

uint64_t View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t View.sheet<A>(isPresented:onDismiss:content:)()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t View._trait<A>(_:_:)()
{
  return View._trait<A>(_:_:)();
}

uint64_t View.gesture<A>(_:including:)()
{
  return View.gesture<A>(_:including:)();
}

uint64_t View.gesture<A>(_:)()
{
  return View.gesture<A>(_:)();
}

uint64_t View.opacity(_:)()
{
  return View.opacity(_:)();
}

uint64_t View.overlay<A>(alignment:content:)()
{
  return View.overlay<A>(alignment:content:)();
}

uint64_t View.padding(_:)()
{
  return View.padding(_:)();
}

uint64_t View.padding(_:_:)()
{
  return View.padding(_:_:)();
}

uint64_t View.toolbar<A>(content:)()
{
  return View.toolbar<A>(content:)();
}

uint64_t View.modifier<A>(_:)()
{
  return View.modifier<A>(_:)();
}

uint64_t View.onAppear(perform:)()
{
  return View.onAppear(perform:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t View.redacted(reason:)()
{
  return View.redacted(reason:)();
}

uint64_t View.animation<A>(_:body:)()
{
  return View.animation<A>(_:body:)();
}

uint64_t View.animation<A>(_:value:)()
{
  return View.animation<A>(_:value:)();
}

uint64_t View.formSheet<A>(isPresented:content:)()
{
  return View.formSheet<A>(isPresented:content:)();
}

uint64_t View.listStyle<A>(_:)()
{
  return View.listStyle<A>(_:)();
}

uint64_t View.menuStyle<A>(_:)()
{
  return View.menuStyle<A>(_:)();
}

uint64_t View.onOpenURL(perform:)()
{
  return View.onOpenURL(perform:)();
}

uint64_t Alert.init(title:message:dismissButton:)()
{
  return Alert.init(title:message:dismissButton:)();
}

uint64_t Alert.init(title:message:primaryButton:secondaryButton:)()
{
  return Alert.init(title:message:primaryButton:secondaryButton:)();
}

uint64_t static Alert.Button.default(_:action:)()
{
  return static Alert.Button.default(_:action:)();
}

uint64_t type metadata accessor for Alert.Button()
{
  return type metadata accessor for Alert.Button();
}

uint64_t Color.cgColor.getter()
{
  return Color.cgColor.getter();
}

uint64_t Color.init(uiColor:)()
{
  return Color.init(uiColor:)();
}

uint64_t static Color.accentColor.getter()
{
  return static Color.accentColor.getter();
}

uint64_t Color.init(hex:)()
{
  return Color.init(hex:)();
}

uint64_t Color.hex.getter()
{
  return Color.hex.getter();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.== infix(_:_:)()
{
  return static Color.== infix(_:_:)();
}

uint64_t Color.init(hue:saturation:brightness:opacity:)()
{
  return Color.init(hue:saturation:brightness:opacity:)();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.blue.getter()
{
  return static Color.blue.getter();
}

uint64_t static Color.cyan.getter()
{
  return static Color.cyan.getter();
}

uint64_t static Color.gray.getter()
{
  return static Color.gray.getter();
}

uint64_t Color.hash(into:)()
{
  return Color.hash(into:)();
}

uint64_t static Color.pink.getter()
{
  return static Color.pink.getter();
}

uint64_t static Color.teal.getter()
{
  return static Color.teal.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.green.getter()
{
  return static Color.green.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t static Color.orange.getter()
{
  return static Color.orange.getter();
}

uint64_t static Color.purple.getter()
{
  return static Color.purple.getter();
}

uint64_t static Color.yellow.getter()
{
  return static Color.yellow.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t static Color.secondary.getter()
{
  return static Color.secondary.getter();
}

uint64_t Color.init(_:red:green:blue:opacity:)()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t Color.init(_:white:opacity:)()
{
  return Color.init(_:white:opacity:)();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Group<A>.init(content:)()
{
  return Group<A>.init(content:)();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t static Image.sunriseSunsetDay.getter()
{
  return static Image.sunriseSunsetDay.getter();
}

uint64_t static Image.sunriseSunsetNight.getter()
{
  return static Image.sunriseSunsetNight.getter();
}

uint64_t Image.init(decorative:scale:orientation:)()
{
  return Image.init(decorative:scale:orientation:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.renderingMode(_:)()
{
  return Image.renderingMode(_:)();
}

uint64_t Image.init(_internalSystemName:)()
{
  return Image.init(_internalSystemName:)();
}

uint64_t Image.symbolRenderingMode(_:)()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t static Image.TemplateRenderingMode.macSafeOriginal.getter()
{
  return static Image.TemplateRenderingMode.macSafeOriginal.getter();
}

uint64_t type metadata accessor for Image.TemplateRenderingMode()
{
  return type metadata accessor for Image.TemplateRenderingMode();
}

uint64_t static Image.== infix(_:_:)()
{
  return static Image.== infix(_:_:)();
}

uint64_t type metadata accessor for Image.Scale()
{
  return type metadata accessor for Image.Scale();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t Image.init(_:bundle:)()
{
  return Image.init(_:bundle:)();
}

uint64_t Label.init(title:icon:)()
{
  return Label.init(title:icon:)();
}

uint64_t Label<>.init<A>(_:systemImage:)()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t static Scene._makeScene(scene:inputs:)()
{
  return static Scene._makeScene(scene:inputs:)();
}

uint64_t Scene.extendedLaunchTestName(_:)()
{
  return Scene.extendedLaunchTestName(_:)();
}

uint64_t Shape.layoutDirectionBehavior.getter()
{
  return Shape.layoutDirectionBehavior.getter();
}

uint64_t static Shape.role.getter()
{
  return static Shape.role.getter();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t type metadata accessor for State()
{
  return type metadata accessor for State();
}

uint64_t Button.init(role:action:label:)()
{
  return Button.init(role:action:label:)();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t Button<>.init(_:action:)()
{
  return Button<>.init(_:action:)();
}

uint64_t type metadata accessor for Button()
{
  return type metadata accessor for Button();
}

uint64_t Canvas.rendersAsynchronously.setter()
{
  return Canvas.rendersAsynchronously.setter();
}

uint64_t Canvas.rendersFirstFrameAsynchronously.setter()
{
  return Canvas.rendersFirstFrameAsynchronously.setter();
}

uint64_t Canvas<>.init(opaque:colorMode:rendersAsynchronously:renderer:)()
{
  return Canvas<>.init(opaque:colorMode:rendersAsynchronously:renderer:)();
}

uint64_t Circle.path(in:)()
{
  return Circle.path(in:)();
}

uint64_t HStack.init(alignment:spacing:content:)()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for HStack()
{
  return type metadata accessor for HStack();
}

uint64_t type metadata accessor for IDView()
{
  return type metadata accessor for IDView();
}

uint64_t static Layout._makeLayoutView(root:inputs:body:)()
{
  return static Layout._makeLayoutView(root:inputs:body:)();
}

uint64_t Layout.updateCache(_:subviews:)()
{
  return Layout.updateCache(_:subviews:)();
}

uint64_t static Layout.layoutProperties.getter()
{
  return static Layout.layoutProperties.getter();
}

uint64_t Layout.spacing(subviews:cache:)()
{
  return Layout.spacing(subviews:cache:)();
}

uint64_t Layout<>.makeCache(subviews:)()
{
  return Layout<>.makeCache(subviews:)();
}

uint64_t Picker.init(selection:label:content:)()
{
  return Picker.init(selection:label:content:)();
}

uint64_t Picker<>.init(_:selection:content:)()
{
  return Picker<>.init(_:selection:content:)();
}

uint64_t type metadata accessor for Picker()
{
  return type metadata accessor for Picker();
}

uint64_t Toggle.init(isOn:label:)()
{
  return Toggle.init(isOn:label:)();
}

uint64_t Toggle<>.init<A>(_:isOn:)()
{
  return Toggle<>.init<A>(_:isOn:)();
}

uint64_t VStack.init(alignment:spacing:content:)()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for VStack()
{
  return type metadata accessor for VStack();
}

uint64_t ZStack.init(alignment:content:)()
{
  return ZStack.init(alignment:content:)();
}

uint64_t type metadata accessor for ZStack()
{
  return type metadata accessor for ZStack();
}

uint64_t AnyView.init<A>(_:)()
{
  return AnyView.init<A>(_:)();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.wrappedValue.setter()
{
  return Binding.wrappedValue.setter();
}

uint64_t Binding.subscript.getter()
{
  return Binding.subscript.getter();
}

uint64_t Binding.projectedValue.getter()
{
  return Binding.projectedValue.getter();
}

uint64_t Binding.init(get:set:)()
{
  return Binding.init(get:set:)();
}

uint64_t static Binding.constant(_:)()
{
  return static Binding.constant(_:)();
}

uint64_t type metadata accessor for Binding()
{
  return type metadata accessor for Binding();
}

uint64_t type metadata accessor for Capsule()
{
  return type metadata accessor for Capsule();
}

uint64_t Divider.init()()
{
  return Divider.init()();
}

uint64_t type metadata accessor for Divider()
{
  return type metadata accessor for Divider();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

{
  return ForEach<>.init(_:content:)();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

{
  return ForEach<>.init(_:id:content:)();
}

uint64_t type metadata accessor for ForEach()
{
  return type metadata accessor for ForEach();
}

uint64_t Gesture.onEnded(_:)()
{
  return Gesture.onEnded(_:)();
}

uint64_t Gesture<>.onChanged(_:)()
{
  return Gesture<>.onChanged(_:)();
}

uint64_t Section<>.init(header:content:)()
{
  return Section<>.init(header:content:)();
}

uint64_t Section<>.init(header:footer:content:)()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t Section<>.init(content:)()
{
  return Section<>.init(content:)();
}

uint64_t Section<>.init(footer:content:)()
{
  return Section<>.init(footer:content:)();
}

uint64_t TabView.init(selection:content:)()
{
  return TabView.init(selection:content:)();
}

uint64_t type metadata accessor for TabView()
{
  return type metadata accessor for TabView();
}

uint64_t Bindable.projectedValue.getter()
{
  return Bindable.projectedValue.getter();
}

uint64_t Bindable<A>.init(wrappedValue:)()
{
  return Bindable<A>.init(wrappedValue:)();
}

uint64_t Bindable<A>.subscript.getter()
{
  return Bindable<A>.subscript.getter();
}

uint64_t type metadata accessor for EditMode()
{
  return type metadata accessor for EditMode();
}

uint64_t Gradient.init(_:)()
{
  return Gradient.init(_:)();
}

uint64_t static Gradient.== infix(_:_:)()
{
  return static Gradient.== infix(_:_:)();
}

uint64_t static Gradient.Stop.== infix(_:_:)()
{
  return static Gradient.Stop.== infix(_:_:)();
}

uint64_t Gradient.Stop.init(color:location:)()
{
  return Gradient.Stop.init(color:location:)();
}

uint64_t Gradient.init(stops:)()
{
  return Gradient.init(stops:)();
}

uint64_t Gradient.init(colors:)()
{
  return Gradient.init(colors:)();
}

uint64_t type metadata accessor for GridItem.Size()
{
  return type metadata accessor for GridItem.Size();
}

uint64_t type metadata accessor for GridItem()
{
  return type metadata accessor for GridItem();
}

uint64_t GridItem.init(_:spacing:alignment:)()
{
  return GridItem.init(_:spacing:alignment:)();
}

uint64_t static Material.coreMaterial(bundle:provider:)()
{
  return static Material.coreMaterial(bundle:provider:)();
}

uint64_t Material.applyingFiltersInPlace(_:)()
{
  return Material.applyingFiltersInPlace(_:)();
}

uint64_t static Material.thin.getter()
{
  return static Material.thin.getter();
}

uint64_t static Material.thick.getter()
{
  return static Material.thick.getter();
}

uint64_t type metadata accessor for Material()
{
  return type metadata accessor for Material();
}

uint64_t static Alignment.topLeading.getter()
{
  return static Alignment.topLeading.getter();
}

uint64_t static Alignment.topTrailing.getter()
{
  return static Alignment.topTrailing.getter();
}

uint64_t static Alignment.bottomLeading.getter()
{
  return static Alignment.bottomLeading.getter();
}

uint64_t static Alignment.bottomTrailing.getter()
{
  return static Alignment.bottomTrailing.getter();
}

uint64_t static Alignment.== infix(_:_:)()
{
  return static Alignment.== infix(_:_:)();
}

uint64_t static Alignment.top.getter()
{
  return static Alignment.top.getter();
}

uint64_t static Alignment.bottom.getter()
{
  return static Alignment.bottom.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Alignment.leading.getter()
{
  return static Alignment.leading.getter();
}

uint64_t static Alignment.trailing.getter()
{
  return static Alignment.trailing.getter();
}

uint64_t static Animation.timingCurve(_:_:_:_:duration:)()
{
  return static Animation.timingCurve(_:_:_:_:duration:)();
}

uint64_t static Animation.interpolatingSpring(mass:stiffness:damping:initialVelocity:)()
{
  return static Animation.interpolatingSpring(mass:stiffness:damping:initialVelocity:)();
}

uint64_t Animation.delay(_:)()
{
  return Animation.delay(_:)();
}

uint64_t static Animation.easeIn(duration:)()
{
  return static Animation.easeIn(duration:)();
}

uint64_t static Animation.linear(duration:)()
{
  return static Animation.linear(duration:)();
}

uint64_t static Animation.linear.getter()
{
  return static Animation.linear.getter();
}

uint64_t static Animation.spring(response:dampingFraction:blendDuration:)()
{
  return static Animation.spring(response:dampingFraction:blendDuration:)();
}

uint64_t static Animation.default.getter()
{
  return static Animation.default.getter();
}

uint64_t static Animation.easeInOut(duration:)()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t static Animation.easeInOut.getter()
{
  return static Animation.easeInOut.getter();
}

uint64_t type metadata accessor for BlendMode()
{
  return type metadata accessor for BlendMode();
}

uint64_t LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)()
{
  return LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)();
}

uint64_t Namespace.wrappedValue.getter()
{
  return Namespace.wrappedValue.getter();
}

uint64_t static Namespace.ID.== infix(_:_:)()
{
  return static Namespace.ID.== infix(_:_:)();
}

uint64_t Namespace.ID.hash(into:)()
{
  return Namespace.ID.hash(into:)();
}

uint64_t Rectangle.path(in:)()
{
  return Rectangle.path(in:)();
}

uint64_t TextField<>.init(_:text:onEditingChanged:onCommit:)()
{
  return TextField<>.init(_:text:onEditingChanged:onCommit:)();
}

uint64_t type metadata accessor for TupleView()
{
  return type metadata accessor for TupleView();
}

uint64_t TupleView.init(_:)()
{
  return TupleView.init(_:)();
}

uint64_t static UnitPoint.topLeading.getter()
{
  return static UnitPoint.topLeading.getter();
}

uint64_t static UnitPoint.top.getter()
{
  return static UnitPoint.top.getter();
}

uint64_t static UnitPoint.bottom.getter()
{
  return static UnitPoint.bottom.getter();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
}

uint64_t static UnitPoint.leading.getter()
{
  return static UnitPoint.leading.getter();
}

uint64_t static UnitPoint.trailing.getter()
{
  return static UnitPoint.trailing.getter();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
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

uint64_t static DispatchQoS.utility.getter()
{
  return static DispatchQoS.utility.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

{
  return + infix(_:_:)();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
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

uint64_t type metadata accessor for SHA256()
{
  return type metadata accessor for SHA256();
}

uint64_t WeatherDescription.init(stringLiteral:)()
{
  return WeatherDescription.init(stringLiteral:)();
}

uint64_t WeatherDescription.init(historicalFact:)()
{
  return WeatherDescription.init(historicalFact:)();
}

uint64_t static WeatherDescription.== infix(_:_:)()
{
  return static WeatherDescription.== infix(_:_:)();
}

uint64_t static WeatherDescription.read(from:)()
{
  return static WeatherDescription.read(from:)();
}

uint64_t WeatherDescription.write(to:)()
{
  return WeatherDescription.write(to:)();
}

uint64_t WeatherDescription.init(format:_:)()
{
  return WeatherDescription.init(format:_:)();
}

uint64_t WeatherDescription.string.getter()
{
  return WeatherDescription.string.getter();
}

uint64_t static WeatherDescription.string(_:)()
{
  return static WeatherDescription.string(_:)();
}

uint64_t type metadata accessor for WeatherDescription.Argument()
{
  return type metadata accessor for WeatherDescription.Argument();
}

uint64_t WeatherDescription.formatted(font:color:)()
{
  return WeatherDescription.formatted(font:color:)();
}

uint64_t type metadata accessor for WeatherDescription()
{
  return type metadata accessor for WeatherDescription();
}

uint64_t static WeatherFormatStyle<>.weather(_:usage:locale:)()
{
  return static WeatherFormatStyle<>.weather(_:usage:locale:)();
}

uint64_t static WeatherFormatStyle<>.weather(_:usage:scaling:trimLeadingZeroes:sign:locale:)()
{
  return static WeatherFormatStyle<>.weather(_:usage:scaling:trimLeadingZeroes:sign:locale:)();
}

uint64_t static WeatherFormatStyle<>.weather(_:usage:scaling:trimLeadingZeroes:locale:)()
{
  return static WeatherFormatStyle<>.weather(_:usage:scaling:trimLeadingZeroes:locale:)();
}

uint64_t static WeatherFormatStyle<>.weather(_:locale:)()
{
  return static WeatherFormatStyle<>.weather(_:locale:)();
}

{
  return static WeatherFormatStyle<>.weather(_:locale:)();
}

uint64_t static WeatherFormatStyle<>.weather.getter()
{
  return static WeatherFormatStyle<>.weather.getter();
}

uint64_t static WeatherFormatStyle<>.weather(_:sign:locale:)()
{
  return static WeatherFormatStyle<>.weather(_:sign:locale:)();
}

uint64_t WeatherVFXViewModel.effect.getter()
{
  return WeatherVFXViewModel.effect.getter();
}

uint64_t type metadata accessor for WeatherVFXViewModel()
{
  return type metadata accessor for WeatherVFXViewModel();
}

uint64_t WeatherConditionIcon.name.getter()
{
  return WeatherConditionIcon.name.getter();
}

uint64_t type metadata accessor for WeatherConditionIcon()
{
  return type metadata accessor for WeatherConditionIcon();
}

uint64_t type metadata accessor for WeatherFormatScaling()
{
  return type metadata accessor for WeatherFormatScaling();
}

uint64_t WeatherDayVarianceView.init(weekMaxTemp:weekMinTemp:dayHighTemp:dayLowTemp:currentTemp:isDaylight:temperatureGradient:)()
{
  return WeatherDayVarianceView.init(weekMaxTemp:weekMinTemp:dayHighTemp:dayLowTemp:currentTemp:isDaylight:temperatureGradient:)();
}

uint64_t type metadata accessor for WeatherDayVarianceView()
{
  return type metadata accessor for WeatherDayVarianceView();
}

uint64_t type metadata accessor for WeatherEventDescription()
{
  return type metadata accessor for WeatherEventDescription();
}

uint64_t type metadata accessor for WeatherFormatPlaceholder()
{
  return type metadata accessor for WeatherFormatPlaceholder();
}

uint64_t WeatherQueryParameterKey.shouldRedact.getter()
{
  return WeatherQueryParameterKey.shouldRedact.getter();
}

uint64_t WeatherQueryParameterKey.init(rawValue:)()
{
  return WeatherQueryParameterKey.init(rawValue:)();
}

uint64_t WeatherQueryParameterKey.rawValue.getter()
{
  return WeatherQueryParameterKey.rawValue.getter();
}

uint64_t type metadata accessor for WeatherQueryParameterKey()
{
  return type metadata accessor for WeatherQueryParameterKey();
}

uint64_t WeatherProviderAttribution.logo.getter()
{
  return WeatherProviderAttribution.logo.getter();
}

uint64_t WeatherProviderAttribution.init(name:logo:source:)()
{
  return WeatherProviderAttribution.init(name:logo:source:)();
}

uint64_t WeatherProviderAttribution.name.getter()
{
  return WeatherProviderAttribution.name.getter();
}

uint64_t WeatherProviderAttribution.source.getter()
{
  return WeatherProviderAttribution.source.getter();
}

uint64_t type metadata accessor for WeatherProviderAttribution()
{
  return type metadata accessor for WeatherProviderAttribution();
}

uint64_t WeatherConditionGradientModel.init(conditionKind:elevation:isDaylight:presentation:cloudCover:cloudKind:)()
{
  return WeatherConditionGradientModel.init(conditionKind:elevation:isDaylight:presentation:cloudCover:cloudKind:)();
}

uint64_t type metadata accessor for WeatherConditionGradientModel.AnimationContext()
{
  return type metadata accessor for WeatherConditionGradientModel.AnimationContext();
}

uint64_t type metadata accessor for WeatherConditionGradientModel.PresentationContext()
{
  return type metadata accessor for WeatherConditionGradientModel.PresentationContext();
}

uint64_t type metadata accessor for WeatherConditionGradientModel()
{
  return type metadata accessor for WeatherConditionGradientModel();
}

uint64_t WeatherVFXConditionBackground.backgroundMask.getter()
{
  return WeatherVFXConditionBackground.backgroundMask.getter();
}

uint64_t WeatherVFXConditionBackground.collisionEffectModel.getter()
{
  return WeatherVFXConditionBackground.collisionEffectModel.getter();
}

uint64_t WeatherVFXConditionBackground.backgroundEffectModel.getter()
{
  return WeatherVFXConditionBackground.backgroundEffectModel.getter();
}

uint64_t WeatherVFXConditionBackground.foregroundEffectsAreAbleToRender.getter()
{
  return WeatherVFXConditionBackground.foregroundEffectsAreAbleToRender.getter();
}

Swift::Void __swiftcall WeatherVFXConditionBackground.reset(animated:)(Swift::Bool animated)
{
}

uint64_t WeatherVFXConditionBackground.isLoaded.getter()
{
  return WeatherVFXConditionBackground.isLoaded.getter();
}

uint64_t type metadata accessor for WeatherVFXConditionBackground()
{
  return type metadata accessor for WeatherVFXConditionBackground();
}

uint64_t WeatherConditionBackgroundModel.canShowAnimatedBackground.getter()
{
  return WeatherConditionBackgroundModel.canShowAnimatedBackground.getter();
}

uint64_t WeatherConditionBackgroundModel.animationData.getter()
{
  return WeatherConditionBackgroundModel.animationData.getter();
}

uint64_t WeatherConditionBackgroundModel.animationKind.getter()
{
  return WeatherConditionBackgroundModel.animationKind.getter();
}

uint64_t static WeatherConditionBackgroundModel.== infix(_:_:)()
{
  return static WeatherConditionBackgroundModel.== infix(_:_:)();
}

uint64_t WeatherConditionBackgroundModel.init(gradient:animationKind:animationData:)()
{
  return WeatherConditionBackgroundModel.init(gradient:animationKind:animationData:)();
}

uint64_t WeatherConditionBackgroundModel.gradient.getter()
{
  return WeatherConditionBackgroundModel.gradient.getter();
}

uint64_t type metadata accessor for WeatherConditionBackgroundModel()
{
  return type metadata accessor for WeatherConditionBackgroundModel();
}

uint64_t WeatherConditionGradientManager.load(for:)()
{
  return WeatherConditionGradientManager.load(for:)();
}

uint64_t WeatherConditionGradientManager.init()()
{
  return WeatherConditionGradientManager.init()();
}

uint64_t type metadata accessor for WeatherConditionGradientManager()
{
  return type metadata accessor for WeatherConditionGradientManager();
}

uint64_t type metadata accessor for WeatherConditionBackgroundConfig.CameraPositionType()
{
  return type metadata accessor for WeatherConditionBackgroundConfig.CameraPositionType();
}

uint64_t WeatherConditionBackgroundManager.init(configurationManager:templateManager:)()
{
  return WeatherConditionBackgroundManager.init(configurationManager:templateManager:)();
}

uint64_t WeatherConditionBackgroundManager.isVfxSceneLoaded.getter()
{
  return WeatherConditionBackgroundManager.isVfxSceneLoaded.getter();
}

Swift::Void __swiftcall WeatherConditionBackgroundManager.play(_:)(Swift::Bool a1)
{
}

uint64_t type metadata accessor for WeatherConditionBackgroundManager()
{
  return type metadata accessor for WeatherConditionBackgroundManager();
}

uint64_t WeatherConditionBackgroundOptions.init(locationIDs:applyMask:applyLegibilityScrim:effectViewID:canShowCollisionLayer:cameraPositionType:displayLocation:windowBounds:displayScale:locationViewerOrientation:)()
{
  return WeatherConditionBackgroundOptions.init(locationIDs:applyMask:applyLegibilityScrim:effectViewID:canShowCollisionLayer:cameraPositionType:displayLocation:windowBounds:displayScale:locationViewerOrientation:)();
}

uint64_t WeatherConditionBackgroundOptions.displayScale.getter()
{
  return WeatherConditionBackgroundOptions.displayScale.getter();
}

uint64_t WeatherConditionBackgroundOptions.effectViewID.getter()
{
  return WeatherConditionBackgroundOptions.effectViewID.getter();
}

uint64_t WeatherConditionBackgroundOptions.windowBounds.getter()
{
  return WeatherConditionBackgroundOptions.windowBounds.getter();
}

uint64_t WeatherConditionBackgroundOptions.DisplayLocation.canDisplayForegroundEffects.getter()
{
  return WeatherConditionBackgroundOptions.DisplayLocation.canDisplayForegroundEffects.getter();
}

uint64_t static WeatherConditionBackgroundOptions.DisplayLocation.== infix(_:_:)()
{
  return static WeatherConditionBackgroundOptions.DisplayLocation.== infix(_:_:)();
}

uint64_t type metadata accessor for WeatherConditionBackgroundOptions.DisplayLocation()
{
  return type metadata accessor for WeatherConditionBackgroundOptions.DisplayLocation();
}

uint64_t WeatherConditionBackgroundOptions.displayLocation.getter()
{
  return WeatherConditionBackgroundOptions.displayLocation.getter();
}

uint64_t WeatherConditionBackgroundOptions.cameraPositionType.getter()
{
  return WeatherConditionBackgroundOptions.cameraPositionType.getter();
}

uint64_t WeatherConditionBackgroundOptions.applyLegibilityScrim.getter()
{
  return WeatherConditionBackgroundOptions.applyLegibilityScrim.getter();
}

uint64_t WeatherConditionBackgroundOptions.canShowCollisionLayer.getter()
{
  return WeatherConditionBackgroundOptions.canShowCollisionLayer.getter();
}

uint64_t WeatherConditionBackgroundOptions.locationViewerOrientation.getter()
{
  return WeatherConditionBackgroundOptions.locationViewerOrientation.getter();
}

uint64_t type metadata accessor for WeatherConditionBackgroundOptions()
{
  return type metadata accessor for WeatherConditionBackgroundOptions();
}

uint64_t dispatch thunk of WeatherConditionGradientManagerType.load(for:)()
{
  return dispatch thunk of WeatherConditionGradientManagerType.load(for:)();
}

uint64_t WeatherEventDescriptionStringBuilder.init()()
{
  return WeatherEventDescriptionStringBuilder.init()();
}

uint64_t type metadata accessor for WeatherEventDescriptionStringBuilder()
{
  return type metadata accessor for WeatherEventDescriptionStringBuilder();
}

uint64_t dispatch thunk of WeatherConditionBackgroundManagerType.addLoadRequest(_:)()
{
  return dispatch thunk of WeatherConditionBackgroundManagerType.addLoadRequest(_:)();
}

uint64_t dispatch thunk of WeatherConditionBackgroundManagerType.executeRequests(forcePrepare:)()
{
  return dispatch thunk of WeatherConditionBackgroundManagerType.executeRequests(forcePrepare:)();
}

uint64_t dispatch thunk of WeatherConditionBackgroundManagerType.addRemovalRequests(for:)()
{
  return dispatch thunk of WeatherConditionBackgroundManagerType.addRemovalRequests(for:)();
}

Swift::Void __swiftcall WeatherConditionBackgroundManagerType.executeRequests()()
{
}

uint64_t WeatherConditionBackgroundModelFactory.init(gradientManager:automationEnabled:isDemoPresetActive:)()
{
  return WeatherConditionBackgroundModelFactory.init(gradientManager:automationEnabled:isDemoPresetActive:)();
}

uint64_t type metadata accessor for WeatherConditionBackgroundModelFactory()
{
  return type metadata accessor for WeatherConditionBackgroundModelFactory();
}

uint64_t dispatch thunk of WeatherConditionPlaybackCoordinatorType.isPlaybackBlocked()()
{
  return dispatch thunk of WeatherConditionPlaybackCoordinatorType.isPlaybackBlocked()();
}

uint64_t dispatch thunk of WeatherConditionPlaybackCoordinatorType.setPlaybackBlocked(_:)()
{
  return dispatch thunk of WeatherConditionPlaybackCoordinatorType.setPlaybackBlocked(_:)();
}

uint64_t dispatch thunk of WeatherConditionPlaybackCoordinatorType.play(_:)()
{
  return dispatch thunk of WeatherConditionPlaybackCoordinatorType.play(_:)();
}

Swift::Bool __swiftcall WeatherConditionPlaybackCoordinatorType.isPlaybackBlocked()()
{
  return WeatherConditionPlaybackCoordinatorType.isPlaybackBlocked()();
}

Swift::Void __swiftcall WeatherConditionPlaybackCoordinatorType.setPlaybackBlocked(_:)(Swift::Bool a1)
{
}

Swift::Void __swiftcall WeatherConditionPlaybackCoordinatorType.pause(_:)(Swift::Bool a1)
{
}

uint64_t WeatherForecastDescriptionStringBuilder.buildWeatherDescription(from:hourlyForecast:dailyForecast:weatherChanges:historicalFacts:timeZone:)()
{
  return WeatherForecastDescriptionStringBuilder.buildWeatherDescription(from:hourlyForecast:dailyForecast:weatherChanges:historicalFacts:timeZone:)();
}

uint64_t WeatherForecastDescriptionStringBuilder.buildWeatherDescription(from:hourlyForecast:dailyForecast:weatherChanges:timeZone:)()
{
  return WeatherForecastDescriptionStringBuilder.buildWeatherDescription(from:hourlyForecast:dailyForecast:weatherChanges:timeZone:)();
}

uint64_t WeatherForecastDescriptionStringBuilder.feelsLikeStringBuilder.setter()
{
  return WeatherForecastDescriptionStringBuilder.feelsLikeStringBuilder.setter();
}

uint64_t WeatherForecastDescriptionStringBuilder.init()()
{
  return WeatherForecastDescriptionStringBuilder.init()();
}

uint64_t type metadata accessor for WeatherForecastDescriptionStringBuilder()
{
  return type metadata accessor for WeatherForecastDescriptionStringBuilder();
}

uint64_t dispatch thunk of WeatherEventDescriptionStringBuilderType.buildShortString(from:minuteForecast:dailyForecast:weatherChanges:timeZone:date:)()
{
  return dispatch thunk of WeatherEventDescriptionStringBuilderType.buildShortString(from:minuteForecast:dailyForecast:weatherChanges:timeZone:date:)();
}

uint64_t dispatch thunk of WeatherConditionBackgroundModelFactoryType.makeModel(from:)()
{
  return dispatch thunk of WeatherConditionBackgroundModelFactoryType.makeModel(from:)();
}

uint64_t dispatch thunk of WeatherProviderAttributionCacheManagerType.cachedAttributions(for:)()
{
  return dispatch thunk of WeatherProviderAttributionCacheManagerType.cachedAttributions(for:)();
}

uint64_t WeatherConditionBackgroundModelFactoryInput.init(animationKind:currentTime:elevation:moonData:debugConditionOverride:isReduceMotionEnabled:location:options:presentationContext:weatherData:conditionBackgroundDateOverride:)()
{
  return WeatherConditionBackgroundModelFactoryInput.init(animationKind:currentTime:elevation:moonData:debugConditionOverride:isReduceMotionEnabled:location:options:presentationContext:weatherData:conditionBackgroundDateOverride:)();
}

uint64_t type metadata accessor for WeatherConditionBackgroundModelFactoryInput()
{
  return type metadata accessor for WeatherConditionBackgroundModelFactoryInput();
}

uint64_t WeatherVFXView.init(model:foregroundEffectsEnabled:)()
{
  return WeatherVFXView.init(model:foregroundEffectsEnabled:)();
}

uint64_t type metadata accessor for WeatherVFXView()
{
  return type metadata accessor for WeatherVFXView();
}

uint64_t static GeoHandler.getElevation(for:on:)()
{
  return static GeoHandler.getElevation(for:on:)();
}

uint64_t dispatch thunk of WindowType.displayScale.getter()
{
  return dispatch thunk of WindowType.displayScale.getter();
}

uint64_t dispatch thunk of WindowType.traitCollection.getter()
{
  return dispatch thunk of WindowType.traitCollection.getter();
}

uint64_t dispatch thunk of WindowType.bounds.getter()
{
  return dispatch thunk of WindowType.bounds.getter();
}

uint64_t DayMoonData.phase.getter()
{
  return DayMoonData.phase.getter();
}

uint64_t type metadata accessor for DayMoonData()
{
  return type metadata accessor for DayMoonData();
}

uint64_t MoonRiseSet.date.getter()
{
  return MoonRiseSet.date.getter();
}

uint64_t type metadata accessor for MoonRiseSet()
{
  return type metadata accessor for MoonRiseSet();
}

uint64_t static RuleBuilder.buildBlock<A, B, C, D>(_:_:_:_:)()
{
  return static RuleBuilder.buildBlock<A, B, C, D>(_:_:_:_:)();
}

uint64_t ScaledValue.init(wrappedValue:step:)()
{
  return ScaledValue.init(wrappedValue:step:)();
}

uint64_t ScaledValue.wrappedValue.getter()
{
  return ScaledValue.wrappedValue.getter();
}

uint64_t type metadata accessor for ScaledValue()
{
  return type metadata accessor for ScaledValue();
}

uint64_t CodableColor.color.getter()
{
  return CodableColor.color.getter();
}

uint64_t type metadata accessor for CodableColor()
{
  return type metadata accessor for CodableColor();
}

uint64_t StringBuilder.makeWeatherDescription(for:data:)()
{
  return StringBuilder.makeWeatherDescription(for:data:)();
}

uint64_t StringBuilder.makeString(for:data:formattedForAccessibility:)()
{
  return StringBuilder.makeString(for:data:formattedForAccessibility:)();
}

uint64_t StringBuilder.init(_:)()
{
  return StringBuilder.init(_:)();
}

uint64_t dispatch thunk of MicaLoaderType.loadMicaURL(for:)()
{
  return dispatch thunk of MicaLoaderType.loadMicaURL(for:)();
}

uint64_t dispatch thunk of MicaLoaderType.loadMicaLayer(at:)()
{
  return dispatch thunk of MicaLoaderType.loadMicaLayer(at:)();
}

uint64_t static TemporalString.== infix(_:_:)()
{
  return static TemporalString.== infix(_:_:)();
}

uint64_t TemporalString.string.getter()
{
  return TemporalString.string.getter();
}

uint64_t VFXLoadRequest.init(backgroundObserver:lastModel:model:gradient:dynamicTypeSize:targetWindowSizeClass:collisionViewMetrics:)()
{
  return VFXLoadRequest.init(backgroundObserver:lastModel:model:gradient:dynamicTypeSize:targetWindowSizeClass:collisionViewMetrics:)();
}

uint64_t type metadata accessor for VFXLoadRequest()
{
  return type metadata accessor for VFXLoadRequest();
}

uint64_t static VFXEffectViewID.== infix(_:_:)()
{
  return static VFXEffectViewID.== infix(_:_:)();
}

uint64_t type metadata accessor for VFXEffectViewID()
{
  return type metadata accessor for VFXEffectViewID();
}

uint64_t AnimatedGradient.setGradient(gradient:)()
{
  return AnimatedGradient.setGradient(gradient:)();
}

uint64_t AnimatedGradient.init(baseGradient:animatedGradient:showAnimatedGradient:)()
{
  return AnimatedGradient.init(baseGradient:animatedGradient:showAnimatedGradient:)();
}

uint64_t AnimatedGradient.visibleGradient.getter()
{
  return AnimatedGradient.visibleGradient.getter();
}

uint64_t type metadata accessor for AnimatedGradient()
{
  return type metadata accessor for AnimatedGradient();
}

uint64_t ForegroundEffect.init(for:at:currentWeather:weatherCondition:)()
{
  return ForegroundEffect.init(for:at:currentWeather:weatherCondition:)();
}

uint64_t type metadata accessor for ForegroundEffect()
{
  return type metadata accessor for ForegroundEffect();
}

uint64_t MoonRiseSetEvent.date.getter()
{
  return MoonRiseSetEvent.date.getter();
}

uint64_t type metadata accessor for MoonRiseSetEvent()
{
  return type metadata accessor for MoonRiseSetEvent();
}

uint64_t type metadata accessor for CloudAltitudeKind()
{
  return type metadata accessor for CloudAltitudeKind();
}

uint64_t MicaResourceModel.init(condition:isDay:windowBounds:displayScale:)()
{
  return MicaResourceModel.init(condition:isDay:windowBounds:displayScale:)();
}

uint64_t type metadata accessor for MicaResourceModel()
{
  return type metadata accessor for MicaResourceModel();
}

uint64_t static PressureFormatter.maxPressure.getter()
{
  return static PressureFormatter.maxPressure.getter();
}

uint64_t static PressureFormatter.minPressure.getter()
{
  return static PressureFormatter.minPressure.getter();
}

uint64_t type metadata accessor for PressureFormatter()
{
  return type metadata accessor for PressureFormatter();
}

uint64_t BackgroundMoonData.phaseAngle.getter()
{
  return BackgroundMoonData.phaseAngle.getter();
}

uint64_t BackgroundMoonData.moonImageName.getter()
{
  return BackgroundMoonData.moonImageName.getter();
}

uint64_t BackgroundMoonData.rotationAngle.getter()
{
  return BackgroundMoonData.rotationAngle.getter();
}

uint64_t BackgroundMoonData.date.getter()
{
  return BackgroundMoonData.date.getter();
}

uint64_t BackgroundMoonData.init(date:moonrise:moonset:elevation:phaseAngle:rotationAngle:moonImageName:)()
{
  return BackgroundMoonData.init(date:moonrise:moonset:elevation:phaseAngle:rotationAngle:moonImageName:)();
}

uint64_t BackgroundMoonData.moonset.getter()
{
  return BackgroundMoonData.moonset.getter();
}

uint64_t BackgroundMoonData.moonrise.getter()
{
  return BackgroundMoonData.moonrise.getter();
}

uint64_t BackgroundMoonData.elevation.getter()
{
  return BackgroundMoonData.elevation.getter();
}

uint64_t type metadata accessor for BackgroundMoonData()
{
  return type metadata accessor for BackgroundMoonData();
}

uint64_t CelestialEphemeris.illuminatedFraction.getter()
{
  return CelestialEphemeris.illuminatedFraction.getter();
}

uint64_t CelestialEphemeris.librationPositionAngle.getter()
{
  return CelestialEphemeris.librationPositionAngle.getter();
}

uint64_t CelestialEphemeris.topocentricParallacticAngle.getter()
{
  return CelestialEphemeris.topocentricParallacticAngle.getter();
}

uint64_t SunriseSunsetEvent.symbolIconName.getter()
{
  return SunriseSunsetEvent.symbolIconName.getter();
}

uint64_t SunriseSunsetEvent.headerDescription.getter()
{
  return SunriseSunsetEvent.headerDescription.getter();
}

uint64_t SunriseSunsetEvent.date.getter()
{
  return SunriseSunsetEvent.date.getter();
}

uint64_t type metadata accessor for SunriseSunsetEvent()
{
  return type metadata accessor for SunriseSunsetEvent();
}

uint64_t SunriseSunsetModel.currentWeather.getter()
{
  return SunriseSunsetModel.currentWeather.getter();
}

uint64_t SunriseSunsetModel.init(currentWeather:dailyForecast:)()
{
  return SunriseSunsetModel.init(currentWeather:dailyForecast:)();
}

uint64_t SunriseSunsetModel.dailyForecast.getter()
{
  return SunriseSunsetModel.dailyForecast.getter();
}

uint64_t static SunriseSunsetModel.== infix(_:_:)()
{
  return static SunriseSunsetModel.== infix(_:_:)();
}

uint64_t SunriseSunsetModel.init(from:)()
{
  return SunriseSunsetModel.init(from:)();
}

uint64_t type metadata accessor for SunriseSunsetModel()
{
  return type metadata accessor for SunriseSunsetModel();
}

uint64_t type metadata accessor for PrimaryDividerStyle()
{
  return type metadata accessor for PrimaryDividerStyle();
}

uint64_t RoundedCornersShape.init(corners:radius:)()
{
  return RoundedCornersShape.init(corners:radius:)();
}

uint64_t type metadata accessor for RoundedCornersShape()
{
  return type metadata accessor for RoundedCornersShape();
}

uint64_t type metadata accessor for VibrantDividerStyle()
{
  return type metadata accessor for VibrantDividerStyle();
}

uint64_t VisibilityFormatter.localizedMeasurement(for:useSmallUnits:)()
{
  return VisibilityFormatter.localizedMeasurement(for:useSmallUnits:)();
}

uint64_t type metadata accessor for VisibilityFormatter()
{
  return type metadata accessor for VisibilityFormatter();
}

uint64_t CollisionViewMetrics.init(vfxViewWidth:gapWidth:leadingPadding:componentWidths:)()
{
  return CollisionViewMetrics.init(vfxViewWidth:gapWidth:leadingPadding:componentWidths:)();
}

uint64_t type metadata accessor for CollisionViewMetrics()
{
  return type metadata accessor for CollisionViewMetrics();
}

uint64_t ForegroundEffectView.init(fallbackContent:)()
{
  return ForegroundEffectView.init(fallbackContent:)();
}

uint64_t InterpolatedMoonData.isMoonRisen.getter()
{
  return InterpolatedMoonData.isMoonRisen.getter();
}

uint64_t InterpolatedMoonData.nextFullMoonDuration.getter()
{
  return InterpolatedMoonData.nextFullMoonDuration.getter();
}

uint64_t InterpolatedMoonData.illuminatedFraction.getter()
{
  return InterpolatedMoonData.illuminatedFraction.getter();
}

uint64_t InterpolatedMoonData.librationPositionAngle.getter()
{
  return InterpolatedMoonData.librationPositionAngle.getter();
}

uint64_t InterpolatedMoonData.moonset.getter()
{
  return InterpolatedMoonData.moonset.getter();
}

uint64_t InterpolatedMoonData.distance.getter()
{
  return InterpolatedMoonData.distance.getter();
}

uint64_t InterpolatedMoonData.moonrise.getter()
{
  return InterpolatedMoonData.moonrise.getter();
}

uint64_t InterpolatedMoonData.moonPhase.getter()
{
  return InterpolatedMoonData.moonPhase.getter();
}

uint64_t type metadata accessor for InterpolatedMoonData()
{
  return type metadata accessor for InterpolatedMoonData();
}

uint64_t dispatch thunk of MoonDataProviderType.weatherBackgroundMoonData(for:timeZone:coordinate:)()
{
  return dispatch thunk of MoonDataProviderType.weatherBackgroundMoonData(for:timeZone:coordinate:)();
}

uint64_t dispatch thunk of MoonDataProviderType.dayMoonData(for:timeZone:coordinate:)()
{
  return dispatch thunk of MoonDataProviderType.dayMoonData(for:timeZone:coordinate:)();
}

uint64_t dispatch thunk of MoonDataProviderType.nextMoonEvent(after:coordinate:timeZone:)()
{
  return dispatch thunk of MoonDataProviderType.nextMoonEvent(after:coordinate:timeZone:)();
}

uint64_t dispatch thunk of MoonDataProviderType.nextFullMoonDate(for:timeZone:coordinate:)()
{
  return dispatch thunk of MoonDataProviderType.nextFullMoonDate(for:timeZone:coordinate:)();
}

uint64_t dispatch thunk of MoonDataProviderType.moonEphemeris(for:coordinate:)()
{
  return dispatch thunk of MoonDataProviderType.moonEphemeris(for:coordinate:)();
}

uint64_t dispatch thunk of MoonDataProviderType.moonRiseSetEvents(in:coordinate:)()
{
  return dispatch thunk of MoonDataProviderType.moonRiseSetEvents(in:coordinate:)();
}

uint64_t RoundedPrecipitation.measurement.getter()
{
  return RoundedPrecipitation.measurement.getter();
}

uint64_t RoundedPrecipitation.formattedString.getter()
{
  return RoundedPrecipitation.formattedString.getter();
}

uint64_t type metadata accessor for RoundedPrecipitation()
{
  return type metadata accessor for RoundedPrecipitation();
}

uint64_t SunriseSunsetDayRule.init()()
{
  return SunriseSunsetDayRule.init()();
}

uint64_t type metadata accessor for SunriseSunsetDayRule()
{
  return type metadata accessor for SunriseSunsetDayRule();
}

uint64_t FeelsLikeVarianceView.Configuration.init(contentWidth:gradientScale:actualTemperature:feelsLikeTemperature:differenceThreshold:differenceText:useDayGradient:)()
{
  return FeelsLikeVarianceView.Configuration.init(contentWidth:gradientScale:actualTemperature:feelsLikeTemperature:differenceThreshold:differenceText:useDayGradient:)();
}

uint64_t type metadata accessor for FeelsLikeVarianceView.Configuration()
{
  return type metadata accessor for FeelsLikeVarianceView.Configuration();
}

uint64_t FeelsLikeVarianceView.init(configuration:)()
{
  return FeelsLikeVarianceView.init(configuration:)();
}

uint64_t type metadata accessor for FeelsLikeVarianceView()
{
  return type metadata accessor for FeelsLikeVarianceView();
}

uint64_t InterpolatedEphemeris.illuminatedFraction.getter()
{
  return InterpolatedEphemeris.illuminatedFraction.getter();
}

uint64_t type metadata accessor for InterpolatedEphemeris()
{
  return type metadata accessor for InterpolatedEphemeris();
}

uint64_t dispatch thunk of MoonStringBuilderType.nextMoonRiseSetString(_:now:timeZone:)()
{
  return dispatch thunk of MoonStringBuilderType.nextMoonRiseSetString(_:now:timeZone:)();
}

uint64_t dispatch thunk of MoonStringBuilderType.nextFullMoonDurationString(fullMoonDate:now:timeZone:)()
{
  return dispatch thunk of MoonStringBuilderType.nextFullMoonDurationString(fullMoonDate:now:timeZone:)();
}

uint64_t SkyBackgroundGradient.middleColor.getter()
{
  return SkyBackgroundGradient.middleColor.getter();
}

uint64_t SkyBackgroundGradient.gradient()()
{
  return SkyBackgroundGradient.gradient()();
}

uint64_t SkyBackgroundGradient.topColor.getter()
{
  return SkyBackgroundGradient.topColor.getter();
}

uint64_t type metadata accessor for SkyBackgroundGradient()
{
  return type metadata accessor for SkyBackgroundGradient();
}

uint64_t type metadata accessor for TargetWindowSizeClass()
{
  return type metadata accessor for TargetWindowSizeClass();
}

uint64_t AnimatedLinearGradient.init(gradient:)()
{
  return AnimatedLinearGradient.init(gradient:)();
}

uint64_t type metadata accessor for AnimatedLinearGradient()
{
  return type metadata accessor for AnimatedLinearGradient();
}

uint64_t FeelsLikeStringBuilder.init()()
{
  return FeelsLikeStringBuilder.init()();
}

uint64_t type metadata accessor for FeelsLikeStringBuilder()
{
  return type metadata accessor for FeelsLikeStringBuilder();
}

uint64_t HorizontalBarPointView.init(point:pointColor:gradient:)()
{
  return HorizontalBarPointView.init(point:pointColor:gradient:)();
}

uint64_t type metadata accessor for HorizontalBarPointView()
{
  return type metadata accessor for HorizontalBarPointView();
}

uint64_t type metadata accessor for QuaternaryDividerStyle()
{
  return type metadata accessor for QuaternaryDividerStyle();
}

uint64_t SunriseSunsetChartView.init(model:)()
{
  return SunriseSunsetChartView.init(model:)();
}

uint64_t type metadata accessor for SunriseSunsetChartView()
{
  return type metadata accessor for SunriseSunsetChartView();
}

uint64_t SunriseSunsetNightRule.init()()
{
  return SunriseSunsetNightRule.init()();
}

uint64_t type metadata accessor for SunriseSunsetNightRule()
{
  return type metadata accessor for SunriseSunsetNightRule();
}

uint64_t SunriseSunsetPolarRule.init()()
{
  return SunriseSunsetPolarRule.init()();
}

uint64_t type metadata accessor for SunriseSunsetPolarRule()
{
  return type metadata accessor for SunriseSunsetPolarRule();
}

uint64_t SunriseSunsetViewModel.headerIcon.getter()
{
  return SunriseSunsetViewModel.headerIcon.getter();
}

uint64_t SunriseSunsetViewModel.description.getter()
{
  return SunriseSunsetViewModel.description.getter();
}

uint64_t SunriseSunsetViewModel.headerTitle.getter()
{
  return SunriseSunsetViewModel.headerTitle.getter();
}

uint64_t SunriseSunsetViewModel.timePeriodSymbols.getter()
{
  return SunriseSunsetViewModel.timePeriodSymbols.getter();
}

uint64_t static SunriseSunsetViewModel.== infix(_:_:)()
{
  return static SunriseSunsetViewModel.== infix(_:_:)();
}

uint64_t SunriseSunsetViewModel.title.getter()
{
  return SunriseSunsetViewModel.title.getter();
}

uint64_t type metadata accessor for SunriseSunsetViewModel()
{
  return type metadata accessor for SunriseSunsetViewModel();
}

uint64_t BackgroundAnimationData.Model.conditionKind.getter()
{
  return BackgroundAnimationData.Model.conditionKind.getter();
}

uint64_t BackgroundAnimationData.Model.isReduceMotionEnabled.getter()
{
  return BackgroundAnimationData.Model.isReduceMotionEnabled.getter();
}

uint64_t BackgroundAnimationData.Model.options.getter()
{
  return BackgroundAnimationData.Model.options.getter();
}

uint64_t BackgroundAnimationData.Model.location.getter()
{
  return BackgroundAnimationData.Model.location.getter();
}

uint64_t BackgroundAnimationData.Model.init(location:date:conditionKind:windSpeed:cloudCover:cloudKind:elevation:moonData:options:isDayTime:sunrise:sunset:isReduceMotionEnabled:)()
{
  return BackgroundAnimationData.Model.init(location:date:conditionKind:windSpeed:cloudCover:cloudKind:elevation:moonData:options:isDayTime:sunrise:sunset:isReduceMotionEnabled:)();
}

uint64_t BackgroundAnimationData.Model.isDayTime.getter()
{
  return BackgroundAnimationData.Model.isDayTime.getter();
}

uint64_t type metadata accessor for BackgroundAnimationData.Model()
{
  return type metadata accessor for BackgroundAnimationData.Model();
}

uint64_t BackgroundAnimationData.options.getter()
{
  return BackgroundAnimationData.options.getter();
}

uint64_t type metadata accessor for BackgroundAnimationData()
{
  return type metadata accessor for BackgroundAnimationData();
}

uint64_t BackgroundAnimationKind.gradientContext.getter()
{
  return BackgroundAnimationKind.gradientContext.getter();
}

uint64_t static BackgroundAnimationKind.== infix(_:_:)()
{
  return static BackgroundAnimationKind.== infix(_:_:)();
}

uint64_t type metadata accessor for BackgroundAnimationKind()
{
  return type metadata accessor for BackgroundAnimationKind();
}

uint64_t MicaBackgroundAnimation.__allocating_init(windowBounds:)()
{
  return MicaBackgroundAnimation.__allocating_init(windowBounds:)();
}

uint64_t MicaBackgroundAnimation.updateForNewLayer(_:duration:)()
{
  return MicaBackgroundAnimation.updateForNewLayer(_:duration:)();
}

Swift::Void __swiftcall MicaBackgroundAnimation.play(_:)(Swift::Bool a1)
{
}

uint64_t MicaBackgroundAnimation.pause(_:completion:)()
{
  return MicaBackgroundAnimation.pause(_:completion:)();
}

uint64_t type metadata accessor for MicaBackgroundAnimation()
{
  return type metadata accessor for MicaBackgroundAnimation();
}

uint64_t dispatch thunk of StartOfDayCalculatorType.startOfDay(for:timeZone:)()
{
  return dispatch thunk of StartOfDayCalculatorType.startOfDay(for:timeZone:)();
}

uint64_t SunriseSunsetMorningRule.init()()
{
  return SunriseSunsetMorningRule.init()();
}

uint64_t type metadata accessor for SunriseSunsetMorningRule()
{
  return type metadata accessor for SunriseSunsetMorningRule();
}

uint64_t SunriseSunsetEventCalculator.nextEvent(coordinate:date:timeZone:)()
{
  return SunriseSunsetEventCalculator.nextEvent(coordinate:date:timeZone:)();
}

uint64_t SunriseSunsetEventCalculator.init()()
{
  return SunriseSunsetEventCalculator.init()();
}

uint64_t type metadata accessor for SunriseSunsetEventCalculator()
{
  return type metadata accessor for SunriseSunsetEventCalculator();
}

uint64_t dispatch thunk of MoonInterpolationProviderType.interpolate(for:startOfDay:endOfDay:coordinate:dayMoonPhase:)()
{
  return dispatch thunk of MoonInterpolationProviderType.interpolate(for:startOfDay:endOfDay:coordinate:dayMoonPhase:)();
}

uint64_t SunriseSunsetViewModelFactory.init(stringBuilder:sunriseSunsetEventCalculator:)()
{
  return SunriseSunsetViewModelFactory.init(stringBuilder:sunriseSunsetEventCalculator:)();
}

uint64_t type metadata accessor for SunriseSunsetViewModelFactory()
{
  return type metadata accessor for SunriseSunsetViewModelFactory();
}

uint64_t NextHourPrecipitationChartView.init(model:lollipopPoint:selectedData:lollipopEnabled:)()
{
  return NextHourPrecipitationChartView.init(model:lollipopPoint:selectedData:lollipopEnabled:)();
}

uint64_t type metadata accessor for NextHourPrecipitationChartView()
{
  return type metadata accessor for NextHourPrecipitationChartView();
}

uint64_t TemperatureHighLowTextVertical.init(highTemperature:lowTemperature:showNumericOnlyHighLow:scaleFactor:additionalSpacing:)()
{
  return TemperatureHighLowTextVertical.init(highTemperature:lowTemperature:showNumericOnlyHighLow:scaleFactor:additionalSpacing:)();
}

uint64_t type metadata accessor for TemperatureHighLowTextVertical()
{
  return type metadata accessor for TemperatureHighLowTextVertical();
}

uint64_t ConstantConditionsStringBuilder.__allocating_init()()
{
  return ConstantConditionsStringBuilder.__allocating_init()();
}

uint64_t type metadata accessor for ConstantConditionsStringBuilder()
{
  return type metadata accessor for ConstantConditionsStringBuilder();
}

uint64_t type metadata accessor for SunriseSunsetDescriptionContext()
{
  return type metadata accessor for SunriseSunsetDescriptionContext();
}

uint64_t dispatch thunk of InterpolatedMoonDataProviderType.makeInterpolatedMoonData(location:selectedDate:dayMoonPhase:moonrise:moonset:moonRiseSetEvents:)()
{
  return dispatch thunk of InterpolatedMoonDataProviderType.makeInterpolatedMoonData(location:selectedDate:dayMoonPhase:moonrise:moonset:moonRiseSetEvents:)();
}

uint64_t dispatch thunk of InterpolatedMoonDataProviderType.makeMoonDataForCurrentDate(location:selectedDate:currentWeatherDate:dayMoonPhase:moonrise:moonset:moonRiseSetEvents:)()
{
  return dispatch thunk of InterpolatedMoonDataProviderType.makeMoonDataForCurrentDate(location:selectedDate:currentWeatherDate:dayMoonPhase:moonrise:moonset:moonRiseSetEvents:)();
}

uint64_t dispatch thunk of SunriseSunsetViewModelFactoryType.makeViewModel(for:component:)()
{
  return dispatch thunk of SunriseSunsetViewModelFactoryType.makeViewModel(for:component:)();
}

uint64_t NextHourPrecipitationStringBuilder.buildShortString(from:referenceDate:)()
{
  return NextHourPrecipitationStringBuilder.buildShortString(from:referenceDate:)();
}

uint64_t NextHourPrecipitationStringBuilder.buildLongString(from:timeZone:referenceDate:)()
{
  return NextHourPrecipitationStringBuilder.buildLongString(from:timeZone:referenceDate:)();
}

uint64_t NextHourPrecipitationStringBuilder.init()()
{
  return NextHourPrecipitationStringBuilder.init()();
}

uint64_t type metadata accessor for NextHourPrecipitationStringBuilder()
{
  return type metadata accessor for NextHourPrecipitationStringBuilder();
}

uint64_t type metadata accessor for NextHourPrecipitationChartPlacement()
{
  return type metadata accessor for NextHourPrecipitationChartPlacement();
}

uint64_t type metadata accessor for NextHourPrecipitationChartViewModel.LeadingPrecipitationValue()
{
  return type metadata accessor for NextHourPrecipitationChartViewModel.LeadingPrecipitationValue();
}

uint64_t static NextHourPrecipitationChartViewModel.== infix(_:_:)()
{
  return static NextHourPrecipitationChartViewModel.== infix(_:_:)();
}

uint64_t NextHourPrecipitationChartViewModel.Point.date.getter()
{
  return NextHourPrecipitationChartViewModel.Point.date.getter();
}

uint64_t NextHourPrecipitationChartViewModel.Point.value.getter()
{
  return NextHourPrecipitationChartViewModel.Point.value.getter();
}

uint64_t type metadata accessor for NextHourPrecipitationChartViewModel.Point()
{
  return type metadata accessor for NextHourPrecipitationChartViewModel.Point();
}

uint64_t type metadata accessor for NextHourPrecipitationChartViewModel()
{
  return type metadata accessor for NextHourPrecipitationChartViewModel();
}

uint64_t TemperatureDifferenceThresholdDetector.areTemperaturesSignificantlyDifferent(_:_:threshold:thresholdUnit:)()
{
  return TemperatureDifferenceThresholdDetector.areTemperaturesSignificantlyDifferent(_:_:threshold:thresholdUnit:)();
}

uint64_t TemperatureDifferenceThresholdDetector.init()()
{
  return TemperatureDifferenceThresholdDetector.init()();
}

uint64_t type metadata accessor for TemperatureDifferenceThresholdDetector()
{
  return type metadata accessor for TemperatureDifferenceThresholdDetector();
}

uint64_t ChartDragGestureRecognizerRepresentable.init(isRecognizedHandler:)()
{
  return ChartDragGestureRecognizerRepresentable.init(isRecognizedHandler:)();
}

uint64_t type metadata accessor for ChartDragGestureRecognizerRepresentable()
{
  return type metadata accessor for ChartDragGestureRecognizerRepresentable();
}

uint64_t NextHourPrecipitationChartViewModelFactory.init(leadingPrecipitationValueRule:)()
{
  return NextHourPrecipitationChartViewModelFactory.init(leadingPrecipitationValueRule:)();
}

uint64_t type metadata accessor for NextHourPrecipitationChartViewModelFactory()
{
  return type metadata accessor for NextHourPrecipitationChartViewModelFactory();
}

uint64_t dispatch thunk of NextHourPrecipitationChartViewModelFactoryType.makeViewModel(for:precipitation:placement:currentTime:minutesToConsider:)()
{
  return dispatch thunk of NextHourPrecipitationChartViewModelFactoryType.makeViewModel(for:precipitation:placement:currentTime:minutesToConsider:)();
}

uint64_t static Style.componentTime.getter()
{
  return static Style.componentTime.getter();
}

uint64_t type metadata accessor for Style()
{
  return type metadata accessor for Style();
}

uint64_t MicaView.init(animation:)()
{
  return MicaView.init(animation:)();
}

uint64_t type metadata accessor for MicaView()
{
  return type metadata accessor for MicaView();
}

uint64_t type metadata accessor for MoonView.RenderBehavior()
{
  return type metadata accessor for MoonView.RenderBehavior();
}

uint64_t MoonView.init(date:renderBehavior:forceUpdateFlag:)()
{
  return MoonView.init(date:renderBehavior:forceUpdateFlag:)();
}

uint64_t type metadata accessor for MoonView()
{
  return type metadata accessor for MoonView();
}

uint64_t Elevation.description.getter()
{
  return Elevation.description.getter();
}

uint64_t Elevation.isPM.getter()
{
  return Elevation.isPM.getter();
}

uint64_t Elevation.degrees.getter()
{
  return Elevation.degrees.getter();
}

uint64_t Elevation.init(degrees:isPM:)()
{
  return Elevation.init(degrees:isPM:)();
}

uint64_t type metadata accessor for Elevation()
{
  return type metadata accessor for Elevation();
}

uint64_t Elevation.init(_:isPM:)()
{
  return Elevation.init(_:isPM:)();
}

uint64_t MicaLayer.init(layer:)()
{
  return MicaLayer.init(layer:)();
}

uint64_t type metadata accessor for MicaLayer()
{
  return type metadata accessor for MicaLayer();
}

uint64_t TimeStyle.formatTime(_:periodSymbols:font:)()
{
  return TimeStyle.formatTime(_:periodSymbols:font:)();
}

uint64_t type metadata accessor for TimeStyle()
{
  return type metadata accessor for TimeStyle();
}

uint64_t static WidgetCenter.UserInfoKey.kind.getter()
{
  return static WidgetCenter.UserInfoKey.kind.getter();
}

uint64_t dispatch thunk of WidgetCenter.reloadAllTimelines()()
{
  return dispatch thunk of WidgetCenter.reloadAllTimelines()();
}

uint64_t static WidgetCenter.shared.getter()
{
  return static WidgetCenter.shared.getter();
}

uint64_t type metadata accessor for WidgetCenter()
{
  return type metadata accessor for WidgetCenter();
}

Swift::String __swiftcall BinaryFloatingPoint.formatted()()
{
  uint64_t v0 = BinaryFloatingPoint.formatted()();
  result._uint64_t object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t BinaryFloatingPoint.formatted<A>(_:)()
{
  return BinaryFloatingPoint.formatted<A>(_:)();
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

uint64_t static Dictionary<>.read(from:)()
{
  return static Dictionary<>.read(from:)();
}

uint64_t Dictionary<>.write(to:)()
{
  return Dictionary<>.write(to:)();
}

uint64_t Dictionary.mapKeysAndValues<A, B>(_:)()
{
  return Dictionary.mapKeysAndValues<A, B>(_:)();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t Dictionary<>.applicationStateLaunchOptions.getter()
{
  return Dictionary<>.applicationStateLaunchOptions.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t BidirectionalCollection<>.firstMatch<A, B>(of:)()
{
  return BidirectionalCollection<>.firstMatch<A, B>(of:)();
}

uint64_t BidirectionalCollection<>.starts<A>(with:)()
{
  return BidirectionalCollection<>.starts<A>(with:)();
}

uint64_t dispatch thunk of BidirectionalCollection.index(before:)()
{
  return dispatch thunk of BidirectionalCollection.index(before:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
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

uint64_t MutableCollection.move(fromOffsets:toOffset:)()
{
  return MutableCollection.move(fromOffsets:toOffset:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return static String.localizedStringWithFormat(_:_:)();
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

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._uint64_t object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.init<A>(reflecting:)()
{
  return String.init<A>(reflecting:)();
}

Swift::String __swiftcall String.uppercasedWithPreferredLocale()()
{
  uint64_t v0 = String.uppercasedWithPreferredLocale()();
  result._uint64_t object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t static String.read(from:)()
{
  return static String.read(from:)();
}

uint64_t String.write(to:)()
{
  return String.write(to:)();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
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

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t String.index(_:offsetBy:)()
{
  return String.index(_:offsetBy:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
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

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.isPercentSymbol.getter()
{
  return String.isPercentSymbol.getter();
}

Swift::String __swiftcall String.trimmingHyphensAndMinusSigns()()
{
  uint64_t v0 = String.trimmingHyphensAndMinusSigns()();
  result._uint64_t object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall String.replacingHyphensWithMinusSigns()()
{
  uint64_t v0 = String.replacingHyphensWithMinusSigns()();
  result._uint64_t object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.containsOnlyPunctuationCharacters.getter()
{
  return String.containsOnlyPunctuationCharacters.getter();
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return String.hasSuffix(_:)(a1._countAndFlagsBits, a1._object);
}

Swift::String __swiftcall String.init(repeating:count:)(Swift::String repeating, Swift::Int count)
{
  uint64_t v2 = String.init(repeating:count:)(repeating._countAndFlagsBits, repeating._object, count);
  result._uint64_t object = v3;
  result._countAndFlagsBits = v2;
  return result;
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

uint64_t Sequence.first<A>(map:)()
{
  return Sequence.first<A>(map:)();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t Sequence.unique<A>(by:)()
{
  return Sequence.unique<A>(by:)();
}

uint64_t dispatch thunk of Sequence._copyToContiguousArray()()
{
  return dispatch thunk of Sequence._copyToContiguousArray()();
}

uint64_t dispatch thunk of Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return dispatch thunk of Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t Sequence.first(where:)()
{
  return Sequence.first(where:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

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

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array<A>.humidity(for:timeZone:)()
{
  return Array<A>.humidity(for:timeZone:)();
}

uint64_t Array<A>.init(hideScale:controlsLoadDelay:controlsFadeOnResize:controlsHidden:forceOverlayPaused:isUserInteractionEnabled:)()
{
  return Array<A>.init(hideScale:controlsLoadDelay:controlsFadeOnResize:controlsHidden:forceOverlayPaused:isUserInteractionEnabled:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static Array<A>.read(from:)()
{
  return static Array<A>.read(from:)();
}

uint64_t Array<A>.write(to:)()
{
  return Array<A>.write(to:)();
}

uint64_t Array.sorting<A>(on:)()
{
  return Array.sorting<A>(on:)();
}

uint64_t Array<A>.total.getter()
{
  return Array<A>.total.getter();
}

uint64_t Array<A>.maxLatitude.getter()
{
  return Array<A>.maxLatitude.getter();
}

uint64_t Array<A>.minLatitude.getter()
{
  return Array<A>.minLatitude.getter();
}

uint64_t Array<A>.maxLongitude.getter()
{
  return Array<A>.maxLongitude.getter();
}

uint64_t Array<A>.minLongitude.getter()
{
  return Array<A>.minLongitude.getter();
}

uint64_t Array<A>.center.getter()
{
  return Array<A>.center.getter();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t Array<A>.maxThirdValue.getter()
{
  return Array<A>.maxThirdValue.getter();
}

uint64_t Array<A>.minThirdValue.getter()
{
  return Array<A>.minThirdValue.getter();
}

uint64_t Array<A>.maxSecondValue.getter()
{
  return Array<A>.maxSecondValue.getter();
}

uint64_t Array<A>.minSecondValue.getter()
{
  return Array<A>.minSecondValue.getter();
}

uint64_t Array<A>.maxValue.getter()
{
  return Array<A>.maxValue.getter();
}

uint64_t Array<A>.minValue.getter()
{
  return Array<A>.minValue.getter();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t Array<A>.filteredEvents.getter()
{
  return Array<A>.filteredEvents.getter();
}

uint64_t Array<A>.originalAlerts(prominence:)()
{
  return Array<A>.originalAlerts(prominence:)();
}

uint64_t Array<A>.alerts(prominence:)()
{
  return Array<A>.alerts(prominence:)();
}

uint64_t Array<A>.joined(separator:)()
{
  return Array<A>.joined(separator:)();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t Array<A>.hash(into:)()
{
  return Array<A>.hash(into:)();
}

uint64_t static Array<A>.== infix(_:_:)()
{
  return static Array<A>.== infix(_:_:)();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t TaskGroup.makeAsyncIterator()()
{
  return TaskGroup.makeAsyncIterator()();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t static TaskPriority.high.getter()
{
  return static TaskPriority.high.getter();
}

uint64_t static TaskPriority.utility.getter()
{
  return static TaskPriority.utility.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)Double._bridgeToObjectiveC()();
}

uint64_t Double.description.getter()
{
  return Double.description.getter();
}

uint64_t Double.clamped(to:)()
{
  return Double.clamped(to:)();
}

uint64_t Double.pluralRuleInteger.getter()
{
  return Double.pluralRuleInteger.getter();
}

Swift::String_optional __swiftcall Double.formatTimeDuration()()
{
  uint64_t v0 = Double.formatTimeDuration()();
  result.value._uint64_t object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

uint64_t Double.chartValueAccessibilityDescription(for:units:)()
{
  return Double.chartValueAccessibilityDescription(for:units:)();
}

uint64_t Double.write<A>(to:)()
{
  return Double.write<A>(to:)();
}

uint64_t Double.nearestMultiple(of:roundingRule:)()
{
  return Double.nearestMultiple(of:roundingRule:)();
}

Swift::String __swiftcall Double.formattedPercent(roundToNearestPercent:)(Swift::Bool roundToNearestPercent)
{
  uint64_t v1 = Double.formattedPercent(roundToNearestPercent:)(roundToNearestPercent);
  result._uint64_t object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t Double.roundedPrecipitationPercent.getter()
{
  return Double.roundedPrecipitationPercent.getter();
}

uint64_t Double.init(_:)()
{
  return Double.init(_:)();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t static Set<>.read(from:)()
{
  return static Set<>.read(from:)();
}

uint64_t Set<>.write(to:)()
{
  return Set<>.write(to:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t static Set<>.full.getter()
{
  return static Set<>.full.getter();
}

{
  return static Set<>.full.getter();
}

{
  return static Set<>.full.getter();
}

{
  return static Set<>.full.getter();
}

uint64_t static Set<>.unit.getter()
{
  return static Set<>.unit.getter();
}

{
  return static Set<>.unit.getter();
}

{
  return static Set<>.unit.getter();
}

{
  return static Set<>.unit.getter();
}

uint64_t static Set<>.value.getter()
{
  return static Set<>.value.getter();
}

{
  return static Set<>.value.getter();
}

{
  return static Set<>.value.getter();
}

{
  return static Set<>.value.getter();
}

uint64_t static Set<>.unit(width:)()
{
  return static Set<>.unit(width:)();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Int._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t Collection.safe.getter()
{
  return Collection.safe.getter();
}

uint64_t Collection<>.insertionIndex(of:orderBy:)()
{
  return Collection<>.insertionIndex(of:orderBy:)();
}

uint64_t Collection<>.chunk(by:)()
{
  return Collection<>.chunk(by:)();
}

uint64_t dispatch thunk of Collection._failEarlyRangeCheck(_:bounds:)()
{
  return dispatch thunk of Collection._failEarlyRangeCheck(_:bounds:)();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.index(after:)()
{
  return dispatch thunk of Collection.index(after:)();
}

uint64_t dispatch thunk of Collection.index(_:offsetBy:)()
{
  return dispatch thunk of Collection.index(_:offsetBy:)();
}

uint64_t dispatch thunk of Collection.isEmpty.getter()
{
  return dispatch thunk of Collection.isEmpty.getter();
}

uint64_t dispatch thunk of Collection.distance(from:to:)()
{
  return dispatch thunk of Collection.distance(from:to:)();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t Collection.first.getter()
{
  return Collection.first.getter();
}

uint64_t dispatch thunk of Collection.subscript.getter()
{
  return dispatch thunk of Collection.subscript.getter();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t RangeReplaceableCollection<>.remove(atOffsets:)()
{
  return RangeReplaceableCollection<>.remove(atOffsets:)();
}

uint64_t static Range<>.read(from:)()
{
  return static Range<>.read(from:)();
}

uint64_t Range<>.write(to:)()
{
  return Range<>.write(to:)();
}

uint64_t CLLocation.init(_:)()
{
  return CLLocation.init(_:)();
}

{
  return CLLocation.init(_:)();
}

AXDataPoint __swiftcall AXDataPoint.init(x:y:additionalValues:label:)(Swift::String x, Swift::Double_optional y, Swift::OpaquePointer additionalValues, Swift::String_optional label)
{
  return (AXDataPoint)AXDataPoint.init(x:y:additionalValues:label:)(x._countAndFlagsBits, x._object, *(void *)&y.is_nil, additionalValues._rawValue, label.value._countAndFlagsBits, label.value._object, *(__n128 *)&y.value);
}

uint64_t NSUnitSpeed.isBeaufort.getter()
{
  return NSUnitSpeed.isBeaufort.getter();
}

uint64_t static NSUnitSpeed.beaufort.getter()
{
  return static NSUnitSpeed.beaufort.getter();
}

uint64_t NSUnitSpeed.BaseWeatherFormatStyle.accessible.getter()
{
  return NSUnitSpeed.BaseWeatherFormatStyle.accessible.getter();
}

uint64_t type metadata accessor for NSUnitSpeed.BaseWeatherFormatStyle()
{
  return type metadata accessor for NSUnitSpeed.BaseWeatherFormatStyle();
}

uint64_t type metadata accessor for NSUnitSpeed.WeatherFormatUsage()
{
  return type metadata accessor for NSUnitSpeed.WeatherFormatUsage();
}

uint64_t UITableView.dequeue<A>(cell:at:name:)()
{
  return UITableView.dequeue<A>(cell:at:name:)();
}

uint64_t UITableView.register<A>(cell:name:)()
{
  return UITableView.register<A>(cell:name:)();
}

uint64_t NSUnitLength.isMetricVisibility.getter()
{
  return NSUnitLength.isMetricVisibility.getter();
}

uint64_t NSUnitLength.isMetricPrecipitation.getter()
{
  return NSUnitLength.isMetricPrecipitation.getter();
}

uint64_t NSUnitLength.BaseWeatherFormatStyle.accessible.getter()
{
  return NSUnitLength.BaseWeatherFormatStyle.accessible.getter();
}

uint64_t type metadata accessor for NSUnitLength.BaseWeatherFormatStyle()
{
  return type metadata accessor for NSUnitLength.BaseWeatherFormatStyle();
}

uint64_t type metadata accessor for NSUnitLength.WeatherFormatUsage()
{
  return type metadata accessor for NSUnitLength.WeatherFormatUsage();
}

uint64_t UIRectCorner.isEmpty.getter()
{
  return UIRectCorner.isEmpty.getter();
}

uint64_t UIApplication.maybeWindow.getter()
{
  return UIApplication.maybeWindow.getter();
}

uint64_t UIApplication.expectedWindow.getter()
{
  return UIApplication.expectedWindow.getter();
}

uint64_t static UIWindowScene.activeScene.getter()
{
  return static UIWindowScene.activeScene.getter();
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

uint64_t NSUnitPressure.isMetric.getter()
{
  return NSUnitPressure.isMetric.getter();
}

uint64_t NSUnitPressure.BaseWeatherFormatStyle.accessible.getter()
{
  return NSUnitPressure.BaseWeatherFormatStyle.accessible.getter();
}

uint64_t type metadata accessor for NSUnitPressure.BaseWeatherFormatStyle()
{
  return type metadata accessor for NSUnitPressure.BaseWeatherFormatStyle();
}

uint64_t static NSUserDefaults.weatherShared.getter()
{
  return static NSUserDefaults.weatherShared.getter();
}

uint64_t NSUserDefaults.registerUnitsConfigurationChanges(_:)()
{
  return NSUserDefaults.registerUnitsConfigurationChanges(_:)();
}

uint64_t NSUserDefaults.set<A>(_:for:)()
{
  return NSUserDefaults.set<A>(_:for:)();
}

uint64_t static NSDateFormatter.longMonthNameFormatter(with:)()
{
  return static NSDateFormatter.longMonthNameFormatter(with:)();
}

uint64_t static NSDateFormatter.shortMonthNameFormatter(with:)()
{
  return static NSDateFormatter.shortMonthNameFormatter(with:)();
}

uint64_t static NSDateFormatter.timeDurationWithZeroPaddingFormatter.getter()
{
  return static NSDateFormatter.timeDurationWithZeroPaddingFormatter.getter();
}

uint64_t static NSDateFormatter.timeSymbols.getter()
{
  return static NSDateFormatter.timeSymbols.getter();
}

uint64_t static NSDateFormatter.prevailingPeriodSymbols.getter()
{
  return static NSDateFormatter.prevailingPeriodSymbols.getter();
}

uint64_t UITableViewCell.contentConfiguration.setter()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t AXChartDescriptor.init(title:summary:xAxis:yAxis:additionalAxes:series:)()
{
  return AXChartDescriptor.init(title:summary:xAxis:yAxis:additionalAxes:series:)();
}

uint64_t static NSNumberFormatter.digits.getter()
{
  return static NSNumberFormatter.digits.getter();
}

uint64_t static NSNumberFormatter.decimal.getter()
{
  return static NSNumberFormatter.decimal.getter();
}

uint64_t static NSNumberFormatter.percent.getter()
{
  return static NSNumberFormatter.percent.getter();
}

uint64_t static NSNumberFormatter.dayDigits(from:timeZone:)()
{
  return static NSNumberFormatter.dayDigits(from:timeZone:)();
}

uint64_t NSUnitTemperature.feelsLikeVarianceThreshold.getter()
{
  return NSUnitTemperature.feelsLikeVarianceThreshold.getter();
}

uint64_t NSUnitTemperature.BaseWeatherFormatStyle.secondary.getter()
{
  return NSUnitTemperature.BaseWeatherFormatStyle.secondary.getter();
}

uint64_t type metadata accessor for NSUnitTemperature.BaseWeatherFormatStyle()
{
  return type metadata accessor for NSUnitTemperature.BaseWeatherFormatStyle();
}

uint64_t OS_dispatch_group.notifySyncIfEmpty(queue:block:)()
{
  return OS_dispatch_group.notifySyncIfEmpty(queue:block:)();
}

uint64_t OS_dispatch_group.wait(timeout:)()
{
  return OS_dispatch_group.wait(timeout:)();
}

uint64_t static OS_dispatch_queue.geocode.getter()
{
  return static OS_dispatch_queue.geocode.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
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

uint64_t static OS_dispatch_queue.concurrentPerform(iterations:execute:)()
{
  return static OS_dispatch_queue.concurrentPerform(iterations:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
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

uint64_t NSAttributedString.addingAttribute(_:value:)()
{
  return NSAttributedString.addingAttribute(_:value:)();
}

uint64_t NSAttributedString.init(_:arguments:)()
{
  return NSAttributedString.init(_:arguments:)();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return static os_signpost_type_t.event.getter();
}

uint64_t type metadata accessor for NSNotificationCenter.Publisher()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t NSNotificationCenter.publisher(for:object:)()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t UIUserInterfaceStyle.init(_:)()
{
  return UIUserInterfaceStyle.init(_:)();
}

uint64_t CLLocationCoordinate2D.SolarEvents.isDaylight.getter()
{
  return CLLocationCoordinate2D.SolarEvents.isDaylight.getter();
}

uint64_t CLLocationCoordinate2D.SolarEvents.sunset.getter()
{
  return CLLocationCoordinate2D.SolarEvents.sunset.getter();
}

uint64_t CLLocationCoordinate2D.SolarEvents.sunrise.getter()
{
  return CLLocationCoordinate2D.SolarEvents.sunrise.getter();
}

uint64_t type metadata accessor for CLLocationCoordinate2D.SolarEvents()
{
  return type metadata accessor for CLLocationCoordinate2D.SolarEvents();
}

uint64_t CLLocationCoordinate2D.solarEvents(referenceDate:timeZone:)()
{
  return CLLocationCoordinate2D.solarEvents(referenceDate:timeZone:)();
}

uint64_t CLLocationCoordinate2D.clLocation.getter()
{
  return CLLocationCoordinate2D.clLocation.getter();
}

uint64_t static CLLocationCoordinate2D.losAngeles.getter()
{
  return static CLLocationCoordinate2D.losAngeles.getter();
}

uint64_t static CLLocationCoordinate2D.== infix(_:_:)()
{
  return static CLLocationCoordinate2D.== infix(_:_:)();
}

uint64_t CLLocationCoordinate2D.hash(into:)()
{
  return CLLocationCoordinate2D.hash(into:)();
}

uint64_t static CLLocationCoordinate2D.tokyo.getter()
{
  return static CLLocationCoordinate2D.tokyo.getter();
}

uint64_t static CLLocationCoordinate2D.london.getter()
{
  return static CLLocationCoordinate2D.london.getter();
}

uint64_t static CLLocationCoordinate2D.amsterdam.getter()
{
  return static CLLocationCoordinate2D.amsterdam.getter();
}

uint64_t CLLocationCoordinate2D.id.getter()
{
  return CLLocationCoordinate2D.id.getter();
}

uint64_t static CLLocationCoordinate2D.read(from:)()
{
  return static CLLocationCoordinate2D.read(from:)();
}

uint64_t CLLocationCoordinate2D.write(to:)()
{
  return CLLocationCoordinate2D.write(to:)();
}

uint64_t NSMeasurementFormatter.string<A>(from:)()
{
  return NSMeasurementFormatter.string<A>(from:)();
}

uint64_t UIInterfaceOrientation.description.getter()
{
  return UIInterfaceOrientation.description.getter();
}

uint64_t UISceneConnectionOptions.connectionOptions.getter()
{
  return UISceneConnectionOptions.connectionOptions.getter();
}

uint64_t AXNumericDataAxisDescriptor.init(title:range:gridlinePositions:valueDescriptionProvider:)()
{
  return AXNumericDataAxisDescriptor.init(title:range:gridlinePositions:valueDescriptionProvider:)();
}

uint64_t UIApplicationLaunchOptionsKey.applicationStateLaunchOptionKey.getter()
{
  return UIApplicationLaunchOptionsKey.applicationStateLaunchOptionKey.getter();
}

uint64_t CGRect.adding(minY:)()
{
  return CGRect.adding(minY:)();
}

uint64_t CGSize.isLandscape.getter()
{
  return CGSize.isLandscape.getter();
}

uint64_t static UIFont.scaledSystemFont(ofSize:style:maxSize:weight:traits:)()
{
  return static UIFont.scaledSystemFont(ofSize:style:maxSize:weight:traits:)();
}

uint64_t static UIFont.monospacedDigitSystemFont(ofSize:weight:traits:)()
{
  return static UIFont.monospacedDigitSystemFont(ofSize:weight:traits:)();
}

uint64_t static UIColor.cellSelectionTintColor.getter()
{
  return static UIColor.cellSelectionTintColor.getter();
}

uint64_t UIColor.init(_:)()
{
  return UIColor.init(_:)();
}

UIColor __swiftcall UIColor.init(hex:)(Swift::String hex)
{
  return (UIColor)UIColor.init(hex:)(hex._countAndFlagsBits, hex._object);
}

uint64_t UIColor.rgbaComponents.getter()
{
  return UIColor.rgbaComponents.getter();
}

uint64_t static UIColor.macSafeSystemCyan.getter()
{
  return static UIColor.macSafeSystemCyan.getter();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hash(into:)()
{
  return NSObject.hash(into:)();
}

uint64_t static UIWindow.keyWindowScene.setter()
{
  return static UIWindow.keyWindowScene.setter();
}

Swift::Void __swiftcall UIWindow.registerKeyWindowSceneNotification()()
{
}

uint64_t UIWindow.displayScale.getter()
{
  return UIWindow.displayScale.getter();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)()
{
  return NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)();
}

uint64_t static NSRunLoop.SchedulerTimeType.Stride.milliseconds(_:)()
{
  return static NSRunLoop.SchedulerTimeType.Stride.milliseconds(_:)();
}

uint64_t static NSRunLoop.SchedulerTimeType.Stride.seconds(_:)()
{
  return static NSRunLoop.SchedulerTimeType.Stride.seconds(_:)();
}

{
  return static NSRunLoop.SchedulerTimeType.Stride.seconds(_:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerTimeType.Stride()
{
  return type metadata accessor for NSRunLoop.SchedulerTimeType.Stride();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t static Optional<A>.read(from:)()
{
  return static Optional<A>.read(from:)();
}

uint64_t Optional<A>.write(to:)()
{
  return Optional<A>.write(to:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawPointer.hashValue.getter()
{
  return UnsafeMutableRawPointer.hashValue.getter();
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

uint64_t StringProtocol.localizedStandardRange<A>(of:)()
{
  return StringProtocol.localizedStandardRange<A>(of:)();
}

uint64_t StringProtocol.localizedCaseInsensitiveCompare<A>(_:)()
{
  return StringProtocol.localizedCaseInsensitiveCompare<A>(_:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
}

Swift::String __swiftcall BinaryInteger.formatted()()
{
  uint64_t v0 = BinaryInteger.formatted()();
  result._uint64_t object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.isSuperset(of:)()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t dispatch thunk of SetAlgebra.intersection(_:)()
{
  return dispatch thunk of SetAlgebra.intersection(_:)();
}

uint64_t dispatch thunk of SetAlgebra.isEmpty.getter()
{
  return dispatch thunk of SetAlgebra.isEmpty.getter();
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

uint64_t _HashTable.occupiedBucket(after:)()
{
  return _HashTable.occupiedBucket(after:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
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

uint64_t dispatch thunk of Identifiable.id.getter()
{
  return dispatch thunk of Identifiable.id.getter();
}

uint64_t StaticString.description.getter()
{
  return StaticString.description.getter();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
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

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
}

uint64_t _NativeDictionary._delete(at:)()
{
  return _NativeDictionary._delete(at:)();
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

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
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

uint64_t type metadata accessor for FloatingPointRoundingRule()
{
  return type metadata accessor for FloatingPointRoundingRule();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _diagnoseUnexpectedEnumCase<A>(type:)()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error.domainAndCode.getter()
{
  return Error.domainAndCode.getter();
}

uint64_t Error.logSafeDescription.getter()
{
  return Error.logSafeDescription.getter();
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

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
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

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher.finalize()()
{
  return Hasher.finalize()();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t Hasher.init()()
{
  return Hasher.init()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t static Duration.seconds(_:)()
{
  return static Duration.seconds(_:)();
}

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateImageAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return _CGImageSourceGetCount(isrc);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t DeviceIsSlow()
{
  return _DeviceIsSlow();
}

uint64_t DeviceIsVerySlow()
{
  return _DeviceIsVerySlow();
}

uint64_t DeviceRequiresProMotionOptOut()
{
  return _DeviceRequiresProMotionOptOut();
}

uint64_t DeviceSupportsForegroundEffects()
{
  return _DeviceSupportsForegroundEffects();
}

uint64_t DeviceSupportsMaterialBackgrounds()
{
  return _DeviceSupportsMaterialBackgrounds();
}

uint64_t DeviceSupportsStickyHeaders()
{
  return _DeviceSupportsStickyHeaders();
}

uint64_t DeviceSupportsVFX()
{
  return _DeviceSupportsVFX();
}

uint64_t DeviceUsesWireframeOnLocationViewScroll()
{
  return _DeviceUsesWireframeOnLocationViewScroll();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return _SCPreferencesSetCallback(prefs, callout, context);
}

Boolean SCPreferencesSetDispatchQueue(SCPreferencesRef prefs, dispatch_queue_t queue)
{
  return _SCPreferencesSetDispatchQueue(prefs, queue);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

uint64_t TFSetupCrashDetector()
{
  return _TFSetupCrashDetector();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return _UIAccessibilityDarkerSystemColorsEnabled();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return _UIAccessibilityIsInvertColorsEnabled();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return _UIAccessibilityIsSwitchControlRunning();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t WDWeatherLibraryDirectory()
{
  return _WDWeatherLibraryDirectory();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double remainder(long double __x, long double __y)
{
  return _remainder(__x, __y);
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
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

uint64_t swift_getTupleTypeLayout()
{
  return _swift_getTupleTypeLayout();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeLayout3()
{
  return _swift_getTupleTypeLayout3();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return _swift_getTupleTypeMetadata3();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return _swift_initEnumMetadataSingleCase();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
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

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int uname(utsname *a1)
{
  return _uname(a1);
}

id objc_msgSend__crossPlatformUnifiedMeContactWithKeysToFetch_error_(void *a1, const char *a2, ...)
{
  return [a1 _crossPlatformUnifiedMeContactWithKeysToFetch:error:];
}

id objc_msgSend__weatherDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 _weatherDisplayName];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_locality(void *a1, const char *a2, ...)
{
  return _[a1 locality];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_placemark(void *a1, const char *a2, ...)
{
  return _[a1 placemark];
}