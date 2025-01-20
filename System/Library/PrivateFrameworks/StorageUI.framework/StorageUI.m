id STMGestaltTotalDiskCapacity()
{
  void *v0;
  uint64_t vars8;

  if (STMGestaltTotalDiskCapacity_onceToken[0] != -1) {
    dispatch_once(STMGestaltTotalDiskCapacity_onceToken, &__block_literal_global);
  }
  v0 = (void *)STMGestaltTotalDiskCapacity_totalDiskCapacity;
  return v0;
}

void __STMGestaltTotalDiskCapacity_block_invoke()
{
  id v2 = (id)MGCopyAnswer();
  uint64_t v0 = [v2 objectForKeyedSubscript:*MEMORY[0x263F8BD40]];
  v1 = (void *)STMGestaltTotalDiskCapacity_totalDiskCapacity;
  STMGestaltTotalDiskCapacity_totalDiskCapacity = v0;
}

uint64_t Array<A>.winingIdentifier.getter(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  uint64_t v1 = *(void *)(a1 + 32);
  sub_25E4E56E4(v1, *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
  return v1;
}

uint64_t sub_25E4E56E4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

double variable initialization expression of StorageGaugeView._gaugeHeight()
{
  return sub_25E4E5760(&qword_26A6F3228, (uint64_t)&qword_26A6F4980);
}

double variable initialization expression of StorageGaugeLegendView._spacingX()
{
  return sub_25E4E5760(&qword_26A6F3268, (uint64_t)&qword_26A6F49C0);
}

double variable initialization expression of StorageGaugeLegendView._spacingY()
{
  return sub_25E4E5760(&qword_26A6F3260, (uint64_t)&qword_26A6F49B8);
}

double sub_25E4E5760(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(double *)a2;
}

uint64_t sub_25E4E579C@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_25E4FDC68();
  uint64_t v2 = *MEMORY[0x263F1A030];
  uint64_t v3 = sub_25E4FD958();
  v4 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_25E4E5818()
{
  return swift_getOpaqueTypeMetadata2();
}

uint64_t sub_25E4E58AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E4E593C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 != 4) {
    MEMORY[0x2611DB240](a5);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F32D0);
  sub_25E4E5A60();
  sub_25E4E5BF8();
  return sub_25E4FDAC8();
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

unint64_t sub_25E4E5A60()
{
  unint64_t result = qword_26A6F32D8;
  if (!qword_26A6F32D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F32D0);
    sub_25E4E5B50();
    swift_getOpaqueTypeConformance2();
    sub_25E4E5BA4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F32D8);
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

unint64_t sub_25E4E5B50()
{
  unint64_t result = qword_26A6F32E0;
  if (!qword_26A6F32E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F32E0);
  }
  return result;
}

unint64_t sub_25E4E5BA4()
{
  unint64_t result = qword_26A6F32E8;
  if (!qword_26A6F32E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F32E8);
  }
  return result;
}

unint64_t sub_25E4E5BF8()
{
  unint64_t result = qword_26A6F32F0;
  if (!qword_26A6F32F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F32F0);
  }
  return result;
}

id variable initialization expression of FollowupMonitor.controller()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F35380]);
  return objc_msgSend(v0, sel_init);
}

uint64_t variable initialization expression of Volume.otherVolumesInContainer()
{
  return 0;
}

uint64_t _s9StorageUI9TimeStatsV15startMonitoring8Dispatch0gC0VSgvpfi_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25E4FDD28();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(a1, 1, 1, v2);
}

void type metadata accessor for URLResourceKey()
{
  if (!qword_26A6F32F8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A6F32F8);
    }
  }
}

uint64_t sub_25E4E5D60(uint64_t a1, uint64_t a2)
{
  return sub_25E4E5ECC(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_25E4E5D78(uint64_t a1, id *a2)
{
  uint64_t result = sub_25E4FDD48();
  *a2 = 0;
  return result;
}

uint64_t sub_25E4E5DF0(uint64_t a1, id *a2)
{
  char v3 = sub_25E4FDD58();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25E4E5E70@<X0>(uint64_t *a1@<X8>)
{
  sub_25E4FDD68();
  uint64_t v2 = sub_25E4FDD38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25E4E5EB4(uint64_t a1, uint64_t a2)
{
  return sub_25E4E5ECC(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_25E4E5ECC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_25E4FDD68();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25E4E5F10()
{
  sub_25E4FDD68();
  sub_25E4FDD78();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E4E5F64()
{
  sub_25E4FDD68();
  sub_25E4FDFF8();
  sub_25E4FDD78();
  uint64_t v0 = sub_25E4FE028();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25E4E5FD8()
{
  uint64_t v0 = sub_25E4FDD68();
  uint64_t v2 = v1;
  if (v0 == sub_25E4FDD68() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_25E4FDFC8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_25E4E6064@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25E4FDD38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25E4E60AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25E4FDD68();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25E4E60D8(uint64_t a1)
{
  uint64_t v2 = sub_25E4E620C(&qword_26A6F3318);
  uint64_t v3 = sub_25E4E620C(&qword_26A6F3320);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_25E4E6170()
{
  return sub_25E4E620C(&qword_26A6F3300);
}

uint64_t sub_25E4E61A4()
{
  return sub_25E4E620C(&qword_26A6F3308);
}

uint64_t sub_25E4E61D8()
{
  return sub_25E4E620C(&qword_26A6F3310);
}

uint64_t sub_25E4E620C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25E4E6250(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *(void *)a1 = *a2;
    a1 = v12 + ((v4 + 16) & ~(unint64_t)v4);
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
    uint64_t v7 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v7;
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    *(unsigned char *)(a1 + 49) = *((unsigned char *)a2 + 49);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    *(void *)(a1 + 72) = a2[9];
    *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *((unsigned char *)a2 + 80);
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (uint64_t)a2 + v8;
    uint64_t v10 = a1 + v8;
    *(void *)(a1 + 88) = a2[11];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v10, v9, v11);
  }
  return a1;
}

uint64_t sub_25E4E6384(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_25E4E6418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v6;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 80);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a2 + v7;
  uint64_t v9 = a1 + v7;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v9, v8, v10);
  return a1;
}

uint64_t sub_25E4E64FC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_25E4E6624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 80);
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a2 + v6;
  uint64_t v8 = a1 + v6;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, v7, v9);
  return a1;
}

uint64_t sub_25E4E66C4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v8;
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_25E4E67B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E4E67C8);
}

uint64_t sub_25E4E67C8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25E4E687C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E4E6890);
}

uint64_t sub_25E4E6890(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for StorageGaugeLegendItemView()
{
  uint64_t result = qword_26A6F3330;
  if (!qword_26A6F3330) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25E4E6988()
{
  sub_25E4E6A2C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25E4E6A2C()
{
  if (!qword_26A6F3340)
  {
    sub_25E4E6A88();
    unint64_t v0 = sub_25E4FD798();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6F3340);
    }
  }
}

unint64_t sub_25E4E6A88()
{
  unint64_t result = qword_26A6F3348;
  if (!qword_26A6F3348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3348);
  }
  return result;
}

uint64_t sub_25E4E6ADC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E4E6AF8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3350);
  MEMORY[0x270FA5388]();
  v49 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_25E4FDA38();
  uint64_t v5 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1[1];
  uint64_t v9 = a1[2];
  uint64_t v10 = a1[3];
  uint64_t v52 = *a1;
  *(void *)&long long v53 = v9;
  uint64_t v11 = a1[4];
  uint64_t v12 = a1[5];
  uint64_t v50 = v8;
  uint64_t v51 = v12;
  int v54 = *((unsigned __int8 *)a1 + 48);
  int v13 = *((unsigned __int8 *)a1 + 49);
  uint64_t v14 = a1[7];
  uint64_t v55 = v11;
  uint64_t v56 = v14;
  uint64_t v15 = a1[8];
  uint64_t v63 = a1[9];
  LODWORD(v14) = *((unsigned __int8 *)a1 + 80);
  int v65 = v13;
  int v66 = v14;
  swift_retain();
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  int v64 = sub_25E4FD9B8();
  type metadata accessor for StorageGaugeLegendItemView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  sub_25E4FD788();
  sub_25E4FD788();
  sub_25E4FDCE8();
  sub_25E4FD7A8();
  uint64_t v59 = v74;
  uint64_t v60 = v76;
  int v57 = v75;
  int v58 = v77;
  unint64_t v61 = v79;
  uint64_t v62 = v78;
  unsigned __int8 v81 = v75;
  unsigned __int8 v80 = v77;
  unsigned __int8 v82 = 1;
  uint64_t v103 = v9;
  *((void *)&v53 + 1) = v10;
  uint64_t v104 = v10;
  sub_25E4E734C();
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_25E4FDA98();
  uint64_t v45 = v17;
  uint64_t v46 = v18;
  LOBYTE(v1__isPlatformVersionAtLeast(2, 18, 1, 0) = v19 & 1;
  uint64_t v20 = v5;
  v21 = *(void (**)(char *, void, uint64_t))(v5 + 104);
  uint64_t v22 = v48;
  v21(v7, *MEMORY[0x263F1A710], v48);
  uint64_t v23 = sub_25E4FDA08();
  uint64_t v24 = (uint64_t)v49;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v49, 1, 1, v23);
  sub_25E4FDA18();
  sub_25E4E73A0(v24);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v22);
  uint64_t v25 = v45;
  uint64_t v26 = sub_25E4FDA88();
  uint64_t v47 = v27;
  LOBYTE(v24) = v28;
  v49 = v29;
  swift_release();
  LOBYTE(v7) = v24 & 1;
  sub_25E4E7400(v16, v25, v10);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  int v72 = v88;
  __int16 v73 = v89;
  v71[0] = *(_DWORD *)v87;
  *(_DWORD *)((char *)v71 + 3) = *(_DWORD *)&v87[3];
  int v69 = v85;
  char v70 = v86;
  *(_DWORD *)((char *)v68 + 3) = *(_DWORD *)&v84[3];
  v68[0] = *(_DWORD *)v84;
  *(_DWORD *)((char *)v67 + 3) = *(_DWORD *)&v83[3];
  v67[0] = *(_DWORD *)v83;
  LODWORD(v48) = v82;
  uint64_t v31 = v52;
  uint64_t v32 = v50;
  uint64_t v33 = v51;
  *(void *)&v90[0] = v52;
  *((void *)&v90[0] + 1) = v50;
  v90[1] = v53;
  *(void *)&long long v91 = v55;
  *((void *)&v91 + 1) = v51;
  LOBYTE(v92) = v54;
  BYTE1(v92) = v65;
  WORD3(v92) = v89;
  *(_DWORD *)((char *)&v92 + 2) = v88;
  *((void *)&v92 + 1) = v56;
  *(void *)&long long v93 = v15;
  *((void *)&v93 + 1) = v63;
  LOBYTE(v94) = v66;
  DWORD1(v94) = *(_DWORD *)&v87[3];
  *(_DWORD *)((char *)&v94 + 1) = *(_DWORD *)v87;
  *((void *)&v94 + 1) = v51;
  LOBYTE(v95) = v64;
  BYTE7(v95) = v86;
  *(_DWORD *)((char *)&v95 + 3) = v85;
  DWORD1(v96) = *(_DWORD *)&v84[3];
  *(_WORD *)((char *)&v95 + 1) = 256;
  *((void *)&v95 + 1) = v59;
  LOBYTE(v96) = v57;
  *(_DWORD *)((char *)&v96 + 1) = *(_DWORD *)v84;
  *((void *)&v96 + 1) = v60;
  LOBYTE(v97) = v58;
  DWORD1(v97) = *(_DWORD *)&v83[3];
  *(_DWORD *)((char *)&v97 + 1) = *(_DWORD *)v83;
  *((void *)&v97 + 1) = v62;
  long long v98 = v61;
  __int16 v99 = v82;
  long long v34 = v53;
  long long v35 = v91;
  *(_OWORD *)a2 = v90[0];
  *(_OWORD *)(a2 + 16) = v34;
  long long v36 = v92;
  long long v37 = v94;
  long long v38 = v95;
  *(_OWORD *)(a2 + 64) = v93;
  *(_OWORD *)(a2 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v37;
  *(_OWORD *)(a2 + 32) = v35;
  *(_OWORD *)(a2 + 48) = v36;
  long long v39 = v96;
  long long v40 = v97;
  long long v41 = v98;
  *(_WORD *)(a2 + 16__isPlatformVersionAtLeast(2, 18, 1, 0) = v99;
  *(_OWORD *)(a2 + 128) = v40;
  *(_OWORD *)(a2 + 144) = v41;
  *(_OWORD *)(a2 + 96) = v38;
  *(_OWORD *)(a2 + 112) = v39;
  char v102 = (char)v7;
  char v100 = 0;
  *(_DWORD *)(a2 + 185) = *(_DWORD *)v101;
  *(_DWORD *)(a2 + 188) = *(_DWORD *)&v101[3];
  uint64_t v42 = v47;
  *(void *)(a2 + 168) = v26;
  *(void *)(a2 + 176) = v42;
  *(unsigned char *)(a2 + 184) = (_BYTE)v7;
  *(void *)(a2 + 192) = v49;
  *(void *)(a2 + 20__isPlatformVersionAtLeast(2, 18, 1, 0) = KeyPath;
  *(void *)(a2 + 208) = 1;
  *(unsigned char *)(a2 + 216) = 0;
  sub_25E4E7474((uint64_t)v90);
  sub_25E4E74E0(v26, v42, (char)v7);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25E4E7400(v26, v42, (char)v7);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v103 = v31;
  uint64_t v104 = v32;
  long long v105 = v53;
  uint64_t v106 = v55;
  uint64_t v107 = v33;
  char v108 = v54;
  char v109 = v65;
  int v110 = v72;
  __int16 v111 = v73;
  uint64_t v112 = v56;
  uint64_t v113 = v15;
  uint64_t v114 = v63;
  char v115 = v66;
  *(_DWORD *)v116 = v71[0];
  *(_DWORD *)&v116[3] = *(_DWORD *)((char *)v71 + 3);
  uint64_t v117 = v33;
  char v118 = v64;
  __int16 v119 = 256;
  char v121 = v70;
  int v120 = v69;
  uint64_t v122 = v59;
  char v123 = v57;
  *(_DWORD *)&v124[3] = *(_DWORD *)((char *)v68 + 3);
  *(_DWORD *)v124 = v68[0];
  uint64_t v125 = v60;
  char v126 = v58;
  *(_DWORD *)v127 = v67[0];
  *(_DWORD *)&v127[3] = *(_DWORD *)((char *)v67 + 3);
  uint64_t v128 = v62;
  unint64_t v129 = v61;
  uint64_t v130 = 0;
  __int16 v131 = v48;
  return sub_25E4E74F0((uint64_t)&v103);
}

uint64_t sub_25E4E7180()
{
  return sub_25E4FDAE8();
}

double sub_25E4E719C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  if (qword_26A6F3258 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_26A6F49B0;
  uint64_t v5 = sub_25E4FD908();
  sub_25E4E6AF8(v2, (uint64_t)v14);
  *(_OWORD *)&v16[167] = v14[10];
  *(_OWORD *)&v16[183] = v14[11];
  *(_OWORD *)&v16[199] = v15[0];
  *(_OWORD *)&v16[208] = *(_OWORD *)((char *)v15 + 9);
  *(_OWORD *)&v16[103] = v14[6];
  *(_OWORD *)&v16[119] = v14[7];
  *(_OWORD *)&v16[135] = v14[8];
  *(_OWORD *)&v16[151] = v14[9];
  *(_OWORD *)&v16[39] = v14[2];
  *(_OWORD *)&v16[55] = v14[3];
  *(_OWORD *)&v16[71] = v14[4];
  *(_OWORD *)&v16[87] = v14[5];
  *(_OWORD *)&v16[7] = v14[0];
  *(_OWORD *)&v16[23] = v14[1];
  long long v6 = *(_OWORD *)&v16[176];
  *(_OWORD *)(a1 + 177) = *(_OWORD *)&v16[160];
  *(_OWORD *)(a1 + 193) = v6;
  long long v7 = *(_OWORD *)&v16[208];
  *(_OWORD *)(a1 + 209) = *(_OWORD *)&v16[192];
  *(_OWORD *)(a1 + 225) = v7;
  long long v8 = *(_OWORD *)&v16[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v16[96];
  *(_OWORD *)(a1 + 129) = v8;
  long long v9 = *(_OWORD *)&v16[144];
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v16[128];
  *(_OWORD *)(a1 + 161) = v9;
  long long v10 = *(_OWORD *)&v16[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v16[32];
  *(_OWORD *)(a1 + 65) = v10;
  long long v11 = *(_OWORD *)&v16[80];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v16[64];
  *(_OWORD *)(a1 + 97) = v11;
  double result = *(double *)v16;
  long long v13 = *(_OWORD *)&v16[16];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v16;
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 33) = v13;
  return result;
}

unint64_t sub_25E4E734C()
{
  unint64_t result = qword_26A6F3358;
  if (!qword_26A6F3358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3358);
  }
  return result;
}

uint64_t sub_25E4E73A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3350);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25E4E7400(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25E4E7410@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_25E4FD8C8();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_25E4E7444()
{
  return sub_25E4FD8D8();
}

uint64_t sub_25E4E7474(uint64_t a1)
{
  return a1;
}

uint64_t sub_25E4E74E0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_25E4E74F0(uint64_t a1)
{
  return a1;
}

unint64_t sub_25E4E7560()
{
  unint64_t result = qword_26A6F3360;
  if (!qword_26A6F3360)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F3368);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3360);
  }
  return result;
}

uint64_t sub_25E4E75BC()
{
  if (qword_26A6F3280 != -1) {
    swift_once();
  }
  qword_26A6F4978 = qword_26A6F49D8;
  return swift_retain();
}

void sub_25E4E7620()
{
  qword_26A6F4980 = 0x4035000000000000;
}

void sub_25E4E7630()
{
  qword_26A6F4988 = 0x3FF0000000000000;
}

void sub_25E4E7640()
{
  qword_26A6F4990 = 0x4024000000000000;
}

void sub_25E4E7650()
{
  qword_26A6F4998 = 0x3FF0000000000000;
}

void sub_25E4E7660()
{
  qword_26A6F49A0 = 0x3FF0000000000000;
}

void sub_25E4E7670()
{
  qword_26A6F49A8 = 0x4008000000000000;
}

void sub_25E4E7680()
{
  qword_26A6F49B0 = 0x4010000000000000;
}

void sub_25E4E7690()
{
  qword_26A6F49B8 = 0x4024000000000000;
}

void sub_25E4E76A0()
{
  qword_26A6F49C0 = 0x4024000000000000;
}

void sub_25E4E76B0()
{
  qword_26A6F49C8 = 0x4020000000000000;
}

uint64_t sub_25E4E76C0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3370);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25E4FE9B0;
  *(void *)(v0 + 32) = sub_25E4FDB48();
  *(void *)(v0 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = sub_25E4FDBF8();
  *(void *)(v0 + 48) = sub_25E4FDC18();
  *(void *)(v0 + 56) = sub_25E4FDBC8();
  *(void *)(v0 + 64) = sub_25E4FDB88();
  *(void *)(v0 + 72) = sub_25E4FDBA8();
  *(void *)(v0 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = sub_25E4FDB68();
  *(void *)(v0 + 88) = sub_25E4FDB58();
  *(void *)(v0 + 96) = sub_25E4FDBE8();
  *(void *)(v0 + 104) = sub_25E4FDC08();
  *(void *)(v0 + 112) = sub_25E4FDB98();
  uint64_t result = sub_25E4FDDC8();
  qword_26A6F49D0 = v0;
  return result;
}

uint64_t sub_25E4E777C(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  if (qword_26A6F3278 != -1) {
    goto LABEL_13;
  }
  while (1)
  {
    uint64_t v2 = qword_26A6F49D0;
    uint64_t v3 = *(void *)(qword_26A6F49D0 + 16);
    if (!v3)
    {
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
    }
    unint64_t v4 = a1 % v3;
    if (a1 / v3 >= 1) {
      break;
    }
    if ((v4 & 0x8000000000000000) != 0) {
      goto LABEL_16;
    }
    if (v4 < v3) {
      goto LABEL_9;
    }
LABEL_12:
    __break(1u);
LABEL_13:
    swift_once();
  }
  if ((v4 & 0x8000000000000000) != 0) {
    goto LABEL_15;
  }
  swift_retain();
  a1 = sub_25E4FDB08();
  swift_release();
  if (a1)
  {
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithCGColor_, a1);
    uint64_t v9 = 0;
    v10[0] = 0;
    uint64_t v8 = 0;
    objc_msgSend(v5, sel_getHue_saturation_brightness_alpha_, &v8, &v9, v10, 0);
    uint64_t v6 = sub_25E4FDB38();

    return v6;
  }
  uint64_t v2 = qword_26A6F49D0;
  if (v4 >= *(void *)(qword_26A6F49D0 + 16)) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v6 = *(void *)(v2 + 8 * v4 + 32);
  swift_retain();
  return v6;
}

uint64_t sub_25E4E791C(uint64_t a1)
{
  return sub_25E4E7958(a1, (SEL *)&selRef_systemGroupedBackgroundColor, &qword_26A6F49D8);
}

uint64_t sub_25E4E7930(uint64_t a1)
{
  return sub_25E4E7958(a1, (SEL *)&selRef_opaqueSeparatorColor, &qword_26A6F49E0);
}

uint64_t sub_25E4E7944(uint64_t a1)
{
  return sub_25E4E7958(a1, (SEL *)&selRef_opaqueSeparatorColor, &qword_26A6F49E8);
}

uint64_t sub_25E4E7958(uint64_t a1, SEL *a2, uint64_t *a3)
{
  id v4 = [self *a2];
  uint64_t result = MEMORY[0x2611DB360](v4);
  *a3 = result;
  return result;
}

uint64_t StorageGaugeView.init(capacity:categories:available:onSelect:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  type metadata accessor for StorageGaugeView();
  if (qword_26A6F3228 != -1) {
LABEL_31:
  }
    swift_once();
  *(void *)&v45[0] = qword_26A6F4980;
  sub_25E4E6A88();
  sub_25E4FD778();
  *a6 = a1;
  a6[2] = a4;
  a6[3] = a5;
  *(void *)&v45[0] = a2;
  sub_25E4E9970(a4);
  swift_bridgeObjectRetain();
  sub_25E4E9904((uint64_t *)v45);
  swift_bridgeObjectRelease();
  a2 = *(void *)&v45[0];
  uint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = (void *)sub_25E4E9154(v14);
  swift_release_n();
  uint64_t v16 = v15[2];
  if (v16)
  {
    uint64_t v17 = 0;
    uint64_t v18 = v15 + 8;
    do
    {
      uint64_t v19 = *v18;
      v18 += 11;
      BOOL v20 = __OFADD__(v17, v19);
      v17 += v19;
      if (v20)
      {
        __break(1u);
        goto LABEL_31;
      }
      --v16;
    }
    while (v16);
    uint64_t v21 = v17 + a3;
    if (!__OFADD__(v17, a3)) {
      goto LABEL_7;
    }
    __break(1u);
LABEL_18:
    uint64_t v27 = 0;
    goto LABEL_20;
  }
  uint64_t v17 = 0;
  uint64_t v21 = a3;
LABEL_7:
  uint64_t v6 = a1 - v21;
  if (__OFSUB__(a1, v21))
  {
    __break(1u);
    goto LABEL_33;
  }
  unint64_t v7 = 0x26A6F3000uLL;
  if (!v6) {
    goto LABEL_18;
  }
  uint64_t v43 = a3;
  if (qword_26A6F32A0 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_25E4FD6F8();
  __swift_project_value_buffer(v22, (uint64_t)qword_26A6F4A08);
  uint64_t v23 = sub_25E4FD6D8();
  os_log_type_t v24 = sub_25E4FDE58();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v42 = a4;
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 134218752;
    *(void *)&v45[0] = v17;
    uint64_t v8 = (uint64_t)v45 + 8;
    sub_25E4FDE98();
    *(_WORD *)(v25 + 12) = 2048;
    *(void *)&v45[0] = v43;
    sub_25E4FDE98();
    *(_WORD *)(v25 + 22) = 2048;
    *(void *)&v45[0] = a1;
    sub_25E4FDE98();
    *(_WORD *)(v25 + 32) = 2048;
    unint64_t v7 = 0x26A6F3000uLL;
    *(void *)&v45[0] = v6;
    sub_25E4FDE98();
    _os_log_impl(&dword_25E4E3000, v23, v24, "Sum of all categories and available space doe not match capacity of the volume, the proportions of the gauge will be adjusted. Sum of categories: %lld, available: %lld, capacity: %lld. Difference is %lld", (uint8_t *)v25, 0x2Au);
    uint64_t v26 = v25;
    a4 = v42;
    MEMORY[0x2611DBE80](v26, -1, -1);
  }

  a3 = a1 - v17;
  if (__OFSUB__(a1, v17))
  {
    __break(1u);
LABEL_36:
    swift_once();
    goto LABEL_23;
  }
  if (v6 < 0)
  {
    uint64_t v27 = -v6;
    if (__OFSUB__(0, v6))
    {
      __break(1u);
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t v27 = v6;
  }
LABEL_20:
  uint64_t v8 = a1 / 999;
  uint64_t v17 = a1 / 999 - v27;
  if (__OFSUB__(a1 / 999, v27))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v17 < 1) {
    goto LABEL_26;
  }
  if (*(void *)(v7 + 672) != -1) {
    goto LABEL_36;
  }
LABEL_23:
  uint64_t v28 = sub_25E4FD6F8();
  __swift_project_value_buffer(v28, (uint64_t)qword_26A6F4A08);
  v29 = sub_25E4FD6D8();
  os_log_type_t v30 = sub_25E4FDE58();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = a3;
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 134218240;
    *(void *)&v45[0] = v6;
    sub_25E4FDE98();
    *(_WORD *)(v32 + 12) = 2048;
    *(void *)&v45[0] = v8;
    sub_25E4FDE98();
    _os_log_impl(&dword_25E4E3000, v29, v30, "As the diff %lld is superior to the threshold (%lld), the available space will not be displayed in the gauge to prevent displaying a wrong value", (uint8_t *)v32, 0x16u);
    uint64_t v33 = v32;
    a3 = v31;
    MEMORY[0x2611DBE80](v33, -1, -1);
  }

LABEL_26:
  sub_25E4EFBC8(a3, v17 > 0, (uint64_t)v45);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_34:
  }
    uint64_t v15 = sub_25E4E94D8(0, v15[2] + 1, 1, v15);
  unint64_t v35 = v15[2];
  unint64_t v34 = v15[3];
  if (v35 >= v34 >> 1) {
    uint64_t v15 = sub_25E4E94D8((void *)(v34 > 1), v35 + 1, 1, v15);
  }
  _OWORD v15[2] = v35 + 1;
  long long v36 = &v15[11 * v35];
  long long v37 = v45[1];
  *((_OWORD *)v36 + 2) = v45[0];
  *((_OWORD *)v36 + 3) = v37;
  long long v38 = v45[2];
  long long v39 = v45[3];
  long long v40 = v45[4];
  *((unsigned char *)v36 + 112) = v46;
  *((_OWORD *)v36 + 5) = v39;
  *((_OWORD *)v36 + 6) = v40;
  *((_OWORD *)v36 + 4) = v38;
  uint64_t result = sub_25E4EA568(a4);
  a6[1] = v15;
  a6[4] = a3;
  return result;
}

uint64_t type metadata accessor for StorageGaugeView()
{
  uint64_t result = qword_26A6F3378;
  if (!qword_26A6F3378) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t property wrapper backing initializer of StorageGaugeView.gaugeHeight()
{
  return sub_25E4FD778();
}

double StorageGaugeView.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for StorageGaugeView() - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388]();
  sub_25E4EB664(v1, (uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for StorageGaugeView);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_25E4EB86C((uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, (uint64_t (*)(void))type metadata accessor for StorageGaugeView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  sub_25E4FD788();
  sub_25E4FDCE8();
  sub_25E4FD7A8();
  uint64_t v7 = v12;
  char v8 = v13;
  uint64_t v9 = v14;
  char v10 = v15;
  *(void *)a1 = sub_25E4EA57C;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  *(unsigned char *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v10;
  double result = *(double *)&v16;
  *(_OWORD *)(a1 + 48) = v16;
  return result;
}

uint64_t sub_25E4E80B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v83 = a1;
  uint64_t v93 = a3;
  uint64_t v96 = sub_25E4FD898();
  MEMORY[0x270FA5388](v96);
  long long v94 = (void *)((char *)v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v84 = sub_25E4FD888();
  MEMORY[0x270FA5388](v84);
  char v86 = (uint64_t (*)(void))((char *)v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33B8);
  MEMORY[0x270FA5388](v6 - 8);
  v90 = (uint64_t (*)(void))((char *)v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33C0);
  MEMORY[0x270FA5388](v88);
  uint64_t v91 = (uint64_t)v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33C8);
  MEMORY[0x270FA5388](v89);
  long long v92 = (char *)v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25E4FD7C8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v80 = v12;
  char v13 = (char *)v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for StorageGaugeView();
  uint64_t v79 = *(void *)(v14 - 8);
  uint64_t v15 = *(void *)(v79 + 64);
  MEMORY[0x270FA5388](v14 - 8);
  long long v16 = (char *)v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33D0);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)v78 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33D8);
  MEMORY[0x270FA5388](v81);
  uint64_t v21 = (char *)v78 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33E0);
  MEMORY[0x270FA5388](v82);
  uint64_t v95 = (uint64_t)v78 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33E8);
  MEMORY[0x270FA5388](v85);
  v87 = (char *)v78 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A6F3230 != -1) {
    swift_once();
  }
  uint64_t v24 = qword_26A6F4988;
  *(void *)uint64_t v19 = sub_25E4FD908();
  *((void *)v19 + 1) = v24;
  v19[16] = 0;
  v78[1] = &v19[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33F0) + 44)];
  uint64_t v25 = swift_bridgeObjectRetain();
  uint64_t v26 = sub_25E4F3F04(v25);
  swift_bridgeObjectRelease();
  *(void *)&long long v97 = v26;
  v78[0] = swift_getKeyPath();
  sub_25E4EB664(a2, (uint64_t)v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for StorageGaugeView);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v83, v10);
  unint64_t v27 = (*(unsigned __int8 *)(v79 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
  unint64_t v28 = (v15 + *(unsigned __int8 *)(v11 + 80) + v27) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v29 = swift_allocObject();
  sub_25E4EB86C((uint64_t)v16, v29 + v27, (uint64_t (*)(void))type metadata accessor for StorageGaugeView);
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v29 + v28, v13, v10);
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = sub_25E4EB378;
  *(void *)(v30 + 24) = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3400);
  sub_25E4EB500(&qword_26A6F3408, &qword_26A6F33F8);
  sub_25E4EB544();
  sub_25E4EB598();
  sub_25E4FDCD8();
  if (qword_26A6F3220 != -1) {
    swift_once();
  }
  uint64_t v31 = qword_26A6F4978;
  swift_retain();
  char v32 = sub_25E4FD9B8();
  sub_25E4EB72C((uint64_t)v19, (uint64_t)v21, &qword_26A6F33D0);
  uint64_t v33 = &v21[*(int *)(v81 + 36)];
  *(void *)uint64_t v33 = v31;
  v33[8] = v32;
  sub_25E4EB790((uint64_t)v19, &qword_26A6F33D0);
  uint64_t v34 = sub_25E4FDCF8();
  uint64_t v35 = *(void *)(a2 + 8);
  uint64_t v36 = v95;
  sub_25E4EB72C((uint64_t)v21, v95, &qword_26A6F33D8);
  long long v37 = (uint64_t *)(v36 + *(int *)(v82 + 36));
  *long long v37 = v34;
  v37[1] = v35;
  swift_bridgeObjectRetain();
  sub_25E4EB790((uint64_t)v21, &qword_26A6F33D8);
  if (qword_26A6F3250 != -1) {
    swift_once();
  }
  uint64_t v38 = qword_26A6F49A8;
  long long v39 = v94;
  long long v40 = (char *)v94 + *(int *)(v96 + 20);
  uint64_t v41 = *MEMORY[0x263F19860];
  uint64_t v42 = sub_25E4FD928();
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v42 - 8) + 104);
  v43(v40, v41, v42);
  *long long v39 = v38;
  v39[1] = v38;
  uint64_t v44 = v86;
  sub_25E4EB664((uint64_t)v39, (uint64_t)v86, MEMORY[0x263F19048]);
  *(void *)((char *)v44 + *(int *)(v84 + 20)) = 0xBFF0000000000000;
  sub_25E4EB6CC((uint64_t)v39, MEMORY[0x263F19048]);
  uint64_t v45 = v90;
  if (qword_26A6F3280 != -1) {
    swift_once();
  }
  uint64_t v46 = sub_25E4FDC28();
  sub_25E4FD768();
  sub_25E4EB664((uint64_t)v44, (uint64_t)v45, MEMORY[0x263F19028]);
  uint64_t v47 = (char *)v45 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3428) + 36);
  long long v48 = v98;
  *(_OWORD *)uint64_t v47 = v97;
  *((_OWORD *)v47 + 1) = v48;
  *((void *)v47 + 4) = v99;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3430);
  *(void *)((char *)v45 + *(int *)(v49 + 52)) = v46;
  *(_WORD *)((char *)v45 + *(int *)(v49 + 56)) = 256;
  uint64_t v50 = sub_25E4FDCE8();
  uint64_t v52 = v51;
  long long v53 = (uint64_t *)((char *)v45 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3438) + 36));
  *long long v53 = v50;
  v53[1] = v52;
  sub_25E4EB6CC((uint64_t)v44, MEMORY[0x263F19028]);
  if (qword_26A6F3288 != -1) {
    swift_once();
  }
  uint64_t v54 = qword_26A6F49E0;
  if (qword_26A6F3240 != -1) {
    swift_once();
  }
  uint64_t v55 = qword_26A6F4998;
  if (qword_26A6F3248 != -1) {
    swift_once();
  }
  uint64_t v56 = qword_26A6F49A0;
  uint64_t v57 = v91;
  sub_25E4EB72C((uint64_t)v45, v91, &qword_26A6F33B8);
  int v58 = (uint64_t *)(v57 + *(int *)(v88 + 36));
  *int v58 = v54;
  v58[1] = v55;
  v58[2] = v56;
  v58[3] = v56;
  swift_retain();
  sub_25E4EB790((uint64_t)v45, &qword_26A6F33B8);
  uint64_t v59 = qword_26A6F49A8;
  uint64_t v60 = v94;
  v43((char *)v94 + *(int *)(v96 + 20), v41, v42);
  *uint64_t v60 = v59;
  v60[1] = v59;
  uint64_t v61 = *(int *)(v89 + 36);
  uint64_t v88 = v42;
  uint64_t v62 = (uint64_t)v92;
  uint64_t v63 = &v92[v61];
  v90 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_25E4EB664((uint64_t)v60, (uint64_t)&v92[v61], MEMORY[0x263F19048]);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3440);
  *(_WORD *)&v63[*(int *)(v89 + 36)] = 256;
  sub_25E4EB72C(v57, v62, &qword_26A6F33C0);
  char v86 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_25E4EB6CC((uint64_t)v60, MEMORY[0x263F19048]);
  sub_25E4EB790(v57, &qword_26A6F33C0);
  uint64_t v64 = sub_25E4FDCE8();
  uint64_t v66 = v65;
  uint64_t v67 = v41;
  uint64_t v68 = (uint64_t)v87;
  int v69 = v43;
  uint64_t v70 = (uint64_t)&v87[*(int *)(v85 + 36)];
  sub_25E4EB72C(v62, v70, &qword_26A6F33C8);
  v71 = (uint64_t *)(v70 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3448) + 36));
  uint64_t *v71 = v64;
  v71[1] = v66;
  uint64_t v72 = v95;
  sub_25E4EB72C(v95, v68, &qword_26A6F33E0);
  sub_25E4EB790(v62, &qword_26A6F33C8);
  sub_25E4EB790(v72, &qword_26A6F33E0);
  uint64_t v73 = qword_26A6F49A8;
  v69((char *)v60 + *(int *)(v96 + 20), v67, v88);
  *uint64_t v60 = v73;
  v60[1] = v73;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3450);
  uint64_t v75 = v93;
  uint64_t v76 = v93 + *(int *)(v74 + 36);
  sub_25E4EB664((uint64_t)v60, v76, v90);
  *(_WORD *)(v76 + *(int *)(v89 + 36)) = 256;
  sub_25E4EB72C(v68, v75, &qword_26A6F33E8);
  sub_25E4EB6CC((uint64_t)v60, v86);
  return sub_25E4EB790(v68, &qword_26A6F33E8);
}

uint64_t sub_25E4E8CA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for StorageGaugeItemView();
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v27 - v13;
  float v15 = (float)*(uint64_t *)(a2 + 32) / (float)*a3;
  if (v15 <= 0.001)
  {
    uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    return v26(a4, 1, 1, v8);
  }
  else
  {
    uint64_t v27 = v12;
    sub_25E4EB7EC(a2);
    sub_25E4FD7B8();
    double v17 = v16;
    if (qword_26A6F3230 != -1) {
      swift_once();
    }
    if (*(double *)&qword_26A6F4988 > v17 * v15 - *(double *)&qword_26A6F4988) {
      double v18 = *(double *)&qword_26A6F4988;
    }
    else {
      double v18 = v17 * v15 - *(double *)&qword_26A6F4988;
    }
    uint64_t v19 = a3[2];
    uint64_t v20 = a3[3];
    *(void *)&v11[*(int *)(v8 + 36)] = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3458);
    swift_storeEnumTagMultiPayload();
    sub_25E4E9970(v19);
    if (qword_26A6F3228 != -1) {
      swift_once();
    }
    uint64_t v21 = qword_26A6F4980;
    long long v22 = *(_OWORD *)(a2 + 48);
    *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
    *((_OWORD *)v11 + 3) = v22;
    *((_OWORD *)v11 + 4) = *(_OWORD *)(a2 + 64);
    v11[80] = *(unsigned char *)(a2 + 80);
    long long v23 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)uint64_t v11 = *(_OWORD *)a2;
    *((_OWORD *)v11 + 1) = v23;
    *((void *)v11 + 11) = a1;
    *((double *)v11 + 12) = v18;
    *((void *)v11 + 13) = v19;
    *((void *)v11 + 14) = v20;
    char v28 = 0;
    sub_25E4FDC38();
    uint64_t v24 = v30;
    v11[120] = v29;
    *((void *)v11 + 16) = v24;
    uint64_t v29 = v21;
    sub_25E4E6A88();
    sub_25E4FD778();
    sub_25E4EB86C((uint64_t)v11, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for StorageGaugeItemView);
    sub_25E4EB86C((uint64_t)v14, a4, (uint64_t (*)(void))type metadata accessor for StorageGaugeItemView);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56))(a4, 0, 1, v8);
  }
}

double sub_25E4E8FC4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388]();
  sub_25E4EB664(v2, (uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for StorageGaugeView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  sub_25E4EB86C((uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, (uint64_t (*)(void))type metadata accessor for StorageGaugeView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  sub_25E4FD788();
  sub_25E4FDCE8();
  sub_25E4FD7A8();
  uint64_t v8 = v13;
  char v9 = v14;
  uint64_t v10 = v15;
  char v11 = v16;
  *(void *)a2 = sub_25E4EA57C;
  *(void *)(a2 + 8) = v7;
  *(void *)(a2 + 16) = v8;
  *(unsigned char *)(a2 + 24) = v9;
  *(void *)(a2 + 32) = v10;
  *(unsigned char *)(a2 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v11;
  double result = *(double *)&v17;
  *(_OWORD *)(a2 + 48) = v17;
  return result;
}

uint64_t sub_25E4E9154(uint64_t a1)
{
  uint64_t v25 = MEMORY[0x263F8EE78];
  sub_25E4F7C18(0, 0, 0);
  uint64_t v2 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v17 = v2;
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = (uint64_t *)(a1 + 56);
    do
    {
      uint64_t v5 = *(v4 - 2);
      uint64_t v6 = *v4;
      uint64_t v23 = *(v4 - 1);
      uint64_t v24 = *(v4 - 3);
      uint64_t v22 = v4[1];
      char v7 = *((unsigned char *)v4 + 24);
      char v19 = *((unsigned char *)v4 + 25);
      uint64_t v18 = v4[4];
      uint64_t v8 = v4[5];
      uint64_t v9 = v4[6];
      char v21 = *((unsigned char *)v4 + 56);
      if (v9)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        swift_retain();
        uint64_t v10 = v9;
        char v20 = v7;
        if (v7) {
          goto LABEL_5;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        uint64_t v10 = sub_25E4E777C(v3);
        char v20 = v7;
        if (v7)
        {
LABEL_5:
          uint64_t v11 = qword_26A6F3280;
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v11 != -1) {
            swift_once();
          }
          uint64_t v12 = qword_26A6F49D8;
          swift_retain();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_10;
        }
      }
      swift_retain();
      swift_retain();
      swift_release();
      swift_release();
      uint64_t v12 = v10;
LABEL_10:
      unint64_t v14 = *(void *)(v25 + 16);
      unint64_t v13 = *(void *)(v25 + 24);
      if (v14 >= v13 >> 1) {
        sub_25E4F7C18(v13 > 1, v14 + 1, 1);
      }
      ++v3;
      *(void *)(v25 + 16) = v14 + 1;
      uint64_t v15 = v25 + 88 * v14;
      *(void *)(v15 + 32) = v24;
      *(void *)(v15 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v5;
      *(void *)(v15 + 48) = v23;
      *(void *)(v15 + 56) = v6;
      *(void *)(v15 + 64) = v22;
      *(void *)(v15 + 72) = v12;
      *(unsigned char *)(v15 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v20;
      *(unsigned char *)(v15 + 81) = v19;
      *(void *)(v15 + 88) = v18;
      *(void *)(v15 + 96) = v8;
      *(void *)(v15 + 104) = v10;
      v4 += 11;
      *(unsigned char *)(v15 + 112) = v21;
    }
    while (v17 != v3);
  }
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_25E4E93C4(uint64_t a1)
{
  sub_25E4FD748();
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25E4FD8B8();
}

uint64_t sub_25E4E948C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25E4E949C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void *sub_25E4E94D8(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3460);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 88);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[11 * v8 + 4]) {
          memmove(v12, a4 + 4, 88 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25E4EAD80(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25E4E9600(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33A8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25E4EAF60(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25E4E9710(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33B0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_25E4EAE74(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25E4E9820@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void *sub_25E4E9850(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_25E4FDF88();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

unsigned char **sub_25E4E98F4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_25E4E9904(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25E4EF000(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_25E4E99B8(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_25E4E9970(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25E4E99B8(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_25E4FDFA8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_138;
    }
    if (v3) {
      return sub_25E4EA184(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_146;
  }
  uint64_t v119 = result;
  uint64_t v130 = v1;
  v116 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    uint64_t v128 = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      int64_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_104:
      uint64_t v106 = v11;
      uint64_t v118 = v8;
      if (v12 >= 2)
      {
        uint64_t v107 = *v116;
        do
        {
          unint64_t v108 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_133;
          }
          if (!v107) {
            goto LABEL_145;
          }
          char v109 = v106;
          uint64_t v110 = *(void *)&v106[16 * v108 + 32];
          uint64_t v111 = *(void *)&v106[16 * v12 + 24];
          sub_25E4EA270((char *)(v107 + 88 * v110), (char *)(v107 + 88 * *(void *)&v106[16 * v12 + 16]), v107 + 88 * v111, v128);
          if (v130) {
            break;
          }
          if (v111 < v110) {
            goto LABEL_134;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v109 = sub_25E4EEA40((uint64_t)v109);
          }
          if (v108 >= *((void *)v109 + 2)) {
            goto LABEL_135;
          }
          uint64_t v112 = &v109[16 * v108 + 32];
          *(void *)uint64_t v112 = v110;
          *((void *)v112 + 1) = v111;
          unint64_t v113 = *((void *)v109 + 2);
          if (v12 > v113) {
            goto LABEL_136;
          }
          memmove(&v109[16 * v12 + 16], &v109[16 * v12 + 32], 16 * (v113 - v12));
          uint64_t v106 = v109;
          *((void *)v109 + 2) = v113 - 1;
          unint64_t v12 = v113 - 1;
        }
        while (v113 > 2);
      }
LABEL_101:
      swift_bridgeObjectRelease();
      *(void *)(v118 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v118 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_25E4FDDE8();
    *(void *)(v7 + 16) = v6;
    uint64_t v118 = v7;
    uint64_t v128 = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v117 = *a1 + 232;
  uint64_t v115 = *a1 - 88;
  int64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v120 = v3;
  uint64_t v129 = *a1;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 < v3)
    {
      uint64_t v14 = v10 + 88 * v9;
      uint64_t v15 = *(void *)(v14 + 32);
      uint64_t v16 = *(void *)(v14 + 56);
      uint64_t v17 = v10 + 88 * v13;
      uint64_t v18 = *(void *)(v17 + 32);
      uint64_t v19 = *(void *)(v17 + 56);
      BOOL v20 = v18 < v15;
      if (v16 == v19) {
        int v21 = v20;
      }
      else {
        int v21 = v19 < v16;
      }
      uint64_t v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        uint64_t v22 = (void *)(v117 + 88 * v13);
        while (1)
        {
          uint64_t v23 = *(v22 - 11);
          int v24 = *(v22 - 14) < *(v22 - 3);
          if (*v22 != v23) {
            int v24 = v23 < *v22;
          }
          if (v21 != v24) {
            break;
          }
          v22 += 11;
          if (v3 == ++v9)
          {
            uint64_t v9 = v3;
            break;
          }
        }
      }
      if (v21)
      {
        if (v9 < v13) {
          goto LABEL_139;
        }
        if (v13 < v9)
        {
          uint64_t v25 = 88 * v9;
          uint64_t v26 = v9;
          uint64_t v27 = v13;
          uint64_t v114 = v13;
          uint64_t v28 = 88 * v13;
          do
          {
            if (v27 != --v26)
            {
              if (!v10) {
                goto LABEL_144;
              }
              uint64_t v29 = v11;
              uint64_t v30 = v10 + v25;
              long long v126 = *(_OWORD *)(v10 + v28 + 16);
              long long v127 = *(_OWORD *)(v10 + v28);
              uint64_t v31 = *(void *)(v10 + v28 + 32);
              uint64_t v32 = *(void *)(v10 + v28 + 40);
              char v124 = *(unsigned char *)(v10 + v28 + 49);
              char v125 = *(unsigned char *)(v10 + v28 + 48);
              uint64_t v33 = *(void *)(v10 + v28 + 64);
              uint64_t v122 = *(void *)(v10 + v28 + 72);
              uint64_t v123 = *(void *)(v10 + v28 + 56);
              char v121 = *(unsigned char *)(v10 + v28 + 80);
              memmove((void *)(v10 + v28), (const void *)(v10 + v25 - 88), 0x58uLL);
              uint64_t v10 = v129;
              *(_OWORD *)(v30 - 88) = v127;
              *(_OWORD *)(v30 - 72) = v126;
              *(void *)(v30 - 56) = v31;
              *(void *)(v30 - 48) = v32;
              *(unsigned char *)(v30 - 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v125;
              *(unsigned char *)(v30 - 39) = v124;
              *(void *)(v30 - 32) = v123;
              *(void *)(v30 - 24) = v33;
              *(void *)(v30 - 16) = v122;
              *(unsigned char *)(v30 - 8) = v121;
              int64_t v11 = v29;
            }
            ++v27;
            v25 -= 88;
            v28 += 88;
          }
          while (v27 < v26);
          uint64_t v3 = v120;
          uint64_t v13 = v114;
        }
      }
    }
    if (v9 >= v3) {
      goto LABEL_54;
    }
    if (__OFSUB__(v9, v13)) {
      goto LABEL_137;
    }
    if (v9 - v13 >= v119) {
      goto LABEL_54;
    }
    uint64_t v34 = v13 + v119;
    if (__OFADD__(v13, v119)) {
      goto LABEL_140;
    }
    if (v34 >= v3) {
      uint64_t v34 = v3;
    }
    if (v34 < v13) {
      break;
    }
    if (v9 != v34)
    {
      uint64_t v35 = v115 + 88 * v9;
      do
      {
        uint64_t v36 = v13;
        uint64_t v37 = v35;
        do
        {
          uint64_t v38 = *(void *)(v37 + 120);
          uint64_t v39 = *(void *)(v37 + 144);
          uint64_t v40 = *(void *)(v37 + 56);
          BOOL v41 = *(void *)(v37 + 32) < v38;
          if (v39 != v40) {
            BOOL v41 = v40 < v39;
          }
          if (!v41) {
            break;
          }
          if (!v10) {
            goto LABEL_142;
          }
          uint64_t v42 = (_OWORD *)(v37 + 88);
          long long v43 = *(_OWORD *)(v37 + 88);
          uint64_t v44 = *(void *)(v37 + 104);
          uint64_t v45 = *(void *)(v37 + 112);
          uint64_t v46 = *(void *)(v37 + 128);
          char v47 = *(unsigned char *)(v37 + 136);
          char v48 = *(unsigned char *)(v37 + 137);
          uint64_t v49 = *(void *)(v37 + 152);
          uint64_t v50 = *(void *)(v37 + 160);
          long long v51 = *(_OWORD *)(v37 + 48);
          *(_OWORD *)(v37 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = *(_OWORD *)(v37 + 32);
          *(_OWORD *)(v37 + 136) = v51;
          *(_OWORD *)(v37 + 152) = *(_OWORD *)(v37 + 64);
          long long v52 = *(_OWORD *)v37;
          long long v53 = *(_OWORD *)(v37 + 16);
          *(_OWORD *)uint64_t v37 = v43;
          char v54 = *(unsigned char *)(v37 + 168);
          *(void *)(v37 + 168) = *(void *)(v37 + 80);
          *(void *)(v37 + 16) = v44;
          *(void *)(v37 + 24) = v45;
          *(void *)(v37 + 32) = v38;
          *(void *)(v37 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v46;
          *(unsigned char *)(v37 + 48) = v47;
          *(unsigned char *)(v37 + 49) = v48;
          *(void *)(v37 + 56) = v39;
          *(void *)(v37 + 64) = v49;
          *(void *)(v37 + 72) = v50;
          *(unsigned char *)(v37 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v54;
          v37 -= 88;
          ++v36;
          *uint64_t v42 = v52;
          v42[1] = v53;
        }
        while (v9 != v36);
        ++v9;
        v35 += 88;
      }
      while (v9 != v34);
      uint64_t v9 = v34;
    }
LABEL_54:
    if (v9 < v13) {
      goto LABEL_132;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v11 = sub_25E4EE6FC(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v56 = *((void *)v11 + 2);
    unint64_t v55 = *((void *)v11 + 3);
    unint64_t v12 = v56 + 1;
    uint64_t v10 = v129;
    if (v56 >= v55 >> 1)
    {
      long long v105 = sub_25E4EE6FC((char *)(v55 > 1), v56 + 1, 1, v11);
      uint64_t v10 = v129;
      int64_t v11 = v105;
    }
    *((void *)v11 + 2) = v12;
    uint64_t v57 = v11 + 32;
    int v58 = &v11[16 * v56 + 32];
    *(void *)int v58 = v13;
    *((void *)v58 + 1) = v9;
    if (v56)
    {
      while (1)
      {
        unint64_t v59 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v64 = &v57[16 * v12];
          uint64_t v65 = *((void *)v64 - 8);
          uint64_t v66 = *((void *)v64 - 7);
          BOOL v70 = __OFSUB__(v66, v65);
          uint64_t v67 = v66 - v65;
          if (v70) {
            goto LABEL_121;
          }
          uint64_t v69 = *((void *)v64 - 6);
          uint64_t v68 = *((void *)v64 - 5);
          BOOL v70 = __OFSUB__(v68, v69);
          uint64_t v62 = v68 - v69;
          char v63 = v70;
          if (v70) {
            goto LABEL_122;
          }
          unint64_t v71 = v12 - 2;
          uint64_t v72 = &v57[16 * v12 - 32];
          uint64_t v74 = *(void *)v72;
          uint64_t v73 = *((void *)v72 + 1);
          BOOL v70 = __OFSUB__(v73, v74);
          uint64_t v75 = v73 - v74;
          if (v70) {
            goto LABEL_124;
          }
          BOOL v70 = __OFADD__(v62, v75);
          uint64_t v76 = v62 + v75;
          if (v70) {
            goto LABEL_127;
          }
          if (v76 >= v67)
          {
            long long v94 = &v57[16 * v59];
            uint64_t v96 = *(void *)v94;
            uint64_t v95 = *((void *)v94 + 1);
            BOOL v70 = __OFSUB__(v95, v96);
            uint64_t v97 = v95 - v96;
            if (v70) {
              goto LABEL_131;
            }
            BOOL v87 = v62 < v97;
            goto LABEL_91;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v88 = *((void *)v11 + 4);
            uint64_t v89 = *((void *)v11 + 5);
            BOOL v70 = __OFSUB__(v89, v88);
            uint64_t v81 = v89 - v88;
            char v82 = v70;
            goto LABEL_85;
          }
          uint64_t v61 = *((void *)v11 + 4);
          uint64_t v60 = *((void *)v11 + 5);
          BOOL v70 = __OFSUB__(v60, v61);
          uint64_t v62 = v60 - v61;
          char v63 = v70;
        }
        if (v63) {
          goto LABEL_123;
        }
        unint64_t v71 = v12 - 2;
        unsigned __int8 v77 = &v57[16 * v12 - 32];
        uint64_t v79 = *(void *)v77;
        uint64_t v78 = *((void *)v77 + 1);
        BOOL v80 = __OFSUB__(v78, v79);
        uint64_t v81 = v78 - v79;
        char v82 = v80;
        if (v80) {
          goto LABEL_126;
        }
        uint64_t v83 = &v57[16 * v59];
        uint64_t v85 = *(void *)v83;
        uint64_t v84 = *((void *)v83 + 1);
        BOOL v70 = __OFSUB__(v84, v85);
        uint64_t v86 = v84 - v85;
        if (v70) {
          goto LABEL_129;
        }
        if (__OFADD__(v81, v86)) {
          goto LABEL_130;
        }
        if (v81 + v86 >= v62)
        {
          BOOL v87 = v62 < v86;
LABEL_91:
          if (v87) {
            unint64_t v59 = v71;
          }
          goto LABEL_93;
        }
LABEL_85:
        if (v82) {
          goto LABEL_125;
        }
        v90 = &v57[16 * v59];
        uint64_t v92 = *(void *)v90;
        uint64_t v91 = *((void *)v90 + 1);
        BOOL v70 = __OFSUB__(v91, v92);
        uint64_t v93 = v91 - v92;
        if (v70) {
          goto LABEL_128;
        }
        if (v93 < v81) {
          goto LABEL_15;
        }
LABEL_93:
        unint64_t v98 = v59 - 1;
        if (v59 - 1 >= v12)
        {
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
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
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
          goto LABEL_141;
        }
        if (!v10) {
          goto LABEL_143;
        }
        uint64_t v99 = v11;
        char v100 = &v57[16 * v98];
        uint64_t v101 = *(void *)v100;
        char v102 = &v57[16 * v59];
        uint64_t v103 = *((void *)v102 + 1);
        sub_25E4EA270((char *)(v10 + 88 * *(void *)v100), (char *)(v10 + 88 * *(void *)v102), v10 + 88 * v103, v128);
        if (v130) {
          goto LABEL_101;
        }
        if (v103 < v101) {
          goto LABEL_118;
        }
        if (v59 > *((void *)v99 + 2)) {
          goto LABEL_119;
        }
        *(void *)char v100 = v101;
        *(void *)&v57[16 * v98 + 8] = v103;
        unint64_t v104 = *((void *)v99 + 2);
        if (v59 >= v104) {
          goto LABEL_120;
        }
        int64_t v11 = v99;
        unint64_t v12 = v104 - 1;
        memmove(&v57[16 * v59], v102 + 16, 16 * (v104 - 1 - v59));
        *((void *)v99 + 2) = v104 - 1;
        uint64_t v10 = v129;
        if (v104 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v120;
    if (v9 >= v120)
    {
      uint64_t v8 = v118;
      goto LABEL_104;
    }
  }
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
  uint64_t result = sub_25E4FDF58();
  __break(1u);
  return result;
}

uint64_t sub_25E4EA184(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 88 * a3 - 88;
LABEL_5:
    uint64_t v6 = result;
    uint64_t v7 = v5;
    while (1)
    {
      uint64_t v8 = *(void *)(v7 + 120);
      uint64_t v9 = *(void *)(v7 + 144);
      uint64_t v10 = *(void *)(v7 + 56);
      BOOL v11 = *(void *)(v7 + 32) < v8;
      if (v9 != v10) {
        BOOL v11 = v10 < v9;
      }
      if (!v11)
      {
LABEL_4:
        ++a3;
        v5 += 88;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v4) {
        break;
      }
      unint64_t v12 = (_OWORD *)(v7 + 88);
      long long v13 = *(_OWORD *)(v7 + 88);
      uint64_t v14 = *(void *)(v7 + 104);
      uint64_t v15 = *(void *)(v7 + 112);
      uint64_t v16 = *(void *)(v7 + 128);
      char v17 = *(unsigned char *)(v7 + 136);
      char v18 = *(unsigned char *)(v7 + 137);
      uint64_t v19 = *(void *)(v7 + 152);
      uint64_t v20 = *(void *)(v7 + 160);
      long long v21 = *(_OWORD *)(v7 + 48);
      *(_OWORD *)(v7 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = *(_OWORD *)(v7 + 32);
      *(_OWORD *)(v7 + 136) = v21;
      *(_OWORD *)(v7 + 152) = *(_OWORD *)(v7 + 64);
      long long v22 = *(_OWORD *)v7;
      long long v23 = *(_OWORD *)(v7 + 16);
      *(_OWORD *)uint64_t v7 = v13;
      char v24 = *(unsigned char *)(v7 + 168);
      *(void *)(v7 + 168) = *(void *)(v7 + 80);
      *(void *)(v7 + 16) = v14;
      *(void *)(v7 + 24) = v15;
      *(void *)(v7 + 32) = v8;
      *(void *)(v7 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v16;
      *(unsigned char *)(v7 + 48) = v17;
      *(unsigned char *)(v7 + 49) = v18;
      *(void *)(v7 + 56) = v9;
      *(void *)(v7 + 64) = v19;
      *(void *)(v7 + 72) = v20;
      *(unsigned char *)(v7 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v24;
      v7 -= 88;
      ++v6;
      *unint64_t v12 = v22;
      v12[1] = v23;
      if (a3 == v6) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25E4EA270(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = (__src - __dst) / 88;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = (uint64_t)(a3 - (void)__src) / 88;
  uint64_t v31 = __dst;
  uint64_t v30 = a4;
  if (v9 >= v11)
  {
    if (v10 >= -87)
    {
      uint64_t v20 = 88 * v11;
      if (a4 != __src || &__src[v20] <= a4) {
        memmove(a4, __src, 88 * v11);
      }
      long long v21 = &v4[v20];
      uint64_t v29 = &v4[v20];
      uint64_t v31 = v6;
      if (v7 < v6 && v10 >= 88)
      {
        long long v22 = (char *)(a3 - 88);
        do
        {
          long long v23 = v22 + 88;
          uint64_t v24 = *((void *)v21 - 4);
          uint64_t v25 = *((void *)v6 - 4);
          BOOL v26 = *((void *)v6 - 7) < *((void *)v21 - 7);
          if (v24 != v25) {
            BOOL v26 = v25 < v24;
          }
          if (v26)
          {
            uint64_t v27 = v6 - 88;
            if (v23 != v6 || v22 >= v6) {
              memmove(v22, v6 - 88, 0x58uLL);
            }
            uint64_t v31 = v6 - 88;
            if (v27 <= v7) {
              break;
            }
          }
          else
          {
            uint64_t v29 = v21 - 88;
            if (v23 < v21 || v22 >= v21 || v23 != v21) {
              memmove(v22, v21 - 88, 0x58uLL);
            }
            uint64_t v27 = v6;
            v21 -= 88;
            if (v6 <= v7) {
              break;
            }
          }
          v22 -= 88;
          uint64_t v6 = v27;
        }
        while (v21 > v4);
      }
LABEL_44:
      sub_25E4EE7F8((void **)&v31, &v30, &v29);
      return 1;
    }
  }
  else if (v8 >= -87)
  {
    size_t v12 = 88 * v9;
    if (a4 != __dst || &__dst[v12] <= a4) {
      memmove(a4, __dst, v12);
    }
    long long v13 = &v4[v12];
    uint64_t v29 = v13;
    if ((unint64_t)v6 < a3 && v8 >= 88)
    {
      uint64_t v14 = v4;
      while (1)
      {
        uint64_t v15 = *((void *)v6 + 7);
        uint64_t v16 = *((void *)v14 + 7);
        BOOL v17 = *((void *)v14 + 4) < *((void *)v6 + 4);
        if (v15 != v16) {
          BOOL v17 = v16 < v15;
        }
        if (v17)
        {
          char v18 = v6 + 88;
          uint64_t v19 = v6;
          if (v7 == v6 && v7 < v18) {
            goto LABEL_20;
          }
        }
        else
        {
          uint64_t v4 = v14 + 88;
          uint64_t v19 = v14;
          char v18 = v6;
          if (v7 == v14)
          {
            v14 += 88;
            if (v7 < v4) {
              goto LABEL_20;
            }
          }
          else
          {
            v14 += 88;
          }
        }
        memmove(v7, v19, 0x58uLL);
LABEL_20:
        v7 += 88;
        if (v14 < v13)
        {
          uint64_t v6 = v18;
          if ((unint64_t)v18 < a3) {
            continue;
          }
        }
        uint64_t v30 = v4;
        uint64_t v31 = v7;
        goto LABEL_44;
      }
    }
    goto LABEL_44;
  }
  uint64_t result = sub_25E4FDF88();
  __break(1u);
  return result;
}

uint64_t sub_25E4EA568(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25E4EA580()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for StorageGaugeView(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (void *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    int64_t v9 = a2 + 2;
    uint64_t v8 = a2[2];
    swift_bridgeObjectRetain();
    if (v8)
    {
      uint64_t v10 = a2[3];
      a1[2] = v8;
      a1[3] = v10;
      swift_retain();
    }
    else
    {
      *((_OWORD *)a1 + 1) = *v9;
    }
    a1[4] = a2[4];
    uint64_t v12 = *(int *)(a3 + 32);
    long long v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for StorageGaugeView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16)) {
    swift_release();
  }
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for StorageGaugeView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v8 = a2 + 2;
  uint64_t v7 = a2[2];
  swift_bridgeObjectRetain();
  if (v7)
  {
    uint64_t v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v8;
  }
  a1[4] = a2[4];
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

void *assignWithCopy for StorageGaugeView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[2];
  if (!a1[2])
  {
    if (v6)
    {
      uint64_t v8 = a2[3];
      a1[2] = v6;
      a1[3] = v8;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    goto LABEL_8;
  }
  if (!v6)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v7 = a2[3];
  a1[2] = v6;
  a1[3] = v7;
  swift_retain();
  swift_release();
LABEL_8:
  a1[4] = a2[4];
  uint64_t v9 = *(int *)(a3 + 32);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t initializeWithTake for StorageGaugeView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v5;
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  }
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

void *assignWithTake for StorageGaugeView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[2];
  if (!a1[2])
  {
    if (v7)
    {
      uint64_t v9 = a2[3];
      a1[2] = v7;
      a1[3] = v9;
      goto LABEL_8;
    }
LABEL_7:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    goto LABEL_8;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v8 = a2[3];
  a1[2] = v7;
  a1[3] = v8;
  swift_release();
LABEL_8:
  a1[4] = a2[4];
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for StorageGaugeView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E4EAAB4);
}

uint64_t sub_25E4EAAB4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for StorageGaugeView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E4EAB7C);
}

uint64_t sub_25E4EAB7C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_25E4EAC28()
{
  sub_25E4E6A2C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_25E4EACE0()
{
  unint64_t result = qword_26A6F3388;
  if (!qword_26A6F3388)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F3390);
    sub_25E4EB500(&qword_26A6F3398, &qword_26A6F33A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3388);
  }
  return result;
}

uint64_t sub_25E4EAD80(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 88 * a1 + 32;
    unint64_t v6 = a3 + 88 * v4;
    if (v5 >= v6 || v5 + 88 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25E4FDF88();
  __break(1u);
  return result;
}

char *sub_25E4EAE74(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25E4FDF88();
  __break(1u);
  return result;
}

char *sub_25E4EAF60(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25E4FDF88();
  __break(1u);
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = type metadata accessor for StorageGaugeView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + v3 + 16)) {
    swift_release();
  }
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 32);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25E4EB160@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for StorageGaugeView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_25E4E80B0(a1, v6, a2);
}

uint64_t sub_25E4EB1E0()
{
  uint64_t v1 = type metadata accessor for StorageGaugeView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = sub_25E4FD7C8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + v3 + 16)) {
    swift_release();
  }
  uint64_t v9 = (v3 + v4 + v7) & ~v7;
  uint64_t v10 = v0 + v3 + *(int *)(v1 + 32);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v9, v5);
  return MEMORY[0x270FA0238](v0, v9 + v8, v2 | v7 | 7);
}

uint64_t sub_25E4EB378@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(type metadata accessor for StorageGaugeView() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  sub_25E4FD7C8();
  return sub_25E4E8CA4(a1, a2, (uint64_t *)(v3 + v8), a3);
}

uint64_t sub_25E4EB464()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25E4EB49C(uint64_t *a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t, _OWORD *))(v1 + 16);
  uint64_t v3 = *a1;
  long long v4 = *(_OWORD *)(a1 + 7);
  v7[2] = *(_OWORD *)(a1 + 5);
  v7[3] = v4;
  v7[4] = *(_OWORD *)(a1 + 9);
  char v8 = *((unsigned char *)a1 + 88);
  long long v5 = *(_OWORD *)(a1 + 3);
  v7[0] = *(_OWORD *)(a1 + 1);
  v7[1] = v5;
  return v2(v3, v7);
}

uint64_t sub_25E4EB500(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_25E4EB544()
{
  unint64_t result = qword_26A6F3410;
  if (!qword_26A6F3410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3410);
  }
  return result;
}

unint64_t sub_25E4EB598()
{
  unint64_t result = qword_26A6F3418;
  if (!qword_26A6F3418)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F3400);
    sub_25E4EB60C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3418);
  }
  return result;
}

unint64_t sub_25E4EB60C()
{
  unint64_t result = qword_26A6F3420;
  if (!qword_26A6F3420)
  {
    type metadata accessor for StorageGaugeItemView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3420);
  }
  return result;
}

uint64_t sub_25E4EB664(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25E4EB6CC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25E4EB72C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25E4EB790(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25E4EB7EC(uint64_t a1)
{
  return a1;
}

uint64_t sub_25E4EB844()
{
  return sub_25E4FD8A8();
}

uint64_t sub_25E4EB86C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for GaugeCategory(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for GaugeCategory()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for GaugeCategory(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GaugeCategory(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 80);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for GaugeCategory(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v6;
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for GaugeCategory(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 81)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GaugeCategory(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 81) = 1;
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
    *(unsigned char *)(result + 81) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StorageGaugeItemPopoverView()
{
  return &type metadata for StorageGaugeItemPopoverView;
}

uint64_t sub_25E4EBC10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E4EBC2C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3350);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v38[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_25E4FDA38();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v38[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  uint64_t v43 = a1[2];
  uint64_t v44 = v11;
  sub_25E4E734C();
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_25E4FDA98();
  uint64_t v40 = v14;
  uint64_t v41 = v13;
  uint64_t v42 = v15;
  int v39 = v16 & 1;
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F086F0]), sel_init);
  objc_msgSend(v17, sel_setCountStyle_, 0);
  id v18 = objc_msgSend(v17, sel_stringFromByteCount_, v12);
  uint64_t v19 = sub_25E4FDD68();
  uint64_t v21 = v20;

  uint64_t v43 = v19;
  uint64_t v44 = v21;
  uint64_t v22 = sub_25E4FDA98();
  uint64_t v24 = v23;
  LOBYTE(v17) = v25 & 1;
  (*(void (**)(unsigned char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F1A728], v7);
  uint64_t v26 = sub_25E4FDA08();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v6, 1, 1, v26);
  sub_25E4FDA18();
  sub_25E4E73A0((uint64_t)v6);
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v27 = sub_25E4FDA88();
  uint64_t v29 = v28;
  LOBYTE(v1__isPlatformVersionAtLeast(2, 18, 1, 0) = v30;
  uint64_t v32 = v31;
  swift_release();
  sub_25E4E7400(v22, v24, (char)v17);
  swift_bridgeObjectRelease();
  char v33 = v39;
  LOBYTE(v43) = v39;
  uint64_t v35 = v40;
  uint64_t v34 = v41;
  *(void *)a2 = v41;
  *(void *)(a2 + 8) = v35;
  *(unsigned char *)(a2 + 16) = v33;
  *(void *)(a2 + 24) = v42;
  *(void *)(a2 + 32) = v27;
  *(void *)(a2 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v29;
  *(unsigned char *)(a2 + 48) = v10 & 1;
  *(void *)(a2 + 56) = v32;
  uint64_t v36 = v34;
  sub_25E4E74E0(v34, v35, v33);
  swift_bridgeObjectRetain();
  sub_25E4E74E0(v27, v29, v10 & 1);
  swift_bridgeObjectRetain();
  sub_25E4E7400(v27, v29, v10 & 1);
  swift_bridgeObjectRelease();
  sub_25E4E7400(v36, v35, v43);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E4EBF70@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 48);
  v27[2] = *(_OWORD *)(v1 + 32);
  v27[3] = v3;
  v27[4] = *(_OWORD *)(v1 + 64);
  char v28 = *(unsigned char *)(v1 + 80);
  long long v4 = *(_OWORD *)(v1 + 16);
  v27[0] = *(_OWORD *)v1;
  v27[1] = v4;
  uint64_t v19 = sub_25E4FD938();
  sub_25E4EBC2C(v27, (uint64_t)v20);
  uint64_t v5 = v20[0];
  uint64_t v6 = v20[1];
  char v7 = v21;
  uint64_t v8 = v22;
  uint64_t v9 = v23;
  uint64_t v10 = v24;
  char v11 = v25;
  uint64_t v12 = v26;
  if (qword_26A6F3238 != -1) {
    swift_once();
  }
  char v13 = sub_25E4FD9B8();
  uint64_t result = sub_25E4FD728();
  *(void *)a1 = v19;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v10;
  *(unsigned char *)(a1 + 72) = v11;
  *(void *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v12;
  *(unsigned char *)(a1 + 88) = v13;
  *(void *)(a1 + 96) = v15;
  *(void *)(a1 + 104) = v16;
  *(void *)(a1 + 112) = v17;
  *(void *)(a1 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = v18;
  *(unsigned char *)(a1 + 128) = 0;
  return result;
}

unint64_t sub_25E4EC0A4()
{
  unint64_t result = qword_26A6F3468;
  if (!qword_26A6F3468)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F3470);
    sub_25E4EC120();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3468);
  }
  return result;
}

unint64_t sub_25E4EC120()
{
  unint64_t result = qword_26A6F3478;
  if (!qword_26A6F3478)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F3480);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3478);
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

uint64_t getEnumTagSinglePayload for StorageGaugeLegendLayout(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for StorageGaugeLegendLayout(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for StorageGaugeLegendLayout()
{
  return &type metadata for StorageGaugeLegendLayout;
}

unint64_t sub_25E4EC1F4()
{
  unint64_t result = qword_26A6F3488;
  if (!qword_26A6F3488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3488);
  }
  return result;
}

uint64_t sub_25E4EC248(void (*a1)(char *, uint64_t, uint64_t), int a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v44 = a8;
  LODWORD(v52) = a2;
  long long v51 = a1;
  uint64_t v10 = sub_25E4FD808();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  long long v53 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25E4FD818();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  char v54 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F34B0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F34B8);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v43 - v23;
  sub_25E4ED2F8();
  sub_25E4FDE18();
  uint64_t result = sub_25E4FDE28();
  if (v55[0] != v56 && (v52 & 1) == 0)
  {
    double v26 = *(double *)&v51;
    long long v51 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    uint64_t v52 = v14 + 16;
    v51(v22, a6, v13);
    sub_25E4FDE18();
    *(void *)&v22[*(int *)(v19 + 36)] = v55[0];
    sub_25E4EF03C((uint64_t)v22, (uint64_t)v24);
    uint64_t v27 = &v24[*(int *)(v19 + 36)];
    uint64_t v28 = *(void *)v27;
    sub_25E4FDE28();
    if (v28 == v55[0])
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v18, 1, 1, v10);
    }
    else
    {
      char v48 = (void (**)(char *, uint64_t))(v14 + 8);
      uint64_t v49 = (void (**)(char *))(v11 + 16);
      uint64_t v29 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
      char v47 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
      uint64_t v46 = (void (**)(char *, char *, uint64_t))(v11 + 32);
      uint64_t v45 = (uint64_t (**)(char *, uint64_t))(v11 + 8);
      double v30 = 0.0;
      uint64_t v50 = 1;
      unint64_t v43 = (v11 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      double v31 = 0.0;
      while (1)
      {
        char v33 = (void (*)(uint64_t *, void))sub_25E4FDE48();
        (*v49)(v18);
        v33(v55, 0);
        uint64_t v34 = v54;
        v51(v54, (uint64_t)v24, v13);
        sub_25E4FDE38();
        (*v48)(v34, v13);
        uint64_t v35 = *v29;
        (*v29)(v18, 0, 1, v10);
        if ((*v47)(v18, 1, v10) == 1) {
          break;
        }
        uint64_t v36 = v53;
        (*v46)(v53, v18, v10);
        sub_25E4FD878();
        LOBYTE(v55[0]) = v37 & 1;
        LOBYTE(v56) = v38 & 1;
        sub_25E4FD7D8();
        double v40 = v39;
        double v42 = v41;
        uint64_t result = (*v45)(v36, v10);
        if (v31 < v42) {
          double v31 = v42;
        }
        if (v30 + v40 < v26)
        {
          double v30 = v30 + v40 + a3;
        }
        else
        {
          if (__OFADD__(v50, 1))
          {
            __break(1u);
            return result;
          }
          if (v50 + 1 > v44) {
            return sub_25E4EF0A4((uint64_t)v24);
          }
          double v30 = v40 + a3;
          ++v50;
        }
        uint64_t v32 = *(void *)v27;
        sub_25E4FDE28();
        if (v32 == v55[0])
        {
          v35(v18, 1, 1, v10);
          return sub_25E4EF0A4((uint64_t)v24);
        }
      }
    }
    return sub_25E4EF0A4((uint64_t)v24);
  }
  return result;
}

uint64_t sub_25E4EC7A4(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10, double a11, uint64_t a12, uint64_t a13)
{
  uint64_t v104 = a13;
  int v103 = a2;
  uint64_t v23 = sub_25E4FD808();
  uint64_t v105 = *(void *)(v23 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  double v26 = (char *)&v96 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v96 - v27;
  sub_25E4FD818();
  sub_25E4ED2F8();
  sub_25E4FDE18();
  uint64_t result = sub_25E4FDE28();
  if (v115[0] != v114)
  {
    uint64_t v112 = v23;
    v116.origin.x = a6;
    v116.origin.y = a7;
    v116.size.width = a8;
    v116.size.height = a9;
    double MinX = CGRectGetMinX(v116);
    v117.origin.x = a6;
    v117.origin.y = a7;
    v117.size.width = a8;
    v117.size.height = a9;
    double Width = CGRectGetWidth(v117);
    v118.origin.x = a6;
    v118.origin.y = a7;
    CGFloat v101 = a8;
    v118.size.width = a8;
    CGFloat v102 = a9;
    v118.size.height = a9;
    CGRectGetMinY(v118);
    sub_25E4FDE18();
    sub_25E4FDE28();
    uint64_t v32 = v114;
    uint64_t v33 = v115[0];
    if (v114 < v115[0])
    {
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    uint64_t v100 = a1;
    int v99 = a4;
    if (v115[0] == v114)
    {
      uint64_t v34 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      if (v115[0] >= v114)
      {
LABEL_64:
        __break(1u);
LABEL_65:
        uint64_t result = swift_release();
        __break(1u);
        return result;
      }
      uint64_t v67 = (void (**)(char *, uint64_t))(v105 + 8);
      uint64_t v34 = (void *)MEMORY[0x263F8EE78];
      do
      {
        sub_25E4FD828();
        sub_25E4FD7F8();
        uint64_t v69 = v68;
        (*v67)(v28, v112);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v34 = sub_25E4E9710(0, v34[2] + 1, 1, v34);
        }
        unint64_t v71 = v34[2];
        unint64_t v70 = v34[3];
        if (v71 >= v70 >> 1) {
          uint64_t v34 = sub_25E4E9710((void *)(v70 > 1), v71 + 1, 1, v34);
        }
        uint64_t v72 = &v34[2 * v71];
        v72[5] = v33;
        v34[2] = v71 + 1;
        v72[4] = v69;
        ++v33;
      }
      while (v32 != v33);
    }
    uint64_t v111 = a3;
    v115[0] = (uint64_t)v34;
    swift_bridgeObjectRetain_n();
    uint64_t v35 = 0;
    sub_25E4ED350(v115, sub_25E4EF028, sub_25E4EDA60);
    double v36 = MinX + Width;
    swift_bridgeObjectRelease_n();
    uint64_t v37 = v115[0];
    char v38 = *(void **)(v115[0] + 16);
    uint64_t v113 = a5;
    uint64_t v110 = v38;
    if (v38)
    {
      uint64_t v97 = 0;
      unint64_t v39 = 0;
      uint64_t v106 = v115[0] + 32;
      char v109 = (void (**)(char *, uint64_t))(v105 + 8);
      uint64_t v98 = v115[0] + 56;
      double v40 = (void *)MEMORY[0x263F8EE78];
      uint64_t v107 = 1;
      double v41 = MinX;
      double v42 = (void *)MEMORY[0x263F8EE78];
      while (1)
      {
        unint64_t v108 = v40;
        unint64_t v43 = v42;
        uint64_t v44 = v107 + 1;
        BOOL v45 = __OFADD__(v107, 1);
        if (v39 >= *(void *)(v37 + 16)) {
          break;
        }
        uint64_t v46 = v37;
        uint64_t v47 = *(void *)(v106 + 16 * v39 + 8);
        char v48 = (void *)(v39 + 1);
        sub_25E4FD828();
        sub_25E4FD878();
        LOBYTE(v115[0]) = v49 & 1;
        LOBYTE(v114) = v50 & 1;
        sub_25E4FD7D8();
        double v52 = v51;
        long long v53 = *v109;
        (*v109)(v26, v112);
        double v54 = v52 + a10;
        if (v36 <= v41 + v54)
        {
          if (v45) {
            goto LABEL_62;
          }
          if (v44 > v104)
          {
            double v42 = v43;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              double v42 = sub_25E4E9600(0, v43[2] + 1, 1, v43);
            }
            unint64_t v56 = v42[2];
            unint64_t v55 = v42[3];
            if (v56 >= v55 >> 1) {
              double v42 = sub_25E4E9600((void *)(v55 > 1), v56 + 1, 1, v42);
            }
            v42[2] = v56 + 1;
            v42[v56 + 4] = v47;
            if (v48 == v110)
            {
LABEL_46:
              swift_release();
              uint64_t v35 = v97;
              double v40 = v108;
              goto LABEL_47;
            }
            uint64_t v57 = (uint64_t *)(v98 + 16 * v39);
            uint64_t v58 = v46;
            while ((unint64_t)v48 < *(void *)(v58 + 16))
            {
              uint64_t v47 = *v57;
              char v48 = (void *)((char *)v48 + 1);
              sub_25E4FD828();
              sub_25E4FD878();
              LOBYTE(v115[0]) = v59 & 1;
              LOBYTE(v114) = v60 & 1;
              sub_25E4FD7D8();
              double v62 = v61;
              v53(v26, v112);
              double v54 = v62 + a10;
              if (v36 > v54 + 1.79769313e308)
              {
                double v41 = 1.79769313e308;
                unint64_t v39 = (unint64_t)v48;
                goto LABEL_31;
              }
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                double v42 = sub_25E4E9600(0, v42[2] + 1, 1, v42);
              }
              unint64_t v64 = v42[2];
              unint64_t v63 = v42[3];
              if (v64 >= v63 >> 1) {
                double v42 = sub_25E4E9600((void *)(v63 > 1), v64 + 1, 1, v42);
              }
              v42[2] = v64 + 1;
              v42[v64 + 4] = v47;
              v57 += 2;
              uint64_t v58 = v46;
              if (v110 == v48) {
                goto LABEL_46;
              }
            }
            break;
          }
          ++v39;
          uint64_t v107 = v44;
          double v41 = MinX;
          double v42 = v43;
        }
        else
        {
          ++v39;
          double v42 = v43;
        }
LABEL_31:
        double v40 = v108;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          double v40 = sub_25E4E9600(0, v40[2] + 1, 1, v40);
        }
        unint64_t v66 = v40[2];
        unint64_t v65 = v40[3];
        if (v66 >= v65 >> 1) {
          double v40 = sub_25E4E9600((void *)(v65 > 1), v66 + 1, 1, v40);
        }
        v40[2] = v66 + 1;
        v40[v66 + 4] = v47;
        double v41 = v54 + v41;
        uint64_t v37 = v46;
        if ((void *)v39 == v110)
        {
          swift_release();
          uint64_t v35 = v97;
          goto LABEL_47;
        }
      }
      __break(1u);
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    swift_release();
    double v40 = (void *)MEMORY[0x263F8EE78];
    double v42 = (void *)MEMORY[0x263F8EE78];
LABEL_47:
    uint64_t v110 = v42;
    v119.origin.x = a6;
    v119.origin.y = a7;
    v119.size.width = v101;
    v119.size.height = v102;
    double MinY = CGRectGetMinY(v119);
    v115[0] = (uint64_t)v40;
    swift_bridgeObjectRetain();
    sub_25E4ED350(v115, sub_25E4EF014, sub_25E4ED3D4);
    if (v35) {
      goto LABEL_65;
    }
    swift_bridgeObjectRelease();
    char v109 = (void (**)(char *, uint64_t))v115[0];
    uint64_t v74 = *(void *)(v115[0] + 16);
    uint64_t v75 = v112;
    if (v74)
    {
      double v76 = MinY + a11;
      unsigned __int8 v77 = (void (**)(void, void))(v109 + 4);
      uint64_t v78 = (void (**)(char *, uint64_t))(v105 + 8);
      double v79 = MinX;
      do
      {
        ++v77;
        sub_25E4FD828();
        sub_25E4FD878();
        LOBYTE(v115[0]) = v80 & 1;
        LOBYTE(v114) = v81 & 1;
        sub_25E4FD7D8();
        char v82 = *v78;
        (*v78)(v26, v75);
        sub_25E4FD828();
        sub_25E4FD878();
        LOBYTE(v115[0]) = v83 & 1;
        LOBYTE(v114) = v84 & 1;
        sub_25E4FD7D8();
        double v86 = v85;
        double v88 = v87;
        v82(v26, v75);
        double v89 = -0.0;
        if (v36 <= v79 + v86) {
          double v89 = v88 + a11;
        }
        double v76 = v76 + v89;
        if (v36 > v79 + v86) {
          double v90 = v79;
        }
        else {
          double v90 = MinX;
        }
        sub_25E4FD828();
        sub_25E4FDD08();
        LOBYTE(v115[0]) = 0;
        LOBYTE(v114) = 0;
        sub_25E4FD7E8();
        v82(v26, v75);
        double v79 = v86 + a10 + v90;
        --v74;
      }
      while (v74);
    }
    swift_release();
    uint64_t v91 = v110[2];
    if (v91)
    {
      uint64_t v92 = v110 + 4;
      uint64_t v93 = (void (**)(char *, uint64_t))(v105 + 8);
      char v94 = v103 & 1;
      char v95 = v99 & 1;
      do
      {
        ++v92;
        sub_25E4FD828();
        sub_25E4FDD08();
        LOBYTE(v115[0]) = v94;
        LOBYTE(v114) = v95;
        sub_25E4FD7E8();
        (*v93)(v26, v75);
        --v91;
      }
      while (v91);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25E4ED0F4(void (*a1)(char *, uint64_t, uint64_t), char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_25E4EC248(a1, a2 & 1, *(double *)v6, a3, a4, a5, a6, *(void *)(v6 + 16));
}

uint64_t sub_25E4ED10C(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  return sub_25E4EC7A4(a1, a2 & 1, a3, a4 & 1, a5, a7, a8, a9, a10, *(double *)v10, *(double *)(v10 + 8), a6, *(void *)(v10 + 16));
}

uint64_t sub_25E4ED12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_25E4ED19C(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B668]);
}

uint64_t sub_25E4ED164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_25E4ED19C(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x263F1B670]);
}

uint64_t sub_25E4ED19C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_25E4ED1E4(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_25E4FD708();
  return sub_25E4ED254;
}

void sub_25E4ED254(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

unint64_t sub_25E4ED2A4()
{
  unint64_t result = qword_26A6F3490;
  if (!qword_26A6F3490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3490);
  }
  return result;
}

unint64_t sub_25E4ED2F8()
{
  unint64_t result = qword_26A6F3498;
  if (!qword_26A6F3498)
  {
    sub_25E4FD818();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3498);
  }
  return result;
}

uint64_t sub_25E4ED350(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void *))
{
  uint64_t v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = a2(v6);
  }
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  uint64_t result = a3(v9);
  *a1 = v6;
  return result;
}

uint64_t sub_25E4ED3D4(void *a1)
{
  unint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_25E4FDFA8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v78 = 0;
      uint64_t v79 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v81 = *(void *)(v79 + 8 * i);
        uint64_t v82 = v78;
        do
        {
          uint64_t v83 = *(void *)(v79 + v82);
          if (v81 >= v83) {
            break;
          }
          if (!v79) {
            goto LABEL_141;
          }
          *(void *)(v79 + v82 + 8) = v83;
          *(void *)(v79 + v82) = v81;
          v82 -= 8;
        }
        while (v82 != -8);
        v78 += 8;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_146;
  }
  uint64_t v95 = result;
  uint64_t v96 = v3;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_103:
      uint64_t v94 = v8;
      if (v12 >= 2)
      {
        uint64_t v84 = *v2;
        do
        {
          unint64_t v85 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_132;
          }
          if (!v84) {
            goto LABEL_145;
          }
          double v86 = v11;
          double v87 = v11 + 32;
          uint64_t v88 = *(void *)&v11[16 * v85 + 32];
          uint64_t v89 = *(void *)&v11[16 * v12 + 24];
          sub_25E4EE1D0((char *)(v84 + 8 * v88), (char *)(v84 + 8 * *(void *)&v87[16 * v12 - 16]), v84 + 8 * v89, __dst);
          if (v1) {
            break;
          }
          if (v89 < v88) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            double v86 = sub_25E4EEA40((uint64_t)v86);
          }
          if (v85 >= *((void *)v86 + 2)) {
            goto LABEL_134;
          }
          double v90 = &v86[16 * v85 + 32];
          *(void *)double v90 = v88;
          *((void *)v90 + 1) = v89;
          unint64_t v91 = *((void *)v86 + 2);
          if (v12 > v91) {
            goto LABEL_135;
          }
          memmove(&v86[16 * v12 + 16], &v86[16 * v12 + 32], 16 * (v91 - v12));
          uint64_t v11 = v86;
          *((void *)v86 + 2) = v91 - 1;
          unint64_t v12 = v91 - 1;
        }
        while (v91 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)(v94 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v94 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_25E4FDDE8();
    *(void *)(v7 + 16) = v6;
    uint64_t v3 = v96;
    uint64_t v94 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *v2;
  uint64_t v92 = v2;
  uint64_t v93 = *v2 - 8;
  uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v97 = *v2;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 < v3)
    {
      uint64_t v14 = *(void *)(v10 + 8 * v9);
      uint64_t v15 = *(void *)(v10 + 8 * v13);
      uint64_t v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        uint64_t v16 = v14;
        while (1)
        {
          uint64_t v17 = *(void *)(v10 + 8 * v9);
          if (v14 < v15 == v17 >= v16) {
            break;
          }
          ++v9;
          uint64_t v16 = v17;
          if (v3 == v9)
          {
            uint64_t v9 = v3;
            break;
          }
        }
      }
      if (v14 < v15)
      {
        if (v9 < v13) {
          goto LABEL_138;
        }
        if (v13 < v9)
        {
          uint64_t v18 = v9 - 1;
          uint64_t v19 = v13;
          do
          {
            if (v19 != v18)
            {
              if (!v10) {
                goto LABEL_144;
              }
              uint64_t v20 = *(void *)(v10 + 8 * v19);
              *(void *)(v10 + 8 * v19) = *(void *)(v10 + 8 * v18);
              *(void *)(v10 + 8 * v18) = v20;
            }
            BOOL v59 = ++v19 < v18--;
          }
          while (v59);
        }
      }
    }
    if (v9 >= v3) {
      goto LABEL_47;
    }
    if (__OFSUB__(v9, v13)) {
      goto LABEL_136;
    }
    if (v9 - v13 >= v95) {
      goto LABEL_47;
    }
    uint64_t v21 = v13 + v95;
    if (__OFADD__(v13, v95)) {
      goto LABEL_139;
    }
    if (v21 >= v3) {
      uint64_t v21 = v3;
    }
    if (v21 < v13) {
      break;
    }
    if (v9 != v21)
    {
      uint64_t v22 = (uint64_t *)(v93 + 8 * v9);
      do
      {
        uint64_t v23 = *(void *)(v10 + 8 * v9);
        uint64_t v24 = v13;
        uint64_t v25 = v22;
        do
        {
          uint64_t v26 = *v25;
          if (v23 >= *v25) {
            break;
          }
          if (!v10) {
            goto LABEL_142;
          }
          *uint64_t v25 = v23;
          v25[1] = v26;
          --v25;
          ++v24;
        }
        while (v9 != v24);
        ++v9;
        ++v22;
      }
      while (v9 != v21);
      uint64_t v9 = v21;
    }
LABEL_47:
    if (v9 < v13) {
      goto LABEL_131;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_25E4EE6FC(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v28 = *((void *)v11 + 2);
    unint64_t v27 = *((void *)v11 + 3);
    unint64_t v12 = v28 + 1;
    uint64_t v10 = v97;
    if (v28 >= v27 >> 1)
    {
      unsigned __int8 v77 = sub_25E4EE6FC((char *)(v27 > 1), v28 + 1, 1, v11);
      uint64_t v10 = v97;
      uint64_t v11 = v77;
    }
    *((void *)v11 + 2) = v12;
    uint64_t v29 = v11 + 32;
    double v30 = &v11[16 * v28 + 32];
    *(void *)double v30 = v13;
    *((void *)v30 + 1) = v9;
    if (v28)
    {
      while (1)
      {
        unint64_t v31 = v12 - 1;
        if (v12 >= 4)
        {
          double v36 = &v29[16 * v12];
          uint64_t v37 = *((void *)v36 - 8);
          uint64_t v38 = *((void *)v36 - 7);
          BOOL v42 = __OFSUB__(v38, v37);
          uint64_t v39 = v38 - v37;
          if (v42) {
            goto LABEL_120;
          }
          uint64_t v41 = *((void *)v36 - 6);
          uint64_t v40 = *((void *)v36 - 5);
          BOOL v42 = __OFSUB__(v40, v41);
          uint64_t v34 = v40 - v41;
          char v35 = v42;
          if (v42) {
            goto LABEL_121;
          }
          unint64_t v43 = v12 - 2;
          uint64_t v44 = &v29[16 * v12 - 32];
          uint64_t v46 = *(void *)v44;
          uint64_t v45 = *((void *)v44 + 1);
          BOOL v42 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          if (v42) {
            goto LABEL_123;
          }
          BOOL v42 = __OFADD__(v34, v47);
          uint64_t v48 = v34 + v47;
          if (v42) {
            goto LABEL_126;
          }
          if (v48 >= v39)
          {
            unint64_t v66 = &v29[16 * v31];
            uint64_t v68 = *(void *)v66;
            uint64_t v67 = *((void *)v66 + 1);
            BOOL v42 = __OFSUB__(v67, v68);
            uint64_t v69 = v67 - v68;
            if (v42) {
              goto LABEL_130;
            }
            BOOL v59 = v34 < v69;
            goto LABEL_84;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v60 = *((void *)v11 + 4);
            uint64_t v61 = *((void *)v11 + 5);
            BOOL v42 = __OFSUB__(v61, v60);
            uint64_t v53 = v61 - v60;
            char v54 = v42;
            goto LABEL_78;
          }
          uint64_t v33 = *((void *)v11 + 4);
          uint64_t v32 = *((void *)v11 + 5);
          BOOL v42 = __OFSUB__(v32, v33);
          uint64_t v34 = v32 - v33;
          char v35 = v42;
        }
        if (v35) {
          goto LABEL_122;
        }
        unint64_t v43 = v12 - 2;
        char v49 = &v29[16 * v12 - 32];
        uint64_t v51 = *(void *)v49;
        uint64_t v50 = *((void *)v49 + 1);
        BOOL v52 = __OFSUB__(v50, v51);
        uint64_t v53 = v50 - v51;
        char v54 = v52;
        if (v52) {
          goto LABEL_125;
        }
        unint64_t v55 = &v29[16 * v31];
        uint64_t v57 = *(void *)v55;
        uint64_t v56 = *((void *)v55 + 1);
        BOOL v42 = __OFSUB__(v56, v57);
        uint64_t v58 = v56 - v57;
        if (v42) {
          goto LABEL_128;
        }
        if (__OFADD__(v53, v58)) {
          goto LABEL_129;
        }
        if (v53 + v58 >= v34)
        {
          BOOL v59 = v34 < v58;
LABEL_84:
          if (v59) {
            unint64_t v31 = v43;
          }
          goto LABEL_86;
        }
LABEL_78:
        if (v54) {
          goto LABEL_124;
        }
        double v62 = &v29[16 * v31];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v42 = __OFSUB__(v63, v64);
        uint64_t v65 = v63 - v64;
        if (v42) {
          goto LABEL_127;
        }
        if (v65 < v53) {
          goto LABEL_15;
        }
LABEL_86:
        unint64_t v70 = v31 - 1;
        if (v31 - 1 >= v12)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
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
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!v10) {
          goto LABEL_143;
        }
        unint64_t v71 = &v29[16 * v70];
        uint64_t v72 = *(void *)v71;
        uint64_t v73 = v29;
        uint64_t v74 = &v29[16 * v31];
        uint64_t v75 = *((void *)v74 + 1);
        sub_25E4EE1D0((char *)(v10 + 8 * *(void *)v71), (char *)(v10 + 8 * *(void *)v74), v10 + 8 * v75, __dst);
        if (v1) {
          goto LABEL_114;
        }
        if (v75 < v72) {
          goto LABEL_117;
        }
        if (v31 > *((void *)v11 + 2)) {
          goto LABEL_118;
        }
        *(void *)unint64_t v71 = v72;
        *(void *)&v73[16 * v70 + 8] = v75;
        unint64_t v76 = *((void *)v11 + 2);
        if (v31 >= v76) {
          goto LABEL_119;
        }
        unint64_t v12 = v76 - 1;
        memmove(v74, v74 + 16, 16 * (v76 - 1 - v31));
        uint64_t v29 = v73;
        *((void *)v11 + 2) = v76 - 1;
        uint64_t v10 = v97;
        if (v76 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v96;
    if (v9 >= v96)
    {
      uint64_t v8 = v94;
      unint64_t v2 = v92;
      goto LABEL_103;
    }
  }
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
  uint64_t result = sub_25E4FDF58();
  __break(1u);
  return result;
}

uint64_t sub_25E4EDA60(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_25E4FDFA8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if (v3) {
      return sub_25E4EE138(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_144;
  }
  uint64_t v6 = result;
  uint64_t v100 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (double *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      unint64_t v12 = (char *)MEMORY[0x263F8EE78];
LABEL_102:
      unint64_t v91 = v12;
      uint64_t v102 = v9;
      if (v13 >= 2)
      {
        uint64_t v92 = *v100;
        do
        {
          unint64_t v93 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v92) {
            goto LABEL_143;
          }
          uint64_t v94 = v91;
          uint64_t v95 = *(void *)&v91[16 * v93 + 32];
          uint64_t v96 = *(void *)&v91[16 * v13 + 24];
          sub_25E4EE440((double *)(v92 + 16 * v95), (double *)(v92 + 16 * *(void *)&v91[16 * v13 + 16]), v92 + 16 * v96, __dst);
          if (v1) {
            break;
          }
          if (v96 < v95) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v94 = sub_25E4EEA40((uint64_t)v94);
          }
          if (v93 >= *((void *)v94 + 2)) {
            goto LABEL_133;
          }
          uint64_t v97 = &v94[16 * v93 + 32];
          *(void *)uint64_t v97 = v95;
          *((void *)v97 + 1) = v96;
          unint64_t v98 = *((void *)v94 + 2);
          if (v13 > v98) {
            goto LABEL_134;
          }
          memmove(&v94[16 * v13 + 16], &v94[16 * v13 + 32], 16 * (v98 - v13));
          unint64_t v91 = v94;
          *((void *)v94 + 2) = v98 - 1;
          unint64_t v13 = v98 - 1;
        }
        while (v98 > 2);
      }
LABEL_99:
      swift_bridgeObjectRelease();
      *(void *)(v102 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v102 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F34A8);
    uint64_t v8 = sub_25E4FDDE8();
    *(void *)(v8 + 16) = v7;
    uint64_t v102 = v8;
    __dst = (double *)(v8 + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v101 = *a1 + 40;
  uint64_t v99 = *a1 - 16;
  unint64_t v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v103 = v6;
  uint64_t v104 = v3;
  uint64_t v105 = v11;
  while (1)
  {
    uint64_t v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = v11 + 16 * v10;
      double v16 = *(double *)v15;
      double v17 = *(double *)(v15 + 8);
      uint64_t v18 = v11 + 16 * v14;
      double v19 = *(double *)v18;
      BOOL v20 = *(double *)v18 < v16;
      int v21 = *(void *)&v17 < *(void *)(v18 + 8);
      if (v16 != v19) {
        int v21 = v20;
      }
      uint64_t v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        uint64_t v22 = (double *)(v101 + 16 * v14);
        while (1)
        {
          double v23 = v16;
          double v16 = *(v22 - 1);
          double v24 = *v22;
          int v25 = *(void *)v22 < *(void *)&v17;
          if (v16 != v23) {
            int v25 = v23 < v16;
          }
          if (v21 != v25) {
            break;
          }
          v22 += 2;
          ++v10;
          double v17 = v24;
          if (v3 == v10)
          {
            uint64_t v10 = v3;
            break;
          }
        }
      }
      if (v21)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          uint64_t v26 = 16 * v10;
          uint64_t v27 = 16 * v14;
          uint64_t v28 = v10;
          uint64_t v29 = v14;
          do
          {
            if (v29 != --v28)
            {
              if (!v11) {
                goto LABEL_142;
              }
              uint64_t v30 = v11 + v26;
              uint64_t v31 = *(void *)(v11 + v27);
              uint64_t v32 = *(void *)(v11 + v27 + 8);
              *(_OWORD *)(v11 + v27) = *(_OWORD *)(v11 + v26 - 16);
              *(void *)(v30 - 16) = v31;
              *(void *)(v30 - 8) = v32;
            }
            ++v29;
            v26 -= 16;
            v27 += 16;
          }
          while (v29 < v28);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_52;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_135;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_52;
    }
    uint64_t v33 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v33 >= v3) {
      uint64_t v33 = v3;
    }
    if (v33 < v14) {
      break;
    }
    if (v10 != v33)
    {
      uint64_t v34 = v99 + 16 * v10;
      do
      {
        uint64_t v35 = v11 + 16 * v10;
        double v36 = *(double *)v35;
        uint64_t v37 = *(void *)(v35 + 8);
        uint64_t v38 = v14;
        uint64_t v39 = v34;
        do
        {
          BOOL v40 = v37 < *(void *)(v39 + 8);
          if (v36 != *(double *)v39) {
            BOOL v40 = *(double *)v39 < v36;
          }
          if (!v40) {
            break;
          }
          if (!v11) {
            goto LABEL_140;
          }
          *(_OWORD *)(v39 + 16) = *(_OWORD *)v39;
          *(double *)uint64_t v39 = v36;
          *(void *)(v39 + 8) = v37;
          v39 -= 16;
          ++v38;
        }
        while (v10 != v38);
        ++v10;
        v34 += 16;
      }
      while (v10 != v33);
      uint64_t v10 = v33;
    }
LABEL_52:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v12 = sub_25E4EE6FC(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v42 = *((void *)v12 + 2);
    unint64_t v41 = *((void *)v12 + 3);
    unint64_t v13 = v42 + 1;
    uint64_t v11 = v105;
    if (v42 >= v41 >> 1)
    {
      double v90 = sub_25E4EE6FC((char *)(v41 > 1), v42 + 1, 1, v12);
      uint64_t v11 = v105;
      unint64_t v12 = v90;
    }
    *((void *)v12 + 2) = v13;
    unint64_t v43 = v12 + 32;
    uint64_t v44 = &v12[16 * v42 + 32];
    *(void *)uint64_t v44 = v14;
    *((void *)v44 + 1) = v10;
    if (v42)
    {
      while (1)
      {
        unint64_t v45 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v50 = &v43[16 * v13];
          uint64_t v51 = *((void *)v50 - 8);
          uint64_t v52 = *((void *)v50 - 7);
          BOOL v56 = __OFSUB__(v52, v51);
          uint64_t v53 = v52 - v51;
          if (v56) {
            goto LABEL_119;
          }
          uint64_t v55 = *((void *)v50 - 6);
          uint64_t v54 = *((void *)v50 - 5);
          BOOL v56 = __OFSUB__(v54, v55);
          uint64_t v48 = v54 - v55;
          char v49 = v56;
          if (v56) {
            goto LABEL_120;
          }
          unint64_t v57 = v13 - 2;
          uint64_t v58 = &v43[16 * v13 - 32];
          uint64_t v60 = *(void *)v58;
          uint64_t v59 = *((void *)v58 + 1);
          BOOL v56 = __OFSUB__(v59, v60);
          uint64_t v61 = v59 - v60;
          if (v56) {
            goto LABEL_122;
          }
          BOOL v56 = __OFADD__(v48, v61);
          uint64_t v62 = v48 + v61;
          if (v56) {
            goto LABEL_125;
          }
          if (v62 >= v53)
          {
            char v80 = &v43[16 * v45];
            uint64_t v82 = *(void *)v80;
            uint64_t v81 = *((void *)v80 + 1);
            BOOL v56 = __OFSUB__(v81, v82);
            uint64_t v83 = v81 - v82;
            if (v56) {
              goto LABEL_129;
            }
            BOOL v73 = v48 < v83;
            goto LABEL_89;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v74 = *((void *)v12 + 4);
            uint64_t v75 = *((void *)v12 + 5);
            BOOL v56 = __OFSUB__(v75, v74);
            uint64_t v67 = v75 - v74;
            char v68 = v56;
            goto LABEL_83;
          }
          uint64_t v47 = *((void *)v12 + 4);
          uint64_t v46 = *((void *)v12 + 5);
          BOOL v56 = __OFSUB__(v46, v47);
          uint64_t v48 = v46 - v47;
          char v49 = v56;
        }
        if (v49) {
          goto LABEL_121;
        }
        unint64_t v57 = v13 - 2;
        uint64_t v63 = &v43[16 * v13 - 32];
        uint64_t v65 = *(void *)v63;
        uint64_t v64 = *((void *)v63 + 1);
        BOOL v66 = __OFSUB__(v64, v65);
        uint64_t v67 = v64 - v65;
        char v68 = v66;
        if (v66) {
          goto LABEL_124;
        }
        uint64_t v69 = &v43[16 * v45];
        uint64_t v71 = *(void *)v69;
        uint64_t v70 = *((void *)v69 + 1);
        BOOL v56 = __OFSUB__(v70, v71);
        uint64_t v72 = v70 - v71;
        if (v56) {
          goto LABEL_127;
        }
        if (__OFADD__(v67, v72)) {
          goto LABEL_128;
        }
        if (v67 + v72 >= v48)
        {
          BOOL v73 = v48 < v72;
LABEL_89:
          if (v73) {
            unint64_t v45 = v57;
          }
          goto LABEL_91;
        }
LABEL_83:
        if (v68) {
          goto LABEL_123;
        }
        unint64_t v76 = &v43[16 * v45];
        uint64_t v78 = *(void *)v76;
        uint64_t v77 = *((void *)v76 + 1);
        BOOL v56 = __OFSUB__(v77, v78);
        uint64_t v79 = v77 - v78;
        if (v56) {
          goto LABEL_126;
        }
        if (v79 < v67) {
          goto LABEL_15;
        }
LABEL_91:
        unint64_t v84 = v45 - 1;
        if (v45 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
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
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11) {
          goto LABEL_141;
        }
        unint64_t v85 = &v43[16 * v84];
        uint64_t v86 = *(void *)v85;
        double v87 = &v43[16 * v45];
        uint64_t v88 = *((void *)v87 + 1);
        sub_25E4EE440((double *)(v11 + 16 * *(void *)v85), (double *)(v11 + 16 * *(void *)v87), v11 + 16 * v88, __dst);
        if (v1) {
          goto LABEL_99;
        }
        if (v88 < v86) {
          goto LABEL_116;
        }
        if (v45 > *((void *)v12 + 2)) {
          goto LABEL_117;
        }
        *(void *)unint64_t v85 = v86;
        *(void *)&v43[16 * v84 + 8] = v88;
        unint64_t v89 = *((void *)v12 + 2);
        if (v45 >= v89) {
          goto LABEL_118;
        }
        unint64_t v13 = v89 - 1;
        memmove(&v43[16 * v45], v87 + 16, 16 * (v89 - 1 - v45));
        *((void *)v12 + 2) = v89 - 1;
        uint64_t v11 = v105;
        if (v89 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    uint64_t v6 = v103;
    uint64_t v3 = v104;
    if (v10 >= v104)
    {
      uint64_t v9 = v102;
      goto LABEL_102;
    }
  }
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
  uint64_t result = sub_25E4FDF58();
  __break(1u);
  return result;
}

uint64_t sub_25E4EE138(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 16 * a3 - 16;
LABEL_5:
    uint64_t v6 = v4 + 16 * a3;
    double v7 = *(double *)v6;
    uint64_t v8 = *(void *)(v6 + 8);
    uint64_t v9 = result;
    uint64_t v10 = v5;
    while (1)
    {
      BOOL v11 = v8 < *(void *)(v10 + 8);
      if (v7 != *(double *)v10) {
        BOOL v11 = *(double *)v10 < v7;
      }
      if (!v11)
      {
LABEL_4:
        ++a3;
        v5 += 16;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v4) {
        break;
      }
      *(_OWORD *)(v10 + 16) = *(_OWORD *)v10;
      *(double *)uint64_t v10 = v7;
      *(void *)(v10 + 8) = v8;
      v10 -= 16;
      if (a3 == ++v9) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25E4EE1D0(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  double v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  double v24 = __src;
  double v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      double v16 = &v4[8 * v13];
      uint64_t v22 = v16;
      double v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        double v17 = (char *)(a3 - 8);
        while (1)
        {
          uint64_t v18 = v17 + 8;
          double v19 = v6 - 8;
          uint64_t v20 = *((void *)v6 - 1);
          if (*((void *)v16 - 1) >= v20)
          {
            uint64_t v22 = v16 - 8;
            if (v18 < v16 || v17 >= v16 || v18 != v16) {
              *(void *)double v17 = *((void *)v16 - 1);
            }
            v16 -= 8;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v18 != v6 || v17 >= v6) {
              *(void *)double v17 = v20;
            }
            double v24 = v6 - 8;
            v6 -= 8;
            if (v19 <= v7) {
              goto LABEL_42;
            }
          }
          v17 -= 8;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    uint64_t v14 = &v4[8 * v10];
    uint64_t v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*(void *)v6 >= *(void *)v4)
        {
          if (v7 != v4) {
            *(void *)double v7 = *(void *)v4;
          }
          v4 += 8;
          double v23 = v4;
          uint64_t v15 = v6;
        }
        else
        {
          uint64_t v15 = v6 + 8;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(void *)double v7 = *(void *)v6;
          }
        }
        v7 += 8;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      double v24 = v7;
    }
LABEL_42:
    sub_25E4EE8C8((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_25E4FDF88();
  __break(1u);
  return result;
}

uint64_t sub_25E4EE440(double *__src, double *a2, unint64_t a3, double *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  double v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = (char *)a2 - (char *)__src + 15;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v9 = (char *)a2 - (char *)__src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v28 = __src;
  uint64_t v27 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[2 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      double v17 = &v4[2 * v13];
      uint64_t v26 = (char *)v17;
      uint64_t v28 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (double *)(a3 - 16);
        double v19 = v6;
        while (1)
        {
          double v20 = *(v17 - 2);
          int v21 = v18 + 2;
          double v22 = *(v19 - 2);
          v19 -= 2;
          BOOL v23 = v22 < v20;
          BOOL v24 = *((void *)v17 - 1) < *((void *)v19 + 1);
          if (v20 != v22) {
            BOOL v24 = v23;
          }
          if (v24)
          {
            if (v21 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            uint64_t v28 = v19;
            if (v19 <= v7) {
              goto LABEL_46;
            }
          }
          else
          {
            uint64_t v26 = (char *)(v17 - 2);
            if (v21 < v17 || v18 >= v17 || v21 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            double v19 = v6;
            v17 -= 2;
            if (v6 <= v7) {
              goto LABEL_46;
            }
          }
          v18 -= 2;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_46;
          }
        }
      }
      goto LABEL_46;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[2 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[2 * v10];
    uint64_t v26 = (char *)v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *((void *)v6 + 1) < *((void *)v4 + 1);
        if (*v6 != *v4) {
          BOOL v15 = *v4 < *v6;
        }
        if (v15)
        {
          double v16 = v6 + 2;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)double v7 = *(_OWORD *)v6;
          }
        }
        else
        {
          if (v7 != v4) {
            *(_OWORD *)double v7 = *(_OWORD *)v4;
          }
          v4 += 2;
          uint64_t v27 = v4;
          double v16 = v6;
        }
        v7 += 2;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      uint64_t v28 = v7;
    }
LABEL_46:
    sub_25E4EE984((void **)&v28, (const void **)&v27, &v26);
    return 1;
  }
  uint64_t result = sub_25E4FDF88();
  __break(1u);
  return result;
}

char *sub_25E4EE6FC(char *result, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F34A0);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25E4EE7F8(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -88)
  {
    uint64_t result = (char *)sub_25E4FDF88();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    size_t v6 = 88 * (v4 / 88);
    if (result != v3 || result >= &v3[v6])
    {
      return (char *)memmove(result, v3, v6);
    }
  }
  return result;
}

char *sub_25E4EE8C8(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_25E4FDF88();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_25E4EE984(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_25E4FDF88();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_25E4EEA40(uint64_t a1)
{
  return sub_25E4EE6FC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25E4EEA54(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3460);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 88);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 88 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25E4FDF88();
  __break(1u);
  return result;
}

uint64_t sub_25E4EEBD4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33A8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25E4FDF88();
  __break(1u);
  return result;
}

uint64_t sub_25E4EED34(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33B0);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25E4FDF88();
  __break(1u);
  return result;
}

uint64_t sub_25E4EEE94(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F34C0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 31;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[64 * v8]) {
      memmove(v13, v14, v8 << 6);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[64 * v8] || v13 >= &v14[64 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25E4FDF88();
  __break(1u);
  return result;
}

uint64_t sub_25E4EF000(uint64_t a1)
{
  return sub_25E4EEA54(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25E4EF014(uint64_t a1)
{
  return sub_25E4EEBD4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25E4EF028(uint64_t a1)
{
  return sub_25E4EED34(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25E4EF03C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F34B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E4EF0A4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F34B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t Int64.formattedSize.getter(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F086F0]), sel_init);
  objc_msgSend(v2, sel_setCountStyle_, 0);
  id v3 = objc_msgSend(v2, sel_stringFromByteCount_, a1);
  uint64_t v4 = sub_25E4FDD68();

  return v4;
}

void *Int64.unknown.unsafeMutableAddressor()
{
  return &static Int64.unknown;
}

unint64_t static Int64.unknown.getter()
{
  return 0x8000000000000000;
}

Swift::Int64_optional __swiftcall Int64.init(_:)(Swift::Int64 a1)
{
  BOOL v1 = (unint64_t)a1 >> 63;
  Swift::Int64 v2 = a1 & ~(a1 >> 63);
  result.is_nil = v1;
  result.value = v2;
  return result;
}

uint64_t Int64.roundedToGB.getter(uint64_t result)
{
  double v1 = ceil((double)result / 1000000000.0) * 1000000000.0;
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 9.22337204e18) {
    return (uint64_t)v1;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t Int64.optionalSize.getter(uint64_t result)
{
  if (result == 0x8000000000000000) {
    return 0;
  }
  return result;
}

uint64_t Array<A>.total.getter(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  while (1)
  {
    uint64_t v5 = *v4++;
    BOOL v6 = __OFADD__(result, v5);
    result += v5;
    if (v6) {
      break;
    }
    if (!--v1) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t GaugeCategory.init(id:localizedName:size:color:fillType:isSelectable:showSizeOverlay:sortOrderPriority:displayOrderPriority:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>, double a10@<D0>, char a11, uint64_t a12)
{
  if (a6)
  {
    uint64_t v21 = a6;
  }
  else
  {
    char v23 = a8;
    uint64_t v21 = sub_25E4FDB78();
    a8 = v23;
  }
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v21;
  *(unsigned char *)(a9 + 48) = a7 & 1;
  *(unsigned char *)(a9 + 49) = a11 & 1;
  *(void *)(a9 + 56) = a12;
  *(double *)(a9 + 64) = a10;
  *(void *)(a9 + 72) = a6;
  *(unsigned char *)(a9 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = a8 & 1;
  return swift_retain();
}

BOOL static StorageGaugeItemFillType.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t StorageGaugeItemFillType.hash(into:)()
{
  return sub_25E4FE008();
}

uint64_t StorageGaugeItemFillType.hashValue.getter()
{
  return sub_25E4FE028();
}

BOOL sub_25E4EF3BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25E4EF3D4()
{
  return sub_25E4FE028();
}

uint64_t sub_25E4EF41C()
{
  return sub_25E4FE008();
}

uint64_t sub_25E4EF448()
{
  return sub_25E4FE028();
}

uint64_t GaugeCategory.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GaugeCategory.localizedName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GaugeCategory.size.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t GaugeCategory.size.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*GaugeCategory.size.modify())()
{
  return nullsub_1;
}

uint64_t GaugeCategory.color.getter()
{
  return swift_retain();
}

uint64_t GaugeCategory.fillType.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t GaugeCategory.showSizeOverlay.getter()
{
  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t GaugeCategory.sortOrderPriority.getter()
{
  return *(void *)(v0 + 56);
}

double GaugeCategory.displayOrderPriority.getter()
{
  return *(double *)(v0 + 64);
}

uint64_t GaugeCategory.init(identifier:size:color:fillType:isSelectable:showSizeOverlay:sortOrderPriority:displayOrderPriority:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>)
{
  unint64_t v17 = StorageCategoryIdentifier.rawValue.getter(a1);
  uint64_t v19 = v18;
  uint64_t v20 = StorageCategoryIdentifier.localizedName.getter(a1);
  uint64_t v22 = v21;
  if (a3) {
    uint64_t v23 = a3;
  }
  else {
    uint64_t v23 = sub_25E4FDB78();
  }
  *(void *)a8 = v17;
  *(void *)(a8 + 8) = v19;
  *(void *)(a8 + 16) = v20;
  *(void *)(a8 + 24) = v22;
  *(void *)(a8 + 32) = a2;
  *(void *)(a8 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v23;
  *(unsigned char *)(a8 + 48) = a4 & 1;
  *(unsigned char *)(a8 + 49) = a6 & 1;
  *(void *)(a8 + 56) = a7;
  *(double *)(a8 + 64) = a9;
  *(void *)(a8 + 72) = a3;
  *(unsigned char *)(a8 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = a5 & 1;
  return swift_retain();
}

uint64_t static GaugeCategory.== infix(_:_:)(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_25E4FDFC8() & 1) == 0 || a1[4] != a2[4]) {
    return 0;
  }
  uint64_t v5 = a1[5];
  uint64_t v6 = a2[5];
  return MEMORY[0x270F043C0](v5, v6);
}

uint64_t GaugeCategory.hash(into:)()
{
  return sub_25E4FE018();
}

uint64_t GaugeCategory.hashValue.getter()
{
  return sub_25E4FE028();
}

uint64_t sub_25E4EF770@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E4EF77C()
{
  return sub_25E4FE028();
}

uint64_t sub_25E4EF7F0()
{
  return sub_25E4FE018();
}

uint64_t sub_25E4EF84C()
{
  return sub_25E4FE028();
}

unint64_t sub_25E4EF8C0()
{
  unint64_t result = qword_26A6F34C8;
  if (!qword_26A6F34C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F34C8);
  }
  return result;
}

uint64_t sub_25E4EF914()
{
  return MEMORY[0x263F8D320];
}

unint64_t sub_25E4EF924()
{
  unint64_t result = qword_26A6F34D0;
  if (!qword_26A6F34D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F34D0);
  }
  return result;
}

uint64_t sub_25E4EF978(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = a1[5];
  uint64_t v5 = a2[4];
  uint64_t v4 = a2[5];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (!v6 && (sub_25E4FDFC8() & 1) == 0 || v3 != v5) {
    return 0;
  }
  return MEMORY[0x270F043C0](v2, v4);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for StorageGaugeItemFillType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for StorageGaugeItemFillType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25E4EFB6CLL);
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

uint64_t sub_25E4EFB94(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25E4EFB9C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for StorageGaugeItemFillType()
{
  return &type metadata for StorageGaugeItemFillType;
}

ValueMetadata *type metadata accessor for GaugeCategory()
{
  return &type metadata for GaugeCategory;
}

uint64_t sub_25E4EFBC8@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4 = result;
  if (qword_26A6F32A8 != -1) {
    unint64_t result = swift_once();
  }
  if (qword_26A6F4A20)
  {
    id v6 = (id)qword_26A6F4A20;
    BOOL v7 = (void *)sub_25E4FDD38();
    int v8 = (void *)sub_25E4FDD38();
    id v9 = objc_msgSend(v6, sel_localizedStringForKey_value_table_, v7, v8, 0);

    uint64_t v10 = sub_25E4FDD68();
    uint64_t v12 = v11;

    if (qword_26A6F3280 != -1) {
      swift_once();
    }
    uint64_t v13 = qword_26A6F49D8;
    swift_retain();
    char v14 = _s9StorageUI11DeviceClassO7currentACvgZ_0();
    *(void *)a3 = 1162170950;
    *(void *)(a3 + 8) = 0xE400000000000000;
    *(void *)(a3 + 16) = v10;
    *(void *)(a3 + 24) = v12;
    *(void *)(a3 + 32) = v4;
    *(void *)(a3 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v13;
    *(unsigned char *)(a3 + 48) = 0;
    *(unsigned char *)(a3 + 49) = a2 & 1;
    *(void *)(a3 + 56) = 0;
    *(void *)(a3 + 64) = 0;
    *(void *)(a3 + 72) = v13;
    *(unsigned char *)(a3 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v14 == 3;
    return swift_retain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for StorageGaugeElementBackground()
{
  return &type metadata for StorageGaugeElementBackground;
}

uint64_t sub_25E4EFD7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E4EFD98@<X0>(uint64_t a1@<X8>)
{
  if ((*(unsigned char *)(v1 + 48) & 1) == 0) {
    swift_retain();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F34D8);
  sub_25E4EB500(&qword_26A6F34E0, &qword_26A6F34D8);
  sub_25E4EFE78();
  uint64_t result = sub_25E4FD948();
  *(void *)a1 = v4;
  *(_WORD *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 1__isPlatformVersionAtLeast(2, 18, 1, 0) = v6;
  return result;
}

unint64_t sub_25E4EFE78()
{
  unint64_t result = qword_26A6F34E8;
  if (!qword_26A6F34E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F34E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for StorageGaugeStripedBackground()
{
  return &type metadata for StorageGaugeStripedBackground;
}

unint64_t sub_25E4EFEE0()
{
  unint64_t result = qword_26A6F34F0;
  if (!qword_26A6F34F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F34F8);
    sub_25E4EB500(&qword_26A6F34E0, &qword_26A6F34D8);
    sub_25E4EFE78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F34F0);
  }
  return result;
}

uint64_t sub_25E4EFF80()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E4EFF9C(double a1)
{
  uint64_t v2 = sub_25E4FD858();
  uint64_t result = MEMORY[0x270FA5388](v2);
  char v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~*(void *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v7 = (uint64_t)a1 + 3;
  if (__OFADD__((uint64_t)a1, 3))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v7 < 0)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  if ((uint64_t)a1 != -3)
  {
    uint64_t v8 = 0;
    id v9 = (void (**)(char *, uint64_t))(v4 + 8);
    do
    {
      sub_25E4FDA68();
      sub_25E4FDA48();
      sub_25E4FDA58();
      v14[0] = v11;
      v14[1] = v12;
      unsigned __int8 v15 = v13;
      sub_25E4F0424((uint64_t)v14, (uint64_t)v16);
      sub_25E4F0498((uint64_t)v16, (void (*)(void, void, void, void, void))sub_25E4F0480);
      if (qword_26A6F3290 != -1) {
        swift_once();
      }
      ++v8;
      sub_25E4FD848();
      sub_25E4FD838();
      sub_25E4F0498((uint64_t)v14, (void (*)(void, void, void, void, void))sub_25E4F04D8);
      (*v9)(v6, v2);
      uint64_t result = sub_25E4F04D8(v11, *((uint64_t *)&v11 + 1), v12, *((uint64_t *)&v12 + 1), v13);
    }
    while (v7 != v8);
  }
  return result;
}

uint64_t sub_25E4F0208@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25E4FD918();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3500);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F19790], v2);
  sub_25E4FDC78();
  if (qword_26A6F3280 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_26A6F49D8;
  swift_retain();
  char v11 = sub_25E4FD9B8();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(a1, v9, v6);
  uint64_t v12 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3508) + 36);
  *(void *)uint64_t v12 = v10;
  *(unsigned char *)(v12 + 8) = v11;
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_25E4F0424(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25E4F0480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_25E4F0498(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_25E4F04D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_release();
  }
  return result;
}

unint64_t sub_25E4F04F4()
{
  unint64_t result = qword_26A6F3510;
  if (!qword_26A6F3510)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F3508);
    sub_25E4EB500(&qword_26A6F3518, &qword_26A6F3500);
    sub_25E4EB500(&qword_26A6F3520, &qword_26A6F3528);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3510);
  }
  return result;
}

uint64_t sub_25E4F05BC(uint64_t a1)
{
  return sub_25E4F077C(a1, static Logger.storageUI);
}

uint64_t Logger.storageUI.unsafeMutableAddressor()
{
  if (qword_26A6F3298 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25E4FD6F8();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.storageUI);
}

uint64_t static Logger.storageUI.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A6F3298 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25E4FD6F8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.storageUI);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
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

uint64_t sub_25E4F0758(uint64_t a1)
{
  return sub_25E4F077C(a1, qword_26A6F4A08);
}

uint64_t sub_25E4F077C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25E4FD6F8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_25E4FD6E8();
}

const char *StorageManagementFeature.domain.getter()
{
  return "StorageManagement";
}

const char *StorageManagementFeature.feature.getter()
{
  return "SpaceForce";
}

uint64_t static StorageManagementFeature.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t StorageManagementFeature.hash(into:)()
{
  return sub_25E4FE008();
}

uint64_t StorageManagementFeature.hashValue.getter()
{
  return sub_25E4FE028();
}

uint64_t sub_25E4F0890()
{
  return 1;
}

uint64_t sub_25E4F0898()
{
  return sub_25E4FE028();
}

uint64_t sub_25E4F08DC()
{
  return sub_25E4FE008();
}

uint64_t sub_25E4F0904()
{
  return sub_25E4FE028();
}

unint64_t sub_25E4F0948()
{
  unint64_t result = qword_26A6F3530;
  if (!qword_26A6F3530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3530);
  }
  return result;
}

const char *sub_25E4F099C()
{
  return "StorageManagement";
}

const char *sub_25E4F09B0()
{
  return "SpaceForce";
}

uint64_t getEnumTagSinglePayload for StorageManagementFeature(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for StorageManagementFeature(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25E4F0AB4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25E4F0ADC()
{
  return 0;
}

ValueMetadata *type metadata accessor for StorageManagementFeature()
{
  return &type metadata for StorageManagementFeature;
}

unint64_t StorageCategoryIdentifier.rawValue.getter(char a1)
{
  unint64_t result = 0x4C41435F4B534944;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4552465F4B534944;
      break;
    case 2:
      unint64_t result = 0x4553555F4B534944;
      break;
    case 3:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 5:
      unint64_t result = 0x4341425F4B534944;
      break;
    case 6:
      unint64_t result = 0x48544F5F4B534944;
      break;
    case 7:
      unint64_t result = 0x53494D5F4B534944;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 9:
      unint64_t result = 0x746163696C707041;
      break;
    case 10:
      unint64_t result = 0xD000000000000011;
      break;
    case 11:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 12:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 13:
      unint64_t result = 0xD000000000000021;
      break;
    case 14:
    case 19:
      unint64_t result = 0xD000000000000012;
      break;
    case 15:
      unint64_t result = 0xD000000000000021;
      break;
    case 16:
    case 20:
    case 21:
      unint64_t result = 0x6C7070612E6D6F63;
      break;
    case 17:
      unint64_t result = 0xD000000000000013;
      break;
    case 18:
      unint64_t result = 0xD000000000000010;
      break;
    case 22:
      unint64_t result = 0xD000000000000019;
      break;
    case 23:
      unint64_t result = 0xD00000000000001DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t StorageCategoryIdentifier.localizedName.getter(char a1)
{
  switch(a1)
  {
    case 1:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_99;
    case 2:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_100;
    case 3:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_101;
    case 4:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_102;
    case 5:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_103;
    case 6:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_104;
    case 7:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_105;
    case 8:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_106;
    case 9:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_107;
    case 10:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_108;
    case 11:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_109;
    case 12:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_110;
    case 13:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_111;
    case 14:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_112;
    case 15:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_113;
    case 16:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_114;
    case 17:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_115;
    case 18:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_116;
    case 19:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_117;
    case 20:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_118;
    case 21:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_119;
    case 22:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_120;
    case 23:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (qword_26A6F4A20) {
        goto LABEL_97;
      }
      goto LABEL_121;
    default:
      if (qword_26A6F32A8 != -1) {
        swift_once();
      }
      if (!qword_26A6F4A20)
      {
        __break(1u);
LABEL_99:
        __break(1u);
LABEL_100:
        __break(1u);
LABEL_101:
        __break(1u);
LABEL_102:
        __break(1u);
LABEL_103:
        __break(1u);
LABEL_104:
        __break(1u);
LABEL_105:
        __break(1u);
LABEL_106:
        __break(1u);
LABEL_107:
        __break(1u);
LABEL_108:
        __break(1u);
LABEL_109:
        __break(1u);
LABEL_110:
        __break(1u);
LABEL_111:
        __break(1u);
LABEL_112:
        __break(1u);
LABEL_113:
        __break(1u);
LABEL_114:
        __break(1u);
LABEL_115:
        __break(1u);
LABEL_116:
        __break(1u);
LABEL_117:
        __break(1u);
LABEL_118:
        __break(1u);
LABEL_119:
        __break(1u);
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
        JUMPOUT(0x25E4F1A84);
      }
LABEL_97:
      id v1 = (id)qword_26A6F4A20;
      int v2 = (void *)sub_25E4FDD38();
      int v3 = (void *)sub_25E4FDD38();
      id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, v3, 0);

      uint64_t v5 = sub_25E4FDD68();
      return v5;
  }
}

uint64_t StorageIdentifier.init(rawValue:)(uint64_t a1)
{
  swift_bridgeObjectRetain();
  unsigned __int8 v2 = _s9StorageUI0A18CategoryIdentifierO8rawValueACSgSS_tcfC_0();
  if (v2 != 24)
  {
    swift_bridgeObjectRelease();
    return v2;
  }
  return a1;
}

uint64_t StorageIdentifier.init(categoryIdentifier:)(uint64_t result)
{
  return result;
}

uint64_t static StorageIdentifier.__derived_enum_equals(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  return sub_25E4F20E4(a1, a2, a3 & 1, a4, a5, a6 & 1);
}

uint64_t StorageIdentifier.hash(into:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if (a4)
  {
    sub_25E4FE008();
    return sub_25E4FDD78();
  }
  else
  {
    sub_25E4FE008();
    StorageCategoryIdentifier.rawValue.getter(a2);
    sub_25E4FDD78();
    return swift_bridgeObjectRelease();
  }
}

uint64_t StorageIdentifier.hashValue.getter(char a1, uint64_t a2, char a3)
{
  if (a3)
  {
    sub_25E4FDD78();
  }
  else
  {
    StorageCategoryIdentifier.rawValue.getter(a1);
    sub_25E4FDD78();
    swift_bridgeObjectRelease();
  }
  return sub_25E4FE028();
}

uint64_t sub_25E4F1CC0(uint64_t a1, uint64_t a2)
{
  return sub_25E4F20E4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t sub_25E4F1CDC()
{
  uint64_t v1 = *v0;
  char v2 = *((unsigned char *)v0 + 16);
  sub_25E4FDFF8();
  sub_25E4FE008();
  if (v2)
  {
    sub_25E4FDD78();
  }
  else
  {
    StorageCategoryIdentifier.rawValue.getter(v1);
    sub_25E4FDD78();
    swift_bridgeObjectRelease();
  }
  return sub_25E4FE028();
}

uint64_t sub_25E4F1D7C()
{
  uint64_t v1 = *v0;
  if (v0[2])
  {
    sub_25E4FE008();
    return sub_25E4FDD78();
  }
  else
  {
    sub_25E4FE008();
    StorageCategoryIdentifier.rawValue.getter(v1);
    sub_25E4FDD78();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25E4F1E2C()
{
  uint64_t v1 = *v0;
  char v2 = *((unsigned char *)v0 + 16);
  sub_25E4FDFF8();
  sub_25E4FE008();
  if (v2)
  {
    sub_25E4FDD78();
  }
  else
  {
    StorageCategoryIdentifier.rawValue.getter(v1);
    sub_25E4FDD78();
    swift_bridgeObjectRelease();
  }
  return sub_25E4FE028();
}

void *static StorageCategoryIdentifier.allCases.getter()
{
  return &unk_270B32270;
}

uint64_t sub_25E4F1ED4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s9StorageUI0A18CategoryIdentifierO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_25E4F1F04@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = StorageCategoryIdentifier.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_25E4F1F30(void *a1@<X8>)
{
  *a1 = &unk_270B32270;
}

uint64_t sub_25E4F1F40(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = StorageCategoryIdentifier.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == StorageCategoryIdentifier.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25E4FDFC8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25E4F1FCC()
{
  char v1 = *v0;
  sub_25E4FDFF8();
  StorageCategoryIdentifier.rawValue.getter(v1);
  sub_25E4FDD78();
  swift_bridgeObjectRelease();
  return sub_25E4FE028();
}

uint64_t sub_25E4F2030()
{
  StorageCategoryIdentifier.rawValue.getter(*v0);
  sub_25E4FDD78();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E4F2084()
{
  char v1 = *v0;
  sub_25E4FDFF8();
  StorageCategoryIdentifier.rawValue.getter(v1);
  sub_25E4FDD78();
  swift_bridgeObjectRelease();
  return sub_25E4FE028();
}

uint64_t sub_25E4F20E4(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  char v6 = a4;
  if ((a3 & 1) == 0)
  {
    if ((a6 & 1) == 0)
    {
      unint64_t v7 = StorageCategoryIdentifier.rawValue.getter(a1);
      uint64_t v9 = v8;
      if (v7 == StorageCategoryIdentifier.rawValue.getter(v6) && v9 == v10)
      {
        swift_bridgeObjectRelease_n();
        return 1;
      }
      else
      {
        char v12 = sub_25E4FDFC8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v12 & 1;
      }
    }
    return 0;
  }
  if ((a6 & 1) == 0) {
    return 0;
  }
  if (a1 == a4 && a2 == a5) {
    return 1;
  }
  return sub_25E4FDFC8();
}

uint64_t _s9StorageUI0A18CategoryIdentifierO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_25E4FDFD8();
  swift_bridgeObjectRelease();
  if (v0 >= 0x18) {
    return 24;
  }
  else {
    return v0;
  }
}

unint64_t sub_25E4F2228()
{
  unint64_t result = qword_26A6F3538;
  if (!qword_26A6F3538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3538);
  }
  return result;
}

unint64_t sub_25E4F2280()
{
  unint64_t result = qword_26A6F3540;
  if (!qword_26A6F3540)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F3548);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3540);
  }
  return result;
}

unint64_t sub_25E4F22E0()
{
  unint64_t result = qword_26A6F3550;
  if (!qword_26A6F3550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3550);
  }
  return result;
}

uint64_t destroy for StorageIdentifier(uint64_t a1)
{
  return sub_25E4F2348(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_25E4F2348(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s9StorageUI17StorageIdentifierOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_25E4E56E4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for StorageIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_25E4E56E4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_25E4F2348(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for StorageIdentifier(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_25E4F2348(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for StorageIdentifier(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StorageIdentifier(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_25E4F24E4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_25E4F24EC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for StorageIdentifier()
{
  return &type metadata for StorageIdentifier;
}

uint64_t getEnumTagSinglePayload for StorageCategoryIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE9) {
    goto LABEL_17;
  }
  if (a2 + 23 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 23) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 23;
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
      return (*a1 | (v4 << 8)) - 23;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 23;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x18;
  int v8 = v6 - 24;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StorageCategoryIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 23 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 23) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE8)
  {
    unsigned int v6 = ((a2 - 233) >> 8) + 1;
    *__n128 result = a2 + 23;
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
        JUMPOUT(0x25E4F2664);
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
          *__n128 result = a2 + 23;
        break;
    }
  }
  return result;
}

unsigned char *sub_25E4F268C(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StorageCategoryIdentifier()
{
  return &type metadata for StorageCategoryIdentifier;
}

uint64_t Followup.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Followup.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Followup.bundleID.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Followup.explanation.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static Followup.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_25E4FDFC8();
  }
}

uint64_t Followup.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25E4FDD78();
  return swift_bridgeObjectRelease();
}

uint64_t Followup.hashValue.getter()
{
  return sub_25E4FE028();
}

uint64_t sub_25E4F2848(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_25E4FDFC8();
  }
}

uint64_t sub_25E4F2878()
{
  return sub_25E4FE028();
}

uint64_t sub_25E4F28D4()
{
  swift_bridgeObjectRetain();
  sub_25E4FDD78();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E4F292C()
{
  return sub_25E4FE028();
}

unint64_t sub_25E4F2988()
{
  unint64_t result = qword_26A6F3558;
  if (!qword_26A6F3558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3558);
  }
  return result;
}

uint64_t destroy for Followup()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Followup(void *a1, void *a2)
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

void *assignWithCopy for Followup(void *a1, void *a2)
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

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

void *assignWithTake for Followup(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for Followup(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Followup(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for Followup()
{
  return &type metadata for Followup;
}

void sub_25E4F2C64()
{
  uint64_t v0 = (void *)sub_25E4FDD38();
  id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  qword_26A6F4A20 = (uint64_t)v1;
}

uint64_t _s9StorageUI0A15GaugeLegendViewV8spacingX12CoreGraphics7CGFloatVvpfP_0()
{
  return sub_25E4FD778();
}

uint64_t StorageGaugeLegendView.init(capacity:categories:maxLines:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  type metadata accessor for StorageGaugeLegendView();
  if (qword_26A6F3268 != -1) {
    swift_once();
  }
  sub_25E4E6A88();
  sub_25E4FD778();
  if (qword_26A6F3260 != -1) {
    swift_once();
  }
  uint64_t result = sub_25E4FD778();
  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t type metadata accessor for StorageGaugeLegendView()
{
  uint64_t result = qword_26A6F3568;
  if (!qword_26A6F3568) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t StorageGaugeLegendView.body.getter@<X0>(void *a1@<X8>)
{
  type metadata accessor for StorageGaugeLegendView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  sub_25E4FD788();
  sub_25E4FD788();
  uint64_t v3 = *(void *)(v1 + 16);
  *a1 = v6;
  a1[1] = v6;
  a1[2] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3560);
  return sub_25E4F2F40(v1, (uint64_t)a1 + *(int *)(v4 + 44));
}

uint64_t sub_25E4F2F40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for StorageGaugeLegendView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3598);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(a1 + 8);
  swift_bridgeObjectRetain();
  sub_25E4E9904(&v19);
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = sub_25E4E9154(v11);
  swift_release_n();
  uint64_t v13 = sub_25E4F3F04(v12);
  swift_bridgeObjectRelease();
  uint64_t v19 = v13;
  swift_getKeyPath();
  sub_25E4F4400(a1, (uint64_t)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for StorageGaugeLegendView);
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = swift_allocObject();
  sub_25E4F42DC((uint64_t)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_25E4F4340;
  *(void *)(v16 + 24) = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F33F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F35A8);
  sub_25E4EB500(&qword_26A6F3408, &qword_26A6F33F8);
  sub_25E4EB544();
  sub_25E4F3D64();
  sub_25E4FDCD8();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v7);
}

uint64_t sub_25E4F321C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E4F3238@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for StorageGaugeLegendItemView();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F35B8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((float)((float)*(uint64_t *)(a2 + 32) / (float)*a3) <= 0.001)
  {
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    return v20(a4, 1, 1, v11);
  }
  else
  {
    v21[0] = v12;
    sub_25E4EB7EC(a2);
    if (qword_26A6F3270 != -1) {
      swift_once();
    }
    uint64_t v15 = qword_26A6F49C8;
    long long v16 = *(_OWORD *)(a2 + 48);
    *((_OWORD *)v10 + 2) = *(_OWORD *)(a2 + 32);
    *((_OWORD *)v10 + 3) = v16;
    *((_OWORD *)v10 + 4) = *(_OWORD *)(a2 + 64);
    v10[80] = *(unsigned char *)(a2 + 80);
    long long v17 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)uint64_t v10 = *(_OWORD *)a2;
    *((_OWORD *)v10 + 1) = v17;
    *((void *)v10 + 11) = a1;
    v21[1] = v15;
    sub_25E4E6A88();
    sub_25E4FD778();
    uint64_t v18 = *(void *)(a2 + 64);
    sub_25E4F4400((uint64_t)v10, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for StorageGaugeLegendItemView);
    *(void *)&v14[*(int *)(v11 + 36)] = v18;
    sub_25E4F4468((uint64_t)v10);
    sub_25E4F44C4((uint64_t)v14, a4);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v21[0] + 56))(a4, 0, 1, v11);
  }
}

uint64_t sub_25E4F34BC@<X0>(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  sub_25E4FD788();
  sub_25E4FD788();
  uint64_t v3 = *(void *)(v1 + 16);
  *a1 = v6;
  a1[1] = v6;
  a1[2] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3560);
  return sub_25E4F2F40(v1, (uint64_t)a1 + *(int *)(v4 + 44));
}

char *initializeBufferWithCopyOfBuffer for StorageGaugeLegendView(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v7;
    *((void *)a1 + 2) = *((void *)a2 + 2);
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    swift_bridgeObjectRetain();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v12(&a1[*(int *)(a3 + 32)], &a2[*(int *)(a3 + 32)], v11);
  }
  return a1;
}

uint64_t destroy for StorageGaugeLegendView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  return v8(v6, v5);
}

char *initializeWithCopy for StorageGaugeLegendView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  *((void *)a1 + 2) = *((void *)a2 + 2);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  swift_bridgeObjectRetain();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v11(&a1[*(int *)(a3 + 32)], &a2[*(int *)(a3 + 32)], v10);
  return a1;
}

char *assignWithCopy for StorageGaugeLegendView(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[*(int *)(a3 + 32)], &a2[*(int *)(a3 + 32)], v9);
  return a1;
}

uint64_t initializeWithTake for StorageGaugeLegendView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(a1 + *(int *)(a3 + 32), a2 + *(int *)(a3 + 32), v9);
  return a1;
}

char *assignWithTake for StorageGaugeLegendView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(&a1[*(int *)(a3 + 32)], &a2[*(int *)(a3 + 32)], v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for StorageGaugeLegendView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E4F3A68);
}

uint64_t sub_25E4F3A68(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for StorageGaugeLegendView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E4F3B30);
}

uint64_t sub_25E4F3B30(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_25E4F3BDC()
{
  sub_25E4E6A2C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_25E4F3C8C()
{
  unint64_t result = qword_26A6F3578;
  if (!qword_26A6F3578)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F3560);
    sub_25E4EB500(&qword_26A6F3580, &qword_26A6F3588);
    sub_25E4F3DA0(&qword_26A6F3590, &qword_26A6F3598, (void (*)(void))sub_25E4F3D64);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3578);
  }
  return result;
}

uint64_t sub_25E4F3D64()
{
  return sub_25E4F3DA0(&qword_26A6F35A0, &qword_26A6F35A8, (void (*)(void))sub_25E4F3E0C);
}

uint64_t sub_25E4F3DA0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25E4F3E0C()
{
  unint64_t result = qword_26A6F35B0;
  if (!qword_26A6F35B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F35B8);
    sub_25E4F3EAC();
    sub_25E4EB500(&qword_26A6F35C8, &qword_26A6F35D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F35B0);
  }
  return result;
}

unint64_t sub_25E4F3EAC()
{
  unint64_t result = qword_26A6F35C0;
  if (!qword_26A6F35C0)
  {
    type metadata accessor for StorageGaugeLegendItemView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F35C0);
  }
  return result;
}

uint64_t sub_25E4F3F04(uint64_t result)
{
  uint64_t v1 = (void *)MEMORY[0x263F8EE78];
  uint64_t v26 = *(void *)(result + 16);
  if (v26)
  {
    unint64_t result = swift_bridgeObjectRetain();
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t)(v1 + 4);
    uint64_t v25 = result;
    uint64_t v6 = v1;
    while (1)
    {
      uint64_t v7 = *(void *)(result + v2 + 40);
      uint64_t v8 = *(void *)(result + v2 + 56);
      uint64_t v9 = *(void *)(result + v2 + 72);
      uint64_t v10 = *(void *)(result + v2 + 96);
      uint64_t v11 = *(void *)(result + v2 + 104);
      uint64_t v32 = *(void *)(result + v2 + 48);
      uint64_t v33 = *(void *)(result + v2 + 32);
      uint64_t v31 = *(void *)(result + v2 + 64);
      char v29 = *(unsigned char *)(result + v2 + 81);
      char v30 = *(unsigned char *)(result + v2 + 80);
      uint64_t v28 = *(void *)(result + v2 + 88);
      char v27 = *(unsigned char *)(result + v2 + 112);
      if (v3)
      {
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t result = swift_retain();
        uint64_t v1 = v6;
        BOOL v12 = __OFSUB__(v3--, 1);
        if (v12) {
          goto LABEL_29;
        }
      }
      else
      {
        unint64_t v13 = v6[3];
        if ((uint64_t)((v13 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_30;
        }
        int64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
        if (v14 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = v14;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F35D8);
        uint64_t v1 = (void *)swift_allocObject();
        uint64_t v16 = (uint64_t)(_swift_stdlib_malloc_size(v1) - 32) / 96;
        v1[2] = v15;
        v1[3] = 2 * v16;
        long long v17 = v1 + 4;
        uint64_t v18 = v6[3] >> 1;
        size_t v19 = 12 * v18;
        uint64_t v20 = (v16 & 0x7FFFFFFFFFFFFFFFLL) - v18;
        uint64_t v5 = (uint64_t)&v1[12 * v18 + 4];
        if (v6[2])
        {
          BOOL v21 = v1 < v6 || v17 >= &v6[v19 + 4];
          if (!v21 && v1 == v6)
          {
            swift_retain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
          }
          else
          {
            memmove(v17, v6 + 4, v19 * 8);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_retain();
          }
          swift_retain();
          v6[2] = 0;
        }
        else
        {
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_retain();
        }
        unint64_t result = swift_release();
        BOOL v12 = __OFSUB__(v20, 1);
        uint64_t v3 = v20 - 1;
        if (v12)
        {
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
          return result;
        }
      }
      *(void *)uint64_t v5 = v4;
      *(void *)(v5 + 8) = v33;
      *(void *)(v5 + 16) = v7;
      *(void *)(v5 + 24) = v32;
      *(void *)(v5 + 32) = v8;
      *(void *)(v5 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v31;
      *(void *)(v5 + 48) = v9;
      *(unsigned char *)(v5 + 56) = v30;
      *(unsigned char *)(v5 + 57) = v29;
      *(void *)(v5 + 64) = v28;
      *(void *)(v5 + 72) = v10;
      *(void *)(v5 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v11;
      *(unsigned char *)(v5 + 88) = v27;
      v5 += 96;
      v2 += 88;
      uint64_t v6 = v1;
      ++v4;
      unint64_t result = v25;
      if (v26 == v4)
      {
        unint64_t result = swift_bridgeObjectRelease();
        goto LABEL_25;
      }
    }
  }
  uint64_t v3 = 0;
LABEL_25:
  unint64_t v22 = v1[3];
  if (v22 >= 2)
  {
    unint64_t v23 = v22 >> 1;
    BOOL v12 = __OFSUB__(v23, v3);
    uint64_t v24 = v23 - v3;
    if (v12) {
      goto LABEL_31;
    }
    v1[2] = v24;
  }
  return (uint64_t)v1;
}

uint64_t sub_25E4F41B8()
{
  uint64_t v1 = (int *)(type metadata accessor for StorageGaugeLegendView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[9];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v6 + v1[10], v8);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25E4F42DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StorageGaugeLegendView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E4F4340@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(type metadata accessor for StorageGaugeLegendView() - 8);
  uint64_t v8 = (uint64_t *)(v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)));
  return sub_25E4F3238(a1, a2, v8, a3);
}

uint64_t sub_25E4F43C8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25E4F4400(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25E4F4468(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StorageGaugeLegendItemView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25E4F44C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F35B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E4F452C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *(void *)a1 = *a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
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
    uint64_t v9 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v9;
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    *(unsigned char *)(a1 + 49) = *((unsigned char *)a2 + 49);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    *(void *)(a1 + 72) = a2[9];
    uint64_t v10 = a2 + 13;
    uint64_t v11 = a2[13];
    *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *((unsigned char *)a2 + 80);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    if (v11)
    {
      uint64_t v12 = a2[14];
      *(void *)(a1 + 104) = v11;
      *(void *)(a1 + 112) = v12;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(a1 + 104) = *v10;
    }
    *(unsigned char *)(a1 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = *((unsigned char *)a2 + 120);
    *(void *)(a1 + 128) = a2[16];
    uint64_t v14 = *(int *)(a3 + 36);
    uint64_t v15 = (void *)(a1 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3458);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_25E4FD748();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *uint64_t v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v18 = *(int *)(a3 + 40);
    uint64_t v19 = a1 + v18;
    uint64_t v20 = (uint64_t)a2 + v18;
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  }
  return a1;
}

uint64_t sub_25E4F473C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (*(void *)(a1 + 104)) {
    swift_release();
  }
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3458);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_25E4FD748();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 40);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

uint64_t sub_25E4F485C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v8;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v9 = (_OWORD *)(a2 + 104);
  uint64_t v10 = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  if (v10)
  {
    uint64_t v11 = *(void *)(a2 + 112);
    *(void *)(a1 + 104) = v10;
    *(void *)(a1 + 112) = v11;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 104) = *v9;
  }
  *(unsigned char *)(a1 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  uint64_t v12 = *(int *)(a3 + 36);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3458);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_25E4FD748();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    *uint64_t v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = *(int *)(a3 + 40);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t sub_25E4F4A1C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(a1 + 104);
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v7 = *(void *)(a2 + 104);
  if (v6)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a2 + 112);
      *(void *)(a1 + 104) = v7;
      *(void *)(a1 + 112) = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = *(void *)(a2 + 112);
    *(void *)(a1 + 104) = v7;
    *(void *)(a1 + 112) = v9;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
LABEL_8:
  *(unsigned char *)(a1 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 36);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_25E4EB790(a1 + v10, &qword_26A6F3458);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3458);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_25E4FD748();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v14 = *(int *)(a3 + 40);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

uint64_t sub_25E4F4C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 80);
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v8 = *(void *)(a2 + 104);
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 112);
    *(void *)(a1 + 104) = v8;
    *(void *)(a1 + 112) = v9;
  }
  else
  {
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  }
  *(_OWORD *)(a1 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = *(_OWORD *)(a2 + 120);
  uint64_t v10 = *(int *)(a3 + 36);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3458);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_25E4FD748();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  uint64_t v15 = *(int *)(a3 + 40);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  return a1;
}

uint64_t sub_25E4F4DF0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v8;
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  uint64_t v9 = *(void *)(a2 + 104);
  uint64_t v10 = *(void *)(a1 + 104);
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  if (v10)
  {
    if (v9)
    {
      uint64_t v11 = *(void *)(a2 + 112);
      *(void *)(a1 + 104) = v9;
      *(void *)(a1 + 112) = v11;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v9)
  {
    uint64_t v12 = *(void *)(a2 + 112);
    *(void *)(a1 + 104) = v9;
    *(void *)(a1 + 112) = v12;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
LABEL_8:
  *(unsigned char *)(a1 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v13 = *(int *)(a3 + 36);
    uint64_t v14 = (void *)(a1 + v13);
    uint64_t v15 = (const void *)(a2 + v13);
    sub_25E4EB790(a1 + v13, &qword_26A6F3458);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3458);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_25E4FD748();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
  }
  uint64_t v18 = *(int *)(a3 + 40);
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 40))(v19, v20, v21);
  return a1;
}

uint64_t sub_25E4F500C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E4F5020);
}

uint64_t sub_25E4F5020(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F35E0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 36);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 40);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_25E4F5154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E4F5168);
}

uint64_t sub_25E4F5168(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F35E0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 36);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 40);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for StorageGaugeItemView()
{
  uint64_t result = qword_26A6F35E8;
  if (!qword_26A6F35E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25E4F52E8()
{
  sub_25E4F53D8();
  if (v0 <= 0x3F)
  {
    sub_25E4E6A2C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25E4F53D8()
{
  if (!qword_26A6F35F8)
  {
    sub_25E4FD748();
    unint64_t v0 = sub_25E4FD758();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6F35F8);
    }
  }
}

uint64_t sub_25E4F5430()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25E4F544C()
{
  v15[1] = *(double *)MEMORY[0x263EF8340];
  uint64_t v0 = sub_25E4FD748();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  unint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v11 - v5;
  double v14 = 1.0;
  v15[0] = 1.0;
  double v12 = 1.0;
  double v13 = 1.0;
  sub_25E4F6BB4();
  swift_retain();
  uint64_t v7 = sub_25E4FDE78();
  objc_msgSend((id)v7, sel_getRed_green_blue_alpha_, v15, &v14, &v13, &v12);

  type metadata accessor for StorageGaugeItemView();
  sub_25E4F6BF4((uint64_t)v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F18508], v0);
  LOBYTE(v7) = sub_25E4FD738();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  double v9 = 1.0 / v12;
  if ((v7 & 1) == 0) {
    double v9 = -v9;
  }
  if (v15[0] * 0.2 + v14 * 0.7 + v13 * 0.07 + v9 <= 0.5) {
    return sub_25E4FDBD8();
  }
  else {
    return sub_25E4FDBB8();
  }
}

uint64_t sub_25E4F567C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v26 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3600);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (uint64_t *)((char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3608);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  double v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v25 - v10;
  *uint64_t v5 = sub_25E4FDCE8();
  v5[1] = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3610);
  sub_25E4F592C((uint64_t)v2, (uint64_t)v5 + *(int *)(v13 + 44));
  uint64_t v14 = v2[3];
  *(void *)&long long v27 = v2[2];
  *((void *)&v27 + 1) = v14;
  sub_25E4F669C();
  sub_25E4E734C();
  sub_25E4FDAF8();
  sub_25E4EB790((uint64_t)v5, &qword_26A6F3600);
  uint64_t v15 = v2[4];
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F086F0]), sel_init);
  objc_msgSend(v16, sel_setCountStyle_, 0);
  id v17 = objc_msgSend(v16, sel_stringFromByteCount_, v15);
  uint64_t v18 = sub_25E4FDD68();
  uint64_t v20 = v19;

  *(void *)&long long v27 = v18;
  *((void *)&v27 + 1) = v20;
  sub_25E4FD868();
  swift_bridgeObjectRelease();
  sub_25E4EB790((uint64_t)v9, &qword_26A6F3608);
  type metadata accessor for StorageGaugeItemView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  sub_25E4FD788();
  sub_25E4FDCE8();
  sub_25E4FD7A8();
  uint64_t v21 = v26;
  sub_25E4EB72C((uint64_t)v11, v26, &qword_26A6F3608);
  unint64_t v22 = (_OWORD *)(v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3620) + 36));
  long long v23 = v28;
  *unint64_t v22 = v27;
  v22[1] = v23;
  v22[2] = v29;
  return sub_25E4EB790((uint64_t)v11, &qword_26A6F3608);
}

uint64_t sub_25E4F592C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v85 = a2;
  uint64_t v3 = sub_25E4FD958();
  uint64_t v83 = *(void *)(v3 - 8);
  uint64_t v84 = v3;
  MEMORY[0x270FA5388](v3);
  char v80 = (uint64_t *)((char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for StorageGaugeItemView();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3628);
  uint64_t v76 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v75 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F32D0);
  MEMORY[0x270FA5388](v87);
  uint64_t v86 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3630);
  uint64_t v81 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v78 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3638) - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v79);
  uint64_t v89 = (uint64_t)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v88 = (uint64_t)&v71 - v14;
  uint64_t v15 = *(void *)(a1 + 8);
  uint64_t v16 = *(void *)(a1 + 16);
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(char **)(a1 + 40);
  char v20 = *(unsigned char *)(a1 + 48);
  LOBYTE(v14) = *(unsigned char *)(a1 + 49);
  uint64_t v21 = *(void *)(a1 + 56);
  unint64_t v22 = *(uint64_t **)(a1 + 64);
  uint64_t v23 = *(void *)(a1 + 72);
  char v24 = *(unsigned char *)(a1 + 80);
  uint64_t v90 = *(void *)a1;
  uint64_t v91 = v15;
  uint64_t v92 = v16;
  uint64_t v93 = v17;
  uint64_t v94 = v18;
  uint64_t v95 = v19;
  LOBYTE(v96) = v20;
  BYTE1(v96) = v14;
  uint64_t v97 = v21;
  unint64_t v98 = v22;
  uint64_t v99 = v23;
  LOBYTE(v10__isPlatformVersionAtLeast(2, 18, 1, 0) = v24;
  sub_25E4F66F8(a1, (uint64_t)v8);
  uint64_t v25 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v74 = ((v25 + 16) & ~v25) + v7;
  uint64_t v26 = (v25 + 16) & ~v25;
  uint64_t v72 = v26;
  uint64_t v73 = v25 | 7;
  uint64_t v27 = swift_allocObject();
  sub_25E4F6760((uint64_t)v8, v27 + v26);
  sub_25E4E5B50();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  long long v28 = v75;
  sub_25E4FDAD8();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_25E4F66F8(a1, (uint64_t)v8);
  uint64_t v29 = swift_allocObject();
  uint64_t v30 = v72;
  sub_25E4F6760((uint64_t)v8, v29 + v72);
  uint64_t v31 = v76;
  uint64_t v32 = v86;
  uint64_t v33 = v77;
  (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v86, v28, v77);
  uint64_t v34 = (uint64_t (**)(uint64_t))&v32[*(int *)(v87 + 36)];
  *uint64_t v34 = sub_25E4F6828;
  v34[1] = (uint64_t (*)(uint64_t))v29;
  (*(void (**)(char *, uint64_t))(v31 + 8))(v28, v33);
  uint64_t v35 = *(void *)(a1 + 128);
  char v102 = *(unsigned char *)(a1 + 120);
  uint64_t v103 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3640);
  sub_25E4FDC58();
  LODWORD(v77) = v92;
  sub_25E4F66F8(a1, (uint64_t)v8);
  uint64_t v36 = swift_allocObject();
  sub_25E4F6760((uint64_t)v8, v36 + v30);
  uint64_t v37 = sub_25E4FDC68();
  uint64_t v38 = v80;
  *char v80 = v37;
  uint64_t v40 = v83;
  uint64_t v39 = v84;
  (*(void (**)(uint64_t *, void, uint64_t))(v83 + 104))(v38, *MEMORY[0x263F1A030], v84);
  sub_25E4E5A60();
  sub_25E4E5BF8();
  unint64_t v41 = v78;
  uint64_t v42 = (uint64_t)v86;
  sub_25E4FDAC8();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t *, uint64_t))(v40 + 8))(v38, v39);
  sub_25E4EB790(v42, &qword_26A6F32D0);
  uint64_t v43 = *(void *)(a1 + 40);
  swift_retain();
  LOBYTE(v42) = sub_25E4FD9B8();
  uint64_t v44 = v81;
  uint64_t v45 = v89;
  uint64_t v46 = v82;
  (*(void (**)(uint64_t, char *, uint64_t))(v81 + 16))(v89, v41, v82);
  uint64_t v47 = v45 + *(int *)(v79 + 44);
  *(void *)uint64_t v47 = v43;
  *(unsigned char *)(v47 + 8) = v42;
  (*(void (**)(char *, uint64_t))(v44 + 8))(v41, v46);
  uint64_t v48 = v45;
  uint64_t v49 = v88;
  sub_25E4F6AAC(v48, v88);
  if (*(unsigned char *)(a1 + 49) == 1)
  {
    unsigned __int8 v50 = sub_25E4FD988();
    unsigned __int8 v51 = sub_25E4FD9A8();
    unsigned __int8 v52 = sub_25E4FD998();
    sub_25E4FD998();
    if (sub_25E4FD998() != v50) {
      unsigned __int8 v52 = sub_25E4FD998();
    }
    sub_25E4FD998();
    if (sub_25E4FD998() != v51) {
      unsigned __int8 v52 = sub_25E4FD998();
    }
    sub_25E4F644C(a1, (uint64_t)&v90);
    uint64_t v53 = v91;
    uint64_t v83 = v90;
    uint64_t v54 = v92;
    uint64_t v55 = v93;
    uint64_t v82 = v94;
    BOOL v56 = v95;
    uint64_t v57 = v96;
    uint64_t v81 = v97;
    char v80 = v98;
    uint64_t v79 = v100;
    LODWORD(v78) = v101;
    uint64_t v58 = v52;
    uint64_t v59 = 256;
    if (!BYTE1(v99)) {
      uint64_t v59 = 0;
    }
    uint64_t v60 = v59 | v99;
    uint64_t v61 = 0x10000;
    if (!BYTE2(v99)) {
      uint64_t v61 = 0;
    }
    uint64_t v62 = v60 | v61;
  }
  else
  {
    uint64_t v58 = 0;
    uint64_t v83 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    uint64_t v82 = 0;
    BOOL v56 = 0;
    uint64_t v57 = 0;
    uint64_t v81 = 0;
    char v80 = 0;
    uint64_t v62 = 0;
    uint64_t v79 = 0;
    LODWORD(v78) = 0;
  }
  uint64_t v63 = v89;
  sub_25E4EB72C(v49, v89, &qword_26A6F3638);
  uint64_t v64 = v63;
  uint64_t v65 = v85;
  sub_25E4EB72C(v64, v85, &qword_26A6F3638);
  uint64_t v66 = v65 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3648) + 48);
  uint64_t v67 = v83;
  *(void *)uint64_t v66 = v58;
  *(void *)(v66 + 8) = v67;
  *(void *)(v66 + 16) = v53;
  *(void *)(v66 + 24) = v54;
  uint64_t v87 = v55;
  uint64_t v68 = v82;
  *(void *)(v66 + 32) = v55;
  *(void *)(v66 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v68;
  *(void *)(v66 + 48) = v56;
  *(void *)(v66 + 56) = v57;
  uint64_t v86 = v56;
  uint64_t v84 = v58;
  uint64_t v69 = v80;
  *(void *)(v66 + 64) = v81;
  *(void *)(v66 + 72) = v69;
  *(void *)(v66 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v62;
  *(void *)(v66 + 88) = v79;
  *(unsigned char *)(v66 + 96) = (_BYTE)v78;
  sub_25E4F6B14(v58, v67, v53, v54, v55);
  sub_25E4EB790(v88, &qword_26A6F3638);
  sub_25E4F6B64(v84, v67, v53, v54, v87);
  return sub_25E4EB790(v89, &qword_26A6F3638);
}

uint64_t sub_25E4F6294(uint64_t result)
{
  uint64_t v1 = *(void (**)(_OWORD *))(result + 104);
  if (v1 && *(unsigned char *)(result + 80) == 1)
  {
    long long v2 = *(_OWORD *)(result + 16);
    uint64_t v3 = *(void *)(result + 32);
    uint64_t v4 = *(void *)(result + 40);
    char v5 = *(unsigned char *)(result + 48);
    char v6 = *(unsigned char *)(result + 49);
    uint64_t v7 = *(void *)(result + 56);
    uint64_t v8 = *(void *)(result + 64);
    uint64_t v9 = *(void *)(result + 72);
    v10[0] = *(_OWORD *)result;
    v10[1] = v2;
    uint64_t v11 = v3;
    uint64_t v12 = v4;
    char v13 = v5;
    char v14 = v6;
    uint64_t v15 = v7;
    uint64_t v16 = v8;
    uint64_t v17 = v9;
    char v18 = 1;
    swift_retain();
    v1(v10);
    return sub_25E4EA568((uint64_t)v1);
  }
  return result;
}

uint64_t sub_25E4F6350(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 80) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3640);
    return sub_25E4FDC48();
  }
  return result;
}

uint64_t sub_25E4F63B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 48);
  char v8 = *(unsigned char *)(a1 + 49);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  char v12 = *(unsigned char *)(a1 + 80);
  *(void *)a2 = *(void *)a1;
  *(void *)(a2 + 8) = v2;
  *(void *)(a2 + 16) = v3;
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v6;
  *(unsigned char *)(a2 + 48) = v7;
  *(unsigned char *)(a2 + 49) = v8;
  *(void *)(a2 + 56) = v9;
  *(void *)(a2 + 64) = v10;
  *(void *)(a2 + 72) = v11;
  *(unsigned char *)(a2 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v12;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_25E4F644C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F086F0]), sel_init);
  objc_msgSend(v4, sel_setCountStyle_, 0);
  id v5 = objc_msgSend(v4, sel_stringFromByteCount_, v3);
  sub_25E4FDD68();

  sub_25E4E734C();
  uint64_t v6 = sub_25E4FDA98();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  sub_25E4FDA28();
  uint64_t v11 = sub_25E4FDA88();
  uint64_t v13 = v12;
  char v15 = v14;
  swift_release();
  sub_25E4E7400(v6, v8, v10);
  swift_bridgeObjectRelease();
  sub_25E4F544C();
  uint64_t v16 = sub_25E4FDA78();
  uint64_t v18 = v17;
  char v20 = v19;
  uint64_t v22 = v21;
  swift_release();
  sub_25E4E7400(v11, v13, v15 & 1);
  swift_bridgeObjectRelease();
  LOBYTE(v11) = sub_25E4FD9C8();
  unsigned __int8 v23 = sub_25E4FD9E8();
  char v24 = sub_25E4FD9D8();
  sub_25E4FD9D8();
  if (sub_25E4FD9D8() != v11) {
    char v24 = sub_25E4FD9D8();
  }
  sub_25E4FD9D8();
  if (sub_25E4FD9D8() != v23) {
    char v24 = sub_25E4FD9D8();
  }
  char v25 = v20 & 1;
  *(void *)a2 = v16;
  *(void *)(a2 + 8) = v18;
  *(unsigned char *)(a2 + 16) = v25;
  *(void *)(a2 + 24) = v22;
  *(unsigned char *)(a2 + 32) = v24;
  *(_OWORD *)(a2 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(unsigned char *)(a2 + 72) = 1;
  *(_WORD *)(a2 + 73) = 257;
  *(void *)(a2 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = 0;
  *(unsigned char *)(a2 + 88) = 1;
  sub_25E4E74E0(v16, v18, v25);
  swift_bridgeObjectRetain();
  sub_25E4E7400(v16, v18, v25);
  return swift_bridgeObjectRelease();
}

unint64_t sub_25E4F669C()
{
  unint64_t result = qword_26A6F3618;
  if (!qword_26A6F3618)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F3600);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3618);
  }
  return result;
}

uint64_t sub_25E4F66F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StorageGaugeItemView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E4F6760(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StorageGaugeItemView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E4F67C4()
{
  uint64_t v1 = *(void *)(type metadata accessor for StorageGaugeItemView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_25E4F6294(v2);
}

uint64_t sub_25E4F6828(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for StorageGaugeItemView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_25E4F6350(a1, v4);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = type metadata accessor for StorageGaugeItemView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (*(void *)(v0 + v3 + 104)) {
    swift_release();
  }
  swift_release();
  uint64_t v6 = v5 + *(int *)(v1 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3458);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25E4FD748();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + *(int *)(v1 + 40);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3328);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25E4F6A3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for StorageGaugeItemView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_25E4F63B4(v4, a1);
}

uint64_t sub_25E4F6AAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E4F6B14(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  if (a5)
  {
    sub_25E4E74E0(a2, a3, a4 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25E4F6B64(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  if (a5)
  {
    sub_25E4E7400(a2, a3, a4 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_25E4F6BB4()
{
  unint64_t result = qword_26A6F3650;
  if (!qword_26A6F3650)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A6F3650);
  }
  return result;
}

uint64_t sub_25E4F6BF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25E4FD8F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3458);
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4EB72C(v2, (uint64_t)v10, &qword_26A6F3458);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_25E4FD748();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_25E4FDE68();
    char v14 = sub_25E4FD978();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v19[2] = sub_25E4F90EC(0x686353726F6C6F43, 0xEB00000000656D65, &v20);
      sub_25E4FDE98();
      _os_log_impl(&dword_25E4E3000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611DBE80](v18, -1, -1);
      MEMORY[0x2611DBE80](v16, -1, -1);
    }

    sub_25E4FD8E8();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

unint64_t sub_25E4F6EB4()
{
  unint64_t result = qword_26A6F3658;
  if (!qword_26A6F3658)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F3620);
    sub_25E4F6F30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3658);
  }
  return result;
}

unint64_t sub_25E4F6F30()
{
  unint64_t result = qword_26A6F3660;
  if (!qword_26A6F3660)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6F3608);
    sub_25E4F669C();
    sub_25E4F6FAC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3660);
  }
  return result;
}

unint64_t sub_25E4F6FAC()
{
  unint64_t result = qword_26A6F3668;
  if (!qword_26A6F3668)
  {
    sub_25E4FD968();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3668);
  }
  return result;
}

id sub_25E4F7004()
{
  type metadata accessor for FollowupMonitor();
  uint64_t v0 = swift_allocObject();
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F35380]), sel_init);
  *(void *)(v0 + 16) = result;
  static FollowupMonitor.shared = v0;
  return result;
}

uint64_t *FollowupMonitor.shared.unsafeMutableAddressor()
{
  if (qword_26A6F32B0 != -1) {
    swift_once();
  }
  return &static FollowupMonitor.shared;
}

uint64_t static FollowupMonitor.shared.getter()
{
  if (qword_26A6F32B0 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t FollowupMonitor.storageFollowups()()
{
  *(void *)(v1 + 168) = v0;
  return MEMORY[0x270FA2498](sub_25E4F7120, 0, 0);
}

uint64_t sub_25E4F7120()
{
  uint64_t v1 = *(void **)(v0[21] + 16);
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_25E4F7220;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_25E4F79F4;
  v0[13] = &block_descriptor;
  v0[14] = v2;
  objc_msgSend(v1, sel_pendingFollowUpItemsWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_25E4F7220()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    uint64_t v2 = sub_25E4F768C;
  }
  else {
    uint64_t v2 = sub_25E4F7330;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25E4F7330()
{
  uint64_t v1 = v0 + 120;
  uint64_t v2 = *(void *)(v0 + 120);
  if (!v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = MEMORY[0x263F8EE78];
  }
  unint64_t v3 = MEMORY[0x263F8EE78];
  unint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(v2 + 16);
  if (v4)
  {
    uint64_t v5 = (void *)(v1 + 32);
    uint64_t v6 = v2 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_25E4F7AD4(v6, v1 - 40);
      sub_25E4F7AD4(v1 - 40, v1);
      sub_25E4F7B30();
      if ((swift_dynamicCast() & 1) == 0) {
        *uint64_t v5 = 0;
      }
      uint64_t v7 = __swift_destroy_boxed_opaque_existential_0(v1 - 40);
      if (*v5)
      {
        MEMORY[0x2611DB5F0](v7);
        if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25E4FDDD8();
        }
        sub_25E4FDDF8();
        sub_25E4FDDC8();
      }
      v6 += 32;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    unint64_t v8 = v25;
    unint64_t v3 = MEMORY[0x263F8EE78];
  }
  else
  {
    unint64_t v8 = MEMORY[0x263F8EE78];
  }
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v26 = v3;
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25E4FDF68();
    uint64_t result = swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_16;
    }
LABEL_31:
    swift_bridgeObjectRelease();
    unint64_t v20 = MEMORY[0x263F8EE78];
LABEL_32:
    sub_25E4F7C58(v20, 0xD000000000000015, 0x800000025E4FFB90);
    uint64_t v22 = v21;
    swift_release();
    unsigned __int8 v23 = *(uint64_t (**)(uint64_t))(v24 + 8);
    return v23(v22);
  }
  uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v10) {
    goto LABEL_31;
  }
LABEL_16:
  if (v10 >= 1)
  {
    uint64_t v11 = 0;
    while (1)
    {
      if ((v8 & 0xC000000000000001) != 0) {
        id v12 = (id)MEMORY[0x2611DB740](v11, v8);
      }
      else {
        id v12 = *(id *)(v8 + 8 * v11 + 32);
      }
      os_log_type_t v13 = v12;
      id v14 = objc_msgSend(v12, sel_uniqueIdentifier);
      if (v14)
      {
        os_log_type_t v15 = v14;
        uint64_t v16 = sub_25E4FDD68();
        uint64_t v18 = v17;

        if (v16 == 0xD000000000000027 && v18 == 0x800000025E4FFBB0)
        {
          swift_bridgeObjectRelease();
LABEL_28:
          sub_25E4FDF18();
          sub_25E4FDF38();
          sub_25E4FDF48();
          sub_25E4FDF28();
          goto LABEL_19;
        }
        char v19 = sub_25E4FDFC8();
        swift_bridgeObjectRelease();
        if (v19) {
          goto LABEL_28;
        }
      }

LABEL_19:
      if (v10 == ++v11)
      {
        swift_bridgeObjectRelease();
        unint64_t v20 = v26;
        goto LABEL_32;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25E4F768C()
{
  uint64_t v1 = (void *)v0[22];
  swift_willThrow();

  swift_bridgeObjectRelease();
  unint64_t v2 = MEMORY[0x263F8EE78];
  unint64_t v23 = MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(MEMORY[0x263F8EE78] + 16);
  if (v3)
  {
    uint64_t v4 = v0 + 19;
    swift_bridgeObjectRetain();
    uint64_t v5 = v2 + 32;
    do
    {
      sub_25E4F7AD4(v5, (uint64_t)(v0 + 10));
      sub_25E4F7AD4((uint64_t)(v0 + 10), (uint64_t)(v0 + 15));
      sub_25E4F7B30();
      if ((swift_dynamicCast() & 1) == 0) {
        *uint64_t v4 = 0;
      }
      uint64_t v6 = __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 10));
      if (*v4)
      {
        MEMORY[0x2611DB5F0](v6);
        if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25E4FDDD8();
        }
        sub_25E4FDDF8();
        sub_25E4FDDC8();
      }
      v5 += 32;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    unint64_t v7 = v23;
    unint64_t v2 = MEMORY[0x263F8EE78];
  }
  else
  {
    unint64_t v7 = MEMORY[0x263F8EE78];
  }
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v24 = v2;
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25E4FDF68();
    uint64_t result = swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_14;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    unint64_t v19 = MEMORY[0x263F8EE78];
LABEL_30:
    sub_25E4F7C58(v19, 0xD000000000000015, 0x800000025E4FFB90);
    uint64_t v21 = v20;
    swift_release();
    uint64_t v22 = (uint64_t (*)(uint64_t))v0[1];
    return v22(v21);
  }
  uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v9) {
    goto LABEL_29;
  }
LABEL_14:
  if (v9 >= 1)
  {
    uint64_t v10 = 0;
    while (1)
    {
      if ((v7 & 0xC000000000000001) != 0) {
        id v11 = (id)MEMORY[0x2611DB740](v10, v7);
      }
      else {
        id v11 = *(id *)(v7 + 8 * v10 + 32);
      }
      id v12 = v11;
      id v13 = objc_msgSend(v11, sel_uniqueIdentifier);
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = sub_25E4FDD68();
        uint64_t v17 = v16;

        if (v15 == 0xD000000000000027 && v17 == 0x800000025E4FFBB0)
        {
          swift_bridgeObjectRelease();
LABEL_26:
          sub_25E4FDF18();
          sub_25E4FDF38();
          sub_25E4FDF48();
          sub_25E4FDF28();
          goto LABEL_17;
        }
        char v18 = sub_25E4FDFC8();
        swift_bridgeObjectRelease();
        if (v18) {
          goto LABEL_26;
        }
      }

LABEL_17:
      if (v9 == ++v10)
      {
        swift_bridgeObjectRelease();
        unint64_t v19 = v24;
        goto LABEL_30;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25E4F79F4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3688);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2) {
      uint64_t v8 = sub_25E4FDDB8();
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v10 = v8;
    sub_25E4F7F08((uint64_t)&v10, *(void *)(*(void *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_25E4F7AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_25E4F7B30()
{
  unint64_t result = qword_26A6F3678;
  if (!qword_26A6F3678)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A6F3678);
  }
  return result;
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

uint64_t FollowupMonitor.deinit()
{
  return v0;
}

uint64_t FollowupMonitor.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_25E4F7C18(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25E4EEA54(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25E4F7C38(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25E4EEE94(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

void sub_25E4F7C58(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = v3;
  unint64_t v6 = a1;
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v7)
  {
    uint64_t v40 = MEMORY[0x263F8EE78];
    sub_25E4F7C38(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0)
    {
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      return;
    }
    unint64_t v32 = v4;
    uint64_t v33 = v7;
    uint64_t v8 = 0;
    unint64_t v34 = v6 & 0xC000000000000001;
    uint64_t v9 = v40;
    while (v7 != v8)
    {
      uint64_t v39 = v9;
      if (v34) {
        id v10 = (id)MEMORY[0x2611DB740](v8, v6);
      }
      else {
        id v10 = *(id *)(v6 + 8 * v8 + 32);
      }
      id v11 = v10;
      id v12 = objc_msgSend(v10, sel_uniqueIdentifier, v32);
      if (!v12) {
        goto LABEL_22;
      }
      id v13 = v12;
      uint64_t v14 = sub_25E4FDD68();
      uint64_t v38 = v15;

      id v16 = objc_msgSend(v11, sel_notification);
      if (!v16) {
        goto LABEL_23;
      }
      uint64_t v17 = v16;
      uint64_t v37 = v14;
      id v18 = objc_msgSend(v16, sel_title);

      if (!v18) {
        goto LABEL_24;
      }
      uint64_t v19 = sub_25E4FDD68();
      uint64_t v21 = v20;

      id v22 = objc_msgSend(v11, sel_notification);
      if (!v22) {
        goto LABEL_25;
      }
      unint64_t v23 = v22;
      unint64_t v24 = v6;
      id v25 = objc_msgSend(v22, sel_informativeText);

      if (!v25) {
        goto LABEL_26;
      }
      uint64_t v26 = sub_25E4FDD68();
      uint64_t v36 = v27;

      swift_bridgeObjectRetain();
      uint64_t v9 = v39;
      uint64_t v28 = a3;
      unint64_t v30 = *(void *)(v39 + 16);
      unint64_t v29 = *(void *)(v39 + 24);
      unint64_t v4 = v30 + 1;
      if (v30 >= v29 >> 1)
      {
        sub_25E4F7C38(v29 > 1, v30 + 1, 1);
        uint64_t v9 = v39;
      }
      ++v8;
      *(void *)(v9 + 16) = v4;
      uint64_t v31 = (void *)(v9 + (v30 << 6));
      v31[4] = v37;
      v31[5] = v38;
      v31[6] = v19;
      v31[7] = v21;
      v31[8] = a2;
      v31[9] = v28;
      v31[10] = v26;
      v31[11] = v36;
      uint64_t v7 = v33;
      a3 = v28;
      unint64_t v6 = v24;
      if (v33 == v8) {
        return;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25E4FDF68();
    swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for FollowupMonitor()
{
  return self;
}

uint64_t sub_25E4F7F08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3680);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t Date.lastUsedDateFormatted.getter()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 1);
  objc_msgSend(v0, sel_setTimeStyle_, 0);
  objc_msgSend(v0, sel_setDoesRelativeDateFormatting_, 1);
  objc_msgSend(v0, sel_setFormattingContext_, 2);
  uint64_t v1 = (void *)sub_25E4FD6B8();
  id v2 = objc_msgSend(v0, sel_stringFromDate_, v1);

  uint64_t v3 = sub_25E4FDD68();
  return v3;
}

void *Volume.defaultUserVolumeMountPath.unsafeMutableAddressor()
{
  return &static Volume.defaultUserVolumeMountPath;
}

uint64_t static Volume.defaultUserVolumeMountPath.getter()
{
  return 47;
}

uint64_t static Volume.defaultUserVolumePlaceholder.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v87 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3690);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v85 = (uint64_t)&v80 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v84 = (uint64_t)&v80 - v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v86 = (uint64_t)&v80 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v92 = (uint64_t)&v80 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v83 = (uint64_t)&v80 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v80 - v13;
  MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v80 - v15;
  uint64_t v91 = sub_25E4FD698();
  uint64_t v17 = *(void *)(v91 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v91);
  uint64_t v20 = (char *)&v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  id v22 = (char *)&v80 - v21;
  sub_25E4FD668();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3698);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25E4FF340;
  unint64_t v24 = (void *)*MEMORY[0x263EFF848];
  *(void *)(inited + 32) = *MEMORY[0x263EFF848];
  id v25 = (void *)*MEMORY[0x263EFF8B0];
  uint64_t v26 = (void *)*MEMORY[0x263EFF890];
  *(void *)(inited + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *MEMORY[0x263EFF8B0];
  *(void *)(inited + 48) = v26;
  id v27 = v24;
  id v28 = v25;
  id v29 = v26;
  sub_25E4F9810(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey();
  swift_arrayDestroy();
  sub_25E4FD658();
  swift_bridgeObjectRelease();
  uint64_t v30 = sub_25E4FD648();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v16, 0, 1, v30);
  id v31 = STMGestaltTotalDiskCapacity();
  unint64_t v32 = v31;
  uint64_t v90 = v17;
  if (v31)
  {
    id v33 = objc_msgSend(v31, sel_integerValue);
  }
  else
  {
    id v33 = 0;
  }
  uint64_t v89 = v22;
  uint64_t v34 = (uint64_t)v16;
  sub_25E4F9A40((uint64_t)v16, (uint64_t)v14);
  uint64_t v35 = sub_25E4FD648();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v88 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
  if (v88(v14, 1, v35) == 1)
  {
    sub_25E4F9AA8((uint64_t)v14);
    goto LABEL_11;
  }
  uint64_t v82 = (uint64_t)v33;
  uint64_t v81 = v20;
  uint64_t v37 = sub_25E4FD638();
  char v39 = v38;
  uint64_t v40 = *(uint64_t (**)(char *, uint64_t))(v36 + 8);
  uint64_t result = v40(v14, v35);
  if (!v32 || (v39 & 1) != 0)
  {
LABEL_11:
    if (qword_26A6F32A0 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_25E4FD6F8();
    __swift_project_value_buffer(v46, (uint64_t)qword_26A6F4A08);
    uint64_t v47 = v34;
    uint64_t v48 = v92;
    sub_25E4F9A40(v34, v92);
    uint64_t v49 = v34;
    uint64_t v50 = v86;
    sub_25E4F9A40(v49, v86);
    unsigned __int8 v51 = sub_25E4FD6D8();
    int v52 = sub_25E4FDE58();
    if (!os_log_type_enabled(v51, (os_log_type_t)v52))
    {

      sub_25E4F9AA8(v50);
      sub_25E4F9AA8(v48);
      sub_25E4F9AA8(v47);
      (*(void (**)(char *, uint64_t))(v90 + 8))(v89, v91);
LABEL_33:
      uint64_t v79 = type metadata accessor for Volume();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v79 - 8) + 56))(v87, 1, 1, v79);
    }
    uint64_t v53 = swift_slowAlloc();
    uint64_t v83 = swift_slowAlloc();
    v94[0] = v83;
    *(_DWORD *)uint64_t v53 = 136315394;
    uint64_t v54 = v84;
    sub_25E4F9A40(v48, v84);
    if (v88((char *)v54, 1, v35) == 1)
    {
      sub_25E4F9AA8(v54);
      unint64_t v55 = 0xE300000000000000;
      uint64_t v56 = 7104878;
    }
    else
    {
      LODWORD(v82) = v52;
      uint64_t v57 = sub_25E4FD638();
      char v59 = v58;
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v54, v35);
      if (v59)
      {
        unint64_t v55 = 0xE300000000000000;
        uint64_t v56 = 7104878;
      }
      else
      {
        uint64_t v93 = v57;
        sub_25E4F9BA8();
        uint64_t v56 = sub_25E4FDEB8();
        unint64_t v55 = v60;
      }
      LOBYTE(v52) = v82;
    }
    uint64_t v93 = sub_25E4F90EC(v56, v55, v94);
    sub_25E4FDE98();
    swift_bridgeObjectRelease();
    sub_25E4F9AA8(v92);
    *(_WORD *)(v53 + 12) = 2080;
    uint64_t v69 = v85;
    sub_25E4F9A40(v50, v85);
    if (v88((char *)v69, 1, v35) == 1)
    {
      sub_25E4F9AA8(v69);
    }
    else
    {
      uint64_t v70 = v69;
      uint64_t v71 = sub_25E4FD628();
      char v73 = v72;
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v70, v35);
      if ((v73 & 1) == 0)
      {
        uint64_t v93 = v71;
        sub_25E4F9B54();
        uint64_t v74 = sub_25E4FDEB8();
        unint64_t v76 = v75;
        uint64_t v77 = v90;
LABEL_32:
        uint64_t v93 = sub_25E4F90EC(v74, v76, v94);
        sub_25E4FDE98();
        swift_bridgeObjectRelease();
        sub_25E4F9AA8(v50);
        _os_log_impl(&dword_25E4E3000, v51, (os_log_type_t)v52, "Unable to retreive used size and capacity for the volume. Returned available %s, returned capacity %s", (uint8_t *)v53, 0x16u);
        uint64_t v78 = v83;
        swift_arrayDestroy();
        MEMORY[0x2611DBE80](v78, -1, -1);
        MEMORY[0x2611DBE80](v53, -1, -1);

        sub_25E4F9AA8(v47);
        (*(void (**)(char *, uint64_t))(v77 + 8))(v89, v91);
        goto LABEL_33;
      }
    }
    unint64_t v76 = 0xE300000000000000;
    uint64_t v77 = v90;
    uint64_t v74 = 7104878;
    goto LABEL_32;
  }
  uint64_t v42 = v82 - v37;
  if (__OFSUB__(v82, v37))
  {
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v43 = v83;
  sub_25E4F9A40(v34, v83);
  if (v88((char *)v43, 1, v35) == 1)
  {
    sub_25E4F9AA8(v43);
    uint64_t v44 = 0xE100000000000000;
    uint64_t v45 = 47;
  }
  else
  {
    uint64_t v45 = sub_25E4FD618();
    uint64_t v44 = v61;
    v40((char *)v43, v35);
    if (!v44)
    {
      uint64_t v45 = 47;
      uint64_t v44 = 0xE100000000000000;
    }
  }
  uint64_t v63 = v89;
  uint64_t v62 = v90;
  uint64_t v64 = (uint64_t)v81;
  uint64_t v65 = v91;
  uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v90 + 16))(v81, v89, v91);
  double v66 = ceil((double)v82 / 1000000000.0) * 1000000000.0;
  if ((~*(void *)&v66 & 0x7FF0000000000000) == 0) {
    goto LABEL_35;
  }
  if (v66 > -9.22337204e18)
  {
    if (v66 < 9.22337204e18)
    {
      uint64_t v67 = v87;
      Volume.init(mountURL:name:isUserVolume:capacity:used:)(v64, v45, v44, 1, (uint64_t)v66, v42, v87);
      sub_25E4F9AA8(v34);
      (*(void (**)(char *, uint64_t))(v62 + 8))(v63, v65);
      uint64_t v68 = type metadata accessor for Volume();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v67, 0, 1, v68);
    }
    goto LABEL_37;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t Volume.init(mountURL:name:isUserVolume:capacity:used:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14 = (int *)type metadata accessor for Volume();
  *(void *)(a7 + v14[9]) = 0;
  uint64_t v15 = sub_25E4FD698();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(a7, a1, v15);
  uint64_t v17 = (void *)(a7 + v14[5]);
  *uint64_t v17 = a2;
  v17[1] = a3;
  *(void *)(a7 + v14[7]) = a5;
  *(void *)(a7 + v14[8]) = a6;
  *(unsigned char *)(a7 + v14[6]) = a4;
  if (__OFSUB__(a5, a6))
  {
    __break(1u);
LABEL_9:
    swift_once();
    goto LABEL_4;
  }
  if (((a5 - a6) & 0x8000000000000000) == 0) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(a1, v15);
  }
  if (qword_26A6F32A0 != -1) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v18 = sub_25E4FD6F8();
  __swift_project_value_buffer(v18, (uint64_t)qword_26A6F4A08);
  uint64_t v19 = sub_25E4FD6D8();
  os_log_type_t v20 = sub_25E4FDE58();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 134218240;
    sub_25E4FDE98();
    *(_WORD *)(v21 + 12) = 2048;
    sub_25E4FDE98();
    _os_log_impl(&dword_25E4E3000, v19, v20, "availableSpace is negative - used: %lld - capacity: %lld", (uint8_t *)v21, 0x16u);
    MEMORY[0x2611DBE80](v21, -1, -1);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(a1, v15);
}

uint64_t Volume.id.getter()
{
  return sub_25E4FD688();
}

uint64_t Volume.mountURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25E4FD698();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t Volume.name.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for Volume() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Volume.isUserVolume.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for Volume() + 24));
}

uint64_t Volume.capacity.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for Volume() + 28));
}

uint64_t Volume.capacity.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for Volume();
  *(void *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*Volume.capacity.modify())()
{
  return nullsub_1;
}

uint64_t Volume.used.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for Volume() + 32));
}

uint64_t Volume.otherVolumesInContainer.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for Volume() + 36));
}

uint64_t Volume.otherVolumesInContainer.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for Volume();
  *(void *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*Volume.otherVolumesInContainer.modify())()
{
  return nullsub_1;
}

int *Volume.available.getter()
{
  uint64_t result = (int *)type metadata accessor for Volume();
  uint64_t v2 = *(void *)(v0 + result[7]);
  uint64_t v3 = *(void *)(v0 + result[8]);
  BOOL v4 = __OFSUB__(v2, v3);
  uint64_t v5 = v2 - v3;
  if (v4)
  {
    __break(1u);
    goto LABEL_5;
  }
  uint64_t v6 = *(void *)(v0 + result[9]);
  uint64_t result = (int *)(v5 - v6);
  if (__OFSUB__(v5, v6)) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t Volume.description.getter()
{
  return 0;
}

uint64_t sub_25E4F90B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25E4FD688();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25E4F90EC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25E4F91C0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25E4F7AD4((uint64_t)v12, *a3);
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
      sub_25E4F7AD4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25E4F91C0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25E4FDEA8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25E4F937C(a5, a6);
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
  uint64_t v8 = sub_25E4FDF08();
  if (!v8)
  {
    sub_25E4FDF58();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25E4FDF88();
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

uint64_t sub_25E4F937C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25E4F9414(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25E4F95F4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25E4F95F4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25E4F9414(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25E4F958C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25E4FDEE8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25E4FDF58();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25E4FDD98();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25E4FDF88();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25E4FDF58();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25E4F958C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36C8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25E4F95F4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36C8);
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
  uint64_t result = sub_25E4FDF88();
  __break(1u);
  return result;
}

BOOL _s9StorageUI6VolumeV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((MEMORY[0x2611DAEC0]() & 1) == 0) {
    return 0;
  }
  unint64_t v4 = (int *)type metadata accessor for Volume();
  uint64_t v5 = v4[5];
  uint64_t v6 = *(void *)(a1 + v5);
  uint64_t v7 = *(void *)(a1 + v5 + 8);
  int64_t v8 = (void *)(a2 + v5);
  BOOL v9 = v6 == *v8 && v7 == v8[1];
  if (v9 || (v10 = sub_25E4FDFC8(), BOOL result = 0, (v10 & 1) != 0))
  {
    if (*(unsigned __int8 *)(a1 + v4[6]) == *(unsigned __int8 *)(a2 + v4[6])
      && *(void *)(a1 + v4[7]) == *(void *)(a2 + v4[7])
      && *(void *)(a1 + v4[8]) == *(void *)(a2 + v4[8]))
    {
      return *(void *)(a1 + v4[9]) == *(void *)(a2 + v4[9]);
    }
    return 0;
  }
  return result;
}

uint64_t sub_25E4F9810(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D0);
    uint64_t v3 = sub_25E4FDEC8();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      uint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_25E4FDD68();
      sub_25E4FDFF8();
      id v7 = v6;
      sub_25E4FDD78();
      uint64_t v8 = sub_25E4FE028();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_25E4FDD68();
        uint64_t v17 = v16;
        if (v15 == sub_25E4FDD68() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_25E4FDFC8();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_25E4FDD68();
          uint64_t v24 = v23;
          if (v22 == sub_25E4FDD68() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_25E4FDFC8();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_25E4F9A40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E4F9AA8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3690);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for Volume()
{
  uint64_t result = qword_26A6F36B8;
  if (!qword_26A6F36B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25E4F9B54()
{
  unint64_t result = qword_26A6F36A0;
  if (!qword_26A6F36A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F36A0);
  }
  return result;
}

unint64_t sub_25E4F9BA8()
{
  unint64_t result = qword_26A6F36A8;
  if (!qword_26A6F36A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F36A8);
  }
  return result;
}

unint64_t sub_25E4F9BFC()
{
  unint64_t result = qword_26A6F36B0;
  if (!qword_26A6F36B0)
  {
    sub_25E4FD698();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F36B0);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for Volume(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25E4FD698();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (void *)((char *)a1 + v8);
    unint64_t v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    uint64_t v13 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
    *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for Volume(uint64_t a1)
{
  uint64_t v2 = sub_25E4FD698();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Volume(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E4FD698();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v12 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Volume(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E4FD698();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  return a1;
}

uint64_t initializeWithTake for Volume(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E4FD698();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for Volume(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E4FD698();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for Volume(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E4FA0B4);
}

uint64_t sub_25E4FA0B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25E4FD698();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v1__isPlatformVersionAtLeast(2, 18, 1, 0) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for Volume(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E4FA18C);
}

uint64_t sub_25E4FA18C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25E4FD698();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25E4FA24C()
{
  uint64_t result = sub_25E4FD698();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t TimeStats.initTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25E4FD6C8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t TimeStats.initTime.setter(uint64_t a1)
{
  uint64_t v3 = sub_25E4FD6C8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*TimeStats.initTime.modify())()
{
  return nullsub_1;
}

uint64_t TimeStats.startMonitoring.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 20);
  return sub_25E4FA47C(v3, a1);
}

uint64_t type metadata accessor for TimeStats()
{
  uint64_t result = qword_26A6F36E0;
  if (!qword_26A6F36E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E4FA47C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t TimeStats.startMonitoring.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 20);
  return sub_25E4FA528(a1, v3);
}

uint64_t sub_25E4FA528(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*TimeStats.startMonitoring.modify())()
{
  return nullsub_1;
}

uint64_t TimeStats.firstGathering.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 24);
  return sub_25E4FA47C(v3, a1);
}

uint64_t TimeStats.firstGathering.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 24);
  return sub_25E4FA528(a1, v3);
}

uint64_t (*TimeStats.firstGathering.modify())()
{
  return nullsub_1;
}

uint64_t TimeStats.firstDisplay.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 28);
  return sub_25E4FA47C(v3, a1);
}

uint64_t TimeStats.firstDisplay.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 28);
  return sub_25E4FA528(a1, v3);
}

uint64_t (*TimeStats.firstDisplay.modify())()
{
  return nullsub_1;
}

uint64_t TimeStats.recommendations.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 32);
  return sub_25E4FA47C(v3, a1);
}

uint64_t TimeStats.recommendations.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 32);
  return sub_25E4FA528(a1, v3);
}

uint64_t (*TimeStats.recommendations.modify())()
{
  return nullsub_1;
}

uint64_t TimeStats.init(initTime:startMonitoring:firstGathering:firstDisplay:recommendations:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9 = (int *)type metadata accessor for TimeStats();
  uint64_t v10 = a6 + v9[5];
  uint64_t v11 = sub_25E4FDD28();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  uint64_t v13 = a6 + v9[6];
  v12(v13, 1, 1, v11);
  uint64_t v14 = a6 + v9[7];
  v12(v14, 1, 1, v11);
  uint64_t v15 = a6 + v9[8];
  v12(v15, 1, 1, v11);
  uint64_t v16 = sub_25E4FD6C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(a6, a1, v16);
  sub_25E4FA528(a2, v10);
  sub_25E4FA528(a3, v13);
  sub_25E4FA528(a4, v14);
  return sub_25E4FA528(a5, v15);
}

unint64_t TimeStats.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v67 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v69 = (char *)&v59 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v62 = (uint64_t)&v59 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v68 = (char *)&v59 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v59 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v59 - v14;
  uint64_t v16 = sub_25E4FDD28();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  char v59 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v65 = (char *)&v59 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  unint64_t v60 = (char *)&v59 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v63 = (char *)&v59 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v61 = (char *)&v59 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v70 = (char *)&v59 - v28;
  unint64_t v74 = 0;
  unint64_t v75 = 0xE000000000000000;
  sub_25E4FDED8();
  swift_bridgeObjectRelease();
  unint64_t v74 = 0xD000000000000023;
  unint64_t v75 = 0x800000025E4FFE50;
  sub_25E4FD6A8();
  sub_25E4FDD88();
  swift_bridgeObjectRelease();
  sub_25E4FDD88();
  uint64_t v29 = type metadata accessor for TimeStats();
  uint64_t v30 = v0 + *(int *)(v29 + 20);
  sub_25E4FA47C(v30, (uint64_t)v15);
  uint64_t v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  int v32 = v31(v15, 1, v16);
  uint64_t v71 = v29;
  uint64_t v64 = v30;
  uint64_t v66 = v1;
  if (v32 == 1)
  {
    sub_25E4FB230((uint64_t)v15);
    id v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v31;
    uint64_t v34 = (uint64_t)v68;
    uint64_t v35 = (uint64_t)v69;
  }
  else
  {
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v36(v70, v15, v16);
    sub_25E4FA47C(v1 + *(int *)(v29 + 24), (uint64_t)v13);
    id v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v31;
    if (v31(v13, 1, v16) == 1)
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v70, v16);
      sub_25E4FB230((uint64_t)v13);
      uint64_t v34 = (uint64_t)v68;
      uint64_t v35 = (uint64_t)v69;
    }
    else
    {
      uint64_t v37 = v61;
      v36(v61, v13, v16);
      unint64_t v38 = sub_25E4FDD18();
      unint64_t result = sub_25E4FDD18();
      uint64_t v34 = (uint64_t)v68;
      uint64_t v35 = (uint64_t)v69;
      if (v38 < result)
      {
        __break(1u);
        goto LABEL_23;
      }
      uint64_t v72 = 0;
      unint64_t v73 = 0xE000000000000000;
      sub_25E4FDED8();
      sub_25E4FDD88();
      sub_25E4FDE08();
      sub_25E4FDD88();
      sub_25E4FDD88();
      swift_bridgeObjectRelease();
      uint64_t v40 = *(void (**)(char *, uint64_t))(v17 + 8);
      v40(v37, v16);
      v40(v70, v16);
    }
    uint64_t v30 = v64;
  }
  sub_25E4FA47C(v30, v34);
  int v41 = v33(v34, 1, v16);
  uint64_t v42 = (uint64_t)v67;
  if (v41 != 1)
  {
    uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 32);
    uint64_t v45 = v63;
    v44(v63, v34, v16);
    uint64_t v46 = v62;
    sub_25E4FA47C(v66 + *(int *)(v71 + 28), v62);
    if (v33(v46, 1, v16) == 1)
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v45, v16);
      sub_25E4FB230(v46);
LABEL_14:
      uint64_t v43 = v71;
      uint64_t v30 = v64;
      goto LABEL_15;
    }
    uint64_t v47 = v46;
    uint64_t v48 = v60;
    v44(v60, v47, v16);
    uint64_t v49 = v48;
    unint64_t v50 = sub_25E4FDD18();
    unint64_t result = sub_25E4FDD18();
    if (v50 >= result)
    {
      uint64_t v72 = 0;
      unint64_t v73 = 0xE000000000000000;
      sub_25E4FDED8();
      sub_25E4FDD88();
      sub_25E4FDE08();
      sub_25E4FDD88();
      sub_25E4FDD88();
      swift_bridgeObjectRelease();
      unsigned __int8 v51 = v49;
      int v52 = *(void (**)(char *, uint64_t))(v17 + 8);
      v52(v51, v16);
      v52(v45, v16);
      goto LABEL_14;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_25E4FB230(v34);
  uint64_t v43 = v71;
LABEL_15:
  sub_25E4FA47C(v30, v35);
  int v53 = v33(v35, 1, v16);
  uint64_t v54 = v65;
  if (v53 == 1)
  {
    sub_25E4FB230(v35);
    return v74;
  }
  unint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 32);
  v55(v65, v35, v16);
  sub_25E4FA47C(v66 + *(int *)(v43 + 32), v42);
  if (v33(v42, 1, v16) == 1)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v54, v16);
    sub_25E4FB230(v42);
    return v74;
  }
  uint64_t v56 = v59;
  v55(v59, v42, v16);
  unint64_t v57 = sub_25E4FDD18();
  unint64_t result = sub_25E4FDD18();
  if (v57 >= result)
  {
    uint64_t v72 = 0;
    unint64_t v73 = 0xE000000000000000;
    sub_25E4FDED8();
    sub_25E4FDD88();
    sub_25E4FDE08();
    sub_25E4FDD88();
    sub_25E4FDD88();
    swift_bridgeObjectRelease();
    char v58 = *(void (**)(char *, uint64_t))(v17 + 8);
    v58(v56, v16);
    v58(v54, v16);
    return v74;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_25E4FB230(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for TimeStats(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25E4FD6C8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25E4FDD28();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = a3[6];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    if (v13((char *)a2 + v16, 1, v11))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v17, v18, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v17, 0, 1, v11);
    }
    uint64_t v20 = a3[7];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    if (v13((char *)a2 + v20, 1, v11))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
      memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v21, v22, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v21, 0, 1, v11);
    }
    uint64_t v24 = a3[8];
    uint64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    if (v13(v26, 1, v11))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
      memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v25, v26, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v25, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for TimeStats(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_25E4FD6C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_25E4FDD28();
  uint64_t v13 = *(void *)(v6 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (!v7(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v5, v6);
  }
  uint64_t v8 = a1 + a2[6];
  if (!v7(v8, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v8, v6);
  }
  uint64_t v9 = a1 + a2[7];
  if (!v7(v9, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v6);
  }
  uint64_t v10 = a1 + a2[8];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v10, 1, v6);
  if (!result)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
    return v12(v10, v6);
  }
  return result;
}

uint64_t initializeWithCopy for TimeStats(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E4FD6C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25E4FDD28();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  if (v12((const void *)(a2 + v14), 1, v10))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v15, v16, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v15, 0, 1, v10);
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  if (v12((const void *)(a2 + v18), 1, v10))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v19, v20, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v19, 0, 1, v10);
  }
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  if (v12(v24, 1, v10))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v23, v24, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v23, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for TimeStats(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E4FD6C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_25E4FDD28();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  int v19 = v12((void *)(a1 + v16), 1, v10);
  int v20 = v12(v18, 1, v10);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v17, v18, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v17, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v17, v10);
LABEL_12:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v17, v18, v10);
LABEL_13:
  uint64_t v22 = a3[7];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  int v25 = v12((void *)(a1 + v22), 1, v10);
  int v26 = v12(v24, 1, v10);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v23, v24, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v23, 0, 1, v10);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v26)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v23, v10);
LABEL_18:
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v23, v24, v10);
LABEL_19:
  uint64_t v28 = a3[8];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (void *)(a2 + v28);
  int v31 = v12((void *)(a1 + v28), 1, v10);
  int v32 = v12(v30, 1, v10);
  if (!v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v29, v30, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v29, v10);
    goto LABEL_24;
  }
  if (v32)
  {
LABEL_24:
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v29, v30, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v29, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for TimeStats(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E4FD6C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_25E4FDD28();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  if (v12((const void *)(a2 + v14), 1, v10))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v15, v16, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v15, 0, 1, v10);
  }
  uint64_t v18 = a3[7];
  int v19 = (void *)(a1 + v18);
  int v20 = (const void *)(a2 + v18);
  if (v12((const void *)(a2 + v18), 1, v10))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v19, v20, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v19, 0, 1, v10);
  }
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  if (v12(v24, 1, v10))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v23, v24, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v23, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithTake for TimeStats(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E4FD6C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_25E4FDD28();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  int v19 = v12((void *)(a1 + v16), 1, v10);
  int v20 = v12(v18, 1, v10);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v17, v18, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v17, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v17, v10);
LABEL_12:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v17, v18, v10);
LABEL_13:
  uint64_t v22 = a3[7];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  int v25 = v12((void *)(a1 + v22), 1, v10);
  int v26 = v12(v24, 1, v10);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v23, v24, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v23, 0, 1, v10);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v26)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v23, v10);
LABEL_18:
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v23, v24, v10);
LABEL_19:
  uint64_t v28 = a3[8];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (void *)(a2 + v28);
  int v31 = v12((void *)(a1 + v28), 1, v10);
  int v32 = v12(v30, 1, v10);
  if (!v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v29, v30, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v29, v10);
    goto LABEL_24;
  }
  if (v32)
  {
LABEL_24:
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v29, v30, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v29, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimeStats(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E4FC7C8);
}

uint64_t sub_25E4FC7C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25E4FD6C8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for TimeStats(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E4FC8D8);
}

uint64_t sub_25E4FC8D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_25E4FD6C8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F36D8);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_25E4FC9E0()
{
  sub_25E4FD6C8();
  if (v0 <= 0x3F)
  {
    sub_25E4FCAAC();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25E4FCAAC()
{
  if (!qword_26A6F36F0)
  {
    sub_25E4FDD28();
    unint64_t v0 = sub_25E4FDE88();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6F36F0);
    }
  }
}

BOOL static DeviceClass.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void *sub_25E4FCB18()
{
  uint64_t result = (void *)sub_25E4FCCA8((uint64_t)&unk_270B31FC8);
  off_26A6F36F8 = result;
  return result;
}

uint64_t DeviceClass.hash(into:)()
{
  return sub_25E4FE008();
}

uint64_t DeviceClass.hashValue.getter()
{
  return sub_25E4FE028();
}

BOOL sub_25E4FCBB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_25E4FCBC4(unsigned int a1)
{
  uint64_t v3 = MEMORY[0x2611DB830](*(void *)(v1 + 40), a1, 4);
  return sub_25E4FCC0C(a1, v3);
}

unint64_t sub_25E4FCC0C(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_25E4FCCA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6F3708);
    uint64_t v3 = (void *)sub_25E4FDF78();
    for (uint64_t i = (unsigned char *)(a1 + 36); ; i += 8)
    {
      unsigned int v5 = *((_DWORD *)i - 1);
      char v6 = *i;
      unint64_t result = sub_25E4FCBC4(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_DWORD *)(v3[6] + 4 * result) = v5;
      *(unsigned char *)(v3[7] + result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
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
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t _s9StorageUI11DeviceClassO7currentACvgZ_0()
{
  if (qword_26A6F32B8 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)sub_25E4FDD38();
  unsigned int v1 = MGGetSInt32Answer();

  swift_beginAccess();
  uint64_t v2 = off_26A6F36F8;
  if (*((void *)off_26A6F36F8 + 2) && (unint64_t v3 = sub_25E4FCBC4(v1), (v4 & 1) != 0)) {
    uint64_t v5 = *(unsigned __int8 *)(v2[7] + v3);
  }
  else {
    uint64_t v5 = 5;
  }
  swift_endAccess();
  return v5;
}

unint64_t sub_25E4FCE58()
{
  unint64_t result = qword_26A6F3700;
  if (!qword_26A6F3700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6F3700);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DeviceClass(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DeviceClass(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x25E4FD008);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceClass()
{
  return &type metadata for DeviceClass;
}

BOOL __isOSVersionAtLeast(int a1, int a2, int a3)
{
  if (qword_26A6F4960 == -1)
  {
    BOOL v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_26A6F4960, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1) {
      return 1;
    }
  }
  if (v6) {
    return 0;
  }
  if (dword_26A6F4954 > a2) {
    return 1;
  }
  return dword_26A6F4954 >= a2 && dword_26A6F4958 >= a3;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_26A6F4968 == -1)
  {
    if (qword_26A6F4970) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_26A6F4968, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_26A6F4970) {
      return _availability_version_check();
    }
  }
  if (qword_26A6F4960 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_26A6F4960, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_26A6F4954 > a3) {
    return 1;
  }
  return dword_26A6F4954 >= a3 && dword_26A6F4958 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v1 = qword_26A6F4970;
  if (qword_26A6F4970) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x263EF8368])
    {
      uint64_t v1 = MEMORY[0x270FA5398];
      qword_26A6F4970 = MEMORY[0x270FA5398];
    }
    if (!v1 || result != 0)
    {
      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        unsigned int v4 = *(unsigned __int8 **)result;
        unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            BOOL v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  BOOL v10 = (uint64_t (*)(uint64_t))result;
                  unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    uint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        unint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x2611DB9D0](v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              int v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  int v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_26A6F4954, &dword_26A6F4958);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    int v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  int v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                int v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          int v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_25E4FD618()
{
  return MEMORY[0x270EEEF68]();
}

uint64_t sub_25E4FD628()
{
  return MEMORY[0x270EEEF70]();
}

uint64_t sub_25E4FD638()
{
  return MEMORY[0x270EEEFC0]();
}

uint64_t sub_25E4FD648()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_25E4FD658()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_25E4FD668()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25E4FD678()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_25E4FD688()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_25E4FD698()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25E4FD6A8()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_25E4FD6B8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25E4FD6C8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25E4FD6D8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25E4FD6E8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25E4FD6F8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25E4FD708()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_25E4FD718()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_25E4FD728()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_25E4FD738()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_25E4FD748()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_25E4FD758()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_25E4FD768()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_25E4FD778()
{
  return MEMORY[0x270EFF3F8]();
}

uint64_t sub_25E4FD788()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_25E4FD798()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_25E4FD7A8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_25E4FD7B8()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_25E4FD7C8()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_25E4FD7D8()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_25E4FD7E8()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_25E4FD7F8()
{
  return MEMORY[0x270EFF7E8]();
}

uint64_t sub_25E4FD808()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_25E4FD818()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_25E4FD828()
{
  return MEMORY[0x270EFFA60]();
}

uint64_t sub_25E4FD838()
{
  return MEMORY[0x270EFFFB8]();
}

uint64_t sub_25E4FD848()
{
  return MEMORY[0x270EFFFD8]();
}

uint64_t sub_25E4FD858()
{
  return MEMORY[0x270EFFFE8]();
}

uint64_t sub_25E4FD868()
{
  return MEMORY[0x270F00100]();
}

uint64_t sub_25E4FD878()
{
  return MEMORY[0x270F00550]();
}

uint64_t sub_25E4FD888()
{
  return MEMORY[0x270F00590]();
}

uint64_t sub_25E4FD898()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_25E4FD8A8()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_25E4FD8B8()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_25E4FD8C8()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_25E4FD8D8()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_25E4FD8E8()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_25E4FD8F8()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25E4FD908()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_25E4FD918()
{
  return MEMORY[0x270F01130]();
}

uint64_t sub_25E4FD928()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_25E4FD938()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_25E4FD948()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_25E4FD958()
{
  return MEMORY[0x270F02078]();
}

uint64_t sub_25E4FD968()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_25E4FD978()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_25E4FD988()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_25E4FD998()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_25E4FD9A8()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_25E4FD9B8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_25E4FD9C8()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_25E4FD9D8()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_25E4FD9E8()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_25E4FD9F8()
{
  return MEMORY[0x270F02A98]();
}

uint64_t sub_25E4FDA08()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_25E4FDA18()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_25E4FDA28()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_25E4FDA38()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_25E4FDA48()
{
  return MEMORY[0x270F02E88]();
}

uint64_t sub_25E4FDA58()
{
  return MEMORY[0x270F02EA8]();
}

uint64_t sub_25E4FDA68()
{
  return MEMORY[0x270F02EE8]();
}

uint64_t sub_25E4FDA78()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_25E4FDA88()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25E4FDA98()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25E4FDAA8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25E4FDAB8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25E4FDAC8()
{
  return MEMORY[0x270F03500]();
}

uint64_t sub_25E4FDAD8()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_25E4FDAE8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25E4FDAF8()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_25E4FDB08()
{
  return MEMORY[0x270F04368]();
}

uint64_t sub_25E4FDB18()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_25E4FDB38()
{
  return MEMORY[0x270F043C8]();
}

uint64_t sub_25E4FDB48()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_25E4FDB58()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_25E4FDB68()
{
  return MEMORY[0x270F04408]();
}

uint64_t sub_25E4FDB78()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_25E4FDB88()
{
  return MEMORY[0x270F04438]();
}

uint64_t sub_25E4FDB98()
{
  return MEMORY[0x270F04440]();
}

uint64_t sub_25E4FDBA8()
{
  return MEMORY[0x270F04450]();
}

uint64_t sub_25E4FDBB8()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_25E4FDBC8()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_25E4FDBD8()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_25E4FDBE8()
{
  return MEMORY[0x270F044A8]();
}

uint64_t sub_25E4FDBF8()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_25E4FDC08()
{
  return MEMORY[0x270F044C8]();
}

uint64_t sub_25E4FDC18()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_25E4FDC28()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_25E4FDC38()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_25E4FDC48()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_25E4FDC58()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_25E4FDC68()
{
  return MEMORY[0x270F04870]();
}

uint64_t sub_25E4FDC78()
{
  return MEMORY[0x270F04930]();
}

uint64_t sub_25E4FDC88()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_25E4FDC98()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_25E4FDCA8()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_25E4FDCB8()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_25E4FDCC8()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_25E4FDCD8()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_25E4FDCE8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_25E4FDCF8()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_25E4FDD08()
{
  return MEMORY[0x270F053D0]();
}

uint64_t sub_25E4FDD18()
{
  return MEMORY[0x270FA0A98]();
}

uint64_t sub_25E4FDD28()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25E4FDD38()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25E4FDD48()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25E4FDD58()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25E4FDD68()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25E4FDD78()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25E4FDD88()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25E4FDD98()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25E4FDDA8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25E4FDDB8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25E4FDDC8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25E4FDDD8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25E4FDDE8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25E4FDDF8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25E4FDE08()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25E4FDE18()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25E4FDE28()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_25E4FDE38()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25E4FDE48()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25E4FDE58()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25E4FDE68()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25E4FDE78()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_25E4FDE88()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25E4FDE98()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25E4FDEA8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25E4FDEB8()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_25E4FDEC8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25E4FDED8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25E4FDEE8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25E4FDEF8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25E4FDF08()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25E4FDF18()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25E4FDF28()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25E4FDF38()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25E4FDF48()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25E4FDF58()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25E4FDF68()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25E4FDF78()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25E4FDF88()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25E4FDFA8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25E4FDFB8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25E4FDFC8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25E4FDFD8()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_25E4FDFE8()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_25E4FDFF8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25E4FE008()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25E4FE018()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25E4FE028()
{
  return MEMORY[0x270F9FC90]();
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

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t _availability_version_check()
{
  return MEMORY[0x270ED7F40]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}