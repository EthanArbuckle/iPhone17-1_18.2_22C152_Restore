void type metadata accessor for STDowntimeState(uint64_t a1)
{
  sub_25BC5A838(a1, &qword_26A5532D0);
}

void type metadata accessor for MOScreenTimeShieldPolicy(uint64_t a1)
{
}

void type metadata accessor for STFamilyMemberType(uint64_t a1)
{
}

void sub_25BC5A838(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25BC5A880(uint64_t a1)
{
  return sub_25BC5A8E8(a1, qword_26A5537C8);
}

uint64_t sub_25BC5A898(uint64_t a1)
{
  return sub_25BC5A8E8(a1, qword_26A5537E0);
}

uint64_t sub_25BC5A8BC(uint64_t a1)
{
  return sub_25BC5A8E8(a1, qword_26A5537F8);
}

uint64_t sub_25BC5A8E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25BC70BF0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_25BC70BE0();
}

uint64_t sub_25BC5A960(uint64_t a1, uint64_t a2)
{
  return sub_25BC5AE34(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_25BC5A984(uint64_t a1, id *a2)
{
  uint64_t result = sub_25BC70D00();
  *a2 = 0;
  return result;
}

uint64_t sub_25BC5A9FC(uint64_t a1, id *a2)
{
  char v3 = sub_25BC70D10();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25BC5AA7C@<X0>(uint64_t *a1@<X8>)
{
  sub_25BC70D20();
  uint64_t v2 = sub_25BC70CF0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_25BC5AAC0(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_25BC5AACC(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_25BC5AAD4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_25BC5AAE8(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_25BC5AB18(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_25BC5AB2C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_25BC5AB40@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_25BC5AB50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25BC70D20();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25BC5AB7C(uint64_t a1)
{
  uint64_t v2 = sub_25BC5ACC8(&qword_26A553328, type metadata accessor for STFamilyMemberType);
  uint64_t v3 = sub_25BC5ACC8((unint64_t *)&unk_26A553330, type metadata accessor for STFamilyMemberType);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25BC5AC38()
{
  return sub_25BC5ACC8(&qword_26A5532E8, type metadata accessor for STFamilyMemberType);
}

uint64_t sub_25BC5AC80()
{
  return sub_25BC5ACC8(&qword_26A5532F0, type metadata accessor for STFamilyMemberType);
}

uint64_t sub_25BC5ACC8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25BC5AD10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25BC70CF0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25BC5AD58(uint64_t a1)
{
  uint64_t v2 = sub_25BC5ACC8(&qword_26A553318, type metadata accessor for MOScreenTimeShieldPolicy);
  uint64_t v3 = sub_25BC5ACC8(&qword_26A553320, type metadata accessor for MOScreenTimeShieldPolicy);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25BC5AE14(uint64_t a1, uint64_t a2)
{
  return sub_25BC5AE34(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_25BC5AE34(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_25BC70D20();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25BC5AE78()
{
  sub_25BC70D20();
  sub_25BC70D40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BC5AECC()
{
  sub_25BC70D20();
  sub_25BC710B0();
  sub_25BC70D40();
  uint64_t v0 = sub_25BC710F0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25BC5AF44()
{
  return sub_25BC5ACC8(&qword_26A5532F8, type metadata accessor for STFamilyMemberType);
}

uint64_t sub_25BC5AF8C()
{
  return sub_25BC5ACC8(&qword_26A553300, type metadata accessor for MOScreenTimeShieldPolicy);
}

uint64_t sub_25BC5AFD4()
{
  return sub_25BC5ACC8(&qword_26A553308, type metadata accessor for MOScreenTimeShieldPolicy);
}

uint64_t sub_25BC5B01C()
{
  uint64_t v0 = sub_25BC70D20();
  uint64_t v2 = v1;
  if (v0 == sub_25BC70D20() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_25BC71040();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_25BC5B0A8()
{
  return sub_25BC5ACC8(&qword_26A553310, type metadata accessor for MOScreenTimeShieldPolicy);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25BC5B194@<X0>(unsigned char *a1@<X8>)
{
  return sub_25BC5C4B8(a1);
}

uint64_t sub_25BC5B1A8()
{
  return sub_25BC5C548();
}

uint64_t sub_25BC5B1BC()
{
  return sub_25BC5C5CC();
}

uint64_t sub_25BC5B1D8()
{
  return sub_25BC5C654();
}

uint64_t (*sub_25BC5B1EC(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_25BC70C50();
  return sub_25BC5B278;
}

uint64_t sub_25BC5B27C()
{
  return sub_25BC5CD64((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__checkForUnsafePhotos, &qword_26A5533A8);
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

uint64_t sub_25BC5B2D4(uint64_t a1)
{
  return sub_25BC5CDE8(a1, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__checkForUnsafePhotos, &qword_26A5533A8);
}

uint64_t (*sub_25BC5B2F0(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__checkForUnsafePhotos;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533A8);
  sub_25BC70C30();
  swift_endAccess();
  return sub_25BC5B400;
}

uint64_t sub_25BC5B404@<X0>(unsigned char *a1@<X8>)
{
  return sub_25BC5C4B8(a1);
}

uint64_t sub_25BC5B418()
{
  return sub_25BC5C548();
}

uint64_t sub_25BC5B42C()
{
  return sub_25BC5C5CC();
}

uint64_t sub_25BC5B448()
{
  return sub_25BC5C654();
}

uint64_t (*sub_25BC5B45C(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_25BC70C50();
  return sub_25BC5B278;
}

uint64_t sub_25BC5B4E8()
{
  return sub_25BC5CD64((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyNotificationEnabled, &qword_26A5533A8);
}

uint64_t sub_25BC5B4FC(uint64_t a1)
{
  return sub_25BC5CDE8(a1, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyNotificationEnabled, &qword_26A5533A8);
}

uint64_t (*sub_25BC5B518(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyNotificationEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533A8);
  sub_25BC70C30();
  swift_endAccess();
  return sub_25BC5B400;
}

uint64_t sub_25BC5B628@<X0>(unsigned char *a1@<X8>)
{
  return sub_25BC5C4B8(a1);
}

uint64_t sub_25BC5B63C()
{
  return sub_25BC5C548();
}

uint64_t sub_25BC5B650()
{
  return sub_25BC5C5CC();
}

uint64_t sub_25BC5B66C()
{
  return sub_25BC5C654();
}

uint64_t (*sub_25BC5B680(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_25BC70C50();
  return sub_25BC5B278;
}

uint64_t sub_25BC5B70C()
{
  return sub_25BC5CD64((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyAnalyticsEnabled, &qword_26A5533A8);
}

uint64_t sub_25BC5B720(uint64_t a1)
{
  return sub_25BC5CDE8(a1, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyAnalyticsEnabled, &qword_26A5533A8);
}

uint64_t (*sub_25BC5B73C(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyAnalyticsEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533A8);
  sub_25BC70C30();
  swift_endAccess();
  return sub_25BC5B400;
}

uint64_t sub_25BC5B84C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25BC70C60();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_25BC5B8CC()
{
  return sub_25BC70C70();
}

uint64_t sub_25BC5B950()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25BC70C60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_25BC5B9CC()
{
  return sub_25BC70C70();
}

uint64_t (*sub_25BC5BA48(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_25BC70C50();
  return sub_25BC5B278;
}

uint64_t sub_25BC5BAD4()
{
  return sub_25BC5CD64((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName, &qword_26A5533D0);
}

uint64_t sub_25BC5BAE8(uint64_t a1)
{
  return sub_25BC5CDE8(a1, &qword_26A5533D8, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName, &qword_26A5533D0);
}

uint64_t (*sub_25BC5BB04(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533D8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533D0);
  sub_25BC70C30();
  swift_endAccess();
  return sub_25BC5B400;
}

uint64_t sub_25BC5BC14@<X0>(unsigned char *a1@<X8>)
{
  return sub_25BC5C4B8(a1);
}

uint64_t sub_25BC5BC28()
{
  return sub_25BC5C548();
}

uint64_t sub_25BC5BC3C()
{
  return sub_25BC5C5CC();
}

uint64_t sub_25BC5BC58()
{
  return sub_25BC5C654();
}

uint64_t (*sub_25BC5BC6C(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_25BC70C50();
  return sub_25BC5B278;
}

uint64_t sub_25BC5BCF8()
{
  return sub_25BC5CD64((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode, &qword_26A5533A8);
}

uint64_t sub_25BC5BD0C(uint64_t a1)
{
  return sub_25BC5CDE8(a1, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode, &qword_26A5533A8);
}

uint64_t (*sub_25BC5BD28(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533A8);
  sub_25BC70C30();
  swift_endAccess();
  return sub_25BC5B400;
}

uint64_t sub_25BC5BE38@<X0>(unsigned char *a1@<X8>)
{
  return sub_25BC5C4B8(a1);
}

uint64_t sub_25BC5BE4C()
{
  return sub_25BC5C548();
}

uint64_t sub_25BC5BE60()
{
  return sub_25BC5C5CC();
}

uint64_t sub_25BC5BE7C()
{
  return sub_25BC5C654();
}

uint64_t (*sub_25BC5BE90(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_25BC70C50();
  return sub_25BC5B278;
}

uint64_t sub_25BC5BF1C()
{
  return sub_25BC5CD64((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent, &qword_26A5533A8);
}

uint64_t sub_25BC5BF30(uint64_t a1)
{
  return sub_25BC5CDE8(a1, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent, &qword_26A5533A8);
}

uint64_t (*sub_25BC5BF4C(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533A8);
  sub_25BC70C30();
  swift_endAccess();
  return sub_25BC5B400;
}

uint64_t sub_25BC5C05C@<X0>(unsigned char *a1@<X8>)
{
  return sub_25BC5C4B8(a1);
}

uint64_t sub_25BC5C070()
{
  return sub_25BC5C548();
}

uint64_t sub_25BC5C084()
{
  return sub_25BC5C5CC();
}

uint64_t sub_25BC5C0A0()
{
  return sub_25BC5C654();
}

uint64_t (*sub_25BC5C0B4(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_25BC70C50();
  return sub_25BC5B278;
}

uint64_t sub_25BC5C140()
{
  return sub_25BC5CD64((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser, &qword_26A5533A8);
}

uint64_t sub_25BC5C154(uint64_t a1)
{
  return sub_25BC5CDE8(a1, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser, &qword_26A5533A8);
}

uint64_t (*sub_25BC5C170(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533A8);
  sub_25BC70C30();
  swift_endAccess();
  return sub_25BC5B400;
}

uint64_t sub_25BC5C280@<X0>(unsigned char *a1@<X8>)
{
  return sub_25BC5C4B8(a1);
}

uint64_t sub_25BC5C294()
{
  return sub_25BC5C548();
}

uint64_t sub_25BC5C2A8()
{
  return sub_25BC5C5CC();
}

uint64_t sub_25BC5C2C4()
{
  return sub_25BC5C654();
}

uint64_t (*sub_25BC5C2D8(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_25BC70C50();
  return sub_25BC5B278;
}

uint64_t sub_25BC5C364()
{
  return sub_25BC5CD64((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled, &qword_26A5533A8);
}

uint64_t sub_25BC5C378(uint64_t a1)
{
  return sub_25BC5CDE8(a1, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled, &qword_26A5533A8);
}

uint64_t (*sub_25BC5C394(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533A8);
  sub_25BC70C30();
  swift_endAccess();
  return sub_25BC5B400;
}

uint64_t sub_25BC5C4A4@<X0>(unsigned char *a1@<X8>)
{
  return sub_25BC5C4B8(a1);
}

uint64_t sub_25BC5C4B8@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25BC70C60();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_25BC5C534()
{
  return sub_25BC5C548();
}

uint64_t sub_25BC5C548()
{
  return sub_25BC70C70();
}

uint64_t sub_25BC5C5B8()
{
  return sub_25BC5C5CC();
}

uint64_t sub_25BC5C5CC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25BC70C60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_25BC5C640()
{
  return sub_25BC5C654();
}

uint64_t sub_25BC5C654()
{
  return sub_25BC70C70();
}

uint64_t (*sub_25BC5C6C0(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_25BC70C50();
  return sub_25BC5B278;
}

uint64_t sub_25BC5C74C()
{
  return sub_25BC5CD64((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled, &qword_26A5533A8);
}

uint64_t sub_25BC5C760(uint64_t a1)
{
  return sub_25BC5CDE8(a1, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled, &qword_26A5533A8);
}

uint64_t (*sub_25BC5C77C(void *a1))()
{
  char v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533B0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533A8);
  sub_25BC70C30();
  swift_endAccess();
  return sub_25BC5B400;
}

uint64_t sub_25BC5C88C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25BC70C60();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_25BC5C90C(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_25BC70C70();
}

uint64_t sub_25BC5C984()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25BC70C60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_25BC5CA00()
{
  return sub_25BC70C70();
}

uint64_t (*sub_25BC5CA70(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_25BC70C50();
  return sub_25BC5B278;
}

void sub_25BC5CAFC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_25BC5CB64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return swift_endAccess();
}

uint64_t sub_25BC5CBD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v15 = (char *)&v18 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_25BC70C40();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_25BC5CD50()
{
  return sub_25BC5CD64((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType, &qword_26A553410);
}

uint64_t sub_25BC5CD64(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_25BC5CDCC(uint64_t a1)
{
  return sub_25BC5CDE8(a1, &qword_26A553418, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType, &qword_26A553410);
}

uint64_t sub_25BC5CDE8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_25BC70C40();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_25BC5CF18(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A553418);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A553410);
  sub_25BC70C30();
  swift_endAccess();
  return sub_25BC5B400;
}

void sub_25BC5D028(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_25BC70C40();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_25BC70C40();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

uint64_t STSwiftUser.__allocating_init(identifier:givenName:hasPasscode:isParent:isRemoteUser:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:screenTimeEnabled:syncingEnabled:familyMemberType:persistenceSource:authenticationSource:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, int a5, int a6, int a7, int a8, unsigned __int8 a9, unsigned __int8 a10, unsigned __int8 a11, unsigned __int8 a12, void *a13, uint64_t a14, uint64_t a15)
{
  uint64_t v19 = swift_allocObject();
  STSwiftUser.init(identifier:givenName:hasPasscode:isParent:isRemoteUser:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:screenTimeEnabled:syncingEnabled:familyMemberType:persistenceSource:authenticationSource:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
  return v19;
}

uint64_t STSwiftUser.init(identifier:givenName:hasPasscode:isParent:isRemoteUser:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:screenTimeEnabled:syncingEnabled:familyMemberType:persistenceSource:authenticationSource:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, int a5, int a6, int a7, int a8, unsigned __int8 a9, unsigned __int8 a10, unsigned __int8 a11, unsigned __int8 a12, void *a13, uint64_t a14, uint64_t a15)
{
  uint64_t v16 = v15;
  int v79 = a6;
  int v80 = a7;
  int v78 = a5;
  v76 = a3;
  uint64_t v77 = a4;
  uint64_t v74 = a1;
  uint64_t v75 = a2;
  int v86 = a10;
  int v84 = a8;
  int v85 = a9;
  uint64_t v87 = a14;
  uint64_t v88 = a15;
  id v83 = a13;
  int v81 = a11;
  int v82 = a12;
  uint64_t v71 = sub_25BC70E10();
  uint64_t v70 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388]();
  v69 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_25BC70E00();
  MEMORY[0x270FA5388]();
  v66 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BC70CC0();
  MEMORY[0x270FA5388]();
  v59 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A553410);
  uint64_t v89 = *(void *)(v20 - 8);
  uint64_t v90 = v20;
  MEMORY[0x270FA5388]();
  v22 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533A8);
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388]();
  v26 = (char *)&v56 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533D0);
  uint64_t v57 = v27;
  uint64_t v60 = *(void *)(v27 - 8);
  uint64_t v28 = v60;
  MEMORY[0x270FA5388]();
  v30 = (char *)&v56 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName;
  uint64_t v56 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName;
  v93 = 0;
  unint64_t v94 = 0xE000000000000000;
  sub_25BC70C20();
  (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v31, v30, v27);
  uint64_t v32 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode;
  uint64_t v58 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode;
  LOBYTE(v93) = 0;
  sub_25BC70C20();
  v33 = *(void (**)(uint64_t, char *, uint64_t))(v24 + 32);
  v33(v32, v26, v23);
  uint64_t v34 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent;
  uint64_t v61 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent;
  LOBYTE(v93) = 0;
  sub_25BC70C20();
  v33(v34, v26, v23);
  uint64_t v35 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser;
  uint64_t v62 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser;
  LOBYTE(v93) = 0;
  sub_25BC70C20();
  v33(v35, v26, v23);
  uint64_t v36 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled;
  uint64_t v63 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled;
  LOBYTE(v93) = 0;
  sub_25BC70C20();
  v33(v36, v26, v23);
  uint64_t v37 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled;
  uint64_t v65 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled;
  LOBYTE(v93) = 0;
  sub_25BC70C20();
  v33(v37, v26, v23);
  uint64_t v38 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType;
  uint64_t v64 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType;
  v93 = (void *)*MEMORY[0x263F67328];
  v39 = v93;
  type metadata accessor for STFamilyMemberType(0);
  uint64_t v67 = v40;
  id v41 = v39;
  sub_25BC70C20();
  (*(void (**)(uint64_t, char *, uint64_t))(v89 + 32))(v38, v22, v90);
  uint64_t v72 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_persistenceSource;
  *(void *)(v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_persistenceSource) = 0;
  uint64_t v73 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_authenticationSource;
  *(void *)(v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_authenticationSource) = 0;
  uint64_t v42 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_backgroundPersistenceQueue;
  sub_25BC6147C(0, &qword_26A553438);
  sub_25BC70CB0();
  v93 = (void *)MEMORY[0x263F8EE78];
  sub_25BC6018C(&qword_26A553440, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A553448);
  sub_25BC601D4(&qword_26A553450, &qword_26A553448);
  sub_25BC70EB0();
  (*(void (**)(char *, void, uint64_t))(v70 + 104))(v69, *MEMORY[0x263F8F130], v71);
  *(void *)(v16 + v42) = sub_25BC70E40();
  v43 = (void *)(v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_identifier);
  uint64_t v44 = v75;
  void *v43 = v74;
  v43[1] = v44;
  uint64_t v45 = v56;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v45, v57);
  id v91 = v76;
  uint64_t v92 = v77;
  sub_25BC70C20();
  swift_endAccess();
  uint64_t v46 = v58;
  swift_beginAccess();
  v47 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  v47(v46, v23);
  LOBYTE(v91) = v78;
  sub_25BC70C20();
  swift_endAccess();
  uint64_t v48 = v61;
  swift_beginAccess();
  v47(v48, v23);
  LOBYTE(v91) = v79;
  sub_25BC70C20();
  swift_endAccess();
  uint64_t v49 = v62;
  swift_beginAccess();
  v47(v49, v23);
  LOBYTE(v91) = v80;
  sub_25BC70C20();
  swift_endAccess();
  uint64_t v50 = v63;
  swift_beginAccess();
  v47(v50, v23);
  LOBYTE(v91) = v81;
  sub_25BC70C20();
  swift_endAccess();
  uint64_t v51 = v65;
  swift_beginAccess();
  v47(v51, v23);
  LOBYTE(v91) = v82;
  sub_25BC70C20();
  swift_endAccess();
  uint64_t v52 = v64;
  swift_beginAccess();
  v53 = *(void (**)(uint64_t, uint64_t))(v89 + 8);
  id v54 = v83;
  v53(v52, v90);
  id v91 = v54;
  sub_25BC70C20();
  swift_endAccess();
  swift_beginAccess();
  LOBYTE(v91) = v84;
  sub_25BC70C20();
  swift_endAccess();
  swift_beginAccess();
  LOBYTE(v91) = v85;
  sub_25BC70C20();
  swift_endAccess();
  swift_beginAccess();
  LOBYTE(v91) = v86;
  sub_25BC70C20();
  swift_endAccess();

  *(void *)(v16 + v72) = v87;
  swift_unknownObjectRelease();
  *(void *)(v16 + v73) = v88;
  swift_unknownObjectRelease();
  return v16;
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

uint64_t STSwiftUser.__allocating_init(dsid:persistenceSource:authenticationSource:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  size_t v6 = (void *)*MEMORY[0x263F67328];
  if (!a3)
  {
    id v7 = v6;
LABEL_7:
    unsigned __int8 v13 = 0;
    unsigned __int8 v14 = 0;
    int v15 = 0;
    unsigned __int8 v16 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0xE000000000000000;
    goto LABEL_10;
  }
  id v7 = v6;
  swift_unknownObjectRetain();
  uint64_t v8 = (void *)sub_25BC70CF0();
  id v9 = objc_msgSend(a3, sel_userDataWithIdentifier_, v8);

  if (!v9)
  {
    swift_unknownObjectRelease();
    goto LABEL_7;
  }
  id v10 = objc_msgSend(v9, sel_givenName);
  uint64_t v24 = a2;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v22 = sub_25BC70D20();
    unint64_t v23 = v12;
  }
  else
  {
    unint64_t v23 = 0xEA0000000000646CLL;
    uint64_t v22 = 0x6968632072756F79;
  }
  HIDWORD(v26) = objc_msgSend(v9, sel_hasPasscode);
  LODWORD(v26) = objc_msgSend(v9, sel_isParent);
  HIDWORD(v25) = objc_msgSend(v9, sel_isRemote);
  LOBYTE(v25) = objc_msgSend(v9, sel_screenTimeEnabled);
  unsigned __int8 v16 = objc_msgSend(v9, sel_syncingEnabled);
  id v19 = objc_msgSend(v9, sel_familyMemberType);

  int v15 = objc_msgSend(v9, sel_checkForUnsafePhotos);
  unsigned __int8 v14 = objc_msgSend(v9, sel_isCommunicationSafetyNotificationEnabled);
  unsigned __int8 v13 = objc_msgSend(v9, sel_isCommunicationSafetyAnalyticsEnabled);
  swift_unknownObjectRelease();

  id v7 = v19;
  uint64_t v18 = v23;
  a2 = v24;
  uint64_t v17 = (void *)v22;
LABEL_10:
  type metadata accessor for STSwiftUser();
  uint64_t v20 = swift_allocObject();
  STSwiftUser.init(identifier:givenName:hasPasscode:isParent:isRemoteUser:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:screenTimeEnabled:syncingEnabled:familyMemberType:persistenceSource:authenticationSource:)(a1, a2, v17, v18, SHIDWORD(v26), v26, SHIDWORD(v25), v15, v14, v13, v25, v16, v7, (uint64_t)a3, a4);
  return v20;
}

uint64_t type metadata accessor for STSwiftUser()
{
  uint64_t result = qword_26A553488;
  if (!qword_26A553488) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25BC5DF60()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_25BC5DF9C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a3)
  {
    id v7 = (void *)(v4 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_identifier);
    void *v7 = a1;
    v7[1] = a2;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v4 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_persistenceSource) = a3;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    *(void *)(v4 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_authenticationSource) = a4;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    uint64_t v8 = (void *)sub_25BC70CF0();
    id v9 = objc_msgSend(a3, sel_userDataWithIdentifier_, v8);

    if (v9)
    {
      id v10 = objc_msgSend(v9, sel_givenName);
      if (v10)
      {
        uint64_t v11 = v10;
        sub_25BC70D20();
      }
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_25BC70C70();
      objc_msgSend(v9, sel_hasPasscode);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_25BC70C70();
      objc_msgSend(v9, sel_isParent);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_25BC70C70();
      objc_msgSend(v9, sel_isRemote);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_25BC70C70();
      objc_msgSend(v9, sel_screenTimeEnabled);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_25BC70C70();
      objc_msgSend(v9, sel_syncingEnabled);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_25BC70C70();
      objc_msgSend(v9, sel_familyMemberType);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_25BC70C70();
      objc_msgSend(v9, sel_checkForUnsafePhotos);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_25BC70C70();
      objc_msgSend(v9, sel_isCommunicationSafetyNotificationEnabled);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_25BC70C70();
      objc_msgSend(v9, sel_isCommunicationSafetyAnalyticsEnabled);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_25BC70C70();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (qword_26A553150 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25BC70BF0();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A5537C8);
    oslog = sub_25BC70BD0();
    os_log_type_t v13 = sub_25BC70DF0();
    if (os_log_type_enabled(oslog, v13))
    {
      unsigned __int8 v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned __int8 v14 = 0;
      _os_log_impl(&dword_25BC58000, oslog, v13, "Persistence source not found for user update.", v14, 2u);
      MEMORY[0x261173820](v14, -1, -1);
    }
  }
}

uint64_t sub_25BC5E534()
{
  uint64_t v1 = sub_25BC70C90();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BC70CC0();
  uint64_t v5 = MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_persistenceSource);
  if (v9)
  {
    uint64_t v17 = v2;
    uint64_t v18 = v5;
    id v10 = *(void **)(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_backgroundPersistenceQueue);
    uint64_t v16 = v6;
    uint64_t v11 = swift_allocObject();
    swift_weakInit();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    *(void *)(v12 + 24) = v9;
    aBlock[4] = sub_25BC6016C;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25BC5F1F8;
    aBlock[3] = &block_descriptor_0;
    os_log_type_t v13 = _Block_copy(aBlock);
    swift_unknownObjectRetain_n();
    id v14 = v10;
    swift_retain();
    sub_25BC70CA0();
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_25BC6018C(&qword_26A553468, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A553470);
    sub_25BC601D4((unint64_t *)&qword_26A553478, &qword_26A553470);
    sub_25BC70EB0();
    MEMORY[0x261173010](0, v8, v4, v13);
    _Block_release(v13);

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v18);
    swift_release();
    return swift_release();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A553460);
    swift_allocObject();
    swift_retain();
    sub_25BC70C10();
    return swift_release();
  }
}

void sub_25BC5E8BC(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = Strong;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25BC70CF0();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_25BC70C60();
    swift_release();
    swift_release();
    uint64_t v6 = LOBYTE(aBlock[0]);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_25BC70C60();
    swift_release();
    swift_release();
    uint64_t v7 = LOBYTE(aBlock[0]);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_25BC70C60();
    swift_release();
    swift_release();
    uint64_t v8 = LOBYTE(aBlock[0]);
    aBlock[4] = sub_25BC612E0;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25BC5F18C;
    aBlock[3] = &block_descriptor_113;
    uint64_t v9 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(a2, sel_saveCommunicationSafetySettingsForDSID_checkForUnsafePhotos_communicationSafetyNotificationEnabled_communicationSafetyAnalyticsEnabled_completionHandler_, v5, v6, v7, v8, v9);
    _Block_release(v9);
    swift_release();
  }
  else
  {
    if (qword_26A553150 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_25BC70BF0();
    __swift_project_value_buffer(v10, (uint64_t)qword_26A5537C8);
    uint64_t v5 = sub_25BC70BD0();
    os_log_type_t v11 = sub_25BC70DF0();
    if (os_log_type_enabled(v5, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_25BC58000, v5, v11, "STFoundation user is deallocated before saving communication safety changes.", v12, 2u);
      MEMORY[0x261173820](v12, -1, -1);
    }
  }
}

void sub_25BC5EB90(void *a1)
{
  uint64_t v2 = sub_25BC70BF0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v6 = a1;
    if (qword_26A553150 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v2, (uint64_t)qword_26A5537C8);
    id v7 = a1;
    id v8 = a1;
    os_log_t v28 = (os_log_t)sub_25BC70BD0();
    os_log_type_t v9 = sub_25BC70DF0();
    if (os_log_type_enabled(v28, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v29 = (uint64_t)a1;
      os_log_t v30 = (os_log_t)v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      id v12 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5534B8);
      uint64_t v13 = sub_25BC70D30();
      uint64_t v29 = sub_25BC65EE4(v13, v14, (uint64_t *)&v30);
      sub_25BC70E90();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25BC58000, v28, v9, "Error saving Comm Safety settings: %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261173820](v11, -1, -1);
      MEMORY[0x261173820](v10, -1, -1);
    }
    else
    {

      os_log_t v26 = v28;
    }
  }
  else
  {
    if (qword_26A553150 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5537C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v15, v2);
    swift_retain_n();
    uint64_t v16 = sub_25BC70BD0();
    os_log_type_t v17 = sub_25BC70DE0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      os_log_t v28 = (os_log_t)swift_slowAlloc();
      os_log_t v30 = v28;
      *(_DWORD *)uint64_t v18 = 136315650;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_25BC70C60();
      swift_release();
      swift_release();
      if ((_BYTE)v29) {
        uint64_t v19 = 1702195828;
      }
      else {
        uint64_t v19 = 0x65736C6166;
      }
      if ((_BYTE)v29) {
        unint64_t v20 = 0xE400000000000000;
      }
      else {
        unint64_t v20 = 0xE500000000000000;
      }
      uint64_t v29 = sub_25BC65EE4(v19, v20, (uint64_t *)&v30);
      sub_25BC70E90();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v18 + 12) = 2080;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_25BC70C60();
      swift_release();
      swift_release();
      if ((_BYTE)v29) {
        uint64_t v21 = 1702195828;
      }
      else {
        uint64_t v21 = 0x65736C6166;
      }
      if ((_BYTE)v29) {
        unint64_t v22 = 0xE400000000000000;
      }
      else {
        unint64_t v22 = 0xE500000000000000;
      }
      uint64_t v29 = sub_25BC65EE4(v21, v22, (uint64_t *)&v30);
      sub_25BC70E90();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v18 + 22) = 2080;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_25BC70C60();
      swift_release();
      swift_release();
      if ((_BYTE)v29) {
        uint64_t v23 = 1702195828;
      }
      else {
        uint64_t v23 = 0x65736C6166;
      }
      if ((_BYTE)v29) {
        unint64_t v24 = 0xE400000000000000;
      }
      else {
        unint64_t v24 = 0xE500000000000000;
      }
      uint64_t v29 = sub_25BC65EE4(v23, v24, (uint64_t *)&v30);
      sub_25BC70E90();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_25BC58000, v16, v17, "User saved successfully checkForUnsafePhotos: %s, communicationSafetyNotificationEnabled: %s, communicationSafetyAnalyticsEnabled: %s", (uint8_t *)v18, 0x20u);
      os_log_t v25 = v28;
      swift_arrayDestroy();
      MEMORY[0x261173820](v25, -1, -1);
      MEMORY[0x261173820](v18, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

void sub_25BC5F18C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_25BC5F1F8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_25BC5F23C()
{
  return sub_25BC70C10();
}

void sub_25BC5F29C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  id v7 = self;
  swift_retain();
  id v8 = objc_msgSend(v7, sel_sharedController);
  os_log_type_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = sub_25BC61320;
  v9[4] = v6;
  v11[4] = sub_25BC613A0;
  v11[5] = v9;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_25BC5F7FC;
  v11[3] = &block_descriptor_122;
  uint64_t v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_performBackgroundTask_, v10);
  _Block_release(v10);
}

void sub_25BC5F3E8(void *a1, uint64_t a2, void (*a3)(void *, uint64_t))
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a2 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_identifier);
  uint64_t v6 = *(void *)(a2 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_identifier + 8);
  swift_bridgeObjectRetain();
  id v7 = (void *)sub_25BC5F688(v5, v6, a1);
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_25BC70C60();
    swift_release();
    swift_release();
    objc_msgSend(v7, sel_setIsCommunicationSafetySendingRestricted_, LOBYTE(v12[0]));
    swift_getKeyPath();
    swift_getKeyPath();
    sub_25BC70C60();
    swift_release();
    swift_release();
    objc_msgSend(v7, sel_setIsCommunicationSafetyReceivingRestricted_, LOBYTE(v12[0]));
    swift_getKeyPath();
    swift_getKeyPath();
    sub_25BC70C60();
    swift_release();
    swift_release();
    objc_msgSend(v7, sel_setIsCommunicationSafetyNotificationEnabled_, LOBYTE(v12[0]));
    swift_getKeyPath();
    swift_getKeyPath();
    sub_25BC70C60();
    swift_release();
    swift_release();
    objc_msgSend(v7, sel_setIsCommunicationSafetyAnalyticsEnabled_, LOBYTE(v12[0]));
    v12[0] = 0;
    if (objc_msgSend(a1, sel_save_, v12))
    {
      id v8 = v12[0];
      a3(0, 0);
    }
    else
    {
      id v9 = v12[0];
      uint64_t v10 = (void *)sub_25BC70B50();

      swift_willThrow();
      id v11 = v10;
      a3(v10, 1);
    }
  }
}

uint64_t sub_25BC5F688(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = 0;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = &v12;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_25BC613E4;
  *(void *)(v7 + 24) = v6;
  aBlock[4] = sub_25BC61400;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25BC600B4;
  aBlock[3] = &block_descriptor_131;
  id v8 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(a3, sel_performBlockAndWait_, v8);
  _Block_release(v8);
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a3)
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = v12;
    swift_release();
    return v10;
  }
  return result;
}

void sub_25BC5F7FC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_25BC5F864(char a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v6 = *(void **)(v3 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_authenticationSource);
  if (v6)
  {
    uint64_t v8 = qword_26A553150;
    swift_unknownObjectRetain();
    if (v8 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25BC70BF0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26A5537C8);
    uint64_t v10 = sub_25BC70BD0();
    os_log_type_t v11 = sub_25BC70DE0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_25BC58000, v10, v11, "Authenticating...", v12, 2u);
      MEMORY[0x261173820](v12, -1, -1);
    }

    swift_bridgeObjectRetain();
    uint64_t v13 = (void *)sub_25BC70CF0();
    swift_bridgeObjectRelease();
    v19[4] = a2;
    v19[5] = a3;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 1107296256;
    v19[2] = sub_25BC5FB0C;
    v19[3] = &block_descriptor_77;
    unint64_t v14 = _Block_copy(v19);
    swift_retain();
    swift_release();
    objc_msgSend(v6, sel_authenticateWithIdentifier_forced_completionHandler_, v13, a1 & 1, v14);
    _Block_release(v14);
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_26A553150 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25BC70BF0();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A5537C8);
    uint64_t v16 = sub_25BC70BD0();
    os_log_type_t v17 = sub_25BC70DF0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_25BC58000, v16, v17, "No authentication source found", v18, 2u);
      MEMORY[0x261173820](v18, -1, -1);
    }

    a2(0);
  }
}

uint64_t sub_25BC5FB0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t STSwiftUser.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__checkForUnsafePhotos;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533A8);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyNotificationEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyAnalyticsEnabled, v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5533D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode, v2);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent, v2);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser, v2);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled, v2);
  uint64_t v6 = v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A553410);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v0;
}

uint64_t STSwiftUser.__deallocating_deinit()
{
  STSwiftUser.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25BC5FDCC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for STSwiftUser();
  uint64_t result = sub_25BC70C00();
  *a1 = result;
  return result;
}

void sub_25BC5FE0C(uint64_t a1, uint64_t a2, id *a3)
{
  v22[1] = *(id *)MEMORY[0x263EF8340];
  id v6 = objc_msgSend(self, sel_fetchRequest);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5534C0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25BC71A90;
  sub_25BC6147C(0, &qword_26A5534C8);
  uint64_t v8 = MEMORY[0x263F8D310];
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  unint64_t v9 = sub_25BC61428();
  *(void *)(v7 + 32) = 1684632420;
  *(void *)(v7 + 40) = 0xE400000000000000;
  *(void *)(v7 + 96) = v8;
  *(void *)(v7 + 104) = v9;
  *(void *)(v7 + 64) = v9;
  *(void *)(v7 + 72) = a1;
  *(void *)(v7 + 80) = a2;
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)sub_25BC70DD0();
  objc_msgSend(v6, sel_setPredicate_, v10);

  v22[0] = 0;
  id v11 = objc_msgSend(v6, sel_execute_, v22);
  id v12 = v22[0];
  if (!v11)
  {
    id v18 = v22[0];
    uint64_t v19 = (void *)sub_25BC70B50();

    swift_willThrow();
LABEL_13:
    id v6 = *a3;
    *a3 = 0;
    goto LABEL_14;
  }
  uint64_t v13 = v11;
  sub_25BC6147C(0, &qword_26A5534D8);
  unint64_t v14 = sub_25BC70D90();
  id v15 = v12;

  if (!(v14 >> 62))
  {
    if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_25BC70FE0();
  swift_bridgeObjectRelease();
  if (!v20)
  {
LABEL_12:
    swift_bridgeObjectRelease();

    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_25BC70FE0();
  swift_bridgeObjectRelease();
  if (!v21)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
LABEL_4:
  if ((v14 & 0xC000000000000001) != 0)
  {
    id v16 = (id)MEMORY[0x261173140](0, v14);
  }
  else
  {
    if (!*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      __break(1u);
    }
    id v16 = *(id *)(v14 + 32);
  }
  id v17 = v16;
  swift_bridgeObjectRelease();

  id v6 = *a3;
  *a3 = v17;
LABEL_14:
}

uint64_t sub_25BC600B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_25BC600DC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

void sub_25BC600EC(uint64_t a1, uint64_t a2)
{
  sub_25BC5F29C(a1, a2, v2);
}

uint64_t sub_25BC600F4()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25BC6012C()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25BC6016C()
{
  sub_25BC5E8BC(*(void *)(v0 + 16), *(void **)(v0 + 24));
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

uint64_t sub_25BC6018C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25BC601D4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25BC60224()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_25BC60230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25BC5CB64(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__checkForUnsafePhotos, &qword_26A5533A8);
}

uint64_t sub_25BC60258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BC5CBD4(a1, a2, a3, a4, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__checkForUnsafePhotos, &qword_26A5533A8);
}

uint64_t sub_25BC60288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25BC5CB64(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyNotificationEnabled, &qword_26A5533A8);
}

uint64_t sub_25BC602B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BC5CBD4(a1, a2, a3, a4, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyNotificationEnabled, &qword_26A5533A8);
}

uint64_t sub_25BC602E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25BC5CB64(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyAnalyticsEnabled, &qword_26A5533A8);
}

uint64_t sub_25BC60308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BC5CBD4(a1, a2, a3, a4, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyAnalyticsEnabled, &qword_26A5533A8);
}

uint64_t sub_25BC60338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25BC5CB64(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName, &qword_26A5533D0);
}

uint64_t sub_25BC60360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BC5CBD4(a1, a2, a3, a4, &qword_26A5533D8, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName, &qword_26A5533D0);
}

uint64_t sub_25BC60390(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25BC5CB64(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode, &qword_26A5533A8);
}

uint64_t sub_25BC603B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BC5CBD4(a1, a2, a3, a4, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode, &qword_26A5533A8);
}

uint64_t sub_25BC603E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25BC5CB64(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent, &qword_26A5533A8);
}

uint64_t sub_25BC60410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BC5CBD4(a1, a2, a3, a4, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent, &qword_26A5533A8);
}

uint64_t sub_25BC60440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25BC5CB64(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser, &qword_26A5533A8);
}

uint64_t sub_25BC60468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BC5CBD4(a1, a2, a3, a4, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser, &qword_26A5533A8);
}

uint64_t sub_25BC60498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25BC5CB64(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled, &qword_26A5533A8);
}

uint64_t sub_25BC604C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BC5CBD4(a1, a2, a3, a4, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled, &qword_26A5533A8);
}

uint64_t sub_25BC604F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25BC5CB64(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled, &qword_26A5533A8);
}

uint64_t sub_25BC60518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BC5CBD4(a1, a2, a3, a4, &qword_26A5533B0, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled, &qword_26A5533A8);
}

uint64_t sub_25BC60548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25BC5CB64(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType, &qword_26A553410);
}

uint64_t sub_25BC60570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25BC5CBD4(a1, a2, a3, a4, &qword_26A553418, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType, &qword_26A553410);
}

uint64_t sub_25BC605A0()
{
  return type metadata accessor for STSwiftUser();
}

void sub_25BC605A8()
{
  sub_25BC61240(319, &qword_26A553498);
  if (v0 <= 0x3F)
  {
    sub_25BC61240(319, &qword_26A5534A0);
    if (v1 <= 0x3F)
    {
      sub_25BC61288();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for STSwiftUser(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for STSwiftUser);
}

uint64_t dispatch thunk of STSwiftUser.checkForUnsafePhotos.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of STSwiftUser.checkForUnsafePhotos.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of STSwiftUser.checkForUnsafePhotos.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of STSwiftUser.$checkForUnsafePhotos.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of STSwiftUser.$checkForUnsafePhotos.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of STSwiftUser.$checkForUnsafePhotos.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of STSwiftUser.communicationSafetyNotificationEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of STSwiftUser.communicationSafetyNotificationEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of STSwiftUser.communicationSafetyNotificationEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of STSwiftUser.$communicationSafetyNotificationEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of STSwiftUser.$communicationSafetyNotificationEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of STSwiftUser.$communicationSafetyNotificationEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of STSwiftUser.communicationSafetyAnalyticsEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of STSwiftUser.communicationSafetyAnalyticsEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of STSwiftUser.communicationSafetyAnalyticsEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of STSwiftUser.$communicationSafetyAnalyticsEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of STSwiftUser.$communicationSafetyAnalyticsEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of STSwiftUser.$communicationSafetyAnalyticsEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of STSwiftUser.givenName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of STSwiftUser.givenName.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of STSwiftUser.givenName.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of STSwiftUser.$givenName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of STSwiftUser.$givenName.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of STSwiftUser.$givenName.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of STSwiftUser.hasPasscode.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of STSwiftUser.hasPasscode.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of STSwiftUser.hasPasscode.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of STSwiftUser.$hasPasscode.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of STSwiftUser.$hasPasscode.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of STSwiftUser.$hasPasscode.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of STSwiftUser.isParent.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of STSwiftUser.isParent.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of STSwiftUser.isParent.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t dispatch thunk of STSwiftUser.$isParent.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

uint64_t dispatch thunk of STSwiftUser.$isParent.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of STSwiftUser.$isParent.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of STSwiftUser.isRemoteUser.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of STSwiftUser.isRemoteUser.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of STSwiftUser.isRemoteUser.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of STSwiftUser.$isRemoteUser.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 528))();
}

uint64_t dispatch thunk of STSwiftUser.$isRemoteUser.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

uint64_t dispatch thunk of STSwiftUser.$isRemoteUser.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t dispatch thunk of STSwiftUser.screenTimeEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 552))();
}

uint64_t dispatch thunk of STSwiftUser.screenTimeEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 560))();
}

uint64_t dispatch thunk of STSwiftUser.screenTimeEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 568))();
}

uint64_t dispatch thunk of STSwiftUser.$screenTimeEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 576))();
}

uint64_t dispatch thunk of STSwiftUser.$screenTimeEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 584))();
}

uint64_t dispatch thunk of STSwiftUser.$screenTimeEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 592))();
}

uint64_t dispatch thunk of STSwiftUser.syncingEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 600))();
}

uint64_t dispatch thunk of STSwiftUser.syncingEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 608))();
}

uint64_t dispatch thunk of STSwiftUser.syncingEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 616))();
}

uint64_t dispatch thunk of STSwiftUser.$syncingEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 624))();
}

uint64_t dispatch thunk of STSwiftUser.$syncingEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 632))();
}

uint64_t dispatch thunk of STSwiftUser.$syncingEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 640))();
}

uint64_t dispatch thunk of STSwiftUser.familyMemberType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 648))();
}

uint64_t dispatch thunk of STSwiftUser.familyMemberType.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 656))();
}

uint64_t dispatch thunk of STSwiftUser.familyMemberType.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 664))();
}

uint64_t dispatch thunk of STSwiftUser.$familyMemberType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 672))();
}

uint64_t dispatch thunk of STSwiftUser.$familyMemberType.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 680))();
}

uint64_t dispatch thunk of STSwiftUser.$familyMemberType.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 688))();
}

uint64_t dispatch thunk of STSwiftUser.__allocating_init(identifier:givenName:hasPasscode:isParent:isRemoteUser:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:screenTimeEnabled:syncingEnabled:familyMemberType:persistenceSource:authenticationSource:)()
{
  return (*(uint64_t (**)(void))(v0 + 768))();
}

uint64_t dispatch thunk of STSwiftUser.identifierString()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 776))();
}

uint64_t dispatch thunk of STSwiftUser.update(with:persistenceSource:authenticationSource:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 784))();
}

uint64_t dispatch thunk of STSwiftUser.save()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 792))();
}

uint64_t dispatch thunk of STSwiftUser.saveAsBackgroundTask()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 800))();
}

uint64_t dispatch thunk of STSwiftUser.authenticate(forced:completionHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 808))();
}

void sub_25BC61240(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_25BC70C80();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_25BC61288()
{
  if (!qword_26A5534A8)
  {
    type metadata accessor for STFamilyMemberType(255);
    unint64_t v0 = sub_25BC70C80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A5534A8);
    }
  }
}

void sub_25BC612E0(void *a1)
{
}

uint64_t sub_25BC612E8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BC61320(uint64_t a1, char a2)
{
  unint64_t v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  uint64_t v5 = a1;
  char v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_25BC61360()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25BC613A0(void *a1)
{
  sub_25BC5F3E8(a1, *(void *)(v1 + 16), *(void (**)(void *, uint64_t))(v1 + 24));
}

uint64_t sub_25BC613AC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25BC613E4()
{
  sub_25BC5FE0C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(id **)(v0 + 32));
}

uint64_t sub_25BC613F0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BC61400()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_25BC61428()
{
  unint64_t result = qword_26A5534D0;
  if (!qword_26A5534D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5534D0);
  }
  return result;
}

uint64_t sub_25BC6147C(uint64_t a1, unint64_t *a2)
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

void sub_25BC614D8()
{
  algn_26A553818[5] = 0;
  *(_WORD *)&algn_26A553818[6] = -5120;
}

id sub_25BC61504()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = *(id *)(v0 + 16);
  }
  else
  {
    if (qword_26A553168 != -1) {
      swift_once();
    }
    sub_25BC70D20();
    id v3 = objc_allocWithZone(MEMORY[0x263F53EE0]);
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_25BC70CF0();
    swift_bridgeObjectRelease();
    uint64_t v5 = (void *)sub_25BC70CF0();
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v3, sel_initWithName_sharedContainer_, v4, v5);

    uint64_t v7 = *(void **)(v0 + 16);
    *(void *)(v0 + 16) = v6;
    id v2 = v6;

    uint64_t v1 = 0;
  }
  id v8 = v1;
  return v2;
}

void sub_25BC61620()
{
  algn_26A553828[5] = 0;
  *(_WORD *)&algn_26A553828[6] = -5120;
}

id sub_25BC6164C()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (v1)
  {
    id v2 = *(id *)(v0 + 24);
  }
  else
  {
    if (qword_26A553170 != -1) {
      swift_once();
    }
    sub_25BC70D20();
    id v3 = objc_allocWithZone(MEMORY[0x263F53EE0]);
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_25BC70CF0();
    swift_bridgeObjectRelease();
    uint64_t v5 = (void *)sub_25BC70CF0();
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v3, sel_initWithName_sharedContainer_, v4, v5);

    uint64_t v7 = *(void **)(v0 + 24);
    *(void *)(v0 + 24) = v6;
    id v2 = v6;

    uint64_t v1 = 0;
  }
  id v8 = v1;
  return v2;
}

void sub_25BC61768()
{
  qword_26A553830 = 0x656D69746E776F64;
  *(void *)algn_26A553838 = 0xE800000000000000;
}

id sub_25BC6178C()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (v1)
  {
    id v2 = *(id *)(v0 + 32);
  }
  else
  {
    id v3 = sub_25BC617E4();
    uint64_t v4 = *(void **)(v0 + 32);
    *(void *)(v0 + 32) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

id sub_25BC617E4()
{
  id v0 = objc_msgSend(self, sel_storesForSharedContainer_, *MEMORY[0x263F67338]);
  uint64_t v1 = sub_25BC70DB0();

  if (qword_26A553178 != -1) {
    swift_once();
  }
  sub_25BC70D20();
  id v2 = objc_allocWithZone(MEMORY[0x263F53EE0]);
  swift_bridgeObjectRetain();
  id v3 = (void *)sub_25BC70CF0();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_25BC70CF0();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_initWithName_sharedContainer_, v3, v4);

  uint64_t v6 = qword_26A553830;
  uint64_t v7 = *(void *)algn_26A553838;
  swift_bridgeObjectRetain();
  LOBYTE(v6) = sub_25BC61968(v6, v7, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v6 & 1) == 0) {
    objc_msgSend(v5, sel_setActive_, 0);
  }
  return v5;
}

uint64_t sub_25BC61968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25BC710B0();
    sub_25BC70D40();
    uint64_t v6 = sub_25BC710F0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      id v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_25BC71040() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          id v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_25BC71040() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

id sub_25BC61AA0()
{
  uint64_t v1 = *(void **)(v0 + 40);
  if (v1)
  {
    id v2 = *(id *)(v0 + 40);
  }
  else
  {
    sub_25BC70D20();
    id v3 = objc_allocWithZone(MEMORY[0x263F53EE0]);
    uint64_t v4 = (void *)sub_25BC70CF0();
    id v5 = (void *)sub_25BC70CF0();
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v3, sel_initWithName_sharedContainer_, v4, v5);

    uint64_t v7 = *(void **)(v0 + 40);
    *(void *)(v0 + 40) = v6;
    id v2 = v6;

    uint64_t v1 = 0;
  }
  id v8 = v1;
  return v2;
}

id sub_25BC61B80()
{
  uint64_t v1 = *(void **)(v0 + 48);
  if (v1)
  {
    id v2 = *(id *)(v0 + 48);
  }
  else
  {
    sub_25BC70D20();
    id v3 = objc_allocWithZone(MEMORY[0x263F53EE0]);
    uint64_t v4 = (void *)sub_25BC70CF0();
    id v5 = (void *)sub_25BC70CF0();
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v3, sel_initWithName_sharedContainer_, v4, v5);

    uint64_t v7 = *(void **)(v0 + 48);
    *(void *)(v0 + 48) = v6;
    id v2 = v6;

    uint64_t v1 = 0;
  }
  id v8 = v1;
  return v2;
}

uint64_t static LocalRestrictions.LocalRestrictionsError.== infix(_:_:)()
{
  return 1;
}

uint64_t LocalRestrictions.LocalRestrictionsError.hash(into:)()
{
  return sub_25BC710C0();
}

uint64_t LocalRestrictions.LocalRestrictionsError.hashValue.getter()
{
  return sub_25BC710F0();
}

uint64_t sub_25BC61CD4()
{
  return 1;
}

uint64_t sub_25BC61CDC()
{
  return sub_25BC710F0();
}

uint64_t sub_25BC61D20()
{
  return sub_25BC710C0();
}

uint64_t sub_25BC61D48()
{
  return sub_25BC710F0();
}

uint64_t LocalRestrictions.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  uint64_t v1 = OBJC_IVAR____TtC15ScreenTimeSwift17LocalRestrictions_logger;
  if (qword_26A553158 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25BC70BF0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5537E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(v0 + v1, v3, v2);
  return v0;
}

uint64_t LocalRestrictions.init()()
{
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  uint64_t v1 = OBJC_IVAR____TtC15ScreenTimeSwift17LocalRestrictions_logger;
  if (qword_26A553158 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25BC70BF0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5537E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(v0 + v1, v3, v2);
  return v0;
}

void sub_25BC61F24()
{
  id v0 = sub_25BC61504();
  objc_msgSend(v0, sel_clearAllSettings);
}

void sub_25BC61F68(void *a1@<X8>)
{
  id v2 = sub_25BC61504();
  id v3 = objc_msgSend(v2, sel_userSafety);

  id v4 = objc_msgSend(v3, sel_scanningPolicy);
  if (!v4) {
    id v4 = objc_msgSend(self, sel_nonePolicy);
  }
  *a1 = v4;
}

void sub_25BC62004(id *a1)
{
  id v3 = *a1;
  id v1 = sub_25BC61504();
  id v2 = objc_msgSend(v1, sel_userSafety);

  objc_msgSend(v2, sel_setScanningPolicy_, v3);
}

id sub_25BC62088()
{
  id v0 = sub_25BC61504();
  id v1 = objc_msgSend(v0, sel_userSafety);

  id v2 = objc_msgSend(v1, sel_scanningPolicy);
  if (v2) {
    return v2;
  }
  id v4 = objc_msgSend(self, sel_nonePolicy);
  return v4;
}

void sub_25BC62128(void *a1)
{
  id v1 = sub_25BC61504();
  id v2 = objc_msgSend(v1, sel_userSafety);

  objc_msgSend(v2, sel_setScanningPolicy_, a1);
}

void (*sub_25BC621A0(void *a1))(void **a1, char a2)
{
  a1[1] = v1;
  id v3 = sub_25BC61504();
  id v4 = objc_msgSend(v3, sel_userSafety);

  id v5 = objc_msgSend(v4, sel_scanningPolicy);
  if (!v5) {
    id v5 = objc_msgSend(self, sel_nonePolicy);
  }
  *a1 = v5;
  return sub_25BC62258;
}

void sub_25BC62258(void **a1, char a2)
{
  id v2 = *a1;
  if (a2)
  {
    id v3 = v2;
    id v4 = sub_25BC61504();
    id v6 = objc_msgSend(v4, sel_userSafety);

    objc_msgSend(v6, sel_setScanningPolicy_, v3);
  }
  else
  {
    id v5 = sub_25BC61504();
    id v6 = objc_msgSend(v5, sel_userSafety);

    objc_msgSend(v6, sel_setScanningPolicy_, v2);
  }
}

void sub_25BC62324(char a1)
{
  id v2 = sub_25BC61AA0();
  id v3 = objc_msgSend(v2, sel_account);

  uint64_t v4 = a1 & 1;
  id v5 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v4);
  objc_msgSend(v3, sel_setDenyiCloudLogout_, v5);

  id v6 = sub_25BC61AA0();
  id v7 = objc_msgSend(v6, sel_dateAndTime);

  id v8 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v4);
  objc_msgSend(v7, sel_setRequireAutomaticDateAndTime_, v8);
}

void sub_25BC62428(void *a1)
{
  id v2 = sub_25BC61B80();
  id v3 = objc_msgSend(v2, sel_webContent);
  id v4 = sub_25BC68C08(a1);
  objc_msgSend(v3, sel_setBlockedByFilter_, v4);
}

void sub_25BC624B4(void *a1)
{
  if (a1 && (id v1 = objc_msgSend(a1, sel_payloadApps)) != 0)
  {
    id v2 = v1;
    uint64_t v3 = sub_25BC70D90();

    id v4 = sub_25BC6164C();
    id v5 = objc_msgSend(v4, sel_shield);

    uint64_t v6 = *(void *)(v3 + 16);
    if (v6)
    {
      unint64_t v19 = MEMORY[0x263F8EE78];
      sub_25BC70FA0();
      uint64_t v7 = v3 + 40;
      do
      {
        id v8 = objc_allocWithZone(MEMORY[0x263F53EB8]);
        swift_bridgeObjectRetain();
        uint64_t v9 = (void *)sub_25BC70CF0();
        swift_bridgeObjectRelease();
        objc_msgSend(v8, sel_initWithBundleIdentifier_, v9);

        sub_25BC70F80();
        sub_25BC70FB0();
        sub_25BC70FC0();
        sub_25BC70F90();
        v7 += 16;
        --v6;
      }
      while (v6);
LABEL_10:
      unint64_t v17 = v19;
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  else
  {
    id v10 = sub_25BC6164C();
    id v5 = objc_msgSend(v10, sel_shield);

    id v11 = objc_msgSend(self, sel_defaultAlwaysAllowBundleIDs);
    uint64_t v12 = sub_25BC70D90();

    uint64_t v13 = *(void *)(v12 + 16);
    if (v13)
    {
      unint64_t v19 = MEMORY[0x263F8EE78];
      sub_25BC70FA0();
      uint64_t v14 = v12 + 40;
      do
      {
        id v15 = objc_allocWithZone(MEMORY[0x263F53EB8]);
        swift_bridgeObjectRetain();
        id v16 = (void *)sub_25BC70CF0();
        swift_bridgeObjectRelease();
        objc_msgSend(v15, sel_initWithBundleIdentifier_, v16);

        sub_25BC70F80();
        sub_25BC70FB0();
        sub_25BC70FC0();
        sub_25BC70F90();
        v14 += 16;
        --v13;
      }
      while (v13);
      goto LABEL_10;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v17 = MEMORY[0x263F8EE78];
LABEL_12:
  sub_25BC69844(v17, &qword_26A5534E8, 0x263F53EB8, &qword_26A5534F0, &qword_26A553598);
  swift_bridgeObjectRelease();
  sub_25BC6147C(0, &qword_26A5534E8);
  sub_25BC69000(&qword_26A5534F0, &qword_26A5534E8);
  id v18 = (id)sub_25BC70DA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setUnshieldableApplications_, v18);
}

void sub_25BC627E4(char a1, char a2)
{
  id v2 = (id *)MEMORY[0x263F53E50];
  if ((a2 & 1) == 0) {
    id v2 = (id *)MEMORY[0x263F53E60];
  }
  if ((a1 & 1) == 0) {
    id v2 = (id *)MEMORY[0x263F53E70];
  }
  id v3 = *v2;
  id v4 = sub_25BC6178C();
  id v5 = objc_msgSend(v4, sel_screenTime);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5534F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25BC71E20;
  *(void *)(inited + 32) = objc_msgSend(self, sel_all);
  *(void *)(inited + 40) = v3;
  id v7 = v3;
  sub_25BC62954(inited);
  sub_25BC6147C(0, &qword_26A553500);
  type metadata accessor for MOScreenTimeShieldPolicy(0);
  sub_25BC69000(&qword_26A553508, &qword_26A553500);
  id v8 = (void *)sub_25BC70CD0();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setCategoryShieldPolicies_, v8);
}

unint64_t sub_25BC62954(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A553580);
  id v2 = (void *)sub_25BC71010();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (void **)(a1 + 40);
  while (1)
  {
    id v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_25BC672EC((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
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

unint64_t sub_25BC62A60(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A553548);
  id v2 = (void *)sub_25BC71010();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    id v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_25BC673DC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
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

uint64_t sub_25BC62B7C(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_storesForSharedContainer_, *MEMORY[0x263F67338]);
  uint64_t v3 = sub_25BC70DB0();

  if (qword_26A553178 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_26A553830;
  uint64_t v5 = *(void *)algn_26A553838;
  swift_bridgeObjectRetain();
  LOBYTE(v4) = sub_25BC61968(v4, v5, v3);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v4)
  {
    id v7 = sub_25BC6178C();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a1;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_25BC69060;
    *(void *)(v9 + 24) = v8;
    v11[4] = sub_25BC69078;
    v11[5] = v9;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    v11[2] = sub_25BC63094;
    v11[3] = &block_descriptor_1;
    char v10 = _Block_copy(v11);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_batchUpdate_, v10);

    _Block_release(v10);
    LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v7) {
      __break(1u);
    }
  }
  return result;
}

void sub_25BC62D90(id a1, unint64_t a2)
{
  if (a2 <= 4)
  {
    if (((1 << a2) & 0xB) != 0) {
      objc_msgSend(a1, sel_setActive_, 0);
    }
    else {
      objc_msgSend(a1, sel_setActive_, 1);
    }
    id v4 = objc_msgSend(a1, sel_shield);
    sub_25BC6147C(0, &qword_26A553558);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_25BC6147C(0, &qword_26A5534E8);
    uint64_t v6 = (void *)sub_25BC70D80();
    id v7 = objc_msgSend(ObjCClassFromMetadata, sel_allPolicyWithExcludedContent_, v6);

    objc_msgSend(v4, sel_setApplicationCategories_, v7);
    id v8 = objc_msgSend(a1, sel_shield);
    sub_25BC6147C(0, &qword_26A553570);
    uint64_t v9 = (void *)swift_getObjCClassFromMetadata();
    sub_25BC6147C(0, &qword_26A553560);
    char v10 = (void *)sub_25BC70D80();
    id v11 = objc_msgSend(v9, sel_allPolicyWithExcludedContent_, v10);

    objc_msgSend(v8, sel_setWebDomainCategories_, v11);
  }
}

void sub_25BC63094(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_25BC630E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = objc_msgSend(self, sel_storesForSharedContainer_, *MEMORY[0x263F67338]);
  uint64_t v9 = sub_25BC70DB0();

  sub_25BC70D20();
  id v10 = objc_allocWithZone(MEMORY[0x263F53EE0]);
  swift_bridgeObjectRetain();
  id v11 = (void *)sub_25BC70CF0();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_25BC70CF0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v10, sel_initWithName_sharedContainer_, v11, v12);

  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v9;
  v14[3] = a1;
  v14[4] = a2;
  v14[5] = a3;
  v14[6] = a4;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_25BC69108;
  *(void *)(v15 + 24) = v14;
  v18[4] = sub_25BC6B32C;
  v18[5] = v15;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 1107296256;
  v18[2] = sub_25BC63094;
  v18[3] = &block_descriptor_13_0;
  id v16 = _Block_copy(v18);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v13, sel_batchUpdate_, v16);

  _Block_release(v16);
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (a3) {
    __break(1u);
  }
  return result;
}

void sub_25BC63338(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((sub_25BC61968(a3, a4, a2) & 1) == 0) {
    objc_msgSend(a1, sel_setActive_, 0);
  }
  unint64_t v9 = 0x2654A3000uLL;
  id v10 = objc_msgSend(a1, sel_shield);
  if (a5)
  {
    uint64_t v11 = *(void *)(a5 + 16);
    unint64_t v12 = MEMORY[0x263F8EE78];
    if (v11)
    {
      unint64_t v24 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_25BC70FA0();
      uint64_t v13 = a5 + 40;
      do
      {
        id v14 = objc_allocWithZone(MEMORY[0x263F53EB8]);
        swift_bridgeObjectRetain();
        uint64_t v15 = (void *)sub_25BC70CF0();
        swift_bridgeObjectRelease();
        objc_msgSend(v14, sel_initWithBundleIdentifier_, v15);

        sub_25BC70F80();
        sub_25BC70FB0();
        sub_25BC70FC0();
        sub_25BC70F90();
        v13 += 16;
        --v11;
      }
      while (v11);
      unint64_t v12 = v24;
      swift_bridgeObjectRelease();
      unint64_t v9 = 0x2654A3000;
    }
  }
  else
  {
    unint64_t v12 = MEMORY[0x263F8EE78];
  }
  sub_25BC69844(v12, &qword_26A5534E8, 0x263F53EB8, &qword_26A5534F0, &qword_26A553598);
  swift_bridgeObjectRelease();
  sub_25BC6147C(0, &qword_26A5534E8);
  sub_25BC69000(&qword_26A5534F0, &qword_26A5534E8);
  id v16 = (void *)sub_25BC70DA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setUnshieldableApplications_, v16);

  id v17 = [a1 *(SEL *)(v9 + 2296)];
  if (a6)
  {
    uint64_t v18 = *(void *)(a6 + 16);
    unint64_t v19 = MEMORY[0x263F8EE78];
    if (v18)
    {
      unint64_t v25 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_25BC70FA0();
      uint64_t v20 = a6 + 40;
      do
      {
        id v21 = objc_allocWithZone(MEMORY[0x263F53F08]);
        swift_bridgeObjectRetain();
        unint64_t v22 = (void *)sub_25BC70CF0();
        swift_bridgeObjectRelease();
        objc_msgSend(v21, sel_initWithDomain_, v22);

        sub_25BC70F80();
        sub_25BC70FB0();
        sub_25BC70FC0();
        sub_25BC70F90();
        v20 += 16;
        --v18;
      }
      while (v18);
      unint64_t v19 = v25;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    unint64_t v19 = MEMORY[0x263F8EE78];
  }
  sub_25BC69844(v19, &qword_26A553560, 0x263F53F08, &qword_26A553568, &qword_26A553590);
  swift_bridgeObjectRelease();
  sub_25BC6147C(0, &qword_26A553560);
  sub_25BC69000(&qword_26A553568, &qword_26A553560);
  id v23 = (id)sub_25BC70DA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_setUnshieldableWebDomains_, v23);
}

uint64_t sub_25BC636EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  id v12 = objc_msgSend(self, sel_storesForSharedContainer_, *MEMORY[0x263F67338]);
  uint64_t v13 = sub_25BC70DB0();

  sub_25BC70D20();
  id v14 = objc_allocWithZone(MEMORY[0x263F53EE0]);
  swift_bridgeObjectRetain();
  uint64_t v15 = (void *)sub_25BC70CF0();
  swift_bridgeObjectRelease();
  id v16 = (void *)sub_25BC70CF0();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v14, sel_initWithName_sharedContainer_, v15, v16);

  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v13;
  *(void *)(v18 + 24) = a1;
  *(void *)(v18 + 32) = a2;
  *(void *)(v18 + 40) = v7;
  *(unsigned char *)(v18 + 48) = a6;
  *(unsigned char *)(v18 + 49) = a7;
  *(void *)(v18 + 56) = a3;
  *(void *)(v18 + 64) = a4;
  *(void *)(v18 + 72) = a5;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_25BC69188;
  *(void *)(v19 + 24) = v18;
  aBlock[4] = sub_25BC6B32C;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25BC63094;
  aBlock[3] = &block_descriptor_23;
  uint64_t v20 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v17, sel_batchUpdate_, v20);

  _Block_release(v20);
  LOBYTE(v20) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v20) {
    __break(1u);
  }
  return result;
}

void sub_25BC63978(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v15 = a9;
  uint64_t v14 = a10;
  if ((sub_25BC61968(a3, a4, a2) & 1) == 0) {
    objc_msgSend(a1, sel_setActive_, 0);
  }
  id v16 = (id *)MEMORY[0x263F53E50];
  if ((a7 & 1) == 0) {
    id v16 = (id *)MEMORY[0x263F53E60];
  }
  if ((a6 & 1) == 0) {
    id v16 = (id *)MEMORY[0x263F53E70];
  }
  id v129 = *v16;
  unint64_t v17 = 0x2654A3000uLL;
  id v18 = objc_msgSend(a1, sel_screenTime);
  uint64_t v19 = v18;
  uint64_t v20 = a1;
  v126 = a1;
  uint64_t v127 = a8;
  if (a8)
  {
    id v123 = v18;
    uint64_t v21 = *(void *)(a8 + 16);
    if (v21)
    {
      swift_bridgeObjectRetain_n();
      unint64_t v22 = (void *)MEMORY[0x263F8EE80];
      uint64_t v23 = a8 + 40;
      do
      {
        id v25 = objc_allocWithZone(MEMORY[0x263F53EB8]);
        swift_bridgeObjectRetain();
        os_log_t v26 = (void *)sub_25BC70CF0();
        id v27 = objc_msgSend(v25, sel_initWithBundleIdentifier_, v26);

        id v28 = v129;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v31 = sub_25BC6733C((uint64_t)v27);
        uint64_t v32 = v22[2];
        BOOL v33 = (v30 & 1) == 0;
        uint64_t v34 = v32 + v33;
        if (__OFADD__(v32, v33))
        {
          __break(1u);
LABEL_88:
          __break(1u);
LABEL_89:
          __break(1u);
LABEL_90:
          __break(1u);
LABEL_91:
          __break(1u);
LABEL_92:
          __break(1u);
LABEL_93:
          v122 = &qword_26A5534E8;
          goto LABEL_96;
        }
        char v35 = v30;
        if (v22[3] >= v34)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_25BC6791C(&qword_26A553578);
          }
        }
        else
        {
          sub_25BC6764C(v34, isUniquelyReferenced_nonNull_native, &qword_26A553578);
          unint64_t v36 = sub_25BC6733C((uint64_t)v27);
          if ((v35 & 1) != (v37 & 1)) {
            goto LABEL_93;
          }
          unint64_t v31 = v36;
        }
        uint64_t v38 = 8 * v31;
        if (v35)
        {
          uint64_t v24 = v22[7];

          *(void *)(v24 + v38) = v28;
        }
        else
        {
          v22[(v31 >> 6) + 8] |= 1 << v31;
          *(void *)(v22[6] + 8 * v31) = v27;
          *(void *)(v22[7] + 8 * v31) = v28;
          uint64_t v39 = v22[2];
          BOOL v40 = __OFADD__(v39, 1);
          uint64_t v41 = v39 + 1;
          if (v40) {
            goto LABEL_90;
          }
          id v22[2] = v41;
          id v42 = v27;
        }
        v23 += 16;
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        --v21;
      }
      while (v21);
      swift_bridgeObjectRelease();
      uint64_t v14 = a10;
      uint64_t v20 = v126;
      unint64_t v17 = 0x2654A3000;
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    sub_25BC6147C(0, &qword_26A5534E8);
    type metadata accessor for MOScreenTimeShieldPolicy(0);
    sub_25BC69000(&qword_26A5534F0, &qword_26A5534E8);
    v43 = (void *)sub_25BC70CD0();
    swift_bridgeObjectRelease();
    uint64_t v19 = v123;
  }
  else
  {
    v43 = 0;
  }
  objc_msgSend(v19, sel_setApplicationShieldPolicies_, v43);

  id v44 = [v20 *(SEL *)(v17 + 2336)];
  uint64_t v45 = v44;
  if (!a9)
  {
    v66 = 0;
    uint64_t v67 = v127;
    goto LABEL_43;
  }
  id v124 = v44;
  uint64_t v46 = *(void *)(a9 + 16);
  if (!v46)
  {
    swift_bridgeObjectRetain();
LABEL_42:
    swift_bridgeObjectRelease();
    sub_25BC6147C(0, &qword_26A553500);
    type metadata accessor for MOScreenTimeShieldPolicy(0);
    sub_25BC69000(&qword_26A553508, &qword_26A553500);
    v66 = (void *)sub_25BC70CD0();
    swift_bridgeObjectRelease();
    uint64_t v67 = v127;
    uint64_t v45 = v124;
LABEL_43:
    objc_msgSend(v45, sel_setCategoryShieldPolicies_, v66);

    id v68 = [v20 *(SEL *)(v17 + 2336)];
    v69 = v68;
    if (v14)
    {
      uint64_t v70 = *(void *)(v14 + 16);
      if (v70)
      {
        id v125 = v68;
        swift_bridgeObjectRetain_n();
        uint64_t v71 = (void *)MEMORY[0x263F8EE80];
        uint64_t v72 = v14 + 40;
        while (1)
        {
          id v75 = objc_allocWithZone(MEMORY[0x263F53F08]);
          swift_bridgeObjectRetain();
          v76 = (void *)sub_25BC70CF0();
          id v77 = objc_msgSend(v75, sel_initWithDomain_, v76);

          id v78 = v129;
          char v79 = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v81 = sub_25BC6738C((uint64_t)v77);
          uint64_t v82 = v71[2];
          BOOL v83 = (v80 & 1) == 0;
          uint64_t v84 = v82 + v83;
          if (__OFADD__(v82, v83)) {
            goto LABEL_89;
          }
          char v85 = v80;
          if (v71[3] >= v84)
          {
            if (v79)
            {
              if ((v80 & 1) == 0) {
                goto LABEL_55;
              }
            }
            else
            {
              sub_25BC6791C(&qword_26A553588);
              if ((v85 & 1) == 0) {
                goto LABEL_55;
              }
            }
          }
          else
          {
            sub_25BC6764C(v84, v79, &qword_26A553588);
            unint64_t v86 = sub_25BC6738C((uint64_t)v77);
            if ((v85 & 1) != (v87 & 1))
            {
              v122 = &qword_26A553560;
              goto LABEL_96;
            }
            unint64_t v81 = v86;
            if ((v85 & 1) == 0)
            {
LABEL_55:
              v71[(v81 >> 6) + 8] |= 1 << v81;
              uint64_t v88 = 8 * v81;
              *(void *)(v71[6] + v88) = v77;
              *(void *)(v71[7] + v88) = v78;
              uint64_t v89 = v71[2];
              BOOL v40 = __OFADD__(v89, 1);
              uint64_t v90 = v89 + 1;
              if (v40) {
                goto LABEL_92;
              }
              v71[2] = v90;
              id v91 = v77;
              goto LABEL_47;
            }
          }
          uint64_t v73 = v71[7];
          uint64_t v74 = 8 * v81;

          *(void *)(v73 + v74) = v78;
LABEL_47:
          v72 += 16;
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          if (!--v70)
          {
            swift_bridgeObjectRelease();
            uint64_t v15 = a9;
            v69 = v125;
            uint64_t v20 = v126;
            goto LABEL_62;
          }
        }
      }
      swift_bridgeObjectRetain();
LABEL_62:
      swift_bridgeObjectRelease();
      sub_25BC6147C(0, &qword_26A553560);
      type metadata accessor for MOScreenTimeShieldPolicy(0);
      sub_25BC69000(&qword_26A553568, &qword_26A553560);
      uint64_t v92 = (void *)sub_25BC70CD0();
      swift_bridgeObjectRelease();
      uint64_t v67 = v127;
    }
    else
    {
      uint64_t v92 = 0;
    }
    objc_msgSend(v69, sel_setWebDomainShieldPolicies_, v92);

    id v93 = objc_msgSend(v20, sel_shield);
    if (v67)
    {
      uint64_t v94 = *(void *)(v67 + 16);
      unint64_t v95 = MEMORY[0x263F8EE78];
      if (v94)
      {
        unint64_t v130 = MEMORY[0x263F8EE78];
        swift_bridgeObjectRetain();
        sub_25BC70FA0();
        uint64_t v96 = v67 + 40;
        do
        {
          id v97 = objc_allocWithZone(MEMORY[0x263F53EB8]);
          swift_bridgeObjectRetain();
          v98 = (void *)sub_25BC70CF0();
          swift_bridgeObjectRelease();
          objc_msgSend(v97, sel_initWithBundleIdentifier_, v98);

          sub_25BC70F80();
          sub_25BC70FB0();
          sub_25BC70FC0();
          sub_25BC70F90();
          v96 += 16;
          --v94;
        }
        while (v94);
        unint64_t v95 = v130;
        swift_bridgeObjectRelease();
        uint64_t v20 = v126;
      }
    }
    else
    {
      unint64_t v95 = MEMORY[0x263F8EE78];
    }
    sub_25BC69844(v95, &qword_26A5534E8, 0x263F53EB8, &qword_26A5534F0, &qword_26A553598);
    swift_bridgeObjectRelease();
    sub_25BC6147C(0, &qword_26A5534E8);
    sub_25BC69000(&qword_26A5534F0, &qword_26A5534E8);
    v99 = (void *)sub_25BC70DA0();
    swift_bridgeObjectRelease();
    objc_msgSend(v93, sel_setApplications_, v99);

    id v100 = objc_msgSend(v20, sel_shield);
    if (v15)
    {
      uint64_t v101 = *(void *)(v15 + 16);
      if (v101)
      {
        swift_bridgeObjectRetain();
        sub_25BC70FA0();
        uint64_t v102 = v15 + 40;
        do
        {
          swift_bridgeObjectRetain();
          v103 = (void *)sub_25BC70CF0();
          objc_msgSend(objc_allocWithZone(MEMORY[0x263F53EC8]), sel_initWithIdentifier_, v103);
          swift_bridgeObjectRelease();

          sub_25BC70F80();
          sub_25BC70FB0();
          sub_25BC70FC0();
          sub_25BC70F90();
          v102 += 16;
          --v101;
        }
        while (v101);
        swift_bridgeObjectRelease();
        uint64_t v20 = v126;
      }
    }
    sub_25BC6147C(0, &qword_26A553558);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_25BC6147C(0, &qword_26A553500);
    v105 = (void *)sub_25BC70D80();
    swift_bridgeObjectRelease();
    unint64_t v106 = MEMORY[0x263F8EE78];
    v107 = (void *)sub_25BC70D80();
    id v108 = objc_msgSend(ObjCClassFromMetadata, sel_specificPolicyWithCategories_excludedContent_, v105, v107);

    objc_msgSend(v100, sel_setApplicationCategories_, v108);
    id v109 = objc_msgSend(v20, sel_shield);
    if (a10)
    {
      uint64_t v110 = *(void *)(a10 + 16);
      if (v110)
      {
        unint64_t v131 = v106;
        swift_bridgeObjectRetain();
        sub_25BC70FA0();
        uint64_t v111 = a10 + 40;
        do
        {
          id v112 = objc_allocWithZone(MEMORY[0x263F53F08]);
          swift_bridgeObjectRetain();
          v113 = (void *)sub_25BC70CF0();
          swift_bridgeObjectRelease();
          objc_msgSend(v112, sel_initWithDomain_, v113);

          sub_25BC70F80();
          sub_25BC70FB0();
          sub_25BC70FC0();
          sub_25BC70F90();
          v111 += 16;
          --v110;
        }
        while (v110);
        unint64_t v106 = v131;
        swift_bridgeObjectRelease();
        uint64_t v20 = v126;
      }
    }
    sub_25BC69844(v106, &qword_26A553560, 0x263F53F08, &qword_26A553568, &qword_26A553590);
    swift_bridgeObjectRelease();
    sub_25BC6147C(0, &qword_26A553560);
    sub_25BC69000(&qword_26A553568, &qword_26A553560);
    v114 = (void *)sub_25BC70DA0();
    swift_bridgeObjectRelease();
    objc_msgSend(v109, sel_setWebDomains_, v114);

    id v115 = objc_msgSend(v20, sel_shield);
    if (a9)
    {
      uint64_t v116 = *(void *)(a9 + 16);
      if (v116)
      {
        swift_bridgeObjectRetain();
        sub_25BC70FA0();
        uint64_t v117 = a9 + 40;
        do
        {
          swift_bridgeObjectRetain();
          v118 = (void *)sub_25BC70CF0();
          objc_msgSend(objc_allocWithZone(MEMORY[0x263F53EC8]), sel_initWithIdentifier_, v118);
          swift_bridgeObjectRelease();

          sub_25BC70F80();
          sub_25BC70FB0();
          sub_25BC70FC0();
          sub_25BC70F90();
          v117 += 16;
          --v116;
        }
        while (v116);
        swift_bridgeObjectRelease();
      }
    }
    sub_25BC6147C(0, &qword_26A553570);
    v119 = (void *)swift_getObjCClassFromMetadata();
    v120 = (void *)sub_25BC70D80();
    swift_bridgeObjectRelease();
    v121 = (void *)sub_25BC70D80();
    id v128 = objc_msgSend(v119, sel_specificPolicyWithCategories_excludedContent_, v120, v121);

    objc_msgSend(v115, sel_setWebDomainCategories_, v128);

    return;
  }
  swift_bridgeObjectRetain_n();
  v47 = (void *)MEMORY[0x263F8EE80];
  uint64_t v48 = a9 + 40;
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v50 = (void *)sub_25BC70CF0();
    id v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F53EC8]), sel_initWithIdentifier_, v50);

    id v52 = v129;
    char v53 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v55 = sub_25BC672EC((uint64_t)v51);
    uint64_t v56 = v47[2];
    BOOL v57 = (v54 & 1) == 0;
    uint64_t v58 = v56 + v57;
    if (__OFADD__(v56, v57)) {
      goto LABEL_88;
    }
    char v59 = v54;
    if (v47[3] >= v58)
    {
      if ((v53 & 1) == 0) {
        sub_25BC6791C(&qword_26A553580);
      }
      goto LABEL_36;
    }
    sub_25BC6764C(v58, v53, &qword_26A553580);
    unint64_t v60 = sub_25BC672EC((uint64_t)v51);
    if ((v59 & 1) != (v61 & 1)) {
      break;
    }
    unint64_t v55 = v60;
LABEL_36:
    uint64_t v62 = 8 * v55;
    if (v59)
    {
      uint64_t v49 = v47[7];

      *(void *)(v49 + v62) = v52;
    }
    else
    {
      v47[(v55 >> 6) + 8] |= 1 << v55;
      *(void *)(v47[6] + 8 * v55) = v51;
      *(void *)(v47[7] + 8 * v55) = v52;
      uint64_t v63 = v47[2];
      BOOL v40 = __OFADD__(v63, 1);
      uint64_t v64 = v63 + 1;
      if (v40) {
        goto LABEL_91;
      }
      v47[2] = v64;
      id v65 = v51;
    }
    v48 += 16;
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    if (!--v46)
    {
      uint64_t v15 = a9;
      swift_bridgeObjectRelease();
      uint64_t v20 = v126;
      uint64_t v14 = a10;
      unint64_t v17 = 0x2654A3000;
      goto LABEL_42;
    }
  }
  v122 = &qword_26A553500;
LABEL_96:
  sub_25BC6147C(0, v122);
  sub_25BC71060();
  __break(1u);
}

void sub_25BC64834(uint64_t a1, uint64_t a2, char a3)
{
  id v6 = objc_msgSend(self, sel_storesForSharedContainer_, *MEMORY[0x263F67338]);
  uint64_t v7 = sub_25BC70DB0();

  LOBYTE(v6) = sub_25BC61968(a1, a2, v7);
  swift_bridgeObjectRelease();
  if (v6)
  {
    sub_25BC70D20();
    id v8 = objc_allocWithZone(MEMORY[0x263F53EE0]);
    swift_bridgeObjectRetain();
    unint64_t v9 = (void *)sub_25BC70CF0();
    swift_bridgeObjectRelease();
    id v10 = (void *)sub_25BC70CF0();
    swift_bridgeObjectRelease();
    id v11 = objc_msgSend(v8, sel_initWithName_sharedContainer_, v9, v10);

    objc_msgSend(v11, sel_setActive_, a3 & 1);
  }
}

void sub_25BC649A8()
{
  id v0 = objc_msgSend(self, sel_storesForSharedContainer_);
  uint64_t v1 = sub_25BC70DB0();

  int64_t v2 = 0;
  uint64_t v3 = *(void *)(v1 + 56);
  uint64_t v15 = v1 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t i = v5 & v3;
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  if ((v5 & v3) != 0) {
    goto LABEL_6;
  }
LABEL_7:
  int64_t v8 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
LABEL_28:
    __break(1u);
    return;
  }
  if (v8 < v7)
  {
    uint64_t v9 = *(void *)(v15 + 8 * v8);
    ++v2;
    if (v9) {
      goto LABEL_20;
    }
    int64_t v2 = v8 + 1;
    if (v8 + 1 >= v7) {
      goto LABEL_24;
    }
    uint64_t v9 = *(void *)(v15 + 8 * v2);
    if (v9) {
      goto LABEL_20;
    }
    int64_t v2 = v8 + 2;
    if (v8 + 2 >= v7) {
      goto LABEL_24;
    }
    uint64_t v9 = *(void *)(v15 + 8 * v2);
    if (v9)
    {
LABEL_20:
      for (uint64_t i = (v9 - 1) & v9; ; i &= i - 1)
      {
        swift_bridgeObjectRetain();
        if (sub_25BC70D60())
        {
          sub_25BC70D20();
          id v11 = objc_allocWithZone(MEMORY[0x263F53EE0]);
          id v12 = (void *)sub_25BC70CF0();
          swift_bridgeObjectRelease();
          uint64_t v13 = (void *)sub_25BC70CF0();
          swift_bridgeObjectRelease();
          id v14 = objc_msgSend(v11, sel_initWithName_sharedContainer_, v12, v13);

          objc_msgSend(v14, sel_setActive_, 0);
          if (!i) {
            goto LABEL_7;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          if (!i) {
            goto LABEL_7;
          }
        }
LABEL_6:
        ;
      }
    }
    int64_t v10 = v8 + 3;
    if (v10 < v7)
    {
      uint64_t v9 = *(void *)(v15 + 8 * v10);
      if (v9)
      {
        int64_t v2 = v10;
        goto LABEL_20;
      }
      while (1)
      {
        int64_t v2 = v10 + 1;
        if (__OFADD__(v10, 1)) {
          goto LABEL_28;
        }
        if (v2 >= v7) {
          break;
        }
        uint64_t v9 = *(void *)(v15 + 8 * v2);
        ++v10;
        if (v9) {
          goto LABEL_20;
        }
      }
    }
  }
LABEL_24:
  swift_release();
}

void sub_25BC64C34()
{
  id v0 = self;
  uint64_t v1 = *MEMORY[0x263F67338];
  id v2 = objc_msgSend(v0, sel_storesForSharedContainer_, *MEMORY[0x263F67338]);
  uint64_t v3 = sub_25BC70DB0();

  sub_25BC67ABC(v3);
  id v4 = (id)sub_25BC70DA0();
  objc_msgSend(v0, sel_deleteStoresWithStoreNames_sharedContainer_, v4, v1);
  swift_release();
}

void sub_25BC64D18()
{
  id v0 = self;
  id v1 = (id)sub_25BC70DA0();
  objc_msgSend(v0, sel_deleteStoresWithStoreNames_sharedContainer_, v1, *MEMORY[0x263F67338]);
}

uint64_t sub_25BC64DA0(uint64_t a1, char a2)
{
  id v5 = sub_25BC61504();
  uint64_t v6 = swift_allocObject();
  *(unsigned char *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a1;
  *(void *)(v6 + 32) = v2;
  *(void *)(v6 + 40) = &v13;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_25BC69214;
  *(void *)(v7 + 24) = v6;
  v12[4] = sub_25BC6B32C;
  v12[5] = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  id v12[2] = sub_25BC63094;
  v12[3] = &block_descriptor_33;
  int64_t v8 = _Block_copy(v12);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v5, sel_batchUpdate_, v8);

  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    if (v13)
    {
      id v11 = v13;
      swift_willThrow();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_25BC64F5C(id a1, char a2, unint64_t a3)
{
  if (a2) {
    objc_msgSend(a1, sel_clearAllSettings);
  }
  if (a3 >> 62) {
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_25BC70FE0())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v7 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x261173140](i - 4, a3) : *(id *)(a3 + 8 * i);
      int64_t v8 = v7;
      uint64_t v9 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      sub_25BC6511C(v7, a1);

      if (v9 == v5) {
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRelease();
}

void sub_25BC6511C(void *a1, void *a2)
{
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    id v4 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v5 = objc_msgSend(a2, sel_media);
    id v6 = objc_msgSend(v4, sel_payloadAllowTVProviderModification);
    objc_msgSend(v6, sel_BOOLValue);
    sub_25BC6147C(0, &qword_26A553530);
    id v7 = (id)sub_25BC70E50();

    objc_msgSend(v5, sel_setLockTVProvider_, v7);
LABEL_7:

    return;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    int64_t v8 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v5 = objc_msgSend(a2, sel_account);
    id v9 = objc_msgSend(v8, sel_payloadAllowAccountModification);
    objc_msgSend(v9, sel_BOOLValue);
    sub_25BC6147C(0, &qword_26A553530);
    id v7 = (id)sub_25BC70E50();

    objc_msgSend(v5, sel_setLockAccounts_, v7);
    goto LABEL_7;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    int64_t v10 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v5 = objc_msgSend(a2, sel_application);
    id v11 = objc_msgSend(v10, sel_payloadAllowAutomaticAppUpdates);
    objc_msgSend(v11, sel_BOOLValue);
    sub_25BC6147C(0, &qword_26A553530);
    id v7 = (id)sub_25BC70E50();

    objc_msgSend(v5, sel_setDenyBackgroundAppRefresh_, v7);
    goto LABEL_7;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    id v12 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_25BC699D4(v12, a2);
    return;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    id v13 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_25BC69D84(v13, a2);
    return;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    id v14 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_25BC6A2AC(v14, a2);
    return;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    uint64_t v15 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_25BC6A3F8(v15, a2);
    return;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    id v16 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v5 = objc_msgSend(a2, sel_passcode);
    id v17 = objc_msgSend(v16, sel_payloadAllowPasscodeModification);
    objc_msgSend(v17, sel_BOOLValue);
    sub_25BC6147C(0, &qword_26A553530);
    id v7 = (id)sub_25BC70E50();

    objc_msgSend(v5, sel_setLockPasscode_, v7);
    goto LABEL_7;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    id v18 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v5 = objc_msgSend(a2, sel_airDrop);
    id v19 = objc_msgSend(v18, sel_payloadAllowAirDrop);
    objc_msgSend(v19, sel_BOOLValue);
    sub_25BC6147C(0, &qword_26A553530);
    id v7 = (id)sub_25BC70E50();

    objc_msgSend(v5, sel_setDenyAirDrop_, v7);
    goto LABEL_7;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    uint64_t v20 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v5 = objc_msgSend(a2, sel_webContent);
    id v7 = sub_25BC68C08(v20);
    objc_msgSend(v5, sel_setBlockedByFilter_, v7);
    goto LABEL_7;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    uint64_t v21 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_25BC6A544(v21, a2);
    return;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    unint64_t v22 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v5 = objc_msgSend(a2, sel_carPlay);
    id v23 = objc_msgSend(v22, sel_payloadAllowVehicleUI);
    objc_msgSend(v23, sel_BOOLValue);
    sub_25BC6147C(0, &qword_26A553530);
    id v7 = (id)sub_25BC70E50();

    objc_msgSend(v5, sel_setDenyCarPlay_, v7);
    goto LABEL_7;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    uint64_t v24 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v5 = objc_msgSend(a2, sel_notification);
    id v25 = objc_msgSend(v24, sel_payloadAllowDriverDoNotDisturbModifications);
    objc_msgSend(v25, sel_BOOLValue);
    sub_25BC6147C(0, &qword_26A553530);
    id v7 = (id)sub_25BC70E50();

    objc_msgSend(v5, sel_setLockDriverDoNotDisturb_, v7);
    goto LABEL_7;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    os_log_t v26 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_25BC6A690(v26, a2);
    return;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    id v27 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_25BC6AAB8(v27, a2);
    return;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    id v28 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_25BC6ADC0(v28, a2);
    return;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    uint64_t v29 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_25BC6AFA0(v29, a2);
    return;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    char v30 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v5 = objc_msgSend(a2, sel_findMy);
    id v31 = objc_msgSend(v30, sel_payloadAllowFindMyFriendsModification);
    objc_msgSend(v31, sel_BOOLValue);
    sub_25BC6147C(0, &qword_26A553530);
    id v7 = (id)sub_25BC70E50();

    objc_msgSend(v5, sel_setLockFindMyFriends_, v7);
    goto LABEL_7;
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    self;
    uint64_t v32 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v5 = objc_msgSend(a2, sel_privacy);
    id v7 = objc_msgSend(v32, sel_payloadForceLimitAdTracking);
    objc_msgSend(v5, sel_setForceLimitAdTracking_, v7);
    goto LABEL_7;
  }
  self;
  if (!swift_dynamicCastObjCClass())
  {
    id v33 = a1;
    uint64_t v34 = sub_25BC70BD0();
    os_log_type_t v35 = sub_25BC70DF0();
    if (os_log_type_enabled(v34, v35))
    {
      unint64_t v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v42 = v37;
      *(_DWORD *)unint64_t v36 = 136315138;
      id v38 = objc_msgSend(v33, sel_debugDescription);
      uint64_t v39 = sub_25BC70D20();
      unint64_t v41 = v40;

      sub_25BC65EE4(v39, v41, &v42);
      sub_25BC70E90();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25BC58000, v34, v35, "Unsupported Declaration Type: %s. Failed to update ManagedSettings store.", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261173820](v37, -1, -1);
      MEMORY[0x261173820](v36, -1, -1);
    }
    else
    {
    }
    sub_25BC697F0();
    swift_allocError();
    swift_willThrow();
  }
}

id *LocalRestrictions.deinit()
{
  id v1 = (char *)v0 + OBJC_IVAR____TtC15ScreenTimeSwift17LocalRestrictions_logger;
  uint64_t v2 = sub_25BC70BF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t LocalRestrictions.__deallocating_deinit()
{
  id v1 = (char *)v0 + OBJC_IVAR____TtC15ScreenTimeSwift17LocalRestrictions_logger;
  uint64_t v2 = sub_25BC70BF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25BC65E08(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25BC65E44(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25BC65E6C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25BC65EE4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25BC70E90();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25BC65EE4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25BC65FB8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25BC6B2B4((uint64_t)v12, *a3);
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
      sub_25BC6B2B4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_25BC65FB8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25BC70EA0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25BC66174(a5, a6);
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
  uint64_t v8 = sub_25BC70F70();
  if (!v8)
  {
    sub_25BC70FD0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25BC71020();
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

uint64_t sub_25BC66174(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25BC6620C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25BC663EC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25BC663EC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25BC6620C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25BC66384(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25BC70F50();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25BC70FD0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25BC70D50();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25BC71020();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25BC70FD0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25BC66384(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A553540);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25BC663EC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A553540);
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
  uint64_t result = sub_25BC71020();
  __break(1u);
  return result;
}

unsigned char **sub_25BC6653C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_25BC6654C(void *a1, void *a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  int64_t v8 = v5;
  uint64_t v11 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v11 < 0) {
      uint64_t v12 = *v5;
    }
    else {
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v13 = a2;
    uint64_t v14 = sub_25BC70EF0();

    if (v14)
    {
      swift_bridgeObjectRelease();

      sub_25BC6147C(0, a3);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v36;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_25BC70EE0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v26 = sub_25BC66818(v12, result + 1, a5, a3);
    uint64_t v37 = v26;
    unint64_t v27 = *(void *)(v26 + 16);
    if (*(void *)(v26 + 24) <= v27)
    {
      uint64_t v32 = v27 + 1;
      id v33 = v13;
      sub_25BC66A1C(v32, a5);
      uint64_t v28 = v37;
    }
    else
    {
      uint64_t v28 = v26;
      id v29 = v13;
    }
    sub_25BC66CB8((uint64_t)v13, v28);
    *int64_t v8 = v28;
    swift_bridgeObjectRelease();
    *a1 = v13;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_25BC70E60();
    uint64_t v17 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v18 = v16 & ~v17;
    if ((*(void *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18))
    {
      sub_25BC6147C(0, a3);
      id v19 = *(id *)(*(void *)(v11 + 48) + 8 * v18);
      char v20 = sub_25BC70E70();

      if (v20)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v24 = *(void **)(*(void *)(*v5 + 48) + 8 * v18);
        *a1 = v24;
        id v25 = v24;
        return 0;
      }
      uint64_t v21 = ~v17;
      while (1)
      {
        unint64_t v18 = (v18 + 1) & v21;
        if (((*(void *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
          break;
        }
        id v22 = *(id *)(*(void *)(v11 + 48) + 8 * v18);
        char v23 = sub_25BC70E70();

        if (v23) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v38 = *v5;
    *size_t v5 = 0x8000000000000000;
    id v31 = a2;
    sub_25BC66D3C((uint64_t)v31, v18, isUniquelyReferenced_nonNull_native, a5, a3);
    *size_t v5 = v38;
    swift_bridgeObjectRelease();
    *a1 = v31;
  }
  return 1;
}

uint64_t sub_25BC66818(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    uint64_t v6 = sub_25BC70F30();
    uint64_t v19 = v6;
    sub_25BC70ED0();
    if (sub_25BC70F00())
    {
      sub_25BC6147C(0, a4);
      do
      {
        swift_dynamicCast();
        uint64_t v6 = v19;
        unint64_t v13 = *(void *)(v19 + 16);
        if (*(void *)(v19 + 24) <= v13)
        {
          sub_25BC66A1C(v13 + 1, a3);
          uint64_t v6 = v19;
        }
        uint64_t result = sub_25BC70E60();
        uint64_t v8 = v6 + 56;
        uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
        unint64_t v10 = result & ~v9;
        unint64_t v11 = v10 >> 6;
        if (((-1 << v10) & ~*(void *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          unint64_t v12 = __clz(__rbit64((-1 << v10) & ~*(void *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v14 = 0;
          unint64_t v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v16 = v11 == v15;
            if (v11 == v15) {
              unint64_t v11 = 0;
            }
            v14 |= v16;
            uint64_t v17 = *(void *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          unint64_t v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(void *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(void *)(*(void *)(v6 + 48) + 8 * v12) = v18;
        ++*(void *)(v6 + 16);
      }
      while (sub_25BC70F00());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v6;
}

uint64_t sub_25BC66A1C(uint64_t a1, uint64_t *a2)
{
  unint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_25BC70F20();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    char v30 = v2;
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
                unint64_t v3 = v30;
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
      uint64_t result = sub_25BC70E60();
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
  *unint64_t v3 = v6;
  return result;
}

unint64_t sub_25BC66CB8(uint64_t a1, uint64_t a2)
{
  sub_25BC70E60();
  unint64_t result = sub_25BC70EC0();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_25BC66D3C(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, unint64_t *a5)
{
  unint64_t v9 = *(void *)(*v5 + 16);
  unint64_t v10 = *(void *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v11 = v9 + 1;
  if (a3)
  {
    sub_25BC66A1C(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_25BC66ED0(a4);
      goto LABEL_14;
    }
    sub_25BC67074(v11, a4);
  }
  uint64_t v12 = *v5;
  uint64_t v13 = sub_25BC70E60();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_25BC6147C(0, a5);
    id v15 = *(id *)(*(void *)(v12 + 48) + 8 * a2);
    char v16 = sub_25BC70E70();

    if (v16)
    {
LABEL_13:
      sub_25BC71050();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v12 + 48) + 8 * a2);
        char v19 = sub_25BC70E70();

        if (v19) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v20 + 48) + 8 * a2) = a1;
  uint64_t v21 = *(void *)(v20 + 16);
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v23;
  }
}

id sub_25BC66ED0(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25BC70F10();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
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
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v10);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    id v18 = *(void **)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v14) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25BC67074(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_25BC70F20();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v3 = v6;
    return result;
  }
  uint64_t v29 = v2;
  uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v8 = v4 + 56;
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
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    id v21 = *(id *)(*(void *)(v4 + 48) + 8 * v17);
    uint64_t result = sub_25BC70E60();
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
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
    ++*(void *)(v6 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v3 = v29;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_25BC672EC(uint64_t a1)
{
  uint64_t v2 = sub_25BC70E60();
  return sub_25BC67454(a1, v2, &qword_26A553500);
}

unint64_t sub_25BC6733C(uint64_t a1)
{
  uint64_t v2 = sub_25BC70E60();
  return sub_25BC67454(a1, v2, &qword_26A5534E8);
}

unint64_t sub_25BC6738C(uint64_t a1)
{
  uint64_t v2 = sub_25BC70E60();
  return sub_25BC67454(a1, v2, &qword_26A553560);
}

unint64_t sub_25BC673DC(uint64_t a1, uint64_t a2)
{
  sub_25BC710B0();
  sub_25BC70D40();
  uint64_t v4 = sub_25BC710F0();
  return sub_25BC67568(a1, a2, v4);
}

unint64_t sub_25BC67454(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a2 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_25BC6147C(0, a3);
    id v7 = *(id *)(*(void *)(v3 + 48) + 8 * i);
    char v8 = sub_25BC70E70();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v5;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * i);
        char v11 = sub_25BC70E70();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_25BC67568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25BC71040() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25BC71040() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25BC6764C(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v7 = sub_25BC71000();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v37 = v3;
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v15 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v22 = v21 | (v15 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v12) {
      break;
    }
    unint64_t v24 = (void *)(v6 + 64);
    unint64_t v25 = *(void *)(v38 + 8 * v23);
    ++v15;
    if (!v25)
    {
      int64_t v15 = v23 + 1;
      if (v23 + 1 >= v12) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v38 + 8 * v15);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v37;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v38 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v15 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v15 >= v12) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v38 + 8 * v15);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v15 = v26;
      }
    }
LABEL_30:
    unint64_t v11 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_31:
    uint64_t v31 = 8 * v22;
    uint64_t v32 = *(void **)(*(void *)(v6 + 48) + v31);
    id v33 = *(void **)(*(void *)(v6 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      id v34 = v32;
      id v35 = v33;
    }
    uint64_t result = sub_25BC70E60();
    uint64_t v16 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v18 == v28;
        if (v18 == v28) {
          unint64_t v18 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v13 + 8 * v18);
      }
      while (v30 == -1);
      unint64_t v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t v20 = 8 * v19;
    *(void *)(*(void *)(v8 + 48) + v20) = v32;
    *(void *)(*(void *)(v8 + 56) + v20) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v37;
  unint64_t v24 = (void *)(v6 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v36 = 1 << *(unsigned char *)(v6 + 32);
  if (v36 >= 64) {
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v36;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

id sub_25BC6791C(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25BC70FF0();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
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
    int64_t v21 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v14) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v21);
    ++v10;
    if (!v22)
    {
      int64_t v10 = v21 + 1;
      if (v21 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v7 + 8 * v10);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    unint64_t v18 = *(void **)(*(void *)(v3 + 48) + v17);
    unint64_t v19 = *(void **)(*(void *)(v3 + 56) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    *(void *)(*(void *)(v5 + 56) + v17) = v19;
    id v20 = v18;
    id result = v19;
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v14) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v7 + 8 * v23);
  if (v22)
  {
    int64_t v10 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v10);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25BC67ABC(uint64_t isStackAllocationSafe)
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
    uint64_t v6 = sub_25BC67C20((uint64_t)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v4, v2);
    swift_release();
    if (v1) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v6 = sub_25BC67C20((uint64_t)v7, v4, v2);
    swift_release();
    MEMORY[0x261173820](v7, -1, -1);
  }
  return v6;
}

uint64_t sub_25BC67C20(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v22 = (unint64_t *)result;
  uint64_t v23 = 0;
  int64_t v4 = 0;
  uint64_t v5 = a3 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a3 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    unint64_t v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v11 = v10 | (v4 << 6);
LABEL_18:
    unint64_t v15 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v11);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = qword_26A553168;
    swift_bridgeObjectRetain();
    if (v18 != -1) {
      swift_once();
    }
    BOOL v19 = v17 == qword_26A553810 && v16 == *(void *)algn_26A553818;
    if (v19
      || (sub_25BC71040() & 1) != 0
      || v17 == 0xD00000000000001FLL && v16 == 0x800000025BC739C0
      || (sub_25BC71040() & 1) != 0
      || v17 == 0xD000000000000020 && v16 == 0x800000025BC739E0)
    {
      id result = swift_bridgeObjectRelease();
    }
    else
    {
      char v20 = sub_25BC71040();
      id result = swift_bridgeObjectRelease();
      if ((v20 & 1) == 0)
      {
        *(unint64_t *)((char *)v22 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
        BOOL v12 = __OFADD__(v23++, 1);
        if (v12) {
          goto LABEL_42;
        }
      }
    }
  }
  BOOL v12 = __OFADD__(v4++, 1);
  if (v12)
  {
    __break(1u);
    goto LABEL_41;
  }
  if (v4 >= v9) {
    goto LABEL_39;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v4);
  if (v13)
  {
LABEL_17:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
    goto LABEL_18;
  }
  int64_t v14 = v4 + 1;
  if (v4 + 1 >= v9) {
    goto LABEL_39;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13) {
    goto LABEL_16;
  }
  int64_t v14 = v4 + 2;
  if (v4 + 2 >= v9) {
    goto LABEL_39;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13) {
    goto LABEL_16;
  }
  int64_t v14 = v4 + 3;
  if (v4 + 3 >= v9)
  {
LABEL_39:
    swift_retain();
    return sub_25BC67EFC(v22, a2, v23, a3);
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
LABEL_16:
    int64_t v4 = v14;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      goto LABEL_39;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_17;
    }
  }
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_25BC67EFC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A553550);
  uint64_t result = sub_25BC70F40();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_25BC710B0();
    swift_bridgeObjectRetain();
    sub_25BC70D40();
    uint64_t result = sub_25BC710F0();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    unint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *unint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
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
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

void sub_25BC68194(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_25BC70E60();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  uint64_t v10 = v6 + 56;
  if ((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    sub_25BC6147C(0, &qword_26A553560);
    id v11 = *(id *)(*(void *)(v6 + 48) + 8 * v9);
    char v12 = sub_25BC70E70();

    if (v12)
    {
      uint64_t v13 = 0;
      char v14 = 1;
    }
    else
    {
      uint64_t v15 = ~v8;
      unint64_t v9 = (v9 + 1) & v15;
      if ((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
      {
        uint64_t v13 = 1;
        while (1)
        {
          id v16 = *(id *)(*(void *)(v6 + 48) + 8 * v9);
          char v14 = sub_25BC70E70();

          if (v14) {
            break;
          }
          unint64_t v9 = (v9 + 1) & v15;
          if (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
            goto LABEL_12;
          }
        }
        uint64_t v13 = 0;
      }
      else
      {
        char v14 = 0;
        uint64_t v13 = 1;
      }
    }
LABEL_12:
    char v3 = v2;
  }
  else
  {
    char v14 = 0;
    uint64_t v13 = 1;
  }
  uint64_t v17 = *(void *)(v6 + 16);
  uint64_t v18 = v17 + v13;
  if (__OFADD__(v17, v13)) {
    goto LABEL_36;
  }
  uint64_t v19 = *(void *)(v6 + 24);
  if (v19 >= v18 && (a2 & 1) != 0)
  {
    if ((v14 & 1) == 0) {
      goto LABEL_32;
    }
LABEL_30:
    *(void *)(*(void *)(*v3 + 48) + 8 * v9) = a1;
    return;
  }
  if (a2)
  {
    sub_25BC66A1C(v18, &qword_26A553590);
  }
  else
  {
    if (v19 >= v18)
    {
      sub_25BC66ED0(&qword_26A553590);
      if (v14) {
        goto LABEL_30;
      }
      goto LABEL_32;
    }
    sub_25BC67074(v18, &qword_26A553590);
  }
  uint64_t v20 = *v3;
  uint64_t v21 = sub_25BC70E60();
  uint64_t v22 = -1 << *(unsigned char *)(v20 + 32);
  unint64_t v9 = v21 & ~v22;
  if (((*(void *)(v20 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
    if ((v14 & 1) == 0) {
      goto LABEL_32;
    }
    goto LABEL_35;
  }
  unint64_t v23 = v3;
  sub_25BC6147C(0, &qword_26A553560);
  id v24 = *(id *)(*(void *)(v20 + 48) + 8 * v9);
  char v25 = sub_25BC70E70();

  if (v25)
  {
LABEL_29:
    char v3 = v23;
    if (v14) {
      goto LABEL_30;
    }
    goto LABEL_35;
  }
  uint64_t v26 = ~v22;
  while (1)
  {
    unint64_t v9 = (v9 + 1) & v26;
    if (((*(void *)(v20 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
      break;
    }
    id v27 = *(id *)(*(void *)(v20 + 48) + 8 * v9);
    char v28 = sub_25BC70E70();

    if (v28) {
      goto LABEL_29;
    }
  }
  char v3 = v23;
  if (v14)
  {
LABEL_35:
    sub_25BC6147C(0, &qword_26A553560);
    sub_25BC71050();
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
LABEL_32:
  uint64_t v29 = *v3;
  *(void *)(*v3 + 8 * (v9 >> 6) + 56) |= 1 << v9;
  *(void *)(*(void *)(v29 + 48) + 8 * v9) = a1;
  uint64_t v30 = *(void *)(v29 + 16);
  BOOL v31 = __OFADD__(v30, 1);
  uint64_t v32 = v30 + 1;
  if (!v31)
  {
    *(void *)(v29 + 16) = v32;
    return;
  }
LABEL_37:
  __break(1u);
}

void sub_25BC684B0(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25BC70FE0();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A553590);
      uint64_t v3 = sub_25BC70F40();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_25BC70FE0();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = MEMORY[0x261173140](v8, v1);
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        uint64_t v12 = sub_25BC70E60();
        uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)(v7 + 8 * v15) = v17 | v16;
        *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
        uint64_t v23 = *(void *)(v3 + 16);
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        *(void *)(v3 + 16) = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_25BC6147C(0, &qword_26A553560);
      id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
      char v19 = sub_25BC70E70();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_25BC70E70();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      unint64_t v1 = v41;
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v40 = v1 + 32;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    id v26 = *(id *)(v40 + 8 * v25);
    uint64_t v27 = sub_25BC70E60();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_25BC6147C(0, &qword_26A553560);
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_25BC70E70();

      if (v34)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v35 = ~v28;
      while (1)
      {
        unint64_t v29 = (v29 + 1) & v35;
        unint64_t v30 = v29 >> 6;
        uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
        uint64_t v32 = 1 << v29;
        if ((v31 & (1 << v29)) == 0) {
          break;
        }
        id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
        char v37 = sub_25BC70E70();

        if (v37) {
          goto LABEL_24;
        }
      }
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_38;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v43) {
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

uint64_t sub_25BC6880C(unint64_t a1)
{
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) == 0)
  {
LABEL_2:
    uint64_t v2 = MEMORY[0x263F8EE88];
    if (!(a1 >> 62)) {
      goto LABEL_3;
    }
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t result = sub_25BC70FE0();
    uint64_t v3 = result;
    if (result) {
      goto LABEL_4;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    return v2;
  }
LABEL_18:
  if (!sub_25BC70FE0()) {
    goto LABEL_2;
  }
  sub_25BC684B0(MEMORY[0x263F8EE78]);
  uint64_t v2 = v18;
  if (a1 >> 62) {
    goto LABEL_20;
  }
LABEL_3:
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v3) {
    goto LABEL_21;
  }
LABEL_4:
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x261173140](v5, a1);
      }
      else {
        id v9 = *(id *)(a1 + 8 * v5 + 32);
      }
      BOOL v10 = v9;
      id v11 = objc_msgSend(v9, sel_payloadAddress);
      sub_25BC70D20();

      id v12 = objc_allocWithZone(MEMORY[0x263F53F08]);
      uint64_t v13 = (void *)sub_25BC70CF0();
      swift_bridgeObjectRelease();
      id v14 = objc_msgSend(v12, sel_initWithDomain_, v13);

      if ((v2 & 0xC000000000000001) != 0)
      {
        if (v2 < 0) {
          uint64_t v15 = v2;
        }
        else {
          uint64_t v15 = v2 & 0xFFFFFFFFFFFFFF8;
        }
        swift_bridgeObjectRetain();
        uint64_t v16 = sub_25BC70EE0();
        swift_bridgeObjectRelease();
        if (__OFADD__(v16, 1))
        {
          __break(1u);
          goto LABEL_18;
        }
        uint64_t v19 = sub_25BC66818(v15, v16 + 1, &qword_26A553590, &qword_26A553560);
        sub_25BC68194((uint64_t)v14, 1);
        uint64_t v8 = v17;
        uint64_t v2 = v19;
      }
      else
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_25BC68194((uint64_t)v14, isUniquelyReferenced_nonNull_native);
        uint64_t v8 = v7;

        swift_bridgeObjectRelease();
      }

      if (v3 == ++v5) {
        goto LABEL_21;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25BC68A48(uint64_t a1)
{
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0)
  {
LABEL_15:
    if (sub_25BC70FE0())
    {
      sub_25BC684B0(MEMORY[0x263F8EE78]);
      uint64_t v2 = v14;
      uint64_t v3 = *(void *)(a1 + 16);
      if (v3) {
        goto LABEL_3;
      }
      return v2;
    }
  }
  uint64_t v2 = MEMORY[0x263F8EE88];
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
LABEL_3:
    swift_bridgeObjectRetain();
    for (a1 += 40; ; a1 += 16)
    {
      id v7 = objc_allocWithZone(MEMORY[0x263F53F08]);
      swift_bridgeObjectRetain();
      uint64_t v8 = (void *)sub_25BC70CF0();
      swift_bridgeObjectRelease();
      id v9 = objc_msgSend(v7, sel_initWithDomain_, v8);

      if ((v2 & 0xC000000000000001) != 0)
      {
        if (v2 < 0) {
          uint64_t v10 = v2;
        }
        else {
          uint64_t v10 = v2 & 0xFFFFFFFFFFFFFF8;
        }
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_25BC70EE0();
        swift_bridgeObjectRelease();
        if (__OFADD__(v11, 1))
        {
          __break(1u);
          goto LABEL_15;
        }
        uint64_t v15 = sub_25BC66818(v10, v11 + 1, &qword_26A553590, &qword_26A553560);
        sub_25BC68194((uint64_t)v9, 1);
        uint64_t v2 = v15;
      }
      else
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_25BC68194((uint64_t)v9, isUniquelyReferenced_nonNull_native);
        uint64_t v6 = v5;
        swift_bridgeObjectRelease();
      }
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return v2;
      }
    }
  }
  return v2;
}

id sub_25BC68C08(void *a1)
{
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_nonePolicy);
  id v4 = objc_msgSend(a1, sel_payloadRestrictWeb);
  unsigned int v5 = objc_msgSend(v4, sel_BOOLValue);

  if (v5)
  {
    id v6 = objc_msgSend(a1, sel_payloadWhiteListEnabled);
    unsigned int v7 = objc_msgSend(v6, sel_BOOLValue);

    if (v7)
    {
      id v8 = objc_msgSend(a1, sel_payloadSiteWhiteList);
      if (v8)
      {
        id v9 = v8;
        sub_25BC6147C(0, &qword_26A5535A0);
        unint64_t v10 = sub_25BC70D90();
      }
      else
      {
        unint64_t v10 = MEMORY[0x263F8EE78];
      }
      sub_25BC6880C(v10);
      swift_bridgeObjectRelease();
      sub_25BC6147C(0, &qword_26A553560);
      sub_25BC69000(&qword_26A553568, &qword_26A553560);
      uint64_t v17 = (void *)sub_25BC70DA0();
      swift_bridgeObjectRelease();
      id v18 = objc_msgSend(v2, sel_allPolicyWithExceptions_, v17);
    }
    else
    {
      id v11 = objc_msgSend(a1, sel_payloadUseContentFilter);
      unsigned int v12 = objc_msgSend(v11, sel_BOOLValue);

      id v13 = objc_msgSend(a1, sel_payloadFilterBlackList);
      uint64_t v14 = v13;
      if (v12)
      {
        if (v13)
        {
          uint64_t v15 = sub_25BC70D90();
        }
        else
        {
          uint64_t v15 = MEMORY[0x263F8EE78];
        }
        sub_25BC68A48(v15);
        swift_bridgeObjectRelease();
        sub_25BC6147C(0, &qword_26A553560);
        sub_25BC69000(&qword_26A553568, &qword_26A553560);
        uint64_t v19 = (void *)sub_25BC70DA0();
        swift_bridgeObjectRelease();
        id v20 = objc_msgSend(a1, sel_payloadFilterWhiteList);
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = sub_25BC70D90();
        }
        else
        {
          uint64_t v22 = MEMORY[0x263F8EE78];
        }
        sub_25BC68A48(v22);
        swift_bridgeObjectRelease();
        uint64_t v17 = (void *)sub_25BC70DA0();
        swift_bridgeObjectRelease();
        id v23 = objc_msgSend(v2, sel_autoPolicyWithDomains_exceptions_, v19, v17);

        goto LABEL_20;
      }
      if (v13)
      {
        uint64_t v16 = sub_25BC70D90();
      }
      else
      {
        uint64_t v16 = MEMORY[0x263F8EE78];
      }
      sub_25BC68A48(v16);
      swift_bridgeObjectRelease();
      sub_25BC6147C(0, &qword_26A553560);
      sub_25BC69000(&qword_26A553568, &qword_26A553560);
      uint64_t v17 = (void *)sub_25BC70DA0();
      swift_bridgeObjectRelease();
      id v18 = objc_msgSend(v2, sel_specificPolicyWithDomains_, v17);
    }
    id v23 = v18;
LABEL_20:

    id v3 = v23;
  }
  if (!objc_msgSend(v3, sel_policy))
  {

    return 0;
  }
  return v3;
}

uint64_t sub_25BC69000(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25BC6147C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25BC69050()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25BC69060(void *a1)
{
  sub_25BC62D90(a1, *(void *)(v1 + 16));
}

uint64_t sub_25BC69068()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BC69078()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_25BC690B8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_25BC69108(void *a1)
{
  sub_25BC63338(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_25BC69118()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BC69128()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

void sub_25BC69188(void *a1)
{
  sub_25BC63978(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(unsigned char *)(v1 + 48), *(unsigned char *)(v1 + 49), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72));
}

uint64_t sub_25BC691C4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25BC691D4()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25BC69214(void *a1)
{
  return sub_25BC64F5C(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25BC69224()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_25BC69238()
{
  unint64_t result = qword_26A553510;
  if (!qword_26A553510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A553510);
  }
  return result;
}

uint64_t sub_25BC69294()
{
  return type metadata accessor for LocalRestrictions();
}

uint64_t type metadata accessor for LocalRestrictions()
{
  uint64_t result = qword_26A553518;
  if (!qword_26A553518) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25BC692E8()
{
  uint64_t result = sub_25BC70BF0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for LocalRestrictions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LocalRestrictions);
}

uint64_t dispatch thunk of LocalRestrictions.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of LocalRestrictions.removeAllRestrictions()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of LocalRestrictions.communicationSafetyPolicy.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of LocalRestrictions.communicationSafetyPolicy.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of LocalRestrictions.communicationSafetyPolicy.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of LocalRestrictions.denyiCloudLogoutAndRequireAutomaticDateAndTime(deny:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of LocalRestrictions.updateDefaultWebContentRestrictions(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of LocalRestrictions.updateAlwaysAllow(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of LocalRestrictions.setDowntimeShieldPolicy(with:isManaged:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of LocalRestrictions.updateDowntime(state:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of LocalRestrictions.setUpOverrideStore(with:applications:webDomains:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of LocalRestrictions.updateOverride(with:enabled:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of LocalRestrictions.setUpUsageLimitStore(with:applications:categories:webDomains:blockAtEndOfLimit:isManaged:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of LocalRestrictions.updateUsageLimit(with:enabled:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of LocalRestrictions.disableAllUsageLimits()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of LocalRestrictions.deleteAppAndWebsiteActivityStores()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of LocalRestrictions.deleteStores(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of LocalRestrictions.update(with:clearAllExistingRestrictions:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t getEnumTagSinglePayload for LocalRestrictions.LocalRestrictionsError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for LocalRestrictions.LocalRestrictionsError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25BC697ACLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25BC697D4()
{
  return 0;
}

ValueMetadata *type metadata accessor for LocalRestrictions.LocalRestrictionsError()
{
  return &type metadata for LocalRestrictions.LocalRestrictionsError;
}

unint64_t sub_25BC697F0()
{
  unint64_t result = qword_26A553528;
  if (!qword_26A553528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A553528);
  }
  return result;
}

uint64_t sub_25BC69844(unint64_t a1, unint64_t *a2, uint64_t a3, unint64_t *a4, uint64_t *a5)
{
  unint64_t v10 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_25BC70FE0();
    swift_bridgeObjectRelease();
  }
  sub_25BC6147C(0, a2);
  sub_25BC69000(a4, a2);
  uint64_t result = sub_25BC70DC0();
  uint64_t v18 = result;
  if (v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_25BC70FE0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v12) {
      return v18;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v12) {
      return v18;
    }
  }
  if (v12 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v14 = (void *)MEMORY[0x261173140](i, a1);
        sub_25BC6654C(&v17, v14, a2, a3, a5);
      }
    }
    else
    {
      uint64_t v15 = (void **)(a1 + 32);
      do
      {
        uint64_t v16 = *v15++;
        sub_25BC6654C(&v17, v16, a2, a3, a5);

        --v12;
      }
      while (v12);
    }
    return v18;
  }
  __break(1u);
  return result;
}

void sub_25BC699D4(void *a1, id a2)
{
  id v4 = objc_msgSend(a2, sel_appStore);
  id v5 = objc_msgSend(a1, sel_payloadAllowInAppPurchases);
  objc_msgSend(v5, sel_BOOLValue);
  sub_25BC6147C(0, &qword_26A553530);
  id v6 = (void *)sub_25BC70E50();

  objc_msgSend(v4, sel_setDenyInAppPurchases_, v6);
  id v7 = objc_msgSend(a2, sel_appStore);
  id v8 = objc_msgSend(a1, sel_payloadForceITunesStorePasswordEntry);
  objc_msgSend(v7, sel_setRequirePasswordForPurchases_, v8);

  id v9 = objc_msgSend(a2, sel_application);
  id v10 = objc_msgSend(a1, sel_payloadAllowAppInstallation);
  objc_msgSend(v10, sel_BOOLValue);
  id v11 = (void *)sub_25BC70E50();

  objc_msgSend(v9, sel_setDenyAppInstallation_, v11);
  id v12 = objc_msgSend(a2, sel_appStore);
  id v13 = objc_msgSend(a1, sel_payloadAllowUIAppInstallation);
  objc_msgSend(v13, sel_BOOLValue);
  uint64_t v14 = (void *)sub_25BC70E50();

  objc_msgSend(v12, sel_setDenyAppStoreAppInstallation_, v14);
  id v15 = objc_msgSend(a2, sel_appStore);
  id v16 = objc_msgSend(a1, sel_payloadAllowMarketplaceAppInstallation);
  objc_msgSend(v16, sel_BOOLValue);
  id v17 = (void *)sub_25BC70E50();

  objc_msgSend(v15, sel_setDenyMarketplaceAppInstallation_, v17);
  id v18 = objc_msgSend(a2, sel_appStore);
  id v19 = objc_msgSend(a1, sel_payloadAllowWebDistributionAppInstallation);
  objc_msgSend(v19, sel_BOOLValue);
  id v20 = (void *)sub_25BC70E50();

  objc_msgSend(v18, sel_setDenyWebDistributionAppInstallation_, v20);
  id v21 = objc_msgSend(a2, sel_application);
  id v22 = objc_msgSend(a1, sel_payloadAllowAppRemoval);
  objc_msgSend(v22, sel_BOOLValue);
  id v23 = (void *)sub_25BC70E50();

  objc_msgSend(v21, sel_setDenyAppRemoval_, v23);
  id v24 = objc_msgSend(a2, sel_application);
  id v25 = objc_msgSend(a1, sel_payloadAllowAppClips);
  objc_msgSend(v25, sel_BOOLValue);
  id v26 = (id)sub_25BC70E50();

  objc_msgSend(v24, sel_setDenyAppClips_, v26);
}

void sub_25BC69D84(void *a1, void *a2)
{
  id v4 = objc_msgSend(a1, sel_payloadBlacklistedAppBundleIDs);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = sub_25BC70D90();

    uint64_t v7 = *(void *)(v6 + 16);
    if (v7)
    {
      unint64_t v35 = MEMORY[0x263F8EE78];
      sub_25BC70FA0();
      uint64_t v8 = v6 + 40;
      do
      {
        id v9 = objc_allocWithZone(MEMORY[0x263F53EB8]);
        swift_bridgeObjectRetain();
        id v10 = (void *)sub_25BC70CF0();
        swift_bridgeObjectRelease();
        objc_msgSend(v9, sel_initWithBundleIdentifier_, v10);

        sub_25BC70F80();
        sub_25BC70FB0();
        sub_25BC70FC0();
        sub_25BC70F90();
        v8 += 16;
        --v7;
      }
      while (v7);
      unint64_t v11 = v35;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v11 = MEMORY[0x263F8EE78];
    }
    id v12 = objc_msgSend(a2, sel_application);
    sub_25BC69844(v11, &qword_26A5534E8, 0x263F53EB8, &qword_26A5534F0, &qword_26A553598);
    swift_bridgeObjectRelease();
    sub_25BC6147C(0, &qword_26A5534E8);
    sub_25BC69000(&qword_26A5534F0, &qword_26A5534E8);
    id v13 = (void *)sub_25BC70DA0();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_setBlockedApplications_, v13);
  }
  id v14 = objc_msgSend(a2, sel_faceTime);
  id v15 = objc_msgSend(a1, sel_payloadAllowVideoConferencing);
  objc_msgSend(v15, sel_BOOLValue);
  sub_25BC6147C(0, &qword_26A553530);
  id v16 = (void *)sub_25BC70E50();

  objc_msgSend(v14, sel_setDenyFaceTime_, v16);
  id v17 = objc_msgSend(a2, sel_faceTime);
  id v18 = objc_msgSend(a1, sel_payloadAllowGroupActivity);
  objc_msgSend(v18, sel_BOOLValue);
  id v19 = (void *)sub_25BC70E50();

  objc_msgSend(v17, sel_setDenySharePlay_, v19);
  id v20 = objc_msgSend(a2, sel_media);
  id v21 = objc_msgSend(a1, sel_payloadAllowiTunes);
  objc_msgSend(v21, sel_BOOLValue);
  id v22 = (void *)sub_25BC70E50();

  objc_msgSend(v20, sel_setDenyiTunes_, v22);
  id v23 = objc_msgSend(a2, sel_media);
  id v24 = objc_msgSend(a1, sel_payloadAllowPodcasts);
  objc_msgSend(v24, sel_BOOLValue);
  id v25 = (void *)sub_25BC70E50();

  objc_msgSend(v23, sel_setDenyPodcasts_, v25);
  id v26 = objc_msgSend(a2, sel_messages);
  id v27 = objc_msgSend(a1, sel_payloadAllowChat);
  objc_msgSend(v27, sel_BOOLValue);
  uint64_t v28 = (void *)sub_25BC70E50();

  objc_msgSend(v26, sel_setDenyiMessage_, v28);
  id v29 = objc_msgSend(a2, sel_news);
  id v30 = objc_msgSend(a1, sel_payloadAllowNews);
  objc_msgSend(v30, sel_BOOLValue);
  uint64_t v31 = (void *)sub_25BC70E50();

  objc_msgSend(v29, sel_setDenyNews_, v31);
  id v32 = objc_msgSend(a2, sel_safari);
  id v33 = objc_msgSend(a1, sel_payloadAllowSafari);
  objc_msgSend(v33, sel_BOOLValue);
  id v34 = (id)sub_25BC70E50();

  objc_msgSend(v32, sel_setDenySafari_, v34);
}

void sub_25BC6A2AC(void *a1, id a2)
{
  id v4 = objc_msgSend(a2, sel_media);
  id v5 = objc_msgSend(a1, sel_payloadAllowBookstore);
  objc_msgSend(v5, sel_BOOLValue);
  sub_25BC6147C(0, &qword_26A553530);
  uint64_t v6 = (void *)sub_25BC70E50();

  objc_msgSend(v4, sel_setDenyBookstore_, v6);
  id v7 = objc_msgSend(a2, sel_media);
  id v8 = objc_msgSend(a1, sel_payloadAllowBookstoreErotica);
  objc_msgSend(v8, sel_BOOLValue);
  id v9 = (id)sub_25BC70E50();

  objc_msgSend(v7, sel_setDenyBookstoreErotica_, v9);
}

void sub_25BC6A3F8(void *a1, id a2)
{
  id v4 = objc_msgSend(a2, sel_cellular);
  id v5 = objc_msgSend(a1, sel_payloadAllowAppCellularDataModification);
  objc_msgSend(v5, sel_BOOLValue);
  sub_25BC6147C(0, &qword_26A553530);
  uint64_t v6 = (void *)sub_25BC70E50();

  objc_msgSend(v4, sel_setLockAppCellularData_, v6);
  id v7 = objc_msgSend(a2, sel_cellular);
  id v8 = objc_msgSend(a1, sel_payloadAllowCellularPlanModification);
  objc_msgSend(v8, sel_BOOLValue);
  id v9 = (id)sub_25BC70E50();

  objc_msgSend(v7, sel_setLockCellularPlan_, v9);
}

void sub_25BC6A544(void *a1, id a2)
{
  id v4 = objc_msgSend(a2, sel_camera);
  id v5 = objc_msgSend(a1, sel_payloadAllowCamera);
  objc_msgSend(v5, sel_BOOLValue);
  sub_25BC6147C(0, &qword_26A553530);
  uint64_t v6 = (void *)sub_25BC70E50();

  objc_msgSend(v4, sel_setDenyCamera_, v6);
  id v7 = objc_msgSend(a2, sel_camera);
  id v8 = objc_msgSend(a1, sel_payloadAllowScreenRecording);
  objc_msgSend(v8, sel_BOOLValue);
  id v9 = (id)sub_25BC70E50();

  objc_msgSend(v7, sel_setDenyScreenRecording_, v9);
}

void sub_25BC6A690(void *a1, void *a2)
{
  id v4 = objc_msgSend(a1, sel_payloadAllowedGameCenterOtherPlayerTypes);
  unint64_t v5 = (unint64_t)objc_msgSend(v4, sel_integerValue);

  if (v5 <= 2)
  {
    uint64_t v6 = (void *)qword_2654A3730[v5];
    id v7 = objc_msgSend(a2, sel_gameCenter);
    objc_msgSend(v7, sel_setAllowedOtherPlayerTypes_, *v6);
  }
  id v8 = objc_msgSend(a2, sel_gameCenter);
  id v9 = objc_msgSend(a1, sel_payloadAllowMultiplayerGaming);
  objc_msgSend(v9, sel_BOOLValue);
  sub_25BC6147C(0, &qword_26A553530);
  id v10 = (void *)sub_25BC70E50();

  objc_msgSend(v8, sel_setDenyMultiplayerGaming_, v10);
  id v11 = objc_msgSend(a2, sel_gameCenter);
  id v12 = objc_msgSend(a1, sel_payloadAllowAddingGameCenterFriends);
  objc_msgSend(v12, sel_BOOLValue);
  id v13 = (void *)sub_25BC70E50();

  objc_msgSend(v11, sel_setDenyAddingFriends_, v13);
  id v14 = objc_msgSend(a2, sel_gameCenter);
  id v15 = objc_msgSend(a1, sel_payloadAllowGameCenter);
  objc_msgSend(v15, sel_BOOLValue);
  id v16 = (void *)sub_25BC70E50();

  objc_msgSend(v14, sel_setDenyGameCenter_, v16);
  id v17 = objc_msgSend(a2, sel_gameCenter);
  id v18 = objc_msgSend(a1, sel_payloadAllowGameCenterNearbyMultiplayer);
  objc_msgSend(v18, sel_BOOLValue);
  id v19 = (void *)sub_25BC70E50();

  objc_msgSend(v17, sel_setDenyNearbyMultiplayer_, v19);
  id v20 = objc_msgSend(a2, sel_gameCenter);
  id v21 = objc_msgSend(a1, sel_payloadAllowGameCenterPrivateMessaging);
  objc_msgSend(v21, sel_BOOLValue);
  id v22 = (void *)sub_25BC70E50();

  objc_msgSend(v20, sel_setDenyPrivateMessaging_, v22);
  id v23 = objc_msgSend(a2, sel_gameCenter);
  id v24 = objc_msgSend(a1, sel_payloadAllowGameCenterProfilePrivacyModification);
  objc_msgSend(v24, sel_BOOLValue);
  id v25 = (void *)sub_25BC70E50();

  objc_msgSend(v23, sel_setLockProfilePrivacy_, v25);
  id v26 = objc_msgSend(a2, sel_gameCenter);
  id v27 = objc_msgSend(a1, sel_payloadAllowGameCenterProfileModification);
  objc_msgSend(v27, sel_BOOLValue);
  uint64_t v28 = (void *)sub_25BC70E50();

  objc_msgSend(v26, sel_setLockProfile_, v28);
  id v29 = objc_msgSend(a2, sel_gameCenter);
  id v30 = objc_msgSend(a1, sel_payloadAllowGameCenterFriendsSharingModification);
  objc_msgSend(v30, sel_BOOLValue);
  id v31 = (id)sub_25BC70E50();

  objc_msgSend(v29, sel_setLockFriendsSharing_, v31);
}

void sub_25BC6AAB8(void *a1, id a2)
{
  id v4 = objc_msgSend(a2, sel_media);
  id v5 = objc_msgSend(a1, sel_payloadAllowMusicService);
  objc_msgSend(v5, sel_BOOLValue);
  sub_25BC6147C(0, &qword_26A553530);
  uint64_t v6 = (void *)sub_25BC70E50();

  objc_msgSend(v4, sel_setDenyMusicService_, v6);
  id v7 = objc_msgSend(a2, sel_media);
  id v8 = objc_msgSend(a1, sel_payloadAllowMusicArtistActivity);
  objc_msgSend(v8, sel_BOOLValue);
  id v9 = (void *)sub_25BC70E50();

  objc_msgSend(v7, sel_setDenyMusicArtistActivity_, v9);
  id v10 = objc_msgSend(a2, sel_media);
  id v11 = objc_msgSend(a1, sel_payloadAllowMusicVideos);
  objc_msgSend(v11, sel_BOOLValue);
  id v12 = (void *)sub_25BC70E50();

  objc_msgSend(v10, sel_setDenyMusicVideos_, v12);
  id v13 = objc_msgSend(a2, sel_media);
  id v14 = objc_msgSend(a1, sel_payloadAllowSharedLibraries);
  objc_msgSend(v14, sel_BOOLValue);
  id v15 = (void *)sub_25BC70E50();

  objc_msgSend(v13, sel_setDenySharedMediaLibraries_, v15);
  uint64_t v16 = sub_25BC70BC0();
  v21[3] = v16;
  v21[4] = sub_25BC6B1A8();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v16 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x263F67080], v16);
  LOBYTE(v16) = sub_25BC70B90();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
  if (v16)
  {
    id v18 = objc_msgSend(a2, sel_media);
    id v19 = objc_msgSend(a1, sel_payloadAllowSpeakerVolumeLimitModification);
    objc_msgSend(v19, sel_BOOLValue);
    sub_25BC6147C(0, &qword_26A553530);
    id v20 = (void *)sub_25BC70E50();

    objc_msgSend(v18, sel_setLockSpeakerVolumeLimit_, v20);
  }
}

void sub_25BC6ADC0(void *a1, id a2)
{
  id v4 = objc_msgSend(a2, sel_appStore);
  id v5 = objc_msgSend(a1, sel_payloadRatingApps);
  objc_msgSend(v4, sel_setMaximumRating_, v5);

  id v6 = objc_msgSend(a2, sel_media);
  id v7 = objc_msgSend(a1, sel_payloadRatingMovies);
  objc_msgSend(v6, sel_setMaximumMovieRating_, v7);

  id v8 = objc_msgSend(a2, sel_media);
  id v9 = objc_msgSend(a1, sel_payloadRatingTVShows);
  objc_msgSend(v8, sel_setMaximumTVShowRating_, v9);

  id v10 = objc_msgSend(a2, sel_media);
  id v11 = objc_msgSend(a1, sel_payloadAllowExplicitContent);
  if (v11)
  {
    id v12 = v11;
    objc_msgSend(v11, sel_BOOLValue);
    sub_25BC6147C(0, &qword_26A553530);
    id v13 = (id)sub_25BC70E50();
  }
  else
  {
    id v13 = 0;
  }
  objc_msgSend(v10, sel_setDenyExplicitContent_, v13);
}

void sub_25BC6AFA0(void *a1, id a2)
{
  id v4 = objc_msgSend(a2, sel_siri);
  id v5 = objc_msgSend(a1, sel_payloadAllowAssistant);
  objc_msgSend(v5, sel_BOOLValue);
  sub_25BC6147C(0, &qword_26A553530);
  id v6 = (void *)sub_25BC70E50();

  objc_msgSend(v4, sel_setDenySiri_, v6);
  id v7 = objc_msgSend(a2, sel_keyboard);
  id v8 = objc_msgSend(a1, sel_payloadAllowDictation);
  objc_msgSend(v8, sel_BOOLValue);
  id v9 = (void *)sub_25BC70E50();

  objc_msgSend(v7, sel_setDenyDictation_, v9);
  id v10 = objc_msgSend(a2, sel_siri);
  id v11 = objc_msgSend(a1, sel_payloadAllowAssistantUserGeneratedContent);
  objc_msgSend(v11, sel_BOOLValue);
  id v12 = (void *)sub_25BC70E50();

  objc_msgSend(v10, sel_setDenySiriUserGeneratedContent_, v12);
  id v13 = objc_msgSend(a2, sel_siri);
  id v14 = objc_msgSend(a1, sel_payloadForceAssistantProfanityFilter);
  objc_msgSend(v13, sel_setForceSiriProfanityFilter_, v14);
}

unint64_t sub_25BC6B1A8()
{
  unint64_t result = qword_26A553538;
  if (!qword_26A553538)
  {
    sub_25BC70BC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A553538);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25BC6B2B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25BC6B330(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A5535A8);
}

uint64_t static DeviceActivityName.downtime_weekday_1.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A553180, (uint64_t)qword_26A5535A8, a1);
}

uint64_t sub_25BC6B378(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A5535C0);
}

uint64_t static DeviceActivityName.downtime_weekday_2.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A553188, (uint64_t)qword_26A5535C0, a1);
}

uint64_t sub_25BC6B3C0(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A5535D8);
}

uint64_t static DeviceActivityName.downtime_weekday_3.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A553190, (uint64_t)qword_26A5535D8, a1);
}

uint64_t sub_25BC6B408(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A5535F0);
}

uint64_t static DeviceActivityName.downtime_weekday_4.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A553198, (uint64_t)qword_26A5535F0, a1);
}

uint64_t sub_25BC6B450(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A553608);
}

uint64_t static DeviceActivityName.downtime_weekday_5.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A5531A0, (uint64_t)qword_26A553608, a1);
}

uint64_t sub_25BC6B498(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A553620);
}

uint64_t static DeviceActivityName.downtime_weekday_6.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A5531A8, (uint64_t)qword_26A553620, a1);
}

uint64_t sub_25BC6B4E0(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A553638);
}

uint64_t static DeviceActivityName.downtime_weekday_7.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A5531B0, (uint64_t)qword_26A553638, a1);
}

uint64_t sub_25BC6B528(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A553650);
}

uint64_t static DeviceActivityName.downtime_enable_override.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A5531B8, (uint64_t)qword_26A553650, a1);
}

uint64_t sub_25BC6B570(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A553668);
}

uint64_t static DeviceActivityName.downtime_disable_override.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A5531C0, (uint64_t)qword_26A553668, a1);
}

uint64_t sub_25BC6B5B8(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A553680);
}

uint64_t static DeviceActivityName.usagelimit_weekday_1.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A5531C8, (uint64_t)qword_26A553680, a1);
}

uint64_t sub_25BC6B600(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A553698);
}

uint64_t static DeviceActivityName.usagelimit_weekday_2.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A5531D0, (uint64_t)qword_26A553698, a1);
}

uint64_t sub_25BC6B648(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A5536B0);
}

uint64_t static DeviceActivityName.usagelimit_weekday_3.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A5531D8, (uint64_t)qword_26A5536B0, a1);
}

uint64_t sub_25BC6B690(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A5536C8);
}

uint64_t static DeviceActivityName.usagelimit_weekday_4.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A5531E0, (uint64_t)qword_26A5536C8, a1);
}

uint64_t sub_25BC6B6D8(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A5536E0);
}

uint64_t static DeviceActivityName.usagelimit_weekday_5.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A5531E8, (uint64_t)qword_26A5536E0, a1);
}

uint64_t sub_25BC6B720(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A5536F8);
}

uint64_t static DeviceActivityName.usagelimit_weekday_6.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A5531F0, (uint64_t)qword_26A5536F8, a1);
}

uint64_t sub_25BC6B768(uint64_t a1)
{
  return sub_25BC6B78C(a1, qword_26A553710);
}

uint64_t sub_25BC6B78C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25BC70BA0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_25BC70BB0();
}

uint64_t static DeviceActivityName.usagelimit_weekday_7.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25BC6B810(&qword_26A5531F8, (uint64_t)qword_26A553710, a1);
}

uint64_t sub_25BC6B810@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25BC70BA0();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t DeviceActivityName.isDowntime.getter()
{
  uint64_t v1 = sub_25BC70BA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  unint64_t v35 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  id v36 = (char *)&v34 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  char v37 = (char *)&v34 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v38 = (char *)&v34 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v34 - v12;
  MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v34 - v14;
  if (qword_26A553180 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_26A5535A8);
  unint64_t v16 = sub_25BC6C9E0();
  uint64_t v17 = v0;
  sub_25BC70D70();
  unint64_t v39 = v16;
  sub_25BC70D70();
  if (v42 == v40 && v43 == v41) {
    char v18 = 1;
  }
  else {
    char v18 = sub_25BC71040();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v19 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v19(v15, v0, v1);
  if (v18)
  {
    char v20 = 1;
  }
  else
  {
    if (qword_26A553188 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v1, (uint64_t)qword_26A5535C0);
    sub_25BC70D70();
    sub_25BC70D70();
    if (v42 == v40 && v43 == v41) {
      char v20 = 1;
    }
    else {
      char v20 = sub_25BC71040();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v21 = *(void (**)(char *, uint64_t))(v2 + 8);
  v21(v15, v1);
  uint64_t v22 = v17;
  v19(v13, v17, v1);
  if (v20) {
    goto LABEL_22;
  }
  if (qword_26A553190 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_26A5535D8);
  sub_25BC70D70();
  sub_25BC70D70();
  if (v42 == v40 && v43 == v41)
  {
    swift_bridgeObjectRelease_n();
LABEL_22:
    v21(v13, v1);
    id v23 = v38;
    v19(v38, v17, v1);
    id v24 = v35;
LABEL_23:
    v21(v23, v1);
    id v25 = v37;
    v19(v37, v22, v1);
LABEL_24:
    v21(v25, v1);
    id v26 = v36;
    v19(v36, v22, v1);
LABEL_25:
    id v27 = v26;
LABEL_26:
    v21(v27, v1);
    v19(v24, v22, v1);
LABEL_27:
    char v28 = 1;
    goto LABEL_28;
  }
  char v30 = sub_25BC71040();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21(v13, v1);
  id v23 = v38;
  v19(v38, v22, v1);
  id v24 = v35;
  if (v30) {
    goto LABEL_23;
  }
  if (qword_26A553198 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_26A5535F0);
  sub_25BC70D70();
  sub_25BC70D70();
  if (v42 == v40 && v43 == v41)
  {
    swift_bridgeObjectRelease_n();
    id v23 = v38;
    goto LABEL_23;
  }
  char v31 = sub_25BC71040();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21(v38, v1);
  id v25 = v37;
  v19(v37, v22, v1);
  if (v31) {
    goto LABEL_24;
  }
  if (qword_26A5531A0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_26A553608);
  sub_25BC70D70();
  sub_25BC70D70();
  if (v42 == v40 && v43 == v41)
  {
    swift_bridgeObjectRelease_n();
    id v25 = v37;
    goto LABEL_24;
  }
  char v32 = sub_25BC71040();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21(v37, v1);
  id v26 = v36;
  v19(v36, v22, v1);
  if (v32) {
    goto LABEL_25;
  }
  if (qword_26A5531A8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_26A553620);
  sub_25BC70D70();
  sub_25BC70D70();
  if (v42 == v40 && v43 == v41)
  {
    swift_bridgeObjectRelease_n();
    id v27 = v36;
    goto LABEL_26;
  }
  char v33 = sub_25BC71040();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21(v36, v1);
  v19(v24, v22, v1);
  if (v33) {
    goto LABEL_27;
  }
  if (qword_26A5531B0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_26A553638);
  sub_25BC70D70();
  sub_25BC70D70();
  if (v42 == v40 && v43 == v41) {
    char v28 = 1;
  }
  else {
    char v28 = sub_25BC71040();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_28:
  v21(v24, v1);
  return v28 & 1;
}

uint64_t DeviceActivityName.isUsageLimit.getter()
{
  uint64_t v1 = sub_25BC70BA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  unint64_t v35 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  id v36 = (char *)&v34 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  char v37 = (char *)&v34 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v38 = (char *)&v34 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v34 - v12;
  MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v34 - v14;
  if (qword_26A5531C8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_26A553680);
  unint64_t v16 = sub_25BC6C9E0();
  uint64_t v17 = v0;
  sub_25BC70D70();
  unint64_t v39 = v16;
  sub_25BC70D70();
  if (v42 == v40 && v43 == v41) {
    char v18 = 1;
  }
  else {
    char v18 = sub_25BC71040();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v19 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v19(v15, v0, v1);
  if (v18)
  {
    char v20 = 1;
  }
  else
  {
    if (qword_26A5531D0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v1, (uint64_t)qword_26A553698);
    sub_25BC70D70();
    sub_25BC70D70();
    if (v42 == v40 && v43 == v41) {
      char v20 = 1;
    }
    else {
      char v20 = sub_25BC71040();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v21 = *(void (**)(char *, uint64_t))(v2 + 8);
  v21(v15, v1);
  uint64_t v22 = v17;
  v19(v13, v17, v1);
  if (v20) {
    goto LABEL_22;
  }
  if (qword_26A5531D8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_26A5536B0);
  sub_25BC70D70();
  sub_25BC70D70();
  if (v42 == v40 && v43 == v41)
  {
    swift_bridgeObjectRelease_n();
LABEL_22:
    v21(v13, v1);
    id v23 = v38;
    v19(v38, v17, v1);
    id v24 = v35;
LABEL_23:
    v21(v23, v1);
    id v25 = v37;
    v19(v37, v22, v1);
LABEL_24:
    v21(v25, v1);
    id v26 = v36;
    v19(v36, v22, v1);
LABEL_25:
    id v27 = v26;
LABEL_26:
    v21(v27, v1);
    v19(v24, v22, v1);
LABEL_27:
    char v28 = 1;
    goto LABEL_28;
  }
  char v30 = sub_25BC71040();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21(v13, v1);
  id v23 = v38;
  v19(v38, v22, v1);
  id v24 = v35;
  if (v30) {
    goto LABEL_23;
  }
  if (qword_26A5531E0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_26A5536C8);
  sub_25BC70D70();
  sub_25BC70D70();
  if (v42 == v40 && v43 == v41)
  {
    swift_bridgeObjectRelease_n();
    id v23 = v38;
    goto LABEL_23;
  }
  char v31 = sub_25BC71040();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21(v38, v1);
  id v25 = v37;
  v19(v37, v22, v1);
  if (v31) {
    goto LABEL_24;
  }
  if (qword_26A5531E8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_26A5536E0);
  sub_25BC70D70();
  sub_25BC70D70();
  if (v42 == v40 && v43 == v41)
  {
    swift_bridgeObjectRelease_n();
    id v25 = v37;
    goto LABEL_24;
  }
  char v32 = sub_25BC71040();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21(v37, v1);
  id v26 = v36;
  v19(v36, v22, v1);
  if (v32) {
    goto LABEL_25;
  }
  if (qword_26A5531F0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_26A5536F8);
  sub_25BC70D70();
  sub_25BC70D70();
  if (v42 == v40 && v43 == v41)
  {
    swift_bridgeObjectRelease_n();
    id v27 = v36;
    goto LABEL_26;
  }
  char v33 = sub_25BC71040();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21(v36, v1);
  v19(v24, v22, v1);
  if (v33) {
    goto LABEL_27;
  }
  if (qword_26A5531F8 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v1, (uint64_t)qword_26A553710);
  sub_25BC70D70();
  sub_25BC70D70();
  if (v42 == v40 && v43 == v41) {
    char v28 = 1;
  }
  else {
    char v28 = sub_25BC71040();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_28:
  v21(v24, v1);
  return v28 & 1;
}

unint64_t sub_25BC6C9E0()
{
  unint64_t result = qword_26A553728;
  if (!qword_26A553728)
  {
    sub_25BC70BA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A553728);
  }
  return result;
}

void STUserNotifications.NotificationType.hash(into:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25BC70B40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for STUserNotifications.NotificationType();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BC6CEB4(v1, (uint64_t)v8);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v9 = (void *)*((void *)v8 + 4);
      sub_25BC710C0();
      sub_25BC70D40();
      swift_bridgeObjectRelease();
      sub_25BC70D40();
      swift_bridgeObjectRelease();
      sub_25BC710D0();
      if (v9)
      {
        id v10 = v9;
        sub_25BC70E80();
      }
      else
      {
        id v10 = 0;
      }
      sub_25BC70D40();
      swift_bridgeObjectRelease();

      break;
    case 2u:
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
      sub_25BC710C0();
      sub_25BC70A1C(&qword_26A553750, MEMORY[0x263F063B0]);
      sub_25BC70CE0();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      break;
    case 3u:
      sub_25BC710C0();
      sub_25BC70D40();
      swift_bridgeObjectRelease();
      sub_25BC70D40();
      swift_bridgeObjectRelease();
      sub_25BC70D40();
      swift_bridgeObjectRelease();
      sub_25BC710E0();
      break;
    case 4u:
      sub_25BC710C0();
      sub_25BC70D40();
      swift_bridgeObjectRelease();
      sub_25BC70D40();
      swift_bridgeObjectRelease();
      sub_25BC70D40();
      swift_bridgeObjectRelease();
      break;
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
      sub_25BC710C0();
      break;
    default:
      sub_25BC710C0();
      sub_25BC70D40();
      swift_bridgeObjectRelease();
      sub_25BC70D40();
      swift_bridgeObjectRelease();
      sub_25BC710E0();
      break;
  }
}

uint64_t type metadata accessor for STUserNotifications.NotificationType()
{
  uint64_t result = qword_26A553788;
  if (!qword_26A553788) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25BC6CEB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for STUserNotifications.NotificationType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t STUserNotifications.NotificationType.hashValue.getter()
{
  return sub_25BC710F0();
}

uint64_t sub_25BC6CF5C()
{
  return sub_25BC710F0();
}

uint64_t sub_25BC6CFA0()
{
  return sub_25BC710F0();
}

uint64_t sub_25BC6CFE0()
{
  uint64_t v0 = sub_25BC70BF0();
  __swift_allocate_value_buffer(v0, qword_26A553730);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26A553730);
  if (qword_26A553160 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26A5537F8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

BOOL static STUserNotifications.UserNotificationError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t STUserNotifications.UserNotificationError.hash(into:)()
{
  return sub_25BC710C0();
}

uint64_t STUserNotifications.UserNotificationError.hashValue.getter()
{
  return sub_25BC710F0();
}

BOOL sub_25BC6D134(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25BC6D14C()
{
  return sub_25BC710F0();
}

uint64_t sub_25BC6D194()
{
  return sub_25BC710C0();
}

uint64_t sub_25BC6D1C0()
{
  return sub_25BC710F0();
}

uint64_t static STUserNotifications.post(notification:)(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_25BC70B80();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = sub_25BC70B40();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = type metadata accessor for STUserNotifications.NotificationType();
  v1[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25BC6D350, 0, 0);
}

uint64_t sub_25BC6D350()
{
  id v1 = sub_25BC6E8AC(*(id *)(v0 + 16));
  *(void *)(v0 + 88) = v1;
  uint64_t v2 = v1;
  sub_25BC6CEB4(*(void *)(v0 + 16), *(void *)(v0 + 80));
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 56) + 32))(*(void *)(v0 + 64), *(void *)(v0 + 80), *(void *)(v0 + 48));
    self;
    uint64_t v3 = swift_dynamicCastObjCClass();
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      uint64_t v6 = *(void *)(v0 + 56);
      uint64_t v5 = *(void *)(v0 + 64);
      uint64_t v7 = *(void *)(v0 + 40);
      uint64_t v8 = *(void *)(v0 + 32);
      uint64_t v22 = *(void *)(v0 + 24);
      uint64_t v23 = *(void *)(v0 + 48);
      id v9 = v2;
      sub_25BC70B70();
      id v10 = (void *)sub_25BC70B20();
      uint64_t v11 = (void *)sub_25BC70B60();
      objc_msgSend(v4, sel_setEndDateComponents_referenceDate_, v10, v11);

      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v22);
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v23);
    }
    else
    {
      if (qword_26A553200 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_25BC70BF0();
      __swift_project_value_buffer(v12, (uint64_t)qword_26A553730);
      id v13 = sub_25BC70BD0();
      os_log_type_t v14 = sub_25BC70DF0();
      BOOL v15 = os_log_type_enabled(v13, v14);
      uint64_t v17 = *(void *)(v0 + 56);
      uint64_t v16 = *(void *)(v0 + 64);
      uint64_t v18 = *(void *)(v0 + 48);
      if (v15)
      {
        id v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v19 = 0;
        _os_log_impl(&dword_25BC58000, v13, v14, "Unable to cast context of type downtime to STDeviceDowntimeUserNotificationContext.", v19, 2u);
        MEMORY[0x261173820](v19, -1, -1);
      }

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    }
  }
  else
  {
    sub_25BC6ED40(*(void *)(v0 + 80));
  }
  id v24 = (uint64_t (*)(uint64_t))((char *)&dword_26A553760 + dword_26A553760);
  char v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v20;
  *char v20 = v0;
  v20[1] = sub_25BC6D664;
  return v24((uint64_t)v2);
}

uint64_t sub_25BC6D664()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25BC6D804;
  }
  else {
    uint64_t v2 = sub_25BC6D778;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25BC6D778()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25BC6D804()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t static STUserNotifications.postNotification(context:)(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_26A553760 + dword_26A553760);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25BC6D938;
  return v5(a1);
}

uint64_t sub_25BC6D938()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t static STUserNotifications.remove(notification:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_25BC6DA4C, 0, 0);
}

uint64_t sub_25BC6DA4C()
{
  id v1 = sub_25BC6E8AC(*(id *)(v0 + 16));
  sub_25BC6FB2C(v1);

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

void static STUserNotifications.removeNotification(context:)(void *a1)
{
}

uint64_t sub_25BC6DAF8(uint64_t a1)
{
  return MEMORY[0x270FA2400](*(void *)(a1 + 32));
}

uint64_t sub_25BC6DB00(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5534B8);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return MEMORY[0x270FA2408](v3);
  }
}

uint64_t sub_25BC6DBB4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_25BC6147C(0, &qword_26A5537B8);
  **(void **)(*(void *)(v1 + 64) + 40) = sub_25BC70D90();
  return MEMORY[0x270FA2400](v1);
}

void *sub_25BC6DC2C()
{
  uint64_t result = (void *)sub_25BC6DC4C();
  off_26A553748 = result;
  return result;
}

unint64_t sub_25BC6DC4C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A553798);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25BC71F80;
  *(void *)(inited + 32) = sub_25BC70D20();
  *(void *)(inited + 40) = v1;
  sub_25BC70D20();
  id v2 = objc_allocWithZone(MEMORY[0x263F1DFB0]);
  uint64_t v3 = (void *)sub_25BC70CF0();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithBundleIdentifier_, v3);

  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = sub_25BC70D20();
  *(void *)(inited + 64) = v5;
  sub_25BC70D20();
  id v6 = objc_allocWithZone(MEMORY[0x263F1DFB0]);
  id v7 = (void *)sub_25BC70CF0();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_initWithBundleIdentifier_, v7);

  *(void *)(inited + 72) = v8;
  *(void *)(inited + 80) = sub_25BC70D20();
  *(void *)(inited + 88) = v9;
  sub_25BC70D20();
  id v10 = objc_allocWithZone(MEMORY[0x263F1DFB0]);
  uint64_t v11 = (void *)sub_25BC70CF0();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v10, sel_initWithBundleIdentifier_, v11);

  *(void *)(inited + 96) = v12;
  return sub_25BC62A60(inited);
}

uint64_t static STUserNotifications.notificationCentersByBundle.getter()
{
  if (qword_26A553208 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t _s15ScreenTimeSwift19STUserNotificationsV16NotificationTypeO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25BC70B40();
  id v109 = *(id *)(v4 - 8);
  uint64_t v110 = (char *)v4;
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v107 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for STUserNotifications.NotificationType();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  id v10 = (uint64_t *)((char *)&v107 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  id v13 = (char *)&v107 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v107 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  id v19 = (uint64_t *)((char *)&v107 - v18);
  MEMORY[0x270FA5388](v17);
  id v21 = (char *)&v107 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5537C0);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v25 = (double *)((char *)&v107 + *(int *)(v23 + 56) - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v26 = a1;
  id v27 = (char *)&v107 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BC6CEB4(v26, (uint64_t)v27);
  sub_25BC6CEB4(a2, (uint64_t)v25);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v33 = (uint64_t)v27;
      sub_25BC6CEB4((uint64_t)v27, (uint64_t)v19);
      uint64_t v35 = *v19;
      uint64_t v34 = v19[1];
      uint64_t v37 = v19[2];
      uint64_t v36 = v19[3];
      uint64_t v38 = (void *)v19[4];
      uint64_t v110 = (char *)v19[5];
      uint64_t v39 = v19[6];
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        id v27 = (char *)v33;
        goto LABEL_51;
      }
      id v109 = v38;
      double v40 = *v25;
      uint64_t v41 = *((void *)v25 + 1);
      uint64_t v42 = *((void *)v25 + 2);
      uint64_t v43 = *((void *)v25 + 3);
      id v44 = (void *)*((void *)v25 + 4);
      uint64_t v45 = (char *)*((void *)v25 + 5);
      uint64_t v46 = *((void *)v25 + 6);
      BOOL v47 = v35 == *(void *)&v40 && v34 == v41;
      v107 = v45;
      id v108 = v44;
      if (v47)
      {
        swift_bridgeObjectRelease_n();
        id v49 = v109;
      }
      else
      {
        char v48 = sub_25BC71040();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v49 = v109;
        if ((v48 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_66:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

LABEL_118:
          goto LABEL_119;
        }
      }
      if (v37 == v42 && v36 == v43)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v90 = sub_25BC71040();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v90 & 1) == 0) {
          goto LABEL_66;
        }
      }
      id v97 = v108;
      if (v49)
      {
        if (!v108)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_118;
        }
        sub_25BC6147C(0, &qword_26A553530);
        id v98 = v97;
        id v99 = v49;
        char v100 = sub_25BC70E70();

        if ((v100 & 1) == 0)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_119;
        }
      }
      else if (v108)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        goto LABEL_119;
      }
      if (v110 == v107 && v39 == v46)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v106 = sub_25BC71040();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        if ((v106 & 1) == 0)
        {
LABEL_119:
          sub_25BC6ED40(v33);
          goto LABEL_52;
        }
      }
      uint64_t v82 = v33;
      goto LABEL_45;
    case 2u:
      sub_25BC6CEB4((uint64_t)v27, (uint64_t)v16);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        id v51 = v109;
        uint64_t v50 = (uint64_t)v110;
        (*((void (**)(char *, double *, char *))v109 + 4))(v6, v25, v110);
        char v52 = MEMORY[0x261172D10](v16, v6);
        char v53 = (void (*)(char *, uint64_t))v51[1];
        v53(v6, v50);
        v53(v16, v50);
        sub_25BC6ED40((uint64_t)v27);
        return v52 & 1;
      }
      (*((void (**)(char *, char *))v109 + 1))(v16, v110);
      goto LABEL_51;
    case 3u:
      uint64_t v110 = v27;
      sub_25BC6CEB4((uint64_t)v27, (uint64_t)v13);
      uint64_t v55 = *(void *)v13;
      uint64_t v54 = *((void *)v13 + 1);
      uint64_t v57 = *((void *)v13 + 2);
      uint64_t v56 = *((void *)v13 + 3);
      char v59 = (void *)*((void *)v13 + 4);
      uint64_t v58 = *((void *)v13 + 5);
      double v60 = *((double *)v13 + 6);
      if (swift_getEnumCaseMultiPayload() != 3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v27 = v110;
        goto LABEL_51;
      }
      id v109 = v59;
      uint64_t v62 = *((void *)v25 + 2);
      uint64_t v61 = *((void *)v25 + 3);
      uint64_t v63 = *((void *)v25 + 5);
      double v64 = v25[6];
      BOOL v65 = v55 == *(void *)v25 && v54 == *((void *)v25 + 1);
      id v108 = (id)*((void *)v25 + 4);
      if (v65)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v67 = v63;
      }
      else
      {
        char v66 = sub_25BC71040();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v67 = v63;
        if ((v66 & 1) == 0) {
          goto LABEL_26;
        }
      }
      if (v57 == v62 && v56 == v61)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v92 = sub_25BC71040();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v92 & 1) == 0) {
          goto LABEL_80;
        }
      }
      BOOL v101 = v109 == v108 && v58 == v67;
      uint64_t v33 = (uint64_t)v110;
      if (v101)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v102 = sub_25BC71040();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v102 & 1) == 0) {
          goto LABEL_119;
        }
      }
      char v52 = v60 == v64;
      sub_25BC6ED40(v33);
      return v52 & 1;
    case 4u:
      sub_25BC6CEB4((uint64_t)v27, (uint64_t)v10);
      uint64_t v68 = *v10;
      uint64_t v69 = v10[1];
      uint64_t v70 = v10[2];
      uint64_t v71 = v10[3];
      id v73 = (id)v10[4];
      uint64_t v72 = v10[5];
      if (swift_getEnumCaseMultiPayload() != 4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_50;
      }
      uint64_t v110 = v27;
      double v74 = *v25;
      uint64_t v75 = *((void *)v25 + 1);
      uint64_t v77 = *((void *)v25 + 2);
      uint64_t v76 = *((void *)v25 + 3);
      id v78 = (void *)*((void *)v25 + 4);
      uint64_t v79 = *((void *)v25 + 5);
      BOOL v80 = v68 == *(void *)&v74 && v69 == v75;
      id v109 = v78;
      if (v80)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v81 = sub_25BC71040();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v81 & 1) == 0)
        {
LABEL_26:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_80:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_25BC6ED40((uint64_t)v110);
          goto LABEL_52;
        }
      }
      if (v70 == v77 && v71 == v76)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v94 = sub_25BC71040();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v94 & 1) == 0) {
          goto LABEL_80;
        }
      }
      uint64_t v103 = (uint64_t)v110;
      if (v73 == v109 && v72 == v79)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v82 = v103;
        goto LABEL_45;
      }
      char v105 = sub_25BC71040();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v105)
      {
        uint64_t v82 = v103;
LABEL_45:
        sub_25BC6ED40(v82);
        char v52 = 1;
        return v52 & 1;
      }
      sub_25BC6ED40(v103);
      goto LABEL_52;
    case 5u:
      if (swift_getEnumCaseMultiPayload() != 5) {
        goto LABEL_51;
      }
      goto LABEL_44;
    case 6u:
      if (swift_getEnumCaseMultiPayload() != 6) {
        goto LABEL_51;
      }
      goto LABEL_44;
    case 7u:
      if (swift_getEnumCaseMultiPayload() != 7) {
        goto LABEL_51;
      }
      goto LABEL_44;
    case 8u:
      if (swift_getEnumCaseMultiPayload() != 8) {
        goto LABEL_51;
      }
      goto LABEL_44;
    case 9u:
      if (swift_getEnumCaseMultiPayload() != 9) {
        goto LABEL_51;
      }
      goto LABEL_44;
    case 0xAu:
      if (swift_getEnumCaseMultiPayload() != 10) {
        goto LABEL_51;
      }
      goto LABEL_44;
    case 0xBu:
      if (swift_getEnumCaseMultiPayload() != 11) {
        goto LABEL_51;
      }
      goto LABEL_44;
    case 0xCu:
      if (swift_getEnumCaseMultiPayload() != 12) {
        goto LABEL_51;
      }
      goto LABEL_44;
    case 0xDu:
      if (swift_getEnumCaseMultiPayload() != 13) {
        goto LABEL_51;
      }
LABEL_44:
      uint64_t v82 = (uint64_t)v27;
      goto LABEL_45;
    default:
      sub_25BC6CEB4((uint64_t)v27, (uint64_t)v21);
      uint64_t v29 = *(void *)v21;
      uint64_t v28 = *((void *)v21 + 1);
      uint64_t v30 = *((void *)v21 + 2);
      uint64_t v31 = *((void *)v21 + 3);
      double v32 = *((double *)v21 + 4);
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v85 = *((void *)v25 + 2);
        uint64_t v84 = *((void *)v25 + 3);
        double v86 = v25[4];
        if (v29 == *(void *)v25 && v28 == *((void *)v25 + 1))
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v88 = sub_25BC71040();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v88 & 1) == 0)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
LABEL_87:
            sub_25BC6ED40((uint64_t)v27);
            goto LABEL_52;
          }
        }
        if (v30 == v85 && v31 == v84)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v96 = sub_25BC71040();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v96 & 1) == 0) {
            goto LABEL_87;
          }
        }
        char v52 = v32 == v86;
        sub_25BC6ED40((uint64_t)v27);
        return v52 & 1;
      }
      swift_bridgeObjectRelease();
LABEL_50:
      swift_bridgeObjectRelease();
LABEL_51:
      sub_25BC70AC0((uint64_t)v27);
LABEL_52:
      char v52 = 0;
      return v52 & 1;
  }
}

id sub_25BC6E8AC(id a1)
{
  uint64_t v2 = type metadata accessor for STUserNotifications.NotificationType();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BC6CEB4((uint64_t)a1, (uint64_t)v4);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v26 = (void *)*((void *)v4 + 4);
      id v9 = objc_allocWithZone(MEMORY[0x263F670E8]);
      id v10 = (void *)sub_25BC70CF0();
      swift_bridgeObjectRelease();
      uint64_t v11 = (void *)sub_25BC70CF0();
      swift_bridgeObjectRelease();
      uint64_t v12 = (void *)sub_25BC70CF0();
      swift_bridgeObjectRelease();
      id v13 = v26;
      a1 = objc_msgSend(v9, sel_initWithAskForTimeRequestIdentifier_childName_childDSID_requestedResourceName_, v10, v11, v26, v12);

      return a1;
    case 2u:
      a1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F67180]), sel_init);
      uint64_t v14 = sub_25BC70B40();
      (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v4, v14);
      return a1;
    case 3u:
      double v15 = *((double *)v4 + 6);
      id v16 = objc_allocWithZone(MEMORY[0x263F670C8]);
      uint64_t v17 = (void *)sub_25BC70CF0();
      swift_bridgeObjectRelease();
      uint64_t v18 = (void *)sub_25BC70CF0();
      swift_bridgeObjectRelease();
      id v19 = (void *)sub_25BC70CF0();
      swift_bridgeObjectRelease();
      id v20 = objc_msgSend(v16, sel_initWithAskForTimeRequestIdentifier_parentName_requestedResourceName_amountGranted_, v17, v18, v19, v15);
      goto LABEL_7;
    case 4u:
      id v21 = objc_allocWithZone(MEMORY[0x263F670E0]);
      uint64_t v17 = (void *)sub_25BC70CF0();
      swift_bridgeObjectRelease();
      uint64_t v18 = (void *)sub_25BC70CF0();
      swift_bridgeObjectRelease();
      id v19 = (void *)sub_25BC70CF0();
      swift_bridgeObjectRelease();
      id v20 = objc_msgSend(v21, sel_initWithAskForTimeRequestIdentifier_parentName_requestedResourceName_, v17, v18, v19);
LABEL_7:
      a1 = v20;

      return a1;
    case 5u:
      a1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F67188]), sel_init);
      objc_msgSend(a1, sel_setTimeLeft_, *MEMORY[0x263F672F8]);
      return a1;
    case 6u:
      uint64_t v22 = (objc_class *)MEMORY[0x263F671C0];
      goto LABEL_17;
    case 7u:
      uint64_t v22 = (objc_class *)MEMORY[0x263F671C8];
      goto LABEL_17;
    case 8u:
      uint64_t v22 = (objc_class *)MEMORY[0x263F67100];
      goto LABEL_17;
    case 9u:
      uint64_t v22 = (objc_class *)MEMORY[0x263F67228];
      goto LABEL_17;
    case 0xAu:
      sub_25BC7095C();
      swift_allocError();
      *uint64_t v23 = 1;
      swift_willThrow();
      return a1;
    case 0xBu:
      uint64_t v22 = (objc_class *)MEMORY[0x263F67250];
      goto LABEL_17;
    case 0xCu:
      uint64_t v22 = (objc_class *)MEMORY[0x263F67258];
      goto LABEL_17;
    case 0xDu:
      uint64_t v22 = (objc_class *)MEMORY[0x263F67298];
LABEL_17:
      a1 = objc_msgSend(objc_allocWithZone(v22), sel_init);
      break;
    default:
      double v5 = *((double *)v4 + 4);
      id v6 = objc_allocWithZone(MEMORY[0x263F670B0]);
      uint64_t v7 = (void *)sub_25BC70CF0();
      swift_bridgeObjectRelease();
      a1 = objc_msgSend(v6, sel_initWithIdentifier_, v7);

      uint64_t v8 = (void *)sub_25BC70CF0();
      swift_bridgeObjectRelease();
      objc_msgSend(a1, sel_setLimitDisplayName_timeLeft_, v8, v5);

      break;
  }
  return a1;
}

uint64_t sub_25BC6ED40(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for STUserNotifications.NotificationType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25BC6ED9C(uint64_t a1)
{
  v1[49] = a1;
  uint64_t v2 = sub_25BC70C90();
  v1[50] = v2;
  v1[51] = *(void *)(v2 - 8);
  v1[52] = swift_task_alloc();
  uint64_t v3 = sub_25BC70CC0();
  v1[53] = v3;
  v1[54] = *(void *)(v3 - 8);
  v1[55] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25BC6EEB8, 0, 0);
}

uint64_t sub_25BC6EEB8()
{
  uint64_t v1 = (void *)v0[49];
  id v2 = objc_msgSend(v1, sel_notificationContent);
  v0[56] = v2;
  v0[2] = v0;
  v0[3] = sub_25BC6EFD4;
  uint64_t v3 = swift_continuation_init();
  v0[42] = MEMORY[0x263EF8330];
  v0[43] = 0x40000000;
  v0[44] = sub_25BC6DAF8;
  v0[45] = &block_descriptor;
  v0[46] = v3;
  objc_msgSend(v1, sel_customizeNotificationContent_withCompletionBlock_, v2, v0 + 42);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_25BC6EFD4()
{
  return MEMORY[0x270FA2498](sub_25BC6F0B4, 0, 0);
}

uint64_t sub_25BC6F0B4()
{
  uint64_t v1 = *(void **)(v0 + 448);
  id v2 = *(void **)(v0 + 392);
  id v3 = objc_msgSend(v2, sel_identifier);
  sub_25BC70D20();

  id v4 = v1;
  id v5 = objc_msgSend(v2, sel_trigger);
  id v6 = (void *)sub_25BC70CF0();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(self, sel_requestWithIdentifier_content_trigger_, v6, v4, v5);
  *(void *)(v0 + 456) = v7;

  id v8 = objc_msgSend(v2, sel_destinations);
  if (v8)
  {
    id v9 = v8;
    objc_msgSend(v7, sel_setDestinations_, objc_msgSend(v8, sel_unsignedIntegerValue));
  }
  if (qword_26A553208 != -1) {
    swift_once();
  }
  id v10 = off_26A553748;
  id v11 = objc_msgSend(*(id *)(v0 + 392), sel_notificationBundleIdentifier);
  uint64_t v12 = sub_25BC70D20();
  uint64_t v14 = v13;

  if (v10[2] && (unint64_t v15 = sub_25BC673DC(v12, v14), (v16 & 1) != 0))
  {
    uint64_t v17 = *(void **)(v10[7] + 8 * v15);
    *(void *)(v0 + 464) = v17;
    id v18 = v17;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 144) = v0;
    *(void *)(v0 + 184) = v0 + 480;
    *(void *)(v0 + 152) = sub_25BC6F3DC;
    uint64_t v19 = swift_continuation_init();
    *(void *)(v0 + 256) = MEMORY[0x263EF8330];
    *(void *)(v0 + 264) = 0x40000000;
    *(void *)(v0 + 272) = sub_25BC6DB00;
    *(void *)(v0 + 280) = &block_descriptor_11;
    *(void *)(v0 + 288) = v19;
    objc_msgSend(v18, sel_requestAuthorizationWithOptions_completionHandler_, 66, v0 + 256);
    return MEMORY[0x270FA23F0](v0 + 144);
  }
  else
  {
    id v20 = *(void **)(v0 + 448);
    swift_bridgeObjectRelease();
    sub_25BC7095C();
    swift_allocError();
    *id v21 = 0;
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
    return v22();
  }
}

uint64_t sub_25BC6F3DC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 176);
  *(void *)(*(void *)v0 + 472) = v1;
  if (v1) {
    id v2 = sub_25BC6FA94;
  }
  else {
    id v2 = sub_25BC6F4EC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25BC6F4EC()
{
  if (*(unsigned char *)(v0 + 480))
  {
    uint64_t v1 = *(void **)(v0 + 464);
    *(void *)(v0 + 80) = v0;
    *(void *)(v0 + 120) = v0 + 376;
    *(void *)(v0 + 88) = sub_25BC6F650;
    uint64_t v2 = swift_continuation_init();
    *(void *)(v0 + 296) = MEMORY[0x263EF8330];
    *(void *)(v0 + 304) = 0x40000000;
    *(void *)(v0 + 312) = sub_25BC6DBB4;
    *(void *)(v0 + 320) = &block_descriptor_13;
    *(void *)(v0 + 328) = v2;
    objc_msgSend(v1, sel_getDeliveredNotificationsWithCompletionHandler_, v0 + 296);
    return MEMORY[0x270FA23F0](v0 + 80);
  }
  else
  {
    id v3 = *(void **)(v0 + 456);
    uint64_t v4 = *(void **)(v0 + 448);

    swift_task_dealloc();
    swift_task_dealloc();
    id v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_25BC6F650()
{
  return MEMORY[0x270FA2498](sub_25BC6F730, 0, 0);
}

uint64_t sub_25BC6F730()
{
  unint64_t v1 = v0[47];
  if (v1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    sub_25BC6147C(0, &qword_26A5537B0);
    uint64_t v3 = 0;
    while (1)
    {
      id v4 = (v1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x261173140](v3, v1) : *(id *)(v1 + 8 * v3 + 32);
      id v5 = v4;
      uint64_t v6 = v3 + 1;
      if (__OFADD__(v3, 1)) {
        break;
      }
      id v7 = objc_msgSend(v4, sel_request);
      char v8 = sub_25BC70E70();

      if (v8)
      {
        id v18 = (void *)v0[57];
        uint64_t v19 = (void *)v0[58];
        id v20 = (void *)v0[56];
        swift_bridgeObjectRelease();

        goto LABEL_12;
      }
      ++v3;
      if (v6 == v2) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25BC70FE0();
    swift_bridgeObjectRelease();
  }
LABEL_10:
  id v9 = (void *)v0[57];
  id v10 = (void *)v0[58];
  uint64_t v25 = (void *)v0[56];
  uint64_t v24 = v0[55];
  uint64_t v11 = v0[52];
  uint64_t v26 = v0[54];
  uint64_t v27 = v0[53];
  uint64_t v13 = v0[50];
  uint64_t v12 = v0[51];
  swift_bridgeObjectRelease();
  sub_25BC6147C(0, &qword_26A553438);
  uint64_t v14 = (void *)sub_25BC70E20();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v10;
  *(void *)(v15 + 24) = v9;
  v0[30] = sub_25BC709F0;
  v0[31] = v15;
  v0[26] = MEMORY[0x263EF8330];
  v0[27] = 1107296256;
  v0[28] = sub_25BC5F1F8;
  v0[29] = &block_descriptor_14;
  char v16 = _Block_copy(v0 + 26);
  id v23 = v10;
  id v17 = v9;
  sub_25BC70CA0();
  v0[48] = MEMORY[0x263F8EE78];
  sub_25BC70A1C(&qword_26A553468, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A553470);
  sub_25BC70A64();
  sub_25BC70EB0();
  MEMORY[0x261173010](0, v24, v11, v16);
  _Block_release(v16);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v27);
  swift_release();
LABEL_12:
  swift_task_dealloc();
  swift_task_dealloc();
  id v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_25BC6FA94()
{
  unint64_t v1 = (void *)v0[58];
  uint64_t v3 = (void *)v0[56];
  uint64_t v2 = (void *)v0[57];
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  id v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

void sub_25BC6FB2C(id a1)
{
  if (qword_26A553208 != -1) {
    swift_once();
  }
  uint64_t v2 = off_26A553748;
  id v3 = objc_msgSend(a1, sel_notificationBundleIdentifier);
  uint64_t v4 = sub_25BC70D20();
  uint64_t v6 = v5;

  if (v2[2] && (unint64_t v7 = sub_25BC673DC(v4, v6), (v8 & 1) != 0))
  {
    id v9 = *(id *)(v2[7] + 8 * v7);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5537A8);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_25BC71E20;
    id v11 = objc_msgSend(a1, sel_identifier);
    uint64_t v12 = sub_25BC70D20();
    uint64_t v14 = v13;

    *(void *)(v10 + 32) = v12;
    *(void *)(v10 + 40) = v14;
    uint64_t v15 = (void *)sub_25BC70D80();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_removeDeliveredNotificationsWithIdentifiers_, v15);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_25BC7095C();
    swift_allocError();
    *char v16 = 0;
    swift_willThrow();
  }
}

uint64_t sub_25BC6FCC0()
{
  return sub_25BC70A1C(&qword_26A553778, (void (*)(uint64_t))type metadata accessor for STUserNotifications.NotificationType);
}

unint64_t sub_25BC6FD0C()
{
  unint64_t result = qword_26A553780;
  if (!qword_26A553780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A553780);
  }
  return result;
}

ValueMetadata *type metadata accessor for STUserNotifications()
{
  return &type metadata for STUserNotifications;
}

uint64_t *initializeBufferWithCopyOfBuffer for STUserNotifications.NotificationType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        uint64_t v8 = a2[3];
        a1[2] = a2[2];
        a1[3] = v8;
        a1[4] = a2[4];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        uint64_t v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        uint64_t v12 = a2[3];
        a1[2] = a2[2];
        a1[3] = v12;
        uint64_t v14 = (void *)a2[4];
        uint64_t v13 = a2[5];
        a1[4] = (uint64_t)v14;
        a1[5] = v13;
        a1[6] = a2[6];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v15 = v14;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v16 = sub_25BC70B40();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v17 = a2[1];
        *a1 = *a2;
        a1[1] = v17;
        uint64_t v18 = a2[3];
        a1[2] = a2[2];
        a1[3] = v18;
        uint64_t v19 = a2[5];
        a1[4] = a2[4];
        a1[5] = v19;
        a1[6] = a2[6];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v20 = a2[1];
        *a1 = *a2;
        a1[1] = v20;
        uint64_t v21 = a2[3];
        a1[2] = a2[2];
        a1[3] = v21;
        uint64_t v22 = a2[4];
        uint64_t v23 = a2[5];
        a1[4] = v22;
        a1[5] = v23;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for STUserNotifications.NotificationType(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      swift_bridgeObjectRelease();
      goto LABEL_5;
    case 1:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      goto LABEL_5;
    case 2:
      uint64_t v3 = sub_25BC70B40();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      return v4(a1, v3);
    case 3:
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_5:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void *initializeWithCopy for STUserNotifications.NotificationType(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      uint64_t v7 = a2[3];
      a1[2] = a2[2];
      a1[3] = v7;
      a1[4] = a2[4];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 1u:
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      uint64_t v9 = a2[3];
      a1[2] = a2[2];
      a1[3] = v9;
      uint64_t v11 = (void *)a2[4];
      uint64_t v10 = a2[5];
      a1[4] = v11;
      a1[5] = v10;
      a1[6] = a2[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v12 = v11;
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 2u:
      uint64_t v13 = sub_25BC70B40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
      goto LABEL_8;
    case 3u:
      uint64_t v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      uint64_t v15 = a2[3];
      a1[2] = a2[2];
      a1[3] = v15;
      uint64_t v16 = a2[5];
      a1[4] = a2[4];
      a1[5] = v16;
      a1[6] = a2[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 4u:
      uint64_t v17 = a2[1];
      *a1 = *a2;
      a1[1] = v17;
      uint64_t v18 = a2[3];
      a1[2] = a2[2];
      a1[3] = v18;
      uint64_t v19 = a2[4];
      uint64_t v20 = a2[5];
      a1[4] = v19;
      a1[5] = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *assignWithCopy for STUserNotifications.NotificationType(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25BC6ED40((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 1u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        uint64_t v6 = (void *)a2[4];
        a1[4] = v6;
        a1[5] = a2[5];
        a1[6] = a2[6];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v7 = v6;
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 2u:
        uint64_t v8 = sub_25BC70B40();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
        goto LABEL_9;
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 4u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *initializeWithTake for STUserNotifications.NotificationType(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v6 = sub_25BC70B40();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for STUserNotifications.NotificationType(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25BC6ED40((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v6 = sub_25BC70B40();
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

uint64_t getEnumTagSinglePayload for STUserNotifications.NotificationType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for STUserNotifications.NotificationType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25BC706F0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25BC70700()
{
  uint64_t result = sub_25BC70B40();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for STUserNotifications.UserNotificationError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for STUserNotifications.UserNotificationError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25BC70910);
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

uint64_t sub_25BC70938(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25BC70940(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for STUserNotifications.UserNotificationError()
{
  return &type metadata for STUserNotifications.UserNotificationError;
}

unint64_t sub_25BC7095C()
{
  unint64_t result = qword_26A5537A0;
  if (!qword_26A5537A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5537A0);
  }
  return result;
}

uint64_t sub_25BC709B0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_25BC709F0()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_addNotificationRequest_withCompletionHandler_, *(void *)(v0 + 24), 0);
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

uint64_t sub_25BC70A1C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25BC70A64()
{
  unint64_t result = qword_26A553478;
  if (!qword_26A553478)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A553470);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A553478);
  }
  return result;
}

uint64_t sub_25BC70AC0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5537C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25BC70B20()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_25BC70B30()
{
  return MEMORY[0x270EEE748]();
}

uint64_t sub_25BC70B40()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_25BC70B50()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25BC70B60()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25BC70B70()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25BC70B80()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25BC70B90()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_25BC70BA0()
{
  return MEMORY[0x270EEB550]();
}

uint64_t sub_25BC70BB0()
{
  return MEMORY[0x270EEB558]();
}

uint64_t sub_25BC70BC0()
{
  return MEMORY[0x270F5CD28]();
}

uint64_t sub_25BC70BD0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25BC70BE0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25BC70BF0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25BC70C00()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_25BC70C10()
{
  return MEMORY[0x270EE3D78]();
}

uint64_t sub_25BC70C20()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_25BC70C30()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_25BC70C40()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_25BC70C50()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_25BC70C60()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_25BC70C70()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_25BC70C80()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_25BC70C90()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25BC70CA0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25BC70CB0()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_25BC70CC0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25BC70CD0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25BC70CE0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25BC70CF0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25BC70D00()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25BC70D10()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25BC70D20()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25BC70D30()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25BC70D40()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25BC70D50()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25BC70D60()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25BC70D70()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25BC70D80()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25BC70D90()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25BC70DA0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_25BC70DB0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25BC70DC0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25BC70DD0()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_25BC70DE0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25BC70DF0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25BC70E00()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25BC70E10()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25BC70E20()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25BC70E30()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25BC70E40()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25BC70E50()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_25BC70E60()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25BC70E70()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25BC70E80()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_25BC70E90()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25BC70EA0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25BC70EB0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25BC70EC0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25BC70ED0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25BC70EE0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25BC70EF0()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25BC70F00()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25BC70F10()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25BC70F20()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25BC70F30()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25BC70F40()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25BC70F50()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25BC70F60()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25BC70F70()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25BC70F80()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25BC70F90()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25BC70FA0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25BC70FB0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25BC70FC0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25BC70FD0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25BC70FE0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25BC70FF0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25BC71000()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25BC71010()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25BC71020()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25BC71040()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25BC71050()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25BC71060()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25BC71070()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25BC71080()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25BC71090()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25BC710A0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25BC710B0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25BC710C0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25BC710D0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25BC710E0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25BC710F0()
{
  return MEMORY[0x270F9FC90]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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