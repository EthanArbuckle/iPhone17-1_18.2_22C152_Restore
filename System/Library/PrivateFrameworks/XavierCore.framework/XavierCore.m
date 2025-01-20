__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
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

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

BOOL sub_23CA614A4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23CA614B4()
{
  return sub_23CA6AAD0();
}

uint64_t sub_23CA614DC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6465646461 && a2 == 0xE500000000000000;
  if (v2 || (sub_23CA6AA70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465766F6D6572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_23CA6AA70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_23CA615C8()
{
  return sub_23CA6AAE0();
}

uint64_t sub_23CA61610(char a1)
{
  if (a1) {
    return 0x6465766F6D6572;
  }
  else {
    return 0x6465646461;
  }
}

BOOL sub_23CA61644(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23CA614A4(*a1, *a2);
}

uint64_t sub_23CA61650()
{
  return sub_23CA615C8();
}

uint64_t sub_23CA61658()
{
  return sub_23CA614B4();
}

uint64_t sub_23CA61660()
{
  return sub_23CA6AAE0();
}

uint64_t sub_23CA616A0()
{
  return sub_23CA61610(*v0);
}

uint64_t sub_23CA616A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23CA614DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23CA616D0()
{
  return 0;
}

uint64_t sub_23CA616DC@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_23CA62008(a1, (uint64_t (*)(void, void, void, void))sub_23CA64DF8, a2);
}

uint64_t sub_23CA616F4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_23CA61748(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_23CA6179C()
{
  return 1;
}

uint64_t sub_23CA617A4()
{
  return sub_23CA6AAE0();
}

uint64_t sub_23CA617E8()
{
  return sub_23CA6AAD0();
}

uint64_t sub_23CA61810()
{
  return sub_23CA6AAE0();
}

void *sub_23CA61860(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v16[0] = a2;
  v16[1] = a3;
  uint64_t v14 = a3;
  v12[1] = a5;
  v12[2] = a4;
  v16[2] = a4;
  v16[3] = a5;
  _s4DiffV4TailO10CodingKeysOMa(255, (uint64_t)v16);
  swift_getWitnessTable();
  uint64_t v7 = sub_23CA6AA10();
  uint64_t v13 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  v9 = (char *)v12 - v8;
  v10 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23CA6AAF0();
  if (v5)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v12[0] = (uint64_t)a1;
    sub_23CA6A890();
    char v17 = 0;
    uint64_t v15 = v14;
    swift_getWitnessTable();
    sub_23CA6AA00();
    v10 = (void *)v16[0];
    (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v7);
    __swift_destroy_boxed_opaque_existential_1(v12[0]);
  }
  return v10;
}

uint64_t sub_23CA61B28(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = a2;
  int v17 = a3;
  v16[0] = a4;
  v16[1] = a5;
  uint64_t v13 = a6;
  v16[2] = a6;
  v16[3] = a7;
  _s4DiffV4TailO10CodingKeysOMa(255, (uint64_t)v16);
  swift_getWitnessTable();
  uint64_t v8 = sub_23CA6AA40();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v13 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23CA6AB00();
  if (v17)
  {
    LOBYTE(v16[0]) = 1;
    sub_23CA6AA20();
  }
  else
  {
    v16[0] = v14;
    char v18 = 0;
    sub_23CA6A890();
    uint64_t v15 = v13;
    swift_getWitnessTable();
    sub_23CA6AA30();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

BOOL sub_23CA61D10(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23CA61D20()
{
  return sub_23CA6AAD0();
}

uint64_t sub_23CA61D48(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64657461647075 && a2 == 0xE700000000000000;
  if (v2 || (sub_23CA6AA70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1818845556 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_23CA6AA70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_23CA61E2C()
{
  return sub_23CA6AAE0();
}

uint64_t sub_23CA61E74(char a1)
{
  if (a1) {
    return 1818845556;
  }
  else {
    return 0x64657461647075;
  }
}

void *sub_23CA61EA4@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_23CA61860(a1, a2[2], a2[3], a2[4], a2[5]);
  if (!v3)
  {
    *(void *)a3 = result;
    *(unsigned char *)(a3 + 8) = v6 & 1;
  }
  return result;
}

uint64_t sub_23CA61EE4(void *a1, uint64_t *a2)
{
  return sub_23CA61B28(a1, *(void *)v2, *(unsigned __int8 *)(v2 + 8), a2[2], a2[3], a2[4], a2[5]);
}

BOOL sub_23CA61F10(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23CA61D10(*a1, *a2);
}

uint64_t sub_23CA61F28()
{
  return sub_23CA61E2C();
}

uint64_t sub_23CA61F3C()
{
  return sub_23CA61D20();
}

uint64_t sub_23CA61F50()
{
  return sub_23CA6AAE0();
}

uint64_t sub_23CA61F9C()
{
  return sub_23CA61E74(*v0);
}

uint64_t sub_23CA61FB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23CA61D48(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23CA61FE4()
{
  return 0;
}

uint64_t sub_23CA61FF0@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_23CA62008(a1, (uint64_t (*)(void, void, void, void))sub_23CA64E00, a2);
}

uint64_t sub_23CA62008@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4], a1[5]);
  *a3 = result;
  return result;
}

uint64_t sub_23CA62044(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_23CA62098(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t Array<A>.Diff.encode(to:)(void *a1, void *a2)
{
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[4];
  uint64_t v6 = a2[5];
  uint64_t v21 = a2[3];
  uint64_t v22 = v6;
  uint64_t v29 = v4;
  uint64_t v30 = v21;
  uint64_t v20 = v5;
  uint64_t v31 = v5;
  uint64_t v32 = v6;
  _s4DiffV10CodingKeysOMa(255, (uint64_t)&v29);
  swift_getWitnessTable();
  uint64_t v7 = sub_23CA6AA40();
  uint64_t v23 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = *v2;
  uint64_t v19 = v2[1];
  int v33 = *((unsigned __int8 *)v2 + 16);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1;
  uint64_t v11 = v4;
  uint64_t v13 = (char *)&v19 - v12;
  __swift_project_boxed_opaque_existential_1(v10, v9);
  uint64_t v14 = v22;
  sub_23CA6AB00();
  uint64_t v29 = v8;
  LOBYTE(v25) = 0;
  swift_getAssociatedTypeWitness();
  sub_23CA6A780();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v27 = MEMORY[0x263F8D6D0];
  uint64_t v28 = AssociatedConformanceWitness;
  swift_getWitnessTable();
  uint64_t v16 = v24;
  sub_23CA6AA30();
  if (v16) {
    return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v13, v7);
  }
  uint64_t v18 = v23;
  uint64_t v25 = v19;
  char v26 = v33;
  char v34 = 1;
  uint64_t v29 = v11;
  uint64_t v30 = v21;
  uint64_t v31 = v20;
  uint64_t v32 = v14;
  _s4DiffV4TailOMa(0, (uint64_t)&v29);
  swift_getWitnessTable();
  sub_23CA6AA30();
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v13, v7);
}

uint64_t _s4DiffV10CodingKeysOMa(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &_s4DiffV10CodingKeysOMn);
}

uint64_t _s4DiffV4TailOMa(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &_s4DiffV4TailOMn);
}

uint64_t Array<A>.Diff.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v25 = a6;
  uint64_t v27 = a2;
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v36 = a4;
  uint64_t v37 = a5;
  uint64_t v29 = a5;
  _s4DiffV10CodingKeysOMa(255, (uint64_t)&v34);
  swift_getWitnessTable();
  uint64_t v38 = sub_23CA6AA10();
  uint64_t v26 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v24 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v28 = v11;
  sub_23CA6AAF0();
  if (v6) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v24 = a1;
  uint64_t v13 = v26;
  uint64_t v12 = v27;
  uint64_t v14 = v29;
  swift_getAssociatedTypeWitness();
  sub_23CA6A780();
  LOBYTE(v30) = 0;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v32 = MEMORY[0x263F8D6F8];
  uint64_t v33 = AssociatedConformanceWitness;
  swift_getWitnessTable();
  uint64_t v16 = v38;
  int v17 = v28;
  sub_23CA6AA00();
  uint64_t v18 = v34;
  uint64_t v34 = v12;
  uint64_t v35 = a3;
  uint64_t v36 = a4;
  uint64_t v37 = v14;
  _s4DiffV4TailOMa(0, (uint64_t)&v34);
  LOBYTE(v34) = 1;
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_23CA6AA00();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v16);
  uint64_t v19 = v30;
  char v20 = v31;
  swift_bridgeObjectRetain();
  sub_23CA62748(v19, v20);
  swift_bridgeObjectRelease();
  uint64_t v21 = (uint64_t)v24;
  uint64_t v22 = v25;
  *uint64_t v25 = v18;
  v22[1] = v19;
  *((unsigned char *)v22 + 16) = v20;
  __swift_destroy_boxed_opaque_existential_1(v21);
  swift_bridgeObjectRelease();
  return sub_23CA62754(v19, v20);
}

uint64_t sub_23CA62748(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23CA62754(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23CA62760@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  return Array<A>.Diff.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_23CA62784(void *a1, void *a2)
{
  return Array<A>.Diff.encode(to:)(a1, a2);
}

uint64_t Array<A>.diff(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = sub_23CA6A890();
  uint64_t WitnessTable = swift_getWitnessTable();
  MEMORY[0x23ECEF440](&v18, v7, WitnessTable);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = MEMORY[0x263F8D6C8];
  uint64_t v11 = MEMORY[0x263F8D6D8];
  sub_23CA6A730();
  sub_23CA6A9E0();
  sub_23CA6A780();
  swift_getWitnessTable();
  sub_23CA6A800();
  swift_bridgeObjectRelease();
  if ((MEMORY[0x23ECEF3D0](a2, v10, AssociatedTypeWitness, v11) & 1) != 0
    && (uint64_t v12 = MEMORY[0x23ECEF4C0](a2, a3), v12 == MEMORY[0x23ECEF4C0](a1, a3)))
  {
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(unsigned char *)(a4 + 16) = 0;
  }
  else
  {
    uint64_t v14 = MEMORY[0x23ECEF4C0](a2, a3);
    uint64_t v15 = MEMORY[0x23ECEF4C0](a1, a3);
    if (v15 < v14)
    {
      sub_23CA6A8B0();
      sub_23CA6A980();
      swift_getWitnessTable();
      uint64_t result = sub_23CA6A8A0();
    }
    else
    {
      uint64_t result = v14;
    }
    *(void *)a4 = a2;
    *(void *)(a4 + 8) = result;
    *(unsigned char *)(a4 + 16) = v15 >= v14;
  }
  return result;
}

uint64_t sub_23CA62A28(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v47 = a3;
  uint64_t v44 = a1;
  uint64_t v45 = a7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = sub_23CA6A960();
  uint64_t v42 = *(void *)(v10 - 8);
  uint64_t v43 = v10;
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  v48 = (char *)&v40 - v15;
  uint64_t v46 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v14);
  int v17 = (char *)&v40 - v16;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v19 = MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  uint64_t v20 = *(void *)(a4 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v40 - v25;
  uint64_t v27 = *(int *)(v24 + 56);
  uint64_t v29 = v28 + v27;
  uint64_t v30 = (char *)a2 + v27;
  uint64_t v31 = *a2;
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 16))(v28 + v27, v30, a4);
  uint64_t v32 = v29;
  uint64_t v33 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(v26, v32, a4);
  if (v31 >= MEMORY[0x23ECEF4C0](v33, a4)) {
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v26, a4);
  }
  v41 = v13;
  sub_23CA6A8C0();
  uint64_t v34 = v48;
  (*(void (**)(char *, uint64_t))(v45 + 40))(v23, a4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v34, 1, AssociatedTypeWitness) == 1)
  {
    uint64_t v35 = *(void (**)(char *, uint64_t))(v20 + 8);
    v35(v23, a4);
    v35(v26, a4);
    return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v48, v43);
  }
  else
  {
    uint64_t v37 = v46;
    (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v17, v48, AssociatedTypeWitness);
    uint64_t v38 = v41;
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v41, v17, AssociatedTypeWitness);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v38, 0, 1, AssociatedTypeWitness);
    uint64_t v49 = v31;
    sub_23CA6A780();
    sub_23CA6A7A0();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v17, AssociatedTypeWitness);
    v39 = *(void (**)(char *, uint64_t))(v20 + 8);
    v39(v23, a4);
    return ((uint64_t (*)(char *, uint64_t))v39)(v26, a4);
  }
}

uint64_t sub_23CA62EAC(uint64_t a1, uint64_t *a2)
{
  return sub_23CA62A28(a1, a2, v2[6], v2[2], v2[3], v2[4], v2[5]);
}

void *Array<A>.apply(diff:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  char v19 = *(unsigned char *)(a1 + 16);
  uint64_t v24 = a2;
  uint64_t v20 = v12;
  swift_getAssociatedTypeWitness();
  sub_23CA6A780();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  uint64_t v14 = &v20;
  sub_23CA6A810();
  swift_bridgeObjectRelease();
  if (!v6)
  {
    if ((v19 & 1) == 0)
    {
      uint64_t v20 = v13;
      sub_23CA6A890();
      swift_bridgeObjectRetain();
      swift_getWitnessTable();
      sub_23CA6A870();
      return (void *)v24;
    }
    if (MEMORY[0x23ECEF4C0](a2, a3) >= v13)
    {
      sub_23CA6A890();
      swift_bridgeObjectRetain();
      swift_getWitnessTable();
      sub_23CA6A930();
      sub_23CA6A980();
      swift_getWitnessTable();
      uint64_t v14 = (void *)sub_23CA6A8A0();
      swift_bridgeObjectRelease();
      return v14;
    }
    uint64_t v20 = a3;
    unint64_t v21 = a4;
    uint64_t v22 = a5;
    uint64_t v23 = a6;
    _s6ErrorsOMa(0, (uint64_t)&v20);
    swift_getWitnessTable();
    swift_allocError();
    int v17 = v16;
    uint64_t v20 = 0;
    unint64_t v21 = 0xE000000000000000;
    sub_23CA6A990();
    sub_23CA6A7C0();
    sub_23CA6AA50();
    sub_23CA6A7C0();
    swift_bridgeObjectRelease();
    sub_23CA6A7C0();
    sub_23CA6AA50();
    uint64_t v14 = &v20;
    sub_23CA6A7C0();
    swift_bridgeObjectRelease();
    unint64_t v18 = v21;
    *int v17 = v20;
    v17[1] = v18;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_23CA63270(int64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v30 = a6;
  uint64_t v34 = a2;
  uint64_t v32 = *(void *)(a4 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v29 - v15;
  uint64_t v17 = swift_bridgeObjectRetain();
  uint64_t v18 = MEMORY[0x23ECEF4C0](v17, a4);
  swift_bridgeObjectRelease();
  if (v18 <= a1)
  {
    v33[0] = a4;
    v33[1] = a5;
    v33[2] = v30;
    v33[3] = a7;
    _s6ErrorsOMa(0, (uint64_t)v33);
    swift_getWitnessTable();
    swift_allocError();
    uint64_t v26 = v25;
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v28 = (char *)v26 + *(int *)(swift_getTupleTypeMetadata2() + 48);
    *uint64_t v26 = a1;
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(v28, v34, AssociatedTypeWitness);
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  else
  {
    sub_23CA6A8C0();
    uint64_t v19 = v31;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a7 + 48))(v34, a4, a7);
    uint64_t v20 = v32;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v14, a4);
    if (!v19)
    {
      sub_23CA6A890();
      sub_23CA6A840();
      uint64_t v22 = *a3;
      sub_23CA64DA4(a1, *a3);
      char isClassOrObjCExistentialType = _swift_isClassOrObjCExistentialType();
      uint64_t v24 = v22 & 0xFFFFFFFFFFFFFF8;
      if ((isClassOrObjCExistentialType & 1) == 0) {
        uint64_t v24 = v22;
      }
      return (*(uint64_t (**)(unint64_t, char *, uint64_t))(v20 + 40))(v24+ ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))+ *(void *)(v20 + 72) * a1, v16, a4);
    }
  }
  return result;
}

uint64_t sub_23CA63550(int64_t a1, uint64_t a2)
{
  return sub_23CA63270(a1, a2, *(uint64_t **)(v2 + 48), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_23CA63574(char *a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 48);
  uint64_t v4 = *(void *)a1;
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return v3(v4, &a1[*(int *)(TupleTypeMetadata2 + 48)]);
}

uint64_t _s6ErrorsOMa(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &_s6ErrorsOMn);
}

uint64_t sub_23CA63620()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA6363C()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA63658@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = static Array<A>.zero.getter(*(void *)(a1 + 16));
  *a2 = result;
  return result;
}

uint64_t sub_23CA63684@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return Array<A>.diff(from:)(*a1, *v3, *(void *)(a2 + 16), a3);
}

void *sub_23CA636A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t result = Array<A>.apply(diff:)(a1, *v4, *(void *)(a2 + 16), *(void *)(a3 - 8), *(void *)(a3 - 16), *(void *)(a3 - 24));
  if (!v5) {
    *a4 = result;
  }
  return result;
}

uint64_t sub_23CA636E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_23CA636EC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 8);
  char v3 = *(unsigned char *)(a1 + 16);
  return sub_23CA62754(v2, v3);
}

uint64_t sub_23CA63730(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  sub_23CA62748(v3, v4);
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return a1;
}

uint64_t sub_23CA63780(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = v2[1];
  LOBYTE(v2) = *((unsigned char *)v2 + 16);
  sub_23CA62748(v4, (char)v2);
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = (_BYTE)v2;
  sub_23CA62754(v5, v6);
  return a1;
}

uint64_t sub_23CA637F0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = v4;
  sub_23CA62754(v5, v6);
  return a1;
}

uint64_t sub_23CA63844(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_23CA6388C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for Array<A>.Diff(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for Array<A>.Diff);
}

uint64_t sub_23CA638E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_23CA638EC()
{
  v2[4] = &unk_23CA6AE10;
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_23CA639B0(void *a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = v6;
  if (((v7 + 8) & (unint64_t)~v7) + *(void *)(v5 + 64) <= 0x10) {
    unint64_t v8 = 16;
  }
  else {
    unint64_t v8 = ((v6 + 8) & ~(unint64_t)v6) + *(void *)(v5 + 64);
  }
  int v9 = v6 & 0x100000;
  if (v7 > 7 || v9 != 0 || v8 + 1 > 0x18)
  {
    uint64_t v12 = *(void *)a2;
    *a1 = *(void *)a2;
    a1 = (void *)(v12 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    swift_retain();
  }
  else
  {
    unsigned int v13 = a2[v8];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v8 <= 3) {
        uint64_t v15 = v8;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_22;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_22;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_22;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_22:
          int v17 = (v16 | (v14 << (8 * v8))) + 2;
          unsigned int v13 = v16 + 2;
          if (v8 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    *a1 = *(void *)a2;
    if (v13 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))(((unint64_t)a1 + v7 + 8) & ~v7, (unint64_t)&a2[v7 + 8] & ~v7, AssociatedTypeWitness);
      *((unsigned char *)a1 + v8) = 1;
    }
    else
    {
      a1[1] = *((void *)a2 + 1);
      *((unsigned char *)a1 + v8) = 0;
      swift_bridgeObjectRetain();
    }
  }
  return a1;
}

uint64_t sub_23CA63B88(unsigned __int8 *a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = ((v4 + 8) & ~v4) + *(void *)(v3 + 64);
  if (v5 <= 0x10) {
    unint64_t v5 = 16;
  }
  unsigned int v6 = a1[v5];
  unsigned int v7 = v6 - 2;
  if (v6 >= 2)
  {
    if (v5 <= 3) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a1;
        goto LABEL_12;
      case 2:
        int v9 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v9 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v9 = *(_DWORD *)a1;
LABEL_12:
        int v10 = (v9 | (v7 << (8 * v5))) + 2;
        unsigned int v6 = v9 + 2;
        if (v5 < 4) {
          unsigned int v6 = v10;
        }
        break;
      default:
        break;
    }
  }
  if (v6 == 1)
  {
    uint64_t v11 = *(uint64_t (**)(unint64_t, uint64_t))(v3 + 8);
    return v11((unint64_t)&a1[v4 + 8] & ~v4, AssociatedTypeWitness);
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

void *sub_23CA63D10(void *a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  if (((v6 + 8) & (unint64_t)~v6) + *(void *)(v5 + 64) <= 0x10) {
    uint64_t v7 = 16;
  }
  else {
    uint64_t v7 = ((v6 + 8) & ~v6) + *(void *)(v5 + 64);
  }
  unsigned int v8 = a2[v7];
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
        int v11 = *a2;
        goto LABEL_13;
      case 2:
        int v11 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v11 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v11 = *(_DWORD *)a2;
LABEL_13:
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
  *a1 = *(void *)a2;
  if (v8 == 1)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))(((unint64_t)a1 + v6 + 8) & ~v6, (unint64_t)&a2[v6 + 8] & ~v6, AssociatedTypeWitness);
    char v13 = 1;
  }
  else
  {
    a1[1] = *((void *)a2 + 1);
    swift_bridgeObjectRetain();
    char v13 = 0;
  }
  *((unsigned char *)a1 + v7) = v13;
  return a1;
}

unsigned __int8 *sub_23CA63EA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 != a2)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
    if (((v6 + 8) & (unint64_t)~v6) + *(void *)(v5 + 64) <= 0x10) {
      uint64_t v7 = 16;
    }
    else {
      uint64_t v7 = ((v6 + 8) & ~v6) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
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
    uint64_t v13 = ~v6;
    if (v8 == 1) {
      (*(void (**)(unint64_t, uint64_t))(v5 + 8))((unint64_t)&a1[v6 + 8] & v13, AssociatedTypeWitness);
    }
    else {
      swift_bridgeObjectRelease();
    }
    unsigned int v14 = a2[v7];
    unsigned int v15 = v14 - 2;
    if (v14 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v16 = v7;
      }
      else {
        uint64_t v16 = 4;
      }
      switch(v16)
      {
        case 1:
          int v17 = *a2;
          goto LABEL_28;
        case 2:
          int v17 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v17 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v17 = *(_DWORD *)a2;
LABEL_28:
          int v18 = (v17 | (v15 << (8 * v7))) + 2;
          unsigned int v14 = v17 + 2;
          if (v7 < 4) {
            unsigned int v14 = v18;
          }
          break;
        default:
          break;
      }
    }
    *(void *)a1 = *(void *)a2;
    if (v14 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))((unint64_t)&a1[v6 + 8] & v13, (unint64_t)&a2[v6 + 8] & v13, AssociatedTypeWitness);
      a1[v7] = 1;
    }
    else
    {
      *((void *)a1 + 1) = *((void *)a2 + 1);
      a1[v7] = 0;
      swift_bridgeObjectRetain();
    }
  }
  return a1;
}

void *sub_23CA64120(void *a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  if (((v6 + 8) & (unint64_t)~v6) + *(void *)(v5 + 64) <= 0x10) {
    uint64_t v7 = 16;
  }
  else {
    uint64_t v7 = ((v6 + 8) & ~v6) + *(void *)(v5 + 64);
  }
  unsigned int v8 = a2[v7];
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
        int v11 = *a2;
        goto LABEL_13;
      case 2:
        int v11 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v11 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v11 = *(_DWORD *)a2;
LABEL_13:
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
  if (v8 == 1)
  {
    *a1 = *(void *)a2;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 32))(((unint64_t)a1 + v6 + 8) & ~v6, (unint64_t)&a2[v6 + 8] & ~v6, AssociatedTypeWitness);
    char v13 = 1;
  }
  else
  {
    char v13 = 0;
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  *((unsigned char *)a1 + v7) = v13;
  return a1;
}

unsigned __int8 *sub_23CA642B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 != a2)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
    if (((v6 + 8) & (unint64_t)~v6) + *(void *)(v5 + 64) <= 0x10) {
      uint64_t v7 = 16;
    }
    else {
      uint64_t v7 = ((v6 + 8) & ~v6) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
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
    uint64_t v13 = ~v6;
    if (v8 == 1) {
      (*(void (**)(unint64_t, uint64_t))(v5 + 8))((unint64_t)&a1[v6 + 8] & v13, AssociatedTypeWitness);
    }
    else {
      swift_bridgeObjectRelease();
    }
    unsigned int v14 = a2[v7];
    unsigned int v15 = v14 - 2;
    if (v14 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v16 = v7;
      }
      else {
        uint64_t v16 = 4;
      }
      switch(v16)
      {
        case 1:
          int v17 = *a2;
          goto LABEL_28;
        case 2:
          int v17 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v17 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v17 = *(_DWORD *)a2;
LABEL_28:
          int v18 = (v17 | (v15 << (8 * v7))) + 2;
          unsigned int v14 = v17 + 2;
          if (v7 < 4) {
            unsigned int v14 = v18;
          }
          break;
        default:
          break;
      }
    }
    if (v14 == 1)
    {
      *(void *)a1 = *(void *)a2;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 32))((unint64_t)&a1[v6 + 8] & v13, (unint64_t)&a2[v6 + 8] & v13, AssociatedTypeWitness);
      char v19 = 1;
    }
    else
    {
      char v19 = 0;
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    a1[v7] = v19;
  }
  return a1;
}

uint64_t sub_23CA64528(unsigned __int16 *a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v5 = ((*(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + *(void *)(v4 + 64);
  uint64_t v6 = 16;
  if (v5 > 0x10) {
    uint64_t v6 = v5;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_22;
  }
  uint64_t v7 = v6 + 1;
  char v8 = 8 * (v6 + 1);
  if ((v6 + 1) <= 3)
  {
    unsigned int v11 = ((a2 + ~(-1 << v8) - 254) >> v8) + 1;
    if (HIWORD(v11))
    {
      int v9 = *(_DWORD *)((char *)a1 + v7);
      if (!v9) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v11 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v7);
      if (!*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v11 < 2)
    {
LABEL_22:
      unsigned int v13 = *((unsigned __int8 *)a1 + v6);
      if (v13 >= 2) {
        return (v13 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v7);
  if (!*((unsigned char *)a1 + v7)) {
    goto LABEL_22;
  }
LABEL_14:
  int v12 = (v9 - 1) << v8;
  if (v7 > 3) {
    int v12 = 0;
  }
  if (v7)
  {
    if (v7 > 3) {
      LODWORD(v7) = 4;
    }
    switch((int)v7)
    {
      case 2:
        LODWORD(v7) = *a1;
        break;
      case 3:
        LODWORD(v7) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v7) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v7) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v7 | v12) + 255;
}

void sub_23CA646D4(unsigned char *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v7 = ((*(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)) + *(void *)(v6 + 64);
  if (v7 <= 0x10) {
    unint64_t v7 = 16;
  }
  size_t v8 = v7 + 1;
  if (a3 < 0xFF)
  {
    int v9 = 0;
  }
  else if (v8 <= 3)
  {
    unsigned int v12 = ((a3 + ~(-1 << (8 * v8)) - 254) >> (8 * v8)) + 1;
    if (HIWORD(v12))
    {
      int v9 = 4;
    }
    else if (v12 >= 0x100)
    {
      int v9 = 2;
    }
    else
    {
      int v9 = v12 > 1;
    }
  }
  else
  {
    int v9 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v10 = a2 - 255;
    if (v8 < 4)
    {
      int v11 = (v10 >> (8 * v8)) + 1;
      if (v7 != -1)
      {
        int v13 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v13;
          a1[2] = BYTE2(v13);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v13;
        }
        else
        {
          *a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v7 + 1);
      *(_DWORD *)a1 = v10;
      int v11 = 1;
    }
    switch(v9)
    {
      case 1:
        a1[v8] = v11;
        break;
      case 2:
        *(_WORD *)&a1[v8] = v11;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x23CA648FCLL);
      case 4:
        *(_DWORD *)&a1[v8] = v11;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v9)
    {
      case 1:
        a1[v8] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v8] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v7] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_23CA64924(unsigned __int8 *a1)
{
  uint64_t v2 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v3 = ((*(unsigned __int8 *)(v2 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)) + *(void *)(v2 + 64);
  if (v3 <= 0x10) {
    unint64_t v3 = 16;
  }
  uint64_t result = a1[v3];
  if (result >= 2)
  {
    if (v3 <= 3) {
      uint64_t v5 = v3;
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
        unsigned int v7 = (v6 | ((result - 2) << (8 * v3))) + 2;
        unsigned int v8 = v6 + 2;
        if (v3 >= 4) {
          uint64_t result = v8;
        }
        else {
          uint64_t result = v7;
        }
        break;
      default:
        return result;
    }
  }
  return result;
}

void sub_23CA64A54(unsigned char *a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v5 = ((*(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + *(void *)(v4 + 64);
  if (a2 > 1)
  {
    if (v5 <= 0x10) {
      size_t v6 = 16;
    }
    else {
      size_t v6 = v5;
    }
    unsigned int v7 = a2 - 2;
    if (v6 < 4)
    {
      unsigned int v8 = v7 >> (8 * v6);
      int v9 = v7 & ~(-1 << (8 * v6));
      a1[v6] = v8 + 2;
      bzero(a1, v6);
      if (v6 == 3)
      {
        *(_WORD *)a1 = v9;
        a1[2] = BYTE2(v9);
      }
      else if (v6 == 2)
      {
        *(_WORD *)a1 = v9;
      }
      else
      {
        *a1 = v9;
      }
    }
    else
    {
      a1[v6] = 2;
      bzero(a1, v6);
      *(_DWORD *)a1 = v7;
    }
  }
  else
  {
    if (v5 <= 0x10) {
      unint64_t v5 = 16;
    }
    a1[v5] = a2;
  }
}

uint64_t sub_23CA64B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_23CA64B98(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_23CA62748(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_23CA64BE0(uint64_t a1)
{
  return sub_23CA62754(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_23CA64BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_23CA62748(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_23CA62754(v5, v6);
  return a1;
}

uint64_t sub_23CA64C44(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_23CA62754(v5, v6);
  return a1;
}

uint64_t sub_23CA64C84(uint64_t a1, unsigned int a2)
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

uint64_t sub_23CA64CCC(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23CA64D10(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_23CA64D1C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

uint64_t sub_23CA64D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_23CA64D38(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23CA64D44(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

uint64_t sub_23CA64D50()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA64D6C()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA64D88()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA64DA4(unint64_t a1, uint64_t a2)
{
  uint64_t result = _swift_isClassOrObjCExistentialType();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v5 = a2 & 0xFFFFFFFFFFFFFF8;
  if ((result & 1) == 0) {
    uint64_t v5 = a2;
  }
  if (*(void *)(v5 + 16) <= a1) {
    goto LABEL_7;
  }
  return result;
}

uint64_t sub_23CA64DF8()
{
  return 2;
}

uint64_t sub_23CA64E00()
{
  return 2;
}

uint64_t _s4DiffV4TailO10CodingKeysOMa(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &_s4DiffV4TailO10CodingKeysOMn);
}

uint64_t _s4DiffV4TailO6ErrorsOMa(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &_s4DiffV4TailO6ErrorsOMn);
}

uint64_t sub_23CA64E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_23CA64E40(unsigned int *a1, int a2)
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

unsigned char *sub_23CA64E90(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x23CA64F2CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23CA64F54()
{
  return 0;
}

uint64_t sub_23CA64F64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_23CA64F70(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_23CA65004(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23CA650D0);
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

uint64_t sub_23CA650FC()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA65118()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA65134()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA65150()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA6517C()
{
  return sub_23CA651E4(&qword_268BC5C30);
}

uint64_t sub_23CA651B0()
{
  return sub_23CA651E4(qword_268BC5C38);
}

uint64_t sub_23CA651E4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_23CA6A710();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

BOOL sub_23CA6522C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23CA6523C()
{
  return sub_23CA6AAD0();
}

uint64_t sub_23CA65264(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6465766F6D6572 && a2 == 0xE700000000000000;
  if (v2 || (sub_23CA6AA70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465747265736E69 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_23CA6AA70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_23CA65358()
{
  return sub_23CA6AAE0();
}

uint64_t sub_23CA653A0(char a1)
{
  if (a1) {
    return 0x6465747265736E69;
  }
  else {
    return 0x6465766F6D6572;
  }
}

BOOL sub_23CA653D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23CA6522C(*a1, *a2);
}

uint64_t sub_23CA6541C()
{
  return sub_23CA65358();
}

uint64_t sub_23CA65458()
{
  return sub_23CA6523C();
}

uint64_t sub_23CA65494()
{
  return sub_23CA6AAE0();
}

uint64_t sub_23CA654EC()
{
  return sub_23CA653A0(*v0);
}

uint64_t sub_23CA65528@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23CA65264(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23CA65570()
{
  return 0;
}

uint64_t sub_23CA6557C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23CA6751C();
  *a1 = result;
  return result;
}

uint64_t sub_23CA655B8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_23CA6560C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t Dictionary<>.Diff.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 64);
  uint64_t v6 = *(void *)(a2 + 72);
  uint64_t v26 = *(void *)(a2 + 16);
  long long v17 = *(_OWORD *)(a2 + 24);
  long long v27 = v17;
  uint64_t v28 = v4;
  long long v20 = *(_OWORD *)(a2 + 48);
  long long v29 = v20;
  uint64_t v30 = v5;
  uint64_t v31 = v6;
  uint64_t v18 = v6;
  uint64_t v19 = v4;
  _s4DiffV10CodingKeysOMa_0(255, (uint64_t)&v26);
  swift_getWitnessTable();
  uint64_t v7 = sub_23CA6AA40();
  uint64_t v22 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  int v9 = (char *)&v15 - v8;
  uint64_t v10 = *v2;
  uint64_t v16 = v2[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v11 = v19;
  sub_23CA6AB00();
  uint64_t v26 = v10;
  char v32 = 0;
  sub_23CA6A910();
  uint64_t v25 = v11;
  swift_getWitnessTable();
  uint64_t v12 = v21;
  sub_23CA6AA30();
  if (!v12)
  {
    uint64_t v26 = v16;
    char v32 = 1;
    swift_getAssociatedTypeWitness();
    sub_23CA6A780();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v23 = v11;
    uint64_t v24 = AssociatedConformanceWitness;
    swift_getWitnessTable();
    sub_23CA6AA30();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v9, v7);
}

uint64_t _s4DiffV10CodingKeysOMa_0(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &_s4DiffV10CodingKeysOMn_0);
}

uint64_t Dictionary<>.Diff.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10)
{
  uint64_t v26 = a4;
  uint64_t v22 = a9;
  uint64_t v23 = a6;
  uint64_t v25 = a2;
  v31[0] = a2;
  v31[1] = a3;
  v31[2] = a4;
  v31[3] = a5;
  v31[4] = a6;
  v31[5] = a7;
  v31[6] = a8;
  v31[7] = a10;
  _s4DiffV10CodingKeysOMa_0(255, (uint64_t)v31);
  swift_getWitnessTable();
  uint64_t v24 = sub_23CA6AA10();
  uint64_t v11 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  int v13 = (char *)&v21 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v14 = (uint64_t)v27;
  sub_23CA6AAF0();
  if (v14) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  long long v27 = a1;
  sub_23CA6A910();
  char v32 = 0;
  uint64_t v30 = v26;
  swift_getWitnessTable();
  uint64_t v15 = v24;
  sub_23CA6AA00();
  uint64_t v16 = v31[0];
  swift_getAssociatedTypeWitness();
  sub_23CA6A780();
  char v32 = 1;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v28 = v26;
  uint64_t v29 = AssociatedConformanceWitness;
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_23CA6AA00();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v15);
  uint64_t v18 = v31[0];
  uint64_t v19 = v22;
  *uint64_t v22 = v16;
  v19[1] = v18;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA65C98@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  return Dictionary<>.Diff.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a3, a2[9]);
}

uint64_t sub_23CA65CD0(void *a1, uint64_t a2)
{
  return Dictionary<>.Diff.encode(to:)(a1, a2);
}

uint64_t static Dictionary<>.zero.getter()
{
  return sub_23CA6A730();
}

uint64_t Dictionary<>.diff(from:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X6>, uint64_t *a3@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_23CA6A730();
  sub_23CA6A780();
  sub_23CA6A780();
  swift_getWitnessTable();
  sub_23CA6A800();
  sub_23CA6A760();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_23CA6A7F0();
  sub_23CA6A890();
  swift_getWitnessTable();
  uint64_t v5 = sub_23CA6A920();
  uint64_t result = MEMORY[0x23ECEF3D0](v9, a1, AssociatedTypeWitness, a2);
  if (result & 1) != 0 && (uint64_t result = sub_23CA6A8F0(), (result))
  {
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *a3 = 0;
    a3[1] = 0;
  }
  else
  {
    *a3 = v5;
    a3[1] = v9;
  }
  return result;
}

uint64_t sub_23CA65F68(uint64_t a1, uint64_t a2, char **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v80 = a8;
  v79 = a3;
  uint64_t v70 = a1;
  v76 = (char *)a11;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v66 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  v63 = (char *)&v60 - v15;
  uint64_t v77 = v16;
  uint64_t v17 = sub_23CA6A960();
  uint64_t v61 = *(void *)(v17 - 8);
  uint64_t v62 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  v75 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v69 = (char *)&v60 - v20;
  uint64_t v21 = sub_23CA6A960();
  v64 = *(void (***)(char *, void (*)(uint64_t, uint64_t, uint64_t)))(v21 - 8);
  v65 = (void (*)(uint64_t, uint64_t, uint64_t))v21;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v60 - v22;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v25 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  v72 = (char *)&v60 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v60 - v28;
  uint64_t v30 = *(void *)(a5 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v27);
  v74 = (char *)&v60 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = v31;
  uint64_t v33 = *(int *)(v31 + 48);
  uint64_t v34 = &v29[v33];
  uint64_t v35 = a2;
  uint64_t v36 = a2 + v33;
  uint64_t v37 = *(void *)(a4 - 8);
  uint64_t v38 = *(void (**)(char *))(v37 + 16);
  uint64_t v39 = v37 + 16;
  uint64_t v68 = v35;
  v38(v29);
  uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  v71 = v34;
  uint64_t v78 = v36;
  uint64_t v41 = v36;
  uint64_t v42 = v40;
  v40(v34, v41, a5);
  uint64_t v73 = a4;
  MEMORY[0x23ECEF3F0](v29, v79, a4, a5, v80);
  int v43 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48))(v23, 1, a5);
  v79 = (char **)(v30 + 8);
  uint64_t v44 = (void (**)(char *, uint64_t))(v39 - 8);
  if (v43 == 1)
  {
    v64[1](v23, v65);
    v75 = *v79;
    ((void (*)(char *, uint64_t))v75)(v71, a5);
    uint64_t v45 = v29;
    uint64_t v46 = v73;
    (*v44)(v45, v73);
    uint64_t v47 = &v72[*(int *)(v67 + 48)];
    ((void (*)(char *, uint64_t, uint64_t))v38)(v72, v68, v46);
    uint64_t v48 = v78;
    v42(v47, v78, a5);
    static Diffable.diff(from:)(v48, a5, (uint64_t)v76);
    sub_23CA6A780();
    sub_23CA6A7A0();
    return ((uint64_t (*)(char *, uint64_t))v75)(v47, a5);
  }
  else
  {
    uint64_t v60 = v39;
    v64 = (void (**)(char *, void (*)(uint64_t, uint64_t, uint64_t)))v38;
    v65 = (void (*)(uint64_t, uint64_t, uint64_t))v42;
    v50 = v72;
    v51 = v74;
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v74, v23, a5);
    v52 = *(void (**)(char *, uint64_t))(v30 + 8);
    v52(v71, a5);
    uint64_t v53 = v73;
    (*v44)(v29, v73);
    v54 = v75;
    (*((void (**)(char *, uint64_t))v76 + 5))(v51, a5);
    uint64_t v55 = v66;
    uint64_t v56 = v77;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48))(v54, 1, v77) == 1)
    {
      v52(v74, a5);
      return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v75, v62);
    }
    else
    {
      v57 = v63;
      (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v63, v75, v56);
      v76 = &v50[*(int *)(v67 + 48)];
      uint64_t v58 = (uint64_t)v76;
      ((void (*)(char *, uint64_t, uint64_t))v64)(v50, v68, v53);
      v65(v58, v78, a5);
      v59 = v69;
      (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v69, v57, v56);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(v59, 0, 1, v56);
      sub_23CA6A780();
      sub_23CA6A7A0();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v56);
      v52(v74, a5);
      return ((uint64_t (*)(char *, uint64_t))v52)(v76, a5);
    }
  }
}

uint64_t sub_23CA66634(uint64_t a1, uint64_t a2)
{
  return sub_23CA65F68(a1, a2, *(char ***)(v2 + 80), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64), *(void *)(v2 + 72));
}

BOOL sub_23CA66670()
{
  return (sub_23CA6A820() & 1) == 0;
}

uint64_t Dictionary<>.apply(diff:)(uint64_t a1, uint64_t a2)
{
  sub_23CA6A910();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_23CA6A810();
  swift_bridgeObjectRelease();
  swift_getAssociatedTypeWitness();
  sub_23CA6A780();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_23CA6A810();
  swift_bridgeObjectRelease();
  if (v3) {
    swift_bridgeObjectRelease();
  }
  return a2;
}

uint64_t sub_23CA66900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_23CA6A960();
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v14 - v9;
  MEMORY[0x270FA5388](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a3);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56))(v10, 1, 1, a4);
  sub_23CA6A780();
  return sub_23CA6A7A0();
}

uint64_t sub_23CA66A7C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10)
{
  uint64_t v31 = a8;
  uint64_t v32 = a6;
  uint64_t v33 = a7;
  uint64_t v30 = a2;
  long long v29 = a9;
  uint64_t v14 = sub_23CA6A960();
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)&v27 - v16;
  uint64_t v28 = *(void *)(a4 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v26 = v29;
  *(void *)&long long v29 = a3;
  uint64_t v24 = v34;
  uint64_t result = sub_23CA66CFC(a3, a1, v30, a4, a5, v31, (uint64_t)v23, v26, *((uint64_t *)&v26 + 1), a10);
  if (!v24)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v20, a1, a4);
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v17, v23, a5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v17, 0, 1, a5);
    sub_23CA6A780();
    sub_23CA6A7A0();
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v23, a5);
  }
  return result;
}

uint64_t sub_23CA66CFC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v26 = a6;
  uint64_t v23 = a7;
  uint64_t v24 = a3;
  uint64_t v25 = a10;
  uint64_t v14 = sub_23CA6A960();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v23 - v17;
  uint64_t v19 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x23ECEF3F0](a2, *a1, a4, a5, v26);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, a5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    return static Diffable.value(from:)(v24, a5, v25);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v18, a5);
    (*(void (**)(uint64_t, uint64_t))(v25 + 48))(v24, a5);
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, a5);
  }
}

uint64_t sub_23CA66F24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Dictionary<>.zero.getter();
  *a1 = result;
  return result;
}

uint64_t sub_23CA66F58@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  return Dictionary<>.diff(from:)(*(void *)(a1 + 16), *(void *)(a1 + 32), a2);
}

uint64_t sub_23CA66F9C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = Dictionary<>.apply(diff:)(a1, *v2);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

BOOL sub_23CA66FF0()
{
  return sub_23CA66670();
}

uint64_t sub_23CA6702C(uint64_t a1)
{
  return sub_23CA66900(a1, v1[10], v1[2], v1[3]);
}

uint64_t sub_23CA67064(uint64_t a1, uint64_t a2)
{
  return sub_23CA66A7C(a1, a2, *(void **)(v2 + 80), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(_OWORD *)(v2 + 56), *(void *)(v2 + 72));
}

uint64_t sub_23CA670A0(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 80);
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return v3(a1, a1 + *(int *)(TupleTypeMetadata2 + 48));
}

uint64_t sub_23CA6712C()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA67148()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA67164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 72);
}

uint64_t sub_23CA67170()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_23CA671B0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_23CA671E8(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_23CA67248(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23CA67288(uint64_t *a1, int a2)
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

uint64_t sub_23CA672D0(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for Dictionary<>.Diff(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for Dictionary<>.Diff);
}

uint64_t sub_23CA67324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 64);
}

uint64_t sub_23CA6732C(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_23CA673BC(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23CA67488);
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

uint64_t sub_23CA674B0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23CA674BC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

uint64_t sub_23CA674C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA674E4()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA67500()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA6751C()
{
  return 2;
}

uint64_t sub_23CA67524@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_23CA67B80();
  char v5 = sub_23CA6A7B0();
  uint64_t v6 = *(void *)(a1 - 8);
  if (v5)
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(a2, v2, a1);
    uint64_t v6 = v10;
    uint64_t v7 = 0;
  }
  int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
  return v8(a2, v7, 1, a1);
}

uint64_t Diffable<>.diff(from:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  char v6 = sub_23CA6A7B0();
  uint64_t v7 = *(void *)(a1 - 8);
  if (v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v11 = *(void *)(a1 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(a2, v3, a1);
    uint64_t v7 = v11;
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  return v9(a2, v8, 1, a1);
}

uint64_t sub_23CA676E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1);
}

uint64_t Diffable<>.apply(diff:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1);
}

uint64_t static Diffable.diff(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v9, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(a3 + 40))(v7, a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a2);
}

uint64_t static Diffable.value(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(v9 + 32))(v10, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 48))(a1, a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

uint64_t Diffable<>.update(work:)(void (*a1)(void *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(v4, sel_copyWithZone_, 0);
  sub_23CA6A970();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  a1(v4);
  uint64_t v10 = v4;
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(a4 + 40))(&v9, a3, a4);
  return swift_unknownObjectRelease();
}

uint64_t dispatch thunk of static Diffable.zero.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Diffable.diff(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of Diffable.apply(diff:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_23CA67AF8@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t v4 = v2[1];
  BOOL v6 = *v2 == *(void *)result && v4 == *(void *)(result + 8);
  if (v6 || (uint64_t result = sub_23CA6AA70(), (result & 1) != 0))
  {
    uint64_t v5 = 0;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRetain();
  }
  *a2 = v5;
  a2[1] = v4;
  return result;
}

uint64_t sub_23CA67B60@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  *a2 = v3;
  a2[1] = v2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_23CA67B80()
{
  unint64_t result = qword_268BC5D40[0];
  if (!qword_268BC5D40[0])
  {
    sub_23CA6A710();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268BC5D40);
  }
  return result;
}

Swift::Double_optional __swiftcall Double.diff(from:)(Swift::Double from)
{
  double v2 = v1 - from;
  if (v2 == 0.0) {
    Swift::Bool v3 = 0;
  }
  else {
    Swift::Bool v3 = LOBYTE(v2);
  }
  result.value = v2;
  result.is_nil = v3;
  return result;
}

Swift::Double __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Double.apply(diff:)(Swift::Double diff)
{
  return diff + v1;
}

uint64_t sub_23CA67BF8()
{
  return MEMORY[0x263F8D570];
}

uint64_t sub_23CA67C04()
{
  return MEMORY[0x263F8D548];
}

void sub_23CA67C10(void *a1@<X8>)
{
  *a1 = 0;
}

double *sub_23CA67C18@<X0>(double *result@<X0>, uint64_t a2@<X8>)
{
  double v3 = *v2 - *result;
  double v4 = v3;
  if (v3 == 0.0) {
    double v4 = 0.0;
  }
  *(double *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v3 == 0.0;
  return result;
}

double sub_23CA67C40@<D0>(double *a1@<X0>, double *a2@<X8>)
{
  double result = *a1 + *v2;
  *a2 = result;
  return result;
}

Swift::Float __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Float.apply(diff:)(Swift::Float diff)
{
  return diff + v1;
}

uint64_t sub_23CA67C88()
{
  return MEMORY[0x263F8D600];
}

uint64_t sub_23CA67C94()
{
  return MEMORY[0x263F8D5D8];
}

void sub_23CA67CA0(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

float *sub_23CA67CA8@<X0>(float *result@<X0>, uint64_t a2@<X8>)
{
  float v3 = *v2 - *result;
  float v4 = v3;
  if (v3 == 0.0) {
    float v4 = 0.0;
  }
  *(float *)a2 = v4;
  *(unsigned char *)(a2 + 4) = v3 == 0.0;
  return result;
}

float sub_23CA67CD0@<S0>(float *a1@<X0>, float *a2@<X8>)
{
  float result = *a1 + *v2;
  *a2 = result;
  return result;
}

Swift::Int_optional __swiftcall Int.diff(from:)(Swift::Int from)
{
  BOOL v2 = __OFSUB__(v1, from);
  Swift::Int v3 = v1 - from;
  if (v2) {
    __break(1u);
  }
  else {
    LOBYTE(v1) = v3 == 0;
  }
  result.is_nil = v1;
  result.value = v3;
  return result;
}

Swift::Int __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Int.apply(diff:)(Swift::Int diff)
{
  BOOL v2 = __OFADD__(v1, diff);
  Swift::Int result = v1 + diff;
  if (v2) {
    __break(1u);
  }
  return result;
}

uint64_t sub_23CA67D0C()
{
  return MEMORY[0x263F8D6F8];
}

uint64_t sub_23CA67D18()
{
  return MEMORY[0x263F8D6D0];
}

void sub_23CA67D24(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_23CA67D2C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  if (__OFSUB__(*v2, *result))
  {
    __break(1u);
  }
  else
  {
    BOOL v3 = *v2 == *result;
    *(void *)a2 = *v2 - *result;
    *(unsigned char *)(a2 + 8) = v3;
  }
  return result;
}

void *sub_23CA67D54@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*v2, *result)) {
    __break(1u);
  }
  else {
    *a2 = *v2 + *result;
  }
  return result;
}

uint64_t sub_23CA67D70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v15 - v9;
  sub_23CA6A9C0();
  sub_23CA6A9D0();
  char v11 = sub_23CA6A7B0();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  if (v11)
  {
    v12(v10, v4);
    uint64_t v13 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v10, v4);
    uint64_t v13 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a3, v13, 1, v4);
}

uint64_t sub_23CA67F04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA6A9B0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, v4);
}

uint64_t sub_23CA67FEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA6A9D0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a2, v6, a1);
}

uint64_t sub_23CA680AC()
{
  return sub_23CA6A7B0() & 1;
}

uint64_t sub_23CA680D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CA67FEC(*(void *)(a1 + 16), a2);
}

uint64_t sub_23CA680E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23CA67F04(a1, a2, a3);
}

uint64_t sub_23CA68100()
{
  return sub_23CA680AC();
}

uint64_t sub_23CA6810C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_23CA68114()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23CA681A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  BOOL v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *BOOL v3 = *a2;
    BOOL v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_23CA6825C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_23CA68288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_23CA682D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_23CA68328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_23CA68378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_23CA683C8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_23CA68524(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x23CA6873CLL);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for NumberDiffable(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for NumberDiffable);
}

uint64_t sub_23CA6877C(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 32);
}

uint64_t sub_23CA68784(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 40);
}

BOOL sub_23CA6878C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23CA6879C()
{
  return sub_23CA6AAD0();
}

uint64_t sub_23CA687C4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6465747265736E69 && a2 == 0xE800000000000000;
  if (v2 || (sub_23CA6AA70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465766F6D6572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_23CA6AA70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_23CA688B8()
{
  return sub_23CA6AAE0();
}

uint64_t sub_23CA68900(char a1)
{
  if (a1) {
    return 0x6465766F6D6572;
  }
  else {
    return 0x6465747265736E69;
  }
}

BOOL sub_23CA68938(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23CA6878C(*a1, *a2);
}

uint64_t sub_23CA68950()
{
  return sub_23CA688B8();
}

uint64_t sub_23CA68964()
{
  return sub_23CA6879C();
}

uint64_t sub_23CA68978()
{
  return sub_23CA6AAE0();
}

uint64_t sub_23CA689C4()
{
  return sub_23CA68900(*v0);
}

uint64_t sub_23CA689D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23CA687C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23CA68A0C()
{
  return 0;
}

uint64_t sub_23CA68A18@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23CA69B20();
  *a1 = result;
  return result;
}

uint64_t sub_23CA68A4C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_23CA68AA0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t Set<>.Diff.encode(to:)(void *a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 32);
  long long v14 = *(_OWORD *)(a2 + 16);
  long long v15 = v4;
  v19[0] = v14;
  v19[1] = v4;
  _s4DiffV10CodingKeysOMa_1(255, (uint64_t)v19);
  swift_getWitnessTable();
  uint64_t v5 = sub_23CA6AA40();
  uint64_t v16 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unsigned int v7 = (char *)&v12 - v6;
  uint64_t v8 = *v2;
  uint64_t v13 = v2[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23CA6AB00();
  *(void *)&v19[0] = v8;
  char v20 = 0;
  sub_23CA6A890();
  uint64_t v18 = v15;
  swift_getWitnessTable();
  uint64_t v9 = v17;
  sub_23CA6AA30();
  if (v9) {
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v7, v5);
  }
  uint64_t v11 = v16;
  *(void *)&v19[0] = v13;
  char v20 = 1;
  sub_23CA6AA30();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v7, v5);
}

uint64_t _s4DiffV10CodingKeysOMa_1(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &_s4DiffV10CodingKeysOMn_1);
}

uint64_t Set<>.Diff.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v17 = a6;
  uint64_t v18 = a3;
  v21[0] = a2;
  v21[1] = a3;
  v21[2] = a4;
  v21[3] = a5;
  _s4DiffV10CodingKeysOMa_1(255, (uint64_t)v21);
  swift_getWitnessTable();
  uint64_t v19 = sub_23CA6AA10();
  uint64_t v8 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  unsigned int v10 = (char *)&v17 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23CA6AAF0();
  if (v6) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v11 = v8;
  sub_23CA6A890();
  char v22 = 0;
  uint64_t v20 = v18;
  swift_getWitnessTable();
  uint64_t v12 = v19;
  sub_23CA6AA00();
  uint64_t v13 = v21[0];
  char v22 = 1;
  swift_bridgeObjectRetain();
  sub_23CA6AA00();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v10, v12);
  uint64_t v14 = v21[0];
  long long v15 = v17;
  *uint64_t v17 = v13;
  v15[1] = v14;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA68FC0@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  return Set<>.Diff.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_23CA68FE4(void *a1, uint64_t a2)
{
  return Set<>.Diff.encode(to:)(a1, a2);
}

uint64_t static Set<>.zero.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9CFC8](a1, a4);
}

uint64_t Set<>.apply(diff:)(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_23CA6914C()
{
  uint64_t v0 = sub_23CA6A960();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  BOOL v3 = (char *)&v5 - v2;
  sub_23CA6A910();
  sub_23CA6A8E0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_23CA69250(uint64_t a1)
{
  return sub_23CA693D8(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_23CA6914C);
}

uint64_t sub_23CA6927C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  unsigned int v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v11 - v8;
  (*(void (**)(char *))(v4 + 16))(v7);
  sub_23CA6A910();
  sub_23CA6A8D0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, a3);
}

uint64_t sub_23CA693AC(uint64_t a1)
{
  return sub_23CA693D8(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_23CA6927C);
}

uint64_t sub_23CA693D8(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[6], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t Set<>.diff(from:)@<X0>(uint64_t *a1@<X8>)
{
  sub_23CA6A910();
  swift_getWitnessTable();
  uint64_t v1 = sub_23CA6A7D0();
  uint64_t v2 = sub_23CA6A7D0();
  sub_23CA6A890();
  swift_getWitnessTable();
  uint64_t result = sub_23CA6A940();
  if (result & 1) != 0 && (uint64_t result = sub_23CA6A940(), (result))
  {
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *a1 = 0;
    a1[1] = 0;
  }
  else
  {
    *a1 = v1;
    a1[1] = v2;
  }
  return result;
}

uint64_t sub_23CA69598@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CA69688(a1, a2);
}

uint64_t sub_23CA695B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  char v6 = sub_23CA6A900();
  uint64_t v7 = *(void *)(a2 - 8);
  if (v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
    uint64_t v8 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a3, v8, 1, a2);
}

uint64_t sub_23CA69670@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CA69688(a1, a2);
}

uint64_t sub_23CA69688@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CA695B0(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_23CA696AC()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA696C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA696E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = static Set<>.zero.getter(*(void *)(a1 + 16), a2, a3, *(void *)(a1 + 24));
  *a4 = result;
  return result;
}

uint64_t sub_23CA69714@<X0>(uint64_t *a1@<X8>)
{
  return Set<>.diff(from:)(a1);
}

uint64_t sub_23CA6972C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = Set<>.apply(diff:)(a1, *v2);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_23CA69768(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_23CA69774()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_23CA697B4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_23CA697EC(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_23CA6984C(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23CA6988C(uint64_t *a1, int a2)
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

uint64_t sub_23CA698D4(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for Set<>.Diff(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for Set<>.Diff);
}

uint64_t sub_23CA69928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_23CA69930(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_23CA699C0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23CA69A8CLL);
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

uint64_t sub_23CA69AB4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23CA69AC0(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

uint64_t sub_23CA69ACC()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA69AE8()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA69B04()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA69B20()
{
  return 2;
}

uint64_t static String.zero.getter()
{
  return 0;
}

uint64_t sub_23CA69B34()
{
  return MEMORY[0x263F8D348];
}

uint64_t sub_23CA69B40()
{
  return MEMORY[0x263F8D318];
}

void sub_23CA69B4C(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
}

uint64_t (*combine<A, B, C>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v8 = (void *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = a4;
  v8[5] = a1;
  swift_bridgeObjectRetain();
  return sub_23CA69D50;
}

uint64_t sub_23CA69BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  FunctionTypeMetadata3 = swift_getFunctionTypeMetadata3();
  uint64_t v8 = swift_bridgeObjectRetain();
  if (MEMORY[0x23ECEF4E0](v8, FunctionTypeMetadata3))
  {
    uint64_t v9 = 0;
    uint64_t v10 = a4 + 40;
    while (1)
    {
      char v11 = sub_23CA6A850();
      sub_23CA6A830();
      if ((v11 & 1) == 0) {
        break;
      }
      uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 - 8);
      uint64_t v13 = v9 + 1;
      BOOL v14 = __OFADD__(v9, 1);
      uint64_t result = swift_retain();
      if (v14) {
        goto LABEL_13;
      }
      v12(a1, a2, a3);
      swift_release();
      ++v9;
      v10 += 16;
      if (v13 == MEMORY[0x23ECEF4E0](a4, FunctionTypeMetadata3)) {
        goto LABEL_9;
      }
    }
    uint64_t result = sub_23CA6A9A0();
    __break(1u);
LABEL_13:
    __break(1u);
  }
  else
  {
LABEL_9:
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23CA69D18()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23CA69D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA69BD8(a1, a2, a3, *(void *)(v3 + 40));
}

uint64_t (*pullback<A, B, C, D, E, F, G, H>(_:action:featureConfiguration:generalConfiguration:localConfiguration:topicConfigurations:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a8;
  v16[3] = a3;
  void v16[4] = a1;
  v16[5] = a2;
  v16[6] = a4;
  v16[7] = a5;
  v16[8] = a6;
  v16[9] = a7;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return sub_23CA6A39C;
}

uint64_t sub_23CA69E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, char *, char *, char *, char *, char *), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v54 = a6;
  uint64_t v55 = a5;
  uint64_t v52 = a3;
  uint64_t v53 = a1;
  uint64_t v47 = a7;
  uint64_t v49 = a9;
  uint64_t v50 = a8;
  uint64_t v10 = *a10;
  v51 = a10;
  uint64_t v48 = *(void *)(v10 + *MEMORY[0x263F8EA20] + 8);
  uint64_t v46 = *(void *)(v48 - 8);
  uint64_t v11 = MEMORY[0x270FA5388]((*(void *)(v46 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (char *)&v40 - v11;
  uint64_t v45 = *(void *)(v13 + v14);
  uint64_t v44 = *(void *)(v45 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v11);
  uint64_t v17 = (char *)&v40 - v16;
  uint64_t v43 = *(void *)(v18 + v19);
  uint64_t v42 = *(void *)(v43 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v15);
  char v22 = (char *)&v40 - v21;
  uint64_t v41 = *(void *)(v23 + v24);
  uint64_t v40 = *(void *)(v41 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v20);
  uint64_t v27 = (char *)&v40 - v26;
  uint64_t v30 = *(void *)(v28 + v29);
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = MEMORY[0x270FA5388](v25);
  uint64_t v34 = (char *)&v40 - v33;
  uint64_t v35 = *(void *)(v30 + 16);
  uint64_t v36 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v38 = (char *)&v40 - v37;
  swift_getAtKeyPath();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v34, v30);
  }
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v38, v34, v35);
  swift_getAtKeyPath();
  swift_getAtKeyPath();
  swift_getAtKeyPath();
  swift_getAtKeyPath();
  v55(v53, v38, v27, v22, v17, v12);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v12, v48);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v17, v45);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v22, v43);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v27, v41);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v38, v35);
}

uint64_t sub_23CA6A33C()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_23CA6A39C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA69E2C(a1, a2, a3, *(void *)(v3 + 24), *(void (**)(uint64_t, char *, char *, char *, char *, char *))(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), *(void *)(v3 + 64), *(void **)(v3 + 72));
}

uint64_t (*(*logging<A, B, C>(log:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1, uint64_t a2))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = a4;
  v8[5] = a1;
  id v9 = a1;
  return sub_23CA6A520;
}

uint64_t (*sub_23CA6A450(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a4;
  uint64_t v12[3] = a5;
  v12[4] = a6;
  v12[5] = a1;
  v12[6] = a2;
  v12[7] = a3;
  swift_retain();
  id v13 = a3;
  return sub_23CA6A67C;
}

uint64_t sub_23CA6A4E8()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t (*sub_23CA6A520(uint64_t a1, uint64_t a2))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA6A450(a1, a2, *(void **)(v2 + 40), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_23CA6A52C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC22A88);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23CA6B690;
  sub_23CA6AA60();
  *(void *)(v4 + 56) = MEMORY[0x263F8D310];
  *(void *)(v4 + 64) = sub_23CA6A6AC();
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0xE000000000000000;
  sub_23CA6A950();
  sub_23CA6A720();
  return swift_bridgeObjectRelease();
}

uint64_t with<A, B>(_:_:)(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_23CA6A63C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_23CA6A67C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CA6A52C(a1, a2, a3, *(void (**)(void))(v3 + 40));
}

unint64_t sub_23CA6A6AC()
{
  unint64_t result = qword_26AC22A90;
  if (!qword_26AC22A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC22A90);
  }
  return result;
}

uint64_t _s10Foundation4DateV10XavierCoreE4zeroACvgZ_0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_23CA6A710()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_23CA6A720()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_23CA6A730()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t _sSa10XavierCoreSeRzSERzAA8DiffableRzlE4zeroSayxGvgZ_0()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_23CA6A760()
{
  return MEMORY[0x270F9D0E8]();
}

uint64_t sub_23CA6A770()
{
  return MEMORY[0x270F9D168]();
}

uint64_t sub_23CA6A780()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_23CA6A790()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_23CA6A7A0()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_23CA6A7B0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23CA6A7C0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23CA6A7D0()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_23CA6A7E0()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_23CA6A7F0()
{
  return MEMORY[0x270F9D990]();
}

uint64_t sub_23CA6A800()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_23CA6A810()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_23CA6A820()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t sub_23CA6A830()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_23CA6A840()
{
  return MEMORY[0x270F9DC08]();
}

uint64_t sub_23CA6A850()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_23CA6A860()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_23CA6A870()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t sub_23CA6A880()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_23CA6A890()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_23CA6A8A0()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_23CA6A8B0()
{
  return MEMORY[0x270F9DD10]();
}

uint64_t sub_23CA6A8C0()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_23CA6A8D0()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_23CA6A8E0()
{
  return MEMORY[0x270F9DF60]();
}

uint64_t sub_23CA6A8F0()
{
  return MEMORY[0x270F9DF70]();
}

uint64_t sub_23CA6A900()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t sub_23CA6A910()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_23CA6A920()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_23CA6A930()
{
  return MEMORY[0x270F9E168]();
}

uint64_t sub_23CA6A940()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_23CA6A950()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23CA6A960()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23CA6A970()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23CA6A980()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_23CA6A990()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23CA6A9A0()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_23CA6A9B0()
{
  return MEMORY[0x270F9F010]();
}

uint64_t sub_23CA6A9C0()
{
  return MEMORY[0x270F9F018]();
}

uint64_t sub_23CA6A9D0()
{
  return MEMORY[0x270F9F030]();
}

uint64_t sub_23CA6A9E0()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_23CA6A9F0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_23CA6AA00()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_23CA6AA10()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_23CA6AA20()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_23CA6AA30()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_23CA6AA40()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_23CA6AA50()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23CA6AA60()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_23CA6AA70()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23CA6AA80()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_23CA6AA90()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_23CA6AAA0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_23CA6AAB0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_23CA6AAC0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23CA6AAD0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23CA6AAE0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23CA6AAF0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_23CA6AB00()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x270FA0150]();
}

void bzero(void *a1, size_t a2)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
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

uint64_t swift_getFunctionTypeMetadata3()
{
  return MEMORY[0x270FA03A0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}