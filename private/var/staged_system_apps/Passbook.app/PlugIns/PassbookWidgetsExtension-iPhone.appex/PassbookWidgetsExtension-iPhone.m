uint64_t sub_1000059D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  void (*v27)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v38 = a1;
  v37 = sub_100005E60(&qword_10001CAB8);
  ((void (*)(void))__chkstk_darwin)();
  v2 = (uint64_t *)((char *)&v29 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v36 = sub_100013B10();
  v32 = *(void *)(v36 - 8);
  v3 = v32;
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v33 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v7 = (char *)&v29 - v6;
  v8 = sub_100013AF0();
  v35 = *(void *)(v8 - 8);
  v9 = v35;
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v29 - v13;
  v34 = (char *)&v29 - v13;
  v15 = sub_100013FA0();
  v29 = v16;
  v30 = v15;
  v17 = v16;
  sub_100013AE0();
  v31 = v7;
  sub_100013B00();
  v18 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v19 = v14;
  v20 = v8;
  v18(v12, v19, v8);
  v21 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v22 = v33;
  v23 = v7;
  v24 = v36;
  v21(v33, v23, v36);
  *v2 = v30;
  v2[1] = v17;
  v25 = v37;
  v18((char *)v2 + *(int *)(v37 + 48), v12, v20);
  v21((char *)v2 + *(int *)(v25 + 64), v22, v24);
  swift_bridgeObjectRetain();
  sub_100013B90();
  v26 = *(void (**)(char *, uint64_t))(v32 + 8);
  v26(v31, v24);
  v27 = *(void (**)(char *, uint64_t))(v35 + 8);
  v27(v34, v20);
  v26(v22, v24);
  v27(v12, v20);
  return swift_bridgeObjectRelease();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005D2C()
{
  unint64_t result = qword_10001CAA0;
  if (!qword_10001CAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CAA0);
  }
  return result;
}

uint64_t sub_100005D80(long long *a1)
{
  long long v2 = *a1;
  if (sub_1000134F4(2, 17, 0, 0)) {
    return swift_getOpaqueTypeMetadata2();
  }
  else {
    return v2;
  }
}

uint64_t sub_100005DF4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (sub_1000134F4(2, 17, 0, 0)) {
    return swift_getOpaqueTypeConformance2();
  }
  return v1;
}

uint64_t sub_100005E60(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005EA4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetGroup()
{
  return &type metadata for WidgetGroup;
}

uint64_t sub_100005EFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005F18()
{
  return sub_100005F54(&qword_10001CAC0, &qword_10001CAC8);
}

uint64_t sub_100005F54(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005EA4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005F98()
{
  uint64_t v0 = sub_100013A60();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100013A80();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005E60(&qword_10001CAD0);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013A40();
  sub_100013A70();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_100013A50();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v11 = sub_100013A30();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  if (v13 == 1)
  {
    uint64_t result = sub_10000624C((uint64_t)v10);
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v16 = sub_100013A20();
    uint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    v19[2] = v16;
    v19[3] = v18;
    v19[0] = 21333;
    v19[1] = 0xE200000000000000;
    sub_1000062AC();
    uint64_t v15 = sub_1000140A0();
    uint64_t result = swift_bridgeObjectRelease();
  }
  qword_10001D958 = v15;
  byte_10001D960 = v13 == 1;
  return result;
}

uint64_t sub_10000624C(uint64_t a1)
{
  uint64_t v2 = sub_100005E60(&qword_10001CAD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000062AC()
{
  unint64_t result = qword_10001CAD8;
  if (!qword_10001CAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CAD8);
  }
  return result;
}

uint64_t sub_100006300()
{
  uint64_t v0 = sub_100013B50();
  sub_100006394(v0, qword_10001D968);
  sub_1000063F8(v0, (uint64_t)qword_10001D968);
  sub_100013FA0();
  uint64_t result = PKLogFacilityTypeGetName();
  if (result)
  {
    sub_100013FD0();
    return sub_100013B40();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t *sub_100006394(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000063F8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void **sub_100006430(void **a1, void **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = (char *)*a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void **)&v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (void **)((char *)a1 + v8);
    v10 = (void **)((char *)a2 + v8);
    uint64_t v11 = v5;
    sub_100005E60(&qword_10001CAE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100013B70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
    }
    else
    {
      *uint64_t v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = *(int *)(a3 + 24);
    v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(void *)v15;
    char v17 = v15[8];
    sub_100006578(*(void *)v15, v17);
    *(void *)v14 = v16;
    v14[8] = v17;
  }
  return a1;
}

uint64_t sub_100006578(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100006584(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  sub_100005E60(&qword_10001CAE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100013B70();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v7 = *(void *)v6;
  char v8 = v6[8];

  return sub_100006644(v7, v8);
}

uint64_t sub_100006644(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

void **sub_100006650(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = *(int *)(a3 + 20);
  char v8 = (void **)((char *)a1 + v7);
  uint64_t v9 = (void **)((char *)a2 + v7);
  id v10 = v6;
  sub_100005E60(&qword_10001CAE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100013B70();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v8, v9, v11);
  }
  else
  {
    *char v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  uint64_t v15 = *(void *)v14;
  char v16 = v14[8];
  sub_100006578(*(void *)v14, v16);
  *(void *)uint64_t v13 = v15;
  v13[8] = v16;
  return a1;
}

void **sub_100006750(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 20);
    id v10 = (void **)((char *)a1 + v9);
    uint64_t v11 = (void **)((char *)a2 + v9);
    sub_100006874((uint64_t)a1 + v9);
    sub_100005E60(&qword_10001CAE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100013B70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = *(int *)(a3 + 24);
  v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = *(void *)v15;
  char v17 = v15[8];
  sub_100006578(*(void *)v15, v17);
  uint64_t v18 = *(void *)v14;
  char v19 = v14[8];
  *(void *)v14 = v16;
  v14[8] = v17;
  sub_100006644(v18, v19);
  return a1;
}

uint64_t sub_100006874(uint64_t a1)
{
  uint64_t v2 = sub_100005E60(&qword_10001CAE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1000068D4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100005E60(&qword_10001CAE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100013B70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  return a1;
}

void **sub_1000069D4(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
    id v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    sub_100006874((uint64_t)a1 + v7);
    uint64_t v10 = sub_100005E60(&qword_10001CAE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_100013B70();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  uint64_t v15 = *(void *)v14;
  LOBYTE(v14) = v14[8];
  uint64_t v16 = *(void *)v13;
  char v17 = v13[8];
  *(void *)uint64_t v13 = v15;
  v13[8] = (char)v14;
  sub_100006644(v16, v17);
  return a1;
}

uint64_t sub_100006AF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006B0C);
}

uint64_t sub_100006B0C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100005E60(&qword_10001CAE8);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100006BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006BD4);
}

void *sub_100006BD4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100005E60(&qword_10001CAE8);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for BridgedSpendingSummaryChartView()
{
  uint64_t result = qword_10001CB48;
  if (!qword_10001CB48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100006CCC()
{
  sub_100006D70();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100006D70()
{
  if (!qword_10001CB58)
  {
    sub_100013B70();
    unint64_t v0 = sub_100013B80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10001CB58);
    }
  }
}

uint64_t sub_100006DC8()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_100006DE4(void **a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_100013B70();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013BB0();
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = (char *)a1 + *(int *)(type metadata accessor for BridgedSpendingSummaryChartView() + 24);
  uint64_t v13 = *(void *)v12;
  char v14 = v12[8];
  sub_100006578(*(void *)v12, v14);
  double v15 = sub_10000A4D8(v13, v14);
  sub_100006644(v13, v14);
  sub_10000A21C((uint64_t)v7);
  int v16 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v16 == enum case for ColorScheme.light(_:))
  {
    uint64_t v17 = 1;
  }
  else if (v16 == enum case for ColorScheme.dark(_:))
  {
    uint64_t v17 = 2;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v17 = 0;
  }
  uint64_t v18 = *a1;
  v22[0] = v9;
  v22[1] = v11;
  v22[2] = v15;
  *(void *)&v22[3] = v17;
  *(void *)&v22[4] = v18;
  id v19 = v18;
  sub_100007428(v22);
  uint64_t v20 = sub_100013EC0();

  *a2 = v20;
}

uint64_t sub_100006FBC()
{
  return sub_100013E80();
}

uint64_t sub_100006FD8@<X0>(uint64_t a1@<X0>, void (**a2)(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_1000070C4(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_100007268((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_1000072CC;
  a2[1] = (void (*)(uint64_t *@<X8>))v7;
  return result;
}

uint64_t sub_1000070C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BridgedSpendingSummaryChartView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007128()
{
  uint64_t v1 = type metadata accessor for BridgedSpendingSummaryChartView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  sub_100005E60(&qword_10001CAE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100013B70();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  sub_100006644(*(void *)(v0 + v3 + *(int *)(v1 + 24)), *(unsigned char *)(v0 + v3 + *(int *)(v1 + 24) + 8));

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100007268(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BridgedSpendingSummaryChartView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1000072CC(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for BridgedSpendingSummaryChartView() - 8);
  uint64_t v4 = (void **)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));

  sub_100006DE4(v4, a1);
}

void sub_10000734C(void *a1, id a2)
{
  id v3 = [a2 layer];
  id v4 = [a1 CGContext];
  [v3 renderInContext:v4];
}

void sub_1000073DC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_100007428(double *a1)
{
  double v2 = *a1;
  double v3 = a1[1];
  id v4 = [objc_allocWithZone((Class)PKSpendingSummaryChartView) initWithFrame:0.0, 0.0, *a1, v3];
  [v4 setPrioritizeLegendPlacement:1];
  [v4 setShowPlaceholders:1];
  uint64_t v5 = (void *)*((void *)a1 + 4);
  id v6 = [v5 summaryType];
  id v7 = [v5 summaryType];
  if (v6) {
    BOOL v8 = v7 == (id)1;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v9 = v8;
  [v4 setShowLegendLabels:v9];
  [v4 configureWithSummary:v5 presentationStyle:3];
  [v4 setOverrideUserInterfaceStyle:*((void *)a1 + 3)];
  sub_1000076C8();
  id v10 = [(id)swift_getObjCClassFromMetadata() defaultFormat];
  [v10 setScale:a1[2]];
  id v11 = [objc_allocWithZone((Class)UIGraphicsImageRenderer) initWithSize:v10 format:v2];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v4;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_100007740;
  *(void *)(v13 + 24) = v12;
  v18[4] = sub_100007758;
  v18[5] = v13;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_1000073DC;
  v18[3] = &unk_100018F00;
  char v14 = _Block_copy(v18);
  id v15 = v4;
  swift_retain();
  swift_release();
  id v16 = [v11 imageWithActions:v14];

  _Block_release(v14);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v10 & 1) == 0) {
    return (uint64_t)v16;
  }
  __break(1u);
  return result;
}

unint64_t sub_1000076C8()
{
  unint64_t result = qword_10001CB90;
  if (!qword_10001CB90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001CB90);
  }
  return result;
}

uint64_t sub_100007708()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100007740(void *a1)
{
  sub_10000734C(a1, *(id *)(v1 + 16));
}

uint64_t sub_100007748()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007758()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100007780(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100007790()
{
  return swift_release();
}

unint64_t sub_10000779C()
{
  unint64_t result = qword_10001CB98;
  if (!qword_10001CB98)
  {
    sub_100005EA4(&qword_10001CBA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CB98);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for CreditBalanceView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AppleCardWidgetDataManager.CreditBalanceModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AppleCardWidgetDataManager.CreditBalanceModel(void *a1, void *a2)
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

void *assignWithCopy for AppleCardWidgetDataManager.CreditBalanceModel(void *a1, void *a2)
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

__n128 initializeWithTake for AppleCardWidgetDataManager.CreditBalanceModel(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for AppleCardWidgetDataManager.CreditBalanceModel(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for AppleCardWidgetDataManager.CreditBalanceModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppleCardWidgetDataManager.CreditBalanceModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CreditBalanceView()
{
  return &type metadata for CreditBalanceView;
}

uint64_t sub_100007A68()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_100007A84@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v87 = a2;
  uint64_t v3 = sub_100005E60(&qword_10001CBB0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v88 = (uint64_t)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v86 = (uint64_t)&v73 - v6;
  uint64_t v74 = sub_100005E60(&qword_10001CBB8);
  __chkstk_darwin(v74);
  v79 = (uint64_t *)((char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v78 = sub_100013BE0();
  uint64_t v77 = *(void *)(v78 - 8);
  __chkstk_darwin(v78);
  v76 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_100005E60(&qword_10001CBC0);
  uint64_t v9 = __chkstk_darwin(v73);
  uint64_t v84 = (uint64_t)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  v75 = (char *)&v73 - v12;
  __chkstk_darwin(v11);
  uint64_t v81 = (uint64_t)&v73 - v13;
  uint64_t v14 = sub_100005E60(&qword_10001CBC8);
  uint64_t v82 = *(void *)(v14 - 8);
  uint64_t v83 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  v80 = (char *)&v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v73 - v17;
  uint64_t v19 = *a1;
  uint64_t v20 = a1[1];
  uint64_t v21 = a1[2];
  v85 = a1;
  uint64_t v90 = a1[3];
  uint64_t v91 = v21;
  uint64_t v93 = v19;
  uint64_t v94 = v20;
  unint64_t v89 = sub_1000062AC();
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_100013E30();
  uint64_t v24 = v23;
  char v26 = v25 & 1;
  sub_100013DD0();
  uint64_t v27 = sub_100013E10();
  uint64_t v29 = v28;
  char v31 = v30;
  uint64_t v33 = v32;
  swift_release();
  sub_100008664(v22, v24, v26);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v93 = v27;
  uint64_t v94 = v29;
  char v95 = v31 & 1;
  uint64_t v96 = v33;
  uint64_t v97 = KeyPath;
  uint64_t v98 = 0x3FE999999999999ALL;
  sub_100005E60(&qword_10001CBD0);
  sub_100008744();
  v92 = v18;
  sub_100013E40();
  sub_100008664(v27, v29, v31 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v93 = v91;
  uint64_t v94 = v90;
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_100013E30();
  uint64_t v37 = v36;
  char v39 = v38;
  id result = (id)PKFontForDesign();
  if (result)
  {
    char v41 = v39 & 1;
    sub_100013DE0();
    uint64_t v42 = sub_100013E10();
    uint64_t v44 = v43;
    char v46 = v45;
    swift_release();
    char v47 = v46 & 1;
    sub_100008664(v35, v37, v41);
    swift_bridgeObjectRelease();
    sub_100013DC0();
    uint64_t v48 = sub_100013DF0();
    uint64_t v50 = v49;
    uint64_t v52 = v51;
    char v54 = v53 & 1;
    sub_100008664(v42, v44, v47);
    swift_bridgeObjectRelease();
    uint64_t v55 = swift_getKeyPath();
    v56 = v76;
    sub_100013BD0();
    uint64_t v57 = swift_getKeyPath();
    v58 = v79;
    uint64_t v59 = v77;
    uint64_t v60 = v78;
    (*(void (**)(char *, char *, uint64_t))(v77 + 16))((char *)v79 + *(int *)(v74 + 28), v56, v78);
    uint64_t *v58 = v57;
    uint64_t v61 = (uint64_t)v75;
    sub_100008884((uint64_t)v58, (uint64_t)&v75[*(int *)(v73 + 36)], &qword_10001CBB8);
    *(void *)uint64_t v61 = v48;
    *(void *)(v61 + 8) = v50;
    *(unsigned char *)(v61 + 16) = v54;
    *(void *)(v61 + 24) = v52;
    *(void *)(v61 + 32) = v55;
    *(void *)(v61 + 40) = 0x3FE999999999999ALL;
    sub_10000880C(v48, v50, v54);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1000088E8((uint64_t)v58, &qword_10001CBB8);
    (*(void (**)(char *, uint64_t))(v59 + 8))(v56, v60);
    sub_100008664(v48, v50, v54);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v62 = v81;
    sub_10000881C(v61, v81);
    uint64_t v63 = v86;
    sub_1000081F0(v86);
    uint64_t v65 = v82;
    uint64_t v64 = v83;
    v66 = *(void (**)(char *, char *, uint64_t))(v82 + 16);
    v67 = v80;
    v66(v80, v92, v83);
    uint64_t v68 = v84;
    sub_100008884(v62, v84, &qword_10001CBC0);
    uint64_t v69 = v88;
    sub_100008884(v63, v88, &qword_10001CBB0);
    v70 = v87;
    v66(v87, v67, v64);
    uint64_t v71 = sub_100005E60(&qword_10001CBF0);
    sub_100008884(v68, (uint64_t)&v70[*(int *)(v71 + 48)], &qword_10001CBC0);
    sub_100008884(v69, (uint64_t)&v70[*(int *)(v71 + 64)], &qword_10001CBB0);
    sub_1000088E8(v63, &qword_10001CBB0);
    sub_1000088E8(v62, &qword_10001CBC0);
    v72 = *(void (**)(char *, uint64_t))(v65 + 8);
    v72(v92, v64);
    sub_1000088E8(v69, &qword_10001CBB0);
    sub_1000088E8(v68, &qword_10001CBC0);
    return (id)((uint64_t (*)(char *, uint64_t))v72)(v67, v64);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000081F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100005E60(&qword_10001CBB8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100013BE0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005E60(&qword_10001CBC0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v1 + 40);
  if (v15)
  {
    uint64_t v52 = *(void *)(v1 + 32);
    uint64_t v53 = v15;
    uint64_t v48 = v11;
    uint64_t v50 = v12;
    sub_1000062AC();
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100013E30();
    uint64_t v18 = v17;
    uint64_t v51 = v9;
    uint64_t v47 = v3;
    char v20 = v19 & 1;
    sub_100013DD0();
    uint64_t v21 = sub_100013E10();
    uint64_t v44 = (uint64_t *)v5;
    uint64_t v45 = v7;
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v46 = v6;
    char v26 = v25;
    uint64_t v49 = a1;
    swift_release();
    sub_100008664(v16, v18, v20);
    swift_bridgeObjectRelease();
    sub_100013EB0();
    uint64_t v27 = sub_100013E00();
    uint64_t v29 = v28;
    LOBYTE(v18) = v30;
    uint64_t v43 = v31;
    swift_release();
    LOBYTE(v16) = v18 & 1;
    sub_100008664(v22, v24, v26 & 1);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v33 = v51;
    sub_100013BD0();
    uint64_t v34 = swift_getKeyPath();
    uint64_t v35 = v46;
    uint64_t v37 = v44;
    uint64_t v36 = v45;
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))((char *)v44 + *(int *)(v47 + 28), v33, v46);
    *uint64_t v37 = v34;
    uint64_t v38 = v48;
    sub_100008884((uint64_t)v37, (uint64_t)&v14[*(int *)(v48 + 36)], &qword_10001CBB8);
    *(void *)uint64_t v14 = v27;
    *((void *)v14 + 1) = v29;
    v14[16] = v16;
    *((void *)v14 + 3) = v43;
    *((void *)v14 + 4) = KeyPath;
    *((void *)v14 + 5) = 0x3FE999999999999ALL;
    sub_10000880C(v27, v29, v16);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1000088E8((uint64_t)v37, &qword_10001CBB8);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v51, v35);
    sub_100008664(v27, v29, v16);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v39 = v49;
    sub_10000881C((uint64_t)v14, v49);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56))(v39, 0, 1, v38);
  }
  else
  {
    char v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 56);
    return v41(a1, 1, 1);
  }
}

id sub_100008600@<X0>(uint64_t a1@<X8>)
{
  long long v3 = v1[1];
  v6[0] = *v1;
  v6[1] = v3;
  v6[2] = v1[2];
  *(void *)a1 = sub_100013D10();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v4 = sub_100005E60(&qword_10001CBA8);
  return sub_100007A84((uint64_t *)v6, (char *)(a1 + *(int *)(v4 + 44)));
}

uint64_t sub_100008664(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100008674(uint64_t a1)
{
  uint64_t v2 = sub_100013BE0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100013C60();
}

unint64_t sub_100008744()
{
  unint64_t result = qword_10001CBD8;
  if (!qword_10001CBD8)
  {
    sub_100005EA4(&qword_10001CBD0);
    sub_100005F54(&qword_10001CBE0, &qword_10001CBE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CBD8);
  }
  return result;
}

uint64_t sub_1000087E4()
{
  return sub_100013C50();
}

uint64_t sub_10000880C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000881C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005E60(&qword_10001CBC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008884(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005E60(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000088E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005E60(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100008944()
{
  return sub_100005F54(&qword_10001CBF8, &qword_10001CC00);
}

uint64_t *sub_100008980(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100013A10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry() + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    if (v11)
    {
      *(void *)uint64_t v9 = *(void *)v10;
      *((void *)v9 + 1) = v11;
      uint64_t v12 = *((void *)v10 + 3);
      *((void *)v9 + 2) = *((void *)v10 + 2);
      *((void *)v9 + 3) = v12;
      uint64_t v13 = *((void *)v10 + 5);
      *((void *)v9 + 4) = *((void *)v10 + 4);
      *((void *)v9 + 5) = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v15 = *((_OWORD *)v10 + 1);
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v15;
      *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
    }
    uint64_t v16 = (void *)*((void *)v10 + 6);
    *((void *)v9 + 6) = v16;
    v9[56] = v10[56];
    uint64_t v17 = *(int *)(a3 + 20);
    uint64_t v18 = (char *)a1 + v17;
    char v19 = (char *)a2 + v17;
    uint64_t v20 = *(void *)v19;
    char v21 = v19[8];
    id v22 = v16;
    sub_100006578(v20, v21);
    *(void *)uint64_t v18 = v20;
    v18[8] = v21;
  }
  return a1;
}

uint64_t sub_100008AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100013A10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry() + 20);
  if (*(void *)(v5 + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = *(void *)v6;
  char v8 = *(unsigned char *)(v6 + 8);

  return sub_100006644(v7, v8);
}

uint64_t sub_100008BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry() + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  if (v10)
  {
    *(void *)uint64_t v8 = *(void *)v9;
    *(void *)(v8 + 8) = v10;
    uint64_t v11 = *(void *)(v9 + 24);
    *(void *)(v8 + 16) = *(void *)(v9 + 16);
    *(void *)(v8 + 24) = v11;
    uint64_t v12 = *(void *)(v9 + 40);
    *(void *)(v8 + 32) = *(void *)(v9 + 32);
    *(void *)(v8 + 40) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v13 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v13;
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  }
  uint64_t v14 = *(void **)(v9 + 48);
  *(void *)(v8 + 48) = v14;
  *(unsigned char *)(v8 + 56) = *(unsigned char *)(v9 + 56);
  uint64_t v15 = *(int *)(a3 + 20);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = *(void *)v17;
  char v19 = *(unsigned char *)(v17 + 8);
  id v20 = v14;
  sub_100006578(v18, v19);
  *(void *)uint64_t v16 = v18;
  *(unsigned char *)(v16 + 8) = v19;
  return a1;
}

uint64_t sub_100008CB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry() + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (long long *)(a2 + v7);
  uint64_t v10 = *(void *)(a1 + v7 + 8);
  uint64_t v11 = *(void *)(a2 + v7 + 8);
  if (v10)
  {
    if (v11)
    {
      *(void *)uint64_t v8 = *(void *)v9;
      *(void *)(v8 + 8) = *((void *)v9 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v8 + 16) = *((void *)v9 + 2);
      *(void *)(v8 + 24) = *((void *)v9 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v8 + 32) = *((void *)v9 + 4);
      *(void *)(v8 + 40) = *((void *)v9 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_100008E84(v8);
      long long v13 = v9[1];
      long long v12 = v9[2];
      *(_OWORD *)uint64_t v8 = *v9;
      *(_OWORD *)(v8 + 16) = v13;
      *(_OWORD *)(v8 + 32) = v12;
    }
  }
  else if (v11)
  {
    *(void *)uint64_t v8 = *(void *)v9;
    *(void *)(v8 + 8) = *((void *)v9 + 1);
    *(void *)(v8 + 16) = *((void *)v9 + 2);
    *(void *)(v8 + 24) = *((void *)v9 + 3);
    *(void *)(v8 + 32) = *((void *)v9 + 4);
    *(void *)(v8 + 40) = *((void *)v9 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v14 = *v9;
    long long v15 = v9[2];
    *(_OWORD *)(v8 + 16) = v9[1];
    *(_OWORD *)(v8 + 32) = v15;
    *(_OWORD *)uint64_t v8 = v14;
  }
  uint64_t v16 = *(void **)(v8 + 48);
  uint64_t v17 = (void *)*((void *)v9 + 6);
  *(void *)(v8 + 48) = v17;
  id v18 = v17;

  *(unsigned char *)(v8 + 56) = *((unsigned char *)v9 + 56);
  uint64_t v19 = *(int *)(a3 + 20);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = *(void *)v21;
  char v23 = *(unsigned char *)(v21 + 8);
  sub_100006578(*(void *)v21, v23);
  uint64_t v24 = *(void *)v20;
  char v25 = *(unsigned char *)(v20 + 8);
  *(void *)uint64_t v20 = v22;
  *(unsigned char *)(v20 + 8) = v23;
  sub_100006644(v24, v25);
  return a1;
}

uint64_t sub_100008E84(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry() + 20);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  v8[2] = v9[2];
  *(_OWORD *)((char *)v8 + 41) = *(_OWORD *)((char *)v9 + 41);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  return a1;
}

uint64_t sub_100008F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry() + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  if (!*(void *)(a1 + v7 + 8)) {
    goto LABEL_5;
  }
  uint64_t v10 = *(void *)(v9 + 8);
  if (!v10)
  {
    sub_100008E84(v8);
LABEL_5:
    long long v13 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v13;
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    goto LABEL_6;
  }
  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 + 24);
  *(void *)(v8 + 16) = *(void *)(v9 + 16);
  *(void *)(v8 + 24) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v9 + 40);
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  *(void *)(v8 + 40) = v12;
  swift_bridgeObjectRelease();
LABEL_6:
  long long v14 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = *(void *)(v9 + 48);

  *(unsigned char *)(v8 + 56) = *(unsigned char *)(v9 + 56);
  uint64_t v15 = *(int *)(a3 + 20);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v18 = *v17;
  LOBYTE(v17) = *((unsigned char *)v17 + 8);
  uint64_t v19 = *(void *)v16;
  char v20 = *(unsigned char *)(v16 + 8);
  *(void *)uint64_t v16 = v18;
  *(unsigned char *)(v16 + 8) = (_BYTE)v17;
  sub_100006644(v19, v20);
  return a1;
}

uint64_t sub_1000090B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000090C8);
}

uint64_t sub_1000090C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AppleCardWidgetTimelineEntry();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 > 1) {
      return (v10 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_100009188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000919C);
}

uint64_t sub_10000919C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for AppleCardWidgetTimelineEntry();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20) + 8) = -(char)a2;
  }
  return result;
}

uint64_t type metadata accessor for AppleCardContentView()
{
  uint64_t result = qword_10001CC60;
  if (!qword_10001CC60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000092A8()
{
  uint64_t result = type metadata accessor for AppleCardWidgetTimelineEntry();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10000933C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100009358@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v76 = a2;
  uint64_t v5 = sub_100005E60(&qword_10001CCA0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005E60(&qword_10001CCA8);
  __chkstk_darwin(v8 - 8);
  v79 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_100005E60(&qword_10001CCB0);
  __chkstk_darwin(v77);
  uint64_t v78 = (uint64_t)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005E60(&qword_10001CCB8);
  __chkstk_darwin(v11 - 8);
  long long v13 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005E60(&qword_10001CCC0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_100005E60(&qword_10001CCC8);
  uint64_t v17 = *(void *)(v80 - 8);
  uint64_t v18 = __chkstk_darwin(v80);
  char v20 = (char *)&v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v75 - v21;
  char v23 = &a1[*(int *)(type metadata accessor for AppleCardWidgetTimelineEntry() + 20)];
  unint64_t v24 = *((void *)v23 + 1);
  uint64_t v81 = v5;
  uint64_t v82 = a3;
  if (v24)
  {
    uint64_t v26 = *((void *)v23 + 2);
    uint64_t v25 = *((void *)v23 + 3);
    uint64_t v86 = *(char **)v23;
    unint64_t v87 = v24;
    uint64_t v88 = v26;
    uint64_t v89 = v25;
    long long v90 = *((_OWORD *)v23 + 2);
    *(void *)long long v13 = sub_100013D10();
    *((void *)v13 + 1) = 0;
    v13[16] = 1;
    uint64_t v27 = sub_100005E60(&qword_10001CD38);
    sub_100009C14(&v86, a1, &v13[*(int *)(v27 + 44)]);
    uint64_t v28 = &a1[*(int *)(type metadata accessor for AppleCardContentView() + 20)];
    uint64_t v29 = *(void *)v28;
    char v30 = v28[8];
    sub_100006578(*(void *)v28, v30);
    sub_10000A6E4(v29, v30);
    sub_100006644(v29, v30);
    LOBYTE(v29) = sub_100013DB0();
    sub_100013B60();
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    uint64_t v38 = v37;
    sub_100008884((uint64_t)v13, (uint64_t)v16, &qword_10001CCB8);
    uint64_t v39 = &v16[*(int *)(v14 + 36)];
    *uint64_t v39 = v29;
    *((void *)v39 + 1) = v32;
    *((void *)v39 + 2) = v34;
    *((void *)v39 + 3) = v36;
    *((void *)v39 + 4) = v38;
    v39[40] = 0;
    sub_1000088E8((uint64_t)v13, &qword_10001CCB8);
    if (PKIsPad())
    {
      uint64_t v40 = v77;
      if (qword_10001CA98 != -1) {
        swift_once();
      }
      char v41 = qword_10001D998;
    }
    else
    {
      uint64_t v40 = v77;
      if (qword_10001CA90 != -1) {
        swift_once();
      }
      char v41 = qword_10001D980;
    }
    uint64_t v42 = sub_1000063F8(v40, (uint64_t)v41);
    uint64_t v43 = v78;
    sub_100008884(v42, v78, &qword_10001CCB0);
    unint64_t v44 = sub_10000B15C();
    sub_100013E50();
    sub_1000088E8(v43, &qword_10001CCB0);
    sub_1000088E8((uint64_t)v16, &qword_10001CCC0);
    uint64_t v45 = v20;
    uint64_t v46 = v80;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v22, v45, v80);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v7, v22, v46);
    swift_storeEnumTagMultiPayload();
    sub_100005E60(&qword_10001CCD8);
    uint64_t v83 = v14;
    unint64_t v84 = v44;
    swift_getOpaqueTypeConformance2();
    sub_10000B1FC();
    uint64_t v47 = (uint64_t)v79;
    sub_100013D70();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v46);
    uint64_t v48 = sub_100005E60(&qword_10001CCD0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v47, 0, 1, v48);
    return sub_10000B4B8(v47, v82, &qword_10001CCA8);
  }
  else
  {
    v79 = (char *)v14;
    switch((char)v76)
    {
      case 1:
        NSString v52 = sub_100013F90();
        id v53 = (id)PDDeviceSpecificLocalizedStringKeyForKey();

        if (!v53)
        {
          __break(1u);
          JUMPOUT(0x100009C04);
        }
        sub_100013FA0();

        sub_100013D00();
        goto LABEL_17;
      case 3:
        uint64_t v50 = sub_100005E60(&qword_10001CCD0);
        uint64_t v51 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56);
        uint64_t result = v51(a3, 1, 1, v50);
        break;
      default:
        sub_100013CF0();
LABEL_17:
        uint64_t v54 = sub_100013E20();
        uint64_t v77 = v55;
        uint64_t v78 = v54;
        char v57 = v56;
        uint64_t v59 = v58;
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v61 = swift_getKeyPath();
        uint64_t v62 = sub_100013EB0();
        uint64_t v63 = swift_getKeyPath();
        uint64_t v64 = &a1[*(int *)(type metadata accessor for AppleCardContentView() + 20)];
        uint64_t v65 = *(void *)v64;
        char v66 = v64[8];
        sub_100006578(*(void *)v64, v66);
        sub_10000A6E4(v65, v66);
        sub_100006644(v65, v66);
        LOBYTE(v65) = sub_100013DB0();
        sub_100013B60();
        LOBYTE(v83) = v57 & 1;
        char v85 = 0;
        uint64_t v67 = v77;
        *(void *)uint64_t v7 = v78;
        *((void *)v7 + 1) = v67;
        v7[16] = v57 & 1;
        *((void *)v7 + 3) = v59;
        *((void *)v7 + 4) = KeyPath;
        *((void *)v7 + 5) = 0x3FE0000000000000;
        *((void *)v7 + 6) = v61;
        v7[56] = 1;
        *((void *)v7 + 8) = v63;
        *((void *)v7 + 9) = v62;
        v7[80] = v65;
        *((void *)v7 + 11) = v68;
        *((void *)v7 + 12) = v69;
        *((void *)v7 + 13) = v70;
        *((void *)v7 + 14) = v71;
        v7[120] = 0;
        swift_storeEnumTagMultiPayload();
        sub_100005E60(&qword_10001CCD8);
        unint64_t v72 = sub_10000B15C();
        uint64_t v86 = v79;
        unint64_t v87 = v72;
        swift_getOpaqueTypeConformance2();
        sub_10000B1FC();
        uint64_t v73 = v82;
        sub_100013D70();
        uint64_t v74 = sub_100005E60(&qword_10001CCD0);
        uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56))(v73, 0, 1, v74);
        break;
    }
  }
  return result;
}

uint64_t sub_100009C14@<X0>(void *a1@<X0>, char *a2@<X1>, void *a3@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v48 = a1[2];
  uint64_t v49 = v5;
  uint64_t v51 = a1[3];
  uint64_t v52 = v6;
  uint64_t v7 = (uint64_t)(a1 + 4);
  uint64_t v47 = a1[4];
  uint64_t v50 = a1[5];
  uint64_t v8 = sub_100005E60(&qword_10001CAE8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (uint64_t *)((char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = type metadata accessor for BridgedSpendingSummaryChartView();
  __chkstk_darwin(v11);
  long long v13 = (uint64_t *)((char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v46 = sub_100005E60(&qword_10001CD40);
  uint64_t v42 = *(void *)(v46 - 8);
  uint64_t v14 = __chkstk_darwin(v46);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v41 - v17;
  uint64_t v44 = sub_100005E60(&qword_10001CD48);
  __chkstk_darwin(v44);
  char v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100005E60(&qword_10001CD50);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  uint64_t v45 = (uint64_t)&v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v41 - v24;
  long long v26 = *(_OWORD *)a1;
  long long v56 = *((_OWORD *)a1 + 1);
  v57[0] = v26;
  sub_10000B4B8(v7, (uint64_t)v55, &qword_10001CD58);
  uint64_t v27 = *(void **)&v43[*(int *)(type metadata accessor for AppleCardWidgetTimelineEntry() + 20) + 48];
  if (v27)
  {
    uint64_t *v10 = swift_getKeyPath();
    sub_100005E60(&qword_10001CAE0);
    swift_storeEnumTagMultiPayload();
    uint64_t KeyPath = swift_getKeyPath();
    *long long v13 = v27;
    sub_10000B4B8((uint64_t)v10, (uint64_t)v13 + *(int *)(v11 + 20), &qword_10001CAE8);
    uint64_t v29 = (char *)v13 + *(int *)(v11 + 24);
    *(void *)uint64_t v29 = KeyPath;
    v29[8] = 0;
    id v30 = v27;
    sub_10000B3B8((uint64_t)v57);
    sub_10000B3B8((uint64_t)&v56);
    sub_10000B3B8((uint64_t)v55);
    unint64_t v31 = sub_10000B3E4();
    uint64_t v43 = (char *)v30;
    sub_100013E40();
    sub_10000B51C((uint64_t)v13);
    uint64_t v32 = v42;
    uint64_t v33 = v46;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v18, v16, v46);
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v20, v18, v33);
    swift_storeEnumTagMultiPayload();
    sub_100005E60(&qword_10001CD60);
    uint64_t v53 = v11;
    unint64_t v54 = v31;
    swift_getOpaqueTypeConformance2();
    sub_100005F54(&qword_10001CD70, &qword_10001CD60);
    sub_100013D70();

    (*(void (**)(char *, uint64_t))(v32 + 8))(v18, v33);
  }
  else
  {
    sub_10000B3B8((uint64_t)v57);
    sub_10000B3B8((uint64_t)&v56);
    sub_10000B3B8((uint64_t)v55);
    *(void *)char v20 = sub_100013EA0();
    *((_WORD *)v20 + 4) = 256;
    swift_storeEnumTagMultiPayload();
    sub_100005E60(&qword_10001CD60);
    unint64_t v34 = sub_10000B3E4();
    uint64_t v53 = v11;
    unint64_t v54 = v34;
    swift_getOpaqueTypeConformance2();
    sub_100005F54(&qword_10001CD70, &qword_10001CD60);
    sub_100013D70();
  }
  uint64_t v35 = v45;
  sub_100008884((uint64_t)v25, v45, &qword_10001CD50);
  uint64_t v36 = v50;
  uint64_t v38 = v51;
  uint64_t v37 = v52;
  *a3 = v49;
  a3[1] = v37;
  a3[2] = v48;
  a3[3] = v38;
  a3[4] = v47;
  a3[5] = v36;
  uint64_t v39 = sub_100005E60(&qword_10001CD78);
  sub_100008884(v35, (uint64_t)a3 + *(int *)(v39 + 48), &qword_10001CD50);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000088E8((uint64_t)v25, &qword_10001CD50);
  sub_1000088E8(v35, &qword_10001CD50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000A1B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = v1[*(int *)(type metadata accessor for AppleCardWidgetTimelineEntry() + 20) + 56];
  *a1 = sub_100013ED0();
  a1[1] = v4;
  uint64_t v5 = sub_100005E60(&qword_10001CC98);
  return sub_100009358(v1, v3, (uint64_t)a1 + *(int *)(v5 + 44));
}

uint64_t sub_10000A21C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100013CD0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005E60(&qword_10001CAE0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008884(v2, (uint64_t)v10, &qword_10001CAE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100013B70();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_100014040();
    uint64_t v14 = sub_100013DA0();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v18[2] = sub_10000A9B0(0x686353726F6C6F43, 0xEB00000000656D65, &v19);
      sub_100014080();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100013CC0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

double sub_10000A4D8(uint64_t a1, char a2)
{
  uint64_t v4 = sub_100013CD0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_100014040();
  uint64_t v9 = sub_100013DA0();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_10000A9B0(0x74616F6C464743, 0xE700000000000000, &v14);
    sub_100014080();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100013CC0();
  swift_getAtKeyPath();
  sub_100006644(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *(double *)&v14;
}

uint64_t sub_10000A6E4(uint64_t a1, char a2)
{
  uint64_t v4 = sub_100013CD0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_100014040();
  uint64_t v9 = sub_100013DA0();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_10000A9B0(1819242306, 0xE400000000000000, &v14);
    sub_100014080();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100013CC0();
  swift_getAtKeyPath();
  sub_100006644(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_10000A8E8(uint64_t a1)
{
  uint64_t v2 = sub_100013B70();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100013C00();
}

uint64_t sub_10000A9B0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000AA84(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000B5C8((uint64_t)v12, *a3);
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
      sub_10000B5C8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000B578((uint64_t)v12);
  return v7;
}

uint64_t sub_10000AA84(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100014090();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000AC40(a5, a6);
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
  uint64_t v8 = sub_100014170();
  if (!v8)
  {
    sub_100014180();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000141A0();
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

uint64_t sub_10000AC40(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000ACD8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000AEB8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000AEB8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000ACD8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000AE50(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100014150();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100014180();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100013FE0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000141A0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100014180();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000AE50(uint64_t a1, uint64_t a2)
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
  sub_100005E60(&qword_10001CD80);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000AEB8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005E60(&qword_10001CD80);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_1000141A0();
  __break(1u);
  return result;
}

uint64_t sub_10000B008@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100013C70();
  *a1 = v3;
  return result;
}

uint64_t sub_10000B034@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100013C70();
  *a1 = v3;
  return result;
}

uint64_t sub_10000B060()
{
  return sub_100013C80();
}

uint64_t sub_10000B088()
{
  return sub_100013C80();
}

uint64_t sub_10000B0B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100013C90();
  *a1 = result;
  return result;
}

uint64_t sub_10000B0DC()
{
  return sub_100013CA0();
}

uint64_t sub_10000B104@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013C30();
  *a1 = result;
  return result;
}

uint64_t sub_10000B130()
{
  return sub_100013C40();
}

unint64_t sub_10000B15C()
{
  unint64_t result = qword_10001CCE0;
  if (!qword_10001CCE0)
  {
    sub_100005EA4(&qword_10001CCC0);
    sub_100005F54(&qword_10001CCE8, &qword_10001CCB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CCE0);
  }
  return result;
}

unint64_t sub_10000B1FC()
{
  unint64_t result = qword_10001CCF0;
  if (!qword_10001CCF0)
  {
    sub_100005EA4(&qword_10001CCD8);
    sub_10000B278();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CCF0);
  }
  return result;
}

unint64_t sub_10000B278()
{
  unint64_t result = qword_10001CCF8;
  if (!qword_10001CCF8)
  {
    sub_100005EA4(&qword_10001CD00);
    sub_10000B318();
    sub_100005F54(&qword_10001CD28, &qword_10001CD30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CCF8);
  }
  return result;
}

unint64_t sub_10000B318()
{
  unint64_t result = qword_10001CD08;
  if (!qword_10001CD08)
  {
    sub_100005EA4(&qword_10001CD10);
    sub_100008744();
    sub_100005F54(&qword_10001CD18, &qword_10001CD20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD08);
  }
  return result;
}

uint64_t sub_10000B3B8(uint64_t a1)
{
  return a1;
}

unint64_t sub_10000B3E4()
{
  unint64_t result = qword_10001CD68;
  if (!qword_10001CD68)
  {
    type metadata accessor for BridgedSpendingSummaryChartView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD68);
  }
  return result;
}

uint64_t sub_10000B43C()
{
  return sub_100013BF0();
}

uint64_t sub_10000B464@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100013C10();
  *a1 = v3;
  return result;
}

uint64_t sub_10000B490()
{
  return sub_100013C20();
}

uint64_t sub_10000B4B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005E60(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B51C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BridgedSpendingSummaryChartView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B578(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000B5C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B628()
{
  return sub_100005F54(&qword_10001CD88, &qword_10001CD90);
}

void *initializeBufferWithCopyOfBuffer for AppleCardWidget(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AppleCardWidget()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AppleCardWidget(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AppleCardWidget(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for AppleCardWidget(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleCardWidget(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppleCardWidget(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppleCardWidget()
{
  return &type metadata for AppleCardWidget;
}

uint64_t sub_10000B7B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000B7D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v61 = a2;
  uint64_t v2 = sub_100005E60(&qword_10001CAA8);
  uint64_t v49 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v4 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005E60(&qword_10001CD98);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v51 = v5;
  uint64_t v52 = v6;
  __chkstk_darwin(v5);
  int64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005E60(&qword_10001CDA0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v55 = v9;
  uint64_t v56 = v10;
  __chkstk_darwin(v9);
  uint64_t v50 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005E60(&qword_10001CDA8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v57 = v12;
  uint64_t v58 = v13;
  __chkstk_darwin(v12);
  uint64_t v53 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005E60(&qword_10001CDB0);
  uint64_t v59 = *(void *)(v15 - 8);
  uint64_t v60 = v15;
  __chkstk_darwin(v15);
  unint64_t v54 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ConfigurationIntent();
  type metadata accessor for AppleCardWidgetDataManager();
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = self;
  swift_bridgeObjectRetain();
  *(void *)(v17 + 16) = [v18 sharedInstance:v48];
  *(void *)(v17 + 24) = [self sharedInstance];
  uint64_t v66 = v17;
  sub_100005E60(&qword_10001CDB8);
  uint64_t v19 = sub_100005EA4(&qword_10001CDC0);
  uint64_t v20 = sub_100005EA4(&qword_10001CDC8);
  unint64_t v21 = sub_10000C4F0();
  uint64_t v22 = sub_100005F54(&qword_10001CDE0, &qword_10001CDC8);
  uint64_t v62 = v19;
  uint64_t v63 = v20;
  unint64_t v64 = v21;
  uint64_t v65 = v22;
  swift_getOpaqueTypeConformance2();
  sub_10000C59C();
  sub_100013F00();
  uint64_t v23 = sub_100005F54(&qword_10001CAB0, &qword_10001CAA8);
  sub_100013D40();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v4, v2);
  sub_100005E60(&qword_10001CDF0);
  uint64_t v24 = sub_100013EE0();
  uint64_t v25 = *(void *)(v24 - 8);
  unint64_t v26 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_100014C90;
  (*(void (**)(unint64_t, void, uint64_t))(v25 + 104))(v27 + v26, enum case for WidgetFamily.systemSmall(_:), v24);
  uint64_t v62 = v2;
  uint64_t v63 = v23;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  id v30 = v50;
  uint64_t v29 = v51;
  sub_100013D30();
  swift_bridgeObjectRelease();
  uint64_t v31 = v29;
  (*(void (**)(char *, uint64_t))(v52 + 8))(v8, v29);
  sub_100013CF0();
  uint64_t v32 = sub_100013E20();
  uint64_t v34 = v33;
  LOBYTE(v26) = v35 & 1;
  uint64_t v62 = v31;
  uint64_t v63 = OpaqueTypeConformance2;
  uint64_t v36 = swift_getOpaqueTypeConformance2();
  uint64_t v37 = v53;
  uint64_t v38 = v55;
  sub_100013D50();
  sub_100008664(v32, v34, v26);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v30, v38);
  uint64_t v39 = v54;
  sub_100013CF0();
  uint64_t v40 = sub_100013E20();
  uint64_t v42 = v41;
  LOBYTE(v26) = v43 & 1;
  uint64_t v62 = v38;
  uint64_t v63 = v36;
  uint64_t v44 = v57;
  uint64_t v45 = swift_getOpaqueTypeConformance2();
  sub_100013D20();
  sub_100008664(v40, v42, v26);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v37, v44);
  if (qword_10001CA80 != -1) {
    swift_once();
  }
  uint64_t v62 = v44;
  uint64_t v63 = v45;
  swift_getOpaqueTypeConformance2();
  uint64_t v46 = v60;
  sub_100013D60();
  return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v39, v46);
}

uint64_t sub_10000BFDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v20[1] = a2;
  uint64_t v3 = sub_100013D90();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AppleCardWidgetTimelineEntry();
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for AppleCardContentView();
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005E60(&qword_10001CDC0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C820(a1, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for AppleCardWidgetTimelineEntry);
  uint64_t KeyPath = swift_getKeyPath();
  sub_10000C700((uint64_t)v9, (uint64_t)v13);
  uint64_t v18 = &v13[*(int *)(v11 + 28)];
  *(void *)uint64_t v18 = KeyPath;
  v18[8] = 0;
  sub_100013ED0();
  sub_10000C2DC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v16, 0.0, 1, INFINITY, 0);
  sub_10000C764((uint64_t)v13);
  sub_100013D80();
  sub_100013ED0();
  sub_100005E60(&qword_10001CDC8);
  sub_10000C4F0();
  sub_100005F54(&qword_10001CDE0, &qword_10001CDC8);
  sub_100013E90();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_10000C7C0((uint64_t)v16);
}

__n128 sub_10000C2DC@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_100014040();
    uint64_t v23 = (void *)sub_100013DA0();
    sub_100013B20();
  }
  sub_100013BC0();
  sub_10000C820(v13, a9, (uint64_t (*)(void))type metadata accessor for AppleCardContentView);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_100005E60(&qword_10001CDC0) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

void sub_10000C4A8(_WORD *a1@<X8>)
{
  *a1 = 256;
}

uint64_t sub_10000C4B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013FA0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000C4E8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B7D0(*v1, a1);
}

unint64_t sub_10000C4F0()
{
  unint64_t result = qword_10001CDD0;
  if (!qword_10001CDD0)
  {
    sub_100005EA4(&qword_10001CDC0);
    sub_10000C888(&qword_10001CDD8, (void (*)(uint64_t))type metadata accessor for AppleCardContentView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CDD0);
  }
  return result;
}

unint64_t sub_10000C59C()
{
  unint64_t result = qword_10001CDE8;
  if (!qword_10001CDE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CDE8);
  }
  return result;
}

uint64_t sub_10000C5F0()
{
  sub_100013CB0();
  sub_10000C888(&qword_10001CDF8, (void (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  sub_100013CE0();
  return v1;
}

uint64_t sub_10000C66C@<X0>(unsigned char *a1@<X8>)
{
  sub_100013CB0();
  sub_10000C888(&qword_10001CDF8, (void (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  uint64_t result = sub_100013CE0();
  *a1 = v3;
  return result;
}

uint64_t sub_10000C700(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppleCardWidgetTimelineEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C764(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppleCardContentView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000C7C0(uint64_t a1)
{
  uint64_t v2 = sub_100005E60(&qword_10001CDC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000C820(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000C888(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000C8D0()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for AppleCardWidgetTimelineProvider()
{
  return &type metadata for AppleCardWidgetTimelineProvider;
}

unint64_t sub_10000CA48()
{
  unint64_t result = qword_10001CE00[0];
  if (!qword_10001CE00[0])
  {
    type metadata accessor for AppleCardWidgetTimelineEntry();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10001CE00);
  }
  return result;
}

__n128 sub_10000CAA0@<Q0>(uint64_t a1@<X8>)
{
  if (qword_10001CA88 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100013B50();
  sub_1000063F8(v2, (uint64_t)qword_10001D968);
  char v3 = sub_100013B30();
  os_log_type_t v4 = sub_100014050();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(void *)&v16[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    sub_10000A9B0(0xD00000000000001FLL, 0x8000000100014D00, (uint64_t *)v16);
    sub_100014080();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%{public}s] returning placeholder", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v6 = [self zero];
  NSString v7 = sub_100013F90();
  id v8 = (id)PKCurrencyAmountMake();

  id v9 = v8;
  sub_100011548(v8, v8, (uint64_t *)v16);
  __n128 v14 = (__n128)v16[1];
  long long v15 = v16[0];
  uint64_t v10 = v17;
  uint64_t v11 = v18;
  sub_100013A00();
  uint64_t v12 = a1 + *(int *)(type metadata accessor for AppleCardWidgetTimelineEntry() + 20);
  __n128 result = v14;
  *(_OWORD *)uint64_t v12 = v15;
  *(__n128 *)(v12 + 16) = v14;
  *(void *)(v12 + 32) = v10;
  *(void *)(v12 + 40) = v11;
  *(void *)(v12 + 48) = 0;
  *(unsigned char *)(v12 + 56) = 3;
  return result;
}

uint64_t sub_10000CCD0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_10001CA88 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_100013B50();
  sub_1000063F8(v9, (uint64_t)qword_10001D968);
  uint64_t v10 = sub_100013B30();
  os_log_type_t v11 = sub_100014050();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136446210;
    sub_10000A9B0(0xD00000000000001FLL, 0x8000000100014D00, &v16);
    sub_100014080();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%{public}s] requesting snapshot", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v13 = [a1 period];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = a4;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100011F74(a5, (void (*)(long long *))sub_10000DAE0, v14, a5, (uint64_t)v13);
  swift_release_n();
  return swift_release();
}

uint64_t sub_10000CEE4(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4 = type metadata accessor for AppleCardWidgetTimelineEntry();
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  NSString v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D994((uint64_t *)a1);
  sub_100013A00();
  id v8 = &v7[*(int *)(v5 + 28)];
  long long v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)id v8 = *(_OWORD *)a1;
  *((_OWORD *)v8 + 1) = v9;
  *((_OWORD *)v8 + 2) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v8 + 41) = *(_OWORD *)(a1 + 41);
  if (qword_10001CA88 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100013B50();
  sub_1000063F8(v10, (uint64_t)qword_10001D968);
  os_log_type_t v11 = sub_100013B30();
  os_log_type_t v12 = sub_100014050();
  if (os_log_type_enabled(v11, v12))
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)id v13 = 136446210;
    uint64_t v15 = sub_10000A9B0(0xD00000000000001FLL, 0x8000000100014D00, &v16);
    sub_100014080();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%{public}s] returning snapshot", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  a2(v7);
  return sub_10000DA84((uint64_t)v7);
}

uint64_t sub_10000D104(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_10001CA88 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_100013B50();
  sub_1000063F8(v9, (uint64_t)qword_10001D968);
  uint64_t v10 = sub_100013B30();
  os_log_type_t v11 = sub_100014050();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v12 = 136446210;
    sub_10000A9B0(0xD00000000000001FLL, 0x8000000100014D00, &v16);
    sub_100014080();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%{public}s] requesting timeline", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v13 = [a1 period];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = a4;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100011F74(a5, (void (*)(long long *))sub_10000D98C, v14, a5, (uint64_t)v13);
  swift_release_n();
  return swift_release();
}

uint64_t sub_10000D318(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v6 = sub_100013F20();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100005E60(&qword_10001CE18);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for AppleCardWidgetTimelineEntry();
  uint64_t v30 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D994((uint64_t *)a1);
  sub_100013A00();
  uint64_t v14 = &v13[*(int *)(v11 + 20)];
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)a1;
  *((_OWORD *)v14 + 1) = v15;
  *((_OWORD *)v14 + 2) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v14 + 41) = *(_OWORD *)(a1 + 41);
  if (qword_10001CA88 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_100013B50();
  sub_1000063F8(v16, (uint64_t)qword_10001D968);
  uint64_t v17 = sub_100013B30();
  os_log_type_t v18 = sub_100014050();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v27 = v8;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v28 = a3;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    __n128 v29 = a2;
    uint64_t v32 = v21;
    long long v26 = v10;
    *(_DWORD *)uint64_t v20 = 136446210;
    uint64_t v31 = sub_10000A9B0(0xD00000000000001FLL, 0x8000000100014D00, &v32);
    uint64_t v10 = v26;
    uint64_t v8 = v27;
    sub_100014080();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "[%{public}s] returning timeline", v20, 0xCu);
    swift_arrayDestroy();
    a2 = v29;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100005E60(&qword_10001CE20);
  unint64_t v22 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_100014C90;
  sub_10000DA20((uint64_t)v13, v23 + v22);
  sub_100013F10();
  sub_10000CA48();
  sub_100013F60();
  a2(v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return sub_10000DA84((uint64_t)v13);
}

uint64_t sub_10000D6E8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000CCD0(a1, a2, a3, a4, *v4);
}

uint64_t sub_10000D6F0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000D104(a1, a2, a3, a4, *v4);
}

uint64_t sub_10000D6F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_10000D7AC;
  return IntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10000D7AC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unsigned __int8 v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000D8A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_10000DAEC;
  return IntentTimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_10000D954()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D98C(uint64_t a1)
{
  return sub_10000D318(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t *sub_10000D994(uint64_t *a1)
{
  uint64_t v2 = (void *)a1[6];
  sub_10000D9D0(*a1, a1[1]);
  id v3 = v2;
  return a1;
}

uint64_t sub_10000D9D0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10000DA20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppleCardWidgetTimelineEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000DA84(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppleCardWidgetTimelineEntry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000DAE0(uint64_t a1)
{
  return sub_10000CEE4(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t *sub_10000DAF0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100013A10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    if (v11)
    {
      *(void *)uint64_t v9 = *(void *)v10;
      *((void *)v9 + 1) = v11;
      uint64_t v12 = *((void *)v10 + 3);
      *((void *)v9 + 2) = *((void *)v10 + 2);
      *((void *)v9 + 3) = v12;
      uint64_t v13 = *((void *)v10 + 5);
      *((void *)v9 + 4) = *((void *)v10 + 4);
      *((void *)v9 + 5) = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v15 = *((_OWORD *)v10 + 1);
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v15;
      *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
    }
    uint64_t v16 = (void *)*((void *)v10 + 6);
    *((void *)v9 + 6) = v16;
    v9[56] = v10[56];
    id v17 = v16;
  }
  return a1;
}

void sub_10000DC20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100013A10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  if (*(void *)(v5 + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v6 = *(void **)(v5 + 48);
}

uint64_t sub_10000DCB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  if (v10)
  {
    *(void *)uint64_t v8 = *(void *)v9;
    *(void *)(v8 + 8) = v10;
    uint64_t v11 = *(void *)(v9 + 24);
    *(void *)(v8 + 16) = *(void *)(v9 + 16);
    *(void *)(v8 + 24) = v11;
    uint64_t v12 = *(void *)(v9 + 40);
    *(void *)(v8 + 32) = *(void *)(v9 + 32);
    *(void *)(v8 + 40) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v13 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v13;
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  }
  uint64_t v14 = *(void **)(v9 + 48);
  *(void *)(v8 + 48) = v14;
  *(unsigned char *)(v8 + 56) = *(unsigned char *)(v9 + 56);
  id v15 = v14;
  return a1;
}

uint64_t sub_10000DD94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (long long *)(a2 + v7);
  uint64_t v10 = *(void *)(a1 + v7 + 8);
  uint64_t v11 = *((void *)v9 + 1);
  if (v10)
  {
    if (v11)
    {
      *(void *)uint64_t v8 = *(void *)v9;
      *(void *)(v8 + 8) = *((void *)v9 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v8 + 16) = *((void *)v9 + 2);
      *(void *)(v8 + 24) = *((void *)v9 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v8 + 32) = *((void *)v9 + 4);
      *(void *)(v8 + 40) = *((void *)v9 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_100008E84(v8);
      long long v13 = v9[1];
      long long v12 = v9[2];
      *(_OWORD *)uint64_t v8 = *v9;
      *(_OWORD *)(v8 + 16) = v13;
      *(_OWORD *)(v8 + 32) = v12;
    }
  }
  else if (v11)
  {
    *(void *)uint64_t v8 = *(void *)v9;
    *(void *)(v8 + 8) = *((void *)v9 + 1);
    *(void *)(v8 + 16) = *((void *)v9 + 2);
    *(void *)(v8 + 24) = *((void *)v9 + 3);
    *(void *)(v8 + 32) = *((void *)v9 + 4);
    *(void *)(v8 + 40) = *((void *)v9 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v14 = *v9;
    long long v15 = v9[2];
    *(_OWORD *)(v8 + 16) = v9[1];
    *(_OWORD *)(v8 + 32) = v15;
    *(_OWORD *)uint64_t v8 = v14;
  }
  uint64_t v16 = *(void **)(v8 + 48);
  id v17 = (void *)*((void *)v9 + 6);
  *(void *)(v8 + 48) = v17;
  id v18 = v17;

  *(unsigned char *)(v8 + 56) = *((unsigned char *)v9 + 56);
  return a1;
}

uint64_t sub_10000DF1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  v8[2] = v9[2];
  *(_OWORD *)((char *)v8 + 41) = *(_OWORD *)((char *)v9 + 41);
  return a1;
}

uint64_t sub_10000DFB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  if (!*(void *)(a1 + v7 + 8)) {
    goto LABEL_5;
  }
  uint64_t v10 = *(void *)(v9 + 8);
  if (!v10)
  {
    sub_100008E84(v8);
LABEL_5:
    long long v13 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v13;
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    goto LABEL_6;
  }
  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 + 24);
  *(void *)(v8 + 16) = *(void *)(v9 + 16);
  *(void *)(v8 + 24) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v9 + 40);
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  *(void *)(v8 + 40) = v12;
  swift_bridgeObjectRelease();
LABEL_6:
  long long v14 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = *(void *)(v9 + 48);

  *(unsigned char *)(v8 + 56) = *(unsigned char *)(v9 + 56);
  return a1;
}

uint64_t sub_10000E09C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000E0B0);
}

uint64_t sub_10000E0B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013A10();
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
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_10000E180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000E194);
}

uint64_t sub_10000E194(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100013A10();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

uint64_t type metadata accessor for AppleCardWidgetTimelineEntry()
{
  uint64_t result = qword_10001CE80;
  if (!qword_10001CE80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000E2A0()
{
  uint64_t result = sub_100013A10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10000E334@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100013A10();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

BOOL sub_10000E3A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000E3B4()
{
  Swift::UInt v1 = *v0;
  sub_1000141D0();
  sub_1000141E0(v1);
  return sub_1000141F0();
}

void sub_10000E3FC()
{
  sub_1000141E0(*v0);
}

Swift::Int sub_10000E428()
{
  Swift::UInt v1 = *v0;
  sub_1000141D0();
  sub_1000141E0(v1);
  return sub_1000141F0();
}

void sub_10000E46C(void *a1, void *a2, unint64_t a3, void (*a4)(long long *), uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (!a1) {
    goto LABEL_9;
  }
  id v63 = a1;
  id v13 = [v63 creditDetails];
  if (!v13)
  {
LABEL_61:
    __break(1u);
    return;
  }
  long long v14 = v13;
  id v15 = [v13 currencyCode];

  if (!v15)
  {

LABEL_9:
    long long v71 = 0u;
    memset(v72, 0, 25);
    long long aBlock = 0u;
    a4(&aBlock);
    return;
  }
  uint64_t v16 = sub_100013FA0();
  uint64_t v18 = v17;

  if (a2)
  {
    uint64_t v58 = v18;
    id v19 = objc_allocWithZone((Class)PKTransactionSource);
    id v59 = a2;
    id v20 = [v19 initWithPaymentPass:];
    sub_100005E60(&qword_10001CFA0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100014E20;
    *(void *)(inited + 32) = v20;
    *(void *)&long long aBlock = inited;
    sub_100014000();
    if ((unint64_t)aBlock >> 62)
    {
      id v24 = v20;
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_100014190();
      swift_bridgeObjectRelease();
      if (!v25)
      {
LABEL_14:
        swift_bridgeObjectRelease();
        uint64_t v61 = a4;
        uint64_t v62 = a5;
        uint64_t v57 = a6;
        uint64_t v60 = v20;
        uint64_t v56 = v16;
        if (a3)
        {
          unint64_t v26 = a3;
          if ((a3 & 0xC000000000000001) == 0) {
            goto LABEL_22;
          }
LABEL_19:
          swift_bridgeObjectRetain();
          sub_1000140C0();
          sub_100012710(0, &qword_10001CF90);
          sub_10001274C(&qword_10001CF98, &qword_10001CF90);
          sub_100014030();
          unint64_t v26 = v65;
          unint64_t v64 = v66;
          uint64_t v27 = v67;
          uint64_t v28 = v68;
          unint64_t v29 = v69;
          goto LABEL_26;
        }
        if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_100014190())
        {
          sub_100011C10((unint64_t)&_swiftEmptyArrayStorage, &qword_10001CFB8, &qword_10001CF90);
          unint64_t v26 = v30;
          if ((v30 & 0xC000000000000001) != 0) {
            goto LABEL_19;
          }
        }
        else
        {
          unint64_t v26 = (unint64_t)&_swiftEmptySetSingleton;
          if (((unint64_t)&_swiftEmptySetSingleton & 0xC000000000000001) != 0) {
            goto LABEL_19;
          }
        }
LABEL_22:
        uint64_t v31 = -1 << *(unsigned char *)(v26 + 32);
        unint64_t v64 = (char *)(v26 + 56);
        uint64_t v27 = ~v31;
        uint64_t v32 = -v31;
        if (v32 < 64) {
          uint64_t v33 = ~(-1 << v32);
        }
        else {
          uint64_t v33 = -1;
        }
        unint64_t v29 = v33 & *(void *)(v26 + 56);
        swift_bridgeObjectRetain();
        uint64_t v28 = 0;
LABEL_26:
        int64_t v34 = (unint64_t)(v27 + 64) >> 6;
        if ((v26 & 0x8000000000000000) == 0) {
          goto LABEL_30;
        }
        while (sub_1000140F0())
        {
          sub_100012710(0, &qword_10001CF90);
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v35 = (id)aBlock;
          swift_unknownObjectRelease();
          uint64_t v36 = v28;
          uint64_t v37 = v29;
          if (!v35) {
            break;
          }
          while (1)
          {
            sub_1000107DC(&aBlock, [objc_allocWithZone((Class)PKTransactionSource) initWithAccountUser:v35]);

            uint64_t v28 = v36;
            unint64_t v29 = v37;
            if ((v26 & 0x8000000000000000) != 0) {
              break;
            }
LABEL_30:
            if (v29)
            {
              uint64_t v37 = (v29 - 1) & v29;
              unint64_t v38 = __clz(__rbit64(v29)) | (v28 << 6);
              uint64_t v36 = v28;
            }
            else
            {
              int64_t v39 = v28 + 1;
              if (__OFADD__(v28, 1))
              {
                __break(1u);
                goto LABEL_61;
              }
              if (v39 >= v34) {
                goto LABEL_49;
              }
              unint64_t v40 = *(void *)&v64[8 * v39];
              uint64_t v36 = v28 + 1;
              if (!v40)
              {
                uint64_t v36 = v28 + 2;
                if (v28 + 2 >= v34) {
                  goto LABEL_49;
                }
                unint64_t v40 = *(void *)&v64[8 * v36];
                if (!v40)
                {
                  uint64_t v36 = v28 + 3;
                  if (v28 + 3 >= v34) {
                    goto LABEL_49;
                  }
                  unint64_t v40 = *(void *)&v64[8 * v36];
                  if (!v40)
                  {
                    uint64_t v36 = v28 + 4;
                    if (v28 + 4 >= v34) {
                      goto LABEL_49;
                    }
                    unint64_t v40 = *(void *)&v64[8 * v36];
                    if (!v40)
                    {
                      uint64_t v41 = v28 + 5;
                      while (v34 != v41)
                      {
                        unint64_t v40 = *(void *)&v64[8 * v41++];
                        if (v40)
                        {
                          uint64_t v36 = v41 - 1;
                          goto LABEL_45;
                        }
                      }
                      goto LABEL_49;
                    }
                  }
                }
              }
LABEL_45:
              uint64_t v37 = (v40 - 1) & v40;
              unint64_t v38 = __clz(__rbit64(v40)) + (v36 << 6);
            }
            id v35 = *(id *)(*(void *)(v26 + 48) + 8 * v38);
            if (!v35) {
              goto LABEL_49;
            }
          }
        }
LABEL_49:
        sub_100012708();
        id v42 = objc_allocWithZone((Class)PKTransactionSourceCollection);
        sub_100012710(0, &qword_10001CFA8);
        sub_10001274C(&qword_10001CFB0, &qword_10001CFA8);
        Class isa = sub_100014010().super.isa;
        swift_bridgeObjectRelease();
        id v44 = [v42 initWithTransactionSources:isa];

        id v45 = [v63 creditDetails];
        if (!v45)
        {
          swift_bridgeObjectRelease();
          uint64_t v48 = v61;
          id v50 = v59;
          uint64_t v49 = v60;
LABEL_58:
          long long v71 = 0u;
          memset(v72, 0, 24);
          long long aBlock = 0u;
          BYTE8(v72[1]) = 2;
          v48(&aBlock);

          goto LABEL_59;
        }
        uint64_t v46 = v45;
        id v47 = [v45 accountSummary];

        uint64_t v48 = v61;
        uint64_t v49 = v60;
        if (v47)
        {
          if ([v47 requiresDebtCollectionNotices])
          {
            swift_bridgeObjectRelease();

LABEL_57:
            id v50 = v59;
            goto LABEL_58;
          }
          unsigned __int8 v51 = [self shouldDisplayTransactionsForTransactionSourceCollection:v44 withAccount:v63];

          if (v51)
          {
            id v52 = [objc_allocWithZone((Class)PKSpendingSummaryFetcher) initWithTransactionSourceCollection:v44 account:v63 accountUser:0];
            uint64_t v53 = (void *)swift_allocObject();
            v53[2] = v57;
            v53[3] = a7;
            v53[4] = v52;
            v53[5] = v63;
            v53[6] = v56;
            v53[7] = v58;
            v53[8] = v61;
            v53[9] = v62;
            *(void *)&v72[0] = sub_1000127F4;
            *((void *)&v72[0] + 1) = v53;
            *(void *)&long long aBlock = _NSConcreteStackBlock;
            *((void *)&aBlock + 1) = 1107296256;
            *(void *)&long long v71 = sub_10000F224;
            *((void *)&v71 + 1) = &unk_100019560;
            unint64_t v54 = _Block_copy(&aBlock);
            id v55 = v63;
            swift_retain();
            id v50 = v52;
            swift_retain();
            swift_release();
            [v50 availableSummaries:v54];

            _Block_release(v54);
LABEL_59:

            return;
          }
        }
        swift_bridgeObjectRelease();
        goto LABEL_57;
      }
    }
    else
    {
      uint64_t v22 = *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v23 = v20;
      if (!v22) {
        goto LABEL_14;
      }
    }
    sub_100011C10(aBlock, &qword_10001CFC0, &qword_10001CFA8);
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  long long v71 = 0u;
  memset(v72, 0, 24);
  long long aBlock = 0u;
  BYTE8(v72[1]) = 1;
  a4(&aBlock);
}

uint64_t sub_10000EC48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v27 = a8;
  id v28 = a6;
  uint64_t v29 = sub_100013A10();
  uint64_t v16 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FC8C(a1, a2, a3, a5, (uint64_t)v18);
  v19.super.Class isa = sub_1000139E0().super.isa;
  if (a5 == 3) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = a5 == 2;
  }
  uint64_t v21 = (void *)swift_allocObject();
  uint64_t v22 = v27;
  v21[2] = a7;
  v21[3] = v22;
  v21[4] = a9;
  v21[5] = a10;
  v21[6] = a11;
  aBlock[4] = sub_100012878;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000F1BC;
  aBlock[3] = &unk_1000195B0;
  id v23 = _Block_copy(aBlock);
  id v24 = a7;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [v28 spendingSummaryStartingWithDate:v19.super.isa type:v20 includingLastPeriodChange:0 completion:v23];
  _Block_release(v23);

  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v29);
}

void sub_10000EE44(void *a1, id a2, uint64_t a3, uint64_t a4, void (*a5)(long long *))
{
  id v8 = [a2 creditDetails];
  if (!v8)
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = v8;
  id v33 = [v8 accountSummary];

  id v10 = [a2 creditDetails];
  if (!v10)
  {
LABEL_20:
    __break(1u);
    return;
  }
  int v11 = v10;
  id v12 = [v10 cardBalance];

  if (!v12)
  {
    if (!v33) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if (!v33)
  {

    goto LABEL_14;
  }
  id v13 = [v33 availableCredit];
  if (!v13)
  {

LABEL_11:
    id v23 = v33;
    id v24 = (id)PKCurrentUserAltDSID();
    id v25 = [v23 accountUserActivityForAccountUserAltDSID:v24];

    if (v25)
    {
      id v26 = [v25 totalSpending];

      if (v26)
      {
        id v34 = a1;
        id v27 = objc_allocWithZone((Class)PKCurrencyAmount);
        swift_bridgeObjectRetain();
        id v28 = v26;
        NSString v29 = sub_100013F90();
        swift_bridgeObjectRelease();
        id v30 = [v27 initWithAmount:v28 currency:v29 exponent:0];

        sub_100011548(v30, 0, (uint64_t *)&v35);
        long long v31 = v35;
        long long v38 = v35;
        long long v39 = v36;
        v40[0] = v37;
        *(void *)&v40[1] = v34;
        BYTE8(v40[1]) = 3;
        id v33 = v34;
        a5(&v38);

        sub_100012888(v31, *((uint64_t *)&v31 + 1));
LABEL_15:
        uint64_t v22 = v33;
        goto LABEL_16;
      }
    }
LABEL_14:
    long long v39 = 0u;
    memset(v40, 0, 25);
    long long v38 = 0u;
    a5(&v38);
    goto LABEL_15;
  }
  long long v14 = v13;
  id v15 = a1;
  id v16 = objc_allocWithZone((Class)PKCurrencyAmount);
  id v32 = v12;
  id v17 = v14;
  swift_bridgeObjectRetain();
  NSString v18 = sub_100013F90();
  swift_bridgeObjectRelease();
  id v19 = [v16 initWithAmount:v17 currency:v18 exponent:0];

  sub_100011548(v12, v19, (uint64_t *)&v35);
  long long v20 = v35;
  long long v38 = v35;
  long long v39 = v36;
  v40[0] = v37;
  *(void *)&v40[1] = v15;
  BYTE8(v40[1]) = 3;
  id v21 = v15;
  a5(&v38);

  sub_100012888(v20, *((uint64_t *)&v20 + 1));
  uint64_t v22 = v21;
LABEL_16:
}

void sub_10000F1BC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10000F224(uint64_t a1)
{
  Swift::UInt v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  sub_100013A10();
  uint64_t v2 = sub_100013FF0();
  uint64_t v3 = sub_100013FF0();
  uint64_t v4 = sub_100013FF0();
  swift_retain();
  v1(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_10000F2F0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  int v11 = (void *)swift_allocObject();
  v11[2] = a6;
  v11[3] = a3;
  v11[4] = a4;
  v11[5] = a2;
  v14[4] = sub_1000126FC;
  v14[5] = v11;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10000F474;
  v14[3] = &unk_100019510;
  id v12 = _Block_copy(v14);
  swift_retain();
  swift_retain();
  id v13 = a2;
  swift_release();
  [a5 defaultAccountForFeature:2 completion:v12];
  _Block_release(v12);
}

uint64_t sub_10000F3F8(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void), uint64_t a5, uint64_t a6)
{
  swift_beginAccess();
  id v10 = *(void **)(a3 + 16);
  *(void *)(a3 + 16) = a1;
  id v11 = a1;

  return a4(a6, 0);
}

void sub_10000F474(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_10000F500(uint64_t a1, void *a2, void *a3, void *aBlock)
{
  id v6 = *(void (**)(id, id, uint64_t (*)(), uint64_t))(a1 + 32);
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  swift_retain();
  id v10 = a2;
  id v9 = a3;
  v6(v10, v9, sub_100012694, v8);
  swift_release();
  swift_release();
}

void sub_10000F5D4(uint64_t a1, void *a2, void (*a3)(void *, uint64_t), uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  swift_beginAccess();
  id v13 = *(void **)(a5 + 16);
  if (v13 && (id v14 = [v13 accountIdentifier]) != 0)
  {
    id v15 = v14;
    sub_100013FA0();

    NSString v16 = sub_100013F90();
    swift_bridgeObjectRelease();
    id v17 = (void *)swift_allocObject();
    v17[2] = a7;
    v17[3] = a3;
    v17[4] = a4;
    v17[5] = a2;
    aBlock[4] = sub_100012650;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000F7E0;
    aBlock[3] = &unk_100019498;
    NSString v18 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    id v19 = a2;
    swift_release();
    [a6 paymentPassWithAssociatedAccountIdentifier:v16 completion:v18];
    _Block_release(v18);
  }
  else
  {
    a3(a2, 1);
  }
}

uint64_t sub_10000F764(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t, void), uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  id v9 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = a1;
  id v10 = a1;

  return a3(a5, 0);
}

void sub_10000F7E0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_10000F84C(uint64_t a1, void *a2, void (*a3)(void *, uint64_t), uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  swift_beginAccess();
  id v13 = *(void **)(a5 + 16);
  if (v13 && (id v14 = [v13 accountIdentifier]) != 0)
  {
    id v15 = v14;
    sub_100013FA0();

    NSString v16 = sub_100013F90();
    swift_bridgeObjectRelease();
    id v17 = (void *)swift_allocObject();
    v17[2] = a7;
    v17[3] = a3;
    v17[4] = a4;
    v17[5] = a2;
    aBlock[4] = sub_100012640;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000FA60;
    aBlock[3] = &unk_100019448;
    NSString v18 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    id v19 = a2;
    swift_release();
    [a6 accountUsersForAccountWithIdentifier:v16 completion:v18];
    _Block_release(v18);
  }
  else
  {
    a3(a2, 1);
  }
}

uint64_t sub_10000F9DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void), uint64_t a4, uint64_t a5)
{
  *(void *)(a2 + 16) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a3(a5, 0);
}

uint64_t sub_10000FA60(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    sub_100012710(0, &qword_10001CF90);
    sub_10001274C(&qword_10001CF98, &qword_10001CF90);
    uint64_t v2 = sub_100014020();
  }
  swift_retain();
  v3(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000FB14(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, void *, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  swift_beginAccess();
  id v12 = *(void **)(a6 + 16);
  swift_beginAccess();
  id v13 = *(void **)(a7 + 16);
  swift_beginAccess();
  uint64_t v14 = *(void *)(a8 + 16);
  swift_bridgeObjectRetain();
  id v15 = v12;
  id v16 = v13;
  a4(v12, v13, v14);

  return swift_bridgeObjectRelease();
}

void sub_10000FBF4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = *(void (**)(uint64_t, id, uint64_t))(a1 + 32);
  swift_retain();
  id v8 = a3;
  swift_unknownObjectRetain();
  v7(a2, v8, a4);
  swift_release();
  swift_unknownObjectRelease();
}

uint64_t sub_10000FC8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_100005E60(&qword_10001CF80);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  id v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  id v16 = (char *)v32 - v15;
  __chkstk_darwin(v14);
  NSString v18 = (char *)v32 - v17;
  switch(a4)
  {
    case 0:
      return sub_1000139F0();
    case 1:
      uint64_t v25 = *(void *)(a1 + 16);
      if (!v25) {
        goto LABEL_20;
      }
      uint64_t v26 = v25 - 1;
      uint64_t v27 = sub_100013A10();
      uint64_t v28 = *(void *)(v27 - 8);
      (*(void (**)(char *, unint64_t, uint64_t))(v28 + 16))(v18, a1+ ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))+ *(void *)(v28 + 72) * v26, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v18, 0, 1, v27);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v18, 1, v27) == 1) {
        goto LABEL_21;
      }
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v28 + 32))(a5, v18, v27);
    case 2:
      uint64_t v20 = *(void *)(a2 + 16);
      if (!v20)
      {
        uint64_t v29 = sub_100013A10();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v16, 1, 1, v29);
LABEL_17:
        __break(1u);
LABEL_18:
        uint64_t v30 = sub_100013A10();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v13, 1, 1, v30);
LABEL_19:
        __break(1u);
LABEL_20:
        uint64_t v31 = sub_100013A10();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v18, 1, 1, v31);
LABEL_21:
        __break(1u);
LABEL_22:
        v32[1] = a4;
        sub_1000141B0();
        __break(1u);
        JUMPOUT(0x1000101B8);
      }
      uint64_t v21 = v20 - 1;
      id v13 = (char *)sub_100013A10();
      NSString v18 = (char *)*((void *)v13 - 1);
      (*((void (**)(char *, unint64_t, char *))v18 + 2))(v16, a2+ ((v18[80] + 32) & ~(unint64_t)v18[80])+ *((void *)v18 + 9) * v21, v13);
      (*((void (**)(char *, void, uint64_t, char *))v18 + 7))(v16, 0, 1, v13);
      if ((*((unsigned int (**)(char *, uint64_t, char *))v18 + 6))(v16, 1, v13) == 1) {
        goto LABEL_17;
      }
      return (*((uint64_t (**)(uint64_t, char *, char *))v18 + 4))(a5, v16, v13);
    case 3:
      uint64_t v22 = *(void *)(a3 + 16);
      if (!v22) {
        goto LABEL_18;
      }
      uint64_t v23 = v22 - 1;
      uint64_t v24 = sub_100013A10();
      NSString v18 = *(char **)(v24 - 8);
      (*((void (**)(char *, unint64_t, uint64_t))v18 + 2))(v13, a3+ ((v18[80] + 32) & ~(unint64_t)v18[80])+ *((void *)v18 + 9) * v23, v24);
      (*((void (**)(char *, void, uint64_t, uint64_t))v18 + 7))(v13, 0, 1, v24);
      if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v18 + 6))(v13, 1, v24) == 1) {
        goto LABEL_19;
      }
      return (*((uint64_t (**)(uint64_t, char *, uint64_t))v18 + 4))(a5, v13, v24);
    default:
      goto LABEL_22;
  }
}

uint64_t sub_1000101C8()
{
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for AppleCardWidgetDataManager()
{
  return self;
}

ValueMetadata *type metadata accessor for AppleCardWidgetDataManager.CreditBalanceModel()
{
  return &type metadata for AppleCardWidgetDataManager.CreditBalanceModel;
}

void destroy for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t a1)
{
  if (*(void *)(a1 + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v2 = *(void **)(a1 + 48);
}

uint64_t initializeWithCopy for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    uint64_t v5 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v5;
    uint64_t v6 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  }
  id v8 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  id v9 = v8;
  return a1;
}

uint64_t assignWithCopy for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  if (*(void *)(a1 + 8))
  {
    if (v4)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      *(void *)(a1 + 24) = *((void *)a2 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      *(void *)(a1 + 40) = *((void *)a2 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_100008E84(a1);
      long long v6 = a2[1];
      long long v5 = a2[2];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_OWORD *)(a1 + 32) = v5;
    }
  }
  else if (v4)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = *((void *)a2 + 1);
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(void *)(a1 + 24) = *((void *)a2 + 3);
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(void *)(a1 + 40) = *((void *)a2 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v7 = *a2;
    long long v8 = a2[2];
    *(_OWORD *)(a1 + 16) = a2[1];
    *(_OWORD *)(a1 + 32) = v8;
    *(_OWORD *)a1 = v7;
  }
  id v9 = *(void **)(a1 + 48);
  uint64_t v10 = (void *)*((void *)a2 + 6);
  *(void *)(a1 + 48) = v10;
  id v11 = v10;

  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  return a1;
}

__n128 initializeWithTake for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 8)) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  if (!v4)
  {
    sub_100008E84(a1);
LABEL_5:
    long long v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_6;
  }
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
LABEL_6:
  long long v8 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 57)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppleCardWidgetDataManager.AppleCardWidgetData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 57) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleCardWidgetDataManager.AppleCardWidgetData()
{
  return &type metadata for AppleCardWidgetDataManager.AppleCardWidgetData;
}

unsigned char *initializeBufferWithCopyOfBuffer for AppleCardWidgetDataManager.AppleCardWidgetData.Failure(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppleCardWidgetDataManager.AppleCardWidgetData.Failure(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AppleCardWidgetDataManager.AppleCardWidgetData.Failure(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001073CLL);
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

uint64_t sub_100010764(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001076C(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppleCardWidgetDataManager.AppleCardWidgetData.Failure()
{
  return &type metadata for AppleCardWidgetDataManager.AppleCardWidgetData.Failure;
}

unint64_t sub_100010788()
{
  unint64_t result = qword_10001CF88;
  if (!qword_10001CF88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CF88);
  }
  return result;
}

uint64_t sub_1000107DC(void *a1, void *a2)
{
  int v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_1000140E0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_100012710(0, &qword_10001CFA8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1000140D0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100010A7C(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100010C74();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_100010F14((uint64_t)v8, v23);
    uint64_t *v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_100014060(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_100012710(0, &qword_10001CFA8);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_100014070();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_100014070();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    id v8 = a2;
    sub_100010F98((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_100010A7C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100005E60(&qword_10001CFC0);
    uint64_t v2 = sub_100014120();
    uint64_t v14 = v2;
    sub_1000140C0();
    if (sub_1000140F0())
    {
      sub_100012710(0, &qword_10001CFA8);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_100010C74();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_100014060(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_1000140F0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_100010C74()
{
  Swift::UInt v1 = v0;
  uint64_t v2 = *v0;
  sub_100005E60(&qword_10001CFC0);
  uint64_t v3 = sub_100014110();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                Swift::UInt v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_100014060(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *Swift::UInt v1 = v4;
  return result;
}

unint64_t sub_100010F14(uint64_t a1, void *a2)
{
  sub_100014060(a2[5]);
  unint64_t result = sub_1000140B0();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_100010F98(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100010C74();
  }
  else
  {
    if (v7 > v6)
    {
      sub_100011120();
      goto LABEL_14;
    }
    sub_1000112CC();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_100014060(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100012710(0, &qword_10001CFA8);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_100014070();

    if (v12)
    {
LABEL_13:
      sub_1000141C0();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_100014070();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_100011120()
{
  Swift::UInt v1 = v0;
  sub_100005E60(&qword_10001CFC0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100014100();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *Swift::UInt v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000112CC()
{
  Swift::UInt v1 = v0;
  uint64_t v2 = *v0;
  sub_100005E60(&qword_10001CFC0);
  uint64_t v3 = sub_100014110();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *Swift::UInt v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_100014060(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    Swift::UInt v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_100011548(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_100013A10();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100013AB0();
  id v79 = *(id *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v78 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100013A90();
  uint64_t v77 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  unint64_t v14 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100013AD0();
  uint64_t v16 = __chkstk_darwin(v15);
  Swift::Int v19 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v74 = v12;
  uint64_t v75 = v17;
  uint64_t v81 = a2;
  uint64_t v76 = v16;
  id v20 = [a1 amount];
  if (!v20)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v21 = v20;
  unsigned int v22 = [v20 pk_isNegativeNumber];

  unint64_t v72 = v9;
  uint64_t v73 = v10;
  if (v22)
  {
    uint64_t v71 = v7;
    uint64_t v80 = v6;
    unint64_t v23 = (NSString *)sub_100013F90();
    id v24 = (id)PKLocalizedPaymentString(v23);

    if (!v24)
    {
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    sub_100013FA0();

    sub_100005E60(&qword_10001CFC8);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_100014C90;
    BOOL v26 = a1;
    id v27 = [a1 negativeValue];
    if (!v27)
    {
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    uint64_t v28 = v27;
    id v29 = [v27 formattedStringValue];

    if (!v29)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    uint64_t v30 = sub_100013FA0();
    uint64_t v32 = v31;

    *(void *)(v25 + 56) = &type metadata for String;
    *(void *)(v25 + 64) = sub_1000128D8();
    *(void *)(v25 + 32) = v30;
    *(void *)(v25 + 40) = v32;
    uint64_t v33 = sub_100013FB0();
    uint64_t v35 = v34;
    swift_bridgeObjectRelease();
    a1 = v26;
    uint64_t v6 = v80;
    long long v36 = v81;
    uint64_t v7 = v71;
    uint64_t v80 = v35;
    uint64_t v81 = (void *)v33;
    if (!v36) {
      goto LABEL_8;
    }
LABEL_12:
    id v56 = v36;
    NSString v57 = sub_100013F90();
    id v58 = (id)PKLocalizedFeatureString();

    if (v58)
    {
      id v79 = a1;
      uint64_t v46 = sub_100013FA0();
      uint64_t v48 = v59;

      NSString v60 = sub_100013F90();
      id v61 = (id)PKLocalizedFeatureString();

      if (v61)
      {
        sub_100013FA0();

        sub_100005E60(&qword_10001CFC8);
        uint64_t v62 = swift_allocObject();
        *(_OWORD *)(v62 + 16) = xmmword_100014C90;
        id v63 = [v56 formattedStringValue];
        if (v63)
        {
          unint64_t v64 = v63;
          uint64_t v65 = sub_100013FA0();
          uint64_t v67 = v66;

          *(void *)(v62 + 56) = &type metadata for String;
          *(void *)(v62 + 64) = sub_1000128D8();
          *(void *)(v62 + 32) = v65;
          *(void *)(v62 + 40) = v67;
          uint64_t v49 = sub_100013FB0();
          uint64_t v50 = v68;
          swift_bridgeObjectRelease();

          goto LABEL_16;
        }
        goto LABEL_21;
      }
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v51 = [a1 formattedStringValue];
  long long v36 = v81;
  if (!v51)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  id v52 = v51;
  uint64_t v53 = sub_100013FA0();
  uint64_t v55 = v54;

  uint64_t v80 = v55;
  uint64_t v81 = (void *)v53;
  if (v36) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v37 = v77;
  uint64_t v38 = v74;
  (*(void (**)(char *, void, uint64_t))(v77 + 104))(v14, enum case for Calendar.Identifier.gregorian(_:), v74);
  sub_100013AA0();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v14, v38);
  unint64_t v40 = v78;
  long long v39 = (void (**)(void, void))v79;
  uint64_t v41 = v73;
  (*((void (**)(char *, void, uint64_t))v79 + 13))(v78, enum case for Calendar.Component.month(_:), v73);
  id v42 = v72;
  sub_1000139F0();
  sub_100013AC0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v42, v6);
  ((void (**)(char *, uint64_t))v39)[1](v40, v41);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v19, v76);
  NSString v43 = sub_100013F90();
  id v44 = (NSString *)(id)PKGregorianMonthSpecificLocalizedStringKeyForKey();

  id v45 = (id)PKLocalizedMadisonString(v44);
  if (v45)
  {
    uint64_t v46 = sub_100013FA0();
    uint64_t v48 = v47;

    uint64_t v49 = 0;
    uint64_t v50 = 0;
LABEL_16:
    *a3 = v46;
    a3[1] = v48;
    uint64_t v69 = v80;
    a3[2] = (uint64_t)v81;
    a3[3] = v69;
    a3[4] = v49;
    a3[5] = v50;
    return;
  }
LABEL_26:
  __break(1u);
}

void sub_100011C10(unint64_t a1, uint64_t *a2, unint64_t *a3)
{
  unint64_t v5 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100014190();
    swift_bridgeObjectRelease();
    if (v9)
    {
LABEL_3:
      sub_100005E60(a2);
      uint64_t v6 = (void *)sub_100014130();
      uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v5) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_100014190();
      swift_bridgeObjectRelease();
      if (!v8) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v6 = &_swiftEmptySetSingleton;
  uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
  if (v5) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v8 = *(void *)(v7 + 16);
  if (!v8) {
    return;
  }
LABEL_9:
  uint64_t v10 = (char *)(v6 + 7);
  uint64_t v46 = v8;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = sub_100014160();
      BOOL v13 = __OFADD__(v11++, 1);
      if (v13)
      {
        __break(1u);
        goto LABEL_36;
      }
      uint64_t v14 = v12;
      Swift::Int v15 = sub_100014060(v6[5]);
      uint64_t v16 = -1 << *((unsigned char *)v6 + 32);
      unint64_t v17 = v15 & ~v16;
      unint64_t v18 = v17 >> 6;
      uint64_t v19 = *(void *)&v10[8 * (v17 >> 6)];
      uint64_t v20 = 1 << v17;
      if (((1 << v17) & v19) != 0)
      {
        sub_100012710(0, a3);
        id v21 = *(id *)(v6[6] + 8 * v17);
        char v22 = sub_100014070();

        if (v22)
        {
LABEL_11:
          swift_unknownObjectRelease();
          goto LABEL_12;
        }
        uint64_t v23 = ~v16;
        while (1)
        {
          unint64_t v17 = (v17 + 1) & v23;
          unint64_t v18 = v17 >> 6;
          uint64_t v19 = *(void *)&v10[8 * (v17 >> 6)];
          uint64_t v20 = 1 << v17;
          if ((v19 & (1 << v17)) == 0) {
            break;
          }
          id v24 = *(id *)(v6[6] + 8 * v17);
          char v25 = sub_100014070();

          if (v25) {
            goto LABEL_11;
          }
        }
      }
      *(void *)&v10[8 * v18] = v20 | v19;
      *(void *)(v6[6] + 8 * v17) = v14;
      uint64_t v26 = v6[2];
      BOOL v13 = __OFADD__(v26, 1);
      uint64_t v27 = v26 + 1;
      if (v13) {
        goto LABEL_37;
      }
      v6[2] = v27;
LABEL_12:
      if (v11 == v46) {
        return;
      }
    }
  }
  uint64_t v28 = 0;
  uint64_t v44 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v28 != v44)
  {
    Swift::Int v29 = v6[5];
    id v30 = *(id *)(a1 + 32 + 8 * v28);
    Swift::Int v31 = sub_100014060(v29);
    uint64_t v32 = -1 << *((unsigned char *)v6 + 32);
    unint64_t v33 = v31 & ~v32;
    unint64_t v34 = v33 >> 6;
    uint64_t v35 = *(void *)&v10[8 * (v33 >> 6)];
    uint64_t v36 = 1 << v33;
    if (((1 << v33) & v35) != 0)
    {
      sub_100012710(0, a3);
      id v37 = *(id *)(v6[6] + 8 * v33);
      char v38 = sub_100014070();

      if (v38) {
        goto LABEL_23;
      }
      uint64_t v39 = ~v32;
      unint64_t v33 = (v33 + 1) & v39;
      unint64_t v34 = v33 >> 6;
      uint64_t v35 = *(void *)&v10[8 * (v33 >> 6)];
      uint64_t v36 = 1 << v33;
      if ((v35 & (1 << v33)) != 0)
      {
        while (1)
        {
          id v40 = *(id *)(v6[6] + 8 * v33);
          char v41 = sub_100014070();

          if (v41) {
            break;
          }
          unint64_t v33 = (v33 + 1) & v39;
          unint64_t v34 = v33 >> 6;
          uint64_t v35 = *(void *)&v10[8 * (v33 >> 6)];
          uint64_t v36 = 1 << v33;
          if ((v35 & (1 << v33)) == 0) {
            goto LABEL_31;
          }
        }
LABEL_23:

        uint64_t v8 = v46;
        goto LABEL_24;
      }
LABEL_31:
      uint64_t v8 = v46;
    }
    *(void *)&v10[8 * v34] = v36 | v35;
    *(void *)(v6[6] + 8 * v33) = v30;
    uint64_t v42 = v6[2];
    BOOL v13 = __OFADD__(v42, 1);
    uint64_t v43 = v42 + 1;
    if (v13) {
      goto LABEL_38;
    }
    v6[2] = v43;
LABEL_24:
    if (++v28 == v8) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

void sub_100011F74(uint64_t a1, void (*a2)(long long *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a2;
  v10[3] = a3;
  v10[4] = a4;
  v10[5] = a5;
  uint64_t v11 = *(void **)(a1 + 16);
  if (v11 && (uint64_t v12 = *(void **)(a1 + 24)) != 0)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = 0;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = 0;
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = 0;
    id v15 = objc_allocWithZone((Class)PKAsyncUnaryOperationComposer);
    swift_retain();
    swift_retain();
    id v16 = v11;
    id v17 = v12;
    id v18 = [v15 init];
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v16;
    *(void *)(v19 + 24) = v13;
    v35[0] = sub_100012554;
    v35[1] = v19;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v34 = sub_10000F500;
    *((void *)&v34 + 1) = &unk_100019308;
    uint64_t v20 = _Block_copy(&aBlock);
    id v21 = v16;
    swift_retain();
    swift_release();
    [v18 addOperation:v20];
    _Block_release(v20);
    char v22 = (void *)swift_allocObject();
    v22[2] = v13;
    v22[3] = v17;
    v22[4] = v14;
    v35[0] = sub_100012578;
    v35[1] = v22;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v34 = sub_10000F500;
    *((void *)&v34 + 1) = &unk_100019358;
    uint64_t v23 = _Block_copy(&aBlock);
    id v32 = v17;
    swift_retain();
    swift_retain();
    swift_release();
    [v18 addOperation:v23];
    _Block_release(v23);
    id v24 = (void *)swift_allocObject();
    v24[2] = v13;
    v24[3] = v21;
    v24[4] = v31;
    v35[0] = sub_1000125D0;
    v35[1] = v24;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v34 = sub_10000F500;
    *((void *)&v34 + 1) = &unk_1000193A8;
    char v25 = _Block_copy(&aBlock);
    id v26 = v21;
    swift_retain();
    swift_retain();
    swift_release();
    [v18 addOperation:v25];
    _Block_release(v25);
    id v27 = [objc_allocWithZone((Class)NSNull) init];
    uint64_t v28 = (void *)swift_allocObject();
    v28[2] = sub_100012498;
    v28[3] = v10;
    v28[4] = v13;
    v28[5] = v14;
    v28[6] = v31;
    v35[0] = sub_10001262C;
    v35[1] = v28;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v34 = sub_10000FBF4;
    *((void *)&v34 + 1) = &unk_1000193F8;
    Swift::Int v29 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    id v30 = [v18 evaluateWithInput:v27 completion:v29];
    _Block_release(v29);
    swift_release();

    swift_release();
    swift_release();
    swift_release();

    swift_unknownObjectRelease();
  }
  else
  {
    long long v34 = 0u;
    memset(v35, 0, 25);
    long long aBlock = 0u;
    swift_retain();
    swift_retain();
    a2(&aBlock);
    swift_release();
  }
}

uint64_t sub_100012458()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100012498(void *a1, void *a2, unint64_t a3)
{
  sub_10000E46C(a1, a2, a3, *(void (**)(long long *))(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40));
}

uint64_t sub_1000124A4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000124DC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100012514()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100012554(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  sub_10000F2F0(a1, a2, a3, a4, *(void **)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_10001255C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001256C()
{
  return swift_release();
}

void sub_100012578(uint64_t a1, void *a2, void (*a3)(void *, uint64_t), uint64_t a4)
{
  sub_10000F5D4(a1, a2, a3, a4, *(void *)(v4 + 16), *(void **)(v4 + 24), *(void *)(v4 + 32));
}

uint64_t sub_100012588()
{
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_1000125D0(uint64_t a1, void *a2, void (*a3)(void *, uint64_t), uint64_t a4)
{
  sub_10000F84C(a1, a2, a3, a4, *(void *)(v4 + 16), *(void **)(v4 + 24), *(void *)(v4 + 32));
}

uint64_t sub_1000125DC()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10001262C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000FB14(a1, a2, a3, *(void (**)(void *, void *, uint64_t))(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48));
}

uint64_t sub_100012640(uint64_t a1)
{
  return sub_10000F9DC(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t, void))(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_100012650(void *a1)
{
  return sub_10000F764(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t, void))(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_10001265C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100012694()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000126B4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000126FC(void *a1, uint64_t a2)
{
  return sub_10000F3F8(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(uint64_t, void))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_100012708()
{
  return swift_release();
}

uint64_t sub_100012710(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10001274C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100012710(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001279C()
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_1000127F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000EC48(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(void **)(v3 + 32), *(void **)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), *(void *)(v3 + 64), *(void *)(v3 + 72));
}

uint64_t sub_100012830()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_100012878(void *a1)
{
  sub_10000EE44(a1, *(id *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void (**)(long long *))(v1 + 40));
}

uint64_t sub_100012888(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1000128D8()
{
  unint64_t result = qword_10001CFD0;
  if (!qword_10001CFD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CFD0);
  }
  return result;
}

uint64_t sub_100012974()
{
  uint64_t v0 = sub_100005E60(&qword_10001CCB0);
  sub_100006394(v0, qword_10001D980);
  sub_1000063F8(v0, (uint64_t)qword_10001D980);
  v3._countAndFlagsBits = sub_100013FA0();
  sub_100013FC0(v3);
  swift_bridgeObjectRelease();
  sub_1000139D0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100012A34()
{
  uint64_t v0 = sub_100005E60(&qword_10001CCB0);
  sub_100006394(v0, qword_10001D998);
  sub_1000063F8(v0, (uint64_t)qword_10001D998);
  sub_100014140(27);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = sub_100013FA0();
  sub_100013FC0(v3);
  swift_bridgeObjectRelease();
  sub_1000139D0();

  return swift_bridgeObjectRelease();
}

id sub_100012D68()
{
  return sub_10001311C(type metadata accessor for ConfigurationIntent);
}

uint64_t type metadata accessor for ConfigurationIntent()
{
  return self;
}

BOOL sub_100012DA4(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100012DB8()
{
  Swift::UInt v1 = *v0;
  sub_1000141D0();
  sub_1000141E0(v1);
  return sub_1000141F0();
}

void sub_100012E00()
{
  sub_1000141E0(*v0);
}

Swift::Int sub_100012E2C()
{
  Swift::UInt v1 = *v0;
  sub_1000141D0();
  sub_1000141E0(v1);
  return sub_1000141F0();
}

unint64_t sub_100012E70@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_1000131E0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_100012EA4(void *a1@<X8>)
{
  *a1 = *v1;
}

id sub_100012FA8(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  return [super a3];
}

id sub_100013004(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_100013F70().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  id v3 = [super initWithPropertiesByName:v2.super.isa];

  if (v3) {
  return v3;
  }
}

id sub_100013104()
{
  return sub_10001311C(type metadata accessor for ConfigurationIntentResponse);
}

id sub_10001311C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for ConfigurationIntentResponse()
{
  return self;
}

ValueMetadata *type metadata accessor for ConfigurationIntentResponseCode()
{
  return &type metadata for ConfigurationIntentResponseCode;
}

unint64_t sub_10001318C()
{
  unint64_t result = qword_10001D030;
  if (!qword_10001D030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D030);
  }
  return result;
}

unint64_t sub_1000131E0(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

unint64_t sub_1000131F0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_1000134A8(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id sub_100013224(uint64_t a1)
{
  return sub_10001327C(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id sub_100013270(uint64_t a1)
{
  return sub_10001327C(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id sub_10001327C(uint64_t a1, SEL *a2)
{
  id v2 = [swift_getObjCClassFromMetadata() *a2 a1];

  return v2;
}

id sub_1000133E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PeriodResolutionResult();
  return [super dealloc];
}

uint64_t type metadata accessor for PeriodResolutionResult()
{
  return self;
}

ValueMetadata *type metadata accessor for Period()
{
  return &type metadata for Period;
}

unint64_t sub_100013454()
{
  unint64_t result = qword_10001D0C0;
  if (!qword_10001D0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D0C0);
  }
  return result;
}

unint64_t sub_1000134A8(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

uint64_t sub_1000134B8()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1000134EC()
{
  return sub_100013698(1);
}

uint64_t sub_1000134F4(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_10001D948 == -1)
  {
    if (qword_10001D950) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_10001D948, 0, (dispatch_function_t)sub_100013690);
    if (qword_10001D950) {
      return _availability_version_check();
    }
  }
  if (qword_10001D940 == -1)
  {
    BOOL v8 = dword_10001D930 < a2;
    if (dword_10001D930 > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_10001D940, 0, (dispatch_function_t)sub_1000134EC);
    BOOL v8 = dword_10001D930 < a2;
    if (dword_10001D930 > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_10001D934 > a3) {
    return 1;
  }
  return dword_10001D934 >= a3 && dword_10001D938 >= a4;
}

uint64_t sub_100013690()
{
  return sub_100013698(0);
}

uint64_t sub_100013698(uint64_t result)
{
  Swift::UInt v1 = (uint64_t (**)(void))qword_10001D950;
  if (qword_10001D950) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (&__availability_version_check)
    {
      Swift::UInt v1 = &__availability_version_check;
      qword_10001D950 = (uint64_t)&__availability_version_check;
    }
    if (!v1 || result != 0)
    {
      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        char v4 = *(unsigned __int8 **)result;
        unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          objc_super v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            objc_super v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    uint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        unint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          id v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            id v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            id v16 = malloc(v15);
                            if (v16)
                            {
                              id v26 = v16;
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
                                            sscanf(v29, "%d.%d.%d", &dword_10001D930, &dword_10001D934, &dword_10001D938);
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
                                id v16 = v26;
                              }
                              else
                              {
                                id v16 = v26;
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

uint64_t sub_1000139D0()
{
  return URL.init(string:)();
}

NSDate sub_1000139E0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_1000139F0()
{
  return static Date.now.getter();
}

uint64_t sub_100013A00()
{
  return Date.init()();
}

uint64_t sub_100013A10()
{
  return type metadata accessor for Date();
}

uint64_t sub_100013A20()
{
  return Locale.Region.identifier.getter();
}

uint64_t sub_100013A30()
{
  return type metadata accessor for Locale.Region();
}

uint64_t sub_100013A40()
{
  return static Locale.current.getter();
}

uint64_t sub_100013A50()
{
  return Locale.Language.region.getter();
}

uint64_t sub_100013A60()
{
  return type metadata accessor for Locale.Language();
}

uint64_t sub_100013A70()
{
  return Locale.language.getter();
}

uint64_t sub_100013A80()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100013A90()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t sub_100013AA0()
{
  return Calendar.init(identifier:)();
}

uint64_t sub_100013AB0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_100013AC0()
{
  return Calendar.component(_:from:)();
}

uint64_t sub_100013AD0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_100013AE0()
{
  return OrderTrackingWidget.init()();
}

uint64_t sub_100013AF0()
{
  return type metadata accessor for OrderTrackingWidget();
}

uint64_t sub_100013B00()
{
  return WalletCardsBalanceWidget.init()();
}

uint64_t sub_100013B10()
{
  return type metadata accessor for WalletCardsBalanceWidget();
}

uint64_t sub_100013B20()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100013B30()
{
  return Logger.logObject.getter();
}

uint64_t sub_100013B40()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100013B50()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100013B60()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100013B70()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100013B80()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100013B90()
{
  return TupleWidget.init(_:)();
}

uint64_t sub_100013BA0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100013BB0()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_100013BC0()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_100013BD0()
{
  return static ContentTransition.numericText(countsDown:)();
}

uint64_t sub_100013BE0()
{
  return type metadata accessor for ContentTransition();
}

uint64_t sub_100013BF0()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100013C00()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_100013C10()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_100013C20()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_100013C30()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_100013C40()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100013C50()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_100013C60()
{
  return EnvironmentValues.contentTransition.setter();
}

uint64_t sub_100013C70()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_100013C80()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_100013C90()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_100013CA0()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100013CB0()
{
  return type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey();
}

uint64_t sub_100013CC0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_100013CD0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_100013CE0()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_100013CF0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100013D00()
{
  return LocalizedStringKey.init(_:)();
}

uint64_t sub_100013D10()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_100013D20()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_100013D30()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_100013D40()
{
  return WidgetConfiguration._contentMarginsDisabled()();
}

uint64_t sub_100013D50()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_100013D60()
{
  return WidgetConfiguration.visibilityConfigurableByInternalSettings(visibleByDefault:)();
}

uint64_t sub_100013D70()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100013D80()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_100013D90()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_100013DA0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_100013DB0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100013DC0()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_100013DD0()
{
  return static Font.footnote.getter();
}

uint64_t sub_100013DE0()
{
  return Font.init(_:)();
}

uint64_t sub_100013DF0()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_100013E00()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_100013E10()
{
  return Text.font(_:)();
}

uint64_t sub_100013E20()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100013E30()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100013E40()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_100013E50()
{
  return View.widgetURL(_:)();
}

uint64_t sub_100013E60()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100013E70()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100013E80()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100013E90()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_100013EA0()
{
  return static Color.clear.getter();
}

uint64_t sub_100013EB0()
{
  return static Color.secondary.getter();
}

uint64_t sub_100013EC0()
{
  return Image.init(uiImage:)();
}

uint64_t sub_100013ED0()
{
  return static Alignment.center.getter();
}

uint64_t sub_100013EE0()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_100013EF0()
{
  return TimelineEntry.relevance.getter();
}

uint64_t sub_100013F00()
{
  return IntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_100013F10()
{
  return static TimelineReloadPolicy.never.getter();
}

uint64_t sub_100013F20()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_100013F40()
{
  return IntentTimelineProvider.recommendations()();
}

uint64_t sub_100013F60()
{
  return Timeline.init(entries:policy:)();
}

NSDictionary sub_100013F70()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100013F80()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_100013F90()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100013FA0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013FB0()
{
  return String.init(format:_:)();
}

void sub_100013FC0(Swift::String a1)
{
}

uint64_t sub_100013FD0()
{
  return String.init(cString:)();
}

Swift::Int sub_100013FE0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100013FF0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100014000()
{
  return specialized Array._endMutation()();
}

NSSet sub_100014010()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_100014020()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100014030()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_100014040()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100014050()
{
  return static os_log_type_t.default.getter();
}

Swift::Int sub_100014060(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100014070()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100014080()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100014090()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000140A0()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t sub_1000140B0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_1000140C0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_1000140D0()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_1000140E0()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_1000140F0()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100014100()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100014110()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100014120()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100014130()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100014140(Swift::Int a1)
{
}

uint64_t sub_100014150()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100014160()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100014170()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100014180()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100014190()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000141A0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000141B0()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_1000141C0()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000141D0()
{
  return Hasher.init(_seed:)();
}

void sub_1000141E0(Swift::UInt a1)
{
}

Swift::Int sub_1000141F0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t PDDeviceSpecificLocalizedStringKeyForKey()
{
  return _PDDeviceSpecificLocalizedStringKeyForKey();
}

uint64_t PKCurrencyAmountMake()
{
  return _PKCurrencyAmountMake();
}

uint64_t PKCurrentUserAltDSID()
{
  return _PKCurrentUserAltDSID();
}

uint64_t PKGregorianMonthSpecificLocalizedStringKeyForKey()
{
  return _PKGregorianMonthSpecificLocalizedStringKeyForKey();
}

uint64_t PKIsPad()
{
  return _PKIsPad();
}

uint64_t PKLogFacilityTypeGetName()
{
  return _PKLogFacilityTypeGetName();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t PKFontForDesign()
{
  return PKFontForDesign();
}

uint64_t PKLocalizedFeatureString()
{
  return PKLocalizedFeatureString();
}

uint64_t PKLocalizedMadisonString(NSString *a1)
{
  return PKLocalizedMadisonString(a1);
}

uint64_t PKLocalizedPaymentString(NSString *a1)
{
  return PKLocalizedPaymentString(a1);
}

uint64_t _availability_version_check()
{
  return __availability_version_check();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
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

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}