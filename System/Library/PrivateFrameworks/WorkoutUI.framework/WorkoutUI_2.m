unint64_t sub_261B46B18()
{
  unint64_t result;

  result = qword_26A947FD8;
  if (!qword_26A947FD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A947FC0);
    sub_261B4B280(&qword_26A947FE0, &qword_26A947FE8);
    sub_2619F8AB8(&qword_26A947FF0, &qword_26A947FF8);
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A947FD8);
  }
  return result;
}

unint64_t sub_261B46BD8()
{
  unint64_t result = qword_26A948000;
  if (!qword_26A948000)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A947FC8);
    sub_261B46C4C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948000);
  }
  return result;
}

unint64_t sub_261B46C4C()
{
  unint64_t result = qword_26A948008;
  if (!qword_26A948008)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948010);
    sub_2619F8AB8(&qword_26A943050, &qword_26A943058);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948008);
  }
  return result;
}

unint64_t sub_261B46CEC()
{
  unint64_t result = qword_26A948018;
  if (!qword_26A948018)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A947FD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948018);
  }
  return result;
}

uint64_t type metadata accessor for MetricTextiOSPlatter()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for MetricTextWatchOS()
{
  return swift_getGenericMetadata();
}

uint64_t sub_261B46D88@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3)
  {
    sub_261A029C4();
    sub_261B8F758();
    uint64_t result = sub_261B8E3D8();
    uint64_t v3 = v7 & 1;
  }
  else
  {
    uint64_t result = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  *a2 = result;
  a2[1] = v5;
  a2[2] = v3;
  a2[3] = v6;
  return result;
}

uint64_t sub_261B46E18()
{
  return sub_261B8D888();
}

uint64_t sub_261B46E3C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26A948030);
  MEMORY[0x270FA5388](v2 - 8);
  sub_261B4B438(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_261B8D898();
}

uint64_t sub_261B46EC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_261A029C4();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_261B8E3D8();
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  int v11 = *(unsigned __int8 *)(a1 + 48);
  double v12 = 1.0;
  if (v11 == 1) {
    double v12 = *(double *)(a1 + *(int *)(type metadata accessor for MetricTextWithAccessory() + 48));
  }
  uint64_t result = sub_261B8ECC8();
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v10;
  *(double *)(a2 + 32) = v12;
  *(void *)(a2 + 40) = result;
  *(unsigned char *)(a2 + 48) = v11;
  return result;
}

uint64_t sub_261B46FA8@<X0>(uint64_t a1@<X8>)
{
  return sub_261B46EC8(*(void *)(v1 + 32), a1);
}

uint64_t sub_261B46FC8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_261B8E398();
  MEMORY[0x270FA5388](v4);
  char v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + 24);
  if (v9)
  {
    uint64_t v28 = v6;
    uint64_t v29 = v5;
    uint64_t v30 = *(void *)(a1 + 16);
    uint64_t v31 = v9;
    sub_261A029C4();
    uint64_t v30 = sub_261B8F768();
    uint64_t v31 = v10;
    uint64_t v11 = sub_261B8E3D8();
    uint64_t v13 = v12;
    char v15 = v14;
    uint64_t v16 = type metadata accessor for MetricTextWithAccessory();
    sub_261B45690(v16, &v30);
    if (v30 == 4) {
      sub_261B8E378();
    }
    else {
      sub_261B8E388();
    }
    char v23 = v15 & 1;
    uint64_t v17 = sub_261B8E3A8();
    uint64_t v18 = v24;
    uint64_t v20 = v25;
    uint64_t v19 = v26 & 1;
    sub_261A02A18(v11, v13, v23);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v29);
    if (qword_26A942F20 != -1) {
      swift_once();
    }
    uint64_t v22 = qword_26A953738;
    uint64_t result = swift_getKeyPath();
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t result = 0;
    uint64_t v22 = 0;
  }
  *a2 = v17;
  a2[1] = v18;
  a2[2] = v19;
  a2[3] = v20;
  a2[4] = result;
  a2[5] = v22;
  return result;
}

uint64_t sub_261B471F0@<X0>(uint64_t *a1@<X8>)
{
  return sub_261B46FC8(*(void *)(v1 + 32), a1);
}

uint64_t sub_261B471FC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    sub_261A029C4();
    sub_261B8F768();
    uint64_t result = sub_261B8E3D8();
    uint64_t v3 = v7 & 1;
  }
  else
  {
    uint64_t result = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  *a2 = result;
  a2[1] = v5;
  a2[2] = v3;
  a2[3] = v6;
  return result;
}

uint64_t sub_261B4728C()
{
  return sub_261B8D888();
}

uint64_t sub_261B472B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26A948030);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_261B47314@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v25[1] = a5;
  uint64_t v8 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  v25[0] = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v25 - v11;
  uint64_t v13 = type metadata accessor for MetricTextWithAccessory();
  uint64_t v27 = sub_261B4541C();
  uint64_t v28 = v14;
  sub_261A029C4();
  uint64_t v15 = sub_261B8E3D8();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_261A8FE78(a2 + *(int *)(v13 + 40), a3);
  uint64_t v27 = v15;
  uint64_t v28 = v17;
  char v29 = v21;
  uint64_t v30 = v19;
  v31[0] = &v27;
  uint64_t v22 = (char *)v25[0];
  (*(void (**)(void, char *, uint64_t))(v8 + 16))(v25[0], v12, a3);
  v31[1] = v22;
  sub_261A001D0(v15, v17, v21);
  swift_bridgeObjectRetain();
  v26[0] = MEMORY[0x263F1A830];
  v26[1] = a3;
  v25[2] = MEMORY[0x263F1A820];
  v25[3] = a4;
  sub_261A2CEA4((uint64_t)v31, 2uLL, (uint64_t)v26);
  char v23 = *(void (**)(char *, uint64_t))(v8 + 8);
  v23(v12, a3);
  sub_261A02A18(v15, v17, v21);
  swift_bridgeObjectRelease();
  v23(v22, a3);
  sub_261A02A18(v27, v28, v29);
  return swift_bridgeObjectRelease();
}

uint64_t sub_261B47534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_261B47314(a1, v2[4], v2[2], v2[3], a2);
}

uint64_t sub_261B47554@<X0>(uint64_t *a1@<X8>)
{
  return sub_261B46D88(*(void *)(v1 + 32), a1);
}

uint64_t sub_261B47560@<X0>(uint64_t *a1@<X8>)
{
  return sub_261B471FC(*(void *)(v1 + 32), a1);
}

uint64_t MetricText.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1[1];
  uint64_t v14 = *v1;
  uint64_t v5 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  char v8 = *((unsigned char *)v1 + 48);
  char v9 = *((unsigned char *)v1 + 49);
  uint64_t v11 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a1 = v14;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 49) = v9;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v10;
  *(unsigned char *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = KeyPath;
  *(unsigned char *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0x3FD6666666666666;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_261B47654()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_261B47698()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_261B476B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1[1];
  uint64_t v14 = *v1;
  uint64_t v5 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  char v8 = *((unsigned char *)v1 + 48);
  char v9 = *((unsigned char *)v1 + 49);
  uint64_t v11 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a1 = v14;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 49) = v9;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v10;
  *(unsigned char *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = KeyPath;
  *(unsigned char *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0x3FD6666666666666;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for MetricTextDescriptor()
{
  return &type metadata for MetricTextDescriptor;
}

uint64_t sub_261B477AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_261B477B4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_261B47870(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 73) & ~v6) + 23) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v10 = *a2;
    *(void *)a1 = *a2;
    a1 = v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16));
    swift_retain();
  }
  else
  {
    uint64_t v11 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v11;
    uint64_t v12 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v12;
    uint64_t v13 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v13;
    *(_WORD *)(a1 + 48) = *((_WORD *)a2 + 24);
    uint64_t v14 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v14;
    uint64_t v15 = (a1 + v6 + 73) & ~v6;
    *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
    uint64_t v16 = ((unint64_t)a2 + v6 + 73) & ~v6;
    uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v17(v15, v16, v4);
    uint64_t v18 = v15 + v7;
    unint64_t v19 = (v15 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v20 = (v16 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v21 = *(void *)v20;
    LOBYTE(v12) = *(unsigned char *)(v20 + 8);
    sub_2619F7774(*(void *)v20, v12);
    *(void *)unint64_t v19 = v21;
    *(unsigned char *)(v19 + 8) = v12;
    *(void *)((v18 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v16 + v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  }
  return a1;
}

uint64_t sub_261B47A24(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = v4 + 8;
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 73) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v6);
  unint64_t v7 = (*(void *)(v5 + 56) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)v7;
  char v9 = *(unsigned char *)(v7 + 8);
  return sub_2619F7790(v8, v9);
}

uint64_t sub_261B47AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v8 = *(void *)(a3 + 16);
  char v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
  uint64_t v10 = *(void *)(v8 - 8) + 16;
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(v8 - 8) + 80);
  uint64_t v12 = (v11 + 73 + a1) & ~v11;
  uint64_t v13 = (v11 + 73 + a2) & ~v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v12, v13, v8);
  uint64_t v14 = *(void *)(v10 + 48);
  uint64_t v15 = v14 + v12;
  uint64_t v16 = v14 + v13;
  unint64_t v17 = (v14 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (v14 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = *(void *)v18;
  LOBYTE(v6) = *(unsigned char *)(v18 + 8);
  sub_2619F7774(*(void *)v18, v6);
  *(void *)unint64_t v17 = v19;
  *(unsigned char *)(v17 + 8) = v6;
  *(void *)((v15 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_261B47C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = (v8 + 73 + a1) & ~v8;
  uint64_t v10 = (v8 + 73 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v9, v10);
  uint64_t v11 = *(void *)(v7 + 40);
  uint64_t v12 = v11 + v9;
  uint64_t v13 = v11 + v10;
  unint64_t v14 = (v11 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v15 = (v11 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = *(void *)v15;
  LOBYTE(v9) = *(unsigned char *)(v15 + 8);
  sub_2619F7774(*(void *)v15, v9);
  uint64_t v17 = *(void *)v14;
  char v18 = *(unsigned char *)(v14 + 8);
  *(void *)unint64_t v14 = v16;
  *(unsigned char *)(v14 + 8) = v9;
  sub_2619F7790(v17, v18);
  *(void *)((v12 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_261B47D84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 32;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = (v8 + 73 + a1) & ~v8;
  uint64_t v10 = (v8 + 73 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(v9, v10);
  uint64_t v11 = *(void *)(v7 + 32);
  uint64_t v12 = v11 + v9;
  uint64_t v13 = v11 + v10;
  unint64_t v14 = (v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v15 = (v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  char v16 = *(unsigned char *)(v15 + 8);
  *(void *)unint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = v16;
  *(void *)((v12 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_261B47E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v10 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v11 = v10 + 40;
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (v12 + 73 + a1) & ~v12;
  uint64_t v14 = (v12 + 73 + a2) & ~v12;
  (*(void (**)(uint64_t, uint64_t))(v10 + 40))(v13, v14);
  uint64_t v15 = *(void *)(v11 + 24);
  uint64_t v16 = v15 + v13;
  uint64_t v17 = v15 + v14;
  unint64_t v18 = (v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = *(void *)v19;
  LOBYTE(v19) = *(unsigned char *)(v19 + 8);
  uint64_t v21 = *(void *)v18;
  char v22 = *(unsigned char *)(v18 + 8);
  *(void *)unint64_t v18 = v20;
  *(unsigned char *)(v18 + 8) = v19;
  sub_2619F7790(v21, v22);
  *(void *)((v16 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v17 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_261B47F88(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + ((v6 + 73) & ~v6) + 23) & 0xFFFFFFFFFFFFFFF8)
       + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *(unsigned __int8 *)(a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)(a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x261B480E0);
      case 4:
        int v14 = *(_DWORD *)(a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *(_DWORD *)a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if ((v5 & 0x80000000) != 0) {
    return (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v6 + 73) & ~v6);
  }
  unint64_t v17 = *(void *)(a1 + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

double sub_261B480F4(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 73) & ~v9) + 23) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return result;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return result;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_42;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if ((v7 & 0x80000000) != 0)
            {
              unint64_t v19 = (unint64_t)&a1[v9 + 73] & ~v9;
              uint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
              v20(v19);
            }
            else if ((a2 & 0x80000000) != 0)
            {
              double result = 0.0;
              *(_OWORD *)(a1 + 40) = 0u;
              *(_OWORD *)(a1 + 24) = 0u;
              *(_OWORD *)(a1 + 8) = 0u;
              *(_OWORD *)(a1 + 56) = 0u;
              *(void *)a1 = a2 ^ 0x80000000;
            }
            else
            {
              *((void *)a1 + 1) = a2 - 1;
            }
          }
          break;
      }
      return result;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 73) & ~v9) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 73) & ~v9) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 73) & ~v9) + 23) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x261B482FCLL);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _s9WorkoutUI20MetricTextDescriptorVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s9WorkoutUI20MetricTextDescriptorVwcp_0(uint64_t a1, uint64_t a2)
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
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s9WorkoutUI20MetricTextDescriptorVwca_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s9WorkoutUI20MetricTextDescriptorVwta_0(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s9WorkoutUI20MetricTextDescriptorVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_261B48560(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MetricText()
{
  return &type metadata for MetricText;
}

uint64_t sub_261B485C0()
{
  return swift_getWitnessTable();
}

uint64_t sub_261B488D0()
{
  return sub_2619F8AB8((unint64_t *)&qword_26A945440, &qword_26A945448);
}

uint64_t sub_261B4890C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 88);
}

uint64_t sub_261B48914()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        uint64_t result = swift_checkMetadataState();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_261B48A6C(uint64_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v4 = *(void *)(a3[2] - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *(void *)(a3[3] - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v5 + v7;
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v10 = (v5 + v7) & ~v7;
  uint64_t v11 = *(void *)(a3[4] - 8);
  uint64_t v12 = *(_DWORD *)(v11 + 80);
  uint64_t v13 = v9 + v12;
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v15 = *(void *)(a3[5] - 8);
  uint64_t v16 = *(_DWORD *)(v15 + 80);
  uint64_t v17 = v14 + v16;
  uint64_t v18 = *(void *)(v15 + 64);
  unint64_t v19 = v18 + ((v14 + v16 + ((v9 + v12 + v10) & ~v12)) & ~v16) + 1;
  uint64_t v20 = (*(unsigned char *)(v6 + 80) | *(unsigned char *)(v4 + 80) | *(unsigned char *)(v11 + 80) | *(unsigned char *)(v15 + 80));
  if (v20 <= 7
    && v19 <= 0x18
    && ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v4 + 80) | *(_DWORD *)(v11 + 80) | *(_DWORD *)(v15 + 80)) & 0x100000) == 0)
  {
    uint64_t v25 = ~v7;
    uint64_t v36 = a3[4];
    uint64_t v37 = ~v12;
    uint64_t v38 = ~v16;
    uint64_t v39 = a3[5];
    uint64_t v35 = a3[3];
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
    v40 = a1;
    unint64_t v27 = ((unint64_t)a1 + v8) & v25;
    unint64_t v28 = ((unint64_t)a2 + v8) & v25;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(v27, v28, v35);
    uint64_t v29 = v27 + v13;
    uint64_t v24 = v40;
    uint64_t v30 = v29 & v37;
    unint64_t v31 = (v28 + v13) & v37;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v11 + 16))(v29 & v37, v31, v36);
    uint64_t v32 = (v30 + v17) & v38;
    unint64_t v33 = (v31 + v17) & v38;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 16))(v32, v33, v39);
    *(unsigned char *)(v32 + v18) = *(unsigned char *)(v33 + v18);
  }
  else
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    uint64_t v24 = (uint64_t *)(v23 + ((v20 + 16) & ~v20));
    swift_retain();
  }
  return v24;
}

uint64_t sub_261B48D20(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a2[2] - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(v4 + 56) + a1;
  uint64_t v6 = *(void *)(a2[3] - 8);
  uint64_t v7 = v6 + 8;
  unint64_t v8 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t))(v6 + 8))(v8);
  uint64_t v9 = *(void *)(v7 + 56);
  uint64_t v10 = *(void *)(a2[4] - 8);
  uint64_t v11 = v10 + 8;
  unint64_t v12 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  (*(void (**)(unint64_t))(v10 + 8))(v12);
  uint64_t v13 = *(void *)(a2[5] - 8);
  uint64_t v14 = *(uint64_t (**)(unint64_t))(v13 + 8);
  unint64_t v15 = (v12 + *(void *)(v11 + 56) + *(unsigned __int8 *)(v13 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  return v14(v15);
}

uint64_t sub_261B48E4C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 48) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 48);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 16;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 48);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 16;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v25, v26);
  *(unsigned char *)(*(void *)(v22 + 48) + v25) = *(unsigned char *)(*(void *)(v22 + 48) + v26);
  return a1;
}

uint64_t sub_261B48FB0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 40) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 40);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 24;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 24))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 40);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 24;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 24))(v25, v26);
  *(unsigned char *)(*(void *)(v22 + 40) + v25) = *(unsigned char *)(*(void *)(v22 + 40) + v26);
  return a1;
}

uint64_t sub_261B49114(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 32) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 32);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 32;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 32))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 32);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 32;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 32))(v25, v26);
  *(unsigned char *)(*(void *)(v22 + 32) + v25) = *(unsigned char *)(*(void *)(v22 + 32) + v26);
  return a1;
}

uint64_t sub_261B49278(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 24) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 24);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 40;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 40))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 24);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 40;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 40))(v25, v26);
  *(unsigned char *)(*(void *)(v22 + 24) + v25) = *(unsigned char *)(*(void *)(v22 + 24) + v26);
  return a1;
}

uint64_t sub_261B493DC(unsigned __int16 *a1, unsigned int a2, void *a3)
{
  uint64_t v5 = *(void *)(a3[2] - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  uint64_t v7 = *(void *)(a3[3] - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  if (v8 <= v6) {
    unsigned int v9 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(void *)(a3[4] - 8);
  unsigned int v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v9) {
    unsigned int v12 = v9;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(void *)(a3[5] - 8);
  unsigned int v14 = *(_DWORD *)(v13 + 84);
  uint64_t v15 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = *(void *)(*(void *)(a3[3] - 8) + 64);
  uint64_t v17 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = *(void *)(*(void *)(a3[4] - 8) + 64);
  uint64_t v19 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v20 = *(void *)(v13 + 64);
  if (v14 <= v12) {
    unsigned int v21 = v12;
  }
  else {
    unsigned int v21 = *(_DWORD *)(v13 + 84);
  }
  if (v21 <= 0xFE) {
    unsigned int v21 = 254;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v22 = *(void *)(*(void *)(a3[2] - 8) + 64) + v15;
  int v23 = a2 - v21;
  if (a2 > v21)
  {
    uint64_t v24 = v20 + ((v18 + v19 + ((v16 + v17 + (v22 & ~v15)) & ~v17)) & ~v19) + 1;
    char v25 = 8 * v24;
    if (v24 > 3) {
      goto LABEL_15;
    }
    unsigned int v27 = ((v23 + ~(-1 << v25)) >> v25) + 1;
    if (HIWORD(v27))
    {
      int v26 = *(_DWORD *)((char *)a1 + v24);
      if (!v26) {
        goto LABEL_32;
      }
      goto LABEL_22;
    }
    if (v27 > 0xFF)
    {
      int v26 = *(unsigned __int16 *)((char *)a1 + v24);
      if (!*(unsigned __int16 *)((char *)a1 + v24)) {
        goto LABEL_32;
      }
      goto LABEL_22;
    }
    if (v27 >= 2)
    {
LABEL_15:
      int v26 = *((unsigned __int8 *)a1 + v24);
      if (!*((unsigned char *)a1 + v24)) {
        goto LABEL_32;
      }
LABEL_22:
      int v28 = (v26 - 1) << v25;
      if (v24 > 3) {
        int v28 = 0;
      }
      if (v20
         + ((v18
           + v19
           + ((v16 + v17 + (v22 & ~v15)) & ~v17)) & ~v19) == -1)
      {
        int v30 = 0;
      }
      else
      {
        if (v24 <= 3) {
          int v29 = v20 + ((v18 + v19 + ((v16 + v17 + (v22 & ~v15)) & ~v17)) & ~v19) + 1;
        }
        else {
          int v29 = 4;
        }
        switch(v29)
        {
          case 2:
            int v30 = *a1;
            break;
          case 3:
            int v30 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
            break;
          case 4:
            int v30 = *(_DWORD *)a1;
            break;
          default:
            int v30 = *(unsigned __int8 *)a1;
            break;
        }
      }
      int v39 = v21 + (v30 | v28);
      return (v39 + 1);
    }
  }
LABEL_32:
  if (v6 == v21)
  {
    unint64_t v31 = *(uint64_t (**)(void))(v5 + 48);
    return v31();
  }
  unint64_t v33 = ((unint64_t)a1 + v22) & ~v15;
  if (v8 != v21)
  {
    unint64_t v35 = (v33 + v16 + v17) & ~v17;
    if (v11 == v21)
    {
      uint64_t v36 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v10 + 48);
      uint64_t v37 = *(unsigned int *)(v10 + 84);
      uint64_t v38 = a3[4];
      return v36(v35, v37, v38);
    }
    unint64_t v35 = (v35 + v18 + v19) & ~v19;
    if (v14 == v21)
    {
      uint64_t v36 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v13 + 48);
      uint64_t v37 = *(unsigned int *)(v13 + 84);
      uint64_t v38 = a3[5];
      return v36(v35, v37, v38);
    }
    unsigned int v40 = *(unsigned __int8 *)(v35 + v20);
    if (v40 < 2) {
      return 0;
    }
    int v39 = (v40 + 2147483646) & 0x7FFFFFFF;
    return (v39 + 1);
  }
  v34 = *(uint64_t (**)(unint64_t))(v7 + 48);
  return v34(v33);
}

void sub_261B497CC(char *a1, unsigned int a2, unsigned int a3, void *a4)
{
  uint64_t v6 = *(void *)(a4[2] - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(a4[3] - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  uint64_t v10 = *(void *)(a4[4] - 8);
  if (v9 <= v7) {
    unsigned int v11 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v11 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v12 = *(void *)(a4[4] - 8);
  unsigned int v13 = *(_DWORD *)(v10 + 84);
  if (v13 <= v11) {
    unsigned int v14 = v11;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v15 = *(void *)(a4[5] - 8);
  unsigned int v16 = *(_DWORD *)(v15 + 84);
  uint64_t v17 = *(void *)(*(void *)(a4[2] - 8) + 64);
  uint64_t v18 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v19 = *(void *)(*(void *)(a4[3] - 8) + 64);
  uint64_t v20 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v21 = *(void *)(v10 + 64);
  uint64_t v22 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v23 = *(void *)(v15 + 64);
  if (v16 <= v14) {
    unsigned int v24 = v14;
  }
  else {
    unsigned int v24 = *(_DWORD *)(v15 + 84);
  }
  if (v24 <= 0xFE) {
    unsigned int v25 = 254;
  }
  else {
    unsigned int v25 = v24;
  }
  uint64_t v26 = v17 + v18;
  size_t v27 = v23 + ((v21 + v22 + ((v19 + v20 + ((v17 + v18) & ~v18)) & ~v20)) & ~v22) + 1;
  BOOL v28 = a3 >= v25;
  unsigned int v29 = a3 - v25;
  if (v29 != 0 && v28)
  {
    if (v27 <= 3)
    {
      unsigned int v33 = ((v29 + ~(-1 << (8 * v27))) >> (8 * v27)) + 1;
      if (HIWORD(v33))
      {
        int v30 = 4;
      }
      else if (v33 >= 0x100)
      {
        int v30 = 2;
      }
      else
      {
        int v30 = v33 > 1;
      }
    }
    else
    {
      int v30 = 1;
    }
  }
  else
  {
    int v30 = 0;
  }
  if (v25 < a2)
  {
    unsigned int v31 = ~v25 + a2;
    if (v27 < 4)
    {
      int v32 = (v31 >> (8 * v27)) + 1;
      if (v27)
      {
        int v34 = v31 & ~(-1 << (8 * v27));
        bzero(a1, v27);
        if (v27 == 3)
        {
          *(_WORD *)a1 = v34;
          a1[2] = BYTE2(v34);
        }
        else if (v27 == 2)
        {
          *(_WORD *)a1 = v34;
        }
        else
        {
          *a1 = v34;
        }
      }
    }
    else
    {
      bzero(a1, v27);
      *(_DWORD *)a1 = v31;
      int v32 = 1;
    }
    switch(v30)
    {
      case 1:
        a1[v27] = v32;
        return;
      case 2:
        *(_WORD *)&a1[v27] = v32;
        return;
      case 3:
        goto LABEL_60;
      case 4:
        *(_DWORD *)&a1[v27] = v32;
        return;
      default:
        return;
    }
  }
  switch(v30)
  {
    case 1:
      a1[v27] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v27] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_60:
      __break(1u);
      JUMPOUT(0x261B49C54);
    case 4:
      *(_DWORD *)&a1[v27] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (!a2) {
        return;
      }
LABEL_33:
      if (v7 == v25)
      {
        unint64_t v35 = *(void (**)(char *))(v6 + 56);
        uint64_t v36 = a1;
LABEL_58:
        v35(v36);
        return;
      }
      uint64_t v36 = (char *)((unint64_t)&a1[v26] & ~v18);
      if (v9 == v25)
      {
        unint64_t v35 = *(void (**)(char *))(v8 + 56);
        goto LABEL_58;
      }
      uint64_t v36 = (char *)((unint64_t)&v36[v19 + v20] & ~v20);
      if (v13 == v25)
      {
        unint64_t v35 = *(void (**)(char *))(v12 + 56);
        goto LABEL_58;
      }
      uint64_t v36 = (char *)((unint64_t)&v36[v21 + v22] & ~v22);
      if (v16 == v25)
      {
        unint64_t v35 = *(void (**)(char *))(v15 + 56);
        goto LABEL_58;
      }
      v36[v23] = a2 + 1;
      return;
  }
}

uint64_t sub_261B49C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 104);
}

uint64_t sub_261B49C84()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        uint64_t result = swift_checkMetadataState();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_261B49DF8(uint64_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v4 = *(void *)(a3[2] - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *(void *)(a3[3] - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v5 + v7;
  uint64_t v9 = (v5 + v7) & ~v7;
  uint64_t v10 = *(void *)(a3[4] - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80);
  uint64_t v12 = *(void *)(v6 + 64) + v11;
  uint64_t v13 = v12 + v9;
  uint64_t v14 = *(void *)(v10 + 64);
  uint64_t v15 = *(void *)(a3[5] - 8);
  uint64_t v16 = *(_DWORD *)(v15 + 80);
  uint64_t v17 = v14 + v16;
  uint64_t v18 = *(void *)(v15 + 64);
  unint64_t v19 = ((((((((v14 + v16 + (v13 & ~v11)) & ~v16) + v18) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  unsigned int v20 = v7 | *(_DWORD *)(v4 + 80) & 0xF8 | v11 | v16;
  if (v20 > 7
    || ((*(_DWORD *)(v10 + 80) | *(_DWORD *)(v6 + 80) | *(_DWORD *)(v15 + 80) | *(_DWORD *)(v4 + 80)) & 0x100000) != 0
    || v19 > 0x18)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    unsigned int v29 = (uint64_t *)(v23 + (((v20 | 7) + 16) & ~(unint64_t)(v20 | 7)));
    swift_retain();
  }
  else
  {
    uint64_t v24 = ~v7;
    uint64_t v42 = a3[4];
    uint64_t v43 = ~v11;
    uint64_t v44 = ~v16;
    uint64_t v45 = a3[5];
    uint64_t v41 = a3[3];
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
    v46 = a1;
    unint64_t v26 = ((unint64_t)a1 + v8) & v24;
    unint64_t v27 = ((unint64_t)a2 + v8) & v24;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(v26, v27, v41);
    uint64_t v28 = v26 + v12;
    unsigned int v29 = v46;
    uint64_t v30 = v28 & v43;
    unint64_t v31 = (v27 + v12) & v43;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v10 + 16))(v28 & v43, v31, v42);
    uint64_t v32 = (v30 + v17) & v44;
    unint64_t v33 = (v31 + v17) & v44;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 16))(v32, v33, v45);
    uint64_t v34 = v33 + v18;
    *(unsigned char *)(v32 + v18) = *(unsigned char *)(v33 + v18);
    unint64_t v35 = (v32 + v18) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v36 = v34 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v37 = *(void *)((v34 & 0xFFFFFFFFFFFFFFF8) + 8);
    LOBYTE(v32) = *(unsigned char *)((v34 & 0xFFFFFFFFFFFFFFF8) + 16);
    sub_2619F7774(v37, v32);
    *(void *)(v35 + 8) = v37;
    *(unsigned char *)(v35 + 16) = v32;
    *(void *)(v35 + 24) = *(void *)(v36 + 24);
    uint64_t v38 = (void *)((v35 + 39) & 0xFFFFFFFFFFFFFFF8);
    int v39 = (void *)((v36 + 39) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v38 = *v39;
    *(void *)(((unint64_t)v38 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v39 + 15) & 0xFFFFFFFFFFFFFFF8);
  }
  return v29;
}

uint64_t sub_261B4A12C(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a2[2] - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(v4 + 56) + a1;
  uint64_t v6 = *(void *)(a2[3] - 8);
  uint64_t v7 = v6 + 8;
  unint64_t v8 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t))(v6 + 8))(v8);
  uint64_t v9 = *(void *)(v7 + 56);
  uint64_t v10 = *(void *)(a2[4] - 8);
  uint64_t v11 = v10 + 8;
  unint64_t v12 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  (*(void (**)(unint64_t))(v10 + 8))(v12);
  uint64_t v13 = *(void *)(v11 + 56);
  uint64_t v14 = *(void *)(a2[5] - 8);
  uint64_t v15 = v14 + 8;
  unint64_t v16 = (v12 + v13 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  (*(void (**)(unint64_t))(v14 + 8))(v16);
  unint64_t v17 = (v16 + *(void *)(v15 + 56)) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = *(void *)(v17 + 8);
  char v19 = *(unsigned char *)(v17 + 16);
  return sub_2619F7790(v18, v19);
}

uint64_t sub_261B4A274(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 48) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 48);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 16;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 48);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 16;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v25, v26);
  uint64_t v27 = *(void *)(v22 + 48);
  unint64_t v28 = v27 + v25;
  unint64_t v29 = v27 + v26;
  *(unsigned char *)unint64_t v28 = *(unsigned char *)v29;
  unint64_t v30 = v28 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v31 = v29 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v32 = *(void *)((v29 & 0xFFFFFFFFFFFFFFF8) + 8);
  LOBYTE(v26) = *(unsigned char *)((v29 & 0xFFFFFFFFFFFFFFF8) + 16);
  sub_2619F7774(v32, v26);
  *(void *)(v30 + 8) = v32;
  *(unsigned char *)(v30 + 16) = v26;
  *(void *)(v30 + 24) = *(void *)(v31 + 24);
  unint64_t v33 = (void *)((v30 + 39) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v34 = (void *)((v31 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v33 = *v34;
  *(void *)(((unint64_t)v33 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_261B4A434(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 40) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 40);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 24;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 24))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 40);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 24;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 24))(v25, v26);
  uint64_t v27 = *(void *)(v22 + 40);
  unint64_t v28 = v27 + v25;
  unint64_t v29 = v27 + v26;
  *(unsigned char *)unint64_t v28 = *(unsigned char *)v29;
  unint64_t v30 = v28 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v31 = v29 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v32 = *(void *)((v29 & 0xFFFFFFFFFFFFFFF8) + 8);
  LOBYTE(v26) = *(unsigned char *)((v29 & 0xFFFFFFFFFFFFFFF8) + 16);
  sub_2619F7774(v32, v26);
  uint64_t v33 = *(void *)(v30 + 8);
  char v34 = *(unsigned char *)(v30 + 16);
  *(void *)(v30 + 8) = v32;
  *(unsigned char *)(v30 + 16) = v26;
  sub_2619F7790(v33, v34);
  *(void *)(v30 + 24) = *(void *)(v31 + 24);
  unint64_t v35 = (void *)((v30 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v36 = (void *)((v31 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v35 = *v36;
  *(void *)(((unint64_t)v35 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v36 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_261B4A600(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 32) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 32);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 32;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 32))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 32);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 32;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 32))(v25, v26);
  uint64_t v27 = *(void *)(v22 + 32);
  uint64_t v28 = v27 + v25;
  uint64_t v29 = v27 + v26;
  *(unsigned char *)uint64_t v28 = *(unsigned char *)v29;
  v28 &= 0xFFFFFFFFFFFFFFF8;
  v29 &= 0xFFFFFFFFFFFFFFF8;
  char v30 = *(unsigned char *)(v29 + 16);
  *(void *)(v28 + 8) = *(void *)(v29 + 8);
  *(unsigned char *)(v28 + 16) = v30;
  *(void *)(v28 + 24) = *(void *)(v29 + 24);
  unint64_t v31 = (void *)((v28 + 39) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v32 = (void *)((v29 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v31 = *v32;
  *(void *)(((unint64_t)v31 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v32 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_261B4A7B4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 24) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 24);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 40;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 40))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 24);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 40;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 40))(v25, v26);
  uint64_t v27 = *(void *)(v22 + 24);
  unint64_t v28 = v27 + v25;
  unint64_t v29 = v27 + v26;
  *(unsigned char *)unint64_t v28 = *(unsigned char *)v29;
  unint64_t v30 = v28 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v31 = v29 & 0xFFFFFFFFFFFFFFF8;
  LOBYTE(v28) = *(unsigned char *)((v29 & 0xFFFFFFFFFFFFFFF8) + 16);
  uint64_t v32 = *(void *)(v30 + 8);
  char v33 = *(unsigned char *)(v30 + 16);
  *(void *)(v30 + 8) = *(void *)((v29 & 0xFFFFFFFFFFFFFFF8) + 8);
  *(unsigned char *)(v30 + 16) = v28;
  sub_2619F7790(v32, v33);
  *(void *)(v30 + 24) = *(void *)(v31 + 24);
  char v34 = (void *)((v30 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v35 = (void *)((v31 + 39) & 0xFFFFFFFFFFFFFFF8);
  *char v34 = *v35;
  *(void *)(((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v35 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_261B4A974(_DWORD *a1, unsigned int a2, void *a3)
{
  uint64_t v5 = *(void *)(a3[2] - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  uint64_t v7 = *(void *)(a3[3] - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  if (v8 <= v6) {
    unsigned int v9 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(void *)(a3[4] - 8);
  unsigned int v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v9) {
    unsigned int v12 = v9;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(void *)(a3[5] - 8);
  unsigned int v14 = *(_DWORD *)(v13 + 84);
  uint64_t v15 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = *(void *)(*(void *)(a3[3] - 8) + 64);
  uint64_t v17 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = *(void *)(*(void *)(a3[4] - 8) + 64);
  uint64_t v19 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v20 = *(void *)(v13 + 64);
  if (v14 <= v12) {
    unsigned int v21 = v12;
  }
  else {
    unsigned int v21 = *(_DWORD *)(v13 + 84);
  }
  if (v21 <= 0xFE) {
    unsigned int v21 = 254;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v22 = *(void *)(*(void *)(a3[2] - 8) + 64) + v15;
  if (v21 < a2)
  {
    unint64_t v23 = ((((((((v18 + v19 + ((v16 + v17 + (v22 & ~v15)) & ~v17)) & ~v19) + v20) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
          + 15) & 0xFFFFFFFFFFFFFFF8)
        + 8;
    if ((v23 & 0xFFFFFFF8) != 0) {
      unsigned int v24 = 2;
    }
    else {
      unsigned int v24 = a2 - v21 + 1;
    }
    if (v24 >= 0x10000) {
      unsigned int v25 = 4;
    }
    else {
      unsigned int v25 = 2;
    }
    if (v24 < 0x100) {
      unsigned int v25 = 1;
    }
    if (v24 >= 2) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = 0;
    }
    switch(v26)
    {
      case 1:
        int v27 = *((unsigned __int8 *)a1 + v23);
        if (!*((unsigned char *)a1 + v23)) {
          break;
        }
        goto LABEL_29;
      case 2:
        int v27 = *(unsigned __int16 *)((char *)a1 + v23);
        if (*(_WORD *)((char *)a1 + v23)) {
          goto LABEL_29;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x261B4AD24);
      case 4:
        int v27 = *(_DWORD *)((char *)a1 + v23);
        if (!v27) {
          break;
        }
LABEL_29:
        int v28 = v27 - 1;
        if ((v23 & 0xFFFFFFF8) != 0)
        {
          int v28 = 0;
          int v29 = *a1;
        }
        else
        {
          int v29 = 0;
        }
        int v36 = v21 + (v29 | v28);
        return (v36 + 1);
      default:
        break;
    }
  }
  if (v6 == v21)
  {
    unint64_t v30 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v5 + 48);
    uint64_t v31 = *(unsigned int *)(v5 + 84);
    uint64_t v32 = a3[2];
    return v30(a1, v31, v32);
  }
  unint64_t v33 = ((unint64_t)a1 + v22) & ~v15;
  if (v8 == v21)
  {
    char v34 = *(uint64_t (**)(unint64_t))(v7 + 48);
    return v34(v33);
  }
  a1 = (_DWORD *)((v33 + v16 + v17) & ~v17);
  if (v11 == v21)
  {
    unint64_t v30 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v10 + 48);
    uint64_t v31 = *(unsigned int *)(v10 + 84);
    uint64_t v32 = a3[4];
    return v30(a1, v31, v32);
  }
  a1 = (_DWORD *)(((unint64_t)a1 + v18 + v19) & ~v19);
  if (v14 == v21)
  {
    unint64_t v30 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v13 + 48);
    uint64_t v31 = *(unsigned int *)(v13 + 84);
    uint64_t v32 = a3[5];
    return v30(a1, v31, v32);
  }
  unsigned int v37 = *((unsigned __int8 *)a1 + v20);
  if (v37 < 2) {
    return 0;
  }
  int v36 = (v37 + 2147483646) & 0x7FFFFFFF;
  return (v36 + 1);
}

void sub_261B4AD38(char *a1, unsigned int a2, unsigned int a3, void *a4)
{
  uint64_t v6 = *(void *)(a4[2] - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = a4[4];
  uint64_t v9 = *(void *)(a4[3] - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= v7) {
    unsigned int v11 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v12 = *(void *)(v8 - 8);
  unsigned int v13 = *(_DWORD *)(v12 + 84);
  if (v13 <= v11) {
    unsigned int v14 = v11;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v12 + 84);
  }
  uint64_t v15 = *(void *)(a4[5] - 8);
  unsigned int v16 = *(_DWORD *)(v15 + 84);
  uint64_t v17 = *(void *)(*(void *)(a4[2] - 8) + 64);
  uint64_t v18 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v19 = *(void *)(*(void *)(a4[3] - 8) + 64);
  uint64_t v20 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v21 = *(void *)(*(void *)(v8 - 8) + 64);
  uint64_t v22 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v23 = *(void *)(v15 + 64);
  if (v16 <= v14) {
    unsigned int v24 = v14;
  }
  else {
    unsigned int v24 = *(_DWORD *)(v15 + 84);
  }
  if (v24 <= 0xFE) {
    unsigned int v25 = 254;
  }
  else {
    unsigned int v25 = v24;
  }
  uint64_t v26 = v17 + v18;
  size_t v27 = ((((((((v21 + v22 + ((v19 + v20 + ((v17 + v18) & ~v18)) & ~v20)) & ~v22) + v23) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
        + 15) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v25 >= a3)
  {
    int v31 = 0;
    int v32 = a2 - v25;
    if (a2 <= v25) {
      goto LABEL_26;
    }
LABEL_30:
    if (v27) {
      int v34 = 1;
    }
    else {
      int v34 = v32;
    }
    if (v27)
    {
      int v35 = ~v25 + a2;
      bzero(a1, v27);
      *(_DWORD *)a1 = v35;
    }
    switch(v31)
    {
      case 1:
        a1[v27] = v34;
        break;
      case 2:
        *(_WORD *)&a1[v27] = v34;
        break;
      case 3:
LABEL_61:
        __break(1u);
        JUMPOUT(0x261B4B15CLL);
      case 4:
        *(_DWORD *)&a1[v27] = v34;
        break;
      default:
        return;
    }
    return;
  }
  unsigned int v28 = a3 - v25;
  if (v27) {
    unsigned int v29 = 2;
  }
  else {
    unsigned int v29 = v28 + 1;
  }
  if (v29 >= 0x10000) {
    int v30 = 4;
  }
  else {
    int v30 = 2;
  }
  if (v29 < 0x100) {
    int v30 = 1;
  }
  if (v29 >= 2) {
    int v31 = v30;
  }
  else {
    int v31 = 0;
  }
  int v32 = a2 - v25;
  if (a2 > v25) {
    goto LABEL_30;
  }
LABEL_26:
  uint64_t v33 = ~v18;
  switch(v31)
  {
    case 1:
      a1[v27] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_39;
    case 2:
      *(_WORD *)&a1[v27] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_39;
    case 3:
      goto LABEL_61;
    case 4:
      *(_DWORD *)&a1[v27] = 0;
      goto LABEL_38;
    default:
LABEL_38:
      if (!a2) {
        return;
      }
LABEL_39:
      if (v7 == v25)
      {
        int v36 = *(void (**)(char *))(v6 + 56);
        unsigned int v37 = a1;
LABEL_58:
        v36(v37);
        return;
      }
      unsigned int v37 = (char *)((unint64_t)&a1[v26] & v33);
      if (v10 == v25)
      {
        int v36 = *(void (**)(char *))(v9 + 56);
        goto LABEL_58;
      }
      unsigned int v37 = (char *)((unint64_t)&v37[v19 + v20] & ~v20);
      if (v13 == v25)
      {
        int v36 = *(void (**)(char *))(v12 + 56);
        goto LABEL_58;
      }
      unsigned int v37 = (char *)((unint64_t)&v37[v21 + v22] & ~v22);
      if (v16 == v25)
      {
        int v36 = *(void (**)(char *))(v15 + 56);
        goto LABEL_58;
      }
      v37[v23] = a2 + 1;
      break;
  }
}

uint64_t sub_261B4B184()
{
  return sub_261B4B1B4();
}

uint64_t sub_261B4B19C()
{
  return sub_261B4B1B4();
}

uint64_t sub_261B4B1B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_261B4B1F0()
{
  return sub_261B4B3F8((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_261B44D40);
}

uint64_t sub_261B4B208()
{
  return sub_261B4B3F8((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_261B4419C);
}

uint64_t sub_261B4B220()
{
  return sub_261B4B3F8((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_261B431F0);
}

uint64_t sub_261B4B238()
{
  return sub_261B4B3F8((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_261B42118);
}

uint64_t sub_261B4B250()
{
  return sub_261B4B3F8((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_261B41410);
}

uint64_t sub_261B4B268()
{
  return sub_261B4B3F8((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_261B41A58);
}

uint64_t sub_261B4B280(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_261B4B2F0()
{
  return sub_261B4B3F8((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_261B42A20);
}

uint64_t sub_261B4B308()
{
  return sub_261B4B3F8((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_261B43974);
}

unint64_t sub_261B4B320()
{
  unint64_t result = qword_26A9481C8;
  if (!qword_26A9481C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9481C8);
  }
  return result;
}

unint64_t sub_261B4B374()
{
  unint64_t result = qword_26A9481D0;
  if (!qword_26A9481D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9481D0);
  }
  return result;
}

uint64_t sub_261B4B3C8()
{
  return sub_261B4B3F8((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_261B3DAE0);
}

uint64_t sub_261B4B3E0()
{
  return sub_261B4B3F8((uint64_t (*)(void, void, void, void, void, void, void, void, void))sub_261B3EB2C);
}

uint64_t sub_261B4B3F8(uint64_t (*a1)(void, void, void, void, void, void, void, void, void))
{
  return a1(v1[10], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
}

uint64_t sub_261B4B438(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26A948030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_261B4B4A8()
{
  return swift_getWitnessTable();
}

uint64_t sub_261B4BBC4()
{
  return swift_getWitnessTable();
}

uint64_t ElevationChangeMetricView.init(metricType:elevationChange:formattingManager:)@<X0>(uint64_t a1@<X0>, double a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t result = swift_getKeyPath();
  double v11 = a2;
  *(void *)a5 = a1;
  if (a3) {
    double v11 = 0.0;
  }
  *(double *)(a5 + 8) = v11;
  *(void *)(a5 + 16) = a4;
  *(void *)(a5 + 24) = result;
  *(unsigned char *)(a5 + 32) = 0;
  return result;
}

uint64_t sub_261B4BEB0()
{
  uint64_t v1 = *v0;
  unint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  char v4 = *((unsigned char *)v0 + 32);
  if (v1 == 53)
  {
    id v5 = v2;
    sub_2619F7774(v3, v4);
    sub_2619F7774(v3, v4);
    sub_2619FA43C(v3, v4, v12);
    sub_2619F7790(v3, v4);

    sub_2619F7790(v3, v4);
    if (v12[0] <= 8u && ((1 << v12[0]) & 0x181) != 0)
    {
      if (qword_26B416690 == -1) {
        goto LABEL_10;
      }
    }
    else
    {
      id v10 = v5;
      sub_2619F7774(v3, v4);
      sub_2619F7774(v3, v4);
      sub_2619FA43C(v3, v4, v12);
      sub_2619F7790(v3, v4);

      sub_2619F7790(v3, v4);
      if (v12[0] == 2)
      {
        if (qword_26B416690 == -1) {
          goto LABEL_10;
        }
      }
      else if (qword_26B416690 == -1)
      {
        goto LABEL_10;
      }
    }
    goto LABEL_21;
  }
  if (v1 == 10)
  {
    id v6 = v2;
    sub_2619F7774(v3, v4);
    sub_2619F7774(v3, v4);
    sub_2619FA43C(v3, v4, v12);
    sub_2619F7790(v3, v4);

    sub_2619F7790(v3, v4);
    if (v12[0] <= 8u && ((1 << v12[0]) & 0x181) != 0)
    {
      if (qword_26B416690 == -1)
      {
LABEL_10:
        swift_beginAccess();
        id v7 = (id)qword_26B416688;
        uint64_t v8 = sub_261B8AA48();

        return v8;
      }
    }
    else
    {
      id v11 = v6;
      sub_2619F7774(v3, v4);
      sub_2619F7774(v3, v4);
      sub_2619FA43C(v3, v4, v12);
      sub_2619F7790(v3, v4);

      sub_2619F7790(v3, v4);
      if (v12[0] == 2)
      {
        if (qword_26B416690 == -1) {
          goto LABEL_10;
        }
      }
      else if (qword_26B416690 == -1)
      {
        goto LABEL_10;
      }
    }
LABEL_21:
    swift_once();
    goto LABEL_10;
  }
  uint64_t result = sub_261B8F9C8();
  __break(1u);
  return result;
}

id ElevationChangeMetricView.body.getter@<X0>(uint64_t a1@<X8>)
{
  double v3 = *(double *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 24);
  char v5 = *(unsigned char *)(v1 + 32);
  id v6 = *(id *)(v1 + 16);
  sub_2619F7774(v4, v5);
  id result = objc_msgSend(v6, sel_localizedStringWithDistanceInMeters_distanceType_unitStyle_, 5, 0, v3);
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v8 = result;
  uint64_t v9 = sub_261B8F0F8();
  uint64_t v11 = v10;

  id v12 = v6;
  sub_2619F7774(v4, v5);
  id result = objc_msgSend(v12, sel_unitManager);
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  unsigned int v13 = result;
  id v14 = objc_msgSend(result, sel_userDistanceUnitForDistanceType_, 5);

  sub_2619F7790(v4, v5);
  id result = objc_msgSend(v12, sel_localizedShortUnitStringForDistanceUnit_textCase_, v14, 0);
  if (result)
  {
    uint64_t v15 = result;
    uint64_t v16 = sub_261B8F0F8();
    uint64_t v18 = v17;

    sub_2619F7790(v4, v5);
    id result = (id)sub_261B4BEB0();
    *(void *)a1 = v9;
    *(void *)(a1 + 8) = v11;
    *(void *)(a1 + 16) = v16;
    *(void *)(a1 + 24) = v18;
    *(void *)(a1 + 32) = result;
    *(void *)(a1 + 40) = v19;
    *(_WORD *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 64) = 0;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_261B4C578()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeWithCopy for ElevationChangeMetricView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  double v3 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v3;
  char v5 = *(unsigned char *)(a2 + 32);
  id v6 = v3;
  sub_2619F7774(v4, v5);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return a1;
}

uint64_t assignWithCopy for ElevationChangeMetricView(uint64_t a1, void *a2)
{
  unint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  uint64_t v4 = (void *)a2[2];
  char v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  uint64_t v7 = v2[3];
  LOBYTE(v2) = *((unsigned char *)v2 + 32);
  sub_2619F7774(v7, (char)v2);
  uint64_t v8 = *(void *)(a1 + 24);
  char v9 = *(unsigned char *)(a1 + 32);
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = (_BYTE)v2;
  sub_2619F7790(v8, v9);
  return a1;
}

uint64_t assignWithTake for ElevationChangeMetricView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  char v5 = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a1 + 24);
  char v7 = *(unsigned char *)(a1 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = v5;
  sub_2619F7790(v6, v7);
  return a1;
}

ValueMetadata *type metadata accessor for ElevationChangeMetricView()
{
  return &type metadata for ElevationChangeMetricView;
}

void sub_261B4C6E0()
{
  qword_26A953700 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(0.0, 0.0, 22.0, 25.0, 22.0, 25.0, 25.0);
}

void sub_261B4C71C()
{
  qword_26A953708 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(0.0, 0.0, 18.5, 21.5, 18.5, 21.5, 21.5);
}

void sub_261B4C768()
{
  qword_26A953710 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(0.0, 0.0, 52.0, 55.0, 58.0, 63.0, 63.0);
}

void sub_261B4C7BC()
{
  qword_26A953718 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(0.0, 0.0, 4.5, 1.5, 1.5, 1.5, 2.5);
}

void sub_261B4C7F8()
{
  qword_26A953720 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(0.0, 0.0, 2.5, 4.5, 4.5, 4.5, 3.5);
}

id sub_261B4C834(void *a1)
{
  id v1 = a1;
  FIUIWorkoutActivityType.symbolName.getter();
  uint64_t v3 = v2;

  if (v3)
  {
    uint64_t v4 = (void *)sub_261B8F0B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t FIUIWorkoutActivityType.symbolName.getter()
{
  id v1 = v0;
  uint64_t v2 = sub_261B8CE88();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v7 = MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v23 - v8;
  uint64_t v10 = (char *)objc_msgSend(v1, sel_effectiveTypeIdentifier, v7) - 1;
  uint64_t result = 0;
  switch((unint64_t)v10)
  {
    case 0uLL:
      return 0xD000000000000018;
    case 1uLL:
      return 0x612E657275676966;
    case 2uLL:
      return 0xD00000000000001ALL;
    case 3uLL:
      return 0xD000000000000010;
    case 4uLL:
    case 0x39uLL:
      return 0x622E657275676966;
    case 5uLL:
      return 0xD000000000000011;
    case 6uLL:
      return 0x622E657275676966;
    case 7uLL:
      return 0x622E657275676966;
    case 8uLL:
    case 9uLL:
    case 0x4FuLL:
      return 0x632E657275676966;
    case 0xAuLL:
      return 0xD000000000000015;
    case 0xBuLL:
      return 0x632E657275676966;
    case 0xCuLL:
      unsigned int v15 = objc_msgSend(v1, sel_isIndoor);
      unint64_t v16 = 0xD000000000000014;
      unint64_t v17 = 0xD000000000000013;
      goto LABEL_25;
    case 0xDuLL:
    case 0xEuLL:
    case 0x4CuLL:
      return 0x642E657275676966;
    case 0xFuLL:
      return 0xD000000000000011;
    case 0x10uLL:
      return 0xD000000000000018;
    case 0x11uLL:
    case 0x12uLL:
      return 0x662E657275676966;
    case 0x13uLL:
      return 0xD000000000000022;
    case 0x14uLL:
      return 0x672E657275676966;
    case 0x15uLL:
      return 0xD000000000000011;
    case 0x16uLL:
    case 0x17uLL:
      return 0x682E657275676966;
    case 0x18uLL:
      unsigned int v15 = objc_msgSend(v1, sel_isIndoor);
      unint64_t v17 = 0xD000000000000011;
      unint64_t v16 = 0xD000000000000013;
LABEL_25:
      if (v15) {
        return v17;
      }
      else {
        return v16;
      }
    case 0x19uLL:
      return 0x682E657275676966;
    case 0x1AuLL:
      return 0x6C2E657275676966;
    case 0x1BuLL:
      return 0xD000000000000013;
    case 0x1CuLL:
    case 0x2BuLL:
    case 0x34uLL:
    case 0x3AuLL:
    case 0x44uLL:
      return 0xD000000000000014;
    case 0x1DuLL:
    case 0x48uLL:
      return 0xD000000000000013;
    case 0x1EuLL:
      return 0x72632E322E72616FLL;
    case 0x1FuLL:
    case 0x41uLL:
      return 0x702E657275676966;
    case 0x20uLL:
      return 0x722E657275676966;
    case 0x21uLL:
      return 0xD000000000000012;
    case 0x22uLL:
    case 0x28uLL:
      if (objc_msgSend(v1, sel_isIndoor)) {
        return 0xD000000000000014;
      }
      else {
        return 0xD000000000000015;
      }
    case 0x23uLL:
    case 0x45uLL:
      return 0x722E657275676966;
    case 0x24uLL:
      if (objc_msgSend(v1, sel_isIndoor)) {
        return 0xD000000000000014;
      }
      else {
        return 0x722E657275676966;
      }
    case 0x25uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2CuLL:
    case 0x43uLL:
      return 0x732E657275676966;
    case 0x26uLL:
      if (objc_msgSend(v1, sel_isIndoor)) {
        return 0xD000000000000012;
      }
      else {
        return 0x732E657275676966;
      }
    case 0x27uLL:
      return 0x6B616C66776F6E73;
    case 0x2DuLL:
      id v18 = objc_msgSend(v1, sel_swimmingLocationType);
      if ((unint64_t)v18 < 2) {
        return 0xD000000000000010;
      }
      if (v18 == (id)2) {
        return 0xD000000000000016;
      }
      sub_261B8C638();
      uint64_t v19 = sub_261B8CE78();
      os_log_type_t v20 = sub_261B8F4B8();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl(&dword_2619F0000, v19, v20, "Unknown default swimming location type, no sf symbol", v22, 2u);
        MEMORY[0x263E4E970](v22, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
      return 0;
    case 0x2EuLL:
      return 0xD000000000000013;
    case 0x2FuLL:
    case 0x47uLL:
      return 0x742E657275676966;
    case 0x30uLL:
      return 0xD000000000000016;
    case 0x31uLL:
      return 0xD000000000000023;
    case 0x32uLL:
      return 0xD000000000000011;
    case 0x33uLL:
      if (objc_msgSend(v1, sel_isIndoor)) {
        return 0xD000000000000015;
      }
      else {
        return 0x772E657275676966;
      }
    case 0x35uLL:
      return 0xD000000000000010;
    case 0x36uLL:
      return 0x61772E7265746177;
    case 0x37uLL:
      return 0xD000000000000010;
    case 0x38uLL:
      return 0x792E657275676966;
    case 0x3BuLL:
      return 0xD00000000000001ALL;
    case 0x3CuLL:
      return 0xD000000000000016;
    case 0x3DuLL:
      return 0xD000000000000012;
    case 0x3EuLL:
      return 0xD000000000000025;
    case 0x3FuLL:
      return 0x6A2E657275676966;
    case 0x40uLL:
      return 0xD000000000000011;
    case 0x42uLL:
      return 0xD000000000000013;
    case 0x46uLL:
      return 0xD000000000000017;
    case 0x49uLL:
      return 0xD000000000000013;
    case 0x4AuLL:
      return 0xD000000000000012;
    case 0x4BuLL:
      return 0x746E6F63656D6167;
    case 0x4DuLL:
      return 0xD000000000000012;
    case 0x4EuLL:
      return 0xD000000000000011;
    case 0x51uLL:
      return result;
    case 0x52uLL:
      return 0x656C637269632E74;
    case 0x53uLL:
      return 0xD00000000000001ALL;
    default:
      sub_261B8C638();
      id v12 = sub_261B8CE78();
      os_log_type_t v13 = sub_261B8F4B8();
      if (os_log_type_enabled(v12, v13))
      {
        id v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_2619F0000, v12, v13, "Unknown HKWorkoutType type for sf symbol", v14, 2u);
        MEMORY[0x263E4E970](v14, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return 0;
  }
}

uint64_t sub_261B4D5CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t static EffortUIController.makeHostingController(shouldEmbedInNavStack:startingEffort:workoutActivityType:shouldShowWorkoutGlyph:showCurrentWorkloadButton:cancel:completion:)(char a1, void *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_261B4D98C(a1, a2, a5, a6, a7, a8, a9);
}

void sub_261B4D5F4(uint64_t a1, void (*a2)(id))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261A65018(a1, (uint64_t)v6);
  uint64_t v7 = sub_261B8C2D8();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_261B23558((uint64_t)v6);
    id v9 = objc_msgSend(self, sel_appleEffortScoreUnit);
    id v10 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v9, 0.0);
  }
  else
  {
    id v10 = (id)sub_261B8C2C8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  a2(v10);
}

uint64_t static EffortUIController.makeHostingController(shouldEmbedInNavStack:startingEffort:workoutActivityType:shouldShowWorkoutGlyph:showCurrentWorkloadButton:completion:)(char a1, void *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  return sub_261B4D98C(a1, a2, a5, (uint64_t)nullsub_1, 0, a6, a7);
}

id EffortUIController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id EffortUIController.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EffortUIController();
  return objc_msgSendSuper2(&v2, sel_init);
}

id EffortUIController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EffortUIController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_261B4D98C(char a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v35 = a3;
  os_log_type_t v13 = (int *)type metadata accessor for EffortNavigationView();
  MEMORY[0x270FA5388](v13);
  unsigned int v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910);
  MEMORY[0x270FA5388](v16 - 8);
  id v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v34 - v20;
  if (a2)
  {
    id v22 = a2;
    sub_261B8C2B8();
  }
  else
  {
    uint64_t v23 = sub_261B8C2D8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v21, 1, 1, v23);
  }
  sub_261A65018((uint64_t)v21, (uint64_t)v18);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a6;
  *(void *)(v24 + 24) = a7;
  unsigned int v25 = &v15[v13[9]];
  swift_retain();
  swift_retain();
  char Prompt = FIShouldShowTrackTrainingLoadPrompt();
  sub_261B8EA08();
  uint64_t v26 = v38;
  *unsigned int v25 = v37;
  *((void *)v25 + 1) = v26;
  size_t v27 = (uint64_t *)&v15[v13[10]];
  *size_t v27 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943200);
  swift_storeEnumTagMultiPayload();
  *unsigned int v15 = a1 & 1;
  sub_261A65D00((uint64_t)v18, (uint64_t)&v15[v13[5]]);
  unsigned int v28 = (void (**)(uint64_t))&v15[v13[7]];
  *unsigned int v28 = sub_261B4DD38;
  v28[1] = (void (*)(uint64_t))v24;
  unsigned int v29 = &v15[v13[8]];
  *unsigned int v29 = a4;
  v29[1] = a5;
  v15[v13[6]] = v35 & 1;
  sub_261B4DD44();
  sub_261B8EB28();
  int v30 = (void *)sub_261B8DE68();
  swift_release();
  self;
  uint64_t v31 = swift_dynamicCastObjCClass();
  if (v31)
  {
    uint64_t v32 = v31;
    sub_261B23558((uint64_t)v21);
    return v32;
  }
  else
  {

    uint64_t result = sub_261B8F9C8();
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for EffortUIController()
{
  return self;
}

uint64_t sub_261B4DCB8()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_261B4DCF0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_261B4DD00()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_261B4DD38(uint64_t a1)
{
  sub_261B4D5F4(a1, *(void (**)(id))(v1 + 16));
}

unint64_t sub_261B4DD44()
{
  unint64_t result = qword_26A9481E8;
  if (!qword_26A9481E8)
  {
    type metadata accessor for EffortNavigationView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9481E8);
  }
  return result;
}

void TimeInZoneMetricView.init(elapsedTime:isStale:)(uint64_t a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  double v9 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(3.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0);
  *(void *)a4 = a1;
  *(unsigned char *)(a4 + 8) = a2 & 1;
  *(unsigned char *)(a4 + 9) = a3;
  *(void *)(a4 + 16) = KeyPath;
  *(unsigned char *)(a4 + 24) = 0;
  *(double *)(a4 + 32) = v9;
}

uint64_t TimeInZoneMetricView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v51 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9481F0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9481F8);
  MEMORY[0x270FA5388](v43);
  uint64_t v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948200);
  MEMORY[0x270FA5388](v50);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v45 = (uint64_t)&v43 - v10;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948208);
  MEMORY[0x270FA5388](v48);
  uint64_t v49 = (uint64_t)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948020);
  MEMORY[0x270FA5388](v46);
  os_log_type_t v13 = (uint64_t *)((char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(qword_26A948030);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948210);
  MEMORY[0x270FA5388](v47);
  id v18 = (_OWORD *)((char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v19);
  uint64_t v44 = (uint64_t)&v43 - v20;
  long long v21 = *v1;
  long long v60 = v1[1];
  long long v59 = v21;
  uint64_t v61 = *((void *)v1 + 4);
  uint64_t v22 = v60;
  char v23 = BYTE8(v60);
  sub_261B4F658((uint64_t)&v59);
  sub_2619FA43C(v22, v23, &v58);
  sub_261B4F688((uint64_t)&v59);
  if (v58 == 5)
  {
    uint64_t v24 = sub_261B8DBF8();
    sub_261B4E628((uint64_t)&v59, (uint64_t)v52);
    *(_OWORD *)&v54[103] = v52[6];
    *(_OWORD *)&v54[87] = v52[5];
    *(_OWORD *)&v54[39] = v52[2];
    *(_OWORD *)&v54[23] = v52[1];
    *(_OWORD *)&v54[119] = v52[7];
    *(_OWORD *)&v54[135] = v53;
    *(_OWORD *)&v54[55] = v52[3];
    *(_OWORD *)&v54[71] = v52[4];
    *(_OWORD *)&v54[7] = v52[0];
    *(_OWORD *)((char *)&v57[6] + 1) = *(_OWORD *)&v54[96];
    *(_OWORD *)((char *)&v57[7] + 1) = *(_OWORD *)&v54[112];
    *(_OWORD *)((char *)&v57[8] + 1) = *(_OWORD *)&v54[128];
    *(_OWORD *)((char *)&v57[2] + 1) = *(_OWORD *)&v54[32];
    *(_OWORD *)((char *)&v57[3] + 1) = *(_OWORD *)&v54[48];
    *(_OWORD *)((char *)&v57[4] + 1) = *(_OWORD *)&v54[64];
    *(_OWORD *)((char *)&v57[5] + 1) = *(_OWORD *)&v54[80];
    *(_OWORD *)((char *)v57 + 1) = *(_OWORD *)v54;
    char v55 = 0;
    long long v56 = (unint64_t)v24;
    LOBYTE(v57[0]) = 0;
    *(_OWORD *)((char *)&v57[1] + 1) = *(_OWORD *)&v54[16];
    v57[9] = *((unint64_t *)&v53 + 1);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v26 = *MEMORY[0x263F18F70];
    uint64_t v27 = sub_261B8D6E8();
    uint64_t v28 = *(void *)(v27 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 104))(v16, v26, v27);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v16, 0, 1, v27);
    sub_2619F86F0((uint64_t)v16, (uint64_t)v13 + *(int *)(v46 + 28), qword_26A948030);
    *os_log_type_t v13 = KeyPath;
    sub_2619F86F0((uint64_t)v13, (uint64_t)v18 + *(int *)(v47 + 36), &qword_26A948020);
    long long v29 = v57[8];
    v18[8] = v57[7];
    v18[9] = v29;
    v18[10] = v57[9];
    long long v30 = v57[4];
    v18[4] = v57[3];
    v18[5] = v30;
    long long v31 = v57[6];
    v18[6] = v57[5];
    v18[7] = v31;
    long long v32 = v57[0];
    *id v18 = v56;
    v18[1] = v32;
    long long v33 = v57[2];
    v18[2] = v57[1];
    v18[3] = v33;
    sub_261B4F8A4((uint64_t)&v56);
    sub_2619F8754((uint64_t)v13, &qword_26A948020);
    sub_2619F8754((uint64_t)v16, qword_26A948030);
    sub_261B4F930((uint64_t)v52);
    uint64_t v34 = &qword_26A948210;
    uint64_t v35 = v44;
    sub_2619FB7EC((uint64_t)v18, v44, &qword_26A948210);
    sub_2619F86F0(v35, v49, &qword_26A948210);
  }
  else
  {
    *(void *)uint64_t v4 = sub_261B8DAD8();
    *((void *)v4 + 1) = 0;
    v4[16] = 0;
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948218);
    sub_261B4E9E0((uint64_t)&v59, &v4[*(int *)(v36 + 44)]);
    sub_2619F86F0((uint64_t)v4, (uint64_t)v6, &qword_26A9481F0);
    *(void *)&v6[*(int *)(v43 + 36)] = 0;
    sub_2619F8754((uint64_t)v4, &qword_26A9481F0);
    uint64_t v37 = swift_getKeyPath();
    uint64_t v38 = *MEMORY[0x263F18F70];
    uint64_t v39 = sub_261B8D6E8();
    uint64_t v40 = *(void *)(v39 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v40 + 104))(v16, v38, v39);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v16, 0, 1, v39);
    uint64_t v41 = (uint64_t *)&v8[*(int *)(v50 + 36)];
    sub_2619F86F0((uint64_t)v16, (uint64_t)v41 + *(int *)(v46 + 28), qword_26A948030);
    *uint64_t v41 = v37;
    sub_2619F86F0((uint64_t)v6, (uint64_t)v8, &qword_26A9481F8);
    sub_2619F8754((uint64_t)v16, qword_26A948030);
    sub_2619F8754((uint64_t)v6, &qword_26A9481F8);
    uint64_t v34 = &qword_26A948200;
    uint64_t v35 = v45;
    sub_2619FB7EC((uint64_t)v8, v45, &qword_26A948200);
    sub_2619F86F0(v35, v49, &qword_26A948200);
  }
  swift_storeEnumTagMultiPayload();
  sub_261B4F760(&qword_26A948220, &qword_26A948210, (void (*)(void))sub_261B4F6C0);
  sub_261B4F760(&qword_26A948248, &qword_26A948200, (void (*)(void))sub_261B4F804);
  sub_261B8DD68();
  return sub_2619F8754(v35, v34);
}

uint64_t sub_261B4E628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = 0;
  if ((FIUICurrentLanguageNeedsExtendedLineSpacing() & 1) == 0) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v32 = *(void *)a1;
  char v31 = *(unsigned char *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  char v6 = *(unsigned char *)(a1 + 24);
  sub_261B4F658(a1);
  sub_2619FA43C(v5, v6, &v40);
  if (qword_26B416690 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v7 = (id)qword_26B416688;
  uint64_t v8 = sub_261B8AA48();
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();

  sub_261B4F688(a1);
  uint64_t v40 = v8;
  uint64_t v41 = v10;
  sub_261A029C4();
  uint64_t v11 = sub_261B8F768();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  uint64_t v40 = v11;
  uint64_t v41 = v13;
  uint64_t v14 = sub_261B8E3D8();
  uint64_t v16 = v15;
  LOBYTE(v13) = v17 & 1;
  sub_261A704F8(0, v14, v15, v17 & 1, v18, (uint64_t)&v40);
  sub_261A02A18(v14, v16, v13);
  swift_bridgeObjectRelease();
  uint64_t v19 = v40;
  uint64_t v20 = v41;
  char v21 = v42;
  uint64_t v22 = v43;
  uint64_t v23 = v45;
  LOBYTE(v13) = v46;
  char v29 = v47;
  char v30 = v44;
  uint64_t v24 = v48;
  uint64_t v25 = v49;
  LOBYTE(v16) = v50;
  id v26 = objc_msgSend(self, sel_secondaryLabelColor, 0xE000000000000000);
  uint64_t v27 = MEMORY[0x263E4C6F0](v26);
  *(_DWORD *)(a2 + 9) = *(_DWORD *)v39;
  *(_DWORD *)(a2 + 12) = *(_DWORD *)&v39[3];
  *(_DWORD *)(a2 + 25) = *(_DWORD *)v38;
  *(_DWORD *)(a2 + 28) = *(_DWORD *)&v38[3];
  *(_DWORD *)(a2 + 68) = *(_DWORD *)&v37[3];
  *(_DWORD *)(a2 + 65) = *(_DWORD *)v37;
  *(_DWORD *)(a2 + 84) = *(_DWORD *)&v36[3];
  *(_DWORD *)(a2 + 81) = *(_DWORD *)v36;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v35[3];
  *(_DWORD *)(a2 + 97) = *(_DWORD *)v35;
  *(_DWORD *)(a2 + 108) = *(_DWORD *)&v34[3];
  *(_DWORD *)(a2 + 105) = *(_DWORD *)v34;
  *(_DWORD *)(a2 + 132) = *(_DWORD *)&v33[3];
  *(_DWORD *)(a2 + 129) = *(_DWORD *)v33;
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  *(void *)(a2 + 16) = v32;
  *(unsigned char *)(a2 + 24) = v31;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = v4;
  *(void *)(a2 + 48) = v19;
  *(void *)(a2 + 56) = v20;
  *(unsigned char *)(a2 + 64) = v21;
  *(void *)(a2 + 72) = v22;
  *(unsigned char *)(a2 + 80) = v30;
  *(void *)(a2 + 88) = v23;
  *(unsigned char *)(a2 + 96) = v13;
  *(unsigned char *)(a2 + 104) = v29;
  *(void *)(a2 + 112) = v24;
  *(void *)(a2 + 120) = v25;
  *(unsigned char *)(a2 + 128) = v16;
  *(void *)(a2 + 136) = v27;
  sub_261A001D0(v19, v20, v21);
  swift_bridgeObjectRetain();
  sub_2619F7774(v23, v13);
  sub_2619F7774(v25, v16);
  swift_retain();
  sub_261A02A18(v19, v20, v21);
  swift_bridgeObjectRelease();
  sub_2619F7790(v23, v13);
  sub_2619F7790(v25, v16);
  return swift_release();
}

uint64_t sub_261B4E9E0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v74 = a2;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9446D8);
  MEMORY[0x270FA5388](v66);
  v68 = (uint64_t *)&v54[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9446E0);
  MEMORY[0x270FA5388](v4 - 8);
  v67 = &v54[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948290);
  MEMORY[0x270FA5388](v76);
  id v7 = &v54[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948298);
  MEMORY[0x270FA5388](v8 - 8);
  v73 = &v54[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  v71 = &v54[-v11];
  MEMORY[0x270FA5388](v12);
  v72 = &v54[-v13];
  uint64_t v70 = *(void *)a1;
  int v69 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  int v15 = *(unsigned __int8 *)(a1 + 24);
  sub_261B4F658(a1);
  uint64_t v65 = v14;
  int v64 = v15;
  sub_2619FA43C(v14, v15, &v81);
  if (qword_26B416690 != -1) {
    swift_once();
  }
  unint64_t v62 = 0x8000000261BA3590;
  unint64_t v63 = 0x8000000261BA35B0;
  unint64_t v61 = 0xD000000000000021;
  swift_beginAccess();
  id v16 = (id)qword_26B416688;
  uint64_t v17 = sub_261B8AA48();
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();

  sub_261B4F688(a1);
  uint64_t v81 = v17;
  uint64_t v82 = v19;
  unint64_t v60 = sub_261A029C4();
  uint64_t v20 = sub_261B8E3D8();
  uint64_t v22 = v21;
  LOBYTE(v19) = v23 & 1;
  sub_261A704F8(1, v20, v21, v23 & 1, v24, (uint64_t)&v81);
  sub_261A02A18(v20, v22, v19);
  swift_bridgeObjectRelease();
  uint64_t v25 = v81;
  uint64_t v75 = v82;
  char v26 = v83;
  uint64_t v27 = v84;
  int v58 = v85;
  uint64_t v28 = v86;
  char v29 = v87;
  int v57 = v88;
  uint64_t v30 = v89;
  uint64_t v56 = v90;
  int v55 = v91;
  uint64_t v31 = *MEMORY[0x263F1A7B8];
  uint64_t v32 = sub_261B8E348();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v59 = a1;
  uint64_t v34 = v33;
  uint64_t v35 = (uint64_t)v67;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v33 + 104))(v67, v31, v32);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v34 + 56))(v35, 0, 1, v32);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v37 = v68;
  sub_2619F86F0(v35, (uint64_t)v68 + *(int *)(v66 + 28), &qword_26A9446E0);
  *uint64_t v37 = KeyPath;
  sub_2619F86F0((uint64_t)v37, (uint64_t)&v7[*(int *)(v76 + 36)], &qword_26A9446D8);
  uint64_t v38 = v75;
  *(void *)id v7 = v25;
  *((void *)v7 + 1) = v38;
  v7[16] = v26;
  *((void *)v7 + 3) = v27;
  v7[32] = v58;
  *((void *)v7 + 5) = v28;
  v7[48] = v29;
  v7[56] = v57;
  *((void *)v7 + 8) = v30;
  uint64_t v39 = v56;
  *((void *)v7 + 9) = v56;
  LOBYTE(KeyPath) = v55;
  v7[80] = v55;
  sub_261A001D0(v25, v38, v26);
  swift_bridgeObjectRetain();
  sub_2619F7774(v28, v29);
  sub_2619F7774(v39, KeyPath);
  sub_2619F8754((uint64_t)v37, &qword_26A9446D8);
  sub_2619F8754(v35, &qword_26A9446E0);
  sub_261A02A18(v25, v75, v26);
  swift_bridgeObjectRelease();
  sub_2619F7790(v28, v29);
  sub_2619F7790(v39, KeyPath);
  uint64_t v40 = v59;
  sub_261B4F658(v59);
  sub_2619FA43C(v65, v64, &v81);
  id v41 = (id)qword_26B416688;
  uint64_t v42 = sub_261B8AA48();
  uint64_t v44 = v43;
  swift_bridgeObjectRelease();

  sub_261B4F688(v40);
  uint64_t v81 = v42;
  uint64_t v82 = v44;
  uint64_t v79 = 10;
  unint64_t v80 = 0xE100000000000000;
  uint64_t v77 = 32;
  unint64_t v78 = 0xE100000000000000;
  uint64_t v45 = sub_261B8F788();
  uint64_t v47 = v46;
  swift_bridgeObjectRelease();
  uint64_t v81 = v45;
  uint64_t v82 = v47;
  sub_261B4FE04();
  uint64_t v48 = (uint64_t)v71;
  sub_261B8E668();
  swift_bridgeObjectRelease();
  sub_2619F8754((uint64_t)v7, &qword_26A948290);
  uint64_t v49 = v72;
  sub_2619FB7EC(v48, (uint64_t)v72, &qword_26A948298);
  char v50 = v73;
  sub_2619F86F0((uint64_t)v49, (uint64_t)v73, &qword_26A948298);
  uint64_t v51 = v74;
  void *v74 = v70;
  *((unsigned char *)v51 + 8) = v69;
  v51[2] = 0x3FF0000000000000;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9482A8);
  sub_2619F86F0((uint64_t)v50, (uint64_t)v51 + *(int *)(v52 + 48), &qword_26A948298);
  sub_2619F8754((uint64_t)v49, &qword_26A948298);
  return sub_2619F8754((uint64_t)v50, &qword_26A948298);
}

void sub_261B4F1CC()
{
  if (qword_26B416690 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = (id)qword_26B416688;
  uint64_t v1 = sub_261B8AA48();
  uint64_t v3 = v2;

  qword_26A953728 = v1;
  unk_26A953730 = v3;
}

uint64_t sub_261B4F2B8@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948270);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948278);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v27[2] = a3;
    if (qword_26A942F08 != -1) {
      swift_once();
    }
    v27[3] = v6;
    uint64_t v28 = qword_26A953728;
    uint64_t v29 = unk_26A953730;
    unint64_t v13 = sub_261A029C4();
    swift_bridgeObjectRetain();
    v27[1] = v13;
    uint64_t v14 = sub_261B8E3D8();
    uint64_t v16 = v15;
    char v18 = v17;
    uint64_t v20 = v19;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v28 = v14;
    uint64_t v29 = v16;
    char v22 = v18 & 1;
    char v30 = v18 & 1;
    v27[0] = v20;
    uint64_t v31 = v20;
    __int16 v32 = 256;
    uint64_t v33 = KeyPath;
    char v34 = 0;
    if (qword_26B416690 != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v23 = (id)qword_26B416688;
    uint64_t v24 = sub_261B8AA48();
    uint64_t v26 = v25;

    v27[4] = v24;
    v27[5] = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A945D80);
    sub_261B4FEA4((unint64_t *)&qword_26A945D78, &qword_26A945D80, (void (*)(void))sub_2619FBA38);
    sub_261B8E668();
    swift_bridgeObjectRelease();
    sub_261A02A18(v14, v16, v22);
    swift_bridgeObjectRelease();
    sub_2619F7790(KeyPath, 0);
    sub_2619F86F0((uint64_t)v8, (uint64_t)v11, &qword_26A948270);
    swift_storeEnumTagMultiPayload();
    sub_261B4FD08();
    sub_261B4FD5C();
    sub_261B8DD68();
    return sub_2619F8754((uint64_t)v8, &qword_26A948270);
  }
  else
  {
    *(void *)uint64_t v11 = a1;
    v11[8] = 0;
    swift_storeEnumTagMultiPayload();
    sub_261B4FD08();
    sub_261B4FD5C();
    return sub_261B8DD68();
  }
}

uint64_t sub_261B4F64C@<X0>(uint64_t a1@<X8>)
{
  return sub_261B4F2B8(*(void *)v1, *(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_261B4F658(uint64_t a1)
{
  return a1;
}

uint64_t sub_261B4F688(uint64_t a1)
{
  return a1;
}

unint64_t sub_261B4F6C0()
{
  unint64_t result = qword_26A948228;
  if (!qword_26A948228)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948230);
    sub_2619F8AB8(&qword_26A948238, &qword_26A948240);
    sub_261A70FC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948228);
  }
  return result;
}

uint64_t sub_261B4F760(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_2619F8AB8(&qword_26A948028, &qword_26A948020);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_261B4F804()
{
  unint64_t result = qword_26A948250;
  if (!qword_26A948250)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9481F8);
    sub_2619F8AB8(&qword_26A948258, &qword_26A9481F0);
    sub_261A70FC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948250);
  }
  return result;
}

uint64_t sub_261B4F8A4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  char v3 = *(unsigned char *)(a1 + 120);
  uint64_t v4 = *(void *)(a1 + 144);
  char v5 = *(unsigned char *)(a1 + 152);
  sub_261A001D0(*(void *)(a1 + 72), *(void *)(a1 + 80), *(unsigned char *)(a1 + 88));
  swift_bridgeObjectRetain();
  sub_2619F7774(v2, v3);
  sub_2619F7774(v4, v5);
  swift_retain();
  return a1;
}

uint64_t sub_261B4F930(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  char v3 = *(unsigned char *)(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 120);
  char v5 = *(unsigned char *)(a1 + 128);
  sub_261A02A18(*(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  swift_bridgeObjectRelease();
  sub_2619F7790(v2, v3);
  sub_2619F7790(v4, v5);
  swift_release();
  return a1;
}

uint64_t sub_261B4F9BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeWithCopy for TimeInZoneMetricView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  char v5 = *(unsigned char *)(a2 + 24);
  sub_2619F7774(v4, v5);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t assignWithCopy for TimeInZoneMetricView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 9) = *((unsigned char *)a2 + 9);
  uint64_t v5 = a2[2];
  char v6 = *((unsigned char *)a2 + 24);
  sub_2619F7774(v5, v6);
  uint64_t v7 = *(void *)(a1 + 16);
  char v8 = *(unsigned char *)(a1 + 24);
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_2619F7790(v7, v8);
  *(void *)(a1 + 32) = a2[4];
  return a1;
}

uint64_t assignWithTake for TimeInZoneMetricView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  uint64_t v4 = *(void *)(a2 + 16);
  char v5 = *(unsigned char *)(a2 + 24);
  uint64_t v6 = *(void *)(a1 + 16);
  char v7 = *(unsigned char *)(a1 + 24);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = v5;
  sub_2619F7790(v6, v7);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimeInZoneMetricView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 9);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TimeInZoneMetricView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 9) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimeInZoneMetricView()
{
  return &type metadata for TimeInZoneMetricView;
}

unint64_t sub_261B4FBCC()
{
  unint64_t result = qword_26A948260;
  if (!qword_26A948260)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948268);
    sub_261B4F760(&qword_26A948220, &qword_26A948210, (void (*)(void))sub_261B4F6C0);
    sub_261B4F760(&qword_26A948248, &qword_26A948200, (void (*)(void))sub_261B4F804);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948260);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ElapsedTimeOrNoTimeView(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ElapsedTimeOrNoTimeView(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = (a2 - 1);
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

ValueMetadata *type metadata accessor for ElapsedTimeOrNoTimeView()
{
  return &type metadata for ElapsedTimeOrNoTimeView;
}

uint64_t sub_261B4FCEC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_261B4FD08()
{
  unint64_t result = qword_26A948280;
  if (!qword_26A948280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948280);
  }
  return result;
}

unint64_t sub_261B4FD5C()
{
  unint64_t result = qword_26A948288;
  if (!qword_26A948288)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948270);
    sub_261B4FEA4((unint64_t *)&qword_26A945D78, &qword_26A945D80, (void (*)(void))sub_2619FBA38);
    sub_261A2ABC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948288);
  }
  return result;
}

unint64_t sub_261B4FE04()
{
  unint64_t result = qword_26A9482A0;
  if (!qword_26A9482A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948290);
    sub_261A70E24();
    sub_2619F8AB8(&qword_26A945970, &qword_26A9446D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9482A0);
  }
  return result;
}

uint64_t sub_261B4FEA4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_261B4FF28()
{
  unint64_t result = qword_26A9482B0;
  if (!qword_26A9482B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9482B8);
    sub_261B4FD08();
    sub_261B4FD5C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9482B0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TrainingLoadDayViewLayout(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFA && a1[16]) {
    return (*(_DWORD *)a1 + 250);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 7;
  int v5 = v3 - 7;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TrainingLoadDayViewLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(void *)unint64_t result = a2 - 250;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 6;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrainingLoadDayViewLayout()
{
  return &type metadata for TrainingLoadDayViewLayout;
}

double sub_261B50048(uint64_t a1, char a2)
{
  double result = *(double *)&a1;
  if (a2) {
    return 10.0;
  }
  return result;
}

uint64_t sub_261B50068(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_261B50188(a1, a2, a3, a4, *(double *)(v10 + 8), a9, a10, *(unsigned char *)v10);
}

uint64_t sub_261B5007C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_261B500EC(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B668]);
}

uint64_t sub_261B500B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_261B500EC(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B670]);
}

uint64_t sub_261B500EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

unint64_t sub_261B50134()
{
  unint64_t result = qword_26A9482C0;
  if (!qword_26A9482C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9482C0);
  }
  return result;
}

uint64_t sub_261B50188(double a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, char a8)
{
  double v107 = COERCE_DOUBLE(sub_261B8C988());
  double v106 = *(double *)(*(void *)&v107 - 8);
  MEMORY[0x270FA5388](*(void *)&v107);
  uint64_t v14 = (char *)v104 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_261B8D598();
  uint64_t v111 = *(void *)(v15 - 8);
  uint64_t v112 = v15;
  MEMORY[0x270FA5388](v15);
  char v17 = (char *)v104 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v104 - v19;
  MEMORY[0x270FA5388](v21);
  id v23 = (char *)v104 - v22;
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)v104 - v25;
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)v104 - v28;
  MEMORY[0x270FA5388](v30);
  __int16 v32 = (char *)v104 - v31;
  MEMORY[0x270FA5388](v33);
  uint64_t v35 = (char *)v104 - v34;
  MEMORY[0x270FA5388](v36);
  v120 = (char *)v104 - v37;
  sub_261B8D5C8();
  v114 = v35;
  sub_261B8D5C8();
  v115 = v32;
  sub_261B8D5C8();
  v116 = v29;
  sub_261B8D5C8();
  v117 = v26;
  sub_261B8D5C8();
  v118 = v23;
  sub_261B8D5C8();
  v119 = v20;
  sub_261B8D5C8();
  sub_261B8D5C8();
  double v113 = a4 * 0.28;
  switch(a8)
  {
    case 1:
      double v110 = a4 * 0.28 * 0.45;
      double v109 = a5;
      double v107 = a4 * 0.54;
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      sub_261B8D588();
      double v108 = a3;
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v38 = v114;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v39 = v115;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v40 = v116;
      sub_261B8D588();
      sub_261B8D718();
      char v53 = v52;
      char v55 = v54;
      sub_261B8ED08();
      char v122 = v53 & 1;
      char v121 = v55 & 1;
      uint64_t v45 = v117;
      sub_261B8D588();
      sub_261B8D718();
      char v57 = v56;
      char v59 = v58;
      sub_261B8ED08();
      char v122 = v57 & 1;
      char v121 = v59 & 1;
      char v50 = v118;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v51 = v119;
      sub_261B8D588();
      break;
    case 2:
      double v108 = a3;
      double v110 = a4 * 0.28 * 0.45;
      double v109 = a5;
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v38 = v114;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v39 = v115;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v40 = v116;
      sub_261B8D588();
      sub_261B8D718();
      char v61 = v60;
      char v63 = v62;
      sub_261B8ED08();
      char v122 = v61 & 1;
      char v121 = v63 & 1;
      uint64_t v45 = v117;
      sub_261B8D588();
      sub_261B8D718();
      char v65 = v64;
      char v67 = v66;
      sub_261B8ED08();
      char v122 = v65 & 1;
      char v121 = v67 & 1;
      char v50 = v118;
      sub_261B8D588();
      goto LABEL_7;
    case 3:
      *(double *)&v104[2] = a4 * 0.03;
      *(double *)&v104[1] = a2;
      double v105 = a4 * 0.16 + a2;
      sub_261B8C948();
      sub_261B8C938();
      double v109 = a5;
      double v110 = a4 * 0.28 * 0.45;
      (*(void (**)(char *, double))(*(void *)&v106 + 8))(v14, COERCE_DOUBLE(*(void *)&v107));
      sub_261B8D718();
      char v69 = v68;
      char v71 = v70;
      sub_261B8ED08();
      char v122 = v69 & 1;
      char v121 = v71 & 1;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v38 = v114;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v39 = v115;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v40 = v116;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v45 = v117;
      sub_261B8D588();
      sub_261B8D718();
      char v73 = v72;
      char v75 = v74;
      sub_261B8ED08();
      char v122 = v73 & 1;
      char v121 = v75 & 1;
      char v50 = v118;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v51 = v119;
      sub_261B8D588();
      break;
    case 4:
      double v107 = a4 * 0.54;
      double v110 = a4 * 0.28 * 0.45;
      double v109 = a5;
      sub_261B8D718();
      char v77 = v76;
      char v79 = v78;
      sub_261B8ED08();
      char v122 = v77 & 1;
      char v121 = v79 & 1;
      sub_261B8D588();
      sub_261B8D718();
      char v81 = v80;
      char v83 = v82;
      sub_261B8ED08();
      char v122 = v81 & 1;
      char v121 = v83 & 1;
      uint64_t v38 = v114;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v40 = v116;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v39 = v115;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v45 = v117;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      char v50 = v118;
      sub_261B8D588();
LABEL_7:
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v51 = v119;
      sub_261B8D588();
      break;
    case 5:
      double v107 = a4 * 0.54;
      double v110 = a4 * 0.28 * 0.45;
      double v105 = a4 * 0.22;
      double v109 = a5;
      double v108 = a3;
      double v106 = a4 * 0.03 + a4 * 0.03 + a4 * 0.22 + a4 * 0.1 + a4 * 0.04 + a4 * 0.04 + a2;
      sub_261B8D718();
      char v85 = v84;
      char v87 = v86;
      sub_261B8ED08();
      char v122 = v85 & 1;
      char v121 = v87 & 1;
      sub_261B8D588();
      sub_261B8D718();
      char v89 = v88;
      char v91 = v90;
      sub_261B8ED08();
      char v122 = v89 & 1;
      char v121 = v91 & 1;
      uint64_t v38 = v114;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v40 = v116;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v39 = v115;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v45 = v117;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      char v50 = v118;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v51 = v119;
      sub_261B8D588();
      break;
    case 6:
      double v109 = a4 * 0.7;
      double v110 = a4 * 0.28 * 0.45;
      sub_261B8D718();
      char v93 = v92;
      char v95 = v94;
      sub_261B8ED08();
      char v122 = v93 & 1;
      char v121 = v95 & 1;
      sub_261B8D588();
      sub_261B8D718();
      char v97 = v96;
      char v99 = v98;
      sub_261B8ED08();
      char v122 = v97 & 1;
      char v121 = v99 & 1;
      uint64_t v38 = v114;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v40 = v116;
      sub_261B8D588();
      double v108 = a3;
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v39 = v115;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v45 = v117;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      char v50 = v118;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v51 = v119;
      sub_261B8D588();
      char v122 = 0;
      char v121 = 0;
      sub_261B8D578();
      break;
    default:
      double v108 = a3;
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v38 = v114;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v39 = v115;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v40 = v116;
      sub_261B8D588();
      sub_261B8D718();
      char v42 = v41;
      char v44 = v43;
      sub_261B8ED08();
      char v122 = v42 & 1;
      char v121 = v44 & 1;
      uint64_t v45 = v117;
      sub_261B8D588();
      sub_261B8D718();
      char v47 = v46;
      char v49 = v48;
      sub_261B8ED08();
      char v122 = v47 & 1;
      char v121 = v49 & 1;
      char v50 = v118;
      sub_261B8D588();
      sub_261B8ED08();
      char v122 = 0;
      char v121 = 0;
      uint64_t v51 = v119;
      sub_261B8D588();
      char v122 = 0;
      char v121 = 0;
      sub_261B8D578();
      break;
  }
  sub_261B8ED08();
  char v122 = 0;
  char v121 = 0;
  sub_261B8D588();
  v100 = *(void (**)(char *, uint64_t))(v111 + 8);
  v101 = v17;
  uint64_t v102 = v112;
  v100(v101, v112);
  v100(v51, v102);
  v100(v50, v102);
  v100(v45, v102);
  v100(v40, v102);
  v100(v39, v102);
  v100(v38, v102);
  return ((uint64_t (*)(char *, uint64_t))v100)(v120, v102);
}

void View.headerHyphenation()()
{
}

void View.bodyHyphenation()()
{
}

uint64_t sub_261B5173C(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx07WorkoutB017HeaderHyphenationVGAaBHPxAaBHD1__AgA0C8ModifierHPyHCHCTm(a1, (uint64_t)&type metadata for HeaderHyphenation, (void (*)(void))sub_261B5175C);
}

unint64_t sub_261B5175C()
{
  unint64_t result = qword_26A9482C8;
  if (!qword_26A9482C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9482C8);
  }
  return result;
}

uint64_t sub_261B517B0(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx07WorkoutB017HeaderHyphenationVGAaBHPxAaBHD1__AgA0C8ModifierHPyHCHCTm(a1, (uint64_t)&type metadata for BodyHyphenation, (void (*)(void))sub_261A7B298);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx07WorkoutB017HeaderHyphenationVGAaBHPxAaBHD1__AgA0C8ModifierHPyHCHCTm(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return swift_getWitnessTable();
}

ValueMetadata *type metadata accessor for BodyHyphenation()
{
  return &type metadata for BodyHyphenation;
}

ValueMetadata *type metadata accessor for HeaderHyphenation()
{
  return &type metadata for HeaderHyphenation;
}

uint64_t sub_261B51860()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_261B5187C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_261B518B0(a1, a2, a3, &qword_26A9482D0, &qword_26A9482D8);
}

uint64_t sub_261B51898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_261B518B0(a1, a2, a3, &qword_26A9482E0, &qword_26A9482E8);
}

uint64_t sub_261B518B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t *a5)
{
  return sub_261B8E628();
}

uint64_t sub_261B51928()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_261B51944(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_261B51994(uint64_t a1)
{
  return get_witness_table_qd__7SwiftUI4ViewHD2_AaBPAAE17hyphenationFactoryQr12CoreGraphics7CGFloatVFQOyAA01_C16Modifier_ContentVy07WorkoutB017HeaderHyphenationVG_Qo_HOTm(a1, &qword_26A9482D0, &qword_26A9482D8);
}

uint64_t sub_261B519A8(uint64_t a1)
{
  return get_witness_table_qd__7SwiftUI4ViewHD2_AaBPAAE17hyphenationFactoryQr12CoreGraphics7CGFloatVFQOyAA01_C16Modifier_ContentVy07WorkoutB017HeaderHyphenationVG_Qo_HOTm(a1, &qword_26A9482E0, &qword_26A9482E8);
}

uint64_t get_witness_table_qd__7SwiftUI4ViewHD2_AaBPAAE17hyphenationFactoryQr12CoreGraphics7CGFloatVFQOyAA01_C16Modifier_ContentVy07WorkoutB017HeaderHyphenationVG_Qo_HOTm(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for NaturalDistanceMetricText(uint64_t a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NaturalDistanceMetricText(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  id v4 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NaturalDistanceMetricText(void *a1, void *a2)
{
  *a1 = *a2;
  id v4 = (void *)a2[1];
  int v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for NaturalDistanceMetricText(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  id v4 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NaturalDistanceMetricText(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NaturalDistanceMetricText(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NaturalDistanceMetricText()
{
  return &type metadata for NaturalDistanceMetricText;
}

uint64_t sub_261B51C1C()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_261B51C38@<X0>(uint64_t a1@<X8>)
{
  double v3 = *v1;
  id v4 = (void *)*((void *)v1 + 1);
  uint64_t v5 = *((void *)v1 + 2);
  id result = objc_msgSend(v4, sel_localizedCompactNaturalScaleStringWithDistanceInMeters_distanceType_unitStyle_usedUnit_, v5, 0, 0, *v1);
  if (result)
  {
    char v7 = result;
    uint64_t v8 = sub_261B8F0F8();
    uint64_t v10 = v9;

    id v11 = objc_msgSend(v4, sel_localizedShortUnitStringForDistanceUnit_textCase_, objc_msgSend(v4, sel_naturalScaleUnitForDistanceInMeters_distanceType_, v5, v3), 2);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = sub_261B8F0F8();
      uint64_t v15 = v14;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v15 = 0;
    }
    uint64_t v17 = *((void *)v1 + 3);
    uint64_t v16 = *((void *)v1 + 4);
    *(void *)a1 = v8;
    *(void *)(a1 + 8) = v10;
    *(void *)(a1 + 16) = v13;
    *(void *)(a1 + 24) = v15;
    *(void *)(a1 + 32) = v17;
    *(void *)(a1 + 40) = v16;
    *(_WORD *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 64) = 0;
    return (id)swift_bridgeObjectRetain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t Color.init(rgbHex:)(int a1)
{
  uint64_t v2 = sub_261B8E838();
  MEMORY[0x270FA5388](v2);
  id v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v5 + 104))(v4, *MEMORY[0x263F1B388]);
  return MEMORY[0x263E4C7A0](v4, (double)BYTE2(a1) / 255.0, (double)BYTE1(a1) / 255.0, (double)a1 / 255.0, 1.0);
}

id sub_261B51E60()
{
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    uint64_t v1 = result;
    id v2 = objc_msgSend(result, sel_getActivePairedDevice);
    if (v2)
    {
      uint64_t v3 = v2;
      if (objc_msgSend(v2, sel_valueForProperty_, *MEMORY[0x263F57610]))
      {
        sub_261B8F7B8();

        swift_unknownObjectRelease();
      }
      else
      {

        memset(v5, 0, sizeof(v5));
      }
      sub_261B51F80((uint64_t)v5, (uint64_t)v6);
      if (v7)
      {
        if (swift_dynamicCast()) {
          return (id)v4;
        }
      }
      else
      {
        sub_2619FC33C((uint64_t)v6);
      }
    }
    else
    {
    }
    return 0;
  }
  return result;
}

uint64_t sub_261B51F80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943228);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_261B51FE8()
{
  uint64_t result = (uint64_t)objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    uint64_t v1 = (void *)result;
    id v2 = objc_msgSend((id)result, sel_getActivePairedDevice);
    if (!v2)
    {

      return 0;
    }
    uint64_t v3 = v2;
    if (objc_msgSend(v2, sel_valueForProperty_, *MEMORY[0x263F575B0]))
    {
      sub_261B8F7B8();

      swift_unknownObjectRelease();
    }
    else
    {

      memset(v5, 0, sizeof(v5));
    }
    sub_261B51F80((uint64_t)v5, (uint64_t)v6);
    if (v7)
    {
      if swift_dynamicCast() && (v4) {
        return 0;
      }
    }
    else
    {
      sub_2619FC33C((uint64_t)v6);
    }
    return 1;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for WorkoutConfigurationViewerState(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x261B521DCLL);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutConfigurationViewerState()
{
  return &type metadata for WorkoutConfigurationViewerState;
}

unint64_t sub_261B52218()
{
  unint64_t result = qword_26A9482F0;
  if (!qword_26A9482F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9482F0);
  }
  return result;
}

uint64_t sub_261B5226C(uint64_t a1, void *a2, char a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945788);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = 0;
  switch(a3)
  {
    case 1:
      if (qword_26B416690 != -1) {
        goto LABEL_17;
      }
      goto LABEL_11;
    case 2:
      if (qword_26B416690 == -1) {
        goto LABEL_11;
      }
      goto LABEL_17;
    case 3:
      if (qword_26B416690 == -1) {
        goto LABEL_11;
      }
      goto LABEL_17;
    case 5:
      return v8;
    case 6:
      if (qword_26B416690 == -1) {
        goto LABEL_11;
      }
LABEL_17:
      swift_once();
LABEL_11:
      swift_beginAccess();
      id v13 = (id)qword_26B416688;
      uint64_t v8 = sub_261B8AA48();

      break;
    default:
      uint64_t v9 = WorkoutConfiguration.titleForPreview(_:)(a2);
      if (v10)
      {
        uint64_t v11 = v9;
        uint64_t v12 = v10;
      }
      else
      {
        uint64_t v14 = sub_261B8C5D8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v7, 1, 1, v14);
        uint64_t v11 = sub_261B8F158();
        uint64_t v12 = v15;
        sub_261A6FF34((uint64_t)v7);
      }
      if (qword_26B416690 != -1) {
        swift_once();
      }
      swift_beginAccess();
      id v16 = (id)qword_26B416688;
      sub_261B8AA48();

      __swift_instantiateConcreteTypeFromMangledName(&qword_26A943F60);
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_261B93F70;
      *(void *)(v17 + 56) = MEMORY[0x263F8D310];
      *(void *)(v17 + 64) = sub_261A2B2E8();
      *(void *)(v17 + 32) = v11;
      *(void *)(v17 + 40) = v12;
      uint64_t v8 = sub_261B8F118();
      swift_bridgeObjectRelease();
      break;
  }
  return v8;
}

uint64_t sub_261B52708(char a1)
{
  if (a1 == 4)
  {
    id v8 = objc_msgSend(self, sel_currentDevice);
    id v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

    if (v9)
    {
      if (qword_26B416690 != -1) {
        swift_once();
      }
    }
    else if (qword_26B416690 != -1)
    {
      swift_once();
    }
    swift_beginAccess();
    id v10 = (id)qword_26B416688;
    uint64_t v7 = sub_261B8AA48();
  }
  else if (a1 == 1)
  {
    id v1 = sub_261B51E60();
    uint64_t v3 = v2;
    if (v2)
    {
      id v4 = v1;
      if (qword_26B416690 != -1) {
        swift_once();
      }
      swift_beginAccess();
      id v5 = (id)qword_26B416688;
      sub_261B8AA48();

      __swift_instantiateConcreteTypeFromMangledName(&qword_26A943F60);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_261B93F70;
      *(void *)(v6 + 56) = MEMORY[0x263F8D310];
      *(void *)(v6 + 64) = sub_261A2B2E8();
      *(void *)(v6 + 32) = v4;
      *(void *)(v6 + 40) = v3;
      uint64_t v7 = sub_261B8F118();
      swift_bridgeObjectRelease();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return 0;
  }
  return v7;
}

uint64_t sub_261B52A00()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A410]), sel_init);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3F180]), sel_initWithHealthStore_, v0);
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3F170]), sel_initWithUnitManager_, v1);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = WorkoutConfiguration.displayDetail(_:)(v2);
    if (!v5) {
      uint64_t v4 = WorkoutConfiguration.displayName(formattingManager:)(v3);
    }
    uint64_t v6 = v4;
  }
  else
  {

    return 0;
  }
  return v6;
}

id WorkoutConfigurationImageGenerator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id WorkoutConfigurationImageGenerator.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorkoutConfigurationImageGenerator();
  return objc_msgSendSuper2(&v2, sel_init);
}

id WorkoutConfigurationImageGenerator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorkoutConfigurationImageGenerator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id _s9WorkoutUI0A27ConfigurationImageGeneratorC25createBlastDoorDataSource4fromSo09WKUIBlasthiJ0CSg10Foundation0I0V_tFZ_0()
{
  uint64_t v0 = sub_261B8C218();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261B8C608();
  swift_allocObject();
  sub_261B8C5F8();
  sub_261B8BAD8();
  sub_261B8BD18();
  uint64_t v4 = (void *)MEMORY[0x263E49BD0](0);
  uint64_t v5 = (void *)sub_261B8BA48();

  uint64_t v6 = (void *)sub_261B8BA28();
  id v7 = objc_msgSend(v6, sel_effectiveTypeIdentifier);

  id v8 = (void *)sub_261B8BA28();
  id v9 = objc_msgSend(v8, sel_isIndoor);

  sub_261B8BAA8();
  uint64_t v10 = sub_261B8C208();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_261B8B848();
  if (swift_dynamicCastClass())
  {
    id v11 = v5;
    uint64_t v12 = (void *)sub_261B8B838();
    id v13 = objc_msgSend(v12, sel_goalTypeIdentifier);
  }
  else
  {
    id v13 = 0;
  }
  sub_261B52A00();
  id v14 = objc_allocWithZone((Class)WKUIBlastDoorDataSource);
  uint64_t v15 = (void *)sub_261B8F0B8();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v14, sel_initWithActivityType_isIndoor_configurationType_configurationName_goalTypeIdentifier_, v7, v9, v10, v15, v13);
  swift_release();

  return v16;
}

void *_s9WorkoutUI0A27ConfigurationImageGeneratorC06createD04from10Foundation4DataVSgAH_tFZ_0()
{
  sub_261B8C608();
  swift_allocObject();
  sub_261B8C5F8();
  sub_261B8BAD8();
  sub_261B8BD18();
  uint64_t v0 = (void *)MEMORY[0x263E49BD0](0);
  uint64_t v2 = (void *)sub_261B8BA48();

  id v8 = (void *)sub_261B8BA28();
  id v9 = v2;
  sub_261B52A00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948300);
  swift_allocObject();
  swift_bridgeObjectRetain();
  id v3 = v9;
  id v4 = v8;
  sub_261B8D568();
  uint64_t v5 = (UIImage *)sub_261B8D548();
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = UIImagePNGRepresentation(v5);

    if (v7)
    {
      uint64_t v6 = (void *)sub_261B8AC18();

      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();

      return 0;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t _s9WorkoutUI0A27ConfigurationImageGeneratorC06createD012activityType8isIndoor013configurationH00K4Name04goalH10Identifier5scaleSo7UIImageCSgSu_SbSiSSSu12CoreGraphics7CGFloatVtFZ_0(uint64_t a1, char a2, NSObject *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v59 = a4;
  uint64_t v60 = a5;
  uint64_t v10 = sub_261B8CE88();
  uint64_t v61 = *(void *)(v10 - 8);
  uint64_t v62 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v58[0] = (char *)v58 - v14;
  uint64_t v15 = sub_261B8AE38();
  MEMORY[0x270FA5388](v15 - 8);
  v58[1] = (char *)v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9482F8);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_261B8C218();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  id v23 = (char *)v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)v58 - v25;
  uint64_t v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3F188]), sel_initWithActivityTypeIdentifier_isIndoor_, a1, a2 & 1);
  id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3F1A0]), sel_initWithGoalTypeIdentifier_value_, a6, 0);
  uint64_t v29 = a3;
  sub_261B8C1F8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    sub_261B53AF0((uint64_t)v19);
    sub_261B8C648();
    uint64_t v30 = sub_261B8CE78();
    os_log_type_t v31 = sub_261B8F4B8();
    if (os_log_type_enabled(v30, v31))
    {
      __int16 v32 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)__int16 v32 = 134217984;
      char v63 = v29;
      sub_261B8F6F8();
      _os_log_impl(&dword_2619F0000, v30, v31, "Unable to generate workout configuration from %ld, returning nil", v32, 0xCu);
      MEMORY[0x263E4E970](v32, -1, -1);
      uint64_t v33 = v27;
    }
    else
    {
      uint64_t v33 = v30;
      uint64_t v30 = v27;
    }

    (*(void (**)(char *, uint64_t))(v61 + 8))(v12, v62);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v26, v19, v20);
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v23, v26, v20);
  int v34 = (*(uint64_t (**)(char *, uint64_t))(v21 + 88))(v23, v20);
  if (v34 == *MEMORY[0x263F87DF0])
  {
    sub_261B8B848();
    uint64_t v35 = v27;
    uint64_t v36 = v27;
    id v37 = v28;
    uint64_t v38 = v28;
    sub_261B8AE28();
    sub_261B8BD18();
    MEMORY[0x263E49BD0](0);
    uint64_t v39 = sub_261B8B858();
LABEL_17:
    uint64_t v51 = (void *)v39;
LABEL_18:
    char v63 = v36;
    char v64 = v51;
    uint64_t v65 = v59;
    uint64_t v66 = v60;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948300);
    swift_allocObject();
    char v52 = v36;
    swift_bridgeObjectRetain_n();
    id v53 = v51;
    char v54 = v52;
    id v55 = v53;
    sub_261B8D568();
    sub_261B8D558();
    uint64_t v40 = sub_261B8D548();
    swift_bridgeObjectRelease();

    swift_release();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v20);
    return v40;
  }
  if (v34 == *MEMORY[0x263F87E08])
  {
    swift_bridgeObjectRetain();
    sub_261B8AE28();
    id v41 = objc_allocWithZone((Class)sub_261B8B958());
    sub_261B8B968();
    uint64_t v36 = v27;
    sub_261B8B988();
    char v42 = v27;
    uint64_t v38 = v28;
    sub_261B8AE28();
    sub_261B8BD18();
    MEMORY[0x263E49BD0](0);
    uint64_t v39 = sub_261B8B998();
    goto LABEL_17;
  }
  if (v34 == *MEMORY[0x263F87DF8])
  {
    char v43 = v27;
    uint64_t v44 = v58[0];
    sub_261B8C648();
    uint64_t v45 = sub_261B8CE78();
    os_log_type_t v46 = sub_261B8F4B8();
    if (os_log_type_enabled(v45, v46))
    {
      id v47 = v28;
      char v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v48 = 0;
      _os_log_impl(&dword_2619F0000, v45, v46, "Error: RaceWorkoutConfiguration is not shareable", v48, 2u);
      char v49 = v48;
      id v28 = v47;
      MEMORY[0x263E4E970](v49, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v44, v62);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v20);
    return 0;
  }
  if (v34 == *MEMORY[0x263F87E00])
  {
    uint64_t v62 = sub_261B8B918();
    sub_261B53B50();
    char v50 = v27;
    uint64_t v36 = v27;
    sub_261B8F5F8();
    uint64_t v38 = v28;
    sub_261B8F618();
    sub_261B8AE28();
    sub_261B8BD18();
    MEMORY[0x263E49BD0](0);
    uint64_t v39 = sub_261B8B928();
    goto LABEL_17;
  }
  if (v34 == *MEMORY[0x263F87DE8])
  {
    sub_261B8B818();
    uint64_t v36 = v27;
    sub_261B8AE28();
    sub_261B8BD18();
    MEMORY[0x263E49BD0](0);
    uint64_t v51 = (void *)sub_261B8B828();
    uint64_t v38 = v28;
    goto LABEL_18;
  }
  char v57 = *(void (**)(char *, uint64_t))(v21 + 8);
  v57(v26, v20);

  v57(v23, v20);
  return 0;
}

UIImage *_s9WorkoutUI0A27ConfigurationImageGeneratorC06createD04from5scale10Foundation4DataVSgSo013WKUIBlastDoorJ6SourceC_12CoreGraphics7CGFloatVtFZ_0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_activityType);
  char v3 = objc_msgSend(a1, sel_isIndoor);
  id v4 = objc_msgSend(a1, sel_configurationType);
  id v5 = objc_msgSend(a1, sel_configurationName);
  uint64_t v6 = sub_261B8F0F8();
  uint64_t v8 = v7;

  id v9 = (UIImage *)_s9WorkoutUI0A27ConfigurationImageGeneratorC06createD012activityType8isIndoor013configurationH00K4Name04goalH10Identifier5scaleSo7UIImageCSgSu_SbSiSSSu12CoreGraphics7CGFloatVtFZ_0((uint64_t)v2, v3, v4, v6, v8, (uint64_t)objc_msgSend(a1, sel_goalTypeIdentifier));
  swift_bridgeObjectRelease();
  if (v9)
  {
    uint64_t v10 = UIImagePNGRepresentation(v9);

    if (v10)
    {
      id v9 = (UIImage *)sub_261B8AC18();
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

uint64_t type metadata accessor for WorkoutConfigurationImageGenerator()
{
  return self;
}

uint64_t sub_261B53AF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9482F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_261B53B50()
{
  unint64_t result = qword_26A948308[0];
  if (!qword_26A948308[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_26A948308);
  }
  return result;
}

uint64_t sub_261B53B90()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_261B53C28(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  id v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 56 > 0x18)
  {
    uint64_t v9 = *a2;
    *id v4 = *a2;
    id v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    long long v13 = *(_OWORD *)(v11 + 16);
    long long v12 = *(_OWORD *)(v11 + 32);
    long long v14 = *(_OWORD *)v11;
    *(void *)(v10 + 48) = *(void *)(v11 + 48);
    *(_OWORD *)(v10 + 16) = v13;
    *(_OWORD *)(v10 + 32) = v12;
    *(_OWORD *)unint64_t v10 = v14;
  }
  return v4;
}

uint64_t sub_261B53D30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  long long v10 = *(_OWORD *)(v8 + 16);
  long long v9 = *(_OWORD *)(v8 + 32);
  long long v11 = *(_OWORD *)v8;
  *(void *)(v7 + 48) = *(void *)(v8 + 48);
  *(_OWORD *)(v7 + 16) = v10;
  *(_OWORD *)(v7 + 32) = v9;
  *(_OWORD *)unint64_t v7 = v11;
  return a1;
}

uint64_t sub_261B53DBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v7 = *v8;
  v7[1] = v8[1];
  v7[2] = v8[2];
  v7[3] = v8[3];
  v7[4] = v8[4];
  v7[5] = v8[5];
  v7[6] = v8[6];
  return a1;
}

uint64_t sub_261B53E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  long long v10 = *(_OWORD *)(v8 + 16);
  long long v9 = *(_OWORD *)(v8 + 32);
  long long v11 = *(_OWORD *)v8;
  *(void *)(v7 + 48) = *(void *)(v8 + 48);
  *(_OWORD *)(v7 + 16) = v10;
  *(_OWORD *)(v7 + 32) = v9;
  *(_OWORD *)unint64_t v7 = v11;
  return a1;
}

uint64_t sub_261B53EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v7 = *v8;
  v7[1] = v8[1];
  v7[2] = v8[2];
  v7[3] = v8[3];
  v7[4] = v8[4];
  v7[5] = v8[5];
  v7[6] = v8[6];
  return a1;
}

uint64_t sub_261B53FA0(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  if (v5 < a2)
  {
    unint64_t v6 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 56;
    unsigned int v7 = a2 - v5;
    uint64_t v8 = v6 & 0xFFFFFFF8;
    if ((v6 & 0xFFFFFFF8) != 0) {
      unsigned int v9 = 2;
    }
    else {
      unsigned int v9 = v7 + 1;
    }
    if (v9 >= 0x10000) {
      unsigned int v10 = 4;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v9 < 0x100) {
      unsigned int v10 = 1;
    }
    if (v9 >= 2) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    switch(v11)
    {
      case 1:
        int v12 = *((unsigned __int8 *)a1 + v6);
        if (!v12) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v12 = *(unsigned __int16 *)((char *)a1 + v6);
        if (v12) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x261B540B4);
      case 4:
        int v12 = *(_DWORD *)((char *)a1 + v6);
        if (!v12) {
          break;
        }
LABEL_18:
        int v13 = v12 - 1;
        if (v8)
        {
          int v13 = 0;
          LODWORD(v8) = *a1;
        }
        return v5 + (v8 | v13) + 1;
      default:
        break;
    }
  }
  if (v5) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  else {
    return 0;
  }
}

void sub_261B540C8(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = ((*(void *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 56;
  if (v7 >= a3)
  {
    int v12 = 0;
    int v13 = a2 - v7;
    if (a2 <= v7)
    {
LABEL_14:
      switch(v12)
      {
        case 1:
          a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 2:
          *(_WORD *)&a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 3:
          goto LABEL_34;
        case 4:
          *(_DWORD *)&a1[v8] = 0;
          goto LABEL_26;
        default:
LABEL_26:
          if (a2)
          {
LABEL_27:
            uint64_t v16 = *(void (**)(void))(v6 + 56);
            v16();
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v9 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFC8) {
      unsigned int v10 = v9 + 1;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v10 >= 0x10000) {
      int v11 = 4;
    }
    else {
      int v11 = 2;
    }
    if (v10 < 0x100) {
      int v11 = 1;
    }
    if (v10 >= 2) {
      int v12 = v11;
    }
    else {
      int v12 = 0;
    }
    int v13 = a2 - v7;
    if (a2 <= v7) {
      goto LABEL_14;
    }
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFC8) {
    int v14 = v13;
  }
  else {
    int v14 = 1;
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFC8)
  {
    unsigned int v15 = ~v7 + a2;
    bzero(a1, v8);
    *(_DWORD *)a1 = v15;
  }
  switch(v12)
  {
    case 1:
      a1[v8] = v14;
      break;
    case 2:
      *(_WORD *)&a1[v8] = v14;
      break;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x261B54274);
    case 4:
      *(_DWORD *)&a1[v8] = v14;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for MetricHeadingView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_261B542B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_261B542F8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9430E0);
  sub_261B8D688();
  sub_261B8D688();
  sub_261B8D688();
  sub_261B8D688();
  swift_getTupleTypeMetadata2();
  sub_261B8ECE8();
  swift_getWitnessTable();
  uint64_t v4 = sub_261B8EA78();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unsigned int v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  unsigned int v10 = &v14[-v9];
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v15 = v3;
  uint64_t v16 = v11;
  uint64_t v17 = v1;
  sub_261B8DAD8();
  sub_261B8EA68();
  swift_getWitnessTable();
  sub_261A8FE78(v7, v4);
  int v12 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  v12(v7, v4);
  sub_261A8FE78(v10, v4);
  return ((uint64_t (*)(unsigned char *, uint64_t))v12)(v10, v4);
}

uint64_t sub_261B5453C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v49 = a3;
  v44[1] = a1;
  uint64_t v57 = a4;
  uint64_t v6 = sub_261B8E078();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v11);
  int v13 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9430E0);
  uint64_t v14 = sub_261B8D688();
  uint64_t v52 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)v44 - v15;
  uint64_t v48 = sub_261B8D688();
  uint64_t v53 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v45 = (char *)v44 - v17;
  uint64_t v51 = sub_261B8D688();
  uint64_t v55 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  os_log_type_t v46 = (char *)v44 - v18;
  uint64_t v19 = sub_261B8D688();
  uint64_t v56 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  char v54 = (char *)v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  id v47 = (char *)v44 - v22;
  double v24 = MEMORY[0x270FA5388](v23);
  char v50 = (char *)v44 - v25;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v10 + 16))(v13, a1, a2, v24);
  sub_261B8E148();
  sub_261B8E068();
  sub_261B8E178();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v26 = v49;
  sub_261B8E738();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, a2);
  sub_261B8DFB8();
  FIUICurrentLanguageRequiresTallScript();
  unint64_t v27 = sub_261B54C3C();
  v63[8] = v26;
  v63[9] = v27;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v29 = v45;
  sub_261B8E798();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v16, v14);
  sub_261B8DFC8();
  type metadata accessor for MetricHeadingView();
  uint64_t v30 = MEMORY[0x263F18C10];
  v63[6] = WitnessTable;
  v63[7] = MEMORY[0x263F18C10];
  uint64_t v31 = v48;
  uint64_t v32 = swift_getWitnessTable();
  uint64_t v33 = v46;
  sub_261B8E798();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v29, v31);
  sub_261B8DFD8();
  v63[4] = v32;
  v63[5] = v30;
  uint64_t v34 = v51;
  uint64_t v35 = swift_getWitnessTable();
  uint64_t v36 = v47;
  sub_261B8E798();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v33, v34);
  v63[2] = v35;
  v63[3] = v30;
  uint64_t v37 = swift_getWitnessTable();
  uint64_t v38 = v50;
  sub_261A8FE78(v36, v19);
  uint64_t v39 = v56;
  uint64_t v40 = *(void (**)(char *, uint64_t))(v56 + 8);
  v40(v36, v19);
  id v41 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  char v42 = v54;
  v41(v54, v38, v19);
  uint64_t v61 = 0;
  char v62 = 1;
  v63[0] = v42;
  v63[1] = &v61;
  v60[0] = v19;
  v60[1] = MEMORY[0x263F1B6B0];
  uint64_t v58 = v37;
  uint64_t v59 = MEMORY[0x263F1B698];
  sub_261A2CEA4((uint64_t)v63, 2uLL, (uint64_t)v60);
  v40(v38, v19);
  return ((uint64_t (*)(char *, uint64_t))v40)(v42, v19);
}

uint64_t sub_261B54C30@<X0>(uint64_t a1@<X8>)
{
  return sub_261B5453C(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_261B54C3C()
{
  unint64_t result = qword_26A9430D8;
  if (!qword_26A9430D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9430E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9430D8);
  }
  return result;
}

uint64_t sub_261B54C98()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9430E0);
  sub_261B8D688();
  sub_261B8D688();
  sub_261B8D688();
  sub_261B8D688();
  swift_getTupleTypeMetadata2();
  sub_261B8ECE8();
  swift_getWitnessTable();
  sub_261B8EA78();
  return swift_getWitnessTable();
}

uint64_t sub_261B54D94()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_261B8CA08();
  uint64_t v3 = *(void *)(v2 - 8);
  double v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v3 + 16))(v6, v1, v2, v4);
  int v7 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  if (v7 == *MEMORY[0x263F42C50])
  {
    (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
    v9[0] = 0x74756F6B726F77;
    v9[1] = 0xE700000000000000;
    sub_261B8F5E8();
    sub_261B8F1C8();
    swift_bridgeObjectRelease();
    return v9[0];
  }
  else if (v7 == *MEMORY[0x263F42C58])
  {
    return 0x7961446C6C61;
  }
  else if (v7 == *MEMORY[0x263F42C60])
  {
    return 0x6F6B726F576C6C61;
  }
  else
  {
    uint64_t result = sub_261B8F9C8();
    __break(1u);
  }
  return result;
}

uint64_t static DemoUtilities.fetchWorkouts(startingDate:)(uint64_t a1)
{
  uint64_t v2 = (__CFString *)sub_261B8F0B8();
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(v2, (CFStringRef)*MEMORY[0x263F3D140]);

  if (!v3) {
    return 0;
  }
  CFPropertyListRef v12 = v3;
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = v10;
  unint64_t v5 = v11;
  sub_261B8A778();
  swift_allocObject();
  sub_261B8A768();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943660);
  sub_261B596C4(&qword_26A943690, (void (*)(void))sub_261A0C884);
  uint64_t v6 = sub_261B8A758();
  MEMORY[0x270FA5388](v6);
  void v9[2] = a1;
  uint64_t v8 = sub_261AB3FEC((void (*)(uint64_t *__return_ptr, long long *))sub_261B595EC, (uint64_t)v9, v10);
  swift_release();
  sub_261A340C4(v4, v5);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t static DemoUtilities.cacheLoadValues(_:dataType:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  sub_261B8F8C8();
  swift_bridgeObjectRelease();
  sub_261B54D94();
  sub_261B8F1C8();
  swift_bridgeObjectRelease();
  sub_261B8F8C8();
  swift_bridgeObjectRelease();
  sub_261B54D94();
  sub_261B8F1C8();
  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3 != 29 || (uint64_t v3 = *(void *)(v1 + 16), v3 != 29))
    {
      sub_261B59670();
      swift_allocError();
      *(void *)uint64_t v11 = v3;
      *(void *)(v11 + 8) = 29;
      *(unsigned char *)(v11 + 16) = 0;
      swift_willThrow();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    uint64_t v27 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_261ACA408(0, 29, 0);
    for (uint64_t i = 32; i != 264; i += 8)
    {
      uint64_t v5 = sub_261B8F408();
      uint64_t v7 = v6;
      unint64_t v9 = *(void *)(v27 + 16);
      unint64_t v8 = *(void *)(v27 + 24);
      if (v9 >= v8 >> 1) {
        sub_261ACA408(v8 > 1, v9 + 1, 1);
      }
      *(void *)(v27 + 16) = v9 + 1;
      uint64_t v10 = v27 + 16 * v9;
      *(void *)(v10 + 32) = v5;
      *(void *)(v10 + 40) = v7;
    }
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A943578);
    sub_261A2902C();
    sub_261B8F048();
    swift_bridgeObjectRelease();
    uint64_t v28 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_261ACA408(0, 29, 0);
    for (uint64_t j = 32; j != 264; j += 8)
    {
      uint64_t v17 = sub_261B8F408();
      uint64_t v19 = v18;
      unint64_t v21 = *(void *)(v28 + 16);
      unint64_t v20 = *(void *)(v28 + 24);
      if (v21 >= v20 >> 1) {
        sub_261ACA408(v20 > 1, v21 + 1, 1);
      }
      *(void *)(v28 + 16) = v21 + 1;
      uint64_t v22 = v28 + 16 * v21;
      *(void *)(v22 + 32) = v17;
      *(void *)(v22 + 40) = v19;
    }
    swift_bridgeObjectRelease();
    sub_261B8F048();
    swift_bridgeObjectRelease();
    uint64_t v23 = (__CFString *)sub_261B8F0B8();
    swift_bridgeObjectRelease();
    double v24 = (void *)sub_261B8F0B8();
    swift_bridgeObjectRelease();
    CFStringRef v14 = (const __CFString *)*MEMORY[0x263F3D140];
    CFPreferencesSetAppValue(v23, v24, (CFStringRef)*MEMORY[0x263F3D140]);

    uint64_t v25 = (__CFString *)sub_261B8F0B8();
    swift_bridgeObjectRelease();
    uint64_t v15 = (__CFString *)sub_261B8F0B8();
    swift_bridgeObjectRelease();
    CFPreferencesSetAppValue(v25, v15, v14);
  }
  else
  {
    int v13 = (__CFString *)sub_261B8F0B8();
    swift_bridgeObjectRelease();
    CFStringRef v14 = (const __CFString *)*MEMORY[0x263F3D140];
    CFPreferencesSetAppValue(v13, 0, (CFStringRef)*MEMORY[0x263F3D140]);

    uint64_t v15 = (__CFString *)sub_261B8F0B8();
    swift_bridgeObjectRelease();
    CFPreferencesSetAppValue(v15, 0, v14);
  }

  uint64_t result = CFPreferencesAppSynchronize(v14);
  if (!result)
  {
    sub_261B59670();
    swift_allocError();
    *(void *)uint64_t v26 = 0;
    *(void *)(v26 + 8) = 0;
    *(unsigned char *)(v26 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t static DemoUtilities.cacheWorkouts(_:)(uint64_t a1)
{
  if (a1)
  {
    sub_261B8A7A8();
    swift_allocObject();
    sub_261B8A798();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A943660);
    sub_261B596C4(&qword_26A943668, (void (*)(void))sub_261A0C6F0);
    uint64_t v2 = sub_261B8A788();
    if (v1) {
      return swift_release();
    }
    uint64_t v7 = v2;
    unint64_t v8 = v3;
    unint64_t v9 = (__CFString *)sub_261B8F0B8();
    uint64_t v10 = (void *)sub_261B8AC08();
    CFStringRef v6 = (const __CFString *)*MEMORY[0x263F3D140];
    CFPreferencesSetAppValue(v9, v10, (CFStringRef)*MEMORY[0x263F3D140]);

    sub_261A340C4(v7, v8);
    swift_release();
  }
  else
  {
    uint64_t v5 = (__CFString *)sub_261B8F0B8();
    CFStringRef v6 = (const __CFString *)*MEMORY[0x263F3D140];
    CFPreferencesSetAppValue(v5, 0, (CFStringRef)*MEMORY[0x263F3D140]);
  }
  uint64_t result = CFPreferencesAppSynchronize(v6);
  if (!result)
  {
    sub_261B59670();
    swift_allocError();
    *(void *)uint64_t v11 = 0;
    *(void *)(v11 + 8) = 0;
    *(unsigned char *)(v11 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_261B55778(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return 0xD00000000000002CLL;
  }
  sub_261B8F8C8();
  swift_bridgeObjectRelease();
  sub_261B8FB78();
  sub_261B8F1C8();
  swift_bridgeObjectRelease();
  sub_261B8F1C8();
  sub_261B8FB78();
  sub_261B8F1C8();
  swift_bridgeObjectRelease();
  return 0x6465746365707845;
}

uint64_t sub_261B558A8()
{
  return sub_261B55778(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_261B558C0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

uint64_t _s9WorkoutUI13DemoUtilitiesV11effortValue3forSo10HKQuantityCSgSo9HKWorkoutC_tFZ_0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_metadata);
  if (!v1)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    goto LABEL_10;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_261B8EFF8();

  if (!*(void *)(v3 + 16) || (unint64_t v4 = sub_261ACB228(0xD00000000000001FLL, 0x8000000261B9D960), (v5 & 1) == 0))
  {
    long long v8 = 0u;
    long long v9 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  sub_261A0CC60(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v8);
  swift_bridgeObjectRelease();
  if (!*((void *)&v9 + 1))
  {
LABEL_10:
    sub_2619F8754((uint64_t)&v8, &qword_26A943228);
    return 0;
  }
  sub_261B598F4();
  if (swift_dynamicCast()) {
    return v7;
  }
  else {
    return 0;
  }
}

char *_s9WorkoutUI13DemoUtilitiesV33fetchTrainingLoadSampleDaySummary8dayRange8dataTypeSay13HealthBalance0fghiJ0VGSgAG09GregorianiL0V_AG0fg4DataN0OtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v436 = a1;
  uint64_t v3 = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416930);
  MEMORY[0x270FA5388](v4 - 8);
  v411 = (char *)v367 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416D28);
  MEMORY[0x270FA5388](v6 - 8);
  v371 = (char *)v367 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v372 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416D20);
  MEMORY[0x270FA5388](v372);
  uint64_t v370 = (uint64_t)v367 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v444 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))((char *)v367 - v10);
  uint64_t v422 = sub_261B8CA08();
  uint64_t v384 = *(void *)(v422 - 8);
  MEMORY[0x270FA5388](v422);
  v410 = (char *)v367 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v369 = (char *)v367 - v13;
  uint64_t v14 = sub_261B8CB38();
  MEMORY[0x270FA5388](v14 - 8);
  v438 = (char *)v367 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v379 = (char *)v367 - v17;
  uint64_t v421 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CE8);
  MEMORY[0x270FA5388](v421);
  v437 = (void (**)(char *, char *, uint64_t))((char *)v367 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v19);
  v420 = (char *)v367 - v20;
  MEMORY[0x270FA5388](v21);
  uint64_t v378 = (uint64_t)v367 - v22;
  uint64_t v419 = sub_261B8CAD8();
  uint64_t v388 = *(void *)(v419 - 8);
  MEMORY[0x270FA5388](v419);
  v409 = (char *)v367 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  v377 = (char *)v367 - v25;
  uint64_t v443 = sub_261B8CA78();
  uint64_t v383 = *(void *)(v443 - 8);
  MEMORY[0x270FA5388](v443);
  v440 = (char *)v367 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  v418 = (char *)v367 - v28;
  MEMORY[0x270FA5388](v29);
  v387 = (char *)v367 - v30;
  uint64_t v442 = sub_261B8CA58();
  uint64_t v382 = *(void *)(v442 - 8);
  MEMORY[0x270FA5388](v442);
  v454 = (char *)v367 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  v417 = (char *)v367 - v33;
  MEMORY[0x270FA5388](v34);
  v386 = (char *)v367 - v35;
  uint64_t v427 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416BF8);
  MEMORY[0x270FA5388](v427);
  v426 = (char *)v367 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  v425 = (char *)v367 - v38;
  uint64_t v455 = sub_261B8EEC8();
  v433 = *(void **)(v455 - 8);
  MEMORY[0x270FA5388](v455);
  v439 = (char *)v367 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v40);
  v398 = (char *)v367 - v41;
  MEMORY[0x270FA5388](v42);
  v441 = (char **)((char *)v367 - v43);
  MEMORY[0x270FA5388](v44);
  v413 = (void (**)(char *, uint64_t))((char *)v367 - v45);
  MEMORY[0x270FA5388](v46);
  v412 = (void (**)(char *, uint64_t))((char *)v367 - v47);
  MEMORY[0x270FA5388](v48);
  v431 = (char *)v367 - v49;
  MEMORY[0x270FA5388](v50);
  v380 = (char *)v367 - v51;
  MEMORY[0x270FA5388](v52);
  v394 = (void (**)(char *, uint64_t))((char *)v367 - v53);
  MEMORY[0x270FA5388](v54);
  v404 = (char *)v367 - v55;
  MEMORY[0x270FA5388](v56);
  uint64_t v449 = (uint64_t)v367 - v57;
  MEMORY[0x270FA5388](v58);
  v400 = (void (**)(char *, uint64_t))((char *)v367 - v59);
  MEMORY[0x270FA5388](v60);
  v402 = (char *)v367 - v61;
  MEMORY[0x270FA5388](v62);
  v396 = (char *)v367 - v63;
  MEMORY[0x270FA5388](v64);
  v435 = (char *)v367 - v65;
  uint64_t v428 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CA0);
  MEMORY[0x270FA5388](v428);
  v430 = (uint64_t (**)(char *, uint64_t))((char *)v367 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v67);
  v407 = (char *)v367 - v68;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416C20);
  MEMORY[0x270FA5388](v69 - 8);
  v397 = (char *)v367 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v71);
  v399 = (char *)v367 - v72;
  MEMORY[0x270FA5388](v73);
  uint64_t v448 = (uint64_t)v367 - v74;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416C98);
  MEMORY[0x270FA5388](v75 - 8);
  v415 = (void (**)(char *, uint64_t))((char *)v367 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v77);
  uint64_t v416 = (uint64_t)v367 - v78;
  MEMORY[0x270FA5388](v79);
  v414 = (void (**)(char *, uint64_t))((char *)v367 - v80);
  MEMORY[0x270FA5388](v81);
  v432 = (void (**)(char *, char *, uint64_t))((char *)v367 - v82);
  MEMORY[0x270FA5388](v83);
  v445 = (uint64_t)v367 - v84;
  MEMORY[0x270FA5388](v85);
  v401 = (void (**)(char *, uint64_t))((char *)v367 - v86);
  MEMORY[0x270FA5388](v87);
  v395 = (void (**)(char *, uint64_t))((char *)v367 - v88);
  MEMORY[0x270FA5388](v89);
  v403 = (uint64_t (**)(char *, uint64_t))((char *)v367 - v90);
  MEMORY[0x270FA5388](v91);
  v406 = (void (**)(char *, char *, uint64_t))((char *)v367 - v92);
  MEMORY[0x270FA5388](v93);
  v405 = (void (**)(char *, char *, uint64_t))((char *)v367 - v94);
  MEMORY[0x270FA5388](v95);
  v381 = (char *)v367 - v96;
  uint64_t v423 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CA8);
  MEMORY[0x270FA5388](v423);
  v393 = (void *)((char *)v367 - ((v97 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v98);
  v391 = (char *)v367 - v99;
  MEMORY[0x270FA5388](v100);
  uint64_t v390 = (uint64_t)v367 - v101;
  MEMORY[0x270FA5388](v102);
  v434 = (char *)v367 - v103;
  uint64_t v375 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416D18);
  MEMORY[0x270FA5388](v375);
  uint64_t v374 = (uint64_t)v367 - ((v104 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v105);
  uint64_t v429 = (uint64_t)v367 - v106;
  uint64_t v107 = sub_261B8CE88();
  double v108 = *(void (***)(char *, void (**)(void, void, void)))(v107 - 8);
  v446 = (void *)v107;
  v447 = (void (*)(char *, uint64_t, uint64_t))v108;
  MEMORY[0x270FA5388](v107);
  v389 = (char *)v367 - ((v109 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v110);
  v376 = (char *)v367 - v111;
  MEMORY[0x270FA5388](v112);
  v373 = (char *)v367 - v113;
  uint64_t v453 = sub_261B8A7E8();
  v450 = *(char **)(v453 - 8);
  MEMORY[0x270FA5388](v453);
  v115 = (char *)v367 - ((v114 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v385 = sub_261B54D94();
  v451 = v116;
  uint64_t v460 = 0;
  uint64_t v461 = 0xE000000000000000;
  sub_261B8F8C8();
  swift_bridgeObjectRelease();
  uint64_t v460 = 0xD000000000000018;
  uint64_t v461 = 0x8000000261BA3770;
  uint64_t v424 = a2;
  sub_261B54D94();
  sub_261B8F1C8();
  swift_bridgeObjectRelease();
  v117 = (__CFString *)sub_261B8F0B8();
  swift_bridgeObjectRelease();
  CFStringRef v118 = (const __CFString *)*MEMORY[0x263F3D140];
  CFPropertyListRef v119 = CFPreferencesCopyAppValue(v117, (CFStringRef)*MEMORY[0x263F3D140]);

  uint64_t v392 = 0;
  if (v119)
  {
    uint64_t v458 = (uint64_t)v119;
    int v120 = swift_dynamicCast();
    if (v120) {
      uint64_t v121 = v460;
    }
    else {
      uint64_t v121 = 0;
    }
    if (v120) {
      uint64_t v3 = v461;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v121 = 0;
  }
  uint64_t v460 = 0;
  uint64_t v461 = 0xE000000000000000;
  sub_261B8F8C8();
  swift_bridgeObjectRelease();
  uint64_t v460 = 0xD00000000000001ALL;
  uint64_t v461 = 0x8000000261BA3790;
  sub_261B54D94();
  sub_261B8F1C8();
  swift_bridgeObjectRelease();
  char v122 = (__CFString *)sub_261B8F0B8();
  swift_bridgeObjectRelease();
  CFPropertyListRef v123 = CFPreferencesCopyAppValue(v122, v118);

  if (!v123
    || ((v458 = (uint64_t)v123, (int v124 = swift_dynamicCast()) == 0) ? (v125 = 0) : (v125 = v460),
        !v124 ? (uint64_t v126 = 0) : (uint64_t v126 = v461),
        !v3 || !v126))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v460 = v121;
  uint64_t v461 = v3;
  uint64_t v458 = 44;
  unint64_t v459 = 0xE100000000000000;
  v452 = (char **)sub_261A029C4();
  uint64_t v127 = sub_261B8F738();
  swift_bridgeObjectRelease();
  int64_t v128 = *(void *)(v127 + 16);
  uint64_t v129 = MEMORY[0x263F8EE78];
  if (v128)
  {
    uint64_t v368 = v125;
    uint64_t v408 = v126;
    uint64_t v458 = MEMORY[0x263F8EE78];
    sub_261ACA408(0, v128, 0);
    v130 = (void (**)(char *, uint64_t))(v450 + 8);
    v367[1] = v127;
    v131 = (uint64_t *)(v127 + 40);
    do
    {
      uint64_t v132 = *v131;
      uint64_t v460 = *(v131 - 1);
      uint64_t v461 = v132;
      swift_bridgeObjectRetain();
      sub_261B8A7D8();
      uint64_t v133 = sub_261B8F778();
      uint64_t v135 = v134;
      (*v130)(v115, v453);
      swift_bridgeObjectRelease();
      v136 = (void *)v458;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_261ACA408(0, v136[2] + 1, 1);
        v136 = (void *)v458;
      }
      unint64_t v138 = v136[2];
      unint64_t v137 = v136[3];
      if (v138 >= v137 >> 1)
      {
        sub_261ACA408(v137 > 1, v138 + 1, 1);
        v136 = (void *)v458;
      }
      v131 += 2;
      v136[2] = v138 + 1;
      v139 = &v136[2 * v138];
      v139[4] = v133;
      v139[5] = v135;
      --v128;
    }
    while (v128);
    swift_bridgeObjectRelease();
    uint64_t v126 = v408;
    uint64_t v125 = v368;
    uint64_t v129 = MEMORY[0x263F8EE78];
  }
  else
  {
    swift_bridgeObjectRelease();
    v136 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v460 = v125;
  uint64_t v461 = v126;
  uint64_t v458 = 44;
  unint64_t v459 = 0xE100000000000000;
  uint64_t v140 = sub_261B8F738();
  swift_bridgeObjectRelease();
  int64_t v141 = *(void *)(v140 + 16);
  v142 = v432;
  if (v141)
  {
    uint64_t v458 = v129;
    sub_261ACA408(0, v141, 0);
    v143 = (void (**)(char *, uint64_t))(v450 + 8);
    v450 = (char *)v140;
    v144 = (uint64_t *)(v140 + 40);
    do
    {
      uint64_t v145 = *v144;
      uint64_t v460 = *(v144 - 1);
      uint64_t v461 = v145;
      swift_bridgeObjectRetain();
      sub_261B8A7D8();
      uint64_t v146 = sub_261B8F778();
      uint64_t v148 = v147;
      (*v143)(v115, v453);
      swift_bridgeObjectRelease();
      uint64_t v149 = v458;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_261ACA408(0, *(void *)(v149 + 16) + 1, 1);
        uint64_t v149 = v458;
      }
      unint64_t v151 = *(void *)(v149 + 16);
      unint64_t v150 = *(void *)(v149 + 24);
      if (v151 >= v150 >> 1)
      {
        sub_261ACA408(v150 > 1, v151 + 1, 1);
        uint64_t v149 = v458;
      }
      v144 += 2;
      *(void *)(v149 + 16) = v151 + 1;
      unint64_t v152 = v149 + 16 * v151;
      *(void *)(v152 + 32) = v146;
      *(void *)(v152 + 40) = v148;
      --v141;
      v142 = v432;
    }
    while (v141);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v149 = MEMORY[0x263F8EE78];
  }
  uint64_t v153 = v136[2];
  uint64_t v154 = MEMORY[0x263F8EE78];
  v155 = v433;
  if (!v153)
  {
    v164 = (char *)MEMORY[0x263F8EE78];
LABEL_102:
    swift_bridgeObjectRelease();
    uint64_t v276 = *((void *)v164 + 2);
    if (v276 == 29 && *(void *)(v149 + 16) == 29)
    {
      v277 = v155;
      uint64_t v408 = v149;
      v278 = v376;
      sub_261B8C618();
      unint64_t v279 = (unint64_t)v451;
      swift_bridgeObjectRetain();
      v280 = sub_261B8CE78();
      os_log_type_t v281 = sub_261B8F4D8();
      BOOL v282 = os_log_type_enabled(v280, v281);
      v407 = v164;
      uint64_t v283 = (uint64_t)v142;
      if (v282)
      {
        v284 = (uint8_t *)swift_slowAlloc();
        uint64_t v285 = swift_slowAlloc();
        uint64_t v460 = v285;
        *(_DWORD *)v284 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v458 = sub_261AC9C40(v385, v279, &v460);
        sub_261B8F6F8();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2619F0000, v280, v281, "Demo Data overriding acute and chronic values for %s on graph.", v284, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x263E4E970](v285, -1, -1);
        MEMORY[0x263E4E970](v284, -1, -1);

        (*((void (**)(char *, void *))v447 + 1))(v376, (void (**)(char *, uint64_t, uint64_t))v446);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*((void (**)(char *, void *))v447 + 1))(v278, (void (**)(char *, uint64_t, uint64_t))v446);
      }
      v294 = v435;
      uint64_t v295 = (uint64_t)v444;
      uint64_t v458 = v154;
      uint64_t v296 = (uint64_t)v434;
      sub_261B8C9A8();
      uint64_t v297 = (uint64_t)(v277 + 2);
      uint64_t v298 = v455;
      v447 = (void (*)(char *, uint64_t, uint64_t))v277[2];
      v447(v294, v296, v455);
      sub_2619F8754(v296, &qword_26B416CA8);
      v299 = v396;
      sub_261B8EE68();
      sub_261B8EE88();
      v300 = (void (*)(char *, uint64_t))v277[1];
      v300(v299, v298);
      v450 = (char *)v300;
      v451 = (void (*)(void, void, void))(v277 + 1);
      v300(v294, v298);
      uint64_t v301 = (uint64_t)v371;
      sub_261B8C9A8();
      uint64_t v302 = v370;
      sub_2619F86F0(v301, v370, &qword_26B416CA8);
      v304 = (char **)v277[7];
      v303 = v277 + 7;
      uint64_t v305 = (uint64_t)v381;
      v452 = v304;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v304)(v381, 1, 1, v298);
      sub_2619F8754(v301, &qword_26B416CA8);
      uint64_t v306 = v372;
      sub_2619FB7EC(v305, v302 + *(int *)(v372 + 36), &qword_26B416C98);
      sub_2619FB7EC(v302, v295, &qword_26B416D20);
      uint64_t v453 = v295 + *(int *)(v306 + 36);
      v434 = (char *)(v303 - 1);
      v446 = v303 - 3;
      v406 = (void (**)(char *, char *, uint64_t))(v382 + 16);
      v405 = (void (**)(char *, char *, uint64_t))(v383 + 16);
      v404 = (char *)(v384 + 16);
      v403 = (uint64_t (**)(char *, uint64_t))(v384 + 88);
      LODWORD(v436) = *MEMORY[0x263F42C50];
      v395 = (void (**)(char *, uint64_t))(v384 + 96);
      v394 = (void (**)(char *, uint64_t))(v384 + 8);
      v402 = (char *)(v388 + 32);
      v401 = (void (**)(char *, uint64_t))(v383 + 8);
      v400 = (void (**)(char *, uint64_t))(v382 + 8);
      uint64_t v449 = 464;
      uint64_t v448 = 32;
      uint64_t v429 = v297;
      uint64_t v307 = v295;
      v433 = v303;
      while (1)
      {
        uint64_t v311 = v445;
        v447((char *)v445, v307, v298);
        ((void (*)(uint64_t, void, uint64_t, uint64_t))v452)(v311, 0, 1, v298);
        v312 = v430;
        uint64_t v313 = (uint64_t)v430 + *(int *)(v428 + 48);
        sub_2619F86F0(v453, (uint64_t)v430, &qword_26B416C98);
        sub_2619F86F0(v311, v313, &qword_26B416C98);
        v314 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))v434;
        if ((*(unsigned int (**)(void (**)(char *, uint64_t), uint64_t, uint64_t))v434)((void (**)(char *, uint64_t))v312, 1, v298) == 1)break; {
        sub_2619F86F0((uint64_t)v312, v283, &qword_26B416C98);
        }
        if (v314(v313, 1, v298) == 1)
        {
          ((void (*)(uint64_t, uint64_t))v450)(v283, v298);
LABEL_119:
          sub_2619F8754((uint64_t)v312, &qword_26B416CA0);
          sub_2619F8754(v445, &qword_26B416C98);
          goto LABEL_121;
        }
        v315 = (void (*)(char *, uint64_t, uint64_t))*v446;
        v316 = v435;
        ((void (*)(char *, uint64_t, uint64_t))*v446)(v435, v283, v298);
        v317 = v396;
        v315(v396, v313, v298);
        sub_261B598B0(&qword_26B416C10);
        char v318 = sub_261B8F0A8();
        v319 = (void (*)(char *, uint64_t))v450;
        ((void (*)(char *, uint64_t))v450)(v317, v298);
        v319(v316, v298);
        sub_2619F8754((uint64_t)v430, &qword_26B416C98);
        sub_2619F8754(v445, &qword_26B416C98);
        if (v318) {
          goto LABEL_157;
        }
LABEL_121:
        uint64_t v320 = v416;
        sub_2619F86F0(v453, v416, &qword_26B416C98);
        if (v314(v320, 1, v298) == 1)
        {
          v321 = (char *)v444 + *(int *)(v423 + 36);
          sub_261B598B0(&qword_26B416C08);
          if ((sub_261B8F078() & 1) == 0)
          {
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
            JUMPOUT(0x261B594E4);
          }
          uint64_t v322 = (uint64_t)v414;
          v447((char *)v414, (uint64_t)v321, v298);
          v323 = v435;
        }
        else
        {
          v323 = v435;
          ((void (*)(char *, uint64_t, uint64_t))*v446)(v435, v320, v298);
          sub_261B598B0(&qword_26B416C08);
          if ((sub_261B8F058() & 1) == 0) {
            goto LABEL_159;
          }
          uint64_t v460 = -1;
          sub_261B598B0(&qword_26B416C18);
          uint64_t v322 = (uint64_t)v414;
          sub_261B8F718();
          ((void (*)(char *, uint64_t))v450)(v323, v298);
        }
        ((void (*)(uint64_t, void, uint64_t, uint64_t))v452)(v322, 0, 1, v298);
        uint64_t v324 = v453;
        sub_2619F8754(v453, &qword_26B416C98);
        sub_2619FB7EC(v322, v324, &qword_26B416C98);
        v325 = v415;
        sub_2619F86F0(v324, (uint64_t)v415, &qword_26B416C98);
        unsigned int v326 = v314((uint64_t)v325, 1, v298);
        v327 = v441;
        if (v326 == 1) {
          goto LABEL_162;
        }
        v328 = (void (*)(void (**)(char *, uint64_t), void (**)(char *, uint64_t), uint64_t))*v446;
        v329 = v413;
        ((void (*)(void (**)(char *, uint64_t), void (**)(char *, uint64_t), uint64_t))*v446)(v413, v325, v298);
        v312 = v412;
        v328(v412, v329, v298);
        v328((void (**)(char *, uint64_t))v327, (void (**)(char *, uint64_t))v312, v298);
        id v330 = objc_msgSend(self, sel_appleEffortScoreUnit);
        uint64_t v331 = v449;
        if (!v449)
        {
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          sub_2619F8754((uint64_t)v312, &qword_26B416C98);
          uint64_t v298 = v455;
          sub_2619F8754(v445, &qword_26B416C98);
LABEL_157:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_2619F8754((uint64_t)v444, &qword_26B416D20);
          ((void (*)(char *, uint64_t))v450)(v431, v298);
          return (char *)v458;
        }
        unint64_t v332 = v448 - 4;
        if ((unint64_t)(v448 - 4) >= *((void *)v407 + 2)) {
          goto LABEL_153;
        }
        v333 = v330;
        v312 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v330, *(double *)&v407[8 * v448]);

        sub_261B8CA38();
        if (v332 >= *(void *)(v408 + 16)) {
          goto LABEL_154;
        }
        uint64_t v335 = *(void *)(v408 + v331 + 16);
        uint64_t v334 = *(void *)(v408 + v331 + 24);
        if (v335 == 0x617461446F6ELL && v334 == 0xE600000000000000 || (sub_261B8FBA8() & 1) != 0)
        {
          v312 = v447;
          v447(v323, (uint64_t)v327, v298);
          v336 = v399;
          ((void (*)(char *, char **, uint64_t))v312)(v399, v327, v298);
          ((void (*)(char *, void, uint64_t, uint64_t))v452)(v336, 0, 1, v298);
          sub_261B8CA68();
          v337 = v431;
        }
        else
        {
          v338 = (void (*)(char *, char *, uint64_t))v447;
          v447(v398, (uint64_t)v327, v298);
          v339 = v397;
          v338(v397, v431, v298);
          uint64_t v340 = ((uint64_t (*)(char *, void, uint64_t, uint64_t))v452)(v339, 0, 1, v298);
          uint64_t v457 = 0;
          MEMORY[0x270FA5388](v340);
          v367[-2] = &v457;
          if ((v334 & 0x1000000000000000) != 0 || !(v334 & 0x2000000000000000 | v335 & 0x1000000000000000))
          {
            swift_bridgeObjectRetain();
            uint64_t v365 = v392;
            sub_261B8F8A8();
            uint64_t v392 = v365;
            swift_bridgeObjectRelease();
            v337 = v431;
            v312 = v447;
          }
          else
          {
            v393 = v367;
            MEMORY[0x270FA5388](v341);
            v367[-2] = sub_261B597E4;
            v367[-1] = &v367[-4];
            if (v343)
            {
              uint64_t v460 = v335;
              uint64_t v461 = v334 & 0xFFFFFFFFFFFFFFLL;
              swift_bridgeObjectRetain();
              v337 = v431;
              BOOL v350 = (v335 >= 0x21u || ((0x100003E01uLL >> v335) & 1) == 0)
                  && (v349 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
                  && *v349 == 0;
              v312 = v447;
              char v456 = v350;
              swift_bridgeObjectRelease();
            }
            else
            {
              if (v342)
              {
                uint64_t v344 = (v334 & 0xFFFFFFFFFFFFFFFLL) + 32;
                uint64_t v345 = v335 & 0xFFFFFFFFFFFFLL;
              }
              else
              {
                uint64_t v344 = sub_261B8F928();
                uint64_t v345 = v366;
              }
              swift_bridgeObjectRetain();
              uint64_t v346 = v345;
              uint64_t v347 = v392;
              char v348 = sub_261B558C0(v344, v346, (void (*)(uint64_t *__return_ptr))sub_261B5986C);
              uint64_t v392 = v347;
              char v456 = v348 & 1;
              swift_bridgeObjectRelease();
              v337 = v431;
              v312 = v447;
            }
          }
          sub_261B8CA68();
        }
        ((void (*)(char *, char **, uint64_t))v312)(v439, v327, v298);
        sub_261B598B0(&qword_26B416C08);
        if ((sub_261B8F088() & 1) == 0) {
          goto LABEL_155;
        }
        uint64_t v351 = v427;
        v352 = v425;
        v353 = &v425[*(int *)(v427 + 48)];
        ((void (*)(char *, char *, uint64_t))v312)(v425, v337, v298);
        ((void (*)(char *, char **, uint64_t))v312)(v353, v327, v298);
        v354 = v426;
        v355 = &v426[*(int *)(v351 + 48)];
        ((void (*)(char *, char *, uint64_t))v312)(v426, v352, v455);
        ((void (*)(char *, char *, uint64_t))v312)(v355, v353, v455);
        uint64_t v356 = (uint64_t)v420;
        v328((void (**)(char *, uint64_t))v420, (void (**)(char *, uint64_t))v354, v455);
        v357 = v355;
        v358 = (void (*)(char *, uint64_t))v450;
        ((void (*)(char *, uint64_t))v450)(v357, v455);
        v359 = &v354[*(int *)(v351 + 48)];
        v360 = v352;
        v361 = v440;
        v328((void (**)(char *, uint64_t))v354, (void (**)(char *, uint64_t))v360, v455);
        v328((void (**)(char *, uint64_t))v359, (void (**)(char *, uint64_t))v353, v455);
        v328((void (**)(char *, uint64_t))(v356 + *(int *)(v421 + 36)), (void (**)(char *, uint64_t))v359, v455);
        uint64_t v362 = v422;
        v363 = v354;
        uint64_t v298 = v455;
        v358(v363, v455);
        sub_2619FB7EC(v356, (uint64_t)v437, &qword_26B416CE8);
        (*v406)(v417, v454, v442);
        (*v405)(v418, v361, v443);
        sub_261B8CB08();
        v364 = v410;
        (*(void (**)(char *, uint64_t, uint64_t))v404)(v410, v424, v362);
        LODWORD(v353) = (*v403)(v364, v362);
        if (v353 == v436) {
          (*v395)(v364, v362);
        }
        else {
          (*v394)(v364, v362);
        }
        uint64_t v283 = (uint64_t)v432;
        uint64_t v308 = v449;
        v309 = v409;
        sub_261B8CAB8();
        uint64_t v310 = (uint64_t)v411;
        (*(void (**)(char *, char *, uint64_t))v402)(v411, v309, v419);
        sub_261B28858(0, 0, v310);
        (*v401)(v361, v443);
        (*v400)(v454, v442);
        ((void (*)(char **, uint64_t))v450)(v441, v298);
        --v448;
        uint64_t v449 = v308 - 16;
        uint64_t v307 = (uint64_t)v444;
      }
      if (v314(v313, 1, v298) == 1) {
        goto LABEL_156;
      }
      goto LABEL_119;
    }
    v286 = v389;
    sub_261B8C618();
    unint64_t v287 = (unint64_t)v451;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v288 = v149;
    v289 = sub_261B8CE78();
    os_log_type_t v290 = sub_261B8F4B8();
    if (os_log_type_enabled(v289, v290))
    {
      uint64_t v291 = swift_slowAlloc();
      uint64_t v292 = swift_slowAlloc();
      uint64_t v460 = v292;
      *(_DWORD *)uint64_t v291 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v458 = sub_261AC9C40(v385, v287, &v460);
      sub_261B8F6F8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v291 + 12) = 2048;
      swift_bridgeObjectRelease();
      uint64_t v458 = v276;
      sub_261B8F6F8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v291 + 22) = 2048;
      uint64_t v293 = *(void *)(v288 + 16);
      swift_bridgeObjectRelease();
      uint64_t v458 = v293;
      sub_261B8F6F8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2619F0000, v289, v290, "Demo Data for %s was invalid - expected 29 comma-separated doubles, ended up with %ld acute and %ld chronic", (uint8_t *)v291, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x263E4E970](v292, -1, -1);
      MEMORY[0x263E4E970](v291, -1, -1);

      (*((void (**)(char *, void *))v447 + 1))(v389, (void (**)(char *, uint64_t, uint64_t))v446);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*((void (**)(char *, void *))v447 + 1))(v286, (void (**)(char *, uint64_t, uint64_t))v446);
    }
    return 0;
  }
  uint64_t v408 = v149;
  if (v153 != 1)
  {
LABEL_80:
    uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRetain();
    v265 = v136 + 5;
    v164 = (char *)MEMORY[0x263F8EE78];
    while (1)
    {
      v266 = v164;
      uint64_t v267 = *(v265 - 1);
      uint64_t v268 = *v265;
      uint64_t v458 = 0;
      MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
      v367[-2] = &v458;
      if ((v268 & 0x1000000000000000) == 0)
      {
        if ((v268 & 0x2000000000000000) != 0)
        {
          uint64_t v460 = v267;
          uint64_t v461 = v268 & 0xFFFFFFFFFFFFFFLL;
          switch((char)v267)
          {
            case 0:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 32:
LABEL_90:
              swift_bridgeObjectRetain();
              goto LABEL_91;
            default:
              swift_bridgeObjectRetain();
              v269 = (unsigned char *)_swift_stdlib_strtod_clocale();
              if (v269) {
LABEL_99:
              }
                BOOL v270 = *v269 == 0;
              else {
LABEL_91:
              }
                BOOL v270 = 0;
              v164 = v266;
              LOBYTE(v457) = v270;
              uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
              break;
          }
          goto LABEL_93;
        }
        if ((v267 & 0x1000000000000000) != 0)
        {
          switch(*(unsigned char *)((v268 & 0xFFFFFFFFFFFFFFFLL) + 0x20))
          {
            case 0:
            case 9:
            case 0xA:
            case 0xB:
            case 0xC:
            case 0xD:
            case 0x20:
              goto LABEL_90;
            default:
              swift_bridgeObjectRetain();
              v269 = (unsigned char *)_swift_stdlib_strtod_clocale();
              if (!v269) {
                goto LABEL_91;
              }
              goto LABEL_99;
          }
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v275 = v392;
      sub_261B8F8A8();
      uint64_t v392 = v275;
      uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
      v164 = v266;
LABEL_93:
      if (v457)
      {
        uint64_t v271 = v458;
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_261A0AF84(0, *((void *)v164 + 2) + 1, 1, v164);
          v164 = (char *)isUniquelyReferenced_nonNull_native;
        }
        unint64_t v273 = *((void *)v164 + 2);
        unint64_t v272 = *((void *)v164 + 3);
        v274 = v164;
        if (v273 >= v272 >> 1)
        {
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_261A0AF84((void *)(v272 > 1), v273 + 1, 1, v164);
          v274 = (char *)isUniquelyReferenced_nonNull_native;
        }
        *((void *)v274 + 2) = v273 + 1;
        v164 = v274;
        *(void *)&v274[8 * v273 + 32] = v271;
      }
      v265 += 2;
      if (!--v153)
      {
        swift_bridgeObjectRelease();
        v142 = v432;
        uint64_t v149 = v408;
        uint64_t v154 = MEMORY[0x263F8EE78];
        goto LABEL_102;
      }
    }
  }
  uint64_t v156 = v136[4];
  uint64_t v157 = v136[5];
  if ((v156 != 0x676E69646E6570 || v157 != 0xE700000000000000) && (sub_261B8FBA8() & 1) == 0)
  {
    if (v156 == 0x617461446F6ELL && v157 == 0xE600000000000000 || (sub_261B8FBA8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (char *)MEMORY[0x263F8EE78];
    }
    goto LABEL_80;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v158 = v373;
  sub_261B8C618();
  unint64_t v159 = (unint64_t)v451;
  swift_bridgeObjectRetain();
  v160 = sub_261B8CE78();
  os_log_type_t v161 = sub_261B8F4D8();
  if (os_log_type_enabled(v160, v161))
  {
    v162 = (uint8_t *)swift_slowAlloc();
    uint64_t v163 = swift_slowAlloc();
    uint64_t v460 = v163;
    *(_DWORD *)v162 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v458 = sub_261AC9C40(v385, v159, &v460);
    sub_261B8F6F8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2619F0000, v160, v161, "Demo Data overriding acute and chronic values for %s on graph to pending.", v162, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E4E970](v163, -1, -1);
    MEMORY[0x263E4E970](v162, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*((void (**)(char *, void *))v447 + 1))(v158, (void (**)(char *, uint64_t, uint64_t))v446);
  uint64_t v165 = (uint64_t)v407;
  uint64_t v166 = (uint64_t)v434;
  sub_261B8C9A8();
  uint64_t v167 = v374;
  sub_2619F86F0(v166, v374, &qword_26B416CA8);
  v168 = v433;
  v169 = (void (*)(void, void, void))v433[2];
  uint64_t v170 = (uint64_t)v381;
  uint64_t v171 = v455;
  v446 = v433 + 2;
  v451 = v169;
  v169(v381, v166, v455);
  v172 = (void (**)(char *, void (**)(void, void, void)))v168[7];
  v168 += 7;
  v447 = (void (*)(char *, uint64_t, uint64_t))v172;
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v172)(v170, 0, 1, v171);
  sub_2619F8754(v166, &qword_26B416CA8);
  uint64_t v173 = v375;
  sub_2619FB7EC(v170, v167 + *(int *)(v375 + 36), &qword_26B416C98);
  uint64_t v174 = v429;
  sub_2619FB7EC(v167, v429, &qword_26B416D18);
  v445 = v174 + *(int *)(v173 + 36);
  v175 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v168 - 1);
  v433 = v168;
  v441 = (char **)(v168 - 6);
  v437 = (void (**)(char *, char *, uint64_t))(v382 + 16);
  v432 = (void (**)(char *, char *, uint64_t))(v383 + 16);
  v431 = (char *)(v384 + 16);
  v430 = (uint64_t (**)(char *, uint64_t))(v384 + 88);
  LODWORD(v438) = *MEMORY[0x263F42C50];
  v413 = (void (**)(char *, uint64_t))(v384 + 96);
  v412 = (void (**)(char *, uint64_t))(v384 + 8);
  uint64_t v416 = v388 + 32;
  v415 = (void (**)(char *, uint64_t))(v383 + 8);
  v414 = (void (**)(char *, uint64_t))(v382 + 8);
  v439 = (char *)MEMORY[0x263F8EE78];
  v444 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v168 - 1);
  uint64_t v176 = (uint64_t)v405;
  v452 = (char **)(v168 - 3);
LABEL_48:
  uint64_t v177 = (uint64_t)v406;
  while (1)
  {
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v447)(v176, 1, 1, v171);
    uint64_t v180 = v165 + *(int *)(v428 + 48);
    sub_2619F86F0(v445, v165, &qword_26B416C98);
    sub_2619F86F0(v176, v180, &qword_26B416C98);
    v181 = *v175;
    if ((*v175)(v165, 1, v171) == 1) {
      break;
    }
    sub_2619F86F0(v165, v177, &qword_26B416C98);
    if (v181(v180, 1, v171) == 1)
    {
      ((void (*)(uint64_t, uint64_t))*v441)(v177, v171);
      goto LABEL_56;
    }
    v182 = (void (*)(char *, uint64_t, uint64_t))*v452;
    v183 = v435;
    ((void (*)(char *, uint64_t, uint64_t))*v452)(v435, v177, v171);
    v184 = v396;
    v182(v396, v180, v171);
    sub_261B598B0(&qword_26B416C10);
    char v185 = sub_261B8F0A8();
    v186 = (void (*)(uint64_t, uint64_t))*v441;
    ((void (*)(char *, uint64_t))*v441)(v184, v171);
    v186((uint64_t)v183, v171);
    sub_2619F8754(v165, &qword_26B416C98);
    sub_2619F8754(v176, &qword_26B416C98);
    if (v185) {
      goto LABEL_75;
    }
LABEL_58:
    uint64_t v187 = v445;
    v188 = v403;
    sub_2619F86F0(v445, (uint64_t)v403, &qword_26B416C98);
    if (v181((uint64_t)v188, 1, v171) == 1) {
      goto LABEL_163;
    }
    v189 = (void (*)(uint64_t, char *, uint64_t))*v452;
    v190 = v402;
    ((void (*)(char *, uint64_t (**)(char *, uint64_t), uint64_t))*v452)(v402, v188, v171);
    v189(v448, v190, v171);
    v191 = v401;
    sub_2619F86F0(v187, (uint64_t)v401, &qword_26B416C98);
    unsigned int v192 = v181((uint64_t)v191, 1, v171);
    v193 = v396;
    if (v192 == 1) {
      goto LABEL_164;
    }
    v194 = v400;
    v189((uint64_t)v400, (char *)v191, v171);
    sub_261B598B0(&qword_26B416C10);
    char v195 = sub_261B8F0A8();
    uint64_t v453 = (unint64_t)v441 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v196 = (void (*)(uint64_t, uint64_t, uint64_t))v189;
    uint64_t v197 = (uint64_t)v395;
    if (v195)
    {
      v454 = *v441;
      ((void (*)(void, uint64_t))v454)(v194, v171);
      uint64_t v198 = 1;
    }
    else
    {
      uint64_t v460 = 1;
      v199 = v441;
      sub_261B598B0(&qword_26B416C18);
      sub_261B8F718();
      v454 = *v199;
      ((void (*)(void, uint64_t))v454)(v194, v171);
      v196 = (void (*)(uint64_t, uint64_t, uint64_t))v189;
      uint64_t v198 = 0;
    }
    v200 = (void (*)(uint64_t, void, uint64_t, uint64_t))v447;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v447)(v197, v198, 1, v171);
    sub_2619F8754(v187, &qword_26B416C98);
    sub_2619FB7EC(v197, v187, &qword_26B416C98);
    uint64_t v201 = v448;
    v200(v448, 0, 1, v171);
    v196(v449, v201, v171);
    uint64_t v202 = (uint64_t)v434;
    sub_261B8C9A8();
    uint64_t v203 = v423;
    v204 = (void (*)(char *, uint64_t, uint64_t))v451;
    v451(v193, v202 + *(int *)(v423 + 36), v171);
    sub_2619F8754(v202, &qword_26B416CA8);
    v205 = (void (*)(char *, char *, uint64_t))v196;
    v206 = v404;
    sub_261B8EE68();
    sub_261B8EE88();
    v207 = v454;
    ((void (*)(char *, uint64_t))v454)(v206, v171);
    ((void (*)(char *, uint64_t))v207)(v193, v171);
    sub_261B8C9A8();
    v204(v193, v202 + *(int *)(v203 + 36), v171);
    uint64_t v208 = v202;
    v209 = v435;
    sub_2619F8754(v208, &qword_26B416CA8);
    v450 = (char *)sub_261B598B0(&qword_26B416C08);
    if ((sub_261B8F088() & 1) == 0) {
      goto LABEL_160;
    }
    uint64_t v210 = v427;
    v211 = v193;
    v212 = v425;
    v213 = &v425[*(int *)(v427 + 48)];
    v205(v425, v209, v171);
    v205(v213, v211, v171);
    v214 = v426;
    v215 = &v426[*(int *)(v210 + 48)];
    v216 = (void (*)(char *, char *, uint64_t))v451;
    v451(v426, v212, v455);
    v216(v215, v213, v455);
    v217 = v391;
    v205(v391, v214, v455);
    v218 = v454;
    ((void (*)(char *, uint64_t))v454)(v215, v455);
    v219 = &v214[*(int *)(v210 + 48)];
    v205(v214, v212, v455);
    v205(v219, v213, v455);
    v220 = &v217[*(int *)(v423 + 36)];
    v221 = v219;
    uint64_t v222 = v453;
    v440 = (char *)v205;
    v205(v220, v221, v455);
    v223 = v214;
    uint64_t v171 = v455;
    ((void (*)(char *, uint64_t))v218)(v223, v455);
    uint64_t v224 = (uint64_t)v217;
    uint64_t v225 = v390;
    sub_2619FB7EC(v224, v390, &qword_26B416CA8);
    uint64_t v226 = v449;
    LOBYTE(v213) = sub_261B8F078();
    v227 = v394;
    v451(v394, v226, v171);
    uint64_t v228 = (uint64_t)v393;
    sub_2619F86F0(v225, (uint64_t)v393, &qword_26B416CA8);
    if (v213)
    {
      char v229 = sub_261B8F088();
      sub_2619F8754(v228, &qword_26B416CA8);
      v230 = v227;
      v231 = v454;
      ((void (*)(void, uint64_t))v454)(v230, v171);
      sub_2619F8754(v225, &qword_26B416CA8);
      v179 = v231;
      if (v229)
      {
        id v232 = objc_msgSend(self, sel_appleEffortScoreUnit);
        id v233 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v232, 5.0);
        uint64_t v234 = v222;

        sub_261B8CA38();
        v454 = v231;
        v235 = (void (*)(char *, uint64_t, uint64_t))v451;
        v451(v435, v449, v171);
        uint64_t v236 = (uint64_t)v434;
        sub_261B8C9A8();
        v237 = v396;
        v235(v396, v236 + *(int *)(v423 + 36), v171);
        sub_2619F8754(v236, &qword_26B416CA8);
        v238 = v404;
        sub_261B8EE68();
        v239 = v399;
        sub_261B8EE88();
        uint64_t v453 = v234;
        v240 = v454;
        ((void (*)(char *, uint64_t))v454)(v238, v171);
        ((void (*)(char *, uint64_t))v240)(v237, v171);
        ((void (*)(char *, void, uint64_t, uint64_t))v447)(v239, 0, 1, v171);
        v241 = v435;
        sub_261B8CA68();
        v235(v380, v449, v171);
        sub_261B8C9A8();
        v235(v237, v236, v171);
        uint64_t v242 = v449;
        sub_2619F8754(v236, &qword_26B416CA8);
        sub_261B8EE68();
        sub_261B8EE88();
        v243 = v454;
        ((void (*)(char *, uint64_t))v454)(v238, v171);
        ((void (*)(char *, uint64_t))v243)(v237, v171);
        v244 = v241;
        if ((sub_261B8F088() & 1) == 0) {
          goto LABEL_161;
        }
        uint64_t v245 = v427;
        v246 = v425;
        v247 = &v425[*(int *)(v427 + 48)];
        v248 = (void (*)(char *, char *, uint64_t))v440;
        ((void (*)(char *, char *, uint64_t))v440)(v425, v244, v171);
        v450 = v247;
        v235(v247, v242, v171);
        v249 = v426;
        v250 = &v426[*(int *)(v245 + 48)];
        v235(v426, (uint64_t)v246, v455);
        v235(v250, (uint64_t)v247, v455);
        uint64_t v251 = (uint64_t)v420;
        v248(v420, v249, v455);
        v252 = v454;
        ((void (*)(char *, uint64_t))v454)(v250, v455);
        v253 = &v249[*(int *)(v245 + 48)];
        v248(v249, v246, v455);
        v248(v253, v450, v455);
        v248((char *)(v251 + *(int *)(v421 + 36)), v253, v455);
        v254 = v249;
        uint64_t v171 = v455;
        ((void (*)(char *, uint64_t))v252)(v254, v455);
        sub_2619FB7EC(v251, v378, &qword_26B416CE8);
        (*v437)(v417, v386, v442);
        (*v432)(v418, v387, v443);
        sub_261B8CB08();
        v255 = v369;
        uint64_t v256 = v422;
        (*(void (**)(char *, uint64_t, uint64_t))v431)(v369, v424, v422);
        LODWORD(v248) = (*v430)(v255, v256);
        unint64_t v257 = (unint64_t)v439;
        if (v248 == v438) {
          (*v413)(v255, v256);
        }
        else {
          (*v412)(v255, v256);
        }
        uint64_t v176 = (uint64_t)v405;
        sub_261B8CAB8();
        char v258 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v259 = v449;
        v175 = v444;
        if ((v258 & 1) == 0) {
          unint64_t v257 = sub_261A0B728(0, *(void *)(v257 + 16) + 1, 1, v257);
        }
        unint64_t v261 = *(void *)(v257 + 16);
        unint64_t v260 = *(void *)(v257 + 24);
        if (v261 >= v260 >> 1) {
          unint64_t v257 = sub_261A0B728(v260 > 1, v261 + 1, 1, v257);
        }
        *(void *)(v257 + 16) = v261 + 1;
        unint64_t v262 = (*(unsigned __int8 *)(v388 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v388 + 80);
        v439 = (char *)v257;
        (*(void (**)(unint64_t, char *, uint64_t))(v388 + 32))(v257 + v262 + *(void *)(v388 + 72) * v261, v377, v419);
        (*v415)(v387, v443);
        (*v414)(v386, v442);
        ((void (*)(uint64_t, uint64_t))v454)(v259, v171);
        uint64_t v165 = (uint64_t)v407;
        goto LABEL_48;
      }
    }
    else
    {
      sub_2619F8754(v228, &qword_26B416CA8);
      v178 = v454;
      ((void (*)(void, uint64_t))v454)(v227, v171);
      sub_2619F8754(v225, &qword_26B416CA8);
      v179 = v178;
    }
    ((void (*)(uint64_t, uint64_t))v179)(v226, v171);
    uint64_t v165 = (uint64_t)v407;
    uint64_t v176 = (uint64_t)v405;
    uint64_t v177 = (uint64_t)v406;
    v175 = v444;
  }
  if (v181(v180, 1, v171) != 1)
  {
LABEL_56:
    sub_2619F8754(v165, &qword_26B416CA0);
    sub_2619F8754(v176, &qword_26B416C98);
    goto LABEL_58;
  }
  sub_2619F8754(v165, &qword_26B416C98);
  uint64_t v171 = v455;
  sub_2619F8754(v176, &qword_26B416C98);
LABEL_75:
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v447)(v448, 1, 1, v171);
  sub_2619F8754(v429, &qword_26B416D18);
  return v439;
}

void sub_261B595EC(void *a1@<X8>)
{
  DemoWorkout.workoutRepresentation(startingDate:)(*(void *)(v1 + 16));
  *a1 = v3;
}

unint64_t sub_261B59670()
{
  unint64_t result = qword_26A948390;
  if (!qword_26A948390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948390);
  }
  return result;
}

uint64_t sub_261B596C4(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A943660);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for DemoUtilities()
{
  return &type metadata for DemoUtilities;
}

uint64_t getEnumTagSinglePayload for DemoUtilities.DemoError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DemoUtilities.DemoError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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

uint64_t sub_261B59794(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_261B597B0(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 1;
  }
  else
  {
    *(unsigned char *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DemoUtilities.DemoError()
{
  return &type metadata for DemoUtilities.DemoError;
}

unsigned char *sub_261B597E4@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_261B597FC(a1, a2);
}

unsigned char *sub_261B597FC@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (uint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_261B5986C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_261B598B0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_261B8EEC8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_261B598F4()
{
  unint64_t result = qword_26A9437A8;
  if (!qword_26A9437A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A9437A8);
  }
  return result;
}

uint64_t sub_261B59934()
{
  uint64_t v0 = sub_261B8F558();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unsigned int v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_261B8F538();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_261B8ED98();
  MEMORY[0x270FA5388](v5 - 8);
  sub_261A0CCCC(0, (unint64_t *)&qword_26B416D00);
  sub_261B8ED88();
  v7[1] = MEMORY[0x263F8EE78];
  sub_261B5F1F0(&qword_26B416CF8, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CC0);
  sub_261B156AC(&qword_26B416CC8, &qword_26B416CC0);
  sub_261B8F7E8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  uint64_t result = sub_261B8F598();
  qword_26A948398 = result;
  return result;
}

unint64_t EffortUtilities.OvernightVitalsState.init(rawValue:)@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2 = 4;
  if (result < 4) {
    char v2 = result;
  }
  *a2 = v2;
  return result;
}

uint64_t EffortUtilities.OvernightVitalsState.rawValue.getter()
{
  return *v0;
}

unint64_t sub_261B59BA0@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  return EffortUtilities.OvernightVitalsState.init(rawValue:)(*a1, a2);
}

void sub_261B59BA8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t static EffortUtilities.analyticsTaskIdentifier(workoutActivity:)(void *a1)
{
  uint64_t v2 = sub_261B8AE38();
  uint64_t v3 = *(void *)(v2 - 8);
  double v4 = MEMORY[0x270FA5388](v2);
  BOOL v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(a1, sel_UUID, v4);
  sub_261B8AE18();

  sub_261B8ADE8();
  v10[0] = 0xD000000000000016;
  v10[1] = 0x8000000261BA3840;
  sub_261B8F1C8();
  swift_bridgeObjectRelease();
  uint64_t v8 = v10[0];
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return v8;
}

uint64_t static EffortUtilities.sendPostWorkoutAnalytics(workout:perceivedEffortQuantity:estimatedEffortQuantity:healthStore:)(void *a1, void *a2, void *a3, void *a4)
{
  id v8 = objc_msgSend(a1, sel_workoutActivityType);
  char IsIndoor = _HKWorkoutIsIndoor(a1);
  id v10 = a3;
  id v11 = a2;
  v15[0] = 0xD000000000000025;
  v15[1] = 0x8000000261BA3860;
  v15[2] = v8;
  char v16 = IsIndoor;
  uint64_t v17 = a2;
  uint64_t v18 = a3;
  unint64_t v19 = sub_261AC5700(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRetain();
  id v12 = v11;
  id v13 = v10;
  swift_bridgeObjectRetain();
  sub_261B5CA2C((uint64_t)v15);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  _s9WorkoutUI15EffortUtilitiesC32_sendLoadAndVitalsAnalyticsEvent11healthStoreySo08HKHealthL0C_tFZ_0(a4);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t static EffortUtilities.sendUpdatedEffortAnalyticsEvent(workout:workoutActivity:perceivedEffortQuantity:estimatedEffortQuantity:)(void *a1, void *a2, void *a3, void *a4)
{
  id v8 = a4;
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  sub_261B5E150(v9, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)v13);
  sub_261B5CD6C((uint64_t)v13);
  return sub_261B5E2B8((uint64_t)v13);
}

uint64_t static EffortUtilities.sendDidDeeplinktoVitalsAnalyticsEvent(source:vitalsState:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v4 = sub_261B8CE88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v8 = *a1;
  int v9 = *a2;
  if (v8 == 3)
  {
    int v10 = 0;
    goto LABEL_5;
  }
  if (v8 == 4)
  {
    int v10 = 1;
LABEL_5:
    return sub_261B5D0AC(0xD00000000000002CLL, 0x8000000261BA3890, v10 | (v9 << 8));
  }
  sub_261B8C618();
  id v12 = sub_261B8CE78();
  os_log_type_t v13 = sub_261B8F4B8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v20 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    unint64_t v16 = 0xE600000000000000;
    uint64_t v17 = 0x736C61746976;
    switch(v8)
    {
      case 1:
        uint64_t v17 = 0xD000000000000015;
        uint64_t v18 = "watchSmartStackWidget";
        goto LABEL_12;
      case 2:
        uint64_t v17 = 0xD00000000000001FLL;
        uint64_t v18 = "watchAccessoryRectangularWidget";
LABEL_12:
        unint64_t v16 = (unint64_t)(v18 - 32) | 0x8000000000000000;
        break;
      case 3:
      case 4:
        __break(1u);
        JUMPOUT(0x261B5A6A4);
      case 5:
        unint64_t v16 = 0x8000000261B9D470;
        uint64_t v17 = 0xD000000000000014;
        break;
      default:
        break;
    }
    uint64_t v19 = sub_261AC9C40(v17, v16, &v20);
    sub_261B8F6F8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2619F0000, v12, v13, "Unexpected source for deeplink analytics event: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E4E970](v15, -1, -1);
    MEMORY[0x263E4E970](v14, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_261B5A6BC(void *a1)
{
  uint64_t v2 = sub_261B8CE88();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)v28 - v7;
  id v9 = objc_msgSend(self, sel_sharedConnection);
  if (v9)
  {
    int v10 = v9;
    unsigned int v11 = objc_msgSend(v9, sel_isHealthDataSubmissionAllowed);

    if (v11)
    {
      sub_261B8C618();
      sub_261A40D48((uint64_t)a1, (uint64_t)aBlock);
      id v12 = sub_261B8CE78();
      os_log_type_t v13 = sub_261B8F4A8();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        *(void *)&v36[0] = v29;
        uint64_t v30 = v2;
        *(_DWORD *)uint64_t v14 = 136315138;
        v28[1] = v14 + 4;
        unint64_t v16 = v33;
        uint64_t v15 = v34;
        __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v33);
        uint64_t v17 = (*((uint64_t (**)(void *, uint64_t (*)()))v15 + 1))(v16, v15);
        uint64_t v31 = sub_261AC9C40(v17, v18, (uint64_t *)v36);
        sub_261B8F6F8();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
        _os_log_impl(&dword_2619F0000, v12, v13, "Preparing to send analytics for event %s.", v14, 0xCu);
        uint64_t v19 = v29;
        swift_arrayDestroy();
        MEMORY[0x263E4E970](v19, -1, -1);
        MEMORY[0x263E4E970](v14, -1, -1);

        (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v30);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);

        (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      }
      uint64_t v23 = a1[3];
      uint64_t v24 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v23);
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v24);
      uint64_t v25 = (void *)sub_261B8F0B8();
      swift_bridgeObjectRelease();
      sub_261A40D48((uint64_t)a1, (uint64_t)v36);
      uint64_t v26 = swift_allocObject();
      sub_261A4E500(v36, v26 + 16);
      uint64_t v34 = sub_261B5E494;
      uint64_t v35 = v26;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_261B5AAE4;
      uint64_t v33 = &block_descriptor_10;
      uint64_t v27 = _Block_copy(aBlock);
      swift_release();
      AnalyticsSendEventLazy();
      _Block_release(v27);
    }
    else
    {
      sub_261B8C618();
      uint64_t v20 = sub_261B8CE78();
      os_log_type_t v21 = sub_261B8F4A8();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl(&dword_2619F0000, v20, v21, "Health data submission not allowed. Not sending analytics.", v22, 2u);
        MEMORY[0x263E4E970](v22, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_261B5AAE4(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_261A0CCCC(0, (unint64_t *)&qword_26B416D10);
    uint64_t v4 = (void *)sub_261B8EFE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_261B5AB80()
{
  uint64_t v60 = sub_261B8C2D8();
  uint64_t v1 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v55 = (char *)&v55 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9454B0);
  MEMORY[0x270FA5388](v57);
  uint64_t v58 = (uint64_t)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v63 = (uint64_t)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v62 = (char *)&v55 - v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v56 = (uint64_t)&v55 - v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v65 = (uint64_t)&v55 - v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v66 = (uint64_t)&v55 - v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v59 = (char *)&v55 - v15;
  MEMORY[0x270FA5388](v16);
  unint64_t v18 = (char *)&v55 - v17;
  MEMORY[0x270FA5388](v19);
  os_log_type_t v21 = (char *)&v55 - v20;
  id v22 = *(id *)(v0 + 40);
  sub_261B8C2B8();
  id v23 = *(id *)(v0 + 32);
  sub_261B8C2B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9483C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_261B94FB0;
  strcpy((char *)(inited + 32), "activityType");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  sub_261B8F5E8();
  uint64_t v25 = sub_261B8F0B8();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v25;
  *(void *)(inited + 56) = 0x6E6F697461636F6CLL;
  *(void *)(inited + 64) = 0xE800000000000000;
  uint64_t v64 = v0;
  *(void *)(inited + 72) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *(unsigned char *)(v0 + 24) & 1);
  *(void *)(inited + 80) = 0x6174536E4974706FLL;
  *(void *)(inited + 88) = 0xEB00000000737574;
  *(void *)(inited + 96) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, FIShouldTrackTrainingLoad());
  *(void *)(inited + 104) = 0xD000000000000015;
  *(void *)(inited + 112) = 0x8000000261BA39B0;
  uint64_t v61 = v1;
  uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48);
  uint64_t v27 = v60;
  uint64_t v28 = v26(v21, 1, v60) != 1;
  uint64_t v29 = (uint64_t)v18;
  uint64_t v30 = (uint64_t)v59;
  *(void *)(inited + 120) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v28);
  *(void *)(inited + 128) = 0xD000000000000019;
  *(void *)(inited + 136) = 0x8000000261BA39D0;
  LODWORD(v28) = v26((char *)v29, 1, v27);
  sub_261A65018((uint64_t)v21, v30);
  uint64_t v67 = v26;
  if (v28 == 1)
  {
    uint64_t v31 = v27;
    sub_2619F8754(v30, &qword_26A943910);
    uint64_t v32 = v66;
    sub_261A65018(v29, v66);
    uint64_t v33 = v65;
    sub_261A65018((uint64_t)v21, v65);
LABEL_4:
    sub_2619F8754(v33, &qword_26A943910);
    sub_2619F8754(v32, &qword_26A943910);
    char v35 = 0;
    uint64_t v36 = v61;
LABEL_5:
    uint64_t v37 = (uint64_t)v62;
    uint64_t v38 = v31;
    goto LABEL_6;
  }
  uint64_t v31 = v27;
  unsigned int v34 = v26((char *)v30, 1, v27);
  sub_2619F8754(v30, &qword_26A943910);
  uint64_t v32 = v66;
  sub_261A65018(v29, v66);
  uint64_t v33 = v65;
  sub_261A65018((uint64_t)v21, v65);
  if (v34 == 1) {
    goto LABEL_4;
  }
  uint64_t v47 = v58;
  uint64_t v48 = v58 + *(int *)(v57 + 48);
  sub_261A65018(v32, v58);
  uint64_t v59 = (char *)v48;
  sub_261A65018(v33, v48);
  uint64_t v49 = v67;
  unsigned int v50 = v67((char *)v47, 1, v31);
  uint64_t v36 = v61;
  if (v50 != 1)
  {
    uint64_t v52 = v56;
    sub_261A65018(v47, v56);
    if (v49(v59, 1, v31) != 1)
    {
      uint64_t v53 = v55;
      (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v55, v59, v31);
      sub_261B5F1F0(&qword_26A945470, MEMORY[0x263F87EE8]);
      LODWORD(v59) = sub_261B8F0A8();
      uint64_t v54 = *(void (**)(char *, uint64_t))(v36 + 8);
      v54(v53, v31);
      sub_2619F8754(v65, &qword_26A943910);
      sub_2619F8754(v66, &qword_26A943910);
      v54((char *)v52, v31);
      sub_2619F8754(v58, &qword_26A943910);
      char v35 = v59 ^ 1;
      goto LABEL_5;
    }
    uint64_t v51 = v47;
    sub_2619F8754(v65, &qword_26A943910);
    sub_2619F8754(v66, &qword_26A943910);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v52, v31);
    uint64_t v38 = v31;
    goto LABEL_18;
  }
  sub_2619F8754(v33, &qword_26A943910);
  sub_2619F8754(v32, &qword_26A943910);
  uint64_t v38 = v31;
  uint64_t v51 = v47;
  if (v49(v59, 1, v31) != 1)
  {
LABEL_18:
    sub_2619F8754(v51, &qword_26A9454B0);
    char v35 = 1;
    goto LABEL_19;
  }
  sub_2619F8754(v47, &qword_26A943910);
  char v35 = 0;
LABEL_19:
  uint64_t v37 = (uint64_t)v62;
LABEL_6:
  *(void *)(inited + 144) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v35 & 1);
  *(void *)(inited + 152) = 0xD000000000000010;
  *(void *)(inited + 160) = 0x8000000261BA39F0;
  sub_261A65018((uint64_t)v21, v37);
  uint64_t v39 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v67;
  if (v67((char *)v37, 1, v38) == 1)
  {
    sub_2619F8754(v37, &qword_26A943910);
    uint64_t v40 = 0;
  }
  else
  {
    uint64_t v40 = sub_261B8C2A8();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v37, v38);
  }
  *(void *)(inited + 168) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v40);
  *(void *)(inited + 176) = 0xD000000000000010;
  *(void *)(inited + 184) = 0x8000000261BA3A10;
  uint64_t v41 = v63;
  sub_261A65018((uint64_t)v21, v63);
  if (v39(v41, 1, v38) == 1)
  {
    sub_2619F8754(v41, &qword_26A943910);
    uint64_t v42 = 0;
  }
  else
  {
    uint64_t v42 = sub_261B8C298();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v41, v38);
  }
  *(void *)(inited + 192) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v42);
  unint64_t v43 = sub_261AC5700(inited);
  uint64_t v44 = swift_bridgeObjectRetain();
  uint64_t v45 = sub_261B5BE2C(v44, v43);
  sub_2619F8754(v29, &qword_26A943910);
  sub_2619F8754((uint64_t)v21, &qword_26A943910);
  return v45;
}

uint64_t sub_261B5B4F0()
{
  uint64_t v1 = sub_261B8C2D8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v59 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9454B0);
  MEMORY[0x270FA5388](v61);
  uint64_t v62 = (uint64_t)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v66 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v64 = (uint64_t)&v58 - v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v60 = (char *)&v58 - v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v69 = (uint64_t)&v58 - v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v68 = (uint64_t)&v58 - v14;
  MEMORY[0x270FA5388](v15);
  uint64_t v63 = (char *)&v58 - v16;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v58 - v18;
  MEMORY[0x270FA5388](v20);
  id v22 = (char *)&v58 - v21;
  id v23 = *(id *)(v0 + 48);
  sub_261B8C2B8();
  id v24 = *(id *)(v0 + 40);
  sub_261B8C2B8();
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9483C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_261B94FB0;
  strcpy((char *)(inited + 32), "activityType");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  sub_261B8F5E8();
  uint64_t v26 = sub_261B8F0B8();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v26;
  *(void *)(inited + 56) = 0x6E6F697461636F6CLL;
  *(void *)(inited + 64) = 0xE800000000000000;
  uint64_t v67 = v0;
  char v27 = *(unsigned char *)(v0 + 32);
  uint64_t v28 = (uint64_t)v19;
  *(void *)(inited + 72) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v27 & 1);
  *(void *)(inited + 80) = 0x6174536E4974706FLL;
  *(void *)(inited + 88) = 0xEB00000000737574;
  *(void *)(inited + 96) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, FIShouldTrackTrainingLoad());
  *(void *)(inited + 104) = 0xD000000000000015;
  *(void *)(inited + 112) = 0x8000000261BA39B0;
  uint64_t v70 = v2;
  uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48);
  uint64_t v30 = v29(v22, 1, v1) != 1;
  uint64_t v31 = (uint64_t)v63;
  *(void *)(inited + 120) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v30);
  *(void *)(inited + 128) = 0xD000000000000019;
  *(void *)(inited + 136) = 0x8000000261BA39D0;
  LODWORD(v30) = v29((char *)v28, 1, v1);
  sub_261A65018((uint64_t)v22, v31);
  uint64_t v71 = v28;
  if (v30 == 1)
  {
    sub_2619F8754(v31, &qword_26A943910);
    uint64_t v32 = v68;
    sub_261A65018(v28, v68);
    uint64_t v33 = v69;
    sub_261A65018((uint64_t)v22, v69);
    uint64_t v34 = v33;
LABEL_4:
    sub_2619F8754(v34, &qword_26A943910);
    sub_2619F8754(v32, &qword_26A943910);
    char v37 = 0;
    uint64_t v38 = (uint64_t)v66;
    goto LABEL_5;
  }
  unsigned int v35 = v29((char *)v31, 1, v1);
  sub_2619F8754(v31, &qword_26A943910);
  uint64_t v32 = v68;
  sub_261A65018(v28, v68);
  uint64_t v36 = v69;
  sub_261A65018((uint64_t)v22, v69);
  uint64_t v34 = v36;
  if (v35 == 1) {
    goto LABEL_4;
  }
  uint64_t v48 = v36;
  uint64_t v49 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v29;
  uint64_t v50 = v62;
  uint64_t v51 = v62 + *(int *)(v61 + 48);
  sub_261A65018(v32, v62);
  sub_261A65018(v48, v51);
  unsigned int v52 = v49(v50, 1, v1);
  uint64_t v58 = v49;
  if (v52 == 1)
  {
    sub_2619F8754(v48, &qword_26A943910);
    sub_2619F8754(v32, &qword_26A943910);
    unsigned int v53 = v49(v51, 1, v1);
    uint64_t v38 = (uint64_t)v66;
    if (v53 == 1)
    {
      sub_2619F8754(v50, &qword_26A943910);
      char v37 = 0;
      uint64_t v29 = (unsigned int (*)(char *, uint64_t, uint64_t))v58;
      goto LABEL_5;
    }
    goto LABEL_17;
  }
  uint64_t v54 = (uint64_t)v60;
  sub_261A65018(v50, (uint64_t)v60);
  unsigned int v55 = v49(v51, 1, v1);
  uint64_t v38 = (uint64_t)v66;
  if (v55 == 1)
  {
    sub_2619F8754(v69, &qword_26A943910);
    sub_2619F8754(v32, &qword_26A943910);
    (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v54, v1);
LABEL_17:
    sub_2619F8754(v50, &qword_26A9454B0);
    char v37 = 1;
    uint64_t v29 = (unsigned int (*)(char *, uint64_t, uint64_t))v58;
    goto LABEL_5;
  }
  uint64_t v56 = v59;
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 32))(v59, v51, v1);
  sub_261B5F1F0(&qword_26A945470, MEMORY[0x263F87EE8]);
  LODWORD(v63) = sub_261B8F0A8();
  uint64_t v57 = *(void (**)(char *, uint64_t))(v70 + 8);
  v57(v56, v1);
  sub_2619F8754(v69, &qword_26A943910);
  sub_2619F8754(v68, &qword_26A943910);
  v57(v60, v1);
  sub_2619F8754(v50, &qword_26A943910);
  char v37 = v63 ^ 1;
  uint64_t v29 = (unsigned int (*)(char *, uint64_t, uint64_t))v58;
LABEL_5:
  *(void *)(inited + 144) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v37 & 1);
  *(void *)(inited + 152) = 0xD000000000000010;
  *(void *)(inited + 160) = 0x8000000261BA39F0;
  uint64_t v39 = v64;
  sub_261A65018((uint64_t)v22, v64);
  if (v29((char *)v39, 1, v1) == 1)
  {
    sub_2619F8754(v39, &qword_26A943910);
    uint64_t v40 = 0;
  }
  else
  {
    uint64_t v40 = sub_261B8C2A8();
    (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v39, v1);
  }
  *(void *)(inited + 168) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v40);
  *(void *)(inited + 176) = 0xD000000000000010;
  *(void *)(inited + 184) = 0x8000000261BA3A10;
  sub_261A65018((uint64_t)v22, v38);
  if (v29((char *)v38, 1, v1) == 1)
  {
    sub_2619F8754(v38, &qword_26A943910);
    uint64_t v41 = 0;
    uint64_t v42 = v71;
  }
  else
  {
    uint64_t v42 = v71;
    uint64_t v41 = sub_261B8C298();
    (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v38, v1);
  }
  *(void *)(inited + 192) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v41);
  unint64_t v43 = sub_261AC5700(inited);
  uint64_t v44 = swift_initStackObject();
  *(_OWORD *)(v44 + 16) = xmmword_261B93F70;
  *(void *)(v44 + 32) = 0xD000000000000013;
  *(void *)(v44 + 40) = 0x8000000261BA3A30;
  *(void *)(v44 + 48) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, *(unsigned __int8 *)(v67 + 16));
  unint64_t v45 = sub_261AC5700(v44);
  uint64_t v46 = sub_261B5BE2C(v45, v43);
  sub_2619F8754(v42, &qword_26A943910);
  sub_2619F8754((uint64_t)v22, &qword_26A943910);
  return v46;
}

uint64_t sub_261B5BE2C(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_261B5C424(a1, (uint64_t)sub_261B5D6F8, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_261B5BEB8()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_261B5BEE8()
{
  return sub_261B5AB80();
}

uint64_t sub_261B5BF2C()
{
  return sub_261B5B4F0();
}

uint64_t sub_261B5BF70()
{
  uint64_t v1 = *(char *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9483B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_261B92AA0;
  *(void *)(inited + 32) = 0x6174536E4974706FLL;
  *(void *)(inited + 40) = 0xEB00000000737574;
  *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, FIShouldTrackTrainingLoad());
  *(void *)(inited + 56) = 0x656372756F73;
  *(void *)(inited + 64) = 0xE600000000000000;
  *(void *)(inited + 72) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, qword_261B9C2E8[v1]);
  unint64_t v3 = sub_261AC570C(inited);
  sub_261B5C068(v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

void sub_261B5C068(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A946958);
    uint64_t v2 = (void *)sub_261B8FA08();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
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
  swift_bridgeObjectRetain();
  int64_t i = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v11 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v11 >= v27) {
    goto LABEL_32;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v11);
  int64_t v13 = i + 1;
  if (!v12)
  {
    int64_t v13 = i + 2;
    if (i + 2 >= v27) {
      goto LABEL_32;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    if (!v12)
    {
      int64_t v13 = i + 3;
      if (i + 3 >= v27) {
        goto LABEL_32;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = i + 4;
        if (i + 4 >= v27) {
          goto LABEL_32;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v14 = i + 5;
          if (i + 5 < v27)
          {
            unint64_t v12 = *(void *)(v28 + 8 * v14);
            if (v12)
            {
              int64_t v13 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v13 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_36;
              }
              if (v13 >= v27) {
                break;
              }
              unint64_t v12 = *(void *)(v28 + 8 * v13);
              ++v14;
              if (v12) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_261B5F1E8();
          return;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v12 - 1) & v12;
  unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
  for (i = v13; ; unint64_t v10 = v9 | (i << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    id v19 = v18;
    unint64_t v20 = sub_261ACB228(v17, v16);
    unint64_t v21 = v20;
    if (v22)
    {
      uint64_t v7 = (uint64_t *)(v2[6] + 16 * v20);
      swift_bridgeObjectRelease();
      *uint64_t v7 = v17;
      v7[1] = v16;
      uint64_t v8 = v2[7];

      *(void *)(v8 + 8 * v21) = v19;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v20;
    id v23 = (uint64_t *)(v2[6] + 16 * v20);
    *id v23 = v17;
    v23[1] = v16;
    *(void *)(v2[7] + 8 * v20) = v19;
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_34;
    }
    v2[2] = v26;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

void *sub_261B5C310@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

uint64_t sub_261B5C330()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9483B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_261B92AA0;
  *(void *)(inited + 32) = 0xD000000000000014;
  *(void *)(inited + 40) = 0x8000000261BA3990;
  *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v2);
  *(void *)(inited + 56) = 0x656372756F73;
  *(void *)(inited + 64) = 0xE600000000000000;
  *(void *)(inited + 72) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v1);
  unint64_t v4 = sub_261AC570C(inited);
  sub_261B5C068(v4);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_261B5C41C()
{
  return sub_261B5F238(*(unsigned char *)(v0 + 16));
}

uint64_t sub_261B5C424(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_261B5D744();
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = v9;
  int64_t v13 = (void *)*a5;
  unint64_t v15 = sub_261ACB228(v7, v8);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char v19 = v14;
  if (v13[3] >= v18)
  {
    if (a4)
    {
      char v22 = (void *)*a5;
      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_261AD08CC();
      char v22 = (void *)*a5;
      if (v19) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    BOOL v25 = (uint64_t *)(v22[6] + 16 * v15);
    *BOOL v25 = v10;
    v25[1] = v11;
    *(void *)(v22[7] + 8 * v15) = v12;
    uint64_t v26 = v22[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v22[2] = v28;
LABEL_13:
    sub_261B5D744();
    if (v30)
    {
      uint64_t v32 = v29;
      uint64_t v33 = v30;
      uint64_t v34 = v31;
      do
      {
        uint64_t v40 = (void *)*a5;
        unint64_t v42 = sub_261ACB228(v32, v33);
        uint64_t v43 = v40[2];
        BOOL v44 = (v41 & 1) == 0;
        uint64_t v45 = v43 + v44;
        if (__OFADD__(v43, v44)) {
          goto LABEL_25;
        }
        char v46 = v41;
        if (v40[3] < v45)
        {
          sub_261ACEAC8(v45, 1);
          unint64_t v47 = sub_261ACB228(v32, v33);
          if ((v46 & 1) != (v48 & 1)) {
            goto LABEL_27;
          }
          unint64_t v42 = v47;
        }
        uint64_t v49 = (void *)*a5;
        if (v46)
        {
          swift_bridgeObjectRelease();
          uint64_t v35 = v49[7];
          uint64_t v36 = 8 * v42;

          *(void *)(v35 + v36) = v34;
        }
        else
        {
          v49[(v42 >> 6) + 8] |= 1 << v42;
          uint64_t v50 = (uint64_t *)(v49[6] + 16 * v42);
          *uint64_t v50 = v32;
          v50[1] = v33;
          *(void *)(v49[7] + 8 * v42) = v34;
          uint64_t v51 = v49[2];
          BOOL v27 = __OFADD__(v51, 1);
          uint64_t v52 = v51 + 1;
          if (v27) {
            goto LABEL_26;
          }
          v49[2] = v52;
        }
        sub_261B5D744();
        uint64_t v32 = v37;
        uint64_t v33 = v38;
        uint64_t v34 = v39;
      }
      while (v38);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_261B5F1E8();
    return swift_release();
  }
  sub_261ACEAC8(v18, a4 & 1);
  unint64_t v20 = sub_261ACB228(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    unint64_t v15 = v20;
    char v22 = (void *)*a5;
    if ((v19 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v23 = v22[7];
    uint64_t v24 = 8 * v15;

    *(void *)(v23 + v24) = v12;
    goto LABEL_13;
  }
LABEL_27:
  uint64_t result = sub_261B8FBF8();
  __break(1u);
  return result;
}

uint64_t sub_261B5C70C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_261B8ED78();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = sub_261B8ED98();
  uint64_t v10 = *(void *)(v17[0] - 8);
  MEMORY[0x270FA5388](v17[0]);
  uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v22 = &type metadata for ViewedTrainingLoadDetailsAnalyticsEvent;
  uint64_t v23 = &off_270DAAF78;
  v20[0] = a1;
  v20[1] = a2;
  char v21 = a3;
  uint64_t v13 = qword_26A942F10;
  swift_bridgeObjectRetain();
  if (v13 != -1) {
    swift_once();
  }
  sub_261A40D48((uint64_t)v20, (uint64_t)v19);
  uint64_t v14 = swift_allocObject();
  sub_261A4E500(v19, v14 + 16);
  aBlock[4] = sub_261B5F4D0;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_261B052D8;
  void aBlock[3] = &block_descriptor_44;
  unint64_t v15 = _Block_copy(aBlock);
  sub_261B8ED88();
  v17[1] = MEMORY[0x263F8EE78];
  sub_261B5F1F0((unint64_t *)&qword_26B416BF0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CB0);
  sub_261B156AC((unint64_t *)&qword_26B416CB8, &qword_26B416CB0);
  sub_261B8F7E8();
  MEMORY[0x263E4D450](0, v12, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, void))(v10 + 8))(v12, v17[0]);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
}

uint64_t sub_261B5CA2C(uint64_t a1)
{
  uint64_t v2 = sub_261B8ED78();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = sub_261B8ED98();
  uint64_t v6 = *(void *)(v14[0] - 8);
  MEMORY[0x270FA5388](v14[0]);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[3] = &type metadata for EndOfWorkoutAnalyticsEvent;
  v17[4] = &off_270DAAF90;
  uint64_t v9 = swift_allocObject();
  v17[0] = v9;
  long long v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v9 + 32) = v10;
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(a1 + 32);
  *(void *)(v9 + 64) = *(void *)(a1 + 48);
  sub_261B5EB90(a1);
  if (qword_26A942F10 != -1) {
    swift_once();
  }
  sub_261A40D48((uint64_t)v17, (uint64_t)v16);
  uint64_t v11 = swift_allocObject();
  sub_261A4E500(v16, v11 + 16);
  aBlock[4] = sub_261B5F4D0;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_261B052D8;
  void aBlock[3] = &block_descriptor_37_0;
  uint64_t v12 = _Block_copy(aBlock);
  sub_261B8ED88();
  v14[1] = MEMORY[0x263F8EE78];
  sub_261B5F1F0((unint64_t *)&qword_26B416BF0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CB0);
  sub_261B156AC((unint64_t *)&qword_26B416CB8, &qword_26B416CB0);
  sub_261B8F7E8();
  MEMORY[0x263E4D450](0, v8, v5, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, void))(v6 + 8))(v8, v14[0]);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
}

uint64_t sub_261B5CD6C(uint64_t a1)
{
  uint64_t v2 = sub_261B8ED78();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = sub_261B8ED98();
  uint64_t v6 = *(void *)(v14[0] - 8);
  MEMORY[0x270FA5388](v14[0]);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[3] = &type metadata for UpdatedEffortAnalyticsEvent;
  v17[4] = &off_270DAAFC0;
  uint64_t v9 = swift_allocObject();
  v17[0] = v9;
  long long v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v9 + 32) = v10;
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(a1 + 32);
  *(void *)(v9 + 64) = *(void *)(a1 + 48);
  sub_261B5E530(a1);
  if (qword_26A942F10 != -1) {
    swift_once();
  }
  sub_261A40D48((uint64_t)v17, (uint64_t)v16);
  uint64_t v11 = swift_allocObject();
  sub_261A4E500(v16, v11 + 16);
  aBlock[4] = sub_261B5F4D0;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_261B052D8;
  void aBlock[3] = &block_descriptor_20;
  uint64_t v12 = _Block_copy(aBlock);
  sub_261B8ED88();
  v14[1] = MEMORY[0x263F8EE78];
  sub_261B5F1F0((unint64_t *)&qword_26B416BF0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CB0);
  sub_261B156AC((unint64_t *)&qword_26B416CB8, &qword_26B416CB0);
  sub_261B8F7E8();
  MEMORY[0x263E4D450](0, v8, v5, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, void))(v6 + 8))(v8, v14[0]);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
}

uint64_t sub_261B5D0AC(uint64_t a1, uint64_t a2, unsigned int a3)
{
  char v3 = a3;
  unsigned int v6 = a3 >> 8;
  uint64_t v7 = sub_261B8ED78();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  long long v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = sub_261B8ED98();
  uint64_t v11 = *(void *)(v18[0] - 8);
  MEMORY[0x270FA5388](v18[0]);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = &type metadata for DeepLinkedToVitalsAnalyticsEvent;
  BOOL v25 = &off_270DAAFD8;
  v21[0] = a1;
  v21[1] = a2;
  char v22 = v3 & 1;
  char v23 = v6;
  uint64_t v14 = qword_26A942F10;
  swift_bridgeObjectRetain();
  if (v14 != -1) {
    swift_once();
  }
  sub_261A40D48((uint64_t)v21, (uint64_t)v20);
  uint64_t v15 = swift_allocObject();
  sub_261A4E500(v20, v15 + 16);
  aBlock[4] = sub_261B5E48C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_261B052D8;
  void aBlock[3] = &block_descriptor_8;
  uint64_t v16 = _Block_copy(aBlock);
  sub_261B8ED88();
  v18[1] = MEMORY[0x263F8EE78];
  sub_261B5F1F0((unint64_t *)&qword_26B416BF0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CB0);
  sub_261B156AC((unint64_t *)&qword_26B416CB8, &qword_26B416CB0);
  sub_261B8F7E8();
  MEMORY[0x263E4D450](0, v13, v10, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, void))(v11 + 8))(v13, v18[0]);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
}

uint64_t sub_261B5D3D8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_261B8ED78();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = sub_261B8ED98();
  uint64_t v10 = *(void *)(v17[0] - 8);
  MEMORY[0x270FA5388](v17[0]);
  uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v22 = &type metadata for LoadAndVitalsAnalyticsEvent;
  char v23 = &off_270DAAFA8;
  v20[0] = a1;
  v20[1] = a2;
  char v21 = a3;
  uint64_t v13 = qword_26A942F10;
  swift_bridgeObjectRetain();
  if (v13 != -1) {
    swift_once();
  }
  sub_261A40D48((uint64_t)v20, (uint64_t)v19);
  uint64_t v14 = swift_allocObject();
  sub_261A4E500(v19, v14 + 16);
  aBlock[4] = sub_261B5F4D0;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_261B052D8;
  void aBlock[3] = &block_descriptor_27;
  uint64_t v15 = _Block_copy(aBlock);
  sub_261B8ED88();
  v17[1] = MEMORY[0x263F8EE78];
  sub_261B5F1F0((unint64_t *)&qword_26B416BF0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CB0);
  sub_261B156AC((unint64_t *)&qword_26B416CB8, &qword_26B416CB0);
  sub_261B8F7E8();
  MEMORY[0x263E4D450](0, v12, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, void))(v10 + 8))(v12, v17[0]);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
}

id sub_261B5D6F8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  id v4 = (id)a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v4;
  swift_bridgeObjectRetain();
  return v4;
}

void sub_261B5D744()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  id v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void v20[3];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = *(void **)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    void v20[2] = v10;
    swift_bridgeObjectRetain();
    uint64_t v12 = v10;
    v11(&v19, v20);

    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      uint64_t v15 = v0[1];
      uint64_t v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      BOOL v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        uint64_t v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          uint64_t v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          uint64_t v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            uint64_t v13 = v3 + 3;
            goto LABEL_7;
          }
          BOOL v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            uint64_t v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            uint64_t v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              uint64_t v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              uint64_t v18 = v3 + 6;
              while (v14 != v18)
              {
                uint64_t v16 = *(void *)(v15 + 8 * v18++);
                if (v16)
                {
                  uint64_t v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v0[3] = v4;
    v0[4] = 0;
  }
}

uint64_t sub_261B5D8D8(uint64_t a1, void *a2, char a3)
{
  return sub_261B5E574(a2, a3 & 1);
}

uint64_t _s9WorkoutUI15EffortUtilitiesC23analyticsTaskIdentifier7workoutSSSo9HKWorkoutC_tFZ_0(void *a1)
{
  uint64_t v2 = sub_261B8AE38();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416BC8);
  double v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(a1, sel_fiui_finalWorkoutUUID, v7);
  if (v10)
  {
    uint64_t v11 = v10;
    sub_261B8AE18();

    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v9, v5, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v9, 0, 1, v2);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v9, 1, v2);
    if (result != 1)
    {
      sub_261B8ADE8();
      v14[0] = 0xD000000000000016;
      v14[1] = 0x8000000261BA3840;
      sub_261B8F1C8();
      swift_bridgeObjectRelease();
      uint64_t v13 = v14[0];
      (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
      return v13;
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v9, 1, 1, v2);
  }
  __break(1u);
  return result;
}

uint64_t _s9WorkoutUI15EffortUtilitiesC32sendDidViewTrainingLoadAnalytics4fromy10Foundation3URLV_tFZ_0()
{
  uint64_t v0 = sub_261B8CE88();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  TrainingLoadURLBuilder.getTrainingLoadSource(from:)(&v10);
  char v4 = v10;
  if (v10 == 6)
  {
    sub_261B8C618();
    uint64_t v5 = sub_261B8CE78();
    os_log_type_t v6 = sub_261B8F4B8();
    if (os_log_type_enabled(v5, v6))
    {
      double v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_2619F0000, v5, v6, "Unable to determine source from url", v7, 2u);
      MEMORY[0x263E4E970](v7, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  else
  {
    return sub_261B5C70C(0xD000000000000023, 0x8000000261BA3960, v4);
  }
}

uint64_t _HKWorkoutIsIndoor(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 metadata];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F09AA0]];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

uint64_t _s9WorkoutUI15EffortUtilitiesC32_sendLoadAndVitalsAnalyticsEvent11healthStoreySo08HKHealthL0C_tFZ_0(void *a1)
{
  id v18 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CA8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_261B8AFC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_261B8ADD8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_261B8C9E8();
  uint64_t v10 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261B8ADA8();
  id v13 = objc_msgSend(self, sel_hk_gregorianCalendar);
  sub_261B8AF68();

  sub_261B8C9B8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_261B8C9A8();
  sub_261B8C9C8();
  id v14 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26A9483A8));
  uint64_t v15 = (void *)sub_261B8CAE8();
  objc_msgSend(v18, sel_executeQuery_, v15);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v17);
}

uint64_t _s9WorkoutUI15EffortUtilitiesC08sendPostA9Analytics15workoutActivity09perceivedC8Quantity09estimatedcK011healthStoreySo09HKWorkoutI0C_So10HKQuantityCSgAMSo08HKHealthN0CtFZ_0(void *a1, void *a2, void *a3, void *a4)
{
  id v8 = objc_msgSend(a1, sel_workoutConfiguration);
  id v9 = objc_msgSend(v8, sel_activityType);

  id v10 = objc_msgSend(a1, sel_workoutConfiguration);
  id v11 = objc_msgSend(v10, sel_locationType);

  BOOL v12 = v11 == (id)2;
  id v13 = a3;
  id v14 = a2;
  v18[0] = 0xD000000000000025;
  v18[1] = 0x8000000261BA3860;
  void v18[2] = v9;
  BOOL v19 = v12;
  unint64_t v20 = a2;
  char v21 = a3;
  unint64_t v22 = sub_261AC5700(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRetain();
  id v15 = v14;
  id v16 = v13;
  swift_bridgeObjectRetain();
  sub_261B5CA2C((uint64_t)v18);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  _s9WorkoutUI15EffortUtilitiesC32_sendLoadAndVitalsAnalyticsEvent11healthStoreySo08HKHealthL0C_tFZ_0(a4);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_261B5E150(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  id v10 = objc_msgSend(a1, sel_sourceRevision);
  id v11 = objc_msgSend(v10, sel_source);

  unsigned __int8 v12 = objc_msgSend(v11, sel__hasFirstPartyBundleID);
  if (a2)
  {
    id v13 = a2;
    id v14 = objc_msgSend(v13, sel_workoutConfiguration);
    id v15 = objc_msgSend(v14, sel_activityType);

    id v16 = objc_msgSend(v13, sel_workoutConfiguration);
    id v17 = objc_msgSend(v16, sel_locationType);

    char IsIndoor = v17 == (id)2;
  }
  else
  {
    id v15 = objc_msgSend(a1, sel_workoutActivityType);
    char IsIndoor = _HKWorkoutIsIndoor(a1);
  }
  *(void *)a5 = 0xD000000000000029;
  *(void *)(a5 + 8) = 0x8000000261BA3910;
  *(unsigned char *)(a5 + 16) = v12;
  *(void *)(a5 + 24) = v15;
  *(unsigned char *)(a5 + 32) = IsIndoor;
  *(void *)(a5 + 40) = a3;
  *(void *)(a5 + 48) = a4;
}

uint64_t sub_261B5E2B8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 48);
  swift_bridgeObjectRelease();

  return a1;
}

unint64_t sub_261B5E2FC()
{
  unint64_t result = qword_26A9483A0;
  if (!qword_26A9483A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9483A0);
  }
  return result;
}

unsigned char *_s20OvernightVitalsStateOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x261B5E41CLL);
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

ValueMetadata *type metadata accessor for EffortUtilities.OvernightVitalsState()
{
  return &type metadata for EffortUtilities.OvernightVitalsState;
}

uint64_t sub_261B5E454()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_261B5E48C()
{
  sub_261B5A6BC((void *)(v0 + 16));
}

uint64_t sub_261B5E494()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t sub_261B5E4E8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_261B5E530(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  swift_bridgeObjectRetain();
  id v4 = v2;
  return a1;
}

uint64_t sub_261B5E574(void *a1, char a2)
{
  uint64_t v4 = sub_261B8CE88();
  uint64_t v46 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unsigned int v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_261B8CB78();
  uint64_t v44 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  id v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_261B8CB58();
  uint64_t v9 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  id v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_261B8CA28();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9483B0);
  MEMORY[0x270FA5388](v16 - 8);
  id v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v28 = a1;
    sub_261B8C618();
    uint64_t v29 = a1;
    uint64_t v30 = a1;
    uint64_t v48 = (uint64_t)v6;
    uint64_t v31 = sub_261B8CE78();
    os_log_type_t v32 = sub_261B8F4B8();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v47 = v4;
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v49 = (uint64_t)a1;
      uint64_t v50 = v34;
      *(_DWORD *)uint64_t v33 = 136315138;
      uint64_t v35 = v46;
      uint64_t v36 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A943900);
      uint64_t v37 = sub_261B8F128();
      uint64_t v49 = sub_261AC9C40(v37, v38, &v50);
      sub_261B8F6F8();
      swift_bridgeObjectRelease();
      sub_261A5406C(a1, 1);
      sub_261A5406C(a1, 1);
      _os_log_impl(&dword_2619F0000, v31, v32, "Failed to query sleep samples due to %s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E4E970](v34, -1, -1);
      MEMORY[0x263E4E970](v33, -1, -1);

      sub_261A5406C(a1, 1);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 8))(v48, v47);
    }
    else
    {
      sub_261A5406C(a1, 1);
      sub_261A5406C(a1, 1);

      return (*(uint64_t (**)(uint64_t, uint64_t))(v46 + 8))(v48, v4);
    }
  }
  else
  {
    uint64_t v19 = a1[2];
    uint64_t v43 = v18;
    if (v19)
    {
      uint64_t v41 = v13;
      uint64_t v20 = v13 + 16;
      uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
      uint64_t v46 = v13 + 16;
      char v21 = (char *)a1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
      unint64_t v22 = a1;
      char v23 = (void (**)(char *, uint64_t))(v9 + 8);
      uint64_t v24 = (void (**)(char *, uint64_t))(v44 + 8);
      BOOL v25 = (void (**)(char *, uint64_t))(v20 - 8);
      uint64_t v44 = *(void *)(v20 + 56);
      id v42 = v22;
      swift_bridgeObjectRetain();
      while (1)
      {
        v45(v15, v21, v12);
        sub_261B8CA18();
        sub_261B8CB48();
        (*v23)(v11, v47);
        char v26 = sub_261B8CB68();
        (*v24)(v8, v48);
        if (v26) {
          break;
        }
        (*v25)(v15, v12);
        v21 += v44;
        if (!--v19)
        {
          sub_261A5406C(v42, 0);
          uint64_t v27 = 1;
          uint64_t v13 = v41;
          goto LABEL_12;
        }
      }
      sub_261A5406C(v42, 0);
      uint64_t v13 = v41;
      (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v43, v15, v12);
      uint64_t v27 = 0;
      LOBYTE(v19) = 1;
    }
    else
    {
      uint64_t v27 = 1;
    }
LABEL_12:
    uint64_t v40 = (uint64_t)v43;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v43, v27, 1, v12);
    sub_2619F8754(v40, &qword_26A9483B0);
    return sub_261B5D3D8(0xD000000000000017, 0x8000000261BA3940, v19);
  }
}

uint64_t sub_261B5EB40()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_261B5EB90(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v4 = v2;
  return a1;
}

uint64_t assignWithCopy for ViewedTrainingLoadDetailsAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for ViewedTrainingLoadDetailsAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for ViewedTrainingLoadDetailsAnalyticsEvent()
{
  return &type metadata for ViewedTrainingLoadDetailsAnalyticsEvent;
}

uint64_t destroy for EndOfWorkoutAnalyticsEvent(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EndOfWorkoutAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void **)(a2 + 32);
  uint64_t v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  id v6 = v4;
  id v7 = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EndOfWorkoutAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v5;
  id v6 = v5;

  id v7 = *(void **)(a1 + 40);
  id v8 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v8;
  id v9 = v8;

  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for EndOfWorkoutAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);

  uint64_t v5 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for EndOfWorkoutAnalyticsEvent()
{
  return &type metadata for EndOfWorkoutAnalyticsEvent;
}

uint64_t _s9WorkoutUI39ViewedTrainingLoadDetailsAnalyticsEventVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

ValueMetadata *type metadata accessor for LoadAndVitalsAnalyticsEvent()
{
  return &type metadata for LoadAndVitalsAnalyticsEvent;
}

void destroy for UpdatedEffortAnalyticsEvent(uint64_t a1)
{
  swift_bridgeObjectRelease();

  uint64_t v2 = *(void **)(a1 + 48);
}

uint64_t initializeWithCopy for UpdatedEffortAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void **)(a2 + 40);
  uint64_t v5 = *(void **)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  id v6 = v4;
  id v7 = v5;
  return a1;
}

uint64_t assignWithCopy for UpdatedEffortAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v5;
  id v6 = v5;

  id v7 = *(void **)(a1 + 48);
  id v8 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v8;
  id v9 = v8;

  return a1;
}

uint64_t assignWithTake for UpdatedEffortAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);

  uint64_t v5 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  return a1;
}

ValueMetadata *type metadata accessor for UpdatedEffortAnalyticsEvent()
{
  return &type metadata for UpdatedEffortAnalyticsEvent;
}

uint64_t sub_261B5F068(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DeepLinkedToVitalsAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t assignWithTake for DeepLinkedToVitalsAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeepLinkedToVitalsAnalyticsEvent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 18)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeepLinkedToVitalsAnalyticsEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 18) = 1;
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
    *(unsigned char *)(result + 18) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeepLinkedToVitalsAnalyticsEvent()
{
  return &type metadata for DeepLinkedToVitalsAnalyticsEvent;
}

uint64_t sub_261B5F1E8()
{
  return swift_release();
}

uint64_t sub_261B5F1F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_261B5F238(char a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9483B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_261B92AA0;
  *(void *)(inited + 32) = 0x6174536E4974706FLL;
  *(void *)(inited + 40) = 0xEB00000000737574;
  *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, FIShouldTrackTrainingLoad());
  *(void *)(inited + 56) = 0xD000000000000013;
  *(void *)(inited + 64) = 0x8000000261BA3A50;
  *(void *)(inited + 72) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, a1 & 1);
  unint64_t v3 = sub_261AC570C(inited);
  sub_261B5C068(v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

unsigned char *storeEnumTagSinglePayload for DeepLinkedToVitalsAnalyticsEvent.DeepLinkSource(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x261B5F3FCLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeepLinkedToVitalsAnalyticsEvent.DeepLinkSource()
{
  return &type metadata for DeepLinkedToVitalsAnalyticsEvent.DeepLinkSource;
}

unint64_t sub_261B5F438()
{
  unint64_t result = qword_26A9483C8;
  if (!qword_26A9483C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9483C8);
  }
  return result;
}

uint64_t MetricPublishing.publishPageDidChangeToPage(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_261B8B098();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_261B8C8B8();
  uint64_t v11 = *(void *)(v10 - 8);
  double v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v7 + 16))(v9, a1, v6, v12);
  sub_261B8C8C8();
  (*(void (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  swift_getObjectType();
  sub_261B60550(&qword_26A944F80, MEMORY[0x263F6B6F0]);
  sub_261B8CCF8();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

Swift::Void __swiftcall MetricPublishing.publishBackNavigation()()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = sub_261B8C908();
  uint64_t v5 = *(void *)(v4 - 8);
  double v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t, double))(v2 + 8))(v3, v2, v6);
  swift_getObjectType();
  sub_261B8C8F8();
  sub_261B60550(&qword_26A947A00, MEMORY[0x263F6B808]);
  sub_261B8CCF8();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t MetricPublishing.publishClick(actionType:targetType:targetIdentifier:targetIdentifierType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v80 = a6;
  uint64_t v90 = a5;
  uint64_t v95 = a4;
  uint64_t v98 = a3;
  uint64_t v92 = a2;
  uint64_t v88 = a1;
  uint64_t v9 = sub_261B8C8D8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v103 = v9;
  uint64_t v104 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v102 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_261B8B4F8();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v101 = (char *)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944FB0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v100 = (char *)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944FB8);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v99 = (char *)&v76 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944FC0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v94 = (char *)&v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944FC8);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v89 = (char *)&v76 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944F78);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v87 = (char *)&v76 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_261B8B678();
  uint64_t v85 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  uint64_t v106 = (char *)&v76 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_261B8B548();
  uint64_t v96 = *(void *)(v25 - 8);
  uint64_t v97 = v25;
  MEMORY[0x270FA5388](v25);
  uint64_t v93 = (char *)&v76 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v91 = (char *)&v76 - v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9483D0);
  MEMORY[0x270FA5388](v29 - 8);
  uint64_t v84 = (char *)&v76 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_261B8B588();
  uint64_t v82 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  uint64_t v81 = (char *)&v76 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9483D8);
  MEMORY[0x270FA5388](v32 - 8);
  uint64_t v34 = (char *)&v76 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9453E0);
  MEMORY[0x270FA5388](v35 - 8);
  uint64_t v78 = (char *)&v76 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_261B8B528();
  uint64_t v38 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v77 = (char *)&v76 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9483E0);
  MEMORY[0x270FA5388](v40 - 8);
  id v42 = (char *)&v76 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_261B8B238();
  uint64_t v107 = *(void *)(v43 - 8);
  uint64_t v108 = v43;
  MEMORY[0x270FA5388](v43);
  uint64_t v105 = (char *)&v76 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_261B8ADD8();
  uint64_t v46 = *(void *)(v45 - 8);
  double v47 = MEMORY[0x270FA5388](v45);
  uint64_t v49 = (char *)&v76 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = a7;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, double))(a7 + 16))(&v109, a6, a7, v47);
  uint64_t v50 = v110;
  uint64_t v51 = v111;
  __swift_project_boxed_opaque_existential_1(&v109, v110);
  sub_261B8ADC8();
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 40))(v49, v50, v51);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v49, v45);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v109);
  uint64_t v52 = sub_261B8B6D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v42, 1, 1, v52);
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v77, v88, v37);
  uint64_t v53 = sub_261B8ABF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v78, 1, 1, v53);
  uint64_t v54 = sub_261B8B688();
  uint64_t v55 = *(void *)(v54 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v34, v90, v54);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(v34, 0, 1, v54);
  (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v81, v92, v83);
  uint64_t v56 = sub_261B8B718();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v84, 1, 1, v56);
  swift_bridgeObjectRetain();
  uint64_t v57 = v105;
  sub_261B8B228();
  uint64_t v58 = v106;
  (*(void (**)(char *, char *, uint64_t))(v107 + 16))(v106, v57, v108);
  (*(void (**)(char *, void, uint64_t))(v85 + 104))(v58, *MEMORY[0x263F6A500], v86);
  uint64_t v59 = v79;
  uint64_t v60 = v87;
  uint64_t v61 = v80;
  (*(void (**)(uint64_t, uint64_t))(v79 + 24))(v80, v79);
  uint64_t v62 = sub_261B8B098();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v60, 0, 1, v62);
  uint64_t v63 = sub_261B8B5E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v89, 1, 1, v63);
  uint64_t v64 = sub_261B8B5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v94, 1, 1, v64);
  uint64_t v65 = v99;
  sub_261B8B568();
  uint64_t v66 = sub_261B8B578();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v65, 0, 1, v66);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944FD0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v100, 1, 1, v67);
  uint64_t v68 = sub_261B8B698();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v101, 1, 1, v68);
  uint64_t v69 = v91;
  sub_261B8B538();
  uint64_t v71 = v96;
  uint64_t v70 = v97;
  (*(void (**)(char *, char *, uint64_t))(v96 + 16))(v93, v69, v97);
  uint64_t v72 = v102;
  sub_261B8C8E8();
  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v61, v59);
  swift_getObjectType();
  sub_261B60550(&qword_26A944FD8, MEMORY[0x263F6B720]);
  uint64_t v73 = v72;
  uint64_t v74 = v103;
  sub_261B8CCF8();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v104 + 8))(v73, v74);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v69, v70);
  return (*(uint64_t (**)(char *, uint64_t))(v107 + 8))(v105, v108);
}

uint64_t sub_261B60550(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t MetricPublishing.publishImpressions(on:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v31)(void *__return_ptr, uint64_t, uint64_t, double);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  void v65[3];
  uint64_t v66;
  uint64_t v67;

  uint64_t v58 = a1;
  uint64_t v6 = sub_261B8C8D8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v63 = v6;
  uint64_t v64 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v62 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_261B8B4F8();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v61 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944FB0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v60 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944FB8);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v59 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944FC0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v55 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944FC8);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v52 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944F78);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_261B8B678();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (uint64_t *)((char *)&v51 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v26 = sub_261B8B548();
  uint64_t v56 = *(void *)(v26 - 8);
  uint64_t v57 = v26;
  MEMORY[0x270FA5388](v26);
  uint64_t v54 = (char *)&v51 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v29 = MEMORY[0x270FA5388](v28);
  uint64_t v53 = (char *)&v51 - v30;
  uint64_t v31 = *(void (**)(void *__return_ptr, uint64_t, uint64_t, double))(a3 + 16);
  uint64_t v51 = v3;
  v31(v65, a2, a3, v29);
  uint64_t v32 = v66;
  uint64_t v33 = v67;
  __swift_project_boxed_opaque_existential_1(v65, v66);
  uint64_t v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v58, v32, v33);
  if (v34) {
    uint64_t v35 = v34;
  }
  else {
    uint64_t v35 = MEMORY[0x263F8EE78];
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  *uint64_t v25 = v35;
  (*(void (**)(uint64_t *, void, uint64_t))(v23 + 104))(v25, *MEMORY[0x263F6A4E8], v22);
  uint64_t v36 = a2;
  uint64_t v37 = a3;
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  uint64_t v38 = sub_261B8B098();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v21, 0, 1, v38);
  uint64_t v39 = sub_261B8B5E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v52, 1, 1, v39);
  uint64_t v40 = sub_261B8B5F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v55, 1, 1, v40);
  uint64_t v41 = v59;
  sub_261B8B568();
  id v42 = sub_261B8B578();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v41, 0, 1, v42);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944FD0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v60, 1, 1, v43);
  uint64_t v44 = sub_261B8B698();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v61, 1, 1, v44);
  uint64_t v45 = v53;
  sub_261B8B538();
  double v47 = v56;
  uint64_t v46 = v57;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v54, v45, v57);
  uint64_t v48 = v62;
  sub_261B8C8E8();
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v37);
  swift_getObjectType();
  sub_261B60550(&qword_26A944FD8, MEMORY[0x263F6B720]);
  uint64_t v49 = v63;
  sub_261B8CCF8();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v48, v49);
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v45, v46);
}

uint64_t dispatch thunk of MetricPublishing.eventHub.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of MetricPublishing.impressionsTracker.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of MetricPublishing.metricPage.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of MetricPublishing.publishPageDidChangeToPage(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of MetricPublishing.publishBackNavigation()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of MetricPublishing.publishClick(actionType:targetType:targetIdentifier:targetIdentifierType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 48))();
}

uint64_t dispatch thunk of MetricPublishing.publishImpressions(on:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t static HeartRateZonesPlatterMetricsProvider.metrics(workoutSettingsManager:foriOS:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_supportedMetrics);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_2619FDF28();
    sub_2619FDF68();
    uint64_t v3 = sub_261B8F448();
  }
  else
  {
    uint64_t v3 = 0;
  }
  sub_2619FDCBC((uint64_t)&unk_270DA3040, v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  return v5;
}

ValueMetadata *type metadata accessor for HeartRateZonesPlatterMetricsProvider()
{
  return &type metadata for HeartRateZonesPlatterMetricsProvider;
}

ValueMetadata *type metadata accessor for WorkoutNotificationUnitView()
{
  return &type metadata for WorkoutNotificationUnitView;
}

uint64_t sub_261B60E1C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_261B60E38(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int64x2_t *a4@<X8>)
{
  v472.i64[0] = a3;
  v473 = a4;
  v474[0] = (id)a2;
  uint64_t v5 = sub_261B8DB88();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v453 = (uint64_t)&v450 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v460 = sub_261B8FD48();
  uint64_t v458 = *(void *)(v460 - 8);
  MEMORY[0x270FA5388](v460);
  uint64_t v456 = (uint64_t)&v450 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v459 = sub_261B8FD58();
  uint64_t v457 = *(void *)(v459 - 8);
  MEMORY[0x270FA5388](v459);
  uint64_t v455 = (uint64_t)&v450 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_261B8ABA8();
  uint64_t v464 = *(void *)(v9 - 8);
  uint64_t v465 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v463 = (uint64_t)&v450 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_261B8FB88();
  uint64_t v467 = *(void *)(v11 - 8);
  v468.i64[0] = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v466 = (uint64_t)&v450 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_261B8AEF8();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9453F8);
  uint64_t v461 = *(void *)(v14 - 8);
  uint64_t v462 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v450 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v450 - v18;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v450 - v21;
  v470.i64[0] = sub_261B8E838();
  *(void *)&long long v469 = *(void *)(v470.i64[0] - 8);
  MEMORY[0x270FA5388](v470.i64[0]);
  v471.i64[0] = (uint64_t)&v450 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_261B8BB88();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v450 - v27;
  sub_261B8BBC8();
  uint64_t v452 = v25;
  int v29 = (*(uint64_t (**)(char *, uint64_t))(v25 + 88))(v28, v24);
  if (v29 == *MEMORY[0x263F87C38])
  {
    uint64_t v30 = sub_261B8BBD8();
    if (v31)
    {
      uint64_t v33 = 0;
    }
    else
    {
      uint64_t v32 = v30;
      uint64_t v33 = sub_261B8BB98();
      if (v33)
      {
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v35 = v472.i64[0];
        if (v472.i64[0])
        {
          id v36 = v474[0];
          id v37 = v474[0];
          uint64_t v38 = v35;
        }
        else
        {
          uint64_t v87 = v471.i64[0];
          (*(void (**)(uint64_t, void, uint64_t))(v469 + 104))(v471.i64[0], *MEMORY[0x263F1B388], v470.i64[0]);
          id v36 = v474[0];
          id v88 = v474[0];
          uint64_t v38 = MEMORY[0x263E4C7A0](v87, 0.862745098, 0.549019608, 0.882352941, 1.0);
        }
        swift_retain();
        uint64_t v48 = 16;
        goto LABEL_35;
      }
    }
    uint64_t v32 = 0;
    uint64_t v48 = 0;
    id v36 = 0;
    uint64_t KeyPath = 0;
    uint64_t v38 = 0;
LABEL_35:
    uint64_t v458 = KeyPath;
    v470.i64[0] = v33;
    v471.i64[0] = v32;
    v472.i64[0] = v38;
    v490.i64[0] = v33;
    v490.i64[1] = v32;
    *(void *)v491 = 0;
    *(void *)&v491[8] = v48;
    *(void *)&v491[16] = v36;
    *(void *)&v491[24] = 0;
    *(void *)&v491[32] = 0;
    *(void *)&v491[40] = KeyPath;
    *(void *)&v491[48] = 0;
    *(void *)&v491[56] = v38;
    v491[64] = 0;
    v474[0] = (id)v48;
    sub_261B67A18(v33, v32, 0, v48, v36, 0, 0, KeyPath, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948458);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948478);
    sub_261B66A28();
    sub_261B66AC0();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(void *)&v491[72] = 0;
    *(void *)&v491[80] = 0;
    *(void *)&v491[64] = v487[48];
    LOWORD(v492) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948448);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948498);
    sub_261B669AC();
    sub_261B66B58();
    sub_261B8DD68();
    if (HIBYTE(v482)) {
      __int16 v89 = 256;
    }
    else {
      __int16 v89 = 0;
    }
    int64x2_t v490 = (int64x2_t)v475;
    *(_OWORD *)v491 = v476;
    *(_OWORD *)&v491[16] = v477;
    *(_OWORD *)&v491[32] = v478;
    *(_OWORD *)&v491[48] = v479;
    *(_OWORD *)&v491[64] = v480;
    *(void *)&v491[80] = v481;
    LOWORD(v492) = v89 | v482;
    BYTE2(v492) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948438);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484C8);
    sub_261B66930();
    sub_261B66C6C();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    *(void *)&v491[80] = *(void *)&v487[64];
    LOWORD(v492) = v488;
    HIWORD(v492) = BYTE2(v488) != 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
    sub_261B668B4();
    sub_261B670BC();
    sub_261B8DD68();
    uint64_t v90 = *((void *)&v480 + 1);
    uint64_t v459 = v480;
    uint64_t v460 = *((void *)&v479 + 1);
    uint64_t v91 = v481;
    int v92 = v482 | (v483 << 16);
    char v93 = v484;
    if (v484) {
      int v94 = 0x1000000;
    }
    else {
      int v94 = 0;
    }
    *(void *)&long long v469 = v475;
    int64x2_t v485 = (int64x2_t)v475;
    uint64_t v467 = v476;
    v468.i64[0] = *((void *)&v475 + 1);
    long long v486 = v476;
    uint64_t v465 = v477;
    uint64_t v466 = *((void *)&v476 + 1);
    *(_OWORD *)v487 = v477;
    uint64_t v463 = v478;
    uint64_t v464 = *((void *)&v477 + 1);
    *(_OWORD *)&v487[16] = v478;
    uint64_t v461 = v479;
    uint64_t v462 = *((void *)&v478 + 1);
    *(_OWORD *)&v487[32] = v479;
    *(_OWORD *)&v487[48] = v480;
    *(void *)&v487[64] = v481;
    int v488 = v94 | v92;
    char v489 = 0;
    sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
    sub_261B66838();
    sub_261B67754();
    sub_261B8DD68();
    sub_261B682AC((void *)v470.i64[0], v471.i64[0], 0, (uint64_t)v474[0], v36, 0, 0, v458, 0);
    sub_261B680F0(v469, v468.i64[0], v467, v466, v465, v464, v463, v462, v461, v460, v459, v90, v91, v92, SBYTE2(v92), SHIBYTE(v92), v93);
    goto LABEL_106;
  }
  uint64_t v454 = a1;
  if (v29 == *MEMORY[0x263F87C20])
  {
    uint64_t v39 = sub_261B8BBD8();
    if (v40)
    {
      id v45 = 0;
      uint64_t v61 = 0;
      id v42 = 0;
    }
    else
    {
      uint64_t v41 = v39;
      id v42 = (void *)sub_261B8BB98();
      if (v42)
      {
        uint64_t v43 = swift_getKeyPath();
        uint64_t v44 = v472.i64[0];
        if (v472.i64[0])
        {
          id v45 = v474[0];
          id v46 = v474[0];
          uint64_t v47 = v44;
LABEL_53:
          swift_retain();
          uint64_t v61 = 8;
          goto LABEL_54;
        }
        uint64_t v104 = self;
        id v45 = v474[0];
        id v105 = v474[0];
        id v106 = v42;
        id v107 = objc_msgSend(v104, sel_paceColors);
        if (v107)
        {
          uint64_t v108 = v107;
          id v109 = objc_msgSend(v107, sel_nonGradientTextColor);

          if (v109)
          {
            uint64_t v47 = MEMORY[0x263E4C7B0](v109);

            goto LABEL_53;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        goto LABEL_306;
      }
      id v45 = 0;
      uint64_t v61 = 0;
    }
    uint64_t v43 = 0;
    uint64_t v41 = 0;
    uint64_t v47 = 0;
LABEL_54:
    *(void *)&long long v469 = v43;
    v470.i64[0] = (uint64_t)v42;
    v471.i64[0] = v41;
    v474[0] = v45;
    v490.i64[0] = (uint64_t)v45;
    v490.i64[1] = v61;
    *(void *)v491 = v42;
    *(void *)&v491[8] = v43;
    *(void *)&v491[16] = 0;
    *(void *)&v491[24] = v41;
    memset(&v491[32], 0, 24);
    *(void *)&v491[56] = v47;
    v491[64] = 1;
    v472.i64[0] = v61;
    sub_261B67A90(v45, v61, v42, v43, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948458);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948478);
    sub_261B66A28();
    sub_261B66AC0();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(void *)&v491[72] = 0;
    *(void *)&v491[80] = 0;
    *(void *)&v491[64] = v487[48];
    LOWORD(v492) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948448);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948498);
    sub_261B669AC();
    sub_261B66B58();
    sub_261B8DD68();
    if (HIBYTE(v482)) {
      __int16 v110 = 256;
    }
    else {
      __int16 v110 = 0;
    }
    int64x2_t v490 = (int64x2_t)v475;
    *(_OWORD *)v491 = v476;
    *(_OWORD *)&v491[16] = v477;
    *(_OWORD *)&v491[32] = v478;
    *(_OWORD *)&v491[48] = v479;
    *(_OWORD *)&v491[64] = v480;
    *(void *)&v491[80] = v481;
    LOWORD(v492) = v110 | v482;
    BYTE2(v492) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948438);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484C8);
    sub_261B66930();
    sub_261B66C6C();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    *(void *)&v491[80] = *(void *)&v487[64];
    LOWORD(v492) = v488;
    HIWORD(v492) = BYTE2(v488) != 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
    sub_261B668B4();
    sub_261B670BC();
    sub_261B8DD68();
    uint64_t v111 = *((void *)&v480 + 1);
    uint64_t v458 = v480;
    uint64_t v459 = *((void *)&v479 + 1);
    uint64_t v112 = v481;
    int v113 = v482 | (v483 << 16);
    char v114 = v484;
    if (v484) {
      int v115 = 0x1000000;
    }
    else {
      int v115 = 0;
    }
    uint64_t v467 = *((void *)&v475 + 1);
    v468.i64[0] = v475;
    int64x2_t v485 = (int64x2_t)v475;
    uint64_t v465 = *((void *)&v476 + 1);
    uint64_t v466 = v476;
    long long v486 = v476;
    uint64_t v463 = *((void *)&v477 + 1);
    uint64_t v464 = v477;
    *(_OWORD *)v487 = v477;
    uint64_t v461 = *((void *)&v478 + 1);
    uint64_t v462 = v478;
    *(_OWORD *)&v487[16] = v478;
    uint64_t v460 = v479;
    *(_OWORD *)&v487[32] = v479;
    *(_OWORD *)&v487[48] = v480;
    *(void *)&v487[64] = v481;
    int v488 = v115 | v113;
    char v489 = 0;
    sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
    sub_261B66838();
    sub_261B67754();
    sub_261B8DD68();
    sub_261B68324(v474[0], v472.i64[0], (void *)v470.i64[0], v469, 0);
    v449[4] = v114;
    *(_DWORD *)uint64_t v449 = v113;
    *((void *)&v447 + 1) = v111;
    uint64_t v448 = v112;
    *(void *)&long long v447 = v458;
LABEL_61:
    sub_261B680F0(v468.i64[0], v467, v466, v465, v464, v463, v462, v461, v460, v459, v447, *((uint64_t *)&v447 + 1), v448, *(__int16 *)v449, v449[2], v449[3], v449[4]);
LABEL_106:
    int64x2_t v183 = v490;
    int64x2_t v184 = *(int64x2_t *)v491;
    int64x2_t v185 = *(int64x2_t *)&v491[16];
    int64x2_t v186 = *(int64x2_t *)&v491[32];
    int64x2_t v187 = *(int64x2_t *)&v491[48];
    int64x2_t v188 = *(int64x2_t *)&v491[64];
LABEL_107:
    uint64_t v189 = *(void *)&v491[80];
    int v190 = v492;
    char v191 = v493;
LABEL_108:
    unsigned int v192 = v473;
    int64x2_t *v473 = v183;
    v192[1] = v184;
    v192[2] = v185;
    v192[3] = v186;
    v192[4] = v187;
    v192[5] = v188;
    v192[6].i64[0] = v189;
    v192[6].i32[2] = v190;
    v192[6].i8[12] = v191;
    return;
  }
  if (v29 == *MEMORY[0x263F87C30])
  {
    uint64_t v49 = sub_261B8BBD8();
    if (v50)
    {
      uint64_t v52 = 0;
    }
    else
    {
      uint64_t v51 = v49;
      uint64_t v52 = (void *)sub_261B8BB98();
      if (v52)
      {
        uint64_t v53 = swift_getKeyPath();
        uint64_t v54 = swift_getKeyPath();
        uint64_t v55 = swift_getKeyPath();
        uint64_t v56 = v55;
        uint64_t v57 = v472.i64[0];
        if (v472.i64[0])
        {
          id v58 = v474[0];
          id v59 = v474[0];
          uint64_t v60 = v57;
LABEL_78:
          swift_retain();
          uint64_t v71 = 12;
          goto LABEL_79;
        }
        v471.i64[0] = v55;
        v143 = self;
        id v58 = v474[0];
        id v144 = v474[0];
        id v145 = v52;
        id v146 = objc_msgSend(v143, sel_powerColors);
        id v147 = objc_msgSend(v146, sel_nonGradientTextColor);

        if (v147)
        {
          uint64_t v60 = MEMORY[0x263E4C7B0](v147);

          uint64_t v56 = v471.i64[0];
          goto LABEL_78;
        }
        __break(1u);
        goto LABEL_308;
      }
    }
    uint64_t v51 = 0;
    uint64_t v71 = 0;
    id v58 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    uint64_t v56 = 0;
    uint64_t v60 = 0;
LABEL_79:
    v474[0] = v58;
    uint64_t v467 = v54;
    v468.i64[0] = (uint64_t)v52;
    *(void *)&long long v469 = v53;
    v470.i64[0] = v60;
    v471.i64[0] = v56;
    v490.i64[0] = (uint64_t)v52;
    v490.i64[1] = v51;
    *(void *)v491 = 0;
    *(void *)&v491[8] = v71;
    *(void *)&v491[16] = v58;
    *(void *)&v491[24] = 0;
    *(void *)&v491[32] = v53;
    *(void *)&v491[40] = 0;
    *(void *)&v491[48] = v54;
    *(void *)&v491[56] = 0;
    *(void *)&v491[64] = v56;
    *(void *)&v491[72] = 0;
    *(void *)&v491[80] = v60;
    LOBYTE(v492) = 0;
    v472.i64[0] = v71;
    sub_261B67B30(v52, v51, 0, v71, v58, 0, v53, 0, v54, 0, v56, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484A8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948458);
    sub_261B66BD4();
    sub_261B66A28();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    *(void *)&v491[80] = *(void *)&v487[64];
    LOBYTE(v492) = v488;
    BYTE1(v492) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948448);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948498);
    sub_261B669AC();
    sub_261B66B58();
    sub_261B8DD68();
    if (HIBYTE(v482)) {
      __int16 v148 = 256;
    }
    else {
      __int16 v148 = 0;
    }
    int64x2_t v490 = (int64x2_t)v475;
    *(_OWORD *)v491 = v476;
    *(_OWORD *)&v491[16] = v477;
    *(_OWORD *)&v491[32] = v478;
    *(_OWORD *)&v491[48] = v479;
    *(_OWORD *)&v491[64] = v480;
    *(void *)&v491[80] = v481;
    LOWORD(v492) = v148 | v482;
    BYTE2(v492) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948438);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484C8);
    sub_261B66930();
    sub_261B66C6C();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    *(void *)&v491[80] = *(void *)&v487[64];
    LOWORD(v492) = v488;
    HIWORD(v492) = BYTE2(v488) != 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
    sub_261B668B4();
    sub_261B670BC();
    sub_261B8DD68();
    uint64_t v149 = *((void *)&v480 + 1);
    uint64_t v456 = v480;
    uint64_t v457 = *((void *)&v479 + 1);
    uint64_t v150 = v481;
    int v151 = v482 | (v483 << 16);
    char v152 = v484;
    if (v484) {
      int v153 = 0x1000000;
    }
    else {
      int v153 = 0;
    }
    uint64_t v465 = *((void *)&v475 + 1);
    uint64_t v466 = v475;
    int64x2_t v485 = (int64x2_t)v475;
    uint64_t v463 = *((void *)&v476 + 1);
    uint64_t v464 = v476;
    long long v486 = v476;
    uint64_t v461 = *((void *)&v477 + 1);
    uint64_t v462 = v477;
    *(_OWORD *)v487 = v477;
    uint64_t v459 = *((void *)&v478 + 1);
    uint64_t v460 = v478;
    *(_OWORD *)&v487[16] = v478;
    uint64_t v458 = v479;
    *(_OWORD *)&v487[32] = v479;
    *(_OWORD *)&v487[48] = v480;
    *(void *)&v487[64] = v481;
    int v488 = v153 | v151;
    char v489 = 0;
    sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
    sub_261B66838();
    sub_261B67754();
    sub_261B8DD68();
    sub_261B683C4((void *)v468.i64[0], v51, 0, v472.i64[0], v474[0], 0, v469, 0, v467, 0, v471.i64[0], 0);
    sub_261B680F0(v466, v465, v464, v463, v462, v461, v460, v459, v458, v457, v456, v149, v150, v151, SBYTE2(v151), SHIBYTE(v151), v152);
    goto LABEL_106;
  }
  if (v29 == *MEMORY[0x263F87C80])
  {
    uint64_t v62 = sub_261B8BBD8();
    uint64_t v63 = v472.i64[0];
    if (v64)
    {
      uint64_t v66 = 0;
    }
    else
    {
      uint64_t v65 = v62;
      uint64_t v66 = sub_261B8BB98();
      if (v66)
      {
        uint64_t v67 = swift_getKeyPath();
        if (v63)
        {
          id v68 = v474[0];
          id v69 = v474[0];
          uint64_t v70 = v63;
        }
        else
        {
          uint64_t v174 = v471.i64[0];
          (*(void (**)(uint64_t, void, uint64_t))(v469 + 104))(v471.i64[0], *MEMORY[0x263F1B388], v470.i64[0]);
          id v68 = v474[0];
          id v175 = v474[0];
          uint64_t v70 = MEMORY[0x263E4C7A0](v174, 0.862745098, 0.549019608, 0.882352941, 1.0);
        }
        swift_retain();
        uint64_t v95 = 15;
        goto LABEL_98;
      }
    }
    uint64_t v65 = 0;
    uint64_t v95 = 0;
    id v68 = 0;
    uint64_t v67 = 0;
    uint64_t v70 = 0;
LABEL_98:
    v468.i64[0] = v67;
    *(void *)&long long v469 = v66;
    v474[0] = v68;
    v470.i64[0] = v65;
    v471.i64[0] = v70;
    v490.i64[0] = v66;
    v490.i64[1] = v65;
    *(void *)v491 = 0;
    *(void *)&v491[8] = v95;
    *(void *)&v491[16] = v68;
    *(void *)&v491[24] = 0;
    *(void *)&v491[32] = 0;
    *(void *)&v491[40] = v67;
    *(void *)&v491[48] = 0;
    *(void *)&v491[56] = v70;
    memset(&v491[64], 0, 24);
    LOBYTE(v492) = 1;
    v472.i64[0] = v95;
    sub_261B67A18(v66, v65, 0, v95, v68, 0, 0, v67, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484A8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948458);
    sub_261B66BD4();
    sub_261B66A28();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    *(void *)&v491[80] = *(void *)&v487[64];
    LOBYTE(v492) = v488;
    BYTE1(v492) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948448);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948498);
    sub_261B669AC();
    sub_261B66B58();
    sub_261B8DD68();
    if (HIBYTE(v482)) {
      __int16 v176 = 256;
    }
    else {
      __int16 v176 = 0;
    }
    int64x2_t v490 = (int64x2_t)v475;
    *(_OWORD *)v491 = v476;
    *(_OWORD *)&v491[16] = v477;
    *(_OWORD *)&v491[32] = v478;
    *(_OWORD *)&v491[48] = v479;
    *(_OWORD *)&v491[64] = v480;
    *(void *)&v491[80] = v481;
    LOWORD(v492) = v176 | v482;
    BYTE2(v492) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948438);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484C8);
    sub_261B66930();
    sub_261B66C6C();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    *(void *)&v491[80] = *(void *)&v487[64];
    LOWORD(v492) = v488;
    HIWORD(v492) = BYTE2(v488) != 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
    sub_261B668B4();
    sub_261B670BC();
    sub_261B8DD68();
    uint64_t v458 = *((void *)&v479 + 1);
    uint64_t v178 = *((void *)&v480 + 1);
    uint64_t v177 = v480;
    uint64_t v179 = v481;
    int v180 = v482 | (v483 << 16);
    char v181 = v484;
    if (v484) {
      int v182 = 0x1000000;
    }
    else {
      int v182 = 0;
    }
    uint64_t v466 = *((void *)&v475 + 1);
    uint64_t v467 = v475;
    int64x2_t v485 = (int64x2_t)v475;
    uint64_t v464 = *((void *)&v476 + 1);
    uint64_t v465 = v476;
    long long v486 = v476;
    uint64_t v462 = *((void *)&v477 + 1);
    uint64_t v463 = v477;
    *(_OWORD *)v487 = v477;
    uint64_t v460 = *((void *)&v478 + 1);
    uint64_t v461 = v478;
    *(_OWORD *)&v487[16] = v478;
    uint64_t v459 = v479;
    *(_OWORD *)&v487[32] = v479;
    *(_OWORD *)&v487[48] = v480;
    *(void *)&v487[64] = v481;
    int v488 = v182 | v180;
    char v489 = 0;
    sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
    sub_261B66838();
    sub_261B67754();
    sub_261B8DD68();
    sub_261B682AC((void *)v469, v470.i64[0], 0, v472.i64[0], v474[0], 0, 0, v468.i64[0], 0);
LABEL_105:
    sub_261B680F0(v467, v466, v465, v464, v463, v462, v461, v460, v459, v458, v177, v178, v179, v180, SBYTE2(v180), SHIBYTE(v180), v181);
    goto LABEL_106;
  }
  if (v29 == *MEMORY[0x263F87C90])
  {
    uint64_t v72 = sub_261B8BBD8();
    if (v73)
    {
      uint64_t v74 = 0;
      id v75 = 0;
      uint64_t v86 = 0;
      unint64_t v78 = 0;
      uint64_t v85 = 0;
      uint64_t v81 = 0;
    }
    else
    {
      uint64_t v74 = v72;
      id v75 = v474[0];
      unint64_t v76 = sub_261B8BBB8();
      unint64_t v78 = sub_261B6926C(v76, v77);
      char v80 = v79;
      swift_bridgeObjectRelease();
      uint64_t v81 = v472.i64[0];
      if (!v472.i64[0])
      {
        id v82 = objc_msgSend(self, sel_distanceColors);
        if (!v82)
        {
LABEL_308:
          __break(1u);
          goto LABEL_309;
        }
        uint64_t v83 = v82;
        id v84 = objc_msgSend(v82, sel_nonGradientTextColor);

        if (!v84)
        {
LABEL_309:
          __break(1u);
          goto LABEL_310;
        }
        uint64_t v81 = MEMORY[0x263E4C7B0](v84);
      }
      uint64_t v85 = v80 & 1;
      swift_retain();
      uint64_t v86 = 1;
    }
    v471.i64[0] = v81;
    v472.i64[0] = v85;
    v490.i64[0] = v74;
    v490.i64[1] = (uint64_t)v75;
    *(void *)v491 = v86;
    *(void *)&v491[8] = v78;
    *(void *)&v491[16] = v85;
    *(void *)&v491[24] = 0;
    *(void *)&v491[32] = 0;
    *(void *)&v491[40] = v81;
    v491[48] = 0;
    v474[0] = (id)v86;
    sub_261B67BDC(v74, v75);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948508);
    sub_261B66D64();
    sub_261B66DFC();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(void *)&v491[48] = v487[32];
    memset(&v491[56], 0, 26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484D8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948528);
    sub_261B66CE8();
    sub_261B66E94();
    sub_261B8DD68();
    uint64_t v116 = 256;
    if (!BYTE1(v481)) {
      uint64_t v116 = 0;
    }
    int64x2_t v490 = (int64x2_t)v475;
    *(_OWORD *)v491 = v476;
    *(_OWORD *)&v491[16] = v477;
    *(_OWORD *)&v491[32] = v478;
    *(_OWORD *)&v491[48] = v479;
    *(_OWORD *)&v491[64] = v480;
    *(void *)&v491[80] = v116 | v481;
    LOWORD(v492) = 0;
    BYTE2(v492) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948438);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484C8);
    sub_261B66930();
    sub_261B66C6C();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    *(void *)&v491[80] = *(void *)&v487[64];
    LOWORD(v492) = v488;
    HIWORD(v492) = BYTE2(v488) != 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
    sub_261B668B4();
    sub_261B670BC();
    sub_261B8DD68();
    uint64_t v460 = v480;
    uint64_t v461 = *((void *)&v479 + 1);
    uint64_t v458 = v481;
    uint64_t v459 = *((void *)&v480 + 1);
    int v117 = v482 | (v483 << 16);
    char v118 = v484;
    if (v484) {
      int v119 = 0x1000000;
    }
    else {
      int v119 = 0;
    }
    v470.i64[0] = v475;
    int64x2_t v485 = (int64x2_t)v475;
    *(void *)&long long v469 = *((void *)&v475 + 1);
    uint64_t v467 = *((void *)&v476 + 1);
    v468.i64[0] = v476;
    long long v486 = v476;
    uint64_t v465 = *((void *)&v477 + 1);
    uint64_t v466 = v477;
    *(_OWORD *)v487 = v477;
    uint64_t v463 = *((void *)&v478 + 1);
    uint64_t v464 = v478;
    *(_OWORD *)&v487[16] = v478;
    uint64_t v462 = v479;
    *(_OWORD *)&v487[32] = v479;
    *(_OWORD *)&v487[48] = v480;
    *(void *)&v487[64] = v481;
    int v488 = v119 | v117;
    char v489 = 0;
    sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
    sub_261B66838();
    sub_261B67754();
    sub_261B8DD68();
    sub_261B684B8(v74, v75);
    sub_261B680F0(v470.i64[0], v469, v468.i64[0], v467, v466, v465, v464, v463, v462, v461, v460, v459, v458, v117, SBYTE2(v117), SHIBYTE(v117), v118);
    goto LABEL_106;
  }
  if (v29 == *MEMORY[0x263F87C70])
  {
    uint64_t v96 = sub_261B8BBD8();
    id v97 = v474[0];
    if (v98)
    {
      uint64_t v99 = 0;
      uint64_t v154 = 0;
      id v97 = 0;
      uint64_t v100 = 0;
      uint64_t v103 = 0;
LABEL_118:
      *(void *)&long long v469 = v100;
      v470.i64[0] = v99;
      v474[0] = v97;
      v471.i64[0] = v103;
      v490.i64[0] = v99;
      v490.i64[1] = v154;
      *(void *)v491 = v154;
      *(void *)&v491[8] = v97;
      *(void *)&v491[16] = v100;
      *(void *)&v491[24] = 0;
      *(void *)&v491[32] = v103;
      *(void *)&v491[40] = 0;
      v491[48] = 1;
      v472.i64[0] = v154;
      sub_261B67C34(v99, v154, v154, v97, v100, 0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484E8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948508);
      sub_261B66D64();
      sub_261B66DFC();
      sub_261B8DD68();
      int64x2_t v490 = v485;
      *(_OWORD *)v491 = v486;
      *(_OWORD *)&v491[16] = *(_OWORD *)v487;
      *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
      *(void *)&v491[48] = v487[32];
      memset(&v491[56], 0, 26);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484D8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948528);
      sub_261B66CE8();
      sub_261B66E94();
      sub_261B8DD68();
      uint64_t v203 = 256;
      if (!BYTE1(v481)) {
        uint64_t v203 = 0;
      }
      int64x2_t v490 = (int64x2_t)v475;
      *(_OWORD *)v491 = v476;
      *(_OWORD *)&v491[16] = v477;
      *(_OWORD *)&v491[32] = v478;
      *(_OWORD *)&v491[48] = v479;
      *(_OWORD *)&v491[64] = v480;
      *(void *)&v491[80] = v203 | v481;
      LOWORD(v492) = 0;
      BYTE2(v492) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948438);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484C8);
      sub_261B66930();
      sub_261B66C6C();
      sub_261B8DD68();
      int64x2_t v490 = v485;
      *(_OWORD *)v491 = v486;
      *(_OWORD *)&v491[16] = *(_OWORD *)v487;
      *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
      *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
      *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
      *(void *)&v491[80] = *(void *)&v487[64];
      LOWORD(v492) = v488;
      HIWORD(v492) = BYTE2(v488) != 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
      sub_261B668B4();
      sub_261B670BC();
      sub_261B8DD68();
      uint64_t v459 = *((void *)&v479 + 1);
      long long v204 = v480;
      uint64_t v205 = v481;
      int v206 = v482 | (v483 << 16);
      char v207 = v484;
      if (v484) {
        int v208 = 0x1000000;
      }
      else {
        int v208 = 0;
      }
      uint64_t v467 = *((void *)&v475 + 1);
      v468.i64[0] = v475;
      int64x2_t v485 = (int64x2_t)v475;
      uint64_t v465 = *((void *)&v476 + 1);
      uint64_t v466 = v476;
      long long v486 = v476;
      uint64_t v463 = *((void *)&v477 + 1);
      uint64_t v464 = v477;
      *(_OWORD *)v487 = v477;
      uint64_t v461 = *((void *)&v478 + 1);
      uint64_t v462 = v478;
      *(_OWORD *)&v487[16] = v478;
      uint64_t v460 = v479;
      *(_OWORD *)&v487[32] = v479;
      *(_OWORD *)&v487[48] = v480;
      *(void *)&v487[64] = v481;
      int v488 = v208 | v206;
      char v489 = 0;
      sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
      sub_261B66838();
      sub_261B67754();
      sub_261B8DD68();
      sub_261B68504(v470.i64[0], v472.i64[0], v472.i64[0], v474[0], v469, 0);
      v449[4] = v207;
      *(_DWORD *)uint64_t v449 = v206;
      uint64_t v448 = v205;
      long long v447 = v204;
      goto LABEL_61;
    }
    uint64_t v99 = v96;
    uint64_t v100 = swift_getKeyPath();
    uint64_t v101 = v472.i64[0];
    if (v472.i64[0])
    {
      id v102 = v97;
      uint64_t v103 = v101;
LABEL_117:
      swift_retain();
      uint64_t v154 = 1;
      goto LABEL_118;
    }
    uint64_t v198 = self;
    id v199 = v97;
    id v200 = objc_msgSend(v198, sel_energyColors);
    if (v200)
    {
      uint64_t v201 = v200;
      id v202 = objc_msgSend(v200, sel_nonGradientTextColor);

      if (v202)
      {
        uint64_t v103 = MEMORY[0x263E4C7B0](v202);
        goto LABEL_117;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_313;
  }
  if (v29 == *MEMORY[0x263F87C88])
  {
    sub_261B8BBB8();
    if (v120)
    {
      if (qword_26B416690 != -1) {
        swift_once();
      }
      swift_beginAccess();
      id v121 = (id)qword_26B416688;
      uint64_t v122 = sub_261B8AA48();
      uint64_t v124 = v123;
      swift_bridgeObjectRelease();

      v490.i64[0] = v122;
      v490.i64[1] = v124;
      sub_261A029C4();
      uint64_t v125 = sub_261B8F768();
      uint64_t v127 = v126;
      swift_bridgeObjectRelease();
      double v128 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
      v490.i64[0] = v125;
      v490.i64[1] = v127;
      uint64_t v129 = sub_261B8E3D8();
      uint64_t v131 = v130;
      uint64_t v133 = v132;
      uint64_t v135 = v134 & 1;
      uint64_t v136 = v472.i64[0];
      if (!v472.i64[0]) {
        uint64_t v136 = sub_261B8E898();
      }
      uint64_t v137 = *(void *)&v128;
      swift_retain();
      uint64_t v138 = 0x4036000000000000;
      uint64_t v139 = 0x4068B00000000000;
      uint64_t v140 = 0x4028000000000000;
      uint64_t v141 = 0x4020000000000000;
      unint64_t v142 = 0xC000000000000000;
    }
    else
    {
      uint64_t v129 = 0;
      uint64_t v131 = 0;
      uint64_t v135 = 0;
      uint64_t v133 = 0;
      uint64_t v137 = 0;
      unint64_t v142 = 0;
      uint64_t v141 = 0;
      uint64_t v140 = 0;
      uint64_t v139 = 0;
      uint64_t v138 = 0;
      uint64_t v136 = 0;
    }
    uint64_t v463 = v136;
    uint64_t v464 = v137;
    uint64_t v465 = v135;
    uint64_t v466 = v133;
    uint64_t v467 = v131;
    v468.i64[0] = v129;
    *(void *)&long long v469 = v138;
    v470.i64[0] = v139;
    v490.i64[0] = v129;
    v490.i64[1] = v131;
    *(void *)v491 = v135;
    *(void *)&v491[8] = v133;
    *(void *)&v491[16] = v137;
    *(void *)&v491[24] = v142;
    *(void *)&v491[32] = v141;
    *(void *)&v491[40] = v140;
    *(void *)&v491[48] = v139;
    *(void *)&v491[56] = 0;
    *(void *)&v491[64] = v138;
    *(void *)&v491[72] = v136;
    v491[80] = 0;
    v471.i64[0] = v142;
    v472.i64[0] = v141;
    v474[0] = (id)v140;
    sub_261B67CBC(v129, v131, v135, v133);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948538);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948568);
    sub_261B67468(&qword_26A948530, &qword_26A948538, (void (*)(void))sub_261B66F58);
    sub_261B67468(&qword_26A948560, &qword_26A948568, (void (*)(void))sub_261B6701C);
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    v491[80] = v487[64];
    v491[81] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484D8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948528);
    sub_261B66CE8();
    sub_261B66E94();
    sub_261B8DD68();
    uint64_t v209 = 256;
    if (!BYTE1(v481)) {
      uint64_t v209 = 0;
    }
    int64x2_t v490 = (int64x2_t)v475;
    *(_OWORD *)v491 = v476;
    *(_OWORD *)&v491[16] = v477;
    *(_OWORD *)&v491[32] = v478;
    *(_OWORD *)&v491[48] = v479;
    *(_OWORD *)&v491[64] = v480;
    *(void *)&v491[80] = v209 | v481;
    LOWORD(v492) = 0;
    BYTE2(v492) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948438);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484C8);
    sub_261B66930();
    sub_261B66C6C();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    *(void *)&v491[80] = *(void *)&v487[64];
    LOWORD(v492) = v488;
    HIWORD(v492) = BYTE2(v488) != 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
    sub_261B668B4();
    sub_261B670BC();
    sub_261B8DD68();
    uint64_t v453 = *((void *)&v479 + 1);
    long long v210 = v480;
    uint64_t v211 = v481;
    int v212 = v482 | (v483 << 16);
    char v213 = v484;
    if (v484) {
      int v214 = 0x1000000;
    }
    else {
      int v214 = 0;
    }
    uint64_t v461 = *((void *)&v475 + 1);
    uint64_t v462 = v475;
    int64x2_t v485 = (int64x2_t)v475;
    uint64_t v459 = *((void *)&v476 + 1);
    uint64_t v460 = v476;
    long long v486 = v476;
    uint64_t v457 = *((void *)&v477 + 1);
    uint64_t v458 = v477;
    *(_OWORD *)v487 = v477;
    uint64_t v455 = *((void *)&v478 + 1);
    uint64_t v456 = v478;
    *(_OWORD *)&v487[16] = v478;
    uint64_t v454 = v479;
    *(_OWORD *)&v487[32] = v479;
    *(_OWORD *)&v487[48] = v480;
    *(void *)&v487[64] = v481;
    int v488 = v214 | v212;
    char v489 = 0;
    sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
    sub_261B66838();
    sub_261B67754();
    sub_261B8DD68();
    sub_261B6858C(v468.i64[0], v467, v465, v466);
    sub_261B680F0(v462, v461, v460, v459, v458, v457, v456, v455, v454, v453, v210, *((uint64_t *)&v210 + 1), v211, v212, SBYTE2(v212), SHIBYTE(v212), v213);
    goto LABEL_106;
  }
  if (v29 == *MEMORY[0x263F87CA0])
  {
    uint64_t v155 = sub_261B8BBD8();
    if (v156)
    {
      uint64_t v163 = 0;
      uint64_t v164 = 0;
      uint64_t v166 = 0;
      uint64_t v168 = 0;
      uint64_t v173 = 0;
      uint64_t v169 = 0;
    }
    else
    {
      v485.i64[0] = v155;
      sub_261B8AE68();
      sub_261A63D24();
      sub_261B8AAE8();
      uint64_t v158 = v466;
      uint64_t v157 = v467;
      uint64_t v159 = v468.i64[0];
      (*(void (**)(uint64_t, void, uint64_t))(v467 + 104))(v466, *MEMORY[0x263F8E220], v468.i64[0]);
      uint64_t v160 = v462;
      MEMORY[0x263E489F0](v158, 0, 1, v462);
      (*(void (**)(uint64_t, uint64_t))(v157 + 8))(v158, v159);
      os_log_type_t v161 = *(void (**)(void, void))(v461 + 8);
      v161(v16, v160);
      uint64_t v162 = v463;
      sub_261B8AB98();
      MEMORY[0x263E48A00](v162, v160);
      (*(void (**)(uint64_t, uint64_t))(v464 + 8))(v162, v465);
      v161(v19, v160);
      sub_2619F8AB8((unint64_t *)&qword_26A945408, &qword_26A9453F8);
      sub_261B8EFD8();
      v161(v22, v160);
      uint64_t v164 = v490.i64[1];
      uint64_t v163 = v490.i64[0];
      if (qword_26B416690 != -1) {
        swift_once();
      }
      swift_beginAccess();
      id v165 = (id)qword_26B416688;
      uint64_t v166 = sub_261B8AA48();
      uint64_t v168 = v167;

      uint64_t v169 = v472.i64[0];
      if (!v472.i64[0])
      {
        id v170 = objc_msgSend(self, sel_heartRateColors);
        if (!v170)
        {
LABEL_316:
          __break(1u);
          goto LABEL_317;
        }
        uint64_t v171 = v170;
        id v172 = objc_msgSend(v170, sel_nonGradientTextColor);

        if (!v172)
        {
LABEL_317:
          __break(1u);
LABEL_318:
          __break(1u);
          goto LABEL_319;
        }
        uint64_t v169 = MEMORY[0x263E4C7B0](v172);
      }
      uint64_t v173 = swift_getKeyPath();
      swift_retain();
    }
    v468.i64[0] = v168;
    *(void *)&long long v469 = v164;
    v470.i64[0] = v173;
    v471.i64[0] = v169;
    v490.i64[0] = v163;
    v490.i64[1] = v164;
    v474[0] = (id)v163;
    *(void *)v491 = v166;
    *(void *)&v491[8] = v168;
    v472.i64[0] = v166;
    memset(&v491[16], 0, 40);
    *(void *)&v491[56] = v173;
    *(void *)&v491[64] = v169;
    *(void *)&v491[72] = 0;
    v491[80] = 1;
    sub_261B67D0C(v163, v164);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948538);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948568);
    sub_261B67468(&qword_26A948530, &qword_26A948538, (void (*)(void))sub_261B66F58);
    sub_261B67468(&qword_26A948560, &qword_26A948568, (void (*)(void))sub_261B6701C);
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    v491[80] = v487[64];
    v491[81] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484D8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948528);
    sub_261B66CE8();
    sub_261B66E94();
    sub_261B8DD68();
    uint64_t v215 = 256;
    if (!BYTE1(v481)) {
      uint64_t v215 = 0;
    }
    int64x2_t v490 = (int64x2_t)v475;
    *(_OWORD *)v491 = v476;
    *(_OWORD *)&v491[16] = v477;
    *(_OWORD *)&v491[32] = v478;
    *(_OWORD *)&v491[48] = v479;
    *(_OWORD *)&v491[64] = v480;
    *(void *)&v491[80] = v215 | v481;
    LOWORD(v492) = 0;
    BYTE2(v492) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948438);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484C8);
    sub_261B66930();
    sub_261B66C6C();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    *(void *)&v491[80] = *(void *)&v487[64];
    LOWORD(v492) = v488;
    HIWORD(v492) = BYTE2(v488) != 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
    sub_261B668B4();
    sub_261B670BC();
    sub_261B8DD68();
    uint64_t v458 = *((void *)&v479 + 1);
    long long v216 = v480;
    uint64_t v217 = v481;
    int v218 = v482 | (v483 << 16);
    char v219 = v484;
    if (v484) {
      int v220 = 0x1000000;
    }
    else {
      int v220 = 0;
    }
    uint64_t v466 = *((void *)&v475 + 1);
    uint64_t v467 = v475;
    int64x2_t v485 = (int64x2_t)v475;
    uint64_t v464 = *((void *)&v476 + 1);
    uint64_t v465 = v476;
    long long v486 = v476;
    uint64_t v462 = *((void *)&v477 + 1);
    uint64_t v463 = v477;
    *(_OWORD *)v487 = v477;
    uint64_t v460 = *((void *)&v478 + 1);
    uint64_t v461 = v478;
    *(_OWORD *)&v487[16] = v478;
    uint64_t v459 = v479;
    *(_OWORD *)&v487[32] = v479;
    *(_OWORD *)&v487[48] = v480;
    *(void *)&v487[64] = v481;
    int v488 = v220 | v218;
    char v489 = 0;
    sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
    sub_261B66838();
    sub_261B67754();
    sub_261B8DD68();
    sub_261B685DC((uint64_t)v474[0], v469);
    sub_261B680F0(v467, v466, v465, v464, v463, v462, v461, v460, v459, v458, v216, *((uint64_t *)&v216 + 1), v217, v218, SBYTE2(v218), SHIBYTE(v218), v219);
    goto LABEL_106;
  }
  if (v29 == *MEMORY[0x263F87C58])
  {
    sub_261B8BBB8();
    if (v193)
    {
      uint64_t v194 = sub_261B8E918();
      uint64_t v195 = v472.i64[0];
      if (!v472.i64[0]) {
        uint64_t v195 = sub_261B8E898();
      }
      uint64_t v196 = swift_getKeyPath();
      swift_retain();
      uint64_t v197 = 256;
    }
    else
    {
      uint64_t v194 = 0;
      uint64_t v195 = 0;
      uint64_t v197 = 0;
      uint64_t v196 = 0;
    }
    v471.i64[0] = v195;
    v472.i64[0] = v194;
    v490.i64[0] = v194;
    v490.i64[1] = v195;
    *(void *)v491 = v197;
    *(void *)&v491[8] = v196;
    memset(&v491[16], 0, 49);
    v474[0] = (id)v197;
    sub_261B67EE0(v194, v195, v197, v196, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485B8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948478);
    sub_261B67468(&qword_26A9485B0, &qword_26A9485B8, (void (*)(void))sub_261B67254);
    sub_261B66AC0();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(void *)&v491[72] = 0;
    *(void *)&v491[80] = 0;
    *(void *)&v491[64] = v487[48];
    LOWORD(v492) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485A8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485D8);
    sub_261B671B4();
    sub_261B672D0();
    sub_261B8DD68();
    if (HIBYTE(v482)) {
      __int16 v239 = 256;
    }
    else {
      __int16 v239 = 0;
    }
    int64x2_t v490 = (int64x2_t)v475;
    *(_OWORD *)v491 = v476;
    *(_OWORD *)&v491[16] = v477;
    *(_OWORD *)&v491[32] = v478;
    *(_OWORD *)&v491[48] = v479;
    *(_OWORD *)&v491[64] = v480;
    *(void *)&v491[80] = v481;
    LOWORD(v492) = v239 | v482;
    BYTE2(v492) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948598);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485E8);
    sub_261B67138();
    sub_261B6734C();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    *(void *)&v491[80] = *(void *)&v487[64];
    LOWORD(v492) = v488;
    BYTE2(v492) = BYTE2(v488) != 0;
    HIBYTE(v492) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
    sub_261B668B4();
    sub_261B670BC();
    sub_261B8DD68();
    uint64_t v240 = *((void *)&v480 + 1);
    uint64_t v460 = v480;
    uint64_t v461 = *((void *)&v479 + 1);
    uint64_t v241 = v481;
    int v242 = v482 | (v483 << 16);
    char v243 = v484;
    if (v484) {
      int v244 = 0x1000000;
    }
    else {
      int v244 = 0;
    }
    v470.i64[0] = v475;
    int64x2_t v485 = (int64x2_t)v475;
    *(void *)&long long v469 = *((void *)&v475 + 1);
    uint64_t v467 = *((void *)&v476 + 1);
    v468.i64[0] = v476;
    long long v486 = v476;
    uint64_t v465 = *((void *)&v477 + 1);
    uint64_t v466 = v477;
    *(_OWORD *)v487 = v477;
    uint64_t v463 = *((void *)&v478 + 1);
    uint64_t v464 = v478;
    *(_OWORD *)&v487[16] = v478;
    uint64_t v462 = v479;
    *(_OWORD *)&v487[32] = v479;
    *(_OWORD *)&v487[48] = v480;
    *(void *)&v487[64] = v481;
    int v488 = v244 | v242;
    char v489 = 0;
    sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
    sub_261B66838();
    sub_261B67754();
    sub_261B8DD68();
    sub_261B68754(v472.i64[0], v471.i64[0], (uint64_t)v474[0], v196, 0);
    sub_261B680F0(v470.i64[0], v469, v468.i64[0], v467, v466, v465, v464, v463, v462, v461, v460, v240, v241, v242, SBYTE2(v242), SHIBYTE(v242), v243);
    goto LABEL_106;
  }
  if (v29 == *MEMORY[0x263F87C48])
  {
    uint64_t v221 = sub_261B8BBD8();
    uint64_t v222 = v472.i64[0];
    if (v223)
    {
      id v227 = 0;
      uint64_t v245 = 0;
      uint64_t v225 = 0;
    }
    else
    {
      uint64_t v224 = v221;
      uint64_t v225 = (void *)sub_261B8BB98();
      if (v225)
      {
        uint64_t v226 = swift_getKeyPath();
        if (v222)
        {
          id v227 = v474[0];
          id v228 = v474[0];
          uint64_t v229 = v222;
        }
        else
        {
          uint64_t v283 = v224;
          v284 = self;
          id v285 = v474[0];
          v286 = v225;
          id v287 = v225;
          id v288 = objc_msgSend(v284, sel_paceColors);
          if (!v288)
          {
LABEL_321:
            __break(1u);
            goto LABEL_322;
          }
          v289 = v288;
          id v290 = objc_msgSend(v288, sel_nonGradientTextColor);

          if (!v290)
          {
LABEL_322:
            __break(1u);
            goto LABEL_323;
          }
          uint64_t v229 = MEMORY[0x263E4C7B0](v290);

          id v227 = v474[0];
          uint64_t v224 = v283;
          uint64_t v225 = v286;
        }
        swift_retain();
        uint64_t v245 = 4;
        goto LABEL_183;
      }
      id v227 = 0;
      uint64_t v245 = 0;
    }
    uint64_t v226 = 0;
    uint64_t v224 = 0;
    uint64_t v229 = 0;
LABEL_183:
    v468.i64[0] = v229;
    *(void *)&long long v469 = v226;
    v474[0] = v227;
    v470.i64[0] = v224;
    v471.i64[0] = (uint64_t)v225;
    v490.i64[0] = (uint64_t)v227;
    v490.i64[1] = v245;
    *(void *)v491 = v225;
    *(void *)&v491[8] = v226;
    *(void *)&v491[16] = 0;
    *(void *)&v491[24] = v224;
    memset(&v491[32], 0, 24);
    *(void *)&v491[56] = v229;
    v491[64] = 1;
    v472.i64[0] = v245;
    sub_261B67A90(v227, v245, v225, v226, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485B8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948478);
    sub_261B67468(&qword_26A9485B0, &qword_26A9485B8, (void (*)(void))sub_261B67254);
    sub_261B66AC0();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(void *)&v491[72] = 0;
    *(void *)&v491[80] = 0;
    *(void *)&v491[64] = v487[48];
    LOWORD(v492) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485A8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485D8);
    sub_261B671B4();
    sub_261B672D0();
    sub_261B8DD68();
    if (HIBYTE(v482)) {
      __int16 v291 = 256;
    }
    else {
      __int16 v291 = 0;
    }
    int64x2_t v490 = (int64x2_t)v475;
    *(_OWORD *)v491 = v476;
    *(_OWORD *)&v491[16] = v477;
    *(_OWORD *)&v491[32] = v478;
    *(_OWORD *)&v491[48] = v479;
    *(_OWORD *)&v491[64] = v480;
    *(void *)&v491[80] = v481;
    LOWORD(v492) = v291 | v482;
    BYTE2(v492) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948598);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485E8);
    sub_261B67138();
    sub_261B6734C();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    *(void *)&v491[80] = *(void *)&v487[64];
    LOWORD(v492) = v488;
    BYTE2(v492) = BYTE2(v488) != 0;
    HIBYTE(v492) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
    sub_261B668B4();
    sub_261B670BC();
    sub_261B8DD68();
    uint64_t v458 = *((void *)&v479 + 1);
    uint64_t v178 = *((void *)&v480 + 1);
    uint64_t v177 = v480;
    uint64_t v179 = v481;
    int v180 = v482 | (v483 << 16);
    char v181 = v484;
    if (v484) {
      int v292 = 0x1000000;
    }
    else {
      int v292 = 0;
    }
    uint64_t v466 = *((void *)&v475 + 1);
    uint64_t v467 = v475;
    int64x2_t v485 = (int64x2_t)v475;
    uint64_t v464 = *((void *)&v476 + 1);
    uint64_t v465 = v476;
    long long v486 = v476;
    uint64_t v462 = *((void *)&v477 + 1);
    uint64_t v463 = v477;
    *(_OWORD *)v487 = v477;
    uint64_t v460 = *((void *)&v478 + 1);
    uint64_t v461 = v478;
    *(_OWORD *)&v487[16] = v478;
    uint64_t v459 = v479;
    *(_OWORD *)&v487[32] = v479;
    *(_OWORD *)&v487[48] = v480;
    *(void *)&v487[64] = v481;
    int v488 = v292 | v180;
    char v489 = 0;
    sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
    sub_261B66838();
    sub_261B67754();
    sub_261B8DD68();
    sub_261B68324(v474[0], v472.i64[0], (void *)v471.i64[0], v469, 0);
    goto LABEL_105;
  }
  if (v29 == *MEMORY[0x263F87C40])
  {
    uint64_t v230 = sub_261B8BBD8();
    if (v231)
    {
      id v235 = 0;
      uint64_t v257 = 0;
      id v233 = 0;
    }
    else
    {
      uint64_t v232 = v230;
      id v233 = (void *)sub_261B8BB98();
      if (v233)
      {
        uint64_t v234 = swift_getKeyPath();
        id v235 = v474[0];
        uint64_t v236 = v472.i64[0];
        if (v472.i64[0])
        {
          id v237 = v474[0];
          uint64_t v238 = v236;
        }
        else
        {
          uint64_t v312 = v232;
          uint64_t v313 = self;
          id v314 = v235;
          v315 = v233;
          id v316 = v233;
          id v317 = objc_msgSend(v313, sel_paceColors);
          if (!v317)
          {
LABEL_323:
            __break(1u);
            goto LABEL_324;
          }
          char v318 = v317;
          id v319 = objc_msgSend(v317, sel_nonGradientTextColor);

          if (!v319)
          {
LABEL_324:
            __break(1u);
            goto LABEL_325;
          }
          uint64_t v238 = MEMORY[0x263E4C7B0](v319);

          id v235 = v474[0];
          uint64_t v232 = v312;
          id v233 = v315;
        }
        swift_retain();
        uint64_t v293 = 1;
        uint64_t v257 = 4;
LABEL_203:
        v468.i64[0] = v234;
        v474[0] = v235;
        *(void *)&long long v469 = v233;
        v470.i64[0] = v232;
        v490.i64[0] = (uint64_t)v235;
        v490.i64[1] = v257;
        *(void *)v491 = v233;
        *(void *)&v491[8] = v234;
        *(void *)&v491[16] = 0;
        *(void *)&v491[24] = v232;
        *(void *)&v491[32] = v293;
        *(void *)&v491[40] = 0;
        *(void *)&v491[48] = 0;
        *(void *)&v491[56] = v238;
        memset(&v491[64], 0, 24);
        LOBYTE(v492) = 0;
        v472.i64[0] = v257;
        v471.i64[0] = v293;
        sub_261B67A90(v235, v257, v233, v234, 0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948478);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484A8);
        sub_261B66AC0();
        sub_261B66BD4();
        sub_261B8DD68();
        int64x2_t v490 = v485;
        *(_OWORD *)v491 = v486;
        *(_OWORD *)&v491[16] = *(_OWORD *)v487;
        *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
        *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
        *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
        *(void *)&v491[80] = *(void *)&v487[64];
        LOBYTE(v492) = v488;
        BYTE1(v492) = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485A8);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485D8);
        sub_261B671B4();
        sub_261B672D0();
        sub_261B8DD68();
        if (HIBYTE(v482)) {
          __int16 v320 = 256;
        }
        else {
          __int16 v320 = 0;
        }
        int64x2_t v490 = (int64x2_t)v475;
        *(_OWORD *)v491 = v476;
        *(_OWORD *)&v491[16] = v477;
        *(_OWORD *)&v491[32] = v478;
        *(_OWORD *)&v491[48] = v479;
        *(_OWORD *)&v491[64] = v480;
        *(void *)&v491[80] = v481;
        LOWORD(v492) = v320 | v482;
        BYTE2(v492) = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948598);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485E8);
        sub_261B67138();
        sub_261B6734C();
        sub_261B8DD68();
        int64x2_t v490 = v485;
        *(_OWORD *)v491 = v486;
        *(_OWORD *)&v491[16] = *(_OWORD *)v487;
        *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
        *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
        *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
        *(void *)&v491[80] = *(void *)&v487[64];
        LOWORD(v492) = v488;
        BYTE2(v492) = BYTE2(v488) != 0;
        HIBYTE(v492) = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
        sub_261B668B4();
        sub_261B670BC();
        sub_261B8DD68();
        uint64_t v321 = *((void *)&v480 + 1);
        uint64_t v457 = v480;
        uint64_t v458 = *((void *)&v479 + 1);
        uint64_t v322 = v481;
        int v323 = v482 | (v483 << 16);
        char v324 = v484;
        if (v484) {
          int v325 = 0x1000000;
        }
        else {
          int v325 = 0;
        }
        uint64_t v466 = *((void *)&v475 + 1);
        uint64_t v467 = v475;
        int64x2_t v485 = (int64x2_t)v475;
        uint64_t v464 = *((void *)&v476 + 1);
        uint64_t v465 = v476;
        long long v486 = v476;
        uint64_t v462 = *((void *)&v477 + 1);
        uint64_t v463 = v477;
        *(_OWORD *)v487 = v477;
        uint64_t v460 = *((void *)&v478 + 1);
        uint64_t v461 = v478;
        *(_OWORD *)&v487[16] = v478;
        uint64_t v459 = v479;
        *(_OWORD *)&v487[32] = v479;
        *(_OWORD *)&v487[48] = v480;
        *(void *)&v487[64] = v481;
        int v488 = v325 | v323;
        char v489 = 0;
        sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
        sub_261B66838();
        sub_261B67754();
        sub_261B8DD68();
        sub_261B68324(v474[0], v472.i64[0], (void *)v469, v468.i64[0], 0);
        sub_261B680F0(v467, v466, v465, v464, v463, v462, v461, v460, v459, v458, v457, v321, v322, v323, SBYTE2(v323), SHIBYTE(v323), v324);
        goto LABEL_106;
      }
      id v235 = 0;
      uint64_t v257 = 0;
    }
    uint64_t v234 = 0;
    uint64_t v232 = 0;
    uint64_t v293 = 0;
    uint64_t v238 = 0;
    goto LABEL_203;
  }
  if (v29 == *MEMORY[0x263F87C60])
  {
    uint64_t v246 = sub_261B8BBD8();
    if (v247)
    {
      v249 = 0;
    }
    else
    {
      uint64_t v248 = v246;
      v249 = (void *)sub_261B8BB98();
      if (v249)
      {
        uint64_t v250 = swift_getKeyPath();
        uint64_t v251 = swift_getKeyPath();
        uint64_t v252 = swift_getKeyPath();
        uint64_t v253 = v472.i64[0];
        if (v472.i64[0])
        {
          id v254 = v474[0];
          id v255 = v474[0];
          uint64_t v256 = v253;
        }
        else
        {
          v349 = self;
          id v350 = v474[0];
          id v351 = v249;
          id v352 = objc_msgSend(v349, sel_powerColors);
          id v353 = objc_msgSend(v352, sel_nonGradientTextColor);

          if (!v353)
          {
LABEL_325:
            __break(1u);
            goto LABEL_326;
          }
          uint64_t v256 = MEMORY[0x263E4C7B0](v353);

          id v254 = v474[0];
        }
        swift_retain();
        uint64_t v275 = 11;
        uint64_t v274 = v248;
LABEL_225:
        uint64_t v466 = v256;
        uint64_t v467 = v252;
        *(void *)&long long v469 = v251;
        v490.i64[0] = (uint64_t)v249;
        v490.i64[1] = v274;
        *(void *)v491 = 0;
        *(void *)&v491[8] = v275;
        *(void *)&v491[16] = v254;
        *(void *)&v491[24] = 0;
        *(void *)&v491[32] = v250;
        *(void *)&v491[40] = 0;
        *(void *)&v491[48] = v251;
        *(void *)&v491[56] = 0;
        *(void *)&v491[64] = v252;
        *(void *)&v491[72] = 0;
        *(void *)&v491[80] = v256;
        v474[0] = v254;
        LOBYTE(v492) = 1;
        v472.i64[0] = v274;
        v468.i64[0] = (uint64_t)v249;
        v470.i64[0] = v275;
        v471.i64[0] = v250;
        sub_261B67B30(v249, v274, 0, v275, v254, 0, v250, 0, v251, 0, v252, 0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948478);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9484A8);
        sub_261B66AC0();
        sub_261B66BD4();
        sub_261B8DD68();
        int64x2_t v490 = v485;
        *(_OWORD *)v491 = v486;
        *(_OWORD *)&v491[16] = *(_OWORD *)v487;
        *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
        *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
        *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
        *(void *)&v491[80] = *(void *)&v487[64];
        LOBYTE(v492) = v488;
        BYTE1(v492) = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485A8);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485D8);
        sub_261B671B4();
        sub_261B672D0();
        sub_261B8DD68();
        if (HIBYTE(v482)) {
          __int16 v354 = 256;
        }
        else {
          __int16 v354 = 0;
        }
        int64x2_t v490 = (int64x2_t)v475;
        *(_OWORD *)v491 = v476;
        *(_OWORD *)&v491[16] = v477;
        *(_OWORD *)&v491[32] = v478;
        *(_OWORD *)&v491[48] = v479;
        *(_OWORD *)&v491[64] = v480;
        *(void *)&v491[80] = v481;
        LOWORD(v492) = v354 | v482;
        BYTE2(v492) = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948598);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485E8);
        sub_261B67138();
        sub_261B6734C();
        sub_261B8DD68();
        int64x2_t v490 = v485;
        *(_OWORD *)v491 = v486;
        *(_OWORD *)&v491[16] = *(_OWORD *)v487;
        *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
        *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
        *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
        *(void *)&v491[80] = *(void *)&v487[64];
        LOWORD(v492) = v488;
        BYTE2(v492) = BYTE2(v488) != 0;
        HIBYTE(v492) = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
        sub_261B668B4();
        sub_261B670BC();
        sub_261B8DD68();
        uint64_t v456 = *((void *)&v479 + 1);
        long long v355 = v480;
        uint64_t v356 = v481;
        int v357 = v482 | (v483 << 16);
        char v358 = v484;
        if (v484) {
          int v359 = 0x1000000;
        }
        else {
          int v359 = 0;
        }
        uint64_t v464 = *((void *)&v475 + 1);
        uint64_t v465 = v475;
        int64x2_t v485 = (int64x2_t)v475;
        uint64_t v462 = *((void *)&v476 + 1);
        uint64_t v463 = v476;
        long long v486 = v476;
        uint64_t v460 = *((void *)&v477 + 1);
        uint64_t v461 = v477;
        *(_OWORD *)v487 = v477;
        uint64_t v458 = *((void *)&v478 + 1);
        uint64_t v459 = v478;
        *(_OWORD *)&v487[16] = v478;
        uint64_t v457 = v479;
        *(_OWORD *)&v487[32] = v479;
        *(_OWORD *)&v487[48] = v480;
        *(void *)&v487[64] = v481;
        int v488 = v359 | v357;
        char v489 = 0;
        sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
        sub_261B66838();
        sub_261B67754();
        sub_261B8DD68();
        sub_261B683C4((void *)v468.i64[0], v472.i64[0], 0, v470.i64[0], v474[0], 0, v471.i64[0], 0, v469, 0, v467, 0);
        sub_261B680F0(v465, v464, v463, v462, v461, v460, v459, v458, v457, v456, v355, *((uint64_t *)&v355 + 1), v356, v357, SBYTE2(v357), SHIBYTE(v357), v358);
        goto LABEL_106;
      }
    }
    uint64_t v274 = 0;
    uint64_t v275 = 0;
    id v254 = 0;
    uint64_t v250 = 0;
    uint64_t v251 = 0;
    uint64_t v252 = 0;
    uint64_t v256 = 0;
    goto LABEL_225;
  }
  if (v29 == *MEMORY[0x263F87C98])
  {
    *(double *)&uint64_t v258 = COERCE_DOUBLE(sub_261B8BBD8());
    if (v259)
    {
      uint64_t v294 = 0;
      uint64_t v295 = 0;
      uint64_t v296 = 0;
      uint64_t v297 = 0;
      uint64_t v298 = 0;
      uint64_t v299 = 0;
      uint64_t v300 = 0;
      uint64_t v301 = 0;
      uint64_t v302 = 0;
      uint64_t v303 = 0;
      int v304 = 255;
LABEL_257:
      v490.i64[0] = v294;
      v490.i64[1] = v295;
      v472.i64[0] = v294;
      v471.i64[0] = v295;
      *(void *)v491 = v296;
      *(void *)&v491[8] = v297;
      v470.i64[0] = v296;
      *(void *)&long long v469 = v297;
      *(void *)&v491[16] = v298;
      *(void *)&v491[24] = v299;
      uint64_t v467 = v299;
      v468.i64[0] = v298;
      *(void *)&v491[32] = v300;
      *(void *)&v491[40] = v301;
      v474[0] = (id)v300;
      uint64_t v465 = v303;
      uint64_t v466 = v302;
      *(void *)&v491[48] = v302;
      *(void *)&v491[56] = v303;
      LODWORD(v464) = v304;
      *(_WORD *)&v491[64] = v304;
      uint64_t v463 = v301;
      sub_261B67F8C(v294, v295, v296, v297, v298, v299, v300, v301, v302, v303, v304);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948608);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948478);
      sub_261B67468(&qword_26A948600, &qword_26A948608, (void (*)(void))sub_261B674E0);
      sub_261B66AC0();
      sub_261B8DD68();
      uint64_t v379 = 256;
      if (!v487[49]) {
        uint64_t v379 = 0;
      }
      int64x2_t v490 = v485;
      *(_OWORD *)v491 = v486;
      *(_OWORD *)&v491[16] = *(_OWORD *)v487;
      *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
      *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
      *(void *)&v491[64] = v379 | v487[48];
      *(void *)&v491[72] = 0;
      *(_WORD *)&v491[80] = 0;
      v491[82] = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485F8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948628);
      sub_261B673C8();
      sub_261B67578();
      sub_261B8DD68();
      if (BYTE2(v481)) {
        uint64_t v380 = 0x10000;
      }
      else {
        uint64_t v380 = 0;
      }
      int64x2_t v490 = (int64x2_t)v475;
      *(_OWORD *)v491 = v476;
      *(_OWORD *)&v491[16] = v477;
      *(_OWORD *)&v491[32] = v478;
      *(_OWORD *)&v491[48] = v479;
      *(_OWORD *)&v491[64] = v480;
      *(void *)&v491[80] = v380 | (unsigned __int16)v481;
      LOWORD(v492) = 0;
      BYTE2(v492) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948598);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485E8);
      sub_261B67138();
      sub_261B6734C();
      sub_261B8DD68();
      int64x2_t v490 = v485;
      *(_OWORD *)v491 = v486;
      *(_OWORD *)&v491[16] = *(_OWORD *)v487;
      *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
      *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
      *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
      *(void *)&v491[80] = *(void *)&v487[64];
      LOWORD(v492) = v488;
      BYTE2(v492) = BYTE2(v488) != 0;
      HIBYTE(v492) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
      sub_261B668B4();
      sub_261B670BC();
      sub_261B8DD68();
      uint64_t v453 = *((void *)&v479 + 1);
      long long v381 = v480;
      uint64_t v382 = v481;
      int v383 = v482 | (v483 << 16);
      char v384 = v484;
      if (v484) {
        int v385 = 0x1000000;
      }
      else {
        int v385 = 0;
      }
      uint64_t v461 = *((void *)&v475 + 1);
      uint64_t v462 = v475;
      int64x2_t v485 = (int64x2_t)v475;
      uint64_t v459 = *((void *)&v476 + 1);
      uint64_t v460 = v476;
      long long v486 = v476;
      uint64_t v457 = *((void *)&v477 + 1);
      uint64_t v458 = v477;
      *(_OWORD *)v487 = v477;
      uint64_t v455 = *((void *)&v478 + 1);
      uint64_t v456 = v478;
      *(_OWORD *)&v487[16] = v478;
      uint64_t v454 = v479;
      *(_OWORD *)&v487[32] = v479;
      *(_OWORD *)&v487[48] = v480;
      *(void *)&v487[64] = v481;
      int v488 = v385 | v383;
      char v489 = 0;
      sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
      sub_261B66838();
      sub_261B67754();
      sub_261B8DD68();
      sub_261B68854(v472.i64[0], v471.i64[0], v470.i64[0], v469, v468.i64[0], v467, (uint64_t)v474[0], v463, v466, v465, v464);
      sub_261B680F0(v462, v461, v460, v459, v458, v457, v456, v455, v454, v453, v381, *((uint64_t *)&v381 + 1), v382, v383, SBYTE2(v383), SHIBYTE(v383), v384);
      goto LABEL_106;
    }
    double v260 = *(double *)&v258;
    sub_261B8FD78();
    uint64_t v262 = v466;
    uint64_t v261 = v467;
    uint64_t v263 = v468.i64[0];
    (*(void (**)(uint64_t, void, uint64_t))(v467 + 104))(v466, *MEMORY[0x263F8E208], v468.i64[0]);
    uint64_t v264 = v456;
    sub_261B8FD38();
    (*(void (**)(uint64_t, uint64_t))(v261 + 8))(v262, v263);
    uint64_t v265 = v455;
    sub_261B8A748();
    (*(void (**)(uint64_t, uint64_t))(v458 + 8))(v264, v460);
    sub_261A55ED4();
    uint64_t v266 = v459;
    sub_261B8FD68();
    (*(void (**)(uint64_t, uint64_t))(v457 + 8))(v265, v266);
    uint64_t v44 = v490.i64[1];
    uint64_t v41 = v490.i64[0];
    uint64_t v267 = sub_261B8BBB8();
    if (!v268)
    {
      id v360 = objc_allocWithZone(MEMORY[0x263F825C8]);
      if (v260 >= 0.0)
      {
        double v362 = 0.62745098;
        double v363 = 0.0;
        double v361 = 1.0;
      }
      else
      {
        double v361 = 0.407843137;
        double v362 = 0.321568627;
        double v363 = 1.0;
      }
      uint64_t v378 = MEMORY[0x263E4C7B0](objc_msgSend(v360, sel_initWithRed_green_blue_alpha_, v363, v361, v362, 1.0));
      v485.i64[0] = v41;
      v485.i64[1] = v44;
      long long v486 = (unint64_t)v267;
      *(void *)v487 = v267;
      *(void *)&v487[8] = 0;
      *(void *)&v487[16] = 0;
      *(void *)&v487[24] = v267;
      *(void *)&v487[32] = 0;
      *(void *)&v487[40] = v378;
      v487[48] = 1;
LABEL_256:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A945110);
      sub_261B676B0((unint64_t *)&qword_26A945108, &qword_26A945110, (void (*)(void))sub_261A02AC8);
      sub_261B8DD68();
      uint64_t v295 = v490.i64[1];
      uint64_t v294 = v490.i64[0];
      uint64_t v296 = *(void *)v491;
      uint64_t v297 = *(void *)&v491[8];
      uint64_t v298 = *(void *)&v491[16];
      uint64_t v299 = *(void *)&v491[24];
      uint64_t v300 = *(void *)&v491[32];
      uint64_t v301 = *(void *)&v491[40];
      uint64_t v302 = *(void *)&v491[48];
      uint64_t v303 = *(void *)&v491[56];
      int v304 = v491[64];
      goto LABEL_257;
    }
    if (qword_26B416690 == -1)
    {
LABEL_167:
      swift_beginAccess();
      id v269 = (id)qword_26B416688;
      uint64_t v270 = sub_261B8AA48();
      uint64_t v272 = v271;
      swift_bridgeObjectRelease();

      uint64_t v273 = v472.i64[0];
      if (!v472.i64[0]) {
        uint64_t v273 = MEMORY[0x263E4C7B0](objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.6, 0.6, 0.6, 1.0));
      }
      v485.i64[0] = v41;
      v485.i64[1] = v44;
      long long v486 = 0uLL;
      *(void *)v487 = v270;
      *(void *)&v487[8] = v272;
      memset(&v487[16], 0, 24);
      *(void *)&v487[40] = v273;
      v487[48] = 0;
      swift_retain();
      goto LABEL_256;
    }
LABEL_306:
    swift_once();
    goto LABEL_167;
  }
  if (v29 == *MEMORY[0x263F87C28])
  {
    uint64_t v276 = sub_261B8BBD8();
    if (v277)
    {
      v474[0] = 0;
      uint64_t v326 = 0;
      unint64_t v279 = 0;
    }
    else
    {
      uint64_t v278 = v276;
      unint64_t v279 = (void *)sub_261B8BB98();
      if (v279)
      {
        uint64_t v280 = swift_getKeyPath();
        if (v472.i64[0])
        {
          id v281 = v474[0];
          uint64_t v282 = v472.i64[0];
        }
        else
        {
          uint64_t v392 = self;
          id v393 = v474[0];
          id v394 = v279;
          id v395 = objc_msgSend(v392, sel_paceColors);
          if (!v395)
          {
LABEL_326:
            __break(1u);
            goto LABEL_327;
          }
          v396 = v395;
          id v397 = objc_msgSend(v395, sel_nonGradientTextColor);

          if (!v397)
          {
LABEL_327:
            __break(1u);
            goto LABEL_328;
          }
          uint64_t v282 = MEMORY[0x263E4C7B0](v397);
        }
        swift_retain();
        uint64_t v326 = 14;
LABEL_271:
        v490.i64[0] = (uint64_t)v474[0];
        v490.i64[1] = v326;
        v471.i64[0] = v326;
        *(void *)v491 = v279;
        *(void *)&v491[8] = v280;
        v472.i64[0] = (uint64_t)v279;
        v470.i64[0] = v280;
        *(void *)&v491[16] = 0;
        *(void *)&v491[24] = v278;
        *(void *)&long long v469 = v278;
        memset(&v491[32], 0, 24);
        *(void *)&v491[56] = v282;
        v468.i64[0] = v282;
        *(_WORD *)&v491[64] = 256;
        sub_261B67A90(v474[0], v326, v279, v280, 0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948608);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948478);
        sub_261B67468(&qword_26A948600, &qword_26A948608, (void (*)(void))sub_261B674E0);
        sub_261B66AC0();
        sub_261B8DD68();
        if (v487[49]) {
          uint64_t v398 = 256;
        }
        else {
          uint64_t v398 = 0;
        }
        int64x2_t v490 = v485;
        *(_OWORD *)v491 = v486;
        *(_OWORD *)&v491[16] = *(_OWORD *)v487;
        *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
        *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
        *(void *)&v491[64] = v398 | v487[48];
        *(void *)&v491[72] = 0;
        *(_WORD *)&v491[80] = 0;
        v491[82] = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485F8);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948628);
        sub_261B673C8();
        sub_261B67578();
        sub_261B8DD68();
        if (BYTE2(v481)) {
          uint64_t v399 = 0x10000;
        }
        else {
          uint64_t v399 = 0;
        }
        int64x2_t v490 = (int64x2_t)v475;
        *(_OWORD *)v491 = v476;
        *(_OWORD *)&v491[16] = v477;
        *(_OWORD *)&v491[32] = v478;
        *(_OWORD *)&v491[48] = v479;
        *(_OWORD *)&v491[64] = v480;
        *(void *)&v491[80] = v399 | (unsigned __int16)v481;
        LOWORD(v492) = 0;
        BYTE2(v492) = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948598);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485E8);
        sub_261B67138();
        sub_261B6734C();
        sub_261B8DD68();
        int64x2_t v490 = v485;
        *(_OWORD *)v491 = v486;
        *(_OWORD *)&v491[16] = *(_OWORD *)v487;
        *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
        *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
        *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
        *(void *)&v491[80] = *(void *)&v487[64];
        LOWORD(v492) = v488;
        BYTE2(v492) = BYTE2(v488) != 0;
        HIBYTE(v492) = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
        sub_261B668B4();
        sub_261B670BC();
        sub_261B8DD68();
        uint64_t v458 = *((void *)&v479 + 1);
        long long v400 = v480;
        uint64_t v401 = v481;
        int v402 = v482 | (v483 << 16);
        char v403 = v484;
        if (v484) {
          int v404 = 0x1000000;
        }
        else {
          int v404 = 0;
        }
        uint64_t v466 = *((void *)&v475 + 1);
        uint64_t v467 = v475;
        int64x2_t v485 = (int64x2_t)v475;
        uint64_t v464 = *((void *)&v476 + 1);
        uint64_t v465 = v476;
        long long v486 = v476;
        uint64_t v462 = *((void *)&v477 + 1);
        uint64_t v463 = v477;
        *(_OWORD *)v487 = v477;
        uint64_t v460 = *((void *)&v478 + 1);
        uint64_t v461 = v478;
        *(_OWORD *)&v487[16] = v478;
        uint64_t v459 = v479;
        *(_OWORD *)&v487[32] = v479;
        *(_OWORD *)&v487[48] = v480;
        *(void *)&v487[64] = v481;
        int v488 = v404 | v402;
        char v489 = 0;
        sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
        sub_261B66838();
        sub_261B67754();
        sub_261B8DD68();
        sub_261B68324(v474[0], v471.i64[0], (void *)v472.i64[0], v470.i64[0], 0);
        sub_261B680F0(v467, v466, v465, v464, v463, v462, v461, v460, v459, v458, v400, *((uint64_t *)&v400 + 1), v401, v402, SBYTE2(v402), SHIBYTE(v402), v403);
        goto LABEL_106;
      }
      v474[0] = 0;
      uint64_t v326 = 0;
    }
    uint64_t v280 = 0;
    uint64_t v278 = 0;
    uint64_t v282 = 0;
    goto LABEL_271;
  }
  if (v29 == *MEMORY[0x263F87C68])
  {
    uint64_t v305 = sub_261B8BBD8();
    if (v306)
    {
      uint64_t v308 = 0;
      int64x2_t v311 = 0uLL;
    }
    else
    {
      uint64_t v307 = v305;
      uint64_t v308 = v472.i64[0];
      if (!v472.i64[0])
      {
        id v309 = objc_msgSend(self, sel_splitsColors);
        id v310 = objc_msgSend(v309, sel_nonGradientTextColor);

        if (!v310)
        {
LABEL_328:
          __break(1u);
          goto LABEL_329;
        }
        uint64_t v308 = MEMORY[0x263E4C7B0](v310);
      }
      swift_retain();
      int64x2_t v311 = vdupq_n_s64(1uLL);
      v311.i64[0] = v307;
    }
    int64x2_t v490 = v311;
    v474[0] = (id)v308;
    *(void *)v491 = v308;
    memset(&v491[8], 0, 74);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9483E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948638);
    sub_261B667A0();
    sub_261B67468(&qword_26A948630, &qword_26A948638, (void (*)(void))sub_261B67618);
    sub_261B8DD68();
    if (v487[65]) {
      __int16 v364 = 256;
    }
    else {
      __int16 v364 = 0;
    }
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    *(_WORD *)&v491[80] = v364 | v487[64];
    v491[82] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485F8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948628);
    sub_261B673C8();
    sub_261B67578();
    sub_261B8DD68();
    if (BYTE2(v481)) {
      uint64_t v365 = 0x10000;
    }
    else {
      uint64_t v365 = 0;
    }
    int64x2_t v490 = (int64x2_t)v475;
    *(_OWORD *)v491 = v476;
    *(_OWORD *)&v491[16] = v477;
    *(_OWORD *)&v491[32] = v478;
    *(_OWORD *)&v491[48] = v479;
    *(_OWORD *)&v491[64] = v480;
    *(void *)&v491[80] = v365 | (unsigned __int16)v481;
    LOWORD(v492) = 0;
    BYTE2(v492) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948598);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485E8);
    sub_261B67138();
    sub_261B6734C();
    sub_261B8DD68();
    int64x2_t v490 = v485;
    *(_OWORD *)v491 = v486;
    *(_OWORD *)&v491[16] = *(_OWORD *)v487;
    *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
    *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
    *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
    *(void *)&v491[80] = *(void *)&v487[64];
    LOWORD(v492) = v488;
    BYTE2(v492) = BYTE2(v488) != 0;
    HIBYTE(v492) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
    sub_261B668B4();
    sub_261B670BC();
    sub_261B8DD68();
    uint64_t v463 = *((void *)&v479 + 1);
    long long v366 = v480;
    uint64_t v367 = v481;
    int v368 = v482 | (v483 << 16);
    char v369 = v484;
    if (v484) {
      int v370 = 0x1000000;
    }
    else {
      int v370 = 0;
    }
    v472.i64[0] = v475;
    int64x2_t v485 = (int64x2_t)v475;
    v471.i64[0] = *((void *)&v475 + 1);
    v470.i64[0] = v476;
    long long v486 = v476;
    *(void *)&long long v469 = *((void *)&v476 + 1);
    uint64_t v467 = *((void *)&v477 + 1);
    v468.i64[0] = v477;
    *(_OWORD *)v487 = v477;
    uint64_t v465 = *((void *)&v478 + 1);
    uint64_t v466 = v478;
    *(_OWORD *)&v487[16] = v478;
    uint64_t v464 = v479;
    *(_OWORD *)&v487[32] = v479;
    *(_OWORD *)&v487[48] = v480;
    *(void *)&v487[64] = v481;
    int v488 = v370 | v368;
    char v489 = 0;
    sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
    sub_261B66838();
    sub_261B67754();
    sub_261B8DD68();
    swift_release();
    sub_261B680F0(v472.i64[0], v471.i64[0], v470.i64[0], v469, v468.i64[0], v467, v466, v465, v464, v463, v366, *((uint64_t *)&v366 + 1), v367, v368, SBYTE2(v368), SHIBYTE(v368), v369);
    goto LABEL_106;
  }
  if (v29 == *MEMORY[0x263F87C78])
  {
    sub_261B8BBB8();
    if (!v327)
    {
      uint64_t v405 = sub_261B8BBA8();
      if (!v406)
      {
        uint64_t v424 = 0;
        uint64_t v425 = 0;
        uint64_t v426 = 0;
        uint64_t v427 = 0;
        uint64_t v428 = 0;
        uint64_t v429 = 0;
        uint64_t v430 = 0;
        uint64_t v431 = 0;
        uint64_t v432 = 0;
        uint64_t v433 = 0;
        uint64_t v434 = 0;
        int v435 = 255;
        goto LABEL_291;
      }
      v490.i64[0] = v405;
      v490.i64[1] = v406;
      sub_261A029C4();
      swift_bridgeObjectRetain();
      uint64_t v407 = sub_261B8E3D8();
      uint64_t v409 = v408;
      char v411 = v410;
      uint64_t v413 = v412;
      uint64_t v414 = swift_getKeyPath();
      uint64_t v415 = swift_getKeyPath();
      uint64_t v416 = swift_getKeyPath();
      swift_bridgeObjectRelease();
      uint64_t v417 = v472.i64[0];
      if (!v472.i64[0])
      {
        double v418 = COERCE_DOUBLE(sub_261B8BBD8());
        if (v419) {
          double v418 = 16777215.0;
        }
        if ((~*(void *)&v418 & 0x7FF0000000000000) == 0) {
          goto LABEL_318;
        }
        if (v418 <= -1.0)
        {
LABEL_319:
          __break(1u);
          goto LABEL_320;
        }
        if (v418 >= 4294967300.0)
        {
LABEL_320:
          __break(1u);
          goto LABEL_321;
        }
        double v420 = (double)(v418 >> 16) / 255.0;
        double v421 = (double)((unsigned __int16)v418 >> 8) / 255.0;
        double v422 = (double)v418 / 255.0;
        uint64_t v423 = v471.i64[0];
        (*(void (**)(uint64_t, void, uint64_t))(v469 + 104))(v471.i64[0], *MEMORY[0x263F1B388], v470.i64[0]);
        uint64_t v417 = MEMORY[0x263E4C7A0](v423, v420, v421, v422, 1.0);
      }
      v485.i64[0] = v407;
      v485.i64[1] = v409;
      *(void *)&long long v486 = v411 & 1;
      *((void *)&v486 + 1) = v413;
      *(void *)v487 = v414;
      *(void *)&v487[8] = 0;
      *(void *)&v487[16] = v415;
      *(void *)&v487[24] = 0x3FE0000000000000;
      *(_OWORD *)&v487[40] = xmmword_261B9C380;
      *(void *)&v487[32] = v416;
      *(void *)&v487[56] = v417;
      v487[64] = 1;
      goto LABEL_290;
    }
    if (qword_26B416690 == -1)
    {
LABEL_214:
      swift_beginAccess();
      id v328 = (id)qword_26B416688;
      uint64_t v329 = sub_261B8AA48();
      uint64_t v331 = v330;
      swift_bridgeObjectRelease();

      v490.i64[0] = v329;
      v490.i64[1] = v331;
      sub_261A029C4();
      swift_bridgeObjectRetain();
      uint64_t v332 = sub_261B8E3D8();
      uint64_t v334 = v333;
      char v336 = v335;
      uint64_t v338 = v337;
      uint64_t v339 = swift_getKeyPath();
      uint64_t v340 = swift_getKeyPath();
      uint64_t v341 = swift_getKeyPath();
      swift_bridgeObjectRelease();
      uint64_t v342 = v472.i64[0];
      if (v472.i64[0])
      {
LABEL_221:
        v485.i64[0] = v332;
        v485.i64[1] = v334;
        *(void *)&long long v486 = v336 & 1;
        *((void *)&v486 + 1) = v338;
        *(void *)v487 = v339;
        *(void *)&v487[8] = 0;
        *(void *)&v487[16] = v340;
        *(void *)&v487[24] = 0x3FE0000000000000;
        *(_OWORD *)&v487[40] = xmmword_261B9C370;
        *(void *)&v487[32] = v341;
        *(void *)&v487[56] = v342;
        v487[64] = 0;
LABEL_290:
        swift_retain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948658);
        sub_261B676B0(&qword_26A948650, &qword_26A948658, (void (*)(void))sub_261A3A288);
        sub_261B8DD68();
        uint64_t v425 = v490.i64[1];
        uint64_t v424 = v490.i64[0];
        uint64_t v426 = *(void *)v491;
        uint64_t v427 = *(void *)&v491[8];
        uint64_t v428 = *(void *)&v491[16];
        uint64_t v429 = *(void *)&v491[24];
        uint64_t v430 = *(void *)&v491[32];
        uint64_t v431 = *(void *)&v491[40];
        uint64_t v432 = *(void *)&v491[48];
        uint64_t v433 = *(void *)&v491[56];
        uint64_t v434 = *(void *)&v491[64];
        uint64_t v406 = *(void *)&v491[72];
        int v435 = v491[80];
LABEL_291:
        v490.i64[0] = v424;
        v490.i64[1] = v425;
        v474[0] = (id)v424;
        v472.i64[0] = v425;
        *(void *)v491 = v426;
        *(void *)&v491[8] = v427;
        v471.i64[0] = v426;
        v470.i64[0] = v427;
        *(void *)&v491[16] = v428;
        *(void *)&v491[24] = v429;
        *(void *)&long long v469 = v428;
        uint64_t v467 = v430;
        v468.i64[0] = v429;
        *(void *)&v491[32] = v430;
        *(void *)&v491[40] = v431;
        uint64_t v465 = v432;
        uint64_t v466 = v431;
        *(void *)&v491[48] = v432;
        *(void *)&v491[56] = v433;
        uint64_t v463 = v434;
        uint64_t v464 = v433;
        *(void *)&v491[64] = v434;
        *(void *)&v491[72] = v406;
        uint64_t v462 = v406;
        LODWORD(v461) = v435;
        v491[80] = v435;
        v491[81] = 1;
        sub_261B67878(v424, v425, v426, v427, v428, v429, v430, v431, v432, v433, v434, v406, v435);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9483E8);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948638);
        sub_261B667A0();
        sub_261B67468(&qword_26A948630, &qword_26A948638, (void (*)(void))sub_261B67618);
        sub_261B8DD68();
        if (v487[65]) {
          __int16 v436 = 256;
        }
        else {
          __int16 v436 = 0;
        }
        int64x2_t v490 = v485;
        *(_OWORD *)v491 = v486;
        *(_OWORD *)&v491[16] = *(_OWORD *)v487;
        *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
        *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
        *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
        *(_WORD *)&v491[80] = v436 | v487[64];
        v491[82] = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485F8);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948628);
        sub_261B673C8();
        sub_261B67578();
        sub_261B8DD68();
        if (BYTE2(v481)) {
          uint64_t v437 = 0x10000;
        }
        else {
          uint64_t v437 = 0;
        }
        int64x2_t v490 = (int64x2_t)v475;
        *(_OWORD *)v491 = v476;
        *(_OWORD *)&v491[16] = v477;
        *(_OWORD *)&v491[32] = v478;
        *(_OWORD *)&v491[48] = v479;
        *(_OWORD *)&v491[64] = v480;
        *(void *)&v491[80] = v437 | (unsigned __int16)v481;
        LOWORD(v492) = 0;
        BYTE2(v492) = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948598);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9485E8);
        sub_261B67138();
        sub_261B6734C();
        sub_261B8DD68();
        int64x2_t v490 = v485;
        *(_OWORD *)v491 = v486;
        *(_OWORD *)&v491[16] = *(_OWORD *)v487;
        *(_OWORD *)&v491[32] = *(_OWORD *)&v487[16];
        *(_OWORD *)&v491[48] = *(_OWORD *)&v487[32];
        *(_OWORD *)&v491[64] = *(_OWORD *)&v487[48];
        *(void *)&v491[80] = *(void *)&v487[64];
        LOWORD(v492) = v488;
        BYTE2(v492) = BYTE2(v488) != 0;
        HIBYTE(v492) = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948428);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948588);
        sub_261B668B4();
        sub_261B670BC();
        sub_261B8DD68();
        uint64_t v451 = *((void *)&v479 + 1);
        long long v438 = v480;
        uint64_t v439 = v481;
        int v440 = v482 | (v483 << 16);
        char v441 = v484;
        if (v484) {
          int v442 = 0x1000000;
        }
        else {
          int v442 = 0;
        }
        uint64_t v459 = *((void *)&v475 + 1);
        uint64_t v460 = v475;
        int64x2_t v485 = (int64x2_t)v475;
        uint64_t v457 = *((void *)&v476 + 1);
        uint64_t v458 = v476;
        long long v486 = v476;
        uint64_t v455 = *((void *)&v477 + 1);
        uint64_t v456 = v477;
        *(_OWORD *)v487 = v477;
        uint64_t v453 = *((void *)&v478 + 1);
        uint64_t v454 = v478;
        *(_OWORD *)&v487[16] = v478;
        uint64_t v452 = v479;
        *(_OWORD *)&v487[32] = v479;
        *(_OWORD *)&v487[48] = v480;
        *(void *)&v487[64] = v481;
        int v488 = v442 | v440;
        char v489 = 0;
        sub_261B67928(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477, *((uint64_t *)&v477 + 1), v478, *((uint64_t *)&v478 + 1), v479, *((uint64_t *)&v479 + 1), v480, *((uint64_t *)&v480 + 1), v481, v482, v483, (v482 | (v483 << 16)) >> 24, v484);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
        sub_261B66838();
        sub_261B67754();
        sub_261B8DD68();
        sub_261B68040((uint64_t)v474[0], v472.i64[0], v471.i8[0], v470.i64[0], v469, v468.i8[0], v467, v466, v465, v464, v463, v462, v461);
        sub_261B680F0(v460, v459, v458, v457, v456, v455, v454, v453, v452, v451, v438, *((uint64_t *)&v438 + 1), v439, v440, SBYTE2(v440), SHIBYTE(v440), v441);
        goto LABEL_106;
      }
      double v343 = COERCE_DOUBLE(sub_261B8BBD8());
      if (v344) {
        double v343 = 16777215.0;
      }
      if ((~*(void *)&v343 & 0x7FF0000000000000) != 0)
      {
        if (v343 > -1.0)
        {
          if (v343 < 4294967300.0)
          {
            double v345 = (double)(v343 >> 16) / 255.0;
            double v346 = (double)((unsigned __int16)v343 >> 8) / 255.0;
            double v347 = (double)v343 / 255.0;
            uint64_t v348 = v471.i64[0];
            (*(void (**)(uint64_t, void, uint64_t))(v469 + 104))(v471.i64[0], *MEMORY[0x263F1B388], v470.i64[0]);
            uint64_t v342 = MEMORY[0x263E4C7A0](v348, v345, v346, v347, 1.0);
            goto LABEL_221;
          }
          goto LABEL_315;
        }
LABEL_314:
        __break(1u);
LABEL_315:
        __break(1u);
        goto LABEL_316;
      }
LABEL_313:
      __break(1u);
      goto LABEL_314;
    }
LABEL_310:
    swift_once();
    goto LABEL_214;
  }
  if (v29 != *MEMORY[0x263F87C50])
  {
    sub_261B8DB78();
    sub_261B8DB68();
    sub_261B8BBC8();
    sub_261B8F128();
    sub_261B8DB58();
    swift_bridgeObjectRelease();
    sub_261B8DB68();
    sub_261B8DBA8();
    uint64_t v386 = sub_261B8E3B8();
    uint64_t v388 = v387;
    v474[0] = (id)v389;
    v490.i64[0] = v386;
    v490.i64[1] = v387;
    char v391 = v390 & 1;
    *(void *)v491 = v390 & 1;
    *(void *)&v491[8] = v389;
    v491[16] = 1;
    sub_261A001D0(v386, v387, v390 & 1);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9483E8);
    sub_261B667A0();
    sub_261B8DD68();
    int64x2_t v485 = (int64x2_t)v475;
    long long v486 = v476;
    *(void *)v487 = v477;
    memset(&v487[8], 0, 64);
    int v488 = 0;
    char v489 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
    sub_261B66838();
    sub_261B67754();
    sub_261B8DD68();
    sub_261A02A18(v386, v388, v391);
    swift_bridgeObjectRelease();
    *(int64x2_t *)v474 = v490;
    int64x2_t v471 = *(int64x2_t *)&v491[16];
    int64x2_t v472 = *(int64x2_t *)v491;
    long long v469 = *(_OWORD *)&v491[48];
    int64x2_t v470 = *(int64x2_t *)&v491[32];
    int64x2_t v468 = *(int64x2_t *)&v491[64];
    uint64_t v189 = *(void *)&v491[80];
    int v190 = v492;
    char v191 = v493;
    (*(void (**)(char *, uint64_t))(v452 + 8))(v28, v24);
    int64x2_t v188 = v468;
    int64x2_t v187 = (int64x2_t)v469;
    int64x2_t v186 = v470;
    int64x2_t v185 = v471;
    int64x2_t v184 = v472;
    int64x2_t v183 = *(int64x2_t *)v474;
    goto LABEL_108;
  }
  uint64_t v371 = sub_261B8BBD8();
  if (v372)
  {
    uint64_t v373 = 0;
    uint64_t v374 = 0;
    goto LABEL_302;
  }
  uint64_t v373 = v371;
  uint64_t v374 = v472.i64[0];
  if (v472.i64[0])
  {
LABEL_251:
    swift_retain();
LABEL_302:
    int64x2_t v490 = (int64x2_t)(unint64_t)v373;
    v474[0] = (id)v374;
    *(void *)v491 = v374;
    *(void *)&v491[8] = 0;
    v491[16] = 0;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9483E8);
    sub_261B667A0();
    sub_261B8DD68();
    long long v443 = v475;
    char v444 = v476;
    uint64_t v445 = *((void *)&v476 + 1);
    char v446 = v477;
    int64x2_t v485 = (int64x2_t)v475;
    long long v486 = v476;
    *(void *)v487 = v477;
    memset(&v487[8], 0, 64);
    int v488 = 0;
    char v489 = 1;
    sub_261B677D0(v475, *((uint64_t *)&v475 + 1), v476, *((uint64_t *)&v476 + 1), v477);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948408);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948410);
    sub_261B66838();
    sub_261B67754();
    sub_261B8DD68();
    swift_release();
    sub_261B67824(v443, *((uint64_t *)&v443 + 1), v444, v445, v446);
    int64x2_t v183 = v490;
    int64x2_t v184 = *(int64x2_t *)v491;
    int64x2_t v185 = *(int64x2_t *)&v491[16];
    int64x2_t v186 = *(int64x2_t *)&v491[32];
    int64x2_t v187 = *(int64x2_t *)&v491[48];
    int64x2_t v188 = *(int64x2_t *)&v491[64];
    goto LABEL_107;
  }
  id v375 = objc_msgSend(self, sel_elapsedTimeColors);
  if (!v375)
  {
LABEL_329:
    __break(1u);
    goto LABEL_330;
  }
  v376 = v375;
  id v377 = objc_msgSend(v375, sel_nonGradientTextColor);

  if (v377)
  {
    uint64_t v374 = MEMORY[0x263E4C7B0](v377);
    goto LABEL_251;
  }
LABEL_330:
  __break(1u);
}

void sub_261B66794(int64x2_t *a1@<X8>)
{
  sub_261B60E38(*v1, v1[1], v1[2], a1);
}

unint64_t sub_261B667A0()
{
  unint64_t result = qword_26A9483F0;
  if (!qword_26A9483F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9483E8);
    sub_261B676B0(&qword_26A9483F8, &qword_26A948400, (void (*)(void))sub_261B4FD08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9483F0);
  }
  return result;
}

unint64_t sub_261B66838()
{
  unint64_t result = qword_26A948418;
  if (!qword_26A948418)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948408);
    sub_261B668B4();
    sub_261B670BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948418);
  }
  return result;
}

unint64_t sub_261B668B4()
{
  unint64_t result = qword_26A948420;
  if (!qword_26A948420)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948428);
    sub_261B66930();
    sub_261B66C6C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948420);
  }
  return result;
}

unint64_t sub_261B66930()
{
  unint64_t result = qword_26A948430;
  if (!qword_26A948430)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948438);
    sub_261B669AC();
    sub_261B66B58();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948430);
  }
  return result;
}

unint64_t sub_261B669AC()
{
  unint64_t result = qword_26A948440;
  if (!qword_26A948440)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948448);
    sub_261B66A28();
    sub_261B66AC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948440);
  }
  return result;
}

unint64_t sub_261B66A28()
{
  unint64_t result = qword_26A948450;
  if (!qword_26A948450)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948458);
    sub_261B676B0(&qword_26A948460, &qword_26A948468, (void (*)(void))sub_261A1EB70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948450);
  }
  return result;
}

unint64_t sub_261B66AC0()
{
  unint64_t result = qword_26A948470;
  if (!qword_26A948470)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948478);
    sub_261B676B0(&qword_26A948480, &qword_26A948488, (void (*)(void))sub_261A1E094);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948470);
  }
  return result;
}

unint64_t sub_261B66B58()
{
  unint64_t result = qword_26A948490;
  if (!qword_26A948490)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948498);
    sub_261B66BD4();
    sub_261B66A28();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948490);
  }
  return result;
}

unint64_t sub_261B66BD4()
{
  unint64_t result = qword_26A9484A0;
  if (!qword_26A9484A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9484A8);
    sub_261B676B0(&qword_26A9484B0, &qword_26A9484B8, (void (*)(void))sub_261A1EDA4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9484A0);
  }
  return result;
}

unint64_t sub_261B66C6C()
{
  unint64_t result = qword_26A9484C0;
  if (!qword_26A9484C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9484C8);
    sub_261B66CE8();
    sub_261B66E94();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9484C0);
  }
  return result;
}

unint64_t sub_261B66CE8()
{
  unint64_t result = qword_26A9484D0;
  if (!qword_26A9484D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9484D8);
    sub_261B66D64();
    sub_261B66DFC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9484D0);
  }
  return result;
}

unint64_t sub_261B66D64()
{
  unint64_t result = qword_26A9484E0;
  if (!qword_26A9484E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9484E8);
    sub_261B676B0(&qword_26A9484F0, &qword_26A9484F8, (void (*)(void))sub_261A598C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9484E0);
  }
  return result;
}

unint64_t sub_261B66DFC()
{
  unint64_t result = qword_26A948500;
  if (!qword_26A948500)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948508);
    sub_261B676B0(&qword_26A948510, &qword_26A948518, (void (*)(void))sub_261A1E438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948500);
  }
  return result;
}

unint64_t sub_261B66E94()
{
  unint64_t result = qword_26A948520;
  if (!qword_26A948520)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948528);
    sub_261B67468(&qword_26A948530, &qword_26A948538, (void (*)(void))sub_261B66F58);
    sub_261B67468(&qword_26A948560, &qword_26A948568, (void (*)(void))sub_261B6701C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948520);
  }
  return result;
}

unint64_t sub_261B66F58()
{
  unint64_t result = qword_26A948540;
  if (!qword_26A948540)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948548);
    sub_2619F8AB8(&qword_26A948550, &qword_26A948558);
    sub_2619F8AB8((unint64_t *)&qword_26A9439E0, &qword_26A9439E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948540);
  }
  return result;
}

unint64_t sub_261B6701C()
{
  unint64_t result = qword_26A948570;
  if (!qword_26A948570)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948578);
    sub_261A02AC8();
    sub_2619F8AB8((unint64_t *)&qword_26A943AF0, &qword_26A943AF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948570);
  }
  return result;
}

unint64_t sub_261B670BC()
{
  unint64_t result = qword_26A948580;
  if (!qword_26A948580)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948588);
    sub_261B67138();
    sub_261B6734C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948580);
  }
  return result;
}

unint64_t sub_261B67138()
{
  unint64_t result = qword_26A948590;
  if (!qword_26A948590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948598);
    sub_261B671B4();
    sub_261B672D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948590);
  }
  return result;
}

unint64_t sub_261B671B4()
{
  unint64_t result = qword_26A9485A0;
  if (!qword_26A9485A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9485A8);
    sub_261B67468(&qword_26A9485B0, &qword_26A9485B8, (void (*)(void))sub_261B67254);
    sub_261B66AC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9485A0);
  }
  return result;
}

unint64_t sub_261B67254()
{
  unint64_t result = qword_26A9485C0;
  if (!qword_26A9485C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9485C8);
    sub_261A990D4();
    sub_2619FBA38();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9485C0);
  }
  return result;
}

unint64_t sub_261B672D0()
{
  unint64_t result = qword_26A9485D0;
  if (!qword_26A9485D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9485D8);
    sub_261B66AC0();
    sub_261B66BD4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9485D0);
  }
  return result;
}

unint64_t sub_261B6734C()
{
  unint64_t result = qword_26A9485E0;
  if (!qword_26A9485E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9485E8);
    sub_261B673C8();
    sub_261B67578();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9485E0);
  }
  return result;
}

unint64_t sub_261B673C8()
{
  unint64_t result = qword_26A9485F0;
  if (!qword_26A9485F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9485F8);
    sub_261B67468(&qword_26A948600, &qword_26A948608, (void (*)(void))sub_261B674E0);
    sub_261B66AC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9485F0);
  }
  return result;
}

uint64_t sub_261B67468(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_261B674E0()
{
  unint64_t result = qword_26A948610;
  if (!qword_26A948610)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948618);
    sub_261B676B0((unint64_t *)&qword_26A945108, &qword_26A945110, (void (*)(void))sub_261A02AC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948610);
  }
  return result;
}

unint64_t sub_261B67578()
{
  unint64_t result = qword_26A948620;
  if (!qword_26A948620)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948628);
    sub_261B667A0();
    sub_261B67468(&qword_26A948630, &qword_26A948638, (void (*)(void))sub_261B67618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948620);
  }
  return result;
}

unint64_t sub_261B67618()
{
  unint64_t result = qword_26A948640;
  if (!qword_26A948640)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948648);
    sub_261B676B0(&qword_26A948650, &qword_26A948658, (void (*)(void))sub_261A3A288);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948640);
  }
  return result;
}

uint64_t sub_261B676B0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_2619F8AB8((unint64_t *)&qword_26A9439E0, &qword_26A9439E8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_261B67754()
{
  unint64_t result = qword_26A948660;
  if (!qword_26A948660)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948410);
    sub_261B667A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948660);
  }
  return result;
}

uint64_t sub_261B677D0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if (a5)
  {
    sub_261A001D0(a1, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  else
  {
    return swift_retain();
  }
}

uint64_t sub_261B67824(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if (a5)
  {
    sub_261A02A18(a1, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_261B67878(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13)
{
  if (a13 != 255) {
    return sub_261B678A4(a1, a2, a3, a4, a5, a6);
  }
  return a1;
}

uint64_t sub_261B678A4(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  char v7 = a6 & 1;
  sub_261A001D0(a1, a2, a3 & 1);
  swift_bridgeObjectRetain();
  sub_2619F7774(a5, v7);
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_261B67928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, __int16 a14, char a15, char a16, char a17)
{
  if ((a17 & 1) == 0) {
    return sub_261B681C4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15 & 1, (uint64_t (*)(uint64_t, uint64_t))sub_261B679FC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261B67B04, (uint64_t (*)(void))sub_261B67BCC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_261B67C90);
  }
  return sub_261B67D8C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15 & 1);
}

void *sub_261B679FC(void *result, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, char a11)
{
  if (a11) {
    return sub_261B67A90(result, a2, a3, a4, (char)a5);
  }
  else {
    return (void *)sub_261B67A18((uint64_t)result, a2, (uint64_t)a3, a4, a5, a6, a7, a8, a9);
  }
}

uint64_t sub_261B67A18(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (result)
  {
    uint64_t v11 = (void *)result;
    swift_bridgeObjectRetain();
    id v12 = v11;
    id v13 = a5;
    sub_2619F7774(a8, a9 & 1);
    return swift_retain();
  }
  return result;
}

void *sub_261B67A90(void *result, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  if (result)
  {
    char v7 = a5 & 1;
    id v8 = result;
    id v9 = a3;
    sub_2619F7774(a4, v7);
    swift_bridgeObjectRetain();
    return (void *)swift_retain();
  }
  return result;
}

void *sub_261B67B04(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, char a14)
{
  if (a14) {
    return (void *)sub_261B67A18((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else {
    return sub_261B67B30(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  }
}

void *sub_261B67B30(void *result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, char a10, uint64_t a11, char a12)
{
  if (result)
  {
    char v14 = a8 & 1;
    id v15 = result;
    id v16 = a5;
    sub_2619F7774(a7, v14);
    sub_2619F7774(a9, a10 & 1);
    sub_2619F7774(a11, a12 & 1);
    return (void *)swift_retain();
  }
  return result;
}

void sub_261B67BCC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a9) {
    sub_261B67C34(a1, a2, a3, a4, a5, a6);
  }
  else {
    sub_261B67BDC(a1, (void *)a2);
  }
}

void sub_261B67BDC(uint64_t a1, void *a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    id v2 = a2;
  }
}

uint64_t sub_261B67C34(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, char a6)
{
  if (a4)
  {
    char v7 = a6 & 1;
    id v8 = a4;
    sub_2619F7774(a5, v7);
    return swift_retain();
  }
  return result;
}

uint64_t sub_261B67C90(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  if (a13) {
    return sub_261B67D0C(a1, a2);
  }
  else {
    return sub_261B67CBC(a1, a2, a3, a4);
  }
}

uint64_t sub_261B67CBC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_261A001D0(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_261B67D0C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_261B67D8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, __int16 a14, char a15)
{
  if (a15) {
    return sub_261B687DC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, BYTE2(a13) & 1, (uint64_t (*)(uint64_t, uint64_t))sub_261B67F68, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_261B68014);
  }
  else {
    return sub_261B67E5C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, (unsigned __int16)(a14 & 0x1FF) >> 8, (uint64_t (*)(void))sub_261B67EE0, (uint64_t (*)(void))sub_261B67A90, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261B67F3C);
  }
}

uint64_t sub_261B67E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char a14, char a15, uint64_t (*a16)(void), uint64_t (*a17)(void), uint64_t (*a18)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  if ((a15 & 1) == 0) {
    return sub_261B6872C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11 & 1, a16, a17);
  }
  return a18(a1, a2, a3, a4, a5);
}

uint64_t sub_261B67EE0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    return sub_2619F7774(a4, a5 & 1);
  }
  return result;
}

void *sub_261B67F3C(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, char a14)
{
  if (a14) {
    return sub_261B67B30(a1, a2, (uint64_t)a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  }
  else {
    return sub_261B67A90(a1, a2, a3, a4, (char)a5);
  }
}

void *sub_261B67F68(void *result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11, char a12)
{
  if (a12) {
    return sub_261B67A90(result, a2, a3, a4, a5);
  }
  else {
    return (void *)sub_261B67F8C((uint64_t)result, a2, (uint64_t)a3, a4, a5, a6, a7, a8, a9, a10, a11);
  }
}

uint64_t sub_261B67F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 != 255) {
    return sub_261B67FB0();
  }
  return result;
}

uint64_t sub_261B67FB0()
{
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_261B68014(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13, char a14)
{
  if (a14) {
    return sub_261B67878(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_261B68040(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13)
{
  if (a13 != 255) {
    return sub_261B6806C(a1, a2, a3, a4, a5, a6);
  }
  return a1;
}

uint64_t sub_261B6806C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  char v7 = a6 & 1;
  sub_261A02A18(a1, a2, a3 & 1);
  swift_bridgeObjectRelease();
  sub_2619F7790(a5, v7);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_261B680F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, __int16 a14, char a15, char a16, char a17)
{
  if ((a17 & 1) == 0) {
    return sub_261B681C4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15 & 1, (uint64_t (*)(uint64_t, uint64_t))sub_261B68290, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261B68398, (uint64_t (*)(void))sub_261B684A8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_261B68560);
  }
  return sub_261B6865C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15 & 1);
}

uint64_t sub_261B681C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, __int16 a14, char a15, uint64_t (*a16)(uint64_t, uint64_t), uint64_t (*a17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a18)(void), uint64_t (*a19)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a15) {
    return sub_261B68460(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, (unsigned __int16)(a13 & 0x1FF) >> 8, a18, a19);
  }
  else {
    return sub_261B68240(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, (unsigned __int16)(a14 & 0x1FF) >> 8, a16, a17);
  }
}

uint64_t sub_261B68240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char a15, uint64_t (*a16)(uint64_t, uint64_t), uint64_t (*a17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a15) {
    return a17(a1, a2, a3, a4, a5);
  }
  else {
    return a16(a1, a2);
  }
}

void *sub_261B68290(void *result, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, char a11)
{
  if (a11) {
    return sub_261B68324(result, a2, a3, a4, (char)a5);
  }
  else {
    return sub_261B682AC(result, a2, (uint64_t)a3, a4, a5, a6, a7, a8, a9);
  }
}

void *sub_261B682AC(void *result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (result)
  {

    swift_bridgeObjectRelease();
    sub_2619F7790(a8, a9 & 1);
    return (void *)swift_release();
  }
  return result;
}

void *sub_261B68324(void *result, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  if (result)
  {

    sub_2619F7790(a4, a5 & 1);
    swift_release();
    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_261B68398(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, char a14)
{
  if (a14) {
    return sub_261B682AC(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else {
    return sub_261B683C4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  }
}

void *sub_261B683C4(void *result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, char a10, uint64_t a11, char a12)
{
  if (result)
  {

    sub_2619F7790(a7, a8 & 1);
    sub_2619F7790(a9, a10 & 1);
    sub_2619F7790(a11, a12 & 1);
    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_261B68460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, char a14, uint64_t (*a15)(void), uint64_t (*a16)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a14) {
    return a16(a1, a2, a3, a4);
  }
  else {
    return a15();
  }
}

uint64_t sub_261B684A8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a9) {
    return sub_261B68504(a1, a2, a3, a4, a5, a6);
  }
  else {
    return sub_261B684B8(a1, (void *)a2);
  }
}

uint64_t sub_261B684B8(uint64_t a1, void *a2)
{
  if (a2)
  {

    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_261B68504(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, char a6)
{
  if (a4)
  {

    sub_2619F7790(a5, a6 & 1);
    return swift_release();
  }
  return result;
}

uint64_t sub_261B68560(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  if (a13) {
    return sub_261B685DC(a1, a2);
  }
  else {
    return sub_261B6858C(a1, a2, a3, a4);
  }
}

uint64_t sub_261B6858C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_261A02A18(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_261B685DC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_261B6865C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, __int16 a14, char a15)
{
  if (a15) {
    return sub_261B687DC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, BYTE2(a13) & 1, (uint64_t (*)(uint64_t, uint64_t))sub_261B68830, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_261B688DC);
  }
  else {
    return sub_261B67E5C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, (unsigned __int16)(a14 & 0x1FF) >> 8, (uint64_t (*)(void))sub_261B68754, (uint64_t (*)(void))sub_261B68324, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_261B687B0);
  }
}

uint64_t sub_261B6872C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t (*a12)(void), uint64_t (*a13)(void))
{
  if (a11) {
    return a13();
  }
  else {
    return a12();
  }
}

uint64_t sub_261B68754(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (result)
  {
    swift_release();
    swift_release();
    return sub_2619F7790(a4, a5 & 1);
  }
  return result;
}

void *sub_261B687B0(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, char a14)
{
  if (a14) {
    return sub_261B683C4(a1, a2, (uint64_t)a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  }
  else {
    return sub_261B68324(a1, a2, a3, a4, (char)a5);
  }
}

uint64_t sub_261B687DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int16 a13, char a14, uint64_t (*a15)(uint64_t, uint64_t), uint64_t (*a16)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a14) {
    return a16(a1, a2, a3, a4);
  }
  else {
    return a15(a1, a2);
  }
}

void *sub_261B68830(void *result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11, char a12)
{
  if (a12) {
    return sub_261B68324(result, a2, a3, a4, a5);
  }
  else {
    return (void *)sub_261B68854((uint64_t)result, a2, (uint64_t)a3, a4, a5, a6, a7, a8, a9, a10, a11);
  }
}

uint64_t sub_261B68854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 != 255) {
    return sub_261B68878();
  }
  return result;
}

uint64_t sub_261B68878()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_261B688DC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13, char a14)
{
  if (a14) {
    return sub_261B68040(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
  }
  else {
    return swift_release();
  }
}

void *sub_261B68910(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9469E8);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_261B68978(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_261B8F228();
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
    uint64_t v5 = MEMORY[0x263E4D0C0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unsigned __int8 *sub_261B68A1C(uint64_t a1, uint64_t a2, int64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_261B8F258();
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
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_261B68D80();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)sub_261B8F928();
  }
LABEL_7:
  uint64_t v11 = sub_261B68B04(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_261B68B04(unsigned __int8 *result, uint64_t a2, int64_t a3)
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
            for (int64_t i = result + 1; ; ++i)
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
              if (!is_mul_ok(v9, a3)) {
                return 0;
              }
              unint64_t v13 = v9 * a3;
              unsigned __int8 v14 = v11 + v12;
              BOOL v15 = v13 >= v14;
              unint64_t v9 = v13 - v14;
              if (!v15) {
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
      goto LABEL_66;
    }
    if (a2)
    {
      unsigned __int8 v25 = a3 + 48;
      unsigned __int8 v26 = a3 + 55;
      unsigned __int8 v27 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v25 = 58;
      }
      else
      {
        unsigned __int8 v27 = 97;
        unsigned __int8 v26 = 65;
      }
      if (result)
      {
        unint64_t v28 = 0;
        do
        {
          unsigned int v29 = *result;
          if (v29 < 0x30 || v29 >= v25)
          {
            if (v29 < 0x41 || v29 >= v26)
            {
              if (v29 < 0x61 || v29 >= v27) {
                return 0;
              }
              char v30 = -87;
            }
            else
            {
              char v30 = -55;
            }
          }
          else
          {
            char v30 = -48;
          }
          if (!is_mul_ok(v28, a3)) {
            return 0;
          }
          unint64_t v31 = v28 * a3;
          unsigned __int8 v32 = v29 + v30;
          BOOL v15 = __CFADD__(v31, v32);
          unint64_t v28 = v31 + v32;
          if (v15) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v28;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  uint64_t v16 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v17 = a3 + 48;
  unsigned __int8 v18 = a3 + 55;
  unsigned __int8 v19 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v17 = 58;
  }
  else
  {
    unsigned __int8 v19 = 97;
    unsigned __int8 v18 = 65;
  }
  if (!result) {
    return 0;
  }
  unint64_t v9 = 0;
  uint64_t v20 = result + 1;
  do
  {
    unsigned int v21 = *v20;
    if (v21 < 0x30 || v21 >= v17)
    {
      if (v21 < 0x41 || v21 >= v18)
      {
        if (v21 < 0x61 || v21 >= v19) {
          return 0;
        }
        char v22 = -87;
      }
      else
      {
        char v22 = -55;
      }
    }
    else
    {
      char v22 = -48;
    }
    if (!is_mul_ok(v9, a3)) {
      return 0;
    }
    unint64_t v23 = v9 * a3;
    unsigned __int8 v24 = v21 + v22;
    BOOL v15 = __CFADD__(v23, v24);
    unint64_t v9 = v23 + v24;
    if (v15) {
      return 0;
    }
    ++v20;
    --v16;
  }
  while (v16);
  return (unsigned __int8 *)v9;
}

uint64_t sub_261B68D80()
{
  unint64_t v0 = sub_261B8F268();
  uint64_t v4 = sub_261B68E00(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_261B68E00(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_261B68F58(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_261B68910(v9, 0);
      unint64_t v12 = sub_261B69058((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_261B8F928();
LABEL_4:
        JUMPOUT(0x263E4D040);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x263E4D040](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x263E4D040]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_261B68F58(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_261B68978(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_261B68978(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_261B69058(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    void v9[2] = a6;
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
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_261B68978(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_261B8F218();
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
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_261B8F928();
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
    uint64_t result = sub_261B68978(v12, a6, a7);
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
    unint64_t v12 = sub_261B8F1E8();
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

unint64_t sub_261B6926C(unint64_t result, unint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = result;
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  if (!((a2 & 0x2000000000000000) != 0 ? v4 : result & 0xFFFFFFFFFFFFLL)) {
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        unint64_t v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        unint64_t v7 = (unsigned __int8 *)sub_261B8F928();
      }
      unint64_t v8 = (unint64_t)sub_261B68B04(v7, v5, 10);
      char v10 = v9 & 1;
      goto LABEL_39;
    }
    v26[0] = result;
    v26[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v4) {
        goto LABEL_64;
      }
      if (v4 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_35;
      }
      unint64_t v8 = (BYTE1(result) - 48);
      if (v4 != 2)
      {
        if ((BYTE2(result) - 48) > 9u) {
          goto LABEL_35;
        }
        unint64_t v8 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
        uint64_t v14 = v4 - 3;
        if (v14)
        {
          uint64_t v15 = (unsigned __int8 *)v26 + 3;
          while (1)
          {
            unsigned int v16 = *v15 - 48;
            if (v16 > 9) {
              goto LABEL_35;
            }
            if (!is_mul_ok(v8, 0xAuLL)) {
              goto LABEL_35;
            }
            BOOL v12 = __CFADD__(10 * v8, v16);
            unint64_t v8 = 10 * v8 + v16;
            if (v12) {
              goto LABEL_35;
            }
            char v10 = 0;
            ++v15;
            if (!--v14) {
              goto LABEL_39;
            }
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v4)
        {
          if (v4 != 1)
          {
            unsigned __int8 v11 = BYTE1(result) - 48;
            if ((BYTE1(result) - 48) <= 9u)
            {
              unint64_t v8 = 0;
              BOOL v12 = v11 == 0;
              unint64_t v13 = -(uint64_t)v11;
              if (!v12) {
                goto LABEL_36;
              }
              if (v4 == 2)
              {
                char v10 = 0;
                unint64_t v8 = v13;
                goto LABEL_39;
              }
              unsigned __int8 v20 = BYTE2(result) - 48;
              if ((BYTE2(result) - 48) <= 9u && is_mul_ok(v13, 0xAuLL))
              {
                unint64_t v21 = 10 * v13;
                unint64_t v8 = v21 - v20;
                if (v21 >= v20)
                {
                  uint64_t v22 = v4 - 3;
                  if (v22)
                  {
                    unint64_t v23 = (unsigned __int8 *)v26 + 3;
                    while (1)
                    {
                      unsigned int v24 = *v23 - 48;
                      if (v24 > 9) {
                        goto LABEL_35;
                      }
                      if (!is_mul_ok(v8, 0xAuLL)) {
                        goto LABEL_35;
                      }
                      BOOL v12 = 10 * v8 >= v24;
                      unint64_t v8 = 10 * v8 - v24;
                      if (!v12) {
                        goto LABEL_35;
                      }
                      char v10 = 0;
                      ++v23;
                      if (!--v22) {
                        goto LABEL_39;
                      }
                    }
                  }
                  goto LABEL_38;
                }
              }
            }
          }
LABEL_35:
          unint64_t v8 = 0;
LABEL_36:
          char v10 = 1;
          goto LABEL_39;
        }
        __break(1u);
LABEL_64:
        __break(1u);
        return result;
      }
      if (!v4 || (result - 48) > 9u) {
        goto LABEL_35;
      }
      unint64_t v8 = (result - 48);
      if (v4 != 1)
      {
        if ((BYTE1(result) - 48) > 9u) {
          goto LABEL_35;
        }
        unint64_t v8 = 10 * (result - 48) + (BYTE1(result) - 48);
        uint64_t v17 = v4 - 2;
        if (v17)
        {
          unint64_t v18 = (unsigned __int8 *)v26 + 2;
          while (1)
          {
            unsigned int v19 = *v18 - 48;
            if (v19 > 9) {
              goto LABEL_35;
            }
            if (!is_mul_ok(v8, 0xAuLL)) {
              goto LABEL_35;
            }
            BOOL v12 = __CFADD__(10 * v8, v19);
            unint64_t v8 = 10 * v8 + v19;
            if (v12) {
              goto LABEL_35;
            }
            char v10 = 0;
            ++v18;
            if (!--v17) {
              goto LABEL_39;
            }
          }
        }
      }
    }
LABEL_38:
    char v10 = 0;
    goto LABEL_39;
  }
  swift_bridgeObjectRetain();
  unint64_t v8 = (unint64_t)sub_261B68A1C(v3, a2, 10);
  char v10 = v25;
  swift_bridgeObjectRelease();
LABEL_39:
  if (v10) {
    return 0;
  }
  else {
    return v8;
  }
}

unint64_t sub_261B6956C()
{
  unint64_t result = qword_26A948668;
  if (!qword_26A948668)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948670);
    sub_261B66838();
    sub_261B67754();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948668);
  }
  return result;
}

uint64_t *sub_261B695E8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    unint64_t v7 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = (uint64_t)v7;
    uint64_t v8 = a3[6];
    char v9 = (char *)a1 + v8;
    char v10 = (char *)a2 + v8;
    uint64_t v11 = sub_261B8C688();
    BOOL v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    id v13 = v7;
    v12(v9, v10, v11);
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    unsigned int v16 = *(void **)((char *)a2 + v14);
    *(uint64_t *)((char *)v4 + v14) = (uint64_t)v16;
    *(uint64_t *)((char *)v4 + v15) = *(uint64_t *)((char *)a2 + v15);
    id v17 = v16;
  }
  return v4;
}

void sub_261B696F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_261B8C688();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  unint64_t v6 = *(void **)(a1 + *(int *)(a2 + 28));
}

void *sub_261B69780(void *a1, void *a2, int *a3)
{
  unint64_t v6 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  char v9 = (char *)a2 + v7;
  uint64_t v10 = sub_261B8C688();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v6;
  v11(v8, v9, v10);
  uint64_t v13 = a3[7];
  uint64_t v14 = a3[8];
  uint64_t v15 = *(void **)((char *)a2 + v13);
  *(void *)((char *)a1 + v13) = v15;
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  id v16 = v15;
  return a1;
}

void *sub_261B6983C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  unint64_t v6 = (void *)a2[1];
  uint64_t v7 = (void *)a1[1];
  a1[1] = v6;
  id v8 = v6;

  uint64_t v9 = a3[6];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_261B8C688();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = a3[7];
  uint64_t v14 = *(void **)((char *)a2 + v13);
  uint64_t v15 = *(void **)((char *)a1 + v13);
  *(void *)((char *)a1 + v13) = v14;
  id v16 = v14;

  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

void *sub_261B69900(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_261B8C688();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  return a1;
}

void *sub_261B699A0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = (void *)a1[1];
  a1[1] = a2[1];

  uint64_t v7 = a3[6];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_261B8C688();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = *(void **)((char *)a1 + v11);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);

  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

uint64_t sub_261B69A5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_261B69A70);
}

uint64_t sub_261B69A70(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_261B8C688();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_261B69B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_261B69B34);
}

uint64_t sub_261B69B34(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_261B8C688();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for DistanceRemainingMetricView()
{
  uint64_t result = qword_26A948680;
  if (!qword_26A948680) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_261B69C28()
{
  uint64_t result = sub_261B8C688();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_261B69CDC()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_261B69CF8()
{
  uint64_t v1 = type metadata accessor for DistanceRemainingMetricView();
  uint64_t v2 = *(void *)((char *)v0 + *(int *)(v1 + 32));
  id v3 = *(id *)((char *)v0 + *(int *)(v1 + 28));
  double v4 = *v0;
  uint64_t v5 = *((void *)v0 + 1);
  uint64_t v6 = MEMORY[0x263E4DE70](v5);
  if (v2 == 3)
  {
    id v3 = objc_msgSend(v3, sel_localizedStringWithDistanceInMeters_distanceType_distanceUnit_unitStyle_roundingMode_, 3, v6, 0, 6, v4);
    if (v3)
    {
LABEL_5:
      uint64_t v9 = sub_261B8F0F8();

      return (id)v9;
    }
    __break(1u);
  }
  uint64_t v7 = self;
  id result = objc_msgSend(v3, sel_localizedStringWithDistanceInMeters_distanceUnit_unitStyle_decimalPrecision_roundingMode_decimalTrimmingMode_, v6, 0, objc_msgSend(v7, sel_defaultPrecisionForDistanceUnit_, MEMORY[0x263E4DE70](v5)), 6, 1, v4);
  id v3 = result;
  if (result) {
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_261B69E10()
{
  if (qword_26A942F18 != -1) {
    swift_once();
  }
  int v1 = byte_26A948678;
  id v2 = *(id *)(v0 + *(int *)(type metadata accessor for DistanceRemainingMetricView() + 28));
  uint64_t v3 = *(void *)(v0 + 8);
  uint64_t v4 = MEMORY[0x263E4DE70](v3);
  if (v1 == 1)
  {
    id v5 = objc_msgSend(self, sel_meterUnit);
    id v6 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v5, *(double *)v0);

    objc_msgSend(v6, sel_doubleValueForUnit_, v3);
    double v8 = v7;

    id v2 = objc_msgSend(v2, sel_localizedLongUnitStringForDistanceUnit_distanceInUnit_, v4, v8);
    if (v2)
    {
LABEL_7:
      uint64_t v10 = sub_261B8F0F8();

      return (id)v10;
    }
    __break(1u);
  }
  id result = objc_msgSend(v2, sel_localizedShortUnitStringForDistanceUnit_, v4);
  id v2 = result;
  if (result) {
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

void sub_261B69F88(uint64_t a1@<X8>)
{
  id v2 = objc_msgSend(self, sel_distanceColors);
  if (!v2)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v2, sel_nonGradientTextColor);

  if (!v4)
  {
LABEL_9:
    __break(1u);
    return;
  }
  uint64_t v5 = MEMORY[0x263E4C7B0](v4);
  id v6 = sub_261B69CF8();
  uint64_t v8 = v7;
  if (qword_26B416690 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v9 = (id)qword_26B416688;
  sub_261B8AA48();

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943F60);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_261B93F70;
  id v11 = sub_261B69E10();
  uint64_t v13 = v12;
  *(void *)(v10 + 56) = MEMORY[0x263F8D310];
  *(void *)(v10 + 64) = sub_261A2B2E8();
  *(void *)(v10 + 32) = v11;
  *(void *)(v10 + 40) = v13;
  uint64_t v14 = sub_261B8F118();
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  char v17 = sub_261B8DFD8();
  _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
  sub_261B8D358();
  id v49 = v6;
  uint64_t v50 = v8;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = v14;
  uint64_t v54 = v16;
  __int16 v55 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  char v58 = v17;
  uint64_t v59 = v18;
  uint64_t v60 = v19;
  uint64_t v61 = v20;
  uint64_t v62 = v21;
  char v63 = 0;
  if (qword_26A942CA8 != -1) {
    swift_once();
  }
  double v22 = *(double *)&qword_26A9447E0;
  sub_261B8ECA8();
  sub_2619FF958(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v32, 0.0, 1, v22, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  long long v46 = v32[12];
  long long v47 = v32[13];
  long long v42 = v32[8];
  long long v43 = v32[9];
  uint64_t v48 = v33;
  long long v44 = v32[10];
  long long v45 = v32[11];
  long long v38 = v32[4];
  long long v39 = v32[5];
  long long v40 = v32[6];
  long long v41 = v32[7];
  long long v34 = v32[0];
  long long v35 = v32[1];
  long long v36 = v32[2];
  long long v37 = v32[3];
  uint64_t KeyPath = swift_getKeyPath();
  long long v24 = v47;
  *(_OWORD *)(a1 + 192) = v46;
  *(_OWORD *)(a1 + 208) = v24;
  uint64_t v25 = v48;
  long long v26 = v43;
  *(_OWORD *)(a1 + 128) = v42;
  *(_OWORD *)(a1 + 144) = v26;
  long long v27 = v45;
  *(_OWORD *)(a1 + 160) = v44;
  *(_OWORD *)(a1 + 176) = v27;
  long long v28 = v39;
  *(_OWORD *)(a1 + 64) = v38;
  *(_OWORD *)(a1 + 80) = v28;
  long long v29 = v41;
  *(_OWORD *)(a1 + 96) = v40;
  *(_OWORD *)(a1 + 112) = v29;
  long long v30 = v35;
  *(_OWORD *)a1 = v34;
  *(_OWORD *)(a1 + 16) = v30;
  long long v31 = v37;
  *(_OWORD *)(a1 + 32) = v36;
  *(_OWORD *)(a1 + 48) = v31;
  *(void *)(a1 + 224) = v25;
  *(void *)(a1 + 232) = KeyPath;
  *(void *)(a1 + 240) = v5;
}

uint64_t sub_261B6A300()
{
  if (qword_26B416690 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = (id)qword_26B416688;
  uint64_t v1 = sub_261B8AA48();
  uint64_t v3 = v2;

  if (v1 == 49 && v3 == 0xE100000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v5 = 1;
  }
  else
  {
    char v5 = sub_261B8FBA8();
    uint64_t result = swift_bridgeObjectRelease();
  }
  byte_26A948678 = v5 & 1;
  return result;
}

unint64_t sub_261B6A43C()
{
  unint64_t result = qword_26A948690;
  if (!qword_26A948690)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948698);
    sub_261B6A514(&qword_26A9486A0, &qword_26A9486A8, (void (*)(void))sub_261B6A4E4);
    sub_261A830CC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948690);
  }
  return result;
}

uint64_t sub_261B6A4E4()
{
  return sub_261B6A514(&qword_26A9486B0, &qword_26A9486B8, (void (*)(void))sub_261A02AC8);
}

uint64_t sub_261B6A514(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

double WorkoutNotificationView.init(notification:formattingManager:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(double *)(a3 + 16) = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
  *(_OWORD *)(a3 + 24) = xmmword_261B95920;
  *(_OWORD *)(a3 + 40) = xmmword_261B95930;
  double result = 0.0;
  *(_OWORD *)(a3 + 56) = xmmword_261B95940;
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  return result;
}

uint64_t WorkoutNotificationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_261B8B9F8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)(v1 + 8);
  sub_261B8BA08();
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if (v8 == *MEMORY[0x263F87BD8])
  {
    uint64_t v9 = sub_261B8BA18();
    id v10 = v7;
    double v11 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
    *(void *)&long long v63 = v9;
    *((void *)&v63 + 1) = v10;
    *(void *)char v64 = 0;
    *(double *)&v64[8] = v11;
    *(_OWORD *)&v64[16] = xmmword_261B95920;
    *(_OWORD *)&v64[32] = xmmword_261B95930;
    *(_OWORD *)&v64[48] = xmmword_261B95940;
    LOBYTE(v65) = 0;
    goto LABEL_5;
  }
  if (v8 == *MEMORY[0x263F87BC8])
  {
    uint64_t v12 = sub_261B8BA18();
    id v10 = v7;
    double v13 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
    *(void *)&long long v63 = v12;
    *((void *)&v63 + 1) = v10;
    *(void *)char v64 = 1;
    *(double *)&v64[8] = v13;
    *(_OWORD *)&v64[16] = xmmword_261B95920;
    *(_OWORD *)&v64[32] = xmmword_261B95930;
    *(_OWORD *)&v64[48] = xmmword_261B95940;
    LOBYTE(v65) = 1;
LABEL_5:
    sub_261B6B1D4();
    swift_bridgeObjectRetain();
    id v14 = v10;
    sub_261B8DD68();
    long long v63 = v56;
    *(_OWORD *)char v64 = v57;
    *(_OWORD *)&v64[16] = v58;
    *(_OWORD *)&v64[32] = v59;
    *(_OWORD *)&v64[48] = v60;
    __int16 v65 = v61;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948700);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948718);
    sub_261B6B160();
    sub_261B6B228();
    sub_261B8DD68();
    __int16 v15 = v54;
    if (v55) {
      __int16 v16 = 256;
    }
    else {
      __int16 v16 = 0;
    }
LABEL_15:
    long long v56 = v49;
    long long v57 = v50;
    long long v58 = v51;
    long long v59 = v52;
    long long v60 = v53;
    __int16 v61 = v16 | v15;
    char v62 = 0;
LABEL_16:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9486E0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9486E8);
    sub_261B6B124();
    sub_261B6B30C();
    sub_261B8DD68();

    uint64_t result = swift_bridgeObjectRelease();
    long long v23 = v63;
    long long v24 = *(_OWORD *)v64;
    long long v25 = *(_OWORD *)&v64[16];
    long long v26 = *(_OWORD *)&v64[32];
    long long v27 = *(_OWORD *)&v64[48];
    __int16 v28 = v65;
    char v29 = v66;
    goto LABEL_17;
  }
  if (v8 == *MEMORY[0x263F87BE8])
  {
    uint64_t v17 = sub_261B8BA18();
    id v18 = v7;
    double v19 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
    *(void *)&long long v63 = v17;
    *((void *)&v63 + 1) = v18;
    *(double *)char v64 = v19;
    *(_OWORD *)&v64[8] = xmmword_261B95920;
    *(_OWORD *)&v64[24] = xmmword_261B95930;
    *(_OWORD *)&v64[40] = xmmword_261B95940;
    v64[56] = 0;
    goto LABEL_12;
  }
  if (v8 == *MEMORY[0x263F87BC0])
  {
    uint64_t v20 = sub_261B8BA18();
    id v18 = v7;
    double v21 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
    *(void *)&long long v63 = v20;
    *((void *)&v63 + 1) = v18;
    *(double *)char v64 = v21;
    *(_OWORD *)&v64[8] = xmmword_261B95920;
    *(_OWORD *)&v64[24] = xmmword_261B95930;
    *(_OWORD *)&v64[40] = xmmword_261B95940;
    v64[56] = 1;
LABEL_12:
    sub_261B6B264();
    sub_261B6B2B8();
    swift_bridgeObjectRetain();
    id v14 = v18;
    sub_261B8DD68();
    long long v63 = v56;
    *(_OWORD *)char v64 = v57;
    *(_OWORD *)&v64[16] = v58;
    *(_OWORD *)&v64[32] = v59;
    *(void *)&v64[48] = v60;
    *(void *)&v64[56] = BYTE8(v60);
    __int16 v65 = 256;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948700);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948718);
    sub_261B6B160();
    sub_261B6B228();
    sub_261B8DD68();
    __int16 v15 = v54;
    if (v55) {
      __int16 v16 = 256;
    }
    else {
      __int16 v16 = 0;
    }
    goto LABEL_15;
  }
  if (v8 == *MEMORY[0x263F87BB8])
  {
    uint64_t v30 = sub_261B8BA18();
    id v31 = v7;
    double v32 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
    *(void *)&long long v63 = v30;
    *((void *)&v63 + 1) = v31;
    *(double *)char v64 = v32;
    *(_OWORD *)&v64[8] = xmmword_261B95920;
    *(_OWORD *)&v64[24] = xmmword_261B95930;
    *(_OWORD *)&v64[40] = xmmword_261B95940;
    v64[56] = 0;
    sub_261B6B07C();
    sub_261B6B0D0();
    swift_bridgeObjectRetain();
    id v14 = v31;
    sub_261B8DD68();
    long long v63 = v56;
    *(_OWORD *)char v64 = v57;
    *(_OWORD *)&v64[16] = v58;
    *(_OWORD *)&v64[32] = v59;
    *(void *)&v64[48] = v60;
    *(_WORD *)&v64[56] = BYTE8(v60);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9486C0);
    sub_261B6B570(&qword_26A9486C8, &qword_26A9486C0, (void (*)(void))sub_261B6B07C, (void (*)(void))sub_261B6B0D0);
    sub_261B8DD68();
    uint64_t v33 = 256;
    if (!BYTE9(v53)) {
      uint64_t v33 = 0;
    }
LABEL_21:
    long long v56 = v49;
    long long v57 = v50;
    long long v58 = v51;
    long long v59 = v52;
    *(void *)&long long v60 = v53;
    *((void *)&v60 + 1) = v33 | BYTE8(v53);
    __int16 v61 = 0;
    char v62 = 1;
    goto LABEL_16;
  }
  if (v8 == *MEMORY[0x263F87BE0] || v8 == *MEMORY[0x263F87BD0])
  {
    uint64_t v35 = sub_261B8BA18();
    id v36 = v7;
    double v37 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
    *(void *)&long long v63 = v35;
    *((void *)&v63 + 1) = v36;
    *(double *)char v64 = v37;
    *(_OWORD *)&v64[8] = xmmword_261B95920;
    *(_OWORD *)&v64[24] = xmmword_261B95930;
    *(_OWORD *)&v64[40] = xmmword_261B95940;
    v64[56] = 1;
    sub_261B6B07C();
    sub_261B6B0D0();
    swift_bridgeObjectRetain();
    id v14 = v36;
    sub_261B8DD68();
    long long v63 = v56;
    *(_OWORD *)char v64 = v57;
    *(_OWORD *)&v64[16] = v58;
    *(_OWORD *)&v64[32] = v59;
    *(void *)&v64[48] = v60;
    *(_WORD *)&v64[56] = BYTE8(v60);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9486C0);
    sub_261B6B570(&qword_26A9486C8, &qword_26A9486C0, (void (*)(void))sub_261B6B07C, (void (*)(void))sub_261B6B0D0);
    sub_261B8DD68();
    uint64_t v33 = 256;
    if (!BYTE9(v53)) {
      uint64_t v33 = 0;
    }
    goto LABEL_21;
  }
  sub_261B8DB98();
  uint64_t v38 = sub_261B8E3B8();
  *(void *)&long long v48 = v39;
  *(void *)&long long v63 = v38;
  *((void *)&v63 + 1) = v39;
  char v41 = v40 & 1;
  *(void *)char v64 = v40 & 1;
  *(void *)&v64[8] = v42;
  *(void *)&long long v47 = v42;
  memset(&v64[16], 0, 41);
  v64[57] = 1;
  sub_261A001D0(v38, v39, v40 & 1);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9486C0);
  sub_261B6B570(&qword_26A9486C8, &qword_26A9486C0, (void (*)(void))sub_261B6B07C, (void (*)(void))sub_261B6B0D0);
  sub_261B8DD68();
  uint64_t v43 = 256;
  if (!BYTE9(v53)) {
    uint64_t v43 = 0;
  }
  long long v56 = v49;
  long long v57 = v50;
  long long v58 = v51;
  long long v59 = v52;
  *(void *)&long long v60 = v53;
  *((void *)&v60 + 1) = v43 | BYTE8(v53);
  __int16 v61 = 0;
  char v62 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9486E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9486E8);
  sub_261B6B124();
  sub_261B6B30C();
  sub_261B8DD68();
  sub_261A02A18(v38, v48, v41);
  swift_bridgeObjectRelease();
  long long v47 = *(_OWORD *)v64;
  long long v48 = v63;
  long long v45 = *(_OWORD *)&v64[32];
  long long v46 = *(_OWORD *)&v64[16];
  long long v44 = *(_OWORD *)&v64[48];
  __int16 v28 = v65;
  char v29 = v66;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  long long v27 = v44;
  long long v26 = v45;
  long long v25 = v46;
  long long v24 = v47;
  long long v23 = v48;
LABEL_17:
  *(_OWORD *)a1 = v23;
  *(_OWORD *)(a1 + 16) = v24;
  *(_OWORD *)(a1 + 32) = v25;
  *(_OWORD *)(a1 + 48) = v26;
  *(_OWORD *)(a1 + 64) = v27;
  *(_WORD *)(a1 + 80) = v28;
  *(unsigned char *)(a1 + 82) = v29;
  return result;
}

unint64_t sub_261B6B07C()
{
  unint64_t result = qword_26A9486D0;
  if (!qword_26A9486D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9486D0);
  }
  return result;
}

unint64_t sub_261B6B0D0()
{
  unint64_t result = qword_26A9486D8;
  if (!qword_26A9486D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9486D8);
  }
  return result;
}

uint64_t sub_261B6B124()
{
  return sub_261B6B570(&qword_26A9486F0, &qword_26A9486E0, (void (*)(void))sub_261B6B160, (void (*)(void))sub_261B6B228);
}

unint64_t sub_261B6B160()
{
  unint64_t result = qword_26A9486F8;
  if (!qword_26A9486F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948700);
    sub_261B6B1D4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9486F8);
  }
  return result;
}

unint64_t sub_261B6B1D4()
{
  unint64_t result = qword_26A948708;
  if (!qword_26A948708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948708);
  }
  return result;
}

uint64_t sub_261B6B228()
{
  return sub_261B6B570(&qword_26A948710, &qword_26A948718, (void (*)(void))sub_261B6B264, (void (*)(void))sub_261B6B2B8);
}

unint64_t sub_261B6B264()
{
  unint64_t result = qword_26A948720;
  if (!qword_26A948720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948720);
  }
  return result;
}

unint64_t sub_261B6B2B8()
{
  unint64_t result = qword_26A948728;
  if (!qword_26A948728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948728);
  }
  return result;
}

unint64_t sub_261B6B30C()
{
  unint64_t result = qword_26A948730;
  if (!qword_26A948730)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9486E8);
    sub_261B6B570(&qword_26A9486C8, &qword_26A9486C0, (void (*)(void))sub_261B6B07C, (void (*)(void))sub_261B6B0D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948730);
  }
  return result;
}

uint64_t sub_261B6B3C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeWithCopy for WorkoutNotificationView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  id v6 = v3;
  id v7 = v4;
  return a1;
}

uint64_t assignWithCopy for WorkoutNotificationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  long long v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  int v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

uint64_t assignWithTake for WorkoutNotificationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

ValueMetadata *type metadata accessor for WorkoutNotificationView()
{
  return &type metadata for WorkoutNotificationView;
}

uint64_t sub_261B6B520()
{
  return sub_261B6B570(&qword_26A948738, &qword_26A948740, (void (*)(void))sub_261B6B124, (void (*)(void))sub_261B6B30C);
}

uint64_t sub_261B6B570(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of MetricImpressionTracking.trackIndexPathApperance(_:cell:identifier:name:element:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(void))(a9 + 8))();
}

uint64_t dispatch thunk of MetricImpressionTracking.trackIndexPathDisappearance(_:identifier:name:element:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 16))();
}

uint64_t dispatch thunk of MetricImpressionTracking.trackShelfWithCellApperance(cell:indexPath:shelfIdentifier:shelfName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 24))();
}

uint64_t dispatch thunk of MetricImpressionTracking.updateVisibleBounds(_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of MetricImpressionTracking.snapshotOnScreenImpressions(on:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of MetricImpressionTracking.consumeImpressions(on:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of MetricImpressionTracking.removeAllImpressions()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

id WorkoutConfigurationColors.displayColor.getter()
{
  return *v0;
}

id WorkoutConfigurationColors.gradientLightColor.getter()
{
  return *(id *)(v0 + 8);
}

id WorkoutConfigurationColors.gradientDarkColor.getter()
{
  return *(id *)(v0 + 16);
}

id WorkoutConfigurationColors.gradientStartingColor.getter()
{
  return *(id *)(v0 + 24);
}

id WorkoutConfigurationColors.gradientEndingColor.getter()
{
  return *(id *)(v0 + 32);
}

void destroy for WorkoutConfigurationColors(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for WorkoutConfigurationColors(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  long long v5 = *(void **)(a2 + 16);
  id v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  id v7 = *(void **)(a2 + 32);
  a1[4] = v7;
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  return a1;
}

uint64_t assignWithCopy for WorkoutConfigurationColors(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  long long v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  id v10 = *(void **)(a2 + 16);
  id v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  double v13 = *(void **)(a2 + 24);
  id v14 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v13;
  id v15 = v13;

  __int16 v16 = *(void **)(a2 + 32);
  uint64_t v17 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v16;
  id v18 = v16;

  return a1;
}

uint64_t assignWithTake for WorkoutConfigurationColors(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  long long v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

ValueMetadata *type metadata accessor for WorkoutConfigurationColors()
{
  return &type metadata for WorkoutConfigurationColors;
}

uint64_t View.metricRow(padding:)(uint64_t a1, uint64_t a2, double a3)
{
  double v4 = a3;
  return MEMORY[0x263E4C680](&v4, a1, &type metadata for MetricRow, a2);
}

double MetricRow.additionalPadding.getter()
{
  return *(double *)v0;
}

void MetricRow.additionalPadding.setter(double a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*MetricRow.additionalPadding.modify())()
{
  return nullsub_1;
}

uint64_t MetricRow.body(content:)()
{
  uint64_t v1 = sub_261B8DED8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  double v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9433D0);
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v8 = *v0;
  double v9 = v8
     + _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
  uint64_t v10 = sub_261B8ECA8();
  sub_2619FFB34(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v7, 0.0, 1, v9, 0, v10, v11);
  sub_261B8DEC8();
  sub_261B6BC94();
  sub_261B8E6B8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_261B6BD6C((uint64_t)v7);
}

uint64_t sub_261B6BAB8()
{
  uint64_t v1 = sub_261B8DED8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  double v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9433D0);
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v8 = *v0;
  double v9 = v8
     + _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
  uint64_t v10 = sub_261B8ECA8();
  sub_2619FFB34(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v7, 0.0, 1, v9, 0, v10, v11);
  sub_261B8DEC8();
  sub_261B6BC94();
  sub_261B8E6B8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_261B6BD6C((uint64_t)v7);
}

unint64_t sub_261B6BC94()
{
  unint64_t result = qword_26A948748;
  if (!qword_26A948748)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9433D0);
    sub_261B6BD10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948748);
  }
  return result;
}

unint64_t sub_261B6BD10()
{
  unint64_t result = qword_26A948750;
  if (!qword_26A948750)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9433C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948750);
  }
  return result;
}

uint64_t sub_261B6BD6C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9433D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_261B6BDCC()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for MetricRow()
{
  return &type metadata for MetricRow;
}

uint64_t sub_261B6BDF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_261B6BE54()
{
  return swift_getWitnessTable();
}

uint64_t LocalizationFeatureBridge.init(rawValue:)(uint64_t a1)
{
  if (a1 == 2) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 0;
  }
  if (a1 == 1) {
    return 1;
  }
  else {
    return v1;
  }
}

void *sub_261B6BEE0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  if (*result == 2) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = *result == 1;
  }
  BOOL v3 = *result != 2 && *result != 1;
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

uint64_t LocalizationFeature.init(localizationFeatureBridge:)@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  if (result == 1)
  {
    char v2 = 0;
LABEL_5:
    *a2 = v2;
    return result;
  }
  if (result == 2)
  {
    char v2 = 1;
    goto LABEL_5;
  }
  unint64_t result = sub_261B8FBD8();
  __break(1u);
  return result;
}

unint64_t sub_261B6BF74()
{
  unint64_t result = qword_26A948758;
  if (!qword_26A948758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948758);
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalizationFeatureBridge()
{
  return &type metadata for LocalizationFeatureBridge;
}

uint64_t WorkoutNotificationStandardView.body.getter@<X0>(uint64_t a1@<X8>)
{
  long long v3 = v1[3];
  long long v14 = v1[2];
  long long v15 = v3;
  uint64_t v16 = *((void *)v1 + 8);
  long long v4 = v1[1];
  long long v12 = *v1;
  long long v13 = v4;
  uint64_t v5 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A948760) + 56);
  *(double *)uint64_t v5 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
  *(_OWORD *)(v5 + 8) = xmmword_261B95920;
  *(_OWORD *)(v5 + 24) = xmmword_261B95930;
  *(_OWORD *)(v5 + 40) = xmmword_261B95940;
  uint64_t v6 = sub_261B8DBF8();
  uint64_t v7 = *((void *)&v13 + 1);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948768);
  uint64_t v17 = v12;
  swift_getKeyPath();
  uint64_t v8 = swift_allocObject();
  long long v9 = v1[3];
  *(_OWORD *)(v8 + 48) = v1[2];
  *(_OWORD *)(v8 + 64) = v9;
  *(void *)(v8 + 80) = *((void *)v1 + 8);
  long long v10 = v1[1];
  *(_OWORD *)(v8 + 16) = *v1;
  *(_OWORD *)(v8 + 32) = v10;
  sub_261A001E0((uint64_t)&v17);
  sub_261A03EBC((uint64_t)&v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948770);
  sub_2619F8AB8(&qword_26A948778, &qword_26A948770);
  sub_261B6C368();
  sub_261A03FC0();
  return sub_261B8EBE8();
}

uint64_t sub_261B6C19C@<X0>(uint64_t a1@<X8>)
{
  long long v3 = v1[3];
  long long v14 = v1[2];
  long long v15 = v3;
  uint64_t v16 = *((void *)v1 + 8);
  long long v4 = v1[1];
  long long v12 = *v1;
  long long v13 = v4;
  uint64_t v5 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A948760) + 56);
  *(double *)uint64_t v5 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
  *(_OWORD *)(v5 + 8) = xmmword_261B95920;
  *(_OWORD *)(v5 + 24) = xmmword_261B95930;
  *(_OWORD *)(v5 + 40) = xmmword_261B95940;
  uint64_t v6 = sub_261B8DBF8();
  uint64_t v7 = *((void *)&v13 + 1);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948768);
  uint64_t v17 = v12;
  swift_getKeyPath();
  uint64_t v8 = swift_allocObject();
  long long v9 = v1[3];
  *(_OWORD *)(v8 + 48) = v1[2];
  *(_OWORD *)(v8 + 64) = v9;
  *(void *)(v8 + 80) = *((void *)v1 + 8);
  long long v10 = v1[1];
  *(_OWORD *)(v8 + 16) = *v1;
  *(_OWORD *)(v8 + 32) = v10;
  sub_261A001E0((uint64_t)&v17);
  sub_261A03EBC((uint64_t)&v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948770);
  sub_2619F8AB8(&qword_26A948778, &qword_26A948770);
  sub_261B6C368();
  sub_261A03FC0();
  return sub_261B8EBE8();
}

unint64_t sub_261B6C368()
{
  unint64_t result = qword_26A948780;
  if (!qword_26A948780)
  {
    sub_261B8BBE8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948780);
  }
  return result;
}

uint64_t sub_261B6C3C0()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for WorkoutNotificationStandardView()
{
  return &type metadata for WorkoutNotificationStandardView;
}

uint64_t sub_261B6C3EC()
{
  return sub_2619F8AB8(&qword_26A948788, &qword_26A948760);
}

uint64_t objectdestroyTm_5()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 88, 7);
}

id sub_261B6C46C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v4 = *(id *)(v2 + 24);
  *a2 = *a1;
  a2[1] = v4;
  a2[2] = 0;
  swift_retain();
  return v4;
}

uint64_t PowerMetricView.init(activityType:power:metricType:formattingManager:workoutPaused:lowPowerModeAnimationSuspended:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, char a7@<W6>, uint64_t a8@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v17 = swift_getKeyPath();
  uint64_t result = swift_getKeyPath();
  *(void *)a8 = a1;
  *(void *)(a8 + 8) = a2;
  *(unsigned char *)(a8 + 16) = a3 & 1;
  *(void *)(a8 + 24) = a4;
  *(void *)(a8 + 32) = a5;
  *(unsigned char *)(a8 + 40) = a6;
  *(unsigned char *)(a8 + 41) = a7;
  *(void *)(a8 + 48) = KeyPath;
  *(unsigned char *)(a8 + 56) = 0;
  *(void *)(a8 + 64) = v17;
  *(unsigned char *)(a8 + 72) = 0;
  *(void *)(a8 + 80) = result;
  *(unsigned char *)(a8 + 88) = 0;
  return result;
}

uint64_t sub_261B6C56C()
{
  uint64_t v1 = 0xD000000000000012;
  uint64_t v2 = *(void **)v0;
  long long v3 = *(void **)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 48);
  char v5 = *(unsigned char *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 64);
  char v7 = *(unsigned char *)(v0 + 72);
  uint64_t v8 = *(void *)(v0 + 80);
  char v9 = *(unsigned char *)(v0 + 88);
  switch(*(void *)(v0 + 24))
  {
    case 0xBLL:
      id v10 = v2;
      id v11 = v3;
      sub_2619F7774(v4, v5);
      sub_2619F7774(v6, v7);
      sub_2619F7774(v8, v9);
      sub_2619F7774(v6, v7);
      sub_2619FA43C(v6, v7, v26);
      sub_2619F7790(v6, v7);

      sub_2619F7790(v4, v5);
      sub_2619F7790(v6, v7);
      sub_2619F7790(v8, v9);
      if (v26[0] == 3) {
        goto LABEL_5;
      }
      id v12 = v10;
      id v13 = v11;
      sub_2619F7774(v4, v5);
      sub_2619F7774(v6, v7);
      sub_2619F7774(v8, v9);
      sub_2619F7774(v6, v7);
      sub_2619FA43C(v6, v7, v26);
      sub_2619F7790(v6, v7);

      sub_2619F7790(v4, v5);
      sub_2619F7790(v6, v7);
      sub_2619F7790(v8, v9);
      if (v26[0] == 5) {
        goto LABEL_5;
      }
      id v14 = v12;
      id v15 = v13;
      sub_2619F7774(v4, v5);
      sub_2619F7774(v6, v7);
      sub_2619F7774(v8, v9);
      sub_2619F7774(v6, v7);
      sub_2619FA43C(v6, v7, v26);
      sub_2619F7790(v6, v7);

      sub_2619F7790(v4, v5);
      sub_2619F7790(v6, v7);
      sub_2619F7790(v8, v9);
      if (v26[0] == 6)
      {
LABEL_5:
        if (qword_26B416690 != -1) {
          goto LABEL_29;
        }
        goto LABEL_24;
      }
      return 0;
    case 0xCLL:
      id v16 = v2;
      id v17 = v3;
      sub_2619F7774(v4, v5);
      sub_2619F7774(v6, v7);
      sub_2619F7774(v8, v9);
      sub_2619F7774(v6, v7);
      sub_2619FA43C(v6, v7, v26);
      sub_2619F7790(v6, v7);

      sub_2619F7790(v4, v5);
      sub_2619F7790(v6, v7);
      sub_2619F7790(v8, v9);
      if (v26[0] == 3) {
        goto LABEL_9;
      }
      id v18 = v16;
      id v19 = v17;
      sub_2619F7774(v4, v5);
      sub_2619F7774(v6, v7);
      sub_2619F7774(v8, v9);
      sub_2619F7774(v6, v7);
      sub_2619FA43C(v6, v7, v26);
      sub_2619F7790(v6, v7);

      sub_2619F7790(v4, v5);
      sub_2619F7790(v6, v7);
      sub_2619F7790(v8, v9);
      if (v26[0] == 5)
      {
LABEL_9:
        if (qword_26B416690 != -1) {
          goto LABEL_29;
        }
      }
      else if (qword_26B416690 != -1)
      {
        goto LABEL_29;
      }
      goto LABEL_24;
    case 0x2CLL:
      if (qword_26B416690 == -1) {
        goto LABEL_16;
      }
      goto LABEL_28;
    case 0x2DLL:
      if (qword_26B416690 == -1) {
        goto LABEL_16;
      }
      goto LABEL_28;
    case 0x2ELL:
      if (qword_26B416690 == -1) {
        goto LABEL_16;
      }
LABEL_28:
      swift_once();
LABEL_16:
      swift_beginAccess();
      id v20 = (id)qword_26B416688;
      goto LABEL_25;
    case 0x31:
      id v21 = v2;
      id v22 = v3;
      sub_2619F7774(v4, v5);
      sub_2619F7774(v6, v7);
      sub_2619F7774(v8, v9);
      sub_2619F7774(v6, v7);
      sub_2619FA43C(v6, v7, v26);
      sub_2619F7790(v6, v7);

      sub_2619F7790(v4, v5);
      sub_2619F7790(v6, v7);
      sub_2619F7790(v8, v9);
      if (v26[0] == 3) {
        goto LABEL_19;
      }
      id v23 = v21;
      id v24 = v22;
      sub_2619F7774(v4, v5);
      sub_2619F7774(v6, v7);
      sub_2619F7774(v8, v9);
      sub_2619F7774(v6, v7);
      sub_2619FA43C(v6, v7, v26);
      sub_2619F7790(v6, v7);

      sub_2619F7790(v4, v5);
      sub_2619F7790(v6, v7);
      sub_2619F7790(v8, v9);
      if (v26[0] == 5)
      {
LABEL_19:
        if (qword_26B416690 == -1) {
          goto LABEL_24;
        }
      }
      else if (qword_26B416690 == -1)
      {
        goto LABEL_24;
      }
LABEL_29:
      swift_once();
LABEL_24:
      swift_beginAccess();
      id v20 = (id)qword_26B416688;
LABEL_25:
      uint64_t v1 = sub_261B8AA48();

      return v1;
    default:
      return v1;
  }
}

uint64_t sub_261B6CEC4()
{
  uint64_t v1 = sub_261B8ABA8();
  uint64_t v27 = *(void *)(v1 - 8);
  uint64_t v28 = v1;
  MEMORY[0x270FA5388](v1);
  long long v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_261B8FB88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_261B8AEF8();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9453F8);
  MEMORY[0x270FA5388](v9);
  id v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  id v14 = (char *)&v25 - v13;
  double v17 = MEMORY[0x270FA5388](v15);
  id v19 = (char *)&v25 - v18;
  if ((*(unsigned char *)(v0 + 16) & 1) != 0
    || (v26 = v16, double v20 = *(double *)(v0 + 8), objc_msgSend(*(id *)v0, sel_identifier, v17) != (id)13) && v20 == 0.0)
  {
    if (qword_26B416690 != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v21 = (id)qword_26B416688;
    uint64_t v22 = sub_261B8AA48();
  }
  else
  {
    double v29 = v20;
    sub_261B8AE68();
    sub_261A63D24();
    sub_261B8AAE8();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8E220], v4);
    MEMORY[0x263E489F0](v7, 0, 1, v9);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    id v23 = *(void (**)(char *, uint64_t))(v26 + 8);
    v23(v11, v9);
    sub_261B8AB98();
    MEMORY[0x263E48A00](v3, v9);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v3, v28);
    v23(v14, v9);
    sub_2619F8AB8((unint64_t *)&qword_26A945408, &qword_26A9453F8);
    sub_261B8EFD8();
    v23(v19, v9);
    return v30;
  }
  return v22;
}

uint64_t sub_261B6D3F8()
{
  uint64_t v1 = 0;
  if ((*(unsigned char *)(v0 + 16) & 1) == 0 && *(double *)(v0 + 8) != 0.0)
  {
    if (*(void *)(v0 + 24) == 11)
    {
      uint64_t v2 = *(void **)(v0 + 32);
      uint64_t v3 = *(void *)(v0 + 48);
      char v4 = *(unsigned char *)(v0 + 56);
      uint64_t v5 = *(void *)(v0 + 64);
      char v6 = *(unsigned char *)(v0 + 72);
      uint64_t v7 = *(void *)(v0 + 80);
      char v8 = *(unsigned char *)(v0 + 88);
      id v9 = *(id *)v0;
      id v10 = v2;
      sub_2619F7774(v3, v4);
      sub_2619F7774(v5, v6);
      sub_2619F7774(v7, v8);
      sub_2619F7774(v5, v6);
      sub_2619FA43C(v5, v6, &v14);
      sub_2619F7790(v5, v6);

      sub_2619F7790(v3, v4);
      sub_2619F7790(v5, v6);
      sub_2619F7790(v7, v8);
      if (v14 != 6) {
        return 0;
      }
    }
    id v11 = objc_msgSend(self, sel_localizedShortPowerUnitString);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v1 = sub_261B8F0F8();
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uint64_t sub_261B6D564()
{
  uint64_t v2 = *(void **)v0;
  uint64_t v1 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  uint64_t v4 = sub_261B6C56C();
  if (v5)
  {
    unint64_t v43 = sub_261A029C4();
    unint64_t v44 = v43;
    uint64_t v41 = MEMORY[0x263F8D310];
    unint64_t v42 = v43;
    uint64_t v4 = sub_261B8F788();
    uint64_t v49 = v6;
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v49 = 0;
    if (v3) {
      goto LABEL_20;
    }
  }
  if (objc_msgSend(v2, sel_identifier, v41, v42, v43, v44) == (id)13)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A945650);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_261B94B90;
    uint64_t v47 = v4;
    uint64_t v8 = sub_261B6CEC4();
    uint64_t v10 = v9;
    uint64_t v45 = v8;
    *(void *)(inited + 32) = v8;
    *(void *)(inited + 40) = v9;
    uint64_t v11 = sub_261B6D3F8();
    uint64_t v13 = v12;
    *(void *)(inited + 48) = v11;
    *(void *)(inited + 56) = v12;
    uint64_t v14 = v47;
    uint64_t v15 = v49;
    *(void *)(inited + 64) = v47;
    *(void *)(inited + 72) = v49;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_261A0B1E4(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v18 = v16[2];
    unint64_t v17 = v16[3];
    unint64_t v19 = v18 + 1;
    if (v18 >= v17 >> 1) {
      uint64_t v16 = sub_261A0B1E4((void *)(v17 > 1), v18 + 1, 1, v16);
    }
    long long v16[2] = v19;
    double v20 = &v16[2 * v18];
    v20[4] = v45;
    v20[5] = v10;
    if (v13)
    {
      unint64_t v21 = v16[3];
      swift_bridgeObjectRetain();
      if (v19 >= v21 >> 1) {
        uint64_t v16 = sub_261A0B1E4((void *)(v21 > 1), v18 + 2, 1, v16);
      }
      long long v16[2] = v18 + 2;
      uint64_t v22 = &v16[2 * v19];
      v22[4] = v11;
      v22[5] = v13;
    }
    goto LABEL_23;
  }
  if ((v1 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A945650);
    uint64_t v23 = swift_initStackObject();
    *(_OWORD *)(v23 + 16) = xmmword_261B94B90;
    uint64_t v48 = v4;
    uint64_t v46 = sub_261B6CEC4();
    *(void *)(v23 + 32) = v46;
    *(void *)(v23 + 40) = v24;
    uint64_t v25 = v24;
    uint64_t v26 = sub_261B6D3F8();
    uint64_t v28 = v27;
    *(void *)(v23 + 48) = v26;
    *(void *)(v23 + 56) = v27;
    uint64_t v14 = v48;
    uint64_t v15 = v49;
    *(void *)(v23 + 64) = v48;
    *(void *)(v23 + 72) = v49;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_261A0B1E4(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v30 = v16[2];
    unint64_t v29 = v16[3];
    unint64_t v31 = v30 + 1;
    if (v30 >= v29 >> 1) {
      uint64_t v16 = sub_261A0B1E4((void *)(v29 > 1), v30 + 1, 1, v16);
    }
    long long v16[2] = v31;
    double v32 = &v16[2 * v30];
    v32[4] = v46;
    v32[5] = v25;
    if (v28)
    {
      unint64_t v33 = v16[3];
      swift_bridgeObjectRetain();
      if (v31 >= v33 >> 1) {
        uint64_t v16 = sub_261A0B1E4((void *)(v33 > 1), v30 + 2, 1, v16);
      }
      long long v16[2] = v30 + 2;
      long long v34 = &v16[2 * v31];
      v34[4] = v26;
      v34[5] = v28;
      if (!v49) {
        goto LABEL_27;
      }
      goto LABEL_24;
    }
LABEL_23:
    if (!v15)
    {
LABEL_27:
      swift_release();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A943578);
      sub_2619F8AB8((unint64_t *)&qword_26A943580, &qword_26A943578);
      uint64_t v36 = sub_261B8F048();
      swift_bridgeObjectRelease();
      return v36;
    }
LABEL_24:
    unint64_t v37 = v16[2];
    unint64_t v38 = v16[3];
    swift_bridgeObjectRetain();
    if (v37 >= v38 >> 1) {
      uint64_t v16 = sub_261A0B1E4((void *)(v38 > 1), v37 + 1, 1, v16);
    }
    long long v16[2] = v37 + 1;
    uint64_t v39 = &v16[2 * v37];
    v39[4] = v14;
    v39[5] = v15;
    goto LABEL_27;
  }
LABEL_20:
  swift_bridgeObjectRelease();
  if (qword_26B416690 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v35 = (id)qword_26B416688;
  uint64_t v36 = sub_261B8AA48();

  return v36;
}

uint64_t PowerMetricView.body.getter@<X0>(uint64_t a1@<X8>)
{
  long long v3 = v1[3];
  void v20[2] = v1[2];
  v20[3] = v3;
  v21[0] = v1[4];
  *(_OWORD *)((char *)v21 + 9) = *(_OWORD *)((char *)v1 + 73);
  long long v4 = v1[1];
  v20[0] = *v1;
  v20[1] = v4;
  uint64_t v19 = sub_261B6CEC4();
  uint64_t v6 = v5;
  uint64_t v7 = sub_261B6D3F8();
  uint64_t v9 = v8;
  uint64_t v10 = sub_261B6C56C();
  uint64_t v12 = v11;
  uint64_t v13 = sub_261B6D564();
  uint64_t v15 = v14;
  uint64_t v16 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A948790);
  uint64_t v17 = a1 + v16[11];
  *(void *)uint64_t v17 = swift_getKeyPath();
  *(unsigned char *)(v17 + 8) = 0;
  *(void *)(a1 + v16[12]) = 0x3FD6666666666666;
  *(void *)a1 = v19;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v12;
  *(_WORD *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v13;
  *(void *)(a1 + 64) = v15;
  *(unsigned char *)(a1 + 72) = 0;
  return sub_261B6DC88((uint64_t)v20, a1 + v16[10]);
}

uint64_t sub_261B6DC88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9487A0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9.n128_f64[0] = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v37 - v10;
  if (*(void *)(a1 + 24) == 11)
  {
    char v12 = *(unsigned char *)(a1 + 40);
    uint64_t v13 = 6;
    if (v12) {
      uint64_t v14 = 6;
    }
    else {
      uint64_t v14 = 1;
    }
    if ((*(unsigned char *)(a1 + 40) & 1) == 0) {
      uint64_t v13 = 3;
    }
    if (*(unsigned char *)(a1 + 16)) {
      double v15 = 0.0;
    }
    else {
      double v15 = *(double *)(a1 + 8);
    }
    if (*(unsigned char *)(a1 + 16)) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = v13;
    }
    uint64_t v38 = v16;
    uint64_t v39 = v8;
    uint64_t v17 = *(void *)(a1 + 48);
    char v18 = *(unsigned char *)(a1 + 56);
    sub_261B6E4E4(a1);
    sub_2619F7774(v17, v18);
    char v19 = sub_2619FABD0(v17, v18);
    sub_2619F7790(v17, v18);
    if (v19 & 1) != 0 || (v12)
    {
      sub_261B6E56C(a1);
    }
    else
    {
      uint64_t v20 = *(void *)(a1 + 80);
      char v21 = *(unsigned char *)(a1 + 88);
      sub_261B6E4E4(a1);
      sub_2619F7774(v20, v21);
      sub_2619FADD4(v20, v21, v42);
      sub_2619F7790(v20, v21);
      sub_261B6E56C(a1);
      LOBYTE(v20) = v42[0];
      sub_261B6E56C(a1);
      if ((v20 & 1) == 0)
      {
        char v22 = *(unsigned char *)(a1 + 41);
LABEL_22:
        uint64_t KeyPath = swift_getKeyPath();
        char v26 = sub_261B8DFD8();
        uint64_t v27 = *(void *)(a1 + 64);
        char v28 = *(unsigned char *)(a1 + 72);
        sub_261B6E4E4(a1);
        sub_2619F7774(v27, v28);
        sub_2619FA43C(v27, v28, v42);
        sub_2619F7790(v27, v28);
        sub_261B6E56C(a1);
        sub_261B8D358();
        v42[0] = v38;
        *(double *)&v42[1] = v15;
        char v43 = v22;
        uint64_t v44 = KeyPath;
        char v45 = 0;
        char v46 = v26;
        uint64_t v47 = v29;
        uint64_t v48 = v30;
        uint64_t v49 = v31;
        uint64_t v50 = v32;
        char v51 = 0;
        __int16 v52 = 257;
        if (qword_26B416690 != -1) {
          swift_once();
        }
        swift_beginAccess();
        id v33 = (id)qword_26B416688;
        uint64_t v34 = sub_261B8AA48();
        uint64_t v36 = v35;

        uint64_t v40 = v34;
        uint64_t v41 = v36;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A9487A8);
        sub_261B6E624(&qword_26A9487B0, &qword_26A9487A8, (void (*)(void))sub_261B6E5F4);
        sub_261A029C4();
        sub_261B8E668();
        swift_release();
        swift_bridgeObjectRelease();
        sub_261B6E6A0((uint64_t)v6, (uint64_t)v11);
        sub_261B6E6A0((uint64_t)v11, a2);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(a2, 0, 1, v4);
      }
    }
    char v22 = 1;
    goto LABEL_22;
  }
  uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(v8 + 56);
  return v23(a2, 1, 1, v4, v9);
}

uint64_t sub_261B6E0F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for PowerMetricView(uint64_t a1)
{
  sub_2619F7790(*(void *)(a1 + 48), *(unsigned char *)(a1 + 56));
  sub_2619F7790(*(void *)(a1 + 64), *(unsigned char *)(a1 + 72));
  uint64_t v2 = *(void *)(a1 + 80);
  char v3 = *(unsigned char *)(a1 + 88);
  return sub_2619F7790(v2, v3);
}

uint64_t initializeWithCopy for PowerMetricView(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  char v8 = *(unsigned char *)(a2 + 56);
  id v9 = v4;
  id v10 = v6;
  sub_2619F7774(v7, v8);
  *(void *)(a1 + 48) = v7;
  *(unsigned char *)(a1 + 56) = v8;
  uint64_t v11 = *(void *)(v2 + 64);
  char v12 = *(unsigned char *)(v2 + 72);
  sub_2619F7774(v11, v12);
  *(void *)(a1 + 64) = v11;
  *(unsigned char *)(a1 + 72) = v12;
  uint64_t v13 = *(void *)(v2 + 80);
  LOBYTE(v2) = *(unsigned char *)(v2 + 88);
  sub_2619F7774(v13, v2);
  *(void *)(a1 + 80) = v13;
  *(unsigned char *)(a1 + 88) = v2;
  return a1;
}

uint64_t assignWithCopy for PowerMetricView(uint64_t a1, void **a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *a2;
  id v6 = v4;

  uint64_t v7 = v2[1];
  *(unsigned char *)(a1 + 16) = *((unsigned char *)v2 + 16);
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 24) = v2[3];
  char v8 = v2[4];
  id v9 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v8;
  id v10 = v8;

  *(unsigned char *)(a1 + 40) = *((unsigned char *)v2 + 40);
  *(unsigned char *)(a1 + 41) = *((unsigned char *)v2 + 41);
  uint64_t v11 = (uint64_t)v2[6];
  char v12 = *((unsigned char *)v2 + 56);
  sub_2619F7774(v11, v12);
  uint64_t v13 = *(void *)(a1 + 48);
  char v14 = *(unsigned char *)(a1 + 56);
  *(void *)(a1 + 48) = v11;
  *(unsigned char *)(a1 + 56) = v12;
  sub_2619F7790(v13, v14);
  uint64_t v15 = (uint64_t)v2[8];
  char v16 = *((unsigned char *)v2 + 72);
  sub_2619F7774(v15, v16);
  uint64_t v17 = *(void *)(a1 + 64);
  char v18 = *(unsigned char *)(a1 + 72);
  *(void *)(a1 + 64) = v15;
  *(unsigned char *)(a1 + 72) = v16;
  sub_2619F7790(v17, v18);
  uint64_t v19 = (uint64_t)v2[10];
  LOBYTE(v2) = *((unsigned char *)v2 + 88);
  sub_2619F7774(v19, (char)v2);
  uint64_t v20 = *(void *)(a1 + 80);
  char v21 = *(unsigned char *)(a1 + 88);
  *(void *)(a1 + 80) = v19;
  *(unsigned char *)(a1 + 88) = (_BYTE)v2;
  sub_2619F7790(v20, v21);
  return a1;
}

__n128 __swift_memcpy89_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for PowerMetricView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;

  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  char v7 = *(unsigned char *)(a2 + 56);
  uint64_t v8 = *(void *)(a1 + 48);
  char v9 = *(unsigned char *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = v7;
  sub_2619F7790(v8, v9);
  char v10 = *(unsigned char *)(a2 + 72);
  uint64_t v11 = *(void *)(a1 + 64);
  char v12 = *(unsigned char *)(a1 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = v10;
  sub_2619F7790(v11, v12);
  char v13 = *(unsigned char *)(a2 + 88);
  uint64_t v14 = *(void *)(a1 + 80);
  char v15 = *(unsigned char *)(a1 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = v13;
  sub_2619F7790(v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for PowerMetricView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 89)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PowerMetricView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 88) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 89) = 1;
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
    *(unsigned char *)(result + 89) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PowerMetricView()
{
  return &type metadata for PowerMetricView;
}

uint64_t sub_261B6E4A8()
{
  return sub_2619F8AB8(&qword_26A948798, &qword_26A948790);
}

uint64_t sub_261B6E4E4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  char v4 = *(unsigned char *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  char v6 = *(unsigned char *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  char v8 = *(unsigned char *)(a1 + 88);
  id v9 = *(id *)a1;
  id v10 = v2;
  sub_2619F7774(v3, v4);
  sub_2619F7774(v5, v6);
  sub_2619F7774(v7, v8);
  return a1;
}

uint64_t sub_261B6E56C(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 48);
  char v4 = *(unsigned char *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  char v6 = *(unsigned char *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  char v8 = *(unsigned char *)(a1 + 88);

  sub_2619F7790(v3, v4);
  sub_2619F7790(v5, v6);
  sub_2619F7790(v7, v8);
  return a1;
}

uint64_t sub_261B6E5F4()
{
  return sub_261B6E624(&qword_26A9487B8, &qword_26A9487C0, (void (*)(void))sub_261A711EC);
}

uint64_t sub_261B6E624(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_261B6E6A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9487A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t View.metricUnitFont()(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath = swift_getKeyPath();
  char v6 = 0;
  MEMORY[0x263E4C680](&KeyPath, a1, &type metadata for MetricUnitFont, a2);
  return swift_release();
}

uint64_t sub_261B6E78C()
{
  return swift_getWitnessTable();
}

uint64_t initializeBufferWithCopyOfBuffer for MetricUnitFont(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_2619F7774(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t assignWithCopy for MetricUnitFont(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_2619F7774(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_2619F7790(v5, v6);
  return a1;
}

uint64_t assignWithTake for MetricUnitFont(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_2619F7790(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for MetricUnitFont(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MetricUnitFont(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MetricUnitFont()
{
  return &type metadata for MetricUnitFont;
}

uint64_t sub_261B6E968()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_261B6E984()
{
  qword_26A953738 = _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5);
}

uint64_t sub_261B6E9C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v101 = a1;
  uint64_t v111 = a2;
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9487C8);
  MEMORY[0x270FA5388](v94);
  uint64_t v95 = (uint64_t)&v86 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9487D0);
  MEMORY[0x270FA5388](v107);
  uint64_t v96 = (char *)&v86 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9487D8);
  MEMORY[0x270FA5388](v93);
  uint64_t v86 = (uint64_t)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v87 = (uint64_t)&v86 - v7;
  uint64_t v8 = sub_261B8E078();
  uint64_t v97 = *(void *)(v8 - 8);
  uint64_t v98 = v8;
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9487E0);
  MEMORY[0x270FA5388](v99);
  char v12 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9487E8);
  MEMORY[0x270FA5388](v102);
  uint64_t v92 = (uint64_t)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v100 = (uint64_t)&v86 - v15;
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9487F0);
  MEMORY[0x270FA5388](v108);
  __int16 v110 = (uint64_t *)((char *)&v86 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9487F8);
  MEMORY[0x270FA5388](v103);
  uint64_t v105 = (uint64_t)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948800);
  MEMORY[0x270FA5388](v89);
  uint64_t v90 = (uint64_t)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948808);
  MEMORY[0x270FA5388](v104);
  uint64_t v91 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948810);
  MEMORY[0x270FA5388](v109);
  id v106 = (char *)&v86 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948818);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v86 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948820);
  MEMORY[0x270FA5388](v24);
  char v26 = (char *)&v86 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948828);
  MEMORY[0x270FA5388](v88);
  char v28 = (char *)&v86 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)&v86 - v30;
  uint64_t v32 = *(void *)v2;
  char v33 = *(unsigned char *)(v2 + 8);
  sub_2619F7774(v32, v33);
  sub_2619FA43C(v32, v33, v112);
  sub_2619F7790(v32, v33);
  switch(v112[0])
  {
    case 1:
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948860);
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v53 - 8) + 16))(v23, v101, v53);
      unsigned __int8 v54 = &v23[*(int *)(v21 + 36)];
      *(_WORD *)unsigned __int8 v54 = 256;
      *((void *)v54 + 1) = KeyPath;
      v54[16] = 0;
      uint64_t v55 = swift_getKeyPath();
      sub_2619F86F0((uint64_t)v23, (uint64_t)v26, &qword_26A948818);
      long long v56 = &v26[*(int *)(v24 + 36)];
      *(void *)long long v56 = v55;
      v56[8] = 1;
      sub_2619F8754((uint64_t)v23, &qword_26A948818);
      if (qword_26A942F20 != -1) {
        swift_once();
      }
      uint64_t v57 = qword_26A953738;
      uint64_t v58 = swift_getKeyPath();
      sub_2619F86F0((uint64_t)v26, (uint64_t)v28, &qword_26A948820);
      long long v59 = (uint64_t *)&v28[*(int *)(v88 + 36)];
      *long long v59 = v58;
      v59[1] = v57;
      sub_2619F8754((uint64_t)v26, &qword_26A948820);
      uint64_t v48 = &qword_26A948828;
      sub_2619FB7EC((uint64_t)v28, (uint64_t)v31, &qword_26A948828);
      sub_2619F86F0((uint64_t)v31, v90, &qword_26A948828);
      swift_storeEnumTagMultiPayload();
      sub_261B6FBA0();
      sub_261B6FD80();
      uint64_t v60 = (uint64_t)v91;
      sub_261B8DD68();
      sub_2619F86F0(v60, v105, &qword_26A948808);
      swift_storeEnumTagMultiPayload();
      sub_261B6FADC();
      sub_261B6FEE4();
      uint64_t v61 = (uint64_t)v106;
      sub_261B8DD68();
      sub_2619F8754(v60, &qword_26A948808);
      sub_2619F86F0(v61, (uint64_t)v110, &qword_26A948810);
      swift_storeEnumTagMultiPayload();
      sub_261B6FB18(&qword_26A948830, &qword_26A948810, (void (*)(void))sub_261B6FADC, (void (*)(void))sub_261B6FEE4);
      sub_261B8DD68();
      sub_2619F8754(v61, &qword_26A948810);
      uint64_t v62 = (uint64_t)v31;
      goto LABEL_16;
    case 2:
    case 3:
    case 6:
      _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(43.0, 43.0, 43.0, 43.0, 43.0, 43.0, 43.0);
      sub_261B8E168();
      sub_261B8E058();
      uint64_t v40 = sub_261B8E178();
      (*(void (**)(char *, uint64_t))(v97 + 8))(v10, v98);
      uint64_t v41 = swift_getKeyPath();
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948860);
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v42 - 8) + 16))(v12, v101, v42);
      char v43 = (uint64_t *)&v12[*(int *)(v99 + 36)];
      *char v43 = v41;
      v43[1] = v40;
      if (qword_26A942F20 != -1) {
        swift_once();
      }
      uint64_t v44 = qword_26A953738;
      uint64_t v45 = swift_getKeyPath();
      uint64_t v46 = v92;
      sub_2619F86F0((uint64_t)v12, v92, &qword_26A9487E0);
      uint64_t v47 = (uint64_t *)(v46 + *(int *)(v102 + 36));
      *uint64_t v47 = v45;
      v47[1] = v44;
      sub_2619F8754((uint64_t)v12, &qword_26A9487E0);
      uint64_t v48 = &qword_26A9487E8;
      uint64_t v49 = v100;
      sub_2619FB7EC(v46, v100, &qword_26A9487E8);
      sub_2619F86F0(v49, v95, &qword_26A9487E8);
      swift_storeEnumTagMultiPayload();
      sub_261B6FF20();
      sub_261B6FD80();
      uint64_t v50 = (uint64_t)v96;
      sub_261B8DD68();
      char v51 = &qword_26A9487D0;
      sub_2619F86F0(v50, v105, &qword_26A9487D0);
      goto LABEL_15;
    case 4:
      _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(30.0, 30.0, 30.0, 30.0, 30.0, 30.0, 30.0);
      sub_261B8E168();
      sub_261B8E058();
      uint64_t v63 = sub_261B8E178();
      (*(void (**)(char *, uint64_t))(v97 + 8))(v10, v98);
      uint64_t v64 = swift_getKeyPath();
      uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948860);
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v65 - 8) + 16))(v12, v101, v65);
      char v66 = (uint64_t *)&v12[*(int *)(v99 + 36)];
      *char v66 = v64;
      v66[1] = v63;
      if (qword_26A942F20 != -1) {
        swift_once();
      }
      uint64_t v67 = qword_26A953738;
      uint64_t v68 = swift_getKeyPath();
      uint64_t v69 = v100;
      sub_2619F86F0((uint64_t)v12, v100, &qword_26A9487E0);
      uint64_t v70 = (uint64_t *)(v69 + *(int *)(v102 + 36));
      *uint64_t v70 = v68;
      v70[1] = v67;
      sub_2619F8754((uint64_t)v12, &qword_26A9487E0);
      uint64_t v71 = swift_getKeyPath();
      uint64_t v72 = v86;
      sub_2619F86F0(v69, v86, &qword_26A9487E8);
      uint64_t v73 = v72 + *(int *)(v93 + 36);
      *(void *)uint64_t v73 = v71;
      *(void *)(v73 + 8) = 1;
      *(unsigned char *)(v73 + 16) = 0;
      sub_2619F8754(v69, &qword_26A9487E8);
      uint64_t v48 = &qword_26A9487D8;
      uint64_t v74 = v87;
      sub_2619FB7EC(v72, v87, &qword_26A9487D8);
      sub_2619F86F0(v74, v95, &qword_26A9487D8);
      swift_storeEnumTagMultiPayload();
      sub_261B6FF20();
      sub_261B6FD80();
      uint64_t v75 = (uint64_t)v96;
      sub_261B8DD68();
      sub_2619F86F0(v75, v105, &qword_26A9487D0);
      swift_storeEnumTagMultiPayload();
      sub_261B6FADC();
      sub_261B6FEE4();
      uint64_t v76 = (uint64_t)v106;
      sub_261B8DD68();
      sub_2619F8754(v75, &qword_26A9487D0);
      sub_2619F86F0(v76, (uint64_t)v110, &qword_26A948810);
      swift_storeEnumTagMultiPayload();
      sub_261B6FB18(&qword_26A948830, &qword_26A948810, (void (*)(void))sub_261B6FADC, (void (*)(void))sub_261B6FEE4);
      sub_261B8DD68();
      sub_2619F8754(v76, &qword_26A948810);
      uint64_t v62 = v74;
      goto LABEL_16;
    case 5:
      _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(26.0, 26.0, 26.0, 26.0, 26.0, 26.0, 26.0);
      sub_261B8E168();
      sub_261B8E058();
      uint64_t v77 = sub_261B8E178();
      (*(void (**)(char *, uint64_t))(v97 + 8))(v10, v98);
      uint64_t v78 = swift_getKeyPath();
      uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948860);
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v79 - 8) + 16))(v12, v101, v79);
      char v80 = (uint64_t *)&v12[*(int *)(v99 + 36)];
      *char v80 = v78;
      v80[1] = v77;
      if (qword_26A942F20 != -1) {
        swift_once();
      }
      uint64_t v81 = qword_26A953738;
      uint64_t v82 = swift_getKeyPath();
      uint64_t v83 = v92;
      sub_2619F86F0((uint64_t)v12, v92, &qword_26A9487E0);
      id v84 = (uint64_t *)(v83 + *(int *)(v102 + 36));
      *id v84 = v82;
      v84[1] = v81;
      sub_2619F8754((uint64_t)v12, &qword_26A9487E0);
      uint64_t v48 = &qword_26A9487E8;
      uint64_t v49 = v100;
      sub_2619FB7EC(v83, v100, &qword_26A9487E8);
      sub_2619F86F0(v49, v90, &qword_26A9487E8);
      swift_storeEnumTagMultiPayload();
      sub_261B6FBA0();
      sub_261B6FD80();
      uint64_t v50 = (uint64_t)v91;
      sub_261B8DD68();
      char v51 = &qword_26A948808;
      sub_2619F86F0(v50, v105, &qword_26A948808);
LABEL_15:
      swift_storeEnumTagMultiPayload();
      sub_261B6FADC();
      sub_261B6FEE4();
      uint64_t v85 = (uint64_t)v106;
      sub_261B8DD68();
      sub_2619F8754(v50, v51);
      sub_2619F86F0(v85, (uint64_t)v110, &qword_26A948810);
      swift_storeEnumTagMultiPayload();
      sub_261B6FB18(&qword_26A948830, &qword_26A948810, (void (*)(void))sub_261B6FADC, (void (*)(void))sub_261B6FEE4);
      sub_261B8DD68();
      sub_2619F8754(v85, &qword_26A948810);
      uint64_t v62 = v49;
LABEL_16:
      uint64_t result = sub_2619F8754(v62, v48);
      break;
    default:
      sub_261B8DB98();
      uint64_t v34 = sub_261B8E3B8();
      uint64_t v35 = v110;
      *__int16 v110 = v34;
      v35[1] = v36;
      *((unsigned char *)v35 + 16) = v37 & 1;
      v35[3] = v38;
      swift_storeEnumTagMultiPayload();
      sub_261B6FB18(&qword_26A948830, &qword_26A948810, (void (*)(void))sub_261B6FADC, (void (*)(void))sub_261B6FEE4);
      uint64_t result = sub_261B8DD68();
      break;
  }
  return result;
}

uint64_t sub_261B6FADC()
{
  return sub_261B6FB18(&qword_26A948838, &qword_26A948808, (void (*)(void))sub_261B6FBA0, (void (*)(void))sub_261B6FD80);
}

uint64_t sub_261B6FB18(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_261B6FBA0()
{
  unint64_t result = qword_26A948840;
  if (!qword_26A948840)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948828);
    sub_261B6FC40();
    sub_2619F8AB8(&qword_26A943050, &qword_26A943058);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948840);
  }
  return result;
}

unint64_t sub_261B6FC40()
{
  unint64_t result = qword_26A948848;
  if (!qword_26A948848)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948820);
    sub_261B6FCE0();
    sub_2619F8AB8(&qword_26A948868, &qword_26A948870);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948848);
  }
  return result;
}

unint64_t sub_261B6FCE0()
{
  unint64_t result = qword_26A948850;
  if (!qword_26A948850)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948818);
    sub_2619F8AB8(&qword_26A948858, &qword_26A948860);
    sub_2619FBA38();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948850);
  }
  return result;
}

unint64_t sub_261B6FD80()
{
  unint64_t result = qword_26A948878;
  if (!qword_26A948878)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9487E8);
    sub_261B6FE20();
    sub_2619F8AB8(&qword_26A943050, &qword_26A943058);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948878);
  }
  return result;
}

unint64_t sub_261B6FE20()
{
  unint64_t result = qword_26A948880;
  if (!qword_26A948880)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9487E0);
    sub_2619F8AB8(&qword_26A948858, &qword_26A948860);
    sub_2619F8AB8((unint64_t *)&qword_26A9430D8, &qword_26A9430E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948880);
  }
  return result;
}

uint64_t sub_261B6FEE4()
{
  return sub_261B6FB18(&qword_26A948888, &qword_26A9487D0, (void (*)(void))sub_261B6FF20, (void (*)(void))sub_261B6FD80);
}

unint64_t sub_261B6FF20()
{
  unint64_t result = qword_26A948890;
  if (!qword_26A948890)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9487D8);
    sub_261B6FD80();
    sub_2619F8AB8(&qword_26A9430E8, &qword_26A9430F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948890);
  }
  return result;
}

uint64_t sub_261B6FFD8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_261B8D868();
  *a1 = result & 1;
  return result;
}

uint64_t sub_261B70008()
{
  return sub_261B8D878();
}

unint64_t sub_261B70034()
{
  unint64_t result = qword_26A948898;
  if (!qword_26A948898)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9488A0);
    sub_261B6FB18(&qword_26A948830, &qword_26A948810, (void (*)(void))sub_261B6FADC, (void (*)(void))sub_261B6FEE4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948898);
  }
  return result;
}

uint64_t StepProgressMetricView.init(currentIndex:currentStep:stepCount:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(unsigned char *)(a5 + 8) = a2 & 1;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = a4;
  return result;
}

uint64_t StepProgressMetricView.body.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  char v4 = *((unsigned char *)v1 + 8);
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v3;
  *(unsigned char *)(v7 + 24) = v4;
  *(void *)(v7 + 32) = v6;
  *(void *)(v7 + 40) = v5;
  *a1 = sub_261B70500;
  a1[1] = v7;
  return swift_retain();
}

void sub_261B70184(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int v31 = a3;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9488C0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9488C8);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__OFSUB__(a5, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v29 = a6;
    uint64_t v30 = v17;
    sub_261B8D528();
    double v21 = (v20 - ((double)(a5 - 1) + (double)(a5 - 1))) / (double)a5;
    if (v21 > 4.0) {
      double v22 = v21;
    }
    else {
      double v22 = 4.0;
    }
    uint64_t v23 = sub_261B8DF68();
    uint64_t v28 = (uint64_t)&v28;
    MEMORY[0x270FA5388](v23);
    *(&v28 - 8) = 0x4000000000000000;
    *(&v28 - 7) = a2;
    *((unsigned char *)&v28 - 48) = v31 & 1;
    *(&v28 - 5) = a4;
    *(&v28 - 4) = a5;
    *((double *)&v28 - 3) = v22;
    *(&v28 - 2) = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9488D0);
    sub_2619F8AB8(&qword_26A9488D8, &qword_26A9488D0);
    sub_261B8D378();
    sub_2619F8AB8(&qword_26A9488E0, &qword_26A9488C0);
    sub_261B8E5D8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    sub_261B8D528();
    sub_261B8D528();
    sub_261B8EC98();
    sub_261B8D4D8();
    uint64_t v25 = v29;
    uint64_t v24 = v30;
    (*(void (**)(uint64_t, char *, uint64_t))(v16 + 16))(v29, v19, v30);
    char v26 = (_OWORD *)(v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A9488E8) + 36));
    long long v27 = v33;
    *char v26 = v32;
    v26[1] = v27;
    void v26[2] = v34;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v24);
  }
}

uint64_t sub_261B704C8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_261B70504()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_261B70520@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  uint64_t v16 = sub_261B8D538();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v16);
  uint64_t result = sub_261B8DAD8();
  *(void *)a6 = result;
  *(double *)(a6 + 8) = a7;
  *(unsigned char *)(a6 + 16) = 0;
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v22[1] = a6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A9488F0) + 44);
    v22[2] = 0;
    v22[3] = a4;
    v22[0] = swift_getKeyPath();
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), a5, v16);
    unint64_t v20 = (*(unsigned __int8 *)(v17 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = a1;
    *(unsigned char *)(v21 + 24) = a2 & 1;
    *(void *)(v21 + 32) = a3;
    *(void *)(v21 + 40) = a4;
    *(double *)(v21 + 48) = a8;
    (*(void (**)(unint64_t, char *, uint64_t))(v17 + 32))(v21 + v20, (char *)v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9435F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9488F8);
    sub_261A03EF0();
    sub_261B71090();
    return sub_261B8EBE8();
  }
  return result;
}

double sub_261B70730@<D0>(void *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = 0;
  if ((a3 & 1) == 0 && a4)
  {
    if (*a1 >= a2)
    {
      if (*a1 <= a2)
      {
        swift_retain();
        uint64_t v6 = sub_261B8BC88();
        swift_release();
      }
      else
      {
        uint64_t v6 = 1;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  sub_261B8D528();
  sub_261B8EC98();
  sub_261B8D4D8();
  *(void *)a5 = v6;
  *(void *)(a5 + 8) = v8;
  *(unsigned char *)(a5 + 16) = v9;
  *(void *)(a5 + 24) = v10;
  *(unsigned char *)(a5 + 32) = v11;
  double result = *(double *)&v12;
  *(_OWORD *)(a5 + 40) = v12;
  return result;
}

uint64_t sub_261B7081C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  char v4 = *((unsigned char *)v1 + 8);
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v3;
  *(unsigned char *)(v7 + 24) = v4;
  *(void *)(v7 + 32) = v6;
  *(void *)(v7 + 40) = v5;
  *a1 = sub_261B70500;
  a1[1] = v7;
  return swift_retain();
}

uint64_t destroy for StepProgressMetricView()
{
  return swift_release();
}

uint64_t initializeWithCopy for StepProgressMetricView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for StepProgressMetricView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 16) = a2[2];
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = a2[3];
  return a1;
}

uint64_t assignWithTake for StepProgressMetricView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for StepProgressMetricView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
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

uint64_t storeEnumTagSinglePayload for StepProgressMetricView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)double result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StepProgressMetricView()
{
  return &type metadata for StepProgressMetricView;
}

uint64_t sub_261B70A58()
{
  return sub_2619F8AB8(&qword_26A9488A8, &qword_26A9488B0);
}

void *initializeBufferWithCopyOfBuffer for StepIndicator(void *a1, void **a2)
{
  unint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 2) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for StepIndicator(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 2) {
}
  }

void **assignWithCopy for StepIndicator(void **a1, void **a2)
{
  unint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)*a1 >= 2)
  {
    if ((unint64_t)v4 >= 2)
    {
      *a1 = v4;
      id v7 = v4;

      return a1;
    }

    id v4 = *a2;
    goto LABEL_6;
  }
  if ((unint64_t)v4 < 2)
  {
LABEL_6:
    *a1 = v4;
    return a1;
  }
  *a1 = v4;
  id v5 = v4;
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *double result = *a2;
  return result;
}

void **assignWithTake for StepIndicator(void **a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)*a1 >= 2)
  {
    if (v4 >= 2)
    {
      *a1 = (void *)v4;

      return a1;
    }
  }
  *a1 = (void *)v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for StepIndicator(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFFD && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 2;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StepIndicator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)double result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)double result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StepIndicator()
{
  return &type metadata for StepIndicator;
}

uint64_t sub_261B70C74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_261B70C90@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_261B8D748();
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  id v7 = (_OWORD *)((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9488B8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = (char *)v7 + *(int *)(v5 + 28);
  uint64_t v12 = *MEMORY[0x263F19860];
  uint64_t v13 = sub_261B8DBB8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(v11, v12, v13);
  __asm { FMOV            V0.2D, #2.0 }
  *id v7 = _Q0;
  if ((unint64_t)a1 > 1)
  {
    unint64_t v20 = _HKWorkoutGoalType.color.getter((uint64_t)objc_msgSend(a1, sel_goalTypeIdentifier));
    uint64_t v19 = MEMORY[0x263E4C7B0](v20);
    sub_261B70EE0(a1);
  }
  else
  {
    sub_261B8E898();
    uint64_t v19 = sub_261B8E8A8();
    swift_release();
  }
  uint64_t KeyPath = swift_getKeyPath();
  sub_261A1396C((uint64_t)v7, (uint64_t)v10);
  double v22 = (uint64_t *)&v10[*(int *)(v8 + 36)];
  *double v22 = KeyPath;
  v22[1] = v19;
  sub_261A139D0((uint64_t)v7);
  return sub_261B70E78((uint64_t)v10, a2);
}

uint64_t sub_261B70E68@<X0>(uint64_t a1@<X8>)
{
  return sub_261B70C90(*v1, a1);
}

uint64_t sub_261B70E78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9488B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_261B70EE0(id a1)
{
  if ((unint64_t)a1 >= 2) {
}
  }

void sub_261B70EF0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_261B70184(a1, *(void *)(v2 + 16), *(unsigned __int8 *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), a2);
}

uint64_t sub_261B70F08@<X0>(uint64_t a1@<X8>)
{
  return sub_261B70520(*(void *)(v1 + 24), *(unsigned char *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 64), a1, *(double *)(v1 + 16), *(double *)(v1 + 56));
}

uint64_t sub_261B70F2C()
{
  uint64_t v1 = sub_261B8D538();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

double sub_261B70FF8@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_261B8D538();
  uint64_t v5 = *(void *)(v2 + 16);
  char v6 = *(unsigned char *)(v2 + 24);
  uint64_t v7 = *(void *)(v2 + 32);
  return sub_261B70730(a1, v5, v6, v7, a2);
}

unint64_t sub_261B71090()
{
  unint64_t result = qword_26A948900;
  if (!qword_26A948900)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9488F8);
    sub_261B7110C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948900);
  }
  return result;
}

unint64_t sub_261B7110C()
{
  unint64_t result = qword_26A948908;
  if (!qword_26A948908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948908);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for StepState(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for StepState(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for StepState(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      id v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    id v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  id v5 = v4;

  return a1;
}

void **assignWithTake for StepState(void **a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for StepState(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for StepState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_261B7134C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_261B71364(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for StepState()
{
  return &type metadata for StepState;
}

unint64_t sub_261B71398()
{
  unint64_t result = qword_26A948910;
  if (!qword_26A948910)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9488B8);
    sub_261B71438();
    sub_2619F8AB8((unint64_t *)&qword_26A943AF0, &qword_26A943AF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948910);
  }
  return result;
}

unint64_t sub_261B71438()
{
  unint64_t result = qword_26A945330;
  if (!qword_26A945330)
  {
    sub_261B8D748();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A945330);
  }
  return result;
}

uint64_t EnergyMetricView.init(energy:energyType:workoutSectionType:formattingManager:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t result = swift_getKeyPath();
  *(double *)a4 = a5;
  *(void *)(a4 + 8) = a1;
  *(void *)(a4 + 16) = a2;
  *(void *)(a4 + 24) = a3;
  *(void *)(a4 + 32) = result;
  *(unsigned char *)(a4 + 40) = 0;
  return result;
}

uint64_t EnergyMetricView.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  char v5 = *(unsigned char *)(v0 + 40);
  id v6 = v3;
  sub_2619F7774(v4, v5);
  sub_2619F7774(v4, v5);
  sub_2619FA43C(v4, v5, &v11);
  sub_2619F7790(v4, v5);

  sub_2619F7790(v4, v5);
  id v7 = objc_msgSend(v6, sel_localizedShortTypeDistinguishingUnitStringForEnergyType_workoutSectionType_multiline_, v1, v2, v11 != 5);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = sub_261B8F0F8();

  return v9;
}

id EnergyMetricView.body.getter@<X0>(uint64_t a1@<X8>)
{
  double v3 = *(double *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  uint64_t v5 = *(void *)(v1 + 16);
  id v7 = *(void **)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v8 = *(unsigned char *)(v1 + 40);
  id result = objc_msgSend(v7, sel_localizedStringWithEnergyInCalories_energyType_unitStyle_, v4, 0, v3);
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = sub_261B8F0F8();
    uint64_t v13 = v12;

    id v14 = v7;
    sub_2619F7774(v6, v8);
    sub_2619F7774(v6, v8);
    sub_2619FA43C(v6, v8, &v20);
    sub_2619F7790(v6, v8);
    id v15 = objc_msgSend(v14, sel_localizedShortTypeDistinguishingUnitStringForEnergyType_workoutSectionType_multiline_, v4, v5, v20 != 5);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = sub_261B8F0F8();
      uint64_t v19 = v18;

      id result = (id)sub_2619F7790(v6, v8);
    }
    else
    {

      id result = (id)sub_2619F7790(v6, v8);
      uint64_t v17 = 0;
      uint64_t v19 = 0;
    }
    *(void *)a1 = v11;
    *(void *)(a1 + 8) = v13;
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = v17;
    *(void *)(a1 + 40) = v19;
    *(_WORD *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 64) = 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_261B7173C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for EnergyMetricView(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  return sub_2619F7790(v2, v3);
}

uint64_t initializeWithCopy for EnergyMetricView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v3 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  char v5 = *(unsigned char *)(a2 + 40);
  id v6 = v3;
  sub_2619F7774(v4, v5);
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = v5;
  return a1;
}

uint64_t assignWithCopy for EnergyMetricView(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = a2[2];
  uint64_t v4 = (void *)a2[3];
  char v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  uint64_t v7 = v2[4];
  LOBYTE(v2) = *((unsigned char *)v2 + 40);
  sub_2619F7774(v7, (char)v2);
  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = (_BYTE)v2;
  sub_2619F7790(v8, v9);
  return a1;
}

uint64_t assignWithTake for EnergyMetricView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  char v5 = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v5;
  sub_2619F7790(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for EnergyMetricView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EnergyMetricView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)id result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EnergyMetricView()
{
  return &type metadata for EnergyMetricView;
}

uint64_t TrainingLoadChart.Configuration.init(dayRangeOfData:viewPortDayRange:points:keyDates:)@<X0>(char *a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v83 = a3;
  uint64_t v84 = a4;
  uint64_t v94 = a2;
  uint64_t v78 = sub_261B8CE88();
  uint64_t v77 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  uint64_t v86 = (char *)v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_261B8C9E8();
  uint64_t v8 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  uint64_t v85 = (char *)v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v76 = (char *)v71 - v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v81 = (char *)v71 - v13;
  MEMORY[0x270FA5388](v14);
  char v80 = (char *)v71 - v15;
  uint64_t v16 = sub_261B8EEC8();
  uint64_t v17 = *(NSObject **)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v90 = (char *)v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)v71 - v20;
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CA8);
  MEMORY[0x270FA5388](v87);
  uint64_t v23 = (char *)v71 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  char v26 = (char *)v71 - v25;
  uint64_t v27 = type metadata accessor for TrainingLoadChart.Configuration(0);
  a5[*(int *)(v27 + 32)] = 1;
  uint64_t v88 = v8;
  uint64_t v89 = (int *)v27;
  a5[*(int *)(v27 + 36)] = 0;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v91 = v28;
  uint64_t v82 = a5;
  uint64_t v93 = a1;
  v28(a5, (uint64_t)a1, v95);
  sub_261B8C9A8();
  isa = (void (*)(char *, char *, uint64_t))v17[2].isa;
  isa(v21, v26, v16);
  uint64_t v79 = v26;
  sub_2619F8754((uint64_t)v26, &qword_26B416CA8);
  sub_261B8C9A8();
  uint64_t v30 = v90;
  uint64_t v73 = (void (*)(char *, uint64_t, uint64_t))isa;
  isa(v90, v23, v16);
  uint64_t v72 = v23;
  sub_2619F8754((uint64_t)v23, &qword_26B416CA8);
  int v31 = v30;
  v71[1] = sub_261B7CADC(&qword_26B416C08, MEMORY[0x263F090E8]);
  LOBYTE(v30) = sub_261B8F068();
  long long v32 = (void (*)(char *, uint64_t))v17[1].isa;
  v32(v31, v16);
  uint64_t v74 = v21;
  os_log_t v75 = v17 + 1;
  v32(v21, v16);
  long long v33 = v80;
  ((void (*)(void))v28)();
  long long v34 = v81;
  uint64_t v92 = v8 + 16;
  ((void (*)(void))v28)();
  if (v30)
  {
    uint64_t v90 = (char *)v16;
    uint64_t v35 = *(void (**)(char *, uint64_t))(v88 + 8);
    uint64_t v36 = v95;
    v35(v34, v95);
    v35(v33, v36);
    uint64_t v38 = v93;
    char v37 = v94;
  }
  else
  {
    uint64_t v39 = v32;
    uint64_t v40 = (uint64_t)v79;
    uint64_t v41 = v33;
    sub_261B8C9A8();
    uint64_t v42 = v87;
    char v43 = v74;
    uint64_t v44 = v73;
    v73(v74, v40 + *(int *)(v87 + 36), v16);
    sub_2619F8754(v40, &qword_26B416CA8);
    uint64_t v45 = (uint64_t)v72;
    sub_261B8C9A8();
    uint64_t v46 = v45 + *(int *)(v42 + 36);
    uint64_t v47 = v90;
    v44(v90, v46, v16);
    sub_2619F8754(v45, &qword_26B416CA8);
    char v48 = sub_261B8F068();
    v39(v47, v16);
    v39(v43, v16);
    uint64_t v49 = v88;
    uint64_t v35 = *(void (**)(char *, uint64_t))(v88 + 8);
    uint64_t v36 = v95;
    v35(v34, v95);
    v35(v41, v36);
    if ((v48 & 1) == 0)
    {
      v35(v93, v36);
      uint64_t v64 = v89;
      uint64_t v69 = v82;
      uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v49 + 32))(&v82[v89[5]], v94, v36);
      goto LABEL_10;
    }
    uint64_t v90 = (char *)v16;
    uint64_t v38 = v93;
    char v37 = v94;
  }
  uint64_t v50 = v86;
  sub_261B8CE68();
  char v51 = v76;
  __int16 v52 = v91;
  v91(v76, (uint64_t)v38, v36);
  uint64_t v53 = v85;
  v52(v85, (uint64_t)v37, v36);
  unsigned __int8 v54 = sub_261B8CE78();
  os_log_type_t v55 = sub_261B8F4B8();
  int v56 = v55;
  if (os_log_type_enabled(v54, v55))
  {
    uint64_t v57 = swift_slowAlloc();
    uint64_t v81 = (char *)swift_slowAlloc();
    v98[0] = (uint64_t)v81;
    *(_DWORD *)uint64_t v57 = 136446722;
    LODWORD(v80) = v56;
    uint64_t v96 = (uint64_t)v89;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948918);
    uint64_t v58 = sub_261B8F128();
    uint64_t v96 = sub_261AC9C40(v58, v59, v98);
    sub_261B8F6F8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v57 + 12) = 2080;
    uint64_t v74 = (char *)(v57 + 14);
    os_log_t v75 = v54;
    uint64_t v60 = (uint64_t)v79;
    sub_261B8C9A8();
    uint64_t v96 = 0;
    unint64_t v97 = 0xE000000000000000;
    sub_261B8F9A8();
    sub_261B8F1C8();
    sub_261B8F9A8();
    uint64_t v61 = v96;
    unint64_t v62 = v97;
    sub_2619F8754(v60, &qword_26B416CA8);
    uint64_t v96 = sub_261AC9C40(v61, v62, v98);
    sub_261B8F6F8();
    swift_bridgeObjectRelease();
    v35(v51, v95);
    *(_WORD *)(v57 + 22) = 2080;
    uint64_t v88 = v57 + 24;
    uint64_t v63 = v85;
    sub_261B8C9A8();
    uint64_t v96 = 0;
    unint64_t v97 = 0xE000000000000000;
    uint64_t v64 = v89;
    sub_261B8F9A8();
    sub_261B8F1C8();
    sub_261B8F9A8();
    uint64_t v65 = v96;
    unint64_t v66 = v97;
    sub_2619F8754(v60, &qword_26B416CA8);
    uint64_t v96 = sub_261AC9C40(v65, v66, v98);
    sub_261B8F6F8();
    swift_bridgeObjectRelease();
    v35(v63, v95);
    os_log_t v67 = v75;
    _os_log_impl(&dword_2619F0000, v75, (os_log_type_t)v80, "[%{public}s] Day Range of data %s is not a superset of %s in training load chart. Defaulting to day range", (uint8_t *)v57, 0x20u);
    uint64_t v68 = v81;
    swift_arrayDestroy();
    MEMORY[0x263E4E970](v68, -1, -1);
    uint64_t v36 = v95;
    MEMORY[0x263E4E970](v57, -1, -1);

    v35(v94, v36);
    v35(v93, v36);
    (*(void (**)(char *, uint64_t))(v77 + 8))(v86, v78);
  }
  else
  {

    v35(v53, v36);
    v35(v51, v36);
    v35(v37, v36);
    v35(v38, v36);
    (*(void (**)(char *, uint64_t))(v77 + 8))(v50, v78);
    uint64_t v64 = v89;
  }
  uint64_t v69 = v82;
  uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v91)(&v82[v64[5]], v82, v36);
LABEL_10:
  *(void *)&v69[v64[6]] = v83;
  *(void *)&v69[v64[7]] = v84;
  return result;
}

uint64_t type metadata accessor for TrainingLoadChart.Configuration(uint64_t a1)
{
  return sub_261A84418(a1, (uint64_t *)&unk_26A948960);
}

uint64_t sub_261B72410@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  char v80 = a1;
  uint64_t v81 = a2;
  uint64_t v72 = a3;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CA8);
  MEMORY[0x270FA5388](v79);
  uint64_t v91 = (uint64_t)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_261B8EEC8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v90 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v78 = (char *)&v71 - v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v83 = (char *)&v71 - v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v74 = (char *)&v71 - v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v73 = (char *)&v71 - v15;
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CA0);
  MEMORY[0x270FA5388](v84);
  uint64_t v87 = (uint64_t)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416C98);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v82 = (uint64_t)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v77 = (char *)&v71 - v20;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v71 - v22;
  MEMORY[0x270FA5388](v24);
  uint64_t v75 = (uint64_t)&v71 - v25;
  MEMORY[0x270FA5388](v26);
  uint64_t v94 = (uint64_t)&v71 - v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416C20);
  MEMORY[0x270FA5388](v28 - 8);
  uint64_t v93 = (char *)&v71 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416D18);
  uint64_t v31 = v30 - 8;
  MEMORY[0x270FA5388](v30);
  long long v33 = (char *)&v71 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2619F86F0(v3, (uint64_t)v33, &qword_26B416CA8);
  uint64_t v34 = *(int *)(v31 + 44);
  uint64_t v85 = v33;
  uint64_t v35 = (uint64_t)&v33[v34];
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(&v33[v34], v3, v5);
  uint64_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v6 += 56;
  uint64_t v95 = v36;
  v36(v35, 0, 1, v5);
  char v37 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  uint64_t v96 = (void (**)(char *, uint64_t, uint64_t))(v6 - 24);
  uint64_t v38 = (void (**)(uint64_t, uint64_t))(v6 - 48);
  uint64_t v86 = v23;
  uint64_t v76 = (void (**)(uint64_t, uint64_t))(v6 - 48);
  uint64_t v88 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  uint64_t v89 = v6;
  for (i = v35; ; uint64_t v35 = i)
  {
    uint64_t v39 = v94;
    v95(v94, 1, 1, v5);
    uint64_t v40 = v87;
    uint64_t v41 = v87 + *(int *)(v84 + 48);
    sub_2619F86F0(v35, v87, &qword_26B416C98);
    sub_2619F86F0(v39, v41, &qword_26B416C98);
    uint64_t v42 = *v37;
    if ((*v37)(v40, 1, v5) == 1)
    {
      if (v42(v41, 1, v5) == 1)
      {
        sub_2619F8754(v40, &qword_26B416C98);
        sub_2619F8754(v94, &qword_26B416C98);
LABEL_19:
        uint64_t v70 = 1;
        v95((uint64_t)v93, 1, 1, v5);
        sub_2619F8754((uint64_t)v85, &qword_26B416D18);
        uint64_t v69 = v72;
        return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v95)(v69, v70, 1, v5);
      }
      goto LABEL_7;
    }
    uint64_t v43 = v75;
    sub_2619F86F0(v40, v75, &qword_26B416C98);
    if (v42(v41, 1, v5) == 1)
    {
      (*v38)(v43, v5);
LABEL_7:
      sub_2619F8754(v40, &qword_26B416CA0);
      sub_2619F8754(v94, &qword_26B416C98);
      goto LABEL_9;
    }
    uint64_t v44 = *v96;
    uint64_t v45 = v73;
    (*v96)(v73, v43, v5);
    uint64_t v46 = v74;
    v44(v74, v41, v5);
    sub_261B7CADC(&qword_26B416C10, MEMORY[0x263F090E8]);
    char v47 = sub_261B8F0A8();
    char v48 = *v38;
    (*v38)((uint64_t)v46, v5);
    uint64_t v49 = v45;
    uint64_t v23 = v86;
    v48((uint64_t)v49, v5);
    sub_2619F8754(v87, &qword_26B416C98);
    sub_2619F8754(v94, &qword_26B416C98);
    if (v47) {
      goto LABEL_19;
    }
LABEL_9:
    uint64_t v50 = i;
    sub_2619F86F0(i, (uint64_t)v23, &qword_26B416C98);
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v42)(v23, 1, v5);
    if (result == 1) {
      goto LABEL_23;
    }
    __int16 v52 = v83;
    uint64_t v53 = v23;
    unsigned __int8 v54 = *v96;
    (*v96)(v83, (uint64_t)v53, v5);
    v54(v93, (uint64_t)v52, v5);
    sub_2619F86F0((uint64_t)v85, v91, &qword_26B416CA8);
    uint64_t v55 = v82;
    sub_2619F86F0(v50, v82, &qword_26B416C98);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v42)(v55, 1, v5);
    if (result == 1) {
      break;
    }
    int v56 = v78;
    v54(v78, v55, v5);
    sub_261B7CADC(&qword_26B416C10, MEMORY[0x263F090E8]);
    uint64_t v57 = v54;
    if (sub_261B8F0A8())
    {
      uint64_t v58 = v56;
      unint64_t v59 = *v38;
      (*v38)((uint64_t)v58, v5);
      uint64_t v60 = 1;
      uint64_t v61 = (uint64_t)v77;
    }
    else
    {
      uint64_t v98 = 1;
      sub_261B7CADC(&qword_26B416C18, MEMORY[0x263F090E8]);
      uint64_t v61 = (uint64_t)v77;
      sub_261B8F718();
      unint64_t v62 = v56;
      unint64_t v59 = *v38;
      (*v38)((uint64_t)v62, v5);
      uint64_t v60 = 0;
    }
    uint64_t v63 = v95;
    v95(v61, v60, 1, v5);
    sub_2619F8754(v91, &qword_26B416CA8);
    uint64_t v64 = i;
    sub_2619F8754(i, &qword_26B416C98);
    sub_2619FB7EC(v61, v64, &qword_26B416C98);
    uint64_t v65 = v93;
    v63((uint64_t)v93, 0, 1, v5);
    unint64_t v66 = v90;
    v57(v90, (uint64_t)v65, v5);
    uint64_t v67 = v92;
    char v68 = v80(v66);
    if (v67)
    {
      v59((uint64_t)v90, v5);
      return sub_2619F8754((uint64_t)v85, &qword_26B416D18);
    }
    uint64_t v92 = 0;
    uint64_t v38 = v76;
    if (v68)
    {
      sub_2619F8754((uint64_t)v85, &qword_26B416D18);
      uint64_t v69 = v72;
      v57(v72, (uint64_t)v90, v5);
      uint64_t v70 = 0;
      return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v95)(v69, v70, 1, v5);
    }
    v59((uint64_t)v90, v5);
    char v37 = v88;
    uint64_t v23 = v86;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_261B72DD4(uint64_t a1, uint64_t a2)
{
  return sub_261B73530(a1, a2, MEMORY[0x263F42DE0], &qword_26A9467F0, MEMORY[0x263F42DE0], MEMORY[0x263F42DF8]);
}

uint64_t sub_261B72E1C(uint64_t a1, uint64_t a2)
{
  uint64_t View = type metadata accessor for TrainingLoadViewModel.ChartPoint(0);
  MEMORY[0x270FA5388](View);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v24 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v11 || a1 == a2) {
    return 1;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v24[0] = *(void *)(v8 + 72);
  while (1)
  {
    sub_261B7AEC4(a1 + v12, (uint64_t)v10, type metadata accessor for TrainingLoadViewModel.ChartPoint);
    sub_261B7AEC4(a2 + v12, (uint64_t)v6, type metadata accessor for TrainingLoadViewModel.ChartPoint);
    if ((sub_261B8AD88() & 1) == 0) {
      break;
    }
    sub_261B8EEC8();
    sub_261B7CADC(&qword_26B416C18, MEMORY[0x263F090E8]);
    sub_261B8F728();
    if (v24[1]) {
      break;
    }
    uint64_t v14 = *(int *)(View + 24);
    uint64_t v15 = (double *)&v10[v14];
    char v16 = v10[v14 + 8];
    uint64_t v17 = (double *)&v6[v14];
    int v18 = v6[v14 + 8];
    if (v16)
    {
      if (!v18) {
        break;
      }
    }
    else
    {
      if (*v15 != *v17) {
        LOBYTE(v18) = 1;
      }
      if (v18) {
        break;
      }
    }
    if ((sub_261B8E848() & 1) == 0) {
      break;
    }
    uint64_t v19 = *(int *)(View + 32);
    uint64_t v20 = (double *)&v10[v19];
    char v21 = v10[v19 + 8];
    uint64_t v22 = (double *)&v6[v19];
    int v23 = v6[v19 + 8];
    if (v21)
    {
      if (!v23) {
        break;
      }
    }
    else
    {
      if (*v20 != *v22) {
        LOBYTE(v23) = 1;
      }
      if (v23) {
        break;
      }
    }
    sub_261B7D610((uint64_t)v6, type metadata accessor for TrainingLoadViewModel.ChartPoint);
    sub_261B7D610((uint64_t)v10, type metadata accessor for TrainingLoadViewModel.ChartPoint);
    v12 += v24[0];
    if (!--v11) {
      return 1;
    }
  }
  sub_261B7D610((uint64_t)v6, type metadata accessor for TrainingLoadViewModel.ChartPoint);
  sub_261B7D610((uint64_t)v10, type metadata accessor for TrainingLoadViewModel.ChartPoint);
  return 0;
}

uint64_t sub_261B730D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_261B8C2D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v32 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9454B0);
  MEMORY[0x270FA5388](v35);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910) - 8;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v36 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v29 - v13;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v15 || v37 == v38) {
    return 1;
  }
  unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v34 = *(void *)(v12 + 72);
  uint64_t v17 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  int v18 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v19 = (unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  uint64_t v30 = v17;
  uint64_t v31 = v18;
  uint64_t v20 = (uint64_t)v36;
  while (1)
  {
    uint64_t v21 = v37 + v16;
    sub_2619F86F0(v38 + v16, (uint64_t)v14, &qword_26A943910);
    uint64_t v22 = (uint64_t)&v8[*(int *)(v35 + 48)];
    sub_2619F86F0(v21, (uint64_t)v8, &qword_26A943910);
    sub_2619F86F0((uint64_t)v14, v22, &qword_26A943910);
    int v23 = *v19;
    if ((*v19)(v8, 1, v4) != 1) {
      break;
    }
    if (v23((char *)v22, 1, v4) != 1) {
      goto LABEL_15;
    }
    sub_2619F8754((uint64_t)v8, &qword_26A943910);
    sub_2619F8754((uint64_t)v14, &qword_26A943910);
LABEL_7:
    v16 += v34;
    if (!--v15) {
      return 1;
    }
  }
  sub_2619F86F0((uint64_t)v8, v20, &qword_26A943910);
  if (v23((char *)v22, 1, v4) != 1)
  {
    uint64_t v24 = v32;
    (*v30)(v32, v22, v4);
    sub_261B7CADC(&qword_26A945470, MEMORY[0x263F87EE8]);
    int v33 = sub_261B8F0A8();
    uint64_t v25 = v19;
    uint64_t v26 = *v31;
    uint64_t v27 = v24;
    uint64_t v20 = (uint64_t)v36;
    (*v31)(v27, v4);
    v26((char *)v20, v4);
    uint64_t v19 = v25;
    sub_2619F8754((uint64_t)v8, &qword_26A943910);
    sub_2619F8754((uint64_t)v14, &qword_26A943910);
    if ((v33 & 1) == 0) {
      return 0;
    }
    goto LABEL_7;
  }
  (*v31)((char *)v20, v4);
LABEL_15:
  sub_2619F8754((uint64_t)v8, &qword_26A9454B0);
  sub_2619F8754((uint64_t)v14, &qword_26A943910);
  return 0;
}

uint64_t sub_261B734E8(uint64_t a1, uint64_t a2)
{
  return sub_261B73530(a1, a2, MEMORY[0x263F87EE8], &qword_26A945470, MEMORY[0x263F87EE8], MEMORY[0x263F87EF8]);
}

uint64_t sub_261B73530(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v37 = a6;
  uint64_t v10 = a3(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v30 - v14;
  uint64_t v16 = *(void *)(a1 + 16);
  if (v16 == *(void *)(a2 + 16))
  {
    if (!v16 || a1 == a2)
    {
      char v24 = 1;
    }
    else
    {
      unint64_t v17 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
      uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v12 + 16);
      uint64_t v18 = v12 + 16;
      uint64_t v34 = v19;
      uint64_t v35 = v13;
      uint64_t v30 = *(void *)(v18 + 56);
      uint64_t v31 = a2;
      uint64_t v36 = v18;
      uint64_t v32 = a1;
      int v33 = (void (**)(char *, uint64_t))(v18 - 8);
      uint64_t v20 = v16 - 1;
      do
      {
        uint64_t v21 = v34;
        v34(v15, a1 + v17, v10);
        uint64_t v22 = v15;
        int v23 = v35;
        v21(v35, a2 + v17, v10);
        sub_261B7CADC(a4, a5);
        char v24 = sub_261B8F0A8();
        uint64_t v25 = *v33;
        uint64_t v26 = v23;
        uint64_t v15 = v22;
        (*v33)(v26, v10);
        v25(v22, v10);
        BOOL v28 = v20-- != 0;
        if ((v24 & 1) == 0) {
          break;
        }
        v17 += v30;
        a2 = v31;
        a1 = v32;
      }
      while (v28);
    }
  }
  else
  {
    char v24 = 0;
  }
  return v24 & 1;
}

uint64_t sub_261B73748@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948AC8);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9464C0);
  sub_2619F8AB8(&qword_26A9464C8, &qword_26A9464C0);
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, void, uint64_t))(v9 + 16))(v7, *a1, v8);
  uint64_t v10 = sub_261B8CEA8();
  uint64_t v18 = &v7[*(int *)(v5 + 56)];
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(void))(v11 + 16))();
  uint64_t v12 = sub_261B8D228();
  uint64_t v13 = &v7[*(int *)(v5 + 72)];
  uint64_t v14 = a1[2];
  uint64_t v15 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, v14, v12);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v7, v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a2 + *(int *)(v5 + 56), v18, v10);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(a2 + *(int *)(v5 + 72), v13, v12);
}

uint64_t TrainingLoadChart.Configuration.interactiveSelectionEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for TrainingLoadChart.Configuration(0) + 32));
}

uint64_t TrainingLoadChart.Configuration.interactiveSelectionEnabled.setter(char a1)
{
  uint64_t result = type metadata accessor for TrainingLoadChart.Configuration(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*TrainingLoadChart.Configuration.interactiveSelectionEnabled.modify())(void)
{
  return nullsub_1;
}

uint64_t TrainingLoadChart.Configuration.chartXScaleDomainPaddingEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for TrainingLoadChart.Configuration(0) + 36));
}

uint64_t TrainingLoadChart.Configuration.chartXScaleDomainPaddingEnabled.setter(char a1)
{
  uint64_t result = type metadata accessor for TrainingLoadChart.Configuration(0);
  *(unsigned char *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*TrainingLoadChart.Configuration.chartXScaleDomainPaddingEnabled.modify())(void)
{
  return nullsub_1;
}

uint64_t TrainingLoadChart.init(configuration:selectedDay:inSelectionMode:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t *a6@<X8>)
{
  int v54 = a5;
  uint64_t v55 = a4;
  uint64_t v56 = a3;
  uint64_t v52 = a2;
  uint64_t v57 = a1;
  uint64_t v7 = sub_261B8EEC8();
  uint64_t v46 = *(void *)(v7 - 8);
  uint64_t v47 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v45 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CA8);
  MEMORY[0x270FA5388](v43);
  uint64_t v44 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TrainingLoadChart.Configuration(0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  char v51 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948920);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948928);
  uint64_t v49 = *(void *)(v16 - 8);
  uint64_t v50 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v53 = (uint64_t)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943FF0);
  double v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v21 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, double))(v11 + 56);
  v22(v21, 1, 1, v10, v19);
  type metadata accessor for TrainingLoadChartViewModel();
  swift_allocObject();
  uint64_t v58 = sub_261A206F0((uint64_t)v21);
  sub_261B8EA08();
  long long v48 = v59;
  Chart = (int *)type metadata accessor for TrainingLoadChart(0);
  *(uint64_t *)((char *)a6 + Chart[6]) = 0x4032000000000000;
  *(uint64_t *)((char *)a6 + Chart[7]) = 0x4024000000000000;
  uint64_t v24 = Chart[9];
  uint64_t v58 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948930);
  sub_261B8EA08();
  *(_OWORD *)((char *)a6 + v24) = v59;
  uint64_t v25 = v57;
  sub_261B7AEC4(v57, (uint64_t)a6 + Chart[5], type metadata accessor for TrainingLoadChart.Configuration);
  sub_261B7AEC4(v25, (uint64_t)v21, type metadata accessor for TrainingLoadChart.Configuration);
  uint64_t v42 = v10;
  ((void (*)(char *, void, uint64_t, uint64_t))v22)(v21, 0, 1, v10);
  uint64_t v26 = v52;
  swift_allocObject();
  uint64_t v27 = sub_261A206F0((uint64_t)v21);
  swift_retain();
  uint64_t v28 = (uint64_t)v51;
  swift_release();
  swift_release();
  *a6 = v27;
  a6[1] = 0;
  sub_2619F86F0(v26, (uint64_t)v15, &qword_26A948920);
  sub_261B7AEC4(v25, v28, type metadata accessor for TrainingLoadChart.Configuration);
  uint64_t v29 = (uint64_t)v15;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v15, 1, v50) == 1)
  {
    uint64_t v30 = (uint64_t)v44;
    sub_261B8C9A8();
    uint64_t v32 = v45;
    uint64_t v31 = v46;
    uint64_t v33 = v47;
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v45, v30 + *(int *)(v43 + 36), v47);
    sub_2619F8754(v30, &qword_26B416CA8);
    uint64_t v34 = v53;
    sub_261B8EB78();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
    sub_261B7D610(v28, type metadata accessor for TrainingLoadChart.Configuration);
    sub_2619F8754(v29, &qword_26A948920);
  }
  else
  {
    sub_261B7D610(v28, type metadata accessor for TrainingLoadChart.Configuration);
    uint64_t v34 = v53;
    sub_2619FB7EC((uint64_t)v15, v53, &qword_26A948928);
  }
  sub_2619FB7EC(v34, (uint64_t)a6 + Chart[10], &qword_26A948928);
  uint64_t v35 = (char *)a6 + Chart[11];
  uint64_t v36 = v55;
  *(void *)uint64_t v35 = v56;
  *((void *)v35 + 1) = v36;
  v35[16] = v54 & 1;
  swift_retain();
  swift_retain();
  double v37 = sub_261B740B0();
  uint64_t v39 = v38;
  swift_release();
  swift_release();
  swift_release();
  sub_2619F8754(v26, &qword_26A948920);
  uint64_t result = sub_261B7D610(v57, type metadata accessor for TrainingLoadChart.Configuration);
  uint64_t v41 = (double *)((char *)a6 + Chart[8]);
  *uint64_t v41 = v37;
  *((void *)v41 + 1) = v39;
  return result;
}

double sub_261B740B0()
{
  uint64_t v0 = sub_261A210C0();
  double v1 = 0.0;
  if ((v2 & 1) == 0)
  {
    double v3 = *(double *)&v0;
    uint64_t v4 = sub_261A2145C();
    if ((v5 & 1) == 0)
    {
      double v6 = v3;
      double v7 = *(double *)&v4;
      double v8 = COERCE_DOUBLE(sub_261A217F8());
      if (v9) {
        double v8 = v3;
      }
      if (v8 < v3) {
        double v6 = v8;
      }
      double v10 = COERCE_DOUBLE(sub_261A21A7C());
      if (v11) {
        double v10 = v7;
      }
      if (v10 < v7) {
        double v10 = v7;
      }
      double v1 = v6 * 0.9;
      if (v1 > v10 * 1.1) {
        __break(1u);
      }
    }
  }
  return v1;
}

uint64_t TrainingLoadChart.body.getter()
{
  uint64_t v1 = sub_261B8DAE8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Chart = type metadata accessor for TrainingLoadChart(0);
  uint64_t v6 = *(void *)(Chart - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](Chart - 8);
  sub_261B7AEC4(v0, (uint64_t)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TrainingLoadChart);
  unint64_t v8 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = swift_allocObject();
  sub_261B7DBDC((uint64_t)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8, type metadata accessor for TrainingLoadChart);
  v11[0] = sub_261B7AF30;
  v11[1] = v9;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F19790], v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948938);
  sub_2619F8AB8(&qword_26A948940, &qword_26A948938);
  sub_261B8E548();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return swift_release();
}

uint64_t sub_261B74394@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = sub_261B8EC98();
  a3[1] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948970);
  return sub_261B743EC(a2, a1, (uint64_t)a3 + *(int *)(v7 + 44));
}

uint64_t sub_261B743EC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v163 = a2;
  uint64_t v150 = a3;
  uint64_t v151 = type metadata accessor for TrainingLoadChart.Configuration(0);
  MEMORY[0x270FA5388](v151);
  uint64_t v152 = (uint64_t)&v111 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_261B8D538();
  uint64_t v148 = *(void *)(v149 - 8);
  MEMORY[0x270FA5388](v149);
  uint64_t v146 = v5;
  id v147 = (char *)&v111 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946388);
  MEMORY[0x270FA5388](v141);
  uint64_t v144 = (uint64_t)&v111 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946398);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v158 = (char *)&v111 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = sub_261B8D108();
  uint64_t v164 = *(char ***)(v134 - 8);
  MEMORY[0x270FA5388](v134);
  uint64_t v157 = (char *)&v111 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = (void *)sub_261B8EEC8();
  uint64_t v159 = *(v120 - 1);
  MEMORY[0x270FA5388](v120);
  int v117 = (char *)&v111 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Chart = type metadata accessor for TrainingLoadChart(0);
  uint64_t v11 = *(void *)(Chart - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](Chart);
  uint64_t v13 = (char *)&v111 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948978);
  uint64_t v116 = *(void *)(v115 - 8);
  MEMORY[0x270FA5388](v115);
  char v114 = (char *)&v111 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948980);
  uint64_t v119 = *(void *)(v118 - 8);
  MEMORY[0x270FA5388](v118);
  uint64_t v111 = (char *)&v111 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v121 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A948988);
  uint64_t v122 = *(v121 - 1);
  MEMORY[0x270FA5388](v121);
  int v153 = (char *)&v111 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948990);
  uint64_t v126 = *(void *)(v125 - 8);
  MEMORY[0x270FA5388](v125);
  uint64_t v154 = (uint64_t (*)(uint64_t))((char *)&v111 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948998);
  uint64_t v128 = *(void *)(v127 - 8);
  MEMORY[0x270FA5388](v127);
  uint64_t v123 = (char *)&v111 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9489A0);
  uint64_t v130 = *(void *)(v129 - 8);
  MEMORY[0x270FA5388](v129);
  uint64_t v124 = (char *)&v111 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9489A8);
  uint64_t v132 = *(void *)(v135 - 8);
  MEMORY[0x270FA5388](v135);
  uint64_t v160 = (uint64_t (*)(uint64_t))((char *)&v111 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9489B0);
  uint64_t v133 = *(void *)(v137 - 8);
  MEMORY[0x270FA5388](v137);
  uint64_t v131 = (char *)&v111 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9489B8);
  uint64_t v138 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  uint64_t v136 = (char *)&v111 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9489C0);
  uint64_t v142 = *(void *)(v143 - 8);
  MEMORY[0x270FA5388](v143);
  uint64_t v140 = (char *)&v111 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9489C8);
  MEMORY[0x270FA5388](v161);
  id v145 = (char *)&v111 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9489D0);
  sub_261B7C984();
  sub_261B8D168();
  uint64_t v25 = a1[1];
  uint64_t v168 = (void *)*a1;
  uint64_t v169 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A10);
  sub_261B8EA18();
  uint64_t v26 = (void *)v174;
  swift_getKeyPath();
  uint64_t v168 = v26;
  sub_261B7CADC((unint64_t *)&qword_26A943FE8, (void (*)(uint64_t))type metadata accessor for TrainingLoadChartViewModel);
  sub_261B8B038();
  swift_release();
  uint64_t v27 = *(void *)((char *)v26 + OBJC_IVAR____TtC9WorkoutUI26TrainingLoadChartViewModel__emphasizedChartPointIndexOffset);
  swift_release();
  uint64_t v176 = v27;
  int v113 = type metadata accessor for TrainingLoadChart;
  sub_261B7AEC4((uint64_t)a1, (uint64_t)v13, type metadata accessor for TrainingLoadChart);
  uint64_t v28 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v29 = (v28 + 16) & ~v28;
  uint64_t v156 = v28 | 7;
  uint64_t v155 = v29 + v12;
  uint64_t v30 = swift_allocObject();
  uint64_t v112 = type metadata accessor for TrainingLoadChart;
  sub_261B7DBDC((uint64_t)v13, v30 + v29, type metadata accessor for TrainingLoadChart);
  uint64_t v31 = sub_2619F8AB8(&qword_26A948A18, &qword_26A948978);
  uint64_t v32 = v115;
  uint64_t v33 = v114;
  sub_261B8E7C8();
  swift_release();
  uint64_t v34 = v32;
  (*(void (**)(char *, uint64_t))(v116 + 8))(v33, v32);
  id v165 = a1;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948928);
  uint64_t v36 = v117;
  MEMORY[0x263E4CA00](v35);
  uint64_t v162 = v13;
  sub_261B7AEC4((uint64_t)a1, (uint64_t)v13, type metadata accessor for TrainingLoadChart);
  uint64_t v37 = swift_allocObject();
  sub_261B7DBDC((uint64_t)v13, v37 + v29, type metadata accessor for TrainingLoadChart);
  uint64_t v168 = (void *)v34;
  uint64_t v169 = MEMORY[0x263F8D538];
  uint64_t v170 = v31;
  uint64_t v171 = MEMORY[0x263F8D568];
  uint64_t v116 = MEMORY[0x263F1B260];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v39 = sub_261B7CADC(&qword_26B416C10, MEMORY[0x263F090E8]);
  uint64_t v40 = v36;
  uint64_t v41 = v118;
  uint64_t v42 = v120;
  uint64_t v43 = v111;
  sub_261B8E7C8();
  swift_release();
  (*(void (**)(char *, void *))(v159 + 8))(v40, v42);
  (*(void (**)(char *, uint64_t))(v119 + 8))(v43, v41);
  uint64_t v44 = (uint64_t)v165;
  uint64_t v45 = Chart;
  uint64_t v46 = (char *)v165 + *(int *)(Chart + 44);
  uint64_t v47 = *(void **)v46;
  uint64_t v48 = *((void *)v46 + 1);
  LOBYTE(v46) = v46[16];
  uint64_t v168 = v47;
  uint64_t v169 = v48;
  LOBYTE(v170) = (_BYTE)v46;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946AE0);
  MEMORY[0x263E4CA00](&v174, v49);
  char v175 = v174;
  uint64_t v50 = (uint64_t)v162;
  sub_261B7AEC4(v44, (uint64_t)v162, v113);
  uint64_t v51 = swift_allocObject();
  uint64_t v159 = v29;
  sub_261B7DBDC(v50, v51 + v29, v112);
  uint64_t v168 = (void *)v41;
  uint64_t v169 = (uint64_t)v42;
  uint64_t v170 = OpaqueTypeConformance2;
  uint64_t v171 = v39;
  uint64_t v52 = swift_getOpaqueTypeConformance2();
  uint64_t v53 = MEMORY[0x263F8D4F8];
  uint64_t v54 = MEMORY[0x263F8D510];
  uint64_t v55 = v121;
  uint64_t v56 = v153;
  sub_261B8E7C8();
  swift_release();
  (*(void (**)(char *, void *))(v122 + 8))(v56, v55);
  long long v174 = *(_OWORD *)(v44 + *(int *)(v45 + 32));
  uint64_t v57 = v157;
  sub_261B8D0F8();
  uint64_t v122 = sub_261B8D318();
  uint64_t v58 = *(void *)(v122 - 8);
  uint64_t v120 = *(void **)(v58 + 56);
  int v153 = (char *)(v58 + 56);
  uint64_t v59 = (uint64_t)v158;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v120)(v158, 1, 1, v122);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946428);
  uint64_t v168 = v55;
  uint64_t v169 = v53;
  uint64_t v170 = v52;
  uint64_t v171 = v54;
  uint64_t v61 = swift_getOpaqueTypeConformance2();
  uint64_t v62 = sub_261AA21E4((unint64_t *)&qword_26A946430, &qword_26A946428);
  uint64_t v63 = v123;
  uint64_t v64 = v125;
  uint64_t v65 = v134;
  unint64_t v66 = v154;
  sub_261B8E468();
  sub_2619F8754(v59, &qword_26A946398);
  uint64_t v67 = v164[1];
  ++v164;
  id v121 = v67;
  char v68 = v57;
  uint64_t v69 = v65;
  ((void (*)(char *, uint64_t))v67)(v68, v65);
  (*(void (**)(uint64_t (*)(uint64_t), uint64_t))(v126 + 8))(v66, v64);
  uint64_t v168 = (void *)v64;
  uint64_t v169 = v60;
  uint64_t v170 = v65;
  uint64_t v171 = v61;
  uint64_t v172 = v62;
  uint64_t v173 = MEMORY[0x263EFCCD8];
  uint64_t v70 = swift_getOpaqueTypeConformance2();
  uint64_t v71 = v124;
  uint64_t v72 = v127;
  sub_261B8E418();
  uint64_t v73 = v72;
  (*(void (**)(char *, uint64_t))(v128 + 8))(v63, v72);
  uint64_t v74 = v144;
  sub_261B77054(v144);
  uint64_t v75 = v157;
  sub_261B8D0E8();
  uint64_t v76 = (uint64_t)v158;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v120)(v158, 1, 1, v122);
  uint64_t v168 = (void *)v73;
  uint64_t v169 = v70;
  uint64_t v77 = swift_getOpaqueTypeConformance2();
  uint64_t v78 = sub_261AA21E4(&qword_26A946410, &qword_26A946388);
  uint64_t v79 = v129;
  uint64_t v80 = v141;
  sub_261B8E448();
  sub_2619F8754(v76, &qword_26A946398);
  ((void (*)(char *, uint64_t))v121)(v75, v69);
  sub_2619F8754(v74, &qword_26A946388);
  (*(void (**)(char *, uint64_t))(v130 + 8))(v71, v79);
  if (qword_26A942D38 != -1) {
    swift_once();
  }
  uint64_t v168 = (void *)v79;
  uint64_t v169 = v80;
  uint64_t v170 = v69;
  uint64_t v171 = v77;
  uint64_t v172 = v78;
  uint64_t v173 = MEMORY[0x263EFCCD8];
  uint64_t v81 = swift_getOpaqueTypeConformance2();
  uint64_t v82 = MEMORY[0x263F8D310];
  uint64_t v83 = MEMORY[0x263F188A8];
  uint64_t v84 = MEMORY[0x263EFCE58];
  uint64_t v85 = MEMORY[0x263F18898];
  uint64_t v86 = v131;
  uint64_t v87 = v135;
  uint64_t v88 = v160;
  sub_261B8E478();
  (*(void (**)(uint64_t (*)(uint64_t), uint64_t))(v132 + 8))(v88, v87);
  uint64_t v168 = (void *)v87;
  uint64_t v169 = v82;
  uint64_t v170 = v83;
  uint64_t v171 = v81;
  uint64_t v172 = v84;
  uint64_t v173 = v85;
  uint64_t v89 = swift_getOpaqueTypeConformance2();
  uint64_t v90 = v136;
  uint64_t v91 = v137;
  sub_261B8E428();
  uint64_t v92 = (*(uint64_t (**)(char *, uint64_t))(v133 + 8))(v86, v91);
  uint64_t v164 = &v111;
  MEMORY[0x270FA5388](v92);
  uint64_t v93 = (uint64_t)v165;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A20);
  uint64_t v168 = (void *)v91;
  uint64_t v169 = v89;
  swift_getOpaqueTypeConformance2();
  sub_261B7CD64();
  uint64_t v94 = v140;
  uint64_t v95 = v139;
  sub_261B8E3E8();
  (*(void (**)(char *, uint64_t))(v138 + 8))(v90, v95);
  uint64_t v160 = type metadata accessor for TrainingLoadChart;
  uint64_t v96 = (uint64_t)v162;
  sub_261B7AEC4(v93, (uint64_t)v162, type metadata accessor for TrainingLoadChart);
  uint64_t v97 = v148;
  uint64_t v158 = *(char **)(v148 + 16);
  uint64_t v98 = v147;
  uint64_t v99 = v149;
  ((void (*)(char *, uint64_t, uint64_t))v158)(v147, v163, v149);
  uint64_t v100 = *(unsigned __int8 *)(v97 + 80);
  uint64_t v157 = (char *)(((v155 + v100) & ~v100) + v146);
  uint64_t v155 = (v155 + v100) & ~v100;
  uint64_t v101 = v155;
  v156 |= v100;
  uint64_t v102 = swift_allocObject();
  uint64_t v154 = type metadata accessor for TrainingLoadChart;
  sub_261B7DBDC(v96, v102 + v159, type metadata accessor for TrainingLoadChart);
  int v153 = *(char **)(v97 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v153)(v102 + v101, v98, v99);
  uint64_t v103 = v142;
  uint64_t v104 = (uint64_t)v145;
  uint64_t v105 = v143;
  (*(void (**)(char *, char *, uint64_t))(v142 + 16))(v145, v94, v143);
  id v106 = (uint64_t (**)())(v104 + *(int *)(v161 + 36));
  *id v106 = sub_261B7CEC8;
  v106[1] = (uint64_t (*)())v102;
  v106[2] = 0;
  v106[3] = 0;
  (*(void (**)(char *, uint64_t))(v103 + 8))(v94, v105);
  uint64_t v107 = (uint64_t)v165;
  uint64_t v108 = v152;
  sub_261B7AEC4((uint64_t)v165 + *(int *)(Chart + 20), v152, type metadata accessor for TrainingLoadChart.Configuration);
  sub_261B7AEC4(v107, v96, v160);
  ((void (*)(char *, uint64_t, uint64_t))v158)(v98, v163, v99);
  uint64_t v109 = swift_allocObject();
  sub_261B7DBDC(v96, v109 + v159, v154);
  ((void (*)(uint64_t, char *, uint64_t))v153)(v109 + v155, v98, v99);
  sub_261B7D240();
  sub_261B7CADC(&qword_26A948A68, (void (*)(uint64_t))type metadata accessor for TrainingLoadChart.Configuration);
  sub_261B8E7D8();
  swift_release();
  sub_261B7D610(v108, type metadata accessor for TrainingLoadChart.Configuration);
  return sub_2619F8754(v104, &qword_26A9489C8);
}

uint64_t sub_261B75AE8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v86 = a2;
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948AE0);
  MEMORY[0x270FA5388](v85);
  uint64_t v84 = (char *)v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t SmoothedLineTrace = type metadata accessor for TrainingLoadSmoothedLineTrace();
  uint64_t v82 = *(void *)(SmoothedLineTrace - 8);
  uint64_t v83 = SmoothedLineTrace;
  MEMORY[0x270FA5388](SmoothedLineTrace);
  uint64_t v71 = (void *)((char *)v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416C30);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v74 = (uint64_t)v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t View = type metadata accessor for TrainingLoadViewModel.ChartPoint(0);
  uint64_t v73 = *(void *)(View - 8);
  MEMORY[0x270FA5388](View);
  uint64_t v69 = (uint64_t)v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v70 = (uint64_t)v66 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A00);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v81 = (uint64_t)v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v76 = (uint64_t)v66 - v14;
  uint64_t Chart = type metadata accessor for TrainingLoadChart(0);
  uint64_t v15 = *(void *)(Chart - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](Chart);
  uint64_t v17 = type metadata accessor for TrainingLoadChart.Configuration(0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9489E8);
  uint64_t v79 = *(void *)(v20 - 8);
  uint64_t v80 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v78 = (char *)v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)v66 - v23;
  uint64_t v25 = a1[1];
  uint64_t v92 = *a1;
  uint64_t v93 = v25;
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A10);
  sub_261B8EA18();
  uint64_t v26 = v90;
  swift_getKeyPath();
  uint64_t v92 = v26;
  v66[1] = sub_261B7CADC((unint64_t *)&qword_26A943FE8, (void (*)(uint64_t))type metadata accessor for TrainingLoadChartViewModel);
  sub_261B8B038();
  swift_release();
  uint64_t v27 = v26 + OBJC_IVAR____TtC9WorkoutUI26TrainingLoadChartViewModel__configuration;
  swift_beginAccess();
  sub_261B7AEC4(v27, (uint64_t)v19, type metadata accessor for TrainingLoadChart.Configuration);
  swift_release();
  uint64_t v67 = v17;
  uint64_t v28 = *(void *)&v19[*(int *)(v17 + 24)];
  swift_bridgeObjectRetain();
  sub_261B7D610((uint64_t)v19, type metadata accessor for TrainingLoadChart.Configuration);
  *(void *)&long long v87 = v28;
  swift_getKeyPath();
  sub_261B7AEC4((uint64_t)a1, (uint64_t)v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TrainingLoadChart);
  unint64_t v29 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v30 = swift_allocObject();
  sub_261B7DBDC((uint64_t)v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v30 + v29, type metadata accessor for TrainingLoadChart);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A946BD8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948AE8);
  sub_2619F8AB8(&qword_26A946BE8, &qword_26A946BD8);
  sub_261B7CADC(&qword_26A9467A8, MEMORY[0x263F07490]);
  uint64_t BaselineMarks = type metadata accessor for TrainingLoadBaselineMarks();
  uint64_t v32 = sub_261B7CADC(&qword_26A9489F0, (void (*)(uint64_t))type metadata accessor for TrainingLoadBaselineMarks);
  uint64_t v90 = BaselineMarks;
  uint64_t v91 = v32;
  swift_getOpaqueTypeConformance2();
  uint64_t v77 = v24;
  sub_261B8EBD8();
  uint64_t v33 = *a1;
  uint64_t v34 = a1[1];
  uint64_t v90 = *a1;
  uint64_t v91 = v34;
  sub_261B8EA18();
  uint64_t v35 = v74;
  sub_261A20D00(v74);
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v35, 1, View) == 1)
  {
    sub_2619F8754(v35, &qword_26B416C30);
    uint64_t v36 = 1;
    uint64_t v37 = v76;
  }
  else
  {
    uint64_t v38 = v70;
    sub_261B7DBDC(v35, v70, type metadata accessor for TrainingLoadViewModel.ChartPoint);
    uint64_t v90 = v33;
    uint64_t v91 = v34;
    sub_261B8EA18();
    uint64_t v39 = v87;
    swift_getKeyPath();
    uint64_t v90 = v39;
    sub_261B8B038();
    swift_release();
    uint64_t v40 = v39 + OBJC_IVAR____TtC9WorkoutUI26TrainingLoadChartViewModel__configuration;
    swift_beginAccess();
    sub_261B7AEC4(v40, (uint64_t)v19, type metadata accessor for TrainingLoadChart.Configuration);
    swift_release();
    uint64_t v41 = v67;
    uint64_t v42 = *(void *)&v19[*(int *)(v67 + 24)];
    swift_bridgeObjectRetain();
    sub_261B7D610((uint64_t)v19, type metadata accessor for TrainingLoadChart.Configuration);
    uint64_t v43 = v69;
    sub_261B7AEC4(v38, v69, type metadata accessor for TrainingLoadViewModel.ChartPoint);
    uint64_t v44 = Chart;
    char v45 = *(void *)(*(uint64_t *)((char *)a1 + *(int *)(Chart + 20) + *(int *)(v41 + 28)) + 16) < 0x1EuLL;
    long long v87 = *(_OWORD *)((char *)a1 + *(int *)(Chart + 36));
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A88);
    sub_261B8EA18();
    uint64_t v46 = v89;
    uint64_t v47 = (char *)a1 + *(int *)(v44 + 44);
    uint64_t v48 = *(void *)v47;
    uint64_t v49 = *((void *)v47 + 1);
    LOBYTE(v47) = v47[16];
    *(void *)&long long v87 = v48;
    *((void *)&v87 + 1) = v49;
    char v88 = (char)v47;
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946AE0);
    MEMORY[0x263E4CA00](&v89, v50);
    LOBYTE(v44) = v89;
    uint64_t v51 = a1[1];
    *(void *)&long long v87 = *a1;
    *((void *)&v87 + 1) = v51;
    sub_261B8EA18();
    double v52 = sub_261A20394();
    swift_release();
    uint64_t v53 = v71;
    sub_261ADDE8C(v42, v43, v45, v46, v44, v52 == 1.0, v71);
    sub_261B7D610(v38, type metadata accessor for TrainingLoadViewModel.ChartPoint);
    uint64_t v37 = v76;
    sub_261B7DBDC((uint64_t)v53, v76, (uint64_t (*)(void))type metadata accessor for TrainingLoadSmoothedLineTrace);
    uint64_t v36 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v82 + 56))(v37, v36, 1, v83);
  uint64_t v55 = v79;
  uint64_t v54 = v80;
  uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v79 + 16);
  uint64_t v57 = v78;
  uint64_t v58 = v77;
  v56(v78, v77, v80);
  uint64_t v59 = v81;
  sub_2619F86F0(v37, v81, &qword_26A948A00);
  sub_261B7CA08();
  uint64_t v60 = v84;
  v56(v84, v57, v54);
  sub_261B7CB24();
  uint64_t v61 = v85;
  uint64_t v62 = (uint64_t)&v60[*(int *)(v85 + 48)];
  sub_2619F86F0(v59, v62, &qword_26A948A00);
  uint64_t v63 = v86;
  (*(void (**)(uint64_t, char *, uint64_t))(v55 + 32))(v86, v60, v54);
  sub_2619FB7EC(v62, v63 + *(int *)(v61 + 48), &qword_26A948A00);
  sub_2619F8754(v37, &qword_26A948A00);
  uint64_t v64 = *(void (**)(char *, uint64_t))(v55 + 8);
  v64(v58, v54);
  sub_2619F8754(v59, &qword_26A948A00);
  return ((uint64_t (*)(char *, uint64_t))v64)(v57, v54);
}

uint64_t sub_261B765A4(uint64_t a1, uint64_t *a2)
{
  uint64_t BaselineMarks = (int *)type metadata accessor for TrainingLoadBaselineMarks();
  MEMORY[0x270FA5388](BaselineMarks);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261B7AEC4(a1, (uint64_t)v6, type metadata accessor for TrainingLoadViewModel.ChartPoint);
  uint64_t v7 = a2[1];
  uint64_t v18 = *a2;
  uint64_t v19 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A10);
  sub_261B8EA18();
  sub_261A20D00((uint64_t)&v6[BaselineMarks[5]]);
  swift_release();
  uint64_t Chart = type metadata accessor for TrainingLoadChart(0);
  uint64_t v9 = (uint64_t *)((char *)a2 + *(int *)(Chart + 32));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (char *)a2 + *(int *)(Chart + 44);
  uint64_t v13 = *(void *)v12;
  uint64_t v14 = *((void *)v12 + 1);
  LOBYTE(v12) = v12[16];
  uint64_t v18 = v13;
  uint64_t v19 = v14;
  char v20 = (char)v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946AE0);
  MEMORY[0x263E4CA00](&v21, v15);
  char v16 = v21;
  *(void *)&v6[BaselineMarks[6]] = v10;
  *(void *)&v6[BaselineMarks[7]] = v11;
  v6[BaselineMarks[8]] = v16;
  sub_261B7CADC(&qword_26A9489F0, (void (*)(uint64_t))type metadata accessor for TrainingLoadBaselineMarks);
  sub_261B8CF68();
  return sub_261B7D610((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for TrainingLoadBaselineMarks);
}

void *sub_261B76758(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CA8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416C20);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_261B8EEC8();
  uint64_t v39 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v37 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v38 = (char *)&v35 - v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v36 = (char *)&v35 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416C30);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t View = type metadata accessor for TrainingLoadViewModel.ChartPoint(0);
  uint64_t v20 = *(void *)(View - 8);
  MEMORY[0x270FA5388](View);
  uint64_t v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = (char *)a3 + *(int *)(type metadata accessor for TrainingLoadChart(0) + 44);
  uint64_t v24 = *(void *)v23;
  uint64_t v25 = *((void *)v23 + 1);
  LOBYTE(v23) = v23[16];
  uint64_t v41 = v24;
  uint64_t v42 = v25;
  char v43 = (char)v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946AE0);
  uint64_t result = MEMORY[0x263E4CA00](&v40, v26);
  if ((v40 & 1) == 0)
  {
    uint64_t v28 = a3[1];
    uint64_t v41 = *a3;
    uint64_t v42 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A10);
    sub_261B8EA18();
    sub_261A20D00((uint64_t)v18);
    swift_release();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, View) == 1)
    {
      return (void *)sub_2619F8754((uint64_t)v18, &qword_26B416C30);
    }
    else
    {
      sub_261B7DBDC((uint64_t)v18, (uint64_t)v22, type metadata accessor for TrainingLoadViewModel.ChartPoint);
      type metadata accessor for TrainingLoadChart.Configuration(0);
      uint64_t v29 = sub_261B8C9A8();
      MEMORY[0x270FA5388](v29);
      *(&v35 - 2) = (uint64_t)a3;
      *(&v35 - 1) = (uint64_t)v22;
      sub_261B72410((uint64_t (*)(char *))sub_261B7DC44, (uint64_t)(&v35 - 4), v9);
      sub_2619F8754((uint64_t)v6, &qword_26B416CA8);
      uint64_t v30 = v39;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v9, 1, v10) == 1)
      {
        sub_261B7D610((uint64_t)v22, type metadata accessor for TrainingLoadViewModel.ChartPoint);
        return (void *)sub_2619F8754((uint64_t)v9, &qword_26B416C20);
      }
      else
      {
        uint64_t v31 = v36;
        (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v36, v9, v10);
        uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
        uint64_t v33 = v38;
        v32(v38, v31, v10);
        v32(v37, v33, v10);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A948928);
        sub_261B8EB48();
        uint64_t v34 = *(void (**)(char *, uint64_t))(v30 + 8);
        v34(v33, v10);
        v34(v31, v10);
        return (void *)sub_261B7D610((uint64_t)v22, type metadata accessor for TrainingLoadViewModel.ChartPoint);
      }
    }
  }
  return result;
}

uint64_t sub_261B76C28()
{
  uint64_t v0 = sub_261B8AFC8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_261B8ADD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TrainingLoadChart(0);
  type metadata accessor for TrainingLoadChart.Configuration(0);
  sub_261B8C9C8();
  sub_261AB7B8C((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  char v8 = sub_261B8AD88();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8 & 1;
}

void *sub_261B76DE8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = (char *)a3 + *(int *)(type metadata accessor for TrainingLoadChart(0) + 44);
  uint64_t v6 = *(void *)v5;
  uint64_t v7 = *((void *)v5 + 1);
  LOBYTE(v5) = v5[16];
  uint64_t v12 = v6;
  uint64_t v13 = v7;
  char v14 = (char)v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946AE0);
  uint64_t result = MEMORY[0x263E4CA00](&v11, v8);
  if (v11 == 1)
  {
    uint64_t v10 = a3[1];
    uint64_t v12 = *a3;
    uint64_t v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A10);
    sub_261B8EA18();
    sub_261A21D00(a2);
    return (void *)swift_release();
  }
  return result;
}

void sub_261B76E94(uint64_t a1, unsigned char *a2, void *a3)
{
  uint64_t v5 = sub_261B8EEC8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CA8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*a2 & 1) == 0)
  {
    uint64_t v12 = a3[1];
    v13[1] = *a3;
    v13[2] = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A10);
    sub_261B8EA18();
    type metadata accessor for TrainingLoadChart(0);
    type metadata accessor for TrainingLoadChart.Configuration(0);
    sub_261B8C9A8();
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, &v11[*(int *)(v9 + 36)], v5);
    sub_2619F8754((uint64_t)v11, &qword_26B416CA8);
    sub_261A21D00((uint64_t)v8);
    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_261B77054@<X0>(uint64_t a1@<X8>)
{
  uint64_t v70 = a1;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946550);
  MEMORY[0x270FA5388](v79);
  uint64_t v69 = (char *)&v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  unint64_t v66 = (char *)&v64 - v4;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946388);
  MEMORY[0x270FA5388](v67);
  char v68 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_261B8AFC8();
  uint64_t v7 = *(char **)(v6 - 8);
  uint64_t v81 = (char *)v6;
  uint64_t v82 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v76 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_261B8EEC8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CA8) - 8;
  MEMORY[0x270FA5388](v75);
  char v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_261B8ADD8();
  uint64_t v78 = *(void **)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v65 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v64 = (char *)&v64 - v17;
  MEMORY[0x270FA5388](v18);
  uint64_t v73 = (char *)&v64 - v19;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v64 - v21;
  uint64_t v23 = v1 + *(int *)(type metadata accessor for TrainingLoadChart(0) + 20);
  uint64_t v74 = type metadata accessor for TrainingLoadChart.Configuration(0);
  sub_261B8C9A8();
  uint64_t v72 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v72(v12, v14, v9);
  sub_2619F8754((uint64_t)v14, &qword_26B416CA8);
  uint64_t v24 = v76;
  sub_261B8C9C8();
  uint64_t v77 = v22;
  sub_261B8EEB8();
  uint64_t v25 = (void (*)(char *, char *))*((void *)v82 + 1);
  v82 += 8;
  v25(v24, v81);
  uint64_t v26 = v10 + 8;
  uint64_t v27 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v71 = v26;
  v27(v12, v9);
  sub_261B8C9A8();
  v72(v12, &v14[*(int *)(v75 + 44)], v9);
  uint64_t v28 = v73;
  sub_2619F8754((uint64_t)v14, &qword_26B416CA8);
  sub_261B8C9C8();
  sub_261B8EEB8();
  v25(v24, v81);
  v27(v12, v9);
  if (*(unsigned char *)(v23 + *(int *)(v74 + 36)))
  {
    uint64_t v29 = v77;
    sub_261B8AD28();
    uint64_t v30 = v64;
    sub_261B8AD38();
    uint64_t v31 = v65;
    sub_261B8AD38();
    sub_261B7CADC(&qword_26A9464A0, MEMORY[0x263F07490]);
    uint64_t v32 = v80;
    char v33 = sub_261B8F088();
    uint64_t v34 = v78;
    uint64_t v35 = (void (*)(char *, uint64_t))v78[1];
    v35(v28, v32);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v35)(v29, v32);
    if (v33)
    {
      uint64_t v37 = v34;
      uint64_t v38 = v80;
      uint64_t v39 = v79;
      uint64_t v40 = v66;
      uint64_t v41 = &v66[*(int *)(v79 + 48)];
      uint64_t v82 = (char *)v35;
      uint64_t v42 = (void (*)(char *, char *, uint64_t))v37[4];
      v42(v66, v31, v80);
      char v43 = v41;
      v42(v41, v30, v38);
      uint64_t v44 = v37;
      char v45 = v69;
      uint64_t v46 = &v69[*(int *)(v39 + 48)];
      uint64_t v47 = (void (*)(char *, char *, uint64_t))v44[2];
      v47(v69, v40, v38);
      v47(v46, v43, v38);
      uint64_t v48 = (uint64_t)v68;
      v42(v68, v45, v38);
      uint64_t v49 = v82;
      ((void (*)(char *, uint64_t))v82)(v46, v38);
      uint64_t v50 = &v45[*(int *)(v79 + 48)];
      v42(v45, v40, v38);
      v42(v50, v43, v38);
      v42((char *)(v48 + *(int *)(v67 + 36)), v50, v38);
      ((void (*)(char *, uint64_t))v49)(v45, v38);
      return sub_2619FB7EC(v48, v70, &qword_26A946388);
    }
    __break(1u);
  }
  else
  {
    uint64_t v51 = v78;
    sub_261B7CADC(&qword_26A9464A0, MEMORY[0x263F07490]);
    double v52 = v77;
    uint64_t result = sub_261B8F088();
    if (result)
    {
      uint64_t v53 = v79;
      uint64_t v54 = v66;
      uint64_t v55 = &v66[*(int *)(v79 + 48)];
      uint64_t v56 = (void (*)(char *, char *, uint64_t))v51[4];
      uint64_t v57 = v52;
      uint64_t v58 = v80;
      v56(v66, v57, v80);
      uint64_t v82 = v55;
      v56(v55, v28, v58);
      uint64_t v59 = v69;
      uint64_t v81 = &v69[*(int *)(v53 + 48)];
      uint64_t v60 = v81;
      uint64_t v61 = (void (*)(char *, char *, uint64_t))v51[2];
      v61(v69, v54, v58);
      v61(v60, v55, v58);
      uint64_t v48 = (uint64_t)v68;
      v56(v68, v59, v58);
      uint64_t v62 = (void (*)(char *, uint64_t))v51[1];
      v62(v81, v58);
      uint64_t v63 = &v59[*(int *)(v79 + 48)];
      v56(v59, v54, v58);
      v56(v63, v82, v58);
      v56((char *)(v48 + *(int *)(v67 + 36)), v63, v58);
      v62(v59, v58);
      return sub_2619FB7EC(v48, v70, &qword_26A946388);
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_261B778B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v86 = a2;
  uint64_t v3 = sub_261B8D048();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v70 = (char *)v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A58);
  uint64_t v72 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v71 = (char *)v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A48);
  uint64_t v67 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  char v68 = (char *)v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_261B8ADD8();
  uint64_t v85 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  uint64_t v84 = (char *)v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v83 = (char *)v66 - v9;
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946388);
  MEMORY[0x270FA5388](v78);
  uint64_t v77 = (uint64_t)v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v66 - v12;
  uint64_t v14 = sub_261B8AFC8();
  uint64_t v81 = *(void *)(v14 - 8);
  uint64_t v82 = v14;
  MEMORY[0x270FA5388](v14);
  long long v87 = (char *)v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_261B8A9A8();
  uint64_t v79 = *(void *)(v16 - 8);
  uint64_t v80 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v76 = (char *)v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A38);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_261B8D0B8();
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Chart = type metadata accessor for TrainingLoadChart(0);
  uint64_t v25 = Chart - 8;
  uint64_t v26 = *(void *)(Chart - 8);
  uint64_t v27 = *(void *)(v26 + 64);
  MEMORY[0x270FA5388](Chart);
  uint64_t v28 = sub_261B8D028();
  MEMORY[0x270FA5388](v28 - 8);
  uint64_t v30 = (void (**)(char *, char *, uint64_t))((char *)v66 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946438);
  uint64_t v74 = *(void (***)(char *, char *, uint64_t))(v31 - 8);
  uint64_t v75 = v31;
  MEMORY[0x270FA5388](v31);
  char v33 = (char *)v66 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = a1 + *(int *)(v25 + 28);
  if (*(void *)(*(void *)(v34 + *(int *)(type metadata accessor for TrainingLoadChart.Configuration(0) + 28))
                 + 16) <= 8uLL)
  {
    sub_261B8D008();
    sub_261B7AEC4(a1, (uint64_t)v66 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TrainingLoadChart);
    unint64_t v55 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    uint64_t v56 = swift_allocObject();
    sub_261B7DBDC((uint64_t)v66 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), v56 + v55, type metadata accessor for TrainingLoadChart);
    swift_bridgeObjectRetain();
    sub_261B8D0A8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9464B0);
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9464B8);
    uint64_t v58 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9464C0);
    uint64_t v59 = sub_2619F8AB8(&qword_26A9464C8, &qword_26A9464C0);
    *(void *)&long long v89 = v58;
    *((void *)&v89 + 1) = v59;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    *(void *)&long long v89 = v57;
    *((void *)&v89 + 1) = MEMORY[0x263F1B440];
    *(void *)&long long v90 = OpaqueTypeConformance2;
    *((void *)&v90 + 1) = MEMORY[0x263F1B420];
    swift_getOpaqueTypeConformance2();
    sub_261B8D2A8();
    uint64_t v62 = v74;
    uint64_t v61 = v75;
    v74[2](v20, v33, v75);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A98);
    swift_storeEnumTagMultiPayload();
    sub_2619F86F0((uint64_t)v20, v86, &qword_26A948A38);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948AA0);
    swift_storeEnumTagMultiPayload();
    sub_2619F8754((uint64_t)v20, &qword_26A948A38);
    return ((uint64_t (*)(char *, uint64_t))v62[1])(v33, v61);
  }
  else
  {
    uint64_t v74 = v30;
    v66[1] = v23;
    v66[0] = v20;
    sub_261B8AFA8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A948AA8);
    uint64_t v35 = sub_261B8AFB8();
    uint64_t v36 = *(void *)(v35 - 8);
    unint64_t v37 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_261B93F70;
    (*(void (**)(unint64_t, void, uint64_t))(v36 + 104))(v38 + v37, *MEMORY[0x263F07870], v35);
    uint64_t v75 = sub_261A5407C(v38);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    sub_261B77054((uint64_t)v13);
    uint64_t v39 = v85;
    uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v85 + 16);
    uint64_t v41 = v83;
    uint64_t v42 = v88;
    v40(v83, v13, v88);
    sub_2619F8754((uint64_t)v13, &qword_26A946388);
    uint64_t v43 = v77;
    sub_261B77054(v77);
    uint64_t v44 = v84;
    v40(v84, (char *)(v43 + *(int *)(v78 + 36)), v42);
    sub_2619F8754(v43, &qword_26A946388);
    char v45 = v76;
    uint64_t v46 = v87;
    sub_261B8AF48();
    swift_bridgeObjectRelease();
    uint64_t v47 = *(void (**)(char *, uint64_t))(v39 + 8);
    v47(v44, v42);
    v47(v41, v42);
    (*(void (**)(char *, uint64_t))(v81 + 8))(v46, v82);
    uint64_t v48 = sub_261B8A988();
    LOBYTE(v41) = v49;
    (*(void (**)(char *, uint64_t))(v79 + 8))(v45, v80);
    if ((v41 & 1) != 0 || v48 > 28)
    {
      uint64_t v91 = 0;
      long long v89 = 0u;
      long long v90 = 0u;
      sub_261B8D018();
      sub_261B8D0A8();
      sub_261B8D038();
      uint64_t v63 = v71;
      sub_261B8D288();
      uint64_t v64 = v72;
      uint64_t v65 = v73;
      (*(void (**)(uint64_t, char *, uint64_t))(v72 + 16))(v86, v63, v73);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948AA0);
      swift_storeEnumTagMultiPayload();
      return (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v63, v65);
    }
    else
    {
      sub_261B78BA0();
      sub_261B8D018();
      sub_261B8D0A8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948AB0);
      sub_261B7DB28();
      uint64_t v50 = v68;
      sub_261B8D2B8();
      uint64_t v51 = v67;
      uint64_t v52 = v66[0];
      uint64_t v53 = v69;
      (*(void (**)(void, char *, uint64_t))(v67 + 16))(v66[0], v50, v69);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A98);
      swift_storeEnumTagMultiPayload();
      sub_2619F86F0(v52, v86, &qword_26A948A38);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A948AA0);
      swift_storeEnumTagMultiPayload();
      sub_2619F8754(v52, &qword_26A948A38);
      return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v50, v53);
    }
  }
}

uint64_t sub_261B78488@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v39 = a1;
  uint64_t v51 = a3;
  uint64_t v4 = sub_261B8D128();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v43 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_261B8D148();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v42 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_261B8ACB8();
  uint64_t v36 = *(void *)(v8 - 8);
  uint64_t v37 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_261B8ACD8();
  uint64_t v11 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v38 = (char *)&v36 - v15;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9464C0);
  uint64_t v41 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9464B8);
  uint64_t v49 = *(void *)(v18 - 8);
  uint64_t v50 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v46 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9464B0);
  uint64_t v45 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v44 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *a2;
  uint64_t v21 = a2[1];
  uint64_t v52 = *a2;
  uint64_t v53 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A10);
  sub_261B8EA18();
  uint64_t v23 = v54;
  swift_getKeyPath();
  uint64_t v52 = v23;
  sub_261B7CADC((unint64_t *)&qword_26A943FE8, (void (*)(uint64_t))type metadata accessor for TrainingLoadChartViewModel);
  sub_261B8B038();
  swift_release();
  double v24 = *(double *)(v23 + OBJC_IVAR____TtC9WorkoutUI26TrainingLoadChartViewModel__emphasizedChartPointIndexOffset);
  uint64_t result = swift_release();
  if ((~*(void *)&v24 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v24 <= -9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v24 >= 9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v26 = (uint64_t)v24 - 1;
  if (__OFSUB__((uint64_t)v24, 1))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v52 = v22;
  uint64_t v53 = v21;
  sub_261B8EA18();
  uint64_t v27 = sub_261A1FEE0();
  uint64_t result = swift_release();
  if (__OFADD__(v26, v27))
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v39 = v26 + v27;
  uint64_t v28 = sub_261B8D2E8();
  MEMORY[0x263E48600]();
  sub_261B8AC88();
  sub_261B8ACC8();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v37);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v40);
  sub_261B8ED48();
  sub_261B8D138();
  sub_261B8D118();
  sub_261B7CADC(&qword_26A948AC0, MEMORY[0x263F07258]);
  sub_261B8D058();
  sub_261B8E268();
  sub_261B8E148();
  sub_261B8E1D8();
  swift_release();
  uint64_t v29 = sub_2619F8AB8(&qword_26A9464C8, &qword_26A9464C0);
  uint64_t v30 = v46;
  uint64_t v31 = v48;
  sub_261B8D1E8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v17, v31);
  uint64_t v32 = sub_261B8E898();
  if (v28 != v39)
  {
    uint64_t v33 = sub_261B8E8A8();
    swift_release();
    uint64_t v32 = v33;
  }
  uint64_t v53 = v29;
  uint64_t v54 = v32;
  uint64_t v52 = v31;
  swift_getOpaqueTypeConformance2();
  uint64_t v34 = v44;
  uint64_t v35 = v50;
  sub_261B8D1D8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v30, v35);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v45 + 32))(v51, v34, v47);
}

unint64_t sub_261B78BA0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948AD0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v77 = (char *)&v58 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948AD8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v76 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_261B8A9A8();
  unint64_t v81 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  uint64_t v74 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_261B8ADD8();
  uint64_t v62 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v73 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v72 = (char *)&v58 - v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v58 - v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v80 = (char *)&v58 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946388);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_261B8AFB8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v70 = (char *)v16;
  uint64_t v71 = v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_261B8AFC8();
  uint64_t v20 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v22 = (char *)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943B38);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v69 = (char *)&v58 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v78 = (char *)&v58 - v26;
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)&v58 - v28;
  sub_261B8AFA8();
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v19, *MEMORY[0x263F07870], v16);
  sub_261B77054((uint64_t)v15);
  uint64_t v30 = v62;
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
  uint64_t v32 = v80;
  uint64_t v33 = v59;
  uint64_t v61 = v62 + 16;
  uint64_t v60 = v31;
  v31(v80, v15, v59);
  uint64_t v34 = (uint64_t)v15;
  uint64_t v35 = v33;
  sub_2619F8754(v34, &qword_26A946388);
  uint64_t v82 = v29;
  sub_261B8AF88();
  uint64_t v36 = (uint64_t)v78;
  uint64_t v67 = *(void (**)(char *, uint64_t))(v30 + 8);
  uint64_t v68 = v30 + 8;
  v67(v32, v35);
  (*(void (**)(char *, char *))(v71 + 8))(v19, v70);
  uint64_t v37 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v70 = v22;
  unint64_t v66 = v37;
  v37(v22, v79);
  uint64_t v38 = 0;
  uint64_t v39 = v30;
  uint64_t v40 = (char *)(v30 + 48);
  uint64_t v41 = (void (**)(char *, uint64_t, uint64_t))(v39 + 32);
  uint64_t v71 = v20 + 8;
  uint64_t v64 = (void (**)(char *, uint64_t))(v81 + 8);
  uint64_t v65 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v80 = v40;
  unint64_t v81 = MEMORY[0x263F8EE78];
  uint64_t v63 = (void (**)(char *, uint64_t, uint64_t))(v39 + 32);
  do
  {
    sub_2619F86F0((uint64_t)v82, v36, &qword_26A943B38);
    uint64_t v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))v40;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v40)(v36, 1, v35) == 1)
    {
      sub_2619F8754(v36, &qword_26A943B38);
    }
    else
    {
      uint64_t v43 = *v41;
      (*v41)(v10, v36, v35);
      uint64_t v44 = v70;
      sub_261B8AFA8();
      uint64_t v45 = v79;
      (*v65)(v76, 1, 1, v79);
      uint64_t v46 = sub_261B8AFD8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v77, 1, 1, v46);
      uint64_t v47 = v10;
      uint64_t v48 = v74;
      sub_261B8A998();
      uint64_t v49 = (uint64_t)v69;
      sub_261B8AF78();
      (*v64)(v48, v75);
      uint64_t v50 = v45;
      uint64_t v40 = v80;
      v66(v44, v50);
      if (v42(v49, 1, v35) == 1)
      {
        v67(v47, v35);
        sub_2619F8754(v49, &qword_26A943B38);
        uint64_t v10 = v47;
        uint64_t v36 = (uint64_t)v78;
        uint64_t v41 = v63;
      }
      else
      {
        uint64_t v51 = v72;
        uint64_t v52 = v49;
        uint64_t v41 = v63;
        v43(v72, v52, v35);
        v60(v73, v51, v35);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v81 = sub_261A0B5A8(0, *(void *)(v81 + 16) + 1, 1, v81);
        }
        uint64_t v10 = v47;
        unint64_t v54 = *(void *)(v81 + 16);
        unint64_t v53 = *(void *)(v81 + 24);
        if (v54 >= v53 >> 1) {
          unint64_t v81 = sub_261A0B5A8(v53 > 1, v54 + 1, 1, v81);
        }
        unint64_t v55 = v81;
        *(void *)(v81 + 16) = v54 + 1;
        v43((char *)(v55+ ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80))+ *(void *)(v62 + 72) * v54), (uint64_t)v73, v35);
        uint64_t v56 = v67;
        v67(v72, v35);
        v56(v47, v35);
        uint64_t v36 = (uint64_t)v78;
        uint64_t v40 = v80;
      }
    }
    v38 += 7;
  }
  while (v38 != 35);
  sub_2619F8754((uint64_t)v82, &qword_26A943B38);
  return v81;
}

uint64_t sub_261B79460@<X0>(uint64_t a1@<X8>)
{
  uint64_t v72 = a1;
  uint64_t v1 = sub_261B8D208();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v68 = (char *)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_261B8D228();
  uint64_t v70 = *(void *)(v3 - 8);
  uint64_t v71 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v69 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v66 = (char *)&v56 - v6;
  uint64_t v67 = sub_261B8CEA8();
  uint64_t v64 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v74 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v65 = (char *)&v56 - v9;
  uint64_t v10 = sub_261B8D128();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v63 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_261B8D148();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v62 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_261B8AC78();
  uint64_t v59 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_261B8AC98();
  uint64_t v16 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v18 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_261B8ACD8();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v56 - v24;
  MEMORY[0x270FA5388](v26);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9464C0);
  uint64_t v56 = *(void *)(v61 - 8);
  uint64_t v27 = v56;
  MEMORY[0x270FA5388](v61);
  uint64_t v29 = (char *)&v56 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v31 = MEMORY[0x270FA5388](v30);
  uint64_t v73 = (char *)&v56 - v32;
  MEMORY[0x263E48600](v31);
  sub_261B8AC88();
  sub_261B8AC58();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v58);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v20 + 8);
  v33(v22, v19);
  sub_261B8AC68();
  sub_261B8AC48();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v15, v60);
  v33(v25, v19);
  sub_261B8D138();
  sub_261B8D118();
  sub_261B7CADC(&qword_26A948AC0, MEMORY[0x263F07258]);
  uint64_t v34 = v73;
  sub_261B8D058();
  uint64_t v78 = 0;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v35 = v65;
  sub_261B8CE98();
  sub_261B8D1F8();
  uint64_t v36 = v66;
  sub_261B8D218();
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  uint64_t v38 = v29;
  uint64_t v57 = v29;
  uint64_t v39 = v29;
  uint64_t v40 = v61;
  v37(v39, v34, v61);
  v75[0] = v38;
  uint64_t v41 = v64;
  uint64_t v42 = v74;
  uint64_t v43 = v35;
  uint64_t v44 = v67;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v74, v35, v67);
  v75[1] = v42;
  uint64_t v46 = v69;
  uint64_t v45 = v70;
  uint64_t v47 = v36;
  uint64_t v48 = v36;
  uint64_t v49 = v71;
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v69, v47, v71);
  v75[2] = v46;
  sub_261B73748(v75, v72);
  uint64_t v50 = *(void (**)(char *, uint64_t))(v45 + 8);
  uint64_t v51 = v48;
  uint64_t v52 = v49;
  v50(v51, v49);
  unint64_t v53 = *(void (**)(char *, uint64_t))(v41 + 8);
  v53(v43, v44);
  unint64_t v54 = *(void (**)(char *, uint64_t))(v56 + 8);
  v54(v73, v40);
  v50(v46, v52);
  v53(v74, v44);
  return ((uint64_t (*)(char *, uint64_t))v54)(v57, v40);
}

uint64_t sub_261B79BF4(uint64_t a1)
{
  uint64_t Chart = type metadata accessor for TrainingLoadChart(0);
  uint64_t v3 = *(void *)(Chart - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](Chart - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CD0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261B8D528();
  uint64_t v10 = v9;
  sub_261B8D528();
  uint64_t v12 = v11;
  uint64_t v13 = sub_261B8F398();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  sub_261B7AEC4(a1, (uint64_t)v5, type metadata accessor for TrainingLoadChart);
  sub_261B8F378();
  uint64_t v14 = sub_261B8F368();
  unint64_t v15 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v16 = (v4 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = MEMORY[0x263F8F500];
  *(void *)(v17 + 16) = v14;
  *(void *)(v17 + 24) = v18;
  sub_261B7DBDC((uint64_t)v5, v17 + v15, type metadata accessor for TrainingLoadChart);
  *(void *)(v17 + v16) = v10;
  *(void *)(v17 + ((v16 + 15) & 0xFFFFFFFFFFFFFFF8)) = v12;
  sub_261AF092C((uint64_t)v8, (uint64_t)&unk_26A948A90, v17);
  return swift_release();
}

uint64_t sub_261B79E08(uint64_t *a1, uint64_t a2)
{
  uint64_t v55 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CD0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v59 = &v52[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t Chart = type metadata accessor for TrainingLoadChart(0);
  uint64_t v6 = Chart - 8;
  uint64_t v56 = *(void *)(Chart - 8);
  MEMORY[0x270FA5388](Chart);
  uint64_t v57 = v7;
  uint64_t v58 = &v52[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (uint64_t *)&v52[-v9];
  uint64_t v11 = type metadata accessor for TrainingLoadChart.Configuration(0);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  unint64_t v54 = &v52[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v14);
  unint64_t v16 = &v52[-v15];
  uint64_t v17 = a1[1];
  uint64_t v65 = *a1;
  uint64_t v66 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A10);
  sub_261B8EA18();
  uint64_t v18 = v63;
  swift_getKeyPath();
  uint64_t v65 = v18;
  sub_261B7CADC((unint64_t *)&qword_26A943FE8, (void (*)(uint64_t))type metadata accessor for TrainingLoadChartViewModel);
  sub_261B8B038();
  swift_release();
  uint64_t v19 = v18 + OBJC_IVAR____TtC9WorkoutUI26TrainingLoadChartViewModel__configuration;
  swift_beginAccess();
  sub_261B7AEC4(v19, (uint64_t)v16, type metadata accessor for TrainingLoadChart.Configuration);
  swift_release();
  uint64_t v20 = *(void *)&v16[*(int *)(v12 + 32)];
  swift_bridgeObjectRetain();
  sub_261B7D610((uint64_t)v16, type metadata accessor for TrainingLoadChart.Configuration);
  uint64_t v21 = *(void *)(v20 + 16);
  swift_bridgeObjectRelease();
  uint64_t v22 = (uint64_t)a1 + *(int *)(v6 + 28);
  uint64_t v23 = *(void *)(*(void *)(v22 + *(int *)(v12 + 32)) + 16);
  sub_261B7AEC4((uint64_t)a1, (uint64_t)v10, type metadata accessor for TrainingLoadChart);
  if (v21 == v23)
  {
    uint64_t v24 = v10[1];
    uint64_t v63 = *v10;
    uint64_t v64 = v24;
    sub_261B8EA18();
    uint64_t v25 = v60;
    swift_getKeyPath();
    uint64_t v63 = v25;
    sub_261B8B038();
    swift_release();
    double v26 = *(double *)(v25 + OBJC_IVAR____TtC9WorkoutUI26TrainingLoadChartViewModel__emphasizedChartPointIndexOffset);
    swift_release();
    BOOL v53 = v26 == -1.0;
  }
  else
  {
    BOOL v53 = 1;
  }
  sub_261B7D610((uint64_t)v10, type metadata accessor for TrainingLoadChart);
  uint64_t v27 = a1[1];
  uint64_t v63 = *a1;
  uint64_t v64 = v27;
  sub_261B8EA18();
  uint64_t v28 = v60;
  swift_getKeyPath();
  uint64_t v63 = v28;
  sub_261B8B038();
  swift_release();
  uint64_t v29 = v28 + OBJC_IVAR____TtC9WorkoutUI26TrainingLoadChartViewModel__configuration;
  swift_beginAccess();
  sub_261B7AEC4(v29, (uint64_t)v16, type metadata accessor for TrainingLoadChart.Configuration);
  swift_release();
  uint64_t v30 = v54;
  sub_261B7AEC4(v22, (uint64_t)v54, type metadata accessor for TrainingLoadChart.Configuration);
  LOBYTE(v29) = _s9WorkoutUI17TrainingLoadChartV13ConfigurationV2eeoiySbAE_AEtFZ_0((uint64_t)v16, (uint64_t)v30);
  sub_261B7D610((uint64_t)v30, type metadata accessor for TrainingLoadChart.Configuration);
  sub_261B7D610((uint64_t)v16, type metadata accessor for TrainingLoadChart.Configuration);
  if (v29)
  {
    if (!v53) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v31 = a1[1];
  uint64_t v60 = *a1;
  uint64_t v61 = v31;
  sub_261B8EA18();
  uint64_t v32 = v62;
  sub_261B7AEC4(v22, (uint64_t)v16, type metadata accessor for TrainingLoadChart.Configuration);
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  *(void *)&v52[-16] = v32;
  *(void *)&v52[-8] = v16;
  uint64_t v60 = v32;
  sub_261B8B028();
  swift_release();
  sub_261B7D610((uint64_t)v16, type metadata accessor for TrainingLoadChart.Configuration);
  swift_release();
  if (v53)
  {
LABEL_8:
    uint64_t v35 = a1[1];
    uint64_t v60 = *a1;
    uint64_t v34 = v60;
    uint64_t v61 = v35;
    sub_261B8EA18();
    uint64_t v36 = v62;
    uint64_t v60 = v34;
    uint64_t v61 = v35;
    sub_261B8EA18();
    double v37 = sub_261A20050();
    swift_release();
    uint64_t v38 = swift_getKeyPath();
    MEMORY[0x270FA5388](v38);
    *(void *)&v52[-16] = v36;
    *(double *)&v52[-8] = v37;
    uint64_t v60 = v36;
    sub_261B8B028();
    swift_release();
    swift_release();
  }
LABEL_9:
  sub_261B8D528();
  uint64_t v40 = v39;
  sub_261B8D528();
  uint64_t v42 = v41;
  uint64_t v43 = sub_261B8F398();
  uint64_t v44 = (uint64_t)v59;
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v59, 1, 1, v43);
  uint64_t v45 = v58;
  sub_261B7AEC4((uint64_t)a1, (uint64_t)v58, type metadata accessor for TrainingLoadChart);
  sub_261B8F378();
  uint64_t v46 = sub_261B8F368();
  unint64_t v47 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  unint64_t v48 = (v57 + v47 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v49 = swift_allocObject();
  uint64_t v50 = MEMORY[0x263F8F500];
  *(void *)(v49 + 16) = v46;
  *(void *)(v49 + 24) = v50;
  sub_261B7DBDC((uint64_t)v45, v49 + v47, type metadata accessor for TrainingLoadChart);
  *(void *)(v49 + v48) = v40;
  *(void *)(v49 + ((v48 + 15) & 0xFFFFFFFFFFFFFFF8)) = v42;
  sub_261AF092C(v44, (uint64_t)&unk_26A948A78, v49);
  return swift_release();
}

uint64_t sub_261B7A598(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(double *)(v6 + 160) = a1;
  *(double *)(v6 + 168) = a2;
  *(void *)(v6 + 152) = a6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B416C98);
  *(void *)(v6 + 176) = swift_task_alloc();
  *(void *)(v6 + 184) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B416CA8);
  *(void *)(v6 + 192) = swift_task_alloc();
  uint64_t v7 = sub_261B8C9E8();
  *(void *)(v6 + 200) = v7;
  *(void *)(v6 + 208) = *(void *)(v7 - 8);
  *(void *)(v6 + 216) = swift_task_alloc();
  *(void *)(v6 + 224) = type metadata accessor for TrainingLoadChart.Configuration(0);
  *(void *)(v6 + 232) = swift_task_alloc();
  sub_261B8F378();
  *(void *)(v6 + 240) = sub_261B8F368();
  uint64_t v9 = sub_261B8F328();
  return MEMORY[0x270FA2498](sub_261B7A730, v9, v8);
}

uint64_t sub_261B7A730()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[29];
  uint64_t v4 = v0[27];
  uint64_t v3 = v0[28];
  uint64_t v5 = v0[26];
  uint64_t v27 = v0[25];
  uint64_t v7 = v0[23];
  uint64_t v6 = v0[24];
  uint64_t v28 = v0[22];
  uint64_t v9 = v0[20];
  uint64_t v8 = v0[21];
  uint64_t v10 = (void *)v0[19];
  swift_release();
  uint64_t Chart = type metadata accessor for TrainingLoadChart(0);
  uint64_t v26 = *(void *)((char *)v10 + *(int *)(Chart + 20) + *(int *)(v3 + 24));
  uint64_t v29 = Chart;
  uint64_t v12 = (void *)((char *)v10 + *(int *)(Chart + 32));
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  uint64_t v15 = v10[1];
  v1[12] = *v10;
  v1[13] = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A10);
  sub_261B8EA18();
  uint64_t v16 = v1[16];
  swift_getKeyPath();
  v1[17] = v16;
  sub_261B7CADC((unint64_t *)&qword_26A943FE8, (void (*)(uint64_t))type metadata accessor for TrainingLoadChartViewModel);
  sub_261B8B038();
  swift_release();
  uint64_t v17 = v16 + OBJC_IVAR____TtC9WorkoutUI26TrainingLoadChartViewModel__configuration;
  swift_beginAccess();
  sub_261B7AEC4(v17, v2, type metadata accessor for TrainingLoadChart.Configuration);
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v2, v27);
  sub_261B7D610(v2, type metadata accessor for TrainingLoadChart.Configuration);
  sub_261B8C9A8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v27);
  uint64_t v18 = sub_261B8EEC8();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v7, v6, v18);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
  v20(v7, 0, 1, v18);
  v20(v28, 1, 1, v18);
  uint64_t v21 = sub_261B1376C(v7, v28);
  sub_2619F8754(v28, &qword_26B416C98);
  sub_2619F8754(v7, &qword_26B416C98);
  sub_2619F8754(v6, &qword_26B416CA8);
  swift_bridgeObjectRetain();
  sub_261B8E898();
  uint64_t v22 = sub_261B8E8A8();
  swift_release();
  v1[2] = v22;
  v1[3] = v26;
  v1[4] = v9;
  v1[5] = v8;
  v1[6] = v13;
  v1[7] = v14;
  v1[8] = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A80);
  swift_allocObject();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_261B8D568();
  if (sub_261B8D548())
  {
    uint64_t v23 = sub_261B8E908();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v23 = 0;
  }
  *((_OWORD *)v1 + 7) = *(_OWORD *)(v1[19] + *(int *)(v29 + 36));
  v1[18] = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948A88);
  sub_261B8EA28();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = (uint64_t (*)(void))v1[1];
  return v24();
}

uint64_t sub_261B7AB70(uint64_t a1)
{
  uint64_t v3 = sub_261B8DAE8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v9);
  sub_261B7AEC4(v1, (uint64_t)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TrainingLoadChart);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  sub_261B7DBDC((uint64_t)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10, type metadata accessor for TrainingLoadChart);
  v13[0] = sub_261B7AF30;
  v13[1] = v11;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F19790], v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948938);
  sub_2619F8AB8(&qword_26A948940, &qword_26A948938);
  sub_261B8E548();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return swift_release();
}

uint64_t _s9WorkoutUI17TrainingLoadChartV13ConfigurationV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((MEMORY[0x263E4A8A0]() & 1) != 0
    && (uint64_t v4 = (int *)type metadata accessor for TrainingLoadChart.Configuration(0),
        (MEMORY[0x263E4A8A0](a1 + v4[5], a2 + v4[5]) & 1) != 0)
    && (sub_261B72E1C(*(void *)(a1 + v4[6]), *(void *)(a2 + v4[6])) & 1) != 0
    && (sub_261B73530(*(void *)(a1 + v4[7]), *(void *)(a2 + v4[7]), MEMORY[0x263F07490], &qword_26A948AF0, MEMORY[0x263F07490], MEMORY[0x263F074B0]) & 1) != 0&& *(unsigned __int8 *)(a1 + v4[8]) == *(unsigned __int8 *)(a2 + v4[8]))
  {
    char v5 = *(unsigned char *)(a1 + v4[9]) ^ *(unsigned char *)(a2 + v4[9]) ^ 1;
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t type metadata accessor for TrainingLoadChart(uint64_t a1)
{
  return sub_261A84418(a1, (uint64_t *)&unk_26A948948);
}

uint64_t sub_261B7AEC4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_261B7AF30(uint64_t a1)
{
  return sub_261B7C8E8(a1, (uint64_t (*)(uint64_t, uint64_t))sub_261B74394);
}

uint64_t sub_261B7AF48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for TrainingLoadChart(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_261B8C9E8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_retain();
    swift_retain();
    v12(v9, v10, v11);
    uint64_t v13 = (int *)type metadata accessor for TrainingLoadChart.Configuration(0);
    v12(&v9[v13[5]], &v10[v13[5]], v11);
    *(void *)&v9[v13[6]] = *(void *)&v10[v13[6]];
    *(void *)&v9[v13[7]] = *(void *)&v10[v13[7]];
    v9[v13[8]] = v10[v13[8]];
    v9[v13[9]] = v10[v13[9]];
    uint64_t v14 = a3[7];
    *(uint64_t *)((char *)v7 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)v7 + v14) = *(uint64_t *)((char *)a2 + v14);
    uint64_t v15 = a3[9];
    *(_OWORD *)((char *)v7 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
    uint64_t v16 = (uint64_t *)((char *)v7 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = a3[10];
    uint64_t v20 = (uint64_t *)((char *)v7 + v19);
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = *(uint64_t *)((char *)a2 + v19 + 8);
    *uint64_t v20 = *(uint64_t *)((char *)a2 + v19);
    v20[1] = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A948928) + 32);
    uint64_t v24 = (char *)v20 + v23;
    uint64_t v25 = &v21[v23];
    uint64_t v26 = sub_261B8EEC8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
    uint64_t v27 = a3[11];
    uint64_t v28 = (char *)v7 + v27;
    uint64_t v29 = (char *)a2 + v27;
    uint64_t v30 = *((void *)v29 + 1);
    *(void *)uint64_t v28 = *(void *)v29;
    *((void *)v28 + 1) = v30;
    v28[16] = v29[16];
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t destroy for TrainingLoadChart(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_261B8C9E8();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  uint64_t v7 = type metadata accessor for TrainingLoadChart.Configuration(0);
  v6(v4 + *(int *)(v7 + 20), v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v8 = a1 + *(int *)(a2 + 40);
  swift_release();
  swift_release();
  uint64_t v9 = v8 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A948928) + 32);
  uint64_t v10 = sub_261B8EEC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_release();
  return swift_release();
}

void *initializeWithCopy for TrainingLoadChart(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_261B8C9E8();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_retain();
  swift_retain();
  v11(v8, v9, v10);
  uint64_t v12 = (int *)type metadata accessor for TrainingLoadChart.Configuration(0);
  v11(&v8[v12[5]], &v9[v12[5]], v10);
  *(void *)&v8[v12[6]] = *(void *)&v9[v12[6]];
  *(void *)&v8[v12[7]] = *(void *)&v9[v12[7]];
  v8[v12[8]] = v9[v12[8]];
  v8[v12[9]] = v9[v12[9]];
  uint64_t v13 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  uint64_t v14 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = a3[10];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = *(void *)((char *)a2 + v18 + 8);
  *uint64_t v19 = *(void *)((char *)a2 + v18);
  v19[1] = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v22 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A948928) + 32);
  uint64_t v23 = (char *)v19 + v22;
  uint64_t v24 = &v20[v22];
  uint64_t v25 = sub_261B8EEC8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
  uint64_t v26 = a3[11];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = *((void *)v28 + 1);
  *(void *)uint64_t v27 = *(void *)v28;
  *((void *)v27 + 1) = v29;
  v27[16] = v28[16];
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for TrainingLoadChart(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_261B8C9E8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  uint64_t v11 = (int *)type metadata accessor for TrainingLoadChart.Configuration(0);
  v10(&v7[v11[5]], &v8[v11[5]], v9);
  *(void *)&v7[v11[6]] = *(void *)&v8[v11[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&v7[v11[7]] = *(void *)&v8[v11[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7[v11[8]] = v8[v11[8]];
  v7[v11[9]] = v8[v11[9]];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  uint64_t v12 = a3[8];
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  uint64_t v15 = a3[9];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  *(void *)((char *)a1 + v15) = *(void *)((char *)a2 + v15);
  swift_retain();
  swift_release();
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_retain();
  swift_release();
  uint64_t v18 = a3[10];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  *(void *)((char *)a1 + v18) = *(void *)((char *)a2 + v18);
  swift_retain();
  swift_release();
  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_retain();
  swift_release();
  uint64_t v21 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A948928) + 32);
  uint64_t v22 = &v19[v21];
  uint64_t v23 = &v20[v21];
  uint64_t v24 = sub_261B8EEC8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 24))(v22, v23, v24);
  uint64_t v25 = a3[11];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  *(void *)((char *)a1 + v25) = *(void *)((char *)a2 + v25);
  swift_retain();
  swift_release();
  *((void *)v26 + 1) = *((void *)v27 + 1);
  swift_retain();
  swift_release();
  v26[16] = v27[16];
  return a1;
}

_OWORD *initializeWithTake for TrainingLoadChart(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_261B8C9E8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = (int *)type metadata accessor for TrainingLoadChart.Configuration(0);
  v10(&v7[v11[5]], &v8[v11[5]], v9);
  *(void *)&v7[v11[6]] = *(void *)&v8[v11[6]];
  *(void *)&v7[v11[7]] = *(void *)&v8[v11[7]];
  v7[v11[8]] = v8[v11[8]];
  v7[v11[9]] = v8[v11[9]];
  uint64_t v12 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  uint64_t v13 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v13) = *(_OWORD *)((char *)a2 + v13);
  uint64_t v14 = a3[10];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = *(void *)((char *)a2 + v14 + 8);
  *uint64_t v15 = *(void *)((char *)a2 + v14);
  v15[1] = v17;
  uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A948928) + 32);
  uint64_t v19 = (char *)v15 + v18;
  uint64_t v20 = &v16[v18];
  uint64_t v21 = sub_261B8EEC8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  uint64_t v22 = a3[11];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  v23[16] = v24[16];
  return a1;
}

void *assignWithTake for TrainingLoadChart(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_261B8C9E8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40);
  v10(v7, v8, v9);
  uint64_t v11 = (int *)type metadata accessor for TrainingLoadChart.Configuration(0);
  v10(&v7[v11[5]], &v8[v11[5]], v9);
  *(void *)&v7[v11[6]] = *(void *)&v8[v11[6]];
  swift_bridgeObjectRelease();
  *(void *)&v7[v11[7]] = *(void *)&v8[v11[7]];
  swift_bridgeObjectRelease();
  v7[v11[8]] = v8[v11[8]];
  v7[v11[9]] = v8[v11[9]];
  uint64_t v12 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  uint64_t v13 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  swift_release();
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_release();
  uint64_t v16 = a3[10];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  swift_release();
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_release();
  uint64_t v19 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A948928) + 32);
  uint64_t v20 = &v17[v19];
  uint64_t v21 = &v18[v19];
  uint64_t v22 = sub_261B8EEC8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 40))(v20, v21, v22);
  uint64_t v23 = a3[11];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  *(void *)((char *)a1 + v23) = *(void *)v25;
  swift_release();
  *((void *)v24 + 1) = *((void *)v25 + 1);
  swift_release();
  v24[16] = v25[16];
  return a1;
}

uint64_t getEnumTagSinglePayload for TrainingLoadChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_261B7BB5C);
}

uint64_t sub_261B7BB5C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for TrainingLoadChart.Configuration(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948928);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 40);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for TrainingLoadChart(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_261B7BCA0);
}

void *sub_261B7BCA0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for TrainingLoadChart.Configuration(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948928);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 40);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_261B7BDD0()
{
  type metadata accessor for TrainingLoadChart.Configuration(319);
  if (v0 <= 0x3F)
  {
    sub_261B7BED0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_261B7BED0()
{
  if (!qword_26A948958)
  {
    sub_261B8EEC8();
    unint64_t v0 = sub_261B8EB88();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A948958);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for TrainingLoadChart.Configuration(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (void *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_261B8C9E8();
    uint64_t v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((void *)((char *)a1 + a3[5]), (void *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[7];
    *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
    *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
    uint64_t v10 = a3[9];
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TrainingLoadChart.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_261B8C9E8();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TrainingLoadChart.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_261B8C9E8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TrainingLoadChart.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_261B8C9E8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  return a1;
}

uint64_t initializeWithTake for TrainingLoadChart.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_261B8C9E8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  return a1;
}

uint64_t assignWithTake for TrainingLoadChart.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_261B8C9E8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrainingLoadChart.Configuration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_261B7C44C);
}

uint64_t sub_261B7C44C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_261B8C9E8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for TrainingLoadChart.Configuration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_261B7C520);
}

uint64_t sub_261B7C520(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_261B8C9E8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_261B7C5DC()
{
  uint64_t result = sub_261B8C9E8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_261B7C684()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t objectdestroyTm_6()
{
  unint64_t v1 = (int *)(type metadata accessor for TrainingLoadChart(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  swift_release();
  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_261B8C9E8();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  uint64_t v10 = type metadata accessor for TrainingLoadChart.Configuration(0);
  v9(v7 + *(int *)(v10 + 20), v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v11 = v6 + v1[12];
  swift_release();
  swift_release();
  uint64_t v12 = v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A948928) + 32);
  uint64_t v13 = sub_261B8EEC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_261B7C8E8(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for TrainingLoadChart(0) - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(a1, v5);
}

uint64_t sub_261B7C97C@<X0>(uint64_t a1@<X8>)
{
  return sub_261B75AE8(*(uint64_t **)(v1 + 16), a1);
}

unint64_t sub_261B7C984()
{
  unint64_t result = qword_26A9489D8;
  if (!qword_26A9489D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9489D0);
    sub_261B7CA08();
    sub_261B7CB24();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9489D8);
  }
  return result;
}

unint64_t sub_261B7CA08()
{
  unint64_t result = qword_26A9489E0;
  if (!qword_26A9489E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9489E8);
    type metadata accessor for TrainingLoadBaselineMarks();
    sub_261B7CADC(&qword_26A9489F0, (void (*)(uint64_t))type metadata accessor for TrainingLoadBaselineMarks);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9489E0);
  }
  return result;
}

uint64_t sub_261B7CADC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_261B7CB24()
{
  unint64_t result = qword_26A9489F8;
  if (!qword_26A9489F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948A00);
    sub_261B7CADC(&qword_26A948A08, (void (*)(uint64_t))type metadata accessor for TrainingLoadSmoothedLineTrace);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9489F8);
  }
  return result;
}

void *sub_261B7CBD4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for TrainingLoadChart(0) - 8);
  uint64_t v6 = (uint64_t *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));
  return sub_261B76758(a1, a2, v6);
}

void *sub_261B7CC58(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for TrainingLoadChart(0) - 8);
  uint64_t v6 = (uint64_t *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));
  return sub_261B76DE8(a1, a2, v6);
}

void sub_261B7CCDC(uint64_t a1, unsigned char *a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for TrainingLoadChart(0) - 8);
  uint64_t v6 = (void *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));
  sub_261B76E94(a1, a2, v6);
}

uint64_t sub_261B7CD5C@<X0>(uint64_t a1@<X8>)
{
  return sub_261B778B4(*(void *)(v1 + 16), a1);
}

unint64_t sub_261B7CD64()
{
  unint64_t result = qword_26A948A28;
  if (!qword_26A948A28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948A20);
    sub_261B7CE04();
    sub_2619F8AB8(&qword_26A948A50, &qword_26A948A58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948A28);
  }
  return result;
}

unint64_t sub_261B7CE04()
{
  unint64_t result = qword_26A948A30;
  if (!qword_26A948A30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948A38);
    sub_2619F8AB8(&qword_26A946440, &qword_26A946438);
    sub_2619F8AB8(&qword_26A948A40, &qword_26A948A48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948A30);
  }
  return result;
}

uint64_t sub_261B7CEC8()
{
  return sub_261B7D160((uint64_t (*)(unint64_t, uint64_t))sub_261B79BF4);
}

uint64_t objectdestroy_29Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for TrainingLoadChart(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v19 = sub_261B8D538();
  uint64_t v5 = *(void *)(v19 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v17 = v2 | v6 | 7;
  uint64_t v18 = v7 + *(void *)(v5 + 64);
  uint64_t v8 = v0 + v3;
  swift_release();
  swift_release();
  uint64_t v9 = v0 + v3 + v1[7];
  uint64_t v10 = sub_261B8C9E8();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  uint64_t v12 = type metadata accessor for TrainingLoadChart.Configuration(0);
  v11(v9 + *(int *)(v12 + 20), v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v13 = v8 + v1[12];
  swift_release();
  swift_release();
  uint64_t v14 = v13 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A948928) + 32);
  uint64_t v15 = sub_261B8EEC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v7, v19);
  return MEMORY[0x270FA0238](v0, v18, v17);
}

uint64_t sub_261B7D148()
{
  return sub_261B7D160((uint64_t (*)(unint64_t, uint64_t))sub_261B79E08);
}

uint64_t sub_261B7D160(uint64_t (*a1)(unint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for TrainingLoadChart(0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(sub_261B8D538() - 8);
  uint64_t v6 = v1 + ((v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return a1(v1 + v3, v6);
}

unint64_t sub_261B7D240()
{
  unint64_t result = qword_26A948A60;
  if (!qword_26A948A60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9489C8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9489B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948A20);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9489B0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9489A8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A9489A0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A946388);
    sub_261B8D108();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948998);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948990);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A946428);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948988);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948980);
    sub_261B8EEC8();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948978);
    sub_2619F8AB8(&qword_26A948A18, &qword_26A948978);
    swift_getOpaqueTypeConformance2();
    sub_261B7CADC(&qword_26B416C10, MEMORY[0x263F090E8]);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_261AA21E4((unint64_t *)&qword_26A946430, &qword_26A946428);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_261AA21E4(&qword_26A946410, &qword_26A946388);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_261B7CD64();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948A60);
  }
  return result;
}

uint64_t sub_261B7D610(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_261B7D674(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for TrainingLoadChart(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  double v10 = *(double *)(v1 + v6);
  double v11 = *(double *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_261AF6548;
  return sub_261B7A598(v10, v11, a1, v7, v8, v9);
}

uint64_t sub_261B7D7B0()
{
  return sub_261A1FEA8(*(void *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t objectdestroy_40Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for TrainingLoadChart(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  uint64_t v6 = v0 + v3;
  swift_release();
  swift_release();
  uint64_t v7 = v0 + v3 + v1[7];
  uint64_t v8 = sub_261B8C9E8();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  uint64_t v10 = type metadata accessor for TrainingLoadChart.Configuration(0);
  v9(v7 + *(int *)(v10 + 20), v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v11 = v6 + v1[12];
  swift_release();
  swift_release();
  uint64_t v12 = v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A948928) + 32);
  uint64_t v13 = sub_261B8EEC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v5, v4);
}

uint64_t sub_261B7D9D0(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for TrainingLoadChart(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  double v10 = *(double *)(v1 + v6);
  double v11 = *(double *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_261AF5CBC;
  return sub_261B7A598(v10, v11, a1, v7, v8, v9);
}

uint64_t sub_261B7DB10(uint64_t a1)
{
  return sub_261B7C8E8(a1, (uint64_t (*)(uint64_t, uint64_t))sub_261B78488);
}

unint64_t sub_261B7DB28()
{
  unint64_t result = qword_26A948AB8;
  if (!qword_26A948AB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948AB0);
    sub_2619F8AB8(&qword_26A9464C8, &qword_26A9464C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948AB8);
  }
  return result;
}

uint64_t sub_261B7DBDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_261B7DC44()
{
  return sub_261B76C28() & 1;
}

uint64_t sub_261B7DC64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_261B8ADD8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a2, a1, v4);
}

uint64_t sub_261B7DCD4(uint64_t a1)
{
  return sub_261B7C8E8(a1, (uint64_t (*)(uint64_t, uint64_t))sub_261B765A4);
}

uint64_t sub_261B7DCEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t static MusicUtilities.openPlaylist(playlistIdentifier:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9453E0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_261B8ABF8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v18 - v8;
  sub_261B7E060((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    return sub_2619F8754((uint64_t)v2, &qword_26A9453E0);
  }
  double v11 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v11(v9, v2, v3);
  id v19 = objc_msgSend(self, sel_sharedApplication);
  uint64_t v12 = (void *)sub_261B8ABD8();
  sub_261AC52B0(MEMORY[0x263F8EE78]);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_261AB39B8();
  uint64_t v13 = (void *)sub_261B8EFE8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
  unint64_t v14 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v15 = swift_allocObject();
  v11((char *)(v15 + v14), v6, v3);
  aBlock[4] = sub_261B7E48C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_261B7DCEC;
  void aBlock[3] = &block_descriptor_9;
  uint64_t v16 = _Block_copy(aBlock);
  swift_release();
  id v17 = v19;
  objc_msgSend(v19, sel_openURL_options_completionHandler_, v12, v13, v16);
  _Block_release(v16);

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
}

uint64_t sub_261B7E060@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9462F8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_261B8A978();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261B8A958();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_2619F8754((uint64_t)v4, &qword_26A9462F8);
    uint64_t v9 = sub_261B8ABF8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9462E8);
    sub_261B8A8D8();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_261B93F70;
    sub_261B8A8A8();
    sub_261B8A8F8();
    sub_261B8A918();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_261B7E2FC(char a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943F60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_261B92AA0;
  uint64_t v3 = sub_261B8ABB8();
  uint64_t v5 = v4;
  uint64_t v6 = MEMORY[0x263F8D310];
  *(void *)(inited + 56) = MEMORY[0x263F8D310];
  unint64_t v7 = sub_261A2B2E8();
  *(void *)(inited + 32) = v3;
  *(void *)(inited + 40) = v5;
  uint64_t v8 = 1702195828;
  if ((a1 & 1) == 0) {
    uint64_t v8 = 0x65736C6166;
  }
  unint64_t v9 = 0xE500000000000000;
  *(void *)(inited + 96) = v6;
  *(void *)(inited + 104) = v7;
  if (a1) {
    unint64_t v9 = 0xE400000000000000;
  }
  *(void *)(inited + 64) = v7;
  *(void *)(inited + 72) = v8;
  *(void *)(inited + 80) = v9;
  uint64_t v10 = sub_261B8F4D8();
  sub_261A407F4((uint64_t)"Open music playlist url: %@ result: %@", 38, 2, v10, inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A945040);
  return swift_arrayDestroy();
}

uint64_t sub_261B7E3FC()
{
  uint64_t v1 = sub_261B8ABF8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_261B7E48C(char a1)
{
  sub_261B8ABF8();
  return sub_261B7E2FC(a1);
}

ValueMetadata *type metadata accessor for MusicUtilities()
{
  return &type metadata for MusicUtilities;
}

uint64_t sub_261B7E50C(uint64_t a1)
{
  uint64_t v34 = sub_261B8B188();
  uint64_t v2 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v33 = (char *)&v27 - v6;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v28 = a1 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v7;
  uint64_t v31 = v2 + 32;
  uint64_t v32 = v2 + 16;
  int64_t v29 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v30 = v2 + 8;
  uint64_t v35 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v12 = 0;
  uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  if (!v10) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v12 << 6))
  {
    uint64_t v20 = v33;
    uint64_t v19 = v34;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v33, *(void *)(v35 + 48) + *(void *)(v2 + 72) * i, v34);
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v20, v19);
    uint64_t v21 = sub_261B8B148();
    uint64_t v23 = v22;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v19);
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_261A0B1E4(0, v13[2] + 1, 1, v13);
      uint64_t v13 = (void *)result;
    }
    unint64_t v25 = v13[2];
    unint64_t v24 = v13[3];
    if (v25 >= v24 >> 1)
    {
      uint64_t result = (uint64_t)sub_261A0B1E4((void *)(v24 > 1), v25 + 1, 1, v13);
      uint64_t v13 = (void *)result;
    }
    void v13[2] = v25 + 1;
    uint64_t v26 = &v13[2 * v25];
    v26[4] = v21;
    v26[5] = v23;
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v16 >= v29) {
      goto LABEL_27;
    }
    unint64_t v17 = *(void *)(v28 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_27;
      }
      unint64_t v17 = *(void *)(v28 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_27;
        }
        unint64_t v17 = *(void *)(v28 + 8 * v12);
        if (!v17)
        {
          int64_t v12 = v16 + 3;
          if (v16 + 3 >= v29) {
            goto LABEL_27;
          }
          unint64_t v17 = *(void *)(v28 + 8 * v12);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v10 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v29)
  {
LABEL_27:
    swift_release();
    return (uint64_t)v13;
  }
  unint64_t v17 = *(void *)(v28 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v29) {
      goto LABEL_27;
    }
    unint64_t v17 = *(void *)(v28 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

unint64_t sub_261B7E844(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946940);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_261B8B378();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  BOOL v53 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v42 = (char *)&v40 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B50);
  MEMORY[0x270FA5388](v10);
  int64_t v12 = (uint64_t *)((char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v13);
  uint64_t v52 = (char *)&v40 - v14;
  MEMORY[0x270FA5388](v15);
  uint64_t v51 = (uint64_t *)((char *)&v40 - v16);
  uint64_t v17 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v50 = v17;
  uint64_t v40 = a1;
  if (v17)
  {
    uint64_t v18 = 0;
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v19 = v6 + 16;
    uint64_t v20 = v21;
    uint64_t v22 = *(void *)(v19 + 56);
    unint64_t v41 = (*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64);
    uint64_t v23 = a1 + v41;
    uint64_t v55 = (void (**)(char *, char *, uint64_t))(v19 + 16);
    uint64_t v44 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 40);
    uint64_t v45 = v22;
    uint64_t v43 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 32);
    unint64_t v54 = MEMORY[0x263F8EE78];
    uint64_t v48 = v19;
    uint64_t v49 = v4;
    uint64_t v46 = v12;
    uint64_t v47 = v10;
    do
    {
      unint64_t v25 = &v52[*(int *)(v10 + 48)];
      v20(v25, v23, v5);
      uint64_t v26 = v20;
      uint64_t v27 = (uint64_t)v51;
      uint64_t v28 = (char *)v51 + *(int *)(v10 + 48);
      *uint64_t v51 = v18;
      int64_t v29 = *v55;
      uint64_t v30 = v25;
      uint64_t v31 = v46;
      (*v55)(v28, v30, v5);
      sub_261B84F70(v27, (uint64_t)v31);
      if (*v31 > 4)
      {
        uint64_t v34 = 1;
        uint64_t v20 = v26;
        uint64_t v33 = (uint64_t)v49;
      }
      else
      {
        uint64_t v32 = (char *)v31 + *(int *)(v10 + 48);
        uint64_t v33 = (uint64_t)v49;
        v26(v49, (uint64_t)v32, v5);
        uint64_t v34 = 0;
        uint64_t v20 = v26;
      }
      (*v44)(v33, v34, 1, v5);
      sub_2619F8754((uint64_t)v31, &qword_26A948B50);
      if ((*v43)(v33, 1, v5) == 1)
      {
        sub_2619F8754(v33, &qword_26A946940);
        uint64_t v24 = v45;
      }
      else
      {
        uint64_t v35 = v42;
        v29(v42, (char *)v33, v5);
        v29(v53, v35, v5);
        unint64_t v36 = v54;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v36 = sub_261A0B9B0(0, *(void *)(v36 + 16) + 1, 1, v36);
        }
        uint64_t v24 = v45;
        unint64_t v38 = *(void *)(v36 + 16);
        unint64_t v37 = *(void *)(v36 + 24);
        if (v38 >= v37 >> 1) {
          unint64_t v36 = sub_261A0B9B0(v37 > 1, v38 + 1, 1, v36);
        }
        *(void *)(v36 + 16) = v38 + 1;
        unint64_t v54 = v36;
        v29((char *)(v36 + v41 + v38 * v24), v53, v5);
      }
      ++v18;
      v23 += v24;
      uint64_t v10 = v47;
    }
    while (v50 != v18);
  }
  else
  {
    unint64_t v54 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  return v54;
}

uint64_t CatalogStore.catalogClient.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_261A40D48(v1 + OBJC_IVAR___SMCatalogStore_catalogClient, a1);
}

id CatalogStore.__allocating_init(_:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return CatalogStore.init(_:)(a1);
}

id CatalogStore.init(_:)(void *a1)
{
  uint64_t v3 = sub_261B8AF08();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_261B8AFC8();
  uint64_t v7 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A945008);
  sub_261B8B298();
  swift_release();
  v21[1] = *((void *)&v24[0] + 1);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A945028);
  sub_261B8B298();
  swift_release();
  sub_261A4E500(v24, (uint64_t)&v10[OBJC_IVAR___SMCatalogStore_assetClient]);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B10);
  sub_261B8B298();
  swift_release();
  sub_261A4E500(v24, (uint64_t)&v10[OBJC_IVAR___SMCatalogStore_catalogClient]);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F07740], v3);
  sub_261B8AF18();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v10[OBJC_IVAR___SMCatalogStore_calendar], v9, v22);
  uint64_t v11 = sub_261B8CDF8();
  swift_allocObject();
  swift_unknownObjectRetain();
  uint64_t v12 = sub_261B8CDE8();
  uint64_t v13 = MEMORY[0x263F68AA0];
  uint64_t v14 = (uint64_t *)&v10[OBJC_IVAR___SMCatalogStore_contentRestrictionObserver];
  void v14[3] = v11;
  v14[4] = v13;
  *uint64_t v14 = v12;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9456B0);
  sub_261B8B298();
  swift_release();
  sub_261A4E500(v24, (uint64_t)&v10[OBJC_IVAR___SMCatalogStore_mediaTagStringBuilder]);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B18);
  sub_261B8B298();
  swift_release();
  sub_261A4E500(v24, (uint64_t)&v10[OBJC_IVAR___SMCatalogStore_bookmarkClient]);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B20);
  sub_261B8B298();
  swift_release();
  sub_261A4E500(v24, (uint64_t)&v10[OBJC_IVAR___SMCatalogStore_recommendationClient]);

  uint64_t v15 = (objc_class *)type metadata accessor for CatalogStore();
  v23.receiver = v10;
  v23.super_class = v15;
  id v16 = objc_msgSendSuper2(&v23, sel_init);
  uint64_t v17 = self;
  id v18 = v16;
  id v19 = objc_msgSend(v17, sel_defaultCenter);
  if (qword_26A942F28 != -1) {
    swift_once();
  }
  objc_msgSend(v19, sel_addObserver_selector_name_object_, v18, sel_handleCatalogResetSyncNotificationWithNotification_, qword_26A948AF8, 0);
  swift_unknownObjectRelease();

  return v18;
}

uint64_t type metadata accessor for CatalogStore()
{
  uint64_t result = qword_26A948B38;
  if (!qword_26A948B38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_261B7F1D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945068);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v18 - v7;
  __swift_project_boxed_opaque_existential_1(&v1[OBJC_IVAR___SMCatalogStore_catalogClient], *(void *)&v1[OBJC_IVAR___SMCatalogStore_catalogClient + 24]);
  sub_261B8CC88();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v1;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_261B85148;
  *(void *)(v10 + 24) = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_261B82D6C;
  *(void *)(v11 + 24) = v10;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v13 = (v4 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v14 + v12, v5, v2);
  uint64_t v15 = (uint64_t (**)(uint64_t *))(v14 + v13);
  *uint64_t v15 = sub_261B8356C;
  v15[1] = (uint64_t (*)(uint64_t *))v11;
  id v16 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B28);
  sub_261B8B798();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t CatalogStore.filterRestrictedContent(lockups:)()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR___SMCatalogStore_contentRestrictionObserver), *(void *)(v0 + OBJC_IVAR___SMCatalogStore_contentRestrictionObserver + 24));
  uint64_t v1 = sub_261B8CE18();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_261B838C8(v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_261B7F4CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v17[1] = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945078);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v17 - v8;
  sub_261A5436C((uint64_t)&unk_270DA3080);
  __swift_project_boxed_opaque_existential_1(&v1[OBJC_IVAR___SMCatalogStore_bookmarkClient], *(void *)&v1[OBJC_IVAR___SMCatalogStore_bookmarkClient + 24]);
  sub_261B8CCA8();
  swift_bridgeObjectRelease();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v2;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_261B842F4;
  *(void *)(v11 + 24) = v10;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
  unint64_t v12 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v13 + v12, v6, v3);
  uint64_t v14 = (void *)(v13 + ((v5 + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v14 = sub_261B84318;
  v14[1] = v11;
  id v15 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B28);
  sub_261B8B798();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
}

uint64_t sub_261B7F718@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = sub_261B8B7E8();
  uint64_t v5 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v34 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v33 = (char *)v29 - v8;
  int64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    v29[0] = v2;
    v29[1] = a2;
    uint64_t v36 = MEMORY[0x263F8EE78];
    sub_261ACA408(0, v9, 0);
    uint64_t result = sub_261A61A18(a1);
    uint64_t v11 = result;
    uint64_t v13 = v12;
    char v15 = v14 & 1;
    uint64_t v31 = a1;
    uint64_t v32 = a1 + 56;
    v29[3] = v5 + 32;
    v29[4] = v5 + 16;
    v29[2] = v5 + 8;
    uint64_t v30 = v5;
    while ((v11 & 0x8000000000000000) == 0 && v11 < 1 << *(unsigned char *)(a1 + 32))
    {
      if (((*(void *)(v32 + (((unint64_t)v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_15;
      }
      if (*(_DWORD *)(a1 + 36) != v13) {
        goto LABEL_16;
      }
      uint64_t v16 = *(void *)(a1 + 48) + *(void *)(v5 + 72) * v11;
      uint64_t v17 = v33;
      uint64_t v18 = v35;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v33, v16, v35);
      id v19 = v34;
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v34, v17, v18);
      uint64_t v20 = sub_261B8B7D8();
      uint64_t v22 = v21;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v19, v18);
      uint64_t v23 = v36;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_261ACA408(0, *(void *)(v23 + 16) + 1, 1);
        uint64_t v23 = v36;
      }
      unint64_t v25 = *(void *)(v23 + 16);
      unint64_t v24 = *(void *)(v23 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_261ACA408(v24 > 1, v25 + 1, 1);
        uint64_t v23 = v36;
      }
      *(void *)(v23 + 16) = v25 + 1;
      uint64_t v26 = v23 + 16 * v25;
      *(void *)(v26 + 32) = v20;
      *(void *)(v26 + 40) = v22;
      a1 = v31;
      uint64_t result = sub_261A61AC8(v11, v13, v15 & 1, v31);
      uint64_t v11 = result;
      uint64_t v13 = v27;
      char v15 = v28 & 1;
      --v9;
      uint64_t v5 = v30;
      if (!v9)
      {
        sub_261A61ABC(result, v27, v28 & 1);
        uint64_t v2 = v29[0];
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
  }
  else
  {
LABEL_13:
    __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR___SMCatalogStore_catalogClient), *(void *)(v2 + OBJC_IVAR___SMCatalogStore_catalogClient + 24));
    sub_261B8CC88();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_261B7FA20@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  LODWORD(v97) = a1;
  uint64_t v98 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944FE8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v79 - v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v88 = (char *)&v79 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945070);
  uint64_t v91 = *(void *)(v13 - 8);
  uint64_t v92 = v13;
  uint64_t v99 = *(void *)(v91 + 64);
  MEMORY[0x270FA5388](v13);
  long long v90 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  long long v89 = (char *)&v79 - v16;
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945068);
  uint64_t v101 = *(void *)(v95 - 8);
  unint64_t v94 = *(void *)(v101 + 64);
  MEMORY[0x270FA5388](v95);
  uint64_t v93 = (char *)&v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v100 = (char *)&v79 - v19;
  MEMORY[0x270FA5388](v20);
  uint64_t v96 = (char *)&v79 - v21;
  __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR___SMCatalogStore_assetClient], *(void *)&v2[OBJC_IVAR___SMCatalogStore_assetClient + 24]);
  uint64_t v80 = v10;
  sub_261B8CC38();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v3;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = sub_261B84370;
  *(void *)(v23 + 24) = v22;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = sub_261B843A0;
  *(void *)(v24 + 24) = v23;
  long long v87 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v87(v7, v10, v4);
  uint64_t v25 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v26 = (v25 + 16) & ~v25;
  uint64_t v27 = v25 | 7;
  uint64_t v28 = v6 + v26;
  uint64_t v29 = v26;
  uint64_t v84 = v26;
  unint64_t v30 = (v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v85 = v30 + 16;
  uint64_t v86 = v27;
  unint64_t v82 = v30;
  uint64_t v31 = swift_allocObject();
  uint64_t v32 = v31 + v29;
  uint64_t v83 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v33 = v4;
  v83(v32, v7, v4);
  uint64_t v34 = (uint64_t (**)(uint64_t *))(v31 + v30);
  *uint64_t v34 = sub_261B843BC;
  v34[1] = (uint64_t (*)(uint64_t *))v24;
  id v35 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B30);
  uint64_t v36 = v88;
  sub_261B8B798();
  unint64_t v37 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v81 = v5 + 8;
  unint64_t v38 = v80;
  v37(v80, v33);
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = v35;
  uint64_t v40 = swift_allocObject();
  *(void *)(v40 + 16) = sub_261B84428;
  *(void *)(v40 + 24) = v39;
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = sub_261B84454;
  *(void *)(v41 + 24) = v40;
  v87(v38, v36, v33);
  uint64_t v42 = swift_allocObject();
  v83(v42 + v84, v38, v33);
  uint64_t v43 = (uint64_t (**)(uint64_t *))(v42 + v82);
  *uint64_t v43 = sub_261B84470;
  v43[1] = (uint64_t (*)(uint64_t *))v41;
  id v44 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943578);
  uint64_t v45 = v89;
  sub_261B8B798();
  v37(v36, v33);
  uint64_t v46 = swift_allocObject();
  *(void *)(v46 + 16) = v44;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = sub_261B844DC;
  *(void *)(v47 + 24) = v46;
  uint64_t v49 = v90;
  uint64_t v48 = v91;
  uint64_t v50 = v92;
  (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v90, v45, v92);
  unint64_t v51 = (*(unsigned __int8 *)(v48 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
  unint64_t v52 = (v99 + v51 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v53 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v48 + 32))(v53 + v51, v49, v50);
  unint64_t v54 = (void *)(v53 + v52);
  *unint64_t v54 = sub_261B844E4;
  v54[1] = v47;
  id v55 = v44;
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B28);
  uint64_t v56 = v100;
  sub_261B8B798();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v50);
  uint64_t v57 = swift_allocObject();
  *(void *)(v57 + 16) = v55;
  *(unsigned char *)(v57 + 24) = (_BYTE)v97;
  uint64_t v58 = swift_allocObject();
  *(void *)(v58 + 16) = sub_261B84574;
  *(void *)(v58 + 24) = v57;
  uint64_t v59 = v101;
  uint64_t v97 = *(void (**)(char *, char *, uint64_t))(v101 + 16);
  uint64_t v60 = v93;
  uint64_t v61 = v95;
  v97(v93, v56, v95);
  uint64_t v62 = *(unsigned __int8 *)(v59 + 80);
  uint64_t v63 = (v62 + 16) & ~v62;
  uint64_t v92 = v62 | 7;
  unint64_t v64 = (v94 + v63 + 7) & 0xFFFFFFFFFFFFFFF8;
  long long v90 = (char *)v64;
  unint64_t v94 = v64 + 16;
  uint64_t v65 = swift_allocObject();
  uint64_t v91 = *(void *)(v59 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v91)(v65 + v63, v60, v61);
  uint64_t v66 = (uint64_t (**)(uint64_t *))(v65 + v64);
  *uint64_t v66 = sub_261B851E0;
  v66[1] = (uint64_t (*)(uint64_t *))v58;
  id v67 = v55;
  uint64_t v68 = v96;
  sub_261B8B798();
  uint64_t v69 = *(char **)(v59 + 8);
  uint64_t v101 = v59 + 8;
  uint64_t v93 = v69;
  uint64_t v70 = v100;
  ((void (*)(char *, uint64_t))v69)(v100, v61);
  uint64_t v71 = swift_allocObject();
  *(void *)(v71 + 16) = v67;
  uint64_t v72 = swift_allocObject();
  *(void *)(v72 + 16) = sub_261B845B8;
  *(void *)(v72 + 24) = v71;
  uint64_t v73 = swift_allocObject();
  *(void *)(v73 + 16) = sub_261B82D6C;
  *(void *)(v73 + 24) = v72;
  uint64_t v74 = v68;
  v97(v70, v68, v61);
  uint64_t v75 = swift_allocObject();
  ((void (*)(uint64_t, char *, uint64_t))v91)(v75 + v63, v70, v61);
  long long v76 = (uint64_t (**)(uint64_t *))&v90[v75];
  *long long v76 = sub_261B851E0;
  v76[1] = (uint64_t (*)(uint64_t *))v73;
  id v77 = v67;
  sub_261B8B798();
  return ((uint64_t (*)(char *, uint64_t))v93)(v74, v61);
}

uint64_t CatalogStore.filterUserSelected(assetBundles:)()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_261B82DE4(v0);
}

uint64_t CatalogStore.mapWorkoutIdentifiers(assetBundles:)(uint64_t a1)
{
  return sub_261B7E50C(a1);
}

uint64_t sub_261B80390(uint64_t a1, uint64_t a2)
{
  return sub_261B8CC88();
}

uint64_t sub_261B80400@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v40 = a1;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945068);
  uint64_t v3 = *(void *)(v38 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v38);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v29 - v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v39 = (char *)&v29 - v10;
  id v31 = v1;
  __swift_project_boxed_opaque_existential_1(&v1[OBJC_IVAR___SMCatalogStore_catalogClient], *(void *)&v1[OBJC_IVAR___SMCatalogStore_catalogClient + 24]);
  sub_261B8CC88();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v2;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_261B85148;
  *(void *)(v12 + 24) = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_261B82D6C;
  *(void *)(v13 + 24) = v12;
  unint64_t v37 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  uint64_t v14 = v38;
  v37(v5, v8, v38);
  uint64_t v15 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v16 = (v15 + 16) & ~v15;
  unint64_t v35 = ((v4 + v16 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  uint64_t v36 = v15 | 7;
  unint64_t v33 = (v4 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v34 = v16;
  uint64_t v17 = swift_allocObject();
  uint64_t v32 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 32);
  v32(v17 + v16, v5, v14);
  uint64_t v18 = (uint64_t (**)(uint64_t *))(v17 + ((v4 + v16 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v18 = sub_261B851E0;
  v18[1] = (uint64_t (*)(uint64_t *))v13;
  id v19 = v31;
  id v30 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B28);
  uint64_t v20 = v39;
  sub_261B8B798();
  id v31 = *(id *)(v3 + 8);
  ((void (*)(char *, uint64_t))v31)(v8, v14);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v19;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_261B848A4;
  *(void *)(v22 + 24) = v21;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = sub_261B82D6C;
  *(void *)(v23 + 24) = v22;
  uint64_t v24 = v20;
  v37(v8, v20, v14);
  uint64_t v25 = swift_allocObject();
  v32(v25 + v34, v8, v14);
  uint64_t v26 = (uint64_t (**)(uint64_t *))(v25 + v33);
  *uint64_t v26 = sub_261B851E0;
  v26[1] = (uint64_t (*)(uint64_t *))v23;
  id v27 = v30;
  sub_261B8B798();
  return ((uint64_t (*)(char *, uint64_t))v31)(v24, v14);
}

uint64_t sub_261B80800(uint64_t a1, uint64_t a2)
{
  __swift_project_boxed_opaque_existential_1((void *)(a2 + OBJC_IVAR___SMCatalogStore_contentRestrictionObserver), *(void *)(a2 + OBJC_IVAR___SMCatalogStore_contentRestrictionObserver + 24));
  uint64_t v2 = sub_261B8CE18();
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_261B838C8(v3, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_261B80888()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  unint64_t v1 = sub_261B7E844(v0);
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t CatalogStore.reduceLockupsFeaturedWorkouts(lockups:)()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  unint64_t v1 = sub_261B7E844(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_261B80920()
{
  unint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945070);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_261B8F4D8();
  sub_261A407F4((uint64_t)"[Catalog Store] Calling queryFeaturedCatalogLockups", 51, 2, v9, MEMORY[0x263F8EE78]);
  __swift_project_boxed_opaque_existential_1(&v0[OBJC_IVAR___SMCatalogStore_recommendationClient], *(void *)&v0[OBJC_IVAR___SMCatalogStore_recommendationClient + 24]);
  sub_261B8CC08();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v1;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v12 = (v4 + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v13 + v11, v5, v2);
  uint64_t v14 = (uint64_t (**)(uint64_t *))(v13 + v12);
  *uint64_t v14 = sub_261B84924;
  v14[1] = (uint64_t (*)(uint64_t *))v10;
  id v15 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B28);
  sub_261B8B798();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_261B80B44(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945068);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v20 - v9;
  uint64_t v11 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943F60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_261B93F70;
  *(void *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943578);
  *(void *)(inited + 64) = sub_261B84DF0();
  *(void *)(inited + 32) = v11;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_261B8F4D8();
  sub_261A407F4((uint64_t)"[Catalog Store] Calling queryFeaturedCachedCatalogWorkoutLockups, identifiers=%@", 80, 2, v13, inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A945040);
  swift_arrayDestroy();
  __swift_project_boxed_opaque_existential_1((void *)(a2 + OBJC_IVAR___SMCatalogStore_catalogClient), *(void *)(a2 + OBJC_IVAR___SMCatalogStore_catalogClient + 24));
  sub_261B8CC88();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v11;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_261B84E84;
  *(void *)(v15 + 24) = v14;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
  unint64_t v16 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v17 + v16, v7, v4);
  uint64_t v18 = (uint64_t (**)(uint64_t *))(v17 + ((v6 + v16 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v18 = sub_261B851E0;
  v18[1] = (uint64_t (*)(uint64_t *))v15;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B28);
  sub_261B8B798();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

uint64_t sub_261B80E24@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_261B83B18(a2, v5);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v6;
  return result;
}

uint64_t sub_261B80E80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v61 = a2;
  uint64_t v62 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945070);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v57 - v9;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945068);
  uint64_t v11 = *(void *)(v60 - 8);
  uint64_t v58 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v60);
  uint64_t v57 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v68 = (char *)&v57 - v14;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944F90);
  uint64_t v63 = *(void *)(v66 - 8);
  uint64_t v65 = *(void *)(v63 + 64);
  MEMORY[0x270FA5388](v66);
  unint64_t v64 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v59 = (char *)&v57 - v17;
  MEMORY[0x270FA5388](v18);
  id v67 = (char *)&v57 - v19;
  uint64_t v20 = sub_261B8F4D8();
  uint64_t v21 = MEMORY[0x263F8EE78];
  sub_261A407F4((uint64_t)"[Catalog Store] Calling queryFeaturedCatalogLockups", 51, 2, v20, MEMORY[0x263F8EE78]);
  uint64_t v22 = sub_261B8F4D8();
  sub_261A407F4((uint64_t)"[Catalog Store] Calling queryFeaturedCatalogLockups", 51, 2, v22, v21);
  __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR___SMCatalogStore_recommendationClient], *(void *)&v2[OBJC_IVAR___SMCatalogStore_recommendationClient + 24]);
  sub_261B8CC08();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v3;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
  unint64_t v24 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v25 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v25 + v24, v7, v4);
  uint64_t v26 = (uint64_t (**)(uint64_t *))(v25 + ((v6 + v24 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v26 = sub_261B85144;
  v26[1] = (uint64_t (*)(uint64_t *))v23;
  id v27 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B28);
  uint64_t v28 = v68;
  sub_261B8B798();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  uint64_t v29 = (void *)swift_allocObject();
  uint64_t v31 = v61;
  uint64_t v30 = v62;
  v29[2] = v62;
  v29[3] = v31;
  v29[4] = v27;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = sub_261B84984;
  *(void *)(v32 + 24) = v29;
  unint64_t v33 = v57;
  uint64_t v34 = v60;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v57, v28, v60);
  unint64_t v35 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v36 = (v58 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v37 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v37 + v35, v33, v34);
  uint64_t v38 = (uint64_t (**)(uint64_t *))(v37 + v36);
  *uint64_t v38 = sub_261B849A4;
  v38[1] = (uint64_t (*)(uint64_t *))v32;
  id v39 = v27;
  swift_retain();
  uint64_t v40 = v59;
  sub_261B8B798();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v68, v34);
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v30;
  *(void *)(v41 + 24) = v31;
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = sub_261B849D8;
  *(void *)(v42 + 24) = v41;
  uint64_t v43 = v63;
  id v44 = v64;
  uint64_t v45 = v40;
  uint64_t v46 = v66;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v64, v40, v66);
  uint64_t v47 = v43;
  unint64_t v48 = (*(unsigned __int8 *)(v43 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
  unint64_t v49 = (v65 + v48 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v50 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v47 + 32))(v50 + v48, v44, v46);
  unint64_t v51 = (uint64_t (**)(void *))(v50 + v49);
  *unint64_t v51 = sub_261A88F7C;
  v51[1] = (uint64_t (*)(void *))v42;
  swift_retain();
  unint64_t v52 = v67;
  sub_261B8B798();
  uint64_t v53 = *(void (**)(char *, uint64_t))(v47 + 8);
  v53(v45, v46);
  unint64_t v54 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_261B8B7A8();
  uint64_t v55 = swift_allocObject();
  *(void *)(v55 + 16) = 0;
  *(void *)(v55 + 24) = 0;
  v54(sub_261A53C98, v55);
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v53)(v52, v46);
}

uint64_t sub_261B81534(uint64_t *a1, void (*a2)(uint64_t, void), uint64_t a3, void *a4)
{
  uint64_t v6 = sub_261B3030C(*a1);
  id v7 = a4;
  uint64_t v8 = sub_261B83F80(v6, (uint64_t)v7);
  swift_bridgeObjectRelease();

  a2(v8, 0);
  return swift_bridgeObjectRelease();
}

uint64_t CatalogStore.bridgeCatalogLockups(_:)(uint64_t a1)
{
  id v3 = v1;
  uint64_t v4 = sub_261B83F80(a1, (uint64_t)v3);

  return v4;
}

uint64_t sub_261B8161C(uint64_t a1, uint64_t (*a2)(void, uint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943F60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_261B93F70;
  swift_getErrorValue();
  uint64_t v5 = MEMORY[0x263E4DB10]();
  uint64_t v7 = v6;
  *(void *)(inited + 56) = MEMORY[0x263F8D310];
  *(void *)(inited + 64) = sub_261A2B2E8();
  *(void *)(inited + 32) = v5;
  *(void *)(inited + 40) = v7;
  uint64_t v8 = sub_261B8F4D8();
  sub_261A407F4((uint64_t)"[Catalog Store] Error in calling queryFeaturedCatalogLockups error=%@", 69, 2, v8, inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A945040);
  swift_arrayDestroy();
  return a2(MEMORY[0x263F8EE78], a1);
}

void sub_261B817BC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if (a1)
  {
    type metadata accessor for CatalogLockupBridge();
    uint64_t v5 = (void *)sub_261B8F2C8();
  }
  if (a2) {
    uint64_t v6 = sub_261B8AAC8();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);
}

uint64_t sub_261B81858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945050);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945058);
  uint64_t v26 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(v4 + OBJC_IVAR___SMCatalogStore_catalogClient), *(void *)(v4 + OBJC_IVAR___SMCatalogStore_catalogClient + 24));
  sub_261B8CC78();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_261B81BBC;
  *(void *)(v14 + 24) = 0;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
  unint64_t v15 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v16 + v15, v8, v5);
  uint64_t v17 = (uint64_t (**)(uint64_t))(v16 + ((v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v17 = sub_261B84A24;
  v17[1] = (uint64_t (*)(uint64_t))v14;
  type metadata accessor for CatalogWorkoutDetailBridge();
  sub_261B8B798();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v24;
  *(void *)(v18 + 24) = v25;
  swift_retain();
  uint64_t v19 = v23;
  uint64_t v20 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_261B8B7A8();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_261A54ED0;
  *(void *)(v21 + 24) = v18;
  swift_retain();
  v20(sub_261A50914, v21);
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v13, v19);
}

uint64_t sub_261B81BBC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_261B8B668();
  uint64_t v5 = *(void *)(v4 - 8);
  double v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t, double))(v5 + 16);
  v9(v8, a1, v4, v6);
  uint64_t v10 = (objc_class *)type metadata accessor for CatalogWorkoutDetailBridge();
  uint64_t v11 = (char *)objc_allocWithZone(v10);
  ((void (*)(char *, char *, uint64_t))v9)(&v11[OBJC_IVAR___SMCatalogWorkoutDetail_workoutDetail], v8, v4);
  v14.receiver = v11;
  v14.super_class = v10;
  id v12 = objc_msgSendSuper2(&v14, sel_init);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  *a2 = v12;
  return result;
}

uint64_t sub_261B81DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944F90);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261B82368((uint64_t)v7);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_retain();
  uint64_t v9 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_261B8B7A8();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_261B84A5C;
  *(void *)(v10 + 24) = v8;
  swift_retain();
  v9(sub_261A549EC, v10);
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_261B81F4C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    unint64_t v1 = *(void **)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A943F60);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_261B93F70;
    swift_getErrorValue();
    sub_261B84CE4(v1, 1);
    uint64_t v3 = sub_261B8FC08();
    uint64_t v5 = v4;
    *(void *)(inited + 56) = MEMORY[0x263F8D310];
    *(void *)(inited + 64) = sub_261A2B2E8();
    *(void *)(inited + 32) = v3;
    *(void *)(inited + 40) = v5;
    uint64_t v6 = sub_261B8F4B8();
    sub_261A407F4((uint64_t)"handleCatalogResetSyncNotification failed with error=%@", 55, 2, v6, inited);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A945040);
    swift_arrayDestroy();
    sub_261A53EF8(v1, 1);
  }
  else
  {
    uint64_t v7 = sub_261B8F4D8();
    uint64_t v8 = MEMORY[0x263F8EE78];
    sub_261A407F4((uint64_t)"handleCatalogResetSyncNotification succeeded", 44, 2, v7, v8);
  }
}

void sub_261B820A8(uint64_t a1, void (*a2)(id))
{
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    id v3 = *(id *)a1;
    id v4 = *(id *)a1;
    a2(v3);
    sub_261A53EF8(v3, 1);
  }
  else
  {
    a2(0);
  }
}

void sub_261B82304(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_261B8AAC8();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_261B82368@<X0>(uint64_t a1@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944F90);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v25 - v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v31 = (char *)&v25 - v9;
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR___SMCatalogStore_catalogClient), *(void *)(v1 + OBJC_IVAR___SMCatalogStore_catalogClient + 24));
  sub_261B8CC68();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_261B82690;
  *(void *)(v10 + 24) = 0;
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  uint64_t v11 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30(v11, v7, v2);
  uint64_t v12 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v13 = (v12 + 16) & ~v12;
  uint64_t v27 = v13;
  unint64_t v14 = (v4 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = v14 + 16;
  uint64_t v29 = v12 | 7;
  uint64_t v15 = swift_allocObject();
  uint64_t v26 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 32);
  v26(v15 + v13, v11, v2);
  uint64_t v16 = (uint64_t (**)(uint64_t))(v15 + v14);
  *uint64_t v16 = sub_261B84D3C;
  v16[1] = (uint64_t (*)(uint64_t))v10;
  uint64_t v25 = MEMORY[0x263F8EE60] + 8;
  uint64_t v17 = v31;
  sub_261B8B798();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v19 = v2;
  v18(v7, v2);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = sub_261B826D8;
  *(void *)(v20 + 24) = 0;
  uint64_t v21 = v17;
  v30(v7, v17, v19);
  uint64_t v22 = swift_allocObject();
  v26(v22 + v27, v7, v19);
  uint64_t v23 = (uint64_t (**)(void *))(v22 + v14);
  *uint64_t v23 = sub_261B851E4;
  v23[1] = (uint64_t (*)(void *))v20;
  sub_261B8B798();
  return ((uint64_t (*)(char *, uint64_t))v18)(v21, v19);
}

uint64_t sub_261B82690()
{
  uint64_t v0 = sub_261B8F4D8();
  return sub_261A407F4((uint64_t)"Catalog Reset Sync complete", 27, 2, v0, MEMORY[0x263F8EE78]);
}

uint64_t sub_261B826D8()
{
  uint64_t v0 = sub_261B8F4D8();
  sub_261A407F4((uint64_t)"Failed to complete reset sync with error", 40, 2, v0, MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943F60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_261B93F70;
  swift_getErrorValue();
  uint64_t v2 = sub_261B8FC08();
  uint64_t v4 = v3;
  *(void *)(inited + 56) = MEMORY[0x263F8D310];
  *(void *)(inited + 64) = sub_261A2B2E8();
  *(void *)(inited + 32) = v2;
  *(void *)(inited + 40) = v4;
  uint64_t v5 = sub_261B8F4B8();
  sub_261A407F4((uint64_t)"%@", 2, 2, v5, inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A945040);
  return swift_arrayDestroy();
}

id CatalogStore.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void CatalogStore.init()()
{
}

id CatalogStore.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CatalogStore();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id CatalogStore.bridgeCatalogLockup(_:)(uint64_t a1)
{
  uint64_t v3 = sub_261B8B378();
  uint64_t v4 = *(void *)(v3 - 8);
  double v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t, double))(v4 + 16);
  v8(v7, a1, v3, v5);
  sub_261A40D48(v1 + OBJC_IVAR___SMCatalogStore_mediaTagStringBuilder, (uint64_t)v15);
  uint64_t v9 = (objc_class *)type metadata accessor for CatalogLockupBridge();
  uint64_t v10 = (char *)objc_allocWithZone(v9);
  ((void (*)(char *, char *, uint64_t))v8)(&v10[OBJC_IVAR___SMCatalogLockup_catalogLockup], v7, v3);
  sub_261A40D48((uint64_t)v15, (uint64_t)&v10[OBJC_IVAR___SMCatalogLockup_mediaTagStringBuilder]);
  v14.receiver = v10;
  v14.super_class = v9;
  id v11 = objc_msgSendSuper2(&v14, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return v11;
}

uint64_t sub_261B82CFC()
{
  uint64_t result = sub_261B8F0B8();
  qword_26A948AF8 = result;
  return result;
}

uint64_t sub_261B82D34()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_261B82D6C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_261B848AC(a1, a2);
}

id static NSNotificationName.SeymourCatalogReset.getter()
{
  if (qword_26A942F28 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26A948AF8;
  return v0;
}

uint64_t sub_261B82DE4(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  v11[1] = *MEMORY[0x263EF8340];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v11 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    sub_261B82F48((void *)((char *)v11 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, v2);
    uint64_t v7 = v6;
    swift_release();
    if (v1) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v5);
    sub_261B82F48((unint64_t *)v8, v4, v2);
    uint64_t v7 = v9;
    swift_release();
    MEMORY[0x263E4E970](v8, -1, -1);
  }
  return v7;
}

void sub_261B82F48(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = a2;
  uint64_t v24 = a1;
  uint64_t v4 = sub_261B8B188();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v8 = 0;
  uint64_t v28 = a3;
  uint64_t v9 = *(void *)(a3 + 56);
  uint64_t v25 = 0;
  uint64_t v26 = a3 + 56;
  uint64_t v10 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & v9;
  int64_t v27 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v13 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v14 = v13 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v27) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v26 + 8 * v17);
    ++v8;
    if (!v18)
    {
      int64_t v8 = v17 + 1;
      if (v17 + 1 >= v27) {
        goto LABEL_24;
      }
      unint64_t v18 = *(void *)(v26 + 8 * v8);
      if (!v18)
      {
        int64_t v8 = v17 + 2;
        if (v17 + 2 >= v27) {
          goto LABEL_24;
        }
        unint64_t v18 = *(void *)(v26 + 8 * v8);
        if (!v18) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v14 = __clz(__rbit64(v18)) + (v8 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v28 + 48) + *(void *)(v5 + 72) * v14, v4);
    uint64_t v29 = sub_261B8B178();
    char v30 = v15 & 1;
    char v31 = 1;
    sub_261B84FD8();
    sub_261B8502C();
    char v16 = sub_261B8B2B8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (v16)
    {
      *(unint64_t *)((char *)v24 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      if (__OFADD__(v25++, 1))
      {
        __break(1u);
LABEL_24:
        uint64_t v21 = v28;
        swift_retain();
        sub_261B83210(v24, v23, v25, v21);
        return;
      }
    }
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v27) {
    goto LABEL_24;
  }
  unint64_t v18 = *(void *)(v26 + 8 * v19);
  if (v18)
  {
    int64_t v8 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v8 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v8 >= v27) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v26 + 8 * v8);
    ++v19;
    if (v18) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
}

uint64_t sub_261B83210(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = a1;
  uint64_t v7 = sub_261B8B188();
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B68);
  uint64_t result = sub_261B8F898();
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
  unint64_t v35 = (uint64_t (**)(unint64_t, char *, uint64_t))(v37 + 32);
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
    sub_261B85080();
    uint64_t result = sub_261B8F018();
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

uint64_t sub_261B8356C(uint64_t *a1)
{
  return sub_261B83668(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_270DAC3D0, &qword_26A948B28);
}

uint64_t sub_261B835AC()
{
  return objectdestroy_7Tm(&qword_26A945068);
}

uint64_t sub_261B835B8(uint64_t a1, uint64_t a2)
{
  return sub_261B84EAC(a1, a2, &qword_26A945068, sub_261A528D0);
}

void sub_261B835D8(void (*a1)(void **), uint64_t a2, void (*a3)(void **__return_ptr, uint64_t *), uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = *a5;
  a3(&v8, &v7);
  uint64_t v6 = v8;
  char v9 = 0;
  a1(&v8);
  sub_261A5406C(v6, 0);
}

uint64_t sub_261B83668(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = *a1;
  char v9 = (void *)swift_allocObject();
  void v9[2] = a2;
  v9[3] = a3;
  v9[4] = v8;
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  return sub_261B8B798();
}

uint64_t sub_261B83708(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_261B8B798();
}

uint64_t sub_261B837AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  swift_retain();
  return sub_261B8B798();
}

void sub_261B83838(void (*a1)(void **), uint64_t a2, void (*a3)(void **__return_ptr))
{
  a3(&v5);
  uint64_t v4 = v5;
  char v6 = 0;
  a1(&v5);
  sub_261A53EF8(v4, 0);
}

uint64_t sub_261B838C8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_261B8B378();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v33 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9.n128_f64[0] = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v27 - v10;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v35 = MEMORY[0x263F8EE78];
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13)
  {
    unint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v6 + 16);
    uint64_t v14 = v6 + 16;
    unint64_t v15 = v16;
    unint64_t v17 = (*(unsigned __int8 *)(v14 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 64);
    uint64_t v34 = *(void *)(v14 + 56);
    uint64_t v27 = v2;
    unint64_t v28 = v17;
    uint64_t v18 = a1 + v17;
    uint64_t v31 = a2;
    uint64_t v32 = (void (**)(char *, char *, uint64_t))(v14 + 16);
    BOOL v29 = v16;
    uint64_t v30 = v14;
    v16(v11, a1 + v17, v5, v9);
    while (1)
    {
      uint64_t v20 = sub_261B8B308();
      if ((v22 & 1) == 0) {
        break;
      }
      if ((sub_261B236F0(v20, a2) & 1) == 0) {
        goto LABEL_4;
      }
      uint64_t v23 = *v32;
      (*v32)(v33, v11, v5);
      uint64_t v24 = v35;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_261ACA484(0, *(void *)(v24 + 16) + 1, 1);
        uint64_t v24 = v35;
      }
      unint64_t v26 = *(void *)(v24 + 16);
      unint64_t v25 = *(void *)(v24 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_261ACA484(v25 > 1, v26 + 1, 1);
        uint64_t v24 = v35;
      }
      *(void *)(v24 + 16) = v26 + 1;
      v23((char *)(v24 + v28 + v26 * v34), v33, v5);
      uint64_t v35 = v24;
      a2 = v31;
      unint64_t v15 = v29;
LABEL_5:
      v18 += v34;
      if (!--v13) {
        return v35;
      }
      v15(v11, v18, v5, v19);
    }
    sub_261A49E4C(v20, v21, 0);
LABEL_4:
    (*(void (**)(char *, uint64_t))(v14 - 8))(v11, v5);
    goto LABEL_5;
  }
  return result;
}

unint64_t sub_261B83B18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946940);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_261B8B378();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v47 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unint64_t v12 = (char *)v36 - v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v37 = (char *)v36 - v14;
  uint64_t v46 = *(void *)(a1 + 16);
  if (!v46) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v45 = a1 + 32;
  uint64_t v15 = *(void *)(a2 + 16);
  uint64_t v50 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v51 = v8 + 16;
  unint64_t v16 = (void (**)(char *, char *, uint64_t))(v8 + 32);
  uint64_t v42 = (unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  uint64_t v43 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v36[1] = a1;
  swift_bridgeObjectRetain();
  uint64_t v17 = 0;
  unint64_t v18 = MEMORY[0x263F8EE78];
  uint64_t v52 = v7;
  uint64_t v44 = v15;
  uint64_t v40 = v6;
  uint64_t v41 = a2;
  uint64_t v38 = (void (**)(char *, char *, uint64_t))(v8 + 32);
  uint64_t v39 = v8;
  do
  {
    uint64_t v49 = v17;
    __n128 v19 = (uint64_t *)(v45 + 16 * v17);
    uint64_t v20 = v19[1];
    if (v15)
    {
      unint64_t v48 = v18;
      uint64_t v21 = *v19;
      uint64_t v22 = a2 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
      uint64_t v23 = v8;
      uint64_t v24 = *(void *)(v8 + 72);
      unint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v26 = v15;
      while (1)
      {
        v25(v12, v22, v7);
        if (sub_261B8B2D8() == v21 && v27 == v20)
        {
          a2 = v41;
          swift_bridgeObjectRelease();
          goto LABEL_15;
        }
        char v28 = sub_261B8FBA8();
        swift_bridgeObjectRelease();
        if (v28) {
          break;
        }
        uint64_t v7 = v52;
        (*v50)(v12, v52);
        v22 += v24;
        if (!--v26)
        {
          a2 = v41;
          swift_bridgeObjectRelease();
          uint64_t v29 = 1;
          uint64_t v8 = v39;
          uint64_t v6 = v40;
          unint64_t v16 = v38;
          unint64_t v18 = v48;
          goto LABEL_16;
        }
      }
      a2 = v41;
LABEL_15:
      uint64_t v8 = v39;
      uint64_t v6 = v40;
      uint64_t v7 = v52;
      unint64_t v16 = v38;
      unint64_t v18 = v48;
      swift_bridgeObjectRelease();
      (*v16)(v6, v12, v7);
      uint64_t v29 = 0;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v29 = 1;
    }
LABEL_16:
    (*v43)(v6, v29, 1, v7);
    swift_bridgeObjectRelease();
    if ((*v42)(v6, 1, v7) == 1)
    {
      sub_2619F8754((uint64_t)v6, &qword_26A946940);
    }
    else
    {
      uint64_t v30 = *v16;
      uint64_t v31 = v37;
      (*v16)(v37, v6, v7);
      v30(v47, v31, v7);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v18 = sub_261A0B9B0(0, *(void *)(v18 + 16) + 1, 1, v18);
      }
      unint64_t v33 = *(void *)(v18 + 16);
      unint64_t v32 = *(void *)(v18 + 24);
      if (v33 >= v32 >> 1) {
        unint64_t v18 = sub_261A0B9B0(v32 > 1, v33 + 1, 1, v18);
      }
      *(void *)(v18 + 16) = v33 + 1;
      unint64_t v34 = v18
          + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
          + *(void *)(v8 + 72) * v33;
      uint64_t v7 = v52;
      v30((char *)v34, v47, v52);
    }
    uint64_t v17 = v49 + 1;
    uint64_t v15 = v44;
  }
  while (v49 + 1 != v46);
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_261B83F80(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946940);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_261B8B378();
  MEMORY[0x270FA5388](v9);
  uint64_t v35 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v34 = (char *)v26 - v13;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v38 = MEMORY[0x263F8EE78];
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15)
  {
    v26[0] = a1;
    v26[1] = v2;
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v33 = a2 + OBJC_IVAR___SMCatalogStore_mediaTagStringBuilder;
    uint64_t v17 = (unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    uint64_t v30 = (void (**)(char *, char *, uint64_t))(v12 + 16);
    uint64_t v31 = (void (**)(char *, char *, uint64_t))(v12 + 32);
    char v28 = (uint64_t (**)(char *, uint64_t))(v12 + 8);
    uint64_t v18 = *(void *)(v6 + 72);
    swift_bridgeObjectRetain();
    unint64_t v32 = v17;
    uint64_t v29 = v8;
    uint64_t v27 = v18;
    __n128 v19 = v34;
    uint64_t v20 = v35;
    do
    {
      sub_261B84D84(v16, (uint64_t)v8);
      if ((*v17)(v8, 1, v9) == 1)
      {
        sub_2619F8754((uint64_t)v8, &qword_26A946940);
      }
      else
      {
        (*v31)(v19, v8, v9);
        uint64_t v21 = *v30;
        (*v30)(v20, v19, v9);
        sub_261A40D48(v33, (uint64_t)v37);
        uint64_t v22 = (objc_class *)type metadata accessor for CatalogLockupBridge();
        uint64_t v23 = (char *)objc_allocWithZone(v22);
        v21(&v23[OBJC_IVAR___SMCatalogLockup_catalogLockup], v20, v9);
        sub_261A40D48((uint64_t)v37, (uint64_t)&v23[OBJC_IVAR___SMCatalogLockup_mediaTagStringBuilder]);
        v36.receiver = v23;
        v36.super_class = v22;
        objc_msgSendSuper2(&v36, sel_init);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
        uint64_t v24 = *v28;
        (*v28)(v20, v9);
        uint64_t v25 = v24(v19, v9);
        MEMORY[0x263E4D180](v25);
        if (*(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_261B8F2F8();
        }
        sub_261B8F318();
        sub_261B8F2E8();
        uint64_t v17 = v32;
        uint64_t v8 = v29;
        uint64_t v18 = v27;
      }
      v16 += v18;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
    return v38;
  }
  return result;
}

uint64_t sub_261B842F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_261B7F718(a1, a2);
}

uint64_t sub_261B84318(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_261B84344()
{
  return objectdestroy_7Tm(&qword_26A945078);
}

uint64_t sub_261B84350(uint64_t a1, uint64_t a2)
{
  return sub_261B84EAC(a1, a2, &qword_26A945078, sub_261A528F8);
}

uint64_t sub_261B84370()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_261B82DE4(v0);
}

uint64_t sub_261B843A0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_261B848AC(a1, a2);
}

uint64_t sub_261B843BC(uint64_t *a1)
{
  return sub_261B83668(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_270DAC3A8, &qword_26A948B30);
}

uint64_t sub_261B843FC()
{
  return objectdestroy_7Tm(&qword_26A944FE8);
}

uint64_t sub_261B84408(uint64_t a1, uint64_t a2)
{
  return sub_261B84EAC(a1, a2, &qword_26A944FE8, sub_261A52970);
}

uint64_t sub_261B84428(uint64_t a1)
{
  return sub_261B7E50C(a1);
}

uint64_t sub_261B84454@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_261B848AC(a1, a2);
}

uint64_t sub_261B84470(uint64_t *a1)
{
  return sub_261B83668(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_270DAC380, &qword_26A943578);
}

uint64_t sub_261B844B0()
{
  return objectdestroy_7Tm(&qword_26A944FE8);
}

uint64_t sub_261B844BC(uint64_t a1, uint64_t a2)
{
  return sub_261B84EAC(a1, a2, &qword_26A944FE8, sub_261A52948);
}

uint64_t sub_261B844DC(uint64_t a1)
{
  return sub_261B80390(a1, *(void *)(v1 + 16));
}

uint64_t sub_261B844E4(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_261B84510()
{
  return objectdestroy_7Tm(&qword_26A945070);
}

uint64_t sub_261B8451C(uint64_t a1, uint64_t a2)
{
  return sub_261B84EAC(a1, a2, &qword_26A945070, sub_261A52920);
}

uint64_t sub_261B8453C()
{
  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t sub_261B84574@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = _s9WorkoutUI12CatalogStoreC17filterByMediaType7lockups05mediaH0Say11SeymourCore0C6LockupVGAJ_AG0cgH0OtF_0(*a1, *(unsigned __int8 *)(v2 + 24));
  *a2 = result;
  return result;
}

uint64_t sub_261B845AC()
{
  return objectdestroy_7Tm(&qword_26A945068);
}

uint64_t sub_261B845B8(uint64_t a1)
{
  return sub_261B80800(a1, *(void *)(v1 + 16));
}

uint64_t sub_261B845D4()
{
  return objectdestroy_7Tm(&qword_26A945068);
}

uint64_t _s9WorkoutUI12CatalogStoreC17filterByMediaType7lockups05mediaH0Say11SeymourCore0C6LockupVGAJ_AG0cgH0OtF_0(uint64_t a1, int a2)
{
  int v33 = a2;
  uint64_t v3 = sub_261B8B378();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v35 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v37 = MEMORY[0x263F8EE78];
  uint64_t v10 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v10)
  {
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    uint64_t v11 = v4 + 16;
    objc_super v36 = v12;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v30 = a1;
    uint64_t v31 = (v13 + 32) & ~v13;
    uint64_t v15 = a1 + v31;
    unint64_t v34 = (void (**)(char *, char *, uint64_t))(v11 + 16);
    uint64_t v16 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v32 = v11;
    v12(v8, v15, v3);
    while (1)
    {
      uint64_t v17 = sub_261B8B368();
      if (v19 == 0xFF) {
        goto LABEL_4;
      }
      if ((v19 & 1) == 0) {
        break;
      }
      uint64_t v20 = sub_261B8B4D8();
      uint64_t v22 = v21;
      if (v20 == sub_261B8B4D8() && v22 == v23)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v24 = sub_261B8FBA8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v24 & 1) == 0) {
          goto LABEL_4;
        }
      }
      uint64_t v25 = *v34;
      (*v34)(v35, v8, v3);
      uint64_t v26 = v37;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_261ACA484(0, *(void *)(v26 + 16) + 1, 1);
        uint64_t v26 = v37;
      }
      unint64_t v28 = *(void *)(v26 + 16);
      unint64_t v27 = *(void *)(v26 + 24);
      if (v28 >= v27 >> 1)
      {
        sub_261ACA484(v27 > 1, v28 + 1, 1);
        uint64_t v26 = v37;
      }
      *(void *)(v26 + 16) = v28 + 1;
      v25((char *)(v26 + v31 + v28 * v14), v35, v3);
      uint64_t v37 = v26;
LABEL_5:
      v15 += v14;
      if (!--v10)
      {
        uint64_t v9 = v37;
        goto LABEL_19;
      }
      v36(v8, v15, v3);
    }
    sub_261A8C0AC(v17, v18, v19);
LABEL_4:
    (*v16)(v8, v3);
    goto LABEL_5;
  }
LABEL_19:
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_261B84898()
{
  return objectdestroy_7Tm(&qword_26A945068);
}

unint64_t sub_261B848A4()
{
  return sub_261B80888();
}

uint64_t sub_261B848AC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 16))(*a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_261B848E0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_261B84918()
{
  return objectdestroy_7Tm(&qword_26A945068);
}

uint64_t sub_261B84924(uint64_t *a1)
{
  return sub_261B80B44(a1, *(void *)(v1 + 16));
}

uint64_t sub_261B8492C()
{
  return objectdestroy_7Tm(&qword_26A945070);
}

uint64_t sub_261B84938()
{
  return objectdestroy_7Tm(&qword_26A945070);
}

uint64_t sub_261B84944()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_261B84984(uint64_t *a1)
{
  return sub_261B81534(a1, *(void (**)(uint64_t, void))(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_261B849A4(uint64_t *a1)
{
  return sub_261B83708(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_261B849AC()
{
  return objectdestroy_7Tm(&qword_26A945068);
}

uint64_t sub_261B849B8(uint64_t a1, uint64_t a2)
{
  return sub_261B84EAC(a1, a2, &qword_26A945068, sub_261A52998);
}

uint64_t sub_261B849D8(uint64_t a1)
{
  return sub_261B8161C(a1, *(uint64_t (**)(void, uint64_t))(v1 + 16));
}

uint64_t sub_261B849F4()
{
  return objectdestroy_7Tm(&qword_26A944F90);
}

uint64_t sub_261B84A00(uint64_t a1, uint64_t a2)
{
  return sub_261B84EAC(a1, a2, &qword_26A944F90, sub_261A890AC);
}

uint64_t sub_261B84A24(uint64_t a1)
{
  return sub_261A88AAC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_261B84A2C()
{
  return objectdestroy_7Tm(&qword_26A945050);
}

uint64_t sub_261B84A38(uint64_t a1, uint64_t a2)
{
  return sub_261B84EAC(a1, a2, &qword_26A945050, sub_261A529C0);
}

void sub_261B84A5C(uint64_t a1)
{
  sub_261B820A8(a1, *(void (**)(id))(v1 + 16));
}

uint64_t sub_261B84A68()
{
  return type metadata accessor for CatalogStore();
}

uint64_t sub_261B84A70()
{
  uint64_t result = sub_261B8AFC8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for CatalogStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CatalogStore);
}

uint64_t dispatch thunk of CatalogStore.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of CatalogStore.queryAllCatalogLockups(mediaType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CatalogStore.queryBookmarks()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CatalogStore.queryUserDownloadedCatalogLockups(mediaType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CatalogStore.queryWeeklyFeaturedCatalogLockups(displayStyle:mediaType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CatalogStore.queryFeaturedCatalogLockups()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CatalogStore.queryFeaturedCatalogLockups(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CatalogStore.queryCatalogWorkoutDetail(_:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of CatalogStore.catalogResetSync(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

id sub_261B84CE4(id result, char a2)
{
  if (a2) {
    return result;
  }
  return result;
}

uint64_t sub_261B84CF0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_261B84D28(uint64_t a1)
{
  sub_261B82304(a1, *(void *)(v1 + 16));
}

void sub_261B84D34(void *a1, uint64_t a2)
{
  sub_261B817BC(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_261B84D3C(uint64_t a1)
{
  return sub_261B837AC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_261B84D44()
{
  return objectdestroy_7Tm(&qword_26A944F90);
}

uint64_t sub_261B84D50(uint64_t a1, uint64_t a2)
{
  return sub_261B84EAC(a1, a2, &qword_26A944F90, sub_261A529E8);
}

uint64_t sub_261B84D70()
{
  return objectdestroy_7Tm(&qword_26A944F90);
}

void sub_261B84D7C(void (*a1)(void **), uint64_t a2)
{
  sub_261B83838(a1, a2, *(void (**)(void **__return_ptr))(v2 + 16));
}

uint64_t sub_261B84D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A946940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_261B84DF0()
{
  unint64_t result = qword_26A948B48;
  if (!qword_26A948B48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A943578);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948B48);
  }
  return result;
}

uint64_t sub_261B84E4C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_261B84E84@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  return sub_261B80E24(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_261B84EA0()
{
  return objectdestroy_7Tm(&qword_26A945068);
}

uint64_t sub_261B84EAC(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v4 + v8;
  uint64_t v10 = (uint64_t *)(v4 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  return a4(a1, a2, v9, v11, v12);
}

uint64_t sub_261B84F70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_261B84FD8()
{
  unint64_t result = qword_26A948B58;
  if (!qword_26A948B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948B58);
  }
  return result;
}

unint64_t sub_261B8502C()
{
  unint64_t result = qword_26A948B60;
  if (!qword_26A948B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948B60);
  }
  return result;
}

unint64_t sub_261B85080()
{
  unint64_t result = qword_26A948B70;
  if (!qword_26A948B70)
  {
    sub_261B8B188();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948B70);
  }
  return result;
}

uint64_t objectdestroy_208Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_261B85124(void (*a1)(void **), uint64_t a2)
{
  sub_261B835D8(a1, a2, *(void (**)(void **__return_ptr, uint64_t *))(v2 + 16), *(void *)(v2 + 24), (uint64_t *)(v2 + 32));
}

uint64_t EffortNavigationView.init(shouldEmbedInNavStack:estimate:cancelTapped:showCurrentWorkloadButton:doneTapped:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unsigned char *a8@<X8>)
{
  uint64_t v16 = (int *)type metadata accessor for EffortNavigationView();
  uint64_t v17 = &a8[v16[9]];
  FIShouldShowTrackTrainingLoadPrompt();
  sub_261B8EA08();
  *uint64_t v17 = v22;
  *((void *)v17 + 1) = v23;
  uint64_t v18 = (uint64_t *)&a8[v16[10]];
  *uint64_t v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943200);
  swift_storeEnumTagMultiPayload();
  *a8 = a1;
  uint64_t result = sub_261A65D00(a2, (uint64_t)&a8[v16[5]]);
  uint64_t v20 = &a8[v16[7]];
  *uint64_t v20 = a6;
  v20[1] = a7;
  uint64_t v21 = &a8[v16[8]];
  *uint64_t v21 = a3;
  v21[1] = a4;
  a8[v16[6]] = a5;
  return result;
}

uint64_t type metadata accessor for EffortNavigationView()
{
  uint64_t result = qword_26A948BB8;
  if (!qword_26A948BB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t EffortNavigationView.init(shouldEmbedInNavStack:estimate:showCurrentWorkloadButton:doneTapped:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unsigned char *a6@<X8>)
{
  uint64_t v12 = (int *)type metadata accessor for EffortNavigationView();
  uint64_t v13 = &a6[v12[9]];
  FIShouldShowTrackTrainingLoadPrompt();
  sub_261B8EA08();
  *uint64_t v13 = v18;
  *((void *)v13 + 1) = v19;
  uint64_t v14 = (uint64_t *)&a6[v12[10]];
  *uint64_t v14 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943200);
  swift_storeEnumTagMultiPayload();
  *a6 = a1;
  uint64_t result = sub_261A65D00(a2, (uint64_t)&a6[v12[5]]);
  uint64_t v16 = &a6[v12[7]];
  *uint64_t v16 = a4;
  v16[1] = a5;
  uint64_t v17 = &a6[v12[8]];
  *uint64_t v17 = nullsub_1;
  v17[1] = 0;
  a6[v12[6]] = a3;
  return result;
}

uint64_t EffortNavigationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v73 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B78);
  uint64_t v6 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  unint64_t v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B80);
  MEMORY[0x270FA5388](v69);
  uint64_t v71 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (int *)type metadata accessor for EffortNavigationView();
  uint64_t v67 = *((void *)v10 - 1);
  uint64_t v11 = *(void *)(v67 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B88);
  uint64_t v12 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  uint64_t v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B90);
  MEMORY[0x270FA5388](v70);
  uint64_t v16 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  if (*v2 == 1)
  {
    MEMORY[0x270FA5388](v18);
    uint64_t v62 = v12;
    uint64_t v64 = v19;
    uint64_t v63 = v20;
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B98);
    uint64_t v66 = sub_2619F8AB8(&qword_26A948BA0, &qword_26A948B98);
    sub_261B8D698();
    uint64_t v21 = &v2[v10[9]];
    char v22 = *v21;
    uint64_t v23 = *((void *)v21 + 1);
    LOBYTE(v76) = v22;
    uint64_t v77 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A946DD0);
    sub_261B8EA38();
    sub_261B86420((uint64_t)v2, (uint64_t)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v24 = (*(unsigned __int8 *)(v67 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80);
    uint64_t v25 = swift_allocObject();
    sub_261B86488((uint64_t)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24);
    EffortExplanationuint64_t View = type metadata accessor for TrainingLoadEffortExplanationView();
    *(void *)&long long v59 = sub_2619F8AB8(&qword_26A948BB0, &qword_26A948B88);
    *((void *)&v59 + 1) = sub_261B86504();
    uint64_t v27 = v68;
    sub_261B8E768();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v14, v27);
    uint64_t v28 = v63;
    uint64_t v29 = v64;
    uint64_t v30 = v70;
    (*(void (**)(uint64_t, char *, uint64_t))(v63 + 32))(v64, v16, v70);
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v71, v29, v30);
    swift_storeEnumTagMultiPayload();
    *(void *)&long long v78 = v27;
    *((void *)&v78 + 1) = EffortExplanationView;
    *(_OWORD *)uint64_t v79 = v59;
    swift_getOpaqueTypeConformance2();
    *(void *)&long long v78 = v65;
    *((void *)&v78 + 1) = EffortExplanationView;
    *(void *)uint64_t v79 = v66;
    *(void *)&v79[8] = *((void *)&v59 + 1);
    swift_getOpaqueTypeConformance2();
    sub_261B8DD68();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8))(v29, v30);
  }
  else
  {
    uint64_t v62 = sub_261B8DBE8();
    sub_261A65018((uint64_t)&v2[v10[5]], (uint64_t)v5);
    uint64_t v32 = &v2[v10[9]];
    uint64_t v66 = v6;
    char v33 = *v32;
    uint64_t v63 = *((void *)v32 + 1);
    LOBYTE(v78) = v33;
    *((void *)&v78 + 1) = v63;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A946DD0);
    uint64_t v64 = (uint64_t)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v65 = (uint64_t)v8;
    sub_261B8EA18();
    uint64_t v34 = v10[7];
    int v35 = v2[v10[6]];
    objc_super v36 = (uint64_t *)&v2[v10[8]];
    uint64_t v37 = *v36;
    uint64_t v38 = v36[1];
    uint64_t v61 = v11;
    uint64_t v40 = *(void *)&v2[v34];
    uint64_t v39 = *(void *)&v2[v34 + 8];
    swift_retain();
    swift_retain();
    EffortEntryView.init(estimate:isShowingEffortOnboarding:showCurrentWorkloadButton:cancelTapped:doneTapped:)((uint64_t)v5, v35, v37, v38, v40, v39, (uint64_t)&v78);
    char v41 = v79[16];
    char v42 = v79[17];
    long long v43 = v80;
    char v44 = v81;
    long long v45 = v83;
    char v46 = v84;
    uint64_t v47 = v85;
    long long v48 = v78;
    long long v49 = *(_OWORD *)v79;
    long long v78 = (unint64_t)v62;
    v79[0] = 0;
    *(_OWORD *)&v79[8] = v48;
    long long v80 = v49;
    char v81 = v41;
    char v82 = v42;
    long long v83 = v43;
    char v84 = v44;
    long long v85 = v45;
    char v86 = v46;
    uint64_t v87 = v47;
    char v74 = v33;
    uint64_t v75 = v63;
    sub_261B8EA38();
    uint64_t v50 = v64;
    sub_261B86420((uint64_t)v2, v64);
    unint64_t v51 = (*(unsigned __int8 *)(v67 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80);
    uint64_t v52 = swift_allocObject();
    sub_261B86488(v50, v52 + v51);
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948B98);
    uint64_t v54 = type metadata accessor for TrainingLoadEffortExplanationView();
    *(void *)&long long v60 = sub_2619F8AB8(&qword_26A948BA0, &qword_26A948B98);
    *((void *)&v60 + 1) = sub_261B86504();
    uint64_t v55 = v65;
    sub_261B8E768();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v56 = v66;
    uint64_t v57 = v72;
    (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v71, v55, v72);
    swift_storeEnumTagMultiPayload();
    uint64_t v58 = sub_2619F8AB8(&qword_26A948BB0, &qword_26A948B88);
    *(void *)&long long v78 = v68;
    *((void *)&v78 + 1) = v54;
    *(void *)uint64_t v79 = v58;
    *(void *)&v79[8] = *((void *)&v60 + 1);
    swift_getOpaqueTypeConformance2();
    *(void *)&long long v78 = v53;
    *((void *)&v78 + 1) = v54;
    *(_OWORD *)uint64_t v79 = v60;
    swift_getOpaqueTypeConformance2();
    sub_261B8DD68();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
  }
}

double sub_261B85E10@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_261B8DBE8();
  unint64_t v8 = (int *)type metadata accessor for EffortNavigationView();
  sub_261A65018(a1 + v8[5], (uint64_t)v6);
  uint64_t v9 = (char *)(a1 + v8[9]);
  char v10 = *v9;
  uint64_t v11 = *((void *)v9 + 1);
  LOBYTE(v32[0]) = v10;
  *((void *)&v32[0] + 1) = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A946DD0);
  sub_261B8EA18();
  uint64_t v12 = v8[7];
  int v13 = *(unsigned __int8 *)(a1 + v8[6]);
  uint64_t v14 = (uint64_t *)(a1 + v8[8]);
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  uint64_t v17 = a1 + v12;
  uint64_t v18 = *(void *)(a1 + v12);
  uint64_t v19 = *(void *)(v17 + 8);
  swift_retain();
  swift_retain();
  EffortEntryView.init(estimate:isShowingEffortOnboarding:showCurrentWorkloadButton:cancelTapped:doneTapped:)((uint64_t)v6, v13, v15, v16, v18, v19, (uint64_t)v32);
  char v20 = v33;
  char v21 = v34;
  double result = v35;
  uint64_t v23 = v36;
  char v24 = v37;
  uint64_t v25 = v38;
  uint64_t v26 = v39;
  char v27 = v40;
  uint64_t v28 = v41;
  long long v29 = v32[0];
  long long v30 = v32[1];
  *(void *)a2 = v7;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 24) = v29;
  *(_OWORD *)(a2 + 40) = v30;
  *(unsigned char *)(a2 + 56) = v20;
  *(unsigned char *)(a2 + 57) = v21;
  *(double *)(a2 + 64) = result;
  *(void *)(a2 + 72) = v23;
  *(unsigned char *)(a2 + 80) = v24;
  *(void *)(a2 + 88) = v25;
  *(void *)(a2 + 96) = v26;
  *(unsigned char *)(a2 + 104) = v27;
  *(void *)(a2 + 112) = v28;
  return result;
}

uint64_t sub_261B85FA8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for EffortNavigationView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  sub_261B86420(a1, (uint64_t)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  sub_261B86488((uint64_t)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943200);
  swift_storeEnumTagMultiPayload();
  EffortExplanationuint64_t View = (int *)type metadata accessor for TrainingLoadEffortExplanationView();
  char v10 = (char *)a2 + EffortExplanationView[7];
  sub_261B8F378();
  uint64_t v11 = sub_261B8F368();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v13;
  uint64_t v14 = sub_261B8F368();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  uint64_t result = sub_261B8EB68();
  uint64_t v17 = v20[2];
  char v18 = v21;
  *(void *)char v10 = v20[1];
  *((void *)v10 + 1) = v17;
  v10[16] = v18;
  *((unsigned char *)a2 + EffortExplanationView[6]) = 1;
  uint64_t v19 = (uint64_t *)((char *)a2 + EffortExplanationView[5]);
  *uint64_t v19 = sub_261B87954;
  v19[1] = v8;
  return result;
}

uint64_t sub_261B861A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for EffortNavigationView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  sub_261B86420(a1, (uint64_t)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  sub_261B86488((uint64_t)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943200);
  swift_storeEnumTagMultiPayload();
  EffortExplanationuint64_t View = (int *)type metadata accessor for TrainingLoadEffortExplanationView();
  char v10 = (char *)a2 + EffortExplanationView[7];
  sub_261B8F378();
  uint64_t v11 = sub_261B8F368();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v13;
  uint64_t v14 = sub_261B8F368();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  uint64_t result = sub_261B8EB68();
  uint64_t v17 = v20[2];
  char v18 = v21;
  *(void *)char v10 = v20[1];
  *((void *)v10 + 1) = v17;
  v10[16] = v18;
  *((unsigned char *)a2 + EffortExplanationView[6]) = 1;
  uint64_t v19 = (uint64_t *)((char *)a2 + EffortExplanationView[5]);
  *uint64_t v19 = sub_261B87954;
  v19[1] = v8;
  return result;
}

uint64_t sub_261B863A8()
{
  return sub_261B8EA28();
}

uint64_t sub_261B86420(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EffortNavigationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_261B86488(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EffortNavigationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_261B864EC()
{
  return sub_261B86580((uint64_t (*)(uint64_t))sub_261B861A8);
}

unint64_t sub_261B86504()
{
  unint64_t result = qword_26A948BA8;
  if (!qword_26A948BA8)
  {
    type metadata accessor for TrainingLoadEffortExplanationView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948BA8);
  }
  return result;
}

double sub_261B8655C@<D0>(uint64_t a1@<X8>)
{
  return sub_261B85E10(*(void *)(v1 + 16), a1);
}

uint64_t sub_261B86568()
{
  return sub_261B86580((uint64_t (*)(uint64_t))sub_261B85FA8);
}

uint64_t sub_261B86580(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for EffortNavigationView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_261B86604()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for EffortNavigationView(unsigned char *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = &a1[v7];
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_261B8C2D8();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v14 = a3[7];
    *((unsigned char *)v4 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    uint64_t v15 = (void *)((char *)v4 + v14);
    uint64_t v16 = (void *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = a3[8];
    uint64_t v19 = a3[9];
    char v20 = (void *)((char *)v4 + v18);
    char v21 = (void *)((char *)a2 + v18);
    uint64_t v22 = v21[1];
    *char v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = (char *)v4 + v19;
    char v24 = (char *)a2 + v19;
    *uint64_t v23 = *v24;
    *((void *)v23 + 1) = *((void *)v24 + 1);
    uint64_t v25 = a3[10];
    uint64_t v26 = (void *)((char *)v4 + v25);
    char v27 = (void *)((char *)a2 + v25);
    swift_retain();
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A943200);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v28 = sub_261B8D518();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
    }
    else
    {
      *uint64_t v26 = *v27;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t destroy for EffortNavigationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_261B8C2D8();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = a1 + *(int *)(a2 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943200);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_261B8D518();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    return v9(v7, v8);
  }
  else
  {
    return swift_release();
  }
}

unsigned char *initializeWithCopy for EffortNavigationView(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_261B8C2D8();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = &a1[v16];
  uint64_t v19 = &a2[v16];
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  char v21 = &a1[v17];
  uint64_t v22 = &a2[v17];
  *char v21 = *v22;
  *((void *)v21 + 1) = *((void *)v22 + 1);
  uint64_t v23 = a3[10];
  char v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943200);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v26 = sub_261B8D518();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  }
  else
  {
    *char v24 = *v25;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

unsigned char *assignWithCopy for EffortNavigationView(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_261B8C2D8();
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
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  a1[a3[6]] = a2[a3[6]];
  uint64_t v15 = a3[7];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_retain();
  swift_release();
  uint64_t v19 = a3[8];
  uint64_t v20 = &a1[v19];
  char v21 = &a2[v19];
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  swift_retain();
  swift_release();
  uint64_t v23 = a3[9];
  char v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  *char v24 = *v25;
  *((void *)v24 + 1) = *((void *)v25 + 1);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v26 = a3[10];
    char v27 = &a1[v26];
    uint64_t v28 = &a2[v26];
    sub_261B86EC8((uint64_t)&a1[v26]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A943200);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v29 = sub_261B8D518();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
    }
    else
    {
      *char v27 = *v28;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_261B86EC8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943200);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *initializeWithTake for EffortNavigationView(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_261B8C2D8();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(_OWORD *)&a1[v12] = *(_OWORD *)&a2[v12];
  uint64_t v13 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  uint64_t v14 = a3[10];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943200);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_261B8D518();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  return a1;
}

unsigned char *assignWithTake for EffortNavigationView(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_261B8C2D8();
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
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(_OWORD *)&a1[v15] = *(_OWORD *)&a2[v15];
  swift_release();
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  swift_release();
  uint64_t v16 = a3[9];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  *uint64_t v17 = *v18;
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v19 = a3[10];
    uint64_t v20 = &a1[v19];
    char v21 = &a2[v19];
    sub_261B86EC8((uint64_t)&a1[v19]);
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943200);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = sub_261B8D518();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v23 - 8) + 32))(v20, v21, v23);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for EffortNavigationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_261B873BC);
}

uint64_t sub_261B873BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + a3[5];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v12 = *(void *)(a1 + a3[7]);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944CD0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a3[10];
    return v14(v16, a2, v15);
  }
}

uint64_t storeEnumTagSinglePayload for EffortNavigationView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_261B87508);
}

uint64_t sub_261B87508(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26A943910);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + a4[5];
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[7]) = (a2 - 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A944CD0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a4[10];
    return v14(v16, a2, a2, v15);
  }
  return result;
}

void sub_261B87640()
{
  sub_261B87790(319, (unint64_t *)&qword_26A943928, MEMORY[0x263F87EE8], MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F)
  {
    sub_261B87790(319, (unint64_t *)&qword_26A944478, MEMORY[0x263F188C0], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_261B87790(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_261B877F8()
{
  unint64_t result = qword_26A948BC8;
  if (!qword_26A948BC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948BD0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948B88);
    type metadata accessor for TrainingLoadEffortExplanationView();
    sub_2619F8AB8(&qword_26A948BB0, &qword_26A948B88);
    sub_261B86504();
    swift_getOpaqueTypeConformance2();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948B98);
    sub_2619F8AB8(&qword_26A948BA0, &qword_26A948B98);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948BC8);
  }
  return result;
}

uint64_t sub_261B87958()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_261B87990@<X0>(unsigned char *a1@<X8>)
{
  return sub_261A411B4(a1);
}

uint64_t sub_261B87998(unsigned __int8 *a1)
{
  return sub_261A411DC(a1);
}

uint64_t objectdestroyTm_7()
{
  uint64_t v1 = type metadata accessor for EffortNavigationView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  uint64_t v6 = sub_261B8C2D8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  swift_release();
  swift_release();
  swift_release();
  uint64_t v8 = v0 + v3 + *(int *)(v1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A943200);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_261B8D518();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_261B87B74()
{
  return sub_261B863A8();
}

uint64_t ZoneMetricView.init(zoneViewType:liveZones:value:isStale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, uint64_t a6@<X8>)
{
  unint64_t v12 = (int *)type metadata accessor for ZoneMetricView();
  uint64_t v13 = a6 + v12[8];
  *(void *)uint64_t v13 = swift_getKeyPath();
  *(unsigned char *)(v13 + 8) = 0;
  uint64_t v14 = sub_261B8BE48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(a6, a1, v14);
  uint64_t result = sub_2619FB7EC(a2, a6 + v12[5], &qword_26A943F78);
  uint64_t v16 = a6 + v12[6];
  *(void *)uint64_t v16 = a3;
  *(unsigned char *)(v16 + 8) = a4 & 1;
  *(unsigned char *)(a6 + v12[7]) = a5;
  return result;
}

uint64_t type metadata accessor for ZoneMetricView()
{
  uint64_t result = qword_26A948CD0;
  if (!qword_26A948CD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_261B87D14()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ZoneMetricView();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v16[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v16[-1] - v6;
  char v9 = *(unsigned char *)(v1 + *(int *)(v8 + 24) + 8);
  sub_261B8A048(v1, (uint64_t)&v16[-1] - v6, (uint64_t (*)(void))type metadata accessor for ZoneMetricView);
  if (v9)
  {
    sub_261B8A0B0((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ZoneMetricView);
    sub_261B8A048(v1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ZoneMetricView);
  }
  else
  {
    int v10 = v7[*(int *)(v2 + 28)];
    sub_261B8A0B0((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ZoneMetricView);
    sub_261B8A048(v1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ZoneMetricView);
    if (v10 == 1)
    {
      sub_261B8A0B0((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ZoneMetricView);
      return 1;
    }
  }
  sub_2619F86F0((uint64_t)&v4[*(int *)(v2 + 20)], (uint64_t)v16, &qword_26A943F78);
  if (!v17)
  {
    sub_261B8A0B0((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ZoneMetricView);
    sub_2619F8754((uint64_t)v16, &qword_26A943F78);
    return 1;
  }
  __swift_project_boxed_opaque_existential_1(v16, v17);
  sub_261B8C248();
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A945190);
  uint64_t v11 = sub_261B8F998();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v11 + 16);
  swift_bridgeObjectRelease();
  BOOL v13 = v12 == 0;
  sub_261B8A0B0((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ZoneMetricView);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return v13;
}

uint64_t ZoneMetricView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v166 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948BD8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v131 = (uint64_t)&v128 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948BE0);
  MEMORY[0x270FA5388](v129);
  uint64_t v132 = (uint64_t)&v128 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948BE8);
  MEMORY[0x270FA5388](v130);
  uint64_t v135 = (uint64_t)&v128 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948BF0);
  MEMORY[0x270FA5388](v133);
  uint64_t v136 = (uint64_t)&v128 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948BF8);
  MEMORY[0x270FA5388](v165);
  uint64_t v134 = (uint64_t)&v128 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v137 = (char *)&v128 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948C00);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v128 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945128);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v160 = (uint64_t *)((char *)&v128 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v159 = sub_261B8BE48();
  uint64_t v157 = *(void *)(v159 - 8);
  MEMORY[0x270FA5388](v159);
  uint64_t v158 = (char *)&v128 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (int *)type metadata accessor for ZoneView();
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v128 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948C08);
  MEMORY[0x270FA5388](v162);
  uint64_t v161 = (uint64_t)&v128 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9433B8);
  MEMORY[0x270FA5388](v144);
  uint64_t v150 = (uint64_t)&v128 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9433C0);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v147 = (uint64_t)&v128 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948C10);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v149 = (uint64_t)&v128 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948C18);
  MEMORY[0x270FA5388](v145);
  uint64_t v151 = (uint64_t)&v128 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948C20);
  MEMORY[0x270FA5388](v146);
  uint64_t v152 = (uint64_t)&v128 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948C28);
  MEMORY[0x270FA5388](v148);
  uint64_t v155 = (uint64_t)&v128 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948C30);
  MEMORY[0x270FA5388](v153);
  uint64_t v154 = (uint64_t)&v128 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948C38);
  MEMORY[0x270FA5388](v164);
  long long v30 = (char *)&v128 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  uint64_t v156 = (uint64_t)&v128 - v32;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A948C40);
  uint64_t v34 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v163 = (char *)&v128 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = type metadata accessor for ZoneMetricView();
  sub_2619F86F0(v1 + *(int *)(v36 + 20), (uint64_t)&v169, &qword_26A943F78);
  if (*((void *)&v170 + 1))
  {
    uint64_t v140 = v34;
    uint64_t v141 = v33;
    uint64_t v142 = v10;
    uint64_t v143 = v12;
    sub_261A4E500(&v169, (uint64_t)v168);
    uint64_t v37 = v1;
    uint64_t v38 = v1 + *(int *)(v36 + 32);
    uint64_t v39 = *(void *)v38;
    char v40 = *(unsigned char *)(v38 + 8);
    sub_2619F7774(*(void *)v38, v40);
    sub_2619FA43C(v39, v40, &v167);
    sub_2619F7790(v39, v40);
    uint64_t v41 = v1;
    uint64_t v42 = v36;
    uint64_t v139 = v36;
    uint64_t v138 = v1;
    if (v167 != 7 && v167)
    {
      uint64_t v91 = v157;
      uint64_t v92 = v158;
      uint64_t v93 = v159;
      (*(void (**)(char *, uint64_t, uint64_t))(v157 + 16))(v158, v1, v159);
      sub_261A40D48((uint64_t)v168, (uint64_t)&v169);
      unint64_t v94 = (uint64_t *)(v1 + *(int *)(v42 + 24));
      uint64_t v95 = *v94;
      char v96 = *((unsigned char *)v94 + 8);
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v98 = (uint64_t)v160;
      uint64_t *v160 = KeyPath;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A945120);
      swift_storeEnumTagMultiPayload();
      uint64_t v99 = swift_getKeyPath();
      sub_2619FB7EC(v98, (uint64_t)v18, &qword_26A945128);
      (*(void (**)(char *, char *, uint64_t))(v91 + 32))(&v18[v16[5]], v92, v93);
      sub_261A4E500(&v169, (uint64_t)&v18[v16[6]]);
      uint64_t v100 = &v18[v16[7]];
      *(void *)uint64_t v100 = v95;
      v100[8] = v96;
      uint64_t v101 = &v18[v16[8]];
      *(void *)uint64_t v101 = v99;
      v101[8] = 0;
      uint64_t v102 = sub_261B8ECC8();
      uint64_t v103 = *v94;
      char v104 = *((unsigned char *)v94 + 8);
      uint64_t v105 = v161;
      sub_261B8A048((uint64_t)v18, v161, (uint64_t (*)(void))type metadata accessor for ZoneView);
      uint64_t v106 = v105 + *(int *)(v162 + 36);
      *(void *)uint64_t v106 = v102;
      *(void *)(v106 + 8) = v103;
      *(unsigned char *)(v106 + 16) = v104;
      sub_261B8A0B0((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for ZoneView);
      uint64_t v107 = v131;
      sub_2619F86F0(v105, v131, &qword_26A948C08);
      sub_2619F8754(v105, &qword_26A948C08);
      uint64_t v108 = v138;
      if (sub_261B87D14()) {
        double v109 = 0.35;
      }
      else {
        double v109 = 1.0;
      }
      uint64_t v110 = v132;
      sub_2619F86F0(v107, v132, &qword_26A948BD8);
      *(double *)(v110 + *(int *)(v129 + 36)) = v109;
      sub_2619F8754(v107, &qword_26A948BD8);
      uint64_t v111 = sub_261B8ECC8();
      char v112 = *(unsigned char *)(v108 + *(int *)(v139 + 28));
      uint64_t v113 = v135;
      sub_2619F86F0(v110, v135, &qword_26A948BE0);
      uint64_t v114 = v113 + *(int *)(v130 + 36);
      *(void *)uint64_t v114 = v111;
      *(unsigned char *)(v114 + 8) = v112;
      sub_2619F8754(v110, &qword_26A948BE0);
      unsigned __int8 v115 = sub_261B8DFB8();
      char v116 = sub_261B8DFC8();
      char v117 = sub_261B8DFE8();
      sub_261B8DFE8();
      if (sub_261B8DFE8() != v115) {
        char v117 = sub_261B8DFE8();
      }
      sub_261B8DFE8();
      char v118 = sub_261B8DFE8();
      uint64_t v119 = v165;
      uint64_t v120 = (uint64_t)v143;
      uint64_t v88 = v141;
      uint64_t v89 = v140;
      if (v118 != v116) {
        char v117 = sub_261B8DFE8();
      }
      uint64_t v121 = v136;
      sub_2619F86F0(v113, v136, &qword_26A948BE8);
      uint64_t v122 = v121 + *(int *)(v133 + 36);
      *(unsigned char *)uint64_t v122 = v117;
      *(_OWORD *)(v122 + 8) = 0u;
      *(_OWORD *)(v122 + 24) = 0u;
      *(unsigned char *)(v122 + 40) = 1;
      sub_2619F8754(v113, &qword_26A948BE8);
      char v123 = sub_261B8DFC8();
      uint64_t v124 = v134;
      sub_2619F86F0(v121, v134, &qword_26A948BF0);
      uint64_t v125 = v124 + *(int *)(v119 + 36);
      *(unsigned char *)uint64_t v125 = v123;
      *(_OWORD *)(v125 + 8) = 0u;
      *(_OWORD *)(v125 + 24) = 0u;
      *(unsigned char *)(v125 + 40) = 1;
      sub_2619F8754(v121, &qword_26A948BF0);
      uint64_t v126 = (uint64_t)v137;
      sub_2619FB7EC(v124, (uint64_t)v137, &qword_26A948BF8);
      sub_2619F86F0(v126, v120, &qword_26A948BF8);
      swift_storeEnumTagMultiPayload();
      sub_261B8913C();
      sub_261B89344(&qword_26A948CA8, &qword_26A948BF8, (void (*)(void))sub_261B89584);
      uint64_t v87 = (uint64_t)v163;
      sub_261B8DD68();
      sub_2619F8754(v126, &qword_26A948BF8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v168);
    }
    else
    {
      uint64_t v43 = v157;
      char v44 = v158;
      uint64_t v45 = v159;
      (*(void (**)(char *, uint64_t, uint64_t))(v157 + 16))(v158, v37, v159);
      sub_261A40D48((uint64_t)v168, (uint64_t)&v169);
      uint64_t v46 = *(int *)(v42 + 24);
      uint64_t v47 = (uint64_t *)(v37 + v46);
      uint64_t v48 = *(void *)(v37 + v46);
      char v49 = *(unsigned char *)(v41 + v46 + 8);
      uint64_t v50 = swift_getKeyPath();
      uint64_t v137 = v30;
      unint64_t v51 = v44;
      uint64_t v52 = (uint64_t)v160;
      uint64_t *v160 = v50;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A945120);
      swift_storeEnumTagMultiPayload();
      uint64_t v53 = swift_getKeyPath();
      sub_2619FB7EC(v52, (uint64_t)v18, &qword_26A945128);
      (*(void (**)(char *, char *, uint64_t))(v43 + 32))(&v18[v16[5]], v51, v45);
      sub_261A4E500(&v169, (uint64_t)&v18[v16[6]]);
      uint64_t v54 = &v18[v16[7]];
      *(void *)uint64_t v54 = v48;
      v54[8] = v49;
      uint64_t v55 = &v18[v16[8]];
      *(void *)uint64_t v55 = v53;
      v55[8] = 0;
      uint64_t v56 = sub_261B8ECC8();
      uint64_t v57 = *v47;
      LOBYTE(v47) = *((unsigned char *)v47 + 8);
      uint64_t v58 = v161;
      sub_261B8A048((uint64_t)v18, v161, (uint64_t (*)(void))type metadata accessor for ZoneView);
      uint64_t v59 = v58 + *(int *)(v162 + 36);
      *(void *)uint64_t v59 = v56;
      *(void *)(v59 + 8) = v57;
      *(unsigned char *)(v59 + 16) = (_BYTE)v47;
      sub_261B8A0B0((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for ZoneView);
      uint64_t v60 = v150;
      sub_2619F86F0(v58, v150, &qword_26A948C08);
      *(_WORD *)(v60 + *(int *)(v144 + 36)) = 256;
      sub_2619F8754(v58, &qword_26A948C08);
      uint64_t v61 = sub_261B8EC98();
      uint64_t v62 = v147;
      sub_2619FFD8C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v147, 0.0, 1, 0.0, 1, v61, v63);
      sub_2619F8754(v60, &qword_26A9433B8);
      uint64_t v64 = v149;
      sub_2619F86F0(v62, v149, &qword_26A9433C0);
      sub_2619F8754(v62, &qword_26A9433C0);
      uint64_t v65 = v138;
      if (sub_261B87D14()) {
        double v66 = 0.35;
      }
      else {
        double v66 = 1.0;
      }
      uint64_t v67 = v151;
      sub_2619F86F0(v64, v151, &qword_26A948C10);
      *(double *)(v67 + *(int *)(v145 + 36)) = v66;
      sub_2619F8754(v64, &qword_26A948C10);
      uint64_t v68 = sub_261B8ECC8();
      char v69 = *(unsigned char *)(v65 + *(int *)(v139 + 28));
      uint64_t v70 = v152;
      sub_2619F86F0(v67, v152, &qword_26A948C18);
      uint64_t v71 = v70 + *(int *)(v146 + 36);
      *(void *)uint64_t v71 = v68;
      *(unsigned char *)(v71 + 8) = v69;
      sub_2619F8754(v67, &qword_26A948C18);
      LOBYTE(v68) = sub_261B8DFC8();
      sub_261B8D358();
      uint64_t v73 = v72;
      uint64_t v75 = v74;
      uint64_t v77 = v76;
      uint64_t v79 = v78;
      uint64_t v80 = v155;
      sub_2619F86F0(v70, v155, &qword_26A948C20);
      uint64_t v81 = v80 + *(int *)(v148 + 36);
      *(unsigned char *)uint64_t v81 = v68;
      *(void *)(v81 + 8) = v73;
      *(void *)(v81 + 16) = v75;
      *(void *)(v81 + 24) = v77;
      *(void *)(v81 + 32) = v79;
      *(unsigned char *)(v81 + 40) = 0;
      sub_2619F8754(v70, &qword_26A948C20);
      _s9WorkoutUI15LayoutUtilitiesV12layoutMetric9compact389regular428junior408senior4411aloeSmall410K5Big457agave4912CoreGraphics7CGFloatVAN_A6NtFZ_0(75.0, 80.0, 75.0, 80.0, 80.0, 84.0, 84.0);
      sub_261B8EC98();
      sub_261B8D4D8();
      uint64_t v82 = v154;
      sub_2619F86F0(v80, v154, &qword_26A948C28);
      long long v83 = (_OWORD *)(v82 + *(int *)(v153 + 36));
      long long v84 = v170;
      *long long v83 = v169;
      v83[1] = v84;
      v83[2] = v171;
      sub_2619F8754(v80, &qword_26A948C28);
      uint64_t v85 = (uint64_t)v137;
      sub_2619F86F0(v82, (uint64_t)v137, &qword_26A948C30);
      *(void *)(v85 + *(int *)(v164 + 36)) = 0;
      sub_2619F8754(v82, &qword_26A948C30);
      uint64_t v86 = v156;
      sub_2619FB7EC(v85, v156, &qword_26A948C38);
      sub_2619F86F0(v86, (uint64_t)v143, &qword_26A948C38);
      swift_storeEnumTagMultiPayload();
      sub_261B8913C();
      sub_261B89344(&qword_26A948CA8, &qword_26A948BF8, (void (*)(void))sub_261B89584);
      uint64_t v87 = (uint64_t)v163;
      sub_261B8DD68();
      sub_2619F8754(v86, &qword_26A948C38);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v168);
      uint64_t v88 = v141;
      uint64_t v89 = v140;
    }
    uint64_t v127 = v166;
    sub_2619FB7EC(v87, v166, &qword_26A948C40);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v89 + 56))(v127, 0, 1, v88);
  }
  else
  {
    sub_2619F8754((uint64_t)&v169, &qword_26A943F78);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v166, 1, 1, v33);
  }
}

unint64_t sub_261B8913C()
{
  unint64_t result = qword_26A948C48;
  if (!qword_26A948C48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948C38);
    sub_261B89344(&qword_26A948C50, &qword_26A948C30, (void (*)(void))sub_261B891E4);
    sub_261A70FC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948C48);
  }
  return result;
}

unint64_t sub_261B891E4()
{
  unint64_t result = qword_26A948C58;
  if (!qword_26A948C58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948C28);
    sub_261B89284(&qword_26A948C60, &qword_26A948C20, (void (*)(void))sub_261B89314);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948C58);
  }
  return result;
}

uint64_t sub_261B89284(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_261B89534(&qword_26A947FF0, &qword_26A947FF8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_261B89314()
{
  return sub_261B89344(&qword_26A948C68, &qword_26A948C18, (void (*)(void))sub_261B893C0);
}

uint64_t sub_261B89344(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_261B893C0()
{
  return sub_261B89344(&qword_26A948C70, &qword_26A948C10, (void (*)(void))sub_261B893F0);
}

uint64_t sub_261B893F0()
{
  return sub_261B89344(&qword_26A948C78, &qword_26A9433C0, (void (*)(void))sub_261B89420);
}

uint64_t sub_261B89420()
{
  return sub_261B89344(&qword_26A948C80, &qword_26A9433B8, (void (*)(void))sub_261B89450);
}

unint64_t sub_261B89450()
{
  unint64_t result = qword_26A948C88;
  if (!qword_26A948C88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948C08);
    sub_261B894DC();
    sub_261B89534(&qword_26A948C98, &qword_26A948CA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948C88);
  }
  return result;
}

unint64_t sub_261B894DC()
{
  unint64_t result = qword_26A948C90;
  if (!qword_26A948C90)
  {
    type metadata accessor for ZoneView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948C90);
  }
  return result;
}

uint64_t sub_261B89534(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_261B89584()
{
  unint64_t result = qword_26A948CB0;
  if (!qword_26A948CB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948BF0);
    sub_261B89284(&qword_26A948CB8, &qword_26A948BE8, (void (*)(void))sub_261B89624);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948CB0);
  }
  return result;
}

uint64_t sub_261B89624()
{
  return sub_261B89344(&qword_26A948CC0, &qword_26A948BE0, (void (*)(void))sub_261B89654);
}

uint64_t sub_261B89654()
{
  return sub_261B89344(&qword_26A948CC8, &qword_26A948BD8, (void (*)(void))sub_261B89450);
}

uint64_t sub_261B89684()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for ZoneMetricView(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_261B8BE48();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)((char *)a2 + v8 + 24);
    if (v11)
    {
      uint64_t v12 = *((void *)v10 + 4);
      *((void *)v9 + 3) = v11;
      *((void *)v9 + 4) = v12;
      (**(void (***)(void))(v11 - 8))();
    }
    else
    {
      long long v14 = *((_OWORD *)v10 + 1);
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v14;
      *((void *)v9 + 4) = *((void *)v10 + 4);
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = a3[7];
    uint64_t v17 = (char *)a1 + v15;
    uint64_t v18 = (char *)a2 + v15;
    *(void *)uint64_t v17 = *(void *)v18;
    v17[8] = v18[8];
    *((unsigned char *)a1 + v16) = *((unsigned char *)a2 + v16);
    uint64_t v19 = a3[8];
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = *(void *)v21;
    char v23 = v21[8];
    sub_2619F7774(*(void *)v21, v23);
    *(void *)uint64_t v20 = v22;
    v20[8] = v23;
  }
  return a1;
}

uint64_t destroy for ZoneMetricView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_261B8BE48();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  if (*(void *)(v5 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v5);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  uint64_t v7 = *(void *)v6;
  char v8 = *(unsigned char *)(v6 + 8);
  return sub_2619F7790(v7, v8);
}

uint64_t initializeWithCopy for ZoneMetricView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_261B8BE48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 24);
  if (v10)
  {
    uint64_t v11 = *(void *)(v9 + 32);
    *(void *)(v8 + 24) = v10;
    *(void *)(v8 + 32) = v11;
    (**(void (***)(void))(v10 - 8))();
  }
  else
  {
    long long v12 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v12;
    *(void *)(v8 + 32) = *(void *)(v9 + 32);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = *(void *)v19;
  char v21 = *(unsigned char *)(v19 + 8);
  sub_2619F7774(*(void *)v19, v21);
  *(void *)uint64_t v18 = v20;
  *(unsigned char *)(v18 + 8) = v21;
  return a1;
}

uint64_t assignWithCopy for ZoneMetricView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_261B8BE48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (long long *)(a2 + v7);
  uint64_t v10 = *(void *)(a2 + v7 + 24);
  if (!*(void *)(a1 + v7 + 24))
  {
    if (v10)
    {
      *(void *)(v8 + 24) = v10;
      *(void *)(v8 + 32) = *((void *)v9 + 4);
      (**(void (***)(uint64_t, long long *))(v10 - 8))(v8, v9);
      goto LABEL_8;
    }
LABEL_7:
    long long v11 = *v9;
    long long v12 = v9[1];
    *(void *)(v8 + 32) = *((void *)v9 + 4);
    *(_OWORD *)uint64_t v8 = v11;
    *(_OWORD *)(v8 + 16) = v12;
    goto LABEL_8;
  }
  if (!v10)
  {
    __swift_destroy_boxed_opaque_existential_1(v8);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v8, (uint64_t *)v9);
LABEL_8:
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v16 = *v15;
  *(unsigned char *)(v14 + 8) = *((unsigned char *)v15 + 8);
  *(void *)uint64_t v14 = v16;
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = *(void *)v19;
  char v21 = *(unsigned char *)(v19 + 8);
  sub_2619F7774(*(void *)v19, v21);
  uint64_t v22 = *(void *)v18;
  char v23 = *(unsigned char *)(v18 + 8);
  *(void *)uint64_t v18 = v20;
  *(unsigned char *)(v18 + 8) = v21;
  sub_2619F7790(v22, v23);
  return a1;
}

uint64_t initializeWithTake for ZoneMetricView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_261B8BE48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  uint64_t v14 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  return a1;
}

uint64_t assignWithTake for ZoneMetricView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_261B8BE48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  if (*(void *)(a1 + v7 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + v7);
  }
  long long v9 = *(_OWORD *)(a2 + v7 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(v8 + 16) = v9;
  *(void *)(v8 + 32) = *(void *)(a2 + v7 + 32);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v10;
  uint64_t v13 = a2 + v10;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  char v14 = *(unsigned char *)(a2 + v11);
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(a1 + v11) = v14;
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v18 = *v17;
  LOBYTE(v17) = *((unsigned char *)v17 + 8);
  uint64_t v19 = *(void *)v16;
  char v20 = *(unsigned char *)(v16 + 8);
  *(void *)uint64_t v16 = v18;
  *(unsigned char *)(v16 + 8) = (_BYTE)v17;
  sub_2619F7790(v19, v20);
  return a1;
}

uint64_t getEnumTagSinglePayload for ZoneMetricView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_261B89CD0);
}

uint64_t sub_261B89CD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_261B8BE48();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
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

uint64_t storeEnumTagSinglePayload for ZoneMetricView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_261B89DB4);
}

uint64_t sub_261B89DB4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_261B8BE48();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = a2;
  }
  return result;
}

uint64_t sub_261B89E74()
{
  uint64_t result = sub_261B8BE48();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_261B89F2C()
{
  unint64_t result = qword_26A948CE0;
  if (!qword_26A948CE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948CE8);
    sub_261B89FA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948CE0);
  }
  return result;
}

unint64_t sub_261B89FA0()
{
  unint64_t result = qword_26A948CF0;
  if (!qword_26A948CF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A948C40);
    sub_261B8913C();
    sub_261B89344(&qword_26A948CA8, &qword_26A948BF8, (void (*)(void))sub_261B89584);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948CF0);
  }
  return result;
}

uint64_t sub_261B8A048(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_261B8A0B0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t GuidedWorkoutPickerSection.titleKey.getter()
{
  if (*v0) {
    return 0xD000000000000020;
  }
  else {
    return 0xD000000000000023;
  }
}

BOOL static GuidedWorkoutPickerSection.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t GuidedWorkoutPickerSection.hash(into:)()
{
  return sub_261B8FCA8();
}

uint64_t GuidedWorkoutPickerSection.hashValue.getter()
{
  return sub_261B8FCE8();
}

unint64_t sub_261B8A1E0()
{
  unint64_t result = qword_26A948CF8;
  if (!qword_26A948CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A948CF8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for GuidedWorkoutPickerSection(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x261B8A300);
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

ValueMetadata *type metadata accessor for GuidedWorkoutPickerSection()
{
  return &type metadata for GuidedWorkoutPickerSection;
}

uint64_t LapsMetricView.init(lapsMetricsPublisher:formattingManager:)@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  sub_261B8C388();
  sub_261B8A390();
  uint64_t result = sub_261B8D5E8();
  *a2 = result;
  a2[1] = v5;
  a2[2] = a1;
  return result;
}

unint64_t sub_261B8A390()
{
  unint64_t result = qword_26A943F70;
  if (!qword_26A943F70)
  {
    sub_261B8C388();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A943F70);
  }
  return result;
}

uint64_t LapsMetricView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A945788);
  MEMORY[0x270FA5388](v2 - 8);
  unsigned int v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  uint64_t v5 = sub_261B8C378();
  swift_release();
  v16[1] = v5;
  sub_261A9E424();
  uint64_t v6 = sub_261B8F798();
  uint64_t v8 = v7;
  uint64_t v9 = *MEMORY[0x263F87F70];
  uint64_t v10 = sub_261B8C5D8();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v4, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v4, 0, 1, v10);
  uint64_t v12 = sub_261B8F158();
  uint64_t v14 = v13;
  uint64_t result = sub_261A6FF34((uint64_t)v4);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v8;
  *(void *)(a1 + 16) = v12;
  *(void *)(a1 + 24) = v14;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(_WORD *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  return result;
}

uint64_t sub_261B8A578()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_261B8A59C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  unsigned int v4 = (void *)a2[2];
  a1[2] = v4;
  swift_retain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for LapsMetricView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  unsigned int v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  return a1;
}

uint64_t assignWithTake for LapsMetricView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  unsigned int v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

ValueMetadata *type metadata accessor for LapsMetricView()
{
  return &type metadata for LapsMetricView;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_261B8A6B8()
{
  return MEMORY[0x270EE1350]();
}

uint64_t sub_261B8A6C8()
{
  return MEMORY[0x270EE1360]();
}

uint64_t sub_261B8A6D8()
{
  return MEMORY[0x270EE1368]();
}

uint64_t sub_261B8A6E8()
{
  return MEMORY[0x270EE1370]();
}

uint64_t sub_261B8A6F8()
{
  return MEMORY[0x270EE1378]();
}

uint64_t sub_261B8A708()
{
  return MEMORY[0x270EE1380]();
}

uint64_t sub_261B8A718()
{
  return MEMORY[0x270EE1388]();
}

uint64_t sub_261B8A728()
{
  return MEMORY[0x270EE1390]();
}

uint64_t sub_261B8A738()
{
  return MEMORY[0x270EEDD10]();
}

uint64_t sub_261B8A748()
{
  return MEMORY[0x270EEDD50]();
}

uint64_t sub_261B8A758()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_261B8A768()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_261B8A778()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_261B8A788()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_261B8A798()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_261B8A7A8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_261B8A7B8()
{
  return MEMORY[0x270F07A20]();
}

uint64_t sub_261B8A7C8()
{
  return MEMORY[0x270F07A28]();
}

uint64_t sub_261B8A7D8()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_261B8A7E8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_261B8A7F8()
{
  return MEMORY[0x270EEE2C8]();
}

uint64_t sub_261B8A808()
{
  return MEMORY[0x270EEE2E8]();
}

uint64_t sub_261B8A818()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_261B8A828()
{
  return MEMORY[0x270EEE300]();
}

uint64_t sub_261B8A838()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_261B8A848()
{
  return MEMORY[0x270EEE328]();
}

uint64_t sub_261B8A858()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_261B8A868()
{
  return MEMORY[0x270EEE360]();
}

uint64_t sub_261B8A878()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_261B8A888()
{
  return MEMORY[0x270EEE388]();
}

uint64_t sub_261B8A898()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_261B8A8A8()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_261B8A8B8()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_261B8A8C8()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_261B8A8D8()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_261B8A8E8()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_261B8A8F8()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_261B8A908()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_261B8A918()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_261B8A928()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_261B8A938()
{
  return MEMORY[0x270EEE568]();
}

uint64_t sub_261B8A948()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_261B8A958()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_261B8A968()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_261B8A978()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_261B8A988()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_261B8A998()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_261B8A9A8()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_261B8A9B8()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_261B8A9C8()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_261B8A9D8()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_261B8A9E8()
{
  return MEMORY[0x270EEE9A8]();
}

uint64_t sub_261B8A9F8()
{
  return MEMORY[0x270EFEAE8]();
}

uint64_t sub_261B8AA08()
{
  return MEMORY[0x270EFEB00]();
}

uint64_t sub_261B8AA18()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_261B8AA28()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_261B8AA38()
{
  return MEMORY[0x270EEEE18]();
}

uint64_t sub_261B8AA48()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_261B8AA58()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_261B8AA68()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_261B8AA78()
{
  return MEMORY[0x270EEF0A0]();
}

uint64_t sub_261B8AA88()
{
  return MEMORY[0x270EEF0C0]();
}

uint64_t sub_261B8AA98()
{
  return MEMORY[0x270EEF0C8]();
}

uint64_t sub_261B8AAA8()
{
  return MEMORY[0x270EEF180]();
}

uint64_t sub_261B8AAB8()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_261B8AAC8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_261B8AAD8()
{
  return MEMORY[0x270EEF930]();
}

uint64_t sub_261B8AAE8()
{
  return MEMORY[0x270EEF950]();
}

uint64_t sub_261B8AAF8()
{
  return MEMORY[0x270EEF970]();
}

uint64_t sub_261B8AB08()
{
  return MEMORY[0x270EEF978]();
}

uint64_t sub_261B8AB18()
{
  return MEMORY[0x270EEF998]();
}

uint64_t sub_261B8AB28()
{
  return MEMORY[0x270EEF9A8]();
}

uint64_t sub_261B8AB38()
{
  return MEMORY[0x270EEF9B8]();
}

uint64_t sub_261B8AB48()
{
  return MEMORY[0x270EEFAD0]();
}

uint64_t sub_261B8AB58()
{
  return MEMORY[0x270EEFAE0]();
}

uint64_t sub_261B8AB68()
{
  return MEMORY[0x270EEFAE8]();
}

uint64_t sub_261B8AB78()
{
  return MEMORY[0x270EEFAF0]();
}

uint64_t sub_261B8AB88()
{
  return MEMORY[0x270EEFB08]();
}

uint64_t sub_261B8AB98()
{
  return MEMORY[0x270EEFB10]();
}

uint64_t sub_261B8ABA8()
{
  return MEMORY[0x270EEFB28]();
}

uint64_t sub_261B8ABB8()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_261B8ABC8()
{
  return MEMORY[0x270EEFC70]();
}

uint64_t sub_261B8ABD8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_261B8ABE8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_261B8ABF8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_261B8AC08()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_261B8AC18()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_261B8AC28()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_261B8AC38()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_261B8AC48()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_261B8AC58()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_261B8AC68()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_261B8AC78()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_261B8AC88()
{
  return MEMORY[0x270EF0570]();
}

uint64_t sub_261B8AC98()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_261B8ACA8()
{
  return MEMORY[0x270EF0610]();
}

uint64_t sub_261B8ACB8()
{
  return MEMORY[0x270EF0628]();
}

uint64_t sub_261B8ACC8()
{
  return MEMORY[0x270EF06A8]();
}

uint64_t sub_261B8ACD8()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_261B8ACE8()
{
  return MEMORY[0x270F86AC0]();
}

uint64_t sub_261B8ACF8()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_261B8AD08()
{
  return MEMORY[0x270EF0780]();
}

uint64_t sub_261B8AD18()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_261B8AD28()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_261B8AD38()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_261B8AD48()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_261B8AD58()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_261B8AD68()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_261B8AD78()
{
  return MEMORY[0x270F5EA98]();
}

uint64_t sub_261B8AD88()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_261B8AD98()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_261B8ADA8()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_261B8ADB8()
{
  return MEMORY[0x270EF0BD0]();
}

uint64_t sub_261B8ADC8()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_261B8ADD8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_261B8ADE8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_261B8ADF8()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_261B8AE08()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_261B8AE18()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_261B8AE28()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_261B8AE38()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_261B8AE48()
{
  return MEMORY[0x270EF0E50]();
}

uint64_t sub_261B8AE58()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_261B8AE68()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_261B8AE78()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_261B8AE88()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_261B8AE98()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_261B8AEA8()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_261B8AEB8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_261B8AEC8()
{
  return MEMORY[0x270EF1030]();
}

uint64_t sub_261B8AED8()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_261B8AEE8()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_261B8AEF8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_261B8AF08()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_261B8AF18()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_261B8AF28()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_261B8AF38()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_261B8AF48()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_261B8AF58()
{
  return MEMORY[0x270EF12A8]();
}

uint64_t sub_261B8AF68()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_261B8AF78()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_261B8AF88()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_261B8AF98()
{
  return MEMORY[0x270EF13B8]();
}

uint64_t sub_261B8AFA8()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_261B8AFB8()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_261B8AFC8()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_261B8AFD8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_261B8AFE8()
{
  return MEMORY[0x270F07B90]();
}

uint64_t sub_261B8AFF8()
{
  return MEMORY[0x270F07B98]();
}

uint64_t sub_261B8B008()
{
  return MEMORY[0x270F07C48]();
}

uint64_t sub_261B8B018()
{
  return MEMORY[0x270F07C60]();
}

uint64_t sub_261B8B028()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_261B8B038()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_261B8B048()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_261B8B058()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_261B8B068()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_261B8B078()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_261B8B088()
{
  return MEMORY[0x270F5ECF0]();
}

uint64_t sub_261B8B098()
{
  return MEMORY[0x270F5ED70]();
}

uint64_t sub_261B8B0A8()
{
  return MEMORY[0x270F5ED98]();
}

uint64_t sub_261B8B0B8()
{
  return MEMORY[0x270F5EDA8]();
}

uint64_t sub_261B8B0C8()
{
  return MEMORY[0x270F5EDB0]();
}

uint64_t sub_261B8B0D8()
{
  return MEMORY[0x270F5EDB8]();
}

uint64_t sub_261B8B0E8()
{
  return MEMORY[0x270F5EDC8]();
}

uint64_t sub_261B8B0F8()
{
  return MEMORY[0x270F5EDD0]();
}

uint64_t sub_261B8B108()
{
  return MEMORY[0x270F5EDD8]();
}

uint64_t sub_261B8B118()
{
  return MEMORY[0x270F5EE10]();
}

uint64_t sub_261B8B128()
{
  return MEMORY[0x270F5EE18]();
}

uint64_t sub_261B8B138()
{
  return MEMORY[0x270F5EE20]();
}

uint64_t sub_261B8B148()
{
  return MEMORY[0x270F5EE30]();
}

uint64_t sub_261B8B158()
{
  return MEMORY[0x270F5EE38]();
}

uint64_t sub_261B8B168()
{
  return MEMORY[0x270F5EE40]();
}

uint64_t sub_261B8B178()
{
  return MEMORY[0x270F5EE48]();
}

uint64_t sub_261B8B188()
{
  return MEMORY[0x270F5EE50]();
}

uint64_t sub_261B8B198()
{
  return MEMORY[0x270F5EE90]();
}

uint64_t sub_261B8B1A8()
{
  return MEMORY[0x270F5EF30]();
}

uint64_t sub_261B8B1B8()
{
  return MEMORY[0x270F5EF48]();
}

uint64_t sub_261B8B1C8()
{
  return MEMORY[0x270F5EF50]();
}

uint64_t sub_261B8B1D8()
{
  return MEMORY[0x270F5EF58]();
}

uint64_t sub_261B8B1E8()
{
  return MEMORY[0x270F5EF60]();
}

uint64_t sub_261B8B1F8()
{
  return MEMORY[0x270F5EF68]();
}

uint64_t sub_261B8B208()
{
  return MEMORY[0x270F5EF70]();
}

uint64_t sub_261B8B218()
{
  return MEMORY[0x270F5EF78]();
}

uint64_t sub_261B8B228()
{
  return MEMORY[0x270F5EF80]();
}

uint64_t sub_261B8B238()
{
  return MEMORY[0x270F5EF88]();
}

uint64_t sub_261B8B248()
{
  return MEMORY[0x270F5F120]();
}

uint64_t sub_261B8B258()
{
  return MEMORY[0x270F5F128]();
}

uint64_t sub_261B8B268()
{
  return MEMORY[0x270F5F130]();
}

uint64_t sub_261B8B278()
{
  return MEMORY[0x270F621A0]();
}

uint64_t sub_261B8B288()
{
  return MEMORY[0x270F5F1B0]();
}

uint64_t sub_261B8B298()
{
  return MEMORY[0x270F5F1B8]();
}

uint64_t sub_261B8B2A8()
{
  return MEMORY[0x270F5F1C8]();
}

uint64_t sub_261B8B2B8()
{
  return MEMORY[0x270F5F268]();
}

uint64_t sub_261B8B2C8()
{
  return MEMORY[0x270F5F2D0]();
}

uint64_t sub_261B8B2D8()
{
  return MEMORY[0x270F5F398]();
}

uint64_t sub_261B8B2E8()
{
  return MEMORY[0x270F5F3A0]();
}

uint64_t sub_261B8B2F8()
{
  return MEMORY[0x270F5F3A8]();
}

uint64_t sub_261B8B308()
{
  return MEMORY[0x270F5F3C0]();
}

uint64_t sub_261B8B318()
{
  return MEMORY[0x270F5F3F0]();
}

uint64_t sub_261B8B328()
{
  return MEMORY[0x270F5F400]();
}

uint64_t sub_261B8B338()
{
  return MEMORY[0x270F5F468]();
}

uint64_t sub_261B8B348()
{
  return MEMORY[0x270F5F478]();
}

uint64_t sub_261B8B358()
{
  return MEMORY[0x270F5F488]();
}

uint64_t sub_261B8B368()
{
  return MEMORY[0x270F5F490]();
}

uint64_t sub_261B8B378()
{
  return MEMORY[0x270F5F4A0]();
}

uint64_t sub_261B8B388()
{
  return MEMORY[0x270F5F548]();
}

uint64_t sub_261B8B398()
{
  return MEMORY[0x270F5F6A8]();
}

uint64_t sub_261B8B3A8()
{
  return MEMORY[0x270F5F780]();
}

uint64_t sub_261B8B3B8()
{
  return MEMORY[0x270F5F7A0]();
}

uint64_t sub_261B8B3C8()
{
  return MEMORY[0x270F5F7A8]();
}

uint64_t sub_261B8B3D8()
{
  return MEMORY[0x270F5F7B0]();
}

uint64_t sub_261B8B3E8()
{
  return MEMORY[0x270F5F7B8]();
}

uint64_t sub_261B8B3F8()
{
  return MEMORY[0x270F5F7C0]();
}

uint64_t sub_261B8B408()
{
  return MEMORY[0x270F5F7E0]();
}

uint64_t sub_261B8B418()
{
  return MEMORY[0x270F5F7E8]();
}

uint64_t sub_261B8B428()
{
  return MEMORY[0x270F5F800]();
}

uint64_t sub_261B8B438()
{
  return MEMORY[0x270F5F810]();
}

uint64_t sub_261B8B448()
{
  return MEMORY[0x270F5F820]();
}

uint64_t sub_261B8B458()
{
  return MEMORY[0x270F5F830]();
}

uint64_t sub_261B8B468()
{
  return MEMORY[0x270F5F838]();
}

uint64_t sub_261B8B478()
{
  return MEMORY[0x270F5F860]();
}

uint64_t sub_261B8B488()
{
  return MEMORY[0x270F5F868]();
}

uint64_t sub_261B8B498()
{
  return MEMORY[0x270F5FCD8]();
}

uint64_t sub_261B8B4A8()
{
  return MEMORY[0x270F5FCE0]();
}

uint64_t sub_261B8B4B8()
{
  return MEMORY[0x270F5FCE8]();
}

uint64_t sub_261B8B4C8()
{
  return MEMORY[0x270F5FD18]();
}

uint64_t sub_261B8B4D8()
{
  return MEMORY[0x270F5FD20]();
}

uint64_t sub_261B8B4E8()
{
  return MEMORY[0x270F5FD80]();
}

uint64_t sub_261B8B4F8()
{
  return MEMORY[0x270F5FD88]();
}

uint64_t sub_261B8B508()
{
  return MEMORY[0x270F5FF10]();
}

uint64_t sub_261B8B518()
{
  return MEMORY[0x270F5FF18]();
}

uint64_t sub_261B8B528()
{
  return MEMORY[0x270F5FFB8]();
}

uint64_t sub_261B8B538()
{
  return MEMORY[0x270F5FFD0]();
}

uint64_t sub_261B8B548()
{
  return MEMORY[0x270F5FFE8]();
}

uint64_t sub_261B8B558()
{
  return MEMORY[0x270F5FFF0]();
}

uint64_t sub_261B8B568()
{
  return MEMORY[0x270F621D8]();
}

uint64_t sub_261B8B578()
{
  return MEMORY[0x270F60018]();
}

uint64_t sub_261B8B588()
{
  return MEMORY[0x270F601F0]();
}

uint64_t sub_261B8B598()
{
  return MEMORY[0x270F60298]();
}

uint64_t sub_261B8B5A8()
{
  return MEMORY[0x270F602B0]();
}

uint64_t sub_261B8B5B8()
{
  return MEMORY[0x270F602C0]();
}

uint64_t sub_261B8B5C8()
{
  return MEMORY[0x270F602C8]();
}

uint64_t sub_261B8B5D8()
{
  return MEMORY[0x270F60360]();
}

uint64_t sub_261B8B5E8()
{
  return MEMORY[0x270F603F8]();
}

uint64_t sub_261B8B5F8()
{
  return MEMORY[0x270F60408]();
}

uint64_t sub_261B8B608()
{
  return MEMORY[0x270F5D2A0]();
}

uint64_t sub_261B8B618()
{
  return MEMORY[0x270F604A0]();
}

uint64_t sub_261B8B628()
{
  return MEMORY[0x270F60678]();
}

uint64_t sub_261B8B638()
{
  return MEMORY[0x270F60690]();
}

uint64_t sub_261B8B648()
{
  return MEMORY[0x270F606B0]();
}

uint64_t sub_261B8B658()
{
  return MEMORY[0x270F606C8]();
}

uint64_t sub_261B8B668()
{
  return MEMORY[0x270F606D8]();
}

uint64_t sub_261B8B678()
{
  return MEMORY[0x270F60868]();
}

uint64_t sub_261B8B688()
{
  return MEMORY[0x270F609F0]();
}

uint64_t sub_261B8B698()
{
  return MEMORY[0x270F60A08]();
}

uint64_t sub_261B8B6A8()
{
  return MEMORY[0x270F60C68]();
}

uint64_t sub_261B8B6B8()
{
  return MEMORY[0x270F60C70]();
}

uint64_t sub_261B8B6C8()
{
  return MEMORY[0x270F60C78]();
}

uint64_t sub_261B8B6D8()
{
  return MEMORY[0x270F60EC0]();
}

uint64_t sub_261B8B6E8()
{
  return MEMORY[0x270F61058]();
}

uint64_t sub_261B8B6F8()
{
  return MEMORY[0x270F61270]();
}

uint64_t sub_261B8B708()
{
  return MEMORY[0x270F61280]();
}

uint64_t sub_261B8B718()
{
  return MEMORY[0x270F61380]();
}

uint64_t sub_261B8B728()
{
  return MEMORY[0x270F614D0]();
}

uint64_t sub_261B8B738()
{
  return MEMORY[0x270F614D8]();
}

uint64_t sub_261B8B748()
{
  return MEMORY[0x270F61D10]();
}

uint64_t sub_261B8B758()
{
  return MEMORY[0x270F61D20]();
}

uint64_t sub_261B8B768()
{
  return MEMORY[0x270F61D38]();
}

uint64_t sub_261B8B778()
{
  return MEMORY[0x270F61D48]();
}

uint64_t sub_261B8B788()
{
  return MEMORY[0x270F61D50]();
}

uint64_t sub_261B8B798()
{
  return MEMORY[0x270F61D58]();
}

uint64_t sub_261B8B7A8()
{
  return MEMORY[0x270F61D68]();
}

uint64_t sub_261B8B7B8()
{
  return MEMORY[0x270F61E18]();
}

uint64_t sub_261B8B7C8()
{
  return MEMORY[0x270F61E48]();
}

uint64_t sub_261B8B7D8()
{
  return MEMORY[0x270F61F08]();
}

uint64_t sub_261B8B7E8()
{
  return MEMORY[0x270F61F20]();
}

uint64_t sub_261B8B7F8()
{
  return MEMORY[0x270F86AC8]();
}

uint64_t sub_261B8B808()
{
  return MEMORY[0x270F86AD0]();
}

uint64_t sub_261B8B818()
{
  return MEMORY[0x270F86AD8]();
}

uint64_t sub_261B8B828()
{
  return MEMORY[0x270F86AE0]();
}

uint64_t sub_261B8B838()
{
  return MEMORY[0x270F86AE8]();
}

uint64_t sub_261B8B848()
{
  return MEMORY[0x270F86AF0]();
}

uint64_t sub_261B8B858()
{
  return MEMORY[0x270F86AF8]();
}

uint64_t sub_261B8B868()
{
  return MEMORY[0x270F86B00]();
}

uint64_t sub_261B8B878()
{
  return MEMORY[0x270F86B08]();
}

uint64_t sub_261B8B888()
{
  return MEMORY[0x270F86B10]();
}

uint64_t sub_261B8B898()
{
  return MEMORY[0x270F86B18]();
}

uint64_t sub_261B8B8A8()
{
  return MEMORY[0x270F86B20]();
}

uint64_t sub_261B8B8B8()
{
  return MEMORY[0x270F86B28]();
}

uint64_t sub_261B8B8C8()
{
  return MEMORY[0x270F86B30]();
}

uint64_t sub_261B8B8D8()
{
  return MEMORY[0x270F86B38]();
}

uint64_t sub_261B8B8E8()
{
  return MEMORY[0x270F86B40]();
}

uint64_t sub_261B8B8F8()
{
  return MEMORY[0x270F86B48]();
}

uint64_t sub_261B8B908()
{
  return MEMORY[0x270F86B50]();
}

uint64_t sub_261B8B918()
{
  return MEMORY[0x270F86B58]();
}

uint64_t sub_261B8B928()
{
  return MEMORY[0x270F86B60]();
}

uint64_t sub_261B8B938()
{
  return MEMORY[0x270F86B68]();
}

uint64_t sub_261B8B948()
{
  return MEMORY[0x270F86B70]();
}

uint64_t sub_261B8B958()
{
  return MEMORY[0x270F86B78]();
}

uint64_t sub_261B8B968()
{
  return MEMORY[0x270F86B80]();
}

uint64_t sub_261B8B978()
{
  return MEMORY[0x270F86B88]();
}

uint64_t sub_261B8B988()
{
  return MEMORY[0x270F86B90]();
}

uint64_t sub_261B8B998()
{
  return MEMORY[0x270F86B98]();
}

uint64_t sub_261B8B9A8()
{
  return MEMORY[0x270F86BA0]();
}

uint64_t sub_261B8B9B8()
{
  return MEMORY[0x270F86BA8]();
}

uint64_t sub_261B8B9C8()
{
  return MEMORY[0x270F86BB0]();
}

uint64_t sub_261B8B9D8()
{
  return MEMORY[0x270F86BB8]();
}

uint64_t sub_261B8B9E8()
{
  return MEMORY[0x270F86BC0]();
}

uint64_t sub_261B8B9F8()
{
  return MEMORY[0x270F86BC8]();
}

uint64_t sub_261B8BA08()
{
  return MEMORY[0x270F86BD0]();
}

uint64_t sub_261B8BA18()
{
  return MEMORY[0x270F86BD8]();
}

uint64_t sub_261B8BA28()
{
  return MEMORY[0x270F86BE8]();
}

uint64_t sub_261B8BA38()
{
  return MEMORY[0x270F86BF0]();
}

uint64_t sub_261B8BA48()
{
  return MEMORY[0x270F86BF8]();
}

uint64_t sub_261B8BA58()
{
  return MEMORY[0x270F86C00]();
}

uint64_t sub_261B8BA68()
{
  return MEMORY[0x270F86C08]();
}

uint64_t sub_261B8BA78()
{
  return MEMORY[0x270F86C10]();
}

uint64_t sub_261B8BA88()
{
  return MEMORY[0x270F86C18]();
}

uint64_t sub_261B8BA98()
{
  return MEMORY[0x270F86C20]();
}

uint64_t sub_261B8BAA8()
{
  return MEMORY[0x270F86C28]();
}

uint64_t sub_261B8BAB8()
{
  return MEMORY[0x270F86C30]();
}

uint64_t sub_261B8BAC8()
{
  return MEMORY[0x270F86C38]();
}

uint64_t sub_261B8BAD8()
{
  return MEMORY[0x270F86C40]();
}

uint64_t sub_261B8BAE8()
{
  return MEMORY[0x270F86C48]();
}

uint64_t sub_261B8BAF8()
{
  return MEMORY[0x270F86C50]();
}

uint64_t sub_261B8BB08()
{
  return MEMORY[0x270F86C58]();
}

uint64_t sub_261B8BB18()
{
  return MEMORY[0x270F86C60]();
}

uint64_t sub_261B8BB28()
{
  return MEMORY[0x270F86C68]();
}

uint64_t sub_261B8BB38()
{
  return MEMORY[0x270F86C70]();
}

uint64_t sub_261B8BB48()
{
  return MEMORY[0x270F86C78]();
}

uint64_t sub_261B8BB58()
{
  return MEMORY[0x270F86C80]();
}

uint64_t sub_261B8BB68()
{
  return MEMORY[0x270F86C88]();
}

uint64_t sub_261B8BB78()
{
  return MEMORY[0x270F86C90]();
}

uint64_t sub_261B8BB88()
{
  return MEMORY[0x270F86C98]();
}

uint64_t sub_261B8BB98()
{
  return MEMORY[0x270F86CA0]();
}

uint64_t sub_261B8BBA8()
{
  return MEMORY[0x270F86CA8]();
}

uint64_t sub_261B8BBB8()
{
  return MEMORY[0x270F86CB0]();
}

uint64_t sub_261B8BBC8()
{
  return MEMORY[0x270F86CB8]();
}

uint64_t sub_261B8BBD8()
{
  return MEMORY[0x270F86CC0]();
}

uint64_t sub_261B8BBE8()
{
  return MEMORY[0x270F86CC8]();
}

uint64_t sub_261B8BBF8()
{
  return MEMORY[0x270F86CE0]();
}

uint64_t sub_261B8BC08()
{
  return MEMORY[0x270F86CE8]();
}

uint64_t sub_261B8BC18()
{
  return MEMORY[0x270F86CF0]();
}

uint64_t sub_261B8BC28()
{
  return MEMORY[0x270F86CF8]();
}

uint64_t sub_261B8BC38()
{
  return MEMORY[0x270F86D00]();
}

uint64_t sub_261B8BC48()
{
  return MEMORY[0x270F86D08]();
}

uint64_t sub_261B8BC58()
{
  return MEMORY[0x270F86D10]();
}

uint64_t sub_261B8BC68()
{
  return MEMORY[0x270F86D18]();
}

uint64_t sub_261B8BC78()
{
  return MEMORY[0x270F86D20]();
}

uint64_t sub_261B8BC88()
{
  return MEMORY[0x270F86D28]();
}

uint64_t sub_261B8BC98()
{
  return MEMORY[0x270F86D30]();
}

uint64_t sub_261B8BCA8()
{
  return MEMORY[0x270F86D38]();
}

uint64_t sub_261B8BCB8()
{
  return MEMORY[0x270F86D40]();
}

uint64_t sub_261B8BCC8()
{
  return MEMORY[0x270F86D48]();
}

uint64_t sub_261B8BCD8()
{
  return MEMORY[0x270F86D50]();
}

uint64_t sub_261B8BCE8()
{
  return MEMORY[0x270F86D58]();
}

uint64_t sub_261B8BCF8()
{
  return MEMORY[0x270F86D60]();
}

uint64_t sub_261B8BD08()
{
  return MEMORY[0x270F86D68]();
}

uint64_t sub_261B8BD18()
{
  return MEMORY[0x270F86D70]();
}

uint64_t sub_261B8BD28()
{
  return MEMORY[0x270F86D78]();
}

uint64_t sub_261B8BD38()
{
  return MEMORY[0x270F86D80]();
}

uint64_t sub_261B8BD48()
{
  return MEMORY[0x270F86D88]();
}

uint64_t sub_261B8BD58()
{
  return MEMORY[0x270F86D90]();
}

uint64_t sub_261B8BD68()
{
  return MEMORY[0x270F86D98]();
}

uint64_t sub_261B8BD78()
{
  return MEMORY[0x270F86DA0]();
}

uint64_t sub_261B8BD88()
{
  return MEMORY[0x270F86DA8]();
}

uint64_t sub_261B8BD98()
{
  return MEMORY[0x270F86DB0]();
}

uint64_t sub_261B8BDA8()
{
  return MEMORY[0x270F86DB8]();
}

uint64_t sub_261B8BDB8()
{
  return MEMORY[0x270F86DC0]();
}

uint64_t sub_261B8BDC8()
{
  return MEMORY[0x270F86DC8]();
}

uint64_t sub_261B8BDD8()
{
  return MEMORY[0x270F86DD0]();
}

uint64_t sub_261B8BDE8()
{
  return MEMORY[0x270F86DD8]();
}

uint64_t sub_261B8BDF8()
{
  return MEMORY[0x270F86DE0]();
}

uint64_t sub_261B8BE08()
{
  return MEMORY[0x270F86DE8]();
}

uint64_t sub_261B8BE18()
{
  return MEMORY[0x270F86DF0]();
}

uint64_t sub_261B8BE28()
{
  return MEMORY[0x270F86DF8]();
}

uint64_t sub_261B8BE38()
{
  return MEMORY[0x270F86E00]();
}

uint64_t sub_261B8BE48()
{
  return MEMORY[0x270F86E08]();
}

uint64_t sub_261B8BE58()
{
  return MEMORY[0x270F86E10]();
}

uint64_t sub_261B8BE68()
{
  return MEMORY[0x270F86E18]();
}

uint64_t sub_261B8BE78()
{
  return MEMORY[0x270F86E20]();
}

uint64_t sub_261B8BE88()
{
  return MEMORY[0x270F86E28]();
}

uint64_t sub_261B8BE98()
{
  return MEMORY[0x270F86E30]();
}

uint64_t sub_261B8BEA8()
{
  return MEMORY[0x270F86E38]();
}

uint64_t sub_261B8BEB8()
{
  return MEMORY[0x270F86E40]();
}

uint64_t sub_261B8BEC8()
{
  return MEMORY[0x270F86E48]();
}

uint64_t sub_261B8BED8()
{
  return MEMORY[0x270F86E50]();
}

uint64_t sub_261B8BEE8()
{
  return MEMORY[0x270F86E58]();
}

uint64_t sub_261B8BEF8()
{
  return MEMORY[0x270F86E60]();
}

uint64_t sub_261B8BF08()
{
  return MEMORY[0x270F86E68]();
}

uint64_t sub_261B8BF18()
{
  return MEMORY[0x270F86E70]();
}

uint64_t sub_261B8BF28()
{
  return MEMORY[0x270F86E78]();
}

uint64_t sub_261B8BF38()
{
  return MEMORY[0x270F86E80]();
}

uint64_t sub_261B8BF48()
{
  return MEMORY[0x270F86E88]();
}

uint64_t sub_261B8BF58()
{
  return MEMORY[0x270F86E90]();
}

uint64_t sub_261B8BF68()
{
  return MEMORY[0x270F86E98]();
}

uint64_t sub_261B8BF78()
{
  return MEMORY[0x270F86EA0]();
}

uint64_t sub_261B8BF88()
{
  return MEMORY[0x270F86EA8]();
}

uint64_t sub_261B8BF98()
{
  return MEMORY[0x270F86EB0]();
}

uint64_t sub_261B8BFA8()
{
  return MEMORY[0x270F86EB8]();
}

uint64_t sub_261B8BFB8()
{
  return MEMORY[0x270F86EC0]();
}

uint64_t sub_261B8BFC8()
{
  return MEMORY[0x270F86EC8]();
}

uint64_t sub_261B8BFD8()
{
  return MEMORY[0x270F86ED0]();
}

uint64_t sub_261B8BFE8()
{
  return MEMORY[0x270F86ED8]();
}

uint64_t sub_261B8BFF8()
{
  return MEMORY[0x270F86EE0]();
}

uint64_t sub_261B8C008()
{
  return MEMORY[0x270F86EE8]();
}

uint64_t sub_261B8C018()
{
  return MEMORY[0x270F86EF0]();
}

uint64_t sub_261B8C028()
{
  return MEMORY[0x270F86EF8]();
}

uint64_t sub_261B8C038()
{
  return MEMORY[0x270F86F00]();
}

uint64_t sub_261B8C048()
{
  return MEMORY[0x270F86F08]();
}

uint64_t sub_261B8C058()
{
  return MEMORY[0x270F86F10]();
}

uint64_t sub_261B8C068()
{
  return MEMORY[0x270F86F18]();
}

uint64_t sub_261B8C078()
{
  return MEMORY[0x270F86F20]();
}

uint64_t sub_261B8C088()
{
  return MEMORY[0x270F86F28]();
}

uint64_t sub_261B8C098()
{
  return MEMORY[0x270F86F30]();
}

uint64_t sub_261B8C0A8()
{
  return MEMORY[0x270F86F38]();
}

uint64_t sub_261B8C0B8()
{
  return MEMORY[0x270F86F40]();
}

uint64_t sub_261B8C0C8()
{
  return MEMORY[0x270F86F48]();
}

uint64_t sub_261B8C0D8()
{
  return MEMORY[0x270F86F50]();
}

uint64_t sub_261B8C0E8()
{
  return MEMORY[0x270F86F58]();
}

uint64_t sub_261B8C0F8()
{
  return MEMORY[0x270F86F60]();
}

uint64_t sub_261B8C108()
{
  return MEMORY[0x270F86F68]();
}

uint64_t sub_261B8C118()
{
  return MEMORY[0x270F86F70]();
}

uint64_t sub_261B8C128()
{
  return MEMORY[0x270F86F78]();
}

uint64_t sub_261B8C138()
{
  return MEMORY[0x270F86F80]();
}

uint64_t sub_261B8C148()
{
  return MEMORY[0x270F86F88]();
}

uint64_t sub_261B8C158()
{
  return MEMORY[0x270F86F90]();
}

uint64_t sub_261B8C168()
{
  return MEMORY[0x270F86F98]();
}

uint64_t sub_261B8C178()
{
  return MEMORY[0x270F86FA0]();
}

uint64_t sub_261B8C188()
{
  return MEMORY[0x270F86FA8]();
}

uint64_t sub_261B8C198()
{
  return MEMORY[0x270F86FB0]();
}

uint64_t sub_261B8C1A8()
{
  return MEMORY[0x270F86FB8]();
}

uint64_t sub_261B8C1B8()
{
  return MEMORY[0x270F86FC0]();
}

uint64_t sub_261B8C1C8()
{
  return MEMORY[0x270F86FC8]();
}

uint64_t sub_261B8C1D8()
{
  return MEMORY[0x270F86FD0]();
}

uint64_t sub_261B8C1E8()
{
  return MEMORY[0x270F86FD8]();
}

uint64_t sub_261B8C1F8()
{
  return MEMORY[0x270F86FE0]();
}

uint64_t sub_261B8C208()
{
  return MEMORY[0x270F86FE8]();
}

uint64_t sub_261B8C218()
{
  return MEMORY[0x270F86FF0]();
}

uint64_t sub_261B8C228()
{
  return MEMORY[0x270F86FF8]();
}

uint64_t sub_261B8C238()
{
  return MEMORY[0x270F87000]();
}

uint64_t sub_261B8C248()
{
  return MEMORY[0x270F87008]();
}

uint64_t sub_261B8C258()
{
  return MEMORY[0x270F87010]();
}

uint64_t sub_261B8C268()
{
  return MEMORY[0x270F87018]();
}

uint64_t sub_261B8C278()
{
  return MEMORY[0x270F87020]();
}

uint64_t sub_261B8C288()
{
  return MEMORY[0x270F87028]();
}

uint64_t sub_261B8C298()
{
  return MEMORY[0x270F87030]();
}

uint64_t sub_261B8C2A8()
{
  return MEMORY[0x270F87038]();
}

uint64_t sub_261B8C2B8()
{
  return MEMORY[0x270F87040]();
}

uint64_t sub_261B8C2C8()
{
  return MEMORY[0x270F87048]();
}

uint64_t sub_261B8C2D8()
{
  return MEMORY[0x270F87050]();
}

uint64_t sub_261B8C2E8()
{
  return MEMORY[0x270F87058]();
}

uint64_t sub_261B8C2F8()
{
  return MEMORY[0x270F87060]();
}

uint64_t sub_261B8C308()
{
  return MEMORY[0x270F87068]();
}

uint64_t sub_261B8C318()
{
  return MEMORY[0x270F87070]();
}

uint64_t sub_261B8C328()
{
  return MEMORY[0x270F87078]();
}

uint64_t sub_261B8C338()
{
  return MEMORY[0x270F87080]();
}

uint64_t sub_261B8C348()
{
  return MEMORY[0x270F87088]();
}

uint64_t sub_261B8C358()
{
  return MEMORY[0x270F87090]();
}

uint64_t sub_261B8C368()
{
  return MEMORY[0x270F87098]();
}

uint64_t sub_261B8C378()
{
  return MEMORY[0x270F870A0]();
}

uint64_t sub_261B8C388()
{
  return MEMORY[0x270F870A8]();
}

uint64_t sub_261B8C398()
{
  return MEMORY[0x270F870B0]();
}

uint64_t sub_261B8C3A8()
{
  return MEMORY[0x270F870B8]();
}

uint64_t sub_261B8C3B8()
{
  return MEMORY[0x270F870C0]();
}

uint64_t sub_261B8C3C8()
{
  return MEMORY[0x270F870C8]();
}

uint64_t sub_261B8C3D8()
{
  return MEMORY[0x270F870D0]();
}

uint64_t sub_261B8C3E8()
{
  return MEMORY[0x270F870D8]();
}

uint64_t sub_261B8C3F8()
{
  return MEMORY[0x270F870E0]();
}

uint64_t sub_261B8C408()
{
  return MEMORY[0x270F870E8]();
}

uint64_t sub_261B8C418()
{
  return MEMORY[0x270F870F0]();
}

uint64_t sub_261B8C428()
{
  return MEMORY[0x270F870F8]();
}

uint64_t sub_261B8C438()
{
  return MEMORY[0x270F87100]();
}

uint64_t sub_261B8C448()
{
  return MEMORY[0x270F87108]();
}

uint64_t sub_261B8C458()
{
  return MEMORY[0x270F87110]();
}

uint64_t sub_261B8C468()
{
  return MEMORY[0x270F87118]();
}

uint64_t sub_261B8C478()
{
  return MEMORY[0x270F87120]();
}

uint64_t sub_261B8C488()
{
  return MEMORY[0x270F87128]();
}

uint64_t sub_261B8C498()
{
  return MEMORY[0x270F87130]();
}

uint64_t sub_261B8C4A8()
{
  return MEMORY[0x270F87138]();
}

uint64_t sub_261B8C4B8()
{
  return MEMORY[0x270F87140]();
}

uint64_t sub_261B8C4C8()
{
  return MEMORY[0x270F87148]();
}

uint64_t sub_261B8C4D8()
{
  return MEMORY[0x270F87150]();
}

uint64_t sub_261B8C4E8()
{
  return MEMORY[0x270F87158]();
}

uint64_t sub_261B8C4F8()
{
  return MEMORY[0x270F87160]();
}

uint64_t sub_261B8C508()
{
  return MEMORY[0x270F87168]();
}

uint64_t sub_261B8C518()
{
  return MEMORY[0x270F87170]();
}

uint64_t sub_261B8C528()
{
  return MEMORY[0x270F87178]();
}

uint64_t sub_261B8C538()
{
  return MEMORY[0x270F87180]();
}

uint64_t sub_261B8C548()
{
  return MEMORY[0x270F87188]();
}

uint64_t sub_261B8C558()
{
  return MEMORY[0x270F87190]();
}

uint64_t sub_261B8C568()
{
  return MEMORY[0x270F87198]();
}

uint64_t sub_261B8C578()
{
  return MEMORY[0x270F871A0]();
}

uint64_t sub_261B8C588()
{
  return MEMORY[0x270F871A8]();
}

uint64_t sub_261B8C598()
{
  return MEMORY[0x270F871B0]();
}

uint64_t sub_261B8C5A8()
{
  return MEMORY[0x270F871B8]();
}

uint64_t sub_261B8C5B8()
{
  return MEMORY[0x270F871C0]();
}

uint64_t sub_261B8C5C8()
{
  return MEMORY[0x270F871C8]();
}

uint64_t sub_261B8C5D8()
{
  return MEMORY[0x270F871D0]();
}

uint64_t sub_261B8C5E8()
{
  return MEMORY[0x270F871D8]();
}

uint64_t sub_261B8C5F8()
{
  return MEMORY[0x270F871E0]();
}

uint64_t sub_261B8C608()
{
  return MEMORY[0x270F871E8]();
}

uint64_t sub_261B8C618()
{
  return MEMORY[0x270F871F0]();
}

uint64_t sub_261B8C628()
{
  return MEMORY[0x270F871F8]();
}

uint64_t sub_261B8C638()
{
  return MEMORY[0x270F87200]();
}

uint64_t sub_261B8C648()
{
  return MEMORY[0x270F87208]();
}

uint64_t sub_261B8C658()
{
  return MEMORY[0x270F87210]();
}

uint64_t sub_261B8C668()
{
  return MEMORY[0x270F87218]();
}

uint64_t sub_261B8C678()
{
  return MEMORY[0x270F87220]();
}

uint64_t sub_261B8C688()
{
  return MEMORY[0x270F87228]();
}

uint64_t sub_261B8C698()
{
  return MEMORY[0x270F87230]();
}

uint64_t sub_261B8C6A8()
{
  return MEMORY[0x270F87238]();
}

uint64_t sub_261B8C6B8()
{
  return MEMORY[0x270F87240]();
}

uint64_t sub_261B8C6C8()
{
  return MEMORY[0x270F87248]();
}

uint64_t sub_261B8C6D8()
{
  return MEMORY[0x270F87250]();
}

uint64_t sub_261B8C6E8()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_261B8C6F8()
{
  return MEMORY[0x270F62298]();
}

uint64_t sub_261B8C708()
{
  return MEMORY[0x270F622A0]();
}

uint64_t sub_261B8C718()
{
  return MEMORY[0x270F622B0]();
}

uint64_t sub_261B8C728()
{
  return MEMORY[0x270F622F0]();
}

uint64_t sub_261B8C738()
{
  return MEMORY[0x270F622F8]();
}

uint64_t sub_261B8C748()
{
  return MEMORY[0x270F62300]();
}

uint64_t sub_261B8C758()
{
  return MEMORY[0x270F62308]();
}

uint64_t sub_261B8C768()
{
  return MEMORY[0x270F62310]();
}

uint64_t sub_261B8C778()
{
  return MEMORY[0x270F62318]();
}

uint64_t sub_261B8C788()
{
  return MEMORY[0x270F62320]();
}

uint64_t sub_261B8C798()
{
  return MEMORY[0x270F62328]();
}

uint64_t sub_261B8C7A8()
{
  return MEMORY[0x270F62330]();
}

uint64_t sub_261B8C7B8()
{
  return MEMORY[0x270F62338]();
}

uint64_t sub_261B8C7C8()
{
  return MEMORY[0x270F62420]();
}

uint64_t sub_261B8C7D8()
{
  return MEMORY[0x270F62428]();
}

uint64_t sub_261B8C7E8()
{
  return MEMORY[0x270F62530]();
}

uint64_t sub_261B8C7F8()
{
  return MEMORY[0x270F62538]();
}

uint64_t sub_261B8C808()
{
  return MEMORY[0x270F62590]();
}

uint64_t sub_261B8C818()
{
  return MEMORY[0x270F62598]();
}

uint64_t sub_261B8C828()
{
  return MEMORY[0x270F625E8]();
}

uint64_t sub_261B8C838()
{
  return MEMORY[0x270F62648]();
}

uint64_t sub_261B8C848()
{
  return MEMORY[0x270F62650]();
}

uint64_t sub_261B8C858()
{
  return MEMORY[0x270F62658]();
}

uint64_t sub_261B8C868()
{
  return MEMORY[0x270F62690]();
}

uint64_t sub_261B8C878()
{
  return MEMORY[0x270F62698]();
}

uint64_t sub_261B8C888()
{
  return MEMORY[0x270F62748]();
}

uint64_t sub_261B8C898()
{
  return MEMORY[0x270F62750]();
}

uint64_t sub_261B8C8A8()
{
  return MEMORY[0x270F628C8]();
}

uint64_t sub_261B8C8B8()
{
  return MEMORY[0x270F628D0]();
}

uint64_t sub_261B8C8C8()
{
  return MEMORY[0x270F628D8]();
}

uint64_t sub_261B8C8D8()
{
  return MEMORY[0x270F62968]();
}

uint64_t sub_261B8C8E8()
{
  return MEMORY[0x270F62970]();
}

uint64_t sub_261B8C8F8()
{
  return MEMORY[0x270F62AB0]();
}

uint64_t sub_261B8C908()
{
  return MEMORY[0x270F62AB8]();
}

uint64_t sub_261B8C918()
{
  return MEMORY[0x270F62B20]();
}

uint64_t sub_261B8C928()
{
  return MEMORY[0x270F62B28]();
}

uint64_t sub_261B8C938()
{
  return MEMORY[0x270F31150]();
}

uint64_t sub_261B8C948()
{
  return MEMORY[0x270F31158]();
}

uint64_t sub_261B8C958()
{
  return MEMORY[0x270F31160]();
}

uint64_t sub_261B8C968()
{
  return MEMORY[0x270F31168]();
}

uint64_t sub_261B8C978()
{
  return MEMORY[0x270F31170]();
}

uint64_t sub_261B8C988()
{
  return MEMORY[0x270F31178]();
}

uint64_t sub_261B8C998()
{
  return MEMORY[0x270F31188]();
}

uint64_t sub_261B8C9A8()
{
  return MEMORY[0x270F31190]();
}

uint64_t sub_261B8C9B8()
{
  return MEMORY[0x270F311A0]();
}

uint64_t sub_261B8C9C8()
{
  return MEMORY[0x270F311A8]();
}

uint64_t sub_261B8C9D8()
{
  return MEMORY[0x270F311B0]();
}

uint64_t sub_261B8C9E8()
{
  return MEMORY[0x270F311C0]();
}

uint64_t sub_261B8C9F8()
{
  return MEMORY[0x270F311C8]();
}

uint64_t sub_261B8CA08()
{
  return MEMORY[0x270F311D0]();
}

uint64_t sub_261B8CA18()
{
  return MEMORY[0x270F312B0]();
}

uint64_t sub_261B8CA28()
{
  return MEMORY[0x270F31350]();
}

uint64_t sub_261B8CA38()
{
  return MEMORY[0x270F313D0]();
}

uint64_t sub_261B8CA48()
{
  return MEMORY[0x270F313D8]();
}

uint64_t sub_261B8CA58()
{
  return MEMORY[0x270F313E0]();
}

uint64_t sub_261B8CA68()
{
  return MEMORY[0x270F313E8]();
}

uint64_t sub_261B8CA78()
{
  return MEMORY[0x270F313F0]();
}

uint64_t sub_261B8CA88()
{
  return MEMORY[0x270F313F8]();
}

uint64_t sub_261B8CA98()
{
  return MEMORY[0x270F31400]();
}

uint64_t sub_261B8CAA8()
{
  return MEMORY[0x270F31408]();
}

uint64_t sub_261B8CAB8()
{
  return MEMORY[0x270F31410]();
}

uint64_t sub_261B8CAC8()
{
  return MEMORY[0x270F31418]();
}

uint64_t sub_261B8CAD8()
{
  return MEMORY[0x270F31420]();
}

uint64_t sub_261B8CAE8()
{
  return MEMORY[0x270F31428]();
}

uint64_t sub_261B8CAF8()
{
  return MEMORY[0x270F31438]();
}

uint64_t sub_261B8CB08()
{
  return MEMORY[0x270F31440]();
}

uint64_t sub_261B8CB18()
{
  return MEMORY[0x270F31448]();
}

uint64_t sub_261B8CB28()
{
  return MEMORY[0x270F31450]();
}

uint64_t sub_261B8CB38()
{
  return MEMORY[0x270F31458]();
}

uint64_t sub_261B8CB48()
{
  return MEMORY[0x270F31478]();
}

uint64_t sub_261B8CB58()
{
  return MEMORY[0x270F31500]();
}

uint64_t sub_261B8CB68()
{
  return MEMORY[0x270F315B8]();
}

uint64_t sub_261B8CB78()
{
  return MEMORY[0x270F31608]();
}

uint64_t sub_261B8CB98()
{
  return MEMORY[0x270F31648]();
}

uint64_t sub_261B8CBA8()
{
  return MEMORY[0x270F31650]();
}

uint64_t sub_261B8CBB8()
{
  return MEMORY[0x270F31658]();
}

uint64_t sub_261B8CBC8()
{
  return MEMORY[0x270F316E8]();
}

uint64_t sub_261B8CBD8()
{
  return MEMORY[0x270F316F0]();
}

uint64_t sub_261B8CBE8()
{
  return MEMORY[0x270F316F8]();
}

uint64_t sub_261B8CBF8()
{
  return MEMORY[0x270F31700]();
}

uint64_t sub_261B8CC08()
{
  return MEMORY[0x270F5D5E0]();
}

uint64_t sub_261B8CC18()
{
  return MEMORY[0x270F5D870]();
}

uint64_t sub_261B8CC28()
{
  return MEMORY[0x270F5D8B0]();
}

uint64_t sub_261B8CC38()
{
  return MEMORY[0x270F5D938]();
}

uint64_t sub_261B8CC48()
{
  return MEMORY[0x270F5D950]();
}

uint64_t sub_261B8CC58()
{
  return MEMORY[0x270F5DA08]();
}

uint64_t sub_261B8CC68()
{
  return MEMORY[0x270F5DB18]();
}

uint64_t sub_261B8CC78()
{
  return MEMORY[0x270F5DBC0]();
}

uint64_t sub_261B8CC88()
{
  return MEMORY[0x270F5DBC8]();
}

uint64_t sub_261B8CC98()
{
  return MEMORY[0x270F5DBE0]();
}

uint64_t sub_261B8CCA8()
{
  return MEMORY[0x270F5DC70]();
}

uint64_t sub_261B8CCB8()
{
  return MEMORY[0x270F5DD50]();
}

uint64_t sub_261B8CCC8()
{
  return MEMORY[0x270F5DD58]();
}

uint64_t sub_261B8CCD8()
{
  return MEMORY[0x270F5DF58]();
}

uint64_t sub_261B8CCE8()
{
  return MEMORY[0x270F5DF60]();
}

uint64_t sub_261B8CCF8()
{
  return MEMORY[0x270F5DFB0]();
}

uint64_t sub_261B8CD08()
{
  return MEMORY[0x270F5DFC0]();
}

uint64_t sub_261B8CD18()
{
  return MEMORY[0x270F5DFE8]();
}

uint64_t sub_261B8CD28()
{
  return MEMORY[0x270F5DFF0]();
}

uint64_t sub_261B8CD38()
{
  return MEMORY[0x270F5DFF8]();
}

uint64_t sub_261B8CD48()
{
  return MEMORY[0x270F5E020]();
}

uint64_t sub_261B8CD58()
{
  return MEMORY[0x270F5E0E0]();
}

uint64_t sub_261B8CD68()
{
  return MEMORY[0x270F5E0E8]();
}

uint64_t sub_261B8CD78()
{
  return MEMORY[0x270F5E110]();
}

uint64_t sub_261B8CD88()
{
  return MEMORY[0x270F5E118]();
}

uint64_t sub_261B8CD98()
{
  return MEMORY[0x270F5E168]();
}

uint64_t sub_261B8CDA8()
{
  return MEMORY[0x270F5E5B8]();
}

uint64_t sub_261B8CDB8()
{
  return MEMORY[0x270F5E5C0]();
}

uint64_t sub_261B8CDC8()
{
  return MEMORY[0x270F5E5E0]();
}

uint64_t sub_261B8CDD8()
{
  return MEMORY[0x270F5E5E8]();
}

uint64_t sub_261B8CDE8()
{
  return MEMORY[0x270F5E5F0]();
}

uint64_t sub_261B8CDF8()
{
  return MEMORY[0x270F5E5F8]();
}

uint64_t sub_261B8CE08()
{
  return MEMORY[0x270F5E668]();
}

uint64_t sub_261B8CE18()
{
  return MEMORY[0x270F5E670]();
}

uint64_t sub_261B8CE28()
{
  return MEMORY[0x270F318F0]();
}

uint64_t sub_261B8CE38()
{
  return MEMORY[0x270F318F8]();
}

uint64_t sub_261B8CE48()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_261B8CE58()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_261B8CE68()
{
  return MEMORY[0x270F31848]();
}

uint64_t sub_261B8CE78()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_261B8CE88()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_261B8CE98()
{
  return MEMORY[0x270EE2B40]();
}

uint64_t sub_261B8CEA8()
{
  return MEMORY[0x270EE2B48]();
}

uint64_t sub_261B8CEB8()
{
  return MEMORY[0x270EE2B60]();
}

uint64_t sub_261B8CEC8()
{
  return MEMORY[0x270EE2B68]();
}

uint64_t sub_261B8CED8()
{
  return MEMORY[0x270EE2B70]();
}

uint64_t sub_261B8CEE8()
{
  return MEMORY[0x270EE2B78]();
}

uint64_t sub_261B8CEF8()
{
  return MEMORY[0x270EE2B90]();
}

uint64_t sub_261B8CF08()
{
  return MEMORY[0x270EE2B98]();
}

uint64_t sub_261B8CF18()
{
  return MEMORY[0x270EE2BA8]();
}

uint64_t sub_261B8CF28()
{
  return MEMORY[0x270EE2BB0]();
}

uint64_t sub_261B8CF38()
{
  return MEMORY[0x270EE2BB8]();
}

uint64_t sub_261B8CF48()
{
  return MEMORY[0x270EE2BD0]();
}

uint64_t sub_261B8CF58()
{
  return MEMORY[0x270EE2BE0]();
}

uint64_t sub_261B8CF68()
{
  return MEMORY[0x270EE2BE8]();
}

uint64_t sub_261B8CF78()
{
  return MEMORY[0x270EE2BF0]();
}

uint64_t sub_261B8CF88()
{
  return MEMORY[0x270EE2C08]();
}

uint64_t sub_261B8CF98()
{
  return MEMORY[0x270EE2C10]();
}

uint64_t sub_261B8CFA8()
{
  return MEMORY[0x270EE2C38]();
}

uint64_t sub_261B8CFB8()
{
  return MEMORY[0x270EE2C40]();
}

uint64_t sub_261B8CFC8()
{
  return MEMORY[0x270EE2C50]();
}

uint64_t sub_261B8CFD8()
{
  return MEMORY[0x270EE2C58]();
}

uint64_t sub_261B8CFE8()
{
  return MEMORY[0x270EE2C70]();
}

uint64_t sub_261B8CFF8()
{
  return MEMORY[0x270EE2C78]();
}

uint64_t sub_261B8D008()
{
  return MEMORY[0x270EE2C90]();
}

uint64_t sub_261B8D018()
{
  return MEMORY[0x270EE2C98]();
}

uint64_t sub_261B8D028()
{
  return MEMORY[0x270EE2CA0]();
}

uint64_t sub_261B8D038()
{
  return MEMORY[0x270EE2CC0]();
}

uint64_t sub_261B8D048()
{
  return MEMORY[0x270EE2CC8]();
}

uint64_t sub_261B8D058()
{
  return MEMORY[0x270EE2CD0]();
}

uint64_t sub_261B8D068()
{
  return MEMORY[0x270EE2CD8]();
}

uint64_t sub_261B8D078()
{
  return MEMORY[0x270EE2CE0]();
}

uint64_t sub_261B8D088()
{
  return MEMORY[0x270EE2D20]();
}

uint64_t sub_261B8D098()
{
  return MEMORY[0x270EE2D28]();
}

uint64_t sub_261B8D0A8()
{
  return MEMORY[0x270EE2D88]();
}

uint64_t sub_261B8D0B8()
{
  return MEMORY[0x270EE2D90]();
}

uint64_t sub_261B8D0C8()
{
  return MEMORY[0x270EE2DD8]();
}

uint64_t sub_261B8D0D8()
{
  return MEMORY[0x270EE2DE0]();
}

uint64_t sub_261B8D0E8()
{
  return MEMORY[0x270EE2E00]();
}

uint64_t sub_261B8D0F8()
{
  return MEMORY[0x270EE2E08]();
}

uint64_t sub_261B8D108()
{
  return MEMORY[0x270EE2E48]();
}

uint64_t sub_261B8D118()
{
  return MEMORY[0x270EE2E50]();
}

uint64_t sub_261B8D128()
{
  return MEMORY[0x270EE2E58]();
}

uint64_t sub_261B8D138()
{
  return MEMORY[0x270EE2EC8]();
}

uint64_t sub_261B8D148()
{
  return MEMORY[0x270EE2ED0]();
}

uint64_t sub_261B8D158()
{
  return MEMORY[0x270EE2ED8]();
}

uint64_t sub_261B8D168()
{
  return MEMORY[0x270EE2EE8]();
}

uint64_t sub_261B8D178()
{
  return MEMORY[0x270EE2F00]();
}

uint64_t sub_261B8D188()
{
  return MEMORY[0x270EE2F08]();
}

uint64_t sub_261B8D198()
{
  return MEMORY[0x270EE2F20]();
}

uint64_t sub_261B8D1A8()
{
  return MEMORY[0x270EE2F30]();
}

uint64_t sub_261B8D1B8()
{
  return MEMORY[0x270EE2F38]();
}

uint64_t sub_261B8D1C8()
{
  return MEMORY[0x270EE2F40]();
}

uint64_t sub_261B8D1D8()
{
  return MEMORY[0x270EE2F48]();
}

uint64_t sub_261B8D1E8()
{
  return MEMORY[0x270EE2F50]();
}

uint64_t sub_261B8D1F8()
{
  return MEMORY[0x270EE2F70]();
}

uint64_t sub_261B8D208()
{
  return MEMORY[0x270EE2F78]();
}

uint64_t sub_261B8D218()
{
  return MEMORY[0x270EE2F88]();
}

uint64_t sub_261B8D228()
{
  return MEMORY[0x270EE2F90]();
}

uint64_t sub_261B8D238()
{
  return MEMORY[0x270EE2F98]();
}

uint64_t sub_261B8D248()
{
  return MEMORY[0x270EE2FA0]();
}

uint64_t sub_261B8D258()
{
  return MEMORY[0x270EE2FA8]();
}

uint64_t sub_261B8D268()
{
  return MEMORY[0x270EE2FC0]();
}

uint64_t sub_261B8D278()
{
  return MEMORY[0x270EE2FD8]();
}

uint64_t sub_261B8D288()
{
  return MEMORY[0x270EE2FF0]();
}

uint64_t sub_261B8D298()
{
  return MEMORY[0x270EE2FF8]();
}

uint64_t sub_261B8D2A8()
{
  return MEMORY[0x270EE3008]();
}

uint64_t sub_261B8D2B8()
{
  return MEMORY[0x270EE3010]();
}

uint64_t sub_261B8D2C8()
{
  return MEMORY[0x270EE3020]();
}

uint64_t sub_261B8D2D8()
{
  return MEMORY[0x270EE3028]();
}

uint64_t sub_261B8D2E8()
{
  return MEMORY[0x270EE3030]();
}

uint64_t sub_261B8D2F8()
{
  return MEMORY[0x270EE3040]();
}

uint64_t sub_261B8D308()
{
  return MEMORY[0x270EE3048]();
}

uint64_t sub_261B8D318()
{
  return MEMORY[0x270EE3058]();
}

uint64_t sub_261B8D328()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_261B8D338()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_261B8D348()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_261B8D358()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_261B8D368()
{
  return MEMORY[0x270EFED80]();
}

uint64_t sub_261B8D378()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_261B8D388()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_261B8D398()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_261B8D3A8()
{
  return MEMORY[0x270EFEF58]();
}

uint64_t sub_261B8D3B8()
{
  return MEMORY[0x270EFEFA0]();
}

uint64_t sub_261B8D3C8()
{
  return MEMORY[0x270EFEFB8]();
}

uint64_t sub_261B8D3D8()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_261B8D3E8()
{
  return MEMORY[0x270EFF008]();
}

uint64_t sub_261B8D3F8()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_261B8D408()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_261B8D418()
{
  return MEMORY[0x270EFF1D8]();
}

uint64_t sub_261B8D428()
{
  return MEMORY[0x270EFF390]();
}

uint64_t sub_261B8D438()
{
  return MEMORY[0x270EFF3F8]();
}

uint64_t sub_261B8D448()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_261B8D458()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_261B8D468()
{
  return MEMORY[0x270EFF4A8]();
}

uint64_t sub_261B8D478()
{
  return MEMORY[0x270EFF4B8]();
}

uint64_t sub_261B8D488()
{
  return MEMORY[0x270EFF4C8]();
}

uint64_t sub_261B8D498()
{
  return MEMORY[0x270EFF4F0]();
}

uint64_t sub_261B8D4A8()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_261B8D4B8()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_261B8D4C8()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_261B8D4D8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_261B8D4E8()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_261B8D4F8()
{
  return MEMORY[0x270EFF648]();
}

uint64_t sub_261B8D508()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_261B8D518()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_261B8D528()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_261B8D538()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_261B8D548()
{
  return MEMORY[0x270EFF710]();
}

uint64_t sub_261B8D558()
{
  return MEMORY[0x270EFF728]();
}

uint64_t sub_261B8D568()
{
  return MEMORY[0x270EFF748]();
}

uint64_t sub_261B8D578()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_261B8D588()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_261B8D598()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_261B8D5A8()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_261B8D5C8()
{
  return MEMORY[0x270EFFA60]();
}

uint64_t sub_261B8D5D8()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_261B8D5E8()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_261B8D608()
{
  return MEMORY[0x270EFFD10]();
}

uint64_t sub_261B8D618()
{
  return MEMORY[0x270EFFD18]();
}

uint64_t sub_261B8D628()
{
  return MEMORY[0x270EFFD48]();
}

uint64_t sub_261B8D638()
{
  return MEMORY[0x270EFFD60]();
}

uint64_t sub_261B8D648()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_261B8D658()
{
  return MEMORY[0x270F00050]();
}

uint64_t sub_261B8D668()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_261B8D678()
{
  return MEMORY[0x270F00138]();
}

uint64_t sub_261B8D688()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_261B8D698()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_261B8D6A8()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_261B8D6B8()
{
  return MEMORY[0x270F00230]();
}

uint64_t sub_261B8D6C8()
{
  return MEMORY[0x270F00298]();
}

uint64_t sub_261B8D6D8()
{
  return MEMORY[0x270F002C8]();
}

uint64_t sub_261B8D6E8()
{
  return MEMORY[0x270F00470]();
}

uint64_t sub_261B8D6F8()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_261B8D708()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_261B8D718()
{
  return MEMORY[0x270F00548]();
}

uint64_t sub_261B8D728()
{
  return MEMORY[0x270F00578]();
}

uint64_t sub_261B8D738()
{
  return MEMORY[0x270F00590]();
}

uint64_t sub_261B8D748()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_261B8D758()
{
  return MEMORY[0x270F00620]();
}

uint64_t sub_261B8D768()
{
  return MEMORY[0x270F00670]();
}

uint64_t sub_261B8D778()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_261B8D788()
{
  return MEMORY[0x270F006C8]();
}

uint64_t sub_261B8D798()
{
  return MEMORY[0x270F006F0]();
}

uint64_t sub_261B8D7A8()
{
  return MEMORY[0x270F007D8]();
}

uint64_t sub_261B8D7B8()
{
  return MEMORY[0x270F007E0]();
}

uint64_t sub_261B8D7C8()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_261B8D7D8()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_261B8D7E8()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_261B8D7F8()
{
  return MEMORY[0x270F008F0]();
}

uint64_t sub_261B8D808()
{
  return MEMORY[0x270F00908]();
}

uint64_t sub_261B8D818()
{
  return MEMORY[0x270F00910]();
}

uint64_t sub_261B8D828()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_261B8D838()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_261B8D848()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_261B8D858()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_261B8D868()
{
  return MEMORY[0x270F00A78]();
}

uint64_t sub_261B8D878()
{
  return MEMORY[0x270F00A88]();
}

uint64_t sub_261B8D888()
{
  return MEMORY[0x270F00AA8]();
}

uint64_t sub_261B8D898()
{
  return MEMORY[0x270F00AB0]();
}

uint64_t sub_261B8D8A8()
{
  return MEMORY[0x270F00AC8]();
}

uint64_t sub_261B8D8B8()
{
  return MEMORY[0x270F00AF0]();
}

uint64_t sub_261B8D8C8()
{
  return MEMORY[0x270F00AF8]();
}

uint64_t sub_261B8D8D8()
{
  return MEMORY[0x270F00B28]();
}

uint64_t sub_261B8D8E8()
{
  return MEMORY[0x270F00B30]();
}

uint64_t sub_261B8D8F8()
{
  return MEMORY[0x270F00B50]();
}

uint64_t sub_261B8D908()
{
  return MEMORY[0x270F00B58]();
}

uint64_t sub_261B8D918()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_261B8D928()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_261B8D938()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_261B8D948()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_261B8D958()
{
  return MEMORY[0x270F00C48]();
}

uint64_t sub_261B8D968()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_261B8D978()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_261B8D988()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_261B8D998()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_261B8D9A8()
{
  return MEMORY[0x270F00DA8]();
}

uint64_t sub_261B8D9B8()
{
  return MEMORY[0x270F00DB8]();
}

uint64_t sub_261B8D9C8()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_261B8D9D8()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_261B8D9E8()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_261B8D9F8()
{
  return MEMORY[0x270F07370]();
}

uint64_t sub_261B8DA08()
{
  return MEMORY[0x270F073D8]();
}

uint64_t sub_261B8DA18()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_261B8DA28()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_261B8DA38()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_261B8DA48()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_261B8DA58()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_261B8DA68()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_261B8DA78()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_261B8DA88()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_261B8DA98()
{
  return MEMORY[0x270F01028]();
}

uint64_t sub_261B8DAA8()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_261B8DAB8()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_261B8DAC8()
{
  return MEMORY[0x270F01060]();
}

uint64_t sub_261B8DAD8()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_261B8DAE8()
{
  return MEMORY[0x270F01130]();
}

uint64_t sub_261B8DAF8()
{
  return MEMORY[0x270F011A8]();
}

uint64_t sub_261B8DB08()
{
  return MEMORY[0x270F011B0]();
}

uint64_t sub_261B8DB18()
{
  return MEMORY[0x270F011B8]();
}

uint64_t sub_261B8DB28()
{
  return MEMORY[0x270F011D0]();
}

uint64_t sub_261B8DB38()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_261B8DB48()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_261B8DB58()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_261B8DB68()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_261B8DB78()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_261B8DB88()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_261B8DB98()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_261B8DBA8()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_261B8DBB8()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_261B8DBC8()
{
  return MEMORY[0x270F013F0]();
}

uint64_t sub_261B8DBD8()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_261B8DBE8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_261B8DBF8()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_261B8DC08()
{
  return MEMORY[0x270F01528]();
}

uint64_t sub_261B8DC18()
{
  return MEMORY[0x270F015D0]();
}

uint64_t sub_261B8DC28()
{
  return MEMORY[0x270F015F8]();
}

uint64_t sub_261B8DC38()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_261B8DC48()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_261B8DC58()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_261B8DC68()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_261B8DC78()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_261B8DC98()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_261B8DCA8()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_261B8DCB8()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_261B8DCC8()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_261B8DCD8()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_261B8DCE8()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_261B8DD08()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_261B8DD18()
{
  return MEMORY[0x270F073F8]();
}

uint64_t sub_261B8DD28()
{
  return MEMORY[0x270F07400]();
}

uint64_t sub_261B8DD38()
{
  return MEMORY[0x270F07408]();
}

uint64_t sub_261B8DD48()
{
  return MEMORY[0x270F07410]();
}

uint64_t sub_261B8DD58()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_261B8DD68()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_261B8DD78()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_261B8DD88()
{
  return MEMORY[0x270F018D8]();
}

uint64_t sub_261B8DD98()
{
  return MEMORY[0x270F01A28]();
}

uint64_t sub_261B8DDA8()
{
  return MEMORY[0x270F01A40]();
}

uint64_t sub_261B8DDB8()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_261B8DDC8()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_261B8DDD8()
{
  return MEMORY[0x270F01C20]();
}

uint64_t sub_261B8DDE8()
{
  return MEMORY[0x270F01C38]();
}

uint64_t sub_261B8DDF8()
{
  return MEMORY[0x270F01C40]();
}

uint64_t sub_261B8DE08()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_261B8DE18()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_261B8DE28()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_261B8DE38()
{
  return MEMORY[0x270F01F70]();
}

uint64_t sub_261B8DE48()
{
  return MEMORY[0x270F02180]();
}

uint64_t sub_261B8DE58()
{
  return MEMORY[0x270F02188]();
}

uint64_t sub_261B8DE68()
{
  return MEMORY[0x270F02258]();
}

uint64_t sub_261B8DE78()
{
  return MEMORY[0x270F02268]();
}

uint64_t sub_261B8DE88()
{
  return MEMORY[0x270F02270]();
}

uint64_t sub_261B8DE98()
{
  return MEMORY[0x270F02318]();
}

uint64_t sub_261B8DEA8()
{
  return MEMORY[0x270F02330]();
}

uint64_t sub_261B8DEB8()
{
  return MEMORY[0x270F02370]();
}

uint64_t sub_261B8DEC8()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_261B8DED8()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_261B8DEE8()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_261B8DEF8()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_261B8DF08()
{
  return MEMORY[0x270F07428]();
}

uint64_t sub_261B8DF18()
{
  return MEMORY[0x270F025F0]();
}

uint64_t sub_261B8DF28()
{
  return MEMORY[0x270F02758]();
}

uint64_t sub_261B8DF38()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_261B8DF48()
{
  return MEMORY[0x270F02938]();
}

uint64_t sub_261B8DF58()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_261B8DF68()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_261B8DF78()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_261B8DF88()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_261B8DF98()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_261B8DFA8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_261B8DFB8()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_261B8DFC8()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_261B8DFD8()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_261B8DFE8()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_261B8DFF8()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_261B8E008()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_261B8E018()
{
  return MEMORY[0x270F02AA8]();
}

uint64_t sub_261B8E028()
{
  return MEMORY[0x270F02AB8]();
}

uint64_t sub_261B8E038()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_261B8E048()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_261B8E058()
{
  return MEMORY[0x270F02AF0]();
}

uint64_t sub_261B8E068()
{
  return MEMORY[0x270F02AF8]();
}

uint64_t sub_261B8E078()
{
  return MEMORY[0x270F02B00]();
}

uint64_t sub_261B8E088()
{
  return MEMORY[0x270F02B08]();
}

uint64_t sub_261B8E098()
{
  return MEMORY[0x270F02B20]();
}

uint64_t sub_261B8E0A8()
{
  return MEMORY[0x270F02B28]();
}

uint64_t sub_261B8E0B8()
{
  return MEMORY[0x270F02B30]();
}

uint64_t sub_261B8E0C8()
{
  return MEMORY[0x270F02B38]();
}

uint64_t sub_261B8E0D8()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_261B8E0E8()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_261B8E0F8()
{
  return MEMORY[0x270F02B60]();
}

uint64_t sub_261B8E108()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_261B8E118()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_261B8E128()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_261B8E138()
{
  return MEMORY[0x270F02BE8]();
}

uint64_t sub_261B8E148()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_261B8E158()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_261B8E168()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_261B8E178()
{
  return MEMORY[0x270F02C38]();
}

uint64_t sub_261B8E188()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_261B8E198()
{
  return MEMORY[0x270F02C58]();
}

uint64_t sub_261B8E1A8()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_261B8E1B8()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_261B8E1C8()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_261B8E1D8()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_261B8E1E8()
{
  return MEMORY[0x270F02CA0]();
}

uint64_t sub_261B8E1F8()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_261B8E208()
{
  return MEMORY[0x270F02CE0]();
}

uint64_t sub_261B8E218()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_261B8E228()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_261B8E238()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_261B8E248()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_261B8E258()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_261B8E268()
{
  return MEMORY[0x270F02D38]();
}

uint64_t sub_261B8E278()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_261B8E288()
{
  return MEMORY[0x270F02DE8]();
}

uint64_t sub_261B8E298()
{
  return MEMORY[0x270F02E38]();
}

uint64_t sub_261B8E2A8()
{
  return MEMORY[0x270F02E88]();
}

uint64_t sub_261B8E2B8()
{
  return MEMORY[0x270F02EA8]();
}

uint64_t sub_261B8E2C8()
{
  return MEMORY[0x270F02EE8]();
}

uint64_t sub_261B8E2D8()
{
  return MEMORY[0x270F02EF0]();
}

uint64_t sub_261B8E2E8()
{
  return MEMORY[0x270F02F00]();
}

uint64_t sub_261B8E2F8()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_261B8E308()
{
  return MEMORY[0x270F02FD8]();
}

uint64_t sub_261B8E318()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_261B8E328()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_261B8E338()
{
  return MEMORY[0x270F03050]();
}

uint64_t sub_261B8E348()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_261B8E358()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_261B8E368()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_261B8E378()
{
  return MEMORY[0x270F030B8]();
}

uint64_t sub_261B8E388()
{
  return MEMORY[0x270F030C0]();
}

uint64_t sub_261B8E398()
{
  return MEMORY[0x270F030C8]();
}

uint64_t sub_261B8E3A8()
{
  return MEMORY[0x270F031F8]();
}

uint64_t sub_261B8E3B8()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_261B8E3C8()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_261B8E3D8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_261B8E3E8()
{
  return MEMORY[0x270EE3070]();
}

uint64_t sub_261B8E3F8()
{
  return MEMORY[0x270EE3078]();
}

uint64_t sub_261B8E408()
{
  return MEMORY[0x270EE3080]();
}

uint64_t sub_261B8E418()
{
  return MEMORY[0x270EE3088]();
}

uint64_t sub_261B8E428()
{
  return MEMORY[0x270EE3090]();
}

uint64_t sub_261B8E438()
{
  return MEMORY[0x270EE3098]();
}

uint64_t sub_261B8E448()
{
  return MEMORY[0x270EE30A0]();
}

uint64_t sub_261B8E458()
{
  return MEMORY[0x270EE30B0]();
}

uint64_t sub_261B8E468()
{
  return MEMORY[0x270EE30B8]();
}

uint64_t sub_261B8E478()
{
  return MEMORY[0x270EE30F8]();
}

uint64_t sub_261B8E488()
{
  return MEMORY[0x270F07438]();
}

uint64_t sub_261B8E498()
{
  return MEMORY[0x270F07458]();
}

uint64_t sub_261B8E4A8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_261B8E4B8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_261B8E4C8()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_261B8E4D8()
{
  return MEMORY[0x270F03318]();
}

uint64_t sub_261B8E4E8()
{
  return MEMORY[0x270F03358]();
}

uint64_t sub_261B8E4F8()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_261B8E508()
{
  return MEMORY[0x270F03408]();
}

uint64_t sub_261B8E518()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_261B8E528()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_261B8E538()
{
  return MEMORY[0x270F03578]();
}

uint64_t sub_261B8E548()
{
  return MEMORY[0x270F035A0]();
}

uint64_t sub_261B8E558()
{
  return MEMORY[0x270F035F0]();
}

uint64_t sub_261B8E568()
{
  return MEMORY[0x270F03630]();
}

uint64_t sub_261B8E578()
{
  return MEMORY[0x270F03638]();
}

uint64_t sub_261B8E588()
{
  return MEMORY[0x270F03648]();
}

uint64_t sub_261B8E598()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_261B8E5A8()
{
  return MEMORY[0x270F036C8]();
}

uint64_t sub_261B8E5B8()
{
  return MEMORY[0x270F03708]();
}

uint64_t sub_261B8E5C8()
{
  return MEMORY[0x270F03718]();
}

uint64_t sub_261B8E5D8()
{
  return MEMORY[0x270F03728]();
}

uint64_t sub_261B8E5E8()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_261B8E5F8()
{
  return MEMORY[0x270F037B0]();
}

uint64_t sub_261B8E608()
{
  return MEMORY[0x270F03828]();
}

uint64_t sub_261B8E618()
{
  return MEMORY[0x270F038D0]();
}

uint64_t sub_261B8E628()
{
  return MEMORY[0x270F03938]();
}

uint64_t sub_261B8E638()
{
  return MEMORY[0x270F03948]();
}

uint64_t sub_261B8E648()
{
  return MEMORY[0x270F03988]();
}

uint64_t sub_261B8E658()
{
  return MEMORY[0x270F03998]();
}

uint64_t sub_261B8E668()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_261B8E678()
{
  return MEMORY[0x270F03A38]();
}

uint64_t sub_261B8E688()
{
  return MEMORY[0x270F03A40]();
}

uint64_t sub_261B8E698()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_261B8E6A8()
{
  return MEMORY[0x270F03B18]();
}

uint64_t sub_261B8E6B8()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_261B8E6C8()
{
  return MEMORY[0x270F03C08]();
}

uint64_t sub_261B8E6D8()
{
  return MEMORY[0x270F03C28]();
}

uint64_t sub_261B8E6E8()
{
  return MEMORY[0x270F03C78]();
}

uint64_t sub_261B8E6F8()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_261B8E708()
{
  return MEMORY[0x270F03CE8]();
}

uint64_t sub_261B8E718()
{
  return MEMORY[0x270F03D40]();
}

uint64_t sub_261B8E728()
{
  return MEMORY[0x270F03E10]();
}

uint64_t sub_261B8E738()
{
  return MEMORY[0x270F03F00]();
}

uint64_t sub_261B8E748()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_261B8E758()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_261B8E768()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_261B8E778()
{
  return MEMORY[0x270F04038]();
}

uint64_t sub_261B8E788()
{
  return MEMORY[0x270F040B0]();
}

uint64_t sub_261B8E798()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_261B8E7A8()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_261B8E7B8()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_261B8E7C8()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_261B8E7D8()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_261B8E7E8()
{
  return MEMORY[0x270F041F8]();
}

uint64_t sub_261B8E7F8()
{
  return MEMORY[0x270F04218]();
}

uint64_t sub_261B8E808()
{
  return MEMORY[0x270F04230]();
}

uint64_t sub_261B8E818()
{
  return MEMORY[0x270F04260]();
}

uint64_t sub_261B8E828()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_261B8E838()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_261B8E848()
{
  return MEMORY[0x270F043C0]();
}

uint64_t sub_261B8E858()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_261B8E868()
{
  return MEMORY[0x270F04428]();
}

uint64_t sub_261B8E878()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_261B8E888()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_261B8E898()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_261B8E8A8()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_261B8E8B8()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_261B8E8C8()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_261B8E8D8()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_261B8E8E8()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_261B8E8F8()
{
  return MEMORY[0x270F045B8]();
}

uint64_t sub_261B8E908()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_261B8E918()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_261B8E928()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_261B8E938()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_261B8E948()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_261B8E958()
{
  return MEMORY[0x270F046D0]();
}

uint64_t sub_261B8E968()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_261B8E978()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_261B8E988()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_261B8E998()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_261B8E9C8()
{
  return MEMORY[0x270F047D8]();
}

uint64_t sub_261B8E9E8()
{
  return MEMORY[0x270F047E8]();
}

uint64_t sub_261B8EA08()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_261B8EA18()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_261B8EA28()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_261B8EA38()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_261B8EA48()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_261B8EA58()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_261B8EA68()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_261B8EA78()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_261B8EA88()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_261B8EA98()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_261B8EAA8()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_261B8EAB8()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_261B8EAC8()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_261B8EAD8()
{
  return MEMORY[0x270F04AE0]();
}

uint64_t sub_261B8EAE8()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_261B8EAF8()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_261B8EB08()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_261B8EB18()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_261B8EB28()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_261B8EB38()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_261B8EB48()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_261B8EB58()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_261B8EB68()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_261B8EB78()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_261B8EB88()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_261B8EB98()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_261B8EBA8()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_261B8EBB8()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_261B8EBC8()
{
  return MEMORY[0x270EE3100]();
}

uint64_t sub_261B8EBD8()
{
  return MEMORY[0x270EE3108]();
}

uint64_t sub_261B8EBE8()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_261B8EBF8()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_261B8EC08()
{
  return MEMORY[0x270F04CF0]();
}

uint64_t sub_261B8EC18()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_261B8EC28()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_261B8EC38()
{
  return MEMORY[0x270F04D90]();
}

uint64_t sub_261B8EC48()
{
  return MEMORY[0x270F04EC8]();
}

uint64_t sub_261B8EC58()
{
  return MEMORY[0x270F04ED8]();
}

uint64_t sub_261B8EC68()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_261B8EC78()
{
  return MEMORY[0x270F05030]();
}

uint64_t sub_261B8EC88()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_261B8EC98()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_261B8ECA8()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_261B8ECB8()
{
  return MEMORY[0x270F05118]();
}

uint64_t sub_261B8ECC8()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_261B8ECD8()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_261B8ECE8()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_261B8ECF8()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_261B8ED08()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_261B8ED18()
{
  return MEMORY[0x270F05380]();
}

uint64_t sub_261B8ED28()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_261B8ED38()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_261B8ED48()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_261B8ED58()
{
  return MEMORY[0x270F053D0]();
}

uint64_t sub_261B8ED68()
{
  return MEMORY[0x270F053D8]();
}

uint64_t sub_261B8ED78()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_261B8ED88()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_261B8ED98()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_261B8EDA8()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_261B8EDB8()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_261B8EDC8()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_261B8EDD8()
{
  return MEMORY[0x270F2CBF8]();
}

uint64_t sub_261B8EDE8()
{
  return MEMORY[0x270EF3158]();
}

uint64_t sub_261B8EDF8()
{
  return MEMORY[0x270EF31F8]();
}

uint64_t sub_261B8EE18()
{
  return MEMORY[0x270EF32C8]();
}

uint64_t sub_261B8EE28()
{
  return MEMORY[0x270EF32D0]();
}

uint64_t sub_261B8EE48()
{
  return MEMORY[0x270EF32E0]();
}

uint64_t sub_261B8EE58()
{
  return MEMORY[0x270EF32E8]();
}

uint64_t sub_261B8EE68()
{
  return MEMORY[0x270EF3328]();
}

uint64_t sub_261B8EE78()
{
  return MEMORY[0x270EF3338]();
}

uint64_t sub_261B8EE88()
{
  return MEMORY[0x270EF3348]();
}

uint64_t sub_261B8EE98()
{
  return MEMORY[0x270EF3350]();
}

uint64_t sub_261B8EEA8()
{
  return MEMORY[0x270EF3360]();
}

uint64_t sub_261B8EEB8()
{
  return MEMORY[0x270EF3388]();
}

uint64_t sub_261B8EEC8()
{
  return MEMORY[0x270EF3390]();
}

uint64_t sub_261B8EED8()
{
  return MEMORY[0x270F074A8]();
}

uint64_t sub_261B8EEE8()
{
  return MEMORY[0x270F07550]();
}

uint64_t sub_261B8EEF8()
{
  return MEMORY[0x270F07560]();
}

uint64_t sub_261B8EF08()
{
  return MEMORY[0x270F07568]();
}

uint64_t sub_261B8EF18()
{
  return MEMORY[0x270F07570]();
}

uint64_t sub_261B8EF28()
{
  return MEMORY[0x270F07578]();
}

uint64_t sub_261B8EF38()
{
  return MEMORY[0x270F07608]();
}

uint64_t sub_261B8EF48()
{
  return MEMORY[0x270F07698]();
}

uint64_t sub_261B8EF58()
{
  return MEMORY[0x270F076A0]();
}

uint64_t sub_261B8EF68()
{
  return MEMORY[0x270F076E8]();
}

uint64_t sub_261B8EF88()
{
  return MEMORY[0x270F07788]();
}

uint64_t sub_261B8EF98()
{
  return MEMORY[0x270F077A0]();
}

uint64_t sub_261B8EFA8()
{
  return MEMORY[0x270F077B8]();
}

uint64_t sub_261B8EFB8()
{
  return MEMORY[0x270F078C0]();
}

uint64_t sub_261B8EFC8()
{
  return MEMORY[0x270F079F0]();
}

uint64_t sub_261B8EFD8()
{
  return MEMORY[0x270EF1808]();
}

uint64_t sub_261B8EFE8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_261B8EFF8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_261B8F008()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_261B8F018()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_261B8F028()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_261B8F038()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_261B8F048()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_261B8F058()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_261B8F068()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_261B8F078()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_261B8F088()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_261B8F098()
{
  return MEMORY[0x270F9D550]();
}

uint64_t sub_261B8F0A8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_261B8F0B8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_261B8F0C8()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_261B8F0D8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_261B8F0E8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_261B8F0F8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_261B8F108()
{
  return MEMORY[0x270EF1A30]();
}

uint64_t sub_261B8F118()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_261B8F128()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_261B8F138()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_261B8F148()
{
  return MEMORY[0x270F87258]();
}

uint64_t sub_261B8F158()
{
  return MEMORY[0x270F87260]();
}

uint64_t sub_261B8F168()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_261B8F178()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_261B8F188()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_261B8F198()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_261B8F1A8()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_261B8F1B8()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_261B8F1C8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_261B8F1D8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_261B8F1E8()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_261B8F1F8()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_261B8F218()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_261B8F228()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_261B8F238()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_261B8F248()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_261B8F258()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_261B8F268()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_261B8F278()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_261B8F288()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_261B8F298()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_261B8F2A8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_261B8F2B8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_261B8F2C8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_261B8F2D8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_261B8F2E8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_261B8F2F8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_261B8F308()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_261B8F318()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_261B8F328()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_261B8F338()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_261B8F348()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_261B8F368()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_261B8F378()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_261B8F388()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_261B8F398()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_261B8F3A8()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_261B8F3B8()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_261B8F3D8()
{
  return MEMORY[0x270F87268]();
}

uint64_t sub_261B8F3E8()
{
  return MEMORY[0x270F87270]();
}

uint64_t sub_261B8F3F8()
{
  return MEMORY[0x270F87278]();
}

uint64_t sub_261B8F408()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_261B8F418()
{
  return MEMORY[0x270F9DD68]();
}

uint64_t sub_261B8F428()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_261B8F438()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_261B8F448()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_261B8F458()
{
  return MEMORY[0x270F62128]();
}

uint64_t sub_261B8F468()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_261B8F478()
{
  return MEMORY[0x270F07DB0]();
}

uint64_t sub_261B8F488()
{
  return MEMORY[0x270F07DB8]();
}

uint64_t sub_261B8F498()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_261B8F4A8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_261B8F4B8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_261B8F4C8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_261B8F4D8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_261B8F4E8()
{
  return MEMORY[0x270EF33F8]();
}

uint64_t sub_261B8F4F8()
{
  return MEMORY[0x270EE58B8]();
}

uint64_t sub_261B8F508()
{
  return MEMORY[0x270EE58C0]();
}

uint64_t sub_261B8F518()
{
  return MEMORY[0x270EE58D8]();
}

uint64_t sub_261B8F528()
{
  return MEMORY[0x270FA0C10]();
}

uint64_t sub_261B8F538()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_261B8F548()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_261B8F558()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_261B8F568()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_261B8F578()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_261B8F588()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_261B8F598()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t _sSo18_HKWorkoutGoalTypeV9WorkoutUIE23accessibilityIdentifierSSvg_0()
{
  return MEMORY[0x270F87280]();
}

uint64_t sub_261B8F5B8()
{
  return MEMORY[0x270EF1FD8]();
}

uint64_t sub_261B8F5C8()
{
  return MEMORY[0x270EF1FE8]();
}

uint64_t sub_261B8F5D8()
{
  return MEMORY[0x270EF1FF8]();
}

uint64_t sub_261B8F5E8()
{
  return MEMORY[0x270F87288]();
}

uint64_t sub_261B8F5F8()
{
  return MEMORY[0x270F87290]();
}

uint64_t sub_261B8F608()
{
  return MEMORY[0x270F87298]();
}

uint64_t sub_261B8F618()
{
  return MEMORY[0x270F872A0]();
}

uint64_t sub_261B8F628()
{
  return MEMORY[0x270F872A8]();
}

uint64_t sub_261B8F638()
{
  return MEMORY[0x270F872B0]();
}

uint64_t sub_261B8F648()
{
  return MEMORY[0x270F872B8]();
}

uint64_t sub_261B8F658()
{
  return MEMORY[0x270F872C0]();
}

uint64_t sub_261B8F668()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_261B8F678()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_261B8F688()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_261B8F698()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_261B8F6A8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_261B8F6B8()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_261B8F6C8()
{
  return MEMORY[0x270F62148]();
}

uint64_t sub_261B8F6D8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_261B8F6F8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_261B8F708()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_261B8F718()
{
  return MEMORY[0x270F9E570]();
}

uint64_t sub_261B8F728()
{
  return MEMORY[0x270F9E578]();
}

uint64_t sub_261B8F738()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_261B8F748()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_261B8F758()
{
  return MEMORY[0x270EF2458]();
}

uint64_t sub_261B8F768()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_261B8F778()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_261B8F788()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_261B8F798()
{
  return MEMORY[0x270EF25E0]();
}

uint64_t sub_261B8F7A8()
{
  return MEMORY[0x270EF25E8]();
}

uint64_t sub_261B8F7B8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_261B8F7D8()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_261B8F7E8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_261B8F7F8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_261B8F808()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_261B8F818()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_261B8F828()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_261B8F838()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_261B8F848()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_261B8F858()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_261B8F868()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_261B8F878()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_261B8F888()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_261B8F898()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_261B8F8A8()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_261B8F8B8()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_261B8F8C8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_261B8F8D8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_261B8F8E8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_261B8F8F8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_261B8F908()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_261B8F918()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_261B8F928()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_261B8F938()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_261B8F948()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_261B8F958()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_261B8F968()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_261B8F978()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_261B8F988()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_261B8F998()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_261B8F9A8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_261B8F9B8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_261B8F9C8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_261B8F9D8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_261B8F9E8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_261B8F9F8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_261B8FA08()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_261B8FA18()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_261B8FA38()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_261B8FA48()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_261B8FA58()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_261B8FA68()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_261B8FA78()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_261B8FA88()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_261B8FA98()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_261B8FAA8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_261B8FAB8()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_261B8FAC8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_261B8FAD8()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_261B8FAE8()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_261B8FAF8()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_261B8FB08()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_261B8FB18()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_261B8FB28()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_261B8FB38()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_261B8FB48()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_261B8FB58()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_261B8FB68()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_261B8FB78()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_261B8FB88()
{
  return MEMORY[0x270F9F750]();
}

uint64_t sub_261B8FB98()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_261B8FBA8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_261B8FBB8()
{
  return MEMORY[0x270F9FA28]();
}

uint64_t sub_261B8FBD8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_261B8FBE8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_261B8FBF8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_261B8FC08()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_261B8FC18()
{
  return MEMORY[0x270F62158]();
}

uint64_t sub_261B8FC28()
{
  return MEMORY[0x270F62160]();
}

uint64_t sub_261B8FC38()
{
  return MEMORY[0x270F62168]();
}

uint64_t sub_261B8FC48()
{
  return MEMORY[0x270F62180]();
}

uint64_t sub_261B8FC58()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_261B8FC68()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_261B8FC78()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_261B8FC88()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_261B8FC98()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_261B8FCA8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_261B8FCB8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_261B8FCC8()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_261B8FCD8()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_261B8FCE8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_261B8FCF8()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_261B8FD08()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_261B8FD18()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_261B8FD28()
{
  return MEMORY[0x270EF2800]();
}

uint64_t sub_261B8FD38()
{
  return MEMORY[0x270EF2810]();
}

uint64_t sub_261B8FD48()
{
  return MEMORY[0x270EF2820]();
}

uint64_t sub_261B8FD58()
{
  return MEMORY[0x270EF2838]();
}

uint64_t sub_261B8FD68()
{
  return MEMORY[0x270EF2A10]();
}

uint64_t sub_261B8FD78()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_261B8FDA8()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F09240]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t FIIsTinkerVegaOrFitnessJunior()
{
  return MEMORY[0x270F29A38]();
}

uint64_t FILocalizedNameForIndoorAgnosticActivityType()
{
  return MEMORY[0x270F29AB0]();
}

uint64_t FISetShouldShowTrackTrainingLoadPrompt()
{
  return MEMORY[0x270F29B20]();
}

uint64_t FIShouldShowTrackTrainingLoadPrompt()
{
  return MEMORY[0x270F29B40]();
}

uint64_t FIShouldTrackTrainingLoad()
{
  return MEMORY[0x270F29B48]();
}

uint64_t FIUIColorForCurrentContrastMode()
{
  return MEMORY[0x270F2CC18]();
}

uint64_t FIUICurrentLanguageNeedsExtendedLineSpacing()
{
  return MEMORY[0x270F2CC20]();
}

uint64_t FIUICurrentLanguageRequiresTallScript()
{
  return MEMORY[0x270F2CC28]();
}

uint64_t FIUIDistanceTypeForActivityType()
{
  return MEMORY[0x270F2CC30]();
}

uint64_t FIUIDistanceUnitForHKUnit()
{
  return MEMORY[0x270F2CC38]();
}

uint64_t FIUIFlightsShortDescriptionWithFlightsCount()
{
  return MEMORY[0x270F2CC40]();
}

uint64_t FIUIIconSize()
{
  return MEMORY[0x270F2CC50]();
}

uint64_t FIUIPaceFormatForDistanceType()
{
  return MEMORY[0x270F2CC78]();
}

uint64_t FIUIPaceFormatForWorkoutActivityType()
{
  return MEMORY[0x270F2CC80]();
}

uint64_t FIUISpriteSheetNumberOfFrames()
{
  return MEMORY[0x270F2CC88]();
}

uint64_t FIUISpriteSheetWorkoutIconImage()
{
  return MEMORY[0x270F2CC90]();
}

uint64_t FIUIStaticScalableWorkoutIconImage()
{
  return MEMORY[0x270F2CC98]();
}

uint64_t FIUIStaticScalableWorkoutIconImageWithPadding()
{
  return MEMORY[0x270F2CCA0]();
}

uint64_t FIUIStaticWorkoutIconImage()
{
  return MEMORY[0x270F2CCA8]();
}

uint64_t HKQuantityMax()
{
  return MEMORY[0x270EF37E8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

CLLocationCoordinate2D MKCoordinateForMapPoint(MKMapPoint mapPoint)
{
  MEMORY[0x270EF58A8]((__n128)mapPoint, *(__n128 *)&mapPoint.y);
  result.longitude = v2;
  result.latitude = v1;
  return result;
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  MEMORY[0x270EF58B8]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MEMORY[0x270EF58C8]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
}

double MKMapPointsPerMeterAtLatitude(CLLocationDegrees latitude)
{
  MEMORY[0x270EF58D0](latitude);
  return result;
}

BOOL MKMapRectContainsRect(MKMapRect rect1, MKMapRect rect2)
{
  return MEMORY[0x270EF58E8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

MKMapRect MKMapRectInset(MKMapRect rect, double dx, double dy)
{
  MEMORY[0x270EF5900]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

MKMapRect MKMapRectIntersection(MKMapRect rect1, MKMapRect rect2)
{
  MEMORY[0x270EF5908]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL MKMapRectIntersectsRect(MKMapRect rect1, MKMapRect rect2)
{
  return MEMORY[0x270EF5910]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

MKMapRect MKMapRectUnion(MKMapRect rect1, MKMapRect rect2)
{
  MEMORY[0x270EF5928]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat MKRoadWidthAtZoomScale(MKZoomScale zoomScale)
{
  MEMORY[0x270EF5938](zoomScale);
  return result;
}

uint64_t NLQuantityForGoalTypeAndValue()
{
  return MEMORY[0x270F2CCB0]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x270F82F28]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKEnumerateActiveWorkoutIntervalsStartingPaused()
{
  return MEMORY[0x270EF3958]();
}

uint64_t _HKWorkoutActivityNameForActivityType()
{
  return MEMORY[0x270EF39E0]();
}

uint64_t _HKWorkoutSwimmingLocationTypeName()
{
  return MEMORY[0x270EF3A28]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}