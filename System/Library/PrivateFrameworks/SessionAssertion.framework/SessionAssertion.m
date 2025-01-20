uint64_t FakeForegroundInvalidationState.activityIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

SessionAssertion::FakeForegroundInvalidationState __swiftcall FakeForegroundInvalidationState.init(activityIdentifiers:)(SessionAssertion::FakeForegroundInvalidationState activityIdentifiers)
{
  v1->activityIdentifiers._rawValue = activityIdentifiers.activityIdentifiers._rawValue;
  return activityIdentifiers;
}

uint64_t sub_1B8F6AD78()
{
  return 1;
}

uint64_t sub_1B8F6AD80()
{
  return sub_1B8F89CA0();
}

uint64_t sub_1B8F6ADC4()
{
  return sub_1B8F89C70();
}

uint64_t sub_1B8F6ADEC()
{
  return sub_1B8F89CA0();
}

unint64_t sub_1B8F6AE2C()
{
  return 0xD000000000000013;
}

uint64_t sub_1B8F6AE48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1B8F6B6C4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1B8F6AE74()
{
  return 0;
}

void sub_1B8F6AE80(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1B8F6AE8C(uint64_t a1)
{
  unint64_t v2 = sub_1B8F6B104();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F6AEC8(uint64_t a1)
{
  unint64_t v2 = sub_1B8F6B104();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t FakeForegroundInvalidationState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF7380);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F6B104();
  sub_1B8F89CC0();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF7390);
  sub_1B8F6B388(&qword_1E9EF7398);
  sub_1B8F89BA0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
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

unint64_t sub_1B8F6B104()
{
  unint64_t result = qword_1E9EF7388;
  if (!qword_1E9EF7388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7388);
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

uint64_t FakeForegroundInvalidationState.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF73A0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F6B104();
  sub_1B8F89CB0();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF7390);
    sub_1B8F6B388(&qword_1E9EF73A8);
    sub_1B8F89B10();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
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

uint64_t sub_1B8F6B388(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9EF7390);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B8F6B3EC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return FakeForegroundInvalidationState.init(from:)(a1, a2);
}

uint64_t sub_1B8F6B404(void *a1)
{
  return FakeForegroundInvalidationState.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for FakeForegroundInvalidationState()
{
  return &type metadata for FakeForegroundInvalidationState;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_1EB9C80C8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EB9C80C8);
    }
  }
}

uint64_t getEnumTagSinglePayload for FakeForegroundInvalidationState.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for FakeForegroundInvalidationState.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1B8F6B578);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1B8F6B5A0()
{
  return 0;
}

ValueMetadata *type metadata accessor for FakeForegroundInvalidationState.CodingKeys()
{
  return &type metadata for FakeForegroundInvalidationState.CodingKeys;
}

unint64_t sub_1B8F6B5C0()
{
  unint64_t result = qword_1E9EF7470;
  if (!qword_1E9EF7470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7470);
  }
  return result;
}

unint64_t sub_1B8F6B618()
{
  unint64_t result = qword_1E9EF7478;
  if (!qword_1E9EF7478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7478);
  }
  return result;
}

unint64_t sub_1B8F6B670()
{
  unint64_t result = qword_1E9EF7480;
  if (!qword_1E9EF7480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7480);
  }
  return result;
}

uint64_t sub_1B8F6B6C4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x80000001B8F8CC30)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_1B8F89BE0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

double AssertionReconnectProperties.identifier.getter@<D0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  double result = *(double *)v1;
  *a1 = *(void *)v1;
  a1[1] = v2;
  return result;
}

uint64_t AssertionReconnectProperties.request.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AssertionReconnectProperties() + 20);

  return sub_1B8F6B7F0(v3, a1);
}

uint64_t type metadata accessor for AssertionReconnectProperties()
{
  uint64_t result = qword_1EB9C81A8;
  if (!qword_1EB9C81A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B8F6B7F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AssertionAcquisitionRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t AssertionReconnectProperties.init(identifier:request:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1[1];
  *a3 = *a1;
  a3[1] = v5;
  uint64_t v6 = type metadata accessor for AssertionReconnectProperties();
  return sub_1B8F6C034(a2, (uint64_t)a3 + *(int *)(v6 + 20), (uint64_t (*)(void))type metadata accessor for AssertionAcquisitionRequest);
}

BOOL sub_1B8F6B8B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1B8F6B8CC()
{
  return sub_1B8F89CA0();
}

uint64_t sub_1B8F6B914()
{
  return sub_1B8F89C70();
}

uint64_t sub_1B8F6B940()
{
  return sub_1B8F89CA0();
}

uint64_t sub_1B8F6B984()
{
  if (*v0) {
    return 0x74736575716572;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_1B8F6B9C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1B8F6CA9C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1B8F6B9EC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1B8F6B9F8(uint64_t a1)
{
  unint64_t v2 = sub_1B8F6BC48();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F6BA34(uint64_t a1)
{
  unint64_t v2 = sub_1B8F6BC48();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AssertionReconnectProperties.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF7488);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F6BC48();
  sub_1B8F89CC0();
  uint64_t v9 = v3[1];
  uint64_t v12 = *v3;
  uint64_t v13 = v9;
  v11[15] = 0;
  sub_1B8F6BC9C();
  sub_1B8F89BA0();
  if (!v2)
  {
    type metadata accessor for AssertionReconnectProperties();
    LOBYTE(v12) = 1;
    type metadata accessor for AssertionAcquisitionRequest();
    sub_1B8F6C634(&qword_1EB9C7E40, (void (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest);
    sub_1B8F89BA0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1B8F6BC48()
{
  unint64_t result = qword_1E9EF7490;
  if (!qword_1E9EF7490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7490);
  }
  return result;
}

unint64_t sub_1B8F6BC9C()
{
  unint64_t result = qword_1EB9C8108;
  if (!qword_1EB9C8108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8108);
  }
  return result;
}

uint64_t AssertionReconnectProperties.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v21 = type metadata accessor for AssertionAcquisitionRequest();
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF7498);
  uint64_t v20 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AssertionReconnectProperties();
  MEMORY[0x1F4188790]();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F6BC48();
  sub_1B8F89CB0();
  if (!v2)
  {
    uint64_t v18 = v8;
    v11 = v10;
    uint64_t v12 = v20;
    char v25 = 0;
    sub_1B8F6BFE0();
    uint64_t v13 = v22;
    sub_1B8F89B10();
    uint64_t v14 = v24;
    void *v11 = v23;
    v11[1] = v14;
    LOBYTE(v23) = 1;
    sub_1B8F6C634(&qword_1EB9C7F38, (void (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest);
    sub_1B8F89B10();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v13);
    uint64_t v15 = v19;
    sub_1B8F6C034((uint64_t)v5, (uint64_t)v11 + *(int *)(v18 + 20), (uint64_t (*)(void))type metadata accessor for AssertionAcquisitionRequest);
    sub_1B8F6C034((uint64_t)v11, v15, (uint64_t (*)(void))type metadata accessor for AssertionReconnectProperties);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_1B8F6BFE0()
{
  unint64_t result = qword_1EB9C8118;
  if (!qword_1EB9C8118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8118);
  }
  return result;
}

uint64_t sub_1B8F6C034(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B8F6C09C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AssertionReconnectProperties.init(from:)(a1, a2);
}

uint64_t sub_1B8F6C0B4(void *a1)
{
  return AssertionReconnectProperties.encode(to:)(a1);
}

uint64_t AssertionReconnectRequest.assertions.getter()
{
  return swift_bridgeObjectRetain();
}

SessionAssertion::AssertionReconnectRequest __swiftcall AssertionReconnectRequest.init(assertions:)(SessionAssertion::AssertionReconnectRequest assertions)
{
  v1->assertions._rawValue = assertions.assertions._rawValue;
  return assertions;
}

uint64_t sub_1B8F6C0DC()
{
  return 0x6F69747265737361;
}

uint64_t sub_1B8F6C0F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6F69747265737361 && a2 == 0xEA0000000000736ELL)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1B8F89BE0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1B8F6C19C(uint64_t a1)
{
  unint64_t v2 = sub_1B8F6C3A0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F6C1D8(uint64_t a1)
{
  unint64_t v2 = sub_1B8F6C3A0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AssertionReconnectRequest.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7EF0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F6C3A0();
  sub_1B8F89CC0();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C8258);
  sub_1B8F6C5A0(&qword_1EB9C7E98, &qword_1EB9C7E48);
  sub_1B8F89BA0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1B8F6C3A0()
{
  unint64_t result = qword_1EB9C8120;
  if (!qword_1EB9C8120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8120);
  }
  return result;
}

uint64_t AssertionReconnectRequest.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7F68);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F6C3A0();
  sub_1B8F89CB0();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C8258);
    sub_1B8F6C5A0(&qword_1EB9C7F60, &qword_1EB9C7F40);
    sub_1B8F89B10();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B8F6C5A0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB9C8258);
    sub_1B8F6C634(a2, (void (*)(uint64_t))type metadata accessor for AssertionReconnectProperties);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B8F6C634(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B8F6C67C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return AssertionReconnectRequest.init(from:)(a1, a2);
}

uint64_t sub_1B8F6C694(void *a1)
{
  return AssertionReconnectRequest.encode(to:)(a1);
}

NSData __swiftcall AssertionReconnectRequest._bridgeToObjectiveC()()
{
  sub_1B8F89510();
  swift_allocObject();
  sub_1B8F89500();
  sub_1B8F6C768();
  uint64_t v0 = sub_1B8F894F0();
  unint64_t v2 = v1;
  uint64_t v3 = sub_1B8F895A0();
  sub_1B8F6C7BC(v0, v2);
  swift_release();
  return (NSData)v3;
}

unint64_t sub_1B8F6C768()
{
  unint64_t result = qword_1EB9C7E28;
  if (!qword_1EB9C7E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C7E28);
  }
  return result;
}

uint64_t sub_1B8F6C7BC(uint64_t a1, unint64_t a2)
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

uint64_t static AssertionReconnectRequest._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (a1)
  {
    sub_1B8F894E0();
    swift_allocObject();
    sub_1B8F894D0();
    uint64_t v3 = sub_1B8F895B0();
    unint64_t v5 = v4;
    sub_1B8F6CD6C();
    sub_1B8F894C0();
    sub_1B8F6C7BC(v3, v5);
    uint64_t result = swift_release();
    *a2 = v7;
  }
  else
  {
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t sub_1B8F6C8F8()
{
  sub_1B8F89510();
  swift_allocObject();
  sub_1B8F89500();
  sub_1B8F6C768();
  uint64_t v0 = sub_1B8F894F0();
  unint64_t v2 = v1;
  uint64_t v3 = sub_1B8F895A0();
  sub_1B8F6C7BC(v0, v2);
  swift_release();
  return v3;
}

uint64_t sub_1B8F6C9BC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (a1)
  {
    sub_1B8F894E0();
    swift_allocObject();
    sub_1B8F894D0();
    uint64_t v3 = sub_1B8F895B0();
    unint64_t v5 = v4;
    sub_1B8F6CD6C();
    sub_1B8F894C0();
    sub_1B8F6C7BC(v3, v5);
    uint64_t result = swift_release();
    *a2 = v7;
  }
  else
  {
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t sub_1B8F6CA9C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74736575716572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1B8F89BE0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t _s16SessionAssertion0B16ReconnectRequestV26_forceBridgeFromObjectiveC_6resultySo6NSDataC_ACSgztFZ_0(uint64_t a1, void *a2)
{
  sub_1B8F894E0();
  swift_allocObject();
  sub_1B8F894D0();
  uint64_t v3 = sub_1B8F895B0();
  unint64_t v5 = v4;
  sub_1B8F6CD6C();
  sub_1B8F894C0();
  swift_bridgeObjectRelease();
  sub_1B8F6C7BC(v3, v5);
  uint64_t result = swift_release();
  *a2 = v7;
  return result;
}

uint64_t _s16SessionAssertion0B16ReconnectRequestV34_conditionallyBridgeFromObjectiveC_6resultSbSo6NSDataC_ACSgztFZ_0(uint64_t a1, void *a2)
{
  swift_bridgeObjectRelease();
  sub_1B8F894E0();
  swift_allocObject();
  sub_1B8F894D0();
  uint64_t v3 = sub_1B8F895B0();
  unint64_t v5 = v4;
  sub_1B8F6CD6C();
  sub_1B8F894C0();
  swift_release();
  sub_1B8F6C7BC(v3, v5);
  uint64_t result = 1;
  *a2 = v7;
  return result;
}

unint64_t sub_1B8F6CD6C()
{
  unint64_t result = qword_1EB9C7F28;
  if (!qword_1EB9C7F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C7F28);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AssertionReconnectProperties(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    char v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_1B8F895D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    uint64_t v9 = (int *)type metadata accessor for AssertionAcquisitionRequest();
    uint64_t v10 = v9[5];
    v11 = &v6[v10];
    uint64_t v12 = &v7[v10];
    uint64_t v13 = type metadata accessor for AssertionAttribute();
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v14 = sub_1B8F89600();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    uint64_t v16 = v9[6];
    uint64_t v17 = &v6[v16];
    uint64_t v18 = &v7[v16];
    uint64_t v19 = *((void *)v18 + 1);
    *(void *)uint64_t v17 = *(void *)v18;
    *((void *)v17 + 1) = v19;
    uint64_t v20 = v9[7];
    uint64_t v21 = &v6[v20];
    uint64_t v22 = &v7[v20];
    uint64_t v23 = *(void *)v22;
    uint64_t v24 = *((void *)v22 + 1);
    char v25 = v22[16];
    swift_bridgeObjectRetain();
    sub_1B8F6CFA4();
    *(void *)uint64_t v21 = v23;
    *((void *)v21 + 1) = v24;
    v21[16] = v25;
    uint64_t v26 = v9[8];
    v27 = &v6[v26];
    v28 = &v7[v26];
    *(void *)v27 = *(void *)v28;
    v27[8] = v28[8];
  }
  return v3;
}

uint64_t sub_1B8F6CFA4()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for AssertionReconnectProperties(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_1B8F895D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  uint64_t v4 = v2 + *(int *)(type metadata accessor for AssertionAcquisitionRequest() + 20);
  type metadata accessor for AssertionAttribute();
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v5 = sub_1B8F89600();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();

  return sub_1B8F6D0A8();
}

uint64_t sub_1B8F6D0A8()
{
  return swift_bridgeObjectRelease();
}

_OWORD *initializeWithCopy for AssertionReconnectProperties(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  char v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1B8F895D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  uint64_t v8 = (int *)type metadata accessor for AssertionAcquisitionRequest();
  uint64_t v9 = v8[5];
  uint64_t v10 = &v5[v9];
  v11 = &v6[v9];
  uint64_t v12 = type metadata accessor for AssertionAttribute();
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v13 = sub_1B8F89600();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v10, v11, v13);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  uint64_t v14 = v8[6];
  uint64_t v15 = &v5[v14];
  uint64_t v16 = &v6[v14];
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = v17;
  uint64_t v18 = v8[7];
  uint64_t v19 = &v5[v18];
  uint64_t v20 = &v6[v18];
  uint64_t v21 = *(void *)v20;
  uint64_t v22 = *((void *)v20 + 1);
  char v23 = v20[16];
  swift_bridgeObjectRetain();
  sub_1B8F6CFA4();
  *(void *)uint64_t v19 = v21;
  *((void *)v19 + 1) = v22;
  v19[16] = v23;
  uint64_t v24 = v8[8];
  char v25 = &v5[v24];
  uint64_t v26 = &v6[v24];
  *(void *)char v25 = *(void *)v26;
  v25[8] = v26[8];
  return a1;
}

uint64_t assignWithCopy for AssertionReconnectProperties(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_1B8F895D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  uint64_t v9 = type metadata accessor for AssertionAcquisitionRequest();
  uint64_t v10 = (int *)v9;
  if (a1 != a2)
  {
    uint64_t v11 = *(int *)(v9 + 20);
    uint64_t v12 = (void *)(v6 + v11);
    uint64_t v13 = (const void *)(v7 + v11);
    sub_1B8F6D41C(v6 + v11);
    uint64_t v14 = type metadata accessor for AssertionAttribute();
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v15 = sub_1B8F89600();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 16))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
  }
  uint64_t v16 = v10[6];
  uint64_t v17 = (void *)(v6 + v16);
  uint64_t v18 = (void *)(v7 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = v10[7];
  uint64_t v20 = v6 + v19;
  uint64_t v21 = (uint64_t *)(v7 + v19);
  uint64_t v22 = *v21;
  uint64_t v23 = v21[1];
  char v24 = *((unsigned char *)v21 + 16);
  sub_1B8F6CFA4();
  *(void *)uint64_t v20 = v22;
  *(void *)(v20 + 8) = v23;
  *(unsigned char *)(v20 + 16) = v24;
  sub_1B8F6D0A8();
  uint64_t v25 = v10[8];
  uint64_t v26 = v6 + v25;
  v27 = (uint64_t *)(v7 + v25);
  uint64_t v28 = *v27;
  *(unsigned char *)(v26 + 8) = *((unsigned char *)v27 + 8);
  *(void *)uint64_t v26 = v28;
  return a1;
}

uint64_t sub_1B8F6D41C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AssertionAttribute();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *initializeWithTake for AssertionReconnectProperties(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1B8F895D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  uint64_t v8 = (int *)type metadata accessor for AssertionAcquisitionRequest();
  uint64_t v9 = v8[5];
  uint64_t v10 = &v5[v9];
  uint64_t v11 = &v6[v9];
  uint64_t v12 = type metadata accessor for AssertionAttribute();
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v13 = sub_1B8F89600();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  *(_OWORD *)&v5[v8[6]] = *(_OWORD *)&v6[v8[6]];
  uint64_t v14 = v8[7];
  uint64_t v15 = &v5[v14];
  uint64_t v16 = &v6[v14];
  v15[16] = v16[16];
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  uint64_t v17 = v8[8];
  uint64_t v18 = &v5[v17];
  uint64_t v19 = &v6[v17];
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  return a1;
}

void *assignWithTake for AssertionReconnectProperties(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_1B8F895D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 40))(v6, v7, v8);
  uint64_t v9 = type metadata accessor for AssertionAcquisitionRequest();
  uint64_t v10 = (int *)v9;
  if (a1 != a2)
  {
    uint64_t v11 = *(int *)(v9 + 20);
    uint64_t v12 = &v6[v11];
    uint64_t v13 = &v7[v11];
    sub_1B8F6D41C((uint64_t)&v6[v11]);
    uint64_t v14 = type metadata accessor for AssertionAttribute();
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v15 = sub_1B8F89600();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
  }
  uint64_t v16 = v10[6];
  uint64_t v17 = &v6[v16];
  uint64_t v18 = &v7[v16];
  uint64_t v20 = *(void *)v18;
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = v20;
  *((void *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v10[7];
  uint64_t v22 = &v6[v21];
  uint64_t v23 = &v7[v21];
  char v24 = v23[16];
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  v22[16] = v24;
  sub_1B8F6D0A8();
  uint64_t v25 = v10[8];
  uint64_t v26 = &v6[v25];
  v27 = &v7[v25];
  *(void *)uint64_t v26 = *(void *)v27;
  v26[8] = v27[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for AssertionReconnectProperties(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B8F6D7B4);
}

uint64_t sub_1B8F6D7B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = type metadata accessor for AssertionAcquisitionRequest();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);

  return v6(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for AssertionReconnectProperties(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B8F6D838);
}

uint64_t sub_1B8F6D838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = type metadata accessor for AssertionAcquisitionRequest();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(v5, a2, a2, v6);
}

uint64_t sub_1B8F6D8AC()
{
  uint64_t result = type metadata accessor for AssertionAcquisitionRequest();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AssertionReconnectRequest()
{
  return &type metadata for AssertionReconnectRequest;
}

unsigned char *storeEnumTagSinglePayload for AssertionReconnectRequest.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1B8F6D9F0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AssertionReconnectRequest.CodingKeys()
{
  return &type metadata for AssertionReconnectRequest.CodingKeys;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AssertionReconnectProperties.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AssertionReconnectProperties.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B8F6DB90);
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

uint64_t sub_1B8F6DBB8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1B8F6DBC0(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AssertionReconnectProperties.CodingKeys()
{
  return &type metadata for AssertionReconnectProperties.CodingKeys;
}

unint64_t sub_1B8F6DBE0()
{
  unint64_t result = qword_1E9EF74A0;
  if (!qword_1E9EF74A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF74A0);
  }
  return result;
}

unint64_t sub_1B8F6DC38()
{
  unint64_t result = qword_1E9EF74A8;
  if (!qword_1E9EF74A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF74A8);
  }
  return result;
}

unint64_t sub_1B8F6DC90()
{
  unint64_t result = qword_1EB9C8130;
  if (!qword_1EB9C8130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8130);
  }
  return result;
}

unint64_t sub_1B8F6DCE8()
{
  unint64_t result = qword_1EB9C8128;
  if (!qword_1EB9C8128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8128);
  }
  return result;
}

unint64_t sub_1B8F6DD40()
{
  unint64_t result = qword_1E9EF74B0;
  if (!qword_1E9EF74B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF74B0);
  }
  return result;
}

unint64_t sub_1B8F6DD98()
{
  unint64_t result = qword_1E9EF74B8;
  if (!qword_1E9EF74B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF74B8);
  }
  return result;
}

uint64_t sub_1B8F6DDEC()
{
  uint64_t v0 = sub_1B8F89650();
  __swift_allocate_value_buffer(v0, qword_1EB9C8150);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB9C8150);
  return sub_1B8F89640();
}

uint64_t static AssertionServiceDefinition.domain.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EB9C8168 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B8F89650();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EB9C8150);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t static AssertionServiceDefinition.serviceName.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_1B8F6DF34@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EB9C8168 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B8F89650();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EB9C8150);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1B8F6DFDC()
{
  return 0xD00000000000001FLL;
}

ValueMetadata *type metadata accessor for AssertionServiceDefinition()
{
  return &type metadata for AssertionServiceDefinition;
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

uint64_t sub_1B8F6E0D4()
{
  sub_1B8F899C0();
  sub_1B8F89750();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  uint64_t v1 = OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF74D0);
  sub_1B8F89720();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  uint64_t v2 = *(void *)(v0 + v1);
  if (v2)
  {
    uint64_t v3 = *(os_unfair_lock_s **)(*(void *)(v2 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v3);
    os_unfair_lock_unlock(v3);
    swift_release();
  }
  sub_1B8F89720();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1B8F6E344()
{
  return sub_1B8F6E454(&OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_activityIdentifier);
}

uint64_t sub_1B8F6E35C(uint64_t a1, uint64_t a2)
{
  return sub_1B8F6E52C(a1, a2, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_activityIdentifier);
}

uint64_t (*sub_1B8F6E368())()
{
  return j_j__swift_endAccess;
}

id sub_1B8F6E3D0()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_1B8F89700();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_1B8F6E448()
{
  return sub_1B8F6E454(&OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_explanation);
}

uint64_t sub_1B8F6E454(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_1B8F6E4B4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_1B8F89710();
  uint64_t v8 = v7;
  uint64_t v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *uint64_t v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B8F6E520(uint64_t a1, uint64_t a2)
{
  return sub_1B8F6E52C(a1, a2, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_explanation);
}

uint64_t sub_1B8F6E52C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  void *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B8F6E588(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = (void *)(*a2 + *a5);
  swift_beginAccess();
  *uint64_t v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B8F6E5F0())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B8F6E650@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion);
  if (v3)
  {
    unsigned int v4 = *(os_unfair_lock_s **)(*(void *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v4);
    uint64_t v5 = *(void *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
    char v6 = *(unsigned char *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
    os_unfair_lock_unlock(v4);
    uint64_t result = swift_release();
  }
  else
  {
    uint64_t v5 = 0;
    char v6 = 1;
  }
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v6;
  return result;
}

char *DisableAPIThrottlingAssertion.__allocating_init(explanation:activityIdentifier:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v13 = objc_allocWithZone(v6);
  return DisableAPIThrottlingAssertion.init(explanation:activityIdentifier:invalidationHandler:)(a1, a2, a3, a4, a5, a6);
}

char *DisableAPIThrottlingAssertion.init(explanation:activityIdentifier:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = type metadata accessor for AssertionAttribute();
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v29[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v29[-1] - v17;
  *(void *)&v6[OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion] = 0;
  uint64_t v19 = &v6[OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_invalidationHandler];
  *(void *)uint64_t v19 = 0;
  *((void *)v19 + 1) = 0;
  uint64_t v20 = (uint64_t *)&v6[OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_activityIdentifier];
  *uint64_t v20 = a3;
  v20[1] = a4;
  uint64_t v21 = (uint64_t *)&v6[OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_explanation];
  *uint64_t v21 = a1;
  v21[1] = a2;
  uint64_t v22 = (objc_class *)type metadata accessor for DisableAPIThrottlingAssertion();
  v31.receiver = v6;
  v31.super_class = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v23 = objc_msgSendSuper2(&v31, sel_init);
  swift_storeEnumTagMultiPayload();
  v29[0] = a3;
  v29[1] = a4;
  char v30 = 1;
  sub_1B8F6EF50((uint64_t)v18, (uint64_t)v16);
  char v24 = (void *)swift_allocObject();
  v24[2] = a5;
  v24[3] = a6;
  v24[4] = v23;
  type metadata accessor for AttributeAssertion();
  swift_allocObject();
  uint64_t v25 = (char *)v23;
  uint64_t v26 = sub_1B8F82540(a1, a2, v29, (uint64_t)v16, 0x403E000000000000, 0, (uint64_t)sub_1B8F6EFFC, (uint64_t)v24);
  swift_release();
  sub_1B8F6D41C((uint64_t)v18);
  *(void *)&v25[OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion] = v26;
  swift_release();
  return v25;
}

void sub_1B8F6E964(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t a5)
{
  if (a3)
  {
    swift_retain();
    a3(a5, a2);
    sub_1B8F6F3B8((uint64_t)a3);
  }
}

uint64_t sub_1B8F6EA88()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion))
  {
    swift_retain();
    sub_1B8F821F4();
    return swift_release();
  }
  return result;
}

uint64_t sub_1B8F6EB78()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  unint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  char v4 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if (v4) {
    return 0;
  }
  if (v3 < 8) {
    return qword_1B8F8AE48[v3];
  }
  uint64_t result = sub_1B8F89BF0();
  __break(1u);
  return result;
}

uint64_t sub_1B8F6EC78()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_attributeAssertion);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  int v4 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if (v4 == 1) {
    return v3 != 0;
  }
  else {
    return 2;
  }
}

uint64_t sub_1B8F6ED94()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_activityIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

id DisableAPIThrottlingAssertion.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void DisableAPIThrottlingAssertion.init()()
{
}

id DisableAPIThrottlingAssertion.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DisableAPIThrottlingAssertion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DisableAPIThrottlingAssertion()
{
  return self;
}

uint64_t sub_1B8F6EF50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AssertionAttribute();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B8F6EFB4()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1B8F6EFFC(uint64_t a1, uint64_t a2)
{
  sub_1B8F6E964(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_1B8F6F008@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_activityIdentifier, a2);
}

uint64_t sub_1B8F6F014(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F6E588(a1, a2, a3, a4, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_activityIdentifier);
}

uint64_t sub_1B8F6F034@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_explanation, a2);
}

uint64_t keypath_getTm@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  swift_beginAccess();
  uint64_t v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B8F6F094(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F6E588(a1, a2, a3, a4, &OBJC_IVAR____TtC16SessionAssertion29DisableAPIThrottlingAssertion_explanation);
}

uint64_t method lookup function for DisableAPIThrottlingAssertion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DisableAPIThrottlingAssertion);
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.activityIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.activityIdentifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.activityIdentifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.explanation.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.explanation.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.explanation.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.state.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.__allocating_init(explanation:activityIdentifier:invalidationHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.invalidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.snaInvalidationReason.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.snaState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of DisableAPIThrottlingAssertion.snaSessionIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t sub_1B8F6F31C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B8F6F354(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  id v4 = (id)sub_1B8F89580();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a1, v4);
}

uint64_t sub_1B8F6F3B8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1B8F6F3CC()
{
  MEMORY[0x1BA9D1680](*(void *)(v0 + 16), -1, -1);

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for UnfairLock()
{
  return self;
}

BOOL static AssertionError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AssertionError.hash(into:)()
{
  return sub_1B8F89C70();
}

uint64_t AssertionError.hashValue.getter()
{
  return sub_1B8F89CA0();
}

BOOL sub_1B8F6F4B8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_1B8F6F4D0()
{
  unint64_t result = qword_1E9EF74E8;
  if (!qword_1E9EF74E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF74E8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AssertionError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AssertionError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B8F6F690);
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

unsigned char *sub_1B8F6F6B8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AssertionError()
{
  return &type metadata for AssertionError;
}

uint64_t OpaqueObjectiveCBridgable<>._bridgeToObjectiveC()()
{
  sub_1B8F89570();
  swift_allocObject();
  sub_1B8F89560();
  uint64_t v0 = sub_1B8F89550();
  unint64_t v2 = v1;
  uint64_t v3 = sub_1B8F895A0();
  sub_1B8F6C7BC(v0, v2);
  swift_release();
  return v3;
}

uint64_t static OpaqueObjectiveCBridgable<>._forceBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1B8F89920();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  int v8 = (char *)&v13 - v7;
  sub_1B8F89540();
  swift_allocObject();
  sub_1B8F89530();
  uint64_t v9 = sub_1B8F895B0();
  unint64_t v11 = v10;
  sub_1B8F89520();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_1B8F6C7BC(v9, v11);
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(v8, 0, 1, a3);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
}

BOOL static OpaqueObjectiveCBridgable<>._conditionallyBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1B8F89920();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  unint64_t v11 = (char *)&v19 - v10;
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  uint64_t v21 = a2;
  v20(a2, v5);
  sub_1B8F89540();
  swift_allocObject();
  sub_1B8F89530();
  uint64_t v12 = sub_1B8F895B0();
  unint64_t v14 = v13;
  sub_1B8F89520();
  swift_release();
  sub_1B8F6C7BC(v12, v14);
  uint64_t v15 = *(void *)(a3 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, a3);
  uint64_t v16 = v21;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v21, v11, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v16, v5);
  BOOL v17 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, a3) != 1;
  v20((uint64_t)v9, v5);
  return v17;
}

uint64_t static OpaqueObjectiveCBridgable<>._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1B8F89920();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v15 - v11;
  uint64_t v13 = *(void *)(a2 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))((char *)&v15 - v11, 1, 1, a2);
  if (a1)
  {
    sub_1B8F89AA0();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, a2);
    if (result != 1)
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a3, v10, a2);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t AssertionReconnectResponse.map.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AssertionReconnectResponse.init(map:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1B8F6FD90()
{
  return 7364973;
}

uint64_t sub_1B8F6FDA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 7364973 && a2 == 0xE300000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1B8F89BE0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1B8F6FE28(uint64_t a1)
{
  unint64_t v2 = sub_1B8F70024();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F6FE64(uint64_t a1)
{
  unint64_t v2 = sub_1B8F70024();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AssertionReconnectResponse.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7FB8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F70024();
  sub_1B8F89CC0();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C8250);
  sub_1B8F7021C(&qword_1EB9C7F58, (void (*)(void))sub_1B8F6BC9C);
  sub_1B8F89BA0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1B8F70024()
{
  unint64_t result = qword_1EB9C8138;
  if (!qword_1EB9C8138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8138);
  }
  return result;
}

uint64_t AssertionReconnectResponse.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7EE8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F70024();
  sub_1B8F89CB0();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C8250);
    sub_1B8F7021C(&qword_1EB9C7E90, (void (*)(void))sub_1B8F6BFE0);
    sub_1B8F89B10();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B8F7021C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB9C8250);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B8F7028C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return AssertionReconnectResponse.init(from:)(a1, a2);
}

uint64_t sub_1B8F702A4(void *a1)
{
  return AssertionReconnectResponse.encode(to:)(a1);
}

NSData __swiftcall AssertionReconnectResponse._bridgeToObjectiveC()()
{
  sub_1B8F89510();
  swift_allocObject();
  sub_1B8F89500();
  sub_1B8F70378();
  uint64_t v0 = sub_1B8F894F0();
  unint64_t v2 = v1;
  uint64_t v3 = sub_1B8F895A0();
  sub_1B8F6C7BC(v0, v2);
  swift_release();
  return (NSData)v3;
}

unint64_t sub_1B8F70378()
{
  unint64_t result = qword_1EB9C7F30;
  if (!qword_1EB9C7F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C7F30);
  }
  return result;
}

uint64_t static AssertionReconnectResponse._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (a1)
  {
    sub_1B8F894E0();
    swift_allocObject();
    sub_1B8F894D0();
    uint64_t v3 = sub_1B8F895B0();
    unint64_t v5 = v4;
    sub_1B8F70824();
    sub_1B8F894C0();
    sub_1B8F6C7BC(v3, v5);
    uint64_t result = swift_release();
    *a2 = v7;
  }
  else
  {
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t sub_1B8F704B0()
{
  sub_1B8F89510();
  swift_allocObject();
  sub_1B8F89500();
  sub_1B8F70378();
  uint64_t v0 = sub_1B8F894F0();
  unint64_t v2 = v1;
  uint64_t v3 = sub_1B8F895A0();
  sub_1B8F6C7BC(v0, v2);
  swift_release();
  return v3;
}

uint64_t sub_1B8F70574@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (a1)
  {
    sub_1B8F894E0();
    swift_allocObject();
    sub_1B8F894D0();
    uint64_t v3 = sub_1B8F895B0();
    unint64_t v5 = v4;
    sub_1B8F70824();
    sub_1B8F894C0();
    sub_1B8F6C7BC(v3, v5);
    uint64_t result = swift_release();
    *a2 = v7;
  }
  else
  {
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t _s16SessionAssertion0B17ReconnectResponseV26_forceBridgeFromObjectiveC_6resultySo6NSDataC_ACSgztFZ_0(uint64_t a1, void *a2)
{
  sub_1B8F894E0();
  swift_allocObject();
  sub_1B8F894D0();
  uint64_t v3 = sub_1B8F895B0();
  unint64_t v5 = v4;
  sub_1B8F70824();
  sub_1B8F894C0();
  swift_bridgeObjectRelease();
  sub_1B8F6C7BC(v3, v5);
  uint64_t result = swift_release();
  *a2 = v7;
  return result;
}

uint64_t _s16SessionAssertion0B17ReconnectResponseV34_conditionallyBridgeFromObjectiveC_6resultSbSo6NSDataC_ACSgztFZ_0(uint64_t a1, void *a2)
{
  swift_bridgeObjectRelease();
  sub_1B8F894E0();
  swift_allocObject();
  sub_1B8F894D0();
  uint64_t v3 = sub_1B8F895B0();
  unint64_t v5 = v4;
  sub_1B8F70824();
  sub_1B8F894C0();
  swift_release();
  sub_1B8F6C7BC(v3, v5);
  uint64_t result = 1;
  *a2 = v7;
  return result;
}

unint64_t sub_1B8F70824()
{
  unint64_t result = qword_1EB9C7E30;
  if (!qword_1EB9C7E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C7E30);
  }
  return result;
}

ValueMetadata *type metadata accessor for AssertionReconnectResponse()
{
  return &type metadata for AssertionReconnectResponse;
}

unsigned char *storeEnumTagSinglePayload for AssertionReconnectResponse.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1B8F70924);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AssertionReconnectResponse.CodingKeys()
{
  return &type metadata for AssertionReconnectResponse.CodingKeys;
}

unint64_t sub_1B8F70960()
{
  unint64_t result = qword_1E9EF74F0;
  if (!qword_1E9EF74F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF74F0);
  }
  return result;
}

unint64_t sub_1B8F709B8()
{
  unint64_t result = qword_1EB9C8148;
  if (!qword_1EB9C8148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8148);
  }
  return result;
}

unint64_t sub_1B8F70A10()
{
  unint64_t result = qword_1EB9C8140;
  if (!qword_1EB9C8140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8140);
  }
  return result;
}

uint64_t sub_1B8F70A64()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  swift_beginAccess();
  return MEMORY[0x1BA9D1720](v1);
}

uint64_t sub_1B8F70AB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1B8F70B20(void *a1))(uint64_t a1, char a2)
{
  int v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x1BA9D1720](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1B8F70BA8;
}

void sub_1B8F70BA8(uint64_t a1, char a2)
{
  int v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

id AssertionClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

uint64_t AssertionClient.init()()
{
  uint64_t v28 = sub_1B8F898D0();
  uint64_t v1 = *(void *)(v28 - 8);
  MEMORY[0x1F4188790](v28);
  int v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1B8F898C0();
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = sub_1B8F896C0();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v27 = OBJC_IVAR____TtC16SessionAssertion15AssertionClient_connection;
  *(void *)&v0[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_connection] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_serverStartupToken] = -1;
  char v24 = v0;
  uint64_t v25 = OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue;
  v23[0] = sub_1B8F7467C(0, &qword_1EB9C7EC8);
  uint64_t v26 = v0;
  sub_1B8F896B0();
  aBlock[0] = MEMORY[0x1E4FBC860];
  v23[2] = sub_1B8F74884(&qword_1EB9C7EC0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7EB0);
  sub_1B8F73C18(&qword_1EB9C7EB8, &qword_1EB9C7EB0);
  sub_1B8F89970();
  uint64_t v6 = *MEMORY[0x1E4FBCC68];
  uint64_t v7 = v1 + 104;
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v23[1] = v7;
  v8(v3, v6, v28);
  uint64_t v9 = sub_1B8F89900();
  uint64_t v10 = v24;
  *(void *)&v24[v25] = v9;
  uint64_t v25 = OBJC_IVAR____TtC16SessionAssertion15AssertionClient_calloutQueue;
  sub_1B8F896B0();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1B8F89970();
  v8(v3, v6, v28);
  uint64_t v11 = sub_1B8F89900();
  uint64_t v12 = v26;
  *(void *)&v26[v25] = v11;
  uint64_t v13 = v12;
  *(void *)&v12[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  unint64_t v14 = *(void **)&v10[v27];
  *(void *)&v10[v27] = 0;

  uint64_t v15 = (objc_class *)type metadata accessor for AssertionClient();
  v30.receiver = v13;
  v30.super_class = v15;
  uint64_t v16 = (char *)objc_msgSendSuper2(&v30, sel_init);
  BOOL v17 = *(NSObject **)&v16[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue];
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v16;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_1B8F71174;
  *(void *)(v19 + 24) = v18;
  aBlock[4] = sub_1B8F711A8;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F711D0;
  aBlock[3] = &block_descriptor;
  uint64_t v20 = _Block_copy(aBlock);
  uint64_t v21 = v16;
  swift_retain();
  swift_release();
  dispatch_sync(v17, v20);

  _Block_release(v20);
  LOBYTE(v17) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v17 & 1) == 0) {
    return (uint64_t)v21;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AssertionClient()
{
  return self;
}

uint64_t sub_1B8F7113C()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B8F71174()
{
}

uint64_t sub_1B8F71198()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B8F711A8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B8F711D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
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

void sub_1B8F71234()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1B8F896D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (void *)((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void **)&v1[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue];
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCBF0], v2);
  id v7 = v6;
  LOBYTE(v6) = sub_1B8F896E0();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v8 = OBJC_IVAR____TtC16SessionAssertion15AssertionClient_connection;
  if (!*(void *)&v1[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_connection])
  {
    sub_1B8F7467C(0, &qword_1EB9C7ED0);
    sub_1B8F746B8();
    uint64_t v9 = (void *)sub_1B8F89910();
    if (v9)
    {
      uint64_t v10 = *(void **)&v1[v8];
      *(void *)&v1[v8] = v9;
      id v11 = v9;

      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v1;
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = sub_1B8F7470C;
      *(void *)(v13 + 24) = v12;
      aBlock[4] = sub_1B8F74724;
      aBlock[5] = v13;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1B8F71950;
      aBlock[3] = &block_descriptor_37;
      unint64_t v14 = _Block_copy(aBlock);
      v1;
      swift_retain();
      swift_release();
      objc_msgSend(v11, sel_configureConnection_, v14);
      _Block_release(v14);
      LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if ((v14 & 1) == 0)
      {
        sub_1B8F719A4();
        swift_release();

        return;
      }
LABEL_8:
      __break(1u);
    }
  }
}

void sub_1B8F714DC(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_1B8F89700();
  id v5 = objc_msgSend(self, sel_interfaceWithIdentifier_, v4);

  uint64_t v6 = self;
  id v7 = objc_msgSend(v6, sel_protocolForProtocol_, &unk_1F12C7580);
  objc_msgSend(v5, sel_setClient_, v7);

  id v8 = objc_msgSend(v6, sel_protocolForProtocol_, &unk_1F12C78B8);
  objc_msgSend(v5, sel_setServer_, v8);

  id v9 = objc_msgSend(self, sel_userInitiated);
  objc_msgSend(a1, sel_setServiceQuality_, v9);

  objc_msgSend(a1, sel_setInterface_, v5);
  objc_msgSend(a1, sel_setInterfaceTarget_, a2);
  objc_msgSend(a1, sel_setTargetQueue_, *(void *)(a2 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue));
  BOOL v17 = sub_1B8F717D4;
  uint64_t v18 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_1B8F717E0;
  uint64_t v16 = &block_descriptor_40;
  uint64_t v10 = _Block_copy(&v13);
  objc_msgSend(a1, sel_setActivationHandler_, v10);
  _Block_release(v10);
  BOOL v17 = sub_1B8F71848;
  uint64_t v18 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_1B8F717E0;
  uint64_t v16 = &block_descriptor_43;
  id v11 = _Block_copy(&v13);
  objc_msgSend(a1, sel_setInterruptionHandler_, v11);
  _Block_release(v11);
  BOOL v17 = sub_1B8F71854;
  uint64_t v18 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_1B8F717E0;
  uint64_t v16 = &block_descriptor_46;
  uint64_t v12 = _Block_copy(&v13);
  objc_msgSend(a1, sel_setInvalidationHandler_, v12);
  _Block_release(v12);
}

void sub_1B8F717D4(uint64_t a1)
{
}

void sub_1B8F717E0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_1B8F71848(uint64_t a1)
{
}

void sub_1B8F71854(uint64_t a1)
{
}

void sub_1B8F71860(uint64_t a1, const char *a2)
{
  if (qword_1EB9C7DB0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1B8F89680();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EB9C7E78);
  oslog = sub_1B8F89670();
  os_log_type_t v4 = sub_1B8F89880();
  if (os_log_type_enabled(oslog, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B8F68000, oslog, v4, a2, v5, 2u);
    MEMORY[0x1BA9D1680](v5, -1, -1);
  }
}

uint64_t sub_1B8F71950(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

void sub_1B8F719A4()
{
  sub_1B8F89630();
  uint64_t v1 = *(NSObject **)(v0 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue);
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10[4] = sub_1B8F74674;
  v10[5] = v2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  void v10[2] = sub_1B8F71BF8;
  v10[3] = &block_descriptor_28;
  uint64_t v3 = _Block_copy(v10);
  swift_release();
  uint64_t v4 = sub_1B8F89730();
  swift_bridgeObjectRelease();
  id v5 = (int *)(v0 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_serverStartupToken);
  swift_beginAccess();
  LODWORD(v1) = notify_register_dispatch((const char *)(v4 + 32), v5, v1, v3);
  swift_endAccess();
  _Block_release(v3);
  swift_release();
  if (v1)
  {
    if (qword_1EB9C7DB0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1B8F89680();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EB9C7E78);
    id v7 = sub_1B8F89670();
    os_log_type_t v8 = sub_1B8F89890();
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1B8F68000, v7, v8, "Could not register for daemon startup notifications", v9, 2u);
      MEMORY[0x1BA9D1680](v9, -1, -1);
    }
  }
}

void sub_1B8F71BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x1BA9D1720](v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    sub_1B8F71C4C();
  }
}

uint64_t sub_1B8F71BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_1B8F71C4C()
{
  uint64_t v1 = sub_1B8F896D0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v4 = (void *)((char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v5 = *(void **)&v0[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue];
  *uint64_t v4 = v5;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E4FBCBF0], v1);
  id v6 = v5;
  LOBYTE(v5) = sub_1B8F896E0();
  (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v1);
  if (v5)
  {
    sub_1B8F71234();
    id v7 = *(void **)&v0[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_connection];
    if (v7)
    {
      id v8 = v7;
      if (objc_msgSend(v8, sel_remoteTarget))
      {
        sub_1B8F89960();

        swift_unknownObjectRelease();
        sub_1B8F745DC((uint64_t)v9);
      }
      else
      {
        memset(v9, 0, sizeof(v9));
        sub_1B8F745DC((uint64_t)v9);
        objc_msgSend(v8, sel_activate);
        objc_msgSend(v0, sel_didConnect);
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1B8F71DEC()
{
  uint64_t v1 = sub_1B8F896D0();
  Class isa = v1[-1].isa;
  MEMORY[0x1F4188790]();
  uint64_t v4 = (void *)((char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v5 = *(void **)(v0 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_queue);
  *uint64_t v4 = v5;
  (*((void (**)(void *, void, NSObject *))isa + 13))(v4, *MEMORY[0x1E4FBCBF0], v1);
  id v6 = v5;
  LOBYTE(v5) = sub_1B8F896E0();
  (*((void (**)(void *, NSObject *))isa + 1))(v4, v1);
  if ((v5 & 1) == 0)
  {
    __break(1u);
LABEL_20:
    swift_once();
    goto LABEL_15;
  }
  sub_1B8F71C4C();
  id v7 = *(void **)(v0 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_connection);
  if (!v7)
  {
    if (qword_1EB9C7DB0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1B8F89680();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EB9C7E78);
    uint64_t v1 = sub_1B8F89670();
    os_log_type_t v9 = sub_1B8F898A0();
    if (os_log_type_enabled(v1, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1B8F68000, v1, v9, "AssertionClient: Failed to establish a connection", v10, 2u);
      MEMORY[0x1BA9D1680](v10, -1, -1);
    }
    goto LABEL_18;
  }
  uint64_t v1 = v7;
  if ([v1 remoteTarget])
  {
    sub_1B8F89960();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_1B8F74574((uint64_t)v17, (uint64_t)v18);
  if (v19)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7ED8);
    if (swift_dynamicCast())
    {

      return v16[1];
    }
  }
  else
  {
    sub_1B8F745DC((uint64_t)v18);
  }
  if (qword_1EB9C7DB0 != -1) {
    goto LABEL_20;
  }
LABEL_15:
  uint64_t v12 = sub_1B8F89680();
  __swift_project_value_buffer(v12, (uint64_t)qword_1EB9C7E78);
  uint64_t v13 = sub_1B8F89670();
  os_log_type_t v14 = sub_1B8F898A0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_1B8F68000, v13, v14, "AssertionClient: Failed to cast connection to server interface protocol", v15, 2u);
    MEMORY[0x1BA9D1680](v15, -1, -1);
  }

LABEL_18:
  return 0;
}

id AssertionClient.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AssertionClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t AssertionClient.acquire(request:)()
{
  return sub_1B8F898E0();
}

void sub_1B8F72218(uint64_t a1@<X1>, void *a2@<X8>)
{
  v48[3] = *(id *)MEMORY[0x1E4F143B8];
  type metadata accessor for AssertionAcquisitionRequest();
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  id v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  os_log_type_t v9 = (char *)&v44 - v8;
  uint64_t v10 = sub_1B8F71DEC();
  if (v10)
  {
    id v11 = (void *)v10;
    sub_1B8F89510();
    swift_allocObject();
    sub_1B8F89500();
    sub_1B8F74884(&qword_1EB9C7E40, (void (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest);
    uint64_t v12 = sub_1B8F894F0();
    if (v2)
    {
      uint64_t v42 = swift_unexpectedError();
      __break(1u);
      sub_1B8F6C7BC(v42, v43);
      swift_unexpectedError();
      __break(1u);
    }
    else
    {
      uint64_t v14 = v12;
      unint64_t v15 = v13;
      uint64_t v16 = (void *)sub_1B8F895A0();
      sub_1B8F6C7BC(v14, v15);
      swift_release();
      uint64_t v17 = sub_1B8F895B0();
      unint64_t v19 = v18;

      uint64_t v20 = (void *)sub_1B8F895A0();
      v48[0] = 0;
      id v21 = objc_msgSend(v11, sel_acquire_error_, v20, v48);

      id v22 = v48[0];
      if (v21)
      {
        v46 = a2;
        uint64_t v23 = sub_1B8F895B0();
        unint64_t v25 = v24;

        unint64_t v44 = v25;
        uint64_t v45 = v23;
        uint64_t v26 = (void *)sub_1B8F895A0();
        sub_1B8F89540();
        swift_allocObject();
        sub_1B8F89530();
        uint64_t v27 = sub_1B8F895B0();
        unint64_t v29 = v28;
        sub_1B8F6BFE0();
        sub_1B8F89520();
        sub_1B8F6C7BC(v27, v29);
        swift_release();
        id v30 = v48[0];
        id v31 = v48[1];
        sub_1B8F6C7BC(v17, v19);
        sub_1B8F6C7BC(v45, v44);
        swift_unknownObjectRelease();

        v32 = v46;
        void *v46 = v30;
        v32[1] = v31;
      }
      else
      {
        v40 = v22;
        sub_1B8F89590();

        swift_willThrow();
        sub_1B8F6C7BC(v17, v19);
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    if (qword_1EB9C7DB0 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_1B8F89680();
    __swift_project_value_buffer(v33, (uint64_t)qword_1EB9C7E78);
    sub_1B8F6B7F0(a1, (uint64_t)v9);
    v34 = sub_1B8F89670();
    os_log_type_t v35 = sub_1B8F898A0();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = (void *)swift_slowAlloc();
      v48[0] = v37;
      *(_DWORD *)v36 = 136446210;
      sub_1B8F6B7F0((uint64_t)v9, (uint64_t)v7);
      uint64_t v38 = sub_1B8F89720();
      uint64_t v47 = sub_1B8F73D54(v38, v39, (uint64_t *)v48);
      sub_1B8F89930();
      swift_bridgeObjectRelease();
      sub_1B8F74828((uint64_t)v9);
      _os_log_impl(&dword_1B8F68000, v34, v35, "AssertionClient: Could not acquire assertion because remote target is bad: %{public}s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9D1680](v37, -1, -1);
      MEMORY[0x1BA9D1680](v36, -1, -1);
    }
    else
    {
      sub_1B8F74828((uint64_t)v9);
    }

    sub_1B8F747D4();
    swift_allocError();
    unsigned char *v41 = 3;
    swift_willThrow();
  }
}

void sub_1B8F726F0(void *a1@<X8>)
{
  sub_1B8F72218(*(void *)(v1 + 24), a1);
}

uint64_t AssertionClient.invalidate(identifier:)()
{
  return sub_1B8F898E0();
}

uint64_t sub_1B8F72778(void *a1, uint64_t a2)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v27 = a1;
  uint64_t v28 = a2;
  sub_1B8F89570();
  swift_allocObject();
  sub_1B8F89560();
  sub_1B8F6BC9C();
  uint64_t v4 = sub_1B8F89550();
  if (v2)
  {
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    uint64_t v6 = v4;
    unint64_t v7 = v5;
    uint64_t v8 = (void *)sub_1B8F895A0();
    sub_1B8F6C7BC(v6, v7);
    swift_release();
    uint64_t v9 = sub_1B8F895B0();
    unint64_t v11 = v10;

    uint64_t v12 = sub_1B8F71DEC();
    if (v12)
    {
      unint64_t v13 = (void *)v12;
      uint64_t v14 = (void *)sub_1B8F895A0();
      id v27 = 0;
      unsigned __int8 v15 = objc_msgSend(v13, sel_invalidate_error_, v14, &v27);

      if (v15)
      {
        id v16 = v27;
      }
      else
      {
        id v25 = v27;
        sub_1B8F89590();

        swift_willThrow();
      }
      sub_1B8F6C7BC(v9, v11);
      return swift_unknownObjectRelease();
    }
    else
    {
      if (qword_1EB9C7DB0 != -1) {
        swift_once();
      }
      uint64_t v17 = sub_1B8F89680();
      __swift_project_value_buffer(v17, (uint64_t)qword_1EB9C7E78);
      unint64_t v18 = sub_1B8F89670();
      os_log_type_t v19 = sub_1B8F89890();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 136446210;
        uint64_t v28 = a2;
        v29[0] = v26;
        uint64_t v21 = AssertionIdentifier.description.getter();
        id v27 = (id)sub_1B8F73D54(v21, v22, v29);
        sub_1B8F89930();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1B8F68000, v18, v19, "Could not invalidate assertion because remote target is bad: %{public}s", v20, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1BA9D1680](v26, -1, -1);
        MEMORY[0x1BA9D1680](v20, -1, -1);
      }

      sub_1B8F747D4();
      swift_allocError();
      *uint64_t v23 = 3;
      swift_willThrow();
      return sub_1B8F6C7BC(v9, v11);
    }
  }
  return result;
}

uint64_t sub_1B8F72ABC()
{
  return sub_1B8F72778(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t AssertionClient.reconnect(request:)()
{
  return sub_1B8F898E0();
}

void sub_1B8F72B3C(void *a1@<X1>, id *a2@<X8>)
{
  v38[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1B8F71DEC();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    sub_1B8F89510();
    swift_allocObject();
    sub_1B8F89500();
    v38[0] = a1;
    sub_1B8F6C768();
    uint64_t v7 = sub_1B8F894F0();
    if (v2)
    {
      uint64_t v34 = swift_unexpectedError();
      __break(1u);
      sub_1B8F6C7BC(v34, v35);
      swift_unexpectedError();
      __break(1u);
    }
    else
    {
      uint64_t v9 = v7;
      unint64_t v10 = v8;
      unint64_t v11 = (void *)sub_1B8F895A0();
      sub_1B8F6C7BC(v9, v10);
      swift_release();
      uint64_t v12 = sub_1B8F895B0();
      unint64_t v14 = v13;

      unsigned __int8 v15 = (void *)sub_1B8F895A0();
      v38[0] = 0;
      id v16 = objc_msgSend(v6, sel_reconnect_error_, v15, v38);

      id v17 = v38[0];
      if (v16)
      {
        unint64_t v36 = v14;
        v37 = a2;
        uint64_t v18 = sub_1B8F895B0();
        unint64_t v20 = v19;

        uint64_t v21 = (void *)sub_1B8F895A0();
        sub_1B8F894E0();
        swift_allocObject();
        sub_1B8F894D0();
        uint64_t v22 = sub_1B8F895B0();
        unint64_t v24 = v23;
        sub_1B8F70824();
        sub_1B8F894C0();
        sub_1B8F6C7BC(v22, v24);
        swift_release();
        sub_1B8F6C7BC(v12, v36);
        sub_1B8F6C7BC(v18, v20);
        swift_unknownObjectRelease();

        id *v37 = v38[0];
      }
      else
      {
        v32 = v17;
        sub_1B8F89590();

        swift_willThrow();
        sub_1B8F6C7BC(v12, v14);
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    if (qword_1EB9C7DB0 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1B8F89680();
    __swift_project_value_buffer(v25, (uint64_t)qword_1EB9C7E78);
    swift_bridgeObjectRetain_n();
    uint64_t v26 = sub_1B8F89670();
    os_log_type_t v27 = sub_1B8F89890();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      unint64_t v29 = (void *)swift_slowAlloc();
      v38[0] = v29;
      *(_DWORD *)uint64_t v28 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_1B8F89720();
      sub_1B8F73D54(v30, v31, (uint64_t *)v38);
      sub_1B8F89930();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B8F68000, v26, v27, "Could not reconnect assertion because remote target is bad: %{public}s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9D1680](v29, -1, -1);
      MEMORY[0x1BA9D1680](v28, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_1B8F747D4();
    swift_allocError();
    *uint64_t v33 = 3;
    swift_willThrow();
  }
}

void sub_1B8F72F88(id *a1@<X8>)
{
  sub_1B8F72B3C(*(void **)(v1 + 24), a1);
}

uint64_t AssertionClient.didInvalidate(_:)()
{
  uint64_t v0 = (void *)sub_1B8F895A0();
  sub_1B8F894E0();
  swift_allocObject();
  sub_1B8F894D0();
  uint64_t v1 = sub_1B8F895B0();
  unint64_t v3 = v2;
  sub_1B8F73B08();
  sub_1B8F894C0();
  sub_1B8F6C7BC(v1, v3);

  swift_release();
  AssertionClient.didInvalidate(invalidationMessage:)((uint64_t)&v5);
  return swift_bridgeObjectRelease();
}

uint64_t AssertionClient.didInvalidate(invalidationMessage:)(uint64_t a1)
{
  uint64_t v3 = sub_1B8F89690();
  uint64_t v43 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B8F896C0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v10 = *(_DWORD *)(a1 + 4);
  LODWORD(v42) = *(_DWORD *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v40 = *(void *)(a1 + 16);
  uint64_t v41 = v11;
  uint64_t v13 = v1 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1BA9D1720](v13);
  if (result)
  {
    uint64_t v34 = result;
    uint64_t v35 = v1;
    uint64_t v38 = v5;
    uint64_t v33 = *(void *)(v13 + 8);
    if (qword_1EB9C7DB0 != -1) {
      swift_once();
    }
    unsigned int v15 = v10;
    unint64_t v36 = v9;
    uint64_t v37 = v7;
    uint64_t v39 = v6;
    uint64_t v16 = sub_1B8F89680();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EB9C7E78);
    swift_bridgeObjectRetain_n();
    id v17 = sub_1B8F89670();
    os_log_type_t v18 = sub_1B8F898B0();
    if (os_log_type_enabled(v17, v18))
    {
      unint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v32 = v3;
      *(_DWORD *)unint64_t v19 = 136446210;
      uint64_t v44 = v20;
      unint64_t v31 = v19 + 4;
      int v21 = v42;
      uint64_t aBlock = __PAIR64__(v15, v42);
      uint64_t v22 = v41;
      uint64_t v46 = v41;
      uint64_t v23 = AssertionIdentifier.description.getter();
      uint64_t aBlock = sub_1B8F73D54(v23, v24, &v44);
      uint64_t v3 = v32;
      sub_1B8F89930();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B8F68000, v17, v18, "Server invalidated assertion: %{public}s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9D1680](v20, -1, -1);
      MEMORY[0x1BA9D1680](v19, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      int v21 = v42;
      uint64_t v22 = v41;
    }
    uint64_t v42 = *(void *)(v35 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_calloutQueue);
    uint64_t v25 = swift_allocObject();
    uint64_t v26 = v33;
    *(void *)(v25 + 16) = v34;
    *(void *)(v25 + 24) = v26;
    *(_DWORD *)(v25 + 32) = v21;
    *(_DWORD *)(v25 + 36) = v15;
    uint64_t v27 = v40;
    *(void *)(v25 + 40) = v22;
    *(void *)(v25 + 48) = v27;
    *(void *)(v25 + 56) = v12;
    v49 = sub_1B8F73B9C;
    uint64_t v50 = v25;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v46 = 1107296256;
    uint64_t v47 = sub_1B8F736D0;
    v48 = &block_descriptor_9;
    uint64_t v28 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t v29 = v36;
    sub_1B8F896A0();
    uint64_t v44 = MEMORY[0x1E4FBC860];
    sub_1B8F74884(&qword_1EB9C7DB8, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7EA0);
    sub_1B8F73C18(&qword_1EB9C7EA8, &qword_1EB9C7EA0);
    uint64_t v30 = v38;
    sub_1B8F89970();
    MEMORY[0x1BA9D0D60](0, v29, v30, v28);
    _Block_release(v28);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v30, v3);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v29, v39);
    return swift_release();
  }
  return result;
}

uint64_t sub_1B8F736D0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

Swift::Void __swiftcall AssertionClient.didConnect()()
{
  uint64_t v1 = sub_1B8F89690();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1B8F896C0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v0 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x1BA9D1720](v9);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v20 = v2;
    uint64_t v12 = *(void *)(v9 + 8);
    if (qword_1EB9C7DB0 != -1) {
      swift_once();
    }
    uint64_t v19 = v5;
    uint64_t v13 = sub_1B8F89680();
    __swift_project_value_buffer(v13, (uint64_t)qword_1EB9C7E78);
    unint64_t v14 = sub_1B8F89670();
    os_log_type_t v15 = sub_1B8F898B0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1B8F68000, v14, v15, "Server connected", v16, 2u);
      MEMORY[0x1BA9D1680](v16, -1, -1);
    }

    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v11;
    *(void *)(v17 + 24) = v12;
    aBlock[4] = sub_1B8F7438C;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B8F736D0;
    aBlock[3] = &block_descriptor_15;
    os_log_type_t v18 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    sub_1B8F896A0();
    uint64_t v21 = MEMORY[0x1E4FBC860];
    sub_1B8F74884(&qword_1EB9C7DB8, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7EA0);
    sub_1B8F73C18(&qword_1EB9C7EA8, &qword_1EB9C7EA0);
    sub_1B8F89970();
    MEMORY[0x1BA9D0D60](0, v8, v4, v18);
    _Block_release(v18);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
    swift_release();
  }
}

unint64_t sub_1B8F73B08()
{
  unint64_t result = qword_1EB9C8048;
  if (!qword_1EB9C8048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8048);
  }
  return result;
}

uint64_t sub_1B8F73B5C()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1B8F73B9C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  long long v5 = *(_OWORD *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = *(void *)(v0 + 32);
  long long v7 = v5;
  uint64_t v8 = v2;
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v1 + 8))(&v6, ObjectType, v1);
}

uint64_t sub_1B8F73C18(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1B8F73C68(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1B8F73C78(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1B8F73CB4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1B8F73CDC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1B8F73D54(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1B8F89930();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1B8F73D54(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1B8F73E28(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1B8F74774((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1B8F74774((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1B8F73E28(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1B8F89940();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1B8F73FE4(a5, a6);
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
  uint64_t v8 = sub_1B8F89A10();
  if (!v8)
  {
    sub_1B8F89A30();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1B8F89A90();
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

uint64_t sub_1B8F73FE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1B8F7407C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1B8F741F4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1B8F741F4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B8F7407C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1B8F84544(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1B8F899D0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1B8F89A30();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1B8F89760();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1B8F89A90();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1B8F89A30();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

uint64_t sub_1B8F741F4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7F00);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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
  uint64_t result = sub_1B8F89A90();
  __break(1u);
  return result;
}

unsigned char **sub_1B8F74344(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1B8F74354()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B8F7438C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(ObjectType, v1);
}

uint64_t sub_1B8F743D8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1BA9D1720](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1B8F74434(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;
  swift_beginAccess();
  *(void *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of AssertionClientDelegate.didInvalidate(invalidationMessage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of AssertionClientDelegate.didConnect()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t method lookup function for AssertionClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AssertionClient);
}

uint64_t dispatch thunk of AssertionClient.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AssertionClient.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AssertionClient.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t sub_1B8F74574(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B8F745DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7F08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B8F7463C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B8F74674(uint64_t a1)
{
  sub_1B8F71BA4(a1, v1);
}

uint64_t sub_1B8F7467C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1B8F746B8()
{
  unint64_t result = qword_1EB9C7E38;
  if (!qword_1EB9C7E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C7E38);
  }
  return result;
}

void sub_1B8F7470C(void *a1)
{
  sub_1B8F714DC(a1, *(void *)(v1 + 16));
}

uint64_t sub_1B8F74714()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B8F74724()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B8F7474C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B8F74774(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1B8F747D4()
{
  unint64_t result = qword_1EB9C7E58;
  if (!qword_1EB9C7E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C7E58);
  }
  return result;
}

uint64_t sub_1B8F74828(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AssertionAcquisitionRequest();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B8F74884(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1B8F74908(char a1)
{
  unint64_t result = 7565169;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0x65726F46656B6166;
      break;
    case 3:
      unint64_t result = 0x61746E6573657270;
      break;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1B8F749D0()
{
  return sub_1B8F74908(*v0);
}

uint64_t sub_1B8F749D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1B8F77CF8(a1, a2);
  *a3 = result;
  return result;
}

void sub_1B8F74A00(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1B8F74A0C(uint64_t a1)
{
  unint64_t v2 = sub_1B8F754F4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F74A48(uint64_t a1)
{
  unint64_t v2 = sub_1B8F754F4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1B8F74A84()
{
  return 0;
}

uint64_t sub_1B8F74A90@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1B8F74AC0(uint64_t a1)
{
  unint64_t v2 = sub_1B8F75548();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F74AFC(uint64_t a1)
{
  unint64_t v2 = sub_1B8F75548();

  return MEMORY[0x1F41862B0](a1, v2);
}

unint64_t sub_1B8F74B40()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_1B8F74B5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1B8F77F38(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1B8F74B88(uint64_t a1)
{
  unint64_t v2 = sub_1B8F755F0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F74BC4(uint64_t a1)
{
  unint64_t v2 = sub_1B8F755F0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1B8F74C00()
{
  return 12383;
}

uint64_t sub_1B8F74C10(uint64_t a1)
{
  unint64_t v2 = sub_1B8F7559C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F74C4C(uint64_t a1)
{
  unint64_t v2 = sub_1B8F7559C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1B8F74C88(uint64_t a1)
{
  unint64_t v2 = sub_1B8F75644();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F74CC4(uint64_t a1)
{
  unint64_t v2 = sub_1B8F75644();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1B8F74D00(uint64_t a1)
{
  unint64_t v2 = sub_1B8F75698();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F74D3C(uint64_t a1)
{
  unint64_t v2 = sub_1B8F75698();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AssertionAttribute.encode(to:)(void *a1)
{
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C80C0);
  uint64_t v43 = *(void *)(v45 - 8);
  MEMORY[0x1F4188790](v45);
  uint64_t v40 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C8280);
  uint64_t v47 = *(void *)(v3 - 8);
  uint64_t v48 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v42 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_1B8F89600();
  uint64_t v44 = *(void *)(v46 - 8);
  MEMORY[0x1F4188790](v46);
  uint64_t v41 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C8288);
  uint64_t v38 = *(void *)(v6 - 8);
  uint64_t v39 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v37 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C8290);
  uint64_t v35 = *(void *)(v8 - 8);
  uint64_t v36 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C8278);
  uint64_t v34 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for AssertionAttribute();
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (uint64_t *)((char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C8270);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v49 = v17;
  uint64_t v50 = v18;
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F754F4();
  sub_1B8F89CC0();
  sub_1B8F6EF50(v51, (uint64_t)v16);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      char v55 = 2;
      sub_1B8F755F0();
      uint64_t v23 = v37;
      uint64_t v22 = v49;
      sub_1B8F89B50();
      uint64_t v24 = v39;
      sub_1B8F89B90();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v23, v24);
      goto LABEL_5;
    case 2u:
      uint64_t v25 = v44;
      uint64_t v26 = v41;
      uint64_t v27 = v46;
      (*(void (**)(char *, uint64_t *, uint64_t))(v44 + 32))(v41, v16, v46);
      char v56 = 3;
      sub_1B8F7559C();
      uint64_t v28 = v42;
      uint64_t v22 = v49;
      sub_1B8F89B50();
      sub_1B8F761B4(&qword_1EB9C8080);
      uint64_t v29 = v48;
      sub_1B8F89BA0();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v28, v29);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
      goto LABEL_5;
    case 3u:
      char v54 = 1;
      sub_1B8F75644();
      uint64_t v31 = v49;
      sub_1B8F89B50();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v36);
      goto LABEL_8;
    case 4u:
      char v57 = 4;
      sub_1B8F75548();
      uint64_t v32 = v40;
      uint64_t v31 = v49;
      sub_1B8F89B50();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v32, v45);
LABEL_8:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v20, v31);
      break;
    default:
      uint64_t v21 = *v16;
      char v53 = 0;
      sub_1B8F75698();
      uint64_t v22 = v49;
      sub_1B8F89B50();
      uint64_t v52 = v21;
      sub_1B8F756EC();
      sub_1B8F89BA0();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v11);
LABEL_5:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v20, v22);
      break;
  }
  return result;
}

uint64_t type metadata accessor for AssertionAttribute()
{
  uint64_t result = qword_1EB9C80D0;
  if (!qword_1EB9C80D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1B8F754F4()
{
  unint64_t result = qword_1EB9C81B8;
  if (!qword_1EB9C81B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C81B8);
  }
  return result;
}

unint64_t sub_1B8F75548()
{
  unint64_t result = qword_1E9EF7580;
  if (!qword_1E9EF7580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7580);
  }
  return result;
}

unint64_t sub_1B8F7559C()
{
  unint64_t result = qword_1EB9C8088;
  if (!qword_1EB9C8088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8088);
  }
  return result;
}

unint64_t sub_1B8F755F0()
{
  unint64_t result = qword_1E9EF7588;
  if (!qword_1E9EF7588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7588);
  }
  return result;
}

unint64_t sub_1B8F75644()
{
  unint64_t result = qword_1EB9C7E60;
  if (!qword_1EB9C7E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C7E60);
  }
  return result;
}

unint64_t sub_1B8F75698()
{
  unint64_t result = qword_1E9EF7590;
  if (!qword_1E9EF7590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7590);
  }
  return result;
}

unint64_t sub_1B8F756EC()
{
  unint64_t result = qword_1E9EF7598;
  if (!qword_1E9EF7598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7598);
  }
  return result;
}

uint64_t AssertionAttribute.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v73 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7970);
  uint64_t v61 = *(void *)(v3 - 8);
  uint64_t v62 = v3;
  MEMORY[0x1F4188790](v3);
  v68 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7F88);
  uint64_t v64 = *(void *)(v72 - 8);
  MEMORY[0x1F4188790](v72);
  v69 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7F90);
  uint64_t v63 = *(void *)(v60 - 8);
  MEMORY[0x1F4188790](v60);
  v67 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7F98);
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x1F4188790](v59);
  v66 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7F80);
  uint64_t v56 = *(void *)(v58 - 8);
  MEMORY[0x1F4188790](v58);
  v65 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7F78);
  uint64_t v70 = *(void *)(v9 - 8);
  uint64_t v71 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for AssertionAttribute();
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  uint64_t v18 = (char *)&v52 - v17;
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  uint64_t v21 = (char *)&v52 - v20;
  MEMORY[0x1F4188790](v19);
  uint64_t v23 = (char *)&v52 - v22;
  uint64_t v24 = a1[3];
  v74 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v24);
  sub_1B8F754F4();
  uint64_t v25 = (uint64_t)v75;
  sub_1B8F89CB0();
  if (!v25)
  {
    char v53 = v18;
    char v54 = v21;
    char v55 = v15;
    uint64_t v26 = v72;
    uint64_t v27 = v73;
    v75 = v23;
    uint64_t v28 = v71;
    uint64_t v29 = sub_1B8F89B40();
    if (*(void *)(v29 + 16) == 1)
    {
      switch(*(unsigned char *)(v29 + 32))
      {
        case 1:
          char v78 = 1;
          sub_1B8F75644();
          uint64_t v36 = v66;
          sub_1B8F89AB0();
          (*(void (**)(char *, uint64_t))(v57 + 8))(v36, v59);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v70 + 8))(v11, v28);
          uint64_t v37 = (uint64_t)v75;
          goto LABEL_11;
        case 2:
          char v79 = 2;
          sub_1B8F755F0();
          uint64_t v38 = v67;
          sub_1B8F89AB0();
          uint64_t v39 = v28;
          uint64_t v40 = v38;
          uint64_t v41 = v60;
          int v42 = sub_1B8F89B00();
          uint64_t v43 = v70;
          uint64_t v50 = *(void (**)(char *, uint64_t))(v63 + 8);
          LODWORD(v72) = v42;
          v50(v40, v41);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v39);
          uint64_t v32 = v53;
          *char v53 = v72 & 1;
          goto LABEL_12;
        case 3:
          uint64_t v44 = v26;
          char v80 = 3;
          sub_1B8F7559C();
          uint64_t v45 = v69;
          sub_1B8F89AB0();
          sub_1B8F89600();
          uint64_t v46 = v45;
          sub_1B8F761B4(&qword_1EB9C7F18);
          sub_1B8F89B10();
          uint64_t v47 = v70;
          (*(void (**)(char *, uint64_t))(v64 + 8))(v46, v44);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v47 + 8))(v11, v28);
          uint64_t v32 = v55;
          goto LABEL_12;
        case 4:
          char v81 = 4;
          sub_1B8F75548();
          uint64_t v48 = v68;
          sub_1B8F89AB0();
          (*(void (**)(char *, uint64_t))(v61 + 8))(v48, v62);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v70 + 8))(v11, v28);
          uint64_t v37 = (uint64_t)v75;
LABEL_11:
          swift_storeEnumTagMultiPayload();
          goto LABEL_13;
        default:
          char v77 = 0;
          sub_1B8F75698();
          uint64_t v30 = v65;
          sub_1B8F89AB0();
          sub_1B8F761F8();
          uint64_t v31 = v58;
          sub_1B8F89B10();
          (*(void (**)(char *, uint64_t))(v56 + 8))(v30, v31);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v70 + 8))(v11, v28);
          uint64_t v32 = v54;
          *char v54 = v76;
LABEL_12:
          swift_storeEnumTagMultiPayload();
          uint64_t v51 = (uint64_t)v32;
          uint64_t v37 = (uint64_t)v75;
          sub_1B8F76150(v51, (uint64_t)v75);
LABEL_13:
          sub_1B8F76150(v37, v27);
          break;
      }
    }
    else
    {
      uint64_t v33 = sub_1B8F89A00();
      swift_allocError();
      uint64_t v35 = v34;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF75A0);
      *uint64_t v35 = v12;
      sub_1B8F89AC0();
      sub_1B8F899F0();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v33 - 8) + 104))(v35, *MEMORY[0x1E4FBBA70], v33);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v11, v28);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v74);
}

uint64_t sub_1B8F76150(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AssertionAttribute();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B8F761B4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1B8F89600();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B8F761F8()
{
  unint64_t result = qword_1E9EF75A8;
  if (!qword_1E9EF75A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF75A8);
  }
  return result;
}

uint64_t sub_1B8F7624C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AssertionAttribute.init(from:)(a1, a2);
}

uint64_t sub_1B8F76264(void *a1)
{
  return AssertionAttribute.encode(to:)(a1);
}

uint64_t sub_1B8F7627C()
{
  return 0x65726F46656B6166;
}

uint64_t sub_1B8F762A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x65726F46656B6166 && a2 == 0xEE00646E756F7267)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1B8F89BE0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1B8F7635C(uint64_t a1)
{
  unint64_t v2 = sub_1B8F766D8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F76398(uint64_t a1)
{
  unint64_t v2 = sub_1B8F766D8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1B8F763D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1B8F89BE0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1B8F76454(uint64_t a1)
{
  unint64_t v2 = sub_1B8F7672C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F76490(uint64_t a1)
{
  unint64_t v2 = sub_1B8F7672C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AssertionInvalidationState.encode(to:)(void *a1)
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF75B0);
  uint64_t v3 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  char v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF75B8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F766D8();
  sub_1B8F89CC0();
  sub_1B8F7672C();
  sub_1B8F89B50();
  uint64_t v15 = v13;
  sub_1B8F76780();
  uint64_t v10 = v14;
  sub_1B8F89BA0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_1B8F766D8()
{
  unint64_t result = qword_1E9EF75C0;
  if (!qword_1E9EF75C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF75C0);
  }
  return result;
}

unint64_t sub_1B8F7672C()
{
  unint64_t result = qword_1E9EF75C8;
  if (!qword_1E9EF75C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF75C8);
  }
  return result;
}

unint64_t sub_1B8F76780()
{
  unint64_t result = qword_1E9EF75D0;
  if (!qword_1E9EF75D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF75D0);
  }
  return result;
}

uint64_t AssertionInvalidationState.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF75D8);
  uint64_t v22 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF75E0);
  uint64_t v7 = *(void *)(v23 - 8);
  MEMORY[0x1F4188790](v23);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F766D8();
  sub_1B8F89CB0();
  if (v2) {
    goto LABEL_5;
  }
  uint64_t v19 = a1;
  uint64_t v20 = v7;
  uint64_t v10 = v23;
  if (*(void *)(sub_1B8F89B40() + 16) != 1)
  {
    uint64_t v12 = sub_1B8F89A00();
    swift_allocError();
    uint64_t v13 = v10;
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF75A0);
    *uint64_t v15 = &type metadata for AssertionInvalidationState;
    sub_1B8F89AC0();
    sub_1B8F899F0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v12 - 8) + 104))(v15, *MEMORY[0x1E4FBBA70], v12);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v13);
    a1 = v19;
LABEL_5:
    uint64_t v17 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v17);
  }
  sub_1B8F7672C();
  sub_1B8F89AB0();
  uint64_t v11 = v20;
  sub_1B8F76B50();
  sub_1B8F89B10();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v4);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  *uint64_t v21 = v24;
  uint64_t v17 = (uint64_t)v19;
  return __swift_destroy_boxed_opaque_existential_1(v17);
}

unint64_t sub_1B8F76B50()
{
  unint64_t result = qword_1E9EF75E8;
  if (!qword_1E9EF75E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF75E8);
  }
  return result;
}

uint64_t sub_1B8F76BA4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return AssertionInvalidationState.init(from:)(a1, a2);
}

uint64_t sub_1B8F76BBC(void *a1)
{
  return AssertionInvalidationState.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for AssertionAttribute(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v7 = sub_1B8F89600();
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

uint64_t destroy for AssertionAttribute(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    uint64_t v3 = sub_1B8F89600();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *initializeWithCopy for AssertionAttribute(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v6 = sub_1B8F89600();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for AssertionAttribute(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1B8F6D41C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v6 = sub_1B8F89600();
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

void *initializeWithTake for AssertionAttribute(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v6 = sub_1B8F89600();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for AssertionAttribute(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1B8F6D41C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v6 = sub_1B8F89600();
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

uint64_t getEnumTagSinglePayload for AssertionAttribute(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AssertionAttribute(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1B8F770A0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1B8F770B0()
{
  uint64_t result = sub_1B8F89600();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for AssertionInvalidationState(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AssertionInvalidationState()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AssertionInvalidationState(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *assignWithTake for AssertionInvalidationState(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AssertionInvalidationState(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AssertionInvalidationState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AssertionInvalidationState()
{
  return &type metadata for AssertionInvalidationState;
}

ValueMetadata *type metadata accessor for AssertionInvalidationState.CodingKeys()
{
  return &type metadata for AssertionInvalidationState.CodingKeys;
}

ValueMetadata *type metadata accessor for AssertionInvalidationState.FakeForegroundCodingKeys()
{
  return &type metadata for AssertionInvalidationState.FakeForegroundCodingKeys;
}

uint64_t getEnumTagSinglePayload for AssertionAttribute.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AssertionAttribute.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B8F7741CLL);
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

ValueMetadata *type metadata accessor for AssertionAttribute.CodingKeys()
{
  return &type metadata for AssertionAttribute.CodingKeys;
}

ValueMetadata *type metadata accessor for AssertionAttribute.QosCodingKeys()
{
  return &type metadata for AssertionAttribute.QosCodingKeys;
}

ValueMetadata *type metadata accessor for AssertionAttribute.ProminentPresentationCodingKeys()
{
  return &type metadata for AssertionAttribute.ProminentPresentationCodingKeys;
}

ValueMetadata *type metadata accessor for AssertionAttribute.FakeForegroundCodingKeys()
{
  return &type metadata for AssertionAttribute.FakeForegroundCodingKeys;
}

unsigned char *_s16SessionAssertion26AssertionInvalidationStateO10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1B8F77520);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AssertionAttribute.PresentationCodingKeys()
{
  return &type metadata for AssertionAttribute.PresentationCodingKeys;
}

ValueMetadata *type metadata accessor for AssertionAttribute.DisableAPIThrottlingCodingKeys()
{
  return &type metadata for AssertionAttribute.DisableAPIThrottlingCodingKeys;
}

unint64_t sub_1B8F7756C()
{
  unint64_t result = qword_1E9EF75F0;
  if (!qword_1E9EF75F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF75F0);
  }
  return result;
}

unint64_t sub_1B8F775C4()
{
  unint64_t result = qword_1E9EF75F8;
  if (!qword_1E9EF75F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF75F8);
  }
  return result;
}

unint64_t sub_1B8F7761C()
{
  unint64_t result = qword_1E9EF7600;
  if (!qword_1E9EF7600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7600);
  }
  return result;
}

unint64_t sub_1B8F77674()
{
  unint64_t result = qword_1E9EF7608;
  if (!qword_1E9EF7608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7608);
  }
  return result;
}

unint64_t sub_1B8F776CC()
{
  unint64_t result = qword_1E9EF7610;
  if (!qword_1E9EF7610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7610);
  }
  return result;
}

unint64_t sub_1B8F77724()
{
  unint64_t result = qword_1E9EF7618;
  if (!qword_1E9EF7618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7618);
  }
  return result;
}

unint64_t sub_1B8F7777C()
{
  unint64_t result = qword_1E9EF7620;
  if (!qword_1E9EF7620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7620);
  }
  return result;
}

unint64_t sub_1B8F777D4()
{
  unint64_t result = qword_1E9EF7628;
  if (!qword_1E9EF7628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7628);
  }
  return result;
}

unint64_t sub_1B8F7782C()
{
  unint64_t result = qword_1E9EF7630;
  if (!qword_1E9EF7630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7630);
  }
  return result;
}

unint64_t sub_1B8F77884()
{
  unint64_t result = qword_1E9EF7638;
  if (!qword_1E9EF7638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7638);
  }
  return result;
}

unint64_t sub_1B8F778DC()
{
  unint64_t result = qword_1EB9C81D8;
  if (!qword_1EB9C81D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C81D8);
  }
  return result;
}

unint64_t sub_1B8F77934()
{
  unint64_t result = qword_1EB9C81D0;
  if (!qword_1EB9C81D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C81D0);
  }
  return result;
}

unint64_t sub_1B8F7798C()
{
  unint64_t result = qword_1EB9C8208;
  if (!qword_1EB9C8208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8208);
  }
  return result;
}

unint64_t sub_1B8F779E4()
{
  unint64_t result = qword_1EB9C8200;
  if (!qword_1EB9C8200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8200);
  }
  return result;
}

unint64_t sub_1B8F77A3C()
{
  unint64_t result = qword_1EB9C81F8;
  if (!qword_1EB9C81F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C81F8);
  }
  return result;
}

unint64_t sub_1B8F77A94()
{
  unint64_t result = qword_1EB9C81F0;
  if (!qword_1EB9C81F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C81F0);
  }
  return result;
}

unint64_t sub_1B8F77AEC()
{
  unint64_t result = qword_1EB9C81E8;
  if (!qword_1EB9C81E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C81E8);
  }
  return result;
}

unint64_t sub_1B8F77B44()
{
  unint64_t result = qword_1EB9C81E0;
  if (!qword_1EB9C81E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C81E0);
  }
  return result;
}

unint64_t sub_1B8F77B9C()
{
  unint64_t result = qword_1EB9C80B8;
  if (!qword_1EB9C80B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C80B8);
  }
  return result;
}

unint64_t sub_1B8F77BF4()
{
  unint64_t result = qword_1EB9C80B0;
  if (!qword_1EB9C80B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C80B0);
  }
  return result;
}

unint64_t sub_1B8F77C4C()
{
  unint64_t result = qword_1EB9C81C8;
  if (!qword_1EB9C81C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C81C8);
  }
  return result;
}

unint64_t sub_1B8F77CA4()
{
  unint64_t result = qword_1EB9C81C0;
  if (!qword_1EB9C81C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C81C0);
  }
  return result;
}

uint64_t sub_1B8F77CF8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7565169 && a2 == 0xE300000000000000;
  if (v2 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001B8F8D3B0 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65726F46656B6166 && a2 == 0xEE00646E756F7267 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x61746E6573657270 && a2 == 0xEC0000006E6F6974 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001B8F8D3D0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_1B8F89BE0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1B8F77F38(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000001BLL && a2 == 0x80000001B8F8D3F0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_1B8F89BE0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_1B8F77FCC()
{
  uint64_t v0 = sub_1B8F89620();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790]();
  char v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1B8F89680();
  __swift_allocate_value_buffer(v4, qword_1EB9C7E78);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EB9C7E78);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F18038], v0);
  return sub_1B8F89660();
}

uint64_t static Logger.assertion.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EB9C7DB0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B8F89680();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EB9C7E78);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1B8F781E0()
{
  sub_1B8F899C0();
  sub_1B8F89750();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  uint64_t v1 = OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF74D0);
  sub_1B8F89720();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  uint64_t v2 = *(void *)(v0 + v1);
  if (v2)
  {
    uint64_t v3 = *(os_unfair_lock_s **)(*(void *)(v2 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v3);
    os_unfair_lock_unlock(v3);
    swift_release();
  }
  sub_1B8F89720();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1B8F78450()
{
  return sub_1B8F6E454(&OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_activityIdentifier);
}

uint64_t sub_1B8F78468(uint64_t a1, uint64_t a2)
{
  return sub_1B8F6E52C(a1, a2, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_activityIdentifier);
}

uint64_t (*sub_1B8F78474())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B8F784DC()
{
  return sub_1B8F6E454(&OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_explanation);
}

uint64_t sub_1B8F784F4(uint64_t a1, uint64_t a2)
{
  return sub_1B8F6E52C(a1, a2, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_explanation);
}

uint64_t (*sub_1B8F78500())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B8F7855C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion);
  if (v3)
  {
    uint64_t v4 = *(os_unfair_lock_s **)(*(void *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v4);
    uint64_t v5 = *(void *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
    char v6 = *(unsigned char *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
    os_unfair_lock_unlock(v4);
    uint64_t result = swift_release();
  }
  else
  {
    uint64_t v5 = 0;
    char v6 = 1;
  }
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v6;
  return result;
}

char *PresentationAssertion.__allocating_init(explanation:activityIdentifier:presentationState:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v15 = objc_allocWithZone(v7);
  return PresentationAssertion.init(explanation:activityIdentifier:presentationState:invalidationHandler:)(a1, a2, a3, a4, a5, a6, a7);
}

char *PresentationAssertion.init(explanation:activityIdentifier:presentationState:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v44 = a6;
  uint64_t v45 = a7;
  uint64_t v41 = type metadata accessor for AssertionAttribute();
  uint64_t v13 = MEMORY[0x1F4188790](v41);
  uint64_t v42 = (uint64_t)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v41 - v15;
  uint64_t v17 = sub_1B8F89600();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v7[OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion] = 0;
  uint64_t v21 = &v7[OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_invalidationHandler];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  uint64_t v22 = (uint64_t *)&v7[OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_activityIdentifier];
  uint64_t v43 = a3;
  *uint64_t v22 = a3;
  v22[1] = a4;
  uint64_t v23 = (uint64_t *)&v7[OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_explanation];
  uint64_t v46 = a1;
  *uint64_t v23 = a1;
  v23[1] = a2;
  uint64_t v24 = (objc_class *)type metadata accessor for PresentationAssertion();
  v50.receiver = v7;
  v50.super_class = v24;
  swift_bridgeObjectRetain();
  uint64_t v47 = a2;
  swift_bridgeObjectRetain();
  id v25 = objc_msgSendSuper2(&v50, sel_init, v41);
  uint64_t v26 = (unsigned int *)MEMORY[0x1E4F17D40];
  switch(a5)
  {
    case 1:
      goto LABEL_10;
    case 2:
      uint64_t v27 = (unsigned int *)MEMORY[0x1E4F17D58];
      goto LABEL_5;
    case 3:
      uint64_t v27 = (unsigned int *)MEMORY[0x1E4F17D50];
LABEL_5:
      uint64_t v29 = *v27;
      uint64_t v30 = sub_1B8F895E0();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 104))(v20, v29, v30);
      uint64_t v26 = (unsigned int *)MEMORY[0x1E4F17D70];
      goto LABEL_10;
    case 4:
      uint64_t v28 = (unsigned int *)MEMORY[0x1E4F17D60];
      goto LABEL_7;
    case 5:
      uint64_t v34 = sub_1B8F895F0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v20, 1, 1, v34);
      goto LABEL_9;
    case 6:
      uint64_t v28 = (unsigned int *)MEMORY[0x1E4F17D68];
LABEL_7:
      uint64_t v31 = *v28;
      uint64_t v32 = sub_1B8F895F0();
      uint64_t v33 = *(void *)(v32 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v33 + 104))(v20, v31, v32);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v20, 0, 1, v32);
LABEL_9:
      uint64_t v26 = (unsigned int *)MEMORY[0x1E4F17D48];
LABEL_10:
      (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, *v26, v17);
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v16, v20, v17);
      swift_storeEnumTagMultiPayload();
      uint64_t v35 = v42;
      v48[0] = v43;
      v48[1] = a4;
      char v49 = 1;
      sub_1B8F6EF50((uint64_t)v16, v42);
      uint64_t v36 = (void *)swift_allocObject();
      uint64_t v37 = v45;
      v36[2] = v44;
      v36[3] = v37;
      v36[4] = v25;
      type metadata accessor for AttributeAssertion();
      swift_allocObject();
      uint64_t v38 = (char *)v25;
      uint64_t v39 = sub_1B8F82540(v46, v47, v48, v35, 0, 1, (uint64_t)sub_1B8F6EFFC, (uint64_t)v36);
      swift_release();
      sub_1B8F6D41C((uint64_t)v16);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
      *(void *)&v38[OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion] = v39;
      swift_release();
      return v38;
    default:
      sub_1B8F89A40();
      __break(1u);
      JUMPOUT(0x1B8F78B50);
  }
}

uint64_t sub_1B8F78C34()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion))
  {
    swift_retain();
    sub_1B8F821F4();
    return swift_release();
  }
  return result;
}

uint64_t sub_1B8F78D24()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  unint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  char v4 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if (v4) {
    return 0;
  }
  if (v3 < 8) {
    return qword_1B8F8BBF0[v3];
  }
  uint64_t result = sub_1B8F89BF0();
  __break(1u);
  return result;
}

uint64_t sub_1B8F78E24()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_attributeAssertion);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  int v4 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if (v4 == 1) {
    return v3 != 0;
  }
  else {
    return 2;
  }
}

uint64_t sub_1B8F78F40()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_activityIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

id PresentationAssertion.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void PresentationAssertion.init()()
{
}

id PresentationAssertion.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PresentationAssertion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PresentationAssertion()
{
  return self;
}

uint64_t sub_1B8F790FC()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B8F79144@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_activityIdentifier, a2);
}

uint64_t sub_1B8F79150(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F6E588(a1, a2, a3, a4, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_activityIdentifier);
}

uint64_t sub_1B8F79170@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_explanation, a2);
}

uint64_t sub_1B8F7917C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F6E588(a1, a2, a3, a4, &OBJC_IVAR____TtC16SessionAssertion21PresentationAssertion_explanation);
}

uint64_t method lookup function for PresentationAssertion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PresentationAssertion);
}

uint64_t dispatch thunk of PresentationAssertion.activityIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of PresentationAssertion.activityIdentifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of PresentationAssertion.activityIdentifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of PresentationAssertion.explanation.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of PresentationAssertion.explanation.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of PresentationAssertion.explanation.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of PresentationAssertion.state.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of PresentationAssertion.__allocating_init(explanation:activityIdentifier:presentationState:invalidationHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of PresentationAssertion.invalidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of PresentationAssertion.snaInvalidationReason.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of PresentationAssertion.snaState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of PresentationAssertion.snaSessionIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t sub_1B8F79404()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B8F794A4()
{
  sub_1B8F899C0();
  sub_1B8F89750();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  uint64_t v1 = OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF74D0);
  sub_1B8F89720();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  uint64_t v2 = *(void *)(v0 + v1);
  if (v2)
  {
    uint64_t v3 = *(os_unfair_lock_s **)(*(void *)(v2 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v3);
    os_unfair_lock_unlock(v3);
    swift_release();
  }
  sub_1B8F89720();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1B8F79714()
{
  return sub_1B8F6E454(&OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_activityIdentifier);
}

uint64_t sub_1B8F7972C(uint64_t a1, uint64_t a2)
{
  return sub_1B8F6E52C(a1, a2, &OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_activityIdentifier);
}

uint64_t (*sub_1B8F79738())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B8F797A0()
{
  return sub_1B8F6E454(&OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_explanation);
}

uint64_t sub_1B8F797B8(uint64_t a1, uint64_t a2)
{
  return sub_1B8F6E52C(a1, a2, &OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_explanation);
}

uint64_t (*sub_1B8F797C4())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B8F79820@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion);
  if (v3)
  {
    int v4 = *(os_unfair_lock_s **)(*(void *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v4);
    uint64_t v5 = *(void *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
    char v6 = *(unsigned char *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
    os_unfair_lock_unlock(v4);
    uint64_t result = swift_release();
  }
  else
  {
    uint64_t v5 = 0;
    char v6 = 1;
  }
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v6;
  return result;
}

char *ProminentPresentationAssertion.__allocating_init(explanation:activityIdentifier:duration:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  id v15 = objc_allocWithZone(v7);
  return ProminentPresentationAssertion.init(explanation:activityIdentifier:duration:invalidationHandler:)(a1, a2, a3, a4, a5, a6, a7);
}

char *ProminentPresentationAssertion.init(explanation:activityIdentifier:duration:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  uint64_t v31 = a5;
  uint64_t v32 = a6;
  uint64_t v30 = a1;
  uint64_t v13 = type metadata accessor for AssertionAttribute();
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v30 - v17;
  *(void *)&v7[OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion] = 0;
  uint64_t v19 = &v7[OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_invalidationHandler];
  *(void *)uint64_t v19 = 0;
  *((void *)v19 + 1) = 0;
  uint64_t v20 = (uint64_t *)&v7[OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_activityIdentifier];
  *uint64_t v20 = a3;
  v20[1] = a4;
  uint64_t v21 = (uint64_t *)&v7[OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_explanation];
  *uint64_t v21 = a1;
  v21[1] = a2;
  uint64_t v22 = (objc_class *)type metadata accessor for ProminentPresentationAssertion();
  v35.receiver = v7;
  v35.super_class = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v23 = objc_msgSendSuper2(&v35, sel_init);
  if (a7 > 0.0) {
    uint64_t v24 = *(void *)&a7;
  }
  else {
    uint64_t v24 = 0;
  }
  swift_storeEnumTagMultiPayload();
  v33[0] = a3;
  v33[1] = a4;
  char v34 = 1;
  sub_1B8F6EF50((uint64_t)v18, (uint64_t)v16);
  id v25 = (void *)swift_allocObject();
  uint64_t v26 = v32;
  v25[2] = v31;
  v25[3] = v26;
  v25[4] = v23;
  type metadata accessor for AttributeAssertion();
  swift_allocObject();
  uint64_t v27 = (char *)v23;
  uint64_t v28 = sub_1B8F82540(v30, a2, v33, (uint64_t)v16, v24, a7 <= 0.0, (uint64_t)sub_1B8F6EFFC, (uint64_t)v25);
  swift_release();
  sub_1B8F6D41C((uint64_t)v18);
  *(void *)&v27[OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion] = v28;
  swift_release();
  return v27;
}

uint64_t sub_1B8F79C2C()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion))
  {
    swift_retain();
    sub_1B8F821F4();
    return swift_release();
  }
  return result;
}

uint64_t sub_1B8F79D1C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  unint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  char v4 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if (v4) {
    return 0;
  }
  if (v3 < 8) {
    return qword_1B8F8BC98[v3];
  }
  uint64_t result = sub_1B8F89BF0();
  __break(1u);
  return result;
}

uint64_t sub_1B8F79E1C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_attributeAssertion);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  int v4 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if (v4 == 1) {
    return v3 != 0;
  }
  else {
    return 2;
  }
}

uint64_t sub_1B8F79F38()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_activityIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

id ProminentPresentationAssertion.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void ProminentPresentationAssertion.init()()
{
}

id ProminentPresentationAssertion.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProminentPresentationAssertion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ProminentPresentationAssertion()
{
  return self;
}

uint64_t sub_1B8F7A0F4()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B8F7A13C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_activityIdentifier, a2);
}

uint64_t sub_1B8F7A148(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F6E588(a1, a2, a3, a4, &OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_activityIdentifier);
}

uint64_t sub_1B8F7A168@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_explanation, a2);
}

uint64_t sub_1B8F7A174(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F6E588(a1, a2, a3, a4, &OBJC_IVAR____TtC16SessionAssertion30ProminentPresentationAssertion_explanation);
}

uint64_t method lookup function for ProminentPresentationAssertion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ProminentPresentationAssertion);
}

uint64_t dispatch thunk of ProminentPresentationAssertion.activityIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.activityIdentifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.activityIdentifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.explanation.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.explanation.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.explanation.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.state.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.__allocating_init(explanation:activityIdentifier:duration:invalidationHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.invalidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.snaInvalidationReason.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.snaState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ProminentPresentationAssertion.snaSessionIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t sub_1B8F7A3FC()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B8F7A434()
{
  type metadata accessor for AttributeAssertionManager();
  uint64_t v0 = (void *)swift_allocObject();
  type metadata accessor for UnfairLock();
  uint64_t v1 = swift_allocObject();
  objc_super v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 16) = v2;
  *objc_super v2 = 0;
  v0[2] = v1;
  v0[4] = MEMORY[0x1E4FBC868];
  uint64_t v3 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AssertionClient()), sel_init);
  v0[3] = v3;
  int v4 = &v3[OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate];
  swift_beginAccess();
  *((void *)v4 + 1) = &protocol witness table for AttributeAssertionManager;
  uint64_t result = swift_unknownObjectWeakAssign();
  qword_1EB9C7E18 = (uint64_t)v0;
  return result;
}

uint64_t static AttributeAssertionManager.shared.getter()
{
  if (qword_1EB9C7D80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_retain();
}

uint64_t static AttributeAssertionManager.shared.setter(uint64_t a1)
{
  if (qword_1EB9C7D80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_1EB9C7E18 = a1;
  return swift_release();
}

uint64_t (*static AttributeAssertionManager.shared.modify())()
{
  if (qword_1EB9C7D80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1B8F7A688()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1B8F7A6C0(uint64_t a1)
{
  uint64_t v3 = v2;
  int v4 = v1;
  uint64_t v6 = type metadata accessor for AssertionAcquisitionRequest();
  BOOL v7 = (int *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = &v29[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B8F7F238(a1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_attribute, (uint64_t)&v9[v7[7]], (uint64_t (*)(void))type metadata accessor for AssertionAttribute);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v12 = a1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_acquisitionDate;
  uint64_t v13 = sub_1B8F895D0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v9, v12, v13);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  char v16 = *(unsigned char *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 56);
  char v18 = *(unsigned char *)(a1 + 64);
  uint64_t v19 = &v9[v7[8]];
  *uint64_t v19 = v11;
  v19[1] = v10;
  uint64_t v20 = &v9[v7[10]];
  *(void *)uint64_t v20 = v17;
  v20[8] = v18;
  uint64_t v21 = &v9[v7[9]];
  *(void *)uint64_t v21 = v14;
  *((void *)v21 + 1) = v15;
  v21[16] = v16;
  uint64_t v30 = v4[3];
  uint64_t v31 = v9;
  swift_bridgeObjectRetain();
  sub_1B8F6CFA4();
  sub_1B8F898E0();
  if (!v3)
  {
    uint64_t v23 = v32;
    uint64_t v22 = v33;
    uint64_t v24 = a1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier;
    *(void *)uint64_t v24 = v32;
    *(void *)(v24 + 8) = v22;
    *(unsigned char *)(v24 + 16) = 0;
    id v25 = *(os_unfair_lock_s **)(v4[2] + 16);
    os_unfair_lock_lock(v25);
    type metadata accessor for AttributeAssertionManager.WeakAttributeAssertion();
    uint64_t v26 = swift_allocObject();
    swift_weakInit();
    swift_weakAssign();
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v34 = v4[4];
    v4[4] = 0x8000000000000000;
    sub_1B8F7D18C(v26, v23, v22, isUniquelyReferenced_nonNull_native);
    v4[4] = v34;
    swift_bridgeObjectRelease();
    swift_endAccess();
    os_unfair_lock_unlock(v25);
  }
  return sub_1B8F74828((uint64_t)v9);
}

uint64_t type metadata accessor for AttributeAssertionManager.WeakAttributeAssertion()
{
  return self;
}

void sub_1B8F7A95C(unsigned int *a1)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = *((void *)a1 + 1);
  uint64_t v6 = *(os_unfair_lock_s **)(*(void *)(v1 + 16) + 16);
  os_unfair_lock_lock(v6);
  sub_1B8F7AA6C(v1, v3 | (v4 << 32), v5, &v8);
  if (v2)
  {
    os_unfair_lock_unlock(v6);
    __break(1u);
  }
  else
  {
    os_unfair_lock_unlock(v6);
    if (v8)
    {
      MEMORY[0x1F4188790](v7);
      sub_1B8F898E0();
      swift_release();
    }
  }
}

uint64_t sub_1B8F7AA6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = (uint64_t *)(a1 + 32);
  swift_beginAccess();
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(v9 + 16) && (unint64_t v10 = sub_1B8F7CC10(a2, a3), (v11 & 1) != 0))
  {
    uint64_t v12 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
    swift_retain();
  }
  else
  {
    uint64_t v12 = 0;
  }
  swift_beginAccess();
  unint64_t v13 = sub_1B8F7CC10(a2, a3);
  if (v14)
  {
    unint64_t v15 = v13;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v8;
    uint64_t v20 = *v8;
    uint64_t *v8 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1B8F7D3A8();
      uint64_t v17 = v20;
    }
    sub_1B8F7CFA8(v15, v17);
    uint64_t *v8 = v17;
    swift_release();
    swift_bridgeObjectRelease();
  }
  uint64_t result = swift_endAccess();
  if (v12)
  {
    uint64_t Strong = swift_weakLoadStrong();
    uint64_t result = swift_release();
  }
  else
  {
    uint64_t Strong = 0;
  }
  *a4 = Strong;
  return result;
}

uint64_t AttributeAssertionManager.deinit()
{
  swift_release();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AttributeAssertionManager.__deallocating_deinit()
{
  swift_release();

  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 40, 7);
}

Swift::Void __swiftcall AttributeAssertionManager.didConnect()()
{
  uint64_t v1 = v0;
  uint64_t v140 = sub_1B8F89610();
  uint64_t v141 = *(void *)(v140 - 8);
  MEMORY[0x1F4188790](v140);
  uint64_t v3 = (os_unfair_lock_s *)((char *)&v140 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v150 = type metadata accessor for AssertionAcquisitionRequest();
  MEMORY[0x1F4188790](v150);
  v149 = (char *)&v140 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7E50);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (uint8_t *)&v140 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = type metadata accessor for AssertionReconnectProperties();
  uint64_t v151 = *(void *)(Strong - 8);
  uint64_t v9 = MEMORY[0x1F4188790](Strong);
  v160 = (uint64_t *)((char *)&v140 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v9);
  uint64_t v148 = (uint64_t)&v140 - v11;
  if (qword_1EB9C7DB0 != -1) {
    goto LABEL_123;
  }
  while (1)
  {
    v152 = v7;
    uint64_t v12 = sub_1B8F89680();
    uint64_t v146 = __swift_project_value_buffer(v12, (uint64_t)qword_1EB9C7E78);
    unint64_t v13 = sub_1B8F89670();
    os_log_type_t v14 = sub_1B8F89890();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v15 = 0;
      _os_log_impl(&dword_1B8F68000, v13, v14, "Reconnecting assertions", v15, 2u);
      MEMORY[0x1BA9D1680](v15, -1, -1);
    }

    uint64_t v162 = *(void *)(v1 + 16);
    char v16 = *(os_unfair_lock_s **)(v162 + 16);
    os_unfair_lock_lock(v16);
    uint64_t v17 = v1 + 32;
    swift_beginAccess();
    uint64_t v145 = v1;
    uint64_t v18 = swift_bridgeObjectRetain();
    unint64_t v19 = sub_1B8F7C01C(v18);
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v16);
    v144 = v3;
    if (v19 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_1B8F89A50();
    }
    else
    {
      uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    int64_t v161 = v19;
    uint64_t v163 = v20;
    v143 = 0;
    if (v20) {
      break;
    }
    uint64_t v21 = (os_unfair_lock_s *)Strong;
    uint64_t v24 = (void *)MEMORY[0x1E4FBC860];
    uint64_t v26 = 0;
LABEL_20:
    swift_bridgeObjectRelease();
    v142 = (void *)sub_1B8F7ED4C((uint64_t)v24);
    swift_bridgeObjectRelease();
    v147 = (uint64_t *)v17;
    if (v26)
    {
      if (v26 < 1) {
        goto LABEL_126;
      }
      unint64_t v158 = v19 & 0xC000000000000001;
      v156 = (unsigned int (**)(uint64_t, uint64_t, os_unfair_lock_t))(v151 + 48);
      v157 = (void (**)(uint64_t, uint64_t, uint64_t, os_unfair_lock_t))(v151 + 56);
      swift_bridgeObjectRetain();
      uint64_t v33 = 0;
      uint64_t Strong = MEMORY[0x1E4FBC860];
      uint64_t v34 = (uint64_t)v152;
      os_unfair_lock_t v35 = v21;
      os_unfair_lock_t v159 = v21;
      do
      {
        if (v158)
        {
          uint64_t v36 = MEMORY[0x1BA9D0E50](v33, v19);
        }
        else
        {
          uint64_t v36 = *(void *)(v19 + 8 * v33 + 32);
          swift_retain();
        }
        uint64_t v37 = (unint64_t *)(v36 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier);
        if (*(unsigned char *)(v36 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16))
        {
          uint64_t v38 = 1;
        }
        else
        {
          unint64_t v39 = *v37;
          uint64_t v154 = v37[1];
          unint64_t v153 = HIDWORD(v39);
          uint64_t v40 = (int *)v150;
          uint64_t v41 = *(int *)(v150 + 20);
          v155 = (void *)Strong;
          uint64_t v42 = (uint64_t)v149;
          sub_1B8F7F238(v36 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_attribute, (uint64_t)&v149[v41], (uint64_t (*)(void))type metadata accessor for AssertionAttribute);
          uint64_t v44 = *(void *)(v36 + 40);
          uint64_t v43 = *(void *)(v36 + 48);
          uint64_t v45 = v36 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_acquisitionDate;
          uint64_t v46 = sub_1B8F895D0();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 16))(v42, v45, v46);
          uint64_t v48 = *(void *)(v36 + 16);
          uint64_t v47 = *(void *)(v36 + 24);
          char v49 = *(unsigned char *)(v36 + 32);
          uint64_t v50 = *(void *)(v36 + 56);
          char v51 = *(unsigned char *)(v36 + 64);
          uint64_t v52 = (void *)(v42 + v40[6]);
          *uint64_t v52 = v44;
          v52[1] = v43;
          uint64_t v34 = (uint64_t)v152;
          uint64_t v53 = v42 + v40[8];
          *(void *)uint64_t v53 = v50;
          *(unsigned char *)(v53 + 8) = v51;
          uint64_t v54 = v40[7];
          uint64_t v26 = v163;
          uint64_t v55 = v42 + v54;
          *(void *)uint64_t v55 = v48;
          *(void *)(v55 + 8) = v47;
          *(unsigned char *)(v55 + 16) = v49;
          sub_1B8F7F238(v42, v34 + (int)v159[5]._os_unfair_lock_opaque, (uint64_t (*)(void))type metadata accessor for AssertionAcquisitionRequest);
          int v56 = v153;
          *(_DWORD *)uint64_t v34 = v39;
          *(_DWORD *)(v34 + 4) = v56;
          *(void *)(v34 + 8) = v154;
          swift_bridgeObjectRetain();
          unint64_t v19 = v161;
          sub_1B8F6CFA4();
          uint64_t v57 = v42;
          uint64_t Strong = (uint64_t)v155;
          os_unfair_lock_t v35 = v159;
          sub_1B8F74828(v57);
          uint64_t v38 = 0;
        }
        (*v157)(v34, v38, 1, v35);
        swift_release();
        if ((*v156)(v34, 1, v35) == 1)
        {
          sub_1B8F7EDC4(v34);
        }
        else
        {
          uint64_t v58 = v148;
          sub_1B8F7F1D4(v34, v148);
          sub_1B8F7F1D4(v58, (uint64_t)v160);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t Strong = sub_1B8F7C898(0, *(void *)(Strong + 16) + 1, 1, Strong);
          }
          unint64_t v60 = *(void *)(Strong + 16);
          unint64_t v59 = *(void *)(Strong + 24);
          if (v60 >= v59 >> 1) {
            uint64_t Strong = sub_1B8F7C898(v59 > 1, v60 + 1, 1, Strong);
          }
          *(void *)(Strong + 16) = v60 + 1;
          sub_1B8F7F1D4((uint64_t)v160, Strong+ ((*(unsigned __int8 *)(v151 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v151 + 80))+ *(void *)(v151 + 72) * v60);
        }
        ++v33;
      }
      while (v26 != v33);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t Strong = MEMORY[0x1E4FBC860];
    }
    uint64_t v61 = swift_bridgeObjectRelease();
    MEMORY[0x1F4188790](v61);
    *(&v140 - 2) = v62;
    *(&v140 - 1) = Strong;
    uint64_t v63 = v143;
    sub_1B8F898E0();
    uint64_t v64 = v144;
    if (v63)
    {
      swift_bridgeObjectRelease();
      v166[0] = v63;
      id v65 = v63;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF7680);
      if (swift_dynamicCast())
      {
        uint64_t v66 = v141;
        if (v165 == 3)
        {

          swift_bridgeObjectRelease();
          v67 = sub_1B8F89670();
          os_log_type_t v68 = sub_1B8F89890();
          if (os_log_type_enabled(v67, v68))
          {
            v69 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v69 = 0;
            _os_log_impl(&dword_1B8F68000, v67, v68, "Could not reconnect assertions because server is missing", v69, 2u);
            MEMORY[0x1BA9D1680](v69, -1, -1);
          }

          return;
        }
      }
      else
      {
        uint64_t v66 = v141;
      }

      v166[0] = v63;
      id v71 = v63;
      uint64_t v72 = v140;
      if (!swift_dynamicCast())
      {
        v136 = v63;
        swift_bridgeObjectRelease();
LABEL_118:

        v137 = sub_1B8F89670();
        os_log_type_t v138 = sub_1B8F89890();
        if (os_log_type_enabled(v137, v138))
        {
          v139 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v139 = 0;
          _os_log_impl(&dword_1B8F68000, v137, v138, "Could not reconnect assertions for unexpected error", v139, 2u);
          MEMORY[0x1BA9D1680](v139, -1, -1);
        }

        return;
      }
      if ((*(unsigned int (**)(os_unfair_lock_s *, uint64_t))(v66 + 88))(v64, v72) != *MEMORY[0x1E4F17EC0])
      {
        v136 = v63;
        swift_bridgeObjectRelease();
        (*(void (**)(os_unfair_lock_s *, uint64_t))(v66 + 8))(v64, v72);
        goto LABEL_118;
      }

      uint64_t v73 = sub_1B8F89670();
      os_log_type_t v74 = sub_1B8F89890();
      if (os_log_type_enabled(v73, v74))
      {
        v75 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v75 = 0;
        _os_log_impl(&dword_1B8F68000, v73, v74, "Could not reconnect assertions because client is not entitled", v75, 2u);
        MEMORY[0x1BA9D1680](v75, -1, -1);
      }

      id v70 = (id)sub_1B8F7F068(MEMORY[0x1E4FBC860]);
      v155 = 0;
    }
    else
    {
      v155 = 0;
      swift_bridgeObjectRelease();
      id v70 = v166[0];
    }
    swift_bridgeObjectRetain_n();
    uint64_t v76 = sub_1B8F89670();
    os_log_type_t v77 = sub_1B8F89890();
    uint64_t v3 = (os_unfair_lock_s *)v77;
    if (os_log_type_enabled(v76, v77))
    {
      char v78 = (uint8_t *)swift_slowAlloc();
      char v79 = (void *)swift_slowAlloc();
      v166[0] = v79;
      *(_DWORD *)char v78 = 136446210;
      uint64_t Strong = (uint64_t)(v78 + 4);
      sub_1B8F7F180();
      swift_bridgeObjectRetain();
      uint64_t v80 = sub_1B8F896F0();
      unint64_t v82 = v81;
      swift_bridgeObjectRelease();
      uint64_t v165 = sub_1B8F73D54(v80, v82, (uint64_t *)v166);
      sub_1B8F89930();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B8F68000, v76, (os_log_type_t)v3, "Map: %{public}s", v78, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9D1680](v79, -1, -1);
      MEMORY[0x1BA9D1680](v78, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v83 = *(os_unfair_lock_s **)(v162 + 16);
    os_unfair_lock_lock(v83);
    sub_1B8F7C364((uint64_t)v70, v145);
    os_unfair_lock_unlock(v83);
    uint64_t v84 = sub_1B8F7C1E8((uint64_t)v70);
    uint64_t v7 = (uint8_t *)v84;
    if (*(void *)(v84 + 16) <= v142[2] >> 3)
    {
      v166[0] = v142;
      sub_1B8F7D6A4(v84);
      swift_bridgeObjectRelease();
      v85 = v166[0];
    }
    else
    {
      v85 = (void *)sub_1B8F7D82C(v84, (uint64_t)v142);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain_n();
    v86 = sub_1B8F89670();
    os_log_type_t v87 = sub_1B8F89890();
    uint64_t v1 = v87;
    if (os_log_type_enabled(v86, v87))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v3 = (os_unfair_lock_s *)swift_slowAlloc();
      v166[0] = v3;
      *(_DWORD *)uint64_t v7 = 136446210;
      sub_1B8F7F180();
      swift_bridgeObjectRetain();
      uint64_t Strong = sub_1B8F89860();
      unint64_t v89 = v88;
      swift_bridgeObjectRelease();
      uint64_t v165 = sub_1B8F73D54(Strong, v89, (uint64_t *)v166);
      sub_1B8F89930();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B8F68000, v86, (os_log_type_t)v1, "Failed identifiers: %{public}s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9D1680](v3, -1, -1);
      MEMORY[0x1BA9D1680](v7, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v90 = v147;
    int64_t v91 = 0;
    uint64_t v92 = v85[7];
    v160 = v85 + 7;
    uint64_t v93 = 1 << *((unsigned char *)v85 + 32);
    uint64_t v94 = -1;
    if (v93 < 64) {
      uint64_t v94 = ~(-1 << v93);
    }
    unint64_t v95 = v94 & v92;
    int64_t v161 = (unint64_t)(v93 + 63) >> 6;
    uint64_t v154 = MEMORY[0x1E4FBC848] + 8;
    v156 = (unsigned int (**)(uint64_t, uint64_t, os_unfair_lock_t))v85;
    while (1)
    {
      if (v95)
      {
        unint64_t v96 = __clz(__rbit64(v95));
        v95 &= v95 - 1;
        unint64_t v97 = v96 | (v91 << 6);
        goto LABEL_79;
      }
      if (__OFADD__(v91++, 1))
      {
        __break(1u);
        goto LABEL_122;
      }
      if (v91 >= v161) {
        goto LABEL_115;
      }
      unint64_t v99 = v160[v91];
      if (!v99) {
        break;
      }
LABEL_78:
      unint64_t v95 = (v99 - 1) & v99;
      unint64_t v97 = __clz(__rbit64(v99)) + (v91 << 6);
LABEL_79:
      v101 = (uint64_t *)(v85[6] + 16 * v97);
      uint64_t v3 = *(os_unfair_lock_s **)(v162 + 16);
      uint64_t v102 = *v101;
      uint64_t v1 = v101[1];
      os_unfair_lock_lock(v3);
      uint64_t v103 = *v90;
      if (*(void *)(*v90 + 16) && (unint64_t v104 = sub_1B8F7CC10(v102, v1), (v105 & 1) != 0))
      {
        uint64_t v7 = *(uint8_t **)(*(void *)(v103 + 56) + 8 * v104);
        swift_retain();
      }
      else
      {
        uint64_t v7 = 0;
      }
      swift_beginAccess();
      unint64_t v106 = sub_1B8F7CC10(v102, v1);
      if (v107)
      {
        unint64_t v108 = v106;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v110 = *v90;
        uint64_t v164 = *v90;
        uint64_t *v90 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_1B8F7D3A8();
          uint64_t v110 = v164;
        }
        sub_1B8F7CFA8(v108, v110);
        uint64_t v1 = *v90;
        uint64_t *v90 = v110;
        swift_release();
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
      if (v7)
      {
        uint64_t Strong = swift_weakLoadStrong();
        swift_release();
      }
      else
      {
        uint64_t Strong = 0;
      }
      os_unfair_lock_unlock(v3);
      if (Strong)
      {
        uint64_t v3 = *(os_unfair_lock_s **)(*(void *)(Strong + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock)
                                  + 16);
        swift_retain();
        os_unfair_lock_lock(v3);
        uint64_t v111 = Strong + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state;
        if ((*(unsigned char *)(Strong + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8) & 1) == 0)
        {
          os_unfair_lock_unlock(v3);
          goto LABEL_65;
        }
        *(void *)uint64_t v111 = 7;
        *(unsigned char *)(v111 + 8) = 0;
        *(void *)(Strong + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_invalidationState) = 0;
        swift_bridgeObjectRelease();
        uint64_t v112 = Strong + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier;
        if (*(unsigned char *)(Strong + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16)) {
          goto LABEL_127;
        }
        uint64_t v113 = *(void *)(Strong + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_manager);
        uint64_t v114 = *(void *)v112;
        uint64_t v115 = *(void *)(v112 + 8);
        v116 = *(os_unfair_lock_s **)(*(void *)(v113 + 16) + 16);
        swift_retain();
        os_unfair_lock_t v159 = v116;
        os_unfair_lock_lock(v116);
        uint64_t v1 = v113 + 32;
        swift_beginAccess();
        uint64_t v117 = *(void *)(v113 + 32);
        uint64_t v118 = *(void *)(v117 + 16);
        uint64_t v163 = v114;
        if (v118 && (unint64_t v119 = sub_1B8F7CC10(v114, v115), (v120 & 1) != 0))
        {
          uint64_t v121 = *(void *)(*(void *)(v117 + 56) + 8 * v119);
          swift_retain();
        }
        else
        {
          uint64_t v121 = 0;
        }
        swift_beginAccess();
        v157 = (void (**)(uint64_t, uint64_t, uint64_t, os_unfair_lock_t))v115;
        unint64_t v122 = sub_1B8F7CC10(v163, v115);
        if (v123)
        {
          unint64_t v124 = v122;
          unint64_t v158 = v95;
          char v125 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v126 = *(void *)v1;
          uint64_t v164 = *(void *)v1;
          *(void *)uint64_t v1 = 0x8000000000000000;
          if ((v125 & 1) == 0)
          {
            sub_1B8F7D3A8();
            uint64_t v126 = v164;
          }
          sub_1B8F7CFA8(v124, v126);
          *(void *)uint64_t v1 = v126;
          swift_release();
          swift_bridgeObjectRelease();
          unint64_t v95 = v158;
        }
        swift_endAccess();
        if (!v121)
        {
          os_unfair_lock_unlock(v159);
          v90 = v147;
LABEL_106:
          swift_release();
          goto LABEL_113;
        }
        uint64_t v1 = swift_weakLoadStrong();
        swift_release();
        os_unfair_lock_unlock(v159);
        v90 = v147;
        if (!v1) {
          goto LABEL_106;
        }
        unint64_t v158 = v95;
        MEMORY[0x1F4188790](v127);
        *((_DWORD *)&v140 - 8) = v129;
        *((_DWORD *)&v140 - 7) = v128;
        *(&v140 - 3) = (uint64_t)v157;
        *(&v140 - 2) = v130;
        v131 = v155;
        sub_1B8F898E0();
        if (v131)
        {
          swift_release();

          swift_release();
          v155 = 0;
        }
        else
        {
          v155 = 0;
          swift_release();
          swift_release();
        }
        unint64_t v95 = v158;
LABEL_113:
        v132 = (void *)(Strong + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
        uint64_t v7 = *(uint8_t **)(Strong + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
        void *v132 = 0;
        v132[1] = 0;
        sub_1B8F7F170((uint64_t)v7);
        sub_1B8F6F3B8((uint64_t)v7);
        *(void *)uint64_t v112 = 0;
        *(void *)(v112 + 8) = 0;
        *(unsigned char *)(v112 + 16) = 1;
        os_unfair_lock_unlock(v3);
        v85 = v156;
        if (v7)
        {
          sub_1B8F747D4();
          uint64_t v1 = v95;
          uint64_t v133 = swift_allocError();
          unsigned char *v134 = 0;
          swift_retain();
          ((void (*)(uint64_t, uint64_t))v7)(Strong, v133);
          v135 = (void *)v133;
          unint64_t v95 = v1;

          sub_1B8F6F3B8((uint64_t)v7);
          sub_1B8F6F3B8((uint64_t)v7);
        }
LABEL_65:
        swift_release_n();
      }
    }
    int64_t v100 = v91 + 1;
    if (v91 + 1 >= v161) {
      goto LABEL_115;
    }
    unint64_t v99 = v160[v100];
    if (v99) {
      goto LABEL_77;
    }
    int64_t v100 = v91 + 2;
    if (v91 + 2 >= v161) {
      goto LABEL_115;
    }
    unint64_t v99 = v160[v100];
    if (v99) {
      goto LABEL_77;
    }
    int64_t v100 = v91 + 3;
    if (v91 + 3 >= v161)
    {
LABEL_115:
      swift_release();
      return;
    }
    unint64_t v99 = v160[v100];
    if (v99)
    {
LABEL_77:
      int64_t v91 = v100;
      goto LABEL_78;
    }
    while (1)
    {
      int64_t v91 = v100 + 1;
      if (__OFADD__(v100, 1)) {
        break;
      }
      if (v91 >= v161) {
        goto LABEL_115;
      }
      unint64_t v99 = v160[v91];
      ++v100;
      if (v99) {
        goto LABEL_78;
      }
    }
LABEL_122:
    __break(1u);
LABEL_123:
    swift_once();
  }
  if (v20 >= 1)
  {
    uint64_t v21 = (os_unfair_lock_s *)Strong;
    uint64_t v22 = 0;
    unint64_t v23 = v19 & 0xC000000000000001;
    uint64_t v24 = (void *)MEMORY[0x1E4FBC860];
    do
    {
      if (v23) {
        uint64_t v27 = MEMORY[0x1BA9D0E50](v22, v19);
      }
      else {
        uint64_t v27 = swift_retain();
      }
      uint64_t v29 = *(void *)(v27 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier);
      uint64_t v28 = *(void *)(v27 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 8);
      char v30 = *(unsigned char *)(v27 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16);
      swift_release();
      if ((v30 & 1) == 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v24 = sub_1B8F7CB00(0, v24[2] + 1, 1, v24);
        }
        unint64_t v32 = v24[2];
        unint64_t v31 = v24[3];
        if (v32 >= v31 >> 1) {
          uint64_t v24 = sub_1B8F7CB00((void *)(v31 > 1), v32 + 1, 1, v24);
        }
        v24[2] = v32 + 1;
        id v25 = &v24[2 * v32];
        v25[4] = v29;
        v25[5] = v28;
        unint64_t v19 = v161;
      }
      ++v22;
      uint64_t v26 = v163;
    }
    while (v163 != v22);
    goto LABEL_20;
  }
  __break(1u);
LABEL_126:
  __break(1u);
LABEL_127:
  __break(1u);
}

uint64_t sub_1B8F7C01C(uint64_t a1)
{
  uint64_t v11 = MEMORY[0x1E4FBC860];
  uint64_t v1 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (v4)
  {
    v4 &= v4 - 1;
LABEL_22:
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      MEMORY[0x1BA9D0C70]();
      if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1B8F89840();
      }
      sub_1B8F89850();
      uint64_t result = sub_1B8F89830();
    }
  }
  int64_t v8 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v8 >= v5) {
    goto LABEL_26;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v8);
  ++v7;
  if (v9) {
    goto LABEL_21;
  }
  int64_t v7 = v8 + 1;
  if (v8 + 1 >= v5) {
    goto LABEL_26;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v7);
  if (v9) {
    goto LABEL_21;
  }
  int64_t v7 = v8 + 2;
  if (v8 + 2 >= v5) {
    goto LABEL_26;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v7);
  if (v9) {
    goto LABEL_21;
  }
  int64_t v7 = v8 + 3;
  if (v8 + 3 >= v5) {
    goto LABEL_26;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v7);
  if (v9)
  {
LABEL_21:
    uint64_t v4 = (v9 - 1) & v9;
    goto LABEL_22;
  }
  int64_t v10 = v8 + 4;
  if (v10 >= v5)
  {
LABEL_26:
    swift_release();
    return v11;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v10);
  if (v9)
  {
    int64_t v7 = v10;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v7 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v7 >= v5) {
      goto LABEL_26;
    }
    uint64_t v9 = *(void *)(v1 + 8 * v7);
    ++v10;
    if (v9) {
      goto LABEL_21;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1B8F7C1E8(uint64_t a1)
{
  sub_1B8F7F180();
  uint64_t result = sub_1B8F89870();
  int64_t v3 = 0;
  uint64_t v15 = result;
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    uint64_t result = sub_1B8F7D548((uint64_t)v14, *(void *)(*(void *)(a1 + 48) + 16 * v10), *(void *)(*(void *)(a1 + 48) + 16 * v10 + 8));
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1B8F7C364(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  unint64_t v7 = (uint64_t *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  int64_t v8 = 0;
  int64_t v9 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v49 = v3;
  uint64_t v50 = v2;
  int64_t v48 = v9;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v8 << 6);
      goto LABEL_22;
    }
    int64_t v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    if (v12 >= v9) {
      return swift_release();
    }
    unint64_t v13 = *(void *)(v3 + 8 * v12);
    ++v8;
    if (!v13)
    {
      int64_t v8 = v12 + 1;
      if (v12 + 1 >= v9) {
        return swift_release();
      }
      unint64_t v13 = *(void *)(v3 + 8 * v8);
      if (!v13)
      {
        int64_t v8 = v12 + 2;
        if (v12 + 2 >= v9) {
          return swift_release();
        }
        unint64_t v13 = *(void *)(v3 + 8 * v8);
        if (!v13) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_22:
    uint64_t v15 = (void *)*v7;
    if (*(void *)(*v7 + 16))
    {
      uint64_t v16 = 16 * v11;
      uint64_t v17 = *(void *)(v2 + 48);
      uint64_t v18 = *(void *)(v17 + v16 + 8);
      unint64_t v19 = (uint64_t *)(*(void *)(v2 + 56) + v16);
      uint64_t v53 = *v19;
      uint64_t v20 = v19[1];
      uint64_t v21 = *(void *)(v17 + v16);
      unint64_t v22 = sub_1B8F7CC10(v21, v18);
      if (v23)
      {
        uint64_t v24 = *(void *)(v15[7] + 8 * v22);
        uint64_t Strong = swift_weakLoadStrong();
        if (Strong)
        {
          uint64_t v51 = v18;
          unint64_t v26 = v53 | ((unint64_t)HIDWORD(v53) << 32);
          uint64_t v27 = Strong + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier;
          *(void *)uint64_t v27 = v26;
          *(void *)(v27 + 8) = v20;
          *(unsigned char *)(v27 + 16) = 0;
          swift_beginAccess();
          uint64_t v52 = v24;
          swift_retain_n();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v29 = *v7;
          uint64_t v54 = (void *)*v7;
          *unint64_t v7 = 0x8000000000000000;
          unint64_t v31 = sub_1B8F7CC10(v26, v20);
          uint64_t v32 = *(void *)(v29 + 16);
          BOOL v33 = (v30 & 1) == 0;
          uint64_t v34 = v32 + v33;
          if (__OFADD__(v32, v33)) {
            goto LABEL_40;
          }
          char v35 = v30;
          if (*(void *)(v29 + 24) >= v34)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              sub_1B8F7D3A8();
            }
          }
          else
          {
            sub_1B8F7CCA8(v34, isUniquelyReferenced_nonNull_native);
            unint64_t v36 = sub_1B8F7CC10(v26, v20);
            if ((v35 & 1) != (v37 & 1)) {
              goto LABEL_43;
            }
            unint64_t v31 = v36;
          }
          if (v35)
          {
            *(void *)(v54[7] + 8 * v31) = v52;
            swift_release();
          }
          else
          {
            v54[(v31 >> 6) + 8] |= 1 << v31;
            uint64_t v38 = (void *)(v54[6] + 16 * v31);
            *uint64_t v38 = v53;
            v38[1] = v20;
            *(void *)(v54[7] + 8 * v31) = v52;
            uint64_t v39 = v54[2];
            BOOL v40 = __OFADD__(v39, 1);
            uint64_t v41 = v39 + 1;
            if (v40) {
              goto LABEL_42;
            }
            v54[2] = v41;
          }
          *unint64_t v7 = (uint64_t)v54;
          swift_bridgeObjectRelease();
          swift_endAccess();
          swift_beginAccess();
          unint64_t v42 = sub_1B8F7CC10(v21, v51);
          uint64_t v3 = v49;
          uint64_t v2 = v50;
          if (v43)
          {
            unint64_t v44 = v42;
            char v45 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v46 = *v7;
            uint64_t v55 = *v7;
            *unint64_t v7 = 0x8000000000000000;
            if ((v45 & 1) == 0)
            {
              sub_1B8F7D3A8();
              uint64_t v46 = v55;
            }
            sub_1B8F7CFA8(v44, v46);
            *unint64_t v7 = v46;
            swift_release();
            swift_bridgeObjectRelease();
          }
          swift_endAccess();
          swift_release();
          swift_release();
          int64_t v9 = v48;
        }
      }
    }
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v9) {
    return swift_release();
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    int64_t v8 = v14;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v8 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v8 >= v9) {
      return swift_release();
    }
    unint64_t v13 = *(void *)(v3 + 8 * v8);
    ++v14;
    if (v13) {
      goto LABEL_21;
    }
  }
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  uint64_t result = sub_1B8F89C10();
  __break(1u);
  return result;
}

void AttributeAssertionManager.didInvalidate(invalidationMessage:)(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v5 = a1[3];
  unint64_t v7 = *(os_unfair_lock_s **)(*(void *)(v2 + 16) + 16);
  os_unfair_lock_lock(v7);
  sub_1B8F7AA6C(v2, v3, v4, v14);
  os_unfair_lock_unlock(v7);
  uint64_t v8 = v14[0];
  if (v14[0])
  {
    v14[0] = 0;
    v14[1] = 0;
    int64_t v9 = *(os_unfair_lock_s **)(*(void *)(v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    os_unfair_lock_lock(v9);
    sub_1B8F82428(v8, v6, v5, v14);
    os_unfair_lock_unlock(v9);
    unint64_t v10 = (void (*)(uint64_t, void *))v14[0];
    if (v14[0])
    {
      sub_1B8F747D4();
      unint64_t v11 = (void *)swift_allocError();
      *int64_t v12 = 0;
      swift_retain();
      v10(v8, v11);

      sub_1B8F6F3B8((uint64_t)v10);
      uint64_t v13 = v14[0];
    }
    else
    {
      uint64_t v13 = 0;
    }
    sub_1B8F6F3B8(v13);
    swift_bridgeObjectRelease();
    swift_release_n();
  }
}

uint64_t sub_1B8F7C898(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF7690);
  uint64_t v10 = *(void *)(type metadata accessor for AssertionReconnectProperties() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1B8F89A30();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for AssertionReconnectProperties() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1B8F7EF10(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_1B8F7CB00(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF7688);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1B8F7EE24(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_1B8F7CC10(uint64_t a1, uint64_t a2)
{
  sub_1B8F89C60();
  sub_1B8F89C80();
  sub_1B8F89C80();
  sub_1B8F89C90();
  uint64_t v4 = sub_1B8F89CA0();

  return sub_1B8F7D320(a1, a2, v4);
}

uint64_t sub_1B8F7CCA8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7EE0);
  char v34 = a2;
  uint64_t result = sub_1B8F89A70();
  uint64_t v8 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v9 = 0;
    uint64_t v10 = (void *)(v5 + 64);
    uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = v12 & *(void *)(v5 + 64);
    int64_t v14 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v15 = result + 64;
    while (1)
    {
      if (v13)
      {
        unint64_t v21 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v22 = v21 | (v9 << 6);
      }
      else
      {
        if (__OFADD__(v9++, 1)) {
          goto LABEL_40;
        }
        if (v9 >= v14)
        {
LABEL_31:
          if ((v34 & 1) == 0)
          {
            uint64_t result = swift_release();
            uint64_t v3 = v2;
            goto LABEL_38;
          }
          uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
          if (v33 >= 64) {
            bzero((void *)(v5 + 64), ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          }
          else {
            void *v10 = -1 << v33;
          }
          uint64_t v3 = v2;
          *(void *)(v5 + 16) = 0;
          break;
        }
        unint64_t v24 = v10[v9];
        if (!v24)
        {
          int64_t v25 = v9 + 1;
          if (v9 + 1 >= v14) {
            goto LABEL_31;
          }
          unint64_t v24 = v10[v25];
          if (!v24)
          {
            while (1)
            {
              int64_t v9 = v25 + 1;
              if (__OFADD__(v25, 1)) {
                break;
              }
              if (v9 >= v14) {
                goto LABEL_31;
              }
              unint64_t v24 = v10[v9];
              ++v25;
              if (v24) {
                goto LABEL_20;
              }
            }
LABEL_39:
            __break(1u);
LABEL_40:
            __break(1u);
            return result;
          }
          ++v9;
        }
LABEL_20:
        unint64_t v13 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v9 << 6);
      }
      unint64_t v26 = (void *)(*(void *)(v5 + 48) + 16 * v22);
      *(void *)&long long v7 = *v26;
      long long v35 = v7;
      uint64_t v27 = v26[1];
      uint64_t v28 = *(void *)(*(void *)(v5 + 56) + 8 * v22);
      if ((v34 & 1) == 0) {
        swift_retain();
      }
      sub_1B8F89C60();
      sub_1B8F89C80();
      sub_1B8F89C80();
      sub_1B8F89C90();
      uint64_t result = sub_1B8F89CA0();
      uint64_t v16 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1 << v17) & ~*(void *)(v15 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v15 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
        long long v7 = v35;
      }
      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v16) >> 6;
        long long v7 = v35;
        do
        {
          if (++v18 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v31 = v18 == v30;
          if (v18 == v30) {
            unint64_t v18 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v15 + 8 * v18);
        }
        while (v32 == -1);
        unint64_t v19 = __clz(__rbit64(~v32)) + (v18 << 6);
      }
      *(void *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t v20 = (void *)(*(void *)(v8 + 48) + 16 * v19);
      *uint64_t v20 = v7;
      v20[1] = v27;
      *(void *)(*(void *)(v8 + 56) + 8 * v19) = v28;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v8;
  return result;
}

unint64_t sub_1B8F7CFA8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1B8F89980();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1B8F89C60();
        sub_1B8F89C80();
        sub_1B8F89C80();
        sub_1B8F89C90();
        uint64_t result = sub_1B8F89CA0();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          uint64_t v11 = (_OWORD *)(v10 + 16 * v3);
          uint64_t v12 = (_OWORD *)(v10 + 16 * v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            _OWORD *v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          int64_t v14 = (void *)(v13 + 8 * v3);
          uint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *int64_t v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *uint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1B8F7D18C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1B8F7CC10(a2, a3);
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
      sub_1B8F7D3A8();
      goto LABEL_7;
    }
    sub_1B8F7CCA8(v15, a4 & 1);
    unint64_t v20 = sub_1B8F7CC10(a2, a3);
    if ((v16 & 1) == (v21 & 1))
    {
      unint64_t v12 = v20;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    unint64_t result = sub_1B8F89C10();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    *(void *)(v18[7] + 8 * v12) = a1;
    return swift_release();
  }
LABEL_13:

  return sub_1B8F7D2D0(v12, a2, a3, a1, v18);
}

unint64_t sub_1B8F7D2D0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_1B8F7D320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t result = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = ~v5;
    do
    {
      uint64_t v8 = *(void *)(v3 + 48) + 16 * result;
      int v9 = *(_DWORD *)v8;
      int v10 = *(_DWORD *)(v8 + 4);
      uint64_t v11 = *(void *)(v8 + 8);
      if (v9 == a1 && v10 == HIDWORD(a1) && v11 == a2) {
        break;
      }
      unint64_t result = (result + 1) & v7;
    }
    while (((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

void *sub_1B8F7D3A8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7EE0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B8F89A60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    unint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1B8F7D548(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v5 = a2;
  unint64_t v7 = HIDWORD(a2);
  uint64_t v8 = *v3;
  sub_1B8F89C60();
  sub_1B8F89C80();
  sub_1B8F89C80();
  sub_1B8F89C90();
  uint64_t v9 = sub_1B8F89CA0();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  unint64_t v11 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
  {
    uint64_t v12 = ~v10;
    while (1)
    {
      uint64_t v13 = *(void *)(v8 + 48) + 16 * v11;
      int v14 = *(_DWORD *)v13;
      int v15 = *(_DWORD *)(v13 + 4);
      uint64_t v16 = *(void *)(v13 + 8);
      BOOL v17 = v14 == v5 && v15 == v7;
      if (v17 && v16 == a3) {
        break;
      }
      unint64_t v11 = (v11 + 1) & v12;
      if (((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_11;
      }
    }
    uint64_t result = 0;
    uint64_t v21 = *(void *)(*v3 + 48) + 16 * v11;
    LODWORD(v5) = *(_DWORD *)v21;
    LODWORD(v7) = *(_DWORD *)(v21 + 4);
    a3 = *(void *)(v21 + 8);
  }
  else
  {
LABEL_11:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_1B8F7EBC8(v5, a3, v11, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v22;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
  }
  *(_DWORD *)a1 = v5;
  *(_DWORD *)(a1 + 4) = v7;
  *(void *)(a1 + 8) = a3;
  return result;
}

uint64_t sub_1B8F7D6A4(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v11 >= v7) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v3 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v12 = *(void *)(v3 + 8 * v8);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_6:
    uint64_t result = sub_1B8F7DC20(*(void *)(*(void *)(v2 + 48) + 16 * v10), *(void *)(*(void *)(v2 + 48) + 16 * v10 + 8), (uint64_t)v14);
  }
  int64_t v13 = v11 + 4;
  if (v13 < v7)
  {
    unint64_t v12 = *(void *)(v3 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        ++v13;
        if (v12) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v13;
    goto LABEL_23;
  }
LABEL_24:

  return swift_release();
}

uint64_t sub_1B8F7D82C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  v41[5] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a2 + 16))
  {
    int64_t v4 = 0;
    uint64_t v6 = a1 + 56;
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v39 = ~v7;
    if (-v7 < 64) {
      uint64_t v8 = ~(-1 << -(char)v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & v5;
    int64_t v40 = (unint64_t)(63 - v7) >> 6;
    uint64_t v10 = a2 + 56;
    do
    {
LABEL_6:
      if (v9)
      {
        unint64_t v11 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v12 = v11 | (v4 << 6);
      }
      else
      {
        int64_t v13 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_42;
        }
        if (v13 >= v40) {
          goto LABEL_39;
        }
        unint64_t v14 = *(void *)(v6 + 8 * v13);
        int64_t v15 = v4 + 1;
        if (!v14)
        {
          int64_t v15 = v4 + 2;
          if (v4 + 2 >= v40) {
            goto LABEL_39;
          }
          unint64_t v14 = *(void *)(v6 + 8 * v15);
          if (!v14)
          {
            int64_t v15 = v4 + 3;
            if (v4 + 3 >= v40) {
              goto LABEL_39;
            }
            unint64_t v14 = *(void *)(v6 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v4 + 4;
              if (v4 + 4 >= v40) {
                goto LABEL_39;
              }
              unint64_t v14 = *(void *)(v6 + 8 * v15);
              if (!v14)
              {
                int64_t v16 = v4 + 5;
                if (v4 + 5 >= v40)
                {
LABEL_39:
                  swift_bridgeObjectRetain();
                  sub_1B8F7F34C();
                  return v2;
                }
                unint64_t v14 = *(void *)(v6 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      break;
                    }
                    if (v15 >= v40) {
                      goto LABEL_39;
                    }
                    unint64_t v14 = *(void *)(v6 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_23;
                    }
                  }
LABEL_42:
                  __break(1u);
                }
                int64_t v15 = v4 + 5;
              }
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        int64_t v4 = v15;
      }
      uint64_t v17 = *(void *)(a1 + 48) + 16 * v12;
      int v18 = *(_DWORD *)v17;
      int v19 = *(_DWORD *)(v17 + 4);
      uint64_t v20 = *(void *)(v17 + 8);
      sub_1B8F89C60();
      sub_1B8F89C80();
      sub_1B8F89C80();
      sub_1B8F89C90();
      uint64_t v21 = sub_1B8F89CA0();
      uint64_t v22 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v23 = v21 & ~v22;
    }
    while (((*(void *)(v10 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0);
    while (1)
    {
      uint64_t v24 = *(void *)(v2 + 48) + 16 * v23;
      int v25 = *(_DWORD *)v24;
      int v26 = *(_DWORD *)(v24 + 4);
      uint64_t v27 = *(void *)(v24 + 8);
      BOOL v28 = v25 == v18 && v26 == v19;
      if (v28 && v27 == v20) {
        break;
      }
      unint64_t v23 = (v23 + 1) & ~v22;
      if (((*(void *)(v10 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
        goto LABEL_6;
      }
    }
    v41[0] = a1;
    v41[1] = v6;
    v41[2] = v39;
    v41[3] = v4;
    v41[4] = v9;
    unint64_t v30 = (unint64_t)(63 - v22) >> 6;
    size_t v31 = 8 * v30;
    uint64_t isStackAllocationSafe = swift_bridgeObjectRetain();
    if (v30 <= 0x80 || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x1F4188790](isStackAllocationSafe);
      char v34 = (char *)&v39 - v33;
      memcpy((char *)&v39 - v33, (const void *)(v2 + 56), v31);
      uint64_t v35 = sub_1B8F7E06C((uint64_t)v34, v30, v2, v23, v41);
      swift_release();
      sub_1B8F7F34C();
      return v35;
    }
    else
    {
      unint64_t v36 = (void *)swift_slowAlloc();
      memcpy(v36, (const void *)(v2 + 56), v31);
      uint64_t v37 = sub_1B8F7E06C((uint64_t)v36, v30, v2, v23, v41);
      swift_release();
      sub_1B8F7F34C();
      MEMORY[0x1BA9D1680](v36, -1, -1);
      return v37;
    }
  }
  else
  {
    swift_release();
    return MEMORY[0x1E4FBC870];
  }
}

uint64_t sub_1B8F7DC20@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v5 = a1;
  unint64_t v7 = HIDWORD(a1);
  uint64_t v8 = *v3;
  sub_1B8F89C60();
  sub_1B8F89C80();
  sub_1B8F89C80();
  sub_1B8F89C90();
  uint64_t result = sub_1B8F89CA0();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  unint64_t v11 = result & ~v10;
  if ((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
  {
    uint64_t v12 = ~v10;
    while (1)
    {
      uint64_t v13 = *(void *)(v8 + 48) + 16 * v11;
      int v14 = *(_DWORD *)v13;
      int v15 = *(_DWORD *)(v13 + 4);
      uint64_t v16 = *(void *)(v13 + 8);
      BOOL v17 = v14 == v5 && v15 == v7;
      if (v17 && v16 == a2) {
        break;
      }
      unint64_t v11 = (v11 + 1) & v12;
      if (((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_11;
      }
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = *v3;
    uint64_t v23 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1B8F7E598();
      uint64_t v20 = v23;
    }
    uint64_t v21 = (void *)(*(void *)(v20 + 48) + 16 * v11);
    uint64_t v22 = v21[1];
    *(void *)a3 = *v21;
    *(void *)(a3 + 8) = v22;
    sub_1B8F7E9F4(v11);
    *uint64_t v3 = v23;
    uint64_t result = swift_bridgeObjectRelease();
    *(unsigned char *)(a3 + 16) = 0;
  }
  else
  {
LABEL_11:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(unsigned char *)(a3 + 16) = 1;
  }
  return result;
}

uint64_t sub_1B8F7DD88()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF7698);
  uint64_t result = sub_1B8F899A0();
  uint64_t v5 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v6 = 0;
    unint64_t v7 = (void *)(v2 + 56);
    uint64_t v8 = 1 << *(unsigned char *)(v2 + 32);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v2 + 56);
    int64_t v11 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = result + 56;
    while (1)
    {
      if (v10)
      {
        unint64_t v15 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v16 = v15 | (v6 << 6);
      }
      else
      {
        int64_t v17 = v6 + 1;
        if (__OFADD__(v6, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v11) {
          goto LABEL_33;
        }
        unint64_t v18 = v7[v17];
        ++v6;
        if (!v18)
        {
          int64_t v6 = v17 + 1;
          if (v17 + 1 >= v11) {
            goto LABEL_33;
          }
          unint64_t v18 = v7[v6];
          if (!v18)
          {
            int64_t v6 = v17 + 2;
            if (v17 + 2 >= v11) {
              goto LABEL_33;
            }
            unint64_t v18 = v7[v6];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v11)
              {
LABEL_33:
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v7 = -1 << v29;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v18 = v7[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v6 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_39;
                  }
                  if (v6 >= v11) {
                    goto LABEL_33;
                  }
                  unint64_t v18 = v7[v6];
                  ++v19;
                  if (v18) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v6 = v19;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v6 << 6);
      }
      uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * v16);
      *(void *)&long long v4 = *v20;
      long long v30 = v4;
      uint64_t v21 = v20[1];
      sub_1B8F89C60();
      sub_1B8F89C80();
      sub_1B8F89C80();
      sub_1B8F89C90();
      uint64_t result = sub_1B8F89CA0();
      uint64_t v22 = -1 << *(unsigned char *)(v5 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        unint64_t v13 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      int v14 = (void *)(*(void *)(v5 + 48) + 16 * v13);
      *((void *)&v4 + 1) = *((void *)&v30 + 1);
      *int v14 = v30;
      v14[1] = v21;
      ++*(void *)(v5 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v5;
  return result;
}

uint64_t sub_1B8F7E06C(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  unint64_t v7 = (unint64_t *)result;
  uint64_t v8 = *(void *)(a3 + 16);
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v9 = v8 - 1;
  uint64_t v10 = a3 + 56;
  while (2)
  {
    uint64_t v37 = v9;
    while (1)
    {
LABEL_4:
      int64_t v15 = a5[3];
      unint64_t v14 = a5[4];
      if (v14)
      {
        uint64_t v16 = (v14 - 1) & v14;
        unint64_t v17 = __clz(__rbit64(v14)) | (v15 << 6);
      }
      else
      {
        int64_t v18 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
          __break(1u);
          goto LABEL_41;
        }
        int64_t v19 = (unint64_t)(a5[2] + 64) >> 6;
        if (v18 >= v19)
        {
          int64_t v18 = a5[3];
LABEL_37:
          a5[3] = v18;
          a5[4] = 0;
          swift_retain();
          return sub_1B8F7E2F4(v7, a2, v37, a3);
        }
        uint64_t v20 = a5[1];
        unint64_t v21 = *(void *)(v20 + 8 * v18);
        if (!v21)
        {
          if (v15 + 2 >= v19) {
            goto LABEL_37;
          }
          unint64_t v21 = *(void *)(v20 + 8 * (v15 + 2));
          if (v21)
          {
            int64_t v18 = v15 + 2;
          }
          else
          {
            if (v15 + 3 >= v19)
            {
              int64_t v18 = v15 + 2;
              goto LABEL_37;
            }
            unint64_t v21 = *(void *)(v20 + 8 * (v15 + 3));
            if (v21)
            {
              int64_t v18 = v15 + 3;
            }
            else
            {
              int64_t v18 = v15 + 4;
              if (v15 + 4 >= v19)
              {
                int64_t v18 = v15 + 3;
                goto LABEL_37;
              }
              unint64_t v21 = *(void *)(v20 + 8 * v18);
              if (!v21)
              {
                int64_t v18 = v19 - 1;
                int64_t v22 = v15 + 5;
                while (v19 != v22)
                {
                  unint64_t v21 = *(void *)(v20 + 8 * v22++);
                  if (v21)
                  {
                    int64_t v18 = v22 - 1;
                    goto LABEL_21;
                  }
                }
                goto LABEL_37;
              }
            }
          }
        }
LABEL_21:
        uint64_t v16 = (v21 - 1) & v21;
        unint64_t v17 = __clz(__rbit64(v21)) + (v18 << 6);
        int64_t v15 = v18;
      }
      uint64_t v23 = *(void *)(*a5 + 48) + 16 * v17;
      int v24 = *(_DWORD *)v23;
      int v25 = *(_DWORD *)(v23 + 4);
      uint64_t v26 = *(void *)(v23 + 8);
      a5[3] = v15;
      a5[4] = v16;
      sub_1B8F89C60();
      sub_1B8F89C80();
      sub_1B8F89C80();
      sub_1B8F89C90();
      uint64_t result = sub_1B8F89CA0();
      uint64_t v27 = -1 << *(unsigned char *)(a3 + 32);
      unint64_t v28 = result & ~v27;
      if ((*(void *)(v10 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28))
      {
        uint64_t v29 = ~v27;
        while (1)
        {
          uint64_t v30 = *(void *)(a3 + 48) + 16 * v28;
          int v31 = *(_DWORD *)v30;
          int v32 = *(_DWORD *)(v30 + 4);
          uint64_t v33 = *(void *)(v30 + 8);
          BOOL v34 = v31 == v24 && v32 == v25;
          if (v34 && v33 == v26) {
            break;
          }
          unint64_t v28 = (v28 + 1) & v29;
          if (((*(void *)(v10 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28) & 1) == 0) {
            goto LABEL_4;
          }
        }
        uint64_t v11 = (v28 >> 3) & 0x1FFFFFFFFFFFFFF8;
        uint64_t v12 = 1 << v28;
        uint64_t v13 = *(unint64_t *)((char *)v7 + v11);
        *(unint64_t *)((char *)v7 + v11) = v13 & ~v12;
        if ((v13 & v12) != 0) {
          break;
        }
      }
    }
    uint64_t v9 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_41:
      __break(1u);
      return result;
    }
    if (v37 != 1) {
      continue;
    }
    return MEMORY[0x1E4FBC870];
  }
}

uint64_t sub_1B8F7E2F4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v10 = MEMORY[0x1E4FBC870];
LABEL_36:
    swift_release();
    return v10;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF7698);
  uint64_t result = sub_1B8F899B0();
  uint64_t v10 = result;
  int v31 = a1;
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
    unint64_t v17 = v31[v16];
    ++v12;
    if (!v17)
    {
      uint64_t v12 = v16 + 1;
      if (v16 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v17 = v31[v12];
      if (!v17)
      {
        uint64_t v12 = v16 + 2;
        if (v16 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v17 = v31[v12];
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    int64_t v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    *(void *)&long long v9 = *v19;
    long long v32 = v9;
    uint64_t v20 = v19[1];
    sub_1B8F89C60();
    sub_1B8F89C80();
    sub_1B8F89C80();
    sub_1B8F89C90();
    uint64_t result = sub_1B8F89CA0();
    uint64_t v21 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v13 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v13 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    uint64_t v29 = (void *)(*(void *)(v10 + 48) + 16 * v24);
    *((void *)&v9 + 1) = *((void *)&v32 + 1);
    *uint64_t v29 = v32;
    v29[1] = v20;
    ++*(void *)(v10 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v18 = v16 + 3;
  if (v18 >= a2) {
    goto LABEL_36;
  }
  unint64_t v17 = v31[v18];
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
    unint64_t v17 = v31[v12];
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

void *sub_1B8F7E598()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF7698);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B8F89990();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    int64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v19 = *v17;
    v19[1] = v18;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1B8F7E740()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF7698);
  uint64_t result = sub_1B8F899A0();
  uint64_t v5 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v5;
    return result;
  }
  int64_t v6 = 0;
  uint64_t v7 = v2 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(v2 + 32);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v2 + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v16 = v15 | (v6 << 6);
      goto LABEL_24;
    }
    int64_t v17 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v17 >= v11) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v7 + 8 * v17);
    ++v6;
    if (!v18)
    {
      int64_t v6 = v17 + 1;
      if (v17 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v18 = *(void *)(v7 + 8 * v6);
      if (!v18)
      {
        int64_t v6 = v17 + 2;
        if (v17 + 2 >= v11) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v7 + 8 * v6);
        if (!v18) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v6 << 6);
LABEL_24:
    int64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * v16);
    *(void *)&long long v4 = *v20;
    long long v29 = v4;
    uint64_t v21 = v20[1];
    sub_1B8F89C60();
    sub_1B8F89C80();
    sub_1B8F89C80();
    sub_1B8F89C90();
    uint64_t result = sub_1B8F89CA0();
    uint64_t v22 = -1 << *(unsigned char *)(v5 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v13 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    unint64_t v14 = (void *)(*(void *)(v5 + 48) + 16 * v13);
    *((void *)&v4 + 1) = *((void *)&v29 + 1);
    *unint64_t v14 = v29;
    v14[1] = v21;
    ++*(void *)(v5 + 16);
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v11)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v18 = *(void *)(v7 + 8 * v19);
  if (v18)
  {
    int64_t v6 = v19;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v6 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v6 >= v11) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v7 + 8 * v6);
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1B8F7E9F4(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_1B8F89980();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_1B8F89C60();
        sub_1B8F89C80();
        sub_1B8F89C80();
        sub_1B8F89C90();
        unint64_t v10 = sub_1B8F89CA0() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 < v9) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(v3 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v2);
          unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v12 >= v13 + 1))
          {
            *uint64_t v12 = *v13;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v14 = *(void *)(v3 + 16);
  BOOL v15 = __OFSUB__(v14, 1);
  uint64_t v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v16;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_1B8F7EBC8(unint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  int v7 = result;
  unint64_t v8 = HIDWORD(result);
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_18;
  }
  if (a4)
  {
    sub_1B8F7DD88();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (unint64_t)sub_1B8F7E598();
      goto LABEL_18;
    }
    sub_1B8F7E740();
  }
  uint64_t v11 = *v4;
  sub_1B8F89C60();
  sub_1B8F89C80();
  sub_1B8F89C80();
  sub_1B8F89C90();
  uint64_t result = sub_1B8F89CA0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v13 = ~v12;
    do
    {
      uint64_t v14 = *(void *)(v11 + 48) + 16 * a3;
      int v15 = *(_DWORD *)v14;
      int v16 = *(_DWORD *)(v14 + 4);
      uint64_t v17 = *(void *)(v14 + 8);
      BOOL v18 = v15 == v7 && v16 == v8;
      if (v18 && v17 == a2) {
        goto LABEL_21;
      }
      a3 = (a3 + 1) & v13;
    }
    while (((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_18:
  uint64_t v20 = *v4;
  *(void *)(*v4 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = *(void *)(v20 + 48) + 16 * a3;
  *(_DWORD *)uint64_t v21 = v7;
  *(_DWORD *)(v21 + 4) = v8;
  *(void *)(v21 + 8) = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (!v23)
  {
    *(void *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_21:
  uint64_t result = sub_1B8F89C00();
  __break(1u);
  return result;
}

uint64_t sub_1B8F7ED4C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_1B8F7F180();
  uint64_t result = sub_1B8F89870();
  uint64_t v6 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      sub_1B8F7D548((uint64_t)v5, *(v4 - 1), *v4);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v6;
  }
  return result;
}

uint64_t sub_1B8F7EDC4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7E50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_1B8F7EE24(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    int v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_1B8F89A90();
  __break(1u);
  return result;
}

uint64_t sub_1B8F7EF10(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for AssertionReconnectProperties() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_1B8F89A90();
  __break(1u);
  return result;
}

unint64_t sub_1B8F7F068(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF76A0);
    uint64_t v3 = (void *)sub_1B8F89A80();
    for (i = (uint64_t *)(a1 + 56); ; i += 4)
    {
      uint64_t v5 = *((unsigned int *)i - 6);
      uint64_t v6 = *((unsigned int *)i - 5);
      uint64_t v7 = *(i - 2);
      uint64_t v8 = *(i - 1);
      uint64_t v9 = *i;
      unint64_t result = sub_1B8F7CC10(v5 | (v6 << 32), v7);
      if (v11) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v12 = v3[6] + 16 * result;
      *(_DWORD *)uint64_t v12 = v5;
      *(_DWORD *)(v12 + 4) = v6;
      *(void *)(v12 + 8) = v7;
      uint64_t v13 = (void *)(v3[7] + 16 * result);
      *uint64_t v13 = v8;
      v13[1] = v9;
      uint64_t v14 = v3[2];
      BOOL v15 = __OFADD__(v14, 1);
      uint64_t v16 = v14 + 1;
      if (v15) {
        goto LABEL_10;
      }
      v3[2] = v16;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC868];
  }
  return result;
}

uint64_t sub_1B8F7F170(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_1B8F7F180()
{
  unint64_t result = qword_1EB9C7E20;
  if (!qword_1EB9C7E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C7E20);
  }
  return result;
}

uint64_t sub_1B8F7F1D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AssertionReconnectProperties();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B8F7F238(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for AttributeAssertionManager()
{
  return self;
}

uint64_t method lookup function for AttributeAssertionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AttributeAssertionManager);
}

uint64_t dispatch thunk of AttributeAssertionManager.acquire(assertion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of AttributeAssertionManager.invalidate(identifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t sub_1B8F7F34C()
{
  return swift_release();
}

uint64_t sub_1B8F7F354()
{
  return sub_1B8F72ABC();
}

uint64_t AssertionOptions.invalidateOnSessionRequest.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16SessionAssertion16AssertionOptions_invalidateOnSessionRequest);
}

id AssertionOptions.__allocating_init(invalidateOnSessionRequest:)(char a1)
{
  uint64_t v3 = objc_allocWithZone(v1);
  v3[OBJC_IVAR____TtC16SessionAssertion16AssertionOptions_invalidateOnSessionRequest] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id AssertionOptions.init(invalidateOnSessionRequest:)(char a1)
{
  v1[OBJC_IVAR____TtC16SessionAssertion16AssertionOptions_invalidateOnSessionRequest] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for AssertionOptions();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for AssertionOptions()
{
  return self;
}

id AssertionOptions.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void AssertionOptions.init()()
{
}

id AssertionOptions.__deallocating_deinit()
{
  return sub_1B8F80A38(type metadata accessor for AssertionOptions);
}

uint64_t sub_1B8F7F590()
{
  sub_1B8F899C0();
  sub_1B8F89750();
  swift_beginAccess();
  sub_1B8F89A20();
  sub_1B8F89750();
  uint64_t v1 = OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF74D0);
  sub_1B8F89720();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  uint64_t v2 = *(void *)(v0 + v1);
  if (v2)
  {
    objc_super v3 = *(os_unfair_lock_s **)(*(void *)(v2 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v3);
    os_unfair_lock_unlock(v3);
    swift_release();
  }
  sub_1B8F89720();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  uint64_t v4 = sub_1B8F7FDDC();
  MEMORY[0x1BA9D0C90](v4, MEMORY[0x1E4FBB1A0], v5, v6, v7);
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1B8F7F854@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_target;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 8);
  char v5 = *(unsigned char *)(v3 + 16);
  *(void *)a2 = *(void *)v3;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5;
  return sub_1B8F6CFA4();
}

uint64_t sub_1B8F7F8B4(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t v5 = *a2 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_target;
  swift_beginAccess();
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = v3;
  *(unsigned char *)(v5 + 16) = v4;
  sub_1B8F6CFA4();
  return sub_1B8F6D0A8();
}

uint64_t sub_1B8F7F94C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_target;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 8);
  char v5 = *(unsigned char *)(v3 + 16);
  *(void *)a1 = *(void *)v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return sub_1B8F6CFA4();
}

uint64_t sub_1B8F7F9A8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t v5 = v1 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_target;
  swift_beginAccess();
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = v3;
  *(unsigned char *)(v5 + 16) = v4;
  return sub_1B8F6D0A8();
}

uint64_t (*sub_1B8F7FA18())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B8F7FAF0()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_explanation);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1B8F7FBB4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_explanation);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B8F7FC14(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  char v4 = (void *)(*a2 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_explanation);
  swift_beginAccess();
  *char v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B8F7FC80())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B8F7FCDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion);
  if (v3)
  {
    char v4 = *(os_unfair_lock_s **)(*(void *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v4);
    uint64_t v5 = *(void *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
    char v6 = *(unsigned char *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
    os_unfair_lock_unlock(v4);
    uint64_t result = swift_release();
  }
  else
  {
    uint64_t v5 = 0;
    char v6 = 1;
  }
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v6;
  return result;
}

uint64_t sub_1B8F7FDDC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v3 = *(os_unfair_lock_s **)(*(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v3);
    uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_invalidationState);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v3);
    if (v4)
    {
      int64_t v5 = *(void *)(v4 + 16);
      if (v5)
      {
        swift_bridgeObjectRetain();
        sub_1B8F80AEC(0, v5, 0);
        char v6 = (uint64_t *)(v4 + 40);
        do
        {
          uint64_t v8 = *(v6 - 1);
          uint64_t v7 = *v6;
          unint64_t v9 = *(void *)(v2 + 16);
          unint64_t v10 = *(void *)(v2 + 24);
          swift_bridgeObjectRetain();
          if (v9 >= v10 >> 1) {
            sub_1B8F80AEC(v10 > 1, v9 + 1, 1);
          }
          v6 += 2;
          *(void *)(v2 + 16) = v9 + 1;
          uint64_t v11 = v2 + 16 * v9;
          *(void *)(v11 + 32) = v8;
          *(void *)(v11 + 40) = v7;
          --v5;
        }
        while (v5);
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    swift_release();
  }
  return v2;
}

char *SessionRequestAssertion.__allocating_init(explanation:target:invalidateOnSessionRequest:invalidationHandler:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  id v13 = objc_allocWithZone(v6);
  return SessionRequestAssertion.init(explanation:target:invalidateOnSessionRequest:invalidationHandler:)(a1, a2, a3, a4, a5, a6);
}

char *SessionRequestAssertion.init(explanation:target:invalidateOnSessionRequest:invalidationHandler:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v33 = a5;
  uint64_t v34 = a6;
  id v32 = a3;
  uint64_t v11 = type metadata accessor for AssertionAttribute();
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v32 - v15;
  *(void *)&v6[OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion] = 0;
  uint64_t v17 = &v6[OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_invalidationHandler];
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0;
  BOOL v18 = v6;
  id v19 = objc_msgSend(a3, sel_bundleIdentifier);
  uint64_t v20 = sub_1B8F89710();
  uint64_t v22 = v21;

  BOOL v23 = &v18[OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_target];
  *(void *)BOOL v23 = v20;
  *((void *)v23 + 1) = v22;
  v23[16] = 0;
  uint64_t v24 = (uint64_t *)&v18[OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_explanation];
  *uint64_t v24 = a1;
  v24[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  char v25 = (objc_class *)type metadata accessor for SessionRequestAssertion();
  v37.receiver = v18;
  v37.super_class = v25;
  id v26 = objc_msgSendSuper2(&v37, sel_init);
  *uint64_t v16 = a4;
  swift_storeEnumTagMultiPayload();
  v35[0] = v20;
  v35[1] = v22;
  char v36 = 0;
  sub_1B8F6EF50((uint64_t)v16, (uint64_t)v14);
  BOOL v27 = (void *)swift_allocObject();
  uint64_t v28 = v34;
  v27[2] = v33;
  v27[3] = v28;
  v27[4] = v26;
  type metadata accessor for AttributeAssertion();
  swift_allocObject();
  long long v29 = (char *)v26;
  uint64_t v30 = sub_1B8F82540(a1, a2, v35, (uint64_t)v14, 0x403E000000000000, 0, (uint64_t)sub_1B8F6EFFC, (uint64_t)v27);

  swift_release();
  sub_1B8F6D41C((uint64_t)v16);
  *(void *)&v29[OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion] = v30;
  swift_release();
  return v29;
}

id SessionRequestAssertion.__allocating_init(explanation:target:options:invalidationHandler:)(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  id v13 = objc_allocWithZone(v6);
  return SessionRequestAssertion.init(explanation:target:options:invalidationHandler:)(a1, a2, a3, a4, a5, a6);
}

id SessionRequestAssertion.init(explanation:target:options:invalidationHandler:)(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v12 = (void *)sub_1B8F89700();
  swift_bridgeObjectRelease();
  uint64_t v13 = a4[OBJC_IVAR____TtC16SessionAssertion16AssertionOptions_invalidateOnSessionRequest];
  if (a5)
  {
    v17[4] = a5;
    v17[5] = a6;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 1107296256;
    _OWORD v17[2] = sub_1B8F80450;
    v17[3] = &block_descriptor_0;
    uint64_t v14 = _Block_copy(v17);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = objc_msgSend(v7, sel_initWithExplanation_target_invalidateOnSessionRequest_invalidationHandler_, v12, a3, v13, v14);
  sub_1B8F6F3B8(a5);

  _Block_release(v14);
  return v15;
}

void sub_1B8F80450(uint64_t a1, void *a2, void *a3)
{
  int64_t v5 = *(void (**)(id, id))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, v6);
  swift_release();
}

uint64_t sub_1B8F80598()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion))
  {
    swift_retain();
    sub_1B8F821F4();
    return swift_release();
  }
  return result;
}

uint64_t sub_1B8F80688()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  unint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  char v4 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if (v4) {
    return 0;
  }
  if (v3 < 8) {
    return qword_1B8F8BE20[v3];
  }
  uint64_t result = sub_1B8F89BF0();
  __break(1u);
  return result;
}

uint64_t sub_1B8F80788()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_attributeAssertion);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  int v4 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v2);
  swift_release();
  if (v4 == 1) {
    return v3 != 0;
  }
  else {
    return 2;
  }
}

id sub_1B8F80904()
{
  swift_beginAccess();
  id v0 = objc_allocWithZone((Class)SNAAssertionTarget);
  sub_1B8F6CFA4();
  uint64_t v1 = (void *)sub_1B8F89700();
  sub_1B8F6D0A8();
  id v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_, v1);

  return v2;
}

void SessionRequestAssertion.init()()
{
}

id SessionRequestAssertion.__deallocating_deinit()
{
  return sub_1B8F80A38(type metadata accessor for SessionRequestAssertion);
}

id sub_1B8F80A38(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1B8F80AEC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B8F80B78(a1, a2, a3, *v3);
  *objc_super v3 = (char *)result;
  return result;
}

uint64_t type metadata accessor for SessionRequestAssertion()
{
  return self;
}

uint64_t sub_1B8F80B30()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B8F80B78(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF76D0);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1B8F89A90();
  __break(1u);
  return result;
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

uint64_t sub_1B8F80D04@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR____TtC16SessionAssertion23SessionRequestAssertion_explanation);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for AssertionOptions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AssertionOptions);
}

uint64_t dispatch thunk of AssertionOptions.__allocating_init(invalidateOnSessionRequest:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for SessionRequestAssertion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SessionRequestAssertion);
}

uint64_t dispatch thunk of SessionRequestAssertion.target.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SessionRequestAssertion.target.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SessionRequestAssertion.target.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of SessionRequestAssertion.explanation.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SessionRequestAssertion.explanation.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of SessionRequestAssertion.explanation.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SessionRequestAssertion.state.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SessionRequestAssertion.sessionIdentifiers.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SessionRequestAssertion.__allocating_init(explanation:target:invalidateOnSessionRequest:invalidationHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of SessionRequestAssertion.invalidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of SessionRequestAssertion.snaInvalidationReason.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of SessionRequestAssertion.snaState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of SessionRequestAssertion.snaTarget.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))();
}

uint64_t sub_1B8F81030()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t AttributeAssertion.__allocating_init(explanation:target:attribute:duration:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  char v15 = a6 & 1;
  swift_allocObject();
  uint64_t v16 = sub_1B8F82540(a1, a2, a3, a4, a5, v15, a7, a8);
  sub_1B8F6F3B8(a7);
  return v16;
}

uint64_t Target.identifier.getter()
{
  uint64_t v1 = *v0;
  sub_1B8F6CFA4();
  return v1;
}

uint64_t sub_1B8F8115C(uint64_t a1)
{
  unint64_t v2 = sub_1B8F82764();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F81198(uint64_t a1)
{
  unint64_t v2 = sub_1B8F82764();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1B8F811D4(uint64_t a1)
{
  unint64_t v2 = sub_1B8F827B8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F81210(uint64_t a1)
{
  unint64_t v2 = sub_1B8F827B8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1B8F8124C()
{
  if (*v0) {
    return 0x7974697669746361;
  }
  else {
    return 7368801;
  }
}

uint64_t sub_1B8F81280@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1B8F831B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B8F812A8(uint64_t a1)
{
  unint64_t v2 = sub_1B8F82710();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F812E4(uint64_t a1)
{
  unint64_t v2 = sub_1B8F82710();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t Target.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C82A8);
  uint64_t v20 = *(void *)(v3 - 8);
  uint64_t v21 = v3;
  MEMORY[0x1F4188790](v3);
  int64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C82A0);
  uint64_t v18 = *(void *)(v6 - 8);
  uint64_t v19 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C8298);
  uint64_t v9 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  int64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v1;
  uint64_t v22 = v1[1];
  uint64_t v23 = v12;
  char v13 = *((unsigned char *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F82710();
  sub_1B8F89CC0();
  if (v13)
  {
    char v26 = 1;
    sub_1B8F82764();
    uint64_t v14 = v24;
    sub_1B8F89B50();
    uint64_t v15 = v21;
    sub_1B8F89B80();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v15);
  }
  else
  {
    char v25 = 0;
    sub_1B8F827B8();
    uint64_t v14 = v24;
    sub_1B8F89B50();
    uint64_t v16 = v19;
    sub_1B8F89B80();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v16);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v14);
}

uint64_t Target.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  char v36 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7FB0);
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  MEMORY[0x1F4188790](v3);
  int64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7FA8);
  uint64_t v37 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7FA0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  int64_t v40 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_1B8F82710();
  uint64_t v14 = v41;
  sub_1B8F89CB0();
  if (v14) {
    goto LABEL_6;
  }
  uint64_t v35 = v6;
  uint64_t v15 = v39;
  uint64_t v41 = v10;
  uint64_t v16 = v12;
  uint64_t v17 = sub_1B8F89B40();
  if (*(void *)(v17 + 16) != 1)
  {
    uint64_t v19 = sub_1B8F89A00();
    swift_allocError();
    uint64_t v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF75A0);
    *uint64_t v21 = &type metadata for Target;
    sub_1B8F89AC0();
    sub_1B8F899F0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, *MEMORY[0x1E4FBBA70], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v16, v9);
LABEL_6:
    uint64_t v22 = (uint64_t)v40;
    return __swift_destroy_boxed_opaque_existential_1(v22);
  }
  uint64_t v34 = v17;
  char v18 = *(unsigned char *)(v17 + 32);
  if (v18)
  {
    char v43 = 1;
    sub_1B8F82764();
    sub_1B8F89AB0();
    uint64_t v26 = sub_1B8F89AF0();
    uint64_t v28 = v27;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v15);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v16, v9);
  }
  else
  {
    char v42 = 0;
    sub_1B8F827B8();
    uint64_t v24 = v8;
    char v25 = v16;
    sub_1B8F89AB0();
    uint64_t v29 = v35;
    uint64_t v30 = sub_1B8F89AF0();
    uint64_t v28 = v31;
    id v32 = v24;
    uint64_t v26 = v30;
    (*(void (**)(char *, uint64_t))(v37 + 8))(v32, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v25, v9);
  }
  uint64_t v22 = (uint64_t)v40;
  uint64_t v33 = v36;
  uint64_t *v36 = v26;
  v33[1] = v28;
  *((unsigned char *)v33 + 16) = v18;
  return __swift_destroy_boxed_opaque_existential_1(v22);
}

uint64_t sub_1B8F81AA8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return Target.init(from:)(a1, a2);
}

uint64_t sub_1B8F81AC0(void *a1)
{
  return Target.encode(to:)(a1);
}

uint64_t sub_1B8F81AD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for AssertionAttribute();
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v10 = 0;
  *((void *)&v10 + 1) = 0xE000000000000000;
  sub_1B8F899C0();
  long long v12 = v10;
  sub_1B8F89750();
  char v5 = *(unsigned char *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16);
  long long v10 = *(_OWORD *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier);
  char v11 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF74D0);
  sub_1B8F89720();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  swift_bridgeObjectRetain();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  uint64_t v6 = *(os_unfair_lock_s **)(*(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  os_unfair_lock_lock(v6);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  char v8 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  os_unfair_lock_unlock(v6);
  *(void *)&long long v10 = v7;
  BYTE8(v10) = v8;
  sub_1B8F89720();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  sub_1B8F6EF50(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_attribute, (uint64_t)v4);
  sub_1B8F89720();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t AttributeAssertion.target.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  char v3 = *(unsigned char *)(v1 + 32);
  *(void *)a1 = *(void *)(v1 + 16);
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3;
  return sub_1B8F6CFA4();
}

uint64_t AttributeAssertion.explanation.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AttributeAssertion.duration.getter()
{
  return *(void *)(v0 + 56);
}

void sub_1B8F81D48(uint64_t a1@<X8>)
{
  char v3 = *(os_unfair_lock_s **)(*(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  os_unfair_lock_lock(v3);
  char v4 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8);
  *(void *)a1 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  *(unsigned char *)(a1 + 8) = v4;

  os_unfair_lock_unlock(v3);
}

void sub_1B8F81DB8(void *a1@<X8>)
{
  char v3 = *(os_unfair_lock_s **)(*(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  os_unfair_lock_lock(v3);
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_invalidationState);
  swift_bridgeObjectRetain();

  os_unfair_lock_unlock(v3);
}

uint64_t AttributeAssertion.init(explanation:target:attribute:duration:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = sub_1B8F82540(a1, a2, a3, a4, a5, a6 & 1, a7, a8);
  sub_1B8F6F3B8(a7);
  return v9;
}

uint64_t AttributeAssertion.deinit()
{
  uint64_t v1 = type metadata accessor for AssertionAttribute();
  MEMORY[0x1F4188790](v1);
  char v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_attribute;
  sub_1B8F6EF50(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_attribute, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload() == 1
    || ((sub_1B8F6D41C((uint64_t)v3),
         char v5 = *(os_unfair_lock_s **)(*(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16),
         os_unfair_lock_lock(v5),
         uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state),
         int v7 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8),
         os_unfair_lock_unlock(v5),
         v7 == 1)
      ? (BOOL v8 = v6 == 0)
      : (BOOL v8 = 1),
        v8))
  {
    sub_1B8F6D0A8();
    swift_bridgeObjectRelease();
    uint64_t v9 = v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_acquisitionDate;
    uint64_t v10 = sub_1B8F895D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    sub_1B8F6D41C(v4);
    sub_1B8F6F3B8(*(void *)(v0 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler));
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return v0;
  }
  else
  {
    uint64_t result = sub_1B8F89A40();
    __break(1u);
  }
  return result;
}

uint64_t AttributeAssertion.__deallocating_deinit()
{
  AttributeAssertion.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1B8F820A8()
{
  return sub_1B8F8220C((void (*)(uint64_t, void *))sub_1B8F820C0);
}

uint64_t sub_1B8F820C0(uint64_t result, uint64_t *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = (void *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state);
  if (*(unsigned char *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8) == 1)
  {
    if (*v4) {
      return result;
    }
    swift_retain();
    sub_1B8F7A6C0(v3);
    uint64_t result = swift_release();
    char v11 = v4 + 1;
    *uint64_t v4 = 1;
  }
  else
  {
    char v5 = (uint64_t *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
    uint64_t v6 = *(void *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
    uint64_t v7 = *(void *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler + 8);
    uint64_t v8 = *a2;
    *a2 = v6;
    a2[1] = v7;
    sub_1B8F7F170(v6);
    sub_1B8F6F3B8(v8);
    uint64_t v9 = *v5;
    *char v5 = 0;
    v5[1] = 0;
    uint64_t result = sub_1B8F6F3B8(v9);
    uint64_t v10 = (void *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier);
    char v11 = (unsigned char *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16);
    void *v10 = 0;
    v10[1] = 0;
  }
  unsigned char *v11 = 1;
  return result;
}

uint64_t sub_1B8F821F4()
{
  return sub_1B8F8220C((void (*)(uint64_t, void *))sub_1B8F822F0);
}

uint64_t sub_1B8F8220C(void (*a1)(uint64_t, void *))
{
  v9[0] = 0;
  v9[1] = 0;
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)(v1 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock) + 16);
  os_unfair_lock_lock(v3);
  a1(v1, v9);
  os_unfair_lock_unlock(v3);
  uint64_t v4 = (void (*)(uint64_t, void *))v9[0];
  if (v9[0])
  {
    sub_1B8F747D4();
    char v5 = (void *)swift_allocError();
    unsigned char *v6 = 0;
    swift_retain();
    v4(v1, v5);

    sub_1B8F6F3B8((uint64_t)v4);
    uint64_t v7 = v9[0];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return sub_1B8F6F3B8(v7);
}

uint64_t sub_1B8F822F0(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state;
  if (*(unsigned char *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8) == 1)
  {
    uint64_t v3 = result;
    *(void *)uint64_t v2 = 4;
    *(unsigned char *)(v2 + 8) = 0;
    uint64_t v4 = result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier;
    if (*(unsigned char *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16))
    {
      __break(1u);
    }
    else
    {
      uint64_t v6 = *(void *)(v4 + 8);
      uint64_t v7 = HIDWORD(*(void *)v4);
      v13[0] = *(void *)v4;
      v13[1] = v7;
      uint64_t v14 = v6;
      swift_retain();
      sub_1B8F7A95C(v13);
      swift_release();
      uint64_t v8 = (uint64_t *)(v3 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
      uint64_t v9 = *v8;
      uint64_t v10 = v8[1];
      uint64_t v11 = *a2;
      *a2 = *v8;
      a2[1] = v10;
      sub_1B8F7F170(v9);
      sub_1B8F6F3B8(v11);
      uint64_t v12 = *v8;
      uint64_t *v8 = 0;
      v8[1] = 0;
      uint64_t result = sub_1B8F6F3B8(v12);
      *(void *)uint64_t v4 = 0;
      *(void *)(v4 + 8) = 0;
      *(unsigned char *)(v4 + 16) = 1;
    }
  }
  return result;
}

uint64_t sub_1B8F82428(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4 = result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state;
  if (*(unsigned char *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state + 8) == 1)
  {
    uint64_t v6 = result;
    *(void *)uint64_t v4 = a2;
    *(unsigned char *)(v4 + 8) = 0;
    *(void *)(result + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_invalidationState) = a3;
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v7 = v6 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier;
    if (*(unsigned char *)(v6 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier + 16))
    {
      __break(1u);
    }
    else
    {
      uint64_t v8 = *(void *)(v7 + 8);
      uint64_t v9 = HIDWORD(*(void *)v7);
      v15[0] = *(void *)v7;
      v15[1] = v9;
      uint64_t v16 = v8;
      swift_retain();
      sub_1B8F7A95C(v15);
      swift_release();
      uint64_t v10 = (uint64_t *)(v6 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
      uint64_t v11 = *v10;
      uint64_t v12 = v10[1];
      uint64_t v13 = *a4;
      *a4 = *v10;
      a4[1] = v12;
      sub_1B8F7F170(v11);
      sub_1B8F6F3B8(v13);
      uint64_t v14 = *v10;
      uint64_t *v10 = 0;
      v10[1] = 0;
      uint64_t result = sub_1B8F6F3B8(v14);
      *(void *)uint64_t v7 = 0;
      *(void *)(v7 + 8) = 0;
      *(unsigned char *)(v7 + 16) = 1;
    }
  }
  return result;
}

uint64_t sub_1B8F82540(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = *a3;
  uint64_t v13 = a3[1];
  char v15 = *((unsigned char *)a3 + 16);
  sub_1B8F895C0();
  uint64_t v16 = v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_identifier;
  *(void *)uint64_t v16 = 0;
  *(void *)(v16 + 8) = 0;
  *(unsigned char *)(v16 + 16) = 1;
  uint64_t v17 = (void *)(v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
  *uint64_t v17 = 0;
  v17[1] = 0;
  uint64_t v18 = OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_lock;
  type metadata accessor for UnfairLock();
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = (_DWORD *)swift_slowAlloc();
  *(void *)(v19 + 16) = v20;
  *(void *)(v8 + v18) = v19;
  *uint64_t v20 = 0;
  uint64_t v21 = OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_manager;
  if (qword_1EB9C7D80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *(void *)(v8 + v21) = qword_1EB9C7E18;
  *(void *)(v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_invalidationState) = 0;
  *(void *)(v8 + 16) = v14;
  *(void *)(v8 + 24) = v13;
  *(unsigned char *)(v8 + 32) = v15;
  sub_1B8F6EF50(a4, v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_attribute);
  *(void *)(v8 + 40) = a1;
  *(void *)(v8 + 48) = a2;
  *(void *)(v8 + 56) = a5;
  *(unsigned char *)(v8 + 64) = a6 & 1;
  uint64_t v22 = (uint64_t *)(v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
  uint64_t v23 = *(void *)(v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion_invalidationHandler);
  *uint64_t v22 = a7;
  v22[1] = a8;
  swift_retain();
  sub_1B8F7F170(a7);
  sub_1B8F6F3B8(v23);
  uint64_t v24 = v8 + OBJC_IVAR____TtC16SessionAssertion18AttributeAssertion__lock_state;
  *(void *)uint64_t v24 = 0;
  *(unsigned char *)(v24 + 8) = 1;
  sub_1B8F820A8();
  sub_1B8F6D41C(a4);
  return v8;
}

unint64_t sub_1B8F82710()
{
  unint64_t result = qword_1EB9C8210;
  if (!qword_1EB9C8210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8210);
  }
  return result;
}

unint64_t sub_1B8F82764()
{
  unint64_t result = qword_1EB9C8238;
  if (!qword_1EB9C8238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8238);
  }
  return result;
}

unint64_t sub_1B8F827B8()
{
  unint64_t result = qword_1E9EF76D8;
  if (!qword_1E9EF76D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF76D8);
  }
  return result;
}

uint64_t destroy for Target()
{
  return sub_1B8F6D0A8();
}

uint64_t _s16SessionAssertion6TargetOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1B8F6CFA4();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Target(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1B8F6CFA4();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_1B8F6D0A8();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Target(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_1B8F6D0A8();
  return a1;
}

uint64_t getEnumTagSinglePayload for Target(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Target(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1B8F829AC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1B8F829B4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Target()
{
  return &type metadata for Target;
}

uint64_t sub_1B8F829D0()
{
  return type metadata accessor for AttributeAssertion();
}

uint64_t type metadata accessor for AttributeAssertion()
{
  uint64_t result = qword_1EB9C7E08;
  if (!qword_1EB9C7E08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B8F82A24()
{
  uint64_t result = sub_1B8F895D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for AssertionAttribute();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t method lookup function for AttributeAssertion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AttributeAssertion);
}

uint64_t dispatch thunk of AttributeAssertion.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of AttributeAssertion.state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of AttributeAssertion.invalidationState.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of AttributeAssertion.__allocating_init(explanation:target:attribute:duration:invalidationHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6 + 312))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of AttributeAssertion.invalidate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for AttributeAssertion.State(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AttributeAssertion.State(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_1B8F82C68(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B8F82C84(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributeAssertion.State()
{
  return &type metadata for AttributeAssertion.State;
}

unsigned char *storeEnumTagSinglePayload for Target.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B8F82D80);
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

ValueMetadata *type metadata accessor for Target.CodingKeys()
{
  return &type metadata for Target.CodingKeys;
}

ValueMetadata *type metadata accessor for Target.AppCodingKeys()
{
  return &type metadata for Target.AppCodingKeys;
}

unsigned char *_s16SessionAssertion6TargetO13AppCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1B8F82E68);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Target.ActivityCodingKeys()
{
  return &type metadata for Target.ActivityCodingKeys;
}

unint64_t sub_1B8F82EA4()
{
  unint64_t result = qword_1E9EF76E0;
  if (!qword_1E9EF76E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF76E0);
  }
  return result;
}

unint64_t sub_1B8F82EFC()
{
  unint64_t result = qword_1E9EF76E8;
  if (!qword_1E9EF76E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF76E8);
  }
  return result;
}

unint64_t sub_1B8F82F54()
{
  unint64_t result = qword_1E9EF76F0;
  if (!qword_1E9EF76F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF76F0);
  }
  return result;
}

unint64_t sub_1B8F82FAC()
{
  unint64_t result = qword_1EB9C8230;
  if (!qword_1EB9C8230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8230);
  }
  return result;
}

unint64_t sub_1B8F83004()
{
  unint64_t result = qword_1EB9C8228;
  if (!qword_1EB9C8228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8228);
  }
  return result;
}

unint64_t sub_1B8F8305C()
{
  unint64_t result = qword_1EB9C8248;
  if (!qword_1EB9C8248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8248);
  }
  return result;
}

unint64_t sub_1B8F830B4()
{
  unint64_t result = qword_1EB9C8240;
  if (!qword_1EB9C8240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8240);
  }
  return result;
}

unint64_t sub_1B8F8310C()
{
  unint64_t result = qword_1EB9C8220;
  if (!qword_1EB9C8220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8220);
  }
  return result;
}

unint64_t sub_1B8F83164()
{
  unint64_t result = qword_1EB9C8218;
  if (!qword_1EB9C8218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8218);
  }
  return result;
}

uint64_t sub_1B8F831B8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7368801 && a2 == 0xE300000000000000;
  if (v2 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7974697669746361 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1B8F89BE0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1B8F8329C(uint64_t a1, uint64_t a2)
{
  sub_1B8F89540();
  swift_allocObject();
  sub_1B8F89530();
  uint64_t v3 = sub_1B8F895B0();
  unint64_t v5 = v4;
  sub_1B8F6BFE0();
  sub_1B8F89520();
  swift_release();
  sub_1B8F6C7BC(v3, v5);
  uint64_t result = 1;
  *(_OWORD *)a2 = v7;
  *(unsigned char *)(a2 + 16) = 0;
  return result;
}

uint64_t sub_1B8F83384@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    sub_1B8F89540();
    swift_allocObject();
    sub_1B8F89530();
    uint64_t v3 = sub_1B8F895B0();
    unint64_t v5 = v4;
    sub_1B8F6BFE0();
    sub_1B8F89520();
    sub_1B8F6C7BC(v3, v5);
    uint64_t result = swift_release();
    *(_DWORD *)a2 = v7;
    *(_DWORD *)(a2 + 4) = v8;
    *(void *)(a2 + 8) = v9;
  }
  else
  {
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

_DWORD *sub_1B8F8346C()
{
  type metadata accessor for UnfairLock();
  uint64_t v0 = swift_allocObject();
  uint64_t result = (_DWORD *)swift_slowAlloc();
  *(void *)(v0 + 16) = result;
  *uint64_t result = 0;
  off_1EB9C7F20 = (_UNKNOWN *)v0;
  return result;
}

void static AssertionIdentifier.nextCount.getter()
{
  if (qword_1EB9C7DE8 != -1) {
    swift_once();
  }
  uint64_t v0 = (os_unfair_lock_s *)*((void *)off_1EB9C7F20 + 2);
  os_unfair_lock_lock(v0);
  if (__OFADD__(qword_1EB9C7DF0, 1))
  {
    __break(1u);
  }
  else
  {
    ++qword_1EB9C7DF0;
    os_unfair_lock_unlock(v0);
  }
}

uint64_t AssertionIdentifier.serverPid.getter()
{
  return *v0;
}

uint64_t AssertionIdentifier.clientPid.getter()
{
  return *(unsigned int *)(v0 + 4);
}

uint64_t AssertionIdentifier.count.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t AssertionIdentifier.init(serverPid:clientPid:count:)@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_DWORD *)a4 = result;
  *(_DWORD *)(a4 + 4) = a2;
  *(void *)(a4 + 8) = a3;
  return result;
}

uint64_t AssertionIdentifier.hash(into:)()
{
  return sub_1B8F89C90();
}

BOOL static AssertionIdentifier.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2
      && *(_DWORD *)(a1 + 4) == *(_DWORD *)(a2 + 4)
      && *(void *)(a1 + 8) == *(void *)(a2 + 8);
}

uint64_t sub_1B8F835DC()
{
  uint64_t v1 = 0x6950746E65696C63;
  if (*v0 != 1) {
    uint64_t v1 = 0x746E756F63;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6950726576726573;
  }
}

uint64_t sub_1B8F83634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1B8F85308(a1, a2);
  *a3 = result;
  return result;
}

void sub_1B8F8365C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1B8F83668(uint64_t a1)
{
  unint64_t v2 = sub_1B8F83880();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F836A4(uint64_t a1)
{
  unint64_t v2 = sub_1B8F83880();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AssertionIdentifier.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C8268);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  int v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v10 = *(_DWORD *)(v1 + 4);
  v9[1] = *(void *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F83880();
  sub_1B8F89CC0();
  char v13 = 0;
  sub_1B8F89BB0();
  if (!v2)
  {
    char v12 = 1;
    sub_1B8F89BB0();
    char v11 = 2;
    sub_1B8F89BC0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1B8F83880()
{
  unint64_t result = qword_1EB9C80F0;
  if (!qword_1EB9C80F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C80F0);
  }
  return result;
}

uint64_t AssertionIdentifier.hashValue.getter()
{
  return sub_1B8F89CA0();
}

uint64_t AssertionIdentifier.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C8260);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  int v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F83880();
  sub_1B8F89CB0();
  if (!v2)
  {
    char v16 = 0;
    int v9 = sub_1B8F89B20();
    char v15 = 1;
    int v11 = sub_1B8F89B20();
    char v14 = 2;
    uint64_t v12 = sub_1B8F89B30();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_DWORD *)a2 = v9;
    *(_DWORD *)(a2 + 4) = v11;
    *(void *)(a2 + 8) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B8F83B08@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AssertionIdentifier.init(from:)(a1, a2);
}

uint64_t sub_1B8F83B20(void *a1)
{
  return AssertionIdentifier.encode(to:)(a1);
}

uint64_t sub_1B8F83B38()
{
  return sub_1B8F89CA0();
}

uint64_t sub_1B8F83BA4()
{
  return sub_1B8F89C90();
}

uint64_t sub_1B8F83BEC()
{
  return sub_1B8F89CA0();
}

BOOL sub_1B8F83C54(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2
      && *(_DWORD *)(a1 + 4) == *(_DWORD *)(a2 + 4)
      && *(void *)(a1 + 8) == *(void *)(a2 + 8);
}

uint64_t AssertionIdentifier.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  sub_1B8F84628();
  uint64_t v4 = (void *)sub_1B8F89950();
  uint64_t result = swift_bridgeObjectRelease();
  if (v4[2] != 3) {
    goto LABEL_55;
  }
  uint64_t v6 = v4[4];
  unint64_t v7 = v4[5];
  uint64_t v8 = HIBYTE(v7) & 0xF;
  uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  if (!((v7 & 0x2000000000000000) != 0 ? HIBYTE(v7) & 0xF : v6 & 0xFFFFFFFFFFFFLL)) {
    goto LABEL_55;
  }
  if ((v7 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = (uint64_t)sub_1B8F8467C(v6, v7, 10);
    LOBYTE(v6) = v33;
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  if ((v7 & 0x2000000000000000) == 0)
  {
    if ((v6 & 0x1000000000000000) != 0) {
      int v11 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      int v11 = (unsigned __int8 *)sub_1B8F89A10();
    }
    uint64_t result = (uint64_t)sub_1B8F84BA0(v11, v9, 10);
    uint64_t v12 = result;
    LOBYTE(v6) = v13 & 1;
    goto LABEL_45;
  }
  uint64_t v34 = v4[4];
  uint64_t v35 = v7 & 0xFFFFFFFFFFFFFFLL;
  if (v6 == 43)
  {
    if (!v8)
    {
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if (v8 == 1 || (BYTE1(v6) - 48) > 9u) {
      goto LABEL_32;
    }
    uint64_t v12 = (BYTE1(v6) - 48);
    if (v8 != 2)
    {
      if ((BYTE2(v6) - 48) > 9u) {
        goto LABEL_32;
      }
      uint64_t v12 = 10 * (BYTE1(v6) - 48) + (BYTE2(v6) - 48);
      uint64_t v14 = v8 - 3;
      if (v8 != 3)
      {
        char v15 = (unsigned __int8 *)&v34 + 3;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_32;
          }
          uint64_t v17 = 10 * v12;
          if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63) {
            goto LABEL_32;
          }
          uint64_t v12 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_32;
          }
          LOBYTE(v6) = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_45;
          }
        }
      }
    }
LABEL_44:
    LOBYTE(v6) = 0;
    goto LABEL_45;
  }
  if (v6 != 45)
  {
    if (!v8 || (v6 - 48) > 9u) {
      goto LABEL_32;
    }
    uint64_t v12 = (v6 - 48);
    if (v8 != 1)
    {
      if ((BYTE1(v6) - 48) > 9u) {
        goto LABEL_32;
      }
      uint64_t v12 = 10 * (v6 - 48) + (BYTE1(v6) - 48);
      uint64_t v18 = v8 - 2;
      if (v8 != 2)
      {
        uint64_t v19 = (unsigned __int8 *)&v34 + 2;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_32;
          }
          uint64_t v21 = 10 * v12;
          if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63) {
            goto LABEL_32;
          }
          uint64_t v12 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_32;
          }
          LOBYTE(v6) = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_45;
          }
        }
      }
    }
    goto LABEL_44;
  }
  if (!v8)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (v8 == 1 || (BYTE1(v6) - 48) > 9u) {
    goto LABEL_32;
  }
  if (v8 != 2)
  {
    if ((BYTE2(v6) - 48) <= 9u)
    {
      uint64_t v12 = -10 * (BYTE1(v6) - 48) - (BYTE2(v6) - 48);
      uint64_t v22 = v8 - 3;
      if (v8 == 3) {
        goto LABEL_44;
      }
      uint64_t v30 = (unsigned __int8 *)&v34 + 3;
      while (1)
      {
        unsigned int v31 = *v30 - 48;
        if (v31 > 9) {
          break;
        }
        uint64_t v32 = 10 * v12;
        if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63) {
          break;
        }
        uint64_t v12 = v32 - v31;
        if (__OFSUB__(v32, v31)) {
          break;
        }
        LOBYTE(v6) = 0;
        ++v30;
        if (!--v22) {
          goto LABEL_45;
        }
      }
    }
LABEL_32:
    uint64_t v12 = 0;
    LOBYTE(v6) = 1;
    goto LABEL_45;
  }
  LOBYTE(v6) = 0;
  uint64_t v12 = -(uint64_t)(BYTE1(v6) - 48);
LABEL_45:
  if (v6) {
    goto LABEL_55;
  }
  if (v4[2] < 2uLL)
  {
    __break(1u);
    goto LABEL_66;
  }
  uint64_t v23 = v4[6];
  unint64_t v24 = v4[7];
  swift_bridgeObjectRetain();
  uint64_t result = sub_1B8F84064(v23, v24);
  if (v25)
  {
LABEL_55:
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_56;
  }
  if (v4[2] < 3uLL)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  uint64_t v26 = result;
  uint64_t v27 = v4[8];
  unint64_t v28 = v4[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1B8F84064(v27, v28);
  if (v29)
  {
LABEL_56:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(unsigned char *)(a3 + 16) = 1;
    return result;
  }
  if (v12 > 0x7FFFFFFF)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  if (v12 >= (uint64_t)0xFFFFFFFF80000000 && v26 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (v26 <= 0x7FFFFFFF)
    {
      *(void *)a3 = v12 | ((unint64_t)v26 << 32);
      *(void *)(a3 + 8) = result;
      *(unsigned char *)(a3 + 16) = 0;
      return result;
    }
    goto LABEL_71;
  }
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
  return result;
}

uint64_t sub_1B8F84064(uint64_t result, unint64_t a2)
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
        uint64_t v6 = (unsigned __int8 *)sub_1B8F89A10();
      }
      uint64_t v7 = (uint64_t)sub_1B8F84BA0(v6, v4, 10);
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
        char v15 = (unsigned __int8 *)v23 + 2;
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
              int v11 = (unsigned __int8 *)v23 + 2;
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
  uint64_t v7 = (uint64_t)sub_1B8F8467C(result, a2, 10);
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

uint64_t AssertionIdentifier.description.getter()
{
  uint64_t v1 = sub_1B8F89BD0();
  sub_1B8F89750();
  sub_1B8F89BD0();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  sub_1B8F89750();
  sub_1B8F89BD0();
  sub_1B8F89750();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1B8F8439C()
{
  sub_1B8F89570();
  swift_allocObject();
  sub_1B8F89560();
  sub_1B8F6BC9C();
  uint64_t v0 = sub_1B8F89550();
  unint64_t v2 = v1;
  uint64_t v3 = sub_1B8F895A0();
  sub_1B8F6C7BC(v0, v2);
  swift_release();
  return v3;
}

double sub_1B8F84460(uint64_t a1, uint64_t a2)
{
  sub_1B8F89540();
  swift_allocObject();
  sub_1B8F89530();
  uint64_t v3 = sub_1B8F895B0();
  unint64_t v5 = v4;
  sub_1B8F6BFE0();
  sub_1B8F89520();
  sub_1B8F6C7BC(v3, v5);
  swift_release();
  double result = *(double *)&v7;
  *(_OWORD *)a2 = v7;
  *(unsigned char *)(a2 + 16) = 0;
  return result;
}

void *sub_1B8F84544(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7F00);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1B8F845AC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1B8F897B0();
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
    uint64_t v5 = MEMORY[0x1BA9D0BF0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unint64_t sub_1B8F84628()
{
  unint64_t result = qword_1E9EF76F8;
  if (!qword_1E9EF76F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF76F8);
  }
  return result;
}

unsigned __int8 *sub_1B8F8467C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1B8F897C0();
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
  uint64_t v5 = sub_1B8F84E1C();
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
    unint64_t v7 = (unsigned __int8 *)sub_1B8F89A10();
  }
LABEL_7:
  uint64_t v11 = sub_1B8F84BA0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_1B8F84768()
{
  unint64_t result = qword_1EB9C8110;
  if (!qword_1EB9C8110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8110);
  }
  return result;
}

unint64_t sub_1B8F847C0()
{
  unint64_t result = qword_1E9EF7700;
  if (!qword_1E9EF7700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7700);
  }
  return result;
}

unint64_t sub_1B8F84814(void *a1)
{
  a1[1] = sub_1B8F6BFE0();
  a1[2] = sub_1B8F6BC9C();
  unint64_t result = sub_1B8F8484C();
  a1[3] = result;
  return result;
}

unint64_t sub_1B8F8484C()
{
  unint64_t result = qword_1EB9C7968;
  if (!qword_1EB9C7968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C7968);
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AssertionIdentifier(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AssertionIdentifier(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AssertionIdentifier()
{
  return &type metadata for AssertionIdentifier;
}

uint64_t getEnumTagSinglePayload for AssertionIdentifier.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AssertionIdentifier.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B8F84A60);
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

ValueMetadata *type metadata accessor for AssertionIdentifier.CodingKeys()
{
  return &type metadata for AssertionIdentifier.CodingKeys;
}

unint64_t sub_1B8F84A9C()
{
  unint64_t result = qword_1E9EF7708;
  if (!qword_1E9EF7708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7708);
  }
  return result;
}

unint64_t sub_1B8F84AF4()
{
  unint64_t result = qword_1EB9C8100;
  if (!qword_1EB9C8100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8100);
  }
  return result;
}

unint64_t sub_1B8F84B4C()
{
  unint64_t result = qword_1EB9C80F8;
  if (!qword_1EB9C80F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C80F8);
  }
  return result;
}

unsigned __int8 *sub_1B8F84BA0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
            for (i = result + 1; ; ++i)
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
  uint64_t v18 = result + 1;
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

uint64_t sub_1B8F84E1C()
{
  unint64_t v0 = sub_1B8F897D0();
  uint64_t v4 = sub_1B8F84E9C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1B8F84E9C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_1B8F84FF4(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_1B8F84544(v9, 0);
      unint64_t v12 = sub_1B8F850F4((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_1B8F89A10();
LABEL_4:
        JUMPOUT(0x1BA9D0BB0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x1E4FBC860];
    }
    uint64_t v13 = MEMORY[0x1BA9D0BB0](v11 + 4, v11[2]);
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
    return MEMORY[0x1BA9D0BB0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_1B8F84FF4(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_1B8F845AC(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_1B8F845AC(v6, v5, v4);
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
    return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
}

unint64_t sub_1B8F850F4(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    unint64_t result = v12;
    if (v17 == v15) {
      unint64_t result = sub_1B8F845AC(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_1B8F897A0();
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
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_1B8F89A10();
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
    unint64_t result = sub_1B8F845AC(v12, a6, a7);
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
    unint64_t v12 = sub_1B8F89770();
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

uint64_t sub_1B8F85308(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6950726576726573 && a2 == 0xE900000000000064;
  if (v2 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6950746E65696C63 && a2 == 0xE900000000000064 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E756F63 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1B8F89BE0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t static AssertionInvalidationMessage._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    sub_1B8F894E0();
    swift_allocObject();
    sub_1B8F894D0();
    uint64_t v3 = sub_1B8F895B0();
    unint64_t v5 = v4;
    sub_1B8F73B08();
    sub_1B8F894C0();
    sub_1B8F6C7BC(v3, v5);
    uint64_t result = swift_release();
    *(void *)a2 = v7;
    *(_OWORD *)(a2 + 8) = v8;
    *(void *)(a2 + 24) = v9;
  }
  else
  {
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

double AssertionInvalidationMessage.init(identifier:reason:invalidationState:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *a3;
  double result = *(double *)a1;
  *a4 = *(void *)a1;
  a4[1] = v4;
  a4[2] = a2;
  a4[3] = v5;
  return result;
}

unint64_t AssertionInvalidationReason.description.getter(uint64_t a1)
{
  unint64_t result = 0x7974697669746361;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
      return result;
    case 3:
      unint64_t result = 0x64657269707865;
      break;
    case 4:
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0x6765726F46707061;
      break;
    case 7:
      unint64_t result = 0x6F69747265737361;
      break;
    default:
      sub_1B8F89BF0();
      __break(1u);
      JUMPOUT(0x1B8F856A8);
  }
  return result;
}

unint64_t AssertionInvalidationReason.init(rawValue:)(unint64_t a1)
{
  return sub_1B8F861A8(a1);
}

BOOL sub_1B8F856E8(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1B8F856FC()
{
  return sub_1B8F89CA0();
}

uint64_t sub_1B8F85744()
{
  return sub_1B8F89C70();
}

uint64_t sub_1B8F85770()
{
  return sub_1B8F89CA0();
}

unint64_t sub_1B8F857B4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_1B8F861A8(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1B8F857E8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1B8F857F4()
{
  return sub_1B8F897F0();
}

uint64_t sub_1B8F85854()
{
  return sub_1B8F897E0();
}

unint64_t sub_1B8F858A4()
{
  return AssertionInvalidationReason.description.getter(*v0);
}

double AssertionInvalidationMessage.identifier.getter@<D0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  double result = *(double *)v1;
  *a1 = *(void *)v1;
  a1[1] = v2;
  return result;
}

uint64_t AssertionInvalidationMessage.reason.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t AssertionInvalidationMessage.invalidationState.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B8F858D4()
{
  unint64_t v1 = 0x6E6F73616572;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000011;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_1B8F85934@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1B8F863B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B8F8595C(uint64_t a1)
{
  unint64_t v2 = sub_1B8F861B8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F85998(uint64_t a1)
{
  unint64_t v2 = sub_1B8F861B8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AssertionInvalidationMessage.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C80A8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  long long v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v3[1];
  uint64_t v9 = v3[2];
  uint64_t v13 = v3[3];
  uint64_t v14 = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F861B8();
  sub_1B8F89CC0();
  uint64_t v15 = *v3;
  uint64_t v16 = v10;
  char v17 = 0;
  sub_1B8F6BC9C();
  sub_1B8F89BA0();
  if (!v2)
  {
    uint64_t v11 = v13;
    uint64_t v15 = v14;
    char v17 = 1;
    sub_1B8F8620C();
    sub_1B8F89BA0();
    uint64_t v15 = v11;
    char v17 = 2;
    sub_1B8F86260();
    sub_1B8F89B70();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t AssertionInvalidationMessage.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C8050);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  long long v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F861B8();
  sub_1B8F89CB0();
  if (!v2)
  {
    char v15 = 0;
    sub_1B8F6BFE0();
    sub_1B8F89B10();
    uint64_t v9 = v16;
    uint64_t v10 = v17;
    char v15 = 1;
    sub_1B8F862B4();
    sub_1B8F89B10();
    uint64_t v12 = v16;
    char v15 = 2;
    sub_1B8F86308();
    sub_1B8F89AE0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v13 = v16;
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v12;
    a2[3] = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B8F85DDC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return AssertionInvalidationMessage.init(from:)(a1, a2);
}

uint64_t sub_1B8F85DF4(void *a1)
{
  return AssertionInvalidationMessage.encode(to:)(a1);
}

NSData __swiftcall AssertionInvalidationMessage._bridgeToObjectiveC()()
{
  sub_1B8F89510();
  swift_allocObject();
  sub_1B8F89500();
  sub_1B8F8635C();
  uint64_t v0 = sub_1B8F894F0();
  unint64_t v2 = v1;
  uint64_t v3 = sub_1B8F895A0();
  sub_1B8F6C7BC(v0, v2);
  swift_release();
  return (NSData)v3;
}

uint64_t sub_1B8F85EEC()
{
  sub_1B8F89510();
  swift_allocObject();
  sub_1B8F89500();
  sub_1B8F8635C();
  uint64_t v0 = sub_1B8F894F0();
  unint64_t v2 = v1;
  uint64_t v3 = sub_1B8F895A0();
  sub_1B8F6C7BC(v0, v2);
  swift_release();
  return v3;
}

uint64_t sub_1B8F85FCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    sub_1B8F894E0();
    swift_allocObject();
    sub_1B8F894D0();
    uint64_t v3 = sub_1B8F895B0();
    unint64_t v5 = v4;
    sub_1B8F73B08();
    sub_1B8F894C0();
    sub_1B8F6C7BC(v3, v5);
    uint64_t result = swift_release();
    *(void *)a2 = v7;
    *(_OWORD *)(a2 + 8) = v8;
    *(void *)(a2 + 24) = v9;
  }
  else
  {
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

double _s16SessionAssertion0B19InvalidationMessageV26_forceBridgeFromObjectiveC_6resultySo6NSDataC_ACSgztFZ_0(uint64_t a1, uint64_t *a2)
{
  sub_1B8F894E0();
  swift_allocObject();
  sub_1B8F894D0();
  uint64_t v3 = sub_1B8F895B0();
  unint64_t v5 = v4;
  sub_1B8F73B08();
  sub_1B8F894C0();
  sub_1B8F86AA4(*a2, a2[1], a2[2], a2[3]);
  sub_1B8F6C7BC(v3, v5);
  swift_release();
  double result = *(double *)&v7;
  *(_OWORD *)a2 = v7;
  *((_OWORD *)a2 + 1) = v8;
  return result;
}

unint64_t sub_1B8F861A8(unint64_t result)
{
  if (result > 7) {
    return 0;
  }
  return result;
}

unint64_t sub_1B8F861B8()
{
  unint64_t result = qword_1EB9C8190;
  if (!qword_1EB9C8190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8190);
  }
  return result;
}

unint64_t sub_1B8F8620C()
{
  unint64_t result = qword_1EB9C8098;
  if (!qword_1EB9C8098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8098);
  }
  return result;
}

unint64_t sub_1B8F86260()
{
  unint64_t result = qword_1EB9C8090;
  if (!qword_1EB9C8090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8090);
  }
  return result;
}

unint64_t sub_1B8F862B4()
{
  unint64_t result = qword_1EB9C8040;
  if (!qword_1EB9C8040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8040);
  }
  return result;
}

unint64_t sub_1B8F86308()
{
  unint64_t result = qword_1EB9C8038;
  if (!qword_1EB9C8038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8038);
  }
  return result;
}

unint64_t sub_1B8F8635C()
{
  unint64_t result = qword_1EB9C80A0;
  if (!qword_1EB9C80A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C80A0);
  }
  return result;
}

uint64_t sub_1B8F863B0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F73616572 && a2 == 0xE600000000000000 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001B8F8DA80)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1B8F89BE0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t _s16SessionAssertion0B19InvalidationMessageV34_conditionallyBridgeFromObjectiveC_6resultSbSo6NSDataC_ACSgztFZ_0(uint64_t a1, uint64_t *a2)
{
  sub_1B8F86AA4(*a2, a2[1], a2[2], a2[3]);
  sub_1B8F894E0();
  swift_allocObject();
  sub_1B8F894D0();
  uint64_t v3 = sub_1B8F895B0();
  unint64_t v5 = v4;
  sub_1B8F73B08();
  sub_1B8F894C0();
  swift_release();
  sub_1B8F6C7BC(v3, v5);
  uint64_t result = 1;
  *(_OWORD *)a2 = v7;
  *((_OWORD *)a2 + 1) = v8;
  return result;
}

unint64_t sub_1B8F86600()
{
  unint64_t result = qword_1E9EF7710;
  if (!qword_1E9EF7710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7710);
  }
  return result;
}

ValueMetadata *type metadata accessor for AssertionInvalidationReason()
{
  return &type metadata for AssertionInvalidationReason;
}

uint64_t initializeBufferWithCopyOfBuffer for AssertionInvalidationMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AssertionInvalidationMessage()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AssertionInvalidationMessage(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AssertionInvalidationMessage(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for AssertionInvalidationMessage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AssertionInvalidationMessage(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
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

uint64_t storeEnumTagSinglePayload for AssertionInvalidationMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
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
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AssertionInvalidationMessage()
{
  return &type metadata for AssertionInvalidationMessage;
}

unsigned char *storeEnumTagSinglePayload for AssertionInvalidationMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B8F86910);
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

ValueMetadata *type metadata accessor for AssertionInvalidationMessage.CodingKeys()
{
  return &type metadata for AssertionInvalidationMessage.CodingKeys;
}

unint64_t sub_1B8F8694C()
{
  unint64_t result = qword_1E9EF7718;
  if (!qword_1E9EF7718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7718);
  }
  return result;
}

unint64_t sub_1B8F869A4()
{
  unint64_t result = qword_1EB9C81A0;
  if (!qword_1EB9C81A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C81A0);
  }
  return result;
}

unint64_t sub_1B8F869FC()
{
  unint64_t result = qword_1EB9C8198;
  if (!qword_1EB9C8198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8198);
  }
  return result;
}

unint64_t sub_1B8F86A50()
{
  unint64_t result = qword_1EB9C8188;
  if (!qword_1EB9C8188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8188);
  }
  return result;
}

uint64_t sub_1B8F86AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

NSData __swiftcall AssertionAcquisitionRequest._bridgeToObjectiveC()()
{
  sub_1B8F89510();
  swift_allocObject();
  sub_1B8F89500();
  type metadata accessor for AssertionAcquisitionRequest();
  sub_1B8F87B30(&qword_1EB9C7E40, (void (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest);
  uint64_t v0 = sub_1B8F894F0();
  unint64_t v2 = v1;
  uint64_t v3 = sub_1B8F895A0();
  sub_1B8F6C7BC(v0, v2);
  swift_release();
  return (NSData)v3;
}

uint64_t type metadata accessor for AssertionAcquisitionRequest()
{
  uint64_t result = qword_1EB9C80E0;
  if (!qword_1EB9C80E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AssertionAcquisitionRequest.init(attribute:explanation:acquisitionDate:target:duration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X8>)
{
  uint64_t v15 = *a5;
  uint64_t v16 = a5[1];
  char v17 = *((unsigned char *)a5 + 16);
  uint64_t v18 = sub_1B8F895D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(a8, a4, v18);
  char v19 = (int *)type metadata accessor for AssertionAcquisitionRequest();
  uint64_t result = sub_1B8F88638(a1, a8 + v19[5], (uint64_t (*)(void))type metadata accessor for AssertionAttribute);
  uint64_t v21 = (void *)(a8 + v19[6]);
  *uint64_t v21 = a2;
  v21[1] = a3;
  uint64_t v22 = a8 + v19[8];
  *(void *)uint64_t v22 = a6;
  *(unsigned char *)(v22 + 8) = a7 & 1;
  uint64_t v23 = a8 + v19[7];
  *(void *)uint64_t v23 = v15;
  *(void *)(v23 + 8) = v16;
  *(unsigned char *)(v23 + 16) = v17;
  return result;
}

uint64_t AssertionAcquisitionRequest.acquisitionDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1B8F895D0();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t AssertionAcquisitionRequest.attribute.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AssertionAcquisitionRequest();
  return sub_1B8F7F238(v1 + *(int *)(v3 + 20), a1, (uint64_t (*)(void))type metadata accessor for AssertionAttribute);
}

uint64_t AssertionAcquisitionRequest.explanation.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AssertionAcquisitionRequest() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AssertionAcquisitionRequest.target.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AssertionAcquisitionRequest() + 28);
  uint64_t v4 = *(void *)(v3 + 8);
  char v5 = *(unsigned char *)(v3 + 16);
  *(void *)a1 = *(void *)v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;

  return sub_1B8F6CFA4();
}

uint64_t AssertionAcquisitionRequest.duration.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AssertionAcquisitionRequest() + 32));
}

uint64_t sub_1B8F86E60()
{
  uint64_t result = 0x7469736975716361;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x7475626972747461;
      break;
    case 2:
      uint64_t result = 0x74616E616C707865;
      break;
    case 3:
      uint64_t result = 0x746567726174;
      break;
    case 4:
      uint64_t result = 0x6E6F697461727564;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1B8F86F20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1B8F88170(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B8F86F48(uint64_t a1)
{
  unint64_t v2 = sub_1B8F87278();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B8F86F84(uint64_t a1)
{
  unint64_t v2 = sub_1B8F87278();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AssertionAcquisitionRequest.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7EF8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  long long v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F87278();
  sub_1B8F89CC0();
  LOBYTE(v14) = 0;
  sub_1B8F895D0();
  sub_1B8F87B30(&qword_1EB9C7E00, MEMORY[0x1E4F27928]);
  sub_1B8F89BA0();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for AssertionAcquisitionRequest();
    LOBYTE(v14) = 1;
    type metadata accessor for AssertionAttribute();
    sub_1B8F87B30(&qword_1EB9C7E68, (void (*)(uint64_t))type metadata accessor for AssertionAttribute);
    sub_1B8F89BA0();
    LOBYTE(v14) = 2;
    sub_1B8F89B80();
    uint64_t v10 = (long long *)(v3 + *(int *)(v9 + 28));
    char v11 = *((unsigned char *)v10 + 16);
    long long v14 = *v10;
    char v15 = v11;
    v13[15] = 3;
    sub_1B8F872CC();
    sub_1B8F89BA0();
    LOBYTE(v14) = 4;
    sub_1B8F89B60();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1B8F87278()
{
  unint64_t result = qword_1EB9C8170;
  if (!qword_1EB9C8170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8170);
  }
  return result;
}

unint64_t sub_1B8F872CC()
{
  unint64_t result = qword_1EB9C7E70;
  if (!qword_1EB9C7E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C7E70);
  }
  return result;
}

uint64_t AssertionAcquisitionRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v26 = type metadata accessor for AssertionAttribute();
  MEMORY[0x1F4188790](v26);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1B8F895D0();
  uint64_t v27 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  char v29 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7F70);
  uint64_t v28 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30);
  long long v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (int *)type metadata accessor for AssertionAcquisitionRequest();
  MEMORY[0x1F4188790](v9);
  char v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F87278();
  unsigned int v31 = v8;
  uint64_t v12 = (uint64_t)v32;
  sub_1B8F89CB0();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v32 = a1;
  uint64_t v13 = v27;
  LOBYTE(v33) = 0;
  sub_1B8F87B30(&qword_1EB9C7F10, MEMORY[0x1E4F27928]);
  sub_1B8F89B10();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v11, v29, v5);
  LOBYTE(v33) = 1;
  sub_1B8F87B30(&qword_1EB9C7F48, (void (*)(uint64_t))type metadata accessor for AssertionAttribute);
  sub_1B8F89B10();
  uint64_t v14 = v28;
  sub_1B8F88638((uint64_t)v4, (uint64_t)&v11[v9[5]], (uint64_t (*)(void))type metadata accessor for AssertionAttribute);
  LOBYTE(v33) = 2;
  uint64_t v15 = sub_1B8F89AF0();
  uint64_t v16 = (uint64_t *)&v11[v9[6]];
  *uint64_t v16 = v15;
  v16[1] = v17;
  char v35 = 3;
  sub_1B8F878A0();
  sub_1B8F89B10();
  char v18 = v34;
  char v19 = &v11[v9[7]];
  *(_OWORD *)char v19 = v33;
  v19[16] = v18;
  LOBYTE(v33) = 4;
  uint64_t v20 = sub_1B8F89AD0();
  char v22 = v21;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v31, v30);
  uint64_t v23 = &v11[v9[8]];
  *(void *)uint64_t v23 = v20;
  v23[8] = v22 & 1;
  sub_1B8F7F238((uint64_t)v11, v25, (uint64_t (*)(void))type metadata accessor for AssertionAcquisitionRequest);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  return sub_1B8F878F4((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for AssertionAcquisitionRequest);
}

unint64_t sub_1B8F878A0()
{
  unint64_t result = qword_1EB9C7F50;
  if (!qword_1EB9C7F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C7F50);
  }
  return result;
}

uint64_t sub_1B8F878F4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1B8F87954@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AssertionAcquisitionRequest.init(from:)(a1, a2);
}

uint64_t sub_1B8F8796C(void *a1)
{
  return AssertionAcquisitionRequest.encode(to:)(a1);
}

uint64_t static AssertionAcquisitionRequest._forceBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7DF8);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8F894E0();
  swift_allocObject();
  sub_1B8F894D0();
  uint64_t v6 = type metadata accessor for AssertionAcquisitionRequest();
  uint64_t v7 = sub_1B8F895B0();
  unint64_t v9 = v8;
  sub_1B8F87B30(&qword_1EB9C7F38, (void (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest);
  sub_1B8F894C0();
  sub_1B8F87B78(a2);
  sub_1B8F6C7BC(v7, v9);
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  return sub_1B8F87BD8((uint64_t)v5, a2);
}

uint64_t sub_1B8F87B30(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B8F87B78(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7DF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B8F87BD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7DF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static AssertionAcquisitionRequest._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7DF8);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  unint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  uint64_t v11 = (char *)&v18 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v18 - v12;
  uint64_t v14 = type metadata accessor for AssertionAcquisitionRequest();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v20(v13, 1, 1, v14);
  if (a1)
  {
    sub_1B8F894E0();
    swift_allocObject();
    sub_1B8F894D0();
    uint64_t v3 = sub_1B8F895B0();
    unint64_t v2 = v16;
    sub_1B8F87B30(&qword_1EB9C7F38, (void (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest);
    sub_1B8F894C0();
    sub_1B8F87B78((uint64_t)v13);
    sub_1B8F6C7BC(v3, v2);
    swift_release();
    v20(v11, 0, 1, v14);
    sub_1B8F87BD8((uint64_t)v11, (uint64_t)v13);
    sub_1B8F885D0((uint64_t)v13, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14) != 1)
    {
      sub_1B8F87B78((uint64_t)v13);
      return sub_1B8F88638((uint64_t)v8, v19, (uint64_t (*)(void))type metadata accessor for AssertionAcquisitionRequest);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  sub_1B8F6C7BC(v3, v2);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1B8F87ED8()
{
  sub_1B8F89510();
  swift_allocObject();
  sub_1B8F89500();
  sub_1B8F87B30(&qword_1EB9C7E40, (void (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest);
  uint64_t v0 = sub_1B8F894F0();
  unint64_t v2 = v1;
  uint64_t v3 = sub_1B8F895A0();
  sub_1B8F6C7BC(v0, v2);
  swift_release();
  return v3;
}

uint64_t sub_1B8F87FC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7DF8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8F894E0();
  swift_allocObject();
  sub_1B8F894D0();
  uint64_t v8 = sub_1B8F895B0();
  unint64_t v10 = v9;
  sub_1B8F87B30(&qword_1EB9C7F38, (void (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest);
  sub_1B8F894C0();
  sub_1B8F87B78(a2);
  sub_1B8F6C7BC(v8, v10);
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(v7, 0, 1, a3);
  return sub_1B8F87BD8((uint64_t)v7, a2);
}

uint64_t sub_1B8F88170(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7469736975716361 && a2 == 0xEF657461446E6F69;
  if (v2 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xE900000000000065 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74616E616C707865 && a2 == 0xEB000000006E6F69 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746567726174 && a2 == 0xE600000000000000 || (sub_1B8F89BE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_1B8F89BE0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

BOOL _s16SessionAssertion0B18AcquisitionRequestV34_conditionallyBridgeFromObjectiveC_6resultSbSo6NSDataC_ACSgztFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7DF8);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  char v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = &v16[-v7];
  sub_1B8F87B78(a2);
  sub_1B8F894E0();
  swift_allocObject();
  sub_1B8F894D0();
  uint64_t v9 = type metadata accessor for AssertionAcquisitionRequest();
  uint64_t v10 = sub_1B8F895B0();
  unint64_t v12 = v11;
  sub_1B8F87B30(&qword_1EB9C7F38, (void (*)(uint64_t))type metadata accessor for AssertionAcquisitionRequest);
  sub_1B8F894C0();
  swift_release();
  sub_1B8F6C7BC(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_1B8F87BD8((uint64_t)v8, a2);
  sub_1B8F885D0(a2, (uint64_t)v6);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v9) != 1;
  sub_1B8F87B78((uint64_t)v6);
  return v14;
}

uint64_t sub_1B8F885D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C7DF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B8F88638(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for AssertionAcquisitionRequest(void *a1, void *a2, int *a3)
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
    uint64_t v7 = sub_1B8F895D0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for AssertionAttribute();
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v12 = sub_1B8F89600();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    unint64_t v16 = (void *)((char *)a1 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *unint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = (char *)a1 + v15;
    uint64_t v20 = *(void *)((char *)a2 + v15);
    uint64_t v21 = *(void *)((char *)a2 + v15 + 8);
    char v22 = *((unsigned char *)a2 + v15 + 16);
    swift_bridgeObjectRetain();
    sub_1B8F6CFA4();
    *(void *)uint64_t v19 = v20;
    *((void *)v19 + 1) = v21;
    v19[16] = v22;
    uint64_t v23 = a3[8];
    unsigned __int8 v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    *(void *)unsigned __int8 v24 = *(void *)v25;
    v24[8] = v25[8];
  }
  return a1;
}

uint64_t destroy for AssertionAcquisitionRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B8F895D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  type metadata accessor for AssertionAttribute();
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v6 = sub_1B8F89600();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  swift_bridgeObjectRelease();

  return sub_1B8F6D0A8();
}

uint64_t initializeWithCopy for AssertionAcquisitionRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B8F895D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for AssertionAttribute();
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v11 = sub_1B8F89600();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 16))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = a1 + v13;
  uint64_t v18 = *(void *)(a2 + v13);
  uint64_t v19 = *(void *)(a2 + v13 + 8);
  char v20 = *(unsigned char *)(a2 + v13 + 16);
  swift_bridgeObjectRetain();
  sub_1B8F6CFA4();
  *(void *)uint64_t v17 = v18;
  *(void *)(v17 + 8) = v19;
  *(unsigned char *)(v17 + 16) = v20;
  uint64_t v21 = a3[8];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  *(void *)uint64_t v22 = *(void *)v23;
  *(unsigned char *)(v22 + 8) = *(unsigned char *)(v23 + 8);
  return a1;
}

uint64_t assignWithCopy for AssertionAcquisitionRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B8F895D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  if (a1 != a2)
  {
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_1B8F878F4(a1 + v7, (uint64_t (*)(void))type metadata accessor for AssertionAttribute);
    uint64_t v10 = type metadata accessor for AssertionAttribute();
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v11 = sub_1B8F89600();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 16))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v18 = *v17;
  uint64_t v19 = v17[1];
  char v20 = *((unsigned char *)v17 + 16);
  sub_1B8F6CFA4();
  *(void *)uint64_t v16 = v18;
  *(void *)(v16 + 8) = v19;
  *(unsigned char *)(v16 + 16) = v20;
  sub_1B8F6D0A8();
  uint64_t v21 = a3[8];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v24 = *v23;
  *(unsigned char *)(v22 + 8) = *((unsigned char *)v23 + 8);
  *(void *)uint64_t v22 = v24;
  return a1;
}

uint64_t initializeWithTake for AssertionAcquisitionRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B8F895D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for AssertionAttribute();
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v11 = sub_1B8F89600();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(unsigned char *)(v13 + 16) = *(unsigned char *)(v14 + 16);
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(void *)uint64_t v16 = *(void *)v17;
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  return a1;
}

uint64_t assignWithTake for AssertionAcquisitionRequest(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1B8F895D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  if (a1 != a2)
  {
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_1B8F878F4(a1 + v7, (uint64_t (*)(void))type metadata accessor for AssertionAttribute);
    uint64_t v10 = type metadata accessor for AssertionAttribute();
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v11 = sub_1B8F89600();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  char v20 = *(unsigned char *)(v19 + 16);
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  *(unsigned char *)(v18 + 16) = v20;
  sub_1B8F6D0A8();
  uint64_t v21 = a3[8];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  *(void *)uint64_t v22 = *(void *)v23;
  *(unsigned char *)(v22 + 8) = *(unsigned char *)(v23 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for AssertionAcquisitionRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B8F88F90);
}

uint64_t sub_1B8F88F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B8F895D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for AssertionAttribute();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for AssertionAcquisitionRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B8F890BC);
}

uint64_t sub_1B8F890BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1B8F895D0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = type metadata accessor for AssertionAttribute();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t sub_1B8F891D0()
{
  uint64_t result = sub_1B8F895D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for AssertionAttribute();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AssertionAcquisitionRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B8F89380);
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

ValueMetadata *type metadata accessor for AssertionAcquisitionRequest.CodingKeys()
{
  return &type metadata for AssertionAcquisitionRequest.CodingKeys;
}

unint64_t sub_1B8F893BC()
{
  unint64_t result = qword_1E9EF7720;
  if (!qword_1E9EF7720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF7720);
  }
  return result;
}

unint64_t sub_1B8F89414()
{
  unint64_t result = qword_1EB9C8180;
  if (!qword_1EB9C8180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8180);
  }
  return result;
}

unint64_t sub_1B8F8946C()
{
  unint64_t result = qword_1EB9C8178;
  if (!qword_1EB9C8178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C8178);
  }
  return result;
}

uint64_t sub_1B8F894C0()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1B8F894D0()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1B8F894E0()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1B8F894F0()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1B8F89500()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1B8F89510()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1B8F89520()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1B8F89530()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1B8F89540()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1B8F89550()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1B8F89560()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1B8F89570()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1B8F89580()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1B8F89590()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1B8F895A0()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1B8F895B0()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1B8F895C0()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1B8F895D0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1B8F895E0()
{
  return MEMORY[0x1F40D34B0]();
}

uint64_t sub_1B8F895F0()
{
  return MEMORY[0x1F40D34B8]();
}

uint64_t sub_1B8F89600()
{
  return MEMORY[0x1F40D34C8]();
}

uint64_t sub_1B8F89610()
{
  return MEMORY[0x1F40D3670]();
}

uint64_t sub_1B8F89620()
{
  return MEMORY[0x1F40D3790]();
}

uint64_t sub_1B8F89630()
{
  return MEMORY[0x1F414A9E8]();
}

uint64_t sub_1B8F89640()
{
  return MEMORY[0x1F414A9F0]();
}

uint64_t sub_1B8F89650()
{
  return MEMORY[0x1F414AA00]();
}

uint64_t sub_1B8F89660()
{
  return MEMORY[0x1F40D39A0]();
}

uint64_t sub_1B8F89670()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1B8F89680()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1B8F89690()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1B8F896A0()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1B8F896B0()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1B8F896C0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1B8F896D0()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1B8F896E0()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1B8F896F0()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1B8F89700()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B8F89710()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B8F89720()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1B8F89730()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1B8F89740()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1B8F89750()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B8F89760()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B8F89770()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1B8F89780()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1B8F897A0()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1B8F897B0()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1B8F897C0()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1B8F897D0()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1B8F897E0()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1B8F897F0()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1B8F89800()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1B8F89810()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B8F89820()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1B8F89830()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1B8F89840()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1B8F89850()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1B8F89860()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1B8F89870()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1B8F89880()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1B8F89890()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1B8F898A0()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1B8F898B0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1B8F898C0()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1B8F898D0()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1B8F898E0()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1B8F898F0()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1B8F89900()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1B8F89910()
{
  return MEMORY[0x1F414AA40]();
}

uint64_t sub_1B8F89920()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1B8F89930()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B8F89940()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1B8F89950()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1B8F89960()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1B8F89970()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1B8F89980()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1B8F89990()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1B8F899A0()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1B8F899B0()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1B8F899C0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1B8F899D0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B8F899E0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B8F899F0()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1B8F89A00()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1B8F89A10()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B8F89A20()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1B8F89A30()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1B8F89A40()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B8F89A50()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B8F89A60()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1B8F89A70()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1B8F89A80()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B8F89A90()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1B8F89AA0()
{
  return MEMORY[0x1F4185498]();
}

uint64_t sub_1B8F89AB0()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1B8F89AC0()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1B8F89AD0()
{
  return MEMORY[0x1F4185508]();
}

uint64_t sub_1B8F89AE0()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1B8F89AF0()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1B8F89B00()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1B8F89B10()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1B8F89B20()
{
  return MEMORY[0x1F41855B0]();
}

uint64_t sub_1B8F89B30()
{
  return MEMORY[0x1F41855B8]();
}

uint64_t sub_1B8F89B40()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1B8F89B50()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1B8F89B60()
{
  return MEMORY[0x1F4185638]();
}

uint64_t sub_1B8F89B70()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1B8F89B80()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1B8F89B90()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1B8F89BA0()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1B8F89BB0()
{
  return MEMORY[0x1F41856D8]();
}

uint64_t sub_1B8F89BC0()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t sub_1B8F89BD0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1B8F89BE0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B8F89BF0()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1B8F89C00()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1B8F89C10()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1B8F89C20()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1B8F89C30()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1B8F89C40()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1B8F89C50()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1B8F89C60()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B8F89C70()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1B8F89C80()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1B8F89C90()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1B8F89CA0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1B8F89CB0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1B8F89CC0()
{
  return MEMORY[0x1F4185FF0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}