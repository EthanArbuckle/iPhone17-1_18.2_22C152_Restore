uint64_t sub_1000B3FC8()
{
  uint64_t v0;

  return sub_1000A8A64(*(void *)(v0 + 16));
}

uint64_t sub_1000B3FD4()
{
  v1 = (int *)type metadata accessor for ExportDatasetView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v12 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v4 = v0 + v3;

  if (*(void *)(v0 + v3 + 8)) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v4 + v1[7];
  uint64_t v6 = type metadata accessor for Date();
  v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  sub_1000A4F9C(0, &qword_100107EA8, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  swift_release();
  v7(v4 + v1[8], v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v8 = v4 + v1[12];
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  sub_1000A4F9C(0, &qword_100107EB0, (uint64_t (*)(uint64_t))sub_1000A4F68, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  swift_release();

  return _swift_deallocObject(v0, v3 + v12, v2 | 7);
}

uint64_t sub_1000B4278()
{
  uint64_t v1 = type metadata accessor for ExportDatasetView(0);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t result = v1 - 8;
  uint64_t v4 = *(uint64_t (**)(void))(v0
                           + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
                           + 8);
  if (v4) {
    return v4();
  }
  return result;
}

uint64_t sub_1000B42E4@<X0>(char *a1@<X8>)
{
  return sub_1000A631C(*(void *)(v1 + 16), a1);
}

unint64_t sub_1000B42EC()
{
  unint64_t result = qword_100108110;
  if (!qword_100108110)
  {
    sub_1000A4F9C(255, &qword_100107FB8, (uint64_t (*)(uint64_t))sub_1000B2E28, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100108110);
  }
  return result;
}

uint64_t sub_1000B4374@<X0>(char *a1@<X8>)
{
  return sub_1000A7010(*(void *)(v1 + 16), a1);
}

unint64_t sub_1000B437C()
{
  unint64_t result = qword_100108118;
  if (!qword_100108118)
  {
    sub_1000A4F9C(255, &qword_100108038, (uint64_t (*)(uint64_t))sub_1000B3300, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100108118);
  }
  return result;
}

uint64_t sub_1000B4404@<X0>(uint64_t a1@<X8>)
{
  return sub_1000A75A4(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000B440C(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    sub_1000B5D38(&qword_100108018, (void (*)(uint64_t))sub_1000B304C);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000B44C4()
{
  return sub_1000A79DC();
}

uint64_t sub_1000B4528()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_1000B4538(unsigned char *a1)
{
  return sub_100079DC0(a1, *(unsigned char *)(v1 + 16));
}

uint64_t type metadata accessor for SampleExporter(uint64_t a1)
{
  return sub_1000172F0(a1, qword_1001081D0);
}

uint64_t sub_1000B4560()
{
  uint64_t v1 = (int *)type metadata accessor for ExportDatasetView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v19 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v3 = (int *)type metadata accessor for SampleExporter(0);
  uint64_t v4 = *(unsigned __int8 *)(*((void *)v3 - 1) + 80);
  uint64_t v18 = *(void *)(*((void *)v3 - 1) + 64);
  swift_unknownObjectRelease();
  uint64_t v20 = v0;
  uint64_t v5 = v0 + ((v2 + 32) & ~v2);

  if (*(void *)(v5 + 8)) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v6 = v5 + v1[7];
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  sub_1000A4F9C(0, &qword_100107EA8, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  swift_release();
  v8(v5 + v1[8], v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v9 = v5 + v1[12];
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  uint64_t v12 = (((v2 + 32) & ~v2) + v19 + v4) & ~v4;
  uint64_t v13 = v12 + v18;
  sub_1000A4F9C(0, &qword_100107EB0, (uint64_t (*)(uint64_t))sub_1000A4F68, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  swift_release();
  uint64_t v14 = v20 + v12;
  swift_bridgeObjectRelease();
  uint64_t v15 = v14 + v3[5];
  uint64_t v16 = type metadata accessor for DateInterval();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);

  return _swift_deallocObject(v20, v13, v2 | v4 | 7);
}

uint64_t sub_1000B48E0(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for ExportDatasetView(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  type metadata accessor for SampleExporter(0);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100028DB8;
  return sub_1000A92A4(a1, v6, v7, v1 + v5);
}

void sub_1000B4A34(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_10001E254(255, (unint64_t *)&unk_100106AD0);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1000B4AA4()
{
  return sub_1000AAA60();
}

void sub_1000B4AC4()
{
  if (!qword_100108140)
  {
    sub_1000B4A34(255, &qword_100108148, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for HKSamplePredicate);
    unint64_t v0 = type metadata accessor for _ContiguousArrayStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100108140);
    }
  }
}

unint64_t sub_1000B4B38()
{
  unint64_t result = qword_100108170;
  if (!qword_100108170)
  {
    sub_1000A4F9C(255, &qword_100108168, (uint64_t (*)(uint64_t))&type metadata accessor for DatePickerComponents, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100108170);
  }
  return result;
}

uint64_t sub_1000B4BC4()
{
  type metadata accessor for ExportDatasetView(0);

  return sub_1000A68A8();
}

uint64_t sub_1000B4C48()
{
  type metadata accessor for ExportDatasetView(0);

  return sub_1000A6F48();
}

uint64_t sub_1000B4CA8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000A6B24(*(void *)(v1 + 16), *(void **)(v1 + 24), *(unsigned char *)(v1 + 32), a1);
}

uint64_t sub_1000B4CB4()
{
  uint64_t v1 = (int *)type metadata accessor for ExportDatasetView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v13 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v4 = v0 + v3;

  if (*(void *)(v0 + v3 + 8)) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v4 + v1[7];
  uint64_t v6 = type metadata accessor for Date();
  unint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  sub_1000A4F9C(0, &qword_100107EA8, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  swift_release();
  v7(v4 + v1[8], v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v8 = v4 + v1[12];
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  unint64_t v11 = (v13 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_1000A4F9C(0, &qword_100107EB0, (uint64_t (*)(uint64_t))sub_1000A4F68, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  swift_release();

  return _swift_deallocObject(v0, v11 + 9, v2 | 7);
}

uint64_t sub_1000B4F6C()
{
  uint64_t v1 = *(void *)(type metadata accessor for ExportDatasetView(0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v0 + v2;
  uint64_t v4 = v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = *(void *)v4;
  char v6 = *(unsigned char *)(v4 + 8);

  return sub_1000A6DFC(v3, v5, v6);
}

uint64_t sub_1000B5000@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000B502C()
{
  return EnvironmentValues.tint.setter();
}

void sub_1000B5058(id a1, char a2)
{
  if (a2 != -1) {
}
  }

unint64_t sub_1000B506C(unint64_t result, uint64_t a2, unint64_t a3)
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

uint64_t *sub_1000B511C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    unint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for DateInterval();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = *(void **)((char *)a2 + v13);
    *(uint64_t *)((char *)v7 + v13) = (uint64_t)v15;
    uint64_t v16 = *(void **)((char *)a2 + v14);
    *(uint64_t *)((char *)v7 + v14) = (uint64_t)v16;
    id v17 = v15;
    id v18 = v16;
  }
  return v7;
}

void sub_1000B522C(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = type metadata accessor for DateInterval();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  char v6 = *(void **)(a1 + a2[7]);
}

void *sub_1000B52C4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for DateInterval();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = *(void **)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = v13;
  uint64_t v14 = *(void **)((char *)a2 + v12);
  *(void *)((char *)a1 + v12) = v14;
  id v15 = v13;
  id v16 = v14;
  return a1;
}

void *sub_1000B5388(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for DateInterval();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = *(void **)((char *)a2 + v10);
  uint64_t v12 = *(void **)((char *)a1 + v10);
  *(void *)((char *)a1 + v10) = v11;
  id v13 = v11;

  uint64_t v14 = a3[7];
  id v15 = *(void **)((char *)a2 + v14);
  id v16 = *(void **)((char *)a1 + v14);
  *(void *)((char *)a1 + v14) = v15;
  id v17 = v15;

  return a1;
}

void *sub_1000B5454(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for DateInterval();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  return a1;
}

void *sub_1000B54F4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for DateInterval();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = *(void **)((char *)a1 + v10);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);

  uint64_t v12 = a3[7];
  id v13 = *(void **)((char *)a1 + v12);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);

  return a1;
}

uint64_t sub_1000B55B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000B55C4);
}

uint64_t sub_1000B55C4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for DateInterval();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000B5674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000B5688);
}

void *sub_1000B5688(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for DateInterval();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1000B5730()
{
  uint64_t result = type metadata accessor for DateInterval();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000B57DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 64);
}

uint64_t sub_1000B57E4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000B5880(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  uint64_t v11 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v11;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000B598C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_retain();
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 sub_1000B5B24(uint64_t a1, uint64_t a2)
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

uint64_t sub_1000B5B58(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000B5C48(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 136)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1000B5C90(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 136) = 1;
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
    *(unsigned char *)(result + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1000B5CF0()
{
  return sub_1000B5D38(&qword_100108290, (void (*)(uint64_t))sub_1000B5D80);
}

uint64_t sub_1000B5D38(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1000B5D80()
{
  if (!qword_100108298)
  {
    sub_1000B284C();
    sub_1000B2A5C();
    sub_1000B3AF8();
    sub_1000B2BD0();
    sub_1000A4F9C(255, &qword_100108070, (uint64_t (*)(uint64_t))sub_1000B352C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleToolbarContent);
    sub_1000B3740(255, &qword_100107F90, (void (*)(uint64_t))sub_1000B2CC4, (void (*)(void))sub_1000B34F8);
    sub_1000B2CC4();
    sub_1000B34F8();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_1000B3A70();
    swift_getOpaqueTypeConformance2();
    sub_1000B3B98(255, &qword_1001080E0, (uint64_t (*)(uint64_t, void *))type metadata accessor for SearchableListView);
    sub_1000B3C3C();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t v0 = type metadata accessor for NavigationView();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100108298);
    }
  }
}

uint64_t sub_1000B5FB0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1000B5FF4(uint64_t a1)
{
}

void sub_1000B6028(uint64_t a1)
{
}

void sub_1000B605C()
{
  if (!qword_1001082C0)
  {
    sub_1000B35DC();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1001082C0);
    }
  }
}

unint64_t sub_1000B60C0()
{
  unint64_t result = qword_1001082C8;
  if (!qword_1001082C8)
  {
    sub_1000A4F9C(255, &qword_1001082A0, (uint64_t (*)(uint64_t))sub_1000B5FF4, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _EnvironmentKeyWritingModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001082C8);
  }
  return result;
}

unint64_t sub_1000B6148()
{
  unint64_t result = qword_1001082D0;
  if (!qword_1001082D0)
  {
    sub_1000A4F9C(255, &qword_1001082B8, (uint64_t (*)(uint64_t))sub_1000B605C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleToolbarContent);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001082D0);
  }
  return result;
}

uint64_t sub_1000B61D0()
{
  return sub_1000B6200((uint64_t (*)(void, void, void, void, void))sub_1000AB81C);
}

uint64_t sub_1000B61E8()
{
  return sub_1000B6200((uint64_t (*)(void, void, void, void, void))sub_1000AC6F0);
}

uint64_t sub_1000B6200(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1000B6218()
{
  return EnvironmentValues.editMode.getter();
}

uint64_t sub_1000B6240()
{
  return sub_1000B6200((uint64_t (*)(void, void, void, void, void))sub_1000AE5DC);
}

uint64_t sub_1000B6258()
{
  return sub_1000B628C();
}

uint64_t sub_1000B628C()
{
  return sub_1000AEA00(v0[6], v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1000B62BC()
{
  return sub_1000B628C();
}

uint64_t sub_1000B62F4()
{
  long long v1 = *(_OWORD *)(v0 + 32);
  v3[0] = *(_OWORD *)(v0 + 16);
  v3[1] = v1;
  type metadata accessor for SearchableListView(0, (uint64_t)v3);
  return sub_1000AE938(1);
}

uint64_t sub_1000B6340(uint64_t a1)
{
  return a1;
}

void sub_1000B6424(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1000B6474()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 184, 7);
}

uint64_t sub_1000B6514()
{
  return sub_1000AE8AC((uint64_t)(v0 + 6), v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1000B6524()
{
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000B6534@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  return sub_1000AD9B8(a1, v2[2], v2[3], v2[4], v2[5], a2);
}

uint64_t sub_1000B6540()
{
  return sub_1000B6200((uint64_t (*)(void, void, void, void, void))sub_1000AD13C);
}

uint64_t sub_1000B6558()
{
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000B6568@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_1000AE214(a1, *(void *)(v2 + 16), *(void *)(v2 + 32), a2);
}

uint64_t sub_1000B6588()
{
  return sub_1000AAF50() & 1;
}

uint64_t sub_1000B65B0@<X0>(char *a1@<X8>)
{
  return sub_1000ADE30(v1[6], v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_1000B65C0()
{
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000B65D0(long long *a1)
{
  uint64_t v1 = *((void *)a1 + 2);
  unint64_t v2 = *((void *)a1 + 3);
  long long v24 = *a1;
  type metadata accessor for Array();
  swift_getAssociatedTypeWitness();
  type metadata accessor for TagValueTraitKey();
  swift_getWitnessTable();
  type metadata accessor for _TraitWritingModifier();
  type metadata accessor for ModifiedContent();
  type metadata accessor for Optional();
  uint64_t v29 = v1;
  uint64_t v23 = v1;
  swift_getWitnessTable();
  type metadata accessor for TagValueTraitKey();
  swift_getWitnessTable();
  type metadata accessor for _TraitWritingModifier();
  type metadata accessor for ModifiedContent();
  swift_getWitnessTable();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for ForEach();
  type metadata accessor for Section();
  long long v25 = v24;
  uint64_t v26 = v1;
  unint64_t v27 = v2;
  type metadata accessor for SearchableListSection(255, (uint64_t)&v25);
  uint64_t v3 = type metadata accessor for Array();
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = type metadata accessor for Section();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = sub_1000B5D38(&qword_100107F68, (void (*)(uint64_t))&type metadata accessor for UUID);
  *(void *)&long long v25 = v3;
  *((void *)&v25 + 1) = v4;
  uint64_t v26 = v5;
  unint64_t v27 = WitnessTable;
  uint64_t AssociatedConformanceWitness = v7;
  type metadata accessor for ForEach();
  uint64_t v8 = type metadata accessor for _ConditionalContent();
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v9 = swift_getWitnessTable();
  *(void *)&long long v25 = v24;
  *((void *)&v25 + 1) = v8;
  uint64_t v26 = v23;
  unint64_t v27 = v9;
  uint64_t v10 = type metadata accessor for List();
  uint64_t v11 = swift_getWitnessTable();
  unint64_t v12 = sub_100038AD4();
  *(void *)&long long v25 = v10;
  *((void *)&v25 + 1) = &type metadata for String;
  uint64_t v26 = v11;
  unint64_t v27 = v12;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  *(void *)&long long v25 = v10;
  *((void *)&v25 + 1) = &type metadata for String;
  uint64_t v26 = v11;
  unint64_t v27 = v12;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(void *)&long long v25 = OpaqueTypeMetadata2;
  *((void *)&v25 + 1) = OpaqueTypeConformance2;
  swift_getOpaqueTypeMetadata2();
  sub_1000A4F9C(255, &qword_1001082A0, (uint64_t (*)(uint64_t))sub_1000B5FF4, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _EnvironmentKeyWritingModifier);
  uint64_t v15 = type metadata accessor for ModifiedContent();
  sub_1000A4F9C(255, &qword_1001082B8, (uint64_t (*)(uint64_t))sub_1000B605C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TupleToolbarContent);
  uint64_t v17 = v16;
  *(void *)&long long v25 = OpaqueTypeMetadata2;
  *((void *)&v25 + 1) = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_1000B60C0();
  uint64_t v18 = swift_getWitnessTable();
  unint64_t v19 = sub_1000B6148();
  *(void *)&long long v25 = v15;
  *((void *)&v25 + 1) = v17;
  uint64_t v26 = v18;
  unint64_t v27 = v19;
  uint64_t v20 = swift_getOpaqueTypeMetadata2();
  *(void *)&long long v25 = v15;
  *((void *)&v25 + 1) = v17;
  uint64_t v26 = v18;
  unint64_t v27 = v19;
  uint64_t v21 = swift_getOpaqueTypeConformance2();
  *(void *)&long long v25 = v20;
  *((void *)&v25 + 1) = v21;
  swift_getOpaqueTypeMetadata2();
  *(void *)&long long v25 = v20;
  *((void *)&v25 + 1) = v21;
  swift_getOpaqueTypeConformance2();
  type metadata accessor for NavigationView();
  return swift_getWitnessTable();
}

id sub_1000B6DAC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityIndicatorTitleView();
  return [super dealloc];
}

uint64_t type metadata accessor for ActivityIndicatorTitleView()
{
  return self;
}

ValueMetadata *type metadata accessor for NotificationAuthorizationSupport()
{
  return &type metadata for NotificationAuthorizationSupport;
}

uint64_t sub_1000B6E68(uint64_t a1)
{
  sub_100020A4C(0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v20 - v10;
  id v12 = [objc_allocWithZone((Class)NSISO8601DateFormatter) init];
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = [v12 dateFromString:v13];

  if (!v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_5;
  }
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v15(v4, v9, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_5:

    sub_1000209C0((uint64_t)v4);
    swift_bridgeObjectRetain();
    return a1;
  }
  v15(v11, v4, v5);
  id v16 = [objc_allocWithZone((Class)NSDateFormatter) init];
  [v16 setDateStyle:1];
  [v16 setTimeStyle:1];
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v18 = [v16 stringFromDate:isa];

  a1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return a1;
}

unint64_t HKDisplayCategoryIdentifier.uniqueIdentifier.getter()
{
  v0._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  return 0xD00000000000001CLL;
}

uint64_t sub_1000B71CC()
{
  uint64_t v70 = type metadata accessor for SectionedDataSourceContainerViewType();
  uint64_t v0 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  v69 = (char *)v45 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B84C8(0, &qword_100104850, (uint64_t (*)(uint64_t))&type metadata accessor for UIBackgroundConfiguration, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v2 - 8);
  v68 = (char *)v45 - v3;
  uint64_t v67 = type metadata accessor for CellDeselectionBehavior();
  uint64_t v4 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  v66 = (char *)v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B84C8(0, &qword_100104AB8, (uint64_t (*)(uint64_t))&type metadata accessor for UICellAccessory.LayoutDimension, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v6 - 8);
  v65 = (char *)v45 - v7;
  uint64_t v64 = type metadata accessor for UICellAccessory.DisclosureIndicatorOptions();
  uint64_t v8 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  v63 = (char *)v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = type metadata accessor for UICellAccessory.DisplayedState();
  uint64_t v10 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  v61 = (char *)v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  v71 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for ContentConfigurationItem();
  uint64_t v14 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  id v16 = (char *)v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = 24;
  v45[0] = v12;
  v78 = _swiftEmptyArrayStorage;
  sub_100096494(0, 24, 0);
  id v58 = self;
  v57 = (void (**)(char *, uint64_t))(v12 + 8);
  unsigned int v56 = enum case for UICellAccessory.DisplayedState.always(_:);
  v55 = (void (**)(char *, void, uint64_t))(v10 + 104);
  v54 = (void (**)(char *, uint64_t))(v8 + 8);
  v53 = (void (**)(char *, uint64_t))(v10 + 8);
  unsigned int v52 = enum case for CellDeselectionBehavior.default(_:);
  v51 = (void (**)(char *, void, uint64_t))(v4 + 104);
  unsigned int v50 = enum case for SectionedDataSourceContainerViewType.collectionView(_:);
  v49 = (void (**)(char *, void, uint64_t))(v0 + 104);
  uint64_t v48 = v14 + 32;
  id v18 = &qword_1000F48E8;
  unint64_t v47 = 0x80000001000D8030;
  long long v46 = xmmword_1000CBFD0;
  uint64_t v59 = v14;
  do
  {
    uint64_t v19 = *v18;
    v75 = v18 + 1;
    sub_1000B7DB0(v19);
    *(void *)(swift_allocObject() + 16) = v19;
    uint64_t v20 = v71;
    UUID.init()();
    uint64_t v21 = UUID.uuidString.getter();
    uint64_t v73 = v22;
    uint64_t v74 = v21;
    (*v57)(v20, v72);
    v77[3] = type metadata accessor for UIListContentConfiguration();
    v77[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
    sub_100004F38(v77);
    static UIListContentConfiguration.cell()();
    swift_bridgeObjectRetain();
    UIListContentConfiguration.text.setter();
    id v23 = [v58 blackColor];
    long long v24 = (void (*)(char *, void))UIListContentConfiguration.textProperties.modify();
    UIListContentConfiguration.TextProperties.color.setter();
    v24(v76, 0);
    sub_1000B84C8(0, &qword_100104AC0, (uint64_t (*)(uint64_t))&type metadata accessor for UICellAccessory, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    type metadata accessor for UICellAccessory();
    *(_OWORD *)(swift_allocObject() + 16) = v46;
    long long v25 = v16;
    uint64_t v26 = v61;
    uint64_t v27 = v62;
    (*v55)(v61, v56, v62);
    uint64_t v28 = type metadata accessor for UICellAccessory.LayoutDimension();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v65, 1, 1, v28);
    uint64_t v29 = v63;
    UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)();
    static UICellAccessory.disclosureIndicator(displayed:options:)();
    (*v54)(v29, v64);
    v30 = v26;
    id v16 = v25;
    (*v53)(v30, v27);
    (*v51)(v66, v52, v67);
    swift_retain();
    swift_bridgeObjectRelease();
    uint64_t v31 = type metadata accessor for UIBackgroundConfiguration();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v68, 1, 1, v31);
    (*v49)(v69, v50, v70);
    ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)();
    swift_release();
    uint64_t v32 = (uint64_t)v78;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_100096494(0, *(void *)(v32 + 16) + 1, 1);
      uint64_t v32 = (uint64_t)v78;
    }
    unint64_t v34 = *(void *)(v32 + 16);
    unint64_t v33 = *(void *)(v32 + 24);
    uint64_t v35 = v59;
    if (v34 >= v33 >> 1)
    {
      sub_100096494(v33 > 1, v34 + 1, 1);
      uint64_t v32 = (uint64_t)v78;
    }
    *(void *)(v32 + 16) = v34 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v35 + 32))(v32+ ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))+ *(void *)(v35 + 72) * v34, v25, v60);
    v78 = (void *)v32;
    --v17;
    id v18 = v75;
  }
  while (v17);
  sub_1000B84C8(0, &qword_100104858, (uint64_t (*)(uint64_t))&type metadata accessor for ArrayDataSourceSection, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  type metadata accessor for ArrayDataSourceSection();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000CBFD0;
  sub_1000B870C(v32);
  swift_bridgeObjectRelease();
  v36 = v71;
  UUID.init()();
  UUID.uuidString.getter();
  v37 = *(void (**)(char *, uint64_t))(v45[0] + 8);
  uint64_t v38 = v72;
  v37(v36, v72);
  ArrayDataSourceSection.init(title:arrangedItems:identifier:)();
  v77[0] = 0x3C53447961727241;
  v77[1] = 0xE800000000000000;
  UUID.init()();
  uint64_t v39 = UUID.uuidString.getter();
  v41 = v40;
  v37(v36, v38);
  v42._countAndFlagsBits = v39;
  v42._object = v41;
  String.append(_:)(v42);
  swift_bridgeObjectRelease();
  v43._countAndFlagsBits = 62;
  v43._object = (void *)0xE100000000000000;
  String.append(_:)(v43);
  return ArrayDataSource.init(arrangedSections:identifier:)();
}

_UNKNOWN **static HKDisplayCategoryIdentifier.allCases.getter()
{
  return &off_1000F48C8;
}

unint64_t sub_1000B7D28()
{
  unint64_t result = qword_100108318;
  if (!qword_100108318)
  {
    sub_1000B84C8(255, &qword_100108320, (uint64_t (*)(uint64_t))type metadata accessor for HKDisplayCategoryIdentifier, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100108318);
  }
  return result;
}

unint64_t sub_1000B7DB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (id)HKDisplayCategoryIdentifierToString();
  if (!v6)
  {
    static Logger.dataSource.getter();
    id v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v22 = a1;
      uint64_t v23 = v19;
      *(_DWORD *)id v18 = 136315138;
      type metadata accessor for HKDisplayCategoryIdentifier(0);
      uint64_t v20 = String.init<A>(describing:)();
      uint64_t v22 = sub_100018DA0(v20, v21, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[Internal Settings] Could not get category name for %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  v11._countAndFlagsBits = 0xD00000000000001BLL;
  v11._object = (void *)0x80000001000D8050;
  if (!String.hasPrefix(_:)(v11)) {
    return v8;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = String.count.getter();
  swift_bridgeObjectRelease();
  uint64_t v13 = String.count.getter();
  BOOL v14 = __OFSUB__(v12, v13);
  unint64_t result = v12 - v13;
  if (!v14)
  {
    sub_1000B852C(result, v8, v10);
    swift_bridgeObjectRelease();
    uint64_t v8 = static String._fromSubstring(_:)();
    swift_bridgeObjectRelease();
    return v8;
  }
  __break(1u);
  return result;
}

id sub_1000B807C(void *a1)
{
  uint64_t v2 = type metadata accessor for HKTypeGroup();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v14[-v7];
  id result = [a1 resolvedHealthStore];
  if (result)
  {
    unint64_t v10 = result;
    static HKTypeGroup.typeGroup(for:)();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 16))(v6, v8, v2);
    id v11 = v10;
    UIViewController.resolvedHealthExperienceStore.getter();
    UIViewController.resolvedPinnedContentManager.getter();
    id v12 = objc_allocWithZone((Class)type metadata accessor for CategoryViewController());
    uint64_t v13 = (void *)CategoryViewController.init(typeGroup:healthStore:healthExperienceStore:pinnedContentManager:)();
    [a1 showViewController:v13 sender:0];

    return (id)(*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v8, v2);
  }
  return result;
}

void sub_1000B8220()
{
}

void sub_1000B823C()
{
}

void sub_1000B8258()
{
}

unint64_t sub_1000B8284@<X0>(uint64_t *a1@<X8>)
{
  return sub_10002BFF4(a1);
}

uint64_t sub_1000B8300(uint64_t a1, uint64_t a2)
{
  return sub_10002B8D0(a1, a2);
}

void sub_1000B8360(void *a1@<X8>)
{
  *a1 = &off_1000F48C8;
}

uint64_t type metadata accessor for CategoryDataSource()
{
  uint64_t result = qword_100108328;
  if (!qword_100108328) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000B83BC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000B83FC()
{
  return type metadata accessor for CategoryDataSource();
}

uint64_t sub_1000B8404(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1000B846C(&qword_100108378);
  uint64_t result = sub_1000B846C(&qword_100108380);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_1000B846C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CategoryDataSource();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000B84B0()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_1000B84C0(void *a1)
{
  return sub_1000B807C(a1);
}

void sub_1000B84C8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_1000B852C(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t result = String.index(_:offsetBy:limitedBy:)();
  if (v4) {
    uint64_t result = 15;
  }
  if (4 * v3 < result >> 14) {
    goto LABEL_12;
  }

  return String.subscript.getter();
}

void sub_1000B85E8(void *a1)
{
  swift_getObjectType();
  id v4 = (id)dispatch thunk of PluginInternalSettingsProviding.makeInternalSettingsViewController()();
  id v2 = [a1 navigationController];
  if (v2)
  {
    uint64_t v3 = v2;
    [v2 pushViewController:v4 animated:1];
  }
}

uint64_t type metadata accessor for ContentKindDataSource()
{
  uint64_t result = qword_100108388;
  if (!qword_100108388) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000B86CC()
{
  return swift_initClassMetadata2();
}

void *sub_1000B870C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ContentConfigurationItem();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = _swiftEmptyArrayStorage;
  if (v6)
  {
    uint64_t v22 = _swiftEmptyArrayStorage;
    sub_1000964E4(0, v6, 0);
    uint64_t v7 = v22;
    unint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v8 = v3 + 16;
    uint64_t v9 = v10;
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64));
    uint64_t v18 = *(void *)(v8 + 56);
    do
    {
      v9(v5, v11, v2);
      uint64_t v22 = v7;
      unint64_t v13 = v7[2];
      unint64_t v12 = v7[3];
      if (v13 >= v12 >> 1) {
        sub_1000964E4(v12 > 1, v13 + 1, 1);
      }
      uint64_t v20 = v2;
      uint64_t v21 = sub_1000B9E78(&qword_100104870, (void (*)(uint64_t))&type metadata accessor for ContentConfigurationItem);
      BOOL v14 = sub_100004F38((uint64_t *)&v19);
      v9((char *)v14, (uint64_t)v5, v2);
      uint64_t v15 = v22;
      v22[2] = v13 + 1;
      sub_10001CD68(&v19, (uint64_t)&v15[5 * v13 + 4]);
      (*(void (**)(char *, uint64_t))(v8 - 8))(v5, v2);
      uint64_t v7 = v22;
      v11 += v18;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_1000B8908(unint64_t a1)
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
  uint64_t v3 = _swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  id v16 = _swiftEmptyArrayStorage;
  uint64_t result = sub_1000964E4(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = v16;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      do
      {
        uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        id v16 = v3;
        unint64_t v8 = v3[2];
        unint64_t v7 = v3[3];
        if (v8 >= v7 >> 1)
        {
          sub_1000964E4(v7 > 1, v8 + 1, 1);
          uint64_t v3 = v16;
        }
        ++v5;
        uint64_t v14 = type metadata accessor for SidebarDataSourceItem();
        uint64_t v15 = sub_1000B9E78(&qword_1001083E8, (void (*)(uint64_t))&type metadata accessor for SidebarDataSourceItem);
        *(void *)&long long v13 = v6;
        _OWORD v3[2] = v8 + 1;
        sub_10001CD68(&v13, (uint64_t)&v3[5 * v8 + 4]);
      }
      while (v2 != v5);
    }
    else
    {
      uint64_t v9 = (uint64_t *)(a1 + 32);
      do
      {
        uint64_t v10 = *v9;
        id v16 = v3;
        unint64_t v11 = v3[2];
        unint64_t v12 = v3[3];
        swift_retain();
        if (v11 >= v12 >> 1)
        {
          sub_1000964E4(v12 > 1, v11 + 1, 1);
          uint64_t v3 = v16;
        }
        uint64_t v14 = type metadata accessor for SidebarDataSourceItem();
        uint64_t v15 = sub_1000B9E78(&qword_1001083E8, (void (*)(uint64_t))&type metadata accessor for SidebarDataSourceItem);
        *(void *)&long long v13 = v10;
        _OWORD v3[2] = v11 + 1;
        sub_10001CD68(&v13, (uint64_t)&v3[5 * v11 + 4]);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

void *sub_1000B8B3C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100096574(0, v1, 0);
    uint64_t v3 = a1 + 32;
    sub_1000B9E30(0, (unint64_t *)&qword_1001063F0, (uint64_t (*)(uint64_t))&type metadata accessor for UITraitHorizontalSizeClass, (uint64_t (*)(uint64_t))&_swift_getMetatypeMetadata);
    sub_1000B9E30(0, (unint64_t *)&qword_1001051F0, (uint64_t (*)(uint64_t))sub_10003742C, (uint64_t (*)(uint64_t))&_swift_getExistentialMetatypeMetadata);
    do
    {
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100096574(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v5 = _swiftEmptyArrayStorage[2];
      unint64_t v4 = _swiftEmptyArrayStorage[3];
      if (v5 >= v4 >> 1) {
        sub_100096574(v4 > 1, v5 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v5 + 1;
      *(_OWORD *)&_swiftEmptyArrayStorage[2 * v5 + 4] = v7;
      v3 += 8;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_1000B8CC8()
{
  uint64_t v1 = v0;
  uint64_t v96 = type metadata accessor for SectionedDataSourceContainerViewType();
  uint64_t v2 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  v95 = (char *)v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2E4(0, &qword_100104850, (uint64_t (*)(uint64_t))&type metadata accessor for UIBackgroundConfiguration, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v4 - 8);
  v94 = (char *)v59 - v5;
  uint64_t v93 = type metadata accessor for CellDeselectionBehavior();
  uint64_t v6 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  v92 = (char *)v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C2E4(0, &qword_100104AB8, (uint64_t (*)(uint64_t))&type metadata accessor for UICellAccessory.LayoutDimension, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v8 - 8);
  v91 = (char *)v59 - v9;
  uint64_t v90 = type metadata accessor for UICellAccessory.DisclosureIndicatorOptions();
  uint64_t v10 = *(void *)(v90 - 8);
  __chkstk_darwin(v90);
  v89 = (char *)v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = type metadata accessor for UICellAccessory.DisplayedState();
  uint64_t v12 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  v87 = (char *)v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = type metadata accessor for UUID();
  uint64_t v14 = *(void *)(v98 - 8);
  __chkstk_darwin(v98);
  v97 = (char *)v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = type metadata accessor for ContentKind();
  uint64_t v16 = *(void *)(v86 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v18 = __chkstk_darwin(v86);
  v85 = (char *)v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v84 = (char *)v59 - v19;
  uint64_t v83 = type metadata accessor for ContentConfigurationItem();
  uint64_t v20 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  v82 = (char *)v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = static ContentKind.allCases.getter();
  int64_t v23 = *(void *)(v22 + 16);
  long long v24 = &off_1000CB000;
  uint64_t v60 = v14;
  if (v23)
  {
    v59[2] = v1;
    v105 = _swiftEmptyArrayStorage;
    uint64_t v101 = v2;
    int64_t v102 = v23;
    uint64_t v25 = v22;
    sub_100096494(0, v23, 0);
    id v79 = self;
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
    uint64_t v26 = v16 + 16;
    v78 = v27;
    uint64_t v28 = *(unsigned __int8 *)(v26 + 64);
    v59[1] = v25;
    uint64_t v29 = v25 + ((v28 + 32) & ~v28);
    uint64_t v77 = *(void *)(v26 + 56);
    uint64_t v76 = (v28 + 16) & ~v28;
    uint64_t v75 = v76 + v17;
    uint64_t v74 = v28 | 7;
    uint64_t v73 = (void (**)(uint64_t, char *, uint64_t))(v26 + 16);
    uint64_t v72 = (void (**)(char *, uint64_t))(v14 + 8);
    unsigned int v71 = enum case for UICellAccessory.DisplayedState.always(_:);
    uint64_t v70 = (void (**)(char *, void, uint64_t))(v12 + 104);
    v69 = (void (**)(char *, uint64_t))(v10 + 8);
    v68 = (void (**)(char *, uint64_t))(v12 + 8);
    unsigned int v67 = enum case for CellDeselectionBehavior.default(_:);
    v66 = (void (**)(char *, void, uint64_t))(v6 + 104);
    unsigned int v65 = enum case for SectionedDataSourceContainerViewType.collectionView(_:);
    uint64_t v64 = (void (**)(char *, void, uint64_t))(v101 + 104);
    v63 = (void (**)(char *, uint64_t))(v26 - 8);
    uint64_t v62 = v20 + 32;
    long long v61 = xmmword_1000CBFD0;
    uint64_t v81 = v26;
    uint64_t v80 = v20;
    v30 = v84;
    do
    {
      uint64_t v101 = v29;
      uint64_t v31 = v86;
      uint64_t v32 = v78;
      ((void (*)(char *))v78)(v30);
      unint64_t v33 = v85;
      v32(v85, v30, v31);
      String.init<A>(describing:)();
      v32(v33, v30, v31);
      uint64_t v34 = swift_allocObject();
      (*v73)(v34 + v76, v33, v31);
      uint64_t v35 = v97;
      UUID.init()();
      uint64_t v36 = UUID.uuidString.getter();
      uint64_t v99 = v37;
      uint64_t v100 = v36;
      (*v72)(v35, v98);
      v104[3] = type metadata accessor for UIListContentConfiguration();
      v104[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
      sub_100004F38(v104);
      static UIListContentConfiguration.cell()();
      swift_bridgeObjectRetain();
      UIListContentConfiguration.text.setter();
      id v38 = [v79 blackColor];
      uint64_t v39 = (void (*)(char *, void))UIListContentConfiguration.textProperties.modify();
      UIListContentConfiguration.TextProperties.color.setter();
      v39(v103, 0);
      sub_10001C2E4(0, &qword_100104AC0, (uint64_t (*)(uint64_t))&type metadata accessor for UICellAccessory, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      type metadata accessor for UICellAccessory();
      *(_OWORD *)(swift_allocObject() + 16) = v61;
      v40 = v87;
      uint64_t v41 = v88;
      (*v70)(v87, v71, v88);
      uint64_t v42 = type metadata accessor for UICellAccessory.LayoutDimension();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v91, 1, 1, v42);
      Swift::String v43 = v89;
      UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)();
      static UICellAccessory.disclosureIndicator(displayed:options:)();
      (*v69)(v43, v90);
      (*v68)(v40, v41);
      (*v66)(v92, v67, v93);
      swift_retain();
      swift_bridgeObjectRelease();
      uint64_t v44 = type metadata accessor for UIBackgroundConfiguration();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v94, 1, 1, v44);
      (*v64)(v95, v65, v96);
      v45 = v82;
      ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)();
      swift_release();
      (*v63)(v30, v31);
      long long v46 = v105;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100096494(0, v46[2] + 1, 1);
        long long v46 = v105;
      }
      unint64_t v48 = v46[2];
      unint64_t v47 = v46[3];
      uint64_t v49 = v80;
      if (v48 >= v47 >> 1)
      {
        sub_100096494(v47 > 1, v48 + 1, 1);
        long long v46 = v105;
      }
      v46[2] = v48 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v49 + 32))((unint64_t)v46+ ((*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80))+ *(void *)(v49 + 72) * v48, v45, v83);
      v105 = v46;
      uint64_t v29 = v101 + v77;
      --v102;
    }
    while (v102);
    swift_bridgeObjectRelease();
    long long v24 = &off_1000CB000;
  }
  else
  {
    swift_bridgeObjectRelease();
    long long v46 = _swiftEmptyArrayStorage;
  }
  sub_10001C2E4(0, &qword_100104858, (uint64_t (*)(uint64_t))&type metadata accessor for ArrayDataSourceSection, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  type metadata accessor for ArrayDataSourceSection();
  *(_OWORD *)(swift_allocObject() + 16) = *((_OWORD *)v24 + 253);
  sub_1000B870C((uint64_t)v46);
  swift_bridgeObjectRelease();
  unsigned int v50 = v97;
  UUID.init()();
  UUID.uuidString.getter();
  v51 = *(void (**)(char *, uint64_t))(v60 + 8);
  uint64_t v52 = v98;
  v51(v50, v98);
  ArrayDataSourceSection.init(title:arrangedItems:identifier:)();
  v104[0] = 0x3C53447961727241;
  v104[1] = 0xE800000000000000;
  UUID.init()();
  uint64_t v53 = UUID.uuidString.getter();
  v55 = v54;
  v51(v50, v52);
  v56._countAndFlagsBits = v53;
  v56._object = v55;
  String.append(_:)(v56);
  swift_bridgeObjectRelease();
  v57._countAndFlagsBits = 62;
  v57._object = (void *)0xE100000000000000;
  String.append(_:)(v57);
  return ArrayDataSource.init(arrangedSections:identifier:)();
}

void sub_1000B9A0C(void *a1, uint64_t a2)
{
  sub_10001C2E4(0, &qword_100104FB0, (uint64_t (*)(uint64_t))&type metadata accessor for ContentKind, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v4 = type metadata accessor for ContentKind();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1000CBFD0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 16))(v7 + v6, a2, v4);
  id v8 = objc_allocWithZone((Class)type metadata accessor for InternalFeedItemListViewController());
  id v9 = (id)InternalFeedItemListViewController.init(contentKinds:)();
  [a1 showViewController:v9 sender:0];
}

void sub_1000B9B64()
{
}

void sub_1000B9B80()
{
}

void sub_1000B9B9C()
{
}

uint64_t sub_1000B9BC8()
{
  return type metadata accessor for ContentKindDataSource();
}

unint64_t sub_1000B9BD0@<X0>(uint64_t *a1@<X8>)
{
  return sub_10002BFF4(a1);
}

uint64_t sub_1000B9C4C(uint64_t a1, uint64_t a2)
{
  return sub_10002B8D0(a1, a2);
}

uint64_t sub_1000B9CAC(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1000B9E78(&qword_1001083D8, (void (*)(uint64_t))type metadata accessor for ContentKindDataSource);
  uint64_t result = sub_1000B9E78(&qword_1001083E0, (void (*)(uint64_t))type metadata accessor for ContentKindDataSource);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_1000B9D30()
{
  uint64_t v1 = type metadata accessor for ContentKind();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_1000B9DC0(void *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ContentKind() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  sub_1000B9A0C(a1, v4);
}

uint64_t sub_1000B9E30(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    uint64_t result = a4(v7);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1000B9E78(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000B9EC4()
{
  unint64_t result = qword_1001083F0;
  if (!qword_1001083F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001083F0);
  }
  return result;
}

uint64_t sub_1000B9F18()
{
  return sub_1000BEE08(&qword_1001083F8, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
}

uint64_t type metadata accessor for HealthViewEntity()
{
  uint64_t result = qword_100108510;
  if (!qword_100108510) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000B9FAC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000BA03C;
  return sub_10005B278();
}

uint64_t sub_1000BA03C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 32) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BA13C, 0, 0);
}

uint64_t sub_1000BA13C()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)v0[2];
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1000BF6E4(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  return v4(v3);
}

uint64_t sub_1000BA1D4(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = (void *)swift_task_alloc();
  v2[4] = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1000BA264;
  return sub_10005B278();
}

uint64_t sub_1000BA264(uint64_t a1)
{
  *(void *)(*(void *)v1 + 40) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BA364, 0, 0);
}

uint64_t sub_1000BA364()
{
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[2];
  uint64_t v2 = v0[3];
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1000BF964(v1, v3, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = (uint64_t (*)(void *))v0[1];
  return v5(v4);
}

uint64_t sub_1000BA400(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000BA490;
  return sub_10005F1F8();
}

uint64_t sub_1000BA490(uint64_t a1)
{
  *(void *)(*(void *)v1 + 32) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BFD10, 0, 0);
}

uint64_t sub_1000BA590(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = (void *)swift_task_alloc();
  v2[4] = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1000BA620;
  return sub_10005F1F8();
}

uint64_t sub_1000BA620(uint64_t a1)
{
  *(void *)(*(void *)v1 + 40) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BFD0C, 0, 0);
}

uint64_t sub_1000BA720(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000BA490;
  return sub_100082FC8();
}

uint64_t sub_1000BA7B0(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = (void *)swift_task_alloc();
  v2[4] = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1000BA620;
  return sub_100082FC8();
}

uint64_t sub_1000BA840()
{
  uint64_t v0 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Locale();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for LocalizedStringResource();
  sub_10003FEAC(v6, qword_100108DF8);
  sub_10003FE20(v6, (uint64_t)qword_100108DF8);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v1);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_1000BAA2C()
{
  sub_1000BF62C(0, &qword_100105600, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v15 - v1;
  v15[0] = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v3 = *(void *)(v15[0] - 8);
  __chkstk_darwin(v15[0]);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Locale();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = type metadata accessor for LocalizedStringResource();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_1000BF62C(0, &qword_1001055F8, (uint64_t (*)(uint64_t))&type metadata accessor for IntentDescription, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t v11 = v10;
  sub_10003FEAC(v10, qword_100108E10);
  uint64_t v12 = sub_10003FE20(v11, (uint64_t)qword_100108E10);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v15[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  IntentDescription.init(_:categoryName:searchKeywords:)();
  uint64_t v13 = type metadata accessor for IntentDescription();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
}

uint64_t sub_1000BADA4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HealthViewEntity();
  __chkstk_darwin(v2 - 8);
  sub_1000260B8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  IntentParameter.wrappedValue.setter();
  return sub_10002611C(a1);
}

unint64_t sub_1000BAE3C()
{
  unint64_t result = qword_100108400;
  if (!qword_100108400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100108400);
  }
  return result;
}

unint64_t sub_1000BAE94()
{
  unint64_t result = qword_100108408;
  if (!qword_100108408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100108408);
  }
  return result;
}

uint64_t sub_1000BAEE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000BAF04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000BAF54@<X0>(uint64_t a1@<X8>)
{
  return sub_100067F38(&qword_1001040B0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100108DF8, a1);
}

uint64_t sub_1000BAF8C(uint64_t a1)
{
  unint64_t v2 = sub_1000BF690();

  return static OpenIntent.openAppWhenRun.getter(a1, v2);
}

uint64_t sub_1000BAFC8@<X0>(uint64_t a1@<X8>)
{
  if (qword_1001040B8 != -1) {
    swift_once();
  }
  sub_1000BF62C(0, &qword_1001055F8, (uint64_t (*)(uint64_t))&type metadata accessor for IntentDescription, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t v3 = sub_10003FE20(v2, (uint64_t)qword_100108E10);

  return sub_10006B704(v3, a1);
}

uint64_t sub_1000BB070(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = type metadata accessor for HealthViewEntity();
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = *v1;
  v2[4] = v3;
  v2[5] = v4;
  return _swift_task_switch(sub_1000BB108, 0, 0);
}

uint64_t sub_1000BB108()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[3];
  IntentParameter.wrappedValue.getter();
  uint64_t v3 = *(void (**)(uint64_t))(v1 + *(int *)(v2 + 24));
  swift_retain();
  uint64_t v4 = sub_10002611C(v1);
  v3(v4);
  swift_release();
  static IntentResult.result<>()();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_1000BB1E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000BEF74();
  *a1 = result;
  return result;
}

uint64_t sub_1000BB20C(uint64_t a1)
{
  unint64_t v2 = sub_100025C6C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_1000BB24C()
{
  unint64_t result = qword_100108418;
  if (!qword_100108418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100108418);
  }
  return result;
}

uint64_t sub_1000BB2A0()
{
  uint64_t v0 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v0 - 8);
  v14[0] = (char *)v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BF62C(0, &qword_100105600, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v14 - v3;
  uint64_t v5 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Locale();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = type metadata accessor for LocalizedStringResource();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = type metadata accessor for TypeDisplayRepresentation();
  sub_10003FEAC(v12, qword_100108E28);
  sub_10003FE20(v12, (uint64_t)qword_100108E28);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v4, 1, 1, v10);
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_1000BB5A8()
{
  sub_1000BF62C(0, (unint64_t *)&qword_1001064C8, (uint64_t (*)(uint64_t))sub_1000BEE50, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for AppDependency);
  type metadata accessor for AppDependencyManager();
  static AppDependencyManager.shared.getter();
  uint64_t result = AppDependency.__allocating_init(key:manager:)();
  qword_100108E40 = result;
  return result;
}

uint64_t sub_1000BB63C()
{
  uint64_t v0 = type metadata accessor for String.LocalizationValue();
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  __chkstk_darwin(v1);
  uint64_t v28 = (char *)&v21 - v2;
  uint64_t v27 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v3 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v26 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Locale();
  __chkstk_darwin(v5 - 8);
  sub_1000BF62C(0, &qword_100108558, (uint64_t (*)(uint64_t))sub_1000BEE90, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1000CD120;
  *(void *)(v6 + 56) = type metadata accessor for UnnamedSectionProvider();
  *(void *)(v6 + 64) = &off_1000F7050;
  uint64_t v7 = sub_100004F38((uint64_t *)(v6 + 32));
  uint64_t v24 = type metadata accessor for LocalizedStringResource();
  uint64_t v8 = *(void *)(v24 - 8);
  uint64_t v9 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  uint64_t v25 = v8 + 56;
  v9(v7, 1, 1, v24);
  uint64_t v22 = v9;
  AppDependency.wrappedValue.getter();
  uint64_t v10 = v29;
  uint64_t v11 = type metadata accessor for RecordsSectionProvider();
  *(void *)(v6 + 96) = v11;
  *(void *)(v6 + 104) = &off_1000F6F28;
  uint64_t v12 = sub_100004F38((uint64_t *)(v6 + 72));
  *uint64_t v12 = v10;
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v13 = (char *)v12 + *(int *)(v11 + 20);
  static Locale.current.getter();
  uint64_t v14 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  uint64_t v23 = v3 + 104;
  uint64_t v17 = v26;
  uint64_t v16 = v27;
  v15(v26, enum case for LocalizedStringResource.BundleDescription.main(_:), v27);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  uint64_t v18 = v24;
  v9((uint64_t *)v13, 0, 1, v24);
  *(void *)(v6 + 136) = type metadata accessor for CategoriesSectionProvider();
  *(void *)(v6 + 144) = &off_1000F7B68;
  uint64_t v19 = sub_100004F38((uint64_t *)(v6 + 112));
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  v15(v17, v14, v16);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  v22(v19, 0, 1, v18);
  return v6;
}

uint64_t sub_1000BBA3C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return _swift_task_switch(sub_1000BBA5C, 0, 0);
}

uint64_t sub_1000BBA5C()
{
  v0[7] = _swiftEmptyArrayStorage;
  uint64_t v1 = sub_1000BB63C();
  v0[10] = v1;
  uint64_t v2 = *(void *)(v1 + 16);
  v0[11] = v2;
  if (v2)
  {
    v0[12] = 0;
    sub_10001D360(v1 + 32, (uint64_t)(v0 + 2));
    uint64_t v3 = v0[5];
    uint64_t v4 = v0[6];
    sub_1000190DC(v0 + 2, v3);
    uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 24) + **(int **)(v4 + 24));
    uint64_t v5 = (void *)swift_task_alloc();
    v0[13] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_1000BBBE4;
    uint64_t v6 = v0[8];
    return v9(v6, v3, v4);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = (uint64_t (*)(void *))v0[1];
    return v8(_swiftEmptyArrayStorage);
  }
}

uint64_t sub_1000BBBE4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 112) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BBCE4, 0, 0);
}

uint64_t sub_1000BBCE4()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12] + 1;
  sub_1000756E8(v0[14]);
  _s6Health23OpenSleepScheduleIntentVwxx_0((uint64_t)(v0 + 2));
  if (v2 == v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = v0[7];
    uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
    return v4(v3);
  }
  else
  {
    uint64_t v6 = v0[12] + 1;
    v0[12] = v6;
    sub_10001D360(v0[10] + 40 * v6 + 32, (uint64_t)(v0 + 2));
    uint64_t v7 = v0[5];
    uint64_t v8 = v0[6];
    sub_1000190DC(v0 + 2, v7);
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 + 24) + **(int **)(v8 + 24));
    uint64_t v9 = (void *)swift_task_alloc();
    v0[13] = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_1000BBBE4;
    uint64_t v10 = v0[8];
    return v11(v10, v7, v8);
  }
}

uint64_t sub_1000BBE88(uint64_t a1, uint64_t a2)
{
  v2[9] = a1;
  v2[10] = a2;
  uint64_t v3 = type metadata accessor for HealthViewEntity();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  sub_1000BE4C8(0, (unint64_t *)&qword_100107668, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for IntentItem);
  v2[15] = v4;
  v2[16] = *(void *)(v4 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  sub_1000BE4C8(0, (unint64_t *)&qword_100105220, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for IntentItemSection);
  v2[19] = v5;
  v2[20] = *(void *)(v5 - 8);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  sub_1000BF62C(0, &qword_100105600, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for LocalizedStringResource();
  v2[25] = v6;
  v2[26] = *(void *)(v6 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  return _swift_task_switch(sub_1000BC140, 0, 0);
}

uint64_t sub_1000BC140()
{
  uint64_t result = sub_1000BB63C();
  v0[29] = result;
  uint64_t v2 = *(void *)(result + 16);
  v0[30] = v2;
  if (v2)
  {
    v0[31] = 0;
    v0[32] = _swiftEmptyArrayStorage;
    if (*(void *)(result + 16))
    {
      sub_10001D360(result + 32, (uint64_t)(v0 + 2));
      uint64_t v3 = v0[5];
      uint64_t v4 = v0[6];
      sub_1000190DC(v0 + 2, v3);
      uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v4 + 16) + **(int **)(v4 + 16));
      uint64_t v5 = (void *)swift_task_alloc();
      v0[33] = v5;
      *uint64_t v5 = v0;
      v5[1] = sub_1000BC3CC;
      return v7(v3, v4);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[26] + 56))(v0[23], 1, 1, v0[25]);
    sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
    IntentItemCollection.init(promptLabel:usesIndexedCollation:sections:)();
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
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  return result;
}

uint64_t sub_1000BC3CC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 272) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BC4CC, 0, 0);
}

uint64_t sub_1000BC4CC()
{
  uint64_t v1 = v0 + 2;
  uint64_t v2 = v0[34];
  if (!*(void *)(v2 + 16))
  {
    swift_bridgeObjectRelease();
    unint64_t v22 = v0[32];
    goto LABEL_31;
  }
  uint64_t v4 = v0[25];
  uint64_t v3 = v0[26];
  uint64_t v5 = v0[24];
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[6];
  sub_1000190DC(v0 + 2, v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v5, 1, v4) != 1)
  {
    uint64_t v24 = v0[27];
    uint64_t v23 = v0[28];
    uint64_t v26 = v0[25];
    uint64_t v25 = v0[26];
    (*(void (**)(uint64_t, void, uint64_t))(v25 + 32))(v23, v0[24], v26);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v23, v26);
    int64_t v27 = *(void *)(v2 + 16);
    uint64_t v28 = v0[34];
    if (v27)
    {
      uint64_t v29 = v0 + 8;
      uint64_t v30 = v0[12];
      v0[8] = _swiftEmptyArrayStorage;
      sub_1000965E4(0, v27, 0);
      uint64_t v31 = v28 + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
      uint64_t v32 = *(void *)(v30 + 72);
      do
      {
        uint64_t v34 = v0[13];
        uint64_t v33 = v0[14];
        sub_1000260B8(v31, v33);
        sub_1000260B8(v33, v34);
        sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
        IntentItem.init(_:)();
        sub_10002611C(v33);
        uint64_t v35 = v0[8];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000965E4(0, *(void *)(v35 + 16) + 1, 1);
          uint64_t v35 = *v29;
        }
        unint64_t v37 = *(void *)(v35 + 16);
        unint64_t v36 = *(void *)(v35 + 24);
        if (v37 >= v36 >> 1)
        {
          sub_1000965E4(v36 > 1, v37 + 1, 1);
          uint64_t v35 = *v29;
        }
        uint64_t v38 = v0[18];
        uint64_t v39 = v0[15];
        uint64_t v40 = v0[16];
        *(void *)(v35 + 16) = v37 + 1;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v40 + 32))(v35+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(void *)(v40 + 72) * v37, v38, v39);
        v0[8] = v35;
        v31 += v32;
        --v27;
      }
      while (v27);
      swift_bridgeObjectRelease();
      uint64_t v1 = v0 + 2;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
    IntentItemSection.init(_:items:)();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v22 = v0[32];
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      unint64_t v22 = sub_100036C14(0, *(void *)(v22 + 16) + 1, 1, v0[32]);
    }
    unint64_t v49 = *(void *)(v22 + 16);
    unint64_t v48 = *(void *)(v22 + 24);
    if (v49 >= v48 >> 1) {
      unint64_t v22 = sub_100036C14(v48 > 1, v49 + 1, 1, v22);
    }
    uint64_t v50 = v0[28];
    uint64_t v51 = v0[25];
    uint64_t v52 = v0[26];
    uint64_t v53 = v0[22];
    uint64_t v54 = v0[19];
    uint64_t v55 = v0[20];
    *(void *)(v22 + 16) = v49 + 1;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v55 + 32))(v22+ ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80))+ *(void *)(v55 + 72) * v49, v53, v54);
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v50, v51);
    goto LABEL_31;
  }
  sub_1000BEEE8(v0[24]);
  int64_t v8 = *(void *)(v2 + 16);
  uint64_t v9 = v0[34];
  if (v8)
  {
    uint64_t v10 = v0 + 7;
    uint64_t v11 = v0[12];
    v0[7] = _swiftEmptyArrayStorage;
    sub_1000965E4(0, v8, 0);
    uint64_t v12 = v9 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    uint64_t v13 = *(void *)(v11 + 72);
    do
    {
      uint64_t v15 = v0[13];
      uint64_t v14 = v0[14];
      sub_1000260B8(v12, v14);
      sub_1000260B8(v14, v15);
      sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
      IntentItem.init(_:)();
      sub_10002611C(v14);
      uint64_t v16 = v0[7];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1000965E4(0, *(void *)(v16 + 16) + 1, 1);
        uint64_t v16 = *v10;
      }
      unint64_t v18 = *(void *)(v16 + 16);
      unint64_t v17 = *(void *)(v16 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_1000965E4(v17 > 1, v18 + 1, 1);
        uint64_t v16 = *v10;
      }
      uint64_t v20 = v0[16];
      uint64_t v19 = v0[17];
      uint64_t v21 = v0[15];
      *(void *)(v16 + 16) = v18 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v20 + 32))(v16+ ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))+ *(void *)(v20 + 72) * v18, v19, v21);
      v0[7] = v16;
      v12 += v13;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
    uint64_t v1 = v0 + 2;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
  IntentItemSection.init(items:)();
  char v41 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v22 = v0[32];
  if ((v41 & 1) == 0) {
    goto LABEL_40;
  }
  while (1)
  {
    unint64_t v43 = *(void *)(v22 + 16);
    unint64_t v42 = *(void *)(v22 + 24);
    if (v43 >= v42 >> 1) {
      unint64_t v22 = sub_100036C14(v42 > 1, v43 + 1, 1, v22);
    }
    uint64_t v45 = v0[20];
    uint64_t v44 = v0[21];
    uint64_t v46 = v0[19];
    *(void *)(v22 + 16) = v43 + 1;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v45 + 32))(v22+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v43, v44, v46);
LABEL_31:
    uint64_t v56 = v0[30];
    uint64_t v57 = v0[31] + 1;
    _s6Health23OpenSleepScheduleIntentVwxx_0((uint64_t)v1);
    if (v57 == v56)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(void, uint64_t, uint64_t, void))(v0[26] + 56))(v0[23], 1, 1, v0[25]);
      sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
      IntentItemCollection.init(promptLabel:usesIndexedCollation:sections:)();
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
      id v58 = (uint64_t (*)(void))v0[1];
      return v58();
    }
    unint64_t v60 = v0[31] + 1;
    v0[31] = v60;
    v0[32] = v22;
    uint64_t v61 = v0[29];
    if (v60 < *(void *)(v61 + 16)) {
      break;
    }
    __break(1u);
LABEL_40:
    unint64_t v22 = sub_100036C14(0, *(void *)(v22 + 16) + 1, 1, v22);
  }
  sub_10001D360(v61 + 40 * v60 + 32, (uint64_t)v1);
  uint64_t v62 = v0[5];
  uint64_t v63 = v0[6];
  sub_1000190DC(v1, v62);
  unsigned int v65 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v63 + 16) + **(int **)(v63 + 16));
  uint64_t v64 = (void *)swift_task_alloc();
  v0[33] = v64;
  *uint64_t v64 = v0;
  v64[1] = sub_1000BC3CC;
  return v65(v62, v63);
}

uint64_t sub_1000BCD28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[11] = a3;
  v4[12] = a4;
  v4[9] = a1;
  v4[10] = a2;
  uint64_t v5 = type metadata accessor for HealthViewEntity();
  v4[13] = v5;
  v4[14] = *(void *)(v5 - 8);
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  sub_1000BE4C8(0, (unint64_t *)&qword_100107668, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for IntentItem);
  v4[17] = v6;
  v4[18] = *(void *)(v6 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  sub_1000BE4C8(0, (unint64_t *)&qword_100105220, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for IntentItemSection);
  v4[21] = v7;
  v4[22] = *(void *)(v7 - 8);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  sub_1000BF62C(0, &qword_100105600, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for LocalizedStringResource();
  v4[27] = v8;
  v4[28] = *(void *)(v8 - 8);
  v4[29] = swift_task_alloc();
  v4[30] = swift_task_alloc();
  return _swift_task_switch(sub_1000BCFE4, 0, 0);
}

uint64_t sub_1000BCFE4()
{
  uint64_t result = sub_1000BB63C();
  v0[31] = result;
  uint64_t v2 = *(void *)(result + 16);
  v0[32] = v2;
  if (v2)
  {
    v0[33] = 0;
    v0[34] = _swiftEmptyArrayStorage;
    if (*(void *)(result + 16))
    {
      sub_10001D360(result + 32, (uint64_t)(v0 + 2));
      uint64_t v3 = v0[5];
      uint64_t v4 = v0[6];
      sub_1000190DC(v0 + 2, v3);
      uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 32) + **(int **)(v4 + 32));
      uint64_t v5 = (void *)swift_task_alloc();
      v0[35] = v5;
      *uint64_t v5 = v0;
      v5[1] = sub_1000BD278;
      uint64_t v7 = v0[10];
      uint64_t v6 = v0[11];
      return v9(v7, v6, v3, v4);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[28] + 56))(v0[25], 1, 1, v0[27]);
    sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
    IntentItemCollection.init(promptLabel:usesIndexedCollation:sections:)();
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
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
  return result;
}

uint64_t sub_1000BD278(uint64_t a1)
{
  *(void *)(*(void *)v1 + 288) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BD378, 0, 0);
}

uint64_t sub_1000BD378()
{
  uint64_t v1 = v0 + 2;
  uint64_t v2 = v0[36];
  if (!*(void *)(v2 + 16))
  {
    swift_bridgeObjectRelease();
    unint64_t v22 = v0[34];
    goto LABEL_31;
  }
  uint64_t v4 = v0[27];
  uint64_t v3 = v0[28];
  uint64_t v5 = v0[26];
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[6];
  sub_1000190DC(v0 + 2, v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v5, 1, v4) != 1)
  {
    uint64_t v24 = v0[29];
    uint64_t v23 = v0[30];
    uint64_t v26 = v0[27];
    uint64_t v25 = v0[28];
    (*(void (**)(uint64_t, void, uint64_t))(v25 + 32))(v23, v0[26], v26);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v23, v26);
    int64_t v27 = *(void *)(v2 + 16);
    uint64_t v28 = v0[36];
    if (v27)
    {
      uint64_t v29 = v0 + 8;
      uint64_t v30 = v0[14];
      v0[8] = _swiftEmptyArrayStorage;
      sub_1000965E4(0, v27, 0);
      uint64_t v31 = v28 + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
      uint64_t v32 = *(void *)(v30 + 72);
      do
      {
        uint64_t v34 = v0[15];
        uint64_t v33 = v0[16];
        sub_1000260B8(v31, v33);
        sub_1000260B8(v33, v34);
        sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
        IntentItem.init(_:)();
        sub_10002611C(v33);
        uint64_t v35 = v0[8];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000965E4(0, *(void *)(v35 + 16) + 1, 1);
          uint64_t v35 = *v29;
        }
        unint64_t v37 = *(void *)(v35 + 16);
        unint64_t v36 = *(void *)(v35 + 24);
        if (v37 >= v36 >> 1)
        {
          sub_1000965E4(v36 > 1, v37 + 1, 1);
          uint64_t v35 = *v29;
        }
        uint64_t v38 = v0[20];
        uint64_t v39 = v0[17];
        uint64_t v40 = v0[18];
        *(void *)(v35 + 16) = v37 + 1;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v40 + 32))(v35+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(void *)(v40 + 72) * v37, v38, v39);
        v0[8] = v35;
        v31 += v32;
        --v27;
      }
      while (v27);
      swift_bridgeObjectRelease();
      uint64_t v1 = v0 + 2;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
    IntentItemSection.init(_:items:)();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v22 = v0[34];
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      unint64_t v22 = sub_100036C14(0, *(void *)(v22 + 16) + 1, 1, v0[34]);
    }
    unint64_t v49 = *(void *)(v22 + 16);
    unint64_t v48 = *(void *)(v22 + 24);
    if (v49 >= v48 >> 1) {
      unint64_t v22 = sub_100036C14(v48 > 1, v49 + 1, 1, v22);
    }
    uint64_t v50 = v0[30];
    uint64_t v51 = v0[27];
    uint64_t v52 = v0[28];
    uint64_t v53 = v0[24];
    uint64_t v54 = v0[21];
    uint64_t v55 = v0[22];
    *(void *)(v22 + 16) = v49 + 1;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v55 + 32))(v22+ ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80))+ *(void *)(v55 + 72) * v49, v53, v54);
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v50, v51);
    goto LABEL_31;
  }
  sub_1000BEEE8(v0[26]);
  int64_t v8 = *(void *)(v2 + 16);
  uint64_t v9 = v0[36];
  if (v8)
  {
    uint64_t v10 = v0 + 7;
    uint64_t v11 = v0[14];
    v0[7] = _swiftEmptyArrayStorage;
    sub_1000965E4(0, v8, 0);
    uint64_t v12 = v9 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    uint64_t v13 = *(void *)(v11 + 72);
    do
    {
      uint64_t v15 = v0[15];
      uint64_t v14 = v0[16];
      sub_1000260B8(v12, v14);
      sub_1000260B8(v14, v15);
      sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
      IntentItem.init(_:)();
      sub_10002611C(v14);
      uint64_t v16 = v0[7];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1000965E4(0, *(void *)(v16 + 16) + 1, 1);
        uint64_t v16 = *v10;
      }
      unint64_t v18 = *(void *)(v16 + 16);
      unint64_t v17 = *(void *)(v16 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_1000965E4(v17 > 1, v18 + 1, 1);
        uint64_t v16 = *v10;
      }
      uint64_t v20 = v0[18];
      uint64_t v19 = v0[19];
      uint64_t v21 = v0[17];
      *(void *)(v16 + 16) = v18 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v20 + 32))(v16+ ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))+ *(void *)(v20 + 72) * v18, v19, v21);
      v0[7] = v16;
      v12 += v13;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
    uint64_t v1 = v0 + 2;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
  IntentItemSection.init(items:)();
  char v41 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v22 = v0[34];
  if ((v41 & 1) == 0) {
    goto LABEL_40;
  }
  while (1)
  {
    unint64_t v43 = *(void *)(v22 + 16);
    unint64_t v42 = *(void *)(v22 + 24);
    if (v43 >= v42 >> 1) {
      unint64_t v22 = sub_100036C14(v42 > 1, v43 + 1, 1, v22);
    }
    uint64_t v45 = v0[22];
    uint64_t v44 = v0[23];
    uint64_t v46 = v0[21];
    *(void *)(v22 + 16) = v43 + 1;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v45 + 32))(v22+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v43, v44, v46);
LABEL_31:
    uint64_t v56 = v0[32];
    uint64_t v57 = v0[33] + 1;
    _s6Health23OpenSleepScheduleIntentVwxx_0((uint64_t)v1);
    if (v57 == v56)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(void, uint64_t, uint64_t, void))(v0[28] + 56))(v0[25], 1, 1, v0[27]);
      sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
      IntentItemCollection.init(promptLabel:usesIndexedCollation:sections:)();
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
      id v58 = (uint64_t (*)(void))v0[1];
      return v58();
    }
    unint64_t v60 = v0[33] + 1;
    v0[33] = v60;
    v0[34] = v22;
    uint64_t v61 = v0[31];
    if (v60 < *(void *)(v61 + 16)) {
      break;
    }
    __break(1u);
LABEL_40:
    unint64_t v22 = sub_100036C14(0, *(void *)(v22 + 16) + 1, 1, v22);
  }
  sub_10001D360(v61 + 40 * v60 + 32, (uint64_t)v1);
  uint64_t v62 = v0[5];
  uint64_t v63 = v0[6];
  sub_1000190DC(v1, v62);
  unsigned int v67 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v63 + 32) + **(int **)(v63 + 32));
  uint64_t v64 = (void *)swift_task_alloc();
  v0[35] = v64;
  *uint64_t v64 = v0;
  v64[1] = sub_1000BD278;
  uint64_t v66 = v0[10];
  uint64_t v65 = v0[11];
  return v67(v66, v65, v62, v63);
}

uint64_t sub_1000BDBDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v3;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_100028DB8;
  return sub_1000BCD28(a1, a2, a3, v8);
}

unint64_t sub_1000BDC98()
{
  unint64_t result = qword_100108428;
  if (!qword_100108428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100108428);
  }
  return result;
}

uint64_t sub_1000BDCEC()
{
  return sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
}

uint64_t sub_1000BDD34()
{
  return sub_1000BE484(&qword_100108430, qword_100108438, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for IntentItemCollection);
}

uint64_t sub_1000BDD84(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100055B84;
  return sub_1000BBE88(a1, v4);
}

unint64_t sub_1000BDE28()
{
  unint64_t result = qword_100108450;
  if (!qword_100108450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100108450);
  }
  return result;
}

unint64_t sub_1000BDE80()
{
  unint64_t result = qword_100108458;
  if (!qword_100108458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100108458);
  }
  return result;
}

uint64_t sub_1000BDED4()
{
  return sub_1000BEE08(qword_100108460, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
}

uint64_t sub_1000BDF1C@<X0>(uint64_t *a1@<X8>)
{
  sub_1000BF62C(0, (unint64_t *)&qword_1001064C8, (uint64_t (*)(uint64_t))sub_1000BEE50, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for AppDependency);
  type metadata accessor for AppDependencyManager();
  static AppDependencyManager.shared.getter();
  uint64_t result = AppDependency.__allocating_init(key:manager:)();
  *a1 = result;
  return result;
}

uint64_t sub_1000BDFB8(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000BE068;
  v5[8] = a1;
  v5[9] = v4;
  return _swift_task_switch(sub_1000BBA5C, 0, 0);
}

uint64_t sub_1000BE068(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1000BE168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100055B84;
  return EntityQuery.suggestedEntities()(a1, a2, a3);
}

uint64_t sub_1000BE21C()
{
  return sub_1000BEE08(&qword_100108478, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
}

uint64_t sub_1000BE264()
{
  return sub_1000BEE08(&qword_100108480, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
}

uint64_t sub_1000BE2AC@<X0>(void *a1@<X8>)
{
  if (qword_1001040C8 != -1) {
    swift_once();
  }
  *a1 = qword_100108E40;

  return swift_retain();
}

uint64_t sub_1000BE318()
{
  return sub_1000BEE08(&qword_100108488, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
}

uint64_t sub_1000BE360()
{
  return sub_1000BEE08(&qword_100108490, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
}

uint64_t sub_1000BE3A8()
{
  return sub_1000BEE08(&qword_100108498, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
}

uint64_t sub_1000BE3F0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000BE3FC@<X0>(uint64_t a1@<X8>)
{
  return sub_100067F38(&qword_1001040C0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100108E28, a1);
}

uint64_t sub_1000BE434()
{
  return sub_1000BE484(&qword_1001084A0, &qword_1001084A8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for EmptyResolverSpecification);
}

uint64_t sub_1000BE484(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000BE4C8(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000BE4C8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for HealthViewEntity();
    uint64_t v7 = sub_1000BEE08((unint64_t *)&qword_100104700, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
    unint64_t v8 = a3(a1, v6, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1000BE564(uint64_t a1)
{
  uint64_t v2 = sub_1000BEE08(qword_100108460, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_1000BE5E0()
{
  return sub_1000BEE08(&qword_1001084B0, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
}

uint64_t sub_1000BE628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = type metadata accessor for DisplayRepresentation();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_1000BE698(uint64_t a1)
{
  uint64_t v2 = sub_1000BEE08(&qword_100108498, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for HealthViewEntity.Query()
{
  return &type metadata for HealthViewEntity.Query;
}

uint64_t *sub_1000BE724(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for DisplayRepresentation();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000BE830(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for DisplayRepresentation();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_release();
}

void *sub_1000BE8C0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for DisplayRepresentation();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  swift_retain();
  return a1;
}

void *sub_1000BE980(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for DisplayRepresentation();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1000BEA48(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for DisplayRepresentation();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_1000BEAE0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for DisplayRepresentation();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_1000BEB8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000BEBA0);
}

uint64_t sub_1000BEBA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for DisplayRepresentation();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000BEC50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000BEC64);
}

uint64_t sub_1000BEC64(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for DisplayRepresentation();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1000BED0C()
{
  uint64_t result = type metadata accessor for DisplayRepresentation();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenViewIntent()
{
  return &type metadata for OpenViewIntent;
}

uint64_t sub_1000BEDC0()
{
  return sub_1000BEE08((unint64_t *)&qword_1001055C8, (void (*)(uint64_t))sub_10003FBF0);
}

uint64_t sub_1000BEE08(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000BEE50()
{
  unint64_t result = qword_100106600;
  if (!qword_100106600)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100106600);
  }
  return result;
}

unint64_t sub_1000BEE90()
{
  unint64_t result = qword_100108560;
  if (!qword_100108560)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, &qword_100108560);
  }
  return result;
}

uint64_t sub_1000BEEE8(uint64_t a1)
{
  sub_1000BF62C(0, &qword_100105600, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000BEF74()
{
  uint64_t v0 = type metadata accessor for InputConnectionBehavior();
  uint64_t v35 = *(void *)(v0 - 8);
  uint64_t v36 = v0;
  __chkstk_darwin(v0);
  uint64_t v34 = (char *)v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BF62C(0, &qword_1001064D8, (uint64_t (*)(uint64_t))&type metadata accessor for IntentDialog, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v33 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v32 = (char *)v28 - v5;
  sub_1000BF62C(0, &qword_100108578, (uint64_t (*)(uint64_t))type metadata accessor for HealthViewEntity, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v6 - 8);
  uint64_t v31 = (char *)v28 - v7;
  uint64_t v8 = type metadata accessor for String.LocalizationValue();
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  __chkstk_darwin(v9);
  v28[1] = (char *)v28 - v10;
  sub_1000BF62C(0, &qword_100105600, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v11 - 8);
  uint64_t v29 = (char *)v28 - v12;
  uint64_t v13 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for Locale();
  __chkstk_darwin(v17 - 8);
  uint64_t v18 = type metadata accessor for LocalizedStringResource();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v30 = (char *)v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  uint64_t v21 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  unint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 104);
  v22(v16, enum case for LocalizedStringResource.BundleDescription.main(_:), v13);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  String.LocalizationValue.init(stringLiteral:)();
  sub_1000BE4C8(0, &qword_100108580, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for IntentParameter);
  static Locale.current.getter();
  v22(v16, v21, v13);
  uint64_t v23 = v29;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v23, 0, 1, v18);
  uint64_t v24 = type metadata accessor for HealthViewEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v31, 1, 1, v24);
  uint64_t v25 = type metadata accessor for IntentDialog();
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56);
  v26(v32, 1, 1, v25);
  v26(v33, 1, 1, v25);
  sub_1000BF62C(0, (unint64_t *)&qword_1001064C8, (uint64_t (*)(uint64_t))sub_1000BEE50, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for AppDependency);
  type metadata accessor for AppDependencyManager();
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v39 = 0;
  static AppDependencyManager.shared.getter();
  *(void *)&long long v37 = AppDependency.__allocating_init(key:manager:)();
  (*(void (**)(char *, void, uint64_t))(v35 + 104))(v34, enum case for InputConnectionBehavior.default(_:), v36);
  sub_1000BDE28();
  sub_1000BEE08(qword_100108460, (void (*)(uint64_t))type metadata accessor for HealthViewEntity);
  return IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:optionsProvider:)();
}

void sub_1000BF62C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_1000BF690()
{
  unint64_t result = qword_100108588;
  if (!qword_100108588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100108588);
  }
  return result;
}

uint64_t sub_1000BF6E4(uint64_t a1, void *a2)
{
  uint64_t v5 = type metadata accessor for HealthViewEntity() - 8;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v30 = (uint64_t)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (uint64_t *)((char *)&v25 - v9);
  uint64_t result = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v33 = _swiftEmptyArrayStorage;
  uint64_t v29 = *(void *)(a1 + 16);
  if (!v29) {
    return result;
  }
  uint64_t v12 = 0;
  uint64_t v13 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v32 = *(void *)(v8 + 72);
  uint64_t v27 = (v13 + 32) & ~v13;
  uint64_t v28 = a1 + v27;
  uint64_t v25 = v2;
  uint64_t v26 = a2 + 7;
  uint64_t v14 = _swiftEmptyArrayStorage;
  uint64_t v31 = a2;
  while (1)
  {
    sub_1000260B8(v28 + v32 * v12, (uint64_t)v10);
    uint64_t v15 = a2[2];
    if (v15)
    {
      uint64_t v16 = *v10;
      uint64_t v17 = v10[1];
      BOOL v18 = a2[4] == *v10 && a2[5] == v17;
      if (v18 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
      {
LABEL_11:
        sub_10005C168((uint64_t)v10, v30);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_100096524(0, v14[2] + 1, 1);
        }
        uint64_t v14 = v33;
        unint64_t v20 = v33[2];
        unint64_t v19 = v33[3];
        if (v20 >= v19 >> 1)
        {
          sub_100096524(v19 > 1, v20 + 1, 1);
          uint64_t v14 = v33;
        }
        void v14[2] = v20 + 1;
        sub_10005C168(v30, (uint64_t)v14 + v27 + v20 * v32);
        a2 = v31;
        goto LABEL_4;
      }
      a2 = v31;
      if (v15 != 1) {
        break;
      }
    }
LABEL_3:
    sub_10002611C((uint64_t)v10);
LABEL_4:
    if (++v12 == v29) {
      return (uint64_t)v33;
    }
  }
  uint64_t v21 = v26;
  uint64_t v22 = 1;
  while (1)
  {
    uint64_t v23 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (*(v21 - 1) == v16 && *v21 == v17) {
      goto LABEL_11;
    }
    uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
    if (result) {
      goto LABEL_11;
    }
    v21 += 2;
    ++v22;
    BOOL v18 = v23 == v15;
    a2 = v31;
    if (v18) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

void *sub_1000BF964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = a2;
  uint64_t v6 = type metadata accessor for LocalizedStringResource();
  __chkstk_darwin(v6 - 8);
  uint64_t v26 = type metadata accessor for HealthViewEntity();
  uint64_t v7 = __chkstk_darwin(v26);
  uint64_t v25 = (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v22 - v10;
  uint64_t result = _swiftEmptyArrayStorage;
  uint64_t v32 = _swiftEmptyArrayStorage;
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13)
  {
    uint64_t v14 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v15 = *(void *)(v9 + 72);
    uint64_t v22 = v3;
    uint64_t v23 = (v14 + 32) & ~v14;
    uint64_t v16 = a1 + v23;
    uint64_t v24 = a3;
    do
    {
      sub_1000260B8(v16, (uint64_t)v11);
      DisplayRepresentation.title.getter();
      uint64_t v30 = String.init(localized:)();
      uint64_t v31 = v17;
      uint64_t v28 = v27;
      uint64_t v29 = a3;
      sub_100038AD4();
      char v18 = StringProtocol.localizedStandardContains<A>(_:)();
      swift_bridgeObjectRelease();
      if (v18)
      {
        sub_10005C168((uint64_t)v11, v25);
        unint64_t v19 = v32;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100096524(0, v19[2] + 1, 1);
          unint64_t v19 = v32;
        }
        unint64_t v21 = v19[2];
        unint64_t v20 = v19[3];
        if (v21 >= v20 >> 1)
        {
          sub_100096524(v20 > 1, v21 + 1, 1);
          unint64_t v19 = v32;
        }
        v19[2] = v21 + 1;
        sub_10005C168(v25, (uint64_t)v19 + v23 + v21 * v15);
        a3 = v24;
      }
      else
      {
        sub_10002611C((uint64_t)v11);
      }
      v16 += v15;
      --v13;
    }
    while (v13);
    return v32;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for OpenViewIntentError(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1000BFC7CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenViewIntentError()
{
  return &type metadata for OpenViewIntentError;
}

unint64_t sub_1000BFCB8()
{
  unint64_t result = qword_1001085C0;
  if (!qword_1001085C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001085C0);
  }
  return result;
}

uint64_t type metadata accessor for AllFeedItemsDataSource()
{
  uint64_t result = qword_1001085C8;
  if (!qword_1001085C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000BFD60()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000BFDA0()
{
  uint64_t v0 = type metadata accessor for SectionedDataSourceContainerViewType();
  uint64_t v51 = *(void *)(v0 - 8);
  uint64_t v52 = v0;
  __chkstk_darwin(v0);
  uint64_t v50 = (char *)v36 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C348(0, &qword_100104850, (uint64_t (*)(uint64_t))&type metadata accessor for UIBackgroundConfiguration, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v2 - 8);
  unint64_t v49 = (char *)v36 - v3;
  uint64_t v4 = type metadata accessor for CellDeselectionBehavior();
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  __chkstk_darwin(v4);
  uint64_t v46 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C348(0, &qword_100104AB8, (uint64_t (*)(uint64_t))&type metadata accessor for UICellAccessory.LayoutDimension, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v6 - 8);
  char v41 = (char *)v36 - v7;
  uint64_t v44 = type metadata accessor for UICellAccessory.DisclosureIndicatorOptions();
  uint64_t v43 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v9 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = type metadata accessor for UICellAccessory.DisplayedState();
  uint64_t v10 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v12 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for UUID();
  uint64_t v37 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C348(0, &qword_100104858, (uint64_t (*)(uint64_t))&type metadata accessor for ArrayDataSourceSection, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v17 = *(void *)(type metadata accessor for ArrayDataSourceSection() - 8);
  unint64_t v18 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v19 = swift_allocObject();
  long long v53 = xmmword_1000CBFD0;
  uint64_t v45 = v19;
  *(_OWORD *)(v19 + 16) = xmmword_1000CBFD0;
  unint64_t v42 = v19 + v18;
  sub_10001C348(0, (unint64_t *)&qword_100104860, (uint64_t (*)(uint64_t))sub_10001AE44, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = v53;
  *(void *)(v20 + 56) = type metadata accessor for ContentConfigurationItem();
  *(void *)(v20 + 64) = sub_1000C0998(&qword_100104870, (void (*)(uint64_t))&type metadata accessor for ContentConfigurationItem);
  v36[2] = sub_100004F38((uint64_t *)(v20 + 32));
  UUID.init()();
  v36[1] = UUID.uuidString.getter();
  v36[0] = v21;
  uint64_t v22 = *(void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v38 = v14 + 8;
  uint64_t v39 = v22;
  v22(v16, v13);
  v55[3] = type metadata accessor for UIListContentConfiguration();
  v55[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
  sub_100004F38(v55);
  static UIListContentConfiguration.cell()();
  UIListContentConfiguration.text.setter();
  id v23 = [self blackColor];
  uint64_t v24 = (void (*)(char *, void))UIListContentConfiguration.textProperties.modify();
  UIListContentConfiguration.TextProperties.color.setter();
  v24(v54, 0);
  sub_10001C348(0, &qword_100104AC0, (uint64_t (*)(uint64_t))&type metadata accessor for UICellAccessory, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  type metadata accessor for UICellAccessory();
  *(_OWORD *)(swift_allocObject() + 16) = v53;
  uint64_t v25 = v40;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for UICellAccessory.DisplayedState.always(_:), v40);
  uint64_t v26 = type metadata accessor for UICellAccessory.LayoutDimension();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v41, 1, 1, v26);
  UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)();
  static UICellAccessory.disclosureIndicator(displayed:options:)();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v9, v44);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v25);
  (*(void (**)(char *, void, uint64_t))(v47 + 104))(v46, enum case for CellDeselectionBehavior.default(_:), v48);
  uint64_t v27 = type metadata accessor for UIBackgroundConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v49, 1, 1, v27);
  (*(void (**)(char *, void, uint64_t))(v51 + 104))(v50, enum case for SectionedDataSourceContainerViewType.collectionView(_:), v52);
  ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)();
  UUID.init()();
  UUID.uuidString.getter();
  uint64_t v28 = v37;
  uint64_t v29 = v39;
  v39(v16, v37);
  ArrayDataSourceSection.init(title:arrangedItems:identifier:)();
  v55[0] = 0x3C53447961727241;
  v55[1] = 0xE800000000000000;
  UUID.init()();
  uint64_t v30 = UUID.uuidString.getter();
  uint64_t v32 = v31;
  v29(v16, v28);
  v33._countAndFlagsBits = v30;
  v33._object = v32;
  String.append(_:)(v33);
  swift_bridgeObjectRelease();
  v34._countAndFlagsBits = 62;
  v34._object = (void *)0xE100000000000000;
  String.append(_:)(v34);
  return ArrayDataSource.init(arrangedSections:identifier:)();
}

void sub_1000C06C4(void *a1)
{
  type metadata accessor for DiskHealthExperienceStore();
  static DiskHealthExperienceStore.shared.getter();
  type metadata accessor for AllFeedItemsListDataSourceProvider();
  swift_allocObject();
  AllFeedItemsListDataSourceProvider.init(for:)();
  dispatch thunk of AllFeedItemsListDataSourceProvider.selectedDataSources(for:)();
  type metadata accessor for CompoundSectionedDataSource();
  swift_allocObject();
  CompoundSectionedDataSource.init(_:)();
  id v2 = objc_allocWithZone((Class)type metadata accessor for CompoundDataSourceCollectionViewController());
  swift_retain();
  id v3 = (id)CompoundDataSourceCollectionViewController.init(dataSource:)();
  [a1 showViewController:v3 sender:0];
  swift_release();
  swift_release();
}

void sub_1000C07CC()
{
}

void sub_1000C07E8()
{
}

void sub_1000C0804()
{
}

uint64_t sub_1000C0830()
{
  return type metadata accessor for AllFeedItemsDataSource();
}

unint64_t sub_1000C0838@<X0>(uint64_t *a1@<X8>)
{
  return sub_10002BFF4(a1);
}

uint64_t sub_1000C08B4(uint64_t a1, uint64_t a2)
{
  return sub_10002B8D0(a1, a2);
}

uint64_t sub_1000C0914(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1000C0998(&qword_100108618, (void (*)(uint64_t))type metadata accessor for AllFeedItemsDataSource);
  uint64_t result = sub_1000C0998(&qword_100108620, (void (*)(uint64_t))type metadata accessor for AllFeedItemsDataSource);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_1000C0998(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for UserDefaultsDataSource()
{
  uint64_t result = qword_100108628;
  if (!qword_100108628) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000C0A2C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000C0A6C()
{
  uint64_t v0 = type metadata accessor for SectionedDataSourceContainerViewType();
  uint64_t v35 = *(void *)(v0 - 8);
  uint64_t v36 = v0;
  __chkstk_darwin(v0);
  Swift::String v34 = (char *)v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C3AC(0, &qword_100104850, (uint64_t (*)(uint64_t))&type metadata accessor for UIBackgroundConfiguration, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v2 - 8);
  uint64_t v32 = (char *)v26 - v3;
  uint64_t v31 = type metadata accessor for CellDeselectionBehavior();
  uint64_t v29 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v28 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C3AC(0, &qword_100104858, (uint64_t (*)(uint64_t))&type metadata accessor for ArrayDataSourceSection, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v10 = *(void *)(type metadata accessor for ArrayDataSourceSection() - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = swift_allocObject();
  long long v27 = xmmword_1000CBFD0;
  uint64_t v33 = v12;
  *(_OWORD *)(v12 + 16) = xmmword_1000CBFD0;
  unint64_t v30 = v12 + v11;
  sub_10001C3AC(0, (unint64_t *)&qword_100104860, (uint64_t (*)(uint64_t))sub_10001AE44, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = v27;
  type metadata accessor for HealthAppPluginSource();
  static HealthAppPluginSource.disabledHealthPluginsDefaultsKey.getter();
  *(void *)(v13 + 56) = type metadata accessor for ContentConfigurationItem();
  *(void *)(v13 + 64) = sub_1000C13F8(&qword_100104870, (void (*)(uint64_t))&type metadata accessor for ContentConfigurationItem);
  *(void *)&long long v27 = sub_100004F38((uint64_t *)(v13 + 32));
  UUID.init()();
  v26[1] = UUID.uuidString.getter();
  v26[0] = v14;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  v38[3] = type metadata accessor for UIListContentConfiguration();
  v38[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
  sub_100004F38(v38);
  static UIListContentConfiguration.cell()();
  swift_bridgeObjectRetain();
  UIListContentConfiguration.text.setter();
  id v16 = [self tintColor];
  uint64_t v17 = (void (*)(char *, void))UIListContentConfiguration.textProperties.modify();
  UIListContentConfiguration.TextProperties.color.setter();
  v17(v37, 0);
  *uint64_t v5 = 1;
  (*(void (**)(unsigned char *, void, uint64_t))(v29 + 104))(v5, enum case for CellDeselectionBehavior.deselectOnDidSelect(_:), v31);
  swift_bridgeObjectRelease();
  uint64_t v18 = type metadata accessor for UIBackgroundConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v32, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v35 + 104))(v34, enum case for SectionedDataSourceContainerViewType.collectionView(_:), v36);
  ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)();
  UUID.init()();
  UUID.uuidString.getter();
  uint64_t v19 = v28;
  v15(v9, v28);
  ArrayDataSourceSection.init(title:arrangedItems:identifier:)();
  v38[0] = 0x3C53447961727241;
  v38[1] = 0xE800000000000000;
  UUID.init()();
  uint64_t v20 = UUID.uuidString.getter();
  uint64_t v22 = v21;
  v15(v9, v19);
  v23._countAndFlagsBits = v20;
  v23._object = v22;
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  v24._countAndFlagsBits = 62;
  v24._object = (void *)0xE100000000000000;
  String.append(_:)(v24);
  return ArrayDataSource.init(arrangedSections:identifier:)();
}

void sub_1000C10A4(void *a1)
{
  type metadata accessor for HealthAppPluginSource();
  static HealthAppPluginSource.disabledHealthPluginsDefaultsKey.getter();
  type metadata accessor for FoundationPluginBundleProvider();
  static FoundationPluginBundleProvider.sharedInstance.getter();
  dispatch thunk of PluginBundleProvider.disabledPlugins.getter();
  swift_release();
  Array.description.getter();
  swift_bridgeObjectRelease();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v4 = [self alertControllerWithTitle:v2 message:v3 preferredStyle:1];

  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [self actionWithTitle:v5 style:0 handler:0];

  [v4 addAction:v6];
  [a1 presentViewController:v4 animated:1 completion:0];
}

void sub_1000C122C()
{
}

void sub_1000C1248()
{
}

void sub_1000C1264()
{
}

uint64_t sub_1000C1290()
{
  return type metadata accessor for UserDefaultsDataSource();
}

unint64_t sub_1000C1298@<X0>(uint64_t *a1@<X8>)
{
  return sub_10002BFF4(a1);
}

uint64_t sub_1000C1314(uint64_t a1, uint64_t a2)
{
  return sub_10002B8D0(a1, a2);
}

uint64_t sub_1000C1374(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1000C13F8(&qword_100108678, (void (*)(uint64_t))type metadata accessor for UserDefaultsDataSource);
  uint64_t result = sub_1000C13F8((unint64_t *)&unk_100108680, (void (*)(uint64_t))type metadata accessor for UserDefaultsDataSource);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_1000C13F8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for MainSidebarViewController()
{
  uint64_t result = qword_1001086B0;
  if (!qword_1001086B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000C148C()
{
  type metadata accessor for Presentation();
  if (v0 <= 0x3F)
  {
    sub_1000202CC();
    if (v1 <= 0x3F) {
      swift_initClassMetadata2();
    }
  }
}

uint64_t sub_1000C158C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000C3E94(0);
  uint64_t result = __chkstk_darwin(v9 - 8);
  uint64_t v43 = (char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v44 = v2;
  uint64_t v12 = (uint64_t *)&v2[qword_100108E78];
  uint64_t v14 = *(void *)&v2[qword_100108E78];
  uint64_t v13 = *(void *)&v2[qword_100108E78 + 8];
  if (a2)
  {
    if (!v13) {
      goto LABEL_22;
    }
    if (v14 == a1 && v13 == a2) {
      return result;
    }
    uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
    if (result) {
      return result;
    }
  }
  else if (!v13)
  {
    return result;
  }
  swift_bridgeObjectRetain();
  dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter();
  uint64_t v16 = dispatch thunk of CompoundSectionedDataSource.firstFullIdentifier(itemIdentifier:)();
  uint64_t v18 = v17;
  swift_release();
  if (v18)
  {
    if (v14 != v16 || v18 != v13)
    {
      char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v20)
      {
LABEL_18:
        sub_1000C3410(v16, v18, 1, 2);
        return swift_bridgeObjectRelease();
      }
      *uint64_t v12 = v16;
      v12[1] = v18;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  swift_bridgeObjectRelease();
LABEL_22:
  uint64_t result = (uint64_t)[v44 collectionView];
  if (result)
  {
    uint64_t v21 = (void *)result;
    id v22 = [(id)result indexPathsForSelectedItems];

    Swift::String v23 = v8;
    if (v22)
    {
      Swift::String v24 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {
      Swift::String v24 = _swiftEmptyArrayStorage;
    }
    uint64_t v25 = v43;
    uint64_t v26 = v24[2];
    if (v26)
    {
      uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
      uint64_t v27 = v6 + 16;
      uint64_t v29 = (char *)v24 + ((*(unsigned __int8 *)(v27 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 64));
      uint64_t v30 = *(void *)(v27 + 56);
      v38[1] = v24;
      uint64_t v39 = v30;
      uint64_t v31 = v27;
      uint64_t v32 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 40);
      uint64_t v33 = (unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 32);
      uint64_t v40 = (void (**)(char *, char *, uint64_t))(v31 + 16);
      char v41 = v28;
      uint64_t v42 = v31;
      Swift::String v34 = (void (**)(char *, uint64_t))(v31 - 8);
      v38[0] = (unint64_t)v32 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      while (1)
      {
        v41(v25, v29, v5);
        uint64_t v35 = *v32;
        (*v32)(v25, 0, 1, v5);
        if ((*v33)(v25, 1, v5) == 1) {
          break;
        }
        (*v40)(v23, v25, v5);
        uint64_t result = (uint64_t)[v44 collectionView:v38[0]];
        if (!result)
        {
          __break(1u);
          goto LABEL_37;
        }
        uint64_t v36 = (void *)result;
        Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
        [v36 deselectItemAtIndexPath:isa animated:1];

        (*v34)(v23, v5);
        v29 += v39;
        --v26;
        uint64_t v25 = v43;
        if (!v26) {
          goto LABEL_33;
        }
      }
    }
    else
    {
      uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
LABEL_33:
      v35(v25, 1, 1, v5);
    }
    return swift_bridgeObjectRelease();
  }
  else
  {
LABEL_37:
    __break(1u);
  }
  return result;
}

uint64_t sub_1000C19A0(void *a1)
{
  sub_1000202CC();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static NSDiffableDataSourceSnapshot._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a1;
  sub_1000C41A4((uint64_t)v6);

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_1000C1AA0(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_1000C44B8();
}

id sub_1000C1AC8()
{
  uint64_t v1 = qword_1001086A8;
  uint64_t v2 = *(void **)(v0 + qword_1001086A8);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_1001086A8);
  }
  else
  {
    sub_1000C1B2C(v0);
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_1000C1B2C(uint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)UISearchController) initWithSearchResultsController:0];
  [v2 setDelegate:a1];
  id v3 = [v2 searchBar];
  type metadata accessor for HackyUnfocusableUISearchTextField();
  [v3 _setClassForSearchTextField:swift_getObjCClassFromMetadata()];

  id v4 = [v2 searchBar];
  id v5 = [v4 searchTextField];

  _StringGuts.grow(_:)(29);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 0xD00000000000001BLL;
  v6._object = (void *)0x80000001000D83A0;
  String.append(_:)(v6);
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v5 setAccessibilityIdentifier:v7];

  id v8 = [v2 searchBar];
  id v9 = [v8 searchTextField];

  id v10 = [v9 _clearButton];
  if (v10)
  {
    _StringGuts.grow(_:)(31);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_bridgeObjectRelease();
    v11._countAndFlagsBits = 0xD00000000000001DLL;
    v11._object = (void *)0x80000001000D83C0;
    String.append(_:)(v11);
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v10 setAccessibilityIdentifier:v12];

    id v13 = [v2 searchBar];
    [v13 setDelegate:a1];

    id v14 = [v2 searchBar];
    id v15 = [self mainBundle];
    v20._object = (void *)0x80000001000D83E0;
    v16._countAndFlagsBits = 0x686372616553;
    v16._object = (void *)0xE600000000000000;
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    v20._countAndFlagsBits = 0xD000000000000016;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v20);

    NSString v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v14 setPlaceholder:v18];

    id v19 = [v2 navigationItem];
    [v19 setPreferredSearchBarPlacement:2];

    [v2 setHidesNavigationBarDuringPresentation:0];
    [v2 setAutomaticallyShowsCancelButton:0];
  }
  else
  {
    __break(1u);
  }
}

void sub_1000C1ED4()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for MainSidebarViewController();
  [super viewDidLoad];
  dispatch thunk of CompoundDataSourceCollectionViewController.usesAdaptiveMargins.setter();
  [v0 setClearsSelectionOnViewWillAppear:0];
  id v1 = [v0 collectionView];
  if (v1)
  {
    id v2 = v1;
    [v1 setPreservesSuperviewLayoutMargins:1];

    id v3 = [v0 navigationItem];
    id v4 = sub_1000C1AC8();
    [v3 setSearchController:v4];
  }
  else
  {
    __break(1u);
  }
}

void sub_1000C1FA8(void *a1)
{
  id v1 = a1;
  sub_1000C1ED4();
}

void sub_1000C1FF0(char a1)
{
  id v2 = v1;
  v19.receiver = v2;
  v19.super_class = (Class)type metadata accessor for MainSidebarViewController();
  [super viewIsAppearing:a1 & 1];
  id v4 = [v2 collectionView];
  if (!v4)
  {
    __break(1u);
    return;
  }
  objc_super v5 = v4;
  id v6 = [v4 indexPathsForSelectedItems];

  if (!v6
    || (type metadata accessor for IndexPath(),
        uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(),
        v6,
        uint64_t v8 = *(void *)(v7 + 16),
        swift_bridgeObjectRelease(),
        !v8))
  {
    id v9 = (uint64_t *)&v2[qword_100108E78];
    uint64_t v10 = *(void *)&v2[qword_100108E78 + 8];
    if (v10)
    {
      uint64_t v11 = *v9;
      swift_bridgeObjectRetain();
      dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter();
      uint64_t v12 = dispatch thunk of CompoundSectionedDataSource.firstFullIdentifier(itemIdentifier:)();
      uint64_t v14 = v13;
      swift_release();
      if (!v14)
      {
LABEL_14:
        swift_bridgeObjectRelease();
        return;
      }
      if (v11 != v12 || v10 != v14)
      {
        char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v16)
        {
LABEL_13:
          sub_1000C3410(v12, v14, 0, 0);
          goto LABEL_14;
        }
        uint64_t v17 = *v9;
        uint64_t v18 = v9[1];
        *id v9 = v12;
        v9[1] = v14;
        swift_bridgeObjectRetain();
        sub_1000C158C(v17, v18);
      }
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
  }
}

void sub_1000C2194(void *a1, uint64_t a2, char a3)
{
  id v4 = a1;
  sub_1000C1FF0(a3);
}

void sub_1000C21E8(void *a1, uint64_t a2, uint64_t a3)
{
  v6.receiver = a1;
  v6.super_class = (Class)type metadata accessor for MainSidebarViewController();
  id v4 = v6.receiver;
  [super viewWillAppear:a3];
  id v5 = [v4 navigationItem];
  [v5 setHidesSearchBarWhenScrolling:0];
}

void sub_1000C227C(void *a1, uint64_t a2, uint64_t a3)
{
  v6.receiver = a1;
  v6.super_class = (Class)type metadata accessor for MainSidebarViewController();
  id v4 = v6.receiver;
  [super viewDidAppear:a3];
  id v5 = [v4 navigationItem];
  [v5 setHidesSearchBarWhenScrolling:1];
}

void sub_1000C2310(void *a1, uint64_t a2, void *a3)
{
  v8.receiver = a1;
  v8.super_class = (Class)type metadata accessor for MainSidebarViewController();
  id v4 = a3;
  id v5 = v8.receiver;
  [super traitCollectionDidChange:v4];
  id v6 = [v5 navigationItem];
  id v7 = sub_1000C1AC8();
  [v6 setSearchController:v7];
}

void sub_1000C23C0()
{
  id v1 = v0;
  type metadata accessor for CollapsibleListCollectionViewController();
  id v2 = (void (*)(void))method lookup function for CompoundDataSourceCollectionViewController();
  v2();
  id v3 = [v0 collectionView];
  if (!v3)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v4 = v3;
  type metadata accessor for SidebarListCell();
  UICollectionView.registerCell<A>(_:)();

  id v5 = [v1 collectionView];
  if (!v5)
  {
LABEL_7:
    __break(1u);
    return;
  }
  type metadata accessor for CollectionViewHeaderCell();
  UICollectionView.registerCell<A>(_:)();
}

uint64_t sub_1000C24A8(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  objc_super v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a1;
  id v11 = sub_1000C1AC8();
  id v12 = [v11 searchBar];

  id v13 = [v12 searchTextField];
  LODWORD(v12) = [v13 isEditing];

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v12 ^ 1;
}

unint64_t sub_1000C2604(void *a1)
{
  id v2 = v1;
  id v61 = a1;
  sub_1000C3E94(0);
  __chkstk_darwin(v3 - 8);
  uint64_t v57 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v58 = *(void *)(v5 - 8);
  uint64_t v59 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v54 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v55 = (char *)&v53 - v8;
  sub_1000C47E4(0);
  __chkstk_darwin(v9 - 8);
  unint64_t v60 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000202CC();
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v11 - 8);
  uint64_t v14 = __chkstk_darwin(v11);
  char v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v53 - v17;
  dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter();
  dispatch thunk of CompoundSectionedDataSource.snapshot.getter();
  swift_release();
  dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter();
  dispatch thunk of CompoundSectionedDataSource.snapshot.getter();
  swift_release();
  uint64_t v19 = NSDiffableDataSourceSnapshot.sectionIdentifiers.getter();
  Swift::String v20 = *(void (**)(char *, uint64_t))(v13 + 8);
  v20(v16, v12);
  unint64_t result = IndexPath.section.getter();
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_31;
  }
  if (result >= *(void *)(v19 + 16))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  unint64_t v22 = v19 + 16 * result;
  uint64_t v23 = *(void *)(v22 + 32);
  uint64_t v24 = *(void *)(v22 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v64[0] = v23;
  v64[1] = v24;
  uint64_t v25 = NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)();
  swift_bridgeObjectRelease();
  v20(v18, v12);
  unint64_t result = IndexPath.item.getter();
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (result >= *(void *)(v25 + 16))
  {
LABEL_33:
    __break(1u);
    return result;
  }
  uint64_t v56 = v20;
  unint64_t v26 = v25 + 16 * result;
  uint64_t v27 = *(void *)(v26 + 32);
  uint64_t v28 = *(void *)(v26 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = (uint64_t *)&v2[qword_100108E78];
  uint64_t v30 = *(void *)&v2[qword_100108E78 + 8];
  if (!v30 || (*v29 != v27 || v30 != v28) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    uint64_t v53 = v27;
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    uint64_t v32 = (objc_class *)type metadata accessor for MainSidebarViewController();
    v65.receiver = v2;
    v65.super_class = v32;
    [super collectionView:didSelectItemAtIndexPath:v61];

    CompoundDataSourceCollectionViewController.selectableHandler(in:at:)();
    sub_1000C487C((uint64_t)v64, (uint64_t)v62);
    if (v63)
    {
      sub_1000190DC(v62, v63);
      uint64_t v33 = (uint64_t)v60;
      dispatch thunk of CellSelectionHandling.deselectionBehavior(in:)();
      uint64_t v34 = type metadata accessor for CellDeselectionBehavior();
      uint64_t v35 = *(void *)(v34 - 8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v35 + 56))(v33, 0, 1, v34);
      _s6Health23OpenSleepScheduleIntentVwxx_0((uint64_t)v62);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34) != 1)
      {
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v35 + 88))(v33, v34) == enum case for CellDeselectionBehavior.deselectOnDidSelect(_:))
        {
          swift_bridgeObjectRelease();
          uint64_t v36 = v29[1];
          if (v36)
          {
            uint64_t v37 = *v29;
            swift_bridgeObjectRetain();
            dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter();
            dispatch thunk of CompoundSectionedDataSource.snapshot.getter();
            swift_release();
            v62[0] = v37;
            v62[1] = v36;
            uint64_t v38 = (uint64_t)v57;
            NSDiffableDataSourceSnapshot.indexPath(for:)();
            v56(v18, v12);
            swift_bridgeObjectRelease();
            uint64_t v40 = v58;
            uint64_t v39 = v59;
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v38, 1, v59) == 1)
            {
              sub_100012044(v38, (uint64_t (*)(void))sub_1000C3E94);
            }
            else
            {
              id v44 = v55;
              (*(void (**)(char *, uint64_t, uint64_t))(v40 + 32))(v55, v38, v39);
              uint64_t v45 = IndexPath.section.getter();
              id v46 = v61;
              id v47 = [v61 numberOfSections];
              uint64_t v48 = v54;
              (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v54, v44, v39);
              if (v45 >= (uint64_t)v47)
              {
                uint64_t v51 = *(void (**)(char *, uint64_t))(v40 + 8);
                v51(v48, v39);
              }
              else
              {
                uint64_t v49 = IndexPath.item.getter();
                id v50 = [v46 numberOfItemsInSection:IndexPath.section.getter()];
                uint64_t v51 = *(void (**)(char *, uint64_t))(v40 + 8);
                v51(v48, v39);
                if (v49 < (uint64_t)v50)
                {
                  Class v52 = IndexPath._bridgeToObjectiveC()().super.isa;
                  [v46 selectItemAtIndexPath:v52 animated:1 scrollPosition:0];

                  v51(v44, v39);
                  return sub_1000C48F8((uint64_t)v64, &qword_100106A38, &qword_100106A30);
                }
              }
              v51(v44, v39);
            }
          }
          uint64_t v42 = *v29;
          uint64_t v43 = v29[1];
          *uint64_t v29 = 0;
          v29[1] = 0;
LABEL_20:
          sub_1000C158C(v42, v43);
          swift_bridgeObjectRelease();
          return sub_1000C48F8((uint64_t)v64, &qword_100106A38, &qword_100106A30);
        }
        (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v33, v34);
LABEL_19:
        uint64_t v42 = *v29;
        uint64_t v43 = v29[1];
        *uint64_t v29 = v53;
        v29[1] = v28;
        goto LABEL_20;
      }
    }
    else
    {
      sub_1000C48F8((uint64_t)v62, &qword_100106A38, &qword_100106A30);
      uint64_t v41 = type metadata accessor for CellDeselectionBehavior();
      uint64_t v33 = (uint64_t)v60;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v60, 1, 1, v41);
    }
    sub_100012044(v33, (uint64_t (*)(void))sub_1000C47E4);
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  unint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    sub_100062898();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1000C2DBC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a1;
  sub_1000C2604(v9);

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000C2EB8(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a4)
  {
    id v6 = a3;
    id v7 = a1;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    id v8 = a3;
    id v9 = a1;
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_1000654A4(a3);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  return sub_100012044((uint64_t)v11, (uint64_t (*)(void))sub_1000C4788);
}

uint64_t sub_1000C2F80(void *a1)
{
  uint64_t v2 = v1;
  sub_1000202CC();
  uint64_t v5 = v4;
  uint64_t v45 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v44 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000C3E94(0);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000C4818(0, (unint64_t *)&unk_100108810, (uint64_t (*)(uint64_t))sub_1000C4A0C, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1000CBFD0;
  *(void *)(v10 + 32) = a1;
  uint64_t v47 = v10;
  specialized Array._endMutation()();
  uint64_t v11 = v47;
  uint64_t v49 = v47;
  if (a1)
  {
    self;
    uint64_t v12 = swift_dynamicCastObjCClass();
    id v13 = a1;
    if (v12)
    {
      UINavigationController.rootViewController()();
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)(v49 + 16) >= *(void *)(v49 + 24) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      uint64_t v11 = v49;
    }
  }
  uint64_t v14 = *(void *)(v11 + 16);
  if (v14)
  {
    uint64_t v41 = v5;
    uint64_t v42 = v9;
    uint64_t v43 = v2;
    swift_bridgeObjectRetain_n();
    uint64_t v15 = 0;
    char v16 = (char *)_swiftEmptyArrayStorage;
    do
    {
      uint64_t v17 = *(void **)(v11 + 8 * v15 + 32);
      if (v17)
      {
        id v46 = &OBJC_PROTOCOL___HKSidebarSelectionIdentifierProviding;
        uint64_t v18 = swift_dynamicCastObjCProtocolConditional();
        if (v18)
        {
          uint64_t v19 = (void *)v18;
          id v20 = v17;
          id v21 = [v19 sidebarSelectionIdentifier];
          if (v21)
          {
            unint64_t v22 = v21;
            uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v25 = v24;

            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              char v16 = sub_1000369DC(0, *((void *)v16 + 2) + 1, 1, v16);
            }
            unint64_t v27 = *((void *)v16 + 2);
            unint64_t v26 = *((void *)v16 + 3);
            if (v27 >= v26 >> 1) {
              char v16 = sub_1000369DC((char *)(v26 > 1), v27 + 1, 1, v16);
            }
            *((void *)v16 + 2) = v27 + 1;
            uint64_t v28 = &v16[16 * v27];
            *((void *)v28 + 4) = v23;
            *((void *)v28 + 5) = v25;
          }
          else
          {
          }
        }
      }
      ++v15;
    }
    while (v14 != v15);
    swift_bridgeObjectRelease_n();
    id v9 = v42;
    uint64_t v2 = v43;
    uint64_t v5 = v41;
  }
  else
  {
    char v16 = (char *)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  if (*((void *)v16 + 2))
  {
    uint64_t v30 = *((void *)v16 + 4);
    uint64_t v29 = *((void *)v16 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter();
    uint64_t v31 = dispatch thunk of CompoundSectionedDataSource.firstFullIdentifier(itemIdentifier:)();
    uint64_t v33 = v32;
    swift_release();
    if (v33)
    {
      dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter();
      uint64_t v34 = v44;
      dispatch thunk of CompoundSectionedDataSource.snapshot.getter();
      swift_release();
      uint64_t v47 = v31;
      uint64_t v48 = v33;
      NSDiffableDataSourceSnapshot.indexPath(for:)();
      (*(void (**)(char *, uint64_t))(v45 + 8))(v34, v5);
      swift_bridgeObjectRelease();
      uint64_t v35 = type metadata accessor for IndexPath();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 48))(v9, 1, v35) == 1)
      {
        swift_bridgeObjectRelease();
        return sub_100012044((uint64_t)v9, (uint64_t (*)(void))sub_1000C3E94);
      }
      sub_100012044((uint64_t)v9, (uint64_t (*)(void))sub_1000C3E94);
      uint64_t v37 = (void *)(v2 + qword_100108E78);
      uint64_t v38 = *(void *)(v2 + qword_100108E78);
      uint64_t v39 = *(void *)(v2 + qword_100108E78 + 8);
      *uint64_t v37 = v30;
      v37[1] = v29;
      sub_1000C158C(v38, v39);
    }
  }
  return swift_bridgeObjectRelease();
}

id sub_1000C3410(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v40 = a4;
  int v39 = a3;
  uint64_t v42 = a2;
  sub_1000202CC();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v10 = &v38[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000C3E94(0);
  __chkstk_darwin(v11 - 8);
  id v13 = &v38[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = type metadata accessor for IndexPath();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = &v38[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v16);
  id v20 = &v38[-v19];
  id v41 = v4;
  dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter();
  dispatch thunk of CompoundSectionedDataSource.snapshot.getter();
  swift_release();
  uint64_t v43 = a1;
  uint64_t v44 = v42;
  NSDiffableDataSourceSnapshot.indexPath(for:)();
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1) {
    return (id)sub_100012044((uint64_t)v13, (uint64_t (*)(void))sub_1000C3E94);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v15 + 32))(v20, v13, v14);
  id v22 = v41;
  id result = [v41 collectionView];
  if (!result)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v23 = result;
  uint64_t v24 = v20;
  uint64_t v25 = v22;
  uint64_t v26 = IndexPath.section.getter();
  id v27 = [v23 numberOfSections];
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v15 + 16))(v18, v24, v14);
  if (v26 >= (uint64_t)v27)
  {
    uint64_t v30 = *(void (**)(unsigned char *, uint64_t))(v15 + 8);
    v30(v18, v14);

    return (id)((uint64_t (*)(unsigned char *, uint64_t))v30)(v24, v14);
  }
  uint64_t v28 = IndexPath.item.getter();
  id v29 = [v23 numberOfItemsInSection:IndexPath.section.getter()];
  uint64_t v30 = *(void (**)(unsigned char *, uint64_t))(v15 + 8);
  v30(v18, v14);

  if (v28 >= (uint64_t)v29) {
    return (id)((uint64_t (*)(unsigned char *, uint64_t))v30)(v24, v14);
  }
  id result = [v25 collectionView];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v31 = result;
  id v32 = [result indexPathsForSelectedItems];

  if (v32)
  {
    uint64_t v34 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v34 = _swiftEmptyArrayStorage;
  }
  __chkstk_darwin(v33);
  *(void *)&v38[-16] = v24;
  BOOL v35 = sub_1000C3EC8((uint64_t (*)(char *))sub_1000C4954, (uint64_t)&v38[-32], (uint64_t)v34);
  swift_bridgeObjectRelease();
  if (v35) {
    return (id)((uint64_t (*)(unsigned char *, uint64_t))v30)(v24, v14);
  }
  id result = [v25 collectionView];
  if (!result)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  uint64_t v36 = result;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  [v36 selectItemAtIndexPath:isa animated:v39 & 1 scrollPosition:v40];

  return (id)((uint64_t (*)(unsigned char *, uint64_t))v30)(v24, v14);
}

void sub_1000C3898(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_1000C45F0();
}

void sub_1000C38F8(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_1000C46BC();
}

void sub_1000C3958(void *a1, uint64_t a2, void *a3)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v5 = a3;
    id v6 = a1;
    sub_1000625CC();
    id v7 = sub_10005FDC8();
    dispatch thunk of BrowseViewController.searchTextDidChange(_:)();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void sub_1000C3A48()
{
}

void sub_1000C3A78(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1000C3AAC()
{
  uint64_t v1 = v0 + qword_100108E68;
  uint64_t v2 = type metadata accessor for Presentation();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_100070F10(v0 + qword_100108E70);
  swift_bridgeObjectRelease();
  _s6Health23OpenSleepScheduleIntentVwxx_0(v0 + qword_100108690);
  swift_release();
  uint64_t v3 = v0 + qword_1001086A0;
  sub_1000202CC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = *(void **)(v0 + qword_1001086A8);
}

id sub_1000C3BB0()
{
  return sub_1000C3E30((uint64_t (*)(void))type metadata accessor for MainSidebarViewController);
}

void sub_1000C3BC8(uint64_t a1)
{
  uint64_t v2 = a1 + qword_100108E68;
  uint64_t v3 = type metadata accessor for Presentation();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  sub_100070F10(a1 + qword_100108E70);
  swift_bridgeObjectRelease();
  _s6Health23OpenSleepScheduleIntentVwxx_0(a1 + qword_100108690);
  swift_release();
  uint64_t v4 = a1 + qword_1001086A0;
  sub_1000202CC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  id v6 = *(void **)(a1 + qword_1001086A8);
}

uint64_t sub_1000C3CD0()
{
  return type metadata accessor for MainSidebarViewController();
}

uint64_t sub_1000C3CD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + qword_100108E68;
  uint64_t v4 = type metadata accessor for Presentation();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

id sub_1000C3E18()
{
  return sub_1000C3E30((uint64_t (*)(void))type metadata accessor for HackyUnfocusableUISearchTextField);
}

id sub_1000C3E30(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return [super dealloc];
}

uint64_t type metadata accessor for HackyUnfocusableUISearchTextField()
{
  return self;
}

void sub_1000C3E94(uint64_t a1)
{
}

BOOL sub_1000C3EC8(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v38 = a1;
  uint64_t v39 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000C3E94(0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a3 + 16);
  if (v12)
  {
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v13 = v6 + 16;
    uint64_t v37 = v14;
    uint64_t v15 = a3 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
    uint64_t v16 = *(void *)(v13 + 56);
    uint64_t v34 = v8;
    BOOL v35 = (uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 32);
    uint64_t v31 = v16;
    id v32 = (void (**)(char *))(v13 + 16);
    uint64_t v33 = (void (**)(char *, uint64_t))(v13 - 8);
    v29[2] = a3;
    swift_bridgeObjectRetain();
    uint64_t v36 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 40);
    v29[1] = (v13 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    while (1)
    {
      uint64_t v17 = v39;
      uint64_t v18 = v13;
      v37(v11, v15, v39);
      uint64_t v19 = *v36;
      (*v36)(v11, 0, 1, v17);
      int v20 = (*v35)(v11, 1, v17);
      BOOL v21 = v20 != 1;
      if (v20 == 1) {
        break;
      }
      uint64_t v30 = v19;
      id v22 = v11;
      uint64_t v23 = v34;
      uint64_t v24 = v22;
      (*v32)(v34);
      char v25 = v38(v23);
      if (v4)
      {
        (*v33)(v23, v17);
        swift_bridgeObjectRelease();
        return v21;
      }
      char v26 = v25;
      (*v33)(v23, v17);
      if (v26) {
        break;
      }
      v15 += v31;
      --v12;
      uint64_t v4 = 0;
      uint64_t v13 = v18;
      uint64_t v11 = v24;
      if (!v12)
      {
        v30(v24, 1, 1, v39);
        goto LABEL_9;
      }
    }
  }
  else
  {
    id v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    swift_bridgeObjectRetain();
    v27(v11, 1, 1, v39);
LABEL_9:
    BOOL v21 = 0;
  }
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_1000C41A4(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_1000202CC();
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v8 = v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) + 22;
  uint64_t v9 = (uint64_t *)(v1 + qword_100108E78);
  uint64_t v10 = &qword_100108000;
  if (*(void *)(v1 + qword_100108E78 + 8))
  {
    swift_bridgeObjectRetain();
    dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter();
    dispatch thunk of CompoundSectionedDataSource.item(for:)();
    swift_release();
    if (v27)
    {
      swift_bridgeObjectRelease();
      sub_1000C48F8((uint64_t)v26, &qword_100106508, (unint64_t *)&qword_100106A40);
    }
    else
    {
      sub_1000C48F8((uint64_t)v26, &qword_100106508, (unint64_t *)&qword_100106A40);
      dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter();
      uint64_t v11 = dispatch thunk of CompoundSectionedDataSource.firstFullIdentifier(itemIdentifier:)();
      uint64_t v13 = v12;
      swift_release();
      swift_bridgeObjectRelease();
      if (v13)
      {
        uint64_t v14 = *v9;
        uint64_t v15 = v9[1];
        *uint64_t v9 = v11;
        v9[1] = v13;
        sub_1000C158C(v14, v15);
        swift_bridgeObjectRelease();
        uint64_t v10 = &qword_100108000;
      }
      else
      {
        uint64_t v16 = NSDiffableDataSourceSnapshot.numberOfItems.getter();
        uint64_t v10 = &qword_100108000;
        uint64_t v17 = v2 + qword_1001086A0;
        swift_beginAccess();
        (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(v8, v17, v5);
        uint64_t v18 = NSDiffableDataSourceSnapshot.numberOfItems.getter();
        (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
        if (v16 < v18)
        {
          dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter();
          type metadata accessor for CompoundSectionedDataSource();
          char v19 = SnapshotDataSource.isEmpty.getter();
          swift_release();
          if ((v19 & 1) == 0)
          {
            uint64_t Strong = swift_unknownObjectWeakLoadStrong();
            if (Strong)
            {
              BOOL v21 = (void *)Strong;
              id v22 = sub_10005FD54();
              [v21 setViewController:v22 forColumn:2];
              swift_unknownObjectRelease();
            }
          }
        }
      }
    }
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  uint64_t v23 = v2 + v10[212];
  swift_beginAccess();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v6 + 40))(v23, v8, v5);
  return swift_endAccess();
}

void sub_1000C44B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = &v0[qword_100108E68];
  uint64_t v3 = enum case for Presentation.sidebar(_:);
  uint64_t v4 = type metadata accessor for Presentation();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104))(v2, v3, v4);
  *(void *)&v1[qword_100108E70 + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = (uint64_t *)&v1[qword_100108E78];
  type metadata accessor for SidebarDataSourceItem();
  *uint64_t v5 = static SidebarDataSourceItem.summarySidebarItemIdentifier.getter();
  v5[1] = v6;
  *(void *)&v1[qword_100108698] = 0;
  NSDiffableDataSourceSnapshot.init()();
  *(void *)&v1[qword_1001086A8] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_1000C45F0()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = sub_10005FED0();

    id v3 = sub_10005FDC8();
    dispatch thunk of BrowseViewController.deactivateSearch()();

    id v4 = sub_10005FD54();
    [v1 setViewController:v4 forColumn:2];
    swift_unknownObjectRelease();
  }
}

void sub_1000C46BC()
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_1000625CC();
    uint64_t v1 = (void *)(v0 + qword_100108E78);
    uint64_t v2 = *(void *)(v0 + qword_100108E78);
    uint64_t v3 = *(void *)(v0 + qword_100108E78 + 8);
    void *v1 = 0;
    v1[1] = 0;
    sub_1000C158C(v2, v3);
    swift_bridgeObjectRelease();
    id v4 = sub_10005FDC8();
    id v5 = sub_1000C1AC8();
    dispatch thunk of BrowseViewController.setActiveSearchController(_:)();
    swift_unknownObjectRelease();
  }
}

void sub_1000C4788()
{
  if (!qword_1001059F0)
  {
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1001059F0);
    }
  }
}

void sub_1000C47E4(uint64_t a1)
{
}

void sub_1000C4818(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1000C487C(uint64_t a1, uint64_t a2)
{
  sub_10007590C(0, &qword_100106A38, &qword_100106A30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000C48F8(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  sub_10007590C(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1000C4954()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

unint64_t sub_1000C49B4()
{
  unint64_t result = qword_100108808;
  if (!qword_100108808)
  {
    type metadata accessor for IndexPath();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100108808);
  }
  return result;
}

void sub_1000C4A0C(uint64_t a1)
{
}

unint64_t sub_1000C4A40()
{
  unint64_t result = qword_100108820;
  if (!qword_100108820)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100108820);
  }
  return result;
}

id ConfigurationIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id ConfigurationIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigurationIntent();
  return [super init];
}

uint64_t type metadata accessor for ConfigurationIntent()
{
  return self;
}

id ConfigurationIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id ConfigurationIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntent();
  [super initWithCoder:a1];

  return v3;
}

id ConfigurationIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
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

id ConfigurationIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ConfigurationIntent();
  [super initWithIdentifier:v5 backingStore:a3];

  return v6;
}

id ConfigurationIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  id v10 = [objc_allocWithZone(v5) initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id ConfigurationIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for ConfigurationIntent();
  id v10 = [super initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id ConfigurationIntent.__deallocating_deinit()
{
  return sub_1000C5744(type metadata accessor for ConfigurationIntent);
}

unint64_t ConfigurationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_1000C577C(a1);
}

unint64_t sub_1000C50D8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_1000C577C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t ConfigurationIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___ConfigurationIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *ConfigurationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___ConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

char *ConfigurationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___ConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id ConfigurationIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  return [super init];
}

id ConfigurationIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  [super initWithCoder:a1];

  return v3;
}

id ConfigurationIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithBackingStore:a1];

  return v3;
}

id ConfigurationIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  [super initWithBackingStore:a1];

  return v3;
}

id sub_1000C554C(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  return [super a3];
}

id ConfigurationIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    v2.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  id v3 = [objc_allocWithZone(v1) initWithPropertiesByName:v2.super.isa];

  return v3;
}

id ConfigurationIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  [super initWithPropertiesByName:v2.super.isa];

  if (v3) {
  return v3;
  }
}

id ConfigurationIntentResponse.__deallocating_deinit()
{
  return sub_1000C5744(type metadata accessor for ConfigurationIntentResponse);
}

id sub_1000C5744(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

unint64_t sub_1000C577C(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for ConfigurationIntentResponse()
{
  return self;
}

unint64_t sub_1000C57B4()
{
  unint64_t result = qword_100108898;
  if (!qword_100108898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100108898);
  }
  return result;
}

uint64_t sub_1000C5808@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___ConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1000C585C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___ConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for ConfigurationIntentResponseCode()
{
  return &type metadata for ConfigurationIntentResponseCode;
}

id HealthDataType.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  id v11 = [objc_allocWithZone(v6) initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

id HealthDataType.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for HealthDataType();
  [super initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

uint64_t type metadata accessor for HealthDataType()
{
  return self;
}

id HealthDataType.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HealthDataType();
  [super initWithCoder:a1];

  return v3;
}

id HealthDataType.__deallocating_deinit()
{
  return sub_1000C6314(type metadata accessor for HealthDataType);
}

id static HealthDataTypeResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HealthDataTypeResolutionResult;
  [super successWithResolvedObject:a1];

  return v2;
}

id static HealthDataTypeResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_1000C5D9C();
    swift_bridgeObjectRetain();
    _bridgeCocoaArray<A>(_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
    sub_1000C5D9C();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_1000C5D9C();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___HealthDataTypeResolutionResult;
  [super disambiguationWithObjectsToDisambiguate:isa];

  return v3;
}

unint64_t sub_1000C5D9C()
{
  unint64_t result = qword_100108918;
  if (!qword_100108918)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100108918);
  }
  return result;
}

id static HealthDataTypeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HealthDataTypeResolutionResult;
  [super confirmationRequiredWithObjectToConfirm:a1];

  return v2;
}

void static HealthDataTypeResolutionResult.success(with:)()
{
}

void static HealthDataTypeResolutionResult.disambiguation(with:)()
{
}

void static HealthDataTypeResolutionResult.confirmationRequired(with:)()
{
}

id HealthDataTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithJSONDictionary:isa forIntent:a2];

  return v6;
}

id HealthDataTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HealthDataTypeResolutionResult();
  id v5 = [super initWithJSONDictionary:isa a2];

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for HealthDataTypeResolutionResult()
{
  return self;
}

id HealthDataTypeResolutionResult.__deallocating_deinit()
{
  return sub_1000C6314(type metadata accessor for HealthDataTypeResolutionResult);
}

id sub_1000C6314(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static _AssistantIntentsProvider.uniqueEntities.getter()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t AppDependency.wrappedValue.getter()
{
  return AppDependency.wrappedValue.getter();
}

uint64_t AppDependency.__allocating_init(key:manager:)()
{
  return AppDependency.__allocating_init(key:manager:)();
}

uint64_t type metadata accessor for AppDependency()
{
  return type metadata accessor for AppDependency();
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

uint64_t static AppIntent.isDiscoverable.getter()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t static AppIntent.parameterSummary.getter()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t static AppIntent.authenticationPolicy.getter()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t type metadata accessor for IntentItem()
{
  return type metadata accessor for IntentItem();
}

uint64_t IntentItem.init(_:)()
{
  return IntentItem.init(_:)();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t static IntentResult.result<>()()
{
  return static IntentResult.result<>()();
}

uint64_t IntentParameter.wrappedValue.modify()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t IntentParameter.wrappedValue.getter()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t IntentParameter.wrappedValue.setter()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t IntentParameter.projectedValue.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:optionsProvider:)()
{
  return IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:optionsProvider:)();
}

uint64_t IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t type metadata accessor for IntentParameter()
{
  return type metadata accessor for IntentParameter();
}

uint64_t _AssistantIntent.IntentProjection.subscript.getter()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t type metadata accessor for _AssistantIntent.PhraseToken()
{
  return type metadata accessor for _AssistantIntent.PhraseToken();
}

uint64_t static _AssistantIntent.PhraseBuilder.buildBlock(_:)()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.PhraseBuilder.buildExpression(_:)()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t static _AssistantIntent.StringValueBuilder.buildBlock(_:)()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.StringValueBuilder.buildExpression(_:)()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t static _AssistantIntent.ParameterValueBuilder.buildBlock()()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock()();
}

uint64_t static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t _AssistantIntent.Value.init<A>(for:builder:)()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t type metadata accessor for _AssistantIntent.Value()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t _AssistantIntent.Phrase.init(stringLiteral:)()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t _AssistantIntent.Phrase.init(stringInterpolation:)()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t static _AssistantIntent.Builder.buildBlock(_:)()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.Builder.buildExpression(_:)()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t type metadata accessor for _AssistantIntent()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t _AssistantIntent.init<A>(_:phrases:parameterValues:)()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t type metadata accessor for IntentDescription()
{
  return type metadata accessor for IntentDescription();
}

uint64_t IntentDescription.init(_:categoryName:searchKeywords:)()
{
  return IntentDescription.init(_:categoryName:searchKeywords:)();
}

uint64_t IntentItemSection.init(items:)()
{
  return IntentItemSection.init(items:)();
}

uint64_t type metadata accessor for IntentItemSection()
{
  return type metadata accessor for IntentItemSection();
}

uint64_t IntentItemSection.init(_:items:)()
{
  return IntentItemSection.init(_:items:)();
}

uint64_t type metadata accessor for StringSearchScope()
{
  return type metadata accessor for StringSearchScope();
}

uint64_t IntentItemCollection.init(promptLabel:usesIndexedCollation:sections:)()
{
  return IntentItemCollection.init(promptLabel:usesIndexedCollation:sections:)();
}

uint64_t StringSearchCriteria.term.getter()
{
  return StringSearchCriteria.term.getter();
}

uint64_t type metadata accessor for StringSearchCriteria()
{
  return type metadata accessor for StringSearchCriteria();
}

uint64_t DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:)()
{
  return DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:)();
}

uint64_t DisplayRepresentation.title.getter()
{
  return DisplayRepresentation.title.getter();
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

uint64_t type metadata accessor for IntentResultContainer()
{
  return type metadata accessor for IntentResultContainer();
}

uint64_t static DynamicOptionsProvider.useForParameterResolution.getter()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t IntentParameterSummary.init(_:table:)()
{
  return IntentParameterSummary.init(_:table:)();
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

uint64_t static PersistentlyIdentifiable.persistentIdentifier.getter()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t TypeDisplayRepresentation.init(name:numericFormat:)()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t type metadata accessor for TypeDisplayRepresentation()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t type metadata accessor for IntentAuthenticationPolicy()
{
  return type metadata accessor for IntentAuthenticationPolicy();
}

uint64_t static DateInterval.allTimeInterval.getter()
{
  return static DateInterval.allTimeInterval.getter();
}

NSDateInterval __swiftcall DateInterval._bridgeToObjectiveC()()
{
  return (NSDateInterval)DateInterval._bridgeToObjectiveC()();
}

uint64_t DateInterval.init(start:end:)()
{
  return DateInterval.init(start:end:)();
}

uint64_t type metadata accessor for DateInterval()
{
  return type metadata accessor for DateInterval();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t DateComponents.minute.getter()
{
  return DateComponents.minute.getter();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t PersonNameComponents.givenName.setter()
{
  return PersonNameComponents.givenName.setter();
}

uint64_t PersonNameComponents.familyName.setter()
{
  return PersonNameComponents.familyName.setter();
}

NSPersonNameComponents __swiftcall PersonNameComponents._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)PersonNameComponents._bridgeToObjectiveC()();
  result._private = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t PersonNameComponents.init()()
{
  return PersonNameComponents.init()();
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t type metadata accessor for LocalizedStringResource.BundleDescription()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t LocalizedStringResource.init(_:table:locale:bundle:comment:)()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t URL.pathExtension.getter()
{
  return URL.pathExtension.getter();
}

Swift::Void __swiftcall URL.openSensitiveURL()()
{
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t static URL.== infix(_:_:)()
{
  return static URL.== infix(_:_:)();
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

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

uint64_t Date.startOfWeek(for:)()
{
  return Date.startOfWeek(for:)();
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

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t type metadata accessor for Calendar.Identifier()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t Calendar.init(identifier:)()
{
  return Calendar.init(identifier:)();
}

uint64_t Calendar.dateComponents(_:from:to:)()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)IndexPath._bridgeToObjectiveC()();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t IndexPath.init(item:section:)()
{
  return IndexPath.init(item:section:)();
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

uint64_t dispatch thunk of DiskHealthExperienceStore.deleteAllObjects()()
{
  return dispatch thunk of DiskHealthExperienceStore.deleteAllObjects()();
}

uint64_t static DiskHealthExperienceStore.shared.getter()
{
  return static DiskHealthExperienceStore.shared.getter();
}

uint64_t type metadata accessor for DiskHealthExperienceStore()
{
  return type metadata accessor for DiskHealthExperienceStore();
}

uint64_t static HealthAppPluginSource.disabledHealthPluginsDefaultsKey.getter()
{
  return static HealthAppPluginSource.disabledHealthPluginsDefaultsKey.getter();
}

uint64_t type metadata accessor for HealthAppPluginSource()
{
  return type metadata accessor for HealthAppPluginSource();
}

uint64_t dispatch thunk of HealthExperienceStore.viewContext.getter()
{
  return dispatch thunk of HealthExperienceStore.viewContext.getter();
}

uint64_t dispatch thunk of HealthExperienceStore.sharedBackgroundContext.getter()
{
  return dispatch thunk of HealthExperienceStore.sharedBackgroundContext.getter();
}

uint64_t dispatch thunk of HealthAppNotificationManager.getNotificationSettings(completion:)()
{
  return dispatch thunk of HealthAppNotificationManager.getNotificationSettings(completion:)();
}

uint64_t dispatch thunk of HealthAppNotificationManager.getNotificationSettings()()
{
  return dispatch thunk of HealthAppNotificationManager.getNotificationSettings()();
}

uint64_t dispatch thunk of HealthAppNotificationManager.requestAuthorization(addCriticalAlerts:completionHandler:)()
{
  return dispatch thunk of HealthAppNotificationManager.requestAuthorization(addCriticalAlerts:completionHandler:)();
}

uint64_t HealthAppNotificationManager.__allocating_init()()
{
  return HealthAppNotificationManager.__allocating_init()();
}

uint64_t type metadata accessor for HealthAppNotificationManager()
{
  return type metadata accessor for HealthAppNotificationManager();
}

uint64_t static ContentKind.allCases.getter()
{
  return static ContentKind.allCases.getter();
}

uint64_t type metadata accessor for ContentKind()
{
  return type metadata accessor for ContentKind();
}

uint64_t LogCategory.rawValue.getter()
{
  return LogCategory.rawValue.getter();
}

uint64_t type metadata accessor for LogCategory()
{
  return type metadata accessor for LogCategory();
}

uint64_t UserDefault.wrappedValue.getter()
{
  return UserDefault.wrappedValue.getter();
}

uint64_t UserDefault.wrappedValue.setter()
{
  return UserDefault.wrappedValue.setter();
}

uint64_t UserDefault.init(key:userDefaults:fallbackValue:isAppleInternalOnly:)()
{
  return UserDefault.init(key:userDefaults:fallbackValue:isAppleInternalOnly:)();
}

uint64_t type metadata accessor for UserDefault()
{
  return type metadata accessor for UserDefault();
}

uint64_t static SourceProfile.primary.getter()
{
  return static SourceProfile.primary.getter();
}

uint64_t ForYouSectionKind.localizedTitle.getter()
{
  return ForYouSectionKind.localizedTitle.getter();
}

uint64_t ForYouSectionKind.init(rawValue:)()
{
  return ForYouSectionKind.init(rawValue:)();
}

uint64_t static KeywordFeatureTag.CommonIdentifier.fitness.getter()
{
  return static KeywordFeatureTag.CommonIdentifier.fitness.getter();
}

uint64_t static KeywordFeatureTag.CommonIdentifier.hearing.getter()
{
  return static KeywordFeatureTag.CommonIdentifier.hearing.getter();
}

uint64_t PinnedContentManager.__allocating_init(healthStore:domain:)()
{
  return PinnedContentManager.__allocating_init(healthStore:domain:)();
}

uint64_t type metadata accessor for PinnedContentManager()
{
  return type metadata accessor for PinnedContentManager();
}

uint64_t dispatch thunk of PinnedContentManaging.pin(identifier:)()
{
  return dispatch thunk of PinnedContentManaging.pin(identifier:)();
}

uint64_t dispatch thunk of PinnedContentManaging.unpinAll()()
{
  return dispatch thunk of PinnedContentManaging.unpinAll()();
}

uint64_t static Feed.fetchRequest()()
{
  return static Feed.fetchRequest()();
}

uint64_t Feed.Kind.earliestDisplayDateUpdated.getter()
{
  return Feed.Kind.earliestDisplayDateUpdated.getter();
}

uint64_t static Feed.Kind.relevanceRankedFeeds.getter()
{
  return static Feed.Kind.relevanceRankedFeeds.getter();
}

uint64_t static Feed.predicate(kind:associatedProfileIdentifier:feedPrefixKeyPath:)()
{
  return static Feed.predicate(kind:associatedProfileIdentifier:feedPrefixKeyPath:)();
}

uint64_t type metadata accessor for Feed()
{
  return type metadata accessor for Feed();
}

uint64_t FeedItem.reuseIdentifier.getter()
{
  return FeedItem.reuseIdentifier.getter();
}

uint64_t static FeedItem.predicateFor(contentKinds:keyword:relevantDateRange:sourceProfiles:)()
{
  return static FeedItem.predicateFor(contentKinds:keyword:relevantDateRange:sourceProfiles:)();
}

uint64_t FeedItem.associatedDisplayCategory.getter()
{
  return FeedItem.associatedDisplayCategory.getter();
}

uint64_t FeedItem.contentKind.getter()
{
  return FeedItem.contentKind.getter();
}

uint64_t FeedItem.FavoriteStatus.rawValue.getter()
{
  return FeedItem.FavoriteStatus.rawValue.getter();
}

uint64_t FeedItem.favoriteStatus.getter()
{
  return FeedItem.favoriteStatus.getter();
}

uint64_t type metadata accessor for FeedItem()
{
  return type metadata accessor for FeedItem();
}

uint64_t type metadata accessor for BrowseCategory()
{
  return type metadata accessor for BrowseCategory();
}

uint64_t type metadata accessor for DisplayCategory.Kind()
{
  return type metadata accessor for DisplayCategory.Kind();
}

uint64_t CategoryCountDataProvider.init(healthStore:)()
{
  return CategoryCountDataProvider.init(healthStore:)();
}

uint64_t dispatch thunk of CategoryCountDataProvider.categoriesCounts(categories:predicate:completion:)()
{
  return dispatch thunk of CategoryCountDataProvider.categoriesCounts(categories:predicate:completion:)();
}

uint64_t type metadata accessor for CategoryCountDataProvider()
{
  return type metadata accessor for CategoryCountDataProvider();
}

uint64_t static ImprovementDataCollectionOptInViewController.present(in:completion:)()
{
  return static ImprovementDataCollectionOptInViewController.present(in:completion:)();
}

uint64_t type metadata accessor for ImprovementDataCollectionOptInViewController()
{
  return type metadata accessor for ImprovementDataCollectionOptInViewController();
}

uint64_t static HealthSharingFeatureManager.isFeatureFlagEnabled.getter()
{
  return static HealthSharingFeatureManager.isFeatureFlagEnabled.getter();
}

uint64_t type metadata accessor for CloudSyncState()
{
  return type metadata accessor for CloudSyncState();
}

uint64_t dispatch thunk of MedicalIDCache.enqueueMedicalIDFetch()()
{
  return dispatch thunk of MedicalIDCache.enqueueMedicalIDFetch()();
}

uint64_t static MedicalIDCache.globalCache(for:)()
{
  return static MedicalIDCache.globalCache(for:)();
}

uint64_t MedicalIDCache.medicalIDStore.getter()
{
  return MedicalIDCache.medicalIDStore.getter();
}

uint64_t dispatch thunk of MedicalIDCache.medicalIDDataResult.getter()
{
  return dispatch thunk of MedicalIDCache.medicalIDDataResult.getter();
}

uint64_t static MedicalIDCache.primary.getter()
{
  return static MedicalIDCache.primary.getter();
}

uint64_t type metadata accessor for MedicalIDCache()
{
  return type metadata accessor for MedicalIDCache();
}

Swift::Void __swiftcall ExternalDeepLink.open()()
{
}

uint64_t type metadata accessor for ExternalDeepLink()
{
  return type metadata accessor for ExternalDeepLink();
}

uint64_t static LegacyObservable.create()()
{
  return static LegacyObservable.create()();
}

uint64_t static AdvertisableFeature.Identifier.healthWelcomeFlowIdentifiers.getter()
{
  return static AdvertisableFeature.Identifier.healthWelcomeFlowIdentifiers.getter();
}

uint64_t AdvertisableFeature.Identifier.rawValue.getter()
{
  return AdvertisableFeature.Identifier.rawValue.getter();
}

uint64_t type metadata accessor for AdvertisableFeature.Identifier()
{
  return type metadata accessor for AdvertisableFeature.Identifier();
}

uint64_t type metadata accessor for AdvertisableFeature.Location()
{
  return type metadata accessor for AdvertisableFeature.Location();
}

Swift::Void __swiftcall AnalyticsSubmitting.submit()()
{
}

uint64_t static FeatureStatusSupport.isHealthChecklistAvailable()()
{
  return static FeatureStatusSupport.isHealthChecklistAvailable()();
}

uint64_t static FeatureStatusSupport.isHealthChecklistAvailablePublisher()()
{
  return static FeatureStatusSupport.isHealthChecklistAvailablePublisher()();
}

uint64_t static AnalyticsTransforming.activeWatchProductTypeString()()
{
  return static AnalyticsTransforming.activeWatchProductTypeString()();
}

uint64_t CloudSyncRestoreState.isOngoing.getter()
{
  return CloudSyncRestoreState.isOngoing.getter();
}

uint64_t type metadata accessor for CloudSyncRestoreState()
{
  return type metadata accessor for CloudSyncRestoreState();
}

uint64_t ObservableConvertible.afterChange(on:_:)()
{
  return ObservableConvertible.afterChange(on:_:)();
}

uint64_t type metadata accessor for AdvertisableFeatureError()
{
  return type metadata accessor for AdvertisableFeatureError();
}

uint64_t AdvertisableFeatureModel.identifier.getter()
{
  return AdvertisableFeatureModel.identifier.getter();
}

uint64_t AdvertisableFeatureModel.shouldEnable.getter()
{
  return AdvertisableFeatureModel.shouldEnable.getter();
}

uint64_t AdvertisableFeatureModel.shouldEnable.setter()
{
  return AdvertisableFeatureModel.shouldEnable.setter();
}

uint64_t type metadata accessor for AdvertisableFeatureModel()
{
  return type metadata accessor for AdvertisableFeatureModel();
}

uint64_t dispatch thunk of AdvertisableFeatureManaging.commitEnablement(completion:)()
{
  return dispatch thunk of AdvertisableFeatureManaging.commitEnablement(completion:)();
}

uint64_t dispatch thunk of AdvertisableFeatureManaging.modifyAdvertisedModels(modifierBlock:)()
{
  return dispatch thunk of AdvertisableFeatureManaging.modifyAdvertisedModels(modifierBlock:)();
}

uint64_t dispatch thunk of AdvertisableFeatureManaging.performPrerequisiteWork(completion:)()
{
  return dispatch thunk of AdvertisableFeatureManaging.performPrerequisiteWork(completion:)();
}

uint64_t dispatch thunk of AdvertisableFeatureManaging.freezeAdvertisementState()()
{
  return dispatch thunk of AdvertisableFeatureManaging.freezeAdvertisementState()();
}

uint64_t dispatch thunk of AdvertisableFeatureManaging.determinePostCommitWorkItems(completion:)()
{
  return dispatch thunk of AdvertisableFeatureManaging.determinePostCommitWorkItems(completion:)();
}

uint64_t dispatch thunk of AdvertisableFeatureManaging.determineCurrentAdvertisedFeatures(completion:)()
{
  return dispatch thunk of AdvertisableFeatureManaging.determineCurrentAdvertisedFeatures(completion:)();
}

uint64_t type metadata accessor for AdvertisableFeaturePostCommitWorkItem()
{
  return type metadata accessor for AdvertisableFeaturePostCommitWorkItem();
}

uint64_t type metadata accessor for PluginAdvertisableFeatureSourceContext.DeviceSource()
{
  return type metadata accessor for PluginAdvertisableFeatureSourceContext.DeviceSource();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProvider.shouldShowHealthWelcomeFlowOnNextLaunch.setter()
{
  return dispatch thunk of HealthWelcomeFlowSignalProvider.shouldShowHealthWelcomeFlowOnNextLaunch.setter();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProvider.healthWelcomeFlowCompletionDate.setter()
{
  return dispatch thunk of HealthWelcomeFlowSignalProvider.healthWelcomeFlowCompletionDate.setter();
}

uint64_t HealthWelcomeFlowSignalProvider.init()()
{
  return HealthWelcomeFlowSignalProvider.init()();
}

uint64_t type metadata accessor for HealthWelcomeFlowSignalProvider()
{
  return type metadata accessor for HealthWelcomeFlowSignalProvider();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProviding.shouldShowHealthWelcomeFlowOnNextLaunch.getter()
{
  return dispatch thunk of HealthWelcomeFlowSignalProviding.shouldShowHealthWelcomeFlowOnNextLaunch.getter();
}

uint64_t HealthPluginAdvertisableFeatureManagerFactory.init(healthStore:countryProvider:activeDeviceSource:queue:)()
{
  return HealthPluginAdvertisableFeatureManagerFactory.init(healthStore:countryProvider:activeDeviceSource:queue:)();
}

uint64_t type metadata accessor for HealthPluginAdvertisableFeatureManagerFactory()
{
  return type metadata accessor for HealthPluginAdvertisableFeatureManagerFactory();
}

uint64_t dispatch thunk of HealthPluginAdvertisableFeatureManagerProviding.makeAdvertisableFeatureManager(location:featureIdentifiers:includeFeaturesMadeAvailableByBuddy:)()
{
  return dispatch thunk of HealthPluginAdvertisableFeatureManagerProviding.makeAdvertisableFeatureManager(location:featureIdentifiers:includeFeaturesMadeAvailableByBuddy:)();
}

uint64_t CountryOracle.init(mobileCountryCodeManagerProvider:)()
{
  return CountryOracle.init(mobileCountryCodeManagerProvider:)();
}

uint64_t type metadata accessor for CountryOracle()
{
  return type metadata accessor for CountryOracle();
}

uint64_t DeleteFeedOperation.init(feedKinds:)()
{
  return DeleteFeedOperation.init(feedKinds:)();
}

uint64_t type metadata accessor for DeleteFeedOperation()
{
  return type metadata accessor for DeleteFeedOperation();
}

uint64_t PostNotificationOperation.init(name:userInfo:)()
{
  return PostNotificationOperation.init(name:userInfo:)();
}

uint64_t type metadata accessor for PostNotificationOperation()
{
  return type metadata accessor for PostNotificationOperation();
}

uint64_t FeedItemGenerationOperation.init(dateRange:)()
{
  return FeedItemGenerationOperation.init(dateRange:)();
}

uint64_t type metadata accessor for FeedItemGenerationOperation()
{
  return type metadata accessor for FeedItemGenerationOperation();
}

uint64_t PopulateDiscoverFeedOperation.init(feedKinds:)()
{
  return PopulateDiscoverFeedOperation.init(feedKinds:)();
}

uint64_t type metadata accessor for PopulateDiscoverFeedOperation()
{
  return type metadata accessor for PopulateDiscoverFeedOperation();
}

uint64_t dispatch thunk of CollectFeedItemCacheDiagnosticsOperation.logURLs.getter()
{
  return dispatch thunk of CollectFeedItemCacheDiagnosticsOperation.logURLs.getter();
}

uint64_t type metadata accessor for CollectFeedItemCacheDiagnosticsOperation()
{
  return type metadata accessor for CollectFeedItemCacheDiagnosticsOperation();
}

uint64_t static HAUserActivity.createActivity(title:restorationType:profileIdentifier:eligibleForSearch:eligibleForHandoff:eligibleForPrediction:)()
{
  return static HAUserActivity.createActivity(title:restorationType:profileIdentifier:eligibleForSearch:eligibleForHandoff:eligibleForPrediction:)();
}

uint64_t type metadata accessor for HAUserActivity.RestorationInfoKey()
{
  return type metadata accessor for HAUserActivity.RestorationInfoKey();
}

uint64_t HAUserActivity.ViewNavigationKeys.rawValue.getter()
{
  return HAUserActivity.ViewNavigationKeys.rawValue.getter();
}

uint64_t type metadata accessor for HAUserActivity.ViewNavigationKeys()
{
  return type metadata accessor for HAUserActivity.ViewNavigationKeys();
}

uint64_t static HAUserActivity.dateSavedRestorationKey.getter()
{
  return static HAUserActivity.dateSavedRestorationKey.getter();
}

uint64_t DeepLinkActivityType.userActivityType.getter()
{
  return DeepLinkActivityType.userActivityType.getter();
}

uint64_t type metadata accessor for DeepLinkActivityType()
{
  return type metadata accessor for DeepLinkActivityType();
}

uint64_t DeepLinkActivityType.init(_:)()
{
  return DeepLinkActivityType.init(_:)();
}

uint64_t SharingInviteFlowURLData.init(contactData:)()
{
  return SharingInviteFlowURLData.init(contactData:)();
}

uint64_t SharingInviteFlowURLData.url()()
{
  return SharingInviteFlowURLData.url()();
}

uint64_t type metadata accessor for SharingInviteFlowURLData()
{
  return type metadata accessor for SharingInviteFlowURLData();
}

uint64_t ContactDeepLinkingParameter.init(value:)()
{
  return ContactDeepLinkingParameter.init(value:)();
}

uint64_t type metadata accessor for ContactDeepLinkingParameter()
{
  return type metadata accessor for ContactDeepLinkingParameter();
}

uint64_t dispatch thunk of SingleUserDataDataSource.asProfileHeader(healthStore:healthExperienceStore:)()
{
  return dispatch thunk of SingleUserDataDataSource.asProfileHeader(healthStore:healthExperienceStore:)();
}

uint64_t dispatch thunk of SingleUserDataDataSource.cardStackChangeDelegate.setter()
{
  return dispatch thunk of SingleUserDataDataSource.cardStackChangeDelegate.setter();
}

uint64_t SnippetAllDataDataSource.init(healthStore:healthExperienceStore:allDataSummarySections:additionalPredicates:)()
{
  return SnippetAllDataDataSource.init(healthStore:healthExperienceStore:allDataSummarySections:additionalPredicates:)();
}

uint64_t type metadata accessor for SnippetAllDataDataSource()
{
  return type metadata accessor for SnippetAllDataDataSource();
}

uint64_t static NoDataDataSource.makeNoDataDataSource()()
{
  return static NoDataDataSource.makeNoDataDataSource()();
}

uint64_t type metadata accessor for NoDataDataSource()
{
  return type metadata accessor for NoDataDataSource();
}

uint64_t type metadata accessor for HealthAppInteraction.Action()
{
  return type metadata accessor for HealthAppInteraction.Action();
}

uint64_t HealthAppAnalyticsManager.init(healthStore:pinnedContentManager:)()
{
  return HealthAppAnalyticsManager.init(healthStore:pinnedContentManager:)();
}

uint64_t static HealthAppAnalyticsManager.submitInteraction(action:viewController:presentation:pinnedContentManager:)()
{
  return static HealthAppAnalyticsManager.submitInteraction(action:viewController:presentation:pinnedContentManager:)();
}

uint64_t dispatch thunk of HealthAppAnalyticsManager.submitLaunchInteraction(using:)()
{
  return dispatch thunk of HealthAppAnalyticsManager.submitLaunchInteraction(using:)();
}

uint64_t dispatch thunk of HealthAppAnalyticsManager.submitResizeWindowInteraction(with:)()
{
  return dispatch thunk of HealthAppAnalyticsManager.submitResizeWindowInteraction(with:)();
}

uint64_t type metadata accessor for HealthAppAnalyticsManager()
{
  return type metadata accessor for HealthAppAnalyticsManager();
}

uint64_t HealthDetailsViewController.init(healthStore:inEditMode:)()
{
  return HealthDetailsViewController.init(healthStore:inEditMode:)();
}

uint64_t type metadata accessor for HealthDetailsViewController()
{
  return type metadata accessor for HealthDetailsViewController();
}

uint64_t HealthChecklistViewController.init(sender:isDoneButtonVisible:)()
{
  return HealthChecklistViewController.init(sender:isDoneButtonVisible:)();
}

uint64_t type metadata accessor for HealthChecklistViewController()
{
  return type metadata accessor for HealthChecklistViewController();
}

uint64_t HealthURLActivityItemProvider.init(title:url:image:thumbnailImage:subtitle:)()
{
  return HealthURLActivityItemProvider.init(title:url:image:thumbnailImage:subtitle:)();
}

uint64_t type metadata accessor for HealthURLActivityItemProvider()
{
  return type metadata accessor for HealthURLActivityItemProvider();
}

uint64_t type metadata accessor for HealthChecklistOpenedAnalyticsSource()
{
  return type metadata accessor for HealthChecklistOpenedAnalyticsSource();
}

uint64_t HealthKitProfileInformationDataSource.init(context:profileIdentifier:viewClass:layoutConstructor:)()
{
  return HealthKitProfileInformationDataSource.init(context:profileIdentifier:viewClass:layoutConstructor:)();
}

uint64_t type metadata accessor for HealthKitProfileInformationDataSource()
{
  return type metadata accessor for HealthKitProfileInformationDataSource();
}

uint64_t HealthSharingInternalSettingsViewController.init()()
{
  return HealthSharingInternalSettingsViewController.init()();
}

uint64_t type metadata accessor for HealthSharingInternalSettingsViewController()
{
  return type metadata accessor for HealthSharingInternalSettingsViewController();
}

uint64_t HealthExperienceStoreIncrementalCoreSpotlightOperation.init(store:)()
{
  return HealthExperienceStoreIncrementalCoreSpotlightOperation.init(store:)();
}

uint64_t type metadata accessor for HealthExperienceStoreIncrementalCoreSpotlightOperation()
{
  return type metadata accessor for HealthExperienceStoreIncrementalCoreSpotlightOperation();
}

uint64_t HeaderItem.init(title:buttonText:buttonWasTapped:configuration:automationIdentifier:)()
{
  return HeaderItem.init(title:buttonText:buttonWasTapped:configuration:automationIdentifier:)();
}

uint64_t HeaderItem.__allocating_init(hkType:title:showShowAll:configuration:automationIdentifier:)()
{
  return HeaderItem.__allocating_init(hkType:title:showShowAll:configuration:automationIdentifier:)();
}

uint64_t type metadata accessor for HeaderItem()
{
  return type metadata accessor for HeaderItem();
}

uint64_t static HKTypeGroup.typeGroup(for:)()
{
  return static HKTypeGroup.typeGroup(for:)();
}

uint64_t static HKTypeGroup.groupsByKeyword.getter()
{
  return static HKTypeGroup.groupsByKeyword.getter();
}

uint64_t type metadata accessor for HKTypeGroup()
{
  return type metadata accessor for HKTypeGroup();
}

uint64_t static NibLoadable.make(from:)()
{
  return static NibLoadable.make(from:)();
}

uint64_t static NibLoadable.make()()
{
  return static NibLoadable.make()();
}

uint64_t type metadata accessor for HostViewCell()
{
  return type metadata accessor for HostViewCell();
}

uint64_t type metadata accessor for Presentation()
{
  return type metadata accessor for Presentation();
}

uint64_t type metadata accessor for Supplementary()
{
  return type metadata accessor for Supplementary();
}

uint64_t SidebarSection.keyword.getter()
{
  return SidebarSection.keyword.getter();
}

uint64_t type metadata accessor for SidebarSection()
{
  return type metadata accessor for SidebarSection();
}

uint64_t ArrayDataSource.init(arrangedSections:identifier:)()
{
  return ArrayDataSource.init(arrangedSections:identifier:)();
}

uint64_t type metadata accessor for ArrayDataSource()
{
  return type metadata accessor for ArrayDataSource();
}

uint64_t ArrayDataSource.init(_:identifier:)()
{
  return ArrayDataSource.init(_:identifier:)();
}

uint64_t ArrayDataSource.deinit()
{
  return ArrayDataSource.deinit();
}

uint64_t type metadata accessor for CellRegistering()
{
  return type metadata accessor for CellRegistering();
}

uint64_t EmptyHeaderItem.init()()
{
  return EmptyHeaderItem.init()();
}

uint64_t type metadata accessor for EmptyHeaderItem()
{
  return type metadata accessor for EmptyHeaderItem();
}

uint64_t type metadata accessor for SidebarListCell()
{
  return type metadata accessor for SidebarListCell();
}

uint64_t GridLayoutEngine.layout(for:)()
{
  return GridLayoutEngine.layout(for:)();
}

uint64_t static GridLayoutEngine.articles.getter()
{
  return static GridLayoutEngine.articles.getter();
}

uint64_t static GridLayoutEngine.largeCard.getter()
{
  return static GridLayoutEngine.largeCard.getter();
}

uint64_t type metadata accessor for GridLayoutEngine()
{
  return type metadata accessor for GridLayoutEngine();
}

uint64_t MappedDataSource.init(dataSource:transformation:)()
{
  return MappedDataSource.init(dataSource:transformation:)();
}

uint64_t ProfileBarButton.__allocating_init()()
{
  return ProfileBarButton.__allocating_init()();
}

uint64_t type metadata accessor for ProfileBarButton()
{
  return type metadata accessor for ProfileBarButton();
}

uint64_t DelayedDataSource.$dataSourceState.getter()
{
  return DelayedDataSource.$dataSourceState.getter();
}

uint64_t DelayedDataSource.__allocating_init(delay:dataSource:)()
{
  return DelayedDataSource.__allocating_init(delay:dataSource:)();
}

uint64_t type metadata accessor for MicaAnimationView.Animation.AnimationStateWithDuration()
{
  return type metadata accessor for MicaAnimationView.Animation.AnimationStateWithDuration();
}

uint64_t MicaAnimationView.Animation.init(name:bundle:supportsDarkMode:supportsRightToLeft:supportsNumberingSystems:supportsPad:maxStateWithDurations:maxLoopCount:initialDelay:restartLoopDuration:)()
{
  return MicaAnimationView.Animation.init(name:bundle:supportsDarkMode:supportsRightToLeft:supportsNumberingSystems:supportsPad:maxStateWithDurations:maxLoopCount:initialDelay:restartLoopDuration:)();
}

uint64_t type metadata accessor for MicaAnimationView.Animation()
{
  return type metadata accessor for MicaAnimationView.Animation();
}

uint64_t MicaAnimationView.init(animation:inset:scaleToFill:)()
{
  return MicaAnimationView.init(animation:inset:scaleToFill:)();
}

uint64_t type metadata accessor for MicaAnimationView()
{
  return type metadata accessor for MicaAnimationView();
}

uint64_t NoticesDataSource.init(healthExperienceStore:associatedProfileIdentifier:)()
{
  return NoticesDataSource.init(healthExperienceStore:associatedProfileIdentifier:)();
}

uint64_t type metadata accessor for NoticesDataSource()
{
  return type metadata accessor for NoticesDataSource();
}

uint64_t static DataTypeDetailMode.defaultMode(for:presentation:)()
{
  return static DataTypeDetailMode.defaultMode(for:presentation:)();
}

uint64_t FallbackHeaderItem.init()()
{
  return FallbackHeaderItem.init()();
}

uint64_t type metadata accessor for FallbackHeaderItem()
{
  return type metadata accessor for FallbackHeaderItem();
}

uint64_t dispatch thunk of HideableDataSource.wrappedSource.getter()
{
  return dispatch thunk of HideableDataSource.wrappedSource.getter();
}

uint64_t dispatch thunk of HideableDataSource.wrappedDataSource.getter()
{
  return dispatch thunk of HideableDataSource.wrappedDataSource.getter();
}

uint64_t dispatch thunk of HideableDataSource.visibility.setter()
{
  return dispatch thunk of HideableDataSource.visibility.setter();
}

uint64_t HideableDataSource.init(source:visibility:)()
{
  return HideableDataSource.init(source:visibility:)();
}

uint64_t method lookup function for HideableDataSource()
{
  return method lookup function for HideableDataSource();
}

uint64_t HideableDataSource.deinit()
{
  return HideableDataSource.deinit();
}

uint64_t static RootNavigationMode.== infix(_:_:)()
{
  return static RootNavigationMode.== infix(_:_:)();
}

uint64_t dispatch thunk of SnapshotDataSource.snapshot.getter()
{
  return dispatch thunk of SnapshotDataSource.snapshot.getter();
}

uint64_t SnapshotDataSource<>.createCompositionalLayoutFromDataSource(errorHandler:)()
{
  return SnapshotDataSource<>.createCompositionalLayoutFromDataSource(errorHandler:)();
}

uint64_t SnapshotDataSource.presentCardStackOriginalDataSource(viewController:dataSource:config:)()
{
  return SnapshotDataSource.presentCardStackOriginalDataSource(viewController:dataSource:config:)();
}

Swift::Int __swiftcall SnapshotDataSource.numberOfItems(in:)(Swift::Int in)
{
  return SnapshotDataSource.numberOfItems(in:)(in);
}

uint64_t SnapshotDataSource.contentsAsArray()()
{
  return SnapshotDataSource.contentsAsArray()();
}

uint64_t SnapshotDataSource.numberOfSections.getter()
{
  return SnapshotDataSource.numberOfSections.getter();
}

uint64_t SnapshotDataSource.sectionIdentifiers.getter()
{
  return SnapshotDataSource.sectionIdentifiers.getter();
}

uint64_t SnapshotDataSource.withCellRegistration(_:)()
{
  return SnapshotDataSource.withCellRegistration(_:)();
}

uint64_t SnapshotDataSource.withSupplementaryItem(_:)()
{
  return SnapshotDataSource.withSupplementaryItem(_:)();
}

uint64_t SnapshotDataSource.withLayoutSectionProvider(collapseEmptySections:_:)()
{
  return SnapshotDataSource.withLayoutSectionProvider(collapseEmptySections:_:)();
}

{
  return SnapshotDataSource.withLayoutSectionProvider(collapseEmptySections:_:)();
}

uint64_t SnapshotDataSource.item(at:)()
{
  return SnapshotDataSource.item(at:)();
}

uint64_t SnapshotDataSource.isEmpty.getter()
{
  return SnapshotDataSource.isEmpty.getter();
}

uint64_t static UserActivityRouter.handleUserActivity(rootViewController:userActivity:)()
{
  return static UserActivityRouter.handleUserActivity(rootViewController:userActivity:)();
}

uint64_t LayoutConfiguration.layoutSection.getter()
{
  return LayoutConfiguration.layoutSection.getter();
}

uint64_t LayoutConfiguration.withoutHeader.getter()
{
  return LayoutConfiguration.withoutHeader.getter();
}

uint64_t LayoutConfiguration.interItemInset.getter()
{
  return LayoutConfiguration.interItemInset.getter();
}

uint64_t LayoutConfiguration.additionalContentInsets.modify()
{
  return LayoutConfiguration.additionalContentInsets.modify();
}

uint64_t static LayoutConfiguration.card.getter()
{
  return static LayoutConfiguration.card.getter();
}

uint64_t static LayoutConfiguration.pill(environment:)()
{
  return static LayoutConfiguration.pill(environment:)();
}

uint64_t static LayoutConfiguration.empty.getter()
{
  return static LayoutConfiguration.empty.getter();
}

uint64_t static LayoutConfiguration.shared.getter()
{
  return static LayoutConfiguration.shared.getter();
}

uint64_t type metadata accessor for LayoutConfiguration()
{
  return type metadata accessor for LayoutConfiguration();
}

uint64_t dispatch thunk of ProfileGradientView.delayAnimation.setter()
{
  return dispatch thunk of ProfileGradientView.delayAnimation.setter();
}

uint64_t static ProfileGradientView.preloadRenderPipelineStateIfNeeded()()
{
  return static ProfileGradientView.preloadRenderPipelineStateIfNeeded()();
}

uint64_t type metadata accessor for ProfileGradientView()
{
  return type metadata accessor for ProfileGradientView();
}

uint64_t dispatch thunk of BrowseViewController.browseSearchViewController.getter()
{
  return dispatch thunk of BrowseViewController.browseSearchViewController.getter();
}

uint64_t dispatch thunk of BrowseViewController.setActiveSearchController(_:)()
{
  return dispatch thunk of BrowseViewController.setActiveSearchController(_:)();
}

uint64_t dispatch thunk of BrowseViewController.activeViewController.getter()
{
  return dispatch thunk of BrowseViewController.activeViewController.getter();
}

uint64_t BrowseViewController.init(healthExperienceStore:healthStore:pinnedContentManager:)()
{
  return BrowseViewController.init(healthExperienceStore:healthStore:pinnedContentManager:)();
}

uint64_t static BrowseViewController.SearchState.== infix(_:_:)()
{
  return static BrowseViewController.SearchState.== infix(_:_:)();
}

uint64_t type metadata accessor for BrowseViewController.SearchState()
{
  return type metadata accessor for BrowseViewController.SearchState();
}

uint64_t dispatch thunk of BrowseViewController.searchState.getter()
{
  return dispatch thunk of BrowseViewController.searchState.getter();
}

uint64_t dispatch thunk of BrowseViewController.deactivateSearch()()
{
  return dispatch thunk of BrowseViewController.deactivateSearch()();
}

uint64_t dispatch thunk of BrowseViewController.loadSearchingState(query:)()
{
  return dispatch thunk of BrowseViewController.loadSearchingState(query:)();
}

uint64_t dispatch thunk of BrowseViewController.searchTextDidChange(_:)()
{
  return dispatch thunk of BrowseViewController.searchTextDidChange(_:)();
}

uint64_t type metadata accessor for BrowseViewController()
{
  return type metadata accessor for BrowseViewController();
}

uint64_t type metadata accessor for DataSourceWithLayout()
{
  return type metadata accessor for DataSourceWithLayout();
}

uint64_t dispatch thunk of CellSelectionHandling.didSelectCell(_:in:)()
{
  return dispatch thunk of CellSelectionHandling.didSelectCell(_:in:)();
}

uint64_t dispatch thunk of CellSelectionHandling.deselectionBehavior(in:)()
{
  return dispatch thunk of CellSelectionHandling.deselectionBehavior(in:)();
}

Swift::Bool_optional __swiftcall CellSelectionHandling.selectionShouldFollowFocusForCell(_:in:)(UIView _, UIViewController in)
{
  return (Swift::Bool_optional)CellSelectionHandling.selectionShouldFollowFocusForCell(_:in:)(_.super.super.isa, in.super.super.isa);
}

uint64_t CellSelectionHandling.deselectionBehavior(in:)()
{
  return CellSelectionHandling.deselectionBehavior(in:)();
}

uint64_t static ProfileViewController.makeProfileNavigationController(healthStore:pinnedContentManager:configurator:)()
{
  return static ProfileViewController.makeProfileNavigationController(healthStore:pinnedContentManager:configurator:)();
}

uint64_t type metadata accessor for ProfileViewController()
{
  return type metadata accessor for ProfileViewController();
}

uint64_t static SidebarDataSourceItem.sharingSidebarItemIdentifier.getter()
{
  return static SidebarDataSourceItem.sharingSidebarItemIdentifier.getter();
}

uint64_t static SidebarDataSourceItem.summarySidebarItemIdentifier.getter()
{
  return static SidebarDataSourceItem.summarySidebarItemIdentifier.getter();
}

uint64_t SidebarDataSourceItem.init(uniqueIdentifier:detailViewController:text:image:)()
{
  return SidebarDataSourceItem.init(uniqueIdentifier:detailViewController:text:image:)();
}

uint64_t type metadata accessor for SidebarDataSourceItem()
{
  return type metadata accessor for SidebarDataSourceItem();
}

uint64_t ArrayDataSourceSection.init(arrayLiteral:)()
{
  return ArrayDataSourceSection.init(arrayLiteral:)();
}

uint64_t ArrayDataSourceSection.arrangedItems.getter()
{
  return ArrayDataSourceSection.arrangedItems.getter();
}

uint64_t ArrayDataSourceSection.init(title:arrangedItems:identifier:)()
{
  return ArrayDataSourceSection.init(title:arrangedItems:identifier:)();
}

uint64_t ArrayDataSourceSection.title.getter()
{
  return ArrayDataSourceSection.title.getter();
}

uint64_t type metadata accessor for ArrayDataSourceSection()
{
  return type metadata accessor for ArrayDataSourceSection();
}

uint64_t static CategoryViewController.makeCategoryViewController(userActivity:healthStore:healthExperienceStore:pinnedContentManager:)()
{
  return static CategoryViewController.makeCategoryViewController(userActivity:healthStore:healthExperienceStore:pinnedContentManager:)();
}

uint64_t CategoryViewController.init(typeGroup:healthStore:healthExperienceStore:pinnedContentManager:)()
{
  return CategoryViewController.init(typeGroup:healthStore:healthExperienceStore:pinnedContentManager:)();
}

uint64_t type metadata accessor for CategoryViewController()
{
  return type metadata accessor for CategoryViewController();
}

uint64_t dispatch thunk of CloudSyncStateObserver.firstRestoreStateChangeHandler.setter()
{
  return dispatch thunk of CloudSyncStateObserver.firstRestoreStateChangeHandler.setter();
}

uint64_t dispatch thunk of CloudSyncStateObserver.startObservingStateChanges()()
{
  return dispatch thunk of CloudSyncStateObserver.startObservingStateChanges()();
}

uint64_t dispatch thunk of CloudSyncStateObserver.cachedFirstRestoreState.getter()
{
  return dispatch thunk of CloudSyncStateObserver.cachedFirstRestoreState.getter();
}

uint64_t CloudSyncStateObserver.init(healthStore:store:)()
{
  return CloudSyncStateObserver.init(healthStore:store:)();
}

uint64_t dispatch thunk of CloudSyncStateObserver.stateChangeHandler.setter()
{
  return dispatch thunk of CloudSyncStateObserver.stateChangeHandler.setter();
}

uint64_t dispatch thunk of CloudSyncStateObserver.startFirstRestoreIfNeeded()()
{
  return dispatch thunk of CloudSyncStateObserver.startFirstRestoreIfNeeded()();
}

uint64_t type metadata accessor for CloudSyncStateObserver()
{
  return type metadata accessor for CloudSyncStateObserver();
}

uint64_t HostingCellReusePolicy.init(reuseIdentifier:)()
{
  return HostingCellReusePolicy.init(reuseIdentifier:)();
}

uint64_t HostingCellReusePolicy.reuseIdentifier.getter()
{
  return HostingCellReusePolicy.reuseIdentifier.getter();
}

uint64_t HostingCellReusePolicy.override<A>(reusableCellClass:)()
{
  return HostingCellReusePolicy.override<A>(reusableCellClass:)();
}

uint64_t type metadata accessor for HostingCellReusePolicy()
{
  return type metadata accessor for HostingCellReusePolicy();
}

uint64_t MutableArrayDataSource.init(arrangedSections:identifier:)()
{
  return MutableArrayDataSource.init(arrangedSections:identifier:)();
}

uint64_t dispatch thunk of MutableArrayDataSource.replaceAllSections(with:reconfigureOrReloadItemsIfNeeded:)()
{
  return dispatch thunk of MutableArrayDataSource.replaceAllSections(with:reconfigureOrReloadItemsIfNeeded:)();
}

uint64_t dispatch thunk of MutableArrayDataSource.replaceItemsForSection(at:newItems:reconfigureAndReloadItems:)()
{
  return dispatch thunk of MutableArrayDataSource.replaceItemsForSection(at:newItems:reconfigureAndReloadItems:)();
}

uint64_t dispatch thunk of MutableArrayDataSource.append(item:toSectionWithID:)()
{
  return dispatch thunk of MutableArrayDataSource.append(item:toSectionWithID:)();
}

uint64_t MutableArrayDataSource.deinit()
{
  return MutableArrayDataSource.deinit();
}

uint64_t dispatch thunk of PPTScrollViewProviding.scrollViewToTest()()
{
  return dispatch thunk of PPTScrollViewProviding.scrollViewToTest()();
}

uint64_t AllTrendsViewController.init(healthStore:healthExperienceStore:additionalPredicates:presentation:customProvenance:)()
{
  return AllTrendsViewController.init(healthStore:healthExperienceStore:additionalPredicates:presentation:customProvenance:)();
}

uint64_t type metadata accessor for AllTrendsViewController()
{
  return type metadata accessor for AllTrendsViewController();
}

uint64_t type metadata accessor for CellDeselectionBehavior()
{
  return type metadata accessor for CellDeselectionBehavior();
}

uint64_t dispatch thunk of DataTypeDetailChartCell.chartViewController.getter()
{
  return dispatch thunk of DataTypeDetailChartCell.chartViewController.getter();
}

uint64_t type metadata accessor for DataTypeDetailChartCell()
{
  return type metadata accessor for DataTypeDetailChartCell();
}

uint64_t static ListLayoutConfiguration.withHeader.getter()
{
  return static ListLayoutConfiguration.withHeader.getter();
}

uint64_t static ListLayoutConfiguration.withoutHeader.getter()
{
  return static ListLayoutConfiguration.withoutHeader.getter();
}

uint64_t ListLayoutConfiguration.interGroupSpacing.setter()
{
  return ListLayoutConfiguration.interGroupSpacing.setter();
}

uint64_t ListLayoutConfiguration.additionalContentInsets.modify()
{
  return ListLayoutConfiguration.additionalContentInsets.modify();
}

uint64_t static ListLayoutConfiguration.apps.getter()
{
  return static ListLayoutConfiguration.apps.getter();
}

uint64_t ListLayoutConfiguration.layout(for:)()
{
  return ListLayoutConfiguration.layout(for:)();
}

uint64_t type metadata accessor for ListLayoutConfiguration()
{
  return type metadata accessor for ListLayoutConfiguration();
}

uint64_t dispatch thunk of PersonalizedFeedTrainer.visibleFeedItemsDidChange(at:)()
{
  return dispatch thunk of PersonalizedFeedTrainer.visibleFeedItemsDidChange(at:)();
}

uint64_t static PersonalizedFeedTrainer.DwellPolicy.summary.getter()
{
  return static PersonalizedFeedTrainer.DwellPolicy.summary.getter();
}

uint64_t type metadata accessor for PersonalizedFeedTrainer.DwellPolicy()
{
  return type metadata accessor for PersonalizedFeedTrainer.DwellPolicy();
}

uint64_t dispatch thunk of PersonalizedFeedTrainer.feedDidEndDisplay(at:)()
{
  return dispatch thunk of PersonalizedFeedTrainer.feedDidEndDisplay(at:)();
}

uint64_t dispatch thunk of PersonalizedFeedTrainer.feedDidBeginDisplay(at:)()
{
  return dispatch thunk of PersonalizedFeedTrainer.feedDidBeginDisplay(at:)();
}

uint64_t PersonalizedFeedTrainer.init(delegate:dwellPolicy:)()
{
  return PersonalizedFeedTrainer.init(delegate:dwellPolicy:)();
}

uint64_t type metadata accessor for PersonalizedFeedTrainer()
{
  return type metadata accessor for PersonalizedFeedTrainer();
}

uint64_t PinnedContentDataSource.init(pinnedContentManager:context:)()
{
  return PinnedContentDataSource.init(pinnedContentManager:context:)();
}

uint64_t type metadata accessor for PinnedContentDataSource()
{
  return type metadata accessor for PinnedContentDataSource();
}

uint64_t ProfileButtonDisplaying<>.updateProfileButtonForRegularSizeClass()()
{
  return ProfileButtonDisplaying<>.updateProfileButtonForRegularSizeClass()();
}

uint64_t type metadata accessor for CollectionViewHeaderCell()
{
  return type metadata accessor for CollectionViewHeaderCell();
}

uint64_t type metadata accessor for CollectionViewHeaderItem.IconConfiguration()
{
  return type metadata accessor for CollectionViewHeaderItem.IconConfiguration();
}

uint64_t CollectionViewHeaderItem.init(text:makeConfiguration:respectsSuperviewXLayoutMargins:iconConfig:accessories:automationIdentifier:)()
{
  return CollectionViewHeaderItem.init(text:makeConfiguration:respectsSuperviewXLayoutMargins:iconConfig:accessories:automationIdentifier:)();
}

uint64_t type metadata accessor for CollectionViewHeaderItem()
{
  return type metadata accessor for CollectionViewHeaderItem();
}

uint64_t static ContentConfigurationItem.makeDisclosureItem(text:automationIdentifier:cellSelectionHandler:)()
{
  return static ContentConfigurationItem.makeDisclosureItem(text:automationIdentifier:cellSelectionHandler:)();
}

uint64_t ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)()
{
  return ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)();
}

uint64_t ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)()
{
  return ContentConfigurationItem.init(uniqueIdentifier:contentConfiguration:cellAccessories:cellSelectionHandler:deselectionBehavior:backgroundConfiguration:updateContentConfigurationHandler:container:automationIdentifier:)();
}

uint64_t ContentConfigurationItem.deselectionBehavior.setter()
{
  return ContentConfigurationItem.deselectionBehavior.setter();
}

uint64_t type metadata accessor for ContentConfigurationItem()
{
  return type metadata accessor for ContentConfigurationItem();
}

uint64_t static EmergencyAccessBuddyFlow.allCases.getter()
{
  return static EmergencyAccessBuddyFlow.allCases.getter();
}

uint64_t EmergencyAccessBuddyFlow.isReview.getter()
{
  return EmergencyAccessBuddyFlow.isReview.getter();
}

uint64_t type metadata accessor for EmergencyAccessBuddyFlow()
{
  return type metadata accessor for EmergencyAccessBuddyFlow();
}

uint64_t HKTDataTypeDetailFactory.makeViewController(hkType:context:)()
{
  return HKTDataTypeDetailFactory.makeViewController(hkType:context:)();
}

uint64_t HKTDataTypeDetailFactory.init()()
{
  return HKTDataTypeDetailFactory.init()();
}

uint64_t type metadata accessor for HKTDataTypeDetailFactory()
{
  return type metadata accessor for HKTDataTypeDetailFactory();
}

uint64_t dispatch thunk of PluginNotificationRouter.sceneProvider.setter()
{
  return dispatch thunk of PluginNotificationRouter.sceneProvider.setter();
}

uint64_t PluginNotificationRouter.__allocating_init()()
{
  return PluginNotificationRouter.__allocating_init()();
}

uint64_t type metadata accessor for PluginNotificationRouter()
{
  return type metadata accessor for PluginNotificationRouter();
}

uint64_t type metadata accessor for AdditionalItemsDataSource.Mode()
{
  return type metadata accessor for AdditionalItemsDataSource.Mode();
}

uint64_t AdditionalItemsDataSource.init(_:additionalItems:mode:)()
{
  return AdditionalItemsDataSource.init(_:additionalItems:mode:)();
}

uint64_t AdditionalItemsDataSource.deinit()
{
  return AdditionalItemsDataSource.deinit();
}

uint64_t EmergencyAccessUserStatus.init(onboardingStatus:isStewieSupported:)()
{
  return EmergencyAccessUserStatus.init(onboardingStatus:isStewieSupported:)();
}

uint64_t type metadata accessor for EmergencyAccessUserStatus()
{
  return type metadata accessor for EmergencyAccessUserStatus();
}

uint64_t dispatch thunk of BrowseSearchViewController.searchController.getter()
{
  return dispatch thunk of BrowseSearchViewController.searchController.getter();
}

uint64_t DefaultCloudSyncStateStore.init(userDefaults:)()
{
  return DefaultCloudSyncStateStore.init(userDefaults:)();
}

uint64_t type metadata accessor for DefaultCloudSyncStateStore()
{
  return type metadata accessor for DefaultCloudSyncStateStore();
}

uint64_t EmptyGradientColorProvider.init()()
{
  return EmptyGradientColorProvider.init()();
}

uint64_t type metadata accessor for EmptyGradientColorProvider()
{
  return type metadata accessor for EmptyGradientColorProvider();
}

uint64_t dispatch thunk of PrimarySecondaryDataSource.currentDataSource.getter()
{
  return dispatch thunk of PrimarySecondaryDataSource.currentDataSource.getter();
}

uint64_t PrimarySecondaryDataSource.__allocating_init(primaryDataSource:secondaryDataSource:activeDataSourceResolver:)()
{
  return PrimarySecondaryDataSource.__allocating_init(primaryDataSource:secondaryDataSource:activeDataSourceResolver:)();
}

uint64_t PrimarySecondaryDataSource.init(primaryDataSource:secondaryDataSource:)()
{
  return PrimarySecondaryDataSource.init(primaryDataSource:secondaryDataSource:)();
}

uint64_t dispatch thunk of PrimarySecondaryDataSource.primaryDataSource.getter()
{
  return dispatch thunk of PrimarySecondaryDataSource.primaryDataSource.getter();
}

uint64_t dispatch thunk of PrimarySecondaryDataSource.shouldUsePrimaryDataSource.getter()
{
  return dispatch thunk of PrimarySecondaryDataSource.shouldUsePrimaryDataSource.getter();
}

uint64_t PrimarySecondaryDataSource.identifier.getter()
{
  return PrimarySecondaryDataSource.identifier.getter();
}

uint64_t type metadata accessor for PrimarySecondaryDataSource()
{
  return type metadata accessor for PrimarySecondaryDataSource();
}

UIBarButtonItem_optional __swiftcall TapToRadarButtonDisplaying.makeTapToRadarButtonIfNeeded()()
{
  uint64_t v0 = (objc_class *)TapToRadarButtonDisplaying.makeTapToRadarButtonIfNeeded()();
  result.value.super.super.Class isa = v0;
  result.is_nil = v1;
  return result;
}

uint64_t TapToRadarButtonDisplaying<>.showDisambiguationTriageAlert(featureName:userConfirmed:)()
{
  return TapToRadarButtonDisplaying<>.showDisambiguationTriageAlert(featureName:userConfirmed:)();
}

uint64_t CollectionViewLayoutContext.environment.getter()
{
  return CollectionViewLayoutContext.environment.getter();
}

uint64_t CollectionViewLayoutContext.section.getter()
{
  return CollectionViewLayoutContext.section.getter();
}

uint64_t type metadata accessor for CollectionViewLayoutContext()
{
  return type metadata accessor for CollectionViewLayoutContext();
}

uint64_t dispatch thunk of CompoundSectionedDataSource.changeObservers.getter()
{
  return dispatch thunk of CompoundSectionedDataSource.changeObservers.getter();
}

uint64_t dispatch thunk of CompoundSectionedDataSource.firstFullIdentifier(itemIdentifier:)()
{
  return dispatch thunk of CompoundSectionedDataSource.firstFullIdentifier(itemIdentifier:)();
}

uint64_t dispatch thunk of CompoundSectionedDataSource.item(for:)()
{
  return dispatch thunk of CompoundSectionedDataSource.item(for:)();
}

uint64_t dispatch thunk of CompoundSectionedDataSource.snapshot.getter()
{
  return dispatch thunk of CompoundSectionedDataSource.snapshot.getter();
}

uint64_t type metadata accessor for CompoundSectionedDataSource()
{
  return type metadata accessor for CompoundSectionedDataSource();
}

uint64_t method lookup function for CompoundSectionedDataSource()
{
  return method lookup function for CompoundSectionedDataSource();
}

uint64_t CompoundSectionedDataSource.deinit()
{
  return CompoundSectionedDataSource.deinit();
}

uint64_t CompoundSectionedDataSource.init(_:)()
{
  return CompoundSectionedDataSource.init(_:)();
}

uint64_t DataTypeDetailConfiguration.Context.init(healthExperienceStore:healthStore:mode:pinnedContentManager:chartContext:restorationUserActivity:)()
{
  return DataTypeDetailConfiguration.Context.init(healthExperienceStore:healthStore:mode:pinnedContentManager:chartContext:restorationUserActivity:)();
}

uint64_t type metadata accessor for DataTypeDetailConfiguration.Context()
{
  return type metadata accessor for DataTypeDetailConfiguration.Context();
}

uint64_t type metadata accessor for MappedDataSourceWithContext.Transformation()
{
  return type metadata accessor for MappedDataSourceWithContext.Transformation();
}

uint64_t ProfileGradientWithFadeView.gradientView.getter()
{
  return ProfileGradientWithFadeView.gradientView.getter();
}

uint64_t type metadata accessor for ProfileGradientWithFadeView()
{
  return type metadata accessor for ProfileGradientWithFadeView();
}

uint64_t type metadata accessor for SectionsPublisherDataSource()
{
  return type metadata accessor for SectionsPublisherDataSource();
}

uint64_t type metadata accessor for EmptyStateCollectionViewCell()
{
  return type metadata accessor for EmptyStateCollectionViewCell();
}

uint64_t GradientBackgroundPresenting.layoutGradient(yOffset:)()
{
  return GradientBackgroundPresenting.layoutGradient(yOffset:)();
}

Swift::Void __swiftcall GradientBackgroundPresenting.configureGradientBackground()()
{
}

uint64_t GradientBackgroundPresenting.gradientHeight.getter()
{
  return GradientBackgroundPresenting.gradientHeight.getter();
}

uint64_t type metadata accessor for SummaryHeaderProfileNameCell()
{
  return type metadata accessor for SummaryHeaderProfileNameCell();
}

uint64_t dispatch thunk of ViewControllerRouterProtocol.prepareForAppActivity(_:)()
{
  return dispatch thunk of ViewControllerRouterProtocol.prepareForAppActivity(_:)();
}

uint64_t DiffableCollectionViewAdaptor.__allocating_init(collectionView:backingDataSource:prefetchCellsWhenPerformingReloadData:)()
{
  return DiffableCollectionViewAdaptor.__allocating_init(collectionView:backingDataSource:prefetchCellsWhenPerformingReloadData:)();
}

uint64_t dispatch thunk of DiffableCollectionViewAdaptor.loadIfNeeded()()
{
  return dispatch thunk of DiffableCollectionViewAdaptor.loadIfNeeded()();
}

uint64_t type metadata accessor for DiffableCollectionViewAdaptor()
{
  return type metadata accessor for DiffableCollectionViewAdaptor();
}

uint64_t dispatch thunk of InteractiveGenerationListener.applicationStateProvider.setter()
{
  return dispatch thunk of InteractiveGenerationListener.applicationStateProvider.setter();
}

uint64_t dispatch thunk of InteractiveGenerationListener.start()()
{
  return dispatch thunk of InteractiveGenerationListener.start()();
}

uint64_t type metadata accessor for InteractiveGenerationListener()
{
  return type metadata accessor for InteractiveGenerationListener();
}

uint64_t SharingOverviewViewController.init(healthExperienceStore:healthStore:pinnedContentManager:)()
{
  return SharingOverviewViewController.init(healthExperienceStore:healthStore:pinnedContentManager:)();
}

uint64_t type metadata accessor for SharingOverviewViewController()
{
  return type metadata accessor for SharingOverviewViewController();
}

uint64_t SizeClassResponsiveDataSource.init(dataSources:defaultDataSource:)()
{
  return SizeClassResponsiveDataSource.init(dataSources:defaultDataSource:)();
}

uint64_t type metadata accessor for SizeClassResponsiveDataSource()
{
  return type metadata accessor for SizeClassResponsiveDataSource();
}

uint64_t type metadata accessor for DeepLinkViewControllerPlacement()
{
  return type metadata accessor for DeepLinkViewControllerPlacement();
}

Swift::Void __swiftcall PersonalizedFeedTrainerDelegate.handleTrainingEvents(_:)(Swift::OpaquePointer a1)
{
}

uint64_t PersonalizedFeedTrainerDelegate<>.visibleFeedItemsEligibleForTraining()()
{
  return PersonalizedFeedTrainerDelegate<>.visibleFeedItemsEligibleForTraining()();
}

uint64_t dispatch thunk of PluginInternalSettingsProviding.makeInternalSettingsViewController()()
{
  return dispatch thunk of PluginInternalSettingsProviding.makeInternalSettingsViewController()();
}

uint64_t EmptyStateCollectionViewCellItem.init(title:showSpinner:)()
{
  return EmptyStateCollectionViewCellItem.init(title:showSpinner:)();
}

uint64_t type metadata accessor for EmptyStateCollectionViewCellItem()
{
  return type metadata accessor for EmptyStateCollectionViewCellItem();
}

uint64_t HeaderFooterDataSourceWithLayout.mainDataSource.getter()
{
  return HeaderFooterDataSourceWithLayout.mainDataSource.getter();
}

uint64_t HeaderFooterDataSourceWithLayout.init(headerDataSource:mainDataSource:footerDataSource:)()
{
  return HeaderFooterDataSourceWithLayout.init(headerDataSource:mainDataSource:footerDataSource:)();
}

uint64_t type metadata accessor for HeaderFooterDataSourceWithLayout()
{
  return type metadata accessor for HeaderFooterDataSourceWithLayout();
}

uint64_t MutableArrayDataSourceWithLayout.init(arrangedSections:collapseEmptySections:layoutSectionProvider:)()
{
  return MutableArrayDataSourceWithLayout.init(arrangedSections:collapseEmptySections:layoutSectionProvider:)();
}

uint64_t type metadata accessor for MutableArrayDataSourceWithLayout()
{
  return type metadata accessor for MutableArrayDataSourceWithLayout();
}

uint64_t MutableArrayDataSourceWithLayout.__allocating_init(_:collapseEmptySections:layoutConstructor:)()
{
  return MutableArrayDataSourceWithLayout.__allocating_init(_:collapseEmptySections:layoutConstructor:)();
}

uint64_t MutableArrayDataSourceWithLayout.deinit()
{
  return MutableArrayDataSourceWithLayout.deinit();
}

uint64_t type metadata accessor for PlaceholderTextCollectionViewCell()
{
  return type metadata accessor for PlaceholderTextCollectionViewCell();
}

uint64_t type metadata accessor for TitleEmptyStateCollectionViewCell()
{
  return type metadata accessor for TitleEmptyStateCollectionViewCell();
}

uint64_t AlertStackModalPresentationManager.init(healthStore:)()
{
  return AlertStackModalPresentationManager.init(healthStore:)();
}

uint64_t dispatch thunk of AlertStackModalPresentationManager.fetchEligibleAlerts(completion:)()
{
  return dispatch thunk of AlertStackModalPresentationManager.fetchEligibleAlerts(completion:)();
}

uint64_t type metadata accessor for AlertStackModalPresentationManager()
{
  return type metadata accessor for AlertStackModalPresentationManager();
}

uint64_t dispatch thunk of AllFeedItemsListDataSourceProvider.selectedDataSources(for:)()
{
  return dispatch thunk of AllFeedItemsListDataSourceProvider.selectedDataSources(for:)();
}

uint64_t AllFeedItemsListDataSourceProvider.init(for:)()
{
  return AllFeedItemsListDataSourceProvider.init(for:)();
}

uint64_t type metadata accessor for AllFeedItemsListDataSourceProvider()
{
  return type metadata accessor for AllFeedItemsListDataSourceProvider();
}

uint64_t dispatch thunk of FetchedResultsControllerDataSource.item(for:)()
{
  return dispatch thunk of FetchedResultsControllerDataSource.item(for:)();
}

uint64_t FetchedResultsControllerDataSource.init(_:)()
{
  return FetchedResultsControllerDataSource.init(_:)();
}

uint64_t InternalFeedItemListViewController.init(contentKinds:)()
{
  return InternalFeedItemListViewController.init(contentKinds:)();
}

uint64_t dispatch thunk of InternalFeedItemListViewController.contentKinds.setter()
{
  return dispatch thunk of InternalFeedItemListViewController.contentKinds.setter();
}

uint64_t type metadata accessor for InternalFeedItemListViewController()
{
  return type metadata accessor for InternalFeedItemListViewController();
}

uint64_t NotificationSettingsViewController.init(healthExperienceStore:)()
{
  return NotificationSettingsViewController.init(healthExperienceStore:)();
}

uint64_t type metadata accessor for NotificationSettingsViewController()
{
  return type metadata accessor for NotificationSettingsViewController();
}

uint64_t SummaryFeedTrendsSectionDataSource.init(context:sourceProfile:additionalPredicates:significantTrendsDataSourceLoadingCompletion:)()
{
  return SummaryFeedTrendsSectionDataSource.init(context:sourceProfile:additionalPredicates:significantTrendsDataSourceLoadingCompletion:)();
}

uint64_t type metadata accessor for SummaryFeedTrendsSectionDataSource()
{
  return type metadata accessor for SummaryFeedTrendsSectionDataSource();
}

uint64_t SummarySharingOnboardingPresenting.presentOnboardingVC(on:healthStore:healthExperienceStore:isInfoTile:needsOnboardingSetup:isPresentedViaLink:)()
{
  return SummarySharingOnboardingPresenting.presentOnboardingVC(on:healthStore:healthExperienceStore:isInfoTile:needsOnboardingSetup:isPresentedViaLink:)();
}

uint64_t SummarySharingOnboardingPresenting.pairedDeviceNamePublisher()()
{
  return SummarySharingOnboardingPresenting.pairedDeviceNamePublisher()();
}

uint64_t SummarySharingOnboardingPresenting.sharingAnalyticsPublisher(for:)()
{
  return SummarySharingOnboardingPresenting.sharingAnalyticsPublisher(for:)();
}

uint64_t SummarySharingOnboardingPresenting.userDemographicsPublisher(for:)()
{
  return SummarySharingOnboardingPresenting.userDemographicsPublisher(for:)();
}

uint64_t SummarySharingOnboardingPresenting.suggestedCategoriesPublisher(healthStore:healthExperienceStore:)()
{
  return SummarySharingOnboardingPresenting.suggestedCategoriesPublisher(healthStore:healthExperienceStore:)();
}

uint64_t SharedProfileOverviewViewController.__allocating_init(healthStore:healthExperienceStore:pinnedContentManager:)()
{
  return SharedProfileOverviewViewController.__allocating_init(healthStore:healthExperienceStore:pinnedContentManager:)();
}

uint64_t type metadata accessor for SharedProfileOverviewViewController()
{
  return type metadata accessor for SharedProfileOverviewViewController();
}

Swift::Bool __swiftcall CollectionViewLayoutSectionProviding.shouldCollapseEmptySection(_:)(Swift::Int a1)
{
  return CollectionViewLayoutSectionProviding.shouldCollapseEmptySection(_:)(a1);
}

uint64_t OnboardingHeroWithLinkViewController.init(title:detailText:heroView:linkButtonText:linkButtonAction:linkButtonAccessibilityIdentifier:underLinkButtonContentView:heroViewUsesIntrinsicHeight:)()
{
  return OnboardingHeroWithLinkViewController.init(title:detailText:heroView:linkButtonText:linkButtonAction:linkButtonAccessibilityIdentifier:underLinkButtonContentView:heroViewUsesIntrinsicHeight:)();
}

uint64_t OnboardingHeroWithLinkViewController.init(title:detailText:heroImage:heroImageHeight:linkButtonText:linkButtonAction:linkButtonAccessibilityIdentifier:underLinkButtonContentView:)()
{
  return OnboardingHeroWithLinkViewController.init(title:detailText:heroImage:heroImageHeight:linkButtonText:linkButtonAction:linkButtonAccessibilityIdentifier:underLinkButtonContentView:)();
}

uint64_t type metadata accessor for SectionedDataSourceContainerViewType()
{
  return type metadata accessor for SectionedDataSourceContainerViewType();
}

uint64_t AllHighlightsByCategoryViewController.init(healthExperienceStore:healthStore:provenance:)()
{
  return AllHighlightsByCategoryViewController.init(healthExperienceStore:healthStore:provenance:)();
}

uint64_t type metadata accessor for AllHighlightsByCategoryViewController()
{
  return type metadata accessor for AllHighlightsByCategoryViewController();
}

uint64_t EditFavoritesCollectionViewController.init(pinnedContentManager:sourceProfiles:healthExperienceStore:)()
{
  return EditFavoritesCollectionViewController.init(pinnedContentManager:sourceProfiles:healthExperienceStore:)();
}

uint64_t type metadata accessor for EditFavoritesCollectionViewController()
{
  return type metadata accessor for EditFavoritesCollectionViewController();
}

uint64_t type metadata accessor for SummarySharingSetupAnalyticsBaseEvent.OnboardingLocation()
{
  return type metadata accessor for SummarySharingSetupAnalyticsBaseEvent.OnboardingLocation();
}

uint64_t TitleEmptyStateCollectionViewCellItem.init(title:)()
{
  return TitleEmptyStateCollectionViewCellItem.init(title:)();
}

uint64_t type metadata accessor for TitleEmptyStateCollectionViewCellItem()
{
  return type metadata accessor for TitleEmptyStateCollectionViewCellItem();
}

uint64_t CollapsibleListCollectionViewController.init(dataSource:)()
{
  return CollapsibleListCollectionViewController.init(dataSource:)();
}

uint64_t type metadata accessor for CollapsibleListCollectionViewController()
{
  return type metadata accessor for CollapsibleListCollectionViewController();
}

uint64_t EmergencyAccessBuddyStartViewController.init(healthStore:flow:emergencyStatus:)()
{
  return EmergencyAccessBuddyStartViewController.init(healthStore:flow:emergencyStatus:)();
}

uint64_t type metadata accessor for EmergencyAccessBuddyStartViewController()
{
  return type metadata accessor for EmergencyAccessBuddyStartViewController();
}

uint64_t type metadata accessor for NotificationAuthorizationAnalyticsEvent.SelectedAction()
{
  return type metadata accessor for NotificationAuthorizationAnalyticsEvent.SelectedAction();
}

uint64_t type metadata accessor for NotificationAuthorizationAnalyticsEvent.Context()
{
  return type metadata accessor for NotificationAuthorizationAnalyticsEvent.Context();
}

uint64_t NotificationAuthorizationAnalyticsEvent.init(context:featureDomain:featureName:selectedAction:)()
{
  return NotificationAuthorizationAnalyticsEvent.init(context:featureDomain:featureName:selectedAction:)();
}

uint64_t type metadata accessor for NotificationAuthorizationAnalyticsEvent()
{
  return type metadata accessor for NotificationAuthorizationAnalyticsEvent();
}

uint64_t dispatch thunk of PluginNotificationCenterDelegateProviding.providesCriticalAlerts()()
{
  return dispatch thunk of PluginNotificationCenterDelegateProviding.providesCriticalAlerts()();
}

uint64_t static SectionedDataSourceCardStackConfiguration.alertsStack(with:)()
{
  return static SectionedDataSourceCardStackConfiguration.alertsStack(with:)();
}

uint64_t type metadata accessor for SectionedDataSourceCardStackConfiguration()
{
  return type metadata accessor for SectionedDataSourceCardStackConfiguration();
}

uint64_t dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter()
{
  return dispatch thunk of CompoundDataSourceCollectionViewController.dataSource.getter();
}

uint64_t CompoundDataSourceCollectionViewController.init(dataSource:)()
{
  return CompoundDataSourceCollectionViewController.init(dataSource:)();
}

uint64_t dispatch thunk of CompoundDataSourceCollectionViewController.dataSourceAdaptor.getter()
{
  return dispatch thunk of CompoundDataSourceCollectionViewController.dataSourceAdaptor.getter();
}

uint64_t dispatch thunk of CompoundDataSourceCollectionViewController.dataSourceProvider.setter()
{
  return dispatch thunk of CompoundDataSourceCollectionViewController.dataSourceProvider.setter();
}

uint64_t CompoundDataSourceCollectionViewController.selectableHandler(in:at:)()
{
  return CompoundDataSourceCollectionViewController.selectableHandler(in:at:)();
}

uint64_t dispatch thunk of CompoundDataSourceCollectionViewController.usesAdaptiveMargins.setter()
{
  return dispatch thunk of CompoundDataSourceCollectionViewController.usesAdaptiveMargins.setter();
}

uint64_t type metadata accessor for CompoundDataSourceCollectionViewController()
{
  return type metadata accessor for CompoundDataSourceCollectionViewController();
}

uint64_t method lookup function for CompoundDataSourceCollectionViewController()
{
  return method lookup function for CompoundDataSourceCollectionViewController();
}

uint64_t type metadata accessor for ContentConfigurationCollectionViewListCell()
{
  return type metadata accessor for ContentConfigurationCollectionViewListCell();
}

uint64_t EmergencyAccessFollowUpStartViewController.init(healthStore:flow:emergencyStatus:)()
{
  return EmergencyAccessFollowUpStartViewController.init(healthStore:flow:emergencyStatus:)();
}

uint64_t type metadata accessor for EmergencyAccessFollowUpStartViewController()
{
  return type metadata accessor for EmergencyAccessFollowUpStartViewController();
}

uint64_t dispatch thunk of AdvertisableFeatureOnboardingViewController.hasAdvertisableFeatures.getter()
{
  return dispatch thunk of AdvertisableFeatureOnboardingViewController.hasAdvertisableFeatures.getter();
}

uint64_t AdvertisableFeatureOnboardingViewController.init(featureManager:featureIdentifiers:title:detailText:subtitleText:icon:)()
{
  return AdvertisableFeatureOnboardingViewController.init(featureManager:featureIdentifiers:title:detailText:subtitleText:icon:)();
}

uint64_t type metadata accessor for InternalSettingsFeatureStateListViewController()
{
  return type metadata accessor for InternalSettingsFeatureStateListViewController();
}

uint64_t JustObservingFetchedResultsControllerDataSource.init(frc:)()
{
  return JustObservingFetchedResultsControllerDataSource.init(frc:)();
}

uint64_t JustObservingFetchedResultsControllerDataSource.frc.getter()
{
  return JustObservingFetchedResultsControllerDataSource.frc.getter();
}

uint64_t dispatch thunk of AdvertisableFeaturePostCommitWorkItemViewController.navigationDelegate.setter()
{
  return dispatch thunk of AdvertisableFeaturePostCommitWorkItemViewController.navigationDelegate.setter();
}

uint64_t dispatch thunk of AdvertisableFeaturePostCommitWorkItemViewControllerFactory.makeViewController(for:)()
{
  return dispatch thunk of AdvertisableFeaturePostCommitWorkItemViewControllerFactory.makeViewController(for:)();
}

uint64_t AdvertisableFeaturePostCommitWorkItemViewControllerFactory.init(healthStore:)()
{
  return AdvertisableFeaturePostCommitWorkItemViewControllerFactory.init(healthStore:)();
}

uint64_t type metadata accessor for AdvertisableFeaturePostCommitWorkItemViewControllerFactory()
{
  return type metadata accessor for AdvertisableFeaturePostCommitWorkItemViewControllerFactory();
}

uint64_t static URLRouter.handleURL(_:options:rootViewController:)()
{
  return static URLRouter.handleURL(_:options:rootViewController:)();
}

uint64_t SampleDataDecoder.init(fileData:logger:calendar:dateShift:)()
{
  return SampleDataDecoder.init(fileData:logger:calendar:dateShift:)();
}

uint64_t SampleDataDecoder.decodeSamples()()
{
  return SampleDataDecoder.decodeSamples()();
}

uint64_t type metadata accessor for SampleDataDecoder()
{
  return type metadata accessor for SampleDataDecoder();
}

uint64_t SampleDataEncoder.encodeSamples()()
{
  return SampleDataEncoder.encodeSamples()();
}

uint64_t SampleDataEncoder.init(samples:logger:)()
{
  return SampleDataEncoder.init(samples:logger:)();
}

uint64_t type metadata accessor for SampleDataEncoder()
{
  return type metadata accessor for SampleDataEncoder();
}

uint64_t type metadata accessor for DarwinNotificationPublisher.DarwinNotificationName()
{
  return type metadata accessor for DarwinNotificationPublisher.DarwinNotificationName();
}

uint64_t DarwinNotificationPublisher.__allocating_init(name:queue:)()
{
  return DarwinNotificationPublisher.__allocating_init(name:queue:)();
}

uint64_t type metadata accessor for DarwinNotificationPublisher()
{
  return type metadata accessor for DarwinNotificationPublisher();
}

uint64_t static HKSampleDataCodingConstants.categoryTypeIdentifierPrefix.getter()
{
  return static HKSampleDataCodingConstants.categoryTypeIdentifierPrefix.getter();
}

uint64_t static HKSampleDataCodingConstants.quantityTypeIdentifierPrefix.getter()
{
  return static HKSampleDataCodingConstants.quantityTypeIdentifierPrefix.getter();
}

uint64_t dispatch thunk of PluginBundleProvider.loadAndValidatePluginBundle(named:)()
{
  return dispatch thunk of PluginBundleProvider.loadAndValidatePluginBundle(named:)();
}

uint64_t dispatch thunk of PluginBundleProvider.notificationDelegateProvidingPluginBundles.getter()
{
  return dispatch thunk of PluginBundleProvider.notificationDelegateProvidingPluginBundles.getter();
}

uint64_t dispatch thunk of PluginBundleProvider.allPluginBundleNames()()
{
  return dispatch thunk of PluginBundleProvider.allPluginBundleNames()();
}

uint64_t dispatch thunk of PluginBundleProvider.loadPluginBundle(named:)()
{
  return dispatch thunk of PluginBundleProvider.loadPluginBundle(named:)();
}

uint64_t dispatch thunk of PluginBundleProvider.loadAllPlugins()()
{
  return dispatch thunk of PluginBundleProvider.loadAllPlugins()();
}

uint64_t dispatch thunk of PluginBundleProvider.disabledPlugins.getter()
{
  return dispatch thunk of PluginBundleProvider.disabledPlugins.getter();
}

uint64_t static AllDataSummarySection.Identifier.defaultAllDataSummarySections.getter()
{
  return static AllDataSummarySection.Identifier.defaultAllDataSummarySections.getter();
}

uint64_t static FoundationPluginBundleProvider.sharedInstance.getter()
{
  return static FoundationPluginBundleProvider.sharedInstance.getter();
}

uint64_t type metadata accessor for FoundationPluginBundleProvider()
{
  return type metadata accessor for FoundationPluginBundleProvider();
}

uint64_t static SummaryTabFeedPopulationManager.highlightsSectionTimeout.getter()
{
  return static SummaryTabFeedPopulationManager.highlightsSectionTimeout.getter();
}

uint64_t type metadata accessor for SummaryTabFeedPopulationManager()
{
  return type metadata accessor for SummaryTabFeedPopulationManager();
}

uint64_t static UTType.commaSeparatedText.getter()
{
  return static UTType.commaSeparatedText.getter();
}

uint64_t type metadata accessor for UTType()
{
  return type metadata accessor for UTType();
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

uint64_t OSSignposter.logHandle.getter()
{
  return OSSignposter.logHandle.getter();
}

uint64_t OSSignposter.init(subsystem:category:)()
{
  return OSSignposter.init(subsystem:category:)();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
}

uint64_t static Logger.pinnedContent.getter()
{
  return static Logger.pinnedContent.getter();
}

uint64_t static Logger.dataSource.getter()
{
  return static Logger.dataSource.getter();
}

uint64_t static Logger.healthSubsystem.getter()
{
  return static Logger.healthSubsystem.getter();
}

uint64_t static Logger.personalization.getter()
{
  return static Logger.personalization.getter();
}

uint64_t static Logger.advertisableFeatures.getter()
{
  return static Logger.advertisableFeatures.getter();
}

uint64_t static Logger.view.getter()
{
  return static Logger.view.getter();
}

uint64_t static Logger.plugin.getter()
{
  return static Logger.plugin.getter();
}

uint64_t static Logger.general.getter()
{
  return static Logger.general.getter();
}

uint64_t static Logger.profile.getter()
{
  return static Logger.profile.getter();
}

uint64_t static Logger.cloudSync.getter()
{
  return static Logger.cloudSync.getter();
}

uint64_t static Logger.notifications.getter()
{
  return static Logger.notifications.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for UICellAccessory.DisplayedState()
{
  return type metadata accessor for UICellAccessory.DisplayedState();
}

uint64_t type metadata accessor for UICellAccessory.LayoutDimension()
{
  return type metadata accessor for UICellAccessory.LayoutDimension();
}

uint64_t static UICellAccessory.outlineDisclosure(displayed:options:actionHandler:)()
{
  return static UICellAccessory.outlineDisclosure(displayed:options:actionHandler:)();
}

uint64_t static UICellAccessory.disclosureIndicator(displayed:options:)()
{
  return static UICellAccessory.disclosureIndicator(displayed:options:)();
}

uint64_t type metadata accessor for UICellAccessory.OutlineDisclosureOptions.Style()
{
  return type metadata accessor for UICellAccessory.OutlineDisclosureOptions.Style();
}

uint64_t UICellAccessory.OutlineDisclosureOptions.init(style:isHidden:reservedLayoutWidth:tintColor:)()
{
  return UICellAccessory.OutlineDisclosureOptions.init(style:isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t type metadata accessor for UICellAccessory.OutlineDisclosureOptions()
{
  return type metadata accessor for UICellAccessory.OutlineDisclosureOptions();
}

uint64_t UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)()
{
  return UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t type metadata accessor for UICellAccessory.DisclosureIndicatorOptions()
{
  return type metadata accessor for UICellAccessory.DisclosureIndicatorOptions();
}

uint64_t type metadata accessor for UICellAccessory()
{
  return type metadata accessor for UICellAccessory();
}

uint64_t UIMutableTraits.rootNavigationMode.setter()
{
  return UIMutableTraits.rootNavigationMode.setter();
}

uint64_t type metadata accessor for UITraitOverrides()
{
  return type metadata accessor for UITraitOverrides();
}

uint64_t type metadata accessor for UIBackgroundConfiguration()
{
  return type metadata accessor for UIBackgroundConfiguration();
}

uint64_t type metadata accessor for UITraitUserInterfaceStyle()
{
  return type metadata accessor for UITraitUserInterfaceStyle();
}

uint64_t static UIListContentConfiguration.groupedHeader()()
{
  return static UIListContentConfiguration.groupedHeader()();
}

uint64_t UIListContentConfiguration.TextProperties.color.setter()
{
  return UIListContentConfiguration.TextProperties.color.setter();
}

uint64_t UIListContentConfiguration.textProperties.modify()
{
  return UIListContentConfiguration.textProperties.modify();
}

uint64_t static UIListContentConfiguration.extraProminentInsetGroupedHeader()()
{
  return static UIListContentConfiguration.extraProminentInsetGroupedHeader()();
}

uint64_t static UIListContentConfiguration.cell()()
{
  return static UIListContentConfiguration.cell()();
}

uint64_t UIListContentConfiguration.text.setter()
{
  return UIListContentConfiguration.text.setter();
}

uint64_t UIListContentConfiguration.image.setter()
{
  return UIListContentConfiguration.image.setter();
}

uint64_t static UIListContentConfiguration.header()()
{
  return static UIListContentConfiguration.header()();
}

uint64_t type metadata accessor for UIListContentConfiguration()
{
  return type metadata accessor for UIListContentConfiguration();
}

uint64_t type metadata accessor for UITraitHorizontalSizeClass()
{
  return type metadata accessor for UITraitHorizontalSizeClass();
}

uint64_t NSDiffableDataSourceSnapshot.numberOfItems.getter()
{
  return NSDiffableDataSourceSnapshot.numberOfItems.getter();
}

uint64_t NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)()
{
  return NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)();
}

uint64_t NSDiffableDataSourceSnapshot.indexPath(for:)()
{
  return NSDiffableDataSourceSnapshot.indexPath(for:)();
}

uint64_t NSDiffableDataSourceSnapshot.sectionIdentifiers.getter()
{
  return NSDiffableDataSourceSnapshot.sectionIdentifiers.getter();
}

uint64_t static NSDiffableDataSourceSnapshot._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static NSDiffableDataSourceSnapshot._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t NSDiffableDataSourceSnapshot.init()()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t type metadata accessor for NSDiffableDataSourceSnapshot()
{
  return type metadata accessor for NSDiffableDataSourceSnapshot();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration.Appearance()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.Appearance();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode();
}

uint64_t UICollectionLayoutListConfiguration.init(appearance:)()
{
  return UICollectionLayoutListConfiguration.init(appearance:)();
}

uint64_t UICollectionLayoutListConfiguration.headerMode.setter()
{
  return UICollectionLayoutListConfiguration.headerMode.setter();
}

uint64_t UICollectionLayoutListConfiguration.showsSeparators.setter()
{
  return UICollectionLayoutListConfiguration.showsSeparators.setter();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration()
{
  return type metadata accessor for UICollectionLayoutListConfiguration();
}

uint64_t type metadata accessor for Publishers.Map()
{
  return type metadata accessor for Publishers.Map();
}

uint64_t type metadata accessor for Publishers.First()
{
  return type metadata accessor for Publishers.First();
}

uint64_t type metadata accessor for Publishers.ReceiveOn()
{
  return type metadata accessor for Publishers.ReceiveOn();
}

uint64_t type metadata accessor for AnyPublisher()
{
  return type metadata accessor for AnyPublisher();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
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

uint64_t CurrentValueSubject.init(_:)()
{
  return CurrentValueSubject.init(_:)();
}

uint64_t type metadata accessor for Future()
{
  return type metadata accessor for Future();
}

uint64_t Future.init(_:)()
{
  return Future.init(_:)();
}

uint64_t Deferred.init(createPublisher:)()
{
  return Deferred.init(createPublisher:)();
}

uint64_t type metadata accessor for Deferred()
{
  return type metadata accessor for Deferred();
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

uint64_t type metadata accessor for Published.Publisher()
{
  return type metadata accessor for Published.Publisher();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t Publisher<>.asDataSource()()
{
  return Publisher<>.asDataSource()();
}

uint64_t Publisher.retainingSink(receiveValue:)()
{
  return Publisher.retainingSink(receiveValue:)();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t Publisher.map<A>(_:)()
{
  return Publisher.map<A>(_:)();
}

uint64_t Publisher.first()()
{
  return Publisher.first()();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher.dropFirst(_:)()
{
  return Publisher.dropFirst(_:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t DatePicker<>.init(_:selection:displayedComponents:)()
{
  return DatePicker<>.init(_:selection:displayedComponents:)();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t ToolbarItem<>.init(placement:content:)()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t type metadata accessor for ToolbarItem()
{
  return type metadata accessor for ToolbarItem();
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

uint64_t AnyShapeStyle.init<A>(_:)()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t type metadata accessor for _VariadicView.Tree()
{
  return type metadata accessor for _VariadicView.Tree();
}

uint64_t NavigationLink.init(destination:label:)()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t type metadata accessor for NavigationLink()
{
  return type metadata accessor for NavigationLink();
}

uint64_t NavigationView.init(content:)()
{
  return NavigationView.init(content:)();
}

uint64_t type metadata accessor for NavigationView()
{
  return type metadata accessor for NavigationView();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t type metadata accessor for TagValueTraitKey.Value()
{
  return type metadata accessor for TagValueTraitKey.Value();
}

uint64_t type metadata accessor for TagValueTraitKey()
{
  return type metadata accessor for TagValueTraitKey();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.tint.getter()
{
  return EnvironmentValues.tint.getter();
}

uint64_t EnvironmentValues.tint.setter()
{
  return EnvironmentValues.tint.setter();
}

uint64_t EnvironmentValues.editMode.getter()
{
  return EnvironmentValues.editMode.getter();
}

uint64_t EnvironmentValues.editMode.setter()
{
  return EnvironmentValues.editMode.setter();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t type metadata accessor for NavigationBarItem.TitleDisplayMode()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t static VerticalAlignment.firstTextBaseline.getter()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
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

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t TupleToolbarContent.init(_:)()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t type metadata accessor for UIHostingController()
{
  return type metadata accessor for UIHostingController();
}

uint64_t type metadata accessor for _ConditionalContent.Storage()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for _ConditionalContent()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t static DatePickerComponents.hourAndMinute.getter()
{
  return static DatePickerComponents.hourAndMinute.getter();
}

uint64_t static DatePickerComponents.date.getter()
{
  return static DatePickerComponents.date.getter();
}

uint64_t type metadata accessor for DatePickerComponents()
{
  return type metadata accessor for DatePickerComponents();
}

uint64_t static SearchFieldPlacement.automatic.getter()
{
  return static SearchFieldPlacement.automatic.getter();
}

uint64_t type metadata accessor for SearchFieldPlacement()
{
  return type metadata accessor for SearchFieldPlacement();
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

uint64_t type metadata accessor for ToolbarItemPlacement()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t InsetGroupedListStyle.init()()
{
  return InsetGroupedListStyle.init()();
}

uint64_t type metadata accessor for InsetGroupedListStyle()
{
  return type metadata accessor for InsetGroupedListStyle();
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

uint64_t type metadata accessor for _EnvironmentKeyWritingModifier()
{
  return type metadata accessor for _EnvironmentKeyWritingModifier();
}

uint64_t static Font.body.getter()
{
  return static Font.body.getter();
}

uint64_t static Font.caption.getter()
{
  return static Font.caption.getter();
}

uint64_t Form.init(content:)()
{
  return Form.init(content:)();
}

uint64_t type metadata accessor for Form()
{
  return type metadata accessor for Form();
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

uint64_t Text.monospaced(_:)()
{
  return Text.monospaced(_:)();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.searchable(text:placement:prompt:)()
{
  return View.searchable(text:placement:prompt:)();
}

uint64_t View.environment<A>(_:_:)()
{
  return View.environment<A>(_:_:)();
}

uint64_t View.refreshable(action:)()
{
  return View.refreshable(action:)();
}

uint64_t View.swipeActions<A>(edge:allowsFullSwipe:content:)()
{
  return View.swipeActions<A>(edge:allowsFullSwipe:content:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.navigationTitle(_:)()
{
  return View.navigationTitle(_:)();
}

uint64_t View.navigationTitle<A>(_:)()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t View.interactiveDismissDisabled(_:)()
{
  return View.interactiveDismissDisabled(_:)();
}

uint64_t View.navigationBarTitleDisplayMode(_:)()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t View.alert(isPresented:content:)()
{
  return View.alert(isPresented:content:)();
}

uint64_t View.sheet<A>(isPresented:onDismiss:content:)()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t View._trait<A>(_:_:)()
{
  return View._trait<A>(_:_:)();
}

uint64_t View.toolbar<A>(content:)()
{
  return View.toolbar<A>(content:)();
}

uint64_t View.listStyle<A>(_:)()
{
  return View.listStyle<A>(_:)();
}

uint64_t Alert.init(title:message:dismissButton:)()
{
  return Alert.init(title:message:dismissButton:)();
}

uint64_t static Alert.Button.default(_:action:)()
{
  return static Alert.Button.default(_:action:)();
}

uint64_t type metadata accessor for Alert.Button()
{
  return type metadata accessor for Alert.Button();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t static Color.secondary.getter()
{
  return static Color.secondary.getter();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Label()
{
  return type metadata accessor for Label();
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

uint64_t type metadata accessor for HStack()
{
  return type metadata accessor for HStack();
}

uint64_t type metadata accessor for VStack()
{
  return type metadata accessor for VStack();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.wrappedValue.setter()
{
  return Binding.wrappedValue.setter();
}

uint64_t static Binding.constant(_:)()
{
  return static Binding.constant(_:)();
}

uint64_t type metadata accessor for Binding()
{
  return type metadata accessor for Binding();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t type metadata accessor for ForEach()
{
  return type metadata accessor for ForEach();
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

uint64_t type metadata accessor for Section()
{
  return type metadata accessor for Section();
}

uint64_t type metadata accessor for EditMode()
{
  return type metadata accessor for EditMode();
}

uint64_t ShareLink<>.init<>(item:subject:message:label:)()
{
  return ShareLink<>.init<>(item:subject:message:label:)();
}

uint64_t type metadata accessor for ShareLink()
{
  return type metadata accessor for ShareLink();
}

uint64_t TextField<>.init<A>(_:text:onEditingChanged:onCommit:)()
{
  return TextField<>.init<A>(_:text:onEditingChanged:onCommit:)();
}

uint64_t type metadata accessor for TupleView()
{
  return type metadata accessor for TupleView();
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

uint64_t static DispatchQoS.userInteractive.getter()
{
  return static DispatchQoS.userInteractive.getter();
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

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

{
  return + infix(_:_:)();
}

uint64_t static HKSamplePredicate.sample(type:predicate:)()
{
  return static HKSamplePredicate.sample(type:predicate:)();
}

uint64_t HKSampleQueryDescriptor.init(predicates:sortDescriptors:limit:)()
{
  return HKSampleQueryDescriptor.init(predicates:sortDescriptors:limit:)();
}

uint64_t type metadata accessor for HKSampleQueryDescriptor()
{
  return type metadata accessor for HKSampleQueryDescriptor();
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

uint64_t type metadata accessor for Dictionary()
{
  return type metadata accessor for Dictionary();
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

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t String.LocalizationValue.init(_:)()
{
  return String.LocalizationValue.init(_:)();
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

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t String.init(localized:)()
{
  return String.init(localized:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.init<A>(reflecting:)()
{
  return String.init<A>(reflecting:)();
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t String.init<A>(describingSensitive:)()
{
  return String.init<A>(describingSensitive:)();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.nonEmptyOrNil.getter()
{
  return String.nonEmptyOrNil.getter();
}

uint64_t static String.defaultURLProviderSubtitle.getter()
{
  return static String.defaultURLProviderSubtitle.getter();
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

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
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

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
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

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
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

uint64_t type metadata accessor for CheckedContinuation()
{
  return type metadata accessor for CheckedContinuation();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.Index._asCocoa.modify()
{
  return Set.Index._asCocoa.modify();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t type metadata accessor for Set()
{
  return type metadata accessor for Set();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t NSPredicate.init(format:_:)()
{
  return NSPredicate.init(format:_:)();
}

uint64_t UIKeyCommand.init(title:image:action:input:modifierFlags:propertyList:alternates:discoverabilityTitle:attributes:state:)()
{
  return UIKeyCommand.init(title:image:action:input:modifierFlags:propertyList:alternates:discoverabilityTitle:attributes:state:)();
}

uint64_t UIStoryboard.instantiateViewController<A>(identifier:creator:)()
{
  return UIStoryboard.instantiateViewController<A>(identifier:creator:)();
}

uint64_t HKDisplayType.pinnedContentIdentifier.getter()
{
  return HKDisplayType.pinnedContentIdentifier.getter();
}

uint64_t HKHealthStore.sourceProfile.getter()
{
  return HKHealthStore.sourceProfile.getter();
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

HKCategoryType __swiftcall HKCategoryType.init(_:)(__C::HKCategoryTypeIdentifier a1)
{
  return (HKCategoryType)HKCategoryType.init(_:)(a1._rawValue);
}

HKQuantityType __swiftcall HKQuantityType.init(_:)(__C::HKQuantityTypeIdentifier a1)
{
  return (HKQuantityType)HKQuantityType.init(_:)(a1._rawValue);
}

uint64_t NSUserActivity.fetchProfileIdentifier()()
{
  return NSUserActivity.fetchProfileIdentifier()();
}

uint64_t NSUserActivity.retrieveUserInfoValueForKey<A>(_:)()
{
  return NSUserActivity.retrieveUserInfoValueForKey<A>(_:)();
}

uint64_t static NSUserDefaults.healthAppShared.getter()
{
  return static NSUserDefaults.healthAppShared.getter();
}

UIBarButtonItem __swiftcall UIBarButtonItem.init(systemItem:primaryAction:menu:)(UIBarButtonSystemItem systemItem, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return (UIBarButtonItem)UIBarButtonItem.init(systemItem:primaryAction:menu:)(systemItem, primaryAction.value.super.super.isa, *(void *)&primaryAction.is_nil, menu.value.super.super.isa, *(void *)&menu.is_nil);
}

uint64_t HKKeyValueDomain.date(for:)()
{
  return HKKeyValueDomain.date(for:)();
}

Swift::Int_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HKKeyValueDomain.integer(for:)(Swift::String a1)
{
  Swift::Int v1 = HKKeyValueDomain.integer(for:)(a1._countAndFlagsBits, a1._object);
  result.value = v1;
  result.is_nil = v2;
  return result;
}

uint64_t static NSOperationQueue.userInitiated.getter()
{
  return static NSOperationQueue.userInitiated.getter();
}

uint64_t static NSOperationQueue.utility.getter()
{
  return static NSOperationQueue.utility.getter();
}

uint64_t NSSortDescriptor.init<A, B>(keyPath:ascending:)()
{
  return NSSortDescriptor.init<A, B>(keyPath:ascending:)();
}

uint64_t UICollectionView.registerCell<A>(_:)()
{
  return UICollectionView.registerCell<A>(_:)();
}

uint64_t UIViewController.containsViewController<A>(ofType:)()
{
  return UIViewController.containsViewController<A>(ofType:)();
}

uint64_t UIViewController.resolvedHealthExperienceStore.getter()
{
  return UIViewController.resolvedHealthExperienceStore.getter();
}

uint64_t UIViewController.resolvedPresentation.getter()
{
  return UIViewController.resolvedPresentation.getter();
}

uint64_t UIViewController.resolvedPinnedContentManager.getter()
{
  return UIViewController.resolvedPinnedContentManager.getter();
}

uint64_t UIViewController.traitOverrides.getter()
{
  return UIViewController.traitOverrides.getter();
}

uint64_t UIViewController.traitOverrides.setter()
{
  return UIViewController.traitOverrides.setter();
}

uint64_t UIViewController.registerForTraitChanges(_:action:)()
{
  return UIViewController.registerForTraitChanges(_:action:)();
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

uint64_t UITraitCollection.rootNavigationMode.getter()
{
  return UITraitCollection.rootNavigationMode.getter();
}

uint64_t static UITraitCollection.systemTraitsAffectingColorAppearance.getter()
{
  return static UITraitCollection.systemTraitsAffectingColorAppearance.getter();
}

uint64_t static NSNotificationName.primaryProfileNameWasUpdated.getter()
{
  return static NSNotificationName.primaryProfileNameWasUpdated.getter();
}

uint64_t static NSNotificationName.healthAppNotificationSettingsDidChange.getter()
{
  return static NSNotificationName.healthAppNotificationSettingsDidChange.getter();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t static HKCloudSyncObserver.statusPublisher(for:)()
{
  return static HKCloudSyncObserver.statusPublisher(for:)();
}

Swift::Void __swiftcall OBWelcomeController.removeOBContentViewHeightConstraints()()
{
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

Swift::Void __swiftcall HKNavigationController.reparentModalToPushIfPossible()()
{
}

Swift::Void __swiftcall HKNavigationController.reparentPushToModalIfPossible()()
{
}

uint64_t NSManagedObjectContext.feedItemsController(sortDescriptors:predicate:sectionNameKeyPath:)()
{
  return NSManagedObjectContext.feedItemsController(sortDescriptors:predicate:sectionNameKeyPath:)();
}

uint64_t NSManagedObjectContext.doesFeedEligibleForDisplayExist(kind:associatedProfileIdentifier:)()
{
  return NSManagedObjectContext.doesFeedEligibleForDisplayExist(kind:associatedProfileIdentifier:)();
}

uint64_t NSManagedObjectContext.makeFeedItemsFetchedResultsController(for:associatedProfileIdentifier:)()
{
  return NSManagedObjectContext.makeFeedItemsFetchedResultsController(for:associatedProfileIdentifier:)();
}

UIViewController_optional __swiftcall UINavigationController.rootViewController()()
{
  uint64_t v0 = (objc_class *)UINavigationController.rootViewController()();
  result.value.super.super.Class isa = v0;
  result.is_nil = v1;
  return result;
}

NSCollectionLayoutSection __swiftcall NSCollectionLayoutSection.withHeader(height:alignment:)(NSCollectionLayoutDimension height, NSRectAlignment alignment)
{
  return (NSCollectionLayoutSection)NSCollectionLayoutSection.withHeader(height:alignment:)(height.super.isa, alignment);
}

uint64_t static NSCollectionLayoutSection.list(using:layoutEnvironment:)()
{
  return static NSCollectionLayoutSection.list(using:layoutEnvironment:)();
}

uint64_t static UIImageSymbolConfiguration.sidebarSymbolConfig.getter()
{
  return static UIImageSymbolConfiguration.sidebarSymbolConfig.getter();
}

uint64_t static UIFont.createFont(with:weight:traits:rounded:maximumContentSizeCategory:respectsDynamicType:)()
{
  return static UIFont.createFont(with:weight:traits:rounded:maximumContentSizeCategory:respectsDynamicType:)();
}

uint64_t NSBundle.getPluginAppDelegateClass()()
{
  return NSBundle.getPluginAppDelegateClass()();
}

uint64_t NSBundle.getPluginAppDelegateObject<A>(as:)()
{
  return NSBundle.getPluginAppDelegateObject<A>(as:)();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.localizedCapitalized.getter()
{
  return StringProtocol.localizedCapitalized.getter();
}

uint64_t StringProtocol.localizedStandardCompare<A>(_:)()
{
  return StringProtocol.localizedStandardCompare<A>(_:)();
}

uint64_t StringProtocol.localizedStandardContains<A>(_:)()
{
  return StringProtocol.localizedStandardContains<A>(_:)();
}

uint64_t StringProtocol.localizedCaseInsensitiveContains<A>(_:)()
{
  return StringProtocol.localizedCaseInsensitiveContains<A>(_:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
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

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.Index.handleBitPattern.getter()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
}

uint64_t __CocoaSet.formIndex(after:isUnique:)()
{
  return __CocoaSet.formIndex(after:isUnique:)();
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

uint64_t type metadata accessor for _SetStorage()
{
  return type metadata accessor for _SetStorage();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
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

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _ArrayProtocol.filter(_:)()
{
  return _ArrayProtocol.filter(_:)();
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

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t type metadata accessor for _DictionaryStorage()
{
  return type metadata accessor for _DictionaryStorage();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t type metadata accessor for _ContiguousArrayStorage()
{
  return type metadata accessor for _ContiguousArrayStorage();
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

uint64_t type metadata accessor for Result()
{
  return type metadata accessor for Result();
}

uint64_t type metadata accessor for KeyPath()
{
  return type metadata accessor for KeyPath();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t HAFeatureFlagPreloadSummaryCells()
{
  return _HAFeatureFlagPreloadSummaryCells();
}

uint64_t HAFeatureFlagShowTrendsInSummary()
{
  return _HAFeatureFlagShowTrendsInSummary();
}

uint64_t HKDisplayCategoryIdentifierToString()
{
  return _HKDisplayCategoryIdentifierToString();
}

uint64_t HKPreferredRegulatoryDomainProvider()
{
  return _HKPreferredRegulatoryDomainProvider();
}

uint64_t HKSPSleepURLWithOptions()
{
  return _HKSPSleepURLWithOptions();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return _HKUIJoinStringsForAutomationIdentifier();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringFromHKNotificationInstructionAction()
{
  return _NSStringFromHKNotificationInstructionAction();
}

uint64_t TCCAccessRequest()
{
  return _TCCAccessRequest();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKAllCategoryTypes()
{
  return __HKAllCategoryTypes();
}

uint64_t _HKAllQuantityTypes()
{
  return __HKAllQuantityTypes();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
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

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
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

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
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

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
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

uint64_t swift_getExistentialMetatypeMetadata()
{
  return _swift_getExistentialMetatypeMetadata();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
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

uint64_t swift_isClassType()
{
  return _swift_isClassType();
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

uint64_t swift_task_getMainExecutor()
{
  return _swift_task_getMainExecutor();
}

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
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