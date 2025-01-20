uint64_t BinarySettingView.body.getter()
{
  const void *v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD v28[9];
  long long v29;
  _OWORD v30[3];

  v23 = sub_25DA8EB70();
  OUTLINED_FUNCTION_0();
  v2 = v1;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  v5 = v4 - v3;
  sub_25DA8EDA0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A75F8);
  OUTLINED_FUNCTION_0();
  v24 = v6;
  v25 = v7;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  v10 = v9 - v8;
  sub_25DA8EE00();
  OUTLINED_FUNCTION_0();
  v26 = v11;
  v27 = v12;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  v15 = v14 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7600);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  memcpy(v28, v0, sizeof(v28));
  v30[1] = v28[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7608);
  sub_25DA8ED40();
  v29 = v28[3];
  v30[0] = v28[2];
  type metadata accessor for SettingViewUtils();
  swift_initStackObject();
  sub_25DA84EC4((uint64_t)v30);
  sub_25DA84EC4((uint64_t)&v29);
  sub_25DA8DE38();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v5, *MEMORY[0x263F76578], v23);
  sub_25DA85658(&qword_26A6A7610, MEMORY[0x263F77558]);
  sub_25DA8EC90();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v23);
  v16 = OUTLINED_FUNCTION_2();
  v17(v16);
  swift_getOpaqueTypeConformance2();
  sub_25DA8EC80();
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v10, v24);
  sub_25DA8EDF0();
  v18 = swift_allocObject();
  OUTLINED_FUNCTION_3(v18);
  sub_25DA84EFC((uint64_t)v28);
  sub_25DA85658(&qword_26A6A7618, MEMORY[0x263F778B8]);
  sub_25DA8ECA0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v15, v26);
  sub_25DA8ED20();
  v19 = swift_allocObject();
  OUTLINED_FUNCTION_3(v19);
  sub_25DA84EFC((uint64_t)v28);
  swift_getOpaqueTypeConformance2();
  sub_25DA8ECF0();
  swift_release();
  v20 = OUTLINED_FUNCTION_2();
  return v21(v20);
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

uint64_t sub_25DA8497C(uint64_t a1)
{
  uint64_t v2 = sub_25DA8EB60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 80))
  {
    uint64_t v6 = qword_26A6A75E8;
    swift_bridgeObjectRetain();
    if (v6 != -1) {
      swift_once();
    }
    sub_25DA8EEF0();
    sub_25DA8EBE0();
    v7 = *(void **)(a1 + 112);
    if (!v7)
    {
      sub_25DA84EFC(a1);
      sub_25DA8EE40();
      sub_25DA85658((unint64_t *)&qword_26A6A7628, MEMORY[0x263F77980]);
      uint64_t result = sub_25DA8EC10();
      __break(1u);
      return result;
    }
    id v8 = v7;
    sub_25DA8EB50();
    sub_25DA8EE20();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  if (qword_26A6A75E8 != -1) {
    swift_once();
  }
  sub_25DA8EEF0();
  return sub_25DA8EBE0();
}

uint64_t sub_25DA84BCC(int a1, int a2, void *__src)
{
  memcpy(__dst, __src, sizeof(__dst));
  sub_25DA855F0((uint64_t)&__dst[11], (uint64_t)v13);
  sub_25DA855F0((uint64_t)v13, (uint64_t)v14);
  if (v14[1])
  {
    if (qword_26A6A75E8 != -1) {
      swift_once();
    }
    sub_25DA8EEF0();
    sub_25DA8EBE0();
    uint64_t v4 = (void *)*((void *)__src + 14);
    if (v4)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7630);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25DA8F500;
      id v6 = v4;
      uint64_t v7 = MEMORY[0x263F8D310];
      sub_25DA8EF40();
      uint64_t v9 = __dst[0];
      uint64_t v8 = __dst[1];
      *(void *)(inited + 96) = v7;
      *(void *)(inited + 72) = v9;
      *(void *)(inited + 80) = v8;
      swift_bridgeObjectRetain();
      sub_25DA8EF40();
      uint64_t v10 = __dst[13];
      *(void *)(inited + 168) = MEMORY[0x263F8D6C8];
      *(void *)(inited + 144) = v10;
      sub_25DA8EE50();
      sub_25DA8EE30();

      return swift_bridgeObjectRelease();
    }
    else
    {
      sub_25DA84EFC((uint64_t)__src);
      sub_25DA8EE40();
      sub_25DA85658((unint64_t *)&qword_26A6A7628, MEMORY[0x263F77980]);
      uint64_t result = sub_25DA8EC10();
      __break(1u);
    }
  }
  else
  {
    if (qword_26A6A75E8 != -1) {
      swift_once();
    }
    sub_25DA8EEF0();
    return sub_25DA8EBE0();
  }
  return result;
}

uint64_t sub_25DA84EA4()
{
  return sub_25DA8ECE0();
}

uint64_t sub_25DA84EC4(uint64_t a1)
{
  return a1;
}

uint64_t sub_25DA84EF4()
{
  return sub_25DA8497C(v0 + 16);
}

uint64_t sub_25DA84EFC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 112);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return a1;
}

uint64_t objectdestroyTm()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 160, 7);
}

uint64_t sub_25DA85004(int a1, int a2)
{
  return sub_25DA84BCC(a1, a2, (void *)(v2 + 16));
}

uint64_t sub_25DA8500C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for BinarySettingView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BinarySettingView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for BinarySettingView(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  uint64_t v9 = *(void **)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v10 = v9;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for BinarySettingView(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v4 = *(void **)(a1 + 112);
  uint64_t v5 = *(void **)(a2 + 112);
  *(void *)(a1 + 112) = v5;
  id v6 = v5;

  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy144_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x90uLL);
}

uint64_t assignWithTake for BinarySettingView(uint64_t a1, uint64_t a2)
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
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  id v10 = *(void **)(a1 + 112);
  uint64_t v11 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v11;

  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BinarySettingView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 144))
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

uint64_t storeEnumTagSinglePayload for BinarySettingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 144) = 1;
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
    *(unsigned char *)(result + 144) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BinarySettingView()
{
  return &type metadata for BinarySettingView;
}

uint64_t sub_25DA85464()
{
  return swift_getOpaqueTypeConformance2();
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

BOOL sub_25DA8557C(uint64_t *a1, uint64_t *a2)
{
  return sub_25DA8D068(*a1, *a2);
}

void sub_25DA85588(uint64_t a1@<X8>)
{
  sub_25DA855BC();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_25DA855C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_25DA855F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7620);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DA85658(unint64_t *a1, void (*a2)(uint64_t))
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

void type metadata accessor for INSetNumericSettingIntentResponseCode()
{
  if (!qword_26A6A7638)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A6A7638);
    }
  }
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

void *OUTLINED_FUNCTION_3(uint64_t a1)
{
  char v3 = (void *)(a1 + 16);
  return memcpy(v3, (const void *)(v1 + 368), 0x90uLL);
}

unint64_t static SnippetModels.bundleName.getter()
{
  return 0xD000000000000014;
}

uint64_t sub_25DA8576C()
{
  return 1;
}

uint64_t sub_25DA85774()
{
  return sub_25DA8F0D0();
}

uint64_t sub_25DA8579C()
{
  return 0;
}

uint64_t sub_25DA857A8()
{
  return 12383;
}

uint64_t sub_25DA857B8()
{
  return sub_25DA85B28();
}

uint64_t sub_25DA857DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25DA85AB8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25DA85808()
{
  return sub_25DA8579C();
}

uint64_t sub_25DA85824@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25DA8576C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25DA85850(uint64_t a1)
{
  unint64_t v2 = sub_25DA861E0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DA8588C(uint64_t a1)
{
  unint64_t v2 = sub_25DA861E0();

  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_25DA858C8(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_25DA858D8()
{
  return sub_25DA8F0D0();
}

uint64_t sub_25DA85900(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65537972616E6962 && a2 == 0xED0000676E697474;
  if (v3 || (sub_25DA8F0B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x53636972656D756ELL && a2 == 0xEE00676E69747465)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_25DA8F0B0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25DA85A18()
{
  return 2;
}

uint64_t sub_25DA85A20()
{
  return sub_25DA8F0E0();
}

uint64_t sub_25DA85A68(char a1)
{
  if (a1) {
    return 0x53636972656D756ELL;
  }
  else {
    return 0x65537972616E6962;
  }
}

uint64_t sub_25DA85AB8(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25DA8F0B0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25DA85B28()
{
  return sub_25DA8F0E0();
}

BOOL sub_25DA85B6C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25DA858C8(*a1, *a2);
}

uint64_t sub_25DA85B78()
{
  return sub_25DA85A20();
}

uint64_t sub_25DA85B80()
{
  return sub_25DA858D8();
}

uint64_t sub_25DA85B88()
{
  return sub_25DA8F0E0();
}

uint64_t sub_25DA85BCC()
{
  return sub_25DA85A68(*v0);
}

uint64_t sub_25DA85BD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25DA85900(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25DA85BFC()
{
  return sub_25DA8579C();
}

uint64_t sub_25DA85C1C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25DA85A18();
  *a1 = result;
  return result;
}

uint64_t sub_25DA85C44(uint64_t a1)
{
  unint64_t v2 = sub_25DA860F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DA85C80(uint64_t a1)
{
  unint64_t v2 = sub_25DA860F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25DA85CBC()
{
  return sub_25DA8F0E0();
}

uint64_t sub_25DA85CFC(uint64_t a1)
{
  unint64_t v2 = sub_25DA86148();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DA85D38(uint64_t a1)
{
  unint64_t v2 = sub_25DA86148();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SnippetModels.encode(to:)()
{
  OUTLINED_FUNCTION_16();
  uint64_t v1 = v0;
  char v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7640);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7648);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7650);
  OUTLINED_FUNCTION_0();
  uint64_t v27 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7 - v6;
  sub_25DA86098(v1, v25);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25DA860F0();
  sub_25DA8F100();
  sub_25DA86098(v25, v26);
  LODWORD(v3) = sub_25DA8613C((uint64_t)v26);
  uint64_t v9 = nullsub_1(v26);
  id v10 = (const void *)v9;
  if (v3 == 1)
  {
    LOBYTE(v24[0]) = 1;
    sub_25DA86148();
    sub_25DA8F040();
    memcpy(v24, v10, sizeof(v24));
    sub_25DA86194();
    sub_25DA8F0A0();
    OUTLINED_FUNCTION_18();
    v11();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v8, v4);
  }
  else
  {
    long long v23 = *(_OWORD *)v9;
    long long v20 = *(_OWORD *)(v9 + 32);
    long long v21 = *(_OWORD *)(v9 + 16);
    uint64_t v12 = *(void *)(v9 + 48);
    uint64_t v13 = *(void *)(v9 + 56);
    uint64_t v22 = v4;
    char v14 = *(unsigned char *)(v9 + 64);
    char v15 = *(unsigned char *)(v9 + 65);
    long long v18 = *(_OWORD *)(v9 + 88);
    long long v19 = *(_OWORD *)(v9 + 72);
    uint64_t v16 = *(void *)(v9 + 104);
    sub_25DA861E0();
    sub_25DA8F040();
    v24[0] = v23;
    v24[1] = v21;
    v24[2] = v20;
    *(void *)&v24[3] = v12;
    *((void *)&v24[3] + 1) = v13;
    LOBYTE(v24[4]) = v14;
    BYTE1(v24[4]) = v15;
    *(_OWORD *)((char *)&v24[4] + 8) = v19;
    *(_OWORD *)((char *)&v24[5] + 8) = v18;
    *((void *)&v24[6] + 1) = v16;
    sub_25DA8622C();
    sub_25DA8F0A0();
    OUTLINED_FUNCTION_18();
    v17();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v8, v22);
  }
  OUTLINED_FUNCTION_12();
}

void *sub_25DA86098(void *__src, void *__dst)
{
  return memcpy(__dst, __src, 0x91uLL);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_25DA860F0()
{
  unint64_t result = qword_26A6A7658;
  if (!qword_26A6A7658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7658);
  }
  return result;
}

uint64_t sub_25DA8613C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 144);
}

unint64_t sub_25DA86148()
{
  unint64_t result = qword_26A6A7660;
  if (!qword_26A6A7660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7660);
  }
  return result;
}

unint64_t sub_25DA86194()
{
  unint64_t result = qword_26A6A7668;
  if (!qword_26A6A7668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7668);
  }
  return result;
}

unint64_t sub_25DA861E0()
{
  unint64_t result = qword_26A6A7670;
  if (!qword_26A6A7670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7670);
  }
  return result;
}

unint64_t sub_25DA8622C()
{
  unint64_t result = qword_26A6A7678;
  if (!qword_26A6A7678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7678);
  }
  return result;
}

void SnippetModels.init(from:)()
{
  OUTLINED_FUNCTION_16();
  char v3 = v2;
  v26 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7680);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7688);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_8();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7690);
  OUTLINED_FUNCTION_0();
  uint64_t v27 = v6;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_7();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25DA860F0();
  sub_25DA8F0F0();
  if (v0) {
    goto LABEL_9;
  }
  uint64_t v7 = sub_25DA8F030();
  uint64_t v8 = *(void *)(v7 + 16);
  uint64_t v9 = v5;
  if (!v8)
  {
LABEL_8:
    uint64_t v14 = sub_25DA8EF70();
    swift_allocError();
    uint64_t v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7698);
    *uint64_t v16 = &type metadata for SnippetModels;
    sub_25DA8EFC0();
    sub_25DA8EF60();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCB0], v14);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v1, v9);
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    goto LABEL_10;
  }
  char v25 = *(unsigned char *)(v7 + 32);
  sub_25DA8887C(1, v8, v7, v7 + 32, 0, (2 * v8) | 1);
  uint64_t v11 = v10;
  unint64_t v13 = v12;
  swift_bridgeObjectRelease();
  if (v11 != v13 >> 1)
  {
    uint64_t v9 = v5;
    goto LABEL_8;
  }
  if (v25)
  {
    LOBYTE(v28[0]) = 1;
    sub_25DA86148();
    sub_25DA8EFB0();
    sub_25DA888F8();
    sub_25DA8F020();
    uint64_t v17 = OUTLINED_FUNCTION_14();
    v18(v17);
    swift_unknownObjectRelease();
    uint64_t v19 = OUTLINED_FUNCTION_19();
    v20(v19);
    memcpy(v28, v29, sizeof(v28));
    sub_25DA88944((uint64_t)v28);
  }
  else
  {
    LOBYTE(v28[0]) = 0;
    sub_25DA861E0();
    sub_25DA8EFB0();
    sub_25DA88950();
    sub_25DA8F020();
    uint64_t v21 = OUTLINED_FUNCTION_15();
    v22(v21);
    swift_unknownObjectRelease();
    uint64_t v23 = OUTLINED_FUNCTION_13();
    v24(v23);
    v28[0] = v29[0];
    v28[1] = v29[1];
    v28[2] = v29[2];
    v28[3] = v29[3];
    LOWORD(v28[4]) = v29[4];
    *(_OWORD *)((char *)&v28[4] + 8) = *(_OWORD *)((char *)&v29[4] + 8);
    *(_OWORD *)((char *)&v28[5] + 8) = *(_OWORD *)((char *)&v29[5] + 8);
    *((void *)&v28[6] + 1) = *((void *)&v29[6] + 1);
    sub_25DA8899C((uint64_t)v28);
  }
  sub_25DA86098(v28, v30);
  sub_25DA86098(v30, v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
LABEL_10:
  OUTLINED_FUNCTION_12();
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

unint64_t sub_25DA8680C()
{
  return 0xD000000000000014;
}

void sub_25DA86830()
{
}

void sub_25DA86848()
{
}

uint64_t BinarySettingModel.settingId.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t BinarySettingModel.graphicIcon.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t BinarySettingModel.label.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t BinarySettingModel.secondLabel.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t BinarySettingModel.oldValue.getter()
{
  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t BinarySettingModel.updatedValue.getter()
{
  return *(unsigned __int8 *)(v0 + 65);
}

uint64_t BinarySettingModel.url.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t BinarySettingModel.directInvocationId.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t BinarySettingModel.deviceCategoryInt.getter()
{
  return *(void *)(v0 + 104);
}

void __swiftcall BinarySettingModel.init(settingId:graphicIcon:label:secondLabel:oldValue:updatedValue:url:directInvocationId:deviceCategoryInt:)(SiriSettingsUI::BinarySettingModel *__return_ptr retstr, Swift::String settingId, Swift::String graphicIcon, Swift::String label, Swift::String secondLabel, Swift::Bool oldValue, Swift::Bool updatedValue, Swift::String_optional url, Swift::String_optional directInvocationId, Swift::Int deviceCategoryInt)
{
  retstr->settingId = settingId;
  retstr->graphicIcon = graphicIcon;
  retstr->label = label;
  retstr->secondLabel = secondLabel;
  retstr->oldValue = oldValue;
  retstr->updatedValue = updatedValue;
  retstr->url = url;
  retstr->directInvocationId = directInvocationId;
  retstr->deviceCategoryInt = deviceCategoryInt;
}

BOOL sub_25DA869BC(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25DA869CC()
{
  return sub_25DA8F0D0();
}

uint64_t sub_25DA869F4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x49676E6974746573 && a2 == 0xE900000000000064;
  if (v3 || (sub_25DA8F0B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x4963696870617267 && a2 == 0xEB000000006E6F63;
    if (v6 || (sub_25DA8F0B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
      if (v7 || (sub_25DA8F0B0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x614C646E6F636573 && a2 == 0xEB000000006C6562;
        if (v8 || (sub_25DA8F0B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x65756C6156646C6FLL && a2 == 0xE800000000000000;
          if (v9 || (sub_25DA8F0B0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x5664657461647075 && a2 == 0xEC00000065756C61;
            if (v10 || (sub_25DA8F0B0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 7107189 && a2 == 0xE300000000000000;
              if (v11 || (sub_25DA8F0B0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else if (a1 == 0xD000000000000012 && a2 == 0x800000025DA91100 || (sub_25DA8F0B0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else if (a1 == 0xD000000000000011 && a2 == 0x800000025DA91030)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else
              {
                char v12 = sub_25DA8F0B0();
                swift_bridgeObjectRelease();
                if (v12) {
                  return 8;
                }
                else {
                  return 9;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_25DA86D6C()
{
  return 9;
}

unint64_t sub_25DA86D74(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4963696870617267;
      break;
    case 2:
      unint64_t result = 0x6C6562616CLL;
      break;
    case 3:
      unint64_t result = 0x614C646E6F636573;
      break;
    case 4:
      unint64_t result = 0x65756C6156646C6FLL;
      break;
    case 5:
      unint64_t result = 0x5664657461647075;
      break;
    case 6:
      unint64_t result = 7107189;
      break;
    case 7:
      return result;
    case 8:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      unint64_t result = 0x49676E6974746573;
      break;
  }
  return result;
}

BOOL sub_25DA86EB0(char *a1, char *a2)
{
  return sub_25DA869BC(*a1, *a2);
}

uint64_t sub_25DA86EBC()
{
  return sub_25DA87D60();
}

uint64_t sub_25DA86ED8()
{
  return sub_25DA869CC();
}

unint64_t sub_25DA86EE4()
{
  return sub_25DA86D74(*v0);
}

uint64_t sub_25DA86EEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25DA869F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25DA86F14@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25DA86D6C();
  *a1 = result;
  return result;
}

uint64_t sub_25DA86F3C(uint64_t a1)
{
  unint64_t v2 = sub_25DA889A4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DA86F78(uint64_t a1)
{
  unint64_t v2 = sub_25DA889A4();

  return MEMORY[0x270FA00B8](a1, v2);
}

void BinarySettingModel.encode(to:)()
{
  OUTLINED_FUNCTION_16();
  BOOL v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A76B0);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_7();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25DA889A4();
  sub_25DA8F100();
  sub_25DA8F060();
  if (!v0)
  {
    sub_25DA8F060();
    sub_25DA8F060();
    sub_25DA8F060();
    sub_25DA8F070();
    sub_25DA8F070();
    sub_25DA8F050();
    sub_25DA8F050();
    sub_25DA8F090();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_12();
}

void BinarySettingModel.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, char a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_16();
  a23 = v25;
  a24 = v26;
  v28 = v27;
  uint64_t v30 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A76C0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_8();
  __swift_project_boxed_opaque_existential_1(v28, v28[3]);
  sub_25DA889A4();
  sub_25DA8F0F0();
  if (v24)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  }
  else
  {
    a14 = 0;
    uint64_t v31 = OUTLINED_FUNCTION_10((uint64_t)&a14);
    uint64_t v33 = v32;
    a13 = 1;
    swift_bridgeObjectRetain();
    uint64_t v53 = OUTLINED_FUNCTION_10((uint64_t)&a13);
    uint64_t v54 = v31;
    a12 = 2;
    uint64_t v35 = v34;
    swift_bridgeObjectRetain();
    uint64_t v56 = v35;
    uint64_t v52 = OUTLINED_FUNCTION_10((uint64_t)&a12);
    a11 = 3;
    uint64_t v37 = v36;
    swift_bridgeObjectRetain();
    uint64_t v55 = v37;
    uint64_t v51 = OUTLINED_FUNCTION_10((uint64_t)&a11);
    uint64_t v39 = v38;
    swift_bridgeObjectRetain();
    char v50 = sub_25DA8EFF0();
    char v49 = sub_25DA8EFF0();
    uint64_t v47 = sub_25DA8EFD0();
    uint64_t v48 = v40;
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_25DA8EFD0();
    uint64_t v46 = v41;
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_25DA8F010();
    uint64_t v43 = OUTLINED_FUNCTION_1_0();
    v44(v43);
    *(void *)uint64_t v30 = v54;
    *(void *)(v30 + 8) = v33;
    *(void *)(v30 + 16) = v53;
    *(void *)(v30 + 24) = v56;
    *(void *)(v30 + 32) = v52;
    *(void *)(v30 + 40) = v55;
    *(void *)(v30 + 48) = v51;
    *(void *)(v30 + 56) = v39;
    *(unsigned char *)(v30 + 64) = v50 & 1;
    *(unsigned char *)(v30 + 65) = v49 & 1;
    *(void *)(v30 + 72) = v47;
    *(void *)(v30 + 80) = v48;
    *(void *)(v30 + 88) = v45;
    *(void *)(v30 + 96) = v46;
    *(void *)(v30 + 104) = v42;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_12();
}

#error "25DA8773C: call analysis failed (funcsize=6)"

void sub_25DA87748()
{
}

uint64_t NumericSettingModel.settingId.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t NumericSettingModel.graphicIcon.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t NumericSettingModel.leftIconName.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t NumericSettingModel.rightIconName.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t NumericSettingModel.label.getter()
{
  return OUTLINED_FUNCTION_5();
}

double NumericSettingModel.oldValue.getter()
{
  return *(double *)(v0 + 80);
}

double NumericSettingModel.updatedValue.getter()
{
  return *(double *)(v0 + 88);
}

double NumericSettingModel.minValue.getter()
{
  return *(double *)(v0 + 96);
}

double NumericSettingModel.maxValue.getter()
{
  return *(double *)(v0 + 104);
}

double NumericSettingModel.step.getter()
{
  return *(double *)(v0 + 112);
}

uint64_t NumericSettingModel.url.getter()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t NumericSettingModel.deviceCategoryInt.getter()
{
  return *(void *)(v0 + 136);
}

void __swiftcall NumericSettingModel.init(settingId:graphicIcon:leftIconName:rightIconName:label:oldValue:updatedValue:minValue:maxValue:step:url:deviceCategoryInt:)(SiriSettingsUI::NumericSettingModel *__return_ptr retstr, Swift::String settingId, Swift::String graphicIcon, Swift::String leftIconName, Swift::String rightIconName, Swift::String label, Swift::Double oldValue, Swift::Double updatedValue, Swift::Double minValue, Swift::Double maxValue, Swift::Double step, Swift::String_optional url, Swift::Int deviceCategoryInt)
{
  retstr->settingId = settingId;
  retstr->graphicIcon = graphicIcon;
  retstr->leftIconName = leftIconName;
  retstr->rightIconName = rightIconName;
  retstr->label = label;
  retstr->oldValue = oldValue;
  retstr->updatedValue = updatedValue;
  retstr->minValue = minValue;
  retstr->maxValue = maxValue;
  retstr->step = step;
  retstr->url = url;
  retstr->deviceCategoryInt = deviceCategoryInt;
}

uint64_t sub_25DA878D0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x49676E6974746573 && a2 == 0xE900000000000064;
  if (v3 || (sub_25DA8F0B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x4963696870617267 && a2 == 0xEB000000006E6F63;
    if (v6 || (sub_25DA8F0B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6E6F63497466656CLL && a2 == 0xEC000000656D614ELL;
      if (v7 || (sub_25DA8F0B0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6F63497468676972 && a2 == 0xED0000656D614E6ELL;
        if (v8 || (sub_25DA8F0B0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
          if (v9 || (sub_25DA8F0B0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x65756C6156646C6FLL && a2 == 0xE800000000000000;
            if (v10 || (sub_25DA8F0B0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 0x5664657461647075 && a2 == 0xEC00000065756C61;
              if (v11 || (sub_25DA8F0B0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x65756C61566E696DLL && a2 == 0xE800000000000000;
                if (v12 || (sub_25DA8F0B0() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  BOOL v13 = a1 == 0x65756C615678616DLL && a2 == 0xE800000000000000;
                  if (v13 || (sub_25DA8F0B0() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else
                  {
                    BOOL v14 = a1 == 1885697139 && a2 == 0xE400000000000000;
                    if (v14 || (sub_25DA8F0B0() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 9;
                    }
                    else
                    {
                      BOOL v15 = a1 == 7107189 && a2 == 0xE300000000000000;
                      if (v15 || (sub_25DA8F0B0() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 10;
                      }
                      else if (a1 == 0xD000000000000011 && a2 == 0x800000025DA91030)
                      {
                        swift_bridgeObjectRelease();
                        return 11;
                      }
                      else
                      {
                        char v16 = sub_25DA8F0B0();
                        swift_bridgeObjectRelease();
                        if (v16) {
                          return 11;
                        }
                        else {
                          return 12;
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
}

uint64_t sub_25DA87D58()
{
  return 12;
}

uint64_t sub_25DA87D60()
{
  return sub_25DA8F0E0();
}

uint64_t sub_25DA87DA8(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      return 0x4963696870617267;
    case 2:
      return 0x6E6F63497466656CLL;
    case 3:
      return 0x6F63497468676972;
    case 4:
      return 0x6C6562616CLL;
    case 5:
      unsigned int v3 = 1449421935;
      goto LABEL_11;
    case 6:
      return 0x5664657461647075;
    case 7:
      unsigned int v3 = 1450076525;
      goto LABEL_11;
    case 8:
      unsigned int v3 = 1450729837;
LABEL_11:
      uint64_t result = v3 | 0x65756C6100000000;
      break;
    case 9:
      uint64_t result = 1885697139;
      break;
    case 10:
      uint64_t result = 7107189;
      break;
    case 11:
      return result;
    default:
      uint64_t result = 0x49676E6974746573;
      break;
  }
  return result;
}

uint64_t sub_25DA87F24()
{
  return sub_25DA87DA8(*v0);
}

uint64_t sub_25DA87F2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25DA878D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25DA87F54@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25DA87D58();
  *a1 = result;
  return result;
}

uint64_t sub_25DA87F7C(uint64_t a1)
{
  unint64_t v2 = sub_25DA889F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DA87FB8(uint64_t a1)
{
  unint64_t v2 = sub_25DA889F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

void NumericSettingModel.encode(to:)()
{
  OUTLINED_FUNCTION_20();
  unsigned int v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A76C8);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_7();
  uint64_t v6 = v3[3];
  BOOL v7 = v3;
  uint64_t v9 = v8;
  __swift_project_boxed_opaque_existential_1(v7, v6);
  sub_25DA889F0();
  sub_25DA8F100();
  v14[5] = 0;
  sub_25DA8F060();
  if (v0)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v9);
  }
  else
  {
    v14[4] = 1;
    OUTLINED_FUNCTION_23();
    v14[3] = 2;
    OUTLINED_FUNCTION_23();
    void v14[2] = 3;
    OUTLINED_FUNCTION_23();
    v14[1] = 4;
    OUTLINED_FUNCTION_23();
    v14[0] = 5;
    OUTLINED_FUNCTION_17((uint64_t)v14);
    char v13 = 6;
    OUTLINED_FUNCTION_17((uint64_t)&v13);
    char v12 = 7;
    OUTLINED_FUNCTION_17((uint64_t)&v12);
    char v11 = 8;
    OUTLINED_FUNCTION_17((uint64_t)&v11);
    char v10 = 9;
    OUTLINED_FUNCTION_17((uint64_t)&v10);
    sub_25DA8F050();
    sub_25DA8F090();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v9);
  }
  OUTLINED_FUNCTION_22();
}

void NumericSettingModel.init(from:)()
{
  OUTLINED_FUNCTION_20();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A76D8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_8();
  uint64_t v34 = (uint64_t)v2;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25DA889F0();
  sub_25DA8F0F0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    uint64_t v5 = OUTLINED_FUNCTION_4();
    uint64_t v7 = v6;
    swift_bridgeObjectRetain();
    uint64_t v33 = v7;
    uint64_t v27 = OUTLINED_FUNCTION_4();
    uint64_t v28 = v5;
    OUTLINED_FUNCTION_9(2);
    uint64_t v32 = v5;
    uint64_t v26 = OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_9(3);
    uint64_t v31 = v5;
    uint64_t v25 = OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_9(4);
    uint64_t v30 = v5;
    uint64_t v24 = OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_9(5);
    sub_25DA8F000();
    uint64_t v29 = v5;
    uint64_t v9 = v8;
    OUTLINED_FUNCTION_3_0(6);
    uint64_t v11 = v10;
    OUTLINED_FUNCTION_3_0(7);
    uint64_t v13 = v12;
    OUTLINED_FUNCTION_3_0(8);
    uint64_t v15 = v14;
    OUTLINED_FUNCTION_3_0(9);
    uint64_t v17 = v16;
    LOBYTE(v36[0]) = 10;
    uint64_t v18 = sub_25DA8EFD0();
    uint64_t v20 = v19;
    char v37 = 11;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_25DA8F010();
    uint64_t v22 = OUTLINED_FUNCTION_6();
    v23(v22);
    v35[0] = v28;
    v35[1] = v33;
    v35[2] = v27;
    v35[3] = v32;
    v35[4] = v26;
    v35[5] = v31;
    v35[6] = v25;
    v35[7] = v30;
    v35[8] = v24;
    v35[9] = v29;
    v35[10] = v9;
    v35[11] = v11;
    v35[12] = v13;
    v35[13] = v15;
    v35[14] = v17;
    v35[15] = v18;
    v35[16] = v20;
    v35[17] = v21;
    sub_25DA88A3C((uint64_t)v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memcpy(v4, v35, 0x90uLL);
    __swift_destroy_boxed_opaque_existential_1(v34);
    v36[0] = v28;
    v36[1] = v33;
    v36[2] = v27;
    v36[3] = v32;
    v36[4] = v26;
    v36[5] = v31;
    v36[6] = v25;
    v36[7] = v30;
    v36[8] = v24;
    v36[9] = v29;
    v36[10] = v9;
    v36[11] = v11;
    v36[12] = v13;
    v36[13] = v15;
    v36[14] = v17;
    v36[15] = v18;
    v36[16] = v20;
    v36[17] = v21;
    sub_25DA88AB4((uint64_t)v36);
  }
  OUTLINED_FUNCTION_22();
}

void sub_25DA8884C()
{
}

void sub_25DA88864()
{
}

uint64_t sub_25DA8887C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_25DA888F8()
{
  unint64_t result = qword_26A6A76A0;
  if (!qword_26A6A76A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A76A0);
  }
  return result;
}

uint64_t sub_25DA88944(uint64_t result)
{
  *(unsigned char *)(result + 144) = 1;
  return result;
}

unint64_t sub_25DA88950()
{
  unint64_t result = qword_26A6A76A8;
  if (!qword_26A6A76A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A76A8);
  }
  return result;
}

uint64_t sub_25DA8899C(uint64_t result)
{
  *(unsigned char *)(result + 144) = 0;
  return result;
}

unint64_t sub_25DA889A4()
{
  unint64_t result = qword_26A6A76B8;
  if (!qword_26A6A76B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A76B8);
  }
  return result;
}

unint64_t sub_25DA889F0()
{
  unint64_t result = qword_26A6A76D0;
  if (!qword_26A6A76D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A76D0);
  }
  return result;
}

uint64_t sub_25DA88A3C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25DA88AB4(uint64_t a1)
{
  return a1;
}

unint64_t sub_25DA88B30()
{
  unint64_t result = qword_26A6A76E0;
  if (!qword_26A6A76E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A76E0);
  }
  return result;
}

unint64_t sub_25DA88B80()
{
  unint64_t result = qword_26A6A76E8;
  if (!qword_26A6A76E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A76E8);
  }
  return result;
}

unint64_t sub_25DA88BCC(uint64_t a1)
{
  unint64_t result = sub_25DA88BF4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_25DA88BF4()
{
  unint64_t result = qword_26A6A76F0;
  if (!qword_26A6A76F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A76F0);
  }
  return result;
}

unint64_t sub_25DA88C48(uint64_t a1)
{
  unint64_t result = sub_25DA88C70();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_25DA88C70()
{
  unint64_t result = qword_26A6A76F8;
  if (!qword_26A6A76F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A76F8);
  }
  return result;
}

uint64_t sub_25DA88CC4()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t destroy for SnippetModels()
{
  return sub_25DA88DB4();
}

uint64_t sub_25DA88DB4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SnippetModels(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a2[8];
  uint64_t v13 = a2[9];
  uint64_t v14 = a2[10];
  uint64_t v15 = a2[11];
  uint64_t v16 = a2[12];
  uint64_t v17 = a2[13];
  uint64_t v18 = a2[14];
  uint64_t v19 = a2[15];
  uint64_t v20 = a2[16];
  uint64_t v21 = a2[17];
  char v22 = *((unsigned char *)a2 + 144);
  sub_25DA88CC4();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(void *)(a1 + 120) = v19;
  *(void *)(a1 + 128) = v20;
  *(void *)(a1 + 136) = v21;
  *(unsigned char *)(a1 + 144) = v22;
  return a1;
}

uint64_t assignWithCopy for SnippetModels(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a2[8];
  uint64_t v13 = a2[9];
  uint64_t v14 = a2[10];
  uint64_t v15 = a2[11];
  uint64_t v16 = a2[12];
  uint64_t v17 = a2[13];
  uint64_t v18 = a2[14];
  uint64_t v19 = a2[15];
  uint64_t v20 = a2[16];
  uint64_t v21 = a2[17];
  char v22 = *((unsigned char *)a2 + 144);
  sub_25DA88CC4();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(void *)(a1 + 120) = v19;
  *(void *)(a1 + 128) = v20;
  *(void *)(a1 + 136) = v21;
  *(unsigned char *)(a1 + 144) = v22;
  sub_25DA88DB4();
  return a1;
}

void *__swift_memcpy145_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x91uLL);
}

uint64_t assignWithTake for SnippetModels(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 144);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  long long v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  long long v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 144) = v3;
  sub_25DA88DB4();
  return a1;
}

uint64_t getEnumTagSinglePayload for SnippetModels(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 145))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 144);
      if (v3 <= 1) {
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

uint64_t storeEnumTagSinglePayload for SnippetModels(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 144) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 145) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 145) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 144) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25DA89214(uint64_t result, char a2)
{
  *(unsigned char *)(result + 144) = a2 & 1;
  return result;
}

void type metadata accessor for SnippetModels()
{
}

uint64_t sub_25DA8922C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25DA89240(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25DA89254(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_25DA89268(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t destroy for BinarySettingModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BinarySettingModel(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BinarySettingModel(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for BinarySettingModel(uint64_t a1, uint64_t a2)
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
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for BinarySettingModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BinarySettingModel(uint64_t result, int a2, int a3)
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

void type metadata accessor for BinarySettingModel()
{
}

uint64_t destroy for NumericSettingModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NumericSettingModel(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  long long v8 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v8;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  uint64_t v9 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NumericSettingModel(void *a1, void *a2)
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
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  a1[16] = a2[16];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[17] = a2[17];
  return a1;
}

uint64_t assignWithTake for NumericSettingModel(uint64_t a1, uint64_t a2)
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
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  long long v9 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v9;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  uint64_t v10 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  return a1;
}

void type metadata accessor for NumericSettingModel()
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NumericSettingModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF5)
  {
    if (a2 + 11 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 11) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 12;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v5 = v6 - 12;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for NumericSettingModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x25DA89A04);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NumericSettingModel.CodingKeys()
{
  return &type metadata for NumericSettingModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for BinarySettingModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for BinarySettingModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x25DA89B90);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_25DA89BB8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25DA89BC0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BinarySettingModel.CodingKeys()
{
  return &type metadata for BinarySettingModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SnippetModels.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SnippetModels.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25DA89D2CLL);
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

unsigned char *sub_25DA89D54(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SnippetModels.CodingKeys()
{
  return &type metadata for SnippetModels.CodingKeys;
}

uint64_t sub_25DA89D7C()
{
  return 0;
}

ValueMetadata *type metadata accessor for SnippetModels.BinarySettingCodingKeys()
{
  return &type metadata for SnippetModels.BinarySettingCodingKeys;
}

uint64_t _s14SiriSettingsUI13SnippetModelsO23BinarySettingCodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s14SiriSettingsUI13SnippetModelsO23BinarySettingCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25DA89E80);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SnippetModels.NumericSettingCodingKeys()
{
  return &type metadata for SnippetModels.NumericSettingCodingKeys;
}

unint64_t sub_25DA89EBC()
{
  unint64_t result = qword_26A6A7700;
  if (!qword_26A6A7700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7700);
  }
  return result;
}

unint64_t sub_25DA89F0C()
{
  unint64_t result = qword_26A6A7708;
  if (!qword_26A6A7708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7708);
  }
  return result;
}

unint64_t sub_25DA89F5C()
{
  unint64_t result = qword_26A6A7710;
  if (!qword_26A6A7710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7710);
  }
  return result;
}

unint64_t sub_25DA89FAC()
{
  unint64_t result = qword_26A6A7718;
  if (!qword_26A6A7718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7718);
  }
  return result;
}

unint64_t sub_25DA89FFC()
{
  unint64_t result = qword_26A6A7720;
  if (!qword_26A6A7720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7720);
  }
  return result;
}

unint64_t sub_25DA8A04C()
{
  unint64_t result = qword_26A6A7728;
  if (!qword_26A6A7728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7728);
  }
  return result;
}

unint64_t sub_25DA8A09C()
{
  unint64_t result = qword_26A6A7730;
  if (!qword_26A6A7730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7730);
  }
  return result;
}

unint64_t sub_25DA8A0EC()
{
  unint64_t result = qword_26A6A7738;
  if (!qword_26A6A7738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7738);
  }
  return result;
}

unint64_t sub_25DA8A13C()
{
  unint64_t result = qword_26A6A7740;
  if (!qword_26A6A7740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7740);
  }
  return result;
}

unint64_t sub_25DA8A18C()
{
  unint64_t result = qword_26A6A7748;
  if (!qword_26A6A7748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7748);
  }
  return result;
}

unint64_t sub_25DA8A1DC()
{
  unint64_t result = qword_26A6A7750;
  if (!qword_26A6A7750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7750);
  }
  return result;
}

unint64_t sub_25DA8A22C()
{
  unint64_t result = qword_26A6A7758;
  if (!qword_26A6A7758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7758);
  }
  return result;
}

unint64_t sub_25DA8A27C()
{
  unint64_t result = qword_26A6A7760;
  if (!qword_26A6A7760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7760);
  }
  return result;
}

unint64_t sub_25DA8A2CC()
{
  unint64_t result = qword_26A6A7768;
  if (!qword_26A6A7768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7768);
  }
  return result;
}

unint64_t sub_25DA8A31C()
{
  unint64_t result = qword_26A6A7770;
  if (!qword_26A6A7770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7770);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_0@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 + 240) = a1;
  return sub_25DA8F000();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return MEMORY[0x270F9F2E8](v0 + 240, v1);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 + 240) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1)
{
  return MEMORY[0x270F9F2E8](a1, v1);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17(uint64_t a1)
{
  return MEMORY[0x270F9F438](a1, v1);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_25DA8F060();
}

uint64_t NumericSettingView.body.getter()
{
  uint64_t v42 = sub_25DA8EE10();
  OUTLINED_FUNCTION_0();
  uint64_t v41 = v1;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4_0();
  uint64_t v40 = v3;
  uint64_t v39 = sub_25DA8EEE0();
  OUTLINED_FUNCTION_0();
  uint64_t v38 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7778);
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7780);
  uint64_t v17 = v16 - 8;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1();
  uint64_t v20 = v19 - v18;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7788);
  OUTLINED_FUNCTION_2_1();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_1();
  uint64_t v24 = v23 - v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7790);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_4_0();
  memcpy(__dst, v0, 0xC0uLL);
  uint64_t v26 = swift_allocObject();
  memcpy((void *)(v26 + 16), v0, 0xC0uLL);
  sub_25DA8BCA8((uint64_t)__dst);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7798);
  sub_25DA8DB5C(&qword_26A6A77A0, &qword_26A6A7798);
  sub_25DA8EDC0();
  sub_25DA8ED90();
  uint64_t v27 = sub_25DA8ED80();
  swift_release();
  __dst[12] = __dst[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A77A8);
  sub_25DA8ED20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v20, v15, v9);
  uint64_t v28 = (uint64_t *)(v20 + *(int *)(v17 + 44));
  uint64_t *v28 = v27;
  v28[1] = v43;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
  uint64_t v29 = swift_allocObject();
  memcpy((void *)(v29 + 16), __dst, 0xC0uLL);
  sub_25DA8BCA8((uint64_t)__dst);
  sub_25DA8EED0();
  uint64_t v30 = (char *)(v24 + *(int *)(v37 + 36));
  uint64_t v31 = sub_25DA8EBF0();
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(&v30[*(int *)(v31 + 20)], v8, v39);
  *(void *)uint64_t v30 = &unk_26A6A77B8;
  *((void *)v30 + 1) = v29;
  sub_25DA8DD14(v20, v24, &qword_26A6A7780);
  OUTLINED_FUNCTION_3_1();
  v32();
  sub_25DA8DD70(v20, &qword_26A6A7780);
  (*(void (**)(uint64_t, void, uint64_t))(v41 + 104))(v40, *MEMORY[0x263F778F0], v42);
  sub_25DA8C2A0();
  sub_25DA8ECB0();
  OUTLINED_FUNCTION_3_1();
  v33();
  sub_25DA8DD70(v24, &qword_26A6A7788);
  sub_25DA8ED20();
  uint64_t v34 = swift_allocObject();
  memcpy((void *)(v34 + 16), __dst, 0xC0uLL);
  sub_25DA8BCA8((uint64_t)__dst);
  swift_getOpaqueTypeConformance2();
  sub_25DA8ECF0();
  swift_release();
  OUTLINED_FUNCTION_3_1();
  return v35();
}

uint64_t sub_25DA8AB5C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v124 = a2;
  uint64_t v119 = sub_25DA8EC00();
  ((void (*)(void))MEMORY[0x270FA5388])();
  v123 = (char *)v98 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_25DA8ED70();
  uint64_t v121 = *(void *)(v122 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v120 = (char *)v98 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DA8EBA0();
  ((void (*)(void))MEMORY[0x270FA5388])();
  v104 = (char *)v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7800);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v105 = (char *)v98 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7808);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v110 = (char *)v98 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v138 = (char *)v98 - v9;
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7810);
  uint64_t v112 = *(void *)(v113 - 8);
  MEMORY[0x270FA5388](v113);
  v109 = (char *)v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7818);
  MEMORY[0x270FA5388](v106);
  v115 = (char *)v98 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7820);
  MEMORY[0x270FA5388](v111);
  v116 = (char *)v98 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7828);
  uint64_t v13 = MEMORY[0x270FA5388](v114);
  uint64_t v118 = (uint64_t)v98 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v117 = (uint64_t)v98 - v15;
  uint64_t v16 = sub_25DA8EB70();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v98 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_25DA8EDA0();
  uint64_t v139 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)v98 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A75F8);
  uint64_t v127 = *(void *)(v126 - 8);
  MEMORY[0x270FA5388](v126);
  uint64_t v24 = (char *)v98 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = sub_25DA8EDE0();
  uint64_t v130 = *(void *)(v131 - 8);
  MEMORY[0x270FA5388](v131);
  v129 = (char *)v98 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7830);
  MEMORY[0x270FA5388](v132);
  v128 = (char *)v98 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7838);
  uint64_t v140 = *(void *)(v143 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v143);
  v142 = (char *)v98 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  v141 = (char *)v98 - v29;
  type metadata accessor for SettingViewUtils();
  swift_initStackObject();
  v98[1] = *(void *)(a1 + 32);
  v98[0] = *(void *)(a1 + 40);
  v98[3] = *(void *)(a1 + 48);
  v98[2] = *(void *)(a1 + 56);
  uint64_t v30 = *(void *)(a1 + 72);
  uint64_t v125 = *(void *)(a1 + 64);
  double v31 = *(double *)(a1 + 96);
  double v32 = *(double *)(a1 + 104);
  sub_25DA8DE38();
  uint64_t v33 = *MEMORY[0x263F76618];
  uint64_t v34 = *(void (**)(char *))(v17 + 104);
  uint64_t v137 = v17 + 104;
  v136 = v34;
  ((void (*)(char *, uint64_t, uint64_t))v34)(v19, v33, v16);
  uint64_t v35 = sub_25DA8DDC0(&qword_26A6A7610, MEMORY[0x263F77558]);
  sub_25DA8EC90();
  uint64_t v36 = *(void (**)(char *, uint64_t))(v17 + 8);
  v101 = v19;
  uint64_t v103 = v16;
  uint64_t v102 = v17 + 8;
  v135 = v36;
  v36(v19, v16);
  uint64_t v37 = *(void (**)(char *, uint64_t))(v139 + 8);
  v99 = v22;
  uint64_t v134 = v139 + 8;
  v133 = v37;
  v37(v22, v20);
  uint64_t v100 = v20;
  uint64_t v149 = v20;
  uint64_t v150 = v35;
  swift_getOpaqueTypeConformance2();
  uint64_t v38 = v126;
  uint64_t v39 = sub_25DA8EC80();
  (*(void (**)(char *, uint64_t))(v127 + 8))(v24, v38);
  uint64_t v151 = MEMORY[0x263F1B720];
  uint64_t v152 = MEMORY[0x263F774B0];
  uint64_t v149 = v39;
  *(void *)&long long v146 = v125;
  *((void *)&v146 + 1) = v30;
  sub_25DA8D88C();
  swift_bridgeObjectRetain();
  uint64_t v40 = sub_25DA8EC70();
  uint64_t v42 = v41;
  LOBYTE(v30) = v43 & 1;
  sub_25DA8EC50();
  uint64_t v44 = sub_25DA8EC60();
  uint64_t v46 = v45;
  LOBYTE(v17) = v47;
  uint64_t v49 = v48;
  swift_release();
  sub_25DA8D8D8(v40, v42, v30);
  swift_bridgeObjectRelease();
  uint64_t v147 = MEMORY[0x263F1A830];
  uint64_t v148 = MEMORY[0x263F77348];
  uint64_t v50 = swift_allocObject();
  *(void *)&long long v146 = v50;
  *(void *)(v50 + 16) = v44;
  *(void *)(v50 + 24) = v46;
  *(unsigned char *)(v50 + 32) = v17 & 1;
  *(void *)(v50 + 40) = v49;
  uint64_t v51 = v129;
  sub_25DA8EDD0();
  uint64_t v52 = v130;
  uint64_t v53 = (uint64_t)v128;
  uint64_t v54 = v131;
  (*(void (**)(char *, char *, uint64_t))(v130 + 16))(v128, v51, v131);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v54);
  uint64_t v55 = swift_allocObject();
  memcpy((void *)(v55 + 16), (const void *)a1, 0xC0uLL);
  sub_25DA8BCA8(a1);
  sub_25DA8D938();
  uint64_t v56 = v142;
  sub_25DA8ECA0();
  swift_release();
  sub_25DA8DD70(v53, &qword_26A6A7830);
  (*(void (**)(char *, char *, uint64_t))(v140 + 32))(v141, v56, v143);
  long long v146 = *(_OWORD *)(a1 + 160);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A77A8);
  uint64_t result = sub_25DA8ED40();
  if (v31 > v32)
  {
    __break(1u);
  }
  else
  {
    *(double *)&long long v146 = v31;
    *((double *)&v146 + 1) = v32;
    uint64_t v132 = swift_allocObject();
    memcpy((void *)(v132 + 16), (const void *)a1, 0xC0uLL);
    sub_25DA8BCA8(a1);
    sub_25DA8EB80();
    v58 = v99;
    sub_25DA8EDB0();
    uint64_t v59 = sub_25DA8ED00();
    uint64_t v139 = *(void *)(v139 + 16);
    uint64_t v60 = (uint64_t)v105;
    uint64_t v61 = v100;
    ((void (*)(char *, char *, uint64_t))v139)(v105, v58, v100);
    uint64_t v62 = v107;
    *(void *)(v60 + *(int *)(v107 + 36)) = v59;
    v133(v58, v61);
    LODWORD(v131) = *MEMORY[0x263F76568];
    v63 = v101;
    uint64_t v64 = v103;
    v136(v101);
    unint64_t v65 = sub_25DA8DA8C();
    sub_25DA8EC90();
    v135(v63, v64);
    sub_25DA8DD70(v60, &qword_26A6A7800);
    sub_25DA8EB80();
    sub_25DA8EDB0();
    uint64_t v66 = sub_25DA8ED00();
    ((void (*)(uint64_t, char *, uint64_t))v139)(v60, v58, v61);
    *(void *)(v60 + *(int *)(v62 + 36)) = v66;
    v133(v58, v61);
    ((void (*)(char *, void, uint64_t))v136)(v63, v131, v64);
    sub_25DA8EC90();
    v135(v63, v64);
    sub_25DA8DD70(v60, &qword_26A6A7800);
    uint64_t v144 = v62;
    unint64_t v145 = v65;
    swift_getOpaqueTypeConformance2();
    sub_25DA8DBA0();
    v67 = v109;
    sub_25DA8ED50();
    LOBYTE(v63) = sub_25DA8EC40();
    uint64_t v68 = v112;
    uint64_t v69 = (uint64_t)v115;
    uint64_t v70 = v113;
    (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v115, v67, v113);
    uint64_t v71 = v69 + *(int *)(v106 + 36);
    *(unsigned char *)uint64_t v71 = (_BYTE)v63;
    *(_OWORD *)(v71 + 8) = 0u;
    *(_OWORD *)(v71 + 24) = 0u;
    *(unsigned char *)(v71 + 40) = 1;
    (*(void (**)(char *, uint64_t))(v68 + 8))(v67, v70);
    v72 = v120;
    sub_25DA8ED60();
    v73 = v123;
    v74 = &v123[*(int *)(v119 + 20)];
    uint64_t v75 = *MEMORY[0x263F19860];
    uint64_t v76 = sub_25DA8EC30();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v76 - 8) + 104))(v74, v75, v76);
    __asm { FMOV            V0.2D, #10.0 }
    _OWORD *v73 = _Q0;
    uint64_t v82 = (uint64_t)v116;
    v83 = &v116[*(int *)(v111 + 36)];
    uint64_t v84 = v121;
    uint64_t v85 = v122;
    (*(void (**)(char *, char *, uint64_t))(v121 + 16))(v83, v72, v122);
    uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7888);
    sub_25DA8DBEC((uint64_t)v73, (uint64_t)&v83[*(int *)(v86 + 52)]);
    *(_WORD *)&v83[*(int *)(v86 + 56)] = 256;
    sub_25DA8DD14(v69, v82, &qword_26A6A7818);
    sub_25DA8DC50((uint64_t)v73);
    (*(void (**)(char *, uint64_t))(v84 + 8))(v72, v85);
    sub_25DA8DD70(v69, &qword_26A6A7818);
    LOBYTE(v83) = sub_25DA8EC40();
    uint64_t v87 = v118;
    sub_25DA8DD14(v82, v118, &qword_26A6A7820);
    uint64_t v88 = v87 + *(int *)(v114 + 36);
    *(unsigned char *)uint64_t v88 = (_BYTE)v83;
    *(_OWORD *)(v88 + 8) = 0u;
    *(_OWORD *)(v88 + 24) = 0u;
    *(unsigned char *)(v88 + 40) = 1;
    sub_25DA8DD70(v82, &qword_26A6A7820);
    uint64_t v89 = v117;
    sub_25DA8DCAC(v87, v117);
    uint64_t v90 = v140;
    v91 = *(void (**)(char *, char *, uint64_t))(v140 + 16);
    v93 = v141;
    v92 = v142;
    uint64_t v94 = v143;
    v91(v142, v141, v143);
    sub_25DA8DD14(v89, v87, &qword_26A6A7828);
    v95 = v124;
    v91(v124, v92, v94);
    uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7890);
    sub_25DA8DD14(v87, (uint64_t)&v95[*(int *)(v96 + 48)], &qword_26A6A7828);
    sub_25DA8DD70(v89, &qword_26A6A7828);
    v97 = *(void (**)(char *, uint64_t))(v90 + 8);
    v97(v93, v94);
    sub_25DA8DD70(v87, &qword_26A6A7828);
    return ((uint64_t (*)(char *, uint64_t))v97)(v92, v94);
  }
  return result;
}

uint64_t sub_25DA8BCA0@<X0>(char *a1@<X8>)
{
  return sub_25DA8AB5C(v1 + 16, a1);
}

uint64_t sub_25DA8BCA8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 144);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v2;
  swift_retain();
  return a1;
}

uint64_t sub_25DA8BD50(uint64_t a1)
{
  uint64_t v2 = sub_25DA8EB60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 128))
  {
    uint64_t v6 = qword_26A6A75F0;
    swift_bridgeObjectRetain();
    if (v6 != -1) {
      swift_once();
    }
    sub_25DA8EEF0();
    sub_25DA8EBE0();
    uint64_t v7 = *(void **)(a1 + 144);
    if (!v7)
    {
      sub_25DA8BCA8(a1);
      sub_25DA8EE40();
      sub_25DA8DDC0((unint64_t *)&qword_26A6A7628, MEMORY[0x263F77980]);
      uint64_t result = sub_25DA8EC10();
      __break(1u);
      return result;
    }
    id v8 = v7;
    sub_25DA8EB50();
    sub_25DA8EE20();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  if (qword_26A6A75F0 != -1) {
    swift_once();
  }
  sub_25DA8EEF0();
  return sub_25DA8EBE0();
}

uint64_t sub_25DA8BFA0()
{
  return sub_25DA8ED30();
}

uint64_t sub_25DA8BFEC(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  sub_25DA8EEC0();
  *(void *)(v1 + 48) = sub_25DA8EEB0();
  uint64_t v3 = sub_25DA8EEA0();
  return MEMORY[0x270FA2498](sub_25DA8C084, v3, v2);
}

uint64_t sub_25DA8C084()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  uint64_t v2 = *(void *)(v1 + 88);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v1 + 160);
  *(void *)(v0 + 32) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A77A8);
  sub_25DA8ED30();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_25DA8C118()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_25DA8C1AC;
  return sub_25DA8BFEC(v0 + 16);
}

uint64_t sub_25DA8C1AC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_25DA8C2A0()
{
  unint64_t result = qword_26A6A77C0;
  if (!qword_26A6A77C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6A7788);
    sub_25DA8C34C();
    sub_25DA8DDC0(&qword_26A6A77E8, MEMORY[0x263F189F8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A77C0);
  }
  return result;
}

unint64_t sub_25DA8C34C()
{
  unint64_t result = qword_26A6A77C8;
  if (!qword_26A6A77C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6A7780);
    sub_25DA8DB5C(&qword_26A6A77D0, &qword_26A6A7778);
    sub_25DA8DB5C(&qword_26A6A77D8, &qword_26A6A77E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A77C8);
  }
  return result;
}

void sub_25DA8C410(uint64_t a1, double *a2)
{
  double v2 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7608);
  sub_25DA8ED20();
  if (v3 == 1) {
    sub_25DA8C4A4(v2);
  }
}

void sub_25DA8C480(uint64_t a1, double *a2)
{
}

uint64_t sub_25DA8C488()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_25DA8C4A4(double a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[17];
  id v6 = objc_allocWithZone(MEMORY[0x263F0FF48]);
  id v7 = sub_25DA8CF08(0, 0, 0, 0, v5);
  id v8 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a1);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FCA0]), sel_initWithValue_unit_, v8, 1);
  id v10 = objc_allocWithZone(MEMORY[0x263F0FF50]);
  id v11 = v7;
  id v12 = v9;
  swift_bridgeObjectRetain();
  id v13 = sub_25DA8CFB0(v3, v4, v7, 0);
  sub_25DA8D028();
  id v14 = sub_25DA8C95C(v13, v9, 0, 0, 0);
  os_log_type_t v15 = sub_25DA8EEF0();
  if (qword_26A6A75F0 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_26A6A8CD0;
  if (os_log_type_enabled((os_log_t)qword_26A6A8CD0, v15))
  {
    id v17 = v14;
    id v29 = v8;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v30 = v27;
    *(_DWORD *)uint64_t v18 = 136315138;
    id v19 = v17;
    id v20 = v11;
    id v21 = objc_msgSend(v19, sel_description);
    uint64_t v22 = sub_25DA8EE70();
    id v28 = v12;
    unint64_t v24 = v23;

    id v11 = v20;
    uint64_t v25 = v22;
    id v8 = v29;
    sub_25DA8D074(v25, v24, &v30);
    sub_25DA8EF20();

    id v12 = v28;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DA82000, v16, v15, "NumericSettingView handleNumericIntent | handling SetNumericIntentHandler for intent: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611BC260](v27, -1, -1);
    MEMORY[0x2611BC260](v18, -1, -1);
  }
  sub_25DA8EBD0();
  uint64_t v26 = (void *)sub_25DA8EBC0();
  sub_25DA8EBB0();
}

uint64_t sub_25DA8C7AC(void *a1)
{
  uint64_t result = (uint64_t)objc_msgSend(a1, sel_code);
  if (result != 3)
  {
    os_log_type_t v3 = sub_25DA8EF00();
    if (qword_26A6A75F0 != -1) {
      swift_once();
    }
    uint64_t v4 = qword_26A6A8CD0;
    uint64_t result = os_log_type_enabled((os_log_t)qword_26A6A8CD0, v3);
    if (result)
    {
      id v5 = a1;
      id v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v10 = v7;
      *(_DWORD *)id v6 = 136315138;
      objc_msgSend(v5, sel_code);
      type metadata accessor for INSetNumericSettingIntentResponseCode();
      uint64_t v8 = sub_25DA8EE80();
      sub_25DA8D074(v8, v9, &v10);
      sub_25DA8EF20();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25DA82000, v4, v3, "NumericSettingView handleNumericIntent | handle failed, response code %s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611BC260](v7, -1, -1);
      return MEMORY[0x2611BC260](v6, -1, -1);
    }
  }
  return result;
}

id sub_25DA8C95C(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithSettingMetadata_numericValue_boundedValue_action_temporalEventTrigger_, a1, a2, a3, a4, a5);

  return v8;
}

uint64_t destroy for NumericSettingView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for NumericSettingView(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  long long v8 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v8;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  uint64_t v9 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v9;
  uint64_t v10 = *(void **)(a2 + 144);
  *(void *)(a1 + 144) = v10;
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v11 = v10;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for NumericSettingView(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  uint64_t v4 = *(void **)(a1 + 144);
  uint64_t v5 = *(void **)(a2 + 144);
  *(void *)(a1 + 144) = v5;
  id v6 = v5;

  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy192_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC0uLL);
}

uint64_t assignWithTake for NumericSettingView(uint64_t a1, uint64_t a2)
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
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  long long v9 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v9;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  uint64_t v10 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v10;
  swift_bridgeObjectRelease();
  id v11 = *(void **)(a1 + 144);
  uint64_t v12 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v12;

  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_release();
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for NumericSettingView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 192))
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

uint64_t storeEnumTagSinglePayload for NumericSettingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 184) = 0;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 192) = 1;
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
    *(unsigned char *)(result + 192) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NumericSettingView()
{
  return &type metadata for NumericSettingView;
}

uint64_t sub_25DA8CE64()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_25DA8CF08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    long long v9 = 0;
    goto LABEL_6;
  }
  uint64_t v8 = (void *)sub_25DA8EE60();
  swift_bridgeObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  long long v9 = (void *)sub_25DA8EE60();
  swift_bridgeObjectRelease();
LABEL_6:
  id v10 = objc_msgSend(v5, sel_initWithDeviceName_deviceModel_deviceCategory_, v8, v9, a5);

  return v10;
}

id sub_25DA8CFB0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = (void *)sub_25DA8EE60();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v4, sel_initWithSettingId_targetDevice_targetApp_, v7, a3, a4);

  return v8;
}

unint64_t sub_25DA8D028()
{
  unint64_t result = qword_26A6A77F0;
  if (!qword_26A6A77F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A6A77F0);
  }
  return result;
}

BOOL sub_25DA8D068(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_25DA8D074(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25DA8D148(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25DA8D82C((uint64_t)v12, *a3);
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
      sub_25DA8D82C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25DA8D148(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25DA8D2A0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25DA8EF30();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25DA8D378(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25DA8EF80();
    if (!v8)
    {
      uint64_t result = sub_25DA8EF90();
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

void *sub_25DA8D2A0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25DA8EFA0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25DA8D378(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25DA8D410(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25DA8D5EC(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25DA8D5EC((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25DA8D410(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25DA8EE90();
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
  unint64_t v3 = sub_25DA8D584(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25DA8EF50();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25DA8EFA0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25DA8EF90();
  __break(1u);
  return result;
}

void *sub_25DA8D584(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A77F8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25DA8D5EC(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A77F8);
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
  id v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25DA8D79C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25DA8D6C4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25DA8D6C4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25DA8EFA0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25DA8D79C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25DA8EFA0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_25DA8D82C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_25DA8D88C()
{
  unint64_t result = qword_26A6A7840;
  if (!qword_26A6A7840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7840);
  }
  return result;
}

uint64_t sub_25DA8D8D8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25DA8D8E8()
{
  sub_25DA8D8D8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25DA8D930()
{
  return sub_25DA8BD50(v0 + 16);
}

unint64_t sub_25DA8D938()
{
  unint64_t result = qword_26A6A7848;
  if (!qword_26A6A7848)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6A7830);
    sub_25DA8DDC0(&qword_26A6A7850, MEMORY[0x263F776B8]);
    sub_25DA8DB5C(&qword_26A6A7858, &qword_26A6A7860);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7848);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 208, 7);
}

uint64_t sub_25DA8DA84()
{
  return sub_25DA8BFA0();
}

unint64_t sub_25DA8DA8C()
{
  unint64_t result = qword_26A6A7868;
  if (!qword_26A6A7868)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6A7800);
    sub_25DA8DDC0(&qword_26A6A7610, MEMORY[0x263F77558]);
    sub_25DA8DB5C(&qword_26A6A7870, &qword_26A6A7878);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7868);
  }
  return result;
}

uint64_t sub_25DA8DB5C(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_25DA8DBA0()
{
  unint64_t result = qword_26A6A7880;
  if (!qword_26A6A7880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7880);
  }
  return result;
}

uint64_t sub_25DA8DBEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DA8EC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DA8DC50(uint64_t a1)
{
  uint64_t v2 = sub_25DA8EC00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DA8DCAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6A7828);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DA8DD14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25DA8DD70(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1();
  v3();
  return a1;
}

uint64_t sub_25DA8DDC0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_25DA8DE38()
{
  sub_25DA8EBA0();
  MEMORY[0x270FA5388]();
  if (qword_26A6A75E0 != -1) {
    swift_once();
  }
  sub_25DA8EEF0();
  OUTLINED_FUNCTION_0_0();
  sub_25DA8E1DC();
  swift_bridgeObjectRetain();
  id v0 = sub_25DA8E114();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B558]), sel_initWithSize_scale_, 60.0, 60.0, 3.0);
  objc_msgSend(v1, sel_setGraphicVariant_, 1);
  sub_25DA8EEF0();
  OUTLINED_FUNCTION_0_0();
  id v2 = objc_msgSend(v0, sel_imageForDescriptor_, v1);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_placeholder);
    id v4 = objc_msgSend(v0, sel_prepareImageForDescriptor_, v1);
  }
  else
  {
    id v4 = 0;
  }
  sub_25DA8EEF0();
  sub_25DA8EBE0();
  if (!v4)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  id v5 = objc_msgSend(v4, sel_CGImage);
  if (v5)
  {
    unint64_t v6 = v5;
    int64_t v7 = (UIImage *)objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_, v5);
    int64_t v8 = UIImagePNGRepresentation(v7);

    if (v8)
    {
      uint64_t v9 = sub_25DA8EB30();
      unint64_t v11 = v10;

      if (v11 >> 60 != 15)
      {
        sub_25DA8E21C(v9, v11);
        sub_25DA8EB90();
        sub_25DA8E274(v9, v11);
        sub_25DA8EDB0();

        sub_25DA8E274(v9, v11);
        return;
      }
    }
    __break(1u);
    goto LABEL_12;
  }
LABEL_13:
  __break(1u);
}

id sub_25DA8E114()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v1 = (void *)sub_25DA8EE60();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithType_, v1);

  return v2;
}

uint64_t SettingViewUtils.deinit()
{
  return v0;
}

uint64_t SettingViewUtils.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for SettingViewUtils()
{
  return self;
}

uint64_t method lookup function for SettingViewUtils(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SettingViewUtils);
}

unint64_t sub_25DA8E1DC()
{
  unint64_t result = qword_26A6A7898;
  if (!qword_26A6A7898)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A6A7898);
  }
  return result;
}

uint64_t sub_25DA8E21C(uint64_t a1, unint64_t a2)
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

uint64_t sub_25DA8E274(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25DA8E288(a1, a2);
  }
  return a1;
}

uint64_t sub_25DA8E288(uint64_t a1, unint64_t a2)
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

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_25DA8EBE0();
}

uint64_t SiriSettingsUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SiriSettingsUIPlugin.init()()
{
  return v0;
}

uint64_t SiriSettingsUIPlugin.snippet(for:mode:idiom:)(void *a1)
{
  sub_25DA86098(a1, v32);
  sub_25DA86098(v32, v33);
  if (sub_25DA8613C((uint64_t)v33) == 1)
  {
    id v1 = (void *)nullsub_1(v33);
    sub_25DA86098(v32, v30);
    uint64_t v2 = nullsub_1(v30);
    sub_25DA88A3C(v2);
    if (qword_26A6A75E0 != -1) {
      swift_once();
    }
    sub_25DA8EEF0();
    sub_25DA8EBE0();
    sub_25DA8EE40();
    sub_25DA8E6F0();
    uint64_t v3 = sub_25DA8EC20();
    uint64_t v5 = v4;
    LOBYTE(__src[0]) = 0;
    sub_25DA8ED10();
    char v6 = __dst[0];
    uint64_t v7 = __dst[1];
    uint64_t v8 = v1[10];
    memcpy(__dst, v1, 0x90uLL);
    __dst[18] = v3;
    __dst[19] = v5;
    __dst[20] = v8;
    __dst[21] = 0;
    LOBYTE(__dst[22]) = v6;
    __dst[23] = v7;
    memcpy(__src, __dst, sizeof(__src));
    sub_25DA8E740();
    uint64_t v9 = sub_25DA8EC80();
    sub_25DA8E78C((uint64_t)__dst);
  }
  else
  {
    uint64_t v10 = nullsub_1(v33);
    uint64_t v11 = *(void *)v10;
    uint64_t v12 = *(void *)(v10 + 8);
    uint64_t v13 = *(void *)(v10 + 16);
    uint64_t v27 = *(void *)(v10 + 32);
    uint64_t v28 = *(void *)(v10 + 24);
    uint64_t v25 = *(void *)(v10 + 48);
    uint64_t v26 = *(void *)(v10 + 40);
    uint64_t v24 = *(void *)(v10 + 56);
    char v23 = *(unsigned char *)(v10 + 64);
    char v14 = *(unsigned char *)(v10 + 65);
    uint64_t v21 = *(void *)(v10 + 80);
    uint64_t v22 = *(void *)(v10 + 72);
    uint64_t v19 = *(void *)(v10 + 96);
    uint64_t v20 = *(void *)(v10 + 88);
    uint64_t v18 = *(void *)(v10 + 104);
    sub_25DA86098(v32, __dst);
    nullsub_1(__dst);
    uint64_t v15 = qword_26A6A75E0;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v15 != -1) {
      swift_once();
    }
    sub_25DA8EEF0();
    sub_25DA8EBE0();
    sub_25DA8EE40();
    sub_25DA8E6F0();
    __src[0] = v11;
    __src[1] = v12;
    void __src[2] = v13;
    __src[3] = v28;
    __src[4] = v27;
    __src[5] = v26;
    __src[6] = v25;
    __src[7] = v24;
    LOBYTE(__src[8]) = v23;
    BYTE1(__src[8]) = v14;
    __src[9] = v22;
    __src[10] = v21;
    __src[11] = v20;
    __src[12] = v19;
    __src[13] = v18;
    __src[14] = sub_25DA8EC20();
    __src[15] = v16;
    LOBYTE(__src[16]) = v14;
    __src[17] = 0;
    memcpy(v30, __src, 0x90uLL);
    sub_25DA8E834();
    uint64_t v9 = sub_25DA8EC80();
    sub_25DA8E880((uint64_t)__src);
  }
  return v9;
}

uint64_t SiriSettingsUIPlugin.deinit()
{
  return v0;
}

uint64_t SiriSettingsUIPlugin.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_25DA8E6B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriSettingsUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t sub_25DA8E6D8(void *a1)
{
  return SiriSettingsUIPlugin.snippet(for:mode:idiom:)(a1);
}

unint64_t sub_25DA8E6F0()
{
  unint64_t result = qword_26A6A7628;
  if (!qword_26A6A7628)
  {
    sub_25DA8EE40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A7628);
  }
  return result;
}

unint64_t sub_25DA8E740()
{
  unint64_t result = qword_26A6A78A0;
  if (!qword_26A6A78A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A78A0);
  }
  return result;
}

uint64_t sub_25DA8E78C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 144);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return a1;
}

unint64_t sub_25DA8E834()
{
  unint64_t result = qword_26A6A78A8;
  if (!qword_26A6A78A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A78A8);
  }
  return result;
}

uint64_t sub_25DA8E880(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 112);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return a1;
}

unint64_t sub_25DA8E918()
{
  unint64_t result = qword_26A6A78B0;
  if (!qword_26A6A78B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6A78B0);
  }
  return result;
}

uint64_t type metadata accessor for SiriSettingsUIPlugin()
{
  return self;
}

uint64_t method lookup function for SiriSettingsUIPlugin(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriSettingsUIPlugin);
}

uint64_t dispatch thunk of SiriSettingsUIPlugin.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_25DA8E9B4()
{
  sub_25DA8EA1C();
  uint64_t result = sub_25DA8EF10();
  qword_26A6A8CC0 = result;
  return result;
}

unint64_t sub_25DA8EA1C()
{
  unint64_t result = qword_26A6A78B8;
  if (!qword_26A6A78B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A6A78B8);
  }
  return result;
}

uint64_t sub_25DA8EA5C()
{
  sub_25DA8EA1C();
  uint64_t result = sub_25DA8EF10();
  qword_26A6A8CC8 = result;
  return result;
}

uint64_t sub_25DA8EAC4()
{
  sub_25DA8EA1C();
  uint64_t result = sub_25DA8EF10();
  qword_26A6A8CD0 = result;
  return result;
}

uint64_t sub_25DA8EB30()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25DA8EB40()
{
  return MEMORY[0x270F739D8]();
}

uint64_t sub_25DA8EB50()
{
  return MEMORY[0x270F73A60]();
}

uint64_t sub_25DA8EB60()
{
  return MEMORY[0x270F73A80]();
}

uint64_t sub_25DA8EB70()
{
  return MEMORY[0x270F73C68]();
}

uint64_t sub_25DA8EB80()
{
  return MEMORY[0x270F75648]();
}

uint64_t sub_25DA8EB90()
{
  return MEMORY[0x270F75668]();
}

uint64_t sub_25DA8EBA0()
{
  return MEMORY[0x270F75670]();
}

uint64_t sub_25DA8EBB0()
{
  return MEMORY[0x270F71060]();
}

uint64_t sub_25DA8EBC0()
{
  return MEMORY[0x270F71068]();
}

uint64_t sub_25DA8EBD0()
{
  return MEMORY[0x270F71070]();
}

uint64_t sub_25DA8EBE0()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_25DA8EBF0()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_25DA8EC00()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_25DA8EC10()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_25DA8EC20()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_25DA8EC30()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_25DA8EC40()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_25DA8EC50()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_25DA8EC60()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25DA8EC70()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25DA8EC80()
{
  return MEMORY[0x270F75950]();
}

uint64_t sub_25DA8EC90()
{
  return MEMORY[0x270F75990]();
}

uint64_t sub_25DA8ECA0()
{
  return MEMORY[0x270F759D8]();
}

uint64_t sub_25DA8ECB0()
{
  return MEMORY[0x270F75A70]();
}

uint64_t sub_25DA8ECC0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25DA8ECD0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25DA8ECE0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25DA8ECF0()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_25DA8ED00()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_25DA8ED10()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_25DA8ED20()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_25DA8ED30()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_25DA8ED40()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_25DA8ED50()
{
  return MEMORY[0x270F04A18]();
}

uint64_t sub_25DA8ED60()
{
  return MEMORY[0x270F04F70]();
}

uint64_t sub_25DA8ED70()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_25DA8ED80()
{
  return MEMORY[0x270F050E8]();
}

uint64_t sub_25DA8ED90()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_25DA8EDA0()
{
  return MEMORY[0x270F75B20]();
}

uint64_t sub_25DA8EDB0()
{
  return MEMORY[0x270F75B38]();
}

uint64_t sub_25DA8EDC0()
{
  return MEMORY[0x270F75C30]();
}

uint64_t sub_25DA8EDD0()
{
  return MEMORY[0x270F75CF8]();
}

uint64_t sub_25DA8EDE0()
{
  return MEMORY[0x270F75D18]();
}

uint64_t sub_25DA8EDF0()
{
  return MEMORY[0x270F75FE8]();
}

uint64_t sub_25DA8EE00()
{
  return MEMORY[0x270F75FF0]();
}

uint64_t sub_25DA8EE10()
{
  return MEMORY[0x270F760C0]();
}

uint64_t sub_25DA8EE20()
{
  return MEMORY[0x270F76250]();
}

uint64_t sub_25DA8EE30()
{
  return MEMORY[0x270F76260]();
}

uint64_t sub_25DA8EE40()
{
  return MEMORY[0x270F76280]();
}

uint64_t sub_25DA8EE50()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25DA8EE60()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25DA8EE70()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25DA8EE80()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25DA8EE90()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25DA8EEA0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25DA8EEB0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25DA8EEC0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25DA8EED0()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_25DA8EEE0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25DA8EEF0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25DA8EF00()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25DA8EF10()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25DA8EF20()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25DA8EF30()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25DA8EF40()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25DA8EF50()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25DA8EF60()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25DA8EF70()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25DA8EF80()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25DA8EF90()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25DA8EFA0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25DA8EFB0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25DA8EFC0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25DA8EFD0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25DA8EFF0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25DA8F000()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_25DA8F010()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25DA8F020()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25DA8F030()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25DA8F040()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25DA8F050()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25DA8F060()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25DA8F070()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25DA8F090()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25DA8F0A0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25DA8F0B0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25DA8F0C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25DA8F0D0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25DA8F0E0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25DA8F0F0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25DA8F100()
{
  return MEMORY[0x270F9FD98]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}