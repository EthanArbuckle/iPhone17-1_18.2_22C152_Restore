uint64_t sub_25E2DBB50()
{
  return sub_25E300594(1, 0, &xmmword_26A6EBC80);
}

long long *sub_25E2DBB64()
{
  if (qword_26A6E4150 != -1) {
    swift_once();
  }
  return &xmmword_26A6EBC80;
}

double sub_25E2DBBB0@<D0>(_OWORD *a1@<X8>)
{
  if (qword_26A6E4150 != -1) {
    swift_once();
  }
  swift_beginAccess();
  double result = *(double *)&xmmword_26A6EBC80;
  *a1 = xmmword_26A6EBC80;
  return result;
}

uint64_t sub_25E2DBC2C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (qword_26A6E4150 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  *(void *)&xmmword_26A6EBC80 = v1;
  *((void *)&xmmword_26A6EBC80 + 1) = v2;
  return result;
}

uint64_t (*sub_25E2DBCAC())()
{
  if (qword_26A6E4150 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_25E2DBD38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25E30A040();
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_25E2DBDA0()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV1() + 20);
  uint64_t v2 = *(void *)v1;
  sub_25E2DBE30(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t type metadata accessor for SpatialInspectorDataV1()
{
  uint64_t result = qword_26A6E42E0;
  if (!qword_26A6E42E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E2DBE30(uint64_t a1, unint64_t a2)
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

uint64_t sub_25E2DBE88()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV1() + 24);
  uint64_t v2 = *(void *)v1;
  sub_25E2DBE30(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t sub_25E2DBECC()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV1() + 28);
  uint64_t v2 = *(void *)v1;
  sub_25E2DBF10(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t sub_25E2DBF10(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25E2DBE30(a1, a2);
  }
  return a1;
}

uint64_t sub_25E2DBF24()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for SpatialInspectorDataV1() + 32));
}

uint64_t sub_25E2DBF50()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for SpatialInspectorDataV1() + 36));
}

int *sub_25E2DBF7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char a14)
{
  uint64_t v21 = sub_25E30A040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(a9, a1, v21);
  uint64_t result = (int *)type metadata accessor for SpatialInspectorDataV1();
  v23 = (void *)(a9 + result[5]);
  void *v23 = a2;
  v23[1] = a3;
  v24 = (void *)(a9 + result[6]);
  void *v24 = a4;
  v24[1] = a5;
  v25 = (void *)(a9 + result[7]);
  void *v25 = a6;
  v25[1] = a7;
  uint64_t v26 = a9 + result[8];
  *(void *)uint64_t v26 = a8;
  *(void *)(v26 + 8) = a10;
  *(unsigned char *)(v26 + 16) = a11 & 1;
  uint64_t v27 = a9 + result[9];
  *(void *)uint64_t v27 = a12;
  *(void *)(v27 + 8) = a13;
  *(unsigned char *)(v27 + 16) = a14 & 1;
  return result;
}

unint64_t sub_25E2DC0A0(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x536465646F636E65;
      break;
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t result = 0x7A6953656E656373;
      break;
    case 5:
      unint64_t result = 0x6E6543656E656373;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_25E2DC17C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25E2DC190()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2DC1D8()
{
  return sub_25E30AA60();
}

uint64_t sub_25E2DC204()
{
  return sub_25E30AAA0();
}

unint64_t sub_25E2DC248()
{
  return sub_25E2DC0A0(*v0);
}

uint64_t sub_25E2DC250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2DDC84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E2DC278()
{
  return 0;
}

void sub_25E2DC284(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_25E2DC290(uint64_t a1)
{
  unint64_t v2 = sub_25E2DC6B0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2DC2CC(uint64_t a1)
{
  unint64_t v2 = sub_25E2DC6B0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25E2DC308(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3830);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2DC6B0();
  sub_25E30AAC0();
  LOBYTE(v15) = 0;
  sub_25E30A040();
  sub_25E2DCFC0(&qword_26A6E3838, MEMORY[0x263F07508]);
  sub_25E30A920();
  if (!v2)
  {
    v9 = (int *)type metadata accessor for SpatialInspectorDataV1();
    long long v15 = *(_OWORD *)(v3 + v9[5]);
    char v17 = 1;
    sub_25E2DC704();
    sub_25E30A920();
    long long v15 = *(_OWORD *)(v3 + v9[6]);
    char v17 = 2;
    sub_25E30A920();
    long long v15 = *(_OWORD *)(v3 + v9[7]);
    char v17 = 3;
    sub_25E30A8B0();
    v10 = (long long *)(v3 + v9[8]);
    char v11 = *((unsigned char *)v10 + 16);
    long long v15 = *v10;
    char v16 = v11;
    char v17 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3848);
    sub_25E2DCE34(&qword_26A6E3850);
    sub_25E30A8B0();
    v12 = (long long *)(v3 + v9[9]);
    char v13 = *((unsigned char *)v12 + 16);
    long long v15 = *v12;
    char v16 = v13;
    char v17 = 5;
    sub_25E30A8B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_25E2DC6B0()
{
  unint64_t result = qword_26A6E4158[0];
  if (!qword_26A6E4158[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E4158);
  }
  return result;
}

unint64_t sub_25E2DC704()
{
  unint64_t result = qword_26A6E3840;
  if (!qword_26A6E3840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3840);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_25E2DC7A0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v4 = sub_25E30A040();
  uint64_t v22 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v23 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3858);
  uint64_t v21 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (int *)type metadata accessor for SpatialInspectorDataV1();
  MEMORY[0x270FA5388]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2DC6B0();
  v25 = v7;
  sub_25E30AAB0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v11 = v22;
  v19 = a1;
  LOBYTE(v26) = 0;
  sub_25E2DCFC0(&qword_26A6E3860, MEMORY[0x263F07508]);
  v12 = v23;
  sub_25E30A830();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v10, v12, v4);
  char v28 = 1;
  sub_25E2DCDE0();
  sub_25E30A830();
  *(_OWORD *)&v10[v8[5]] = v26;
  char v28 = 2;
  sub_25E30A830();
  *(_OWORD *)&v10[v8[6]] = v26;
  char v28 = 3;
  sub_25E30A7C0();
  *(_OWORD *)&v10[v8[7]] = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3848);
  char v28 = 4;
  sub_25E2DCE34(&qword_26A6E3870);
  sub_25E30A7C0();
  char v13 = v27;
  v14 = &v10[v8[8]];
  *(_OWORD *)v14 = v26;
  v14[16] = v13;
  char v28 = 5;
  sub_25E30A7C0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v25, v24);
  char v15 = v27;
  char v16 = &v10[v8[9]];
  *(_OWORD *)char v16 = v26;
  v16[16] = v15;
  sub_25E2DCE7C((uint64_t)v10, v20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  return sub_25E2DCEE0((uint64_t)v10);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25E2DCD74(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25E2DCD88(a1, a2);
  }
  return a1;
}

uint64_t sub_25E2DCD88(uint64_t a1, unint64_t a2)
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

unint64_t sub_25E2DCDE0()
{
  unint64_t result = qword_26A6E3868;
  if (!qword_26A6E3868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3868);
  }
  return result;
}

uint64_t sub_25E2DCE34(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3848);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25E2DCE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SpatialInspectorDataV1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E2DCEE0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SpatialInspectorDataV1();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25E2DCF3C(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_25E2DCFC0(&qword_26A6E3878, (void (*)(uint64_t))type metadata accessor for SpatialInspectorDataV1);
  uint64_t result = sub_25E2DCFC0(&qword_26A6E3880, (void (*)(uint64_t))type metadata accessor for SpatialInspectorDataV1);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_25E2DCFC0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25E2DD008@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25E2DC7A0(a1, a2);
}

uint64_t sub_25E2DD020(void *a1)
{
  return sub_25E2DC308(a1);
}

uint64_t *sub_25E2DD038(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25E30A040();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = *v10;
    unint64_t v12 = v10[1];
    sub_25E2DBE30(*v10, v12);
    uint64_t *v9 = v11;
    v9[1] = v12;
    uint64_t v13 = a3[6];
    v14 = (uint64_t *)((char *)a1 + v13);
    char v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = *v15;
    unint64_t v17 = v15[1];
    sub_25E2DBE30(*v15, v17);
    uint64_t *v14 = v16;
    v14[1] = v17;
    uint64_t v18 = a3[7];
    v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)a2 + v18;
    unint64_t v21 = *((void *)v20 + 1);
    if (v21 >> 60 == 15)
    {
      *(_OWORD *)v19 = *(_OWORD *)v20;
    }
    else
    {
      uint64_t v23 = *(void *)v20;
      sub_25E2DBE30(*(void *)v20, *((void *)v20 + 1));
      *(void *)v19 = v23;
      *((void *)v19 + 1) = v21;
    }
    uint64_t v24 = a3[8];
    uint64_t v25 = a3[9];
    long long v26 = (char *)a1 + v24;
    char v27 = (char *)a2 + v24;
    *(_OWORD *)long long v26 = *(_OWORD *)v27;
    v26[16] = v27[16];
    char v28 = (char *)a1 + v25;
    v29 = (char *)a2 + v25;
    *(_OWORD *)char v28 = *(_OWORD *)v29;
    v28[16] = v29[16];
  }
  return a1;
}

uint64_t sub_25E2DD1B0(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_25E30A040();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_25E2DCD88(*(void *)(a1 + a2[5]), *(void *)(a1 + a2[5] + 8));
  uint64_t result = sub_25E2DCD88(*(void *)(a1 + a2[6]), *(void *)(a1 + a2[6] + 8));
  uint64_t v6 = (uint64_t *)(a1 + a2[7]);
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15)
  {
    uint64_t v8 = *v6;
    return sub_25E2DCD88(v8, v7);
  }
  return result;
}

uint64_t sub_25E2DD264(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E30A040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  sub_25E2DBE30(*v9, v11);
  uint64_t *v8 = v10;
  v8[1] = v11;
  uint64_t v12 = a3[6];
  uint64_t v13 = (uint64_t *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  unint64_t v16 = v14[1];
  sub_25E2DBE30(*v14, v16);
  *uint64_t v13 = v15;
  v13[1] = v16;
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v17;
  v19 = (uint64_t *)(a2 + v17);
  unint64_t v20 = v19[1];
  if (v20 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  }
  else
  {
    uint64_t v21 = *v19;
    sub_25E2DBE30(*v19, v19[1]);
    *(void *)uint64_t v18 = v21;
    *(void *)(v18 + 8) = v20;
  }
  uint64_t v22 = a3[8];
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v22;
  uint64_t v25 = a2 + v22;
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  *(unsigned char *)(v24 + 16) = *(unsigned char *)(v25 + 16);
  uint64_t v26 = a1 + v23;
  uint64_t v27 = a2 + v23;
  *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  *(unsigned char *)(v26 + 16) = *(unsigned char *)(v27 + 16);
  return a1;
}

uint64_t sub_25E2DD38C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E30A040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  sub_25E2DBE30(*v9, v11);
  uint64_t v12 = *v8;
  unint64_t v13 = v8[1];
  uint64_t *v8 = v10;
  v8[1] = v11;
  sub_25E2DCD88(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = (uint64_t *)(a1 + v14);
  unint64_t v16 = (uint64_t *)(a2 + v14);
  uint64_t v17 = *v16;
  unint64_t v18 = v16[1];
  sub_25E2DBE30(*v16, v18);
  uint64_t v19 = *v15;
  unint64_t v20 = v15[1];
  *uint64_t v15 = v17;
  v15[1] = v18;
  sub_25E2DCD88(v19, v20);
  uint64_t v21 = a3[7];
  uint64_t v22 = (uint64_t *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  unint64_t v24 = *(void *)(a2 + v21 + 8);
  if (*(void *)(a1 + v21 + 8) >> 60 != 15)
  {
    if (v24 >> 60 != 15)
    {
      uint64_t v26 = *v23;
      sub_25E2DBE30(v26, v24);
      uint64_t v27 = *v22;
      unint64_t v28 = v22[1];
      *uint64_t v22 = v26;
      v22[1] = v24;
      sub_25E2DCD88(v27, v28);
      goto LABEL_8;
    }
    sub_25E2DD50C((uint64_t)v22);
    goto LABEL_6;
  }
  if (v24 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    goto LABEL_8;
  }
  uint64_t v25 = *v23;
  sub_25E2DBE30(v25, v24);
  *uint64_t v22 = v25;
  v22[1] = v24;
LABEL_8:
  uint64_t v29 = a3[8];
  uint64_t v30 = a1 + v29;
  v31 = (long long *)(a2 + v29);
  long long v32 = *v31;
  *(unsigned char *)(v30 + 16) = *((unsigned char *)v31 + 16);
  *(_OWORD *)uint64_t v30 = v32;
  uint64_t v33 = a3[9];
  uint64_t v34 = a1 + v33;
  v35 = (long long *)(a2 + v33);
  long long v36 = *v35;
  *(unsigned char *)(v34 + 16) = *((unsigned char *)v35 + 16);
  *(_OWORD *)uint64_t v34 = v36;
  return a1;
}

uint64_t sub_25E2DD50C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25E2DD560(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E30A040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(unsigned char *)(v9 + 16) = *(unsigned char *)(v10 + 16);
  uint64_t v11 = a3[9];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(unsigned char *)(v12 + 16) = *(unsigned char *)(v13 + 16);
  return a1;
}

uint64_t sub_25E2DD624(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E30A040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void *)(a1 + v7);
  unint64_t v9 = *(void *)(a1 + v7 + 8);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  sub_25E2DCD88(v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = *(void *)(a1 + v10);
  unint64_t v12 = *(void *)(a1 + v10 + 8);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  sub_25E2DCD88(v11, v12);
  uint64_t v13 = a3[7];
  uint64_t v14 = (uint64_t *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  unint64_t v16 = *(void *)(a1 + v13 + 8);
  if (v16 >> 60 != 15)
  {
    unint64_t v17 = v15[1];
    if (v17 >> 60 != 15)
    {
      uint64_t v18 = *v14;
      uint64_t *v14 = *v15;
      v14[1] = v17;
      sub_25E2DCD88(v18, v16);
      goto LABEL_6;
    }
    sub_25E2DD50C((uint64_t)v14);
  }
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
LABEL_6:
  uint64_t v19 = a3[8];
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v19;
  uint64_t v22 = a2 + v19;
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *(unsigned char *)(v21 + 16) = *(unsigned char *)(v22 + 16);
  uint64_t v23 = a1 + v20;
  uint64_t v24 = a2 + v20;
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  *(unsigned char *)(v23 + 16) = *(unsigned char *)(v24 + 16);
  return a1;
}

uint64_t sub_25E2DD750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E2DD764);
}

uint64_t sub_25E2DD764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25E30A040();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8) >> 60;
    if (((4 * v10) & 0xC) != 0) {
      return 16 - ((4 * v10) & 0xC | (v10 >> 2));
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_25E2DD838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E2DD84C);
}

uint64_t sub_25E2DD84C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25E30A040();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    uint64_t v11 = (void *)(a1 + *(int *)(a4 + 20));
    *uint64_t v11 = 0;
    v11[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

uint64_t sub_25E2DD918()
{
  uint64_t result = sub_25E30A040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpatialInspectorDataV1.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SpatialInspectorDataV1.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E2DDB30);
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

uint64_t sub_25E2DDB58(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25E2DDB64(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SpatialInspectorDataV1.CodingKeys()
{
  return &type metadata for SpatialInspectorDataV1.CodingKeys;
}

unint64_t sub_25E2DDB80()
{
  unint64_t result = qword_26A6E43F0[0];
  if (!qword_26A6E43F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E43F0);
  }
  return result;
}

unint64_t sub_25E2DDBD8()
{
  unint64_t result = qword_26A6E4500;
  if (!qword_26A6E4500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E4500);
  }
  return result;
}

unint64_t sub_25E2DDC30()
{
  unint64_t result = qword_26A6E4508[0];
  if (!qword_26A6E4508[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E4508);
  }
  return result;
}

uint64_t sub_25E2DDC84(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000025E311B30 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x536465646F636E65 && a2 == 0xEC000000656E6563 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000025E311B50 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x800000025E311B70 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7A6953656E656373 && a2 == 0xE900000000000065 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E6543656E656373 && a2 == 0xEB00000000726574)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v5 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_25E2DDF30(char *a1, char *a2)
{
  return sub_25E2DDF3C(*a1, *a2);
}

uint64_t sub_25E2DDF3C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6C616E7265746E69;
  }
  else {
    uint64_t v3 = 0x7372655661746164;
  }
  if (v2) {
    unint64_t v4 = 0xEB000000006E6F69;
  }
  else {
    unint64_t v4 = 0xE900000000000073;
  }
  if (a2) {
    uint64_t v5 = 0x6C616E7265746E69;
  }
  else {
    uint64_t v5 = 0x7372655661746164;
  }
  if (a2) {
    unint64_t v6 = 0xE900000000000073;
  }
  else {
    unint64_t v6 = 0xEB000000006E6F69;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25E30A9A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25E2DDFF0()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2DE080()
{
  sub_25E30A2A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E2DE0FC()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2DE188@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25E30A780();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_25E2DE1E8(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x7372655661746164;
  if (*v1) {
    uint64_t v2 = 0x6C616E7265746E69;
  }
  unint64_t v3 = 0xEB000000006E6F69;
  if (*v1) {
    unint64_t v3 = 0xE900000000000073;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_25E2DE234()
{
  if (*v0) {
    return 0x6C616E7265746E69;
  }
  else {
    return 0x7372655661746164;
  }
}

uint64_t sub_25E2DE27C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25E30A780();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_25E2DE2E0(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25E2DE2EC(uint64_t a1)
{
  unint64_t v2 = sub_25E2DF620();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2DE328(uint64_t a1)
{
  unint64_t v2 = sub_25E2DF620();

  return MEMORY[0x270FA00B8](a1, v2);
}

__n128 sub_25E2DE364@<Q0>(long long *a1@<X8>)
{
  unint64_t v2 = sub_25E2F3F44();
  swift_beginAccess();
  __n128 result = (__n128)*v2;
  *a1 = *v2;
  return result;
}

uint64_t sub_25E2DE3AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  return sub_25E2DE400(v3, a1);
}

uint64_t sub_25E2DE400(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25E2DE464(long long *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_25E2DE4C8(a1, v3);
  return swift_endAccess();
}

uint64_t sub_25E2DE4C8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t (*sub_25E2DE4E0())()
{
  return j__swift_endAccess;
}

id SpatialSceneDebugRepresentation.__allocating_init(encodedSceneUUID:encodedScene:sceneDebugRepresentation:sceneStatisticsRepresentation:sceneConfiguration:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  id v18 = objc_allocWithZone(v9);
  id v19 = sub_25E2DF3C8(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  sub_25E2DCD74(a8, a9);
  sub_25E2DCD74(a6, a7);
  sub_25E2DCD88(a4, a5);
  sub_25E2DCD88(a2, a3);
  return v19;
}

id SpatialSceneDebugRepresentation.init(encodedSceneUUID:encodedScene:sceneDebugRepresentation:sceneStatisticsRepresentation:sceneConfiguration:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  id v16 = sub_25E2DF3C8(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  sub_25E2DCD74(a8, a9);
  sub_25E2DCD74(a6, a7);
  sub_25E2DCD88(a4, a5);
  sub_25E2DCD88(a2, a3);
  return v16;
}

uint64_t SpatialSceneDebugRepresentation.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3890);
  uint64_t v6 = *(void *)(v5 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  int v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2DF620();
  sub_25E30AAC0();
  long long v17 = *(_OWORD *)(v3 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_dataVersion);
  char v18 = 0;
  sub_25E2DF674();
  sub_25E30A920();
  if (!v2)
  {
    uint64_t v10 = (void *)(v3 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals);
    swift_beginAccess();
    uint64_t v11 = v10[3];
    unint64_t v12 = __swift_project_boxed_opaque_existential_1(v10, v11);
    v16[1] = v16;
    uint64_t v13 = *(void *)(v11 - 8);
    MEMORY[0x270FA5388](v12, v12);
    uint64_t v15 = (char *)v16 - v14;
    (*(void (**)(char *))(v13 + 16))((char *)v16 - v14);
    char v18 = 1;
    sub_25E30A920();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id SpatialSceneDebugRepresentation.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SpatialSceneDebugRepresentation.init(from:)(a1);
}

id SpatialSceneDebugRepresentation.init(from:)(void *a1)
{
  id v3 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E38A8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  uint64_t v22 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_25E2DF620();
  uint64_t v10 = v3;
  sub_25E30AAB0();
  if (!v2)
  {
    char v28 = 0;
    sub_25E2DF6C8();
    sub_25E30A830();
    uint64_t v13 = v25;
    *(_OWORD *)&v10[OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_dataVersion] = v25;
    uint64_t v14 = v13;
    if (v13 == 2)
    {
      uint64_t v18 = type metadata accessor for SpatialInspectorDataV2();
      char v28 = 1;
      uint64_t v26 = v18;
      id v16 = type metadata accessor for SpatialInspectorDataV2;
      uint64_t v27 = sub_25E2DF828(&qword_26A6E38C0, (void (*)(uint64_t))type metadata accessor for SpatialInspectorDataV2);
      __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v25);
      long long v17 = (unint64_t *)&unk_26A6E38C8;
    }
    else
    {
      if (v13 != 1)
      {
        id v19 = sub_25E2F3F44();
        swift_beginAccess();
        uint64_t v20 = *(void *)v19;
        sub_25E2DF71C();
        swift_allocError();
        *uint64_t v21 = v14;
        v21[1] = v20;
        swift_willThrow();

        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        goto LABEL_4;
      }
      uint64_t v15 = type metadata accessor for SpatialInspectorDataV1();
      char v28 = 1;
      uint64_t v26 = v15;
      id v16 = type metadata accessor for SpatialInspectorDataV1;
      uint64_t v27 = sub_25E2DF828(&qword_26A6E38D0, (void (*)(uint64_t))type metadata accessor for SpatialInspectorDataV1);
      __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v25);
      long long v17 = &qword_26A6E3878;
    }
    sub_25E2DF828(v17, (void (*)(uint64_t))v16);
    sub_25E30A830();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_25E2DE4C8(&v25, (uint64_t)&v10[OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals]);

    v24.receiver = v10;
    v24.super_class = ObjectType;
    id v11 = objc_msgSendSuper2(&v24, sel_init);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    return v11;
  }

LABEL_4:
  id v11 = ObjectType;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  swift_deallocPartialClassInstance();
  return v11;
}

id SpatialSceneDebugRepresentation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void SpatialSceneDebugRepresentation.init()()
{
}

id SpatialSceneDebugRepresentation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_25E2DEE28@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v6 = objc_allocWithZone(v2);
  id result = SpatialSceneDebugRepresentation.init(from:)(a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25E2DEE78(void *a1)
{
  return SpatialSceneDebugRepresentation.encode(to:)(a1);
}

__n128 SpatialSceneDebugRepresentation.version.getter@<Q0>(long long *a1@<X8>)
{
  objc_super v2 = sub_25E2F3F44();
  swift_beginAccess();
  __n128 result = (__n128)*v2;
  *a1 = *v2;
  return result;
}

uint64_t SpatialSceneDebugRepresentation.encodedSceneUUID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SpatialInspectorDataV2();
  MEMORY[0x270FA5388](v3, v4);
  id v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = v1 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  sub_25E2DE400(v7, (uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E38D8);
  swift_dynamicCast();
  uint64_t v8 = sub_25E30A040();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, v6, v8);
  return sub_25E2DF870((uint64_t)v6);
}

uint64_t SpatialSceneDebugRepresentation.encodedScene.getter()
{
  uint64_t v1 = type metadata accessor for SpatialInspectorDataV2();
  MEMORY[0x270FA5388](v1, v2);
  uint64_t v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = v0 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  sub_25E2DE400(v5, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E38D8);
  swift_dynamicCast();
  id v6 = &v4[*(int *)(v1 + 20)];
  uint64_t v7 = *(void *)v6;
  sub_25E2DBE30(*(void *)v6, *((void *)v6 + 1));
  sub_25E2DF870((uint64_t)v4);
  return v7;
}

uint64_t SpatialSceneDebugRepresentation.sceneDebugRepresentation.getter()
{
  uint64_t v1 = type metadata accessor for SpatialInspectorDataV2();
  MEMORY[0x270FA5388](v1, v2);
  uint64_t v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = v0 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  sub_25E2DE400(v5, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E38D8);
  swift_dynamicCast();
  id v6 = &v4[*(int *)(v1 + 24)];
  uint64_t v7 = *(void *)v6;
  sub_25E2DBE30(*(void *)v6, *((void *)v6 + 1));
  sub_25E2DF870((uint64_t)v4);
  return v7;
}

uint64_t SpatialSceneDebugRepresentation.sceneStatisticsRepresentation.getter()
{
  uint64_t v1 = type metadata accessor for SpatialInspectorDataV2();
  MEMORY[0x270FA5388](v1, v2);
  uint64_t v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = v0 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  sub_25E2DE400(v5, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E38D8);
  swift_dynamicCast();
  id v6 = &v4[*(int *)(v1 + 28)];
  uint64_t v7 = *(void *)v6;
  sub_25E2DBF10(*(void *)v6, *((void *)v6 + 1));
  sub_25E2DF870((uint64_t)v4);
  return v7;
}

uint64_t SpatialSceneDebugRepresentation.sceneConfiguration.getter()
{
  uint64_t v1 = type metadata accessor for SpatialInspectorDataV2();
  MEMORY[0x270FA5388](v1, v2);
  uint64_t v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = v0 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  sub_25E2DE400(v5, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E38D8);
  swift_dynamicCast();
  id v6 = &v4[*(int *)(v1 + 32)];
  uint64_t v7 = *(void *)v6;
  sub_25E2DBF10(*(void *)v6, *((void *)v6 + 1));
  sub_25E2DF870((uint64_t)v4);
  return v7;
}

__n128 sub_25E2DF3B4(__n128 *a1)
{
  __n128 result = *a1;
  *(__n128 *)(v1 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_dataVersion) = *a1;
  return result;
}

id sub_25E2DF3C8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  uint64_t v39 = a1;
  unint64_t v35 = a9;
  uint64_t v36 = a8;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v17 = sub_25E30A040();
  uint64_t v37 = *(void *)(v17 - 8);
  uint64_t v38 = v17;
  MEMORY[0x270FA5388]();
  id v19 = (char *)&boxed_opaque_existential_1 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v20 + 16))(v19, a1);
  uint64_t v43 = type metadata accessor for SpatialInspectorDataV2();
  uint64_t v44 = sub_25E2DF828(&qword_26A6E38C0, (void (*)(uint64_t))type metadata accessor for SpatialInspectorDataV2);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
  uint64_t v21 = v9;
  uint64_t v22 = a3;
  sub_25E2DBE30(a2, a3);
  uint64_t v23 = a4;
  uint64_t v24 = a4;
  uint64_t v25 = a5;
  sub_25E2DBE30(v24, a5);
  uint64_t v26 = a6;
  uint64_t v27 = a6;
  uint64_t v28 = a7;
  sub_25E2DBF10(v27, a7);
  uint64_t v29 = v35;
  uint64_t v30 = v36;
  sub_25E2DBF10(v36, v35);
  sub_25E2F4270((uint64_t)v19, a2, v22, v23, v25, v26, v28, v30, (uint64_t)boxed_opaque_existential_1, v29);
  sub_25E2DE4C8(&v42, (uint64_t)&v21[OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals]);
  v31 = sub_25E2F3F44();
  swift_beginAccess();
  *(_OWORD *)&v21[OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_dataVersion] = *v31;

  v41.receiver = v21;
  v41.super_class = ObjectType;
  id v32 = objc_msgSendSuper2(&v41, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v39, v38);
  return v32;
}

unint64_t sub_25E2DF620()
{
  unint64_t result = qword_26A6E4590[0];
  if (!qword_26A6E4590[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E4590);
  }
  return result;
}

unint64_t sub_25E2DF674()
{
  unint64_t result = qword_26A6E38A0;
  if (!qword_26A6E38A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E38A0);
  }
  return result;
}

unint64_t sub_25E2DF6C8()
{
  unint64_t result = qword_26A6E38B0;
  if (!qword_26A6E38B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E38B0);
  }
  return result;
}

unint64_t sub_25E2DF71C()
{
  unint64_t result = qword_26A6E38B8;
  if (!qword_26A6E38B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E38B8);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x2611D27B0);
  }
  return result;
}

uint64_t sub_25E2DF828(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25E2DF870(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SpatialInspectorDataV2();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for SpatialSceneDebugRepresentation()
{
  return self;
}

uint64_t method lookup function for SpatialSceneDebugRepresentation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SpatialSceneDebugRepresentation);
}

uint64_t dispatch thunk of SpatialSceneDebugRepresentation.__allocating_init(encodedSceneUUID:encodedScene:sceneDebugRepresentation:sceneStatisticsRepresentation:sceneConfiguration:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of SpatialSceneDebugRepresentation.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_25E2DF94C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t getEnumTagSinglePayload for SpatialSceneDebugRepresentation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SpatialSceneDebugRepresentation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E2DFABCLL);
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

unsigned char *sub_25E2DFAE4(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SpatialSceneDebugRepresentation.CodingKeys()
{
  return &type metadata for SpatialSceneDebugRepresentation.CodingKeys;
}

unint64_t sub_25E2DFB04()
{
  unint64_t result = qword_26A6E4820[0];
  if (!qword_26A6E4820[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E4820);
  }
  return result;
}

unint64_t sub_25E2DFB5C()
{
  unint64_t result = qword_26A6E4930;
  if (!qword_26A6E4930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E4930);
  }
  return result;
}

unint64_t sub_25E2DFBB4()
{
  unint64_t result = qword_26A6E4938[0];
  if (!qword_26A6E4938[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E4938);
  }
  return result;
}

uint64_t SceneConfiguration.sceneSize.getter()
{
  return *(void *)v0;
}

uint64_t SceneConfiguration.contentOrigin.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t SceneConfiguration.bundleID.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

__n128 SceneConfiguration.cameraTransform.getter@<Q0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 128);
  long long v3 = *(_OWORD *)(v1 + 96);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = *(__n128 *)(v1 + 112);
  *(__n128 *)(a1 + 32) = result;
  *(unsigned char *)(a1 + 48) = v2;
  return result;
}

double SceneConfiguration.init(sceneSize:contentOrigin:bundleID:cameraTransform:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  sub_25E2DFD14(a10, (uint64_t)v22);
  char v19 = v24;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 16) = a3 & 1;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  *(unsigned char *)(a9 + 48) = a6 & 1;
  *(void *)(a9 + 56) = a7;
  *(void *)(a9 + 64) = a8;
  long long v20 = v22[1];
  *(_OWORD *)(a9 + 80) = v22[0];
  *(_OWORD *)(a9 + 96) = v20;
  double result = *(double *)&v23;
  *(_OWORD *)(a9 + 112) = v23;
  *(unsigned char *)(a9 + 128) = v19;
  return result;
}

uint64_t sub_25E2DFD14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E38E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E2DFD7C()
{
  uint64_t result = 0x7A6953656E656373;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x4F746E65746E6F63;
      break;
    case 2:
      uint64_t result = 0x4449656C646E7562;
      break;
    case 3:
      uint64_t result = 0x72546172656D6163;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25E2DFE28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2E0B04(a1, a2);
  *a3 = result;
  return result;
}

void sub_25E2DFE50(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_25E2DFE5C(uint64_t a1)
{
  unint64_t v2 = sub_25E2E0194();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2DFE98(uint64_t a1)
{
  unint64_t v2 = sub_25E2E0194();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SceneConfiguration.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E38E8);
  uint64_t v32 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v4);
  unsigned int v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  char v9 = *((unsigned char *)v1 + 16);
  uint64_t v10 = v1[4];
  uint64_t v30 = v1[5];
  uint64_t v31 = v10;
  int v41 = *((unsigned __int8 *)v1 + 48);
  uint64_t v11 = v1[7];
  uint64_t v28 = v1[8];
  uint64_t v29 = v11;
  uint64_t v12 = v1[10];
  uint64_t v13 = v1[12];
  uint64_t v21 = v1[11];
  uint64_t v22 = v13;
  uint64_t v26 = v1[13];
  uint64_t v27 = v12;
  uint64_t v14 = v1[14];
  uint64_t v24 = v1[15];
  uint64_t v25 = v14;
  int v23 = *((unsigned __int8 *)v1 + 128);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E0194();
  sub_25E30AAC0();
  uint64_t v34 = v8;
  uint64_t v35 = v7;
  LOBYTE(v36) = v9;
  uint64_t v15 = v6;
  char v42 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3848);
  sub_25E2DCE34(&qword_26A6E3850);
  uint64_t v16 = v33;
  sub_25E30A8B0();
  if (v16) {
    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v6, v3);
  }
  uint64_t v18 = v27;
  uint64_t v19 = v32;
  uint64_t v34 = v31;
  uint64_t v35 = v30;
  LOBYTE(v36) = v41;
  char v42 = 1;
  sub_25E30A8B0();
  LOBYTE(v34) = 2;
  sub_25E30A8A0();
  uint64_t v34 = v18;
  uint64_t v35 = v21;
  uint64_t v36 = v22;
  uint64_t v37 = v26;
  uint64_t v38 = v25;
  uint64_t v39 = v24;
  char v40 = v23;
  char v42 = 3;
  sub_25E2E01E8();
  sub_25E30A8B0();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v15, v3);
}

unint64_t sub_25E2E0194()
{
  unint64_t result = qword_26A6E49C0[0];
  if (!qword_26A6E49C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E49C0);
  }
  return result;
}

unint64_t sub_25E2E01E8()
{
  unint64_t result = qword_26A6E38F0;
  if (!qword_26A6E38F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E38F0);
  }
  return result;
}

uint64_t SceneConfiguration.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E38F8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  char v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E0194();
  sub_25E30AAB0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3848);
  char v33 = 0;
  sub_25E2DCE34(&qword_26A6E3870);
  sub_25E30A7C0();
  uint64_t v26 = *((void *)&v28 + 1);
  uint64_t v27 = v28;
  int v32 = v29;
  char v33 = 1;
  sub_25E30A7C0();
  uint64_t v10 = *((void *)&v28 + 1);
  uint64_t v25 = v28;
  int v11 = v29;
  LOBYTE(v28) = 2;
  uint64_t v12 = sub_25E30A7B0();
  uint64_t v14 = v13;
  uint64_t v22 = v12;
  int v23 = v11;
  uint64_t v24 = v10;
  char v33 = 3;
  sub_25E2E0530();
  swift_bridgeObjectRetain();
  sub_25E30A7C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  char v15 = v31;
  long long v16 = v28;
  long long v17 = v29;
  long long v18 = v30;
  uint64_t v19 = v26;
  *(void *)a2 = v27;
  *(void *)(a2 + 8) = v19;
  *(unsigned char *)(a2 + 16) = v32;
  uint64_t v20 = v24;
  *(void *)(a2 + 32) = v25;
  *(void *)(a2 + 40) = v20;
  *(unsigned char *)(a2 + 48) = v23;
  *(void *)(a2 + 56) = v22;
  *(void *)(a2 + 64) = v14;
  *(_OWORD *)(a2 + 80) = v16;
  *(_OWORD *)(a2 + 96) = v17;
  *(_OWORD *)(a2 + 112) = v18;
  *(unsigned char *)(a2 + 128) = v15;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_25E2E0530()
{
  unint64_t result = qword_26A6E3900;
  if (!qword_26A6E3900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3900);
  }
  return result;
}

uint64_t sub_25E2E0584@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SceneConfiguration.init(from:)(a1, a2);
}

uint64_t sub_25E2E059C(void *a1)
{
  return SceneConfiguration.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for SceneConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SceneConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SceneConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v3 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v3;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  long long v4 = *(_OWORD *)(a2 + 112);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v4;
  *(_OWORD *)(a1 + 80) = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SceneConfiguration(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(_OWORD *)a1 = v4;
  long long v5 = a2[2];
  *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 56) = *((void *)a2 + 7);
  *(void *)(a1 + 64) = *((void *)a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v6 = a2[5];
  long long v7 = a2[6];
  long long v8 = a2[7];
  *(unsigned char *)(a1 + 128) = *((unsigned char *)a2 + 128);
  *(_OWORD *)(a1 + 96) = v7;
  *(_OWORD *)(a1 + 112) = v8;
  *(_OWORD *)(a1 + 80) = v6;
  return a1;
}

__n128 __swift_memcpy129_16(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for SceneConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v4 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v4;
  swift_bridgeObjectRelease();
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneConfiguration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 129)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 64);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 128) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 129) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 129) = 0;
    }
    if (a2) {
      *(void *)(result + 64) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneConfiguration()
{
  return &type metadata for SceneConfiguration;
}

uint64_t getEnumTagSinglePayload for SceneConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SceneConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x25E2E09C4);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneConfiguration.CodingKeys()
{
  return &type metadata for SceneConfiguration.CodingKeys;
}

unint64_t sub_25E2E0A00()
{
  unint64_t result = qword_26A6E4BD0[0];
  if (!qword_26A6E4BD0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E4BD0);
  }
  return result;
}

unint64_t sub_25E2E0A58()
{
  unint64_t result = qword_26A6E4CE0;
  if (!qword_26A6E4CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E4CE0);
  }
  return result;
}

unint64_t sub_25E2E0AB0()
{
  unint64_t result = qword_26A6E4CE8[0];
  if (!qword_26A6E4CE8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E4CE8);
  }
  return result;
}

uint64_t sub_25E2E0B04(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7A6953656E656373 && a2 == 0xE900000000000065;
  if (v2 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4F746E65746E6F63 && a2 == 0xED00006E69676972 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4449656C646E7562 && a2 == 0xE800000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x72546172656D6163 && a2 == 0xEF6D726F66736E61)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

unint64_t InspectorStatisticsBase.Geometry.meshTriangleCount.getter()
{
  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

unint64_t InspectorStatisticsBase.Geometry.meshVertexCount.getter()
{
  return *(unsigned int *)(v0 + 8) | ((unint64_t)*(unsigned __int8 *)(v0 + 12) << 32);
}

unint64_t InspectorStatisticsBase.Geometry.meshCount.getter()
{
  return *(unsigned int *)(v0 + 16) | ((unint64_t)*(unsigned __int8 *)(v0 + 20) << 32);
}

uint64_t InspectorStatisticsBase.Geometry.meshMemory.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t InspectorStatisticsBase.Geometry.init(meshTriangleCount:meshVertexCount:meshCount:meshMemory:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(_DWORD *)a6 = result;
  *(unsigned char *)(a6 + 4) = BYTE4(result) & 1;
  *(_DWORD *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 12) = BYTE4(a2) & 1;
  *(_DWORD *)(a6 + 16) = a3;
  *(unsigned char *)(a6 + 20) = BYTE4(a3) & 1;
  *(void *)(a6 + 24) = a4;
  *(unsigned char *)(a6 + 32) = a5 & 1;
  return result;
}

unint64_t sub_25E2E0DB4(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x747265566873656DLL;
      break;
    case 2:
      unint64_t result = 0x6E756F436873656DLL;
      break;
    case 3:
      unint64_t result = 0x6F6D654D6873656DLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25E2E0E68()
{
  return sub_25E2E0DB4(*v0);
}

uint64_t sub_25E2E0E70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2E5B34(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E2E0E98(uint64_t a1)
{
  unint64_t v2 = sub_25E2E1130();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2E0ED4(uint64_t a1)
{
  unint64_t v2 = sub_25E2E1130();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InspectorStatisticsBase.Geometry.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3908);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  BOOL v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *(unsigned char *)(v1 + 4);
  uint64_t v17 = *(unsigned int *)(v1 + 8);
  int v16 = *(unsigned __int8 *)(v1 + 12);
  uint64_t v15 = *(unsigned int *)(v1 + 16);
  int v14 = *(unsigned __int8 *)(v1 + 20);
  uint64_t v13 = *(void *)(v1 + 24);
  v12[1] = *(unsigned __int8 *)(v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E1130();
  sub_25E30AAC0();
  char v25 = 0;
  char v22 = v8;
  uint64_t v9 = v18;
  sub_25E30A8C0();
  if (!v9)
  {
    char v10 = v14;
    char v24 = 1;
    char v20 = v16;
    sub_25E30A8C0();
    char v23 = 2;
    char v19 = v10;
    sub_25E30A8C0();
    char v21 = 3;
    sub_25E30A8D0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_25E2E1130()
{
  unint64_t result = qword_26A6E4D70;
  if (!qword_26A6E4D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E4D70);
  }
  return result;
}

uint64_t InspectorStatisticsBase.Geometry.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3910);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E1130();
  sub_25E30AAB0();
  if (!v2)
  {
    char v23 = 0;
    uint64_t v10 = sub_25E30A7D0();
    char v22 = 1;
    uint64_t v11 = sub_25E30A7D0();
    char v21 = 2;
    uint64_t v19 = sub_25E30A7D0();
    char v20 = 3;
    uint64_t v13 = sub_25E30A7E0();
    int v14 = v9;
    char v16 = v15;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
    *(_DWORD *)a2 = v10;
    *(unsigned char *)(a2 + 4) = BYTE4(v10) & 1;
    *(_DWORD *)(a2 + 8) = v11;
    *(unsigned char *)(a2 + 12) = BYTE4(v11) & 1;
    char v17 = BYTE4(v19);
    *(_DWORD *)(a2 + 16) = v19;
    *(unsigned char *)(a2 + 20) = v17 & 1;
    *(void *)(a2 + 24) = v13;
    *(unsigned char *)(a2 + 32) = v16 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25E2E13A8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return InspectorStatisticsBase.Geometry.init(from:)(a1, a2);
}

uint64_t sub_25E2E13C0(void *a1)
{
  return InspectorStatisticsBase.Geometry.encode(to:)(a1);
}

void InspectorStatisticsBase.geometry.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 20);
  int v3 = *(_DWORD *)(v1 + 24);
  char v4 = *(unsigned char *)(v1 + 28);
  int v5 = *(_DWORD *)(v1 + 32);
  char v6 = *(unsigned char *)(v1 + 36);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 16);
  *(unsigned char *)(a1 + 4) = v2;
  *(_DWORD *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 12) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 20) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
}

unint64_t InspectorStatisticsBase.Lighting.ambientLightCount.getter()
{
  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

unint64_t InspectorStatisticsBase.Lighting.directionalLightCount.getter()
{
  return *(unsigned int *)(v0 + 8) | ((unint64_t)*(unsigned __int8 *)(v0 + 12) << 32);
}

unint64_t InspectorStatisticsBase.Lighting.pointLightCount.getter()
{
  return *(unsigned int *)(v0 + 16) | ((unint64_t)*(unsigned __int8 *)(v0 + 20) << 32);
}

unint64_t InspectorStatisticsBase.Lighting.spotLightCount.getter()
{
  return *(unsigned int *)(v0 + 24) | ((unint64_t)*(unsigned __int8 *)(v0 + 28) << 32);
}

unint64_t InspectorStatisticsBase.Lighting.rectangularLightCount.getter()
{
  return *(unsigned int *)(v0 + 32) | ((unint64_t)*(unsigned __int8 *)(v0 + 36) << 32);
}

uint64_t InspectorStatisticsBase.Lighting.shadowClusterIDs.getter()
{
  return swift_bridgeObjectRetain();
}

unint64_t InspectorStatisticsBase.Lighting.shadowCasterCount.getter()
{
  return *(unsigned int *)(v0 + 48) | ((unint64_t)*(unsigned __int8 *)(v0 + 52) << 32);
}

unint64_t InspectorStatisticsBase.Lighting.shadowReceiverCount.getter()
{
  return *(unsigned int *)(v0 + 56) | ((unint64_t)*(unsigned __int8 *)(v0 + 60) << 32);
}

unint64_t InspectorStatisticsBase.Lighting.castingGroundshadowCount.getter()
{
  return *(unsigned int *)(v0 + 64) | ((unint64_t)*(unsigned __int8 *)(v0 + 68) << 32);
}

uint64_t InspectorStatisticsBase.Lighting.init(ambientLightCount:directionalLightCount:pointLightCount:spotLightCount:rectangularLightCount:shadowClusterIDs:shadowCasterCount:shadowReceiverCount:castingGroundshadowCount:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, int a10, char a11)
{
  *(_DWORD *)a9 = result;
  *(unsigned char *)(a9 + 4) = BYTE4(result) & 1;
  *(_DWORD *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 12) = BYTE4(a2) & 1;
  *(_DWORD *)(a9 + 16) = a3;
  *(unsigned char *)(a9 + 20) = BYTE4(a3) & 1;
  *(_DWORD *)(a9 + 24) = a4;
  *(unsigned char *)(a9 + 28) = BYTE4(a4) & 1;
  *(_DWORD *)(a9 + 32) = a5;
  *(unsigned char *)(a9 + 36) = BYTE4(a5) & 1;
  *(void *)(a9 + 40) = a6;
  *(_DWORD *)(a9 + 48) = a7;
  *(unsigned char *)(a9 + 52) = BYTE4(a7) & 1;
  *(_DWORD *)(a9 + 56) = a8;
  *(unsigned char *)(a9 + 60) = BYTE4(a8) & 1;
  *(_DWORD *)(a9 + 64) = a10;
  *(unsigned char *)(a9 + 68) = a11 & 1;
  return result;
}

unint64_t sub_25E2E1590(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0x67694C746E696F70;
      break;
    case 3:
      unint64_t result = 0x6867694C746F7073;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 7:
      unint64_t result = 0xD000000000000013;
      break;
    case 8:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25E2E16A0()
{
  return sub_25E2E1590(*v0);
}

uint64_t sub_25E2E16A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2E5D04(a1, a2);
  *a3 = result;
  return result;
}

void sub_25E2E16D0(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_25E2E16DC(uint64_t a1)
{
  unint64_t v2 = sub_25E2E1AD8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2E1718(uint64_t a1)
{
  unint64_t v2 = sub_25E2E1AD8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InspectorStatisticsBase.Lighting.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3918);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *(unsigned char *)(v1 + 4);
  uint64_t v32 = *(unsigned int *)(v1 + 8);
  int v35 = *(unsigned __int8 *)(v1 + 12);
  uint64_t v31 = *(unsigned int *)(v1 + 16);
  int v9 = *(unsigned __int8 *)(v1 + 20);
  uint64_t v28 = *(unsigned int *)(v1 + 24);
  int v29 = *(unsigned __int8 *)(v1 + 28);
  int v30 = v9;
  uint64_t v27 = *(unsigned int *)(v1 + 32);
  int v26 = *(unsigned __int8 *)(v1 + 36);
  uint64_t v10 = *(void *)(v1 + 40);
  uint64_t v24 = *(unsigned int *)(v1 + 48);
  uint64_t v25 = v10;
  int v23 = *(unsigned __int8 *)(v1 + 52);
  uint64_t v22 = *(unsigned int *)(v1 + 56);
  int v21 = *(unsigned __int8 *)(v1 + 60);
  uint64_t v20 = *(unsigned int *)(v1 + 64);
  char v11 = *(unsigned char *)(v1 + 68);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1;
  uint64_t v15 = v14;
  __swift_project_boxed_opaque_existential_1(v13, v12);
  sub_25E2E1AD8();
  sub_25E30AAC0();
  LOBYTE(v34) = 0;
  char v36 = v8;
  uint64_t v16 = v33;
  sub_25E30A8C0();
  if (!v16)
  {
    char v18 = v29;
    char v17 = v30;
    LOBYTE(v34) = 1;
    char v36 = v35;
    sub_25E30A8C0();
    LOBYTE(v34) = 2;
    char v36 = v17;
    sub_25E30A8C0();
    LOBYTE(v34) = 3;
    char v36 = v18;
    sub_25E30A8C0();
    LOBYTE(v34) = 4;
    char v36 = v26;
    sub_25E30A8C0();
    uint64_t v34 = v25;
    char v36 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3920);
    sub_25E2E1B2C();
    sub_25E30A8B0();
    LOBYTE(v34) = 6;
    char v36 = v23;
    sub_25E30A8C0();
    LOBYTE(v34) = 7;
    char v36 = v21;
    sub_25E30A8C0();
    LOBYTE(v34) = 8;
    char v36 = v11;
    sub_25E30A8C0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v15);
}

unint64_t sub_25E2E1AD8()
{
  unint64_t result = qword_26A6E4D78;
  if (!qword_26A6E4D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E4D78);
  }
  return result;
}

unint64_t sub_25E2E1B2C()
{
  unint64_t result = qword_26A6E3928;
  if (!qword_26A6E3928)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3920);
    sub_25E2E2074(&qword_26A6E3930, (void (*)(void))sub_25E2E1BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3928);
  }
  return result;
}

unint64_t sub_25E2E1BD8()
{
  unint64_t result = qword_26A6E3940;
  if (!qword_26A6E3940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3940);
  }
  return result;
}

uint64_t InspectorStatisticsBase.Lighting.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3948);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  int v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E1AD8();
  sub_25E30AAB0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29) = 0;
  uint64_t v10 = sub_25E30A7D0();
  LOBYTE(v29) = 1;
  uint64_t v11 = sub_25E30A7D0();
  LOBYTE(v29) = 2;
  uint64_t v27 = sub_25E30A7D0();
  LOBYTE(v29) = 3;
  uint64_t v26 = sub_25E30A7D0();
  LOBYTE(v29) = 4;
  uint64_t v25 = sub_25E30A7D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3920);
  char v28 = 5;
  sub_25E2E1FC8();
  sub_25E30A7C0();
  uint64_t v12 = v29;
  LOBYTE(v29) = 6;
  uint64_t v24 = v12;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_25E30A7D0();
  LOBYTE(v29) = 7;
  uint64_t v22 = sub_25E30A7D0();
  LOBYTE(v29) = 8;
  uint64_t v14 = sub_25E30A7D0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  *(_DWORD *)a2 = v10;
  *(unsigned char *)(a2 + 4) = BYTE4(v10) & 1;
  *(_DWORD *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 12) = BYTE4(v11) & 1;
  char v15 = BYTE4(v27);
  *(_DWORD *)(a2 + 16) = v27;
  *(unsigned char *)(a2 + 20) = v15 & 1;
  char v16 = BYTE4(v26);
  *(_DWORD *)(a2 + 24) = v26;
  *(unsigned char *)(a2 + 28) = v16 & 1;
  uint64_t v18 = v24;
  char v17 = BYTE4(v25);
  *(_DWORD *)(a2 + 32) = v25;
  *(unsigned char *)(a2 + 36) = v17 & 1;
  *(void *)(a2 + 40) = v18;
  char v19 = BYTE4(v23);
  *(_DWORD *)(a2 + 48) = v23;
  *(unsigned char *)(a2 + 52) = v19 & 1;
  char v20 = BYTE4(v22);
  *(_DWORD *)(a2 + 56) = v22;
  *(unsigned char *)(a2 + 60) = v20 & 1;
  *(_DWORD *)(a2 + 64) = v14;
  *(unsigned char *)(a2 + 68) = BYTE4(v14) & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_25E2E1FC8()
{
  unint64_t result = qword_26A6E3950;
  if (!qword_26A6E3950)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3920);
    sub_25E2E2074(&qword_26A6E3958, (void (*)(void))sub_25E2E20E4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3950);
  }
  return result;
}

uint64_t sub_25E2E2074(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3938);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25E2E20E4()
{
  unint64_t result = qword_26A6E3960;
  if (!qword_26A6E3960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3960);
  }
  return result;
}

uint64_t sub_25E2E2138@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return InspectorStatisticsBase.Lighting.init(from:)(a1, a2);
}

uint64_t sub_25E2E2150(void *a1)
{
  return InspectorStatisticsBase.Lighting.encode(to:)(a1);
}

uint64_t InspectorStatisticsBase.lighting.getter@<X0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 60);
  int v3 = *(_DWORD *)(v1 + 64);
  char v4 = *(unsigned char *)(v1 + 68);
  int v5 = *(_DWORD *)(v1 + 72);
  char v6 = *(unsigned char *)(v1 + 76);
  int v7 = *(_DWORD *)(v1 + 80);
  char v8 = *(unsigned char *)(v1 + 84);
  int v9 = *(_DWORD *)(v1 + 88);
  char v10 = *(unsigned char *)(v1 + 92);
  uint64_t v11 = *(void *)(v1 + 96);
  int v12 = *(_DWORD *)(v1 + 104);
  char v13 = *(unsigned char *)(v1 + 108);
  int v14 = *(_DWORD *)(v1 + 112);
  char v15 = *(unsigned char *)(v1 + 116);
  int v16 = *(_DWORD *)(v1 + 120);
  char v17 = *(unsigned char *)(v1 + 124);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 56);
  *(unsigned char *)(a1 + 4) = v2;
  *(_DWORD *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 12) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 20) = v6;
  *(_DWORD *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 28) = v8;
  *(_DWORD *)(a1 + 32) = v9;
  *(unsigned char *)(a1 + 36) = v10;
  *(void *)(a1 + 40) = v11;
  *(_DWORD *)(a1 + 48) = v12;
  *(unsigned char *)(a1 + 52) = v13;
  *(_DWORD *)(a1 + 56) = v14;
  *(unsigned char *)(a1 + 60) = v15;
  *(_DWORD *)(a1 + 64) = v16;
  *(unsigned char *)(a1 + 68) = v17;
  return swift_bridgeObjectRetain();
}

unint64_t InspectorStatisticsBase.Material.materialAssignmentCount.getter()
{
  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

uint64_t InspectorStatisticsBase.Material.materialUseCounts.getter()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_25E2E221C()
{
  uint64_t v1 = *(void *)(v0 + 8);
  if (!v1) {
    goto LABEL_4;
  }
  unint64_t v2 = *(void *)(v1 + 16);
  if (v2 >> 31)
  {
    __break(1u);
LABEL_4:
    unint64_t v2 = 0;
  }
  return v2 | ((unint64_t)(v1 == 0) << 32);
}

uint64_t InspectorStatisticsBase.Material.init(materialAssignmentCount:materialUseCounts:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_DWORD *)a3 = result;
  *(unsigned char *)(a3 + 4) = BYTE4(result) & 1;
  *(void *)(a3 + 8) = a2;
  return result;
}

BOOL sub_25E2E226C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_25E2E2284()
{
  if (*v0) {
    return 0xD000000000000011;
  }
  else {
    return 0xD000000000000017;
  }
}

uint64_t sub_25E2E22C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2E6080(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E2E22EC(uint64_t a1)
{
  unint64_t v2 = sub_25E2E2530();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2E2328(uint64_t a1)
{
  unint64_t v2 = sub_25E2E2530();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InspectorStatisticsBase.Material.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3968);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  int v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *(unsigned char *)(v1 + 4);
  uint64_t v12 = *(void *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E2530();
  sub_25E30AAC0();
  char v17 = 0;
  char v15 = v8;
  uint64_t v9 = v13;
  sub_25E30A8C0();
  if (!v9)
  {
    uint64_t v14 = v12;
    char v16 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3970);
    sub_25E2E2780(&qword_26A6E3978);
    sub_25E30A8B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_25E2E2530()
{
  unint64_t result = qword_26A6E4D80;
  if (!qword_26A6E4D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E4D80);
  }
  return result;
}

uint64_t InspectorStatisticsBase.Material.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3980);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E2530();
  sub_25E30AAB0();
  if (!v2)
  {
    char v15 = 0;
    uint64_t v10 = sub_25E30A7D0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3970);
    char v14 = 1;
    sub_25E2E2780(&qword_26A6E3988);
    sub_25E30A7C0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    uint64_t v11 = v13[1];
    *(_DWORD *)a2 = v10;
    *(unsigned char *)(a2 + 4) = BYTE4(v10) & 1;
    *(void *)(a2 + 8) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25E2E2780(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3970);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25E2E27E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return InspectorStatisticsBase.Material.init(from:)(a1, a2);
}

uint64_t sub_25E2E2800(void *a1)
{
  return InspectorStatisticsBase.Material.encode(to:)(a1);
}

uint64_t InspectorStatisticsBase.material.getter@<X0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 132);
  uint64_t v3 = *(void *)(v1 + 136);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 128);
  *(unsigned char *)(a1 + 4) = v2;
  *(void *)(a1 + 8) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t InspectorStatisticsBase.Texture.TextureData.assetID.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InspectorStatisticsBase.Texture.TextureData.memorySize.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t InspectorStatisticsBase.Texture.TextureData.width.getter()
{
  return *(unsigned int *)(v0 + 24);
}

uint64_t InspectorStatisticsBase.Texture.TextureData.height.getter()
{
  return *(unsigned int *)(v0 + 28);
}

uint64_t InspectorStatisticsBase.Texture.TextureData.init(assetID:memorySize:width:height:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(_DWORD *)(a6 + 24) = a4;
  *(_DWORD *)(a6 + 28) = a5;
  return result;
}

uint64_t sub_25E2E288C(char a1)
{
  return *(void *)&aAssetid_0[8 * a1];
}

uint64_t sub_25E2E28AC()
{
  return sub_25E2E288C(*v0);
}

uint64_t sub_25E2E28B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2E616C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E2E28DC(uint64_t a1)
{
  unint64_t v2 = sub_25E2E2B30();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2E2918(uint64_t a1)
{
  unint64_t v2 = sub_25E2E2B30();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InspectorStatisticsBase.Texture.TextureData.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3990);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v1 + 16);
  int v13 = *(_DWORD *)(v1 + 24);
  v10[3] = *(_DWORD *)(v1 + 28);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E2B30();
  sub_25E30AAC0();
  char v17 = 0;
  uint64_t v8 = v12;
  sub_25E30A8E0();
  if (!v8)
  {
    char v16 = 1;
    sub_25E30A950();
    char v15 = 2;
    sub_25E30A930();
    char v14 = 3;
    sub_25E30A930();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_25E2E2B30()
{
  unint64_t result = qword_26A6E4D88;
  if (!qword_26A6E4D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E4D88);
  }
  return result;
}

uint64_t InspectorStatisticsBase.Texture.TextureData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3998);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E2B30();
  sub_25E30AAB0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v21 = 0;
  uint64_t v10 = sub_25E30A7F0();
  uint64_t v12 = v11;
  char v20 = 1;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_25E30A860();
  char v19 = 2;
  int v17 = sub_25E30A840();
  char v18 = 3;
  int v14 = sub_25E30A840();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v12;
  *(void *)(a2 + 16) = v16;
  *(_DWORD *)(a2 + 24) = v17;
  *(_DWORD *)(a2 + 28) = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E2E2DC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return InspectorStatisticsBase.Texture.TextureData.init(from:)(a1, a2);
}

uint64_t sub_25E2E2DDC(void *a1)
{
  return InspectorStatisticsBase.Texture.TextureData.encode(to:)(a1);
}

unint64_t InspectorStatisticsBase.Texture.count.getter()
{
  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

uint64_t InspectorStatisticsBase.Texture.memory.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t InspectorStatisticsBase.Texture.textures.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t InspectorStatisticsBase.Texture.entityTextures.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t InspectorStatisticsBase.Texture.init(count:memory:textures:entityTextures:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_DWORD *)a6 = result;
  *(unsigned char *)(a6 + 4) = BYTE4(result) & 1;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = a3 & 1;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_25E2E2E50(char a1)
{
  return *(void *)&aCount_0[8 * a1];
}

uint64_t sub_25E2E2E70()
{
  return sub_25E2E2E50(*v0);
}

uint64_t sub_25E2E2E78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2E6308(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E2E2EA0(uint64_t a1)
{
  unint64_t v2 = sub_25E2E3178();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2E2EDC(uint64_t a1)
{
  unint64_t v2 = sub_25E2E3178();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InspectorStatisticsBase.Texture.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E39A0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *(unsigned char *)(v1 + 4);
  uint64_t v9 = *(void *)(v1 + 8);
  int v20 = *(unsigned __int8 *)(v1 + 16);
  uint64_t v16 = *(void *)(v1 + 24);
  uint64_t v17 = v9;
  uint64_t v15 = *(void *)(v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E3178();
  sub_25E30AAC0();
  LOBYTE(v19) = 0;
  char v21 = v8;
  uint64_t v10 = v18;
  sub_25E30A8C0();
  if (!v10)
  {
    uint64_t v11 = v15;
    uint64_t v12 = v16;
    LOBYTE(v19) = 1;
    sub_25E30A8D0();
    uint64_t v19 = v12;
    char v21 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E39A8);
    sub_25E2E31CC(&qword_26A6E39B0, (void (*)(void))sub_25E2E3248);
    sub_25E30A8B0();
    uint64_t v19 = v11;
    char v21 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E39C0);
    sub_25E2E329C();
    sub_25E30A8B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_25E2E3178()
{
  unint64_t result = qword_26A6E4D90;
  if (!qword_26A6E4D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E4D90);
  }
  return result;
}

uint64_t sub_25E2E31CC(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E39A8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25E2E3248()
{
  unint64_t result = qword_26A6E39B8;
  if (!qword_26A6E39B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E39B8);
  }
  return result;
}

unint64_t sub_25E2E329C()
{
  unint64_t result = qword_26A6E39C8;
  if (!qword_26A6E39C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E39C0);
    sub_25E2E1BD8();
    sub_25E2E3714(&qword_26A6E39D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E39C8);
  }
  return result;
}

uint64_t InspectorStatisticsBase.Texture.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E39E0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E3178();
  sub_25E30AAB0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v22) = 0;
  uint64_t v10 = sub_25E30A7D0();
  LOBYTE(v22) = 1;
  uint64_t v11 = sub_25E30A7E0();
  int v20 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E39A8);
  char v21 = 2;
  sub_25E2E31CC(&qword_26A6E39E8, (void (*)(void))sub_25E2E3620);
  sub_25E30A7C0();
  uint64_t v18 = v11;
  uint64_t v13 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E39C0);
  char v21 = 3;
  sub_25E2E3674();
  uint64_t v19 = v13;
  swift_bridgeObjectRetain();
  sub_25E30A7C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  uint64_t v14 = v22;
  *(_DWORD *)a2 = v10;
  *(unsigned char *)(a2 + 4) = BYTE4(v10) & 1;
  uint64_t v15 = v19;
  *(void *)(a2 + 8) = v18;
  *(unsigned char *)(a2 + 16) = v20 & 1;
  *(void *)(a2 + 24) = v15;
  *(void *)(a2 + 32) = v14;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_25E2E3620()
{
  unint64_t result = qword_26A6E39F0;
  if (!qword_26A6E39F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E39F0);
  }
  return result;
}

unint64_t sub_25E2E3674()
{
  unint64_t result = qword_26A6E39F8;
  if (!qword_26A6E39F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E39C0);
    sub_25E2E20E4();
    sub_25E2E3714(&qword_26A6E3A00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E39F8);
  }
  return result;
}

uint64_t sub_25E2E3714(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E39D8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25E2E3778@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return InspectorStatisticsBase.Texture.init(from:)(a1, a2);
}

uint64_t sub_25E2E3790(void *a1)
{
  return InspectorStatisticsBase.Texture.encode(to:)(a1);
}

uint64_t InspectorStatisticsBase.texture.getter@<X0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 148);
  uint64_t v3 = *(void *)(v1 + 152);
  char v4 = *(unsigned char *)(v1 + 160);
  uint64_t v6 = *(void *)(v1 + 168);
  uint64_t v5 = *(void *)(v1 + 176);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 144);
  *(unsigned char *)(a1 + 4) = v2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

__n128 InspectorStatisticsBase.__allocating_init(geometry:lighting:material:texture:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  *(_DWORD *)(v8 + 16) = *(_DWORD *)a1;
  *(unsigned char *)(v8 + 20) = *(unsigned char *)(a1 + 4);
  *(_DWORD *)(v8 + 24) = *(_DWORD *)(a1 + 8);
  *(unsigned char *)(v8 + 28) = *(unsigned char *)(a1 + 12);
  *(_DWORD *)(v8 + 32) = *(_DWORD *)(a1 + 16);
  *(unsigned char *)(v8 + 36) = *(unsigned char *)(a1 + 20);
  *(void *)(v8 + 40) = *(void *)(a1 + 24);
  *(unsigned char *)(v8 + 48) = *(unsigned char *)(a1 + 32);
  *(_DWORD *)(v8 + 56) = *(_DWORD *)a2;
  *(unsigned char *)(v8 + 60) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(v8 + 64) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(v8 + 68) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(v8 + 72) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(v8 + 76) = *(unsigned char *)(a2 + 20);
  *(_DWORD *)(v8 + 80) = *(_DWORD *)(a2 + 24);
  *(unsigned char *)(v8 + 84) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(v8 + 88) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(v8 + 92) = *(unsigned char *)(a2 + 36);
  *(void *)(v8 + 96) = *(void *)(a2 + 40);
  *(_DWORD *)(v8 + 104) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(v8 + 108) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(v8 + 112) = *(_DWORD *)(a2 + 56);
  *(unsigned char *)(v8 + 116) = *(unsigned char *)(a2 + 60);
  *(_DWORD *)(v8 + 120) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(v8 + 124) = *(unsigned char *)(a2 + 68);
  *(_DWORD *)(v8 + 128) = *(_DWORD *)a3;
  *(unsigned char *)(v8 + 132) = *(unsigned char *)(a3 + 4);
  *(void *)(v8 + 136) = *(void *)(a3 + 8);
  *(_DWORD *)(v8 + 144) = *(_DWORD *)a4;
  *(unsigned char *)(v8 + 148) = *(unsigned char *)(a4 + 4);
  *(void *)(v8 + 152) = *(void *)(a4 + 8);
  *(unsigned char *)(v8 + 160) = *(unsigned char *)(a4 + 16);
  __n128 result = *(__n128 *)(a4 + 24);
  *(__n128 *)(v8 + 168) = result;
  return result;
}

uint64_t InspectorStatisticsBase.init(geometry:lighting:material:texture:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(v4 + 16) = *(_DWORD *)a1;
  *(unsigned char *)(v4 + 20) = *(unsigned char *)(a1 + 4);
  *(_DWORD *)(v4 + 24) = *(_DWORD *)(a1 + 8);
  *(unsigned char *)(v4 + 28) = *(unsigned char *)(a1 + 12);
  *(_DWORD *)(v4 + 32) = *(_DWORD *)(a1 + 16);
  *(unsigned char *)(v4 + 36) = *(unsigned char *)(a1 + 20);
  *(void *)(v4 + 40) = *(void *)(a1 + 24);
  *(unsigned char *)(v4 + 48) = *(unsigned char *)(a1 + 32);
  *(_DWORD *)(v4 + 56) = *(_DWORD *)a2;
  *(unsigned char *)(v4 + 60) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(v4 + 64) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(v4 + 68) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(v4 + 72) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(v4 + 76) = *(unsigned char *)(a2 + 20);
  *(_DWORD *)(v4 + 80) = *(_DWORD *)(a2 + 24);
  *(unsigned char *)(v4 + 84) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(v4 + 88) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(v4 + 92) = *(unsigned char *)(a2 + 36);
  *(void *)(v4 + 96) = *(void *)(a2 + 40);
  *(_DWORD *)(v4 + 104) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(v4 + 108) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(v4 + 112) = *(_DWORD *)(a2 + 56);
  *(unsigned char *)(v4 + 116) = *(unsigned char *)(a2 + 60);
  *(_DWORD *)(v4 + 120) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(v4 + 124) = *(unsigned char *)(a2 + 68);
  *(_DWORD *)(v4 + 128) = *(_DWORD *)a3;
  *(unsigned char *)(v4 + 132) = *(unsigned char *)(a3 + 4);
  *(void *)(v4 + 136) = *(void *)(a3 + 8);
  *(_DWORD *)(v4 + 144) = *(_DWORD *)a4;
  *(unsigned char *)(v4 + 148) = *(unsigned char *)(a4 + 4);
  *(void *)(v4 + 152) = *(void *)(a4 + 8);
  *(unsigned char *)(v4 + 160) = *(unsigned char *)(a4 + 16);
  *(_OWORD *)(v4 + 168) = *(_OWORD *)(a4 + 24);
  return v4;
}

uint64_t sub_25E2E3A64(char a1)
{
  return *(void *)&aGeometrylighti[8 * a1];
}

uint64_t sub_25E2E3A84()
{
  return sub_25E2E3A64(*v0);
}

uint64_t sub_25E2E3A8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2E64B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E2E3AB4(uint64_t a1)
{
  unint64_t v2 = sub_25E2E3EBC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2E3AF0(uint64_t a1)
{
  unint64_t v2 = sub_25E2E3EBC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InspectorStatisticsBase.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InspectorStatisticsBase.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_25E2E3BC4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3A08);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E3EBC();
  sub_25E30AAC0();
  char v10 = *(unsigned char *)(v3 + 20);
  int v11 = *(_DWORD *)(v3 + 24);
  char v12 = *(unsigned char *)(v3 + 28);
  int v13 = *(_DWORD *)(v3 + 32);
  char v14 = *(unsigned char *)(v3 + 36);
  uint64_t v15 = *(void *)(v3 + 40);
  char v16 = *(unsigned char *)(v3 + 48);
  int v40 = *(_DWORD *)(v3 + 16);
  char v41 = v10;
  LODWORD(v42) = v11;
  BYTE4(v42) = v12;
  int v43 = v13;
  char v44 = v14;
  *(void *)&long long v45 = v15;
  BYTE8(v45) = v16;
  char v53 = 0;
  sub_25E2E3F10();
  sub_25E30A920();
  if (!v2)
  {
    char v17 = *(unsigned char *)(v3 + 60);
    int v18 = *(_DWORD *)(v3 + 64);
    char v19 = *(unsigned char *)(v3 + 68);
    int v20 = *(_DWORD *)(v3 + 72);
    char v21 = *(unsigned char *)(v3 + 76);
    int v22 = *(_DWORD *)(v3 + 80);
    char v23 = *(unsigned char *)(v3 + 84);
    int v24 = *(_DWORD *)(v3 + 88);
    char v25 = *(unsigned char *)(v3 + 92);
    uint64_t v26 = *(void *)(v3 + 96);
    int v27 = *(_DWORD *)(v3 + 104);
    char v28 = *(unsigned char *)(v3 + 108);
    int v29 = *(_DWORD *)(v3 + 112);
    char v30 = *(unsigned char *)(v3 + 116);
    int v31 = *(_DWORD *)(v3 + 120);
    char v32 = *(unsigned char *)(v3 + 124);
    int v40 = *(_DWORD *)(v3 + 56);
    char v41 = v17;
    LODWORD(v42) = v18;
    BYTE4(v42) = v19;
    int v43 = v20;
    char v44 = v21;
    LODWORD(v45) = v22;
    BYTE4(v45) = v23;
    DWORD2(v45) = v24;
    BYTE12(v45) = v25;
    uint64_t v46 = v26;
    int v47 = v27;
    char v48 = v28;
    int v49 = v29;
    char v50 = v30;
    int v51 = v31;
    char v52 = v32;
    char v53 = 1;
    sub_25E2E3F64();
    sub_25E30A920();
    char v33 = *(unsigned char *)(v3 + 132);
    uint64_t v34 = *(void *)(v3 + 136);
    int v40 = *(_DWORD *)(v3 + 128);
    char v41 = v33;
    uint64_t v42 = v34;
    char v53 = 2;
    sub_25E2E3FB8();
    sub_25E30A920();
    char v35 = *(unsigned char *)(v3 + 148);
    uint64_t v36 = *(void *)(v3 + 152);
    char v37 = *(unsigned char *)(v3 + 160);
    int v40 = *(_DWORD *)(v3 + 144);
    char v41 = v35;
    uint64_t v42 = v36;
    LOBYTE(v43) = v37;
    long long v45 = *(_OWORD *)(v3 + 168);
    char v53 = 3;
    sub_25E2E400C();
    sub_25E30A920();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_25E2E3EBC()
{
  unint64_t result = qword_26A6E4D98[0];
  if (!qword_26A6E4D98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E4D98);
  }
  return result;
}

unint64_t sub_25E2E3F10()
{
  unint64_t result = qword_26A6E3A10;
  if (!qword_26A6E3A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3A10);
  }
  return result;
}

unint64_t sub_25E2E3F64()
{
  unint64_t result = qword_26A6E3A18;
  if (!qword_26A6E3A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3A18);
  }
  return result;
}

unint64_t sub_25E2E3FB8()
{
  unint64_t result = qword_26A6E3A20;
  if (!qword_26A6E3A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3A20);
  }
  return result;
}

unint64_t sub_25E2E400C()
{
  unint64_t result = qword_26A6E3A28;
  if (!qword_26A6E3A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3A28);
  }
  return result;
}

uint64_t InspectorStatisticsBase.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  InspectorStatisticsBase.init(from:)(a1);
  return v2;
}

uint64_t InspectorStatisticsBase.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3A30);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E3EBC();
  sub_25E30AAB0();
  if (v2)
  {
    type metadata accessor for InspectorStatisticsBase();
    swift_deallocPartialClassInstance();
  }
  else
  {
    char v52 = 0;
    sub_25E2E4480();
    sub_25E30A830();
    char v9 = v40;
    int v10 = v41;
    char v11 = BYTE4(v41);
    int v12 = v42;
    char v13 = v43;
    uint64_t v14 = v44;
    char v15 = BYTE8(v44);
    *(_DWORD *)(v1 + 16) = v39;
    *(unsigned char *)(v1 + 20) = v9;
    *(_DWORD *)(v1 + 24) = v10;
    *(unsigned char *)(v1 + 28) = v11;
    *(_DWORD *)(v1 + 32) = v12;
    *(unsigned char *)(v1 + 36) = v13;
    *(void *)(v1 + 40) = v14;
    *(unsigned char *)(v1 + 48) = v15;
    char v52 = 1;
    sub_25E2E44D4();
    sub_25E30A830();
    char v17 = v40;
    int v18 = v41;
    char v19 = BYTE4(v41);
    int v20 = v42;
    char v21 = v43;
    int v22 = v44;
    char v23 = BYTE4(v44);
    int v24 = DWORD2(v44);
    char v25 = BYTE12(v44);
    uint64_t v26 = v45;
    int v27 = v46;
    char v28 = v47;
    int v29 = v48;
    char v30 = v49;
    int v31 = v50;
    char v32 = v51;
    *(_DWORD *)(v1 + 56) = v39;
    *(unsigned char *)(v1 + 60) = v17;
    *(_DWORD *)(v1 + 64) = v18;
    *(unsigned char *)(v1 + 68) = v19;
    *(_DWORD *)(v1 + 72) = v20;
    *(unsigned char *)(v1 + 76) = v21;
    *(_DWORD *)(v1 + 80) = v22;
    *(unsigned char *)(v1 + 84) = v23;
    *(_DWORD *)(v1 + 88) = v24;
    *(unsigned char *)(v1 + 92) = v25;
    *(void *)(v1 + 96) = v26;
    *(_DWORD *)(v1 + 104) = v27;
    *(unsigned char *)(v1 + 108) = v28;
    *(_DWORD *)(v1 + 112) = v29;
    *(unsigned char *)(v1 + 116) = v30;
    *(_DWORD *)(v1 + 120) = v31;
    *(unsigned char *)(v1 + 124) = v32;
    char v52 = 2;
    sub_25E2E4528();
    sub_25E30A830();
    char v33 = v40;
    uint64_t v34 = v41;
    *(_DWORD *)(v1 + 128) = v39;
    *(unsigned char *)(v1 + 132) = v33;
    *(void *)(v1 + 136) = v34;
    char v52 = 3;
    sub_25E2E457C();
    sub_25E30A830();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    char v35 = v40;
    uint64_t v36 = v41;
    char v37 = v42;
    *(_DWORD *)(v1 + 144) = v39;
    *(unsigned char *)(v1 + 148) = v35;
    *(void *)(v1 + 152) = v36;
    *(unsigned char *)(v1 + 160) = v37;
    *(_OWORD *)(v1 + 168) = v44;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t type metadata accessor for InspectorStatisticsBase()
{
  return self;
}

unint64_t sub_25E2E4480()
{
  unint64_t result = qword_26A6E3A38;
  if (!qword_26A6E3A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3A38);
  }
  return result;
}

unint64_t sub_25E2E44D4()
{
  unint64_t result = qword_26A6E3A40;
  if (!qword_26A6E3A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3A40);
  }
  return result;
}

unint64_t sub_25E2E4528()
{
  unint64_t result = qword_26A6E3A48;
  if (!qword_26A6E3A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3A48);
  }
  return result;
}

unint64_t sub_25E2E457C()
{
  unint64_t result = qword_26A6E3A50;
  if (!qword_26A6E3A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3A50);
  }
  return result;
}

uint64_t sub_25E2E45D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 128))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25E2E460C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

void InspectorEntityStatistics.entityID.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 184);
}

uint64_t InspectorEntityStatistics.descendantCount.getter()
{
  return *(unsigned int *)(v0 + 192);
}

uint64_t sub_25E2E4668()
{
  return 2;
}

uint64_t sub_25E2E4674(char a1)
{
  if (a1) {
    return 0x61646E6563736564;
  }
  else {
    return 0x4449797469746E65;
  }
}

uint64_t sub_25E2E46B8()
{
  return sub_25E2E4674(*v0);
}

uint64_t sub_25E2E46C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2E6658(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E2E46E8(uint64_t a1)
{
  unint64_t v2 = sub_25E2E675C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2E4724(uint64_t a1)
{
  unint64_t v2 = sub_25E2E675C();

  return MEMORY[0x270FA00B8](a1, v2);
}

__n128 InspectorEntityStatistics.__allocating_init(entityID:descendantCount:geometry:lighting:material:texture:)(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 184) = *a1;
  *(_DWORD *)(v12 + 192) = a2;
  *(_DWORD *)(v12 + 16) = *(_DWORD *)a3;
  *(unsigned char *)(v12 + 20) = *(unsigned char *)(a3 + 4);
  *(_DWORD *)(v12 + 24) = *(_DWORD *)(a3 + 8);
  *(unsigned char *)(v12 + 28) = *(unsigned char *)(a3 + 12);
  *(_DWORD *)(v12 + 32) = *(_DWORD *)(a3 + 16);
  *(unsigned char *)(v12 + 36) = *(unsigned char *)(a3 + 20);
  *(void *)(v12 + 40) = *(void *)(a3 + 24);
  *(unsigned char *)(v12 + 48) = *(unsigned char *)(a3 + 32);
  *(_DWORD *)(v12 + 56) = *(_DWORD *)a4;
  *(unsigned char *)(v12 + 60) = *(unsigned char *)(a4 + 4);
  *(_DWORD *)(v12 + 64) = *(_DWORD *)(a4 + 8);
  *(unsigned char *)(v12 + 68) = *(unsigned char *)(a4 + 12);
  *(_DWORD *)(v12 + 72) = *(_DWORD *)(a4 + 16);
  *(unsigned char *)(v12 + 76) = *(unsigned char *)(a4 + 20);
  *(_DWORD *)(v12 + 80) = *(_DWORD *)(a4 + 24);
  *(unsigned char *)(v12 + 84) = *(unsigned char *)(a4 + 28);
  *(_DWORD *)(v12 + 88) = *(_DWORD *)(a4 + 32);
  *(unsigned char *)(v12 + 92) = *(unsigned char *)(a4 + 36);
  *(void *)(v12 + 96) = *(void *)(a4 + 40);
  *(_DWORD *)(v12 + 104) = *(_DWORD *)(a4 + 48);
  *(unsigned char *)(v12 + 108) = *(unsigned char *)(a4 + 52);
  *(_DWORD *)(v12 + 112) = *(_DWORD *)(a4 + 56);
  *(unsigned char *)(v12 + 116) = *(unsigned char *)(a4 + 60);
  *(_DWORD *)(v12 + 120) = *(_DWORD *)(a4 + 64);
  *(unsigned char *)(v12 + 124) = *(unsigned char *)(a4 + 68);
  *(_DWORD *)(v12 + 128) = *(_DWORD *)a5;
  *(unsigned char *)(v12 + 132) = *(unsigned char *)(a5 + 4);
  *(void *)(v12 + 136) = *(void *)(a5 + 8);
  *(_DWORD *)(v12 + 144) = *(_DWORD *)a6;
  *(unsigned char *)(v12 + 148) = *(unsigned char *)(a6 + 4);
  *(void *)(v12 + 152) = *(void *)(a6 + 8);
  *(unsigned char *)(v12 + 160) = *(unsigned char *)(a6 + 16);
  __n128 result = *(__n128 *)(a6 + 24);
  *(__n128 *)(v12 + 168) = result;
  return result;
}

uint64_t InspectorEntityStatistics.init(entityID:descendantCount:geometry:lighting:material:texture:)(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 184) = *a1;
  *(_DWORD *)(v6 + 192) = a2;
  *(_DWORD *)(v6 + 16) = *(_DWORD *)a3;
  *(unsigned char *)(v6 + 20) = *(unsigned char *)(a3 + 4);
  *(_DWORD *)(v6 + 24) = *(_DWORD *)(a3 + 8);
  *(unsigned char *)(v6 + 28) = *(unsigned char *)(a3 + 12);
  *(_DWORD *)(v6 + 32) = *(_DWORD *)(a3 + 16);
  *(unsigned char *)(v6 + 36) = *(unsigned char *)(a3 + 20);
  *(void *)(v6 + 40) = *(void *)(a3 + 24);
  *(unsigned char *)(v6 + 48) = *(unsigned char *)(a3 + 32);
  *(_DWORD *)(v6 + 56) = *(_DWORD *)a4;
  *(unsigned char *)(v6 + 60) = *(unsigned char *)(a4 + 4);
  *(_DWORD *)(v6 + 64) = *(_DWORD *)(a4 + 8);
  *(unsigned char *)(v6 + 68) = *(unsigned char *)(a4 + 12);
  *(_DWORD *)(v6 + 72) = *(_DWORD *)(a4 + 16);
  *(unsigned char *)(v6 + 76) = *(unsigned char *)(a4 + 20);
  *(_DWORD *)(v6 + 80) = *(_DWORD *)(a4 + 24);
  *(unsigned char *)(v6 + 84) = *(unsigned char *)(a4 + 28);
  *(_DWORD *)(v6 + 88) = *(_DWORD *)(a4 + 32);
  *(unsigned char *)(v6 + 92) = *(unsigned char *)(a4 + 36);
  *(void *)(v6 + 96) = *(void *)(a4 + 40);
  *(_DWORD *)(v6 + 104) = *(_DWORD *)(a4 + 48);
  *(unsigned char *)(v6 + 108) = *(unsigned char *)(a4 + 52);
  *(_DWORD *)(v6 + 112) = *(_DWORD *)(a4 + 56);
  *(unsigned char *)(v6 + 116) = *(unsigned char *)(a4 + 60);
  *(_DWORD *)(v6 + 120) = *(_DWORD *)(a4 + 64);
  *(unsigned char *)(v6 + 124) = *(unsigned char *)(a4 + 68);
  *(_DWORD *)(v6 + 128) = *(_DWORD *)a5;
  *(unsigned char *)(v6 + 132) = *(unsigned char *)(a5 + 4);
  *(void *)(v6 + 136) = *(void *)(a5 + 8);
  *(_DWORD *)(v6 + 144) = *(_DWORD *)a6;
  *(unsigned char *)(v6 + 148) = *(unsigned char *)(a6 + 4);
  *(void *)(v6 + 152) = *(void *)(a6 + 8);
  *(unsigned char *)(v6 + 160) = *(unsigned char *)(a6 + 16);
  *(_OWORD *)(v6 + 168) = *(_OWORD *)(a6 + 24);
  return v6;
}

uint64_t InspectorEntityStatistics.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  InspectorEntityStatistics.init(from:)(a1);
  return v2;
}

uint64_t InspectorEntityStatistics.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3A58);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v11[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E675C();
  swift_retain();
  sub_25E30AAB0();
  if (v2)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for InspectorEntityStatistics();
    swift_deallocPartialClassInstance();
  }
  else
  {
    char v12 = 0;
    sub_25E2E20E4();
    sub_25E30A830();
    *(void *)(v1 + 184) = v11[0];
    LOBYTE(v11[0]) = 1;
    *(_DWORD *)(v1 + 192) = sub_25E30A840();
    swift_release();
    sub_25E2DE400((uint64_t)a1, (uint64_t)v11);
    InspectorStatisticsBase.init(from:)(v11);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v1;
}

uint64_t sub_25E2E4C5C(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3A68);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E675C();
  sub_25E30AAC0();
  uint64_t v11 = *(void *)(v1 + 184);
  v10[15] = 0;
  sub_25E2E1BD8();
  sub_25E30A920();
  if (!v2)
  {
    v10[14] = 1;
    sub_25E30A930();
    sub_25E2E3BC4(a1);
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
}

void InspectorEntityStatistics.__allocating_init(geometry:lighting:material:texture:)()
{
}

void InspectorEntityStatistics.init(geometry:lighting:material:texture:)()
{
}

uint64_t InspectorEntityStatistics.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InspectorEntityStatistics.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t InspectorSceneStatistics.entityCount.getter()
{
  return *(unsigned int *)(v0 + 16);
}

uint64_t InspectorSceneStatistics.entityStatistics.getter()
{
  return swift_bridgeObjectRetain();
}

BOOL sub_25E2E4EFC(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_25E2E4F0C()
{
  return sub_25E30AA60();
}

uint64_t sub_25E2E4F38()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2E4F80(char a1)
{
  if (a1) {
    return 0xD000000000000010;
  }
  else {
    return 0x6F43797469746E65;
  }
}

uint64_t sub_25E2E4FC4()
{
  return sub_25E2E4F80(*v0);
}

uint64_t sub_25E2E4FCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2E67D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E2E4FF4(uint64_t a1)
{
  unint64_t v2 = sub_25E2E68F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2E5030(uint64_t a1)
{
  unint64_t v2 = sub_25E2E68F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InspectorSceneStatistics.__allocating_init(entityCount:entityStatistics:)(int a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t InspectorSceneStatistics.init(entityCount:entityStatistics:)(int a1, uint64_t a2)
{
  *(_DWORD *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

uint64_t static InspectorSceneStatistics.from(json:)()
{
  uint64_t v0 = sub_25E30A0A0();
  MEMORY[0x270FA5388](v0, v1);
  sub_25E309FA0();
  swift_allocObject();
  sub_25E309F90();
  sub_25E2E6A9C(&qword_26A6E3A70, (void (*)(void))type metadata accessor for InspectorSceneStatistics);
  sub_25E309F80();
  swift_release();
  return v3;
}

uint64_t sub_25E2E53B0()
{
  uint64_t v0 = sub_25E30A0A0();
  MEMORY[0x270FA5388](v0, v1);
  sub_25E309FD0();
  swift_allocObject();
  sub_25E309FC0();
  type metadata accessor for InspectorSceneStatistics();
  sub_25E2E6A9C(&qword_26A6E3A80, (void (*)(void))type metadata accessor for InspectorSceneStatistics);
  uint64_t v2 = sub_25E309FB0();
  swift_release();
  return v2;
}

uint64_t InspectorSceneStatistics.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  InspectorSceneStatistics.init(from:)(a1);
  return v2;
}

uint64_t InspectorSceneStatistics.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3A88);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E68F0();
  sub_25E30AAB0();
  if (v2)
  {
    type metadata accessor for InspectorSceneStatistics();
    swift_deallocPartialClassInstance();
  }
  else
  {
    char v12 = 0;
    *(_DWORD *)(v1 + 16) = sub_25E30A840();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3A98);
    char v11 = 1;
    sub_25E2E6944();
    sub_25E30A830();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    *(void *)(v1 + 24) = v10[1];
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t sub_25E2E58D8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3AB0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  char v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2E68F0();
  sub_25E30AAC0();
  char v13 = 0;
  sub_25E30A930();
  if (!v2)
  {
    uint64_t v12 = *(void *)(v3 + 24);
    v11[15] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3A98);
    sub_25E2E69F0();
    sub_25E30A920();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t InspectorSceneStatistics.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InspectorSceneStatistics.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_25E2E5AB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 112))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25E2E5AF0()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

uint64_t sub_25E2E5B34(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000025E311DF0 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x747265566873656DLL && a2 == 0xEF746E756F437865 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E756F436873656DLL && a2 == 0xE900000000000074 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F6D654D6873656DLL && a2 == 0xEA00000000007972)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_25E2E5D04(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000025E311E10 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000025E311E30 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x67694C746E696F70 && a2 == 0xEF746E756F437468 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6867694C746F7073 && a2 == 0xEE00746E756F4374 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000025E311E50 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025E311E70 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025E311E90 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000025E311EB0 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000025E311ED0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v5 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

uint64_t sub_25E2E6080(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000017 && a2 == 0x800000025E311EF0 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025E311F10)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25E2E616C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x44497465737361 && a2 == 0xE700000000000000;
  if (v3 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x695379726F6D656DLL && a2 == 0xEA0000000000657ALL || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6874646977 && a2 == 0xE500000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746867696568 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_25E2E6308(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746E756F63 && a2 == 0xE500000000000000;
  if (v3 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79726F6D656DLL && a2 == 0xE600000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7365727574786574 && a2 == 0xE800000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6554797469746E65 && a2 == 0xEE00736572757478)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_25E2E64B4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x797274656D6F6567 && a2 == 0xE800000000000000;
  if (v3 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E69746867696CLL && a2 == 0xE800000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6169726574616DLL && a2 == 0xE800000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65727574786574 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_25E2E6658(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x4449797469746E65 && a2 == 0xE800000000000000;
  if (v3 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61646E6563736564 && a2 == 0xEF746E756F43746ELL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_25E2E675C()
{
  unint64_t result = qword_26A6E3A60;
  if (!qword_26A6E3A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3A60);
  }
  return result;
}

uint64_t type metadata accessor for InspectorEntityStatistics()
{
  return self;
}

uint64_t sub_25E2E67D4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6F43797469746E65 && a2 == 0xEB00000000746E75;
  if (v3 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025E311CF0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t type metadata accessor for InspectorSceneStatistics()
{
  return self;
}

unint64_t sub_25E2E68F0()
{
  unint64_t result = qword_26A6E3A90;
  if (!qword_26A6E3A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3A90);
  }
  return result;
}

unint64_t sub_25E2E6944()
{
  unint64_t result = qword_26A6E3AA0;
  if (!qword_26A6E3AA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3A98);
    sub_25E2E20E4();
    sub_25E2E6A9C(&qword_26A6E3AA8, (void (*)(void))type metadata accessor for InspectorEntityStatistics);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3AA0);
  }
  return result;
}

unint64_t sub_25E2E69F0()
{
  unint64_t result = qword_26A6E3AB8;
  if (!qword_26A6E3AB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3A98);
    sub_25E2E1BD8();
    sub_25E2E6A9C(&qword_26A6E3AC0, (void (*)(void))type metadata accessor for InspectorEntityStatistics);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3AB8);
  }
  return result;
}

uint64_t sub_25E2E6A9C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25E2E6AE4()
{
  unint64_t result = qword_26A6E3AC8;
  if (!qword_26A6E3AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3AC8);
  }
  return result;
}

unint64_t sub_25E2E6B3C()
{
  unint64_t result = qword_26A6E3AD0;
  if (!qword_26A6E3AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3AD0);
  }
  return result;
}

unint64_t sub_25E2E6B94()
{
  unint64_t result = qword_26A6E3AD8;
  if (!qword_26A6E3AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3AD8);
  }
  return result;
}

unint64_t sub_25E2E6BEC()
{
  unint64_t result = qword_26A6E3AE0;
  if (!qword_26A6E3AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3AE0);
  }
  return result;
}

unint64_t sub_25E2E6C44()
{
  unint64_t result = qword_26A6E3AE8;
  if (!qword_26A6E3AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3AE8);
  }
  return result;
}

unint64_t sub_25E2E6C9C()
{
  unint64_t result = qword_26A6E3AF0;
  if (!qword_26A6E3AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3AF0);
  }
  return result;
}

uint64_t method lookup function for InspectorStatisticsBase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InspectorStatisticsBase);
}

uint64_t dispatch thunk of InspectorStatisticsBase.__allocating_init(geometry:lighting:material:texture:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of InspectorStatisticsBase.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of InspectorStatisticsBase.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for InspectorStatisticsBase.Geometry(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for InspectorStatisticsBase.Geometry(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
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
  *(unsigned char *)(result + 33) = v3;
  return result;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Geometry()
{
  return &type metadata for InspectorStatisticsBase.Geometry;
}

uint64_t destroy for InspectorStatisticsBase.Lighting()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InspectorStatisticsBase.Lighting(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  int v3 = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v3;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 60) = *(unsigned char *)(a2 + 60);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InspectorStatisticsBase.Lighting(uint64_t a1, int *a2)
{
  int v4 = *a2;
  *(unsigned char *)(a1 + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)a1 = v4;
  int v5 = a2[2];
  *(unsigned char *)(a1 + 12) = *((unsigned char *)a2 + 12);
  *(_DWORD *)(a1 + 8) = v5;
  int v6 = a2[4];
  *(unsigned char *)(a1 + 20) = *((unsigned char *)a2 + 20);
  *(_DWORD *)(a1 + 16) = v6;
  int v7 = a2[6];
  *(unsigned char *)(a1 + 28) = *((unsigned char *)a2 + 28);
  *(_DWORD *)(a1 + 24) = v7;
  int v8 = a2[8];
  *(unsigned char *)(a1 + 36) = *((unsigned char *)a2 + 36);
  *(_DWORD *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v9 = a2[12];
  *(unsigned char *)(a1 + 52) = *((unsigned char *)a2 + 52);
  *(_DWORD *)(a1 + 48) = v9;
  int v10 = a2[14];
  *(unsigned char *)(a1 + 60) = *((unsigned char *)a2 + 60);
  *(_DWORD *)(a1 + 56) = v10;
  int v11 = a2[16];
  *(unsigned char *)(a1 + 68) = *((unsigned char *)a2 + 68);
  *(_DWORD *)(a1 + 64) = v11;
  return a1;
}

__n128 __swift_memcpy69_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 61) = *(void *)(a2 + 61);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for InspectorStatisticsBase.Lighting(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  int v4 = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 60) = *(unsigned char *)(a2 + 60);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorStatisticsBase.Lighting(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 69)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 40);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for InspectorStatisticsBase.Lighting(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 68) = 0;
    *(_DWORD *)(result + 64) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 69) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 69) = 0;
    }
    if (a2) {
      *(void *)(result + 40) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Lighting()
{
  return &type metadata for InspectorStatisticsBase.Lighting;
}

uint64_t initializeBufferWithCopyOfBuffer for InspectorStatisticsBase.Material(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InspectorStatisticsBase.Material(uint64_t a1, int *a2)
{
  int v3 = *a2;
  *(unsigned char *)(a1 + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)a1 = v3;
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for InspectorStatisticsBase.Material(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorStatisticsBase.Material(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
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

uint64_t storeEnumTagSinglePayload for InspectorStatisticsBase.Material(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Material()
{
  return &type metadata for InspectorStatisticsBase.Material;
}

uint64_t destroy for InspectorStatisticsBase.Texture()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InspectorStatisticsBase.Texture(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InspectorStatisticsBase.Texture(uint64_t a1, int *a2)
{
  int v4 = *a2;
  *(unsigned char *)(a1 + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)a1 = v4;
  uint64_t v5 = *((void *)a2 + 1);
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for InspectorStatisticsBase.Texture(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorStatisticsBase.Texture(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for InspectorStatisticsBase.Texture(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Texture()
{
  return &type metadata for InspectorStatisticsBase.Texture;
}

uint64_t destroy for InspectorStatisticsBase.Texture.TextureData()
{
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for InspectorStatisticsBase.Texture.TextureData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InspectorStatisticsBase.Texture.TextureData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for InspectorStatisticsBase.Texture.TextureData(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorStatisticsBase.Texture.TextureData(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for InspectorStatisticsBase.Texture.TextureData(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Texture.TextureData()
{
  return &type metadata for InspectorStatisticsBase.Texture.TextureData;
}

uint64_t method lookup function for InspectorEntityStatistics(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InspectorEntityStatistics);
}

uint64_t dispatch thunk of InspectorEntityStatistics.__allocating_init(entityID:descendantCount:geometry:lighting:material:texture:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

ValueMetadata *type metadata accessor for InspectorEntityStatistics.CodingKeys()
{
  return &type metadata for InspectorEntityStatistics.CodingKeys;
}

uint64_t method lookup function for InspectorSceneStatistics(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InspectorSceneStatistics);
}

uint64_t dispatch thunk of InspectorSceneStatistics.__allocating_init(entityCount:entityStatistics:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of InspectorSceneStatistics.toJSONData()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of InspectorSceneStatistics.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of InspectorSceneStatistics.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

ValueMetadata *type metadata accessor for InspectorSceneStatistics.CodingKeys()
{
  return &type metadata for InspectorSceneStatistics.CodingKeys;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.CodingKeys()
{
  return &type metadata for InspectorStatisticsBase.CodingKeys;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Texture.CodingKeys()
{
  return &type metadata for InspectorStatisticsBase.Texture.CodingKeys;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Texture.TextureData.CodingKeys()
{
  return &type metadata for InspectorStatisticsBase.Texture.TextureData.CodingKeys;
}

unsigned char *_s26SpatialInspectorFoundation25InspectorEntityStatisticsC10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E2E78B0);
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

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Material.CodingKeys()
{
  return &type metadata for InspectorStatisticsBase.Material.CodingKeys;
}

uint64_t getEnumTagSinglePayload for InspectorStatisticsBase.Lighting.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for InspectorStatisticsBase.Lighting.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *__n128 result = a2 + 8;
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
        JUMPOUT(0x25E2E7A44);
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
          *__n128 result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Lighting.CodingKeys()
{
  return &type metadata for InspectorStatisticsBase.Lighting.CodingKeys;
}

unsigned char *_s26SpatialInspectorFoundation23InspectorStatisticsBaseC10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x25E2E7B48);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Geometry.CodingKeys()
{
  return &type metadata for InspectorStatisticsBase.Geometry.CodingKeys;
}

unint64_t sub_25E2E7B84()
{
  unint64_t result = qword_26A6E5AA0[0];
  if (!qword_26A6E5AA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E5AA0);
  }
  return result;
}

unint64_t sub_25E2E7BDC()
{
  unint64_t result = qword_26A6E5CB0[0];
  if (!qword_26A6E5CB0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E5CB0);
  }
  return result;
}

unint64_t sub_25E2E7C34()
{
  unint64_t result = qword_26A6E5EC0[0];
  if (!qword_26A6E5EC0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E5EC0);
  }
  return result;
}

unint64_t sub_25E2E7C8C()
{
  unint64_t result = qword_26A6E60D0[0];
  if (!qword_26A6E60D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E60D0);
  }
  return result;
}

unint64_t sub_25E2E7CE4()
{
  unint64_t result = qword_26A6E62E0[0];
  if (!qword_26A6E62E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E62E0);
  }
  return result;
}

unint64_t sub_25E2E7D3C()
{
  unint64_t result = qword_26A6E64F0;
  if (!qword_26A6E64F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E64F0);
  }
  return result;
}

unint64_t sub_25E2E7D94()
{
  unint64_t result = qword_26A6E6600;
  if (!qword_26A6E6600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E6600);
  }
  return result;
}

unint64_t sub_25E2E7DEC()
{
  unint64_t result = qword_26A6E6608[0];
  if (!qword_26A6E6608[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E6608);
  }
  return result;
}

unint64_t sub_25E2E7E44()
{
  unint64_t result = qword_26A6E6690;
  if (!qword_26A6E6690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E6690);
  }
  return result;
}

unint64_t sub_25E2E7E9C()
{
  unint64_t result = qword_26A6E6698[0];
  if (!qword_26A6E6698[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E6698);
  }
  return result;
}

unint64_t sub_25E2E7EF4()
{
  unint64_t result = qword_26A6E6720;
  if (!qword_26A6E6720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E6720);
  }
  return result;
}

unint64_t sub_25E2E7F4C()
{
  unint64_t result = qword_26A6E6728[0];
  if (!qword_26A6E6728[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E6728);
  }
  return result;
}

unint64_t sub_25E2E7FA4()
{
  unint64_t result = qword_26A6E67B0;
  if (!qword_26A6E67B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E67B0);
  }
  return result;
}

unint64_t sub_25E2E7FFC()
{
  unint64_t result = qword_26A6E67B8[0];
  if (!qword_26A6E67B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E67B8);
  }
  return result;
}

unint64_t sub_25E2E8054()
{
  unint64_t result = qword_26A6E6840;
  if (!qword_26A6E6840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E6840);
  }
  return result;
}

unint64_t sub_25E2E80AC()
{
  unint64_t result = qword_26A6E6848[0];
  if (!qword_26A6E6848[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E6848);
  }
  return result;
}

unint64_t sub_25E2E8104()
{
  unint64_t result = qword_26A6E68D0;
  if (!qword_26A6E68D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E68D0);
  }
  return result;
}

unint64_t sub_25E2E815C()
{
  unint64_t result = qword_26A6E68D8[0];
  if (!qword_26A6E68D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E68D8);
  }
  return result;
}

uint64_t *sub_25E2E81DC()
{
  return &qword_26A6E3AF8;
}

uint64_t static OS_os_log.spatialInspectorSubsystem.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_26A6E3AF8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static OS_os_log.spatialInspectorSubsystem.setter(uint64_t a1, char *a2)
{
  qword_26A6E3AF8 = a1;
  off_26A6E3B00 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static OS_os_log.spatialInspectorSubsystem.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_25E2E82F0(uint64_t a1)
{
  return sub_25E2E8704(a1, 0x6C6172656E6547, 0xE700000000000000, &qword_26A6EBC90);
}

uint64_t *sub_25E2E8310()
{
  if (qword_26A6E6960 != -1) {
    swift_once();
  }
  return &qword_26A6EBC90;
}

id sub_25E2E835C()
{
  return sub_25E2E8804(&qword_26A6E6960, (void **)&qword_26A6EBC90);
}

uint64_t sub_25E2E8380(uint64_t a1)
{
  return sub_25E2E8704(a1, 0x6C65646F4DLL, 0xE500000000000000, &qword_26A6EBC98);
}

uint64_t *sub_25E2E839C()
{
  if (qword_26A6E6968 != -1) {
    swift_once();
  }
  return &qword_26A6EBC98;
}

id sub_25E2E83E8()
{
  return sub_25E2E8804(&qword_26A6E6968, (void **)&qword_26A6EBC98);
}

uint64_t sub_25E2E840C(uint64_t a1)
{
  return sub_25E2E8704(a1, 0x467974696C616552, 0xEB00000000656C69, &qword_26A6EBCA0);
}

uint64_t *sub_25E2E8434()
{
  if (qword_26A6E6970 != -1) {
    swift_once();
  }
  return &qword_26A6EBCA0;
}

id sub_25E2E8480()
{
  return sub_25E2E8804(&qword_26A6E6970, (void **)&qword_26A6EBCA0);
}

uint64_t sub_25E2E84A4(uint64_t a1)
{
  return sub_25E2E8704(a1, 0x726F74696445, 0xE600000000000000, &qword_26A6EBCA8);
}

uint64_t *sub_25E2E84C0()
{
  if (qword_26A6E6978 != -1) {
    swift_once();
  }
  return &qword_26A6EBCA8;
}

id sub_25E2E850C()
{
  return sub_25E2E8804(&qword_26A6E6978, (void **)&qword_26A6EBCA8);
}

uint64_t sub_25E2E8530(uint64_t a1)
{
  return sub_25E2E8704(a1, 0x6F74636570736E49, 0xEA00000000007372, &qword_26A6EBCB0);
}

uint64_t *sub_25E2E8554()
{
  if (qword_26A6E6980 != -1) {
    swift_once();
  }
  return &qword_26A6EBCB0;
}

id sub_25E2E85A0()
{
  return sub_25E2E8804(&qword_26A6E6980, (void **)&qword_26A6EBCB0);
}

uint64_t sub_25E2E85C4(uint64_t a1)
{
  return sub_25E2E8704(a1, 0x74726F7077656956, 0xE800000000000000, &qword_26A6EBCB8);
}

uint64_t *sub_25E2E85E4()
{
  if (qword_26A6E6988 != -1) {
    swift_once();
  }
  return &qword_26A6EBCB8;
}

id sub_25E2E8630()
{
  return sub_25E2E8804(&qword_26A6E6988, (void **)&qword_26A6EBCB8);
}

uint64_t sub_25E2E8654(uint64_t a1)
{
  return sub_25E2E8704(a1, 0x7562654477656956, 0xEC00000072656767, &qword_26A6EBCC0);
}

uint64_t *sub_25E2E867C()
{
  if (qword_26A6E6990 != -1) {
    swift_once();
  }
  return &qword_26A6EBCC0;
}

id sub_25E2E86C8()
{
  return sub_25E2E8804(&qword_26A6E6990, (void **)&qword_26A6EBCC0);
}

uint64_t sub_25E2E86EC(uint64_t a1)
{
  return sub_25E2E8704(a1, 3062931440, 0xA400000000000000, &qword_26A6EBCC8);
}

uint64_t sub_25E2E8704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_25E2E8E14();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t result = sub_25E30A580();
  *a4 = result;
  return result;
}

uint64_t *sub_25E2E8794()
{
  if (qword_26A6E6998 != -1) {
    swift_once();
  }
  return &qword_26A6EBCC8;
}

id sub_25E2E87E0()
{
  return sub_25E2E8804(&qword_26A6E6998, (void **)&qword_26A6EBCC8);
}

id sub_25E2E8804(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  int v3 = *a2;

  return v3;
}

uint64_t sub_25E2E8850(uint64_t a1)
{
  return sub_25E2E8BE0(a1, qword_26A6E69A8, &qword_26A6E6960, (id *)&qword_26A6EBC90);
}

uint64_t sub_25E2E887C()
{
  return sub_25E2E8C90(&qword_26A6E69A0, (uint64_t)qword_26A6E69A8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Log.general.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E2E8D08(&qword_26A6E69A0, (uint64_t)qword_26A6E69A8, a1);
}

uint64_t sub_25E2E88FC(uint64_t a1)
{
  return sub_25E2E8BE0(a1, qword_26A6E69C8, &qword_26A6E6968, (id *)&qword_26A6EBC98);
}

uint64_t sub_25E2E8928()
{
  return sub_25E2E8C90(&qword_26A6E69C0, (uint64_t)qword_26A6E69C8);
}

uint64_t static Log.model.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E2E8D08(&qword_26A6E69C0, (uint64_t)qword_26A6E69C8, a1);
}

uint64_t sub_25E2E8970(uint64_t a1)
{
  return sub_25E2E8BE0(a1, qword_26A6E69E8, &qword_26A6E6970, (id *)&qword_26A6EBCA0);
}

uint64_t sub_25E2E899C()
{
  return sub_25E2E8C90(&qword_26A6E69E0, (uint64_t)qword_26A6E69E8);
}

uint64_t static Log.realityFile.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E2E8D08(&qword_26A6E69E0, (uint64_t)qword_26A6E69E8, a1);
}

uint64_t sub_25E2E89E4(uint64_t a1)
{
  return sub_25E2E8BE0(a1, qword_26A6E6A08, &qword_26A6E6978, (id *)&qword_26A6EBCA8);
}

uint64_t sub_25E2E8A10()
{
  return sub_25E2E8C90(&qword_26A6E6A00, (uint64_t)qword_26A6E6A08);
}

uint64_t static Log.editor.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E2E8D08(&qword_26A6E6A00, (uint64_t)qword_26A6E6A08, a1);
}

uint64_t sub_25E2E8A58(uint64_t a1)
{
  return sub_25E2E8BE0(a1, qword_26A6E6A28, &qword_26A6E6980, (id *)&qword_26A6EBCB0);
}

uint64_t sub_25E2E8A84()
{
  return sub_25E2E8C90(&qword_26A6E6A20, (uint64_t)qword_26A6E6A28);
}

uint64_t static Log.inspectors.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E2E8D08(&qword_26A6E6A20, (uint64_t)qword_26A6E6A28, a1);
}

uint64_t sub_25E2E8ACC(uint64_t a1)
{
  return sub_25E2E8BE0(a1, qword_26A6E6A48, &qword_26A6E6988, (id *)&qword_26A6EBCB8);
}

uint64_t sub_25E2E8AF8()
{
  return sub_25E2E8C90(&qword_26A6E6A40, (uint64_t)qword_26A6E6A48);
}

uint64_t static Log.viewport.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E2E8D08(&qword_26A6E6A40, (uint64_t)qword_26A6E6A48, a1);
}

uint64_t sub_25E2E8B40(uint64_t a1)
{
  return sub_25E2E8BE0(a1, qword_26A6E6A68, &qword_26A6E6990, (id *)&qword_26A6EBCC0);
}

uint64_t sub_25E2E8B6C()
{
  return sub_25E2E8C90(&qword_26A6E6A60, (uint64_t)qword_26A6E6A68);
}

uint64_t static Log.viewDebugger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E2E8D08(&qword_26A6E6A60, (uint64_t)qword_26A6E6A68, a1);
}

uint64_t sub_25E2E8BB4(uint64_t a1)
{
  return sub_25E2E8BE0(a1, qword_26A6E6A88, &qword_26A6E6998, (id *)&qword_26A6EBCC8);
}

uint64_t sub_25E2E8BE0(uint64_t a1, uint64_t *a2, void *a3, id *a4)
{
  uint64_t v7 = sub_25E30A0A0();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  id v8 = *a4;
  return sub_25E30A0B0();
}

uint64_t sub_25E2E8C6C()
{
  return sub_25E2E8C90(&qword_26A6E6A80, (uint64_t)qword_26A6E6A88);
}

uint64_t sub_25E2E8C90(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25E30A0A0();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Log.temp.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25E2E8D08(&qword_26A6E6A80, (uint64_t)qword_26A6E6A88, a1);
}

uint64_t sub_25E2E8D08@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25E30A0A0();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_25E2E8E14()
{
  unint64_t result = qword_26A6E3B08;
  if (!qword_26A6E3B08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A6E3B08);
  }
  return result;
}

float sub_25E2E8E54(double a1)
{
  double v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3D78);
  uint64_t v1 = MEMORY[0x263F8D538];
  if (swift_dynamicCast())
  {
    sub_25E2DE4C8(&v18, (uint64_t)v16);
    uint64_t v2 = v17;
    uint64_t v3 = __swift_project_boxed_opaque_existential_1(v16, v17);
    uint64_t v4 = *(void *)(v2 - 8);
    MEMORY[0x270FA5388](v3, v3);
    uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v4 + 16))(v6);
    if (sub_25E30A600() < 65)
    {
      char v12 = sub_25E30A610();
      uint64_t v13 = sub_25E30A5F0();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
      if (v12) {
        float v7 = (float)v13;
      }
      else {
        float v7 = (float)(unint64_t)v13;
      }
    }
    else
    {
      sub_25E2F1DF4();
      sub_25E2F1E48();
      sub_25E30A0F0();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
      float v7 = *(float *)&v15[1];
    }
  }
  else
  {
    uint64_t v19 = v1;
    unint64_t v20 = sub_25E2EF62C();
    *(double *)&long long v18 = v21;
    sub_25E2DE4C8(&v18, (uint64_t)v16);
    id v8 = __swift_project_boxed_opaque_existential_1(v16, v17);
    MEMORY[0x270FA5388](v8, v8);
    int v10 = (double *)((char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(double *))(v11 + 16))(v10);
    float v7 = *v10;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return v7;
}

float sub_25E2E9110(int a1)
{
  uint64_t v12 = MEMORY[0x263F8E8F8];
  unint64_t v13 = sub_25E2F1DA0();
  LODWORD(v11) = a1;
  sub_25E2DE4C8(&v11, (uint64_t)v9);
  uint64_t v2 = v10;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v3, v3);
  uint64_t v6 = (unsigned int *)((char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(unsigned int *))(v4 + 16))(v6);
  if (sub_25E30A610()) {
    float v7 = (float)sub_25E30A5F0();
  }
  else {
    float v7 = (float)*v6;
  }
  (*(void (**)(unsigned int *, uint64_t))(v4 + 8))(v6, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

float sub_25E2E9268(__int16 a1)
{
  uint64_t v13 = MEMORY[0x263F8E888];
  unint64_t v14 = sub_25E2F1D4C();
  LOWORD(v12) = a1;
  sub_25E2DE4C8(&v12, (uint64_t)v10);
  uint64_t v2 = v11;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v10, v11);
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v3, v3);
  uint64_t v6 = (_WORD *)((char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_WORD *))(v4 + 16))(v6);
  if (sub_25E30A610())
  {
    float v8 = (float)sub_25E30A5F0();
  }
  else
  {
    LOWORD(v7) = *v6;
    float v8 = (float)v7;
  }
  (*(void (**)(_WORD *, uint64_t))(v4 + 8))(v6, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v8;
}

float sub_25E2E93C0(char a1)
{
  uint64_t v13 = MEMORY[0x263F8E778];
  unint64_t v14 = sub_25E2F1CF8();
  LOBYTE(v12) = a1;
  sub_25E2DE4C8(&v12, (uint64_t)v10);
  uint64_t v2 = v11;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v10, v11);
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v3, v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(unsigned char *))(v4 + 16))(v6);
  if (sub_25E30A610())
  {
    float v8 = (float)sub_25E30A5F0();
  }
  else
  {
    LOBYTE(v7) = *v6;
    float v8 = (float)v7;
  }
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v8;
}

float sub_25E2E9518(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v14 = a2;
  uint64_t v15 = a3();
  *(void *)&long long v13 = a1;
  sub_25E2DE4C8(&v13, (uint64_t)v11);
  uint64_t v4 = v12;
  uint64_t v5 = __swift_project_boxed_opaque_existential_1(v11, v12);
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v5, v5);
  float v8 = (void *)((char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(unint64_t *))(v6 + 16))(v8);
  if (sub_25E30A610()) {
    float v9 = (float)sub_25E30A5F0();
  }
  else {
    float v9 = (float)*v8;
  }
  (*(void (**)(unint64_t *, uint64_t))(v6 + 8))(v8, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v9;
}

float sub_25E2E966C(int a1)
{
  uint64_t v12 = MEMORY[0x263F8E548];
  unint64_t v13 = sub_25E2F1C50();
  LODWORD(v11) = a1;
  sub_25E2DE4C8(&v11, (uint64_t)v9);
  uint64_t v2 = v10;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v3, v3);
  uint64_t v6 = (int *)((char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(int *))(v4 + 16))(v6);
  if (sub_25E30A610()) {
    float v7 = (float)sub_25E30A5F0();
  }
  else {
    float v7 = (float)(unint64_t)*v6;
  }
  (*(void (**)(int *, uint64_t))(v4 + 8))(v6, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

float sub_25E2E97C4(__int16 a1)
{
  uint64_t v12 = MEMORY[0x263F8E4F0];
  unint64_t v13 = sub_25E2F1BFC();
  LOWORD(v11) = a1;
  sub_25E2DE4C8(&v11, (uint64_t)v9);
  uint64_t v2 = v10;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v3, v3);
  uint64_t v6 = (__int16 *)((char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(__int16 *))(v4 + 16))(v6);
  if (sub_25E30A610()) {
    float v7 = (float)sub_25E30A5F0();
  }
  else {
    float v7 = (float)(unint64_t)*v6;
  }
  (*(void (**)(__int16 *, uint64_t))(v4 + 8))(v6, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

float sub_25E2E991C(char a1)
{
  uint64_t v12 = MEMORY[0x263F8E498];
  unint64_t v13 = sub_25E2F1BA8();
  LOBYTE(v11) = a1;
  sub_25E2DE4C8(&v11, (uint64_t)v9);
  uint64_t v2 = v10;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v3, v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  if (sub_25E30A610()) {
    float v7 = (float)sub_25E30A5F0();
  }
  else {
    float v7 = (float)(unint64_t)*v6;
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

id InspectorPropertyValue.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void **)v1;
  unint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  char v6 = *(unsigned char *)(v1 + 32);
  *(unsigned char *)(a1 + 32) = v6;
  return sub_25E2E9A90(v2, v3, v4, v5, v6);
}

id sub_25E2E9A90(id result, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 4:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 17:
    case 18:
    case 21:
    case 25:
    case 26:
    case 27:
      goto LABEL_3;
    case 14:
      unint64_t result = result;
      break;
    case 15:
      unint64_t result = (id)sub_25E2DBE30((uint64_t)result, a2);
      break;
    case 22:
    case 23:
    case 24:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_3:
      unint64_t result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t InspectorPropertyValue.init(anyValue:)@<X0>(char *a1@<X0>, uint16x8_t *a2@<X8>)
{
  v185 = a2;
  v184.i64[0] = sub_25E30A040();
  *(void *)&long long v182 = *(void *)(v184.i64[0] - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v184.i64[0], v3);
  unint64_t v6 = (unint64_t)&v175 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4, v7);
  float v9 = (char *)&v175 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B10);
  MEMORY[0x270FA5388](v10 - 8, v11);
  *(void *)&long long v181 = (char *)&v175 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25E309F60();
  *(void *)&long long v180 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13, v14);
  char v16 = (char *)&v175 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_25E309FE0();
  *(void *)&long long v179 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17, v18);
  double v21 = (long long *)((char *)&v175 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = MEMORY[0x270FA5388](v19, v22);
  char v25 = (char *)&v175 - v24;
  MEMORY[0x270FA5388](v23, v26);
  char v28 = (char *)&v175 - v27;
  sub_25E2ECBB0((uint64_t)a1, (uint64_t)v198);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B18);
  if (swift_dynamicCast())
  {
    sub_25E2DE4C8(&v190, (uint64_t)v187);
    int v29 = __swift_project_boxed_opaque_existential_1(v187, (uint64_t)v188);
    MEMORY[0x270FA5388](v29, v29);
    (*(void (**)(char *))(v31 + 16))((char *)&v175 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
    sub_25E2EF6D4();
    sub_25E30A710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    v32.i64[0] = v186;
    uint16x8_t v184 = v32;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v187);
    char v33 = 0;
LABEL_31:
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v198);
    v75 = v185;
    uint16x8_t *v185 = v184;
    v75[1].i64[0] = 0;
    v75[1].i64[1] = 0;
    v75[2].i8[0] = v33;
    return result;
  }
  v183 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B20);
  if (!swift_dynamicCast())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B28);
    if (swift_dynamicCast())
    {
      sub_25E2DE4C8(&v190, (uint64_t)v187);
      v54 = __swift_project_boxed_opaque_existential_1(v187, (uint64_t)v188);
      MEMORY[0x270FA5388](v54, v54);
      (*(void (**)(char *))(v56 + 16))((char *)&v175 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0));
      sub_25E2EF62C();
      sub_25E30A0E0();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
      v57.i64[0] = v186;
      uint16x8_t v184 = v57;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v187);
      char v33 = 2;
      goto LABEL_31;
    }
    if (swift_dynamicCast())
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
      uint16x8_t v184 = (uint16x8_t)v190;
      char v33 = 3;
      goto LABEL_31;
    }
    if (swift_dynamicCast())
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
      uint16x8_t v184 = (uint16x8_t)v190;
      char v33 = 4;
      goto LABEL_31;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B30);
    if (swift_dynamicCast())
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
      v60.i64[0] = v190;
      uint16x8_t v184 = v60;
      char v33 = 5;
      goto LABEL_31;
    }
    goto LABEL_27;
  }
  sub_25E2DE4C8(&v190, (uint64_t)v187);
  char v28 = v188;
  uint64_t v34 = v189;
  char v35 = __swift_project_boxed_opaque_existential_1(v187, (uint64_t)v188);
  uint64_t v36 = &v175;
  char v25 = (char *)*((void *)v28 - 1);
  uint64_t v37 = *((void *)v25 + 8);
  MEMORY[0x270FA5388](v35, v35);
  double v21 = (long long *)((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  float v9 = (char *)((char *)&v175 - (char *)v21);
  uint64_t v17 = (uint64_t)(v25 + 16);
  *(void *)&long long v180 = *((void *)v25 + 2);
  ((void (*)(int64_t))v180)((char *)&v175 - (char *)v21);
  uint64_t v13 = *(void *)(v34 + 8);
  char v38 = sub_25E30A610();
  v184.i64[0] = (char *)&v175 - (char *)v21;
  if (v38)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    *(void *)&long long v182 = v13;
    *(void *)&long long v179 = &v175;
    MEMORY[0x270FA5388](AssociatedTypeWitness, v40);
    char v16 = (char *)&v175 - v41;
    swift_getAssociatedConformanceWitness();
    uint64_t v42 = sub_25E30A9E0();
    *(void *)&long long v181 = &v175;
    MEMORY[0x270FA5388](v42, v43);
    float v9 = (char *)v184.i64[0];
    sub_25E30A980();
    unint64_t v6 = sub_25E30A200();
    uint64_t v13 = v182;
    (*((void (**)(int64_t, char *))v25 + 1))((char *)&v175 - (char *)v21, v28);
    uint64_t v36 = (long long *)v181;
    if ((v6 & 1) == 0)
    {
      __break(1u);
      goto LABEL_51;
    }
  }
  uint64_t v44 = sub_25E30A600();
  char v16 = v183;
  if (v44 < 64) {
    goto LABEL_30;
  }
  double v21 = &v175;
  MEMORY[0x270FA5388](v44, v45);
  int v46 = v9;
  char v47 = (char *)&v175 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  ((void (*)(char *, char *, char *))v180)(v47, v46, v28);
  unint64_t v186 = -1;
  char v48 = sub_25E30A610();
  uint64_t v49 = v13;
  char v50 = v48;
  uint64_t v17 = v49;
  uint64_t v51 = sub_25E30A600();
  if (v50)
  {
    *(void *)&long long v180 = &v175;
    *(void *)&long long v181 = v36;
    if (v51 <= 64)
    {
      uint64_t v61 = swift_getAssociatedTypeWitness();
      *(void *)&long long v179 = &v175;
      MEMORY[0x270FA5388](v61, v62);
      swift_getAssociatedConformanceWitness();
      uint64_t v63 = sub_25E30A9E0();
      *(void *)&long long v178 = &v175;
      MEMORY[0x270FA5388](v63, v64);
      unint64_t v65 = (v37 + 15) & 0xFFFFFFFFFFFFFFF0;
      sub_25E30A980();
      *(void *)&long long v182 = v17;
      char v66 = sub_25E30A1E0();
      uint64_t v17 = (uint64_t)(v25 + 8);
      v67 = (uint64_t (*)(char *, char *))*((void *)v25 + 1);
      uint64_t v68 = v67((char *)&v175 - v65, v28);
      *(void *)&long long v179 = v186;
      MEMORY[0x270FA5388](v68, v69);
      unint64_t v6 = (unint64_t)&v175 - v65;
      (*((void (**)(char *, char *, char *))v25 + 4))((char *)&v175 - v65, (char *)&v175 - v65, v28);
      if (v66)
      {
        uint64_t v13 = v182;
        unint64_t v70 = sub_25E30A5F0();
        v67((char *)v6, v28);
        char v16 = v183;
        float v9 = (char *)v184.i64[0];
        double v21 = (long long *)v180;
        if ((unint64_t)v179 < v70) {
          goto LABEL_26;
        }
      }
      else
      {
        v67((char *)v6, v28);
        char v16 = v183;
        float v9 = (char *)v184.i64[0];
      }
    }
    else
    {
      MEMORY[0x270FA5388](v51, v52);
      sub_25E2EF680();
      sub_25E30A5E0();
      unint64_t v6 = sub_25E30A1F0();
      char v53 = (void (*)(char *, char *))*((void *)v25 + 1);
      v53((char *)&v175 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0), v28);
      v53(v47, v28);
      uint64_t v13 = v17;
      float v9 = (char *)v184.i64[0];
      double v21 = (long long *)v180;
      if (v6) {
        goto LABEL_26;
      }
    }
LABEL_30:
    uint64_t v73 = sub_25E30A5F0();
    (*((void (**)(char *, char *))v25 + 1))(v9, v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v187);
    uint16x8_t v184 = (uint16x8_t)(unint64_t)v73;
    char v33 = 1;
    goto LABEL_31;
  }
  if (v51 >= 65)
  {
    *(void *)&long long v182 = &v175;
    MEMORY[0x270FA5388](v51, v52);
    sub_25E2EF680();
    *(void *)&long long v180 = &v175;
    uint64_t v58 = v17;
    sub_25E30A5E0();
    unint64_t v6 = sub_25E30A1F0();
    uint64_t v17 = (uint64_t)v36;
    v59 = (void (*)(char *, char *))*((void *)v25 + 1);
    v59((char *)&v175 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0), v28);
    v59(v47, v28);
    uint64_t v13 = v58;
    double v21 = (long long *)v180;
    float v9 = (char *)v184.i64[0];
    if (v6) {
      goto LABEL_26;
    }
    goto LABEL_30;
  }
  uint64_t v13 = v17;
  unint64_t v6 = sub_25E30A5F0();
  (*((void (**)(char *, char *))v25 + 1))((char *)&v175 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0), v28);
  float v9 = (char *)v184.i64[0];
  if (v186 >= v6) {
    goto LABEL_30;
  }
LABEL_26:
  __break(1u);
LABEL_27:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B38);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C440;
    *(float *)(v71 + 32) = sub_25E2E8E54(*(double *)v184.i64);
    float v72 = sub_25E2E8E54(*(double *)&v184.i64[1]);
LABEL_41:
    *(float *)(v71 + 36) = v72;
LABEL_42:
    sub_25E2EF54C(v71);
    uint16x8_t v184 = v83;
    swift_setDeallocating();
LABEL_43:
    swift_deallocClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
    char v33 = 6;
    goto LABEL_31;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B40);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C440;
    uint64_t v76 = v184.i64[0];
    uint64_t v77 = MEMORY[0x263F8D6C8];
    v78 = sub_25E2F1B54;
LABEL_34:
    v79 = (uint64_t (*)(void))v78;
    *(float *)(v71 + 32) = sub_25E2E9518(v76, v77, (uint64_t (*)(void))v78);
    float v72 = sub_25E2E9518(v184.i64[1], v77, v79);
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B48);
  if (swift_dynamicCast())
  {
    v80.i8[4] = BYTE1(v190);
    v80.i8[0] = v190;
    uint16x8_t v184 = v80;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C440;
    *(float *)(v71 + 32) = sub_25E2E991C(v184.i8[0]);
    float v72 = sub_25E2E991C(v184.i8[4]);
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B50);
  if (swift_dynamicCast())
  {
    v81.i16[2] = WORD1(v190);
    v81.i16[0] = v190;
    uint16x8_t v184 = v81;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C440;
    *(float *)(v71 + 32) = sub_25E2E97C4(v184.i16[0]);
    float v72 = sub_25E2E97C4(v184.i16[2]);
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B58);
  if (swift_dynamicCast())
  {
    v82.i64[0] = v190;
    uint16x8_t v184 = v82;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C440;
    *(float *)(v71 + 32) = sub_25E2E966C(v184.i32[0]);
    float v72 = sub_25E2E966C(v184.i32[1]);
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B60);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C440;
    uint64_t v76 = v184.i64[0];
    uint64_t v77 = MEMORY[0x263F8E5C0];
    v78 = sub_25E2F1CA4;
    goto LABEL_34;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B68);
  if (swift_dynamicCast())
  {
    v84.i8[4] = BYTE1(v190);
    v84.i8[0] = v190;
    uint16x8_t v184 = v84;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C440;
    *(float *)(v71 + 32) = sub_25E2E93C0(v184.i8[0]);
    float v72 = sub_25E2E93C0(v184.i8[4]);
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B70);
  if (swift_dynamicCast())
  {
    v85.i16[2] = WORD1(v190);
    v85.i16[0] = v190;
    uint16x8_t v184 = v85;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C440;
    *(float *)(v71 + 32) = sub_25E2E9268(v184.i16[0]);
    float v72 = sub_25E2E9268(v184.i16[2]);
    goto LABEL_41;
  }
LABEL_51:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B78);
  if (swift_dynamicCast())
  {
    v86.i64[0] = v190;
    uint16x8_t v184 = v86;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C440;
    *(float *)(v71 + 32) = sub_25E2E9110(v184.i32[0]);
    float v72 = sub_25E2E9110(v184.i32[1]);
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B80);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C440;
    uint64_t v76 = v184.i64[0];
    uint64_t v77 = MEMORY[0x263F8E970];
    v78 = sub_25E2EF680;
    goto LABEL_34;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3848);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
    uint16x8_t v184 = (uint16x8_t)v190;
    char v33 = 6;
    goto LABEL_31;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B88);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    double v87 = *(double *)&v191;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C430;
    *(float *)(v71 + 32) = sub_25E2E8E54(*(double *)v184.i64);
    *(float *)(v71 + 36) = sub_25E2E8E54(*(double *)&v184.i64[1]);
    *(float *)(v71 + 40) = sub_25E2E8E54(v87);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B90);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    uint64_t v88 = v191;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_25E30C430;
    uint64_t v90 = v184.i64[0];
    uint64_t v91 = MEMORY[0x263F8D6C8];
    v92 = sub_25E2F1B54;
LABEL_61:
    v93 = (uint64_t (*)(void))v92;
    *(float *)(v89 + 32) = sub_25E2E9518(v90, v91, (uint64_t (*)(void))v92);
    *(float *)(v89 + 36) = sub_25E2E9518(v184.i64[1], v91, v93);
    *(float *)(v89 + 40) = sub_25E2E9518(v88, v91, v93);
    sub_25E2EF54C(v89);
    uint16x8_t v184 = v94;
    swift_setDeallocating();
    goto LABEL_43;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B98);
  if (swift_dynamicCast())
  {
    v95.i32[0] = v190;
    uint16x8_t v184 = vmovl_u8(v95);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C430;
    *(float *)(v71 + 32) = sub_25E2E991C(v184.i8[0]);
    *(float *)(v71 + 36) = sub_25E2E991C(v184.i8[2]);
    *(float *)(v71 + 40) = sub_25E2E991C(v184.i8[4]);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BA0);
  if (swift_dynamicCast())
  {
    v96.i64[0] = v190;
    uint16x8_t v184 = v96;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C430;
    *(float *)(v71 + 32) = sub_25E2E97C4(v184.i16[0]);
    *(float *)(v71 + 36) = sub_25E2E97C4(v184.i16[1]);
    *(float *)(v71 + 40) = sub_25E2E97C4(v184.i16[2]);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BA8);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C430;
    *(float *)(v71 + 32) = sub_25E2E966C(v184.i32[0]);
    *(float *)(v71 + 36) = sub_25E2E966C(v184.i32[1]);
    *(float *)(v71 + 40) = sub_25E2E966C(v184.i32[2]);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BB0);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    uint64_t v88 = v191;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_25E30C430;
    uint64_t v90 = v184.i64[0];
    uint64_t v91 = MEMORY[0x263F8E5C0];
    v92 = sub_25E2F1CA4;
    goto LABEL_61;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BB8);
  if (swift_dynamicCast())
  {
    v97.i32[0] = v190;
    uint16x8_t v184 = vmovl_u8(v97);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C430;
    *(float *)(v71 + 32) = sub_25E2E93C0(v184.i8[0]);
    *(float *)(v71 + 36) = sub_25E2E93C0(v184.i8[2]);
    *(float *)(v71 + 40) = sub_25E2E93C0(v184.i8[4]);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BC0);
  if (swift_dynamicCast())
  {
    v98.i64[0] = v190;
    uint16x8_t v184 = v98;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C430;
    *(float *)(v71 + 32) = sub_25E2E9268(v184.i16[0]);
    *(float *)(v71 + 36) = sub_25E2E9268(v184.i16[1]);
    *(float *)(v71 + 40) = sub_25E2E9268(v184.i16[2]);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BC8);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25E30C430;
    *(float *)(v71 + 32) = sub_25E2E9110(v184.i32[0]);
    *(float *)(v71 + 36) = sub_25E2E9110(v184.i32[1]);
    *(float *)(v71 + 40) = sub_25E2E9110(v184.i32[2]);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BD0);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    uint64_t v88 = v191;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_25E30C430;
    uint64_t v90 = v184.i64[0];
    uint64_t v91 = MEMORY[0x263F8E970];
    v92 = sub_25E2EF680;
    goto LABEL_61;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BD8);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
    uint16x8_t v184 = (uint16x8_t)v190;
    char v33 = 7;
    goto LABEL_31;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BE0);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v191;
    long long v182 = v190;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    char v33 = 7;
    uint64_t v99 = swift_allocObject();
    *(_OWORD *)(v99 + 16) = xmmword_25E30C420;
    *(float *)(v99 + 32) = sub_25E2E8E54(*(double *)&v182);
    *(float *)(v99 + 36) = sub_25E2E8E54(*((double *)&v182 + 1));
    *(float *)(v99 + 40) = sub_25E2E8E54(*(double *)v184.i64);
    *(float *)(v99 + 44) = sub_25E2E8E54(*(double *)&v184.i64[1]);
    sub_25E2EF5BC(v99);
    uint16x8_t v184 = v100;
    swift_setDeallocating();
    swift_deallocClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
    goto LABEL_31;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BE8);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v191;
    long long v182 = v190;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v101 = swift_allocObject();
    *(_OWORD *)(v101 + 16) = xmmword_25E30C420;
    uint64_t v102 = v182;
    uint64_t v103 = MEMORY[0x263F8D6C8];
    v104 = sub_25E2F1B54;
LABEL_84:
    v105 = (uint64_t (*)(void))v104;
    *(float *)(v101 + 32) = sub_25E2E9518(v102, v103, (uint64_t (*)(void))v104);
    *(float *)(v101 + 36) = sub_25E2E9518(*((uint64_t *)&v182 + 1), v103, v105);
    *(float *)(v101 + 40) = sub_25E2E9518(v184.i64[0], v103, v105);
    *(float *)(v101 + 44) = sub_25E2E9518(v184.i64[1], v103, v105);
    sub_25E2EF5BC(v101);
    uint16x8_t v184 = v106;
    swift_setDeallocating();
    swift_deallocClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
    char v33 = 7;
    goto LABEL_31;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BF0);
  if (swift_dynamicCast())
  {
    v107.i32[0] = v190;
    uint16x8_t v184 = vmovl_u8(v107);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    char v33 = 7;
    uint64_t v108 = swift_allocObject();
    *(_OWORD *)(v108 + 16) = xmmword_25E30C420;
    *(float *)(v108 + 32) = sub_25E2E991C(v184.i8[0]);
    *(float *)(v108 + 36) = sub_25E2E991C(v184.i8[2]);
    *(float *)(v108 + 40) = sub_25E2E991C(v184.i8[4]);
    float v109 = sub_25E2E991C(v184.i8[6]);
LABEL_91:
    *(float *)(v108 + 44) = v109;
    sub_25E2EF5BC(v108);
    uint16x8_t v184 = v111;
    swift_setDeallocating();
    swift_deallocClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
    goto LABEL_31;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BF8);
  if (swift_dynamicCast())
  {
    v110.i64[0] = v190;
    uint16x8_t v184 = v110;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    char v33 = 7;
    uint64_t v108 = swift_allocObject();
    *(_OWORD *)(v108 + 16) = xmmword_25E30C420;
    *(float *)(v108 + 32) = sub_25E2E97C4(v184.i16[0]);
    *(float *)(v108 + 36) = sub_25E2E97C4(v184.i16[1]);
    *(float *)(v108 + 40) = sub_25E2E97C4(v184.i16[2]);
    float v109 = sub_25E2E97C4(v184.i16[3]);
    goto LABEL_91;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C00);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    char v33 = 7;
    uint64_t v108 = swift_allocObject();
    *(_OWORD *)(v108 + 16) = xmmword_25E30C420;
    *(float *)(v108 + 32) = sub_25E2E966C(v184.i32[0]);
    *(float *)(v108 + 36) = sub_25E2E966C(v184.i32[1]);
    *(float *)(v108 + 40) = sub_25E2E966C(v184.i32[2]);
    float v109 = sub_25E2E966C(v184.i32[3]);
    goto LABEL_91;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C08);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v191;
    long long v182 = v190;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v101 = swift_allocObject();
    *(_OWORD *)(v101 + 16) = xmmword_25E30C420;
    uint64_t v102 = v182;
    uint64_t v103 = MEMORY[0x263F8E5C0];
    v104 = sub_25E2F1CA4;
    goto LABEL_84;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C10);
  if (swift_dynamicCast())
  {
    v112.i32[0] = v190;
    uint16x8_t v184 = vmovl_u8(v112);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    char v33 = 7;
    uint64_t v108 = swift_allocObject();
    *(_OWORD *)(v108 + 16) = xmmword_25E30C420;
    *(float *)(v108 + 32) = sub_25E2E93C0(v184.i8[0]);
    *(float *)(v108 + 36) = sub_25E2E93C0(v184.i8[2]);
    *(float *)(v108 + 40) = sub_25E2E93C0(v184.i8[4]);
    float v109 = sub_25E2E93C0(v184.i8[6]);
    goto LABEL_91;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C18);
  if (swift_dynamicCast())
  {
    v113.i64[0] = v190;
    uint16x8_t v184 = v113;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    char v33 = 7;
    uint64_t v108 = swift_allocObject();
    *(_OWORD *)(v108 + 16) = xmmword_25E30C420;
    *(float *)(v108 + 32) = sub_25E2E9268(v184.i16[0]);
    *(float *)(v108 + 36) = sub_25E2E9268(v184.i16[1]);
    *(float *)(v108 + 40) = sub_25E2E9268(v184.i16[2]);
    float v109 = sub_25E2E9268(v184.i16[3]);
    goto LABEL_91;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C20);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    char v33 = 7;
    uint64_t v108 = swift_allocObject();
    *(_OWORD *)(v108 + 16) = xmmword_25E30C420;
    *(float *)(v108 + 32) = sub_25E2E9110(v184.i32[0]);
    *(float *)(v108 + 36) = sub_25E2E9110(v184.i32[1]);
    *(float *)(v108 + 40) = sub_25E2E9110(v184.i32[2]);
    float v109 = sub_25E2E9110(v184.i32[3]);
    goto LABEL_91;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C28);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v191;
    long long v182 = v190;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v114 = swift_allocObject();
    *(_OWORD *)(v114 + 16) = xmmword_25E30C420;
    uint64_t v115 = MEMORY[0x263F8E970];
    *(float *)(v114 + 32) = sub_25E2E9518(v182, MEMORY[0x263F8E970], (uint64_t (*)(void))sub_25E2EF680);
    *(float *)(v114 + 36) = sub_25E2E9518(*((uint64_t *)&v182 + 1), v115, (uint64_t (*)(void))sub_25E2EF680);
    *(float *)(v114 + 40) = sub_25E2E9518(v184.i64[0], v115, (uint64_t (*)(void))sub_25E2EF680);
    *(float *)(v114 + 44) = sub_25E2E9518(v184.i64[1], v115, (uint64_t (*)(void))sub_25E2EF680);
    sub_25E2EF5BC(v114);
    uint16x8_t v184 = v116;
    swift_setDeallocating();
    swift_deallocClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v198);
    v117 = v185;
    uint16x8_t *v185 = v184;
    v117[1].i64[0] = 0;
    v117[1].i64[1] = 0;
    v117[2].i8[0] = 7;
    return result;
  }
  type metadata accessor for simd_quatf(0);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
    uint64_t v118 = *((void *)&v190 + 1);
    uint64_t v119 = v190;
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v198);
    v120 = v185;
    v185->i64[0] = v119;
    v120->i64[1] = v118;
    v120[1].i64[0] = 0;
    v120[1].i64[1] = 0;
    char v121 = 8;
    goto LABEL_118;
  }
  type metadata accessor for simd_float2x2(0);
  if (swift_dynamicCast())
  {
    long long v122 = v190;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C50);
    uint64_t v123 = swift_allocObject();
    *(_OWORD *)(v123 + 16) = xmmword_25E30C440;
    *(_OWORD *)(v123 + 32) = v122;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v198);
    v120 = v185;
    v185->i64[0] = v123;
    v120->i64[1] = 0;
    v120[1].i64[0] = 0;
    v120[1].i64[1] = 0;
    char v121 = 9;
    goto LABEL_118;
  }
  type metadata accessor for simd_float3x3(0);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    long long v182 = v191;
    long long v181 = v192;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C48);
    v124 = (_OWORD *)swift_allocObject();
    uint16x8_t v125 = v184;
    v124[1] = xmmword_25E30C430;
    v124[2] = v125;
    long long v126 = v181;
    v124[3] = v182;
    v124[4] = v126;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v198);
    v120 = v185;
    v185->i64[0] = (uint64_t)v124;
    v120->i64[1] = 0;
    v120[1].i64[0] = 0;
    v120[1].i64[1] = 0;
    char v121 = 10;
    goto LABEL_118;
  }
  type metadata accessor for simd_float4x4(0);
  if (swift_dynamicCast())
  {
    uint16x8_t v184 = (uint16x8_t)v190;
    long long v182 = v191;
    long long v181 = v192;
    long long v180 = v193;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C38);
    v127 = (_OWORD *)swift_allocObject();
    uint16x8_t v128 = v184;
    v127[1] = xmmword_25E30C420;
    v127[2] = v128;
    long long v129 = v181;
    v127[3] = v182;
    v127[4] = v129;
    v127[5] = v180;
LABEL_112:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v198);
    v120 = v185;
    v185->i64[0] = (uint64_t)v127;
    v120->i64[1] = 0;
    v120[1].i64[0] = 0;
    v120[1].i64[1] = 0;
    char v121 = 11;
    goto LABEL_118;
  }
  type metadata accessor for simd_double4x4(0);
  if (swift_dynamicCast())
  {
    long long v176 = v191;
    long long v175 = v190;
    long long v178 = v193;
    long long v177 = v192;
    long long v180 = v195;
    long long v179 = v194;
    long long v182 = v197;
    long long v181 = v196;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C38);
    v127 = (_OWORD *)swift_allocObject();
    uint16x8_t v184 = (uint16x8_t)xmmword_25E30C420;
    v127[1] = xmmword_25E30C420;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
    uint64_t v130 = swift_allocObject();
    *(uint16x8_t *)(v130 + 16) = v184;
    *(float *)(v130 + 32) = sub_25E2E8E54(*(double *)&v175);
    *(float *)(v130 + 36) = sub_25E2E8E54(*((double *)&v175 + 1));
    *(float *)(v130 + 40) = sub_25E2E8E54(*(double *)&v176);
    *(float *)(v130 + 44) = sub_25E2E8E54(*((double *)&v176 + 1));
    sub_25E2EF5BC(v130);
    long long v176 = v131;
    swift_setDeallocating();
    swift_deallocClassInstance();
    v127[2] = v176;
    uint64_t v132 = swift_allocObject();
    *(uint16x8_t *)(v132 + 16) = v184;
    *(float *)(v132 + 32) = sub_25E2E8E54(*(double *)&v177);
    *(float *)(v132 + 36) = sub_25E2E8E54(*((double *)&v177 + 1));
    *(float *)(v132 + 40) = sub_25E2E8E54(*(double *)&v178);
    *(float *)(v132 + 44) = sub_25E2E8E54(*((double *)&v178 + 1));
    sub_25E2EF5BC(v132);
    long long v178 = v133;
    swift_setDeallocating();
    swift_deallocClassInstance();
    v127[3] = v178;
    uint64_t v134 = swift_allocObject();
    *(uint16x8_t *)(v134 + 16) = v184;
    *(float *)(v134 + 32) = sub_25E2E8E54(*(double *)&v179);
    *(float *)(v134 + 36) = sub_25E2E8E54(*((double *)&v179 + 1));
    *(float *)(v134 + 40) = sub_25E2E8E54(*(double *)&v180);
    *(float *)(v134 + 44) = sub_25E2E8E54(*((double *)&v180 + 1));
    sub_25E2EF5BC(v134);
    long long v180 = v135;
    swift_setDeallocating();
    swift_deallocClassInstance();
    v127[4] = v180;
    uint64_t v136 = swift_allocObject();
    *(uint16x8_t *)(v136 + 16) = v184;
    *(float *)(v136 + 32) = sub_25E2E8E54(*(double *)&v181);
    *(float *)(v136 + 36) = sub_25E2E8E54(*((double *)&v181 + 1));
    *(float *)(v136 + 40) = sub_25E2E8E54(*(double *)&v182);
    *(float *)(v136 + 44) = sub_25E2E8E54(*((double *)&v182 + 1));
    sub_25E2EF5BC(v136);
    uint16x8_t v184 = v137;
    swift_setDeallocating();
    swift_deallocClassInstance();
    v127[5] = v184;
    goto LABEL_112;
  }
  if (swift_dynamicCast())
  {
    uint64_t v138 = v179;
    (*(void (**)(char *, char *, uint64_t))(v179 + 32))(v25, v28, v17);
    (*(void (**)(long long *, char *, uint64_t))(v138 + 16))(v21, v25, v17);
    uint64_t v139 = sub_25E30A250();
    uint64_t v141 = v140;
    (*(void (**)(char *, uint64_t))(v138 + 8))(v25, v17);
    v142 = v183;
LABEL_117:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v142);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v198);
    v120 = v185;
    v185->i64[0] = v139;
    v120->i64[1] = v141;
    v120[1].i64[0] = 0;
    v120[1].i64[1] = 0;
    char v121 = 4;
    goto LABEL_118;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C30);
  if (swift_dynamicCast())
  {
    sub_25E2DE4C8(&v190, (uint64_t)v187);
    __swift_project_boxed_opaque_existential_1(v187, (uint64_t)v188);
    sub_25E309FF0();
    sub_25E2ECC9C(v181);
    (*(void (**)(char *, uint64_t))(v180 + 8))(v16, v13);
    uint64_t v139 = sub_25E30A260();
    uint64_t v141 = v143;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
    v142 = (char *)v187;
    goto LABEL_117;
  }
  if (!swift_dynamicCast())
  {
    if (swift_dynamicCast())
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
      uint64_t v150 = *((void *)&v190 + 1);
      uint64_t v149 = v190;
    }
    else
    {
      if (swift_dynamicCast())
      {
        v151 = v183;
        sub_25E2ECBB0((uint64_t)v183, (uint64_t)&v190);
        uint64_t v152 = sub_25E30A270();
        uint64_t v154 = v153;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v151);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v198);
        v120 = v185;
        v185->i64[0] = v152;
        v120->i64[1] = v154;
        v120[1].i64[0] = 0;
        v120[1].i64[1] = 0;
        char v121 = 18;
        goto LABEL_118;
      }
      __swift_project_boxed_opaque_existential_1(v183, *((void *)v183 + 3));
      uint64_t DynamicType = swift_getDynamicType();
      if (swift_isClassType()) {
        uint64_t v156 = DynamicType;
      }
      else {
        uint64_t v156 = 0;
      }
      if (v156)
      {
        uint64_t v157 = *((void *)v183 + 3);
        v158 = __swift_project_boxed_opaque_existential_1(v183, v157);
        uint64_t v159 = *(void *)(v157 - 8);
        MEMORY[0x270FA5388](v158, v158);
        v161 = (char *)&v175 - ((v160 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v159 + 16))(v161);
        v162 = (const void *)sub_25E30A990();
        (*(void (**)(char *, uint64_t))(v159 + 8))(v161, v157);
        CFTypeID v163 = CFGetTypeID(v162);
        swift_unknownObjectRelease();
        if (v163 == CGColorGetTypeID())
        {
          sub_25E2ED228(v183, &v190);
          type metadata accessor for CGColor(0);
          swift_dynamicCast();
          uint64_t v164 = v187[0];
          uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v198);
          v120 = v185;
          v185->i64[0] = v164;
          v120->i64[1] = 0;
          v120[1].i64[0] = 0;
          v120[1].i64[1] = 0;
          char v121 = 14;
          goto LABEL_118;
        }
      }
      else
      {
        CGColorGetTypeID();
        CFTypeID v163 = 0;
      }
      type metadata accessor for CMClock(0);
      uint64_t v165 = MEMORY[0x2611D1C90]();
      if (!v156 || v163 != v165)
      {
        type metadata accessor for CMTimebase(0);
        uint64_t v166 = MEMORY[0x2611D1CB0]();
        if (!v156 || v163 != v166)
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
          uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v198);
          v120 = v185;
          uint16x8_t *v185 = 0u;
          v120[1] = 0u;
          char v121 = -1;
          goto LABEL_118;
        }
      }
      v167 = v183;
      uint64_t v168 = *((void *)v183 + 3);
      v169 = __swift_project_boxed_opaque_existential_1(v183, v168);
      uint64_t v170 = *(void *)(v168 - 8);
      MEMORY[0x270FA5388](v169, v169);
      v172 = (char *)&v175 - ((v171 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v170 + 16))(v172);
      uint64_t v173 = sub_25E30A990();
      (*(void (**)(char *, uint64_t))(v170 + 8))(v172, v168);
      swift_unknownObjectRelease();
      *(void *)&long long v190 = v173;
      uint64_t v149 = sub_25E30AB20();
      uint64_t v150 = v174;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v167);
    }
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v198);
    v120 = v185;
    v185->i64[0] = v149;
    v120->i64[1] = v150;
    v120[1].i64[0] = 0;
    v120[1].i64[1] = 0;
    char v121 = 13;
    goto LABEL_118;
  }
  uint64_t v144 = v182;
  uint64_t v145 = v184.i64[0];
  (*(void (**)(unint64_t, char *, uint64_t))(v182 + 32))(v6, v9, v184.i64[0]);
  uint64_t v146 = sub_25E30A030();
  uint64_t v148 = v147;
  (*(void (**)(unint64_t, uint64_t))(v144 + 8))(v6, v145);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v183);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v198);
  v120 = v185;
  v185->i64[0] = v146;
  v120->i64[1] = v148;
  v120[1].i64[0] = 0;
  v120[1].i64[1] = 0;
  char v121 = 12;
LABEL_118:
  v120[2].i8[0] = v121;
  return result;
}

uint64_t sub_25E2ECBB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void type metadata accessor for simd_quatf(uint64_t a1)
{
}

void type metadata accessor for simd_float2x2(uint64_t a1)
{
}

void type metadata accessor for simd_float3x3(uint64_t a1)
{
}

void type metadata accessor for simd_float4x4(uint64_t a1)
{
}

void type metadata accessor for simd_double4x4(uint64_t a1)
{
}

void type metadata accessor for CMClock(uint64_t a1)
{
}

void type metadata accessor for CMTimebase(uint64_t a1)
{
}

uint64_t sub_25E2ECC9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3D90);
  uint64_t v5 = MEMORY[0x270FA5388](v3, v4);
  uint16x8_t v57 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v61 = (char *)&v52 - v8;
  uint64_t v9 = sub_25E309F70();
  uint64_t v63 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9, v10);
  uint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v11, v14);
  uint64_t v17 = (char *)&v52 - v16;
  uint64_t v19 = MEMORY[0x270FA5388](v15, v18);
  char v66 = (char *)&v52 - v20;
  MEMORY[0x270FA5388](v19, v21);
  uint64_t v64 = (char *)&v52 - v22;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3D98);
  uint64_t v24 = MEMORY[0x270FA5388](v58, v23);
  v59 = (char *)&v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24, v26);
  uint64_t v60 = (uint64_t)&v52 - v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3DA0);
  MEMORY[0x270FA5388](v28 - 8, v29);
  uint64_t v31 = (char *)&v52 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_25E309F60();
  uint64_t v33 = sub_25E2F1894(&qword_26A6E3DA8, MEMORY[0x263F066D8]);
  uint64_t v67 = v32;
  uint64_t v65 = v33;
  sub_25E30A4D0();
  sub_25E2F1894(&qword_26A6E3DB0, MEMORY[0x263F067E8]);
  uint64_t result = sub_25E30A220();
  if (result)
  {
    uint64_t v62 = v3;
    uint64_t v55 = a1;
    uint64_t v35 = v63;
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
    uint64_t v37 = v64;
    v36(v64, v31, v9);
    char v38 = v66;
    uint64_t v56 = v1;
    sub_25E30A4E0();
    v36(v17, v37, v9);
    v54 = v36;
    v36(v13, v38, v9);
    sub_25E2F1F04((uint64_t)v31, &qword_26A6E3DA0);
    sub_25E2F1894(&qword_26A6E3DB8, MEMORY[0x263F067E8]);
    char v39 = sub_25E30A210();
    uint64_t v40 = *(void (**)(char *, uint64_t))(v35 + 8);
    v40(v13, v9);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v40)(v17, v9);
    if (v39)
    {
      uint64_t v41 = v57;
      char v53 = v40;
      uint64_t v42 = v62;
      uint64_t v43 = v61;
      uint64_t v44 = &v61[*(int *)(v62 + 48)];
      uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v63 + 32);
      v45(v61, v64, v9);
      uint64_t v52 = v44;
      v45(v44, v66, v9);
      int v46 = &v41[*(int *)(v42 + 48)];
      char v47 = v54;
      v54(v41, v43, v9);
      v47(v46, v44, v9);
      uint64_t v48 = (uint64_t)v59;
      v45(v59, v41, v9);
      uint64_t v49 = v53;
      v53(v46, v9);
      char v50 = &v41[*(int *)(v62 + 48)];
      v45(v41, v43, v9);
      v45(v50, v52, v9);
      v45((char *)(v48 + *(int *)(v58 + 36)), v50, v9);
      v49(v41, v9);
      uint64_t v51 = v60;
      sub_25E2F1E9C(v48, v60);
      sub_25E30A510();
      return sub_25E2F1F04(v51, &qword_26A6E3D98);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

_OWORD *sub_25E2ED228(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

void sub_25E2ED24C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25E2ED298(float32x2_t *a1, float32x2_t *a2)
{
  float32x2_t v2 = a1[2];
  if (*(void *)&v2 != *(void *)&a2[2]) {
    return 0;
  }
  if (!*(void *)&v2 || a1 == a2) {
    return 1;
  }
  uint64_t v3 = a1 + 4;
  uint64_t v4 = a2 + 4;
  uint64_t v5 = *(void *)&v2 - 1;
  do
  {
    float32x2_t v6 = *v3++;
    float32x2_t v7 = v6;
    float32x2_t v8 = *v4++;
    int32x2_t v9 = vceq_f32(v7, v8);
    BOOL v11 = v5-- != 0;
  }
  while ((v9.i8[0] & v9.i8[4] & 1) != 0 && v11);
  return v9.i8[0] & v9.i8[4] & 1;
}

BOOL sub_25E2ED304(uint64_t a1, uint64_t a2)
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
  do
  {
    uint64_t v5 = 0;
    uint64_t v6 = 16 * v3++;
    long long v7 = *(_OWORD *)(v4 + v6);
    long long v8 = *(_OWORD *)(a2 + 32 + v6);
    while (1)
    {
      long long v13 = v7;
      float v10 = *(float *)((unint64_t)&v13 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
      long long v14 = v8;
      float v11 = *(float *)((unint64_t)&v14 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
      BOOL result = v10 == v11;
      if (v5 == 2) {
        break;
      }
      while (1)
      {
        ++v5;
        if (result) {
          break;
        }
        BOOL result = 0;
        if (v5 == 2) {
          return result;
        }
      }
    }
  }
  while (v10 == v11 && v3 != v2);
  return result;
}

BOOL sub_25E2ED3C4(uint64_t a1, uint64_t a2)
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
  do
  {
    uint64_t v5 = 0;
    uint64_t v6 = 16 * v3++;
    long long v7 = *(_OWORD *)(v4 + v6);
    long long v8 = *(_OWORD *)(a2 + 32 + v6);
    while (1)
    {
      long long v13 = v7;
      float v10 = *(float *)((unint64_t)&v13 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
      long long v14 = v8;
      float v11 = *(float *)((unint64_t)&v14 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
      BOOL result = v10 == v11;
      if (v5 == 3) {
        break;
      }
      while (1)
      {
        ++v5;
        if (result) {
          break;
        }
        BOOL result = 0;
        if (v5 == 3) {
          return result;
        }
      }
    }
  }
  while (v10 == v11 && v3 != v2);
  return result;
}

uint64_t sub_25E2ED484(__n128 *a1, __n128 *a2, double a3, double a4, __n128 a5, __n128 a6)
{
  uint64_t v6 = a1[1].n128_i64[0];
  if (v6 == a2[1].n128_u64[0])
  {
    if (!v6 || a1 == a2)
    {
      char v14 = 1;
    }
    else
    {
      uint64_t v7 = v6 - 1;
      long long v8 = a2 + 4;
      int32x2_t v9 = a1 + 4;
      do
      {
        unsigned __int8 v10 = v9->n128_u8[0];
        __n128 v11 = v9[-1];
        v20[0] = v9[-2];
        v20[1] = v11;
        unsigned __int8 v21 = v10;
        unsigned __int8 v12 = v8->n128_u8[0];
        __n128 v13 = v8[-1];
        v18[0] = v8[-2];
        v18[1] = v13;
        unsigned __int8 v19 = v12;
        char v14 = _s26SpatialInspectorFoundation0B13PropertyValueO2eeoiySbAC_ACtFZ_0(v20, v18, v18[0].n128_f64[0], v13.n128_f64[0], a5, a6);
        BOOL v16 = v7-- != 0;
        if ((v14 & 1) == 0) {
          break;
        }
        v8 += 3;
        v9 += 3;
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

uint64_t sub_25E2ED530(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 64;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 64);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  if (!v6) {
    goto LABEL_7;
  }
LABEL_6:
  uint64_t v31 = (v6 - 1) & v6;
  int64_t v32 = v3;
  for (unint64_t i = __clz(__rbit64(v6)) | (v3 << 6); ; unint64_t i = __clz(__rbit64(v9)) + (v10 << 6))
  {
    uint64_t v12 = result;
    __n128 v13 = (uint64_t *)(*(void *)(result + 48) + 24 * i);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = v13[2];
    uint64_t v17 = *(void *)(result + 56) + 48 * i;
    unint64_t v18 = *(void *)(v17 + 8);
    uint64_t v20 = *(void *)(v17 + 16);
    uint64_t v21 = *(void *)(v17 + 24);
    char v22 = *(unsigned char *)(v17 + 32);
    v35[0] = *(void *)v17;
    unsigned __int8 v19 = (void *)v35[0];
    v35[1] = v18;
    v35[2] = v20;
    v35[3] = v21;
    char v36 = v22;
    swift_bridgeObjectRetain();
    sub_25E2E9A90(v19, v18, v20, v21, v22);
    unint64_t v23 = sub_25E2EEF2C(v14, v15, v16);
    LOBYTE(v16) = v24;
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
    {
      sub_25E2F0EAC(v19, v18, v20, v21, v22);
      return 0;
    }
    uint64_t v25 = *(void *)(a2 + 56) + 48 * v23;
    char v26 = *(unsigned char *)(v25 + 32);
    long long v27 = *(_OWORD *)(v25 + 16);
    v33[0] = *(_OWORD *)v25;
    v33[1] = v27;
    char v34 = v26;
    char v28 = _s26SpatialInspectorFoundation0B13PropertyValueO2eeoiySbAC_ACtFZ_0(v33, v35);
    sub_25E2F0EAC(v19, v18, v20, v21, v22);
    if ((v28 & 1) == 0) {
      return 0;
    }
    BOOL result = v12;
    unint64_t v6 = v31;
    int64_t v3 = v32;
    if (v31) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v8 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v8 >= v30) {
      return 1;
    }
    unint64_t v9 = *(void *)(v29 + 8 * v8);
    int64_t v10 = v3 + 1;
    if (!v9)
    {
      int64_t v10 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v9 = *(void *)(v29 + 8 * v10);
      if (!v9)
      {
        int64_t v10 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v9 = *(void *)(v29 + 8 * v10);
        if (!v9)
        {
          int64_t v10 = v3 + 4;
          if (v3 + 4 >= v30) {
            return 1;
          }
          unint64_t v9 = *(void *)(v29 + 8 * v10);
          if (!v9) {
            break;
          }
        }
      }
    }
LABEL_22:
    uint64_t v31 = (v9 - 1) & v9;
    int64_t v32 = v10;
  }
  uint64_t v11 = v3 + 5;
  if (v3 + 5 >= v30) {
    return 1;
  }
  unint64_t v9 = *(void *)(v29 + 8 * v11);
  if (v9)
  {
    int64_t v10 = v3 + 5;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v9 = *(void *)(v29 + 8 * v10);
    ++v11;
    if (v9) {
      goto LABEL_22;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

void InspectorPropertyValue.hash(into:)(uint64_t a1)
{
  uint64_t v2 = *(void **)v1;
  unint64_t v3 = *(void *)(v1 + 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  switch(*(unsigned char *)(v1 + 32))
  {
    case 3:
      sub_25E30AA60();
      sub_25E30AA70();
      return;
    case 4:
    case 0xC:
    case 0xD:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x15:
      sub_25E30AA60();
      sub_25E30A2A0();
      return;
    case 5:
      sub_25E30AA60();
      sub_25E30AA80();
      sub_25E30AA80();
      return;
    case 6:
      sub_25E30AA60();
      sub_25E2EF4E8();
      return;
    case 7:
    case 8:
      sub_25E30AA60();
      sub_25E2EF470();
      return;
    case 9:
      sub_25E30AA60();
      sub_25E2EF3F4(a1, (uint64_t)v2);
      return;
    case 0xA:
      sub_25E30AA60();
      sub_25E2EF364(a1, (uint64_t)v2);
      return;
    case 0xB:
      sub_25E30AA60();
      sub_25E2EF2C0(a1, (uint64_t)v2);
      return;
    case 0xE:
      sub_25E30AA60();
      type metadata accessor for CGColor(0);
      sub_25E2F1894(&qword_26A6E3C80, type metadata accessor for CGColor);
      uint64_t v7 = v2;
      sub_25E30A070();
      int64_t v8 = v2;
      unint64_t v9 = v3;
      uint64_t v10 = v5;
      uint64_t v11 = v4;
      char v12 = 14;
      goto LABEL_36;
    case 0xF:
      sub_25E30AA60();
      sub_25E2DBE30((uint64_t)v2, v3);
      sub_25E30A020();
      int64_t v8 = v2;
      unint64_t v9 = v3;
      uint64_t v10 = v5;
      uint64_t v11 = v4;
      char v12 = 15;
      goto LABEL_36;
    case 0x16:
    case 0x17:
    case 0x18:
      sub_25E30AA60();
      sub_25E30A2A0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C70);
      sub_25E2F1024(&qword_26A6E3C78, &qword_26A6E3C70);
      sub_25E30A190();
      return;
    case 0x19:
      sub_25E30AA60();
      uint64_t v13 = v2[2];
      sub_25E30AA60();
      if (v13)
      {
        uint64_t v14 = v2 + 8;
        do
        {
          InspectorPropertyValue.hash(into:)(a1);
          v14 += 6;
          --v13;
        }
        while (v13);
      }
      return;
    case 0x1A:
      sub_25E30AA60();
      sub_25E2EF0A4(a1, (uint64_t)v2);
      return;
    case 0x1B:
      sub_25E30AA60();
      if (v3)
      {
        sub_25E30AA70();
        swift_bridgeObjectRetain();
        sub_25E30A2A0();
        int64_t v8 = v2;
        unint64_t v9 = v3;
        uint64_t v10 = v5;
        uint64_t v11 = v4;
        char v12 = 27;
LABEL_36:
        sub_25E2F0EAC(v8, v9, v10, v11, v12);
      }
      else
      {
        sub_25E30AA70();
      }
      return;
    default:
      sub_25E30AA60();
      sub_25E30AA90();
      return;
  }
}

uint64_t InspectorPropertyValue.hashValue.getter()
{
  char v1 = *((unsigned char *)v0 + 32);
  long long v2 = v0[1];
  long long v5 = *v0;
  long long v6 = v2;
  char v7 = v1;
  sub_25E30AA50();
  InspectorPropertyValue.hash(into:)((uint64_t)v4);
  return sub_25E30AAA0();
}

uint64_t sub_25E2EDDC4()
{
  char v1 = *((unsigned char *)v0 + 32);
  long long v2 = v0[1];
  long long v5 = *v0;
  long long v6 = v2;
  char v7 = v1;
  sub_25E30AA50();
  InspectorPropertyValue.hash(into:)((uint64_t)v4);
  return sub_25E30AAA0();
}

uint64_t sub_25E2EDE1C()
{
  char v1 = *((unsigned char *)v0 + 32);
  long long v2 = v0[1];
  long long v5 = *v0;
  long long v6 = v2;
  char v7 = v1;
  sub_25E30AA50();
  InspectorPropertyValue.hash(into:)((uint64_t)v4);
  return sub_25E30AAA0();
}

id sub_25E2EDE6C@<X0>(uint64_t a1@<X8>)
{
  long long v2 = *(void **)v1;
  unint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  char v6 = *(unsigned char *)(v1 + 32);
  *(unsigned char *)(a1 + 32) = v6;
  return sub_25E2E9A90(v2, v3, v4, v5, v6);
}

uint64_t InspectorPropertyValue.description.getter()
{
  uint64_t v1 = *(void **)v0;
  unint64_t v2 = *(void *)(v0 + 8);
  switch(*(unsigned char *)(v0 + 32))
  {
    case 2:
      return sub_25E2FB778(*(double *)v0);
    case 3:
      sub_25E30A300();
      swift_bridgeObjectRelease();
      return 0;
    case 4:
    case 0xC:
    case 0xD:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x15:
    case 0x16:
    case 0x17:
    case 0x18:
      swift_bridgeObjectRetain();
      return (uint64_t)v1;
    case 5:
      unint64_t v3 = &qword_26A6E3B30;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B30);
      uint64_t v4 = (unint64_t *)&unk_26A6E3CA8;
      goto LABEL_9;
    case 6:
      unint64_t v3 = &qword_26A6E3848;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3848);
      uint64_t v4 = (unint64_t *)&unk_26A6E3CA0;
      goto LABEL_9;
    case 7:
    case 8:
      unint64_t v3 = &qword_26A6E3BD8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BD8);
      uint64_t v4 = (unint64_t *)&unk_26A6E3C98;
LABEL_9:
      sub_25E2F1024(v4, v3);
      return sub_25E30A9F0();
    case 9:
      char v6 = &qword_26A6E3B30;
      goto LABEL_13;
    case 0xA:
      char v6 = &qword_26A6E3848;
      goto LABEL_13;
    case 0xB:
      char v6 = &qword_26A6E3BD8;
LABEL_13:
      char v7 = (ValueMetadata *)__swift_instantiateConcreteTypeFromMangledName(v6);
      goto LABEL_18;
    case 0xE:
      type metadata accessor for CGColor(0);
      sub_25E30A700();
      return 0;
    case 0xF:
      uint64_t v10 = v0 + 16;
      uint64_t v8 = *(void *)(v0 + 16);
      uint64_t v9 = *(void *)(v10 + 8);
      sub_25E2DBE30((uint64_t)v1, v2);
      uint64_t v11 = sub_25E30A010();
      sub_25E2F0EAC(v1, v2, v8, v9, 15);
      return v11;
    case 0x19:
      char v7 = &type metadata for InspectorPropertyValue;
LABEL_18:
      uint64_t v5 = MEMORY[0x2611D1B80](v1, v7);
      break;
    case 0x1A:
      sub_25E2F0FD0();
      uint64_t v5 = sub_25E30A100();
      break;
    case 0x1B:
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C88);
      uint64_t v5 = sub_25E30A270();
      break;
    default:
      uint64_t v5 = sub_25E30A970();
      break;
  }
  return v5;
}

uint64_t sub_25E2EE1C4()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25E2EE1F4()
{
  return *(void *)(v0 + 16);
}

uint64_t InspectorPropertyValue.WrappedDictionaryKey.init(any:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_25E30A630();
  uint64_t v6 = v5;
  uint64_t v7 = sub_25E30A640();
  uint64_t result = sub_25E2F1068(a1);
  *a2 = v4;
  a2[1] = v6;
  a2[2] = v7;
  return result;
}

uint64_t InspectorPropertyValue.WrappedDictionaryKey.hash(into:)()
{
  return sub_25E30AA60();
}

BOOL static InspectorPropertyValue.WrappedDictionaryKey.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return v2 == v3;
  }
  char v5 = sub_25E30A9A0();
  BOOL result = 0;
  if (v5) {
    return v2 == v3;
  }
  return result;
}

uint64_t sub_25E2EE30C()
{
  if (*v0) {
    return 1752392040;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_25E2EE330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2F1A2C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E2EE358(uint64_t a1)
{
  unint64_t v2 = sub_25E2F10BC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2EE394(uint64_t a1)
{
  unint64_t v2 = sub_25E2F10BC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InspectorPropertyValue.WrappedDictionaryKey.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3CB0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[0] = *(void *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2F10BC();
  sub_25E30AAC0();
  char v12 = 0;
  uint64_t v8 = v10[1];
  sub_25E30A8E0();
  if (!v8)
  {
    char v11 = 1;
    sub_25E30A910();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t InspectorPropertyValue.WrappedDictionaryKey.hashValue.getter()
{
  return sub_25E30AAA0();
}

uint64_t InspectorPropertyValue.WrappedDictionaryKey.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3CB8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2F10BC();
  sub_25E30AAB0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v17 = 0;
  uint64_t v10 = sub_25E30A7F0();
  uint64_t v12 = v11;
  char v16 = 1;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_25E30A820();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  *a2 = v10;
  a2[1] = v12;
  a2[2] = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E2EE788()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2EE7EC()
{
  return sub_25E30AA60();
}

uint64_t sub_25E2EE824()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2EE884@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return InspectorPropertyValue.WrappedDictionaryKey.init(from:)(a1, a2);
}

uint64_t sub_25E2EE89C(void *a1)
{
  return InspectorPropertyValue.WrappedDictionaryKey.encode(to:)(a1);
}

BOOL sub_25E2EE8B4(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return v2 == v3;
  }
  char v5 = sub_25E30A9A0();
  BOOL result = 0;
  if (v5) {
    return v2 == v3;
  }
  return result;
}

uint64_t sub_25E2EE910()
{
  return sub_25E30A080();
}

uint64_t sub_25E2EE95C()
{
  return sub_25E30A070();
}

uint64_t sub_25E2EE9B4()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2EEA1C()
{
  swift_getWitnessTable();

  return sub_25E30A060();
}

uint64_t sub_25E2EEA88@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
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
      sub_25E2DBE30(a2, a3);
      uint64_t v10 = (char *)sub_25E309F30();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_25E309F50();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_25E309F40();
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
        JUMPOUT(0x25E2EECECLL);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_25E2DCD88(a2, a3);
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
      char v17 = (char *)sub_25E309F30();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_25E309F50();
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
      uint64_t v21 = sub_25E309F40();
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
      __s1 = swift_release();
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
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_25E2EECFC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_25E2DBE30(a1, a2);
      char v5 = sub_25E2EF728((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_25E2DCD88(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_25E2EF728(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_25E2DCD88(a3, a4);
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
      sub_25E2EEA88((uint64_t)__s1, a3, a4, &v14);
      sub_25E2DCD88(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

unint64_t sub_25E2EEF2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25E30AA50();
  sub_25E30A2A0();
  sub_25E30AA60();
  uint64_t v6 = sub_25E30AAA0();

  return sub_25E2EEFC0(a1, a2, a3, v6);
}

unint64_t sub_25E2EEFC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = a4 & ~v6;
  if ((*(void *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v11 = ~v6;
    uint64_t v12 = *(void *)(v4 + 48);
    do
    {
      size_t v13 = (void *)(v12 + 24 * v7);
      uint64_t v14 = v13[2];
      BOOL v15 = *v13 == a1 && v13[1] == a2;
      if (v15 || (sub_25E30A9A0()) && v14 == a3) {
        break;
      }
      unint64_t v7 = (v7 + 1) & v11;
    }
    while (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

uint64_t sub_25E2EF0A4(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = a2 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a2 + 64);
  int64_t v22 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  int64_t v7 = 0;
  while (1)
  {
    if (v4)
    {
      unint64_t v8 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v9 = v8 | (v7 << 6);
      goto LABEL_5;
    }
    int64_t v19 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v19 >= v22) {
      goto LABEL_19;
    }
    unint64_t v20 = *(void *)(v23 + 8 * v19);
    ++v7;
    if (!v20)
    {
      int64_t v7 = v19 + 1;
      if (v19 + 1 >= v22) {
        goto LABEL_19;
      }
      unint64_t v20 = *(void *)(v23 + 8 * v7);
      if (!v20) {
        break;
      }
    }
LABEL_18:
    unint64_t v4 = (v20 - 1) & v20;
    unint64_t v9 = __clz(__rbit64(v20)) + (v7 << 6);
LABEL_5:
    uint64_t v10 = *(void *)(a2 + 56) + 48 * v9;
    unint64_t v12 = *(void *)(v10 + 8);
    uint64_t v13 = *(void *)(v10 + 16);
    uint64_t v14 = *(void *)(v10 + 24);
    char v15 = *(unsigned char *)(v10 + 32);
    char v28 = *(void **)v10;
    uint64_t v11 = v28;
    unint64_t v29 = v12;
    uint64_t v30 = v13;
    uint64_t v31 = v14;
    char v32 = v15;
    uint64_t v16 = *(void *)(a1 + 64);
    long long v17 = *(_OWORD *)(a1 + 16);
    v26[0] = *(_OWORD *)a1;
    v26[1] = v17;
    long long v18 = *(_OWORD *)(a1 + 48);
    v26[2] = *(_OWORD *)(a1 + 32);
    v26[3] = v18;
    uint64_t v27 = v16;
    swift_bridgeObjectRetain();
    sub_25E2E9A90(v11, v12, v13, v14, v15);
    sub_25E30A2A0();
    sub_25E30AA60();
    swift_bridgeObjectRelease();
    InspectorPropertyValue.hash(into:)(v26);
    sub_25E2F0EAC(v11, v12, v13, v14, v15);
    uint64_t result = sub_25E30AAA0();
    v6 ^= result;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v22)
  {
LABEL_19:
    swift_release();
    return sub_25E30AA60();
  }
  unint64_t v20 = *(void *)(v23 + 8 * v21);
  if (v20)
  {
    int64_t v7 = v21;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v7 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v7 >= v22) {
      goto LABEL_19;
    }
    unint64_t v20 = *(void *)(v23 + 8 * v7);
    ++v21;
    if (v20) {
      goto LABEL_18;
    }
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_25E2EF2C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_25E30AA60();
  if (v3)
  {
    uint64_t v5 = a2 + 32;
    do
    {
      v5 += 16;
      sub_25E30AA80();
      sub_25E30AA80();
      sub_25E30AA80();
      uint64_t result = sub_25E30AA80();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_25E2EF364(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_25E30AA60();
  if (v3)
  {
    uint64_t v5 = a2 + 32;
    do
    {
      v5 += 16;
      sub_25E30AA80();
      sub_25E30AA80();
      uint64_t result = sub_25E30AA80();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_25E2EF3F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_25E30AA60();
  if (v3)
  {
    uint64_t v5 = a2 + 32;
    do
    {
      v5 += 8;
      sub_25E30AA80();
      uint64_t result = sub_25E30AA80();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_25E2EF470()
{
  return sub_25E30AA80();
}

uint64_t sub_25E2EF4E8()
{
  return sub_25E30AA80();
}

uint64_t sub_25E2EF54C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    unint64_t v3 = 3;
    if ((unint64_t)(v1 - 1) < 3) {
      unint64_t v3 = v1 - 1;
    }
    long long v4 = 0uLL;
    do
    {
      if ((unint64_t)(v1 - 1) > 2)
      {
        __break(1u);
        goto LABEL_10;
      }
      int v5 = *(_DWORD *)(result + 32 + 4 * v2);
      long long v6 = v4;
      *(_DWORD *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3))) = v5;
      long long v4 = v6;
      ++v2;
    }
    while (v1 != v2);
    if (v3 < 2) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    __break(1u);
  }
  return result;
}

uint64_t sub_25E2EF5BC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    unint64_t v3 = 4;
    if ((unint64_t)(v1 - 1) < 4) {
      unint64_t v3 = v1 - 1;
    }
    long long v4 = 0uLL;
    do
    {
      if ((unint64_t)(v1 - 1) > 3)
      {
        __break(1u);
        goto LABEL_10;
      }
      int v5 = *(_DWORD *)(result + 32 + 4 * v2);
      long long v6 = v4;
      *(_DWORD *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3))) = v5;
      long long v4 = v6;
      ++v2;
    }
    while (v1 != v2);
    if (v3 < 3) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    __break(1u);
  }
  return result;
}

unint64_t sub_25E2EF62C()
{
  unint64_t result = qword_26A6E3C58;
  if (!qword_26A6E3C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3C58);
  }
  return result;
}

unint64_t sub_25E2EF680()
{
  unint64_t result = qword_26A6E3C60;
  if (!qword_26A6E3C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3C60);
  }
  return result;
}

unint64_t sub_25E2EF6D4()
{
  unint64_t result = qword_26A6E3C68;
  if (!qword_26A6E3C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3C68);
  }
  return result;
}

uint64_t sub_25E2EF728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_25E309F30();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_25E309F50();
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
  sub_25E309F40();
  sub_25E2EEA88(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t _s26SpatialInspectorFoundation0B13PropertyValueO2eeoiySbAC_ACtFZ_0(__n128 *a1, __n128 *a2, double a3, double a4, __n128 a5, __n128 a6)
{
  double v6 = a1->n128_f64[0];
  unint64_t v7 = a1->n128_u64[1];
  uint64_t v9 = a1[1].n128_i64[0];
  uint64_t v8 = a1[1].n128_i64[1];
  char v10 = a1[2].n128_i8[0];
  double v12 = a2->n128_f64[0];
  unint64_t v11 = a2->n128_u64[1];
  uint64_t v13 = a2[1].n128_i64[0];
  uint64_t v14 = a2[1].n128_i64[1];
  int v15 = a2[2].n128_u8[0];
  switch(v10)
  {
    case 1:
      if (v15 != 1) {
        goto LABEL_127;
      }
      unint64_t v22 = a2->n128_u64[1];
      sub_25E2F0EAC((void *)a1->n128_u64[0], v7, v9, v8, 1);
      double v17 = v12;
      unint64_t v18 = v22;
      uint64_t v19 = v13;
      uint64_t v20 = v14;
      char v21 = 1;
      goto LABEL_81;
    case 2:
      if (v15 != 2) {
        goto LABEL_127;
      }
      unint64_t v23 = a2->n128_u64[1];
      sub_25E2F0EAC((void *)a1->n128_u64[0], v7, v9, v8, 2);
      sub_25E2F0EAC(*(void **)&v12, v23, v13, v14, 2);
      char v24 = v6 == v12;
      return v24 & 1;
    case 3:
      if (v15 != 3) {
        goto LABEL_127;
      }
      unint64_t v25 = a2->n128_u64[1];
      sub_25E2F0EAC((void *)a1->n128_u64[0], v7, v9, v8, 3);
      sub_25E2F0EAC(*(void **)&v12, v25, v13, v14, 3);
      char v24 = ((LOBYTE(v6) & 1) == 0) ^ LOBYTE(v12);
      return v24 & 1;
    case 4:
      if (v15 != 4) {
        goto LABEL_124;
      }
      if (*(void *)&v6 == *(void *)&v12 && v7 == v11)
      {
        char v24 = 1;
      }
      else
      {
        unint64_t v27 = a2->n128_u64[1];
        char v28 = sub_25E30A9A0();
        unint64_t v11 = v27;
        char v24 = v28;
      }
      unint64_t v98 = v11;
      sub_25E2E9A90(*(id *)&v12, v11, v13, v14, 4);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 4);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 4);
      sub_25E2F0EAC(*(void **)&v12, v98, v13, v14, 4);
      return v24 & 1;
    case 5:
      if (v15 != 5) {
        goto LABEL_127;
      }
      unint64_t v29 = a2->n128_u64[1];
      sub_25E2F0EAC((void *)a1->n128_u64[0], v7, v9, v8, 5);
      sub_25E2F0EAC(*(void **)&v12, v29, v13, v14, 5);
      char v24 = *(float *)&v6 == *(float *)&v12 && *((float *)&v6 + 1) == *((float *)&v12 + 1);
      return v24 & 1;
    case 6:
      if (v15 != 6) {
        goto LABEL_127;
      }
      __n128 v127 = *a1;
      __n128 v124 = *a2;
      unint64_t v31 = a2->n128_u64[1];
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 6);
      sub_25E2F0EAC(*(void **)&v12, v31, v13, v14, 6);
      a6 = v124;
      a5 = v127;
      uint64_t v32 = 0;
LABEL_175:
      while (1)
      {
        __n128 v133 = a5;
        float v122 = *(float *)((unint64_t)&v133 & 0xFFFFFFFFFFFFFFF3 | (4 * (v32 & 3)));
        __n128 v134 = a6;
        float v123 = *(float *)((unint64_t)&v134 & 0xFFFFFFFFFFFFFFF3 | (4 * (v32 & 3)));
        BOOL v33 = v122 == v123;
        if (v32 == 2) {
          goto LABEL_178;
        }
        while (1)
        {
          ++v32;
          if (v33) {
            break;
          }
          if (v32 == 2) {
            goto LABEL_129;
          }
          BOOL v33 = 0;
        }
      }
    case 7:
      if (v15 != 7) {
        goto LABEL_127;
      }
      __n128 v128 = *a1;
      __n128 v125 = *a2;
      unint64_t v34 = a2->n128_u64[1];
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 7);
      sub_25E2F0EAC(*(void **)&v12, v34, v13, v14, 7);
      uint64_t v35 = 0;
      while (1)
      {
        __n128 v135 = v128;
        float v122 = *(float *)((unint64_t)&v135 & 0xFFFFFFFFFFFFFFF3 | (4 * (v35 & 3)));
        __n128 v136 = v125;
        float v123 = *(float *)((unint64_t)&v136 & 0xFFFFFFFFFFFFFFF3 | (4 * (v35 & 3)));
        BOOL v36 = v122 == v123;
        if (v35 == 3) {
          goto LABEL_178;
        }
        while (1)
        {
          ++v35;
          if (v36) {
            break;
          }
          if (v35 == 3) {
            goto LABEL_129;
          }
          BOOL v36 = 0;
        }
      }
    case 8:
      if (v15 != 8) {
        goto LABEL_127;
      }
      __n128 v129 = *a1;
      __n128 v126 = *a2;
      unint64_t v37 = a2->n128_u64[1];
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 8);
      sub_25E2F0EAC(*(void **)&v12, v37, v13, v14, 8);
      uint64_t v38 = 0;
      while (1)
      {
        __n128 v137 = v129;
        float v122 = *(float *)((unint64_t)&v137 & 0xFFFFFFFFFFFFFFF3 | (4 * (v38 & 3)));
        __n128 v138 = v126;
        float v123 = *(float *)((unint64_t)&v138 & 0xFFFFFFFFFFFFFFF3 | (4 * (v38 & 3)));
        BOOL v39 = v122 == v123;
        if (v38 == 3) {
          break;
        }
        while (1)
        {
          ++v38;
          if (v39) {
            break;
          }
          if (v38 == 3) {
            goto LABEL_129;
          }
          BOOL v39 = 0;
        }
      }
LABEL_178:
      if (v122 == v123) {
        goto LABEL_179;
      }
LABEL_129:
      char v24 = 0;
      return v24 & 1;
    case 9:
      unint64_t v40 = a2->n128_u64[1];
      if (v15 != 9) {
        goto LABEL_125;
      }
      char v24 = sub_25E2ED298((float32x2_t *)a1->n128_u64[0], (float32x2_t *)a2->n128_u64[0]);
      sub_25E2E9A90(*(id *)&v12, v40, v13, v14, 9);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 9);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 9);
      sub_25E2F0EAC(*(void **)&v12, v40, v13, v14, 9);
      return v24 & 1;
    case 10:
      unint64_t v40 = a2->n128_u64[1];
      if (v15 != 10) {
        goto LABEL_125;
      }
      char v24 = sub_25E2ED304(a1->n128_u64[0], a2->n128_u64[0]);
      sub_25E2E9A90(*(id *)&v12, v40, v13, v14, 10);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 10);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 10);
      sub_25E2F0EAC(*(void **)&v12, v40, v13, v14, 10);
      return v24 & 1;
    case 11:
      unint64_t v40 = a2->n128_u64[1];
      if (v15 != 11) {
        goto LABEL_125;
      }
      char v24 = sub_25E2ED3C4(a1->n128_u64[0], a2->n128_u64[0]);
      sub_25E2E9A90(*(id *)&v12, v40, v13, v14, 11);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 11);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 11);
      sub_25E2F0EAC(*(void **)&v12, v40, v13, v14, 11);
      return v24 & 1;
    case 12:
      if (v15 != 12) {
        goto LABEL_124;
      }
      if (*(void *)&v6 == *(void *)&v12 && v7 == v11)
      {
        char v24 = 1;
      }
      else
      {
        unint64_t v42 = a2->n128_u64[1];
        char v43 = sub_25E30A9A0();
        unint64_t v11 = v42;
        char v24 = v43;
      }
      unint64_t v99 = v11;
      sub_25E2E9A90(*(id *)&v12, v11, v13, v14, 12);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 12);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 12);
      sub_25E2F0EAC(*(void **)&v12, v99, v13, v14, 12);
      return v24 & 1;
    case 13:
      if (v15 != 13) {
        goto LABEL_124;
      }
      if (*(void *)&v6 == *(void *)&v12 && v7 == v11)
      {
        char v24 = 1;
      }
      else
      {
        unint64_t v45 = a2->n128_u64[1];
        char v46 = sub_25E30A9A0();
        unint64_t v11 = v45;
        char v24 = v46;
      }
      unint64_t v100 = v11;
      sub_25E2E9A90(*(id *)&v12, v11, v13, v14, 13);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 13);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 13);
      sub_25E2F0EAC(*(void **)&v12, v100, v13, v14, 13);
      return v24 & 1;
    case 14:
      unint64_t v40 = a2->n128_u64[1];
      if (v15 == 14)
      {
        type metadata accessor for CGColor(0);
        sub_25E2E9A90(*(id *)&v12, v40, v13, v14, 14);
        sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 14);
        sub_25E2F1894(&qword_26A6E3C80, type metadata accessor for CGColor);
        char v24 = sub_25E30A060();
        sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 14);
        sub_25E2F0EAC(*(void **)&v12, v40, v13, v14, 14);
        return v24 & 1;
      }
      id v97 = *(id *)&v6;
      goto LABEL_126;
    case 15:
      if (v15 == 15)
      {
        uint64_t v32 = 0;
        switch(v7 >> 62)
        {
          case 1uLL:
            uint64_t v32 = (HIDWORD(v6) - LODWORD(v6));
            if (!__OFSUB__(HIDWORD(v6), LODWORD(v6)))
            {
              uint64_t v32 = (int)v32;
              goto LABEL_152;
            }
            __break(1u);
            goto LABEL_172;
          case 2uLL:
            uint64_t v107 = *(void *)(*(void *)&v6 + 16);
            uint64_t v106 = *(void *)(*(void *)&v6 + 24);
            BOOL v108 = __OFSUB__(v106, v107);
            uint64_t v32 = v106 - v107;
            if (!v108) {
              goto LABEL_152;
            }
LABEL_172:
            __break(1u);
LABEL_173:
            __break(1u);
LABEL_174:
            __break(1u);
            goto LABEL_175;
          case 3uLL:
            goto LABEL_152;
          default:
            uint64_t v32 = BYTE6(v7);
LABEL_152:
            switch(v11 >> 62)
            {
              case 1uLL:
                LODWORD(v109) = HIDWORD(v12) - LODWORD(v12);
                if (__OFSUB__(HIDWORD(v12), LODWORD(v12))) {
                  goto LABEL_173;
                }
                uint64_t v109 = (int)v109;
                goto LABEL_160;
              case 2uLL:
                uint64_t v111 = *(void *)(*(void *)&v12 + 16);
                uint64_t v110 = *(void *)(*(void *)&v12 + 24);
                BOOL v108 = __OFSUB__(v110, v111);
                uint64_t v109 = v110 - v111;
                if (v108) {
                  goto LABEL_174;
                }
                goto LABEL_160;
              case 3uLL:
                if (v32) {
                  goto LABEL_165;
                }
                goto LABEL_168;
              default:
                uint64_t v109 = BYTE6(v11);
LABEL_160:
                if (v32 != v109)
                {
LABEL_165:
                  unint64_t v115 = a2->n128_u64[1];
                  sub_25E2E9A90((id)a2->n128_u64[0], v115, v13, v14, 15);
                  sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 15);
                  sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 15);
                  double v91 = v12;
                  unint64_t v92 = v115;
                  uint64_t v93 = v13;
                  uint64_t v94 = v14;
                  char v95 = 15;
                  goto LABEL_128;
                }
                if (v32 < 1)
                {
LABEL_168:
                  unint64_t v116 = a2->n128_u64[1];
                  sub_25E2E9A90((id)a2->n128_u64[0], v116, v13, v14, 15);
                  sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 15);
                  sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 15);
                  double v117 = v12;
                  unint64_t v118 = v116;
                  uint64_t v119 = v13;
                  uint64_t v120 = v14;
                  char v121 = 15;
                  goto LABEL_170;
                }
                uint64_t v112 = a2[1].n128_i64[1];
                unint64_t v113 = a2->n128_u64[1];
                sub_25E2E9A90((id)a2->n128_u64[0], v113, v13, v112, 15);
                sub_25E2E9A90(*(id *)&v12, v113, v13, v112, 15);
                sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 15);
                char v114 = sub_25E2EECFC(*(uint64_t *)&v6, v7, *(uint64_t *)&v12, v113);
                sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 15);
                sub_25E2F0EAC(*(void **)&v12, v113, v13, v112, 15);
                if ((v114 & 1) == 0) {
                  goto LABEL_129;
                }
                break;
            }
            goto LABEL_179;
        }
      }
      unint64_t v40 = a2->n128_u64[1];
      sub_25E2DBE30(a1->n128_u64[0], v7);
      goto LABEL_126;
    case 16:
      if (v15 != 16) {
        goto LABEL_124;
      }
      if (*(void *)&v6 == *(void *)&v12 && v7 == v11)
      {
        char v24 = 1;
      }
      else
      {
        unint64_t v48 = a2->n128_u64[1];
        char v49 = sub_25E30A9A0();
        unint64_t v11 = v48;
        char v24 = v49;
      }
      unint64_t v101 = v11;
      sub_25E2E9A90(*(id *)&v12, v11, v13, v14, 16);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 16);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 16);
      sub_25E2F0EAC(*(void **)&v12, v101, v13, v14, 16);
      return v24 & 1;
    case 17:
      if (v15 != 17) {
        goto LABEL_124;
      }
      if (*(void *)&v6 == *(void *)&v12 && v7 == v11)
      {
        char v24 = 1;
      }
      else
      {
        unint64_t v51 = a2->n128_u64[1];
        char v52 = sub_25E30A9A0();
        unint64_t v11 = v51;
        char v24 = v52;
      }
      unint64_t v102 = v11;
      sub_25E2E9A90(*(id *)&v12, v11, v13, v14, 17);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 17);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 17);
      sub_25E2F0EAC(*(void **)&v12, v102, v13, v14, 17);
      return v24 & 1;
    case 18:
      if (v15 != 18) {
        goto LABEL_124;
      }
      if (*(void *)&v6 == *(void *)&v12 && v7 == v11)
      {
        char v24 = 1;
      }
      else
      {
        unint64_t v54 = a2->n128_u64[1];
        char v55 = sub_25E30A9A0();
        unint64_t v11 = v54;
        char v24 = v55;
      }
      unint64_t v103 = v11;
      sub_25E2E9A90(*(id *)&v12, v11, v13, v14, 18);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 18);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 18);
      sub_25E2F0EAC(*(void **)&v12, v103, v13, v14, 18);
      return v24 & 1;
    case 19:
      if (v15 != 19) {
        goto LABEL_127;
      }
      unint64_t v56 = a2->n128_u64[1];
      sub_25E2F0EAC((void *)a1->n128_u64[0], v7, v9, v8, 19);
      double v17 = v12;
      unint64_t v18 = v56;
      uint64_t v19 = v13;
      uint64_t v20 = v14;
      char v21 = 19;
      goto LABEL_81;
    case 20:
      if (v15 != 20) {
        goto LABEL_127;
      }
      unint64_t v57 = a2->n128_u64[1];
      sub_25E2F0EAC((void *)a1->n128_u64[0], v7, v9, v8, 20);
      double v17 = v12;
      unint64_t v18 = v57;
      uint64_t v19 = v13;
      uint64_t v20 = v14;
      char v21 = 20;
      goto LABEL_81;
    case 21:
      if (v15 != 21) {
        goto LABEL_124;
      }
      if (*(void *)&v6 == *(void *)&v12 && v7 == v11)
      {
        char v24 = 1;
      }
      else
      {
        unint64_t v59 = a2->n128_u64[1];
        char v60 = sub_25E30A9A0();
        unint64_t v11 = v59;
        char v24 = v60;
      }
      unint64_t v104 = v11;
      sub_25E2E9A90(*(id *)&v12, v11, v13, v14, 21);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 21);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 21);
      sub_25E2F0EAC(*(void **)&v12, v104, v13, v14, 21);
      return v24 & 1;
    case 22:
      if (v15 != 22) {
        goto LABEL_110;
      }
      BOOL v61 = *(void *)&v6 == *(void *)&v12 && v7 == v11;
      if (v61 || (v62 = a2->n128_u64[1], v63 = sub_25E30A9A0(), unint64_t v11 = v62, (v63 & 1) != 0))
      {
        unint64_t v130 = v11;
        uint64_t v141 = v9;
        uint64_t v142 = v8;
        uint64_t v139 = v13;
        uint64_t v140 = v14;
        sub_25E2E9A90(*(id *)&v12, v11, v13, v14, 22);
        sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 22);
        uint64_t v64 = type metadata accessor for InspectorProperty();
        unint64_t v65 = sub_25E2F1B00();
        uint64_t v66 = sub_25E2F1894(&qword_26A6E3D30, (void (*)(uint64_t))type metadata accessor for InspectorProperty);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v24 = static InspectorCollection.== infix(_:_:)((uint64_t)&v141, (uint64_t)&v139, (uint64_t)&type metadata for InspectorPropertyID, v64, v65, v66);
        sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 22);
        double v67 = v12;
        unint64_t v68 = v130;
        uint64_t v69 = v13;
        uint64_t v70 = v14;
        char v71 = 22;
        goto LABEL_109;
      }
      sub_25E2E9A90(*(id *)&v12, v62, v13, v14, 22);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 22);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 22);
      double v91 = v12;
      unint64_t v92 = v62;
      uint64_t v93 = v13;
      uint64_t v94 = v14;
      char v95 = 22;
      goto LABEL_128;
    case 23:
      if (v15 != 23) {
        goto LABEL_110;
      }
      BOOL v72 = *(void *)&v6 == *(void *)&v12 && v7 == v11;
      if (v72 || (v73 = a2->n128_u64[1], v74 = sub_25E30A9A0(), unint64_t v11 = v73, (v74 & 1) != 0))
      {
        unint64_t v131 = v11;
        uint64_t v141 = v9;
        uint64_t v142 = v8;
        uint64_t v139 = v13;
        uint64_t v140 = v14;
        sub_25E2E9A90(*(id *)&v12, v11, v13, v14, 23);
        sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 23);
        uint64_t v75 = type metadata accessor for InspectorProperty();
        unint64_t v76 = sub_25E2F1B00();
        uint64_t v77 = sub_25E2F1894(&qword_26A6E3D30, (void (*)(uint64_t))type metadata accessor for InspectorProperty);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v24 = static InspectorCollection.== infix(_:_:)((uint64_t)&v141, (uint64_t)&v139, (uint64_t)&type metadata for InspectorPropertyID, v75, v76, v77);
        sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 23);
        double v67 = v12;
        unint64_t v68 = v131;
        uint64_t v69 = v13;
        uint64_t v70 = v14;
        char v71 = 23;
        goto LABEL_109;
      }
      sub_25E2E9A90(*(id *)&v12, v73, v13, v14, 23);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 23);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 23);
      double v91 = v12;
      unint64_t v92 = v73;
      uint64_t v93 = v13;
      uint64_t v94 = v14;
      char v95 = 23;
      goto LABEL_128;
    case 24:
      if (v15 != 24)
      {
LABEL_110:
        unint64_t v40 = a2->n128_u64[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_125;
      }
      if (*(void *)&v6 != *(void *)&v12 || v7 != v11)
      {
        unint64_t v79 = a2->n128_u64[1];
        char v80 = sub_25E30A9A0();
        unint64_t v11 = v79;
        if ((v80 & 1) == 0)
        {
          sub_25E2E9A90(*(id *)&v12, v79, v13, v14, 24);
          sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 24);
          sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 24);
          double v91 = v12;
          unint64_t v92 = v79;
          uint64_t v93 = v13;
          uint64_t v94 = v14;
          char v95 = 24;
          goto LABEL_128;
        }
      }
      unint64_t v132 = v11;
      uint64_t v141 = v9;
      uint64_t v142 = v8;
      uint64_t v139 = v13;
      uint64_t v140 = v14;
      sub_25E2E9A90(*(id *)&v12, v11, v13, v14, 24);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 24);
      uint64_t v81 = type metadata accessor for InspectorProperty();
      unint64_t v82 = sub_25E2F1B00();
      uint64_t v83 = sub_25E2F1894(&qword_26A6E3D30, (void (*)(uint64_t))type metadata accessor for InspectorProperty);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v24 = static InspectorCollection.== infix(_:_:)((uint64_t)&v141, (uint64_t)&v139, (uint64_t)&type metadata for InspectorPropertyID, v81, v82, v83);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 24);
      double v67 = v12;
      unint64_t v68 = v132;
      uint64_t v69 = v13;
      uint64_t v70 = v14;
      char v71 = 24;
LABEL_109:
      sub_25E2F0EAC(*(void **)&v67, v68, v69, v70, v71);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v24 & 1;
    case 25:
      if (v15 != 25) {
        goto LABEL_124;
      }
      unint64_t v84 = a2->n128_u64[1];
      sub_25E2E9A90((id)a2->n128_u64[0], v84, v13, v14, 25);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 25);
      char v24 = sub_25E2ED484(*(void *)&v6, *(void *)&v12);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 25);
      sub_25E2F0EAC(*(void **)&v12, v84, v13, v14, 25);
      return v24 & 1;
    case 26:
      if (v15 != 26) {
        goto LABEL_124;
      }
      unint64_t v85 = a2->n128_u64[1];
      sub_25E2E9A90((id)a2->n128_u64[0], v85, v13, v14, 26);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 26);
      char v24 = sub_25E2ED530(*(uint64_t *)&v6, *(uint64_t *)&v12);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 26);
      sub_25E2F0EAC(*(void **)&v12, v85, v13, v14, 26);
      return v24 & 1;
    case 27:
      if (v15 != 27)
      {
LABEL_124:
        unint64_t v40 = a2->n128_u64[1];
LABEL_125:
        swift_bridgeObjectRetain();
LABEL_126:
        unint64_t v11 = v40;
LABEL_127:
        unint64_t v90 = v11;
        sub_25E2E9A90(*(id *)&v12, v11, v13, v14, v15);
        sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, v10);
        double v91 = v12;
        unint64_t v92 = v90;
        uint64_t v93 = v13;
        uint64_t v94 = v14;
        char v95 = v15;
        goto LABEL_128;
      }
      if (!v7)
      {
        unint64_t v105 = a2->n128_u64[1];
        swift_bridgeObjectRetain();
        sub_25E2E9A90(*(id *)&v12, v105, v13, v14, 27);
        sub_25E2E9A90(*(id *)&v6, 0, v9, v8, 27);
        sub_25E2F0EAC(*(void **)&v6, 0, v9, v8, 27);
        sub_25E2F0EAC(*(void **)&v12, v105, v13, v14, 27);
        if (!v105)
        {
LABEL_179:
          char v24 = 1;
          return v24 & 1;
        }
        goto LABEL_167;
      }
      if (!v11)
      {
        sub_25E2E9A90((id)a2->n128_u64[0], 0, v13, v14, 27);
        sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 27);
        unint64_t v105 = 0;
LABEL_167:
        sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 27);
        double v91 = v12;
        unint64_t v92 = v105;
        uint64_t v93 = v13;
        uint64_t v94 = v14;
        char v95 = 27;
LABEL_128:
        sub_25E2F0EAC(*(void **)&v91, v92, v93, v94, v95);
        goto LABEL_129;
      }
      uint16x8_t v86 = (void *)a1->n128_u64[0];
      if (*(void *)&v6 != *(void *)&v12 || v7 != v11)
      {
        unint64_t v88 = a2->n128_u64[1];
        char v89 = sub_25E30A9A0();
        sub_25E2E9A90(*(id *)&v12, v88, v13, v14, 27);
        sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 27);
        sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 27);
        sub_25E2F0EAC(*(void **)&v12, v88, v13, v14, 27);
        if ((v89 & 1) == 0) {
          goto LABEL_129;
        }
        goto LABEL_179;
      }
      sub_25E2E9A90(v86, v7, v13, v14, 27);
      sub_25E2E9A90(*(id *)&v6, v7, v9, v8, 27);
      sub_25E2F0EAC(*(void **)&v6, v7, v9, v8, 27);
      double v117 = v6;
      unint64_t v118 = v7;
      uint64_t v119 = v13;
      uint64_t v120 = v14;
      char v121 = 27;
LABEL_170:
      sub_25E2F0EAC(*(void **)&v117, v118, v119, v120, v121);
      char v24 = 1;
      return v24 & 1;
    default:
      if (a2[2].n128_u8[0]) {
        goto LABEL_127;
      }
      unint64_t v16 = a2->n128_u64[1];
      sub_25E2F0EAC((void *)a1->n128_u64[0], v7, v9, v8, 0);
      double v17 = v12;
      unint64_t v18 = v16;
      uint64_t v19 = v13;
      uint64_t v20 = v14;
      char v21 = 0;
LABEL_81:
      sub_25E2F0EAC(*(void **)&v17, v18, v19, v20, v21);
      char v24 = *(void *)&v6 == *(void *)&v12;
      return v24 & 1;
  }
}

void sub_25E2F0EAC(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 4:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 17:
    case 18:
    case 21:
    case 25:
    case 26:
    case 27:
      goto LABEL_3;
    case 14:

      break;
    case 15:
      sub_25E2DCD88((uint64_t)a1, a2);
      break;
    case 22:
    case 23:
    case 24:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_3:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

unint64_t sub_25E2F0FD0()
{
  unint64_t result = qword_26A6E3C90;
  if (!qword_26A6E3C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3C90);
  }
  return result;
}

uint64_t sub_25E2F1024(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25E2F1068(uint64_t a1)
{
  return a1;
}

unint64_t sub_25E2F10BC()
{
  unint64_t result = qword_26A6E6AA0[0];
  if (!qword_26A6E6AA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E6AA0);
  }
  return result;
}

unint64_t sub_25E2F1114()
{
  unint64_t result = qword_26A6E3CC0;
  if (!qword_26A6E3CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3CC0);
  }
  return result;
}

unint64_t sub_25E2F116C()
{
  unint64_t result = qword_26A6E3CC8;
  if (!qword_26A6E3CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3CC8);
  }
  return result;
}

unint64_t sub_25E2F11C4()
{
  unint64_t result = qword_26A6E3CD0;
  if (!qword_26A6E3CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3CD0);
  }
  return result;
}

void destroy for InspectorPropertyValue(uint64_t a1)
{
}

uint64_t initializeWithCopy for InspectorPropertyValue(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_25E2E9A90(*(id *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for InspectorPropertyValue(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_25E2E9A90(*(id *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void **)a1;
  unint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_25E2F0EAC(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_16(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for InspectorPropertyValue(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  unint64_t v4 = *(void **)a1;
  unint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_25E2F0EAC(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorPropertyValue(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xE5 && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 229);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 0x1B) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for InspectorPropertyValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xE4)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 229;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xE5) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xE5) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25E2F13F4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_25E2F13FC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for InspectorPropertyValue()
{
  return &type metadata for InspectorPropertyValue;
}

void *sub_25E2F1418(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for InspectorPropertyValue.WrappedDictionaryKey(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for InspectorPropertyValue.WrappedDictionaryKey(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorPropertyValue.WrappedDictionaryKey(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for InspectorPropertyValue.WrappedDictionaryKey(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InspectorPropertyValue.WrappedDictionaryKey()
{
  return &type metadata for InspectorPropertyValue.WrappedDictionaryKey;
}

unsigned char *storeEnumTagSinglePayload for InspectorPropertyValue.WrappedDictionaryKey.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E2F1660);
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

ValueMetadata *type metadata accessor for InspectorPropertyValue.WrappedDictionaryKey.CodingKeys()
{
  return &type metadata for InspectorPropertyValue.WrappedDictionaryKey.CodingKeys;
}

__n128 __swift_memcpy128_16(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t sub_25E2F16BC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 128)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25E2F16DC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 128) = v3;
  return result;
}

__n128 __swift_memcpy64_16(uint64_t a1, uint64_t a2)
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

uint64_t sub_25E2F173C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25E2F175C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 64) = v3;
  return result;
}

__n128 __swift_memcpy48_16(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_25E2F17AC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25E2F17CC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SpatialInspectorVersioningError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SpatialInspectorVersioningError(uint64_t result, int a2, int a3)
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

uint64_t sub_25E2F184C()
{
  return sub_25E2F1894(&qword_26A6E3D18, type metadata accessor for CGColor);
}

uint64_t sub_25E2F1894(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25E2F18E0()
{
  unint64_t result = qword_26A6E70B0[0];
  if (!qword_26A6E70B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E70B0);
  }
  return result;
}

unint64_t sub_25E2F1938()
{
  unint64_t result = qword_26A6E71C0;
  if (!qword_26A6E71C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E71C0);
  }
  return result;
}

unint64_t sub_25E2F1990()
{
  unint64_t result = qword_26A6E71C8[0];
  if (!qword_26A6E71C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E71C8);
  }
  return result;
}

uint64_t sub_25E2F19E4()
{
  return sub_25E2F1894(&qword_26A6E3D20, type metadata accessor for CGColor);
}

uint64_t sub_25E2F1A2C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1752392040 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_25E2F1B00()
{
  unint64_t result = qword_26A6E3D28;
  if (!qword_26A6E3D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3D28);
  }
  return result;
}

unint64_t sub_25E2F1B54()
{
  unint64_t result = qword_26A6E3D38;
  if (!qword_26A6E3D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3D38);
  }
  return result;
}

unint64_t sub_25E2F1BA8()
{
  unint64_t result = qword_26A6E3D40;
  if (!qword_26A6E3D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3D40);
  }
  return result;
}

unint64_t sub_25E2F1BFC()
{
  unint64_t result = qword_26A6E3D48;
  if (!qword_26A6E3D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3D48);
  }
  return result;
}

unint64_t sub_25E2F1C50()
{
  unint64_t result = qword_26A6E3D50;
  if (!qword_26A6E3D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3D50);
  }
  return result;
}

unint64_t sub_25E2F1CA4()
{
  unint64_t result = qword_26A6E3D58;
  if (!qword_26A6E3D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3D58);
  }
  return result;
}

unint64_t sub_25E2F1CF8()
{
  unint64_t result = qword_26A6E3D60;
  if (!qword_26A6E3D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3D60);
  }
  return result;
}

unint64_t sub_25E2F1D4C()
{
  unint64_t result = qword_26A6E3D68;
  if (!qword_26A6E3D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3D68);
  }
  return result;
}

unint64_t sub_25E2F1DA0()
{
  unint64_t result = qword_26A6E3D70;
  if (!qword_26A6E3D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3D70);
  }
  return result;
}

unint64_t sub_25E2F1DF4()
{
  unint64_t result = qword_26A6E3D80;
  if (!qword_26A6E3D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3D80);
  }
  return result;
}

unint64_t sub_25E2F1E48()
{
  unint64_t result = qword_26A6E3D88;
  if (!qword_26A6E3D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3D88);
  }
  return result;
}

uint64_t sub_25E2F1E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3D98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E2F1F04(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t EntityID.id.getter()
{
  return *(void *)v0;
}

uint64_t EntityID.id.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*EntityID.id.modify())()
{
  return nullsub_1;
}

uint64_t EntityID.init(id:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t EntityID.description.getter()
{
  return sub_25E30A970();
}

uint64_t EntityID.init(extractedFrom:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3DC0);
  MEMORY[0x270FA5388](v6 - 8, v7);
  char v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30[4] = a1;
  v30[5] = a2;
  v30[2] = 0x3D44495026;
  v30[3] = 0xE500000000000000;
  uint64_t v10 = sub_25E30A050();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_25E2F21F8();
  sub_25E30A5D0();
  unint64_t v12 = v11;
  char v14 = v13;
  sub_25E2F224C((uint64_t)v9);
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0
    || (unint64_t v15 = sub_25E2F3684(v12, a1, a2),
        unint64_t v17 = v16,
        unint64_t v19 = v18,
        unint64_t v21 = v20,
        swift_bridgeObjectRelease(),
        sub_25E30A5A0() < 1)
    || (v15 ^ v17) < 0x4000)
  {
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = sub_25E2F35B0(v15, v17, v19, v21, 10);
    if ((v23 & 0x100) != 0)
    {
      char v24 = sub_25E2F2C70(v15, v17, v19, v21, 10);
      char v29 = v28;
      uint64_t result = swift_bridgeObjectRelease();
      if ((v29 & 1) == 0)
      {
LABEL_11:
        char v27 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      char v24 = (unsigned __int8 *)v22;
      char v25 = v23;
      uint64_t result = swift_bridgeObjectRelease();
      if ((v25 & 1) == 0) {
        goto LABEL_11;
      }
    }
  }
  char v24 = 0;
  char v27 = 1;
LABEL_9:
  *(void *)a3 = v24;
  *(unsigned char *)(a3 + 8) = v27;
  return result;
}

unint64_t sub_25E2F21F8()
{
  unint64_t result = qword_26A6E3DC8;
  if (!qword_26A6E3DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3DC8);
  }
  return result;
}

uint64_t sub_25E2F224C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3DC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static EntityID.appendID(to:id:)(uint64_t a1)
{
  return a1;
}

uint64_t static EntityID.removeID(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3DC0);
  MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v20[2] = a1;
  v20[3] = a2;
  v20[0] = 0x3D44495026;
  v20[1] = 0xE500000000000000;
  uint64_t v8 = sub_25E30A050();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_25E2F21F8();
  sub_25E30A5D0();
  char v10 = v9;
  sub_25E2F224C((uint64_t)v7);
  swift_bridgeObjectRelease();
  uint64_t v11 = 0;
  if ((v10 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_25E30A3A0();
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    uint64_t v11 = MEMORY[0x2611D19E0](v12, v14, v16, v18);
    swift_bridgeObjectRelease();
  }
  return v11;
}

BOOL static EntityID.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t EntityID.hash(into:)()
{
  return sub_25E30AA90();
}

uint64_t sub_25E2F2538()
{
  return 1;
}

uint64_t sub_25E2F2540()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2F2584()
{
  return sub_25E30AA60();
}

uint64_t sub_25E2F25AC()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2F25EC()
{
  return 25705;
}

uint64_t sub_25E2F25F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 25705 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25E30A9A0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_25E2F2678(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25E2F2684(uint64_t a1)
{
  unint64_t v2 = sub_25E2F36D0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2F26C0(uint64_t a1)
{
  unint64_t v2 = sub_25E2F36D0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t EntityID.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3DD0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2F36D0();
  sub_25E30AAC0();
  sub_25E30A950();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t EntityID.hashValue.getter()
{
  return sub_25E30AAA0();
}

uint64_t EntityID.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3DD8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  char v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2F36D0();
  sub_25E30AAB0();
  if (!v2)
  {
    uint64_t v10 = sub_25E30A860();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25E2F29C8()
{
  return 0;
}

uint64_t sub_25E2F2A4C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return EntityID.init(from:)(a1, a2);
}

uint64_t sub_25E2F2A64(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3DD0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2F36D0();
  sub_25E30AAC0();
  sub_25E30A950();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

BOOL sub_25E2F2B98(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25E2F2BAC()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2F2BF4()
{
  return sub_25E30AA90();
}

uint64_t sub_25E2F2C20()
{
  return sub_25E30AAA0();
}

void sub_25E2F2C64(void *a1@<X8>)
{
  *a1 = *v1;
}

unsigned __int8 *sub_25E2F2C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int64_t a5)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  sub_25E2F3AB8();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_25E30A390();
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
    char v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_25E2F2FE0();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    char v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    char v9 = (unsigned __int8 *)sub_25E30A6E0();
  }
LABEL_7:
  uint64_t v13 = sub_25E2F2D64(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_25E2F2D64(unsigned __int8 *result, uint64_t a2, int64_t a3)
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
            for (unint64_t i = result + 1; ; ++i)
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
  unint64_t v21 = result + 1;
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

uint64_t sub_25E2F2FE0()
{
  unint64_t v0 = sub_25E30A3A0();
  uint64_t v4 = sub_25E2F3060(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25E2F3060(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = sub_25E2F31B8(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_25E2F32B8(v9, 0);
      unint64_t v12 = sub_25E2F3320((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_25E30A6E0();
LABEL_4:
        JUMPOUT(0x2611D19F0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x2611D19F0](v11 + 4, v11[2]);
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
    return MEMORY[0x2611D19F0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_25E2F31B8(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    uint64_t result = sub_25E2F3534(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    uint64_t result = sub_25E2F3534(a2, a3, a4);
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

  return sub_25E30A350();
}

void *sub_25E2F32B8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3E00);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_25E2F3320(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    void *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    void v9[3] = a7;
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
      uint64_t result = sub_25E2F3534(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_25E30A360();
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
          uint64_t result = sub_25E30A6E0();
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
    uint64_t result = sub_25E2F3534(v12, a6, a7);
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
    unint64_t v12 = sub_25E30A330();
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

uint64_t sub_25E2F3534(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_25E30A370();
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
    uint64_t v5 = MEMORY[0x2611D1AA0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_25E2F35B0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int64_t a5)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t result = 0;
    goto LABEL_8;
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v11 = v14;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    uint64_t v11 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v11 = (void *)sub_25E30A6E0();
  }
  uint64_t result = sub_25E2F3B10((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    char v15 = v13 & 1;
LABEL_8:
    LOBYTE(v14[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

unint64_t sub_25E2F3684(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 >= result >> 14) {
    return sub_25E30A3A0();
  }
  __break(1u);
  return result;
}

unint64_t sub_25E2F36D0()
{
  unint64_t result = qword_26A6E72D0[0];
  if (!qword_26A6E72D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E72D0);
  }
  return result;
}

unint64_t sub_25E2F3724(void *a1)
{
  a1[1] = sub_25E2E20E4();
  a1[2] = sub_25E2E1BD8();
  a1[3] = sub_25E2F3764();
  unint64_t result = sub_25E2F37B8();
  a1[4] = result;
  return result;
}

unint64_t sub_25E2F3764()
{
  unint64_t result = qword_26A6E3DE0;
  if (!qword_26A6E3DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3DE0);
  }
  return result;
}

unint64_t sub_25E2F37B8()
{
  unint64_t result = qword_26A6E3DE8;
  if (!qword_26A6E3DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3DE8);
  }
  return result;
}

unint64_t sub_25E2F3810()
{
  unint64_t result = qword_26A6E3DF0;
  if (!qword_26A6E3DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3DF0);
  }
  return result;
}

uint64_t sub_25E2F3864()
{
  return MEMORY[0x263F8E980];
}

ValueMetadata *type metadata accessor for EntityID()
{
  return &type metadata for EntityID;
}

uint64_t getEnumTagSinglePayload for EntityID.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for EntityID.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E2F3970);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25E2F3998()
{
  return 0;
}

ValueMetadata *type metadata accessor for EntityID.CodingKeys()
{
  return &type metadata for EntityID.CodingKeys;
}

unint64_t sub_25E2F39B4()
{
  unint64_t result = qword_26A6E7760[0];
  if (!qword_26A6E7760[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E7760);
  }
  return result;
}

unint64_t sub_25E2F3A0C()
{
  unint64_t result = qword_26A6E7870;
  if (!qword_26A6E7870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E7870);
  }
  return result;
}

unint64_t sub_25E2F3A64()
{
  unint64_t result = qword_26A6E7878;
  if (!qword_26A6E7878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E7878);
  }
  return result;
}

unint64_t sub_25E2F3AB8()
{
  unint64_t result = qword_26A6E3DF8;
  if (!qword_26A6E3DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3DF8);
  }
  return result;
}

uint64_t sub_25E2F3B10(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, int64_t a6)
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
    unint64_t result = sub_25E2F3534(a2, a4, a5);
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
  unint64_t result = sub_25E30A350();
  int64_t v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    unint64_t result = sub_25E2F3534(v10, a4, a5);
    unint64_t v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    unint64_t result = sub_25E2F3534(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    unint64_t result = (a3 >> 16) - (v10 >> 16);
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
  unint64_t result = sub_25E30A350();
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
  char v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11) {
    char v19 = 0;
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
          BOOL v36 = v19 + 1;
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

uint64_t sub_25E2F3F30()
{
  return sub_25E300594(2, 0, &xmmword_26A6EBCD0);
}

long long *sub_25E2F3F44()
{
  if (qword_26A6E7900 != -1) {
    swift_once();
  }
  return &xmmword_26A6EBCD0;
}

double sub_25E2F3F90@<D0>(_OWORD *a1@<X8>)
{
  if (qword_26A6E7900 != -1) {
    swift_once();
  }
  swift_beginAccess();
  double result = *(double *)&xmmword_26A6EBCD0;
  *a1 = xmmword_26A6EBCD0;
  return result;
}

uint64_t sub_25E2F400C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (qword_26A6E7900 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  *(void *)&xmmword_26A6EBCD0 = v1;
  *((void *)&xmmword_26A6EBCD0 + 1) = v2;
  return result;
}

uint64_t (*sub_25E2F408C())()
{
  if (qword_26A6E7900 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_25E2F4114()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV2() + 20);
  uint64_t v2 = *(void *)v1;
  sub_25E2DBE30(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t type metadata accessor for SpatialInspectorDataV2()
{
  uint64_t result = qword_26A6E7A90;
  if (!qword_26A6E7A90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E2F41A4()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV2() + 24);
  uint64_t v2 = *(void *)v1;
  sub_25E2DBE30(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t sub_25E2F41E8()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV2() + 28);
  uint64_t v2 = *(void *)v1;
  sub_25E2DBF10(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t sub_25E2F422C()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV2() + 32);
  uint64_t v2 = *(void *)v1;
  sub_25E2DBF10(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

int *sub_25E2F4270@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v19 = sub_25E30A040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(a9, a1, v19);
  uint64_t result = (int *)type metadata accessor for SpatialInspectorDataV2();
  unsigned __int8 v21 = (void *)(a9 + result[5]);
  *unsigned __int8 v21 = a2;
  v21[1] = a3;
  unsigned __int8 v22 = (void *)(a9 + result[6]);
  *unsigned __int8 v22 = a4;
  v22[1] = a5;
  unsigned __int8 v23 = (void *)(a9 + result[7]);
  void *v23 = a6;
  v23[1] = a7;
  unint64_t v24 = (void *)(a9 + result[8]);
  void *v24 = a8;
  v24[1] = a10;
  return result;
}

unint64_t sub_25E2F4348(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x536465646F636E65;
      break;
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25E2F43F4()
{
  return sub_25E2F4348(*v0);
}

uint64_t sub_25E2F43FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2F5A30(a1, a2);
  *a3 = result;
  return result;
}

void sub_25E2F4424(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_25E2F4430(uint64_t a1)
{
  unint64_t v2 = sub_25E2F473C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2F446C(uint64_t a1)
{
  unint64_t v2 = sub_25E2F473C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25E2F44A8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3E08);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2F473C();
  sub_25E30AAC0();
  LOBYTE(v14) = 0;
  sub_25E30A040();
  sub_25E2F4D84(&qword_26A6E3838, MEMORY[0x263F07508]);
  sub_25E30A920();
  if (!v2)
  {
    unint64_t v10 = (int *)type metadata accessor for SpatialInspectorDataV2();
    long long v14 = *(_OWORD *)(v3 + v10[5]);
    char v13 = 1;
    sub_25E2DC704();
    sub_25E30A920();
    long long v14 = *(_OWORD *)(v3 + v10[6]);
    char v13 = 2;
    sub_25E30A920();
    long long v14 = *(_OWORD *)(v3 + v10[7]);
    char v13 = 3;
    sub_25E30A8B0();
    long long v14 = *(_OWORD *)(v3 + v10[8]);
    char v13 = 4;
    sub_25E30A8B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_25E2F473C()
{
  unint64_t result = qword_26A6E7908[0];
  if (!qword_26A6E7908[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E7908);
  }
  return result;
}

uint64_t sub_25E2F4790@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v4 = sub_25E30A040();
  uint64_t v22 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v5);
  unsigned __int8 v23 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3E10);
  uint64_t v21 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24, v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = (int *)type metadata accessor for SpatialInspectorDataV2();
  MEMORY[0x270FA5388](v10, v11);
  char v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2F473C();
  unsigned __int8 v25 = v9;
  sub_25E30AAB0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v19 = a1;
  uint64_t v14 = v22;
  LOBYTE(v26) = 0;
  sub_25E2F4D84(&qword_26A6E3860, MEMORY[0x263F07508]);
  int64_t v15 = v23;
  uint64_t v16 = v24;
  sub_25E30A830();
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v13, v15, v4);
  char v27 = 1;
  sub_25E2DCDE0();
  sub_25E30A830();
  *(_OWORD *)&v13[v10[5]] = v26;
  char v27 = 2;
  unsigned __int8 v23 = 0;
  sub_25E30A830();
  *(_OWORD *)&v13[v10[6]] = v26;
  char v27 = 3;
  sub_25E30A7C0();
  *(_OWORD *)&v13[v10[7]] = v26;
  char v27 = 4;
  sub_25E30A7C0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v25, v16);
  *(_OWORD *)&v13[v10[8]] = v26;
  sub_25E2F4C9C((uint64_t)v13, v20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  return sub_25E2DF870((uint64_t)v13);
}

uint64_t sub_25E2F4C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SpatialInspectorDataV2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E2F4D00(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_25E2F4D84(&qword_26A6E38C8, (void (*)(uint64_t))type metadata accessor for SpatialInspectorDataV2);
  uint64_t result = sub_25E2F4D84(&qword_26A6E3E18, (void (*)(uint64_t))type metadata accessor for SpatialInspectorDataV2);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_25E2F4D84(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25E2F4DCC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25E2F4790(a1, a2);
}

uint64_t sub_25E2F4DE4(void *a1)
{
  return sub_25E2F44A8(a1);
}

uint64_t *sub_25E2F4DFC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25E30A040();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    unint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = *v10;
    unint64_t v12 = v10[1];
    sub_25E2DBE30(*v10, v12);
    uint64_t *v9 = v11;
    v9[1] = v12;
    uint64_t v13 = a3[6];
    uint64_t v14 = (uint64_t *)((char *)a1 + v13);
    int64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = *v15;
    unint64_t v17 = v15[1];
    sub_25E2DBE30(*v15, v17);
    uint64_t *v14 = v16;
    v14[1] = v17;
    uint64_t v18 = a3[7];
    uint64_t v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)a2 + v18;
    unint64_t v21 = *((void *)v20 + 1);
    if (v21 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    }
    else
    {
      uint64_t v23 = *(void *)v20;
      sub_25E2DBE30(*(void *)v20, *((void *)v20 + 1));
      *(void *)uint64_t v19 = v23;
      *((void *)v19 + 1) = v21;
    }
    uint64_t v24 = a3[8];
    unsigned __int8 v25 = (char *)a1 + v24;
    long long v26 = (char *)a2 + v24;
    unint64_t v27 = *((void *)v26 + 1);
    if (v27 >> 60 == 15)
    {
      *(_OWORD *)unsigned __int8 v25 = *(_OWORD *)v26;
    }
    else
    {
      uint64_t v28 = *(void *)v26;
      sub_25E2DBE30(*(void *)v26, *((void *)v26 + 1));
      *(void *)unsigned __int8 v25 = v28;
      *((void *)v25 + 1) = v27;
    }
  }
  return a1;
}

uint64_t sub_25E2F4F7C(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_25E30A040();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_25E2DCD88(*(void *)(a1 + a2[5]), *(void *)(a1 + a2[5] + 8));
  uint64_t result = sub_25E2DCD88(*(void *)(a1 + a2[6]), *(void *)(a1 + a2[6] + 8));
  uint64_t v6 = (uint64_t *)(a1 + a2[7]);
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15) {
    uint64_t result = sub_25E2DCD88(*v6, v7);
  }
  uint64_t v8 = (uint64_t *)(a1 + a2[8]);
  unint64_t v9 = v8[1];
  if (v9 >> 60 != 15)
  {
    uint64_t v10 = *v8;
    return sub_25E2DCD88(v10, v9);
  }
  return result;
}

uint64_t sub_25E2F5050(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E30A040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  unint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  sub_25E2DBE30(*v9, v11);
  uint64_t *v8 = v10;
  v8[1] = v11;
  uint64_t v12 = a3[6];
  uint64_t v13 = (uint64_t *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  unint64_t v16 = v14[1];
  sub_25E2DBE30(*v14, v16);
  *uint64_t v13 = v15;
  v13[1] = v16;
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = (uint64_t *)(a2 + v17);
  unint64_t v20 = v19[1];
  if (v20 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  }
  else
  {
    uint64_t v21 = *v19;
    sub_25E2DBE30(*v19, v19[1]);
    *(void *)uint64_t v18 = v21;
    *(void *)(v18 + 8) = v20;
  }
  uint64_t v22 = a3[8];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = (uint64_t *)(a2 + v22);
  unint64_t v25 = v24[1];
  if (v25 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  }
  else
  {
    uint64_t v26 = *v24;
    sub_25E2DBE30(*v24, v24[1]);
    *(void *)uint64_t v23 = v26;
    *(void *)(v23 + 8) = v25;
  }
  return a1;
}

uint64_t sub_25E2F5180(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E30A040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  unint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  sub_25E2DBE30(*v9, v11);
  uint64_t v12 = *v8;
  unint64_t v13 = v8[1];
  uint64_t *v8 = v10;
  v8[1] = v11;
  sub_25E2DCD88(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = (uint64_t *)(a1 + v14);
  unint64_t v16 = (uint64_t *)(a2 + v14);
  uint64_t v17 = *v16;
  unint64_t v18 = v16[1];
  sub_25E2DBE30(*v16, v18);
  uint64_t v19 = *v15;
  unint64_t v20 = v15[1];
  *uint64_t v15 = v17;
  v15[1] = v18;
  sub_25E2DCD88(v19, v20);
  uint64_t v21 = a3[7];
  uint64_t v22 = (uint64_t *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  unint64_t v24 = *(void *)(a2 + v21 + 8);
  if (*(void *)(a1 + v21 + 8) >> 60 == 15)
  {
    if (v24 >> 60 != 15)
    {
      uint64_t v25 = *v23;
      sub_25E2DBE30(v25, v24);
      *uint64_t v22 = v25;
      v22[1] = v24;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v24 >> 60 == 15)
  {
    sub_25E2DD50C((uint64_t)v22);
LABEL_6:
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    goto LABEL_8;
  }
  uint64_t v26 = *v23;
  sub_25E2DBE30(v26, v24);
  uint64_t v27 = *v22;
  unint64_t v28 = v22[1];
  *uint64_t v22 = v26;
  v22[1] = v24;
  sub_25E2DCD88(v27, v28);
LABEL_8:
  uint64_t v29 = a3[8];
  unint64_t v30 = (uint64_t *)(a1 + v29);
  unsigned __int8 v31 = (uint64_t *)(a2 + v29);
  unint64_t v32 = *(void *)(a2 + v29 + 8);
  if (*(void *)(a1 + v29 + 8) >> 60 != 15)
  {
    if (v32 >> 60 != 15)
    {
      uint64_t v34 = *v31;
      sub_25E2DBE30(v34, v32);
      uint64_t v35 = *v30;
      unint64_t v36 = v30[1];
      *unint64_t v30 = v34;
      v30[1] = v32;
      sub_25E2DCD88(v35, v36);
      return a1;
    }
    sub_25E2DD50C((uint64_t)v30);
    goto LABEL_13;
  }
  if (v32 >> 60 == 15)
  {
LABEL_13:
    *(_OWORD *)unint64_t v30 = *(_OWORD *)v31;
    return a1;
  }
  uint64_t v33 = *v31;
  sub_25E2DBE30(v33, v32);
  *unint64_t v30 = v33;
  v30[1] = v32;
  return a1;
}

uint64_t sub_25E2F5348(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E30A040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t sub_25E2F53E0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E30A040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void *)(a1 + v7);
  unint64_t v9 = *(void *)(a1 + v7 + 8);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  sub_25E2DCD88(v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = *(void *)(a1 + v10);
  unint64_t v12 = *(void *)(a1 + v10 + 8);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  sub_25E2DCD88(v11, v12);
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  unint64_t v16 = *(void *)(a1 + v13 + 8);
  if (v16 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v17 = *(void *)(v15 + 8);
  if (v17 >> 60 == 15)
  {
    sub_25E2DD50C(v14);
LABEL_4:
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    goto LABEL_6;
  }
  uint64_t v18 = *(void *)v14;
  *(void *)uint64_t v14 = *(void *)v15;
  *(void *)(v14 + 8) = v17;
  sub_25E2DCD88(v18, v16);
LABEL_6:
  uint64_t v19 = a3[8];
  unint64_t v20 = (uint64_t *)(a1 + v19);
  uint64_t v21 = (uint64_t *)(a2 + v19);
  unint64_t v22 = *(void *)(a1 + v19 + 8);
  if (v22 >> 60 != 15)
  {
    unint64_t v23 = v21[1];
    if (v23 >> 60 != 15)
    {
      uint64_t v24 = *v20;
      *unint64_t v20 = *v21;
      v20[1] = v23;
      sub_25E2DCD88(v24, v22);
      return a1;
    }
    sub_25E2DD50C((uint64_t)v20);
  }
  *(_OWORD *)unint64_t v20 = *(_OWORD *)v21;
  return a1;
}

uint64_t sub_25E2F5528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E2F553C);
}

uint64_t sub_25E2F553C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25E30A040();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8) >> 60;
    if (((4 * v10) & 0xC) != 0) {
      return 16 - ((4 * v10) & 0xC | (v10 >> 2));
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_25E2F5610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E2F5624);
}

uint64_t sub_25E2F5624(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25E30A040();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    uint64_t v11 = (void *)(a1 + *(int *)(a4 + 20));
    *uint64_t v11 = 0;
    v11[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

uint64_t sub_25E2F56F0()
{
  uint64_t result = sub_25E30A040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SpatialInspectorDataV2.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SpatialInspectorDataV2.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x25E2F58F0);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SpatialInspectorDataV2.CodingKeys()
{
  return &type metadata for SpatialInspectorDataV2.CodingKeys;
}

unint64_t sub_25E2F592C()
{
  unint64_t result = qword_26A6E7BA0[0];
  if (!qword_26A6E7BA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E7BA0);
  }
  return result;
}

unint64_t sub_25E2F5984()
{
  unint64_t result = qword_26A6E7CB0;
  if (!qword_26A6E7CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E7CB0);
  }
  return result;
}

unint64_t sub_25E2F59DC()
{
  unint64_t result = qword_26A6E7CB8[0];
  if (!qword_26A6E7CB8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E7CB8);
  }
  return result;
}

uint64_t sub_25E2F5A30(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000025E311B30 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x536465646F636E65 && a2 == 0xEC000000656E6563 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000025E311B50 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x800000025E311B70 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000025E311F50)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_25E2F5C48(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x746169636F737361;
  }
  else {
    uint64_t v3 = 0x696D697263736964;
  }
  if (v2) {
    unint64_t v4 = 0xEC0000006574616ELL;
  }
  else {
    unint64_t v4 = 0xEF65756C61566465;
  }
  if (a2) {
    uint64_t v5 = 0x746169636F737361;
  }
  else {
    uint64_t v5 = 0x696D697263736964;
  }
  if (a2) {
    unint64_t v6 = 0xEF65756C61566465;
  }
  else {
    unint64_t v6 = 0xEC0000006574616ELL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25E30A9A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25E2F5D00()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2F5D98()
{
  sub_25E30A2A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E2F5E18()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2F5EAC(char a1)
{
  if (a1) {
    return 0x746169636F737361;
  }
  else {
    return 0x696D697263736964;
  }
}

uint64_t sub_25E2F5EF8(char *a1, char *a2)
{
  return sub_25E2F5C48(*a1, *a2);
}

uint64_t sub_25E2F5F04()
{
  return sub_25E2F5D00();
}

uint64_t sub_25E2F5F0C()
{
  return sub_25E2F5D98();
}

uint64_t sub_25E2F5F14()
{
  return sub_25E2F5E18();
}

uint64_t sub_25E2F5F1C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25E30A780();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_25E2F5F7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25E2F5EAC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25E2F5FA8()
{
  return sub_25E2F5EAC(*v0);
}

uint64_t sub_25E2F5FB0@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25E30A780();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_25E2F6014(uint64_t a1)
{
  unint64_t v2 = sub_25E2F787C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2F6050(uint64_t a1)
{
  unint64_t v2 = sub_25E2F787C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25E2F608C(char a1)
{
  if (a1) {
    return 0x65756C6176;
  }
  else {
    return 0x6C6562616CLL;
  }
}

uint64_t sub_25E2F60B4(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F30);
  uint64_t v10 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v5);
  char v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v9 = *(_OWORD *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2F9F0C();
  sub_25E30AAC0();
  LOBYTE(v11) = 0;
  sub_25E30A8E0();
  if (!v2)
  {
    long long v11 = v9;
    char v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C70);
    sub_25E2F1024(&qword_26A6E3F38, &qword_26A6E3C70);
    sub_25E30A920();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v7, v4);
}

uint64_t sub_25E2F6274@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F40);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  long long v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2F9F0C();
  sub_25E30AAB0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v19) = 0;
  uint64_t v10 = sub_25E30A7F0();
  uint64_t v12 = v11;
  uint64_t v18 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C70);
  char v21 = 1;
  sub_25E2F1024(&qword_26A6E3F48, &qword_26A6E3C70);
  swift_bridgeObjectRetain();
  sub_25E30A830();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  uint64_t v13 = v19;
  uint64_t v14 = v20;
  uint64_t v15 = v18;
  *uint64_t v18 = v10;
  v15[1] = v12;
  _DWORD v15[2] = v13;
  v15[3] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E2F64D4()
{
  return sub_25E2F608C(*v0);
}

uint64_t sub_25E2F64DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2FA16C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E2F6504(uint64_t a1)
{
  unint64_t v2 = sub_25E2F9F0C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2F6540(uint64_t a1)
{
  unint64_t v2 = sub_25E2F9F0C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25E2F657C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25E2F6274(a1, a2);
}

uint64_t sub_25E2F6594(void *a1)
{
  return sub_25E2F60B4(a1);
}

void InspectorPropertyValue.encode(to:)(void *a1)
{
  uint64_t v4 = sub_25E30A0A0();
  uint64_t v74 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v5);
  unint64_t v73 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3E20);
  uint64_t v69 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75, v7);
  long long v9 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void **)v1;
  char v71 = *(NSObject **)(v1 + 8);
  BOOL v72 = v10;
  uint64_t v68 = *(void *)(v1 + 16);
  uint64_t v70 = *(void *)(v1 + 24);
  uint64_t v11 = *(unsigned __int8 *)(v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2F787C();
  sub_25E30AAC0();
  switch(v11)
  {
    case 1:
      LOBYTE(v76) = 0;
      goto LABEL_37;
    case 2:
      LOBYTE(v76) = 0;
      sub_25E30A8E0();
      if (v2) {
        goto LABEL_41;
      }
      LOBYTE(v76) = 1;
      sub_25E30A900();
      goto LABEL_61;
    case 3:
      LOBYTE(v76) = 0;
      sub_25E30A8E0();
      if (v2) {
        goto LABEL_41;
      }
      LOBYTE(v76) = 1;
      sub_25E30A8F0();
      goto LABEL_61;
    case 4:
      LOBYTE(v76) = 0;
      goto LABEL_40;
    case 5:
      LOBYTE(v76) = 0;
      sub_25E30A8E0();
      uint64_t v12 = v2;
      if (v2) {
        goto LABEL_42;
      }
      uint64_t v76 = (uint64_t)v72;
      LOBYTE(v81) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B30);
      sub_25E2F1024(&qword_26A6E3EC8, &qword_26A6E3B30);
      goto LABEL_60;
    case 6:
      LOBYTE(v76) = 0;
      sub_25E30A8E0();
      uint64_t v12 = v2;
      if (v2) {
        goto LABEL_42;
      }
      uint64_t v76 = (uint64_t)v72;
      uint64_t v77 = v71;
      LOBYTE(v81) = 1;
      uint64_t v13 = &qword_26A6E3848;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3848);
      uint64_t v14 = &qword_26A6E3850;
      goto LABEL_18;
    case 7:
      LOBYTE(v76) = 0;
      goto LABEL_16;
    case 8:
      LOBYTE(v76) = 0;
LABEL_16:
      sub_25E30A8E0();
      uint64_t v12 = v2;
      if (v2) {
        goto LABEL_42;
      }
      uint64_t v76 = (uint64_t)v72;
      uint64_t v77 = v71;
      LOBYTE(v81) = 1;
      uint64_t v13 = &qword_26A6E3BD8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BD8);
      uint64_t v14 = &qword_26A6E3EA0;
LABEL_18:
      sub_25E2F1024(v14, v13);
      goto LABEL_60;
    case 9:
      LOBYTE(v76) = 0;
      sub_25E30A8E0();
      uint64_t v12 = v2;
      if (v2) {
        goto LABEL_42;
      }
      uint64_t v76 = (uint64_t)v72;
      LOBYTE(v81) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3EB8);
      sub_25E2F97D0();
      goto LABEL_60;
    case 10:
      LOBYTE(v76) = 0;
      sub_25E30A8E0();
      uint64_t v12 = v2;
      if (v2) {
        goto LABEL_42;
      }
      uint64_t v76 = (uint64_t)v72;
      LOBYTE(v81) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3EA8);
      sub_25E2F9738();
      goto LABEL_60;
    case 11:
      LOBYTE(v76) = 0;
      sub_25E30A8E0();
      uint64_t v12 = v2;
      if (v2) {
        goto LABEL_42;
      }
      uint64_t v76 = (uint64_t)v72;
      LOBYTE(v81) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3E90);
      sub_25E2F96A0();
      goto LABEL_60;
    case 12:
      LOBYTE(v76) = 0;
      goto LABEL_40;
    case 13:
      LOBYTE(v76) = 0;
      goto LABEL_40;
    case 14:
      LOBYTE(v76) = 0;
      uint64_t v15 = v72;
      uint64_t v16 = v68;
      uint64_t v17 = v70;
      sub_25E2E9A90(v72, (unint64_t)v71, v68, v70, 14);
      sub_25E30A8E0();
      uint64_t v12 = v2;
      if (v2)
      {
        uint64_t v66 = v9;
        uint64_t v67 = v11;
        uint64_t v18 = v15;
        uint64_t v19 = v71;
        uint64_t v20 = v71;
        uint64_t v21 = v16;
        uint64_t v22 = v17;
        char v23 = 14;
        goto LABEL_31;
      }
      unint64_t v51 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
      if (v51)
      {
        char v52 = v51;
        char v53 = v72;
        CGColorRef CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v51, kCGRenderingIntentDefault, (CGColorRef)v72, 0);
        if (CopyByMatchingToColorSpace)
        {
          CGColorRef v55 = CopyByMatchingToColorSpace;
          uint64_t v67 = v11;
          uint64_t v64 = v4;
          uint64_t v76 = sub_25E30A520();
          LOBYTE(v81) = 1;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3E68);
          sub_25E2F99EC(&qword_26A6E3E70, &qword_26A6E3E68, (void (*)(void))sub_25E2F9610);
          sub_25E30A920();
          (*(void (**)(char *, uint64_t))(v69 + 8))(v9, v75);

          sub_25E2F0EAC(v72, (unint64_t)v71, v68, v70, 14);
          swift_bridgeObjectRelease();
          return;
        }
        (*(void (**)(char *, uint64_t))(v69 + 8))(v9, v75);

        unint64_t v57 = v53;
        uint64_t v58 = v71;
        uint64_t v59 = v68;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v69 + 8))(v9, v75);
        uint64_t v58 = v71;
        unint64_t v57 = v72;
        uint64_t v59 = v16;
      }
      sub_25E2F0EAC(v57, (unint64_t)v58, v59, v70, 14);
      return;
    case 15:
      LOBYTE(v76) = 0;
      uint64_t v24 = v72;
      uint64_t v16 = v68;
      uint64_t v17 = v70;
      sub_25E2E9A90(v72, (unint64_t)v71, v68, v70, 15);
      sub_25E30A8E0();
      uint64_t v12 = v2;
      if (!v2)
      {
        unint64_t v56 = v71;
        uint64_t v76 = (uint64_t)v24;
        uint64_t v77 = v71;
        LOBYTE(v81) = 1;
        sub_25E2DC704();
        sub_25E30A920();
        (*(void (**)(char *, uint64_t))(v69 + 8))(v9, v75);
        sub_25E2F0EAC(v24, (unint64_t)v56, v16, v70, 15);
        return;
      }
      uint64_t v66 = v9;
      uint64_t v67 = v11;
      uint64_t v18 = v24;
      uint64_t v19 = v71;
      uint64_t v20 = v71;
      uint64_t v21 = v16;
      uint64_t v22 = v17;
      char v23 = 15;
LABEL_31:
      sub_25E2F0EAC(v18, (unint64_t)v20, v21, v22, v23);
      goto LABEL_52;
    case 16:
      LOBYTE(v76) = 0;
      goto LABEL_40;
    case 17:
      LOBYTE(v76) = 0;
      goto LABEL_40;
    case 18:
      LOBYTE(v76) = 0;
      goto LABEL_40;
    case 19:
      LOBYTE(v76) = 0;
      goto LABEL_37;
    case 20:
      LOBYTE(v76) = 0;
LABEL_37:
      sub_25E30A8E0();
      if (v2) {
        goto LABEL_41;
      }
      LOBYTE(v76) = 1;
      sub_25E30A950();
      goto LABEL_61;
    case 21:
      LOBYTE(v76) = 0;
LABEL_40:
      sub_25E30A8E0();
      if (v2) {
        goto LABEL_41;
      }
      LOBYTE(v76) = 1;
      sub_25E30A8E0();
      goto LABEL_61;
    case 22:
    case 23:
    case 24:
      LOBYTE(v76) = 0;
      char v49 = v71;
      swift_bridgeObjectRetain();
      uint64_t v16 = v68;
      swift_bridgeObjectRetain();
      uint64_t v50 = v70;
      swift_bridgeObjectRetain();
      sub_25E30A8E0();
      if (!v2)
      {
        uint64_t v76 = (uint64_t)v72;
        uint64_t v77 = v49;
        uint64_t v78 = v16;
        uint64_t v79 = v50;
        LOBYTE(v81) = 1;
        sub_25E2F95BC();
        sub_25E30A920();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_61;
      }
      uint64_t v19 = v49;
      uint64_t v17 = v50;
      uint64_t v12 = v2;
      uint64_t v66 = v9;
      uint64_t v67 = v11;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_52:
      uint64_t v65 = 0;
      uint64_t v26 = v73;
      uint64_t v25 = v74;
      goto LABEL_43;
    case 25:
      LOBYTE(v76) = 0;
      sub_25E30A8E0();
      uint64_t v12 = v2;
      if (v2) {
        goto LABEL_42;
      }
      uint64_t v76 = (uint64_t)v72;
      LOBYTE(v81) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3E58);
      sub_25E2F99EC(&qword_26A6E3E60, &qword_26A6E3E58, (void (*)(void))sub_25E2F9568);
      goto LABEL_60;
    case 26:
      LOBYTE(v76) = 0;
      sub_25E30A8E0();
      uint64_t v12 = v2;
      if (v2) {
        goto LABEL_42;
      }
      uint64_t v76 = (uint64_t)v72;
      LOBYTE(v81) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3E38);
      sub_25E2F9868(&qword_26A6E3E40, (void (*)(void))sub_25E2F9514, (void (*)(void))sub_25E2F9568);
      goto LABEL_60;
    case 27:
      LOBYTE(v76) = 0;
      sub_25E30A8E0();
      uint64_t v12 = v2;
      if (v2) {
        goto LABEL_42;
      }
      uint64_t v76 = (uint64_t)v72;
      uint64_t v77 = v71;
      LOBYTE(v81) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C88);
      sub_25E2F94A8();
LABEL_60:
      sub_25E30A920();
      goto LABEL_61;
    default:
      LOBYTE(v76) = 0;
      sub_25E30A8E0();
      if (v2)
      {
LABEL_41:
        uint64_t v12 = v2;
LABEL_42:
        uint64_t v66 = v9;
        uint64_t v67 = v11;
        uint64_t v65 = 0;
        uint64_t v26 = v73;
        uint64_t v25 = v74;
        uint64_t v17 = v70;
        uint64_t v19 = v71;
        uint64_t v16 = v68;
LABEL_43:
        uint64_t v27 = sub_25E2E8928();
        (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v26, v27, v4);
        unint64_t v28 = v72;
        char v29 = v67;
        sub_25E2E9A90(v72, (unint64_t)v19, v16, v17, v67);
        id v30 = v12;
        sub_25E2E9A90(v28, (unint64_t)v19, v16, v17, v29);
        id v31 = v12;
        unint64_t v32 = v26;
        unint64_t v33 = (unint64_t)v19;
        uint64_t v34 = v16;
        uint64_t v35 = sub_25E30A090();
        os_log_type_t v36 = sub_25E30A560();
        char v71 = v35;
        LODWORD(v68) = v36;
        if (os_log_type_enabled(v35, v36))
        {
          uint64_t v37 = swift_slowAlloc();
          uint64_t v64 = v4;
          uint64_t v38 = v37;
          unint64_t v62 = (void *)swift_slowAlloc();
          uint64_t v63 = swift_slowAlloc();
          uint64_t v81 = v63;
          *(_DWORD *)uint64_t v38 = 136315394;
          id v61 = v12;
          uint64_t v76 = (uint64_t)v28;
          uint64_t v77 = v33;
          uint64_t v78 = v34;
          uint64_t v79 = v17;
          char v80 = v29;
          sub_25E2F9454();
          uint64_t v39 = sub_25E30A970();
          uint64_t v76 = sub_25E2F8E64(v39, v40, &v81);
          sub_25E30A5B0();
          swift_bridgeObjectRelease();
          sub_25E2F0EAC(v28, v33, v34, v17, v29);
          sub_25E2F0EAC(v28, v33, v34, v17, v29);
          *(_WORD *)(v38 + 12) = 2112;
          id v41 = v61;
          id v42 = v61;
          uint64_t v43 = _swift_stdlib_bridgeErrorToNSError();
          uint64_t v76 = v43;
          sub_25E30A5B0();
          unsigned __int8 v44 = v62;
          *unint64_t v62 = v43;

          unsigned int v45 = v71;
          _os_log_impl(&dword_25E2DA000, v71, (os_log_type_t)v68, "Failed to encode InspectorPropertyValue: %s, because: %@", (uint8_t *)v38, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3A78);
          swift_arrayDestroy();
          MEMORY[0x2611D27B0](v44, -1, -1);
          uint64_t v46 = v63;
          swift_arrayDestroy();
          MEMORY[0x2611D27B0](v46, -1, -1);
          MEMORY[0x2611D27B0](v38, -1, -1);

          (*(void (**)(char *, uint64_t))(v74 + 8))(v73, v64);
        }
        else
        {

          sub_25E2F0EAC(v28, v33, v34, v17, v29);
          sub_25E2F0EAC(v28, v33, v34, v17, v29);

          (*(void (**)(char *, uint64_t))(v74 + 8))(v32, v4);
        }
        uint64_t v48 = v65;
        unint64_t v47 = v66;
        LOBYTE(v76) = 0;
        sub_25E30A8E0();
        if (!v48)
        {
          LOBYTE(v76) = 1;
          sub_25E30A8E0();
        }
        (*(void (**)(char *, uint64_t))(v69 + 8))(v47, v75);
      }
      else
      {
        LOBYTE(v76) = 1;
        sub_25E30A940();
LABEL_61:
        (*(void (**)(char *, uint64_t))(v69 + 8))(v9, v75);
      }
      return;
  }
}

unint64_t sub_25E2F787C()
{
  unint64_t result = qword_26A6E7D50;
  if (!qword_26A6E7D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E7D50);
  }
  return result;
}

uint64_t InspectorPropertyValue.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v69 = a2;
  uint64_t v3 = sub_25E30A0A0();
  uint64_t v68 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3, v4);
  uint64_t v7 = ((char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5, v8);
  uint64_t v10 = (char *)&v62 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3ED0);
  uint64_t v70 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v12);
  uint64_t v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2F787C();
  uint64_t v15 = v71;
  sub_25E30AAB0();
  if (v15)
  {
    uint64_t v17 = (uint64_t)a1;
  }
  else
  {
    uint64_t v67 = v7;
    LOBYTE(v72) = 0;
    uint64_t v16 = v14;
    uint64_t v19 = sub_25E30A7F0();
    unint64_t v21 = v20;
    swift_bridgeObjectRetain();
    uint64_t v71 = v19;
    uint64_t v22 = sub_25E30A9D0();
    swift_bridgeObjectRelease();
    uint64_t v66 = a1;
    switch(v22)
    {
      case 0:
        LOBYTE(v72) = 1;
        uint64_t SRGB = sub_25E30A850();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        char v25 = 0;
        long long v26 = 0uLL;
        break;
      case 1:
        LOBYTE(v72) = 1;
        uint64_t SRGB = sub_25E30A860();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        long long v26 = 0uLL;
        char v25 = 1;
        break;
      case 2:
        LOBYTE(v72) = 1;
        sub_25E30A810();
        uint64_t v38 = v37;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        uint64_t SRGB = v38;
        long long v26 = 0uLL;
        char v25 = 2;
        break;
      case 3:
        LOBYTE(v72) = 1;
        char v39 = sub_25E30A800();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        uint64_t SRGB = v39 & 1;
        long long v26 = 0uLL;
        char v25 = 3;
        break;
      case 4:
        LOBYTE(v72) = 1;
        uint64_t SRGB = sub_25E30A7F0();
        unint64_t v41 = v40;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v16, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        long long v26 = v41;
        char v25 = 4;
        break;
      case 5:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3B30);
        LOBYTE(v75) = 1;
        sub_25E2F1024(&qword_26A6E3F28, &qword_26A6E3B30);
        sub_25E30A830();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        uint64_t SRGB = (uint64_t)v72;
        long long v26 = 0uLL;
        char v25 = 5;
        break;
      case 6:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3848);
        LOBYTE(v75) = 1;
        sub_25E2F1024(&qword_26A6E3870, &qword_26A6E3848);
        sub_25E30A830();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        uint64_t SRGB = (uint64_t)v72;
        *(void *)&long long v26 = v73;
        char v25 = 6;
        break;
      case 7:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BD8);
        LOBYTE(v75) = 1;
        sub_25E2F1024(&qword_26A6E3F10, &qword_26A6E3BD8);
        sub_25E30A830();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        uint64_t SRGB = (uint64_t)v72;
        *(void *)&long long v26 = v73;
        char v25 = 7;
        break;
      case 8:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3BD8);
        LOBYTE(v75) = 1;
        sub_25E2F1024(&qword_26A6E3F10, &qword_26A6E3BD8);
        sub_25E30A830();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        uint64_t SRGB = (uint64_t)v72;
        *(void *)&long long v26 = v73;
        char v25 = 8;
        break;
      case 9:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3EB8);
        LOBYTE(v75) = 1;
        sub_25E2F9BDC();
        sub_25E30A830();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        uint64_t SRGB = (uint64_t)v72;
        long long v26 = 0uLL;
        char v25 = 9;
        break;
      case 10:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3EA8);
        LOBYTE(v75) = 1;
        sub_25E2F9B44();
        sub_25E30A830();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        uint64_t SRGB = (uint64_t)v72;
        long long v26 = 0uLL;
        char v25 = 10;
        break;
      case 11:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3E90);
        LOBYTE(v75) = 1;
        sub_25E2F9AAC();
        sub_25E30A830();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        uint64_t SRGB = (uint64_t)v72;
        long long v26 = 0uLL;
        char v25 = 11;
        break;
      case 12:
        LOBYTE(v72) = 1;
        uint64_t SRGB = sub_25E30A7F0();
        unint64_t v43 = v42;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v16, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        long long v26 = v43;
        char v25 = 17;
        break;
      case 13:
        LOBYTE(v72) = 1;
        uint64_t SRGB = sub_25E30A7F0();
        unint64_t v45 = v44;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v16, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        long long v26 = v45;
        char v25 = 16;
        break;
      case 14:
        LOBYTE(v72) = 1;
        uint64_t SRGB = sub_25E30A7F0();
        unint64_t v47 = v46;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v16, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        long long v26 = v47;
        char v25 = 18;
        break;
      case 15:
        LOBYTE(v72) = 1;
        uint64_t SRGB = sub_25E30A7F0();
        unint64_t v49 = v48;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v16, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        long long v26 = v49;
        char v25 = 12;
        break;
      case 16:
        LOBYTE(v72) = 1;
        uint64_t SRGB = sub_25E30A7F0();
        unint64_t v51 = v50;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v16, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        long long v26 = v51;
        char v25 = 13;
        break;
      case 17:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3E80);
        LOBYTE(v75) = 1;
        sub_25E2F99EC(&qword_26A6E3EF8, &qword_26A6E3E80, (void (*)(void))sub_25E2F9A58);
        sub_25E30A830();
        swift_bridgeObjectRelease();
        uint64_t v52 = v70;
        if (*((void *)v72 + 2) < 4uLL)
        {
          (*(void (**)(char *, uint64_t))(v70 + 8))(v16, v11);
          swift_bridgeObjectRelease();
          goto LABEL_36;
        }
        CGFloat v53 = v72[4];
        CGFloat v54 = v72[5];
        CGFloat v55 = v72[6];
        CGFloat v56 = v72[7];
        swift_bridgeObjectRelease();
        uint64_t SRGB = (uint64_t)CGColorCreateSRGB(v53, v54, v55, v56);
        (*(void (**)(char *, uint64_t))(v52 + 8))(v16, v11);
        uint64_t v24 = 0;
        long long v26 = 0uLL;
        char v25 = 14;
        break;
      case 18:
        LOBYTE(v75) = 1;
        sub_25E2DCDE0();
        sub_25E30A830();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        uint64_t SRGB = (uint64_t)v72;
        *(void *)&long long v26 = v73;
        char v25 = 15;
        break;
      case 19:
        LOBYTE(v72) = 1;
        uint64_t SRGB = sub_25E30A7F0();
        unint64_t v58 = v57;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v16, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        long long v26 = v58;
        char v25 = 21;
        break;
      case 20:
        LOBYTE(v75) = 1;
        sub_25E2F9998();
        sub_25E30A830();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t SRGB = (uint64_t)v72;
        long long v26 = v73;
        char v25 = 22;
        uint64_t v24 = v74;
        break;
      case 21:
        LOBYTE(v75) = 1;
        sub_25E2F9998();
        sub_25E30A830();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t SRGB = (uint64_t)v72;
        long long v26 = v73;
        char v25 = 23;
        uint64_t v24 = v74;
        break;
      case 22:
        LOBYTE(v75) = 1;
        sub_25E2F9998();
        sub_25E30A830();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t SRGB = (uint64_t)v72;
        long long v26 = v73;
        char v25 = 24;
        uint64_t v24 = v74;
        break;
      case 23:
        LOBYTE(v72) = 1;
        uint64_t SRGB = sub_25E30A860();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        long long v26 = 0uLL;
        char v25 = 19;
        break;
      case 24:
        LOBYTE(v72) = 1;
        uint64_t SRGB = sub_25E30A860();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        long long v26 = 0uLL;
        char v25 = 20;
        break;
      case 25:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3E58);
        LOBYTE(v75) = 1;
        sub_25E2F99EC(&qword_26A6E3EF0, &qword_26A6E3E58, (void (*)(void))sub_25E2F9944);
        sub_25E30A830();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        uint64_t SRGB = (uint64_t)v72;
        long long v26 = 0uLL;
        char v25 = 25;
        break;
      case 26:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3E38);
        LOBYTE(v75) = 1;
        sub_25E2F9868(&qword_26A6E3ED8, (void (*)(void))sub_25E2F98F0, (void (*)(void))sub_25E2F9944);
        sub_25E30A830();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v14, v11);
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        uint64_t SRGB = (uint64_t)v72;
        long long v26 = 0uLL;
        char v25 = 26;
        break;
      case 27:
        swift_bridgeObjectRelease();
        LOBYTE(v72) = 1;
        uint64_t SRGB = sub_25E30A7F0();
        unint64_t v61 = v60;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v16, v11);
        uint64_t v24 = 0;
        long long v26 = v61;
        goto LABEL_37;
      default:
        uint64_t v27 = sub_25E2E8928();
        uint64_t v28 = v68;
        (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v10, v27, v3);
        swift_bridgeObjectRetain();
        char v29 = sub_25E30A090();
        os_log_type_t v30 = sub_25E30A560();
        uint64_t v67 = v29;
        LODWORD(v65) = v30;
        if (os_log_type_enabled(v29, v30))
        {
          uint64_t v31 = swift_slowAlloc();
          uint64_t v64 = v10;
          unint64_t v32 = (uint8_t *)v31;
          unint64_t v33 = (double *)swift_slowAlloc();
          BOOL v72 = v33;
          uint64_t v63 = v16;
          *(_DWORD *)unint64_t v32 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v75 = sub_25E2F8E64(v71, v21, (uint64_t *)&v72);
          sub_25E30A5B0();
          swift_bridgeObjectRelease_n();
          uint64_t v34 = v67;
          _os_log_impl(&dword_25E2DA000, v67, (os_log_type_t)v65, "Failed to identify discriminate of: %s when decoding InspectorPropertyValue", v32, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2611D27B0](v33, -1, -1);
          MEMORY[0x2611D27B0](v32, -1, -1);

          (*(void (**)(char *, uint64_t))(v68 + 8))(v64, v3);
          uint64_t v35 = *(void (**)(char *, uint64_t))(v70 + 8);
          os_log_type_t v36 = v63;
        }
        else
        {
          swift_bridgeObjectRelease_n();

          (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v3);
          uint64_t v35 = *(void (**)(char *, uint64_t))(v70 + 8);
          os_log_type_t v36 = v16;
        }
        v35(v36, v11);
LABEL_36:
        uint64_t SRGB = 0;
        uint64_t v24 = 0;
        long long v26 = 0uLL;
LABEL_37:
        char v25 = 27;
        break;
    }
    uint64_t v59 = v69;
    *uint64_t v69 = SRGB;
    *(_OWORD *)(v59 + 1) = v26;
    v59[3] = v24;
    *((unsigned char *)v59 + 32) = v25;
    uint64_t v17 = (uint64_t)v66;
  }
  return __swift_destroy_boxed_opaque_existential_1(v17);
}

uint64_t sub_25E2F8E34@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return InspectorPropertyValue.init(from:)(a1, a2);
}

void sub_25E2F8E4C(void *a1)
{
}

uint64_t sub_25E2F8E64(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25E2F8F38(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25E2ECBB0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_25E2ECBB0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25E2F8F38(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25E30A5C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25E2F90F4(a5, a6);
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
  uint64_t v8 = sub_25E30A6E0();
  if (!v8)
  {
    sub_25E30A720();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25E30A770();
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

uint64_t sub_25E2F90F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25E2F918C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25E2F9304(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25E2F9304(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25E2F918C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25E2F32B8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25E30A680();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25E30A720();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25E30A320();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25E30A770();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25E30A720();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_25E2F9304(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3E00);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_25E30A770();
  __break(1u);
  return result;
}

unint64_t sub_25E2F9454()
{
  unint64_t result = qword_26A6E3E28;
  if (!qword_26A6E3E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3E28);
  }
  return result;
}

unint64_t sub_25E2F94A8()
{
  unint64_t result = qword_26A6E3E30;
  if (!qword_26A6E3E30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3C88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3E30);
  }
  return result;
}

unint64_t sub_25E2F9514()
{
  unint64_t result = qword_26A6E3E48;
  if (!qword_26A6E3E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3E48);
  }
  return result;
}

unint64_t sub_25E2F9568()
{
  unint64_t result = qword_26A6E3E50;
  if (!qword_26A6E3E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3E50);
  }
  return result;
}

unint64_t sub_25E2F95BC()
{
  unint64_t result = qword_26A6E7D58;
  if (!qword_26A6E7D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E7D58);
  }
  return result;
}

uint64_t sub_25E2F9610()
{
  return sub_25E2F99EC(&qword_26A6E3E78, &qword_26A6E3E80, (void (*)(void))sub_25E2F964C);
}

unint64_t sub_25E2F964C()
{
  unint64_t result = qword_26A6E3E88;
  if (!qword_26A6E3E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3E88);
  }
  return result;
}

unint64_t sub_25E2F96A0()
{
  unint64_t result = qword_26A6E3E98;
  if (!qword_26A6E3E98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3E90);
    sub_25E2F1024(&qword_26A6E3EA0, &qword_26A6E3BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3E98);
  }
  return result;
}

unint64_t sub_25E2F9738()
{
  unint64_t result = qword_26A6E3EB0;
  if (!qword_26A6E3EB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3EA8);
    sub_25E2F1024(&qword_26A6E3850, &qword_26A6E3848);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3EB0);
  }
  return result;
}

unint64_t sub_25E2F97D0()
{
  unint64_t result = qword_26A6E3EC0;
  if (!qword_26A6E3EC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3EB8);
    sub_25E2F1024(&qword_26A6E3EC8, &qword_26A6E3B30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3EC0);
  }
  return result;
}

uint64_t sub_25E2F9868(unint64_t *a1, void (*a2)(void), void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3E38);
    a2();
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25E2F98F0()
{
  unint64_t result = qword_26A6E3EE0;
  if (!qword_26A6E3EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3EE0);
  }
  return result;
}

unint64_t sub_25E2F9944()
{
  unint64_t result = qword_26A6E3EE8;
  if (!qword_26A6E3EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3EE8);
  }
  return result;
}

unint64_t sub_25E2F9998()
{
  unint64_t result = qword_26A6E7D60[0];
  if (!qword_26A6E7D60[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E7D60);
  }
  return result;
}

uint64_t sub_25E2F99EC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25E2F9A58()
{
  unint64_t result = qword_26A6E3F00;
  if (!qword_26A6E3F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3F00);
  }
  return result;
}

unint64_t sub_25E2F9AAC()
{
  unint64_t result = qword_26A6E3F08;
  if (!qword_26A6E3F08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3E90);
    sub_25E2F1024(&qword_26A6E3F10, &qword_26A6E3BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3F08);
  }
  return result;
}

unint64_t sub_25E2F9B44()
{
  unint64_t result = qword_26A6E3F18;
  if (!qword_26A6E3F18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3EA8);
    sub_25E2F1024(&qword_26A6E3870, &qword_26A6E3848);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3F18);
  }
  return result;
}

unint64_t sub_25E2F9BDC()
{
  unint64_t result = qword_26A6E3F20;
  if (!qword_26A6E3F20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3EB8);
    sub_25E2F1024(&qword_26A6E3F28, &qword_26A6E3B30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3F20);
  }
  return result;
}

uint64_t _s15NestedValueTypeVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s15NestedValueTypeVwcp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s15NestedValueTypeVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s15NestedValueTypeVwta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *_s15NestedValueTypeVMa()
{
  return &_s15NestedValueTypeVN;
}

ValueMetadata *_s10CodingKeysOMa()
{
  return &_s10CodingKeysON;
}

unint64_t sub_25E2F9E08()
{
  unint64_t result = qword_26A6E7FF0[0];
  if (!qword_26A6E7FF0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E7FF0);
  }
  return result;
}

unint64_t sub_25E2F9E60()
{
  unint64_t result = qword_26A6E8200;
  if (!qword_26A6E8200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E8200);
  }
  return result;
}

unint64_t sub_25E2F9EB8()
{
  unint64_t result = qword_26A6E8208[0];
  if (!qword_26A6E8208[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E8208);
  }
  return result;
}

unint64_t sub_25E2F9F0C()
{
  unint64_t result = qword_26A6E8290[0];
  if (!qword_26A6E8290[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E8290);
  }
  return result;
}

unsigned char *_s10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E2FA02CLL);
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

ValueMetadata *_s15NestedValueTypeV10CodingKeysOMa()
{
  return &_s15NestedValueTypeV10CodingKeysON;
}

unint64_t sub_25E2FA068()
{
  unint64_t result = qword_26A6E83A0[0];
  if (!qword_26A6E83A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E83A0);
  }
  return result;
}

unint64_t sub_25E2FA0C0()
{
  unint64_t result = qword_26A6E84B0;
  if (!qword_26A6E84B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E84B0);
  }
  return result;
}

unint64_t sub_25E2FA118()
{
  unint64_t result = qword_26A6E84B8[0];
  if (!qword_26A6E84B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E84B8);
  }
  return result;
}

uint64_t sub_25E2FA16C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v3 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t InspectorHierarchyRepresentation.rootEntityID.getter@<X0>(void *a1@<X8>)
{
  return EntityID.init(id:)(1, a1);
}

uint64_t sub_25E2FA250@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for InspectorEntityRepresentation();
  sub_25E2FA2BC();
  sub_25E2FA310();

  return InspectorCollection.init()(a1);
}

unint64_t sub_25E2FA2BC()
{
  unint64_t result = qword_26A6E3F50;
  if (!qword_26A6E3F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3F50);
  }
  return result;
}

unint64_t sub_25E2FA310()
{
  unint64_t result = qword_26A6E3F58;
  if (!qword_26A6E3F58)
  {
    type metadata accessor for InspectorEntityRepresentation();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3F58);
  }
  return result;
}

uint64_t InspectorHierarchyRepresentation.entities.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

__n128 InspectorHierarchyRepresentation.entities.setter(__n128 *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __n128 result = *a1;
  *uint64_t v1 = *a1;
  return result;
}

uint64_t (*InspectorHierarchyRepresentation.entities.modify())()
{
  return nullsub_1;
}

uint64_t InspectorHierarchyRepresentation.init()@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for InspectorEntityRepresentation();
  sub_25E2FA2BC();
  sub_25E2FA310();

  return InspectorCollection.init()(a1);
}

uint64_t sub_25E2FA470()
{
  return 0x7365697469746E65;
}

uint64_t sub_25E2FA488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x7365697469746E65 && a2 == 0xE800000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25E30A9A0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_25E2FA520(uint64_t a1)
{
  unint64_t v2 = sub_25E2FA708();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2FA55C(uint64_t a1)
{
  unint64_t v2 = sub_25E2FA708();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InspectorHierarchyRepresentation.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F60);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  int64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2FA708();
  sub_25E30AAC0();
  long long v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F68);
  sub_25E2FA96C(&qword_26A6E3F70);
  sub_25E30A920();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

unint64_t sub_25E2FA708()
{
  unint64_t result = qword_26A6E8540[0];
  if (!qword_26A6E8540[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E8540);
  }
  return result;
}

uint64_t InspectorHierarchyRepresentation.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F78);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  int64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for InspectorEntityRepresentation();
  sub_25E2FA2BC();
  sub_25E2FA310();
  InspectorCollection.init()(&v14);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2FA708();
  sub_25E30AAB0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F68);
    sub_25E2FA96C(&qword_26A6E3F80);
    sub_25E30A830();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    uint64_t v11 = v13[0];
    uint64_t v12 = v13[1];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *a2 = v11;
    a2[1] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E2FA96C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3F68);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25E2FA9B4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return InspectorHierarchyRepresentation.init(from:)(a1, a2);
}

uint64_t sub_25E2FA9CC(void *a1)
{
  return InspectorHierarchyRepresentation.encode(to:)(a1);
}

uint64_t destroy for InspectorHierarchyRepresentation()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s26SpatialInspectorFoundation32InspectorHierarchyRepresentationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for InspectorHierarchyRepresentation(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for InspectorHierarchyRepresentation(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorHierarchyRepresentation(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InspectorHierarchyRepresentation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorHierarchyRepresentation()
{
  return &type metadata for InspectorHierarchyRepresentation;
}

unsigned char *storeEnumTagSinglePayload for InspectorHierarchyRepresentation.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E2FAC2CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorHierarchyRepresentation.CodingKeys()
{
  return &type metadata for InspectorHierarchyRepresentation.CodingKeys;
}

unint64_t sub_25E2FAC68()
{
  unint64_t result = qword_26A6E8750[0];
  if (!qword_26A6E8750[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E8750);
  }
  return result;
}

unint64_t sub_25E2FACC0()
{
  unint64_t result = qword_26A6E8860;
  if (!qword_26A6E8860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E8860);
  }
  return result;
}

unint64_t sub_25E2FAD18()
{
  unint64_t result = qword_26A6E8868[0];
  if (!qword_26A6E8868[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E8868);
  }
  return result;
}

uint64_t sub_25E2FAD6C(uint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain();
  sub_25E2FBCAC(1);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_25E30A590();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25E2FBD48(1uLL, a1, a2);
  swift_bridgeObjectRelease();
  sub_25E2F3AB8();
  swift_bridgeObjectRetain();
  sub_25E30A2E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_25E2FAE7C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_25E30AB00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = 0;
  unint64_t v22 = 0xE000000000000000;
  uint64_t v9 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v9 = a1 & 0xFFFFFFFFFFFFLL;
  }
  v20[0] = a1;
  v20[1] = a2;
  __n128 v20[2] = 0;
  v20[3] = v9;
  swift_bridgeObjectRetain();
  unint64_t result = sub_25E30A310();
  if (!v11)
  {
    uint64_t v19 = 0;
LABEL_24:
    swift_bridgeObjectRelease();
    return v19;
  }
  unint64_t v12 = result;
  unint64_t v13 = v11;
  uint64_t v14 = 0;
  uint64_t v15 = (void (**)(char *, uint64_t))(v5 + 8);
  while (!__OFADD__(v14, 1))
  {
    if (sub_25E30A1D0())
    {
      unint64_t result = sub_25E2FB998(v12, v13);
      if ((result & 0x100000000) != 0) {
        goto LABEL_26;
      }
      sub_25E30AB10();
      char v17 = sub_25E30AAE0();
      (*v15)(v8, v4);
      if (v17) {
        goto LABEL_17;
      }
    }
    if (sub_25E30A1C0())
    {
      if (sub_25E30A1D0())
      {
        unint64_t result = sub_25E2FB998(v12, v13);
        if ((result & 0x100000000) != 0) {
          goto LABEL_27;
        }
        sub_25E30AB10();
        char v18 = sub_25E30AAF0();
        (*v15)(v8, v4);
        if (v18) {
          goto LABEL_17;
        }
      }
      if ((sub_25E30A1C0() & 1) == 0 || (sub_25E30A1B0() & 1) == 0)
      {
LABEL_17:
        if (v14 != sub_25E30A2B0())
        {
          if (!v14) {
            goto LABEL_5;
          }
          sub_25E30A300();
        }
      }
    }
    if (v14)
    {
      MEMORY[0x2611D1A50](v12, v13);
      goto LABEL_6;
    }
LABEL_5:
    sub_25E30A1A0();
    swift_bridgeObjectRelease();
    sub_25E30A300();
LABEL_6:
    swift_bridgeObjectRelease();
    unint64_t result = sub_25E30A310();
    unint64_t v12 = result;
    unint64_t v13 = v16;
    ++v14;
    if (!v16)
    {
      uint64_t v19 = v21;
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_25E2FB118(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_25E30AB00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_25E30A2B0() < 1)
  {
    swift_bridgeObjectRetain();
    return a1;
  }
  uint64_t v31 = 0;
  unint64_t v32 = 0xE000000000000000;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v9 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v9 = a1 & 0xFFFFFFFFFFFFLL;
  }
  v30[1] = sub_25E30A2C0();
  v30[4] = a1;
  v30[5] = a2;
  void v30[6] = 0;
  v30[7] = v9;
  swift_bridgeObjectRetain();
  unint64_t result = sub_25E30A310();
  if (!v11)
  {
    a1 = 0;
LABEL_53:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return a1;
  }
  v30[2] = a2;
  v30[3] = a1;
  uint64_t v12 = 0;
  unint64_t v13 = (void (**)(char *, uint64_t))(v5 + 8);
  unint64_t v14 = 0xE100000000000000;
  unint64_t v15 = 32;
  while (!__OFADD__(v12, 1))
  {
    unint64_t v16 = result;
    unint64_t v17 = v11;
    if ((sub_25E30A1D0() & 1) == 0) {
      goto LABEL_19;
    }
    unint64_t result = sub_25E2FB998(v16, v17);
    if ((result & 0x100000000) != 0) {
      goto LABEL_56;
    }
    sub_25E30AB10();
    char v18 = sub_25E30AAE0();
    (*v13)(v8, v4);
    if ((v18 & 1) == 0)
    {
LABEL_19:
      if ((sub_25E30A1C0() & 1) == 0) {
        goto LABEL_20;
      }
      if ((sub_25E30A1D0() & 1) == 0) {
        goto LABEL_64;
      }
      unint64_t result = sub_25E2FB998(v16, v17);
      if ((result & 0x100000000) != 0) {
        goto LABEL_58;
      }
      sub_25E30AB10();
      char v19 = sub_25E30AAF0();
      (*v13)(v8, v4);
      if ((v19 & 1) == 0)
      {
LABEL_64:
        if (sub_25E30A1C0() & 1) != 0 && (sub_25E30A1B0())
        {
LABEL_20:
          swift_bridgeObjectRelease();
          goto LABEL_34;
        }
      }
    }
    if (!v12)
    {
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    if (sub_25E30A1D0())
    {
      unint64_t result = sub_25E2FB998(v15, v14);
      if ((result & 0x100000000) != 0) {
        goto LABEL_57;
      }
      sub_25E30AB10();
      char v20 = sub_25E30AAD0();
      (*v13)(v8, v4);
      if (v20)
      {
LABEL_32:
        swift_bridgeObjectRelease();
LABEL_33:
        sub_25E30A300();
        goto LABEL_34;
      }
    }
    if (sub_25E30A1B0())
    {
      if (sub_25E30A1D0())
      {
        unint64_t result = sub_25E2FB998(v15, v14);
        if ((result & 0x100000000) != 0) {
          goto LABEL_59;
        }
        sub_25E30AB10();
        char v21 = sub_25E30AAF0();
        (*v13)(v8, v4);
        if (v21) {
          goto LABEL_32;
        }
      }
      if ((sub_25E30A1C0() & 1) == 0) {
        goto LABEL_32;
      }
      char v22 = sub_25E30A1B0();
      swift_bridgeObjectRelease();
      if ((v22 & 1) == 0) {
        goto LABEL_33;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_25E30A2D0();
    if ((v23 & 1) == 0)
    {
      unint64_t v24 = sub_25E30A380();
      unint64_t v26 = v25;
      if (sub_25E30A1D0())
      {
        unint64_t result = sub_25E2FB998(v24, v26);
        if ((result & 0x100000000) != 0) {
          goto LABEL_60;
        }
        sub_25E30AB10();
        char v27 = sub_25E30AAD0();
        (*v13)(v8, v4);
        if (v27) {
          goto LABEL_32;
        }
      }
      if ((sub_25E30A1B0() & 1) == 0) {
        goto LABEL_20;
      }
      if (sub_25E30A1D0())
      {
        unint64_t result = sub_25E2FB998(v24, v26);
        if ((result & 0x100000000) != 0) {
          goto LABEL_61;
        }
        sub_25E30AB10();
        char v28 = sub_25E30AAF0();
        (*v13)(v8, v4);
        if (v28) {
          goto LABEL_32;
        }
      }
      if ((sub_25E30A1C0() & 1) == 0) {
        goto LABEL_32;
      }
      char v29 = sub_25E30A1B0();
      swift_bridgeObjectRelease();
      if ((v29 & 1) == 0) {
        goto LABEL_33;
      }
    }
LABEL_34:
    if (v12)
    {
      MEMORY[0x2611D1A50](v16, v17);
      goto LABEL_9;
    }
LABEL_8:
    sub_25E30A1A0();
    sub_25E30A300();
    swift_bridgeObjectRelease();
LABEL_9:
    unint64_t result = sub_25E30A310();
    ++v12;
    unint64_t v14 = v17;
    unint64_t v15 = v16;
    if (!v11)
    {
      a1 = v31;
      goto LABEL_53;
    }
  }
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
  return result;
}

uint64_t sub_25E2FB618(float a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  objc_msgSend(v2, sel_setNumberStyle_, 1);
  objc_msgSend(v2, sel_setMaximumFractionDigits_, 3);
  int v3 = (void *)sub_25E30A230();
  objc_msgSend(v2, sel_setDecimalSeparator_, v3);

  uint64_t v4 = (void *)sub_25E30A230();
  objc_msgSend(v2, sel_setGroupingSeparator_, v4);

  id v5 = objc_allocWithZone(NSNumber);
  *(float *)&double v6 = a1;
  id v7 = objc_msgSend(v5, sel_initWithFloat_, v6);
  id v8 = objc_msgSend(v2, sel_stringFromNumber_, v7);

  if (v8)
  {
    uint64_t v9 = sub_25E30A240();
  }
  else
  {
    sub_25E30A4C0();

    return 0;
  }
  return v9;
}

uint64_t sub_25E2FB778(double a1)
{
  float v1 = a1;
  return sub_25E2FB618(v1);
}

uint64_t sub_25E2FB780()
{
  if (CGColorGetNumberOfComponents(v0) != 4) {
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25E30C420;
  uint64_t result = sub_25E30A520();
  float v3 = 0.0;
  float v4 = 0.0;
  if (result)
  {
    if (!*(void *)(result + 16))
    {
      __break(1u);
      goto LABEL_17;
    }
    double v5 = *(double *)(result + 32);
    swift_bridgeObjectRelease();
    float v4 = v5;
  }
  *(float *)(inited + 32) = v4;
  uint64_t result = sub_25E30A520();
  if (!result) {
    goto LABEL_9;
  }
  if (*(void *)(result + 16) < 2uLL)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  double v6 = *(double *)(result + 40);
  swift_bridgeObjectRelease();
  float v3 = v6;
LABEL_9:
  *(float *)(inited + 36) = v3;
  uint64_t result = sub_25E30A520();
  float v7 = 0.0;
  float v8 = 0.0;
  if (result)
  {
    if (*(void *)(result + 16) >= 3uLL)
    {
      double v9 = *(double *)(result + 48);
      swift_bridgeObjectRelease();
      float v8 = v9;
      goto LABEL_12;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
LABEL_12:
  *(float *)(inited + 40) = v8;
  uint64_t result = sub_25E30A520();
  if (!result)
  {
LABEL_15:
    *(float *)(inited + 44) = v7;
    sub_25E2EF5BC(inited);
    uint64_t v12 = v11;
    swift_setDeallocating();
    return v12;
  }
  if (*(void *)(result + 16) >= 4uLL)
  {
    double v10 = *(double *)(result + 56);
    swift_bridgeObjectRelease();
    float v7 = v10;
    goto LABEL_15;
  }
LABEL_19:
  __break(1u);
  return result;
}

__n128 sub_25E2FB8CC()
{
  sub_25E30A540();
  long long v8 = v1;
  long long v9 = v0;
  int v2 = sub_25E30A570();
  *(_OWORD *)v15.vector.f64 = v8;
  v14[0] = v9;
  v14[1] = v8;
  SPRotation3DGetEulerAngles(v15, (uint64_t)v14, v2, (uint64_t)&v12);
  float64x2_t v10 = v12;
  double v3 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25E30C430;
  *(float32x2_t *)(inited + 32) = vmul_f32(vcvt_f32_f64(v10), (float32x2_t)vdup_n_s32(0x42652EE2u));
  float v5 = v3;
  *(float *)(inited + 40) = v5 * 57.296;
  sub_25E2EF54C(inited);
  long long v11 = v6;
  swift_setDeallocating();
  return (__n128)v11;
}

unint64_t sub_25E2FB998(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    sub_25E2FBA78(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      unsigned int v5 = sub_25E30A660();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0) {
        sub_25E30A6E0();
      }
      unsigned int v5 = sub_25E30A6F0();
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t sub_25E2FBA78(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    uint64_t result = sub_25E2FBB18(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_25E2FBB88(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_25E2FBB18(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    uint64_t result = sub_25E2F3534(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t sub_25E2FBB88(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      void v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((unsigned char *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v7 = v5 - 1;
            int v11 = *((unsigned char *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          return v7 << 16;
        }
        goto LABEL_14;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 == (a2 & 0xFFFFFFFFFFFFLL)) {
          goto LABEL_14;
        }
      }
      else
      {
        unint64_t v12 = result >> 16;
        uint64_t v6 = sub_25E30A6E0();
        unint64_t v5 = v12;
        if (v12 == v10) {
          goto LABEL_14;
        }
      }
      if ((*(unsigned char *)(v6 + v5) & 0xC0) == 0x80)
      {
        do
        {
          unint64_t v7 = v5 - 1;
          int v8 = *(unsigned char *)(v6 - 1 + v5--) & 0xC0;
        }
        while (v8 == 128);
        return v7 << 16;
      }
LABEL_14:
      unint64_t v7 = v5;
      return v7 << 16;
    }
    uint64_t v9 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v9 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (v5 != v9)
    {
      return MEMORY[0x270F9E998]();
    }
  }
  return result;
}

uint64_t sub_25E2FBCAC(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_25E30A2D0();
    return sub_25E30A3A0();
  }
  return result;
}

unint64_t sub_25E2FBD48(unint64_t result, uint64_t a2, unint64_t a3)
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
  uint64_t result = sub_25E30A2D0();
  if (v6) {
    uint64_t result = v5;
  }
  if (4 * v3 < result >> 14) {
    goto LABEL_14;
  }

  return sub_25E30A3A0();
}

void SPRotation3DGetEulerAngles(SPRotation3D a1@<0:Q0, 16:Q1>, uint64_t a2@<X0>, int a3@<W1>, uint64_t a4@<X8>)
{
  _Q2 = *(int8x16_t *)a2;
  _Q1 = *(_OWORD *)(a2 + 16);
  if (a3 == 2)
  {
    float64x2_t v8 = (float64x2_t)vextq_s8(_Q2, _Q2, 8uLL);
    _Q2.i64[0] = *(void *)(a2 + 16);
  }
  else if (a3 == 1)
  {
    v8.f64[0] = *(float64_t *)(a2 + 16);
    v8.f64[1] = *(float64_t *)(a2 + 8);
  }
  else
  {
    float64x2_t v8 = 0uLL;
    _Q2.i64[0] = 0;
  }
  long long v26 = *(_OWORD *)(a2 + 16);
  _D8 = v8.f64[1];
  double v10 = vmuld_lane_f64(v8.f64[1], v8, 1);
  float64_t v27 = v8.f64[0];
  __asm { FMLA            D0, D2, V1.D[1] }
  *(double *)&_Q0 = atan2(_D0 + _D0, (v10 + *(double *)_Q2.i64 * *(double *)_Q2.i64) * -2.0 + 1.0);
  long long v25 = _Q0;
  _V1.D[1] = *((void *)&v26 + 1);
  __asm { FMLA            D0, D8, V1.D[1] }
  double v18 = *(double *)&_Q0 + *(double *)&_Q0;
  if (v18 > 1.0) {
    double v18 = 1.0;
  }
  if (v18 < -1.0) {
    double v18 = -1.0;
  }
  long double v24 = asin(v18);
  _V2.D[1] = *((void *)&v26 + 1);
  _D1 = v27;
  __asm { FMLA            D0, D1, V2.D[1] }
  *(float *)&_D0 = _D0 + _D0;
  *(float *)&_D1 = vmlad_n_f64(v10, _D1, _D1) * -2.0 + 1.0;
  *(double *)&long long v22 = atan2f(*(float *)&_D0, *(float *)&_D1);
  if (a3 == 2)
  {
    *(long double *)v23.i64 = v24;
    v23.i64[1] = v22;
    long long v22 = v25;
  }
  else if (a3 == 1)
  {
    v23.i64[0] = v25;
    *(long double *)&v23.i64[1] = v24;
  }
  else
  {
    int64x2_t v23 = vdupq_n_s64(0x7FF8000000000000uLL);
    *(void *)&long long v22 = 0x7FF8000000000000;
  }
  *(int64x2_t *)a4 = v23;
  *(_OWORD *)(a4 + 16) = v22;
  *(_DWORD *)(a4 + 32) = a3;
}

uint64_t InspectorPropertyID.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InspectorPropertyID.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*InspectorPropertyID.id.modify())()
{
  return nullsub_1;
}

SpatialInspectorFoundation::InspectorPropertyID __swiftcall InspectorPropertyID.init(id:)(SpatialInspectorFoundation::InspectorPropertyID id)
{
  *uint64_t v1 = id;
  return id;
}

uint64_t static InspectorPropertyID.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_25E30A9A0();
  }
}

uint64_t InspectorPropertyID.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25E30A2A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E2FC054(uint64_t a1)
{
  unint64_t v2 = sub_25E2FC204();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2FC090(uint64_t a1)
{
  unint64_t v2 = sub_25E2FC204();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InspectorPropertyID.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F88);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  char v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2FC204();
  sub_25E30AAC0();
  sub_25E30A8E0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

unint64_t sub_25E2FC204()
{
  unint64_t result = qword_26A6E88F0;
  if (!qword_26A6E88F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E88F0);
  }
  return result;
}

uint64_t InspectorPropertyID.hashValue.getter()
{
  return sub_25E30AAA0();
}

uint64_t InspectorPropertyID.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F90);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2FC204();
  sub_25E30AAB0();
  if (!v2)
  {
    uint64_t v10 = sub_25E30A7F0();
    uint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    *a2 = v10;
    a2[1] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25E2FC414@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return InspectorPropertyID.init(from:)(a1, a2);
}

uint64_t sub_25E2FC42C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F88);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2FC204();
  sub_25E30AAC0();
  sub_25E30A8E0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_25E2FC564(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_25E30A9A0();
  }
}

uint64_t sub_25E2FC594()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2FC5E0()
{
  return sub_25E30A2A0();
}

uint64_t sub_25E2FC5E8()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2FC630@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t (*sub_25E2FC63C())()
{
  return nullsub_1;
}

uint64_t InspectorPropertyPointer.init(_:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25E30AB20();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t InspectorProperty.id.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E2FC6B0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 112))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_25E2FC6FC(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 120);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_25E2FC764()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25E2FC7B0(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25E2FC804())()
{
  return j_j__swift_endAccess;
}

double sub_25E2FC858@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  (*(void (**)(_OWORD *__return_ptr))(**(void **)a1 + 136))(v6);
  char v3 = v7;
  double result = *(double *)v6;
  long long v5 = v6[1];
  *(_OWORD *)a2 = v6[0];
  *(_OWORD *)(a2 + 16) = v5;
  *(unsigned char *)(a2 + 32) = v3;
  return result;
}

uint64_t sub_25E2FC8BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  char v3 = *(void **)(a1 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  uint64_t v5 = *a2;
  char v6 = *(unsigned char *)(a1 + 32);
  v9[0] = *(id *)a1;
  v9[1] = v2;
  v9[2] = v3;
  void v9[3] = v4;
  char v10 = v6;
  char v7 = *(uint64_t (**)(id *))(*(void *)v5 + 144);
  sub_25E2E9A90(v9[0], (unint64_t)v2, (uint64_t)v3, (uint64_t)v4, v6);
  return v7(v9);
}

id sub_25E2FC938@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  char v3 = *(void **)(v1 + 48);
  unint64_t v4 = *(void *)(v1 + 56);
  uint64_t v5 = *(void *)(v1 + 64);
  uint64_t v6 = *(void *)(v1 + 72);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v7 = *(unsigned char *)(v1 + 80);
  *(unsigned char *)(a1 + 32) = v7;
  return sub_25E2E9A90(v3, v4, v5, v6, v7);
}

__n128 sub_25E2FC990(uint64_t *a1)
{
  uint64_t v2 = *a1;
  long long v11 = *(_OWORD *)(a1 + 1);
  uint64_t v3 = a1[3];
  char v4 = *((unsigned char *)a1 + 32);
  swift_beginAccess();
  uint64_t v5 = *(void **)(v1 + 48);
  unint64_t v6 = *(void *)(v1 + 56);
  uint64_t v7 = *(void *)(v1 + 64);
  uint64_t v8 = *(void *)(v1 + 72);
  *(void *)(v1 + 48) = v2;
  *(_OWORD *)(v1 + 56) = v11;
  *(void *)(v1 + 72) = v3;
  char v9 = *(unsigned char *)(v1 + 80);
  *(unsigned char *)(v1 + 80) = v4;
  sub_25E2F0EAC(v5, v6, v7, v8, v9);
  return result;
}

uint64_t (*sub_25E2FCA08())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25E2FCA5C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 160))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_25E2FCAAC(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 168))(*a1);
}

uint64_t sub_25E2FCAF4()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 81);
}

uint64_t sub_25E2FCB28(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 81) = a1;
  return result;
}

uint64_t (*sub_25E2FCB68())()
{
  return j__swift_endAccess;
}

unint64_t sub_25E2FCBBC()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 112))();
  unint64_t v3 = sub_25E2FB118(v1, v2);
  swift_bridgeObjectRelease();
  return v3;
}

__n128 InspectorProperty.__allocating_init(id:name:value:isInternal:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = a1[1];
  char v12 = *(unsigned char *)(a4 + 32);
  *(void *)(v10 + 16) = *a1;
  *(void *)(v10 + 24) = v11;
  *(void *)(v10 + 32) = a2;
  *(void *)(v10 + 40) = a3;
  __n128 result = *(__n128 *)a4;
  long long v14 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)a4;
  *(_OWORD *)(v10 + 64) = v14;
  *(unsigned char *)(v10 + 80) = v12;
  *(unsigned char *)(v10 + 81) = a5;
  return result;
}

uint64_t InspectorProperty.init(id:name:value:isInternal:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = a1[1];
  char v7 = *(unsigned char *)(a4 + 32);
  *(void *)(v5 + 16) = *a1;
  *(void *)(v5 + 24) = v6;
  *(void *)(v5 + 32) = a2;
  *(void *)(v5 + 40) = a3;
  long long v8 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v5 + 48) = *(_OWORD *)a4;
  *(_OWORD *)(v5 + 64) = v8;
  *(unsigned char *)(v5 + 80) = v7;
  *(unsigned char *)(v5 + 81) = a5;
  return v5;
}

uint64_t sub_25E2FCCBC()
{
  uint64_t result = 25705;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1701667182;
      break;
    case 2:
      uint64_t result = 0x65756C6176;
      break;
    case 3:
      uint64_t result = 0x6E7265746E497369;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25E2FCD40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2FD8D8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E2FCD68(uint64_t a1)
{
  unint64_t v2 = sub_25E2FD12C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2FCDA4(uint64_t a1)
{
  unint64_t v2 = sub_25E2FD12C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InspectorProperty.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25E2F0EAC(*(void **)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(unsigned char *)(v0 + 80));
  return v0;
}

uint64_t InspectorProperty.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25E2F0EAC(*(void **)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(unsigned char *)(v0 + 80));

  return swift_deallocClassInstance();
}

uint64_t sub_25E2FCE68(void *a1)
{
  unint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F98);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  char v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2FD12C();
  sub_25E30AAC0();
  unint64_t v10 = v3[3];
  long double v24 = (void *)v3[2];
  unint64_t v25 = v10;
  LOBYTE(v19) = 0;
  sub_25E2FD180();
  uint64_t v11 = sub_25E30A920();
  if (!v2)
  {
    (*(void (**)(uint64_t))(*v3 + 112))(v11);
    LOBYTE(v24) = 1;
    sub_25E30A8E0();
    uint64_t v13 = swift_bridgeObjectRelease();
    (*(void (**)(void **__return_ptr, uint64_t))(*v3 + 136))(&v24, v13);
    long long v14 = v24;
    unint64_t v15 = v25;
    uint64_t v16 = v27;
    uint64_t v18 = v26;
    char v19 = v24;
    int v29 = v28;
    unint64_t v20 = v25;
    uint64_t v21 = v26;
    uint64_t v22 = v27;
    unsigned __int8 v23 = v28;
    char v30 = 2;
    sub_25E2F9568();
    sub_25E30A920();
    sub_25E2F0EAC(v14, v15, v18, v16, v29);
    (*(void (**)(void))(*v3 + 160))();
    LOBYTE(v24) = 3;
    sub_25E30A8F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_25E2FD12C()
{
  unint64_t result = qword_26A6E88F8;
  if (!qword_26A6E88F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E88F8);
  }
  return result;
}

unint64_t sub_25E2FD180()
{
  unint64_t result = qword_26A6E3FA0;
  if (!qword_26A6E3FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3FA0);
  }
  return result;
}

uint64_t InspectorProperty.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  InspectorProperty.init(from:)(a1);
  return v2;
}

uint64_t InspectorProperty.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3FA8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  char v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2FD12C();
  sub_25E30AAB0();
  if (v2)
  {
    type metadata accessor for InspectorProperty();
    swift_deallocPartialClassInstance();
  }
  else
  {
    char v18 = 0;
    sub_25E2FD51C();
    sub_25E30A830();
    uint64_t v10 = *((void *)&v16[0] + 1);
    *(void *)(v1 + 16) = *(void *)&v16[0];
    *(void *)(v1 + 24) = v10;
    LOBYTE(v16[0]) = 1;
    *(void *)(v1 + 32) = sub_25E30A7F0();
    *(void *)(v1 + 40) = v11;
    char v18 = 2;
    sub_25E2F9944();
    sub_25E30A830();
    char v12 = v17;
    long long v13 = v16[1];
    *(_OWORD *)(v1 + 48) = v16[0];
    *(_OWORD *)(v1 + 64) = v13;
    *(unsigned char *)(v1 + 80) = v12;
    LOBYTE(v16[0]) = 3;
    char v15 = sub_25E30A800();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    *(unsigned char *)(v3 + 81) = v15 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t type metadata accessor for InspectorProperty()
{
  return self;
}

unint64_t sub_25E2FD51C()
{
  unint64_t result = qword_26A6E3FB0;
  if (!qword_26A6E3FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3FB0);
  }
  return result;
}

uint64_t sub_25E2FD570@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 208))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25E2FD5AC()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 200))();
}

uint64_t sub_25E2FD5F0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  *a1 = *(void *)(*(void *)v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E2FD604(void **a1, void **a2)
{
  return _s26SpatialInspectorFoundation0B8PropertyC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

void InspectorProperty.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25E30A2A0();
  uint64_t v1 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)v0 + 112))(v1);
  sub_25E30A2A0();
  uint64_t v2 = swift_bridgeObjectRelease();
  (*(void (**)(void *__return_ptr, uint64_t))(*(void *)v0 + 136))(v8, v2);
  uint64_t v3 = (void *)v8[0];
  unint64_t v4 = v8[1];
  uint64_t v5 = v8[2];
  uint64_t v6 = v8[3];
  char v7 = v9;
  sub_25E2F116C();
  sub_25E30A190();
  sub_25E2F0EAC(v3, v4, v5, v6, v7);
}

uint64_t InspectorProperty.hashValue.getter()
{
  sub_25E30AA50();
  swift_bridgeObjectRetain();
  sub_25E30A2A0();
  uint64_t v1 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)v0 + 112))(v1);
  sub_25E30A2A0();
  uint64_t v2 = swift_bridgeObjectRelease();
  (*(void (**)(void *__return_ptr, uint64_t))(*(void *)v0 + 136))(v9, v2);
  uint64_t v3 = (void *)v9[0];
  unint64_t v4 = v9[1];
  uint64_t v5 = v9[2];
  uint64_t v6 = v9[3];
  char v7 = v10;
  sub_25E2F116C();
  sub_25E30A190();
  sub_25E2F0EAC(v3, v4, v5, v6, v7);
  return sub_25E30AAA0();
}

uint64_t sub_25E2FD850()
{
  return InspectorProperty.hashValue.getter();
}

void sub_25E2FD874()
{
}

uint64_t sub_25E2FD898()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E2FD8D8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E7265746E497369 && a2 == 0xEE00657079546C61)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t _s26SpatialInspectorFoundation0B8PropertyC2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  BOOL v4 = a1[2] == a2[2] && a1[3] == a2[3];
  if (v4 || (char v5 = 0, (sub_25E30A9A0() & 1) != 0))
  {
    uint64_t v6 = (*(uint64_t (**)(void))(*a1 + 112))();
    uint64_t v8 = v7;
    if (v6 == (*(uint64_t (**)(void))(*a2 + 112))() && v8 == v9)
    {
      uint64_t v12 = swift_bridgeObjectRelease_n();
    }
    else
    {
      char v11 = sub_25E30A9A0();
      swift_bridgeObjectRelease();
      uint64_t v12 = swift_bridgeObjectRelease();
      char v5 = 0;
      if ((v11 & 1) == 0) {
        return v5 & 1;
      }
    }
    long long v13 = (*(void *(**)(void **__return_ptr, uint64_t))(*a1 + 136))(&v34, v12);
    unint64_t v14 = v35;
    long double v24 = v34;
    uint64_t v15 = v36;
    uint64_t v16 = v37;
    char v17 = v38;
    v32[0] = v34;
    v32[1] = v35;
    v32[2] = v36;
    v32[3] = v37;
    char v33 = v38;
    (*(void (**)(void **__return_ptr, void *))(*a2 + 136))(&v27, v13);
    char v18 = v27;
    unint64_t v19 = v28;
    uint64_t v20 = v29;
    uint64_t v21 = v30;
    char v22 = v31;
    v25[0] = v27;
    v25[1] = v28;
    v25[2] = v29;
    v25[3] = v30;
    char v26 = v31;
    char v5 = static InspectorPropertyValue.== infix(_:_:)(v32, v25);
    sub_25E2F0EAC(v18, v19, v20, v21, v22);
    sub_25E2F0EAC(v24, v14, v15, v16, v17);
  }
  return v5 & 1;
}

unint64_t sub_25E2FDC78(void *a1)
{
  a1[1] = sub_25E2FD51C();
  a1[2] = sub_25E2FD180();
  a1[3] = sub_25E2FDCB8();
  unint64_t result = sub_25E2FDD0C();
  a1[4] = result;
  return result;
}

unint64_t sub_25E2FDCB8()
{
  unint64_t result = qword_26A6E3FB8;
  if (!qword_26A6E3FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3FB8);
  }
  return result;
}

unint64_t sub_25E2FDD0C()
{
  unint64_t result = qword_26A6E3FC0;
  if (!qword_26A6E3FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3FC0);
  }
  return result;
}

unint64_t sub_25E2FDD64()
{
  unint64_t result = qword_26A6E3FC8;
  if (!qword_26A6E3FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E3FC8);
  }
  return result;
}

uint64_t sub_25E2FDDB8()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_25E2FDDC8(void *a1)
{
  a1[1] = sub_25E2FDEB0(&qword_26A6E3FD0);
  a1[2] = sub_25E2FDEB0(&qword_26A6E3FD8);
  a1[3] = sub_25E2FDEB0(&qword_26A6E3FE0);
  uint64_t result = sub_25E2FDEB0(&qword_26A6E3FE8);
  a1[4] = result;
  return result;
}

uint64_t sub_25E2FDE7C()
{
  return sub_25E2FDEB0(&qword_26A6E3FF0);
}

uint64_t sub_25E2FDEB0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for InspectorProperty();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for InspectorPropertyID(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithTake for InspectorPropertyID(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for InspectorPropertyID()
{
  return &type metadata for InspectorPropertyID;
}

void *assignWithCopy for ComponentID(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentID(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ComponentID(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for InspectorPropertyPointer()
{
  return &type metadata for InspectorPropertyPointer;
}

uint64_t method lookup function for InspectorProperty(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InspectorProperty);
}

uint64_t dispatch thunk of InspectorProperty.name.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of InspectorProperty.name.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of InspectorProperty.name.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of InspectorProperty.value.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of InspectorProperty.value.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of InspectorProperty.value.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of InspectorProperty.isInternalType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of InspectorProperty.isInternalType.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of InspectorProperty.isInternalType.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of InspectorProperty.humanReadableName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of InspectorProperty.__allocating_init(id:name:value:isInternal:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of InspectorProperty.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of InspectorProperty.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

unsigned char *storeEnumTagSinglePayload for InspectorProperty.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x25E2FE308);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorProperty.CodingKeys()
{
  return &type metadata for InspectorProperty.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for InspectorPropertyID.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E2FE3DCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorPropertyID.CodingKeys()
{
  return &type metadata for InspectorPropertyID.CodingKeys;
}

unint64_t sub_25E2FE418()
{
  unint64_t result = qword_26A6E9000[0];
  if (!qword_26A6E9000[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E9000);
  }
  return result;
}

unint64_t sub_25E2FE470()
{
  unint64_t result = qword_26A6E9210[0];
  if (!qword_26A6E9210[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E9210);
  }
  return result;
}

unint64_t sub_25E2FE4C8()
{
  unint64_t result = qword_26A6E9320;
  if (!qword_26A6E9320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E9320);
  }
  return result;
}

unint64_t sub_25E2FE520()
{
  unint64_t result = qword_26A6E9328[0];
  if (!qword_26A6E9328[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E9328);
  }
  return result;
}

unint64_t sub_25E2FE578()
{
  unint64_t result = qword_26A6E93B0;
  if (!qword_26A6E93B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E93B0);
  }
  return result;
}

unint64_t sub_25E2FE5D0()
{
  unint64_t result = qword_26A6E93B8[0];
  if (!qword_26A6E93B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E93B8);
  }
  return result;
}

uint64_t sub_25E2FE638()
{
  if (*v0) {
    return 0x65746F6D6572;
  }
  else {
    return 0x6C61636F6CLL;
  }
}

uint64_t sub_25E2FE66C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E2FFFC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E2FE694(uint64_t a1)
{
  unint64_t v2 = sub_25E2FED84();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2FE6D0(uint64_t a1)
{
  unint64_t v2 = sub_25E2FED84();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25E2FE714()
{
  return 12383;
}

uint64_t sub_25E2FE724(uint64_t a1)
{
  unint64_t v2 = sub_25E2FEE90();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2FE760(uint64_t a1)
{
  unint64_t v2 = sub_25E2FEE90();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25E2FE79C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25E30A9A0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_25E2FE81C(uint64_t a1)
{
  unint64_t v2 = sub_25E2FEE3C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E2FE858(uint64_t a1)
{
  unint64_t v2 = sub_25E2FEE3C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RealityFileResource.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3FF8);
  uint64_t v38 = *(void *)(v2 - 8);
  uint64_t v39 = v2;
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v37 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4000);
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v34 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25E30A000();
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8, v9);
  char v33 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10, v12);
  unint64_t v14 = (char *)&v32 - v13;
  uint64_t v15 = type metadata accessor for RealityFileResource();
  MEMORY[0x270FA5388](v15, v16);
  char v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4008);
  uint64_t v40 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19, v20);
  char v22 = (char *)&v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E2FED84();
  uint64_t v23 = v41;
  sub_25E30AAC0();
  sub_25E2FEDD8(v42, (uint64_t)v18);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  unint64_t v25 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
  if (EnumCaseMultiPayload == 1)
  {
    char v26 = v33;
    v25(v33, v18, v8);
    char v44 = 1;
    sub_25E2FEE3C();
    uint64_t v27 = v37;
    sub_25E30A890();
    sub_25E2FF4DC(&qword_26A6E4010);
    uint64_t v28 = v39;
    sub_25E30A920();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v27, v28);
    unint64_t v14 = v26;
  }
  else
  {
    v25(v14, v18, v8);
    char v43 = 0;
    sub_25E2FEE90();
    uint64_t v29 = v34;
    sub_25E30A890();
    sub_25E2FF4DC(&qword_26A6E4010);
    uint64_t v30 = v36;
    sub_25E30A920();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v29, v30);
  }
  (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v22, v19);
}

uint64_t type metadata accessor for RealityFileResource()
{
  uint64_t result = qword_26A6E9560;
  if (!qword_26A6E9560) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25E2FED84()
{
  unint64_t result = qword_26A6E9440;
  if (!qword_26A6E9440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E9440);
  }
  return result;
}

uint64_t sub_25E2FEDD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RealityFileResource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25E2FEE3C()
{
  unint64_t result = qword_26A6E9448;
  if (!qword_26A6E9448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E9448);
  }
  return result;
}

unint64_t sub_25E2FEE90()
{
  unint64_t result = qword_26A6E9450[0];
  if (!qword_26A6E9450[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E9450);
  }
  return result;
}

uint64_t RealityFileResource.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4018);
  uint64_t v51 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48, v3);
  CGFloat v54 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4020);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v49 = v5;
  uint64_t v50 = v6;
  MEMORY[0x270FA5388](v5, v7);
  CGFloat v53 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4028);
  uint64_t v52 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for RealityFileResource();
  uint64_t v15 = MEMORY[0x270FA5388](v13, v14);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v15, v18);
  uint64_t v21 = (char *)&v45 - v20;
  MEMORY[0x270FA5388](v19, v22);
  long double v24 = (char *)&v45 - v23;
  uint64_t v25 = a1[3];
  CGFloat v55 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v25);
  sub_25E2FED84();
  uint64_t v26 = v56;
  sub_25E30AAB0();
  if (v26) {
    goto LABEL_7;
  }
  unint64_t v45 = v24;
  unint64_t v46 = v17;
  uint64_t v27 = v21;
  uint64_t v28 = v53;
  uint64_t v29 = v54;
  uint64_t v56 = v13;
  uint64_t v30 = sub_25E30A870();
  char v31 = v12;
  if (*(void *)(v30 + 16) != 1)
  {
    uint64_t v37 = sub_25E30A6D0();
    swift_allocError();
    uint64_t v39 = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4030);
    *uint64_t v39 = v56;
    sub_25E30A7A0();
    sub_25E30A6C0();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v37 - 8) + 104))(v39, *MEMORY[0x263F8DCB0], v37);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v12, v9);
LABEL_7:
    uint64_t v35 = (uint64_t)v55;
    return __swift_destroy_boxed_opaque_existential_1(v35);
  }
  if (*(unsigned char *)(v30 + 32))
  {
    char v58 = 1;
    sub_25E2FEE3C();
    sub_25E30A790();
    sub_25E30A000();
    sub_25E2FF4DC(&qword_26A6E4038);
    uint64_t v32 = v9;
    uint64_t v33 = (uint64_t)v46;
    uint64_t v34 = v48;
    sub_25E30A830();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v29, v34);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v12, v32);
    uint64_t v35 = (uint64_t)v55;
    swift_storeEnumTagMultiPayload();
    uint64_t v36 = v33;
  }
  else
  {
    char v57 = 0;
    sub_25E2FEE90();
    uint64_t v40 = v28;
    sub_25E30A790();
    sub_25E30A000();
    sub_25E2FF4DC(&qword_26A6E4038);
    uint64_t v36 = (uint64_t)v27;
    uint64_t v42 = v9;
    uint64_t v43 = v49;
    sub_25E30A830();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v40, v43);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v31, v42);
    uint64_t v35 = (uint64_t)v55;
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v44 = (uint64_t)v45;
  sub_25E2FF520(v36, (uint64_t)v45);
  sub_25E2FF520(v44, v47);
  return __swift_destroy_boxed_opaque_existential_1(v35);
}

uint64_t sub_25E2FF4DC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25E30A000();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25E2FF520(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RealityFileResource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E2FF584@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return RealityFileResource.init(from:)(a1, a2);
}

uint64_t sub_25E2FF59C(void *a1)
{
  return RealityFileResource.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for RealityFileResource(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v6 = sub_25E30A000();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for RealityFileResource(uint64_t a1)
{
  uint64_t v2 = sub_25E30A000();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for RealityFileResource(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_25E30A000();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for RealityFileResource(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25E2FF840(a1);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_25E30A000();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25E2FF840(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RealityFileResource();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for RealityFileResource(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_25E30A000();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for RealityFileResource(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_25E2FF840(a1);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_25E30A000();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for RealityFileResource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for RealityFileResource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25E2FFA28()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25E2FFA38()
{
  uint64_t result = sub_25E30A000();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for RealityFileResource.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E2FFB8CLL);
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

ValueMetadata *type metadata accessor for RealityFileResource.CodingKeys()
{
  return &type metadata for RealityFileResource.CodingKeys;
}

ValueMetadata *type metadata accessor for RealityFileResource.LocalCodingKeys()
{
  return &type metadata for RealityFileResource.LocalCodingKeys;
}

unsigned char *_s26SpatialInspectorFoundation19RealityFileResourceO15LocalCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E2FFC78);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RealityFileResource.RemoteCodingKeys()
{
  return &type metadata for RealityFileResource.RemoteCodingKeys;
}

unint64_t sub_25E2FFCB4()
{
  unint64_t result = qword_26A6E9670[0];
  if (!qword_26A6E9670[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E9670);
  }
  return result;
}

unint64_t sub_25E2FFD0C()
{
  unint64_t result = qword_26A6E9880[0];
  if (!qword_26A6E9880[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E9880);
  }
  return result;
}

unint64_t sub_25E2FFD64()
{
  unint64_t result = qword_26A6E9A90[0];
  if (!qword_26A6E9A90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E9A90);
  }
  return result;
}

unint64_t sub_25E2FFDBC()
{
  unint64_t result = qword_26A6E9BA0;
  if (!qword_26A6E9BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E9BA0);
  }
  return result;
}

unint64_t sub_25E2FFE14()
{
  unint64_t result = qword_26A6E9BA8[0];
  if (!qword_26A6E9BA8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E9BA8);
  }
  return result;
}

unint64_t sub_25E2FFE6C()
{
  unint64_t result = qword_26A6E9C30;
  if (!qword_26A6E9C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E9C30);
  }
  return result;
}

unint64_t sub_25E2FFEC4()
{
  unint64_t result = qword_26A6E9C38[0];
  if (!qword_26A6E9C38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E9C38);
  }
  return result;
}

unint64_t sub_25E2FFF1C()
{
  unint64_t result = qword_26A6E9CC0;
  if (!qword_26A6E9CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E9CC0);
  }
  return result;
}

unint64_t sub_25E2FFF74()
{
  unint64_t result = qword_26A6E9CC8[0];
  if (!qword_26A6E9CC8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E9CC8);
  }
  return result;
}

uint64_t sub_25E2FFFC8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C61636F6CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746F6D6572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t SpatialInspectorVersion.major.getter()
{
  return *(void *)v0;
}

uint64_t SpatialInspectorVersion.minor.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t SpatialInspectorVersion.debugDescription.getter()
{
  uint64_t v1 = sub_25E30A970();
  sub_25E30A300();
  sub_25E30A970();
  sub_25E30A300();
  swift_bridgeObjectRelease();
  return v1;
}

BOOL static SpatialInspectorVersion.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t sub_25E30016C()
{
  if (*v0) {
    return 0x726F6E696DLL;
  }
  else {
    return 0x726F6A616DLL;
  }
}

uint64_t sub_25E300198@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E300924(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E3001C0(uint64_t a1)
{
  unint64_t v2 = sub_25E3003A4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E3001FC(uint64_t a1)
{
  unint64_t v2 = sub_25E3003A4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SpatialInspectorVersion.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4040);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[1] = *(void *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E3003A4();
  sub_25E30AAC0();
  char v12 = 0;
  sub_25E30A910();
  if (!v2)
  {
    char v11 = 1;
    sub_25E30A910();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

unint64_t sub_25E3003A4()
{
  unint64_t result = qword_26A6E9D50[0];
  if (!qword_26A6E9D50[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6E9D50);
  }
  return result;
}

uint64_t SpatialInspectorVersion.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4048);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E3003A4();
  sub_25E30AAB0();
  if (!v2)
  {
    char v15 = 0;
    uint64_t v10 = sub_25E30A820();
    char v14 = 1;
    uint64_t v11 = sub_25E30A820();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    *a2 = v10;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25E300594@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_25E30059C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return SpatialInspectorVersion.init(from:)(a1, a2);
}

uint64_t sub_25E3005B4(void *a1)
{
  return SpatialInspectorVersion.encode(to:)(a1);
}

BOOL sub_25E3005CC(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t SpatialInspectorVersioningError.description.getter()
{
  return 0;
}

ValueMetadata *type metadata accessor for SpatialInspectorVersion()
{
  return &type metadata for SpatialInspectorVersion;
}

ValueMetadata *type metadata accessor for SpatialInspectorVersioningError()
{
  return &type metadata for SpatialInspectorVersioningError;
}

unsigned char *storeEnumTagSinglePayload for SpatialInspectorVersion.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E3007E4);
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

ValueMetadata *type metadata accessor for SpatialInspectorVersion.CodingKeys()
{
  return &type metadata for SpatialInspectorVersion.CodingKeys;
}

unint64_t sub_25E300820()
{
  unint64_t result = qword_26A6EA160[0];
  if (!qword_26A6EA160[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6EA160);
  }
  return result;
}

unint64_t sub_25E300878()
{
  unint64_t result = qword_26A6EA270;
  if (!qword_26A6EA270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6EA270);
  }
  return result;
}

unint64_t sub_25E3008D0()
{
  unint64_t result = qword_26A6EA278;
  if (!qword_26A6EA278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6EA278);
  }
  return result;
}

uint64_t sub_25E300924(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x726F6A616DLL && a2 == 0xE500000000000000;
  if (v2 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F6E696DLL && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

SpatialInspectorFoundation::InspectorEntityRepresentation::Icon_optional __swiftcall InspectorEntityRepresentation.Icon.init(rawValue:)(Swift::String rawValue)
{
  BOOL v2 = v1;
  uint64_t v3 = sub_25E30A780();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *BOOL v2 = v5;
  return result;
}

uint64_t InspectorEntityRepresentation.Icon.rawValue.getter()
{
  if (*v0) {
    return 0xD000000000000010;
  }
  else {
    return 0x64332E65766F6DLL;
  }
}

uint64_t sub_25E300AB4(char *a1, char *a2)
{
  return sub_25E300AC0(*a1, *a2);
}

uint64_t sub_25E300AC0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000010;
  }
  else {
    unint64_t v3 = 0x64332E65766F6DLL;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0x800000025E312480;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000010;
  }
  else {
    unint64_t v5 = 0x64332E65766F6DLL;
  }
  if (a2) {
    unint64_t v6 = 0x800000025E312480;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25E30A9A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25E300B6C()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E300BF4()
{
  sub_25E30A2A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E300C68()
{
  return sub_25E30AAA0();
}

SpatialInspectorFoundation::InspectorEntityRepresentation::Icon_optional sub_25E300CEC(Swift::String *a1)
{
  return InspectorEntityRepresentation.Icon.init(rawValue:)(*a1);
}

void sub_25E300CF8(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0x64332E65766F6DLL;
  if (*v1) {
    unint64_t v2 = 0xD000000000000010;
  }
  unint64_t v3 = 0x800000025E312480;
  if (!*v1) {
    unint64_t v3 = 0xE700000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

void InspectorEntityRepresentation.id.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
}

uint64_t InspectorEntityRepresentation.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InspectorEntityRepresentation.pointer.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InspectorEntityRepresentation.type.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InspectorEntityRepresentation.wasActive.getter()
{
  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t InspectorEntityRepresentation.wasAnchored.getter()
{
  return *(unsigned __int8 *)(v0 + 73);
}

uint64_t InspectorEntityRepresentation.wasEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 74);
}

uint64_t InspectorEntityRepresentation.wasEnabledInHierarchy.getter()
{
  return *(unsigned __int8 *)(v0 + 75);
}

uint64_t sub_25E300DF8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 200))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_25E300E48(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 208))(*a1);
}

uint64_t sub_25E300E90()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 76);
}

uint64_t sub_25E300EC4(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 76) = a1;
  return result;
}

uint64_t (*sub_25E300F04())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25E300F58@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 224))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_25E300FA8(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 232))(*a1);
}

uint64_t sub_25E300FF0(char a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v1 + 320))(&v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F68);
  unint64_t v3 = InspectorCollection.makeIterator()();
  int64_t v5 = v4;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25E30A730();
    uint64_t result = swift_bridgeObjectRelease();
    BOOL v8 = v5 < v7;
    if (v5 == v7) {
      goto LABEL_3;
    }
LABEL_7:
    if (v8)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        goto LABEL_16;
      }
      if ((v5 & 0x8000000000000000) == 0)
      {
        unint64_t v10 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v5 < v10 && v7 - 1 < v10) {
          goto LABEL_16;
        }
        __break(1u);
LABEL_14:
        uint64_t v11 = MEMORY[0x2611D1E10](v5, v3);
        while (1)
        {
          ++v5;
          (*(void (**)(void))(*(void *)v11 + 256))(a1 & 1);
          swift_release();
          if (v7 == v5) {
            goto LABEL_3;
          }
LABEL_16:
          if ((v3 & 0xC000000000000001) != 0) {
            goto LABEL_14;
          }
          uint64_t v11 = *(void *)(v3 + 8 * v5 + 32);
          swift_retain();
        }
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return result;
  }
  uint64_t v7 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  BOOL v8 = v5 < v7;
  if (v5 != v7) {
    goto LABEL_7;
  }
LABEL_3:
  swift_bridgeObjectRelease();
  type metadata accessor for InspectorEntityRepresentation();
  sub_25E3052FC(&qword_26A6E40D0, v9, (void (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation);
  sub_25E30A0C0();
  sub_25E30A0D0();

  return swift_release();
}

uint64_t sub_25E3011F4()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 77);
}

uint64_t sub_25E301228(char a1)
{
  sub_25E300FF0(a1);
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 77) = a1;
  return result;
}

void (*sub_25E30126C(void *a1))(uint64_t a1)
{
  unint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_beginAccess();
  *((unsigned char *)v3 + 32) = *(unsigned char *)(v1 + 77);
  return sub_25E3012E0;
}

void sub_25E3012E0(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 24);
  char v3 = *(unsigned char *)(*(void *)a1 + 32);
  sub_25E300FF0(v3);
  *(unsigned char *)(v2 + 77) = v3;

  free(v1);
}

uint64_t sub_25E301330@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 248))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_25E301380(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 256))(*a1);
}

uint64_t sub_25E3013D0()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 78);
}

uint64_t sub_25E301404(char a1)
{
  uint64_t v2 = v1;
  if (((*(uint64_t (**)(void))(*(void *)v1 + 224))() & 1) == 0) {
    goto LABEL_5;
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v1 + 320))(&v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F68);
  unint64_t v4 = InspectorCollection.makeIterator()();
  int64_t v6 = v5;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_25E30A730();
    uint64_t result = swift_bridgeObjectRelease();
    BOOL v9 = v6 < v8;
    if (v6 == v8) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v9 = v6 < v8;
    if (v6 == v8)
    {
LABEL_4:
      swift_bridgeObjectRelease();
LABEL_5:
      uint64_t result = swift_beginAccess();
      *(unsigned char *)(v2 + 78) = a1 & 1;
      return result;
    }
  }
  if (v9)
  {
    if ((v4 & 0xC000000000000001) != 0) {
      goto LABEL_16;
    }
    if ((v6 & 0x8000000000000000) == 0)
    {
      unint64_t v10 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v6 < v10 && v8 - 1 < v10) {
        goto LABEL_16;
      }
      __break(1u);
LABEL_14:
      uint64_t v11 = MEMORY[0x2611D1E10](v6, v4);
      while (1)
      {
        ++v6;
        (*(void (**)(void))(*(void *)v11 + 256))(a1 & 1);
        swift_release();
        if (v8 == v6) {
          goto LABEL_4;
        }
LABEL_16:
        if ((v4 & 0xC000000000000001) != 0) {
          goto LABEL_14;
        }
        uint64_t v11 = *(void *)(v4 + 8 * v6 + 32);
        swift_retain();
      }
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_25E3015E8(void *a1))(uint64_t a1)
{
  char v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_beginAccess();
  *((unsigned char *)v3 + 32) = *(unsigned char *)(v1 + 78);
  return sub_25E30165C;
}

void sub_25E30165C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  sub_25E301404(*(unsigned char *)(*(void *)a1 + 32));

  free(v1);
}

void sub_25E30169C(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

void *sub_25E3016AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(**(void **)a1 + 272))(&v5);
  char v4 = v6;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v4;
  return result;
}

uint64_t sub_25E301718(uint64_t *a1, uint64_t *a2)
{
  char v2 = *((unsigned char *)a1 + 8);
  uint64_t v3 = *a2;
  uint64_t v5 = *a1;
  char v6 = v2;
  return (*(uint64_t (**)(uint64_t *))(*(void *)v3 + 280))(&v5);
}

uint64_t sub_25E301780@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  char v4 = *(unsigned char *)(v1 + 88);
  *(void *)a1 = *(void *)(v1 + 80);
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_25E3017CC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 80) = v2;
  *(unsigned char *)(v1 + 88) = v3;
  return result;
}

uint64_t (*sub_25E30181C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25E301870@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for InspectorProperty();
  sub_25E2F1B00();
  sub_25E3052FC(&qword_26A6E3D30, 255, (void (*)(uint64_t))type metadata accessor for InspectorProperty);

  return InspectorCollection.init()(a1);
}

double sub_25E301910@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  (*(void (**)(long long *__return_ptr))(**(void **)a1 + 296))(&v4);
  double result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_25E301974(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = *a2;
  v6[0] = *a1;
  v6[1] = v2;
  long long v4 = *(uint64_t (**)(void *))(*(void *)v3 + 304);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v4(v6);
}

uint64_t sub_25E3019EC@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 96);
  uint64_t v4 = *(void *)(v1 + 104);
  *a1 = v3;
  a1[1] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E301A3C(_OWORD *a1)
{
  swift_beginAccess();
  *(_OWORD *)(v1 + 96) = *a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25E301A98())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25E301AEC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for InspectorEntityRepresentation();
  sub_25E2FA2BC();
  sub_25E3052FC((unint64_t *)&qword_26A6E3F58, v2, (void (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation);

  return InspectorCollection.init()(a1);
}

uint64_t type metadata accessor for InspectorEntityRepresentation()
{
  return self;
}

double sub_25E301BA8@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  (*(void (**)(long long *__return_ptr))(**(void **)a1 + 320))(&v4);
  double result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_25E301C0C(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = *a2;
  v6[0] = *a1;
  v6[1] = v2;
  long long v4 = *(uint64_t (**)(void *))(*(void *)v3 + 328);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v4(v6);
}

uint64_t sub_25E301C84@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 112);
  uint64_t v4 = *(void *)(v1 + 120);
  *a1 = v3;
  a1[1] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E301CD4(_OWORD *a1)
{
  swift_beginAccess();
  *(_OWORD *)(v1 + 112) = *a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25E301D30())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25E301D84@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for InspectorComponentRepresentation();
  sub_25E301E24();
  sub_25E3052FC(&qword_26A6E4058, 255, (void (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation);

  return InspectorCollection.init()(a1);
}

unint64_t sub_25E301E24()
{
  unint64_t result = qword_26A6E4050;
  if (!qword_26A6E4050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E4050);
  }
  return result;
}

double sub_25E301E78@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  (*(void (**)(long long *__return_ptr))(**(void **)a1 + 344))(&v4);
  double result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_25E301EDC(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = *a2;
  v6[0] = *a1;
  v6[1] = v2;
  long long v4 = *(uint64_t (**)(void *))(*(void *)v3 + 352);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v4(v6);
}

uint64_t sub_25E301F54@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 128);
  uint64_t v4 = *(void *)(v1 + 136);
  *a1 = v3;
  a1[1] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E301FA4(_OWORD *a1)
{
  swift_beginAccess();
  *(_OWORD *)(v1 + 128) = *a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25E302000())()
{
  return j__swift_endAccess;
}

uint64_t sub_25E302054()
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v0 + 344))(&v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4060);
  sub_25E2F1024(&qword_26A6E4068, &qword_26A6E4060);
  uint64_t result = sub_25E30A3B0();
  uint64_t v2 = v16;
  unint64_t v3 = v15 >> 62;
  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_25E30A730();
    uint64_t result = swift_bridgeObjectRelease();
    if (v16 == v4) {
      goto LABEL_3;
    }
  }
  else if (v16 == *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((v15 & 0xC000000000000001) != 0) {
    goto LABEL_38;
  }
  if ((v16 & 0x8000000000000000) != 0) {
    goto LABEL_41;
  }
  if (v16 >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    return result;
  }
  uint64_t v5 = *(void *)(v15 + 8 * v16 + 32);
  uint64_t result = swift_retain();
  uint64_t v6 = v16 + 1;
  if (__OFADD__(v16, 1))
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  while (1)
  {
    if (*(void *)(v5 + 32) == 0x6D6F436C65646F4DLL && *(void *)(v5 + 40) == 0xEE00746E656E6F70)
    {
LABEL_11:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      return 1;
    }
    char v7 = sub_25E30A9A0();
    uint64_t result = swift_release();
    if (v7) {
      break;
    }
    if (v3)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_25E30A730();
      uint64_t result = swift_bridgeObjectRelease();
      if (v6 == v8) {
        goto LABEL_3;
      }
    }
    else if (v6 == *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_3;
    }
    uint64_t v9 = v2 + 5;
    while (1)
    {
      unint64_t v11 = v9 - 4;
      if ((v15 & 0xC000000000000001) == 0) {
        break;
      }
      uint64_t v2 = MEMORY[0x2611D1E10](v9 - 4);
      uint64_t v12 = v9 - 3;
      if (__OFADD__(v11, 1)) {
        goto LABEL_37;
      }
LABEL_29:
      if (*(void *)(v2 + 32) == 0x6D6F436C65646F4DLL && *(void *)(v2 + 40) == 0xEE00746E656E6F70) {
        goto LABEL_11;
      }
      char v14 = sub_25E30A9A0();
      uint64_t result = swift_release();
      if (v14) {
        goto LABEL_13;
      }
      if (v3)
      {
        swift_bridgeObjectRetain();
        uint64_t v10 = sub_25E30A730();
        uint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v10 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      ++v9;
      if (v12 == v10) {
        goto LABEL_3;
      }
    }
    if ((v11 & 0x8000000000000000) != 0) {
      goto LABEL_43;
    }
    if (v11 >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_44;
    }
    uint64_t v2 = *(void *)(v15 + 8 * v9);
    swift_retain();
    uint64_t v12 = v9 - 3;
    if (!__OFADD__(v11, 1)) {
      goto LABEL_29;
    }
LABEL_37:
    __break(1u);
LABEL_38:
    uint64_t result = MEMORY[0x2611D1E10](v2);
    uint64_t v5 = result;
    uint64_t v6 = v2 + 1;
    if (__OFADD__(v2, 1)) {
      goto LABEL_40;
    }
  }
LABEL_13:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

unint64_t sub_25E302404()
{
  return sub_25E2FB118(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_25E30240C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v1 + 368))();
  *a1 = result & 1;
  return result;
}

uint64_t InspectorEntityRepresentation.__allocating_init(id:name:pointer:type:parent:wasActive:wasAnchored:wasEnabled:wasEnabledInHierarchy:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, char a10, char a11, char a12)
{
  uint64_t v17 = swift_allocObject();
  InspectorEntityRepresentation.init(id:name:pointer:type:parent:wasActive:wasAnchored:wasEnabled:wasEnabledInHierarchy:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  return v17;
}

uint64_t InspectorEntityRepresentation.init(id:name:pointer:type:parent:wasActive:wasAnchored:wasEnabled:wasEnabledInHierarchy:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, char a10, char a11, char a12)
{
  *(void *)(v12 + 80) = 0;
  *(unsigned char *)(v12 + 76) = 1;
  *(unsigned char *)(v12 + 78) = 1;
  *(unsigned char *)(v12 + 88) = 1;
  uint64_t v17 = *a1;
  type metadata accessor for InspectorProperty();
  sub_25E2F1B00();
  sub_25E3052FC(&qword_26A6E3D30, 255, (void (*)(uint64_t))type metadata accessor for InspectorProperty);
  InspectorCollection.init()((uint64_t *)(v12 + 96));
  type metadata accessor for InspectorEntityRepresentation();
  sub_25E2FA2BC();
  sub_25E3052FC((unint64_t *)&qword_26A6E3F58, v18, (void (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation);
  InspectorCollection.init()((uint64_t *)(v12 + 112));
  type metadata accessor for InspectorComponentRepresentation();
  sub_25E301E24();
  sub_25E3052FC(&qword_26A6E4058, 255, (void (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation);
  InspectorCollection.init()((uint64_t *)(v12 + 128));
  *(void *)(v12 + 16) = v17;
  *(void *)(v12 + 24) = a2;
  *(void *)(v12 + 32) = a3;
  *(void *)(v12 + 40) = a4;
  *(void *)(v12 + 48) = a5;
  *(void *)(v12 + 56) = a6;
  *(void *)(v12 + 64) = a7;
  if (a8)
  {
    uint64_t v19 = *(void *)(a8 + 16);
    swift_release();
  }
  else
  {
    uint64_t v19 = 0;
  }
  swift_beginAccess();
  *(void *)(v12 + 80) = v19;
  *(unsigned char *)(v12 + 88) = a8 == 0;
  *(unsigned char *)(v12 + 72) = a9 & 1;
  *(unsigned char *)(v12 + 73) = a10 & 1;
  *(unsigned char *)(v12 + 74) = a11 & 1;
  *(unsigned char *)(v12 + 75) = a12 & 1;
  *(unsigned char *)(v12 + 77) = a9 & 1;
  return v12;
}

unint64_t sub_25E302778(char a1)
{
  unint64_t result = 25705;
  switch(a1)
  {
    case 1:
      unint64_t result = 1701667182;
      break;
    case 2:
      unint64_t result = 0x7265746E696F70;
      break;
    case 3:
      unint64_t result = 1701869940;
      break;
    case 4:
      unint64_t result = 0x7669746341736177;
      break;
    case 5:
      unint64_t result = 0x6F68636E41736177;
      break;
    case 6:
      unint64_t result = 0x6C62616E45736177;
      break;
    case 7:
      unint64_t result = 0xD000000000000015;
      break;
    case 8:
      unint64_t result = 0xD000000000000012;
      break;
    case 9:
      unint64_t result = 0x6C62697369567369;
      break;
    case 10:
      unint64_t result = 0x746E657261507369;
      break;
    case 11:
      unint64_t result = 0x4449746E65726170;
      break;
    case 12:
      unint64_t result = 0x69747265706F7270;
      break;
    case 13:
      unint64_t result = 0x6E6572646C696863;
      break;
    case 14:
      unint64_t result = 0x6E656E6F706D6F63;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25E302958()
{
  return sub_25E302778(*v0);
}

uint64_t sub_25E302960@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E303F44(a1, a2);
  *a3 = result;
  return result;
}

void sub_25E302988(unsigned char *a1@<X8>)
{
  *a1 = 15;
}

uint64_t sub_25E302994(uint64_t a1)
{
  unint64_t v2 = sub_25E303108();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E3029D0(uint64_t a1)
{
  unint64_t v2 = sub_25E303108();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InspectorEntityRepresentation.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InspectorEntityRepresentation.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_25E302AF4(void *a1)
{
  unint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4070);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E303108();
  sub_25E30AAC0();
  uint64_t v20 = v3[2];
  LOBYTE(v18) = 0;
  sub_25E2E1BD8();
  sub_25E30A920();
  if (!v2)
  {
    LOBYTE(v20) = 1;
    sub_25E30A8E0();
    LOBYTE(v20) = 2;
    sub_25E30A8E0();
    LOBYTE(v20) = 3;
    sub_25E30A8E0();
    LOBYTE(v20) = 4;
    sub_25E30A8F0();
    LOBYTE(v20) = 5;
    sub_25E30A8F0();
    LOBYTE(v20) = 6;
    sub_25E30A8F0();
    LOBYTE(v20) = 7;
    uint64_t v10 = sub_25E30A8F0();
    (*(void (**)(uint64_t))(*v3 + 200))(v10);
    LOBYTE(v20) = 8;
    uint64_t v11 = sub_25E30A8F0();
    (*(void (**)(uint64_t))(*v3 + 224))(v11);
    LOBYTE(v20) = 9;
    uint64_t v12 = sub_25E30A8F0();
    (*(void (**)(uint64_t))(*v3 + 248))(v12);
    LOBYTE(v20) = 10;
    uint64_t v13 = sub_25E30A8F0();
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v3 + 272))(&v20, v13);
    uint64_t v18 = v20;
    LOBYTE(v19) = v21;
    char v22 = 11;
    uint64_t v14 = sub_25E30A8B0();
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v3 + 296))(&v20, v14);
    uint64_t v18 = v20;
    uint64_t v19 = v21;
    char v22 = 12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C70);
    sub_25E2F1024(&qword_26A6E3F38, &qword_26A6E3C70);
    sub_25E30A920();
    swift_bridgeObjectRelease();
    uint64_t v15 = swift_bridgeObjectRelease();
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v3 + 320))(&v20, v15);
    uint64_t v18 = v20;
    uint64_t v19 = v21;
    char v22 = 13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F68);
    sub_25E2F1024(&qword_26A6E3F70, &qword_26A6E3F68);
    sub_25E30A920();
    swift_bridgeObjectRelease();
    uint64_t v16 = swift_bridgeObjectRelease();
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v3 + 344))(&v20, v16);
    uint64_t v18 = v20;
    uint64_t v19 = v21;
    char v22 = 14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4060);
    sub_25E2F1024(&qword_26A6E4078, &qword_26A6E4060);
    sub_25E30A920();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_25E303108()
{
  unint64_t result = qword_26A6EA300[0];
  if (!qword_26A6EA300[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6EA300);
  }
  return result;
}

uint64_t InspectorEntityRepresentation.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  InspectorEntityRepresentation.init(from:)(a1);
  return v2;
}

uint64_t InspectorEntityRepresentation.init(from:)(void *a1)
{
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4080);
  uint64_t v28 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29, v3);
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = v1;
  *(void *)(v1 + 80) = 0;
  *(unsigned char *)(v1 + 76) = 1;
  uint64_t v6 = (unsigned char *)(v1 + 76);
  *(unsigned char *)(v1 + 78) = 1;
  *(unsigned char *)(v1 + 88) = 1;
  type metadata accessor for InspectorProperty();
  sub_25E2F1B00();
  sub_25E3052FC(&qword_26A6E3D30, 255, (void (*)(uint64_t))type metadata accessor for InspectorProperty);
  v27[5] = v1 + 96;
  InspectorCollection.init()((uint64_t *)(v1 + 96));
  uint64_t v7 = type metadata accessor for InspectorEntityRepresentation();
  sub_25E2FA2BC();
  sub_25E3052FC((unint64_t *)&qword_26A6E3F58, v8, (void (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation);
  v27[4] = v1 + 112;
  uint64_t v30 = v7;
  InspectorCollection.init()((uint64_t *)(v1 + 112));
  type metadata accessor for InspectorComponentRepresentation();
  sub_25E301E24();
  sub_25E3052FC(&qword_26A6E4058, 255, (void (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation);
  InspectorCollection.init()((uint64_t *)(v1 + 128));
  uint64_t v9 = a1[3];
  char v31 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_25E303108();
  uint64_t v10 = v5;
  uint64_t v11 = v32;
  sub_25E30AAB0();
  if (v11)
  {
    uint64_t v13 = (uint64_t)v31;
    uint64_t v25 = v41;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
    uint64_t v26 = v13;
  }
  else
  {
    v27[3] = v1 + 80;
    *(void *)&long long v32 = v1 + 78;
    v27[2] = v1 + 128;
    uint64_t v12 = v28;
    char v39 = 0;
    sub_25E2E20E4();
    sub_25E30A830();
    uint64_t v15 = v41;
    *(void *)(v41 + 16) = v40;
    LOBYTE(v40) = 1;
    *(void *)(v15 + 24) = sub_25E30A7F0();
    *(void *)(v15 + 32) = v16;
    LOBYTE(v40) = 2;
    *(void *)(v15 + 40) = sub_25E30A7F0();
    *(void *)(v15 + 48) = v17;
    LOBYTE(v40) = 3;
    *(void *)(v15 + 56) = sub_25E30A7F0();
    *(void *)(v15 + 64) = v18;
    LOBYTE(v40) = 4;
    v27[1] = 0;
    *(unsigned char *)(v15 + 72) = sub_25E30A800() & 1;
    LOBYTE(v40) = 5;
    *(unsigned char *)(v15 + 73) = sub_25E30A800() & 1;
    LOBYTE(v40) = 6;
    *(unsigned char *)(v15 + 74) = sub_25E30A800() & 1;
    LOBYTE(v40) = 7;
    *(unsigned char *)(v15 + 75) = sub_25E30A800() & 1;
    LOBYTE(v40) = 8;
    char v19 = sub_25E30A800();
    swift_beginAccess();
    *uint64_t v6 = v19 & 1;
    char v39 = 9;
    *(unsigned char *)(v41 + 77) = sub_25E30A800() & 1;
    char v39 = 10;
    char v20 = sub_25E30A800();
    uint64_t v21 = (unsigned char *)v32;
    swift_beginAccess();
    *uint64_t v21 = v20 & 1;
    char v38 = 11;
    sub_25E30A7C0();
    uint64_t v22 = v36;
    char v23 = v37;
    swift_beginAccess();
    uint64_t v24 = v41;
    *(void *)(v41 + 80) = v22;
    *(unsigned char *)(v24 + 88) = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C70);
    LOBYTE(v36) = 12;
    sub_25E2F1024(&qword_26A6E3F48, &qword_26A6E3C70);
    sub_25E30A830();
    long long v32 = v35;
    swift_beginAccess();
    *(_OWORD *)(v41 + 96) = v32;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F68);
    LOBYTE(v35) = 13;
    sub_25E2F1024(&qword_26A6E3F80, &qword_26A6E3F68);
    sub_25E30A830();
    long long v32 = v33;
    swift_beginAccess();
    *(_OWORD *)(v41 + 112) = v32;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4060);
    LOBYTE(v33) = 14;
    sub_25E2F1024(&qword_26A6E4088, &qword_26A6E4060);
    sub_25E30A830();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v29);
    long long v32 = v34;
    swift_beginAccess();
    uint64_t v25 = v41;
    *(_OWORD *)(v41 + 128) = v32;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v26 = (uint64_t)v31;
  }
  __swift_destroy_boxed_opaque_existential_1(v26);
  return v25;
}

uint64_t sub_25E303B1C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for InspectorEntityRepresentation();
  uint64_t result = sub_25E30A0C0();
  *a1 = result;
  return result;
}

uint64_t sub_25E303B58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 408))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25E303B94()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 400))();
}

void sub_25E303BE0(void *a1@<X8>)
{
  *a1 = *(void *)(*(void *)v1 + 16);
}

uint64_t sub_25E303BF4(void **a1, void **a2)
{
  return _s26SpatialInspectorFoundation0B20EntityRepresentationC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t InspectorEntityRepresentation.hash(into:)()
{
  uint64_t v5 = v0[2];
  sub_25E2F3764();
  sub_25E30A190();
  swift_bridgeObjectRetain();
  sub_25E30A2A0();
  uint64_t v1 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v0 + 296))(&v5, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C70);
  sub_25E2F1024(&qword_26A6E3C78, &qword_26A6E3C70);
  sub_25E30A190();
  swift_bridgeObjectRelease();
  uint64_t v2 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v0 + 320))(&v5, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3F68);
  sub_25E2F1024(&qword_26A6E4090, &qword_26A6E3F68);
  sub_25E30A190();
  swift_bridgeObjectRelease();
  uint64_t v3 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v0 + 344))(&v5, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4060);
  sub_25E2F1024(&qword_26A6E4098, &qword_26A6E4060);
  sub_25E30A190();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t InspectorEntityRepresentation.hashValue.getter()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E303E9C()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E303EE0()
{
  return InspectorEntityRepresentation.hash(into:)();
}

uint64_t sub_25E303F04()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E303F44(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7265746E696F70 && a2 == 0xE700000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7669746341736177 && a2 == 0xE900000000000065 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6F68636E41736177 && a2 == 0xEB00000000646572 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6C62616E45736177 && a2 == 0xEA00000000006465 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000025E312520 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000025E312540 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6C62697369567369 && a2 == 0xE900000000000065 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x746E657261507369 && a2 == 0xEF656C6269736956 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x4449746E65726170 && a2 == 0xE800000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x69747265706F7270 && a2 == 0xEA00000000007365 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x6E6572646C696863 && a2 == 0xE800000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x6E656E6F706D6F63 && a2 == 0xEA00000000007374)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else
  {
    char v6 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 14;
    }
    else {
      return 15;
    }
  }
}

uint64_t _s26SpatialInspectorFoundation0B20EntityRepresentationC2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v28 = a1[2];
  uint64_t v26 = a2[2];
  if (!static EntityID.== infix(_:_:)(&v28, &v26)) {
    goto LABEL_10;
  }
  BOOL v4 = a1[3] == a2[3] && a1[4] == a2[4];
  if (v4 || (char v5 = 0, (sub_25E30A9A0() & 1) != 0))
  {
    char v6 = (*(void *(**)(uint64_t *__return_ptr))(*a1 + 296))(&v28);
    uint64_t v26 = v28;
    uint64_t v27 = v29;
    (*(void (**)(uint64_t *__return_ptr, void *))(*a2 + 296))(&v24, v6);
    uint64_t v22 = v24;
    uint64_t v23 = v25;
    uint64_t v7 = type metadata accessor for InspectorProperty();
    unint64_t v8 = sub_25E2F1B00();
    uint64_t v9 = sub_25E3052FC(&qword_26A6E3D30, 255, (void (*)(uint64_t))type metadata accessor for InspectorProperty);
    LOBYTE(v7) = static InspectorCollection.== infix(_:_:)((uint64_t)&v26, (uint64_t)&v22, (uint64_t)&type metadata for InspectorPropertyID, v7, v8, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v10 = swift_bridgeObjectRelease();
    if (v7)
    {
      uint64_t v11 = (*(void *(**)(uint64_t *__return_ptr, uint64_t))(*a1 + 320))(&v28, v10);
      uint64_t v26 = v28;
      uint64_t v27 = v29;
      (*(void (**)(uint64_t *__return_ptr, void *))(*a2 + 320))(&v24, v11);
      uint64_t v22 = v24;
      uint64_t v23 = v25;
      uint64_t v12 = type metadata accessor for InspectorEntityRepresentation();
      unint64_t v13 = sub_25E2FA2BC();
      uint64_t v15 = sub_25E3052FC((unint64_t *)&qword_26A6E3F58, v14, (void (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation);
      LOBYTE(v12) = static InspectorCollection.== infix(_:_:)((uint64_t)&v26, (uint64_t)&v22, (uint64_t)&type metadata for EntityID, v12, v13, v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v16 = swift_bridgeObjectRelease();
      if (v12)
      {
        uint64_t v17 = (*(void *(**)(uint64_t *__return_ptr, uint64_t))(*a1 + 344))(&v28, v16);
        uint64_t v26 = v28;
        uint64_t v27 = v29;
        (*(void (**)(uint64_t *__return_ptr, void *))(*a2 + 344))(&v24, v17);
        uint64_t v22 = v24;
        uint64_t v23 = v25;
        uint64_t v18 = type metadata accessor for InspectorComponentRepresentation();
        unint64_t v19 = sub_25E301E24();
        uint64_t v20 = sub_25E3052FC(&qword_26A6E4058, 255, (void (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation);
        char v5 = static InspectorCollection.== infix(_:_:)((uint64_t)&v26, (uint64_t)&v22, (uint64_t)&type metadata for ComponentID, v18, v19, v20);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v5 & 1;
      }
    }
LABEL_10:
    char v5 = 0;
  }
  return v5 & 1;
}

unint64_t sub_25E30493C()
{
  unint64_t result = qword_26A6E40A0;
  if (!qword_26A6E40A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E40A0);
  }
  return result;
}

uint64_t sub_25E304994(void *a1, uint64_t a2)
{
  a1[1] = sub_25E3052FC(&qword_26A6E40A8, a2, (void (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation);
  a1[2] = sub_25E3052FC(&qword_26A6E40B0, v3, (void (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation);
  a1[3] = sub_25E3052FC(&qword_26A6E40B8, v4, (void (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation);
  uint64_t result = sub_25E3052FC(&qword_26A6E40C0, v5, (void (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation);
  a1[4] = result;
  return result;
}

uint64_t sub_25E304A68()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_25E304A78(uint64_t a1, uint64_t a2)
{
  return sub_25E3052FC(&qword_26A6E40C8, a2, (void (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation);
}

uint64_t method lookup function for InspectorEntityRepresentation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InspectorEntityRepresentation);
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isIncludedInFilter.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isIncludedInFilter.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isIncludedInFilter.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isVisible.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isVisible.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isVisible.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isParentVisible.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isParentVisible.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isParentVisible.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.parentID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.parentID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.parentID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.properties.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.properties.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.properties.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.children.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.children.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.children.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.components.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.components.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.components.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.hasModelComponent.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.humanReadableName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.icon.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.__allocating_init(id:name:pointer:type:parent:wasActive:wasAnchored:wasEnabled:wasEnabledInHierarchy:)()
{
  return (*(uint64_t (**)(void))(v0 + 392))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 408))();
}

unsigned char *storeEnumTagSinglePayload for InspectorEntityRepresentation.Icon(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E305028);
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

ValueMetadata *type metadata accessor for InspectorEntityRepresentation.Icon()
{
  return &type metadata for InspectorEntityRepresentation.Icon;
}

uint64_t getEnumTagSinglePayload for InspectorEntityRepresentation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for InspectorEntityRepresentation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 14;
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
        JUMPOUT(0x25E3051BCLL);
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
          *uint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorEntityRepresentation.CodingKeys()
{
  return &type metadata for InspectorEntityRepresentation.CodingKeys;
}

unint64_t sub_25E3051F8()
{
  unint64_t result = qword_26A6EA910[0];
  if (!qword_26A6EA910[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6EA910);
  }
  return result;
}

unint64_t sub_25E305250()
{
  unint64_t result = qword_26A6EAA20;
  if (!qword_26A6EAA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6EAA20);
  }
  return result;
}

unint64_t sub_25E3052A8()
{
  unint64_t result = qword_26A6EAA28[0];
  if (!qword_26A6EAA28[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6EAA28);
  }
  return result;
}

uint64_t sub_25E3052FC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t ComponentID.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ComponentID.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *int v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ComponentID.id.modify())()
{
  return nullsub_1;
}

SpatialInspectorFoundation::ComponentID __swiftcall ComponentID.init(id:)(SpatialInspectorFoundation::ComponentID id)
{
  *uint64_t v1 = id;
  return id;
}

uint64_t static ComponentID.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_25E30A9A0();
  }
}

uint64_t ComponentID.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25E30A2A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E30545C(uint64_t a1)
{
  unint64_t v2 = sub_25E30560C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E305498(uint64_t a1)
{
  unint64_t v2 = sub_25E30560C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ComponentID.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E40D8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  unsigned int v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E30560C();
  sub_25E30AAC0();
  sub_25E30A8E0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

unint64_t sub_25E30560C()
{
  unint64_t result = qword_26A6EAAB0;
  if (!qword_26A6EAAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6EAAB0);
  }
  return result;
}

uint64_t ComponentID.hashValue.getter()
{
  return sub_25E30AAA0();
}

uint64_t ComponentID.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E40E0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E30560C();
  sub_25E30AAB0();
  if (!v2)
  {
    uint64_t v10 = sub_25E30A7F0();
    uint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    *a2 = v10;
    a2[1] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25E30581C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return ComponentID.init(from:)(a1, a2);
}

uint64_t sub_25E305834(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E40D8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E30560C();
  sub_25E30AAC0();
  sub_25E30A8E0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t InspectorComponentRepresentation.id.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t InspectorComponentRepresentation.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InspectorComponentRepresentation.isInternal.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

void sub_25E3059B0(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 56);
}

uint64_t sub_25E3059BC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for InspectorProperty();
  sub_25E2F1B00();
  sub_25E3070B0(&qword_26A6E3D30, 255, (void (*)(uint64_t))type metadata accessor for InspectorProperty);

  return InspectorCollection.init()(a1);
}

double sub_25E305A5C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  (*(void (**)(long long *__return_ptr))(**(void **)a1 + 120))(&v4);
  double result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_25E305AB8(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = *a2;
  v6[0] = *a1;
  v6[1] = v2;
  long long v4 = *(uint64_t (**)(void *))(*(void *)v3 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v4(v6);
}

uint64_t sub_25E305B28@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(v1 + 72);
  *a1 = v3;
  a1[1] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E305B78(_OWORD *a1)
{
  swift_beginAccess();
  *(_OWORD *)(v1 + 64) = *a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25E305BD4())()
{
  return j__swift_endAccess;
}

unint64_t sub_25E305C28()
{
  return sub_25E2FB118(*(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t InspectorComponentRepresentation.__allocating_init(id:name:entityID:isInternal:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  uint64_t v13 = *a4;
  type metadata accessor for InspectorProperty();
  sub_25E2F1B00();
  sub_25E3070B0(&qword_26A6E3D30, 255, (void (*)(uint64_t))type metadata accessor for InspectorProperty);
  InspectorCollection.init()((uint64_t *)(v10 + 64));
  *(void *)(v10 + 16) = v11;
  *(void *)(v10 + 24) = v12;
  *(void *)(v10 + 32) = a2;
  *(void *)(v10 + 40) = a3;
  *(void *)(v10 + 56) = v13;
  *(unsigned char *)(v10 + 48) = a5;
  return v10;
}

uint64_t InspectorComponentRepresentation.init(id:name:entityID:isInternal:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v11 = *a4;
  type metadata accessor for InspectorProperty();
  sub_25E2F1B00();
  sub_25E3070B0(&qword_26A6E3D30, 255, (void (*)(uint64_t))type metadata accessor for InspectorProperty);
  InspectorCollection.init()((uint64_t *)(v5 + 64));
  *(void *)(v5 + 16) = v9;
  *(void *)(v5 + 24) = v10;
  *(void *)(v5 + 32) = a2;
  *(void *)(v5 + 40) = a3;
  *(void *)(v5 + 56) = v11;
  *(unsigned char *)(v5 + 48) = a5;
  return v5;
}

uint64_t sub_25E305DEC()
{
  uint64_t result = 25705;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1701667182;
      break;
    case 2:
      uint64_t result = 0x6E7265746E497369;
      break;
    case 3:
      uint64_t result = 0x4449797469746E65;
      break;
    case 4:
      uint64_t result = 0x69747265706F7270;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25E305E90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E306A44(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E305EB8(uint64_t a1)
{
  unint64_t v2 = sub_25E30624C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E305EF4(uint64_t a1)
{
  unint64_t v2 = sub_25E30624C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InspectorComponentRepresentation.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InspectorComponentRepresentation.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_25E305FC8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E40E8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E30624C();
  sub_25E30AAC0();
  uint64_t v10 = v3[3];
  uint64_t v16 = v3[2];
  uint64_t v17 = v10;
  LOBYTE(v14) = 0;
  sub_25E3062A0();
  sub_25E30A920();
  if (!v2)
  {
    LOBYTE(v16) = 1;
    sub_25E30A8E0();
    LOBYTE(v16) = 2;
    sub_25E30A8F0();
    uint64_t v16 = v3[7];
    LOBYTE(v14) = 3;
    sub_25E2E1BD8();
    uint64_t v11 = sub_25E30A920();
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v3 + 120))(&v16, v11);
    uint64_t v14 = v16;
    uint64_t v15 = v17;
    v13[15] = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C70);
    sub_25E306E04(&qword_26A6E3F38);
    sub_25E30A920();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_25E30624C()
{
  unint64_t result = qword_26A6EAAB8[0];
  if (!qword_26A6EAAB8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6EAAB8);
  }
  return result;
}

unint64_t sub_25E3062A0()
{
  unint64_t result = qword_26A6E40F0;
  if (!qword_26A6E40F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E40F0);
  }
  return result;
}

uint64_t InspectorComponentRepresentation.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  InspectorComponentRepresentation.init(from:)(a1);
  return v2;
}

uint64_t InspectorComponentRepresentation.init(from:)(void *a1)
{
  *(void *)&long long v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E40F8);
  uint64_t v4 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12, v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for InspectorProperty();
  sub_25E2F1B00();
  sub_25E3070B0(&qword_26A6E3D30, 255, (void (*)(uint64_t))type metadata accessor for InspectorProperty);
  InspectorCollection.init()((uint64_t *)(v1 + 64));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25E30624C();
  sub_25E30AAB0();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for InspectorComponentRepresentation();
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v15) = 0;
    sub_25E306738();
    uint64_t v8 = v12;
    sub_25E30A830();
    uint64_t v9 = v14;
    *(void *)(v1 + 16) = v13;
    *(void *)(v1 + 24) = v9;
    LOBYTE(v13) = 1;
    *(void *)(v1 + 32) = sub_25E30A7F0();
    *(void *)(v1 + 40) = v10;
    LOBYTE(v13) = 2;
    *(unsigned char *)(v1 + 48) = sub_25E30A800() & 1;
    LOBYTE(v15) = 3;
    sub_25E2E20E4();
    sub_25E30A830();
    *(void *)(v1 + 56) = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C70);
    LOBYTE(v13) = 4;
    sub_25E306E04(&qword_26A6E3F48);
    sub_25E30A830();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v8);
    long long v12 = v15;
    swift_beginAccess();
    *(_OWORD *)(v1 + 64) = v12;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t type metadata accessor for InspectorComponentRepresentation()
{
  return self;
}

unint64_t sub_25E306738()
{
  unint64_t result = qword_26A6E4100;
  if (!qword_26A6E4100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E4100);
  }
  return result;
}

uint64_t sub_25E30678C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 168))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25E3067C8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 160))();
}

uint64_t sub_25E306810(uint64_t *a1, uint64_t *a2)
{
  return _s26SpatialInspectorFoundation0B23ComponentRepresentationC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t InspectorComponentRepresentation.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25E30A2A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25E30A2A0();
  swift_bridgeObjectRelease();
  uint64_t v3 = v0[7];
  sub_25E2F3764();
  sub_25E30A190();
  uint64_t v1 = sub_25E30AA70();
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v0 + 120))(&v3, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E3C70);
  sub_25E306E04(&qword_26A6E3C78);
  sub_25E30A190();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t InspectorComponentRepresentation.hashValue.getter()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E30699C()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E3069E0()
{
  return InspectorComponentRepresentation.hash(into:)();
}

uint64_t sub_25E306A04()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E306A44(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E7265746E497369 && a2 == 0xEA00000000006C61 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4449797469746E65 && a2 == 0xE800000000000000 || (sub_25E30A9A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x69747265706F7270 && a2 == 0xEA00000000007365)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_25E30A9A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t _s26SpatialInspectorFoundation0B23ComponentRepresentationC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
  if (v4 || (char v5 = 0, (sub_25E30A9A0() & 1) != 0))
  {
    BOOL v6 = *(void *)(a1 + 32) == *(void *)(a2 + 32) && *(void *)(a1 + 40) == *(void *)(a2 + 40);
    if (v6 || (char v5 = 0, (sub_25E30A9A0() & 1) != 0))
    {
      v15[0] = *(void *)(a1 + 56);
      v14[0] = *(void *)(a2 + 56);
      if (static EntityID.== infix(_:_:)(v15, v14) && *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48))
      {
        uint64_t v7 = (*(void *(**)(void *__return_ptr))(*(void *)a1 + 120))(v15);
        v14[0] = v15[0];
        v14[1] = v15[1];
        (*(void (**)(void *__return_ptr, void *))(*(void *)a2 + 120))(v13, v7);
        v12[0] = v13[0];
        v12[1] = v13[1];
        uint64_t v8 = type metadata accessor for InspectorProperty();
        unint64_t v9 = sub_25E2F1B00();
        uint64_t v10 = sub_25E3070B0(&qword_26A6E3D30, 255, (void (*)(uint64_t))type metadata accessor for InspectorProperty);
        char v5 = static InspectorCollection.== infix(_:_:)((uint64_t)v14, (uint64_t)v12, (uint64_t)&type metadata for InspectorPropertyID, v8, v9, v10);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v5 = 0;
      }
    }
  }
  return v5 & 1;
}

uint64_t sub_25E306E04(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6E3C70);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25E306E4C(void *a1)
{
  a1[1] = sub_25E306738();
  a1[2] = sub_25E3062A0();
  a1[3] = sub_25E306E8C();
  unint64_t result = sub_25E306EE0();
  a1[4] = result;
  return result;
}

unint64_t sub_25E306E8C()
{
  unint64_t result = qword_26A6E4108;
  if (!qword_26A6E4108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E4108);
  }
  return result;
}

unint64_t sub_25E306EE0()
{
  unint64_t result = qword_26A6E4110;
  if (!qword_26A6E4110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E4110);
  }
  return result;
}

unint64_t sub_25E306F38()
{
  unint64_t result = qword_26A6E4118;
  if (!qword_26A6E4118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6E4118);
  }
  return result;
}

uint64_t sub_25E306F90(void *a1, uint64_t a2)
{
  a1[1] = sub_25E3070B0(&qword_26A6E4120, a2, (void (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation);
  a1[2] = sub_25E3070B0(&qword_26A6E4128, v3, (void (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation);
  a1[3] = sub_25E3070B0(&qword_26A6E4130, v4, (void (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation);
  uint64_t result = sub_25E3070B0(&qword_26A6E4138, v5, (void (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation);
  a1[4] = result;
  return result;
}

uint64_t sub_25E307068(uint64_t a1, uint64_t a2)
{
  return sub_25E3070B0(&qword_26A6E4140, a2, (void (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation);
}

uint64_t sub_25E3070B0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

ValueMetadata *type metadata accessor for ComponentID()
{
  return &type metadata for ComponentID;
}

uint64_t method lookup function for InspectorComponentRepresentation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InspectorComponentRepresentation);
}

uint64_t dispatch thunk of InspectorComponentRepresentation.properties.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of InspectorComponentRepresentation.properties.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of InspectorComponentRepresentation.properties.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of InspectorComponentRepresentation.humanReadableName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of InspectorComponentRepresentation.__allocating_init(id:name:entityID:isInternal:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of InspectorComponentRepresentation.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of InspectorComponentRepresentation.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

unsigned char *storeEnumTagSinglePayload for InspectorComponentRepresentation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x25E3072F0);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorComponentRepresentation.CodingKeys()
{
  return &type metadata for InspectorComponentRepresentation.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ComponentID.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E3073C4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentID.CodingKeys()
{
  return &type metadata for ComponentID.CodingKeys;
}

unint64_t sub_25E307400()
{
  unint64_t result = qword_26A6EB1C0[0];
  if (!qword_26A6EB1C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6EB1C0);
  }
  return result;
}

unint64_t sub_25E307458()
{
  unint64_t result = qword_26A6EB3D0[0];
  if (!qword_26A6EB3D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6EB3D0);
  }
  return result;
}

unint64_t sub_25E3074B0()
{
  unint64_t result = qword_26A6EB4E0;
  if (!qword_26A6EB4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6EB4E0);
  }
  return result;
}

unint64_t sub_25E307508()
{
  unint64_t result = qword_26A6EB4E8[0];
  if (!qword_26A6EB4E8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6EB4E8);
  }
  return result;
}

unint64_t sub_25E307560()
{
  unint64_t result = qword_26A6EB570;
  if (!qword_26A6EB570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6EB570);
  }
  return result;
}

unint64_t sub_25E3075B8()
{
  unint64_t result = qword_26A6EB578[0];
  if (!qword_26A6EB578[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A6EB578);
  }
  return result;
}

uint64_t EntityIDMap.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 16) = sub_25E3076AC(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 24) = sub_25E3076AC(v1);
  return v0;
}

uint64_t EntityIDMap.init()()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 16) = sub_25E3076AC(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 24) = sub_25E3076AC(v1);
  return v0;
}

unint64_t sub_25E3076A0()
{
  return sub_25E3076AC(MEMORY[0x263F8EE78]);
}

unint64_t sub_25E3076AC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    BOOL v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4148);
  BOOL v2 = (void *)sub_25E30A760();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *(v4 - 1);
    uint64_t v6 = *v4;
    unint64_t result = sub_25E307E54(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v5;
    *(void *)(v2[7] + v9) = v6;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v12;
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

uint64_t sub_25E3077A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 104))();
  *a2 = result;
  return result;
}

uint64_t sub_25E3077F4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E307854()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E30788C(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E3078D4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 128))();
  *a2 = result;
  return result;
}

uint64_t sub_25E307920(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E307980()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E3079B8(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E307A00(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *(void *)(v2 + 16);
  *(void *)(v2 + 16) = 0x8000000000000000;
  sub_25E30851C(v3, v4, isUniquelyReferenced_nonNull_native);
  *(void *)(v2 + 16) = v8;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_beginAccess();
  char v6 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *(void *)(v2 + 24);
  *(void *)(v2 + 24) = 0x8000000000000000;
  sub_25E30851C(v4, v3, v6);
  *(void *)(v2 + 24) = v9;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_25E307AEC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)v2 + 128))();
  if (*(void *)(v5 + 16) && (unint64_t v6 = sub_25E307E54(v4), (v7 & 1) != 0))
  {
    char v8 = 0;
    uint64_t v9 = *(void *)(*(void *)(v5 + 56) + 8 * v6);
  }
  else
  {
    uint64_t v9 = 0;
    char v8 = 1;
  }
  *(void *)a2 = v9;
  *(unsigned char *)(a2 + 8) = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E307B88@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)v2 + 104))();
  if (*(void *)(v5 + 16) && (unint64_t v6 = sub_25E307E54(v4), (v7 & 1) != 0))
  {
    char v8 = 0;
    uint64_t v9 = *(void *)(*(void *)(v5 + 56) + 8 * v6);
  }
  else
  {
    uint64_t v9 = 0;
    char v8 = 1;
  }
  *(void *)a2 = v9;
  *(unsigned char *)(a2 + 8) = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E307C24(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v1 + 128))();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_25E307E54(v2), (v5 & 1) != 0))
  {
    uint64_t v6 = *(void *)(*(void *)(v3 + 56) + 8 * v4);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_25E307F88(v6, (uint64_t)v8);
    swift_endAccess();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  sub_25E307F88(v2, (uint64_t)v8);
  return swift_endAccess();
}

uint64_t sub_25E307D08(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v1 + 128))();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_25E307E54(v2), (v5 & 1) != 0))
  {
    uint64_t v6 = *(void *)(*(void *)(v3 + 56) + 8 * v4);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_25E307F88(v6, (uint64_t)v8);
    swift_endAccess();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  sub_25E307F88(v2, (uint64_t)v8);
  return swift_endAccess();
}

uint64_t EntityIDMap.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t EntityIDMap.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

unint64_t sub_25E307E54(uint64_t a1)
{
  sub_25E2F3764();
  uint64_t v2 = sub_25E30A180();
  return sub_25E307EC0(a1, v2);
}

unint64_t sub_25E307EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    sub_25E2F3810();
    do
    {
      if (sub_25E30A220()) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_25E307F88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25E307E54(a1);
  char v8 = v7;
  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v3;
    uint64_t v12 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_25E308798();
      uint64_t v11 = v12;
    }
    *(void *)a2 = *(void *)(*(void *)(v11 + 56) + 8 * v6);
    sub_25E308350(v6, v11);
    *uint64_t v3 = v11;
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)a2 = 0;
  }
  *(unsigned char *)(a2 + 8) = (v8 & 1) == 0;
  return result;
}

uint64_t sub_25E308058(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4148);
  uint64_t v6 = sub_25E30A750();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  char v33 = a2;
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  long long v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    unint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_31;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_31:
          swift_release();
          uint64_t v3 = v34;
          if ((v33 & 1) == 0) {
            goto LABEL_38;
          }
          goto LABEL_34;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_40;
            }
            if (v13 >= v35) {
              goto LABEL_31;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    uint64_t v22 = 8 * v17;
    uint64_t v23 = *(void *)(*(void *)(v5 + 48) + v22);
    uint64_t v24 = *(void *)(*(void *)(v5 + 56) + v22);
    sub_25E2F3764();
    uint64_t result = sub_25E30A180();
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
          goto LABEL_39;
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
    uint64_t v15 = 8 * v14;
    *(void *)(*(void *)(v7 + 48) + v15) = v23;
    *(void *)(*(void *)(v7 + 56) + v15) = v24;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v19 = (void *)(v5 + 64);
  if ((v33 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v19, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v19 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_25E308350(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_25E30A620();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      sub_25E2F3764();
      do
      {
        uint64_t result = sub_25E30A180();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 >= v8 && v3 >= (uint64_t)v9)
          {
LABEL_16:
            uint64_t v12 = *(void *)(a2 + 48);
            int64_t v13 = (void *)(v12 + 8 * v3);
            unint64_t v14 = (void *)(v12 + 8 * v6);
            if (v3 != v6 || v13 >= v14 + 1) {
              *int64_t v13 = *v14;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              *unint64_t v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }
        else if (v9 >= v8 || v3 >= (uint64_t)v9)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *int64_t v18 = v20 & v19;
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

uint64_t sub_25E30851C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25E307E54(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25E308798();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(void *)(v16[7] + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v18 = 8 * v10;
    *(void *)(v16[6] + v18) = a2;
    *(void *)(v16[7] + v18) = a1;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      _OWORD v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_25E308058(result, a3 & 1);
  uint64_t result = sub_25E307E54(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_25E30AA00();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for EntityIDMap()
{
  return self;
}

uint64_t method lookup function for EntityIDMap(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for EntityIDMap);
}

uint64_t dispatch thunk of EntityIDMap.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of EntityIDMap.persistentToLocalID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of EntityIDMap.localToPersistentID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of EntityIDMap.add(localID:persistentID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of EntityIDMap.persistentIDFrom(localID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of EntityIDMap.localIDFrom(persistentID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of EntityIDMap.remove(localID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of EntityIDMap.remove(persistentID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

void *sub_25E308798()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6E4148);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25E30A740();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = v21 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
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

void sub_25E308928()
{
}

BOOL sub_25E30893C()
{
  uint64_t v0 = sub_25E30A780();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_25E308984()
{
  return sub_25E2F2538() & 1;
}

uint64_t sub_25E3089B0()
{
  return 0x73746E656D656C65;
}

uint64_t sub_25E3089C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D338];

  return MEMORY[0x270F9F940](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_25E308A3C(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAE8](a1, a2, WitnessTable, v5);
}

uint64_t sub_25E308AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAF8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_25E308B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAF0](a1, a2, a3, WitnessTable, v7);
}

BOOL sub_25E308B88@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_25E30893C();
  *a1 = result;
  return result;
}

void sub_25E308BC0(void *a1@<X8>)
{
  *a1 = 0x73746E656D656C65;
  a1[1] = 0xE800000000000000;
}

BOOL sub_25E308BDC@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_25E30893C();
  *a1 = result;
  return result;
}

uint64_t sub_25E308C0C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25E2F2538();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25E308C44(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_25E308C98(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_25E308CEC()
{
  return sub_25E30A440();
}

uint64_t sub_25E308CF4()
{
  swift_getTupleTypeMetadata2();
  sub_25E30A440();

  return sub_25E30A110();
}

uint64_t sub_25E308D64()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E308D6C(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t InspectorCollection.all.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t InspectorCollection.isEmpty.getter()
{
  return sub_25E30A4F0() & 1;
}

uint64_t InspectorCollection.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25E30A440();
  swift_getTupleTypeMetadata2();
  sub_25E30A440();
  uint64_t result = sub_25E30A110();
  *a1 = v2;
  a1[1] = result;
  return result;
}

uint64_t InspectorCollection.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  unint64_t v21 = a6;
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v33 = a5;
  uint64_t v24 = a5;
  type metadata accessor for InspectorCollection.CodingKeys(255, (uint64_t)&v30);
  swift_getWitnessTable();
  uint64_t v26 = sub_25E30A880();
  uint64_t v22 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26, v10);
  unint64_t v12 = (char *)&v20 - v11;
  uint64_t v28 = sub_25E30A440();
  swift_getTupleTypeMetadata2();
  sub_25E30A440();
  uint64_t v23 = a4;
  uint64_t v29 = sub_25E30A110();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v25 = v12;
  uint64_t v13 = v27;
  sub_25E30AAB0();
  if (!v13)
  {
    uint64_t v15 = v22;
    uint64_t v14 = v23;
    sub_25E30A490();
    uint64_t v16 = v24;
    uint64_t v34 = *(void *)(v24 + 8);
    swift_getWitnessTable();
    sub_25E30A830();
    swift_bridgeObjectRelease();
    uint64_t v28 = v30;
    uint64_t v30 = a2;
    uint64_t v31 = a3;
    uint64_t v32 = v14;
    uint64_t v33 = v16;
    type metadata accessor for InspectorCollection(0, (uint64_t)&v30);
    sub_25E30913C();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v25, v26);
    uint64_t v18 = v29;
    unint64_t v19 = v21;
    *unint64_t v21 = v28;
    v19[1] = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E30913C()
{
  return swift_bridgeObjectRelease();
}

uint64_t InspectorCollection.append(_:keepExisting:)(uint64_t a1, int a2, void *a3)
{
  LODWORD(v30) = a2;
  v29[1] = a3[5];
  uint64_t v5 = a3[3];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = MEMORY[0x270FA5388](AssociatedTypeWitness, v7);
  uint64_t v9 = a3[2];
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v8, v11);
  uint64_t v32 = (char *)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12, v14);
  uint64_t v17 = (char *)v29 - v16;
  MEMORY[0x270FA5388](v15, v18);
  uint64_t v20 = (char *)v29 - v19;
  uint64_t v33 = a1;
  uint64_t v40 = a1;
  sub_25E30A690();
  swift_dynamicCast();
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v31(v17, v20, v9);
  unint64_t v21 = v34;
  uint64_t v22 = v34[1];
  int64_t v35 = v34 + 1;
  uint64_t v23 = *(void *)(a3[4] + 24);
  MEMORY[0x2611D18C0](&v40, v17, v22, v9, v5, v23);
  uint64_t v36 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v37 = v10 + 8;
  v36(v17, v9);
  if (!v40)
  {
    uint64_t v25 = v31;
    uint64_t v24 = v32;
LABEL_8:
    uint64_t v27 = v33;
    uint64_t v40 = v33;
    sub_25E30A490();
    swift_unknownObjectRetain();
    sub_25E30A460();
    v25(v24, v20, v9);
    uint64_t v40 = v27;
    sub_25E30A130();
    swift_unknownObjectRetain();
    sub_25E30A170();
    return ((uint64_t (*)(char *, uint64_t))v36)(v20, v9);
  }
  if ((v30 & 1) == 0)
  {
    uint64_t v30 = v23;
    uint64_t v26 = *v21;
    uint64_t v38 = v40;
    uint64_t v39 = v26;
    sub_25E30A490();
    swift_getWitnessTable();
    sub_25E30A500();
    if (v41 != 1)
    {
      sub_25E30A470();
      swift_unknownObjectRelease();
    }
    uint64_t v25 = v31;
    uint64_t v24 = v32;
    v31(v32, v20, v9);
    uint64_t v40 = 0;
    sub_25E30A130();
    sub_25E30A170();
    swift_unknownObjectRelease();
    goto LABEL_8;
  }
  swift_unknownObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v36)(v20, v9);
}

uint64_t InspectorCollection.merge(_:)(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a2[3];
  uint64_t v5 = swift_bridgeObjectRetain();
  if (MEMORY[0x2611D1BE0](v5, v4))
  {
    uint64_t v6 = 4;
    do
    {
      uint64_t v7 = v6 - 4;
      char v8 = sub_25E30A450();
      sub_25E30A430();
      if (v8)
      {
        uint64_t v9 = *(void *)(v3 + 8 * v6);
        swift_unknownObjectRetain();
        BOOL v10 = __OFADD__(v7, 1);
        uint64_t v11 = v6 - 3;
        if (v10) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v9 = sub_25E30A6A0();
        BOOL v10 = __OFADD__(v7, 1);
        uint64_t v11 = v6 - 3;
        if (v10)
        {
LABEL_9:
          __break(1u);
          break;
        }
      }
      InspectorCollection.append(_:keepExisting:)(v9, 1, a2);
      swift_unknownObjectRelease();
      ++v6;
    }
    while (v11 != MEMORY[0x2611D1BE0](v3, v4));
  }

  return swift_bridgeObjectRelease();
}

uint64_t InspectorCollection.makeIterator()()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E309718(uint64_t a1, uint64_t a2)
{
  MEMORY[0x270FA5388](a1, a2);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness, v3);
  sub_25E30A690();
  swift_dynamicCast();
  sub_25E30A130();
  swift_unknownObjectRetain();
  return sub_25E30A170();
}

uint64_t static InspectorCollection.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a2 + 8);
  uint64_t v11 = *(void *)(*(void *)(a6 + 24) + 8);
  if ((sub_25E30A4B0() & 1) == 0) {
    return 0;
  }
  uint64_t v12 = *(void *)(a5 + 24);

  return MEMORY[0x270F9D1F0](v9, v10, a3, a4, v12, v11);
}

uint64_t InspectorCollection.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25E30A4A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25E30A140();

  return swift_bridgeObjectRelease();
}

uint64_t InspectorCollection.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 40);
  uint64_t v18 = *(void *)(a2 + 16);
  long long v16 = *(_OWORD *)(a2 + 24);
  long long v19 = v16;
  uint64_t v20 = v4;
  type metadata accessor for InspectorCollection.CodingKeys(255, (uint64_t)&v18);
  swift_getWitnessTable();
  uint64_t v5 = sub_25E30A960();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v16 - v8;
  uint64_t v10 = *v2;
  uint64_t v11 = a1[3];
  uint64_t v12 = a1;
  uint64_t v14 = v13;
  __swift_project_boxed_opaque_existential_1(v12, v11);
  sub_25E30AAC0();
  uint64_t v18 = v10;
  sub_25E30A490();
  uint64_t v21 = *(void *)(v17 + 16);
  swift_getWitnessTable();
  sub_25E30A920();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v14);
}

uint64_t InspectorCollection.hashValue.getter()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E309BEC@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  return InspectorCollection.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_25E309C10(void *a1, uint64_t a2)
{
  return InspectorCollection.encode(to:)(a1, a2);
}

uint64_t sub_25E309C28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25E309DBC();
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t sub_25E309C80()
{
  return 0;
}

uint64_t sub_25E309C88()
{
  uint64_t v0 = sub_25E309F28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25E309CD8()
{
  return sub_25E30A3D0();
}

uint64_t sub_25E309D04()
{
  return sub_25E30AAA0();
}

uint64_t sub_25E309D48(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return static InspectorCollection.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4], a3[5]);
}

uint64_t type metadata accessor for InspectorCollection.CodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for InspectorCollection.CodingKeys);
}

uint64_t type metadata accessor for InspectorCollection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for InspectorCollection);
}

uint64_t sub_25E309D88(uint64_t a1)
{
  return sub_25E309718(a1, *(void *)(v1 + 48));
}

uint64_t sub_25E309DBC()
{
  return *(void *)v0;
}

uint64_t sub_25E309DC8()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E309DE4()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E309E00()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E309E1C()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E309E38()
{
  return swift_getWitnessTable();
}

uint64_t sub_25E309E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_25E309E5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

unsigned char *sub_25E309E64(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E309F00);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25E309F30()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25E309F40()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25E309F50()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25E309F60()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t sub_25E309F70()
{
  return MEMORY[0x270EEED18]();
}

uint64_t sub_25E309F80()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_25E309F90()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_25E309FA0()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_25E309FB0()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_25E309FC0()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_25E309FD0()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_25E309FE0()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_25E309FF0()
{
  return MEMORY[0x270EEF8E8]();
}

uint64_t sub_25E30A000()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25E30A010()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_25E30A020()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_25E30A030()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25E30A040()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25E30A050()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25E30A060()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_25E30A070()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_25E30A080()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_25E30A090()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25E30A0A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25E30A0B0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25E30A0C0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_25E30A0D0()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_25E30A0E0()
{
  return MEMORY[0x270F9D010]();
}

uint64_t sub_25E30A0F0()
{
  return MEMORY[0x270F9D030]();
}

uint64_t sub_25E30A100()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25E30A110()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25E30A120()
{
  return MEMORY[0x270F9D1C8]();
}

uint64_t sub_25E30A130()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_25E30A140()
{
  return MEMORY[0x270F9D1E8]();
}

uint64_t sub_25E30A160()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_25E30A170()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_25E30A180()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25E30A190()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25E30A1A0()
{
  return MEMORY[0x270F9D368]();
}

uint64_t sub_25E30A1B0()
{
  return MEMORY[0x270F9D388]();
}

uint64_t sub_25E30A1C0()
{
  return MEMORY[0x270F9D390]();
}

uint64_t sub_25E30A1D0()
{
  return MEMORY[0x270F9D3A8]();
}

uint64_t sub_25E30A1E0()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_25E30A1F0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_25E30A200()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_25E30A210()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_25E30A220()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25E30A230()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25E30A240()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25E30A250()
{
  return MEMORY[0x270EF1B10]();
}

uint64_t sub_25E30A260()
{
  return MEMORY[0x270EF1B30]();
}

uint64_t sub_25E30A270()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25E30A280()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25E30A290()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25E30A2A0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25E30A2B0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25E30A2C0()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_25E30A2D0()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25E30A2E0()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_25E30A2F0()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_25E30A300()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25E30A310()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_25E30A320()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25E30A330()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25E30A340()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25E30A350()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_25E30A360()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25E30A370()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25E30A380()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_25E30A390()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25E30A3A0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25E30A3B0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_25E30A3C0()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_25E30A3D0()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_25E30A3E0()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_25E30A420()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25E30A430()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_25E30A440()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25E30A450()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_25E30A460()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_25E30A470()
{
  return MEMORY[0x270F9DC98]();
}

uint64_t sub_25E30A480()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_25E30A490()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25E30A4A0()
{
  return MEMORY[0x270F9DCE8]();
}

uint64_t sub_25E30A4B0()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_25E30A4C0()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_25E30A4D0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25E30A4E0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_25E30A4F0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_25E30A500()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t sub_25E30A510()
{
  return MEMORY[0x270F9E1D8]();
}

uint64_t sub_25E30A520()
{
  return MEMORY[0x270EE5820]();
}

uint64_t sub_25E30A530()
{
  return MEMORY[0x270FA0778]();
}

uint64_t sub_25E30A540()
{
  return MEMORY[0x270FA13E8]();
}

uint64_t sub_25E30A550()
{
  return MEMORY[0x270FA07D8]();
}

uint64_t sub_25E30A560()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25E30A570()
{
  return MEMORY[0x270FA13F0]();
}

uint64_t sub_25E30A580()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25E30A590()
{
  return MEMORY[0x270F9E470]();
}

uint64_t sub_25E30A5A0()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_25E30A5B0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25E30A5C0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25E30A5D0()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_25E30A5E0()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t sub_25E30A5F0()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_25E30A600()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_25E30A610()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_25E30A620()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25E30A630()
{
  return MEMORY[0x270F9E8B8]();
}

uint64_t sub_25E30A640()
{
  return MEMORY[0x270F9E8E0]();
}

uint64_t sub_25E30A660()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_25E30A670()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25E30A680()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25E30A690()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_25E30A6A0()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_25E30A6B0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25E30A6C0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25E30A6D0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25E30A6E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25E30A6F0()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_25E30A700()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25E30A710()
{
  return MEMORY[0x270F9EEB8]();
}

uint64_t sub_25E30A720()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25E30A730()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25E30A740()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25E30A750()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25E30A760()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25E30A770()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25E30A780()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25E30A790()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25E30A7A0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25E30A7B0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25E30A7C0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25E30A7D0()
{
  return MEMORY[0x270F9F2B8]();
}

uint64_t sub_25E30A7E0()
{
  return MEMORY[0x270F9F2E0]();
}

uint64_t sub_25E30A7F0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25E30A800()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25E30A810()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_25E30A820()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25E30A830()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25E30A840()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_25E30A850()
{
  return MEMORY[0x270F9F338]();
}

uint64_t sub_25E30A860()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_25E30A870()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25E30A880()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_25E30A890()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25E30A8A0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25E30A8B0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25E30A8C0()
{
  return MEMORY[0x270F9F3F0]();
}

uint64_t sub_25E30A8D0()
{
  return MEMORY[0x270F9F418]();
}

uint64_t sub_25E30A8E0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25E30A8F0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25E30A900()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_25E30A910()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25E30A920()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25E30A930()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_25E30A940()
{
  return MEMORY[0x270F9F478]();
}

uint64_t sub_25E30A950()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_25E30A960()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_25E30A970()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25E30A980()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_25E30A990()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25E30A9A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25E30A9C0()
{
  return MEMORY[0x270F9FA28]();
}

uint64_t sub_25E30A9D0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_25E30A9E0()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_25E30A9F0()
{
  return MEMORY[0x270F9FAD0]();
}

uint64_t sub_25E30AA00()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25E30AA10()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25E30AA20()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25E30AA30()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25E30AA40()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25E30AA50()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25E30AA60()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25E30AA70()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25E30AA80()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_25E30AA90()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25E30AAA0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25E30AAB0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25E30AAC0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25E30AAD0()
{
  return MEMORY[0x270F9FE68]();
}

uint64_t sub_25E30AAE0()
{
  return MEMORY[0x270F9FE70]();
}

uint64_t sub_25E30AAF0()
{
  return MEMORY[0x270F9FF18]();
}

uint64_t sub_25E30AB00()
{
  return MEMORY[0x270F9FF30]();
}

uint64_t sub_25E30AB10()
{
  return MEMORY[0x270F9FF38]();
}

uint64_t sub_25E30AB20()
{
  return MEMORY[0x270FA0080]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x270EE5B60](a1, *(void *)&intent, color, options);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B88](red, green, blue, alpha);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x270EE5BF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
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

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}