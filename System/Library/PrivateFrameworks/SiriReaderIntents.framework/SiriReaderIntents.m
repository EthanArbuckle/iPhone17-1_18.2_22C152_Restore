uint64_t static MockSafariReaderData.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t vars8;

  if ((MEMORY[0x2611BA970]() & 1) == 0) {
    return 0;
  }
  v4 = type metadata accessor for MockSafariReaderData();
  if (*(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) != *(unsigned __int8 *)(a2 + *(int *)(v4 + 20))) {
    return 0;
  }
  v6 = v4;
  OUTLINED_FUNCTION_3(*(int *)(v4 + 24));
  v9 = v9 && v7 == v8;
  if (v9 || (v10 = sub_25DA7A720(), result = 0, (v10 & 1) != 0))
  {
    OUTLINED_FUNCTION_3(*(int *)(v6 + 28));
    if (v9 && v11 == v12)
    {
      return 1;
    }
    else
    {
      return sub_25DA7A720();
    }
  }
  return result;
}

uint64_t type metadata accessor for MockSafariReaderData()
{
  uint64_t result = qword_26A6A6328;
  if (!qword_26A6A6328) {
    return swift_getSingletonMetadata();
  }
  return result;
}

BOOL sub_25DA68560(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25DA68570()
{
  return sub_25DA7A750();
}

uint64_t sub_25DA68598(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C725565676170 && a2 == 0xE700000000000000;
  if (v3 || (sub_25DA7A720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000025DA7B550 || (sub_25DA7A720() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v6 = a1 == 0x6554726564616572 && a2 == 0xEA00000000007478;
    if (v6 || (sub_25DA7A720() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v8 = sub_25DA7A720();
      swift_bridgeObjectRelease();
      if (v8) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

uint64_t sub_25DA68734()
{
  return 4;
}

uint64_t sub_25DA6873C()
{
  return sub_25DA7A760();
}

uint64_t sub_25DA68784()
{
  return 0;
}

unint64_t sub_25DA68790(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x6554726564616572;
      break;
    case 3:
      unint64_t result = 0x656C61636F6CLL;
      break;
    default:
      unint64_t result = 0x6C725565676170;
      break;
  }
  return result;
}

BOOL sub_25DA68828(char *a1, char *a2)
{
  return sub_25DA68560(*a1, *a2);
}

uint64_t sub_25DA68834()
{
  return sub_25DA6873C();
}

uint64_t sub_25DA6883C()
{
  return sub_25DA68570();
}

uint64_t sub_25DA68844()
{
  return sub_25DA7A760();
}

unint64_t sub_25DA68888()
{
  return sub_25DA68790(*v0);
}

uint64_t sub_25DA68890@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25DA68598(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25DA688B8()
{
  return sub_25DA68784();
}

uint64_t sub_25DA688D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25DA68734();
  *a1 = result;
  return result;
}

uint64_t sub_25DA68900(uint64_t a1)
{
  unint64_t v2 = sub_25DA68BCC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DA6893C(uint64_t a1)
{
  unint64_t v2 = sub_25DA68BCC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MockSafariReaderData.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A62F8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25DA68BCC();
  sub_25DA7A780();
  sub_25DA79EC0();
  sub_25DA68F98(&qword_26A6A6308);
  sub_25DA7A700();
  if (!v1)
  {
    type metadata accessor for MockSafariReaderData();
    sub_25DA7A6F0();
    sub_25DA7A6E0();
    sub_25DA7A6E0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
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

unint64_t sub_25DA68BCC()
{
  unint64_t result = qword_26A6A6300;
  if (!qword_26A6A6300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A6300);
  }
  return result;
}

uint64_t MockSafariReaderData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v5 = sub_25DA79EC0();
  OUTLINED_FUNCTION_0();
  uint64_t v25 = v6;
  MEMORY[0x270FA5388]();
  v26 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6310);
  OUTLINED_FUNCTION_0();
  uint64_t v24 = v8;
  MEMORY[0x270FA5388]();
  v9 = (int *)type metadata accessor for MockSafariReaderData();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25DA68BCC();
  sub_25DA7A770();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  v22 = a1;
  uint64_t v10 = v25;
  char v31 = 0;
  sub_25DA68F98((unint64_t *)&unk_26A6A6318);
  v11 = v26;
  sub_25DA7A6D0();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v3, v11, v5);
  char v30 = 1;
  *(unsigned char *)(v3 + v9[5]) = sub_25DA7A6C0() & 1;
  char v29 = 2;
  uint64_t v12 = sub_25DA7A6B0();
  v13 = (uint64_t *)(v3 + v9[6]);
  uint64_t *v13 = v12;
  v13[1] = v14;
  char v28 = 3;
  uint64_t v15 = sub_25DA7A6B0();
  uint64_t v17 = v16;
  uint64_t v18 = OUTLINED_FUNCTION_1();
  v19(v18);
  v20 = (uint64_t *)(v3 + v9[7]);
  uint64_t *v20 = v15;
  v20[1] = v17;
  sub_25DA68FDC(v3, v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return sub_25DA69040(v3);
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

uint64_t sub_25DA68F98(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25DA79EC0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25DA68FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MockSafariReaderData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DA69040(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MockSafariReaderData();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DA6909C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MockSafariReaderData.init(from:)(a1, a2);
}

uint64_t sub_25DA690B4(void *a1)
{
  return MockSafariReaderData.encode(to:)(a1);
}

void *initializeBufferWithCopyOfBuffer for MockSafariReaderData(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25DA79EC0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    void *v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = a3[7];
    v13 = (void *)((char *)a1 + v12);
    uint64_t v14 = (void *)((char *)a2 + v12);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for MockSafariReaderData(uint64_t a1)
{
  uint64_t v2 = sub_25DA79EC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MockSafariReaderData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25DA79EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MockSafariReaderData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25DA79EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MockSafariReaderData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25DA79EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for MockSafariReaderData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25DA79EC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  void *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MockSafariReaderData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DA69528);
}

uint64_t sub_25DA69528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25DA79EC0();
  OUTLINED_FUNCTION_2();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for MockSafariReaderData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DA695F4);
}

void sub_25DA695F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_25DA79EC0();
  OUTLINED_FUNCTION_2();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25DA696A8()
{
  uint64_t result = sub_25DA79EC0();
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

uint64_t getEnumTagSinglePayload for MockSafariReaderData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for MockSafariReaderData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25DA698ACLL);
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

uint64_t sub_25DA698D4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25DA698E0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MockSafariReaderData.CodingKeys()
{
  return &type metadata for MockSafariReaderData.CodingKeys;
}

unint64_t sub_25DA698FC()
{
  unint64_t result = qword_26A6A6398;
  if (!qword_26A6A6398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A6398);
  }
  return result;
}

unint64_t sub_25DA6994C()
{
  unint64_t result = qword_26A6A63A0;
  if (!qword_26A6A63A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A63A0);
  }
  return result;
}

unint64_t sub_25DA6999C()
{
  unint64_t result = qword_26A6A63A8;
  if (!qword_26A6A63A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A63A8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

void sub_25DA69A64()
{
  algn_26A6A6778[5] = 0;
  *(_WORD *)&algn_26A6A6778[6] = -5120;
}

void sub_25DA69A90()
{
  unk_26A6A678D = 0;
  unk_26A6A678E = -5120;
}

uint64_t sub_25DA69ABC(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, uint64_t a5, long long *a6)
{
  sub_25DA700FC(a1, v6 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_entity, (uint64_t *)&unk_26A6A6978);
  uint64_t v12 = (void *)(v6 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_locale);
  *uint64_t v12 = a2;
  v12[1] = a3;
  sub_25DA70158(a4, v6 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_aceServiceInvoker);
  sub_25DA700FC(a5, v6 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_outputPublisher, &qword_26A6A6908);
  sub_25DA70158(a6, v6 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_deviceState);
  return v6;
}

void sub_25DA69B6C()
{
  OUTLINED_FUNCTION_8();
  sub_25DA7A130();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  uint64_t v0 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_14();
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_50(v0, (uint64_t)qword_26A6A7500);
  OUTLINED_FUNCTION_5();
  v1();
  OUTLINED_FUNCTION_5();
  v2();
  int v3 = sub_25DA7A3E0();
  os_log_type_t v4 = sub_25DA7A5B0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_13();
    uint64_t v13 = OUTLINED_FUNCTION_25();
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_25DA70064(&qword_26A6A6970, MEMORY[0x263F6FF40]);
    uint64_t v6 = sub_25DA7A710();
    sub_25DA76754(v6, v7, &v13);
    sub_25DA7A610();
    swift_bridgeObjectRelease();
    uint64_t v8 = OUTLINED_FUNCTION_45();
    v9(v8);
    _os_log_impl(&dword_25DA66000, v3, v4, "ReadThisFlow.on input: %s", v5, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_45();
    v11(v10);
  }

  OUTLINED_FUNCTION_44();
  v12();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_25DA69DE8()
{
  OUTLINED_FUNCTION_15();
  v1[27] = v2;
  v1[28] = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6960);
  v1[29] = v3;
  OUTLINED_FUNCTION_3_0(v3);
  v1[30] = v4;
  v1[31] = OUTLINED_FUNCTION_52();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6968);
  v1[32] = OUTLINED_FUNCTION_52();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A68E0);
  v1[33] = v5;
  OUTLINED_FUNCTION_3_0(v5);
  v1[34] = v6;
  v1[35] = OUTLINED_FUNCTION_52();
  uint64_t v7 = sub_25DA7A3F0();
  v1[36] = v7;
  OUTLINED_FUNCTION_3_0(v7);
  v1[37] = v8;
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  v1[41] = swift_task_alloc();
  OUTLINED_FUNCTION_16();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_25DA69F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_51();
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  uint64_t v13 = v12[41];
  uint64_t v14 = v12[36];
  uint64_t v15 = v12[37];
  uint64_t v16 = __swift_project_value_buffer(v14, (uint64_t)qword_26A6A7500);
  v12[42] = v16;
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  v12[43] = (uint64_t)v17;
  v12[44] = (v15 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v17(v13, v16, v14);
  uint64_t v18 = sub_25DA7A3E0();
  os_log_type_t v19 = sub_25DA7A5B0();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)OUTLINED_FUNCTION_11();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_25DA66000, v18, v19, "Entering ReadThisFlow execute", v20, 2u);
    OUTLINED_FUNCTION_2_0();
  }
  uint64_t v21 = v12[37];

  v22 = *(void (**)(void))(v21 + 8);
  v12[45] = (uint64_t)v22;
  v12[46] = (v21 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  OUTLINED_FUNCTION_32();
  v22();
  sub_25DA6C314();
  if ((v23 & 1) == 0)
  {
    uint64_t v26 = (uint64_t)(v12 + 2);
    v17(v12[39], v16, v12[36]);
    uint64_t v27 = sub_25DA7A3E0();
    os_log_type_t v28 = sub_25DA7A5B0();
    if (os_log_type_enabled(v27, v28))
    {
      char v29 = (uint8_t *)OUTLINED_FUNCTION_11();
      *(_WORD *)char v29 = 0;
      _os_log_impl(&dword_25DA66000, v27, v28, "Safari not frontmost app, not reading", v29, 2u);
      OUTLINED_FUNCTION_2_0();
    }

    OUTLINED_FUNCTION_32();
    v22();
    sub_25DA6B118(0, v12 + 2);
    __swift_project_boxed_opaque_existential_1(v12 + 2, v12[5]);
    goto LABEL_11;
  }
  uint64_t v25 = v12[32];
  uint64_t v24 = v12[33];
  sub_25DA6BDEC();
  if (__swift_getEnumTagSinglePayload(v25, 1, v24) == 1)
  {
    uint64_t v26 = (uint64_t)(v12 + 7);
    sub_25DA700AC(v12[32], &qword_26A6A6968);
    sub_25DA6B118(2, v12 + 7);
    __swift_project_boxed_opaque_existential_1(v12 + 7, v12[10]);
LABEL_11:
    sub_25DA7A090();
    __swift_destroy_boxed_opaque_existential_1(v26);
    OUTLINED_FUNCTION_24();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_17();
    return v31(v30, v31, v32, v33, v34, v35, v36, v37, a9, a10, a11, a12);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12[34] + 32))(v12[35], v12[32], v12[33]);
  sub_25DA7A570();
  v39 = (void *)swift_task_alloc();
  v12[47] = (uint64_t)v39;
  void *v39 = v12;
  v39[1] = sub_25DA6A2B4;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_17();
  return MEMORY[0x270FA20F8](v40, v41, v42, v43, v44, v45, v46, v47, a9, a10, a11, a12);
}

uint64_t sub_25DA6A2B4()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_25DA6A390()
{
  uint64_t v26 = v0;
  uint64_t v1 = *(void **)(v0 + 176);
  int v2 = *(unsigned __int8 *)(v0 + 184);
  if (v2 == 255)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 240) + 8))(*(void *)(v0 + 248), *(void *)(v0 + 232));
    sub_25DA6B118(2, (uint64_t *)(v0 + 96));
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
    sub_25DA7A090();
    OUTLINED_FUNCTION_32();
    v15();
    __swift_destroy_boxed_opaque_existential_1(v0 + 96);
LABEL_11:
    OUTLINED_FUNCTION_24();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_23();
    return v21();
  }
  if (v2 == 5)
  {
    (*(void (**)(void, void, void))(v0 + 344))(*(void *)(v0 + 320), *(void *)(v0 + 336), *(void *)(v0 + 288));
    sub_25DA70050(v1, 5);
    id v3 = v1;
    uint64_t v4 = sub_25DA7A3E0();
    os_log_type_t v5 = sub_25DA7A5B0();
    BOOL v6 = os_log_type_enabled(v4, v5);
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 360);
    uint64_t v8 = *(void *)(v0 + 320);
    uint64_t v9 = *(void *)(v0 + 288);
    if (v6)
    {
      uint64_t v24 = *(void *)(v0 + 288);
      uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_13();
      uint64_t v25 = OUTLINED_FUNCTION_25();
      *(_DWORD *)uint64_t v10 = 136315138;
      id v11 = objc_msgSend(v3, sel_description);
      char v23 = v7;
      uint64_t v12 = sub_25DA7A4A0();
      unint64_t v14 = v13;

      sub_25DA7003C(v1, 5);
      *(void *)(v0 + 208) = sub_25DA76754(v12, v14, &v25);
      sub_25DA7A610();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_22();
      _os_log_impl(&dword_25DA66000, v4, v5, "connection: %s", v10, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();

      v23(v8, v24);
    }
    else
    {
      OUTLINED_FUNCTION_22();

      v7(v8, v9);
    }
    uint64_t v18 = *(void *)(v0 + 272);
    uint64_t v17 = *(void *)(v0 + 280);
    uint64_t v19 = *(void *)(v0 + 264);
    sub_25DA6AA4C();
    sub_25DA6ADB4();
    sub_25DA7A0A0();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_30();
    v20();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    goto LABEL_11;
  }
  sub_25DA7003C(*(id *)(v0 + 176), v2);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_25DA6A2B4;
  OUTLINED_FUNCTION_16();
  return MEMORY[0x270FA20F8]();
}

uint64_t sub_25DA6A73C()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[43];
  uint64_t v2 = v0[42];
  uint64_t v3 = v0[38];
  uint64_t v4 = v0[36];
  (*(void (**)(uint64_t, uint64_t))(v0[30] + 8))(v0[31], v0[29]);
  os_log_type_t v5 = (void *)v0[24];
  v1(v3, v2, v4);
  id v6 = v5;
  id v7 = v5;
  uint64_t v8 = sub_25DA7A3E0();
  os_log_type_t v9 = sub_25DA7A5B0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_13();
    id v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v5;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[25] = v13;
    sub_25DA7A610();
    void *v11 = v13;

    _os_log_impl(&dword_25DA66000, v8, v9, "Error: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A10);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
  }
  unint64_t v14 = (void (*)(uint64_t, uint64_t))v0[45];
  uint64_t v15 = v0[38];
  uint64_t v16 = v0[36];

  v14(v15, v16);
  id v17 = v5;
  sub_25DA6ADB4();

  sub_25DA6B118(0, v0 + 17);
  __swift_project_boxed_opaque_existential_1(v0 + 17, v0[20]);
  sub_25DA7A090();

  OUTLINED_FUNCTION_30();
  v18();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 17));
  OUTLINED_FUNCTION_24();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_23();
  return v19();
}

uint64_t sub_25DA6A9BC()
{
  return sub_25DA79F50();
}

void sub_25DA6AA4C()
{
  OUTLINED_FUNCTION_8();
  uint64_t v21 = v0;
  uint64_t v1 = sub_25DA7A3F0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_14();
  sub_25DA79EF0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4_0();
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F67958]), sel_init);
  sub_25DA79EE0();
  uint64_t v3 = sub_25DA79ED0();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_44();
  v6();
  sub_25DA6FEB8(v3, v5, v2, (SEL *)&selRef_setCardSectionId_);
  sub_25DA6FF24(0xD000000000000016, 0x800000025DA7B710, v2);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64818]), sel_init);
  sub_25DA70000(0, &qword_26A6A6940);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6948);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_25DA7AF80;
  *(void *)(v8 + 32) = v2;
  sub_25DA7A4F0();
  os_log_type_t v9 = v2;
  uint64_t v10 = (void *)sub_25DA7A5A0();
  swift_bridgeObjectRelease();

  id v11 = objc_allocWithZone(MEMORY[0x263F64ED8]);
  id v12 = v10;
  id v13 = objc_msgSend(v11, sel_init);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_25DA7AF80;
  *(void *)(v14 + 32) = v12;
  uint64_t v22 = v14;
  sub_25DA7A4F0();
  sub_25DA6FF7C(v22, v13);
  __swift_project_boxed_opaque_existential_1((void *)(v21 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_aceServiceInvoker), *(void *)(v21 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_aceServiceInvoker + 24));
  sub_25DA7A100();
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_50(v1, (uint64_t)qword_26A6A7500);
  OUTLINED_FUNCTION_5();
  v15();
  uint64_t v16 = sub_25DA7A3E0();
  os_log_type_t v17 = sub_25DA7A5B0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_11();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_25DA66000, v16, v17, "Presented UI and returning from ReadThisFlow", v18, 2u);
    OUTLINED_FUNCTION_2_0();
    uint64_t v19 = v9;
  }
  else
  {
    uint64_t v19 = v16;
    uint64_t v16 = v12;
    id v12 = v9;
  }

  OUTLINED_FUNCTION_44();
  v20();
  OUTLINED_FUNCTION_7();
}

void sub_25DA6ADB4()
{
  OUTLINED_FUNCTION_8();
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6930);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_36();
  sub_25DA7A060();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4_0();
  if (v2)
  {
    sub_25DA79FB0();
    __swift_project_boxed_opaque_existential_1(v20, v21);
    sub_25DA7A000();
    uint64_t v3 = OUTLINED_FUNCTION_43();
    v4(v3);
    if (qword_26A6A62C8 != -1) {
      swift_once();
    }
    uint64_t v5 = *MEMORY[0x263F6F6C8];
    uint64_t v6 = sub_25DA79FD0();
    OUTLINED_FUNCTION_9();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 104))(v0, v5, v6);
    uint64_t v8 = OUTLINED_FUNCTION_40();
    __swift_storeEnumTagSinglePayload(v8, v9, v10, v6);
    *(void *)(swift_allocObject() + 16) = v2;
    swift_bridgeObjectRetain();
    id v11 = v2;
    sub_25DA79FF0();
  }
  else
  {
    sub_25DA79FB0();
    __swift_project_boxed_opaque_existential_1(v20, v21);
    sub_25DA7A000();
    uint64_t v12 = OUTLINED_FUNCTION_43();
    v13(v12);
    if (qword_26A6A62C8 != -1) {
      swift_once();
    }
    uint64_t v14 = *MEMORY[0x263F6F748];
    uint64_t v15 = sub_25DA79FD0();
    OUTLINED_FUNCTION_9();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 104))(v0, v14, v15);
    uint64_t v17 = OUTLINED_FUNCTION_40();
    __swift_storeEnumTagSinglePayload(v17, v18, v19, v15);
    swift_bridgeObjectRetain();
    sub_25DA79FF0();
  }
  sub_25DA79FC0();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  OUTLINED_FUNCTION_7();
}

uint64_t sub_25DA6B0C8(int a1, id a2)
{
  id v2 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6938);
  sub_25DA7A4B0();
  return sub_25DA79FE0();
}

uint64_t sub_25DA6B118@<X0>(char a1@<W0>, uint64_t *a2@<X8>)
{
  sub_25DA6FCAC(v2 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_outputPublisher, (uint64_t)&v10, &qword_26A6A6908);
  if (v11)
  {
    sub_25DA70158(&v10, (uint64_t)v12);
  }
  else
  {
    sub_25DA700AC((uint64_t)&v10, &qword_26A6A6908);
    sub_25DA7A120();
  }
  sub_25DA6FD08((uint64_t)v12, (uint64_t)&v10);
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = v2;
  uint64_t v6 = sub_25DA79F30();
  OUTLINED_FUNCTION_46();
  swift_retain();
  uint64_t v7 = sub_25DA79F20();
  uint64_t v8 = MEMORY[0x263F6F228];
  a2[3] = v6;
  a2[4] = v8;
  *a2 = v7;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_25DA6B224(uint64_t a1, char a2, uint64_t a3)
{
  *(unsigned char *)(v3 + 272) = a2;
  *(void *)(v3 + 136) = a1;
  *(void *)(v3 + 144) = a3;
  uint64_t v4 = sub_25DA7A3F0();
  *(void *)(v3 + 152) = v4;
  *(void *)(v3 + 160) = *(void *)(v4 - 8);
  *(void *)(v3 + 168) = swift_task_alloc();
  *(void *)(v3 + 176) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6A6920);
  *(void *)(v3 + 184) = swift_task_alloc();
  sub_25DA7A390();
  *(void *)(v3 + 192) = swift_task_alloc();
  uint64_t v5 = sub_25DA7A0C0();
  *(void *)(v3 + 200) = v5;
  *(void *)(v3 + 208) = *(void *)(v5 - 8);
  *(void *)(v3 + 216) = swift_task_alloc();
  *(void *)(v3 + 224) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DA6B3C0, 0, 0);
}

uint64_t sub_25DA6B3C0()
{
  OUTLINED_FUNCTION_51();
  uint64_t v23 = v0;
  if (sub_25DA7405C(*(unsigned char *)(v0 + 272)) == 0xD000000000000015 && v1 == 0x800000025DA7B730)
  {
    uint64_t v2 = swift_bridgeObjectRelease();
LABEL_5:
    if (qword_26A6A62E0 != -1) {
      uint64_t v2 = swift_once();
    }
    uint64_t v4 = OUTLINED_FUNCTION_10(v2, (uint64_t)qword_26A6A7500);
    v5(v4);
    uint64_t v6 = (void *)sub_25DA7A3E0();
    os_log_type_t v7 = sub_25DA7A5D0();
    if (OUTLINED_FUNCTION_33(v7))
    {
      uint64_t v8 = (_WORD *)OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_35(v8);
      OUTLINED_FUNCTION_19(&dword_25DA66000, v9, v10, "Defaulting to generic error template response");
      OUTLINED_FUNCTION_2_0();
    }

    uint64_t v11 = OUTLINED_FUNCTION_12();
    v12(v11);
    id v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 256) = v13;
    void *v13 = v0;
    v13[1] = sub_25DA6B82C;
    uint64_t v14 = *(void *)(v0 + 216);
    return MEMORY[0x270F67538](v14);
  }
  char v3 = sub_25DA7A720();
  uint64_t v2 = swift_bridgeObjectRelease();
  if (v3) {
    goto LABEL_5;
  }
  uint64_t v15 = *(void *)(v0 + 192);
  uint64_t v22 = 0;
  memset(v21, 0, sizeof(v21));
  sub_25DA7A380();
  type metadata accessor for ReadThisCATProvider();
  OUTLINED_FUNCTION_46();
  *(void *)(v0 + 232) = sub_25DA73BE8(v15, (uint64_t)v21);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 240) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_25DA6B624;
  uint64_t v17 = *(void *)(v0 + 224);
  char v18 = *(unsigned char *)(v0 + 272);
  uint64_t v19 = MEMORY[0x263F8EE78];
  return sub_25DA73DC4(v17, v18, v19);
}

uint64_t sub_25DA6B624()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v5 = v4;
  *(void *)(v3 + 248) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_16();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_25DA6B70C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_51();
  uint64_t v13 = *(void *)(v12 + 184);
  uint64_t v14 = *(uint64_t **)(v12 + 136);
  OUTLINED_FUNCTION_29(*(void *)(v12 + 144));
  uint64_t v15 = sub_25DA7A0B0();
  uint64_t v16 = OUTLINED_FUNCTION_49(v15);
  *(_OWORD *)(v12 + 72) = 0u;
  *(void *)(v12 + 88) = 0;
  *(_OWORD *)(v12 + 56) = 0u;
  uint64_t v17 = MEMORY[0x263F6FFF0];
  v14[3] = v16;
  v14[4] = v17;
  __swift_allocate_boxed_opaque_existential_1(v14);
  OUTLINED_FUNCTION_21();
  sub_25DA700AC(v12 + 56, (uint64_t *)&unk_26A6A69B0);
  sub_25DA700AC(v13, (uint64_t *)&unk_26A6A6920);
  OUTLINED_FUNCTION_30();
  v18();
  OUTLINED_FUNCTION_38();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_17();
  return v20(v19, v20, v21, v22, v23, v24, v25, v26, v12 + 56, a10, a11, a12);
}

uint64_t sub_25DA6B82C()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v3 = v2;
  *(void *)(v4 + 264) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_25DA6B90C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_51();
  uint64_t v13 = *(void *)(v12 + 184);
  uint64_t v14 = *(uint64_t **)(v12 + 136);
  OUTLINED_FUNCTION_29(*(void *)(v12 + 144));
  uint64_t v15 = sub_25DA7A0B0();
  uint64_t v16 = OUTLINED_FUNCTION_49(v15);
  *(_OWORD *)(v12 + 32) = 0u;
  *(void *)(v12 + 48) = 0;
  *(_OWORD *)(v12 + 16) = 0u;
  uint64_t v17 = MEMORY[0x263F6FFF0];
  v14[3] = v16;
  v14[4] = v17;
  __swift_allocate_boxed_opaque_existential_1(v14);
  OUTLINED_FUNCTION_21();
  sub_25DA700AC(v12 + 16, (uint64_t *)&unk_26A6A69B0);
  sub_25DA700AC(v13, (uint64_t *)&unk_26A6A6920);
  OUTLINED_FUNCTION_30();
  v18();
  OUTLINED_FUNCTION_38();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_17();
  return v20(v19, v20, v21, v22, v23, v24, v25, v26, v12 + 16, a10, a11, a12);
}

uint64_t sub_25DA6BA2C()
{
  uint64_t v33 = v0;
  swift_release();
  unint64_t v1 = 0x26A6A6000uLL;
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)v0[31];
  uint64_t v4 = v0[20];
  uint64_t v3 = v0[21];
  OUTLINED_FUNCTION_50(v0[19], (uint64_t)qword_26A6A7500);
  (*(void (**)(uint64_t))(v4 + 16))(v3);
  id v5 = v2;
  id v6 = v2;
  uint64_t v7 = sub_25DA7A3E0();
  os_log_type_t v8 = sub_25DA7A5D0();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = (void *)v0[31];
  uint64_t v12 = v0[20];
  uint64_t v11 = v0[21];
  uint64_t v13 = v0[19];
  if (v9)
  {
    uint64_t v31 = v0[21];
    uint64_t v30 = v0[19];
    uint64_t v14 = (uint8_t *)OUTLINED_FUNCTION_13();
    uint64_t v32 = OUTLINED_FUNCTION_25();
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_getErrorValue();
    uint64_t v15 = sub_25DA7A730();
    v0[16] = sub_25DA76754(v15, v16, &v32);
    unint64_t v1 = 0x26A6A6000;
    sub_25DA7A610();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25DA66000, v7, v8, "Could not get CAT template: %s", v14, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();

    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v31, v30);
  }
  else
  {

    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  if (*(void *)(v1 + 736) != -1) {
    uint64_t v17 = swift_once();
  }
  uint64_t v18 = OUTLINED_FUNCTION_10(v17, (uint64_t)qword_26A6A7500);
  v19(v18);
  v20 = (void *)sub_25DA7A3E0();
  os_log_type_t v21 = sub_25DA7A5D0();
  if (OUTLINED_FUNCTION_33(v21))
  {
    uint64_t v22 = (_WORD *)OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_35(v22);
    OUTLINED_FUNCTION_19(&dword_25DA66000, v23, v24, "Defaulting to generic error template response");
    OUTLINED_FUNCTION_2_0();
  }

  uint64_t v25 = OUTLINED_FUNCTION_12();
  v26(v25);
  uint64_t v27 = (void *)swift_task_alloc();
  v0[32] = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_25DA6B82C;
  uint64_t v28 = v0[27];
  return MEMORY[0x270F67538](v28);
}

uint64_t sub_25DA6BD58()
{
  OUTLINED_FUNCTION_38();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_23();
  return v0();
}

void sub_25DA6BDEC()
{
  OUTLINED_FUNCTION_8();
  uint64_t v2 = v1;
  uint64_t v3 = sub_25DA79F10();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_25DA79EF0();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DA70000(0, &qword_26A6A68D8);
  id v13 = sub_25DA6C140();
  if (v13)
  {
    uint64_t v14 = v13;
    v34[0] = v0;
    v34[1] = v5;
    v34[2] = v3;
    v34[3] = v2;
    if (qword_26A6A62C0 != -1) {
      swift_once();
    }
    uint64_t v15 = qword_26A6A6770;
    uint64_t v16 = *(void *)algn_26A6A6778;
    id v17 = objc_allocWithZone(MEMORY[0x263F51AF8]);
    swift_bridgeObjectRetain();
    id v18 = sub_25DA6F2C4(v15, v16, 0, 0, 0, 0, 0);
    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F51EB8]), sel_init);
    sub_25DA6FEB8(1769105747, 0xE400000000000000, v19, (SEL *)&selRef_setClientLabel_);
    objc_msgSend(v19, sel_setSource_, 3);
    sub_25DA79EE0();
    uint64_t v20 = sub_25DA79ED0();
    uint64_t v22 = v21;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v7);
    sub_25DA6FEB8(v20, v22, v19, (SEL *)&selRef_setClientLabel_);
    sub_25DA70000(0, &qword_26A6A68E8);
    __swift_project_boxed_opaque_existential_1((void *)(v34[0] + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_deviceState), *(void *)(v34[0] + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_deviceState + 24));
    sub_25DA7A030();
    sub_25DA79F00();
    OUTLINED_FUNCTION_20();
    v23();
    id v24 = sub_25DA6C1B4();
    objc_msgSend(v19, sel_setEnvironment_, v24);

    sub_25DA6C228((uint64_t)v18, (uint64_t)v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A68E0);
    uint64_t v25 = OUTLINED_FUNCTION_40();
    __swift_storeEnumTagSinglePayload(v25, v26, v27, v28);
    OUTLINED_FUNCTION_7();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A68E0);
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_7();
    __swift_storeEnumTagSinglePayload(v29, v30, v31, v32);
  }
}

id sub_25DA6C140()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_25DA7A490();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_, v1);

  return v2;
}

id sub_25DA6C1B4()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_25DA7A490();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithLocaleIdentifier_, v1);

  return v2;
}

uint64_t sub_25DA6C228(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A68F0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = v2;
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  (*(void (**)(unsigned char *, void))(v7 + 104))(&v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], *MEMORY[0x263F8F680]);
  return sub_25DA7A590();
}

void sub_25DA6C314()
{
  OUTLINED_FUNCTION_8();
  sub_25DA7A460();
  OUTLINED_FUNCTION_0();
  uint64_t v99 = v3;
  uint64_t v100 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_53();
  uint64_t v98 = v4;
  uint64_t v5 = sub_25DA7A420();
  OUTLINED_FUNCTION_0();
  uint64_t v104 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_53();
  uint64_t v102 = v8;
  uint64_t v9 = sub_25DA7A480();
  OUTLINED_FUNCTION_0();
  uint64_t v105 = v10;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  v103 = (char *)v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v106 = (char *)v96 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A68C8);
  MEMORY[0x270FA5388](v15 - 8);
  OUTLINED_FUNCTION_36();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A68D0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_26();
  MEMORY[0x270FA5388](v17);
  uint64_t v107 = (uint64_t)v96 - v18;
  uint64_t v19 = sub_25DA7A3F0();
  OUTLINED_FUNCTION_0();
  uint64_t v108 = v20;
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  id v24 = (char *)v96 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)v96 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = MEMORY[0x270FA5388](v28);
  v101 = (char *)v96 - v30;
  MEMORY[0x270FA5388](v29);
  if (sub_25DA6CE98())
  {
    if (qword_26A6A62E0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v19, (uint64_t)qword_26A6A7500);
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_5();
    v31();
    uint64_t v32 = sub_25DA7A3E0();
    os_log_type_t v33 = sub_25DA7A5C0();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)OUTLINED_FUNCTION_11();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_25DA66000, v32, v33, "checkForSafariOnScreen device is locked or on lock screen, skipping check and returning false", v34, 2u);
      OUTLINED_FUNCTION_2_0();
    }

    OUTLINED_FUNCTION_18();
    v35();
  }
  else
  {
    uint64_t v97 = v9;
    sub_25DA7A270();
    OUTLINED_FUNCTION_46();
    uint64_t v36 = sub_25DA7A260();
    uint64_t v37 = MEMORY[0x2611BAD10]();
    if (v37)
    {
      v96[0] = v5;
      v96[3] = v36;
      uint64_t v38 = v37;
      sub_25DA7A3C0();
      uint64_t v39 = sub_25DA7A3B0();
      sub_25DA7A440();
      OUTLINED_FUNCTION_46();
      swift_retain();
      v96[2] = v38;
      OUTLINED_FUNCTION_16();
      sub_25DA7A430();
      sub_25DA7A470();
      uint64_t v40 = OUTLINED_FUNCTION_48();
      __swift_storeEnumTagSinglePayload(v40, v41, v42, v43);
      uint64_t v44 = v107;
      v96[1] = v39;
      sub_25DA7A3A0();
      swift_release();
      sub_25DA700AC(v0, &qword_26A6A68C8);
      sub_25DA6FCAC(v44, (uint64_t)v1, &qword_26A6A68D0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v45 = *v1;
        if (qword_26A6A62E0 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v19, (uint64_t)qword_26A6A7500);
        OUTLINED_FUNCTION_47();
        OUTLINED_FUNCTION_5();
        v46();
        id v47 = v45;
        id v48 = v45;
        v49 = sub_25DA7A3E0();
        os_log_type_t v50 = sub_25DA7A5D0();
        if (os_log_type_enabled(v49, v50))
        {
          v51 = (uint8_t *)OUTLINED_FUNCTION_13();
          uint64_t v52 = OUTLINED_FUNCTION_25();
          v109 = v45;
          uint64_t v110 = v52;
          *(_DWORD *)v51 = 136315138;
          id v53 = v45;
          __swift_instantiateConcreteTypeFromMangledName(qword_26A6A6850);
          uint64_t v54 = sub_25DA7A4B0();
          v106 = (char *)v19;
          uint64_t v56 = sub_25DA76754(v54, v55, &v110);
          OUTLINED_FUNCTION_31(v56);
          sub_25DA7A610();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_25DA66000, v49, v50, "checkForSafariOnScreen | Received a failure: %s -> nil", v51, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_2_0();
          OUTLINED_FUNCTION_2_0();
          swift_release();

          swift_release();
          swift_release();
          OUTLINED_FUNCTION_30();
          v57();
        }
        else
        {
          swift_release();

          swift_release();
          swift_release();
          (*(void (**)(char *, uint64_t))(v44 + 8))(v27, v19);
        }
        sub_25DA700AC(v107, &qword_26A6A68D0);
      }
      else
      {
        uint64_t v65 = v105;
        uint64_t v66 = v97;
        (*(void (**)(char *, void **, uint64_t))(v105 + 32))(v106, v1, v97);
        v67 = v103;
        OUTLINED_FUNCTION_5();
        v68();
        if ((*(unsigned int (**)(char *, uint64_t))(v65 + 88))(v67, v66) == *MEMORY[0x263F742B8])
        {
          (*(void (**)(char *, uint64_t))(v65 + 96))(v67, v66);
          (*(void (**)(uint64_t, char *, void))(v104 + 32))(v102, v67, v96[0]);
          if (qword_26A6A62D0 != -1) {
            swift_once();
          }
          uint64_t v69 = qword_26A6A74F0;
          sub_25DA7A410();
          uint64_t v70 = sub_25DA7A450();
          uint64_t v72 = v71;
          OUTLINED_FUNCTION_20();
          v73();
          sub_25DA74260(v70, v72, v69);
          char v75 = v74;
          swift_bridgeObjectRelease();
          if (qword_26A6A62E0 != -1) {
            swift_once();
          }
          __swift_project_value_buffer(v19, (uint64_t)qword_26A6A7500);
          OUTLINED_FUNCTION_47();
          OUTLINED_FUNCTION_5();
          v76();
          v77 = sub_25DA7A3E0();
          os_log_type_t v78 = sub_25DA7A5C0();
          if (os_log_type_enabled(v77, v78))
          {
            v79 = (uint8_t *)OUTLINED_FUNCTION_13();
            uint64_t v80 = OUTLINED_FUNCTION_25();
            *(_DWORD *)v79 = 136315138;
            uint64_t v110 = v80;
            if (v75) {
              uint64_t v81 = 0x686374616DLL;
            }
            else {
              uint64_t v81 = 0x686374616D206F6ELL;
            }
            if (v75) {
              unint64_t v82 = 0xE500000000000000;
            }
            else {
              unint64_t v82 = 0xE800000000000000;
            }
            uint64_t v83 = sub_25DA76754(v81, v82, &v110);
            OUTLINED_FUNCTION_31(v83);
            sub_25DA7A610();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_25DA66000, v77, v78, "checkForSafariOnScreen %s found for SiriReaderFlowProvider bundles", v79, 0xCu);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_2_0();
            OUTLINED_FUNCTION_2_0();
            swift_release();
            swift_release();

            swift_release();
            OUTLINED_FUNCTION_44();
            v84();
          }
          else
          {
            swift_release();
            swift_release();

            swift_release();
            OUTLINED_FUNCTION_44();
            v93();
          }
          OUTLINED_FUNCTION_20();
          v94();
          OUTLINED_FUNCTION_20();
          v95();
          sub_25DA700AC(v107, &qword_26A6A68D0);
        }
        else
        {
          if (qword_26A6A62E0 != -1) {
            swift_once();
          }
          __swift_project_value_buffer(v19, (uint64_t)qword_26A6A7500);
          OUTLINED_FUNCTION_5();
          v85();
          v86 = sub_25DA7A3E0();
          os_log_type_t v87 = sub_25DA7A5C0();
          if (os_log_type_enabled(v86, v87))
          {
            v88 = (_WORD *)OUTLINED_FUNCTION_11();
            OUTLINED_FUNCTION_35(v88);
            OUTLINED_FUNCTION_54(&dword_25DA66000, v89, v90, "checkForSafariOnScreen no candidate found");
            uint64_t v65 = v105;
            OUTLINED_FUNCTION_2_0();
          }
          swift_release();
          swift_release();

          swift_release();
          OUTLINED_FUNCTION_18();
          v91();
          v92 = *(void (**)(char *, uint64_t))(v65 + 8);
          v92(v106, v66);
          sub_25DA700AC(v107, &qword_26A6A68D0);
          v92(v67, v66);
        }
      }
    }
    else
    {
      if (qword_26A6A62E0 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_50(v19, (uint64_t)qword_26A6A7500);
      uint64_t v58 = v108;
      OUTLINED_FUNCTION_5();
      v59();
      v60 = sub_25DA7A3E0();
      os_log_type_t v61 = sub_25DA7A5C0();
      if (os_log_type_enabled(v60, v61))
      {
        v62 = (_WORD *)OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_35(v62);
        OUTLINED_FUNCTION_54(&dword_25DA66000, v63, v64, "checkForSafariOnScreen UsoEntityBuilder_common_App | unable to convert entity builder to entity");
        OUTLINED_FUNCTION_2_0();
        swift_release();
      }
      else
      {

        swift_release();
      }
      (*(void (**)(char *, uint64_t))(v58 + 8))(v24, v19);
    }
  }
  OUTLINED_FUNCTION_7();
}

uint64_t sub_25DA6CE98()
{
  uint64_t v1 = sub_25DA7A0F0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_14();
  sub_25DA7A150();
  __swift_project_boxed_opaque_existential_1(v7, v8);
  sub_25DA7A0E0();
  char v5 = sub_25DA7A040();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  sub_25DA7A150();
  __swift_project_boxed_opaque_existential_1(v7, v8);
  LOBYTE(v1) = sub_25DA7A020();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v1 & 1 | ((v5 & 1) == 0);
}

uint64_t sub_25DA6CFA0()
{
  sub_25DA700AC(v0 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_entity, (uint64_t *)&unk_26A6A6978);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_aceServiceInvoker);
  sub_25DA700AC(v0 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_outputPublisher, &qword_26A6A6908);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_deviceState);
  return v0;
}

uint64_t sub_25DA6D01C()
{
  sub_25DA6CFA0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25DA6D074()
{
  return type metadata accessor for ReadThisFlow(0);
}

uint64_t type metadata accessor for ReadThisFlow(uint64_t a1)
{
  return sub_25DA6EF94(a1, (uint64_t *)&unk_26A6A6798);
}

void sub_25DA6D09C()
{
  sub_25DA6D14C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_25DA6D14C()
{
  if (!qword_26A6A67B0)
  {
    sub_25DA7A460();
    unint64_t v0 = sub_25DA7A600();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6A67B0);
    }
  }
}

uint64_t sub_25DA6D1A4()
{
  return 1;
}

uint64_t sub_25DA6D1C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25DA6D270;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t sub_25DA6D270()
{
  OUTLINED_FUNCTION_15();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  char v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_25DA6D33C()
{
  return sub_25DA6A9BC();
}

uint64_t sub_25DA6D360()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25DA6D3FC;
  return sub_25DA69DE8();
}

uint64_t sub_25DA6D3FC()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_23();
  return v3();
}

uint64_t sub_25DA6D4BC(uint64_t a1, uint64_t a2)
{
  uint64_t ThisFlow = type metadata accessor for ReadThisFlow(0);

  return MEMORY[0x270F66CE8](ThisFlow, a2);
}

uint64_t sub_25DA6D4FC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6A6870);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v10, a1, v8);
  sub_25DA7A010();
  id v12 = objc_allocWithZone((Class)type metadata accessor for ReadThisAppIntentConnectionDelegate(0));
  id v13 = sub_25DA6D9F8((uint64_t)v10, (uint64_t)v18);
  id v14 = objc_msgSend(a2, sel_executorForAction_options_delegate_, a3, a4, v13);
  objc_msgSend(v14, sel_perform);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  *(void *)(v15 + 24) = v14;
  return sub_25DA7A530();
}

uint64_t sub_25DA6D674(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = sub_25DA7A3F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v34 - v9;
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v4, (uint64_t)qword_26A6A7500);
  id v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, v11, v4);
  id v13 = a3;
  uint64_t v40 = v10;
  id v14 = sub_25DA7A3E0();
  os_log_type_t v15 = sub_25DA7A5C0();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    int v36 = v16;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v37 = swift_slowAlloc();
    uint64_t v42 = v37;
    uint64_t v39 = v5;
    *(_DWORD *)uint64_t v18 = 136315138;
    v34[1] = v18 + 4;
    uint64_t v35 = v18;
    id v19 = v13;
    uint64_t v20 = v4;
    uint64_t v21 = v12;
    uint64_t v22 = v11;
    id v23 = objc_msgSend(v19, sel_description);
    uint64_t v24 = sub_25DA7A4A0();
    uint64_t v38 = v8;
    unint64_t v26 = v25;

    uint64_t v11 = v22;
    id v12 = v21;
    uint64_t v4 = v20;
    uint64_t v41 = sub_25DA76754(v24, v26, &v42);
    uint64_t v5 = v39;
    sub_25DA7A610();

    uint64_t v8 = v38;
    swift_bridgeObjectRelease();
    uint64_t v27 = v35;
    _os_log_impl(&dword_25DA66000, v14, (os_log_type_t)v36, "Stopping executor %s", v35, 0xCu);
    uint64_t v28 = v37;
    swift_arrayDestroy();
    MEMORY[0x2611BB6F0](v28, -1, -1);
    MEMORY[0x2611BB6F0](v27, -1, -1);
  }
  else
  {
  }
  uint64_t v29 = *(void (**)(char *, uint64_t))(v5 + 8);
  v29(v40, v4);
  v12(v8, v11, v4);
  uint64_t v30 = sub_25DA7A3E0();
  os_log_type_t v31 = sub_25DA7A5C0();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v32 = 0;
    _os_log_impl(&dword_25DA66000, v30, v31, "AsyncStream terminated", v32, 2u);
    MEMORY[0x2611BB6F0](v32, -1, -1);
  }

  return ((uint64_t (*)(char *, uint64_t))v29)(v8, v4);
}

id sub_25DA6D9F8(uint64_t a1, uint64_t a2)
{
  sub_25DA6FD08(a2, (uint64_t)v2 + OBJC_IVAR____TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate_aceService);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6A6870);
  uint64_t v6 = *(void *)(v5 - 8);
  OUTLINED_FUNCTION_5();
  v7();
  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for ReadThisAppIntentConnectionDelegate(0);
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a2);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v8;
}

void sub_25DA6DAF0()
{
}

void sub_25DA6DB74()
{
}

void sub_25DA6DBF8()
{
}

void sub_25DA6DC7C()
{
}

void sub_25DA6DC8C()
{
  OUTLINED_FUNCTION_8();
  uint64_t v20 = v1;
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6868);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_4_0();
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_50(v8, (uint64_t)qword_26A6A7500);
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_5();
  v10();
  id v11 = v3;
  id v12 = sub_25DA7A3E0();
  os_log_type_t v13 = sub_25DA7A5C0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v19 = v0;
    id v14 = (uint8_t *)OUTLINED_FUNCTION_13();
    uint64_t v18 = (void *)swift_slowAlloc();
    *(_DWORD *)id v14 = 138412290;
    id v15 = v11;
    sub_25DA7A610();
    *uint64_t v18 = v11;

    _os_log_impl(&dword_25DA66000, v12, v13, v20, v14, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A10);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    uint64_t v0 = v19;
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
  }
  OUTLINED_FUNCTION_20();
  v16();
  id v17 = v11;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6A6870);
  sub_25DA7A540();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0, v4);
  OUTLINED_FUNCTION_7();
}

void sub_25DA6DFA0()
{
  OUTLINED_FUNCTION_8();
  uint64_t v57 = v0;
  uint64_t v4 = v3;
  unint64_t v55 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6A6870);
  OUTLINED_FUNCTION_0();
  uint64_t v56 = v7;
  MEMORY[0x270FA5388](v8);
  objc_super v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6868);
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  uint64_t v15 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_26();
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v47 - v20;
  if (v4)
  {
    uint64_t v22 = v4;
    if (qword_26A6A62E0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v15, (uint64_t)qword_26A6A7500);
    uint64_t v23 = v17;
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_5();
    v24();
    unint64_t v25 = v4;
    unint64_t v26 = v4;
    uint64_t v27 = sub_25DA7A3E0();
    os_log_type_t v28 = sub_25DA7A5C0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v53 = v15;
      uint64_t v29 = (uint8_t *)OUTLINED_FUNCTION_13();
      uint64_t v30 = OUTLINED_FUNCTION_25();
      uint64_t v54 = v6;
      uint64_t v58 = (uint64_t)v4;
      v59 = v30;
      *(_DWORD *)uint64_t v29 = 136315138;
      os_log_type_t v31 = v4;
      __swift_instantiateConcreteTypeFromMangledName(qword_26A6A6850);
      uint64_t v32 = sub_25DA7A4B0();
      uint64_t v58 = sub_25DA76754(v32, v33, (uint64_t *)&v59);
      sub_25DA7A610();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25DA66000, v27, v28, "ReadThisAppIntentConnectionDelegate finished with error: %s", v29, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();

      (*(void (**)(char *, uint64_t))(v23 + 8))(v21, v53);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v23 + 8))(v21, v15);
    }
    v59 = v4;
    uint64_t v42 = v4;
    sub_25DA7A550();

    goto LABEL_16;
  }
  uint64_t v34 = v55;
  uint64_t v49 = v1;
  os_log_type_t v50 = v10;
  uint64_t v51 = v13;
  uint64_t v52 = v11;
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v15, (uint64_t)qword_26A6A7500);
  OUTLINED_FUNCTION_5();
  v35();
  int v36 = v34;
  uint64_t v37 = sub_25DA7A3E0();
  os_log_type_t v38 = sub_25DA7A5C0();
  BOOL v39 = os_log_type_enabled(v37, v38);
  id v48 = v36;
  if (v39)
  {
    uint64_t v53 = v15;
    uint64_t v54 = v6;
    uint64_t v40 = (uint8_t *)OUTLINED_FUNCTION_13();
    id v47 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v40 = 138412290;
    if (!v34) {
      goto LABEL_18;
    }
    v59 = v36;
    uint64_t v41 = v36;
    sub_25DA7A610();
    uint64_t v34 = v55;
    *id v47 = v55;

    _os_log_impl(&dword_25DA66000, v37, v38, "ReadThisAppIntentConnectionDelegate finished with result: %@", v40, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A10);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
    uint64_t v15 = v53;
  }
  else
  {

    uint64_t v37 = v36;
  }

  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v2, v15);
  OUTLINED_FUNCTION_5();
  v43();
  if (v34)
  {
    v59 = v34;
    char v60 = 5;
    uint64_t v44 = v48;
    sub_25DA7A540();
    OUTLINED_FUNCTION_20();
    v45();
    OUTLINED_FUNCTION_18();
    v46();
    v59 = 0;
    sub_25DA7A550();
LABEL_16:
    OUTLINED_FUNCTION_7();
    return;
  }
  __break(1u);
LABEL_18:
  __break(1u);
}

uint64_t sub_25DA6E588()
{
  OUTLINED_FUNCTION_15();
  uint64_t v1 = sub_25DA7A3F0();
  v0[2] = v1;
  OUTLINED_FUNCTION_3_0(v1);
  v0[3] = v2;
  v0[4] = OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_16();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_25DA6E610()
{
  OUTLINED_FUNCTION_37();
  if (qword_26A6A62E0 != -1) {
    uint64_t v1 = swift_once();
  }
  uint64_t v2 = OUTLINED_FUNCTION_10(v1, (uint64_t)qword_26A6A7500);
  v3(v2);
  uint64_t v4 = (void *)sub_25DA7A3E0();
  os_log_type_t v5 = sub_25DA7A5C0();
  if (OUTLINED_FUNCTION_33(v5))
  {
    uint64_t v6 = (_WORD *)OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_35(v6);
    OUTLINED_FUNCTION_19(&dword_25DA66000, v7, v8, "ReadThisAppIntentConnectionDelegate executorEnvironmentForViewSnippet");
    OUTLINED_FUNCTION_2_0();
  }

  uint64_t v9 = OUTLINED_FUNCTION_12();
  v10(v9);
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11(0);
}

uint64_t sub_25DA6E794(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_25DA6E84C;
  return sub_25DA6E588();
}

uint64_t sub_25DA6E84C()
{
  OUTLINED_FUNCTION_37();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = (void (**)(void, void))v3[4];
  os_log_type_t v5 = (void *)v3[3];
  id v6 = (void *)v3[2];
  uint64_t v7 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v8 = v7;
  swift_task_dealloc();

  ((void (**)(void, void *))v4)[2](v4, v2);
  _Block_release(v4);

  OUTLINED_FUNCTION_23();
  return v9();
}

uint64_t sub_25DA6E97C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6890);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25DA7A520();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_26A6A68A0;
  v9[5] = v8;
  sub_25DA6F5A4((uint64_t)v6, (uint64_t)&unk_26A6A68B0, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_25DA6EA80()
{
  uint64_t v1 = sub_25DA7A3F0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4_0();
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_50(v1, (uint64_t)qword_26A6A7500);
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_5();
  v5();
  id v6 = sub_25DA7A3E0();
  os_log_type_t v7 = sub_25DA7A5C0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_11();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25DA66000, v6, v7, "ReadThisAppIntentConnectionDelegate shouldRunShowOutputAction return false", v8, 2u);
    OUTLINED_FUNCTION_2_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return 0;
}

void sub_25DA6EC14()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6868);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4_0();
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_50(v3, (uint64_t)qword_26A6A7500);
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_5();
  v5();
  id v6 = sub_25DA7A3E0();
  os_log_type_t v7 = sub_25DA7A5C0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_11();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25DA66000, v6, v7, "ReadThisAppIntentConnectionDelegate needsContinueInAppWith request", v8, 2u);
    OUTLINED_FUNCTION_2_0();
  }

  OUTLINED_FUNCTION_18();
  v9();
  id v10 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6A6870);
  sub_25DA7A540();
  OUTLINED_FUNCTION_30();
  v11();
  OUTLINED_FUNCTION_7();
}

void sub_25DA6EE78()
{
}

id sub_25DA6EEB8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReadThisAppIntentConnectionDelegate(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25DA6EF6C()
{
  return type metadata accessor for ReadThisAppIntentConnectionDelegate(0);
}

uint64_t type metadata accessor for ReadThisAppIntentConnectionDelegate(uint64_t a1)
{
  return sub_25DA6EF94(a1, (uint64_t *)&unk_26A6A6830);
}

uint64_t sub_25DA6EF94(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25DA6EFC8()
{
  sub_25DA6F064();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_25DA6F064()
{
  if (!qword_26A6A6848)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26A6A6850);
    unint64_t v0 = sub_25DA7A560();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6A6848);
    }
  }
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

uint64_t initializeBufferWithCopyOfBuffer for LinkConnectionEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v5 = v3;
  return a1;
}

void destroy for LinkConnectionEvent(id *a1)
{
}

uint64_t assignWithCopy for LinkConnectionEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for LinkConnectionEvent(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for LinkConnectionEvent(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFB && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 250;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 5) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LinkConnectionEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25DA6F26C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_25DA6F274(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LinkConnectionEvent()
{
  return &type metadata for LinkConnectionEvent;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_25DA6F2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  uint64_t v8 = v7;
  uint64_t v13 = (void *)sub_25DA7A490();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v14 = (void *)sub_25DA7A490();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = 0;
  }
  sub_25DA70000(0, &qword_26A6A68F8);
  uint64_t v15 = (void *)sub_25DA7A4E0();
  swift_bridgeObjectRelease();
  sub_25DA70000(0, &qword_26A6A6900);
  uint64_t v16 = (void *)sub_25DA7A4E0();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v8, sel_initWithIdentifier_mangledTypeName_openAppWhenRun_outputFlags_outputType_systemProtocols_parameters_, v13, v14, a5 & 1, a6, a7, v15, v16);

  return v17;
}

uint64_t sub_25DA6F40C(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  char v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *char v4 = v3;
  v4[1] = sub_25DA70174;
  return v6();
}

uint64_t sub_25DA6F4D8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_25DA70174;
  return v7();
}

uint64_t sub_25DA6F5A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DA7A520();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_25DA700AC(a1, &qword_26A6A6890);
  }
  else
  {
    sub_25DA7A510();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25DA7A500();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25DA6F714(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25DA6F7F0;
  return v6(a1);
}

uint64_t sub_25DA6F7F0()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_42();
  return v3();
}

uint64_t sub_25DA6F8B0()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25DA6F8F8()
{
  OUTLINED_FUNCTION_37();
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = (void *)v0[3];
  uint64_t v3 = (void *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_39(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25DA70174;
  uint64_t v7 = (uint64_t (*)(void *, void *, void *))((char *)&dword_26A6A6880 + dword_26A6A6880);
  return v7(v1, v2, v3);
}

uint64_t sub_25DA6F9A8()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_39(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25DA70174;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_26A6A6898 + dword_26A6A6898);
  return v7(v1, v2, v3);
}

uint64_t objectdestroy_14Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25DA6FAA8(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_39(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_25DA70174;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26A6A68A8 + dword_26A6A68A8);
  return v9(a1, v3, v4, v5);
}

uint64_t sub_25DA6FB70()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25DA6FBA8()
{
  OUTLINED_FUNCTION_37();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_39(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25DA70174;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A6A68B8 + dword_26A6A68B8);
  return v7(v2, v3);
}

uint64_t sub_25DA6FC58(uint64_t a1)
{
  return sub_25DA6D4FC(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_25DA6FC64()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25DA6FCA4(uint64_t a1)
{
  return sub_25DA6D674(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_25DA6FCAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25DA6FD08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25DA6FD6C()
{
  OUTLINED_FUNCTION_37();
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 16);
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = (void *)OUTLINED_FUNCTION_39(v5);
  *uint64_t v6 = v7;
  v6[1] = sub_25DA6D3FC;
  return sub_25DA6B224(v2, v4, v3);
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

uint64_t sub_25DA6FE78()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25DA6FEB0(int a1)
{
  return sub_25DA6B0C8(a1, *(id *)(v1 + 16));
}

void sub_25DA6FEB8(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6 = (id)sub_25DA7A490();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

void sub_25DA6FF24(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_25DA7A490();
  objc_msgSend(a3, sel_setPlaybackBundleIdentifier_, v4);
}

void sub_25DA6FF7C(uint64_t a1, void *a2)
{
  sub_25DA70000(0, &qword_26A6A6950);
  id v3 = (id)sub_25DA7A4E0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setViews_, v3);
}

uint64_t sub_25DA70000(uint64_t a1, unint64_t *a2)
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

void sub_25DA7003C(id a1, char a2)
{
  if (a2 != -1) {
}
  }

id sub_25DA70050(id result, char a2)
{
  if (a2 != -1) {
    return result;
  }
  return result;
}

uint64_t sub_25DA70064(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25DA700AC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_20();
  v3();
  return a1;
}

uint64_t sub_25DA700FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_25DA70158(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void OUTLINED_FUNCTION_2_0()
{
  JUMPOUT(0x2611BB6F0);
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(v2, a2);
  return v3;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_19(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_25DA7A080();
}

void OUTLINED_FUNCTION_22()
{
  sub_25DA7003C(v0, 5);
  sub_25DA7003C(v0, 5);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_25DA7A3F0();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_25DA7A3F0();
}

uint64_t OUTLINED_FUNCTION_29@<X0>(uint64_t a1@<X8>)
{
  __swift_project_boxed_opaque_existential_1((void *)(a1 + v1), *(void *)(a1 + v1 + 24));
  return sub_25DA7A050();
}

uint64_t OUTLINED_FUNCTION_31(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

BOOL OUTLINED_FUNCTION_33(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_34()
{
  return v0;
}

_WORD *OUTLINED_FUNCTION_35(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_38()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_39(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_43()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return sub_25DA7A180();
}

uint64_t OUTLINED_FUNCTION_50(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(a1, a2);
}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_54(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_25DA70694(uint64_t a1)
{
  uint64_t v3 = sub_25DA7A130();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25DA7A3F0();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_14();
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v9, (uint64_t)qword_26A6A7500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v1, v13, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v3);
  uint64_t v14 = sub_25DA7A3E0();
  os_log_type_t v15 = sub_25DA7A5B0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_13();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v30 = v28;
    uint64_t v27 = v16;
    *(_DWORD *)uint64_t v16 = 136315138;
    v26[1] = v16 + 4;
    sub_25DA7395C(&qword_26A6A6970, 255, MEMORY[0x263F6FF40]);
    uint64_t v17 = sub_25DA7A710();
    uint64_t v29 = sub_25DA76754(v17, v18, &v30);
    sub_25DA7A610();
    swift_bridgeObjectRelease();
    uint64_t v19 = OUTLINED_FUNCTION_45();
    v20(v19);
    _os_log_impl(&dword_25DA66000, v14, v15, "ReadThisFlow.on input: %s", v27, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_45();
    v22(v21);
  }

  uint64_t v23 = OUTLINED_FUNCTION_30_0();
  v24(v23);
  return 1;
}

uint64_t sub_25DA70950()
{
  type metadata accessor for ScreenReaderFlow();
  sub_25DA7395C(&qword_26A6A6A18, v0, (void (*)(uint64_t))type metadata accessor for ScreenReaderFlow);
  OUTLINED_FUNCTION_30_0();
  return sub_25DA79F50();
}

uint64_t sub_25DA709D8()
{
  OUTLINED_FUNCTION_15();
  v1[22] = v2;
  v1[23] = v0;
  uint64_t v3 = sub_25DA7A0D0();
  v1[24] = v3;
  OUTLINED_FUNCTION_3_0(v3);
  v1[25] = v4;
  v1[26] = OUTLINED_FUNCTION_52();
  uint64_t v5 = sub_25DA7A3F0();
  v1[27] = v5;
  OUTLINED_FUNCTION_3_0(v5);
  v1[28] = v6;
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  v1[33] = swift_task_alloc();
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  v1[41] = swift_task_alloc();
  OUTLINED_FUNCTION_16();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25DA70B30()
{
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[28];
  v0[42] = __swift_project_value_buffer(v0[27], (uint64_t)qword_26A6A7500);
  v0[43] = *(void *)(v1 + 16);
  v0[44] = (v1 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v2 = OUTLINED_FUNCTION_27_0();
  v3(v2);
  uint64_t v4 = (void *)sub_25DA7A3E0();
  os_log_type_t v5 = sub_25DA7A5B0();
  if (OUTLINED_FUNCTION_33(v5))
  {
    *(_WORD *)OUTLINED_FUNCTION_11() = 0;
    OUTLINED_FUNCTION_19(&dword_25DA66000, v6, v7, "Entering ScreenReaderFlow");
    OUTLINED_FUNCTION_2_0();
  }
  uint64_t v8 = v0[41];
  uint64_t v9 = v0[27];
  uint64_t v10 = v0[28];

  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v0[45] = v11;
  v0[46] = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v11(v8, v9);
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64738]), sel_init);
  v0[47] = v12;
  sub_25DA7A010();
  uint64_t v13 = v0[5];
  uint64_t v14 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v13);
  os_log_type_t v15 = (void *)swift_task_alloc();
  v0[48] = v15;
  uint64_t v16 = sub_25DA70000(0, (unint64_t *)&unk_26A6A6A00);
  *os_log_type_t v15 = v0;
  v15[1] = sub_25DA70D14;
  return MEMORY[0x270F67CE0](v12, v13, v16, v14);
}

uint64_t sub_25DA70D14()
{
  OUTLINED_FUNCTION_15();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0();
  *os_log_type_t v5 = v4;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v7 = v6;
  *(void *)(v8 + 392) = v0;
  swift_task_dealloc();
  if (!v0) {

  }
  OUTLINED_FUNCTION_16();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_25DA70DF8()
{
  uint64_t v1 = *(void **)(v0 + 376);
  sub_25DA7A0A0();

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
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
  OUTLINED_FUNCTION_23();
  return v2();
}

uint64_t sub_25DA70F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  OUTLINED_FUNCTION_20_0();
  uint64_t v17 = v16;
  uint64_t v18 = (void *)v16[49];
  v16[20] = v18;
  uint64_t v19 = v16 + 20;
  uint64_t v20 = v16 + 18;
  uint64_t v21 = v16 + 19;
  id v22 = v18;
  __swift_instantiateConcreteTypeFromMangledName(qword_26A6A6850);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_28;
  }
  int v23 = (*(uint64_t (**)(void, void))(v16[25] + 88))(v16[26], v16[24]);
  if (v23 == *MEMORY[0x263F6FC38])
  {
    uint64_t v24 = (void (*)(uint64_t, uint64_t, uint64_t))v16[43];
    uint64_t v25 = v16[42];
    uint64_t v26 = v16[32];
    uint64_t v27 = (void **)v17[26];
    uint64_t v28 = v17[27];
    uint64_t v29 = v17[24];
    uint64_t v30 = v17[25];

    (*(void (**)(void **, uint64_t))(v30 + 96))(v27, v29);
    os_log_type_t v31 = *v27;
    v24(v26, v25, v28);
    id v32 = v31;
    id v33 = v31;
    uint64_t v34 = sub_25DA7A3E0();
    os_log_type_t v35 = sub_25DA7A5B0();
    if (os_log_type_enabled(v34, v35))
    {
      int v36 = (uint8_t *)OUTLINED_FUNCTION_13();
      uint64_t v37 = (void *)swift_slowAlloc();
      *(_DWORD *)int v36 = 138412290;
      id v38 = v31;
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      v17[21] = v39;
      sub_25DA7A610();
      *uint64_t v37 = v39;

      _os_log_impl(&dword_25DA66000, v34, v35, "SAAXStartSpeaking internalError: %@", v36, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A10);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();
    }
    else
    {
    }
    ((void (*)(void, void))v17[45])(v17[32], v17[27]);
    goto LABEL_45;
  }
  if (v23 != *MEMORY[0x263F6FC48])
  {
    if (v23 == *MEMORY[0x263F6FC50])
    {
      uint64_t v53 = (void *)v16[49];
      uint64_t v54 = (void (*)(uint64_t, uint64_t, uint64_t))v16[43];
      uint64_t v55 = v16[42];
      uint64_t v56 = v16[31];
      uint64_t v58 = (void **)v17[26];
      uint64_t v57 = v17[27];
      v59 = v17;
      uint64_t v60 = v17[25];
      v153 = v59;
      uint64_t v61 = v59[24];

      (*(void (**)(void **, uint64_t))(v60 + 96))(v58, v61);
      v62 = *v58;
      v54(v56, v55, v57);
      uint64_t v63 = v62;
      uint64_t v64 = sub_25DA7A3E0();
      os_log_type_t v65 = sub_25DA7A5B0();
      if (os_log_type_enabled(v64, v65))
      {
        uint64_t v66 = (NSObject **)(v19 - 3);
        v67 = (uint8_t *)OUTLINED_FUNCTION_13();
        v68 = (void *)swift_slowAlloc();
        *(_DWORD *)v67 = 138412290;
        *uint64_t v66 = v63;
        uint64_t v69 = v63;
        sub_25DA7A610();
        void *v68 = v63;

        _os_log_impl(&dword_25DA66000, v64, v65, "SAAXStartSpeaking unexpectedResponse: %@", v67, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A10);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_2_0();
        OUTLINED_FUNCTION_2_0();
      }
      else
      {

        uint64_t v64 = v63;
      }
      uint64_t v17 = v153;
      v93 = (void (*)(uint64_t, uint64_t))v153[45];
      uint64_t v94 = v153[31];
      uint64_t v95 = v153[27];

      v93(v94, v95);
      goto LABEL_45;
    }
    if (v23 == *MEMORY[0x263F6FC40])
    {
      uint64_t v83 = (void (*)(uint8_t *, uint64_t, uint64_t))v16[43];
      uint64_t v84 = v16[42];
      v85 = (uint8_t *)v16[30];
      uint64_t v86 = v17[27];

      v83(v85, v84, v86);
      os_log_type_t v87 = sub_25DA7A3E0();
      os_log_type_t v88 = sub_25DA7A5B0();
      if (OUTLINED_FUNCTION_33(v88))
      {
        uint64_t v89 = (_WORD *)OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_13_0(v89);
        _os_log_impl(&dword_25DA66000, v87, (os_log_type_t)v86, "SAAXStartSpeaking nilResponse", v85, 2u);
        OUTLINED_FUNCTION_2_0();
      }
      uint64_t v90 = (void (*)(uint64_t, uint64_t))v17[45];
      uint64_t v91 = v17[30];
      uint64_t v92 = v17[27];

      v90(v91, v92);
      goto LABEL_45;
    }
    (*(void (**)(void, void))(v16[25] + 8))(v16[26], v16[24]);
LABEL_28:
    v96 = (void *)v16[49];
    uint64_t v97 = (void (*)(uint64_t, uint64_t, uint64_t))v16[43];
    uint64_t v98 = v16[42];
    uint64_t v99 = v17[29];
    uint64_t v100 = v17[27];

    v97(v99, v98, v100);
    id v101 = v96;
    id v102 = v96;
    v103 = sub_25DA7A3E0();
    os_log_type_t v104 = sub_25DA7A5B0();
    BOOL v105 = os_log_type_enabled(v103, v104);
    v106 = (void *)v17[49];
    if (v105)
    {
      uint64_t v107 = (uint8_t *)OUTLINED_FUNCTION_13();
      uint64_t v108 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v107 = 138412290;
      id v109 = v106;
      uint64_t v110 = v17;
      uint64_t v111 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t *v20 = v111;
      sub_25DA7A610();
      *uint64_t v108 = v111;
      uint64_t v17 = v110;

      _os_log_impl(&dword_25DA66000, v103, v104, "SAAXStartSpeaking unknown error %@", v107, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A10);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();
    }
    else
    {
    }
    ((void (*)(void, void))v17[45])(v17[29], v17[27]);
    goto LABEL_46;
  }
  uint64_t v40 = v16[25];
  uint64_t v41 = (id *)v16[26];
  uint64_t v42 = (uint8_t *)v16[24];

  (*(void (**)(id *, uint8_t *))(v40 + 96))(v41, v42);
  uint64_t v43 = *v41;
  uint64_t v44 = v17;
  id v45 = objc_msgSend(*v41, sel_errorCode);
  if ((id)*MEMORY[0x263F650A8] != v45)
  {
    if ((id)*MEMORY[0x263F650B0] == v45)
    {
      v154 = v43;
      uint64_t v70 = v19 - 8;
      OUTLINED_FUNCTION_16_0();
      uint64_t v71 = OUTLINED_FUNCTION_22_0();
      v72(v71);
      v73 = sub_25DA7A3E0();
      os_log_type_t v74 = sub_25DA7A5B0();
      if (os_log_type_enabled(v73, v74))
      {
        char v75 = (_WORD *)OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_13_0(v75);
        OUTLINED_FUNCTION_24_0(&dword_25DA66000, v76, v77, "Handling SAAXScreenReaderNothingToSpeakErrorCode");
        OUTLINED_FUNCTION_2_0();
      }
      os_log_type_t v78 = (void *)v17[47];
      v79 = (void (*)(uint64_t, uint64_t))v17[45];
      uint64_t v80 = v44[39];
      uint64_t v81 = v44[27];

      v79(v80, v81);
      uint64_t v17 = v44;
      sub_25DA72628(v70);
      uint64_t v82 = v44[15];
      goto LABEL_18;
    }
    if ((id)*MEMORY[0x263F650C0] == v45)
    {
      OUTLINED_FUNCTION_16_0();
      uint64_t v46 = v17 + 38;
    }
    else
    {
      if ((id)*MEMORY[0x263F650C8] != v45)
      {
        if ((id)*MEMORY[0x263F65098] == v45)
        {
          OUTLINED_FUNCTION_16_0();
          uint64_t v46 = v17 + 36;
          uint64_t v117 = OUTLINED_FUNCTION_22_0();
          v118(v117);
          uint64_t v49 = sub_25DA7A3E0();
          os_log_type_t v119 = sub_25DA7A5B0();
          if (OUTLINED_FUNCTION_11_0(v119))
          {
            v120 = (_WORD *)OUTLINED_FUNCTION_11();
            OUTLINED_FUNCTION_13_0(v120);
            uint64_t v52 = "SAAXScreenReaderCannotSkipAheadErrorCode handler not handled";
            goto LABEL_36;
          }
        }
        else
        {
          uint64_t v42 = (uint8_t *)v17;
          uint64_t v121 = v17[27];
          if ((id)*MEMORY[0x263F650A0] != v45)
          {
            v137 = (void (*)(void, uint64_t, uint64_t))v17[43];
            uint64_t v138 = v17[42];
            if ((id)*MEMORY[0x263F650B8] != v45)
            {
              v156 = v21;
              uint64_t v46 = v17 + 33;
              v137(v17[33], v138, v121);
              v116 = v43;
              uint64_t v49 = sub_25DA7A3E0();
              os_log_type_t v147 = sub_25DA7A5B0();
              if (os_log_type_enabled(v49, v147))
              {
                v148 = (uint8_t *)OUTLINED_FUNCTION_13();
                *(_DWORD *)v148 = 134217984;
                void *v156 = [v116 errorCode];
                sub_25DA7A610();

                _os_log_impl(&dword_25DA66000, v49, v147, "Accessibility Assistant Bundle completion with unknown error code %ld", v148, 0xCu);
                OUTLINED_FUNCTION_2_0();
              }
              else
              {

                uint64_t v49 = v116;
              }
              goto LABEL_44;
            }
            v154 = v43;
            uint64_t v70 = v19 - 13;
            v137(v17[34], v138, v121);
            v139 = sub_25DA7A3E0();
            os_log_type_t v140 = sub_25DA7A5B0();
            if (os_log_type_enabled(v139, v140))
            {
              v141 = (_WORD *)OUTLINED_FUNCTION_11();
              OUTLINED_FUNCTION_13_0(v141);
              OUTLINED_FUNCTION_24_0(&dword_25DA66000, v142, v143, "Handling SAAXScreenReaderSettingNotEnabledErrorCode");
              OUTLINED_FUNCTION_2_0();
            }
            os_log_type_t v78 = (void *)v17[47];
            v144 = (void (*)(uint64_t, uint64_t))v17[45];
            uint64_t v145 = v44[34];
            uint64_t v146 = v44[27];

            v144(v145, v146);
            uint64_t v17 = v44;
            sub_25DA71A88(v70);
            uint64_t v82 = v44[10];
LABEL_18:
            __swift_project_boxed_opaque_existential_1(v70, v82);
            sub_25DA7A090();

            __swift_destroy_boxed_opaque_existential_1((uint64_t)v70);
            goto LABEL_47;
          }
          uint64_t v46 = v17 + 35;
          ((void (*)(void, void, uint64_t))v17[43])(v17[35], v17[42], v121);
          uint64_t v49 = sub_25DA7A3E0();
          os_log_type_t v122 = sub_25DA7A5B0();
          if (OUTLINED_FUNCTION_11_0(v122))
          {
            v123 = (_WORD *)OUTLINED_FUNCTION_11();
            OUTLINED_FUNCTION_13_0(v123);
            uint64_t v52 = "SAAXScreenReaderCannotSkipBackErrorCode handler not handled";
            goto LABEL_36;
          }
        }
LABEL_43:
        v116 = v49;
        uint64_t v49 = v43;
        goto LABEL_44;
      }
      OUTLINED_FUNCTION_16_0();
      uint64_t v46 = v17 + 37;
    }
    uint64_t v112 = OUTLINED_FUNCTION_22_0();
    v113(v112);
    uint64_t v49 = sub_25DA7A3E0();
    os_log_type_t v114 = sub_25DA7A5B0();
    if (OUTLINED_FUNCTION_11_0(v114))
    {
      v115 = (_WORD *)OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_13_0(v115);
      uint64_t v52 = "SAAXScreenReaderSpeedAtMaxRateErrorCode handler not handled";
      goto LABEL_36;
    }
    goto LABEL_43;
  }
  OUTLINED_FUNCTION_16_0();
  uint64_t v46 = v17 + 40;
  uint64_t v47 = OUTLINED_FUNCTION_22_0();
  v48(v47);
  uint64_t v49 = sub_25DA7A3E0();
  os_log_type_t v50 = sub_25DA7A5B0();
  if (!OUTLINED_FUNCTION_11_0(v50)) {
    goto LABEL_43;
  }
  uint64_t v51 = (_WORD *)OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13_0(v51);
  uint64_t v52 = "SAAXScreenReaderNothingBeingSpokenErrorCode handler not handled";
LABEL_36:
  _os_log_impl(&dword_25DA66000, v49, (os_log_type_t)v19, v52, v42, 2u);
  OUTLINED_FUNCTION_2_0();
  v116 = v43;
LABEL_44:
  uint64_t v124 = *v46;
  v125 = (void (*)(uint64_t, uint64_t))v17[45];
  uint64_t v126 = v17[27];

  v125(v124, v126);
LABEL_45:

LABEL_46:
  v127 = (void *)v17[47];
  sub_25DA7A0A0();

LABEL_47:
  uint64_t v149 = v17[32];
  uint64_t v150 = v17[31];
  uint64_t v151 = v17[30];
  uint64_t v152 = v17[29];
  uint64_t v155 = v17[26];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v17 + 2));
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
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_21_0();
  return v129(v128, v129, v130, v131, v132, v133, v134, v135, v149, v150, v151, v152, v155, a14, a15, a16);
}

uint64_t sub_25DA71A88@<X0>(uint64_t *a1@<X8>)
{
  return sub_25DA72640(a1);
}

uint64_t sub_25DA71AA0(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = a2;
  uint64_t v3 = sub_25DA7A3F0();
  v2[14] = v3;
  v2[15] = *(void *)(v3 - 8);
  v2[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6A6920);
  v2[17] = swift_task_alloc();
  sub_25DA7A390();
  v2[18] = swift_task_alloc();
  uint64_t v4 = sub_25DA7A0C0();
  v2[19] = v4;
  v2[20] = *(void *)(v4 - 8);
  v2[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DA71C18, 0, 0);
}

uint64_t sub_25DA71C18()
{
  OUTLINED_FUNCTION_19_0();
  type metadata accessor for ReadThisCATProvider();
  uint64_t v1 = swift_allocObject();
  v0[22] = OUTLINED_FUNCTION_25_0(v1, v2, v3, v4, v5, v6, v7, v8, v13);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[23] = v9;
  void *v9 = v0;
  v9[1] = sub_25DA71CDC;
  uint64_t v10 = v0[21];
  uint64_t v11 = MEMORY[0x263F8EE78];
  return sub_25DA73DC4(v10, 3, v11);
}

uint64_t sub_25DA71CDC()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v6 = v5;
  *(void *)(v3 + 192) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_16();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25DA71DC0()
{
  uint64_t v15 = *(void *)(v0 + 168);
  uint64_t v16 = *(void *)(v0 + 160);
  uint64_t v17 = *(void *)(v0 + 152);
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v3 = *(uint64_t **)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  sub_25DA70000(0, (unint64_t *)&unk_26A6A69E0);
  id v4 = sub_25DA72464();
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64F08]), sel_init);
  sub_25DA6FEB8(0x746553206E65704FLL, 0xED000073676E6974, v5, (SEL *)&selRef_setText_);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6948);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_25DA7AF80;
  *(void *)(v6 + 32) = v4;
  uint64_t v18 = v6;
  sub_25DA7A4F0();
  id v7 = v4;
  sub_25DA738E4(v18, v5);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 56), *(void *)(v2 + 80));
  OUTLINED_FUNCTION_30_0();
  sub_25DA7A050();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_25DA7AF80;
  *(void *)(v8 + 32) = v5;
  sub_25DA7A4F0();
  uint64_t v9 = sub_25DA7A0B0();
  uint64_t v10 = OUTLINED_FUNCTION_49(v9);
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  uint64_t v11 = MEMORY[0x263F6FFF0];
  v3[3] = v10;
  v3[4] = v11;
  __swift_allocate_boxed_opaque_existential_1(v3);
  id v12 = v5;
  sub_25DA7A080();
  swift_bridgeObjectRelease();

  sub_25DA735EC(v0 + 16, (uint64_t *)&unk_26A6A69B0);
  sub_25DA735EC(v1, (uint64_t *)&unk_26A6A6920);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_42();
  return v13();
}

uint64_t sub_25DA7205C()
{
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *id v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v6 = v5;
  *(void *)(v3 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_16();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_42();
    return v10();
  }
}

uint64_t sub_25DA72188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_20_0();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  swift_release();
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  uint64_t v27 = (void *)v24[24];
  __swift_project_value_buffer(v24[14], (uint64_t)qword_26A6A7500);
  uint64_t v28 = OUTLINED_FUNCTION_15_0();
  v29(v28);
  id v30 = v27;
  id v31 = v27;
  id v32 = sub_25DA7A3E0();
  os_log_type_t v33 = sub_25DA7A5D0();
  BOOL v34 = os_log_type_enabled(v32, v33);
  os_log_type_t v35 = (void *)v24[24];
  uint64_t v37 = v24[15];
  uint64_t v36 = v24[16];
  uint64_t v38 = v24[14];
  if (v34)
  {
    uint64_t v50 = v24[16];
    OUTLINED_FUNCTION_13();
    a13 = OUTLINED_FUNCTION_31_0();
    OUTLINED_FUNCTION_10_0(4.8149e-34);
    uint64_t v39 = sub_25DA7A730();
    uint64_t v41 = sub_25DA76754(v39, v40, &a13);
    OUTLINED_FUNCTION_28_0(v41);
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_23_0(&dword_25DA66000, v42, v43, "Could not get CAT template: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v50, a11);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
  }
  uint64_t v44 = (uint64_t *)v24[12];
  uint64_t v45 = sub_25DA7A180();
  uint64_t v46 = MEMORY[0x263F6FFF0];
  v44[3] = v45;
  v44[4] = v46;
  __swift_allocate_boxed_opaque_existential_1(v44);
  uint64_t v47 = (void *)swift_task_alloc();
  v24[25] = v47;
  *uint64_t v47 = v24;
  v47[1] = sub_25DA7205C;
  OUTLINED_FUNCTION_21_0();
  return sub_25DA72F1C();
}

uint64_t sub_25DA723D4()
{
  OUTLINED_FUNCTION_37();
  __swift_deallocate_boxed_opaque_existential_1(*(void *)(v0 + 96));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_23();
  return v1();
}

id sub_25DA72464()
{
  sub_25DA79EF0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_14();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A69F8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  sub_25DA79EB0();
  uint64_t v5 = sub_25DA79EC0();
  uint64_t v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v5) != 1)
  {
    uint64_t v6 = (void *)sub_25DA79E90();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v3, v5);
  }
  objc_msgSend(v4, sel_setPunchOutUri_, v6);

  id v7 = v4;
  sub_25DA79EE0();
  uint64_t v8 = sub_25DA79ED0();
  uint64_t v10 = v9;
  uint64_t v11 = OUTLINED_FUNCTION_30_0();
  v12(v11);
  sub_25DA6FEB8(v8, v10, v7, (SEL *)&selRef_setAceId_);

  return v7;
}

uint64_t sub_25DA72628@<X0>(uint64_t *a1@<X8>)
{
  return sub_25DA72640(a1);
}

uint64_t sub_25DA72640@<X0>(uint64_t *a1@<X8>)
{
  sub_25DA73584(v1 + 16, (uint64_t)&v7);
  if (v8)
  {
    sub_25DA70158(&v7, (uint64_t)v9);
  }
  else
  {
    sub_25DA735EC((uint64_t)&v7, &qword_26A6A6908);
    sub_25DA7A120();
  }
  sub_25DA6FD08((uint64_t)v9, (uint64_t)&v7);
  uint64_t v3 = sub_25DA79F30();
  swift_allocObject();
  swift_retain();
  uint64_t v4 = sub_25DA79F20();
  uint64_t v5 = MEMORY[0x263F6F228];
  a1[3] = v3;
  a1[4] = v5;
  *a1 = v4;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

uint64_t sub_25DA72714(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = a2;
  uint64_t v3 = sub_25DA7A3F0();
  v2[14] = v3;
  v2[15] = *(void *)(v3 - 8);
  v2[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6A6920);
  v2[17] = swift_task_alloc();
  sub_25DA7A390();
  v2[18] = swift_task_alloc();
  uint64_t v4 = sub_25DA7A0C0();
  v2[19] = v4;
  v2[20] = *(void *)(v4 - 8);
  v2[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DA7288C, 0, 0);
}

uint64_t sub_25DA7288C()
{
  OUTLINED_FUNCTION_19_0();
  type metadata accessor for ReadThisCATProvider();
  uint64_t v1 = swift_allocObject();
  v0[22] = OUTLINED_FUNCTION_25_0(v1, v2, v3, v4, v5, v6, v7, v8, v13);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[23] = v9;
  void *v9 = v0;
  v9[1] = sub_25DA72950;
  uint64_t v10 = v0[21];
  uint64_t v11 = MEMORY[0x263F8EE78];
  return sub_25DA73DC4(v10, 4, v11);
}

uint64_t sub_25DA72950()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v6 = v5;
  *(void *)(v3 + 192) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_16();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25DA72A34()
{
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v5 = *(uint64_t **)(v0 + 96);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 104) + 56), *(void *)(*(void *)(v0 + 104) + 80));
  sub_25DA7A050();
  uint64_t v6 = sub_25DA7A0B0();
  uint64_t v7 = OUTLINED_FUNCTION_49(v6);
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  uint64_t v8 = MEMORY[0x263F6FFF0];
  v5[3] = v7;
  v5[4] = v8;
  __swift_allocate_boxed_opaque_existential_1(v5);
  sub_25DA7A080();
  sub_25DA735EC(v0 + 16, (uint64_t *)&unk_26A6A69B0);
  sub_25DA735EC(v4, (uint64_t *)&unk_26A6A6920);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_42();
  return v9();
}

uint64_t sub_25DA72BA4()
{
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v6 = v5;
  *(void *)(v3 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_16();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_42();
    return v10();
  }
}

uint64_t sub_25DA72CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_20_0();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  swift_release();
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  uint64_t v27 = (void *)v24[24];
  __swift_project_value_buffer(v24[14], (uint64_t)qword_26A6A7500);
  uint64_t v28 = OUTLINED_FUNCTION_15_0();
  v29(v28);
  id v30 = v27;
  id v31 = v27;
  id v32 = sub_25DA7A3E0();
  os_log_type_t v33 = sub_25DA7A5D0();
  BOOL v34 = os_log_type_enabled(v32, v33);
  os_log_type_t v35 = (void *)v24[24];
  uint64_t v37 = v24[15];
  uint64_t v36 = v24[16];
  uint64_t v38 = v24[14];
  if (v34)
  {
    uint64_t v50 = v24[16];
    OUTLINED_FUNCTION_13();
    a13 = OUTLINED_FUNCTION_31_0();
    OUTLINED_FUNCTION_10_0(4.8149e-34);
    uint64_t v39 = sub_25DA7A730();
    uint64_t v41 = sub_25DA76754(v39, v40, &a13);
    OUTLINED_FUNCTION_28_0(v41);
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_23_0(&dword_25DA66000, v42, v43, "Could not get CAT template: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v50, a11);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
  }
  uint64_t v44 = (uint64_t *)v24[12];
  uint64_t v45 = sub_25DA7A180();
  uint64_t v46 = MEMORY[0x263F6FFF0];
  v44[3] = v45;
  v44[4] = v46;
  __swift_allocate_boxed_opaque_existential_1(v44);
  uint64_t v47 = (void *)swift_task_alloc();
  v24[25] = v47;
  *uint64_t v47 = v24;
  v47[1] = sub_25DA72BA4;
  OUTLINED_FUNCTION_21_0();
  return sub_25DA72F1C();
}

uint64_t sub_25DA72F1C()
{
  OUTLINED_FUNCTION_15();
  v1[7] = v2;
  v1[8] = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6A6920);
  v1[9] = OUTLINED_FUNCTION_52();
  uint64_t v3 = sub_25DA7A0C0();
  v1[10] = v3;
  OUTLINED_FUNCTION_3_0(v3);
  v1[11] = v4;
  v1[12] = OUTLINED_FUNCTION_52();
  uint64_t v5 = sub_25DA7A3F0();
  v1[13] = v5;
  OUTLINED_FUNCTION_3_0(v5);
  v1[14] = v6;
  v1[15] = OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_16();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25DA73000()
{
  OUTLINED_FUNCTION_37();
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[13], (uint64_t)qword_26A6A7500);
  uint64_t v1 = OUTLINED_FUNCTION_27_0();
  v2(v1);
  uint64_t v3 = (void *)sub_25DA7A3E0();
  os_log_type_t v4 = sub_25DA7A5D0();
  if (OUTLINED_FUNCTION_33(v4))
  {
    *(_WORD *)OUTLINED_FUNCTION_11() = 0;
    OUTLINED_FUNCTION_19(&dword_25DA66000, v5, v6, "Defaulting to generic error template response");
    OUTLINED_FUNCTION_2_0();
  }
  uint64_t v8 = v0[14];
  uint64_t v7 = v0[15];
  uint64_t v9 = v0[13];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[16] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_25DA73154;
  uint64_t v11 = v0[12];
  return MEMORY[0x270F67538](v11);
}

uint64_t sub_25DA73154()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_6();
  *uint64_t v5 = v4;
  *(void *)(v6 + 136) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25DA73230()
{
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 80);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 64) + 56), *(void *)(*(void *)(v0 + 64) + 80));
  sub_25DA7A050();
  uint64_t v5 = sub_25DA7A0B0();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v5);
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  sub_25DA7A080();
  sub_25DA735EC(v0 + 16, (uint64_t *)&unk_26A6A69B0);
  sub_25DA735EC(v3, (uint64_t *)&unk_26A6A6920);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_42();
  return v6();
}

uint64_t sub_25DA73390()
{
  OUTLINED_FUNCTION_15();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_23();
  return v0();
}

uint64_t sub_25DA73404()
{
  sub_25DA735EC(v0 + 16, &qword_26A6A6908);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t type metadata accessor for ScreenReaderFlow()
{
  return self;
}

uint64_t sub_25DA73470(uint64_t a1)
{
  return 1;
}

uint64_t sub_25DA7348C()
{
  return sub_25DA70950();
}

uint64_t sub_25DA734B0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25DA6D3FC;
  return sub_25DA709D8();
}

uint64_t sub_25DA7354C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for ScreenReaderFlow();

  return MEMORY[0x270F66CE8](v3, a2);
}

uint64_t sub_25DA73584(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6908);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DA735EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25DA73648()
{
  OUTLINED_FUNCTION_15();
  uint64_t v3 = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_25DA70174;
  return sub_25DA72714(v3, v0);
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x2611BB6F0);
  }
  return result;
}

uint64_t sub_25DA73734(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_25DA7376C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25DA73794()
{
  OUTLINED_FUNCTION_15();
  uint64_t v3 = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_25DA6D3FC;
  return sub_25DA71AA0(v3, v0);
}

void sub_25DA7382C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_25DA7A610();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

void sub_25DA738E4(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A69F0);
  id v3 = (id)sub_25DA7A4E0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setCommands_, v3);
}

uint64_t sub_25DA7395C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_10_0(float a1)
{
  *uint64_t v1 = a1;
  return swift_getErrorValue();
}

BOOL OUTLINED_FUNCTION_11_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

_WORD *OUTLINED_FUNCTION_13_0(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_25DA7A380();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return v0;
}

void OUTLINED_FUNCTION_23_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_24_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v6, v5, a4, v4, 2u);
}

uint64_t OUTLINED_FUNCTION_25_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_25DA73BE8(v9, (uint64_t)&a9);
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28_0(uint64_t a1)
{
  *(void *)(v1 + 88) = a1;
  return sub_25DA7A610();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return swift_slowAlloc();
}

uint64_t type metadata accessor for ReadThisCATProvider()
{
  uint64_t result = qword_26A6A6A20;
  if (!qword_26A6A6A20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DA73BA8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25DA73BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DA7A390();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A69F8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DA74160(a2, (uint64_t)&v14);
  if (v15)
  {
    sub_25DA70158(&v14, (uint64_t)v16);
    sub_25DA7A350();
    sub_25DA6FD08((uint64_t)v16, (uint64_t)&v14);
    sub_25DA7A340();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    sub_25DA741C8((uint64_t)&v14);
  }
  uint64_t v11 = sub_25DA79EC0();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v12 = sub_25DA7A360();
  sub_25DA741C8(a2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v12;
}

uint64_t sub_25DA73DC4(uint64_t a1, char a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(unsigned char *)(v4 + 64) = a2;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_25DA73DEC, 0, 0);
}

uint64_t sub_25DA73DEC()
{
  unint64_t v1 = sub_25DA7405C(*(unsigned char *)(v0 + 64));
  uint64_t v3 = v2;
  *(void *)(v0 + 40) = v2;
  uint64_t v8 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))((int)*MEMORY[0x263F6D058]
                                                                           + MEMORY[0x263F6D058]);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25DA73EBC;
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v6 = *(void *)(v0 + 16);
  return v8(v6, v1, v3, v5);
}

uint64_t sub_25DA73EBC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25DA73FF8, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25DA73FF8()
{
  swift_bridgeObjectRelease();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_25DA7405C(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000022;
      break;
    default:
      return result;
  }
  return result;
}

void sub_25DA740F8()
{
}

uint64_t sub_25DA74128()
{
  uint64_t v0 = sub_25DA7A370();

  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_25DA74158()
{
  return type metadata accessor for ReadThisCATProvider();
}

uint64_t sub_25DA74160(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DA741C8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DA74228(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25DA77790(*a1, *a2);
}

unint64_t sub_25DA74234@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25DA7405C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_25DA74260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25DA7A740();
    sub_25DA7A4C0();
    uint64_t v6 = sub_25DA7A760();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    uint64_t v8 = v6 & ~v7;
    OUTLINED_FUNCTION_13_1();
    if (v9)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      if ((*v11 != a1 || v11[1] != a2) && (sub_25DA7A720() & 1) == 0)
      {
        uint64_t v13 = ~v7;
        uint64_t v14 = (v8 + 1) & v13;
        OUTLINED_FUNCTION_13_1();
        if (v15)
        {
          do
          {
            uint64_t v16 = (void *)(v10 + 16 * v14);
            if (*v16 == a1 && v16[1] == a2) {
              break;
            }
            if (sub_25DA7A720()) {
              break;
            }
            uint64_t v14 = (v14 + 1) & v13;
            OUTLINED_FUNCTION_13_1();
          }
          while ((v18 & 1) != 0);
        }
      }
    }
  }
}

uint64_t sub_25DA74374()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A50);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25DA7B1C0;
  *(void *)(inited + 32) = 0xD000000000000010;
  *(void *)(inited + 40) = 0x800000025DA7BA90;
  *(void *)(inited + 48) = 0xD000000000000016;
  *(void *)(inited + 56) = 0x800000025DA7B710;
  *(void *)(inited + 64) = 0x697261666153;
  *(void *)(inited + 72) = 0xE600000000000000;
  *(void *)(inited + 80) = 0xD000000000000012;
  *(void *)(inited + 88) = 0x800000025DA7BAB0;
  uint64_t result = sub_25DA76F40(inited);
  qword_26A6A74F0 = result;
  return result;
}

uint64_t SiriReaderFlowProvider.__allocating_init(referenceResolver:aceServiceInvoker:deviceState:outputPublisher:)(long long *a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  SiriReaderFlowProvider.init(referenceResolver:aceServiceInvoker:deviceState:outputPublisher:)(a1, a2, a3, a4);
  return v8;
}

uint64_t SiriReaderFlowProvider.init(referenceResolver:aceServiceInvoker:deviceState:outputPublisher:)(long long *a1, long long *a2, long long *a3, uint64_t a4)
{
  sub_25DA70158(a1, v4 + 16);
  sub_25DA70158(a2, v4 + 56);
  sub_25DA70158(a3, v4 + 96);
  sub_25DA744E4(a4, v4 + 136);
  return v4;
}

uint64_t sub_25DA744E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6908);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void SiriReaderFlowProvider.findFlow(for:)()
{
  OUTLINED_FUNCTION_8();
  uint64_t v98 = v1;
  uint64_t v99 = v4;
  uint64_t v6 = v5;
  uint64_t v85 = sub_25DA7A190();
  OUTLINED_FUNCTION_0();
  uint64_t v84 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_53();
  uint64_t v82 = v9;
  OUTLINED_FUNCTION_27_1();
  sub_25DA7A170();
  OUTLINED_FUNCTION_0();
  uint64_t v87 = v11;
  uint64_t v88 = v10;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_36();
  sub_25DA7A320();
  OUTLINED_FUNCTION_0();
  uint64_t v95 = v13;
  v96 = v12;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_53();
  uint64_t v94 = v14;
  OUTLINED_FUNCTION_27_1();
  uint64_t v15 = sub_25DA7A140();
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v16;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = ((char *)&v79 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_29_0();
  uint64_t v100 = v22;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_29_0();
  uint64_t v97 = v24;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_23_1();
  uint64_t v103 = sub_25DA7A3F0();
  OUTLINED_FUNCTION_0();
  uint64_t v27 = v26;
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_2_1();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_29_0();
  uint64_t v81 = v30;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x270FA5388](v31);
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  uint64_t v83 = v21;
  uint64_t v92 = v3;
  uint64_t v86 = v0;
  uint64_t v32 = __swift_project_value_buffer(v103, (uint64_t)qword_26A6A7500);
  uint64_t v33 = *(void *)(v27 + 16);
  uint64_t v89 = v32;
  uint64_t v90 = v33;
  uint64_t v91 = v27 + 16;
  OUTLINED_FUNCTION_5();
  v34();
  os_log_type_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  id v101 = v6;
  id v102 = v35;
  v35(v2, (uint64_t)v6, v15);
  uint64_t v36 = sub_25DA7A3E0();
  os_log_type_t v37 = sub_25DA7A5B0();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = swift_slowAlloc();
    uint64_t v93 = v27;
    uint64_t v39 = (uint8_t *)v38;
    uint64_t v80 = swift_slowAlloc();
    v104[0] = v80;
    *(_DWORD *)uint64_t v39 = 136315138;
    v79 = v39 + 4;
    v102((uint64_t)v97, v2, v15);
    uint64_t v40 = sub_25DA7A4B0();
    uint64_t v42 = sub_25DA76754(v40, v41, v104);
    OUTLINED_FUNCTION_22_1(v42);
    sub_25DA7A610();
    swift_bridgeObjectRelease();
    uint64_t v43 = *(void (**)(void))(v17 + 8);
    OUTLINED_FUNCTION_11_1();
    v43();
    _os_log_impl(&dword_25DA66000, v36, v37, "Finding flow for parse: %s", v39, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    uint64_t v27 = v93;
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    uint64_t v43 = *(void (**)(void))(v17 + 8);
    OUTLINED_FUNCTION_11_1();
    v43();
  }

  uint64_t v44 = *(void (**)(void))(v27 + 8);
  OUTLINED_FUNCTION_21_1();
  v44();
  uint64_t v45 = v102;
  v102(v100, (uint64_t)v101, v15);
  uint64_t v46 = OUTLINED_FUNCTION_28_1();
  int v48 = v47(v46);
  if (v48 == *MEMORY[0x263F6FF50])
  {
    uint64_t v49 = OUTLINED_FUNCTION_28_1();
    v50(v49);
    OUTLINED_FUNCTION_17_0();
    v51();
    sub_25DA752BC();
    OUTLINED_FUNCTION_25_1();
    v52();
  }
  else if (v48 == *MEMORY[0x263F6FF58])
  {
    uint64_t v53 = OUTLINED_FUNCTION_19_1();
    v54(v53);
    sub_25DA74D3C();
    swift_unknownObjectRelease();
  }
  else if (v48 == *MEMORY[0x263F6FF80])
  {
    uint64_t v55 = OUTLINED_FUNCTION_19_1();
    v56(v55);
    uint64_t v58 = v86;
    uint64_t v57 = v87;
    uint64_t v59 = v88;
    OUTLINED_FUNCTION_17_0();
    v60();
    uint64_t v61 = v82;
    sub_25DA7A160();
    uint64_t v62 = sub_25DA7A1A0();
    (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v61, v85);
    if (v62)
    {
      sub_25DA74D3C();
      swift_unknownObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_5();
      v74();
      char v75 = (void *)sub_25DA7A3E0();
      os_log_type_t v76 = sub_25DA7A5B0();
      if (OUTLINED_FUNCTION_16_1(v76))
      {
        *(_WORD *)OUTLINED_FUNCTION_11() = 0;
        OUTLINED_FUNCTION_54(&dword_25DA66000, v77, v78, "Unable to convert user parse to user dialog act, returning no flow");
        OUTLINED_FUNCTION_2_0();
      }

      OUTLINED_FUNCTION_21_1();
      v44();
      sub_25DA79F90();
    }
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v58, v59);
  }
  else
  {
    uint64_t v93 = v27;
    OUTLINED_FUNCTION_5();
    v63();
    uint64_t v64 = (void (*)(char *, NSObject *, uint64_t))v45;
    os_log_type_t v65 = v83;
    v64((char *)v83, v101, v15);
    uint64_t v66 = sub_25DA7A3E0();
    os_log_type_t v67 = sub_25DA7A5D0();
    id v101 = v66;
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      uint64_t v98 = swift_slowAlloc();
      v104[0] = v98;
      v96 = v68;
      *(_DWORD *)v68 = 136315138;
      uint64_t v95 = v68 + 4;
      v64(v97, v65, v15);
      OUTLINED_FUNCTION_28_1();
      uint64_t v69 = sub_25DA7A4B0();
      uint64_t v71 = sub_25DA76754(v69, v70, v104);
      OUTLINED_FUNCTION_22_1(v71);
      sub_25DA7A610();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_11_1();
      v43();
      uint64_t v72 = v101;
      _os_log_impl(&dword_25DA66000, v101, v67, "Received unsupported parse: %s", v96, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();
    }
    else
    {
      OUTLINED_FUNCTION_11_1();
      v43();
    }
    OUTLINED_FUNCTION_21_1();
    v44();
    sub_25DA79F90();
    uint64_t v73 = OUTLINED_FUNCTION_28_1();
    ((void (*)(uint64_t))v43)(v73);
  }
  OUTLINED_FUNCTION_7();
}

void sub_25DA74D3C()
{
  OUTLINED_FUNCTION_8();
  uint64_t v50 = v0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6A6978);
  uint64_t v2 = OUTLINED_FUNCTION_30_1(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_14_0();
  uint64_t v45 = v3;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x270FA5388](v4);
  uint64_t v46 = (char *)&v44 - v5;
  OUTLINED_FUNCTION_27_1();
  uint64_t v6 = sub_25DA7A3F0();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_14_0();
  uint64_t v47 = v10;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_29_0();
  uint64_t v51 = v12;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x270FA5388](v13);
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v6, (uint64_t)qword_26A6A7500);
  uint64_t v14 = *(void (**)(uint64_t))(v8 + 16);
  uint64_t v15 = OUTLINED_FUNCTION_6_0();
  v14(v15);
  uint64_t v16 = sub_25DA7A3E0();
  os_log_type_t v17 = sub_25DA7A5B0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_11();
    uint64_t v49 = v6;
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_25DA66000, v16, v17, "Handling NLv4 parse", v18, 2u);
    OUTLINED_FUNCTION_2_0();
  }

  uint64_t v19 = *(void (**)(void))(v8 + 8);
  OUTLINED_FUNCTION_30();
  v19();
  uint64_t v20 = swift_unknownObjectRetain();
  uint64_t v21 = ReaderNLv4Intent.init(userDialogAct:)(v20);
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if (ReaderNLv4Intent.shouldStartScreenReader.getter(v21, v22, v24))
  {
    uint64_t v48 = v23;
    uint64_t v49 = v25;
    uint64_t v26 = OUTLINED_FUNCTION_6_0();
    v14(v26);
    uint64_t v27 = sub_25DA7A3E0();
    os_log_type_t v28 = sub_25DA7A5B0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)OUTLINED_FUNCTION_11();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_25DA66000, v27, v28, "Creating ScreenReaderFlow", v29, 2u);
      OUTLINED_FUNCTION_2_0();
    }

    OUTLINED_FUNCTION_30();
    v19();
    uint64_t v30 = v50;
    sub_25DA6FCAC(v50 + 136, (uint64_t)v54, &qword_26A6A6908);
    sub_25DA6FD08(v30 + 96, (uint64_t)v53);
    type metadata accessor for ScreenReaderFlow();
    uint64_t v31 = swift_allocObject();
    sub_25DA744E4((uint64_t)v54, v31 + 16);
    sub_25DA70158(v53, v31 + 56);
    *(void *)&v54[0] = v31;
    sub_25DA773F0(&qword_26A6A6A18, (void (*)(uint64_t))type metadata accessor for ScreenReaderFlow);
    sub_25DA79F40();
    swift_release();
    sub_25DA79FA0();
    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    goto LABEL_14;
  }
  if ((ReaderNLv4Intent.read.getter() & 1) == 0)
  {
    sub_25DA79F90();
    swift_unknownObjectRelease();
    swift_release();
LABEL_14:
    swift_release();
    goto LABEL_15;
  }
  uint64_t v48 = v23;
  uint64_t v49 = v25;
  os_log_type_t v32 = v47;
  uint64_t v33 = OUTLINED_FUNCTION_6_0();
  v14(v33);
  BOOL v34 = sub_25DA7A3E0();
  os_log_type_t v35 = sub_25DA7A5B0();
  if (OUTLINED_FUNCTION_16_1(v35))
  {
    uint64_t v36 = (uint8_t *)OUTLINED_FUNCTION_11();
    *(_WORD *)uint64_t v36 = 0;
    _os_log_impl(&dword_25DA66000, v34, v32, "Creating ReadThisFlow", v36, 2u);
    OUTLINED_FUNCTION_2_0();
  }

  OUTLINED_FUNCTION_30();
  v19();
  uint64_t v37 = (uint64_t)v46;
  uint64_t v38 = v50;
  sub_25DA75640();
  uint64_t v39 = v45;
  sub_25DA6FCAC(v37, v45, (uint64_t *)&unk_26A6A6978);
  sub_25DA6FD08(v38 + 56, (uint64_t)v54);
  sub_25DA6FCAC(v38 + 136, (uint64_t)v53, &qword_26A6A6908);
  sub_25DA6FD08(v38 + 96, (uint64_t)v52);
  id v40 = objc_msgSend(self, sel_sharedPreferences);
  uint64_t v41 = sub_25DA7732C(v40);
  uint64_t v43 = v42;
  type metadata accessor for ReadThisFlow(0);
  OUTLINED_FUNCTION_46();
  *(void *)&v54[0] = sub_25DA69ABC(v39, v41, v43, v54, (uint64_t)v53, v52);
  sub_25DA773F0(&qword_26A6A6958, (void (*)(uint64_t))type metadata accessor for ReadThisFlow);
  sub_25DA79F40();
  swift_release();
  sub_25DA79FA0();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_25DA7739C(v37, (uint64_t *)&unk_26A6A6978);
LABEL_15:
  OUTLINED_FUNCTION_7();
}

void sub_25DA752BC()
{
  OUTLINED_FUNCTION_8();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v34 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6A6978);
  uint64_t v7 = OUTLINED_FUNCTION_30_1(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2_1();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = type metadata accessor for ReaderNLv3Intent();
  uint64_t v12 = OUTLINED_FUNCTION_30_1(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_3_1();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_25DA7A3F0();
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_3_1();
  uint64_t v22 = v21 - v20;
  if (qword_26A6A62E0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v16, (uint64_t)qword_26A6A7500);
  OUTLINED_FUNCTION_5();
  v23();
  uint64_t v24 = sub_25DA7A3E0();
  os_log_type_t v25 = sub_25DA7A5B0();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)OUTLINED_FUNCTION_11();
    uint64_t v33 = v15;
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl(&dword_25DA66000, v24, v25, "Handling NLv3 parse", v26, 2u);
    uint64_t v15 = v33;
    OUTLINED_FUNCTION_2_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v22, v16);
  sub_25DA7A320();
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t, uint64_t))(v27 + 16))(v15, v4);
  if (ReaderNLv3Intent.read.getter())
  {
    sub_25DA75640();
    sub_25DA6FCAC((uint64_t)v10, v1, (uint64_t *)&unk_26A6A6978);
    sub_25DA6FD08(v2 + 56, (uint64_t)v37);
    sub_25DA6FCAC(v2 + 136, (uint64_t)v36, &qword_26A6A6908);
    sub_25DA6FD08(v2 + 96, (uint64_t)v35);
    id v28 = objc_msgSend(self, sel_sharedPreferences);
    uint64_t v29 = sub_25DA7732C(v28);
    uint64_t v31 = v30;
    type metadata accessor for ReadThisFlow(0);
    OUTLINED_FUNCTION_46();
    *(void *)&v37[0] = sub_25DA69ABC(v1, v29, v31, v37, (uint64_t)v36, v35);
    sub_25DA773F0(&qword_26A6A6958, (void (*)(uint64_t))type metadata accessor for ReadThisFlow);
    sub_25DA79F40();
    swift_release();
    sub_25DA79FA0();
    swift_release();
    sub_25DA7739C((uint64_t)v10, (uint64_t *)&unk_26A6A6978);
  }
  else
  {
    sub_25DA79F90();
  }
  sub_25DA772D0(v15);
  OUTLINED_FUNCTION_7();
}

void sub_25DA75640()
{
  OUTLINED_FUNCTION_8();
  uint64_t v49 = v1;
  uint64_t v5 = v4;
  uint64_t v6 = sub_25DA7A3F0();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v43 - v11;
  sub_25DA7A480();
  OUTLINED_FUNCTION_0();
  uint64_t v47 = v14;
  uint64_t v48 = v13;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_36();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A68D0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2_1();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_23_1();
  sub_25DA7A2B0();
  OUTLINED_FUNCTION_46();
  uint64_t v50 = sub_25DA7A2A0();
  uint64_t v17 = MEMORY[0x2611BAD10]();
  if (!v17)
  {
    if (qword_26A6A62E0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v6, (uint64_t)qword_26A6A7500);
    OUTLINED_FUNCTION_5();
    v30();
    uint64_t v31 = (void *)sub_25DA7A3E0();
    os_log_type_t v32 = sub_25DA7A5D0();
    if (OUTLINED_FUNCTION_16_1(v32))
    {
      *(_WORD *)OUTLINED_FUNCTION_11() = 0;
      OUTLINED_FUNCTION_54(&dword_25DA66000, v33, v34, "Could not create query entity for SiriReferenceResolution");
      OUTLINED_FUNCTION_2_0();
      swift_release();
    }
    else
    {

      swift_release();
    }
    OUTLINED_FUNCTION_25_1();
    v38();
    uint64_t v39 = sub_25DA7A460();
    uint64_t v40 = v5;
    goto LABEL_16;
  }
  uint64_t v44 = v6;
  uint64_t v45 = v12;
  uint64_t v43 = v8;
  uint64_t v46 = v5;
  uint64_t v18 = v17;
  __swift_project_boxed_opaque_existential_1((void *)(v49 + 16), *(void *)(v49 + 40));
  sub_25DA7A440();
  OUTLINED_FUNCTION_46();
  swift_retain();
  sub_25DA7A430();
  sub_25DA7A3D0();
  swift_release();
  sub_25DA6FCAC(v2, (uint64_t)v3, &qword_26A6A68D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v49 = v18;
    uint64_t v19 = *v3;
    if (qword_26A6A62E0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v44, (uint64_t)qword_26A6A7500);
    OUTLINED_FUNCTION_5();
    v20();
    id v21 = v19;
    id v22 = v19;
    uint64_t v23 = sub_25DA7A3E0();
    os_log_type_t v24 = sub_25DA7A5D0();
    if (os_log_type_enabled(v23, v24))
    {
      os_log_type_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v25 = 136315138;
      uint64_t v48 = v2;
      swift_getErrorValue();
      uint64_t v26 = sub_25DA7A730();
      uint64_t v51 = sub_25DA76754(v26, v27, &v52);
      sub_25DA7A610();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25DA66000, v23, v24, "Failed to make SRR resolve call %s", v25, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();
      swift_release();

      swift_release();
      OUTLINED_FUNCTION_30();
      v28();
      uint64_t v29 = v48;
    }
    else
    {
      swift_release();

      swift_release();
      OUTLINED_FUNCTION_25_1();
      v41();
      uint64_t v29 = v2;
    }
    sub_25DA7739C(v29, &qword_26A6A68D0);
    uint64_t v42 = v46;
    uint64_t v39 = sub_25DA7A460();
    uint64_t v40 = v42;
LABEL_16:
    __swift_storeEnumTagSinglePayload(v40, 1, 1, v39);
    goto LABEL_17;
  }
  uint64_t v36 = v47;
  uint64_t v35 = v48;
  OUTLINED_FUNCTION_17_0();
  v37();
  sub_25DA75BBC();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v0, v35);
  sub_25DA7739C(v2, &qword_26A6A68D0);
LABEL_17:
  OUTLINED_FUNCTION_7();
}

void sub_25DA75BBC()
{
  OUTLINED_FUNCTION_8();
  uint64_t v34 = v0;
  uint64_t v1 = sub_25DA7A460();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_3_1();
  sub_25DA7A420();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3_1();
  uint64_t v4 = sub_25DA7A480();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3_1();
  uint64_t v10 = v9 - v8;
  OUTLINED_FUNCTION_5();
  v11();
  int v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 88))(v10, v4);
  if (v12 == *MEMORY[0x263F742B8])
  {
    uint64_t v13 = OUTLINED_FUNCTION_5_1();
    v14(v13);
    OUTLINED_FUNCTION_17_0();
    v15();
    if (qword_26A6A62D0 != -1) {
      swift_once();
    }
    uint64_t v16 = qword_26A6A74F0;
    sub_25DA7A410();
    uint64_t v17 = sub_25DA7A450();
    uint64_t v19 = v18;
    OUTLINED_FUNCTION_30();
    v20();
    sub_25DA74260(v17, v19, v16);
    LOBYTE(v17) = v21;
    swift_bridgeObjectRelease();
    if (v17)
    {
      sub_25DA7A410();
      uint64_t v22 = OUTLINED_FUNCTION_31_1();
      v23(v22);
      uint64_t v24 = v34;
      uint64_t v25 = 0;
LABEL_12:
      __swift_storeEnumTagSinglePayload(v24, v25, 1, v1);
      goto LABEL_13;
    }
    uint64_t v29 = OUTLINED_FUNCTION_31_1();
    v30(v29);
LABEL_11:
    uint64_t v24 = v34;
    uint64_t v25 = 1;
    goto LABEL_12;
  }
  int v26 = v12;
  if (v12 == *MEMORY[0x263F742C8] || v12 == *MEMORY[0x263F742C0])
  {
    uint64_t v27 = OUTLINED_FUNCTION_5_1();
    v28(v27);
    sub_25DA75F00();
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  if (v12 == *MEMORY[0x263F742D0])
  {
    uint64_t v31 = OUTLINED_FUNCTION_5_1();
    v32(v31);
    if (!*(void *)(*(void *)v10 + 16))
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_25DA75F00();
    goto LABEL_9;
  }
  int v33 = *MEMORY[0x263F742D8];
  __swift_storeEnumTagSinglePayload(v34, 1, 1, v1);
  if (v26 != v33) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  }
LABEL_13:
  OUTLINED_FUNCTION_7();
}

void sub_25DA75F00()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_25DA7A3F0();
  OUTLINED_FUNCTION_0();
  uint64_t v53 = v5;
  uint64_t v54 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_53();
  uint64_t v52 = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A40);
  uint64_t v8 = OUTLINED_FUNCTION_30_1(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_53();
  uint64_t v56 = v9;
  OUTLINED_FUNCTION_27_1();
  uint64_t v10 = sub_25DA7A460();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_3_1();
  uint64_t v64 = sub_25DA7A420();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_14_0();
  uint64_t v63 = v15;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v50 - v17;
  uint64_t v19 = MEMORY[0x263F8EE78];
  uint64_t v65 = MEMORY[0x263F8EE78];
  uint64_t v20 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v55 = v13;
  if (v20)
  {
    uint64_t v50 = v1;
    uint64_t v51 = v3;
    uint64_t v61 = *(void *)(v13 + 16);
    uint64_t v62 = v13 + 16;
    uint64_t v21 = *(void *)(v13 + 72);
    unint64_t v58 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    uint64_t v59 = v10;
    uint64_t v22 = v1 + v58;
    uint64_t v57 = (void (**)(char *, uint64_t))(v13 + 8);
    uint64_t v60 = (void (**)(uint64_t))(v13 + 32);
    do
    {
      OUTLINED_FUNCTION_5();
      v24(v23);
      if (qword_26A6A62D0 != -1) {
        swift_once();
      }
      uint64_t v25 = qword_26A6A74F0;
      sub_25DA7A410();
      uint64_t v26 = sub_25DA7A450();
      uint64_t v28 = v27;
      OUTLINED_FUNCTION_25_1();
      v30(v29);
      sub_25DA74260(v26, v28, v25);
      LOBYTE(v26) = v31;
      swift_bridgeObjectRelease();
      if (v26)
      {
        os_log_type_t v32 = *v60;
        OUTLINED_FUNCTION_17_0();
        v32(v33);
        uint64_t v34 = v65;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25DA77110(0, *(void *)(v34 + 16) + 1, 1);
          uint64_t v34 = v65;
        }
        unint64_t v36 = *(void *)(v34 + 16);
        unint64_t v35 = *(void *)(v34 + 24);
        if (v36 >= v35 >> 1)
        {
          sub_25DA77110(v35 > 1, v36 + 1, 1);
          uint64_t v34 = v65;
        }
        *(void *)(v34 + 16) = v36 + 1;
        uint64_t v37 = v64;
        OUTLINED_FUNCTION_17_0();
        v32(v38);
        uint64_t v65 = v34;
        uint64_t v10 = v59;
      }
      else
      {
        uint64_t v37 = v64;
        (*v57)(v18, v64);
      }
      v22 += v21;
      --v20;
    }
    while (v20);
    uint64_t v19 = v65;
    uint64_t v3 = v51;
  }
  else
  {
    uint64_t v37 = v64;
  }
  swift_bridgeObjectRelease();
  uint64_t v39 = v55;
  uint64_t v40 = v56;
  if (*(void *)(v19 + 16))
  {
    sub_25DA799BC(v19, v56);
    swift_release();
    if (__swift_getEnumTagSinglePayload(v40, 1, v37) != 1)
    {
      sub_25DA7A410();
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v40, v37);
      uint64_t v49 = 0;
      goto LABEL_25;
    }
    sub_25DA7739C(v40, &qword_26A6A6A40);
  }
  else
  {
    swift_release();
    if (qword_26A6A62E0 != -1) {
      swift_once();
    }
    uint64_t v41 = v54;
    __swift_project_value_buffer(v54, (uint64_t)qword_26A6A7500);
    uint64_t v43 = v52;
    uint64_t v42 = v53;
    OUTLINED_FUNCTION_5();
    v45(v44);
    uint64_t v46 = sub_25DA7A3E0();
    os_log_type_t v47 = sub_25DA7A5D0();
    if (OUTLINED_FUNCTION_16_1(v47))
    {
      uint64_t v48 = (uint8_t *)OUTLINED_FUNCTION_11();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl(&dword_25DA66000, v46, (os_log_type_t)v43, "None of the entities are from Safari", v48, 2u);
      OUTLINED_FUNCTION_2_0();
    }

    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v43, v41);
  }
  uint64_t v49 = 1;
LABEL_25:
  __swift_storeEnumTagSinglePayload(v3, v49, 1, v10);
  OUTLINED_FUNCTION_7();
}

uint64_t SiriReaderFlowProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  sub_25DA7739C(v0 + 136, &qword_26A6A6908);
  return v0;
}

uint64_t SiriReaderFlowProvider.__deallocating_deinit()
{
  SiriReaderFlowProvider.deinit();

  return MEMORY[0x270FA0228](v0, 176, 7);
}

uint64_t sub_25DA76420(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25DA76430(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25DA7646C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_25DA7A690();
    __break(1u);
    return MEMORY[0x270FA01D0](v8, v9, v10, v7);
  }
  if (a3 < a1 || (uint64_t result = sub_25DA7A420(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = sub_25DA7A420();
    return MEMORY[0x270FA01D8](a3, a1, a2, v11);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
    return MEMORY[0x270FA01D0](v8, v9, v10, v7);
  }
  return result;
}

uint64_t sub_25DA7659C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v6 = sub_25DA7A420(), v7 = *(void *)(*(void *)(v6 - 8) + 72) * a2, v8 = a3 + v7, v9 = a1 + v7, v8 > a1)
      ? (BOOL v10 = v9 > a3)
      : (BOOL v10 = 0),
        v10))
  {
    uint64_t v12 = sub_25DA7A690();
    __break(1u);
  }
  else
  {
    uint64_t v11 = v6;
    uint64_t v12 = a3;
    unint64_t v13 = a1;
    uint64_t v14 = a2;
  }
  return MEMORY[0x270FA01C8](v12, v13, v14, v11);
}

uint64_t sub_25DA766B4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25DA766DC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25DA76754(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25DA7A610();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25DA76754(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25DA76828(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25DA77438((uint64_t)v12, *a3);
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
      sub_25DA77438((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25DA76828(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25DA76980((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25DA7A620();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25DA76A58(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25DA7A660();
    if (!v8)
    {
      uint64_t result = sub_25DA7A670();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_25DA76980(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25DA7A690();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25DA76A58(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25DA76AF0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25DA76CCC(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25DA76CCC((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25DA76AF0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25DA7A4D0();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_25DA76C64(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25DA7A640();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25DA7A690();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25DA7A670();
  __break(1u);
  return result;
}

void *sub_25DA76C64(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A60);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25DA76CCC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A60);
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
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25DA76E7C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25DA76DA4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25DA76DA4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25DA7A690();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25DA76E7C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25DA7A690();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_25DA76F0C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t type metadata accessor for SiriReaderFlowProvider()
{
  return self;
}

uint64_t sub_25DA76F40(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A58);
  uint64_t result = sub_25DA7A630();
  uint64_t v3 = result;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    unint64_t v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    sub_25DA7A740();
    swift_bridgeObjectRetain();
    sub_25DA7A4C0();
    uint64_t result = sub_25DA7A760();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *(void *)(v3 + 48);
      uint64_t v15 = (void *)(v14 + 16 * v10);
      BOOL v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (uint64_t result = sub_25DA7A720(), (result & 1) != 0))
      {
LABEL_11:
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      uint64_t v17 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v17;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          uint64_t result = sub_25DA7A720();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_11;
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    uint64_t v20 = (void *)(*(void *)(v3 + 48) + 16 * v10);
    void *v20 = v8;
    v20[1] = v7;
    uint64_t v21 = *(void *)(v3 + 16);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_27;
    }
    *(void *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

size_t sub_25DA77110(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25DA77130(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_25DA77130(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6A48);
  uint64_t v10 = *(void *)(sub_25DA7A420() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_25DA7A420() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_25DA7646C(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25DA7659C(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_25DA772D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ReaderNLv3Intent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DA7732C(void *a1)
{
  id v2 = objc_msgSend(a1, sel_languageCode);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25DA7A4A0();

  return v3;
}

uint64_t sub_25DA7739C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25DA773F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25DA77438(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_16_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_1(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_31_1()
{
  return v0;
}

uint64_t sub_25DA775FC()
{
  sub_25DA77750();
  uint64_t result = sub_25DA7A5F0();
  qword_26A6A74F8 = result;
  return result;
}

uint64_t sub_25DA77660()
{
  uint64_t v0 = sub_25DA7A3F0();
  __swift_allocate_value_buffer(v0, qword_26A6A7500);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A6A7500);
  if (qword_26A6A62D8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26A6A74F8;
  return sub_25DA7A400();
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

unint64_t sub_25DA77750()
{
  unint64_t result = qword_26A6A6A68;
  if (!qword_26A6A6A68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A6A6A68);
  }
  return result;
}

uint64_t sub_25DA77790(uint64_t a1, uint64_t a2)
{
  return sub_25DA777A8(a1, a2, (uint64_t (*)(void))sub_25DA7405C);
}

uint64_t sub_25DA777A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3();
  uint64_t v7 = v6;
  if (v5 == ((uint64_t (*)(uint64_t))a3)(a2) && v7 == v8) {
    char v10 = 1;
  }
  else {
    char v10 = sub_25DA7A720();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_25DA7783C(char a1)
{
  return sub_25DA7A760();
}

uint64_t sub_25DA778A0(uint64_t a1, char a2)
{
  sub_25DA77DA4(a2);
  sub_25DA7A4C0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25DA778F4(uint64_t a1, char a2)
{
  return sub_25DA7A760();
}

uint64_t ReaderNLv3Intent.init(intent:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25DA7A320();
  OUTLINED_FUNCTION_9();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);

  return v6(a2, a1, v4);
}

uint64_t ReaderNLv3Intent.read.getter()
{
  if (qword_26A6A62E8 != -1) {
    swift_once();
  }
  type metadata accessor for ReaderNLv3Intent();
  uint64_t v0 = sub_25DA78BE8(&qword_26A6A6A80);
  uint64_t v1 = OUTLINED_FUNCTION_0_0(v0);
  char v9 = OUTLINED_FUNCTION_1_1(v1, v2, v3, v4, v5, v6, v7, v8, v15, v16, SWORD2(v16), SBYTE6(v16), HIBYTE(v16));
  if (v11)
  {
    char v10 = 0;
  }
  else
  {
    char v10 = 114;
    OUTLINED_FUNCTION_3_2(v9);
    if (v11) {
      BOOL v13 = v12 == 0xE400000000000000;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      swift_bridgeObjectRelease();
      char v10 = 1;
    }
    else
    {
      sub_25DA7A720();
      OUTLINED_FUNCTION_2_2();
    }
  }
  return v10 & 1;
}

uint64_t sub_25DA77AA4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6AB0);
  swift_allocObject();
  uint64_t result = sub_25DA7A1D0();
  qword_26A6A6A70 = result;
  return result;
}

uint64_t sub_25DA77B04()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6AA8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25DA7B230;
  if (qword_26A6A62E8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26A6A6A70;
  *(void *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6AB0);
  *(void *)(v0 + 64) = sub_25DA78E44(&qword_26A6A6AB8, &qword_26A6A6AB0);
  *(void *)(v0 + 32) = v1;
  sub_25DA7A1C0();
  swift_allocObject();
  swift_retain();
  uint64_t result = sub_25DA7A1B0();
  qword_26A6A6A78 = result;
  return result;
}

uint64_t ReaderNLv3Intent.intent.getter@<X0>(uint64_t a1@<X8>)
{
  sub_25DA7A320();
  OUTLINED_FUNCTION_9();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v5(a1, v1, v3);
}

uint64_t ReaderNLv3Intent.intent.setter(uint64_t a1)
{
  sub_25DA7A320();
  OUTLINED_FUNCTION_9();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);

  return v5(v1, a1, v3);
}

uint64_t (*ReaderNLv3Intent.intent.modify())()
{
  return nullsub_1;
}

uint64_t ReaderNLv3Intent.domainOntologyNode.getter()
{
  if (qword_26A6A62F0 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_25DA77D4C()
{
  unint64_t v0 = sub_25DA7A6A0();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

void *sub_25DA77D98()
{
  return &unk_270A96B98;
}

uint64_t sub_25DA77DA4(char a1)
{
  return *(void *)&aRead_1[8 * a1];
}

uint64_t sub_25DA77DC4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25DA777A8(*a1, *a2, (uint64_t (*)(void))sub_25DA77DA4) & 1;
}

uint64_t sub_25DA77DFC()
{
  return sub_25DA7783C(*v0);
}

uint64_t sub_25DA77E04(uint64_t a1)
{
  return sub_25DA778A0(a1, *v1);
}

uint64_t sub_25DA77E0C(uint64_t a1)
{
  return sub_25DA778F4(a1, *v1);
}

uint64_t sub_25DA77E14@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25DA77D4C();
  *a1 = result;
  return result;
}

uint64_t sub_25DA77E44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25DA77DA4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t type metadata accessor for ReaderNLv3Intent()
{
  uint64_t result = qword_26A6A6A90;
  if (!qword_26A6A6A90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_25DA77EB8@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_25DA77D98();
  *a1 = result;
  return result;
}

uint64_t sub_25DA77EE0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25DA78F28();
  unint64_t v5 = sub_25DA78F74();
  unint64_t v6 = sub_25DA78FC0();

  return MEMORY[0x270F6DF80](a1, a2, v4, v5, v6);
}

uint64_t ReaderNLv3Intent.continue.getter()
{
  if (qword_26A6A62E8 != -1) {
    swift_once();
  }
  type metadata accessor for ReaderNLv3Intent();
  uint64_t v0 = sub_25DA78BE8(&qword_26A6A6A80);
  uint64_t v1 = OUTLINED_FUNCTION_0_0(v0);
  char v9 = OUTLINED_FUNCTION_1_1(v1, v2, v3, v4, v5, v6, v7, v8, v15, v16, SWORD2(v16), SBYTE6(v16), HIBYTE(v16));
  if (v11)
  {
    char v10 = 0;
  }
  else
  {
    char v10 = 99;
    OUTLINED_FUNCTION_3_2(v9);
    if (v11) {
      BOOL v13 = v12 == 0xE800000000000000;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      swift_bridgeObjectRelease();
      char v10 = 1;
    }
    else
    {
      sub_25DA7A720();
      OUTLINED_FUNCTION_2_2();
    }
  }
  return v10 & 1;
}

uint64_t ReaderNLv3Intent.goto.getter()
{
  if (qword_26A6A62E8 != -1) {
    swift_once();
  }
  type metadata accessor for ReaderNLv3Intent();
  uint64_t v0 = sub_25DA78BE8(&qword_26A6A6A80);
  uint64_t v1 = OUTLINED_FUNCTION_0_0(v0);
  char v9 = OUTLINED_FUNCTION_1_1(v1, v2, v3, v4, v5, v6, v7, v8, v15, v16, SWORD2(v16), SBYTE6(v16), HIBYTE(v16));
  if (v11)
  {
    char v10 = 0;
  }
  else
  {
    char v10 = 103;
    OUTLINED_FUNCTION_3_2(v9);
    if (v11) {
      BOOL v13 = v12 == 0xE400000000000000;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      swift_bridgeObjectRelease();
      char v10 = 1;
    }
    else
    {
      sub_25DA7A720();
      OUTLINED_FUNCTION_2_2();
    }
  }
  return v10 & 1;
}

uint64_t ReaderNLv3Intent.inquire.getter()
{
  if (qword_26A6A62E8 != -1) {
    swift_once();
  }
  type metadata accessor for ReaderNLv3Intent();
  uint64_t v0 = sub_25DA78BE8(&qword_26A6A6A80);
  uint64_t v1 = OUTLINED_FUNCTION_0_0(v0);
  char v9 = OUTLINED_FUNCTION_1_1(v1, v2, v3, v4, v5, v6, v7, v8, v15, v16, SWORD2(v16), SBYTE6(v16), HIBYTE(v16));
  if (v11)
  {
    char v10 = 0;
  }
  else
  {
    char v10 = 105;
    OUTLINED_FUNCTION_3_2(v9);
    if (v11) {
      BOOL v13 = v12 == 0xE700000000000000;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      swift_bridgeObjectRelease();
      char v10 = 1;
    }
    else
    {
      sub_25DA7A720();
      OUTLINED_FUNCTION_2_2();
    }
  }
  return v10 & 1;
}

uint64_t ReaderNLv3Intent.select.getter()
{
  if (qword_26A6A62E8 != -1) {
    swift_once();
  }
  type metadata accessor for ReaderNLv3Intent();
  uint64_t v0 = sub_25DA78BE8(&qword_26A6A6A80);
  uint64_t v1 = OUTLINED_FUNCTION_0_0(v0);
  char v9 = OUTLINED_FUNCTION_1_1(v1, v2, v3, v4, v5, v6, v7, v8, v15, v16, SWORD2(v16), SBYTE6(v16), HIBYTE(v16));
  if (v11)
  {
    char v10 = 0;
  }
  else
  {
    char v10 = 115;
    OUTLINED_FUNCTION_3_2(v9);
    if (v11) {
      BOOL v13 = v12 == 0xE600000000000000;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      swift_bridgeObjectRelease();
      char v10 = 1;
    }
    else
    {
      sub_25DA7A720();
      OUTLINED_FUNCTION_2_2();
    }
  }
  return v10 & 1;
}

uint64_t ReaderNLv3Intent.skipBackward.getter()
{
  if (qword_26A6A62E8 != -1) {
    swift_once();
  }
  type metadata accessor for ReaderNLv3Intent();
  uint64_t v0 = sub_25DA78BE8(&qword_26A6A6A80);
  uint64_t v1 = OUTLINED_FUNCTION_0_0(v0);
  char v9 = OUTLINED_FUNCTION_1_1(v1, v2, v3, v4, v5, v6, v7, v8, v15, v16, SWORD2(v16), SBYTE6(v16), HIBYTE(v16));
  if (v13)
  {
    char v10 = 0;
  }
  else
  {
    char v10 = 119;
    uint64_t v11 = sub_25DA77DA4(v9);
    BOOL v13 = v11 == 0x6B63614270696B73 && v12 == 0xEC00000064726177;
    if (v13)
    {
      swift_bridgeObjectRelease();
      char v10 = 1;
    }
    else
    {
      sub_25DA7A720();
      OUTLINED_FUNCTION_2_2();
    }
  }
  return v10 & 1;
}

uint64_t ReaderNLv3Intent.skipForward.getter()
{
  if (qword_26A6A62E8 != -1) {
    swift_once();
  }
  type metadata accessor for ReaderNLv3Intent();
  uint64_t v0 = sub_25DA78BE8(&qword_26A6A6A80);
  uint64_t v1 = OUTLINED_FUNCTION_0_0(v0);
  char v9 = OUTLINED_FUNCTION_1_1(v1, v2, v3, v4, v5, v6, v7, v8, v15, v16, SWORD2(v16), SBYTE6(v16), HIBYTE(v16));
  if (v13)
  {
    char v10 = 0;
  }
  else
  {
    char v10 = 97;
    uint64_t v11 = sub_25DA77DA4(v9);
    BOOL v13 = v11 == 0x77726F4670696B73 && v12 == 0xEB00000000647261;
    if (v13)
    {
      swift_bridgeObjectRelease();
      char v10 = 1;
    }
    else
    {
      sub_25DA7A720();
      OUTLINED_FUNCTION_2_2();
    }
  }
  return v10 & 1;
}

uint64_t ReaderNLv3Intent.stop.getter()
{
  if (qword_26A6A62E8 != -1) {
    swift_once();
  }
  type metadata accessor for ReaderNLv3Intent();
  uint64_t v0 = sub_25DA78BE8(&qword_26A6A6A80);
  uint64_t v1 = OUTLINED_FUNCTION_0_0(v0);
  char v9 = OUTLINED_FUNCTION_1_1(v1, v2, v3, v4, v5, v6, v7, v8, v15, v16, SWORD2(v16), SBYTE6(v16), HIBYTE(v16));
  if (v11)
  {
    char v10 = 0;
  }
  else
  {
    char v10 = 115;
    OUTLINED_FUNCTION_3_2(v9);
    if (v11) {
      BOOL v13 = v12 == 0xE400000000000000;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      swift_bridgeObjectRelease();
      char v10 = 1;
    }
    else
    {
      sub_25DA7A720();
      OUTLINED_FUNCTION_2_2();
    }
  }
  return v10 & 1;
}

uint64_t sub_25DA78640()
{
  return sub_25DA78BE8(&qword_26A6A6A80);
}

uint64_t sub_25DA78674()
{
  return sub_25DA78BE8(&qword_26A6A6A88);
}

uint64_t sub_25DA786A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25DA7A320();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_25DA78710()
{
  return ReaderNLv3Intent.domainOntologyNode.getter();
}

uint64_t sub_25DA78728(uint64_t a1)
{
  uint64_t v2 = sub_25DA78BE8(&qword_26A6A6AA0);

  return MEMORY[0x270F6CA70](a1, v2);
}

uint64_t sub_25DA78790(uint64_t a1)
{
  uint64_t v2 = sub_25DA78BE8(&qword_26A6A6AA0);

  return MEMORY[0x270F6CA60](a1, v2);
}

uint64_t sub_25DA787E8(uint64_t a1)
{
  uint64_t v2 = sub_25DA78BE8(&qword_26A6A6AA0);

  return MEMORY[0x270F6CA68](a1, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for ReaderNLv3Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DA7A320();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for ReaderNLv3Intent(uint64_t a1)
{
  uint64_t v2 = sub_25DA7A320();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for ReaderNLv3Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DA7A320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for ReaderNLv3Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DA7A320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for ReaderNLv3Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DA7A320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for ReaderNLv3Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DA7A320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReaderNLv3Intent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DA78AB4);
}

uint64_t sub_25DA78AB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DA7A320();

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ReaderNLv3Intent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DA78B10);
}

uint64_t sub_25DA78B10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DA7A320();

  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t sub_25DA78B5C()
{
  uint64_t result = sub_25DA7A320();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25DA78BE8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ReaderNLv3Intent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ReaderNLv3Intent.Verb(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ReaderNLv3Intent.Verb(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x25DA78D80);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReaderNLv3Intent.Verb()
{
  return &type metadata for ReaderNLv3Intent.Verb;
}

unint64_t sub_25DA78DBC()
{
  unint64_t result = qword_26A6A6AC0;
  if (!qword_26A6A6AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A6AC0);
  }
  return result;
}

uint64_t sub_25DA78E08()
{
  return sub_25DA78E44(&qword_26A6A6AC8, &qword_26A6A6AD0);
}

uint64_t sub_25DA78E44(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_25DA78E8C()
{
  unint64_t result = qword_26A6A6AD8;
  if (!qword_26A6A6AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A6AD8);
  }
  return result;
}

unint64_t sub_25DA78EDC()
{
  unint64_t result = qword_26A6A6AE0;
  if (!qword_26A6A6AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A6AE0);
  }
  return result;
}

unint64_t sub_25DA78F28()
{
  unint64_t result = qword_26A6A6AE8;
  if (!qword_26A6A6AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A6AE8);
  }
  return result;
}

unint64_t sub_25DA78F74()
{
  unint64_t result = qword_26A6A6AF0;
  if (!qword_26A6A6AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A6AF0);
  }
  return result;
}

unint64_t sub_25DA78FC0()
{
  unint64_t result = qword_26A6A6AF8;
  if (!qword_26A6A6AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A6AF8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1)
{
  return MEMORY[0x270F6CEB8](v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, unsigned __int8 a13)
{
  return a13;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_2(char a1)
{
  return sub_25DA77DA4(a1);
}

uint64_t ReaderNLv4Intent.init(userDialogAct:)(uint64_t a1)
{
  sub_25DA7A3F0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3_1();
  uint64_t v8 = v7 - v6;
  self;
  char v9 = (void *)swift_dynamicCastObjCClass();
  swift_unknownObjectRetain();
  if (!v9
    || (id v10 = objc_msgSend(v9, sel_task),
        uint64_t v11 = sub_25DA7A5E0(),
        v10,
        !v11))
  {
    if (qword_26A6A62E0 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v1, (uint64_t)qword_26A6A7500);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v8, v16, v1);
    unint64_t v17 = sub_25DA7A3E0();
    os_log_type_t v18 = sub_25DA7A5D0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_25DA66000, v17, v18, "Unable to convert USO serialized graph to USO graph Siri NL, no initial task", v19, 2u);
      MEMORY[0x2611BB6F0](v19, -1, -1);
    }

    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v1);
    return a1;
  }
  uint64_t v12 = swift_retain();
  unint64_t v13 = MEMORY[0x2611BACE0](v12);
  unint64_t v14 = v13;
  if (v13 >> 62)
  {
    uint64_t result = sub_25DA7A680();
    if (!result) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t result = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!result) {
      goto LABEL_8;
    }
  }
  if ((v14 & 0xC000000000000001) != 0)
  {
    MEMORY[0x2611BB120](0, v14);
    goto LABEL_8;
  }
  if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_8:
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_release();
    return a1;
  }
  __break(1u);
  return result;
}

uint64_t ReaderNLv4Intent.shouldStartScreenReader.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6B00);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  id v10 = (char *)&v41 - v9;
  sub_25DA7A300();
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3_1();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6B08);
  MEMORY[0x270FA5388](v17 - 8);
  OUTLINED_FUNCTION_3_1();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6B10);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v24 = (char *)&v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v41 - v25;
  if (!a3) {
    goto LABEL_11;
  }
  uint64_t v27 = sub_25DA7A310();
  unint64_t v28 = sub_25DA79A64(0x69746E4572657375, 0xEC00000073656974, v27);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v28) {
    goto LABEL_11;
  }
  uint64_t v42 = v12;
  if (!(v28 >> 62))
  {
    if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    uint64_t v12 = v42;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v40 = sub_25DA7A680();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v40) {
    goto LABEL_28;
  }
LABEL_5:
  if ((v28 & 0xC000000000000001) != 0)
  {
    uint64_t v30 = MEMORY[0x2611BB120](0, v28);
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t v12 = v42;
    if (v30)
    {
      swift_retain();
      sub_25DA7A330();
      swift_release();
      uint64_t v31 = sub_25DA7A2D0();
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v31);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v31);
      uint64_t v32 = sub_25DA7A2E0();
      sub_25DA7739C((uint64_t)v8, &qword_26A6A6B00);
      sub_25DA7739C((uint64_t)v10, &qword_26A6A6B00);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v16, v3);
      sub_25DA79908(v32, v20);
      swift_bridgeObjectRelease();
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6B18);
      if (__swift_getEnumTagSinglePayload(v20, 1, v33) != 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v26, v20 + *(int *)(v33 + 48), v3);
        __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v3);
        sub_25DA7A2C0();
        OUTLINED_FUNCTION_9();
        (*(void (**)(uint64_t))(v39 + 8))(v20);
LABEL_12:
        sub_25DA6FCAC((uint64_t)v26, (uint64_t)v24, &qword_26A6A6B10);
        if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v3) == 1)
        {
          sub_25DA7739C((uint64_t)v24, &qword_26A6A6B10);
        }
        else
        {
          uint64_t v34 = (void *)sub_25DA7A2F0();
          (*(void (**)(char *, uint64_t))(v12 + 8))(v24, v3);
          if (v34[2])
          {
            uint64_t v36 = v34[4];
            uint64_t v35 = v34[5];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            if (v35)
            {
              if (v36 == 0x6E6565726373 && v35 == 0xE600000000000000) {
                char v38 = 1;
              }
              else {
                char v38 = sub_25DA7A720();
              }
              swift_release();
              sub_25DA7739C((uint64_t)v26, &qword_26A6A6B10);
              swift_bridgeObjectRelease();
              return v38 & 1;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }
        }
        swift_release();
        sub_25DA7739C((uint64_t)v26, &qword_26A6A6B10);
        char v38 = 0;
        return v38 & 1;
      }
      sub_25DA7739C(v20, &qword_26A6A6B08);
    }
LABEL_11:
    __swift_storeEnumTagSinglePayload((uint64_t)v26, 1, 1, v3);
    goto LABEL_12;
  }
  if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v30 = *(void *)(v28 + 32);
    swift_retain();
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t ReaderNLv4Intent.read.getter()
{
  sub_25DA7A230();
  sub_25DA6FCAC((uint64_t)v4, (uint64_t)v2, (uint64_t *)&unk_26A6A6B20);
  if (v3)
  {
    sub_25DA7A250();
    if (swift_dynamicCast())
    {
      swift_release();
      sub_25DA79AA8((uint64_t)v4, (uint64_t)v2);
      sub_25DA7739C((uint64_t)v2, (uint64_t *)&unk_26A6A6B20);
      return 1;
    }
  }
  else
  {
    sub_25DA7739C((uint64_t)v2, (uint64_t *)&unk_26A6A6B20);
  }
  sub_25DA79AA8((uint64_t)v4, (uint64_t)v2);
  sub_25DA79AA8((uint64_t)v2, (uint64_t)v1);
  if (v1[3])
  {
    sub_25DA7A280();
    if (swift_dynamicCast())
    {
      swift_release();
      return 1;
    }
  }
  else
  {
    sub_25DA7739C((uint64_t)v1, (uint64_t *)&unk_26A6A6B20);
  }
  return 0;
}

uint64_t sub_25DA79908@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A6B18);
  uint64_t v6 = v5;
  if (v4)
  {
    sub_25DA6FCAC(a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), a2, &qword_26A6A6B18);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

uint64_t sub_25DA799BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_25DA7A420();
  uint64_t v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

uint64_t sub_25DA79A64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_25DA79D14(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_25DA79AA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6A6B20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for ReaderNLv4Intent()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_release();
}

void *_s17SiriReaderIntents16ReaderNLv4IntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ReaderNLv4Intent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ReaderNLv4Intent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ReaderNLv4Intent(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ReaderNLv4Intent(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReaderNLv4Intent()
{
  return &type metadata for ReaderNLv4Intent;
}

unint64_t sub_25DA79D14(uint64_t a1, uint64_t a2)
{
  sub_25DA7A740();
  sub_25DA7A4C0();
  uint64_t v4 = sub_25DA7A760();

  return sub_25DA79D8C(a1, a2, v4);
}

unint64_t sub_25DA79D8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25DA7A720() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25DA7A720() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25DA79E90()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25DA79EA0()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_25DA79EB0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25DA79EC0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25DA79ED0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25DA79EE0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25DA79EF0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25DA79F00()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_25DA79F10()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25DA79F20()
{
  return MEMORY[0x270F663D8]();
}

uint64_t sub_25DA79F30()
{
  return MEMORY[0x270F663E0]();
}

uint64_t sub_25DA79F40()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t sub_25DA79F50()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t sub_25DA79F60()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_25DA79F90()
{
  return MEMORY[0x270F66CF8]();
}

uint64_t sub_25DA79FA0()
{
  return MEMORY[0x270F66D18]();
}

uint64_t sub_25DA79FB0()
{
  return MEMORY[0x270F66DA0]();
}

uint64_t sub_25DA79FC0()
{
  return MEMORY[0x270F66DB8]();
}

uint64_t sub_25DA79FD0()
{
  return MEMORY[0x270F66E28]();
}

uint64_t sub_25DA79FE0()
{
  return MEMORY[0x270F67010]();
}

uint64_t sub_25DA79FF0()
{
  return MEMORY[0x270F67030]();
}

uint64_t sub_25DA7A000()
{
  return MEMORY[0x270F67068]();
}

uint64_t sub_25DA7A010()
{
  return MEMORY[0x270F670A0]();
}

uint64_t sub_25DA7A020()
{
  return MEMORY[0x270F67188]();
}

uint64_t sub_25DA7A030()
{
  return MEMORY[0x270F671A8]();
}

uint64_t sub_25DA7A040()
{
  return MEMORY[0x270F671D8]();
}

uint64_t sub_25DA7A050()
{
  return MEMORY[0x270F671E8]();
}

uint64_t sub_25DA7A060()
{
  return MEMORY[0x270F673A8]();
}

uint64_t sub_25DA7A080()
{
  return MEMORY[0x270F67678]();
}

uint64_t sub_25DA7A090()
{
  return MEMORY[0x270F67718]();
}

uint64_t sub_25DA7A0A0()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_25DA7A0B0()
{
  return MEMORY[0x270F67828]();
}

uint64_t sub_25DA7A0C0()
{
  return MEMORY[0x270F67930]();
}

uint64_t sub_25DA7A0D0()
{
  return MEMORY[0x270F67AF8]();
}

uint64_t sub_25DA7A0E0()
{
  return MEMORY[0x270F67B08]();
}

uint64_t sub_25DA7A0F0()
{
  return MEMORY[0x270F67B18]();
}

uint64_t sub_25DA7A100()
{
  return MEMORY[0x270F67CD8]();
}

uint64_t sub_25DA7A120()
{
  return MEMORY[0x270F67D58]();
}

uint64_t sub_25DA7A130()
{
  return MEMORY[0x270F68230]();
}

uint64_t sub_25DA7A140()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_25DA7A150()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_25DA7A160()
{
  return MEMORY[0x270F68378]();
}

uint64_t sub_25DA7A170()
{
  return MEMORY[0x270F68388]();
}

uint64_t sub_25DA7A180()
{
  return MEMORY[0x270F683B8]();
}

uint64_t sub_25DA7A190()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_25DA7A1A0()
{
  return MEMORY[0x270F6BB20]();
}

uint64_t sub_25DA7A1B0()
{
  return MEMORY[0x270F6C108]();
}

uint64_t sub_25DA7A1C0()
{
  return MEMORY[0x270F6C110]();
}

uint64_t sub_25DA7A1D0()
{
  return MEMORY[0x270F6C190]();
}

uint64_t sub_25DA7A210()
{
  return MEMORY[0x270F6CDA8]();
}

uint64_t sub_25DA7A230()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_25DA7A240()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_25DA7A250()
{
  return MEMORY[0x270F6D360]();
}

uint64_t sub_25DA7A260()
{
  return MEMORY[0x270F6D530]();
}

uint64_t sub_25DA7A270()
{
  return MEMORY[0x270F6D538]();
}

uint64_t sub_25DA7A280()
{
  return MEMORY[0x270F6DA90]();
}

uint64_t sub_25DA7A2A0()
{
  return MEMORY[0x270F6E288]();
}

uint64_t sub_25DA7A2B0()
{
  return MEMORY[0x270F6E290]();
}

uint64_t sub_25DA7A2C0()
{
  return MEMORY[0x270F6F170]();
}

uint64_t sub_25DA7A2D0()
{
  return MEMORY[0x270F6F180]();
}

uint64_t sub_25DA7A2E0()
{
  return MEMORY[0x270F6F1B0]();
}

uint64_t sub_25DA7A2F0()
{
  return MEMORY[0x270F6F1B8]();
}

uint64_t sub_25DA7A300()
{
  return MEMORY[0x270F6F1C8]();
}

uint64_t sub_25DA7A310()
{
  return MEMORY[0x270F6F350]();
}

uint64_t sub_25DA7A320()
{
  return MEMORY[0x270F6F408]();
}

uint64_t sub_25DA7A330()
{
  return MEMORY[0x270F6F448]();
}

uint64_t sub_25DA7A340()
{
  return MEMORY[0x270F64E48]();
}

uint64_t sub_25DA7A350()
{
  return MEMORY[0x270F64EA0]();
}

uint64_t sub_25DA7A360()
{
  return MEMORY[0x270F64EA8]();
}

uint64_t sub_25DA7A370()
{
  return MEMORY[0x270F64EC8]();
}

uint64_t sub_25DA7A380()
{
  return MEMORY[0x270F65158]();
}

uint64_t sub_25DA7A390()
{
  return MEMORY[0x270F65180]();
}

uint64_t sub_25DA7A3A0()
{
  return MEMORY[0x270F706C8]();
}

uint64_t sub_25DA7A3B0()
{
  return MEMORY[0x270F706F0]();
}

uint64_t sub_25DA7A3C0()
{
  return MEMORY[0x270F706F8]();
}

uint64_t sub_25DA7A3D0()
{
  return MEMORY[0x270F70710]();
}

uint64_t sub_25DA7A3E0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25DA7A3F0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25DA7A400()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25DA7A410()
{
  return MEMORY[0x270F70760]();
}

uint64_t sub_25DA7A420()
{
  return MEMORY[0x270F70768]();
}

uint64_t sub_25DA7A430()
{
  return MEMORY[0x270F707C0]();
}

uint64_t sub_25DA7A440()
{
  return MEMORY[0x270F707E0]();
}

uint64_t sub_25DA7A450()
{
  return MEMORY[0x270F70A30]();
}

uint64_t sub_25DA7A460()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t sub_25DA7A470()
{
  return MEMORY[0x270F70AC8]();
}

uint64_t sub_25DA7A480()
{
  return MEMORY[0x270F70AD0]();
}

uint64_t sub_25DA7A490()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25DA7A4A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25DA7A4B0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25DA7A4C0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25DA7A4D0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25DA7A4E0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25DA7A4F0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25DA7A500()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25DA7A510()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25DA7A520()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25DA7A530()
{
  return MEMORY[0x270FA20C0]();
}

uint64_t sub_25DA7A540()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_25DA7A550()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_25DA7A560()
{
  return MEMORY[0x270FA20E8]();
}

uint64_t sub_25DA7A570()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_25DA7A590()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_25DA7A5A0()
{
  return MEMORY[0x270F68430]();
}

uint64_t sub_25DA7A5B0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25DA7A5C0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25DA7A5D0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25DA7A5E0()
{
  return MEMORY[0x270F6F4D8]();
}

uint64_t sub_25DA7A5F0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25DA7A600()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25DA7A610()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25DA7A620()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25DA7A630()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25DA7A640()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25DA7A650()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25DA7A660()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25DA7A670()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25DA7A680()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25DA7A690()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25DA7A6A0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25DA7A6B0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25DA7A6C0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25DA7A6D0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25DA7A6E0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25DA7A6F0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25DA7A700()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25DA7A710()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25DA7A720()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25DA7A730()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25DA7A740()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25DA7A750()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25DA7A760()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25DA7A770()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25DA7A780()
{
  return MEMORY[0x270F9FD98]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}