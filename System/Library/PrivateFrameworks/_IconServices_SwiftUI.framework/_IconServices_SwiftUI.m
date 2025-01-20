uint64_t keypath_get_6Tm@<X0>(void (*a1)(void)@<X3>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  a1();
  result = sub_2627DBF90();
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v5;
  return result;
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
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

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void type metadata accessor for ISImageDescriptorName(uint64_t a1)
{
}

void type metadata accessor for ISIconShape(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2627CCE20(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2627CCE40(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_2627CCE7C()
{
  return sub_2627CD6DC(&qword_26A962AD0, type metadata accessor for ISIconShape);
}

id sub_2627CCEC4()
{
  id result = objc_msgSend(self, sel_defaultValue);
  if (result)
  {
    self;
    id result = (id)swift_dynamicCastObjCClass();
    if (result)
    {
      qword_26A962CC8 = (uint64_t)result;
      return result;
    }
    id result = (id)swift_unknownObjectRelease();
  }
  qword_26A962CC8 = 0;
  return result;
}

void sub_2627CCF40(uint64_t a1)
{
}

void sub_2627CCF58(uint64_t a1)
{
}

void sub_2627CCF70(uint64_t a1, SEL *a2, uint64_t *a3, void *a4)
{
  id v6 = [self *a2];
  uint64_t v7 = sub_2627DC180();
  uint64_t v9 = v8;

  *a3 = v7;
  *a4 = v9;
}

id sub_2627CCFE0()
{
  id result = objc_msgSend(self, sel_affectsColorAppearance);
  byte_26B420718 = (char)result;
  return result;
}

id sub_2627CD014@<X0>(void *a1@<X8>)
{
  if (qword_26B420608 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26A962CC8;
  *a1 = qword_26A962CC8;
  return v2;
}

uint64_t sub_2627CD080(uint64_t a1, uint64_t a2)
{
  return sub_2627CD0D0(a1, a2, &qword_26B420600, &qword_26B420708);
}

uint64_t sub_2627CD0A8(uint64_t a1, uint64_t a2)
{
  return sub_2627CD0D0(a1, a2, &qword_26B420618, &qword_26B420720);
}

uint64_t sub_2627CD0D0(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_2627CD128()
{
  if (qword_26B420610 != -1) {
    swift_once();
  }
  return byte_26B420718;
}

uint64_t sub_2627CD17C()
{
  return sub_2627DBE70();
}

void sub_2627CD1D8(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_2627CD1E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_2627CD9BC();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_2627CD244()
{
  sub_2627CDB44();
  sub_2627DBF80();
  return v1;
}

uint64_t sub_2627CD280@<X0>(void *a1@<X8>)
{
  sub_2627CDAF0();
  uint64_t result = sub_2627DC250();
  *a1 = v3;
  return result;
}

uint64_t sub_2627CD2D0(uint64_t a1, void **a2)
{
  v2 = *a2;
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  id v3 = v2;
  return sub_2627CD17C();
}

BOOL sub_2627CD320(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2627CD334(uint64_t a1, uint64_t a2)
{
  return sub_2627CD784(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_2627CD34C(uint64_t a1, id *a2)
{
  uint64_t result = sub_2627DC160();
  *a2 = 0;
  return result;
}

uint64_t sub_2627CD3C4(uint64_t a1, id *a2)
{
  char v3 = sub_2627DC170();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2627CD444@<X0>(uint64_t *a1@<X8>)
{
  sub_2627DC180();
  uint64_t v2 = sub_2627DC150();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2627CD48C()
{
  return sub_2627DC330();
}

uint64_t sub_2627CD4BC()
{
  return sub_2627DC350();
}

uint64_t sub_2627CD504()
{
  return sub_2627DC350();
}

void *sub_2627CD548@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2627CD558(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_2627CD564@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2627DC150();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2627CD5AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2627DC180();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2627CD5D8(uint64_t a1)
{
  uint64_t v2 = sub_2627CD6DC(&qword_26A962B10, type metadata accessor for ISImageDescriptorName);
  uint64_t v3 = sub_2627CD6DC(&qword_26A962B18, type metadata accessor for ISImageDescriptorName);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2627CD694()
{
  return sub_2627CD6DC(&qword_26A962AD8, type metadata accessor for ISImageDescriptorName);
}

uint64_t sub_2627CD6DC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2627CD724()
{
  return sub_2627CD6DC(&qword_26A962AE0, type metadata accessor for ISImageDescriptorName);
}

uint64_t sub_2627CD76C(uint64_t a1, uint64_t a2)
{
  return sub_2627CD784(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2627CD784(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2627DC180();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2627CD7C8()
{
  sub_2627DC180();
  sub_2627DC190();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2627CD81C()
{
  sub_2627DC180();
  sub_2627DC320();
  sub_2627DC190();
  uint64_t v0 = sub_2627DC350();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2627CD890()
{
  uint64_t v0 = sub_2627DC180();
  uint64_t v2 = v1;
  if (v0 == sub_2627DC180() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2627DC2D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2627CD91C()
{
  return sub_2627CD6DC(&qword_26A962AE8, type metadata accessor for ISImageDescriptorName);
}

unint64_t sub_2627CD968()
{
  unint64_t result = qword_26B4205F0;
  if (!qword_26B4205F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B4205F0);
  }
  return result;
}

unint64_t sub_2627CD9BC()
{
  unint64_t result = qword_26A962AF0;
  if (!qword_26A962AF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A962AF8);
    sub_2627CD6DC(&qword_26A962B00, (void (*)(uint64_t))sub_2627CDA60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A962AF0);
  }
  return result;
}

unint64_t sub_2627CDA60()
{
  unint64_t result = qword_26A962B08;
  if (!qword_26A962B08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A962B08);
  }
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t sub_2627CDAF0()
{
  unint64_t result = qword_26B420620;
  if (!qword_26B420620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B420620);
  }
  return result;
}

unint64_t sub_2627CDB44()
{
  unint64_t result = qword_26B4205F8;
  if (!qword_26B4205F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B4205F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for _HomeScreenIconStyleTrait()
{
  return &type metadata for _HomeScreenIconStyleTrait;
}

ValueMetadata *type metadata accessor for HomeScreenIconModeKey()
{
  return &type metadata for HomeScreenIconModeKey;
}

void type metadata accessor for IFAppearanceVariant(uint64_t a1)
{
}

void type metadata accessor for IFAppearance(uint64_t a1)
{
}

void sub_2627CDBE0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2627CDC28()
{
  return sub_2627CD6DC(&qword_26A962B30, type metadata accessor for IFAppearance);
}

uint64_t sub_2627CDC70()
{
  return sub_2627CD6DC(&qword_26A962B38, type metadata accessor for IFAppearanceVariant);
}

void *sub_2627CDCC8(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *a1 = *a2;
    a1 = (void *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2627DBEB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2627DBFE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    uint64_t v15 = sub_2627DBEE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    v18 = (char *)a1 + v16;
    v19 = (char *)a2 + v16;
    *(void *)v18 = *(void *)v19;
    v18[8] = v19[8];
    *((unsigned char *)a1 + v17) = *((unsigned char *)a2 + v17);
    uint64_t v20 = a3[10];
    *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
    *(void *)((char *)a1 + v20) = *(void *)((char *)a2 + v20);
    uint64_t v21 = a3[11];
    v22 = *(void **)((char *)a2 + v21);
    *(void *)((char *)a1 + v21) = v22;
    id v23 = v22;
  }
  return a1;
}

void sub_2627CDE68(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_2627DBEB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_2627DBFE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = sub_2627DBEE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = *(void **)(a1 + a2[11]);
}

uint64_t sub_2627CDF64(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2627DBEB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2627DBFE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_2627DBEE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v15;
  uint64_t v18 = a2 + v15;
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  *(unsigned char *)(a1 + v16) = *(unsigned char *)(a2 + v16);
  uint64_t v19 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v19) = *(void *)(a2 + v19);
  uint64_t v20 = a3[11];
  uint64_t v21 = *(void **)(a2 + v20);
  *(void *)(a1 + v20) = v21;
  id v22 = v21;
  return a1;
}

uint64_t sub_2627CE0B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2627DBEB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2627DBFE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_2627DBEE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v18 = *v17;
  *(unsigned char *)(v16 + 8) = *((unsigned char *)v17 + 8);
  *(void *)uint64_t v16 = v18;
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  uint64_t v19 = a3[11];
  uint64_t v20 = *(void **)(a1 + v19);
  uint64_t v21 = *(void **)(a2 + v19);
  *(void *)(a1 + v19) = v21;
  id v22 = v21;

  return a1;
}

uint64_t sub_2627CE214(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2627DBEB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2627DBFE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_2627DBEE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v15;
  uint64_t v18 = a2 + v15;
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  *(unsigned char *)(a1 + v16) = *(unsigned char *)(a2 + v16);
  uint64_t v19 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v19) = *(void *)(a2 + v19);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_2627CE360(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2627DBEB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2627DBFE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_2627DBEE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v15;
  uint64_t v18 = a2 + v15;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(a1 + v16) = *(unsigned char *)(a2 + v16);
  uint64_t v19 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v19) = *(void *)(a2 + v19);
  uint64_t v20 = a3[11];
  uint64_t v21 = *(void **)(a1 + v20);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);

  return a1;
}

uint64_t sub_2627CE4B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2627CE4C8);
}

uint64_t sub_2627CE4C8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2627DBEB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_2627DBFE0();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = sub_2627DBEE0();
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[11]);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  int v17 = v16 - 1;
  if (v17 < 0) {
    int v17 = -1;
  }
  return (v17 + 1);
}

uint64_t sub_2627CE634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2627CE648);
}

uint64_t sub_2627CE648(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_2627DBEB0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_2627DBFE0();
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = sub_2627DBEE0();
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[11]) = a2;
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[6];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for IconEnvironmentTraits()
{
  uint64_t result = qword_26B420538;
  if (!qword_26B420538) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2627CE7F0()
{
  uint64_t result = sub_2627DBEB0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2627DBFE0();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_2627DBEE0();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_2627CE920()
{
  return sub_2627CEDBC(&qword_26B420530, (void (*)(uint64_t))type metadata accessor for IconEnvironmentTraits);
}

void sub_2627CE968()
{
  sub_2627DBEB0();
  sub_2627CEDBC(&qword_26A962B48, MEMORY[0x263F18520]);
  sub_2627DC140();
  unint64_t v1 = (int *)type metadata accessor for IconEnvironmentTraits();
  sub_2627DBFE0();
  sub_2627CEDBC(&qword_26A962B50, MEMORY[0x263F19988]);
  sub_2627DC140();
  sub_2627DBEE0();
  sub_2627CEDBC(&qword_26A962B58, MEMORY[0x263F18DD8]);
  sub_2627DC140();
  if (*(unsigned char *)(v0 + v1[7] + 8) == 1)
  {
    sub_2627DC340();
  }
  else
  {
    sub_2627DC340();
    sub_2627DC330();
  }
  if (*(unsigned char *)(v0 + v1[8]) != 2) {
    sub_2627DC340();
  }
  sub_2627DC340();
  sub_2627DC330();
  sub_2627DC330();
  unint64_t v2 = *(void **)(v0 + v1[11]);
  if (v2)
  {
    sub_2627DC340();
    id v3 = v2;
    sub_2627DC270();
  }
  else
  {
    sub_2627DC340();
  }
}

uint64_t sub_2627CEBA0()
{
  return sub_2627DC350();
}

uint64_t sub_2627CEBE4()
{
  return sub_2627DC350();
}

uint64_t sub_2627CEC24(uint64_t a1, uint64_t a2)
{
  if ((sub_2627DBEA0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = (int *)type metadata accessor for IconEnvironmentTraits();
  if ((sub_2627DBEA0() & 1) == 0 || (sub_2627DBED0() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = v4[7];
  uint64_t v6 = (void *)(a1 + v5);
  char v7 = *(unsigned char *)(a1 + v5 + 8);
  uint64_t v8 = (void *)(a2 + v5);
  int v9 = *(unsigned __int8 *)(a2 + v5 + 8);
  if (v7)
  {
    if (!v9) {
      return 0;
    }
  }
  else
  {
    if (*v6 != *v8) {
      LOBYTE(v9) = 1;
    }
    if (v9) {
      return 0;
    }
  }
  uint64_t v10 = v4[8];
  int v11 = *(unsigned __int8 *)(a1 + v10);
  int v12 = *(unsigned __int8 *)(a2 + v10);
  if (v11 == 2)
  {
    if (v12 != 2) {
      return 0;
    }
LABEL_15:
    if (*(void *)(a1 + v4[9]) != *(void *)(a2 + v4[9]) || *(void *)(a1 + v4[10]) != *(void *)(a2 + v4[10])) {
      return 0;
    }
    uint64_t v15 = v4[11];
    unint64_t v16 = *(void **)(a1 + v15);
    int v17 = *(void **)(a2 + v15);
    if (v16)
    {
      if (!v17) {
        return 0;
      }
      sub_2627CED7C();
      id v18 = v17;
      id v19 = v16;
      char v20 = sub_2627DC260();

      if ((v20 & 1) == 0) {
        return 0;
      }
    }
    else if (v17)
    {
      return 0;
    }
    return 1;
  }
  uint64_t result = 0;
  BOOL v14 = (v11 & 1) == 0;
  if (v12 != 2 && ((v14 ^ v12) & 1) != 0) {
    goto LABEL_15;
  }
  return result;
}

unint64_t sub_2627CED7C()
{
  unint64_t result = qword_26A962B40;
  if (!qword_26A962B40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A962B40);
  }
  return result;
}

uint64_t sub_2627CEDBC(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_2627CEE04(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
}

uint64_t sub_2627CEE14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_2627CFD4C();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

void sub_2627CEE78(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2627CEE84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_2627CFCE0();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_2627CEEE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_2627CFC3C();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

void sub_2627CEF4C(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t sub_2627CEF5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_2627CFB74();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

void sub_2627CEFC0(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_2627CEFC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, MEMORY[0x263F8D510]);
}

uint64_t sub_2627CEFD4()
{
  sub_2627CFAD0();
  sub_2627DBF90();
  return v1;
}

uint64_t sub_2627CF014()
{
  sub_2627CFA7C();
  sub_2627DBF90();
  return v1;
}

uint64_t sub_2627CF050()
{
  return sub_2627CF090((void (*)(void))sub_2627CFA28);
}

uint64_t sub_2627CF070()
{
  return sub_2627CF090((void (*)(void))sub_2627CF9D4);
}

uint64_t sub_2627CF090(void (*a1)(void))
{
  a1();
  sub_2627DBF90();
  return v2;
}

uint64_t sub_2627CF0DC()
{
  sub_2627CF980();
  sub_2627DBF90();
  return v1;
}

uint64_t View.iconSize(_:)()
{
  return swift_release();
}

double sub_2627CF1A4@<D0>(uint64_t a1@<X8>)
{
  sub_2627CFAD0();
  sub_2627DBF90();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return result;
}

double sub_2627CF1FC@<D0>(uint64_t a1@<X8>)
{
  sub_2627CFAD0();
  sub_2627DBF90();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_2627CF254()
{
  return sub_2627DBFA0();
}

uint64_t sub_2627CF2A8()
{
  return sub_2627DBFA0();
}

uint64_t View.iconDrawsBorder(_:)()
{
  return swift_release();
}

uint64_t sub_2627CF370@<X0>(unsigned char *a1@<X8>)
{
  sub_2627CFA7C();
  uint64_t result = sub_2627DBF90();
  *a1 = v3;
  return result;
}

uint64_t sub_2627CF3C0@<X0>(unsigned char *a1@<X8>)
{
  sub_2627CFA7C();
  uint64_t result = sub_2627DBF90();
  *a1 = v3;
  return result;
}

uint64_t sub_2627CF410()
{
  return sub_2627DBFA0();
}

uint64_t sub_2627CF45C()
{
  return sub_2627DBFA0();
}

uint64_t View.iconShape(_:)()
{
  return sub_2627CF540();
}

uint64_t sub_2627CF4B4@<X0>(uint64_t a1@<X8>)
{
  return keypath_get_6Tm((void (*)(void))sub_2627CFA28, a1);
}

uint64_t sub_2627CF4D4@<X0>(uint64_t a1@<X8>)
{
  return keypath_get_6Tm((void (*)(void))sub_2627CFA28, a1);
}

uint64_t sub_2627CF4F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_7Tm(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_2627CFA28);
}

uint64_t sub_2627CF514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_7Tm(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_2627CFA28);
}

uint64_t View.iconScale(_:)()
{
  return sub_2627CF540();
}

uint64_t sub_2627CF540()
{
  return swift_release();
}

uint64_t sub_2627CF5C4@<X0>(uint64_t a1@<X8>)
{
  return keypath_get_6Tm((void (*)(void))sub_2627CF9D4, a1);
}

uint64_t sub_2627CF5E4@<X0>(uint64_t a1@<X8>)
{
  return keypath_get_6Tm((void (*)(void))sub_2627CF9D4, a1);
}

uint64_t sub_2627CF604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_7Tm(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_2627CF9D4);
}

uint64_t keypath_set_7Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  return sub_2627DBFA0();
}

uint64_t sub_2627CF67C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_7Tm(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_2627CF9D4);
}

uint64_t View.disableIconEnviromentSettings(_:)()
{
  return swift_release();
}

uint64_t sub_2627CF710@<X0>(unsigned char *a1@<X8>)
{
  sub_2627CF980();
  uint64_t result = sub_2627DBF90();
  *a1 = v3;
  return result;
}

uint64_t sub_2627CF760@<X0>(unsigned char *a1@<X8>)
{
  sub_2627CF980();
  uint64_t result = sub_2627DBF90();
  *a1 = v3;
  return result;
}

uint64_t sub_2627CF7B0()
{
  return sub_2627DBFA0();
}

uint64_t sub_2627CF7FC()
{
  return sub_2627DBFA0();
}

uint64_t sub_2627CF848(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySo6CGSizeVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(a1, &qword_26B420640, &qword_26B420638);
}

uint64_t sub_2627CF85C(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySo6CGSizeVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(a1, &qword_26B420630, &qword_26B420628);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySo6CGSizeVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  return swift_getWitnessTable();
}

uint64_t sub_2627CF8F4(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySo6CGSizeVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(a1, &qword_26A962B60, &qword_26A962B68);
}

uint64_t sub_2627CF908(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySo6CGSizeVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(a1, &qword_26A962B70, &qword_26A962B78);
}

uint64_t sub_2627CF91C(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySo6CGSizeVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(a1, &qword_26A962B80, &qword_26A962B88);
}

uint64_t sub_2627CF930(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_2627CF980()
{
  unint64_t result = qword_26A962B90;
  if (!qword_26A962B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A962B90);
  }
  return result;
}

unint64_t sub_2627CF9D4()
{
  unint64_t result = qword_26B420408;
  if (!qword_26B420408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B420408);
  }
  return result;
}

unint64_t sub_2627CFA28()
{
  unint64_t result = qword_26B420568;
  if (!qword_26B420568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B420568);
  }
  return result;
}

unint64_t sub_2627CFA7C()
{
  unint64_t result = qword_26B420528;
  if (!qword_26B420528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B420528);
  }
  return result;
}

unint64_t sub_2627CFAD0()
{
  unint64_t result = qword_26B420560;
  if (!qword_26B420560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B420560);
  }
  return result;
}

ValueMetadata *type metadata accessor for IconSizeKey()
{
  return &type metadata for IconSizeKey;
}

ValueMetadata *type metadata accessor for IconDrawsBorderKey()
{
  return &type metadata for IconDrawsBorderKey;
}

ValueMetadata *type metadata accessor for IconShapeKey()
{
  return &type metadata for IconShapeKey;
}

ValueMetadata *type metadata accessor for IconScaleKey()
{
  return &type metadata for IconScaleKey;
}

ValueMetadata *type metadata accessor for DisableIconEnviromentSettingsKey()
{
  return &type metadata for DisableIconEnviromentSettingsKey;
}

unint64_t sub_2627CFB74()
{
  unint64_t result = qword_26A962B98;
  if (!qword_26A962B98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A962BA0);
    sub_2627CFBE8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A962B98);
  }
  return result;
}

unint64_t sub_2627CFBE8()
{
  unint64_t result = qword_26A962BA8;
  if (!qword_26A962BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A962BA8);
  }
  return result;
}

unint64_t sub_2627CFC3C()
{
  unint64_t result = qword_26A962BB0;
  if (!qword_26A962BB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A962BB8);
    sub_2627CFDF0(&qword_26A962AD0, type metadata accessor for ISIconShape);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A962BB0);
  }
  return result;
}

unint64_t sub_2627CFCE0()
{
  unint64_t result = qword_26B420650;
  if (!qword_26B420650)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B420648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B420650);
  }
  return result;
}

unint64_t sub_2627CFD4C()
{
  unint64_t result = qword_26B420668[0];
  if (!qword_26B420668[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B420660);
    sub_2627CFDF0(&qword_26B420658, type metadata accessor for CGSize);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B420668);
  }
  return result;
}

uint64_t sub_2627CFDF0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t AsyncIconImagePhase.image.getter()
{
  if (*v0 >> 62) {
    return 0;
  }
  else {
    return swift_retain();
  }
}

uint64_t AsyncIconImagePhase.error.getter()
{
  uint64_t v1 = *v0;
  if ((unint64_t)*v0 >> 62 != 1) {
    return 0;
  }
  uint64_t v2 = v1 & 0x3FFFFFFFFFFFFFFFLL;
  id v3 = (id)(v1 & 0x3FFFFFFFFFFFFFFFLL);
  return v2;
}

double sub_2627CFEB0(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 40);
  uint64_t v3 = *(void *)v2;
  char v4 = *(unsigned char *)(v2 + 8);
  sub_2627D6FC8(*(void *)v2, v4);
  double v5 = sub_2627D4FC0(v3, v4);
  sub_2627D5CFC(v3, v4);
  return v5;
}

uint64_t sub_2627CFF10(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 48);
  uint64_t v3 = *(void *)v2;
  uint64_t v4 = *(void *)(v2 + 8);
  uint64_t v5 = *(unsigned __int8 *)(v2 + 16);
  int v6 = *(unsigned __int8 *)(v2 + 17);
  sub_2627D6FD4(*(void *)v2, v4, v5, *(unsigned char *)(v2 + 17));
  uint64_t v7 = sub_2627D51A0(v3, v4, v5 | (v6 << 8));
  sub_2627D5D08(v3, v4, v5, v6);
  return v7;
}

uint64_t sub_2627CFFB0(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 52);
  uint64_t v3 = *(void *)v2;
  char v4 = *(unsigned char *)(v2 + 8);
  sub_2627D6FC8(*(void *)v2, v4);
  uint64_t v5 = sub_2627D53A4(v3, v4);
  sub_2627D5CFC(v3, v4);
  return v5;
}

uint64_t sub_2627D0010(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 56);
  uint64_t v3 = *(void *)v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 8);
  int v5 = *(unsigned __int8 *)(v2 + 9);
  sub_2627D6FE0(*(void *)v2, v4, *(unsigned char *)(v2 + 9));
  uint64_t v6 = sub_2627D558C(v3, v4 | (v5 << 8), 0xD000000000000015, 0x80000002627DE7E0, (void (*)(void, void, void))sub_2627DBE2C);
  sub_2627D5D14(v3, v4, v5);
  return v6;
}

uint64_t sub_2627D00C0(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 60);
  uint64_t v3 = *(void *)v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 8);
  int v5 = *(unsigned __int8 *)(v2 + 9);
  sub_2627D6FE0(*(void *)v2, v4, *(unsigned char *)(v2 + 9));
  uint64_t v6 = sub_2627D558C(v3, v4 | (v5 << 8), 0xD000000000000011, 0x80000002627DE7C0, (void (*)(void, void, void))sub_2627D5D14);
  sub_2627D5D14(v3, v4, v5);
  return v6;
}

uint64_t sub_2627D0170(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 64);
  uint64_t v3 = *(void *)v2;
  char v4 = *(unsigned char *)(v2 + 8);
  sub_2627D6FC8(*(void *)v2, v4);
  char v5 = sub_2627D578C(v3, v4);
  sub_2627D5CFC(v3, v4);
  return v5 & 1;
}

uint64_t sub_2627D01D0(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 68);
  id v3 = *(id *)v2;
  char v4 = *(unsigned char *)(v2 + 8);
  sub_2627D6FEC(*(id *)v2, v4);
  uint64_t v5 = sub_2627D5964(v3, v4);
  sub_2627D5D20(v3, v4);
  return v5;
}

uint64_t sub_2627D0230(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AsyncIconImage.LoadingState();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - v4, a1, v2);
  sub_2627DC0C0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t sub_2627D0324()
{
  return sub_2627DC0D0();
}

uint64_t sub_2627D036C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = (int *)type metadata accessor for AsyncIconImage.LoadingState();
  *a1 = 0;
  a1[1] = 0;
  uint64_t v3 = (char *)a1 + v2[10];
  uint64_t v4 = type metadata accessor for IconEnvironmentTraits();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(void *)((char *)a1 + v2[11]) = 0;
  *(void *)((char *)a1 + v2[12]) = 0x8000000000000000;
  return result;
}

uint64_t sub_2627D0408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2627DBEB0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v35 - v9;
  if (sub_2627D0170(a1))
  {
    uint64_t v11 = type metadata accessor for IconEnvironmentTraits();
    int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    return v12(a2, 1, 1, v11);
  }
  else
  {
    BOOL v14 = (void *)sub_2627D01D0(a1);
    if (v14)
    {
      uint64_t v15 = v14;
      id v16 = objc_msgSend(v14, sel_configurationType);
      if (v16 == (id)3)
      {
        id v22 = objc_msgSend(v15, sel_tintColor);
        if (v22)
        {
          id v23 = v22;
          id v24 = objc_msgSend(v22, sel_UIColor);
          id v25 = objc_msgSend(v24, sel_CGColor);

          id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B4F0]), sel_initWithCGColor_, v25);
        }
        else
        {

          id v19 = 0;
        }
        uint64_t v18 = 2;
        uint64_t v17 = 1;
      }
      else if (v16 == (id)2)
      {

        id v19 = 0;
        uint64_t v17 = 1;
        uint64_t v18 = 1;
      }
      else if (v16 == (id)1)
      {

        uint64_t v17 = 0;
        uint64_t v18 = 0;
        id v19 = 0;
      }
      else
      {
        v40 = (uint64_t (*)(void))MEMORY[0x263F18520];
        sub_2627D4D38(&qword_26B420570, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v10);
        unsigned int v39 = *MEMORY[0x263F184F8];
        v38 = *(void (**)(char *))(v5 + 104);
        v38(v8);
        uint64_t v26 = sub_2627DBEA0();
        v27 = *(void (**)(char *, uint64_t))(v5 + 8);
        uint64_t v36 = v26;
        v37 = v27;
        v27(v8, v4);
        v27(v10, v4);
        v36 &= 1u;
        sub_2627D4D38(&qword_26B420570, v40, 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v10);
        ((void (*)(char *, void, uint64_t))v38)(v8, v39, v4);
        uint64_t v18 = v36;
        LOBYTE(v27) = sub_2627DBEA0();

        v28 = v37;
        v37(v8, v4);
        v28(v10, v4);
        id v19 = 0;
        uint64_t v17 = v27 & 1;
      }
    }
    else
    {
      sub_2627D4D38(&qword_26B420570, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v10);
      (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, *MEMORY[0x263F184F8], v4);
      char v20 = sub_2627DBEA0();
      uint64_t v21 = *(void (**)(char *, uint64_t))(v5 + 8);
      v21(v8, v4);
      v21(v10, v4);
      uint64_t v17 = 0;
      id v19 = 0;
      uint64_t v18 = v20 & 1;
    }
    sub_2627D4D38(&qword_26B420570, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, a2);
    v29 = (int *)type metadata accessor for IconEnvironmentTraits();
    sub_2627D4D38(&qword_26B420590, MEMORY[0x263F19988], 0xD000000000000013, 0x80000002627DE800, a2 + v29[5]);
    sub_2627D4D38(&qword_26B420580, MEMORY[0x263F18DD8], 0x694474756F79614CLL, 0xEF6E6F6974636572, a2 + v29[6]);
    uint64_t v30 = sub_2627D0010(a1);
    char v32 = v31;
    char v33 = sub_2627CFFB0(a1);
    uint64_t v34 = a2 + v29[7];
    *(void *)uint64_t v34 = v30;
    *(unsigned char *)(v34 + 8) = v32 & 1;
    *(unsigned char *)(a2 + v29[8]) = v33;
    *(void *)(a2 + v29[9]) = v18;
    *(void *)(a2 + v29[10]) = v17;
    *(void *)(a2 + v29[11]) = v19;
    return (*(uint64_t (**)(uint64_t, void, uint64_t, int *))(*((void *)v29 - 1) + 56))(a2, 0, 1, v29);
  }
}

uint64_t AsyncIconImage.init<>(icon:descriptor:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  id v7 = a2;
  id v8 = a1;
  return sub_2627D0BD4((uint64_t)v8, (uint64_t)a2, 0, (uint64_t)sub_2627D0BCC, v6, a3);
}

void sub_2627D0A6C(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v5 = *a1;
  if (!((unint64_t)*a1 >> 62))
  {
    swift_retain();
LABEL_10:
    *a4 = v5;
    return;
  }
  if (a3) {
    id v8 = a3;
  }
  else {
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B558]), sel_init);
  }
  id v9 = a3;
  uint64_t v5 = sub_2627DC0B0();
  id v10 = objc_msgSend(a2, sel_imageForDescriptor_, v8);
  if (!v10)
  {

    goto LABEL_10;
  }
  uint64_t v11 = v10;
  if (objc_msgSend(v10, sel_CGImage))
  {
    objc_msgSend(v11, sel_scale);
    uint64_t v12 = sub_2627DC0A0();

    swift_release();
    uint64_t v5 = v12;
    goto LABEL_10;
  }
  __break(1u);
}

uint64_t sub_2627D0B8C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2627D0BCC(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2627D0A6C(a1, *(void **)(v2 + 16), *(void **)(v2 + 24), a2);
}

uint64_t sub_2627D0BD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v33 = a4;
  uint64_t v34 = a5;
  uint64_t v31 = a2;
  uint64_t v32 = a3;
  id v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_26B420498);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (uint64_t *)((char *)&v31 - v12);
  *a6 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420570);
  swift_storeEnumTagMultiPayload();
  BOOL v14 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B420520);
  uint64_t v15 = (uint64_t *)((char *)a6 + v14[9]);
  *uint64_t v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420580);
  swift_storeEnumTagMultiPayload();
  id v16 = (char *)a6 + v14[10];
  *(void *)id v16 = swift_getKeyPath();
  v16[8] = 0;
  uint64_t v17 = (uint64_t *)((char *)a6 + v14[11]);
  *uint64_t v17 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420590);
  swift_storeEnumTagMultiPayload();
  uint64_t v18 = (char *)a6 + v14[12];
  *(void *)uint64_t v18 = swift_getKeyPath();
  *((void *)v18 + 1) = 0;
  *((_WORD *)v18 + 8) = 0;
  id v19 = (char *)a6 + v14[13];
  *(void *)id v19 = swift_getKeyPath();
  v19[8] = 0;
  char v20 = (char *)a6 + v14[14];
  *(void *)char v20 = swift_getKeyPath();
  *((_WORD *)v20 + 4) = 0;
  uint64_t v21 = (char *)a6 + v14[15];
  *(void *)uint64_t v21 = swift_getKeyPath();
  *((_WORD *)v21 + 4) = 0;
  id v22 = (char *)a6 + v14[16];
  *(void *)id v22 = swift_getKeyPath();
  v22[8] = 0;
  id v23 = (char *)a6 + v14[17];
  *(void *)id v23 = swift_getKeyPath();
  v23[8] = 0;
  uint64_t v24 = v14[19];
  *(uint64_t *)((char *)a6 + v24) = 0;
  void *v13 = 0;
  v13[1] = 0;
  id v25 = (char *)v13 + v8[10];
  uint64_t v26 = type metadata accessor for IconEnvironmentTraits();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 1, 1, v26);
  *(void *)((char *)v13 + v8[11]) = 0;
  *(void *)((char *)v13 + v8[12]) = 0x8000000000000000;
  sub_2627DBCD4((uint64_t)v13, (uint64_t)v11, qword_26B420498);
  sub_2627DC0C0();
  uint64_t result = sub_2627DBD38((uint64_t)v13, qword_26B420498);
  *(uint64_t *)((char *)a6 + v14[23]) = 0;
  *(uint64_t *)((char *)a6 + v14[18]) = a1;
  uint64_t v28 = v32;
  *(uint64_t *)((char *)a6 + v24) = v31;
  *(uint64_t *)((char *)a6 + v14[20]) = v28;
  v29 = (uint64_t *)((char *)a6 + v14[21]);
  uint64_t v30 = v34;
  void *v29 = v33;
  v29[1] = v30;
  return result;
}

uint64_t AsyncIconImage.init(icon:descriptor:transaction:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v27 = a4;
  uint64_t v28 = a5;
  uint64_t v10 = type metadata accessor for AsyncIconImage.LoadingState();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (uint64_t *)((char *)&v27 - v11);
  *a6 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420570);
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = (int *)type metadata accessor for AsyncIconImage();
  BOOL v14 = (uint64_t *)((char *)a6 + v13[9]);
  uint64_t *v14 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420580);
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = (char *)a6 + v13[10];
  *(void *)uint64_t v15 = swift_getKeyPath();
  v15[8] = 0;
  id v16 = (uint64_t *)((char *)a6 + v13[11]);
  *id v16 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420590);
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = (char *)a6 + v13[12];
  *(void *)uint64_t v17 = swift_getKeyPath();
  *((void *)v17 + 1) = 0;
  *((_WORD *)v17 + 8) = 0;
  uint64_t v18 = (char *)a6 + v13[13];
  *(void *)uint64_t v18 = swift_getKeyPath();
  v18[8] = 0;
  id v19 = (char *)a6 + v13[14];
  *(void *)id v19 = swift_getKeyPath();
  *((_WORD *)v19 + 4) = 0;
  char v20 = (char *)a6 + v13[15];
  *(void *)char v20 = swift_getKeyPath();
  *((_WORD *)v20 + 4) = 0;
  uint64_t v21 = (char *)a6 + v13[16];
  *(void *)uint64_t v21 = swift_getKeyPath();
  v21[8] = 0;
  id v22 = (char *)a6 + v13[17];
  *(void *)id v22 = swift_getKeyPath();
  v22[8] = 0;
  uint64_t v23 = v13[19];
  sub_2627D036C(v12);
  uint64_t result = sub_2627D0230((uint64_t)v12);
  *(uint64_t *)((char *)a6 + v13[23]) = 0;
  *(uint64_t *)((char *)a6 + v13[18]) = a1;
  *(uint64_t *)((char *)a6 + v23) = a2;
  *(uint64_t *)((char *)a6 + v13[20]) = a3;
  id v25 = (uint64_t *)((char *)a6 + v13[21]);
  uint64_t v26 = v28;
  *id v25 = v27;
  v25[1] = v26;
  return result;
}

uint64_t type metadata accessor for AsyncIconImage.LoadingState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t AsyncIconImage.init<A, B>(icon:descriptor:transaction:content:placeholder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a8;
  v18[3] = a10;
  v18[4] = a11;
  v18[5] = a12;
  v18[6] = a4;
  v18[7] = a5;
  v18[8] = a6;
  v18[9] = a7;
  sub_2627DC010();
  swift_getWitnessTable();
  return AsyncIconImage.init(icon:descriptor:transaction:content:)(a1, a2, a3, (uint64_t)sub_2627D5C8C, (uint64_t)v18, a9);
}

uint64_t sub_2627D125C@<X0>(unint64_t *a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v48 = a8;
  uint64_t v49 = a9;
  uint64_t v41 = a5;
  v42 = a4;
  uint64_t v43 = a3;
  v44 = a2;
  uint64_t v45 = *(void *)(a6 - 8);
  uint64_t v50 = a10;
  uint64_t v13 = MEMORY[0x270FA5388](a1);
  uint64_t v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v41 - v17;
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v16);
  uint64_t v23 = (char *)&v41 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  id v25 = (char *)&v41 - v24;
  uint64_t v26 = sub_2627DC010();
  uint64_t v46 = *(void *)(v26 - 8);
  uint64_t v47 = v26;
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  v29 = (char *)&v41 - v28;
  unint64_t v30 = *a1;
  if (*a1 >> 62)
  {
    v42(v27);
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
    v36(v25, v23, a7);
    v37 = *(void (**)(char *, uint64_t))(v20 + 8);
    v37(v23, a7);
    v36(v23, v25, a7);
    uint64_t v35 = v48;
    sub_2627D1728((uint64_t)v23, a6, a7);
    v37(v23, a7);
    v37(v25, a7);
  }
  else
  {
    uint64_t v31 = swift_retain();
    v44(v31);
    uint64_t v32 = v45;
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
    v33(v18, v15, a6);
    uint64_t v34 = *(void (**)(char *, uint64_t))(v32 + 8);
    v34(v15, a6);
    v33(v15, v18, a6);
    uint64_t v35 = v48;
    sub_2627D1630((uint64_t)v15, a6);
    sub_2627D5D2C(v30);
    v34(v15, a6);
    v34(v18, a6);
  }
  uint64_t v51 = v35;
  uint64_t v52 = v50;
  uint64_t v38 = v47;
  swift_getWitnessTable();
  uint64_t v39 = v46;
  (*(void (**)(uint64_t, char *, uint64_t))(v46 + 16))(v49, v29, v38);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v29, v38);
}

uint64_t sub_2627D1630(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2627DBFF0();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_2627DC000();
}

uint64_t sub_2627D1728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2627DBFF0();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_2627DC000();
}

uint64_t AsyncIconImage.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v77 = a2;
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
  uint64_t v4 = MEMORY[0x270FA5388](v72);
  uint64_t v69 = (uint64_t)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v4);
  v67 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v60 - v9;
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v84 = *(void *)(a1 + 16);
  uint64_t v85 = v11;
  uint64_t v12 = type metadata accessor for AsyncIconImage.LoadingState();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v60 - v14;
  uint64_t v66 = type metadata accessor for AsyncIconImage.Inner();
  uint64_t v68 = sub_2627DBEF0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A962BC0);
  uint64_t v71 = sub_2627DBEF0();
  uint64_t v76 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  v80 = (char *)&v60 - v16;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A962BC8);
  uint64_t v75 = sub_2627DBEF0();
  uint64_t v74 = *(void *)(v75 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v75);
  v70 = (char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v73 = (char *)&v60 - v19;
  sub_2627D0324();
  unint64_t v20 = *(void *)&v15[*(int *)(v12 + 48)];
  sub_2627D5CD8(v20);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v21 = *(int *)(a1 + 84);
  uint64_t v78 = v2;
  uint64_t v22 = (uint64_t *)(v2 + v21);
  uint64_t v23 = *v22;
  uint64_t v61 = v22[1];
  unint64_t v96 = v20;
  uint64_t v97 = v23;
  uint64_t v98 = v61;
  v81 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v82 = v6 + 16;
  v65 = v10;
  v81(v10, v2, a1);
  uint64_t v24 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v25 = (v24 + 32) & ~v24;
  uint64_t v83 = v25 + v7;
  uint64_t v79 = v24 | 7;
  uint64_t v26 = swift_allocObject();
  uint64_t v27 = v84;
  uint64_t v28 = v85;
  *(void *)(v26 + 16) = v84;
  *(void *)(v26 + 24) = v28;
  v29 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 32);
  uint64_t v30 = a1;
  v29(v26 + v25, v10, a1);
  uint64_t v31 = v67;
  uint64_t v60 = v30;
  v81(v67, v78, v30);
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = v27;
  *(void *)(v32 + 24) = v28;
  uint64_t v62 = v25;
  v29(v32 + v25, v31, v30);
  v63 = v29;
  uint64_t v64 = v6 + 32;
  v92 = sub_2627D5D4C;
  *(void *)&long long v93 = v26;
  *((void *)&v93 + 1) = sub_2627D5D68;
  *(void *)&long long v94 = v32;
  swift_retain();
  uint64_t v33 = v66;
  uint64_t WitnessTable = swift_getWitnessTable();
  MEMORY[0x263E54760](&v99, &v92, v33, MEMORY[0x263F1A250], WitnessTable);
  swift_release();
  swift_release();
  sub_2627D5D2C(v96);
  swift_release();
  v92 = v99;
  long long v93 = v100;
  long long v94 = v101;
  long long v95 = v102;
  uint64_t v35 = v69;
  uint64_t v36 = v60;
  uint64_t v37 = v78;
  sub_2627D0408(v60, v69);
  uint64_t v38 = v65;
  v81(v65, v37, v36);
  uint64_t v39 = swift_allocObject();
  uint64_t v40 = v85;
  *(void *)(v39 + 16) = v84;
  *(void *)(v39 + 24) = v40;
  v29(v39 + v25, v38, v36);
  uint64_t v90 = WitnessTable;
  uint64_t v91 = MEMORY[0x263F1A240];
  v67 = (char *)MEMORY[0x263F18E48];
  uint64_t v41 = swift_getWitnessTable();
  sub_2627D5E98();
  sub_2627DC090();
  swift_release();
  sub_2627DBD38(v35, &qword_26B420548);
  uint64_t v42 = v94;
  uint64_t v43 = v95;
  sub_2627D5D2C((unint64_t)v92);
  swift_release();
  sub_2627D5F3C(v42);
  sub_2627D5F3C(v43);
  v99 = *(uint64_t (**)())(v37 + *(int *)(v36 + 76));
  v44 = v99;
  v81(v38, v37, v36);
  uint64_t v45 = swift_allocObject();
  uint64_t v46 = v85;
  *(void *)(v45 + 16) = v84;
  *(void *)(v45 + 24) = v46;
  v63(v45 + v62, v38, v36);
  uint64_t v47 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A962BD8);
  uint64_t v48 = sub_2627DBAD8(&qword_26A962BE0, &qword_26A962BC0);
  uint64_t v88 = v41;
  uint64_t v89 = v48;
  uint64_t v49 = v71;
  uint64_t v50 = swift_getWitnessTable();
  sub_2627D6450();
  uint64_t v51 = v70;
  uint64_t v52 = v80;
  sub_2627DC090();
  swift_release();

  (*(void (**)(char *, uint64_t))(v76 + 8))(v52, v49);
  uint64_t v53 = sub_2627DBAD8(&qword_26A962C00, &qword_26A962BC8);
  uint64_t v86 = v50;
  uint64_t v87 = v53;
  uint64_t v54 = v75;
  swift_getWitnessTable();
  uint64_t v55 = v74;
  v56 = *(void (**)(char *, char *, uint64_t))(v74 + 16);
  v57 = v73;
  v56(v73, v51, v54);
  v58 = *(void (**)(char *, uint64_t))(v55 + 8);
  v58(v51, v54);
  v56(v77, v57, v54);
  return ((uint64_t (*)(char *, uint64_t))v58)(v57, v54);
}

uint64_t sub_2627D2180(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AsyncIconImage();
  uint64_t v6 = *(void **)(a1 + *(int *)(v5 + 72));
  sub_2627D0408(v5, (uint64_t)v4);
  sub_2627D2250(v6, (uint64_t)v4, *(void **)(a1 + *(int *)(v5 + 76)), v5);
  return sub_2627DBD38((uint64_t)v4, &qword_26B420548);
}

void sub_2627D2250(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  v115 = a3;
  uint64_t v125 = a2;
  id v121 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4205A0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v106 = (uint64_t)&v98 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a4 + 24);
  uint64_t v108 = *(void *)(a4 + 16);
  uint64_t v9 = type metadata accessor for AsyncIconImage.LoadingState();
  uint64_t v114 = sub_2627DC0F0();
  uint64_t v112 = *(void *)(v114 - 8);
  MEMORY[0x270FA5388](v114);
  v111 = (char *)&v98 - v10;
  uint64_t v105 = type metadata accessor for IconEnvironmentTraits();
  uint64_t v120 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  uint64_t v99 = (uint64_t)&v98 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420558);
  uint64_t v12 = MEMORY[0x270FA5388](v104);
  uint64_t v117 = (uint64_t)&v98 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = *(void *)(a4 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v103 = (char *)&v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v113 = (char *)&v98 - v17;
  uint64_t v102 = v18;
  MEMORY[0x270FA5388](v16);
  v118 = (char *)&v98 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v101 = (uint64_t)&v98 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v107 = (uint64_t)&v98 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v98 - v26;
  uint64_t v28 = *(void *)(v9 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v25);
  v116 = (void **)((char *)&v98 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  v110 = (char *)&v98 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  long long v100 = (char *)&v98 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  uint64_t v37 = (char *)&v98 - v36;
  MEMORY[0x270FA5388](v35);
  uint64_t v39 = (id *)((char *)&v98 - v38);
  v127 = v4;
  sub_2627D0324();
  id v40 = *v39;
  uint64_t v41 = *(int **)(v28 + 8);
  id v42 = *v39;
  id v123 = (id)(v28 + 8);
  uint64_t v124 = v9;
  v122 = (void (*)(char *, uint64_t))v41;
  ((void (*)(id *, uint64_t))v41)(v39, v9);
  uint64_t v109 = v8;
  if (v40)
  {
    sub_2627DB8FC(0, &qword_26B420400);
    id v43 = v42;
    id v44 = v121;
    char v45 = sub_2627DC260();
  }
  else
  {
    char v45 = 0;
  }
  uint64_t v46 = v126;
  uint64_t v47 = v117;
  uint64_t v48 = v120;
  sub_2627DBCD4(v125, (uint64_t)v27, &qword_26B420548);
  uint64_t v49 = v118;
  v119 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
  uint64_t v120 = v46 + 16;
  v119(v118, v127, a4);
  if ((v45 & 1) == 0)
  {
    uint64_t v55 = *(void (**)(char *, uint64_t))(v46 + 8);
    v55(v49, a4);
    sub_2627DBD38((uint64_t)v27, &qword_26B420548);
    v56 = v113;
    uint64_t v57 = v114;
LABEL_13:
    v119(v56, v127, a4);
    goto LABEL_14;
  }
  sub_2627D0324();
  uint64_t v50 = v124;
  uint64_t v51 = v107;
  sub_2627DBCD4((uint64_t)&v37[*(int *)(v124 + 40)], v107, &qword_26B420548);
  v122(v37, v50);
  uint64_t v52 = v47 + *(int *)(v104 + 48);
  sub_2627DBCD4((uint64_t)v27, v47, &qword_26B420548);
  sub_2627DBCD4(v51, v52, &qword_26B420548);
  uint64_t v53 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48);
  uint64_t v54 = v105;
  if (v53(v47, 1, v105) != 1)
  {
    uint64_t v58 = v101;
    sub_2627DBCD4(v47, v101, &qword_26B420548);
    if (v53(v52, 1, v54) != 1)
    {
      uint64_t v91 = v99;
      sub_2627DB158(v52, v99);
      char v92 = sub_2627CEC24(v58, v91);
      sub_2627D8204(v91);
      sub_2627DBD38(v107, &qword_26B420548);
      uint64_t v55 = *(void (**)(char *, uint64_t))(v126 + 8);
      v55(v118, a4);
      sub_2627DBD38((uint64_t)v27, &qword_26B420548);
      sub_2627D8204(v58);
      sub_2627DBD38(v47, &qword_26B420548);
      v56 = v113;
      v119(v113, v127, a4);
      uint64_t v57 = v114;
      if ((v92 & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_25;
    }
    sub_2627DBD38(v107, &qword_26B420548);
    uint64_t v55 = *(void (**)(char *, uint64_t))(v126 + 8);
    v55(v118, a4);
    sub_2627DBD38((uint64_t)v27, &qword_26B420548);
    sub_2627D8204(v58);
    uint64_t v57 = v114;
    goto LABEL_12;
  }
  sub_2627DBD38(v51, &qword_26B420548);
  uint64_t v55 = *(void (**)(char *, uint64_t))(v126 + 8);
  v55(v49, a4);
  sub_2627DBD38((uint64_t)v27, &qword_26B420548);
  if (v53(v52, 1, v54) != 1)
  {
    uint64_t v57 = v114;
LABEL_12:
    v56 = v113;
    sub_2627DBD38(v117, &qword_26B420558);
    goto LABEL_13;
  }
  sub_2627DBD38(v47, &qword_26B420548);
  v56 = v113;
  v119(v113, v127, a4);
  uint64_t v57 = v114;
LABEL_25:
  long long v93 = v100;
  sub_2627D0324();
  long long v94 = (void *)*((void *)v93 + 1);
  id v95 = v94;
  v122(v93, v124);
  if (!v115)
  {
    v55(v56, a4);
    if (!v94) {
      return;
    }

    goto LABEL_15;
  }
  if (v94)
  {
    sub_2627DB8FC(0, &qword_26A962BF8);
    unint64_t v96 = v115;
    char v97 = sub_2627DC260();
    v55(v56, a4);

    if (v97) {
      return;
    }
    goto LABEL_15;
  }
LABEL_14:
  v55(v56, a4);
LABEL_15:
  v59 = v110;
  sub_2627D0324();
  uint64_t v60 = v124;
  if (*(void *)&v59[*(int *)(v124 + 44)])
  {
    swift_retain();
    v122(v59, v60);
    sub_2627DC210();
    swift_release();
  }
  else
  {
    v122(v59, v124);
  }
  id v61 = v121;
  uint64_t v62 = v125;
  v63 = v115;
  uint64_t v64 = v127;
  id v123 = sub_2627D34B0(v125, v115, a4);
  id v65 = objc_msgSend(v61, sel_imageForDescriptor_);
  uint64_t v66 = *(int *)(a4 + 88);
  v122 = (void (*)(char *, uint64_t))a4;
  v67 = &v64[v66];
  uint64_t v68 = v116;
  sub_2627DC0D0();
  uint64_t v69 = *v68;
  id v121 = v61;

  *uint64_t v68 = v61;
  sub_2627DC0E0();
  v70 = v111;
  uint64_t v71 = v112;
  (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v111, v67, v57);
  sub_2627DC0D0();
  sub_2627DAA1C(v62, (uint64_t)v68 + *(int *)(v60 + 40));
  sub_2627DC0E0();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v57);
  id v72 = v63;
  sub_2627DC0D0();

  v68[1] = v63;
  sub_2627DC0E0();
  if (v65)
  {
    v73 = (int *)v122;
    id v74 = v123;
    id v75 = v65;
    if (objc_msgSend(v75, sel_placeholder))
    {
      uint64_t v76 = sub_2627DC200();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56))(v106, 1, 1, v76);
      v77 = v103;
      v119(v103, v127, (uint64_t)v73);
      sub_2627DC1E0();
      v127 = (char *)v121;
      id v78 = v74;
      uint64_t v79 = sub_2627DC1D0();
      uint64_t v80 = v126;
      unint64_t v81 = (*(unsigned __int8 *)(v126 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v126 + 80);
      uint64_t v82 = (char *)swift_allocObject();
      uint64_t v83 = MEMORY[0x263F8F500];
      *((void *)v82 + 2) = v79;
      *((void *)v82 + 3) = v83;
      uint64_t v84 = v109;
      *((void *)v82 + 4) = v108;
      *((void *)v82 + 5) = v84;
      *((void *)v82 + 6) = v127;
      *((void *)v82 + 7) = v78;
      (*(void (**)(char *, char *, int *))(v80 + 32))(&v82[v81], v77, v73);
      uint64_t v85 = sub_2627D49C8(v106, (uint64_t)&unk_26A962C28, (uint64_t)v82);
      uint64_t v86 = v116;
      sub_2627DC0D0();
      uint64_t v87 = *(int *)(v124 + 44);
      swift_release();
      *(void **)((char *)v86 + v87) = (void *)v85;
      sub_2627DC0E0();
    }
    else
    {
      MEMORY[0x270FA5388](*(void *)&v127[v73[20]]);
      uint64_t v89 = v109;
      *(&v98 - 4) = v108;
      *(&v98 - 3) = v89;
      *(&v98 - 2) = v90;
      *(&v98 - 1) = (uint64_t)v75;
      sub_2627DBF00();
    }
  }
  else
  {
    MEMORY[0x270FA5388](*(void *)&v64[*((int *)v122 + 20)]);
    uint64_t v88 = v109;
    *(&v98 - 4) = v108;
    *(&v98 - 3) = v88;
    *(&v98 - 2) = (uint64_t)v64;
    sub_2627DBF00();
  }
}

uint64_t sub_2627D2F98()
{
  uint64_t v0 = type metadata accessor for AsyncIconImage.LoadingState();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - v2;
  type metadata accessor for AsyncIconImage();
  sub_2627D0324();
  if (!*(void *)&v3[*(int *)(v0 + 44)]) {
    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  swift_retain();
  v4(v3, v0);
  sub_2627DC210();
  return swift_release();
}

uint64_t sub_2627D30D8(void **a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *a1;
  uint64_t v8 = type metadata accessor for AsyncIconImage();
  uint64_t v9 = *(void **)(a2 + *(int *)(v8 + 72));
  sub_2627D0408(v8, (uint64_t)v6);
  sub_2627D2250(v9, (uint64_t)v6, v7, v8);
  return sub_2627DBD38((uint64_t)v6, &qword_26B420548);
}

uint64_t sub_2627D31AC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v23 = *(void *)(a1 + 16);
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2627DBEF0();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = *(void *)(a1 + 24);
  v22[1] = v7;
  unint64_t v8 = sub_2627DA9C8();
  v26[1] = v7;
  v26[2] = v8;
  v22[0] = swift_getWitnessTable();
  uint64_t v9 = sub_2627DBFB0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v22 - v14;
  unint64_t v17 = *v2;
  uint64_t v16 = (void (*)(void *))v2[1];
  v26[0] = v17;
  sub_2627D5CD8(v17);
  v16(v26);
  sub_2627D5D2C(v17);
  uint64_t v18 = v23;
  sub_2627DC070();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v18);
  sub_2627DBFC0();
  swift_getWitnessTable();
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v19(v15, v13, v9);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v10 + 8);
  v20(v13, v9);
  v19(v25, v15, v9);
  return ((uint64_t (*)(char *, uint64_t))v20)(v15, v9);
}

uint64_t sub_2627D3490()
{
  return sub_2627DC060();
}

id sub_2627D34B0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v7 = sub_2627DBEE0();
  uint64_t v63 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v62 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2627DBFE0();
  uint64_t v60 = *(void *)(v9 - 8);
  uint64_t v61 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  v59 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = *(void *)(a3 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v58 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v54 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = (int *)type metadata accessor for IconEnvironmentTraits();
  uint64_t v20 = *((void *)v19 - 1);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    id v65 = a2;
  }
  else {
    id v65 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B558]), sel_init);
  }
  sub_2627DBCD4(a1, (uint64_t)v18, &qword_26B420548);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v20 + 48))(v18, 1, v19) == 1)
  {
    id v23 = a2;
    sub_2627DBD38((uint64_t)v18, &qword_26B420548);
    return v65;
  }
  else
  {
    uint64_t v56 = v7;
    sub_2627DB158((uint64_t)v18, (uint64_t)v22);
    id v55 = a2;
    *(double *)&uint64_t v25 = COERCE_DOUBLE(sub_2627D00C0(a3));
    char v27 = v26;
    uint64_t v28 = v3;
    uint64_t v29 = v64;
    uint64_t v30 = *(void (**)(char *))(v64 + 16);
    uint64_t v57 = v28;
    v30(v15);
    if (v27)
    {
      if (a2)
      {
        objc_msgSend(v55, sel_scale);
        double v31 = v34;
        uint64_t v35 = v58;
        uint64_t v33 = a3;
        ((void (*)(char *, char *, uint64_t))v30)(v58, v15, a3);
        uint64_t v36 = v35;
      }
      else
      {
        uint64_t v37 = v58;
        uint64_t v33 = a3;
        ((void (*)(char *, char *, uint64_t))v30)(v58, v15, a3);
        uint64_t v36 = v37;
        double v38 = sub_2627CFEB0(a3);
        uint64_t v29 = v64;
        double v31 = v38;
      }
      uint64_t v32 = v56;
      uint64_t v39 = *(void (**)(char *, uint64_t))(v29 + 8);
      v39(v36, v33);
      v39(v15, v33);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v15, a3);
      double v31 = *(double *)&v25;
      uint64_t v32 = v56;
      uint64_t v33 = a3;
    }
    id v24 = v65;
    objc_msgSend(v65, sel_setAppearance_, *(void *)&v22[v19[9]]);
    if (*(void *)&v22[v19[11]]) {
      objc_msgSend(v24, sel_setTintColor_);
    }
    objc_msgSend(v24, sel_setAppearanceVariant_, *(void *)&v22[v19[10]]);
    uint64_t v41 = v59;
    uint64_t v40 = v60;
    uint64_t v42 = v61;
    (*(void (**)(char *, void, uint64_t))(v60 + 104))(v59, *MEMORY[0x263F19968], v61);
    char v43 = sub_2627DBEA0();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v42);
    objc_msgSend(v24, sel_setContrast_, (v43 & 1) == 0);
    char v45 = v62;
    uint64_t v44 = v63;
    (*(void (**)(char *, void, uint64_t))(v63 + 104))(v62, *MEMORY[0x263F18DC8], v32);
    char v46 = sub_2627DBED0();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v32);
    if (v46) {
      uint64_t v47 = 1;
    }
    else {
      uint64_t v47 = 2;
    }
    objc_msgSend(v24, sel_setLanguageDirection_, v47);
    objc_msgSend(v24, sel_setScale_, v31);
    uint64_t v48 = &v22[v19[7]];
    if ((v48[8] & 1) == 0) {
      objc_msgSend(v24, sel_setShape_, *(void *)v48);
    }
    int v49 = v22[v19[8]];
    if (v49 != 2) {
      objc_msgSend(v24, sel_setDrawBorder_, v49 & 1);
    }
    uint64_t v50 = sub_2627CFF10(v33);
    if ((v52 & 1) == 0) {
      objc_msgSend(v24, sel_setSize_, *(double *)&v50, v51);
    }
    sub_2627D8204((uint64_t)v22);
  }
  return v24;
}

uint64_t sub_2627D3AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[3] = a4;
  v8[8] = type metadata accessor for AsyncIconImage.LoadingState();
  v8[9] = swift_task_alloc();
  v8[10] = sub_2627DC1E0();
  v8[11] = sub_2627DC1D0();
  uint64_t v10 = sub_2627DC1B0();
  v8[12] = v10;
  v8[13] = v9;
  return MEMORY[0x270FA2498](sub_2627D3B9C, v10, v9);
}

uint64_t sub_2627D3B9C()
{
  long long v7 = *(_OWORD *)(v0 + 24);
  uint64_t v1 = sub_2627DC1D0();
  *(void *)(v0 + 112) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 120) = v2;
  *(_OWORD *)(v2 + 16) = v7;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4205E8);
  *uint64_t v3 = v0;
  v3[1] = sub_2627D3CC4;
  uint64_t v5 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2318](v0 + 16, v1, v5, 0xD00000000000002CLL, 0x80000002627DE740, sub_2627DB8DC, v2, v4);
}

uint64_t sub_2627D3CC4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 104);
  uint64_t v3 = *(void *)(v1 + 96);
  return MEMORY[0x270FA2498](sub_2627D3E24, v3, v2);
}

uint64_t sub_2627D3E24()
{
  swift_release();
  uint64_t v1 = (void *)v0[2];
  if (v1)
  {
    id v2 = v1;
    if (objc_msgSend(v2, sel_placeholder))
    {
      uint64_t v4 = v0[8];
      uint64_t v3 = v0[9];
      type metadata accessor for AsyncIconImage.LoadingError();
      swift_getWitnessTable();
      uint64_t v5 = swift_allocError() | 0x4000000000000000;
      type metadata accessor for AsyncIconImage();
      sub_2627DC0F0();
      sub_2627DC0D0();
      uint64_t v6 = *(int *)(v4 + 48);
      sub_2627D5D2C(*(void *)(v3 + v6));
      *(void *)(v3 + v6) = v5;
      sub_2627DC0E0();

      goto LABEL_7;
    }
    uint64_t v12 = v0[6];
    uint64_t v11 = v0[7];
    uint64_t v13 = v0[5];
    type metadata accessor for AsyncIconImage();
    uint64_t v14 = (void *)swift_task_alloc();
    v14[2] = v12;
    v14[3] = v11;
    v14[4] = v13;
    v14[5] = v2;
    sub_2627DBF00();
  }
  else
  {
    uint64_t v7 = v0[6];
    uint64_t v8 = v0[7];
    uint64_t v9 = v0[5];
    type metadata accessor for AsyncIconImage();
    uint64_t v10 = (void *)swift_task_alloc();
    v10[2] = v7;
    v10[3] = v8;
    v10[4] = v9;
    sub_2627DBF00();
  }
  swift_task_dealloc();
LABEL_7:
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_2627D4050(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  uint64_t v27 = a1;
  uint64_t v30 = sub_2627DC100();
  uint64_t v33 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2627DC130();
  uint64_t v31 = *(void *)(v5 - 8);
  uint64_t v32 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4205D8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = sub_2627DC110();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2627DB8FC(0, &qword_26B4205E0);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F8F060], v11);
  uint64_t v26 = sub_2627DC240();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v27, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = swift_allocObject();
  uint64_t v18 = v28;
  uint64_t v17 = v29;
  *(void *)(v16 + 16) = v28;
  *(void *)(v16 + 24) = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v15, (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_2627DBA10;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2627D4724;
  aBlock[3] = &block_descriptor;
  uint64_t v19 = _Block_copy(aBlock);
  id v20 = v18;
  id v21 = v17;
  sub_2627DC120();
  uint64_t v34 = MEMORY[0x263F8EE78];
  sub_2627DBA90(&qword_26B4205C0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B4205C8);
  sub_2627DBAD8(&qword_26B4205D0, &qword_26B4205C8);
  uint64_t v22 = v30;
  sub_2627DC280();
  id v23 = (void *)v26;
  MEMORY[0x263E54910](0, v7, v4, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v22);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v32);
  return swift_release();
}

void sub_2627D44C0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4205D8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_2627DBBB0;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2627D46B8;
  aBlock[3] = &block_descriptor_72;
  uint64_t v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a1, sel_getImageForImageDescriptor_completion_, a2, v11);
  _Block_release(v11);
}

uint64_t sub_2627D4670(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B4205D8);
  return sub_2627DC1C0();
}

void sub_2627D46B8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_2627D4724(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2627D4768()
{
  uint64_t v0 = type metadata accessor for AsyncIconImage.LoadingState();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v6 - v1;
  type metadata accessor for AsyncIconImage.LoadingError();
  swift_getWitnessTable();
  uint64_t v3 = swift_allocError() | 0x4000000000000000;
  type metadata accessor for AsyncIconImage();
  sub_2627DC0F0();
  sub_2627DC0D0();
  uint64_t v4 = *(int *)(v0 + 48);
  sub_2627D5D2C(*(void *)&v2[v4]);
  *(void *)&v2[v4] = v3;
  return sub_2627DC0E0();
}

id sub_2627D4890(uint64_t a1, void *a2)
{
  uint64_t v3 = type metadata accessor for AsyncIconImage.LoadingState();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v10 - v4;
  id v6 = a2;
  id result = objc_msgSend(v6, sel_CGImage);
  if (result)
  {
    objc_msgSend(v6, sel_scale);
    uint64_t v8 = sub_2627DC0A0();

    type metadata accessor for AsyncIconImage();
    sub_2627DC0F0();
    sub_2627DC0D0();
    uint64_t v9 = *(int *)(v3 + 48);
    sub_2627D5D2C(*(void *)&v5[v9]);
    *(void *)&v5[v9] = v8;
    return (id)sub_2627DC0E0();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2627D49C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2627DC200();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2627DC1F0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2627DBD38(a1, &qword_26B4205A0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2627DC1B0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2627D4B88()
{
  return sub_2627DBF10();
}

uint64_t sub_2627D4BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2627D4C28(a1, a2, a3, a4, MEMORY[0x263F18520], MEMORY[0x263F19230]);
}

uint64_t type metadata accessor for AsyncIconImage()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2627D4C04()
{
  return sub_2627DBF40();
}

uint64_t sub_2627D4C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_2627D4CF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2627D4C28(a1, a2, a3, a4, MEMORY[0x263F18DD8], MEMORY[0x263F19340]);
}

uint64_t sub_2627D4D38@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v24 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_2627DBF70();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2627DBCD4(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_2627DC220();
    id v21 = sub_2627DC020();
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v25 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      *(void *)(v22 + 4) = sub_2627DB390(a3, v24, &v25);
      _os_log_impl(&dword_2627CB000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E54E70](v23, -1, -1);
      MEMORY[0x263E54E70](v22, -1, -1);
    }

    sub_2627DBF60();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

double sub_2627D4FC0(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2627DBF70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_2627DC220();
  uint64_t v9 = sub_2627DC020();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    double v14 = *(double *)&v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_2627DB390(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v14);
    _os_log_impl(&dword_2627CB000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E54E70](v11, -1, -1);
    MEMORY[0x263E54E70](v10, -1, -1);
  }

  sub_2627DBF60();
  swift_getAtKeyPath();
  sub_2627D5CFC(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_2627D51A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2627DBF70();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 0x100) == 0)
  {
    swift_retain();
    os_log_type_t v10 = sub_2627DC220();
    uint64_t v11 = sub_2627DC020();
    if (os_log_type_enabled(v11, v10))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v16 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      *(void *)(v12 + 4) = sub_2627DB390(0xD000000000000010, 0x80000002627DE7A0, &v16);
      _os_log_impl(&dword_2627CB000, v11, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E54E70](v13, -1, -1);
      MEMORY[0x263E54E70](v12, -1, -1);
    }

    sub_2627DBF60();
    swift_getAtKeyPath();
    sub_2627D5D08(a1, a2, a3, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v16;
  }
  return a1;
}

uint64_t sub_2627D53A4(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2627DBF70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v8 = sub_2627DC220();
    uint64_t v9 = sub_2627DC020();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v13 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      *(void *)(v10 + 4) = sub_2627DB390(0x6C616E6F6974704FLL, 0xEE003E6C6F6F423CLL, &v13);
      _os_log_impl(&dword_2627CB000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E54E70](v11, -1, -1);
      MEMORY[0x263E54E70](v10, -1, -1);
    }

    sub_2627DBF60();
    swift_getAtKeyPath();
    sub_2627D5CFC(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t sub_2627D558C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(void, void, void))
{
  uint64_t v10 = sub_2627DBF70();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0x100) == 0)
  {
    swift_retain();
    os_log_type_t v14 = sub_2627DC220();
    uint64_t v15 = sub_2627DC020();
    if (os_log_type_enabled(v15, v14))
    {
      uint64_t v16 = swift_slowAlloc();
      unint64_t v22 = a4;
      uint64_t v17 = v16;
      uint64_t v18 = swift_slowAlloc();
      uint64_t v23 = a5;
      uint64_t v24 = v18;
      uint64_t v19 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      *(void *)(v17 + 4) = sub_2627DB390(a3, v22, &v24);
      _os_log_impl(&dword_2627CB000, v15, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v17, 0xCu);
      swift_arrayDestroy();
      uint64_t v20 = v19;
      a5 = v23;
      MEMORY[0x263E54E70](v20, -1, -1);
      MEMORY[0x263E54E70](v17, -1, -1);
    }

    sub_2627DBF60();
    swift_getAtKeyPath();
    a5(a1, a2, 0);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return v24;
  }
  return a1;
}

uint64_t sub_2627D578C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2627DBF70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_2627DC220();
  uint64_t v9 = sub_2627DC020();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v13 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_2627DB390(1819242306, 0xE400000000000000, &v13);
    _os_log_impl(&dword_2627CB000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E54E70](v11, -1, -1);
    MEMORY[0x263E54E70](v10, -1, -1);
  }

  sub_2627DBF60();
  swift_getAtKeyPath();
  sub_2627D5CFC(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_2627D5964(void *a1, char a2)
{
  uint64_t v4 = sub_2627DBF70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v15 = a1;
  }
  else
  {
    swift_retain();
    os_log_type_t v8 = sub_2627DC220();
    uint64_t v9 = sub_2627DC020();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v18 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A962AF8);
      uint64_t v13 = sub_2627DC360();
      *(void *)(v11 + 4) = sub_2627DB390(v13, v14, &v18);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2627CB000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E54E70](v12, -1, -1);
      MEMORY[0x263E54E70](v11, -1, -1);
    }

    sub_2627DBF60();
    swift_getAtKeyPath();
    sub_2627D5D20(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v18;
  }
  return (uint64_t)a1;
}

uint64_t sub_2627D5B5C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_2627DBF20();
  *a1 = v3;
  return result;
}

uint64_t sub_2627D5B88()
{
  return sub_2627DBF30();
}

uint64_t sub_2627D5BB0()
{
  return sub_2627DBF50();
}

uint64_t sub_2627D5BFC@<X0>(void *a1@<X8>)
{
  sub_2627CDB44();
  uint64_t result = sub_2627DBF80();
  *a1 = v3;
  return result;
}

uint64_t sub_2627D5C4C()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_2627D5C8C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2627D125C(a1, *(void (**)(uint64_t))(v2 + 48), *(void *)(v2 + 56), *(void (**)(uint64_t))(v2 + 64), *(void *)(v2 + 72), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), a2, *(void *)(v2 + 40));
}

uint64_t type metadata accessor for AsyncIconImage.Inner()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_2627D5CD8(unint64_t result)
{
  if (result >> 62 == 1) {
    return (unint64_t)(id)(result & 0x3FFFFFFFFFFFFFFFLL);
  }
  if (!(result >> 62)) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2627D5CFC(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2627D5D08(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2627D5D14(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_release();
  }
  return result;
}

void sub_2627D5D20(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

void sub_2627D5D2C(unint64_t a1)
{
  if (a1 >> 62 == 1)
  {
  }
  else if (!(a1 >> 62))
  {
    swift_release();
  }
}

uint64_t sub_2627D5D4C()
{
  return sub_2627D5D80((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2627D2180);
}

uint64_t sub_2627D5D68()
{
  return sub_2627D5D80((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2627D2F98);
}

uint64_t sub_2627D5D80(uint64_t (*a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(type metadata accessor for AsyncIconImage() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1(v5, v2, v3);
}

void sub_2627D5E1C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for AsyncIconImage();
  uint64_t v4 = v1
     + ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80));
  sub_2627D2250(*(void **)(v4 + *(int *)(v3 + 72)), a1, *(void **)(v4 + *(int *)(v3 + 76)), v3);
}

unint64_t sub_2627D5E98()
{
  unint64_t result = qword_26A962BD0;
  if (!qword_26A962BD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B420548);
    sub_2627DBA90(&qword_26B420530, (void (*)(uint64_t))type metadata accessor for IconEnvironmentTraits);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A962BD0);
  }
  return result;
}

uint64_t sub_2627D5F3C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t objectdestroy_39Tm()
{
  uint64_t v1 = (int *)type metadata accessor for AsyncIconImage();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2627DBEB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420580);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2627DBEE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  sub_2627D5CFC(*(void *)(v5 + v1[10]), *(unsigned char *)(v5 + v1[10] + 8));
  uint64_t v9 = v5 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2627DBFE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  sub_2627D5D08(*(void *)(v5 + v1[12]), *(void *)(v5 + v1[12] + 8), *(unsigned __int8 *)(v5 + v1[12] + 16), *(unsigned char *)(v5 + v1[12] + 17));
  sub_2627D5CFC(*(void *)(v5 + v1[13]), *(unsigned char *)(v5 + v1[13] + 8));
  sub_2627D5D14(*(void *)(v5 + v1[14]), *(unsigned __int8 *)(v5 + v1[14] + 8), *(unsigned char *)(v5 + v1[14] + 9));
  sub_2627D5D14(*(void *)(v5 + v1[15]), *(unsigned __int8 *)(v5 + v1[15] + 8), *(unsigned char *)(v5 + v1[15] + 9));
  sub_2627D5CFC(*(void *)(v5 + v1[16]), *(unsigned char *)(v5 + v1[16] + 8));
  sub_2627D5D20(*(id *)(v5 + v1[17]), *(unsigned char *)(v5 + v1[17] + 8));

  swift_release();
  swift_release();
  uint64_t v11 = (id *)(v5 + v1[22]);

  uint64_t v12 = type metadata accessor for AsyncIconImage.LoadingState();
  uint64_t v13 = (char *)v11 + *(int *)(v12 + 40);
  unint64_t v14 = (int *)type metadata accessor for IconEnvironmentTraits();
  if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v14 - 1) + 48))(v13, 1, v14))
  {
    uint64_t v15 = sub_2627DBEB0();
    (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v13, v15);
    uint64_t v16 = v4;
    uint64_t v17 = &v13[v14[5]];
    uint64_t v18 = sub_2627DBFE0();
    (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
    uint64_t v19 = &v13[v14[6]];
    uint64_t v20 = sub_2627DBEE0();
    id v21 = v19;
    uint64_t v4 = v16;
    uint64_t v3 = (v2 + 32) & ~v2;
    (*(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v21, v20);
  }
  swift_release();
  sub_2627D5D2C(*(unint64_t *)((char *)v11 + *(int *)(v12 + 48)));
  sub_2627DC0F0();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2627D63C4(void **a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for AsyncIconImage() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_2627D30D8(a1, v4);
}

unint64_t sub_2627D6450()
{
  unint64_t result = qword_26A962BE8;
  if (!qword_26A962BE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A962BD8);
    sub_2627D64C4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A962BE8);
  }
  return result;
}

unint64_t sub_2627D64C4()
{
  unint64_t result = qword_26A962BF0;
  if (!qword_26A962BF0)
  {
    sub_2627DB8FC(255, &qword_26A962BF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A962BF0);
  }
  return result;
}

uint64_t sub_2627D652C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t *initializeBufferWithCopyOfBuffer for AsyncIconImagePhase(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_2627D5CD8(*a2);
  *a1 = v3;
  return a1;
}

void destroy for AsyncIconImagePhase(unint64_t *a1)
{
}

unint64_t *assignWithCopy for AsyncIconImagePhase(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_2627D5CD8(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_2627D5D2C(v4);
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for AsyncIconImagePhase(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_2627D5D2C(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for AsyncIconImagePhase(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for AsyncIconImagePhase(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)unint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_2627D66D4(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 2;
  }
}

void *sub_2627D66F0(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_2627D6700(unint64_t *result, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 62;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 2);
    unint64_t v3 = 0x8000000000000000;
  }
  *unint64_t result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for AsyncIconImagePhase()
{
  return &type metadata for AsyncIconImagePhase;
}

uint64_t sub_2627D673C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 80);
}

void sub_2627D6744()
{
  sub_2627DA920(319, &qword_26B420578, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_2627DA920(319, &qword_26B420588, MEMORY[0x263F18DD8], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F)
    {
      sub_2627DA920(319, &qword_26B420598, MEMORY[0x263F19988], MEMORY[0x263F185C8]);
      if (v2 <= 0x3F)
      {
        type metadata accessor for AsyncIconImage.LoadingState();
        sub_2627DC0F0();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void *sub_2627D6970(void *a1, void *a2, int *a3)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B420570);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2627DBEB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[9];
    uint64_t v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (void *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B420580);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_2627DBEE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[10];
    unint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(void *)v15;
    char v17 = v15[8];
    sub_2627D6FC8(*(void *)v15, v17);
    *(void *)unint64_t v14 = v16;
    v14[8] = v17;
    uint64_t v18 = a3[11];
    uint64_t v19 = (void *)((char *)a1 + v18);
    uint64_t v20 = (void *)((char *)a2 + v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B420590);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = sub_2627DBFE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    }
    else
    {
      void *v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v22 = a3[12];
    uint64_t v23 = (char *)a1 + v22;
    uint64_t v24 = (char *)a2 + v22;
    uint64_t v25 = *(void *)v24;
    uint64_t v26 = *((void *)v24 + 1);
    char v27 = v24[17];
    unsigned __int8 v28 = v24[16];
    sub_2627D6FD4(*(void *)v24, v26, v28, v27);
    *(void *)uint64_t v23 = v25;
    *((void *)v23 + 1) = v26;
    v23[16] = v28;
    v23[17] = v27;
    uint64_t v29 = a3[13];
    uint64_t v30 = (char *)a1 + v29;
    uint64_t v31 = (char *)a2 + v29;
    uint64_t v32 = *(void *)v31;
    LOBYTE(v26) = v31[8];
    sub_2627D6FC8(*(void *)v31, v26);
    *(void *)uint64_t v30 = v32;
    v30[8] = v26;
    uint64_t v33 = a3[14];
    uint64_t v34 = (char *)a1 + v33;
    uint64_t v35 = (char *)a2 + v33;
    uint64_t v36 = *(void *)v35;
    LOBYTE(v26) = v35[9];
    LOBYTE(v30) = v35[8];
    sub_2627D6FE0(*(void *)v35, v30, v26);
    *(void *)uint64_t v34 = v36;
    v34[8] = (char)v30;
    v34[9] = v26;
    uint64_t v37 = a3[15];
    double v38 = (char *)a1 + v37;
    uint64_t v39 = (char *)a2 + v37;
    uint64_t v40 = *(void *)v39;
    LOBYTE(v26) = v39[9];
    LOBYTE(v30) = v39[8];
    sub_2627D6FE0(*(void *)v39, v30, v26);
    *(void *)double v38 = v40;
    v38[8] = (char)v30;
    v38[9] = v26;
    uint64_t v41 = a3[16];
    uint64_t v42 = (char *)a1 + v41;
    char v43 = (char *)a2 + v41;
    uint64_t v44 = *(void *)v43;
    LOBYTE(v26) = v43[8];
    sub_2627D6FC8(*(void *)v43, v26);
    *(void *)uint64_t v42 = v44;
    v42[8] = v26;
    uint64_t v45 = a3[17];
    char v46 = (char *)a1 + v45;
    uint64_t v47 = (char *)a2 + v45;
    id v48 = *(id *)v47;
    LOBYTE(v26) = v47[8];
    sub_2627D6FEC(*(id *)v47, v26);
    *(void *)char v46 = v48;
    v46[8] = v26;
    uint64_t v49 = a3[18];
    uint64_t v50 = a3[19];
    double v51 = *(void **)((char *)a2 + v49);
    *(void *)((char *)a1 + v49) = v51;
    id v95 = *(void **)((char *)a2 + v50);
    *(void *)((char *)a1 + v50) = v95;
    uint64_t v52 = a3[21];
    *(void *)((char *)a1 + a3[20]) = *(void *)((char *)a2 + a3[20]);
    uint64_t v53 = (void *)((char *)a1 + v52);
    uint64_t v54 = (void *)((char *)a2 + v52);
    uint64_t v55 = v54[1];
    *uint64_t v53 = *v54;
    v53[1] = v55;
    uint64_t v56 = a3[22];
    uint64_t v57 = (void *)((char *)a1 + v56);
    long long v100 = a2;
    uint64_t v58 = (char *)a2 + v56;
    v59 = *(void **)v58;
    uint64_t v60 = (void *)*((void *)v58 + 1);
    void *v57 = *(void *)v58;
    v57[1] = v60;
    uint64_t v61 = type metadata accessor for AsyncIconImage.LoadingState();
    uint64_t v62 = *(int *)(v61 + 40);
    uint64_t v98 = v58;
    uint64_t v99 = v57;
    __dst = (char *)v57 + v62;
    uint64_t v97 = v61;
    uint64_t v63 = &v58[v62];
    uint64_t v64 = (int *)type metadata accessor for IconEnvironmentTraits();
    uint64_t v93 = *((void *)v64 - 1);
    long long v94 = *(unsigned int (**)(char *, uint64_t, int *))(v93 + 48);
    id v65 = v51;
    id v66 = v95;
    swift_retain();
    swift_retain();
    id v67 = v59;
    id v68 = v60;
    if (v94(v63, 1, v64))
    {
      uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
      memcpy(__dst, v63, *(void *)(*(void *)(v69 - 8) + 64));
    }
    else
    {
      uint64_t v70 = sub_2627DBEB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 16))(__dst, v63, v70);
      uint64_t v71 = v64[5];
      id v72 = &__dst[v71];
      v73 = &v63[v71];
      uint64_t v74 = sub_2627DBFE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v74 - 8) + 16))(v72, v73, v74);
      uint64_t v75 = v64[6];
      uint64_t v76 = &__dst[v75];
      v77 = &v63[v75];
      uint64_t v78 = sub_2627DBEE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v78 - 8) + 16))(v76, v77, v78);
      uint64_t v79 = v64[7];
      uint64_t v80 = &__dst[v79];
      unint64_t v81 = &v63[v79];
      *(void *)uint64_t v80 = *(void *)v81;
      v80[8] = v81[8];
      __dst[v64[8]] = v63[v64[8]];
      *(void *)&__dst[v64[9]] = *(void *)&v63[v64[9]];
      *(void *)&__dst[v64[10]] = *(void *)&v63[v64[10]];
      uint64_t v82 = v64[11];
      uint64_t v83 = *(void **)&v63[v82];
      *(void *)&__dst[v82] = v83;
      uint64_t v84 = *(void (**)(char *, void, uint64_t, int *))(v93 + 56);
      id v85 = v83;
      v84(__dst, 0, 1, v64);
    }
    *(void *)((char *)v99 + *(int *)(v97 + 44)) = *(void *)&v98[*(int *)(v97 + 44)];
    uint64_t v86 = *(int *)(v97 + 48);
    unint64_t v87 = *(void *)&v98[v86];
    swift_retain();
    sub_2627D5CD8(v87);
    *(void *)((char *)v99 + v86) = v87;
    uint64_t v88 = sub_2627DC0F0();
    *(void *)((char *)v99 + *(int *)(v88 + 28)) = *(void *)&v98[*(int *)(v88 + 28)];
    uint64_t v89 = a3[23];
    uint64_t v90 = *(void **)((char *)v100 + v89);
    *(void *)((char *)a1 + v89) = v90;
    swift_retain();
    id v91 = v90;
  }
  return a1;
}

uint64_t sub_2627D6FC8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2627D6FD4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2627D6FE0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

id sub_2627D6FEC(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

void sub_2627D6FF8(uint64_t a1, int *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_2627DBEB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420580);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2627DBEE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  sub_2627D5CFC(*(void *)(a1 + a2[10]), *(unsigned char *)(a1 + a2[10] + 8));
  uint64_t v7 = a1 + a2[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2627DBFE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  sub_2627D5D08(*(void *)(a1 + a2[12]), *(void *)(a1 + a2[12] + 8), *(unsigned __int8 *)(a1 + a2[12] + 16), *(unsigned char *)(a1 + a2[12] + 17));
  sub_2627D5CFC(*(void *)(a1 + a2[13]), *(unsigned char *)(a1 + a2[13] + 8));
  sub_2627D5D14(*(void *)(a1 + a2[14]), *(unsigned __int8 *)(a1 + a2[14] + 8), *(unsigned char *)(a1 + a2[14] + 9));
  sub_2627D5D14(*(void *)(a1 + a2[15]), *(unsigned __int8 *)(a1 + a2[15] + 8), *(unsigned char *)(a1 + a2[15] + 9));
  sub_2627D5CFC(*(void *)(a1 + a2[16]), *(unsigned char *)(a1 + a2[16] + 8));
  sub_2627D5D20(*(id *)(a1 + a2[17]), *(unsigned char *)(a1 + a2[17] + 8));

  swift_release();
  swift_release();
  uint64_t v9 = (id *)(a1 + a2[22]);

  uint64_t v10 = type metadata accessor for AsyncIconImage.LoadingState();
  uint64_t v11 = (char *)v9 + *(int *)(v10 + 40);
  uint64_t v12 = (int *)type metadata accessor for IconEnvironmentTraits();
  if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v12 - 1) + 48))(v11, 1, v12))
  {
    uint64_t v13 = sub_2627DBEB0();
    (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v11, v13);
    unint64_t v14 = &v11[v12[5]];
    uint64_t v15 = sub_2627DBFE0();
    (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
    uint64_t v16 = &v11[v12[6]];
    uint64_t v17 = sub_2627DBEE0();
    (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  swift_release();
  sub_2627D5D2C(*(unint64_t *)((char *)v9 + *(int *)(v10 + 48)));
  sub_2627DC0F0();
  swift_release();
  uint64_t v18 = *(void **)(a1 + a2[23]);
}

void *sub_2627D73BC(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2627DBEB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[9];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420580);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2627DBEE0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[10];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)v13;
  char v15 = v13[8];
  sub_2627D6FC8(*(void *)v13, v15);
  *(void *)uint64_t v12 = v14;
  v12[8] = v15;
  uint64_t v16 = a3[11];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_2627DBFE0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  }
  else
  {
    *uint64_t v17 = *v18;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v20 = a3[12];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = *(void *)v22;
  uint64_t v24 = *((void *)v22 + 1);
  char v25 = v22[17];
  unsigned __int8 v26 = v22[16];
  sub_2627D6FD4(*(void *)v22, v24, v26, v25);
  *(void *)uint64_t v21 = v23;
  *((void *)v21 + 1) = v24;
  v21[16] = v26;
  v21[17] = v25;
  uint64_t v27 = a3[13];
  unsigned __int8 v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  uint64_t v30 = *(void *)v29;
  LOBYTE(v24) = v29[8];
  sub_2627D6FC8(*(void *)v29, v24);
  *(void *)unsigned __int8 v28 = v30;
  v28[8] = v24;
  uint64_t v31 = a3[14];
  uint64_t v32 = (char *)a1 + v31;
  uint64_t v33 = (char *)a2 + v31;
  uint64_t v34 = *(void *)v33;
  LOBYTE(v24) = v33[9];
  LOBYTE(v28) = v33[8];
  sub_2627D6FE0(*(void *)v33, v28, v24);
  *(void *)uint64_t v32 = v34;
  v32[8] = (char)v28;
  v32[9] = v24;
  uint64_t v35 = a3[15];
  uint64_t v36 = (char *)a1 + v35;
  uint64_t v37 = (char *)a2 + v35;
  uint64_t v38 = *(void *)v37;
  LOBYTE(v24) = v37[9];
  LOBYTE(v28) = v37[8];
  sub_2627D6FE0(*(void *)v37, v28, v24);
  *(void *)uint64_t v36 = v38;
  v36[8] = (char)v28;
  v36[9] = v24;
  uint64_t v39 = a3[16];
  uint64_t v40 = (char *)a1 + v39;
  uint64_t v41 = (char *)a2 + v39;
  uint64_t v42 = *(void *)v41;
  LOBYTE(v24) = v41[8];
  sub_2627D6FC8(*(void *)v41, v24);
  *(void *)uint64_t v40 = v42;
  v40[8] = v24;
  uint64_t v43 = a3[17];
  uint64_t v44 = (char *)a1 + v43;
  uint64_t v45 = (char *)a2 + v43;
  id v46 = *(id *)v45;
  LOBYTE(v24) = v45[8];
  sub_2627D6FEC(*(id *)v45, v24);
  *(void *)uint64_t v44 = v46;
  v44[8] = v24;
  uint64_t v47 = a3[18];
  uint64_t v48 = a3[19];
  uint64_t v49 = *(void **)((char *)a2 + v47);
  *(void *)((char *)a1 + v47) = v49;
  uint64_t v50 = *(void **)((char *)a2 + v48);
  *(void *)((char *)a1 + v48) = v50;
  uint64_t v51 = a3[21];
  *(void *)((char *)a1 + a3[20]) = *(void *)((char *)a2 + a3[20]);
  uint64_t v52 = (void *)((char *)a1 + v51);
  uint64_t v53 = (void *)((char *)a2 + v51);
  uint64_t v54 = v53[1];
  *uint64_t v52 = *v53;
  v52[1] = v54;
  uint64_t v55 = a3[22];
  uint64_t v56 = (void *)((char *)a1 + v55);
  uint64_t v98 = a2;
  uint64_t v57 = (char *)a2 + v55;
  v59 = *(void **)((char *)a2 + v55);
  uint64_t v58 = *(void **)((char *)a2 + v55 + 8);
  void *v56 = v59;
  v56[1] = v58;
  uint64_t v60 = type metadata accessor for AsyncIconImage.LoadingState();
  uint64_t v61 = *(int *)(v60 + 40);
  unint64_t v96 = v57;
  uint64_t v97 = v56;
  __dst = (char *)v56 + v61;
  uint64_t v95 = v60;
  uint64_t v93 = &v57[v61];
  uint64_t v62 = (int *)type metadata accessor for IconEnvironmentTraits();
  uint64_t v92 = *((void *)v62 - 1);
  uint64_t v63 = *(unsigned int (**)(char *, uint64_t, int *))(v92 + 48);
  id v64 = v49;
  id v65 = v50;
  swift_retain();
  swift_retain();
  id v66 = v59;
  id v67 = v58;
  if (v63(v93, 1, v62))
  {
    uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
    memcpy(__dst, v93, *(void *)(*(void *)(v68 - 8) + 64));
  }
  else
  {
    uint64_t v69 = sub_2627DBEB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v69 - 8) + 16))(__dst, v93, v69);
    uint64_t v70 = v62[5];
    uint64_t v71 = &__dst[v70];
    id v72 = &v93[v70];
    uint64_t v73 = sub_2627DBFE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 16))(v71, v72, v73);
    uint64_t v74 = v62[6];
    uint64_t v75 = &__dst[v74];
    uint64_t v76 = &v93[v74];
    uint64_t v77 = sub_2627DBEE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v77 - 8) + 16))(v75, v76, v77);
    uint64_t v78 = v62[7];
    uint64_t v79 = &__dst[v78];
    uint64_t v80 = &v93[v78];
    *(void *)uint64_t v79 = *(void *)v80;
    v79[8] = v80[8];
    __dst[v62[8]] = v93[v62[8]];
    *(void *)&__dst[v62[9]] = *(void *)&v93[v62[9]];
    *(void *)&__dst[v62[10]] = *(void *)&v93[v62[10]];
    uint64_t v81 = v62[11];
    uint64_t v82 = *(void **)&v93[v81];
    *(void *)&__dst[v81] = v82;
    uint64_t v83 = *(void (**)(char *, void, uint64_t, int *))(v92 + 56);
    id v84 = v82;
    v83(__dst, 0, 1, v62);
  }
  *(void *)((char *)v97 + *(int *)(v95 + 44)) = *(void *)&v96[*(int *)(v95 + 44)];
  uint64_t v85 = *(int *)(v95 + 48);
  unint64_t v86 = *(void *)&v96[v85];
  swift_retain();
  sub_2627D5CD8(v86);
  *(void *)((char *)v97 + v85) = v86;
  uint64_t v87 = sub_2627DC0F0();
  *(void *)((char *)v97 + *(int *)(v87 + 28)) = *(void *)&v96[*(int *)(v87 + 28)];
  uint64_t v88 = a3[23];
  uint64_t v89 = *(void **)((char *)v98 + v88);
  *(void *)((char *)a1 + v88) = v89;
  swift_retain();
  id v90 = v89;
  return a1;
}

void *sub_2627D79C0(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_2627DBD38((uint64_t)a1, &qword_26B420570);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B420570);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_2627DBEB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[9];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_2627DBD38((uint64_t)a1 + v7, &qword_26B420580);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B420580);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_2627DBEE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = a3[10];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)v13;
  char v15 = v13[8];
  sub_2627D6FC8(*(void *)v13, v15);
  uint64_t v16 = *(void *)v12;
  char v17 = v12[8];
  *(void *)uint64_t v12 = v14;
  v12[8] = v15;
  sub_2627D5CFC(v16, v17);
  if (a1 != a2)
  {
    uint64_t v18 = a3[11];
    uint64_t v19 = (void *)((char *)a1 + v18);
    uint64_t v20 = (void *)((char *)a2 + v18);
    sub_2627DBD38((uint64_t)a1 + v18, &qword_26B420590);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B420590);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = sub_2627DBFE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    }
    else
    {
      void *v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v22 = a3[12];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = *(void *)v24;
  uint64_t v26 = *((void *)v24 + 1);
  char v27 = v24[17];
  unsigned __int8 v28 = v24[16];
  sub_2627D6FD4(*(void *)v24, v26, v28, v27);
  uint64_t v29 = *(void *)v23;
  uint64_t v30 = *((void *)v23 + 1);
  char v31 = v23[17];
  *(void *)uint64_t v23 = v25;
  *((void *)v23 + 1) = v26;
  uint64_t v32 = v23[16];
  v23[16] = v28;
  v23[17] = v27;
  sub_2627D5D08(v29, v30, v32, v31);
  uint64_t v33 = a3[13];
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = *(void *)v35;
  LOBYTE(v26) = v35[8];
  sub_2627D6FC8(*(void *)v35, v26);
  uint64_t v37 = *(void *)v34;
  char v38 = v34[8];
  *(void *)uint64_t v34 = v36;
  v34[8] = v26;
  sub_2627D5CFC(v37, v38);
  uint64_t v39 = a3[14];
  uint64_t v40 = (char *)a1 + v39;
  uint64_t v41 = (char *)a2 + v39;
  uint64_t v42 = *(void *)v41;
  LOBYTE(v26) = v41[9];
  LOBYTE(v34) = v41[8];
  sub_2627D6FE0(*(void *)v41, v34, v26);
  uint64_t v43 = *(void *)v40;
  char v44 = v40[9];
  *(void *)uint64_t v40 = v42;
  uint64_t v45 = v40[8];
  v40[8] = (char)v34;
  v40[9] = v26;
  sub_2627D5D14(v43, v45, v44);
  uint64_t v46 = a3[15];
  uint64_t v47 = (char *)a1 + v46;
  uint64_t v48 = (char *)a2 + v46;
  uint64_t v49 = *(void *)v48;
  LOBYTE(v26) = v48[9];
  LOBYTE(v34) = v48[8];
  sub_2627D6FE0(*(void *)v48, v34, v26);
  uint64_t v50 = *(void *)v47;
  char v51 = v47[9];
  *(void *)uint64_t v47 = v49;
  uint64_t v52 = v47[8];
  v47[8] = (char)v34;
  v47[9] = v26;
  sub_2627D5D14(v50, v52, v51);
  uint64_t v53 = a3[16];
  uint64_t v54 = (char *)a1 + v53;
  uint64_t v55 = (char *)a2 + v53;
  uint64_t v56 = *(void *)v55;
  LOBYTE(v26) = v55[8];
  sub_2627D6FC8(*(void *)v55, v26);
  uint64_t v57 = *(void *)v54;
  char v58 = v54[8];
  *(void *)uint64_t v54 = v56;
  v54[8] = v26;
  sub_2627D5CFC(v57, v58);
  uint64_t v59 = a3[17];
  uint64_t v60 = (char *)a1 + v59;
  uint64_t v61 = (char *)a2 + v59;
  id v62 = *(id *)v61;
  LOBYTE(v26) = v61[8];
  sub_2627D6FEC(*(id *)v61, v26);
  uint64_t v63 = *(void **)v60;
  char v64 = v60[8];
  *(void *)uint64_t v60 = v62;
  v60[8] = v26;
  sub_2627D5D20(v63, v64);
  uint64_t v65 = a3[18];
  id v66 = *(void **)((char *)a2 + v65);
  id v67 = *(void **)((char *)a1 + v65);
  *(void *)((char *)a1 + v65) = v66;
  id v68 = v66;

  uint64_t v69 = a3[19];
  uint64_t v70 = *(void **)((char *)a1 + v69);
  uint64_t v71 = *(void **)((char *)a2 + v69);
  *(void *)((char *)a1 + v69) = v71;
  id v72 = v71;

  *(void *)((char *)a1 + a3[20]) = *(void *)((char *)a2 + a3[20]);
  swift_retain();
  swift_release();
  uint64_t v73 = a3[21];
  uint64_t v74 = (void *)((char *)a1 + v73);
  uint64_t v75 = (void *)((char *)a2 + v73);
  uint64_t v76 = v75[1];
  *uint64_t v74 = *v75;
  v74[1] = v76;
  swift_retain();
  swift_release();
  uint64_t v77 = a3[22];
  uint64_t v78 = (void *)((char *)a1 + v77);
  uint64_t v79 = (char *)a2 + v77;
  uint64_t v80 = *(void **)((char *)a1 + v77);
  uint64_t v81 = *(void **)((char *)a2 + v77);
  *uint64_t v78 = v81;
  id v82 = v81;

  uint64_t v83 = (void *)v78[1];
  id v84 = (void *)*((void *)v79 + 1);
  v78[1] = v84;
  id v85 = v84;

  v137 = (int *)type metadata accessor for AsyncIconImage.LoadingState();
  v138 = v79;
  uint64_t v86 = v137[10];
  uint64_t v87 = (char *)v78 + v86;
  uint64_t v88 = &v79[v86];
  uint64_t v89 = (int *)type metadata accessor for IconEnvironmentTraits();
  uint64_t v136 = *((void *)v89 - 1);
  id v90 = *(uint64_t (**)(char *, uint64_t, int *))(v136 + 48);
  LODWORD(v23) = v90(v87, 1, v89);
  int v91 = v90(v88, 1, v89);
  if (!v23)
  {
    if (!v91)
    {
      uint64_t v119 = sub_2627DBEB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v119 - 8) + 24))(v87, v88, v119);
      uint64_t v120 = v89[5];
      id v121 = &v87[v120];
      v122 = &v88[v120];
      uint64_t v123 = sub_2627DBFE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v123 - 8) + 24))(v121, v122, v123);
      uint64_t v124 = v89[6];
      uint64_t v125 = &v87[v124];
      uint64_t v126 = &v88[v124];
      uint64_t v127 = sub_2627DBEE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v127 - 8) + 24))(v125, v126, v127);
      uint64_t v128 = v89[7];
      v129 = &v87[v128];
      v130 = &v88[v128];
      uint64_t v131 = *(void *)v130;
      v129[8] = v130[8];
      *(void *)v129 = v131;
      v87[v89[8]] = v88[v89[8]];
      *(void *)&v87[v89[9]] = *(void *)&v88[v89[9]];
      *(void *)&v87[v89[10]] = *(void *)&v88[v89[10]];
      uint64_t v132 = v89[11];
      v133 = *(void **)&v87[v132];
      v134 = *(void **)&v88[v132];
      *(void *)&v87[v132] = v134;
      id v135 = v134;

      goto LABEL_20;
    }
    sub_2627D8204((uint64_t)v87);
    goto LABEL_19;
  }
  if (v91)
  {
LABEL_19:
    uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
    memcpy(v87, v88, *(void *)(*(void *)(v109 - 8) + 64));
    goto LABEL_20;
  }
  uint64_t v92 = sub_2627DBEB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v92 - 8) + 16))(v87, v88, v92);
  uint64_t v93 = v89[5];
  long long v94 = &v87[v93];
  uint64_t v95 = &v88[v93];
  uint64_t v96 = sub_2627DBFE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v96 - 8) + 16))(v94, v95, v96);
  uint64_t v97 = v89[6];
  uint64_t v98 = &v87[v97];
  uint64_t v99 = &v88[v97];
  uint64_t v100 = sub_2627DBEE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v100 - 8) + 16))(v98, v99, v100);
  uint64_t v101 = v89[7];
  uint64_t v102 = &v87[v101];
  v103 = &v88[v101];
  uint64_t v104 = *(void *)v103;
  v102[8] = v103[8];
  *(void *)uint64_t v102 = v104;
  v87[v89[8]] = v88[v89[8]];
  *(void *)&v87[v89[9]] = *(void *)&v88[v89[9]];
  *(void *)&v87[v89[10]] = *(void *)&v88[v89[10]];
  uint64_t v105 = v89[11];
  uint64_t v106 = *(void **)&v88[v105];
  *(void *)&v87[v105] = v106;
  uint64_t v107 = *(void (**)(char *, void, uint64_t, int *))(v136 + 56);
  id v108 = v106;
  v107(v87, 0, 1, v89);
LABEL_20:
  *(void *)((char *)v78 + v137[11]) = *(void *)&v138[v137[11]];
  swift_retain();
  swift_release();
  uint64_t v110 = v137[12];
  unint64_t v111 = *(void *)&v138[v110];
  sub_2627D5CD8(v111);
  unint64_t v112 = *(void *)((char *)v78 + v110);
  *(void *)((char *)v78 + v110) = v111;
  sub_2627D5D2C(v112);
  uint64_t v113 = sub_2627DC0F0();
  *(void *)((char *)v78 + *(int *)(v113 + 28)) = *(void *)&v138[*(int *)(v113 + 28)];
  swift_retain();
  swift_release();
  uint64_t v114 = a3[23];
  v115 = *(void **)((char *)a1 + v114);
  v116 = *(void **)((char *)a2 + v114);
  *(void *)((char *)a1 + v114) = v116;
  id v117 = v116;

  return a1;
}

uint64_t sub_2627D8204(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IconEnvironmentTraits();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_2627D8260(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2627DBEB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[9];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420580);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_2627DBEE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[10];
  uint64_t v14 = a3[11];
  char v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  *(void *)char v15 = *(void *)v16;
  v15[8] = v16[8];
  char v17 = &a1[v14];
  uint64_t v18 = &a2[v14];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_2627DBFE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v17, v18, v20);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  uint64_t v21 = a3[12];
  uint64_t v22 = a3[13];
  uint64_t v23 = &a1[v21];
  uint64_t v24 = &a2[v21];
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  *((_WORD *)v23 + 8) = *((_WORD *)v24 + 8);
  uint64_t v25 = &a1[v22];
  uint64_t v26 = &a2[v22];
  *(void *)uint64_t v25 = *(void *)v26;
  v25[8] = v26[8];
  uint64_t v27 = a3[14];
  uint64_t v28 = a3[15];
  uint64_t v29 = &a1[v27];
  uint64_t v30 = &a2[v27];
  *(void *)uint64_t v29 = *(void *)v30;
  *((_WORD *)v29 + 4) = *((_WORD *)v30 + 4);
  char v31 = &a1[v28];
  uint64_t v32 = &a2[v28];
  *(void *)char v31 = *(void *)v32;
  *((_WORD *)v31 + 4) = *((_WORD *)v32 + 4);
  uint64_t v33 = a3[16];
  uint64_t v34 = a3[17];
  uint64_t v35 = &a1[v33];
  uint64_t v36 = &a2[v33];
  uint64_t v37 = *(void *)v36;
  v35[8] = v36[8];
  *(void *)uint64_t v35 = v37;
  char v38 = &a1[v34];
  uint64_t v39 = &a2[v34];
  v38[8] = v39[8];
  *(void *)char v38 = *(void *)v39;
  uint64_t v40 = a3[19];
  *(void *)&a1[a3[18]] = *(void *)&a2[a3[18]];
  *(void *)&a1[v40] = *(void *)&a2[v40];
  uint64_t v41 = a3[21];
  *(void *)&a1[a3[20]] = *(void *)&a2[a3[20]];
  *(_OWORD *)&a1[v41] = *(_OWORD *)&a2[v41];
  uint64_t v42 = a3[22];
  uint64_t v43 = &a1[v42];
  char v44 = &a2[v42];
  *(_OWORD *)&a1[v42] = *(_OWORD *)&a2[v42];
  uint64_t v45 = (int *)type metadata accessor for AsyncIconImage.LoadingState();
  uint64_t v46 = v45[10];
  uint64_t v47 = &v43[v46];
  uint64_t v48 = &v44[v46];
  uint64_t v49 = (int *)type metadata accessor for IconEnvironmentTraits();
  uint64_t v50 = *((void *)v49 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v50 + 48))(v48, 1, v49))
  {
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
    memcpy(v47, v48, *(void *)(*(void *)(v51 - 8) + 64));
  }
  else
  {
    uint64_t v52 = sub_2627DBEB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 32))(v47, v48, v52);
    uint64_t v53 = v49[5];
    id v62 = &v48[v53];
    char v64 = &v47[v53];
    uint64_t v54 = sub_2627DBFE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 32))(v64, v62, v54);
    uint64_t v55 = v49[6];
    uint64_t v63 = &v48[v55];
    uint64_t v65 = &v47[v55];
    uint64_t v56 = sub_2627DBEE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 32))(v65, v63, v56);
    uint64_t v57 = v49[7];
    char v58 = &v47[v57];
    uint64_t v59 = &v48[v57];
    *(void *)char v58 = *(void *)v59;
    v58[8] = v59[8];
    v47[v49[8]] = v48[v49[8]];
    *(void *)&v47[v49[9]] = *(void *)&v48[v49[9]];
    *(void *)&v47[v49[10]] = *(void *)&v48[v49[10]];
    *(void *)&v47[v49[11]] = *(void *)&v48[v49[11]];
    (*(void (**)(char *, void, uint64_t, int *))(v50 + 56))(v47, 0, 1, v49);
  }
  *(void *)&v43[v45[11]] = *(void *)&v44[v45[11]];
  *(void *)&v43[v45[12]] = *(void *)&v44[v45[12]];
  uint64_t v60 = sub_2627DC0F0();
  *(void *)&v43[*(int *)(v60 + 28)] = *(void *)&v44[*(int *)(v60 + 28)];
  *(void *)&a1[a3[23]] = *(void *)&a2[a3[23]];
  return a1;
}

char *sub_2627D8794(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_2627DBD38((uint64_t)a1, &qword_26B420570);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420570);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2627DBEB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[9];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_2627DBD38((uint64_t)&a1[v8], &qword_26B420580);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420580);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_2627DBEE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[10];
  uint64_t v14 = &a1[v13];
  char v15 = &a2[v13];
  uint64_t v16 = *(void *)v15;
  LOBYTE(v15) = v15[8];
  uint64_t v17 = *(void *)v14;
  char v18 = v14[8];
  *(void *)uint64_t v14 = v16;
  v14[8] = (char)v15;
  sub_2627D5CFC(v17, v18);
  if (a1 != a2)
  {
    uint64_t v19 = a3[11];
    uint64_t v20 = &a1[v19];
    uint64_t v21 = &a2[v19];
    sub_2627DBD38((uint64_t)&a1[v19], &qword_26B420590);
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420590);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = sub_2627DBFE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v20, v21, v23);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
  }
  uint64_t v24 = a3[12];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  char v27 = v26[16];
  char v28 = v26[17];
  uint64_t v29 = *(void *)v25;
  uint64_t v30 = *((void *)v25 + 1);
  char v31 = v25[17];
  *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  uint64_t v32 = v25[16];
  v25[16] = v27;
  v25[17] = v28;
  sub_2627D5D08(v29, v30, v32, v31);
  uint64_t v33 = a3[13];
  uint64_t v34 = &a1[v33];
  uint64_t v35 = &a2[v33];
  uint64_t v36 = *(void *)v35;
  LOBYTE(v35) = v35[8];
  uint64_t v37 = *(void *)v34;
  char v38 = v34[8];
  *(void *)uint64_t v34 = v36;
  v34[8] = (char)v35;
  sub_2627D5CFC(v37, v38);
  uint64_t v39 = a3[14];
  uint64_t v40 = &a1[v39];
  uint64_t v41 = &a2[v39];
  uint64_t v42 = *(void *)v41;
  char v43 = v41[8];
  LOBYTE(v41) = v41[9];
  uint64_t v44 = *(void *)v40;
  char v45 = v40[9];
  *(void *)uint64_t v40 = v42;
  uint64_t v46 = v40[8];
  v40[8] = v43;
  v40[9] = (char)v41;
  sub_2627D5D14(v44, v46, v45);
  uint64_t v47 = a3[15];
  uint64_t v48 = &a1[v47];
  uint64_t v49 = &a2[v47];
  uint64_t v50 = *(void *)v49;
  char v51 = v49[8];
  LOBYTE(v49) = v49[9];
  uint64_t v52 = *(void *)v48;
  char v53 = v48[9];
  *(void *)uint64_t v48 = v50;
  uint64_t v54 = v48[8];
  v48[8] = v51;
  v48[9] = (char)v49;
  sub_2627D5D14(v52, v54, v53);
  uint64_t v55 = a3[16];
  uint64_t v56 = &a1[v55];
  uint64_t v57 = &a2[v55];
  uint64_t v58 = *(void *)v57;
  LOBYTE(v57) = v57[8];
  uint64_t v59 = *(void *)v56;
  char v60 = v56[8];
  *(void *)uint64_t v56 = v58;
  v56[8] = (char)v57;
  sub_2627D5CFC(v59, v60);
  uint64_t v61 = a3[17];
  id v62 = &a1[v61];
  uint64_t v63 = &a2[v61];
  uint64_t v64 = *(void *)v63;
  LOBYTE(v63) = v63[8];
  uint64_t v65 = *(void **)v62;
  char v66 = v62[8];
  *(void *)id v62 = v64;
  v62[8] = (char)v63;
  sub_2627D5D20(v65, v66);
  uint64_t v67 = a3[18];
  id v68 = *(void **)&a1[v67];
  *(void *)&a1[v67] = *(void *)&a2[v67];

  uint64_t v69 = a3[19];
  uint64_t v70 = *(void **)&a1[v69];
  *(void *)&a1[v69] = *(void *)&a2[v69];

  *(void *)&a1[a3[20]] = *(void *)&a2[a3[20]];
  swift_release();
  *(_OWORD *)&a1[a3[21]] = *(_OWORD *)&a2[a3[21]];
  swift_release();
  uint64_t v71 = a3[22];
  id v72 = &a1[v71];
  uint64_t v73 = &a2[v71];
  uint64_t v74 = *(void **)&a1[v71];
  *(void *)id v72 = *(void *)v73;

  uint64_t v75 = (void *)*((void *)v72 + 1);
  *((void *)v72 + 1) = *((void *)v73 + 1);

  id v117 = (int *)type metadata accessor for AsyncIconImage.LoadingState();
  v118 = v73;
  uint64_t v76 = v117[10];
  uint64_t v77 = &v72[v76];
  uint64_t v78 = &v73[v76];
  uint64_t v79 = (int *)type metadata accessor for IconEnvironmentTraits();
  uint64_t v116 = *((void *)v79 - 1);
  uint64_t v80 = *(uint64_t (**)(char *, uint64_t, int *))(v116 + 48);
  int v81 = v80(v77, 1, v79);
  int v82 = v80(v78, 1, v79);
  if (!v81)
  {
    if (!v82)
    {
      uint64_t v102 = sub_2627DBEB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v102 - 8) + 40))(v77, v78, v102);
      uint64_t v103 = v79[5];
      uint64_t v104 = &v77[v103];
      uint64_t v105 = &v78[v103];
      uint64_t v106 = sub_2627DBFE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v106 - 8) + 40))(v104, v105, v106);
      uint64_t v107 = v79[6];
      id v108 = &v77[v107];
      uint64_t v109 = &v78[v107];
      uint64_t v110 = sub_2627DBEE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v110 - 8) + 40))(v108, v109, v110);
      uint64_t v111 = v79[7];
      unint64_t v112 = &v77[v111];
      uint64_t v113 = &v78[v111];
      *(void *)unint64_t v112 = *(void *)v113;
      v112[8] = v113[8];
      v77[v79[8]] = v78[v79[8]];
      *(void *)&v77[v79[9]] = *(void *)&v78[v79[9]];
      *(void *)&v77[v79[10]] = *(void *)&v78[v79[10]];
      uint64_t v114 = v79[11];
      v115 = *(void **)&v77[v114];
      *(void *)&v77[v114] = *(void *)&v78[v114];

      goto LABEL_18;
    }
    sub_2627D8204((uint64_t)v77);
    goto LABEL_17;
  }
  if (v82)
  {
LABEL_17:
    uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
    memcpy(v77, v78, *(void *)(*(void *)(v95 - 8) + 64));
    goto LABEL_18;
  }
  uint64_t v83 = sub_2627DBEB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v83 - 8) + 32))(v77, v78, v83);
  uint64_t v84 = v79[5];
  id v85 = &v77[v84];
  uint64_t v86 = &v78[v84];
  uint64_t v87 = sub_2627DBFE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 32))(v85, v86, v87);
  uint64_t v88 = v79[6];
  uint64_t v89 = &v77[v88];
  id v90 = &v78[v88];
  uint64_t v91 = sub_2627DBEE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v91 - 8) + 32))(v89, v90, v91);
  uint64_t v92 = v79[7];
  uint64_t v93 = &v77[v92];
  long long v94 = &v78[v92];
  *(void *)uint64_t v93 = *(void *)v94;
  v93[8] = v94[8];
  v77[v79[8]] = v78[v79[8]];
  *(void *)&v77[v79[9]] = *(void *)&v78[v79[9]];
  *(void *)&v77[v79[10]] = *(void *)&v78[v79[10]];
  *(void *)&v77[v79[11]] = *(void *)&v78[v79[11]];
  (*(void (**)(char *, void, uint64_t, int *))(v116 + 56))(v77, 0, 1, v79);
LABEL_18:
  *(void *)&v72[v117[11]] = *(void *)((char *)v118 + v117[11]);
  swift_release();
  uint64_t v96 = v117[12];
  unint64_t v97 = *(void *)&v72[v96];
  *(void *)&v72[v96] = *(void *)((char *)v118 + v96);
  sub_2627D5D2C(v97);
  uint64_t v98 = sub_2627DC0F0();
  *(void *)&v72[*(int *)(v98 + 28)] = *(void *)((char *)v118 + *(int *)(v98 + 28));
  swift_release();
  uint64_t v99 = a3[23];
  uint64_t v100 = *(void **)&a1[v99];
  *(void *)&a1[v99] = *(void *)&a2[v99];

  return a1;
}

uint64_t sub_2627D8F4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2627D8F60);
}

uint64_t sub_2627D8F60(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A962C08);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A962C10);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[9];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A962C18);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[11];
    goto LABEL_7;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v16 = *(void *)(a1 + a3[18]);
    if (v16 >= 0xFFFFFFFF) {
      LODWORD(v16) = -1;
    }
    return (v16 + 1);
  }
  else
  {
    type metadata accessor for AsyncIconImage.LoadingState();
    uint64_t v17 = sub_2627DC0F0();
    char v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
    uint64_t v19 = v17;
    uint64_t v20 = a1 + a3[22];
    return v18(v20, a2, v19);
  }
}

uint64_t sub_2627D9148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2627D915C);
}

uint64_t sub_2627D915C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A962C08);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_8:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A962C10);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[9];
LABEL_7:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_8;
  }
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26A962C18);
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v14 = *(void *)(result - 8);
    uint64_t v15 = a4[11];
    goto LABEL_7;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[18]) = (a2 - 1);
  }
  else
  {
    type metadata accessor for AsyncIconImage.LoadingState();
    uint64_t v17 = sub_2627DC0F0();
    char v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
    uint64_t v19 = v17;
    uint64_t v20 = a1 + a4[22];
    return v18(v20, a2, a2, v19);
  }
  return result;
}

uint64_t sub_2627D9344()
{
  return swift_getWitnessTable();
}

uint64_t sub_2627D94A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_2627D94B4(unint64_t *a1)
{
  sub_2627D5D2C(*a1);
  return swift_release();
}

unint64_t *sub_2627D94F0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  sub_2627D5CD8(*a2);
  unint64_t v6 = a2[1];
  unint64_t v5 = a2[2];
  *a1 = v4;
  a1[1] = v6;
  a1[2] = v5;
  swift_retain();
  return a1;
}

unint64_t *sub_2627D953C(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  sub_2627D5CD8(*a2);
  unint64_t v5 = *a1;
  *a1 = v4;
  sub_2627D5D2C(v5);
  unint64_t v6 = a2[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2627D959C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  sub_2627D5D2C(v4);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t sub_2627D95E4(uint64_t a1, int a2)
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

uint64_t sub_2627D962C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

uint64_t sub_2627D966C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

void sub_2627D9674()
{
  sub_2627DA920(319, &qword_26B420550, (uint64_t (*)(uint64_t))type metadata accessor for IconEnvironmentTraits, MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

char *sub_2627D9748(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  unint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2[1];
    *((void *)a1 + 1) = v8;
    uint64_t v9 = a3[10];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = (int *)type metadata accessor for IconEnvironmentTraits();
    uint64_t v37 = *((void *)v12 - 1);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, int *))(v37 + 48);
    uint64_t v14 = v4;
    uint64_t v15 = v8;
    if (v13(v11, 1, v12))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
      memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      uint64_t v17 = sub_2627DBEB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v10, v11, v17);
      uint64_t v18 = v12[5];
      uint64_t v19 = &v10[v18];
      uint64_t v20 = &v11[v18];
      uint64_t v21 = sub_2627DBFE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
      uint64_t v22 = v12[6];
      uint64_t v23 = &v10[v22];
      uint64_t v24 = &v11[v22];
      uint64_t v25 = sub_2627DBEE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
      uint64_t v26 = v12[7];
      char v27 = &v10[v26];
      char v28 = &v11[v26];
      *(void *)char v27 = *(void *)v28;
      v27[8] = v28[8];
      v10[v12[8]] = v11[v12[8]];
      *(void *)&v10[v12[9]] = *(void *)&v11[v12[9]];
      *(void *)&v10[v12[10]] = *(void *)&v11[v12[10]];
      uint64_t v29 = v12[11];
      uint64_t v30 = *(void **)&v11[v29];
      *(void *)&v10[v29] = v30;
      char v31 = *(void (**)(char *, void, uint64_t, int *))(v37 + 56);
      id v32 = v30;
      v31(v10, 0, 1, v12);
    }
    uint64_t v33 = a3[11];
    uint64_t v34 = a3[12];
    *(void *)&v7[v33] = *(char **)((char *)a2 + v33);
    unint64_t v35 = *(unint64_t *)((char *)a2 + v34);
    swift_retain();
    sub_2627D5CD8(v35);
    *(void *)&v7[v34] = v35;
  }
  return v7;
}

void sub_2627D99F8(id *a1, uint64_t a2)
{
  unint64_t v4 = (char *)a1 + *(int *)(a2 + 40);
  unint64_t v5 = (int *)type metadata accessor for IconEnvironmentTraits();
  if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v5 - 1) + 48))(v4, 1, v5))
  {
    uint64_t v6 = sub_2627DBEB0();
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
    uint64_t v7 = &v4[v5[5]];
    uint64_t v8 = sub_2627DBFE0();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
    uint64_t v9 = &v4[v5[6]];
    uint64_t v10 = sub_2627DBEE0();
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  swift_release();
  unint64_t v11 = *(unint64_t *)((char *)a1 + *(int *)(a2 + 48));
  sub_2627D5D2C(v11);
}

void *sub_2627D9B70(void *a1, uint64_t a2, int *a3)
{
  unint64_t v5 = *(void **)a2;
  uint64_t v6 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v7 = a3[10];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for IconEnvironmentTraits();
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, int *))(v11 + 48);
  id v13 = v5;
  id v14 = v6;
  if (v12(v9, 1, v10))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    uint64_t v16 = sub_2627DBEB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v8, v9, v16);
    uint64_t v17 = v10[5];
    uint64_t v18 = &v8[v17];
    uint64_t v19 = &v9[v17];
    uint64_t v20 = sub_2627DBFE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    uint64_t v21 = v10[6];
    uint64_t v22 = &v8[v21];
    uint64_t v23 = &v9[v21];
    uint64_t v24 = sub_2627DBEE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
    uint64_t v25 = v10[7];
    uint64_t v26 = &v8[v25];
    char v27 = &v9[v25];
    *(void *)uint64_t v26 = *(void *)v27;
    v26[8] = v27[8];
    v8[v10[8]] = v9[v10[8]];
    *(void *)&v8[v10[9]] = *(void *)&v9[v10[9]];
    *(void *)&v8[v10[10]] = *(void *)&v9[v10[10]];
    uint64_t v28 = v10[11];
    uint64_t v29 = *(void **)&v9[v28];
    *(void *)&v8[v28] = v29;
    uint64_t v30 = *(void (**)(char *, void, uint64_t, int *))(v11 + 56);
    id v31 = v29;
    v30(v8, 0, 1, v10);
  }
  uint64_t v32 = a3[12];
  *(void *)((char *)a1 + a3[11]) = *(void *)(a2 + a3[11]);
  unint64_t v33 = *(void *)(a2 + v32);
  swift_retain();
  sub_2627D5CD8(v33);
  *(void *)((char *)a1 + v32) = v33;
  return a1;
}

uint64_t sub_2627D9DCC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  uint64_t v9 = *(void **)(a1 + 8);
  uint64_t v10 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v10;
  id v11 = v10;

  uint64_t v12 = a3[10];
  id v13 = (unsigned char *)(a1 + v12);
  id v14 = (unsigned char *)(a2 + v12);
  uint64_t v15 = (int *)type metadata accessor for IconEnvironmentTraits();
  uint64_t v16 = *((void *)v15 - 1);
  uint64_t v17 = *(uint64_t (**)(unsigned char *, uint64_t, int *))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      uint64_t v42 = sub_2627DBEB0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v42 - 8) + 24))(v13, v14, v42);
      uint64_t v43 = v15[5];
      uint64_t v44 = &v13[v43];
      char v45 = &v14[v43];
      uint64_t v46 = sub_2627DBFE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 24))(v44, v45, v46);
      uint64_t v47 = v15[6];
      uint64_t v48 = &v13[v47];
      uint64_t v49 = &v14[v47];
      uint64_t v50 = sub_2627DBEE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 24))(v48, v49, v50);
      uint64_t v51 = v15[7];
      uint64_t v52 = &v13[v51];
      char v53 = &v14[v51];
      uint64_t v54 = *(void *)v53;
      v52[8] = v53[8];
      *(void *)uint64_t v52 = v54;
      v13[v15[8]] = v14[v15[8]];
      *(void *)&v13[v15[9]] = *(void *)&v14[v15[9]];
      *(void *)&v13[v15[10]] = *(void *)&v14[v15[10]];
      uint64_t v55 = v15[11];
      uint64_t v56 = *(void **)&v13[v55];
      uint64_t v57 = *(void **)&v14[v55];
      *(void *)&v13[v55] = v57;
      id v58 = v57;

      goto LABEL_7;
    }
    sub_2627D8204((uint64_t)v13);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
    memcpy(v13, v14, *(void *)(*(void *)(v37 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v20 = sub_2627DBEB0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v20 - 8) + 16))(v13, v14, v20);
  uint64_t v21 = v15[5];
  uint64_t v22 = &v13[v21];
  uint64_t v23 = &v14[v21];
  uint64_t v24 = sub_2627DBFE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  uint64_t v25 = v15[6];
  uint64_t v26 = &v13[v25];
  char v27 = &v14[v25];
  uint64_t v28 = sub_2627DBEE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  uint64_t v29 = v15[7];
  uint64_t v30 = &v13[v29];
  id v31 = &v14[v29];
  uint64_t v32 = *(void *)v31;
  v30[8] = v31[8];
  *(void *)uint64_t v30 = v32;
  v13[v15[8]] = v14[v15[8]];
  *(void *)&v13[v15[9]] = *(void *)&v14[v15[9]];
  *(void *)&v13[v15[10]] = *(void *)&v14[v15[10]];
  uint64_t v33 = v15[11];
  uint64_t v34 = *(void **)&v14[v33];
  *(void *)&v13[v33] = v34;
  unint64_t v35 = *(void (**)(unsigned char *, void, uint64_t, int *))(v16 + 56);
  id v36 = v34;
  v35(v13, 0, 1, v15);
LABEL_7:
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_retain();
  swift_release();
  uint64_t v38 = a3[12];
  unint64_t v39 = *(void *)(a2 + v38);
  sub_2627D5CD8(v39);
  unint64_t v40 = *(void *)(a1 + v38);
  *(void *)(a1 + v38) = v39;
  sub_2627D5D2C(v40);
  return a1;
}

_OWORD *sub_2627DA1A0(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[10];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = (int *)type metadata accessor for IconEnvironmentTraits();
  uint64_t v10 = *((void *)v9 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    uint64_t v12 = sub_2627DBEB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v7, v8, v12);
    uint64_t v13 = v9[5];
    id v14 = &v7[v13];
    uint64_t v15 = &v8[v13];
    uint64_t v16 = sub_2627DBFE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
    uint64_t v17 = v9[6];
    int v18 = &v7[v17];
    int v19 = &v8[v17];
    uint64_t v20 = sub_2627DBEE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
    uint64_t v21 = v9[7];
    uint64_t v22 = &v7[v21];
    uint64_t v23 = &v8[v21];
    *(void *)uint64_t v22 = *(void *)v23;
    v22[8] = v23[8];
    v7[v9[8]] = v8[v9[8]];
    *(void *)&v7[v9[9]] = *(void *)&v8[v9[9]];
    *(void *)&v7[v9[10]] = *(void *)&v8[v9[10]];
    *(void *)&v7[v9[11]] = *(void *)&v8[v9[11]];
    (*(void (**)(char *, void, uint64_t, int *))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v24 = a3[12];
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  *(void *)((char *)a1 + v24) = *(void *)((char *)a2 + v24);
  return a1;
}

uint64_t sub_2627DA3D8(uint64_t a1, void *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];

  uint64_t v8 = a3[10];
  uint64_t v9 = (unsigned char *)(a1 + v8);
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = (int *)type metadata accessor for IconEnvironmentTraits();
  uint64_t v12 = *((void *)v11 - 1);
  uint64_t v13 = *(uint64_t (**)(unsigned char *, uint64_t, int *))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      uint64_t v32 = sub_2627DBEB0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v32 - 8) + 40))(v9, v10, v32);
      uint64_t v33 = v11[5];
      uint64_t v34 = &v9[v33];
      unint64_t v35 = &v10[v33];
      uint64_t v36 = sub_2627DBFE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 40))(v34, v35, v36);
      uint64_t v37 = v11[6];
      uint64_t v38 = &v9[v37];
      unint64_t v39 = &v10[v37];
      uint64_t v40 = sub_2627DBEE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 40))(v38, v39, v40);
      uint64_t v41 = v11[7];
      uint64_t v42 = &v9[v41];
      uint64_t v43 = &v10[v41];
      *(void *)uint64_t v42 = *(void *)v43;
      v42[8] = v43[8];
      v9[v11[8]] = v10[v11[8]];
      *(void *)&v9[v11[9]] = *(void *)&v10[v11[9]];
      *(void *)&v9[v11[10]] = *(void *)&v10[v11[10]];
      uint64_t v44 = v11[11];
      char v45 = *(void **)&v9[v44];
      *(void *)&v9[v44] = *(void *)&v10[v44];

      goto LABEL_7;
    }
    sub_2627D8204((uint64_t)v9);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
    memcpy(v9, v10, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v16 = sub_2627DBEB0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v16 - 8) + 32))(v9, v10, v16);
  uint64_t v17 = v11[5];
  int v18 = &v9[v17];
  int v19 = &v10[v17];
  uint64_t v20 = sub_2627DBFE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  uint64_t v21 = v11[6];
  uint64_t v22 = &v9[v21];
  uint64_t v23 = &v10[v21];
  uint64_t v24 = sub_2627DBEE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
  uint64_t v25 = v11[7];
  uint64_t v26 = &v9[v25];
  char v27 = &v10[v25];
  *(void *)uint64_t v26 = *(void *)v27;
  v26[8] = v27[8];
  v9[v11[8]] = v10[v11[8]];
  *(void *)&v9[v11[9]] = *(void *)&v10[v11[9]];
  *(void *)&v9[v11[10]] = *(void *)&v10[v11[10]];
  *(void *)&v9[v11[11]] = *(void *)&v10[v11[11]];
  (*(void (**)(unsigned char *, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  *(void *)(a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_release();
  uint64_t v29 = a3[12];
  unint64_t v30 = *(void *)(a1 + v29);
  *(void *)(a1 + v29) = *(void *)((char *)a2 + v29);
  sub_2627D5D2C(v30);
  return a1;
}

uint64_t sub_2627DA78C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2627DA7A0);
}

uint64_t sub_2627DA7A0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 40);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_2627DA860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2627DA874);
}

void *sub_2627DA874(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 40);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_2627DA920(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2627DA984()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2627DA9C8()
{
  unint64_t result = qword_26B420410[0];
  if (!qword_26B420410[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B420410);
  }
  return result;
}

uint64_t sub_2627DAA1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B420548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_2627DAA84()
{
  return sub_2627D4768();
}

id sub_2627DAAA4()
{
  return sub_2627D4890(*(void *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_2627DAAC4()
{
  unint64_t v1 = (int *)type metadata accessor for AsyncIconImage();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 64) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_unknownObjectRelease();

  uint64_t v5 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420570);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2627DBEB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420580);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2627DBEE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  sub_2627D5CFC(*(void *)(v5 + v1[10]), *(unsigned char *)(v5 + v1[10] + 8));
  uint64_t v9 = v5 + v1[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B420590);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2627DBFE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  sub_2627D5D08(*(void *)(v5 + v1[12]), *(void *)(v5 + v1[12] + 8), *(unsigned __int8 *)(v5 + v1[12] + 16), *(unsigned char *)(v5 + v1[12] + 17));
  sub_2627D5CFC(*(void *)(v5 + v1[13]), *(unsigned char *)(v5 + v1[13] + 8));
  sub_2627D5D14(*(void *)(v5 + v1[14]), *(unsigned __int8 *)(v5 + v1[14] + 8), *(unsigned char *)(v5 + v1[14] + 9));
  sub_2627D5D14(*(void *)(v5 + v1[15]), *(unsigned __int8 *)(v5 + v1[15] + 8), *(unsigned char *)(v5 + v1[15] + 9));
  sub_2627D5CFC(*(void *)(v5 + v1[16]), *(unsigned char *)(v5 + v1[16] + 8));
  sub_2627D5D20(*(id *)(v5 + v1[17]), *(unsigned char *)(v5 + v1[17] + 8));

  swift_release();
  swift_release();
  uint64_t v11 = (id *)(v5 + v1[22]);

  uint64_t v12 = type metadata accessor for AsyncIconImage.LoadingState();
  uint64_t v13 = (char *)v11 + *(int *)(v12 + 40);
  int v14 = (int *)type metadata accessor for IconEnvironmentTraits();
  if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v14 - 1) + 48))(v13, 1, v14))
  {
    uint64_t v15 = sub_2627DBEB0();
    (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v13, v15);
    uint64_t v16 = v4;
    uint64_t v17 = &v13[v14[5]];
    uint64_t v18 = sub_2627DBFE0();
    (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
    int v19 = &v13[v14[6]];
    uint64_t v20 = sub_2627DBEE0();
    uint64_t v21 = v19;
    uint64_t v4 = v16;
    uint64_t v3 = (v2 + 64) & ~v2;
    (*(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v21, v20);
  }
  swift_release();
  sub_2627D5D2C(*(unint64_t *)((char *)v11 + *(int *)(v12 + 48)));
  sub_2627DC0F0();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2627DAF48(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = *(void *)(type metadata accessor for AsyncIconImage() - 8);
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[6];
  uint64_t v10 = v1[7];
  uint64_t v11 = (uint64_t)v1 + ((*(unsigned __int8 *)(v6 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_2627DB064;
  return sub_2627D3AC0(a1, v7, v8, v9, v10, v11, v4, v5);
}

uint64_t sub_2627DB064()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2627DB158(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IconEnvironmentTraits();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2627DB1BC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2627DB298;
  return v6(a1);
}

uint64_t sub_2627DB298()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_2627DB390(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_2627DB464(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2627DBC74((uint64_t)v12, *a3);
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
      sub_2627DBC74((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_2627DB464(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    unint64_t result = sub_2627DB564(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_2627DC2A0();
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

uint64_t sub_2627DB564(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2627DB5FC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_2627DB700(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_2627DB700((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2627DB5FC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2627DB698(v2, 0);
      uint64_t result = sub_2627DC290();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_2627DC1A0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2627DB698(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_26A962C40);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2627DB700(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_26A962C40);
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

uint64_t sub_2627DB7EC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2627DB824(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_2627DB064;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A962C30 + dword_26A962C30);
  return v6(a1, v4);
}

uint64_t sub_2627DB8DC(uint64_t a1)
{
  return sub_2627D4050(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t type metadata accessor for AsyncIconImage.LoadingError()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2627DB8FC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2627DB938()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4205D8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_2627DBA10()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B4205D8) - 8);
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  sub_2627D44C0(v2, v3, v4);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2627DBA90(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2627DBAD8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2627DBB1C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4205D8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2627DBBB0(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B4205D8);
  return sub_2627D4670(a1);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2627DBC74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2627DBCD4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2627DBD38(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2627DBD94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_2627DBD9C()
{
  return swift_getWitnessTable();
}

id sub_2627DBE38()
{
  return sub_2627DAAA4();
}

uint64_t sub_2627DBE58()
{
  return sub_2627DAA84();
}

uint64_t sub_2627DBE70()
{
  return MEMORY[0x270F81A58]();
}

uint64_t sub_2627DBE80()
{
  return MEMORY[0x270F81B20]();
}

uint64_t sub_2627DBE90()
{
  return MEMORY[0x270F81B38]();
}

uint64_t sub_2627DBEA0()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_2627DBEB0()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_2627DBED0()
{
  return MEMORY[0x270F00050]();
}

uint64_t sub_2627DBEE0()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_2627DBEF0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_2627DBF00()
{
  return MEMORY[0x270F00340]();
}

uint64_t sub_2627DBF10()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_2627DBF20()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_2627DBF30()
{
  return MEMORY[0x270F00948]();
}

uint64_t sub_2627DBF40()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_2627DBF50()
{
  return MEMORY[0x270F00BA8]();
}

uint64_t sub_2627DBF60()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_2627DBF70()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_2627DBF80()
{
  return MEMORY[0x270F00EF0]();
}

uint64_t sub_2627DBF90()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_2627DBFA0()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_2627DBFB0()
{
  return MEMORY[0x270F01110]();
}

uint64_t sub_2627DBFC0()
{
  return MEMORY[0x270F01118]();
}

uint64_t sub_2627DBFD0()
{
  return MEMORY[0x270F01478]();
}

uint64_t sub_2627DBFE0()
{
  return MEMORY[0x270F01490]();
}

uint64_t sub_2627DBFF0()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_2627DC000()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2627DC010()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_2627DC020()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2627DC030()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2627DC040()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2627DC050()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_2627DC060()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2627DC070()
{
  return MEMORY[0x270F03E90]();
}

uint64_t sub_2627DC080()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_2627DC090()
{
  return MEMORY[0x270F041A8]();
}

uint64_t sub_2627DC0A0()
{
  return MEMORY[0x270F04638]();
}

uint64_t sub_2627DC0B0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2627DC0C0()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2627DC0D0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2627DC0E0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_2627DC0F0()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_2627DC100()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2627DC110()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_2627DC120()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2627DC130()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2627DC140()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2627DC150()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2627DC160()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2627DC170()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2627DC180()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2627DC190()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2627DC1A0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2627DC1B0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2627DC1C0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2627DC1D0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2627DC1E0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2627DC1F0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2627DC200()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2627DC210()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2627DC220()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2627DC230()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2627DC240()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_2627DC250()
{
  return MEMORY[0x270F825E8]();
}

uint64_t sub_2627DC260()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2627DC270()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_2627DC280()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2627DC290()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2627DC2A0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2627DC2D0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2627DC2E0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2627DC2F0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2627DC300()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2627DC310()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2627DC320()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2627DC330()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2627DC340()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2627DC350()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2627DC360()
{
  return MEMORY[0x270FA0128]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}