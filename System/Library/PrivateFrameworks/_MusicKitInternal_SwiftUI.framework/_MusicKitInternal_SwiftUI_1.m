uint64_t sub_22D677AA4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v17;

  v4 = v1[4];
  v3 = v1[5];
  v5 = v1[6];
  v6 = v1[7];
  v8 = v1[8];
  v7 = v1[9];
  v2[2] = v4;
  v2[3] = v3;
  v2[4] = v5;
  v2[5] = v6;
  v2[6] = v8;
  v2[7] = v7;
  v9 = _s9HItemCellVMa();
  OUTLINED_FUNCTION_1_0(v9);
  v11 = v1[2];
  v12 = v1[3];
  v13 = (uint64_t)v1 + ((*(unsigned __int8 *)(v10 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  v14 = (void *)swift_task_alloc();
  v2[8] = v14;
  *v14 = v2;
  v14[1] = sub_22D677BC0;
  return sub_22D67601C(a1, v11, v12, v13, v4, v3, v5, v6);
}

uint64_t sub_22D677BC0()
{
  OUTLINED_FUNCTION_4();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22D677C90()
{
  return sub_22D678524((uint64_t (*)(void, void, void, void, void, void, void))sub_22D672994);
}

unint64_t sub_22D677CA8()
{
  unint64_t result = qword_26857D410;
  if (!qword_26857D410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D410);
  }
  return result;
}

unint64_t sub_22D677CF4()
{
  unint64_t result = qword_26857D418;
  if (!qword_26857D418)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D3F8);
    sub_22D677E20();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D470);
    sub_22D6CB0D8();
    sub_22D60539C((uint64_t)&unk_26857D478);
    sub_22D67960C((uint64_t)&qword_26857AF48);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D418);
  }
  return result;
}

unint64_t sub_22D677E20()
{
  unint64_t result = qword_26857D420;
  if (!qword_26857D420)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D428);
    sub_22D677E9C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D420);
  }
  return result;
}

unint64_t sub_22D677E9C()
{
  unint64_t result = qword_26857D430;
  if (!qword_26857D430)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D438);
    sub_22D677F58((uint64_t)&unk_26857D440);
    sub_22D677F58((uint64_t)&unk_26857D460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D430);
  }
  return result;
}

unint64_t sub_22D677F58(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_50(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    sub_22D60F64C();
    sub_22D60539C(v5);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_22D677FF8()
{
  unint64_t result = qword_26857D488;
  if (!qword_26857D488)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D408);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D3F8);
    sub_22D6CB578();
    sub_22D677CF4();
    sub_22D67960C((uint64_t)&qword_26857B498);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D488);
  }
  return result;
}

uint64_t sub_22D6780FC()
{
  return sub_22D678404((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22D676C50);
}

uint64_t sub_22D678114()
{
  return sub_22D678524((uint64_t (*)(void, void, void, void, void, void, void))sub_22D677344);
}

unint64_t sub_22D67812C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_50(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t _s9HItemCellV30AccessoryButtonImageDescriptorVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D6781C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_22D6CB2C8();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_22D6781F4()
{
  return sub_22D6CB2D8();
}

uint64_t objectdestroyTm_5()
{
  long long v16 = *(_OWORD *)(v1 + 16);
  _s9HItemCellVMa();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_11_6(v3, v4, v5, v6, v7, v8, v9, v10, v16);
  OUTLINED_FUNCTION_22();
  v11();
  uint64_t v12 = v2 + v0[17];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v12 + 24));
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_24_3();
  swift_release();
  OUTLINED_FUNCTION_24_3();
  uint64_t v13 = v2 + v0[28];
  if (*(unsigned char *)(v13 + 40))
  {
    if (*(void *)(v13 + 24)) {
      __swift_destroy_boxed_opaque_existential_1(v13);
    }
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_19_3();
  __swift_instantiateConcreteTypeFromMangledName(qword_26857D320);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D6CB078();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_22();
    v14();
  }
  else
  {
    swift_release();
  }
  if (*(void *)(v2 + v0[31] + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D6783EC()
{
  return sub_22D678404((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22D66D9FC);
}

uint64_t sub_22D678404(uint64_t (*a1)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v7 = v1[7];
  uint64_t v8 = _s9HItemCellVMa();
  OUTLINED_FUNCTION_1_0(v8);
  uint64_t v10 = (char *)v1 + ((*(unsigned __int8 *)(v9 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1(v10, v2, v3, v4, v5, v6, v7);
}

uint64_t sub_22D6784AC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D6784E4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_22D67850C()
{
  return sub_22D678524((uint64_t (*)(void, void, void, void, void, void, void))sub_22D673324);
}

uint64_t sub_22D678524(uint64_t (*a1)(void, void, void, void, void, void, void))
{
  return a1(v1[8], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_22D678540(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_22D604860(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

unint64_t sub_22D678590(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_50(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_22D678604()
{
  unint64_t result = qword_26857D4F0;
  if (!qword_26857D4F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D4F8);
    sub_22D678678();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D4F0);
  }
  return result;
}

unint64_t sub_22D678678()
{
  unint64_t result = qword_26857D500;
  if (!qword_26857D500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D500);
  }
  return result;
}

uint64_t sub_22D6786C4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_22D604A88(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22D678714(uint64_t a1, uint64_t a2, int a3)
{
  if (BYTE2(a3) != 255) {
    return sub_22D67872C();
  }
  return result;
}

uint64_t sub_22D67872C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D678748()
{
  return 8;
}

uint64_t sub_22D678754()
{
  return swift_release();
}

uint64_t sub_22D67875C(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_22D678770(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_22D67877C()
{
  uint64_t result = sub_22D6CBFD8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22D678828(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    uint64_t v8 = *(int *)(a3 + 72);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_22D6CBFD8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    v12(v9, v10, v11);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 76)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 76));
  }
  swift_retain();
  return v4;
}

uint64_t sub_22D67893C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 72);
  uint64_t v5 = sub_22D6CBFD8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  return swift_release();
}

void *sub_22D6789D0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 72);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22D6CBFD8();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  v11(v8, v9, v10);
  *(void *)((char *)a1 + *(int *)(a3 + 76)) = *(void *)((char *)a2 + *(int *)(a3 + 76));
  swift_retain();
  return a1;
}

void *sub_22D678A98(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 72);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22D6CBFD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 76)) = *(void *)((char *)a2 + *(int *)(a3 + 76));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22D678B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 72);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_22D6CBFD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(void *)(a1 + *(int *)(a3 + 76)) = *(void *)(a2 + *(int *)(a3 + 76));
  return a1;
}

void *sub_22D678C10(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_release();
  uint64_t v7 = *(int *)(a3 + 72);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22D6CBFD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)((char *)a1 + *(int *)(a3 + 76)) = *(void *)((char *)a2 + *(int *)(a3 + 76));
  swift_release();
  return a1;
}

uint64_t sub_22D678CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D678CDC);
}

uint64_t sub_22D678CDC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_22D6CBFD8();
    uint64_t v9 = a1 + *(int *)(a3 + 72);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22D678D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D678D78);
}

uint64_t sub_22D678D78(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22D6CBFD8();
    uint64_t v8 = v5 + *(int *)(a4 + 72);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t _s9HItemCellV9ConstantsVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D678E10()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D6795D4()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D6795F0()
{
  return swift_getWitnessTable();
}

unint64_t sub_22D67960C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_50(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  *(void *)(v3 - 184) = *(void *)(v0 + 336);
  *(void *)(v3 - 176) = v2;
  *(void *)(v3 - 168) = *(void *)(v0 + 328);
  *(void *)(v3 - 160) = v1;
  return v3 - 184;
}

uint64_t OUTLINED_FUNCTION_16_4()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_17_2()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_19_3()
{
  return sub_22D5DBA20(*(void *)(v1 + *(int *)(v0 + 116)), *(unsigned char *)(v1 + *(int *)(v0 + 116) + 8));
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_25_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26_3()
{
  return v0;
}

uint64_t static Artwork.LoadingError.== infix(_:_:)()
{
  return 1;
}

uint64_t Artwork.LoadingError.hash(into:)()
{
  return sub_22D6CD638();
}

uint64_t Artwork.LoadingError.hashValue.getter()
{
  return sub_22D6CD668();
}

uint64_t sub_22D6797A4()
{
  return Artwork.LoadingError.hashValue.getter();
}

uint64_t sub_22D6797BC()
{
  return Artwork.LoadingError.hash(into:)();
}

uint64_t sub_22D6797D4()
{
  return sub_22D6CD668();
}

unint64_t sub_22D679820()
{
  unint64_t result = qword_26857D620;
  if (!qword_26857D620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D620);
  }
  return result;
}

uint64_t _s12LoadingErrorOwet(unsigned int *a1, int a2)
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

unsigned char *_s12LoadingErrorOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x22D679960);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Artwork.LoadingError()
{
  return &type metadata for Artwork.LoadingError;
}

unsigned char *_s12SearchSourceOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22D679A64);
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

ValueMetadata *_s12SearchSourceOMa()
{
  return &_s12SearchSourceON;
}

uint64_t sub_22D679A9C(char a1)
{
  if (a1)
  {
    if (qword_26857AD80 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_0_10();
    OUTLINED_FUNCTION_1_6();
  }
  else
  {
    if (qword_26857AD80 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_1_6();
  }
  return sub_22D6CA058();
}

BOOL sub_22D679B88(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_22D679B94(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xE900000000000064;
  unint64_t v3 = 0x6574736567677573;
  uint64_t v4 = a1;
  unint64_t v5 = 0x6574736567677573;
  unint64_t v6 = 0xE900000000000064;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0x800000022D6D4BD0;
      unint64_t v5 = 0xD000000000000012;
      break;
    case 2:
      unint64_t v5 = 0x796C746E65636572;
      unint64_t v6 = 0xEF646579616C702DLL;
      break;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      unint64_t v5 = 0x79616C706572;
      break;
    case 4:
      unint64_t v6 = 0xE500000000000000;
      unint64_t v5 = 0x6575657571;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x800000022D6D4BD0;
      unint64_t v3 = 0xD000000000000012;
      break;
    case 2:
      OUTLINED_FUNCTION_3_8();
      break;
    case 3:
      unint64_t v2 = 0xE600000000000000;
      unint64_t v3 = 0x79616C706572;
      break;
    case 4:
      unint64_t v2 = 0xE500000000000000;
      unint64_t v3 = 0x6575657571;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_22D6CD5A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22D679D4C(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x7972617262696CLL;
  }
  else {
    uint64_t v2 = 0x676F6C61746163;
  }
  if (a2) {
    uint64_t v3 = 0x7972617262696CLL;
  }
  else {
    uint64_t v3 = 0x676F6C61746163;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_22D6CD5A8();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_22D679DCC()
{
  sub_22D6CA6F8();
  sub_22D67A4C0();
  sub_22D6CCFE8();
  sub_22D6CCFE8();
  if (v5 == v3 && v6 == v4) {
    char v1 = 1;
  }
  else {
    char v1 = sub_22D6CD5A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_22D679E80(char a1)
{
  if (a1)
  {
    if (qword_26857AD80 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_0_10();
  }
  else if (qword_26857AD80 != -1)
  {
    swift_once();
  }
  OUTLINED_FUNCTION_1_6();
  return sub_22D6CA058();
}

uint64_t sub_22D679F60(char a1)
{
  if (a1) {
    return 0x7972617262696CLL;
  }
  else {
    return 0x676F6C61746163;
  }
}

uint64_t sub_22D679F90()
{
  uint64_t v0 = sub_22D6CD4F8();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_22D679FE4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22D679F90();
  *a1 = result;
  return result;
}

uint64_t sub_22D67A014@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22D679F60(*v1);
  *a1 = result;
  a1[1] = 0xE700000000000000;
  return result;
}

uint64_t sub_22D67A044()
{
  return sub_22D6CD008();
}

uint64_t sub_22D67A0A4()
{
  return sub_22D6CCFF8();
}

uint64_t sub_22D67A0F4(char *a1, char *a2)
{
  return sub_22D679D4C(*a1, *a2);
}

uint64_t sub_22D67A100()
{
  return sub_22D67A108();
}

uint64_t sub_22D67A108()
{
  return sub_22D67A320();
}

uint64_t sub_22D67A114(char a1)
{
  return sub_22D6CD668();
}

uint64_t sub_22D67A164()
{
  return sub_22D6CD668();
}

uint64_t sub_22D67A1AC()
{
  return sub_22D67A2C0();
}

uint64_t sub_22D67A1B4()
{
  return sub_22D6CD638();
}

uint64_t sub_22D67A1DC(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 2:
      OUTLINED_FUNCTION_3_8();
      break;
    default:
      break;
  }
  sub_22D6CCF58();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D67A2C0()
{
  sub_22D6CCF58();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D67A318()
{
  return sub_22D67A320();
}

uint64_t sub_22D67A320()
{
  return sub_22D6CD668();
}

uint64_t sub_22D67A394(uint64_t a1, char a2)
{
  return sub_22D6CD668();
}

uint64_t sub_22D67A3E0()
{
  return sub_22D6CD668();
}

unint64_t sub_22D67A428()
{
  unint64_t result = qword_26857D628;
  if (!qword_26857D628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D628);
  }
  return result;
}

unint64_t sub_22D67A474()
{
  unint64_t result = qword_26857D630;
  if (!qword_26857D630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D630);
  }
  return result;
}

unint64_t sub_22D67A4C0()
{
  unint64_t result = qword_26857D638[0];
  if (!qword_26857D638[0])
  {
    sub_22D6CA6F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26857D638);
  }
  return result;
}

uint64_t sub_22D67A510@<X0>(char *a1@<X1>, uint64_t a2@<X8>)
{
  char v3 = *a1;
  uint64_t v4 = *((void *)a1 + 1);
  uint64_t v5 = *((void *)a1 + 2);
  uint64_t v6 = *((void *)a1 + 3);
  uint64_t v7 = (int *)_s14AlbumTrackCellVMa();
  uint64_t v8 = v7[10];
  if (qword_26857AD78 != -1) {
    swift_once();
  }
  uint64_t v9 = (uint64_t *)(a2 + v8);
  swift_retain();
  *uint64_t v9 = sub_22D67A648();
  v9[1] = v10;
  uint64_t v11 = (_OWORD *)(a2 + v7[11]);
  *uint64_t v11 = xmmword_22D6D1B70;
  v11[1] = xmmword_22D6D1B80;
  v11[2] = xmmword_22D6D1B90;
  v11[3] = xmmword_22D6D1BA0;
  v11[4] = xmmword_22D6D1BB0;
  sub_22D6CCAC8();
  OUTLINED_FUNCTION_7();
  uint64_t v12 = OUTLINED_FUNCTION_5_7();
  uint64_t result = v13(v12);
  uint64_t v15 = a2 + v7[9];
  *(unsigned char *)uint64_t v15 = v3;
  *(void *)(v15 + 8) = v4;
  *(void *)(v15 + 16) = v5;
  *(void *)(v15 + 24) = v6;
  return result;
}

uint64_t _s14AlbumTrackCellVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22D67A648()
{
  _s13PreviewPlayerCMa();
  sub_22D67D3B4((unint64_t *)&qword_26857B690, (void (*)(uint64_t))_s13PreviewPlayerCMa);
  return sub_22D6CB018();
}

uint64_t sub_22D67A6C4()
{
  uint64_t result = sub_22D6CCAC8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22D67A76C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_22D6CCAC8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = a3[9];
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *uint64_t v9 = *v10;
    uint64_t v11 = *((void *)v10 + 2);
    *((void *)v9 + 1) = *((void *)v10 + 1);
    *((void *)v9 + 2) = v11;
    unint64_t v12 = *((void *)v10 + 3);
    swift_bridgeObjectRetain();
    sub_22D5DB288(v12);
    *((void *)v9 + 3) = v12;
    uint64_t v13 = a3[10];
    uint64_t v14 = a3[11];
    uint64_t v15 = (uint64_t *)((char *)v4 + v13);
    long long v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    memcpy((char *)v4 + v14, (char *)a2 + v14, 0x50uLL);
  }
  swift_retain();
  return v4;
}

uint64_t sub_22D67A88C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22D6CCAC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 36);
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v5 + 24));
  return swift_release();
}

uint64_t sub_22D67A924(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22D6CCAC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
  uint64_t v10 = *(void *)(v9 + 16);
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(void *)(v8 + 16) = v10;
  unint64_t v11 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v11);
  *(void *)(v8 + 24) = v11;
  uint64_t v12 = a3[10];
  uint64_t v13 = a3[11];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  memcpy((void *)(a1 + v13), (const void *)(a2 + v13), 0x50uLL);
  swift_retain();
  return a1;
}

uint64_t sub_22D67A9F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22D6CCAC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)uint64_t v8 = *(unsigned char *)(a2 + v7);
  *(void *)(v8 + 8) = *(void *)(a2 + v7 + 8);
  *(void *)(v8 + 16) = *(void *)(a2 + v7 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v10 = *(void *)(v9 + 24);
  sub_22D5DB288(v10);
  unint64_t v11 = *(void *)(v8 + 24);
  *(void *)(v8 + 24) = v10;
  sub_22D5DB9FC(v11);
  uint64_t v12 = a3[10];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_retain();
  swift_release();
  uint64_t v15 = a3[11];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  v16[2] = v17[2];
  v16[3] = v17[3];
  v16[4] = v17[4];
  v16[5] = v17[5];
  v16[6] = v17[6];
  v16[7] = v17[7];
  v16[8] = v17[8];
  v16[9] = v17[9];
  return a1;
}

uint64_t sub_22D67AB44(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22D6CCAC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a3[10];
  uint64_t v9 = (_OWORD *)(a1 + v7);
  unint64_t v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[1];
  long long v12 = *(_OWORD *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(_OWORD *)(a1 + v8) = v12;
  memcpy((void *)(a1 + a3[11]), (const void *)(a2 + a3[11]), 0x50uLL);
  return a1;
}

uint64_t sub_22D67ABE4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22D6CCAC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)uint64_t v8 = *(unsigned char *)(a2 + v7);
  uint64_t v10 = *(void *)(a2 + v7 + 16);
  *(void *)(v8 + 8) = *(void *)(a2 + v7 + 8);
  *(void *)(v8 + 16) = v10;
  swift_bridgeObjectRelease();
  unint64_t v11 = *(void *)(v8 + 24);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  sub_22D5DB9FC(v11);
  uint64_t v12 = a3[10];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_release();
  uint64_t v17 = a3[11];
  uint64_t v18 = (_OWORD *)(a1 + v17);
  v19 = (_OWORD *)(a2 + v17);
  long long v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  long long v21 = v19[3];
  v18[2] = v19[2];
  v18[3] = v21;
  v18[4] = v19[4];
  return a1;
}

uint64_t sub_22D67ACD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D67ACE4);
}

uint64_t sub_22D67ACE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22D6CCAC8();
  OUTLINED_FUNCTION_3();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 40) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_22D67AD74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D67AD88);
}

void sub_22D67AD88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_22D6CCAC8();
  OUTLINED_FUNCTION_3();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 40) + 8) = (a2 - 1);
  }
}

uint64_t sub_22D67AE14()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_22D67AE58()
{
  uint64_t v1 = sub_22D6CCAC8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22D6CCA28();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  if ((*(unsigned int (**)(char *, uint64_t))(v2 + 88))(v4, v1) != *MEMORY[0x263F13C08])
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return 1.0;
  }
  (*(void (**)(char *, uint64_t))(v2 + 96))(v4, v1);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  if ((sub_22D645EC4() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return 1.0;
  }
  char v9 = sub_22D646584();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  double result = 0.0;
  if ((v9 & 1) == 0) {
    return 1.0;
  }
  return result;
}

uint64_t sub_22D67B088()
{
  uint64_t v0 = sub_22D6CCAB8();
  uint64_t result = 0;
  if ((v2 & 1) == 0 && v0 >= 1) {
    return sub_22D6CD578();
  }
  return result;
}

uint64_t sub_22D67B0E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v96 = a2;
  uint64_t v5 = sub_22D6CB578();
  uint64_t v76 = v5;
  OUTLINED_FUNCTION_0_0();
  uint64_t v95 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_0_3();
  uint64_t v94 = v8;
  OUTLINED_FUNCTION_0_0();
  uint64_t v83 = v9;
  uint64_t v86 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_44((uint64_t)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_22D6CCAC8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_0_3();
  uint64_t v97 = v17;
  uint64_t v72 = *(void *)(a1 + 16);
  uint64_t v18 = v72;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D6C0);
  uint64_t v75 = v19;
  uint64_t v20 = sub_22D67D3B4(&qword_26857D6C8, MEMORY[0x263F13C38]);
  uint64_t v73 = v20;
  uint64_t v71 = *(void *)(a1 + 24);
  uint64_t v21 = v71;
  uint64_t v74 = sub_22D5DCE80(&qword_26857D6D0, &qword_26857D6C0);
  uint64_t v102 = v13;
  uint64_t v103 = v18;
  uint64_t v104 = v19;
  unint64_t v105 = v20;
  uint64_t v106 = v21;
  uint64_t v107 = v74;
  uint64_t v22 = _s9HItemCellVMa();
  uint64_t v79 = v22;
  OUTLINED_FUNCTION_0_0();
  uint64_t v91 = v23;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_44((uint64_t)&v69 - v25);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v78 = WitnessTable;
  uint64_t v77 = sub_22D67D3B4((unint64_t *)&qword_26857B498, MEMORY[0x263F19B68]);
  uint64_t v102 = v22;
  uint64_t v103 = v5;
  uint64_t v104 = WitnessTable;
  unint64_t v105 = v77;
  uint64_t v87 = MEMORY[0x263F1A988];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v88 = v27;
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_44((uint64_t)&v69 - v29);
  uint64_t v80 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v92 = v30;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_44((uint64_t)&v69 - v32);
  uint64_t v90 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v93 = v33;
  uint64_t v35 = MEMORY[0x270FA5388](v34);
  v85 = (char *)&v69 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  v89 = (char *)&v69 - v37;
  uint64_t v38 = v13;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v97, v3, v13);
  uint64_t v39 = v3 + *(int *)(a1 + 36);
  uint64_t v40 = *(void *)(v39 + 8);
  uint64_t v41 = *(void *)(v39 + 16);
  unint64_t v42 = *(void *)(v39 + 24);
  LOBYTE(v102) = *(unsigned char *)v39;
  uint64_t v103 = v40;
  uint64_t v104 = v41;
  unint64_t v105 = v42;
  uint64_t v70 = v3 + *(int *)(a1 + 44);
  double v43 = *(double *)(v70 + 64);
  uint64_t v44 = v83;
  uint64_t v45 = v82;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 16))(v82, v3, a1);
  unint64_t v46 = (*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  uint64_t v47 = swift_allocObject();
  uint64_t v48 = v72;
  uint64_t v49 = v71;
  *(void *)(v47 + 16) = v72;
  *(void *)(v47 + 24) = v49;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v44 + 32))(v47 + v46, v45, a1);
  uint64_t v50 = v38;
  uint64_t v51 = v75;
  uint64_t v52 = v73;
  uint64_t v53 = v74;
  LOBYTE(a1) = sub_22D5DADC8();
  swift_bridgeObjectRetain();
  sub_22D5DB288(v42);
  sub_22D669D7C(v97, (char *)&v102, a1 & 1, 0, 0, 0, 5, 0, v81, v43, 0, 0, v48, (uint64_t)sub_22D67D2C0, v47, v50, v48, v51, v52,
    v49,
    v53);
  uint64_t v54 = v79;
  uint64_t v55 = v76;
  uint64_t v56 = v78;
  uint64_t v57 = v77;
  sub_22D69D018();
  sub_22D5DADD0();
  sub_22D6CBBD8();
  OUTLINED_FUNCTION_22();
  v58();
  OUTLINED_FUNCTION_22();
  v59();
  sub_22D6CB8E8();
  uint64_t v102 = v54;
  uint64_t v103 = v55;
  uint64_t v104 = v56;
  unint64_t v105 = v57;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_22D6CBE28();
  OUTLINED_FUNCTION_22();
  v61();
  uint64_t v100 = OpaqueTypeConformance2;
  uint64_t v101 = MEMORY[0x263F18C10];
  uint64_t v68 = swift_getWitnessTable();
  sub_22D617C44();
  v62 = v85;
  sub_22D6CBDB8();
  OUTLINED_FUNCTION_22();
  v63();
  uint64_t v98 = v68;
  uint64_t v99 = MEMORY[0x263F19100];
  uint64_t v64 = v90;
  swift_getWitnessTable();
  v65 = v89;
  sub_22D6B8B10(v62, v64);
  v66 = *(void (**)(char *, uint64_t))(v93 + 8);
  v66(v62, v64);
  sub_22D6B8B10(v65, v64);
  return ((uint64_t (*)(char *, uint64_t))v66)(v65, v64);
}

uint64_t sub_22D67B91C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v132 = (char *)a3;
  uint64_t v130 = a2;
  uint64_t v135 = a1;
  uint64_t v124 = a4;
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D6D8);
  uint64_t v116 = *(void *)(v117 - 8);
  MEMORY[0x270FA5388](v117);
  v114 = (char *)&v113 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D6E0);
  MEMORY[0x270FA5388](v118);
  v115 = (char *)&v113 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D6E8);
  uint64_t v6 = MEMORY[0x270FA5388](v122);
  uint64_t v120 = (uint64_t)&v113 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v119 = (uint64_t)&v113 - v8;
  uint64_t v134 = sub_22D6CCAC8();
  uint64_t v127 = *(void *)(v134 - 8);
  uint64_t v9 = v127;
  MEMORY[0x270FA5388](v134);
  v131 = (char *)&v113 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D6F0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  v123 = (char *)&v113 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v121 = (char *)&v113 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D6F8);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v128 = (uint64_t)&v113 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D700) - 8;
  uint64_t v17 = MEMORY[0x270FA5388](v129);
  uint64_t v136 = (uint64_t)&v113 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v133 = (char *)&v113 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D708);
  uint64_t v21 = v20 - 8;
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v113 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D710);
  uint64_t v25 = v24 - 8;
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v113 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D718);
  uint64_t v29 = v28 - 8;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v113 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v113 - v33;
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v125 = v9 + 16;
  v126 = v35;
  uint64_t v36 = v135;
  v35(v23, v135, v134);
  v23[*(int *)(v21 + 44)] = 0;
  char v37 = sub_22D6CB8E8();
  uint64_t v38 = v36 + *(int *)(_s14AlbumTrackCellVMa() + 44);
  sub_22D6CADB8();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  sub_22D5DD3A4((uint64_t)v23, (uint64_t)v27, &qword_26857D708);
  uint64_t v47 = &v27[*(int *)(v25 + 44)];
  *uint64_t v47 = v37;
  uint64_t v48 = (uint64_t)v32;
  uint64_t v49 = v136;
  *((void *)v47 + 1) = v40;
  *((void *)v47 + 2) = v42;
  *((void *)v47 + 3) = v44;
  *((void *)v47 + 4) = v46;
  v47[40] = 0;
  uint64_t v50 = (uint64_t)v23;
  uint64_t v51 = (uint64_t)v133;
  sub_22D5DD960(v50, &qword_26857D708);
  LOBYTE(v25) = sub_22D6CB8F8();
  sub_22D6CADB8();
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  sub_22D5DD3A4((uint64_t)v27, v48, &qword_26857D710);
  uint64_t v60 = v48 + *(int *)(v29 + 44);
  *(unsigned char *)uint64_t v60 = v25;
  *(void *)(v60 + 8) = v53;
  *(void *)(v60 + 16) = v55;
  *(void *)(v60 + 24) = v57;
  *(void *)(v60 + 32) = v59;
  *(unsigned char *)(v60 + 40) = 0;
  sub_22D5DD960((uint64_t)v27, &qword_26857D710);
  v132 = v34;
  sub_22D67D35C(v48, (uint64_t)v34, &qword_26857D718);
  uint64_t v61 = v128;
  uint64_t v63 = v134;
  uint64_t v62 = v135;
  sub_22D67C338(v128);
  LOBYTE(v27) = sub_22D6CB8F8();
  uint64_t v130 = v38;
  sub_22D6CADB8();
  uint64_t v65 = v64;
  uint64_t v67 = v66;
  uint64_t v69 = v68;
  uint64_t v71 = v70;
  sub_22D5DD3A4(v61, v49, &qword_26857D6F8);
  uint64_t v72 = v49 + *(int *)(v129 + 44);
  *(unsigned char *)uint64_t v72 = (_BYTE)v27;
  *(void *)(v72 + 8) = v65;
  *(void *)(v72 + 16) = v67;
  *(void *)(v72 + 24) = v69;
  *(void *)(v72 + 32) = v71;
  *(unsigned char *)(v72 + 40) = 0;
  sub_22D5DD960(v61, &qword_26857D6F8);
  uint64_t v73 = v49;
  uint64_t v74 = v62;
  sub_22D67D35C(v73, v51, &qword_26857D700);
  uint64_t v75 = v131;
  v126(v131, v74, v63);
  uint64_t v76 = v127;
  LODWORD(v27) = (*(uint64_t (**)(char *, uint64_t))(v127 + 88))(v75, v63);
  LODWORD(v29) = *MEMORY[0x263F13C00];
  (*(void (**)(char *, uint64_t))(v76 + 8))(v75, v63);
  if (v27 == v29)
  {
    v131 = (char *)v48;
    uint64_t v77 = sub_22D6CBF98();
    uint64_t v78 = sub_22D6CB938();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v137 = v77;
    uint64_t v138 = KeyPath;
    uint64_t v139 = v78;
    sub_22D6CB9B8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857BA48);
    sub_22D60F6EC();
    uint64_t v80 = v114;
    sub_22D6CBB58();
    swift_release();
    swift_release();
    swift_release();
    sub_22D67D3B4(&qword_26857D6C8, MEMORY[0x263F13C38]);
    char v81 = sub_22D6CA608();
    uint64_t v82 = sub_22D6CBF58();
    uint64_t v83 = v123;
    uint64_t v84 = v122;
    uint64_t v85 = (uint64_t)v121;
    uint64_t v86 = v117;
    uint64_t v87 = (uint64_t)v115;
    uint64_t v88 = v116;
    if (v81)
    {
      uint64_t v89 = sub_22D6CBF38();
      swift_release();
      uint64_t v82 = v89;
    }
    uint64_t v90 = swift_getKeyPath();
    (*(void (**)(uint64_t, char *, uint64_t))(v88 + 16))(v87, v80, v86);
    uint64_t v91 = (uint64_t *)(v87 + *(int *)(v118 + 36));
    *uint64_t v91 = v90;
    v91[1] = v82;
    (*(void (**)(char *, uint64_t))(v88 + 8))(v80, v86);
    char v92 = sub_22D6CB8F8();
    sub_22D6CADB8();
    uint64_t v94 = v93;
    uint64_t v96 = v95;
    uint64_t v98 = v97;
    uint64_t v100 = v99;
    uint64_t v101 = v120;
    sub_22D5DD3A4(v87, v120, &qword_26857D6E0);
    uint64_t v102 = v101 + *(int *)(v84 + 36);
    *(unsigned char *)uint64_t v102 = v92;
    *(void *)(v102 + 8) = v94;
    *(void *)(v102 + 16) = v96;
    *(void *)(v102 + 24) = v98;
    *(void *)(v102 + 32) = v100;
    *(unsigned char *)(v102 + 40) = 0;
    sub_22D5DD960(v87, &qword_26857D6E0);
    uint64_t v103 = v119;
    sub_22D67D35C(v101, v119, &qword_26857D6E8);
    sub_22D67D35C(v103, v85, &qword_26857D6E8);
    uint64_t v104 = 0;
    uint64_t v51 = (uint64_t)v133;
    uint64_t v48 = (uint64_t)v131;
    uint64_t v105 = (uint64_t)v83;
    uint64_t v106 = v124;
  }
  else
  {
    uint64_t v104 = 1;
    uint64_t v105 = (uint64_t)v123;
    uint64_t v106 = v124;
    uint64_t v84 = v122;
    uint64_t v85 = (uint64_t)v121;
  }
  __swift_storeEnumTagSinglePayload(v85, v104, 1, v84);
  uint64_t v107 = (uint64_t)v132;
  sub_22D5DD3A4((uint64_t)v132, v48, &qword_26857D718);
  uint64_t v108 = v136;
  sub_22D5DD3A4(v51, v136, &qword_26857D700);
  sub_22D5DD3A4(v85, v105, &qword_26857D6F0);
  sub_22D5DD3A4(v48, v106, &qword_26857D718);
  uint64_t v109 = v51;
  uint64_t v110 = v105;
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D720);
  sub_22D5DD3A4(v108, v106 + *(int *)(v111 + 48), &qword_26857D700);
  sub_22D5DD3A4(v110, v106 + *(int *)(v111 + 64), &qword_26857D6F0);
  sub_22D5DD960(v85, &qword_26857D6F0);
  sub_22D5DD960(v109, &qword_26857D700);
  sub_22D5DD960(v107, &qword_26857D718);
  sub_22D5DD960(v110, &qword_26857D6F0);
  sub_22D5DD960(v108, &qword_26857D700);
  return sub_22D5DD960(v48, &qword_26857D718);
}

uint64_t sub_22D67C338@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D728);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D730);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v5 = sub_22D6CC238();
  v5[1] = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D738);
  sub_22D67C520(v1, (char *)v5 + *(int *)(v11 + 44));
  char v12 = sub_22D6CB8E8();
  sub_22D6CADB8();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  sub_22D5DD3A4((uint64_t)v5, (uint64_t)v9, &qword_26857D728);
  uint64_t v21 = &v9[*(int *)(v7 + 44)];
  *uint64_t v21 = v12;
  *((void *)v21 + 1) = v14;
  *((void *)v21 + 2) = v16;
  *((void *)v21 + 3) = v18;
  *((void *)v21 + 4) = v20;
  v21[40] = 0;
  sub_22D5DD960((uint64_t)v5, &qword_26857D728);
  sub_22D6CC238();
  sub_22D6CAF58();
  sub_22D5DD3A4((uint64_t)v9, a1, &qword_26857D730);
  uint64_t v22 = (_OWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26857D6F8) + 36));
  long long v23 = v25[1];
  *uint64_t v22 = v25[0];
  v22[1] = v23;
  v22[2] = v25[2];
  return sub_22D5DD960((uint64_t)v9, &qword_26857D730);
}

uint64_t sub_22D67C520@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v78 = a1;
  uint64_t v72 = a2;
  uint64_t v71 = _s14PreviewControlVMa();
  MEMORY[0x270FA5388](v71);
  uint64_t v61 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_22D6CCAC8();
  uint64_t v66 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v65 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_22D6CCA28();
  uint64_t v59 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v68 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D740);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v70 = (uint64_t)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v69 = (uint64_t)&v58 - v9;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B5F0);
  MEMORY[0x270FA5388](v62);
  uint64_t v75 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D748);
  uint64_t v63 = *(void *)(v64 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v64);
  uint64_t v76 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v77 = (char *)&v58 - v13;
  uint64_t v14 = _s14AlbumTrackCellVMa();
  uint64_t v79 = sub_22D67B088();
  uint64_t v80 = v15;
  sub_22D604560();
  uint64_t v16 = sub_22D6CBAF8();
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  sub_22D6CB938();
  uint64_t v21 = sub_22D6CBA98();
  uint64_t v23 = v22;
  char v25 = v24;
  swift_release();
  char v26 = v25 & 1;
  sub_22D604A88(v16, v18, v20);
  swift_bridgeObjectRelease();
  sub_22D6CBEE8();
  uint64_t v73 = sub_22D6CBA58();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v74 = v31;
  swift_release();
  sub_22D604A88(v21, v23, v26);
  swift_bridgeObjectRelease();
  uint64_t v58 = v78 + *(int *)(v14 + 44);
  sub_22D6CC238();
  sub_22D6CAF58();
  uint64_t v32 = v93;
  uint64_t v33 = v94;
  uint64_t v34 = v95;
  LOBYTE(v21) = v96;
  uint64_t v36 = v97;
  uint64_t v35 = v98;
  double v37 = sub_22D67AE58();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v79 = v73;
  uint64_t v80 = v28;
  char v81 = v30 & 1;
  uint64_t v82 = v74;
  uint64_t v83 = v32;
  char v84 = v33;
  uint64_t v85 = v34;
  char v86 = v21;
  uint64_t v87 = v36;
  uint64_t v88 = v35;
  uint64_t v39 = (uint64_t)v75;
  double v89 = v37;
  uint64_t v90 = KeyPath;
  uint64_t v91 = 1;
  char v92 = 0;
  uint64_t v40 = *MEMORY[0x263F18D70];
  uint64_t v41 = sub_22D6CB058();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 104))(v39, v40, v41);
  sub_22D67D3B4(&qword_26857B630, MEMORY[0x263F18D80]);
  if ((sub_22D6CCE68() & 1) == 0)
  {
    __break(1u);
LABEL_8:
    swift_once();
    goto LABEL_4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857D750);
  sub_22D67D3FC();
  sub_22D5DCE80(&qword_26857B668, &qword_26857B5F0);
  uint64_t v42 = v76;
  sub_22D6CBC58();
  sub_22D5DD960(v39, &qword_26857B5F0);
  sub_22D604A88(v79, v80, v81);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v28 = v63;
  uint64_t v43 = v77;
  uint64_t v33 = v64;
  (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v77, v42, v64);
  uint64_t v44 = v66;
  uint64_t v45 = v65;
  uint64_t v46 = v67;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v65, v78, v67);
  if ((*(unsigned int (**)(char *, uint64_t))(v44 + 88))(v45, v46) != *MEMORY[0x263F13C08])
  {
    (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
    uint64_t v51 = 1;
    uint64_t v34 = (int *)v71;
    uint64_t v50 = v69;
    goto LABEL_6;
  }
  (*(void (**)(char *, uint64_t))(v44 + 96))(v45, v46);
  uint64_t v30 = v59;
  uint64_t v47 = v68;
  uint64_t v36 = v60;
  (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v68, v45, v60);
  uint64_t v39 = (uint64_t)v61;
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v61, v47, v36);
  uint64_t v2 = *(void *)(v58 + 40);
  double v37 = *(double *)(v58 + 48);
  uint64_t v34 = (int *)v71;
  uint64_t v14 = v39 + *(int *)(v71 + 32);
  if (qword_26857AD78 != -1) {
    goto LABEL_8;
  }
LABEL_4:
  _s13PreviewPlayerCMa();
  sub_22D67D3B4((unint64_t *)&qword_26857B690, (void (*)(uint64_t))_s13PreviewPlayerCMa);
  swift_retain();
  *(void *)uint64_t v14 = sub_22D6CB018();
  *(void *)(v14 + 8) = v48;
  *(void *)(v39 + v34[5]) = v2;
  *(double *)(v39 + v34[6]) = v37;
  *(unsigned char *)(v39 + v34[7]) = 1;
  (*(void (**)(char *, uint64_t))(v30 + 8))(v68, v36);
  uint64_t v49 = v39;
  uint64_t v50 = v69;
  sub_22D67D58C(v49, v69);
  uint64_t v51 = 0;
  uint64_t v43 = v77;
  uint64_t v42 = v76;
LABEL_6:
  __swift_storeEnumTagSinglePayload(v50, v51, 1, (uint64_t)v34);
  uint64_t v52 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
  v52(v42, v43, v33);
  uint64_t v53 = v70;
  sub_22D5DD3A4(v50, v70, &qword_26857D740);
  uint64_t v54 = v72;
  v52(v72, v42, v33);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(qword_26857D780);
  sub_22D5DD3A4(v53, (uint64_t)&v54[*(int *)(v55 + 48)], &qword_26857D740);
  sub_22D5DD960(v50, &qword_26857D740);
  uint64_t v56 = *(void (**)(char *, uint64_t))(v28 + 8);
  v56(v43, v33);
  sub_22D5DD960(v53, &qword_26857D740);
  return ((uint64_t (*)(char *, uint64_t))v56)(v42, v33);
}

BOOL sub_22D67CEB0(double *a1, double *a2)
{
  return *a1 == *a2
      && a1[1] == a2[1]
      && a1[2] == a2[2]
      && a1[3] == a2[3]
      && a1[4] == a2[4]
      && a1[5] == a2[5]
      && a1[6] == a2[6]
      && a1[7] == a2[7]
      && a1[8] == a2[8]
      && a1[9] == a2[9];
}

uint64_t sub_22D67CF5C()
{
  return sub_22D6CD658();
}

uint64_t sub_22D67D020()
{
  return sub_22D6CD668();
}

BOOL sub_22D67D068(void *__src, const void *a2)
{
  memcpy(v4, __src, sizeof(v4));
  memcpy(__dst, a2, sizeof(__dst));
  return sub_22D67CEB0(v4, __dst);
}

uint64_t sub_22D67D0C8()
{
  memcpy(v2, v0, sizeof(v2));
  return sub_22D67D020();
}

uint64_t sub_22D67D10C()
{
  memcpy(v2, v0, sizeof(v2));
  return sub_22D67CF5C();
}

uint64_t sub_22D67D160()
{
  sub_22D6CD628();
  memcpy(__dst, v0, sizeof(__dst));
  sub_22D67CF5C();
  return sub_22D6CD668();
}

uint64_t sub_22D67D1BC()
{
  uint64_t v1 = (int *)(_s14AlbumTrackCellVMa() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  sub_22D6CCAC8();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_22();
  v3();
  uint64_t v4 = v2 + v1[11];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v4 + 24));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D67D2C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(_s14AlbumTrackCellVMa() - 8);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_22D67B91C(v6, v3, v4, a1);
}

uint64_t sub_22D67D35C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_7();
  uint64_t v4 = OUTLINED_FUNCTION_5_7();
  v5(v4);
  return a2;
}

uint64_t sub_22D67D3B4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_22D67D3FC()
{
  unint64_t result = qword_26857D758;
  if (!qword_26857D758)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D750);
    sub_22D67D49C();
    sub_22D5DCE80(&qword_26857B158, &qword_26857B160);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D758);
  }
  return result;
}

unint64_t sub_22D67D49C()
{
  unint64_t result = qword_26857D760;
  if (!qword_26857D760)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D768);
    sub_22D67D518();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D760);
  }
  return result;
}

unint64_t sub_22D67D518()
{
  unint64_t result = qword_26857D770;
  if (!qword_26857D770)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D778);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D770);
  }
  return result;
}

uint64_t sub_22D67D58C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s14PreviewControlVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D67D5F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 56);
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t sub_22D67D600(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 80)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_22D67D620(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 80) = v3;
  return result;
}

uint64_t _s14AlbumTrackCellV9ConstantsVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22D67D678()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D67D878()
{
  return swift_getWitnessTable();
}

BOOL static ArtworkImage.ReusePolicy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ArtworkImage.ReusePolicy.hash(into:)()
{
  return sub_22D6CD638();
}

void *static ArtworkImage.ReusePolicy.allCases.getter()
{
  return &unk_26E130AE8;
}

uint64_t ArtworkImage.ReusePolicy.hashValue.getter()
{
  return sub_22D6CD668();
}

void sub_22D67D92C(void *a1@<X8>)
{
  *a1 = &unk_26E130AE8;
}

uint64_t ArtworkImage.artworkReusablePolicy(_:)(unsigned __int8 *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22D6CAB08();
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF230D0);
  MEMORY[0x270FA5388](v11 - 8);
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13 - v12;
  sub_22D6CABF8();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_0();
  LODWORD(a1) = *a1;
  (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v17 - v16, v2);
  char v19 = (unsigned int *)MEMORY[0x263F20210];
  if (!a1) {
    char v19 = (unsigned int *)MEMORY[0x263F20208];
  }
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v10, *v19, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v14, v10, v4);
  __swift_storeEnumTagSinglePayload(v14, 0, 1, v4);
  return sub_22D6CAB68();
}

unint64_t sub_22D67DB20()
{
  unint64_t result = qword_26857D808;
  if (!qword_26857D808)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D810);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D808);
  }
  return result;
}

unint64_t sub_22D67DB78()
{
  unint64_t result = qword_26857D818[0];
  if (!qword_26857D818[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26857D818);
  }
  return result;
}

unsigned char *_s11ReusePolicyOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22D67DC90);
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

ValueMetadata *type metadata accessor for ArtworkImage.ReusePolicy()
{
  return &type metadata for ArtworkImage.ReusePolicy;
}

void sub_22D67DCC8()
{
  uint64_t v23 = OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_0_1();
  uint64_t v21 = v2;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_53();
  uint64_t v22 = v4;
  MEMORY[0x270FA5388](v5);
  unsigned int v6 = (int *)_s11ArtworkViewVMa();
  uint64_t v7 = v6[12];
  if (qword_26857AD78 != -1) {
    swift_once();
  }
  uint64_t v8 = (uint64_t *)(v0 + v7);
  swift_retain();
  *uint64_t v8 = sub_22D67E1EC();
  v8[1] = v9;
  uint64_t v10 = v0 + v6[13];
  __asm { FMOV            V1.2D, #5.0 }
  *(_OWORD *)uint64_t v10 = xmmword_22D6CEA10;
  *(_OWORD *)(v10 + 16) = _Q1;
  OUTLINED_FUNCTION_0_11((__n128 *)v10, (__n128)xmmword_22D6CEA20);
  uint64_t v16 = OUTLINED_FUNCTION_8_6();
  v17(v16);
  *(void *)(v0 + v6[9]) = v1;
  sub_22D6CA618();
  __swift_project_boxed_opaque_existential_1(v24, v24[3]);
  sub_22D6CA5A8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  OUTLINED_FUNCTION_9_7();
  (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))(v22, *MEMORY[0x263F57168], v23);
  sub_22D6CCC28();
  uint64_t v18 = OUTLINED_FUNCTION_7_7();
  v19(v18);
  char v20 = *(void (**)(void))(v21 + 8);
  OUTLINED_FUNCTION_4_4();
  v20();
  OUTLINED_FUNCTION_4_4();
  v20();
  OUTLINED_FUNCTION_6_6();
}

uint64_t _s11ArtworkViewVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22D67DEDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_22D6CCCB8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF230A0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26857D910);
  sub_22D6CAC68();
  sub_22D6CC278();
  sub_22D6CABD8();
  uint64_t v16 = sub_22D6CAB78();
  uint64_t v17 = a4 + v15[9];
  *(void *)uint64_t v17 = v16;
  *(unsigned char *)(v17 + 8) = v18 & 1;
  uint64_t v19 = sub_22D6CABC8();
  uint64_t v20 = a4 + v15[10];
  *(void *)uint64_t v20 = v19;
  *(unsigned char *)(v20 + 8) = v21 & 1;
  uint64_t v22 = sub_22D6CAB48();
  uint64_t v23 = a4 + v15[11];
  *(void *)uint64_t v23 = v22;
  *(unsigned char *)(v23 + 8) = v24 & 1;
  *(unsigned char *)(a4 + v15[12]) = sub_22D6CAAE8();
  uint64_t v25 = sub_22D6CAB18();
  char v26 = (uint64_t *)(a4 + v15[13]);
  *char v26 = v25;
  v26[1] = v27;
  uint64_t v28 = sub_22D6CAAD8();
  uint64_t v29 = (uint64_t *)(a4 + v15[14]);
  *uint64_t v29 = v28;
  v29[1] = v30;
  sub_22D6CAAF8();
  *(void *)(a4 + v15[16]) = sub_22D6CAB38();
  uint64_t v31 = sub_22D6CAB28();
  uint64_t v32 = a4 + v15[17];
  *(void *)uint64_t v32 = v31;
  *(void *)(v32 + 8) = v33;
  *(unsigned char *)(v32 + 16) = v34 & 1;
  uint64_t v35 = (void *)(a4 + v15[18]);
  *uint64_t v35 = a2;
  v35[1] = a3;
  swift_retain();
  sub_22D6CABD8();
  char v36 = sub_22D6CCC58();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v36)
  {
    uint64_t v37 = 1;
  }
  else
  {
    sub_22D6CABD8();
    uint64_t v37 = 0;
  }
  swift_release();
  uint64_t v38 = sub_22D6CABF8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v38 - 8) + 8))(a1, v38);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, v37, 1, v8);
  return sub_22D5DD904((uint64_t)v14, a4 + v15[19], &qword_26AF230A0);
}

uint64_t sub_22D67E1A8@<X0>(uint64_t *a1@<X8>)
{
  sub_22D6CAC68();
  swift_allocObject();
  uint64_t result = sub_22D6CAC38();
  *a1 = result;
  return result;
}

uint64_t sub_22D67E1EC()
{
  _s13PreviewPlayerCMa();
  sub_22D67E43C();
  return sub_22D6CB018();
}

void sub_22D67E238()
{
  uint64_t v25 = OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_0_1();
  uint64_t v23 = v2;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_53();
  uint64_t v24 = v4;
  MEMORY[0x270FA5388](v5);
  unsigned int v6 = (int *)_s11ArtworkViewVMa();
  uint64_t v7 = v6[12];
  if (qword_26857AD78 != -1) {
    swift_once();
  }
  uint64_t v8 = (uint64_t *)(v0 + v7);
  swift_retain();
  *uint64_t v8 = sub_22D67E1EC();
  v8[1] = v9;
  uint64_t v10 = v0 + v6[13];
  __asm { FMOV            V1.2D, #5.0 }
  *(_OWORD *)uint64_t v10 = xmmword_22D6CEA10;
  *(_OWORD *)(v10 + 16) = _Q1;
  OUTLINED_FUNCTION_0_11((__n128 *)v10, (__n128)xmmword_22D6CEA20);
  uint64_t v16 = OUTLINED_FUNCTION_8_6();
  v17(v16);
  sub_22D6CA618();
  __swift_project_boxed_opaque_existential_1(v26, v26[3]);
  sub_22D6CA5A8();
  double v19 = v1 / v18;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  *(double *)(v0 + v6[9]) = v19;
  OUTLINED_FUNCTION_9_7();
  (*(void (**)(uint64_t, void, uint64_t))(v23 + 104))(v24, *MEMORY[0x263F57168], v25);
  sub_22D6CCC28();
  uint64_t v20 = OUTLINED_FUNCTION_7_7();
  v21(v20);
  uint64_t v22 = *(void (**)(void))(v23 + 8);
  OUTLINED_FUNCTION_4_4();
  v22();
  OUTLINED_FUNCTION_4_4();
  v22();
  OUTLINED_FUNCTION_6_6();
}

unint64_t sub_22D67E43C()
{
  unint64_t result = qword_26857B690;
  if (!qword_26857B690)
  {
    _s13PreviewPlayerCMa();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857B690);
  }
  return result;
}

uint64_t sub_22D67E48C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22D67E540(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
       + 23) & 0xFFFFFFFFFFFFFFF8)
     + 48 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v10 = *v11;
    uint64_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v12 = *v13;
    uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v15 = (void *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v14 = *v15;
    uint64_t v16 = (void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v17 = (void *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v16 = *v17;
    v16[1] = v17[1];
    double v18 = (_OWORD *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
    double v19 = (long long *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8);
    long long v20 = *v19;
    long long v21 = v19[2];
    v18[1] = v19[1];
    v18[2] = v21;
    *double v18 = v20;
  }
  swift_retain();
  return v4;
}

uint64_t sub_22D67E6B0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  return swift_release();
}

uint64_t sub_22D67E738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  uint64_t v9 = (void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = (void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v9 = *v10;
  uint64_t v11 = (void *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  uint64_t v15 = (_OWORD *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (long long *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  long long v17 = v16[2];
  long long v18 = *v16;
  v15[1] = v16[1];
  v15[2] = v17;
  *uint64_t v15 = v18;
  swift_retain();
  return a1;
}

uint64_t sub_22D67E810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  uint64_t v9 = (void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = (void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v9 = *v10;
  uint64_t v11 = (void *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_retain();
  swift_release();
  uint64_t v15 = (void *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  v15[2] = v16[2];
  v15[3] = v16[3];
  v15[4] = v16[4];
  v15[5] = v16[5];
  return a1;
}

uint64_t sub_22D67E914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = v6 + a1;
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v7 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v7 = *v8;
  uint64_t v9 = (void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = (void *)((v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v10 = *v9;
  uint64_t v11 = (void *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v12 = *v11;
  uint64_t v13 = (_OWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (_OWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  uint64_t v15 = (_OWORD *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (long long *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  long long v17 = *v16;
  long long v18 = v16[2];
  v15[1] = v16[1];
  v15[2] = v18;
  *uint64_t v15 = v17;
  return a1;
}

uint64_t sub_22D67E9D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v7 = *v8;
  uint64_t v9 = (void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = (void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v9 = *v10;
  uint64_t v11 = (void *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_release();
  uint64_t v15 = (void *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  v15[2] = v16[2];
  v15[3] = v16[3];
  v15[4] = v16[4];
  v15[5] = v16[5];
  return a1;
}

uint64_t sub_22D67EAD4(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
         + 23) & 0xFFFFFFFFFFFFFFF8)
       + 48;
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
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x22D67EC48);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  }
  unint64_t v17 = *(void *)((((((((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
                    + 15) & 0xFFFFFFFFFFFFFFF8)
                  + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_22D67EC5C(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  unint64_t v10 = ((((((((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 48;
  if (v8 >= a3)
  {
    int v14 = 0;
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((((((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFD0) {
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
  }
  if (a2 > v8)
  {
    if (((((((((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFD0) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((((((((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFD0)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((((((((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 48);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x22D67EE6CLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if (v7 < 0x7FFFFFFF)
        {
          unint64_t v17 = (void *)((((((((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
                          + 15) & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            *unint64_t v17 = a2 ^ 0x80000000;
            v17[1] = 0;
          }
          else
          {
            v17[1] = (a2 - 1);
          }
        }
        else
        {
          __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t sub_22D67EE94()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_22D67EED8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857CF28);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22D6CCA28();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D6CA618();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857CA28);
  if ((swift_dynamicCast() & 1) == 0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v3);
    sub_22D61324C((uint64_t)v2, &qword_26857CF28);
    return 0.0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v3);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  if ((sub_22D645EC4() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return 0.0;
  }
  char v7 = sub_22D646584();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  double result = 0.0;
  if (v7) {
    return 5.0;
  }
  return result;
}

uint64_t sub_22D67F0C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_22D6CB108();
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = (void *)(v8 - v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D8A0);
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D8A8);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D8B0);
  MEMORY[0x270FA5388](v19 - 8);
  OUTLINED_FUNCTION_0();
  uint64_t v22 = (uint64_t *)(v21 - v20);
  sub_22D5DCE80(&qword_26857D8C0, &qword_26857D8B8);
  *uint64_t v22 = sub_22D6CC238();
  v22[1] = v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D8C8);
  sub_22D67F454(v3, *(void *)(a1 + 16), *(void *)(a1 + 24), (uint64_t)v22 + *(int *)(v24 + 44));
  uint64_t v25 = *(void *)(v3 + *(int *)(a1 + 44));
  char v26 = (char *)v9 + *(int *)(v6 + 28);
  uint64_t v27 = *MEMORY[0x263F19860];
  sub_22D6CB3F8();
  OUTLINED_FUNCTION_7();
  (*(void (**)(char *, uint64_t))(v28 + 104))(v26, v27);
  *uint64_t v9 = v25;
  v9[1] = v25;
  uint64_t v29 = sub_22D6CBEE8();
  uint64_t v30 = v3 + *(int *)(a1 + 52);
  sub_22D6CAE68();
  sub_22D60553C((uint64_t)v9, v13);
  uint64_t v31 = v13 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26857D8D0) + 36);
  *(_OWORD *)uint64_t v31 = v45;
  *(_OWORD *)(v31 + 16) = v46;
  *(void *)(v31 + 32) = v47;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D8D8);
  *(void *)(v13 + *(int *)(v32 + 52)) = v29;
  *(_WORD *)(v13 + *(int *)(v32 + 56)) = 256;
  uint64_t v33 = sub_22D6CC238();
  uint64_t v35 = v34;
  char v36 = (uint64_t *)(v13 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26857D8E0) + 36));
  *char v36 = v33;
  v36[1] = v35;
  sub_22D6055A0((uint64_t)v9);
  uint64_t v37 = *(void *)(v30 + 40);
  sub_22D5DD3A4(v13, v18, &qword_26857D8A0);
  *(void *)(v18 + *(int *)(v15 + 44)) = v37;
  sub_22D61324C(v13, &qword_26857D8A0);
  sub_22D5DCE80(&qword_26857D8E8, &qword_26857D8B0);
  sub_22D681590();
  uint64_t v38 = sub_22D6CC238();
  uint64_t v40 = v39;
  uint64_t v41 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26857D900) + 36);
  sub_22D5DD3A4(v18, v41, &qword_26857D8A8);
  uint64_t v42 = (uint64_t *)(v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26857D908) + 36));
  *uint64_t v42 = v38;
  v42[1] = v40;
  sub_22D5DD3A4((uint64_t)v22, a2, &qword_26857D8B0);
  sub_22D61324C(v18, &qword_26857D8A8);
  return sub_22D61324C((uint64_t)v22, &qword_26857D8B0);
}

uint64_t sub_22D67F454@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v108 = a4;
  uint64_t v105 = _s14PreviewControlVMa();
  MEMORY[0x270FA5388](v105);
  uint64_t v87 = (char *)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857CF28);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v104 = (char *)&v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = sub_22D6CCA28();
  uint64_t v86 = *(void *)(v103 - 8);
  MEMORY[0x270FA5388](v103);
  uint64_t v85 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D740);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v107 = (uint64_t)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v106 = (uint64_t)&v84 - v14;
  uint64_t v102 = sub_22D6CB108() - 8;
  MEMORY[0x270FA5388](v102);
  uint64_t v101 = (char *)&v84 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _s11ArtworkViewVMa();
  uint64_t v99 = *(void *)(v16 - 8);
  uint64_t v100 = *(void *)(v99 + 64);
  MEMORY[0x270FA5388](v16);
  uint64_t v98 = (char *)&v84 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF230D0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v84 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF230A0);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v84 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_22D6CABF8();
  uint64_t v24 = *(void *)(v92 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v92);
  uint64_t v27 = (char *)&v84 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (char *)&v84 - v29;
  MEMORY[0x270FA5388](v28);
  double v89 = (char *)&v84 - v31;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D910);
  MEMORY[0x270FA5388](v32 - 8);
  uint64_t v94 = (uint64_t)&v84 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D918) - 8;
  MEMORY[0x270FA5388](v96);
  uint64_t v95 = (uint64_t)&v84 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D920) - 8;
  uint64_t v35 = MEMORY[0x270FA5388](v97);
  uint64_t v93 = (char *)&v84 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  uint64_t v110 = a3;
  uint64_t v111 = (uint64_t)&v84 - v37;
  uint64_t v109 = a2;
  sub_22D6CA5F8();
  uint64_t v91 = v16;
  ArtworkImage.init(_:width:height:)((uint64_t)v23);
  uint64_t v88 = a1;
  sub_22D6CA618();
  __swift_project_boxed_opaque_existential_1(v112, v112[3]);
  sub_22D6CA5A8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v112);
  uint64_t v38 = v24;
  uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
  uint64_t v40 = v92;
  v39(v27, v30, v92);
  uint64_t v41 = sub_22D6CAB08();
  __swift_storeEnumTagSinglePayload((uint64_t)v20, 1, 1, v41);
  sub_22D6CAB68();
  uint64_t v42 = *(void (**)(char *, uint64_t))(v38 + 8);
  uint64_t v90 = v38 + 8;
  v42(v30, v40);
  uint64_t v44 = v98;
  uint64_t v43 = v99;
  uint64_t v45 = v91;
  (*(void (**)(char *, uint64_t, uint64_t))(v99 + 16))(v98, a1, v91);
  unint64_t v46 = (*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
  uint64_t v47 = swift_allocObject();
  uint64_t v48 = v110;
  *(void *)(v47 + 16) = v109;
  *(void *)(v47 + 24) = v48;
  (*(void (**)(unint64_t, char *, uint64_t))(v43 + 32))(v47 + v46, v44, v45);
  uint64_t v49 = v89;
  v39(v30, v89, v40);
  uint64_t v50 = v103;
  uint64_t v51 = v94;
  sub_22D67DEDC((uint64_t)v30, (uint64_t)sub_22D681724, v47, v94);
  v42(v49, v40);
  uint64_t v52 = v45;
  uint64_t v53 = (uint64_t)v93;
  uint64_t v54 = v88;
  double v55 = sub_22D67EED8();
  sub_22D5DCE80(&qword_26857D928, &qword_26857D910);
  uint64_t v56 = v95;
  sub_22D5DD3A4(v51, v95, &qword_26857D910);
  uint64_t v57 = (uint64_t)v104;
  uint64_t v58 = v56 + *(int *)(v96 + 44);
  *(double *)uint64_t v58 = v55;
  *(unsigned char *)(v58 + 8) = 0;
  sub_22D61324C(v51, &qword_26857D910);
  uint64_t v59 = *(void *)(v54 + *(int *)(v45 + 44));
  uint64_t v60 = v54;
  sub_22D6817E0();
  uint64_t v61 = v101;
  uint64_t v62 = &v101[*(int *)(v102 + 28)];
  uint64_t v63 = *MEMORY[0x263F19860];
  uint64_t v64 = sub_22D6CB3F8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v64 - 8) + 104))(v62, v63, v64);
  *uint64_t v61 = v59;
  v61[1] = v59;
  uint64_t v65 = v53 + *(int *)(v97 + 44);
  sub_22D60553C((uint64_t)v61, v65);
  *(_WORD *)(v65 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26857D938) + 36)) = 256;
  uint64_t v66 = v60;
  sub_22D5DD3A4(v56, v53, &qword_26857D918);
  sub_22D6055A0((uint64_t)v61);
  sub_22D61324C(v56, &qword_26857D918);
  sub_22D5DD904(v53, v111, &qword_26857D920);
  sub_22D6CA618();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857CA28);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload(v57, 0, 1, v50);
    uint64_t v67 = v86;
    uint64_t v68 = v85;
    (*(void (**)(char *, uint64_t, uint64_t))(v86 + 32))(v85, v57, v50);
    uint64_t v69 = v87;
    (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v87, v68, v50);
    uint64_t v70 = (uint64_t *)(v66 + *(int *)(v52 + 52));
    uint64_t v72 = *v70;
    uint64_t v71 = v70[1];
    uint64_t v73 = (int *)v105;
    uint64_t v74 = (uint64_t *)&v69[*(int *)(v105 + 32)];
    if (qword_26857AD78 != -1) {
      swift_once();
    }
    _s13PreviewPlayerCMa();
    sub_22D67E43C();
    swift_retain();
    *uint64_t v74 = sub_22D6CB018();
    v74[1] = v75;
    *(void *)&v69[v73[5]] = v72;
    *(void *)&v69[v73[6]] = v71;
    v69[v73[7]] = 0;
    (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v50);
    uint64_t v76 = (uint64_t)v69;
    uint64_t v77 = v106;
    sub_22D67D58C(v76, v106);
    uint64_t v78 = 0;
  }
  else
  {
    uint64_t v78 = 1;
    __swift_storeEnumTagSinglePayload(v57, 1, 1, v50);
    sub_22D61324C(v57, &qword_26857CF28);
    uint64_t v73 = (int *)v105;
    uint64_t v77 = v106;
  }
  __swift_storeEnumTagSinglePayload(v77, v78, 1, (uint64_t)v73);
  uint64_t v79 = v111;
  sub_22D5DD3A4(v111, v53, &qword_26857D920);
  uint64_t v80 = v107;
  sub_22D5DD3A4(v77, v107, &qword_26857D740);
  uint64_t v81 = v108;
  sub_22D5DD3A4(v53, v108, &qword_26857D920);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D940);
  sub_22D5DD3A4(v80, v81 + *(int *)(v82 + 48), &qword_26857D740);
  sub_22D61324C(v77, &qword_26857D740);
  sub_22D61324C(v79, &qword_26857D920);
  sub_22D61324C(v80, &qword_26857D740);
  return sub_22D61324C(v53, &qword_26857D920);
}

uint64_t sub_22D67FF44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = _s11ArtworkViewVMa();
  return sub_22D67FF80(v2, a1);
}

uint64_t sub_22D67FF80@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_22D5DCE80(&qword_26857D950, &qword_26857D948);
  *a2 = sub_22D6CC238();
  a2[1] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D958);
  return sub_22D67FFFC(v2, *(void *)(a1 + 16), (uint64_t)a2 + *(int *)(v6 + 44));
}

uint64_t sub_22D67FFFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v43 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D960);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v42 = (uint64_t)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v41 = (uint64_t)&v34 - v7;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D938) - 8;
  MEMORY[0x270FA5388](v38);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22D6CB108();
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (uint64_t *)((char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D968);
  uint64_t v15 = v14 - 8;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v40 = (uint64_t)&v34 - v19;
  sub_22D6CBF08();
  uint64_t v20 = sub_22D6CBF38();
  swift_release();
  uint64_t v21 = _s11ArtworkViewVMa();
  sub_22D6CC238();
  sub_22D6CAF58();
  uint64_t v39 = v44;
  int v37 = v45;
  uint64_t v36 = v46;
  int v35 = v47;
  uint64_t v22 = *(void *)(a1 + *(int *)(v21 + 44));
  uint64_t v23 = v48;
  uint64_t v34 = v49;
  uint64_t v24 = (char *)v13 + *(int *)(v11 + 28);
  uint64_t v25 = *MEMORY[0x263F19860];
  uint64_t v26 = sub_22D6CB3F8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104))(v24, v25, v26);
  *uint64_t v13 = v22;
  v13[1] = v22;
  sub_22D60553C((uint64_t)v13, (uint64_t)v9);
  *(_WORD *)&v9[*(int *)(v38 + 44)] = 256;
  sub_22D5DD3A4((uint64_t)v9, (uint64_t)&v18[*(int *)(v15 + 44)], &qword_26857D938);
  *(void *)uint64_t v18 = v20;
  *((_WORD *)v18 + 4) = 256;
  *((void *)v18 + 2) = v39;
  v18[24] = v37;
  *((void *)v18 + 4) = v36;
  v18[40] = v35;
  uint64_t v27 = v34;
  *((void *)v18 + 6) = v23;
  *((void *)v18 + 7) = v27;
  swift_retain();
  sub_22D61324C((uint64_t)v9, &qword_26857D938);
  sub_22D6055A0((uint64_t)v13);
  swift_release();
  uint64_t v28 = v40;
  sub_22D5DD904((uint64_t)v18, v40, &qword_26857D968);
  uint64_t v29 = v41;
  sub_22D680408(v21, v41);
  sub_22D5DD3A4(v28, (uint64_t)v18, &qword_26857D968);
  uint64_t v30 = v42;
  sub_22D5DD3A4(v29, v42, &qword_26857D960);
  uint64_t v31 = v43;
  sub_22D5DD3A4((uint64_t)v18, v43, &qword_26857D968);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D970);
  sub_22D5DD3A4(v30, v31 + *(int *)(v32 + 48), &qword_26857D960);
  sub_22D61324C(v29, &qword_26857D960);
  sub_22D61324C(v28, &qword_26857D968);
  sub_22D61324C(v30, &qword_26857D960);
  return sub_22D61324C((uint64_t)v18, &qword_26857D968);
}

uint64_t sub_22D680408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v106 = a2;
  uint64_t v102 = sub_22D6CBFA8();
  uint64_t v104 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  uint64_t v103 = (char *)v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D978);
  uint64_t v100 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  uint64_t v101 = (char *)v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_22D6CA7B8();
  uint64_t v76 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v78 = (char *)v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_22D6CAA88();
  uint64_t v77 = *(void *)(v82 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v82);
  uint64_t v81 = (char *)v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = a1;
  uint64_t v9 = a1 - 8;
  uint64_t v91 = *(void *)(a1 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v86 = (char *)v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v92 = (char *)v75 - v12;
  uint64_t v88 = sub_22D6CC7F8();
  uint64_t v95 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  uint64_t v87 = (char *)v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_22D6CCCF8();
  uint64_t v94 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  uint64_t v96 = (char *)v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D980);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v98 = (char *)v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_22D6CCD08();
  uint64_t v85 = *(void *)(v89 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v89);
  uint64_t v83 = (char *)v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v84 = (char *)v75 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B3C0);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v99 = (char *)v75 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_22D6CCDC8();
  uint64_t v97 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)v75 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_22D6CCB88();
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)v75 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = *(void *)(v9 + 24);
  uint64_t v30 = *(void *)(v9 + 32);
  sub_22D6CA618();
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857CA28);
  if (swift_dynamicCast())
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
    sub_22D6CB9B8();
    uint64_t v32 = v100;
    uint64_t v33 = v101;
    uint64_t v34 = v102;
    goto LABEL_27;
  }
  uint64_t v35 = (uint64_t)v98;
  v75[0] = v24;
  uint64_t v36 = v97;
  uint64_t v90 = v29;
  uint64_t v80 = v30;
  sub_22D6CA618();
  uint64_t v37 = (uint64_t)v99;
  v75[1] = v31;
  uint64_t v38 = v2;
  if ((swift_dynamicCast() & 1) == 0)
  {
    __swift_storeEnumTagSinglePayload(v37, 1, 1, v22);
    uint64_t v42 = &qword_26857B3C0;
LABEL_7:
    sub_22D61324C(v37, v42);
    uint64_t v33 = v101;
    uint64_t v43 = v92;
    uint64_t v44 = v95;
    uint64_t v45 = v93;
    uint64_t v46 = v94;
    sub_22D6CA618();
    unsigned __int8 v47 = v96;
    if (swift_dynamicCast())
    {
      (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v45);
      sub_22D6CB998();
      uint64_t v34 = v102;
      uint64_t v32 = v100;
      goto LABEL_27;
    }
    uint64_t v101 = v38;
    sub_22D6CA618();
    uint64_t v48 = v87;
    uint64_t v49 = v88;
    int v50 = swift_dynamicCast();
    if (v50) {
      (*(void (**)(char *, uint64_t))(v44 + 8))(v48, v49);
    }
    uint64_t v51 = v91;
    uint64_t v52 = *(char **)(v91 + 16);
    uint64_t v53 = v107;
    ((void (*)(char *, char *, uint64_t))v52)(v43, v101, v107);
    if (v50)
    {
      uint64_t v54 = *(void (**)(char *, uint64_t))(v51 + 8);
      v54(v43, v53);
      uint64_t v55 = v53;
    }
    else
    {
      uint64_t v99 = v52;
      sub_22D6CA618();
      uint64_t v54 = *(void (**)(char *, uint64_t))(v91 + 8);
      v54(v43, v53);
      uint64_t v60 = v81;
      uint64_t v61 = v82;
      if (!swift_dynamicCast())
      {
        uint64_t v63 = v86;
        ((void (*)(char *, char *, uint64_t))v99)(v86, v101, v53);
        sub_22D6CA618();
        v54(v63, v53);
        uint64_t v64 = v78;
        uint64_t v65 = v79;
        if ((swift_dynamicCast() & 1) == 0)
        {
          sub_22D6CB998();
          goto LABEL_19;
        }
        (*(void (**)(char *, uint64_t))(v76 + 8))(v64, v65);
LABEL_18:
        sub_22D6CB9A8();
LABEL_19:
        uint64_t v34 = v102;
        uint64_t v32 = v100;
        goto LABEL_27;
      }
      (*(void (**)(char *, uint64_t))(v77 + 8))(v60, v61);
      uint64_t v55 = v53;
      uint64_t v52 = v99;
    }
    uint64_t v62 = v86;
    ((void (*)(char *, char *, uint64_t))v52)(v86, v101, v55);
    v54(v62, v55);
    goto LABEL_18;
  }
  __swift_storeEnumTagSinglePayload(v37, 0, 1, v22);
  uint64_t v39 = v36;
  uint64_t v40 = v75[0];
  (*(void (**)(void, uint64_t, uint64_t))(v36 + 32))(v75[0], v37, v22);
  uint64_t v37 = v35;
  sub_22D6CCD18();
  uint64_t v41 = v89;
  if (__swift_getEnumTagSinglePayload(v35, 1, v89) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v40, v22);
    uint64_t v42 = &qword_26857D980;
    goto LABEL_7;
  }
  uint64_t v99 = (char *)v22;
  uint64_t v56 = v85;
  uint64_t v57 = v84;
  (*(void (**)(char *, uint64_t, uint64_t))(v85 + 32))(v84, v37, v41);
  uint64_t v58 = v83;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v83, v57, v41);
  int v59 = (*(uint64_t (**)(char *, uint64_t))(v56 + 88))(v58, v41);
  if (v59 == *MEMORY[0x263F57258])
  {
    uint64_t v32 = v100;
  }
  else
  {
    if (v59 != *MEMORY[0x263F57260]) {
      (*(void (**)(char *, uint64_t))(v56 + 8))(v58, v41);
    }
    uint64_t v32 = v100;
  }
  sub_22D6CB998();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v41);
  (*(void (**)(void, char *))(v39 + 8))(v75[0], v99);
  uint64_t v33 = v101;
  uint64_t v34 = v102;
LABEL_27:
  sub_22D6CA618();
  __swift_project_boxed_opaque_existential_1(v108, v110);
  sub_22D6CA5A8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v108);
  sub_22D6CBF98();
  uint64_t v66 = v104;
  uint64_t v67 = v103;
  (*(void (**)(char *, void, uint64_t))(v104 + 104))(v103, *MEMORY[0x263F1B4B8], v34);
  uint64_t v68 = sub_22D6CBFE8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v67, v34);
  sub_22D6CC238();
  sub_22D6CAF58();
  v108[0] = v68;
  v108[1] = 0;
  __int16 v109 = 1;
  uint64_t v110 = v115;
  LOBYTE(v111) = v116;
  uint64_t v112 = v117;
  char v113 = v118;
  long long v114 = v119;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857D988);
  sub_22D681880();
  sub_22D6CBB58();
  swift_release();
  uint64_t v69 = sub_22D6CBF58();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v71 = v106;
  uint64_t v72 = v105;
  (*(void (**)(uint64_t, char *, uint64_t))(v32 + 16))(v106, v33, v105);
  uint64_t v73 = (uint64_t *)(v71 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26857D960) + 36));
  *uint64_t v73 = KeyPath;
  v73[1] = v69;
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v33, v72);
}

BOOL sub_22D681348(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3] && a1[4] == a2[4] && a1[5] == a2[5];
}

uint64_t sub_22D6813B4()
{
  return sub_22D6CD658();
}

uint64_t sub_22D681424()
{
  return sub_22D6CD668();
}

BOOL sub_22D68146C(_OWORD *a1, long long *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = *a2;
  long long v4 = a2[1];
  v7[2] = a1[2];
  v8[0] = v3;
  long long v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_22D681348((double *)v7, (double *)v8);
}

uint64_t sub_22D6814BC()
{
  return sub_22D681424();
}

uint64_t sub_22D6814F8()
{
  return sub_22D6813B4();
}

uint64_t sub_22D681534()
{
  return sub_22D6CD668();
}

unint64_t sub_22D681590()
{
  unint64_t result = qword_26857D8F0;
  if (!qword_26857D8F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D8A8);
    sub_22D5DCE80(&qword_26857D8F8, &qword_26857D8A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D8F0);
  }
  return result;
}

uint64_t sub_22D681630()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(_s11ArtworkViewVMa() - 8) + 80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + ((v2 + 32) & ~v2), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D681724@<X0>(uint64_t *a1@<X8>)
{
  _s11ArtworkViewVMa();
  return sub_22D67FF44(a1);
}

unint64_t sub_22D6817E0()
{
  unint64_t result = qword_26857D930;
  if (!qword_26857D930)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D918);
    sub_22D5DCE80(&qword_26857D928, &qword_26857D910);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D930);
  }
  return result;
}

unint64_t sub_22D681880()
{
  unint64_t result = qword_26857D990;
  if (!qword_26857D990)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D988);
    sub_22D6818FC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D990);
  }
  return result;
}

unint64_t sub_22D6818FC()
{
  unint64_t result = qword_26857D998;
  if (!qword_26857D998)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26857D9A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857D998);
  }
  return result;
}

uint64_t _s11ArtworkViewV9ConstantsVMa()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_22D681994()
{
  unint64_t result = qword_26857DA28;
  if (!qword_26857DA28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D900);
    sub_22D5DCE80(&qword_26857D8E8, &qword_26857D8B0);
    sub_22D5DCE80(qword_26857DA30, &qword_26857D908);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857DA28);
  }
  return result;
}

uint64_t sub_22D681A58()
{
  return swift_getWitnessTable();
}

void OUTLINED_FUNCTION_6_6()
{
  double v5 = v4 * 0.5;
  if ((v1 & 1) == 0) {
    double v5 = v3;
  }
  *(double *)(v0 + *(int *)(v2 + 44)) = v5;
}

__n128 sub_22D681A90@<Q0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>, double a7@<D0>)
{
  char v12 = *a2;
  __n128 v21 = *(__n128 *)(a2 + 8);
  uint64_t v13 = *((void *)a2 + 3);
  uint64_t v14 = (int *)_s9VItemCellVMa();
  uint64_t v15 = (uint64_t *)(a6 + v14[16]);
  _s9ViewModelCMa();
  swift_getWitnessTable();
  *uint64_t v15 = sub_22D6CB198();
  v15[1] = v16;
  uint64_t v17 = a6 + v14[17];
  *(_OWORD *)uint64_t v17 = xmmword_22D6D2010;
  *(void *)(v17 + 16) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(a6, a1, a5);
  uint64_t v18 = a6 + v14[13];
  *(unsigned char *)uint64_t v18 = v12;
  __n128 result = v21;
  *(__n128 *)(v18 + 8) = v21;
  *(void *)(v18 + 24) = v13;
  *(double *)(a6 + v14[14]) = a7;
  uint64_t v20 = (void *)(a6 + v14[15]);
  *uint64_t v20 = a3;
  v20[1] = a4;
  return result;
}

uint64_t _s9VItemCellVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D681C00()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22D681CBC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  double v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
       + 23) & 0xFFFFFFFFFFFFFFF8) != 0
    && ((((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
       + 23) & 0xFFFFFFFFFFFFFFF8) < 0xFFFFFFFFFFFFFFE8)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    double v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v10 = *(unsigned char *)v11;
    *(void *)(v10 + 8) = *(void *)(v11 + 8);
    *(void *)(v10 + 16) = *(void *)(v11 + 16);
    unint64_t v12 = *(void *)(v11 + 24);
    swift_bridgeObjectRetain();
    sub_22D5DB288(v12);
    *(void *)(v10 + 24) = v12;
    uint64_t v13 = (void *)((v10 + 39) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v14 = (void *)((v11 + 39) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v13 = *v14;
    uint64_t v15 = (void *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v16 = (void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v15 = *v16;
    v15[1] = v16[1];
    uint64_t v17 = (void *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v18 = (void *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v17 = *v18;
    v17[1] = v18[1];
    unint64_t v19 = ((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v20 = ((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8;
    long long v21 = *(_OWORD *)v20;
    *(void *)(v19 + 16) = *(void *)(v20 + 16);
    *(_OWORD *)unint64_t v19 = v21;
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_22D681E70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = (a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v4 + 24));
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_22D681F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v7 = *(unsigned char *)v8;
  *(void *)(v7 + 8) = *(void *)(v8 + 8);
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  unint64_t v9 = *(void *)(v8 + 24);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v9);
  *(void *)(v7 + 24) = v9;
  unint64_t v10 = (void *)((v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = (void *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v10 = *v11;
  unint64_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v12 = *v13;
  v12[1] = v13[1];
  uint64_t v14 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (void *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  unint64_t v16 = ((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = ((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8;
  long long v18 = *(_OWORD *)v17;
  *(void *)(v16 + 16) = *(void *)(v17 + 16);
  *(_OWORD *)unint64_t v16 = v18;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_22D68202C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v7 = *(unsigned char *)v8;
  *(void *)(v7 + 8) = *(void *)(v8 + 8);
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v9 = *(void *)(v8 + 24);
  sub_22D5DB288(v9);
  unint64_t v10 = *(void *)(v7 + 24);
  *(void *)(v7 + 24) = v9;
  sub_22D5DB9FC(v10);
  unint64_t v11 = (void *)((v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v12 = (void *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v11 = *v12;
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = (void *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v16 = (void *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  swift_retain();
  swift_release();
  v15[1] = v16[1];
  unint64_t v17 = (void *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  long long v18 = (void *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v17 = *v18;
  v17[1] = v18[1];
  v17[2] = v18[2];
  return a1;
}

uint64_t sub_22D682178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  long long v9 = v8[1];
  *unint64_t v7 = *v8;
  v7[1] = v9;
  unint64_t v10 = (void *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = (void *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v10 = *v11;
  unint64_t v12 = (_OWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (_OWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v12 = *v13;
  uint64_t v14 = (_OWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (_OWORD *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v14 = *v15;
  unint64_t v16 = ((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = ((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8;
  long long v18 = *(_OWORD *)v17;
  *(void *)(v16 + 16) = *(void *)(v17 + 16);
  *(_OWORD *)unint64_t v16 = v18;
  return a1;
}

uint64_t sub_22D682244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v7 = *(unsigned char *)v8;
  *(void *)(v7 + 8) = *(void *)(v8 + 8);
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  swift_bridgeObjectRelease();
  unint64_t v9 = *(void *)(v7 + 24);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  sub_22D5DB9FC(v9);
  unint64_t v10 = (void *)((v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = (void *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v10 = *v11;
  unint64_t v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (void *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v14 = *v15;
  swift_release();
  v14[1] = v15[1];
  unint64_t v16 = (void *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v17 = (void *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v16 = *v17;
  v16[1] = v17[1];
  v16[2] = v17[2];
  return a1;
}

uint64_t sub_22D682370(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0x7FFFFFFE) {
    unsigned int v7 = 2147483646;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
         + 23) & 0xFFFFFFFFFFFFFFF8)
       + 24;
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
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x22D6824D4);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        int v17 = v7 + (v10 | v16);
        return (v17 + 1);
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFE) {
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  }
  unint64_t v18 = *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
  if (v18 >= 0xFFFFFFFF) {
    LODWORD(v18) = -1;
  }
  int v17 = v18 - 1;
  if (v17 < 0) {
    int v17 = -1;
  }
  return (v17 + 1);
}

void sub_22D6824E8(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  unint64_t v10 = ((((((((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 24;
  if (v8 >= a3)
  {
    int v14 = 0;
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((((((((v9 + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFE8) {
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
  }
  if (a2 > v8)
  {
    if (((((((((((v9 + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFE8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((((((((((v9 + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFE8)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((((((((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 24);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x22D6826ECLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if (v7 < 0x7FFFFFFE)
        {
          int v17 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            v17[2] = 0;
            v17[3] = 0;
            *int v17 = (a2 - 0x7FFFFFFF);
            v17[1] = 0;
          }
          else
          {
            v17[2] = a2;
          }
        }
        else
        {
          __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t sub_22D682714()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D682758@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v94 = a2;
  uint64_t v96 = sub_22D6CB578();
  OUTLINED_FUNCTION_0_0();
  uint64_t v93 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_0_3();
  uint64_t v92 = v5;
  uint64_t v95 = sub_22D6CB0D8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v91 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_0_3();
  uint64_t v90 = v8;
  uint64_t v89 = sub_22D6CB108();
  MEMORY[0x270FA5388](v89);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_44(v9);
  uint64_t v10 = a1[2];
  uint64_t v73 = a1[4];
  _s11ArtworkViewVMa();
  sub_22D6CB088();
  _s9CellTitleVMa();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857B160);
  sub_22D6CB088();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_24();
  sub_22D6CBF88();
  sub_22D6CB088();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_24();
  swift_getWitnessTable();
  OUTLINED_FUNCTION_36();
  uint64_t v11 = sub_22D6CC0E8();
  uint64_t v86 = a1;
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[5];
  _s15AlbumDetailViewVMa();
  uint64_t v84 = v12;
  uint64_t v85 = v13;
  _s16ArtistDetailViewVMa();
  sub_22D6CB568();
  _s18PlaylistDetailViewVMa();
  sub_22D6CB568();
  uint64_t v14 = sub_22D6CB568();
  uint64_t v79 = v11;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v119 = swift_getWitnessTable();
  uint64_t v120 = swift_getWitnessTable();
  uint64_t v15 = swift_getWitnessTable();
  uint64_t v117 = swift_getWitnessTable();
  uint64_t v118 = MEMORY[0x263F1BA00];
  uint64_t v115 = v15;
  uint64_t v116 = swift_getWitnessTable();
  uint64_t v78 = v14;
  uint64_t v76 = swift_getWitnessTable();
  uint64_t v111 = v11;
  uint64_t v112 = v14;
  uint64_t v113 = WitnessTable;
  uint64_t v114 = v76;
  sub_22D6CAFF8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v81 = v16;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v17);
  sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v83 = v18;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_44((uint64_t)&v64 - v20);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857B488);
  uint64_t v21 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v82 = v22;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_44((uint64_t)&v64 - v24);
  uint64_t v66 = swift_getWitnessTable();
  uint64_t v109 = v66;
  uint64_t v110 = MEMORY[0x263F18C10];
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v71 = v25;
  uint64_t v26 = sub_22D5DCE80((unint64_t *)&qword_26857B490, &qword_26857B488);
  uint64_t v107 = v25;
  uint64_t v108 = v26;
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v28 = sub_22D685B78(&qword_26857AF48, MEMORY[0x263F18FD0]);
  uint64_t v67 = v21;
  uint64_t v29 = v95;
  uint64_t v111 = v21;
  uint64_t v112 = v95;
  uint64_t v113 = v27;
  uint64_t v114 = v28;
  uint64_t v69 = v27;
  uint64_t v68 = v28;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v80 = v31;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_44((uint64_t)&v64 - v33);
  uint64_t v111 = v21;
  uint64_t v112 = v29;
  uint64_t v113 = v27;
  uint64_t v114 = v28;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v35 = sub_22D685B78((unint64_t *)&qword_26857B498, MEMORY[0x263F19B68]);
  uint64_t v111 = OpaqueTypeMetadata2;
  uint64_t v112 = v96;
  uint64_t v113 = OpaqueTypeConformance2;
  uint64_t v114 = v35;
  uint64_t v74 = MEMORY[0x263F1A988];
  uint64_t v72 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v75 = v36;
  uint64_t v38 = MEMORY[0x270FA5388](v37);
  uint64_t v65 = (char *)&v64 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_44((uint64_t)&v64 - v40);
  uint64_t v102 = v10;
  uint64_t v103 = v84;
  uint64_t v104 = v73;
  uint64_t v105 = v85;
  uint64_t v106 = v87;
  uint64_t v97 = v10;
  uint64_t v98 = v84;
  uint64_t v99 = v73;
  uint64_t v100 = v85;
  uint64_t v101 = v87;
  uint64_t v41 = v87;
  sub_22D68C874((uint64_t)sub_22D685B48);
  uint64_t v42 = v41 + *((int *)v86 + 17);
  sub_22D6CBE18();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v43();
  uint64_t v44 = *(void *)(v42 + 8);
  uint64_t v45 = v88;
  uint64_t v46 = (char *)v88 + *(int *)(v89 + 20);
  uint64_t v47 = *MEMORY[0x263F19860];
  uint64_t v48 = sub_22D6CB3F8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v48 - 8) + 104))(v46, v47, v48);
  *uint64_t v45 = v44;
  v45[1] = v44;
  sub_22D685B78(&qword_26857B678, MEMORY[0x263F19048]);
  sub_22D5DADC8();
  sub_22D6CBC28();
  sub_22D6055A0((uint64_t)v45);
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v49();
  sub_22D6CB0C8();
  sub_22D6CBB98();
  uint64_t v50 = OUTLINED_FUNCTION_2_8();
  v51(v50);
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v52();
  uint64_t v53 = v96;
  sub_22D69D018();
  sub_22D5DADD0();
  uint64_t v54 = v65;
  sub_22D6CBBD8();
  uint64_t v55 = OUTLINED_FUNCTION_2_8();
  v56(v55);
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v57();
  uint64_t v111 = OpaqueTypeMetadata2;
  uint64_t v112 = v53;
  uint64_t v113 = OpaqueTypeConformance2;
  uint64_t v114 = v35;
  swift_getOpaqueTypeConformance2();
  uint64_t v58 = v70;
  int v59 = v54;
  uint64_t v60 = v54;
  uint64_t v61 = v72;
  sub_22D6B8B10(v59, v72);
  uint64_t v62 = *(void (**)(char *, uint64_t))(v75 + 8);
  v62(v60, v61);
  sub_22D6B8B10(v58, v61);
  return ((uint64_t (*)(uint64_t, uint64_t))v62)(v58, v61);
}

uint64_t sub_22D683264@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v24 = a4;
  uint64_t v25 = a1;
  uint64_t v27 = a6;
  _s15AlbumDetailViewVMa();
  _s16ArtistDetailViewVMa();
  sub_22D6CB568();
  _s18PlaylistDetailViewVMa();
  uint64_t v26 = sub_22D6CB568();
  uint64_t v8 = sub_22D6CB568();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v22 - v13;
  uint64_t v34 = v23;
  uint64_t v35 = a3;
  uint64_t v36 = v24;
  uint64_t v37 = a5;
  uint64_t v15 = _s9VItemCellVMa();
  sub_22D6834F8(v15, (uint64_t)v12);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v32 = WitnessTable;
  uint64_t v33 = v17;
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v30 = swift_getWitnessTable();
  uint64_t v31 = MEMORY[0x263F1BA00];
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v28 = v18;
  uint64_t v29 = v19;
  swift_getWitnessTable();
  sub_22D6B8B10(v12, v8);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20(v12, v8);
  sub_22D6B8B10(v14, v8);
  return ((uint64_t (*)(char *, uint64_t))v20)(v14, v8);
}

uint64_t sub_22D6834F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v150 = a2;
  uint64_t v4 = *(void (**)(char *, uint64_t))(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = _s18PlaylistDetailViewVMa();
  uint64_t v7 = sub_22D6CB568();
  uint64_t v130 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v129 = (char *)&v117 - v9;
  uint64_t v146 = v6;
  uint64_t v121 = *(void *)(v6 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v120 = (uint64_t)&v117 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v128 = (char *)&v117 - v12;
  uint64_t v131 = sub_22D6CCDC8();
  uint64_t v127 = *(void *)(v131 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v131);
  uint64_t v119 = (char *)&v117 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v126 = (char *)&v117 - v16;
  MEMORY[0x270FA5388](v15);
  v123 = (char *)&v117 - v17;
  uint64_t v18 = _s16ArtistDetailViewVMa();
  uint64_t v125 = *(void *)(v18 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v124 = (uint64_t)&v117 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v136 = (char *)&v117 - v21;
  uint64_t v142 = sub_22D6CCB88();
  uint64_t v135 = *(void *)(v142 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v142);
  uint64_t v122 = (char *)&v117 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v134 = (char *)&v117 - v25;
  MEMORY[0x270FA5388](v24);
  v132 = (char *)&v117 - v26;
  v144 = v4;
  uint64_t v143 = v5;
  uint64_t v27 = _s15AlbumDetailViewVMa();
  uint64_t v145 = v18;
  uint64_t v28 = sub_22D6CB568();
  uint64_t v138 = *(void *)(v28 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v28);
  uint64_t v137 = (char *)&v117 - v30;
  uint64_t v133 = *(void *)(v27 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)&v117 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  v140 = (char *)&v117 - v34;
  uint64_t v35 = sub_22D6CCAA8();
  uint64_t v139 = *(void *)(v35 - 8);
  uint64_t v36 = MEMORY[0x270FA5388](v35);
  uint64_t v38 = (char *)&v117 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = MEMORY[0x270FA5388](v36);
  uint64_t v41 = (char *)&v117 - v40;
  MEMORY[0x270FA5388](v39);
  uint64_t v43 = (char *)&v117 - v42;
  uint64_t v141 = v28;
  uint64_t v147 = v7;
  uint64_t v149 = sub_22D6CB568();
  uint64_t v148 = *(void *)(v149 - 8);
  MEMORY[0x270FA5388](v149);
  uint64_t v45 = (char *)&v117 - v44;
  sub_22D6CA618();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857CA28);
  if (!swift_dynamicCast())
  {
    uint64_t v133 = v2;
    uint64_t v61 = a1;
    v140 = v45;
    uint64_t v139 = v27;
    uint64_t v62 = v145;
    uint64_t v63 = v132;
    if (swift_dynamicCast())
    {
      uint64_t v64 = v135;
      uint64_t v65 = v134;
      uint64_t v66 = v63;
      uint64_t v67 = v142;
      (*(void (**)(char *, char *, uint64_t))(v135 + 32))(v134, v66, v142);
      uint64_t v68 = (uint64_t)v122;
      (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v122, v65, v67);
      uint64_t v69 = v133 + *(int *)(v61 + 52);
      uint64_t v70 = *(void *)(v69 + 8);
      uint64_t v71 = *(void *)(v69 + 16);
      unint64_t v72 = *(void *)(v69 + 24);
      LOBYTE(v163) = *(unsigned char *)v69;
      uint64_t v164 = v70;
      uint64_t v165 = v71;
      unint64_t v166 = v72;
      LOBYTE(v64) = sub_22D5DADC8();
      swift_bridgeObjectRetain();
      sub_22D5DB288(v72);
      int v73 = v64 & 1;
      uint64_t v74 = v124;
      sub_22D5EF418(v68, &v163, v73, v124);
      uint64_t WitnessTable = swift_getWitnessTable();
      uint64_t v76 = v136;
      sub_22D6B8B10(v74, v62);
      uint64_t v77 = *(void (**)(uint64_t, uint64_t))(v125 + 8);
      v77(v74, v62);
      v144 = (void (*)(char *, uint64_t))v77;
      sub_22D6B8B10(v76, v62);
      uint64_t v78 = swift_getWitnessTable();
      uint64_t v79 = v137;
      sub_22D6C54B8();
      v77(v74, v62);
      uint64_t v157 = v78;
      uint64_t v158 = WitnessTable;
      uint64_t v80 = v141;
      swift_getWitnessTable();
      uint64_t v155 = swift_getWitnessTable();
      uint64_t v60 = MEMORY[0x263F1BA00];
      uint64_t v156 = MEMORY[0x263F1BA00];
      swift_getWitnessTable();
      uint64_t v52 = v140;
      sub_22D6C5400();
      (*(void (**)(char *, uint64_t))(v138 + 8))(v79, v80);
      v144(v136, v62);
      uint64_t v81 = *(void (**)(char *, uint64_t))(v135 + 8);
      uint64_t v82 = v134;
      uint64_t v83 = v174;
    }
    else
    {
      uint64_t v84 = v123;
      uint64_t v85 = v131;
      int v86 = swift_dynamicCast();
      uint64_t v87 = v146;
      if (!v86)
      {
        uint64_t v106 = swift_getWitnessTable();
        uint64_t v107 = v129;
        uint64_t v60 = MEMORY[0x263F1BA00];
        sub_22D6C54B8();
        uint64_t v108 = swift_getWitnessTable();
        uint64_t v109 = swift_getWitnessTable();
        v174[1] = v108;
        v174[2] = v109;
        swift_getWitnessTable();
        uint64_t v173 = v106;
        v174[0] = v60;
        uint64_t v110 = v147;
        swift_getWitnessTable();
        uint64_t v52 = v140;
        sub_22D6C54B8();
        uint64_t v81 = *(void (**)(char *, uint64_t))(v130 + 8);
        uint64_t v82 = v107;
        uint64_t v105 = v110;
        goto LABEL_9;
      }
      uint64_t v88 = v127;
      uint64_t v89 = v126;
      (*(void (**)(char *, char *, uint64_t))(v127 + 32))(v126, v84, v85);
      uint64_t v90 = *(void (**)(char *, char *, uint64_t))(v88 + 16);
      uint64_t v91 = (uint64_t)v119;
      v90(v119, v89, v85);
      uint64_t v92 = v133 + *(int *)(a1 + 52);
      uint64_t v94 = *(void *)(v92 + 8);
      uint64_t v93 = *(void *)(v92 + 16);
      unint64_t v95 = *(void *)(v92 + 24);
      LOBYTE(v163) = *(unsigned char *)v92;
      uint64_t v164 = v94;
      uint64_t v165 = v93;
      unint64_t v166 = v95;
      swift_bridgeObjectRetain();
      sub_22D5DB288(v95);
      uint64_t v96 = v120;
      sub_22D5DF3FC(v91, (uint64_t)&v163, 0, v120);
      uint64_t v97 = swift_getWitnessTable();
      uint64_t v98 = v128;
      sub_22D6B8B10(v96, v87);
      uint64_t v99 = *(void (**)(uint64_t, uint64_t))(v121 + 8);
      v99(v96, v87);
      v144 = (void (*)(char *, uint64_t))v99;
      sub_22D6B8B10(v98, v87);
      uint64_t v100 = v129;
      uint64_t v101 = MEMORY[0x263F1BA00];
      sub_22D6C5400();
      v99(v96, v87);
      uint64_t v102 = swift_getWitnessTable();
      uint64_t v103 = swift_getWitnessTable();
      uint64_t v161 = v102;
      uint64_t v162 = v103;
      swift_getWitnessTable();
      uint64_t v159 = v97;
      uint64_t v160 = v101;
      uint64_t v104 = v147;
      swift_getWitnessTable();
      uint64_t v52 = v140;
      sub_22D6C54B8();
      (*(void (**)(char *, uint64_t))(v130 + 8))(v100, v104);
      v144(v128, v87);
      uint64_t v60 = MEMORY[0x263F1BA00];
      uint64_t v81 = *(void (**)(char *, uint64_t))(v127 + 8);
      uint64_t v82 = v126;
      uint64_t v83 = &v163;
    }
    uint64_t v105 = *(v83 - 32);
LABEL_9:
    v81(v82, v105);
    goto LABEL_10;
  }
  uint64_t v46 = v139;
  uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v139 + 32);
  uint64_t v118 = v41;
  v47(v41, v43, v35);
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v38, v41, v35);
  uint64_t v48 = v2 + *(int *)(a1 + 52);
  uint64_t v49 = *(void *)(v48 + 8);
  uint64_t v50 = *(void *)(v48 + 16);
  unint64_t v51 = *(void *)(v48 + 24);
  LOBYTE(v163) = *(unsigned char *)v48;
  uint64_t v164 = v49;
  uint64_t v165 = v50;
  unint64_t v166 = v51;
  uint64_t v52 = v45;
  char v53 = sub_22D5DADC8();
  swift_bridgeObjectRetain();
  sub_22D5DB288(v51);
  sub_22D5D0CA0((uint64_t)v38, (uint64_t)&v163, v53 & 1, (uint64_t)v33);
  uint64_t v54 = swift_getWitnessTable();
  uint64_t v55 = v140;
  sub_22D6B8B10(v33, v27);
  v144 = (void (*)(char *, uint64_t))v35;
  uint64_t v56 = *(void (**)(char *, uint64_t))(v133 + 8);
  v56(v33, v27);
  sub_22D6B8B10(v55, v27);
  uint64_t v57 = swift_getWitnessTable();
  uint64_t v58 = v137;
  sub_22D6C5400();
  v56(v33, v27);
  uint64_t v153 = v54;
  uint64_t v154 = v57;
  uint64_t v59 = v141;
  swift_getWitnessTable();
  uint64_t v151 = swift_getWitnessTable();
  uint64_t v152 = MEMORY[0x263F1BA00];
  swift_getWitnessTable();
  sub_22D6C5400();
  (*(void (**)(char *, uint64_t))(v138 + 8))(v58, v59);
  v56(v140, v27);
  (*(void (**)(char *, void))(v139 + 8))(v118, v144);
  uint64_t v60 = MEMORY[0x263F1BA00];
LABEL_10:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v175);
  uint64_t v111 = swift_getWitnessTable();
  uint64_t v112 = swift_getWitnessTable();
  uint64_t v171 = v111;
  uint64_t v172 = v112;
  uint64_t v113 = swift_getWitnessTable();
  uint64_t v169 = swift_getWitnessTable();
  uint64_t v170 = v60;
  uint64_t v114 = swift_getWitnessTable();
  uint64_t v167 = v113;
  uint64_t v168 = v114;
  uint64_t v115 = v149;
  swift_getWitnessTable();
  sub_22D6B8B10(v52, v115);
  return (*(uint64_t (**)(char *, uint64_t))(v148 + 8))(v52, v115);
}

uint64_t sub_22D6846A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v36 = a5;
  uint64_t v37 = a6;
  uint64_t v33 = a3;
  uint64_t v31 = sub_22D6CCC38();
  uint64_t v9 = *(void *)(v31 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v31);
  uint64_t v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v30 - v13;
  _s11ArtworkViewVMa();
  sub_22D6CB088();
  _s9CellTitleVMa();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857B160);
  sub_22D6CB088();
  swift_getTupleTypeMetadata2();
  sub_22D6CC2C8();
  sub_22D6CBF88();
  sub_22D6CB088();
  swift_getTupleTypeMetadata2();
  uint64_t v15 = sub_22D6CC2C8();
  v30[1] = swift_getWitnessTable();
  v30[2] = v15;
  uint64_t v16 = sub_22D6CC0E8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v30 - v21;
  uint64_t v34 = a1;
  uint64_t v35 = a4;
  uint64_t v32 = a2;
  sub_22D6CA598();
  uint64_t v23 = v31;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, *MEMORY[0x263F57168], v31);
  LOBYTE(a1) = sub_22D6CCC28();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v9 + 8);
  v24(v12, v23);
  v24(v14, v23);
  if (a1) {
    uint64_t v25 = sub_22D6CB448();
  }
  else {
    uint64_t v25 = sub_22D6CB458();
  }
  MEMORY[0x270FA5388](v25);
  uint64_t v26 = v33;
  v30[-6] = v32;
  v30[-5] = v26;
  uint64_t v27 = v36;
  v30[-4] = v35;
  v30[-3] = v27;
  v30[-2] = v34;
  sub_22D6CC0D8();
  swift_getWitnessTable();
  sub_22D6B8B10(v20, v16);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v17 + 8);
  v28(v20, v16);
  sub_22D6B8B10(v22, v16);
  return ((uint64_t (*)(char *, uint64_t))v28)(v22, v16);
}

uint64_t sub_22D684A8C@<X0>(char *a1@<X0>, char *a2@<X1>, char *a3@<X2>, char *a4@<X3>, char *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v94 = a3;
  unint64_t v95 = a5;
  uint64_t v91 = a6;
  _s9CellTitleVMa();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857B160);
  sub_22D6CB088();
  swift_getTupleTypeMetadata2();
  uint64_t v81 = sub_22D6CC2C8();
  uint64_t v9 = sub_22D6CBF88();
  uint64_t v85 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v84 = (char *)&v68 - v10;
  uint64_t v86 = v11;
  uint64_t v90 = sub_22D6CB088();
  uint64_t v88 = *(void *)(v90 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v90);
  uint64_t v89 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v83 = (char *)&v68 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v87 = (char *)&v68 - v16;
  uint64_t v17 = sub_22D6CCC38();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v68 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)&v68 - v23;
  uint64_t v25 = *((void *)a2 - 1);
  MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)&v68 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = _s11ArtworkViewVMa();
  uint64_t v75 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v74 = (char *)&v68 - v29;
  uint64_t v96 = sub_22D6CB088();
  uint64_t v92 = *(void *)(v96 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v96);
  uint64_t v82 = (char *)&v68 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v68 = (char *)&v68 - v33;
  MEMORY[0x270FA5388](v32);
  uint64_t v93 = (char *)&v68 - v34;
  uint64_t v35 = *(void (**)(char *, char *, char *))(v25 + 16);
  uint64_t v73 = (uint64_t)v27;
  v35(v27, a1, a2);
  uint64_t v101 = a2;
  uint64_t v102 = v94;
  uint64_t v103 = a4;
  uint64_t v104 = v95;
  _s9VItemCellVMa();
  uint64_t v97 = a1;
  uint64_t v77 = a2;
  uint64_t v36 = a4;
  sub_22D6CA598();
  uint64_t v37 = *(void (**)(void))(v18 + 104);
  unsigned int v72 = *MEMORY[0x263F57168];
  uint64_t v71 = v18 + 104;
  uint64_t v70 = (void (*)(char *, void, uint64_t))v37;
  v37(v21);
  sub_22D6CCC28();
  uint64_t v38 = *(void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v78 = v21;
  v38(v21, v17);
  uint64_t v76 = v24;
  uint64_t v80 = v17;
  uint64_t v79 = v18 + 8;
  uint64_t v69 = v38;
  v38(v24, v17);
  uint64_t v39 = v74;
  uint64_t v40 = v77;
  sub_22D67E238();
  sub_22D6CC248();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v42 = v68;
  sub_22D6CBDA8();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v39, v28);
  v100[5] = WitnessTable;
  v100[6] = MEMORY[0x263F18860];
  uint64_t v43 = v96;
  uint64_t v73 = swift_getWitnessTable();
  sub_22D6B8B10(v42, v43);
  uint64_t v44 = *(char **)(v92 + 8);
  uint64_t v75 = v92 + 8;
  uint64_t v74 = v44;
  uint64_t v45 = ((uint64_t (*)(char *, uint64_t))v44)(v42, v43);
  MEMORY[0x270FA5388](v45);
  uint64_t v46 = v94;
  *(&v68 - 6) = v40;
  *(&v68 - 5) = v46;
  uint64_t v47 = v95;
  *(&v68 - 4) = v36;
  *(&v68 - 3) = v47;
  *(&v68 - 2) = v97;
  uint64_t v48 = swift_getWitnessTable();
  uint64_t v49 = v84;
  sub_22D6CBF78();
  uint64_t v50 = v76;
  sub_22D6CA598();
  unint64_t v51 = v78;
  uint64_t v52 = v80;
  v70(v78, v72, v80);
  LOBYTE(a1) = sub_22D6CCC28();
  char v53 = v69;
  v69(v51, v52);
  v53(v50, v52);
  if (a1) {
    sub_22D6CC238();
  }
  else {
    sub_22D6CC248();
  }
  v100[4] = v48;
  uint64_t v54 = v86;
  uint64_t v55 = swift_getWitnessTable();
  uint64_t v56 = v83;
  sub_22D6CBDA8();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v49, v54);
  v100[2] = v55;
  v100[3] = MEMORY[0x263F18860];
  uint64_t v57 = v90;
  uint64_t v58 = swift_getWitnessTable();
  uint64_t v59 = v87;
  sub_22D6B8B10(v56, v57);
  uint64_t v60 = v88;
  uint64_t v61 = *(void (**)(char *, uint64_t))(v88 + 8);
  v61(v56, v57);
  uint64_t v62 = v93;
  uint64_t v63 = v82;
  uint64_t v64 = v96;
  (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v82, v93, v96);
  uint64_t v101 = v63;
  uint64_t v65 = v89;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v89, v59, v57);
  uint64_t v102 = v65;
  v100[0] = v64;
  v100[1] = v57;
  uint64_t v98 = v73;
  uint64_t v99 = v58;
  sub_22D634638((uint64_t)&v101, 2, (uint64_t)v100);
  v61(v59, v57);
  uint64_t v66 = (uint64_t (*)(char *, uint64_t))v74;
  ((void (*)(char *, uint64_t))v74)(v62, v64);
  v61(v65, v57);
  return v66(v63, v64);
}

uint64_t sub_22D6854A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v38 = a3;
  uint64_t v39 = a5;
  uint64_t v37 = a1;
  uint64_t v40 = a6;
  uint64_t v9 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _s9CellTitleVMa();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v35 - v14;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857B160);
  uint64_t v16 = sub_22D6CB088();
  uint64_t v36 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v35 = (char *)&v35 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, a2);
  char v21 = sub_22D5DADC8();
  uint64_t v22 = a4;
  sub_22D644360((uint64_t)v11, v21 & 1, 1, a2, (uint64_t)v15);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_22D6CBEB8();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v24 = sub_22D5DCE80(&qword_26857B158, &qword_26857B160);
  uint64_t v49 = WitnessTable;
  uint64_t v50 = v24;
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v26 = v35;
  sub_22D6B8B10(v19, v16);
  uint64_t v27 = v36;
  uint64_t v28 = *(void (**)(char *, uint64_t))(v36 + 8);
  v28(v19, v16);
  uint64_t v45 = a2;
  uint64_t v46 = v38;
  uint64_t v47 = v22;
  uint64_t v48 = v39;
  uint64_t v29 = _s9VItemCellVMa();
  uint64_t v30 = sub_22D685880(v29);
  uint64_t v32 = v31;
  LOWORD(v22) = v33;
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v19, v26, v16);
  uint64_t v45 = v30;
  uint64_t v46 = v32;
  LOWORD(v47) = v22 & 0x101;
  v44[0] = v19;
  v44[1] = &v45;
  v43[0] = v16;
  v43[1] = &_s12CellSubtitleVN;
  uint64_t v41 = v25;
  unint64_t v42 = sub_22D678678();
  sub_22D634638((uint64_t)v44, 2, (uint64_t)v43);
  v28(v26, v16);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v28)(v19, v16);
}

uint64_t sub_22D685880(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t *)(v6 + *(int *)(v2 + 60));
  if (v7[1])
  {
    uint64_t v8 = *v7;
  }
  else
  {
    (*(void (**)(char *))(v3 + 16))(v5);
    uint64_t v8 = sub_22D640E30((uint64_t)v5, 0, 0, v1);
  }
  swift_bridgeObjectRetain();
  return v8;
}

BOOL sub_22D685998(double a1, double a2, double a3, double a4, double a5, double a6)
{
  BOOL v6 = a1 == a4;
  if (a2 != a5) {
    BOOL v6 = 0;
  }
  return a3 == a6 && v6;
}

uint64_t sub_22D6859B4()
{
  return sub_22D6CD658();
}

uint64_t sub_22D685A14()
{
  return sub_22D6CD668();
}

BOOL sub_22D685AA4(double *a1, double *a2)
{
  return sub_22D685998(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

uint64_t sub_22D685AC4()
{
  return sub_22D685A14();
}

uint64_t sub_22D685ADC()
{
  return sub_22D6859B4();
}

uint64_t sub_22D685AF4()
{
  return sub_22D6CD668();
}

uint64_t sub_22D685B48()
{
  return sub_22D685BF0((uint64_t (*)(void, void, void, void, void))sub_22D683264);
}

uint64_t sub_22D685B60()
{
  return sub_22D685BF0((uint64_t (*)(void, void, void, void, void))sub_22D6846A0);
}

uint64_t sub_22D685B78(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22D685BC0()
{
  return sub_22D685BF0((uint64_t (*)(void, void, void, void, void))sub_22D684A8C);
}

uint64_t sub_22D685BD8()
{
  return sub_22D685BF0((uint64_t (*)(void, void, void, void, void))sub_22D6854A8);
}

uint64_t sub_22D685BF0(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t _s9VItemCellV9ConstantsVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D685C20()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D686048()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D686064@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v13 = sub_22D6CA508();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*v6 & 0x8000000000000000) != 0)
  {
    uint64_t v21 = a1;
    MEMORY[0x270FA5388](v15);
    v20[-2] = a4;
    v20[-1] = a5;
    sub_22D6CD0E8();
    sub_22D6CA448();
    swift_getWitnessTable();
    uint64_t v19 = sub_22D6CCFC8();
    sub_22D686CC8(v19);
    sub_22D6CA4B8();
    return sub_22D6CA4C8();
  }
  else
  {
    v20[1] = a2;
    uint64_t v21 = a1;
    MEMORY[0x270FA5388](v15);
    v20[-2] = a4;
    v20[-1] = a5;
    sub_22D6CD0E8();
    sub_22D6CCAC8();
    swift_getWitnessTable();
    uint64_t v21 = sub_22D6CCFC8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857DB50);
    sub_22D686EBC();
    sub_22D6CA4D8();
    if ((a3 & 1) == 0) {
      sub_22D6CA4C8();
    }
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a6, v17, v13);
  }
}

uint64_t static MusicPicker.Reason.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  if ((*a1 & 0x8000000000000000) == 0)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      sub_22D6CA6C8();
      sub_22D639C44(v3);
      sub_22D639C44(v2);
      char v4 = sub_22D6CA678();
      sub_22D639B2C(v2);
      sub_22D639B2C(v3);
      return v4 & 1;
    }
    swift_retain();
    goto LABEL_7;
  }
  if ((v3 & 0x8000000000000000) == 0)
  {
LABEL_7:
    sub_22D639C44(v3);
    sub_22D639B2C(v2);
    sub_22D639B2C(v3);
    char v6 = 0;
    return v6 & 1;
  }
  sub_22D639B2C(*a1);
  sub_22D639B2C(v3);
  char v6 = ((v2 & 1) == 0) ^ v3;
  return v6 & 1;
}

BOOL static MusicPicker.Reason.PlaybackSessionAttributes.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t MusicPicker.Reason.hash(into:)()
{
  if ((*v0 & 0x8000000000000000) != 0)
  {
    sub_22D6CD638();
    return sub_22D6CD648();
  }
  else
  {
    sub_22D6CD638();
    sub_22D6CA6C8();
    sub_22D686F2C(&qword_26857DB38, MEMORY[0x263F56A50]);
    return sub_22D6CCE18();
  }
}

uint64_t MusicPicker.Reason.hashValue.getter()
{
  uint64_t v1 = *v0;
  sub_22D6CD628();
  sub_22D6CD638();
  if (v1 < 0)
  {
    sub_22D6CD648();
  }
  else
  {
    sub_22D6CA6C8();
    sub_22D686F2C(&qword_26857DB38, MEMORY[0x263F56A50]);
    sub_22D6CCE18();
  }
  return sub_22D6CD668();
}

uint64_t sub_22D686548()
{
  uint64_t v1 = *v0;
  sub_22D6CD628();
  sub_22D6CD638();
  if (v1 < 0)
  {
    sub_22D6CD648();
  }
  else
  {
    sub_22D6CA6C8();
    sub_22D686F2C(&qword_26857DB38, MEMORY[0x263F56A50]);
    sub_22D6CCE18();
  }
  return sub_22D6CD668();
}

uint64_t MusicPicker.Reason.PlaybackSessionAttributes.init(isCollaborative:)@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t MusicPicker.Reason.PlaybackSessionAttributes.isCollaborative.getter()
{
  return *v0;
}

uint64_t MusicPicker.Reason.PlaybackSessionAttributes.hash(into:)()
{
  return sub_22D6CD648();
}

uint64_t MusicPicker.Reason.PlaybackSessionAttributes.hashValue.getter()
{
  return sub_22D6CD668();
}

uint64_t sub_22D686690()
{
  return sub_22D6CD668();
}

unint64_t sub_22D6866D8()
{
  unint64_t result = qword_26857DB40;
  if (!qword_26857DB40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857DB40);
  }
  return result;
}

unint64_t sub_22D686728()
{
  unint64_t result = qword_26857DB48;
  if (!qword_26857DB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857DB48);
  }
  return result;
}

uint64_t *_s6ReasonOwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  sub_22D639C44(*a2);
  *a1 = v3;
  return a1;
}

uint64_t _s6ReasonOwxx(uint64_t *a1)
{
  return sub_22D639B2C(*a1);
}

uint64_t *_s6ReasonOwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  sub_22D639C44(*a2);
  uint64_t v4 = *a1;
  *a1 = v3;
  sub_22D639B2C(v4);
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t *_s6ReasonOwta(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;
  sub_22D639B2C(v3);
  return a1;
}

uint64_t _s6ReasonOwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x3F && *(unsigned char *)(a1 + 8))
    {
      unsigned int v2 = *(_DWORD *)a1 + 62;
    }
    else
    {
      unsigned int v2 = (*(void *)a1 & 6 | ((*(void *)a1 >> 58) >> 5) & 0xFFFFFFC7 | (8
                                                                                         * (((*(void *)a1 >> 58) >> 2) & 7))) ^ 0x3F;
      if (v2 >= 0x3E) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t _s6ReasonOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3E)
  {
    *(void *)unint64_t result = a2 - 63;
    if (a3 >= 0x3F) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3F) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 1) & 0x1F | (32 * (-a2 & 0x3F));
      *(void *)unint64_t result = ((v3 << 58) | (2 * v3)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_22D6868D4(void *a1)
{
  return *a1 >> 63;
}

void *sub_22D6868E0(void *result)
{
  *result &= ~0x8000000000000000;
  return result;
}

uint64_t *sub_22D6868F0(uint64_t *result, uint64_t a2)
{
  *unint64_t result = *result & 0xFFFFFFFFFFFFFF9 | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for MusicPicker.Reason()
{
  return &type metadata for MusicPicker.Reason;
}

uint64_t _s6ReasonO25PlaybackSessionAttributesVwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s6ReasonO25PlaybackSessionAttributesVwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22D686A7CLL);
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

ValueMetadata *type metadata accessor for MusicPicker.Reason.PlaybackSessionAttributes()
{
  return &type metadata for MusicPicker.Reason.PlaybackSessionAttributes;
}

uint64_t sub_22D686AB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857CF28);
  MEMORY[0x270FA5388](v2 - 8);
  unsigned int v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_22D6CCA28();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v15[-v10];
  sub_22D6CA338();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    sub_22D686F74((uint64_t)v4);
    uint64_t v12 = 1;
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 32))(v11, v4, v5);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16))(v9, v11, v5);
    v15[31] = 4;
    sub_22D664084();
    sub_22D6CA438();
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);
    uint64_t v12 = 0;
  }
  uint64_t v13 = sub_22D6CA448();
  return __swift_storeEnumTagSinglePayload(a1, v12, 1, v13);
}

uint64_t sub_22D686CC8(uint64_t a1)
{
  uint64_t v2 = sub_22D6CA448();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v19 - v7;
  sub_22D686F2C(&qword_26857CF40, MEMORY[0x263F569B0]);
  uint64_t v9 = sub_22D6CD198();
  uint64_t v20 = v9;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v12 = v13;
    unint64_t v14 = (*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64);
    uint64_t v19 = a1;
    uint64_t v15 = a1 + v14;
    uint64_t v16 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v15, v2);
      sub_22D665ECC();
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v15 += v16;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
    return v20;
  }
  else
  {
    uint64_t v17 = v9;
    swift_bridgeObjectRelease();
  }
  return v17;
}

uint64_t sub_22D686E88()
{
  return sub_22D6CA348();
}

unint64_t sub_22D686EBC()
{
  unint64_t result = qword_26857DB58[0];
  if (!qword_26857DB58[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DB50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26857DB58);
  }
  return result;
}

uint64_t sub_22D686F10@<X0>(uint64_t a1@<X8>)
{
  return sub_22D686AB4(a1);
}

uint64_t sub_22D686F2C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22D686F74(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857CF28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 sub_22D686FD8@<Q0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  char v16 = *a2;
  __n128 v28 = *(__n128 *)(a2 + 8);
  uint64_t v17 = *((void *)a2 + 3);
  uint64_t v18 = (int *)_s13ItemShelfCellVMa();
  uint64_t v19 = (uint64_t *)(a9 + v18[18]);
  _s9ViewModelCMa();
  swift_getWitnessTable();
  uint64_t *v19 = sub_22D6CB198();
  v19[1] = v20;
  uint64_t v21 = (uint64_t *)(a9 + v18[19]);
  *uint64_t v21 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(qword_26857D320);
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = (_OWORD *)(a9 + v18[20]);
  *uint64_t v22 = xmmword_22D6CEA10;
  v22[1] = xmmword_22D6D2290;
  v22[2] = xmmword_22D6D14D0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a13 - 8) + 32))(a9, a1, a13);
  uint64_t v23 = a9 + v18[13];
  *(unsigned char *)uint64_t v23 = v16;
  __n128 result = v28;
  *(__n128 *)(v23 + 8) = v28;
  *(void *)(v23 + 24) = v17;
  uint64_t v25 = (void *)(a9 + v18[14]);
  *uint64_t v25 = a3;
  v25[1] = a4;
  *(unsigned char *)(a9 + v18[15]) = a5;
  uint64_t v26 = a9 + v18[16];
  *(void *)uint64_t v26 = a6;
  *(unsigned char *)(v26 + 8) = a7 & 1;
  uint64_t v27 = (void *)(a9 + v18[17]);
  *uint64_t v27 = a8;
  v27[1] = a10;
  v27[2] = a11;
  return result;
}

uint64_t _s13ItemShelfCellVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D6871D8()
{
  return sub_22D69A7DC();
}

uint64_t sub_22D6871FC()
{
  return sub_22D69A7DC();
}

uint64_t sub_22D687220(uint64_t a1)
{
  sub_22D6CB078();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return sub_22D69A824((uint64_t)v4);
}

double sub_22D6872C8()
{
  return 1.0;
}

uint64_t sub_22D6872D4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(qword_26857DBE0);
  MEMORY[0x230F88070](&v2, v0);
  return v2;
}

void sub_22D68732C()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_22D66C294();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_22D687434(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_22D6CB078();
  uint64_t v9 = *(void *)(v8 - 8);
  int v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v10 & 0xF8 | 7;
  if (*(void *)(v9 + 64) <= 8uLL) {
    uint64_t v12 = 8;
  }
  else {
    uint64_t v12 = *(void *)(v9 + 64);
  }
  uint64_t v13 = v12 + 8;
  int v14 = v10 | *(_DWORD *)(v6 + 80);
  if ((v14 & 0x1000F8) != 0
    || ((v12
       + 8
       + ((v11 + ((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 79) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v11)) & 0xFFFFFFFFFFFFFFF8)
     + 48 > 0x18)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + (((v14 & 0xF8 | 7u) + 16) & ~(unint64_t)(v14 & 0xF8 | 7u)));
    swift_retain();
  }
  else
  {
    uint64_t v43 = v8;
    uint64_t v44 = *(void *)(v8 - 8);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    unint64_t v17 = ((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v18 = ((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v17 = *(unsigned char *)v18;
    *(void *)(v17 + 8) = *(void *)(v18 + 8);
    *(void *)(v17 + 16) = *(void *)(v18 + 16);
    unint64_t v19 = *(void *)(v18 + 24);
    swift_bridgeObjectRetain();
    sub_22D5DB288(v19);
    *(void *)(v17 + 24) = v19;
    unint64_t v20 = (v17 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v21 = (v18 + 39) & 0xFFFFFFFFFFFFFFF8;
    *(void *)unint64_t v20 = *(void *)v21;
    *(void *)(v20 + 8) = *(void *)(v21 + 8);
    *(unsigned char *)(v20 + 16) = *(unsigned char *)(v21 + 16);
    unint64_t v22 = (v17 + 63) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v23 = (v18 + 63) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v24 = *(void *)v23;
    *(unsigned char *)(v22 + 8) = *(unsigned char *)(v23 + 8);
    *(void *)unint64_t v22 = v24;
    uint64_t v25 = (void *)((v17 + 79) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v26 = (void *)((v18 + 79) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v25 = *v26;
    v25[1] = v26[1];
    v25[2] = v26[2];
    uint64_t v27 = (void *)(((unint64_t)v25 + 31) & 0xFFFFFFFFFFFFFFF8);
    __n128 v28 = (void *)(((unint64_t)v26 + 31) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v27 = *v28;
    v27[1] = v28[1];
    uint64_t v29 = (void *)(((unint64_t)v27 + v11 + 16) & ~v11);
    uint64_t v30 = (unsigned __int8 *)(((unint64_t)v28 + v11 + 16) & ~v11);
    unsigned int v31 = v30[v12];
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    if (v31 < 2)
    {
      uint64_t v33 = v44;
    }
    else
    {
      if (v12 <= 3) {
        uint64_t v32 = v12;
      }
      else {
        uint64_t v32 = 4;
      }
      uint64_t v33 = v44;
      switch(v32)
      {
        case 1:
          int v34 = *v30;
          goto LABEL_20;
        case 2:
          int v34 = *(unsigned __int16 *)v30;
          goto LABEL_20;
        case 3:
          int v34 = *(unsigned __int16 *)v30 | (v30[2] << 16);
          goto LABEL_20;
        case 4:
          int v34 = *(_DWORD *)v30;
LABEL_20:
          int v35 = (v34 | ((v31 - 2) << (8 * v12))) + 2;
          unsigned int v36 = v34 + 2;
          if (v12 >= 4) {
            unsigned int v31 = v36;
          }
          else {
            unsigned int v31 = v35;
          }
          break;
        default:
          break;
      }
    }
    if (v31 == 1)
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v33 + 16))(v29, v30, v43);
      char v37 = 1;
    }
    else
    {
      *uint64_t v29 = *(void *)v30;
      swift_retain();
      char v37 = 0;
    }
    *((unsigned char *)v29 + v12) = v37;
    uint64_t v38 = (_OWORD *)(((unint64_t)v29 + v13) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v39 = (long long *)((unint64_t)&v30[v13] & 0xFFFFFFFFFFFFFFF8);
    long long v40 = *v39;
    long long v41 = v39[2];
    v38[1] = v39[1];
    v38[2] = v41;
    *uint64_t v38 = v40;
  }
  return a1;
}

uint64_t sub_22D6877C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = (a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v4 + 24));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = *(void *)(sub_22D6CB078() - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80) & 0xF8 | 7;
  uint64_t v7 = (unsigned __int8 *)((((((v4 + 79) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + v6 + 16) & ~v6);
  unint64_t v8 = *(void *)(v5 + 64);
  if (v8 <= 8) {
    unint64_t v8 = 8;
  }
  unsigned int v9 = v7[v8];
  unsigned int v10 = v9 - 2;
  if (v9 >= 2)
  {
    if (v8 <= 3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *v7;
        goto LABEL_12;
      case 2:
        int v12 = *(unsigned __int16 *)v7;
        goto LABEL_12;
      case 3:
        int v12 = *(unsigned __int16 *)v7 | (v7[2] << 16);
        goto LABEL_12;
      case 4:
        int v12 = *(_DWORD *)v7;
LABEL_12:
        int v13 = (v12 | (v10 << (8 * v8))) + 2;
        unsigned int v9 = v12 + 2;
        if (v8 < 4) {
          unsigned int v9 = v13;
        }
        break;
      default:
        break;
    }
  }
  if (v9 == 1)
  {
    int v14 = *(uint64_t (**)(void))(v5 + 8);
    return v14();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_22D6879B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  uint64_t v39 = a1;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v7 = *(unsigned char *)v8;
  *(void *)(v7 + 8) = *(void *)(v8 + 8);
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  unint64_t v9 = *(void *)(v8 + 24);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v9);
  *(void *)(v7 + 24) = v9;
  unint64_t v10 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v11 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v10 = *(void *)v11;
  *(void *)(v10 + 8) = *(void *)(v11 + 8);
  *(unsigned char *)(v10 + 16) = *(unsigned char *)(v11 + 16);
  unint64_t v12 = (v7 + 63) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = (v8 + 63) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  *(void *)unint64_t v12 = v14;
  uint64_t v15 = (void *)((v7 + 79) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)((v8 + 79) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  v15[2] = v16[2];
  unint64_t v17 = (void *)(((unint64_t)v15 + 31) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = (void *)(((unint64_t)v16 + 31) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v17 = *v18;
  v17[1] = v18[1];
  uint64_t v19 = sub_22D6CB078();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(_DWORD *)(v20 + 80) & 0xF8;
  uint64_t v22 = v21 + 23;
  unint64_t v23 = (unint64_t)v17 + v21 + 23;
  unint64_t v24 = ~v21 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v25 = (void *)(v23 & v24);
  uint64_t v26 = (unsigned __int8 *)(((unint64_t)v18 + v22) & v24);
  if (*(void *)(v20 + 64) <= 8uLL) {
    uint64_t v27 = 8;
  }
  else {
    uint64_t v27 = *(void *)(*(void *)(v19 - 8) + 64);
  }
  unsigned int v28 = v26[v27];
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v28 >= 2)
  {
    if (v27 <= 3) {
      uint64_t v29 = v27;
    }
    else {
      uint64_t v29 = 4;
    }
    switch(v29)
    {
      case 1:
        int v30 = *v26;
        goto LABEL_13;
      case 2:
        int v30 = *(unsigned __int16 *)v26;
        goto LABEL_13;
      case 3:
        int v30 = *(unsigned __int16 *)v26 | (v26[2] << 16);
        goto LABEL_13;
      case 4:
        int v30 = *(_DWORD *)v26;
LABEL_13:
        int v31 = (v30 | ((v28 - 2) << (8 * v27))) + 2;
        unsigned int v32 = v30 + 2;
        if (v27 >= 4) {
          unsigned int v28 = v32;
        }
        else {
          unsigned int v28 = v31;
        }
        break;
      default:
        break;
    }
  }
  if (v28 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v20 + 16))(v25, v26, v19);
    char v33 = 1;
  }
  else
  {
    *uint64_t v25 = *(void *)v26;
    swift_retain();
    char v33 = 0;
  }
  *((unsigned char *)v25 + v27) = v33;
  int v34 = (_OWORD *)(((unint64_t)v25 + v27 + 8) & 0xFFFFFFFFFFFFFFF8);
  int v35 = (long long *)((unint64_t)&v26[v27 + 8] & 0xFFFFFFFFFFFFFFF8);
  long long v36 = *v35;
  long long v37 = v35[2];
  v34[1] = v35[1];
  v34[2] = v37;
  *int v34 = v36;
  return v39;
}

uint64_t sub_22D687C94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v7 = *(unsigned char *)v8;
  *(void *)(v7 + 8) = *(void *)(v8 + 8);
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v9 = *(void *)(v8 + 24);
  sub_22D5DB288(v9);
  unint64_t v10 = *(void *)(v7 + 24);
  *(void *)(v7 + 24) = v9;
  sub_22D5DB9FC(v10);
  unint64_t v11 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v12 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v11 = *(void *)v12;
  *(void *)(v11 + 8) = *(void *)(v12 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v11 + 16) = *(unsigned char *)(v12 + 16);
  unint64_t v13 = (v7 + 63) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v8 + 63) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  *(void *)unint64_t v13 = v15;
  uint64_t v16 = (void *)((v7 + 79) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v17 = (void *)((v8 + 79) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v16 = *v17;
  swift_retain();
  swift_release();
  v16[1] = v17[1];
  swift_retain();
  swift_release();
  v16[2] = v17[2];
  unint64_t v18 = (void *)(((unint64_t)v16 + 31) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (void *)(((unint64_t)v17 + 31) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v18 = *v19;
  swift_retain();
  swift_release();
  v18[1] = v19[1];
  uint64_t v20 = sub_22D6CB078();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(_DWORD *)(v21 + 80) & 0xF8;
  uint64_t v23 = v22 + 23;
  unint64_t v24 = (unint64_t)v18 + v22 + 23;
  unint64_t v25 = ~v22 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = v24 & v25;
  unint64_t v27 = ((unint64_t)v19 + v23) & v25;
  if (*(void *)(v21 + 64) <= 8uLL) {
    uint64_t v28 = 8;
  }
  else {
    uint64_t v28 = *(void *)(*(void *)(v20 - 8) + 64);
  }
  if (v26 != v27)
  {
    uint64_t v29 = v20;
    unsigned int v30 = *(unsigned __int8 *)(v26 + v28);
    unsigned int v31 = v30 - 2;
    if (v30 >= 2)
    {
      if (v28 <= 3) {
        uint64_t v32 = v28;
      }
      else {
        uint64_t v32 = 4;
      }
      switch(v32)
      {
        case 1:
          int v33 = *(unsigned __int8 *)v26;
          goto LABEL_14;
        case 2:
          int v33 = *(unsigned __int16 *)v26;
          goto LABEL_14;
        case 3:
          int v33 = *(unsigned __int16 *)(v24 & v25) | (*(unsigned __int8 *)((v24 & v25) + 2) << 16);
          goto LABEL_14;
        case 4:
          int v33 = *(_DWORD *)v26;
LABEL_14:
          int v34 = (v33 | (v31 << (8 * v28))) + 2;
          unsigned int v30 = v33 + 2;
          if (v28 < 4) {
            unsigned int v30 = v34;
          }
          break;
        default:
          break;
      }
    }
    if (v30 == 1) {
      (*(void (**)(unint64_t, uint64_t))(v21 + 8))(v26, v20);
    }
    else {
      swift_release();
    }
    unsigned int v35 = *(unsigned __int8 *)(v27 + v28);
    unsigned int v36 = v35 - 2;
    if (v35 >= 2)
    {
      if (v28 <= 3) {
        uint64_t v37 = v28;
      }
      else {
        uint64_t v37 = 4;
      }
      switch(v37)
      {
        case 1:
          int v38 = *(unsigned __int8 *)v27;
          goto LABEL_28;
        case 2:
          int v38 = *(unsigned __int16 *)v27;
          goto LABEL_28;
        case 3:
          int v38 = *(unsigned __int16 *)v27 | (*(unsigned __int8 *)(v27 + 2) << 16);
          goto LABEL_28;
        case 4:
          int v38 = *(_DWORD *)v27;
LABEL_28:
          int v39 = (v38 | (v36 << (8 * v28))) + 2;
          unsigned int v35 = v38 + 2;
          if (v28 < 4) {
            unsigned int v35 = v39;
          }
          break;
        default:
          break;
      }
    }
    if (v35 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v21 + 16))(v26, v27, v29);
      *(unsigned char *)(v26 + v28) = 1;
    }
    else
    {
      *(void *)unint64_t v26 = *(void *)v27;
      *(unsigned char *)(v26 + v28) = 0;
      swift_retain();
    }
  }
  long long v40 = (void *)(((v26 | 7) + v28 + 1) & 0xFFFFFFFFFFFFFFF8);
  long long v41 = (void *)(((v27 | 7) + v28 + 1) & 0xFFFFFFFFFFFFFFF8);
  *long long v40 = *v41;
  v40[1] = v41[1];
  v40[2] = v41[2];
  v40[3] = v41[3];
  v40[4] = v41[4];
  v40[5] = v41[5];
  return a1;
}

uint64_t sub_22D68807C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  long long v9 = v8[1];
  *unint64_t v7 = *v8;
  v7[1] = v9;
  unint64_t v10 = ((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v11 = ((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)unint64_t v10 = *(_OWORD *)v11;
  *(unsigned char *)(v10 + 16) = *(unsigned char *)(v11 + 16);
  unint64_t v12 = ((unint64_t)v7 + 63) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = ((unint64_t)v8 + 63) & 0xFFFFFFFFFFFFFFF8;
  char v14 = *(unsigned char *)(v13 + 8);
  *(void *)unint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = v14;
  unint64_t v15 = ((unint64_t)v7 + 79) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = ((unint64_t)v8 + 79) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = *(void *)(v16 + 16);
  *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
  *(void *)(v15 + 16) = v17;
  unint64_t v18 = (_OWORD *)((v15 + 31) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (_OWORD *)((v16 + 31) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v18 = *v19;
  uint64_t v20 = sub_22D6CB078();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(_DWORD *)(v21 + 80) & 0xF8;
  uint64_t v23 = v22 + 23;
  unint64_t v24 = (unint64_t)v18 + v22 + 23;
  unint64_t v25 = ~v22 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (void *)(v24 & v25);
  unint64_t v27 = (unsigned __int8 *)(((unint64_t)v19 + v23) & v25);
  if (*(void *)(v21 + 64) <= 8uLL) {
    uint64_t v28 = 8;
  }
  else {
    uint64_t v28 = *(void *)(*(void *)(v20 - 8) + 64);
  }
  unsigned int v29 = v27[v28];
  unsigned int v30 = v29 - 2;
  if (v29 >= 2)
  {
    if (v28 <= 3) {
      uint64_t v31 = v28;
    }
    else {
      uint64_t v31 = 4;
    }
    switch(v31)
    {
      case 1:
        int v32 = *v27;
        goto LABEL_13;
      case 2:
        int v32 = *(unsigned __int16 *)v27;
        goto LABEL_13;
      case 3:
        int v32 = *(unsigned __int16 *)v27 | (v27[2] << 16);
        goto LABEL_13;
      case 4:
        int v32 = *(_DWORD *)v27;
LABEL_13:
        int v33 = (v32 | (v30 << (8 * v28))) + 2;
        unsigned int v29 = v32 + 2;
        if (v28 < 4) {
          unsigned int v29 = v33;
        }
        break;
      default:
        break;
    }
  }
  if (v29 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v21 + 32))(v26, v27, v20);
    char v34 = 1;
  }
  else
  {
    char v34 = 0;
    *unint64_t v26 = *(void *)v27;
  }
  *((unsigned char *)v26 + v28) = v34;
  unsigned int v35 = (_OWORD *)(((unint64_t)v26 + v28 + 8) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v36 = (long long *)((unint64_t)&v27[v28 + 8] & 0xFFFFFFFFFFFFFFF8);
  long long v37 = *v36;
  long long v38 = v36[2];
  v35[1] = v36[1];
  v35[2] = v38;
  *unsigned int v35 = v37;
  return a1;
}

uint64_t sub_22D6882D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v7 = *(unsigned char *)v8;
  *(void *)(v7 + 8) = *(void *)(v8 + 8);
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  swift_bridgeObjectRelease();
  unint64_t v9 = *(void *)(v7 + 24);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  sub_22D5DB9FC(v9);
  unint64_t v10 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v11 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v10 = *(void *)v11;
  *(void *)(v10 + 8) = *(void *)(v11 + 8);
  swift_bridgeObjectRelease();
  *(unsigned char *)(v10 + 16) = *(unsigned char *)(v11 + 16);
  unint64_t v12 = (v7 + 63) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = (v8 + 63) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  *(void *)unint64_t v12 = v14;
  unint64_t v15 = (void *)((v7 + 79) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v16 = (void *)((v8 + 79) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v15 = *v16;
  swift_release();
  v15[1] = v16[1];
  swift_release();
  v15[2] = v16[2];
  uint64_t v17 = (void *)(((unint64_t)v15 + 31) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = (void *)(((unint64_t)v16 + 31) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v17 = *v18;
  swift_release();
  v17[1] = v18[1];
  uint64_t v19 = sub_22D6CB078();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(_DWORD *)(v20 + 80) & 0xF8;
  uint64_t v22 = v21 + 23;
  unint64_t v23 = (unint64_t)v17 + v21 + 23;
  unint64_t v24 = ~v21 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = v23 & v24;
  unint64_t v26 = ((unint64_t)v18 + v22) & v24;
  if (*(void *)(v20 + 64) <= 8uLL) {
    uint64_t v27 = 8;
  }
  else {
    uint64_t v27 = *(void *)(*(void *)(v19 - 8) + 64);
  }
  if (v25 != v26)
  {
    uint64_t v28 = v19;
    unsigned int v29 = *(unsigned __int8 *)(v25 + v27);
    unsigned int v30 = v29 - 2;
    if (v29 >= 2)
    {
      if (v27 <= 3) {
        uint64_t v31 = v27;
      }
      else {
        uint64_t v31 = 4;
      }
      switch(v31)
      {
        case 1:
          int v32 = *(unsigned __int8 *)v25;
          goto LABEL_14;
        case 2:
          int v32 = *(unsigned __int16 *)v25;
          goto LABEL_14;
        case 3:
          int v32 = *(unsigned __int16 *)(v23 & v24) | (*(unsigned __int8 *)((v23 & v24) + 2) << 16);
          goto LABEL_14;
        case 4:
          int v32 = *(_DWORD *)v25;
LABEL_14:
          int v33 = (v32 | (v30 << (8 * v27))) + 2;
          unsigned int v29 = v32 + 2;
          if (v27 < 4) {
            unsigned int v29 = v33;
          }
          break;
        default:
          break;
      }
    }
    if (v29 == 1) {
      (*(void (**)(unint64_t, uint64_t))(v20 + 8))(v25, v19);
    }
    else {
      swift_release();
    }
    unsigned int v34 = *(unsigned __int8 *)(v26 + v27);
    unsigned int v35 = v34 - 2;
    if (v34 >= 2)
    {
      if (v27 <= 3) {
        uint64_t v36 = v27;
      }
      else {
        uint64_t v36 = 4;
      }
      switch(v36)
      {
        case 1:
          int v37 = *(unsigned __int8 *)v26;
          goto LABEL_28;
        case 2:
          int v37 = *(unsigned __int16 *)v26;
          goto LABEL_28;
        case 3:
          int v37 = *(unsigned __int16 *)v26 | (*(unsigned __int8 *)(v26 + 2) << 16);
          goto LABEL_28;
        case 4:
          int v37 = *(_DWORD *)v26;
LABEL_28:
          int v38 = (v37 | (v35 << (8 * v27))) + 2;
          unsigned int v34 = v37 + 2;
          if (v27 < 4) {
            unsigned int v34 = v38;
          }
          break;
        default:
          break;
      }
    }
    if (v34 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v20 + 32))(v25, v26, v28);
      char v39 = 1;
    }
    else
    {
      char v39 = 0;
      *(void *)unint64_t v25 = *(void *)v26;
    }
    *(unsigned char *)(v25 + v27) = v39;
  }
  long long v40 = (void *)(((v25 | 7) + v27 + 1) & 0xFFFFFFFFFFFFFFF8);
  long long v41 = (void *)(((v26 | 7) + v27 + 1) & 0xFFFFFFFFFFFFFFF8);
  *long long v40 = *v41;
  v40[1] = v41[1];
  v40[2] = v41[2];
  v40[3] = v41[3];
  v40[4] = v41[4];
  v40[5] = v41[5];
  return a1;
}

uint64_t sub_22D688688(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(sub_22D6CB078() - 8);
  uint64_t v10 = 8;
  if (*(void *)(v9 + 64) > 8uLL) {
    uint64_t v10 = *(void *)(v9 + 64);
  }
  uint64_t v11 = *(void *)(v6 + 64);
  if (!a2) {
    return 0;
  }
  if (v8 < a2)
  {
    uint64_t v12 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
    unint64_t v13 = ((v10
          + ((v12
            + ((((((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 79) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8)
            + 16) & ~v12)
          + 8) & 0xFFFFFFFFFFFFFFF8)
        + 48;
    uint64_t v14 = v13 & 0xFFFFFFF8;
    if ((v13 & 0xFFFFFFF8) != 0) {
      unsigned int v15 = 2;
    }
    else {
      unsigned int v15 = a2 - v8 + 1;
    }
    if (v15 >= 0x10000) {
      unsigned int v16 = 4;
    }
    else {
      unsigned int v16 = 2;
    }
    if (v15 < 0x100) {
      unsigned int v16 = 1;
    }
    if (v15 >= 2) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    switch(v17)
    {
      case 1:
        int v18 = *((unsigned __int8 *)a1 + v13);
        if (!v18) {
          break;
        }
        goto LABEL_24;
      case 2:
        int v18 = *(unsigned __int16 *)((char *)a1 + v13);
        if (v18) {
          goto LABEL_24;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x22D6888B8);
      case 4:
        int v18 = *(_DWORD *)((char *)a1 + v13);
        if (!v18) {
          break;
        }
LABEL_24:
        int v20 = v18 - 1;
        if (v14)
        {
          int v20 = 0;
          LODWORD(v14) = *a1;
        }
        return v8 + (v14 | v20) + 1;
      default:
        break;
    }
  }
  if (v7 < 0x7FFFFFFF)
  {
    unint64_t v21 = *(void *)((((((unint64_t)a1 + v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 79) & 0xFFFFFFFFFFFFFFF8) + 8);
    if (v21 >= 0xFFFFFFFF) {
      LODWORD(v21) = -1;
    }
    return (v21 + 1);
  }
  else
  {
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v7, v5);
  }
}

void sub_22D6888CC(_DWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v11 = *(void *)(sub_22D6CB078() - 8);
  uint64_t v12 = 8;
  if (*(void *)(v11 + 64) > 8uLL) {
    uint64_t v12 = *(void *)(v11 + 64);
  }
  uint64_t v13 = *(void *)(v8 + 64);
  uint64_t v14 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  size_t v15 = ((v12
        + ((v14 + ((((((v13 + 7) & 0xFFFFFFFFFFFFFFF8) + 79) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v14)
        + 8) & 0xFFFFFFFFFFFFFFF8)
      + 48;
  if (v10 >= a3)
  {
    int v18 = 0;
  }
  else
  {
    if (((v12
         + ((v14 + ((((((v13 + 7) & 0xFFFFFFF8) + 79) & 0xFFFFFFF8) + 31) & 0xFFFFFFF8) + 16) & ~v14)
         + 8) & 0xFFFFFFF8) == 0xFFFFFFD0)
      unsigned int v16 = a3 - v10 + 1;
    else {
      unsigned int v16 = 2;
    }
    if (v16 >= 0x10000) {
      int v17 = 4;
    }
    else {
      int v17 = 2;
    }
    if (v16 < 0x100) {
      int v17 = 1;
    }
    if (v16 >= 2) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
  }
  if (a2 > v10)
  {
    if (v15) {
      int v19 = 1;
    }
    else {
      int v19 = a2 - v10;
    }
    if (v15)
    {
      bzero(a1, v15);
      *a1 = ~v10 + a2;
    }
    switch(v18)
    {
      case 1:
        *((unsigned char *)a1 + v15) = v19;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v15) = v19;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)((char *)a1 + v15) = v19;
        return;
      default:
        return;
    }
  }
  switch(v18)
  {
    case 1:
      *((unsigned char *)a1 + v15) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_34;
    case 2:
      *(_WORD *)((char *)a1 + v15) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_34;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x22D688B54);
    case 4:
      *(_DWORD *)((char *)a1 + v15) = 0;
      goto LABEL_33;
    default:
LABEL_33:
      if (a2)
      {
LABEL_34:
        if (v9 < 0x7FFFFFFF)
        {
          int v20 = (void *)(((((unint64_t)a1 + v13 + 7) & 0xFFFFFFFFFFFFFFF8) + 79) & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            v20[1] = 0;
            v20[2] = 0;
            *int v20 = a2 ^ 0x80000000;
          }
          else
          {
            v20[1] = (a2 - 1);
          }
        }
        else
        {
          __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v9, v7);
        }
      }
      return;
  }
}

uint64_t sub_22D688B7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D688BC0(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(v1 + *(int *)(a1 + 60));
  char v3 = 1;
  char v4 = 0;
  switch(v2)
  {
    case 1:
      goto LABEL_3;
    case 5:
      return v4 & 1;
    default:
      char v3 = sub_22D6CD5A8();
LABEL_3:
      swift_bridgeObjectRelease();
      char v4 = v3;
      break;
  }
  return v4 & 1;
}

uint64_t sub_22D688CC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v128 = a2;
  uint64_t v136 = sub_22D6CB578();
  OUTLINED_FUNCTION_0_0();
  uint64_t v127 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_44(v5);
  OUTLINED_FUNCTION_0_0();
  uint64_t v139 = v6;
  uint64_t v131 = *(char **)(v7 + 64);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_44((uint64_t)&v96 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = *(void *)(a1 + 16);
  OUTLINED_FUNCTION_0_0();
  uint64_t v130 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_44(v13);
  unint64_t v15 = *(void *)(a1 + 32);
  uint64_t v133 = *(void *)(a1 + 24);
  uint64_t v14 = v133;
  uint64_t v132 = v15;
  _s11ArtworkViewVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  uint64_t v16 = OUTLINED_FUNCTION_8_7();
  uint64_t v137 = *(void *)(a1 + 40);
  uint64_t v17 = v137;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v155 = MEMORY[0x263F18880];
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v19 = MEMORY[0x263F18C10];
  uint64_t v152 = v18;
  uint64_t v153 = MEMORY[0x263F18C10];
  uint64_t v150 = OUTLINED_FUNCTION_6_7();
  uint64_t v151 = v19;
  uint64_t v109 = v16;
  uint64_t v108 = swift_getWitnessTable();
  uint64_t v144 = v10;
  uint64_t v145 = v14;
  uint64_t v146 = v16;
  unint64_t v147 = v15;
  uint64_t v148 = v17;
  uint64_t v149 = v108;
  uint64_t v20 = _s9HItemCellVMa();
  OUTLINED_FUNCTION_0_0();
  uint64_t v120 = v21;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_44(v23);
  uint64_t v107 = v20;
  uint64_t v24 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v123 = v25;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_44(v27);
  uint64_t v112 = v24;
  uint64_t v28 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v126 = v29;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_44(v31);
  uint64_t v106 = swift_getWitnessTable();
  uint64_t v142 = v106;
  uint64_t v143 = MEMORY[0x263F19100];
  uint64_t v111 = OUTLINED_FUNCTION_6_7();
  uint64_t v140 = v111;
  uint64_t v141 = MEMORY[0x263F1A240];
  uint64_t v32 = swift_getWitnessTable();
  uint64_t v144 = v28;
  uint64_t v145 = MEMORY[0x263F8D6C8];
  uint64_t v33 = v28;
  uint64_t v114 = v28;
  uint64_t v34 = MEMORY[0x263F8D6C8];
  uint64_t v146 = v32;
  unint64_t v147 = MEMORY[0x263F8D6E8];
  uint64_t v35 = v32;
  uint64_t v113 = v32;
  unint64_t v36 = MEMORY[0x263F8D6E8];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v118 = OpaqueTypeMetadata2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v125 = v38;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_44(v40);
  uint64_t v144 = v33;
  uint64_t v145 = v34;
  uint64_t v146 = v35;
  unint64_t v147 = v36;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v117 = OpaqueTypeConformance2;
  unint64_t v116 = sub_22D62EB04();
  uint64_t v144 = OpaqueTypeMetadata2;
  uint64_t v145 = v136;
  uint64_t v146 = OpaqueTypeConformance2;
  unint64_t v147 = v116;
  uint64_t v121 = MEMORY[0x263F1A988];
  uint64_t v122 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v124 = v42;
  uint64_t v44 = MEMORY[0x270FA5388](v43);
  uint64_t v115 = (char *)&v96 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_44((uint64_t)&v96 - v46);
  uint64_t v47 = v138;
  uint64_t v48 = v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v130 + 16))(v135, v138, v10);
  uint64_t v49 = v47 + *(int *)(a1 + 52);
  uint64_t v50 = v47;
  uint64_t v52 = *(void *)(v49 + 8);
  uint64_t v51 = *(void *)(v49 + 16);
  unint64_t v53 = *(void *)(v49 + 24);
  LOBYTE(v144) = *(unsigned char *)v49;
  uint64_t v145 = v52;
  uint64_t v146 = v51;
  unint64_t v147 = v53;
  swift_bridgeObjectRetain();
  sub_22D5DB288(v53);
  int v98 = sub_22D688BC0(a1);
  uint64_t v54 = *(int *)(a1 + 60);
  uint64_t v55 = (uint64_t *)(v50 + *(int *)(a1 + 56));
  uint64_t v56 = v55[1];
  uint64_t v100 = *v55;
  uint64_t v102 = v50 + *(int *)(a1 + 80);
  double v57 = *(double *)(v102 + 40);
  uint64_t v58 = v139;
  uint64_t v129 = *(void (**)(uint64_t, uint64_t, uint64_t))(v139 + 16);
  uint64_t v130 = v139 + 16;
  int v99 = *(unsigned __int8 *)(v50 + v54);
  uint64_t v59 = v134;
  uint64_t v101 = a1;
  v129(v134, v50, a1);
  uint64_t v60 = *(unsigned __int8 *)(v58 + 80);
  uint64_t v61 = v58;
  uint64_t v62 = (v60 + 48) & ~v60;
  uint64_t v104 = &v131[v62];
  uint64_t v105 = v62;
  uint64_t v103 = v60 | 7;
  uint64_t v63 = (void *)swift_allocObject();
  uint64_t v64 = v133;
  v63[2] = v48;
  v63[3] = v64;
  uint64_t v65 = v132;
  uint64_t v66 = v137;
  v63[4] = v132;
  v63[5] = v66;
  uint64_t v67 = *(char **)(v61 + 32);
  uint64_t v139 = v61 + 32;
  uint64_t v131 = v67;
  ((void (*)(char *, uint64_t, uint64_t))v67)((char *)v63 + v62, v59, a1);
  uint64_t v68 = v48;
  uint64_t v69 = v109;
  uint64_t v70 = v65;
  uint64_t v71 = v66;
  uint64_t v72 = v108;
  LOBYTE(v48) = sub_22D5DADD0();
  swift_bridgeObjectRetain();
  uint64_t v97 = v68;
  sub_22D669D7C(v135, (char *)&v144, 0, (v98 & 1) == 0, v100, v56, v99, v48 & 1, v110, v57, 0, 0, v64, (uint64_t)sub_22D68A250, (uint64_t)v63, v68, v64, v69, v70,
    v71,
    v72);
  sub_22D617C44();
  sub_22D6CBDB8();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v73();
  OUTLINED_FUNCTION_3_10();
  v74();
  uint64_t v75 = (void *)swift_allocObject();
  void v75[2] = v68;
  v75[3] = v64;
  uint64_t v76 = v137;
  v75[4] = v70;
  v75[5] = v76;
  OUTLINED_FUNCTION_11_7();
  v77();
  sub_22D6CBE68();
  swift_release();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v78();
  uint64_t v144 = sub_22D6872D4();
  OUTLINED_FUNCTION_3_10();
  v79();
  uint64_t v80 = (void *)swift_allocObject();
  uint64_t v81 = v133;
  v80[2] = v97;
  v80[3] = v81;
  uint64_t v82 = v137;
  v80[4] = v132;
  v80[5] = v82;
  OUTLINED_FUNCTION_11_7();
  v83();
  sub_22D5DADC8();
  sub_22D6CBE78();
  swift_release();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v84();
  uint64_t v85 = v118;
  uint64_t v86 = v136;
  uint64_t v87 = v117;
  unint64_t v88 = v116;
  sub_22D69D018();
  sub_22D5DADD0();
  uint64_t v89 = v115;
  sub_22D6CBBD8();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v90();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v91();
  uint64_t v144 = v85;
  uint64_t v145 = v86;
  uint64_t v146 = v87;
  unint64_t v147 = v88;
  swift_getOpaqueTypeConformance2();
  uint64_t v92 = v119;
  uint64_t v93 = v122;
  sub_22D6B8B10(v89, v122);
  uint64_t v94 = *(void (**)(char *, uint64_t))(v124 + 8);
  v94(v89, v93);
  sub_22D6B8B10(v92, v93);
  return ((uint64_t (*)(uint64_t, uint64_t))v94)(v92, v93);
}

uint64_t sub_22D689814@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v48 = a3;
  uint64_t v59 = a6;
  uint64_t v54 = sub_22D6CB078();
  uint64_t v10 = *(void *)(v54 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v54);
  uint64_t v51 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v46 = (uint64_t)&v43 - v14;
  uint64_t v15 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = _s11ArtworkViewVMa();
  uint64_t v55 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v44 = (char *)&v43 - v19;
  uint64_t v50 = sub_22D6CB088();
  uint64_t v56 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v45 = (char *)&v43 - v20;
  uint64_t v52 = sub_22D6CB088();
  uint64_t v57 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v47 = (char *)&v43 - v21;
  uint64_t v22 = sub_22D6CB088();
  uint64_t v58 = *(void *)(v22 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v49 = (char *)&v43 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  unint64_t v53 = (char *)&v43 - v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, a2);
  uint64_t v66 = a2;
  uint64_t v67 = v48;
  uint64_t v68 = a4;
  uint64_t v69 = a5;
  _s13ItemShelfCellVMa();
  sub_22D67DCC8();
  uint64_t v26 = v46;
  sub_22D6B95E0(v46);
  uint64_t v27 = v51;
  uint64_t v28 = v54;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v51, *MEMORY[0x263F18DD0], v54);
  sub_22D6CB068();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v10 + 8);
  v29(v27, v28);
  v29((char *)v26, v28);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_22D6CC2E8();
  uint64_t v31 = v45;
  uint64_t v32 = v44;
  sub_22D6CBBF8();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v32, v18);
  sub_22D6CB8E8();
  uint64_t v64 = WitnessTable;
  uint64_t v65 = MEMORY[0x263F18880];
  uint64_t v33 = v50;
  uint64_t v34 = swift_getWitnessTable();
  uint64_t v35 = v47;
  sub_22D6CBE28();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v31, v33);
  sub_22D6CB8F8();
  uint64_t v36 = MEMORY[0x263F18C10];
  uint64_t v62 = v34;
  uint64_t v63 = MEMORY[0x263F18C10];
  uint64_t v37 = v52;
  uint64_t v38 = swift_getWitnessTable();
  uint64_t v39 = v49;
  sub_22D6CBE28();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v35, v37);
  uint64_t v60 = v38;
  uint64_t v61 = v36;
  swift_getWitnessTable();
  uint64_t v40 = v53;
  sub_22D6B8B10(v39, v22);
  long long v41 = *(void (**)(char *, uint64_t))(v58 + 8);
  v41(v39, v22);
  sub_22D6B8B10(v40, v22);
  return ((uint64_t (*)(char *, uint64_t))v41)(v40, v22);
}

uint64_t sub_22D689EA8(uint64_t a1)
{
  uint64_t result = _s13ItemShelfCellVMa();
  uint64_t v3 = a1 + *(int *)(result + 64);
  if ((*(unsigned char *)(v3 + 8) & 1) == 0 && !*(void *)v3) {
    return sub_22D689F00(result);
  }
  return result;
}

uint64_t sub_22D689F00(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857CF28);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22D6CCA28();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v2, v8);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v12);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v7, v12);
    int v16 = *(unsigned __int8 *)(v2 + *(int *)(a1 + 60));
    if (v16 != 5)
    {
      _s9ViewModelCMa();
      swift_getWitnessTable();
      sub_22D6CB168();
      sub_22D662B54((uint64_t)v15, v16);
      swift_release();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v12);
    return sub_22D686F74((uint64_t)v7);
  }
}

uint64_t sub_22D68A194(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  uint64_t result = _s13ItemShelfCellVMa();
  uint64_t v6 = a3 + *(int *)(result + 64);
  if ((*(unsigned char *)(v6 + 8) & 1) == 0 && v4 == *(void *)v6) {
    return sub_22D689F00(result);
  }
  return result;
}

BOOL sub_22D68A1F4(_OWORD *a1, long long *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = *a2;
  long long v4 = a2[1];
  v7[2] = a1[2];
  v8[0] = v3;
  long long v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_22D5DADD8((double *)v7, (double *)v8);
}

uint64_t sub_22D68A250@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  OUTLINED_FUNCTION_1_7();
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return sub_22D689814(v8, v3, v4, v5, v6, a1);
}

uint64_t sub_22D68A2D8()
{
  OUTLINED_FUNCTION_1_7();
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_22D689EA8(v2);
}

uint64_t objectdestroyTm_6()
{
  uint64_t v1 = (int *)(_s13ItemShelfCellVMa() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  OUTLINED_FUNCTION_22();
  v3();
  uint64_t v4 = v2 + v1[15];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v4 + 24));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(qword_26857D320);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D6CB078();
    OUTLINED_FUNCTION_22();
    v5();
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_22D68A4F4(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_1_7();
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_22D68A194(a1, a2, v6);
}

uint64_t _s13ItemShelfCellV9ConstantsVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D68A5A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D68A7E4()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return swift_getWitnessTable();
}

uint64_t _s5AlertVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s5AlertVwcp(void *a1, void *a2)
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
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s5AlertVwca(void *a1, void *a2)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *_s5AlertVwta(void *a1, void *a2)
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
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5AlertVwet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
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

uint64_t _s5AlertVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s5AlertVMa()
{
  return &_s5AlertVN;
}

unint64_t sub_22D68AA88()
{
  unint64_t result = qword_26857DC68;
  if (!qword_26857DC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857DC68);
  }
  return result;
}

uint64_t sub_22D68AAD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (a1 >= 2)
  {
    if (qword_26857AD80 == -1) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  if (a1 == 1 && a2 >= 2)
  {
    if (qword_26857AD80 == -1) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  if (qword_26857AD80 != -1) {
LABEL_15:
  }
    swift_once();
LABEL_12:
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_2_9();
  sub_22D6CA058();
  OUTLINED_FUNCTION_4_5();
  if (qword_26857AD80 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_8();
  uint64_t v7 = OUTLINED_FUNCTION_3_11();
  uint64_t v9 = v8;
  OUTLINED_FUNCTION_1_8();
  uint64_t result = OUTLINED_FUNCTION_3_11();
  *a3 = v3;
  a3[1] = v4;
  a3[2] = 0;
  a3[3] = 0;
  a3[4] = v7;
  a3[5] = v9;
  a3[6] = result;
  a3[7] = v11;
  return result;
}

uint64_t sub_22D68ACC4()
{
  if (qword_26857AD80 != -1) {
    swift_once();
  }
  sub_22D6CA058();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_8();
  uint64_t result = OUTLINED_FUNCTION_0_12();
  qword_268585150 = v0;
  *(void *)algn_268585158 = v1;
  qword_268585160 = 0;
  unk_268585168 = 0;
  qword_268585170 = result;
  unk_268585178 = v3;
  qword_268585180 = 0;
  qword_268585188 = 0;
  return result;
}

double sub_22D68ADB8()
{
  sub_22D68AAD4(1, 1, v1);
  xmmword_268585190 = v1[0];
  xmmword_2685851A0 = v1[1];
  double result = *(double *)&v2;
  xmmword_2685851B0 = v2;
  xmmword_2685851C0 = v3;
  return result;
}

uint64_t sub_22D68ADFC(void *a1, void *a2)
{
  if (*a1 != *a2 || a1[1] != a2[1])
  {
    char v5 = sub_22D6CD5A8();
    uint64_t result = 0;
    if ((v5 & 1) == 0) {
      return result;
    }
  }
  uint64_t v7 = a1[3];
  uint64_t v8 = a2[3];
  if (!v7)
  {
    if (v8) {
      return 0;
    }
    goto LABEL_15;
  }
  if (!v8) {
    return 0;
  }
  BOOL v9 = a1[2] == a2[2] && v7 == v8;
  if (v9 || (v10 = sub_22D6CD5A8(), uint64_t result = 0, (v10 & 1) != 0))
  {
LABEL_15:
    uint64_t v11 = a1[5];
    uint64_t v12 = a2[5];
    if (v11)
    {
      if (!v12) {
        return 0;
      }
      if (a1[4] != a2[4] || v11 != v12)
      {
        char v14 = sub_22D6CD5A8();
        uint64_t result = 0;
        if ((v14 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v12)
    {
      return 0;
    }
    uint64_t v15 = a1[7];
    uint64_t v16 = a2[7];
    if (v15)
    {
      if (v16)
      {
        BOOL v17 = a1[6] == a2[6] && v15 == v16;
        if (v17 || (sub_22D6CD5A8() & 1) != 0) {
          return 1;
        }
      }
    }
    else if (!v16)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_22D68AF0C()
{
  swift_bridgeObjectRetain();
  sub_22D6CCF58();
  swift_bridgeObjectRelease();
  if (v0[3])
  {
    sub_22D6CD648();
    swift_bridgeObjectRetain();
    sub_22D6CCF58();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22D6CD648();
  }
  if (v0[5])
  {
    sub_22D6CD648();
    swift_bridgeObjectRetain();
    sub_22D6CCF58();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22D6CD648();
  }
  if (!v0[7]) {
    return sub_22D6CD648();
  }
  sub_22D6CD648();
  swift_bridgeObjectRetain();
  sub_22D6CCF58();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D68B034()
{
  return sub_22D6CD668();
}

uint64_t sub_22D68B074()
{
  if (qword_26857AD80 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_8();
  uint64_t v2 = OUTLINED_FUNCTION_0_12();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_1_8();
  uint64_t v5 = OUTLINED_FUNCTION_0_12();
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_1_8();
  uint64_t result = OUTLINED_FUNCTION_0_12();
  *(void *)&xmmword_2685851D0 = v0;
  *((void *)&xmmword_2685851D0 + 1) = v1;
  *(void *)&xmmword_2685851E0 = v2;
  *((void *)&xmmword_2685851E0 + 1) = v4;
  *(void *)&xmmword_2685851F0 = v5;
  *((void *)&xmmword_2685851F0 + 1) = v7;
  qword_268585200 = result;
  qword_268585208 = v9;
  return result;
}

uint64_t sub_22D68B1BC()
{
  if (qword_26857AD80 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_8();
  uint64_t v2 = OUTLINED_FUNCTION_0_12();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_1_8();
  uint64_t result = OUTLINED_FUNCTION_0_12();
  *(void *)&xmmword_268585210 = v0;
  *((void *)&xmmword_268585210 + 1) = v1;
  qword_268585220 = 0;
  unk_268585228 = 0;
  *(void *)&xmmword_268585230 = v2;
  *((void *)&xmmword_268585230 + 1) = v4;
  qword_268585240 = result;
  qword_268585248 = v6;
  return result;
}

uint64_t sub_22D68B2EC()
{
  return sub_22D6CD668();
}

uint64_t *sub_22D68B328(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_22D6CA0F8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B7E8);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
    }
  }
  return v3;
}

uint64_t sub_22D68B470(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_22D6CA0F8();
  uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

void *sub_22D68B514(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22D6CA0F8();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B7E8);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  return a1;
}

void *sub_22D68B60C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22D6CA0F8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B7E8);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  return a1;
}

_OWORD *sub_22D68B7AC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_22D6CA0F8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B7E8);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

void *sub_22D68B884(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_22D6CA0F8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  int v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (!EnumTagSinglePayload)
  {
    uint64_t v14 = *(void *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B7E8);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  return a1;
}

uint64_t sub_22D68BA04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D68BA18);
}

uint64_t sub_22D68BA18(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B7E8);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22D68BAA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D68BAB8);
}

uint64_t sub_22D68BAB8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B7E8);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for WrappedTextWithLinkView()
{
  uint64_t result = qword_26857DC70;
  if (!qword_26857DC70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22D68BB84()
{
  sub_22D68BC1C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22D68BC1C()
{
  if (!qword_26857DC80)
  {
    sub_22D6CA0F8();
    unint64_t v0 = sub_22D6CD328();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26857DC80);
    }
  }
}

uint64_t sub_22D68BC74()
{
  return sub_22D68C54C((unint64_t *)&qword_26857B848, (void (*)(uint64_t))type metadata accessor for WrappedTextWithLinkView);
}

id sub_22D68BCBC()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B7E8);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22D6CA0F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v0[1];
  v23[10] = *v0;
  v23[11] = v9;
  swift_bridgeObjectRetain();
  sub_22D6CCF68();
  swift_bridgeObjectRetain();
  sub_22D6CCF68();
  swift_bridgeObjectRelease();
  sub_22D63DFD0(0, &qword_26857DCA0);
  swift_bridgeObjectRetain();
  id v10 = sub_22D68BFDC();
  uint64_t v11 = type metadata accessor for WrappedTextWithLinkView();
  sub_22D68C66C((uint64_t)v1 + *(int *)(v11 + 24), (uint64_t)v4);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    swift_bridgeObjectRelease();
    sub_22D68C6D4((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    uint64_t v12 = (void *)sub_22D6CCED8();
    swift_bridgeObjectRelease();
    int v13 = (void *)sub_22D6CCED8();
    id v14 = objc_msgSend(v12, sel_rangeOfString_, v13);
    uint64_t v16 = v15;

    __swift_instantiateConcreteTypeFromMangledName(&qword_26857DC90);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22D6CDF70;
    uint64_t v18 = (void *)*MEMORY[0x263F81520];
    *(void *)(inited + 32) = *MEMORY[0x263F81520];
    *(void *)(inited + 64) = v5;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 40));
    (*(void (**)(uint64_t *, char *, uint64_t))(v6 + 16))(boxed_opaque_existential_0, v8, v5);
    type metadata accessor for Key(0);
    sub_22D68C54C(&qword_26857B0A0, type metadata accessor for Key);
    id v20 = v18;
    uint64_t v21 = sub_22D6CCDF8();
    sub_22D68C798(v21, (uint64_t)v14, v16, v10);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v10;
}

id sub_22D68BFDC()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_22D6CCED8();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithString_, v1);

  return v2;
}

id sub_22D68C050()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82D60]), sel_init);
  id v1 = sub_22D68BCBC();
  objc_msgSend(v0, sel_setAttributedText_, v1);

  id v2 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F83570]);
  objc_msgSend(v0, sel_setFont_, v2);

  objc_msgSend(v0, sel_setUserInteractionEnabled_, 1);
  objc_msgSend(v0, sel_setEditable_, 0);
  objc_msgSend(v0, sel_setTextContainerInset_, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  return v0;
}

uint64_t sub_22D68C13C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857DC90);
  uint64_t inited = swift_initStackObject();
  id v10 = (void **)MEMORY[0x263F814F0];
  *(_OWORD *)(inited + 16) = xmmword_22D6CDF70;
  uint64_t v11 = *v10;
  *(void *)(inited + 32) = *v10;
  uint64_t v12 = self;
  uint64_t v13 = *MEMORY[0x263F83570];
  id v14 = v11;
  id v15 = objc_msgSend(v12, sel_preferredFontForTextStyle_, v13);
  *(void *)(inited + 64) = sub_22D63DFD0(0, &qword_26857DC98);
  *(void *)(inited + 40) = v15;
  type metadata accessor for Key(0);
  sub_22D68C54C(&qword_26857B0A0, type metadata accessor for Key);
  uint64_t v16 = sub_22D6CCDF8();
  uint64_t v22 = *v5;
  uint64_t v23 = v5[1];
  swift_bridgeObjectRetain();
  sub_22D6CCF68();
  id v17 = objc_allocWithZone(MEMORY[0x263F086A0]);
  id v18 = sub_22D68C594(v22, v23, v16);
  id v19 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v19, sel_bounds);
  OUTLINED_FUNCTION_1_9();

  v24.origin.x = OUTLINED_FUNCTION_0_13();
  objc_msgSend(v18, sel_boundingRectWithSize_options_context_, 3, 0, CGRectGetWidth(v24), 1.79769313e308);
  OUTLINED_FUNCTION_1_9();
  if (a2)
  {
    objc_msgSend(a5, sel_intrinsicContentSize);
    a1 = v20;
  }
  v25.origin.x = OUTLINED_FUNCTION_0_13();
  CGRectGetHeight(v25);

  return a1;
}

uint64_t sub_22D68C388(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5)
{
  return sub_22D68C13C(a1, a2 & 1, a3, a4, a5);
}

uint64_t sub_22D68C3C0()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_22D68C3CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22D68C54C(&qword_26857DC88, (void (*)(uint64_t))type metadata accessor for WrappedTextWithLinkView);
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_22D68C460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22D68C54C(&qword_26857DC88, (void (*)(uint64_t))type metadata accessor for WrappedTextWithLinkView);
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_22D68C4F4()
{
}

uint64_t sub_22D68C54C(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_22D68C594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)sub_22D6CCED8();
  swift_bridgeObjectRelease();
  if (a3)
  {
    type metadata accessor for Key(0);
    sub_22D68C54C(&qword_26857B0A0, type metadata accessor for Key);
    uint64_t v6 = (void *)sub_22D6CCDE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(v3, sel_initWithString_attributes_, v5, v6);

  return v7;
}

uint64_t sub_22D68C66C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B7E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D68C6D4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B7E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  id v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_22D68C798(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  type metadata accessor for Key(0);
  sub_22D68C54C(&qword_26857B0A0, type metadata accessor for Key);
  id v7 = (id)sub_22D6CCDE8();
  swift_bridgeObjectRelease();
  objc_msgSend(a4, sel_setAttributes_range_, v7, a2, a3);
}

uint64_t sub_22D68C874(uint64_t a1)
{
  id v1 = (void (*)(void))MEMORY[0x270FA5388](a1);
  v1();
  return sub_22D6CAFE8();
}

void sub_22D68C944(void (*a1)(uint64_t)@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X3>, void (*a5)(uint64_t)@<X4>, int a6@<W5>, int a7@<W6>, int a8@<W7>, void (**a9)(uint64_t)@<X8>, double a10@<D0>, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  LODWORD(v66) = a8;
  LODWORD(WitnessTable) = a7;
  LODWORD(v61) = a6;
  uint64_t v62 = a5;
  uint64_t v67 = a3;
  uint64_t v59 = a1;
  uint64_t v60 = a2;
  uint64_t v18 = sub_22D6CC4B8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v57 - v22;
  unint64_t v24 = *a4;
  uint64_t v68 = a12;
  uint64_t v69 = a13;
  uint64_t v70 = a14;
  uint64_t v71 = a15;
  CGRect v25 = (int *)_s9ItemShelfVMa();
  uint64_t v26 = (uint64_t *)((char *)a9 + v25[20]);
  _s9ViewModelCMa();
  swift_getWitnessTable();
  *uint64_t v26 = sub_22D6CB198();
  v26[1] = v27;
  uint64_t v28 = (uint64_t *)((char *)a9 + v25[21]);
  *uint64_t v28 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(qword_26857D320);
  swift_storeEnumTagMultiPayload();
  uint64_t v29 = (uint64_t *)((char *)a9 + v25[22]);
  *uint64_t v29 = sub_22D68CD84();
  v29[1] = v30;
  uint64_t v31 = (void (**)(uint64_t))((char *)a9 + v25[23]);
  uint64_t v32 = sub_22D68CDBC();
  *uint64_t v31 = v33;
  v31[1] = v32;
  uint64_t v34 = (char *)a9 + v25[27];
  *(_OWORD *)uint64_t v34 = xmmword_22D6D25F0;
  *((void *)v34 + 2) = 0x4044000000000000;
  *((void *)v34 + 3) = 4;
  *((_OWORD *)v34 + 2) = xmmword_22D6D2600;
  *((void *)v34 + 6) = 0x4050000000000000;
  v34[56] = 0;
  *(_DWORD *)(v34 + 57) = v68;
  *((_DWORD *)v34 + 15) = *(_DWORD *)((char *)&v68 + 3);
  *((_OWORD *)v34 + 4) = xmmword_22D6D2610;
  *((void *)v34 + 10) = 0x4014000000000000;
  uint64_t v36 = v59;
  uint64_t v35 = v60;
  *a9 = v59;
  a9[1] = v35;
  uint64_t v37 = (char *)a9 + v25[13];
  uint64_t v64 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v65 = v34;
  v64(v37, v67, v18);
  *(void (**)(uint64_t))((char *)a9 + v25[14]) = (void (*)(uint64_t))v24;
  *(double *)((char *)a9 + v25[15]) = a10;
  *(void (**)(uint64_t))((char *)a9 + v25[16]) = v62;
  *((unsigned char *)a9 + v25[17]) = (_BYTE)v61;
  *((unsigned char *)a9 + v25[18]) = WitnessTable;
  *((unsigned char *)a9 + v25[19]) = v66;
  uint64_t v38 = (char *)a9 + v25[24];
  *uint64_t v38 = 0;
  *((void *)v38 + 1) = v36;
  *((void *)v38 + 2) = v35;
  *((void *)v38 + 3) = v24;
  uint64_t v58 = v25;
  uint64_t v39 = v25[25];
  uint64_t v61 = a9;
  uint64_t v40 = (char *)a9 + v39;
  *uint64_t v40 = 3;
  *((void *)v40 + 1) = v36;
  *((void *)v40 + 2) = v35;
  *((void *)v40 + 3) = v24;
  swift_bridgeObjectRetain();
  sub_22D5DB288(v24);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v24);
  swift_retain();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v41 = sub_22D6CD208();
  uint64_t v42 = 0;
  uint64_t v66 = v20 + 16;
  uint64_t v43 = MEMORY[0x263F8EE78];
  uint64_t v44 = -1;
  uint64_t v45 = v41 / 4;
  while (1)
  {
    v64(v23, v67, v18);
    if (v45 < ++v44) {
      break;
    }
    uint64_t v46 = sub_22D6CD208();
    uint64_t v47 = OUTLINED_FUNCTION_10_3();
    v36(v47);
    if (v42 >= v46) {
      goto LABEL_12;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_22D6633D4();
      uint64_t v43 = v51;
    }
    unint64_t v48 = *(void *)(v43 + 16);
    if (v48 >= *(void *)(v43 + 24) >> 1)
    {
      sub_22D6633D4();
      uint64_t v43 = v52;
    }
    *(void *)(v43 + 16) = v48 + 1;
    *(void *)(v43 + 8 * v48 + 32) = v42;
    uint64_t v49 = *((void *)v65 + 3);
    BOOL v50 = __OFADD__(v42, v49);
    v42 += v49;
    if (v50)
    {
      __break(1u);
      return;
    }
  }
  uint64_t v53 = OUTLINED_FUNCTION_10_3();
  v36(v53);
LABEL_12:
  swift_release();
  uint64_t v54 = *((void *)v65 + 1);
  double v55 = a10 - *((double *)v65 + 2);
  ((void (*)(uint64_t, uint64_t))v36)(v67, v18);
  uint64_t v56 = (double *)((char *)v61 + v58[26]);
  *(void *)uint64_t v56 = v43;
  v56[1] = v55;
  *((void *)v56 + 2) = v54;
}

uint64_t _s9ItemShelfVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D68CD84()
{
  sub_22D6CC018();
  return v1;
}

uint64_t sub_22D68CDBC()
{
  sub_22D6CC018();
  return v1;
}

uint64_t sub_22D68CDF8()
{
  return sub_22D6CB258();
}

uint64_t sub_22D68CE1C(uint64_t a1)
{
  uint64_t v2 = sub_22D6CB078();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_22D6CB268();
}

uint64_t sub_22D68CEE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v87 = a2;
  uint64_t v78 = a1;
  uint64_t v2 = (void *)(a1 - 8);
  uint64_t v77 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v75 = v3;
  uint64_t v76 = (char *)v70 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD30);
  uint64_t v5 = v2[4];
  unint64_t v6 = v2[5];
  unint64_t v7 = v2[6];
  uint64_t v111 = v2[3];
  uint64_t v112 = v5;
  uint64_t v8 = v111;
  uint64_t v83 = v111;
  unint64_t v113 = v6;
  unint64_t v114 = v7;
  unint64_t v9 = v6;
  unint64_t v90 = v6;
  OUTLINED_FUNCTION_8_8();
  uint64_t v10 = _s21AdditionalContentViewVMa();
  unint64_t v11 = sub_22D6928F0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v111 = v4;
  uint64_t v112 = v10;
  unint64_t v113 = v11;
  unint64_t v114 = WitnessTable;
  OUTLINED_FUNCTION_8_8();
  sub_22D6CAFF8();
  sub_22D6CB088();
  sub_22D6CB568();
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_1_10();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD50);
  uint64_t v111 = v8;
  uint64_t v112 = v5;
  uint64_t v89 = v5;
  unint64_t v113 = v9;
  unint64_t v114 = v7;
  unint64_t v88 = v7;
  OUTLINED_FUNCTION_8_8();
  _s12ItemShelfRowVMa();
  uint64_t v14 = sub_22D6CB088();
  unint64_t v15 = sub_22D692990();
  uint64_t v111 = v13;
  uint64_t v112 = MEMORY[0x263F8D6C8];
  unint64_t v113 = v14;
  unint64_t v114 = v15;
  uint64_t v115 = MEMORY[0x263F8D6D8];
  OUTLINED_FUNCTION_8_8();
  sub_22D6CC1A8();
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v17 = MEMORY[0x263F18860];
  uint64_t v109 = v16;
  uint64_t v110 = MEMORY[0x263F18860];
  uint64_t v108 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6CC0B8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857C070);
  uint64_t v18 = sub_22D6CB088();
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v20 = sub_22D5DCE80(&qword_26857C068, &qword_26857C070);
  uint64_t v106 = v19;
  uint64_t v107 = v20;
  uint64_t v21 = swift_getWitnessTable();
  uint64_t v111 = v18;
  uint64_t v112 = v21;
  swift_getOpaqueTypeMetadata2();
  uint64_t v111 = v18;
  uint64_t v112 = v21;
  swift_getOpaqueTypeConformance2();
  sub_22D6CADE8();
  uint64_t v22 = sub_22D6CB088();
  uint64_t v23 = sub_22D6CB848();
  uint64_t v104 = swift_getWitnessTable();
  uint64_t v105 = v17;
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v111 = v22;
  uint64_t v112 = v23;
  unint64_t v113 = v24;
  unint64_t v114 = MEMORY[0x263F1A480];
  OUTLINED_FUNCTION_8_8();
  swift_getOpaqueTypeMetadata2();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD68);
  sub_22D6CB088();
  sub_22D6CB728();
  sub_22D6CB088();
  OUTLINED_FUNCTION_1_10();
  swift_getTupleTypeMetadata2();
  sub_22D6CC2C8();
  v70[0] = swift_getWitnessTable();
  sub_22D6CC0E8();
  OUTLINED_FUNCTION_0_1();
  v70[1] = v25;
  MEMORY[0x270FA5388](v26);
  sub_22D6CB088();
  OUTLINED_FUNCTION_0_1();
  uint64_t v73 = v27;
  MEMORY[0x270FA5388](v28);
  uint64_t v85 = v29;
  sub_22D6CB088();
  OUTLINED_FUNCTION_0_1();
  uint64_t v74 = v30;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_53();
  uint64_t v71 = v32;
  MEMORY[0x270FA5388](v33);
  uint64_t v72 = (char *)v70 - v34;
  uint64_t v79 = v35;
  uint64_t v84 = sub_22D6CD328();
  OUTLINED_FUNCTION_0_1();
  uint64_t v81 = v36;
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_53();
  uint64_t v80 = v38;
  MEMORY[0x270FA5388](v39);
  uint64_t v82 = (char *)v70 - v40;
  uint64_t v41 = v86;
  unint64_t v42 = v90;
  uint64_t v43 = v83;
  sub_22D6CC4B8();
  swift_getWitnessTable();
  uint64_t v44 = sub_22D6CD208();
  uint64_t v45 = MEMORY[0x263F1A240];
  if (v44 < 1)
  {
    uint64_t v63 = v80;
    __swift_storeEnumTagSinglePayload(v80, 1, 1, v79);
    uint64_t v102 = swift_getWitnessTable();
    uint64_t v103 = MEMORY[0x263F18C10];
    uint64_t v100 = swift_getWitnessTable();
    uint64_t v101 = v45;
    swift_getWitnessTable();
  }
  else
  {
    uint64_t v46 = sub_22D6CB458();
    MEMORY[0x270FA5388](v46);
    uint64_t v47 = v89;
    v70[-6] = v43;
    v70[-5] = v47;
    unint64_t v48 = v88;
    v70[-4] = v42;
    v70[-3] = v48;
    v70[-2] = v41;
    sub_22D6CC0D8();
    sub_22D6CB8D8();
    uint64_t v49 = swift_getWitnessTable();
    sub_22D6CBE28();
    OUTLINED_FUNCTION_22();
    v50();
    uint64_t v51 = v77;
    uint64_t v52 = v76;
    uint64_t v53 = v78;
    (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v76, v41, v78);
    unint64_t v54 = (*(unsigned __int8 *)(v51 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80);
    double v55 = (char *)swift_allocObject();
    uint64_t v56 = v89;
    *((void *)v55 + 2) = v43;
    *((void *)v55 + 3) = v56;
    unint64_t v57 = v88;
    *((void *)v55 + 4) = v90;
    *((void *)v55 + 5) = v57;
    (*(void (**)(char *, char *, uint64_t))(v51 + 32))(&v55[v54], v52, v53);
    uint64_t v45 = MEMORY[0x263F1A240];
    uint64_t v93 = v49;
    uint64_t v94 = MEMORY[0x263F18C10];
    uint64_t v58 = swift_getWitnessTable();
    uint64_t v59 = v71;
    sub_22D6CBE68();
    swift_release();
    OUTLINED_FUNCTION_22();
    v60();
    uint64_t v91 = v58;
    uint64_t v92 = v45;
    uint64_t v61 = v79;
    swift_getWitnessTable();
    uint64_t v41 = v72;
    sub_22D6B8B10(v59, v61);
    uint64_t v62 = *(void (**)(uint64_t, uint64_t))(v74 + 8);
    v62(v59, v61);
    uint64_t v63 = v80;
    sub_22D6B8B10(v41, v61);
    v62((uint64_t)v41, v61);
    __swift_storeEnumTagSinglePayload(v63, 0, 1, v61);
  }
  uint64_t v64 = OUTLINED_FUNCTION_9_8();
  sub_22D627E64(v64, v65);
  uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v81 + 8);
  uint64_t v67 = v63;
  uint64_t v68 = v84;
  v66(v67, v84);
  uint64_t v98 = swift_getWitnessTable();
  uint64_t v99 = MEMORY[0x263F18C10];
  uint64_t v96 = swift_getWitnessTable();
  uint64_t v97 = v45;
  uint64_t v95 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6B8B10(v41, v68);
  return ((uint64_t (*)(char *, uint64_t))v66)(v41, v68);
}

uint64_t sub_22D68D9F4@<X0>(uint64_t a1@<X0>, void (*a2)(void, void)@<X1>, void *a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  unint64_t v72 = a4;
  uint64_t v73 = a1;
  uint64_t v59 = a2;
  uint64_t v70 = a6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD50);
  double v55 = a3;
  _s12ItemShelfRowVMa();
  sub_22D6CB088();
  sub_22D692990();
  uint64_t v82 = MEMORY[0x263F8D6D8];
  sub_22D6CC1A8();
  v77[23] = swift_getWitnessTable();
  v77[24] = MEMORY[0x263F18860];
  uint64_t v8 = MEMORY[0x263F18E48];
  v77[22] = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6CC0B8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857C070);
  sub_22D6CB088();
  v77[20] = swift_getWitnessTable();
  v77[21] = sub_22D5DCE80(&qword_26857C068, &qword_26857C070);
  uint64_t v57 = v8;
  swift_getWitnessTable();
  swift_getOpaqueTypeMetadata2();
  swift_getOpaqueTypeConformance2();
  sub_22D6CADE8();
  uint64_t v9 = sub_22D6CB088();
  uint64_t v64 = sub_22D6CB848();
  v77[18] = swift_getWitnessTable();
  v77[19] = MEMORY[0x263F18860];
  uint64_t v65 = v9;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v78 = (void (*)(void, void))v9;
  uint64_t v79 = (void *)v64;
  unint64_t v80 = WitnessTable;
  uint64_t v81 = MEMORY[0x263F1A480];
  uint64_t v61 = MEMORY[0x263F1AED8];
  swift_getOpaqueTypeMetadata2();
  uint64_t v60 = sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD68);
  uint64_t v62 = sub_22D6CB088();
  sub_22D6CB728();
  uint64_t v67 = sub_22D6CB088();
  uint64_t v10 = sub_22D6CB088();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v68 = v10;
  uint64_t v69 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v58 = (uint64_t)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v66 = (char *)&v52 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD30);
  uint64_t v16 = v59;
  uint64_t v78 = v59;
  uint64_t v79 = a3;
  unint64_t v80 = v72;
  uint64_t v81 = a5;
  uint64_t v17 = _s21AdditionalContentViewVMa();
  unint64_t v18 = sub_22D6928F0();
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v78 = (void (*)(void, void))v15;
  uint64_t v79 = (void *)v17;
  unint64_t v80 = v18;
  uint64_t v81 = v19;
  sub_22D6CAFF8();
  uint64_t v54 = sub_22D6CB088();
  uint64_t v20 = sub_22D6CB568();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v52 - v22;
  uint64_t v24 = sub_22D6CB088();
  uint64_t v56 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v52 - v25;
  uint64_t v27 = sub_22D6CB088();
  uint64_t v71 = *(void *)(v27 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  uint64_t v53 = (char *)&v52 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v74 = (char *)&v52 - v30;
  uint64_t v78 = v16;
  uint64_t v79 = v55;
  unint64_t v80 = v72;
  uint64_t v81 = a5;
  double v55 = (void *)_s9ItemShelfVMa();
  sub_22D68E3A4((uint64_t)v55, (uint64_t)v23);
  sub_22D6CB8C8();
  v77[16] = swift_getWitnessTable();
  v77[17] = MEMORY[0x263F18C10];
  v77[14] = swift_getWitnessTable();
  v77[15] = MEMORY[0x263F1A820];
  uint64_t v31 = swift_getWitnessTable();
  sub_22D6CBE28();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  sub_22D6CB8D8();
  v77[12] = v31;
  uint64_t v32 = MEMORY[0x263F18C10];
  v77[13] = MEMORY[0x263F18C10];
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v34 = v53;
  sub_22D6CBE28();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v26, v24);
  v77[10] = v33;
  v77[11] = v32;
  uint64_t v35 = v32;
  uint64_t v36 = v27;
  uint64_t v56 = swift_getWitnessTable();
  sub_22D6B8B10(v34, v27);
  uint64_t v59 = *(void (**)(void, void))(v71 + 8);
  unint64_t v72 = v71 + 8;
  uint64_t v37 = v34;
  v59(v34, v27);
  uint64_t v38 = v58;
  sub_22D68E9DC(v55, v58);
  uint64_t v78 = (void (*)(void, void))v65;
  uint64_t v79 = (void *)v64;
  unint64_t v80 = WitnessTable;
  uint64_t v81 = MEMORY[0x263F1A480];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v40 = sub_22D692AF8();
  v77[8] = OpaqueTypeConformance2;
  v77[9] = v40;
  uint64_t v41 = swift_getWitnessTable();
  uint64_t v42 = sub_22D5DCE80(&qword_26857DD78, &qword_26857DD68);
  v77[6] = v41;
  v77[7] = v42;
  uint64_t v43 = swift_getWitnessTable();
  uint64_t v44 = sub_22D692EFC(&qword_26857DD80, MEMORY[0x263F1A048]);
  v77[4] = v43;
  v77[5] = v44;
  v77[2] = swift_getWitnessTable();
  v77[3] = v35;
  uint64_t v45 = v68;
  uint64_t v46 = swift_getWitnessTable();
  uint64_t v47 = v66;
  sub_22D6B8B10(v38, v45);
  uint64_t v48 = v69;
  uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v69 + 8);
  v49(v38, v45);
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v37, v74, v36);
  uint64_t v78 = (void (*)(void, void))v37;
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 16))(v38, v47, v45);
  uint64_t v79 = (void *)v38;
  v77[0] = v36;
  v77[1] = v45;
  uint64_t v75 = v56;
  uint64_t v76 = v46;
  sub_22D634638((uint64_t)&v78, 2, (uint64_t)v77);
  v49((uint64_t)v47, v45);
  BOOL v50 = (uint64_t (*)(char *, uint64_t))v59;
  v59(v74, v36);
  v49(v38, v45);
  return v50(v37, v36);
}

uint64_t sub_22D68E3A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD30);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v45 = *(void *)(a1 + 32);
  uint64_t v44 = v7;
  uint64_t v47 = v4;
  uint64_t v61 = v4;
  uint64_t v62 = _s21AdditionalContentViewVMa();
  unint64_t v43 = sub_22D6928F0();
  unint64_t v63 = v43;
  uint64_t WitnessTable = swift_getWitnessTable();
  v42[1] = WitnessTable;
  uint64_t v8 = sub_22D6CAFF8();
  uint64_t v46 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v42 - v9;
  uint64_t v11 = sub_22D6CB088();
  uint64_t v48 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v42 - v15;
  uint64_t v17 = sub_22D6CB568();
  uint64_t v50 = *(void *)(v17 - 8);
  uint64_t v51 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v49 = (char *)v42 - v19;
  if (*((unsigned char *)v2 + *(int *)(a1 + 72)) == 1)
  {
    v42[0] = v42;
    uint64_t v20 = MEMORY[0x270FA5388](v18);
    v42[-6] = v6;
    v42[-5] = v5;
    uint64_t v21 = v44;
    v42[-4] = v45;
    v42[-3] = v21;
    v42[-2] = v2;
    MEMORY[0x270FA5388](v20);
    v42[-6] = v6;
    v42[-5] = v5;
    v42[-4] = v22;
    v42[-3] = v23;
    v42[-2] = v2;
    sub_22D68C874((uint64_t)sub_22D692E00);
    sub_22D6CB8F8();
    uint64_t v24 = swift_getWitnessTable();
    sub_22D6CBE28();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v10, v8);
    uint64_t v53 = v24;
    uint64_t v54 = MEMORY[0x263F18C10];
    swift_getWitnessTable();
    sub_22D6B8B10(v14, v11);
    uint64_t v25 = *(void (**)(char *, uint64_t))(v48 + 8);
    v25(v14, v11);
    sub_22D6B8B10(v16, v11);
    uint64_t v26 = v49;
    sub_22D6C5400();
    v25(v14, v11);
    v25(v16, v11);
  }
  else
  {
    uint64_t v27 = v2[1];
    uint64_t v61 = *v2;
    uint64_t v62 = v27;
    sub_22D604560();
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_22D6CBAF8();
    uint64_t v30 = v29;
    char v32 = v31 & 1;
    uint64_t v33 = sub_22D6CBA98();
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    char v39 = v38 & 1;
    sub_22D604A88(v28, v30, v32);
    swift_bridgeObjectRelease();
    uint64_t v61 = v33;
    uint64_t v62 = v35;
    LOBYTE(v63) = v39;
    uint64_t WitnessTable = v37;
    uint64_t v59 = swift_getWitnessTable();
    uint64_t v60 = MEMORY[0x263F18C10];
    swift_getWitnessTable();
    uint64_t v26 = v49;
    sub_22D6C54B8();
    sub_22D604A88(v33, v35, v39);
    swift_bridgeObjectRelease();
  }
  uint64_t v57 = swift_getWitnessTable();
  uint64_t v58 = MEMORY[0x263F18C10];
  uint64_t v55 = swift_getWitnessTable();
  uint64_t v56 = MEMORY[0x263F1A820];
  uint64_t v40 = v51;
  swift_getWitnessTable();
  sub_22D6B8B10(v26, v40);
  return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v26, v40);
}

uint64_t sub_22D68E9DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v81 = a2;
  uint64_t v80 = sub_22D6CB078();
  uint64_t v79 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v78 = (uint64_t)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22D6CB828();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v76 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22D6CB848();
  uint64_t v57 = v6;
  uint64_t v77 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v75 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD50);
  uint64_t v74 = a1;
  uint64_t v9 = a1[2];
  uint64_t v65 = a1[3];
  uint64_t v73 = a1[4];
  unint64_t v72 = a1[5];
  uint64_t v101 = v9;
  uint64_t v102 = v65;
  uint64_t v103 = v73;
  unint64_t v104 = v72;
  _s12ItemShelfRowVMa();
  uint64_t v10 = sub_22D6CB088();
  unint64_t v11 = sub_22D692990();
  uint64_t v101 = v8;
  uint64_t v102 = MEMORY[0x263F8D6C8];
  uint64_t v103 = v10;
  unint64_t v104 = v11;
  uint64_t v105 = MEMORY[0x263F8D6D8];
  sub_22D6CC1A8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v13 = MEMORY[0x263F18860];
  uint64_t v99 = WitnessTable;
  uint64_t v100 = MEMORY[0x263F18860];
  uint64_t v14 = MEMORY[0x263F18E48];
  uint64_t v98 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6CC0B8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857C070);
  uint64_t v15 = sub_22D6CB088();
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v17 = sub_22D5DCE80(&qword_26857C068, &qword_26857C070);
  uint64_t v96 = v16;
  uint64_t v97 = v17;
  uint64_t v70 = v14;
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v101 = v15;
  uint64_t v102 = v18;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v101 = v15;
  uint64_t v102 = v18;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v19 = sub_22D6CADE8();
  uint64_t v64 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v53 - v20;
  uint64_t v22 = sub_22D6CB088();
  uint64_t v67 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v53 - v23;
  uint64_t v94 = swift_getWitnessTable();
  uint64_t v95 = v13;
  uint64_t v56 = swift_getWitnessTable();
  uint64_t v101 = v22;
  uint64_t v102 = v6;
  uint64_t v103 = v56;
  unint64_t v104 = MEMORY[0x263F1A480];
  uint64_t v60 = MEMORY[0x263F1AED8];
  uint64_t v58 = swift_getOpaqueTypeMetadata2();
  uint64_t v63 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v26 = (char *)&v53 - v25;
  uint64_t v27 = sub_22D6CB088();
  uint64_t v66 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v53 = (char *)&v53 - v28;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD68);
  uint64_t v61 = sub_22D6CB088();
  uint64_t v68 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v54 = (char *)&v53 - v29;
  sub_22D6CB728();
  uint64_t v69 = sub_22D6CB088();
  uint64_t v71 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v59 = (char *)&v53 - v30;
  sub_22D6CB888();
  uint64_t v83 = v9;
  uint64_t v84 = v65;
  uint64_t v85 = v73;
  unint64_t v86 = v72;
  uint64_t v87 = v82;
  sub_22D6CADF8();
  char v31 = v74;
  sub_22D6CC248();
  sub_22D6CBDA8();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v21, v19);
  sub_22D6CB818();
  char v32 = v75;
  sub_22D6CB838();
  uint64_t v33 = v57;
  uint64_t v34 = v56;
  unint64_t v35 = MEMORY[0x263F1A480];
  sub_22D6CBCF8();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v32, v33);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v24, v22);
  uint64_t v101 = v22;
  uint64_t v102 = v33;
  uint64_t v103 = v34;
  unint64_t v104 = v35;
  uint64_t v36 = swift_getOpaqueTypeConformance2();
  uint64_t v37 = v53;
  uint64_t v38 = v58;
  sub_22D6CBD78();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v26, v38);
  uint64_t v39 = v82;
  uint64_t v40 = v78;
  sub_22D6B95E0(v78);
  unint64_t v41 = sub_22D692AF8();
  uint64_t v92 = v36;
  unint64_t v93 = v41;
  uint64_t v42 = swift_getWitnessTable();
  unint64_t v43 = v54;
  sub_22D69A9FC();
  (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v40, v80);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v37, v27);
  uint64_t v44 = sub_22D6CB8A8();
  uint64_t v45 = *(void *)(v39 + *((int *)v31 + 27) + 40);
  uint64_t v46 = sub_22D5DCE80(&qword_26857DD78, &qword_26857DD68);
  uint64_t v90 = v42;
  uint64_t v91 = v46;
  uint64_t v47 = v61;
  uint64_t v48 = swift_getWitnessTable();
  uint64_t v49 = v59;
  sub_22D69101C(v44, v45, 0, v47, v48);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v43, v47);
  sub_22D6CB8A8();
  uint64_t v50 = sub_22D692EFC(&qword_26857DD80, MEMORY[0x263F1A048]);
  uint64_t v88 = v48;
  uint64_t v89 = v50;
  uint64_t v51 = v69;
  swift_getWitnessTable();
  sub_22D6CBE28();
  return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v49, v51);
}

uint64_t sub_22D68F500()
{
  uint64_t v0 = _s9ItemShelfVMa();
  return sub_22D68F540(v0);
}

uint64_t sub_22D68F540(uint64_t a1)
{
  uint64_t v3 = sub_22D6CC4B8();
  MEMORY[0x270FA5388](v3);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v8 - v4, v1 + *(int *)(a1 + 52), v3);
  swift_getWitnessTable();
  sub_22D6CD0F8();
  sub_22D6CCA28();
  uint64_t v6 = sub_22D6CD4E8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v6)
  {
    if (*(unsigned char *)(v1 + *(int *)(a1 + 68)) == 5)
    {
      return swift_bridgeObjectRelease();
    }
    else
    {
      _s9ViewModelCMa();
      swift_getWitnessTable();
      sub_22D6CB168();
      sub_22D6629DC();
      swift_bridgeObjectRelease();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_22D68F700@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v38 = a6;
  uint64_t v36 = sub_22D6CC4B8();
  uint64_t v11 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v33 = (uint64_t)&v31 - v12;
  uint64_t v34 = a2;
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v41 = a4;
  uint64_t v42 = a5;
  uint64_t v13 = a5;
  uint64_t v32 = a5;
  uint64_t v14 = _s21AdditionalContentViewVMa();
  uint64_t v37 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v31 - v18;
  uint64_t v20 = a1[1];
  uint64_t v35 = *a1;
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v21 = a3;
  uint64_t v41 = a4;
  uint64_t v42 = v13;
  uint64_t v22 = (int *)_s9ItemShelfVMa();
  uint64_t v23 = v33;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v33, (char *)a1 + v22[13], v36);
  uint64_t v24 = (char *)a1 + v22[24];
  uint64_t v26 = *((void *)v24 + 1);
  uint64_t v25 = *((void *)v24 + 2);
  unint64_t v27 = *((void *)v24 + 3);
  LOBYTE(v39) = *v24;
  uint64_t v40 = v26;
  uint64_t v41 = v25;
  uint64_t v42 = v27;
  uint64_t v28 = *((unsigned __int8 *)a1 + v22[19]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22D5DB288(v27);
  sub_22D694024(v35, v20, v23, (uint64_t)&v39, v28, v21, v34, v21, a4, v32, v31, v32, v33, v34, v35, v36, v37, v38, v39,
    v40,
    v41,
    v42);
  swift_getWitnessTable();
  sub_22D6B8B10(v17, v14);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v37 + 8);
  v29(v17, v14);
  sub_22D6B8B10(v19, v14);
  return ((uint64_t (*)(char *, uint64_t))v29)(v19, v14);
}

uint64_t sub_22D68F9B0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857DD48);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v14 = sub_22D6CB358();
  *((void *)v14 + 1) = 0x4010000000000000;
  v14[16] = 0;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857DD90);
  sub_22D68FB1C(a1, a2, a3, a4, a5, (uint64_t)&v14[*(int *)(v15 + 44)]);
  char v16 = sub_22D6CB8E8();
  v27[0] = a2;
  v27[1] = a3;
  v27[2] = a4;
  v27[3] = a5;
  _s9ItemShelfVMa();
  sub_22D6CADB8();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  sub_22D692E48((uint64_t)v14, a6);
  uint64_t v25 = a6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26857DD30) + 36);
  *(unsigned char *)uint64_t v25 = v16;
  *(void *)(v25 + 8) = v18;
  *(void *)(v25 + 16) = v20;
  *(void *)(v25 + 24) = v22;
  *(void *)(v25 + 32) = v24;
  *(unsigned char *)(v25 + 40) = 0;
  return sub_22D692EB0((uint64_t)v14, &qword_26857DD48);
}

uint64_t sub_22D68FB1C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = sub_22D6CB578();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v70 = v12;
  uint64_t v71 = v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v66 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857C370);
  uint64_t v68 = *(void *)(v15 - 8);
  uint64_t v69 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v67 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  unint64_t v72 = (char *)&v59 - v18;
  uint64_t v19 = *a1;
  uint64_t v20 = a1[1];
  uint64_t v61 = a1;
  uint64_t v73 = v19;
  uint64_t v74 = v20;
  sub_22D604560();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_22D6CBAF8();
  uint64_t v23 = v22;
  uint64_t v73 = a2;
  uint64_t v74 = a3;
  LOBYTE(a2) = v24 & 1;
  uint64_t v75 = a4;
  uint64_t v76 = a5;
  _s9ItemShelfVMa();
  uint64_t v25 = sub_22D6CBA98();
  uint64_t v27 = v26;
  LOBYTE(a5) = v28 & 1;
  sub_22D604A88(v21, v23, a2);
  swift_bridgeObjectRelease();
  uint64_t v73 = sub_22D6CBF48();
  uint64_t v29 = sub_22D6CBA68();
  uint64_t v60 = v29;
  uint64_t v64 = v31;
  uint64_t v65 = v30;
  int v63 = v32 & 1;
  sub_22D604A88(v25, v27, a5);
  swift_release();
  swift_bridgeObjectRelease();
  int v62 = sub_22D6CB8E8();
  sub_22D6CADB8();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v41 = v66;
  sub_22D6CB158();
  sub_22D62EAB8();
  sub_22D692EFC((unint64_t *)&qword_26857B498, MEMORY[0x263F19B68]);
  uint64_t v42 = v67;
  uint64_t v43 = v70;
  sub_22D6CBBD8();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v41, v43);
  uint64_t v45 = v68;
  uint64_t v44 = v69;
  uint64_t v46 = v72;
  (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v72, v42, v69);
  uint64_t v47 = v45;
  uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
  uint64_t v49 = v42;
  uint64_t v50 = v42;
  uint64_t v51 = v44;
  v48(v49, v46, v44);
  uint64_t v52 = v65;
  *(void *)a6 = v29;
  *(void *)(a6 + 8) = v52;
  char v53 = v62;
  LOBYTE(v46) = v63;
  *(unsigned char *)(a6 + 16) = v63;
  *(void *)(a6 + 24) = v64;
  *(unsigned char *)(a6 + 32) = v53;
  *(void *)(a6 + 40) = v34;
  *(void *)(a6 + 48) = v36;
  *(void *)(a6 + 56) = v38;
  *(void *)(a6 + 64) = v40;
  *(unsigned char *)(a6 + 72) = 0;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(qword_26857DD98);
  v48((char *)(a6 + *(int *)(v54 + 48)), v50, v51);
  uint64_t v55 = a6 + *(int *)(v54 + 64);
  *(void *)uint64_t v55 = 0;
  *(unsigned char *)(v55 + 8) = 1;
  uint64_t v56 = v60;
  sub_22D604860(v60, v52, (char)v46);
  uint64_t v57 = *(void (**)(char *, uint64_t))(v47 + 8);
  swift_bridgeObjectRetain();
  v57(v72, v51);
  v57(v50, v51);
  sub_22D604A88(v56, v52, (char)v46);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D68FF80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v45 = a4;
  unint64_t v46 = a5;
  uint64_t v47 = a1;
  uint64_t v48 = a6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD50);
  uint64_t v9 = a3;
  _s12ItemShelfRowVMa();
  uint64_t v10 = sub_22D6CB088();
  unint64_t v11 = sub_22D692990();
  uint64_t v59 = v8;
  uint64_t v60 = MEMORY[0x263F8D6C8];
  uint64_t v61 = v10;
  unint64_t v62 = v11;
  uint64_t v63 = MEMORY[0x263F8D6D8];
  uint64_t v12 = sub_22D6CC1A8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v58 = MEMORY[0x263F18860];
  uint64_t v56 = swift_getWitnessTable();
  uint64_t v43 = v12;
  uint64_t v42 = swift_getWitnessTable();
  uint64_t v13 = sub_22D6CC0B8();
  uint64_t v44 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v40 = (char *)&v35 - v14;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857C070);
  uint64_t v37 = v13;
  uint64_t v15 = sub_22D6CB088();
  uint64_t v41 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v38 = (char *)&v35 - v16;
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v35 = v17;
  uint64_t v18 = sub_22D5DCE80(&qword_26857C068, &qword_26857C070);
  uint64_t v54 = v17;
  uint64_t v55 = v18;
  uint64_t v36 = swift_getWitnessTable();
  uint64_t v59 = v15;
  uint64_t v60 = v36;
  uint64_t v39 = MEMORY[0x263F1AD90];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v20 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v23 = (char *)&v35 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v35 - v24;
  sub_22D6CB368();
  uint64_t v59 = a2;
  uint64_t v60 = v9;
  uint64_t v26 = v9;
  uint64_t v28 = v45;
  unint64_t v27 = v46;
  uint64_t v61 = v45;
  unint64_t v62 = v46;
  _s9ItemShelfVMa();
  uint64_t v49 = a2;
  uint64_t v50 = v26;
  uint64_t v51 = v28;
  unint64_t v52 = v27;
  uint64_t v53 = v47;
  uint64_t v29 = v40;
  sub_22D6CC0A8();
  sub_22D677CA8();
  uint64_t v30 = v38;
  uint64_t v31 = v37;
  sub_22D6CBC28();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v29, v31);
  uint64_t v32 = v36;
  sub_22D6CBCD8();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v30, v15);
  uint64_t v59 = v15;
  uint64_t v60 = v32;
  swift_getOpaqueTypeConformance2();
  sub_22D6B8B10(v23, OpaqueTypeMetadata2);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v20 + 8);
  v33(v23, OpaqueTypeMetadata2);
  sub_22D6B8B10(v25, OpaqueTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v33)(v25, OpaqueTypeMetadata2);
}

uint64_t sub_22D6904AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v41 = a6;
  uint64_t v45 = a2;
  uint64_t v46 = a3;
  uint64_t v33 = a2;
  uint64_t v34 = a3;
  uint64_t v47 = a4;
  unint64_t v48 = a5;
  uint64_t v35 = a4;
  unint64_t v36 = a5;
  uint64_t v10 = _s9ItemShelfVMa();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&KeyPath - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD50);
  uint64_t v40 = v14;
  uint64_t v45 = a2;
  uint64_t v46 = a3;
  uint64_t v47 = a4;
  unint64_t v48 = a5;
  uint64_t v37 = _s12ItemShelfRowVMa();
  uint64_t v15 = sub_22D6CB088();
  unint64_t v39 = sub_22D692990();
  uint64_t v45 = v14;
  uint64_t v46 = MEMORY[0x263F8D6C8];
  uint64_t v47 = v15;
  unint64_t v48 = v39;
  uint64_t v49 = MEMORY[0x263F8D6D8];
  uint64_t v16 = sub_22D6CC1A8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&KeyPath - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&KeyPath - v21;
  uint64_t v23 = v38;
  uint64_t v24 = *(void *)(*(void *)(v38 + *(int *)(v10 + 104)) + 16);
  uint64_t v45 = 0;
  uint64_t v46 = v24;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v23, v10);
  unint64_t v25 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v26 = (char *)swift_allocObject();
  uint64_t v27 = v34;
  *((void *)v26 + 2) = v33;
  *((void *)v26 + 3) = v27;
  unint64_t v28 = v36;
  *((void *)v26 + 4) = v35;
  *((void *)v26 + 5) = v28;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v26[v25], v13, v10);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v44 = MEMORY[0x263F18860];
  uint64_t v31 = swift_getWitnessTable();
  sub_22D6CC188();
  uint64_t v42 = v31;
  swift_getWitnessTable();
  sub_22D6B8B10(v20, v16);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v17 + 8);
  v29(v20, v16);
  sub_22D6B8B10(v22, v16);
  return ((uint64_t (*)(char *, uint64_t))v29)(v22, v16);
}

uint64_t sub_22D69083C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v61 = a7;
  uint64_t v62 = sub_22D6CC4B8();
  uint64_t v13 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v15 = &v46[-v14];
  __dst[0] = a3;
  __dst[1] = a4;
  __dst[2] = a5;
  __dst[3] = a6;
  uint64_t v16 = _s12ItemShelfRowVMa();
  uint64_t v58 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  unint64_t v52 = &v46[-v17];
  uint64_t v18 = sub_22D6CB088();
  uint64_t v56 = *(void *)(v18 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v53 = &v46[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v19);
  uint64_t v57 = &v46[-v21];
  unint64_t v22 = *a1;
  uint64_t v59 = a3;
  __dst[0] = a3;
  __dst[1] = a4;
  uint64_t v60 = a4;
  uint64_t v54 = a5;
  __dst[2] = a5;
  __dst[3] = a6;
  uint64_t v55 = a6;
  uint64_t v23 = (int *)_s9ItemShelfVMa();
  uint64_t v24 = a2 + v23[13];
  unint64_t v25 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v51 = v15;
  uint64_t result = v25(v15, v24, v62);
  if ((v22 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v27 = a2 + v23[26];
    if (v22 < *(void *)(*(void *)v27 + 16))
    {
      uint64_t v28 = *(void *)(*(void *)v27 + 8 * v22 + 32);
      uint64_t v62 = a2 + v23[26];
      uint64_t v50 = sub_22D690D30(v28, (uint64_t)v23);
      uint64_t v49 = v29;
      uint64_t v48 = v30;
      uint64_t v31 = a2 + v23[25];
      char v32 = *(unsigned char *)v31;
      uint64_t v34 = *(void *)(v31 + 8);
      uint64_t v33 = *(void *)(v31 + 16);
      int v47 = *(unsigned __int8 *)(a2 + v23[17]);
      unint64_t v35 = *(void *)(v31 + 24);
      v66[0] = v32;
      uint64_t v67 = v34;
      uint64_t v68 = v33;
      unint64_t v69 = v35;
      char v36 = *(unsigned char *)(a2 + v23[19]);
      long long v65 = *(_OWORD *)(a2 + v23[22]);
      swift_bridgeObjectRetain();
      sub_22D5DB288(v35);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26857DD88);
      sub_22D6CC048();
      uint64_t v37 = __dst[0];
      uint64_t v38 = __dst[1];
      uint64_t v39 = v56;
      uint64_t v40 = __dst[2];
      memcpy(__dst, (const void *)(a2 + v23[27]), sizeof(__dst));
      uint64_t v41 = v52;
      sub_22D6B095C((uint64_t)v51, v50, v49, v48, v47, v66, v36, v37, v52, v38, v40, __dst);
      uint64_t WitnessTable = swift_getWitnessTable();
      sub_22D6CC238();
      uint64_t v43 = v53;
      sub_22D6CBDA8();
      (*(void (**)(void *, uint64_t))(v58 + 8))(v41, v16);
      uint64_t v63 = WitnessTable;
      uint64_t v64 = MEMORY[0x263F18860];
      swift_getWitnessTable();
      uint64_t v44 = v57;
      sub_22D6B8B10(v43, v18);
      uint64_t v45 = *(void (**)(unsigned char *, uint64_t))(v39 + 8);
      v45(v43, v18);
      sub_22D6B8B10(v44, v18);
      return ((uint64_t (*)(unsigned char *, uint64_t))v45)(v44, v18);
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_22D690D30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D6CC4B8();
  swift_getWitnessTable();
  uint64_t v8 = sub_22D6CD208();
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v29 = v5 + 16;
  uint64_t v30 = v2;
  uint64_t v28 = v9;
  v9(v7, v2, a2);
  if (v8 <= v4)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a2);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v26 = v7 + 24;
    uint64_t v27 = v4;
    uint64_t v11 = *(uint64_t (**)(void, void))(v5 + 8);
    v25[2] = v5 + 8;
    v25[1] = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v12 = MEMORY[0x263F8EE78];
    uint64_t v13 = v4;
    while (1)
    {
      uint64_t v14 = *(void *)&v26[*(int *)(a2 + 108)];
      uint64_t v15 = v11;
      uint64_t result = v11(v7, a2);
      if (v10 >= v14) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22D6633D4();
        uint64_t v12 = v19;
      }
      unint64_t v17 = *(void *)(v12 + 16);
      if (v17 >= *(void *)(v12 + 24) >> 1)
      {
        sub_22D6633D4();
        uint64_t v12 = v20;
      }
      *(void *)(v12 + 16) = v17 + 1;
      *(void *)(v12 + 8 * v17 + 32) = v13 + v10++;
      swift_getWitnessTable();
      uint64_t v18 = sub_22D6CD208();
      v28(v7, v30, a2);
      uint64_t v11 = v15;
      if (v13 + v10 >= v18)
      {
        uint64_t v4 = v27;
        uint64_t result = v11(v7, a2);
        goto LABEL_12;
      }
    }
    uint64_t v4 = v27;
  }
LABEL_12:
  uint64_t v21 = *(void *)(v30 + *(int *)(a2 + 108) + 24);
  if (!v21)
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v22 = *(void *)(v12 + 16) % v21;
  if (!v22) {
    goto LABEL_17;
  }
  uint64_t v23 = v21 - v22;
  if (__OFSUB__(v21, v22))
  {
    __break(1u);
LABEL_17:
    uint64_t v23 = 0;
  }
  uint64_t result = sub_22D69115C(0, v23);
  if (v4 != 0x8000000000000000 || v21 != -1) {
    return v12;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_22D69101C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_22D6CB728();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  if ((a3 & 1) == 0) {
    sub_22D6CADB8();
  }
  v17[1] = v12;
  v17[2] = v13;
  v17[3] = v14;
  v17[4] = v15;
  char v18 = a3 & 1;
  sub_22D6CB718();
  MEMORY[0x230F87DB0](v11, a4, v8, a5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_22D69115C(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = sub_22D6CD488();
    __break(1u);
  }
  else if (a2)
  {
    uint64_t result = sub_22D6CD078();
    uint64_t v5 = 0;
    *(void *)(result + 16) = a2;
    do
    {
      uint64_t v6 = result + 8 * v5++;
      *(void *)(v6 + 32) = a1;
    }
    while (a2 != v5);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

BOOL sub_22D691210(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  BOOL v8 = sub_22D662E70(a1, a2) && a3 == a5;
  return a4 == a6 && v8;
}

uint64_t sub_22D69125C(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_2_10();
}

uint64_t sub_22D6912A0(uint64_t a1)
{
  sub_22D6CD628();
  sub_22D69125C((uint64_t)v3, a1);
  return sub_22D6CD668();
}

uint64_t sub_22D691300(void *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  if (sub_22D662E70(a1, a4)) {
    return sub_22D662E70(a2, a5) & (a3 == a6);
  }
  else {
    return 0;
  }
}

uint64_t sub_22D691360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22D6CD638();
}

uint64_t sub_22D6913AC(uint64_t a1, uint64_t a2)
{
  sub_22D6CD628();
  sub_22D691360((uint64_t)v5, a1, a2);
  return sub_22D6CD668();
}

BOOL sub_22D69140C(uint64_t a1, uint64_t a2)
{
  return sub_22D691210(*(void **)a1, *(void **)a2, *(double *)(a1 + 8), *(double *)(a1 + 16), *(double *)(a2 + 8), *(double *)(a2 + 16));
}

uint64_t sub_22D691428()
{
  return sub_22D6912A0(*v0);
}

uint64_t sub_22D691434(uint64_t a1)
{
  return sub_22D69125C(a1, *v1);
}

uint64_t sub_22D691440()
{
  sub_22D6CD628();
  sub_22D69125C((uint64_t)v2, *v0);
  return sub_22D6CD668();
}

uint64_t sub_22D691484(uint64_t a1, uint64_t a2)
{
  return sub_22D691300(*(void **)a1, *(void **)(a1 + 8), *(void *)(a1 + 16), *(void **)a2, *(void **)(a2 + 8), *(void *)(a2 + 16)) & 1;
}

uint64_t sub_22D6914C0()
{
  return sub_22D6913AC(*v0, v0[1]);
}

uint64_t sub_22D6914CC(uint64_t a1)
{
  return sub_22D691360(a1, *v1, v1[1]);
}

uint64_t sub_22D6914D8()
{
  sub_22D6CD628();
  sub_22D691360((uint64_t)v2, *v0, v0[1]);
  return sub_22D6CD668();
}

BOOL sub_22D69151C(uint64_t a1, uint64_t a2)
{
  return *(double *)a1 == *(double *)a2
      && *(double *)(a1 + 8) == *(double *)(a2 + 8)
      && *(double *)(a1 + 16) == *(double *)(a2 + 16)
      && *(void *)(a1 + 24) == *(void *)(a2 + 24)
      && *(double *)(a1 + 32) == *(double *)(a2 + 32)
      && *(double *)(a1 + 40) == *(double *)(a2 + 40)
      && *(double *)(a1 + 48) == *(double *)(a2 + 48)
      && ((*(unsigned __int8 *)(a1 + 56) ^ *(unsigned __int8 *)(a2 + 56)) & 1) == 0
      && *(double *)(a1 + 64) == *(double *)(a2 + 64)
      && *(double *)(a1 + 72) == *(double *)(a2 + 72)
      && *(double *)(a1 + 80) == *(double *)(a2 + 80);
}

uint64_t sub_22D6915D8()
{
  return OUTLINED_FUNCTION_2_10();
}

uint64_t sub_22D691658()
{
  return sub_22D6CD668();
}

uint64_t sub_22D6916A4()
{
  return sub_22D6CD668();
}

uint64_t sub_22D6916E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 96);
}

void sub_22D6916EC()
{
  sub_22D6CC4B8();
  if (v0 <= 0x3F)
  {
    sub_22D66C294();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void *sub_22D691834(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[13];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_22D6CC4B8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[14];
    unint64_t v14 = *(void *)((char *)a2 + v13);
    sub_22D5DB288(v14);
    *(void *)((char *)v4 + v13) = v14;
    uint64_t v15 = a3[16];
    *(void *)((char *)v4 + a3[15]) = *(void *)((char *)a2 + a3[15]);
    *(void *)((char *)v4 + v15) = *(void *)((char *)a2 + v15);
    uint64_t v16 = a3[18];
    *((unsigned char *)v4 + a3[17]) = *((unsigned char *)a2 + a3[17]);
    *((unsigned char *)v4 + v16) = *((unsigned char *)a2 + v16);
    uint64_t v17 = a3[20];
    *((unsigned char *)v4 + a3[19]) = *((unsigned char *)a2 + a3[19]);
    char v18 = (void *)((char *)v4 + v17);
    uint64_t v19 = (void *)((char *)a2 + v17);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    *char v18 = v21;
    v18[1] = v20;
    uint64_t v22 = a3[21];
    uint64_t v23 = (void *)((char *)v4 + v22);
    uint64_t v24 = (void *)((char *)a2 + v22);
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(qword_26857D320);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v25 = sub_22D6CB078();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    }
    else
    {
      *uint64_t v23 = *v24;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v27 = a3[22];
    uint64_t v28 = a3[23];
    uint64_t v29 = (void *)((char *)v4 + v27);
    uint64_t v30 = (void *)((char *)a2 + v27);
    uint64_t v31 = v30[1];
    *uint64_t v29 = *v30;
    v29[1] = v31;
    char v32 = (void *)((char *)v4 + v28);
    uint64_t v33 = (void *)((char *)a2 + v28);
    uint64_t v34 = v33[1];
    *char v32 = *v33;
    v32[1] = v34;
    uint64_t v35 = a3[24];
    char v36 = (char *)v4 + v35;
    uint64_t v37 = (char *)a2 + v35;
    *char v36 = *v37;
    uint64_t v38 = *((void *)v37 + 2);
    *((void *)v36 + 1) = *((void *)v37 + 1);
    *((void *)v36 + 2) = v38;
    unint64_t v39 = *((void *)v37 + 3);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_22D5DB288(v39);
    *((void *)v36 + 3) = v39;
    uint64_t v40 = a3[25];
    uint64_t v41 = (char *)v4 + v40;
    uint64_t v42 = (char *)a2 + v40;
    *uint64_t v41 = *v42;
    uint64_t v43 = *((void *)v42 + 2);
    *((void *)v41 + 1) = *((void *)v42 + 1);
    *((void *)v41 + 2) = v43;
    unint64_t v44 = *((void *)v42 + 3);
    swift_bridgeObjectRetain();
    sub_22D5DB288(v44);
    *((void *)v41 + 3) = v44;
    uint64_t v45 = a3[26];
    uint64_t v46 = a3[27];
    int v47 = (char *)v4 + v45;
    uint64_t v48 = (char *)a2 + v45;
    *(void *)int v47 = *(void *)v48;
    *(_OWORD *)(v47 + 8) = *(_OWORD *)(v48 + 8);
    memcpy((char *)v4 + v46, (char *)a2 + v46, 0x58uLL);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_22D691AF4(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[13];
  uint64_t v5 = sub_22D6CC4B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  sub_22D5DB9FC(*(void *)(a1 + a2[14]));
  swift_release();
  swift_release();
  uint64_t v6 = a1 + a2[21];
  __swift_instantiateConcreteTypeFromMangledName(qword_26857D320);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_22D6CB078();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  uint64_t v8 = a1 + a2[24];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v8 + 24));
  uint64_t v9 = a1 + a2[25];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v9 + 24));
  return swift_bridgeObjectRelease();
}

void *sub_22D691C6C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[13];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22D6CC4B8();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[14];
  unint64_t v13 = *(void *)((char *)a2 + v12);
  sub_22D5DB288(v13);
  *(void *)((char *)a1 + v12) = v13;
  uint64_t v14 = a3[16];
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  uint64_t v15 = a3[18];
  *((unsigned char *)a1 + a3[17]) = *((unsigned char *)a2 + a3[17]);
  *((unsigned char *)a1 + v15) = *((unsigned char *)a2 + v15);
  uint64_t v16 = a3[20];
  *((unsigned char *)a1 + a3[19]) = *((unsigned char *)a2 + a3[19]);
  uint64_t v17 = (void *)((char *)a1 + v16);
  char v18 = (void *)((char *)a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  uint64_t v21 = a3[21];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(qword_26857D320);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_22D6CB078();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  }
  else
  {
    *uint64_t v22 = *v23;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v25 = a3[22];
  uint64_t v26 = a3[23];
  uint64_t v27 = (void *)((char *)a1 + v25);
  uint64_t v28 = (void *)((char *)a2 + v25);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  uint64_t v30 = (void *)((char *)a1 + v26);
  uint64_t v31 = (void *)((char *)a2 + v26);
  uint64_t v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  uint64_t v33 = a3[24];
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  *uint64_t v34 = *v35;
  uint64_t v36 = *((void *)v35 + 2);
  *((void *)v34 + 1) = *((void *)v35 + 1);
  *((void *)v34 + 2) = v36;
  unint64_t v37 = *((void *)v35 + 3);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_22D5DB288(v37);
  *((void *)v34 + 3) = v37;
  uint64_t v38 = a3[25];
  unint64_t v39 = (char *)a1 + v38;
  uint64_t v40 = (char *)a2 + v38;
  *unint64_t v39 = *v40;
  uint64_t v41 = *((void *)v40 + 2);
  *((void *)v39 + 1) = *((void *)v40 + 1);
  *((void *)v39 + 2) = v41;
  unint64_t v42 = *((void *)v40 + 3);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v42);
  *((void *)v39 + 3) = v42;
  uint64_t v43 = a3[26];
  uint64_t v44 = a3[27];
  uint64_t v45 = (char *)a1 + v43;
  uint64_t v46 = (char *)a2 + v43;
  *(void *)uint64_t v45 = *(void *)v46;
  *(_OWORD *)(v45 + 8) = *(_OWORD *)(v46 + 8);
  memcpy((char *)a1 + v44, (char *)a2 + v44, 0x58uLL);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_22D691EDC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[13];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22D6CC4B8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[14];
  unint64_t v11 = *(void *)((char *)a2 + v10);
  sub_22D5DB288(v11);
  unint64_t v12 = *(void *)((char *)a1 + v10);
  *(void *)((char *)a1 + v10) = v11;
  sub_22D5DB9FC(v12);
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  *(void *)((char *)a1 + a3[16]) = *(void *)((char *)a2 + a3[16]);
  swift_retain();
  swift_release();
  *((unsigned char *)a1 + a3[17]) = *((unsigned char *)a2 + a3[17]);
  *((unsigned char *)a1 + a3[18]) = *((unsigned char *)a2 + a3[18]);
  *((unsigned char *)a1 + a3[19]) = *((unsigned char *)a2 + a3[19]);
  uint64_t v13 = a3[20];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  swift_retain();
  swift_release();
  *((void *)v14 + 1) = *((void *)v15 + 1);
  if (a1 != a2)
  {
    uint64_t v16 = a3[21];
    uint64_t v17 = (void *)((char *)a1 + v16);
    char v18 = (void *)((char *)a2 + v16);
    sub_22D692EB0((uint64_t)a1 + v16, qword_26857D320);
    __swift_instantiateConcreteTypeFromMangledName(qword_26857D320);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_22D6CB078();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *uint64_t v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v20 = a3[22];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_retain();
  swift_release();
  uint64_t v23 = a3[23];
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (void *)((char *)a2 + v23);
  *uint64_t v24 = *v25;
  v24[1] = v25[1];
  swift_retain();
  swift_release();
  uint64_t v26 = a3[24];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  *uint64_t v27 = *((unsigned char *)a2 + v26);
  *((void *)v27 + 1) = *(void *)((char *)a2 + v26 + 8);
  *((void *)v27 + 2) = *(void *)((char *)a2 + v26 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v29 = *((void *)v28 + 3);
  sub_22D5DB288(v29);
  unint64_t v30 = *((void *)v27 + 3);
  *((void *)v27 + 3) = v29;
  sub_22D5DB9FC(v30);
  uint64_t v31 = a3[25];
  uint64_t v32 = (char *)a1 + v31;
  uint64_t v33 = (char *)a2 + v31;
  *uint64_t v32 = *((unsigned char *)a2 + v31);
  *((void *)v32 + 1) = *(void *)((char *)a2 + v31 + 8);
  *((void *)v32 + 2) = *(void *)((char *)a2 + v31 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v34 = *((void *)v33 + 3);
  sub_22D5DB288(v34);
  unint64_t v35 = *((void *)v32 + 3);
  *((void *)v32 + 3) = v34;
  sub_22D5DB9FC(v35);
  uint64_t v36 = a3[26];
  unint64_t v37 = (char *)a1 + v36;
  uint64_t v38 = (char *)a2 + v36;
  *(void *)((char *)a1 + v36) = *(void *)((char *)a2 + v36);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v37 + 1) = *((void *)v38 + 1);
  *((void *)v37 + 2) = *((void *)v38 + 2);
  uint64_t v39 = a3[27];
  uint64_t v40 = (char *)a1 + v39;
  uint64_t v41 = (char *)a2 + v39;
  *(void *)uint64_t v40 = *(void *)v41;
  *((void *)v40 + 1) = *((void *)v41 + 1);
  *((void *)v40 + 2) = *((void *)v41 + 2);
  *((void *)v40 + 3) = *((void *)v41 + 3);
  *((void *)v40 + 4) = *((void *)v41 + 4);
  *((void *)v40 + 5) = *((void *)v41 + 5);
  *((void *)v40 + 6) = *((void *)v41 + 6);
  v40[56] = v41[56];
  *((void *)v40 + 8) = *((void *)v41 + 8);
  *((void *)v40 + 9) = *((void *)v41 + 9);
  *((void *)v40 + 10) = *((void *)v41 + 10);
  return a1;
}

_OWORD *sub_22D692250(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[13];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22D6CC4B8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[15];
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  uint64_t v11 = a3[17];
  *(void *)((char *)a1 + a3[16]) = *(void *)((char *)a2 + a3[16]);
  *((unsigned char *)a1 + v11) = *((unsigned char *)a2 + v11);
  uint64_t v12 = a3[19];
  *((unsigned char *)a1 + a3[18]) = *((unsigned char *)a2 + a3[18]);
  *((unsigned char *)a1 + v12) = *((unsigned char *)a2 + v12);
  uint64_t v13 = a3[21];
  *(_OWORD *)((char *)a1 + a3[20]) = *(_OWORD *)((char *)a2 + a3[20]);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(qword_26857D320);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_22D6CB078();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  uint64_t v18 = a3[23];
  *(_OWORD *)((char *)a1 + a3[22]) = *(_OWORD *)((char *)a2 + a3[22]);
  *(_OWORD *)((char *)a1 + v18) = *(_OWORD *)((char *)a2 + v18);
  uint64_t v19 = a3[24];
  uint64_t v20 = a3[25];
  long long v21 = *(_OWORD *)((char *)a2 + v19);
  long long v22 = *(_OWORD *)((char *)a2 + v19 + 16);
  uint64_t v23 = (_OWORD *)((char *)a1 + v19);
  *uint64_t v23 = v21;
  v23[1] = v22;
  uint64_t v24 = (_OWORD *)((char *)a1 + v20);
  uint64_t v25 = (_OWORD *)((char *)a2 + v20);
  long long v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = a3[26];
  uint64_t v28 = a3[27];
  unint64_t v29 = (char *)a1 + v27;
  unint64_t v30 = (char *)a2 + v27;
  *(_OWORD *)unint64_t v29 = *(_OWORD *)v30;
  *((void *)v29 + 2) = *((void *)v30 + 2);
  memcpy((char *)a1 + v28, (char *)a2 + v28, 0x58uLL);
  return a1;
}

void *sub_22D692430(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[13];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22D6CC4B8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[14];
  unint64_t v12 = *(void *)((char *)a1 + v11);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  sub_22D5DB9FC(v12);
  uint64_t v13 = a3[16];
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  swift_release();
  uint64_t v14 = a3[18];
  *((unsigned char *)a1 + a3[17]) = *((unsigned char *)a2 + a3[17]);
  *((unsigned char *)a1 + v14) = *((unsigned char *)a2 + v14);
  uint64_t v15 = a3[20];
  *((unsigned char *)a1 + a3[19]) = *((unsigned char *)a2 + a3[19]);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  *(void *)((char *)a1 + v15) = *(void *)((char *)a2 + v15);
  swift_release();
  *((void *)v16 + 1) = *((void *)v17 + 1);
  if (a1 != a2)
  {
    uint64_t v18 = a3[21];
    uint64_t v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)a2 + v18;
    sub_22D692EB0((uint64_t)a1 + v18, qword_26857D320);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(qword_26857D320);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = sub_22D6CB078();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
  }
  uint64_t v23 = a3[22];
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (void *)((char *)a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_release();
  uint64_t v28 = a3[23];
  unint64_t v29 = (void *)((char *)a1 + v28);
  unint64_t v30 = (void *)((char *)a2 + v28);
  *unint64_t v29 = *v30;
  v29[1] = v30[1];
  swift_release();
  uint64_t v31 = a3[24];
  uint64_t v32 = (char *)a1 + v31;
  uint64_t v33 = (char *)a2 + v31;
  *uint64_t v32 = *((unsigned char *)a2 + v31);
  uint64_t v34 = *(void *)((char *)a2 + v31 + 16);
  *((void *)v32 + 1) = *(void *)((char *)a2 + v31 + 8);
  *((void *)v32 + 2) = v34;
  swift_bridgeObjectRelease();
  unint64_t v35 = *((void *)v32 + 3);
  *((void *)v32 + 3) = *((void *)v33 + 3);
  sub_22D5DB9FC(v35);
  uint64_t v36 = a3[25];
  unint64_t v37 = (char *)a1 + v36;
  uint64_t v38 = (char *)a2 + v36;
  *unint64_t v37 = *((unsigned char *)a2 + v36);
  uint64_t v39 = *(void *)((char *)a2 + v36 + 16);
  *((void *)v37 + 1) = *(void *)((char *)a2 + v36 + 8);
  *((void *)v37 + 2) = v39;
  swift_bridgeObjectRelease();
  unint64_t v40 = *((void *)v37 + 3);
  *((void *)v37 + 3) = *((void *)v38 + 3);
  sub_22D5DB9FC(v40);
  uint64_t v41 = a3[26];
  unint64_t v42 = (char *)a1 + v41;
  uint64_t v43 = (char *)a2 + v41;
  *(void *)((char *)a1 + v41) = *(void *)((char *)a2 + v41);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v42 + 8) = *(_OWORD *)(v43 + 8);
  uint64_t v44 = a3[27];
  uint64_t v45 = (char *)a1 + v44;
  uint64_t v46 = (char *)a2 + v44;
  *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
  *((void *)v45 + 2) = *((void *)v46 + 2);
  *((void *)v45 + 3) = *((void *)v46 + 3);
  *((_OWORD *)v45 + 2) = *((_OWORD *)v46 + 2);
  *((void *)v45 + 6) = *((void *)v46 + 6);
  v45[56] = v46[56];
  *((_OWORD *)v45 + 4) = *((_OWORD *)v46 + 4);
  *((void *)v45 + 10) = *((void *)v46 + 10);
  return a1;
}

uint64_t sub_22D692710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D692724);
}

uint64_t sub_22D692724(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_22D6CC4B8();
    OUTLINED_FUNCTION_3();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 52);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(qword_26857DCA8);
      uint64_t v11 = *(int *)(a3 + 84);
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t sub_22D6927E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D6927F4);
}

uint64_t sub_22D6927F4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_22D6CC4B8();
    OUTLINED_FUNCTION_3();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 52);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(qword_26857DCA8);
      uint64_t v11 = *(int *)(a4 + 84);
    }
    return __swift_storeEnumTagSinglePayload(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_22D6928AC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22D6928F0()
{
  unint64_t result = qword_26857DD38;
  if (!qword_26857DD38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD30);
    sub_22D5DCE80(&qword_26857DD40, &qword_26857DD48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857DD38);
  }
  return result;
}

unint64_t sub_22D692990()
{
  unint64_t result = qword_26857DD58;
  if (!qword_26857DD58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD50);
    sub_22D692A0C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857DD58);
  }
  return result;
}

unint64_t sub_22D692A0C()
{
  unint64_t result = qword_26857DD60;
  if (!qword_26857DD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857DD60);
  }
  return result;
}

uint64_t sub_22D692A58()
{
  return sub_22D692E30((uint64_t (*)(void, void, void, void, void))sub_22D68D9F4);
}

uint64_t sub_22D692A74()
{
  uint64_t v0 = _s9ItemShelfVMa();
  OUTLINED_FUNCTION_1_0(v0);
  return sub_22D68F500();
}

unint64_t sub_22D692AF8()
{
  unint64_t result = qword_26857DD70;
  if (!qword_26857DD70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857DD70);
  }
  return result;
}

uint64_t sub_22D692B44()
{
  return sub_22D692E30((uint64_t (*)(void, void, void, void, void))sub_22D68FF80);
}

uint64_t sub_22D692B5C()
{
  return sub_22D692E30((uint64_t (*)(void, void, void, void, void))sub_22D6904AC);
}

uint64_t objectdestroyTm_7()
{
  unint64_t v1 = (int *)_s9ItemShelfVMa();
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*((void *)v1 - 1) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v1 - 1) + 80));
  swift_bridgeObjectRelease();
  sub_22D6CC4B8();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_22();
  v3();
  sub_22D5DB9FC(*(void *)(v2 + v1[14]));
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(qword_26857D320);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D6CB078();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_22();
    v4();
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  uint64_t v5 = v2 + v1[24];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v5 + 24));
  uint64_t v6 = v2 + v1[25];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v6 + 24));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22D692D64@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v9 = _s9ItemShelfVMa();
  OUTLINED_FUNCTION_1_0(v9);
  uint64_t v11 = (uint64_t)v2 + ((*(unsigned __int8 *)(v10 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  return sub_22D69083C(a1, v11, v5, v6, v7, v8, a2);
}

uint64_t sub_22D692E00()
{
  return sub_22D692E30((uint64_t (*)(void, void, void, void, void))sub_22D68F700);
}

uint64_t sub_22D692E18()
{
  return sub_22D692E30((uint64_t (*)(void, void, void, void, void))sub_22D68F9B0);
}

uint64_t sub_22D692E30(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_22D692E48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857DD48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D692EB0(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_22();
  v3();
  return a1;
}

uint64_t sub_22D692EFC(unint64_t *a1, void (*a2)(uint64_t))
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

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t sub_22D692F4C(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 88))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 56);
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22D692F98(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 88) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 88) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 56) = a2 + 1;
    }
  }
  return result;
}

uint64_t _s9ItemShelfV9ConstantsVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D693008(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22D693040()
{
  return swift_bridgeObjectRelease();
}

void *sub_22D693048(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

uint64_t sub_22D6930A0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t _s9ItemShelfV6LayoutVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D693100()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D693584()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D6935A0()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D6935BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_22D6CD638();
  if (v3)
  {
    uint64_t v5 = a2 + 32;
    do
    {
      v5 += 8;
      uint64_t result = sub_22D6CD638();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_22D693610()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_22D69364C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_22D69368C(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t sub_22D6936F4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t sub_22D69373C(uint64_t *a1, int a2)
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

uint64_t sub_22D69377C(uint64_t result, int a2, int a3)
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t _s9ItemShelfV12ColumnLayoutVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D6937D4()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_6_8()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return v0;
}

uint64_t sub_22D693814@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + *(int *)(sub_22D6CC058() + 28)) = 0;
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32);
  return v6(a3, a1, a2);
}

void sub_22D693894()
{
  OUTLINED_FUNCTION_13();
  char v46 = v2;
  sub_22D6CA128();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_14_4(v4, v42);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_13_5(v6, v43);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v7);
  sub_22D6CA188();
  OUTLINED_FUNCTION_0_0();
  uint64_t v45 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_20_3();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_28_2(v11, v12, v13, v14, v15, v16, v17, v18, v44);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D038);
  MEMORY[0x270FA5388](v19 - 8);
  OUTLINED_FUNCTION_16_3();
  uint64_t v20 = sub_22D6CCAA8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v22 = v21;
  MEMORY[0x270FA5388](v23);
  uint64_t v24 = OUTLINED_FUNCTION_17_3();
  OUTLINED_FUNCTION_0_0();
  uint64_t v26 = v25;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_19_4();
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_9_9();
  OUTLINED_FUNCTION_60();
  v29();
  sub_22D6CCA68();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v0, v20);
  if (__swift_getEnumTagSinglePayload(v1, 1, v24) == 1)
  {
    sub_22D5DD960(v1, &qword_26857D038);
  }
  else
  {
    uint64_t v30 = OUTLINED_FUNCTION_11_8();
    v31(v30);
    if (v46)
    {
      sub_22D6CA138();
      sub_22D6CA118();
      sub_22D6CA1A8();
      OUTLINED_FUNCTION_22();
      v38();
      OUTLINED_FUNCTION_22();
      v39();
      uint64_t v40 = OUTLINED_FUNCTION_32_2();
      v41(v40);
    }
    else
    {
      uint64_t v32 = OUTLINED_FUNCTION_12_5();
      uint64_t v34 = v33(v32);
      MEMORY[0x230F85F30](v34);
      sub_22D6CA168();
      sub_22D6CA158();
      OUTLINED_FUNCTION_22();
      v35();
      uint64_t v36 = *(void (**)(void))(v45 + 8);
      OUTLINED_FUNCTION_7_8();
      v36();
      sub_22D699F88(qword_26857DFB8, MEMORY[0x263F07258]);
      sub_22D6CA1B8();
      OUTLINED_FUNCTION_7_8();
      v36();
      unint64_t v37 = *(void (**)(void))(v26 + 8);
      OUTLINED_FUNCTION_15_5();
      v37();
      OUTLINED_FUNCTION_15_5();
      v37();
    }
  }
  OUTLINED_FUNCTION_12_3();
}

void sub_22D693C64()
{
  OUTLINED_FUNCTION_13();
  char v44 = v1;
  sub_22D6CA128();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_14_4(v3, v40);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_13_5(v5, v41);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v6);
  sub_22D6CA188();
  OUTLINED_FUNCTION_0_0();
  uint64_t v43 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_20_3();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_28_2(v10, v11, v12, v13, v14, v15, v16, v17, v42);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D038);
  MEMORY[0x270FA5388](v18 - 8);
  OUTLINED_FUNCTION_16_3();
  sub_22D6CCA28();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v19);
  uint64_t v20 = OUTLINED_FUNCTION_17_3();
  OUTLINED_FUNCTION_0_0();
  uint64_t v22 = v21;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_19_4();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_9_9();
  OUTLINED_FUNCTION_60();
  v25();
  sub_22D6CC9F8();
  uint64_t v26 = OUTLINED_FUNCTION_25_4();
  v27(v26);
  if (__swift_getEnumTagSinglePayload(v0, 1, v20) == 1)
  {
    sub_22D5DD960(v0, &qword_26857D038);
  }
  else
  {
    uint64_t v28 = OUTLINED_FUNCTION_11_8();
    v29(v28);
    if (v44)
    {
      sub_22D6CA138();
      sub_22D6CA118();
      sub_22D6CA1A8();
      OUTLINED_FUNCTION_22();
      v36();
      OUTLINED_FUNCTION_22();
      v37();
      uint64_t v38 = OUTLINED_FUNCTION_32_2();
      v39(v38);
    }
    else
    {
      uint64_t v30 = OUTLINED_FUNCTION_12_5();
      uint64_t v32 = v31(v30);
      MEMORY[0x230F85F30](v32);
      sub_22D6CA168();
      sub_22D6CA158();
      OUTLINED_FUNCTION_22();
      v33();
      uint64_t v34 = *(void (**)(void))(v43 + 8);
      OUTLINED_FUNCTION_7_8();
      v34();
      sub_22D699F88(qword_26857DFB8, MEMORY[0x263F07258]);
      sub_22D6CA1B8();
      OUTLINED_FUNCTION_7_8();
      v34();
      unint64_t v35 = *(void (**)(void))(v22 + 8);
      OUTLINED_FUNCTION_15_5();
      v35();
      OUTLINED_FUNCTION_15_5();
      v35();
    }
  }
  OUTLINED_FUNCTION_12_3();
}

void sub_22D694024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_13();
  uint64_t v54 = v23;
  uint64_t v55 = v22;
  int v56 = v24;
  uint64_t v26 = v25;
  uint64_t v52 = v27;
  uint64_t v53 = v28;
  uint64_t v57 = v29;
  uint64_t v58 = v23;
  uint64_t v59 = v30;
  uint64_t v60 = a21;
  uint64_t v61 = a22;
  uint64_t v31 = (int *)_s21AdditionalContentViewVMa();
  OUTLINED_FUNCTION_0_0();
  uint64_t v33 = v32;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v34);
  uint64_t v36 = (char *)&v52 - v35;
  char v37 = *(unsigned char *)v26;
  uint64_t v39 = *(void *)(v26 + 8);
  uint64_t v38 = *(void *)(v26 + 16);
  unint64_t v40 = *(void *)(v26 + 24);
  _s9ViewModelCMa();
  swift_getWitnessTable();
  *((void *)v36 + 7) = sub_22D6CB198();
  *((void *)v36 + 8) = v41;
  *((void *)v36 + 9) = swift_getKeyPath();
  v36[112] = 0;
  uint64_t v42 = &v36[v31[18]];
  *uint64_t v42 = sub_22D5D10B4() & 1;
  *((void *)v42 + 1) = v43;
  char v44 = (uint64_t *)&v36[v31[19]];
  *char v44 = sub_22D68CD84();
  v44[1] = v45;
  char v46 = &v36[v31[22]];
  *(_OWORD *)char v46 = xmmword_22D6D29A0;
  *((_OWORD *)v46 + 1) = xmmword_22D6D29B0;
  uint64_t v47 = v53;
  *(void *)uint64_t v36 = v52;
  *((void *)v36 + 1) = v47;
  uint64_t v48 = (uint64_t)&v36[v31[17]];
  uint64_t v49 = sub_22D6CC4B8();
  sub_22D693814(v55, v49, v48);
  v36[16] = v37;
  *((void *)v36 + 3) = v39;
  *((void *)v36 + 4) = v38;
  *((void *)v36 + 5) = v40;
  v36[48] = v56;
  uint64_t v50 = swift_allocObject();
  *(unsigned char *)(v50 + 16) = v37;
  *(void *)(v50 + 24) = v39;
  *(void *)(v50 + 32) = v38;
  *(void *)(v50 + 40) = v40;
  *(void *)&v36[v31[20]] = v50 | 0x4000000000000000;
  uint64_t v51 = &v36[v31[21]];
  *uint64_t v51 = 1;
  *((void *)v51 + 1) = 0;
  *((void *)v51 + 2) = 0;
  *((void *)v51 + 3) = v50 | 0x4000000000000000;
  (*(void (**)(uint64_t, char *, int *))(v33 + 32))(v57, v36, v31);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v40);
  swift_retain();
  OUTLINED_FUNCTION_12_3();
}

uint64_t _s21AdditionalContentViewVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D694258()
{
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_22D694298()
{
  sub_22D6CC4B8();
  uint64_t result = sub_22D6CC058();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22D694390(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *(void *)a1 = *a2;
    a1 = v15 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v8;
    unint64_t v9 = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_22D5DB288(v9);
    *(void *)(a1 + 40) = v9;
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    uint64_t v10 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v10;
    uint64_t v11 = a2 + 9;
    LOBYTE(v9) = *((unsigned char *)a2 + 112);
    swift_retain();
    if (v9)
    {
      uint64_t v12 = (_OWORD *)(a1 + 72);
      uint64_t v13 = a2[12];
      if (v13)
      {
        uint64_t v14 = a2[13];
        *(void *)(a1 + 96) = v13;
        *(void *)(a1 + 104) = v14;
        (**(void (***)(_OWORD *, uint64_t))(v13 - 8))(v12, (uint64_t)(a2 + 9));
      }
      else
      {
        long long v16 = *(_OWORD *)(a2 + 11);
        *uint64_t v12 = *v11;
        *(_OWORD *)(a1 + 88) = v16;
        *(void *)(a1 + 104) = a2[13];
      }
      *(unsigned char *)(a1 + 112) = 1;
    }
    else
    {
      *(void *)(a1 + 72) = *(void *)v11;
      *(unsigned char *)(a1 + 112) = 0;
      swift_retain();
    }
    uint64_t v17 = a3[17];
    uint64_t v18 = a1 + v17;
    uint64_t v19 = (uint64_t)a2 + v17;
    uint64_t v20 = sub_22D6CC4B8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    uint64_t v21 = sub_22D6CC058();
    *(void *)(v18 + *(int *)(v21 + 28)) = *(void *)(v19 + *(int *)(v21 + 28));
    uint64_t v22 = a3[18];
    uint64_t v23 = a3[19];
    uint64_t v24 = a1 + v22;
    uint64_t v25 = (uint64_t)a2 + v22;
    *(unsigned char *)uint64_t v24 = *(unsigned char *)v25;
    *(void *)(v24 + 8) = *(void *)(v25 + 8);
    uint64_t v26 = (void *)(a1 + v23);
    uint64_t v27 = (uint64_t *)((char *)a2 + v23);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = a3[20];
    unint64_t v30 = *(uint64_t *)((char *)a2 + v29);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_22D5DB288(v30);
    *(void *)(a1 + v29) = v30;
    uint64_t v31 = a3[21];
    uint64_t v32 = a1 + v31;
    uint64_t v33 = (uint64_t)a2 + v31;
    *(unsigned char *)uint64_t v32 = *(unsigned char *)v33;
    uint64_t v34 = *(void *)(v33 + 16);
    *(void *)(v32 + 8) = *(void *)(v33 + 8);
    *(void *)(v32 + 16) = v34;
    unint64_t v35 = *(void *)(v33 + 24);
    swift_bridgeObjectRetain();
    sub_22D5DB288(v35);
    *(void *)(v32 + 24) = v35;
    uint64_t v36 = a3[22];
    char v37 = (_OWORD *)(a1 + v36);
    uint64_t v38 = (_OWORD *)((char *)a2 + v36);
    long long v39 = v38[1];
    *char v37 = *v38;
    v37[1] = v39;
  }
  return a1;
}

unint64_t sub_22D6945F0(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(a1 + 40));
  swift_release();
  if (*(unsigned char *)(a1 + 112))
  {
    if (*(void *)(a1 + 96)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 72);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v4 = a1 + a2[17];
  uint64_t v5 = sub_22D6CC4B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  sub_22D6CC058();
  swift_release();
  swift_release();
  swift_release();
  sub_22D5DB9FC(*(void *)(a1 + a2[20]));
  uint64_t v6 = a1 + a2[21];
  swift_bridgeObjectRelease();
  unint64_t v7 = *(void *)(v6 + 24);
  return sub_22D5DB9FC(v7);
}

uint64_t sub_22D694718(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  unint64_t v8 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22D5DB288(v8);
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  uint64_t v10 = (_OWORD *)(a2 + 72);
  LOBYTE(v8) = *(unsigned char *)(a2 + 112);
  swift_retain();
  if (v8)
  {
    uint64_t v11 = (_OWORD *)(a1 + 72);
    uint64_t v12 = *(void *)(a2 + 96);
    if (v12)
    {
      uint64_t v13 = *(void *)(a2 + 104);
      *(void *)(a1 + 96) = v12;
      *(void *)(a1 + 104) = v13;
      (**(void (***)(_OWORD *, uint64_t))(v12 - 8))(v11, a2 + 72);
    }
    else
    {
      long long v14 = *(_OWORD *)(a2 + 88);
      *uint64_t v11 = *v10;
      *(_OWORD *)(a1 + 88) = v14;
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
    }
    *(unsigned char *)(a1 + 112) = 1;
  }
  else
  {
    *(void *)(a1 + 72) = *(void *)v10;
    *(unsigned char *)(a1 + 112) = 0;
    swift_retain();
  }
  uint64_t v15 = a3[17];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_22D6CC4B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  uint64_t v19 = sub_22D6CC058();
  *(void *)(v16 + *(int *)(v19 + 28)) = *(void *)(v17 + *(int *)(v19 + 28));
  uint64_t v20 = a3[18];
  uint64_t v21 = a3[19];
  uint64_t v22 = a1 + v20;
  uint64_t v23 = a2 + v20;
  *(unsigned char *)uint64_t v22 = *(unsigned char *)v23;
  *(void *)(v22 + 8) = *(void *)(v23 + 8);
  uint64_t v24 = (void *)(a1 + v21);
  uint64_t v25 = (void *)(a2 + v21);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = a3[20];
  unint64_t v28 = *(void *)(a2 + v27);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_22D5DB288(v28);
  *(void *)(a1 + v27) = v28;
  uint64_t v29 = a3[21];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  *(unsigned char *)uint64_t v30 = *(unsigned char *)v31;
  uint64_t v32 = *(void *)(v31 + 16);
  *(void *)(v30 + 8) = *(void *)(v31 + 8);
  *(void *)(v30 + 16) = v32;
  unint64_t v33 = *(void *)(v31 + 24);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v33);
  *(void *)(v30 + 24) = v33;
  uint64_t v34 = a3[22];
  unint64_t v35 = (_OWORD *)(a1 + v34);
  uint64_t v36 = (_OWORD *)(a2 + v34);
  long long v37 = v36[1];
  *unint64_t v35 = *v36;
  v35[1] = v37;
  return a1;
}

uint64_t sub_22D694928(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void *)(a2 + 40);
  sub_22D5DB288(v6);
  unint64_t v7 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v6;
  sub_22D5DB9FC(v7);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  if (a1 != a2)
  {
    unint64_t v8 = (long long *)(a2 + 72);
    sub_22D5DD960(a1 + 72, qword_26857AE68);
    if (*(unsigned char *)(a2 + 112))
    {
      uint64_t v9 = *(void *)(a2 + 96);
      if (v9)
      {
        *(void *)(a1 + 96) = v9;
        *(void *)(a1 + 104) = *(void *)(a2 + 104);
        (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 72, a2 + 72);
      }
      else
      {
        long long v10 = *v8;
        long long v11 = *(_OWORD *)(a2 + 88);
        *(void *)(a1 + 104) = *(void *)(a2 + 104);
        *(_OWORD *)(a1 + 72) = v10;
        *(_OWORD *)(a1 + 88) = v11;
      }
      *(unsigned char *)(a1 + 112) = 1;
    }
    else
    {
      *(void *)(a1 + 72) = *(void *)v8;
      *(unsigned char *)(a1 + 112) = 0;
      swift_retain();
    }
  }
  uint64_t v12 = a3[17];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_22D6CC4B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = sub_22D6CC058();
  *(void *)(v13 + *(int *)(v16 + 28)) = *(void *)(v14 + *(int *)(v16 + 28));
  swift_retain();
  swift_release();
  uint64_t v17 = a3[18];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  swift_retain();
  swift_release();
  uint64_t v20 = a3[19];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_retain();
  swift_release();
  uint64_t v23 = a3[20];
  unint64_t v24 = *(void *)(a2 + v23);
  sub_22D5DB288(v24);
  unint64_t v25 = *(void *)(a1 + v23);
  *(void *)(a1 + v23) = v24;
  sub_22D5DB9FC(v25);
  uint64_t v26 = a3[21];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  *(unsigned char *)uint64_t v27 = *(unsigned char *)(a2 + v26);
  *(void *)(v27 + 8) = *(void *)(a2 + v26 + 8);
  *(void *)(v27 + 16) = *(void *)(a2 + v26 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v29 = *(void *)(v28 + 24);
  sub_22D5DB288(v29);
  unint64_t v30 = *(void *)(v27 + 24);
  *(void *)(v27 + 24) = v29;
  sub_22D5DB9FC(v30);
  uint64_t v31 = a3[22];
  uint64_t v32 = (void *)(a1 + v31);
  unint64_t v33 = (void *)(a2 + v31);
  *uint64_t v32 = *v33;
  v32[1] = v33[1];
  v32[2] = v33[2];
  v32[3] = v33[3];
  return a1;
}

uint64_t sub_22D694BF4(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 97) = *(_OWORD *)(a2 + 97);
  uint64_t v7 = a3[17];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22D6CC4B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = sub_22D6CC058();
  *(void *)(v8 + *(int *)(v11 + 28)) = *(void *)(v9 + *(int *)(v11 + 28));
  uint64_t v12 = a3[19];
  *(_OWORD *)(a1 + a3[18]) = *(_OWORD *)(a2 + a3[18]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[21];
  *(void *)(a1 + a3[20]) = *(void *)(a2 + a3[20]);
  uint64_t v14 = (_OWORD *)(a1 + v13);
  uint64_t v15 = (_OWORD *)(a2 + v13);
  long long v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = a3[22];
  uint64_t v18 = (_OWORD *)(a1 + v17);
  uint64_t v19 = (_OWORD *)(a2 + v17);
  long long v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  return a1;
}

uint64_t sub_22D694D1C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  unint64_t v8 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  sub_22D5DB9FC(v8);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  if (a1 != a2)
  {
    sub_22D5DD960(a1 + 72, qword_26857AE68);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 97) = *(_OWORD *)(a2 + 97);
  }
  uint64_t v9 = a3[17];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_22D6CC4B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = sub_22D6CC058();
  *(void *)(v10 + *(int *)(v13 + 28)) = *(void *)(v11 + *(int *)(v13 + 28));
  swift_release();
  uint64_t v14 = a3[18];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(unsigned char *)uint64_t v15 = *(unsigned char *)v16;
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  swift_release();
  uint64_t v17 = a3[19];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_release();
  uint64_t v22 = a3[20];
  unint64_t v23 = *(void *)(a1 + v22);
  *(void *)(a1 + v22) = *(void *)(a2 + v22);
  sub_22D5DB9FC(v23);
  uint64_t v24 = a3[21];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  *(unsigned char *)uint64_t v25 = *(unsigned char *)(a2 + v24);
  uint64_t v27 = *(void *)(a2 + v24 + 16);
  *(void *)(v25 + 8) = *(void *)(a2 + v24 + 8);
  *(void *)(v25 + 16) = v27;
  swift_bridgeObjectRelease();
  unint64_t v28 = *(void *)(v25 + 24);
  *(void *)(v25 + 24) = *(void *)(v26 + 24);
  sub_22D5DB9FC(v28);
  uint64_t v29 = a3[22];
  unint64_t v30 = (_OWORD *)(a1 + v29);
  uint64_t v31 = (_OWORD *)(a2 + v29);
  long long v32 = v31[1];
  *unint64_t v30 = *v31;
  v30[1] = v32;
  return a1;
}

uint64_t sub_22D694EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D694F08);
}

uint64_t sub_22D694F08(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_22D6CC4B8();
    uint64_t v8 = sub_22D6CC058();
    uint64_t v9 = a1 + *(int *)(a3 + 68);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22D694FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D694FBC);
}

uint64_t sub_22D694FBC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_22D6CC4B8();
    uint64_t v7 = sub_22D6CC058();
    uint64_t v8 = v5 + *(int *)(a4 + 68);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_22D695054()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22D695098()
{
  OUTLINED_FUNCTION_13();
  uint64_t v102 = v0;
  uint64_t v2 = v1;
  uint64_t v97 = v3;
  OUTLINED_FUNCTION_0_0();
  uint64_t v95 = v4;
  uint64_t v96 = *(void *)(v5 + 64);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v94 = (char *)v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v7 + 16);
  uint64_t v10 = *(void *)(v7 + 32);
  uint64_t v11 = sub_22D6CC4B8();
  OUTLINED_FUNCTION_28();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  uint64_t v91 = v2;
  uint64_t v13 = v2[3];
  unint64_t v14 = v2[5];
  uint64_t v109 = v9;
  uint64_t v110 = v13;
  uint64_t v92 = v9;
  uint64_t v93 = v10;
  uint64_t v111 = v10;
  unint64_t v112 = v14;
  unint64_t v15 = v14;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  sub_22D6CB088();
  uint64_t v122 = *(void *)(*(void *)(v10 + 32) + 8);
  swift_getWitnessTable();
  sub_22D6CB408();
  sub_22D6CB088();
  swift_getTupleTypeMetadata2();
  uint64_t v16 = sub_22D6CC2C8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v109 = v11;
  uint64_t v110 = AssociatedTypeWitness;
  uint64_t v111 = v16;
  unint64_t v112 = WitnessTable;
  unint64_t v113 = AssociatedConformanceWitness;
  sub_22D6CC1A8();
  uint64_t v121 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6CADD8();
  _s50BottomNavigationPromptAvoidancePaddingViewModifierVMa();
  OUTLINED_FUNCTION_33_2();
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v20 = swift_getWitnessTable();
  uint64_t v119 = v19;
  uint64_t v120 = v20;
  uint64_t v101 = MEMORY[0x263F18E48];
  swift_getWitnessTable();
  OUTLINED_FUNCTION_28();
  sub_22D6CADE8();
  _s27DismissAlertTriggerModifierVMa();
  OUTLINED_FUNCTION_33_2();
  uint64_t v21 = swift_getWitnessTable();
  uint64_t v22 = swift_getWitnessTable();
  uint64_t v117 = v21;
  uint64_t v118 = v22;
  swift_getWitnessTable();
  OUTLINED_FUNCTION_28();
  uint64_t v23 = sub_22D6CAFD8();
  uint64_t v24 = swift_getWitnessTable();
  unint64_t v25 = sub_22D604560();
  uint64_t v109 = v23;
  uint64_t v110 = MEMORY[0x263F8D310];
  uint64_t v111 = v24;
  unint64_t v112 = v25;
  v75[1] = v25;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v88 = v26;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v27);
  uint64_t v99 = v13;
  unint64_t v100 = v15;
  _s18NavigationBarStyleVMa();
  OUTLINED_FUNCTION_29_3();
  uint64_t v28 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v90 = v29;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v30);
  uint64_t v80 = (char *)v75 - v31;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857AF60);
  uint64_t v79 = v32;
  uint64_t done = _s10DoneButtonVMa();
  uint64_t v109 = v23;
  uint64_t v110 = MEMORY[0x263F8D310];
  uint64_t v111 = v24;
  unint64_t v112 = v25;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v35 = swift_getWitnessTable();
  uint64_t v115 = OpaqueTypeConformance2;
  uint64_t v116 = v35;
  uint64_t v98 = v28;
  uint64_t v36 = swift_getWitnessTable();
  uint64_t v78 = v36;
  unint64_t v37 = sub_22D6994D4();
  unint64_t v77 = v37;
  uint64_t v76 = swift_getWitnessTable();
  uint64_t v109 = v28;
  uint64_t v110 = v32;
  uint64_t v111 = done;
  unint64_t v112 = v36;
  unint64_t v113 = v37;
  uint64_t v114 = v76;
  uint64_t v85 = MEMORY[0x263F1AD28];
  uint64_t v83 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v87 = v38;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v39);
  v75[0] = (char *)v75 - v40;
  uint64_t v86 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v89 = v41;
  uint64_t v43 = MEMORY[0x270FA5388](v42);
  uint64_t v81 = (char *)v75 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v43);
  uint64_t v84 = (char *)v75 - v45;
  char v46 = v91;
  uint64_t v47 = v102;
  sub_22D695A94(v91, &v109);
  uint64_t v107 = v109;
  uint64_t v108 = v110;
  uint64_t v48 = v47[1];
  uint64_t v105 = *v47;
  uint64_t v106 = v48;
  swift_checkMetadataState();
  sub_22D6CBC78();
  swift_release();
  sub_22D69AD64(v99, OpaqueTypeMetadata2, v99, OpaqueTypeConformance2);
  OUTLINED_FUNCTION_22();
  v49();
  uint64_t v109 = sub_22D6CC238();
  uint64_t v110 = v50;
  uint64_t v107 = sub_22D63F070();
  uint64_t v108 = v51;
  uint64_t v52 = swift_checkMetadataState();
  uint64_t v53 = v79;
  unint64_t v54 = v78;
  unint64_t v55 = v77;
  uint64_t v56 = v76;
  sub_22D6CBCC8();
  swift_release();
  OUTLINED_FUNCTION_22();
  v57();
  uint64_t v58 = v95;
  uint64_t v59 = v94;
  OUTLINED_FUNCTION_60();
  v60();
  uint64_t v61 = v58;
  unint64_t v62 = (*(unsigned __int8 *)(v58 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
  uint64_t v63 = (char *)swift_allocObject();
  uint64_t v64 = v99;
  *((void *)v63 + 2) = v92;
  *((void *)v63 + 3) = v64;
  unint64_t v65 = v100;
  *((void *)v63 + 4) = v93;
  *((void *)v63 + 5) = v65;
  (*(void (**)(char *, char *, void *))(v61 + 32))(&v63[v62], v59, v46);
  uint64_t v109 = v98;
  uint64_t v110 = v53;
  uint64_t v111 = v52;
  unint64_t v112 = v54;
  unint64_t v113 = v55;
  uint64_t v114 = v56;
  uint64_t v66 = swift_getOpaqueTypeConformance2();
  sub_22D64D5E4((uint64_t)sub_22D69952C, (uint64_t)v63, v83, v66);
  swift_release();
  OUTLINED_FUNCTION_22();
  v67();
  unint64_t v68 = sub_22D5DCB30();
  uint64_t v103 = v66;
  unint64_t v104 = v68;
  uint64_t v69 = v86;
  swift_getWitnessTable();
  uint64_t v70 = v84;
  uint64_t v71 = OUTLINED_FUNCTION_113();
  sub_22D6B8B10(v71, v72);
  uint64_t v73 = *(void (**)(uint64_t))(v89 + 8);
  uint64_t v74 = OUTLINED_FUNCTION_113();
  v73(v74);
  sub_22D6B8B10(v70, v69);
  ((void (*)(char *, uint64_t))v73)(v70, v69);
  OUTLINED_FUNCTION_12_3();
}

uint64_t sub_22D695A94@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v3 = *(a1 - 1);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v3 + 16))((char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (char *)swift_allocObject();
  uint64_t v7 = a1[2];
  uint64_t v8 = a1[3];
  *((void *)v6 + 2) = v7;
  *((void *)v6 + 3) = v8;
  v23[1] = v8;
  uint64_t v9 = a1[4];
  uint64_t v10 = a1[5];
  *((void *)v6 + 4) = v9;
  *((void *)v6 + 5) = v10;
  (*(void (**)(char *, char *, void *))(v3 + 32))(&v6[v5], (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v11 = sub_22D6CC4B8();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  uint64_t v30 = v7;
  uint64_t v31 = v8;
  uint64_t v32 = v9;
  uint64_t v33 = v10;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  sub_22D6CB088();
  uint64_t v35 = *(void *)(*(void *)(v9 + 32) + 8);
  swift_getWitnessTable();
  sub_22D6CB408();
  sub_22D6CB088();
  swift_getTupleTypeMetadata2();
  uint64_t v13 = sub_22D6CC2C8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v30 = v11;
  uint64_t v31 = AssociatedTypeWitness;
  uint64_t v32 = v13;
  uint64_t v33 = WitnessTable;
  uint64_t v34 = AssociatedConformanceWitness;
  sub_22D6CC1A8();
  uint64_t v29 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6CADD8();
  _s50BottomNavigationPromptAvoidancePaddingViewModifierVMa();
  sub_22D6CB088();
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v27 = v16;
  uint64_t v28 = v17;
  swift_getWitnessTable();
  sub_22D6CADE8();
  _s27DismissAlertTriggerModifierVMa();
  sub_22D6CB088();
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v25 = v18;
  uint64_t v26 = v19;
  swift_getWitnessTable();
  uint64_t result = sub_22D6CAFC8();
  uint64_t v21 = v24;
  *uint64_t v24 = result;
  v21[1] = v22;
  return result;
}

uint64_t sub_22D695ECC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v30 = a2;
  uint64_t v9 = type metadata accessor for MusicPicker.Click.ControlID();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D6B93B8((uint64_t)v35);
  uint64_t v12 = v36;
  if (v36)
  {
    uint64_t v28 = a4;
    uint64_t v13 = v37;
    v27[0] = __swift_project_boxed_opaque_existential_1(v35, v36);
    swift_storeEnumTagMultiPayload();
    char v14 = *(unsigned char *)(a1 + 16);
    uint64_t v15 = *(void *)(a1 + 24);
    uint64_t v16 = *(void *)(a1 + 32);
    unint64_t v29 = a5;
    unint64_t v17 = *(void *)(a1 + 40);
    LOBYTE(v31) = v14;
    uint64_t v32 = v15;
    uint64_t v33 = v16;
    unint64_t v34 = v17;
    v27[1] = a1 + 72;
    uint64_t v18 = a3;
    uint64_t v19 = *(void (**)(char *, unint64_t *, uint64_t, uint64_t))(v13 + 16);
    swift_bridgeObjectRetain();
    sub_22D5DB288(v17);
    uint64_t v20 = v13;
    a4 = v28;
    v19(v11, &v31, v12, v20);
    a3 = v18;
    swift_bridgeObjectRelease();
    unint64_t v21 = v17;
    a5 = v29;
    sub_22D5DB9FC(v21);
    sub_22D6995A4((uint64_t)v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  }
  else
  {
    sub_22D5DD960((uint64_t)v35, &qword_26857AF90);
  }
  sub_22D6B93B8((uint64_t)v35);
  uint64_t v22 = v36;
  if (!v36) {
    return sub_22D5DD960((uint64_t)v35, &qword_26857AF90);
  }
  uint64_t v23 = v37;
  __swift_project_boxed_opaque_existential_1(v35, v36);
  unint64_t v31 = v30;
  uint64_t v32 = a3;
  uint64_t v33 = a4;
  unint64_t v34 = a5;
  unint64_t v24 = *(void *)(a1 + *(int *)(_s21AdditionalContentViewVMa() + 80));
  unint64_t v31 = v24;
  uint64_t v25 = *(void (**)(unint64_t *, uint64_t, uint64_t))(v23 + 8);
  sub_22D5DB288(v24);
  v25(&v31, v22, v23);
  sub_22D5DB9FC(v24);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
}

uint64_t sub_22D6960E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v35 = a1;
  uint64_t v36 = a7;
  uint64_t v11 = sub_22D6CC4B8();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  uint64_t v47 = a3;
  uint64_t v48 = a4;
  uint64_t v32 = a3;
  uint64_t v49 = a5;
  uint64_t WitnessTable = a6;
  uint64_t v33 = a5;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  sub_22D6CB088();
  uint64_t v52 = *(void *)(*(void *)(a5 + 32) + 8);
  swift_getWitnessTable();
  sub_22D6CB408();
  sub_22D6CB088();
  swift_getTupleTypeMetadata2();
  uint64_t v47 = v11;
  uint64_t v48 = AssociatedTypeWitness;
  uint64_t v49 = sub_22D6CC2C8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_22D6CC1A8();
  uint64_t v46 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6CADD8();
  uint64_t v13 = a4;
  uint64_t v14 = a6;
  _s50BottomNavigationPromptAvoidancePaddingViewModifierVMa();
  sub_22D6CB088();
  uint64_t v44 = swift_getWitnessTable();
  uint64_t v45 = swift_getWitnessTable();
  v31[2] = MEMORY[0x263F18E48];
  v31[0] = swift_getWitnessTable();
  uint64_t v15 = sub_22D6CADE8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v31 - v17;
  v31[1] = _s27DismissAlertTriggerModifierVMa();
  uint64_t v19 = sub_22D6CB088();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)v31 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)v31 - v24;
  sub_22D6CB898();
  uint64_t v37 = v32;
  uint64_t v38 = v13;
  uint64_t v39 = v33;
  uint64_t v40 = v14;
  uint64_t v41 = v34;
  sub_22D6CADF8();
  uint64_t v26 = swift_getWitnessTable();
  double v27 = sub_22D621FAC();
  sub_22D63FCF4(v35, v27, v13, v15, v13, v26);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v42 = v26;
  uint64_t v43 = v28;
  swift_getWitnessTable();
  sub_22D6B8B10(v23, v19);
  unint64_t v29 = *(void (**)(char *, uint64_t))(v20 + 8);
  v29(v23, v19);
  sub_22D6B8B10(v25, v19);
  return ((uint64_t (*)(char *, uint64_t))v29)(v25, v19);
}

uint64_t sub_22D696644@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v37 = a5;
  uint64_t v38 = a3;
  uint64_t v40 = a1;
  uint64_t v41 = a6;
  uint64_t v10 = sub_22D6CB658();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v39 = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22D6CC4B8();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  uint64_t v50 = a2;
  uint64_t v51 = a3;
  uint64_t v52 = a4;
  uint64_t v53 = a5;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  sub_22D6CB088();
  uint64_t v55 = *(void *)(*(void *)(a4 + 32) + 8);
  swift_getWitnessTable();
  sub_22D6CB408();
  sub_22D6CB088();
  swift_getTupleTypeMetadata2();
  uint64_t v14 = sub_22D6CC2C8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v50 = v12;
  uint64_t v51 = AssociatedTypeWitness;
  uint64_t v52 = v14;
  uint64_t v53 = WitnessTable;
  uint64_t v54 = AssociatedConformanceWitness;
  sub_22D6CC1A8();
  uint64_t v49 = swift_getWitnessTable();
  v32[2] = swift_getWitnessTable();
  uint64_t v17 = sub_22D6CADD8();
  uint64_t v35 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)v32 - v18;
  uint64_t v20 = v38;
  uint64_t v21 = v37;
  uint64_t v34 = _s50BottomNavigationPromptAvoidancePaddingViewModifierVMa();
  uint64_t v22 = sub_22D6CB088();
  uint64_t v36 = *(void *)(v22 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)v32 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v33 = (char *)v32 - v26;
  v32[1] = sub_22D6CB458();
  uint64_t v50 = a2;
  uint64_t v51 = v20;
  uint64_t v52 = a4;
  uint64_t v53 = v21;
  _s21AdditionalContentViewVMa();
  uint64_t v42 = a2;
  uint64_t v43 = v20;
  uint64_t v44 = a4;
  uint64_t v45 = v21;
  uint64_t v46 = v40;
  sub_22D613374();
  sub_22D6CADC8();
  uint64_t v27 = swift_getWitnessTable();
  sub_22D5DEF3C(v20, v17, v20, v27);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v19, v17);
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v47 = v27;
  uint64_t v48 = v28;
  swift_getWitnessTable();
  unint64_t v29 = v33;
  sub_22D6B8B10(v25, v22);
  unint64_t v30 = *(void (**)(char *, uint64_t))(v36 + 8);
  v30(v25, v22);
  sub_22D6B8B10(v29, v22);
  return ((uint64_t (*)(char *, uint64_t))v30)(v29, v22);
}

uint64_t sub_22D696B94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v48 = a6;
  uint64_t v50 = a2;
  uint64_t v51 = a3;
  uint64_t v42 = a3;
  uint64_t v43 = a5;
  uint64_t v52 = a4;
  uint64_t v53 = a5;
  uint64_t v44 = _s21AdditionalContentViewVMa();
  uint64_t v46 = *(void *)(v44 - 8);
  uint64_t v47 = *(void *)(v46 + 64);
  MEMORY[0x270FA5388](v44);
  uint64_t v45 = (char *)&v35 - v11;
  uint64_t v12 = sub_22D6CC4B8();
  MEMORY[0x270FA5388](v12);
  uint64_t v35 = (char *)&v35 - v13;
  uint64_t v40 = *(void *)(a4 + 40);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  uint64_t v50 = a2;
  uint64_t v51 = a3;
  uint64_t v36 = a2;
  uint64_t v52 = a4;
  uint64_t v53 = a5;
  uint64_t v41 = a4;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  sub_22D6CB088();
  uint64_t v55 = *(void *)(*(void *)(a4 + 32) + 8);
  swift_getWitnessTable();
  sub_22D6CB408();
  sub_22D6CB088();
  swift_getTupleTypeMetadata2();
  uint64_t v15 = sub_22D6CC2C8();
  uint64_t v37 = v15;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v38 = WitnessTable;
  uint64_t v39 = AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v50 = v12;
  uint64_t v51 = AssociatedTypeWitness;
  uint64_t v52 = v15;
  uint64_t v53 = WitnessTable;
  uint64_t v54 = AssociatedConformanceWitness;
  uint64_t v18 = sub_22D6CC1A8();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v35 - v23;
  uint64_t v25 = v44;
  sub_22D6CC058();
  sub_22D6CC028();
  uint64_t v27 = v45;
  uint64_t v26 = v46;
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v45, a1, v25);
  unint64_t v28 = (*(unsigned __int8 *)(v26 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  unint64_t v29 = (char *)swift_allocObject();
  uint64_t v30 = v42;
  *((void *)v29 + 2) = v36;
  *((void *)v29 + 3) = v30;
  uint64_t v31 = v43;
  *((void *)v29 + 4) = v41;
  *((void *)v29 + 5) = v31;
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(&v29[v28], v27, v25);
  uint64_t v32 = swift_getWitnessTable();
  sub_22D6CC198();
  uint64_t v49 = v32;
  swift_getWitnessTable();
  sub_22D6B8B10(v22, v18);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v19 + 8);
  v33(v22, v18);
  sub_22D6B8B10(v24, v18);
  return ((uint64_t (*)(char *, uint64_t))v33)(v24, v18);
}

uint64_t sub_22D697054@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v137 = a2;
  uint64_t v135 = a1;
  uint64_t v128 = a7;
  uint64_t v11 = sub_22D6CC4B8();
  uint64_t v127 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v126 = (char *)&v98 - v12;
  uint64_t v141 = a3;
  uint64_t v142 = a4;
  uint64_t v131 = a3;
  uint64_t v132 = (uint64_t)a4;
  uint64_t v143 = a5;
  unint64_t v144 = a6;
  unint64_t v133 = a6;
  uint64_t v13 = _s21AdditionalContentViewVMa();
  uint64_t v120 = *(void *)(v13 - 8);
  uint64_t v124 = *(void *)(v120 + 64);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v118 = (char *)&v98 - v15;
  uint64_t v136 = *(void *)(a3 - 8);
  uint64_t v121 = *(void *)(v136 + 64);
  MEMORY[0x270FA5388](v14);
  unint64_t v100 = (char *)&v98 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = a3;
  uint64_t v142 = a4;
  uint64_t v143 = a5;
  unint64_t v144 = a6;
  uint64_t v130 = a5;
  uint64_t v104 = _s13ItemShelfCellVMa();
  uint64_t v106 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  uint64_t v102 = (uint64_t)&v98 - v17;
  uint64_t v105 = sub_22D6CB088();
  uint64_t v107 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  uint64_t v101 = (char *)&v98 - v18;
  uint64_t v112 = sub_22D6CB088();
  uint64_t v117 = *(void *)(v112 - 8);
  MEMORY[0x270FA5388](v112);
  uint64_t v134 = (char *)&v98 - v19;
  uint64_t v113 = sub_22D6CB088();
  uint64_t v125 = *(void *)(v113 - 8);
  MEMORY[0x270FA5388](v113);
  uint64_t v109 = (char *)&v98 - v20;
  v140[10] = *(void *)(*(void *)(a5 + 32) + 8);
  uint64_t v111 = v11;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v119 = sub_22D6CB408();
  uint64_t v122 = sub_22D6CB088();
  uint64_t v123 = *(void *)(v122 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v122);
  uint64_t v110 = (char *)&v98 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v116 = (char *)&v98 - v23;
  uint64_t v24 = sub_22D6CC178();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v98 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B040);
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)&v98 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BD60);
  uint64_t v31 = MEMORY[0x270FA5388](v114);
  uint64_t v108 = (uint64_t)&v98 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  uint64_t v34 = (char *)&v98 - v33;
  sub_22D6CC168();
  char v35 = sub_22D6CB8E8();
  uint64_t v36 = v137;
  sub_22D6CADB8();
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v30, v27, v24);
  uint64_t v45 = &v30[*(int *)(v28 + 36)];
  *uint64_t v45 = v35;
  *((void *)v45 + 1) = v38;
  *((void *)v45 + 2) = v40;
  *((void *)v45 + 3) = v42;
  *((void *)v45 + 4) = v44;
  v45[40] = 0;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  uint64_t v103 = v34;
  sub_22D69985C((uint64_t)v30, (uint64_t)v34);
  __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v28);
  uint64_t v99 = *(void (**)(char *, uint64_t, uint64_t))(v136 + 16);
  uint64_t v46 = (uint64_t)v100;
  uint64_t v47 = v135;
  uint64_t v48 = v131;
  v99(v100, v135, v131);
  uint64_t v129 = v13;
  uint64_t v49 = v36 + *(int *)(v13 + 84);
  uint64_t v51 = *(char **)(v49 + 8);
  uint64_t v50 = *(void *)(v49 + 16);
  unint64_t v52 = *(void *)(v49 + 24);
  LOBYTE(v141) = *(unsigned char *)v49;
  uint64_t v142 = v51;
  uint64_t v143 = v50;
  unint64_t v144 = v52;
  swift_bridgeObjectRetain();
  sub_22D5DB288(v52);
  uint64_t v53 = sub_22D697DB0(v47, v13);
  uint64_t v55 = v54;
  uint64_t v56 = v132;
  uint64_t v57 = sub_22D621FB4();
  uint64_t v97 = v48;
  uint64_t v96 = v56;
  uint64_t v58 = v102;
  uint64_t v59 = v46;
  sub_22D686FD8(v46, (char *)&v141, v53, v55, 5, 0, 1, v57, v102, v60, v61, v96, v97);
  sub_22D6CB8E8();
  uint64_t v62 = v104;
  uint64_t v63 = swift_getWitnessTable();
  uint64_t v64 = v101;
  sub_22D6CBE28();
  (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v58, v62);
  sub_22D6CB8F8();
  v140[8] = v63;
  v140[9] = MEMORY[0x263F18C10];
  uint64_t v106 = MEMORY[0x263F18E48];
  uint64_t v65 = v105;
  uint64_t v66 = swift_getWitnessTable();
  sub_22D6CBE28();
  (*(void (**)(char *, uint64_t))(v107 + 8))(v64, v65);
  uint64_t v67 = v120;
  unint64_t v68 = v118;
  uint64_t v69 = v129;
  (*(void (**)(char *, uint64_t, uint64_t))(v120 + 16))(v118, v137, v129);
  uint64_t v70 = v131;
  v99((char *)v59, v135, v131);
  uint64_t v71 = v67;
  unint64_t v72 = (*(unsigned __int8 *)(v67 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80);
  uint64_t v73 = v136;
  unint64_t v74 = (v124 + *(unsigned __int8 *)(v136 + 80) + v72) & ~(unint64_t)*(unsigned __int8 *)(v136 + 80);
  uint64_t v75 = (char *)swift_allocObject();
  uint64_t v76 = v132;
  *((void *)v75 + 2) = v70;
  *((void *)v75 + 3) = v76;
  unint64_t v77 = v133;
  *((void *)v75 + 4) = v130;
  *((void *)v75 + 5) = v77;
  (*(void (**)(char *, char *, uint64_t))(v71 + 32))(&v75[v72], v68, v69);
  (*(void (**)(char *, uint64_t, uint64_t))(v73 + 32))(&v75[v74], v59, v70);
  v140[6] = v66;
  v140[7] = MEMORY[0x263F18C10];
  uint64_t v78 = v112;
  uint64_t v79 = swift_getWitnessTable();
  uint64_t v80 = v109;
  uint64_t v81 = v134;
  sub_22D6CBE68();
  swift_release();
  (*(void (**)(char *, uint64_t))(v117 + 8))(v81, v78);
  sub_22D6CC268();
  uint64_t v82 = v111;
  sub_22D6CC058();
  uint64_t v83 = v126;
  sub_22D6CC028();
  v140[4] = v79;
  v140[5] = MEMORY[0x263F1A240];
  uint64_t v84 = v113;
  uint64_t v85 = swift_getWitnessTable();
  uint64_t v86 = v110;
  sub_22D6CBEA8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v127 + 8))(v83, v82);
  (*(void (**)(char *, uint64_t))(v125 + 8))(v80, v84);
  uint64_t v87 = swift_getWitnessTable();
  v140[2] = v85;
  v140[3] = v87;
  uint64_t v88 = v122;
  uint64_t v89 = swift_getWitnessTable();
  uint64_t v90 = v116;
  sub_22D6B8B10(v86, v88);
  uint64_t v91 = v123;
  uint64_t v92 = *(void (**)(char *, uint64_t))(v123 + 8);
  v92(v86, v88);
  uint64_t v93 = (uint64_t)v103;
  uint64_t v94 = v108;
  sub_22D699BA0((uint64_t)v103, v108);
  uint64_t v141 = v94;
  (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v86, v90, v88);
  uint64_t v142 = v86;
  v140[0] = v114;
  v140[1] = v88;
  unint64_t v138 = sub_22D699C08();
  uint64_t v139 = v89;
  sub_22D634638((uint64_t)&v141, 2, (uint64_t)v140);
  v92(v90, v88);
  sub_22D5DD960(v93, &qword_26857BD60);
  v92(v86, v88);
  return sub_22D5DD960(v94, &qword_26857BD60);
}

uint64_t sub_22D697DB0(uint64_t a1, uint64_t a2)
{
  uint64_t v49 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26857B6B8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v47 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_22D6CCAA8();
  uint64_t v46 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v45 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857CF28);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a2 + 16);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v8);
  uint64_t v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v42 - v16;
  uint64_t v18 = sub_22D6CCA28();
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = 0;
  if (*(unsigned char *)(v2 + 48) != 1) {
    return v22;
  }
  uint64_t v44 = v19;
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v24 = v49;
  v23(v17, v49, v11);
  if ((swift_dynamicCast() & 1) == 0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v18);
    sub_22D5DD960((uint64_t)v10, &qword_26857CF28);
    goto LABEL_11;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v18);
  uint64_t v25 = v44;
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v21, v10, v18);
  uint64_t v26 = sub_22D6CC9D8();
  if (!v27)
  {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v21, v18);
    goto LABEL_11;
  }
  uint64_t v28 = v27;
  uint64_t v43 = v26;
  sub_22D693C64();
  if (!v30)
  {
    (*(void (**)(char *, uint64_t))(v44 + 8))(v21, v18);
    swift_bridgeObjectRelease();
LABEL_11:
    v23(v15, v24, v11);
    uint64_t v36 = (uint64_t)v47;
    uint64_t v37 = v48;
    if (swift_dynamicCast())
    {
      __swift_storeEnumTagSinglePayload(v36, 0, 1, v37);
      uint64_t v39 = v45;
      uint64_t v38 = v46;
      (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v45, v36, v37);
      sub_22D693894();
      uint64_t v22 = v40;
      (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v37);
    }
    else
    {
      __swift_storeEnumTagSinglePayload(v36, 1, 1, v37);
      sub_22D5DD960(v36, qword_26857B6B8);
      return 0;
    }
    return v22;
  }
  uint64_t v31 = v30;
  uint64_t v32 = v29;
  if (qword_26857AD80 != -1) {
    swift_once();
  }
  sub_22D6CA058();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857AFD8);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_22D6CE9E0;
  uint64_t v34 = MEMORY[0x263F8D310];
  *(void *)(v33 + 56) = MEMORY[0x263F8D310];
  unint64_t v35 = sub_22D604A98();
  *(void *)(v33 + 32) = v43;
  *(void *)(v33 + 40) = v28;
  *(void *)(v33 + 96) = v34;
  *(void *)(v33 + 104) = v35;
  *(void *)(v33 + 64) = v35;
  *(void *)(v33 + 72) = v32;
  *(void *)(v33 + 80) = v31;
  uint64_t v22 = sub_22D6CCF28();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v21, v18);
  return v22;
}

uint64_t sub_22D698320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)&long long v36 = a3;
  *((void *)&v36 + 1) = a4;
  uint64_t v30 = a4;
  uint64_t v31 = a6;
  uint64_t v37 = a5;
  uint64_t v38 = a6;
  uint64_t v9 = _s21AdditionalContentViewVMa();
  uint64_t v29 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v28 = (char *)&v28 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B070);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v32 = (uint64_t)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22D6CC4B8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v28 - v15;
  sub_22D6CC058();
  sub_22D6CC028();
  swift_getWitnessTable();
  sub_22D6CD238();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v17 = v34;
  LOBYTE(v13) = v35;
  long long v36 = *(_OWORD *)(a1 + *(int *)(v9 + 76));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857DD88);
  uint64_t result = sub_22D6CC028();
  if ((v13 & 1) == 0 && v17 == v33)
  {
    uint64_t v19 = sub_22D6CD178();
    __swift_storeEnumTagSinglePayload(v32, 1, 1, v19);
    uint64_t v21 = v28;
    uint64_t v20 = v29;
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v28, a1, v9);
    sub_22D6CD148();
    uint64_t v22 = sub_22D6CD138();
    unint64_t v23 = (*(unsigned __int8 *)(v20 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    uint64_t v24 = (char *)swift_allocObject();
    uint64_t v25 = MEMORY[0x263F8F500];
    *((void *)v24 + 2) = v22;
    *((void *)v24 + 3) = v25;
    uint64_t v26 = v30;
    *((void *)v24 + 4) = a3;
    *((void *)v24 + 5) = v26;
    uint64_t v27 = v31;
    *((void *)v24 + 6) = a5;
    *((void *)v24 + 7) = v27;
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(&v24[v23], v21, v9);
    sub_22D64EFD0();
    return swift_release();
  }
  return result;
}

uint64_t sub_22D698648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = sub_22D6CD148();
  v8[7] = sub_22D6CD138();
  uint64_t v13 = (void *)swift_task_alloc();
  v8[8] = v13;
  v8[2] = a5;
  _OWORD v8[3] = a6;
  v8[4] = a7;
  v8[5] = a8;
  uint64_t v14 = _s21AdditionalContentViewVMa();
  *uint64_t v13 = v8;
  v13[1] = sub_22D698730;
  return sub_22D6988A4(v14);
}

uint64_t sub_22D698730()
{
  OUTLINED_FUNCTION_4();
  swift_task_dealloc();
  uint64_t v1 = sub_22D6CD108();
  return MEMORY[0x270FA2498](sub_22D698848, v1, v0);
}

uint64_t sub_22D698848()
{
  swift_release();
  OUTLINED_FUNCTION_16();
  return v0();
}

uint64_t sub_22D6988A4(uint64_t a1)
{
  v2[13] = a1;
  v2[14] = v1;
  v2[15] = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 32);
  v2[16] = v3;
  v2[17] = *(void *)(v3 + 8);
  uint64_t v4 = sub_22D6CC4B8();
  v2[18] = v4;
  uint64_t v5 = sub_22D6CC058();
  v2[19] = v5;
  v2[20] = *(void *)(v5 - 8);
  v2[21] = swift_task_alloc();
  uint64_t v6 = sub_22D6CD328();
  v2[22] = v6;
  v2[23] = *(void *)(v6 - 8);
  v2[24] = swift_task_alloc();
  v2[25] = *(void *)(v4 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  sub_22D6CD148();
  v2[29] = sub_22D6CD138();
  uint64_t v8 = sub_22D6CD108();
  v2[30] = v8;
  v2[31] = v7;
  return MEMORY[0x270FA2498](sub_22D698A90, v8, v7);
}

uint64_t sub_22D698A90()
{
  uint64_t v1 = *(void *)(v0 + 200);
  *(_DWORD *)(v0 + 304) = *(_DWORD *)(*(void *)(v0 + 104) + 68);
  sub_22D6CC028();
  swift_getWitnessTable();
  char v2 = sub_22D6CD228();
  uint64_t v3 = *(void (**)(uint64_t))(v1 + 8);
  *(void *)(v0 + 256) = v3;
  *(void *)(v0 + 264) = (v1 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v4 = OUTLINED_FUNCTION_113();
  v3(v4);
  if (v2) {
    goto LABEL_11;
  }
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v6 = *(int *)(*(void *)(v0 + 104) + 72);
  *(_DWORD *)(v0 + 308) = v6;
  uint64_t v7 = v5 + v6;
  LOBYTE(v5) = *(unsigned char *)(v5 + v6);
  uint64_t v8 = *(void *)(v7 + 8);
  *(unsigned char *)(v0 + 32) = v5;
  *(void *)(v0 + 40) = v8;
  *(void *)(v0 + 272) = __swift_instantiateConcreteTypeFromMangledName(&qword_26857AFC0);
  sub_22D6CC028();
  if ((*(unsigned char *)(v0 + 314) & 1) != 0
    || (uint64_t v9 = *(void *)(v0 + 224),
        uint64_t v10 = *(void *)(v0 + 144),
        sub_22D6CC028(),
        char v11 = sub_22D6CC478(),
        ((void (*)(uint64_t, uint64_t))v3)(v9, v10),
        (v11 & 1) == 0))
  {
LABEL_11:
    swift_release();
    OUTLINED_FUNCTION_8_9();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_30();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v12 = *(void *)(v7 + 8);
  *(unsigned char *)(v0 + 48) = *(unsigned char *)v7;
  *(void *)(v0 + 56) = v12;
  *(unsigned char *)(v0 + 312) = 1;
  sub_22D6CC038();
  if (qword_26857ADB8 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_22D6CAD08();
  *(void *)(v0 + 280) = __swift_project_value_buffer(v13, (uint64_t)qword_268585250);
  uint64_t v14 = sub_22D6CACE8();
  os_log_type_t v15 = sub_22D6CD298();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_22D5CD000, v14, v15, "Fetching next batch of items in the expanded list.", v16, 2u);
    MEMORY[0x230F89D10](v16, -1, -1);
  }
  uint64_t v17 = *(void *)(v0 + 224);
  uint64_t v18 = *(void *)(v0 + 144);
  uint64_t v19 = *(void *)(v0 + 104);
  uint64_t v26 = *(void *)(v0 + 112);

  sub_22D6CC028();
  uint64_t v20 = sub_22D6CD208();
  ((void (*)(uint64_t, uint64_t))v3)(v17, v18);
  *(_OWORD *)(v0 + 64) = *(_OWORD *)(v26 + *(int *)(v19 + 76));
  *(void *)(v0 + 88) = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857DD88);
  sub_22D6CC038();
  sub_22D6CC028();
  uint64_t v21 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_22D698E30;
  OUTLINED_FUNCTION_30();
  return MEMORY[0x270EF6720]();
}

uint64_t sub_22D698E30()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void (**)(uint64_t))(*v1 + 256);
  *(void *)(*v1 + 296) = v0;
  swift_task_dealloc();
  uint64_t v4 = OUTLINED_FUNCTION_113();
  v3(v4);
  uint64_t v5 = *(void *)(v2 + 248);
  uint64_t v6 = *(void *)(v2 + 240);
  if (v0) {
    uint64_t v7 = sub_22D699180;
  }
  else {
    uint64_t v7 = sub_22D698FD4;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

void sub_22D698FD4()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[18];
  swift_release();
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    uint64_t v4 = v0[23];
    uint64_t v3 = v0[24];
    uint64_t v5 = v0[22];
    sub_22D6CD068();
    sub_22D6CC468();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[25] + 32))(v0[27], v0[24], v0[18]);
  }
  uint64_t v6 = (void (*)(uint64_t, uint64_t))v0[32];
  uint64_t v7 = v0[27];
  uint64_t v8 = v0[18];
  OUTLINED_FUNCTION_60();
  v9();
  sub_22D6CC028();
  sub_22D6CC488();
  v6(v7, v8);
  sub_22D6CC038();
  uint64_t v10 = OUTLINED_FUNCTION_25_4();
  v11(v10);
  OUTLINED_FUNCTION_5_8();
  sub_22D6CC038();
  OUTLINED_FUNCTION_8_9();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_30();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_22D699180()
{
  uint64_t v16 = v0;
  uint64_t v1 = (void *)v0[37];
  swift_release();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_22D6CACE8();
  os_log_type_t v5 = sub_22D6CD278();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[37];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446210;
    uint64_t v15 = v8;
    v0[12] = v6;
    id v9 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857AFD0);
    uint64_t v10 = sub_22D6CCF48();
    v0[10] = sub_22D6BB008(v10, v11, &v15);
    sub_22D6CD338();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22D5CD000, v4, v5, "Failed to fetch next batch of items in the expanded list with error: %{public}s.", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F89D10](v8, -1, -1);
    MEMORY[0x230F89D10](v7, -1, -1);
  }
  else
  {
    uint64_t v12 = (void *)v0[37];
  }
  OUTLINED_FUNCTION_5_8();
  sub_22D6CC038();
  OUTLINED_FUNCTION_8_9();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v13();
}

uint64_t sub_22D699398()
{
  return sub_22D6CD668();
}

BOOL sub_22D699430(double *a1, double *a2)
{
  return sub_22D5EDE8C(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_22D699450()
{
  return sub_22D699398();
}

uint64_t sub_22D699468()
{
  return sub_22D5EDEB0();
}

uint64_t sub_22D699480()
{
  return sub_22D6CD668();
}

unint64_t sub_22D6994D4()
{
  unint64_t result = qword_26857AF70;
  if (!qword_26857AF70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857AF60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26857AF70);
  }
  return result;
}

uint64_t sub_22D69952C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  unint64_t v2 = *(void *)(v0 + 40);
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_29_3();
  return sub_22D695ECC(v3, v4, v5, v1, v2);
}

uint64_t sub_22D6995A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MusicPicker.Click.ControlID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D699604(uint64_t a1)
{
  return sub_22D6997BC(a1, (uint64_t (*)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_22D6960E0);
}

uint64_t sub_22D69961C()
{
  return sub_22D69964C((uint64_t (*)(void, void, void, void, void))sub_22D696644);
}

uint64_t sub_22D699634()
{
  return sub_22D69964C((uint64_t (*)(void, void, void, void, void))sub_22D696B94);
}

uint64_t sub_22D69964C(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t objectdestroy_4Tm()
{
  uint64_t v1 = _s21AdditionalContentViewVMa();
  OUTLINED_FUNCTION_1_11();
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v3 + 40));
  swift_release();
  if (*(unsigned char *)(v3 + 112))
  {
    if (*(void *)(v3 + 96)) {
      __swift_destroy_boxed_opaque_existential_1(v3 + 72);
    }
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_22();
  v12(v4, v5, v6, v7, v8, v9, v10, v11);
  sub_22D6CC058();
  swift_release();
  OUTLINED_FUNCTION_31_3();
  OUTLINED_FUNCTION_31_3();
  OUTLINED_FUNCTION_30_3();
  sub_22D5DB9FC(*(void *)(v1 + 24));
  return swift_deallocObject();
}

uint64_t sub_22D6997A4(uint64_t a1)
{
  return sub_22D6997BC(a1, (uint64_t (*)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))sub_22D697054);
}

uint64_t sub_22D6997BC(uint64_t a1, uint64_t (*a2)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  uint64_t v7 = v2[5];
  OUTLINED_FUNCTION_2_11();
  uint64_t v9 = (char *)v2 + ((*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a2(a1, v9, v4, v5, v6, v7);
}

uint64_t sub_22D69985C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D6998C4()
{
  long long v13 = *(_OWORD *)(v0 + 16);
  uint64_t v1 = _s21AdditionalContentViewVMa();
  OUTLINED_FUNCTION_1_11();
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = *(void *)(v4 + 64);
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v0 + v3 + 40));
  swift_release();
  if (*(unsigned char *)(v0 + v3 + 112))
  {
    if (*(void *)(v9 + 96)) {
      __swift_destroy_boxed_opaque_existential_1(v0 + v3 + 72);
    }
  }
  else
  {
    swift_release();
  }
  sub_22D6CC4B8();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_22();
  v10();
  sub_22D6CC058();
  swift_release();
  swift_release();
  swift_release();
  sub_22D5DB9FC(*(void *)(v9 + *(int *)(v1 + 80)));
  uint64_t v11 = v9 + *(int *)(v1 + 84);
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v11 + 24));
  (*(void (**)(unint64_t, void))(v7 + 8))(v0 + ((v3 + v5 + v8) & ~v8), v13);
  return swift_deallocObject();
}

uint64_t sub_22D699AA4()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = *(void *)(_s21AdditionalContentViewVMa() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (uint64_t)v0
     + ((v6 + *(void *)(v5 + 64) + *(unsigned __int8 *)(*(void *)(v1 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80));
  return sub_22D698320((uint64_t)v0 + v6, v7, v1, v2, v3, v4);
}

uint64_t sub_22D699BA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BD60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_22D699C08()
{
  unint64_t result = qword_26857BF00;
  if (!qword_26857BF00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
    sub_22D5DD4F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857BF00);
  }
  return result;
}

uint64_t sub_22D699C7C()
{
  uint64_t v1 = _s21AdditionalContentViewVMa();
  OUTLINED_FUNCTION_1_11();
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v0 + v3 + 40));
  swift_release();
  if (*(unsigned char *)(v0 + v3 + 112))
  {
    if (*(void *)(v0 + v3 + 96)) {
      __swift_destroy_boxed_opaque_existential_1(v0 + v3 + 72);
    }
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_22();
  v12(v4, v5, v6, v7, v8, v9, v10, v11);
  sub_22D6CC058();
  swift_release();
  OUTLINED_FUNCTION_31_3();
  OUTLINED_FUNCTION_31_3();
  OUTLINED_FUNCTION_30_3();
  sub_22D5DB9FC(*(void *)(v1 + 24));
  return swift_deallocObject();
}

uint64_t sub_22D699DC0(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v7 = v1[7];
  v2[2] = v4;
  v2[3] = v5;
  v2[4] = v6;
  v2[5] = v7;
  OUTLINED_FUNCTION_2_11();
  uint64_t v9 = v1[2];
  uint64_t v10 = v1[3];
  uint64_t v11 = (uint64_t)v1 + ((*(unsigned __int8 *)(v8 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  uint64_t v12 = (void *)swift_task_alloc();
  v2[6] = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_22D699EBC;
  return sub_22D698648(a1, v9, v10, v11, v4, v5, v6, v7);
}

uint64_t sub_22D699EBC()
{
  OUTLINED_FUNCTION_4();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v0();
}

uint64_t sub_22D699F88(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s21AdditionalContentViewV9ConstantsVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D699FE8()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D69A4C8()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  return sub_22D6CC4B8();
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_5@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return MEMORY[0x270EF0568](0);
}

uint64_t OUTLINED_FUNCTION_14_4@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return MEMORY[0x270EF0360](0);
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return sub_22D6CA1C8();
}

uint64_t OUTLINED_FUNCTION_25_4()
{
  return v0;
}

void OUTLINED_FUNCTION_28_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 200) = (char *)&a9 - v9;
}

uint64_t OUTLINED_FUNCTION_30_3()
{
  sub_22D5DB9FC(*(void *)(v1 + *(int *)(v0 + 80)));
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_31_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_32_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33_2()
{
  return sub_22D6CB088();
}

uint64_t sub_22D69A6C0()
{
  return sub_22D69A720((void (*)(void))sub_22D69AD00);
}

uint64_t sub_22D69A6E0(uint64_t a1)
{
  return sub_22D69A788(a1, (void (*)(void))sub_22D69AD00);
}

uint64_t sub_22D69A700()
{
  return sub_22D69A720((void (*)(void))sub_22D69AC44);
}

uint64_t sub_22D69A720(void (*a1)(void))
{
  a1();
  sub_22D6CB328();
  return v2;
}

uint64_t sub_22D69A768(uint64_t a1)
{
  return sub_22D69A788(a1, (void (*)(void))sub_22D69AC44);
}

uint64_t sub_22D69A788(uint64_t a1, void (*a2)(void))
{
  return sub_22D6CB338();
}

uint64_t sub_22D69A7D0()
{
  return sub_22D69A98C();
}

uint64_t sub_22D69A7DC()
{
  sub_22D69A924();
  return sub_22D6CB328();
}

uint64_t sub_22D69A824(uint64_t a1)
{
  uint64_t v2 = sub_22D6CB078();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_22D69A924();
  sub_22D6CB338();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

unint64_t sub_22D69A924()
{
  unint64_t result = qword_26857E058;
  if (!qword_26857E058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E058);
  }
  return result;
}

ValueMetadata *type metadata accessor for PickerLayoutDirectionKey()
{
  return &type metadata for PickerLayoutDirectionKey;
}

uint64_t sub_22D69A980()
{
  return sub_22D69A98C();
}

uint64_t sub_22D69A98C()
{
  return swift_release();
}

uint64_t sub_22D69A9FC()
{
  swift_getKeyPath();
  sub_22D6CBBC8();
  return swift_release();
}

void sub_22D69AA70(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_22D69AA78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, MEMORY[0x263F8D510]);
}

uint64_t sub_22D69AA84()
{
  uint64_t v0 = sub_22D6CB078();
  __swift_allocate_value_buffer(v0, qword_26857E040);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26857E040);
  uint64_t v2 = *MEMORY[0x263F18DC8];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_22D69AB0C()
{
  if (qword_26857ADA8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22D6CB078();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26857E040);
}

uint64_t sub_22D69AB70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22D69AB0C();
  uint64_t v3 = sub_22D6CB078();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v2, v3);
}

uint64_t sub_22D69ABE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_22D69AC90();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

unint64_t sub_22D69AC44()
{
  unint64_t result = qword_26857E060;
  if (!qword_26857E060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E060);
  }
  return result;
}

unint64_t sub_22D69AC90()
{
  unint64_t result = qword_26857E068;
  if (!qword_26857E068)
  {
    sub_22D6CB078();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E068);
  }
  return result;
}

ValueMetadata *type metadata accessor for LibraryDownloadedPageParameters()
{
  return &type metadata for LibraryDownloadedPageParameters;
}

unint64_t sub_22D69AD00()
{
  unint64_t result = qword_26857E070[0];
  if (!qword_26857E070[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26857E070);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContainerDetailPageParameters()
{
  return &type metadata for ContainerDetailPageParameters;
}

uint64_t sub_22D69AD64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v9[0] = sub_22D5DEFD4();
  v9[1] = v6;
  uint64_t v7 = _s18NavigationBarStyleVMa();
  MEMORY[0x230F87DB0](v9, a2, v7, a4);
  return swift_release();
}

uint64_t _s18NavigationBarStyleVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22D69AE10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D69AE54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v78 = a4;
  uint64_t v79 = a5;
  uint64_t v82 = a2;
  uint64_t v83 = a3;
  uint64_t v75 = a1;
  uint64_t v84 = a6;
  sub_22D6CAEC8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v80 = v7;
  uint64_t v81 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_0_3();
  uint64_t v77 = v8;
  uint64_t v9 = sub_22D6CC218();
  OUTLINED_FUNCTION_0_0();
  uint64_t v76 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_0_3();
  uint64_t v74 = v12;
  _s18NavigationBarStyleVMa();
  swift_getWitnessTable();
  uint64_t v13 = sub_22D6CB668();
  uint64_t v85 = v13;
  uint64_t WitnessTable = (ValueMetadata *)swift_getWitnessTable();
  uint64_t v14 = WitnessTable;
  uint64_t v64 = WitnessTable;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v73 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_44((uint64_t)v59 - v18);
  uint64_t v85 = v13;
  uint64_t WitnessTable = v14;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v85 = OpaqueTypeMetadata2;
  uint64_t WitnessTable = (ValueMetadata *)v9;
  uint64_t v61 = v9;
  uint64_t v87 = OpaqueTypeConformance2;
  unint64_t v88 = MEMORY[0x263F1B908];
  uint64_t v20 = OpaqueTypeConformance2;
  uint64_t v62 = OpaqueTypeConformance2;
  unint64_t v21 = MEMORY[0x263F1B908];
  uint64_t v22 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v71 = v23;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_44((uint64_t)v59 - v25);
  uint64_t v85 = OpaqueTypeMetadata2;
  uint64_t WitnessTable = (ValueMetadata *)v9;
  uint64_t v87 = v20;
  unint64_t v88 = v21;
  uint64_t v26 = swift_getOpaqueTypeConformance2();
  uint64_t v85 = v22;
  uint64_t WitnessTable = (ValueMetadata *)v26;
  uint64_t v27 = (ValueMetadata *)v26;
  uint64_t v60 = v26;
  uint64_t v28 = swift_getOpaqueTypeMetadata2();
  uint64_t v68 = v28;
  OUTLINED_FUNCTION_0_0();
  uint64_t v72 = v29;
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_44((uint64_t)v59 - v31);
  uint64_t v85 = v22;
  uint64_t WitnessTable = v27;
  uint64_t v32 = swift_getOpaqueTypeConformance2();
  uint64_t v67 = v32;
  unint64_t v66 = sub_22D69B578();
  uint64_t v85 = v28;
  uint64_t WitnessTable = &_s27PickerNavigationItemAdaptorVN;
  uint64_t v87 = v32;
  unint64_t v88 = v66;
  uint64_t v69 = MEMORY[0x263F1AF10];
  uint64_t v33 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v70 = v34;
  uint64_t v36 = MEMORY[0x270FA5388](v35);
  uint64_t v63 = (char *)v59 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_44((uint64_t)v59 - v38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E100);
  sub_22D6CB128();
  uint64_t v39 = swift_allocObject();
  v59[0] = xmmword_22D6CDF70;
  *(_OWORD *)(v39 + 16) = xmmword_22D6CDF70;
  sub_22D6CB118();
  uint64_t v40 = swift_checkMetadataState();
  MEMORY[0x230F87BF0](1, v39, v40, v64);
  swift_bridgeObjectRelease();
  uint64_t v41 = v74;
  sub_22D6CC1F8();
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = v59[0];
  sub_22D6CB118();
  MEMORY[0x230F87C00](v41, v42, OpaqueTypeMetadata2, v61, v62, MEMORY[0x263F1B908]);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22();
  v43();
  OUTLINED_FUNCTION_22();
  v44();
  sub_22D6CAEB8();
  sub_22D6CBC18();
  OUTLINED_FUNCTION_22();
  v45();
  OUTLINED_FUNCTION_22();
  v46();
  _s9ViewModelCMa();
  swift_getWitnessTable();
  sub_22D6CB168();
  sub_22D65791C();
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  swift_release();
  uint64_t v85 = v48;
  uint64_t WitnessTable = v50;
  uint64_t v51 = v63;
  uint64_t v52 = v68;
  uint64_t v53 = v67;
  unint64_t v54 = v66;
  sub_22D6CBD18();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22();
  v55();
  uint64_t v85 = v52;
  uint64_t WitnessTable = &_s27PickerNavigationItemAdaptorVN;
  uint64_t v87 = v53;
  unint64_t v88 = v54;
  swift_getOpaqueTypeConformance2();
  uint64_t v56 = v65;
  sub_22D6B8B10(v51, v33);
  uint64_t v57 = *(void (**)(char *, uint64_t))(v70 + 8);
  v57(v51, v33);
  sub_22D6B8B10(v56, v33);
  return ((uint64_t (*)(uint64_t, uint64_t))v57)(v56, v33);
}

uint64_t sub_22D69B568@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22D69AE54(a1, *v3, v3[1], *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

unint64_t sub_22D69B578()
{
  unint64_t result = qword_26857E0F8;
  if (!qword_26857E0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E0F8);
  }
  return result;
}

uint64_t sub_22D69B5C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D69B780(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *a1;
  uint64_t v17 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  uint64_t v10 = a1[5];
  uint64_t v12 = a1[6];
  uint64_t v11 = a1[7];
  uint64_t v13 = a1[8];
  uint64_t v18 = a1[9];
  char v36 = 0;
  sub_22D69B8A4((uint64_t)a1);
  swift_retain();
  sub_22D6CC018();
  char v14 = v22;
  uint64_t v15 = v23;
  uint64_t v22 = v6;
  uint64_t v23 = v17;
  uint64_t v24 = v7;
  uint64_t v25 = v8;
  uint64_t v26 = v9;
  uint64_t v27 = v10;
  uint64_t v28 = v12;
  uint64_t v29 = v11;
  uint64_t v30 = v13;
  uint64_t v31 = v18;
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  char v34 = v14;
  uint64_t v35 = v15;
  MEMORY[0x230F87DB0](&v22, a4, &_s20FailureAlertModifierVN, a5);
  swift_release();
  swift_release();
  sub_22D5DCF4C(v7, v8);
  swift_release();
  return swift_release();
}

uint64_t sub_22D69B8A4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  swift_retain();
  swift_retain();
  sub_22D668590(v2, v3);
  return a1;
}

uint64_t _s20FailureAlertModifierVwxx(uint64_t a1)
{
  swift_release();
  swift_release();
  if (*(void *)(a1 + 24))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();
  return swift_release();
}

uint64_t _s20FailureAlertModifierVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  swift_retain();
  swift_retain();
  if (v5)
  {
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v5;
    uint64_t v6 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v6;
    uint64_t v7 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = v7;
    uint64_t v8 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v9 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v9;
    long long v10 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v10;
  }
  uint64_t v11 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v11;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t _s20FailureAlertModifierVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v4 = (_OWORD *)(a1 + 16);
  uint64_t v5 = (long long *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24))
  {
    if (v6)
    {
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
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
    }
    else
    {
      sub_22D5DC1B4(a1 + 16);
      long long v7 = *(_OWORD *)(a2 + 64);
      long long v9 = *v5;
      long long v8 = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 64) = v7;
      *uint64_t v4 = v9;
      *(_OWORD *)(a1 + 32) = v8;
    }
  }
  else if (v6)
  {
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v10 = *v5;
    long long v11 = *(_OWORD *)(a2 + 32);
    long long v12 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v12;
    *uint64_t v4 = v10;
    *(_OWORD *)(a1 + 32) = v11;
  }
  uint64_t v13 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v13;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s20FailureAlertModifierVwta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  if (!*(void *)(a1 + 24)) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)(a2 + 24);
  if (!v4)
  {
    sub_22D5DC1B4(a1 + 16);
LABEL_5:
    long long v8 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v8;
    long long v9 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v9;
    goto LABEL_6;
  }
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
LABEL_6:
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_release();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_release();
  return a1;
}

uint64_t _s20FailureAlertModifierVwet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
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

uint64_t _s20FailureAlertModifierVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s20FailureAlertModifierVMa()
{
  return &_s20FailureAlertModifierVN;
}

uint64_t sub_22D69BDD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D69BDEC(uint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E108);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)__dst - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D69BF80(a1, (uint64_t)v6);
  memcpy(__dst, v2, sizeof(__dst));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E110);
  MEMORY[0x230F88070](v11, v7);
  __dst[0] = v11[0];
  __dst[1] = v11[1];
  __dst[2] = v11[2];
  __dst[3] = v11[3];
  uint64_t v8 = swift_allocObject();
  memcpy((void *)(v8 + 16), v2, 0x70uLL);
  sub_22D69CB88((uint64_t)v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857AE58);
  sub_22D69CC38();
  sub_22D69CD8C();
  sub_22D6CBE78();
  swift_release();
  sub_22D5DCF4C(*(uint64_t *)&__dst[0], *((uint64_t *)&__dst[0] + 1));
  return sub_22D5EDCB8((uint64_t)v6, &qword_26857E108);
}

uint64_t sub_22D69BF80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a1;
  uint64_t v52 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E120);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E148);
  MEMORY[0x270FA5388](v7);
  long long v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E150);
  uint64_t v50 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v49 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(__dst, v2, sizeof(__dst));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E110);
  MEMORY[0x230F88070](&v58, v11);
  uint64_t v12 = v59;
  if (v59)
  {
    uint64_t v42 = v58;
    uint64_t v48 = v60;
    uint64_t v47 = v61;
    uint64_t v46 = v62;
    unint64_t v45 = v63;
    uint64_t v44 = v64;
    unint64_t v43 = v65;
    __dst[0] = v58;
    __dst[1] = v59;
    __dst[2] = v60;
    __dst[3] = v61;
    __dst[4] = v62;
    _OWORD __dst[5] = v63;
    __dst[6] = v64;
    __dst[7] = v65;
    uint64_t v55 = v58;
    uint64_t v56 = v59;
    long long v54 = v2[6];
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857AFC0);
    uint64_t v13 = sub_22D6CC048();
    uint64_t v39 = &v32;
    uint64_t v40 = v9;
    uint64_t v38 = v58;
    uint64_t v41 = v7;
    int v37 = v60;
    uint64_t v14 = MEMORY[0x270FA5388](v13);
    char v36 = v31;
    MEMORY[0x270FA5388](v14);
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E128);
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B990);
    uint64_t v15 = sub_22D5DCE80(&qword_26857E130, &qword_26857E120);
    unint64_t v16 = sub_22D604560();
    uint64_t v17 = sub_22D5DCE80(&qword_26857E138, &qword_26857E128);
    uint64_t v35 = v17;
    unint64_t v18 = sub_22D60FF18();
    v31[2] = v17;
    void v31[3] = v18;
    v31[0] = v15;
    v31[1] = v16;
    uint64_t v19 = v15;
    uint64_t v20 = v49;
    sub_22D6CBD98();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_22D5DCF4C(v42, v12);
    uint64_t v21 = v50;
    uint64_t v22 = v53;
    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v40, v20, v53);
    swift_storeEnumTagMultiPayload();
    uint64_t v58 = v3;
    uint64_t v59 = MEMORY[0x263F8D310];
    uint64_t v60 = v33;
    uint64_t v61 = v34;
    uint64_t v62 = v19;
    unint64_t v63 = v16;
    uint64_t v64 = v35;
    unint64_t v65 = v18;
    swift_getOpaqueTypeConformance2();
    sub_22D6CB558();
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v20, v22);
  }
  else
  {
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v24(v6, v51, v3);
    v24(v9, (uint64_t)v6, v3);
    swift_storeEnumTagMultiPayload();
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857E128);
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857B990);
    uint64_t v27 = sub_22D5DCE80(&qword_26857E130, &qword_26857E120);
    unint64_t v28 = sub_22D604560();
    uint64_t v29 = sub_22D5DCE80(&qword_26857E138, &qword_26857E128);
    unint64_t v30 = sub_22D60FF18();
    __dst[0] = v3;
    __dst[1] = MEMORY[0x263F8D310];
    __dst[2] = v25;
    __dst[3] = v26;
    __dst[4] = v27;
    _OWORD __dst[5] = v28;
    __dst[6] = v29;
    __dst[7] = v30;
    swift_getOpaqueTypeConformance2();
    sub_22D6CB558();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_22D69C630()
{
  return sub_22D6CC038();
}

uint64_t sub_22D69C688@<X0>(uint64_t a1@<X0>, const void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BF88);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v33[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E158);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = &v33[-v14 - 16];
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  unint64_t v18 = &v33[-v17 - 16];
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = &v33[-v19 - 16];
  uint64_t v21 = *(void *)(a1 + 40);
  if (v21)
  {
    *(void *)&long long v34 = *(void *)(a1 + 32);
    *((void *)&v34 + 1) = v21;
    swift_bridgeObjectRetain();
    sub_22D6CAD98();
    uint64_t v22 = sub_22D6CADA8();
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v22);
    uint64_t v23 = swift_allocObject();
    memcpy((void *)(v23 + 16), a2, 0x70uLL);
    sub_22D69CB88((uint64_t)a2);
    sub_22D604560();
    sub_22D6CC088();
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857C668);
    uint64_t v25 = (uint64_t)v20;
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857C668);
    uint64_t v25 = (uint64_t)v20;
    uint64_t v26 = 1;
  }
  __swift_storeEnumTagSinglePayload(v25, v26, 1, v24);
  sub_22D69CE10(a1 + 48, (uint64_t)v33);
  sub_22D69CE10((uint64_t)v33, (uint64_t)&v34);
  if (*((void *)&v34 + 1))
  {
    long long v32 = v34;
    uint64_t v27 = swift_allocObject();
    memcpy((void *)(v27 + 16), a2, 0x70uLL);
    sub_22D69CB88((uint64_t)a2);
    sub_22D69CEEC((uint64_t)v33);
    sub_22D604560();
    sub_22D6CC098();
    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v28 = 1;
  }
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857C668);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, v28, 1, v29);
  sub_22D69CE78((uint64_t)v20, (uint64_t)v15);
  sub_22D69CE78((uint64_t)v18, (uint64_t)v12);
  sub_22D69CE78((uint64_t)v15, a3);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(qword_26857E160);
  sub_22D69CE78((uint64_t)v12, a3 + *(int *)(v30 + 48));
  sub_22D5EDCB8((uint64_t)v18, &qword_26857E158);
  sub_22D5EDCB8((uint64_t)v20, &qword_26857E158);
  sub_22D5EDCB8((uint64_t)v12, &qword_26857E158);
  return sub_22D5EDCB8((uint64_t)v15, &qword_26857E158);
}

uint64_t sub_22D69C9DC(void *__src)
{
  memcpy(__dst, __src, sizeof(__dst));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E110);
  return sub_22D6CC128();
}

uint64_t sub_22D69CA38(void (**a1)(void))
{
  a1[10]();
  memcpy(__dst, a1, sizeof(__dst));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E110);
  return sub_22D6CC128();
}

uint64_t sub_22D69CAA4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (*(void *)(a1 + 24))
  {
    sub_22D604560();
    swift_bridgeObjectRetain();
    uint64_t result = sub_22D6CBAF8();
    uint64_t v7 = v6 & 1;
  }
  else
  {
    uint64_t result = 0;
    uint64_t v4 = 0;
    uint64_t v7 = 0;
    uint64_t v5 = 0;
  }
  *a2 = result;
  a2[1] = v4;
  a2[2] = v7;
  a2[3] = v5;
  return result;
}

uint64_t sub_22D69CB28(uint64_t a1)
{
  memcpy(v4, v1, sizeof(v4));
  return sub_22D69BDEC(a1);
}

uint64_t sub_22D69CB80()
{
  return sub_22D69C630();
}

uint64_t sub_22D69CB88(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  swift_retain();
  swift_retain();
  sub_22D668590(v2, v3);
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_22D69CC38()
{
  unint64_t result = qword_26857E118;
  if (!qword_26857E118)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857E108);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857E120);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857E128);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857B990);
    sub_22D5DCE80(&qword_26857E130, &qword_26857E120);
    sub_22D604560();
    sub_22D5DCE80(&qword_26857E138, &qword_26857E128);
    sub_22D60FF18();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E118);
  }
  return result;
}

unint64_t sub_22D69CD8C()
{
  unint64_t result = qword_26857E140;
  if (!qword_26857E140)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857AE58);
    sub_22D68AA88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E140);
  }
  return result;
}

uint64_t sub_22D69CE00@<X0>(uint64_t a1@<X8>)
{
  return sub_22D69C688(*(void *)(v1 + 16), *(const void **)(v1 + 24), a1);
}

uint64_t sub_22D69CE08@<X0>(uint64_t *a1@<X8>)
{
  return sub_22D69CAA4(*(void *)(v1 + 16), a1);
}

uint64_t sub_22D69CE10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857AE50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D69CE78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E158);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D69CEE4()
{
  return sub_22D69CA38((void (**)(void))(v0 + 16));
}

uint64_t sub_22D69CEEC(uint64_t a1)
{
  return a1;
}

uint64_t objectdestroyTm_8()
{
  swift_release();
  swift_release();
  if (*(void *)(v0 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D69CF90()
{
  return sub_22D69C9DC((void *)(v0 + 16));
}

uint64_t sub_22D69CF98()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_22D69D01C@<D0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a2;
  uint64_t v5 = sub_22D6CA308();
  OUTLINED_FUNCTION_8();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22D6CA6F8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  int v27 = *(unsigned __int8 *)a1;
  uint64_t v17 = a1[1];
  uint64_t v16 = a1[2];
  uint64_t v25 = a1[3];
  uint64_t v26 = v16;
  sub_22D6CA708();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v15, *MEMORY[0x263F56A78], v9);
  char v18 = sub_22D679DCC();
  uint64_t v19 = *(void (**)(void))(v11 + 8);
  OUTLINED_FUNCTION_69();
  v19();
  OUTLINED_FUNCTION_69();
  v19();
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  if (v18)
  {
    if (qword_26857AD80 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_22D6CA058();
    uint64_t v21 = v22;
  }
  sub_22D6CA6E8();
  sub_22D6CA718();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_22();
  v23();
  v31[0] = v27;
  uint64_t v32 = v17;
  uint64_t v33 = v26;
  uint64_t v34 = v25;
  sub_22D69EDB0(&qword_26857BD68, MEMORY[0x263F56838]);
  *(void *)&double result = sub_22D69D2F0((uint64_t)v8, v31, v20, v21, v5, v29).n128_u64[0];
  return result;
}

__n128 sub_22D69D2F0@<Q0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  char v11 = *a2;
  __n128 v19 = *(__n128 *)(a2 + 8);
  uint64_t v12 = *((void *)a2 + 3);
  uint64_t v13 = (int *)_s16SearchResultCellVMa();
  uint64_t v14 = a6 + v13[15];
  *(_OWORD *)uint64_t v14 = xmmword_22D6D2E30;
  *(_OWORD *)(v14 + 16) = xmmword_22D6D2E40;
  *(void *)(v14 + 32) = 0;
  OUTLINED_FUNCTION_8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(a6, a1, a5);
  uint64_t v16 = a6 + v13[13];
  *(unsigned char *)uint64_t v16 = v11;
  __n128 result = v19;
  *(__n128 *)(v16 + 8) = v19;
  *(void *)(v16 + 24) = v12;
  char v18 = (void *)(a6 + v13[14]);
  *char v18 = a3;
  v18[1] = a4;
  return result;
}

uint64_t _s16SearchResultCellVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D69D3F8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22D69D4A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 40 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v10 = *(unsigned char *)v11;
    *(void *)(v10 + 8) = *(void *)(v11 + 8);
    *(void *)(v10 + 16) = *(void *)(v11 + 16);
    unint64_t v12 = *(void *)(v11 + 24);
    swift_bridgeObjectRetain();
    sub_22D5DB288(v12);
    *(void *)(v10 + 24) = v12;
    uint64_t v13 = (void *)((v10 + 39) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v14 = (void *)((v11 + 39) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v13 = *v14;
    v13[1] = v14[1];
    unint64_t v15 = ((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v16 = ((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8;
    long long v17 = *(_OWORD *)v16;
    long long v18 = *(_OWORD *)(v16 + 16);
    *(void *)(v15 + 32) = *(void *)(v16 + 32);
    *(_OWORD *)unint64_t v15 = v17;
    *(_OWORD *)(v15 + 16) = v18;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_22D69D614(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = (a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v4 + 24));
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D69D69C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v7 = *(unsigned char *)v8;
  *(void *)(v7 + 8) = *(void *)(v8 + 8);
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  unint64_t v9 = *(void *)(v8 + 24);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v9);
  *(void *)(v7 + 24) = v9;
  unint64_t v10 = (void *)((v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = (void *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v10 = *v11;
  v10[1] = v11[1];
  unint64_t v12 = ((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = ((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8;
  long long v14 = *(_OWORD *)v13;
  long long v15 = *(_OWORD *)(v13 + 16);
  *(void *)(v12 + 32) = *(void *)(v13 + 32);
  *(_OWORD *)unint64_t v12 = v14;
  *(_OWORD *)(v12 + 16) = v15;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22D69D780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v7 = *(unsigned char *)v8;
  *(void *)(v7 + 8) = *(void *)(v8 + 8);
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v9 = *(void *)(v8 + 24);
  sub_22D5DB288(v9);
  unint64_t v10 = *(void *)(v7 + 24);
  *(void *)(v7 + 24) = v9;
  sub_22D5DB9FC(v10);
  unint64_t v11 = (void *)((v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v12 = (void *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v13 = (void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  long long v14 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v13 = *v14;
  v13[1] = v14[1];
  v13[2] = v14[2];
  v13[3] = v14[3];
  v13[4] = v14[4];
  return a1;
}

uint64_t sub_22D69D89C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  long long v9 = v8[1];
  *unint64_t v7 = *v8;
  v7[1] = v9;
  unint64_t v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v10 = *v11;
  unint64_t v12 = ((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = ((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8;
  long long v15 = *(_OWORD *)v13;
  long long v14 = *(_OWORD *)(v13 + 16);
  *(void *)(v12 + 32) = *(void *)(v13 + 32);
  *(_OWORD *)unint64_t v12 = v15;
  *(_OWORD *)(v12 + 16) = v14;
  return a1;
}

uint64_t sub_22D69D948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v7 = *(unsigned char *)v8;
  *(void *)(v7 + 8) = *(void *)(v8 + 8);
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  swift_bridgeObjectRelease();
  unint64_t v9 = *(void *)(v7 + 24);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  sub_22D5DB9FC(v9);
  unint64_t v10 = (void *)((v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = (void *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRelease();
  unint64_t v12 = (void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v13 = (void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v12 = *v13;
  v12[1] = v13[1];
  v12[2] = v13[2];
  v12[3] = v13[3];
  v12[4] = v13[4];
  return a1;
}

uint64_t sub_22D69DA4C(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0x7FFFFFFE) {
    unsigned int v7 = 2147483646;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 40;
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
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x22D69DBA0);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        int v17 = v7 + (v10 | v16);
        return (v17 + 1);
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFE) {
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  }
  unint64_t v18 = *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
  if (v18 >= 0xFFFFFFFF) {
    LODWORD(v18) = -1;
  }
  int v17 = v18 - 1;
  if (v17 < 0) {
    int v17 = -1;
  }
  return (v17 + 1);
}

void sub_22D69DBB4(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  unint64_t v10 = ((((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 40;
  if (v8 >= a3)
  {
    int v14 = 0;
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((((v9 + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFD8) {
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
  }
  if (a2 > v8)
  {
    if (((((((v9 + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFD8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((((((v9 + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFD8)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 40);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x22D69DDA8);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if (v7 < 0x7FFFFFFE)
        {
          int v17 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            v17[2] = 0;
            v17[3] = 0;
            *int v17 = (a2 - 0x7FFFFFFF);
            v17[1] = 0;
          }
          else
          {
            v17[2] = a2;
          }
        }
        else
        {
          __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t sub_22D69DDD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D69DE14()
{
  uint64_t v0 = sub_22D6CAA78();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D6CA618();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857CA28);
  uint64_t v4 = swift_dynamicCast();
  if (v4) {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return v4;
}

uint64_t sub_22D69DF1C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v104 = a2;
  uint64_t v3 = sub_22D6CB578();
  uint64_t v79 = v3;
  OUTLINED_FUNCTION_0_0();
  uint64_t v103 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_0_3();
  uint64_t v101 = v6;
  OUTLINED_FUNCTION_0_0();
  uint64_t v95 = v7;
  uint64_t v96 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_44((uint64_t)v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = a1[2];
  OUTLINED_FUNCTION_0_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_0_3();
  uint64_t v105 = v15;
  uint64_t v16 = a1[4];
  uint64_t v76 = a1[3];
  uint64_t v17 = v76;
  unint64_t v18 = (unint64_t)a1;
  _s11ArtworkViewVMa();
  sub_22D6CB088();
  uint64_t v19 = sub_22D6CD328();
  uint64_t v20 = a1[5];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v121 = MEMORY[0x263F18C10];
  uint64_t v102 = MEMORY[0x263F18E48];
  uint64_t v119 = swift_getWitnessTable();
  uint64_t v84 = v19;
  uint64_t v83 = swift_getWitnessTable();
  uint64_t v113 = v11;
  uint64_t v114 = v17;
  uint64_t v115 = v19;
  unint64_t v116 = v16;
  uint64_t v117 = v20;
  uint64_t v118 = v83;
  uint64_t v21 = v20;
  uint64_t v22 = _s9HItemCellVMa();
  uint64_t v80 = v22;
  OUTLINED_FUNCTION_0_0();
  uint64_t v93 = v23;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_44(v25);
  uint64_t v26 = swift_getWitnessTable();
  uint64_t v78 = v26;
  uint64_t v77 = sub_22D69EDB0((unint64_t *)&qword_26857B498, MEMORY[0x263F19B68]);
  uint64_t v113 = v22;
  uint64_t v114 = v3;
  uint64_t v115 = v26;
  unint64_t v116 = v77;
  uint64_t v87 = MEMORY[0x263F1A988];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v94 = v27;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_44(v29);
  uint64_t v89 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v97 = v30;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_10();
  uint64_t v81 = v32;
  uint64_t v90 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v99 = v33;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_10();
  uint64_t v86 = v35;
  uint64_t v98 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v100 = v36;
  uint64_t v38 = MEMORY[0x270FA5388](v37);
  unint64_t v88 = (char *)v74 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_44((uint64_t)v74 - v40);
  uint64_t v41 = v106;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v105, v106, v11);
  unint64_t v42 = v18;
  uint64_t v43 = *(int *)(v18 + 56);
  uint64_t v44 = (char *)(v41 + *(int *)(v18 + 52));
  char v45 = *v44;
  uint64_t v46 = *((void *)v44 + 1);
  uint64_t v47 = *((void *)v44 + 2);
  v74[0] = *((void *)v44 + 3);
  LOBYTE(v113) = v45;
  uint64_t v114 = v46;
  uint64_t v115 = v47;
  unint64_t v116 = v74[0];
  unint64_t v48 = *(void *)(v41 + v43 + 8);
  uint64_t v75 = *(void *)(v41 + v43);
  v74[1] = v48;
  uint64_t v49 = v95;
  uint64_t v50 = *(void (**)(uint64_t, uint64_t, unint64_t))(v95 + 16);
  uint64_t v51 = v92;
  v74[2] = v18;
  v50(v92, v41, v18);
  unint64_t v52 = (*(unsigned __int8 *)(v49 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
  uint64_t v53 = (char *)swift_allocObject();
  uint64_t v54 = v76;
  *((void *)v53 + 2) = v11;
  *((void *)v53 + 3) = v54;
  *((void *)v53 + 4) = v16;
  *((void *)v53 + 5) = v21;
  (*(void (**)(char *, uint64_t, unint64_t))(v49 + 32))(&v53[v52], v51, v42);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v74[0]);
  uint64_t v55 = swift_bridgeObjectRetain();
  sub_22D669D7C(v105, (char *)&v113, 1, 1, 0, 0, 5, 1, v85, 0.0, v75, v55, v54, (uint64_t)sub_22D69EF04, (uint64_t)v53, v11, v54, v84, v16,
    v21,
    v83);
  sub_22D6CB158();
  uint64_t v56 = v80;
  uint64_t v57 = v79;
  uint64_t v58 = v78;
  unint64_t v59 = v77;
  sub_22D6CBBD8();
  OUTLINED_FUNCTION_22();
  v60();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v61();
  uint64_t v113 = v56;
  uint64_t v114 = v57;
  uint64_t v115 = v58;
  unint64_t v116 = v59;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_22D617C44();
  sub_22D6CBDB8();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v63();
  sub_22D6CB8E8();
  uint64_t v111 = OpaqueTypeConformance2;
  uint64_t v112 = MEMORY[0x263F19100];
  uint64_t v64 = swift_getWitnessTable();
  sub_22D6CBE28();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v65();
  sub_22D6CB8F8();
  uint64_t v109 = v64;
  uint64_t v66 = MEMORY[0x263F18C10];
  uint64_t v110 = MEMORY[0x263F18C10];
  uint64_t v67 = swift_getWitnessTable();
  uint64_t v68 = v88;
  sub_22D6CBE28();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v69();
  uint64_t v107 = v67;
  uint64_t v108 = v66;
  uint64_t v70 = v98;
  swift_getWitnessTable();
  uint64_t v71 = v91;
  sub_22D6B8B10(v68, v70);
  uint64_t v72 = *(void (**)(void))(v100 + 8);
  OUTLINED_FUNCTION_69();
  v72();
  sub_22D6B8B10(v71, v70);
  OUTLINED_FUNCTION_69();
  return ((uint64_t (*)(void))v72)();
}

uint64_t sub_22D69E818@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v40 = a3;
  uint64_t v44 = a6;
  uint64_t v37 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _s11ArtworkViewVMa();
  uint64_t v38 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v35 - v13;
  uint64_t v43 = v15;
  uint64_t v16 = sub_22D6CB088();
  uint64_t v39 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v36 = (char *)&v35 - v20;
  uint64_t v41 = sub_22D6CD328();
  uint64_t v21 = *(void *)(v41 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v41);
  uint64_t v24 = (char *)&v35 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v42 = (uint64_t)&v35 - v25;
  uint64_t v52 = a2;
  uint64_t v53 = v40;
  uint64_t v54 = a4;
  uint64_t v55 = a5;
  _s16SearchResultCellVMa();
  if (sub_22D69DE14())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 1, 1, v16);
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v26 = MEMORY[0x263F18C10];
    uint64_t v46 = MEMORY[0x263F18C10];
    swift_getWitnessTable();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v11, a1, a2);
    sub_22D67DCC8();
    sub_22D6CB8F8();
    uint64_t v28 = v43;
    uint64_t v29 = swift_getWitnessTable();
    sub_22D6CBE28();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v28);
    uint64_t v50 = v29;
    uint64_t v26 = MEMORY[0x263F18C10];
    uint64_t v51 = MEMORY[0x263F18C10];
    swift_getWitnessTable();
    uint64_t v30 = v36;
    sub_22D6B8B10(v19, v16);
    uint64_t v31 = *(void (**)(char *, uint64_t))(v39 + 8);
    v31(v19, v16);
    sub_22D6B8B10(v30, v16);
    v31(v30, v16);
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v16);
  }
  uint64_t v27 = v42;
  sub_22D627E64((uint64_t)v24, v42);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v21 + 8);
  uint64_t v33 = v41;
  v32(v24, v41);
  uint64_t v48 = swift_getWitnessTable();
  uint64_t v49 = v26;
  uint64_t v47 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6B8B10(v27, v33);
  return ((uint64_t (*)(uint64_t, uint64_t))v32)(v27, v33);
}

BOOL sub_22D69ED54(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  uint64_t v8 = *(void *)(a2 + 32);
  return sub_22D5EABEC((double *)v5, (double *)v7);
}

uint64_t sub_22D69EDB0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22D69EDF8()
{
  uint64_t v1 = (int *)(_s16SearchResultCellVMa() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_22();
  v3();
  uint64_t v4 = v2 + v1[15];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v4 + 24));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22D69EF04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = *(void *)(_s16SearchResultCellVMa() - 8);
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return sub_22D69E818(v8, v3, v4, v5, v6, a1);
}

uint64_t _s16SearchResultCellV9ConstantsVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D69EFC8()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D69F21C()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D69F238@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t *a8@<X7>, uint64_t a9@<X8>, char *a10, uint64_t (*a11)(uint64_t))
{
  uint64_t v13 = *a8;
  uint64_t v21 = a8[1];
  char v14 = *((unsigned char *)a8 + 16);
  char v22 = *a10;
  _s9ViewModelCMa();
  swift_getWitnessTable();
  *(void *)a9 = sub_22D6CB198();
  *(void *)(a9 + 8) = v15;
  *(void *)(a9 + 32) = sub_22D69F3FC();
  *(void *)(a9 + 40) = v16;
  uint64_t v17 = _s15LibraryMenuCellVMa();
  uint64_t v18 = a9 + *(int *)(v17 + 96);
  *(_OWORD *)uint64_t v18 = xmmword_22D6D2FC0;
  *(void *)(v18 + 16) = 0x4022000000000000;
  *(void *)(a9 + 72) = a1;
  *(void *)(a9 + 80) = a2;
  *(void *)(a9 + 88) = a3;
  *(void *)(a9 + 96) = a4;
  *(void *)(a9 + 104) = a5;
  *(void *)(a9 + 112) = a6;
  *(unsigned char *)(a9 + 120) = a7;
  *(void *)(a9 + 48) = v13;
  *(void *)(a9 + 56) = v21;
  *(unsigned char *)(a9 + 64) = v14;
  *(unsigned char *)(a9 + 16) = a7;
  *(void *)(a9 + 24) = 0;
  *(unsigned char *)(a9 + 121) = v22;
  uint64_t v19 = a9 + *(int *)(v17 + 92);
  sub_22D6CC598();
  return a11(v19);
}

uint64_t sub_22D69F3B4(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t result = 0;
  while (*(unsigned __int8 *)(a2 + 32 + result) != a1)
  {
    if (v2 == ++result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_22D69F3FC()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26857E268);
  sub_22D6CC018();
  return v1;
}

uint64_t _s15LibraryMenuCellVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D69F454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 88);
}

uint64_t sub_22D69F45C()
{
  uint64_t result = sub_22D6CC5A8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22D69F534(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v8;
    uint64_t v9 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v9;
    *(void *)(a1 + 56) = a2[7];
    *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
    uint64_t v10 = a2[10];
    *(void *)(a1 + 72) = a2[9];
    *(void *)(a1 + 80) = v10;
    uint64_t v11 = a2[12];
    *(void *)(a1 + 88) = a2[11];
    *(void *)(a1 + 96) = v11;
    uint64_t v12 = a2[14];
    *(void *)(a1 + 104) = a2[13];
    *(void *)(a1 + 112) = v12;
    *(_WORD *)(a1 + 120) = *((_WORD *)a2 + 60);
    uint64_t v13 = *(int *)(a3 + 92);
    uint64_t v20 = (uint64_t)a2 + v13;
    uint64_t v21 = a1 + v13;
    uint64_t v14 = sub_22D6CC5A8();
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19(v21, v20, v14);
    uint64_t v15 = *(int *)(a3 + 96);
    uint64_t v16 = v7 + v15;
    uint64_t v17 = (uint64_t)a2 + v15;
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    *(void *)(v16 + 16) = *(void *)(v17 + 16);
  }
  return v7;
}

uint64_t sub_22D69F6F4(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 92);
  uint64_t v5 = sub_22D6CC5A8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_22D69F7B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v9;
  uint64_t v10 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v10;
  uint64_t v11 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v11;
  *(_WORD *)(a1 + 120) = *(_WORD *)(a2 + 120);
  uint64_t v12 = *(int *)(a3 + 92);
  uint64_t v19 = a2 + v12;
  uint64_t v20 = a1 + v12;
  uint64_t v13 = sub_22D6CC5A8();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18(v20, v19, v13);
  uint64_t v14 = *(int *)(a3 + 96);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *(void *)(v15 + 16) = *(void *)(v16 + 16);
  return a1;
}

uint64_t sub_22D69F920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
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
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(unsigned char *)(a1 + 121) = *(unsigned char *)(a2 + 121);
  uint64_t v6 = *(int *)(a3 + 92);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_22D6CC5A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 96);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  v11[2] = v12[2];
  return a1;
}

uint64_t sub_22D69FAE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(unsigned char *)(a1 + 121) = *(unsigned char *)(a2 + 121);
  uint64_t v8 = *(int *)(a3 + 92);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_22D6CC5A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 96);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(void *)(v13 + 16) = *(void *)(v14 + 16);
  return a1;
}

uint64_t sub_22D69FBD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(unsigned char *)(a1 + 121) = *(unsigned char *)(a2 + 121);
  uint64_t v9 = *(int *)(a3 + 92);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_22D6CC5A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 96);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(void *)(v14 + 16) = *(void *)(v15 + 16);
  return a1;
}

uint64_t sub_22D69FD30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D69FD44);
}

uint64_t sub_22D69FD44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22D6CC5A8();
    uint64_t v9 = a1 + *(int *)(a3 + 92);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22D69FDD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D69FDE8);
}

uint64_t sub_22D69FDE8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 32) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22D6CC5A8();
    uint64_t v8 = v5 + *(int *)(a4 + 92);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_22D69FE70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D69FEBC()
{
  if (*(unsigned char *)(v0 + 120)) {
    return 1;
  }
  uint64_t v2 = v0;
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 56);
  char v5 = *(unsigned char *)(v0 + 64);
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  char v20 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E310);
  MEMORY[0x230F88070](&v17);
  unsigned __int8 v7 = v17;
  if (v17 != 6)
  {
    uint64_t v9 = *(void *)(v0 + 32);
    uint64_t v8 = *(void *)(v0 + 40);
    uint64_t v18 = v9;
    uint64_t v19 = v8;
    uint64_t v16 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857E320);
    sub_22D6CC028();
    uint64_t v10 = sub_22D69F3B4(v7, v17);
    char v12 = v11;
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
    {
      uint64_t v18 = v9;
      uint64_t v19 = v16;
      sub_22D6CC028();
      uint64_t v13 = sub_22D69F3B4(*(unsigned char *)(v0 + 121), v17);
      char v15 = v14;
      uint64_t result = swift_bridgeObjectRelease();
      if ((v15 & 1) == 0)
      {
        if (__OFADD__(v13, 1))
        {
          __break(1u);
          return result;
        }
        if (v10 == v13 + 1) {
          return 1;
        }
      }
    }
  }
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  char v20 = v5;
  MEMORY[0x230F88070](&v17, v6);
  return v17 != 6 && *(unsigned __int8 *)(v2 + 121) == v17;
}

uint64_t sub_22D6A001C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v172 = a2;
  uint64_t v141 = sub_22D6CC178();
  OUTLINED_FUNCTION_0_0();
  uint64_t v139 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_0_3();
  uint64_t v138 = v8;
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B040);
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_0_3();
  uint64_t v140 = v10;
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857CCE8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_0_3();
  uint64_t v137 = v12;
  uint64_t v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857CCE0);
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_53();
  uint64_t v171 = v14;
  MEMORY[0x270FA5388](v15);
  uint64_t v170 = (uint64_t)&v135 - v16;
  OUTLINED_FUNCTION_0_0();
  uint64_t v187 = v17;
  uint64_t v178 = *(void *)(v18 + 64);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v167 = (char *)&v135 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  v184 = (char *)&v135 - v22;
  uint64_t v23 = sub_22D6CB578();
  OUTLINED_FUNCTION_0_0();
  uint64_t v179 = v24;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_0_3();
  uint64_t v177 = v26;
  uint64_t v175 = sub_22D6CB108();
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_0_3();
  v174 = v28;
  uint64_t v29 = _s8MenuCellVMa();
  uint64_t v152 = v29;
  uint64_t v30 = a1[3];
  uint64_t v190 = a1[2];
  v191 = a1;
  uint64_t v31 = a1[4];
  uint64_t v192 = a1[5];
  uint64_t v193 = v31;
  uint64_t v188 = a1[6];
  uint64_t v189 = v30;
  uint64_t v210 = v190;
  uint64_t v211 = v30;
  uint64_t v212 = v31;
  uint64_t v213 = v192;
  uint64_t v214 = v188;
  uint64_t v32 = _s25LibrarySectionContentViewVMa();
  uint64_t v153 = v32;
  uint64_t v33 = sub_22D6A2124(&qword_26857E2F0, (void (*)(uint64_t))_s8MenuCellVMa);
  uint64_t v151 = v33;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v210 = v29;
  uint64_t v211 = v32;
  uint64_t v212 = v33;
  uint64_t v213 = WitnessTable;
  uint64_t v34 = sub_22D6CAFF8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v173 = v35;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_10();
  uint64_t v145 = v37;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857B488);
  uint64_t v147 = v34;
  uint64_t v38 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  v176 = v39;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_10();
  uint64_t v149 = v41;
  uint64_t v42 = swift_getWitnessTable();
  uint64_t v146 = v42;
  unint64_t v43 = sub_22D6A1B98();
  v209[6] = v42;
  v209[7] = v43;
  uint64_t v165 = MEMORY[0x263F18E48];
  uint64_t v44 = swift_getWitnessTable();
  uint64_t v45 = sub_22D6A2124((unint64_t *)&qword_26857B498, MEMORY[0x263F19B68]);
  uint64_t v210 = v38;
  uint64_t v211 = v23;
  uint64_t v143 = v44;
  uint64_t v144 = v23;
  uint64_t v212 = v44;
  uint64_t v213 = v45;
  uint64_t v142 = v45;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v160 = v46;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_10();
  uint64_t v180 = v48;
  uint64_t v49 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v164 = v50;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v51);
  OUTLINED_FUNCTION_10();
  uint64_t v183 = v52;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26857C408);
  uint64_t v158 = v53;
  uint64_t v210 = v38;
  uint64_t v211 = v23;
  uint64_t v212 = v44;
  uint64_t v213 = v45;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v148 = OpaqueTypeConformance2;
  unint64_t v55 = sub_22D6A1BEC();
  v209[4] = OpaqueTypeConformance2;
  v209[5] = v55;
  uint64_t v159 = v49;
  uint64_t v56 = swift_getWitnessTable();
  uint64_t v157 = v56;
  uint64_t v156 = sub_22D6A1F74(&qword_26857E300, qword_26857C408, (void (*)(void))sub_22D6A1C38);
  uint64_t v210 = v49;
  uint64_t v211 = v53;
  uint64_t v212 = v56;
  uint64_t v213 = v156;
  uint64_t v162 = MEMORY[0x263F1B270];
  uint64_t v161 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v163 = v57;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v58);
  OUTLINED_FUNCTION_10();
  uint64_t v181 = v59;
  uint64_t v182 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v185 = v60;
  MEMORY[0x270FA5388](v61);
  OUTLINED_FUNCTION_53();
  uint64_t v166 = v62;
  uint64_t v64 = MEMORY[0x270FA5388](v63);
  uint64_t v155 = (char *)&v135 - v65;
  MEMORY[0x270FA5388](v64);
  v186 = (char *)&v135 - v66;
  uint64_t v201 = v190;
  uint64_t v202 = v189;
  uint64_t v203 = v193;
  uint64_t v204 = v192;
  uint64_t v205 = v188;
  uint64_t v67 = v194;
  uint64_t v206 = v194;
  uint64_t v195 = v190;
  uint64_t v196 = v189;
  uint64_t v197 = v193;
  uint64_t v198 = v192;
  uint64_t v199 = v188;
  uint64_t v200 = v194;
  sub_22D68C874((uint64_t)sub_22D6A1C84);
  uint64_t v68 = v191;
  uint64_t v153 = v67 + *((int *)v191 + 24);
  uint64_t v69 = *(void *)(v153 + 16);
  uint64_t v70 = v174;
  uint64_t v71 = (char *)v174 + *(int *)(v175 + 20);
  uint64_t v72 = *MEMORY[0x263F19860];
  sub_22D6CB3F8();
  OUTLINED_FUNCTION_7();
  (*(void (**)(char *, uint64_t))(v73 + 104))(v71, v72);
  *uint64_t v70 = v69;
  v70[1] = v69;
  sub_22D6A2124(&qword_26857B678, MEMORY[0x263F19048]);
  sub_22D5DADC8();
  sub_22D6CBC28();
  sub_22D6055A0((uint64_t)v70);
  OUTLINED_FUNCTION_22();
  v74();
  sub_22D69D018();
  sub_22D5DADD0();
  sub_22D6CBBD8();
  OUTLINED_FUNCTION_22();
  v75();
  OUTLINED_FUNCTION_22();
  v76();
  uint64_t v77 = v187;
  uint64_t v173 = *(void (**)(char *, uint64_t, void *))(v187 + 16);
  v174 = (void *)(v187 + 16);
  uint64_t v78 = v184;
  uint64_t v79 = v194;
  uint64_t v80 = v68;
  v173(v184, v194, v68);
  uint64_t v81 = *(unsigned __int8 *)(v77 + 80);
  v178 += (v81 + 56) & ~v81;
  uint64_t v179 = (v81 + 56) & ~v81;
  uint64_t v82 = v179;
  uint64_t v177 = v81 | 7;
  uint64_t v83 = (char *)swift_allocObject();
  uint64_t v84 = v189;
  uint64_t v85 = v190;
  *((void *)v83 + 2) = v190;
  *((void *)v83 + 3) = v84;
  uint64_t v86 = v192;
  *((void *)v83 + 4) = v193;
  *((void *)v83 + 5) = v86;
  uint64_t v87 = v188;
  *((void *)v83 + 6) = v188;
  unint64_t v88 = *(void (**)(char *, char *, void *))(v77 + 32);
  uint64_t v175 = v77 + 32;
  v176 = v88;
  v88(&v83[v82], v78, v80);
  sub_22D6CBDE8();
  swift_release();
  OUTLINED_FUNCTION_22();
  v89();
  uint64_t v90 = *(void *)(v79 + 56);
  char v91 = *(unsigned char *)(v79 + 64);
  uint64_t v210 = *(void *)(v79 + 48);
  uint64_t v211 = v90;
  LOBYTE(v212) = v91;
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E310);
  MEMORY[0x230F88070](v209, v92);
  LOBYTE(v210) = v209[0];
  uint64_t v93 = v184;
  uint64_t v94 = v80;
  uint64_t v95 = v80;
  uint64_t v96 = v173;
  v173(v184, v79, v95);
  uint64_t v97 = (void *)swift_allocObject();
  v97[2] = v85;
  v97[3] = v84;
  uint64_t v98 = v192;
  v97[4] = v193;
  v97[5] = v98;
  uint64_t v99 = (char *)v97 + v179;
  v97[6] = v87;
  uint64_t v100 = v93;
  v176(v99, v93, v94);
  uint64_t v101 = v158;
  uint64_t v102 = v159;
  uint64_t v104 = v156;
  uint64_t v103 = v157;
  sub_22D6CBE88();
  swift_release();
  OUTLINED_FUNCTION_22();
  v105();
  uint64_t v106 = v191;
  v96(v100, v194, v191);
  uint64_t v107 = (void *)swift_allocObject();
  uint64_t v108 = v189;
  v107[2] = v190;
  v107[3] = v108;
  uint64_t v109 = v192;
  v107[4] = v193;
  v107[5] = v109;
  uint64_t v110 = (char *)v107 + v179;
  v107[6] = v188;
  v176(v110, v100, v106);
  uint64_t v111 = v182;
  uint64_t v112 = v167;
  uint64_t v210 = v102;
  uint64_t v211 = v101;
  uint64_t v212 = v103;
  uint64_t v213 = v104;
  uint64_t v113 = swift_getOpaqueTypeConformance2();
  uint64_t v114 = v155;
  sub_22D6CBE68();
  swift_release();
  OUTLINED_FUNCTION_22();
  v115();
  v209[2] = v113;
  v209[3] = MEMORY[0x263F1A240];
  uint64_t v193 = swift_getWitnessTable();
  sub_22D6B8B10(v114, v111);
  unint64_t v116 = *(void (**)(void))(v185 + 8);
  OUTLINED_FUNCTION_7_9();
  v116();
  LOBYTE(v106) = *(unsigned char *)(v194 + 120);
  ((void (*)(char *))v173)(v112);
  if (v106)
  {
    OUTLINED_FUNCTION_22();
    v117();
  }
  else
  {
    uint64_t v118 = *((void *)v112 + 3);
    LOBYTE(v210) = v112[16];
    uint64_t v211 = v118;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857AFC0);
    sub_22D6CC028();
    OUTLINED_FUNCTION_22();
    v119();
    if ((v209[0] & 1) == 0)
    {
      uint64_t v123 = v138;
      sub_22D6CC168();
      char v124 = sub_22D6CB8E8();
      sub_22D6CADB8();
      OUTLINED_FUNCTION_1_9();
      uint64_t v126 = v139;
      uint64_t v125 = v140;
      uint64_t v127 = v141;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v139 + 16))(v140, v123, v141);
      uint64_t v128 = v125 + *(int *)(v136 + 36);
      *(unsigned char *)uint64_t v128 = v124;
      *(void *)(v128 + 8) = v69;
      *(void *)(v128 + 16) = v2;
      *(void *)(v128 + 24) = v3;
      *(void *)(v128 + 32) = v4;
      *(unsigned char *)(v128 + 40) = 0;
      (*(void (**)(uint64_t, uint64_t))(v126 + 8))(v123, v127);
      LOBYTE(v127) = sub_22D6CB8F8();
      sub_22D6CADB8();
      OUTLINED_FUNCTION_1_9();
      uint64_t v129 = v137;
      sub_22D5DD3A4(v125, v137, &qword_26857B040);
      uint64_t v122 = v168;
      uint64_t v130 = v129 + *(int *)(v168 + 36);
      *(unsigned char *)uint64_t v130 = v127;
      *(void *)(v130 + 8) = v69;
      *(void *)(v130 + 16) = v2;
      *(void *)(v130 + 24) = v3;
      *(void *)(v130 + 32) = v4;
      *(unsigned char *)(v130 + 40) = 0;
      sub_22D5DD960(v125, &qword_26857B040);
      uint64_t v121 = v170;
      sub_22D64D238(v129, v170);
      uint64_t v120 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v120 = 1;
  uint64_t v121 = v170;
  uint64_t v122 = v168;
LABEL_6:
  __swift_storeEnumTagSinglePayload(v121, v120, 1, v122);
  uint64_t v131 = v166;
  uint64_t v132 = v182;
  (*(void (**)(uint64_t, char *, uint64_t))(v185 + 16))(v166, v186, v182);
  uint64_t v210 = v131;
  uint64_t v133 = v171;
  sub_22D5DD3A4(v121, v171, &qword_26857CCE0);
  uint64_t v211 = v133;
  v209[0] = v132;
  v209[1] = v169;
  uint64_t v207 = v193;
  uint64_t v208 = sub_22D6A1F74((unint64_t *)&qword_26857CCF0, &qword_26857CCE0, (void (*)(void))sub_22D6A1FE0);
  sub_22D634638((uint64_t)&v210, 2, (uint64_t)v209);
  sub_22D5DD960(v121, &qword_26857CCE0);
  OUTLINED_FUNCTION_7_9();
  v116();
  sub_22D5DD960(v133, &qword_26857CCE0);
  OUTLINED_FUNCTION_7_9();
  return ((uint64_t (*)(void))v116)();
}

uint64_t sub_22D6A0ED4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v32 = a6;
  uint64_t v33 = a5;
  uint64_t v41 = a7;
  uint64_t v40 = sub_22D6CC5A8();
  uint64_t v13 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v38 = (char *)&v32 - v14;
  uint64_t v43 = a2;
  uint64_t v44 = a3;
  uint64_t v34 = a3;
  uint64_t v35 = a2;
  uint64_t v15 = a3;
  uint64_t v45 = a4;
  uint64_t v46 = a5;
  uint64_t v47 = a6;
  uint64_t v16 = _s25LibrarySectionContentViewVMa();
  uint64_t v39 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v32 - v20;
  uint64_t v22 = *(void *)(a1 + 72);
  uint64_t v23 = *(void *)(a1 + 80);
  uint64_t v24 = *(void *)(a1 + 112);
  uint64_t v36 = *(void *)(a1 + 104);
  uint64_t v37 = v22;
  unsigned __int8 v42 = *(unsigned char *)(a1 + 121);
  uint64_t v43 = a2;
  uint64_t v44 = v15;
  uint64_t v25 = a4;
  uint64_t v26 = v33;
  uint64_t v45 = a4;
  uint64_t v46 = v33;
  uint64_t v27 = v32;
  uint64_t v47 = v32;
  uint64_t v28 = a1 + *(int *)(_s15LibraryMenuCellVMa() + 92);
  uint64_t v29 = (uint64_t)v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v38, v28, v40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22D6A6CD4(v37, v23, v36, v24, &v42, v29, v35, (uint64_t)v19, v34, v25, v26, v27);
  swift_getWitnessTable();
  sub_22D6B8B10(v19, v16);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v39 + 8);
  v30(v19, v16);
  sub_22D6B8B10(v21, v16);
  return ((uint64_t (*)(char *, uint64_t))v30)(v21, v16);
}

uint64_t sub_22D6A1180@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1[9];
  uint64_t v3 = a1[10];
  uint64_t v6 = a1[11];
  uint64_t v5 = a1[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_22D6CB9E8();
  __asm { FMOV            V0.2D, #8.0 }
  *(_OWORD *)(a2 + 40) = _Q0;
  *(_OWORD *)(a2 + 56) = xmmword_22D6D2FD0;
  *(void *)(a2 + 72) = v7;
  uint64_t v13 = (uint64_t *)(a2 + *(int *)(_s8MenuCellVMa() + 32));
  *uint64_t v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(qword_26857E328);
  uint64_t result = swift_storeEnumTagMultiPayload();
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v3;
  *(void *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v5;
  *(unsigned char *)(a2 + 32) = 0;
  return result;
}

uint64_t sub_22D6A122C(char a1)
{
  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857AFC0);
    sub_22D6CC038();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E310);
  return sub_22D6CC128();
}

uint64_t sub_22D6A12D8()
{
  return sub_22D6CC038();
}

uint64_t sub_22D6A1350(uint64_t a1)
{
  uint64_t v2 = sub_22D6CC808();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v65 = (char *)&v45 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v45 - v9;
  uint64_t v11 = _s9ViewModelCMa();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v54 = v11;
  sub_22D6CB168();
  uint64_t v12 = sub_22D6553D8();
  swift_release();
  uint64_t v13 = *(void *)(v12 + 16);
  if (v13)
  {
    uint64_t v46 = v6;
    uint64_t v51 = a1;
    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
    uint64_t v14 = v3 + 16;
    uint64_t v64 = v15;
    unint64_t v16 = v12 + ((*(unsigned __int8 *)(v14 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 64));
    uint64_t v17 = (uint64_t (**)(char *, uint64_t))(v14 + 72);
    int v63 = *MEMORY[0x263F56EE0];
    int v60 = *MEMORY[0x263F56EF8];
    int v59 = *MEMORY[0x263F56EC0];
    int v58 = *MEMORY[0x263F56F00];
    int v57 = *MEMORY[0x263F56EE8];
    int v56 = *MEMORY[0x263F56EB8];
    int v55 = *MEMORY[0x263F56F08];
    int v52 = *MEMORY[0x263F56ED8];
    int v49 = *MEMORY[0x263F56ED0];
    int v48 = *MEMORY[0x263F56EF0];
    int v47 = *MEMORY[0x263F56EC8];
    uint64_t v18 = (void (**)(char *, uint64_t))(v14 - 8);
    uint64_t v62 = *(void *)(v14 + 56);
    uint64_t v50 = v12;
    swift_bridgeObjectRetain();
    uint64_t v19 = MEMORY[0x263F8EE78];
    uint64_t v61 = v14;
    while (1)
    {
      uint64_t v20 = v64;
      v64(v10, (char *)v16, v2);
      uint64_t v21 = v65;
      v20(v65, v10, v2);
      int v22 = (*v17)(v21, v2);
      if (v22 == v63) {
        break;
      }
      if (v22 == v60)
      {
        char v23 = 0;
        goto LABEL_7;
      }
      if (v22 != v59 && v22 != v58 && v22 != v57 && v22 != v56)
      {
        if (v22 == v55)
        {
          char v23 = 3;
          goto LABEL_7;
        }
        if (v22 == v52)
        {
          char v23 = 2;
          goto LABEL_7;
        }
        if (v22 != v49 && v22 != v48 && v22 != v47)
        {
          v64(v46, v10, v2);
          unint64_t v68 = 0;
          unint64_t v69 = 0xE000000000000000;
          sub_22D6CD3E8();
          swift_bridgeObjectRelease();
          unint64_t v68 = 0xD000000000000029;
          unint64_t v69 = 0x800000022D6D6F90;
          sub_22D6A2124(&qword_26857E318, MEMORY[0x263F56F10]);
          sub_22D6CD578();
          sub_22D6CCF68();
          swift_bridgeObjectRelease();
          sub_22D6CCF68();
          uint64_t result = sub_22D6CD498();
          __break(1u);
          return result;
        }
      }
      (*v18)(v10, v2);
LABEL_12:
      v16 += v62;
      if (!--v13)
      {
        swift_bridgeObjectRelease_n();
        a1 = v51;
        goto LABEL_39;
      }
    }
    char v23 = 1;
LABEL_7:
    (*v18)(v10, v2);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_22D66365C();
      uint64_t v19 = v30;
    }
    unint64_t v24 = *(void *)(v19 + 16);
    if (v24 >= *(void *)(v19 + 24) >> 1)
    {
      sub_22D66365C();
      uint64_t v19 = v31;
    }
    *(void *)(v19 + 16) = v24 + 1;
    *(unsigned char *)(v19 + v24 + 32) = v23;
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  uint64_t v19 = MEMORY[0x263F8EE78];
LABEL_39:
  unint64_t v32 = *(void *)(a1 + 32);
  unint64_t v33 = *(void *)(a1 + 40);
  unint64_t v68 = v32;
  unint64_t v69 = v33;
  uint64_t v67 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E320);
  sub_22D6CC038();
  sub_22D6CB168();
  uint64_t v34 = sub_22D6553D8();
  swift_release();
  uint64_t v35 = *(void *)(v34 + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v35)
  {
    unint64_t v68 = v32;
    unint64_t v69 = v33;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_22D6CC028();
    uint64_t v36 = v67;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_22D66365C();
      uint64_t v36 = v40;
    }
    unint64_t v37 = *(void *)(v36 + 16);
    if (v37 >= *(void *)(v36 + 24) >> 1)
    {
      sub_22D66365C();
      uint64_t v36 = v41;
    }
    *(void *)(v36 + 16) = v37 + 1;
    *(unsigned char *)(v36 + v37 + 32) = 4;
    unint64_t v68 = v32;
    unint64_t v69 = v33;
    uint64_t v66 = v36;
    sub_22D6CC038();
    swift_release();
    swift_bridgeObjectRelease();
    unint64_t v68 = v32;
    unint64_t v69 = v33;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_22D6CC028();
    uint64_t v38 = v67;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_22D66365C();
      uint64_t v38 = v42;
    }
    unint64_t v39 = *(void *)(v38 + 16);
    if (v39 >= *(void *)(v38 + 24) >> 1)
    {
      sub_22D66365C();
      uint64_t v38 = v43;
    }
    *(void *)(v38 + 16) = v39 + 1;
    *(unsigned char *)(v38 + v39 + 32) = 5;
    unint64_t v68 = v32;
    unint64_t v69 = v33;
    uint64_t v66 = v38;
    sub_22D6CC038();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22D6A1A44()
{
  return sub_22D6CD668();
}

BOOL sub_22D6A1AE4(double *a1, double *a2)
{
  return sub_22D685998(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

uint64_t sub_22D6A1B08()
{
  return sub_22D6A1A44();
}

uint64_t sub_22D6A1B24()
{
  return sub_22D6859B4();
}

uint64_t sub_22D6A1B40()
{
  return sub_22D6CD668();
}

unint64_t sub_22D6A1B98()
{
  unint64_t result = qword_26857B490;
  if (!qword_26857B490)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857B488);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857B490);
  }
  return result;
}

unint64_t sub_22D6A1BEC()
{
  unint64_t result = qword_26857E2F8;
  if (!qword_26857E2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E2F8);
  }
  return result;
}

unint64_t sub_22D6A1C38()
{
  unint64_t result = qword_26857E308;
  if (!qword_26857E308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E308);
  }
  return result;
}

uint64_t sub_22D6A1C84()
{
  return sub_22D6A1CB4((uint64_t (*)(void, void, void, void, void, void))sub_22D6A0ED4);
}

uint64_t sub_22D6A1C9C()
{
  return sub_22D6A1CB4((uint64_t (*)(void, void, void, void, void, void))sub_22D6A1180);
}

uint64_t sub_22D6A1CB4(uint64_t (*a1)(void, void, void, void, void, void))
{
  return a1(v1[7], v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_22D6A1CD0()
{
  uint64_t v0 = _s15LibraryMenuCellVMa();
  OUTLINED_FUNCTION_1_0(v0);
  OUTLINED_FUNCTION_9_10();
  return sub_22D6A122C(v1);
}

uint64_t sub_22D6A1D68()
{
  return sub_22D6A1EE8(sub_22D6A12D8);
}

uint64_t objectdestroyTm_9()
{
  _s15LibraryMenuCellVMa();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22D6CC5A8();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_22();
  v0();
  return swift_deallocObject();
}

uint64_t sub_22D6A1ED0()
{
  return sub_22D6A1EE8((uint64_t (*)(void))sub_22D6A1350);
}

uint64_t sub_22D6A1EE8(uint64_t (*a1)(void))
{
  uint64_t v1 = _s15LibraryMenuCellVMa();
  OUTLINED_FUNCTION_1_0(v1);
  OUTLINED_FUNCTION_9_10();
  return a1();
}

uint64_t sub_22D6A1F74(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_22D6A1FE0()
{
  unint64_t result = qword_26857CCF8[0];
  if (!qword_26857CCF8[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857CCE8);
    sub_22D5DD4F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26857CCF8);
  }
  return result;
}

uint64_t sub_22D6A205C(uint64_t a1)
{
  uint64_t v2 = sub_22D6CB418();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_22D6CB1F8();
}

uint64_t sub_22D6A2124(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22D6A216C()
{
  return sub_22D6CB1E8();
}

uint64_t _s15LibraryMenuCellV9ConstantsVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D6A21AC()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D6A249C()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D6A24B8()
{
  sub_22D6A4CB0();
  return sub_22D6CB328();
}

uint64_t sub_22D6A2500()
{
  return sub_22D6A24B8();
}

uint64_t sub_22D6A2524(uint64_t a1)
{
  sub_22D6A4C48(a1, (uint64_t)v2);
  return sub_22D6A255C((uint64_t)v2);
}

uint64_t sub_22D6A255C(uint64_t a1)
{
  sub_22D6A4C48(a1, (uint64_t)v3);
  sub_22D6A4CB0();
  sub_22D6CB338();
  return sub_22D61324C(a1, &qword_26857AF90);
}

uint64_t static MusicPicker.PageID.== infix(_:_:)(unint64_t *a1, unint64_t *a2)
{
  uint64_t v4 = sub_22D6CA308();
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v43 - v11;
  unint64_t v13 = *a1;
  unint64_t v14 = *a2;
  switch(v13 >> 61)
  {
    case 1uLL:
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857AE48);
      uint64_t v25 = swift_projectBox();
      if (v14 >> 61 != 1) {
        goto LABEL_20;
      }
      uint64_t v26 = v25;
      uint64_t v27 = *(int *)(v24 + 48);
      LODWORD(v47) = *(unsigned __int8 *)(v25 + v27);
      uint64_t v46 = *(void *)(v25 + v27 + 8);
      uint64_t v28 = *(void *)(v25 + v27 + 16);
      unint64_t v48 = *(void *)(v25 + v27 + 24);
      uint64_t v49 = v28;
      uint64_t v29 = swift_projectBox();
      int v45 = *(unsigned __int8 *)(v29 + v27);
      uint64_t v44 = *(void *)(v29 + v27 + 8);
      uint64_t v30 = *(void *)(v29 + v27 + 16);
      unint64_t v50 = *(void *)(v29 + v27 + 24);
      uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      uint64_t v32 = v26;
      uint64_t v33 = v30;
      v31(v12, v32, v4);
      uint64_t v34 = v29;
      unint64_t v35 = v50;
      v31(v10, v34, v4);
      unint64_t v36 = v48;
      uint64_t v37 = v49;
      sub_22D5DB288(v14);
      sub_22D5DB288(v13);
      swift_bridgeObjectRetain();
      sub_22D5DB288(v36);
      swift_bridgeObjectRetain();
      sub_22D5DB288(v35);
      if (sub_22D6CA2F8())
      {
        LOBYTE(v54) = v47;
        *(void *)&long long v55 = v46;
        *((void *)&v55 + 1) = v37;
        unint64_t v56 = v36;
        LOBYTE(v51) = v45;
        *(void *)&long long v52 = v44;
        *((void *)&v52 + 1) = v33;
        unint64_t v53 = v35;
        char v38 = static MusicPicker.Click.SourceContext.== infix(_:_:)(&v54, &v51);
        uint64_t v47 = v33;
        char v22 = v38;
        unint64_t v39 = *(void (**)(void))(v6 + 8);
        OUTLINED_FUNCTION_1_12();
        v39();
        OUTLINED_FUNCTION_1_12();
        v39();
        swift_bridgeObjectRelease();
        sub_22D5DB9FC(v50);
        swift_bridgeObjectRelease();
        sub_22D5DB9FC(v36);
        goto LABEL_16;
      }
      swift_bridgeObjectRelease();
      sub_22D5DB9FC(v35);
      swift_bridgeObjectRelease();
      sub_22D5DB9FC(v36);
      uint64_t v42 = *(void (**)(void))(v6 + 8);
      OUTLINED_FUNCTION_1_12();
      v42();
      OUTLINED_FUNCTION_1_12();
      v42();
      goto LABEL_23;
    case 2uLL:
      if (v14 >> 61 != 2) {
        goto LABEL_20;
      }
      unint64_t v19 = *(void *)((v13 & 0x1FFFFFFFFFFFFFFFLL) + 0x28);
      char v20 = *(unsigned char *)((v14 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      unint64_t v21 = *(void *)((v14 & 0x1FFFFFFFFFFFFFFFLL) + 0x28);
      LOBYTE(v54) = *(unsigned char *)((v13 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      long long v55 = *(_OWORD *)((v13 & 0x1FFFFFFFFFFFFFFFLL) + 0x18);
      unint64_t v56 = v19;
      LOBYTE(v51) = v20;
      long long v52 = *(_OWORD *)((v14 & 0x1FFFFFFFFFFFFFFFLL) + 0x18);
      unint64_t v53 = v21;
      goto LABEL_7;
    case 3uLL:
      if (v14 >> 61 != 3) {
        goto LABEL_21;
      }
      sub_22D5DB9FC(v13);
      sub_22D5DB9FC(v14);
      char v22 = v14 == v13;
      return v22 & 1;
    case 4uLL:
      if (v13 == 0x8000000000000000)
      {
        if (v14 != 0x8000000000000000) {
          goto LABEL_21;
        }
        sub_22D5DB9FC(0x8000000000000000);
        unint64_t v23 = 0x8000000000000000;
      }
      else
      {
        if (v14 != 0x8000000000000001) {
          goto LABEL_21;
        }
        sub_22D5DB9FC(0x8000000000000001);
        unint64_t v23 = 0x8000000000000001;
      }
      sub_22D5DB9FC(v23);
      char v22 = 1;
      return v22 & 1;
    default:
      if (v14 >> 61)
      {
LABEL_20:
        swift_retain();
LABEL_21:
        unint64_t v40 = v14;
        goto LABEL_22;
      }
      if (*(unsigned __int8 *)(v13 + 16) != *(unsigned __int8 *)(v14 + 16))
      {
        sub_22D5DB288(v14);
        unint64_t v40 = v13;
LABEL_22:
        sub_22D5DB288(v40);
LABEL_23:
        sub_22D5DB9FC(v13);
        sub_22D5DB9FC(v14);
        char v22 = 0;
        return v22 & 1;
      }
      long long v15 = *(_OWORD *)(v13 + 32);
      unint64_t v16 = *(void *)(v13 + 48);
      unint64_t v17 = *(void *)(v14 + 48);
      char v18 = *(unsigned char *)(v14 + 24);
      LOBYTE(v54) = *(unsigned char *)(v13 + 24);
      long long v55 = v15;
      unint64_t v56 = v16;
      LOBYTE(v51) = v18;
      long long v52 = *(_OWORD *)(v14 + 32);
      unint64_t v53 = v17;
LABEL_7:
      sub_22D5DB288(v14);
      sub_22D5DB288(v13);
      char v22 = static MusicPicker.Click.SourceContext.== infix(_:_:)(&v54, &v51);
LABEL_16:
      sub_22D5DB9FC(v13);
      sub_22D5DB9FC(v14);
      return v22 & 1;
  }
}

uint64_t static MusicPicker.Click.SourceContext.== infix(_:_:)(void *a1, void *a2)
{
  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2) {
    goto LABEL_11;
  }
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  if (!v3)
  {
    if (!v5)
    {
LABEL_12:
      uint64_t v11 = v6;
      uint64_t v12 = v4;
      char v9 = static MusicPicker.PageID.== infix(_:_:)(&v12, &v11);
      return v9 & 1;
    }
LABEL_11:
    char v9 = 0;
    return v9 & 1;
  }
  if (!v5) {
    goto LABEL_11;
  }
  if (a1[1] == a2[1] && v3 == v5) {
    goto LABEL_12;
  }
  char v8 = sub_22D6CD5A8();
  char v9 = 0;
  if (v8) {
    goto LABEL_12;
  }
  return v9 & 1;
}

unint64_t MusicPicker.PageID.hash(into:)(uint64_t a1)
{
  uint64_t v4 = sub_22D6CA308();
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2_0();
  uint64_t v8 = *v1;
  switch((unint64_t)*v1 >> 61)
  {
    case 1uLL:
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857AE48);
      uint64_t v12 = swift_projectBox();
      uint64_t v13 = v12 + *(int *)(v11 + 48);
      uint64_t v14 = *(void *)(v13 + 16);
      unint64_t v15 = *(void *)(v13 + 24);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, v12, v4);
      sub_22D6CD638();
      swift_bridgeObjectRetain();
      sub_22D5DB288(v15);
      sub_22D6A3A00(&qword_26857E3D8, MEMORY[0x263F56838]);
      sub_22D6CCE18();
      sub_22D6CD638();
      sub_22D6CD648();
      if (v14)
      {
        swift_bridgeObjectRetain();
        sub_22D6CCF58();
        swift_bridgeObjectRelease();
      }
      MusicPicker.PageID.hash(into:)(a1);
      OUTLINED_FUNCTION_1_12();
      v18();
      swift_bridgeObjectRelease();
      unint64_t v16 = v15;
      goto LABEL_13;
    case 2uLL:
      uint64_t v9 = *(void *)((v8 & 0x1FFFFFFFFFFFFFFFLL) + 0x20);
      unint64_t v10 = *(void *)((v8 & 0x1FFFFFFFFFFFFFFFLL) + 0x28);
      sub_22D6CD638();
      goto LABEL_6;
    case 3uLL:
      sub_22D6CD638();
      goto LABEL_11;
    case 4uLL:
LABEL_11:
      unint64_t result = sub_22D6CD638();
      break;
    default:
      uint64_t v9 = *(void *)(v8 + 40);
      unint64_t v10 = *(void *)(v8 + 48);
      sub_22D6CD638();
      sub_22D6CD638();
LABEL_6:
      sub_22D6CD638();
      sub_22D6CD648();
      if (v9)
      {
        swift_bridgeObjectRetain();
        sub_22D5DB288(v10);
        swift_bridgeObjectRetain();
        sub_22D6CCF58();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_22D5DB288(v10);
      }
      MusicPicker.PageID.hash(into:)(a1);
      swift_bridgeObjectRelease();
      unint64_t v16 = v10;
LABEL_13:
      unint64_t result = sub_22D5DB9FC(v16);
      break;
  }
  return result;
}

uint64_t MusicPicker.PageID.hashValue.getter()
{
  v2[9] = *v0;
  sub_22D6CD628();
  MusicPicker.PageID.hash(into:)((uint64_t)v2);
  return sub_22D6CD668();
}

uint64_t sub_22D6A2DC0()
{
  v2[9] = *v0;
  sub_22D6CD628();
  MusicPicker.PageID.hash(into:)((uint64_t)v2);
  return sub_22D6CD668();
}

void MusicPicker.Click.SourceContext.controlKind.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t MusicPicker.Click.SourceContext.sectionTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t MusicPicker.Click.SourceContext.pageID.getter@<X0>(unint64_t *a1@<X8>)
{
  unint64_t v2 = *(void *)(v1 + 24);
  *a1 = v2;
  return sub_22D5DB288(v2);
}

unint64_t MusicPicker.Click.SourceContext.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  sub_22D6CD638();
  sub_22D6CD648();
  if (v3)
  {
    swift_bridgeObjectRetain();
    sub_22D6CCF58();
    swift_bridgeObjectRelease();
  }
  return MusicPicker.PageID.hash(into:)(a1);
}

uint64_t MusicPicker.Click.SourceContext.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  OUTLINED_FUNCTION_7_10();
  sub_22D6CD638();
  sub_22D6CD648();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_22D6CCF58();
    swift_bridgeObjectRelease();
  }
  MusicPicker.PageID.hash(into:)((uint64_t)v3);
  return sub_22D6CD668();
}

uint64_t sub_22D6A2F9C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_22D6CD628();
  sub_22D6CD638();
  sub_22D6CD648();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_22D6CCF58();
    swift_bridgeObjectRelease();
  }
  MusicPicker.PageID.hash(into:)((uint64_t)v3);
  return sub_22D6CD668();
}

uint64_t static MusicPicker.Click.ControlID.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_22D6CC768();
  OUTLINED_FUNCTION_0_1();
  uint64_t v28 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_7();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (unsigned __int8 *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v27 - v13;
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (unsigned __int8 *)&v27 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E3E0);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  char v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v21 = &v20[*(int *)(v18 + 56)];
  sub_22D6A35F4(a1, (uint64_t)v20);
  sub_22D6A35F4(a2, (uint64_t)v21);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_22D6A35F4((uint64_t)v20, (uint64_t)v14);
      if (OUTLINED_FUNCTION_6_10() == 1)
      {
        uint64_t v23 = v28;
        (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v2, v21, v5);
        char v24 = sub_22D6CC758();
        uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
        v25(v2, v5);
        v25((uint64_t)v14, v5);
        goto LABEL_9;
      }
      (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v5);
      goto LABEL_13;
    case 2u:
      sub_22D6A35F4((uint64_t)v20, (uint64_t)v11);
      if (OUTLINED_FUNCTION_6_10() != 2) {
        goto LABEL_13;
      }
      int v22 = *v11;
      goto LABEL_8;
    case 3u:
      if (OUTLINED_FUNCTION_6_10() != 3) {
        goto LABEL_13;
      }
      sub_22D6995A4((uint64_t)v20);
      char v24 = 1;
      return v24 & 1;
    default:
      sub_22D6A35F4((uint64_t)v20, (uint64_t)v16);
      if (OUTLINED_FUNCTION_6_10())
      {
LABEL_13:
        sub_22D61324C((uint64_t)v20, &qword_26857E3E0);
        char v24 = 0;
      }
      else
      {
        int v22 = *v16;
LABEL_8:
        char v24 = v22 == *v21;
LABEL_9:
        sub_22D6995A4((uint64_t)v20);
      }
      return v24 & 1;
  }
}

uint64_t MusicPicker.Click.ControlID.hash(into:)()
{
  uint64_t v3 = sub_22D6CC768();
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2_0();
  sub_22D6A35F4(v0, v2);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v1, v2, v3);
      sub_22D6CD638();
      sub_22D6A3A00(&qword_26857E3E8, MEMORY[0x263F13820]);
      sub_22D6CCE18();
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
      break;
    case 3u:
      goto LABEL_3;
    default:
      sub_22D6CD638();
LABEL_3:
      uint64_t result = sub_22D6CD638();
      break;
  }
  return result;
}

uint64_t MusicPicker.Click.ControlID.hashValue.getter()
{
  return sub_22D6CD668();
}

uint64_t sub_22D6A3500()
{
  return sub_22D6CD668();
}

void *static MusicPicker.Click.LibraryMenuItemID.allCases.getter()
{
  return &unk_26E130B10;
}

void sub_22D6A354C(void *a1@<X8>)
{
  *a1 = &unk_26E130B10;
}

void *static MusicPicker.Click.SearchGroupID.allCases.getter()
{
  return &unk_26E130B38;
}

void sub_22D6A357C(void *a1@<X8>)
{
  *a1 = &unk_26E130B38;
}

void *static MusicPicker.Click.ControlKind.allCases.getter()
{
  return &unk_26E130B68;
}

void sub_22D6A359C(void *a1@<X8>)
{
  *a1 = &unk_26E130B68;
}

uint64_t type metadata accessor for MusicPicker.Click.ControlID()
{
  uint64_t result = qword_26857E460;
  if (!qword_26857E460) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22D6A35F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MusicPicker.Click.ControlID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

BOOL static MusicPicker.Click.ActionKind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MusicPicker.Click.ActionKind.hash(into:)()
{
  return sub_22D6CD638();
}

void *static MusicPicker.Click.ActionKind.allCases.getter()
{
  return &unk_26E130B90;
}

uint64_t _s25_MusicKitInternal_SwiftUI0A6PickerV5ClickV17LibraryMenuItemIDO9hashValueSivg_0()
{
  return sub_22D6CD668();
}

void sub_22D6A36E8(void *a1@<X8>)
{
  *a1 = &unk_26E130B90;
}

uint64_t static MusicPicker.Click.== infix(_:_:)()
{
  return 1;
}

uint64_t MusicPicker.Click.hashValue.getter()
{
  return sub_22D6CD668();
}

uint64_t sub_22D6A3734()
{
  return MusicPicker.Click.hashValue.getter();
}

uint64_t sub_22D6A374C()
{
  return sub_22D6CD668();
}

double sub_22D6A3780()
{
  qword_26857E3D0 = 0;
  double result = 0.0;
  xmmword_26857E3B0 = 0u;
  unk_26857E3C0 = 0u;
  return result;
}

long long *sub_22D6A3798()
{
  if (qword_26857ADB0 != -1) {
    swift_once();
  }
  return &xmmword_26857E3B0;
}

uint64_t sub_22D6A37E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22D6A3798();
  return sub_22D6A4C48((uint64_t)v2, a1);
}

uint64_t View.musicPickerUserExperienceObserver<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_getKeyPath();
  v10[3] = a3;
  v10[4] = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(boxed_opaque_existential_0, a1, a3);
  sub_22D6CBBC8();
  swift_release();
  return sub_22D61324C((uint64_t)v10, &qword_26857AF90);
}

uint64_t sub_22D6A38F0()
{
  return sub_22D6A24B8();
}

unint64_t sub_22D6A391C()
{
  unint64_t result = qword_26857E3F0;
  if (!qword_26857E3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E3F0);
  }
  return result;
}

unint64_t sub_22D6A396C()
{
  unint64_t result = qword_26857E3F8;
  if (!qword_26857E3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E3F8);
  }
  return result;
}

uint64_t sub_22D6A39B8()
{
  return sub_22D6A3A00(&qword_26857E400, (void (*)(uint64_t))type metadata accessor for MusicPicker.Click.ControlID);
}

uint64_t sub_22D6A3A00(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22D6A3A48()
{
  return sub_22D5DCE80(&qword_26857E408, qword_26857E268);
}

uint64_t sub_22D6A3A88()
{
  return sub_22D5DCE80(&qword_26857E410, &qword_26857E418);
}

unint64_t sub_22D6A3AC8()
{
  unint64_t result = qword_26857E420;
  if (!qword_26857E420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E420);
  }
  return result;
}

uint64_t sub_22D6A3B14()
{
  return sub_22D5DCE80(&qword_26857E428, &qword_26857E430);
}

unint64_t sub_22D6A3B54()
{
  unint64_t result = qword_26857E438;
  if (!qword_26857E438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E438);
  }
  return result;
}

uint64_t sub_22D6A3BA0()
{
  return sub_22D5DCE80(&qword_26857E440, &qword_26857E448);
}

unint64_t sub_22D6A3BE0()
{
  unint64_t result = qword_26857E450;
  if (!qword_26857E450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E450);
  }
  return result;
}

unint64_t sub_22D6A3C30()
{
  unint64_t result = qword_26857E458;
  if (!qword_26857E458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E458);
  }
  return result;
}

uint64_t dispatch thunk of MusicPickerUserExperienceObserver.didLoadPage(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of MusicPickerUserExperienceObserver.didClick(_:sourceContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of MusicPickerUserExperienceObserver.didClick(_:actionKind:sourceContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

unint64_t *_s6PageIDOwCP(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_22D5DB288(*a2);
  *a1 = v3;
  return a1;
}

unint64_t _s6PageIDOwxx(unint64_t *a1)
{
  return sub_22D5DB9FC(*a1);
}

unint64_t *_s6PageIDOwca(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_22D5DB288(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_22D5DB9FC(v4);
  return a1;
}

unint64_t *_s6PageIDOwta(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_22D5DB9FC(v3);
  return a1;
}

uint64_t _s6PageIDOwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xC && *(unsigned char *)(a1 + 8))
    {
      unsigned int v2 = *(_DWORD *)a1 + 11;
    }
    else
    {
      unsigned int v2 = (((*(void *)a1 >> 60) >> 1) & 0xFFFFFFF7 | (8 * ((*(void *)a1 & 0x1000000000000000) != 0))) ^ 0xF;
      if (v2 >= 0xB) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t _s6PageIDOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(void *)unint64_t result = a2 - 12;
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = (unint64_t)(((-a2 >> 3) & 1) - 2 * a2) << 60;
    }
  }
  return result;
}

uint64_t sub_22D6A3DFC(void *a1)
{
  uint64_t v1 = *a1 >> 61;
  if (v1 <= 3) {
    return v1;
  }
  else {
    return *a1 + 4;
  }
}

void *sub_22D6A3E14(void *result)
{
  *result &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_22D6A3E24(unint64_t *result, uint64_t a2)
{
  if (a2 < 4) {
    unint64_t v2 = *result & 0xFFFFFFFFFFFFFFFLL | (a2 << 61);
  }
  else {
    unint64_t v2 = (a2 - 4) | 0x8000000000000000;
  }
  *unint64_t result = v2;
  return result;
}

void type metadata accessor for MusicPicker.PageID()
{
}

void type metadata accessor for MusicPicker.Click()
{
}

unint64_t _s5ClickV13SourceContextVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void *)(a1 + 24);
  return sub_22D5DB9FC(v2);
}

uint64_t _s5ClickV13SourceContextVwcp(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  unint64_t v4 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v4);
  *(void *)(a1 + 24) = v4;
  return a1;
}

uint64_t _s5ClickV13SourceContextVwca(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v4 = *(void *)(a2 + 24);
  sub_22D5DB288(v4);
  unint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  sub_22D5DB9FC(v5);
  return a1;
}

uint64_t _s5ClickV13SourceContextVwta(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  unint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  sub_22D5DB9FC(v5);
  return a1;
}

uint64_t _s5ClickV13SourceContextVwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 16);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s5ClickV13SourceContextVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
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

void type metadata accessor for MusicPicker.Click.SourceContext()
{
}

uint64_t *_s5ClickV9ControlIDOwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_22D6CC768();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t _s5ClickV9ControlIDOwxx(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_22D6CC768();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *_s5ClickV9ControlIDOwcp(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22D6CC768();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *_s5ClickV9ControlIDOwca(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22D6995A4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22D6CC768();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *_s5ClickV9ControlIDOwtk(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22D6CC768();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *_s5ClickV9ControlIDOwta(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22D6995A4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22D6CC768();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22D6A44DC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_22D6A44EC()
{
  uint64_t result = sub_22D6CC768();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t _s5ClickV17LibraryMenuItemIDOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s5ClickV17LibraryMenuItemIDOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22D6A46DCLL);
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

void type metadata accessor for MusicPicker.Click.LibraryMenuItemID()
{
}

uint64_t _s5ClickV13SearchGroupIDOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF7)
  {
    if (a2 + 9 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 9) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v5 = v6 - 10;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s5ClickV13SearchGroupIDOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x22D6A4864);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

void type metadata accessor for MusicPicker.Click.SearchGroupID()
{
}

uint64_t _s5ClickV11ControlKindOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s5ClickV11ControlKindOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22D6A49ECLL);
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

void type metadata accessor for MusicPicker.Click.ControlKind()
{
}

uint64_t _s8ModuleIDOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s5ClickV10ActionKindOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22D6A4B74);
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

void type metadata accessor for MusicPicker.Click.ActionKind()
{
}

uint64_t sub_22D6A4BA8()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D6A4C48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857AF90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_22D6A4CB0()
{
  unint64_t result = qword_26857E480;
  if (!qword_26857E480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E480);
  }
  return result;
}

ValueMetadata *type metadata accessor for UserExperienceObserverKey()
{
  return &type metadata for UserExperienceObserverKey;
}

uint64_t OUTLINED_FUNCTION_6_10()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t *sub_22D6A4D48(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = a2[2];
    v3[1] = a2[1];
    v3[2] = v5;
    uint64_t v6 = *(int *)(a3 + 24);
    BOOL v7 = (char *)v3 + v6;
    uint64_t v8 = (char *)a2 + v6;
    swift_bridgeObjectRetain();
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6B0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6A8);
      memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t sub_22D6A4E80(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6B0);
  uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!result)
  {
    BOOL v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_22D6A4F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (void *)(a1 + v5);
  BOOL v7 = (const void *)(a2 + v5);
  swift_bridgeObjectRetain();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6B0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6A8);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_22D6A5008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  BOOL v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6B0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6A8);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t sub_22D6A5194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6B0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6A8);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

uint64_t sub_22D6A5278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6B0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6A8);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  return a1;
}

uint64_t sub_22D6A53F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D6A5408);
}

uint64_t sub_22D6A5408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6A8);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22D6A5494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D6A54A8);
}

uint64_t sub_22D6A54A8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6A8);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t _s6ModuleVMa()
{
  uint64_t result = qword_26857E488;
  if (!qword_26857E488) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22D6A5574()
{
  sub_22D6A5614();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22D6A5614()
{
  if (!qword_26857E498)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857B6B0);
    unint64_t v0 = sub_22D6CD328();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26857E498);
    }
  }
}

unsigned char *_s8ModuleIDOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22D6A573CLL);
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

ValueMetadata *_s8ModuleIDOMa()
{
  return &_s8ModuleIDON;
}

unint64_t sub_22D6A5778()
{
  unint64_t result = qword_26857E4A0;
  if (!qword_26857E4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E4A0);
  }
  return result;
}

BOOL sub_22D6A57C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6B0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v43 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_0();
  uint64_t v41 = v8 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E4F0);
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6A8);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v42 = (uint64_t)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v40 - v18;
  MEMORY[0x270FA5388](v17);
  unint64_t v21 = (char *)&v40 - v20;
  char v22 = *(unsigned char *)a2;
  unint64_t v23 = sub_22D6A6524(*(unsigned char *)a1);
  uint64_t v25 = v24;
  BOOL v27 = v23 == sub_22D6A6524(v22) && v25 == v26;
  if (v27)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v28 = sub_22D6CD5A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    BOOL result = 0;
    if ((v28 & 1) == 0) {
      return result;
    }
  }
  BOOL v30 = *(void *)(a1 + 8) == *(void *)(a2 + 8) && *(void *)(a1 + 16) == *(void *)(a2 + 16);
  if (v30 || (v31 = sub_22D6CD5A8(), BOOL result = 0, (v31 & 1) != 0))
  {
    uint64_t v32 = _s6ModuleVMa();
    sub_22D62781C(a1 + *(int *)(v32 + 24), (uint64_t)v21);
    sub_22D62781C(a2 + *(int *)(v32 + 24), (uint64_t)v19);
    uint64_t v33 = v13 + *(int *)(v9 + 48);
    sub_22D62781C((uint64_t)v21, v13);
    sub_22D62781C((uint64_t)v19, v33);
    OUTLINED_FUNCTION_5_9(v13);
    if (v27)
    {
      sub_22D61324C((uint64_t)v19, &qword_26857B6A8);
      sub_22D61324C((uint64_t)v21, &qword_26857B6A8);
      OUTLINED_FUNCTION_5_9(v33);
      if (v27)
      {
        sub_22D61324C(v13, &qword_26857B6A8);
        return 1;
      }
    }
    else
    {
      uint64_t v34 = v42;
      sub_22D62781C(v13, v42);
      OUTLINED_FUNCTION_5_9(v33);
      if (!v35)
      {
        uint64_t v36 = v43;
        uint64_t v37 = v41;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 32))(v41, v33, v4);
        sub_22D6A6990(&qword_26857E4F8, &qword_26857CB00);
        char v38 = sub_22D6CCE68();
        unint64_t v39 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
        v39(v37, v4);
        sub_22D61324C((uint64_t)v19, &qword_26857B6A8);
        sub_22D61324C((uint64_t)v21, &qword_26857B6A8);
        v39(v34, v4);
        sub_22D61324C(v13, &qword_26857B6A8);
        return (v38 & 1) != 0;
      }
      sub_22D61324C((uint64_t)v19, &qword_26857B6A8);
      sub_22D61324C((uint64_t)v21, &qword_26857B6A8);
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v34, v4);
    }
    sub_22D61324C(v13, &qword_26857E4F0);
    return 0;
  }
  return result;
}

uint64_t sub_22D6A5BAC()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6B0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6A8);
  MEMORY[0x270FA5388](v9 - 8);
  OUTLINED_FUNCTION_22_1();
  sub_22D6A6524(*v0);
  sub_22D6CCF58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22D6CCF58();
  swift_bridgeObjectRelease();
  uint64_t v10 = _s6ModuleVMa();
  sub_22D62781C((uint64_t)&v0[*(int *)(v10 + 24)], v1);
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1) {
    return sub_22D6CD648();
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v8, v1, v2);
  sub_22D6CD648();
  sub_22D6A6990(&qword_26857E500, qword_26857C7A0);
  sub_22D6CCE18();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
}

uint64_t sub_22D6A5D8C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_22D6CD5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
    if (v6 || (sub_22D6CD5A8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x736D657469 && a2 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_22D6CD5A8();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_22D6A5EBC()
{
  return 3;
}

uint64_t sub_22D6A5EC4()
{
  return 0;
}

uint64_t sub_22D6A5ED0(char a1)
{
  if (!a1) {
    return 25705;
  }
  if (a1 == 1) {
    return 0x656C746974;
  }
  return 0x736D657469;
}

uint64_t sub_22D6A5F14()
{
  return sub_22D6A5ED0(*v0);
}

uint64_t sub_22D6A5F1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22D6A5D8C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22D6A5F44()
{
  return sub_22D6A5EC4();
}

uint64_t sub_22D6A5F64@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22D6A5EBC();
  *a1 = result;
  return result;
}

uint64_t sub_22D6A5F8C(uint64_t a1)
{
  unint64_t v2 = sub_22D6A67E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22D6A5FC8(uint64_t a1)
{
  unint64_t v2 = sub_22D6A67E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22D6A6004(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E4D0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D6A67E0();
  sub_22D6CD688();
  sub_22D6A6944();
  sub_22D6CD558();
  if (!v1)
  {
    sub_22D6CD548();
    _s6ModuleVMa();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6B0);
    sub_22D6A6990(&qword_26857E4E0, &qword_26857E4E8);
    sub_22D6CD538();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_22D6A61D8()
{
  return sub_22D6CD668();
}

uint64_t sub_22D6A6218@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6A8);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E4B0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = _s6ModuleVMa();
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_22_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D6A67E0();
  sub_22D6CD678();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_22D6A682C();
  sub_22D6CD528();
  *(unsigned char *)uint64_t v3 = v17;
  *(void *)(v3 + 8) = sub_22D6CD518();
  *(void *)(v3 + 16) = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6B0);
  sub_22D6A6990(&qword_26857E4C8, &qword_26857D0F8);
  sub_22D6CD508();
  uint64_t v13 = OUTLINED_FUNCTION_2_13();
  v14(v13);
  sub_22D6A6878(v8, v3 + *(int *)(v10 + 24));
  sub_22D6A68E0(v3, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_22D667B44(v3);
}

uint64_t sub_22D6A64D8()
{
  unint64_t v0 = sub_22D6CD4F8();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

unint64_t sub_22D6A6524(char a1)
{
  unint64_t result = 0x6574736567677573;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0x796C746E65636572;
      break;
    case 3:
      unint64_t result = 0x79616C706572;
      break;
    case 4:
      unint64_t result = 0x6575657571;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22D6A65E0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22D6A6218(a1, a2);
}

uint64_t sub_22D6A65F8(void *a1)
{
  return sub_22D6A6004(a1);
}

uint64_t sub_22D6A661C()
{
  return sub_22D6CD668();
}

void sub_22D6A6658(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_22D6A6664@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22D6A64D8();
  *a1 = result;
  return result;
}

unint64_t sub_22D6A6694@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_22D6A6524(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22D6A66C0()
{
  return sub_22D6CD008();
}

uint64_t sub_22D6A6720()
{
  return sub_22D6CCFF8();
}

uint64_t sub_22D6A6770(unsigned __int8 *a1, char *a2)
{
  return sub_22D679B94(*a1, *a2);
}

uint64_t sub_22D6A677C()
{
  return sub_22D67A114(*v0);
}

uint64_t sub_22D6A6784(uint64_t a1)
{
  return sub_22D67A1DC(a1, *v1);
}

uint64_t sub_22D6A678C(uint64_t a1)
{
  return sub_22D67A394(a1, *v1);
}

uint64_t sub_22D6A6798()
{
  return sub_22D6A6A24(&qword_26857E4A8, (void (*)(uint64_t))_s6ModuleVMa);
}

unint64_t sub_22D6A67E0()
{
  unint64_t result = qword_26857E4B8;
  if (!qword_26857E4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E4B8);
  }
  return result;
}

unint64_t sub_22D6A682C()
{
  unint64_t result = qword_26857E4C0;
  if (!qword_26857E4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E4C0);
  }
  return result;
}

uint64_t sub_22D6A6878(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B6A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D6A68E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s6ModuleVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_22D6A6944()
{
  unint64_t result = qword_26857E4D8;
  if (!qword_26857E4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E4D8);
  }
  return result;
}

uint64_t sub_22D6A6990(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857B6B0);
    sub_22D6A6A24(a2, MEMORY[0x263F13B48]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22D6A6A24(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *_s6ModuleV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22D6A6B38);
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

ValueMetadata *_s6ModuleV10CodingKeysOMa()
{
  return &_s6ModuleV10CodingKeysON;
}

unint64_t sub_22D6A6B74()
{
  unint64_t result = qword_26857E508;
  if (!qword_26857E508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E508);
  }
  return result;
}

unint64_t sub_22D6A6BC4()
{
  unint64_t result = qword_26857E510;
  if (!qword_26857E510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E510);
  }
  return result;
}

unint64_t sub_22D6A6C14()
{
  unint64_t result = qword_26857E518[0];
  if (!qword_26857E518[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26857E518);
  }
  return result;
}

uint64_t sub_22D6A6C60()
{
  uint64_t v0 = sub_22D6CAD08();
  __swift_allocate_value_buffer(v0, qword_268585250);
  __swift_project_value_buffer(v0, (uint64_t)qword_268585250);
  return sub_22D6CACF8();
}

uint64_t sub_22D6A6CD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unsigned __int8 *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v46 = a6;
  uint64_t v47 = a8;
  uint64_t v43 = a3;
  uint64_t v44 = a4;
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  sub_22D6CC4B8();
  sub_22D6CD328();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v14);
  uint64_t v48 = a7;
  uint64_t v49 = a9;
  uint64_t v50 = a10;
  uint64_t v51 = a11;
  uint64_t v52 = a12;
  uint64_t v15 = (int *)_s25LibrarySectionContentViewVMa();
  OUTLINED_FUNCTION_0_0();
  uint64_t v45 = v16;
  OUTLINED_FUNCTION_1();
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = &v39[-v19];
  int v40 = *a5;
  unint64_t v21 = (uint64_t *)&v39[*(int *)(v18 + 76) - v19];
  _s9ViewModelCMa();
  swift_getWitnessTable();
  *unint64_t v21 = sub_22D6CB198();
  v21[1] = v22;
  unint64_t v23 = &v20[v15[20]];
  *(void *)unint64_t v23 = swift_getKeyPath();
  v23[40] = 0;
  uint64_t v24 = (uint64_t *)&v20[v15[21]];
  *uint64_t v24 = sub_22D6A7020();
  v24[1] = v25;
  v24[2] = v26;
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_16_5();
  uint64_t v27 = v15[26];
  if (qword_26857AD80 != -1) {
    swift_once();
  }
  char v28 = (uint64_t *)&v20[v27];
  *char v28 = sub_22D6CA058();
  v28[1] = v29;
  BOOL v30 = &v20[v15[27]];
  *BOOL v30 = xmmword_22D6D3AF0;
  v30[1] = xmmword_22D6D3B00;
  uint64_t v31 = v42;
  *(void *)uint64_t v20 = v41;
  *((void *)v20 + 1) = v31;
  uint64_t v32 = v44;
  *((void *)v20 + 2) = v43;
  *((void *)v20 + 3) = v32;
  char v33 = v40;
  v20[32] = v40;
  v20[40] = 1;
  *((void *)v20 + 6) = 0;
  *((void *)v20 + 7) = 0;
  *((void *)v20 + 8) = 0x8000000000000000;
  sub_22D6CC5A8();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_35_1();
  v34();
  uint64_t v35 = swift_allocObject();
  *(unsigned char *)(v35 + 16) = v33;
  *(unsigned char *)(v35 + 24) = 1;
  *(void *)(v35 + 32) = 0;
  *(void *)(v35 + 40) = 0;
  *(void *)(v35 + 48) = 0x8000000000000000;
  *(void *)&v20[v15[24]] = v35;
  uint64_t v36 = &v20[v15[25]];
  *uint64_t v36 = 1;
  *((void *)v36 + 1) = 0;
  *((void *)v36 + 2) = 0;
  *((void *)v36 + 3) = v35;
  OUTLINED_FUNCTION_35_1();
  v37();
  return swift_retain();
}

uint64_t _s25LibrarySectionContentViewVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D6A7020()
{
  sub_22D6CC018();
  return v1;
}

uint64_t sub_22D6A705C(uint64_t a1)
{
  sub_22D6CC4B8();
  uint64_t v2 = sub_22D6CD328();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v10 - v6, a1, v2);
  sub_22D6CC018();
  uint64_t v7 = OUTLINED_FUNCTION_102();
  return v8(v7);
}

uint64_t sub_22D6A7134()
{
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_22D6A7174()
{
  uint64_t result = sub_22D6CC5A8();
  if (v1 <= 0x3F)
  {
    sub_22D6CC4B8();
    sub_22D6CD328();
    uint64_t result = sub_22D6CC058();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_22D6A72D0(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *(void *)a1 = *a2;
    a1 = v26 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    unint64_t v10 = a2[8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_22D5DB288(v10);
    *(void *)(a1 + 64) = v10;
    uint64_t v11 = a3[18];
    uint64_t v12 = a1 + v11;
    uint64_t v13 = (uint64_t)a2 + v11;
    uint64_t v14 = sub_22D6CC5A8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    uint64_t v15 = a3[19];
    uint64_t v16 = a3[20];
    uint64_t v17 = (void *)(a1 + v15);
    uint64_t v18 = (uint64_t *)((char *)a2 + v15);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    *uint64_t v17 = v19;
    v17[1] = v20;
    uint64_t v21 = a1 + v16;
    uint64_t v22 = (uint64_t)a2 + v16;
    char v23 = *((unsigned char *)a2 + v16 + 40);
    swift_retain();
    if (v23)
    {
      uint64_t v24 = *(void *)(v22 + 24);
      if (v24)
      {
        uint64_t v25 = *(void *)(v22 + 32);
        *(void *)(v21 + 24) = v24;
        *(void *)(v21 + 32) = v25;
        (**(void (***)(uint64_t, uint64_t))(v24 - 8))(v21, v22);
      }
      else
      {
        long long v27 = *(_OWORD *)(v22 + 16);
        *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
        *(_OWORD *)(v21 + 16) = v27;
        *(void *)(v21 + 32) = *(void *)(v22 + 32);
      }
      *(unsigned char *)(v21 + 40) = 1;
    }
    else
    {
      *(void *)uint64_t v21 = *(void *)v22;
      *(unsigned char *)(v21 + 40) = 0;
      swift_retain();
    }
    uint64_t v28 = a3[21];
    uint64_t v29 = a3[22];
    BOOL v30 = (void *)(a1 + v28);
    uint64_t v31 = (uint64_t *)((char *)a2 + v28);
    uint64_t v32 = v31[1];
    *BOOL v30 = *v31;
    v30[1] = v32;
    v30[2] = v31[2];
    char v33 = (char *)(a1 + v29);
    uint64_t v34 = (char *)a2 + v29;
    uint64_t v35 = sub_22D6CC4B8();
    swift_bridgeObjectRetain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35))
    {
      uint64_t v36 = sub_22D6CD328();
      memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
      __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
    }
    uint64_t v37 = sub_22D6CD328();
    uint64_t v38 = sub_22D6CC058();
    *(void *)&v33[*(int *)(v38 + 28)] = *(void *)&v34[*(int *)(v38 + 28)];
    uint64_t v39 = a3[23];
    int v40 = (char *)(a1 + v39);
    uint64_t v41 = (char *)a2 + v39;
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v41, 1, v35))
    {
      memcpy(v40, v41, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v40, v41, v35);
      __swift_storeEnumTagSinglePayload((uint64_t)v40, 0, 1, v35);
    }
    *(void *)&v40[*(int *)(v38 + 28)] = *(void *)&v41[*(int *)(v38 + 28)];
    uint64_t v42 = a3[24];
    unint64_t v43 = *(uint64_t *)((char *)a2 + v42);
    swift_retain();
    sub_22D5DB288(v43);
    *(void *)(a1 + v42) = v43;
    uint64_t v44 = a3[25];
    uint64_t v45 = a1 + v44;
    uint64_t v46 = (uint64_t)a2 + v44;
    *(unsigned char *)uint64_t v45 = *(unsigned char *)v46;
    uint64_t v47 = *(void *)(v46 + 16);
    *(void *)(v45 + 8) = *(void *)(v46 + 8);
    *(void *)(v45 + 16) = v47;
    unint64_t v48 = *(void *)(v46 + 24);
    swift_bridgeObjectRetain();
    sub_22D5DB288(v48);
    *(void *)(v45 + 24) = v48;
    uint64_t v49 = a3[26];
    uint64_t v50 = a3[27];
    uint64_t v51 = (void *)(a1 + v49);
    uint64_t v52 = (uint64_t *)((char *)a2 + v49);
    uint64_t v53 = v52[1];
    *uint64_t v51 = *v52;
    v51[1] = v53;
    uint64_t v54 = (_OWORD *)(a1 + v50);
    long long v55 = (_OWORD *)((char *)a2 + v50);
    long long v56 = v55[1];
    *uint64_t v54 = *v55;
    v54[1] = v56;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_22D6A76B4(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(a1 + 64));
  uint64_t v4 = a1 + a2[18];
  uint64_t v5 = sub_22D6CC5A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  uint64_t v6 = a1 + a2[20];
  if (*(unsigned char *)(v6 + 40))
  {
    if (*(void *)(v6 + 24)) {
      __swift_destroy_boxed_opaque_existential_1(v6);
    }
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v7 = a1 + a2[22];
  uint64_t v8 = sub_22D6CC4B8();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  sub_22D6CD328();
  sub_22D6CC058();
  swift_release();
  uint64_t v9 = a1 + a2[23];
  if (!__swift_getEnumTagSinglePayload(v9, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v9, v8);
  }
  swift_release();
  sub_22D5DB9FC(*(void *)(a1 + a2[24]));
  uint64_t v10 = a1 + a2[25];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v10 + 24));
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D6A78C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  unint64_t v9 = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22D5DB288(v9);
  *(void *)(a1 + 64) = v9;
  uint64_t v10 = a3[18];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_22D6CC5A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  uint64_t v14 = a3[19];
  uint64_t v15 = a3[20];
  uint64_t v16 = (void *)(a1 + v14);
  uint64_t v17 = (uint64_t *)(a2 + v14);
  uint64_t v18 = *v17;
  uint64_t v19 = v17[1];
  *uint64_t v16 = v18;
  v16[1] = v19;
  uint64_t v20 = a1 + v15;
  uint64_t v21 = a2 + v15;
  char v22 = *(unsigned char *)(a2 + v15 + 40);
  swift_retain();
  if (v22)
  {
    uint64_t v23 = *(void *)(v21 + 24);
    if (v23)
    {
      uint64_t v24 = *(void *)(v21 + 32);
      *(void *)(v20 + 24) = v23;
      *(void *)(v20 + 32) = v24;
      (**(void (***)(uint64_t, uint64_t))(v23 - 8))(v20, v21);
    }
    else
    {
      long long v25 = *(_OWORD *)(v21 + 16);
      *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
      *(_OWORD *)(v20 + 16) = v25;
      *(void *)(v20 + 32) = *(void *)(v21 + 32);
    }
    *(unsigned char *)(v20 + 40) = 1;
  }
  else
  {
    *(void *)uint64_t v20 = *(void *)v21;
    *(unsigned char *)(v20 + 40) = 0;
    swift_retain();
  }
  uint64_t v26 = a3[21];
  uint64_t v27 = a3[22];
  uint64_t v28 = (void *)(a1 + v26);
  uint64_t v29 = (void *)(a2 + v26);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  v28[2] = v29[2];
  uint64_t v31 = (char *)(a1 + v27);
  uint64_t v32 = (char *)(a2 + v27);
  uint64_t v33 = sub_22D6CC4B8();
  swift_bridgeObjectRetain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v32, 1, v33))
  {
    uint64_t v34 = sub_22D6CD328();
    memcpy(v31, v32, *(void *)(*(void *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
    __swift_storeEnumTagSinglePayload((uint64_t)v31, 0, 1, v33);
  }
  uint64_t v35 = sub_22D6CD328();
  uint64_t v36 = sub_22D6CC058();
  *(void *)&v31[*(int *)(v36 + 28)] = *(void *)&v32[*(int *)(v36 + 28)];
  uint64_t v37 = a3[23];
  uint64_t v38 = (char *)(a1 + v37);
  uint64_t v39 = (char *)(a2 + v37);
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v39, 1, v33))
  {
    memcpy(v38, v39, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v38, v39, v33);
    __swift_storeEnumTagSinglePayload((uint64_t)v38, 0, 1, v33);
  }
  *(void *)&v38[*(int *)(v36 + 28)] = *(void *)&v39[*(int *)(v36 + 28)];
  uint64_t v40 = a3[24];
  unint64_t v41 = *(void *)(a2 + v40);
  swift_retain();
  sub_22D5DB288(v41);
  *(void *)(a1 + v40) = v41;
  uint64_t v42 = a3[25];
  uint64_t v43 = a1 + v42;
  uint64_t v44 = a2 + v42;
  *(unsigned char *)uint64_t v43 = *(unsigned char *)v44;
  uint64_t v45 = *(void *)(v44 + 16);
  *(void *)(v43 + 8) = *(void *)(v44 + 8);
  *(void *)(v43 + 16) = v45;
  unint64_t v46 = *(void *)(v44 + 24);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v46);
  *(void *)(v43 + 24) = v46;
  uint64_t v47 = a3[26];
  uint64_t v48 = a3[27];
  uint64_t v49 = (void *)(a1 + v47);
  uint64_t v50 = (void *)(a2 + v47);
  uint64_t v51 = v50[1];
  *uint64_t v49 = *v50;
  v49[1] = v51;
  uint64_t v52 = (_OWORD *)(a1 + v48);
  uint64_t v53 = (_OWORD *)(a2 + v48);
  long long v54 = v53[1];
  *uint64_t v52 = *v53;
  v52[1] = v54;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22D6A7C58(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void *)(a2 + 64);
  sub_22D5DB288(v6);
  unint64_t v7 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = v6;
  sub_22D5DB9FC(v7);
  uint64_t v8 = a3[18];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_22D6CC5A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = a3[19];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  swift_retain();
  swift_release();
  *(void *)(v13 + 8) = *(void *)(v14 + 8);
  if (a1 != a2)
  {
    uint64_t v15 = a3[20];
    uint64_t v16 = a1 + v15;
    uint64_t v17 = (long long *)(a2 + v15);
    sub_22D5DD960(a1 + v15, qword_26857AE68);
    if (*((unsigned char *)v17 + 40))
    {
      uint64_t v18 = *((void *)v17 + 3);
      if (v18)
      {
        *(void *)(v16 + 24) = v18;
        *(void *)(v16 + 32) = *((void *)v17 + 4);
        (**(void (***)(uint64_t, long long *))(v18 - 8))(v16, v17);
      }
      else
      {
        long long v19 = *v17;
        long long v20 = v17[1];
        *(void *)(v16 + 32) = *((void *)v17 + 4);
        *(_OWORD *)uint64_t v16 = v19;
        *(_OWORD *)(v16 + 16) = v20;
      }
      *(unsigned char *)(v16 + 40) = 1;
    }
    else
    {
      *(void *)uint64_t v16 = *(void *)v17;
      *(unsigned char *)(v16 + 40) = 0;
      swift_retain();
    }
  }
  uint64_t v21 = a3[21];
  char v22 = (void *)(a1 + v21);
  uint64_t v23 = a2 + v21;
  *char v22 = *(void *)(a2 + v21);
  v22[1] = *(void *)(a2 + v21 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v22[2] = *(void *)(v23 + 16);
  swift_retain();
  swift_release();
  uint64_t v24 = a3[22];
  long long v25 = (char *)(a1 + v24);
  uint64_t v26 = (char *)(a2 + v24);
  uint64_t v27 = sub_22D6CC4B8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v25, 1, v27);
  int v29 = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27);
  if (EnumTagSinglePayload)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
      __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v30 = *(void *)(v27 - 8);
  if (v29)
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v25, v27);
LABEL_13:
    uint64_t v31 = sub_22D6CD328();
    memcpy(v25, v26, *(void *)(*(void *)(v31 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v30 + 24))(v25, v26, v27);
LABEL_14:
  uint64_t v32 = sub_22D6CD328();
  uint64_t v33 = sub_22D6CC058();
  *(void *)&v25[*(int *)(v33 + 28)] = *(void *)&v26[*(int *)(v33 + 28)];
  swift_retain();
  swift_release();
  uint64_t v34 = a3[23];
  uint64_t v35 = (char *)(a1 + v34);
  uint64_t v36 = (char *)(a2 + v34);
  int v37 = __swift_getEnumTagSinglePayload(a1 + v34, 1, v27);
  int v38 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v27);
  if (!v37)
  {
    uint64_t v39 = *(void *)(v27 - 8);
    if (!v38)
    {
      (*(void (**)(char *, char *, uint64_t))(v39 + 24))(v35, v36, v27);
      goto LABEL_20;
    }
    (*(void (**)(char *, uint64_t))(v39 + 8))(v35, v27);
    goto LABEL_19;
  }
  if (v38)
  {
LABEL_19:
    memcpy(v35, v36, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v35, v36, v27);
  __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v27);
LABEL_20:
  *(void *)&v35[*(int *)(v33 + 28)] = *(void *)&v36[*(int *)(v33 + 28)];
  swift_retain();
  swift_release();
  uint64_t v40 = a3[24];
  unint64_t v41 = *(void *)(a2 + v40);
  sub_22D5DB288(v41);
  unint64_t v42 = *(void *)(a1 + v40);
  *(void *)(a1 + v40) = v41;
  sub_22D5DB9FC(v42);
  uint64_t v43 = a3[25];
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  *(unsigned char *)uint64_t v44 = *(unsigned char *)(a2 + v43);
  *(void *)(v44 + 8) = *(void *)(a2 + v43 + 8);
  *(void *)(v44 + 16) = *(void *)(a2 + v43 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v46 = *(void *)(v45 + 24);
  sub_22D5DB288(v46);
  unint64_t v47 = *(void *)(v44 + 24);
  *(void *)(v44 + 24) = v46;
  sub_22D5DB9FC(v47);
  uint64_t v48 = a3[26];
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (void *)(a2 + v48);
  *uint64_t v49 = *v50;
  v49[1] = v50[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v51 = a3[27];
  uint64_t v52 = (void *)(a1 + v51);
  uint64_t v53 = (void *)(a2 + v51);
  *uint64_t v52 = *v53;
  v52[1] = v53[1];
  v52[2] = v53[2];
  v52[3] = v53[3];
  return a1;
}

uint64_t sub_22D6A81E4(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v7 = a3[18];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22D6CC5A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[20];
  *(_OWORD *)(a1 + a3[19]) = *(_OWORD *)(a2 + a3[19]);
  uint64_t v12 = (_OWORD *)(a1 + v11);
  uint64_t v13 = (_OWORD *)(a2 + v11);
  *(_OWORD *)((char *)v12 + 25) = *(_OWORD *)((char *)v13 + 25);
  long long v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[21];
  uint64_t v16 = a3[22];
  uint64_t v17 = a1 + v15;
  uint64_t v18 = (long long *)(a2 + v15);
  long long v19 = *v18;
  *(void *)(v17 + 16) = *((void *)v18 + 2);
  *(_OWORD *)uint64_t v17 = v19;
  long long v20 = (char *)(a1 + v16);
  uint64_t v21 = (char *)(a2 + v16);
  uint64_t v22 = sub_22D6CC4B8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v22))
  {
    uint64_t v23 = sub_22D6CD328();
    memcpy(v20, v21, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
    __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v22);
  }
  uint64_t v24 = sub_22D6CD328();
  uint64_t v25 = sub_22D6CC058();
  *(void *)&v20[*(int *)(v25 + 28)] = *(void *)&v21[*(int *)(v25 + 28)];
  uint64_t v26 = a3[23];
  uint64_t v27 = (char *)(a1 + v26);
  uint64_t v28 = (char *)(a2 + v26);
  if (__swift_getEnumTagSinglePayload(a2 + v26, 1, v22))
  {
    memcpy(v27, v28, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v27, v28, v22);
    __swift_storeEnumTagSinglePayload((uint64_t)v27, 0, 1, v22);
  }
  *(void *)&v27[*(int *)(v25 + 28)] = *(void *)&v28[*(int *)(v25 + 28)];
  uint64_t v29 = a3[25];
  *(void *)(a1 + a3[24]) = *(void *)(a2 + a3[24]);
  uint64_t v30 = (_OWORD *)(a1 + v29);
  uint64_t v31 = (_OWORD *)(a2 + v29);
  long long v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  uint64_t v33 = a3[27];
  *(_OWORD *)(a1 + a3[26]) = *(_OWORD *)(a2 + a3[26]);
  uint64_t v34 = (_OWORD *)(a1 + v33);
  uint64_t v35 = (_OWORD *)(a2 + v33);
  long long v36 = v35[1];
  *uint64_t v34 = *v35;
  v34[1] = v36;
  return a1;
}

uint64_t sub_22D6A8484(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  unint64_t v9 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  sub_22D5DB9FC(v9);
  uint64_t v10 = a3[18];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_22D6CC5A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[19];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  swift_release();
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  if (a1 != a2)
  {
    uint64_t v17 = a3[20];
    uint64_t v18 = (_OWORD *)(a2 + v17);
    long long v19 = (_OWORD *)(a1 + v17);
    sub_22D5DD960(a1 + v17, qword_26857AE68);
    long long v20 = v18[1];
    _OWORD *v19 = *v18;
    v19[1] = v20;
    *(_OWORD *)((char *)v19 + 25) = *(_OWORD *)((char *)v18 + 25);
  }
  uint64_t v21 = a3[21];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = a2 + v21;
  uint64_t v24 = *(void *)(a2 + v21 + 8);
  *uint64_t v22 = *(void *)(a2 + v21);
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v22[2] = *(void *)(v23 + 16);
  swift_release();
  uint64_t v25 = a3[22];
  uint64_t v26 = (char *)(a1 + v25);
  uint64_t v27 = (char *)(a2 + v25);
  uint64_t v28 = sub_22D6CC4B8();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, v28);
  int v30 = __swift_getEnumTagSinglePayload((uint64_t)v27, 1, v28);
  if (EnumTagSinglePayload)
  {
    if (!v30)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
      __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v28);
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v31 = *(void *)(v28 - 8);
  if (v30)
  {
    (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v28);
LABEL_8:
    uint64_t v32 = sub_22D6CD328();
    memcpy(v26, v27, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_9;
  }
  (*(void (**)(char *, char *, uint64_t))(v31 + 40))(v26, v27, v28);
LABEL_9:
  uint64_t v33 = sub_22D6CD328();
  uint64_t v34 = sub_22D6CC058();
  *(void *)&v26[*(int *)(v34 + 28)] = *(void *)&v27[*(int *)(v34 + 28)];
  swift_release();
  uint64_t v35 = a3[23];
  long long v36 = (char *)(a1 + v35);
  int v37 = (char *)(a2 + v35);
  int v38 = __swift_getEnumTagSinglePayload(a1 + v35, 1, v28);
  int v39 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v28);
  if (!v38)
  {
    uint64_t v40 = *(void *)(v28 - 8);
    if (!v39)
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 40))(v36, v37, v28);
      goto LABEL_15;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v36, v28);
    goto LABEL_14;
  }
  if (v39)
  {
LABEL_14:
    memcpy(v36, v37, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_15;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v36, v37, v28);
  __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v28);
LABEL_15:
  *(void *)&v36[*(int *)(v34 + 28)] = *(void *)&v37[*(int *)(v34 + 28)];
  swift_release();
  uint64_t v41 = a3[24];
  unint64_t v42 = *(void *)(a1 + v41);
  *(void *)(a1 + v41) = *(void *)(a2 + v41);
  sub_22D5DB9FC(v42);
  uint64_t v43 = a3[25];
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  *(unsigned char *)uint64_t v44 = *(unsigned char *)(a2 + v43);
  uint64_t v46 = *(void *)(a2 + v43 + 16);
  *(void *)(v44 + 8) = *(void *)(a2 + v43 + 8);
  *(void *)(v44 + 16) = v46;
  swift_bridgeObjectRelease();
  unint64_t v47 = *(void *)(v44 + 24);
  *(void *)(v44 + 24) = *(void *)(v45 + 24);
  sub_22D5DB9FC(v47);
  uint64_t v48 = a3[26];
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (uint64_t *)(a2 + v48);
  uint64_t v52 = *v50;
  uint64_t v51 = v50[1];
  *uint64_t v49 = v52;
  v49[1] = v51;
  swift_bridgeObjectRelease();
  uint64_t v53 = a3[27];
  long long v54 = (_OWORD *)(a1 + v53);
  long long v55 = (_OWORD *)(a2 + v53);
  long long v56 = v55[1];
  *long long v54 = *v55;
  v54[1] = v56;
  return a1;
}

uint64_t sub_22D6A88F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D6A8908);
}

uint64_t sub_22D6A8908(uint64_t a1, uint64_t a2, uint64_t a3)
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
    OUTLINED_FUNCTION_35_2();
    sub_22D6CC5A8();
    OUTLINED_FUNCTION_3();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 72);
    }
    else
    {
      sub_22D6CC4B8();
      sub_22D6CD328();
      uint64_t v10 = OUTLINED_FUNCTION_25_5();
      uint64_t v11 = *(int *)(a3 + 88);
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t sub_22D6A89E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D6A89F8);
}

uint64_t sub_22D6A89F8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    OUTLINED_FUNCTION_35_2();
    sub_22D6CC5A8();
    OUTLINED_FUNCTION_3();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 72);
    }
    else
    {
      sub_22D6CC4B8();
      sub_22D6CD328();
      uint64_t v10 = OUTLINED_FUNCTION_25_5();
      uint64_t v11 = *(int *)(a4 + 88);
    }
    return __swift_storeEnumTagSinglePayload(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_22D6A8AD0()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_22D6A8B1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  return v1 == sub_22D6CA2E8();
}

uint64_t sub_22D6A8B4C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v227 = a2;
  sub_22D6CB348();
  OUTLINED_FUNCTION_0_0();
  uint64_t v225 = v4;
  uint64_t v226 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_0_3();
  uint64_t v224 = v5;
  OUTLINED_FUNCTION_0_0();
  uint64_t v238 = v6;
  uint64_t v223 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v8);
  v233 = (char *)v170 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D6CB868();
  OUTLINED_FUNCTION_0_0();
  uint64_t v221 = v11;
  v222 = (void (*)(char *, uint64_t *, void *))v10;
  MEMORY[0x270FA5388]((void (*)(char *, uint64_t *, void *))v10);
  OUTLINED_FUNCTION_0_3();
  uint64_t v220 = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857C640);
  MEMORY[0x270FA5388](v13 - 8);
  OUTLINED_FUNCTION_0_3();
  v219 = v14;
  sub_22D6CB5B8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v215 = v16;
  uint64_t v216 = v15;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_0_3();
  uint64_t v214 = v17;
  sub_22D6CB5C8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v217 = v19;
  uint64_t v218 = v18;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_0_3();
  uint64_t v213 = v20;
  uint64_t v21 = a1[2];
  uint64_t v231 = a1[4];
  uint64_t v22 = sub_22D6CC4B8();
  uint64_t v234 = a1[5];
  uint64_t v23 = v234;
  OUTLINED_FUNCTION_9_2();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v237 = a1;
  uint64_t v25 = a1[3];
  unint64_t v26 = a1[6];
  uint64_t v257 = v21;
  uint64_t v258 = v25;
  uint64_t v232 = v21;
  uint64_t v27 = v25;
  uint64_t v259 = v23;
  unint64_t v260 = v26;
  unint64_t v28 = v26;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  swift_getTupleTypeMetadata2();
  uint64_t v29 = sub_22D6CC2C8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v257 = v22;
  uint64_t v258 = AssociatedTypeWitness;
  uint64_t v259 = v29;
  unint64_t v260 = WitnessTable;
  uint64_t v261 = AssociatedConformanceWitness;
  sub_22D6CC1A8();
  sub_22D6CD328();
  uint64_t v270 = swift_getWitnessTable();
  uint64_t v269 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6CADD8();
  uint64_t v32 = v27;
  _s50BottomNavigationPromptAvoidancePaddingViewModifierVMa();
  OUTLINED_FUNCTION_33_3();
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v34 = swift_getWitnessTable();
  uint64_t v267 = v33;
  uint64_t v268 = v34;
  uint64_t v230 = MEMORY[0x263F18E48];
  swift_getWitnessTable();
  OUTLINED_FUNCTION_9_2();
  sub_22D6CADE8();
  _s27DismissAlertTriggerModifierVMa();
  OUTLINED_FUNCTION_33_3();
  uint64_t v35 = swift_getWitnessTable();
  uint64_t v36 = swift_getWitnessTable();
  uint64_t v265 = v35;
  uint64_t v266 = v36;
  OUTLINED_FUNCTION_32_3();
  swift_getWitnessTable();
  OUTLINED_FUNCTION_9_2();
  uint64_t v37 = sub_22D6CAFD8();
  uint64_t v38 = swift_getWitnessTable();
  unint64_t v39 = sub_22D604560();
  uint64_t v257 = v37;
  uint64_t v258 = MEMORY[0x263F8D310];
  v170[8] = v37;
  uint64_t v259 = v38;
  unint64_t v260 = v39;
  uint64_t v176 = v38;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v195 = v40;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_10();
  uint64_t v190 = v42;
  uint64_t v235 = v32;
  unint64_t v236 = v28;
  _s18NavigationBarStyleVMa();
  OUTLINED_FUNCTION_35_2();
  uint64_t v43 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v198 = v44;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_10();
  uint64_t v187 = v46;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857AF60);
  uint64_t done = _s10DoneButtonVMa();
  uint64_t v257 = v37;
  uint64_t v258 = MEMORY[0x263F8D310];
  uint64_t v259 = v38;
  unint64_t v49 = v39;
  unint64_t v260 = v39;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v173 = OpaqueTypeConformance2;
  uint64_t v51 = swift_getWitnessTable();
  uint64_t v263 = OpaqueTypeConformance2;
  uint64_t v264 = v51;
  uint64_t v52 = swift_getWitnessTable();
  uint64_t v53 = sub_22D5DCE80(&qword_26857AF70, &qword_26857AF60);
  uint64_t v54 = swift_getWitnessTable();
  uint64_t v257 = v43;
  uint64_t v258 = v47;
  v170[1] = done;
  v170[2] = v43;
  v170[5] = v52;
  v170[6] = v47;
  uint64_t v259 = done;
  unint64_t v260 = v52;
  uint64_t v261 = v53;
  uint64_t v262 = v54;
  uint64_t v55 = v53;
  v170[3] = v54;
  v170[4] = v53;
  uint64_t v56 = v54;
  uint64_t v57 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v200 = v58;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v59);
  OUTLINED_FUNCTION_10();
  v170[7] = v60;
  uint64_t v257 = v43;
  uint64_t v258 = v47;
  uint64_t v259 = done;
  unint64_t v260 = v52;
  uint64_t v261 = v55;
  uint64_t v262 = v56;
  uint64_t v61 = OUTLINED_FUNCTION_7_11();
  uint64_t v257 = v57;
  uint64_t v62 = v57;
  uint64_t v181 = v57;
  uint64_t v63 = MEMORY[0x263F8D310];
  uint64_t v258 = MEMORY[0x263F8D310];
  uint64_t v259 = v61;
  uint64_t v64 = v61;
  uint64_t v175 = v61;
  unint64_t v260 = v49;
  uint64_t v65 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v197 = v66;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v67);
  OUTLINED_FUNCTION_10();
  uint64_t v180 = v68;
  uint64_t v257 = v62;
  uint64_t v258 = v63;
  uint64_t v259 = v64;
  unint64_t v260 = v49;
  v170[0] = v49;
  uint64_t v69 = OUTLINED_FUNCTION_7_11();
  uint64_t v185 = v65;
  uint64_t v186 = v69;
  uint64_t v257 = v65;
  uint64_t v258 = v69;
  uint64_t v70 = v69;
  uint64_t v71 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v194 = v72;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v73);
  OUTLINED_FUNCTION_10();
  uint64_t v184 = v74;
  uint64_t v257 = v65;
  uint64_t v258 = v70;
  uint64_t v75 = OUTLINED_FUNCTION_7_11();
  uint64_t v178 = v71;
  uint64_t v179 = v75;
  uint64_t v257 = v71;
  uint64_t v258 = v75;
  uint64_t v76 = v75;
  uint64_t v77 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v191 = v78;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v79);
  OUTLINED_FUNCTION_10();
  uint64_t v177 = v80;
  uint64_t v257 = v71;
  uint64_t v258 = v76;
  uint64_t v81 = OUTLINED_FUNCTION_7_11();
  uint64_t v82 = v77;
  uint64_t v171 = v77;
  uint64_t v257 = v77;
  uint64_t v258 = v81;
  uint64_t v83 = v81;
  uint64_t v174 = v81;
  uint64_t v84 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v204 = v85;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v86);
  OUTLINED_FUNCTION_10();
  uint64_t v172 = v87;
  uint64_t v257 = v82;
  uint64_t v258 = v83;
  uint64_t v88 = OUTLINED_FUNCTION_7_11();
  uint64_t v257 = v84;
  uint64_t v258 = v63;
  uint64_t v89 = v84;
  uint64_t v183 = v84;
  uint64_t v259 = v88;
  unint64_t v260 = MEMORY[0x263F8D338];
  uint64_t v90 = v88;
  uint64_t v182 = v88;
  unint64_t v91 = MEMORY[0x263F8D338];
  uint64_t v92 = swift_getOpaqueTypeMetadata2();
  uint64_t v193 = v92;
  OUTLINED_FUNCTION_0_0();
  uint64_t v199 = v93;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v94);
  OUTLINED_FUNCTION_10();
  uint64_t v188 = v95;
  uint64_t v257 = v89;
  uint64_t v258 = v63;
  uint64_t v259 = v90;
  unint64_t v260 = v91;
  uint64_t v192 = OUTLINED_FUNCTION_7_11();
  uint64_t v257 = v92;
  uint64_t v258 = v192;
  uint64_t v201 = MEMORY[0x263F1B070];
  uint64_t v196 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v205 = v96;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v97);
  OUTLINED_FUNCTION_10();
  uint64_t v229 = v98;
  uint64_t v202 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v209 = v99;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v100);
  OUTLINED_FUNCTION_10();
  uint64_t v228 = v101;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857E5A0);
  uint64_t v207 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v211 = v102;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v103);
  OUTLINED_FUNCTION_10();
  uint64_t v203 = v104;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857B4B8);
  uint64_t v210 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v212 = v105;
  uint64_t v107 = MEMORY[0x270FA5388](v106);
  uint64_t v206 = (char *)v170 - ((v108 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v107);
  uint64_t v208 = (char *)v170 - v109;
  uint64_t v110 = v237;
  uint64_t v111 = v239;
  sub_22D6A9F2C(v237, (uint64_t)&v257);
  uint64_t v252 = v257;
  uint64_t v253 = v258;
  uint64_t v112 = v111[1];
  uint64_t v255 = *v111;
  uint64_t v256 = v112;
  swift_checkMetadataState();
  sub_22D6CBC78();
  swift_release();
  sub_22D69AD64(v235, OpaqueTypeMetadata2, v235, v173);
  OUTLINED_FUNCTION_22();
  v113();
  uint64_t v257 = sub_22D6CC238();
  uint64_t v258 = v114;
  uint64_t v252 = sub_22D63F070();
  uint64_t v253 = v115;
  swift_checkMetadataState();
  sub_22D6CBCC8();
  swift_release();
  OUTLINED_FUNCTION_22();
  v116();
  uint64_t v198 = (uint64_t *)((char *)v111 + *((int *)v110 + 21));
  uint64_t v117 = v198[1];
  uint64_t v118 = v198[2];
  uint64_t v252 = *v198;
  uint64_t v253 = v117;
  uint64_t v254 = v118;
  uint64_t v195 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5A8);
  sub_22D6CC048();
  sub_22D6CB5A8();
  sub_22D6CB588();
  OUTLINED_FUNCTION_22();
  v119();
  uint64_t v120 = (uint64_t *)((char *)v111 + *((int *)v110 + 26));
  uint64_t v121 = v120[1];
  uint64_t v257 = *v120;
  uint64_t v258 = v121;
  swift_bridgeObjectRetain();
  sub_22D6CBB78();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_22();
  v122();
  OUTLINED_FUNCTION_22();
  v123();
  uint64_t v124 = (uint64_t)v219;
  sub_22D6CB7C8();
  uint64_t v125 = sub_22D6CB7D8();
  __swift_storeEnumTagSinglePayload(v124, 0, 1, v125);
  sub_22D6CBD48();
  sub_22D5DD960(v124, &qword_26857C640);
  OUTLINED_FUNCTION_22();
  v126();
  sub_22D6CB858();
  sub_22D6CBD68();
  OUTLINED_FUNCTION_22();
  v127();
  OUTLINED_FUNCTION_22();
  v128();
  MEMORY[0x230F87C60](1, v171, v174);
  OUTLINED_FUNCTION_22();
  v129();
  uint64_t v130 = v198[1];
  uint64_t v131 = v198[2];
  uint64_t v257 = *v198;
  uint64_t v258 = v130;
  uint64_t v259 = v131;
  sub_22D6CC028();
  uint64_t v257 = v252;
  uint64_t v258 = v253;
  uint64_t v132 = v238;
  v222 = *(void (**)(char *, uint64_t *, void *))(v238 + 16);
  uint64_t v133 = v233;
  uint64_t v134 = v237;
  v222(v233, v239, v237);
  uint64_t v135 = *(unsigned __int8 *)(v132 + 80);
  v223 += (v135 + 56) & ~v135;
  uint64_t v136 = (v135 + 56) & ~v135;
  uint64_t v220 = v135 | 7;
  uint64_t v221 = v136;
  uint64_t v137 = (void *)swift_allocObject();
  uint64_t v138 = v235;
  v137[2] = v232;
  v137[3] = v138;
  uint64_t v139 = v234;
  v137[4] = v231;
  v137[5] = v139;
  v137[6] = v236;
  uint64_t v140 = *(void (**)(void, void, void))(v132 + 32);
  uint64_t v238 = v132 + 32;
  v219 = v140;
  v140((char *)v137 + v136, v133, v134);
  sub_22D5DADC8();
  sub_22D6CBE88();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22();
  v141();
  uint64_t v142 = v224;
  uint64_t v143 = v225;
  uint64_t v144 = v226;
  (*(void (**)(uint64_t, void, uint64_t))(v225 + 104))(v224, *MEMORY[0x263F19698], v226);
  uint64_t v146 = v192;
  uint64_t v145 = v193;
  sub_22D6CBD58();
  (*(void (**)(uint64_t, uint64_t))(v143 + 8))(v142, v144);
  OUTLINED_FUNCTION_32_3();
  OUTLINED_FUNCTION_22();
  v147();
  v222(v233, v239, v237);
  uint64_t v148 = (void *)swift_allocObject();
  uint64_t v149 = v232;
  v148[2] = v232;
  v148[3] = v138;
  uint64_t v150 = v231;
  uint64_t v151 = v234;
  v148[4] = v231;
  v148[5] = v151;
  unint64_t v152 = v236;
  v148[6] = v236;
  OUTLINED_FUNCTION_35_1();
  v153();
  uint64_t v257 = v145;
  uint64_t v258 = v146;
  uint64_t v154 = swift_getOpaqueTypeConformance2();
  sub_22D64D5E4((uint64_t)sub_22D6AF29C, (uint64_t)v148, v196, v154);
  swift_release();
  OUTLINED_FUNCTION_22();
  v155();
  sub_22D6CC238();
  uint64_t v240 = v149;
  uint64_t v241 = v235;
  uint64_t v242 = v150;
  uint64_t v243 = v151;
  unint64_t v244 = v152;
  v245 = v239;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5B0);
  unint64_t v156 = sub_22D5DCB30();
  uint64_t v250 = v154;
  unint64_t v251 = v156;
  uint64_t v157 = swift_getWitnessTable();
  sub_22D6AFF10(&qword_26857E5B8, &qword_26857E5B0, (void (*)(void))sub_22D6AF364);
  sub_22D6CBDF8();
  OUTLINED_FUNCTION_22();
  v158();
  uint64_t v159 = sub_22D5DCE80(&qword_26857E5E0, &qword_26857E5A0);
  uint64_t v248 = v157;
  uint64_t v249 = v159;
  uint64_t v160 = swift_getWitnessTable();
  uint64_t v161 = v206;
  sub_22D69A980();
  OUTLINED_FUNCTION_22();
  v162();
  uint64_t v163 = sub_22D5DCE80(&qword_26857B4C8, &qword_26857B4B8);
  uint64_t v246 = v160;
  uint64_t v247 = v163;
  uint64_t v164 = v210;
  swift_getWitnessTable();
  sub_22D6B8B10(v161, v164);
  uint64_t v165 = *(void (**)(char *, uint64_t))(v212 + 8);
  v165(v161, v164);
  uint64_t v166 = OUTLINED_FUNCTION_32_3();
  sub_22D6B8B10(v166, v167);
  uint64_t v168 = OUTLINED_FUNCTION_32_3();
  return ((uint64_t (*)(uint64_t))v165)(v168);
}

uint64_t sub_22D6A9F2C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = *(a1 - 1);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v3 + 16))((char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (char *)swift_allocObject();
  uint64_t v8 = a1[2];
  uint64_t v7 = a1[3];
  *((void *)v6 + 2) = v8;
  *((void *)v6 + 3) = v7;
  uint64_t v9 = a1[5];
  *((void *)v6 + 4) = a1[4];
  *((void *)v6 + 5) = v9;
  uint64_t v10 = a1[6];
  *((void *)v6 + 6) = v10;
  (*(void (**)(char *, char *, void *))(v3 + 32))(&v6[v5], (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v11 = sub_22D6CC4B8();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v32 = v8;
  uint64_t v33 = v7;
  uint64_t v34 = v9;
  uint64_t v35 = v10;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  swift_getTupleTypeMetadata2();
  uint64_t v13 = sub_22D6CC2C8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v32 = v11;
  uint64_t v33 = AssociatedTypeWitness;
  uint64_t v34 = v13;
  uint64_t v35 = WitnessTable;
  uint64_t v36 = AssociatedConformanceWitness;
  sub_22D6CC1A8();
  sub_22D6CD328();
  uint64_t v31 = swift_getWitnessTable();
  uint64_t v30 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6CADD8();
  _s50BottomNavigationPromptAvoidancePaddingViewModifierVMa();
  sub_22D6CB088();
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v28 = v16;
  uint64_t v29 = v17;
  swift_getWitnessTable();
  sub_22D6CADE8();
  _s27DismissAlertTriggerModifierVMa();
  sub_22D6CB088();
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v26 = v18;
  uint64_t v27 = v19;
  swift_getWitnessTable();
  uint64_t v24 = sub_22D6CAFC8();
  uint64_t v25 = v20;
  uint64_t v21 = sub_22D6CAFD8();
  swift_getWitnessTable();
  sub_22D6B8B10(&v24, v21);
  swift_release();
  uint64_t v24 = v32;
  uint64_t v25 = v33;
  sub_22D6B8B10(&v24, v21);
  return swift_release();
}

uint64_t sub_22D6AA3AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)&long long v47 = a2;
  *((void *)&v47 + 1) = a3;
  uint64_t v41 = a3;
  uint64_t v48 = a4;
  uint64_t v49 = a5;
  uint64_t v43 = a5;
  uint64_t v44 = a6;
  uint64_t v50 = a6;
  uint64_t v9 = _s25LibrarySectionContentViewVMa();
  uint64_t v10 = *(void *)(v9 - 8);
  v37[1] = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v39 = (char *)v37 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B070);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v38 = (uint64_t)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = a4;
  uint64_t v40 = a2;
  uint64_t v14 = sub_22D6CC4B8();
  uint64_t v15 = sub_22D6CD328();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v37 - v20;
  uint64_t v22 = (long long *)(a1 + *(int *)(v9 + 84));
  long long v23 = *v22;
  uint64_t v24 = *((void *)v22 + 2);
  long long v47 = v23;
  uint64_t v48 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5A8);
  sub_22D6CC028();
  uint64_t v26 = v45;
  unint64_t v25 = v46;
  swift_bridgeObjectRelease();
  uint64_t v27 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000) == 0) {
    uint64_t v27 = v26 & 0xFFFFFFFFFFFFLL;
  }
  if (!v27)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v21, 1, 1, v14);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
    sub_22D6CC058();
    sub_22D6CC038();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
  }
  uint64_t v28 = sub_22D6CD178();
  __swift_storeEnumTagSinglePayload(v38, 1, 1, v28);
  uint64_t v29 = v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v39, a1, v9);
  sub_22D6CD148();
  uint64_t v30 = sub_22D6CD138();
  unint64_t v31 = (*(unsigned __int8 *)(v10 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v32 = (char *)swift_allocObject();
  uint64_t v33 = MEMORY[0x263F8F500];
  *((void *)v32 + 2) = v30;
  *((void *)v32 + 3) = v33;
  uint64_t v34 = v41;
  *((void *)v32 + 4) = v40;
  *((void *)v32 + 5) = v34;
  uint64_t v35 = v43;
  *((void *)v32 + 6) = v42;
  *((void *)v32 + 7) = v35;
  *((void *)v32 + 8) = v44;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v32[v31], v29, v9);
  sub_22D64EFD0();
  return swift_release();
}

uint64_t sub_22D6AA73C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[12] = a4;
  v8[2] = a5;
  _OWORD v8[3] = a6;
  v8[4] = a7;
  v8[5] = a8;
  v8[6] = v14;
  uint64_t v9 = _s25LibrarySectionContentViewVMa();
  v8[13] = v9;
  v8[14] = *(void *)(v9 - 8);
  v8[15] = swift_task_alloc();
  sub_22D6CD148();
  v8[16] = sub_22D6CD138();
  uint64_t v11 = sub_22D6CD108();
  v8[17] = v11;
  v8[18] = v10;
  return MEMORY[0x270FA2498](sub_22D6AA848, v11, v10);
}

uint64_t sub_22D6AA848()
{
  BOOL v1 = sub_22D6A8B1C(*(void *)(v0 + 104));
  OUTLINED_FUNCTION_24_4();
  v2();
  if (v1)
  {
    *(__n128 *)(v0 + 56) = OUTLINED_FUNCTION_29_4();
    *(void *)(v0 + 72) = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5A8);
    sub_22D6CC028();
    uint64_t v5 = *(void *)(v0 + 80);
    unint64_t v4 = *(void *)(v0 + 88);
    swift_bridgeObjectRelease();
    if ((v4 & 0x2000000000000000) != 0) {
      uint64_t v6 = HIBYTE(v4) & 0xF;
    }
    else {
      uint64_t v6 = v5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v7 = OUTLINED_FUNCTION_102();
    v8(v7);
    if (v6)
    {
      uint64_t v9 = *(void *)(v0 + 104);
      swift_release();
      sub_22D6AAB5C(v9);
      swift_task_dealloc();
      OUTLINED_FUNCTION_16();
      return v10();
    }
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 112) + 8))(*(void *)(v0 + 120), *(void *)(v0 + 104));
  }
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_22D6AA9E8;
  uint64_t v13 = *(void *)(v0 + 104);
  return sub_22D6AB11C(v13);
}

uint64_t sub_22D6AA9E8()
{
  OUTLINED_FUNCTION_45();
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  OUTLINED_FUNCTION_10_0();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  uint64_t v4 = *(void *)(v1 + 144);
  uint64_t v5 = *(void *)(v1 + 136);
  return MEMORY[0x270FA2498](sub_22D6AAAFC, v5, v4);
}

uint64_t sub_22D6AAAFC()
{
  OUTLINED_FUNCTION_45();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v0();
}

uint64_t sub_22D6AAB5C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v49 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v49 + 8);
  uint64_t v57 = v4;
  uint64_t v53 = v5;
  uint64_t v6 = sub_22D6CC4B8();
  uint64_t v47 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v48 = (char *)&v46 - v7;
  uint64_t v55 = v8;
  uint64_t v54 = sub_22D6CD328();
  uint64_t v56 = *(void *)(v54 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v54);
  uint64_t v52 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v51 = (char *)&v46 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v50 = (char *)&v46 - v13;
  uint64_t v14 = sub_22D6C9FF8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = (long long *)(v1 + *(int *)(a1 + 84));
  long long v23 = *v22;
  uint64_t v24 = *((void *)v22 + 2);
  long long v58 = v23;
  uint64_t v59 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5A8);
  sub_22D6CC028();
  long long v25 = v60;
  swift_bridgeObjectRelease();
  uint64_t v26 = v1;
  if ((*((void *)&v25 + 1) & 0x2000000000000000) != 0) {
    uint64_t v27 = HIBYTE(*((void *)&v25 + 1)) & 0xFLL;
  }
  else {
    uint64_t v27 = v25 & 0xFFFFFFFFFFFFLL;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v2, a1);
  if (!v27) {
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, a1);
  }
  uint64_t v28 = &v21[*(int *)(a1 + 84)];
  long long v29 = *(_OWORD *)v28;
  uint64_t v30 = *((void *)v28 + 2);
  long long v58 = v29;
  uint64_t v59 = v30;
  sub_22D6CC028();
  long long v58 = v60;
  sub_22D6C9FE8();
  sub_22D604560();
  uint64_t v31 = sub_22D6CD358();
  unint64_t v33 = v32;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v33 & 0x2000000000000000) != 0) {
    uint64_t v34 = HIBYTE(v33) & 0xF;
  }
  else {
    uint64_t v34 = v31 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, a1);
  if (v34)
  {
    uint64_t v36 = v54;
    uint64_t v37 = sub_22D6CC058();
    uint64_t v38 = (uint64_t)v50;
    uint64_t v46 = v37;
    sub_22D6CC028();
    uint64_t v39 = v55;
    if (__swift_getEnumTagSinglePayload(v38, 1, v55))
    {
      uint64_t v40 = v56;
      uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
      v41(v38, v36);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v48, v38, v39);
      uint64_t v40 = v56;
      uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
      uint64_t v42 = ((uint64_t (*)(uint64_t, uint64_t))v41)(v38, v36);
      MEMORY[0x270FA5388](v42);
      uint64_t v43 = *(void *)(a1 + 24);
      *(&v46 - 6) = v57;
      *(&v46 - 5) = v43;
      *(&v46 - 4) = v49;
      *(_OWORD *)(&v46 - 3) = *(_OWORD *)(a1 + 40);
      *(&v46 - 1) = v26;
      swift_getWitnessTable();
      uint64_t v44 = sub_22D6CCFD8();
      if (v44)
      {
LABEL_14:
        *(void *)&long long v58 = v44;
        sub_22D6CD0E8();
        swift_getWitnessTable();
        uint64_t v45 = (uint64_t)v51;
        sub_22D6CC4C8();
        __swift_storeEnumTagSinglePayload(v45, 0, 1, v39);
        (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v52, v45, v36);
        sub_22D6CC038();
        return ((uint64_t (*)(uint64_t, uint64_t))v41)(v45, v36);
      }
    }
    uint64_t v44 = sub_22D6CD068();
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_22D6AB11C(uint64_t a1)
{
  v2[22] = a1;
  v2[23] = v1;
  v2[24] = *(void *)(a1 + 16);
  v2[25] = sub_22D6CC4B8();
  uint64_t v4 = sub_22D6CD328();
  v2[26] = v4;
  v2[27] = *(void *)(v4 - 8);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  uint64_t v5 = sub_22D6CC5D8();
  v2[30] = v5;
  v2[31] = *(void *)(v5 - 8);
  v2[32] = swift_task_alloc();
  uint64_t v6 = sub_22D6C9FF8();
  v2[33] = v6;
  v2[34] = *(void *)(v6 - 8);
  v2[35] = swift_task_alloc();
  v2[36] = *(void *)(a1 - 8);
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  uint64_t v7 = sub_22D6CC5A8();
  v2[39] = v7;
  unsigned char v2[40] = *(void *)(v7 - 8);
  v2[41] = swift_task_alloc();
  sub_22D6CD148();
  v2[42] = sub_22D6CD138();
  uint64_t v9 = sub_22D6CD108();
  v2[43] = v9;
  v2[44] = v8;
  return MEMORY[0x270FA2498](sub_22D6AB3E0, v9, v8);
}

uint64_t sub_22D6AB3E0()
{
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v2 = *(void *)(v0 + 176);
  (*(void (**)(void, void, void))(*(void *)(v0 + 320) + 16))(*(void *)(v0 + 328), *(void *)(v0 + 184) + *(int *)(v2 + 72), *(void *)(v0 + 312));
  BOOL v3 = sub_22D6A8B1C(v2);
  uint64_t v4 = *(void (**)(void))(v1 + 16);
  OUTLINED_FUNCTION_24_4();
  v4();
  if (v3)
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v6 = (long long *)(*(void *)(v0 + 304) + *(int *)(*(void *)(v0 + 176) + 84));
    long long v7 = *v6;
    uint64_t v8 = *((void *)v6 + 2);
    *(_OWORD *)(v0 + 40) = v7;
    *(void *)(v0 + 56) = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5A8);
    sub_22D6CC028();
    uint64_t v9 = *(void *)(v0 + 88);
    unint64_t v10 = *(void *)(v0 + 96);
    swift_bridgeObjectRelease();
    uint64_t v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0) {
      uint64_t v11 = v9 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v5 = v11 != 0;
  }
  uint64_t v12 = *(void (**)(void))(*(void *)(v0 + 288) + 8);
  ((void (*)(void, void))v12)(*(void *)(v0 + 304), *(void *)(v0 + 176));
  OUTLINED_FUNCTION_24_4();
  v4();
  if (v5)
  {
    uint64_t v14 = *(void *)(v0 + 272);
    uint64_t v13 = *(void *)(v0 + 280);
    uint64_t v36 = *(void *)(v0 + 264);
    uint64_t v15 = *(void *)(v0 + 176);
    *(__n128 *)(v0 + 64) = OUTLINED_FUNCTION_29_4();
    *(void *)(v0 + 80) = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5A8);
    sub_22D6CC028();
    uint64_t v17 = *(void *)(v0 + 144);
    *(void *)(v0 + 104) = *(void *)(v0 + 136);
    *(void *)(v0 + 112) = v17;
    sub_22D6C9FE8();
    sub_22D604560();
    uint64_t v18 = sub_22D6CD358();
    unint64_t v20 = v19;
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v20 & 0x2000000000000000) != 0) {
      uint64_t v21 = HIBYTE(v20) & 0xF;
    }
    else {
      uint64_t v21 = v18 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v22 = OUTLINED_FUNCTION_102();
    v12(v22);
    if (v21)
    {
      long long v23 = (long long *)(*(void *)(v0 + 184) + *(int *)(v15 + 84));
      long long v24 = *v23;
      uint64_t v25 = *((void *)v23 + 2);
      *(_OWORD *)(v0 + 16) = v24;
      *(void *)(v0 + 32) = v25;
      sub_22D6CC028();
      sub_22D6CC568();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    ((void (*)(void, void))v12)(*(void *)(v0 + 296), *(void *)(v0 + 176));
  }
  unint64_t v32 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v32;
  *unint64_t v32 = v0;
  v32[1] = sub_22D6AB6B4;
  uint64_t v33 = *(void *)(v0 + 312);
  uint64_t v34 = *(void *)(v0 + 256);
  return MEMORY[0x270EF6780](v34, v33, v26, v27, v28, v29, v30, v31);
}

uint64_t sub_22D6AB6B4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 368) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 352);
  uint64_t v4 = *(void *)(v2 + 344);
  if (v0) {
    BOOL v5 = sub_22D6AB988;
  }
  else {
    BOOL v5 = sub_22D6AB7F0;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_22D6AB7F0()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[25];
  swift_release();
  sub_22D6CC5C8();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v3);
  uint64_t v4 = *(void (**)(uint64_t))(v2 + 16);
  uint64_t v5 = OUTLINED_FUNCTION_26_4();
  v4(v5);
  sub_22D6CC058();
  sub_22D6CC038();
  uint64_t v6 = *(void (**)(uint64_t))(v2 + 8);
  uint64_t v7 = OUTLINED_FUNCTION_30_4();
  v6(v7);
  sub_22D6CC028();
  uint64_t v8 = OUTLINED_FUNCTION_26_4();
  v4(v8);
  sub_22D6CC038();
  uint64_t v9 = OUTLINED_FUNCTION_30_4();
  v6(v9);
  OUTLINED_FUNCTION_22();
  v10();
  OUTLINED_FUNCTION_22();
  v11();
  OUTLINED_FUNCTION_27_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v12();
}

uint64_t sub_22D6AB988()
{
  uint64_t v22 = v0;
  uint64_t v1 = v0[41];
  uint64_t v2 = v0[39];
  uint64_t v3 = v0[40];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  if (qword_26857ADB8 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)v0[46];
  uint64_t v5 = sub_22D6CAD08();
  __swift_project_value_buffer(v5, (uint64_t)qword_268585250);
  id v6 = v4;
  id v7 = v4;
  uint64_t v8 = sub_22D6CACE8();
  os_log_type_t v9 = sub_22D6CD278();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = (void *)v0[46];
  if (v10)
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v21 = v13;
    *(_DWORD *)uint64_t v12 = 136446466;
    uint64_t v14 = sub_22D6CD6C8();
    v0[21] = sub_22D6BB008(v14, v15, &v21);
    sub_22D6CD338();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2082;
    v0[20] = v11;
    id v16 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857AFD0);
    uint64_t v17 = sub_22D6CCF48();
    v0[19] = sub_22D6BB008(v17, v18, &v21);
    sub_22D6CD338();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22D5CD000, v8, v9, "Failed to request items of type %{public}s from the user's music library. Error = %{public}s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x230F89D10](v13, -1, -1);
    MEMORY[0x230F89D10](v12, -1, -1);
  }
  else
  {
  }
  OUTLINED_FUNCTION_27_4();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v19();
}

uint64_t sub_22D6ABC4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  uint64_t v43 = a2;
  v48[0] = a2;
  v48[1] = a3;
  v48[2] = a4;
  uint64_t v49 = a5;
  uint64_t v38 = a5;
  uint64_t v40 = a6;
  uint64_t v50 = a6;
  uint64_t v9 = _s25LibrarySectionContentViewVMa();
  uint64_t v41 = *(void *)(v9 - 8);
  uint64_t v36 = *(void *)(v41 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v39 = (char *)&v34 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B070);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v37 = (uint64_t)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for MusicPicker.Click.ControlID();
  MEMORY[0x270FA5388](v13);
  unint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = v9;
  sub_22D6B93B8((uint64_t)v48);
  uint64_t v16 = v49;
  if (v49)
  {
    uint64_t v17 = v50;
    __swift_project_boxed_opaque_existential_1(v48, v49);
    *unint64_t v15 = *(unsigned char *)(a1 + 32);
    swift_storeEnumTagMultiPayload();
    char v18 = *(unsigned char *)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 56);
    uint64_t v34 = v7;
    uint64_t v35 = v6;
    unint64_t v21 = *(void *)(a1 + 64);
    v44[0] = v18;
    uint64_t v45 = v19;
    uint64_t v46 = v20;
    unint64_t v47 = v21;
    uint64_t v22 = *(void (**)(unsigned char *, char *, uint64_t, uint64_t))(v17 + 16);
    swift_bridgeObjectRetain();
    sub_22D5DB288(v21);
    v22(v15, v44, v16, v17);
    uint64_t v7 = v34;
    swift_bridgeObjectRelease();
    unint64_t v23 = v21;
    uint64_t v6 = v35;
    sub_22D5DB9FC(v23);
    sub_22D6995A4((uint64_t)v15);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
  }
  else
  {
    sub_22D5DD960((uint64_t)v48, &qword_26857AF90);
  }
  uint64_t v24 = sub_22D6CD178();
  __swift_storeEnumTagSinglePayload(v37, 1, 1, v24);
  uint64_t v26 = v41;
  uint64_t v25 = v42;
  uint64_t v27 = v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v39, a1, v42);
  sub_22D6CD148();
  uint64_t v28 = sub_22D6CD138();
  unint64_t v29 = (*(unsigned __int8 *)(v26 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v30 = (char *)swift_allocObject();
  uint64_t v31 = MEMORY[0x263F8F500];
  *((void *)v30 + 2) = v28;
  *((void *)v30 + 3) = v31;
  *((void *)v30 + 4) = v43;
  *((void *)v30 + 5) = v7;
  uint64_t v32 = v38;
  *((void *)v30 + 6) = v6;
  *((void *)v30 + 7) = v32;
  *((void *)v30 + 8) = v40;
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(&v30[v29], v27, v25);
  sub_22D64EFD0();
  return swift_release();
}

uint64_t sub_22D6ABF88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = sub_22D6CD148();
  v8[8] = sub_22D6CD138();
  uint64_t v13 = (void *)swift_task_alloc();
  v8[9] = v13;
  v8[2] = a5;
  _OWORD v8[3] = a6;
  v8[4] = a7;
  v8[5] = a8;
  v8[6] = v17;
  uint64_t v14 = _s25LibrarySectionContentViewVMa();
  *uint64_t v13 = v8;
  v13[1] = sub_22D6AC080;
  return sub_22D6AC1E4(v14);
}

uint64_t sub_22D6AC080()
{
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v4 = sub_22D6CD108();
  return MEMORY[0x270FA2498](sub_22D6AC18C, v4, v3);
}

uint64_t sub_22D6AC18C()
{
  OUTLINED_FUNCTION_45();
  swift_release();
  OUTLINED_FUNCTION_16();
  return v0();
}

uint64_t sub_22D6AC1E4(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  v2[9] = sub_22D6CD148();
  void v2[10] = sub_22D6CD138();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[11] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_22D6AC2A4;
  return sub_22D6AB11C(a1);
}

uint64_t sub_22D6AC2A4()
{
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v4 = sub_22D6CD108();
  return MEMORY[0x270FA2498](sub_22D6AC3B0, v4, v3);
}

uint64_t sub_22D6AC3B0()
{
  uint64_t v12 = v0;
  swift_release();
  sub_22D6B93B8((uint64_t)(v0 + 2));
  uint64_t v1 = v0[5];
  if (v1)
  {
    uint64_t v3 = v0[7];
    uint64_t v2 = v0[8];
    uint64_t v4 = v0[6];
    uint64_t v5 = (void *)OUTLINED_FUNCTION_102();
    __swift_project_boxed_opaque_existential_1(v5, v6);
    unint64_t v7 = *(void *)(v2 + *(int *)(v3 + 96));
    unint64_t v11 = v7;
    uint64_t v8 = *(void (**)(unint64_t *, uint64_t, uint64_t))(v4 + 8);
    sub_22D5DB288(v7);
    v8(&v11, v1, v4);
    sub_22D5DB9FC(v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  }
  else
  {
    sub_22D5DD960((uint64_t)(v0 + 2), &qword_26857AF90);
  }
  OUTLINED_FUNCTION_16();
  return v9();
}

uint64_t sub_22D6AC4B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v74 = a7;
  uint64_t v75 = a1;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5D8);
  uint64_t v64 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v63 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5E8);
  MEMORY[0x270FA5388](v66);
  uint64_t v71 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BDE0);
  uint64_t v70 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v69 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5C8);
  MEMORY[0x270FA5388](v73);
  uint64_t v68 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22D6CC4B8();
  uint64_t v17 = sub_22D6CD328();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  unint64_t v21 = (char *)&v56 - v20;
  uint64_t v72 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v19);
  unint64_t v23 = (char *)&v56 - v22;
  uint64_t v60 = a2;
  *(void *)&long long v78 = a2;
  *((void *)&v78 + 1) = a3;
  uint64_t v61 = a3;
  uint64_t v62 = a4;
  uint64_t v79 = a4;
  uint64_t v80 = a5;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v81 = a6;
  uint64_t v26 = _s25LibrarySectionContentViewVMa();
  uint64_t v27 = v75;
  sub_22D6CC058();
  sub_22D6CC028();
  uint64_t v28 = v16;
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v16) == 1)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
LABEL_9:
    uint64_t v43 = 1;
    uint64_t v44 = v74;
    return __swift_storeEnumTagSinglePayload(v44, v43, 1, v73);
  }
  uint64_t v30 = v69;
  uint64_t v29 = v70;
  uint64_t v31 = v27;
  uint64_t v58 = v24;
  uint64_t v59 = v25;
  uint64_t v32 = v71;
  uint64_t v33 = v72;
  (*(void (**)(char *, char *, uint64_t))(v72 + 32))(v23, v21, v28);
  swift_getWitnessTable();
  if ((sub_22D6CD228() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v33 + 8))(v23, v28);
    goto LABEL_9;
  }
  uint64_t v56 = v28;
  uint64_t v57 = v23;
  uint64_t v34 = (long long *)(v31 + *(int *)(v26 + 84));
  long long v35 = *v34;
  uint64_t v36 = *((void *)v34 + 2);
  long long v78 = v35;
  uint64_t v79 = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5A8);
  sub_22D6CC028();
  uint64_t v38 = v76;
  unint64_t v37 = v77;
  uint64_t v39 = swift_bridgeObjectRelease();
  uint64_t v40 = HIBYTE(v37) & 0xF;
  if ((v37 & 0x2000000000000000) == 0) {
    uint64_t v40 = v38 & 0xFFFFFFFFFFFFLL;
  }
  if (v40)
  {
    sub_22D6CB688();
    uint64_t v41 = v65;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v32, v30, v65);
    swift_storeEnumTagMultiPayload();
    sub_22D5DCE80(&qword_26857BDD8, &qword_26857BDE0);
    sub_22D5DCE80(&qword_26857E5D0, &qword_26857E5D8);
    uint64_t v42 = v68;
    sub_22D6CB558();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v41);
  }
  else
  {
    MEMORY[0x270FA5388](v39);
    uint64_t v45 = v61;
    *(&v56 - 6) = v60;
    *(&v56 - 5) = v45;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5F0);
    uint64_t v46 = sub_22D5DCE80(&qword_26857E5F8, &qword_26857E5F0);
    uint64_t v54 = MEMORY[0x263F1A820];
    uint64_t v55 = MEMORY[0x263F1BA00];
    uint64_t v52 = MEMORY[0x263F1BA08];
    uint64_t v53 = v46;
    unint64_t v47 = v63;
    sub_22D6CB678();
    uint64_t v48 = v64;
    uint64_t v49 = v67;
    (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v32, v47, v67);
    swift_storeEnumTagMultiPayload();
    sub_22D5DCE80(&qword_26857BDD8, &qword_26857BDE0);
    sub_22D5DCE80(&qword_26857E5D0, &qword_26857E5D8);
    uint64_t v42 = v68;
    sub_22D6CB558();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v49);
  }
  (*(void (**)(char *, uint64_t))(v72 + 8))(v57, v56);
  uint64_t v50 = (uint64_t)v42;
  uint64_t v44 = v74;
  sub_22D6AFEB8(v50, v74, &qword_26857E5C8);
  uint64_t v43 = 0;
  return __swift_storeEnumTagSinglePayload(v44, v43, 1, v73);
}

uint64_t sub_22D6ACC18()
{
  return sub_22D6CBFF8();
}

uint64_t sub_22D6ACC6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22D6CBFB8();
  *a1 = result;
  return result;
}

uint64_t sub_22D6ACCA4@<X0>(uint64_t a1@<X8>)
{
  sub_22D604560();
  swift_bridgeObjectRetain();
  uint64_t result = sub_22D6CBAF8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_22D6ACD10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v33 = a6;
  uint64_t v34 = a5;
  uint64_t v35 = a2;
  uint64_t v36 = a1;
  uint64_t v37 = a8;
  uint64_t v11 = sub_22D6CC4B8();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v32 = a3;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  swift_getTupleTypeMetadata2();
  uint64_t v50 = v11;
  uint64_t v51 = AssociatedTypeWitness;
  uint64_t v52 = sub_22D6CC2C8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_22D6CC1A8();
  sub_22D6CD328();
  uint64_t v49 = swift_getWitnessTable();
  uint64_t v48 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6CADD8();
  uint64_t v13 = a4;
  uint64_t v14 = a7;
  _s50BottomNavigationPromptAvoidancePaddingViewModifierVMa();
  sub_22D6CB088();
  uint64_t v46 = swift_getWitnessTable();
  uint64_t v47 = swift_getWitnessTable();
  void v31[3] = MEMORY[0x263F18E48];
  v31[1] = swift_getWitnessTable();
  uint64_t v15 = sub_22D6CADE8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v31 - v17;
  v31[2] = _s27DismissAlertTriggerModifierVMa();
  uint64_t v19 = sub_22D6CB088();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  unint64_t v23 = (char *)v31 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)v31 - v24;
  sub_22D6CB898();
  uint64_t v38 = v32;
  uint64_t v39 = v13;
  uint64_t v40 = v34;
  uint64_t v41 = v33;
  uint64_t v42 = v14;
  uint64_t v43 = v35;
  sub_22D6CADF8();
  uint64_t v26 = swift_getWitnessTable();
  double v27 = sub_22D621FAC();
  sub_22D63FCF4(v36, v27, v13, v15, v13, v26);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v44 = v26;
  uint64_t v45 = v28;
  swift_getWitnessTable();
  sub_22D6B8B10(v23, v19);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v20 + 8);
  v29(v23, v19);
  sub_22D6B8B10(v25, v19);
  return ((uint64_t (*)(char *, uint64_t))v29)(v25, v19);
}

uint64_t sub_22D6AD250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v42 = a5;
  uint64_t v43 = a4;
  uint64_t v45 = a1;
  uint64_t v46 = a7;
  uint64_t v11 = sub_22D6CB658();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v44 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22D6CC4B8();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v57 = a2;
  uint64_t v58 = a3;
  uint64_t v59 = a5;
  uint64_t v60 = a6;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  swift_getTupleTypeMetadata2();
  uint64_t v15 = sub_22D6CC2C8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v57 = v13;
  uint64_t v58 = AssociatedTypeWitness;
  uint64_t v59 = v15;
  uint64_t v60 = WitnessTable;
  uint64_t v61 = AssociatedConformanceWitness;
  sub_22D6CC1A8();
  uint64_t v18 = sub_22D6CD328();
  uint64_t v56 = swift_getWitnessTable();
  uint64_t v55 = swift_getWitnessTable();
  void v37[2] = v18;
  v37[1] = swift_getWitnessTable();
  uint64_t v19 = sub_22D6CADD8();
  uint64_t v40 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)v37 - v20;
  uint64_t v22 = a3;
  uint64_t v23 = a6;
  uint64_t v39 = _s50BottomNavigationPromptAvoidancePaddingViewModifierVMa();
  uint64_t v24 = sub_22D6CB088();
  uint64_t v41 = *(void *)(v24 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  double v27 = (char *)v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v38 = (char *)v37 - v28;
  v37[0] = sub_22D6CB458();
  uint64_t v29 = a2;
  uint64_t v57 = a2;
  uint64_t v58 = v22;
  uint64_t v30 = v43;
  uint64_t v31 = v42;
  uint64_t v59 = v43;
  uint64_t v60 = v42;
  uint64_t v61 = v23;
  _s25LibrarySectionContentViewVMa();
  uint64_t v47 = v29;
  uint64_t v48 = v22;
  uint64_t v49 = v30;
  uint64_t v50 = v31;
  uint64_t v51 = v23;
  uint64_t v52 = v45;
  sub_22D613374();
  sub_22D6CADC8();
  uint64_t v32 = swift_getWitnessTable();
  sub_22D5DEF3C(v22, v19, v22, v32);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v21, v19);
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v53 = v32;
  uint64_t v54 = v33;
  swift_getWitnessTable();
  uint64_t v34 = v38;
  sub_22D6B8B10(v27, v24);
  uint64_t v35 = *(void (**)(char *, uint64_t))(v41 + 8);
  v35(v27, v24);
  sub_22D6B8B10(v34, v24);
  return ((uint64_t (*)(char *, uint64_t))v35)(v34, v24);
}

uint64_t sub_22D6AD794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v83 = a1;
  uint64_t v89 = a7;
  uint64_t v94 = a2;
  uint64_t v95 = a3;
  uint64_t v96 = a4;
  uint64_t v97 = a5;
  uint64_t v98 = a6;
  uint64_t v12 = _s25LibrarySectionContentViewVMa();
  uint64_t v75 = *(void *)(v12 - 8);
  uint64_t v70 = *(void *)(v75 + 64);
  MEMORY[0x270FA5388](v12);
  uint64_t v72 = (char *)&v62 - v13;
  uint64_t v78 = a4;
  uint64_t v14 = sub_22D6CC4B8();
  uint64_t v15 = *(void *)(a5 + 40);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v94 = a2;
  uint64_t v95 = a3;
  uint64_t v77 = a3;
  uint64_t v79 = a5;
  uint64_t v80 = a6;
  uint64_t v96 = a5;
  uint64_t v97 = a6;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  swift_getTupleTypeMetadata2();
  uint64_t v17 = sub_22D6CC2C8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v74 = v15;
  uint64_t v76 = a2;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v94 = v14;
  uint64_t v95 = AssociatedTypeWitness;
  uint64_t v73 = AssociatedTypeWitness;
  uint64_t v88 = v17;
  uint64_t v96 = v17;
  uint64_t v97 = WitnessTable;
  uint64_t v69 = WitnessTable;
  uint64_t v98 = AssociatedConformanceWitness;
  uint64_t v20 = sub_22D6CC1A8();
  uint64_t v66 = *(void *)(v20 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v67 = (char *)&v62 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v68 = (char *)&v62 - v23;
  uint64_t v24 = sub_22D6CD328();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v62 - v27;
  uint64_t v65 = *(void *)(v14 - 8);
  uint64_t v29 = *(void *)(v65 + 64);
  uint64_t v30 = MEMORY[0x270FA5388](v26);
  uint64_t v81 = (char *)&v62 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  uint64_t v82 = (char *)&v62 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v34 = (char *)&v62 - v33;
  uint64_t v87 = sub_22D6CD328();
  uint64_t v85 = *(void *)(v87 - 8);
  uint64_t v35 = MEMORY[0x270FA5388](v87);
  uint64_t v84 = (uint64_t)&v62 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  uint64_t v86 = (uint64_t)&v62 - v37;
  uint64_t v71 = v12;
  uint64_t v38 = v83;
  sub_22D6CC058();
  sub_22D6CC028();
  if (__swift_getEnumTagSinglePayload((uint64_t)v28, 1, v14) == 1)
  {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v24);
    uint64_t v39 = v84;
    __swift_storeEnumTagSinglePayload(v84, 1, 1, v20);
    uint64_t v93 = swift_getWitnessTable();
    swift_getWitnessTable();
  }
  else
  {
    uint64_t v41 = v65;
    uint64_t v64 = v20;
    uint64_t v62 = *(void (**)(char *, char *, uint64_t))(v65 + 32);
    uint64_t v42 = v34;
    v62(v34, v28, v14);
    uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
    uint64_t v63 = v34;
    v43(v82, v34, v14);
    uint64_t v44 = v75;
    uint64_t v45 = v72;
    uint64_t v46 = v38;
    uint64_t v47 = v71;
    (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v72, v46, v71);
    v43(v81, v42, v14);
    unint64_t v48 = (*(unsigned __int8 *)(v44 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
    unint64_t v49 = (v70 + v48 + *(unsigned __int8 *)(v41 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
    uint64_t v50 = (char *)swift_allocObject();
    uint64_t v51 = v77;
    *((void *)v50 + 2) = v76;
    *((void *)v50 + 3) = v51;
    uint64_t v52 = v79;
    *((void *)v50 + 4) = v78;
    *((void *)v50 + 5) = v52;
    *((void *)v50 + 6) = v80;
    (*(void (**)(char *, char *, uint64_t))(v44 + 32))(&v50[v48], v45, v47);
    v62(&v50[v49], v81, v14);
    uint64_t v53 = v64;
    uint64_t v54 = swift_getWitnessTable();
    uint64_t v55 = v67;
    sub_22D6CC198();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v63, v14);
    uint64_t v90 = v54;
    swift_getWitnessTable();
    uint64_t v56 = v68;
    sub_22D6B8B10(v55, v53);
    uint64_t v57 = *(void (**)(char *, uint64_t))(v66 + 8);
    v57(v55, v53);
    uint64_t v39 = v84;
    sub_22D6B8B10(v56, v53);
    v57(v56, v53);
    __swift_storeEnumTagSinglePayload(v39, 0, 1, v53);
  }
  uint64_t v40 = v86;
  sub_22D627E64(v39, v86);
  uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
  uint64_t v59 = v39;
  uint64_t v60 = v87;
  v58(v59, v87);
  uint64_t v92 = swift_getWitnessTable();
  uint64_t v91 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6B8B10(v40, v60);
  return ((uint64_t (*)(uint64_t, uint64_t))v58)(v40, v60);
}

uint64_t sub_22D6AE074@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>)
{
  unint64_t v123 = a6;
  uint64_t v112 = a3;
  uint64_t v126 = a1;
  uint64_t v127 = a2;
  uint64_t v119 = a9;
  uint64_t v102 = sub_22D6CC178();
  uint64_t v101 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  uint64_t v100 = (char *)v95 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B040);
  MEMORY[0x270FA5388](v118);
  uint64_t v99 = (char *)v95 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_22D6CD328();
  uint64_t v107 = v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v97 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v106 = (char *)v95 - v17;
  uint64_t v111 = *(void *)(v15 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v113 = (char *)v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v121 = (char *)v95 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v122 = (char *)v95 - v22;
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BD60);
  uint64_t v23 = MEMORY[0x270FA5388](v115);
  uint64_t v117 = (uint64_t)v95 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v116 = (uint64_t)v95 - v26;
  uint64_t v27 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)v95 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = a4;
  uint64_t v132 = a5;
  unint64_t v133 = a7;
  unint64_t v134 = a8;
  uint64_t v30 = _s13ItemShelfCellVMa();
  uint64_t v110 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v109 = (void (*)(void, void))((char *)v95 - v31);
  uint64_t v32 = sub_22D6CB088();
  uint64_t v114 = *(char **)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v108 = (char *)v95 - v33;
  uint64_t v103 = sub_22D6CB088();
  uint64_t v124 = *(void *)(v103 - 8);
  uint64_t v34 = MEMORY[0x270FA5388](v103);
  uint64_t v36 = (char *)v95 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v34);
  uint64_t v125 = (char *)v95 - v37;
  uint64_t v96 = v27;
  uint64_t v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
  uint64_t v104 = v27 + 16;
  uint64_t v105 = v38;
  v38((uint64_t)v29, v126, a4);
  uint64_t v131 = a4;
  uint64_t v132 = a5;
  unint64_t v133 = v123;
  unint64_t v134 = a7;
  unint64_t v135 = a8;
  uint64_t v39 = _s25LibrarySectionContentViewVMa();
  uint64_t v40 = v127 + *(int *)(v39 + 100);
  uint64_t v42 = *(void *)(v40 + 8);
  unint64_t v41 = *(void *)(v40 + 16);
  unint64_t v43 = *(void *)(v40 + 24);
  LOBYTE(v131) = *(unsigned char *)v40;
  uint64_t v132 = v42;
  unint64_t v133 = v41;
  unint64_t v134 = v43;
  swift_bridgeObjectRetain();
  sub_22D5DB288(v43);
  uint64_t v44 = sub_22D621FB4();
  v95[1] = a7;
  uint64_t v45 = a4;
  uint64_t v46 = v109;
  v95[0] = v29;
  sub_22D686FD8((uint64_t)v29, (char *)&v131, 0, 0, 5, 0, 1, v44, (uint64_t)v109, v47, v48, a5, a4);
  sub_22D6CB8E8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v50 = v108;
  sub_22D6CBE28();
  (*(void (**)(void, uint64_t))(v110 + 8))(v46, v30);
  sub_22D6CB8F8();
  uint64_t v98 = v39;
  uint64_t v51 = MEMORY[0x263F18C10];
  v130[4] = WitnessTable;
  v130[5] = MEMORY[0x263F18C10];
  uint64_t v52 = swift_getWitnessTable();
  sub_22D6CBE28();
  uint64_t v53 = v50;
  uint64_t v54 = v103;
  uint64_t v55 = v32;
  uint64_t v56 = (uint64_t)v106;
  (*((void (**)(char *, uint64_t))v114 + 1))(v53, v55);
  v130[2] = v52;
  v130[3] = v51;
  uint64_t v57 = v107;
  uint64_t v58 = (uint64_t)v122;
  uint64_t v108 = (char *)swift_getWitnessTable();
  sub_22D6B8B10(v36, v54);
  uint64_t v59 = *(void (**)(void, void))(v124 + 8);
  uint64_t v114 = v36;
  uint64_t v110 = v124 + 8;
  uint64_t v109 = v59;
  v59(v36, v54);
  v105(v58, v126, v45);
  __swift_storeEnumTagSinglePayload(v58, 0, 1, v45);
  sub_22D6CC4B8();
  swift_getWitnessTable();
  uint64_t v60 = v121;
  sub_22D6CCE48();
  uint64_t v61 = v56 + *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v62 = v111;
  uint64_t v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v111 + 16);
  v63(v56, v58, v57);
  v63(v61, (uint64_t)v60, v57);
  if (__swift_getEnumTagSinglePayload(v56, 1, v45) != 1)
  {
    uint64_t v65 = v62;
    v63((uint64_t)v113, v56, v57);
    if (__swift_getEnumTagSinglePayload(v61, 1, v45) != 1)
    {
      uint64_t v67 = v96;
      uint64_t v68 = v95[0];
      (*(void (**)(void, uint64_t, uint64_t))(v96 + 32))(v95[0], v61, v45);
      uint64_t v69 = v113;
      char v70 = sub_22D6CCE68();
      uint64_t v71 = *(void (**)(uint64_t, uint64_t))(v67 + 8);
      v71(v68, v45);
      uint64_t v72 = *(void (**)(char *, uint64_t))(v65 + 8);
      v72(v121, v57);
      v72(v122, v57);
      v71((uint64_t)v69, v45);
      v72((char *)v56, v57);
      if (v70) {
        goto LABEL_8;
      }
LABEL_9:
      uint64_t v76 = v100;
      sub_22D6CC168();
      char v77 = sub_22D6CB8E8();
      sub_22D6AED60(v126, v98);
      sub_22D6CADB8();
      uint64_t v79 = v78;
      uint64_t v81 = v80;
      uint64_t v83 = v82;
      uint64_t v85 = v84;
      uint64_t v86 = v101;
      uint64_t v87 = (uint64_t)v99;
      uint64_t v88 = v102;
      (*(void (**)(char *, char *, uint64_t))(v101 + 16))(v99, v76, v102);
      uint64_t v74 = v118;
      uint64_t v89 = v87 + *(int *)(v118 + 36);
      *(unsigned char *)uint64_t v89 = v77;
      *(void *)(v89 + 8) = v79;
      *(void *)(v89 + 16) = v81;
      *(void *)(v89 + 24) = v83;
      *(void *)(v89 + 32) = v85;
      *(unsigned char *)(v89 + 40) = 0;
      (*(void (**)(char *, uint64_t))(v86 + 8))(v76, v88);
      uint64_t v75 = v116;
      sub_22D6AFEB8(v87, v116, &qword_26857B040);
      uint64_t v73 = 0;
      goto LABEL_10;
    }
    uint64_t v66 = *(void (**)(char *, uint64_t))(v62 + 8);
    v66(v121, v57);
    v66(v122, v57);
    (*(void (**)(char *, uint64_t))(v96 + 8))(v113, v45);
LABEL_6:
    (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v56, TupleTypeMetadata2);
    goto LABEL_9;
  }
  uint64_t v64 = *(void (**)(char *, uint64_t))(v62 + 8);
  v64(v60, v57);
  v64((char *)v58, v57);
  if (__swift_getEnumTagSinglePayload(v61, 1, v45) != 1) {
    goto LABEL_6;
  }
  v64((char *)v56, v57);
LABEL_8:
  uint64_t v73 = 1;
  uint64_t v74 = v118;
  uint64_t v75 = v116;
LABEL_10:
  __swift_storeEnumTagSinglePayload(v75, v73, 1, v74);
  uint64_t v90 = v125;
  uint64_t v91 = v114;
  (*(void (**)(char *, char *, uint64_t))(v124 + 16))(v114, v125, v54);
  uint64_t v131 = (uint64_t)v91;
  uint64_t v92 = v117;
  sub_22D699BA0(v75, v117);
  uint64_t v132 = v92;
  v130[0] = v54;
  v130[1] = v115;
  uint64_t v128 = v108;
  uint64_t v129 = sub_22D6AFF10((unint64_t *)&qword_26857BF00, &qword_26857BD60, (void (*)(void))sub_22D5DD4F0);
  sub_22D634638((uint64_t)&v131, 2, (uint64_t)v130);
  sub_22D5DD960(v75, &qword_26857BD60);
  uint64_t v93 = (uint64_t (*)(char *, uint64_t))v109;
  v109(v90, v54);
  sub_22D5DD960(v92, &qword_26857BD60);
  return v93(v91, v54);
}

double sub_22D6AED60(uint64_t a1, uint64_t a2)
{
  sub_22D6CA618();
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  sub_22D6CA5A8();
  double v5 = v4 * 48.0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5 + *(double *)(v2 + *(int *)(a2 + 108));
}

uint64_t sub_22D6AEDF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857C0C8);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v39 = a3;
  *((void *)&v39 + 1) = a4;
  uint64_t v40 = a5;
  uint64_t v41 = a6;
  uint64_t v42 = a7;
  uint64_t v16 = (long long *)(a2 + *(int *)(_s25LibrarySectionContentViewVMa() + 84));
  long long v17 = *v16;
  uint64_t v18 = *((void *)v16 + 2);
  long long v39 = v17;
  uint64_t v40 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5A8);
  sub_22D6CC028();
  long long v39 = v38;
  sub_22D6CA1D8();
  uint64_t v19 = sub_22D6CA1E8();
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v19);
  sub_22D604560();
  uint64_t v43 = sub_22D6CD368();
  uint64_t v21 = v20;
  sub_22D5DD960((uint64_t)v15, &qword_26857C0C8);
  swift_bridgeObjectRelease();
  uint64_t v22 = sub_22D6CA558();
  if (!v23) {
    goto LABEL_4;
  }
  *(void *)&long long v39 = v22;
  *((void *)&v39 + 1) = v23;
  sub_22D6CA1D8();
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v19);
  v37[1] = a3;
  uint64_t v24 = sub_22D6CD368();
  v37[0] = v19;
  uint64_t v25 = v21;
  uint64_t v27 = v26;
  sub_22D5DD960((uint64_t)v15, &qword_26857C0C8);
  swift_bridgeObjectRelease();
  *(void *)&long long v39 = v24;
  *((void *)&v39 + 1) = v27;
  *(void *)&long long v38 = v43;
  *((void *)&v38 + 1) = v25;
  LOBYTE(v24) = sub_22D6CD378();
  uint64_t v21 = v25;
  uint64_t v19 = v37[0];
  swift_bridgeObjectRelease();
  if (v24)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
LABEL_4:
    uint64_t v29 = v43;
    uint64_t v30 = sub_22D6CA588();
    if (v31)
    {
      *(void *)&long long v39 = v30;
      *((void *)&v39 + 1) = v31;
      sub_22D6CA1D8();
      uint64_t v28 = 1;
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v19);
      uint64_t v32 = sub_22D6CD368();
      uint64_t v34 = v33;
      sub_22D5DD960((uint64_t)v15, &qword_26857C0C8);
      swift_bridgeObjectRelease();
      *(void *)&long long v39 = v32;
      *((void *)&v39 + 1) = v34;
      *(void *)&long long v38 = v29;
      *((void *)&v38 + 1) = v21;
      char v35 = sub_22D6CD378();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v35) {
        return v28;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    return 0;
  }
}

uint64_t sub_22D6AF120()
{
  return sub_22D6CD668();
}

BOOL sub_22D6AF1C8(double *a1, double *a2)
{
  return sub_22D5EDE8C(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_22D6AF1EC()
{
  return sub_22D6AF120();
}

uint64_t sub_22D6AF208()
{
  return sub_22D5EDEB0();
}

uint64_t sub_22D6AF224()
{
  return sub_22D6CD668();
}

uint64_t sub_22D6AF280()
{
  return sub_22D6AF2B4((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22D6AA3AC);
}

uint64_t sub_22D6AF29C()
{
  return sub_22D6AF2B4((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22D6ABC4C);
}

uint64_t sub_22D6AF2B4(uint64_t (*a1)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v7 = _s25LibrarySectionContentViewVMa();
  OUTLINED_FUNCTION_1_0(v7);
  uint64_t v9 = (char *)v1 + ((*(unsigned __int8 *)(v8 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1(v9, v2, v3, v4, v5, v6);
}

uint64_t sub_22D6AF34C()
{
  return sub_22D6AFB58((uint64_t (*)(void, void, void, void, void, void))sub_22D6AC4B0);
}

unint64_t sub_22D6AF364()
{
  unint64_t result = qword_26857E5C0;
  if (!qword_26857E5C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857E5C8);
    sub_22D5DCE80(&qword_26857BDD8, &qword_26857BDE0);
    sub_22D5DCE80(&qword_26857E5D0, &qword_26857E5D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E5C0);
  }
  return result;
}

uint64_t sub_22D6AF424@<X0>(uint64_t a1@<X8>)
{
  return sub_22D6ACCA4(a1);
}

uint64_t sub_22D6AF438()
{
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[8];
  _OWORD v1[2] = v0[4];
  v1[3] = v2;
  v1[4] = v3;
  v1[5] = v4;
  v1[6] = v5;
  uint64_t v6 = _s25LibrarySectionContentViewVMa();
  OUTLINED_FUNCTION_1_0(v6);
  OUTLINED_FUNCTION_34_2();
  uint64_t v7 = (void *)swift_task_alloc();
  v1[7] = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_22D6B0714;
  uint64_t v8 = OUTLINED_FUNCTION_11_9();
  return sub_22D6ABF88(v8, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t objectdestroy_16Tm()
{
  OUTLINED_FUNCTION_2_14();
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v1 + v3 + 64));
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_22();
  v6(v4, v5);
  swift_release();
  uint64_t v7 = v1 + v3 + *(int *)(v0 + 80);
  if (*(unsigned char *)(v7 + 40))
  {
    if (*(void *)(v7 + 24)) {
      __swift_destroy_boxed_opaque_existential_1(v7);
    }
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_22_5();
  if (!OUTLINED_FUNCTION_18_4())
  {
    OUTLINED_FUNCTION_8();
    uint64_t v8 = OUTLINED_FUNCTION_19_5();
    v9(v8);
  }
  sub_22D6CD328();
  uint64_t v10 = OUTLINED_FUNCTION_25_5();
  swift_release();
  if (!OUTLINED_FUNCTION_18_4())
  {
    OUTLINED_FUNCTION_8();
    uint64_t v11 = OUTLINED_FUNCTION_19_5();
    v12(v11);
  }
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_38_2();
  sub_22D5DB9FC(*(void *)(v10 + 24));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22D6AF700()
{
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[8];
  _OWORD v1[2] = v0[4];
  v1[3] = v2;
  v1[4] = v3;
  v1[5] = v4;
  v1[6] = v5;
  uint64_t v6 = _s25LibrarySectionContentViewVMa();
  OUTLINED_FUNCTION_1_0(v6);
  OUTLINED_FUNCTION_34_2();
  uint64_t v7 = (void *)swift_task_alloc();
  v1[7] = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_22D6AF7E8;
  uint64_t v8 = OUTLINED_FUNCTION_11_9();
  return sub_22D6AA73C(v8, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t sub_22D6AF7E8()
{
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v3();
}

uint64_t sub_22D6AF8A8(uint64_t a1)
{
  return sub_22D6AEDF8(a1, v1[7], v1[2], v1[3], v1[4], v1[5], v1[6]) & 1;
}

uint64_t objectdestroy_10Tm()
{
  OUTLINED_FUNCTION_2_14();
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v3 + 64));
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_22();
  v6(v4, v5);
  swift_release();
  uint64_t v7 = v3 + *(int *)(v0 + 80);
  if (*(unsigned char *)(v7 + 40))
  {
    if (*(void *)(v7 + 24)) {
      __swift_destroy_boxed_opaque_existential_1(v7);
    }
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_22_5();
  if (!OUTLINED_FUNCTION_18_4())
  {
    OUTLINED_FUNCTION_8();
    uint64_t v8 = OUTLINED_FUNCTION_19_5();
    v9(v8);
  }
  sub_22D6CD328();
  uint64_t v10 = OUTLINED_FUNCTION_25_5();
  swift_release();
  if (!OUTLINED_FUNCTION_18_4())
  {
    OUTLINED_FUNCTION_8();
    uint64_t v11 = OUTLINED_FUNCTION_19_5();
    v12(v11);
  }
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_38_2();
  sub_22D5DB9FC(*(void *)(v10 + 24));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22D6AFAA8()
{
  uint64_t v8 = OUTLINED_FUNCTION_12_6();
  OUTLINED_FUNCTION_1_0(v8);
  uint64_t v10 = v1 + ((*(unsigned __int8 *)(v9 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return sub_22D6ACD10(v0, v10, v3, v4, v5, v6, v7, v2);
}

uint64_t sub_22D6AFB28()
{
  return sub_22D6AFB58((uint64_t (*)(void, void, void, void, void, void))sub_22D6AD250);
}

uint64_t sub_22D6AFB40()
{
  return sub_22D6AFB58((uint64_t (*)(void, void, void, void, void, void))sub_22D6AD794);
}

uint64_t sub_22D6AFB58(uint64_t (*a1)(void, void, void, void, void, void))
{
  return a1(v1[7], v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_22D6AFB70()
{
  OUTLINED_FUNCTION_2_14();
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v20 = *(void *)(v4 + 64);
  uint64_t v5 = sub_22D6CC4B8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = v1 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v1 + v3 + 64));
  sub_22D6CC5A8();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_22();
  v12(v10, v11);
  swift_release();
  uint64_t v13 = v1 + v3 + v0[20];
  if (*(unsigned char *)(v13 + 40))
  {
    if (*(void *)(v13 + 24)) {
      __swift_destroy_boxed_opaque_existential_1(v13);
    }
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  if (!OUTLINED_FUNCTION_31_4(v0[22]))
  {
    uint64_t v14 = OUTLINED_FUNCTION_23_3();
    v15(v14);
  }
  sub_22D6CD328();
  OUTLINED_FUNCTION_25_5();
  swift_release();
  if (!OUTLINED_FUNCTION_31_4(v0[23]))
  {
    uint64_t v16 = OUTLINED_FUNCTION_23_3();
    v17(v16);
  }
  swift_release();
  sub_22D5DB9FC(*(void *)(v9 + v0[24]));
  uint64_t v18 = v9 + v0[25];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v18 + 24));
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v7 + 8))(v1 + ((v3 + v20 + v8) & ~v8), v5);
  return swift_deallocObject();
}

uint64_t sub_22D6AFDD0()
{
  uint64_t v8 = *(void *)(OUTLINED_FUNCTION_12_6() - 8);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v10 = v9 + *(void *)(v8 + 64);
  OUTLINED_FUNCTION_35_2();
  uint64_t v11 = sub_22D6CC4B8();
  OUTLINED_FUNCTION_1_0(v11);
  uint64_t v13 = v1 + ((v10 + *(unsigned __int8 *)(v12 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return sub_22D6AE074(v0, v1 + v9, v13, v3, v4, v5, v6, v7, v2);
}

uint64_t sub_22D6AFEB8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_35_1();
  v4();
  return a2;
}

uint64_t sub_22D6AFF10(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t _s25LibrarySectionContentViewV9ConstantsVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D6AFFA0()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D6B06F8()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_12_6()
{
  return _s25LibrarySectionContentViewVMa();
}

uint64_t OUTLINED_FUNCTION_15_6()
{
  return sub_22D6CC5A8();
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
  return sub_22D6A705C(v1);
}

uint64_t OUTLINED_FUNCTION_18_4()
{
  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_19_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25_5()
{
  return sub_22D6CC058();
}

uint64_t OUTLINED_FUNCTION_26_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27_4()
{
  return swift_task_dealloc();
}

__n128 OUTLINED_FUNCTION_29_4()
{
  return *(__n128 *)(v0 + *(int *)(v1 + 84));
}

uint64_t OUTLINED_FUNCTION_30_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31_4@<X0>(uint64_t a1@<X8>)
{
  return __swift_getEnumTagSinglePayload(v2 + a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_32_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33_3()
{
  return sub_22D6CB088();
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_38_2()
{
  sub_22D5DB9FC(*(void *)(v1 + *(int *)(v0 + 96)));
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_39_2()
{
  return swift_release();
}

void *sub_22D6B095C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char *a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, const void *a12)
{
  char v16 = *a6;
  long long v24 = *(_OWORD *)(a6 + 8);
  uint64_t v17 = *((void *)a6 + 3);
  uint64_t v18 = (int *)_s12ItemShelfRowVMa();
  uint64_t v19 = (char *)a9 + v18[13];
  sub_22D6CC4B8();
  OUTLINED_FUNCTION_7();
  (*(void (**)(char *, uint64_t))(v20 + 32))(v19, a1);
  uint64_t v21 = (void *)((char *)a9 + v18[14]);
  *uint64_t v21 = a2;
  v21[1] = a3;
  v21[2] = a4;
  *((unsigned char *)a9 + v18[15]) = a5;
  uint64_t v22 = (char *)a9 + v18[16];
  *uint64_t v22 = v16;
  *(_OWORD *)(v22 + 8) = v24;
  *((void *)v22 + 3) = v17;
  *((unsigned char *)a9 + v18[17]) = a7;
  uint64_t result = memcpy((char *)a9 + v18[18], a12, 0x58uLL);
  *a9 = a8;
  a9[1] = a10;
  a9[2] = a11;
  return result;
}

uint64_t _s12ItemShelfRowVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D6B0AD4()
{
  uint64_t result = sub_22D6CC4B8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_22D6B0BA0(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    unint64_t v7 = a1;
    uint64_t v8 = a2[2];
    a1[1] = a2[1];
    a1[2] = v8;
    uint64_t v9 = a3[13];
    unint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_22D6CC4B8();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_retain();
    swift_retain();
    v13(v10, v11, v12);
    uint64_t v14 = a3[14];
    uint64_t v15 = a3[15];
    char v16 = (void *)((char *)v7 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *char v16 = *v17;
    v16[1] = v18;
    v16[2] = v17[2];
    *((unsigned char *)v7 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v19 = a3[16];
    uint64_t v20 = (char *)v7 + v19;
    uint64_t v21 = (char *)a2 + v19;
    *uint64_t v20 = *v21;
    uint64_t v22 = *((void *)v21 + 2);
    *((void *)v20 + 1) = *((void *)v21 + 1);
    *((void *)v20 + 2) = v22;
    unint64_t v23 = *((void *)v21 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_22D5DB288(v23);
    *((void *)v20 + 3) = v23;
    uint64_t v24 = a3[18];
    *((unsigned char *)v7 + a3[17]) = *((unsigned char *)a2 + a3[17]);
    memcpy((char *)v7 + v24, (char *)a2 + v24, 0x58uLL);
  }
  return v7;
}

unint64_t sub_22D6B0D30(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 52);
  uint64_t v5 = sub_22D6CC4B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 64);
  swift_bridgeObjectRelease();
  unint64_t v7 = *(void *)(v6 + 24);
  return sub_22D5DB9FC(v7);
}

void *sub_22D6B0DF4(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[13];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22D6CC4B8();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_retain();
  swift_retain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[14];
  uint64_t v13 = a3[15];
  uint64_t v14 = (void *)((char *)a1 + v12);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  v14[2] = v15[2];
  *((unsigned char *)a1 + v13) = *((unsigned char *)a2 + v13);
  uint64_t v17 = a3[16];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *uint64_t v18 = *v19;
  uint64_t v20 = *((void *)v19 + 2);
  *((void *)v18 + 1) = *((void *)v19 + 1);
  *((void *)v18 + 2) = v20;
  unint64_t v21 = *((void *)v19 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22D5DB288(v21);
  *((void *)v18 + 3) = v21;
  uint64_t v22 = a3[18];
  *((unsigned char *)a1 + a3[17]) = *((unsigned char *)a2 + a3[17]);
  memcpy((char *)a1 + v22, (char *)a2 + v22, 0x58uLL);
  return a1;
}

void *sub_22D6B0F38(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  uint64_t v6 = a3[13];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22D6CC4B8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[14];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v11 + 2) = *((void *)v12 + 2);
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  uint64_t v13 = a3[16];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *uint64_t v14 = *((unsigned char *)a2 + v13);
  *((void *)v14 + 1) = *(void *)((char *)a2 + v13 + 8);
  *((void *)v14 + 2) = *(void *)((char *)a2 + v13 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v16 = *((void *)v15 + 3);
  sub_22D5DB288(v16);
  unint64_t v17 = *((void *)v14 + 3);
  *((void *)v14 + 3) = v16;
  sub_22D5DB9FC(v17);
  *((unsigned char *)a1 + a3[17]) = *((unsigned char *)a2 + a3[17]);
  uint64_t v18 = a3[18];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  *(void *)uint64_t v19 = *(void *)v20;
  *((void *)v19 + 1) = *((void *)v20 + 1);
  *((void *)v19 + 2) = *((void *)v20 + 2);
  *((void *)v19 + 3) = *((void *)v20 + 3);
  *((void *)v19 + 4) = *((void *)v20 + 4);
  *((void *)v19 + 5) = *((void *)v20 + 5);
  *((void *)v19 + 6) = *((void *)v20 + 6);
  v19[56] = v20[56];
  *((void *)v19 + 8) = *((void *)v20 + 8);
  *((void *)v19 + 9) = *((void *)v20 + 9);
  *((void *)v19 + 10) = *((void *)v20 + 10);
  return a1;
}

uint64_t sub_22D6B110C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[13];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_22D6CC4B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[14];
  uint64_t v11 = a3[15];
  uint64_t v12 = a1 + v10;
  uint64_t v13 = (long long *)(a2 + v10);
  long long v14 = *v13;
  *(void *)(v12 + 16) = *((void *)v13 + 2);
  LOBYTE(v13) = *(unsigned char *)(a2 + v11);
  *(_OWORD *)uint64_t v12 = v14;
  *(unsigned char *)(a1 + v11) = (_BYTE)v13;
  uint64_t v15 = a3[16];
  uint64_t v16 = a3[17];
  unint64_t v17 = (_OWORD *)(a1 + v15);
  uint64_t v18 = (long long *)(a2 + v15);
  long long v19 = *v18;
  long long v20 = v18[1];
  LOBYTE(v18) = *(unsigned char *)(a2 + v16);
  *unint64_t v17 = v19;
  v17[1] = v20;
  *(unsigned char *)(a1 + v16) = (_BYTE)v18;
  memcpy((void *)(a1 + a3[18]), (const void *)(a2 + a3[18]), 0x58uLL);
  return a1;
}

void *sub_22D6B1200(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  uint64_t v6 = a3[13];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22D6CC4B8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[14];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_bridgeObjectRelease();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[15];
  uint64_t v14 = a3[16];
  char v15 = *((unsigned char *)a2 + v13);
  *((void *)v11 + 2) = *((void *)v12 + 2);
  *((unsigned char *)a1 + v13) = v15;
  uint64_t v16 = (char *)a1 + v14;
  unint64_t v17 = (char *)a2 + v14;
  *uint64_t v16 = *((unsigned char *)a2 + v14);
  uint64_t v18 = *(void *)((char *)a2 + v14 + 16);
  *((void *)v16 + 1) = *(void *)((char *)a2 + v14 + 8);
  *((void *)v16 + 2) = v18;
  swift_bridgeObjectRelease();
  unint64_t v19 = *((void *)v16 + 3);
  *((void *)v16 + 3) = *((void *)v17 + 3);
  sub_22D5DB9FC(v19);
  uint64_t v20 = a3[18];
  *((unsigned char *)a1 + a3[17]) = *((unsigned char *)a2 + a3[17]);
  unint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  *(_OWORD *)unint64_t v21 = *(_OWORD *)v22;
  *((void *)v21 + 2) = *((void *)v22 + 2);
  *((void *)v21 + 3) = *((void *)v22 + 3);
  *((_OWORD *)v21 + 2) = *((_OWORD *)v22 + 2);
  *((void *)v21 + 6) = *((void *)v22 + 6);
  v21[56] = v22[56];
  *((_OWORD *)v21 + 4) = *((_OWORD *)v22 + 4);
  *((void *)v21 + 10) = *((void *)v22 + 10);
  return a1;
}

uint64_t sub_22D6B137C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D6B1390);
}

uint64_t sub_22D6B1390(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_22D6CC4B8();
    uint64_t v9 = a1 + *(int *)(a3 + 52);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22D6B1424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D6B1438);
}

uint64_t sub_22D6B1438(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22D6CC4B8();
    uint64_t v8 = v5 + *(int *)(a4 + 52);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_22D6B14C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D6B1508()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26857DBE0);
  sub_22D6CC138();
  return v1;
}

uint64_t sub_22D6B155C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = sub_22D6CB0D8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v39 = v4;
  MEMORY[0x270FA5388](v5);
  uint64_t v32 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD50);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  uint64_t v8 = a1[2];
  uint64_t v36 = a1[3];
  uint64_t v37 = v8;
  unint64_t v9 = a1[5];
  uint64_t v35 = a1[4];
  uint64_t v33 = a1;
  unint64_t v34 = v9;
  uint64_t v47 = v8;
  uint64_t v48 = v36;
  uint64_t v49 = v35;
  unint64_t v50 = v9;
  _s13ItemShelfCellVMa();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857E730);
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857C070);
  sub_22D6CB088();
  swift_getTupleTypeMetadata2();
  uint64_t v10 = sub_22D6CC2C8();
  unint64_t v11 = sub_22D692990();
  uint64_t v47 = v7;
  uint64_t v48 = MEMORY[0x263F8D6C8];
  uint64_t v49 = v10;
  unint64_t v50 = v11;
  uint64_t v51 = MEMORY[0x263F8D6D8];
  sub_22D6CC1A8();
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v12 = sub_22D6CC0E8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v31 = v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v15 = swift_getWitnessTable();
  uint64_t v16 = sub_22D6B2F64(&qword_26857AF48, MEMORY[0x263F18FD0]);
  uint64_t v47 = v12;
  uint64_t v48 = v3;
  uint64_t v49 = v15;
  unint64_t v50 = v16;
  uint64_t v29 = MEMORY[0x263F1A938];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_1();
  uint64_t v30 = v18;
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v29 - v23;
  sub_22D6CB458();
  uint64_t v41 = v37;
  uint64_t v42 = v36;
  uint64_t v43 = v35;
  unint64_t v44 = v34;
  uint64_t v45 = v38;
  sub_22D6CC0D8();
  sub_22D6CB0C8();
  sub_22D6CBB98();
  OUTLINED_FUNCTION_22();
  v25();
  OUTLINED_FUNCTION_22();
  v26();
  uint64_t v47 = v12;
  uint64_t v48 = v3;
  uint64_t v49 = v15;
  unint64_t v50 = v16;
  swift_getOpaqueTypeConformance2();
  sub_22D6B8B10(v22, OpaqueTypeMetadata2);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v30 + 8);
  v27(v22, OpaqueTypeMetadata2);
  sub_22D6B8B10(v24, OpaqueTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v27)(v24, OpaqueTypeMetadata2);
}

uint64_t sub_22D6B19B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v41 = a6;
  uint64_t v43 = a2;
  uint64_t v44 = a3;
  uint64_t v36 = a2;
  uint64_t v37 = a3;
  uint64_t v45 = a4;
  unint64_t v46 = a5;
  uint64_t v38 = a4;
  unint64_t v39 = a5;
  uint64_t v10 = _s12ItemShelfRowVMa();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v35 = (char *)&KeyPath - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857DD50);
  uint64_t v34 = v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  uint64_t v43 = a2;
  uint64_t v44 = a3;
  uint64_t v45 = a4;
  unint64_t v46 = a5;
  _s13ItemShelfCellVMa();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857E730);
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857C070);
  sub_22D6CB088();
  swift_getTupleTypeMetadata2();
  uint64_t v14 = sub_22D6CC2C8();
  unint64_t v33 = sub_22D692990();
  uint64_t v43 = v13;
  uint64_t v44 = MEMORY[0x263F8D6C8];
  uint64_t v45 = v14;
  unint64_t v46 = v33;
  uint64_t v47 = MEMORY[0x263F8D6D8];
  uint64_t v15 = sub_22D6CC1A8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&KeyPath - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&KeyPath - v20;
  uint64_t v22 = v40;
  uint64_t v23 = *(void *)(*(void *)(v40 + *(int *)(v10 + 56)) + 16);
  uint64_t v43 = 0;
  uint64_t v44 = v23;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v24 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v35, v22, v10);
  unint64_t v25 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v26 = (char *)swift_allocObject();
  uint64_t v27 = v37;
  *((void *)v26 + 2) = v36;
  *((void *)v26 + 3) = v27;
  unint64_t v28 = v39;
  *((void *)v26 + 4) = v38;
  *((void *)v26 + 5) = v28;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v26[v25], v24, v10);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_22D6CC188();
  uint64_t v42 = WitnessTable;
  swift_getWitnessTable();
  sub_22D6B8B10(v19, v15);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v16 + 8);
  v29(v19, v15);
  sub_22D6B8B10(v21, v15);
  return ((uint64_t (*)(char *, uint64_t))v29)(v21, v15);
}

uint64_t sub_22D6B1D7C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v124 = a2;
  uint64_t v122 = a7;
  uint64_t v120 = sub_22D6CB108();
  MEMORY[0x270FA5388](v120);
  uint64_t v118 = (char *)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_22D6CC218();
  uint64_t v105 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  uint64_t v103 = (char *)&v97 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E738);
  uint64_t v14 = MEMORY[0x270FA5388](v114);
  uint64_t v115 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = *(void *)(a3 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v101 = (char *)&v97 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v126 = (uint64_t)&v97 - v18;
  uint64_t v127 = a4;
  uint64_t v131 = a3;
  uint64_t v132 = (char *)a4;
  uint64_t v133 = a5;
  unint64_t v134 = a6;
  uint64_t v19 = _s13ItemShelfCellVMa();
  uint64_t v107 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v125 = (uint64_t)&v97 - v20;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857E730);
  uint64_t v109 = v19;
  uint64_t v21 = sub_22D6CB088();
  uint64_t v112 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v111 = (char *)&v97 - v22;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857C070);
  uint64_t v113 = v21;
  uint64_t v121 = sub_22D6CB088();
  uint64_t v116 = *(void *)(v121 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v121);
  uint64_t v119 = (char *)&v97 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v110 = (char *)&v97 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v117 = (char *)&v97 - v27;
  uint64_t v28 = sub_22D6CC178();
  uint64_t v29 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v97 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B040);
  MEMORY[0x270FA5388](v32);
  uint64_t v34 = (char *)&v97 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BD60);
  uint64_t v35 = MEMORY[0x270FA5388](v104);
  uint64_t v108 = (uint64_t)&v97 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  uint64_t v38 = (char *)&v97 - v37;
  unint64_t v39 = *a1;
  unint64_t v123 = (char *)&v97 - v37;
  if (v39)
  {
    sub_22D6CC168();
    char v40 = sub_22D6CB8E8();
    uint64_t v131 = a3;
    uint64_t v132 = (char *)v127;
    uint64_t v133 = a5;
    unint64_t v134 = a6;
    _s12ItemShelfRowVMa();
    sub_22D6CADB8();
    uint64_t v42 = v41;
    uint64_t v44 = v43;
    uint64_t v46 = v45;
    uint64_t v48 = v47;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v34, v31, v28);
    uint64_t v49 = &v34[*(int *)(v32 + 36)];
    *uint64_t v49 = v40;
    uint64_t v38 = v123;
    *((void *)v49 + 1) = v42;
    *((void *)v49 + 2) = v44;
    *((void *)v49 + 3) = v46;
    *((void *)v49 + 4) = v48;
    v49[40] = 0;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v28);
    sub_22D69985C((uint64_t)v34, (uint64_t)v38);
    uint64_t v50 = 0;
  }
  else
  {
    uint64_t v50 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v38, v50, 1, v32);
  uint64_t v131 = a3;
  uint64_t v132 = (char *)v127;
  uint64_t v133 = a5;
  unint64_t v134 = a6;
  uint64_t result = _s12ItemShelfRowVMa();
  if ((v39 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v52 = (int *)result;
  uint64_t v53 = a3;
  unint64_t v100 = a6;
  uint64_t v54 = v124;
  uint64_t v55 = (uint64_t *)(v124 + *(int *)(result + 56));
  uint64_t v56 = *v55;
  if (v39 >= *(void *)(*v55 + 16))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v98 = v124 + *(int *)(result + 56);
  uint64_t v99 = a5;
  sub_22D6CC4B8();
  sub_22D6CC4D8();
  uint64_t v57 = v54 + v52[16];
  uint64_t v58 = *(char **)(v57 + 8);
  uint64_t result = *(void *)(v57 + 16);
  unint64_t v59 = *(void *)(v57 + 24);
  LOBYTE(v131) = *(unsigned char *)v57;
  uint64_t v132 = v58;
  uint64_t v133 = result;
  unint64_t v134 = v59;
  if (v39 >= *(void *)(v56 + 16))
  {
LABEL_12:
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  sub_22D5DB288(v59);
  uint64_t v60 = (uint64_t)v101;
  sub_22D6CC4D8();
  uint64_t v61 = v127;
  uint64_t v97 = sub_22D6B29A4(v60, *(unsigned char *)(v54 + v52[17]), v53);
  uint64_t v63 = v62;
  (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v60, v53);
  uint64_t v64 = *(void *)(v98 + 16);
  LOBYTE(v60) = *(unsigned char *)(v54 + v52[15]);
  uint64_t v65 = sub_22D6B1508();
  sub_22D686FD8(v126, (char *)&v131, v97, v63, v60, v64, 0, v65, v125, v66, v67, v61, v53);
  uint64_t v68 = v103;
  sub_22D6CC208();
  uint64_t v69 = v54 + v52[18];
  int v70 = *(unsigned __int8 *)(v69 + 56);
  uint64_t v71 = v105;
  uint64_t v72 = (uint64_t)v115;
  uint64_t v73 = v106;
  (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v115, v68, v106);
  float v74 = 0.0;
  if (v70) {
    float v74 = 1.0;
  }
  *(float *)(v72 + *(int *)(v114 + 36)) = v74;
  (*(void (**)(char *, uint64_t))(v71 + 8))(v68, v73);
  uint64_t v75 = *(void *)(v69 + 72);
  uint64_t v76 = v118;
  char v77 = &v118[*(int *)(v120 + 20)];
  uint64_t v78 = *MEMORY[0x263F19860];
  uint64_t v79 = sub_22D6CB3F8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v79 - 8) + 104))(v77, v78, v79);
  *uint64_t v76 = v75;
  v76[1] = v75;
  uint64_t v80 = v109;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_22D5DCE80(&qword_26857E740, &qword_26857E738);
  sub_22D6B2F64(&qword_26857E748, MEMORY[0x263F19048]);
  uint64_t v82 = v111;
  uint64_t v83 = v125;
  sub_22D6CBB48();
  sub_22D6055A0((uint64_t)v76);
  sub_22D5DD960(v72, &qword_26857E738);
  (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v83, v80);
  uint64_t v84 = sub_22D5DCE80(&qword_26857E750, &qword_26857E730);
  v130[4] = WitnessTable;
  v130[5] = v84;
  uint64_t v85 = v113;
  uint64_t v86 = swift_getWitnessTable();
  sub_22D677CA8();
  sub_22D5DADC8();
  uint64_t v87 = v110;
  sub_22D6CBC28();
  (*(void (**)(char *, uint64_t))(v112 + 8))(v82, v85);
  uint64_t v88 = sub_22D5DCE80(&qword_26857C068, &qword_26857C070);
  v130[2] = v86;
  v130[3] = v88;
  uint64_t v89 = v121;
  uint64_t v90 = swift_getWitnessTable();
  uint64_t v91 = v117;
  sub_22D6B8B10(v87, v89);
  uint64_t v92 = v116;
  uint64_t v93 = *(void (**)(char *, uint64_t))(v116 + 8);
  v93(v87, v89);
  uint64_t v94 = (uint64_t)v123;
  uint64_t v95 = v108;
  sub_22D699BA0((uint64_t)v123, v108);
  uint64_t v131 = v95;
  uint64_t v96 = v119;
  (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v119, v91, v89);
  uint64_t v132 = v96;
  v130[0] = v104;
  v130[1] = v89;
  unint64_t v128 = sub_22D699C08();
  uint64_t v129 = v90;
  sub_22D634638((uint64_t)&v131, 2, (uint64_t)v130);
  v93(v91, v89);
  sub_22D5DD960(v94, &qword_26857BD60);
  v93(v96, v89);
  return sub_22D5DD960(v95, &qword_26857BD60);
}

uint64_t sub_22D6B29A4(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857CF28);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  unint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22D6CCA28();
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = 0;
  if ((a2 & 1) == 0) {
    return v17;
  }
  uint64_t v18 = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, a3);
  if ((swift_dynamicCast() & 1) == 0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v13);
    sub_22D5DD960((uint64_t)v9, &qword_26857CF28);
    return 0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v13);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v16, v9, v13);
  uint64_t v19 = sub_22D6CC9D8();
  if (!v20)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v16, v13);
    return 0;
  }
  uint64_t v21 = v19;
  uint64_t v22 = v20;
  sub_22D693C64();
  uint64_t v25 = v24;
  if (v24)
  {
    uint64_t v32 = v23;
    if (qword_26857AD80 != -1) {
      swift_once();
    }
    sub_22D6CA058();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857AFD8);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_22D6CE9E0;
    uint64_t v27 = MEMORY[0x263F8D310];
    *(void *)(v26 + 56) = MEMORY[0x263F8D310];
    unint64_t v28 = sub_22D604A98();
    *(void *)(v26 + 32) = v21;
    *(void *)(v26 + 40) = v22;
    *(void *)(v26 + 96) = v27;
    *(void *)(v26 + 104) = v28;
    uint64_t v29 = v32;
    *(void *)(v26 + 64) = v28;
    *(void *)(v26 + 72) = v29;
    *(void *)(v26 + 80) = v25;
    uint64_t v17 = sub_22D6CCF28();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v16, v13);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v16, v13);
    swift_bridgeObjectRelease();
    return 0;
  }
  return v17;
}

uint64_t sub_22D6B2D58@<X0>(uint64_t a1@<X8>)
{
  return sub_22D6B19B8(*(void *)(v1 + 48), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_22D6B2D68()
{
  uint64_t v1 = (int *)(_s12ItemShelfRowVMa() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  swift_release();
  swift_release();
  sub_22D6CC4B8();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_22();
  v3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = v2 + v1[18];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v4 + 24));
  return swift_deallocObject();
}

uint64_t sub_22D6B2EA8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  unint64_t v8 = v2[5];
  uint64_t v9 = *(void *)(_s12ItemShelfRowVMa() - 8);
  uint64_t v10 = (uint64_t)v2 + ((*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return sub_22D6B1D7C(a1, v10, v5, v6, v7, v8, a2);
}

uint64_t sub_22D6B2F64(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22D6B2FAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D6B3184@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  _s9ViewModelCMa();
  swift_getWitnessTable();
  *a4 = sub_22D6CB198();
  a4[1] = v8;
  uint64_t v9 = _s11ColumnsViewVMa();
  uint64_t v10 = (uint64_t)a4 + *(int *)(v9 + 36);
  *(void *)(v10 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_26857E758) + 28)) = 0;
  uint64_t result = sub_22D6209A8(a1, v10);
  uint64_t v12 = (uint64_t *)((char *)a4 + *(int *)(v9 + 40));
  *uint64_t v12 = a2;
  v12[1] = a3;
  return result;
}

uint64_t _s11ColumnsViewVMa()
{
  return __swift_instantiateGenericMetadata();
}

void sub_22D6B3270()
{
  sub_22D6B3988();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_22D6B3314(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
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
    uint64_t v8 = *(int *)(a3 + 36);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_22D6CA408();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_retain();
    v12(v9, v10, v11);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(qword_26857E758);
    *(void *)&v9[*(int *)(v13 + 28)] = *(void *)&v10[*(int *)(v13 + 28)];
    uint64_t v14 = *(int *)(a3 + 40);
    uint64_t v15 = (uint64_t *)((char *)v7 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t sub_22D6B3440(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_22D6CA408();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(qword_26857E758);
  swift_release();
  return swift_release();
}

void *sub_22D6B34E8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22D6CA408();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_retain();
  v11(v8, v9, v10);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_26857E758);
  *(void *)&v8[*(int *)(v12 + 28)] = *(void *)&v9[*(int *)(v12 + 28)];
  uint64_t v13 = *(int *)(a3 + 40);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_22D6B35C8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22D6CA408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(qword_26857E758);
  *(void *)&v7[*(int *)(v10 + 28)] = *(void *)&v8[*(int *)(v10 + 28)];
  swift_retain();
  swift_release();
  uint64_t v11 = *(int *)(a3 + 40);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_22D6B36B8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22D6CA408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(qword_26857E758);
  *(void *)&v7[*(int *)(v10 + 28)] = *(void *)&v8[*(int *)(v10 + 28)];
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 40)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 40));
  return a1;
}

void *sub_22D6B3768(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22D6CA408();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(qword_26857E758);
  *(void *)&v7[*(int *)(v10 + 28)] = *(void *)&v8[*(int *)(v10 + 28)];
  swift_release();
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 40)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 40));
  swift_release();
  return a1;
}

uint64_t sub_22D6B383C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D6B3850);
}

uint64_t sub_22D6B3850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26857E758);
  OUTLINED_FUNCTION_3();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 36);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 40));
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_22D6B38E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D6B38F8);
}

void sub_22D6B38F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26857E758);
  OUTLINED_FUNCTION_3();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 36);
    __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 40)) = (a2 - 1);
  }
}

void sub_22D6B3988()
{
  if (!qword_26857E7E0)
  {
    _s12SearchColumnVMa();
    unint64_t v0 = sub_22D6CC058();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26857E7E0);
    }
  }
}

uint64_t sub_22D6B39E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D6B3A24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v55 = a1;
  uint64_t v3 = a1 - 8;
  uint64_t v47 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v52 = v4;
  uint64_t v54 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = _s12SearchColumnVMa();
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_0_3();
  uint64_t v56 = v7;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B5F0);
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E7E8);
  MEMORY[0x270FA5388](v12 - 8);
  OUTLINED_FUNCTION_0();
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E7F0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E7F8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v48 = v20;
  uint64_t v49 = v19;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_0_3();
  uint64_t v22 = v21;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(qword_26857E758);
  sub_22D6CC048();
  uint64_t v53 = v2;
  uint64_t v23 = *(void *)(v3 + 24);
  uint64_t v45 = *(void *)(v3 + 32);
  uint64_t v46 = v23;
  _s9ViewModelCMa();
  swift_getWitnessTable();
  sub_22D6CB168();
  sub_22D650270();
  swift_release();
  sub_22D6B420C(&qword_26857E800, (void (*)(uint64_t))_s12SearchColumnVMa);
  uint64_t v51 = v5;
  sub_22D6CA288();
  uint64_t v24 = *MEMORY[0x263F18D70];
  uint64_t v25 = sub_22D6CB058();
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 104))(v11, v24, v25);
  sub_22D6B420C(&qword_26857B630, MEMORY[0x263F18D80]);
  uint64_t result = sub_22D6CCE68();
  if (result)
  {
    uint64_t v28 = sub_22D5DCE80(&qword_26857E808, &qword_26857E7F0);
    uint64_t v29 = sub_22D5DCE80(&qword_26857B668, &qword_26857B5F0);
    uint64_t v42 = v22;
    uint64_t v30 = v44;
    uint64_t v31 = v50;
    sub_22D6CBC58();
    sub_22D6B3FF8(v11);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v30);
    uint64_t v32 = v56;
    sub_22D6CC028();
    uint64_t v33 = v47;
    uint64_t v34 = v54;
    uint64_t v35 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v54, v53, v55);
    unint64_t v36 = (*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
    uint64_t v37 = swift_allocObject();
    uint64_t v38 = v45;
    *(void *)(v37 + 16) = v46;
    *(void *)(v37 + 24) = v38;
    (*(void (**)(unint64_t, char *, uint64_t))(v33 + 32))(v37 + v36, v34, v35);
    uint64_t v58 = v30;
    uint64_t v59 = v31;
    uint64_t v60 = v28;
    uint64_t v61 = v29;
    swift_getOpaqueTypeConformance2();
    sub_22D6B420C(&qword_26857C710, (void (*)(uint64_t))_s12SearchColumnVMa);
    uint64_t v39 = v49;
    uint64_t v40 = v42;
    sub_22D6CBE78();
    swift_release();
    sub_22D63BFA8(v32);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v48 + 8))(v40, v39);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22D6B3FA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = _s11ColumnsViewVMa();
  return (*(uint64_t (**)(uint64_t))(a3 + *(int *)(v5 + 40)))(a2);
}

uint64_t sub_22D6B3FF8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B5F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D6B4058()
{
  uint64_t v1 = (int *)(_s11ColumnsViewVMa() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  swift_release();
  uint64_t v3 = v2 + v1[11];
  sub_22D6CA408();
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t))(v4 + 8))(v3);
  __swift_instantiateConcreteTypeFromMangledName(qword_26857E758);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D6B4170(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(_s11ColumnsViewVMa() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_22D6B3FA0(a1, a2, v6);
}

uint64_t sub_22D6B420C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22D6B4254()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D6B43A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  *(unsigned char *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = a4;
  *(void *)(a7 + 32) = a5;
  *(unsigned char *)(a7 + 40) = a6;
  _s9ViewModelCMa();
  swift_getWitnessTable();
  *(void *)(a7 + 48) = sub_22D6CB198();
  *(void *)(a7 + 56) = v8;
  *(void *)(a7 + 64) = swift_getKeyPath();
  *(unsigned char *)(a7 + 104) = 0;
  *(void *)(a7 + 112) = swift_getKeyPath();
  *(unsigned char *)(a7 + 120) = 0;
  uint64_t v9 = (uint64_t *)(a7 + *(int *)(_s11ContentViewVMa() + 52));
  *uint64_t v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E810);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_22D6B44A0()
{
  return sub_22D6CC128();
}

uint64_t sub_22D6B44F4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(qword_26857C988);
  MEMORY[0x230F88070](&v2, v0);
  return v2;
}

uint64_t sub_22D6B4544@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v69 = a2;
  OUTLINED_FUNCTION_0_14();
  uint64_t v67 = v4;
  uint64_t v68 = *(void *)(v5 + 64);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = *(void *)(v7 + 24);
  uint64_t v66 = *(void *)(v7 + 16);
  int v70 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = v9;
  _s15LandingPageViewVMa();
  _s17SearchResultsViewVMa();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857AF18);
  OUTLINED_FUNCTION_36();
  sub_22D6CB088();
  sub_22D6CD328();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v83 = MEMORY[0x263F18C10];
  uint64_t v10 = swift_getWitnessTable();
  unint64_t v11 = sub_22D6B6150();
  uint64_t v80 = v10;
  unint64_t v81 = v11;
  uint64_t v79 = swift_getWitnessTable();
  swift_getWitnessTable();
  OUTLINED_FUNCTION_36();
  sub_22D6CB148();
  uint64_t v12 = sub_22D6CB088();
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v14 = swift_getWitnessTable();
  uint64_t v77 = v13;
  uint64_t v78 = v14;
  uint64_t v15 = swift_getWitnessTable();
  uint64_t v73 = v12;
  uint64_t v74 = MEMORY[0x263F8D4F8];
  uint64_t v55 = v12;
  uint64_t v16 = MEMORY[0x263F8D4F8];
  uint64_t v75 = v15;
  uint64_t v76 = MEMORY[0x263F8D510];
  uint64_t v17 = v15;
  uint64_t v56 = v15;
  uint64_t v18 = MEMORY[0x263F8D510];
  uint64_t v62 = MEMORY[0x263F1B260];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v61 = OpaqueTypeMetadata2;
  OUTLINED_FUNCTION_0_14();
  uint64_t v65 = v20;
  MEMORY[0x270FA5388](v21);
  uint64_t v57 = (char *)v53 - v22;
  uint64_t v73 = v12;
  uint64_t v74 = v16;
  uint64_t v75 = v17;
  uint64_t v76 = v18;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v73 = OpaqueTypeMetadata2;
  uint64_t v74 = v16;
  uint64_t v75 = OpaqueTypeConformance2;
  uint64_t v76 = v18;
  swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_14();
  uint64_t v63 = v23;
  uint64_t v64 = v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v58 = (char *)v53 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v59 = (char *)v53 - v27;
  uint64_t v28 = v2;
  sub_22D6B4B7C();
  uint64_t v29 = *(void *)(v2 + 112);
  LOBYTE(v16) = *(unsigned char *)(v28 + 120);
  v53[0] = v28;
  sub_22D5DB870(v29, v16);
  LOBYTE(OpaqueTypeMetadata2) = sub_22D6B9208(v29, v16);
  sub_22D5DBA20(v29, v16);
  char v72 = OpaqueTypeMetadata2 & 1;
  uint64_t v30 = v67;
  uint64_t v54 = *(void (**)(char *, uint64_t, uint64_t))(v67 + 16);
  uint64_t v31 = v70;
  uint64_t v32 = a1;
  v54(v70, v28, a1);
  uint64_t v33 = *(unsigned __int8 *)(v30 + 80);
  uint64_t v34 = (v33 + 32) & ~v33;
  v68 += v34;
  v53[1] = v33 | 7;
  uint64_t v35 = swift_allocObject();
  uint64_t v36 = v66;
  uint64_t v37 = v71;
  *(void *)(v35 + 16) = v66;
  *(void *)(v35 + 24) = v37;
  uint64_t v67 = *(void *)(v30 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v67)(v35 + v34, v31, v32);
  swift_checkMetadataState();
  sub_22D6CBE78();
  swift_release();
  OUTLINED_FUNCTION_22();
  v38();
  uint64_t v39 = v53[0];
  LOBYTE(v73) = sub_22D6B44F4() & 1;
  uint64_t v40 = v70;
  v54(v70, v39, v32);
  uint64_t v41 = swift_allocObject();
  uint64_t v42 = v71;
  *(void *)(v41 + 16) = v36;
  *(void *)(v41 + 24) = v42;
  ((void (*)(uint64_t, char *, uint64_t))v67)(v41 + v34, v40, v32);
  uint64_t v43 = v58;
  uint64_t v45 = OpaqueTypeConformance2;
  uint64_t v44 = v61;
  uint64_t v46 = MEMORY[0x263F8D4F8];
  uint64_t v47 = MEMORY[0x263F8D510];
  sub_22D6CBE78();
  swift_release();
  OUTLINED_FUNCTION_22();
  v48();
  uint64_t v73 = v44;
  uint64_t v74 = v46;
  uint64_t v75 = v45;
  uint64_t v76 = v47;
  swift_getOpaqueTypeConformance2();
  uint64_t v49 = v59;
  uint64_t v50 = v63;
  sub_22D6B8B10(v43, v63);
  uint64_t v51 = *(void (**)(char *, uint64_t))(v64 + 8);
  v51(v43, v50);
  sub_22D6B8B10(v49, v50);
  return ((uint64_t (*)(char *, uint64_t))v51)(v49, v50);
}

uint64_t sub_22D6B4B7C()
{
  sub_22D626C94((uint64_t)v5);
  uint64_t v0 = _s15LandingPageViewVMa();
  _s17SearchResultsViewVMa();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857AF18);
  sub_22D6CB088();
  sub_22D6CD328();
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6B6150();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D617C44();
  sub_22D6CBDF8();
  (*(void (**)(unsigned char *, uint64_t))(*(void *)(v0 - 8) + 8))(v5, v0);
  sub_22D6CB148();
  uint64_t v1 = sub_22D6CB088();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6B8B10(v4, v1);
  uint64_t v2 = *(void (**)(unsigned char *, uint64_t))(*(void *)(v1 - 8) + 8);
  v2(v4, v1);
  sub_22D6B8B10(v5, v1);
  return ((uint64_t (*)(unsigned char *, uint64_t))v2)(v5, v1);
}

uint64_t sub_22D6B4E40()
{
  return sub_22D6B44A0();
}

uint64_t sub_22D6B4E68()
{
  uint64_t v0 = sub_22D6CB438();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s11ContentViewVMa();
  sub_22D6B9874((uint64_t)v3);
  sub_22D6CB428();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_22D6B4F5C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 112);
  char v2 = *(unsigned char *)(a1 + 120);
  sub_22D5DB870(v1, v2);
  char v3 = sub_22D6B9208(v1, v2);
  sub_22D5DBA20(v1, v2);
  uint64_t v4 = MEMORY[0x263F18C10];
  if (v3)
  {
    sub_22D613410((uint64_t)v19);
    sub_22D6CB8C8();
    uint64_t v5 = _s17SearchResultsViewVMa();
    uint64_t WitnessTable = swift_getWitnessTable();
    sub_22D6CBE28();
    (*(void (**)(unsigned char *, uint64_t))(*(void *)(v5 - 8) + 8))(v19, v5);
    if (qword_26857AD40 != -1) {
      swift_once();
    }
    v17[0] = qword_268585048;
    uint64_t v7 = sub_22D6CB088();
    v17[49] = WitnessTable;
    v17[50] = v4;
    swift_retain();
    uint64_t v8 = swift_getWitnessTable();
    sub_22D6CB8B8();
    sub_22D6CBB38();
    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(*(void *)(v7 - 8) + 8))(v18, v7);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857AF18);
    uint64_t v9 = sub_22D6CB088();
    v17[47] = v8;
    v17[48] = sub_22D6B6150();
    swift_getWitnessTable();
    sub_22D6B8B10(v19, v9);
    uint64_t v10 = *(void (**)(unsigned char *, uint64_t))(*(void *)(v9 - 8) + 8);
    v10(v19, v9);
    sub_22D6B8B10(v18, v9);
    v10(v18, v9);
    sub_22D627E64((uint64_t)v17, (uint64_t)v19);
    uint64_t v11 = sub_22D6CD328();
    (*(void (**)(void *, uint64_t))(*(void *)(v11 - 8) + 8))(v17, v11);
  }
  else
  {
    _s17SearchResultsViewVMa();
    sub_22D6CB088();
    bzero(v18, 0x171uLL);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857AF18);
    sub_22D6CB088();
    v17[58] = swift_getWitnessTable();
    v17[59] = v4;
    v17[56] = swift_getWitnessTable();
    v17[57] = sub_22D6B6150();
    swift_getWitnessTable();
    sub_22D627E64((uint64_t)v18, (uint64_t)v19);
    uint64_t v12 = sub_22D6CD328();
    (*(void (**)(unsigned char *, uint64_t))(*(void *)(v12 - 8) + 8))(v18, v12);
  }
  _s17SearchResultsViewVMa();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857AF18);
  sub_22D6CB088();
  uint64_t v13 = sub_22D6CD328();
  v17[54] = swift_getWitnessTable();
  v17[55] = v4;
  uint64_t v14 = swift_getWitnessTable();
  unint64_t v15 = sub_22D6B6150();
  v17[52] = v14;
  v17[53] = v15;
  v17[51] = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6B8B10(v19, v13);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(*(void *)(v13 - 8) + 8))(v19, v13);
}

uint64_t sub_22D6B5490@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22D6CB1D8();
  *a1 = result & 1;
  return result;
}

uint64_t _s11ContentViewVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22D6B54D8()
{
  return sub_22D6CB208();
}

void sub_22D6B54FC()
{
  sub_22D6B60B0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_22D6B55B4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v8;
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    uint64_t v10 = a2 + 8;
    char v11 = *((unsigned char *)a2 + 104);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    if (v11)
    {
      uint64_t v12 = (_OWORD *)(a1 + 64);
      uint64_t v13 = a2[11];
      if (v13)
      {
        uint64_t v14 = a2[12];
        *(void *)(a1 + 88) = v13;
        *(void *)(a1 + 96) = v14;
        (**(void (***)(_OWORD *, uint64_t))(v13 - 8))(v12, (uint64_t)v10);
      }
      else
      {
        long long v15 = *((_OWORD *)v10 + 1);
        *uint64_t v12 = *(_OWORD *)v10;
        *(_OWORD *)(a1 + 80) = v15;
        *(void *)(a1 + 96) = v10[4];
      }
      *(unsigned char *)(a1 + 104) = 1;
    }
    else
    {
      *(void *)(a1 + 64) = *v10;
      *(unsigned char *)(a1 + 104) = 0;
      swift_retain();
    }
    uint64_t v16 = a2[14];
    char v17 = *((unsigned char *)a2 + 120);
    sub_22D5DB870(v16, v17);
    *(void *)(a1 + 112) = v16;
    *(unsigned char *)(a1 + 120) = v17;
    uint64_t v18 = *(int *)(a3 + 52);
    uint64_t v19 = (void *)(a1 + v18);
    uint64_t v20 = (uint64_t *)((char *)a2 + v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857E810);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = sub_22D6CB438();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    }
    else
    {
      void *v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_22D6B57CC(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (*(unsigned char *)(a1 + 104))
  {
    if (*(void *)(a1 + 88)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 64);
    }
  }
  else
  {
    swift_release();
  }
  sub_22D5DBA20(*(void *)(a1 + 112), *(unsigned char *)(a1 + 120));
  uint64_t v4 = a1 + *(int *)(a2 + 52);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E810);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_22D6CB438();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_22D6B58D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = a2 + 64;
  char v10 = *(unsigned char *)(a2 + 104);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v10)
  {
    char v11 = (_OWORD *)(a1 + 64);
    uint64_t v12 = *(void *)(a2 + 88);
    if (v12)
    {
      uint64_t v13 = *(void *)(a2 + 96);
      *(void *)(a1 + 88) = v12;
      *(void *)(a1 + 96) = v13;
      (**(void (***)(_OWORD *, uint64_t))(v12 - 8))(v11, v9);
    }
    else
    {
      long long v14 = *(_OWORD *)(v9 + 16);
      *char v11 = *(_OWORD *)v9;
      *(_OWORD *)(a1 + 80) = v14;
      *(void *)(a1 + 96) = *(void *)(v9 + 32);
    }
    *(unsigned char *)(a1 + 104) = 1;
  }
  else
  {
    *(void *)(a1 + 64) = *(void *)v9;
    *(unsigned char *)(a1 + 104) = 0;
    swift_retain();
  }
  uint64_t v15 = *(void *)(a2 + 112);
  char v16 = *(unsigned char *)(a2 + 120);
  sub_22D5DB870(v15, v16);
  *(void *)(a1 + 112) = v15;
  *(unsigned char *)(a1 + 120) = v16;
  uint64_t v17 = *(int *)(a3 + 52);
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E810);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_22D6CB438();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  else
  {
    *uint64_t v18 = *v19;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_22D6B5A94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  if (a1 != a2)
  {
    uint64_t v6 = (long long *)(a2 + 64);
    sub_22D692EB0(a1 + 64, qword_26857AE68);
    if (*(unsigned char *)(a2 + 104))
    {
      uint64_t v7 = *(void *)(a2 + 88);
      if (v7)
      {
        *(void *)(a1 + 88) = v7;
        *(void *)(a1 + 96) = *(void *)(a2 + 96);
        (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 64, a2 + 64);
      }
      else
      {
        long long v8 = *v6;
        long long v9 = *(_OWORD *)(a2 + 80);
        *(void *)(a1 + 96) = *(void *)(a2 + 96);
        *(_OWORD *)(a1 + 64) = v8;
        *(_OWORD *)(a1 + 80) = v9;
      }
      *(unsigned char *)(a1 + 104) = 1;
    }
    else
    {
      *(void *)(a1 + 64) = *(void *)v6;
      *(unsigned char *)(a1 + 104) = 0;
      swift_retain();
    }
  }
  uint64_t v10 = *(void *)(a2 + 112);
  char v11 = *(unsigned char *)(a2 + 120);
  sub_22D5DB870(v10, v11);
  uint64_t v12 = *(void *)(a1 + 112);
  char v13 = *(unsigned char *)(a1 + 120);
  *(void *)(a1 + 112) = v10;
  *(unsigned char *)(a1 + 120) = v11;
  sub_22D5DBA20(v12, v13);
  if (a1 != a2)
  {
    uint64_t v14 = *(int *)(a3 + 52);
    uint64_t v15 = (void *)(a1 + v14);
    char v16 = (void *)(a2 + v14);
    sub_22D692EB0(a1 + v14, &qword_26857E810);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857E810);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_22D6CB438();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *uint64_t v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_22D6B5CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 89) = *(_OWORD *)(a2 + 89);
  uint64_t v5 = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  uint64_t v6 = *(int *)(a3 + 52);
  uint64_t v7 = (void *)(a1 + v6);
  long long v8 = (const void *)(a2 + v6);
  *(void *)(a1 + 112) = v5;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E810);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_22D6CB438();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  return a1;
}

uint64_t sub_22D6B5DE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  if (a1 != a2)
  {
    sub_22D692EB0(a1 + 64, qword_26857AE68);
    long long v6 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v6;
    *(_OWORD *)(a1 + 89) = *(_OWORD *)(a2 + 89);
  }
  char v7 = *(unsigned char *)(a2 + 120);
  uint64_t v8 = *(void *)(a1 + 112);
  char v9 = *(unsigned char *)(a1 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = v7;
  sub_22D5DBA20(v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 52);
    char v11 = (void *)(a1 + v10);
    uint64_t v12 = (const void *)(a2 + v10);
    sub_22D692EB0(a1 + v10, &qword_26857E810);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E810);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_22D6CB438();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22D6B5F78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D6B5F8C);
}

uint64_t sub_22D6B5F8C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_26857E818);
    uint64_t v9 = a1 + *(int *)(a3 + 52);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22D6B6018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D6B602C);
}

uint64_t sub_22D6B602C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26857E818);
    uint64_t v8 = v5 + *(int *)(a4 + 52);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_22D6B60B0()
{
  if (!qword_26857E8A0)
  {
    sub_22D6CB438();
    unint64_t v0 = sub_22D6CAE28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26857E8A0);
    }
  }
}

uint64_t sub_22D6B6108()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22D6B6150()
{
  unint64_t result = qword_26857B008;
  if (!qword_26857B008)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857AF18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857B008);
  }
  return result;
}

uint64_t sub_22D6B61A8(uint64_t a1, uint64_t a2)
{
  return sub_22D6B633C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22D6B4E40);
}

uint64_t objectdestroyTm_10()
{
  uint64_t v1 = *(void *)(_s11ContentViewVMa() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v2 + 104))
  {
    if (*(void *)(v2 + 88)) {
      __swift_destroy_boxed_opaque_existential_1(v2 + 64);
    }
  }
  else
  {
    swift_release();
  }
  sub_22D5DBA20(*(void *)(v2 + 112), *(unsigned char *)(v2 + 120));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E810);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D6CB438();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_22();
    v3();
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_22D6B6324(uint64_t a1, uint64_t a2)
{
  return sub_22D6B633C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22D6B4E68);
}

uint64_t sub_22D6B633C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(v3 + 16);
  uint64_t v7 = *(void *)(v3 + 24);
  uint64_t v8 = *(void *)(_s11ContentViewVMa() - 8);
  uint64_t v9 = v3 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a3(a1, a2, v9, v6, v7);
}

uint64_t sub_22D6B63EC()
{
  return sub_22D6B4F5C(*(void *)(v0 + 32));
}

uint64_t sub_22D6B63F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D6B6614(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = v11 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    uint64_t v7 = *(int *)(a3 + 32);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (uint64_t *)((char *)a2 + v7);
    *(void *)(a1 + 72) = a2[9];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(qword_26857E328);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_22D6CB418();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_22D6B6774(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(qword_26857E328);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_22D6CB418();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_22D6B683C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(qword_26857E328);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_22D6CB418();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  else
  {
    *uint64_t v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_22D6B6944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 32);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_22D61324C(a1 + v6, qword_26857E328);
    __swift_instantiateConcreteTypeFromMangledName(qword_26857E328);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_22D6CB418();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_22D6B6AA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v5 = *(int *)(a3 + 32);
  uint64_t v6 = (const void *)(a2 + v5);
  uint64_t v7 = (void *)(a1 + v5);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_26857E328);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_22D6CB418();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v6, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  return a1;
}

uint64_t sub_22D6B6B94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 32);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (const void *)(a2 + v8);
    sub_22D61324C(a1 + v8, qword_26857E328);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_26857E328);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_22D6CB418();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22D6B6CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D6B6CDC);
}

uint64_t sub_22D6B6CDC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E8A8);
    uint64_t v9 = a1 + *(int *)(a3 + 32);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_22D6B6D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D6B6D7C);
}

uint64_t sub_22D6B6D7C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E8A8);
    uint64_t v8 = v5 + *(int *)(a4 + 32);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t _s8MenuCellVMa()
{
  uint64_t result = qword_26857E8B0;
  if (!qword_26857E8B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22D6B6E48()
{
  sub_22D6B6EF4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22D6B6EF4()
{
  if (!qword_26857E8C0)
  {
    sub_22D6CB418();
    unint64_t v0 = sub_22D6CAE28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26857E8C0);
    }
  }
}

uint64_t sub_22D6B6F4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D6B6F68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E8C8);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E8D0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E8D8);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E8E0);
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v19 - v18;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E8E8);
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_0();
  uint64_t v24 = v23 - v22;
  *(void *)uint64_t v5 = sub_22D6CB378();
  *(void *)(v5 + 8) = 0;
  *(unsigned char *)(v5 + 16) = 1;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E8F0);
  sub_22D6B72D8(v1, v5 + *(int *)(v25 + 44));
  sub_22D5DD3A4(v5, v10, &qword_26857E8C8);
  *(unsigned char *)(v10 + *(int *)(v7 + 44)) = 0;
  sub_22D61324C(v5, &qword_26857E8C8);
  sub_22D6CB908();
  sub_22D6CADB8();
  OUTLINED_FUNCTION_1_9();
  sub_22D5DD3A4(v10, v15, &qword_26857E8D0);
  OUTLINED_FUNCTION_3_13(v15 + *(int *)(v12 + 44));
  sub_22D61324C(v10, &qword_26857E8D0);
  sub_22D6CC238();
  sub_22D6CB138();
  sub_22D5DD3A4(v15, v20, &qword_26857E8D8);
  memcpy((void *)(v20 + *(int *)(v16 + 36)), __src, 0x70uLL);
  sub_22D61324C(v15, &qword_26857E8D8);
  sub_22D6CB8A8();
  sub_22D6CADB8();
  OUTLINED_FUNCTION_1_9();
  sub_22D5DD3A4(v20, v24, &qword_26857E8E0);
  OUTLINED_FUNCTION_3_13(v24 + *(int *)(v27 + 36));
  sub_22D61324C(v20, &qword_26857E8E0);
  return sub_22D5DD904(v24, a1, &qword_26857E8E8);
}

uint64_t sub_22D6B72D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v75 = a2;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BA68) - 8;
  MEMORY[0x270FA5388](v66);
  uint64_t v67 = (uint64_t *)((char *)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v65 = sub_22D6CBFD8();
  uint64_t v64 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v62 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BA38);
  MEMORY[0x270FA5388](v76);
  uint64_t v63 = (uint64_t *)((char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D468) - 8;
  MEMORY[0x270FA5388](v70);
  uint64_t v68 = (uint64_t)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E8F8) - 8;
  MEMORY[0x270FA5388](v71);
  uint64_t v69 = (uint64_t)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E900) - 8;
  uint64_t v8 = MEMORY[0x270FA5388](v73);
  uint64_t v72 = (uint64_t)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v74 = (uint64_t)&v59 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E908);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E910);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E918);
  uint64_t v20 = v19 - 8;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v59 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v59 - v24;
  uint64_t v59 = (uint64_t)&v59 - v24;
  uint64_t v61 = a1;
  uint64_t v78 = a1;
  uint64_t v77 = a1;
  sub_22D60F64C();
  sub_22D6CBFF8();
  sub_22D5DCE80(&qword_26857E920, &qword_26857E908);
  sub_22D6B86E4();
  sub_22D6CBB68();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_22D6CC248();
  sub_22D6CAF58();
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v23, v18, v15);
  uint64_t v26 = &v23[*(int *)(v20 + 44)];
  uint64_t v60 = v23;
  long long v27 = v80;
  *(_OWORD *)uint64_t v26 = v79;
  *((_OWORD *)v26 + 1) = v27;
  *((_OWORD *)v26 + 2) = v81;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  sub_22D5DD904((uint64_t)v23, (uint64_t)v25, &qword_26857E918);
  uint64_t v28 = sub_22D6CBF98();
  uint64_t v29 = sub_22D6CBA18();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v31 = v64;
  uint64_t v32 = v62;
  uint64_t v33 = v65;
  (*(void (**)(char *, void, uint64_t))(v64 + 104))(v62, *MEMORY[0x263F1B538], v65);
  uint64_t v34 = swift_getKeyPath();
  uint64_t v35 = v67;
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))((char *)v67 + *(int *)(v66 + 36), v32, v33);
  uint64_t v36 = (uint64_t)v35;
  *uint64_t v35 = v34;
  uint64_t v37 = v63;
  sub_22D5DD3A4(v36, (uint64_t)v63 + *(int *)(v76 + 36), &qword_26857BA68);
  *uint64_t v37 = v28;
  v37[1] = KeyPath;
  void v37[2] = v29;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_22D61324C(v36, &qword_26857BA68);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
  swift_release();
  swift_release();
  swift_release();
  LODWORD(v33) = sub_22D6CB698();
  uint64_t v38 = v68;
  sub_22D5DD3A4((uint64_t)v37, v68, &qword_26857BA38);
  *(_DWORD *)(v38 + *(int *)(v70 + 44)) = v33;
  sub_22D61324C((uint64_t)v37, &qword_26857BA38);
  sub_22D6CC258();
  sub_22D6CAF58();
  uint64_t v39 = v69;
  sub_22D5DD3A4(v38, v69, &qword_26857D468);
  uint64_t v40 = (_OWORD *)(v39 + *(int *)(v71 + 44));
  long long v41 = v83;
  *uint64_t v40 = v82;
  v40[1] = v41;
  v40[2] = v84;
  sub_22D61324C(v38, &qword_26857D468);
  LOBYTE(v33) = sub_22D6CB8A8();
  sub_22D6CADB8();
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v50 = v72;
  sub_22D5DD3A4(v39, v72, &qword_26857E8F8);
  uint64_t v51 = v50 + *(int *)(v73 + 44);
  *(unsigned char *)uint64_t v51 = v33;
  *(void *)(v51 + 8) = v43;
  *(void *)(v51 + 16) = v45;
  *(void *)(v51 + 24) = v47;
  *(void *)(v51 + 32) = v49;
  *(unsigned char *)(v51 + 40) = 0;
  sub_22D61324C(v39, &qword_26857E8F8);
  uint64_t v52 = v74;
  sub_22D5DD904(v50, v74, &qword_26857E900);
  uint64_t v53 = v59;
  uint64_t v54 = (uint64_t)v60;
  sub_22D5DD3A4(v59, (uint64_t)v60, &qword_26857E918);
  sub_22D5DD3A4(v52, v50, &qword_26857E900);
  uint64_t v55 = v75;
  sub_22D5DD3A4(v54, v75, &qword_26857E918);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E930);
  uint64_t v57 = v55 + *(int *)(v56 + 48);
  *(void *)uint64_t v57 = 0;
  *(unsigned char *)(v57 + 8) = 1;
  sub_22D5DD3A4(v50, v55 + *(int *)(v56 + 64), &qword_26857E900);
  sub_22D61324C(v52, &qword_26857E900);
  sub_22D61324C(v53, &qword_26857E918);
  sub_22D61324C(v50, &qword_26857E900);
  return sub_22D61324C(v54, &qword_26857E918);
}

uint64_t sub_22D6B7BCC@<X0>(uint64_t a1@<X8>)
{
  sub_22D604560();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_22D6CBAF8();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  uint64_t v7 = sub_22D6CBA98();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  sub_22D604A88(v2, v4, v6);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_22D6B7CA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BA68);
  MEMORY[0x270FA5388](v32);
  uint64_t v33 = (uint64_t *)((char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_22D6CB418();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  char v10 = (char *)&v27 - v9;
  uint64_t v31 = sub_22D6CBFD8();
  uint64_t v11 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v30 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BA38);
  MEMORY[0x270FA5388](v28);
  uint64_t v14 = (uint64_t *)((char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v15 = *(unsigned __int8 *)(a1 + 32);
  swift_bridgeObjectRetain();
  if (v15 == 1) {
    uint64_t v16 = sub_22D6CBFB8();
  }
  else {
    uint64_t v16 = sub_22D6CBF98();
  }
  uint64_t v29 = v16;
  uint64_t v17 = sub_22D6CB938();
  uint64_t KeyPath = swift_getKeyPath();
  _s8MenuCellVMa();
  sub_22D6B98A4((uint64_t)v10);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, *MEMORY[0x263F199E8], v4);
  BOOL v19 = sub_22D6B8078((uint64_t)v10, (uint64_t)v8);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v8, v4);
  v20(v10, v4);
  uint64_t v21 = (unsigned int *)MEMORY[0x263F1B530];
  if (!v19) {
    uint64_t v21 = (unsigned int *)MEMORY[0x263F1B540];
  }
  uint64_t v23 = v30;
  uint64_t v22 = v31;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v30, *v21, v31);
  uint64_t v24 = swift_getKeyPath();
  uint64_t v25 = v33;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))((char *)v33 + *(int *)(v32 + 28), v23, v22);
  *uint64_t v25 = v24;
  sub_22D5DD3A4((uint64_t)v25, (uint64_t)v14 + *(int *)(v28 + 36), &qword_26857BA68);
  *uint64_t v14 = v29;
  v14[1] = KeyPath;
  v14[2] = v17;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_22D61324C((uint64_t)v25, &qword_26857BA68);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v23, v22);
  swift_release();
  swift_release();
  swift_release();
  return sub_22D5DD904((uint64_t)v14, v34, &qword_26857BA38);
}

BOOL sub_22D6B8078(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v3 = sub_22D6CB418();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v18 - v8;
  char v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v10((char *)&v18 - v8, a2, v3);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(v4 + 88);
  int v12 = v11(v9, v3);
  unint64_t v13 = 0;
  int v14 = *MEMORY[0x263F199C0];
  if (v12 != *MEMORY[0x263F199C0])
  {
    if (v12 == *MEMORY[0x263F199F0])
    {
      unint64_t v13 = 1;
      goto LABEL_24;
    }
    if (v12 == *MEMORY[0x263F199F8])
    {
      unint64_t v13 = 2;
      goto LABEL_24;
    }
    if (v12 == *MEMORY[0x263F199E8]) {
      goto LABEL_7;
    }
    if (v12 == *MEMORY[0x263F199B8])
    {
      unint64_t v13 = 4;
    }
    else if (v12 == *MEMORY[0x263F199C8])
    {
      unint64_t v13 = 5;
    }
    else if (v12 == *MEMORY[0x263F199A0])
    {
      unint64_t v13 = 6;
    }
    else if (v12 == *MEMORY[0x263F199D8])
    {
      unint64_t v13 = 7;
    }
    else if (v12 == *MEMORY[0x263F199D0])
    {
      unint64_t v13 = 8;
    }
    else if (v12 == *MEMORY[0x263F199E0])
    {
      unint64_t v13 = 9;
    }
    else if (v12 == *MEMORY[0x263F199A8])
    {
      unint64_t v13 = 10;
    }
    else
    {
      if (v12 != *MEMORY[0x263F199B0])
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
LABEL_7:
        unint64_t v13 = 3;
        goto LABEL_24;
      }
      unint64_t v13 = 11;
    }
  }
LABEL_24:
  v10(v7, v19, v3);
  int v15 = v11(v7, v3);
  if (v15 == v14)
  {
    unint64_t v16 = 0;
  }
  else if (v15 == *MEMORY[0x263F199F0])
  {
    unint64_t v16 = 1;
  }
  else if (v15 == *MEMORY[0x263F199F8])
  {
    unint64_t v16 = 2;
  }
  else
  {
    if (v15 != *MEMORY[0x263F199E8])
    {
      if (v15 == *MEMORY[0x263F199B8])
      {
        unint64_t v16 = 4;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199C8])
      {
        unint64_t v16 = 5;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199A0])
      {
        unint64_t v16 = 6;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199D8])
      {
        unint64_t v16 = 7;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199D0])
      {
        unint64_t v16 = 8;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199E0])
      {
        unint64_t v16 = 9;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199A8])
      {
        unint64_t v16 = 10;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x263F199B0])
      {
        unint64_t v16 = 11;
        return v13 >= v16;
      }
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    unint64_t v16 = 3;
  }
  return v13 >= v16;
}

uint64_t sub_22D6B8490(double *a1, double *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3]) {
    return sub_22D6CB928();
  }
  else {
    return 0;
  }
}

uint64_t sub_22D6B84E4()
{
  sub_22D6CD658();
  sub_22D6CD658();
  sub_22D6CD658();
  sub_22D6CD658();
  swift_retain();
  sub_22D6CB958();
  return sub_22D6B8AE4(v0);
}

uint64_t sub_22D6B857C()
{
  return sub_22D6CD668();
}

uint64_t sub_22D6B85BC(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  uint64_t v8 = *(void *)(a2 + 32);
  return sub_22D6B8490((double *)v5, (double *)v7) & 1;
}

uint64_t sub_22D6B8608()
{
  return sub_22D6B857C();
}

uint64_t sub_22D6B8644()
{
  return sub_22D6B84E4();
}

uint64_t sub_22D6B8680()
{
  return sub_22D6CD668();
}

uint64_t sub_22D6B86D4@<X0>(uint64_t a1@<X8>)
{
  return sub_22D6B7BCC(a1);
}

uint64_t sub_22D6B86DC@<X0>(uint64_t a1@<X8>)
{
  return sub_22D6B7CA4(*(void *)(v1 + 16), a1);
}

unint64_t sub_22D6B86E4()
{
  unint64_t result = qword_26857E928;
  if (!qword_26857E928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E928);
  }
  return result;
}

uint64_t _s8MenuCellV9ConstantsVwxx()
{
  return swift_release();
}

uint64_t _s8MenuCellV9ConstantsVwcp(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  return a1;
}

void *_s8MenuCellV9ConstantsVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s8MenuCellV9ConstantsVwta(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t _s8MenuCellV9ConstantsVwet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 32);
      if (v2 >= 0xFFFFFFFF) {
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

uint64_t _s8MenuCellV9ConstantsVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s8MenuCellV9ConstantsVMa()
{
  return &_s8MenuCellV9ConstantsVN;
}

uint64_t sub_22D6B88B0()
{
  return sub_22D6B8924(&qword_26857E938, &qword_26857E8E8, (void (*)(void))sub_22D6B88F4);
}

uint64_t sub_22D6B88F4()
{
  return sub_22D6B8924(&qword_26857E940, &qword_26857E8E0, (void (*)(void))sub_22D6B89A0);
}

uint64_t sub_22D6B8924(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_22D6B89A0()
{
  return sub_22D6B8924(&qword_26857E948, &qword_26857E8D8, (void (*)(void))sub_22D6B89D0);
}

unint64_t sub_22D6B89D0()
{
  unint64_t result = qword_26857E950;
  if (!qword_26857E950)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857E8D0);
    sub_22D5DCE80(&qword_26857E958, &qword_26857E8C8);
    sub_22D5DCE80(&qword_26857C068, &qword_26857C070);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857E950);
  }
  return result;
}

unint64_t sub_22D6B8A98()
{
  unint64_t result = qword_26857E960[0];
  if (!qword_26857E960[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26857E960);
  }
  return result;
}

uint64_t sub_22D6B8AE4(uint64_t a1)
{
  return a1;
}

uint64_t sub_22D6B8B14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t ArtworkImageReader.init(content:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t ArtworkImageReader.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = sub_22D6CAC88();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  char v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  int v12 = (char *)&v19 - v11;
  uint64_t v14 = *v2;
  uint64_t v13 = v2[1];
  int v15 = (void *)swift_allocObject();
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v14;
  v15[5] = v13;
  swift_retain();
  sub_22D6CAC78();
  swift_getWitnessTable();
  unint64_t v16 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v16(v12, v10, v6);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v10, v6);
  v16(a2, v12, v6);
  return ((uint64_t (*)(char *, uint64_t))v17)(v12, v6);
}

uint64_t sub_22D6B8D10@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E9E8);
  MEMORY[0x270FA5388](v10 - 8);
  int v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E9F0);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  unint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(a4 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v14);
  uint64_t v20 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v40 - v21;
  sub_22D6B919C(a1, (uint64_t)v12);
  uint64_t v23 = sub_22D6CABB8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v23) == 1)
  {
    sub_22D5EDCB8((uint64_t)v12, &qword_26857E9E8);
    uint64_t v24 = type metadata accessor for ArtworkImage.Proxy();
    uint64_t v25 = (uint64_t)v16;
    uint64_t v26 = 1;
  }
  else
  {
    sub_22D6CABA8();
    sub_22D6CAB88();
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v31 = sub_22D6CAB98();
    uint64_t v40 = a3;
    uint64_t v32 = a5;
    uint64_t v33 = v31;
    uint64_t v34 = type metadata accessor for ArtworkImage.Proxy();
    long long v41 = a2;
    uint64_t v35 = v34;
    uint64_t v36 = &v16[*(int *)(v34 + 20)];
    *(void *)uint64_t v36 = v28;
    *((void *)v36 + 1) = v30;
    *(void *)&v16[*(int *)(v34 + 24)] = v33;
    a5 = v32;
    (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v12, v23);
    uint64_t v25 = (uint64_t)v16;
    uint64_t v26 = 0;
    uint64_t v24 = v35;
    a2 = v41;
  }
  __swift_storeEnumTagSinglePayload(v25, v26, 1, v24);
  a2(v16);
  sub_22D5EDCB8((uint64_t)v16, &qword_26857E9F0);
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v37(v22, v20, a4);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v17 + 8);
  v38(v20, a4);
  v37(a5, v22, a4);
  return ((uint64_t (*)(char *, uint64_t))v38)(v22, a4);
}

uint64_t sub_22D6B9008()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D6B9040@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_22D6B8D10(a1, *(void (**)(void))(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 16), a2);
}

uint64_t sub_22D6B904C()
{
  return swift_getOpaqueTypeConformance2();
}

void *_s10BackButtonVwCP(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t _s10BackButtonVwxx()
{
  return swift_release();
}

void *_s10BackButtonVwca(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *_s10BackButtonVwta(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t type metadata accessor for ArtworkImageReader()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22D6B9154()
{
  sub_22D6CAC88();
  return swift_getWitnessTable();
}

uint64_t sub_22D6B919C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E9E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D6B9208(uint64_t a1, char a2)
{
  uint64_t v5 = sub_22D6CB318();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7_6();
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v9 = sub_22D6CD288();
  uint64_t v10 = sub_22D6CB878();
  os_log_type_t v11 = v9;
  if (os_log_type_enabled(v10, v9))
  {
    int v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)int v12 = 136315138;
    uint64_t v13 = sub_22D6BB008(1819242306, 0xE400000000000000, &v15);
    OUTLINED_FUNCTION_6_11(v13);
    sub_22D6CD338();
    _os_log_impl(&dword_22D5CD000, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_40_0();
    OUTLINED_FUNCTION_40_0();
  }

  sub_22D6CB308();
  swift_getAtKeyPath();
  sub_22D5DBA20(a1, 0);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
  return v15;
}

uint64_t sub_22D6B93B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_22D6CB318();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7_6();
  sub_22D5DD3A4(v3, (uint64_t)v15, qword_26857AE68);
  if (v16 == 1) {
    return sub_22D6BBAE0((uint64_t)v15, a1);
  }
  os_log_type_t v10 = sub_22D6CD288();
  os_log_type_t v11 = sub_22D6CB878();
  os_log_type_t v12 = v10;
  if (os_log_type_enabled(v11, v10))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    sub_22D6BB008(0xD00000000000002BLL, 0x800000022D6D72B0, &v14);
    sub_22D6CD338();
    _os_log_impl(&dword_22D5CD000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_40_0();
    OUTLINED_FUNCTION_40_0();
  }

  sub_22D6CB308();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
}

uint64_t sub_22D6B95A0@<X0>(uint64_t a1@<X8>)
{
  return sub_22D6B9620(&qword_26857BC18, MEMORY[0x263F18D80], 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

uint64_t sub_22D6B95E0@<X0>(uint64_t a1@<X8>)
{
  return sub_22D6B9620(qword_26857D320, MEMORY[0x263F18DD8], 0x694474756F79614CLL, 0xEF6E6F6974636572, a1);
}

uint64_t sub_22D6B9620@<X0>(uint64_t *a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v29 = a3;
  uint64_t v10 = v5;
  uint64_t v12 = sub_22D6CB318();
  OUTLINED_FUNCTION_0_1();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_7_6();
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D5DD3A4(v10, (uint64_t)v18, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    a2(0);
    OUTLINED_FUNCTION_7();
    return (*(uint64_t (**)(uint64_t, char *))(v19 + 32))(a5, v18);
  }
  else
  {
    os_log_type_t v21 = sub_22D6CD288();
    uint64_t v22 = sub_22D6CB878();
    if (os_log_type_enabled(v22, v21))
    {
      unint64_t v27 = a4;
      uint64_t v23 = swift_slowAlloc();
      uint64_t v28 = a5;
      uint64_t v24 = (uint8_t *)v23;
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315138;
      uint64_t v25 = sub_22D6BB008(v29, v27, &v30);
      OUTLINED_FUNCTION_6_11(v25);
      sub_22D6CD338();
      _os_log_impl(&dword_22D5CD000, v22, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v24, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_40_0();
      OUTLINED_FUNCTION_40_0();
    }

    sub_22D6CB308();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v6, v12);
  }
}

uint64_t sub_22D6B9874@<X0>(uint64_t a1@<X8>)
{
  return OUTLINED_FUNCTION_2_15(&qword_26857E810, MEMORY[0x263F19A18], 0x800000022D6D7290, a1);
}

uint64_t sub_22D6B98A4@<X0>(uint64_t a1@<X8>)
{
  return OUTLINED_FUNCTION_2_15(qword_26857E328, MEMORY[0x263F19A00], 0x800000022D6D72E0, a1);
}

uint64_t sub_22D6B98D4(uint64_t a1, char a2)
{
  uint64_t v4 = sub_22D6CB318();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v8 = sub_22D6CD288();
    os_log_type_t v9 = sub_22D6CB878();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v15 = v12;
      *(_DWORD *)os_log_type_t v11 = 136315138;
      uint64_t v14 = sub_22D6BB008(0x6C616E6F6974704FLL, 0xEE003E65646F4E3CLL, &v15);
      sub_22D6CD338();
      _os_log_impl(&dword_22D5CD000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F89D10](v12, -1, -1);
      MEMORY[0x230F89D10](v11, -1, -1);
    }

    sub_22D6CB308();
    swift_getAtKeyPath();
    j__swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

uint64_t sub_22D6B9AE8()
{
  sub_22D6BB7D8();
  sub_22D6CB328();
  return v1;
}

uint64_t sub_22D6B9B24(uint64_t a1)
{
  sub_22D6BB7D8();
  uint64_t result = sub_22D6CB328();
  if (v3)
  {
    swift_unknownObjectRelease();
    if (a1 && v3 == a1) {
      return swift_unknownObjectRelease();
    }
  }
  else if (!a1)
  {
    return result;
  }
  swift_unknownObjectRetain();
  sub_22D6CB338();
  sub_22D6B9F34();
  return swift_unknownObjectRelease();
}

void sub_22D6B9BD8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_22D6CACC8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7_6();
  sub_22D6CACB8();
  sub_22D6BB870();
  if (swift_dynamicCast())
  {
    if (a2)
    {
      swift_retain();
      sub_22D6C70FC();
      swift_retain();
      swift_bridgeObjectRetain();
      os_log_type_t v9 = (void *)sub_22D6CCED8();
      swift_bridgeObjectRelease();
      swift_retain();
      objc_msgSend(v10, sel_setCacheIdentifier_forCacheReference_, v9, a2);

      swift_release_n();
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v2, a1, v5);
    v11[0] = 0;
    v11[1] = 0xE000000000000000;
    sub_22D6CD3E8();
    sub_22D6CCF68();
    sub_22D6CACB8();
    sub_22D6CD478();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    sub_22D6CCF68();
    sub_22D6CD498();
    __break(1u);
  }
}

void sub_22D6B9DE0(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_22D6B9DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_22D6BAE8C();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

void sub_22D6B9E4C(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t sub_22D6B9E54()
{
  sub_22D6BB78C();
  sub_22D6CB328();
  return v1;
}

uint64_t sub_22D6B9E90(uint64_t a1)
{
  sub_22D6BB78C();
  sub_22D6CB328();
  if (v3)
  {
    swift_release();
    if (!a1 || v3 != a1) {
      goto LABEL_6;
    }
  }
  else if (a1)
  {
LABEL_6:
    swift_retain();
    sub_22D6CB338();
    sub_22D6B9F34();
  }
  return swift_release();
}

uint64_t sub_22D6B9F34()
{
  sub_22D6BB7D8();
  sub_22D6CB328();
  if (v19)
  {
    uint64_t ObjectType = swift_getObjectType();
    sub_22D62EF3C(ObjectType, v20);
    unint64_t v1 = sub_22D6BB824();
    OUTLINED_FUNCTION_5_10(v1, v2, v3, v4, v5, v6, v7, v8, v18, v19, v20, v21, (uint64_t)&type metadata for ArtworkCachingConfigurationHandler, v22);
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_22D6BB78C();
    sub_22D6CB328();
    unint64_t v10 = sub_22D6BB824();
    return OUTLINED_FUNCTION_5_10(v10, v11, v12, v13, v14, v15, v16, v17, v18, 0, v20, v21, (uint64_t)&type metadata for ArtworkCachingConfigurationHandler, v22);
  }
}

void sub_22D6BA01C(uint64_t a1)
{
  sub_22D6B9BD8(a1, *v1);
}

uint64_t sub_22D6BA024(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char v7 = a4 & 1;
  _s4NodeCMa();
  swift_allocObject();
  swift_bridgeObjectRetain();
  return sub_22D6C76B8(a1, a2, a3, v7);
}

uint64_t sub_22D6BA098()
{
  uint64_t v0 = swift_retain();
  return sub_22D6B9E90(v0);
}

uint64_t sub_22D6BA0C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v41 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23108);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23118);
  MEMORY[0x270FA5388](v42);
  unint64_t v10 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23160);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v39 = v11;
  uint64_t v40 = v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v38 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v15 = *((void *)v3 + 4);
  uint64_t v16 = *((void *)v3 + 5);
  int v17 = v3[48];
  _s4NodeCMa();
  sub_22D6BAF1C(&qword_26AF231D8);
  uint64_t v18 = sub_22D6CAE58();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23138);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v8, a1, v19);
  uint64_t v20 = (uint64_t *)&v8[*(int *)(v6 + 44)];
  *uint64_t v20 = KeyPath;
  v20[1] = v18;
  *(_OWORD *)uint64_t v48 = *(_OWORD *)v3;
  *(_OWORD *)&v48[9] = *(_OWORD *)(v3 + 9);
  uint64_t v21 = *((void *)v3 + 7);
  LOBYTE(a1) = v3[64];
  uint64_t v22 = swift_allocObject();
  memcpy((void *)(v22 + 16), v3, 0x41uLL);
  sub_22D5DD3A4((uint64_t)v8, (uint64_t)v10, &qword_26AF23108);
  uint64_t v23 = (uint64_t (**)())&v10[*(int *)(v42 + 36)];
  *uint64_t v23 = sub_22D6BAD38;
  v23[1] = (uint64_t (*)())v22;
  void v23[2] = 0;
  v23[3] = 0;
  uint64_t v37 = *(void *)&v48[8];
  sub_22D69CEEC((uint64_t)v48);
  v34[1] = v15;
  uint64_t v36 = v16;
  int v35 = v17;
  sub_22D63A0A4();
  j__swift_retain();
  sub_22D61324C((uint64_t)v8, &qword_26AF23108);
  j__swift_retain();
  uint64_t v24 = sub_22D6B98D4(v21, a1);
  j__swift_release();
  uint64_t v43 = v24;
  uint64_t v25 = swift_allocObject();
  memcpy((void *)(v25 + 16), v3, 0x41uLL);
  sub_22D69CEEC((uint64_t)v48);
  sub_22D63A0A4();
  j__swift_retain();
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF232B8);
  unint64_t v27 = sub_22D6BAD4C();
  unint64_t v28 = sub_22D6BAE8C();
  uint64_t v29 = v38;
  uint64_t v30 = v42;
  sub_22D6CBE78();
  swift_release();
  swift_release();
  sub_22D61324C((uint64_t)v10, &qword_26AF23118);
  v47[0] = *(_OWORD *)v48;
  *(_OWORD *)((char *)v47 + 9) = *(_OWORD *)&v48[9];
  uint64_t v31 = swift_allocObject();
  memcpy((void *)(v31 + 16), v3, 0x41uLL);
  swift_bridgeObjectRetain();
  sub_22D69CEEC((uint64_t)v48);
  sub_22D63A0A4();
  j__swift_retain();
  uint64_t v43 = v30;
  uint64_t v44 = v26;
  unint64_t v45 = v27;
  unint64_t v46 = v28;
  swift_getOpaqueTypeConformance2();
  sub_22D6BAFBC();
  uint64_t v32 = v39;
  sub_22D6CBE78();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v29, v32);
}

uint64_t sub_22D6BA5A0(uint64_t a1)
{
  _s4NodeCMa();
  sub_22D6BAF1C(&qword_26AF231D8);
  sub_22D6CAE58();
  uint64_t v2 = *(void *)(a1 + 56);
  LOBYTE(a1) = *(unsigned char *)(a1 + 64);
  j__swift_retain();
  uint64_t v3 = sub_22D6B98D4(v2, a1);
  j__swift_release();
  sub_22D6C72A8(v3);
  return swift_release();
}

uint64_t sub_22D6BA66C()
{
  _s4NodeCMa();
  sub_22D6BAF1C(&qword_26AF231D8);
  sub_22D6CAE58();
  uint64_t v0 = swift_retain();
  sub_22D6C72A8(v0);
  return swift_release();
}

uint64_t sub_22D6BA70C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  char v5 = *(unsigned char *)(a2 + 24);
  _s4NodeCMa();
  sub_22D6BAF1C(&qword_26AF231D8);
  sub_22D6CAE58();
  swift_bridgeObjectRetain();
  sub_22D6C73DC(v2, v3, v4, v5);
  return swift_release();
}

uint64_t sub_22D6BA7D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  memcpy(__dst, v2, sizeof(__dst));
  return sub_22D6BA0C4(a1, a2);
}

uint64_t View.artworkCaching(id:limit:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  *(void *)(v13 + 32) = a3;
  *(unsigned char *)(v13 + 40) = a4 & 1;
  v15[0] = a1;
  v15[1] = a2;
  v15[2] = a3;
  char v16 = a4 & 1;
  int v17 = sub_22D6BA984;
  uint64_t v18 = v13;
  char v19 = 0;
  uint64_t v20 = KeyPath;
  char v21 = 0;
  swift_bridgeObjectRetain();
  MEMORY[0x230F87DB0](v15, a5, &_s7CachingV8ModifierVN, a6);
  swift_release();
  return swift_release();
}

uint64_t sub_22D6BA91C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22D6B9E54();
  *a1 = result;
  return result;
}

uint64_t sub_22D6BA94C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22D6BA984()
{
  return sub_22D6BA024(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
}

uint64_t sub_22D6BA994()
{
  return swift_getWitnessTable();
}

unint64_t sub_22D6BA9F8()
{
  unint64_t result = qword_26AF232D0;
  if (!qword_26AF232D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF232D0);
  }
  return result;
}

uint64_t _s7CachingV8ModifierVwxx()
{
  swift_bridgeObjectRelease();
  sub_22D6272C4();
  return j__swift_release();
}

uint64_t _s7CachingV8ModifierVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  char v7 = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_22D63A0A4();
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(v2 + 56);
  LOBYTE(v2) = *(unsigned char *)(v2 + 64);
  j__swift_retain();
  *(void *)(a1 + 56) = v8;
  *(unsigned char *)(a1 + 64) = v2;
  return a1;
}

uint64_t _s7CachingV8ModifierVwca(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = v2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)v2 + 24);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = v2[4];
  uint64_t v6 = v2[5];
  char v7 = *((unsigned char *)v2 + 48);
  sub_22D63A0A4();
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = v7;
  sub_22D6272C4();
  uint64_t v8 = v2[7];
  LOBYTE(v2) = *((unsigned char *)v2 + 64);
  j__swift_retain();
  *(void *)(a1 + 56) = v8;
  *(unsigned char *)(a1 + 64) = (_BYTE)v2;
  j__swift_release();
  return a1;
}

uint64_t _s7CachingV8ModifierVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  char v5 = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = v5;
  sub_22D6272C4();
  char v6 = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = v6;
  j__swift_release();
  return a1;
}

uint64_t _s7CachingV8ModifierVwet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 65))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
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

uint64_t _s7CachingV8ModifierVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s7CachingV8ModifierVMa()
{
  return &_s7CachingV8ModifierVN;
}

ValueMetadata *_s7CachingVMa()
{
  return &_s7CachingVN;
}

uint64_t sub_22D6BAD18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D6BAD38()
{
  return sub_22D6BA5A0(v0 + 16);
}

uint64_t sub_22D6BAD44()
{
  return sub_22D6BA66C();
}

unint64_t sub_22D6BAD4C()
{
  unint64_t result = qword_26AF23110;
  if (!qword_26AF23110)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AF23118);
    sub_22D6BADC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF23110);
  }
  return result;
}

unint64_t sub_22D6BADC8()
{
  unint64_t result = qword_26AF23100;
  if (!qword_26AF23100)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AF23108);
    sub_22D5DCE80(&qword_26AF23130, &qword_26AF23138);
    sub_22D5DCE80(&qword_26AF23150, &qword_26AF23158);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF23100);
  }
  return result;
}

unint64_t sub_22D6BAE8C()
{
  unint64_t result = qword_26AF232C0;
  if (!qword_26AF232C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AF232B8);
    sub_22D6BAF1C((unint64_t *)&qword_26AF231E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF232C0);
  }
  return result;
}

uint64_t sub_22D6BAF1C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    _s4NodeCMa();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroy_3Tm()
{
  swift_bridgeObjectRelease();
  sub_22D6272C4();
  j__swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D6BAFB4(uint64_t a1, uint64_t a2)
{
  return sub_22D6BA70C(a1, a2);
}

unint64_t sub_22D6BAFBC()
{
  unint64_t result = qword_26AF232C8;
  if (!qword_26AF232C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF232C8);
  }
  return result;
}

uint64_t sub_22D6BB008(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22D6BB0DC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22D6BB234((uint64_t)v12, *a3);
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
      sub_22D6BB234((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_22D6BB0DC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_22D6BB290((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_22D6CD348();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_22D6BB368(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_22D6CD428();
    if (!v8)
    {
      uint64_t result = sub_22D6CD488();
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

uint64_t sub_22D6BB234(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_22D6BB290(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_22D6CD4C8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_22D6BB368(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22D6BB400(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_22D6BB5DC(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_22D6BB5DC((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22D6BB400(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_22D6CCF78();
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
  unint64_t v3 = sub_22D6BB574(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_22D6CD3F8();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_22D6CD4C8();
  __break(1u);
LABEL_14:
  uint64_t result = sub_22D6CD488();
  __break(1u);
  return result;
}

void *sub_22D6BB574(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_26857E9F8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_22D6BB5DC(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_26857E9F8);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_22D663D1C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_22D6BB6B4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_22D6BB6B4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_22D6CD4C8();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

unint64_t sub_22D6BB78C()
{
  unint64_t result = qword_26AF231B8;
  if (!qword_26AF231B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF231B8);
  }
  return result;
}

unint64_t sub_22D6BB7D8()
{
  unint64_t result = qword_26AF231B0;
  if (!qword_26AF231B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF231B0);
  }
  return result;
}

unint64_t sub_22D6BB824()
{
  unint64_t result = qword_26AF230F0;
  if (!qword_26AF230F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF230F0);
  }
  return result;
}

unint64_t sub_22D6BB870()
{
  unint64_t result = qword_26AF232E0;
  if (!qword_26AF232E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AF232E0);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for ArtworkCachingConfigurationHandler(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

void *assignWithCopy for ArtworkCachingConfigurationHandler(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for ArtworkCachingConfigurationHandler(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArtworkCachingConfigurationHandler(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ArtworkCachingConfigurationHandler(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArtworkCachingConfigurationHandler()
{
  return &type metadata for ArtworkCachingConfigurationHandler;
}

ValueMetadata *_s7CachingV19OwnerEnvironmentKeyVMa()
{
  return &_s7CachingV19OwnerEnvironmentKeyVN;
}

ValueMetadata *_s7CachingV24PolicyNodeEnvironmentKeyVMa()
{
  return &_s7CachingV24PolicyNodeEnvironmentKeyVN;
}

uint64_t sub_22D6BBA24()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D6BBAE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857AF90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_6_11(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t _s6PolicyVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s6PolicyVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t _s6PolicyVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t _s6PolicyVwet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 25))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
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

uint64_t _s6PolicyVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s6PolicyVMa()
{
  return &_s6PolicyVN;
}

uint64_t sub_22D6BBCDC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  BOOL v12 = a1 == a5 && a2 == a6;
  if (v12 || (v13 = sub_22D6CD5A8(), uint64_t result = 0, (v13 & 1) != 0))
  {
    if (a4)
    {
      if (a8) {
        return 1;
      }
    }
    else if ((a8 & 1) == 0 && a3 == a7)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_22D6BBD58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5) {
    return sub_22D6CD648();
  }
  sub_22D6CD648();
  return sub_22D6CD638();
}

uint64_t sub_22D6BBDD8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) == 0) {
    sub_22D6CD638();
  }
  return sub_22D6CD668();
}

uint64_t sub_22D6BBE74(uint64_t a1, uint64_t a2)
{
  return sub_22D6BBCDC(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(unsigned char *)(a2 + 24));
}

uint64_t sub_22D6BBE98()
{
  return sub_22D6BBDD8(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_22D6BBEA8(uint64_t a1)
{
  return sub_22D6BBD58(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t sub_22D6BBEB8()
{
  int v1 = *(unsigned __int8 *)(v0 + 24);
  sub_22D6CD628();
  swift_bridgeObjectRetain();
  sub_22D6CCF58();
  swift_bridgeObjectRelease();
  sub_22D6CD648();
  if (v1 != 1) {
    sub_22D6CD638();
  }
  return sub_22D6CD668();
}

uint64_t sub_22D6BBF50@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_22D6BBF60(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) == 0)
  {
    sub_22D6CD578();
    sub_22D6CCF68();
    swift_bridgeObjectRelease();
    sub_22D6CCF68();
    swift_bridgeObjectRelease();
  }
  sub_22D6CCF68();
  return 0xD000000000000017;
}

unint64_t sub_22D6BC098()
{
  return sub_22D6BBF60(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_22D6BC0A8()
{
  uint64_t v0 = sub_22D6CAD08();
  __swift_allocate_value_buffer(v0, qword_26AF23A70);
  __swift_project_value_buffer(v0, (uint64_t)qword_26AF23A70);
  return sub_22D6CACF8();
}

uint64_t sub_22D6BC120()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_22D6BC1B8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(_DWORD *)(v5 + 80);
  if (v7 <= 7 && (unint64_t)(v6 + 1) <= 0x18 && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(void *, void *))(v5 + 16))(a1, a2);
    *((unsigned char *)v4 + v6) = *((unsigned char *)a2 + v6);
  }
  else
  {
    uint64_t v10 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  return v4;
}

uint64_t sub_22D6BC28C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  *(unsigned char *)(*(void *)(v5 + 48) + a1) = *(unsigned char *)(*(void *)(v5 + 48) + a2);
  return a1;
}

uint64_t sub_22D6BC2F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  *(unsigned char *)(*(void *)(v5 + 40) + a1) = *(unsigned char *)(*(void *)(v5 + 40) + a2);
  return a1;
}

uint64_t sub_22D6BC35C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(unsigned char *)(*(void *)(v5 + 32) + a1) = *(unsigned char *)(*(void *)(v5 + 32) + a2);
  return a1;
}

uint64_t sub_22D6BC3C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  *(unsigned char *)(*(void *)(v5 + 24) + a1) = *(unsigned char *)(*(void *)(v5 + 24) + a2);
  return a1;
}

uint64_t sub_22D6BC42C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0xFE) {
    unsigned int v7 = 254;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_22;
  }
  uint64_t v9 = v6 + 1;
  char v10 = 8 * (v6 + 1);
  if ((v6 + 1) > 3) {
    goto LABEL_7;
  }
  unsigned int v12 = ((v8 + ~(-1 << v10)) >> v10) + 1;
  if (HIWORD(v12))
  {
    int v11 = *(_DWORD *)((char *)a1 + v9);
    if (v11) {
      goto LABEL_14;
    }
  }
  else
  {
    if (v12 <= 0xFF)
    {
      if (v12 < 2) {
        goto LABEL_22;
      }
LABEL_7:
      int v11 = *((unsigned __int8 *)a1 + v9);
      if (!*((unsigned char *)a1 + v9)) {
        goto LABEL_22;
      }
LABEL_14:
      int v13 = (v11 - 1) << v10;
      if (v9 > 3) {
        int v13 = 0;
      }
      if (v9)
      {
        if (v9 > 3) {
          LODWORD(v9) = 4;
        }
        switch((int)v9)
        {
          case 2:
            LODWORD(v9) = *a1;
            break;
          case 3:
            LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
            break;
          case 4:
            LODWORD(v9) = *(_DWORD *)a1;
            break;
          default:
            LODWORD(v9) = *(unsigned __int8 *)a1;
            break;
        }
      }
      int v16 = v7 + (v9 | v13);
      return (v16 + 1);
    }
    int v11 = *(unsigned __int16 *)((char *)a1 + v9);
    if (*(unsigned __int16 *)((char *)a1 + v9)) {
      goto LABEL_14;
    }
  }
LABEL_22:
  if (v5 >= 0xFE) {
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  }
  unsigned int v15 = *((unsigned __int8 *)a1 + v6);
  if (v15 < 2) {
    return 0;
  }
  int v16 = (v15 + 2147483646) & 0x7FFFFFFF;
  return (v16 + 1);
}

void sub_22D6BC5A8(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0xFE) {
    unsigned int v8 = 254;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  uint64_t v10 = v9 + 1;
  char v11 = 8 * (v9 + 1);
  BOOL v12 = a3 >= v8;
  unsigned int v13 = a3 - v8;
  if (v13 != 0 && v12)
  {
    if (v10 <= 3)
    {
      unsigned int v17 = ((v13 + ~(-1 << v11)) >> v11) + 1;
      if (HIWORD(v17))
      {
        int v14 = 4;
      }
      else if (v17 >= 0x100)
      {
        int v14 = 2;
      }
      else
      {
        int v14 = v17 > 1;
      }
    }
    else
    {
      int v14 = 1;
    }
  }
  else
  {
    int v14 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v15 = ~v8 + a2;
    if (v10 < 4)
    {
      int v16 = (v15 >> v11) + 1;
      if (v9 != -1)
      {
        int v18 = v15 & ~(-1 << v11);
        bzero(a1, v9 + 1);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v9 + 1);
      *(_DWORD *)a1 = v15;
      int v16 = 1;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v16;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v16;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x22D6BC7D4);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v7 < 0xFE)
        {
          a1[v9] = a2 + 1;
        }
        else
        {
          __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t _s23FavoriteStatusIndicatorVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22D6BC814()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D6BC858(uint64_t a1)
{
  uint64_t v3 = sub_22D6CA388();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v13 - v8;
  if (*(unsigned char *)(v1 + *(int *)(a1 + 36))) {
    goto LABEL_5;
  }
  sub_22D6CA618();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857CA28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857CA30);
  if (!swift_dynamicCast())
  {
    uint64_t v14 = 0;
    memset(v13, 0, sizeof(v13));
    sub_22D61324C((uint64_t)v13, &qword_26857CA38);
LABEL_5:
    char v10 = 0;
    return v10 & 1;
  }
  sub_22D645AFC(v13, (uint64_t)v15);
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  sub_22D6CA2D8();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, *MEMORY[0x263F56880], v3);
  char v10 = sub_22D6CA378();
  char v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v7, v3);
  v11(v9, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v10 & 1;
}

uint64_t sub_22D6BCA44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BA68) - 8;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = (uint64_t *)(v3 - v2);
  uint64_t v5 = sub_22D6CBFD8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B588);
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BA38);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_0();
  int v18 = (uint64_t *)(v17 - v16);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857C778);
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_0();
  uint64_t v32 = v21 - v20;
  uint64_t v22 = sub_22D6CBF98();
  uint64_t v23 = sub_22D6CB978();
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v23);
  sub_22D6CB9C8();
  sub_22D61324C(v13, &qword_26857B588);
  uint64_t v24 = sub_22D6CB948();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v9, *MEMORY[0x263F1B540], v5);
  uint64_t v26 = swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v4 + *(int *)(v31 + 36), v9, v5);
  *uint64_t v4 = v26;
  sub_22D5DD3A4((uint64_t)v4, (uint64_t)v18 + *(int *)(v15 + 44), &qword_26857BA68);
  *int v18 = v22;
  v18[1] = KeyPath;
  v18[2] = v24;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_22D61324C((uint64_t)v4, &qword_26857BA68);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  swift_release();
  swift_release();
  swift_release();
  if (sub_22D6BC858(a1))
  {
    if (qword_26857AD50 != -1) {
      swift_once();
    }
    uint64_t v27 = qword_268585058;
    swift_retain();
  }
  else
  {
    uint64_t v27 = sub_22D6CBF18();
  }
  uint64_t v28 = swift_getKeyPath();
  sub_22D5DD3A4((uint64_t)v18, v32, &qword_26857BA38);
  uint64_t v29 = (uint64_t *)(v32 + *(int *)(v33 + 36));
  *uint64_t v29 = v28;
  v29[1] = v27;
  sub_22D61324C((uint64_t)v18, &qword_26857BA38);
  return sub_22D6BCE38(v32, a2);
}

uint64_t sub_22D6BCE38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857C778);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_22D6BCEA4@<D0>(uint64_t a1@<X0>, char *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  HIDWORD(v39) = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA80);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = *a2;
  uint64_t v11 = *((void *)a2 + 1);
  uint64_t v12 = *((void *)a2 + 2);
  unint64_t v13 = *((void *)a2 + 3);
  uint64_t v14 = (int *)_s24PlaylistFolderDetailViewVMa();
  uint64_t v15 = a4 + v14[11];
  *(void *)uint64_t v15 = swift_getKeyPath();
  *(unsigned char *)(v15 + 40) = 0;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA88);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v16);
  sub_22D6BD228((uint64_t)v9);
  uint64_t v17 = (uint64_t *)(a4 + v14[13]);
  *uint64_t v17 = sub_22D6A7020();
  v17[1] = v18;
  v17[2] = v19;
  uint64_t v20 = (double *)(a4 + v14[19]);
  *(_OWORD *)uint64_t v20 = xmmword_22D6D45D0;
  *((_OWORD *)v20 + 1) = xmmword_22D6D45E0;
  uint64_t v21 = sub_22D6CCCF8();
  OUTLINED_FUNCTION_3();
  uint64_t v23 = v22;
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16);
  uint64_t v40 = a1;
  v24(a4, a1, v21);
  uint64_t v25 = a4 + v14[9];
  *(unsigned char *)uint64_t v25 = v10;
  *(void *)(v25 + 8) = v11;
  *(void *)(v25 + 16) = v12;
  *(void *)(v25 + 24) = v13;
  *(unsigned char *)(a4 + v14[10]) = BYTE4(v39);
  uint64_t v26 = swift_allocObject();
  *(unsigned char *)(v26 + 16) = v10;
  *(void *)(v26 + 24) = v11;
  *(void *)(v26 + 32) = v12;
  *(void *)(v26 + 40) = v13;
  *(void *)(a4 + v14[14]) = v26 | 0x4000000000000000;
  uint64_t v27 = a4 + v14[15];
  *(unsigned char *)uint64_t v27 = 1;
  *(void *)(v27 + 8) = 0;
  *(void *)(v27 + 16) = 0;
  *(void *)(v27 + 24) = v26 | 0x4000000000000000;
  swift_bridgeObjectRetain();
  sub_22D5DB288(v13);
  uint64_t v28 = qword_26857AD80;
  swift_retain();
  if (v28 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_21_5();
  uint64_t v29 = sub_22D6CA058();
  uint64_t v30 = (uint64_t *)(a4 + v14[16]);
  *uint64_t v30 = v29;
  v30[1] = v31;
  OUTLINED_FUNCTION_21_5();
  uint64_t v32 = sub_22D6CA058();
  uint64_t v33 = (uint64_t *)(a4 + v14[17]);
  *uint64_t v33 = v32;
  v33[1] = v34;
  sub_22D6C42C8(&qword_26857EA90, MEMORY[0x263F57240]);
  uint64_t v35 = v40;
  sub_22D6CA638();
  double v37 = v36;
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v35, v21);
  double result = v37 * 48.0 + v20[2];
  *(double *)(a4 + v14[18]) = result;
  return result;
}

uint64_t _s24PlaylistFolderDetailViewVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22D6BD228(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA80);
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v2);
  sub_22D5DD3A4(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26857EA80);
  sub_22D6CC018();
  return sub_22D5DD960(a1, &qword_26857EA80);
}

uint64_t sub_22D6BD2D8()
{
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v0 + 40));
  return swift_deallocObject();
}

void sub_22D6BD318()
{
  sub_22D6CCCF8();
  if (v0 <= 0x3F)
  {
    sub_22D6BE5E4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void *sub_22D6BD434(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (void *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_22D6CCCF8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[9];
    uint64_t v9 = (char *)a1 + v8;
    char v10 = (char *)a2 + v8;
    *uint64_t v9 = *v10;
    uint64_t v11 = *((void *)v10 + 2);
    *((void *)v9 + 1) = *((void *)v10 + 1);
    *((void *)v9 + 2) = v11;
    unint64_t v12 = *((void *)v10 + 3);
    swift_bridgeObjectRetain();
    sub_22D5DB288(v12);
    uint64_t v13 = a3[10];
    uint64_t v14 = a3[11];
    char v15 = *((unsigned char *)a2 + v13);
    *((void *)v9 + 3) = v12;
    *((unsigned char *)a1 + v13) = v15;
    uint64_t v16 = (char *)a1 + v14;
    uint64_t v17 = (char *)a2 + v14;
    if (*((unsigned char *)a2 + v14 + 40))
    {
      uint64_t v18 = *((void *)v17 + 3);
      if (v18)
      {
        uint64_t v19 = *((void *)v17 + 4);
        *((void *)v16 + 3) = v18;
        *((void *)v16 + 4) = v19;
        (**(void (***)(char *))(v18 - 8))(v16);
      }
      else
      {
        long long v21 = *((_OWORD *)v17 + 1);
        *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
        *((_OWORD *)v16 + 1) = v21;
        *((void *)v16 + 4) = *((void *)v17 + 4);
      }
      v16[40] = 1;
    }
    else
    {
      *(void *)uint64_t v16 = *(void *)v17;
      v16[40] = 0;
      swift_retain();
    }
    uint64_t v22 = a3[12];
    uint64_t v23 = (char *)a1 + v22;
    uint64_t v24 = (char *)a2 + v22;
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA88);
    if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25))
    {
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA80);
      memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
      __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
    }
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
    *(void *)&v23[*(int *)(v27 + 28)] = *(void *)&v24[*(int *)(v27 + 28)];
    uint64_t v28 = a3[13];
    uint64_t v29 = a3[14];
    uint64_t v30 = (void *)((char *)a1 + v28);
    uint64_t v31 = (void *)((char *)a2 + v28);
    uint64_t v32 = v31[1];
    *uint64_t v30 = *v31;
    v30[1] = v32;
    v30[2] = v31[2];
    unint64_t v33 = *(void *)((char *)a2 + v29);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_22D5DB288(v33);
    *(void *)((char *)a1 + v29) = v33;
    uint64_t v34 = a3[15];
    uint64_t v35 = (char *)a1 + v34;
    double v36 = (char *)a2 + v34;
    *uint64_t v35 = *v36;
    uint64_t v37 = *((void *)v36 + 2);
    *((void *)v35 + 1) = *((void *)v36 + 1);
    *((void *)v35 + 2) = v37;
    unint64_t v38 = *((void *)v36 + 3);
    swift_bridgeObjectRetain();
    sub_22D5DB288(v38);
    *((void *)v35 + 3) = v38;
    uint64_t v39 = a3[16];
    uint64_t v40 = a3[17];
    uint64_t v41 = (void *)((char *)a1 + v39);
    uint64_t v42 = (void *)((char *)a2 + v39);
    uint64_t v43 = v42[1];
    *uint64_t v41 = *v42;
    v41[1] = v43;
    uint64_t v44 = (void *)((char *)a1 + v40);
    unint64_t v45 = (void *)((char *)a2 + v40);
    uint64_t v46 = v45[1];
    *uint64_t v44 = *v45;
    v44[1] = v46;
    uint64_t v47 = a3[19];
    *(void *)((char *)a1 + a3[18]) = *(void *)((char *)a2 + a3[18]);
    uint64_t v48 = (_OWORD *)((char *)a1 + v47);
    uint64_t v49 = (_OWORD *)((char *)a2 + v47);
    long long v50 = v49[1];
    *uint64_t v48 = *v49;
    v48[1] = v50;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_22D6BD738(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_22D6CCCF8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[9];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v5 + 24));
  uint64_t v6 = a1 + a2[11];
  if (*(unsigned char *)(v6 + 40))
  {
    if (*(void *)(v6 + 24)) {
      __swift_destroy_boxed_opaque_existential_1(v6);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + a2[12];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA88);
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_22D5DB9FC(*(void *)(a1 + a2[14]));
  uint64_t v9 = a1 + a2[15];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v9 + 24));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D6BD8B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22D6CCCF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
  uint64_t v10 = *(void *)(v9 + 16);
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(void *)(v8 + 16) = v10;
  unint64_t v11 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v11);
  uint64_t v12 = a3[10];
  uint64_t v13 = a3[11];
  char v14 = *(unsigned char *)(a2 + v12);
  *(void *)(v8 + 24) = v11;
  *(unsigned char *)(a1 + v12) = v14;
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  if (*(unsigned char *)(a2 + v13 + 40))
  {
    uint64_t v17 = *(void *)(v16 + 24);
    if (v17)
    {
      uint64_t v18 = *(void *)(v16 + 32);
      *(void *)(v15 + 24) = v17;
      *(void *)(v15 + 32) = v18;
      (**(void (***)(uint64_t))(v17 - 8))(v15);
    }
    else
    {
      long long v19 = *(_OWORD *)(v16 + 16);
      *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
      *(_OWORD *)(v15 + 16) = v19;
      *(void *)(v15 + 32) = *(void *)(v16 + 32);
    }
    *(unsigned char *)(v15 + 40) = 1;
  }
  else
  {
    *(void *)uint64_t v15 = *(void *)v16;
    *(unsigned char *)(v15 + 40) = 0;
    swift_retain();
  }
  uint64_t v20 = a3[12];
  long long v21 = (char *)(a1 + v20);
  uint64_t v22 = (char *)(a2 + v20);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA88);
  if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v23))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA80);
    memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v23);
  }
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
  *(void *)&v21[*(int *)(v25 + 28)] = *(void *)&v22[*(int *)(v25 + 28)];
  uint64_t v26 = a3[13];
  uint64_t v27 = a3[14];
  uint64_t v28 = (void *)(a1 + v26);
  uint64_t v29 = (void *)(a2 + v26);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  v28[2] = v29[2];
  unint64_t v31 = *(void *)(a2 + v27);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22D5DB288(v31);
  *(void *)(a1 + v27) = v31;
  uint64_t v32 = a3[15];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  *(unsigned char *)uint64_t v33 = *(unsigned char *)v34;
  uint64_t v35 = *(void *)(v34 + 16);
  *(void *)(v33 + 8) = *(void *)(v34 + 8);
  *(void *)(v33 + 16) = v35;
  unint64_t v36 = *(void *)(v34 + 24);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v36);
  *(void *)(v33 + 24) = v36;
  uint64_t v37 = a3[16];
  uint64_t v38 = a3[17];
  uint64_t v39 = (void *)(a1 + v37);
  uint64_t v40 = (void *)(a2 + v37);
  uint64_t v41 = v40[1];
  *uint64_t v39 = *v40;
  v39[1] = v41;
  uint64_t v42 = (void *)(a1 + v38);
  uint64_t v43 = (void *)(a2 + v38);
  uint64_t v44 = v43[1];
  *uint64_t v42 = *v43;
  v42[1] = v44;
  uint64_t v45 = a3[19];
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  uint64_t v46 = (_OWORD *)(a1 + v45);
  uint64_t v47 = (_OWORD *)(a2 + v45);
  long long v48 = v47[1];
  *uint64_t v46 = *v47;
  v46[1] = v48;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22D6BDB6C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22D6CCCF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)uint64_t v8 = *(unsigned char *)(a2 + v7);
  *(void *)(v8 + 8) = *(void *)(a2 + v7 + 8);
  *(void *)(v8 + 16) = *(void *)(a2 + v7 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v10 = *(void *)(v9 + 24);
  sub_22D5DB288(v10);
  unint64_t v11 = *(void *)(v8 + 24);
  *(void *)(v8 + 24) = v10;
  sub_22D5DB9FC(v11);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  if (a1 != a2)
  {
    uint64_t v12 = a3[11];
    uint64_t v13 = a1 + v12;
    char v14 = (long long *)(a2 + v12);
    sub_22D5DD960(a1 + v12, qword_26857AE68);
    if (*((unsigned char *)v14 + 40))
    {
      uint64_t v15 = *((void *)v14 + 3);
      if (v15)
      {
        *(void *)(v13 + 24) = v15;
        *(void *)(v13 + 32) = *((void *)v14 + 4);
        (**(void (***)(uint64_t, long long *))(v15 - 8))(v13, v14);
      }
      else
      {
        long long v16 = *v14;
        long long v17 = v14[1];
        *(void *)(v13 + 32) = *((void *)v14 + 4);
        *(_OWORD *)uint64_t v13 = v16;
        *(_OWORD *)(v13 + 16) = v17;
      }
      *(unsigned char *)(v13 + 40) = 1;
    }
    else
    {
      *(void *)uint64_t v13 = *(void *)v14;
      *(unsigned char *)(v13 + 40) = 0;
      swift_retain();
    }
  }
  uint64_t v18 = a3[12];
  long long v19 = (char *)(a1 + v18);
  uint64_t v20 = (char *)(a2 + v18);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA88);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v19, 1, v21);
  int v23 = __swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21);
  if (!EnumTagSinglePayload)
  {
    uint64_t v24 = *(void *)(v21 - 8);
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 24))(v19, v20, v21);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v19, v21);
    goto LABEL_13;
  }
  if (v23)
  {
LABEL_13:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA80);
    memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v21);
LABEL_14:
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
  *(void *)&v19[*(int *)(v26 + 28)] = *(void *)&v20[*(int *)(v26 + 28)];
  swift_retain();
  swift_release();
  uint64_t v27 = a3[13];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = a2 + v27;
  *uint64_t v28 = *(void *)(a2 + v27);
  v28[1] = *(void *)(a2 + v27 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28[2] = *(void *)(v29 + 16);
  swift_retain();
  swift_release();
  uint64_t v30 = a3[14];
  unint64_t v31 = *(void *)(a2 + v30);
  sub_22D5DB288(v31);
  unint64_t v32 = *(void *)(a1 + v30);
  *(void *)(a1 + v30) = v31;
  sub_22D5DB9FC(v32);
  uint64_t v33 = a3[15];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  *(unsigned char *)uint64_t v34 = *(unsigned char *)(a2 + v33);
  *(void *)(v34 + 8) = *(void *)(a2 + v33 + 8);
  *(void *)(v34 + 16) = *(void *)(a2 + v33 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v36 = *(void *)(v35 + 24);
  sub_22D5DB288(v36);
  unint64_t v37 = *(void *)(v34 + 24);
  *(void *)(v34 + 24) = v36;
  sub_22D5DB9FC(v37);
  uint64_t v38 = a3[16];
  uint64_t v39 = (void *)(a1 + v38);
  uint64_t v40 = (void *)(a2 + v38);
  *uint64_t v39 = *v40;
  v39[1] = v40[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v41 = a3[17];
  uint64_t v42 = (void *)(a1 + v41);
  uint64_t v43 = (void *)(a2 + v41);
  *uint64_t v42 = *v43;
  v42[1] = v43[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  uint64_t v44 = a3[19];
  uint64_t v45 = (void *)(a1 + v44);
  uint64_t v46 = (void *)(a2 + v44);
  *uint64_t v45 = *v46;
  v45[1] = v46[1];
  v45[2] = v46[2];
  v45[3] = v46[3];
  return a1;
}

uint64_t sub_22D6BDF70(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22D6CCCF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a3[10];
  uint64_t v9 = (_OWORD *)(a1 + v7);
  unint64_t v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v12 = a3[11];
  uint64_t v13 = a3[12];
  char v14 = (_OWORD *)(a1 + v12);
  uint64_t v15 = (_OWORD *)(a2 + v12);
  long long v16 = v15[1];
  *char v14 = *v15;
  v14[1] = v16;
  *(_OWORD *)((char *)v14 + 25) = *(_OWORD *)((char *)v15 + 25);
  long long v17 = (char *)(a1 + v13);
  uint64_t v18 = (char *)(a2 + v13);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA88);
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA80);
    memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  }
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
  *(void *)&v17[*(int *)(v21 + 28)] = *(void *)&v18[*(int *)(v21 + 28)];
  uint64_t v22 = a3[13];
  uint64_t v23 = a3[14];
  uint64_t v24 = a1 + v22;
  uint64_t v25 = a2 + v22;
  *(void *)(v24 + 16) = *(void *)(v25 + 16);
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  *(void *)(a1 + v23) = *(void *)(a2 + v23);
  uint64_t v26 = a3[15];
  uint64_t v27 = a3[16];
  uint64_t v28 = (_OWORD *)(a1 + v26);
  uint64_t v29 = (_OWORD *)(a2 + v26);
  long long v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  *(_OWORD *)(a1 + v27) = *(_OWORD *)(a2 + v27);
  uint64_t v31 = a3[18];
  *(_OWORD *)(a1 + a3[17]) = *(_OWORD *)(a2 + a3[17]);
  *(void *)(a1 + v31) = *(void *)(a2 + v31);
  uint64_t v32 = a3[19];
  uint64_t v33 = (_OWORD *)(a1 + v32);
  uint64_t v34 = (_OWORD *)(a2 + v32);
  long long v35 = v34[1];
  *uint64_t v33 = *v34;
  v33[1] = v35;
  return a1;
}

uint64_t sub_22D6BE144(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22D6CCCF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)uint64_t v8 = *(unsigned char *)(a2 + v7);
  uint64_t v10 = *(void *)(a2 + v7 + 16);
  *(void *)(v8 + 8) = *(void *)(a2 + v7 + 8);
  *(void *)(v8 + 16) = v10;
  swift_bridgeObjectRelease();
  unint64_t v11 = *(void *)(v8 + 24);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  sub_22D5DB9FC(v11);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  if (a1 != a2)
  {
    uint64_t v12 = a3[11];
    uint64_t v13 = (_OWORD *)(a2 + v12);
    char v14 = (_OWORD *)(a1 + v12);
    sub_22D5DD960(a1 + v12, qword_26857AE68);
    long long v15 = v13[1];
    *char v14 = *v13;
    v14[1] = v15;
    *(_OWORD *)((char *)v14 + 25) = *(_OWORD *)((char *)v13 + 25);
  }
  uint64_t v16 = a3[12];
  long long v17 = (char *)(a1 + v16);
  uint64_t v18 = (char *)(a2 + v16);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA88);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, v19);
  int v21 = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19);
  if (!EnumTagSinglePayload)
  {
    uint64_t v22 = *(void *)(v19 - 8);
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 40))(v17, v18, v19);
      goto LABEL_9;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v19);
    goto LABEL_8;
  }
  if (v21)
  {
LABEL_8:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA80);
    memcpy(v17, v18, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_9;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
LABEL_9:
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
  *(void *)&v17[*(int *)(v24 + 28)] = *(void *)&v18[*(int *)(v24 + 28)];
  swift_release();
  uint64_t v25 = a3[13];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = a2 + v25;
  uint64_t v28 = *(void *)(a2 + v25 + 8);
  *uint64_t v26 = *(void *)(a2 + v25);
  v26[1] = v28;
  swift_bridgeObjectRelease();
  v26[2] = *(void *)(v27 + 16);
  swift_release();
  uint64_t v29 = a3[14];
  unint64_t v30 = *(void *)(a1 + v29);
  *(void *)(a1 + v29) = *(void *)(a2 + v29);
  sub_22D5DB9FC(v30);
  uint64_t v31 = a3[15];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  *(unsigned char *)uint64_t v32 = *(unsigned char *)(a2 + v31);
  uint64_t v34 = *(void *)(a2 + v31 + 16);
  *(void *)(v32 + 8) = *(void *)(a2 + v31 + 8);
  *(void *)(v32 + 16) = v34;
  swift_bridgeObjectRelease();
  unint64_t v35 = *(void *)(v32 + 24);
  *(void *)(v32 + 24) = *(void *)(v33 + 24);
  sub_22D5DB9FC(v35);
  uint64_t v36 = a3[16];
  unint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (uint64_t *)(a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *unint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  uint64_t v41 = a3[17];
  uint64_t v42 = (void *)(a1 + v41);
  uint64_t v43 = (uint64_t *)(a2 + v41);
  uint64_t v45 = *v43;
  uint64_t v44 = v43[1];
  *uint64_t v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  uint64_t v46 = a3[19];
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  uint64_t v47 = (_OWORD *)(a1 + v46);
  long long v48 = (_OWORD *)(a2 + v46);
  long long v49 = v48[1];
  *uint64_t v47 = *v48;
  v47[1] = v49;
  return a1;
}

uint64_t sub_22D6BE448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22D6BE45C);
}

uint64_t sub_22D6BE45C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22D6CCCF8();
  OUTLINED_FUNCTION_3();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
  OUTLINED_FUNCTION_3();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 48);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 52) + 8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t sub_22D6BE518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22D6BE52C);
}

void sub_22D6BE52C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_22D6CCCF8();
  OUTLINED_FUNCTION_3();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
    OUTLINED_FUNCTION_3();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 52) + 8) = (a2 - 1);
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 48);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_22D6BE5E4()
{
  if (!qword_26857EB20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857EA80);
    unint64_t v0 = sub_22D6CC058();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26857EB20);
    }
  }
}

uint64_t sub_22D6BE640()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D6BE684@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v234 = a1;
  uint64_t v226 = a2;
  uint64_t v225 = sub_22D6CB348();
  OUTLINED_FUNCTION_0_0();
  uint64_t v224 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_7_3(v5);
  uint64_t v222 = sub_22D6CB868();
  OUTLINED_FUNCTION_0_0();
  uint64_t v221 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_44(v8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857C640);
  MEMORY[0x270FA5388](v9 - 8);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_7_3(v10);
  uint64_t v217 = sub_22D6CB5B8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v216 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_7_3(v13);
  uint64_t v219 = sub_22D6CB5C8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v218 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_7_3(v16);
  uint64_t v215 = sub_22D6CD178();
  OUTLINED_FUNCTION_0_0();
  uint64_t v214 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_44(v19);
  OUTLINED_FUNCTION_0_0();
  uint64_t v241 = v20;
  uint64_t v229 = *(void *)(v21 + 64);
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_44((uint64_t)v181 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D300);
  uint64_t v25 = sub_22D6CCCD8();
  uint64_t v26 = *(void *)(a1 + 16);
  uint64_t v27 = sub_22D6C42C8(&qword_26857C498, MEMORY[0x263F57210]);
  unint64_t v28 = *(void *)(a1 + 24);
  uint64_t v254 = v25;
  uint64_t v255 = v26;
  uint64_t v256 = v27;
  unint64_t v257 = v28;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  OUTLINED_FUNCTION_7_2();
  swift_getTupleTypeMetadata2();
  uint64_t v29 = sub_22D6CC2C8();
  uint64_t v30 = sub_22D5DCE80(&qword_26857EB28, &qword_26857D300);
  unint64_t v31 = sub_22D5DC93C();
  uint64_t v254 = v24;
  uint64_t v255 = MEMORY[0x263F138A8];
  uint64_t v256 = v29;
  unint64_t v257 = v30;
  unint64_t v258 = v31;
  sub_22D6CC1A8();
  sub_22D6CD328();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v268 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6CADD8();
  OUTLINED_FUNCTION_29_5();
  _s50BottomNavigationPromptAvoidancePaddingViewModifierVMa();
  OUTLINED_FUNCTION_16_6();
  uint64_t v32 = swift_getWitnessTable();
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v266 = v32;
  uint64_t v267 = v33;
  uint64_t v235 = MEMORY[0x263F18E48];
  swift_getWitnessTable();
  OUTLINED_FUNCTION_7_2();
  sub_22D6CADE8();
  OUTLINED_FUNCTION_29_5();
  _s27DismissAlertTriggerModifierVMa();
  OUTLINED_FUNCTION_16_6();
  uint64_t v34 = swift_getWitnessTable();
  uint64_t v35 = swift_getWitnessTable();
  uint64_t v264 = v34;
  uint64_t v265 = v35;
  swift_getWitnessTable();
  OUTLINED_FUNCTION_7_2();
  uint64_t v36 = sub_22D6CAFD8();
  uint64_t v37 = swift_getWitnessTable();
  unint64_t v38 = sub_22D604560();
  uint64_t v254 = v36;
  uint64_t v255 = MEMORY[0x263F8D310];
  v181[1] = v36;
  uint64_t v256 = v37;
  unint64_t v257 = v38;
  uint64_t v228 = v37;
  unint64_t v236 = v38;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v232 = v39;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_10();
  uint64_t v230 = v41;
  uint64_t v237 = v26;
  unint64_t v238 = v28;
  _s18NavigationBarStyleVMa();
  uint64_t v42 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v206 = v43;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_10();
  uint64_t v187 = v45;
  sub_22D6CAF98();
  v181[9] = v42;
  uint64_t v46 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v210 = v47;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v48);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_44(v49);
  uint64_t v233 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857AF60);
  OUTLINED_FUNCTION_16_4();
  uint64_t done = _s10DoneButtonVMa();
  uint64_t v254 = v36;
  uint64_t v255 = MEMORY[0x263F8D310];
  uint64_t v256 = v37;
  unint64_t v257 = v38;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v227 = (void (*)(void, void, void))OpaqueTypeConformance2;
  uint64_t v52 = swift_getWitnessTable();
  uint64_t v262 = OpaqueTypeConformance2;
  uint64_t v263 = v52;
  uint64_t v53 = swift_getWitnessTable();
  v181[3] = v53;
  uint64_t v54 = sub_22D6C42C8(&qword_26857AF68, MEMORY[0x263F189F8]);
  uint64_t v260 = v53;
  uint64_t v261 = v54;
  uint64_t v55 = swift_getWitnessTable();
  uint64_t v56 = sub_22D5DCE80(&qword_26857AF70, &qword_26857AF60);
  uint64_t v57 = swift_getWitnessTable();
  v181[4] = v46;
  uint64_t v58 = v233;
  uint64_t v254 = v46;
  uint64_t v255 = v233;
  uint64_t v256 = done;
  unint64_t v257 = v55;
  uint64_t v59 = done;
  v181[2] = done;
  v181[7] = v55;
  unint64_t v258 = v56;
  uint64_t v259 = v57;
  uint64_t v60 = v56;
  v181[6] = v56;
  uint64_t v61 = v57;
  v181[5] = v57;
  uint64_t v62 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v208 = v63;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v64);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_44(v65);
  uint64_t v254 = v46;
  uint64_t v255 = v58;
  uint64_t v256 = v59;
  unint64_t v257 = v55;
  unint64_t v258 = v60;
  uint64_t v259 = v61;
  uint64_t v66 = OUTLINED_FUNCTION_13_6();
  uint64_t v254 = v62;
  uint64_t v67 = v62;
  uint64_t v191 = v62;
  uint64_t v68 = MEMORY[0x263F8D310];
  uint64_t v255 = MEMORY[0x263F8D310];
  uint64_t v256 = v66;
  uint64_t v69 = v66;
  uint64_t v184 = v66;
  unint64_t v70 = v236;
  unint64_t v257 = v236;
  uint64_t v71 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v204 = v72;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v73);
  OUTLINED_FUNCTION_10();
  uint64_t v190 = v74;
  uint64_t v254 = v67;
  uint64_t v255 = v68;
  uint64_t v256 = v69;
  unint64_t v257 = v70;
  uint64_t v75 = OUTLINED_FUNCTION_13_6();
  uint64_t v193 = v71;
  uint64_t v254 = v71;
  uint64_t v255 = v75;
  uint64_t v76 = v75;
  uint64_t v194 = v75;
  uint64_t v77 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v199 = v78;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v79);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_44(v80);
  uint64_t v254 = v71;
  uint64_t v255 = v76;
  uint64_t v81 = OUTLINED_FUNCTION_13_6();
  uint64_t v188 = v77;
  uint64_t v254 = v77;
  uint64_t v255 = v81;
  uint64_t v82 = v81;
  uint64_t v189 = v81;
  uint64_t v83 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v197 = v84;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v85);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_44(v86);
  uint64_t v254 = v77;
  uint64_t v255 = v82;
  uint64_t v87 = OUTLINED_FUNCTION_13_6();
  uint64_t v88 = v83;
  uint64_t v182 = v83;
  uint64_t v254 = v83;
  uint64_t v255 = v87;
  uint64_t v89 = v87;
  uint64_t v183 = v87;
  uint64_t v90 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v205 = v91;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v92);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_44(v93);
  uint64_t v254 = v88;
  uint64_t v255 = v89;
  uint64_t v94 = OUTLINED_FUNCTION_13_6();
  uint64_t v254 = v90;
  uint64_t v255 = v68;
  uint64_t v95 = v90;
  uint64_t v186 = v90;
  uint64_t v256 = v94;
  unint64_t v257 = MEMORY[0x263F8D338];
  uint64_t v96 = v94;
  uint64_t v185 = v94;
  unint64_t v97 = MEMORY[0x263F8D338];
  uint64_t v98 = swift_getOpaqueTypeMetadata2();
  uint64_t v196 = v98;
  OUTLINED_FUNCTION_0_0();
  uint64_t v200 = v99;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v100);
  OUTLINED_FUNCTION_10();
  uint64_t v192 = v101;
  uint64_t v254 = v95;
  uint64_t v255 = v68;
  uint64_t v256 = v96;
  unint64_t v257 = v97;
  uint64_t v195 = OUTLINED_FUNCTION_13_6();
  uint64_t v254 = v98;
  uint64_t v255 = v195;
  uint64_t v202 = MEMORY[0x263F1B070];
  uint64_t v198 = swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v207 = v102;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v103);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_44(v104);
  uint64_t v201 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v212 = v105;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v106);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_44(v107);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857E5A0);
  uint64_t v211 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v213 = v108;
  uint64_t v110 = MEMORY[0x270FA5388](v109);
  uint64_t v203 = (char *)v181 - ((v111 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v110);
  OUTLINED_FUNCTION_44((uint64_t)v181 - v112);
  uint64_t v113 = v234;
  uint64_t v114 = v240;
  sub_22D6BFD80(v234);
  uint64_t v249 = v254;
  uint64_t v250 = v255;
  uint64_t v115 = v114;
  uint64_t v252 = sub_22D6CCCE8();
  uint64_t v253 = v116;
  swift_checkMetadataState();
  sub_22D6CBC78();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v117 = v237;
  unint64_t v118 = v238;
  sub_22D69AD64(v237, OpaqueTypeMetadata2, v237, (uint64_t)v227);
  OUTLINED_FUNCTION_22();
  v119();
  uint64_t v120 = v241;
  uint64_t v121 = *(void (**)(void, void, void))(v241 + 16);
  OpaqueTypeMetadata2 = v241 + 16;
  uint64_t v232 = v121;
  uint64_t v122 = v239;
  v121(v239, v115, v113);
  uint64_t v123 = *(unsigned __int8 *)(v120 + 80);
  v229 += (v123 + 32) & ~v123;
  uint64_t v124 = (v123 + 32) & ~v123;
  uint64_t v230 = v124;
  uint64_t v228 = v123 | 7;
  uint64_t v125 = swift_allocObject();
  *(void *)(v125 + 16) = v117;
  *(void *)(v125 + 24) = v118;
  uint64_t v126 = *(void (**)(void, void, void))(v120 + 32);
  uint64_t v241 = v120 + 32;
  uint64_t v227 = v126;
  v126(v125 + v124, v122, v113);
  sub_22D5D4E80();
  sub_22D6CBD88();
  swift_release();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v127();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_22();
  v128();
  uint64_t v254 = sub_22D6CC238();
  uint64_t v255 = v129;
  uint64_t v249 = sub_22D63F070();
  uint64_t v250 = v130;
  swift_checkMetadataState();
  sub_22D6CBCC8();
  swift_release();
  OUTLINED_FUNCTION_22();
  v131();
  uint64_t v132 = v240;
  uint64_t v133 = (uint64_t *)(v240 + *(int *)(v113 + 52));
  uint64_t v134 = v133[1];
  uint64_t v135 = v133[2];
  uint64_t v249 = *v133;
  uint64_t v250 = v134;
  uint64_t v251 = v135;
  uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5A8);
  sub_22D6CC048();
  sub_22D6CB5A8();
  sub_22D6CB588();
  OUTLINED_FUNCTION_22();
  v136();
  uint64_t v137 = (uint64_t *)(v132 + *(int *)(v113 + 64));
  uint64_t v138 = v137[1];
  uint64_t v254 = *v137;
  uint64_t v255 = v138;
  swift_bridgeObjectRetain();
  sub_22D6CBB78();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_22();
  v139();
  OUTLINED_FUNCTION_22();
  v140();
  uint64_t v141 = v220;
  sub_22D6CB7C8();
  uint64_t v142 = sub_22D6CB7D8();
  __swift_storeEnumTagSinglePayload(v141, 0, 1, v142);
  sub_22D6CBD48();
  sub_22D5DD960(v141, &qword_26857C640);
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_22();
  v143();
  sub_22D6CB858();
  sub_22D6CBD68();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v144();
  OUTLINED_FUNCTION_22();
  v145();
  MEMORY[0x230F87C60](1, v182, v183);
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v146();
  uint64_t v147 = v133[1];
  uint64_t v148 = v133[2];
  uint64_t v254 = *v133;
  uint64_t v255 = v147;
  uint64_t v256 = v148;
  sub_22D6CC028();
  uint64_t v254 = v249;
  uint64_t v255 = v250;
  uint64_t v149 = v240;
  OUTLINED_FUNCTION_15_7();
  v150();
  uint64_t v151 = OUTLINED_FUNCTION_31_5();
  unint64_t v152 = v238;
  *(void *)(v151 + 16) = v237;
  *(void *)(v151 + 24) = v152;
  uint64_t v153 = OUTLINED_FUNCTION_8_11(v151);
  v154(v153);
  sub_22D5DADC8();
  sub_22D6CBE88();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22();
  v155();
  (*(void (**)(uint64_t, void, uint64_t))(v224 + 104))(v223, *MEMORY[0x263F19698], v225);
  uint64_t v156 = v196;
  uint64_t v157 = v195;
  sub_22D6CBD58();
  OUTLINED_FUNCTION_22();
  v158();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_22();
  v159();
  OUTLINED_FUNCTION_15_7();
  v160();
  uint64_t v161 = OUTLINED_FUNCTION_31_5();
  uint64_t v162 = v237;
  unint64_t v163 = v238;
  *(void *)(v161 + 16) = v237;
  *(void *)(v161 + 24) = v163;
  uint64_t v164 = OUTLINED_FUNCTION_8_11(v161);
  v165(v164);
  uint64_t v254 = v156;
  uint64_t v255 = v157;
  uint64_t v166 = swift_getOpaqueTypeConformance2();
  sub_22D64D5E4((uint64_t)sub_22D6C3D30, v161, v198, v166);
  swift_release();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v167();
  sub_22D6CC238();
  uint64_t v242 = v162;
  unint64_t v243 = v163;
  uint64_t v244 = v149;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5B0);
  unint64_t v168 = sub_22D5DCB30();
  uint64_t v247 = v166;
  unint64_t v248 = v168;
  uint64_t v169 = swift_getWitnessTable();
  sub_22D6AFF10(&qword_26857E5B8, &qword_26857E5B0, (void (*)(void))sub_22D6AF364);
  uint64_t v170 = v203;
  sub_22D6CBDF8();
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_22();
  v171();
  uint64_t v172 = sub_22D5DCE80(&qword_26857E5E0, &qword_26857E5A0);
  uint64_t v245 = v169;
  uint64_t v246 = v172;
  uint64_t v173 = v211;
  swift_getWitnessTable();
  uint64_t v174 = v209;
  OUTLINED_FUNCTION_28_3();
  sub_22D6B8B10(v175, v176);
  uint64_t v177 = *(void (**)(char *, uint64_t))(v213 + 8);
  v177(v170, v173);
  OUTLINED_FUNCTION_28_3();
  sub_22D6B8B10(v178, v179);
  return ((uint64_t (*)(uint64_t, uint64_t))v177)(v174, v173);
}

uint64_t sub_22D6BFD80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(v5 + 16) = v6;
  *(void *)(v5 + 24) = v7;
  (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v5 + v4, (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D300);
  uint64_t v9 = sub_22D6CCCD8();
  uint64_t v10 = sub_22D6C42C8(&qword_26857C498, MEMORY[0x263F57210]);
  uint64_t v30 = v9;
  uint64_t v31 = v6;
  uint64_t v32 = v10;
  uint64_t v33 = v7;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  swift_getTupleTypeMetadata2();
  uint64_t v11 = sub_22D6CC2C8();
  uint64_t v12 = sub_22D5DCE80(&qword_26857EB28, &qword_26857D300);
  unint64_t v13 = sub_22D5DC93C();
  uint64_t v30 = v8;
  uint64_t v31 = MEMORY[0x263F138A8];
  uint64_t v32 = v11;
  uint64_t v33 = v12;
  unint64_t v34 = v13;
  sub_22D6CC1A8();
  sub_22D6CD328();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v28 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6CADD8();
  _s50BottomNavigationPromptAvoidancePaddingViewModifierVMa();
  sub_22D6CB088();
  uint64_t v14 = swift_getWitnessTable();
  uint64_t v15 = swift_getWitnessTable();
  uint64_t v26 = v14;
  uint64_t v27 = v15;
  swift_getWitnessTable();
  sub_22D6CADE8();
  _s27DismissAlertTriggerModifierVMa();
  sub_22D6CB088();
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v24 = v16;
  uint64_t v25 = v17;
  swift_getWitnessTable();
  uint64_t v22 = sub_22D6CAFC8();
  uint64_t v23 = v18;
  uint64_t v19 = sub_22D6CAFD8();
  swift_getWitnessTable();
  sub_22D6B8B10(&v22, v19);
  swift_release();
  uint64_t v22 = v30;
  uint64_t v23 = v31;
  sub_22D6B8B10(&v22, v19);
  return swift_release();
}

uint64_t sub_22D6C01F4()
{
  v0[2] = sub_22D6CD148();
  v0[3] = sub_22D6CD138();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  uint64_t v2 = _s24PlaylistFolderDetailViewVMa();
  void *v1 = v0;
  v1[1] = sub_22D5D3898;
  return sub_22D6C02C4(v2);
}

uint64_t sub_22D6C02C4(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  v2[9] = sub_22D6CD148();
  void v2[10] = sub_22D6CD138();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[11] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_22D6C0384;
  return sub_22D6C0A64(a1);
}

uint64_t sub_22D6C0384()
{
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v4 = sub_22D6CD108();
  return MEMORY[0x270FA2498](sub_22D6C0490, v4, v3);
}

uint64_t sub_22D6C0490()
{
  uint64_t v10 = v0;
  swift_release();
  sub_22D6B93B8((uint64_t)(v0 + 2));
  uint64_t v1 = v0[5];
  if (v1)
  {
    uint64_t v3 = v0[7];
    uint64_t v2 = v0[8];
    uint64_t v4 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    unint64_t v5 = *(void *)(v2 + *(int *)(v3 + 56));
    unint64_t v9 = v5;
    uint64_t v6 = *(void (**)(unint64_t *, uint64_t, uint64_t))(v4 + 8);
    sub_22D5DB288(v5);
    v6(&v9, v1, v4);
    sub_22D5DB9FC(v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  }
  else
  {
    sub_22D5DD960((uint64_t)(v0 + 2), &qword_26857AF90);
  }
  OUTLINED_FUNCTION_16();
  return v7();
}

uint64_t sub_22D6C0594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v4 = _s24PlaylistFolderDetailViewVMa();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v31 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B070);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA80);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v31 - v15;
  uint64_t v17 = (long long *)(a1 + *(int *)(v4 + 52));
  long long v18 = *v17;
  uint64_t v19 = *((void *)v17 + 2);
  long long v34 = v18;
  uint64_t v35 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5A8);
  sub_22D6CC028();
  uint64_t v21 = v36;
  unint64_t v20 = v37;
  swift_bridgeObjectRelease();
  uint64_t v22 = HIBYTE(v20) & 0xF;
  if ((v20 & 0x2000000000000000) == 0) {
    uint64_t v22 = v21 & 0xFFFFFFFFFFFFLL;
  }
  if (!v22)
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA88);
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v23);
    sub_22D5DD3A4((uint64_t)v16, (uint64_t)v14, &qword_26857EA80);
    __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
    sub_22D6CC038();
    sub_22D5DD960((uint64_t)v16, &qword_26857EA80);
  }
  uint64_t v24 = sub_22D6CD178();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_22D6CD148();
  uint64_t v25 = sub_22D6CD138();
  unint64_t v26 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v27 = (char *)swift_allocObject();
  uint64_t v28 = MEMORY[0x263F8F500];
  *((void *)v27 + 2) = v25;
  *((void *)v27 + 3) = v28;
  uint64_t v29 = v33;
  *((void *)v27 + 4) = v32;
  *((void *)v27 + 5) = v29;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v27[v26], v7, v4);
  sub_22D64EFD0();
  return swift_release();
}

uint64_t sub_22D6C0888()
{
  v0[2] = sub_22D6CD148();
  v0[3] = sub_22D6CD138();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  uint64_t v2 = _s24PlaylistFolderDetailViewVMa();
  void *v1 = v0;
  v1[1] = sub_22D6C0958;
  return sub_22D6C0A64(v2);
}

uint64_t sub_22D6C0958()
{
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_4();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v4 = sub_22D6CD108();
  return MEMORY[0x270FA2498](sub_22D6C4A74, v4, v3);
}

uint64_t sub_22D6C0A64(uint64_t a1)
{
  v2[22] = a1;
  v2[23] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA80);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA88);
  v2[26] = v4;
  v2[27] = *(void *)(v4 - 8);
  v2[28] = swift_task_alloc();
  uint64_t v5 = sub_22D6C9FF8();
  v2[29] = v5;
  v2[30] = *(void *)(v5 - 8);
  v2[31] = swift_task_alloc();
  v2[32] = *(void *)(a1 - 8);
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857EB58);
  v2[35] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857C4C0);
  v2[36] = v6;
  v2[37] = *(void *)(v6 - 8);
  v2[38] = swift_task_alloc();
  sub_22D6CD148();
  v2[39] = sub_22D6CD138();
  uint64_t v8 = sub_22D6CD108();
  unsigned char v2[40] = v8;
  v2[41] = v7;
  return MEMORY[0x270FA2498](sub_22D6C0CEC, v8, v7);
}

uint64_t sub_22D6C0CEC()
{
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 176);
  uint64_t v5 = *(void *)(v0 + 184);
  sub_22D6CCCD8();
  sub_22D6C42C8(&qword_26857C490, MEMORY[0x263F57210]);
  sub_22D6CC598();
  swift_getKeyPath();
  uint64_t v6 = sub_22D6CCCF8();
  *(void *)(v0 + 336) = v6;
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v1, v5, v6);
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v6);
  sub_22D6C42C8(&qword_26857EB60, MEMORY[0x263F57240]);
  sub_22D6CC578();
  swift_release();
  sub_22D5DD960(v1, &qword_26857EB58);
  uint64_t v8 = v5 + *(int *)(v4 + 52);
  uint64_t v9 = *(void *)(v8 + 16);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)v8;
  *(void *)(v0 + 56) = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5A8);
  sub_22D6CC028();
  uint64_t v11 = *(void *)(v0 + 136);
  unint64_t v10 = *(void *)(v0 + 144);
  swift_bridgeObjectRelease();
  if ((v10 & 0x2000000000000000) != 0) {
    uint64_t v12 = HIBYTE(v10) & 0xF;
  }
  else {
    uint64_t v12 = v11 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(void *)(v0 + 344) = v13;
  *(void *)(v0 + 352) = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v13(v2, v5, v4);
  if (v12)
  {
    uint64_t v15 = *(void *)(v0 + 248);
    uint64_t v14 = *(void *)(v0 + 256);
    uint64_t v16 = *(void *)(v0 + 240);
    uint64_t v36 = *(void *)(v0 + 232);
    uint64_t v37 = *(void *)(v0 + 272);
    uint64_t v38 = *(void *)(v0 + 176);
    uint64_t v17 = (long long *)(v37 + *(int *)(v4 + 52));
    long long v18 = *v17;
    uint64_t v19 = *((void *)v17 + 2);
    *(_OWORD *)(v0 + 64) = v18;
    *(void *)(v0 + 80) = v19;
    sub_22D6CC028();
    *(void *)(v0 + 104) = *(void *)(v0 + 88);
    *(void *)(v0 + 112) = *(void *)(v0 + 96);
    sub_22D6C9FE8();
    sub_22D604560();
    uint64_t v20 = sub_22D6CD358();
    unint64_t v22 = v21;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v22 & 0x2000000000000000) != 0) {
      uint64_t v23 = HIBYTE(v22) & 0xF;
    }
    else {
      uint64_t v23 = v20 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v24(v37, v38);
    if (v23)
    {
      uint64_t v25 = *(void *)(v8 + 16);
      *(_OWORD *)(v0 + 16) = *(_OWORD *)v8;
      *(void *)(v0 + 32) = v25;
      sub_22D6CC028();
      sub_22D6CC568();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 256) + 8);
    v24(*(void *)(v0 + 272), *(void *)(v0 + 176));
  }
  *(void *)(v0 + 360) = v24;
  uint64_t v32 = (void *)swift_task_alloc();
  *(void *)(v0 + 368) = v32;
  *uint64_t v32 = v0;
  v32[1] = sub_22D6C1088;
  uint64_t v33 = *(void *)(v0 + 288);
  uint64_t v34 = *(void *)(v0 + 224);
  return MEMORY[0x270EF6780](v34, v33, v26, v27, v28, v29, v30, v31);
}

uint64_t sub_22D6C1088()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 376) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 328);
  uint64_t v4 = *(void *)(v2 + 320);
  if (v0) {
    uint64_t v5 = sub_22D6C133C;
  }
  else {
    uint64_t v5 = sub_22D6C11C4;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_22D6C11C4()
{
  uint64_t v10 = v0[38];
  uint64_t v1 = v0[36];
  uint64_t v2 = v0[37];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[28];
  uint64_t v6 = v0[25];
  uint64_t v5 = v0[26];
  uint64_t v7 = v0[24];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v6, v4, v5);
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v5);
  sub_22D5DD3A4(v6, v7, &qword_26857EA80);
  __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
  sub_22D6CC038();
  sub_22D5DD960(v6, &qword_26857EA80);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v10, v1);
  OUTLINED_FUNCTION_18_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v8();
}

uint64_t sub_22D6C133C()
{
  uint64_t v32 = v0;
  uint64_t v1 = v0[38];
  uint64_t v2 = v0[36];
  uint64_t v3 = v0[37];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  if (qword_26857ADB8 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[22];
  uint64_t v5 = (void *)v0[47];
  uint64_t v6 = (void (*)(uint64_t, uint64_t, uint64_t))v0[43];
  uint64_t v7 = v0[33];
  uint64_t v8 = v0[23];
  uint64_t v9 = sub_22D6CAD08();
  __swift_project_value_buffer(v9, (uint64_t)qword_268585250);
  v6(v7, v8, v4);
  id v10 = v5;
  id v11 = v5;
  uint64_t v12 = sub_22D6CACE8();
  os_log_type_t v13 = sub_22D6CD278();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v15 = (void *)v0[47];
  uint64_t v16 = (void (*)(uint64_t, uint64_t))v0[45];
  if (v14)
  {
    os_log_type_t type = v13;
    uint64_t v17 = v0[33];
    uint64_t v28 = v0[22];
    uint64_t v18 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v31 = v30;
    *(_DWORD *)uint64_t v18 = 136446466;
    sub_22D6C42C8(&qword_26857EB68, MEMORY[0x263F57240]);
    uint64_t v19 = sub_22D6CD578();
    v0[19] = sub_22D6BB008(v19, v20, &v31);
    sub_22D6CD338();
    swift_bridgeObjectRelease();
    v16(v17, v28);
    *(_WORD *)(v18 + 12) = 2082;
    v0[20] = v15;
    id v21 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857AFD0);
    uint64_t v22 = sub_22D6CCF48();
    v0[21] = sub_22D6BB008(v22, v23, &v31);
    sub_22D6CD338();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22D5CD000, v12, type, "Failed to load content for %{public}s. Error = %{public}s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x230F89D10](v30, -1, -1);
    MEMORY[0x230F89D10](v18, -1, -1);
  }
  else
  {
    uint64_t v24 = v0[33];
    uint64_t v25 = v0[22];

    v16(v24, v25);
  }
  OUTLINED_FUNCTION_18_5();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  return v26();
}

uint64_t sub_22D6C16B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MusicPicker.Click.ControlID();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v5 = _s24PlaylistFolderDetailViewVMa();
  sub_22D6B93B8((uint64_t)v19);
  uint64_t v6 = v20;
  if (!v20) {
    return sub_22D5DD960((uint64_t)v19, &qword_26857AF90);
  }
  uint64_t v7 = v21;
  __swift_project_boxed_opaque_existential_1(v19, v20);
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = a1 + *(int *)(v5 + 36);
  uint64_t v9 = *(void *)(v8 + 8);
  uint64_t v10 = *(void *)(v8 + 16);
  unint64_t v11 = *(void *)(v8 + 24);
  v15[0] = *(unsigned char *)v8;
  uint64_t v16 = v9;
  uint64_t v17 = v10;
  unint64_t v18 = v11;
  uint64_t v12 = *(void (**)(char *, unsigned char *, uint64_t, uint64_t))(v7 + 16);
  swift_bridgeObjectRetain();
  sub_22D5DB288(v11);
  v12(v4, v15, v6, v7);
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(v11);
  sub_22D6995A4((uint64_t)v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
}

uint64_t sub_22D6C181C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v56 = a4;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5D8);
  uint64_t v44 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v43 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5E8);
  MEMORY[0x270FA5388](v47);
  uint64_t v49 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BDE0);
  uint64_t v46 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v45 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5C8);
  MEMORY[0x270FA5388](v55);
  uint64_t v48 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA88);
  uint64_t v53 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  os_log_type_t v13 = (char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA80);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857D300);
  uint64_t v52 = *(void *)(v54 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v54);
  uint64_t v19 = (char *)v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v41 - v20;
  uint64_t v22 = _s24PlaylistFolderDetailViewVMa();
  __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
  sub_22D6CC028();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v11))
  {
    sub_22D5DD960((uint64_t)v16, &qword_26857EA80);
LABEL_9:
    uint64_t v37 = 1;
    uint64_t v38 = v56;
    return __swift_storeEnumTagSinglePayload(v38, v37, 1, v55);
  }
  v41[1] = a2;
  v41[2] = a3;
  uint64_t v42 = a1;
  uint64_t v23 = v53;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v13, v16, v11);
  sub_22D5DD960((uint64_t)v16, &qword_26857EA80);
  sub_22D6CC5C8();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v11);
  uint64_t v24 = v52;
  uint64_t v25 = v54;
  (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v21, v19, v54);
  if (!sub_22D65025C())
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v25);
    goto LABEL_9;
  }
  uint64_t v26 = (long long *)(v42 + *(int *)(v22 + 52));
  long long v27 = *v26;
  uint64_t v28 = *((void *)v26 + 2);
  long long v57 = v27;
  uint64_t v58 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5A8);
  sub_22D6CC028();
  uint64_t v30 = v59;
  unint64_t v29 = v60;
  uint64_t v31 = swift_bridgeObjectRelease();
  uint64_t v32 = HIBYTE(v29) & 0xF;
  if ((v29 & 0x2000000000000000) == 0) {
    uint64_t v32 = v30 & 0xFFFFFFFFFFFFLL;
  }
  if (v32)
  {
    uint64_t v33 = v45;
    sub_22D6CB688();
    uint64_t v34 = v46;
    uint64_t v35 = v50;
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v49, v33, v50);
  }
  else
  {
    MEMORY[0x270FA5388](v31);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26857E5F0);
    sub_22D5DCE80(&qword_26857E5F8, &qword_26857E5F0);
    uint64_t v33 = v43;
    sub_22D6CB678();
    uint64_t v34 = v44;
    uint64_t v35 = v51;
    (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v49, v33, v51);
  }
  swift_storeEnumTagMultiPayload();
  sub_22D5DCE80(&qword_26857BDD8, &qword_26857BDE0);
  sub_22D5DCE80(&qword_26857E5D0, &qword_26857E5D8);
  uint64_t v36 = v48;
  sub_22D6CB558();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v33, v35);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v54);
  uint64_t v40 = (uint64_t)v36;
  uint64_t v38 = v56;
  sub_22D5DD904(v40, v56, &qword_26857E5C8);
  uint64_t v37 = 0;
  return __swift_storeEnumTagSinglePayload(v38, v37, 1, v55);
}

uint64_t sub_22D6C1F90@<X0>(uint64_t a1@<X8>)
{
  _s24PlaylistFolderDetailViewVMa();
  sub_22D604560();
  swift_bridgeObjectRetain();
  uint64_t result = sub_22D6CBAF8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_22D6C2010@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v30 = a1;
  uint64_t v31 = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D300);
  sub_22D6CCCD8();
  sub_22D6C42C8(&qword_26857C498, MEMORY[0x263F57210]);
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  swift_getTupleTypeMetadata2();
  uint64_t v8 = sub_22D6CC2C8();
  uint64_t v9 = sub_22D5DCE80(&qword_26857EB28, &qword_26857D300);
  unint64_t v10 = sub_22D5DC93C();
  uint64_t v41 = v7;
  uint64_t v42 = MEMORY[0x263F138A8];
  uint64_t v43 = v8;
  uint64_t v44 = v9;
  unint64_t v45 = v10;
  sub_22D6CC1A8();
  sub_22D6CD328();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v39 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6CADD8();
  uint64_t v11 = a4;
  _s50BottomNavigationPromptAvoidancePaddingViewModifierVMa();
  sub_22D6CB088();
  uint64_t v37 = swift_getWitnessTable();
  uint64_t v38 = swift_getWitnessTable();
  v28[2] = MEMORY[0x263F18E48];
  v28[0] = swift_getWitnessTable();
  uint64_t v12 = sub_22D6CADE8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v28 - v14;
  v28[1] = _s27DismissAlertTriggerModifierVMa();
  uint64_t v16 = sub_22D6CB088();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v28 - v21;
  sub_22D6CB898();
  uint64_t v32 = a3;
  uint64_t v33 = v11;
  uint64_t v34 = v29;
  sub_22D6CADF8();
  uint64_t v23 = swift_getWitnessTable();
  double v24 = sub_22D621FAC();
  sub_22D63FCF4(v30, v24, a3, v12, a3, v23);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v35 = v23;
  uint64_t v36 = v25;
  swift_getWitnessTable();
  sub_22D6B8B10(v20, v16);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v17 + 8);
  v26(v20, v16);
  sub_22D6B8B10(v22, v16);
  return ((uint64_t (*)(char *, uint64_t))v26)(v22, v16);
}

uint64_t sub_22D6C2508@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v36 = a4;
  uint64_t v6 = sub_22D6CB658();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v34 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D300);
  uint64_t v9 = sub_22D6CCCD8();
  uint64_t v10 = sub_22D6C42C8(&qword_26857C498, MEMORY[0x263F57210]);
  uint64_t v44 = v9;
  uint64_t v45 = a2;
  uint64_t v46 = v10;
  uint64_t v47 = a3;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  swift_getTupleTypeMetadata2();
  uint64_t v11 = sub_22D6CC2C8();
  uint64_t v12 = sub_22D5DCE80(&qword_26857EB28, &qword_26857D300);
  unint64_t v13 = sub_22D5DC93C();
  uint64_t v44 = v8;
  uint64_t v45 = MEMORY[0x263F138A8];
  uint64_t v46 = v11;
  uint64_t v47 = v12;
  unint64_t v48 = v13;
  sub_22D6CC1A8();
  sub_22D6CD328();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v42 = swift_getWitnessTable();
  uint64_t v30 = swift_getWitnessTable();
  uint64_t v14 = sub_22D6CADD8();
  uint64_t v32 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v27 - v15;
  uint64_t v29 = a3;
  uint64_t v31 = _s50BottomNavigationPromptAvoidancePaddingViewModifierVMa();
  uint64_t v17 = sub_22D6CB088();
  uint64_t v33 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v27 - v21;
  sub_22D6CB458();
  uint64_t v28 = a2;
  _s24PlaylistFolderDetailViewVMa();
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  uint64_t v39 = v35;
  sub_22D613374();
  sub_22D6CADC8();
  uint64_t v23 = swift_getWitnessTable();
  sub_22D5DEF3C(v28, v14, v28, v23);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v14);
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v40 = v23;
  uint64_t v41 = v24;
  swift_getWitnessTable();
  sub_22D6B8B10(v20, v17);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v33 + 8);
  v25(v20, v17);
  sub_22D6B8B10(v22, v17);
  return ((uint64_t (*)(char *, uint64_t))v25)(v22, v17);
}

uint64_t sub_22D6C2A00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v71 = a4;
  uint64_t v72 = a1;
  uint64_t v6 = _s24PlaylistFolderDetailViewVMa();
  uint64_t v61 = *(void *)(v6 - 8);
  uint64_t v59 = *(void *)(v61 + 64);
  MEMORY[0x270FA5388](v6);
  unint64_t v60 = (char *)&v53 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857D300);
  uint64_t v9 = sub_22D6CCCD8();
  uint64_t v10 = sub_22D6C42C8(&qword_26857C498, MEMORY[0x263F57210]);
  uint64_t v77 = v9;
  uint64_t v78 = a2;
  uint64_t v63 = a2;
  uint64_t v64 = a3;
  uint64_t v79 = v10;
  uint64_t v80 = a3;
  _s13ItemShelfCellVMa();
  sub_22D6CB088();
  sub_22D6CB088();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857BD60);
  swift_getTupleTypeMetadata2();
  uint64_t v11 = sub_22D6CC2C8();
  uint64_t v12 = sub_22D5DCE80(&qword_26857EB28, &qword_26857D300);
  unint64_t v13 = sub_22D5DC93C();
  uint64_t v77 = v8;
  uint64_t v78 = MEMORY[0x263F138A8];
  uint64_t v70 = v11;
  uint64_t v79 = v11;
  uint64_t v80 = v12;
  uint64_t v56 = v12;
  unint64_t v81 = v13;
  uint64_t v14 = sub_22D6CC1A8();
  uint64_t v58 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v55 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  long long v57 = (char *)&v53 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA88);
  uint64_t v54 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA80);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v24 = (char *)&v53 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = v8;
  uint64_t v25 = *(void *)(v8 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v22);
  uint64_t v67 = (char *)&v53 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v53 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v66 = (char *)&v53 - v31;
  uint64_t v32 = sub_22D6CD328();
  uint64_t v68 = *(void *)(v32 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  uint64_t v69 = (uint64_t)&v53 - v36;
  uint64_t v62 = v6;
  __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
  sub_22D6CC028();
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v18))
  {
    sub_22D5DD960((uint64_t)v24, &qword_26857EA80);
    __swift_storeEnumTagSinglePayload((uint64_t)v35, 1, 1, v14);
    uint64_t WitnessTable = swift_getWitnessTable();
    swift_getWitnessTable();
  }
  else
  {
    uint64_t v38 = v54;
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v20, v24, v18);
    sub_22D5DD960((uint64_t)v24, &qword_26857EA80);
    sub_22D6CC5C8();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v20, v18);
    uint64_t v40 = v65;
    uint64_t v39 = v66;
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v66, v30, v65);
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v67, v39, v40);
    uint64_t v42 = v61;
    uint64_t v41 = v62;
    uint64_t v43 = v60;
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v60, v72, v62);
    unint64_t v44 = (*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
    uint64_t v45 = swift_allocObject();
    uint64_t v46 = v64;
    *(void *)(v45 + 16) = v63;
    *(void *)(v45 + 24) = v46;
    (*(void (**)(unint64_t, char *, uint64_t))(v42 + 32))(v45 + v44, v43, v41);
    uint64_t v47 = swift_getWitnessTable();
    sub_22D6C42C8(qword_26857EB78, MEMORY[0x263F57210]);
    unint64_t v48 = v55;
    sub_22D6CC198();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v66, v40);
    uint64_t v73 = v47;
    swift_getWitnessTable();
    uint64_t v49 = v57;
    sub_22D6B8B10(v48, v14);
    uint64_t v50 = *(void (**)(char *, uint64_t))(v58 + 8);
    v50(v48, v14);
    sub_22D6B8B10(v49, v14);
    v50(v49, v14);
    __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v14);
  }
  uint64_t v37 = v69;
  sub_22D627E64((uint64_t)v35, v69);
  uint64_t v51 = *(void (**)(char *, uint64_t))(v68 + 8);
  v51(v35, v32);
  uint64_t v75 = swift_getWitnessTable();
  uint64_t v74 = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_22D6B8B10(v37, v32);
  return ((uint64_t (*)(uint64_t, uint64_t))v51)(v37, v32);
}

uint64_t sub_22D6C32B4@<X0>(void (*a1)(char *, uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v77 = a2;
  uint64_t v66 = a1;
  uint64_t v75 = a5;
  uint64_t v73 = sub_22D6CC178();
  uint64_t v72 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v69 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857B040);
  MEMORY[0x270FA5388](v70);
  uint64_t v67 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857BD60);
  uint64_t v9 = MEMORY[0x270FA5388](v74);
  uint64_t v71 = (uint64_t)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v68 = (uint64_t)&v59 - v11;
  uint64_t v12 = sub_22D6CCCD8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_22D6C42C8(&qword_26857C498, MEMORY[0x263F57210]);
  uint64_t v81 = v12;
  uint64_t v82 = a3;
  uint64_t v83 = v61;
  unint64_t v84 = a4;
  uint64_t v16 = _s13ItemShelfCellVMa();
  uint64_t v63 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v59 - v17;
  uint64_t v19 = sub_22D6CB088();
  uint64_t v64 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  unint64_t v60 = (char *)&v59 - v20;
  uint64_t v21 = sub_22D6CB088();
  uint64_t v65 = *(void *)(v21 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v76 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v62 = (char *)&v59 - v24;
  (*(void (**)(char *, void (*)(char *, uint64_t), uint64_t))(v13 + 16))(v15, v66, v12);
  uint64_t v25 = a3;
  uint64_t v59 = _s24PlaylistFolderDetailViewVMa();
  uint64_t v26 = v77 + *(int *)(v59 + 60);
  uint64_t v28 = *(void *)(v26 + 8);
  uint64_t v27 = *(void *)(v26 + 16);
  unint64_t v29 = *(void *)(v26 + 24);
  LOBYTE(v81) = *(unsigned char *)v26;
  uint64_t v82 = v28;
  uint64_t v83 = v27;
  unint64_t v84 = v29;
  swift_bridgeObjectRetain();
  sub_22D5DB288(v29);
  uint64_t v30 = sub_22D621FB4();
  sub_22D686FD8((uint64_t)v15, (char *)&v81, 0, 0, 5, 0, 1, v30, (uint64_t)v18, v31, v32, v25, v12);
  sub_22D6CB8E8();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v34 = v60;
  sub_22D6CBE28();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v18, v16);
  sub_22D6CB8F8();
  v80[4] = WitnessTable;
  v80[5] = MEMORY[0x263F18C10];
  uint64_t v35 = swift_getWitnessTable();
  uint64_t v36 = v76;
  sub_22D6CBE28();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v34, v19);
  v80[2] = v35;
  v80[3] = MEMORY[0x263F18C10];
  uint64_t v64 = swift_getWitnessTable();
  uint64_t v37 = v62;
  sub_22D6B8B10(v36, v21);
  uint64_t v38 = v65;
  uint64_t v66 = *(void (**)(char *, uint64_t))(v65 + 8);
  v66(v36, v21);
  uint64_t v39 = v69;
  sub_22D6CC168();
  LOBYTE(v18) = sub_22D6CB8E8();
  sub_22D6CADB8();
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v48 = v72;
  uint64_t v49 = (uint64_t)v67;
  uint64_t v50 = v39;
  uint64_t v51 = v73;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v67, v39, v73);
  uint64_t v52 = v70;
  uint64_t v53 = v49 + *(int *)(v70 + 36);
  *(unsigned char *)uint64_t v53 = (_BYTE)v18;
  *(void *)(v53 + 8) = v41;
  *(void *)(v53 + 16) = v43;
  *(void *)(v53 + 24) = v45;
  *(void *)(v53 + 32) = v47;
  *(unsigned char *)(v53 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v51);
  uint64_t v54 = v68;
  sub_22D5DD904(v49, v68, &qword_26857B040);
  __swift_storeEnumTagSinglePayload(v54, 0, 1, v52);
  uint64_t v55 = v76;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v76, v37, v21);
  uint64_t v81 = (uint64_t)v55;
  uint64_t v56 = v71;
  sub_22D5DD3A4(v54, v71, &qword_26857BD60);
  uint64_t v82 = v56;
  v80[0] = v21;
  v80[1] = v74;
  uint64_t v78 = v64;
  uint64_t v79 = sub_22D6AFF10((unint64_t *)&qword_26857BF00, &qword_26857BD60, (void (*)(void))sub_22D5DD4F0);
  sub_22D634638((uint64_t)&v81, 2, (uint64_t)v80);
  sub_22D5DD960(v54, &qword_26857BD60);
  long long v57 = (uint64_t (*)(char *, uint64_t))v66;
  v66(v37, v21);
  sub_22D5DD960(v56, &qword_26857BD60);
  return v57(v55, v21);
}

uint64_t sub_22D6C3AF0(void *a1)
{
  return sub_22D6CAA58();
}

uint64_t sub_22D6C3B38()
{
  return sub_22D6CD668();
}

BOOL sub_22D6C3BB8(double *a1, double *a2)
{
  return sub_22D5EDE8C(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_22D6C3BD0()
{
  return sub_22D6C3B38();
}

uint64_t sub_22D6C3BE4()
{
  return sub_22D5EDEB0();
}

uint64_t sub_22D6C3BF8()
{
  return sub_22D6CD668();
}

uint64_t sub_22D6C3C4C()
{
  OUTLINED_FUNCTION_3_14();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_22D5DCA54;
  return sub_22D6C01F4();
}

uint64_t sub_22D6C3D14()
{
  return sub_22D6C3D48(sub_22D6C0594);
}

uint64_t sub_22D6C3D30()
{
  return sub_22D6C3D48((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22D6C16B0);
}

uint64_t sub_22D6C3D48(uint64_t (*a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  OUTLINED_FUNCTION_3_14();
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1(v5, v2, v3);
}

uint64_t sub_22D6C3DBC@<X0>(uint64_t a1@<X8>)
{
  return sub_22D6C181C(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_22D6C3DC8@<X0>(uint64_t a1@<X8>)
{
  return sub_22D6C1F90(a1);
}

uint64_t sub_22D6C3DD4()
{
  _s24PlaylistFolderDetailViewVMa();
  OUTLINED_FUNCTION_3_7();
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  uint64_t v4 = v1 + v3;
  sub_22D6CCCF8();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_22();
  v5();
  unint64_t v6 = v1 + v3 + v0[9];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v6 + 24));
  uint64_t v7 = v1 + v3 + v0[11];
  if (*(unsigned char *)(v7 + 40))
  {
    if (*(void *)(v7 + 24)) {
      __swift_destroy_boxed_opaque_existential_1(v7);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v4 + v0[12];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA88);
  if (!OUTLINED_FUNCTION_27_5(v9)) {
    (*(void (**)(uint64_t, unint64_t))(*(void *)(v6 - 8) + 8))(v8, v6);
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
  swift_release();
  uint64_t v10 = v4 + v0[13];
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_26_5();
  sub_22D5DB9FC(*(void *)(v10 + 24));
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_25_3();
  return swift_deallocObject();
}

uint64_t sub_22D6C3F70()
{
  OUTLINED_FUNCTION_3_14();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_22D5DE3E0;
  return sub_22D6C0888();
}

uint64_t sub_22D6C405C(uint64_t a1)
{
  return sub_22D6C423C(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22D6C2010);
}

uint64_t sub_22D6C4074@<X0>(uint64_t a1@<X8>)
{
  return sub_22D6C2508(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_22D6C4080@<X0>(uint64_t a1@<X8>)
{
  return sub_22D6C2A00(v1[4], v1[2], v1[3], a1);
}

uint64_t objectdestroy_10Tm_0()
{
  _s24PlaylistFolderDetailViewVMa();
  OUTLINED_FUNCTION_3_7();
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  sub_22D6CCCF8();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_22();
  v4();
  uint64_t v5 = v3 + v0[9];
  swift_bridgeObjectRelease();
  sub_22D5DB9FC(*(void *)(v5 + 24));
  uint64_t v6 = v3 + v0[11];
  if (*(unsigned char *)(v6 + 40))
  {
    if (*(void *)(v6 + 24)) {
      __swift_destroy_boxed_opaque_existential_1(v6);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v3 + v0[12];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857EA88);
  if (!OUTLINED_FUNCTION_27_5(v8)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v7, v5);
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_26857EA98);
  swift_release();
  uint64_t v9 = v3 + v0[13];
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_26_5();
  sub_22D5DB9FC(*(void *)(v9 + 24));
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_25_3();
  return swift_deallocObject();
}

uint64_t sub_22D6C4224(uint64_t a1)
{
  return sub_22D6C423C(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22D6C32B4);
}

uint64_t sub_22D6C423C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  OUTLINED_FUNCTION_3_14();
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a2(a1, v7, v4, v5);
}

uint64_t sub_22D6C42C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s24PlaylistFolderDetailViewV9ConstantsVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22D6C4328()
{
  return swift_getWitnessTable();
}

uint64_t sub_22D6C4A58()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_13_6()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_16_6()
{
  return sub_22D6CB088();
}

uint64_t OUTLINED_FUNCTION_18_5()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_23_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_5()
{
  sub_22D5DB9FC(*(void *)(v1 + *(int *)(v0 + 56)));
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_27_5(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_29_5()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_31_5()
{
  return swift_allocObject();
}

uint64_t sub_22D6C4BD8@<X0>(void *a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v2 = sub_22D6CCB98();
  OUTLINED_FUNCTION_0_1();
  uint64_t v36 = v3;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v34 - v8;
  uint64_t v10 = sub_22D6CCBA8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v34 - v17;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v35 = v1;
  v19((char *)&v34 - v17, v1, v10);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v18, v10);
  if (result == *MEMORY[0x263F20270])
  {
    uint64_t v21 = OUTLINED_FUNCTION_1_13();
    uint64_t result = v22(v21);
    char v23 = 0;
    uint64_t v24 = *(void *)v18;
LABEL_11:
    uint64_t v33 = v37;
    *uint64_t v37 = v24;
    *((unsigned char *)v33 + 8) = v23;
    return result;
  }
  if (result == *MEMORY[0x263F20260])
  {
    uint64_t v25 = OUTLINED_FUNCTION_1_13();
    v26(v25);
    uint64_t v24 = *(void *)v18;
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF230C0);
    uint64_t v28 = v36;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v9, &v18[*(int *)(v27 + 48)], v2);
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v7, v9, v2);
    int v29 = (*(uint64_t (**)(char *, uint64_t))(v28 + 88))(v7, v2);
    uint64_t v30 = *(void (**)(char *, uint64_t))(v28 + 8);
    if (v29 != *MEMORY[0x263F20248]) {
      v30(v7, v2);
    }
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v30)(v9, v2);
    char v23 = 1;
    goto LABEL_11;
  }
  if (result == *MEMORY[0x263F20278])
  {
    uint64_t v31 = OUTLINED_FUNCTION_1_13();
    uint64_t result = v32(v31);
    uint64_t v24 = *(void *)v18;
    char v23 = 2;
    goto LABEL_11;
  }
  if (result == *MEMORY[0x263F20268])
  {
    uint64_t v24 = 0;
    char v23 = 3;
    goto LABEL_11;
  }
  v19(v16, v35, v10);
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  sub_22D6CD3E8();
  sub_22D6CCF68();
  sub_22D6CD478();
  sub_22D6CCF68();
  uint64_t result = sub_22D6CD498();
  __break(1u);
  return result;
}

BOOL static Artwork.LoadingStatus.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a2 + 8);
  switch(*(unsigned char *)(a1 + 8))
  {
    case 1:
      if (v2 != 1) {
        goto LABEL_14;
      }
      goto LABEL_13;
    case 2:
      if (v2 != 2) {
        goto LABEL_14;
      }
      goto LABEL_13;
    case 3:
      if (v2 != 3 || *(void *)a2 != 0) {
        goto LABEL_14;
      }
      BOOL result = 1;
      break;
    default:
      if (*(unsigned char *)(a2 + 8)) {
LABEL_14:
      }
        BOOL result = 0;
      else {
LABEL_13:
      }
        BOOL result = *(double *)a1 == *(double *)a2;
      break;
  }
  return result;
}

uint64_t Artwork.LoadingStatus.hash(into:)()
{
  switch(*(unsigned char *)(v0 + 8))
  {
    case 1:
      sub_22D6CD638();
      sub_22D6CD658();
      goto LABEL_3;
    case 3:
LABEL_3:
      uint64_t result = sub_22D6CD638();
      break;
    default:
      sub_22D6CD638();
      uint64_t result = sub_22D6CD658();
      break;
  }
  return result;
}

uint64_t Artwork.LoadingStatus.hashValue.getter()
{
  return sub_22D6CD668();
}

uint64_t sub_22D6C50D4()
{
  return sub_22D6CD668();
}

uint64_t Artwork.LoadingStatus.description.getter()
{
  uint64_t result = 0x646574726174732ELL;
  switch(*(unsigned char *)(v0 + 8))
  {
    case 1:
      OUTLINED_FUNCTION_2_16();
      sub_22D6CD3E8();
      sub_22D6CCF68();
      sub_22D6CD188();
      sub_22D6CCF68();
      sub_22D6CCF68();
      goto LABEL_4;
    case 3:
      return result;
    default:
      OUTLINED_FUNCTION_2_16();
      sub_22D6CD3E8();
      OUTLINED_FUNCTION_3_15();
      sub_22D6CCF68();
      sub_22D6CD188();
LABEL_4:
      sub_22D6CCF68();
      uint64_t result = v2;
      break;
  }
  return result;
}

uint64_t Artwork.LoadingStatus.debugDescription.getter()
{
  return Artwork.LoadingStatus.description.getter();
}

unint64_t sub_22D6C52E8()
{
  unint64_t result = qword_26857EC00[0];
  if (!qword_26857EC00[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26857EC00);
  }
  return result;
}

uint64_t _s13LoadingStatusOwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 3) {
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

uint64_t _s13LoadingStatusOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_22D6C53C0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_22D6C53D8(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)unint64_t result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Artwork.LoadingStatus()
{
  return &type metadata for Artwork.LoadingStatus;
}

uint64_t sub_22D6C5400()
{
  OUTLINED_FUNCTION_2_17();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - v3;
  OUTLINED_FUNCTION_8();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v4, v1, v0);
  swift_storeEnumTagMultiPayload();
  return OUTLINED_FUNCTION_4_6();
}

uint64_t sub_22D6C54B8()
{
  OUTLINED_FUNCTION_2_17();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - v3;
  OUTLINED_FUNCTION_8();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v4, v1, v0);
  swift_storeEnumTagMultiPayload();
  return OUTLINED_FUNCTION_4_6();
}

uint64_t sub_22D6C5570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v11[0] = sub_22D6C561C();
  v11[1] = v6;
  char v12 = v7 & 1;
  uint64_t v13 = v8;
  uint64_t v9 = _s20DismissAlertModifierVMa();
  MEMORY[0x230F87DB0](v11, a2, v9, a4);
  swift_release();
  return swift_release();
}

uint64_t sub_22D6C561C()
{
  _s9ViewModelCMa();
  swift_getWitnessTable();
  uint64_t v0 = sub_22D6CB198();
  sub_22D5D10B4();
  return v0;
}

uint64_t _s20DismissAlertModifierVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22D6C56A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D6C56E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v101 = a3;
  uint64_t v83 = a2;
  uint64_t v90 = a1;
  uint64_t v99 = a8;
  _s20DismissAlertModifierVMa();
  swift_getWitnessTable();
  uint64_t v12 = sub_22D6CB668();
  uint64_t v13 = sub_22D6CD0E8();
  uint64_t WitnessTable = swift_getWitnessTable();
  __src[10] = *(void *)(*(void *)(a7 + 16) + 8);
  uint64_t v86 = v12;
  uint64_t v87 = v13;
  uint64_t v89 = WitnessTable;
  __dst[2] = WitnessTable;
  __dst[3] = swift_getWitnessTable();
  uint64_t v88 = __dst[3];
  __dst[0] = swift_getOpaqueTypeMetadata2();
  __dst[1] = swift_getOpaqueTypeConformance2();
  uint64_t v103 = __dst[1];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v16 = sub_22D6CB088();
  OUTLINED_FUNCTION_0_0();
  uint64_t v82 = v17;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v81 = (char *)&v78 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v80 = (char *)&v78 - v21;
  uint64_t v96 = swift_checkMetadataState();
  OUTLINED_FUNCTION_0_0();
  uint64_t v85 = v22;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v23);
  unint64_t v84 = (char *)&v78 - v24;
  OUTLINED_FUNCTION_0_0();
  uint64_t v93 = v25;
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  int v29 = (char *)&v78 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v102 = (char *)&v78 - v30;
  uint64_t v92 = OpaqueTypeMetadata2;
  uint64_t v98 = v16;
  uint64_t v97 = sub_22D6CB568();
  OUTLINED_FUNCTION_0_0();
  uint64_t v95 = v31;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v32);
  uint64_t v94 = (char *)&v78 - v33;
  int v100 = a4 & 1;
  LOBYTE(__dst[0]) = a4;
  uint64_t v91 = a5;
  __dst[1] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857AFC0);
  sub_22D6CC028();
  LODWORD(OpaqueTypeMetadata2) = LOBYTE(__src[0]);
  uint64_t v34 = a6;
  uint64_t v35 = a7;
  _s9ViewModelCMa();
  swift_getWitnessTable();
  uint64_t v36 = v83;
  uint64_t v37 = v101;
  sub_22D6CB168();
  uint64_t v38 = sub_22D654408();
  swift_release();
  __dst[0] = v38;
  if (OpaqueTypeMetadata2 == 1)
  {
    unint64_t v39 = (void *)swift_allocObject();
    v39[2] = v34;
    v39[3] = v35;
    v39[4] = v36;
    v39[5] = v37;
    OUTLINED_FUNCTION_9_11((uint64_t)v39);
    v39[7] = *(void *)(v40 - 256);
    swift_retain();
    swift_retain();
    swift_checkMetadataState();
    OUTLINED_FUNCTION_6_12();
    OUTLINED_FUNCTION_1_14();
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_5();
    uint64_t v42 = *(void *)(v41 - 256);
    sub_22D6CBD38();
    uint64_t v43 = OUTLINED_FUNCTION_3_16();
    v44(v43);
    __dst[0] = v37;
    __dst[1] = v42;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v46 = v102;
    uint64_t v47 = v92;
    sub_22D6B8B10(v29, v92);
    uint64_t v48 = *(void (**)(void))(v93 + 8);
    OUTLINED_FUNCTION_5_11();
    v48();
    sub_22D6B8B10(v46, v47);
    unint64_t v49 = sub_22D5DCFB0();
    uint64_t v104 = OpaqueTypeConformance2;
    unint64_t v105 = v49;
    swift_getWitnessTable();
    uint64_t v50 = v94;
    sub_22D6C5400();
    OUTLINED_FUNCTION_5_11();
    v48();
    OUTLINED_FUNCTION_5_11();
    v48();
  }
  else
  {
    uint64_t v51 = (void *)swift_allocObject();
    v51[2] = v34;
    v51[3] = v35;
    uint64_t v79 = v35;
    v51[4] = v36;
    v51[5] = v37;
    uint64_t v52 = OUTLINED_FUNCTION_9_11((uint64_t)v51);
    uint64_t v54 = *(void *)(v53 - 256);
    *(void *)(v52 + 56) = v54;
    swift_retain();
    swift_retain();
    swift_checkMetadataState();
    OUTLINED_FUNCTION_6_12();
    OUTLINED_FUNCTION_1_14();
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_5();
    sub_22D6CBD38();
    uint64_t v55 = OUTLINED_FUNCTION_3_16();
    v56(v55);
    uint64_t v57 = sub_22D6CB178();
    MEMORY[0x270FA5388](v57);
    *(&v78 - 2) = v34;
    uint64_t v58 = v34;
    uint64_t v59 = v79;
    *(&v78 - 1) = v79;
    swift_getKeyPath();
    sub_22D6CB188();
    swift_release();
    swift_release();
    memcpy(__dst, __src, sizeof(__dst));
    uint64_t v60 = swift_allocObject();
    *(void *)(v60 + 16) = v58;
    *(void *)(v60 + 24) = v59;
    uint64_t v61 = v101;
    *(void *)(v60 + 32) = v36;
    *(void *)(v60 + 40) = v61;
    *(unsigned char *)(v60 + 48) = v100;
    *(void *)(v60 + 56) = v54;
    swift_retain();
    swift_retain();
    uint64_t v112 = v37;
    uint64_t v113 = v103;
    uint64_t v62 = swift_getOpaqueTypeConformance2();
    uint64_t v63 = v81;
    uint64_t v64 = v92;
    uint64_t v65 = v102;
    sub_22D69B780(__dst, (uint64_t)sub_22D6C6400, v60, v92, v62);
    swift_release();
    sub_22D5DCEC4((uint64_t)__dst);
    (*(void (**)(char *, uint64_t))(v93 + 8))(v65, v64);
    unint64_t v66 = sub_22D5DCFB0();
    uint64_t v110 = v62;
    unint64_t v111 = v66;
    uint64_t v67 = v98;
    swift_getWitnessTable();
    uint64_t v68 = v80;
    sub_22D6B8B10(v63, v67);
    uint64_t v69 = *(void (**)(uint64_t))(v82 + 8);
    uint64_t v70 = OUTLINED_FUNCTION_8_12();
    v69(v70);
    sub_22D6B8B10(v68, v67);
    uint64_t v50 = v94;
    sub_22D6C54B8();
    uint64_t v71 = OUTLINED_FUNCTION_8_12();
    v69(v71);
    uint64_t v72 = v68;
    uint64_t v42 = v103;
    ((void (*)(char *, uint64_t))v69)(v72, v67);
  }
  __src[0] = v37;
  __src[1] = v42;
  uint64_t v73 = swift_getOpaqueTypeConformance2();
  unint64_t v74 = sub_22D5DCFB0();
  uint64_t v108 = v73;
  unint64_t v109 = v74;
  uint64_t v75 = swift_getWitnessTable();
  uint64_t v106 = v73;
  uint64_t v107 = v75;
  uint64_t v76 = v97;
  swift_getWitnessTable();
  sub_22D6B8B10(v50, v76);
  return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v50, v76);
}

uint64_t sub_22D6C6098()
{
  return sub_22D6CC038();
}

uint64_t *sub_22D6C61B0()
{
  _s9ViewModelCMa();
  swift_getWitnessTable();
  sub_22D6CB168();
  sub_22D655058(&v28);
  long long v0 = v28;
  uint64_t v9 = v29;
  uint64_t v10 = v30;
  uint64_t v11 = v31;
  uint64_t v12 = v32;
  uint64_t v13 = v33;
  uint64_t v14 = v34;
  swift_release();
  if (qword_26857ADA0 != -1) {
    swift_once();
  }
  v37[0] = xmmword_268585210;
  v37[1] = *(_OWORD *)&qword_268585220;
  void v37[2] = xmmword_268585230;
  void v37[3] = *(_OWORD *)&qword_268585240;
  long long v1 = xmmword_268585210;
  uint64_t v2 = qword_268585220;
  uint64_t v3 = qword_268585228;
  long long v4 = xmmword_268585230;
  uint64_t v5 = qword_268585240;
  uint64_t v6 = qword_268585248;
  sub_22D6C6480((uint64_t)&v28, (uint64_t)v35);
  if (v36)
  {
    long long v15 = v0;
    uint64_t v16 = v9;
    uint64_t v17 = v10;
    uint64_t v18 = v11;
    uint64_t v19 = v12;
    uint64_t v20 = v13;
    uint64_t v21 = v14;
    char v7 = sub_22D68ADFC(&v15, v37);
    unint64_t result = sub_22D6C64E8((uint64_t *)&v28);
    if (v7)
    {
      sub_22D6CB168();
      sub_22D5DADC8();
      sub_22D658D10();
      return (uint64_t *)swift_release();
    }
  }
  else
  {
    long long v15 = v0;
    uint64_t v16 = v9;
    uint64_t v17 = v10;
    uint64_t v18 = v11;
    uint64_t v19 = v12;
    uint64_t v20 = v13;
    uint64_t v21 = v14;
    long long v22 = v1;
    uint64_t v23 = v2;
    uint64_t v24 = v3;
    long long v25 = v4;
    uint64_t v26 = v5;
    uint64_t v27 = v6;
    sub_22D5DD59C((uint64_t)v37);
    return sub_22D5DD5F4((uint64_t *)&v15);
  }
  return result;
}

uint64_t sub_22D6C63BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22D6C56E8(a1, *(void *)v3, *(void *)(v3 + 8), *(unsigned char *)(v3 + 16), *(void *)(v3 + 24), *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_22D6C63E4()
{
  return 16;
}

__n128 sub_22D6C63F0(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t *sub_22D6C6400()
{
  return sub_22D6C61B0();
}

uint64_t objectdestroyTm_11()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D6C6458()
{
  return sub_22D6C6098();
}

uint64_t sub_22D6C6480(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26857AE58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_22D6C64E8(uint64_t *a1)
{
  return a1;
}

uint64_t sub_22D6C6524()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_6_12()
{
  return swift_checkMetadataState();
}

uint64_t ArtworkImage.init(_:width:height:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF230A0);
  uint64_t v4 = OUTLINED_FUNCTION_9(v3);
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = OUTLINED_FUNCTION_5_12();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v17 - v12;
  sub_22D62A464(a1, v1);
  if (__swift_getEnumTagSinglePayload(v1, 1, v5) == 1)
  {
    sub_22D6CCC48();
    sub_22D644284(v1);
  }
  else
  {
    uint64_t v14 = OUTLINED_FUNCTION_7_12();
    v15(v14);
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v13, v5);
  sub_22D6CAC08();
  sub_22D644284(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v13, v5);
}

uint64_t ArtworkImage.artworkIdealAspectRatio(_:contentMode:)()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF230D0);
  uint64_t v2 = OUTLINED_FUNCTION_9(v1);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D6CABF8();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t))(v7 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v0);
  uint64_t v8 = sub_22D6CAB08();
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v8);
  return sub_22D6CAB68();
}

uint64_t ArtworkImage.init(_:)(uint64_t a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF230A0);
  uint64_t v5 = OUTLINED_FUNCTION_9(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = OUTLINED_FUNCTION_5_12();
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_22_1();
  sub_22D62A464(a1, v1);
  if (__swift_getEnumTagSinglePayload(v1, 1, v6) == 1)
  {
    sub_22D6CCC48();
    sub_22D644284(v1);
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_7_12();
    v11(v10);
  }
  sub_22D6CAB58();
  sub_22D644284(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v2, v6);
}

uint64_t ArtworkImage.init(_:width:)(uint64_t a1, double a2)
{
  return sub_22D6C6B64(a1, MEMORY[0x263F20220], a2);
}

uint64_t ArtworkImage.init(_:height:)(uint64_t a1, double a2)
{
  return sub_22D6C6B64(a1, MEMORY[0x263F20228], a2);
}

uint64_t sub_22D6C6B64(uint64_t a1, void (*a2)(char *, double), double a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF230A0);
  uint64_t v8 = OUTLINED_FUNCTION_9(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_22_1();
  uint64_t v9 = sub_22D6CCCB8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  long long v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v19 - v16;
  sub_22D62A464(a1, v3);
  if (__swift_getEnumTagSinglePayload(v3, 1, v9) == 1)
  {
    sub_22D6CCC48();
    sub_22D644284(v3);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v17, v3, v9);
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v17, v9);
  a2(v15, a3);
  sub_22D644284(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v17, v9);
}

uint64_t ArtworkImage.artworkCropStyle(_:)()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF230D0);
  uint64_t v2 = OUTLINED_FUNCTION_9(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_1_15();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = OUTLINED_FUNCTION_2_18(v4, v9);
  v6(v5);
  sub_22D6CCC08();
  uint64_t v7 = sub_22D6CAB08();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v7);
  OUTLINED_FUNCTION_8_13();
  OUTLINED_FUNCTION_4_7();
  return sub_22D6CAB68();
}

uint64_t ArtworkImage.artworkImageFormat(_:)()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF230D0);
  uint64_t v2 = OUTLINED_FUNCTION_9(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_1_15();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = OUTLINED_FUNCTION_2_18(v4, v9);
  v6(v5);
  sub_22D6CCBD8();
  uint64_t v7 = sub_22D6CAB08();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v7);
  OUTLINED_FUNCTION_4_7();
  return sub_22D6CAB68();
}

uint64_t ArtworkImage.artworkBackgroundColor(_:)()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF230D0);
  uint64_t v3 = OUTLINED_FUNCTION_9(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_15();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v0);
  uint64_t v7 = sub_22D6CAB08();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v7);
  swift_retain();
  OUTLINED_FUNCTION_8_13();
  return sub_22D6CAB68();
}

uint64_t sub_22D6C7014()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23198);
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7 - v6;
  if (*(unsigned char *)(v0 + 40))
  {
    sub_22D6C811C();
    sub_22D6CC938();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
    if (v10) {
      return v10;
    }
  }
  swift_retain();
  return v1;
}

void sub_22D6C70FC()
{
  uint64_t v1 = OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_isPolicyApplied;
  if ((*(unsigned char *)(v0
                 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_isPolicyApplied) & 1) == 0)
  {
    uint64_t v2 = v0;
    if (qword_26AF230F8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_22D6CAD08();
    __swift_project_value_buffer(v3, (uint64_t)qword_26AF23A70);
    OUTLINED_FUNCTION_8_14();
    uint64_t v4 = sub_22D6CACE8();
    os_log_type_t v5 = sub_22D6CD298();
    if (os_log_type_enabled(v4, v5))
    {
      OUTLINED_FUNCTION_7_13();
      uint64_t v15 = swift_slowAlloc();
      OUTLINED_FUNCTION_9_12(4.8751e-34);
      uint64_t v6 = sub_22D6C898C(0);
      unint64_t v8 = v7;
      swift_release();
      sub_22D6BB008(v6, v8, &v15);
      OUTLINED_FUNCTION_4_8();
      OUTLINED_FUNCTION_3_17();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_11_10(&dword_22D5CD000, v9, v10, "Applying artwork caching policy for %{public}s.");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_40_0();
      OUTLINED_FUNCTION_40_0();
    }
    else
    {

      OUTLINED_FUNCTION_3_17();
    }
    uint64_t v11 = *(void *)(v2 + 16);
    unint64_t v12 = *(void *)(v2 + 24);
    uint64_t v13 = *(void *)(v2 + 32);
    char v14 = *(unsigned char *)(v2 + 40);
    swift_bridgeObjectRetain();
    sub_22D6C741C(v2, v11, v12, v13, v14);
    swift_bridgeObjectRelease();
    *(unsigned char *)(v2 + v1) = 1;
  }
}

uint64_t sub_22D6C72A8(uint64_t a1)
{
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = Strong;
    swift_release();
    if (a1 && v3 == a1)
    {
LABEL_11:
      return swift_release();
    }
  }
  else if (!a1)
  {
    goto LABEL_11;
  }
  if (swift_weakLoadStrong())
  {
    OUTLINED_FUNCTION_5_13();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23190);
    sub_22D6CC8C8();
    swift_endAccess();
    swift_release();
  }
  swift_weakAssign();
  if (swift_weakLoadStrong())
  {
    OUTLINED_FUNCTION_5_13();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23190);
    sub_22D6CC8B8();
    swift_endAccess();
    swift_release();
  }
  sub_22D6C7E90();
  return swift_release();
}

uint64_t sub_22D6C73DC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a3;
  *(unsigned char *)(v4 + 40) = a4 & 1;
  swift_bridgeObjectRelease();
  return sub_22D6C7E90();
}

void sub_22D6C741C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0)
  {
    if (qword_26AF230F8 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_22D6CAD08();
    __swift_project_value_buffer(v9, (uint64_t)qword_26AF23A70);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v10 = sub_22D6CACE8();
    os_log_type_t v11 = sub_22D6CD298();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v20 = v19;
      *(_DWORD *)uint64_t v12 = 134349570;
      sub_22D6CD338();
      *(_WORD *)(v12 + 12) = 2082;
      swift_bridgeObjectRetain();
      sub_22D6BB008(a2, a3, &v20);
      sub_22D6CD338();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 22) = 2082;
      uint64_t v13 = sub_22D6C898C(0);
      uint64_t v14 = a4;
      unint64_t v16 = v15;
      swift_release();
      sub_22D6BB008(v13, v16, &v20);
      sub_22D6CD338();
      swift_release();
      a4 = v14;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D5CD000, v10, v11, "Setting cache limit %{public}ld for cache identifier: \"%{public}s\" and cache reference: %{public}s.", (uint8_t *)v12, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x230F89D10](v19, -1, -1);
      MEMORY[0x230F89D10](v12, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
    uint64_t v17 = self;
    uint64_t v18 = (void *)sub_22D6CCED8();
    objc_msgSend(v17, sel_setCacheLimit_forCacheIdentifier_cacheReference_, a4, v18, a1);
  }
}

uint64_t sub_22D6C76B8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = v5
      + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_cachedActivePolicyNodes;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23198);
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v11);
  *(unsigned char *)(v5 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_isPolicyApplied) = 0;
  swift_weakInit();
  sub_22D6CC898();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = a3;
  *(unsigned char *)(v5 + 40) = a4 & 1;
  if (qword_26AF230F8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_22D6CAD08();
  __swift_project_value_buffer(v12, (uint64_t)qword_26AF23A70);
  OUTLINED_FUNCTION_8_14();
  uint64_t v13 = sub_22D6CACE8();
  os_log_type_t v14 = sub_22D6CD298();
  if (os_log_type_enabled(v13, v14))
  {
    OUTLINED_FUNCTION_7_13();
    uint64_t v21 = swift_slowAlloc();
    OUTLINED_FUNCTION_9_12(4.8751e-34);
    uint64_t v15 = sub_22D6C898C(0);
    unint64_t v17 = v16;
    swift_release();
    sub_22D6BB008(v15, v17, &v21);
    OUTLINED_FUNCTION_4_8();
    OUTLINED_FUNCTION_3_17();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_11_10(&dword_22D5CD000, v18, v19, "Initialized %{public}s.");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_40_0();
    OUTLINED_FUNCTION_40_0();
  }
  else
  {

    OUTLINED_FUNCTION_3_17();
  }
  return v5;
}

uint64_t sub_22D6C78CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23190);
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_0();
  uint64_t v26 = v7 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23188);
  OUTLINED_FUNCTION_0_1();
  uint64_t v27 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12 - v11;
  if (qword_26AF230F8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_22D6CAD08();
  __swift_project_value_buffer(v14, (uint64_t)qword_26AF23A70);
  OUTLINED_FUNCTION_8_14();
  uint64_t v15 = sub_22D6CACE8();
  os_log_type_t v16 = sub_22D6CD298();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v25 = v2;
    unint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_7_13();
    v28[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v17 = 136446210;
    swift_retain();
    uint64_t v18 = sub_22D6C898C(0);
    unint64_t v20 = v19;
    swift_release();
    sub_22D6BB008(v18, v20, v28);
    sub_22D6CD338();
    OUTLINED_FUNCTION_3_17();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D5CD000, v15, v16, "Deallocating %{public}s.", v17, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_40_0();
    uint64_t v2 = v25;
    OUTLINED_FUNCTION_40_0();
  }
  else
  {

    OUTLINED_FUNCTION_3_17();
  }
  if (swift_weakLoadStrong())
  {
    swift_beginAccess();
    swift_retain();
    sub_22D6CC8C8();
    swift_endAccess();
    swift_release();
  }
  uint64_t v21 = v1 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_children;
  OUTLINED_FUNCTION_31_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v26, v21, v2);
  sub_22D6CC8A8();
  long long v22 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v22(v26, v2);
  while (sub_22D6CC8D8())
  {
    uint64_t v23 = swift_retain();
    sub_22D6C72A8(v23);
    swift_release();
  }
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v13, v8);
  swift_release();
  swift_bridgeObjectRelease();
  sub_22D6C90E8(v1 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_cachedActivePolicyNodes);
  swift_weakDestroy();
  v22(v21, v2);
  return v1;
}

uint64_t sub_22D6C7C68()
{
  sub_22D6C78CC();
  OUTLINED_FUNCTION_21();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_22D6C7CA0()
{
  return _s4NodeCMa();
}

uint64_t _s4NodeCMa()
{
  uint64_t result = qword_26AF231E8;
  if (!qword_26AF231E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22D6C7CF0()
{
  sub_22D6C7DDC();
  if (v0 <= 0x3F)
  {
    sub_22D6C7E38();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_22D6C7DDC()
{
  if (!qword_26857EC88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AF23198);
    unint64_t v0 = sub_22D6CD328();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26857EC88);
    }
  }
}

void sub_22D6C7E38()
{
  if (!qword_26857EC90)
  {
    _s4NodeCMa();
    unint64_t v0 = sub_22D6CC8E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26857EC90);
    }
  }
}

uint64_t sub_22D6C7E90()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23190);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23188);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF231A0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23198);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v12);
  uint64_t v13 = v0
      + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_cachedActivePolicyNodes;
  swift_beginAccess();
  sub_22D6C902C((uint64_t)v11, v13);
  swift_endAccess();
  uint64_t v14 = v0 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_children;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v14, v1);
  sub_22D6CC8A8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  while (sub_22D6CC8D8())
  {
    sub_22D6C7E90();
    swift_release();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_22D6C811C()
{
  OUTLINED_FUNCTION_21();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF231A0);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v31 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23198);
  OUTLINED_FUNCTION_0_1();
  uint64_t v9 = v8;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v31 - v14;
  uint64_t v16 = v0
      + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_cachedActivePolicyNodes;
  OUTLINED_FUNCTION_31_2();
  sub_22D6C9148(v16, (uint64_t)v6);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    sub_22D6C90E8((uint64_t)v6);
    if (swift_weakLoadStrong())
    {
      sub_22D6C811C();
      swift_release();
    }
    else
    {
      sub_22D6CC928();
    }
    uint64_t v19 = *(void *)(v0 + 16);
    uint64_t v18 = *(void *)(v0 + 24);
    uint64_t v35 = v19;
    uint64_t v36 = v18;
    swift_bridgeObjectRetain();
    sub_22D6CC938();
    if (v34 && (swift_release(), (*(unsigned char *)(v0 + 40) & 1) != 0))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v34 = v0;
      uint64_t v35 = v19;
      uint64_t v36 = v18;
      swift_retain();
      sub_22D6CC948();
    }
    OUTLINED_FUNCTION_12_7();
    v20();
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v7);
    swift_beginAccess();
    sub_22D6C902C((uint64_t)v4, v16);
    swift_endAccess();
    if (qword_26AF230F8 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_22D6CAD08();
    __swift_project_value_buffer(v21, (uint64_t)qword_26AF23A70);
    swift_retain_n();
    long long v22 = sub_22D6CACE8();
    os_log_type_t v23 = sub_22D6CD298();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v35 = v32;
      *(_DWORD *)uint64_t v24 = 136446466;
      uint64_t v25 = sub_22D6C898C(2);
      uint64_t v34 = sub_22D6BB008(v25, v26, &v35);
      sub_22D6CD338();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2082;
      OUTLINED_FUNCTION_31_2();
      uint64_t v27 = sub_22D6C85B8();
      uint64_t v33 = sub_22D6BB008(v27, v28, &v35);
      sub_22D6CD338();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D5CD000, v22, v23, "%{public}s did update cached active policy nodes: %{public}s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_40_0();
      OUTLINED_FUNCTION_40_0();
    }
    else
    {

      swift_release_n();
    }
  }
  else
  {
    unint64_t v17 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v17(v13, v6, v7);
    v17(v15, v13, v7);
  }
  OUTLINED_FUNCTION_31_2();
  OUTLINED_FUNCTION_12_7();
  v29();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v15, v7);
}

uint64_t sub_22D6C85B8()
{
  uint64_t v11 = 0;
  unint64_t v12 = 0xE000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23198);
  uint64_t v8 = sub_22D6CC918();
  swift_bridgeObjectRetain();
  sub_22D6C91B0((char **)&v8);
  swift_bridgeObjectRelease();
  uint64_t v0 = *(void *)(v8 + 16);
  if (v0)
  {
    uint64_t v1 = (char *)(v8 + 40);
    do
    {
      unint64_t v2 = *(void *)v1;
      uint64_t v8 = *((void *)v1 - 1);
      unint64_t v9 = v2;
      swift_bridgeObjectRetain();
      sub_22D6CC938();
      if (v10)
      {
        uint64_t v3 = v11 & 0xFFFFFFFFFFFFLL;
        if ((v12 & 0x2000000000000000) != 0) {
          uint64_t v3 = HIBYTE(v12) & 0xF;
        }
        if (v3) {
          sub_22D6CCF68();
        }
        uint64_t v8 = 0x22202020200ALL;
        unint64_t v9 = 0xE600000000000000;
        sub_22D6CCF68();
        swift_bridgeObjectRelease();
        sub_22D6CCF68();
        sub_22D6C898C(2);
        sub_22D6CCF68();
        swift_bridgeObjectRelease();
        sub_22D6CCF68();
        swift_release();
      }
      swift_bridgeObjectRelease();
      v1 += 16;
      --v0;
    }
    while (v0);
    swift_release();
    uint64_t v4 = v11;
    unint64_t v5 = v12;
  }
  else
  {
    swift_release();
    uint64_t v4 = 0;
    unint64_t v5 = 0xE000000000000000;
  }
  uint64_t v6 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0) {
    uint64_t v6 = v4 & 0xFFFFFFFFFFFFLL;
  }
  if (v6)
  {
    uint64_t v8 = 91;
    unint64_t v9 = 0xE100000000000000;
    sub_22D6CCF68();
    swift_bridgeObjectRelease();
    sub_22D6CCF68();
    return v8;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 6109787;
  }
}

uint64_t sub_22D6C87BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22D6CAD18();
  *a1 = result;
  return result;
}

BOOL sub_22D6C880C(uint64_t *a1, uint64_t *a2)
{
  return sub_22D679B88(*a1, *a2);
}

uint64_t sub_22D6C8830()
{
  int v1 = *(unsigned __int8 *)(v0 + 40);
  swift_bridgeObjectRetain();
  sub_22D6CCF58();
  sub_22D6CD648();
  if (v1 != 1) {
    sub_22D6CD638();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D6C88C4()
{
  return sub_22D6CD668();
}

uint64_t sub_22D6C8904()
{
  return sub_22D6C88C4();
}

uint64_t sub_22D6C8928()
{
  return sub_22D6C8830();
}

uint64_t sub_22D6C894C()
{
  return sub_22D6CD668();
}

uint64_t sub_22D6C898C(int a1)
{
  int v19 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23190);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = 0;
  unint64_t v22 = 0xE000000000000000;
  sub_22D6CD3E8();
  sub_22D6CCF68();
  uint64_t v27 = v1;
  sub_22D6CD478();
  uint64_t v27 = v21;
  unint64_t v28 = v22;
  uint64_t v21 = 0x7963696C6F70203BLL;
  unint64_t v22 = 0xEB00000000203D20;
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  unint64_t v25 = 0xD000000000000017;
  unint64_t v26 = 0x800000022D6D7300;
  uint64_t v23 = 0x22203A6469;
  unint64_t v24 = 0xE500000000000000;
  swift_bridgeObjectRetain();
  sub_22D6CCF68();
  sub_22D6CCF68();
  sub_22D6CCF68();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0)
  {
    uint64_t v23 = 0x3A74696D696C202CLL;
    unint64_t v24 = 0xE900000000000020;
    uint64_t v20 = v6;
    sub_22D6CD578();
    sub_22D6CCF68();
    swift_bridgeObjectRelease();
    sub_22D6CCF68();
    swift_bridgeObjectRelease();
  }
  sub_22D6CCF68();
  sub_22D6CCF68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22D6CCF68();
  swift_bridgeObjectRelease();
  if (v19 != 1)
  {
    if (v19 != 2)
    {
LABEL_26:
      sub_22D6CCF68();
      return v27;
    }
    uint64_t v8 = v1 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_children;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_22D6C9094();
    uint64_t v9 = sub_22D6CCFB8();
    if (v9 < 0 || (v9 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_22D6CD4A8();
      swift_release();
      if (v17)
      {
        swift_bridgeObjectRetain();
        uint64_t v10 = sub_22D6CD4A8();
        swift_release();
LABEL_8:
        if (v10 >= 2)
        {
          unint64_t v25 = 0;
          unint64_t v26 = 0xE000000000000000;
          sub_22D6CD3E8();
          swift_release();
          swift_bridgeObjectRelease();
          unint64_t v25 = 0x1000000000000012;
          unint64_t v26 = 0x800000022D6D7560;
          uint64_t v23 = v10;
          sub_22D6CD578();
          sub_22D6CCF68();
          swift_bridgeObjectRelease();
          sub_22D6CCF68();
          sub_22D6CCF68();
          swift_bridgeObjectRelease();
          goto LABEL_26;
        }
LABEL_21:
        swift_release();
        sub_22D6CCF68();
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v10 = *(void *)(v9 + 16);
      if (v10) {
        goto LABEL_8;
      }
    }
LABEL_25:
    swift_release();
    goto LABEL_26;
  }
  if (swift_weakLoadStrong())
  {
    uint64_t v21 = 0x746E65726170203BLL;
    unint64_t v22 = 0xEB00000000203D20;
    sub_22D6C898C(0);
    sub_22D6CCF68();
    swift_bridgeObjectRelease();
    sub_22D6CCF68();
    swift_release();
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = v1 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_children;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
  sub_22D6C9094();
  uint64_t v12 = sub_22D6CCFB8();
  uint64_t v13 = v12;
  if (v12 < 0 || (v12 & 0x4000000000000000) != 0)
  {
    uint64_t v14 = sub_22D6CD4A8();
    if (!v14) {
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v14 = *(void *)(v12 + 16);
    if (!v14) {
      goto LABEL_25;
    }
  }
  uint64_t result = sub_22D6CCF68();
  if (v14 >= 1)
  {
    uint64_t v16 = 0;
    do
    {
      if ((v13 & 0xC000000000000001) != 0) {
        MEMORY[0x230F89370](v16, v13);
      }
      else {
        swift_retain();
      }
      ++v16;
      unint64_t v25 = 0x202020200ALL;
      unint64_t v26 = 0xE500000000000000;
      sub_22D6C898C(0);
      sub_22D6CCF68();
      swift_bridgeObjectRelease();
      sub_22D6CCF68();
      sub_22D6CCF68();
      swift_release();
      swift_bridgeObjectRelease();
    }
    while (v14 != v16);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_22D6C8F80()
{
  return sub_22D6C898C(0);
}

uint64_t sub_22D6C8F88()
{
  return sub_22D6C898C(1);
}

uint64_t sub_22D6C8F90()
{
  return sub_22D6C8F80();
}

uint64_t sub_22D6C8FB4()
{
  return sub_22D6C8F88();
}

unint64_t sub_22D6C8FDC()
{
  unint64_t result = qword_26AF231E0;
  if (!qword_26AF231E0)
  {
    _s4NodeCMa();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF231E0);
  }
  return result;
}

uint64_t sub_22D6C902C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF231A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_22D6C9094()
{
  unint64_t result = qword_26857ECF8;
  if (!qword_26857ECF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AF23190);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857ECF8);
  }
  return result;
}

uint64_t sub_22D6C90E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF231A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D6C9148(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF231A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_22D6C91B0(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22D667D28((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v4[0] = (uint64_t)(v2 + 32);
  v4[1] = v3;
  sub_22D6C921C(v4);
  *a1 = v2;
}

void sub_22D6C921C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_22D6CD568();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        sub_22D6C9884(0, v3, 1, a1);
      }
      return;
    }
    goto LABEL_144;
  }
  uint64_t v5 = v4;
  uint64_t v99 = sub_22D66324C(v3 / 2);
  uint64_t v100 = v3;
  uint64_t v101 = v6;
  uint64_t v97 = a1;
  if (v3 <= 0)
  {
    uint64_t v102 = (void *)MEMORY[0x263F8EE78];
    unint64_t v31 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_110:
    if (v31 < 2)
    {
LABEL_121:
      swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        *(void *)(v99 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_149;
    }
    uint64_t v88 = *v97;
    while (1)
    {
      unint64_t v89 = v31 - 2;
      if (v31 < 2) {
        break;
      }
      if (!v88) {
        goto LABEL_153;
      }
      uint64_t v90 = v102;
      uint64_t v91 = v102[2 * v89 + 4];
      uint64_t v92 = v102[2 * v31 + 3];
      sub_22D6C994C((char *)(v88 + 16 * v91), (char *)(v88 + 16 * v102[2 * v31 + 2]), v88 + 16 * v92, v101);
      if (v1) {
        goto LABEL_106;
      }
      if (v92 < v91) {
        goto LABEL_139;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22D665BDC();
        uint64_t v90 = v95;
      }
      if (v89 >= v90[2]) {
        goto LABEL_140;
      }
      uint64_t v93 = &v90[2 * v89 + 4];
      *uint64_t v93 = v91;
      v93[1] = v92;
      unint64_t v94 = v90[2];
      if (v31 > v94) {
        goto LABEL_141;
      }
      memmove(&v90[2 * v31 + 2], &v90[2 * v31 + 4], 16 * (v94 - v31));
      uint64_t v102 = v90;
      v90[2] = v94 - 1;
      unint64_t v31 = v94 - 1;
      uint64_t v3 = v100;
      if (v94 <= 2) {
        goto LABEL_121;
      }
    }
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
LABEL_144:
    __break(1u);
LABEL_145:
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
LABEL_152:
    __break(1u);
LABEL_153:
    __break(1u);
    return;
  }
  uint64_t v98 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v96 = *a1 + 8;
  uint64_t v102 = (void *)MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v9 = v7++;
    if (v7 >= v3) {
      goto LABEL_32;
    }
    uint64_t v10 = (uint64_t *)(v8 + 16 * v7);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    uint64_t v13 = (void *)(v8 + 16 * v9);
    if (v11 == *v13 && v12 == v13[1])
    {
      uint64_t v16 = v9 + 2;
      if (v9 + 2 >= v3) {
        goto LABEL_31;
      }
      int v15 = 0;
LABEL_13:
      uint64_t v17 = (void *)(v96 + 16 * v16);
      do
      {
        uint64_t v18 = (void *)(v8 + 16 * v7);
        if (*(v17 - 1) == *v18 && *v17 == v18[1])
        {
          if (v15) {
            goto LABEL_24;
          }
        }
        else if ((v15 ^ sub_22D6CD5A8()))
        {
          goto LABEL_23;
        }
        v17 += 2;
        uint64_t v20 = v16 + 1;
        uint64_t v7 = v16;
        uint64_t v16 = v20;
      }
      while (v20 < v3);
      uint64_t v16 = v20;
      goto LABEL_23;
    }
    int v15 = sub_22D6CD5A8();
    uint64_t v16 = v9 + 2;
    if (v9 + 2 < v3) {
      goto LABEL_13;
    }
LABEL_23:
    uint64_t v7 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_32;
    }
LABEL_24:
    if (v16 < v9) {
      goto LABEL_148;
    }
    if (v9 < v16)
    {
      uint64_t v21 = 16 * v16;
      uint64_t v22 = 16 * v9;
      uint64_t v23 = v16;
      uint64_t v24 = v9;
      do
      {
        if (v24 != --v23)
        {
          if (!v8) {
            goto LABEL_152;
          }
          uint64_t v25 = v8 + v21;
          uint64_t v26 = *(void *)(v8 + v22);
          uint64_t v27 = *(void *)(v8 + v22 + 8);
          *(_OWORD *)(v8 + v22) = *(_OWORD *)(v8 + v21 - 16);
          *(void *)(v25 - 16) = v26;
          *(void *)(v25 - 8) = v27;
        }
        ++v24;
        v21 -= 16;
        v22 += 16;
      }
      while (v24 < v23);
    }
LABEL_31:
    uint64_t v7 = v16;
LABEL_32:
    if (v7 >= v3) {
      goto LABEL_41;
    }
    if (__OFSUB__(v7, v9)) {
      goto LABEL_143;
    }
    if (v7 - v9 >= v98) {
      goto LABEL_41;
    }
    if (__OFADD__(v9, v98)) {
      goto LABEL_146;
    }
    if (v9 + v98 >= v3) {
      uint64_t v28 = v3;
    }
    else {
      uint64_t v28 = v9 + v98;
    }
    if (v28 < v9) {
      goto LABEL_147;
    }
    if (v7 == v28)
    {
LABEL_41:
      uint64_t v29 = v102;
    }
    else
    {
      uint64_t v79 = (void *)(v8 + 16 * v7);
      uint64_t v29 = v102;
      do
      {
        uint64_t v80 = (uint64_t *)(v8 + 16 * v7);
        uint64_t v81 = *v80;
        uint64_t v82 = v80[1];
        uint64_t v83 = v9;
        unint64_t v84 = v79;
        do
        {
          BOOL v85 = v81 == *(v84 - 2) && v82 == *(v84 - 1);
          if (v85 || (sub_22D6CD5A8() & 1) == 0) {
            break;
          }
          if (!v8) {
            goto LABEL_150;
          }
          uint64_t v81 = *v84;
          uint64_t v82 = v84[1];
          *(_OWORD *)unint64_t v84 = *((_OWORD *)v84 - 1);
          *(v84 - 1) = v82;
          *(v84 - 2) = v81;
          v84 -= 2;
          ++v83;
        }
        while (v7 != v83);
        ++v7;
        v79 += 2;
      }
      while (v7 != v28);
      uint64_t v7 = v28;
    }
    if (v7 < v9) {
      goto LABEL_142;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_22D665B04();
      uint64_t v29 = v86;
    }
    unint64_t v30 = v29[2];
    unint64_t v31 = v30 + 1;
    if (v30 >= v29[3] >> 1)
    {
      sub_22D665B04();
      uint64_t v29 = v87;
    }
    v29[2] = v31;
    uint64_t v32 = v29 + 4;
    uint64_t v33 = &v29[2 * v30 + 4];
    *uint64_t v33 = v9;
    v33[1] = v7;
    uint64_t v102 = v29;
    if (v30) {
      break;
    }
    unint64_t v31 = 1;
LABEL_90:
    uint64_t v3 = v100;
    if (v7 >= v100) {
      goto LABEL_110;
    }
  }
  while (1)
  {
    unint64_t v34 = v31 - 1;
    if (v31 >= 4)
    {
      unint64_t v39 = &v32[2 * v31];
      uint64_t v40 = *(v39 - 8);
      uint64_t v41 = *(v39 - 7);
      BOOL v45 = __OFSUB__(v41, v40);
      uint64_t v42 = v41 - v40;
      if (v45) {
        goto LABEL_127;
      }
      uint64_t v44 = *(v39 - 6);
      uint64_t v43 = *(v39 - 5);
      BOOL v45 = __OFSUB__(v43, v44);
      uint64_t v37 = v43 - v44;
      char v38 = v45;
      if (v45) {
        goto LABEL_128;
      }
      unint64_t v46 = v31 - 2;
      uint64_t v47 = &v32[2 * v31 - 4];
      uint64_t v49 = *v47;
      uint64_t v48 = v47[1];
      BOOL v45 = __OFSUB__(v48, v49);
      uint64_t v50 = v48 - v49;
      if (v45) {
        goto LABEL_129;
      }
      BOOL v45 = __OFADD__(v37, v50);
      uint64_t v51 = v37 + v50;
      if (v45) {
        goto LABEL_131;
      }
      if (v51 >= v42)
      {
        uint64_t v69 = &v32[2 * v34];
        uint64_t v71 = *v69;
        uint64_t v70 = v69[1];
        BOOL v45 = __OFSUB__(v70, v71);
        uint64_t v72 = v70 - v71;
        if (v45) {
          goto LABEL_137;
        }
        BOOL v62 = v37 < v72;
        goto LABEL_79;
      }
    }
    else
    {
      if (v31 != 3)
      {
        uint64_t v63 = v29[4];
        uint64_t v64 = v29[5];
        BOOL v45 = __OFSUB__(v64, v63);
        uint64_t v56 = v64 - v63;
        char v57 = v45;
        goto LABEL_73;
      }
      uint64_t v36 = v29[4];
      uint64_t v35 = v29[5];
      BOOL v45 = __OFSUB__(v35, v36);
      uint64_t v37 = v35 - v36;
      char v38 = v45;
    }
    if (v38) {
      goto LABEL_130;
    }
    unint64_t v46 = v31 - 2;
    uint64_t v52 = &v32[2 * v31 - 4];
    uint64_t v54 = *v52;
    uint64_t v53 = v52[1];
    BOOL v55 = __OFSUB__(v53, v54);
    uint64_t v56 = v53 - v54;
    char v57 = v55;
    if (v55) {
      goto LABEL_132;
    }
    uint64_t v58 = &v32[2 * v34];
    uint64_t v60 = *v58;
    uint64_t v59 = v58[1];
    BOOL v45 = __OFSUB__(v59, v60);
    uint64_t v61 = v59 - v60;
    if (v45) {
      goto LABEL_134;
    }
    if (__OFADD__(v56, v61)) {
      goto LABEL_136;
    }
    if (v56 + v61 >= v37)
    {
      BOOL v62 = v37 < v61;
LABEL_79:
      if (v62) {
        unint64_t v34 = v46;
      }
      goto LABEL_81;
    }
LABEL_73:
    if (v57) {
      goto LABEL_133;
    }
    uint64_t v65 = &v32[2 * v34];
    uint64_t v67 = *v65;
    uint64_t v66 = v65[1];
    BOOL v45 = __OFSUB__(v66, v67);
    uint64_t v68 = v66 - v67;
    if (v45) {
      goto LABEL_135;
    }
    if (v68 < v56) {
      goto LABEL_90;
    }
LABEL_81:
    unint64_t v73 = v34 - 1;
    if (v34 - 1 >= v31)
    {
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
LABEL_132:
      __break(1u);
LABEL_133:
      __break(1u);
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (!v8) {
      goto LABEL_151;
    }
    unint64_t v74 = &v32[2 * v73];
    uint64_t v75 = *v74;
    uint64_t v76 = &v32[2 * v34];
    uint64_t v77 = v76[1];
    sub_22D6C994C((char *)(v8 + 16 * *v74), (char *)(v8 + 16 * *v76), v8 + 16 * v77, v101);
    if (v1) {
      break;
    }
    if (v77 < v75) {
      goto LABEL_124;
    }
    if (v34 > v102[2]) {
      goto LABEL_125;
    }
    *unint64_t v74 = v75;
    v32[2 * v73 + 1] = v77;
    unint64_t v78 = v102[2];
    if (v34 >= v78) {
      goto LABEL_126;
    }
    uint64_t v29 = v102;
    unint64_t v31 = v78 - 1;
    memmove(&v32[2 * v34], v76 + 2, 16 * (v78 - 1 - v34));
    v102[2] = v78 - 1;
    if (v78 <= 2) {
      goto LABEL_90;
    }
  }
LABEL_106:
  swift_bridgeObjectRelease();
  if (v100 < -1) {
    goto LABEL_145;
  }
  *(void *)(v99 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_22D6C9884(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
    while (2)
    {
      uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
      unint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = (uint64_t *)v8;
      do
      {
        if (result == *(v12 - 2) && v10 == *(v12 - 1)) {
          break;
        }
        unint64_t result = sub_22D6CD5A8();
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }
        unint64_t result = *v12;
        uint64_t v10 = v12[1];
        *(_OWORD *)uint64_t v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 16;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_22D6C994C(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 16;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    sub_22D663DAC(a2, (uint64_t)(a3 - (void)a2) / 16, a4);
    unint64_t v12 = (unint64_t)&v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_47;
    }
    uint64_t v18 = (char *)(a3 - 16);
    while (1)
    {
      int v19 = v18 + 16;
      uint64_t v20 = (char *)(v12 - 16);
      BOOL v21 = *(void *)(v12 - 16) == *((void *)v6 - 2) && *(void *)(v12 - 8) == *((void *)v6 - 1);
      if (v21 || (sub_22D6CD5A8() & 1) == 0)
      {
        BOOL v23 = v19 != (char *)v12 || (unint64_t)v18 >= v12;
        v12 -= 16;
        if (!v23) {
          goto LABEL_43;
        }
      }
      else
      {
        BOOL v22 = v19 != v6 || v18 >= v6;
        uint64_t v20 = v6 - 16;
        v6 -= 16;
        if (!v22) {
          goto LABEL_43;
        }
      }
      *(_OWORD *)uint64_t v18 = *(_OWORD *)v20;
LABEL_43:
      v18 -= 16;
      if (v6 <= v7 || v12 <= (unint64_t)v4) {
        goto LABEL_47;
      }
    }
  }
  sub_22D663DAC(a1, (a2 - a1) / 16, a4);
  unint64_t v12 = (unint64_t)&v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      BOOL v14 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (!v14 && (sub_22D6CD5A8() & 1) != 0) {
        break;
      }
      int v15 = v4;
      BOOL v14 = v7 == v4;
      v4 += 16;
      if (!v14) {
        goto LABEL_15;
      }
LABEL_16:
      v7 += 16;
      if ((unint64_t)v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_21;
      }
    }
    int v15 = v6;
    BOOL v14 = v7 == v6;
    v6 += 16;
    if (v14) {
      goto LABEL_16;
    }
LABEL_15:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v15;
    goto LABEL_16;
  }
LABEL_21:
  uint64_t v6 = v7;
LABEL_47:
  sub_22D663DAC(v4, (uint64_t)(v12 - (void)v4) / 16, v6);
  return 1;
}

ValueMetadata *_s10BackButtonVMa()
{
  return &_s10BackButtonVN;
}

uint64_t sub_22D6C9B18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D6C9B34()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26857ED00);
  sub_22D6C9E20();
  return sub_22D6CC078();
}

uint64_t sub_22D6C9BBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22D6CB358();
  sub_22D6C9C70((uint64_t)v14);
  uint64_t v3 = v15;
  char v4 = v16;
  uint64_t v5 = v17;
  long long v12 = v14[0];
  long long v13 = v14[1];
  char v6 = sub_22D6CB8E8();
  uint64_t result = sub_22D6CADB8();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0x4014000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 40) = v13;
  *(void *)(a1 + 56) = v3;
  *(unsigned char *)(a1 + 64) = v4;
  *(void *)(a1 + 72) = v5;
  *(unsigned char *)(a1 + 80) = v6;
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = v9;
  *(void *)(a1 + 104) = v10;
  *(void *)(a1 + 112) = v11;
  *(unsigned char *)(a1 + 120) = 0;
  return result;
}

uint64_t sub_22D6C9C70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22D6CBF98();
  uint64_t v3 = sub_22D6CBA18();
  uint64_t KeyPath = swift_getKeyPath();
  sub_22D6CB3D8();
  if (qword_26857AD80 != -1) {
    swift_once();
  }
  id v5 = (id)qword_268585148;
  uint64_t v6 = sub_22D6CBAD8();
  uint64_t v8 = v7;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = KeyPath;
  char v10 = v9 & 1;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v9 & 1;
  *(void *)(a1 + 48) = v11;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_22D604860(v6, v8, v10);
  swift_bridgeObjectRetain();
  sub_22D604A88(v6, v8, v10);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D6C9E18()
{
  return sub_22D6C9B34();
}

unint64_t sub_22D6C9E20()
{
  unint64_t result = qword_26857ED08;
  if (!qword_26857ED08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26857ED00);
    sub_22D5DCE80(&qword_26857ED10, &qword_26857ED18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26857ED08);
  }
  return result;
}

uint64_t sub_22D6C9EC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22D6CB2A8();
  *a1 = result;
  return result;
}

uint64_t sub_22D6C9EEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22D6CB2A8();
  *a1 = result;
  return result;
}

uint64_t sub_22D6C9F18()
{
  return sub_22D6CB2B8();
}

uint64_t sub_22D6C9F48()
{
  return sub_22D5DCE80(&qword_26857ED20, &qword_26857ED28);
}

uint64_t sub_22D6C9F84()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_22D6C9FB8()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_22D6C9FC8()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_22D6C9FD8()
{
  return MEMORY[0x270EEDD10]();
}

uint64_t sub_22D6C9FE8()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_22D6C9FF8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_22D6CA008()
{
  return MEMORY[0x270EFEAE8]();
}

uint64_t sub_22D6CA018()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_22D6CA028()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_22D6CA038()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_22D6CA048()
{
  return MEMORY[0x270EEEE18]();
}

uint64_t sub_22D6CA058()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_22D6CA068()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_22D6CA078()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_22D6CA088()
{
  return MEMORY[0x270EEF180]();
}

uint64_t sub_22D6CA098()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_22D6CA0A8()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_22D6CA0B8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22D6CA0C8()
{
  return MEMORY[0x270EEF930]();
}

uint64_t sub_22D6CA0D8()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_22D6CA0E8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22D6CA0F8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22D6CA108()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22D6CA118()
{
  return MEMORY[0x270EF02E8]();
}

uint64_t sub_22D6CA128()
{
  return MEMORY[0x270EF0320]();
}

uint64_t sub_22D6CA138()
{
  return MEMORY[0x270EF0330]();
}

uint64_t sub_22D6CA158()
{
  return MEMORY[0x270EF0440]();
}

uint64_t sub_22D6CA168()
{
  return MEMORY[0x270EF0548]();
}

uint64_t sub_22D6CA188()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_22D6CA198()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_22D6CA1A8()
{
  return MEMORY[0x270EF0C00]();
}

uint64_t sub_22D6CA1B8()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_22D6CA1C8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22D6CA1D8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_22D6CA1E8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_22D6CA1F8()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_22D6CA208()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_22D6CA218()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_22D6CA228()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_22D6CA238()
{
  return MEMORY[0x270EF1658]();
}

uint64_t sub_22D6CA248()
{
  return MEMORY[0x270EF1678]();
}

uint64_t sub_22D6CA258()
{
  return MEMORY[0x270EF16A8]();
}

uint64_t sub_22D6CA268()
{
  return MEMORY[0x270EF16B0]();
}

uint64_t sub_22D6CA278()
{
  return MEMORY[0x270EF16C8]();
}

uint64_t sub_22D6CA288()
{
  return MEMORY[0x270F49858]();
}

uint64_t sub_22D6CA298()
{
  return MEMORY[0x270F499D8]();
}

uint64_t sub_22D6CA2A8()
{
  return MEMORY[0x270F499E0]();
}

uint64_t sub_22D6CA2B8()
{
  return MEMORY[0x270F499E8]();
}

uint64_t sub_22D6CA2C8()
{
  return MEMORY[0x270F9C890]();
}

uint64_t sub_22D6CA2D8()
{
  return MEMORY[0x270F4C888]();
}

uint64_t sub_22D6CA2E8()
{
  return MEMORY[0x270F4C890]();
}

uint64_t sub_22D6CA2F8()
{
  return MEMORY[0x270F4C8A0]();
}

uint64_t sub_22D6CA308()
{
  return MEMORY[0x270F4C8B8]();
}

uint64_t sub_22D6CA318()
{
  return MEMORY[0x270F4C8C0]();
}

uint64_t sub_22D6CA328()
{
  return MEMORY[0x270F4C8C8]();
}

uint64_t sub_22D6CA338()
{
  return MEMORY[0x270F4C8D0]();
}

uint64_t sub_22D6CA348()
{
  return MEMORY[0x270F4C8D8]();
}

uint64_t sub_22D6CA358()
{
  return MEMORY[0x270F4C8E0]();
}

uint64_t sub_22D6CA368()
{
  return MEMORY[0x270F4C8E8]();
}

uint64_t sub_22D6CA378()
{
  return MEMORY[0x270F4C948]();
}

uint64_t sub_22D6CA388()
{
  return MEMORY[0x270F4C950]();
}

uint64_t sub_22D6CA3A8()
{
  return MEMORY[0x270F4C9A8]();
}

uint64_t sub_22D6CA3B8()
{
  return MEMORY[0x270F4C9B0]();
}

uint64_t sub_22D6CA3C8()
{
  return MEMORY[0x270F4C9C0]();
}

uint64_t sub_22D6CA3D8()
{
  return MEMORY[0x270F4C9C8]();
}

uint64_t sub_22D6CA3E8()
{
  return MEMORY[0x270F4C9D0]();
}

uint64_t sub_22D6CA3F8()
{
  return MEMORY[0x270F4C9D8]();
}

uint64_t sub_22D6CA408()
{
  return MEMORY[0x270F4C9E0]();
}

uint64_t sub_22D6CA418()
{
  return MEMORY[0x270F4C9E8]();
}

uint64_t sub_22D6CA428()
{
  return MEMORY[0x270F4C9F0]();
}

uint64_t sub_22D6CA438()
{
  return MEMORY[0x270F4CA68]();
}

uint64_t sub_22D6CA448()
{
  return MEMORY[0x270F4CA70]();
}

uint64_t sub_22D6CA458()
{
  return MEMORY[0x270F4CA78]();
}

uint64_t sub_22D6CA468()
{
  return MEMORY[0x270F4CA90]();
}

uint64_t sub_22D6CA478()
{
  return MEMORY[0x270F4CA98]();
}

uint64_t sub_22D6CA488()
{
  return MEMORY[0x270F4CAA0]();
}

uint64_t sub_22D6CA498()
{
  return MEMORY[0x270F4CAA8]();
}

uint64_t sub_22D6CA4A8()
{
  return MEMORY[0x270F4CAB0]();
}

uint64_t sub_22D6CA4B8()
{
  return MEMORY[0x270F4CB58]();
}

uint64_t sub_22D6CA4C8()
{
  return MEMORY[0x270F4CB60]();
}

uint64_t sub_22D6CA4D8()
{
  return MEMORY[0x270F4CB68]();
}

uint64_t sub_22D6CA4E8()
{
  return MEMORY[0x270F4CB70]();
}

uint64_t sub_22D6CA508()
{
  return MEMORY[0x270F4CB80]();
}

uint64_t sub_22D6CA518()
{
  return MEMORY[0x270F4CBC0]();
}

uint64_t sub_22D6CA528()
{
  return MEMORY[0x270F4CBC8]();
}

uint64_t sub_22D6CA538()
{
  return MEMORY[0x270F4CBD0]();
}

uint64_t sub_22D6CA548()
{
  return MEMORY[0x270F4CBD8]();
}

uint64_t sub_22D6CA558()
{
  return MEMORY[0x270F4CBE0]();
}

uint64_t sub_22D6CA568()
{
  return MEMORY[0x270F4CBE8]();
}

uint64_t sub_22D6CA578()
{
  return MEMORY[0x270F4CBF0]();
}

uint64_t sub_22D6CA588()
{
  return MEMORY[0x270F4CBF8]();
}

uint64_t sub_22D6CA598()
{
  return MEMORY[0x270F4CC00]();
}

uint64_t sub_22D6CA5A8()
{
  return MEMORY[0x270F4CC08]();
}

uint64_t sub_22D6CA5B8()
{
  return MEMORY[0x270F4CC10]();
}

uint64_t sub_22D6CA5C8()
{
  return MEMORY[0x270F4CC18]();
}

uint64_t sub_22D6CA5D8()
{
  return MEMORY[0x270F4CC20]();
}

uint64_t sub_22D6CA5E8()
{
  return MEMORY[0x270F4CC28]();
}

uint64_t sub_22D6CA5F8()
{
  return MEMORY[0x270F4CC30]();
}

uint64_t sub_22D6CA608()
{
  return MEMORY[0x270F4CC38]();
}

uint64_t sub_22D6CA618()
{
  return MEMORY[0x270F4CC40]();
}

uint64_t sub_22D6CA628()
{
  return MEMORY[0x270F4CC48]();
}

uint64_t sub_22D6CA638()
{
  return MEMORY[0x270F4CC50]();
}

uint64_t sub_22D6CA648()
{
  return MEMORY[0x270F4CC58]();
}

uint64_t sub_22D6CA658()
{
  return MEMORY[0x270F4CC60]();
}

uint64_t sub_22D6CA668()
{
  return MEMORY[0x270F4CC68]();
}

uint64_t sub_22D6CA678()
{
  return MEMORY[0x270F4CC70]();
}

uint64_t sub_22D6CA688()
{
  return MEMORY[0x270F4CC78]();
}

uint64_t sub_22D6CA698()
{
  return MEMORY[0x270F4CC80]();
}

uint64_t sub_22D6CA6A8()
{
  return MEMORY[0x270F4CC88]();
}

uint64_t sub_22D6CA6B8()
{
  return MEMORY[0x270F4CC90]();
}

uint64_t sub_22D6CA6C8()
{
  return MEMORY[0x270F4CC98]();
}

uint64_t sub_22D6CA6D8()
{
  return MEMORY[0x270F4CCA8]();
}

uint64_t sub_22D6CA6E8()
{
  return MEMORY[0x270F4CCB8]();
}

uint64_t sub_22D6CA6F8()
{
  return MEMORY[0x270F4CCC0]();
}

uint64_t sub_22D6CA708()
{
  return MEMORY[0x270F4CCC8]();
}

uint64_t sub_22D6CA718()
{
  return MEMORY[0x270F4CCD0]();
}

uint64_t sub_22D6CA728()
{
  return MEMORY[0x270F4CCD8]();
}

uint64_t sub_22D6CA738()
{
  return MEMORY[0x270F4CCE0]();
}

uint64_t sub_22D6CA748()
{
  return MEMORY[0x270F4CCE8]();
}

uint64_t sub_22D6CA758()
{
  return MEMORY[0x270F4CD00]();
}

uint64_t sub_22D6CA768()
{
  return MEMORY[0x270F4CD10]();
}

uint64_t sub_22D6CA778()
{
  return MEMORY[0x270F4CD18]();
}

uint64_t sub_22D6CA788()
{
  return MEMORY[0x270F4CD28]();
}

uint64_t sub_22D6CA798()
{
  return MEMORY[0x270F4CD38]();
}

uint64_t sub_22D6CA7A8()
{
  return MEMORY[0x270F4CD40]();
}

uint64_t sub_22D6CA7B8()
{
  return MEMORY[0x270F4CDE0]();
}

uint64_t sub_22D6CA7C8()
{
  return MEMORY[0x270F4CDF8]();
}

uint64_t sub_22D6CA7D8()
{
  return MEMORY[0x270F4CE00]();
}

uint64_t sub_22D6CA7E8()
{
  return MEMORY[0x270F4CE08]();
}

uint64_t sub_22D6CA7F8()
{
  return MEMORY[0x270F4CE10]();
}

uint64_t sub_22D6CA808()
{
  return MEMORY[0x270F4CE18]();
}

uint64_t sub_22D6CA818()
{
  return MEMORY[0x270F4CE20]();
}

uint64_t sub_22D6CA828()
{
  return MEMORY[0x270F4CE28]();
}

uint64_t sub_22D6CA838()
{
  return MEMORY[0x270F4CE30]();
}

uint64_t sub_22D6CA848()
{
  return MEMORY[0x270F4CE40]();
}

uint64_t sub_22D6CA858()
{
  return MEMORY[0x270F4CE48]();
}

uint64_t sub_22D6CA868()
{
  return MEMORY[0x270F4CE58]();
}

uint64_t sub_22D6CA878()
{
  return MEMORY[0x270F4CE60]();
}

uint64_t sub_22D6CA888()
{
  return MEMORY[0x270F4CE68]();
}

uint64_t sub_22D6CA898()
{
  return MEMORY[0x270F4CE70]();
}

uint64_t sub_22D6CA8A8()
{
  return MEMORY[0x270F4CE78]();
}

uint64_t sub_22D6CA8B8()
{
  return MEMORY[0x270F4CE80]();
}

uint64_t sub_22D6CA8C8()
{
  return MEMORY[0x270F4CE88]();
}

uint64_t sub_22D6CA8D8()
{
  return MEMORY[0x270F4CE90]();
}

uint64_t sub_22D6CA8E8()
{
  return MEMORY[0x270F4CE98]();
}

uint64_t sub_22D6CA8F8()
{
  return MEMORY[0x270F4CEA0]();
}

uint64_t sub_22D6CA908()
{
  return MEMORY[0x270F4CEA8]();
}

uint64_t sub_22D6CA918()
{
  return MEMORY[0x270F4CEB0]();
}

uint64_t sub_22D6CA928()
{
  return MEMORY[0x270F4CEB8]();
}

uint64_t sub_22D6CA938()
{
  return MEMORY[0x270F4CEC0]();
}

uint64_t sub_22D6CA948()
{
  return MEMORY[0x270F4CEC8]();
}

uint64_t sub_22D6CA958()
{
  return MEMORY[0x270F4D190]();
}

uint64_t sub_22D6CA968()
{
  return MEMORY[0x270F4D198]();
}

uint64_t sub_22D6CA978()
{
  return MEMORY[0x270F4D1A0]();
}

uint64_t sub_22D6CA988()
{
  return MEMORY[0x270F4D1A8]();
}

uint64_t sub_22D6CA998()
{
  return MEMORY[0x270F4D1B0]();
}

uint64_t sub_22D6CA9A8()
{
  return MEMORY[0x270F4D1B8]();
}

uint64_t sub_22D6CA9B8()
{
  return MEMORY[0x270F4D1C0]();
}

uint64_t sub_22D6CA9C8()
{
  return MEMORY[0x270F4D1C8]();
}

uint64_t sub_22D6CA9D8()
{
  return MEMORY[0x270F4D1D0]();
}

uint64_t sub_22D6CA9E8()
{
  return MEMORY[0x270F4D1D8]();
}

uint64_t sub_22D6CA9F8()
{
  return MEMORY[0x270F4D1E0]();
}

uint64_t sub_22D6CAA08()
{
  return MEMORY[0x270F4D1E8]();
}

uint64_t sub_22D6CAA18()
{
  return MEMORY[0x270F4D1F0]();
}

uint64_t sub_22D6CAA28()
{
  return MEMORY[0x270F4D1F8]();
}

uint64_t sub_22D6CAA38()
{
  return MEMORY[0x270F4D200]();
}

uint64_t sub_22D6CAA48()
{
  return MEMORY[0x270F4D208]();
}

uint64_t sub_22D6CAA58()
{
  return MEMORY[0x270F4D270]();
}

uint64_t sub_22D6CAA68()
{
  return MEMORY[0x270F4D278]();
}

uint64_t sub_22D6CAA78()
{
  return MEMORY[0x270F4D2E0]();
}

uint64_t sub_22D6CAA88()
{
  return MEMORY[0x270F4D378]();
}

uint64_t _s17_MusicKit_SwiftUI0A17SubscriptionOfferV7OptionsV01_ab9Internal_cD0E19figaroCampaignGroupSSSgvg_0()
{
  return MEMORY[0x270F081E0]();
}

uint64_t _s17_MusicKit_SwiftUI0A17SubscriptionOfferV7OptionsV01_ab9Internal_cD0E19figaroCampaignGroupSSSgvs_0()
{
  return MEMORY[0x270F081E8]();
}

uint64_t _s17_MusicKit_SwiftUI0A17SubscriptionOfferV7OptionsV01_ab9Internal_cD0E19figaroCampaignTokenSSSgvg_0()
{
  return MEMORY[0x270F081F0]();
}

uint64_t _s17_MusicKit_SwiftUI0A17SubscriptionOfferV7OptionsV01_ab9Internal_cD0E19figaroCampaignTokenSSSgvs_0()
{
  return MEMORY[0x270F081F8]();
}

uint64_t sub_22D6CAAD8()
{
  return MEMORY[0x270F08200]();
}

uint64_t sub_22D6CAAE8()
{
  return MEMORY[0x270F08208]();
}

uint64_t sub_22D6CAAF8()
{
  return MEMORY[0x270F08210]();
}

uint64_t sub_22D6CAB08()
{
  return MEMORY[0x270F08218]();
}

uint64_t sub_22D6CAB18()
{
  return MEMORY[0x270F08220]();
}

uint64_t sub_22D6CAB28()
{
  return MEMORY[0x270F08228]();
}

uint64_t sub_22D6CAB38()
{
  return MEMORY[0x270F08230]();
}

uint64_t sub_22D6CAB48()
{
  return MEMORY[0x270F08238]();
}

uint64_t sub_22D6CAB58()
{
  return MEMORY[0x270F08240]();
}

uint64_t sub_22D6CAB68()
{
  return MEMORY[0x270F08248]();
}

uint64_t sub_22D6CAB78()
{
  return MEMORY[0x270F08250]();
}

uint64_t sub_22D6CAB88()
{
  return MEMORY[0x270F08258]();
}

uint64_t sub_22D6CAB98()
{
  return MEMORY[0x270F08260]();
}

uint64_t sub_22D6CABA8()
{
  return MEMORY[0x270F08268]();
}

uint64_t sub_22D6CABB8()
{
  return MEMORY[0x270F08270]();
}

uint64_t sub_22D6CABC8()
{
  return MEMORY[0x270F08278]();
}

uint64_t sub_22D6CABD8()
{
  return MEMORY[0x270F08280]();
}

uint64_t sub_22D6CABE8()
{
  return MEMORY[0x270F08288]();
}

uint64_t sub_22D6CABF8()
{
  return MEMORY[0x270F08290]();
}

uint64_t sub_22D6CAC08()
{
  return MEMORY[0x270F08298]();
}

uint64_t sub_22D6CAC18()
{
  return MEMORY[0x270F082B0]();
}

uint64_t sub_22D6CAC28()
{
  return MEMORY[0x270F082B8]();
}

uint64_t sub_22D6CAC38()
{
  return MEMORY[0x270F082C0]();
}

uint64_t sub_22D6CAC48()
{
  return MEMORY[0x270F082C8]();
}

uint64_t sub_22D6CAC58()
{
  return MEMORY[0x270F082D0]();
}

uint64_t sub_22D6CAC68()
{
  return MEMORY[0x270F082D8]();
}

uint64_t sub_22D6CAC78()
{
  return MEMORY[0x270F082E0]();
}

uint64_t sub_22D6CAC88()
{
  return MEMORY[0x270F082E8]();
}

uint64_t sub_22D6CAC98()
{
  return MEMORY[0x270F082F0]();
}

uint64_t sub_22D6CACA8()
{
  return MEMORY[0x270F082F8]();
}

uint64_t sub_22D6CACB8()
{
  return MEMORY[0x270F08300]();
}

uint64_t sub_22D6CACC8()
{
  return MEMORY[0x270F08308]();
}

uint64_t sub_22D6CACD8()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_22D6CACE8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22D6CACF8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22D6CAD08()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22D6CAD18()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_22D6CAD28()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_22D6CAD38()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_22D6CAD48()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_22D6CAD58()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_22D6CAD68()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_22D6CAD78()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_22D6CAD88()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_22D6CAD98()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_22D6CADA8()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_22D6CADB8()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_22D6CADC8()
{
  return MEMORY[0x270EFEDA0]();
}

uint64_t sub_22D6CADD8()
{
  return MEMORY[0x270EFEDA8]();
}

uint64_t sub_22D6CADE8()
{
  return MEMORY[0x270EFEDF0]();
}

uint64_t sub_22D6CADF8()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_22D6CAE08()
{
  return MEMORY[0x270EFEE70]();
}

uint64_t sub_22D6CAE18()
{
  return MEMORY[0x270EFEE78]();
}

uint64_t sub_22D6CAE28()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_22D6CAE38()
{
  return MEMORY[0x270EFF008]();
}

uint64_t sub_22D6CAE48()
{
  return MEMORY[0x270EFF100]();
}

uint64_t sub_22D6CAE58()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_22D6CAE68()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_22D6CAE78()
{
  return MEMORY[0x270EFF150]();
}

uint64_t sub_22D6CAE88()
{
  return MEMORY[0x270EFF158]();
}

uint64_t sub_22D6CAE98()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_22D6CAEA8()
{
  return MEMORY[0x270EFF180]();
}

uint64_t sub_22D6CAEB8()
{
  return MEMORY[0x270EFF188]();
}

uint64_t sub_22D6CAEC8()
{
  return MEMORY[0x270EFF198]();
}

uint64_t sub_22D6CAED8()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_22D6CAEE8()
{
  return MEMORY[0x270EFF3E0]();
}

uint64_t sub_22D6CAEF8()
{
  return MEMORY[0x270EFF3F8]();
}

uint64_t sub_22D6CAF08()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_22D6CAF18()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_22D6CAF28()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_22D6CAF38()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_22D6CAF48()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_22D6CAF58()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_22D6CAF68()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_22D6CAF78()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_22D6CAF88()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_22D6CAF98()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_22D6CAFA8()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_22D6CAFC8()
{
  return MEMORY[0x270EFFA08]();
}

uint64_t sub_22D6CAFD8()
{
  return MEMORY[0x270EFFA10]();
}

uint64_t sub_22D6CAFE8()
{
  return MEMORY[0x270EFFAC0]();
}

uint64_t sub_22D6CAFF8()
{
  return MEMORY[0x270EFFB00]();
}

uint64_t sub_22D6CB008()
{
  return MEMORY[0x270EFFB58]();
}

uint64_t sub_22D6CB018()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_22D6CB028()
{
  return MEMORY[0x270EFFC98]();
}

uint64_t sub_22D6CB038()
{
  return MEMORY[0x270EFFCA0]();
}

uint64_t sub_22D6CB048()
{
  return MEMORY[0x270EFFEB0]();
}

uint64_t sub_22D6CB058()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_22D6CB068()
{
  return MEMORY[0x270F00050]();
}

uint64_t sub_22D6CB078()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_22D6CB088()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_22D6CB098()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_22D6CB0A8()
{
  return MEMORY[0x270F001D8]();
}

uint64_t sub_22D6CB0B8()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_22D6CB0C8()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_22D6CB0D8()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_22D6CB0E8()
{
  return MEMORY[0x270F00530]();
}

uint64_t sub_22D6CB0F8()
{
  return MEMORY[0x270F00590]();
}

uint64_t sub_22D6CB108()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_22D6CB118()
{
  return MEMORY[0x270F00630]();
}

uint64_t sub_22D6CB128()
{
  return MEMORY[0x270F00650]();
}

uint64_t sub_22D6CB138()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_22D6CB148()
{
  return MEMORY[0x270F00698]();
}

uint64_t sub_22D6CB158()
{
  return MEMORY[0x270F007F0]();
}

uint64_t sub_22D6CB168()
{
  return MEMORY[0x270F00818]();
}

uint64_t sub_22D6CB178()
{
  return MEMORY[0x270F00820]();
}

uint64_t sub_22D6CB188()
{
  return MEMORY[0x270F00838]();
}

uint64_t sub_22D6CB198()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_22D6CB1B8()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_22D6CB1C8()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_22D6CB1D8()
{
  return MEMORY[0x270F00900]();
}

uint64_t sub_22D6CB1E8()
{
  return MEMORY[0x270F00978]();
}

uint64_t sub_22D6CB1F8()
{
  return MEMORY[0x270F00980]();
}

uint64_t sub_22D6CB208()
{
  return MEMORY[0x270F00998]();
}

uint64_t sub_22D6CB218()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_22D6CB228()
{
  return MEMORY[0x270F00A18]();
}

uint64_t sub_22D6CB238()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_22D6CB248()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_22D6CB258()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_22D6CB268()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_22D6CB278()
{
  return MEMORY[0x270F00AC0]();
}

uint64_t sub_22D6CB288()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_22D6CB298()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_22D6CB2A8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_22D6CB2B8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_22D6CB2C8()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_22D6CB2D8()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_22D6CB2E8()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_22D6CB2F8()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_22D6CB308()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_22D6CB318()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_22D6CB328()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_22D6CB338()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_22D6CB348()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_22D6CB358()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_22D6CB368()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_22D6CB378()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_22D6CB388()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_22D6CB398()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_22D6CB3A8()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_22D6CB3B8()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_22D6CB3C8()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_22D6CB3D8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_22D6CB3E8()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_22D6CB3F8()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_22D6CB408()
{
  return MEMORY[0x270F01378]();
}

uint64_t sub_22D6CB418()
{
  return MEMORY[0x270F014A8]();
}

uint64_t sub_22D6CB428()
{
  return MEMORY[0x270F014B0]();
}

uint64_t sub_22D6CB438()
{
  return MEMORY[0x270F014B8]();
}

uint64_t sub_22D6CB448()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_22D6CB458()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_22D6CB468()
{
  return MEMORY[0x270F01528]();
}

uint64_t sub_22D6CB478()
{
  return MEMORY[0x270F01640]();
}

uint64_t sub_22D6CB488()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_22D6CB498()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_22D6CB4A8()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_22D6CB4C8()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_22D6CB4D8()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_22D6CB4E8()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_22D6CB4F8()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_22D6CB508()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_22D6CB518()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_22D6CB538()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_22D6CB558()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_22D6CB568()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_22D6CB578()
{
  return MEMORY[0x270F01838]();
}

uint64_t sub_22D6CB588()
{
  return MEMORY[0x270F01980]();
}

uint64_t sub_22D6CB598()
{
  return MEMORY[0x270F01988]();
}

uint64_t sub_22D6CB5A8()
{
  return MEMORY[0x270F01990]();
}

uint64_t sub_22D6CB5B8()
{
  return MEMORY[0x270F01998]();
}

uint64_t sub_22D6CB5C8()
{
  return MEMORY[0x270F019B0]();
}

uint64_t sub_22D6CB5D8()
{
  return MEMORY[0x270F019E8]();
}

uint64_t sub_22D6CB5E8()
{
  return MEMORY[0x270F019F0]();
}

uint64_t sub_22D6CB5F8()
{
  return MEMORY[0x270F01A48]();
}

uint64_t sub_22D6CB608()
{
  return MEMORY[0x270F01A50]();
}

uint64_t sub_22D6CB618()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_22D6CB628()
{
  return MEMORY[0x270F01B20]();
}

uint64_t sub_22D6CB638()
{
  return MEMORY[0x270F01B30]();
}

uint64_t sub_22D6CB648()
{
  return MEMORY[0x270F01B78]();
}

uint64_t sub_22D6CB658()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_22D6CB668()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_22D6CB678()
{
  return MEMORY[0x270F01CB0]();
}

uint64_t sub_22D6CB688()
{
  return MEMORY[0x270F01CC0]();
}

uint64_t sub_22D6CB698()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_22D6CB6A8()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_22D6CB6B8()
{
  return MEMORY[0x270F01F98]();
}

uint64_t sub_22D6CB6C8()
{
  return MEMORY[0x270F01FF8]();
}

uint64_t sub_22D6CB6D8()
{
  return MEMORY[0x270F02000]();
}

uint64_t sub_22D6CB6E8()
{
  return MEMORY[0x270F02008]();
}

uint64_t sub_22D6CB6F8()
{
  return MEMORY[0x270F02010]();
}

uint64_t sub_22D6CB708()
{
  return MEMORY[0x270F02018]();
}

uint64_t sub_22D6CB718()
{
  return MEMORY[0x270F02080]();
}

uint64_t sub_22D6CB728()
{
  return MEMORY[0x270F02088]();
}

uint64_t sub_22D6CB738()
{
  return MEMORY[0x270F020A8]();
}

uint64_t sub_22D6CB748()
{
  return MEMORY[0x270F020B0]();
}

uint64_t sub_22D6CB758()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_22D6CB768()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_22D6CB778()
{
  return MEMORY[0x270F02290]();
}

uint64_t sub_22D6CB788()
{
  return MEMORY[0x270F022A0]();
}

uint64_t sub_22D6CB798()
{
  return MEMORY[0x270F02510]();
}

uint64_t sub_22D6CB7A8()
{
  return MEMORY[0x270F02528]();
}

uint64_t sub_22D6CB7B8()
{
  return MEMORY[0x270F02570]();
}

uint64_t sub_22D6CB7C8()
{
  return MEMORY[0x270F02580]();
}

uint64_t sub_22D6CB7D8()
{
  return MEMORY[0x270F02588]();
}

uint64_t sub_22D6CB7E8()
{
  return MEMORY[0x270F02780]();
}

uint64_t sub_22D6CB7F8()
{
  return MEMORY[0x270F02798]();
}

uint64_t sub_22D6CB808()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_22D6CB818()
{
  return MEMORY[0x270F027D8]();
}

uint64_t sub_22D6CB828()
{
  return MEMORY[0x270F027E0]();
}

uint64_t sub_22D6CB838()
{
  return MEMORY[0x270F027E8]();
}

uint64_t sub_22D6CB848()
{
  return MEMORY[0x270F027F0]();
}

uint64_t sub_22D6CB858()
{
  return MEMORY[0x270F02928]();
}

uint64_t sub_22D6CB868()
{
  return MEMORY[0x270F02930]();
}

uint64_t sub_22D6CB878()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_22D6CB888()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_22D6CB898()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_22D6CB8A8()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_22D6CB8B8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_22D6CB8C8()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_22D6CB8D8()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_22D6CB8E8()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_22D6CB8F8()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_22D6CB908()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_22D6CB918()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_22D6CB928()
{
  return MEMORY[0x270F02B38]();
}

uint64_t sub_22D6CB938()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_22D6CB948()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_22D6CB958()
{
  return MEMORY[0x270F02B60]();
}

uint64_t sub_22D6CB968()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_22D6CB978()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_22D6CB988()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_22D6CB998()
{
  return MEMORY[0x270F02BE8]();
}

uint64_t sub_22D6CB9A8()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_22D6CB9B8()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_22D6CB9C8()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_22D6CB9D8()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_22D6CB9E8()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_22D6CB9F8()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_22D6CBA08()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_22D6CBA18()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_22D6CBA28()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_22D6CBA38()
{
  return MEMORY[0x270F02E10]();
}

uint64_t sub_22D6CBA48()
{
  return MEMORY[0x270F02FF0]();
}

uint64_t sub_22D6CBA58()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_22D6CBA68()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_22D6CBA78()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_22D6CBA88()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_22D6CBA98()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_22D6CBAA8()
{
  return MEMORY[0x270F03118]();
}

uint64_t sub_22D6CBAB8()
{
  return MEMORY[0x270F03120]();
}

uint64_t sub_22D6CBAC8()
{
  return MEMORY[0x270F03130]();
}

uint64_t sub_22D6CBAD8()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_22D6CBAE8()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_22D6CBAF8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_22D6CBB08()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_22D6CBB18()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_22D6CBB28()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_22D6CBB38()
{
  return MEMORY[0x270F03318]();
}

uint64_t sub_22D6CBB48()
{
  return MEMORY[0x270F03330]();
}

uint64_t sub_22D6CBB58()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_22D6CBB68()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_22D6CBB78()
{
  return MEMORY[0x270F033E0]();
}

uint64_t sub_22D6CBB88()
{
  return MEMORY[0x270F033F8]();
}

uint64_t sub_22D6CBB98()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_22D6CBBA8()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_22D6CBBB8()
{
  return MEMORY[0x270F03498]();
}

uint64_t sub_22D6CBBC8()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_22D6CBBD8()
{
  return MEMORY[0x270F034B0]();
}

uint64_t sub_22D6CBBE8()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_22D6CBBF8()
{
  return MEMORY[0x270F03518]();
}

uint64_t sub_22D6CBC08()
{
  return MEMORY[0x270F03540]();
}

uint64_t sub_22D6CBC18()
{
  return MEMORY[0x270F03558]();
}

uint64_t sub_22D6CBC28()
{
  return MEMORY[0x270F03580]();
}

uint64_t sub_22D6CBC38()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_22D6CBC48()
{
  return MEMORY[0x270F03768]();
}

uint64_t sub_22D6CBC58()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_22D6CBC68()
{
  return MEMORY[0x270F037D8]();
}

uint64_t sub_22D6CBC78()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_22D6CBC88()
{
  return MEMORY[0x270F03920]();
}

uint64_t sub_22D6CBC98()
{
  return MEMORY[0x270F03968]();
}

uint64_t sub_22D6CBCA8()
{
  return MEMORY[0x270F03970]();
}

uint64_t sub_22D6CBCB8()
{
  return MEMORY[0x270F03A40]();
}

uint64_t sub_22D6CBCC8()
{
  return MEMORY[0x270F03A48]();
}

uint64_t sub_22D6CBCD8()
{
  return MEMORY[0x270F03AC0]();
}

uint64_t sub_22D6CBCE8()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_22D6CBCF8()
{
  return MEMORY[0x270F03C40]();
}

uint64_t sub_22D6CBD08()
{
  return MEMORY[0x270F03C58]();
}

uint64_t sub_22D6CBD18()
{
  return MEMORY[0x270F03C90]();
}

uint64_t sub_22D6CBD28()
{
  return MEMORY[0x270F03D58]();
}

uint64_t sub_22D6CBD38()
{
  return MEMORY[0x270F03E00]();
}

uint64_t sub_22D6CBD48()
{
  return MEMORY[0x270F03E20]();
}

uint64_t sub_22D6CBD58()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_22D6CBD68()
{
  return MEMORY[0x270F03EA8]();
}

uint64_t sub_22D6CBD78()
{
  return MEMORY[0x270F03EB0]();
}

uint64_t sub_22D6CBD88()
{
  return MEMORY[0x270F03F30]();
}

uint64_t sub_22D6CBD98()
{
  return MEMORY[0x270F03FB0]();
}

uint64_t sub_22D6CBDA8()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_22D6CBDB8()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_22D6CBDC8()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_22D6CBDD8()
{
  return MEMORY[0x270F040B0]();
}

uint64_t sub_22D6CBDE8()
{
  return MEMORY[0x270F040D0]();
}

uint64_t sub_22D6CBDF8()
{
  return MEMORY[0x270F040E0]();
}

uint64_t sub_22D6CBE08()
{
  return MEMORY[0x270F040F8]();
}

uint64_t sub_22D6CBE18()
{
  return MEMORY[0x270F04100]();
}

uint64_t sub_22D6CBE28()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_22D6CBE38()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_22D6CBE48()
{
  return MEMORY[0x270F04150]();
}

uint64_t sub_22D6CBE58()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_22D6CBE68()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_22D6CBE78()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_22D6CBE88()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_22D6CBE98()
{
  return MEMORY[0x270F041B0]();
}

uint64_t sub_22D6CBEA8()
{
  return MEMORY[0x270F041E8]();
}

uint64_t sub_22D6CBEB8()
{
  return MEMORY[0x270F04260]();
}

uint64_t sub_22D6CBEC8()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_22D6CBED8()
{
  return MEMORY[0x270F043C0]();
}

uint64_t sub_22D6CBEE8()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_22D6CBEF8()
{
  return MEMORY[0x270F04428]();
}

uint64_t sub_22D6CBF08()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_22D6CBF18()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_22D6CBF28()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_22D6CBF38()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_22D6CBF48()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_22D6CBF58()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_22D6CBF68()
{
  return MEMORY[0x270F04588]();
}

uint64_t sub_22D6CBF78()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_22D6CBF88()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_22D6CBF98()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_22D6CBFA8()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_22D6CBFB8()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_22D6CBFC8()
{
  return MEMORY[0x270F04700]();
}

uint64_t sub_22D6CBFD8()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_22D6CBFE8()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_22D6CBFF8()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_22D6CC008()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_22D6CC018()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_22D6CC028()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_22D6CC038()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_22D6CC048()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_22D6CC058()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_22D6CC068()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_22D6CC078()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_22D6CC088()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_22D6CC098()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_22D6CC0A8()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_22D6CC0B8()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_22D6CC0C8()
{
  return MEMORY[0x270F049E0]();
}

uint64_t sub_22D6CC0D8()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_22D6CC0E8()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_22D6CC0F8()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_22D6CC108()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_22D6CC118()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_22D6CC128()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_22D6CC138()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_22D6CC148()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_22D6CC158()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_22D6CC168()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_22D6CC178()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_22D6CC188()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_22D6CC198()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_22D6CC1A8()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_22D6CC1B8()
{
  return MEMORY[0x270F04CE8]();
}

uint64_t sub_22D6CC1C8()
{
  return MEMORY[0x270F04EF0]();
}

uint64_t sub_22D6CC1D8()
{
  return MEMORY[0x270F04F00]();
}

uint64_t sub_22D6CC1E8()
{
  return MEMORY[0x270F04F10]();
}

uint64_t sub_22D6CC1F8()
{
  return MEMORY[0x270F04F68]();
}

uint64_t sub_22D6CC208()
{
  return MEMORY[0x270F04FA0]();
}

uint64_t sub_22D6CC218()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_22D6CC228()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_22D6CC238()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_22D6CC248()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_22D6CC258()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_22D6CC268()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_22D6CC278()
{
  return MEMORY[0x270F051C8]();
}

uint64_t sub_22D6CC288()
{
  return MEMORY[0x270F051D0]();
}

uint64_t sub_22D6CC298()
{
  return MEMORY[0x270F051E0]();
}

uint64_t sub_22D6CC2A8()
{
  return MEMORY[0x270F05200]();
}

uint64_t sub_22D6CC2B8()
{
  return MEMORY[0x270F05208]();
}

uint64_t sub_22D6CC2C8()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_22D6CC2D8()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_22D6CC2E8()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_22D6CC2F8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22D6CC308()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_22D6CC318()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22D6CC328()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22D6CC338()
{
  return MEMORY[0x270EF6488]();
}

uint64_t sub_22D6CC348()
{
  return MEMORY[0x270EF6498]();
}

uint64_t sub_22D6CC358()
{
  return MEMORY[0x270EF64A0]();
}

uint64_t sub_22D6CC368()
{
  return MEMORY[0x270EF64A8]();
}

uint64_t sub_22D6CC378()
{
  return MEMORY[0x270EF64B0]();
}

uint64_t sub_22D6CC388()
{
  return MEMORY[0x270EF64B8]();
}

uint64_t sub_22D6CC398()
{
  return MEMORY[0x270EF64C0]();
}

uint64_t sub_22D6CC3A8()
{
  return MEMORY[0x270EF64C8]();
}

uint64_t sub_22D6CC3B8()
{
  return MEMORY[0x270EF64D0]();
}

uint64_t sub_22D6CC3C8()
{
  return MEMORY[0x270EF64D8]();
}

uint64_t sub_22D6CC3D8()
{
  return MEMORY[0x270EF64E0]();
}

uint64_t sub_22D6CC3E8()
{
  return MEMORY[0x270EF64E8]();
}

uint64_t sub_22D6CC3F8()
{
  return MEMORY[0x270EF64F0]();
}

uint64_t sub_22D6CC408()
{
  return MEMORY[0x270EF64F8]();
}

uint64_t sub_22D6CC418()
{
  return MEMORY[0x270EF6500]();
}

uint64_t sub_22D6CC428()
{
  return MEMORY[0x270EF6508]();
}

uint64_t sub_22D6CC438()
{
  return MEMORY[0x270EF6570]();
}

uint64_t sub_22D6CC448()
{
  return MEMORY[0x270EF6650]();
}

uint64_t sub_22D6CC458()
{
  return MEMORY[0x270EF6690]();
}

uint64_t sub_22D6CC468()
{
  return MEMORY[0x270EF6700]();
}

uint64_t sub_22D6CC478()
{
  return MEMORY[0x270EF6708]();
}

uint64_t sub_22D6CC488()
{
  return MEMORY[0x270EF6710]();
}

uint64_t sub_22D6CC498()
{
  return MEMORY[0x270EF6718]();
}

uint64_t sub_22D6CC4B8()
{
  return MEMORY[0x270EF6728]();
}

uint64_t sub_22D6CC4C8()
{
  return MEMORY[0x270EF6730]();
}

uint64_t sub_22D6CC4D8()
{
  return MEMORY[0x270EF6738]();
}

uint64_t sub_22D6CC4E8()
{
  return MEMORY[0x270F4D400]();
}

uint64_t sub_22D6CC4F8()
{
  return MEMORY[0x270F4D408]();
}

uint64_t sub_22D6CC508()
{
  return MEMORY[0x270F4D410]();
}

uint64_t sub_22D6CC518()
{
  return MEMORY[0x270F4D418]();
}

uint64_t sub_22D6CC528()
{
  return MEMORY[0x270F4D420]();
}

uint64_t sub_22D6CC538()
{
  return MEMORY[0x270EF6748]();
}

uint64_t sub_22D6CC548()
{
  return MEMORY[0x270EF6750]();
}

uint64_t sub_22D6CC558()
{
  return MEMORY[0x270EF6758]();
}

uint64_t sub_22D6CC568()
{
  return MEMORY[0x270EF6760]();
}

uint64_t sub_22D6CC578()
{
  return MEMORY[0x270EF6768]();
}

uint64_t sub_22D6CC598()
{
  return MEMORY[0x270EF6788]();
}

uint64_t sub_22D6CC5A8()
{
  return MEMORY[0x270EF6790]();
}

uint64_t sub_22D6CC5B8()
{
  return MEMORY[0x270EF6798]();
}

uint64_t sub_22D6CC5C8()
{
  return MEMORY[0x270EF67A0]();
}

uint64_t sub_22D6CC5D8()
{
  return MEMORY[0x270EF67A8]();
}

uint64_t sub_22D6CC5F8()
{
  return MEMORY[0x270F4D438]();
}

uint64_t sub_22D6CC608()
{
  return MEMORY[0x270EF67C0]();
}

uint64_t sub_22D6CC618()
{
  return MEMORY[0x270EF67C8]();
}

uint64_t sub_22D6CC628()
{
  return MEMORY[0x270EF67D8]();
}

uint64_t sub_22D6CC638()
{
  return MEMORY[0x270EF67E0]();
}

uint64_t sub_22D6CC648()
{
  return MEMORY[0x270F4D440]();
}

uint64_t sub_22D6CC658()
{
  return MEMORY[0x270EF67E8]();
}

uint64_t sub_22D6CC668()
{
  return MEMORY[0x270EF67F0]();
}

uint64_t sub_22D6CC678()
{
  return MEMORY[0x270EF67F8]();
}

uint64_t sub_22D6CC688()
{
  return MEMORY[0x270EF6800]();
}

uint64_t sub_22D6CC6A8()
{
  return MEMORY[0x270EF6810]();
}

uint64_t sub_22D6CC6B8()
{
  return MEMORY[0x270EF6818]();
}

uint64_t sub_22D6CC6C8()
{
  return MEMORY[0x270EF6820]();
}

uint64_t sub_22D6CC6E8()
{
  return MEMORY[0x270EF6838]();
}

uint64_t sub_22D6CC6F8()
{
  return MEMORY[0x270EF6840]();
}

uint64_t sub_22D6CC708()
{
  return MEMORY[0x270F4D448]();
}

uint64_t sub_22D6CC718()
{
  return MEMORY[0x270EF6858]();
}

uint64_t sub_22D6CC728()
{
  return MEMORY[0x270EF6860]();
}

uint64_t sub_22D6CC738()
{
  return MEMORY[0x270EF6868]();
}

uint64_t sub_22D6CC748()
{
  return MEMORY[0x270EF6870]();
}

uint64_t sub_22D6CC758()
{
  return MEMORY[0x270EF6878]();
}

uint64_t sub_22D6CC768()
{
  return MEMORY[0x270EF6880]();
}

uint64_t sub_22D6CC778()
{
  return MEMORY[0x270EF6888]();
}

uint64_t sub_22D6CC788()
{
  return MEMORY[0x270EF6890]();
}

uint64_t sub_22D6CC798()
{
  return MEMORY[0x270EF6898]();
}

uint64_t sub_22D6CC7B8()
{
  return MEMORY[0x270F4D458]();
}

uint64_t sub_22D6CC7D8()
{
  return MEMORY[0x270EF68C0]();
}

uint64_t sub_22D6CC7E8()
{
  return MEMORY[0x270F4D460]();
}

uint64_t sub_22D6CC7F8()
{
  return MEMORY[0x270EF6918]();
}

uint64_t sub_22D6CC808()
{
  return MEMORY[0x270F4D4C8]();
}

uint64_t sub_22D6CC818()
{
  return MEMORY[0x270F4D538]();
}

uint64_t sub_22D6CC828()
{
  return MEMORY[0x270F4D598]();
}

uint64_t sub_22D6CC838()
{
  return MEMORY[0x270EF6968]();
}

uint64_t sub_22D6CC848()
{
  return MEMORY[0x270EF6970]();
}

uint64_t sub_22D6CC858()
{
  return MEMORY[0x270EF69A0]();
}

uint64_t sub_22D6CC868()
{
  return MEMORY[0x270EF69E0]();
}

uint64_t sub_22D6CC878()
{
  return MEMORY[0x270EF69E8]();
}

uint64_t sub_22D6CC888()
{
  return MEMORY[0x270EF69F0]();
}

uint64_t sub_22D6CC898()
{
  return MEMORY[0x270EF6AA0]();
}

uint64_t sub_22D6CC8A8()
{
  return MEMORY[0x270EF6AA8]();
}

uint64_t sub_22D6CC8B8()
{
  return MEMORY[0x270EF6AB0]();
}

uint64_t sub_22D6CC8C8()
{
  return MEMORY[0x270EF6AB8]();
}

uint64_t sub_22D6CC8D8()
{
  return MEMORY[0x270EF6AC0]();
}

uint64_t sub_22D6CC8E8()
{
  return MEMORY[0x270EF6AC8]();
}

uint64_t sub_22D6CC8F8()
{
  return MEMORY[0x270EF6AD8]();
}

uint64_t sub_22D6CC908()
{
  return MEMORY[0x270EF6B08]();
}

uint64_t sub_22D6CC918()
{
  return MEMORY[0x270EF6B18]();
}

uint64_t sub_22D6CC928()
{
  return MEMORY[0x270EF6B20]();
}

uint64_t sub_22D6CC938()
{
  return MEMORY[0x270EF6B28]();
}

uint64_t sub_22D6CC948()
{
  return MEMORY[0x270EF6B30]();
}

uint64_t sub_22D6CC958()
{
  return MEMORY[0x270EF6B40]();
}

uint64_t sub_22D6CC968()
{
  return MEMORY[0x270EF6B48]();
}

uint64_t sub_22D6CC978()
{
  return MEMORY[0x270EF6B58]();
}

uint64_t sub_22D6CC988()
{
  return MEMORY[0x270EF6B60]();
}

uint64_t sub_22D6CC998()
{
  return MEMORY[0x270EF6B68]();
}

uint64_t sub_22D6CC9A8()
{
  return MEMORY[0x270EF6B70]();
}

uint64_t sub_22D6CC9B8()
{
  return MEMORY[0x270F4D648]();
}

uint64_t sub_22D6CC9D8()
{
  return MEMORY[0x270EF6BA8]();
}

uint64_t sub_22D6CC9E8()
{
  return MEMORY[0x270EF6BC8]();
}

uint64_t sub_22D6CC9F8()
{
  return MEMORY[0x270EF6BD8]();
}

uint64_t sub_22D6CCA08()
{
  return MEMORY[0x270EF6BF8]();
}

uint64_t sub_22D6CCA18()
{
  return MEMORY[0x270EF6C08]();
}

uint64_t sub_22D6CCA28()
{
  return MEMORY[0x270EF6C58]();
}

uint64_t sub_22D6CCA38()
{
  return MEMORY[0x270F4D668]();
}

uint64_t sub_22D6CCA48()
{
  return MEMORY[0x270F4D670]();
}

uint64_t sub_22D6CCA58()
{
  return MEMORY[0x270EF6C68]();
}

uint64_t sub_22D6CCA68()
{
  return MEMORY[0x270EF6C70]();
}

uint64_t sub_22D6CCA78()
{
  return MEMORY[0x270EF6C98]();
}

uint64_t sub_22D6CCA88()
{
  return MEMORY[0x270EF6CD8]();
}

uint64_t sub_22D6CCA98()
{
  return MEMORY[0x270EF6CE0]();
}

uint64_t sub_22D6CCAA8()
{
  return MEMORY[0x270EF6CF8]();
}

uint64_t sub_22D6CCAB8()
{
  return MEMORY[0x270EF6D38]();
}

uint64_t sub_22D6CCAC8()
{
  return MEMORY[0x270EF6D78]();
}

uint64_t sub_22D6CCAD8()
{
  return MEMORY[0x270EF6D80]();
}

uint64_t sub_22D6CCAE8()
{
  return MEMORY[0x270EF6D88]();
}

uint64_t sub_22D6CCAF8()
{
  return MEMORY[0x270EF6D90]();
}

uint64_t sub_22D6CCB08()
{
  return MEMORY[0x270EF6D98]();
}

uint64_t sub_22D6CCB18()
{
  return MEMORY[0x270EF6DA0]();
}

uint64_t sub_22D6CCB28()
{
  return MEMORY[0x270EF6DA8]();
}

uint64_t sub_22D6CCB38()
{
  return MEMORY[0x270EF6DC8]();
}

uint64_t sub_22D6CCB48()
{
  return MEMORY[0x270EF6DD0]();
}

uint64_t sub_22D6CCB58()
{
  return MEMORY[0x270EF6DD8]();
}

uint64_t sub_22D6CCB68()
{
  return MEMORY[0x270EF6DE8]();
}

uint64_t sub_22D6CCB78()
{
  return MEMORY[0x270EF6DF0]();
}

uint64_t sub_22D6CCB88()
{
  return MEMORY[0x270EF6DF8]();
}

uint64_t sub_22D6CCB98()
{
  return MEMORY[0x270F08318]();
}

uint64_t sub_22D6CCBA8()
{
  return MEMORY[0x270F08320]();
}

uint64_t sub_22D6CCBB8()
{
  return MEMORY[0x270EF6E08]();
}

uint64_t sub_22D6CCBC8()
{
  return MEMORY[0x270EF6E10]();
}

uint64_t sub_22D6CCBD8()
{
  return MEMORY[0x270F4D6C0]();
}

uint64_t sub_22D6CCBE8()
{
  return MEMORY[0x270F4D6C8]();
}

uint64_t sub_22D6CCBF8()
{
  return MEMORY[0x270F4D6D0]();
}

uint64_t sub_22D6CCC08()
{
  return MEMORY[0x270F4D6F0]();
}

uint64_t sub_22D6CCC18()
{
  return MEMORY[0x270F4D6F8]();
}

uint64_t sub_22D6CCC28()
{
  return MEMORY[0x270F4D700]();
}

uint64_t sub_22D6CCC38()
{
  return MEMORY[0x270F4D708]();
}

uint64_t sub_22D6CCC48()
{
  return MEMORY[0x270EF6E18]();
}

uint64_t sub_22D6CCC58()
{
  return MEMORY[0x270EF6E38]();
}

uint64_t sub_22D6CCC68()
{
  return MEMORY[0x270EF6E48]();
}

uint64_t sub_22D6CCC78()
{
  return MEMORY[0x270EF6E50]();
}

uint64_t sub_22D6CCC88()
{
  return MEMORY[0x270EF6E58]();
}

uint64_t sub_22D6CCC98()
{
  return MEMORY[0x270EF6E60]();
}

uint64_t sub_22D6CCCA8()
{
  return MEMORY[0x270EF6E70]();
}

uint64_t sub_22D6CCCB8()
{
  return MEMORY[0x270EF6E78]();
}

uint64_t sub_22D6CCCC8()
{
  return MEMORY[0x270F4D788]();
}

uint64_t sub_22D6CCCD8()
{
  return MEMORY[0x270F4D7A8]();
}

uint64_t sub_22D6CCCE8()
{
  return MEMORY[0x270F4D7B0]();
}

uint64_t sub_22D6CCCF8()
{
  return MEMORY[0x270F4D7B8]();
}

uint64_t sub_22D6CCD08()
{
  return MEMORY[0x270F4D7C0]();
}

uint64_t sub_22D6CCD18()
{
  return MEMORY[0x270F4D7C8]();
}

uint64_t sub_22D6CCD28()
{
  return MEMORY[0x270EF6F28]();
}

uint64_t sub_22D6CCD38()
{
  return MEMORY[0x270EF6F70]();
}

uint64_t sub_22D6CCD48()
{
  return MEMORY[0x270F4D7D8]();
}

uint64_t sub_22D6CCD58()
{
  return MEMORY[0x270F4D7E0]();
}

uint64_t sub_22D6CCD68()
{
  return MEMORY[0x270F4D7E8]();
}

uint64_t sub_22D6CCD78()
{
  return MEMORY[0x270EF6F90]();
}

uint64_t sub_22D6CCD88()
{
  return MEMORY[0x270EF6FC0]();
}

uint64_t sub_22D6CCD98()
{
  return MEMORY[0x270EF6FD0]();
}

uint64_t sub_22D6CCDA8()
{
  return MEMORY[0x270EF6FD8]();
}

uint64_t sub_22D6CCDB8()
{
  return MEMORY[0x270EF6FE8]();
}

uint64_t sub_22D6CCDC8()
{
  return MEMORY[0x270EF6FF8]();
}

uint64_t sub_22D6CCDD8()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_22D6CCDE8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22D6CCDF8()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_22D6CCE08()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22D6CCE18()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_22D6CCE28()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_22D6CCE38()
{
  return MEMORY[0x270F9D3F8]();
}

uint64_t sub_22D6CCE48()
{
  return MEMORY[0x270F9D428]();
}

uint64_t sub_22D6CCE58()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_22D6CCE68()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22D6CCE78()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_22D6CCE88()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_22D6CCE98()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_22D6CCEA8()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_22D6CCEB8()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_22D6CCEC8()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_22D6CCED8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22D6CCEE8()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_22D6CCEF8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_22D6CCF08()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_22D6CCF18()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22D6CCF28()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_22D6CCF38()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_22D6CCF48()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22D6CCF58()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22D6CCF68()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22D6CCF78()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22D6CCF88()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_22D6CCF98()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22D6CCFA8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_22D6CCFB8()
{
  return MEMORY[0x270F9D910]();
}

uint64_t sub_22D6CCFC8()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_22D6CCFD8()
{
  return MEMORY[0x270F9D990]();
}

uint64_t sub_22D6CCFE8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_22D6CCFF8()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_22D6CD008()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_22D6CD018()
{
  return MEMORY[0x270F9DBA8]();
}

uint64_t sub_22D6CD028()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22D6CD038()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_22D6CD048()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_22D6CD058()
{
  return MEMORY[0x270F9DC00]();
}

uint64_t sub_22D6CD068()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_22D6CD078()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22D6CD088()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_22D6CD098()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_22D6CD0A8()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_22D6CD0B8()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_22D6CD0C8()
{
  return MEMORY[0x270F9DCB8]();
}

uint64_t sub_22D6CD0D8()
{
  return MEMORY[0x270F9DCC8]();
}

uint64_t sub_22D6CD0E8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_22D6CD0F8()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_22D6CD108()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_22D6CD118()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_22D6CD128()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_22D6CD138()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_22D6CD148()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_22D6CD158()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_22D6CD168()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_22D6CD178()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_22D6CD188()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_22D6CD198()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_22D6CD1A8()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_22D6CD1B8()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_22D6CD1C8()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t sub_22D6CD1D8()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_22D6CD1E8()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_22D6CD1F8()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_22D6CD208()
{
  return MEMORY[0x270F9E138]();
}

uint64_t sub_22D6CD218()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_22D6CD228()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_22D6CD238()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t sub_22D6CD248()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_22D6CD258()
{
  return MEMORY[0x270F9E2F0]();
}

uint64_t sub_22D6CD278()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22D6CD288()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_22D6CD298()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22D6CD2A8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22D6CD2B8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22D6CD2C8()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_22D6CD2E8()
{
  return MEMORY[0x270FA0888]();
}

uint64_t sub_22D6CD2F8()
{
  return MEMORY[0x270FA0890]();
}

uint64_t sub_22D6CD308()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_22D6CD318()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_22D6CD328()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22D6CD338()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22D6CD348()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22D6CD358()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_22D6CD368()
{
  return MEMORY[0x270EF2598]();
}

uint64_t sub_22D6CD378()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_22D6CD388()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22D6CD398()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22D6CD3A8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_22D6CD3B8()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_22D6CD3C8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_22D6CD3D8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_22D6CD3E8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22D6CD3F8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22D6CD408()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_22D6CD418()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22D6CD428()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22D6CD438()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_22D6CD448()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_22D6CD458()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_22D6CD468()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_22D6CD478()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22D6CD488()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22D6CD498()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22D6CD4A8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22D6CD4B8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22D6CD4C8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22D6CD4E8()
{
  return MEMORY[0x270F9F220]();
}

uint64_t sub_22D6CD4F8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22D6CD508()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_22D6CD518()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_22D6CD528()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_22D6CD538()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_22D6CD548()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_22D6CD558()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_22D6CD568()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_22D6CD578()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22D6CD598()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_22D6CD5A8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22D6CD5B8()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_22D6CD5D8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_22D6CD5E8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22D6CD5F8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22D6CD608()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22D6CD618()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22D6CD628()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22D6CD638()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22D6CD648()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_22D6CD658()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_22D6CD668()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22D6CD678()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_22D6CD688()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_22D6CD6B8()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t sub_22D6CD6C8()
{
  return MEMORY[0x270FA0128]();
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B80](red, green, blue, alpha);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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