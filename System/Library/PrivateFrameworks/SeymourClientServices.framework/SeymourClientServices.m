unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

uint64_t objectdestroy_108Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 104, 7);
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t static AccountChanged.deliveryStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F687F8];
  uint64_t v3 = sub_25C274620();
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_25C240B68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F687F8];
  uint64_t v3 = sub_25C274620();
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

ValueMetadata *type metadata accessor for AccountChanged()
{
  return &type metadata for AccountChanged;
}

void type metadata accessor for HTTPCookiePropertyKey()
{
  if (!qword_26A598D10)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A598D10);
    }
  }
}

uint64_t sub_25C240C4C(uint64_t a1, uint64_t a2)
{
  return sub_25C240D44(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_25C240C64()
{
  sub_25C274910();
  sub_25C274940();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C240CB8()
{
  sub_25C274910();
  sub_25C274EF0();
  sub_25C274940();
  uint64_t v0 = sub_25C274F10();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C240D2C(uint64_t a1, uint64_t a2)
{
  return sub_25C240D44(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_25C240D44(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_25C274910();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25C240D88(uint64_t a1, id *a2)
{
  uint64_t result = sub_25C2748F0();
  *a2 = 0;
  return result;
}

uint64_t sub_25C240E00(uint64_t a1, id *a2)
{
  char v3 = sub_25C274900();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25C240E80@<X0>(uint64_t *a1@<X8>)
{
  sub_25C274910();
  uint64_t v2 = sub_25C2748E0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25C240EC4()
{
  uint64_t v0 = sub_25C274910();
  uint64_t v2 = v1;
  if (v0 == sub_25C274910() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_25C274E70();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_25C240F50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25C2748E0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25C240F98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C274910();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C240FC4(uint64_t a1)
{
  uint64_t v2 = sub_25C2410F8((unint64_t *)&qword_26A598D30);
  uint64_t v3 = sub_25C2410F8(&qword_26A598D38);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25C24105C()
{
  return sub_25C2410F8(&qword_26A598D18);
}

uint64_t sub_25C241090()
{
  return sub_25C2410F8(&qword_26A598D20);
}

uint64_t sub_25C2410C4()
{
  return sub_25C2410F8(&qword_26A598D28);
}

uint64_t sub_25C2410F8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for HTTPCookiePropertyKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

BOOL static WristState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

BOOL sub_25C241154(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t WristState.hash(into:)()
{
  return sub_25C274F00();
}

uint64_t WristState.hashValue.getter()
{
  return sub_25C274F10();
}

uint64_t sub_25C2411E0()
{
  return sub_25C274F10();
}

uint64_t sub_25C241228()
{
  return sub_25C274F00();
}

uint64_t sub_25C241254()
{
  return sub_25C274F10();
}

unint64_t sub_25C24129C()
{
  unint64_t result = qword_26A598E00;
  if (!qword_26A598E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598E00);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WristState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for WristState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C24144CLL);
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

uint64_t sub_25C241474(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25C241480(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WristState()
{
  return &type metadata for WristState;
}

uint64_t WristStateObserver.__allocating_init(eventHub:)()
{
  swift_unknownObjectRelease();
  return swift_allocObject();
}

uint64_t WristStateObserver.init(eventHub:)()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t WristStateObserver.deinit()
{
  return v0;
}

uint64_t WristStateObserver.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t WristStateObserver.queryState()()
{
  sub_25C241590();
  uint64_t v0 = swift_allocError();
  *(void *)(swift_allocObject() + 16) = v0;
  return sub_25C2745A0();
}

unint64_t sub_25C241590()
{
  unint64_t result = qword_26A598E08;
  if (!qword_26A598E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598E08);
  }
  return result;
}

uint64_t sub_25C2415E4()
{
  sub_25C241590();
  uint64_t v0 = swift_allocError();
  *(void *)(swift_allocObject() + 16) = v0;
  return sub_25C2745A0();
}

uint64_t sub_25C241670()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_25C2416A8()
{
  return sub_25C241710();
}

uint64_t type metadata accessor for WristStateObserver()
{
  return self;
}

uint64_t method lookup function for WristStateObserver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WristStateObserver);
}

uint64_t dispatch thunk of WristStateObserver.__allocating_init(eventHub:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

id sub_25C241710()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_willThrow();
  return v1;
}

id sub_25C241744(void *a1)
{
  return a1;
}

unint64_t static MultiUserGroupActivity.activityIdentifier.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t MultiUserGroupActivity.activity.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25C273F30();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t MultiUserGroupActivity.activityMetadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MultiUserGroupActivity() + 20);
  return sub_25C241890(v3, a1);
}

uint64_t type metadata accessor for MultiUserGroupActivity()
{
  uint64_t result = qword_26B350190;
  if (!qword_26B350190) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C241890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t MultiUserGroupActivity.activityMetadata.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MultiUserGroupActivity() + 20);
  return sub_25C24193C(a1, v3);
}

uint64_t sub_25C24193C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*MultiUserGroupActivity.activityMetadata.modify())()
{
  return nullsub_1;
}

uint64_t MultiUserGroupActivity.init(activity:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a2 + *(int *)(type metadata accessor for MultiUserGroupActivity() + 20);
  uint64_t v5 = sub_25C2747E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = sub_25C273F30();
  BOOL v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  return v7(a2, a1, v6);
}

uint64_t MultiUserGroupActivity.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E10);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MultiUserGroupActivity();
  sub_25C241890(v1 + *(int *)(v5 + 20), (uint64_t)v4);
  uint64_t v6 = sub_25C2747E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v4, v6);
  }
  sub_25C241BD4((uint64_t)v4);
  return sub_25C241C34();
}

uint64_t sub_25C241BD4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C241C34()
{
  sub_25C274810();
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)v8 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF60);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C274780();
  MEMORY[0x270FA5388]();
  sub_25C2747D0();
  uint64_t v4 = sub_25C273F20();
  MEMORY[0x2611829E0](v4);
  sub_25C274770();
  sub_25C2747B0();
  sub_25C273EF0();
  uint64_t v5 = sub_25C273D30();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 0, 1, v5);
  sub_25C274790();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E78);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_25C275A50;
  sub_25C274800();
  v8[1] = v6;
  sub_25C243934(&qword_26A598E80, MEMORY[0x263F08F58]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E88);
  sub_25C24397C();
  sub_25C274C50();
  return MEMORY[0x2611829C0](v1);
}

uint64_t sub_25C241ECC()
{
  if (*v0) {
    return 0xD000000000000010;
  }
  else {
    return 0x7974697669746361;
  }
}

uint64_t sub_25C241F0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C24383C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25C241F34()
{
  return 0;
}

void sub_25C241F40(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25C241F4C(uint64_t a1)
{
  unint64_t v2 = sub_25C2421C4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C241F88(uint64_t a1)
{
  unint64_t v2 = sub_25C2421C4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MultiUserGroupActivity.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E18);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C2421C4();
  sub_25C274F50();
  v8[15] = 0;
  sub_25C273F30();
  sub_25C243934(&qword_26A598E28, MEMORY[0x263F69D38]);
  sub_25C274E30();
  if (!v1)
  {
    type metadata accessor for MultiUserGroupActivity();
    v8[14] = 1;
    sub_25C2747E0();
    sub_25C243934(&qword_26A598E30, MEMORY[0x263F08E80]);
    sub_25C274E20();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_25C2421C4()
{
  unint64_t result = qword_26A598E20;
  if (!qword_26A598E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598E20);
  }
  return result;
}

uint64_t MultiUserGroupActivity.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E10);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_25C273F30();
  uint64_t v20 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E38);
  uint64_t v21 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MultiUserGroupActivity();
  uint64_t v9 = MEMORY[0x270FA5388]();
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t)&v11[*(int *)(v9 + 28)];
  uint64_t v13 = sub_25C2747E0();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  uint64_t v25 = v12;
  v14(v12, 1, 1, v13);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C2421C4();
  uint64_t v15 = v24;
  sub_25C274F40();
  if (v15)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_25C241BD4(v25);
  }
  else
  {
    uint64_t v16 = v20;
    char v27 = 0;
    sub_25C243934(&qword_26A598E40, MEMORY[0x263F69D38]);
    sub_25C274E10();
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v11, v6, v22);
    char v26 = 1;
    sub_25C243934((unint64_t *)&unk_26A598E48, MEMORY[0x263F08E80]);
    sub_25C274E00();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v23);
    sub_25C24193C((uint64_t)v4, v25);
    sub_25C242620((uint64_t)v11, v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_25C242684((uint64_t)v11);
  }
}

uint64_t sub_25C242620(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MultiUserGroupActivity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C242684(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MultiUserGroupActivity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25C2426E0()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_25C2426FC(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E10);
  uint64_t v6 = swift_task_alloc();
  sub_25C241890(v2 + *(int *)(a2 + 20), v6);
  uint64_t v7 = sub_25C2747E0();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_25C241BD4(v6);
    sub_25C241C34();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(a1, v6, v7);
  }
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(v3 + 8);
  return sub_25C24392C(v9);
}

uint64_t sub_25C242868@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return MultiUserGroupActivity.init(from:)(a1, a2);
}

uint64_t sub_25C242880(void *a1)
{
  return MultiUserGroupActivity.encode(to:)(a1);
}

uint64_t MultiUserGroupActivity.hashValue.getter()
{
  return sub_25C274F10();
}

uint64_t sub_25C2428E4()
{
  return sub_25C274F10();
}

uint64_t sub_25C242928()
{
  return sub_25C274F10();
}

uint64_t sub_25C242964()
{
  return sub_25C243934(&qword_26B350208, (void (*)(uint64_t))type metadata accessor for MultiUserGroupActivity);
}

uint64_t sub_25C2429AC()
{
  return sub_25C243934(&qword_26B350200, (void (*)(uint64_t))type metadata accessor for MultiUserGroupActivity);
}

uint64_t sub_25C2429F4()
{
  return sub_25C243934(&qword_26A598E58, (void (*)(uint64_t))type metadata accessor for MultiUserGroupActivity);
}

uint64_t *initializeBufferWithCopyOfBuffer for MultiUserGroupActivity(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25C273F30();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25C2747E0();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E10);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for MultiUserGroupActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C273F30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_25C2747E0();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t initializeWithCopy for MultiUserGroupActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C273F30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25C2747E0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E10);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for MultiUserGroupActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C273F30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_25C2747E0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E10);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for MultiUserGroupActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C273F30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25C2747E0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E10);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithTake for MultiUserGroupActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C273F30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_25C2747E0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E10);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for MultiUserGroupActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C2432F8);
}

uint64_t sub_25C2432F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C273F30();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E10);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for MultiUserGroupActivity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C243408);
}

uint64_t sub_25C243408(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_25C273F30();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598E10);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_25C243510()
{
  sub_25C273F30();
  if (v0 <= 0x3F)
  {
    sub_25C2435D8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25C2435D8()
{
  if (!qword_26B3501A0)
  {
    sub_25C2747E0();
    unint64_t v0 = sub_25C274BD0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B3501A0);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for MultiUserGroupActivity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C2436FCLL);
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

ValueMetadata *type metadata accessor for MultiUserGroupActivity.CodingKeys()
{
  return &type metadata for MultiUserGroupActivity.CodingKeys;
}

unint64_t sub_25C243738()
{
  unint64_t result = qword_26A598E60;
  if (!qword_26A598E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598E60);
  }
  return result;
}

unint64_t sub_25C243790()
{
  unint64_t result = qword_26A598E68;
  if (!qword_26A598E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598E68);
  }
  return result;
}

unint64_t sub_25C2437E8()
{
  unint64_t result = qword_26A598E70;
  if (!qword_26A598E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598E70);
  }
  return result;
}

uint64_t sub_25C24383C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7974697669746361 && a2 == 0xE800000000000000;
  if (v2 || (sub_25C274E70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025C2769A0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25C274E70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25C24392C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25C243934(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25C24397C()
{
  unint64_t result = qword_26A598E90;
  if (!qword_26A598E90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A598E88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598E90);
  }
  return result;
}

uint64_t sub_25C2439D8(uint64_t a1)
{
  *(void *)(v1 + 112) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t RequestCoalescer.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = 0;
  return v0;
}

uint64_t RequestCoalescer.init()()
{
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = 0;
  return v0;
}

uint64_t RequestCoalescer.deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t RequestCoalescer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t RequestCoalescer.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_25C243AB4()
{
  return RequestCoalescer.unownedExecutor.getter();
}

uint64_t RequestCoalescer.run(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = *v3;
  return MEMORY[0x270FA2498](sub_25C243B1C, v3, 0);
}

uint64_t sub_25C243B1C()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(*(void *)(v0 + 48) + 80);
  type metadata accessor for RequestCoalescer();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  long long v5 = *(_OWORD *)(v0 + 24);
  *(void *)(v4 + 16) = v1;
  *(_OWORD *)(v4 + 24) = v5;
  char v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v6;
  *char v6 = v0;
  v6[1] = sub_25C243C44;
  uint64_t v7 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2360](v7, v1, WitnessTable, 0x293A5F286E7572, 0xE700000000000000, sub_25C2440D0, v4, v2);
}

uint64_t sub_25C243C44()
{
  uint64_t v2 = (void *)*v1;
  v2[9] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[5];
    return MEMORY[0x270FA2498](sub_25C243D80, v3, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_25C243D80()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for RequestCoalescer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25C243DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26B350160);
  uint64_t v8 = sub_25C274AC0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v20 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B350130);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 112))
  {
    uint64_t v21 = *(void *)(a2 + 112);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
    sub_25C274A80();
    swift_bridgeObjectRetain();
    sub_25C274A70();
    *(void *)(a2 + 112) = v21;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C274E50();
    swift_allocObject();
    uint64_t v15 = sub_25C274A40();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v16, a1, v8);
    sub_25C274A80();
    *(void *)(a2 + 112) = v15;
    swift_bridgeObjectRelease();
    uint64_t v17 = sub_25C274B00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v13, 1, 1, v17);
    type metadata accessor for RequestCoalescer();
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = a2;
    v19[3] = WitnessTable;
    v19[4] = a3;
    v19[5] = a4;
    v19[6] = a2;
    swift_retain_n();
    swift_retain();
    sub_25C26AB54((uint64_t)v13, (uint64_t)&unk_26A598F30, (uint64_t)v19);
    return swift_release();
  }
}

uint64_t sub_25C2440D0(uint64_t a1)
{
  return sub_25C243DFC(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_25C2440DC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a6;
  uint64_t v8 = *(void *)(*(void *)a6 + 80);
  v6[3] = v8;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26B350160);
  uint64_t v9 = sub_25C274F30();
  v6[4] = v9;
  v6[5] = *(void *)(v9 - 8);
  v6[6] = swift_task_alloc();
  v6[7] = *(void *)(v8 - 8);
  uint64_t v10 = swift_task_alloc();
  v6[8] = v10;
  uint64_t v13 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v11 = (void *)swift_task_alloc();
  v6[9] = v11;
  void *v11 = v6;
  v11[1] = sub_25C2442A4;
  return v13(v10);
}

uint64_t sub_25C2442A4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v0) {
    uint64_t v4 = sub_25C2444CC;
  }
  else {
    uint64_t v4 = sub_25C2443D0;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_25C2443D0()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v6 = v0[3];
  uint64_t v5 = v0[4];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v1, v6);
  swift_storeEnumTagMultiPayload();
  sub_25C24459C(v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_25C2444CC()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v3 = v0[5];
  uint64_t v2 = (void *)v0[6];
  uint64_t v4 = v0[4];
  *uint64_t v2 = v1;
  swift_storeEnumTagMultiPayload();
  id v5 = v1;
  sub_25C24459C((uint64_t)v2);

  (*(void (**)(void *, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_25C24459C(uint64_t result)
{
  if (*(void *)(v1 + 112))
  {
    *(void *)(v1 + 112) = 0;
    MEMORY[0x270FA5388](result);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26B350160);
    sub_25C274AC0();
    sub_25C274A80();
    swift_getWitnessTable();
    sub_25C2749E0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t RequestCoalescer.waitForActiveRequest()(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return MEMORY[0x270FA2498](sub_25C244704, v1, 0);
}

uint64_t sub_25C244704()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void *)(v0[4] + 80);
  type metadata accessor for RequestCoalescer();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25C244810;
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  return MEMORY[0x270FA2360](v5, v1, WitnessTable, 0xD000000000000016, 0x800000025C2769C0, sub_25C244ACC, v6, v2);
}

uint64_t sub_25C244810()
{
  uint64_t v2 = (void *)*v1;
  v2[6] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[3];
    return MEMORY[0x270FA2498](sub_25C244944, v3, 0);
  }
  else
  {
    uint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_25C244944()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25C24495C(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26B350160);
  uint64_t v4 = sub_25C274AC0();
  MEMORY[0x270FA5388]();
  if (*(void *)(a2 + 112))
  {
    uint64_t v9 = *(void *)(a2 + 112);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v8 - v5, a1, v4);
    sub_25C274A80();
    swift_bridgeObjectRetain();
    sub_25C274A70();
    *(void *)(a2 + 112) = v9;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C244FA8();
    swift_allocError();
    return sub_25C274AA0();
  }
}

uint64_t sub_25C244ACC(uint64_t a1)
{
  return sub_25C24495C(a1, v1);
}

uint64_t sub_25C244AD8()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for RequestCoalescer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RequestCoalescer);
}

uint64_t dispatch thunk of RequestCoalescer.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_25C244B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

void *sub_25C244B58(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25C244B88()
{
  return swift_bridgeObjectRelease();
}

void *sub_25C244B90(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void *sub_25C244BD8(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C244C0C(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t sub_25C244C5C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
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

uint64_t sub_25C244CB0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25C244CC8(void *result, int a2)
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

uint64_t type metadata accessor for RequestCoalescer.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25C244D00(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26B350160);
  uint64_t v3 = sub_25C274AC0();
  return sub_25C244D6C(a2, v3);
}

uint64_t sub_25C244D6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25C274F30();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_25C274AA0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_25C274AB0();
  }
}

unint64_t sub_25C244FA8()
{
  unint64_t result = qword_26B34FF20;
  if (!qword_26B34FF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B34FF20);
  }
  return result;
}

uint64_t sub_25C244FFC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25C245044(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25C24510C;
  return sub_25C2440DC(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_25C24510C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25C245200(uint64_t a1)
{
  return sub_25C244D00(a1, *(void *)(v1 + 24));
}

uint64_t static WristMonitorError.== infix(_:_:)()
{
  return 1;
}

uint64_t WristMonitorError.hash(into:)()
{
  return sub_25C274F00();
}

uint64_t WristMonitorError.hashValue.getter()
{
  return sub_25C274F10();
}

uint64_t sub_25C245294()
{
  return 1;
}

uint64_t sub_25C24529C()
{
  return sub_25C274F10();
}

uint64_t sub_25C2452E0()
{
  return sub_25C274F00();
}

uint64_t sub_25C245308()
{
  return sub_25C274F10();
}

unint64_t sub_25C24534C()
{
  unint64_t result = qword_26A598F38;
  if (!qword_26A598F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598F38);
  }
  return result;
}

unint64_t sub_25C2453B4()
{
  unint64_t result = qword_26A598F40;
  if (!qword_26A598F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598F40);
  }
  return result;
}

uint64_t sub_25C245408(uint64_t a1, uint64_t a2)
{
  return sub_25C245438(a1, a2, MEMORY[0x263F68AD8]);
}

uint64_t sub_25C245420(uint64_t a1, uint64_t a2)
{
  return sub_25C245438(a1, a2, MEMORY[0x263F68AD0]);
}

uint64_t sub_25C245438(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, unint64_t, unint64_t))
{
  unint64_t v4 = sub_25C2455C8();
  unint64_t v5 = sub_25C241590();
  return a3(a1, v4, v5);
}

uint64_t getEnumTagSinglePayload for WristMonitorError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for WristMonitorError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25C245588);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C2455B0()
{
  return 0;
}

ValueMetadata *type metadata accessor for WristMonitorError()
{
  return &type metadata for WristMonitorError;
}

unint64_t sub_25C2455C8()
{
  unint64_t result = qword_26A598F48;
  if (!qword_26A598F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598F48);
  }
  return result;
}

id AchievementWeeklyStreak.earnedThisWeek.getter()
{
  uint64_t v0 = sub_25C273D80();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  unsigned int v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)&v21 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v21 - v8;
  sub_25C273D70();
  uint64_t v10 = self;
  id result = objc_msgSend(v10, sel_hk_gregorianCalendar);
  if (result)
  {
    uint64_t v12 = result;
    uint64_t v13 = *MEMORY[0x263F0AC98];
    uint64_t v14 = (void *)sub_25C273D50();
    id v15 = objc_msgSend(v12, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v13, v14, 0);

    sub_25C273D60();
    uint64_t v16 = *(void (**)(char *, uint64_t))(v1 + 8);
    v16(v7, v0);
    sub_25C2740D0();
    id result = objc_msgSend(v10, sel_hk_gregorianCalendar);
    if (result)
    {
      uint64_t v17 = result;
      uint64_t v18 = (void *)sub_25C273D50();
      uint64_t v19 = (void *)sub_25C273D50();
      id v20 = objc_msgSend(v17, sel_hk_isDate_withinNumberOfCalendarDays_ofDate_, v18, 0, v19);

      v16(v4, v0);
      v16(v9, v0);
      return v20;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t dispatch thunk of WristStateObserving.queryState()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void WristStateChanged.state.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t static WristStateChanged.deliveryStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F687F8];
  uint64_t v3 = sub_25C274620();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

unsigned char *storeEnumTagSinglePayload for WristStateChanged(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 1;
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
        JUMPOUT(0x25C2459BCLL);
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
          *id result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WristStateChanged()
{
  return &type metadata for WristStateChanged;
}

id static AVContentKeySession.streamingKeySystem.getter()
{
  return (id)*MEMORY[0x263EF97F8];
}

BOOL static AccountType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AccountType.hash(into:)()
{
  return sub_25C274F00();
}

uint64_t AccountType.hashValue.getter()
{
  return sub_25C274F10();
}

unint64_t sub_25C245A94()
{
  unint64_t result = qword_26A598F50;
  if (!qword_26A598F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598F50);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AccountType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C245BB4);
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

ValueMetadata *type metadata accessor for AccountType()
{
  return &type metadata for AccountType;
}

BOOL static AccountError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AccountError.hash(into:)()
{
  return sub_25C274F00();
}

uint64_t AccountError.hashValue.getter()
{
  return sub_25C274F10();
}

BOOL sub_25C245C74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_25C245C8C()
{
  unint64_t result = qword_26A598F58;
  if (!qword_26A598F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598F58);
  }
  return result;
}

unint64_t sub_25C245CE4()
{
  unint64_t result = qword_26A598F60;
  if (!qword_26A598F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598F60);
  }
  return result;
}

uint64_t sub_25C245D38(uint64_t a1, uint64_t a2)
{
  return sub_25C245D68(a1, a2, MEMORY[0x263F68AD8]);
}

uint64_t sub_25C245D50(uint64_t a1, uint64_t a2)
{
  return sub_25C245D68(a1, a2, MEMORY[0x263F68AD0]);
}

uint64_t sub_25C245D68(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, unint64_t, unint64_t))
{
  unint64_t v4 = sub_25C245FC4();
  unint64_t v5 = sub_25C245DD0();
  return a3(a1, v4, v5);
}

unint64_t sub_25C245DD0()
{
  unint64_t result = qword_26A598F68;
  if (!qword_26A598F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598F68);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AccountError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AccountError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x25C245F84);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

unsigned char *sub_25C245FAC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AccountError()
{
  return &type metadata for AccountError;
}

unint64_t sub_25C245FC4()
{
  unint64_t result = qword_26A598F70;
  if (!qword_26A598F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598F70);
  }
  return result;
}

uint64_t NotificationSettingsProvider.init(bag:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t NotificationSettingsProvider.fetchNotificationSettings(account:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v3;
  return MEMORY[0x270FA2498](sub_25C246044, 0, 0);
}

uint64_t sub_25C246044()
{
  uint64_t v2 = (void *)v0[3];
  uint64_t v1 = v0[4];
  id v3 = objc_allocWithZone(MEMORY[0x263F27F28]);
  id v4 = v2;
  swift_unknownObjectRetain();
  uint64_t v5 = (void *)sub_25C2748E0();
  unsigned int v6 = (void *)sub_25C2748E0();
  id v7 = objc_msgSend(v3, sel_initWithIdentifier_clientIdentifier_account_bag_, v5, v6, v4, v1);
  v0[5] = v7;
  swift_unknownObjectRelease();

  uint64_t v8 = swift_task_alloc();
  v0[6] = v8;
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v1;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[7] = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598F88);
  *uint64_t v9 = v0;
  v9[1] = sub_25C2461F8;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000023, 0x800000025C276BC0, sub_25C2465D0, v8, v10);
}

uint64_t sub_25C2461F8()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25C24637C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_25C246314;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C246314()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_25C24637C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_25C2463E8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598FD0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  id v9 = objc_msgSend(a2, sel_fetchAllSettings);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(void *)(v11 + ((v8 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = a3;
  aBlock[4] = sub_25C247968;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25C2466E8;
  aBlock[3] = &block_descriptor_16;
  uint64_t v12 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(v9, sel_addFinishBlock_, v12);
  _Block_release(v12);
}

void sub_25C2465D0(uint64_t a1)
{
  sub_25C2463E8(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

void sub_25C2465D8(void *a1, id a2)
{
  if (a2)
  {
    id v2 = a2;
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A598FD0);
    sub_25C274AA0();
    return;
  }
  if (!a1)
  {
    sub_25C24773C();
    swift_allocError();
    *uint64_t v6 = 1;
    goto LABEL_3;
  }
  id v3 = a1;
  id v4 = objc_msgSend(v3, sel_itemsMap);
  sub_25C2476FC();
  uint64_t v5 = sub_25C2748A0();

  sub_25C247A18(v5);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598FD0);
  sub_25C274AB0();
}

void sub_25C2466E8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t NotificationSettingsProvider.updateNotificationSettings(settings:account:)(uint64_t a1, uint64_t a2)
{
  v3[2] = a1;
  v3[3] = a2;
  uint64_t v4 = sub_25C274150();
  v3[4] = v4;
  v3[5] = *(void *)(v4 - 8);
  v3[6] = swift_task_alloc();
  v3[7] = swift_task_alloc();
  uint64_t v5 = sub_25C273F90();
  v3[8] = v5;
  v3[9] = *(void *)(v5 - 8);
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = *v2;
  v3[10] = v6;
  v3[11] = v7;
  return MEMORY[0x270FA2498](sub_25C2468A4, 0, 0);
}

uint64_t sub_25C2468A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[2];
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v5 = v1[9];
    uint64_t v6 = v1[5];
    uint64_t v34 = MEMORY[0x263F8EE78];
    sub_25C274D60();
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
    v5 += 16;
    uint64_t v8 = v2 + ((*(unsigned __int8 *)(v5 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 64));
    uint64_t v30 = *(void *)(v5 + 56);
    v31 = v7;
    unsigned int v29 = *MEMORY[0x263F6AB30];
    char v27 = (void (**)(uint64_t, uint64_t))(v5 - 8);
    v28 = (void (**)(uint64_t, uint64_t))(v6 + 8);
    do
    {
      uint64_t v9 = v1[10];
      uint64_t v10 = v1[7];
      uint64_t v33 = v1[8];
      uint64_t v11 = v1[6];
      uint64_t v12 = v1[4];
      v31(v9, v8);
      sub_25C273F70();
      sub_25C273F80();
      (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v11, v29, v12);
      char v32 = sub_25C274140();
      uint64_t v13 = *v28;
      (*v28)(v11, v12);
      v13(v10, v12);
      id v14 = objc_allocWithZone(MEMORY[0x263F27F20]);
      id v15 = (void *)sub_25C2748E0();
      swift_bridgeObjectRelease();
      objc_msgSend(v14, sel_initWithIdentifier_enabled_, v15, v32 & 1);

      (*v27)(v9, v33);
      sub_25C274D40();
      sub_25C274D70();
      sub_25C274D80();
      sub_25C274D50();
      v8 += v30;
      --v3;
    }
    while (v3);
    uint64_t v4 = v34;
  }
  v1[12] = v4;
  uint64_t v16 = v1[11];
  uint64_t v17 = (void *)v1[3];
  id v18 = objc_allocWithZone(MEMORY[0x263F27F28]);
  id v19 = v17;
  swift_unknownObjectRetain();
  id v20 = (void *)sub_25C2748E0();
  uint64_t v21 = (void *)sub_25C2748E0();
  id v22 = objc_msgSend(v18, sel_initWithIdentifier_clientIdentifier_account_bag_, v20, v21, v19, v16);
  v1[13] = v22;
  swift_unknownObjectRelease();

  uint64_t v23 = swift_task_alloc();
  v1[14] = v23;
  *(void *)(v23 + 16) = v22;
  *(void *)(v23 + 24) = v4;
  uint64_t v24 = (void *)swift_task_alloc();
  v1[15] = v24;
  *uint64_t v24 = v1;
  v24[1] = sub_25C246C24;
  uint64_t v25 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2360](v24, 0, 0, 0xD00000000000002DLL, 0x800000025C276BF0, sub_25C2470A4, v23, v25);
}

uint64_t sub_25C246C24()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25C246DD8;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v2 = sub_25C246D4C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C246D4C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C246DD8()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_25C246E80(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598FB8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  sub_25C2476FC();
  uint64_t v7 = (void *)sub_25C274A00();
  id v8 = objc_msgSend(a2, sel_updateSettings_, v7);

  if (v8)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
    unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v10 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
    aBlock[4] = sub_25C247824;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25C247114;
    aBlock[3] = &block_descriptor_0;
    uint64_t v11 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v8, sel_addFinishBlock_, v11);
    _Block_release(v11);
  }
  else
  {
    sub_25C24773C();
    swift_allocError();
    *uint64_t v12 = 0;
    sub_25C274AA0();
  }
}

void sub_25C2470A4(uint64_t a1)
{
  sub_25C246E80(a1, *(void **)(v1 + 16));
}

uint64_t sub_25C2470AC(int a1, id a2)
{
  if (a2)
  {
    id v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A598FB8);
    return sub_25C274AA0();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A598FB8);
    return sub_25C274AB0();
  }
}

void sub_25C247114(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_25C24718C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25C24723C;
  uint64_t v5 = *v1;
  v4[3] = a1;
  v4[4] = v5;
  return MEMORY[0x270FA2498](sub_25C246044, 0, 0);
}

uint64_t sub_25C24723C(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_25C24733C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C24510C;
  return NotificationSettingsProvider.updateNotificationSettings(settings:account:)(a1, a2);
}

uint64_t dispatch thunk of NotificationSettingsProviding.fetchNotificationSettings(account:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25C2474E4;
  return v9(a1, a2, a3);
}

uint64_t sub_25C2474E4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of NotificationSettingsProviding.updateNotificationSettings(settings:account:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_25C24510C;
  return v11(a1, a2, a3, a4);
}

ValueMetadata *type metadata accessor for NotificationSettingsProvider()
{
  return &type metadata for NotificationSettingsProvider;
}

unint64_t sub_25C2476FC()
{
  unint64_t result = qword_26A598FC0;
  if (!qword_26A598FC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A598FC0);
  }
  return result;
}

unint64_t sub_25C24773C()
{
  unint64_t result = qword_26A598FC8;
  if (!qword_26A598FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598FC8);
  }
  return result;
}

uint64_t sub_25C247790()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598FB8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25C247824(int a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598FB8);
  return sub_25C2470AC(a1, a2);
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

uint64_t sub_25C2478C0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A598FD0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_25C247968(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598FD0);
  sub_25C2465D8(a1, a2);
}

uint64_t sub_25C247A18(uint64_t a1)
{
  uint64_t v51 = sub_25C2743D0();
  uint64_t v2 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  v50 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_25C274150();
  uint64_t v4 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  v48 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_25C273F90();
  uint64_t v6 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  v45 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A598FD8);
  uint64_t result = sub_25C274DB0();
  uint64_t v9 = result;
  int64_t v10 = 0;
  uint64_t v52 = a1;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v34 = a1 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  int64_t v35 = (unint64_t)(v12 + 63) >> 6;
  unsigned int v43 = *MEMORY[0x263F6AB38];
  v42 = (void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  unsigned int v41 = *MEMORY[0x263F6AB30];
  unsigned int v40 = *MEMORY[0x263F6AFC0];
  v39 = (void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  uint64_t v38 = result + 64;
  unsigned int v37 = *MEMORY[0x263F6AFB8];
  uint64_t v46 = v6;
  uint64_t v36 = v6 + 32;
  uint64_t v44 = result;
  id v15 = v45;
  if (!v14) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v53 = (v14 - 1) & v14;
  int64_t v54 = v10;
  for (unint64_t i = __clz(__rbit64(v14)) | (v10 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v19 << 6))
  {
    uint64_t v21 = *(void *)(v52 + 56);
    id v22 = (uint64_t *)(*(void *)(v52 + 48) + 16 * i);
    uint64_t v23 = v22[1];
    uint64_t v55 = *v22;
    uint64_t v24 = *(void **)(v21 + 8 * i);
    swift_bridgeObjectRetain();
    id v25 = v24;
    id v26 = objc_msgSend(v25, sel_identifier);
    sub_25C274910();

    if (objc_msgSend(v25, sel_isEnabled)) {
      uint64_t v27 = v41;
    }
    else {
      uint64_t v27 = v43;
    }
    (*v42)(v48, v27, v49);
    if (objc_msgSend(v25, sel_userChanged)) {
      uint64_t v28 = v37;
    }
    else {
      uint64_t v28 = v40;
    }
    (*v39)(v50, v28, v51);
    sub_25C273F60();

    *(void *)(v38 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v9 = v44;
    unsigned int v29 = (void *)(*(void *)(v44 + 48) + 16 * i);
    *unsigned int v29 = v55;
    v29[1] = v23;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v46 + 32))(*(void *)(v9 + 56) + *(void *)(v46 + 72) * i, v15, v47);
    uint64_t v30 = *(void *)(v9 + 16);
    BOOL v31 = __OFADD__(v30, 1);
    uint64_t v32 = v30 + 1;
    if (v31)
    {
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    *(void *)(v9 + 16) = v32;
    unint64_t v14 = v53;
    int64_t v10 = v54;
    if (v53) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v17 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_30;
    }
    if (v17 >= v35) {
      return v9;
    }
    unint64_t v18 = *(void *)(v34 + 8 * v17);
    int64_t v19 = v10 + 1;
    if (!v18)
    {
      int64_t v19 = v10 + 2;
      if (v10 + 2 >= v35) {
        return v9;
      }
      unint64_t v18 = *(void *)(v34 + 8 * v19);
      if (!v18)
      {
        int64_t v19 = v10 + 3;
        if (v10 + 3 >= v35) {
          return v9;
        }
        unint64_t v18 = *(void *)(v34 + 8 * v19);
        if (!v18) {
          break;
        }
      }
    }
LABEL_18:
    uint64_t v53 = (v18 - 1) & v18;
    int64_t v54 = v19;
  }
  uint64_t v20 = v10 + 4;
  if (v10 + 4 >= v35) {
    return v9;
  }
  unint64_t v18 = *(void *)(v34 + 8 * v20);
  if (v18)
  {
    int64_t v19 = v10 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v19 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v19 >= v35) {
      return v9;
    }
    unint64_t v18 = *(void *)(v34 + 8 * v19);
    ++v20;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

unint64_t static NotificationSettingConstants.clientIdentifier.getter()
{
  return 0xD000000000000011;
}

unint64_t static NotificationSettingConstants.settingIdentifier.getter()
{
  return 0xD000000000000011;
}

unint64_t static NotificationSettingConstants.settingsMigratedKey.getter()
{
  return 0xD00000000000001CLL;
}

ValueMetadata *type metadata accessor for NotificationSettingConstants()
{
  return &type metadata for NotificationSettingConstants;
}

void Date.startOfWeek()()
{
  id v0 = objc_msgSend(self, sel_hk_gregorianCalendar);
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = *MEMORY[0x263F0AC98];
    uint64_t v3 = (void *)sub_25C273D50();
    id v4 = objc_msgSend(v1, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v2, v3, 0);

    sub_25C273D60();
  }
  else
  {
    __break(1u);
  }
}

id Date.isSameDay(as:)()
{
  id result = objc_msgSend(self, sel_hk_gregorianCalendar);
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)sub_25C273D50();
    uint64_t v3 = (void *)sub_25C273D50();
    id v4 = objc_msgSend(v1, sel_hk_isDate_withinNumberOfCalendarDays_ofDate_, v2, 0, v3);

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id Date.isSameWeek(as:)(uint64_t a1)
{
  v22[1] = a1;
  uint64_t v1 = sub_25C273D80();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v22 - v6;
  uint64_t v8 = self;
  id result = objc_msgSend(v8, sel_hk_gregorianCalendar);
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  int64_t v10 = result;
  uint64_t v11 = *MEMORY[0x263F0AC98];
  uint64_t v12 = (void *)sub_25C273D50();
  id v13 = objc_msgSend(v10, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v11, v12, 0);

  sub_25C273D60();
  id result = objc_msgSend(v8, sel_hk_gregorianCalendar);
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  unint64_t v14 = result;
  id v15 = (void *)sub_25C273D50();
  id v16 = objc_msgSend(v14, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v11, v15, 0);

  sub_25C273D60();
  id result = objc_msgSend(v8, sel_hk_gregorianCalendar);
  if (result)
  {
    int64_t v17 = result;
    unint64_t v18 = (void *)sub_25C273D50();
    int64_t v19 = (void *)sub_25C273D50();
    id v20 = objc_msgSend(v17, sel_hk_isDate_withinNumberOfCalendarDays_ofDate_, v18, 0, v19);

    uint64_t v21 = *(void (**)(char *, uint64_t))(v2 + 8);
    v21(v5, v1);
    v21(v7, v1);
    return v20;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t AchievementProgressEvaluator.init(progressEnvironment:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t AchievementProgressEvaluator.makeProgressUpdates(forTemplates:)(unint64_t a1)
{
  uint64_t v3 = sub_25C274840();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  if (!os_transaction_create())
  {
    sub_25C274720();
    id v15 = sub_25C274830();
    os_log_type_t v16 = sub_25C274B40();
    if (os_log_type_enabled(v15, v16))
    {
      int64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v17 = 0;
      _os_log_impl(&dword_25C23E000, v15, v16, "Failed to obtain OS transaction", v17, 2u);
      MEMORY[0x261183790](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return MEMORY[0x263F8EE78];
  }
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (!(a1 >> 62))
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_unknownObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_4;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    uint64_t v14 = MEMORY[0x263F8EE78];
LABEL_20:
    swift_unknownObjectRelease_n();
    return v14;
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C274DA0();
  uint64_t v8 = result;
  if (!result) {
    goto LABEL_19;
  }
LABEL_4:
  if (v8 >= 1)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v11 = (id)MEMORY[0x261182F40](i, a1);
      }
      else {
        id v11 = *(id *)(a1 + 8 * i + 32);
      }
      uint64_t v12 = v11;
      uint64_t v18 = v7;
      id v13 = sub_25C2485C0(v11);

      if (v13)
      {
        MEMORY[0x261182C10]();
        if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25C274A50();
        }
        sub_25C274A60();
        sub_25C274A30();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v14 = v19;
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

id sub_25C2485C0(void *a1)
{
  uint64_t v3 = sub_25C274840();
  uint64_t v50 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v48 - v7;
  uint64_t v9 = *v1;
  id v10 = objc_msgSend(a1, sel_progressExpression);
  if (!v10)
  {
LABEL_9:
    sub_25C274720();
    id v19 = a1;
    id v20 = sub_25C274830();
    os_log_type_t v21 = sub_25C274B40();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v49 = v3;
      id v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(void *)&v54[0] = v23;
      *(_DWORD *)id v22 = 136315138;
      id v24 = objc_msgSend(v19, sel_uniqueName);
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = sub_25C274910();
        uint64_t v28 = v27;
      }
      else
      {
        uint64_t v26 = 0;
        uint64_t v28 = 0;
      }
      v55[0] = v26;
      v55[1] = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B350150);
      uint64_t v29 = sub_25C274BB0();
      unint64_t v31 = v30;
      swift_bridgeObjectRelease();
      v55[0] = sub_25C24A1D8(v29, v31, (uint64_t *)v54);
      sub_25C274BE0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v20, v21, "Progress: %s no progressExpression/goalExpression/canonicalUnit", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261183790](v23, -1, -1);
      MEMORY[0x261183790](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v50 + 8))(v6, v49);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v50 + 8))(v6, v3);
    }
    return 0;
  }
  id v11 = v10;
  sub_25C274910();

  id v12 = objc_msgSend(a1, sel_goalExpression);
  if (!v12)
  {
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  id v13 = v12;
  uint64_t v49 = v3;
  sub_25C274910();

  id v14 = objc_msgSend(a1, sel_canonicalUnit);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = v49;
    goto LABEL_8;
  }
  id v15 = v14;
  sub_25C248C40();
  os_log_type_t v16 = (void *)sub_25C274B30();
  swift_bridgeObjectRelease();
  int64_t v17 = (void *)sub_25C274B30();
  uint64_t v18 = v16;
  swift_bridgeObjectRelease();
  if (objc_msgSend(v16, sel_expressionValueWithObject_context_, v9, 0))
  {
    sub_25C274C40();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v54, 0, sizeof(v54));
  }
  uint64_t v32 = v49;
  sub_25C248C80((uint64_t)v54, (uint64_t)v55);
  if (objc_msgSend(v17, sel_expressionValueWithObject_context_, v9, 0))
  {
    sub_25C274C40();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
  }
  sub_25C248C80((uint64_t)&v52, (uint64_t)v54);
  sub_25C248CE8((uint64_t)v55, (uint64_t)&v52);
  if (!*((void *)&v53 + 1)) {
    goto LABEL_25;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_26:
    sub_25C274720();
    v45 = sub_25C274830();
    os_log_type_t v46 = sub_25C274B40();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl(&dword_25C23E000, v45, v46, "No progressValue or goalValue, returning nil", v47, 2u);
      MEMORY[0x261183790](v47, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v50 + 8))(v8, v32);
    sub_25C248D50((uint64_t)v54);
    sub_25C248D50((uint64_t)v55);
    return 0;
  }
  double v33 = v51;
  sub_25C248CE8((uint64_t)v54, (uint64_t)&v52);
  if (!*((void *)&v53 + 1))
  {
LABEL_25:
    sub_25C248D50((uint64_t)&v52);
    goto LABEL_26;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_26;
  }
  double v34 = v51;
  int64_t v35 = self;
  id v36 = objc_msgSend(v35, sel_quantityWithUnit_doubleValue_, v15, v33);
  id v37 = objc_msgSend(v35, sel_quantityWithUnit_doubleValue_, v15, v34);
  id result = objc_msgSend(a1, sel_uniqueName);
  if (result)
  {
    v39 = result;
    sub_25C274910();

    id v40 = objc_allocWithZone(MEMORY[0x263F23640]);
    id v41 = v36;
    id v42 = v37;
    unsigned int v43 = (void *)sub_25C2748E0();
    swift_bridgeObjectRelease();
    id v44 = objc_msgSend(v40, sel_initWithTemplateUniqueName_progressQuantity_goalQuantity_, v43, v41, v42);

    sub_25C248D50((uint64_t)v54);
    sub_25C248D50((uint64_t)v55);
    return v44;
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for AchievementProgressEvaluator()
{
  return &type metadata for AchievementProgressEvaluator;
}

unint64_t sub_25C248C40()
{
  unint64_t result = qword_26B34FE90;
  if (!qword_26B34FE90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B34FE90);
  }
  return result;
}

uint64_t sub_25C248C80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26B34FE98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C248CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26B34FE98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C248D50(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26B34FE98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void ArchivedSession.startOfWeek()()
{
  uint64_t v0 = sub_25C273D80();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(self, sel_hk_gregorianCalendar);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *MEMORY[0x263F0AC98];
    sub_25C273EC0();
    uint64_t v7 = (void *)sub_25C273D50();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    id v8 = objc_msgSend(v5, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v6, v7, 0);

    sub_25C273D60();
  }
  else
  {
    __break(1u);
  }
}

uint64_t ACHAchievementProgressUpdate.modalityIdentifier(from:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF88);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)v25 - v7;
  id v9 = objc_msgSend(v1, sel_templateUniqueName);
  uint64_t v10 = sub_25C274910();
  uint64_t v12 = v11;

  uint64_t v28 = v10;
  uint64_t v29 = v12;
  uint64_t v26 = 45;
  unint64_t v27 = 0xE100000000000000;
  sub_25C249214();
  id v13 = (void *)sub_25C274C00();
  swift_bridgeObjectRelease();
  unint64_t v14 = v13[2];
  if (v14
    && (v13[4] == 0xD000000000000027 && v13[5] == 0x800000025C276CD0 || (sub_25C274E70() & 1) != 0)
    && v14 >= 2)
  {
    uint64_t v16 = v13[6];
    uint64_t v15 = v13[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v28 = v16;
    uint64_t v29 = v15;
    sub_25C2746D0();
    uint64_t v26 = sub_25C274630();
    unint64_t v27 = v17;
    v25[2] = 0;
    v25[3] = 0xE000000000000000;
    uint64_t v18 = sub_25C274C10();
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_25C249390(a1, v18, v20, v8);
    sub_25C249850((uint64_t)v8, (uint64_t)v6);
    uint64_t v21 = sub_25C274130();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v6, 1, v21) != 1)
    {
      uint64_t v23 = sub_25C274110();
      sub_25C24AC68((uint64_t)v8, &qword_26B34FF88);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v21);
      swift_bridgeObjectRelease();
      return v23;
    }
    sub_25C24AC68((uint64_t)v8, &qword_26B34FF88);
    sub_25C24AC68((uint64_t)v6, &qword_26B34FF88);
  }
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_25C249214()
{
  unint64_t result = qword_26B34FFA8;
  if (!qword_26B34FFA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B34FFA8);
  }
  return result;
}

uint64_t ACHAchievementProgressUpdate.isRequired.getter()
{
  id v1 = objc_msgSend(v0, sel_templateUniqueName);
  sub_25C274910();

  sub_25C249214();
  uint64_t v2 = (void *)sub_25C274C00();
  swift_bridgeObjectRelease();
  if (v2[2])
  {
    uint64_t v4 = v2[4];
    uint64_t v3 = v2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v4 == 0xD00000000000001CLL && v3 == 0x800000025C276D00)
    {
      swift_bridgeObjectRelease();
      char v5 = 1;
    }
    else
    {
      char v5 = sub_25C274E70();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_25C249390@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  int64_t v35 = a4;
  uint64_t v38 = a3;
  uint64_t v42 = a2;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF78);
  MEMORY[0x270FA5388](v47);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_25C273F50();
  uint64_t v7 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  unsigned int v43 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25C274130();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  os_log_type_t v46 = (char *)&v34 - v14;
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v39 = a1 + 56;
  uint64_t v16 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & v15;
  uint64_t v45 = v10 + 16;
  uint64_t v48 = v10 + 32;
  id v36 = (uint64_t (**)(char *, char *, uint64_t))(v7 + 32);
  id v37 = (void (**)(char *, uint64_t))(v7 + 8);
  int64_t v40 = (unint64_t)(v16 + 63) >> 6;
  id v41 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  uint64_t v49 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v20 = 0;
  while (1)
  {
    if (v18)
    {
      unint64_t v21 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v22 = v21 | (v20 << 6);
      goto LABEL_23;
    }
    int64_t v23 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v23 >= v40) {
      goto LABEL_28;
    }
    unint64_t v24 = *(void *)(v39 + 8 * v23);
    ++v20;
    if (!v24)
    {
      int64_t v20 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_28;
      }
      unint64_t v24 = *(void *)(v39 + 8 * v20);
      if (!v24)
      {
        int64_t v20 = v23 + 2;
        if (v23 + 2 >= v40) {
          goto LABEL_28;
        }
        unint64_t v24 = *(void *)(v39 + 8 * v20);
        if (!v24)
        {
          int64_t v20 = v23 + 3;
          if (v23 + 3 >= v40) {
            goto LABEL_28;
          }
          unint64_t v24 = *(void *)(v39 + 8 * v20);
          if (!v24)
          {
            int64_t v25 = v23 + 4;
            if (v25 >= v40)
            {
LABEL_28:
              swift_release();
              uint64_t v32 = 1;
              double v33 = v35;
              goto LABEL_31;
            }
            unint64_t v24 = *(void *)(v39 + 8 * v25);
            int64_t v20 = v25;
            if (!v24) {
              break;
            }
          }
        }
      }
    }
LABEL_22:
    unint64_t v18 = (v24 - 1) & v24;
    unint64_t v22 = __clz(__rbit64(v24)) + (v20 << 6);
LABEL_23:
    uint64_t v26 = v46;
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v46, *(void *)(v49 + 48) + *(void *)(v10 + 72) * v22, v9);
    unint64_t v27 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v27(v13, v26, v9);
    sub_25C274120();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v28 = (*v36)(v43, v6, v44);
      uint64_t v29 = MEMORY[0x261182160](v28);
      if (v29 == v42 && v30 == v38)
      {
        swift_bridgeObjectRelease();
        (*v37)(v43, v44);
LABEL_30:
        swift_release();
        double v33 = v35;
        v27(v35, v13, v9);
        uint64_t v32 = 0;
LABEL_31:
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v33, v32, 1, v9);
        return swift_bridgeObjectRelease();
      }
      char v31 = sub_25C274E70();
      swift_bridgeObjectRelease();
      (*v37)(v43, v44);
      if (v31) {
        goto LABEL_30;
      }
    }
    else
    {
      sub_25C24AC68((uint64_t)v6, &qword_26B34FF78);
    }
    uint64_t result = (*v41)(v13, v9);
  }
  while (1)
  {
    int64_t v20 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v20 >= v40) {
      goto LABEL_28;
    }
    unint64_t v24 = *(void *)(v39 + 8 * v20);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_25C249850(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ACHAchievementProgressUpdate.isNextEarnable(for:)(uint64_t a1)
{
  uint64_t v3 = sub_25C274840();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v70 - v10;
  MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v70 - v12;
  id v14 = v1;
  sub_25C24A7C8(a1, v14);
  uint64_t v16 = v15;

  if (!v16)
  {
    sub_25C274720();
    id v18 = v14;
    uint64_t v19 = sub_25C274830();
    os_log_type_t v20 = sub_25C274B50();
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v78[0] = v22;
      uint64_t v75 = v4;
      *(_DWORD *)unint64_t v21 = 136315138;
      id v74 = v21 + 4;
      id v23 = objc_msgSend(v18, sel_templateUniqueName);
      uint64_t v24 = sub_25C274910();
      uint64_t v76 = v3;
      uint64_t v25 = v24;
      unint64_t v27 = v26;

      uint64_t v77 = sub_25C24A1D8(v25, v27, v78);
      sub_25C274BE0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v19, v20, "No matching template for %s, marking progress update as not earnable", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261183790](v22, -1, -1);
      MEMORY[0x261183790](v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v75 + 8))(v7, v76);
      return 0;
    }

    uint64_t v55 = *(void (**)(char *, uint64_t))(v4 + 8);
    v56 = v7;
LABEL_16:
    v55(v56, v3);
    return 0;
  }
  id v17 = v16;
  uint64_t v28 = sub_25C24C8B8();
  id v29 = objc_msgSend(v14, sel_progressQuantity);
  if (!v29
    || (uint64_t v30 = v29,
        sub_25C24C060(),
        uint64_t v32 = v31,
        v30,
        (id v33 = objc_msgSend(v14, sel_goalQuantity)) == 0))
  {
    sub_25C274720();
    id v57 = v14;
    v58 = sub_25C274830();
    os_log_type_t v59 = sub_25C274B50();
    if (os_log_type_enabled(v58, v59))
    {
      id v74 = v17;
      uint64_t v75 = v4;
      uint64_t v60 = swift_slowAlloc();
      uint64_t v61 = swift_slowAlloc();
      v78[0] = v61;
      *(_DWORD *)uint64_t v60 = 136315138;
      os_log_t v73 = (os_log_t)(v60 + 4);
      v62 = (uint8_t *)v60;
      id v63 = objc_msgSend(v57, sel_templateUniqueName);
      uint64_t v76 = v3;
      id v64 = v63;
      uint64_t v65 = sub_25C274910();
      unint64_t v67 = v66;

      uint64_t v77 = sub_25C24A1D8(v65, v67, v78);
      sub_25C274BE0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v58, v59, "Required values not found for earnable evaluation of %s", v62, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261183790](v61, -1, -1);
      MEMORY[0x261183790](v62, -1, -1);

      id v68 = v74;
      (*(void (**)(char *, uint64_t))(v75 + 8))(v11, v76);
      return 0;
    }

    uint64_t v55 = *(void (**)(char *, uint64_t))(v4 + 8);
    v56 = v11;
    goto LABEL_16;
  }
  uint64_t v34 = v33;
  sub_25C24C060();
  uint64_t v36 = v35;

  if (v32 < v28 || v32 >= v36)
  {

    return 0;
  }
  sub_25C274720();
  id v37 = v14;
  uint64_t v38 = sub_25C274830();
  os_log_type_t v39 = sub_25C274B50();
  int v40 = v39;
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v41 = swift_slowAlloc();
    LODWORD(v74) = v40;
    uint64_t v42 = v41;
    uint64_t v75 = swift_slowAlloc();
    v78[0] = v75;
    *(_DWORD *)uint64_t v42 = 136315906;
    uint64_t v72 = v42 + 4;
    id v43 = objc_msgSend(v37, sel_templateUniqueName);
    id v71 = v37;
    id v44 = v43;
    uint64_t v45 = sub_25C274910();
    os_log_t v73 = v38;
    uint64_t v46 = v45;
    uint64_t v76 = v3;
    unint64_t v48 = v47;

    uint64_t v77 = sub_25C24A1D8(v46, v48, v78);
    sub_25C274BE0();
    id v49 = v71;

    swift_bridgeObjectRelease();
    uint64_t v50 = v17;
    uint64_t v51 = v4;
    *(_WORD *)(v42 + 12) = 2048;
    uint64_t v77 = v28;
    sub_25C274BE0();
    *(_WORD *)(v42 + 22) = 2048;
    uint64_t v77 = v32;
    sub_25C274BE0();
    *(_WORD *)(v42 + 32) = 2048;
    uint64_t v77 = v36;
    sub_25C274BE0();
    os_log_t v52 = v73;
    _os_log_impl(&dword_25C23E000, v73, (os_log_type_t)v74, "Found next earnable progress update (%s) with prerequisiteGoalValue: %ld progressValue: %ld goalValue: %ld", (uint8_t *)v42, 0x2Au);
    uint64_t v53 = 1;
    uint64_t v54 = v75;
    swift_arrayDestroy();
    MEMORY[0x261183790](v54, -1, -1);
    MEMORY[0x261183790](v42, -1, -1);

    (*(void (**)(char *, uint64_t))(v51 + 8))(v13, v76);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v13, v3);
    return 1;
  }
  return v53;
}

uint64_t sub_25C24A1D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25C24A2AC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25C24AB68((uint64_t)v12, *a3);
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
      sub_25C24AB68((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25C24A2AC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25C274BF0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25C24A468(a5, a6);
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
  uint64_t v8 = sub_25C274D30();
  if (!v8)
  {
    sub_25C274D90();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25C274DE0();
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

uint64_t sub_25C24A468(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C24A500(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25C24A678(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25C24A678(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C24A500(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25C25F834(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25C274D00();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25C274D90();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25C274960();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25C274DE0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25C274D90();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_25C24A678(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B350158);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_25C274DE0();
  __break(1u);
  return result;
}

void sub_25C24A7C8(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_25C274C70();
    sub_25C24ABC8();
    sub_25C24AC08();
    sub_25C274B20();
    uint64_t v2 = v31;
    uint64_t v28 = v32;
    uint64_t v3 = v33;
    uint64_t v4 = v34;
    unint64_t v5 = v35;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v28 = a1 + 56;
    uint64_t v7 = ~v6;
    uint64_t v8 = -v6;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v5 = v9 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = v7;
    uint64_t v4 = 0;
  }
  int64_t v27 = (unint64_t)(v3 + 64) >> 6;
  uint64_t v29 = v2;
  while (v2 < 0)
  {
    if (!sub_25C274CC0()) {
      goto LABEL_42;
    }
    sub_25C24ABC8();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v13 = v36;
    swift_unknownObjectRelease();
    uint64_t v12 = v4;
    uint64_t v10 = v5;
    if (!v36) {
      goto LABEL_42;
    }
LABEL_33:
    id v17 = objc_msgSend(v13, sel_uniqueName);
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = sub_25C274910();
      uint64_t v21 = v20;
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v21 = 0;
    }
    id v22 = objc_msgSend(a2, sel_templateUniqueName);
    uint64_t v23 = sub_25C274910();
    uint64_t v25 = v24;

    if (v21)
    {
      if (v19 == v23 && v21 == v25)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_42:
        sub_25C24AC60();
        return;
      }
      char v26 = sub_25C274E70();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v26) {
        goto LABEL_42;
      }
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    uint64_t v4 = v12;
    unint64_t v5 = v10;
    uint64_t v2 = v29;
  }
  if (v5)
  {
    uint64_t v10 = (v5 - 1) & v5;
    unint64_t v11 = __clz(__rbit64(v5)) | (v4 << 6);
    uint64_t v12 = v4;
LABEL_32:
    id v13 = *(id *)(*(void *)(v2 + 48) + 8 * v11);
    if (!v13) {
      goto LABEL_42;
    }
    goto LABEL_33;
  }
  int64_t v14 = v4 + 1;
  if (!__OFADD__(v4, 1))
  {
    if (v14 >= v27) {
      goto LABEL_42;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    uint64_t v12 = v4 + 1;
    if (!v15)
    {
      uint64_t v12 = v4 + 2;
      if (v4 + 2 >= v27) {
        goto LABEL_42;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v12);
      if (!v15)
      {
        uint64_t v12 = v4 + 3;
        if (v4 + 3 >= v27) {
          goto LABEL_42;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v12);
        if (!v15)
        {
          uint64_t v12 = v4 + 4;
          if (v4 + 4 >= v27) {
            goto LABEL_42;
          }
          unint64_t v15 = *(void *)(v28 + 8 * v12);
          if (!v15)
          {
            uint64_t v12 = v4 + 5;
            if (v4 + 5 >= v27) {
              goto LABEL_42;
            }
            unint64_t v15 = *(void *)(v28 + 8 * v12);
            if (!v15)
            {
              uint64_t v16 = v4 + 6;
              while (v27 != v16)
              {
                unint64_t v15 = *(void *)(v28 + 8 * v16++);
                if (v15)
                {
                  uint64_t v12 = v16 - 1;
                  goto LABEL_31;
                }
              }
              goto LABEL_42;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t sub_25C24AB68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_25C24ABC8()
{
  unint64_t result = qword_26A598FE0;
  if (!qword_26A598FE0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A598FE0);
  }
  return result;
}

unint64_t sub_25C24AC08()
{
  unint64_t result = qword_26A598FE8;
  if (!qword_26A598FE8)
  {
    sub_25C24ABC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598FE8);
  }
  return result;
}

uint64_t sub_25C24AC60()
{
  return swift_release();
}

uint64_t sub_25C24AC68(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t Set<>.removingUnrelatedTemplates(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x263F8EE88];
  if ((a2 & 0xC000000000000001) != 0)
  {
    uint64_t v43 = MEMORY[0x263F8EE88];
    swift_bridgeObjectRetain();
    sub_25C274C70();
    if (sub_25C274CC0())
    {
      sub_25C24ABC8();
      while (1)
      {
        swift_dynamicCast();
        sub_25C2746D0();
        uint64_t v3 = (void *)sub_25C2746B0();
        uint64_t result = (uint64_t)objc_msgSend(v42, sel_uniqueName);
        if (!result)
        {
LABEL_71:
          __break(1u);
          goto LABEL_72;
        }
        unint64_t v5 = (void *)result;
        uint64_t v6 = sub_25C274910();
        uint64_t v8 = v7;

        uint64_t v9 = v3[2];
        if (v9)
        {
          BOOL v10 = v3[4] == v6 && v3[5] == v8;
          if (v10 || (sub_25C274E70() & 1) != 0)
          {
LABEL_4:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            goto LABEL_5;
          }
          if (v9 != 1)
          {
            if (v3[6] == v6 && v3[7] == v8) {
              goto LABEL_4;
            }
            uint64_t result = sub_25C274E70();
            if (result) {
              goto LABEL_4;
            }
            if (v9 != 2)
            {
              id v22 = v3 + 9;
              uint64_t v23 = 2;
              do
              {
                uint64_t v24 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_70;
                }
                if (*(v22 - 1) == v6 && *v22 == v8) {
                  goto LABEL_4;
                }
                uint64_t result = sub_25C274E70();
                if (result) {
                  goto LABEL_4;
                }
                v22 += 2;
                ++v23;
              }
              while (v24 != v9);
            }
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v11 = v43;
        unint64_t v12 = *(void *)(v43 + 16);
        if (*(void *)(v43 + 24) <= v12)
        {
          sub_25C24B6F4(v12 + 1, &qword_26B34FF30);
          uint64_t v11 = v43;
        }
        uint64_t result = sub_25C274B90();
        uint64_t v13 = v11 + 56;
        uint64_t v14 = -1 << *(unsigned char *)(v11 + 32);
        unint64_t v15 = result & ~v14;
        unint64_t v16 = v15 >> 6;
        if (((-1 << v15) & ~*(void *)(v11 + 56 + 8 * (v15 >> 6))) == 0)
        {
          char v18 = 0;
          unint64_t v19 = (unint64_t)(63 - v14) >> 6;
          while (++v16 != v19 || (v18 & 1) == 0)
          {
            BOOL v20 = v16 == v19;
            if (v16 == v19) {
              unint64_t v16 = 0;
            }
            v18 |= v20;
            uint64_t v21 = *(void *)(v13 + 8 * v16);
            if (v21 != -1)
            {
              unint64_t v17 = __clz(__rbit64(~v21)) + (v16 << 6);
              goto LABEL_26;
            }
          }
          __break(1u);
LABEL_69:
          __break(1u);
LABEL_70:
          __break(1u);
          goto LABEL_71;
        }
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 56 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
LABEL_26:
        *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
        *(void *)(*(void *)(v11 + 48) + 8 * v17) = v42;
        ++*(void *)(v11 + 16);
LABEL_5:
        if (!sub_25C274CC0())
        {
          uint64_t v27 = v43;
          uint64_t v2 = MEMORY[0x263F8EE88];
          goto LABEL_43;
        }
      }
    }
    uint64_t v27 = v2;
LABEL_43:
    swift_release();
  }
  else
  {
    uint64_t v26 = swift_bridgeObjectRetain();
    uint64_t v27 = sub_25C24B990(v26, (uint64_t (*)(char *, unint64_t, uint64_t))sub_25C24BD6C);
  }
  uint64_t v28 = sub_25C2745D0();
  if (v28 != sub_25C2745D0())
  {
    uint64_t v29 = sub_25C2745D0();
    if (v29 != sub_25C2745D0()) {
      return v27;
    }
  }
  if ((v27 & 0xC000000000000001) == 0) {
    return sub_25C24B990(v27, (uint64_t (*)(char *, unint64_t, uint64_t))sub_25C24BB08);
  }
  sub_25C274C70();
  if (!sub_25C274CC0())
  {
LABEL_66:
    swift_release();
    return v2;
  }
  sub_25C24ABC8();
  while (1)
  {
    swift_dynamicCast();
    uint64_t result = (uint64_t)objc_msgSend(v44, sel_uniqueName);
    if (!result) {
      break;
    }
    uint64_t v30 = (void *)result;
    sub_25C274910();

    sub_25C2746D0();
    sub_25C274630();
    sub_25C249214();
    LOBYTE(v30) = sub_25C274C20();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v30)
    {
    }
    else
    {
      uint64_t v31 = v2;
      unint64_t v32 = *(void *)(v2 + 16);
      if (*(void *)(v2 + 24) <= v32)
      {
        sub_25C24B6F4(v32 + 1, &qword_26B34FF30);
        uint64_t v31 = v2;
      }
      uint64_t result = sub_25C274B90();
      uint64_t v33 = v31 + 56;
      uint64_t v34 = -1 << *(unsigned char *)(v31 + 32);
      unint64_t v35 = result & ~v34;
      unint64_t v36 = v35 >> 6;
      if (((-1 << v35) & ~*(void *)(v31 + 56 + 8 * (v35 >> 6))) == 0)
      {
        char v38 = 0;
        unint64_t v39 = (unint64_t)(63 - v34) >> 6;
        while (++v36 != v39 || (v38 & 1) == 0)
        {
          BOOL v40 = v36 == v39;
          if (v36 == v39) {
            unint64_t v36 = 0;
          }
          v38 |= v40;
          uint64_t v41 = *(void *)(v33 + 8 * v36);
          if (v41 != -1)
          {
            unint64_t v37 = __clz(__rbit64(~v41)) + (v36 << 6);
            goto LABEL_65;
          }
        }
        goto LABEL_69;
      }
      unint64_t v37 = __clz(__rbit64((-1 << v35) & ~*(void *)(v31 + 56 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
LABEL_65:
      *(void *)(v33 + ((v37 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v37;
      *(void *)(*(void *)(v31 + 48) + 8 * v37) = v44;
      ++*(void *)(v31 + 16);
    }
    if (!sub_25C274CC0()) {
      goto LABEL_66;
    }
  }
LABEL_72:
  __break(1u);
  return result;
}

id Array<A>.removingUnrelatedTemplates(for:)(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v33 = MEMORY[0x263F8EE78];
  if (a2 >> 62)
  {
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_25C274DA0();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      unint64_t v5 = 0;
      sub_25C2746D0();
      unint64_t v32 = v2 & 0xC000000000000001;
      uint64_t v30 = (void *)(v2 + 32);
      uint64_t v31 = v2 & 0xFFFFFFFFFFFFFF8;
      while (1)
      {
        if (v32)
        {
          id v6 = (id)MEMORY[0x261182F40](v5, v2);
        }
        else
        {
          if (v5 >= *(void *)(v31 + 16)) {
            goto LABEL_37;
          }
          id v6 = (id)v30[v5];
        }
        uint64_t v7 = v6;
        if (__OFADD__(v5++, 1))
        {
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
        uint64_t v9 = (void *)sub_25C2746B0();
        id result = objc_msgSend(v7, sel_uniqueName);
        if (!result)
        {
          __break(1u);
LABEL_62:
          __break(1u);
          return result;
        }
        uint64_t v11 = result;
        uint64_t v12 = sub_25C274910();
        uint64_t v14 = v13;

        uint64_t v15 = v9[2];
        if (!v15)
        {
          swift_bridgeObjectRelease();
          goto LABEL_20;
        }
        uint64_t v16 = v4;
        unint64_t v17 = (void *)v2;
        BOOL v18 = v9[4] == v12 && v9[5] == v14;
        if (v18 || (sub_25C274E70() & 1) != 0) {
          goto LABEL_4;
        }
        if (v15 == 1)
        {
LABEL_18:
          swift_bridgeObjectRelease();
          unint64_t v2 = (unint64_t)v17;
          uint64_t v4 = v16;
LABEL_20:
          swift_bridgeObjectRelease();
          sub_25C274D40();
          sub_25C274D70();
          sub_25C274D80();
          sub_25C274D50();
          if (v5 == v4)
          {
LABEL_35:
            swift_bridgeObjectRelease();
            uint64_t v20 = v33;
            uint64_t v3 = MEMORY[0x263F8EE78];
            goto LABEL_41;
          }
        }
        else
        {
          if ((v9[6] != v12 || v9[7] != v14) && (sub_25C274E70() & 1) == 0)
          {
            if (v15 != 2)
            {
              unint64_t v2 = (unint64_t)(v9 + 9);
              uint64_t v3 = 2;
              while (!__OFADD__(v3, 1))
              {
                if (*(void *)(v2 - 8) == v12 && *(void *)v2 == v14) {
                  goto LABEL_4;
                }
                uint64_t v29 = v3 + 1;
                if (sub_25C274E70()) {
                  goto LABEL_4;
                }
                v2 += 16;
                ++v3;
                if (v29 == v15) {
                  goto LABEL_18;
                }
              }
              goto LABEL_38;
            }
            goto LABEL_18;
          }
LABEL_4:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          unint64_t v2 = (unint64_t)v17;
          uint64_t v4 = v16;
          if (v5 == v16) {
            goto LABEL_35;
          }
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v20 = MEMORY[0x263F8EE78];
LABEL_41:
  uint64_t v21 = sub_25C2745D0();
  if (v21 == sub_25C2745D0() || (uint64_t v22 = sub_25C2745D0(), v22 == sub_25C2745D0()))
  {
    if (v20 < 0 || (v20 & 0x4000000000000000) != 0) {
      goto LABEL_58;
    }
    uint64_t v23 = *(void *)(v20 + 16);
    while (v23)
    {
      for (uint64_t i = 4; ; ++i)
      {
        id v25 = (v20 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x261182F40](i - 4, v20)
            : *(id *)(v20 + 8 * i);
        uint64_t v26 = v25;
        uint64_t v27 = i - 3;
        if (__OFADD__(i - 4, 1)) {
          break;
        }
        id result = objc_msgSend(v25, sel_uniqueName);
        if (!result) {
          goto LABEL_62;
        }
        uint64_t v28 = result;
        sub_25C274910();

        sub_25C2746D0();
        sub_25C274630();
        sub_25C249214();
        LOBYTE(v28) = sub_25C274C20();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v28)
        {
        }
        else
        {
          sub_25C274D40();
          sub_25C274D70();
          sub_25C274D80();
          sub_25C274D50();
        }
        if (v27 == v23)
        {
          swift_release();
          return (id)v3;
        }
      }
      __break(1u);
LABEL_58:
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_25C274DA0();
      swift_release();
    }
    swift_release();
    return (id)MEMORY[0x263F8EE78];
  }
  return (id)v20;
}

uint64_t sub_25C24B6E8(uint64_t a1)
{
  return sub_25C24B6F4(a1, &qword_26B34FFB8);
}

uint64_t sub_25C24B6F4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_25C274CE0();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v30 = v2;
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_33;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_33;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                uint64_t v3 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v4 + 32);
                if (v29 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v8 = -1 << v29;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v11) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v4 + 48) + 8 * v17);
      uint64_t result = sub_25C274B90();
      uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v6;
  return result;
}

uint64_t sub_25C24B990(uint64_t isStackAllocationSafe, uint64_t (*a2)(char *, unint64_t, uint64_t))
{
  uint64_t v4 = isStackAllocationSafe;
  v11[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v6 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v7 = 8 * v6;
  if ((v5 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v7);
    uint64_t v8 = a2((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v6, v4);
    swift_release();
    if (v2) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v9 = (void *)swift_slowAlloc();
    bzero(v9, v7);
    uint64_t v8 = a2((char *)v9, v6, v4);
    swift_release();
    MEMORY[0x261183790](v9, -1, -1);
  }
  return v8;
}

unint64_t *sub_25C24BB08(unint64_t *result, uint64_t a2, uint64_t a3)
{
  unint64_t v16 = result;
  uint64_t v17 = 0;
  int64_t v4 = 0;
  uint64_t v18 = a3 + 56;
  uint64_t v5 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a3 + 56);
  int64_t v19 = (unint64_t)(v5 + 63) >> 6;
  while (v7)
  {
    unint64_t v8 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v9 = v8 | (v4 << 6);
LABEL_17:
    id v13 = *(id *)(*(void *)(a3 + 48) + 8 * v9);
    uint64_t result = (unint64_t *)objc_msgSend(v13, sel_uniqueName);
    if (!result) {
      goto LABEL_30;
    }
    int64_t v14 = result;
    sub_25C274910();

    sub_25C2746D0();
    sub_25C274630();
    sub_25C249214();
    LOBYTE(v14) = sub_25C274C20();

    swift_bridgeObjectRelease();
    uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      *(unint64_t *)((char *)v16 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
      BOOL v10 = __OFADD__(v17++, 1);
      if (v10) {
        goto LABEL_29;
      }
    }
  }
  BOOL v10 = __OFADD__(v4++, 1);
  if (v10)
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v4 >= v19) {
    goto LABEL_26;
  }
  unint64_t v11 = *(void *)(v18 + 8 * v4);
  if (v11)
  {
LABEL_16:
    unint64_t v7 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v4 << 6);
    goto LABEL_17;
  }
  int64_t v12 = v4 + 1;
  if (v4 + 1 >= v19) {
    goto LABEL_26;
  }
  unint64_t v11 = *(void *)(v18 + 8 * v12);
  if (v11) {
    goto LABEL_15;
  }
  int64_t v12 = v4 + 2;
  if (v4 + 2 >= v19) {
    goto LABEL_26;
  }
  unint64_t v11 = *(void *)(v18 + 8 * v12);
  if (v11) {
    goto LABEL_15;
  }
  int64_t v12 = v4 + 3;
  if (v4 + 3 >= v19)
  {
LABEL_26:
    swift_retain();
    return (unint64_t *)sub_25C261DC8(v16, a2, v17, a3);
  }
  unint64_t v11 = *(void *)(v18 + 8 * v12);
  if (v11)
  {
LABEL_15:
    int64_t v4 = v12;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v4 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v4 >= v19) {
      goto LABEL_26;
    }
    unint64_t v11 = *(void *)(v18 + 8 * v4);
    ++v12;
    if (v11) {
      goto LABEL_16;
    }
  }
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

void sub_25C24BD6C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v31 = a2;
  uint64_t v3 = a3;
  uint64_t v36 = 0;
  int64_t v4 = 0;
  uint64_t v5 = a3 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a3 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v34 = a3 + 56;
  int64_t v33 = v9;
  while (1)
  {
    while (1)
    {
      if (v8)
      {
        uint64_t v37 = (v8 - 1) & v8;
        int64_t v38 = v4;
        unint64_t v10 = __clz(__rbit64(v8)) | (v4 << 6);
      }
      else
      {
        int64_t v11 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_46;
        }
        if (v11 >= v9) {
          goto LABEL_44;
        }
        unint64_t v12 = *(void *)(v5 + 8 * v11);
        int64_t v13 = v4 + 1;
        if (!v12)
        {
          int64_t v13 = v4 + 2;
          if (v4 + 2 >= v9) {
            goto LABEL_44;
          }
          unint64_t v12 = *(void *)(v5 + 8 * v13);
          if (!v12)
          {
            int64_t v13 = v4 + 3;
            if (v4 + 3 >= v9) {
              goto LABEL_44;
            }
            unint64_t v12 = *(void *)(v5 + 8 * v13);
            if (!v12)
            {
              uint64_t v14 = v4 + 4;
              if (v4 + 4 >= v9) {
                goto LABEL_44;
              }
              unint64_t v12 = *(void *)(v5 + 8 * v14);
              if (!v12)
              {
                while (1)
                {
                  int64_t v13 = v14 + 1;
                  if (__OFADD__(v14, 1)) {
                    goto LABEL_47;
                  }
                  if (v13 >= v9) {
                    goto LABEL_44;
                  }
                  unint64_t v12 = *(void *)(v5 + 8 * v13);
                  ++v14;
                  if (v12) {
                    goto LABEL_21;
                  }
                }
              }
              int64_t v13 = v4 + 4;
            }
          }
        }
LABEL_21:
        uint64_t v37 = (v12 - 1) & v12;
        int64_t v38 = v13;
        unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
      }
      unint64_t v15 = v10;
      unint64_t v16 = *(void **)(*(void *)(v3 + 48) + 8 * v10);
      sub_25C2746D0();
      id v17 = v16;
      uint64_t v18 = (void *)sub_25C2746B0();
      id v19 = objc_msgSend(v17, sel_uniqueName, v31);
      if (!v19) {
        goto LABEL_48;
      }
      int64_t v20 = v19;
      uint64_t v21 = sub_25C274910();
      uint64_t v23 = v22;

      uint64_t v24 = v18[2];
      if (v24) {
        break;
      }
LABEL_40:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

LABEL_41:
      *(unint64_t *)((char *)a1 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      unint64_t v8 = v37;
      BOOL v30 = __OFADD__(v36++, 1);
      int64_t v4 = v38;
      if (v30)
      {
        __break(1u);
LABEL_44:
        swift_retain();
        sub_25C261DC8(a1, v31, v36, v3);
        return;
      }
    }
    BOOL v25 = v18[4] == v21 && v18[5] == v23;
    if (!v25 && (sub_25C274E70() & 1) == 0) {
      break;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

LABEL_5:
    int64_t v4 = v38;
    unint64_t v8 = v37;
  }
  if (v24 == 1) {
    goto LABEL_40;
  }
  unint64_t v26 = v18 + 7;
  uint64_t v27 = 1;
  while (1)
  {
    uint64_t v28 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    BOOL v29 = *(v26 - 1) == v21 && *v26 == v23;
    if (v29 || (sub_25C274E70() & 1) != 0)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v5 = v34;
      uint64_t v3 = a3;
      int64_t v9 = v33;
      goto LABEL_5;
    }
    v26 += 2;
    ++v27;
    if (v28 == v24)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v5 = v34;
      uint64_t v3 = a3;
      int64_t v9 = v33;
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
}

void sub_25C24C060()
{
  id v1 = v0;
  uint64_t v2 = sub_25C274840();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_countUnit);
  objc_msgSend(v1, sel_doubleValueForUnit_, v6);
  double v8 = v7;

  if (v8 < 9.22337204e18 && v8 > -9.22337204e18)
  {
    if ((~*(void *)&v8 & 0x7FF0000000000000) != 0)
    {
      if (v8 > -9.22337204e18) {
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return;
  }
  sub_25C274720();
  id v10 = v1;
  int64_t v11 = sub_25C274830();
  os_log_type_t v12 = sub_25C274B50();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v23 = v21;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v20 = v13 + 4;
    id v14 = v10;
    id v15 = objc_msgSend(v14, sel_description);
    uint64_t v16 = sub_25C274910();
    unint64_t v18 = v17;

    uint64_t v22 = sub_25C24A1D8(v16, v18, &v23);
    sub_25C274BE0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2048;
    uint64_t v22 = *(void *)&v8;
    sub_25C274BE0();
    _os_log_impl(&dword_25C23E000, v11, v12, "HKQuantity %s had out of bounds doubleValue: %f, returning 0", (uint8_t *)v13, 0x16u);
    uint64_t v19 = v21;
    swift_arrayDestroy();
    MEMORY[0x261183790](v19, -1, -1);
    MEMORY[0x261183790](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id ACHAchievementProgressUpdate.init(progressUpdate:)(uint64_t a1)
{
  uint64_t v2 = sub_25C273E70();
  if (v3 & 1) != 0 || (double v4 = *(double *)&v2, v5 = sub_25C273E60(), (v6))
  {
    id v17 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    sub_25C273E50();
    id v15 = (void *)sub_25C2748E0();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v17, sel_initWithTemplateUniqueName_progressQuantity_goalQuantity_, v15, 0, 0);
  }
  else
  {
    double v7 = *(double *)&v5;
    double v8 = self;
    id v9 = objc_msgSend(v8, sel_countUnit);
    id v10 = self;
    id v11 = objc_msgSend(v10, sel_quantityWithUnit_doubleValue_, v9, v4);

    id v12 = objc_msgSend(v8, sel_countUnit);
    id v13 = objc_msgSend(v10, sel_quantityWithUnit_doubleValue_, v12, v7);

    id v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    sub_25C273E50();
    id v15 = (void *)sub_25C2748E0();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v14, sel_initWithTemplateUniqueName_progressQuantity_goalQuantity_, v15, v11, v13);
  }
  uint64_t v18 = sub_25C273E80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(a1, v18);
  return v16;
}

void ACHAchievementProgressUpdate.transformed()(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25C274840();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(v2, sel_goalQuantity);
  uint64_t v9 = 0;
  if (!v8) {
    goto LABEL_5;
  }
  id v10 = v8;
  id v11 = self;
  id v12 = objc_msgSend(v11, sel_countUnit);
  objc_msgSend(v10, sel_doubleValueForUnit_, v12);
  uint64_t v14 = v13;

  id v15 = objc_msgSend(v2, sel_progressQuantity);
  if (v15)
  {
    id v16 = v15;
    id v17 = objc_msgSend(v11, sel_countUnit);
    objc_msgSend(v16, sel_doubleValueForUnit_, v17);
    uint64_t v9 = v18;

    sub_25C274720();
    id v19 = v2;
    uint64_t v20 = sub_25C274830();
    os_log_type_t v21 = sub_25C274B50();
    unint64_t v22 = 0x2654AF000uLL;
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v39 = v36;
      *(_DWORD *)uint64_t v23 = 136315650;
      v35[1] = v23 + 4;
      id v24 = objc_msgSend(v19, sel_templateUniqueName);
      uint64_t v37 = v5;
      id v25 = v24;
      uint64_t v26 = sub_25C274910();
      unint64_t v28 = v27;

      uint64_t v38 = sub_25C24A1D8(v26, v28, &v39);
      sub_25C274BE0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2048;
      uint64_t v38 = v9;
      sub_25C274BE0();
      *(_WORD *)(v23 + 22) = 2048;
      uint64_t v38 = v14;
      unint64_t v22 = 0x2654AF000;
      sub_25C274BE0();
      _os_log_impl(&dword_25C23E000, v20, v21, "Creating SeymourAchievementProgress for %s, progress: %f, goal: %f", (uint8_t *)v23, 0x20u);
      uint64_t v29 = v36;
      swift_arrayDestroy();
      MEMORY[0x261183790](v29, -1, -1);
      MEMORY[0x261183790](v23, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v4);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    id v33 = [v19 *(SEL *)(v22 + 2448)];
    uint64_t v30 = sub_25C274910();
    uint64_t v31 = v34;

    char v32 = 0;
  }
  else
  {
LABEL_5:
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    char v32 = -1;
    uint64_t v14 = 0;
  }
  *(void *)a1 = v30;
  *(void *)(a1 + 8) = v31;
  *(void *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v14;
  *(unsigned char *)(a1 + 32) = v32;
}

uint64_t sub_25C24C8B8()
{
  uint64_t v2 = v1;
  uint64_t v117 = sub_25C274840();
  uint64_t v3 = *(void *)(v117 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v117);
  uint64_t v6 = (char *)&v110 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (uint64_t)&v110 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  id v12 = (char *)&v110 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v110 - v13;
  id v15 = objc_msgSend(v0, sel_prerequisiteTemplateName);
  uint64_t v113 = v3;
  if (!v15) {
    goto LABEL_7;
  }
  id v16 = v15;
  id v112 = v0;
  uint64_t v17 = sub_25C274910();
  uint64_t v19 = v18;

  uint64_t v115 = v17;
  uint64_t v116 = v19;
  v114[0] = 45;
  v114[1] = 0xE100000000000000;
  sub_25C249214();
  uint64_t v20 = (void *)sub_25C274C00();
  swift_bridgeObjectRelease();
  if (!v20[2])
  {
    swift_bridgeObjectRelease();
    id v0 = v112;
    uint64_t v3 = v113;
    uint64_t v2 = v1;
LABEL_7:
    sub_25C274720();
    id v24 = v0;
    id v25 = sub_25C274830();
    os_log_type_t v26 = sub_25C274B50();
    if (os_log_type_enabled(v25, v26))
    {
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      id v112 = (id)swift_slowAlloc();
      v114[0] = (uint64_t)v112;
      *(_DWORD *)unint64_t v27 = 136315138;
      id v28 = objc_msgSend(v24, sel_uniqueName);
      uint64_t v110 = v2;
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = sub_25C274910();
        uint64_t v32 = v31;
      }
      else
      {
        uint64_t v30 = 0;
        uint64_t v32 = 0;
      }
      uint64_t v115 = v30;
      uint64_t v116 = v32;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B350150);
      uint64_t v43 = sub_25C274BB0();
      unint64_t v45 = v44;
      swift_bridgeObjectRelease();
      uint64_t v115 = sub_25C24A1D8(v43, v45, v114);
      sub_25C274BE0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v25, v26, "No prerequisiteNameComponents for %s, returning 0", v27, 0xCu);
      id v46 = v112;
      swift_arrayDestroy();
      MEMORY[0x261183790](v46, -1, -1);
      MEMORY[0x261183790](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v113 + 8))(v6, v117);
      return 0;
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v117);
    return 0;
  }
  v111 = v14;
  uint64_t v21 = v20[4];
  uint64_t v22 = v20[5];
  sub_25C2746D0();
  swift_bridgeObjectRetain();
  if (v21 == sub_25C274650() && v22 == v23)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  char v33 = sub_25C274E70();
  swift_bridgeObjectRelease();
  if ((v33 & 1) == 0)
  {
    if (v21 == sub_25C274640() && v22 == v47)
    {
      swift_bridgeObjectRelease();
      goto LABEL_37;
    }
    char v48 = sub_25C274E70();
    swift_bridgeObjectRelease();
    if (v48)
    {
LABEL_37:
      swift_bridgeObjectRelease();
      if (v20[2] < 2uLL)
      {
        swift_bridgeObjectRelease();
        id v52 = v112;
      }
      else
      {
        uint64_t v49 = v20[6];
        unint64_t v50 = v20[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v51 = sub_25C24D5D0(v49, v50);
        id v52 = v112;
        if ((v53 & 1) == 0) {
          return v51;
        }
      }
      sub_25C274720();
      id v54 = v52;
      uint64_t v55 = sub_25C274830();
      uint64_t v9 = sub_25C274B50();
      if (os_log_type_enabled(v55, (os_log_type_t)v9))
      {
        v56 = (uint8_t *)swift_slowAlloc();
        id v57 = (void *)swift_slowAlloc();
        v114[0] = (uint64_t)v57;
        *(_DWORD *)v56 = 136315138;
        id v58 = objc_msgSend(v54, sel_uniqueName);
        id v112 = v57;
        if (v58)
        {
          os_log_type_t v59 = v58;
          uint64_t v60 = sub_25C274910();
          uint64_t v62 = v61;
        }
        else
        {
          uint64_t v60 = 0;
          uint64_t v62 = 0;
        }
        uint64_t v115 = v60;
        uint64_t v116 = v62;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B350150);
        uint64_t v73 = sub_25C274BB0();
        unint64_t v75 = v74;
        swift_bridgeObjectRelease();
        uint64_t v115 = sub_25C24A1D8(v73, v75, v114);
        sub_25C274BE0();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C23E000, v55, (os_log_type_t)v9, "Could not fetch previous goal value for modality award %s", v56, 0xCu);
        id v76 = v112;
        swift_arrayDestroy();
        MEMORY[0x261183790](v76, -1, -1);
        MEMORY[0x261183790](v56, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v113 + 8))(v12, v117);
      goto LABEL_90;
    }
    swift_bridgeObjectRelease();
    if (v21 == sub_25C274690() && v22 == v63)
    {
      swift_bridgeObjectRelease_n();
      return 0;
    }
    char v68 = sub_25C274E70();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v68 & 1) == 0)
    {
      sub_25C274720();
      id v77 = v112;
      v78 = sub_25C274830();
      os_log_type_t v79 = sub_25C274B50();
      if (os_log_type_enabled(v78, v79))
      {
        v80 = (uint8_t *)swift_slowAlloc();
        v81 = (void *)swift_slowAlloc();
        v114[0] = (uint64_t)v81;
        *(_DWORD *)v80 = 136315138;
        id v82 = objc_msgSend(v77, sel_uniqueName);
        id v112 = v81;
        if (v82)
        {
          v83 = v82;
          uint64_t v84 = sub_25C274910();
          uint64_t v86 = v85;
        }
        else
        {
          uint64_t v84 = 0;
          uint64_t v86 = 0;
        }
        uint64_t v115 = v84;
        uint64_t v116 = v86;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B350150);
        uint64_t v105 = sub_25C274BB0();
        unint64_t v107 = v106;
        swift_bridgeObjectRelease();
        uint64_t v115 = sub_25C24A1D8(v105, v107, v114);
        sub_25C274BE0();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C23E000, v78, v79, "Not a lifetime or modality lifetime award: %s", v80, 0xCu);
        id v108 = v112;
        swift_arrayDestroy();
        MEMORY[0x261183790](v108, -1, -1);
        MEMORY[0x261183790](v80, -1, -1);
      }
      else
      {
      }
      (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v9, v117);
      goto LABEL_90;
    }
    return 0;
  }
LABEL_13:
  swift_bridgeObjectRelease();
  if (v20[2] < 3uLL)
  {
    swift_bridgeObjectRelease();
    BOOL v40 = v111;
    goto LABEL_84;
  }
  uint64_t v34 = v20[8];
  unint64_t v35 = v20[9];
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v37 = HIBYTE(v35) & 0xF;
  uint64_t v38 = v34 & 0xFFFFFFFFFFFFLL;
  if ((v35 & 0x2000000000000000) != 0) {
    uint64_t v39 = HIBYTE(v35) & 0xF;
  }
  else {
    uint64_t v39 = v34 & 0xFFFFFFFFFFFFLL;
  }
  BOOL v40 = v111;
  if (!v39)
  {
    swift_bridgeObjectRelease();
LABEL_84:
    sub_25C274720();
    id v88 = v112;
    v89 = sub_25C274830();
    os_log_type_t v90 = sub_25C274B50();
    if (os_log_type_enabled(v89, v90))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v91 = swift_slowAlloc();
      v114[0] = v91;
      *(_DWORD *)uint64_t v9 = 136315138;
      id v92 = objc_msgSend(v88, sel_uniqueName);
      if (v92)
      {
        v93 = v92;
        uint64_t v94 = sub_25C274910();
        uint64_t v96 = v95;
      }
      else
      {
        uint64_t v94 = 0;
        uint64_t v96 = 0;
      }
      uint64_t v115 = v94;
      uint64_t v116 = v96;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B350150);
      uint64_t v97 = sub_25C274BB0();
      unint64_t v99 = v98;
      swift_bridgeObjectRelease();
      uint64_t v115 = sub_25C24A1D8(v97, v99, v114);
      sub_25C274BE0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v89, v90, "Could not fetch previous goal value for modality award %s", (uint8_t *)v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261183790](v91, -1, -1);
      MEMORY[0x261183790](v9, -1, -1);

      (*(void (**)(char *, uint64_t))(v113 + 8))(v111, v117);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v113 + 8))(v40, v117);
    }
LABEL_90:
    uint64_t v100 = sub_25C273EE0();
    sub_25C24D820();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v100 - 8) + 104))(v101, *MEMORY[0x263F69880], v100);
    swift_willThrow();
    return v9;
  }
  if ((v35 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = (uint64_t)sub_25C260954(v34, v35, 10);
    LOBYTE(v34) = v109;
    goto LABEL_83;
  }
  if ((v35 & 0x2000000000000000) == 0)
  {
    if ((v34 & 0x1000000000000000) != 0) {
      uint64_t v41 = (unsigned __int8 *)((v35 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v41 = (unsigned __int8 *)sub_25C274D30();
    }
    uint64_t v9 = (uint64_t)sub_25C26093C(v41, v38, 10);
    LOBYTE(v34) = v42 & 1;
LABEL_83:
    swift_bridgeObjectRelease();
    if (v34) {
      goto LABEL_84;
    }
    return v9;
  }
  uint64_t v115 = v34;
  uint64_t v116 = v35 & 0xFFFFFFFFFFFFFFLL;
  if (v34 == 43)
  {
    if (!v37) {
      goto LABEL_106;
    }
    if (v37 == 1 || (BYTE1(v34) - 48) > 9u) {
      goto LABEL_62;
    }
    uint64_t v9 = (BYTE1(v34) - 48);
    if (v37 != 2)
    {
      if ((BYTE2(v34) - 48) > 9u) {
        goto LABEL_62;
      }
      uint64_t v9 = 10 * (BYTE1(v34) - 48) + (BYTE2(v34) - 48);
      uint64_t v64 = v37 - 3;
      if (v64)
      {
        uint64_t v65 = (unsigned __int8 *)&v115 + 3;
        while (1)
        {
          unsigned int v66 = *v65 - 48;
          if (v66 > 9) {
            goto LABEL_62;
          }
          uint64_t v67 = 10 * v9;
          if ((unsigned __int128)(v9 * (__int128)10) >> 64 != (10 * v9) >> 63) {
            goto LABEL_62;
          }
          uint64_t v9 = v67 + v66;
          if (__OFADD__(v67, v66)) {
            goto LABEL_62;
          }
          LOBYTE(v34) = 0;
          ++v65;
          if (!--v64) {
            goto LABEL_83;
          }
        }
      }
    }
LABEL_82:
    LOBYTE(v34) = 0;
    goto LABEL_83;
  }
  if (v34 != 45)
  {
    if (!v37 || (v34 - 48) > 9u) {
      goto LABEL_62;
    }
    uint64_t v9 = (v34 - 48);
    if (v37 != 1)
    {
      if ((BYTE1(v34) - 48) > 9u) {
        goto LABEL_62;
      }
      uint64_t v9 = 10 * (v34 - 48) + (BYTE1(v34) - 48);
      uint64_t v69 = v37 - 2;
      if (v69)
      {
        uint64_t v70 = (unsigned __int8 *)&v115 + 2;
        while (1)
        {
          unsigned int v71 = *v70 - 48;
          if (v71 > 9) {
            goto LABEL_62;
          }
          uint64_t v72 = 10 * v9;
          if ((unsigned __int128)(v9 * (__int128)10) >> 64 != (10 * v9) >> 63) {
            goto LABEL_62;
          }
          uint64_t v9 = v72 + v71;
          if (__OFADD__(v72, v71)) {
            goto LABEL_62;
          }
          LOBYTE(v34) = 0;
          ++v70;
          if (!--v69) {
            goto LABEL_83;
          }
        }
      }
    }
    goto LABEL_82;
  }
  if (v37)
  {
    if (v37 != 1 && (BYTE1(v34) - 48) <= 9u)
    {
      if (v37 == 2)
      {
        LOBYTE(v34) = 0;
        uint64_t v9 = -(uint64_t)(BYTE1(v34) - 48);
        goto LABEL_83;
      }
      if ((BYTE2(v34) - 48) <= 9u)
      {
        uint64_t v9 = -10 * (BYTE1(v34) - 48) - (BYTE2(v34) - 48);
        uint64_t v87 = v37 - 3;
        if (!v87) {
          goto LABEL_82;
        }
        v102 = (unsigned __int8 *)&v115 + 3;
        while (1)
        {
          unsigned int v103 = *v102 - 48;
          if (v103 > 9) {
            break;
          }
          uint64_t v104 = 10 * v9;
          if ((unsigned __int128)(v9 * (__int128)10) >> 64 != (10 * v9) >> 63) {
            break;
          }
          uint64_t v9 = v104 - v103;
          if (__OFSUB__(v104, v103)) {
            break;
          }
          LOBYTE(v34) = 0;
          ++v102;
          if (!--v87) {
            goto LABEL_83;
          }
        }
      }
    }
LABEL_62:
    uint64_t v9 = 0;
    LOBYTE(v34) = 1;
    goto LABEL_83;
  }
  __break(1u);
LABEL_106:
  __break(1u);
  return result;
}

uint64_t sub_25C24D5D0(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)sub_25C274D30();
      }
      uint64_t v7 = (uint64_t)sub_25C26093C(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        id v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        uint64_t v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = (uint64_t)sub_25C260954(result, a2, 10);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

unint64_t sub_25C24D820()
{
  unint64_t result = qword_26B34FF80;
  if (!qword_26B34FF80)
  {
    sub_25C273EE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B34FF80);
  }
  return result;
}

void SeymourAchievementProgressUpdate.init(achProgressUpdate:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_goalQuantity);
  if (v1)
  {
    id v2 = objc_msgSend(self, sel_countUnit);
    objc_msgSend(v1, sel_doubleValueForUnit_, v2);
  }
  id v3 = objc_msgSend(a1, sel_progressQuantity);
  if (v3)
  {
    id v4 = objc_msgSend(self, sel_countUnit);
    objc_msgSend(v3, sel_doubleValueForUnit_, v4);
  }
  id v5 = objc_msgSend(a1, sel_templateUniqueName);
  sub_25C274910();

  sub_25C273E40();
}

id AchievementEnvironmentCache.makeCache(from:sessionEnergyBurned:isGuided:modalityIdentifier:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  unint64_t v96 = a4;
  uint64_t v109 = a3;
  int v102 = a2;
  uint64_t v97 = a5;
  uint64_t v8 = sub_25C274390();
  uint64_t v100 = *(void *)(v8 - 8);
  uint64_t v101 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v84 = (char *)&v83 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v105 = (char *)&v83 - v11;
  uint64_t v103 = sub_25C273ED0();
  uint64_t v99 = *(void *)(v103 - 8);
  MEMORY[0x270FA5388](v103);
  unint64_t v98 = (char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF28);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  unsigned int v16 = (char *)&v83 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v108 = (uint64_t)&v83 - v18;
  MEMORY[0x270FA5388](v17);
  unsigned int v20 = (char *)&v83 - v19;
  uint64_t v21 = sub_25C274840();
  uint64_t v110 = *(void *)(v21 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v104 = ((char *)&v83 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v22);
  os_log_t v107 = (os_log_t)((char *)&v83 - v24);
  uint64_t v25 = sub_25C273D80();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v83 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v83 - v30;
  id result = objc_msgSend(self, sel_hk_gregorianCalendar);
  if (result)
  {
    char v33 = result;
    v89 = v16;
    uint64_t v34 = *MEMORY[0x263F0AC98];
    sub_25C273EC0();
    unint64_t v35 = (void *)sub_25C273D50();
    uint64_t v91 = *(void (**)(char *, uint64_t))(v26 + 8);
    v91(v29, v25);
    id v36 = objc_msgSend(v33, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v34, v35, 0);

    unint64_t v106 = v31;
    sub_25C273D60();

    sub_25C273EB0();
    double v38 = v37;
    sub_25C2746D0();
    sub_25C274680();
    double v40 = v39;
    uint64_t v90 = a1;
    sub_25C273EA0();
    double v42 = v41;
    sub_25C274670();
    double v44 = v43;
    sub_25C274720();
    unint64_t v45 = v96;
    swift_bridgeObjectRetain_n();
    id v46 = sub_25C274830();
    os_log_type_t v47 = sub_25C274B50();
    BOOL v48 = os_log_type_enabled(v46, v47);
    uint64_t v93 = v25;
    uint64_t v92 = v26 + 8;
    if (v48)
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      v112[0] = v50;
      *(_DWORD *)uint64_t v49 = 67110146;
      LODWORD(v111) = v40 < v38;
      sub_25C274BE0();
      *(_WORD *)(v49 + 8) = 1024;
      LODWORD(v111) = v44 < v42;
      sub_25C274BE0();
      *(_WORD *)(v49 + 14) = 2048;
      uint64_t v111 = *(void *)&a6;
      sub_25C274BE0();
      *(_WORD *)(v49 + 24) = 1024;
      uint64_t v51 = v21;
      LODWORD(v111) = v102 & 1;
      sub_25C274BE0();
      *(_WORD *)(v49 + 30) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v52 = v109;
      uint64_t v111 = sub_25C24A1D8(v109, v45, v112);
      sub_25C274BE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C23E000, v46, v47, "Creating a new AchievementEnvironmentCache with meetsDurationThreshold: %{BOOL}d, meetsCompletionThreshold: %{BOOL}d, sessionEnergyBurned: %f, isGuided: %{BOOL}d, modalityIdentifier: %s", (uint8_t *)v49, 0x28u);
      swift_arrayDestroy();
      MEMORY[0x261183790](v50, -1, -1);
      MEMORY[0x261183790](v49, -1, -1);

      uint64_t v53 = v51;
      uint64_t v85 = *(void (**)(os_log_t, uint64_t))(v110 + 8);
      v85(v107, v51);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v53 = v21;
      uint64_t v85 = *(void (**)(os_log_t, uint64_t))(v110 + 8);
      v85(v107, v21);
      uint64_t v52 = v109;
    }
    sub_25C24E520(v106, v44 < v42, v40 < v38, (uint64_t)v20);
    os_log_t v107 = (os_log_t)sub_25C274360();
    unint64_t v96 = v54;
    uint64_t v88 = sub_25C274380();
    uint64_t v87 = v55;
    uint64_t v56 = sub_25C24F548(v52, v45, a6);
    sub_25C251A68((uint64_t)v20, v108);
    uint64_t v57 = (uint64_t)v89;
    sub_25C251A68((uint64_t)v20, (uint64_t)v89);
    uint64_t v58 = sub_25C274100();
    uint64_t v59 = *(void *)(v58 - 8);
    int v60 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v59 + 48))(v57, 1, v58);
    uint64_t v95 = v20;
    uint64_t v94 = v53;
    uint64_t v86 = v56;
    if (v60 == 1)
    {
      sub_25C24AC68(v57, &qword_26B34FF28);
    }
    else
    {
      sub_25C2740F0();
      (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v57, v58);
    }
    sub_25C274310();
    char v61 = v102 & 1;
    uint64_t v62 = v109;
    sub_25C24FA4C(v109, v45, v102 & 1, v44 < v42, v40 < v38);
    sub_25C2523B8(v44 < v42, v40 < v38);
    sub_25C24FF34(v62, v45, v61, v44 < v42, v40 < v38);
    uint64_t v63 = v97;
    sub_25C274350();
    uint64_t v64 = v104;
    sub_25C274720();
    uint64_t v65 = v98;
    uint64_t v66 = v99;
    uint64_t v67 = v103;
    (*(void (**)(char *, uint64_t, uint64_t))(v99 + 16))(v98, v90, v103);
    uint64_t v68 = v100;
    uint64_t v69 = v101;
    uint64_t v70 = *(void (**)(char *, uint64_t, uint64_t))(v100 + 16);
    unsigned int v71 = v105;
    v70(v105, v63, v101);
    uint64_t v72 = sub_25C274830();
    os_log_type_t v73 = sub_25C274B50();
    LODWORD(v109) = v73;
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v74 = swift_slowAlloc();
      uint64_t v108 = swift_slowAlloc();
      v112[0] = v108;
      *(_DWORD *)uint64_t v74 = 136315394;
      uint64_t v75 = sub_25C273E90();
      uint64_t v111 = sub_25C24A1D8(v75, v76, v112);
      os_log_t v107 = v72;
      sub_25C274BE0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v65, v103);
      *(_WORD *)(v74 + 12) = 2080;
      id v77 = v105;
      v70(v84, (uint64_t)v105, v69);
      uint64_t v78 = sub_25C274920();
      uint64_t v111 = sub_25C24A1D8(v78, v79, v112);
      sub_25C274BE0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v68 + 8))(v77, v69);
      os_log_t v80 = v107;
      _os_log_impl(&dword_25C23E000, v107, (os_log_type_t)v109, "[AchievementEnvironmentCache] New cache after updating with data from session %s: %s", (uint8_t *)v74, 0x16u);
      uint64_t v81 = v108;
      swift_arrayDestroy();
      MEMORY[0x261183790](v81, -1, -1);
      MEMORY[0x261183790](v74, -1, -1);

      id v82 = v104;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v68 + 8))(v71, v69);
      (*(void (**)(char *, uint64_t))(v66 + 8))(v65, v67);
      id v82 = v64;
    }
    v85(v82, v94);
    sub_25C24AC68((uint64_t)v95, &qword_26B34FF28);
    return (id)((uint64_t (*)(char *, uint64_t))v91)(v106, v93);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25C24E520@<X0>(char *a1@<X0>, char a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v127 = a4;
  LODWORD(v119) = a3;
  v126 = a1;
  v120 = (void *)sub_25C274390();
  uint64_t v5 = *(v120 - 1);
  MEMORY[0x270FA5388](v120);
  uint64_t v7 = (char *)&v102 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25C274840();
  uint64_t v123 = *(void *)(v8 - 8);
  uint64_t v124 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v102 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v114 = (char *)&v102 - v13;
  MEMORY[0x270FA5388](v12);
  os_log_t v107 = (char *)&v102 - v14;
  uint64_t v106 = sub_25C273CF0();
  uint64_t v105 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  uint64_t v104 = (char *)&v102 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25C273E10();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v110 = v16;
  uint64_t v111 = v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v102 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF68);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v102 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_25C273D80();
  uint64_t v118 = *(void *)(v122 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v122);
  uint64_t v25 = (char *)&v102 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  id v112 = (char *)&v102 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v113 = (char *)&v102 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v115 = (char *)&v102 - v30;
  uint64_t v108 = sub_25C273E20();
  uint64_t v109 = *(void *)(v108 - 8);
  MEMORY[0x270FA5388](v108);
  uint64_t v117 = (char *)&v102 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF28);
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  unint64_t v35 = (char *)&v102 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  double v37 = (char *)&v102 - v36;
  uint64_t v125 = sub_25C274100();
  uint64_t v121 = *(void *)(v125 - 8);
  MEMORY[0x270FA5388](v125);
  uint64_t v116 = (char *)&v102 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 & 1) != 0 && (v119)
  {
    sub_25C274300();
    uint64_t v39 = v121;
    uint64_t v40 = v125;
    int v41 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v121 + 48))(v37, 1, v125);
    double v42 = v126;
    if (v41 == 1)
    {
      sub_25C24AC68((uint64_t)v37, &qword_26B34FF28);
      double v43 = v114;
      sub_25C274720();
      uint64_t v44 = v118;
      uint64_t v45 = v122;
      v128 = *(void (**)(char *, char *, uint64_t))(v118 + 16);
      v128(v25, v42, v122);
      id v46 = sub_25C274830();
      os_log_type_t v47 = sub_25C274B50();
      if (os_log_type_enabled(v46, v47))
      {
        BOOL v48 = (uint8_t *)swift_slowAlloc();
        uint64_t v49 = swift_slowAlloc();
        v130[0] = v49;
        *(_DWORD *)BOOL v48 = 136315138;
        sub_25C252710(&qword_26A598FF0, MEMORY[0x263F07490]);
        uint64_t v50 = sub_25C274E40();
        uint64_t v129 = sub_25C24A1D8(v50, v51, v130);
        uint64_t v45 = v122;
        uint64_t v40 = v125;
        sub_25C274BE0();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v45);
        _os_log_impl(&dword_25C23E000, v46, v47, "Current streak was nil, starting a new 1 week streak with start of week %s", v48, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261183790](v49, -1, -1);
        uint64_t v52 = v48;
        uint64_t v39 = v121;
        MEMORY[0x261183790](v52, -1, -1);

        (*(void (**)(char *, uint64_t))(v123 + 8))(v114, v124);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v45);

        (*(void (**)(char *, uint64_t))(v123 + 8))(v43, v124);
      }
      v128(v112, v126, v45);
      uint64_t v79 = v127;
      sub_25C2740E0();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v79, 0, 1, v40);
    }
    else
    {
      uint64_t v63 = *(char **)(v39 + 32);
      uint64_t v119 = v39 + 32;
      v114 = v63;
      ((void (*)(char *, char *, uint64_t))v63)(v116, v37, v40);
      id v64 = objc_msgSend(self, sel_currentCalendar);
      sub_25C273DD0();

      uint64_t v103 = sub_25C2740F0();
      uint64_t v65 = v115;
      sub_25C2740D0();
      uint64_t v67 = v110;
      uint64_t v66 = v111;
      uint64_t v68 = *(void (**)(void))(v111 + 104);
      LODWORD(v128) = *MEMORY[0x263F07870];
      v120 = v68;
      v68(v19);
      sub_25C273DE0();
      uint64_t v69 = *(void (**)(char *, uint64_t))(v66 + 8);
      v69(v19, v67);
      uint64_t v70 = v118;
      uint64_t v71 = v122;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v118 + 48))(v22, 1, v122) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v113, v22, v71);
        ((void (*)(char *, void, uint64_t))v120)(v19, v128, v67);
        char v80 = sub_25C273DF0();
        v69(v19, v67);
        if (v80)
        {
          uint64_t v81 = *(void (**)(char *, uint64_t))(v70 + 8);
          v81(v113, v71);
          v81(v65, v71);
          (*(void (**)(char *, uint64_t))(v109 + 8))(v117, v108);
          uint64_t v82 = v127;
          uint64_t v83 = v125;
          ((void (*)(uint64_t, char *, uint64_t))v114)(v127, v116, v125);
          return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v121 + 56))(v82, 0, 1, v83);
        }
        ((void (*)(char *, void, uint64_t))v120)(v19, v128, v67);
        uint64_t v84 = v117;
        char v85 = sub_25C273DF0();
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v69)(v19, v67);
        if (v85)
        {
          uint64_t v86 = v125;
          uint64_t v87 = v115;
          if (__OFADD__(v103, 1))
          {
            __break(1u);
            return result;
          }
          uint64_t v88 = v118;
          (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v112, v126, v71);
          uint64_t v89 = v127;
          sub_25C2740E0();
          uint64_t v90 = *(void (**)(char *, uint64_t))(v88 + 8);
          v90(v113, v71);
          v90(v87, v71);
          (*(void (**)(char *, uint64_t))(v109 + 8))(v117, v108);
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FFD0);
          unint64_t v91 = (*(unsigned __int8 *)(v111 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v111 + 80);
          uint64_t v92 = swift_allocObject();
          *(_OWORD *)(v92 + 16) = xmmword_25C275A50;
          ((void (*)(unint64_t, void, uint64_t))v120)(v92 + v91, v128, v67);
          sub_25C2520A0(v92);
          swift_setDeallocating();
          swift_arrayDestroy();
          swift_deallocClassInstance();
          uint64_t v93 = v104;
          uint64_t v94 = v115;
          sub_25C273DB0();
          swift_bridgeObjectRelease();
          uint64_t v95 = sub_25C273CE0();
          uint64_t v86 = v125;
          if ((v96 & 1) != 0 || v95 < 14)
          {
            (*(void (**)(char *, uint64_t))(v105 + 8))(v93, v106);
            uint64_t v100 = *(void (**)(char *, uint64_t))(v118 + 8);
            v100(v113, v71);
            v100(v94, v71);
            (*(void (**)(char *, uint64_t))(v109 + 8))(v84, v108);
            uint64_t v101 = v127;
            ((void (*)(uint64_t, char *, uint64_t))v114)(v127, v116, v86);
            return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v121 + 56))(v101, 0, 1, v86);
          }
          uint64_t v97 = v118;
          (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v112, v126, v71);
          uint64_t v89 = v127;
          sub_25C2740E0();
          (*(void (**)(char *, uint64_t))(v105 + 8))(v93, v106);
          unint64_t v98 = *(void (**)(char *, uint64_t))(v97 + 8);
          v98(v113, v71);
          v98(v94, v71);
          (*(void (**)(char *, uint64_t))(v109 + 8))(v84, v108);
        }
        uint64_t v99 = v121;
        (*(void (**)(char *, uint64_t))(v121 + 8))(v116, v86);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v99 + 56))(v89, 0, 1, v86);
      }
      sub_25C24AC68((uint64_t)v22, &qword_26B34FF68);
      uint64_t v72 = v107;
      sub_25C274720();
      os_log_type_t v73 = sub_25C274830();
      os_log_type_t v74 = sub_25C274B50();
      if (os_log_type_enabled(v73, v74))
      {
        uint64_t v75 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v75 = 0;
        _os_log_impl(&dword_25C23E000, v73, v74, "Unable to determine the first weekday of the extended streak", v75, 2u);
        MEMORY[0x261183790](v75, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v123 + 8))(v72, v124);
      (*(void (**)(char *, uint64_t))(v118 + 8))(v115, v122);
      (*(void (**)(char *, uint64_t))(v109 + 8))(v117, v108);
      uint64_t v76 = v121;
      uint64_t v77 = v125;
      (*(void (**)(char *, uint64_t))(v121 + 8))(v116, v125);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v76 + 56))(v127, 1, 1, v77);
    }
  }
  else
  {
    sub_25C274720();
    uint64_t v53 = v5;
    unint64_t v54 = v120;
    (*(void (**)(char *, void, void *))(v5 + 16))(v7, v128, v120);
    uint64_t v55 = sub_25C274830();
    os_log_type_t v56 = sub_25C274B50();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = swift_slowAlloc();
      v126 = v11;
      uint64_t v58 = (uint8_t *)v57;
      uint64_t v59 = swift_slowAlloc();
      v130[0] = v59;
      *(_DWORD *)uint64_t v58 = 136315138;
      uint64_t v125 = (uint64_t)(v58 + 4);
      sub_25C274300();
      uint64_t v60 = sub_25C274BB0();
      unint64_t v62 = v61;
      sub_25C24AC68((uint64_t)v35, &qword_26B34FF28);
      uint64_t v129 = sub_25C24A1D8(v60, v62, v130);
      sub_25C274BE0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void *))(v53 + 8))(v7, v120);
      _os_log_impl(&dword_25C23E000, v55, v56, "Session does not meet completion and duration threshold, returning current streak %s", v58, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261183790](v59, -1, -1);
      MEMORY[0x261183790](v58, -1, -1);

      (*(void (**)(char *, uint64_t))(v123 + 8))(v126, v124);
    }
    else
    {
      (*(void (**)(char *, void *))(v53 + 8))(v7, v54);

      (*(void (**)(char *, uint64_t))(v123 + 8))(v11, v124);
    }
    return sub_25C274300();
  }
}

uint64_t sub_25C24F548(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v6 = sub_25C274840();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v13 = sub_25C274330();
  uint64_t v14 = sub_25C274330();
  if (!*(void *)(v14 + 16)) {
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  unint64_t v15 = sub_25C26150C(a1, a2);
  if ((v16 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_bridgeObjectRelease();
    sub_25C274720();
    swift_bridgeObjectRetain_n();
    uint64_t v25 = sub_25C274830();
    os_log_type_t v26 = sub_25C274B50();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v34 = v7;
      uint64_t v29 = v28;
      v36[0] = v28;
      *(_DWORD *)uint64_t v27 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_25C24A1D8(a1, a2, v36);
      uint64_t v33 = v6;
      sub_25C274BE0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v27 + 12) = 2048;
      uint64_t v35 = *(void *)&a3;
      sub_25C274BE0();
      _os_log_impl(&dword_25C23E000, v25, v26, "[AchievementEnvironmentCache] No current best energy burned value for modality %s, using %f", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261183790](v29, -1, -1);
      MEMORY[0x261183790](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v33);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    goto LABEL_10;
  }
  double v17 = *(double *)(*(void *)(v14 + 56) + 8 * v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v17 < a3)
  {
    sub_25C274720();
    swift_bridgeObjectRetain_n();
    uint64_t v18 = sub_25C274830();
    os_log_type_t v19 = sub_25C274B50();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      LODWORD(v33) = v20;
      uint64_t v22 = v21;
      uint64_t v34 = swift_slowAlloc();
      v36[0] = v34;
      *(_DWORD *)uint64_t v22 = 134218498;
      uint64_t v35 = *(void *)&a3;
      sub_25C274BE0();
      *(_WORD *)(v22 + 12) = 2048;
      uint64_t v35 = *(void *)&v17;
      sub_25C274BE0();
      *(_WORD *)(v22 + 22) = 2080;
      uint64_t v23 = v7;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_25C24A1D8(a1, a2, v36);
      sub_25C274BE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C23E000, v18, (os_log_type_t)v33, "[AchievementEnvironmentCache] Session energy burned (%f) is greater than the current best (%f) for %s", (uint8_t *)v22, 0x20u);
      uint64_t v24 = v34;
      swift_arrayDestroy();
      MEMORY[0x261183790](v24, -1, -1);
      MEMORY[0x261183790](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v6);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
LABEL_10:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A599008);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25C275A50;
    *(void *)(inited + 32) = a1;
    *(void *)(inited + 40) = a2;
    *(double *)(inited + 48) = a3;
    swift_bridgeObjectRetain();
    unint64_t v31 = sub_25C25E930(inited);
    return sub_25C2519D8(v31, v13, (uint64_t)sub_25C252070, (void (*)(uint64_t, uint64_t, void, uint64_t, uint64_t *))sub_25C251AD0);
  }
  return v13;
}

uint64_t sub_25C24FA4C(uint64_t a1, unint64_t a2, char a3, char a4, char a5)
{
  uint64_t v40 = a1;
  uint64_t v9 = sub_25C274840();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v37 - v14;
  uint64_t v16 = sub_25C274370();
  uint64_t v17 = v16;
  if ((a4 & 1) == 0 || (a5 & 1) == 0 || (a3 & 1) == 0)
  {
    uint64_t v40 = v10;
    sub_25C274720();
    swift_bridgeObjectRetain_n();
    uint64_t v23 = sub_25C274830();
    os_log_type_t v24 = sub_25C274B50();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v39 = v9;
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v42 = v26;
      *(_DWORD *)uint64_t v25 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_25C2748B0();
      unint64_t v29 = v28;
      swift_bridgeObjectRelease();
      uint64_t v41 = sub_25C24A1D8(v27, v29, &v42);
      sub_25C274BE0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v23, v24, "[AchievementEnvironmentCache] Session not counted towards guided workout count, returning %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261183790](v26, -1, -1);
      MEMORY[0x261183790](v25, -1, -1);

      (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v39);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v9);
    }
    return v17;
  }
  uint64_t v18 = *(void *)(v16 + 16);
  uint64_t v39 = v9;
  if (v18)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = v40;
    unint64_t v20 = sub_25C26150C(v40, a2);
    if (v21) {
      uint64_t v22 = *(void *)(*(void *)(v17 + 56) + 8 * v20);
    }
    else {
      uint64_t v22 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v19 = v40;
  }
  sub_25C274720();
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_25C274830();
  os_log_type_t v31 = sub_25C274B50();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v41 = v22;
    uint64_t v42 = v33;
    *(_DWORD *)uint64_t v32 = 134218242;
    uint64_t v38 = v22;
    sub_25C274BE0();
    *(_WORD *)(v32 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_25C24A1D8(v40, a2, &v42);
    uint64_t v22 = v38;
    sub_25C274BE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C23E000, v30, v31, "[AchievementEnvironmentCache] Adding to current guided workout count %ld for modality %s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261183790](v33, -1, -1);
    MEMORY[0x261183790](v32, -1, -1);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v39);
    uint64_t v19 = v40;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v39);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A599000);
  uint64_t result = swift_initStackObject();
  *(_OWORD *)(result + 16) = xmmword_25C275A50;
  *(void *)(result + 32) = v19;
  *(void *)(result + 40) = a2;
  if (!__OFADD__(v22, 1))
  {
    uint64_t v35 = result;
    *(void *)(result + 48) = v22 + 1;
    swift_bridgeObjectRetain();
    unint64_t v36 = sub_25C25EA44(v35);
    return sub_25C2519D8(v36, v17, (uint64_t)sub_25C252088, (void (*)(uint64_t, uint64_t, void, uint64_t, uint64_t *))sub_25C251DA0);
  }
  __break(1u);
  return result;
}

uint64_t sub_25C24FF34(uint64_t a1, unint64_t a2, char a3, char a4, char a5)
{
  uint64_t v40 = a1;
  uint64_t v9 = sub_25C274840();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v37 - v14;
  uint64_t v16 = sub_25C274340();
  uint64_t v17 = v16;
  if (a4 & 1) == 0 || (a5 & 1) == 0 || (a3)
  {
    uint64_t v40 = v10;
    sub_25C274720();
    swift_bridgeObjectRetain_n();
    uint64_t v23 = sub_25C274830();
    os_log_type_t v24 = sub_25C274B50();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v39 = v9;
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v42 = v26;
      *(_DWORD *)uint64_t v25 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_25C2748B0();
      unint64_t v29 = v28;
      swift_bridgeObjectRelease();
      uint64_t v41 = sub_25C24A1D8(v27, v29, &v42);
      sub_25C274BE0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v23, v24, "[AchievementEnvironmentCache] Session not counted towards modality workout count, returning %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261183790](v26, -1, -1);
      MEMORY[0x261183790](v25, -1, -1);

      (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v39);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v9);
    }
    return v17;
  }
  uint64_t v18 = *(void *)(v16 + 16);
  uint64_t v39 = v9;
  if (v18)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = v40;
    unint64_t v20 = sub_25C26150C(v40, a2);
    if (v21) {
      uint64_t v22 = *(void *)(*(void *)(v17 + 56) + 8 * v20);
    }
    else {
      uint64_t v22 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v19 = v40;
  }
  sub_25C274720();
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_25C274830();
  os_log_type_t v31 = sub_25C274B50();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v41 = v22;
    uint64_t v42 = v33;
    *(_DWORD *)uint64_t v32 = 134218242;
    uint64_t v38 = v22;
    sub_25C274BE0();
    *(_WORD *)(v32 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_25C24A1D8(v40, a2, &v42);
    uint64_t v22 = v38;
    sub_25C274BE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C23E000, v30, v31, "[AchievementEnvironmentCache] Adding to current workout count %ld for modality %s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261183790](v33, -1, -1);
    MEMORY[0x261183790](v32, -1, -1);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v39);
    uint64_t v19 = v40;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v39);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A599000);
  uint64_t result = swift_initStackObject();
  *(_OWORD *)(result + 16) = xmmword_25C275A50;
  *(void *)(result + 32) = v19;
  *(void *)(result + 40) = a2;
  if (!__OFADD__(v22, 1))
  {
    uint64_t v35 = result;
    *(void *)(result + 48) = v22 + 1;
    swift_bridgeObjectRetain();
    unint64_t v36 = sub_25C25EA44(v35);
    return sub_25C2519D8(v36, v17, (uint64_t)sub_25C252088, (void (*)(uint64_t, uint64_t, void, uint64_t, uint64_t *))sub_25C251DA0);
  }
  __break(1u);
  return result;
}

uint64_t AchievementEnvironmentCache.makeCache(firstCompletedPlanSessionIdentifier:mostRecentCompletedPlanSessionIdentifier:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v44 = (uint8_t *)a1;
  uint64_t v45 = a3;
  uint64_t v41 = a5;
  uint64_t v43 = sub_25C274390();
  uint64_t v7 = *(void *)(v43 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v43);
  uint64_t v38 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v42 = (char *)&v37 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF28);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v40 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25C274840();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  id v46 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v37 - v17;
  sub_25C274720();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v19 = sub_25C274830();
  os_log_type_t v20 = sub_25C274B50();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v47 = v14;
  uint64_t v48 = v13;
  if (v21)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v50 = v23;
    *(_DWORD *)uint64_t v22 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_25C24A1D8((uint64_t)v44, a2, &v50);
    uint64_t v37 = v7;
    sub_25C274BE0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_25C24A1D8(v45, a4, &v50);
    uint64_t v7 = v37;
    sub_25C274BE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C23E000, v19, v20, "Updating existing cache with firstCompletedPlanSessionIdentifier: %s and mostRecentCompletedPlanSessionIdentifier: %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261183790](v23, -1, -1);
    MEMORY[0x261183790](v22, -1, -1);

    uint64_t v39 = *(void (**)(char *, uint64_t))(v47 + 8);
    v39(v18, v48);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v39 = *(void (**)(char *, uint64_t))(v14 + 8);
    v39(v18, v13);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25C274330();
  sub_25C274300();
  sub_25C274310();
  sub_25C274370();
  sub_25C274320();
  sub_25C274340();
  uint64_t v24 = v41;
  sub_25C274350();
  uint64_t v25 = v46;
  sub_25C274720();
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v27 = v42;
  uint64_t v28 = v43;
  v26(v42, v24, v43);
  unint64_t v29 = sub_25C274830();
  os_log_type_t v30 = sub_25C274B50();
  if (os_log_type_enabled(v29, v30))
  {
    os_log_type_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v50 = v45;
    *(_DWORD *)os_log_type_t v31 = 136315138;
    uint64_t v44 = v31 + 4;
    v26(v38, (uint64_t)v27, v28);
    uint64_t v32 = sub_25C274920();
    uint64_t v49 = sub_25C24A1D8(v32, v33, &v50);
    sub_25C274BE0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v27, v28);
    _os_log_impl(&dword_25C23E000, v29, v30, "New cache after updating plan session identifiers: %s", v31, 0xCu);
    uint64_t v34 = v45;
    swift_arrayDestroy();
    MEMORY[0x261183790](v34, -1, -1);
    MEMORY[0x261183790](v31, -1, -1);

    uint64_t v35 = v46;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v27, v28);

    uint64_t v35 = v25;
  }
  return ((uint64_t (*)(char *, uint64_t))v39)(v35, v48);
}

id AchievementEnvironmentCache.updatingWeeklyStreak(with:)@<X0>(NSObject *a1@<X0>, uint64_t a2@<X8>)
{
  os_log_t v88 = a1;
  uint64_t v98 = a2;
  uint64_t v3 = sub_25C274840();
  uint64_t v100 = *(void *)(v3 - 8);
  uint64_t v101 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v93 = (char *)&v85 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v94 = (char *)&v85 - v9;
  uint64_t v10 = sub_25C273E20();
  uint64_t v89 = *(void *)(v10 - 8);
  uint64_t v90 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25C273CF0();
  uint64_t v91 = *(void *)(v13 - 8);
  uint64_t v92 = v13;
  MEMORY[0x270FA5388](v13);
  char v96 = (char *)&v85 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF28);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v87 = (char *)&v85 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v85 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF68);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_25C273D80();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v85 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  os_log_type_t v30 = (char *)&v85 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v95 = (char *)&v85 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v97 = (char *)&v85 - v33;
  uint64_t v99 = v2;
  sub_25C274300();
  uint64_t v34 = sub_25C274100();
  uint64_t v35 = *(void *)(v34 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v19, 1, v34) == 1)
  {
    sub_25C24AC68((uint64_t)v19, &qword_26B34FF28);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v22, 1, 1, v23);
LABEL_4:
    sub_25C24AC68((uint64_t)v22, &qword_26B34FF68);
    sub_25C274720();
    unint64_t v36 = sub_25C274830();
    os_log_type_t v37 = sub_25C274B50();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl(&dword_25C23E000, v36, v37, "Checking if the current streak is broken but the current streak is nil, returning existing environment cache", v38, 2u);
      MEMORY[0x261183790](v38, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v100 + 8))(v6, v101);
    goto LABEL_7;
  }
  uint64_t v86 = v35;
  sub_25C2740D0();
  (*(void (**)(char *, uint64_t))(v86 + 8))(v19, v34);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v22, 0, 1, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1) {
    goto LABEL_4;
  }
  uint64_t v85 = v34;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v97, v22, v23);
  uint64_t v41 = self;
  id result = objc_msgSend(v41, sel_hk_gregorianCalendar);
  if (result)
  {
    uint64_t v42 = result;
    uint64_t v43 = *MEMORY[0x263F0AC98];
    uint64_t v44 = (void *)sub_25C273D50();
    id v45 = objc_msgSend(v42, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v43, v44, 0);

    id v46 = v95;
    sub_25C273D60();

    id v47 = objc_msgSend(v41, sel_currentCalendar);
    sub_25C273DD0();

    __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FFD0);
    uint64_t v48 = sub_25C273E10();
    uint64_t v49 = *(void *)(v48 - 8);
    unint64_t v50 = (*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    uint64_t v51 = swift_allocObject();
    *(_OWORD *)(v51 + 16) = xmmword_25C275A50;
    (*(void (**)(unint64_t, void, uint64_t))(v49 + 104))(v51 + v50, *MEMORY[0x263F07870], v48);
    sub_25C2520A0(v51);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v52 = v97;
    sub_25C273DB0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v89 + 8))(v12, v90);
    uint64_t v53 = v94;
    sub_25C274720();
    unint64_t v54 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
    v54(v30, v52, v23);
    v54(v27, v46, v23);
    uint64_t v55 = sub_25C274830();
    os_log_type_t v56 = sub_25C274B50();
    int v57 = v56;
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v58 = swift_slowAlloc();
      LODWORD(v89) = v57;
      uint64_t v59 = v58;
      uint64_t v90 = swift_slowAlloc();
      v103[0] = v90;
      *(_DWORD *)uint64_t v59 = 136315394;
      sub_25C252710(&qword_26A598FF0, MEMORY[0x263F07490]);
      uint64_t v60 = sub_25C274E40();
      uint64_t v102 = sub_25C24A1D8(v60, v61, v103);
      os_log_t v88 = v55;
      sub_25C274BE0();
      swift_bridgeObjectRelease();
      unint64_t v62 = *(void (**)(char *, uint64_t))(v24 + 8);
      v62(v30, v23);
      *(_WORD *)(v59 + 12) = 2080;
      uint64_t v63 = sub_25C274E40();
      uint64_t v102 = sub_25C24A1D8(v63, v64, v103);
      uint64_t v65 = v96;
      sub_25C274BE0();
      swift_bridgeObjectRelease();
      v62(v27, v23);
      uint64_t v66 = v62;
      os_log_t v67 = v88;
      _os_log_impl(&dword_25C23E000, v88, (os_log_type_t)v89, "Determining the difference between firstWeekdayOfStreakEnd (%s), and currentStartOfWeek (%s)", (uint8_t *)v59, 0x16u);
      uint64_t v68 = v90;
      swift_arrayDestroy();
      MEMORY[0x261183790](v68, -1, -1);
      MEMORY[0x261183790](v59, -1, -1);

      uint64_t v69 = *(void (**)(char *, uint64_t))(v100 + 8);
      v69(v94, v101);
      uint64_t v70 = v93;
    }
    else
    {
      uint64_t v66 = *(void (**)(char *, uint64_t))(v24 + 8);
      v66(v30, v23);
      v66(v27, v23);

      uint64_t v69 = *(void (**)(char *, uint64_t))(v100 + 8);
      v69(v53, v101);
      uint64_t v70 = v93;
      uint64_t v65 = v96;
    }
    uint64_t v71 = sub_25C273CE0();
    uint64_t v72 = v97;
    if ((v73 & 1) != 0 || (uint64_t v74 = v71, v71 < 14))
    {
      (*(void (**)(char *, uint64_t))(v91 + 8))(v65, v92);
      v66(v95, v23);
      v66(v72, v23);
LABEL_7:
      uint64_t v39 = sub_25C274390();
      return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 16))(v98, v99, v39);
    }
    uint64_t v94 = (char *)v66;
    sub_25C274720();
    uint64_t v75 = sub_25C274830();
    os_log_type_t v76 = sub_25C274B50();
    if (os_log_type_enabled(v75, v76))
    {
      uint64_t v77 = (uint8_t *)swift_slowAlloc();
      uint64_t v78 = swift_slowAlloc();
      uint64_t v102 = v74;
      v103[0] = v78;
      *(_DWORD *)uint64_t v77 = 136315138;
      uint64_t v90 = (uint64_t)(v77 + 4);
      uint64_t v79 = sub_25C274E40();
      uint64_t v102 = sub_25C24A1D8(v79, v80, v103);
      uint64_t v72 = v97;
      sub_25C274BE0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v75, v76, "Number of days since the first weekday of the streak end is %s, updating weeklyStreak to nil", v77, 0xCu);
      swift_arrayDestroy();
      uint64_t v81 = v78;
      uint64_t v65 = v96;
      MEMORY[0x261183790](v81, -1, -1);
      MEMORY[0x261183790](v77, -1, -1);

      uint64_t v82 = v93;
    }
    else
    {

      uint64_t v82 = v70;
    }
    v69(v82, v101);
    uint64_t v83 = (uint64_t)v87;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v86 + 56))(v87, 1, 1, v85);
    sub_25C25160C(v83, v98);
    sub_25C24AC68(v83, &qword_26B34FF28);
    (*(void (**)(char *, uint64_t))(v91 + 8))(v65, v92);
    uint64_t v84 = (uint64_t (*)(char *, uint64_t))v94;
    ((void (*)(char *, uint64_t))v94)(v95, v23);
    return (id)v84(v72, v23);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25C25160C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v27 = sub_25C274390();
  uint64_t v31 = *(void *)(v27 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v27);
  uint64_t v24 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v26 = (char *)&v24 - v5;
  uint64_t v6 = sub_25C274840();
  uint64_t v29 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF28);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C274360();
  uint64_t v25 = v12;
  sub_25C274380();
  sub_25C274330();
  sub_25C251A68(a1, (uint64_t)v11);
  sub_25C274310();
  sub_25C274370();
  sub_25C274320();
  sub_25C274340();
  uint64_t v13 = v27;
  uint64_t v14 = v8;
  sub_25C274350();
  sub_25C274720();
  uint64_t v15 = *(void (**)(void))(v31 + 16);
  uint64_t v16 = v26;
  v15();
  uint64_t v17 = sub_25C274830();
  os_log_type_t v18 = sub_25C274B50();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v33 = v28;
    *(_DWORD *)uint64_t v19 = 136315138;
    uint64_t v25 = v19 + 4;
    ((void (*)(char *, char *, uint64_t))v15)(v24, v16, v13);
    uint64_t v20 = sub_25C274920();
    uint64_t v32 = sub_25C24A1D8(v20, v21, &v33);
    sub_25C274BE0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v13);
    _os_log_impl(&dword_25C23E000, v17, v18, "[AchievementEnvironmentCache] New cache after updating weekly streak: %s", v19, 0xCu);
    uint64_t v22 = v28;
    swift_arrayDestroy();
    MEMORY[0x261183790](v22, -1, -1);
    MEMORY[0x261183790](v19, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v13);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v14, v30);
}

uint64_t sub_25C2519D8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, void, uint64_t, uint64_t *))
{
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = a2;
  a4(a1, a3, 0, isUniquelyReferenced_nonNull_native, &v12);
  uint64_t v10 = v12;
  swift_bridgeObjectRelease();
  if (v4) {
    swift_bridgeObjectRelease();
  }
  return v10;
}

uint64_t sub_25C251A68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C251AD0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_25C25A890();
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = v9;
  uint64_t v13 = (void *)*a5;
  unint64_t v15 = sub_25C26150C(v7, v8);
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
      uint64_t v22 = (void *)*a5;
      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_25C26A404();
      uint64_t v22 = (void *)*a5;
      if (v19) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    uint64_t v23 = (uint64_t *)(v22[6] + 16 * v15);
    *uint64_t v23 = v10;
    v23[1] = v11;
    *(void *)(v22[7] + 8 * v15) = v12;
    uint64_t v24 = v22[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    void v22[2] = v26;
LABEL_13:
    uint64_t v27 = sub_25C25A890();
    if (v28)
    {
      uint64_t v30 = v27;
      uint64_t v31 = v28;
      uint64_t v32 = v29;
      do
      {
        uint64_t v35 = (void *)*a5;
        unint64_t v37 = sub_25C26150C(v30, v31);
        uint64_t v38 = v35[2];
        BOOL v39 = (v36 & 1) == 0;
        uint64_t v40 = v38 + v39;
        if (__OFADD__(v38, v39)) {
          goto LABEL_25;
        }
        char v41 = v36;
        if (v35[3] < v40)
        {
          sub_25C25F918(v40, 1);
          unint64_t v42 = sub_25C26150C(v30, v31);
          if ((v41 & 1) != (v43 & 1)) {
            goto LABEL_27;
          }
          unint64_t v37 = v42;
        }
        uint64_t v44 = (void *)*a5;
        if (v41)
        {
          swift_bridgeObjectRelease();
          *(void *)(v44[7] + 8 * v37) = v32;
        }
        else
        {
          v44[(v37 >> 6) + 8] |= 1 << v37;
          id v45 = (uint64_t *)(v44[6] + 16 * v37);
          uint64_t *v45 = v30;
          v45[1] = v31;
          *(void *)(v44[7] + 8 * v37) = v32;
          uint64_t v46 = v44[2];
          BOOL v25 = __OFADD__(v46, 1);
          uint64_t v47 = v46 + 1;
          if (v25) {
            goto LABEL_26;
          }
          v44[2] = v47;
        }
        uint64_t v30 = sub_25C25A890();
        uint64_t v31 = v33;
        uint64_t v32 = v34;
      }
      while (v33);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_25C24AC60();
    return swift_release();
  }
  sub_25C25F918(v18, a4 & 1);
  unint64_t v20 = sub_25C26150C(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    unint64_t v15 = v20;
    uint64_t v22 = (void *)*a5;
    if ((v19 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    *(void *)(v22[7] + 8 * v15) = v12;
    goto LABEL_13;
  }
LABEL_27:
  uint64_t result = sub_25C274E90();
  __break(1u);
  return result;
}

uint64_t sub_25C251DA0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_25C25AA18();
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = v9;
  uint64_t v13 = (void *)*a5;
  unint64_t v15 = sub_25C26150C(v7, v8);
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
      uint64_t v22 = (void *)*a5;
      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_25C26A5B4();
      uint64_t v22 = (void *)*a5;
      if (v19) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    uint64_t v23 = (uint64_t *)(v22[6] + 16 * v15);
    *uint64_t v23 = v10;
    v23[1] = v11;
    *(void *)(v22[7] + 8 * v15) = v12;
    uint64_t v24 = v22[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    void v22[2] = v26;
LABEL_13:
    uint64_t v27 = sub_25C25AA18();
    if (v28)
    {
      uint64_t v30 = v27;
      uint64_t v31 = v28;
      uint64_t v32 = v29;
      do
      {
        uint64_t v35 = (void *)*a5;
        unint64_t v37 = sub_25C26150C(v30, v31);
        uint64_t v38 = v35[2];
        BOOL v39 = (v36 & 1) == 0;
        uint64_t v40 = v38 + v39;
        if (__OFADD__(v38, v39)) {
          goto LABEL_25;
        }
        char v41 = v36;
        if (v35[3] < v40)
        {
          sub_25C25FC20(v40, 1);
          unint64_t v42 = sub_25C26150C(v30, v31);
          if ((v41 & 1) != (v43 & 1)) {
            goto LABEL_27;
          }
          unint64_t v37 = v42;
        }
        uint64_t v44 = (void *)*a5;
        if (v41)
        {
          swift_bridgeObjectRelease();
          *(void *)(v44[7] + 8 * v37) = v32;
        }
        else
        {
          v44[(v37 >> 6) + 8] |= 1 << v37;
          id v45 = (uint64_t *)(v44[6] + 16 * v37);
          uint64_t *v45 = v30;
          v45[1] = v31;
          *(void *)(v44[7] + 8 * v37) = v32;
          uint64_t v46 = v44[2];
          BOOL v25 = __OFADD__(v46, 1);
          uint64_t v47 = v46 + 1;
          if (v25) {
            goto LABEL_26;
          }
          v44[2] = v47;
        }
        uint64_t v30 = sub_25C25AA18();
        uint64_t v31 = v33;
        uint64_t v32 = v34;
      }
      while (v33);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_25C24AC60();
    return swift_release();
  }
  sub_25C25FC20(v18, a4 & 1);
  unint64_t v20 = sub_25C26150C(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    unint64_t v15 = v20;
    uint64_t v22 = (void *)*a5;
    if ((v19 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    *(void *)(v22[7] + 8 * v15) = v12;
    goto LABEL_13;
  }
LABEL_27:
  uint64_t result = sub_25C274E90();
  __break(1u);
  return result;
}

uint64_t sub_25C252070@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C252088@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C2520A0(uint64_t a1)
{
  uint64_t v2 = sub_25C273E10();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FFB0);
    uint64_t v9 = sub_25C274CF0();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_25C252710(&qword_26B34FF70, MEMORY[0x263F07908]);
      uint64_t v16 = sub_25C2748C0();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_25C252710(&qword_26A598FF8, MEMORY[0x263F07908]);
          char v23 = sub_25C2748D0();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        BOOL v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_25C2523B8(int a1, int a2)
{
  int v30 = a2;
  int v31 = a1;
  uint64_t v3 = sub_25C274390();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25C274840();
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v29 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v28 - v10;
  sub_25C274720();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, v3);
  uint64_t v12 = sub_25C274830();
  os_log_type_t v13 = sub_25C274B50();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    v28[0] = v7;
    unint64_t v15 = v14;
    v28[1] = v2;
    *(_DWORD *)uint64_t v14 = 134217984;
    uint64_t v16 = sub_25C274320();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v33 = v16;
    sub_25C274BE0();
    _os_log_impl(&dword_25C23E000, v12, v13, "[AchievementEnvironmentCache] Total number of workouts %ld", v15, 0xCu);
    uint64_t v17 = v15;
    uint64_t v7 = v28[0];
    MEMORY[0x261183790](v17, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  unint64_t v18 = *(void (**)(char *, uint64_t))(v32 + 8);
  v18(v11, v7);
  if (v31 & 1) != 0 && (v30)
  {
    uint64_t v19 = sub_25C274320();
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t result = v19 + 1;
    if (!v20) {
      return result;
    }
    __break(1u);
  }
  uint64_t v22 = v29;
  sub_25C274720();
  char v23 = sub_25C274830();
  os_log_type_t v24 = sub_25C274B50();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = v7;
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl(&dword_25C23E000, v23, v24, "[AchievementEnvironmentCache] Session does not meet completion/duration thresholds, returning current count", v26, 2u);
    uint64_t v27 = v26;
    uint64_t v7 = v25;
    MEMORY[0x261183790](v27, -1, -1);
  }

  v18(v22, v7);
  return sub_25C274320();
}

uint64_t sub_25C252710(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t static AchievementWeeklyStreakNotification.makeNotification(with:notificationRecord:)(uint64_t a1, uint64_t a2)
{
  uint64_t v172 = a2;
  uint64_t v158 = sub_25C273E20();
  uint64_t v157 = *(void *)(v158 - 8);
  MEMORY[0x270FA5388](v158);
  v156 = (char *)&v148 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = sub_25C273CF0();
  uint64_t v159 = *(void *)(v160 - 8);
  MEMORY[0x270FA5388](v160);
  v169 = (char *)&v148 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25C273D80();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v182 = v6;
  uint64_t v183 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v168 = (char *)&v148 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v162 = (char *)&v148 - v11;
  MEMORY[0x270FA5388](v10);
  os_log_type_t v13 = (char *)&v148 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF28);
  MEMORY[0x270FA5388](v14 - 8);
  v174 = (char *)&v148 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25C274100();
  uint64_t v180 = *(void *)(v16 - 8);
  uint64_t v181 = v16;
  MEMORY[0x270FA5388](v16);
  v176 = (char *)&v148 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B34FF90);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v164 = (uint64_t)&v148 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v178 = (uint64_t)&v148 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v171 = (uint64_t)&v148 - v23;
  uint64_t v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF68);
  uint64_t v24 = MEMORY[0x270FA5388](v165);
  uint64_t v166 = (uint64_t)&v148 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v167 = (uint64_t)&v148 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v179 = (char *)&v148 - v29;
  MEMORY[0x270FA5388](v28);
  v186 = (char *)&v148 - v30;
  uint64_t v31 = sub_25C274390();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  v163 = (char *)&v148 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  uint64_t v36 = (char *)&v148 - v35;
  uint64_t v185 = sub_25C274840();
  uint64_t v187 = *(void *)(v185 - 8);
  uint64_t v37 = MEMORY[0x270FA5388](v185);
  v155 = (char *)&v148 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  v154 = (char *)&v148 - v40;
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  v152 = (char *)&v148 - v42;
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  v153 = (char *)&v148 - v44;
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  v151 = (char *)&v148 - v46;
  uint64_t v47 = MEMORY[0x270FA5388](v45);
  v173 = (char *)&v148 - v48;
  uint64_t v49 = MEMORY[0x270FA5388](v47);
  v177 = (char *)&v148 - v50;
  MEMORY[0x270FA5388](v49);
  uint64_t v52 = (char *)&v148 - v51;
  sub_25C274720();
  uint64_t v184 = v32;
  uint64_t v53 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 16);
  unint64_t v54 = v36;
  uint64_t v55 = v36;
  uint64_t v175 = a1;
  uint64_t v56 = v31;
  v53(v55, a1, v31);
  int v57 = sub_25C274830();
  os_log_type_t v58 = sub_25C274B50();
  BOOL v59 = os_log_type_enabled(v57, v58);
  uint64_t v170 = v2;
  v161 = v13;
  if (v59)
  {
    uint64_t v60 = (uint8_t *)swift_slowAlloc();
    uint64_t v150 = swift_slowAlloc();
    uint64_t v189 = v150;
    *(_DWORD *)uint64_t v60 = 136315138;
    v148 = v60 + 4;
    os_log_t v149 = v57;
    v53(v163, (uint64_t)v54, v56);
    uint64_t v61 = sub_25C274920();
    uint64_t v188 = sub_25C24A1D8(v61, v62, &v189);
    sub_25C274BE0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v184 + 8))(v54, v56);
    os_log_t v63 = v149;
    _os_log_impl(&dword_25C23E000, v149, v58, "Evaluating weekly streak notification with environment cache: %s", v60, 0xCu);
    uint64_t v64 = v150;
    swift_arrayDestroy();
    MEMORY[0x261183790](v64, -1, -1);
    MEMORY[0x261183790](v60, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v184 + 8))(v54, v56);
  }
  uint64_t v184 = *(void *)(v187 + 8);
  ((void (*)(char *, uint64_t))v184)(v52, v185);
  uint64_t v65 = v171;
  uint64_t v66 = v172;
  sub_25C253D1C(v172, v171, (uint64_t *)&unk_26B34FF90);
  uint64_t v67 = sub_25C2743C0();
  uint64_t v68 = *(void *)(v67 - 8);
  uint64_t v69 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v68 + 48);
  int v70 = v69(v65, 1, v67);
  uint64_t v71 = (uint64_t)v186;
  if (v70 == 1)
  {
    sub_25C24AC68(v65, (uint64_t *)&unk_26B34FF90);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v183 + 56))(v71, 1, 1, v182);
  }
  else
  {
    sub_25C2743A0();
    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v65, v67);
  }
  uint64_t v73 = v178;
  uint64_t v72 = (uint64_t)v179;
  uint64_t v74 = v177;
  sub_25C274720();
  sub_25C253D1C(v66, v73, (uint64_t *)&unk_26B34FF90);
  uint64_t v75 = v71;
  sub_25C253D1C(v71, v72, &qword_26B34FF68);
  os_log_type_t v76 = sub_25C274830();
  LODWORD(v172) = sub_25C274B50();
  if (os_log_type_enabled(v76, (os_log_type_t)v172))
  {
    uint64_t v77 = swift_slowAlloc();
    uint64_t v78 = swift_slowAlloc();
    uint64_t v189 = v78;
    *(_DWORD *)uint64_t v77 = 136315394;
    uint64_t v79 = v73;
    uint64_t v80 = v164;
    sub_25C253D1C(v79, v164, (uint64_t *)&unk_26B34FF90);
    if (v69(v80, 1, v67) == 1)
    {
      sub_25C24AC68(v80, (uint64_t *)&unk_26B34FF90);
      uint64_t v81 = 0;
      unint64_t v82 = 0xE000000000000000;
    }
    else
    {
      uint64_t v81 = sub_25C2743B0();
      unint64_t v82 = v86;
      (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v80, v67);
    }
    uint64_t v84 = v182;
    uint64_t v188 = sub_25C24A1D8(v81, v82, &v189);
    sub_25C274BE0();
    swift_bridgeObjectRelease();
    sub_25C24AC68(v178, (uint64_t *)&unk_26B34FF90);
    *(_WORD *)(v77 + 12) = 2080;
    uint64_t v87 = (uint64_t)v179;
    uint64_t v88 = sub_25C274BB0();
    uint64_t v188 = sub_25C24A1D8(v88, v89, &v189);
    sub_25C274BE0();
    swift_bridgeObjectRelease();
    sub_25C24AC68(v87, &qword_26B34FF68);
    _os_log_impl(&dword_25C23E000, v76, (os_log_type_t)v172, "Creating achievement notification for %s with previousPresentationDate: %s", (uint8_t *)v77, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261183790](v78, -1, -1);
    MEMORY[0x261183790](v77, -1, -1);

    uint64_t v83 = v185;
    ((void (*)(char *, uint64_t))v184)(v177, v185);
    uint64_t v85 = (uint64_t)v186;
  }
  else
  {
    sub_25C24AC68(v73, (uint64_t *)&unk_26B34FF90);
    sub_25C24AC68(v72, &qword_26B34FF68);

    uint64_t v83 = v185;
    ((void (*)(char *, uint64_t))v184)(v74, v185);
    uint64_t v84 = v182;
    uint64_t v85 = v75;
  }
  uint64_t v90 = (uint64_t)v174;
  sub_25C274300();
  uint64_t v92 = v180;
  uint64_t v91 = v181;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v180 + 48))(v90, 1, v181) == 1)
  {
    sub_25C24AC68(v90, &qword_26B34FF28);
    uint64_t v93 = v166;
    sub_25C253D1C(v85, v166, &qword_26B34FF68);
    uint64_t v94 = v183;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v183 + 48))(v93, 1, v84) == 1)
    {
      uint64_t v95 = v83;
      sub_25C24AC68(v93, &qword_26B34FF68);
      char v96 = v155;
      sub_25C274720();
      uint64_t v97 = sub_25C274830();
      os_log_type_t v98 = sub_25C274B50();
      if (os_log_type_enabled(v97, v98))
      {
        uint64_t v99 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v99 = 0;
        _os_log_impl(&dword_25C23E000, v97, v98, "No streak and no previous presentation date, returning goForIt notification", v99, 2u);
        MEMORY[0x261183790](v99, -1, -1);
      }

      ((void (*)(char *, uint64_t))v184)(v96, v95);
      uint64_t v100 = 0;
LABEL_43:
      uint64_t v136 = (uint64_t)v186;
LABEL_44:
      sub_25C24AC68(v136, &qword_26B34FF68);
      return v100;
    }
    LODWORD(v182) = 1;
    (*(void (**)(char *, uint64_t, uint64_t))(v94 + 32))(v168, v93, v84);
    id v108 = objc_msgSend(self, sel_currentCalendar);
    uint64_t v109 = v156;
    sub_25C273DD0();

    __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FFD0);
    uint64_t v110 = v94;
    uint64_t v111 = sub_25C273E10();
    uint64_t v112 = *(void *)(v111 - 8);
    unint64_t v113 = (*(unsigned __int8 *)(v112 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v112 + 80);
    uint64_t v114 = swift_allocObject();
    *(_OWORD *)(v114 + 16) = xmmword_25C275A50;
    (*(void (**)(unint64_t, void, uint64_t))(v112 + 104))(v114 + v113, *MEMORY[0x263F07870], v111);
    sub_25C2520A0(v114);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v115 = v162;
    sub_25C273D70();
    sub_25C273DB0();
    swift_bridgeObjectRelease();
    uint64_t v116 = *(void (**)(char *, uint64_t))(v110 + 8);
    v116(v115, v84);
    (*(void (**)(char *, uint64_t))(v157 + 8))(v109, v158);
    uint64_t v117 = sub_25C273CE0();
    if (v118)
    {
      v137 = v154;
      sub_25C274720();
      v138 = sub_25C274830();
      os_log_type_t v139 = sub_25C274B50();
      if (os_log_type_enabled(v138, v139))
      {
        v140 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v140 = 0;
        _os_log_impl(&dword_25C23E000, v138, v139, "Failed to determine the date interval since the most recent achievement notification", v140, 2u);
        MEMORY[0x261183790](v140, -1, -1);
      }

      ((void (*)(char *, uint64_t))v184)(v137, v185);
    }
    else
    {
      uint64_t v119 = v117;
      sub_25C2746D0();
      if (v119 >= sub_25C2746C0())
      {
        v120 = v152;
        sub_25C274720();
        uint64_t v121 = sub_25C274830();
        os_log_type_t v122 = sub_25C274B50();
        if (os_log_type_enabled(v121, v122))
        {
          uint64_t v123 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v123 = 0;
          _os_log_impl(&dword_25C23E000, v121, v122, "Last presentation date was >=90 days ago, returning goForIt notification", v123, 2u);
          MEMORY[0x261183790](v123, -1, -1);
        }

        ((void (*)(char *, uint64_t))v184)(v120, v185);
        (*(void (**)(char *, uint64_t))(v159 + 8))(v169, v160);
        v116(v168, v84);
        uint64_t v100 = 0;
        goto LABEL_43;
      }
    }
    uint64_t v100 = sub_25C273EE0();
    sub_25C24D820();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v100 - 8) + 104))(v141, *MEMORY[0x263F69888], v100);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v159 + 8))(v169, v160);
    v116(v168, v84);
    goto LABEL_38;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v92 + 32))(v176, v90, v91);
  unsigned __int8 v101 = AchievementWeeklyStreak.earnedThisWeek.getter();
  sub_25C274720();
  uint64_t v102 = sub_25C274830();
  os_log_type_t v103 = sub_25C274B50();
  if (os_log_type_enabled(v102, v103))
  {
    uint64_t v104 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v104 = 67109120;
    LODWORD(v189) = (v101 & 1) == 0;
    sub_25C274BE0();
    _os_log_impl(&dword_25C23E000, v102, v103, "Current streak extendable: %{BOOL}d", v104, 8u);
    MEMORY[0x261183790](v104, -1, -1);
  }

  ((void (*)(char *, uint64_t))v184)(v173, v83);
  uint64_t v105 = v167;
  sub_25C253D1C(v85, v167, &qword_26B34FF68);
  uint64_t v106 = v183;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v183 + 48))(v105, 1, v84) != 1)
  {
    uint64_t v124 = (uint64_t)v161;
    (*(void (**)(char *, uint64_t, uint64_t))(v106 + 32))(v161, v105, v84);
    if ((v101 & 1) == 0)
    {
      uint64_t v125 = v162;
      sub_25C273D70();
      unsigned __int8 v126 = Date.isSameWeek(as:)(v124);
      uint64_t v106 = v183;
      unsigned __int8 v127 = v126;
      v128 = *(void (**)(char *, uint64_t))(v183 + 8);
      v128(v125, v84);
      if ((v127 & 1) == 0)
      {
        v142 = v151;
        sub_25C274720();
        v143 = sub_25C274830();
        os_log_type_t v144 = sub_25C274B50();
        if (os_log_type_enabled(v143, v144))
        {
          v145 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v145 = 0;
          _os_log_impl(&dword_25C23E000, v143, v144, "Streak was extendable with no previous presentation date this week, returning maintain streak notification", v145, 2u);
          MEMORY[0x261183790](v145, -1, -1);
        }

        ((void (*)(char *, uint64_t))v184)(v142, v185);
        v146 = v176;
        uint64_t v100 = sub_25C2740F0();
        v128(v161, v84);
        (*(void (**)(char *, uint64_t))(v180 + 8))(v146, v181);
        goto LABEL_43;
      }
    }
    uint64_t v100 = sub_25C273EE0();
    sub_25C24D820();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v100 - 8) + 104))(v129, *MEMORY[0x263F69888], v100);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v124, v84);
    (*(void (**)(char *, uint64_t))(v180 + 8))(v176, v181);
LABEL_38:
    uint64_t v85 = (uint64_t)v186;
    goto LABEL_39;
  }
  sub_25C24AC68(v105, &qword_26B34FF68);
  if ((v101 & 1) == 0)
  {
    uint64_t v130 = v83;
    v131 = v153;
    sub_25C274720();
    v132 = sub_25C274830();
    os_log_type_t v133 = sub_25C274B50();
    if (os_log_type_enabled(v132, v133))
    {
      v134 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v134 = 0;
      _os_log_impl(&dword_25C23E000, v132, v133, "Streak was extendable with no previous presentation date, returning maintain streak notification", v134, 2u);
      MEMORY[0x261183790](v134, -1, -1);
    }

    ((void (*)(char *, uint64_t))v184)(v131, v130);
    v135 = v176;
    uint64_t v100 = sub_25C2740F0();
    (*(void (**)(char *, uint64_t))(v180 + 8))(v135, v181);
    uint64_t v136 = v85;
    goto LABEL_44;
  }
  uint64_t v100 = sub_25C273EE0();
  sub_25C24D820();
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v100 - 8) + 104))(v107, *MEMORY[0x263F69888], v100);
  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v180 + 8))(v176, v181);
LABEL_39:
  sub_25C24AC68(v85, &qword_26B34FF68);
  return v100;
}

uint64_t sub_25C253D1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t static RequestCoalescerError.== infix(_:_:)()
{
  return 1;
}

uint64_t RequestCoalescerError.hash(into:)()
{
  return sub_25C274F00();
}

uint64_t RequestCoalescerError.hashValue.getter()
{
  return sub_25C274F10();
}

unint64_t sub_25C253DF8()
{
  unint64_t result = qword_26A599010;
  if (!qword_26A599010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A599010);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for RequestCoalescerError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25C253EECLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RequestCoalescerError()
{
  return &type metadata for RequestCoalescerError;
}

uint64_t sub_25C253F24()
{
  uint64_t v0 = sub_25C273D30();
  __swift_allocate_value_buffer(v0, qword_26B350520);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B350520);
  return sub_25C273D00();
}

id sub_25C253F88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v47 = a1;
  uint64_t v3 = sub_25C273D30();
  uint64_t v48 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v45 = (char *)&v45 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v46 = (char *)&v45 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  os_log_type_t v13 = (char *)&v45 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v45 - v14;
  id result = objc_msgSend(v1, sel_uniqueName);
  if (!result)
  {
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v17 = result;
  uint64_t v18 = sub_25C274910();
  uint64_t v20 = v19;

  uint64_t v51 = v18;
  uint64_t v52 = v20;
  uint64_t v49 = 45;
  unint64_t v50 = 0xE100000000000000;
  sub_25C249214();
  uint64_t v21 = (void *)sub_25C274C00();
  swift_bridgeObjectRelease();
  if (!v21[2])
  {
    swift_bridgeObjectRelease();
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 56))(v47, 1, 1, v3);
  }
  uint64_t v23 = v21[4];
  uint64_t v22 = v21[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v23 == 0xD00000000000001CLL && v22 == 0x800000025C276F70
    || (sub_25C274E70() & 1) != 0
    || v23 == 0xD00000000000001BLL && v22 == 0x800000025C276F90
    || (sub_25C274E70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v24 = v48;
    if (qword_26B34FFA0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v3, (uint64_t)qword_26B350520);
    sub_25C273D20();
    sub_25C273D20();
    uint64_t v25 = *(void (**)(char *, uint64_t))(v24 + 8);
    v25(v13, v3);
    id result = objc_msgSend(v2, sel_uniqueName);
    if (result)
    {
      uint64_t v26 = result;
      sub_25C274910();

      uint64_t v27 = v47;
      sub_25C273D20();
      swift_bridgeObjectRelease();
      v25(v15, v3);
      return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(v27, 0, 1, v3);
    }
    goto LABEL_33;
  }
  if (v23 == 0xD000000000000027 && v22 == 0x800000025C276CD0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v28 = sub_25C274E70();
    swift_bridgeObjectRelease();
    if ((v28 & 1) == 0)
    {
      if (qword_26B34FFA0 != -1) {
        swift_once();
      }
      uint64_t v39 = __swift_project_value_buffer(v3, (uint64_t)qword_26B350520);
      uint64_t v40 = v48;
      (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v6, v39, v3);
      id result = objc_msgSend(v2, sel_uniqueName);
      if (result)
      {
        uint64_t v41 = result;
        sub_25C274910();

        uint64_t v42 = v45;
        sub_25C273D20();
        swift_bridgeObjectRelease();
        uint64_t v43 = *(void (**)(char *, uint64_t))(v40 + 8);
        v43(v6, v3);
        uint64_t v44 = v47;
        sub_25C273D20();
        v43(v42, v3);
        return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v44, 0, 1, v3);
      }
      goto LABEL_35;
    }
  }
  id result = objc_msgSend(v2, sel_uniqueName);
  if (!result)
  {
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    return result;
  }
  uint64_t v29 = result;
  uint64_t v30 = sub_25C274910();
  uint64_t v32 = v31;

  uint64_t v51 = v30;
  uint64_t v52 = v32;
  uint64_t v49 = 45;
  unint64_t v50 = 0xE100000000000000;
  uint64_t v33 = (void *)sub_25C274C00();
  swift_bridgeObjectRelease();
  if (v33[2] >= 3uLL)
  {
    uint64_t v34 = v33[5];
    uint64_t v51 = v33[4];
    uint64_t v52 = v34;
    swift_bridgeObjectRetain();
    sub_25C274950();
    uint64_t v35 = v48;
    if (v33[2] < 3uLL)
    {
      __break(1u);
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_25C274950();
      swift_bridgeObjectRelease();
      if (qword_26B34FFA0 == -1)
      {
LABEL_24:
        __swift_project_value_buffer(v3, (uint64_t)qword_26B350520);
        uint64_t v36 = v46;
        sub_25C273D20();
        sub_25C273D20();
        uint64_t v37 = *(void (**)(char *, uint64_t))(v35 + 8);
        v37(v36, v3);
        uint64_t v38 = v47;
        sub_25C273D20();
        swift_bridgeObjectRelease();
        v37(v13, v3);
        return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v35 + 56))(v38, 0, 1, v3);
      }
    }
    swift_once();
    goto LABEL_24;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 56))(v47, 1, 1, v3);
  return (id)swift_bridgeObjectRelease();
}

id sub_25C2546F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v28 = a1;
  uint64_t v3 = sub_25C273D30();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v27 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v27 - v11;
  id result = objc_msgSend(v1, sel_uniqueName);
  if (!result)
  {
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v14 = result;
  uint64_t v15 = sub_25C274910();
  uint64_t v17 = v16;

  uint64_t v31 = v15;
  uint64_t v32 = v17;
  uint64_t v29 = 45;
  unint64_t v30 = 0xE100000000000000;
  sub_25C249214();
  uint64_t v18 = (void *)sub_25C274C00();
  swift_bridgeObjectRelease();
  if (!v18[2])
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = 1;
    uint64_t v22 = v28;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v22, v21, 1, v3);
  }
  uint64_t v20 = v18[4];
  uint64_t v19 = v18[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v20 == 0xD00000000000001CLL && v19 == 0x800000025C276F70
    || (sub_25C274E70() & 1) != 0
    || v20 == 0xD00000000000001BLL && v19 == 0x800000025C276F90
    || (sub_25C274E70() & 1) != 0
    || v20 == 0xD000000000000027 && v19 == 0x800000025C276CD0)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    if (qword_26B34FFA0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v3, (uint64_t)qword_26B350520);
    sub_25C273D20();
    uint64_t v22 = v28;
    sub_25C273D20();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);
    goto LABEL_15;
  }
  char v23 = sub_25C274E70();
  swift_bridgeObjectRelease();
  if (v23) {
    goto LABEL_12;
  }
  if (qword_26B34FFA0 != -1) {
    swift_once();
  }
  uint64_t v24 = __swift_project_value_buffer(v3, (uint64_t)qword_26B350520);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v24, v3);
  id result = objc_msgSend(v2, sel_uniqueName);
  if (result)
  {
    uint64_t v25 = result;
    sub_25C274910();

    sub_25C273D20();
    swift_bridgeObjectRelease();
    uint64_t v26 = *(void (**)(char *, uint64_t))(v4 + 8);
    v26(v7, v3);
    uint64_t v22 = v28;
    sub_25C273D20();
    v26(v10, v3);
LABEL_15:
    uint64_t v21 = 0;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v22, v21, 1, v3);
  }
LABEL_26:
  __break(1u);
  return result;
}

id sub_25C254B68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v39 = a1;
  uint64_t v3 = sub_25C273D30();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v38 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v36 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v36 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v36 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v36 - v16;
  id result = objc_msgSend(v1, sel_uniqueName);
  if (!result)
  {
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v19 = result;
  uint64_t v20 = sub_25C274910();
  uint64_t v22 = v21;

  uint64_t v42 = v20;
  uint64_t v43 = v22;
  uint64_t v40 = 45;
  unint64_t v41 = 0xE100000000000000;
  sub_25C249214();
  char v23 = (void *)sub_25C274C00();
  swift_bridgeObjectRelease();
  if (!v23[2])
  {
    swift_bridgeObjectRelease();
    uint64_t v26 = 1;
    uint64_t v27 = v39;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v27, v26, 1, v3);
  }
  uint64_t v37 = v9;
  uint64_t v25 = v23[4];
  uint64_t v24 = v23[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v25 == 0xD00000000000001CLL && v24 == 0x800000025C276F70
    || (sub_25C274E70() & 1) != 0
    || v25 == 0xD00000000000001BLL && v24 == 0x800000025C276F90
    || (sub_25C274E70() & 1) != 0
    || v25 == 0xD000000000000027 && v24 == 0x800000025C276CD0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  char v30 = sub_25C274E70();
  swift_bridgeObjectRelease();
  if (v30)
  {
LABEL_12:
    if (qword_26B34FFA0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v3, (uint64_t)qword_26B350520);
    sub_25C273D20();
    sub_25C273D20();
    uint64_t v28 = *(void (**)(char *, uint64_t))(v4 + 8);
    v28(v12, v3);
    id result = objc_msgSend(v2, sel_uniqueName);
    if (result)
    {
      uint64_t v29 = result;
      sub_25C274910();

      sub_25C273D20();
      swift_bridgeObjectRelease();
      v28(v15, v3);
      uint64_t v27 = v39;
      sub_25C273D20();
      v28(v17, v3);
LABEL_16:
      uint64_t v26 = 0;
      return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v27, v26, 1, v3);
    }
    goto LABEL_27;
  }
  if (qword_26B34FFA0 != -1) {
    swift_once();
  }
  uint64_t v31 = __swift_project_value_buffer(v3, (uint64_t)qword_26B350520);
  uint64_t v32 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v38, v31, v3);
  id result = objc_msgSend(v2, sel_uniqueName);
  uint64_t v27 = v39;
  uint64_t v33 = v37;
  if (result)
  {
    uint64_t v34 = result;
    sub_25C274910();

    sub_25C273D20();
    swift_bridgeObjectRelease();
    uint64_t v35 = *(void (**)(char *, uint64_t))(v4 + 8);
    v35(v32, v3);
    sub_25C273D20();
    v35(v33, v3);
    goto LABEL_16;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t sub_25C255178(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_25C274C60();
    uint64_t v5 = v4;
    uint64_t v6 = sub_25C274CD0();
    char v8 = MEMORY[0x261182EA0](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_3:
      sub_25C256828(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_25C255B0C(v3, v5, v2 != 0, a1);
    uint64_t v9 = v13;
    sub_25C256828(v3, v5, v2 != 0);
    return v9;
  }
  uint64_t result = sub_25C255D84(a1);
  if ((v12 & 1) == 0)
  {
    uint64_t v5 = v11;
    if (*(_DWORD *)(a1 + 36) == v11)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_25C255288(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_25C274C70();
    sub_25C256834(0, (unint64_t *)&qword_26A598FE0);
    sub_25C24AC08();
    sub_25C274B20();
    uint64_t v1 = v27;
    uint64_t v26 = v28;
    uint64_t v2 = v29;
    uint64_t v3 = v30;
    unint64_t v4 = v31;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v26 = a1 + 56;
    uint64_t v6 = ~v5;
    uint64_t v7 = -v5;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v4 = v8 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v2 = v6;
    uint64_t v3 = 0;
  }
  uint64_t v24 = v2;
  int64_t v25 = (unint64_t)(v2 + 64) >> 6;
  while (v1 < 0)
  {
    if (!sub_25C274CC0()) {
      goto LABEL_42;
    }
    sub_25C256834(0, (unint64_t *)&qword_26A598FE0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v12 = v32;
    swift_unknownObjectRelease();
    uint64_t v11 = v3;
    uint64_t v9 = v4;
    if (!v32) {
      goto LABEL_42;
    }
LABEL_33:
    id v16 = objc_msgSend(v12, sel_uniqueName, v24);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = sub_25C274910();
      uint64_t v20 = v19;
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v20 = 0;
    }
    sub_25C2746D0();
    uint64_t v21 = sub_25C2746A0();
    if (v20)
    {
      if (v18 == v21 && v20 == v22)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_42:
        sub_25C24AC60();
        return;
      }
      char v23 = sub_25C274E70();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v23) {
        goto LABEL_42;
      }
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    uint64_t v3 = v11;
    unint64_t v4 = v9;
  }
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    uint64_t v11 = v3;
LABEL_32:
    id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v12) {
      goto LABEL_42;
    }
    goto LABEL_33;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v25) {
      goto LABEL_42;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v13);
    uint64_t v11 = v3 + 1;
    if (!v14)
    {
      uint64_t v11 = v3 + 2;
      if (v3 + 2 >= v25) {
        goto LABEL_42;
      }
      unint64_t v14 = *(void *)(v26 + 8 * v11);
      if (!v14)
      {
        uint64_t v11 = v3 + 3;
        if (v3 + 3 >= v25) {
          goto LABEL_42;
        }
        unint64_t v14 = *(void *)(v26 + 8 * v11);
        if (!v14)
        {
          uint64_t v11 = v3 + 4;
          if (v3 + 4 >= v25) {
            goto LABEL_42;
          }
          unint64_t v14 = *(void *)(v26 + 8 * v11);
          if (!v14)
          {
            uint64_t v11 = v3 + 5;
            if (v3 + 5 >= v25) {
              goto LABEL_42;
            }
            unint64_t v14 = *(void *)(v26 + 8 * v11);
            if (!v14)
            {
              uint64_t v15 = v3 + 6;
              while (v25 != v15)
              {
                unint64_t v14 = *(void *)(v26 + 8 * v15++);
                if (v14)
                {
                  uint64_t v11 = v15 - 1;
                  goto LABEL_31;
                }
              }
              goto LABEL_42;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v9 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t static ACHAchievement.makeWeeklyStreakAchievement(with:environmentCache:)(uint64_t a1)
{
  sub_25C255288(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = sub_25C256170();
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F23630]), sel_initWithTemplate_relevantEarnedInstance_earnedInstanceCount_, v2, v3, v3 != 0);

    return (uint64_t)v4;
  }
  else
  {
    uint64_t v6 = sub_25C273EE0();
    sub_25C24D820();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v7, *MEMORY[0x263F69880], v6);
    return swift_willThrow();
  }
}

void *static ACHAchievement.makeAchievement(for:with:progressUpdates:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)sub_25C274840();
  uint64_t v7 = *(v6 - 1);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_25C255E0C(a3, a1, a2);
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  if (v11)
  {
    uint64_t v12 = swift_bridgeObjectRetain();
    int64_t v13 = (void *)sub_25C255178(v12);
    swift_bridgeObjectRelease();
    if (v13)
    {
      id v14 = sub_25C2563C0(a1, a2, v13);
      uint64_t v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F23630]), sel_initWithTemplate_relevantEarnedInstance_earnedInstanceCount_, v11, v14, v14 != 0);
      id v15 = objc_msgSend(v13, sel_progressQuantity);
      objc_msgSend(v6, sel_setProgress_, v15);

      id v16 = objc_msgSend(v13, sel_goalQuantity);
      objc_msgSend(v6, sel_setGoal_, v16);
    }
    else
    {
      sub_25C274720();
      swift_bridgeObjectRetain_n();
      uint64_t v19 = sub_25C274830();
      os_log_type_t v20 = sub_25C274B40();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = swift_slowAlloc();
        os_log_t v29 = v19;
        uint64_t v22 = (uint8_t *)v21;
        uint64_t v30 = swift_slowAlloc();
        uint64_t v32 = v30;
        *(_DWORD *)uint64_t v22 = 136315138;
        uint64_t v28 = v22 + 4;
        swift_bridgeObjectRetain();
        uint64_t v31 = sub_25C24A1D8(a1, a2, &v32);
        sub_25C274BE0();
        swift_bridgeObjectRelease_n();
        os_log_t v23 = v29;
        _os_log_impl(&dword_25C23E000, v29, v20, "No progress updates found, unable to populate progress info for %s", v22, 0xCu);
        uint64_t v24 = v30;
        swift_arrayDestroy();
        MEMORY[0x261183790](v24, -1, -1);
        MEMORY[0x261183790](v22, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, void *))(v7 + 8))(v9, v6);
      uint64_t v25 = sub_25C273EE0();
      sub_25C24D820();
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v25 - 8) + 104))(v26, *MEMORY[0x263F69878], v25);
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v17 = sub_25C273EE0();
    sub_25C24D820();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v17 - 8) + 104))(v18, *MEMORY[0x263F69880], v17);
    swift_willThrow();
  }
  return v6;
}

void sub_25C255B0C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x261182ED0](a1, a2, v7);
      sub_25C256834(0, (unint64_t *)&qword_26A599018);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_25C274C90() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_25C274CA0();
  sub_25C256834(0, (unint64_t *)&qword_26A599018);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v4 = v17;
  swift_unknownObjectRelease();
  uint64_t v8 = sub_25C274B90();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v11 = sub_25C274BA0();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v6 = (v6 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_26;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v14 = sub_25C274BA0();
    }
    while ((v14 & 1) == 0);
  }

LABEL_20:
  id v15 = *(void **)(*(void *)(a4 + 48) + 8 * v6);
  id v16 = v15;
}

uint64_t sub_25C255D84(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

void sub_25C255E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_25C274C70();
    sub_25C256834(0, (unint64_t *)&qword_26A598FE0);
    sub_25C24AC08();
    sub_25C274B20();
    uint64_t v3 = v29;
    uint64_t v26 = v30;
    uint64_t v4 = v31;
    int64_t v5 = v32;
    unint64_t v6 = v33;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v26 = a1 + 56;
    uint64_t v8 = ~v7;
    uint64_t v9 = -v7;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v6 = v10 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v4 = v8;
    int64_t v5 = 0;
  }
  uint64_t v24 = v4;
  int64_t v25 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!sub_25C274CC0()) {
      goto LABEL_37;
    }
    sub_25C256834(0, (unint64_t *)&qword_26A598FE0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v14 = v34;
    swift_unknownObjectRelease();
    uint64_t v12 = v6;
    if (!v34) {
      goto LABEL_37;
    }
LABEL_33:
    id v19 = objc_msgSend(v14, sel_uniqueName, v24);
    if (v19)
    {
      os_log_type_t v20 = v19;
      uint64_t v21 = sub_25C274910();
      uint64_t v23 = v22;

      if (v21 == a2 && v23 == a3)
      {
        swift_bridgeObjectRelease();
LABEL_37:
        sub_25C24AC60();
        return;
      }
      char v11 = sub_25C274E70();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_37;
      }
    }

    unint64_t v6 = v12;
  }
  if (v6)
  {
    uint64_t v12 = (v6 - 1) & v6;
    unint64_t v13 = __clz(__rbit64(v6)) | (v5 << 6);
LABEL_32:
    id v14 = *(id *)(*(void *)(v3 + 48) + 8 * v13);
    if (!v14) {
      goto LABEL_37;
    }
    goto LABEL_33;
  }
  int64_t v15 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v15 >= v25) {
      goto LABEL_37;
    }
    int64_t v16 = v5;
    unint64_t v17 = *(void *)(v26 + 8 * v15);
    ++v5;
    if (!v17)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v25) {
        goto LABEL_37;
      }
      unint64_t v17 = *(void *)(v26 + 8 * v5);
      if (!v17)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v25) {
          goto LABEL_37;
        }
        unint64_t v17 = *(void *)(v26 + 8 * v5);
        if (!v17)
        {
          int64_t v5 = v15 + 3;
          if (v15 + 3 >= v25) {
            goto LABEL_37;
          }
          unint64_t v17 = *(void *)(v26 + 8 * v5);
          if (!v17)
          {
            int64_t v5 = v15 + 4;
            if (v15 + 4 >= v25) {
              goto LABEL_37;
            }
            unint64_t v17 = *(void *)(v26 + 8 * v5);
            if (!v17)
            {
              uint64_t v18 = v16 + 6;
              while (v25 != v18)
              {
                unint64_t v17 = *(void *)(v26 + 8 * v18++);
                if (v17)
                {
                  int64_t v5 = v18 - 1;
                  goto LABEL_31;
                }
              }
              goto LABEL_37;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v12 = (v17 - 1) & v17;
    unint64_t v13 = __clz(__rbit64(v17)) + (v5 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

id sub_25C256170()
{
  uint64_t v0 = sub_25C274840();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_25C274310() < 1)
  {
    sub_25C274720();
    unint64_t v6 = sub_25C274830();
    os_log_type_t v7 = sub_25C274B50();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v14 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      sub_25C2746D0();
      uint64_t v10 = sub_25C274660();
      uint64_t v13 = sub_25C24A1D8(v10, v11, &v14);
      sub_25C274BE0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v6, v7, "longestWeeklyStreak is 0, not adding an earned instance for %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261183790](v9, -1, -1);
      MEMORY[0x261183790](v8, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0;
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F236B8]), sel_init);
    sub_25C2746D0();
    sub_25C2746A0();
    int64_t v5 = (void *)sub_25C2748E0();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setTemplateUniqueName_, v5);
  }
  return v4;
}

id sub_25C2563C0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = a1;
  uint64_t v41 = a2;
  uint64_t v4 = sub_25C273D80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25C273E20();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25C273CF0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v42 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = objc_msgSend(a3, sel_progressQuantity);
  uint64_t v43 = v9;
  uint64_t v44 = v7;
  if (v15)
  {
    sub_25C24C060();
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = objc_msgSend(a3, sel_goalQuantity);
  if (!v18) {
    return 0;
  }
  id v19 = v18;
  uint64_t v39 = v13;
  sub_25C24C060();
  uint64_t v21 = v20;

  id v22 = 0;
  if (v15 && v17 >= v21)
  {
    id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F236B8]), sel_init);
    uint64_t v23 = (void *)sub_25C2748E0();
    objc_msgSend(v22, sel_setTemplateUniqueName_, v23);

    sub_25C273E00();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FFD0);
    uint64_t v24 = sub_25C273E10();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v26 = v25;
    uint64_t v38 = v4;
    uint64_t v27 = *(void *)(v25 + 72);
    unint64_t v28 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    uint64_t v40 = v8;
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_25C276320;
    unint64_t v30 = v29 + v28;
    uint64_t v31 = *MEMORY[0x263F078A0];
    uint64_t v41 = v12;
    int64_t v32 = *(void (**)(unint64_t, uint64_t, uint64_t))(v26 + 104);
    v32(v30, v31, v24);
    v32(v30 + v27, *MEMORY[0x263F078A8], v24);
    v32(v30 + 2 * v27, *MEMORY[0x263F07870], v24);
    sub_25C2520A0(v29);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    unint64_t v33 = v44;
    sub_25C273D70();
    uint64_t v34 = v42;
    sub_25C273DC0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v33, v38);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v40);
    uint64_t v35 = (void *)sub_25C273CD0();
    objc_msgSend(v22, sel_setEarnedDateComponents_, v35);

    (*(void (**)(char *, uint64_t))(v39 + 8))(v34, v41);
  }
  return v22;
}

uint64_t sub_25C256828(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25C256834(uint64_t a1, unint64_t *a2)
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

unint64_t SeymourAchievementTemplate.toACHTemplate()()
{
  uint64_t v0 = sub_25C273E30();
  unint64_t v2 = v1;
  id v3 = objc_allocWithZone(MEMORY[0x263F23698]);
  uint64_t v4 = (void *)sub_25C273D40();
  sub_25C256A08(v0, v2);
  id v5 = objc_msgSend(v3, sel_initWithData_, v4);

  if (v5)
  {
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F236D8]), sel_initWithCodable_, v5);
    if (v6)
    {
      unint64_t v2 = (unint64_t)v6;
    }
    else
    {
      unint64_t v2 = sub_25C273EE0();
      sub_25C24D820();
      swift_allocError();
      (*(void (**)(uint64_t, void, unint64_t))(*(void *)(v2 - 8) + 104))(v9, *MEMORY[0x263F69870], v2);
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v7 = sub_25C273EE0();
    sub_25C24D820();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v7 - 8) + 104))(v8, *MEMORY[0x263F69860], v7);
    swift_willThrow();
  }
  return v2;
}

uint64_t sub_25C256A08(uint64_t a1, unint64_t a2)
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

Swift::Void __swiftcall ACHAchievement.updateBundleURLs()()
{
  unint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FF60);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  id v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v18 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - v9;
  id v11 = objc_msgSend(v0, sel_template);
  sub_25C253F88((uint64_t)v10);
  uint64_t v12 = sub_25C273D30();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  id v15 = 0;
  if (v14(v10, 1, v12) != 1)
  {
    id v15 = (void *)sub_25C273D10();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
  }
  objc_msgSend(v1, sel_setLocalizationBundleURL_, v15);

  sub_25C2546F4((uint64_t)v8);
  if (v14(v8, 1, v12) == 1)
  {
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = (void *)sub_25C273D10();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v12);
  }
  objc_msgSend(v1, sel_setResourceBundleURL_, v16);

  sub_25C254B68((uint64_t)v5);
  if (v14(v5, 1, v12) == 1)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = (void *)sub_25C273D10();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v5, v12);
  }
  objc_msgSend(v1, sel_setPropertyListBundleURL_, v17);

  objc_msgSend(v1, sel_setStickerBundleURL_, 0);
}

unsigned char *storeEnumTagSinglePayload for NotificationSettingError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C256DC0);
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

ValueMetadata *type metadata accessor for NotificationSettingError()
{
  return &type metadata for NotificationSettingError;
}

unint64_t sub_25C256DFC()
{
  unint64_t result = qword_26A599020;
  if (!qword_26A599020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A599020);
  }
  return result;
}

uint64_t ACAccountStore.iTunesAccount(altDSID:)(uint64_t a1, uint64_t a2)
{
  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  return MEMORY[0x270FA2498](sub_25C256E74, 0, 0);
}

uint64_t sub_25C256E74()
{
  id v1 = objc_msgSend(*(id *)(v0 + 144), sel_ams_mediaType);
  *(void *)(v0 + 152) = v1;
  if (v1)
  {
    id v2 = v1;
    int v3 = *(void **)(v0 + 144);
    unsigned int v4 = (void *)sub_25C2748E0();
    id v5 = objc_msgSend(v3, sel_ams_iTunesAccountWithAltDSID_forMediaType_, v4, v2);
    *(void *)(v0 + 160) = v5;

    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_25C257048;
    uint64_t v6 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_25C257240;
    *(void *)(v0 + 104) = &block_descriptor;
    *(void *)(v0 + 112) = v6;
    objc_msgSend(v5, sel_resultWithCompletion_, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  else
  {
    sub_25C245DD0();
    swift_allocError();
    *uint64_t v7 = 1;
    swift_willThrow();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t sub_25C257048()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 168) = v1;
  if (v1) {
    id v2 = sub_25C2571C8;
  }
  else {
    id v2 = sub_25C257158;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C257158()
{
  uint64_t v1 = *(void **)(v0 + 160);

  uint64_t v2 = *(void *)(v0 + 120);
  int v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_25C2571C8()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v2 = (void *)v0[19];
  swift_willThrow();

  int v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25C257240(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_26B350160);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    a1 = v3;
    a2 = (void *)v5;
    return MEMORY[0x270FA2410](a1, a2);
  }
  if (!a2)
  {
    __break(1u);
    return MEMORY[0x270FA2410](a1, a2);
  }
  **(void **)(*(void *)(v3 + 64) + 40) = a2;
  id v8 = a2;
  return swift_continuation_throwingResume();
}

uint64_t ACAccountStore.activeiTunesAccount()()
{
  *(void *)(v1 + 128) = v0;
  return MEMORY[0x270FA2498](sub_25C257320, 0, 0);
}

uint64_t sub_25C257320()
{
  id v1 = objc_msgSend(*(id *)(v0 + 128), sel_ams_mediaType);
  *(void *)(v0 + 136) = v1;
  if (v1)
  {
    id v2 = objc_msgSend(*(id *)(v0 + 128), sel_ams_activeiTunesAccountForMediaType_, v1);
    *(void *)(v0 + 144) = v2;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_25C2574CC;
    uint64_t v3 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_25C257240;
    *(void *)(v0 + 104) = &block_descriptor_2;
    *(void *)(v0 + 112) = v3;
    objc_msgSend(v2, sel_resultWithCompletion_, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  else
  {
    sub_25C245DD0();
    swift_allocError();
    *uint64_t v4 = 1;
    swift_willThrow();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_25C2574CC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    id v2 = sub_25C25764C;
  }
  else {
    id v2 = sub_25C2575DC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C2575DC()
{
  uint64_t v1 = *(void **)(v0 + 144);

  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_25C25764C()
{
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = (void *)v0[17];
  swift_willThrow();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t ACAccountStore.primaryAppleAccount()()
{
  *(void *)(v1 + 128) = v0;
  return MEMORY[0x270FA2498](sub_25C2576E4, 0, 0);
}

uint64_t sub_25C2576E4()
{
  uint64_t v1 = (void *)v0[16];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_25C2577E0;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_25C257A30;
  v0[13] = &block_descriptor_4;
  v0[14] = v2;
  objc_msgSend(v1, sel_aa_primaryAppleAccountWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_25C2577E0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_25C2579C4;
  }
  else {
    uint64_t v2 = sub_25C2578F0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C2578F0()
{
  if (*(void *)(v0 + 120))
  {
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    sub_25C245DD0();
    swift_allocError();
    *uint64_t v3 = 2;
    swift_willThrow();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_25C2579C4()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C257A30(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_26B350160);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    id v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_25C258834((uint64_t)&v11, v8, &qword_26B350140);
    return swift_continuation_throwingResume();
  }
}

uint64_t ACAccountStore.appleAccount(altDSID:)(uint64_t a1, uint64_t a2)
{
  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  return MEMORY[0x270FA2498](sub_25C257B20, 0, 0);
}

uint64_t sub_25C257B20()
{
  uint64_t v1 = (void *)v0[18];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_25C257C1C;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_25C257EB0;
  v0[13] = &block_descriptor_6;
  v0[14] = v2;
  objc_msgSend(v1, sel_aa_appleAccountsWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_25C257C1C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_25C257E44;
  }
  else {
    uint64_t v2 = sub_25C257D2C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C257D2C()
{
  unint64_t v1 = v0[15];
  if (v1
    && (uint64_t v2 = v0[16],
        uint64_t v3 = v0[17],
        swift_bridgeObjectRetain(),
        uint64_t v4 = sub_25C258268(v1, v2, v3),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        v4))
  {
    uint64_t v5 = (uint64_t (*)(void *))v0[1];
    return v5(v4);
  }
  else
  {
    sub_25C245DD0();
    swift_allocError();
    *id v7 = 1;
    swift_willThrow();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_25C257E44()
{
  swift_willThrow();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C257EB0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_26B350160);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    uint64_t v8 = 0;
    if (a2)
    {
      sub_25C2587F4();
      uint64_t v8 = sub_25C274A10();
    }
    uint64_t v10 = v8;
    sub_25C258834((uint64_t)&v10, *(void *)(*(void *)(v3 + 64) + 40), &qword_26A599088);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_25C257F90(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  id v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *id v7 = v3;
  v7[1] = sub_25C258898;
  v7[17] = a2;
  v7[18] = v6;
  v7[16] = a1;
  return MEMORY[0x270FA2498](sub_25C256E74, 0, 0);
}

uint64_t sub_25C258050()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C24723C;
  v3[16] = v2;
  return MEMORY[0x270FA2498](sub_25C257320, 0, 0);
}

uint64_t sub_25C2580FC()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C258898;
  v3[16] = v2;
  return MEMORY[0x270FA2498](sub_25C2576E4, 0, 0);
}

uint64_t sub_25C2581A8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  id v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *id v7 = v3;
  v7[1] = sub_25C258898;
  v7[17] = a2;
  v7[18] = v6;
  v7[16] = a1;
  return MEMORY[0x270FA2498](sub_25C257B20, 0, 0);
}

void *sub_25C258268(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_25C274DA0())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x261182F40](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      uint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = objc_msgSend(v7, sel_aa_altDSID);
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = sub_25C274910();
        uint64_t v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        char v16 = sub_25C274E70();
        swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_18;
        }
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t dispatch thunk of AccountStoring.iTunesAccount(altDSID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25C25889C;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of AccountStoring.activeiTunesAccount()(uint64_t a1, uint64_t a2)
{
  id v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C2474E4;
  return v7(a1, a2);
}

uint64_t dispatch thunk of AccountStoring.primaryAppleAccount()(uint64_t a1, uint64_t a2)
{
  id v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 24) + **(int **)(a2 + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C25889C;
  return v7(a1, a2);
}

uint64_t dispatch thunk of AccountStoring.appleAccount(altDSID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 32) + **(int **)(a4 + 32));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25C25889C;
  return v11(a1, a2, a3, a4);
}

unint64_t sub_25C2587F4()
{
  unint64_t result = qword_26B350138;
  if (!qword_26B350138)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B350138);
  }
  return result;
}

uint64_t sub_25C258834(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t ACAccount.type.getter@<X0>(char *a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_accountType);
  if (v3 && (uint64_t v4 = v3, v5 = objc_msgSend(v3, sel_identifier), v4, v5))
  {
    uint64_t v6 = sub_25C274910();
    uint64_t v8 = v7;

    uint64_t v9 = sub_25C274910();
    if (v8)
    {
      if (v9 == v6 && v8 == v10)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v12 = sub_25C274E70();
        swift_bridgeObjectRelease();
        if ((v12 & 1) == 0)
        {
          if (sub_25C274910() == v6 && v8 == v13)
          {
            uint64_t result = swift_bridgeObjectRelease_n();
LABEL_19:
            char v15 = 1;
            goto LABEL_15;
          }
          char v16 = sub_25C274E70();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v16) {
            goto LABEL_19;
          }
          goto LABEL_14;
        }
      }
      uint64_t result = swift_bridgeObjectRelease();
      char v15 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    sub_25C274910();
  }
  swift_bridgeObjectRelease();
  sub_25C274910();
  uint64_t result = swift_bridgeObjectRelease();
LABEL_14:
  char v15 = 2;
LABEL_15:
  *a1 = v15;
  return result;
}

uint64_t sub_25C258A28(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_25C25A378(a1, (uint64_t)sub_25C25A324, 0, isUniquelyReferenced_nonNull_native, (uint64_t)&v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

void ACAccount.init(_:)(uint64_t a1)
{
  uint64_t v2 = sub_25C274170();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = &v21[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25C274060();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25C274910();
    sub_25C274910();
    id v5 = objc_allocWithZone(MEMORY[0x263EFB220]);
    uint64_t v6 = (void *)sub_25C2748E0();
    swift_bridgeObjectRelease();
    uint64_t v7 = (void *)sub_25C2748E0();
    swift_bridgeObjectRelease();
    id v8 = objc_msgSend(v5, sel_initWithIdentifier_description_, v6, v7);

    if (v8) {
      goto LABEL_5;
    }
    __break(1u);
  }
  sub_25C274910();
  sub_25C274910();
  id v9 = objc_allocWithZone(MEMORY[0x263EFB220]);
  uint64_t v10 = (void *)sub_25C2748E0();
  swift_bridgeObjectRelease();
  id v11 = (void *)sub_25C2748E0();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v9, sel_initWithIdentifier_description_, v10, v11);

  if (!v8)
  {
LABEL_14:
    __break(1u);
    return;
  }
LABEL_5:
  sub_25C258DD8((uint64_t)v4);
  id v12 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithAccountType_, v8);
  if (!v12)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v13 = v12;
  sub_25C273FE0();
  if (v14)
  {
    char v15 = (void *)sub_25C2748E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v15 = 0;
  }
  objc_msgSend(v13, sel_setIdentifier_, v15);

  sub_25C2740A0();
  if (v16)
  {
    uint64_t v17 = (void *)sub_25C2748E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = 0;
  }
  objc_msgSend(v13, sel_setUsername_, v17);

  uint64_t v18 = sub_25C258E34();
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  *(void *)&v21[-16] = v13;
  sub_25C25AD84(v19, (void (*)(uint64_t, uint64_t, unsigned char *))sub_25C259B6C);

  uint64_t v20 = sub_25C2740C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(a1, v20);
  swift_bridgeObjectRelease();
}

uint64_t sub_25C258DD8(uint64_t a1)
{
  uint64_t v2 = sub_25C274170();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C258E34()
{
  uint64_t v0 = sub_25C274580();
  uint64_t v92 = *(void *)(v0 - 8);
  uint64_t v93 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v89 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25C2742F0();
  uint64_t v90 = *(void *)(v3 - 8);
  uint64_t v91 = v3;
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)&v89 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_25C274170();
  uint64_t v6 = MEMORY[0x270FA5388](v94);
  id v8 = (char *)&v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v89 - v9;
  unint64_t v11 = sub_25C25EA50(MEMORY[0x263F8EE78]);
  uint64_t v12 = sub_25C274910();
  uint64_t v14 = v13;
  uint64_t v15 = sub_25C2740B0();
  uint64_t v17 = MEMORY[0x263F8D310];
  if (v16)
  {
    *((void *)&v100 + 1) = MEMORY[0x263F8D310];
    *(void *)&long long v99 = v15;
    *((void *)&v99 + 1) = v16;
  }
  else
  {
    long long v99 = 0u;
    long long v100 = 0u;
  }
  sub_25C248CE8((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_25C25AFA8(&v96, v98);
    sub_25C24AB68((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v95 = v11;
    sub_25C25A6D0(&v96, v12, v14, isUniquelyReferenced_nonNull_native);
    unint64_t v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_25C24AC68((uint64_t)&v96, qword_26B34FE98);
  }
  swift_bridgeObjectRelease();
  sub_25C24AC68((uint64_t)&v99, qword_26B34FE98);
  uint64_t v19 = sub_25C274910();
  uint64_t v21 = v20;
  uint64_t v22 = sub_25C273FF0();
  if (v23)
  {
    *((void *)&v100 + 1) = v17;
    *(void *)&long long v99 = v22;
    *((void *)&v99 + 1) = v23;
  }
  else
  {
    long long v99 = 0u;
    long long v100 = 0u;
  }
  sub_25C248CE8((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_25C25AFA8(&v96, v98);
    sub_25C24AB68((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    char v24 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v95 = v11;
    sub_25C25A6D0(&v96, v19, v21, v24);
    unint64_t v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_25C24AC68((uint64_t)&v96, qword_26B34FE98);
  }
  swift_bridgeObjectRelease();
  sub_25C24AC68((uint64_t)&v99, qword_26B34FE98);
  uint64_t v25 = sub_25C274910();
  uint64_t v27 = v26;
  uint64_t v28 = sub_25C274080();
  if (v29)
  {
    *((void *)&v100 + 1) = v17;
    *(void *)&long long v99 = v28;
    *((void *)&v99 + 1) = v29;
  }
  else
  {
    long long v99 = 0u;
    long long v100 = 0u;
  }
  sub_25C248CE8((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_25C25AFA8(&v96, v98);
    sub_25C24AB68((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    char v30 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v95 = v11;
    sub_25C25A6D0(&v96, v25, v27, v30);
    unint64_t v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_25C24AC68((uint64_t)&v96, qword_26B34FE98);
  }
  swift_bridgeObjectRelease();
  sub_25C24AC68((uint64_t)&v99, qword_26B34FE98);
  uint64_t v31 = sub_25C274910();
  uint64_t v33 = v32;
  uint64_t v34 = sub_25C274090();
  if (v35)
  {
    *((void *)&v100 + 1) = v17;
    *(void *)&long long v99 = v34;
    *((void *)&v99 + 1) = v35;
  }
  else
  {
    long long v99 = 0u;
    long long v100 = 0u;
  }
  sub_25C248CE8((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_25C25AFA8(&v96, v98);
    sub_25C24AB68((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    char v36 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v95 = v11;
    sub_25C25A6D0(&v96, v31, v33, v36);
    unint64_t v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_25C24AC68((uint64_t)&v96, qword_26B34FE98);
  }
  swift_bridgeObjectRelease();
  sub_25C24AC68((uint64_t)&v99, qword_26B34FE98);
  uint64_t v37 = sub_25C274910();
  uint64_t v39 = v38;
  uint64_t v40 = sub_25C274010();
  if (v41)
  {
    *((void *)&v100 + 1) = v17;
    *(void *)&long long v99 = v40;
    *((void *)&v99 + 1) = v41;
  }
  else
  {
    long long v99 = 0u;
    long long v100 = 0u;
  }
  sub_25C248CE8((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_25C25AFA8(&v96, v98);
    sub_25C24AB68((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    char v42 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v95 = v11;
    sub_25C25A6D0(&v96, v37, v39, v42);
    unint64_t v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_25C24AC68((uint64_t)&v96, qword_26B34FE98);
  }
  swift_bridgeObjectRelease();
  sub_25C24AC68((uint64_t)&v99, qword_26B34FE98);
  uint64_t v43 = sub_25C274910();
  uint64_t v45 = v44;
  uint64_t v46 = sub_25C274020();
  if (v47)
  {
    *((void *)&v100 + 1) = v17;
    *(void *)&long long v99 = v46;
    *((void *)&v99 + 1) = v47;
  }
  else
  {
    long long v99 = 0u;
    long long v100 = 0u;
  }
  sub_25C248CE8((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_25C25AFA8(&v96, v98);
    sub_25C24AB68((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    char v48 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v95 = v11;
    sub_25C25A6D0(&v96, v43, v45, v48);
    unint64_t v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_25C24AC68((uint64_t)&v96, qword_26B34FE98);
  }
  swift_bridgeObjectRelease();
  sub_25C24AC68((uint64_t)&v99, qword_26B34FE98);
  uint64_t v49 = sub_25C274910();
  uint64_t v51 = v50;
  uint64_t v52 = sub_25C274070();
  if (v53)
  {
    *((void *)&v100 + 1) = v17;
    *(void *)&long long v99 = v52;
    *((void *)&v99 + 1) = v53;
  }
  else
  {
    long long v99 = 0u;
    long long v100 = 0u;
  }
  sub_25C248CE8((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_25C25AFA8(&v96, v98);
    sub_25C24AB68((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    char v54 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v95 = v11;
    sub_25C25A6D0(&v96, v49, v51, v54);
    unint64_t v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_25C24AC68((uint64_t)&v96, qword_26B34FE98);
  }
  swift_bridgeObjectRelease();
  sub_25C24AC68((uint64_t)&v99, qword_26B34FE98);
  uint64_t v55 = sub_25C274910();
  uint64_t v57 = v56;
  uint64_t v58 = sub_25C274040();
  if (v59)
  {
    *((void *)&v100 + 1) = v17;
    *(void *)&long long v99 = v58;
    *((void *)&v99 + 1) = v59;
  }
  else
  {
    long long v99 = 0u;
    long long v100 = 0u;
  }
  sub_25C248CE8((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_25C25AFA8(&v96, v98);
    sub_25C24AB68((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    char v60 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v95 = v11;
    sub_25C25A6D0(&v96, v55, v57, v60);
    unint64_t v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_25C24AC68((uint64_t)&v96, qword_26B34FE98);
  }
  swift_bridgeObjectRelease();
  sub_25C24AC68((uint64_t)&v99, qword_26B34FE98);
  uint64_t v61 = sub_25C274910();
  uint64_t v63 = v62;
  uint64_t v64 = sub_25C273FC0();
  if (v65)
  {
    *((void *)&v100 + 1) = v17;
    *(void *)&long long v99 = v64;
    *((void *)&v99 + 1) = v65;
  }
  else
  {
    long long v99 = 0u;
    long long v100 = 0u;
  }
  sub_25C248CE8((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_25C25AFA8(&v96, v98);
    sub_25C24AB68((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    char v66 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v95 = v11;
    sub_25C25A6D0(&v96, v61, v63, v66);
    unint64_t v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_25C24AC68((uint64_t)&v96, qword_26B34FE98);
  }
  swift_bridgeObjectRelease();
  sub_25C24AC68((uint64_t)&v99, qword_26B34FE98);
  uint64_t v67 = sub_25C273FD0();
  if (v68)
  {
    *((void *)&v100 + 1) = v17;
    *(void *)&long long v99 = v67;
    *((void *)&v99 + 1) = v68;
  }
  else
  {
    long long v99 = 0u;
    long long v100 = 0u;
  }
  sub_25C248CE8((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_25C25AFA8(&v96, v98);
    sub_25C24AB68((uint64_t)v98, (uint64_t)&v96);
    char v69 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v95 = v11;
    sub_25C25A6D0(&v96, 0xD000000000000015, 0x800000025C2770D0, v69);
    unint64_t v11 = v95;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_25C24AC68((uint64_t)&v96, qword_26B34FE98);
  }
  sub_25C24AC68((uint64_t)&v99, qword_26B34FE98);
  uint64_t v70 = sub_25C274910();
  uint64_t v72 = v71;
  uint64_t v73 = sub_25C274030();
  if (v74)
  {
    *((void *)&v100 + 1) = v17;
    *(void *)&long long v99 = v73;
    *((void *)&v99 + 1) = v74;
  }
  else
  {
    long long v99 = 0u;
    long long v100 = 0u;
  }
  sub_25C248CE8((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_25C25AFA8(&v96, v98);
    sub_25C24AB68((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    char v75 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v95 = v11;
    sub_25C25A6D0(&v96, v70, v72, v75);
    unint64_t v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_25C24AC68((uint64_t)&v96, qword_26B34FE98);
  }
  swift_bridgeObjectRelease();
  sub_25C24AC68((uint64_t)&v99, qword_26B34FE98);
  uint64_t v76 = sub_25C274910();
  uint64_t v78 = v77;
  uint64_t v79 = sub_25C274000();
  if (v80)
  {
    *((void *)&v100 + 1) = v17;
    *(void *)&long long v99 = v79;
    *((void *)&v99 + 1) = v80;
  }
  else
  {
    long long v99 = 0u;
    long long v100 = 0u;
  }
  sub_25C248CE8((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_25C25AFA8(&v96, v98);
    sub_25C24AB68((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    char v81 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v95 = v11;
    sub_25C25A6D0(&v96, v76, v78, v81);
    unint64_t v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_25C24AC68((uint64_t)&v96, qword_26B34FE98);
  }
  swift_bridgeObjectRelease();
  sub_25C24AC68((uint64_t)&v99, qword_26B34FE98);
  sub_25C274060();
  sub_25C25AFF8((uint64_t)v10, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v83 = v90;
    uint64_t v82 = v91;
    (*(void (**)(char *, char *, uint64_t))(v90 + 32))(v5, v8, v91);
    unint64_t v84 = sub_25C25B764();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v5, v82);
  }
  else
  {
    uint64_t v86 = v92;
    uint64_t v85 = v93;
    (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v2, v8, v93);
    unint64_t v84 = sub_25C269448();
    (*(void (**)(char *, uint64_t))(v86 + 8))(v2, v85);
  }
  sub_25C258DD8((uint64_t)v10);
  swift_bridgeObjectRetain();
  uint64_t v87 = sub_25C258A28(v84, v11);
  swift_bridgeObjectRelease();
  return v87;
}

void sub_25C259AD4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  uint64_t v5 = sub_25C274E60();
  id v6 = (id)sub_25C2748E0();
  objc_msgSend(a4, sel_setAccountProperty_forKey_, v5, v6);
  swift_unknownObjectRelease();
}

void sub_25C259B6C(uint64_t a1, uint64_t a2, void *a3)
{
  sub_25C259AD4(a1, a2, a3, *(void **)(v3 + 16));
}

uint64_t sub_25C259B74(uint64_t a1, uint64_t a2)
{
  return sub_25C259C70(a1, a2, &qword_26A5990A0);
}

uint64_t sub_25C259B80(uint64_t a1, uint64_t a2)
{
  return sub_25C259C70(a1, a2, &qword_26A599098);
}

uint64_t sub_25C259B8C()
{
  return sub_25C259E08();
}

uint64_t sub_25C259B98(uint64_t a1, uint64_t a2)
{
  return sub_25C259C70(a1, a2, &qword_26A5990A8);
}

uint64_t sub_25C259BA4()
{
  uint64_t v1 = (void *)sub_25C2748E0();
  id v2 = objc_msgSend(v0, sel_accountPropertyForKey_, v1);

  if (v2)
  {
    sub_25C274C40();
    swift_unknownObjectRelease();
    sub_25C25AFA8(&v4, v5);
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_26B34FE98);
  if (swift_dynamicCast()) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t sub_25C259C64(uint64_t a1, uint64_t a2)
{
  return sub_25C259C70(a1, a2, &qword_26A5990B0);
}

uint64_t sub_25C259C70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = (void *)sub_25C2748E0();
  id v6 = objc_msgSend(v3, sel_accountPropertyForKey_, v5);

  if (v6)
  {
    sub_25C274C40();
    swift_unknownObjectRelease();
    sub_25C25AFA8(&v8, v9);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_26B34FE98);
  __swift_instantiateConcreteTypeFromMangledName(a3);
  if (swift_dynamicCast()) {
    return v8;
  }
  else {
    return 0;
  }
}

uint64_t sub_25C259D38()
{
  uint64_t v1 = (void *)sub_25C2748E0();
  id v2 = objc_msgSend(v0, sel_accountPropertyForKey_, v1);

  if (v2)
  {
    sub_25C274C40();
    swift_unknownObjectRelease();
    sub_25C25AFA8(&v4, v5);
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_26B34FE98);
  sub_25C25AFB8();
  if (swift_dynamicCast()) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t sub_25C259DFC()
{
  return sub_25C259E08();
}

uint64_t sub_25C259E08()
{
  uint64_t v1 = (void *)sub_25C2748E0();
  id v2 = objc_msgSend(v0, sel_accountPropertyForKey_, v1);

  if (v2)
  {
    sub_25C274C40();
    swift_unknownObjectRelease();
    sub_25C25AFA8(&v6, v7);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_26B34FE98);
  int v3 = swift_dynamicCast();
  uint64_t v4 = v6;
  if (!v3) {
    return 0;
  }
  return v4;
}

void RemoteBrowsingAccount.init(account:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_25C274170();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(a1, sel_portableCopy);
  if (!v8)
  {
    uint64_t v10 = sub_25C273FA0();
    sub_25C25AF50();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v10 - 8) + 104))(v11, *MEMORY[0x263F6A2C8], v10);
    swift_willThrow();
    goto LABEL_5;
  }
  id v9 = v8;
  sub_25C25B0C4(v9, (uint64_t)v7);
  if (v2)
  {

LABEL_5:
    return;
  }
  id v12 = objc_msgSend(v9, sel_identifier);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_25C274910();
    uint64_t v16 = v15;

    id v17 = objc_msgSend(v9, sel_username);
    id v63 = a1;
    uint64_t v61 = v14;
    uint64_t v62 = a2;
    uint64_t v60 = v16;
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v40 = sub_25C274910();
      uint64_t v39 = v19;
    }
    else
    {
      uint64_t v40 = 0;
      uint64_t v39 = 0;
    }
    sub_25C274910();
    uint64_t v20 = sub_25C259BA4();
    uint64_t v58 = v21;
    uint64_t v59 = v20;
    swift_bridgeObjectRelease();
    sub_25C274910();
    uint64_t v22 = sub_25C259BA4();
    uint64_t v56 = v23;
    uint64_t v57 = v22;
    swift_bridgeObjectRelease();
    sub_25C274910();
    uint64_t v24 = sub_25C259BA4();
    uint64_t v54 = v25;
    uint64_t v55 = v24;
    swift_bridgeObjectRelease();
    sub_25C274910();
    uint64_t v26 = sub_25C259BA4();
    uint64_t v52 = v27;
    uint64_t v53 = v26;
    swift_bridgeObjectRelease();
    sub_25C274910();
    uint64_t v28 = sub_25C259BA4();
    uint64_t v50 = v29;
    uint64_t v51 = v28;
    swift_bridgeObjectRelease();
    sub_25C274910();
    uint64_t v30 = sub_25C259BA4();
    uint64_t v48 = v31;
    uint64_t v49 = v30;
    swift_bridgeObjectRelease();
    sub_25C274910();
    uint64_t v32 = sub_25C259BA4();
    uint64_t v46 = v33;
    uint64_t v47 = v32;
    swift_bridgeObjectRelease();
    sub_25C274910();
    uint64_t v34 = sub_25C259BA4();
    uint64_t v44 = v35;
    uint64_t v45 = v34;
    swift_bridgeObjectRelease();
    sub_25C274910();
    uint64_t v36 = sub_25C259BA4();
    uint64_t v42 = v37;
    uint64_t v43 = v36;
    swift_bridgeObjectRelease();
    uint64_t v41 = sub_25C259BA4();
    sub_25C274910();
    sub_25C259BA4();
    swift_bridgeObjectRelease();
    sub_25C274910();
    sub_25C259BA4();
    swift_bridgeObjectRelease();
    sub_25C274050();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25C25A324@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  sub_25C24AB68((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C25A378(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = -v7;
  uint64_t v50 = a1;
  uint64_t v51 = a1 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  else {
    uint64_t v11 = -1;
  }
  uint64_t v52 = v8;
  uint64_t v53 = 0;
  uint64_t v54 = v11 & v9;
  uint64_t v55 = a2;
  uint64_t v56 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25C25ABA0(&v48);
  uint64_t v12 = *((void *)&v48 + 1);
  if (!*((void *)&v48 + 1)) {
    goto LABEL_27;
  }
  uint64_t v13 = v48;
  sub_25C25AFA8(v49, v47);
  uint64_t v14 = *(void **)a5;
  unint64_t v16 = sub_25C26150C(v13, v12);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  char v20 = v15;
  if (v14[3] >= v19)
  {
    if (a4)
    {
      if (v15) {
        goto LABEL_12;
      }
    }
    else
    {
      sub_25C26A5C0();
      if (v20) {
        goto LABEL_12;
      }
    }
LABEL_14:
    uint64_t v24 = *(void **)a5;
    *(void *)(*(void *)a5 + 8 * (v16 >> 6) + 64) |= 1 << v16;
    uint64_t v25 = (uint64_t *)(v24[6] + 16 * v16);
    *uint64_t v25 = v13;
    v25[1] = v12;
    sub_25C25AFA8(v47, (_OWORD *)(v24[7] + 32 * v16));
    uint64_t v26 = v24[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v24[2] = v28;
LABEL_16:
    sub_25C25ABA0(&v48);
    for (uint64_t i = *((void *)&v48 + 1); *((void *)&v48 + 1); uint64_t i = *((void *)&v48 + 1))
    {
      uint64_t v31 = v48;
      sub_25C25AFA8(v49, v47);
      uint64_t v32 = *(void **)a5;
      unint64_t v34 = sub_25C26150C(v31, i);
      uint64_t v35 = v32[2];
      BOOL v36 = (v33 & 1) == 0;
      uint64_t v37 = v35 + v36;
      if (__OFADD__(v35, v36)) {
        goto LABEL_28;
      }
      char v38 = v33;
      if (v32[3] < v37)
      {
        sub_25C25FC2C(v37, 1);
        unint64_t v39 = sub_25C26150C(v31, i);
        if ((v38 & 1) != (v40 & 1)) {
          goto LABEL_30;
        }
        unint64_t v34 = v39;
      }
      if (v38)
      {
        sub_25C24AB68((uint64_t)v47, (uint64_t)v46);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
        swift_bridgeObjectRelease();
        uint64_t v30 = (_OWORD *)(*(void *)(*(void *)a5 + 56) + 32 * v34);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
        sub_25C25AFA8(v46, v30);
      }
      else
      {
        uint64_t v41 = *(void **)a5;
        *(void *)(*(void *)a5 + 8 * (v34 >> 6) + 64) |= 1 << v34;
        uint64_t v42 = (uint64_t *)(v41[6] + 16 * v34);
        *uint64_t v42 = v31;
        v42[1] = i;
        sub_25C25AFA8(v47, (_OWORD *)(v41[7] + 32 * v34));
        uint64_t v43 = v41[2];
        BOOL v27 = __OFADD__(v43, 1);
        uint64_t v44 = v43 + 1;
        if (v27) {
          goto LABEL_29;
        }
        v41[2] = v44;
      }
      sub_25C25ABA0(&v48);
    }
LABEL_27:
    swift_release();
    swift_bridgeObjectRelease();
    sub_25C24AC60();
    return swift_release();
  }
  sub_25C25FC2C(v19, a4 & 1);
  unint64_t v21 = sub_25C26150C(v13, v12);
  if ((v20 & 1) == (v22 & 1))
  {
    unint64_t v16 = v21;
    if ((v20 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_12:
    sub_25C24AB68((uint64_t)v47, (uint64_t)v46);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
    swift_bridgeObjectRelease();
    uint64_t v23 = (_OWORD *)(*(void *)(*(void *)a5 + 56) + 32 * v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    sub_25C25AFA8(v46, v23);
    goto LABEL_16;
  }
LABEL_30:
  uint64_t result = sub_25C274E90();
  __break(1u);
  return result;
}

_OWORD *sub_25C25A6D0(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_25C26150C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_25C26A5C0();
      goto LABEL_7;
    }
    sub_25C25FC2C(v15, a4 & 1);
    unint64_t v21 = sub_25C26150C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      BOOL v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_25C274E90();
    __break(1u);
    return result;
  }
LABEL_7:
  BOOL v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    return sub_25C25AFA8(a1, v19);
  }
LABEL_13:
  sub_25C25A824(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_25C25A824(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_25C25AFA8(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_25C25A890()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  uint64_t result;
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
    uint64_t v10 = *(void *)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    char v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    v11(&v19, v20);
    swift_bridgeObjectRelease();
    return v19;
  }
  uint64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    BOOL v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      uint64_t v15 = v0[1];
      char v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      uint64_t v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        char v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          uint64_t v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          char v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            uint64_t v13 = v3 + 3;
            goto LABEL_7;
          }
          uint64_t v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            char v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            uint64_t v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              char v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              BOOL v18 = v3 + 6;
              while (v14 != v18)
              {
                char v16 = *(void *)(v15 + 8 * v18++);
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
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_25C25AA18()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  uint64_t result;
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
    uint64_t v10 = *(void *)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    char v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    v11(&v19, v20);
    swift_bridgeObjectRelease();
    return v19;
  }
  uint64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    BOOL v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      uint64_t v15 = v0[1];
      char v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      uint64_t v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        char v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          uint64_t v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          char v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            uint64_t v13 = v3 + 3;
            goto LABEL_7;
          }
          uint64_t v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            char v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            uint64_t v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              char v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              BOOL v18 = v3 + 6;
              while (v14 != v18)
              {
                char v16 = *(void *)(v15 + 8 * v18++);
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
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_25C25ABA0@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    char v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_25C24AB68(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v15 != v18)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_25C25B05C((uint64_t)&v23, (uint64_t)v22);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_25C24AC68((uint64_t)v21, &qword_26A5990C0);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_25C25AD84(uint64_t a1, void (*a2)(uint64_t, uint64_t, unsigned char *))
{
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v7) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v20 + 8 * v15);
    ++v9;
    if (!v16)
    {
      int64_t v9 = v15 + 1;
      if (v15 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v16 = *(void *)(v20 + 8 * v9);
      if (!v16)
      {
        int64_t v9 = v15 + 2;
        if (v15 + 2 >= v7) {
          return swift_release();
        }
        unint64_t v16 = *(void *)(v20 + 8 * v9);
        if (!v16)
        {
          int64_t v9 = v15 + 3;
          if (v15 + 3 >= v7) {
            return swift_release();
          }
          unint64_t v16 = *(void *)(v20 + 8 * v9);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v16 - 1) & v16;
    unint64_t v11 = __clz(__rbit64(v16)) + (v9 << 6);
LABEL_5:
    uint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    sub_25C24AB68(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v19);
    v18[0] = v13;
    v18[1] = v14;
    swift_bridgeObjectRetain();
    a2(v13, v14, v19);
    uint64_t result = sub_25C24AC68((uint64_t)v18, &qword_26A5990C0);
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v7) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v20 + 8 * v17);
  if (v16)
  {
    int64_t v9 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v20 + 8 * v9);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t sub_25C25AF50()
{
  unint64_t result = qword_26A599090;
  if (!qword_26A599090)
  {
    sub_25C273FA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A599090);
  }
  return result;
}

_OWORD *sub_25C25AFA8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_25C25AFB8()
{
  unint64_t result = qword_26A5990B8;
  if (!qword_26A5990B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5990B8);
  }
  return result;
}

uint64_t sub_25C25AFF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C274170();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C25B05C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5990C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_25C25B0C4(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_25C274580();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25C2742F0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ACAccount.type.getter(&v16);
  if (v16 == 2)
  {
    uint64_t v13 = sub_25C273FA0();
    sub_25C25AF50();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v14, *MEMORY[0x263F6A2F8], v13);
    swift_willThrow();

    return;
  }
  if (v16)
  {
    sub_25C25B31C(a1);
    if (v2) {
      return;
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v12, v9);
  }
  else
  {
    sub_25C26843C(a1);
    if (v2) {
      return;
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
  }
  sub_25C274170();
  swift_storeEnumTagMultiPayload();
}

void sub_25C25B31C(void *a1)
{
  if (!sub_25C259B98(0x6E496E6F69676572, 0xEA00000000006F66)) {
    sub_25C25EB7C(MEMORY[0x263F8EE78]);
  }
  uint64_t v2 = sub_25C274910();
  uint64_t v4 = sub_25C259B74(v2, v3);
  swift_bridgeObjectRelease();
  if (!v4) {
    sub_25C25ECA0(MEMORY[0x263F8EE78]);
  }
  sub_25C259B8C();
  sub_25C259B80(0xD00000000000001ELL, 0x800000025C277090);
  id v5 = objc_msgSend(a1, sel_aa_primaryEmail);
  if (v5)
  {
    uint64_t v6 = v5;
    sub_25C274910();
  }
  id v7 = objc_msgSend(a1, sel_username);
  if (v7)
  {
    unint64_t v8 = v7;
    sub_25C274910();
  }
  id v9 = objc_msgSend(a1, sel_aa_appleIDAliases);
  if (v9)
  {
    uint64_t v10 = v9;
    sub_25C274A10();
  }
  id v11 = objc_msgSend(a1, sel_aa_personID);
  if (v11)
  {
    uint64_t v12 = v11;
    sub_25C274910();
  }
  id v13 = objc_msgSend(a1, sel_aa_altDSID);
  if (v13)
  {
    uint64_t v14 = v13;
    sub_25C274910();
  }
  id v15 = objc_msgSend(a1, sel_aa_firstName);
  if (v15)
  {
    char v16 = v15;
    sub_25C274910();
  }
  id v17 = objc_msgSend(a1, sel_aa_middleName);
  if (v17)
  {
    int64_t v18 = v17;
    sub_25C274910();
  }
  id v19 = objc_msgSend(a1, sel_aa_lastName);
  if (v19)
  {
    uint64_t v20 = v19;
    sub_25C274910();
  }
  id v21 = objc_msgSend(a1, sel_aa_accountClass);
  if (v21)
  {
    char v22 = v21;
    sub_25C274910();

    objc_msgSend(a1, sel_aa_isUsingCloudDocs);
    objc_msgSend(a1, sel_aa_isPrimaryEmailVerified);
    objc_msgSend(a1, sel_aa_isManagedAppleID);
    objc_msgSend(a1, sel_aa_isNotesMigrated);
    objc_msgSend(a1, sel_aa_isRemindersMigrated);
    objc_msgSend(a1, sel_aa_isSandboxAccount);
    objc_msgSend(a1, sel_aa_isFamilyEligible);
    objc_msgSend(a1, sel_aa_hasOptionalTerms);
    objc_msgSend(a1, sel_aa_needsToVerifyTerms);
    sub_25C2741E0();
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_25C25B764()
{
  unint64_t v0 = sub_25C25EA50(MEMORY[0x263F8EE78]);
  uint64_t v1 = sub_25C2741F0();
  uint64_t v3 = MEMORY[0x263F8D310];
  if (v2)
  {
    *((void *)&v64 + 1) = MEMORY[0x263F8D310];
    *(void *)&long long v63 = v1;
    *((void *)&v63 + 1) = v2;
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x457972616D697270, 0xEC0000006C69616DLL, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  uint64_t v5 = sub_25C2741A0();
  if (v6)
  {
    *((void *)&v64 + 1) = v3;
    *(void *)&long long v63 = v5;
    *((void *)&v63 + 1) = v6;
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v7 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x6449656C707061, 0xE700000000000000, v7);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  uint64_t v8 = sub_25C274240();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A599098);
  *((void *)&v64 + 1) = v9;
  *(void *)&long long v63 = v8;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v10 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x414449656C707061, 0xEE0073657361696CLL, v10);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  uint64_t v11 = sub_25C274230();
  if (v12)
  {
    *((void *)&v64 + 1) = v3;
    *(void *)&long long v63 = v11;
    *((void *)&v63 + 1) = v12;
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v13 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x44496E6F73726570, 0xE800000000000000, v13);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  uint64_t v14 = sub_25C2742C0();
  if (v15)
  {
    *((void *)&v64 + 1) = v3;
    *(void *)&long long v63 = v14;
    *((void *)&v63 + 1) = v15;
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v16 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x44495344746C61, 0xE700000000000000, v16);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  uint64_t v17 = sub_25C2742E0();
  if (v18)
  {
    *((void *)&v64 + 1) = v3;
    *(void *)&long long v63 = v17;
    *((void *)&v63 + 1) = v18;
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v19 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x6D614E7473726966, 0xE900000000000065, v19);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  uint64_t v20 = sub_25C2741B0();
  if (v21)
  {
    *((void *)&v64 + 1) = v3;
    *(void *)&long long v63 = v20;
    *((void *)&v63 + 1) = v21;
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v22 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x614E656C6464696DLL, 0xEA0000000000656DLL, v22);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  uint64_t v23 = sub_25C2742D0();
  if (v24)
  {
    *((void *)&v64 + 1) = v3;
    *(void *)&long long v63 = v23;
    *((void *)&v63 + 1) = v24;
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
  }
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x656D614E7473616CLL, 0xE800000000000000, v25);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  uint64_t v26 = sub_25C2741C0();
  *((void *)&v64 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5990A8);
  *(void *)&long long v63 = v26;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v27 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x6E496E6F69676572, 0xEA00000000006F66, v27);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  uint64_t v28 = sub_25C2741D0();
  *((void *)&v64 + 1) = v3;
  *(void *)&long long v63 = v28;
  *((void *)&v63 + 1) = v29;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v30 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x43746E756F636361, 0xEC0000007373616CLL, v30);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  char v31 = sub_25C274270();
  uint64_t v32 = MEMORY[0x263F8D4F8];
  *((void *)&v64 + 1) = MEMORY[0x263F8D4F8];
  LOBYTE(v63) = v31 & 1;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v33 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x756F6C4373657375, 0xED000073636F4464, v33);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  char v34 = sub_25C274290();
  *((void *)&v64 + 1) = v32;
  LOBYTE(v63) = v34 & 1;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v35 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0xD000000000000014, 0x800000025C2770B0, v35);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  char v36 = sub_25C274180();
  *((void *)&v64 + 1) = v32;
  LOBYTE(v63) = v36 & 1;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v37 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0xD000000000000010, 0x800000025C276AE0, v37);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  char v38 = sub_25C274200();
  *((void *)&v64 + 1) = v32;
  LOBYTE(v63) = v38 & 1;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v39 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x67694D7365746F6ELL, 0xED00006465746172, v39);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  char v40 = sub_25C274260();
  *((void *)&v64 + 1) = v32;
  LOBYTE(v63) = v40 & 1;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v41 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0xD000000000000011, 0x800000025C277050, v41);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  char v42 = sub_25C274190();
  *((void *)&v64 + 1) = v32;
  LOBYTE(v63) = v42 & 1;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v43 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x6F62646E61537369, 0xED00007463634178, v43);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  char v44 = sub_25C274220();
  *((void *)&v64 + 1) = v32;
  LOBYTE(v63) = v44 & 1;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v45 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x6C45796C696D6166, 0xEE00656C62696769, v45);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  char v46 = sub_25C274210();
  *((void *)&v64 + 1) = v32;
  LOBYTE(v63) = v46 & 1;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v47 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0xD000000000000010, 0x800000025C277030, v47);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  char v48 = sub_25C274250();
  *((void *)&v64 + 1) = v32;
  LOBYTE(v63) = v48 & 1;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v49 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0xD000000000000012, 0x800000025C277070, v49);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  uint64_t v50 = sub_25C274910();
  uint64_t v52 = v51;
  uint64_t v53 = sub_25C2742A0();
  *((void *)&v64 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5990A0);
  *(void *)&long long v63 = v53;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    swift_bridgeObjectRetain();
    char v54 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, v50, v52, v54);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  swift_bridgeObjectRelease();
  sub_25C248D50((uint64_t)&v63);
  uint64_t v55 = sub_25C274280();
  *((void *)&v64 + 1) = MEMORY[0x263F8D9D0];
  *(void *)&long long v63 = v55;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v56 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0x7453726961706572, 0xEB00000000657461, v56);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  uint64_t v57 = sub_25C2742B0();
  *((void *)&v64 + 1) = v9;
  *(void *)&long long v63 = v57;
  sub_25C248CE8((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_25C25AFA8(&v60, v62);
    sub_25C24AB68((uint64_t)v62, (uint64_t)&v60);
    char v58 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v60, 0xD00000000000001ELL, 0x800000025C277090, v58);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_25C248D50((uint64_t)&v60);
  }
  sub_25C248D50((uint64_t)&v63);
  return v0;
}

unint64_t AppInstallRequestProvider.makeAppInstallRequest()()
{
  return sub_25C25C60C();
}

unint64_t sub_25C25C60C()
{
  unint64_t result = qword_26A5990D0;
  if (!qword_26A5990D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5990D0);
  }
  return result;
}

unint64_t sub_25C25C64C()
{
  return sub_25C25C60C();
}

uint64_t dispatch thunk of AppInstallRequestProviding.makeAppInstallRequest()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for AppInstallRequestProvider()
{
  return &type metadata for AppInstallRequestProvider;
}

uint64_t dispatch thunk of AppRecordObserving.onRecordUpdated.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppRecordObserving.onRecordUpdated.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of AppRecordObserving.onRecordUpdated.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AppRecordObserving.init(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of AppRecordObserving.begin()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

char *sub_25C25C6F8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = &v2[OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_onRecordUpdated];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  uint64_t v6 = &v2[OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_bundleIdentifier];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5991A8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25C275A50;
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  uint64_t v8 = v2;
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)sub_25C274A00();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(self, sel_queryForBundleIDs_, v9);

  *(void *)&v8[OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_query] = v10;
  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for AppRecordObserver();
  uint64_t v11 = (char *)objc_msgSendSuper2(&v13, sel_init);
  objc_msgSend(*(id *)&v11[OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_query], sel_setObserver_, v11);
  return v11;
}

id sub_25C25C848()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppRecordObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AppRecordObserver()
{
  return self;
}

uint64_t sub_25C25C904(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = a3;
  uint64_t v24 = a2;
  uint64_t v22 = a1;
  uint64_t v3 = sub_25C274850();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_25C274880();
  uint64_t v7 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25C274860();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  objc_super v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C256834(0, (unint64_t *)&qword_26A599220);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F8F060], v10);
  uint64_t v14 = (void *)sub_25C274B80();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = v22;
  uint64_t v17 = v23;
  v15[2] = v23;
  v15[3] = v16;
  v15[4] = v24;
  aBlock[4] = sub_25C25E0BC;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25C25D688;
  aBlock[3] = &block_descriptor_1;
  uint64_t v18 = _Block_copy(aBlock);
  id v19 = v17;
  swift_retain();
  sub_25C274870();
  uint64_t v26 = MEMORY[0x263F8EE78];
  sub_25C25E0E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A599178);
  sub_25C25E138();
  sub_25C274C50();
  MEMORY[0x261182D90](0, v9, v6, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v25);
  return swift_release();
}

void sub_25C25CC60(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C274840();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C274740();
  sub_25C274820();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v10 = *(void **)&a1[OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_query];
  uint64_t v11 = (void *)swift_allocObject();
  void v11[2] = a2;
  v11[3] = a3;
  v11[4] = a1;
  aBlock[4] = sub_25C25E1D4;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25C25DC0C;
  aBlock[3] = &block_descriptor_13;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  objc_super v13 = a1;
  swift_release();
  objc_msgSend(v10, sel_executeQueryWithResultHandler_, v12);
  _Block_release(v12);
}

uint64_t sub_25C25CE28(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v66 = a3;
  uint64_t v67 = a4;
  uint64_t v8 = sub_25C274850();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25C274880();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v68 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25C274840();
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v62 - v20;
  char v69 = v11;
  uint64_t v70 = v13;
  uint64_t v71 = v22;
  uint64_t v72 = v19;
  if (a1)
  {
    uint64_t v23 = a5;
    unint64_t v24 = swift_bridgeObjectRetain();
    uint64_t v25 = sub_25C25E34C(v24, v23);

    sub_25C274740();
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_25C274830();
    os_log_type_t v27 = sub_25C274B50();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v64 = v25;
      uint64_t v29 = v28;
      uint64_t v30 = swift_slowAlloc();
      uint64_t v63 = v30;
      *(_DWORD *)uint64_t v29 = 141558274;
      uint64_t v73 = 1752392040;
      uint64_t aBlock = v30;
      sub_25C274BE0();
      *(_WORD *)(v29 + 12) = 2080;
      uint64_t v62 = v29 + 14;
      uint64_t v31 = v12;
      uint64_t v32 = v8;
      uint64_t v33 = sub_25C256834(0, &qword_26A599188);
      uint64_t v34 = swift_bridgeObjectRetain();
      uint64_t v35 = MEMORY[0x261182C40](v34, v33);
      uint64_t v65 = v9;
      unint64_t v37 = v36;
      swift_bridgeObjectRelease();
      uint64_t v38 = v35;
      uint64_t v8 = v32;
      uint64_t v12 = v31;
      uint64_t v73 = sub_25C24A1D8(v38, v37, &aBlock);
      sub_25C274BE0();
      swift_bridgeObjectRelease_n();
      uint64_t v9 = v65;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v26, v27, "Filtering %{mask.hash}s", (uint8_t *)v29, 0x16u);
      uint64_t v39 = v63;
      swift_arrayDestroy();
      MEMORY[0x261183790](v39, -1, -1);
      uint64_t v40 = v29;
      uint64_t v25 = v64;
      MEMORY[0x261183790](v40, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v71 + 8))(v18, v72);
    sub_25C256834(0, (unint64_t *)&qword_26A599220);
    char v49 = (void *)sub_25C274B60();
    uint64_t v50 = (void *)swift_allocObject();
    uint64_t v51 = v66;
    uint64_t v52 = v67;
    v50[2] = v25;
    v50[3] = v51;
    v50[4] = v52;
    uint64_t v78 = sub_25C25E26C;
    uint64_t v79 = v50;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v75 = 1107296256;
    uint64_t v76 = sub_25C25D688;
    uint64_t v77 = &block_descriptor_25;
    uint64_t v53 = _Block_copy(&aBlock);
    swift_retain();
    char v54 = v68;
    sub_25C274870();
    uint64_t v73 = MEMORY[0x263F8EE78];
    sub_25C25E0E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A599178);
    sub_25C25E138();
    uint64_t v55 = v69;
    sub_25C274C50();
    MEMORY[0x261182D90](0, v54, v55, v53);
    _Block_release(v53);
  }
  else
  {
    sub_25C274740();
    id v41 = a2;
    id v42 = a2;
    char v43 = sub_25C274830();
    os_log_type_t v44 = sub_25C274B40();
    if (os_log_type_enabled(v43, v44))
    {
      char v45 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      uint64_t v73 = (uint64_t)a2;
      uint64_t aBlock = v46;
      uint64_t v64 = v12;
      uint64_t v65 = v8;
      *(_DWORD *)char v45 = 136446210;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A599190);
      uint64_t v47 = sub_25C274BB0();
      uint64_t v73 = sub_25C24A1D8(v47, v48, &aBlock);
      uint64_t v12 = v64;
      uint64_t v8 = v65;
      sub_25C274BE0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25C23E000, v43, v44, "Failed to execute query: %{public}s", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261183790](v46, -1, -1);
      MEMORY[0x261183790](v45, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v71 + 8))(v21, v72);
    sub_25C256834(0, (unint64_t *)&qword_26A599220);
    char v56 = (void *)sub_25C274B60();
    uint64_t v57 = (void *)swift_allocObject();
    uint64_t v58 = v67;
    v57[2] = v66;
    v57[3] = v58;
    v57[4] = a2;
    uint64_t v78 = sub_25C25E220;
    uint64_t v79 = v57;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v75 = 1107296256;
    uint64_t v76 = sub_25C25D688;
    uint64_t v77 = &block_descriptor_19;
    uint64_t v59 = _Block_copy(&aBlock);
    id v60 = a2;
    swift_retain();
    char v54 = v68;
    sub_25C274870();
    uint64_t v73 = MEMORY[0x263F8EE78];
    sub_25C25E0E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A599178);
    sub_25C25E138();
    uint64_t v55 = v69;
    sub_25C274C50();
    MEMORY[0x261182D90](0, v54, v55, v59);
    _Block_release(v59);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v55, v8);
  (*(void (**)(char *, uint64_t))(v70 + 8))(v54, v12);
  return swift_release();
}

uint64_t sub_25C25D5F8(void (*a1)(void *), int a2, id a3)
{
  if (a3)
  {
    uint64_t v5 = (uint64_t)a3;
  }
  else
  {
    sub_25C25E2D8();
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = 5;
  }
  v9[0] = v5;
  char v10 = 1;
  id v7 = a3;
  a1(v9);
  return sub_25C25E278((uint64_t)v9);
}

uint64_t sub_25C25D68C(unint64_t a1, void (*a2)(void))
{
  uint64_t v4 = sub_25C274840();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  char v10 = (char *)v43 - v9;
  if (!(a1 >> 62))
  {
    uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v11) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    sub_25C274740();
    swift_bridgeObjectRetain_n();
    uint64_t v31 = sub_25C274830();
    os_log_type_t v32 = sub_25C274B50();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v45 = v5;
      uint64_t v35 = v34;
      *(_DWORD *)uint64_t v33 = 141558274;
      uint64_t v48 = 1752392040;
      v49[0] = v34;
      uint64_t v46 = v4;
      sub_25C274BE0();
      *(_WORD *)(v33 + 12) = 2080;
      uint64_t v47 = a2;
      uint64_t v44 = v33 + 14;
      uint64_t v36 = sub_25C256834(0, &qword_26A599188);
      uint64_t v37 = swift_bridgeObjectRetain();
      uint64_t v38 = MEMORY[0x261182C40](v37, v36);
      unint64_t v40 = v39;
      swift_bridgeObjectRelease();
      uint64_t v48 = sub_25C24A1D8(v38, v40, v49);
      a2 = v47;
      sub_25C274BE0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v31, v32, "No app found from %{mask.hash}s!", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261183790](v35, -1, -1);
      MEMORY[0x261183790](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v45 + 8))(v10, v46);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
    sub_25C25E2D8();
    uint64_t v41 = swift_allocError();
    *id v42 = 3;
    v49[0] = v41;
    char v50 = 1;
    a2(v49);
    return sub_25C25E278((uint64_t)v49);
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C274DA0();
  if (!result) {
    goto LABEL_11;
  }
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v13 = (id)MEMORY[0x261182F40](0, a1);
    goto LABEL_6;
  }
  if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v13 = *(id *)(a1 + 32);
LABEL_6:
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    sub_25C274740();
    id v15 = v14;
    uint64_t v16 = sub_25C274830();
    os_log_type_t v17 = sub_25C274B50();
    int v18 = v17;
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v19 = swift_slowAlloc();
      LODWORD(v44) = v18;
      uint64_t v20 = v19;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v45 = v21;
      *(_DWORD *)uint64_t v20 = 141558274;
      uint64_t v48 = 1752392040;
      v49[0] = v21;
      v43[2] = v49;
      sub_25C274BE0();
      *(_WORD *)(v20 + 12) = 2080;
      v43[1] = v20 + 14;
      id v22 = v15;
      uint64_t v47 = a2;
      id v23 = v22;
      id v24 = objc_msgSend(v22, sel_description);
      uint64_t v25 = sub_25C274910();
      uint64_t v46 = v4;
      uint64_t v26 = v25;
      unint64_t v28 = v27;

      uint64_t v48 = sub_25C24A1D8(v26, v28, v49);
      sub_25C274BE0();

      a2 = v47;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v16, (os_log_type_t)v44, "Found app %{mask.hash}s!", (uint8_t *)v20, 0x16u);
      uint64_t v29 = v45;
      swift_arrayDestroy();
      MEMORY[0x261183790](v29, -1, -1);
      MEMORY[0x261183790](v20, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v46);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    v49[3] = sub_25C256834(0, &qword_26A599188);
    v49[4] = (uint64_t)&protocol witness table for ASDApp;
    v49[0] = (uint64_t)v15;
    char v50 = 0;
    id v30 = v15;
    a2(v49);

    return sub_25C25E278((uint64_t)v49);
  }
  __break(1u);
  return result;
}

uint64_t sub_25C25DC0C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_25C256834(0, &qword_26A599188);
    uint64_t v4 = sub_25C274A10();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25C25DCB0()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_onRecordUpdated);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_25C25E33C(*v1);
  return v2;
}

uint64_t sub_25C25DD0C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_onRecordUpdated);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_25C25E32C(v6);
}

uint64_t (*sub_25C25DD6C())()
{
  return j__swift_endAccess;
}

char *sub_25C25DDCC(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for AppRecordObserver());
  return sub_25C25C6F8(a1, a2);
}

uint64_t sub_25C25DE0C()
{
  *(void *)(swift_allocObject() + 16) = v0;
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A599160);
  return sub_25C274590();
}

void sub_25C25DE90(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x261183870](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = (uint64_t *)(v4 + OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_onRecordUpdated);
    swift_beginAccess();
    uint64_t v7 = (void (*)(void *))*v6;
    sub_25C25E33C(*v6);

    if (v7)
    {
      v9[3] = sub_25C256834(0, &qword_26A599188);
      v9[4] = &protocol witness table for ASDApp;
      v9[0] = a2;
      id v8 = a2;
      v7(v9);
      sub_25C25E32C((uint64_t)v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    }
  }
}

uint64_t sub_25C25DF6C(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_25C25E03C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C25E074(uint64_t a1, uint64_t a2)
{
  return sub_25C25C904(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_25C25E07C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25C25E0BC()
{
  sub_25C25CC60(*(char **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_25C25E0E0()
{
  unint64_t result = qword_26A599170;
  if (!qword_26A599170)
  {
    sub_25C274850();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A599170);
  }
  return result;
}

unint64_t sub_25C25E138()
{
  unint64_t result = qword_26A599180;
  if (!qword_26A599180)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A599178);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A599180);
  }
  return result;
}

uint64_t sub_25C25E194()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25C25E1D4(uint64_t a1, void *a2)
{
  return sub_25C25CE28(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_25C25E1E0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25C25E220()
{
  return sub_25C25D5F8(*(void (**)(void *))(v0 + 16), *(void *)(v0 + 24), *(id *)(v0 + 32));
}

uint64_t sub_25C25E22C()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25C25E26C()
{
  return sub_25C25D68C(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24));
}

uint64_t sub_25C25E278(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A599210);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25C25E2D8()
{
  unint64_t result = qword_26A5991A0;
  if (!qword_26A5991A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5991A0);
  }
  return result;
}

uint64_t sub_25C25E32C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25C25E33C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_25C25E34C(unint64_t a1, uint64_t *a2)
{
  unint64_t v3 = a1;
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_22;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      uint64_t v6 = (uint64_t *)((char *)a2 + OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_bundleIdentifier);
      unint64_t v18 = v3 & 0xC000000000000001;
      uint64_t v17 = v3 & 0xFFFFFFFFFFFFFF8;
      while (v18)
      {
        id v7 = (id)MEMORY[0x261182F40](v5, v3);
LABEL_9:
        id v8 = v7;
        unint64_t v9 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_21;
        }
        unint64_t v10 = v3;
        id v11 = objc_msgSend(v7, sel_bundleID);
        uint64_t v12 = sub_25C274910();
        a2 = v13;

        if (v12 == *v6 && a2 == (uint64_t *)v6[1])
        {
          swift_bridgeObjectRelease();
LABEL_17:
          sub_25C274D40();
          sub_25C274D70();
          sub_25C274D80();
          a2 = &v19;
          sub_25C274D50();
          goto LABEL_5;
        }
        char v15 = sub_25C274E70();
        swift_bridgeObjectRelease();
        if (v15) {
          goto LABEL_17;
        }

LABEL_5:
        unint64_t v3 = v10;
        ++v5;
        if (v9 == v4) {
          return v19;
        }
      }
      if (v5 < *(void *)(v17 + 16)) {
        break;
      }
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      uint64_t v4 = sub_25C274DA0();
      if (!v4) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v7 = *(id *)(v3 + 8 * v5 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25C25E510()
{
  uint64_t v1 = sub_25C274850();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&aBlock[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25C274880();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = v0;
  unint64_t v10 = swift_bridgeObjectRetain();
  unint64_t v11 = sub_25C25E34C(v10, v9);
  swift_bridgeObjectRelease();

  if (v11 >> 62)
  {
    uint64_t result = sub_25C274DA0();
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    return swift_bridgeObjectRelease();
  }
  uint64_t result = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v20 = v5;
  if ((v11 & 0xC000000000000001) != 0)
  {
    id v13 = (id)MEMORY[0x261182F40](0, v11);
    goto LABEL_6;
  }
  if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v13 = *(id *)(v11 + 32);
LABEL_6:
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    sub_25C256834(0, (unint64_t *)&qword_26A599220);
    char v15 = (void *)sub_25C274B60();
    uint64_t v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v16;
    *(void *)(v17 + 24) = v14;
    aBlock[4] = sub_25C25E908;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25C25D688;
    aBlock[3] = &block_descriptor_34;
    unint64_t v18 = _Block_copy(aBlock);
    id v19 = v14;
    swift_release();
    sub_25C274870();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_25C25E0E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A599178);
    sub_25C25E138();
    sub_25C274C50();
    MEMORY[0x261182D90](0, v8, v4, v18);
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v20);
  }
  __break(1u);
  return result;
}

uint64_t sub_25C25E890()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C25E8C8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25C25E908()
{
  sub_25C25DE90(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_25C25E930(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5991C8);
  uint64_t v2 = (void *)sub_25C274DD0();
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
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25C26150C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_25C25EA44(uint64_t a1)
{
  return sub_25C25EEDC(a1, &qword_26A5991E8);
}

unint64_t sub_25C25EA50(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5991D8);
  uint64_t v2 = sub_25C274DD0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25C261584(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25C26150C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25C25AFA8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_25C25EB7C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5991B8);
  uint64_t v2 = (void *)sub_25C274DD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25C26150C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_25C25ECA0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5991B0);
  uint64_t v2 = (void *)sub_25C274DD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25C26150C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
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

unint64_t sub_25C25EDB4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5991D0);
  uint64_t v2 = (void *)sub_25C274DD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_25C26150C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

unint64_t sub_25C25EED0(uint64_t a1)
{
  return sub_25C25EEDC(a1, &qword_26A5991C0);
}

unint64_t sub_25C25EEDC(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_25C274DD0();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25C26150C(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v5 += 3;
    v3[2] = v14;
    if (!--v4)
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

unint64_t sub_25C25EFEC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FFC8);
  uint64_t v2 = (void *)sub_25C274DD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 52);
  while (1)
  {
    uint64_t v5 = *(void *)(v4 - 20);
    uint64_t v6 = *(void *)(v4 - 12);
    int v7 = *((_DWORD *)v4 - 1);
    char v8 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25C26150C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = v2[7] + 8 * result;
    *(_DWORD *)uint64_t v12 = v7;
    *(unsigned char *)(v12 + 4) = v8;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v2[2] = v15;
    v4 += 24;
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

void PersonalizationAwardProgressReference.init(fromACHProgressUpdate:modalityReferences:)(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(a1, sel_goalQuantity);
  if (v4)
  {
    uint64_t v5 = v4;
    sub_25C24C060();
  }
  id v6 = objc_msgSend(a1, sel_progressQuantity);
  if (v6)
  {
    int v7 = v6;
    sub_25C24C060();
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_26B34FFD8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C275A50;
  *(void *)(inited + 32) = 0xD000000000000012;
  *(void *)(inited + 40) = 0x800000025C277220;
  uint64_t v9 = ACHAchievementProgressUpdate.modalityIdentifier(from:)(a2);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  if (v11) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = 0;
  }
  if (v11) {
    unint64_t v13 = v11;
  }
  else {
    unint64_t v13 = 0xE000000000000000;
  }
  uint64_t v14 = HIBYTE(v13) & 0xF;
  uint64_t v15 = v12 & 0xFFFFFFFFFFFFLL;
  if ((v13 & 0x2000000000000000) != 0) {
    uint64_t v16 = HIBYTE(v13) & 0xF;
  }
  else {
    uint64_t v16 = v12 & 0xFFFFFFFFFFFFLL;
  }
  if (!v16)
  {
    swift_bridgeObjectRelease();
    int v29 = 0;
    LOBYTE(v28) = 1;
LABEL_51:
    *(_DWORD *)(inited + 48) = v29;
    *(unsigned char *)(inited + 52) = v28;
    unint64_t v30 = sub_25C25EFEC(inited);
    sub_25C25F54C(v30);
    swift_bridgeObjectRelease();
    ACHAchievementProgressUpdate.isRequired.getter();
    id v31 = objc_msgSend(a1, sel_templateUniqueName);
    sub_25C274910();

    sub_25C2743E0();
    return;
  }
  if ((v13 & 0x1000000000000000) != 0)
  {
    unint64_t v19 = sub_25C260A3C(v12, v13, 10);
    swift_bridgeObjectRelease();
    uint64_t v28 = HIDWORD(v19) & 1;
LABEL_48:
    if (v28) {
      int v29 = 0;
    }
    else {
      int v29 = v19;
    }
    goto LABEL_51;
  }
  if ((v13 & 0x2000000000000000) == 0)
  {
    if ((v12 & 0x1000000000000000) != 0) {
      long long v17 = (unsigned __int8 *)((v13 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      long long v17 = (unsigned __int8 *)sub_25C274D30();
    }
    unint64_t v18 = sub_25C260DA0(v17, v15, 10);
    LODWORD(v19) = v18;
    char v43 = BYTE4(v18) & 1;
    char v20 = BYTE4(v18) & 1;
    goto LABEL_47;
  }
  v42[0] = v12;
  v42[1] = v13 & 0xFFFFFFFFFFFFFFLL;
  if (v12 == 43)
  {
    if (v14)
    {
      if (v14 != 1)
      {
        LODWORD(v19) = (BYTE1(v12) - 48);
        if (v19 <= 9)
        {
          if (v14 == 2) {
            goto LABEL_46;
          }
          if ((BYTE2(v12) - 48) <= 9u)
          {
            LODWORD(v19) = 10 * v19 + (BYTE2(v12) - 48);
            uint64_t v24 = v14 - 3;
            if (v24)
            {
              uint64_t v25 = (unsigned __int8 *)v42 + 3;
              while (1)
              {
                unsigned int v26 = *v25 - 48;
                if (v26 > 9) {
                  goto LABEL_43;
                }
                uint64_t v27 = 10 * v19;
                if ((v27 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_43;
                }
                LODWORD(v19) = v27 + v26;
                if (__CFADD__(v27, v26)) {
                  goto LABEL_43;
                }
                char v20 = 0;
                ++v25;
                if (!--v24) {
                  goto LABEL_47;
                }
              }
            }
            goto LABEL_46;
          }
        }
      }
      goto LABEL_43;
    }
  }
  else
  {
    if (v12 != 45)
    {
      if (v14)
      {
        LODWORD(v19) = (v12 - 48);
        if (v19 <= 9)
        {
          if (v14 == 1) {
            goto LABEL_46;
          }
          if ((BYTE1(v12) - 48) <= 9u)
          {
            LODWORD(v19) = 10 * v19 + (BYTE1(v12) - 48);
            uint64_t v32 = v14 - 2;
            if (v32)
            {
              uint64_t v33 = (unsigned __int8 *)v42 + 2;
              while (1)
              {
                unsigned int v34 = *v33 - 48;
                if (v34 > 9) {
                  goto LABEL_43;
                }
                uint64_t v35 = 10 * v19;
                if ((v35 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_43;
                }
                LODWORD(v19) = v35 + v34;
                if (__CFADD__(v35, v34)) {
                  goto LABEL_43;
                }
                char v20 = 0;
                ++v33;
                if (!--v32) {
                  goto LABEL_47;
                }
              }
            }
            goto LABEL_46;
          }
        }
      }
LABEL_43:
      LODWORD(v19) = 0;
LABEL_44:
      char v20 = 1;
      goto LABEL_47;
    }
    if (v14)
    {
      if (v14 != 1)
      {
        unsigned __int8 v21 = BYTE1(v12) - 48;
        if ((BYTE1(v12) - 48) <= 9u)
        {
          LODWORD(v19) = 0;
          BOOL v22 = v21 == 0;
          unsigned int v23 = -v21;
          if (!v22) {
            goto LABEL_44;
          }
          if (v14 == 2)
          {
            char v20 = 0;
            LODWORD(v19) = v23;
LABEL_47:
            swift_bridgeObjectRelease();
            LODWORD(v28) = v20 & 1;
            goto LABEL_48;
          }
          unsigned __int8 v36 = BYTE2(v12) - 48;
          if ((BYTE2(v12) - 48) <= 9u)
          {
            uint64_t v37 = 10 * v23;
            if ((v37 & 0xFFFFFFFF00000000) == 0)
            {
              LODWORD(v19) = v37 - v36;
              if (v37 >= v36)
              {
                uint64_t v38 = v14 - 3;
                if (v38)
                {
                  unint64_t v39 = (unsigned __int8 *)v42 + 3;
                  while (1)
                  {
                    unsigned int v40 = *v39 - 48;
                    if (v40 > 9) {
                      goto LABEL_43;
                    }
                    uint64_t v41 = 10 * v19;
                    if ((v41 & 0xFFFFFFFF00000000) != 0) {
                      goto LABEL_43;
                    }
                    LODWORD(v19) = v41 - v40;
                    if (v41 < v40) {
                      goto LABEL_43;
                    }
                    char v20 = 0;
                    ++v39;
                    if (!--v38) {
                      goto LABEL_47;
                    }
                  }
                }
LABEL_46:
                char v20 = 0;
                goto LABEL_47;
              }
            }
          }
        }
      }
      goto LABEL_43;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_25C25F54C(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8EE80];
  uint64_t v3 = a1 + 64;
  uint64_t v34 = MEMORY[0x263F8EE80];
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(63 - v4) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  if (!v6) {
    goto LABEL_8;
  }
LABEL_5:
  unint64_t v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v11 = v10 | (v9 << 6);
  while (1)
  {
    uint64_t v12 = *(void *)(a1 + 56) + 8 * v11;
    if (*(unsigned char *)(v12 + 4))
    {
      if (v6) {
        goto LABEL_5;
      }
    }
    else
    {
      long long v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      int v20 = *(_DWORD *)v12;
      unint64_t v21 = *(void *)(v2 + 16);
      int v33 = v20;
      if (*(void *)(v2 + 24) <= v21)
      {
        uint64_t v22 = v21 + 1;
        swift_bridgeObjectRetain();
        sub_25C26054C(v22, 1);
        uint64_t v2 = v34;
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      sub_25C274EF0();
      sub_25C274940();
      uint64_t result = sub_25C274F10();
      uint64_t v23 = v2 + 64;
      uint64_t v24 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v2 + 64 + 8 * (v25 >> 6))) == 0)
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v24) >> 6;
        while (++v26 != v29 || (v28 & 1) == 0)
        {
          BOOL v30 = v26 == v29;
          if (v26 == v29) {
            unint64_t v26 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v23 + 8 * v26);
          if (v31 != -1)
          {
            unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
            goto LABEL_37;
          }
        }
        goto LABEL_41;
      }
      unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v2 + 64 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_37:
      *(void *)(v23 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
      uint64_t v32 = (void *)(*(void *)(v2 + 48) + 16 * v27);
      *uint64_t v32 = v18;
      v32[1] = v19;
      *(_DWORD *)(*(void *)(v2 + 56) + 4 * v27) = v33;
      ++*(void *)(v2 + 16);
      if (v6) {
        goto LABEL_5;
      }
    }
LABEL_8:
    int64_t v13 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v13 >= v7) {
      goto LABEL_39;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    int64_t v15 = v9 + 1;
    if (!v14)
    {
      int64_t v15 = v9 + 2;
      if (v9 + 2 >= v7) {
        goto LABEL_39;
      }
      unint64_t v14 = *(void *)(v3 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v9 + 3;
        if (v9 + 3 >= v7) {
          goto LABEL_39;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v9 + 4;
          if (v9 + 4 >= v7) {
            goto LABEL_39;
          }
          unint64_t v14 = *(void *)(v3 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v11 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v9 = v15;
  }
  int64_t v16 = v9 + 5;
  if (v9 + 5 >= v7)
  {
LABEL_39:
    sub_25C24AC60();
    return v2;
  }
  unint64_t v14 = *(void *)(v3 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v9 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v7) {
      goto LABEL_39;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_23;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

void *sub_25C25F834(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B350158);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25C25F89C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_25C2749B0();
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
    uint64_t v5 = MEMORY[0x261182BA0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_25C25F918(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5991C8);
  char v37 = a2;
  uint64_t v6 = sub_25C274DC0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          char v3 = v35;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    BOOL v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25C274EF0();
    sub_25C274940();
    uint64_t result = sub_25C274F10();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v3 = v35;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

uint64_t sub_25C25FC20(uint64_t a1, char a2)
{
  return sub_25C25FF38(a1, a2, &qword_26A5991E8);
}

uint64_t sub_25C25FC2C(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5991D8);
  uint64_t v6 = sub_25C274DC0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              char v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_25C25AFA8(v24, v35);
      }
      else
      {
        sub_25C24AB68((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_25C274EF0();
      sub_25C274940();
      uint64_t result = sub_25C274F10();
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
            goto LABEL_40;
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
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_25C25AFA8(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

uint64_t sub_25C25FF2C(uint64_t a1, char a2)
{
  return sub_25C25FF38(a1, a2, &qword_26A5991C0);
}

uint64_t sub_25C25FF38(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v38 = a2;
  uint64_t v7 = sub_25C274DC0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v37 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  uint64_t v35 = v3;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v36) {
      break;
    }
    uint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v36) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    BOOL v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v38 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25C274EF0();
    sub_25C274940();
    uint64_t result = sub_25C274F10();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v35;
  uint64_t v23 = (void *)(v6 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_25C260240(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5991B0);
  char v37 = a2;
  uint64_t v6 = sub_25C274DC0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          char v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    char v32 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25C274EF0();
    sub_25C274940();
    uint64_t result = sub_25C274F10();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(unsigned char *)(*(void *)(v7 + 56) + v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v3 = v34;
  int64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

uint64_t sub_25C26054C(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FFC0);
  char v37 = a2;
  uint64_t v6 = sub_25C274DC0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          char v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    int v32 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25C274EF0();
    sub_25C274940();
    uint64_t result = sub_25C274F10();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(_DWORD *)(*(void *)(v7 + 56) + 4 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v3 = v34;
  int64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

unint64_t sub_25C260858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25C274E70() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25C274E70() & 1) == 0);
    }
  }
  return v6;
}

unsigned __int8 *sub_25C26093C(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_25C260B24(a1, a2, a3);
}

unsigned __int8 *sub_25C260954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25C2749C0();
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
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_25C261020();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_25C274D30();
  }
LABEL_7:
  BOOL v11 = sub_25C260B24(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_25C260A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25C2749C0();
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
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_25C261020();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_25C274D30();
  }
LABEL_7:
  BOOL v11 = sub_25C260DA0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_25C260B24(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
            uint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
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
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
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
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  unint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

unsigned __int8 *sub_25C260DA0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          char v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
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
            unint64_t v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__CFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
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
            unint64_t v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__CFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            unint64_t v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (v14 < v15) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25C261020()
{
  unint64_t v0 = sub_25C2749D0();
  uint64_t v4 = sub_25C2610A0(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25C2610A0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_25C2611F8(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_25C25F834(v9, 0);
      unint64_t v12 = sub_25C2612F8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_25C274D30();
LABEL_4:
        JUMPOUT(0x261182B50);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x261182B50](v11 + 4, v11[2]);
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
    return MEMORY[0x261182B50]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_25C2611F8(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_25C25F89C(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_25C25F89C(v6, v5, v4);
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

unint64_t sub_25C2612F8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    _OWORD v9[2] = a6;
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
      uint64_t result = sub_25C25F89C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_25C2749A0();
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
          uint64_t result = sub_25C274D30();
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
    uint64_t result = sub_25C25F89C(v12, a6, a7);
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
    unint64_t v12 = sub_25C274970();
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

unint64_t sub_25C26150C(uint64_t a1, uint64_t a2)
{
  sub_25C274EF0();
  sub_25C274940();
  uint64_t v4 = sub_25C274F10();
  return sub_25C260858(a1, a2, v4);
}

uint64_t sub_25C261584(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5991E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static ACHAchievementProgressUpdate.filterForNextEarnableProgressUpdates(from:templates:)(uint64_t a1, uint64_t a2)
{
  if ((a1 & 0xC000000000000001) == 0)
  {
    uint64_t v25 = swift_bridgeObjectRetain();
    uint64_t v3 = sub_25C261948(v25);
    goto LABEL_35;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v29 = MEMORY[0x263F8EE88];
  swift_bridgeObjectRetain();
  sub_25C274C70();
  if (!sub_25C274CC0()) {
    goto LABEL_34;
  }
  uint64_t v27 = a2;
  sub_25C2625D4();
  do
  {
    swift_dynamicCast();
    id v10 = objc_msgSend(v28, sel_templateUniqueName);
    sub_25C274910();

    sub_25C249214();
    uint64_t v11 = (void *)sub_25C274C00();
    swift_bridgeObjectRelease();
    if (!v11[2])
    {
      swift_bridgeObjectRelease();
LABEL_21:

      continue;
    }
    uint64_t v13 = v11[4];
    uint64_t v12 = v11[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_25C2746D0();
    if (v13 == sub_25C274650() && v12 == v14) {
      goto LABEL_16;
    }
    char v16 = sub_25C274E70();
    swift_bridgeObjectRelease();
    if (v16) {
      goto LABEL_17;
    }
    if (v13 == sub_25C274640() && v12 == v17)
    {
LABEL_16:
      swift_bridgeObjectRelease();
LABEL_17:
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
    char v24 = sub_25C274E70();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v24 & 1) == 0) {
      goto LABEL_21;
    }
LABEL_18:
    uint64_t v18 = v29;
    unint64_t v19 = *(void *)(v29 + 16);
    if (*(void *)(v29 + 24) <= v19)
    {
      sub_25C24B6E8(v19 + 1);
      uint64_t v18 = v29;
    }
    uint64_t result = sub_25C274B90();
    uint64_t v5 = v18 + 56;
    uint64_t v6 = -1 << *(unsigned char *)(v18 + 32);
    unint64_t v7 = result & ~v6;
    unint64_t v8 = v7 >> 6;
    if (((-1 << v7) & ~*(void *)(v18 + 56 + 8 * (v7 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v7) & ~*(void *)(v18 + 56 + 8 * (v7 >> 6)))) | v7 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v20 = 0;
      unint64_t v21 = (unint64_t)(63 - v6) >> 6;
      do
      {
        if (++v8 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        BOOL v22 = v8 == v21;
        if (v8 == v21) {
          unint64_t v8 = 0;
        }
        v20 |= v22;
        uint64_t v23 = *(void *)(v5 + 8 * v8);
      }
      while (v23 == -1);
      unint64_t v9 = __clz(__rbit64(~v23)) + (v8 << 6);
    }
    *(void *)(v5 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    *(void *)(*(void *)(v18 + 48) + 8 * v9) = v28;
    ++*(void *)(v18 + 16);
  }
  while (sub_25C274CC0());
  uint64_t v3 = v29;
  a2 = v27;
LABEL_34:
  swift_release();
LABEL_35:
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_25C2623BC(v3, a2);
  swift_bridgeObjectRelease();
  return v26;
}

uint64_t sub_25C261948(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x263EF8340];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_25C261AAC((uint64_t)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v4, v2);
    swift_release();
    if (v1) {
      swift_willThrow();
    }
  }
  else
  {
    unint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v6 = sub_25C261AAC((uint64_t)v7, v4, v2);
    swift_release();
    MEMORY[0x261183790](v7, -1, -1);
  }
  return v6;
}

uint64_t sub_25C261AAC(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = a2;
  uint64_t v27 = (unint64_t *)result;
  uint64_t v28 = 0;
  int64_t v3 = 0;
  uint64_t v6 = *(void *)(a3 + 56);
  uint64_t v4 = a3 + 56;
  uint64_t v5 = v6;
  uint64_t v7 = 1 << *(unsigned char *)(v4 - 24);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & v5;
  uint64_t v29 = v4;
  int64_t v30 = (unint64_t)(v7 + 63) >> 6;
  while (v9)
  {
    unint64_t v11 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v12 = v11 | (v3 << 6);
LABEL_21:
    id v16 = *(id *)(*(void *)(a3 + 48) + 8 * v12);
    id v17 = objc_msgSend(v16, sel_templateUniqueName, v26);
    sub_25C274910();

    sub_25C249214();
    uint64_t v18 = (void *)sub_25C274C00();
    swift_bridgeObjectRelease();
    if (v18[2])
    {
      uint64_t v19 = v18[4];
      uint64_t v20 = v18[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_25C2746D0();
      if (v19 == sub_25C274650() && v20 == v21)
      {
LABEL_29:

        swift_bridgeObjectRelease();
LABEL_32:
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_33;
      }
      char v23 = sub_25C274E70();
      swift_bridgeObjectRelease();
      if (v23)
      {

        goto LABEL_32;
      }
      if (v19 == sub_25C274640() && v20 == v24) {
        goto LABEL_29;
      }
      char v10 = sub_25C274E70();

      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v10)
      {
LABEL_33:
        *(unint64_t *)((char *)v27 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        if (__OFADD__(v28++, 1))
        {
          __break(1u);
LABEL_36:
          swift_retain();
          return sub_25C261DD4(v27, v26, v28, a3, &qword_26B34FFB8);
        }
      }
    }
    else
    {

      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v13 >= v30) {
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v29 + 8 * v13);
  ++v3;
  if (v14) {
    goto LABEL_20;
  }
  int64_t v3 = v13 + 1;
  if (v13 + 1 >= v30) {
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v29 + 8 * v3);
  if (v14) {
    goto LABEL_20;
  }
  int64_t v3 = v13 + 2;
  if (v13 + 2 >= v30) {
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v29 + 8 * v3);
  if (v14)
  {
LABEL_20:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v3 << 6);
    goto LABEL_21;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v30) {
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v29 + 8 * v15);
  if (v14)
  {
    int64_t v3 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v3 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v3 >= v30) {
      goto LABEL_36;
    }
    unint64_t v14 = *(void *)(v29 + 8 * v3);
    ++v15;
    if (v14) {
      goto LABEL_20;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_25C261DC8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25C261DD4(a1, a2, a3, a4, &qword_26B34FF30);
}

uint64_t sub_25C261DD4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a4;
  if (!a3)
  {
    uint64_t v10 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v10;
  }
  uint64_t v6 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v5;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t result = sub_25C274CF0();
  uint64_t v10 = result;
  uint64_t v29 = a1;
  if (a2 < 1) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = *a1;
  }
  uint64_t v12 = 0;
  uint64_t v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    uint64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_39;
    }
    if (v16 >= a2) {
      goto LABEL_36;
    }
    unint64_t v17 = v29[v16];
    ++v12;
    if (!v17)
    {
      uint64_t v12 = v16 + 1;
      if (v16 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v17 = v29[v12];
      if (!v17)
      {
        uint64_t v12 = v16 + 2;
        if (v16 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v17 = v29[v12];
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v5 + 48) + 8 * v15);
    uint64_t result = sub_25C274B90();
    uint64_t v20 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v13 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v13 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v13 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v13 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(*(void *)(v10 + 48) + 8 * v23) = v19;
    ++*(void *)(v10 + 16);
    if (__OFSUB__(v6--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v6) {
      goto LABEL_36;
    }
  }
  uint64_t v18 = v16 + 3;
  if (v18 >= a2) {
    goto LABEL_36;
  }
  unint64_t v17 = v29[v18];
  if (v17)
  {
    uint64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= a2) {
      goto LABEL_36;
    }
    unint64_t v17 = v29[v12];
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

void sub_25C262030(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v16 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v16 >= v11) {
      goto LABEL_24;
    }
    unint64_t v17 = *(void *)(v7 + 8 * v16);
    ++v6;
    if (!v17)
    {
      int64_t v6 = v16 + 1;
      if (v16 + 1 >= v11) {
        goto LABEL_24;
      }
      unint64_t v17 = *(void *)(v7 + 8 * v6);
      if (!v17)
      {
        int64_t v6 = v16 + 2;
        if (v16 + 2 >= v11) {
          goto LABEL_24;
        }
        unint64_t v17 = *(void *)(v7 + 8 * v6);
        if (!v17) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v10 = (v17 - 1) & v17;
    unint64_t v13 = __clz(__rbit64(v17)) + (v6 << 6);
LABEL_5:
    id v14 = *(id *)(*(void *)(a3 + 48) + 8 * v13);
    char v15 = ACHAchievementProgressUpdate.isNextEarnable(for:)(a4);

    if (v15)
    {
      *(unint64_t *)((char *)a1 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      if (__OFADD__(v22++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        sub_25C261DD4(a1, a2, v22, a3, &qword_26B34FFB8);
        return;
      }
    }
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v11) {
    goto LABEL_24;
  }
  unint64_t v17 = *(void *)(v7 + 8 * v18);
  if (v17)
  {
    int64_t v6 = v18;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v6 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v6 >= v11) {
      goto LABEL_24;
    }
    unint64_t v17 = *(void *)(v7 + 8 * v6);
    ++v18;
    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
}

uint64_t sub_25C2621F0(uint64_t a1, uint64_t a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v15 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    sub_25C262030((void *)((char *)v15 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, a1, a2);
    uint64_t v11 = v10;
    swift_release();
    swift_bridgeObjectRelease();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    unint64_t v12 = (void *)swift_slowAlloc();
    bzero(v12, v8);
    swift_bridgeObjectRetain();
    sub_25C262030((unint64_t *)v12, v7, a1, a2);
    uint64_t v11 = v13;
    swift_release();
    swift_bridgeObjectRelease();
    MEMORY[0x261183790](v12, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v11;
}

uint64_t sub_25C2623BC(uint64_t a1, uint64_t a2)
{
  if ((a1 & 0xC000000000000001) == 0) {
    return sub_25C2621F0(a1, a2);
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v17 = MEMORY[0x263F8EE88];
  swift_bridgeObjectRetain();
  sub_25C274C70();
  if (sub_25C274CC0())
  {
    sub_25C2625D4();
    do
    {
      swift_dynamicCast();
      if (ACHAchievementProgressUpdate.isNextEarnable(for:)(a2))
      {
        uint64_t v4 = v17;
        unint64_t v5 = *(void *)(v17 + 16);
        if (*(void *)(v17 + 24) <= v5)
        {
          sub_25C24B6E8(v5 + 1);
          uint64_t v4 = v17;
        }
        uint64_t result = sub_25C274B90();
        uint64_t v7 = v4 + 56;
        uint64_t v8 = -1 << *(unsigned char *)(v4 + 32);
        unint64_t v9 = result & ~v8;
        unint64_t v10 = v9 >> 6;
        if (((-1 << v9) & ~*(void *)(v4 + 56 + 8 * (v9 >> 6))) != 0)
        {
          unint64_t v11 = __clz(__rbit64((-1 << v9) & ~*(void *)(v4 + 56 + 8 * (v9 >> 6)))) | v9 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v12 = 0;
          unint64_t v13 = (unint64_t)(63 - v8) >> 6;
          do
          {
            if (++v10 == v13 && (v12 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v14 = v10 == v13;
            if (v10 == v13) {
              unint64_t v10 = 0;
            }
            v12 |= v14;
            uint64_t v15 = *(void *)(v7 + 8 * v10);
          }
          while (v15 == -1);
          unint64_t v11 = __clz(__rbit64(~v15)) + (v10 << 6);
        }
        *(void *)(v7 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
        *(void *)(*(void *)(v4 + 48) + 8 * v11) = v16;
        ++*(void *)(v4 + 16);
      }
      else
      {
      }
    }
    while (sub_25C274CC0());
    uint64_t v3 = v17;
  }
  swift_bridgeObjectRelease();
  swift_release();
  return v3;
}

unint64_t sub_25C2625D4()
{
  unint64_t result = qword_26A599018;
  if (!qword_26A599018)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A599018);
  }
  return result;
}

uint64_t dispatch thunk of AppInstalling.onProgressUpdated.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppInstalling.onProgressUpdated.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of AppInstalling.onProgressUpdated.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AppInstalling.requestInstall()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

BOOL static AppInstallError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AppInstallError.hash(into:)()
{
  return sub_25C274F00();
}

uint64_t AppInstallError.hashValue.getter()
{
  return sub_25C274F10();
}

unint64_t sub_25C2626F0()
{
  unint64_t result = qword_26A5991F0;
  if (!qword_26A5991F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5991F0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AppInstallError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AppInstallError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x25C2628A4);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppInstallError()
{
  return &type metadata for AppInstallError;
}

uint64_t sub_25C2628DC()
{
  uint64_t result = sub_25C274B10();
  qword_26A5991F8 = v1;
  return result;
}

double static AppInstallConstants.installRequestTimeout.getter()
{
  if (qword_26A598C48 != -1) {
    swift_once();
  }
  return *(double *)&qword_26A5991F8;
}

uint64_t static AppInstallConstants.appStoreURLProtocol.getter()
{
  return 0x7070612D736D7469;
}

ValueMetadata *type metadata accessor for AppInstallConstants()
{
  return &type metadata for AppInstallConstants;
}

uint64_t sub_25C26297C@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)(uint64_t a1, double *a2)@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    BOOL v7 = sub_25C26612C;
  }
  else
  {
    BOOL v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(uint64_t, double *))v6;
  return sub_25C25E33C(v4);
}

uint64_t sub_25C262A10(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_25C2660F4;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *a2;
  swift_beginAccess();
  uint64_t v8 = *(void *)(v7 + 16);
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v5;
  sub_25C25E33C(v3);
  return sub_25C25E32C(v8);
}

uint64_t sub_25C262ACC()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  sub_25C25E33C(v1);
  return v1;
}

uint64_t sub_25C262B1C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 16);
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return sub_25C25E32C(v5);
}

uint64_t (*sub_25C262B70())()
{
  return j__swift_endAccess;
}

uint64_t SystemAppInstaller.__allocating_init(bundleIdentifier:installRequestProvider:recordObserverProvider:timerProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = *(void *)(a3 + 24);
  uint64_t v29 = *(void *)(a3 + 32);
  uint64_t v30 = v8;
  uint64_t v10 = __swift_mutable_project_boxed_opaque_existential_1(a3, v9);
  MEMORY[0x270FA5388](v10);
  char v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v13 + 16))(v12);
  uint64_t v14 = *(void *)(a4 + 24);
  uint64_t v28 = *(void *)(a4 + 32);
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1(a4, v14);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v18 + 16))(v17);
  uint64_t v19 = *(void *)(a5 + 24);
  uint64_t v20 = *(void *)(a5 + 32);
  uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1(a5, v19);
  MEMORY[0x270FA5388](v21);
  unint64_t v23 = (char *)&v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v24 + 16))(v23);
  uint64_t v25 = sub_25C265730(v31, v32, (uint64_t)v12, (uint64_t)v17, (uint64_t)v23, v30, v14, v9, v19, v28, v29, v20);
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v25;
}

uint64_t SystemAppInstaller.init(bundleIdentifier:installRequestProvider:recordObserverProvider:timerProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v30 = a2;
  uint64_t v8 = *(void *)(a3 + 24);
  uint64_t v28 = *(void *)(a3 + 32);
  uint64_t v29 = a1;
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1(a3, v8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  uint64_t v13 = *(void *)(a4 + 24);
  uint64_t v27 = *(void *)(a4 + 32);
  uint64_t v14 = __swift_mutable_project_boxed_opaque_existential_1(a4, v13);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v17 + 16))(v16);
  uint64_t v18 = *(void *)(a5 + 24);
  uint64_t v19 = *(void *)(a5 + 32);
  uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1(a5, v18);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v23 + 16))(v22);
  uint64_t v24 = sub_25C265730(v29, v30, (uint64_t)v11, (uint64_t)v16, (uint64_t)v22, v31, v13, v8, v18, v27, v28, v19);
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v24;
}

uint64_t sub_25C2630D8(void *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_25C263B90(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_25C263138(uint64_t a1, uint64_t a2)
{
  sub_25C266010(a2, (uint64_t)v4);
  swift_beginAccess();
  sub_25C26671C((uint64_t)v4, a1 + 64);
  return swift_endAccess();
}

uint64_t sub_25C2631A4(void *a1, double a2)
{
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v5, v6);
  if ((v7 & 1) != 0 || a2 >= 1.0)
  {
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
    char v14 = 2;
    MEMORY[0x270FA5388](v7);
    sub_25C2745E0();
    sub_25C2659DC((uint64_t)v12);
    uint64_t result = swift_beginAccess();
    uint64_t v9 = *(void (**)(void *, __n128))(v2 + 16);
    if (!v9) {
      return result;
    }
    swift_retain();
    v11.n128_u64[0] = 1.0;
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t result = swift_beginAccess();
    uint64_t v9 = *(void (**)(void *, __n128))(v2 + 16);
    if (!v9) {
      return result;
    }
    swift_retain();
    uint64_t v10 = a1;
    v11.n128_f64[0] = a2;
  }
  v9(v10, v11);
  return sub_25C25E32C((uint64_t)v9);
}

uint64_t sub_25C263318@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A599218);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A599200);
  uint64_t v9 = *(void *)(v27 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v27);
  uint64_t v26 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v25 - v12;
  uint64_t v14 = *(void *)(v1 + 56);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v14 + 40))(ObjectType, v14);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  unint64_t v16 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v17 + v16, v6, v2);
  uint64_t v18 = (uint64_t (**)())(v17 + ((v4 + v16 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v18 = sub_25C263664;
  v18[1] = 0;
  sub_25C274590();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  uint64_t v20 = v26;
  uint64_t v19 = v27;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v26, v13, v27);
  unint64_t v21 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v22 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v22 + v21, v20, v19);
  uint64_t v23 = (uint64_t (**)(void *))(v22 + ((v10 + v21 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v23 = sub_25C2636F8;
  v23[1] = 0;
  sub_25C274590();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v13, v19);
}

uint64_t sub_25C263664()
{
  sub_25C25E2D8();
  uint64_t v0 = swift_allocError();
  *uint64_t v1 = 0;
  *(void *)(swift_allocObject() + 16) = v0;
  return sub_25C2745A0();
}

uint64_t sub_25C2636F8(void *a1)
{
  sub_25C266584();
  if (sub_25C273FB0()) {
    return sub_25C2745C0();
  }
  *(void *)(swift_allocObject() + 16) = a1;
  id v3 = a1;
  return sub_25C2745A0();
}

uint64_t sub_25C2637B0()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_25C263808();
    return swift_release();
  }
  return result;
}

uint64_t sub_25C263808()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25C274840();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C2745E0();
  if (v31) {
    return sub_25C2659DC((uint64_t)&v28);
  }
  uint64_t v7 = v28;
  uint64_t v25 = 0;
  uint64_t v26 = (void (*)(long long *))*((void *)&v28 + 1);
  uint64_t v8 = v29;
  sub_25C274740();
  swift_retain();
  uint64_t v9 = sub_25C274830();
  os_log_type_t v10 = sub_25C274B40();
  int v11 = v10;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v24 = v7;
    uint64_t v13 = v12;
    uint64_t v22 = swift_slowAlloc();
    *(void *)&long long v28 = v22;
    *(_DWORD *)uint64_t v13 = 141558274;
    uint64_t v27 = 1752392040;
    sub_25C274BE0();
    *(_WORD *)(v13 + 12) = 2080;
    v20[1] = v13 + 14;
    int v21 = v11;
    uint64_t v23 = v8;
    uint64_t v14 = v1[4];
    unint64_t v15 = v1[5];
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_25C24A1D8(v14, v15, (uint64_t *)&v28);
    sub_25C274BE0();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C23E000, v9, (os_log_type_t)v21, "Failed to get a status update for install %{mask.hash}s", (uint8_t *)v13, 0x16u);
    uint64_t v16 = v22;
    swift_arrayDestroy();
    MEMORY[0x261183790](v16, -1, -1);
    MEMORY[0x261183790](v13, -1, -1);
  }
  else
  {

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_project_boxed_opaque_existential_1(v1 + 25, v1[28]);
  uint64_t v17 = sub_25C274710();
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  char v31 = 2;
  MEMORY[0x270FA5388](v17);
  v20[-2] = v1;
  v20[-1] = &v28;
  sub_25C2745E0();
  sub_25C2659DC((uint64_t)&v28);
  sub_25C25E2D8();
  uint64_t v18 = swift_allocError();
  *uint64_t v19 = 2;
  *(void *)&long long v28 = v18;
  char v31 = 1;
  v26(&v28);
  swift_unknownObjectRelease();
  swift_release();
  return sub_25C25E278((uint64_t)&v28);
}

uint64_t sub_25C263B90(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25C274840();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C2745E0();
  sub_25C266010((uint64_t)v45, (uint64_t)&v42);
  uint64_t v8 = v42;
  if (v44)
  {
    if (v44 == 1)
    {
      sub_25C266048(&v42, (uint64_t)v40);
      uint64_t v9 = a1[3];
      uint64_t v10 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v9);
      int v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 48))(v9, v10);
      if (v11)
      {
        uint64_t v12 = v11;
        objc_msgSend(v11, sel_fractionCompleted);
        double v14 = v13;

        sub_25C2667B8((uint64_t)a1, (uint64_t)v37);
      }
      else
      {
        sub_25C2667B8((uint64_t)a1, (uint64_t)v37);
        uint64_t v26 = v38;
        uint64_t v27 = v39;
        __swift_project_boxed_opaque_existential_1(v37, v38);
        if ((*(uint64_t (**)(uint64_t, uint64_t))(v27 + 24))(v26, v27)) {
          double v14 = 1.0;
        }
        else {
          double v14 = 0.0;
        }
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
      sub_25C2631A4(v40, v14);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    }
  }
  else
  {
    uint64_t v34 = v5;
    unint64_t v15 = (void (*)(uint64_t *))*((void *)&v42 + 1);
    uint64_t v16 = v43;
    sub_25C274740();
    swift_retain();
    uint64_t v17 = sub_25C274830();
    os_log_type_t v18 = sub_25C274B50();
    int v33 = v18;
    BOOL v19 = os_log_type_enabled(v17, v18);
    uint64_t v36 = v15;
    uint64_t v35 = 0;
    if (v19)
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v31 = v16;
      uint64_t v21 = v20;
      uint64_t v30 = swift_slowAlloc();
      v40[0] = v30;
      *(_DWORD *)uint64_t v21 = 141558274;
      v37[0] = 1752392040;
      sub_25C274BE0();
      *(_WORD *)(v21 + 12) = 2080;
      v29[1] = v21 + 14;
      uint64_t v32 = v8;
      uint64_t v22 = v2[4];
      unint64_t v23 = v2[5];
      swift_bridgeObjectRetain();
      v37[0] = sub_25C24A1D8(v22, v23, v40);
      sub_25C274BE0();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v17, (os_log_type_t)v33, "Requested install %{mask.hash}s appeared!", (uint8_t *)v21, 0x16u);
      uint64_t v24 = v30;
      swift_arrayDestroy();
      MEMORY[0x261183790](v24, -1, -1);
      MEMORY[0x261183790](v21, -1, -1);
    }
    else
    {

      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v34 + 8))(v7, v4);
    __swift_project_boxed_opaque_existential_1(v2 + 25, v2[28]);
    sub_25C274710();
    uint64_t v25 = sub_25C2667B8((uint64_t)a1, (uint64_t)v40);
    char v41 = 1;
    MEMORY[0x270FA5388](v25);
    v29[-2] = v2;
    v29[-1] = v40;
    sub_25C2745E0();
    sub_25C2659DC((uint64_t)v40);
    sub_25C2667B8((uint64_t)a1, (uint64_t)v40);
    char v41 = 0;
    v36(v40);
    sub_25C25E278((uint64_t)v40);
    sub_25C263B90(a1);
    swift_unknownObjectRelease();
    swift_release();
  }
  return sub_25C2659DC((uint64_t)v45);
}

uint64_t SystemAppInstaller.deinit()
{
  sub_25C25E32C(*(void *)(v0 + 16));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_25C2659DC(v0 + 64);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  __swift_destroy_boxed_opaque_existential_1(v0 + 200);
  return v0;
}

uint64_t SystemAppInstaller.__deallocating_deinit()
{
  sub_25C25E32C(*(void *)(v0 + 16));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_25C2659DC(v0 + 64);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  __swift_destroy_boxed_opaque_existential_1(v0 + 200);
  return swift_deallocClassInstance();
}

uint64_t SystemAppInstaller.requestInstall()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v34 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A599200);
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  uint64_t v4 = *(void *)(v32 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v32 - v7;
  uint64_t v9 = sub_25C274840();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C2745E0();
  if (v38 == 2
    && (int8x16_t v13 = vorrq_s8(v36, v37),
        !(*(void *)&vorr_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)) | v35)))
  {
    sub_25C2659DC((uint64_t)&v35);
    sub_25C274740();
    sub_25C274820();
    uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    uint64_t v35 = 1;
    int8x16_t v36 = 0u;
    int8x16_t v37 = 0u;
    char v38 = 2;
    MEMORY[0x270FA5388](v17);
    *(&v32 - 2) = (uint64_t)v1;
    *(&v32 - 1) = (uint64_t)&v35;
    sub_25C2745E0();
    sub_25C2659DC((uint64_t)&v35);
    uint64_t v18 = v1[18];
    uint64_t v19 = v1[19];
    __swift_project_boxed_opaque_existential_1(v1 + 15, v18);
    uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v18, v19);
    uint64_t v22 = v21;
    uint64_t v23 = v1[4];
    uint64_t v24 = v1[5];
    swift_bridgeObjectRetain();
    sub_25C263318((uint64_t)v8);
    uint64_t v25 = (void *)swift_allocObject();
    v25[2] = v20;
    v25[3] = v22;
    void v25[4] = v23;
    v25[5] = v24;
    v25[6] = v2;
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = sub_25C265A98;
    *(void *)(v26 + 24) = v25;
    uint64_t v28 = v32;
    uint64_t v27 = v33;
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v6, v8, v33);
    unint64_t v29 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    uint64_t v30 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v28 + 32))(v30 + v29, v6, v27);
    uint64_t v31 = (uint64_t (**)())(v30 + ((v4 + v29 + 7) & 0xFFFFFFFFFFFFFFF8));
    *uint64_t v31 = sub_25C265AA8;
    v31[1] = (uint64_t (*)())v26;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A599160);
    sub_25C274590();
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v8, v27);
  }
  else
  {
    sub_25C2659DC((uint64_t)&v35);
    sub_25C25E2D8();
    uint64_t v14 = swift_allocError();
    *unint64_t v15 = 1;
    *(void *)(swift_allocObject() + 16) = v14;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A599160);
    return sub_25C2745A0();
  }
}

uint64_t sub_25C2645DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = a5;
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A599160);
  return sub_25C274590();
}

uint64_t sub_25C264698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v35 = a2;
  uint64_t v36 = a7;
  uint64_t v33 = a5;
  uint64_t v34 = a1;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A599200);
  uint64_t v10 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25C274840();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C274740();
  uint64_t v17 = sub_25C274830();
  os_log_type_t v18 = sub_25C274B50();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = a3;
    uint64_t v20 = a4;
    uint64_t v21 = v10;
    uint64_t v22 = a6;
    uint64_t v23 = v19;
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_25C23E000, v17, v18, "App Record Observation started, requesting install!", v19, 2u);
    uint64_t v24 = v23;
    a6 = v22;
    uint64_t v10 = v21;
    a4 = v20;
    a3 = v32;
    MEMORY[0x261183790](v24, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v38[0] = v33;
  v38[1] = a6;
  (*(void (**)(void *, uint64_t, uint64_t))(a4 + 8))(v38, a3, a4);
  uint64_t v25 = (void *)swift_allocObject();
  uint64_t v26 = v35;
  uint64_t v27 = v34;
  v25[2] = v36;
  v25[3] = v27;
  void v25[4] = v26;
  swift_retain();
  swift_retain();
  uint64_t v28 = v37;
  unint64_t v29 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_25C2745B0();
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = sub_25C26623C;
  *(void *)(v30 + 24) = v25;
  swift_retain();
  v29(sub_25C26624C, v30);
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v28);
}

uint64_t sub_25C264990(uint64_t a1, void *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v8 = sub_25C274840();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v41 - v13;
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    uint64_t v45 = v9;
    id v15 = *(id *)a1;
    id v16 = *(id *)a1;
    sub_25C274740();
    sub_25C2662D0(v15, 1);
    sub_25C2662D0(v15, 1);
    swift_retain();
    uint64_t v17 = sub_25C274830();
    os_log_type_t v18 = sub_25C274B40();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v43 = a4;
      uint64_t v20 = v19;
      uint64_t v42 = swift_slowAlloc();
      *(void *)&long long v50 = v42;
      *(_DWORD *)uint64_t v20 = 141558530;
      uint64_t v49 = 1752392040;
      sub_25C274BE0();
      *(_WORD *)(v20 + 12) = 2080;
      uint64_t v46 = a3;
      uint64_t v44 = v8;
      uint64_t v21 = a2[4];
      unint64_t v22 = a2[5];
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_25C24A1D8(v21, v22, (uint64_t *)&v50);
      sub_25C274BE0();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 22) = 2082;
      swift_getErrorValue();
      uint64_t v23 = MEMORY[0x2611830C0](v47, v48);
      uint64_t v49 = sub_25C24A1D8(v23, v24, (uint64_t *)&v50);
      a3 = v46;
      sub_25C274BE0();
      swift_bridgeObjectRelease();
      sub_25C2662DC(v15, 1);
      sub_25C2662DC(v15, 1);
      _os_log_impl(&dword_25C23E000, v17, v18, "Error requesting install for %{mask.hash}s: %{public}s", (uint8_t *)v20, 0x20u);
      uint64_t v25 = v42;
      swift_arrayDestroy();
      MEMORY[0x261183790](v25, -1, -1);
      MEMORY[0x261183790](v20, -1, -1);

      uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v14, v44);
    }
    else
    {
      swift_release();
      sub_25C2662DC(v15, 1);
      sub_25C2662DC(v15, 1);

      uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v14, v8);
    }
    uint64_t v52 = 0;
    long long v50 = 0u;
    long long v51 = 0u;
    char v53 = 2;
    MEMORY[0x270FA5388](v26);
    *(&v41 - 2) = (uint64_t)a2;
    *(&v41 - 1) = (uint64_t)&v50;
    sub_25C2745E0();
    sub_25C2659DC((uint64_t)&v50);
    *(void *)&long long v50 = v15;
    char v53 = 1;
    id v36 = v15;
    a3(&v50);
    sub_25C2662DC(v15, 1);
    return sub_25C25E278((uint64_t)&v50);
  }
  else
  {
    uint64_t v46 = a3;
    sub_25C274740();
    swift_retain();
    uint64_t v27 = sub_25C274830();
    os_log_type_t v28 = sub_25C274B50();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v45 = v9;
      uint64_t v30 = v29;
      uint64_t v43 = swift_slowAlloc();
      *(void *)&long long v50 = v43;
      *(_DWORD *)uint64_t v30 = 141558274;
      uint64_t v49 = 1752392040;
      sub_25C274BE0();
      *(_WORD *)(v30 + 12) = 2080;
      uint64_t v44 = v8;
      uint64_t v31 = a4;
      uint64_t v32 = a2[4];
      unint64_t v33 = a2[5];
      swift_bridgeObjectRetain();
      uint64_t v34 = v32;
      a4 = v31;
      uint64_t v49 = sub_25C24A1D8(v34, v33, (uint64_t *)&v50);
      sub_25C274BE0();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C23E000, v27, v28, "Sucessfully requested install with UUID: %{mask.hash}s", (uint8_t *)v30, 0x16u);
      uint64_t v35 = v43;
      swift_arrayDestroy();
      MEMORY[0x261183790](v35, -1, -1);
      MEMORY[0x261183790](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v45 + 8))(v12, v44);
    }
    else
    {

      swift_release();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    __swift_project_boxed_opaque_existential_1(a2 + 25, a2[28]);
    if (qword_26A598C48 != -1) {
      swift_once();
    }
    sub_25C266250();
    char v38 = (void *)sub_25C274B60();
    swift_allocObject();
    swift_weakInit();
    swift_retain();
    uint64_t v39 = sub_25C274700();

    uint64_t v40 = swift_release_n();
    *(void *)&long long v50 = v39;
    *((void *)&v50 + 1) = v46;
    *(void *)&long long v51 = a4;
    char v53 = 0;
    MEMORY[0x270FA5388](v40);
    *(&v41 - 2) = (uint64_t)a2;
    *(&v41 - 1) = (uint64_t)&v50;
    swift_retain();
    sub_25C2745E0();
    return sub_25C2659DC((uint64_t)&v50);
  }
}

uint64_t (*sub_25C26505C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25C2650B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  __swift_instantiateConcreteTypeFromMangledName(a6);
  uint64_t v13 = (void (*)(uint64_t, void *))sub_25C2745B0();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a4;
  void v14[3] = a5;
  v14[4] = a1;
  v14[5] = a2;
  swift_retain();
  swift_retain();
  v13(a8, v14);
  swift_release();
  return swift_release();
}

uint64_t sub_25C265170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A599200);
  uint64_t v9 = (void (*)(uint64_t (*)(uint64_t), void *))sub_25C2745B0();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a4;
  v10[5] = a5;
  swift_retain();
  swift_retain();
  v9(sub_25C266548, v10);
  swift_release();
  return swift_release();
}

uint64_t sub_25C26523C(void *a1, char a2, uint64_t (*a3)(void **), uint64_t a4, void (*a5)(void *))
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A599200);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v15 = a1;
    a5(a1);
    id v16 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_25C2745B0();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a3;
    *(void *)(v17 + 24) = a4;
    swift_retain();
    v16(sub_25C26624C, v17);
    swift_release();
    swift_release();
    sub_25C2662DC(a1, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    os_log_type_t v18 = a1;
    char v19 = 0;
    return a3(&v18);
  }
}

void sub_25C2653D8(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3, void (*a4)(uint64_t *), uint64_t a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A599200);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C266628(a1, (uint64_t)v20);
  if (v21)
  {
    uint64_t v13 = *(void **)&v20[0];
    uint64_t v18 = *(void *)&v20[0];
    char v19 = 1;
    id v14 = *(id *)&v20[0];
    a4(&v18);
  }
  else
  {
    sub_25C266048(v20, (uint64_t)&v18);
    a2(&v18);
    id v15 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_25C2745B0();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a4;
    *(void *)(v16 + 24) = a5;
    swift_retain();
    v15(sub_25C26624C, v16);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
  }
}

uint64_t sub_25C265598(void *a1, char a2, void (*a3)(uint64_t), uint64_t a4, void (*a5)(void *), uint64_t a6)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A599218);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  id v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v20[0] = a1;
    char v21 = 1;
    id v19 = a1;
    a5(v20);
    return sub_25C25E278((uint64_t)v20);
  }
  else
  {
    a3(v13);
    uint64_t v16 = (void (*)(uint64_t (*)(), uint64_t))sub_25C2745B0();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a5;
    *(void *)(v17 + 24) = a6;
    swift_retain();
    v16(sub_25C266178, v17);
    swift_release();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
}

uint64_t sub_25C265730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  v33[3] = a8;
  v33[4] = a11;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v33);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32))(boxed_opaque_existential_1, a3, a8);
  v32[3] = a7;
  v32[4] = a10;
  uint64_t v20 = __swift_allocate_boxed_opaque_existential_1(v32);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a7 - 8) + 32))(v20, a4, a7);
  v31[3] = a9;
  v31[4] = a12;
  char v21 = __swift_allocate_boxed_opaque_existential_1(v31);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a9 - 8) + 32))(v21, a5, a9);
  *(void *)(a6 + 16) = 0;
  *(void *)(a6 + 24) = 0;
  *(_OWORD *)(a6 + 64) = 0u;
  *(_OWORD *)(a6 + 80) = 0u;
  *(void *)(a6 + 96) = 0;
  *(unsigned char *)(a6 + 104) = 2;
  sub_25C274600();
  swift_allocObject();
  *(void *)(a6 + 112) = sub_25C2745F0();
  *(void *)(a6 + 32) = a1;
  *(void *)(a6 + 40) = a2;
  sub_25C2667B8((uint64_t)v33, a6 + 120);
  sub_25C2667B8((uint64_t)v32, a6 + 160);
  sub_25C2667B8((uint64_t)v31, a6 + 200);
  unint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a10 + 8);
  swift_bridgeObjectRetain();
  uint64_t v23 = v22(a1, a2, a7, a10);
  uint64_t v25 = v24;
  swift_bridgeObjectRelease();
  *(void *)(a6 + 48) = v23;
  *(void *)(a6 + 56) = v25;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v27 = swift_allocObject();
  swift_weakInit();
  os_log_type_t v28 = *(void (**)(uint64_t (*)(void *), uint64_t, uint64_t, uint64_t))(v25 + 16);
  swift_retain();
  v28(sub_25C26681C, v27, ObjectType, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  return a6;
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

uint64_t sub_25C2659DC(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C265A0C@<X0>(uint64_t a1@<X8>)
{
  return sub_25C266060(a1);
}

uint64_t sub_25C265A24()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_25C265A5C()
{
  return sub_25C241744(*(void **)(v0 + 16));
}

uint64_t sub_25C265A78()
{
  return sub_25C263138(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25C265A98()
{
  return sub_25C2645DC(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_25C265AA8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25C265AD0()
{
  return objectdestroy_8Tm((uint64_t *)&unk_26A599200);
}

uint64_t sub_25C265ADC(uint64_t a1, uint64_t a2)
{
  return sub_25C26631C(a1, a2, (uint64_t *)&unk_26A599200, (uint64_t)&unk_270992B70, (uint64_t)sub_25C26615C);
}

uint64_t type metadata accessor for SystemAppInstaller()
{
  return self;
}

uint64_t method lookup function for SystemAppInstaller(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SystemAppInstaller);
}

uint64_t dispatch thunk of SystemAppInstaller.onProgressUpdated.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of SystemAppInstaller.onProgressUpdated.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of SystemAppInstaller.onProgressUpdated.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of SystemAppInstaller.__allocating_init(bundleIdentifier:installRequestProvider:recordObserverProvider:timerProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t initializeBufferWithCopyOfBuffer for SystemAppInstaller.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SystemAppInstaller.State(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)(result + 40);
  if (v1 >= 2) {
    unsigned int v1 = *(_DWORD *)result + 2;
  }
  if (v1 == 1)
  {
    return __swift_destroy_boxed_opaque_existential_1(result);
  }
  else if (!v1)
  {
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for SystemAppInstaller.State(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 2) {
    unsigned int v3 = *(_DWORD *)a2 + 2;
  }
  if (v3 == 1)
  {
    long long v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t))(v5 - 8))(a1);
    *(unsigned char *)(a1 + 40) = 1;
  }
  else if (v3)
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  }
  else
  {
    uint64_t v4 = *(void *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = v4;
    *(unsigned char *)(a1 + 40) = 0;
    swift_unknownObjectRetain();
    swift_retain();
  }
  return a1;
}

uint64_t assignWithCopy for SystemAppInstaller.State(uint64_t a1, long long *a2)
{
  if ((long long *)a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else if (!v4)
    {
      swift_unknownObjectRelease();
      swift_release();
    }
    unsigned int v5 = *((unsigned __int8 *)a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      uint64_t v8 = *((void *)a2 + 3);
      *(void *)(a1 + 24) = v8;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v8 - 8))(a1, a2);
      *(unsigned char *)(a1 + 40) = 1;
    }
    else if (v5)
    {
      long long v9 = *a2;
      long long v10 = a2[1];
      *(_OWORD *)(a1 + 25) = *(long long *)((char *)a2 + 25);
      *(_OWORD *)a1 = v9;
      *(_OWORD *)(a1 + 16) = v10;
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      uint64_t v6 = *((void *)a2 + 1);
      uint64_t v7 = *((void *)a2 + 2);
      *(void *)(a1 + 8) = v6;
      *(void *)(a1 + 16) = v7;
      *(unsigned char *)(a1 + 40) = 0;
      swift_unknownObjectRetain();
      swift_retain();
    }
  }
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SystemAppInstaller.State(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else if (!v4)
    {
      swift_unknownObjectRelease();
      swift_release();
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      long long v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(unsigned char *)(a1 + 40) = 1;
    }
    else if (v5)
    {
      long long v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
      *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
    }
    else
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(unsigned char *)(a1 + 40) = 0;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemAppInstaller.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 3) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SystemAppInstaller.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25C265FBC(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_25C265FD8(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SystemAppInstaller.State()
{
  return &type metadata for SystemAppInstaller.State;
}

uint64_t sub_25C266010(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25C266048(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25C266060@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_25C266010(v1 + 64, a1);
}

uint64_t sub_25C2660BC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C2660F4(uint64_t a1, double a2)
{
  long long v3 = *(uint64_t (**)(uint64_t, double *))(v2 + 16);
  double v5 = a2;
  return v3(a1, &v5);
}

uint64_t sub_25C26612C(uint64_t a1, double *a2)
{
  return (*(uint64_t (**)(double))(v2 + 16))(*a2);
}

uint64_t sub_25C26615C(uint64_t a1)
{
  return sub_25C266560(a1, (uint64_t (*)(void, void, void, void, void, void))sub_25C265598);
}

uint64_t sub_25C266178()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t objectdestroy_2Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25C2661EC(uint64_t a1, uint64_t a2)
{
  return sub_25C264698(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_25C2661FC()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25C26623C(uint64_t a1)
{
  return sub_25C264990(a1, *(void **)(v1 + 16), *(void (**)(void))(v1 + 24), *(void *)(v1 + 32));
}

unint64_t sub_25C266250()
{
  unint64_t result = qword_26A599220;
  if (!qword_26A599220)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A599220);
  }
  return result;
}

uint64_t sub_25C266290()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C2662C8()
{
  return sub_25C2637B0();
}

id sub_25C2662D0(id result, char a2)
{
  if (a2) {
    return result;
  }
  return result;
}

void sub_25C2662DC(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t sub_25C2662E8()
{
  return objectdestroy_8Tm(&qword_26A599218);
}

uint64_t sub_25C2662F4(uint64_t a1, uint64_t a2)
{
  return sub_25C26631C(a1, a2, &qword_26A599218, (uint64_t)&unk_270992D28, (uint64_t)sub_25C26661C);
}

uint64_t sub_25C26631C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v13 = (*(void *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_25C2650B4(a1, a2, v5 + v12, *(void *)(v5 + v13), *(void *)(v5 + v13 + 8), a3, a4, a5);
}

uint64_t sub_25C2663E0()
{
  return objectdestroy_8Tm((uint64_t *)&unk_26A599200);
}

uint64_t objectdestroy_8Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = ((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  swift_release();
  return MEMORY[0x270FA0238](v1, v7, v6);
}

uint64_t sub_25C266490(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A599200) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v2 + v6;
  uint64_t v8 = (uint64_t *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  return sub_25C265170(a1, a2, v7, v9, v10);
}

uint64_t sub_25C266548(uint64_t a1)
{
  return sub_25C266560(a1, (uint64_t (*)(void, void, void, void, void, void))sub_25C26523C);
}

uint64_t sub_25C266560(uint64_t a1, uint64_t (*a2)(void, void, void, void, void, void))
{
  return a2(*(void *)a1, *(unsigned __int8 *)(a1 + 8), v2[2], v2[3], v2[4], v2[5]);
}

unint64_t sub_25C266584()
{
  unint64_t result = qword_26A599228;
  if (!qword_26A599228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A599228);
  }
  return result;
}

uint64_t objectdestroy_27Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_25C26661C(uint64_t a1)
{
  sub_25C2653D8(a1, *(void (**)(uint64_t *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t *))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_25C266628(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A599210);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroy_30Tm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C2666D4(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  char v3 = *(unsigned char *)(result + 8);
  uint64_t v4 = *(void *)result;
  char v5 = v3;
  if (v2) {
    return v2(&v4);
  }
  return result;
}

uint64_t sub_25C26671C(uint64_t a1, uint64_t a2)
{
  return a2;
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

uint64_t sub_25C2667B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25C26681C(void *a1)
{
  return sub_25C2630D8(a1);
}

id sub_25C266824()
{
  return sub_25C265A5C();
}

uint64_t sub_25C26684C()
{
  return sub_25C265A78();
}

uint64_t ASDApp.bundleIdentifier.getter()
{
  id v1 = objc_msgSend(v0, sel_bundleID);
  uint64_t v2 = sub_25C274910();

  return v2;
}

uint64_t ASDApp.installIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_installID);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_25C273D90();

    uint64_t v5 = sub_25C273DA0();
    unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_25C273DA0();
    unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }
  return v6(v8, v9, 1, v7);
}

id ASDApp.installProgress.getter()
{
  id v1 = objc_msgSend(v0, sel_progress);
  return v1;
}

uint64_t sub_25C2669C0()
{
  id v1 = objc_msgSend(*v0, sel_localizedName);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25C274910();

  return v3;
}

uint64_t sub_25C266A28()
{
  id v1 = objc_msgSend(*v0, sel_bundleID);
  uint64_t v2 = sub_25C274910();

  return v2;
}

id sub_25C266A80()
{
  return objc_msgSend(*v0, sel_isInstalled);
}

uint64_t sub_25C266AA4@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(*v1, sel_installID);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_25C273D90();

    uint64_t v5 = sub_25C273DA0();
    unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_25C273DA0();
    unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }
  return v6(v8, v9, 1, v7);
}

id sub_25C266B6C()
{
  id v1 = objc_msgSend(*v0, sel_installError);
  return v1;
}

id sub_25C266BA4()
{
  id v1 = objc_msgSend(*v0, sel_progress);
  return v1;
}

uint64_t dispatch thunk of AppRecord.localizedName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppRecord.bundleIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AppRecord.isInstalled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AppRecord.installIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AppRecord.installError.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AppRecord.installProgress.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t static ASDInstallApps.requestInstall(for:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25C274840();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C274740();
  sub_25C274820();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v6 = objc_allocWithZone(MEMORY[0x263F25518]);
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)sub_25C2748E0();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_initWithBundleID_, v7);

  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v1;
  return sub_25C274590();
}

uint64_t sub_25C266E00(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  uint64_t v6 = sub_25C274850();
  uint64_t v28 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_25C274880();
  uint64_t v9 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25C274860();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  sub_25C266250();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F8F060], v12);
  swift_retain();
  uint64_t v17 = (void *)sub_25C274B80();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v18 = (void *)swift_allocObject();
  uint64_t v20 = v25;
  uint64_t v19 = v26;
  void v18[2] = v25;
  v18[3] = v19;
  v18[4] = sub_25C267CCC;
  v18[5] = v16;
  aBlock[4] = sub_25C267D4C;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25C25D688;
  aBlock[3] = &block_descriptor_2;
  char v21 = _Block_copy(aBlock);
  id v22 = v20;
  sub_25C274870();
  uint64_t v29 = MEMORY[0x263F8EE78];
  sub_25C25E0E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A599178);
  sub_25C25E138();
  sub_25C274C50();
  MEMORY[0x261182D90](0, v11, v8, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v27);
  return swift_release();
}

uint64_t sub_25C267180()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C2671B8(uint64_t a1, uint64_t a2)
{
  return sub_25C266E00(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24));
}

void sub_25C2671C0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_25C274840();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C274740();
  id v12 = a1;
  uint64_t v13 = sub_25C274830();
  os_log_type_t v14 = sub_25C274B50();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v32 = v9;
    uint64_t v16 = v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v31 = v17;
    *(_DWORD *)uint64_t v16 = 141558274;
    uint64_t v36 = 1752392040;
    aBlock[0] = v17;
    uint64_t v34 = a3;
    sub_25C274BE0();
    *(_WORD *)(v16 + 12) = 2080;
    uint64_t v29 = v16 + 14;
    id v18 = v12;
    uint64_t v33 = a2;
    id v19 = v18;
    id v20 = objc_msgSend(v18, sel_description);
    uint64_t v30 = v8;
    id v21 = v20;
    uint64_t v22 = sub_25C274910();
    uint64_t v35 = a4;
    unint64_t v24 = v23;

    uint64_t v36 = sub_25C24A1D8(v22, v24, aBlock);
    a3 = v34;
    sub_25C274BE0();

    a4 = v35;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C23E000, v13, v14, "Requesting to install %{mask.hash}s", (uint8_t *)v16, 0x16u);
    uint64_t v25 = v31;
    swift_arrayDestroy();
    MEMORY[0x261183790](v25, -1, -1);
    MEMORY[0x261183790](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v30);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = a3;
  *(void *)(v27 + 24) = a4;
  aBlock[4] = (uint64_t)sub_25C267D70;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_25C2679EC;
  aBlock[3] = (uint64_t)&block_descriptor_12;
  uint64_t v28 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(ObjCClassFromMetadata, sel_installApp_withCompletionHandler_, v12, v28);
  _Block_release(v28);
}

uint64_t sub_25C267514(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_25C274850();
  uint64_t v25 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_25C274880();
  uint64_t v11 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25C273DA0();
  int v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(a1, 1, v14);
  sub_25C266250();
  uint64_t v16 = (void *)sub_25C274B60();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  if (v15 == 1)
  {
    v17[4] = a2;
    uint64_t v31 = sub_25C267E18;
    uint64_t v32 = v17;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_25C25D688;
    uint64_t v30 = &block_descriptor_18;
    id v18 = _Block_copy(&aBlock);
    swift_retain();
    id v19 = a2;
    sub_25C274870();
    uint64_t v26 = MEMORY[0x263F8EE78];
    sub_25C25E0E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A599178);
    sub_25C25E138();
    sub_25C274C50();
    MEMORY[0x261182D90](0, v13, v10, v18);
    id v20 = v18;
  }
  else
  {
    uint64_t v31 = sub_25C267E24;
    uint64_t v32 = v17;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_25C25D688;
    uint64_t v30 = &block_descriptor_24;
    id v21 = _Block_copy(&aBlock);
    swift_retain();
    sub_25C274870();
    uint64_t v26 = MEMORY[0x263F8EE78];
    sub_25C25E0E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A599178);
    sub_25C25E138();
    sub_25C274C50();
    MEMORY[0x261182D90](0, v13, v10, v21);
    id v20 = v21;
  }
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v24);
  return swift_release();
}

void sub_25C2678E8(void (*a1)(void *, void))
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26B350160);
  sub_25C274F20();
  a1(v2, v3);
  sub_25C2662DC(v2, v3);
}

void sub_25C26795C(void (*a1)(id, uint64_t), int a2, id a3)
{
  if (a3)
  {
    id v5 = a3;
  }
  else
  {
    sub_25C25E2D8();
    id v5 = (id)swift_allocError();
    *uint64_t v6 = 5;
  }
  id v7 = a3;
  a1(v5, 1);
}

uint64_t sub_25C2679EC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A599230);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_25C273D90();
    uint64_t v10 = sub_25C273DA0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_25C273DA0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  swift_retain();
  id v12 = a3;
  v9(v8, a3);
  swift_release();

  return sub_25C267D78((uint64_t)v8);
}

void *initializeBufferWithCopyOfBuffer for AppInstallRequestType(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AppInstallRequestType()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AppInstallRequestType(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
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

void *assignWithTake for AppInstallRequestType(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallRequestType(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppInstallRequestType(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppInstallRequestType()
{
  return &type metadata for AppInstallRequestType;
}

uint64_t dispatch thunk of static AppInstallRequesting.requestInstall(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_25C267C94()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C267CCC(uint64_t a1, char a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  uint64_t v5 = a1;
  char v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_25C267D0C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_25C267D4C()
{
  sub_25C2671C0(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_25C267D70(uint64_t a1, void *a2)
{
  return sub_25C267514(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_25C267D78(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A599230);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C267DD8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25C267E18()
{
  sub_25C26795C(*(void (**)(id, uint64_t))(v0 + 16), *(void *)(v0 + 24), *(id *)(v0 + 32));
}

void sub_25C267E24()
{
  sub_25C2678E8(*(void (**)(void *, void))(v0 + 16));
}

uint64_t AppInstallerProvider.makeSystemAppInstaller(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C2746F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v14 - v9;
  swift_bridgeObjectRetain();
  sub_25C2746E0();
  type metadata accessor for SystemAppInstaller();
  uint64_t v11 = swift_allocObject();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  uint64_t v12 = sub_25C26810C(a1, a2, (uint64_t)v8, v11);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v12;
}

uint64_t sub_25C267FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C2746F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v14 - v9;
  swift_bridgeObjectRetain();
  sub_25C2746E0();
  type metadata accessor for SystemAppInstaller();
  uint64_t v11 = swift_allocObject();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  uint64_t v12 = sub_25C26810C(a1, a2, (uint64_t)v8, v11);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v12;
}

uint64_t sub_25C26810C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v21 = &type metadata for AppInstallRequestProvider;
  uint64_t v22 = &protocol witness table for AppInstallRequestProvider;
  id v18 = &type metadata for AppRecordObserverProvider;
  id v19 = &protocol witness table for AppRecordObserverProvider;
  uint64_t v8 = sub_25C2746F0();
  v16[3] = v8;
  v16[4] = MEMORY[0x263F68940];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(boxed_opaque_existential_1, a3, v8);
  *(void *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = 0;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 80) = 0u;
  *(void *)(a4 + 96) = 0;
  *(unsigned char *)(a4 + 104) = 2;
  sub_25C274600();
  swift_allocObject();
  *(void *)(a4 + 112) = sub_25C2745F0();
  *(void *)(a4 + 32) = a1;
  *(void *)(a4 + 40) = a2;
  sub_25C2667B8((uint64_t)v20, a4 + 120);
  sub_25C2667B8((uint64_t)v17, a4 + 160);
  sub_25C2667B8((uint64_t)v16, a4 + 200);
  id v10 = objc_allocWithZone((Class)type metadata accessor for AppRecordObserver());
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_25C25C6F8(a1, a2);
  swift_bridgeObjectRelease();
  *(void *)(a4 + 48) = v11;
  *(void *)(a4 + 56) = &off_2709926F8;
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v13 = (uint64_t *)&v11[OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_onRecordUpdated];
  swift_beginAccess();
  uint64_t v14 = *v13;
  *uint64_t v13 = (uint64_t)sub_25C26681C;
  v13[1] = v12;
  swift_retain();
  sub_25C25E32C(v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return a4;
}

uint64_t dispatch thunk of AppInstallerProviding.makeSystemAppInstaller(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

ValueMetadata *type metadata accessor for AppInstallerProvider()
{
  return &type metadata for AppInstallerProvider;
}

uint64_t sub_25C268324()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

char *AppRecordObserverProvider.makeAppRecordObserver(for:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for AppRecordObserver());
  swift_bridgeObjectRetain();
  return sub_25C25C6F8(a1, a2);
}

char *sub_25C2683BC(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for AppRecordObserver());
  swift_bridgeObjectRetain();
  return sub_25C25C6F8(a1, a2);
}

uint64_t dispatch thunk of AppRecordObserverProviding.makeAppRecordObserver(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

ValueMetadata *type metadata accessor for AppRecordObserverProvider()
{
  return &type metadata for AppRecordObserverProvider;
}

void sub_25C26843C(void *a1)
{
  sub_25C259DFC();
  uint64_t v119 = (void *)sub_25C259D38();
  v120 = a1;
  unint64_t v3 = sub_25C259C64(0xD000000000000028, 0x800000025C276AB0);
  if (!v3) {
    unint64_t v3 = sub_25C25EDB4(MEMORY[0x263F8EE78]);
  }
  unint64_t v4 = v3;
  v131 = (void *)sub_25C25ECA0(MEMORY[0x263F8EE78]);
  unint64_t v123 = v4 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v4 + 64);
  int64_t v126 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  for (uint64_t i = 0; ; uint64_t i = v130)
  {
    if (v7)
    {
      uint64_t v129 = (void *)((v7 - 1) & v7);
      uint64_t v130 = i;
      unint64_t v9 = __clz(__rbit64(v7)) | ((void)i << 6);
      goto LABEL_28;
    }
    int64_t v10 = (int64_t)i + 1;
    if (__OFADD__(i, 1)) {
      goto LABEL_136;
    }
    if (v10 >= v126) {
      break;
    }
    unint64_t v11 = *(void *)(v123 + 8 * v10);
    int64_t v12 = (int64_t)i + 1;
    if (!v11)
    {
      int64_t v12 = (int64_t)i + 2;
      if ((uint64_t)i + 2 >= v126) {
        break;
      }
      unint64_t v11 = *(void *)(v123 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = (int64_t)i + 3;
        if ((uint64_t)i + 3 >= v126) {
          break;
        }
        unint64_t v11 = *(void *)(v123 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = (int64_t)i + 4;
          if ((uint64_t)i + 4 >= v126) {
            break;
          }
          unint64_t v11 = *(void *)(v123 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = (int64_t)i + 5;
            if ((uint64_t)i + 5 >= v126) {
              break;
            }
            unint64_t v11 = *(void *)(v123 + 8 * v12);
            if (!v11)
            {
              uint64_t v13 = (char *)i + 6;
              if ((uint64_t)i + 6 >= v126) {
                break;
              }
              unint64_t v11 = *(void *)(v123 + 8 * (void)v13);
              if (!v11)
              {
                while (1)
                {
                  int64_t v12 = (int64_t)(v13 + 1);
                  if (__OFADD__(v13, 1)) {
                    goto LABEL_141;
                  }
                  if (v12 >= v126) {
                    goto LABEL_37;
                  }
                  unint64_t v11 = *(void *)(v123 + 8 * v12);
                  ++v13;
                  if (v11) {
                    goto LABEL_27;
                  }
                }
              }
              int64_t v12 = (int64_t)i + 6;
            }
          }
        }
      }
    }
LABEL_27:
    uint64_t v129 = (void *)((v11 - 1) & v11);
    uint64_t v130 = (void *)v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_28:
    unint64_t v14 = v4;
    int v15 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v9);
    uint64_t v16 = *v15;
    unint64_t v1 = v15[1];
    uint64_t v17 = *(void **)(*(void *)(v4 + 56) + 8 * v9);
    swift_bridgeObjectRetain_n();
    id v18 = v17;
    unsigned __int8 v19 = objc_msgSend(v18, sel_BOOLValue);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v132 = (unint64_t)v131;
    unint64_t v22 = sub_25C26150C(v16, v1);
    uint64_t v23 = v131[2];
    BOOL v24 = (v21 & 1) == 0;
    uint64_t v25 = v23 + v24;
    if (__OFADD__(v23, v24))
    {
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
LABEL_138:
      __break(1u);
LABEL_139:
      __break(1u);
LABEL_140:
      __break(1u);
LABEL_141:
      __break(1u);
      goto LABEL_142;
    }
    char v26 = v21;
    if (v131[3] >= v25)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_25C26A950();
      }
    }
    else
    {
      sub_25C260240(v25, isUniquelyReferenced_nonNull_native);
      unint64_t v27 = sub_25C26150C(v16, v1);
      if ((v26 & 1) != (v28 & 1)) {
        goto LABEL_162;
      }
      unint64_t v22 = v27;
    }
    if (v26)
    {
      *(unsigned char *)(v131[7] + v22) = v19;
    }
    else
    {
      v131[(v22 >> 6) + 8] |= 1 << v22;
      uint64_t v29 = (uint64_t *)(v131[6] + 16 * v22);
      *uint64_t v29 = v16;
      v29[1] = v1;
      *(unsigned char *)(v131[7] + v22) = v19;
      uint64_t v30 = v131[2];
      BOOL v31 = __OFADD__(v30, 1);
      uint64_t v32 = v30 + 1;
      if (v31) {
        goto LABEL_135;
      }
      v131[2] = v32;
      swift_bridgeObjectRetain();
    }

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    unint64_t v4 = v14;
    unint64_t v7 = (unint64_t)v129;
  }
LABEL_37:
  swift_release();
  swift_bridgeObjectRelease();
  id v33 = objc_msgSend(v120, sel_ams_privacyAcknowledgement);
  if (!v33)
  {
    uint64_t v130 = 0;
    goto LABEL_74;
  }
  uint64_t v34 = v33;
  sub_25C256834(0, (unint64_t *)&qword_26A5990B8);
  uint64_t v35 = sub_25C2748A0();

  uint64_t v130 = (void *)sub_25C25EED0(MEMORY[0x263F8EE78]);
  uint64_t v121 = v35 + 64;
  uint64_t v36 = 1 << *(unsigned char *)(v35 + 32);
  uint64_t v37 = -1;
  if (v36 < 64) {
    uint64_t v37 = ~(-1 << v36);
  }
  unint64_t v38 = v37 & *(void *)(v35 + 64);
  int64_t v124 = (unint64_t)(v36 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v39 = 0;
  while (2)
  {
    if (v38)
    {
      unint64_t v40 = __clz(__rbit64(v38));
      v38 &= v38 - 1;
      uint64_t v129 = v39;
      unint64_t v41 = v40 | ((void)v39 << 6);
LABEL_63:
      uint64_t v46 = (uint64_t *)(*(void *)(v35 + 48) + 16 * v41);
      uint64_t v48 = *v46;
      uint64_t v47 = v46[1];
      uint64_t v49 = *(void **)(*(void *)(v35 + 56) + 8 * v41);
      swift_bridgeObjectRetain_n();
      id v50 = v49;
      unint64_t v1 = (unint64_t)objc_msgSend(v50, sel_unsignedIntegerValue);
      char v51 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v132 = (unint64_t)v130;
      unint64_t v53 = sub_25C26150C(v48, v47);
      uint64_t v54 = v130[2];
      BOOL v55 = (v52 & 1) == 0;
      uint64_t v56 = v54 + v55;
      if (__OFADD__(v54, v55)) {
        goto LABEL_133;
      }
      char v57 = v52;
      if (v130[3] >= v56)
      {
        if ((v51 & 1) == 0) {
          sub_25C26A7A8(&qword_26A5991C0);
        }
      }
      else
      {
        sub_25C25FF2C(v56, v51);
        unint64_t v58 = sub_25C26150C(v48, v47);
        if ((v57 & 1) != (v59 & 1)) {
          goto LABEL_162;
        }
        unint64_t v53 = v58;
      }
      if (v57)
      {
        *(void *)(v130[7] + 8 * v53) = v1;
      }
      else
      {
        v130[(v53 >> 6) + 8] |= 1 << v53;
        id v60 = (uint64_t *)(v130[6] + 16 * v53);
        *id v60 = v48;
        v60[1] = v47;
        *(void *)(v130[7] + 8 * v53) = v1;
        uint64_t v61 = v130[2];
        BOOL v31 = __OFADD__(v61, 1);
        uint64_t v62 = v61 + 1;
        if (v31) {
          goto LABEL_137;
        }
        uint64_t v130[2] = v62;
        swift_bridgeObjectRetain();
      }

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      uint64_t v39 = v129;
      continue;
    }
    break;
  }
  int64_t v42 = (int64_t)v39 + 1;
  if (__OFADD__(v39, 1)) {
    goto LABEL_139;
  }
  if (v42 >= v124) {
    goto LABEL_72;
  }
  unint64_t v43 = *(void *)(v121 + 8 * v42);
  int64_t v44 = (int64_t)v39 + 1;
  if (v43) {
    goto LABEL_62;
  }
  int64_t v44 = (int64_t)v39 + 2;
  if ((uint64_t)v39 + 2 >= v124) {
    goto LABEL_72;
  }
  unint64_t v43 = *(void *)(v121 + 8 * v44);
  if (v43) {
    goto LABEL_62;
  }
  int64_t v44 = (int64_t)v39 + 3;
  if ((uint64_t)v39 + 3 >= v124) {
    goto LABEL_72;
  }
  unint64_t v43 = *(void *)(v121 + 8 * v44);
  if (v43) {
    goto LABEL_62;
  }
  int64_t v44 = (int64_t)v39 + 4;
  if ((uint64_t)v39 + 4 >= v124) {
    goto LABEL_72;
  }
  unint64_t v43 = *(void *)(v121 + 8 * v44);
  if (v43) {
    goto LABEL_62;
  }
  int64_t v44 = (int64_t)v39 + 5;
  if ((uint64_t)v39 + 5 >= v124) {
    goto LABEL_72;
  }
  unint64_t v43 = *(void *)(v121 + 8 * v44);
  if (v43)
  {
LABEL_62:
    unint64_t v38 = (v43 - 1) & v43;
    uint64_t v129 = (void *)v44;
    unint64_t v41 = __clz(__rbit64(v43)) + (v44 << 6);
    goto LABEL_63;
  }
  uint64_t v45 = (char *)v39 + 6;
  if ((uint64_t)v39 + 6 >= v124) {
    goto LABEL_72;
  }
  unint64_t v43 = *(void *)(v121 + 8 * (void)v45);
  if (v43)
  {
    int64_t v44 = (int64_t)v39 + 6;
    goto LABEL_62;
  }
  while (1)
  {
    int64_t v44 = (int64_t)(v45 + 1);
    if (__OFADD__(v45, 1))
    {
      __break(1u);
      goto LABEL_160;
    }
    if (v44 >= v124) {
      break;
    }
    unint64_t v43 = *(void *)(v121 + 8 * v44);
    ++v45;
    if (v43) {
      goto LABEL_62;
    }
  }
LABEL_72:
  swift_release();
  swift_bridgeObjectRelease();
LABEL_74:
  id v63 = objc_msgSend(v120, sel_ams_pushRegistrationThrottleMap);
  if (!v63)
  {
    uint64_t v129 = 0;
LABEL_111:
    sub_25C259B74(0x46746E756F636361, 0xEC0000007367616CLL);
    sub_25C259B80(0xD000000000000010, 0x800000025C276B60);
    id v93 = objc_msgSend(v120, sel_ams_altDSID);
    if (v93)
    {
      uint64_t v94 = v93;
      sub_25C274910();
    }
    id v95 = objc_msgSend(v120, sel_ams_automaticDownloadKinds);
    long long v96 = (void *)MEMORY[0x263F8EE78];
    if (v95)
    {
      uint64_t v97 = v95;
      sub_25C274A10();
    }
    id v98 = objc_msgSend(v120, sel_ams_cookies);
    if (!v98) {
      goto LABEL_144;
    }
    long long v99 = v98;
    sub_25C256834(0, &qword_26A599238);
    unint64_t v1 = sub_25C274A10();

    unint64_t v132 = (unint64_t)v96;
    if (!(v1 >> 62))
    {
      uint64_t v100 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v100)
      {
LABEL_143:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_144:
        id v110 = objc_msgSend(v120, sel_ams_creditsString);
        if (v110)
        {
          uint64_t v111 = v110;
          sub_25C274910();
        }
        sub_25C259BA4();
        objc_msgSend(v120, sel_ams_didAgreeToTerms);
        if (v119)
        {
          id v112 = objc_msgSend(v119, sel_stringValue);
          sub_25C274910();
        }
        id v113 = objc_msgSend(v120, sel_ams_firstName);
        if (v113)
        {
          uint64_t v114 = v113;
          sub_25C274910();
        }
        objc_msgSend(v120, sel_ams_freePasswordPromptSetting);
        objc_msgSend(v120, sel_ams_isiCloudFamily);
        objc_msgSend(v120, sel_ams_isInGoodStanding);
        objc_msgSend(v120, sel_ams_isDemoAccount);
        objc_msgSend(v120, sel_ams_isManagedAppleID);
        objc_msgSend(v120, sel_ams_isValidPayment);
        id v115 = objc_msgSend(v120, sel_ams_lastName);
        if (v115)
        {
          uint64_t v116 = v115;
          sub_25C274910();
        }
        objc_msgSend(v120, sel_ams_lastAuthenticationCredentialSource);
        objc_msgSend(v120, sel_ams_mergedPrivacyAcknowledgement);
        objc_msgSend(v120, sel_ams_paidPasswordPromptSetting);
        if (!v130) {
          sub_25C25EED0(MEMORY[0x263F8EE78]);
        }
        if (!v129) {
          sub_25C25E930(MEMORY[0x263F8EE78]);
        }
        id v117 = objc_msgSend(v120, sel_ams_storefront);
        if (v117)
        {
          char v118 = v117;
          sub_25C274910();
        }
        sub_25C2743F0();

        return;
      }
LABEL_118:
      if (v100 < 1) {
        goto LABEL_161;
      }
      uint64_t v101 = 0;
      unint64_t v128 = v1 & 0xC000000000000001;
      do
      {
        if (v128) {
          id v102 = (id)MEMORY[0x261182F40](v101, v1);
        }
        else {
          id v102 = *(id *)(v1 + 8 * v101 + 32);
        }
        os_log_type_t v103 = v102;
        id v104 = objc_msgSend(v102, sel_properties);
        if (v104)
        {
          uint64_t v105 = v104;
          type metadata accessor for HTTPCookiePropertyKey();
          sub_25C26AAFC();
          unint64_t v106 = v1;
          sub_25C2748A0();

          id v107 = objc_allocWithZone((Class)sub_25C274160());
          id v108 = (void *)sub_25C274890();
          swift_bridgeObjectRelease();
          id v109 = objc_msgSend(v107, sel_initWithProperties_, v108);

          unint64_t v1 = v106;
          if (v109)
          {
            MEMORY[0x261182C10]();
            if (*(void *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_25C274A50();
            }
            sub_25C274A60();
            sub_25C274A30();
          }
        }
        else
        {
        }
        ++v101;
      }
      while (v100 != v101);
      goto LABEL_143;
    }
LABEL_142:
    swift_bridgeObjectRetain();
    uint64_t v100 = sub_25C274DA0();
    if (!v100) {
      goto LABEL_143;
    }
    goto LABEL_118;
  }
  uint64_t v64 = v63;
  sub_25C256834(0, (unint64_t *)&qword_26A5990B8);
  uint64_t v65 = sub_25C2748A0();

  uint64_t v127 = v65;
  uint64_t v129 = (void *)sub_25C25E930(MEMORY[0x263F8EE78]);
  uint64_t v122 = v65 + 64;
  uint64_t v66 = 1 << *(unsigned char *)(v65 + 32);
  uint64_t v67 = -1;
  if (v66 < 64) {
    uint64_t v67 = ~(-1 << v66);
  }
  unint64_t v68 = v67 & *(void *)(v65 + 64);
  int64_t v125 = (unint64_t)(v66 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v69 = 0;
  while (2)
  {
    if (v68)
    {
      unint64_t v70 = __clz(__rbit64(v68));
      v68 &= v68 - 1;
      unint64_t v71 = v70 | (v69 << 6);
LABEL_100:
      uint64_t v75 = (uint64_t *)(*(void *)(v127 + 48) + 16 * v71);
      uint64_t v77 = *v75;
      uint64_t v76 = v75[1];
      uint64_t v78 = *(void **)(*(void *)(v127 + 56) + 8 * v71);
      swift_bridgeObjectRetain_n();
      id v79 = v78;
      objc_msgSend(v79, sel_doubleValue);
      uint64_t v81 = v80;
      char v82 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v132 = (unint64_t)v129;
      unint64_t v84 = sub_25C26150C(v77, v76);
      uint64_t v85 = v129[2];
      BOOL v86 = (v83 & 1) == 0;
      uint64_t v87 = v85 + v86;
      if (__OFADD__(v85, v86)) {
        goto LABEL_134;
      }
      unint64_t v1 = v83;
      if (v129[3] >= v87)
      {
        if ((v82 & 1) == 0) {
          sub_25C26A404();
        }
      }
      else
      {
        sub_25C25F918(v87, v82);
        unint64_t v88 = sub_25C26150C(v77, v76);
        if ((v1 & 1) != (v89 & 1)) {
          goto LABEL_162;
        }
        unint64_t v84 = v88;
      }
      if (v1)
      {
        *(void *)(v129[7] + 8 * v84) = v81;
      }
      else
      {
        v129[(v84 >> 6) + 8] |= 1 << v84;
        uint64_t v90 = (uint64_t *)(v129[6] + 16 * v84);
        *uint64_t v90 = v77;
        v90[1] = v76;
        *(void *)(v129[7] + 8 * v84) = v81;
        uint64_t v91 = v129[2];
        BOOL v31 = __OFADD__(v91, 1);
        uint64_t v92 = v91 + 1;
        if (v31) {
          goto LABEL_138;
        }
        v129[2] = v92;
        swift_bridgeObjectRetain();
      }

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  int64_t v72 = v69 + 1;
  if (__OFADD__(v69, 1)) {
    goto LABEL_140;
  }
  if (v72 >= v125)
  {
LABEL_109:
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_111;
  }
  unint64_t v73 = *(void *)(v122 + 8 * v72);
  ++v69;
  if (v73) {
    goto LABEL_99;
  }
  int64_t v69 = v72 + 1;
  if (v72 + 1 >= v125) {
    goto LABEL_109;
  }
  unint64_t v73 = *(void *)(v122 + 8 * v69);
  if (v73) {
    goto LABEL_99;
  }
  int64_t v69 = v72 + 2;
  if (v72 + 2 >= v125) {
    goto LABEL_109;
  }
  unint64_t v73 = *(void *)(v122 + 8 * v69);
  if (v73) {
    goto LABEL_99;
  }
  int64_t v69 = v72 + 3;
  if (v72 + 3 >= v125) {
    goto LABEL_109;
  }
  unint64_t v73 = *(void *)(v122 + 8 * v69);
  if (v73) {
    goto LABEL_99;
  }
  int64_t v69 = v72 + 4;
  if (v72 + 4 >= v125) {
    goto LABEL_109;
  }
  unint64_t v73 = *(void *)(v122 + 8 * v69);
  if (v73)
  {
LABEL_99:
    unint64_t v68 = (v73 - 1) & v73;
    unint64_t v71 = __clz(__rbit64(v73)) + (v69 << 6);
    goto LABEL_100;
  }
  int64_t v74 = v72 + 5;
  if (v74 >= v125) {
    goto LABEL_109;
  }
  unint64_t v73 = *(void *)(v122 + 8 * v74);
  if (v73)
  {
    int64_t v69 = v74;
    goto LABEL_99;
  }
  while (1)
  {
    int64_t v69 = v74 + 1;
    if (__OFADD__(v74, 1)) {
      break;
    }
    if (v69 >= v125) {
      goto LABEL_109;
    }
    unint64_t v73 = *(void *)(v122 + 8 * v69);
    ++v74;
    if (v73) {
      goto LABEL_99;
    }
  }
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  sub_25C274E90();
  __break(1u);
}

unint64_t sub_25C269448()
{
  unint64_t v0 = sub_25C25EA50(MEMORY[0x263F8EE78]);
  uint64_t v1 = sub_25C274400();
  if (v1)
  {
    uint64_t v2 = v1;
    *((void *)&v67 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5990A0);
    *(void *)&long long v66 = v2;
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
  }
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0x46746E756F636361, 0xEC0000007367616CLL, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v4 = sub_25C274410();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A599098);
  *((void *)&v67 + 1) = v5;
  *(void *)&long long v66 = v4;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v6 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0xD000000000000010, 0x800000025C276B60, v6);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v7 = sub_25C274420();
  uint64_t v9 = MEMORY[0x263F8D310];
  if (v8)
  {
    *((void *)&v67 + 1) = MEMORY[0x263F8D310];
    *(void *)&long long v66 = v7;
    *((void *)&v66 + 1) = v8;
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
  }
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v10 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0x44495344746C61, 0xE700000000000000, v10);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v11 = sub_25C2744E0();
  *((void *)&v67 + 1) = v5;
  *(void *)&long long v66 = v11;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v12 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0xD000000000000016, 0x800000025C276B40, v12);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v13 = sub_25C2744B0();
  *((void *)&v67 + 1) = MEMORY[0x263F8D6C8];
  *(void *)&long long v66 = v13;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v14 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0x697274656D6F6962, 0xEF65746174537363, v14);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v15 = sub_25C274540();
  if (v15)
  {
    uint64_t v16 = v15;
    *((void *)&v67 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A599250);
    *(void *)&long long v66 = v16;
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
  }
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v17 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0x7365696B6F6F63, 0xE700000000000000, v17);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v18 = sub_25C274550();
  if (v19)
  {
    *((void *)&v67 + 1) = v9;
    *(void *)&long long v66 = v18;
    *((void *)&v66 + 1) = v19;
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
  }
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v20 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0x43746E756F636361, 0xEE00737469646572, v20);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v21 = sub_25C274430();
  if (v22)
  {
    *((void *)&v67 + 1) = v9;
    *(void *)&long long v66 = v21;
    *((void *)&v66 + 1) = v22;
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
  }
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v23 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0xD000000000000016, 0x800000025C276B20, v23);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  char v24 = sub_25C2744C0();
  uint64_t v25 = MEMORY[0x263F8D4F8];
  *((void *)&v67 + 1) = MEMORY[0x263F8D4F8];
  LOBYTE(v66) = v24 & 1;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0x6565726741646964, 0xEF736D7265546F54, v26);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v27 = sub_25C274450();
  if (v28)
  {
    *((void *)&v67 + 1) = v9;
    *(void *)&long long v66 = v27;
    *((void *)&v66 + 1) = v28;
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
  }
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v29 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 1684632420, 0xE400000000000000, v29);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v30 = sub_25C274570();
  if (v31)
  {
    *((void *)&v67 + 1) = v9;
    *(void *)&long long v66 = v30;
    *((void *)&v66 + 1) = v31;
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
  }
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v32 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0x6D614E7473726966, 0xE900000000000065, v32);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v33 = sub_25C274510();
  uint64_t v34 = MEMORY[0x263F8D9D0];
  *((void *)&v67 + 1) = MEMORY[0x263F8D9D0];
  *(void *)&long long v66 = v33;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v35 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0xD00000000000001CLL, 0x800000025C276B00, v35);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  char v36 = sub_25C274480();
  *((void *)&v67 + 1) = v25;
  LOBYTE(v66) = v36 & 1;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v37 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0x614664756F6C4369, 0xEC000000796C696DLL, v37);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  char v38 = sub_25C274490();
  *((void *)&v67 + 1) = v25;
  LOBYTE(v66) = v38 & 1;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v39 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0x7453646F6F476E69, 0xEE00676E69646E61, v39);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  char v40 = sub_25C274440();
  *((void *)&v67 + 1) = v25;
  LOBYTE(v66) = v40 & 1;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v41 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0x63416F6D65447369, 0xED0000746E756F63, v41);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  char v42 = sub_25C274460();
  *((void *)&v67 + 1) = v25;
  LOBYTE(v66) = v42 & 1;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v43 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0xD000000000000010, 0x800000025C276AE0, v43);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  char v44 = sub_25C2744A0();
  *((void *)&v67 + 1) = v25;
  LOBYTE(v66) = v44 & 1;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v45 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0x79615064696C6176, 0xEC000000746E656DLL, v45);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v46 = sub_25C274560();
  if (v47)
  {
    *((void *)&v67 + 1) = v9;
    *(void *)&long long v66 = v46;
    *((void *)&v66 + 1) = v47;
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
  }
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v48 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0x656D614E7473616CLL, 0xE800000000000000, v48);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v49 = sub_25C274530();
  *((void *)&v67 + 1) = v34;
  *(void *)&long long v66 = v49;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v50 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0xD000000000000020, 0x800000025C276A80, v50);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  char v51 = sub_25C274500();
  *((void *)&v67 + 1) = v25;
  LOBYTE(v66) = v51 & 1;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v52 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0xD00000000000001DLL, 0x800000025C276A60, v52);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v53 = sub_25C274520();
  *((void *)&v67 + 1) = v34;
  *(void *)&long long v66 = v53;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v54 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0xD00000000000001CLL, 0x800000025C276A40, v54);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v55 = sub_25C2744D0();
  *((void *)&v67 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A599240);
  *(void *)&long long v66 = v55;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v56 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0xD000000000000016, 0x800000025C276A20, v56);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v57 = sub_25C2744F0();
  *((void *)&v67 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A599248);
  *(void *)&long long v66 = v57;
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v58 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0xD00000000000001BLL, 0x800000025C276A00, v58);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  uint64_t v59 = sub_25C274470();
  if (v60)
  {
    *((void *)&v67 + 1) = v9;
    *(void *)&long long v66 = v59;
    *((void *)&v66 + 1) = v60;
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
  }
  sub_25C248CE8((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_25C25AFA8(&v63, v65);
    sub_25C24AB68((uint64_t)v65, (uint64_t)&v63);
    char v61 = swift_isUniquelyReferenced_nonNull_native();
    sub_25C25A6D0(&v63, 0x6F726665726F7473, 0xEC0000004449746ELL, v61);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_25C248D50((uint64_t)&v63);
  }
  sub_25C248D50((uint64_t)&v66);
  return v0;
}

void *sub_25C26A404()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5991C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C274DB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    __n128 result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  __n128 result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    __n128 result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    __n128 result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25C26A5B4()
{
  return sub_25C26A7A8(&qword_26A5991E8);
}

void *sub_25C26A5C0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5991D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C274DB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    __n128 result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  __n128 result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    __n128 result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_25C24AB68(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_25C25AFA8(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    __n128 result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    __n128 result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25C26A7A8(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25C274DB0();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    __n128 result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  __n128 result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    __n128 result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v14) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v7 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v7 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    uint64_t v21 = 8 * v16;
    uint64_t v22 = *(void *)(*(void *)(v3 + 56) + v21);
    unint64_t v23 = (void *)(*(void *)(v5 + 48) + v17);
    *unint64_t v23 = v20;
    v23[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v21) = v22;
    __n128 result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v14) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v7 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v7 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25C26A950()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5991B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C274DB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    __n128 result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  __n128 result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    __n128 result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    *uint64_t v19 = v18;
    v19[1] = v17;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = (_BYTE)v16;
    __n128 result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_25C26AAFC()
{
  unint64_t result = qword_26A598D30;
  if (!qword_26A598D30)
  {
    type metadata accessor for HTTPCookiePropertyKey();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A598D30);
  }
  return result;
}

uint64_t sub_25C26AB54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C274B00();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25C274AF0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25C271618(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25C274A90();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t AccountProviding.fetchCurrentAccount(accountType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  char v8 = *(unsigned char *)MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a2);
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  *(unsigned char *)(v10 + v9 + v7) = v8;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(void *)(v11 + 24) = 106;
  *(unsigned char *)(v11 + 32) = 2;
  *(void *)(v11 + 40) = 37;
  *(void *)(v11 + 48) = &unk_26A599260;
  *(void *)(v11 + 56) = v10;
  sub_25C2587F4();
  return sub_25C274590();
}

uint64_t AccountProviding.fetchMatchingAccount(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  v21[0] = a3;
  v21[1] = a4;
  uint64_t v8 = sub_25C2740C0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = *(void *)(a2 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v5, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v16 = (v13 + *(unsigned __int8 *)(v9 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = v21[0];
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = v18;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v17 + v15, v14, a2);
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v17 + v16, (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(void *)(v19 + 24) = 106;
  *(unsigned char *)(v19 + 32) = 2;
  *(void *)(v19 + 40) = 41;
  *(void *)(v19 + 48) = &unk_26A599270;
  *(void *)(v19 + 56) = v17;
  sub_25C2587F4();
  return sub_25C274590();
}

uint64_t AccountProviding.fetchPrimaryAccount()(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(void *)(v9 + 24) = 106;
  *(unsigned char *)(v9 + 32) = 2;
  *(void *)(v9 + 40) = 45;
  *(void *)(v9 + 48) = &unk_26A599280;
  *(void *)(v9 + 56) = v8;
  sub_25C2587F4();
  return sub_25C274590();
}

uint64_t sub_25C26B298(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C273C98;
  return AccountProviding.fetchCurrentAccountFirstName()(a1, a2);
}

uint64_t sub_25C26B33C()
{
  *(void *)(v1 + 112) = v0;
  uint64_t v2 = sub_25C274840();
  *(void *)(v1 + 120) = v2;
  *(void *)(v1 + 128) = *(void *)(v2 - 8);
  *(void *)(v1 + 136) = swift_task_alloc();
  *(void *)(v1 + 144) = swift_task_alloc();
  *(unsigned char *)(v1 + 201) = 1;
  uint64_t v3 = swift_task_alloc();
  *(void *)(v1 + 152) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_25C26B464;
  *(void *)(v3 + 64) = v0;
  *(unsigned char *)(v3 + 144) = *(unsigned char *)(v1 + 201);
  return MEMORY[0x270FA2498](sub_25C26EAB0, v0, 0);
}

uint64_t sub_25C26B464(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 160) = a1;
  *(void *)(v3 + 168) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_25C26B71C;
  }
  else {
    uint64_t v4 = sub_25C26B578;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_25C26B578()
{
  id v1 = objc_msgSend(*(id *)(v0 + 160), sel_aa_firstName);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_25C274910();
  }
  char v3 = sub_25C274BC0();
  swift_bridgeObjectRelease();
  if (v3)
  {

    *(unsigned char *)(v0 + 200) = 0;
    uint64_t v4 = swift_task_alloc();
    *(void *)(v0 + 176) = v4;
    *(void *)uint64_t v4 = v0;
    *(void *)(v4 + 8) = sub_25C26B9B0;
    uint64_t v5 = *(void *)(v0 + 112);
    *(void *)(v4 + 64) = v5;
    *(unsigned char *)(v4 + 144) = *(unsigned char *)(v0 + 200);
    uint64_t v6 = sub_25C26EAB0;
    uint64_t v7 = 0;
    return MEMORY[0x270FA2498](v6, v5, v7);
  }
  uint64_t v6 = (uint64_t (*)())objc_msgSend(*(id *)(v0 + 160), sel_aa_firstName);
  if (!v6)
  {
    __break(1u);
    return MEMORY[0x270FA2498](v6, v5, v7);
  }
  uint64_t v8 = v6;
  uint64_t v9 = *(void **)(v0 + 160);
  uint64_t v10 = sub_25C274910();
  uint64_t v12 = v11;

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v13(v10, v12);
}

uint64_t sub_25C26B71C()
{
  uint64_t v22 = v0;
  id v1 = *(void **)(v0 + 168);
  sub_25C274740();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_25C274830();
  os_log_type_t v5 = sub_25C274B40();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 168);
    uint64_t v18 = *(void *)(v0 + 128);
    uint64_t v19 = *(void *)(v0 + 120);
    uint64_t v20 = *(void *)(v0 + 144);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v21 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = MEMORY[0x2611830C0](*(void *)(v0 + 24), *(void *)(v0 + 32));
    *(void *)(v0 + 88) = sub_25C24A1D8(v9, v10, &v21);
    sub_25C274BE0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C23E000, v4, v5, "Failed fetching Apple Account while fetching first name: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261183790](v8, -1, -1);
    MEMORY[0x261183790](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 168);
    uint64_t v12 = *(void *)(v0 + 144);
    uint64_t v13 = *(void *)(v0 + 120);
    uint64_t v14 = *(void *)(v0 + 128);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  *(unsigned char *)(v0 + 200) = 0;
  uint64_t v15 = swift_task_alloc();
  *(void *)(v0 + 176) = v15;
  *(void *)uint64_t v15 = v0;
  *(void *)(v15 + 8) = sub_25C26B9B0;
  uint64_t v16 = *(void *)(v0 + 112);
  *(void *)(v15 + 64) = v16;
  *(unsigned char *)(v15 + 144) = *(unsigned char *)(v0 + 200);
  return MEMORY[0x270FA2498](sub_25C26EAB0, v16, 0);
}

uint64_t sub_25C26B9B0(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 184) = a1;
  *(void *)(v3 + 192) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_25C26BC4C;
  }
  else {
    uint64_t v4 = sub_25C26BAC4;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_25C26BAC4()
{
  id v1 = objc_msgSend(*(id *)(v0 + 184), sel_ams_firstName);
  if (!v1)
  {

    goto LABEL_5;
  }
  id v2 = v1;
  uint64_t v3 = *(void **)(v0 + 184);
  uint64_t v4 = sub_25C274910();
  uint64_t v6 = v5;

  *(void *)(v0 + 64) = v4;
  *(void *)(v0 + 72) = v6;
  sub_25C249214();
  swift_bridgeObjectRetain();
  LOBYTE(v2) = sub_25C274C30();

  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_25C245DD0();
    swift_allocError();
    *uint64_t v7 = 4;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v10(v4, v6);
}

uint64_t sub_25C26BC4C()
{
  uint64_t v22 = v0;
  id v1 = (void *)v0[24];
  sub_25C274740();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_25C274830();
  os_log_type_t v5 = sub_25C274B40();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[24];
    uint64_t v18 = v0[16];
    uint64_t v19 = v0[15];
    uint64_t v20 = v0[17];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v21 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = MEMORY[0x2611830C0](v0[6], v0[7]);
    v0[13] = sub_25C24A1D8(v9, v10, &v21);
    sub_25C274BE0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C23E000, v4, v5, "Failed fetching iTunes Account while fetching first name: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261183790](v8, -1, -1);
    MEMORY[0x261183790](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    uint64_t v11 = (void *)v0[24];
    uint64_t v13 = v0[16];
    uint64_t v12 = v0[17];
    uint64_t v14 = v0[15];

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  sub_25C245DD0();
  swift_allocError();
  *uint64_t v15 = 4;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t AccountProviding.fetchCurrentAccountFirstName()(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 120) = a2;
  *(void *)(v3 + 128) = v2;
  *(void *)(v3 + 112) = a1;
  uint64_t v6 = sub_25C274840();
  *(void *)(v3 + 136) = v6;
  *(void *)(v3 + 144) = *(void *)(v6 - 8);
  *(void *)(v3 + 152) = swift_task_alloc();
  uint64_t v7 = swift_task_alloc();
  *(unsigned char *)(v3 + 233) = 1;
  *(void *)(v3 + 160) = v7;
  uint64_t v8 = *(int **)(a2 + 8);
  *(void *)(v3 + 168) = v8;
  *(void *)(v3 + 176) = (a2 + 8) & 0xFFFFFFFFFFFFLL | 0x49FB000000000000;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 184) = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_25C26C050;
  return v11(v3 + 233, a1, a2);
}

{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  os_log_type_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  uint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(void *)(v9 + 24) = 106;
  *(unsigned char *)(v9 + 32) = 2;
  *(void *)(v9 + 40) = 49;
  *(void *)(v9 + 48) = &unk_26A5992A0;
  *(void *)(v9 + 56) = v8;
  return sub_25C274590();
}

uint64_t sub_25C26C050(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 192) = a1;
  *(void *)(v3 + 200) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_25C26C5D0;
  }
  else {
    uint64_t v4 = sub_25C26C164;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

id sub_25C26C164()
{
  id v1 = objc_msgSend(*(id *)(v0 + 192), sel_aa_firstName);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_25C274910();
  }
  char v3 = sub_25C274BC0();
  swift_bridgeObjectRelease();
  if (v3)
  {

    uint64_t v4 = *(int **)(v0 + 168);
    *(unsigned char *)(v0 + 232) = 0;
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v4 + *v4);
    os_log_type_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 208) = v5;
    *os_log_type_t v5 = v0;
    v5[1] = sub_25C26C334;
    uint64_t v6 = *(void *)(v0 + 120);
    uint64_t v7 = *(void *)(v0 + 112);
    return (id)v15(v0 + 232, v7, v6);
  }
  else
  {
    id result = objc_msgSend(*(id *)(v0 + 192), sel_aa_firstName);
    if (result)
    {
      uint64_t v9 = result;
      unint64_t v10 = *(void **)(v0 + 192);
      uint64_t v11 = sub_25C274910();
      uint64_t v13 = v12;

      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
      return (id)v14(v11, v13);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_25C26C334(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 216) = a1;
  *(void *)(v3 + 224) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_25C26C888;
  }
  else {
    uint64_t v4 = sub_25C26C448;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_25C26C448()
{
  id v1 = objc_msgSend(*(id *)(v0 + 216), sel_ams_firstName);
  if (!v1)
  {

    goto LABEL_5;
  }
  uint64_t v2 = v1;
  uint64_t v3 = *(void **)(v0 + 216);
  uint64_t v4 = sub_25C274910();
  uint64_t v6 = v5;

  *(void *)(v0 + 64) = v4;
  *(void *)(v0 + 72) = v6;
  sub_25C249214();
  swift_bridgeObjectRetain();
  LOBYTE(v2) = sub_25C274C30();

  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_25C245DD0();
    swift_allocError();
    *uint64_t v7 = 4;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v10(v4, v6);
}

uint64_t sub_25C26C5D0()
{
  uint64_t v25 = v0;
  id v1 = *(void **)(v0 + 200);
  sub_25C274740();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_25C274830();
  os_log_type_t v5 = sub_25C274B40();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 200);
    uint64_t v20 = *(void *)(v0 + 144);
    uint64_t v21 = *(void *)(v0 + 136);
    uint64_t v22 = *(void *)(v0 + 160);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v24 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = MEMORY[0x2611830C0](*(void *)(v0 + 24), *(void *)(v0 + 32));
    *(void *)(v0 + 88) = sub_25C24A1D8(v9, v10, &v24);
    sub_25C274BE0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C23E000, v4, v5, "Failed fetching Apple Account while fetching first name: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261183790](v8, -1, -1);
    MEMORY[0x261183790](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v21);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 200);
    uint64_t v12 = *(void *)(v0 + 160);
    uint64_t v13 = *(void *)(v0 + 136);
    uint64_t v14 = *(void *)(v0 + 144);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  uint64_t v15 = *(int **)(v0 + 168);
  *(unsigned char *)(v0 + 232) = 0;
  uint64_t v23 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v15 + *v15);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_25C26C334;
  uint64_t v17 = *(void *)(v0 + 120);
  uint64_t v18 = *(void *)(v0 + 112);
  return v23(v0 + 232, v18, v17);
}

uint64_t sub_25C26C888()
{
  uint64_t v22 = v0;
  id v1 = (void *)v0[28];
  sub_25C274740();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_25C274830();
  os_log_type_t v5 = sub_25C274B40();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[28];
    uint64_t v18 = v0[18];
    uint64_t v19 = v0[17];
    uint64_t v20 = v0[19];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v21 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = MEMORY[0x2611830C0](v0[6], v0[7]);
    v0[13] = sub_25C24A1D8(v9, v10, &v21);
    sub_25C274BE0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C23E000, v4, v5, "Failed fetching iTunes Account while fetching first name: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261183790](v8, -1, -1);
    MEMORY[0x261183790](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    uint64_t v11 = (void *)v0[28];
    uint64_t v13 = v0[18];
    uint64_t v12 = v0[19];
    uint64_t v14 = v0[17];

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  sub_25C245DD0();
  swift_allocError();
  *uint64_t v15 = 4;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t AccountProviding.fetchCurrentAccount()(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(v2 + 32) = 0;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *os_log_type_t v5 = v2;
  v5[1] = sub_25C26CC0C;
  return v7(v2 + 32, a1, a2);
}

{
  char v3;

  id v3 = 0;
  return (*(uint64_t (**)(char *, uint64_t))(a2 + 32))(&v3, a1);
}

uint64_t sub_25C26CC0C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 24) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_25C26CD48, 0, 0);
  }
  else
  {
    os_log_type_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_25C26CD48()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25C26CDA0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a1;
  *(unsigned char *)(v5 + 48) = a3 & 1;
  unint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 8) + **(int **)(a5 + 8));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v8;
  *uint64_t v8 = v5;
  v8[1] = sub_25C26CEB4;
  return v10(v5 + 48, a4, a5);
}

uint64_t sub_25C26CEB4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 32) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_25C273CC0;
  }
  else
  {
    *(void *)(v4 + 40) = a1;
    uint64_t v5 = sub_25C273CC8;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25C26CFDC()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  uint64_t v5 = *(void *)(v1 + 64) + v3 + 1;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v5, v4);
}

uint64_t sub_25C26D068(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  unint64_t v6 = (*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v7 = v1 + v6;
  char v8 = *(unsigned char *)(v1 + v6 + *(void *)(*(void *)(v4 - 8) + 64));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25C273C9C;
  return sub_25C26CDA0(a1, v7, v8, v4, v5);
}

uint64_t sub_25C26D17C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a1;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 16) + **(int **)(a5 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v9;
  *uint64_t v9 = v5;
  v9[1] = sub_25C26D28C;
  return v11(a3, a4, a5);
}

uint64_t sub_25C26D28C(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    unint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return MEMORY[0x270FA2498](sub_25C273CC4, 0, 0);
  }
}

uint64_t sub_25C26D3D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a4 + 24) + **(int **)(a4 + 24));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v7;
  *uint64_t v7 = v4;
  v7[1] = sub_25C26D4D4;
  return v9(a3, a4);
}

uint64_t sub_25C26D4D4(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    unint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return MEMORY[0x270FA2498](sub_25C26D620, 0, 0);
  }
}

uint64_t sub_25C26D620()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25C26D7C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a4 + 56) + **(int **)(a4 + 56));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v7;
  *uint64_t v7 = v4;
  v7[1] = sub_25C26D8C4;
  return v9(a3, a4);
}

uint64_t sub_25C26D8C4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *v3;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v8 = *(uint64_t (**)(void))(v7 + 8);
    return v8();
  }
  else
  {
    *(void *)(v6 + 32) = a2;
    *(void *)(v6 + 40) = a1;
    return MEMORY[0x270FA2498](sub_25C26DA20, 0, 0);
  }
}

uint64_t sub_25C26DA20()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 16);
  *uint64_t v2 = *(void *)(v0 + 40);
  v2[1] = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void *AccountProvider.__allocating_init(eventHub:accountStore:)(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v6 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  v6[21] = 0;
  sub_25C266048(a3, (uint64_t)(v6 + 14));
  v6[19] = a1;
  v6[20] = a2;
  return v6;
}

void *AccountProvider.init(eventHub:accountStore:)(uint64_t a1, uint64_t a2, long long *a3)
{
  swift_defaultActor_initialize();
  v3[21] = 0;
  sub_25C266048(a3, (uint64_t)(v3 + 14));
  v3[19] = a1;
  v3[20] = a2;
  return v3;
}

uint64_t AccountProvider.deinit()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  id v2 = objc_msgSend(self, sel_SMUACDAccountStoreDidChangeNotification);
  objc_msgSend(v1, sel_removeObserver_name_object_, v0, v2, 0);

  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  swift_unknownObjectRelease();

  swift_defaultActor_destroy();
  return v0;
}

uint64_t AccountProvider.__deallocating_deinit()
{
  AccountProvider.deinit();
  return MEMORY[0x270FA2418](v0);
}

void sub_25C26DBD4()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  id v2 = objc_msgSend(self, sel_SMUACDAccountStoreDidChangeNotification);
  objc_msgSend(v1, sel_addObserver_selector_name_object_, v0, sel_onAccountChanged, v2, 0);
}

uint64_t sub_25C26DC88()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350130);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25C274B00();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  _OWORD v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_25C271618((uint64_t)v4);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_25C274AF0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_25C274A90();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_26A599318;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    void v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_25C26DEC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = sub_25C274840();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C26DF84, 0, 0);
}

uint64_t sub_25C26DF84()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  sub_25C274740();
  sub_25C274820();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25C26E07C;
  return sub_25C26E264();
}

uint64_t sub_25C26E07C(void *a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  if (v1) {

  }
  else {
  uint64_t v5 = *(void *)(v4 + 16);
  }
  return MEMORY[0x270FA2498](sub_25C26E19C, v5, 0);
}

uint64_t sub_25C26E19C()
{
  uint64_t v1 = v0[2];
  v0[7] = *(void *)(v1 + 152);
  v0[8] = *(void *)(v1 + 160);
  return MEMORY[0x270FA2498](sub_25C26E1CC, 0, 0);
}

uint64_t sub_25C26E1CC()
{
  swift_getObjectType();
  sub_25C271730();
  sub_25C274610();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C26E264()
{
  v1[10] = v0;
  uint64_t v2 = sub_25C274840();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C26E334, v0, 0);
}

uint64_t sub_25C26E334()
{
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v2 = v1[17];
  uint64_t v3 = v1[18];
  __swift_project_boxed_opaque_existential_1(v1 + 14, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 24) + **(int **)(v3 + 24));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25C26E438;
  return v6(v2, v3);
}

uint64_t sub_25C26E438(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 128) = a1;
  *(void *)(v4 + 136) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 80);
  if (v1) {
    uint64_t v6 = sub_25C26E7EC;
  }
  else {
    uint64_t v6 = sub_25C26E56C;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_25C26E56C()
{
  char v32 = v0;
  uint64_t v1 = v0[10];
  uint64_t v2 = (void *)v0[16];
  uint64_t v3 = *(void **)(v1 + 168);
  *(void *)(v1 + 168) = v2;
  id v4 = v2;

  sub_25C274740();
  id v5 = v4;
  uint64_t v6 = sub_25C274830();
  os_log_type_t v7 = sub_25C274B50();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = (void *)v0[16];
  if (v8)
  {
    os_log_type_t v30 = v7;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v31 = v29;
    *(_DWORD *)uint64_t v10 = 136315138;
    id v11 = objc_msgSend(v9, sel_accountDescription);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = sub_25C274910();
      uint64_t v15 = v14;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v15 = 0;
    }
    uint64_t v19 = (void *)v0[16];
    uint64_t v20 = v0[12];
    uint64_t v27 = v0[11];
    uint64_t v28 = v0[14];
    v0[5] = v13;
    v0[6] = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B350150);
    uint64_t v21 = sub_25C274BB0();
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    v0[9] = sub_25C24A1D8(v21, v23, &v31);
    sub_25C274BE0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C23E000, v6, v30, "Successfully fetched Primary Account: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261183790](v29, -1, -1);
    MEMORY[0x261183790](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v28, v27);
  }
  else
  {
    uint64_t v16 = v0[14];
    uint64_t v17 = v0[11];
    uint64_t v18 = v0[12];

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v25 = v0[16];
  return v24(v25);
}

uint64_t sub_25C26E7EC()
{
  uint64_t v21 = v0;
  uint64_t v1 = (void *)v0[17];
  sub_25C274740();
  id v2 = v1;
  id v3 = v1;
  id v4 = sub_25C274830();
  os_log_type_t v5 = sub_25C274B50();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[17];
    uint64_t v17 = v0[12];
    uint64_t v18 = v0[11];
    uint64_t v19 = v0[13];
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v20 = v8;
    *(_DWORD *)os_log_type_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = MEMORY[0x2611830C0](v0[3], v0[4]);
    v0[8] = sub_25C24A1D8(v9, v10, &v20);
    sub_25C274BE0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C23E000, v4, v5, "Failed to fetch Primary Account: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261183790](v8, -1, -1);
    MEMORY[0x261183790](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  }
  else
  {
    id v11 = (void *)v0[17];
    uint64_t v13 = v0[12];
    uint64_t v12 = v0[13];
    uint64_t v14 = v0[11];

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t AccountProvider.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_25C26EA7C()
{
  return v0;
}

uint64_t AccountProvider.fetchCurrentAccount(accountType:)(unsigned char *a1)
{
  *(void *)(v2 + 64) = v1;
  *(unsigned char *)(v2 + 144) = *a1;
  return MEMORY[0x270FA2498](sub_25C26EAB0, v1, 0);
}

uint64_t sub_25C26EAB0()
{
  char v1 = *(unsigned char *)(v0 + 144);
  id v2 = objc_msgSend(self, sel_sharedInstance);
  id v3 = objc_msgSend(v2, sel_selectedUserProfile);
  *(void *)(v0 + 72) = v3;

  if ((v1 & 1) == 0)
  {
    if (v3)
    {
      id v20 = objc_msgSend((id)swift_unknownObjectRetain(), sel_iTunesAltDSID);
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void **)(v0 + 64);
        uint64_t v23 = sub_25C274910();
        uint64_t v25 = v24;

        *(void *)(v0 + 80) = v25;
        uint64_t v26 = v22 + 14;
        uint64_t v27 = v22[17];
        uint64_t v28 = v22[18];
        __swift_project_boxed_opaque_existential_1(v26, v27);
        char v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 + 8) + **(int **)(v28 + 8));
        uint64_t v29 = (void *)swift_task_alloc();
        *(void *)(v0 + 88) = v29;
        *uint64_t v29 = v0;
        v29[1] = sub_25C26EFA4;
        uint64_t v14 = v23;
        uint64_t v15 = v25;
        uint64_t v16 = v27;
        uint64_t v17 = v28;
        uint64_t v18 = v44;
        return v18(v14, v15, v16, v17);
      }
      goto LABEL_12;
    }
    char v39 = *(void **)(v0 + 64);
    uint64_t v40 = v39[17];
    uint64_t v41 = v39[18];
    __swift_project_boxed_opaque_existential_1(v39 + 14, v40);
    uint64_t v46 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v41 + 16) + **(int **)(v41 + 16));
    char v42 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v42;
    *char v42 = v0;
    v42[1] = sub_25C26F150;
    uint64_t v36 = v40;
    uint64_t v37 = v41;
    char v38 = v46;
    return v38(v36, v37);
  }
  if (!v3)
  {
    char v32 = *(void **)(v0 + 64);
    uint64_t v33 = v32[17];
    uint64_t v34 = v32[18];
    __swift_project_boxed_opaque_existential_1(v32 + 14, v33);
    char v45 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v34 + 24) + **(int **)(v34 + 24));
    char v35 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v35;
    *char v35 = v0;
    v35[1] = sub_25C26F400;
    uint64_t v36 = v33;
    uint64_t v37 = v34;
    char v38 = v45;
    return v38(v36, v37);
  }
  id v4 = objc_msgSend((id)swift_unknownObjectRetain(), sel_iCloudAltDSID);
  if (v4)
  {
    os_log_type_t v5 = v4;
    uint64_t v6 = *(void **)(v0 + 64);
    uint64_t v7 = sub_25C274910();
    uint64_t v9 = v8;

    *(void *)(v0 + 112) = v9;
    unint64_t v10 = v6 + 14;
    uint64_t v11 = v6[17];
    uint64_t v12 = v6[18];
    __swift_project_boxed_opaque_existential_1(v10, v11);
    char v43 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 + 32) + **(int **)(v12 + 32));
    uint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_25C26F250;
    uint64_t v14 = v7;
    uint64_t v15 = v9;
    uint64_t v16 = v11;
    uint64_t v17 = v12;
    uint64_t v18 = v43;
    return v18(v14, v15, v16, v17);
  }
LABEL_12:
  sub_25C245DD0();
  swift_allocError();
  *os_log_type_t v30 = 1;
  swift_willThrow();
  swift_unknownObjectRelease_n();
  uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
  return v31();
}

uint64_t sub_25C26EFA4(uint64_t a1)
{
  id v3 = (void *)*v2;
  id v4 = (void *)*v2;
  v4[2] = v2;
  v4[3] = a1;
  v4[4] = v1;
  v4[12] = v1;
  swift_task_dealloc();
  uint64_t v5 = v3[8];
  if (v1) {
    uint64_t v6 = sub_25C26F500;
  }
  else {
    uint64_t v6 = sub_25C26F0D8;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_25C26F0D8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  id v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_25C26F150(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_25C26F250(uint64_t a1)
{
  id v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[5] = v2;
  v4[6] = a1;
  v4[7] = v1;
  v4[16] = v1;
  swift_task_dealloc();
  uint64_t v5 = v3[8];
  if (v1) {
    uint64_t v6 = sub_25C26F570;
  }
  else {
    uint64_t v6 = sub_25C26F384;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_25C26F384()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  id v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_25C26F400(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_25C26F500()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C26F570()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t AccountProvider.fetchMatchingAccount(_:)(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_25C2740C0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C26F6A4, v1, 0);
}

uint64_t sub_25C26F6A4()
{
  uint64_t v15 = v0;
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 16);
  sub_25C2587F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  ACAccount.init(_:)(v1);
  uint64_t v6 = v5;
  *(void *)(v0 + 56) = v5;
  ACAccount.type.getter(v14);
  int v7 = v14[0];
  *(unsigned char *)(v0 + 89) = v14[0];
  if (v7 == 2)
  {
    uint64_t v8 = sub_25C273FA0();
    sub_25C25AF50();
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v8 - 8) + 104))(v9, *MEMORY[0x263F6A2F8], v8);
    swift_willThrow();

    swift_task_dealloc();
    unint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
  else
  {
    *(unsigned char *)(v0 + 88) = v7 & 1;
    uint64_t v12 = swift_task_alloc();
    *(void *)(v0 + 64) = v12;
    *(void *)uint64_t v12 = v0;
    *(void *)(v12 + 8) = sub_25C26F880;
    uint64_t v13 = *(void *)(v0 + 24);
    *(void *)(v12 + 64) = v13;
    *(unsigned char *)(v12 + 144) = *(unsigned char *)(v0 + 88);
    return MEMORY[0x270FA2498](sub_25C26EAB0, v13, 0);
  }
}

uint64_t sub_25C26F880(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[9] = a1;
  v3[10] = v1;
  swift_task_dealloc();
  uint64_t v4 = v3[3];
  if (v1) {
    uint64_t v5 = sub_25C26FBD0;
  }
  else {
    uint64_t v5 = sub_25C26F998;
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

uint64_t sub_25C26F998()
{
  uint64_t v1 = *(void **)(v0 + 72);
  if ((*(unsigned char *)(v0 + 89) & 1) == 0)
  {
    id v2 = objc_msgSend(v1, sel_ams_altDSID);
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = sub_25C274910();
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    id v10 = objc_msgSend(*(id *)(v0 + 56), sel_ams_altDSID);
    if (v10) {
      goto LABEL_8;
    }
LABEL_17:
    if (!v6) {
      goto LABEL_23;
    }
    goto LABEL_18;
  }
  id v7 = objc_msgSend(v1, sel_aa_altDSID);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v4 = sub_25C274910();
    uint64_t v6 = v9;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  id v10 = objc_msgSend(*(id *)(v0 + 56), sel_aa_altDSID);
  if (!v10) {
    goto LABEL_17;
  }
LABEL_8:
  uint64_t v11 = v10;
  uint64_t v12 = sub_25C274910();
  uint64_t v14 = v13;

  if (!v6)
  {
    if (!v14) {
      goto LABEL_23;
    }
    goto LABEL_18;
  }
  if (!v14)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (v4 == v12 && v6 == v14)
  {
    uint64_t v15 = *(void **)(v0 + 56);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_24:

    swift_task_dealloc();
    uint64_t v22 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v23 = *(void *)(v0 + 72);
    return v22(v23);
  }
  char v21 = sub_25C274E70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21)
  {
LABEL_23:
    uint64_t v15 = *(void **)(v0 + 56);
    goto LABEL_24;
  }
LABEL_19:
  uint64_t v16 = *(void **)(v0 + 72);
  uint64_t v17 = *(void **)(v0 + 56);
  sub_25C245DD0();
  swift_allocError();
  *uint64_t v18 = 1;
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_25C26FBD0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t AccountProvider.fetchPrimaryAccount()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_25C26FC5C, v0, 0);
}

uint64_t sub_25C26FC5C()
{
  uint64_t v1 = *(void **)(v0[2] + 168);
  if (v1)
  {
    uint64_t v5 = (uint64_t (*)(id))v0[1];
    id v2 = v1;
    return v5(v2);
  }
  else
  {
    uint64_t v4 = (void *)swift_task_alloc();
    v0[3] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_25C26FD38;
    return sub_25C26E264();
  }
}

uint64_t sub_25C26FD38(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_25C26FE38(unsigned char *a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_25C24723C;
  *(void *)(v5 + 64) = v4;
  *(unsigned char *)(v5 + 144) = *a1;
  return MEMORY[0x270FA2498](sub_25C26EAB0, v4, 0);
}

uint64_t sub_25C26FEF0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C258898;
  return AccountProvider.fetchMatchingAccount(_:)(a1);
}

uint64_t sub_25C26FF88()
{
  uint64_t v2 = *v0;
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](sub_25C26FC5C, v2, 0);
}

uint64_t sub_25C26FFA8(char *a1)
{
  char v2 = *a1;
  uint64_t v3 = *v1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(unsigned char *)(v4 + 24) = v2;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(void *)(v5 + 24) = 106;
  *(unsigned char *)(v5 + 32) = 2;
  *(void *)(v5 + 40) = 37;
  *(void *)(v5 + 48) = &unk_26A599368;
  *(void *)(v5 + 56) = v4;
  sub_25C2587F4();
  swift_retain();
  return sub_25C274590();
}

uint64_t sub_25C270088(uint64_t a1)
{
  uint64_t v3 = sub_25C2740C0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = *v1;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8 + v7, (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(void *)(v9 + 24) = 106;
  *(unsigned char *)(v9 + 32) = 2;
  *(void *)(v9 + 40) = 41;
  *(void *)(v9 + 48) = &unk_26A599358;
  *(void *)(v9 + 56) = v8;
  sub_25C2587F4();
  swift_retain();
  return sub_25C274590();
}

uint64_t sub_25C27022C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(void *)(v2 + 24) = 106;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 45;
  *(void *)(v2 + 48) = &unk_26A599348;
  *(void *)(v2 + 56) = v1;
  sub_25C2587F4();
  swift_retain();
  return sub_25C274590();
}

uint64_t sub_25C2702E8()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_26A599338 + dword_26A599338);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C27038C;
  return v3();
}

uint64_t sub_25C27038C(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_25C27049C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25C270578;
  return v6(a1);
}

uint64_t sub_25C270578()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25C270670(uint64_t a1, uint64_t a2)
{
  return sub_25C27095C(a1, a2, (uint64_t)&unk_2709933B8, (uint64_t)&unk_26A599398);
}

uint64_t sub_25C270690()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_25C2740C0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_25C2707D8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  unint64_t v7 = (*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(sub_25C2740C0() - 8) + 80);
  unint64_t v9 = v7 + v6 + v8;
  uint64_t v10 = v1 + v7;
  uint64_t v11 = v1 + (v9 & ~v8);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_25C273C9C;
  return sub_25C26D17C(a1, v10, v11, v4, v5);
}

uint64_t sub_25C270924()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_25C27095C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25C270BF8(a1, a2, *(void *)(v4 + 16), *(void *)(v4 + 24), *(unsigned char *)(v4 + 32), *(void *)(v4 + 40), *(void *)(v4 + 48), *(void *)(v4 + 56), a3, a4);
}

uint64_t sub_25C27099C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = v1
     + ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80));
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unint64_t v7 = v2;
  v7[1] = sub_25C273C9C;
  return sub_25C26D3D8(a1, v6, v4, v5);
}

uint64_t objectdestroy_14Tm()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25C270B10(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = v1
     + ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80));
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unint64_t v7 = v2;
  v7[1] = sub_25C273C9C;
  return sub_25C26D7C8(a1, v6, v4, v5);
}

uint64_t sub_25C270BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v46 = a8;
  uint64_t v47 = a2;
  uint64_t v16 = a10;
  uint64_t v44 = a9;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350130);
  MEMORY[0x270FA5388](v17 - 8);
  char v45 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_25C274840();
  uint64_t v42 = *(void *)(v19 - 8);
  uint64_t v43 = v19;
  MEMORY[0x270FA5388](v19);
  char v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v48 = sub_25C271784(0x65uLL);
  sub_25C274730();
  uint64_t v22 = sub_25C274830();
  os_log_type_t v23 = sub_25C274B50();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v40 = a1;
    uint64_t v25 = v24;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v38 = v26;
    *(_DWORD *)uint64_t v25 = 134218498;
    uint64_t v49 = v48;
    uint64_t v50 = v26;
    uint64_t v41 = a10;
    sub_25C274BE0();
    *(_WORD *)(v25 + 12) = 2080;
    uint64_t v37 = v25 + 14;
    uint64_t v27 = sub_25C274D10();
    uint64_t v39 = a3;
    uint64_t v49 = sub_25C24A1D8(v27, v28, &v50);
    sub_25C274BE0();
    a3 = v39;
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 22) = 2048;
    uint64_t v49 = a6;
    uint64_t v16 = v41;
    sub_25C274BE0();
    _os_log_impl(&dword_25C23E000, v22, v23, "Converting from Async-Await to Promise Main: %ld:%s:%lu", (uint8_t *)v25, 0x20u);
    uint64_t v29 = v38;
    swift_arrayDestroy();
    MEMORY[0x261183790](v29, -1, -1);
    uint64_t v30 = v25;
    a1 = v40;
    MEMORY[0x261183790](v30, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v42 + 8))(v21, v43);
  uint64_t v31 = sub_25C274B00();
  uint64_t v32 = (uint64_t)v45;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v45, 1, 1, v31);
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = 0;
  *(void *)(v33 + 24) = 0;
  *(void *)(v33 + 32) = a7;
  uint64_t v34 = v47;
  unint64_t v35 = v48;
  *(void *)(v33 + 40) = v46;
  *(void *)(v33 + 48) = v35;
  *(void *)(v33 + 56) = a3;
  *(void *)(v33 + 64) = a4;
  *(unsigned char *)(v33 + 72) = a5;
  *(void *)(v33 + 80) = a6;
  *(void *)(v33 + 88) = a1;
  *(void *)(v33 + 96) = v34;
  swift_retain();
  swift_retain();
  sub_25C27230C(v32, v16, v33);
  return swift_release();
}

uint64_t sub_25C270F60(uint64_t a1, uint64_t a2)
{
  return sub_25C27095C(a1, a2, (uint64_t)&unk_270993368, (uint64_t)&unk_26A599378);
}

uint64_t dispatch thunk of AccountProviding.fetchCurrentAccount(accountType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_25C2474E4;
  return v9(a1, a2, a3);
}

{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of AccountProviding.fetchMatchingAccount(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_25C25889C;
  return v9(a1, a2, a3);
}

{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of AccountProviding.fetchPrimaryAccount()(uint64_t a1, uint64_t a2)
{
  unint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 24) + **(int **)(a2 + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C25889C;
  return v7(a1, a2);
}

{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AccountProviding.fetchCurrentAccountFirstName()(uint64_t a1, uint64_t a2)
{
  unint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 56) + **(int **)(a2 + 56));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C2713A4;
  return v7(a1, a2);
}

uint64_t sub_25C2713A4(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t type metadata accessor for AccountProvider()
{
  return self;
}

uint64_t method lookup function for AccountProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AccountProvider);
}

uint64_t dispatch thunk of AccountProvider.__allocating_init(eventHub:accountStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of AccountProvider.activate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t sub_25C271524()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25C271564(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_25C273C9C;
  return sub_25C26DEC4(a1, v4, v5, v6);
}

uint64_t sub_25C271618(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350130);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C271678(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C273C9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A599320 + dword_26A599320);
  return v6(a1, v4);
}

unint64_t sub_25C271730()
{
  unint64_t result = qword_26B350148;
  if (!qword_26B350148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B350148);
  }
  return result;
}

unint64_t sub_25C271784(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0;
    MEMORY[0x2611837B0](&v3, 8);
    unint64_t result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0;
          MEMORY[0x2611837B0](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25C271810(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 64) = v15;
  *(_OWORD *)(v8 + 48) = v14;
  *(unsigned char *)(v8 + 104) = v13;
  *(void *)(v8 + 32) = a7;
  *(void *)(v8 + 40) = a8;
  *(void *)(v8 + 24) = a6;
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v8 + 72) = v9;
  *uint64_t v9 = v8;
  v9[1] = sub_25C271910;
  return v11(v8 + 16);
}

uint64_t sub_25C271910()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_25C271BD4;
  }
  else {
    unint64_t v2 = sub_25C271A24;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C271A24()
{
  sub_25C274AE0();
  *(void *)(v0 + 88) = sub_25C274AD0();
  uint64_t v2 = sub_25C274A90();
  return MEMORY[0x270FA2498](sub_25C271AB8, v2, v1);
}

uint64_t sub_25C271AB8()
{
  uint64_t v1 = *(void (**)(uint64_t *))(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  int v7 = *(unsigned __int8 *)(v0 + 104);
  swift_release();
  sub_25C272A00(v6, v5, v4, v7, v3, v1, v2, *(void **)(v0 + 16));
  return MEMORY[0x270FA2498](sub_25C271B74, 0, 0);
}

uint64_t sub_25C271B74()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C271BD4()
{
  sub_25C274AE0();
  *(void *)(v0 + 96) = sub_25C274AD0();
  uint64_t v2 = sub_25C274A90();
  return MEMORY[0x270FA2498](sub_25C271C68, v2, v1);
}

uint64_t sub_25C271C68()
{
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v3 = *(void (**)(uint64_t *))(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v7 = *(void *)(v0 + 24);
  uint64_t v6 = *(void *)(v0 + 32);
  int v8 = *(unsigned __int8 *)(v0 + 104);
  swift_release();
  sub_25C2724B0(v7, v6, v5, v8, v4, v3, v2, v1);
  return MEMORY[0x270FA2498](sub_25C271D2C, 0, 0);
}

uint64_t sub_25C271D2C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C271D8C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 72) = v15;
  *(_OWORD *)(v8 + 56) = v14;
  *(unsigned char *)(v8 + 112) = v13;
  *(void *)(v8 + 40) = a7;
  *(void *)(v8 + 48) = a8;
  *(void *)(v8 + 32) = a6;
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v8 + 80) = v9;
  *uint64_t v9 = v8;
  v9[1] = sub_25C271E8C;
  return v11(v8 + 16);
}

uint64_t sub_25C271E8C()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25C272154;
  }
  else {
    uint64_t v2 = sub_25C271FA0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C271FA0()
{
  sub_25C274AE0();
  *(void *)(v0 + 96) = sub_25C274AD0();
  uint64_t v2 = sub_25C274A90();
  return MEMORY[0x270FA2498](sub_25C272034, v2, v1);
}

uint64_t sub_25C272034()
{
  uint64_t v1 = *(void (**)(void))(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  int v7 = *(unsigned __int8 *)(v0 + 112);
  swift_release();
  sub_25C272CA4(v6, v5, v4, v7, v3, v1, v2, *(void *)(v0 + 16), *(void *)(v0 + 24));
  return MEMORY[0x270FA2498](sub_25C2720F4, 0, 0);
}

uint64_t sub_25C2720F4()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C272154()
{
  sub_25C274AE0();
  *(void *)(v0 + 104) = sub_25C274AD0();
  uint64_t v2 = sub_25C274A90();
  return MEMORY[0x270FA2498](sub_25C2721E8, v2, v1);
}

uint64_t sub_25C2721E8()
{
  uint64_t v1 = *(void **)(v0 + 88);
  uint64_t v3 = *(void (**)(uint64_t *))(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v7 = *(void *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  int v8 = *(unsigned __int8 *)(v0 + 112);
  swift_release();
  sub_25C272758(v7, v6, v5, v8, v4, v3, v2, v1);
  return MEMORY[0x270FA2498](sub_25C2722AC, 0, 0);
}

uint64_t sub_25C2722AC()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C27230C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C274B00();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25C274AF0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25C271618(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25C274A90();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_25C2724B0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, void (*a6)(uint64_t *), uint64_t a7, void *a8)
{
  uint64_t v33 = a5;
  int v32 = a4;
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v13 = sub_25C274840();
  uint64_t v34 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C274730();
  uint64_t v16 = sub_25C274830();
  os_log_type_t v17 = sub_25C274B50();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v27 = v13;
    uint64_t v19 = v18;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v29 = v8;
    uint64_t v26 = v20;
    uint64_t v35 = v20;
    *(_DWORD *)uint64_t v19 = 134218498;
    uint64_t v37 = a1;
    sub_25C274BE0();
    *(_WORD *)(v19 + 12) = 2080;
    uint64_t v28 = a7;
    uint64_t v21 = sub_25C274D10();
    uint64_t v37 = sub_25C24A1D8(v21, v22, &v35);
    sub_25C274BE0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2048;
    uint64_t v37 = v33;
    sub_25C274BE0();
    _os_log_impl(&dword_25C23E000, v16, v17, "Finished Main A->P conversion: %ld:%s:%lu", (uint8_t *)v19, 0x20u);
    uint64_t v23 = v26;
    swift_arrayDestroy();
    MEMORY[0x261183790](v23, -1, -1);
    MEMORY[0x261183790](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v34 + 8))(v15, v27);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v34 + 8))(v15, v13);
  }
  uint64_t v35 = (uint64_t)a8;
  char v36 = 1;
  id v24 = a8;
  a6(&v35);
}

void sub_25C272758(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, void (*a6)(uint64_t *), uint64_t a7, void *a8)
{
  uint64_t v32 = a5;
  int v31 = a4;
  uint64_t v29 = a2;
  uint64_t v30 = a3;
  uint64_t v13 = sub_25C274840();
  uint64_t v33 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C274730();
  uint64_t v16 = sub_25C274830();
  os_log_type_t v17 = sub_25C274B50();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v26 = v13;
    uint64_t v19 = v18;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v28 = v8;
    uint64_t v25 = v20;
    v34[0] = v20;
    *(_DWORD *)uint64_t v19 = 134218498;
    uint64_t v36 = a1;
    sub_25C274BE0();
    *(_WORD *)(v19 + 12) = 2080;
    uint64_t v27 = a7;
    uint64_t v21 = sub_25C274D10();
    uint64_t v36 = sub_25C24A1D8(v21, v22, v34);
    sub_25C274BE0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2048;
    uint64_t v36 = v32;
    sub_25C274BE0();
    _os_log_impl(&dword_25C23E000, v16, v17, "Finished Main A->P conversion: %ld:%s:%lu", (uint8_t *)v19, 0x20u);
    uint64_t v23 = v25;
    swift_arrayDestroy();
    MEMORY[0x261183790](v23, -1, -1);
    MEMORY[0x261183790](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v15, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v33 + 8))(v15, v13);
  }
  v34[0] = (uint64_t)a8;
  v34[1] = 0;
  char v35 = 1;
  id v24 = a8;
  a6(v34);
}

void sub_25C272A00(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, void (*a6)(uint64_t *), uint64_t a7, void *a8)
{
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  LODWORD(v28) = a4;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v11 = sub_25C274840();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C274730();
  uint64_t v15 = sub_25C274830();
  os_log_type_t v16 = sub_25C274B50();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v24 = v12;
    uint64_t v18 = v17;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v31 = v23;
    *(_DWORD *)uint64_t v18 = 134218498;
    uint64_t v33 = a1;
    sub_25C274BE0();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v25 = a7;
    uint64_t v19 = sub_25C274D10();
    uint64_t v28 = v11;
    uint64_t v33 = sub_25C24A1D8(v19, v20, &v31);
    sub_25C274BE0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    uint64_t v33 = v29;
    sub_25C274BE0();
    _os_log_impl(&dword_25C23E000, v15, v16, "Finished Main A->P conversion: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    uint64_t v21 = v23;
    swift_arrayDestroy();
    MEMORY[0x261183790](v21, -1, -1);
    MEMORY[0x261183790](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v28);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  uint64_t v31 = (uint64_t)a8;
  char v32 = 0;
  id v22 = a8;
  v30(&v31);
}

uint64_t sub_25C272CA4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, void (*a6)(void), uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v34 = a5;
  int v33 = a4;
  uint64_t v31 = a2;
  uint64_t v32 = a3;
  uint64_t v13 = sub_25C274840();
  uint64_t v35 = *(void *)(v13 - 8);
  uint64_t v36 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C274730();
  os_log_type_t v16 = sub_25C274830();
  os_log_type_t v17 = sub_25C274B50();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v30 = v9;
    uint64_t v19 = v18;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v29 = a6;
    uint64_t v27 = v20;
    v37[0] = v20;
    *(_DWORD *)uint64_t v19 = 134218498;
    uint64_t v39 = a1;
    sub_25C274BE0();
    *(_WORD *)(v19 + 12) = 2080;
    uint64_t v28 = a8;
    uint64_t v21 = sub_25C274D10();
    uint64_t v39 = sub_25C24A1D8(v21, v22, v37);
    a8 = v28;
    sub_25C274BE0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2048;
    uint64_t v39 = v34;
    sub_25C274BE0();
    _os_log_impl(&dword_25C23E000, v16, v17, "Finished Main A->P conversion: %ld:%s:%lu", (uint8_t *)v19, 0x20u);
    uint64_t v23 = v27;
    swift_arrayDestroy();
    uint64_t v24 = v23;
    a6 = v29;
    MEMORY[0x261183790](v24, -1, -1);
    MEMORY[0x261183790](v19, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v36);
  v37[0] = a8;
  v37[1] = a9;
  char v38 = 0;
  swift_bridgeObjectRetain();
  a6(v37);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C272F30(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25C273CCC;
  return v6(a1);
}

uint64_t sub_25C27300C(uint64_t a1, uint64_t *a2, char a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v4 = *a2;
  *(unsigned char *)(v3 + 48) = a3 & 1;
  uint64_t v5 = swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *(void *)uint64_t v5 = v3;
  *(void *)(v5 + 8) = sub_25C2730CC;
  *(void *)(v5 + 64) = v4;
  *(unsigned char *)(v5 + 144) = *(unsigned char *)(v3 + 48);
  return MEMORY[0x270FA2498](sub_25C26EAB0, v4, 0);
}

uint64_t sub_25C2730CC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 32) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_25C273218;
  }
  else
  {
    *(void *)(v4 + 40) = a1;
    uint64_t v5 = sub_25C2731F4;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25C2731F4()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 40);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25C273218()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25C273230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_25C26D28C;
  return AccountProvider.fetchMatchingAccount(_:)(a3);
}

uint64_t sub_25C2732CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_25C2732EC, v3, 0);
}

uint64_t sub_25C2732EC()
{
  uint64_t v1 = *(void **)(v0[3] + 168);
  if (v1)
  {
    v0[5] = v1;
    id v2 = v1;
    return MEMORY[0x270FA2498](sub_25C273CC8, 0, 0);
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[4] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_25C2733CC;
    return sub_25C26E264();
  }
}

uint64_t sub_25C2733CC(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 40) = a1;
    return MEMORY[0x270FA2498](sub_25C273CC8, 0, 0);
  }
}

uint64_t sub_25C273518(uint64_t a1)
{
  *(void *)(v2 + 16) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25C2735D0;
  uint64_t v5 = dword_26A599340;
  return ((uint64_t (*)(uint64_t, uint64_t *))((char *)&dword_26A599340 + v5))(a1, (uint64_t *)(v2 + 16));
}

uint64_t sub_25C2735D0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25C2736C4()
{
  uint64_t v1 = sub_25C2740C0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25C273790(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_25C2740C0() - 8);
  uint64_t v5 = v1 + 16;
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_25C273C9C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_26A599350 + dword_26A599350);
  return v8(a1, v5, v6);
}

uint64_t sub_25C273884()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t sub_25C2738BC(uint64_t a1)
{
  uint64_t v4 = (uint64_t *)(v1 + 16);
  char v5 = *(unsigned char *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_25C24510C;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t *, char))((char *)&dword_26A599360 + dword_26A599360);
  return v7(a1, v4, v5);
}

void sub_25C27397C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C24510C;
  uint64_t v2 = (char *)&dword_26A599370 + dword_26A599370;
  __asm { BR              X9; sub_25C271D8C }
}

uint64_t sub_25C273A90()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C273AC8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_25C273C9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A599380 + dword_26A599380);
  return v6(a1, v4);
}

void sub_25C273B84()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C273C9C;
  uint64_t v2 = (char *)&dword_26A599390 + dword_26A599390;
  __asm { BR              X9; sub_25C271810 }
}

uint64_t sub_25C273CD0()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_25C273CE0()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_25C273CF0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_25C273D00()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25C273D10()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25C273D20()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25C273D30()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25C273D40()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25C273D50()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25C273D60()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25C273D70()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25C273D80()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25C273D90()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25C273DA0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25C273DB0()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_25C273DC0()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_25C273DD0()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_25C273DE0()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_25C273DF0()
{
  return MEMORY[0x270EF13B8]();
}

uint64_t sub_25C273E00()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25C273E10()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25C273E20()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25C273E30()
{
  return MEMORY[0x270F5ECB0]();
}

uint64_t sub_25C273E40()
{
  return MEMORY[0x270F5ECC0]();
}

uint64_t sub_25C273E50()
{
  return MEMORY[0x270F5ECC8]();
}

uint64_t sub_25C273E60()
{
  return MEMORY[0x270F5ECD0]();
}

uint64_t sub_25C273E70()
{
  return MEMORY[0x270F5ECD8]();
}

uint64_t sub_25C273E80()
{
  return MEMORY[0x270F5ECE0]();
}

uint64_t sub_25C273E90()
{
  return MEMORY[0x270F5F998]();
}

uint64_t sub_25C273EA0()
{
  return MEMORY[0x270F5F9B0]();
}

uint64_t sub_25C273EB0()
{
  return MEMORY[0x270F5F9B8]();
}

uint64_t sub_25C273EC0()
{
  return MEMORY[0x270F5F9C0]();
}

uint64_t sub_25C273ED0()
{
  return MEMORY[0x270F5F9C8]();
}

uint64_t sub_25C273EE0()
{
  return MEMORY[0x270F5FCC8]();
}

uint64_t sub_25C273EF0()
{
  return MEMORY[0x270F60028]();
}

uint64_t sub_25C273F00()
{
  return MEMORY[0x270F60050]();
}

uint64_t _s21SeymourClientServices22MultiUserGroupActivityV4hash4intoys6HasherVz_tF_0()
{
  return MEMORY[0x270F60058]();
}

uint64_t sub_25C273F20()
{
  return MEMORY[0x270F60060]();
}

uint64_t sub_25C273F30()
{
  return MEMORY[0x270F60068]();
}

uint64_t sub_25C273F40()
{
  return MEMORY[0x270F60350]();
}

uint64_t sub_25C273F50()
{
  return MEMORY[0x270F60358]();
}

uint64_t sub_25C273F60()
{
  return MEMORY[0x270F60428]();
}

uint64_t sub_25C273F70()
{
  return MEMORY[0x270F60430]();
}

uint64_t sub_25C273F80()
{
  return MEMORY[0x270F60438]();
}

uint64_t sub_25C273F90()
{
  return MEMORY[0x270F60440]();
}

uint64_t sub_25C273FA0()
{
  return MEMORY[0x270F60480]();
}

uint64_t sub_25C273FB0()
{
  return MEMORY[0x270F60818]();
}

uint64_t sub_25C273FC0()
{
  return MEMORY[0x270F60878]();
}

uint64_t sub_25C273FD0()
{
  return MEMORY[0x270F60880]();
}

uint64_t sub_25C273FE0()
{
  return MEMORY[0x270F60888]();
}

uint64_t sub_25C273FF0()
{
  return MEMORY[0x270F60890]();
}

uint64_t sub_25C274000()
{
  return MEMORY[0x270F60898]();
}

uint64_t sub_25C274010()
{
  return MEMORY[0x270F608A0]();
}

uint64_t sub_25C274020()
{
  return MEMORY[0x270F608A8]();
}

uint64_t sub_25C274030()
{
  return MEMORY[0x270F608B0]();
}

uint64_t sub_25C274040()
{
  return MEMORY[0x270F608B8]();
}

uint64_t sub_25C274050()
{
  return MEMORY[0x270F608C0]();
}

uint64_t sub_25C274060()
{
  return MEMORY[0x270F608C8]();
}

uint64_t sub_25C274070()
{
  return MEMORY[0x270F608D0]();
}

uint64_t sub_25C274080()
{
  return MEMORY[0x270F608D8]();
}

uint64_t sub_25C274090()
{
  return MEMORY[0x270F608E0]();
}

uint64_t sub_25C2740A0()
{
  return MEMORY[0x270F608E8]();
}

uint64_t sub_25C2740B0()
{
  return MEMORY[0x270F608F0]();
}

uint64_t sub_25C2740C0()
{
  return MEMORY[0x270F608F8]();
}

uint64_t sub_25C2740D0()
{
  return MEMORY[0x270F60B28]();
}

uint64_t sub_25C2740E0()
{
  return MEMORY[0x270F60B30]();
}

uint64_t sub_25C2740F0()
{
  return MEMORY[0x270F60B38]();
}

uint64_t sub_25C274100()
{
  return MEMORY[0x270F60B40]();
}

uint64_t sub_25C274110()
{
  return MEMORY[0x270F60E58]();
}

uint64_t sub_25C274120()
{
  return MEMORY[0x270F60E70]();
}

uint64_t sub_25C274130()
{
  return MEMORY[0x270F60E80]();
}

uint64_t sub_25C274140()
{
  return MEMORY[0x270F60F08]();
}

uint64_t sub_25C274150()
{
  return MEMORY[0x270F60F10]();
}

uint64_t sub_25C274160()
{
  return MEMORY[0x270F60F70]();
}

uint64_t sub_25C274170()
{
  return MEMORY[0x270F610B0]();
}

uint64_t sub_25C274180()
{
  return MEMORY[0x270F613D8]();
}

uint64_t sub_25C274190()
{
  return MEMORY[0x270F613E0]();
}

uint64_t sub_25C2741A0()
{
  return MEMORY[0x270F613E8]();
}

uint64_t sub_25C2741B0()
{
  return MEMORY[0x270F613F0]();
}

uint64_t sub_25C2741C0()
{
  return MEMORY[0x270F613F8]();
}

uint64_t sub_25C2741D0()
{
  return MEMORY[0x270F61400]();
}

uint64_t sub_25C2741E0()
{
  return MEMORY[0x270F61408]();
}

uint64_t sub_25C2741F0()
{
  return MEMORY[0x270F61410]();
}

uint64_t sub_25C274200()
{
  return MEMORY[0x270F61418]();
}

uint64_t sub_25C274210()
{
  return MEMORY[0x270F61420]();
}

uint64_t sub_25C274220()
{
  return MEMORY[0x270F61428]();
}

uint64_t sub_25C274230()
{
  return MEMORY[0x270F61430]();
}

uint64_t sub_25C274240()
{
  return MEMORY[0x270F61438]();
}

uint64_t sub_25C274250()
{
  return MEMORY[0x270F61440]();
}

uint64_t sub_25C274260()
{
  return MEMORY[0x270F61448]();
}

uint64_t sub_25C274270()
{
  return MEMORY[0x270F61450]();
}

uint64_t sub_25C274280()
{
  return MEMORY[0x270F61458]();
}

uint64_t sub_25C274290()
{
  return MEMORY[0x270F61460]();
}

uint64_t sub_25C2742A0()
{
  return MEMORY[0x270F61468]();
}

uint64_t sub_25C2742B0()
{
  return MEMORY[0x270F61470]();
}

uint64_t sub_25C2742C0()
{
  return MEMORY[0x270F61478]();
}

uint64_t sub_25C2742D0()
{
  return MEMORY[0x270F61480]();
}

uint64_t sub_25C2742E0()
{
  return MEMORY[0x270F61488]();
}

uint64_t sub_25C2742F0()
{
  return MEMORY[0x270F61490]();
}

uint64_t sub_25C274300()
{
  return MEMORY[0x270F61540]();
}

uint64_t sub_25C274310()
{
  return MEMORY[0x270F61548]();
}

uint64_t sub_25C274320()
{
  return MEMORY[0x270F61550]();
}

uint64_t sub_25C274330()
{
  return MEMORY[0x270F61558]();
}

uint64_t sub_25C274340()
{
  return MEMORY[0x270F61560]();
}

uint64_t sub_25C274350()
{
  return MEMORY[0x270F61568]();
}

uint64_t sub_25C274360()
{
  return MEMORY[0x270F61570]();
}

uint64_t sub_25C274370()
{
  return MEMORY[0x270F61578]();
}

uint64_t sub_25C274380()
{
  return MEMORY[0x270F61580]();
}

uint64_t sub_25C274390()
{
  return MEMORY[0x270F61588]();
}

uint64_t sub_25C2743A0()
{
  return MEMORY[0x270F617C8]();
}

uint64_t sub_25C2743B0()
{
  return MEMORY[0x270F617D8]();
}

uint64_t sub_25C2743C0()
{
  return MEMORY[0x270F617E0]();
}

uint64_t sub_25C2743D0()
{
  return MEMORY[0x270F61A20]();
}

uint64_t sub_25C2743E0()
{
  return MEMORY[0x270F61BA0]();
}

uint64_t sub_25C2743F0()
{
  return MEMORY[0x270F61BF0]();
}

uint64_t sub_25C274400()
{
  return MEMORY[0x270F61BF8]();
}

uint64_t sub_25C274410()
{
  return MEMORY[0x270F61C00]();
}

uint64_t sub_25C274420()
{
  return MEMORY[0x270F61C08]();
}

uint64_t sub_25C274430()
{
  return MEMORY[0x270F61C10]();
}

uint64_t sub_25C274440()
{
  return MEMORY[0x270F61C18]();
}

uint64_t sub_25C274450()
{
  return MEMORY[0x270F61C20]();
}

uint64_t sub_25C274460()
{
  return MEMORY[0x270F61C28]();
}

uint64_t sub_25C274470()
{
  return MEMORY[0x270F61C30]();
}

uint64_t sub_25C274480()
{
  return MEMORY[0x270F61C38]();
}

uint64_t sub_25C274490()
{
  return MEMORY[0x270F61C40]();
}

uint64_t sub_25C2744A0()
{
  return MEMORY[0x270F61C48]();
}

uint64_t sub_25C2744B0()
{
  return MEMORY[0x270F61C50]();
}

uint64_t sub_25C2744C0()
{
  return MEMORY[0x270F61C58]();
}

uint64_t sub_25C2744D0()
{
  return MEMORY[0x270F61C60]();
}

uint64_t sub_25C2744E0()
{
  return MEMORY[0x270F61C68]();
}

uint64_t sub_25C2744F0()
{
  return MEMORY[0x270F61C70]();
}

uint64_t sub_25C274500()
{
  return MEMORY[0x270F61C78]();
}

uint64_t sub_25C274510()
{
  return MEMORY[0x270F61C80]();
}

uint64_t sub_25C274520()
{
  return MEMORY[0x270F61C88]();
}

uint64_t sub_25C274530()
{
  return MEMORY[0x270F61C90]();
}

uint64_t sub_25C274540()
{
  return MEMORY[0x270F61C98]();
}

uint64_t sub_25C274550()
{
  return MEMORY[0x270F61CA0]();
}

uint64_t sub_25C274560()
{
  return MEMORY[0x270F61CA8]();
}

uint64_t sub_25C274570()
{
  return MEMORY[0x270F61CB0]();
}

uint64_t sub_25C274580()
{
  return MEMORY[0x270F61CB8]();
}

uint64_t sub_25C274590()
{
  return MEMORY[0x270F61D58]();
}

uint64_t sub_25C2745A0()
{
  return MEMORY[0x270F61D60]();
}

uint64_t sub_25C2745B0()
{
  return MEMORY[0x270F61D68]();
}

uint64_t sub_25C2745C0()
{
  return MEMORY[0x270F61D70]();
}

uint64_t sub_25C2745D0()
{
  return MEMORY[0x270F61F58]();
}

uint64_t sub_25C2745E0()
{
  return MEMORY[0x270F5DD30]();
}

uint64_t sub_25C2745F0()
{
  return MEMORY[0x270F5DD38]();
}

uint64_t sub_25C274600()
{
  return MEMORY[0x270F5DD40]();
}

uint64_t sub_25C274610()
{
  return MEMORY[0x270F5DFB0]();
}

uint64_t sub_25C274620()
{
  return MEMORY[0x270F5E130]();
}

uint64_t sub_25C274630()
{
  return MEMORY[0x270F5E238]();
}

uint64_t sub_25C274640()
{
  return MEMORY[0x270F5E248]();
}

uint64_t sub_25C274650()
{
  return MEMORY[0x270F5E250]();
}

uint64_t sub_25C274660()
{
  return MEMORY[0x270F5E258]();
}

uint64_t sub_25C274670()
{
  return MEMORY[0x270F5E260]();
}

uint64_t sub_25C274680()
{
  return MEMORY[0x270F5E268]();
}

uint64_t sub_25C274690()
{
  return MEMORY[0x270F5E270]();
}

uint64_t sub_25C2746A0()
{
  return MEMORY[0x270F5E278]();
}

uint64_t sub_25C2746B0()
{
  return MEMORY[0x270F5E280]();
}

uint64_t sub_25C2746C0()
{
  return MEMORY[0x270F5E288]();
}

uint64_t sub_25C2746D0()
{
  return MEMORY[0x270F5E290]();
}

uint64_t sub_25C2746E0()
{
  return MEMORY[0x270F5E3A0]();
}

uint64_t sub_25C2746F0()
{
  return MEMORY[0x270F5E3A8]();
}

uint64_t sub_25C274700()
{
  return MEMORY[0x270F5E458]();
}

uint64_t sub_25C274710()
{
  return MEMORY[0x270F5E460]();
}

uint64_t sub_25C274720()
{
  return MEMORY[0x270F5E8D0]();
}

uint64_t sub_25C274730()
{
  return MEMORY[0x270F5E948]();
}

uint64_t sub_25C274740()
{
  return MEMORY[0x270F5E950]();
}

uint64_t sub_25C274750()
{
  return MEMORY[0x270F5E9A0]();
}

uint64_t sub_25C274760()
{
  return MEMORY[0x270F5E9A8]();
}

uint64_t sub_25C274770()
{
  return MEMORY[0x270EF2E78]();
}

uint64_t sub_25C274780()
{
  return MEMORY[0x270EF2E80]();
}

uint64_t sub_25C274790()
{
  return MEMORY[0x270EF2E88]();
}

uint64_t sub_25C2747A0()
{
  return MEMORY[0x270EF2EA0]();
}

uint64_t sub_25C2747B0()
{
  return MEMORY[0x270EF2EA8]();
}

uint64_t sub_25C2747C0()
{
  return MEMORY[0x270EF2EB8]();
}

uint64_t sub_25C2747D0()
{
  return MEMORY[0x270EF2EC0]();
}

uint64_t sub_25C2747E0()
{
  return MEMORY[0x270EF2EC8]();
}

uint64_t sub_25C2747F0()
{
  return MEMORY[0x270EF2FE0]();
}

uint64_t sub_25C274800()
{
  return MEMORY[0x270EF3048]();
}

uint64_t sub_25C274810()
{
  return MEMORY[0x270EF3050]();
}

uint64_t sub_25C274820()
{
  return MEMORY[0x270F5EA30]();
}

uint64_t sub_25C274830()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C274840()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C274850()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25C274860()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_25C274870()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25C274880()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25C274890()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25C2748A0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25C2748B0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25C2748C0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25C2748D0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25C2748E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C2748F0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25C274900()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25C274910()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C274920()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25C274930()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25C274940()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C274950()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25C274960()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C274970()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25C274980()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25C2749A0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25C2749B0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25C2749C0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25C2749D0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25C2749E0()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_25C2749F0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25C274A00()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25C274A10()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25C274A20()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25C274A30()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25C274A40()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_25C274A50()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25C274A60()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25C274A70()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_25C274A80()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25C274A90()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25C274AA0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25C274AB0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25C274AC0()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_25C274AD0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25C274AE0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25C274AF0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25C274B00()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25C274B10()
{
  return MEMORY[0x270F62120]();
}

uint64_t sub_25C274B20()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25C274B30()
{
  return MEMORY[0x270EF1E20]();
}

uint64_t sub_25C274B40()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C274B50()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25C274B60()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25C274B70()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25C274B80()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_25C274B90()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25C274BA0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25C274BB0()
{
  return MEMORY[0x270F62148]();
}

uint64_t sub_25C274BC0()
{
  return MEMORY[0x270F5EA80]();
}

uint64_t sub_25C274BD0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25C274BE0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C274BF0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C274C00()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25C274C10()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25C274C20()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_25C274C30()
{
  return MEMORY[0x270F5EA88]();
}

uint64_t sub_25C274C40()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25C274C50()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25C274C60()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_25C274C70()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25C274C80()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_25C274C90()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_25C274CA0()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_25C274CB0()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_25C274CC0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25C274CD0()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_25C274CE0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25C274CF0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25C274D00()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C274D10()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25C274D20()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25C274D30()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C274D40()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25C274D50()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25C274D60()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25C274D70()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25C274D80()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25C274D90()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C274DA0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25C274DB0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25C274DC0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25C274DD0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25C274DE0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C274E00()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25C274E10()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25C274E20()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25C274E30()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25C274E40()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25C274E50()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_25C274E60()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25C274E70()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C274E90()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25C274EA0()
{
  return MEMORY[0x270F62180]();
}

uint64_t sub_25C274EB0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25C274EC0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25C274ED0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25C274EE0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25C274EF0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C274F00()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25C274F10()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25C274F20()
{
  return MEMORY[0x270F62198]();
}

uint64_t sub_25C274F30()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_25C274F40()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25C274F50()
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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