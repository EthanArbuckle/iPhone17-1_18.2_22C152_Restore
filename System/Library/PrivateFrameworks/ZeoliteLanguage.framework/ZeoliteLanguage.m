uint64_t sub_26277DB98()
{
  uint64_t v0;
  uint64_t v1;

  if (*(void *)(v0 + 32))
  {
    v1 = *(void *)(v0 + 32);
  }
  else
  {
    v1 = sub_26277DBF8();
    *(void *)(v0 + 32) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t sub_26277DBF8()
{
  sub_26278DE40();
  ((void (*)(void))MEMORY[0x270FA5388])();
  v17 = (char *)&v17 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E298);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_26278DEE0();
  uint64_t v3 = *(void *)(v18 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (char *)&v17 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E2A0);
  uint64_t v9 = sub_26278DE60();
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_26278EB90;
  swift_bridgeObjectRetain();
  sub_26278DE50();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v2, 1, v9);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v12 + v11, v2, v9);
    sub_26278DE30();
    id v14 = objc_msgSend(self, sel_processInfo);
    objc_msgSend(v14, sel_processIdentifier);

    sub_26278DED0();
    uint64_t v15 = v18;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v18);
    sub_26278DE20();
    swift_allocObject();
    uint64_t v16 = sub_26278DE00();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v15);
    return v16;
  }
  return result;
}

void *TokenGeneratorBase.__allocating_init(modelIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = (void *)swift_allocObject();
  result[3] = a2;
  result[4] = 0;
  result[2] = a1;
  return result;
}

void *TokenGeneratorBase.init(modelIdentifier:)(uint64_t a1, uint64_t a2)
{
  v2[3] = a2;
  v2[4] = 0;
  v2[2] = a1;
  return v2;
}

uint64_t sub_26277DFC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E240);
  v5[9] = swift_task_alloc();
  v5[10] = swift_task_alloc();
  uint64_t v6 = sub_26278DEC0();
  v5[11] = v6;
  v5[12] = *(void *)(v6 - 8);
  v5[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E248);
  v5[14] = swift_task_alloc();
  uint64_t v7 = sub_26278DF40();
  v5[15] = v7;
  v5[16] = *(void *)(v7 - 8);
  v5[17] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E250);
  v5[18] = v8;
  v5[19] = *(void *)(v8 - 8);
  v5[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_26277E1BC, 0, 0);
}

uint64_t sub_26277E1BC()
{
  uint64_t v17 = v0[17];
  uint64_t v24 = v0[16];
  uint64_t v25 = v0[15];
  uint64_t v18 = v0[14];
  uint64_t v21 = v0[13];
  uint64_t v22 = v0[12];
  uint64_t v23 = v0[11];
  uint64_t v19 = v0[10];
  uint64_t v20 = v0[9];
  uint64_t v1 = v0[5];
  uint64_t v15 = v0[6];
  uint64_t v16 = v0[7];
  uint64_t v2 = v0[4];
  sub_26277DB98();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E258);
  sub_26278DF30();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_26278EBA0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E260);
  uint64_t v3 = *(void *)(sub_26278DF20() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_26278EB90;
  uint64_t v6 = (void *)(v5 + v4);
  void *v6 = v2;
  v6[1] = v1;
  uint64_t v7 = *(void (**)(void))(v3 + 104);
  v7();
  swift_bridgeObjectRetain();
  sub_26278DF00();
  swift_bridgeObjectRelease();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_26278EB90;
  uint64_t v9 = (void *)(v8 + v4);
  *uint64_t v9 = v15;
  v9[1] = v16;
  v7();
  swift_bridgeObjectRetain();
  sub_26278DF10();
  swift_bridgeObjectRelease();
  sub_26278DEF0();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_26278E020();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v18, 1, 1, v10);
  uint64_t v11 = sub_26278DE70();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v19, 1, 1, v11);
  sub_26277E95C(v19, v20);
  sub_26278DEB0();
  sub_26278DEA0();
  sub_26278DE80();
  sub_26278DE90();
  sub_26277E9C4(v19, &qword_26A95E240);
  sub_26278DE10();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
  sub_26277E9C4(v18, &qword_26A95E248);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v17, v25);
  uint64_t v12 = (void *)swift_task_alloc();
  v0[21] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_26277E644;
  uint64_t v13 = v0[18];
  return MEMORY[0x270F7EBB8](v0 + 2, v13);
}

uint64_t sub_26277E644()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 160);
  uint64_t v3 = *(void *)(*(void *)v1 + 152);
  uint64_t v4 = *(void *)(*(void *)v1 + 144);
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_26277E870;
  }
  else {
    uint64_t v5 = sub_26277E7B4;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_26277E7B4()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v1, v2);
}

uint64_t sub_26277E870()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
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

uint64_t sub_26277E95C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_26277E9C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t TokenGeneratorBase.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t TokenGeneratorBase.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for TokenGeneratorBase()
{
  return self;
}

uint64_t method lookup function for TokenGeneratorBase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TokenGeneratorBase);
}

uint64_t dispatch thunk of TokenGeneratorBase.__allocating_init(modelIdentifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of TokenGeneratorBase.process(system:user:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 128)
                                                                   + **(int **)(*(void *)v4 + 128));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_26277EBFC;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_26277EBFC(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

void type metadata accessor for ECMessageBodyStringAccumulatorOptions(uint64_t a1)
{
}

uint64_t sub_26277ED1C(uint64_t a1, uint64_t a2)
{
  return sub_26277F4BC(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_26277ED48(uint64_t a1, id *a2)
{
  uint64_t result = sub_26278E180();
  *a2 = 0;
  return result;
}

uint64_t sub_26277EDC0(uint64_t a1, id *a2)
{
  char v3 = sub_26278E190();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_26277EE40@<X0>(uint64_t *a1@<X8>)
{
  sub_26278E1A0();
  uint64_t v2 = sub_26278E170();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_26277EE84(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_26277EE8C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_26277EEA0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_26277EEB4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_26277EEC8(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_26277EEF8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_26277EF24@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_26277EF48(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_26277EF5C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_26277EF70(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_26277EF84@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_26277EF98(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_26277EFAC(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_26277EFC0(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_26277EFD4()
{
  return *v0 == 0;
}

uint64_t sub_26277EFE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_26277EFFC(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_26277F010@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL sub_26277F020(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_26277F034@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_26277F654(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_26277F078(uint64_t a1)
{
  uint64_t v2 = sub_26277F3CC((unint64_t *)&qword_26A95E328, type metadata accessor for DocumentReadingOptionKey);
  uint64_t v3 = sub_26277F3CC(&qword_26A95E330, type metadata accessor for DocumentReadingOptionKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_26277F134(uint64_t a1)
{
  uint64_t v2 = sub_26277F3CC(&qword_26A95E318, type metadata accessor for DocumentType);
  uint64_t v3 = sub_26277F3CC(&qword_26A95E320, type metadata accessor for DocumentType);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_26277F1F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_26278E170();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_26277F238@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26278E1A0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_26277F264(uint64_t a1)
{
  uint64_t v2 = sub_26277F3CC(&qword_26A95E308, type metadata accessor for ECMessageHeaderKey);
  uint64_t v3 = sub_26277F3CC(&qword_26A95E310, type metadata accessor for ECMessageHeaderKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

void *sub_26277F320@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_26277F330(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_26277F33C()
{
  return sub_26277F3CC(&qword_26A95E278, type metadata accessor for ECMessageBodyStringAccumulatorOptions);
}

uint64_t sub_26277F384()
{
  return sub_26277F3CC(&qword_26A95E280, type metadata accessor for ECMessageBodyStringAccumulatorOptions);
}

uint64_t sub_26277F3CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_26277F414()
{
  return sub_26277F3CC(&qword_26A95E288, type metadata accessor for ECMessageBodyStringAccumulatorOptions);
}

uint64_t sub_26277F45C()
{
  return sub_26277F3CC(&qword_26A95E290, type metadata accessor for ECMessageBodyStringAccumulatorOptions);
}

uint64_t sub_26277F4A4(uint64_t a1, uint64_t a2)
{
  return sub_26277F4BC(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_26277F4BC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_26278E1A0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_26277F500()
{
  sub_26278E1A0();
  sub_26278E110();
  return swift_bridgeObjectRelease();
}

uint64_t sub_26277F554()
{
  sub_26278E1A0();
  sub_26278E5C0();
  sub_26278E110();
  uint64_t v0 = sub_26278E5D0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_26277F5C8()
{
  uint64_t v0 = sub_26278E1A0();
  uint64_t v2 = v1;
  if (v0 == sub_26278E1A0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_26278E580();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_26277F654(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

void type metadata accessor for ECMessageHeaderKey(uint64_t a1)
{
}

void type metadata accessor for DocumentType(uint64_t a1)
{
}

void type metadata accessor for DocumentReadingOptionKey(uint64_t a1)
{
}

void sub_26277F6C8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_26277F710()
{
  return sub_26277F3CC(&qword_26A95E2C0, type metadata accessor for DocumentReadingOptionKey);
}

uint64_t sub_26277F758()
{
  return sub_26277F3CC(&qword_26A95E2C8, type metadata accessor for DocumentReadingOptionKey);
}

uint64_t sub_26277F7A0()
{
  return sub_26277F3CC(&qword_26A95E2D0, type metadata accessor for DocumentType);
}

uint64_t sub_26277F7E8()
{
  return sub_26277F3CC(&qword_26A95E2D8, type metadata accessor for DocumentType);
}

uint64_t sub_26277F830()
{
  return sub_26277F3CC(&qword_26A95E2E0, type metadata accessor for DocumentType);
}

uint64_t sub_26277F878()
{
  return sub_26277F3CC(&qword_26A95E2E8, type metadata accessor for ECMessageHeaderKey);
}

uint64_t sub_26277F8C0()
{
  return sub_26277F3CC(&qword_26A95E2F0, type metadata accessor for ECMessageHeaderKey);
}

uint64_t sub_26277F908()
{
  return sub_26277F3CC(&qword_26A95E2F8, type metadata accessor for ECMessageHeaderKey);
}

uint64_t sub_26277F950()
{
  return sub_26277F3CC(&qword_26A95E300, type metadata accessor for DocumentReadingOptionKey);
}

uint64_t sub_26277F9A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26278E1E0();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E338);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_26278DD10();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v14 = (char *)&v34 - v13;
  uint64_t v15 = (void *)sub_26278E170();
  id v16 = objc_msgSend(self, sel_bundleWithIdentifier_, v15);

  if (!v16) {
    goto LABEL_7;
  }
  uint64_t v35 = a2;
  uint64_t v36 = a1;
  uint64_t v17 = (void *)sub_26278E170();
  uint64_t v18 = (void *)sub_26278E170();
  id v19 = objc_msgSend(v16, sel_URLForResource_withExtension_, v17, v18);

  if (!v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    a1 = v36;
    goto LABEL_6;
  }
  sub_26278DD00();

  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v20(v7, v12, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  int v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  a1 = v36;
  if (v21 == 1)
  {
LABEL_6:

    sub_2627801FC((uint64_t)v7);
LABEL_7:
    swift_bridgeObjectRetain();
    return a1;
  }
  v20(v14, v7, v8);
  uint64_t v22 = sub_26278DD20();
  unint64_t v24 = v23;
  uint64_t v26 = sub_262781004(v22, v23);
  unint64_t v28 = v27;
  sub_26278025C(v22, v24);
  sub_26278E1D0();
  unint64_t v29 = v28;
  uint64_t v30 = sub_26278E1C0();
  if (v31)
  {
    uint64_t v32 = sub_26277FDEC(v30, v31);
    uint64_t v33 = v35;
    swift_bridgeObjectRetain();
    a1 = sub_262780D04(v36, v33, v32);

    sub_26278025C(v26, v29);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);

    swift_bridgeObjectRetain();
    sub_26278025C(v26, v28);
    return v36;
  }
  return a1;
}

uint64_t sub_26277FDEC(uint64_t a1, unint64_t a2)
{
  sub_26278E230();
  uint64_t v4 = sub_26278E350();
  uint64_t v13 = v4;
  uint64_t v5 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  v12[2] = a1;
  v12[3] = a2;
  v12[4] = 0;
  v12[5] = v5;
  uint64_t v6 = sub_26278E260();
  if (v7)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v7;
    do
    {
      sub_2627802B4(v12, v8, v9);
      swift_bridgeObjectRelease();
      uint64_t v8 = sub_26278E260();
      uint64_t v9 = v10;
    }
    while (v10);
    uint64_t v4 = v13;
  }
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_26277FEAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_26278E5C0();
    sub_26278E110();
    uint64_t v6 = sub_26278E5D0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_26278E580() & 1) != 0) {
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
          if (v17 || (sub_26278E580() & 1) != 0) {
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

void sub_26277FFE4(uint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain();
  sub_26278E290();
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v21 = 0;
  uint64_t v22 = v4;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_26278E260();
  if (v6)
  {
    uint64_t v7 = v5;
    unint64_t v8 = v6;
    id v9 = 0;
    unint64_t v10 = 0x2655B0000uLL;
    while (1)
    {
      while ((sub_262780DEC(v7, v8) & 1) == 0)
      {
        MEMORY[0x263E53040](v7, v8);
        swift_bridgeObjectRelease();
        uint64_t v7 = sub_26278E260();
        unint64_t v8 = v11;
        if (!v11) {
          goto LABEL_16;
        }
      }
      if (!v9) {
        id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3B4F0]), sel_init, v19, v20, v21, v22);
      }
      id v12 = v9;
      uint64_t v13 = (void *)sub_26278E170();
      swift_bridgeObjectRelease();
      id v14 = objc_msgSend(self, *(SEL *)(v10 + 1160), v13, v12);

      id v15 = objc_msgSend(v14, sel_copyWithoutModifiers);
      if (!v15) {
        id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3B508]), sel_init);
      }
      id v16 = objc_msgSend(v15, sel_string, v19, v20);
      if (!v16) {
        break;
      }
      BOOL v17 = v16;
      sub_26278E1A0();

      sub_26278E250();
      swift_bridgeObjectRelease();
      uint64_t v7 = sub_26278E260();
      unint64_t v8 = v18;
      unint64_t v10 = 0x2655B0000;
      if (!v18) {
        goto LABEL_16;
      }
    }

    __break(1u);
  }
  else
  {
    id v9 = 0;
LABEL_16:
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2627801FC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E338);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_26278025C(uint64_t a1, unint64_t a2)
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

uint64_t sub_2627802B4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  sub_26278E5C0();
  sub_26278E110();
  uint64_t v9 = sub_26278E5D0();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  unint64_t v11 = v9 & ~v10;
  uint64_t v12 = v8 + 56;
  if ((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
  {
    uint64_t v13 = *(void *)(v8 + 48);
    id v14 = (void *)(v13 + 16 * v11);
    BOOL v15 = *v14 == a2 && v14[1] == a3;
    if (v15 || (sub_26278E580() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      id v16 = (uint64_t *)(*(void *)(*v4 + 48) + 16 * v11);
      uint64_t v17 = v16[1];
      *a1 = *v16;
      a1[1] = v17;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v19 = ~v10;
    while (1)
    {
      unint64_t v11 = (v11 + 1) & v19;
      if (((*(void *)(v12 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        break;
      }
      uint64_t v20 = (void *)(v13 + 16 * v11);
      BOOL v21 = *v20 == a2 && v20[1] == a3;
      if (v21 || (sub_26278E580() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v23 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_262780714(a2, a3, v11, isUniquelyReferenced_nonNull_native);
  *uint64_t v4 = v23;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_262780444()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E340);
  uint64_t result = sub_26278E480();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    unint64_t v29 = (void *)(v2 + 56);
    uint64_t v6 = 1 << *(unsigned char *)(v2 + 32);
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v6 + 63) >> 6;
    uint64_t v10 = result + 56;
    while (1)
    {
      if (v8)
      {
        unint64_t v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v9) {
          goto LABEL_33;
        }
        unint64_t v16 = v29[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v16 = v29[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v16 = v29[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v9)
              {
LABEL_33:
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v29 = -1 << v28;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v29[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v29[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      unint64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v14);
      uint64_t v19 = *v18;
      uint64_t v20 = v18[1];
      sub_26278E5C0();
      sub_26278E110();
      uint64_t result = sub_26278E5D0();
      uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v11 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      uint64_t v12 = (void *)(*(void *)(v4 + 48) + 16 * v11);
      *uint64_t v12 = v19;
      v12[1] = v20;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_262780714(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  int64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_262780444();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_2627808B0();
      goto LABEL_22;
    }
    sub_262780A64();
  }
  uint64_t v11 = *v4;
  sub_26278E5C0();
  sub_26278E110();
  uint64_t result = sub_26278E5D0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    int64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_26278E580(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_26278E590();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        unint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_26278E580();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_2627808B0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E340);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_26278E470();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_262780A64()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E340);
  uint64_t result = sub_26278E480();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v28 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v10 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_23;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
    if (v15 >= v28) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v28) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v28) {
          goto LABEL_32;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16)
        {
          int64_t v17 = v15 + 3;
          if (v17 >= v28)
          {
LABEL_32:
            uint64_t result = swift_release();
            uint64_t v1 = v0;
            goto LABEL_34;
          }
          unint64_t v16 = *(void *)(v6 + 8 * v17);
          int64_t v5 = v17;
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_23:
    uint64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_26278E5C0();
    sub_26278E110();
    uint64_t result = sub_26278E5D0();
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_35;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v11 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    unint64_t v12 = (void *)(*(void *)(v4 + 48) + 16 * v11);
    *unint64_t v12 = v20;
    v12[1] = v19;
    ++*(void *)(v4 + 16);
    uint64_t result = swift_bridgeObjectRetain();
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v28) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_262780D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_26278E260();
  if (v5)
  {
    uint64_t v6 = v4;
    unint64_t v7 = v5;
    do
    {
      if (sub_262780DEC(v6, v7) & 1) == 0 || (sub_26277FEAC(v6, v7, a3)) {
        MEMORY[0x263E53040](v6, v7);
      }
      swift_bridgeObjectRelease();
      uint64_t v6 = sub_26278E260();
      unint64_t v7 = v8;
    }
    while (v8);
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_262780DEC(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_26278E610();
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a1 & 0xFFFFFFFFFFFFLL;
  uint64_t v22 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v8 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v8 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v8) {
    return 0;
  }
  uint64_t v19 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v20 = a2 & 0xFFFFFFFFFFFFFFLL;
  unint64_t v9 = (void (**)(char *, uint64_t))(v5 + 8);
  swift_bridgeObjectRetain();
  char v10 = 0;
  uint64_t v11 = 0;
  do
  {
    if ((a2 & 0x1000000000000000) != 0)
    {
      sub_26278E4A0();
    }
    else
    {
      if ((a2 & 0x2000000000000000) != 0)
      {
        uint64_t v23 = a1;
        uint64_t v24 = v20;
      }
      else if ((a1 & 0x1000000000000000) == 0)
      {
        sub_26278E4C0();
      }
      sub_26278E4D0();
    }
    uint64_t v13 = v12;
    if ((v10 & 1) == 0 || (sub_26278E620(), char v14 = sub_26278E5F0(), (*v9)(v7, v4), (v14 & 1) == 0))
    {
      v11 += v13;
      sub_26278E620();
      char v10 = sub_26278E600();
      int64_t v15 = *v9;
      (*v9)(v7, v4);
      if ((v10 & 1) == 0) {
        continue;
      }
      sub_26278E620();
      char v16 = sub_26278E5E0();
      v15(v7, v4);
      if ((v16 & 1) == 0) {
        continue;
      }
    }
    uint64_t v17 = 1;
    goto LABEL_19;
  }
  while (v11 < v8);
  uint64_t v17 = 0;
LABEL_19:
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_262781004(uint64_t a1, unint64_t a2)
{
  v54[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_26278E0E0();
  uint64_t v48 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_26278E0B0();
  MEMORY[0x270FA5388](v49);
  unint64_t v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_26278E0D0();
  uint64_t v51 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v50 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_26278225C((uint64_t)&unk_270DC9128);
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v14) = HIDWORD(a1) - a1;
      if (!__OFSUB__(HIDWORD(a1), a1))
      {
        uint64_t v14 = (int)v14;
        goto LABEL_6;
      }
      __break(1u);
      goto LABEL_31;
    case 2uLL:
      uint64_t v16 = *(void *)(a1 + 16);
      uint64_t v15 = *(void *)(a1 + 24);
      BOOL v17 = __OFSUB__(v15, v16);
      uint64_t v14 = v15 - v16;
      if (!v17) {
        goto LABEL_6;
      }
LABEL_31:
      __break(1u);
      goto LABEL_32;
    case 3uLL:
      goto LABEL_11;
    default:
      uint64_t v14 = BYTE6(a2);
      if (v14 < 7) {
        goto LABEL_11;
      }
LABEL_6:
      uint64_t v52 = v12;
      unint64_t v53 = v13;
      uint64_t v18 = sub_26278DD40();
      uint64_t v46 = v10;
      uint64_t v47 = v2;
      uint64_t v19 = v18;
      unint64_t v21 = v20;
      char v22 = sub_262782488(v52, v53, v18, v20);
      sub_26278025C(v19, v21);
      uint64_t v12 = v52;
      unint64_t v13 = v53;
      if (v22)
      {
        v43 = v9;
        unint64_t v44 = a2 >> 62;
        if (qword_26A95E220 != -1) {
LABEL_32:
        }
          swift_once();
        unint64_t v23 = qword_26A95E350 >> 62;
        uint64_t v24 = qword_26A95E348;
        unint64_t v45 = qword_26A95E350;
        sub_262782720(qword_26A95E348, qword_26A95E350);
        sub_262782778(&qword_26A95E358, MEMORY[0x263F047F8]);
        sub_26278E0A0();
        switch(v23)
        {
          case 1uLL:
            if (v24 >> 32 < (int)v24) {
              __break(1u);
            }
            unint64_t v25 = v45;
            unint64_t v42 = v45 & 0x3FFFFFFFFFFFFFFFLL;
            sub_262782720(v24, v45);
            uint64_t v30 = v47;
            sub_262781FB8((int)v24, v24 >> 32);
            uint64_t v47 = v30;
            goto LABEL_19;
          case 2uLL:
            unint64_t v25 = v45;
            unint64_t v28 = *(void *)(v24 + 16);
            uint64_t v41 = *(void *)(v24 + 24);
            unint64_t v42 = v28;
            sub_262782720(v24, v45);
            swift_retain();
            swift_retain();
            uint64_t v29 = v47;
            sub_262781FB8(v42, v41);
            uint64_t v47 = v29;
            if (v29) {
              goto LABEL_35;
            }
            swift_release();
            swift_release();
LABEL_19:
            sub_26278025C(v24, v25);
            break;
          case 3uLL:
            memset(v54, 0, 14);
            sub_26278E080();
            uint64_t v26 = v24;
            unint64_t v25 = v45;
            goto LABEL_16;
          default:
            v54[0] = v24;
            unint64_t v25 = v45;
            LODWORD(v54[1]) = v45;
            WORD2(v54[1]) = WORD2(v45);
            sub_26278E080();
            uint64_t v26 = v24;
LABEL_16:
            sub_26278025C(v26, v25);
            break;
        }
        sub_26278E090();
        (*(void (**)(char *, uint64_t))(v48 + 8))(v7, v5);
        sub_26278025C(v24, v25);
        sub_262782778(&qword_26A95E360, MEMORY[0x263F045C0]);
        unint64_t v31 = v50;
        sub_26278E0C0();
        if (v44)
        {
          if (v44 == 1)
          {
            uint64_t v32 = (int)a1;
            uint64_t v33 = a1 >> 32;
          }
          else
          {
            uint64_t v32 = *(void *)(a1 + 16);
            uint64_t v33 = *(void *)(a1 + 24);
          }
        }
        else
        {
          uint64_t v32 = 0;
          uint64_t v33 = BYTE6(a2);
        }
        if (v33 < 7 || v33 < v32)
        {
          __break(1u);
LABEL_35:
          swift_release();
          swift_release();
          __break(1u);
          JUMPOUT(0x26278168CLL);
        }
        uint64_t v34 = sub_26278DD40();
        uint64_t v35 = v47;
        uint64_t v37 = sub_262781960(v34, v36);
        if (v35)
        {
          (*(void (**)(char *, uint64_t))(v51 + 8))(v31, v46);
          sub_26278025C(v52, v53);
        }
        else
        {
          uint64_t v39 = v37;
          unint64_t v40 = v38;
          a1 = sub_26278E060();
          (*(void (**)(char *, uint64_t))(v51 + 8))(v31, v46);
          sub_26278025C(v52, v53);
          sub_26278025C(v39, v40);
        }
      }
      else
      {
LABEL_11:
        sub_26278025C(v12, v13);
        sub_262782720(a1, a2);
      }
      return a1;
  }
}

uint64_t sub_2627816AC(uint64_t a1, unint64_t a2)
{
  v28[5] = *MEMORY[0x263EF8340];
  v28[3] = MEMORY[0x263F06F78];
  v28[4] = MEMORY[0x263F06F68];
  v28[0] = a1;
  v28[1] = a2;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v28, MEMORY[0x263F06F78]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5)
      {
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      sub_262782720(a1, a2);
      sub_262782720(v5, v6);
      uint64_t v8 = (unsigned char *)sub_26278DCB0();
      if (v8)
      {
        uint64_t v9 = sub_26278DCD0();
        if (!__OFSUB__((int)v5, v9))
        {
          v8 += (int)v5 - v9;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = sub_26278DCC0();
      if (v10 >= (v5 >> 32) - (int)v5) {
        uint64_t v11 = (v5 >> 32) - (int)v5;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = &v8[v11];
      if (v8) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = 0;
      }
      sub_262781F40(v8, v13, &v27);
      sub_26278025C(v5, v6);
LABEL_27:
      sub_26278025C(a1, a2);
      uint64_t v24 = v27;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      return v24;
    case 2uLL:
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = *(void *)(v5 + 24);
      sub_262782720(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v16 = (unsigned char *)sub_26278DCB0();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = sub_26278DCD0();
      if (__OFSUB__(v14, v17)) {
        goto LABEL_30;
      }
      v16 += v14 - v17;
LABEL_17:
      BOOL v18 = __OFSUB__(v15, v14);
      uint64_t v19 = v15 - v14;
      if (v18) {
        goto LABEL_29;
      }
      uint64_t v20 = sub_26278DCC0();
      if (v20 >= v19) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = v20;
      }
      char v22 = &v16[v21];
      if (v16) {
        unint64_t v23 = v22;
      }
      else {
        unint64_t v23 = 0;
      }
      sub_262781F40(v16, v23, &v27);
      swift_release();
      swift_release();
      goto LABEL_27;
    case 3uLL:
      memset(v26, 0, 14);
      sub_262782720(a1, a2);
      unint64_t v7 = v26;
      goto LABEL_26;
    default:
      v26[0] = *v4;
      LOWORD(v26[1]) = v6;
      BYTE2(v26[1]) = BYTE2(v6);
      BYTE3(v26[1]) = BYTE3(v6);
      BYTE4(v26[1]) = BYTE4(v6);
      BYTE5(v26[1]) = BYTE5(v6);
      sub_262782720(a1, a2);
      unint64_t v7 = (char *)v26 + BYTE6(v6);
LABEL_26:
      sub_262781F40(v26, v7, &v27);
      goto LABEL_27;
  }
}

uint64_t sub_262781960(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x262781AACLL);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 > 27) {
        return sub_2627816AC(a1, a2);
      }
LABEL_7:
      uint64_t v8 = sub_26278E070();
      sub_262782778(&qword_26A95E368, MEMORY[0x263F04548]);
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v8 - 8) + 104))(v9, *MEMORY[0x263F04538], v8);
      swift_willThrow();
      return sub_26278025C(a1, a2);
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

unint64_t sub_262781ABC()
{
  unint64_t result = sub_262781AE0();
  qword_26A95E348 = result;
  unk_26A95E350 = v1;
  return result;
}

unint64_t sub_262781AE0()
{
  uint64_t v0 = sub_26278E260();
  if (!v1)
  {
    uint64_t v4 = (char *)MEMORY[0x263F8EE78];
LABEL_21:
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_26278225C((uint64_t)v4);
    swift_bridgeObjectRelease();
    return v10;
  }
  unint64_t v2 = v0;
  unint64_t v3 = v1;
  uint64_t v4 = (char *)MEMORY[0x263F8EE78];
  while (1)
  {
    if (v2 == 2573 && v3 == 0xE200000000000000 || (sub_26278E580() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v5) = 10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_6;
    }
    if (sub_26278E100())
    {
      unint64_t result = sub_262782D28(v2, v3);
      if ((result & 0x100000000) != 0) {
        goto LABEL_23;
      }
      if ((result & 0xFFFFFF80) == 0) {
        break;
      }
    }
    swift_bridgeObjectRelease();
    LOBYTE(v5) = 0;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_19:
    }
      uint64_t v4 = sub_26278988C(0, *((void *)v4 + 2) + 1, 1, v4);
LABEL_6:
    unint64_t v7 = *((void *)v4 + 2);
    unint64_t v6 = *((void *)v4 + 3);
    if (v7 >= v6 >> 1) {
      uint64_t v4 = sub_26278988C((char *)(v6 > 1), v7 + 1, 1, v4);
    }
    *((void *)v4 + 2) = v7 + 1;
    v4[v7 + 32] = v5;
    unint64_t v2 = sub_26278E260();
    unint64_t v3 = v8;
    if (!v8) {
      goto LABEL_21;
    }
  }
  unint64_t result = sub_262782D28(v2, v3);
  if ((result & 0x100000000) != 0) {
    goto LABEL_24;
  }
  int v5 = result;
  unint64_t result = swift_bridgeObjectRelease();
  if ((v5 & 0xFFFFFF00) == 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_6;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_262781CCC@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  unint64_t v7 = (const void *)__s1;
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
      sub_262782720(a2, a3);
      uint64_t v10 = (char *)sub_26278DCB0();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_26278DCD0();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_26278DCC0();
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
        JUMPOUT(0x262781F30);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_26278025C(a2, a3);
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
      uint64_t v17 = (char *)sub_26278DCB0();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_26278DCD0();
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
      uint64_t v21 = sub_26278DCC0();
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

unsigned char *sub_262781F40@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = (unsigned char *)sub_262782098(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_26278215C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_2627821D8((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_262781FB8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_26278DCB0();
  if (!result || (uint64_t result = sub_26278DCD0(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_26278DCC0();
      sub_26278E0E0();
      sub_262782778(&qword_26A95E358, MEMORY[0x263F047F8]);
      return sub_26278E080();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_262782098(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_26278215C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_26278DCE0();
  swift_allocObject();
  uint64_t result = sub_26278DCA0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_26278DD30();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_2627821D8(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_26278DCE0();
  swift_allocObject();
  uint64_t result = sub_26278DCA0();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_26278225C(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E370);
  unint64_t v10 = sub_262782854();
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  unint64_t v3 = (unsigned char *)(*v2 + 32);
  uint64_t v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_262781F40(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

uint64_t sub_2627822F8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_262781CCC((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_2627823D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_26278DCB0();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_26278DCD0();
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
  sub_26278DCC0();
  sub_262781CCC(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_262782488(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x2627826F0);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_262782720(a3, a4);
                  sub_262782720(a1, a2);
                  char v17 = sub_2627823D0((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_26278025C(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_262782720(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_2627823D0(v21, v22, v20, a3, a4);
                  sub_26278025C(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_262782720(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_262782720(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_2627822F8(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_26278025C(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_262782720(uint64_t a1, unint64_t a2)
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

uint64_t sub_262782778(unint64_t *a1, void (*a2)(uint64_t))
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
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

unint64_t sub_262782854()
{
  unint64_t result = qword_26A95E378;
  if (!qword_26A95E378)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A95E370);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95E378);
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

uint64_t sub_2627828F8@<X0>(uint64_t *a1@<X8>)
{
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E418);
  sub_26278DFE0();
  swift_release();
  uint64_t v2 = MEMORY[0x263E53000]();
  uint64_t v4 = v3;
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t sub_262782994@<X0>(uint64_t *a1@<X8>)
{
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E408);
  sub_26278DFF0();
  swift_release();
  if (v12 >> 14 == v11 >> 14)
  {
LABEL_2:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v3 = 32;
LABEL_20:
    *a1 = v3;
    a1[1] = 0xE100000000000000;
  }
  else
  {
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v4 = sub_26278E3F0();
      unint64_t v6 = v5;
      uint64_t result = sub_26278E3D0();
      if (!((v6 & 0x2000000000000000) != 0 ? HIBYTE(v6) & 0xF : v4 & 0xFFFFFFFFFFFFLL)) {
        break;
      }
      unint64_t v8 = result;
      if ((v6 & 0x1000000000000000) != 0)
      {
        int v9 = sub_26278E4A0();
      }
      else
      {
        if ((v6 & 0x2000000000000000) == 0 && (v4 & 0x1000000000000000) == 0) {
          sub_26278E4C0();
        }
        int v9 = sub_26278E4D0();
      }
      int v10 = v9;
      swift_bridgeObjectRelease();
      if ((v10 - 14) > 0xFFFFFFFB || (v10 - 8232) < 2 || v10 == 133)
      {
        uint64_t result = swift_bridgeObjectRelease_n();
        uint64_t v3 = 10;
        goto LABEL_20;
      }
      if (v12 >> 14 == v8 >> 14)
      {
        swift_bridgeObjectRelease();
        goto LABEL_2;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_262782B64@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E408);
  sub_26278E000();
  sub_26278544C();
  sub_262785254();
  uint64_t v2 = sub_26278E420();
  uint64_t v4 = v3;
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  a1[1] = v4;
  return result;
}

void sub_262782C38()
{
  off_26A95E380 = &unk_270DC9150;
}

id sub_262782C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  unint64_t v5 = (void *)sub_26278E170();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_26278DCF0();

    swift_willThrow();
  }
  return v6;
}

unint64_t sub_262782D28(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    sub_262782E08(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      unsigned int v5 = sub_26278E4A0();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0) {
        sub_26278E4C0();
      }
      unsigned int v5 = sub_26278E4D0();
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t sub_262782E08(unint64_t result, unint64_t a2, unint64_t a3)
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
    uint64_t result = sub_262782EA8(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_262782F18(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_262782EA8(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    uint64_t result = sub_26278303C(result, a2, a3);
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

unint64_t sub_262782F18(unint64_t result, uint64_t a2, unint64_t a3)
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
      v13[2] = v3;
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
        uint64_t v6 = sub_26278E4C0();
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

uint64_t sub_26278303C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_26278E280();
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
    uint64_t v5 = MEMORY[0x263E53070](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_2627830B8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E3F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26278F270;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E390);
  *(void *)(inited + 56) = v1;
  uint64_t v2 = sub_2627852FC(&qword_26A95E3A8, &qword_26A95E390);
  *(void *)(inited + 64) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
  sub_26278DFD0();
  *(void *)(inited + 72) = 10;
  *(void *)(inited + 80) = 0xE100000000000000;
  *(void *)(inited + 112) = v1;
  *(void *)(inited + 120) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 88));
  sub_26278DFD0();
  *(void *)(inited + 128) = 0;
  *(void *)(inited + 136) = 0xE000000000000000;
  *(void *)(inited + 168) = v1;
  *(void *)(inited + 176) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 144));
  sub_26278DFD0();
  *(void *)(inited + 184) = 47;
  *(void *)(inited + 192) = 0xE100000000000000;
  sub_2627853E4(inited + 32, (uint64_t)v5);
  __swift_project_boxed_opaque_existential_1(v5, v6);
  sub_2627851AC();
  sub_262785200();
  sub_26278E370();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  sub_2627853E4(inited + 88, (uint64_t)v5);
  __swift_project_boxed_opaque_existential_1(v5, v6);
  sub_26278E370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  sub_2627853E4(inited + 144, (uint64_t)v5);
  __swift_project_boxed_opaque_existential_1(v5, v6);
  sub_26278E370();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E400);
  swift_arrayDestroy();
  return v4;
}

id sub_2627833E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = (void *)sub_26278DD50();
  type metadata accessor for DocumentReadingOptionKey(0);
  sub_2627854C8();
  unint64_t v7 = (void *)sub_26278E0F0();
  swift_bridgeObjectRelease();
  v12[0] = 0;
  id v8 = objc_msgSend(v4, sel_initWithData_options_documentAttributes_error_, v6, v7, a4, v12);

  if (v8)
  {
    id v9 = v12[0];
  }
  else
  {
    id v10 = v12[0];
    sub_26278DCF0();

    swift_willThrow();
  }
  return v8;
}

uint64_t sub_2627834F8(uint64_t a1)
{
  uint64_t v2 = sub_26278DC90();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_26278E1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26278E1D0();
  uint64_t v10 = sub_26278E1B0();
  unint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v12 >> 60 != 15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E420);
    uint64_t inited = swift_initStackObject();
    uint64_t v14 = (void **)MEMORY[0x263F814D8];
    *(_OWORD *)(inited + 16) = xmmword_26278EB90;
    uint64_t v15 = *v14;
    *(void *)(inited + 32) = *v14;
    uint64_t v16 = (void *)*MEMORY[0x263F81508];
    type metadata accessor for DocumentType(0);
    *(void *)(inited + 64) = v17;
    *(void *)(inited + 40) = v16;
    sub_2627854A0(v10, v12);
    id v18 = v15;
    id v19 = v16;
    unint64_t v20 = sub_262785520(inited);
    id v21 = objc_allocWithZone(MEMORY[0x263F086A0]);
    id v22 = sub_2627833E4(v10, v12, v20, 0);
    sub_2627854B4(v10, v12);
    if (v22)
    {
      id v24 = objc_msgSend(v22, sel_string);
      uint64_t v25 = sub_26278E1A0();
      uint64_t v27 = v26;

      v28[0] = v25;
      v28[1] = v27;
      sub_26278DC80();
      sub_262785254();
      a1 = sub_26278E410();

      sub_2627854B4(v10, v12);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_2627854B4(v10, v12);
  }
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2627837F4()
{
  sub_262785254();
  sub_26278E440();
  uint64_t v0 = sub_26278E260();
  unint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = v0;
    do
    {
      if ((v2 & 0x2000000000000000) != 0) {
        uint64_t v5 = HIBYTE(v2) & 0xF;
      }
      else {
        uint64_t v5 = v3 & 0xFFFFFFFFFFFFLL;
      }
      if (v5)
      {
        if ((v2 & 0x1000000000000000) != 0)
        {
          unsigned int v6 = sub_26278E4A0();
        }
        else
        {
          if ((v2 & 0x2000000000000000) == 0 && (v3 & 0x1000000000000000) == 0) {
            sub_26278E4C0();
          }
          unsigned int v6 = sub_26278E4D0();
        }
        unsigned int v7 = v6;
        if (qword_26A95E228 != -1) {
          swift_once();
        }
        uint64_t v8 = *((void *)off_26A95E380 + 2);
        if (v8)
        {
          id v9 = (unsigned int *)((char *)off_26A95E380 + 36);
          while (v7 < *(v9 - 1) || *v9 < v7)
          {
            v9 += 2;
            if (!--v8) {
              goto LABEL_4;
            }
          }
          MEMORY[0x263E53040](v3, v2);
        }
      }
LABEL_4:
      swift_bridgeObjectRelease();
      uint64_t v3 = sub_26278E260();
      unint64_t v2 = v4;
    }
    while (v4);
  }
  swift_bridgeObjectRelease();
  return sub_26278E2A0();
}

uint64_t sub_2627839AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E388);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v22 = v4;
  uint64_t v23 = v5;
  MEMORY[0x270FA5388](v4);
  unsigned int v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E390);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_26277F9A8(a1, a2);
  unint64_t v27 = v12;
  sub_26278DFD0();
  uint64_t v24 = 32;
  unint64_t v25 = 0xE100000000000000;
  sub_2627851AC();
  sub_262785200();
  v20[0] = sub_2627852FC(&qword_26A95E3A8, &qword_26A95E390);
  sub_26278E370();
  unint64_t v13 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20[1] = v9 + 8;
  id v21 = v13;
  v13(v11, v8);
  swift_bridgeObjectRelease();
  sub_26277FFE4(v28, v29);
  uint64_t v15 = v14;
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E3B8);
  sub_26278DFD0();
  uint64_t v26 = v15;
  unint64_t v27 = v17;
  sub_2627852FC(&qword_26A95E3C0, &qword_26A95E388);
  uint64_t v18 = v22;
  sub_26278E360();
  swift_bridgeObjectRelease();
  uint64_t v26 = v28;
  unint64_t v27 = v29;
  sub_26278DFD0();
  sub_26278E360();
  v21(v11, v8);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v18);
  return v28;
}

uint64_t sub_262783D68()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E3F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_26278F280;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E390);
  *(void *)(inited + 56) = v1;
  uint64_t v2 = sub_2627852FC(&qword_26A95E3A8, &qword_26A95E390);
  *(void *)(inited + 64) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
  sub_26278DFD0();
  *(void *)(inited + 72) = 42;
  *(void *)(inited + 80) = 0xE100000000000000;
  *(void *)(inited + 112) = v1;
  *(void *)(inited + 120) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 88));
  sub_26278DFD0();
  *(void *)(inited + 128) = 46;
  *(void *)(inited + 136) = 0xE100000000000000;
  *(void *)(inited + 168) = v1;
  *(void *)(inited + 176) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 144));
  sub_26278DFD0();
  *(void *)(inited + 184) = 43;
  *(void *)(inited + 192) = 0xE100000000000000;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E388);
  *(void *)(inited + 224) = v3;
  uint64_t v4 = sub_2627852FC(&qword_26A95E3C0, &qword_26A95E388);
  *(void *)(inited + 232) = v4;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 200));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E3B8);
  sub_26278DFD0();
  *(void *)(inited + 240) = 61;
  *(void *)(inited + 248) = 0xE100000000000000;
  *(void *)(inited + 280) = v3;
  *(void *)(inited + 288) = v4;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 256));
  sub_26278DFD0();
  *(void *)(inited + 296) = 45;
  *(void *)(inited + 304) = 0xE100000000000000;
  *(void *)(inited + 336) = v3;
  *(void *)(inited + 344) = v4;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 312));
  sub_26278DFD0();
  *(void *)(inited + 352) = 45;
  *(void *)(inited + 360) = 0xE100000000000000;
  *(void *)(inited + 392) = v1;
  *(void *)(inited + 400) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 368));
  sub_26278DFD0();
  *(void *)(inited + 408) = 61;
  *(void *)(inited + 416) = 0xE100000000000000;
  *(void *)(inited + 448) = v1;
  *(void *)(inited + 456) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 424));
  sub_26278DFD0();
  *(void *)(inited + 464) = 45;
  *(void *)(inited + 472) = 0xE100000000000000;
  *(void *)(inited + 504) = v1;
  *(void *)(inited + 512) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 480));
  sub_26278DFD0();
  *(void *)(inited + 520) = 95;
  *(void *)(inited + 528) = 0xE100000000000000;
  *(void *)(inited + 560) = v1;
  *(void *)(inited + 568) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 536));
  sub_26278DFD0();
  *(void *)(inited + 576) = 126;
  *(void *)(inited + 584) = 0xE100000000000000;
  *(void *)(inited + 616) = v1;
  *(void *)(inited + 624) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 592));
  sub_26278DFD0();
  *(void *)(inited + 632) = 60;
  *(void *)(inited + 640) = 0xE100000000000000;
  *(void *)(inited + 672) = v1;
  *(void *)(inited + 680) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 648));
  sub_26278DFD0();
  *(void *)(inited + 688) = 62;
  *(void *)(inited + 696) = 0xE100000000000000;
  *(void *)(inited + 728) = v1;
  *(void *)(inited + 736) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 704));
  sub_26278DFD0();
  *(void *)(inited + 744) = 33;
  *(void *)(inited + 752) = 0xE100000000000000;
  *(void *)(inited + 784) = v1;
  *(void *)(inited + 792) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 760));
  sub_26278DFD0();
  *(void *)(inited + 800) = 63;
  *(void *)(inited + 808) = 0xE100000000000000;
  *(void *)(inited + 840) = v1;
  *(void *)(inited + 848) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 816));
  sub_26278DFD0();
  *(void *)(inited + 856) = 36;
  *(void *)(inited + 864) = 0xE100000000000000;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  for (uint64_t i = 32; i != 872; i += 56)
  {
    sub_2627853E4(inited + i, (uint64_t)v8);
    __swift_project_boxed_opaque_existential_1(v8, v8[3]);
    sub_2627851AC();
    sub_262785200();
    sub_26278E370();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  }
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E400);
  swift_arrayDestroy();
  return v7;
}

uint64_t sub_2627842B4(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E390);
  uint64_t v40 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v39 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_26278DC90();
  uint64_t v42 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v52 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone(MEMORY[0x263F08AE8]);
  id v8 = sub_262782C4C(0xD00000000000001DLL, 0x800000026278F800, 0);
  uint64_t v9 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v9 = a1;
  }
  uint64_t v10 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0) {
    uint64_t v10 = 11;
  }
  uint64_t v61 = 15;
  uint64_t v62 = v10 | (v9 << 16);
  uint64_t v59 = a1;
  unint64_t v60 = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E3E0);
  sub_2627852FC(&qword_26A95E3E8, &qword_26A95E3E0);
  unint64_t v51 = sub_262785254();
  uint64_t v11 = sub_26278E3B0();
  uint64_t v13 = v12;
  uint64_t v61 = a1;
  uint64_t v62 = a2;
  swift_bridgeObjectRetain();
  uint64_t v14 = (void *)sub_26278E170();
  id v15 = objc_msgSend(v8, sel_matchesInString_options_range_, v14, 0, v11, v13);

  sub_262785340();
  unint64_t v16 = sub_26278E2D0();

  unint64_t v45 = v16;
  uint64_t v41 = v4;
  if (!(v16 >> 62))
  {
    unint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v17) {
      goto LABEL_7;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    uint64_t v57 = v61;
    uint64_t v58 = v62;
    uint64_t v34 = v39;
    sub_26278DFD0();
    uint64_t v55 = 32;
    unint64_t v56 = 0xE100000000000000;
    sub_2627851AC();
    sub_262785200();
    sub_2627852FC(&qword_26A95E3A8, &qword_26A95E390);
    uint64_t v35 = v41;
    sub_26278E370();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v34, v35);
    swift_bridgeObjectRelease();
    unint64_t v36 = v52;
    sub_26278DC80();
    uint64_t v37 = sub_26278E410();

    (*(void (**)(char *, uint64_t))(v42 + 8))(v36, v53);
    swift_bridgeObjectRelease();
    return v37;
  }
LABEL_21:
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_26278E4F0();
  swift_bridgeObjectRelease();
  if (!v17) {
    goto LABEL_22;
  }
LABEL_7:
  unint64_t v50 = v45 & 0xC000000000000001;
  unint64_t v43 = v45 + 32;
  uint64_t v44 = v45 & 0xFFFFFFFFFFFFFF8;
  uint64_t v46 = (void (**)(char *, uint64_t))(v42 + 8);
  unint64_t v47 = a2;
  uint64_t v48 = a1;
  id v49 = v8;
  while (1)
  {
    if (__OFSUB__(v17--, 1))
    {
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    if (v50)
    {
      id v19 = (id)MEMORY[0x263E532B0](v17, v45);
    }
    else
    {
      if ((v17 & 0x8000000000000000) != 0) {
        goto LABEL_19;
      }
      if (v17 >= *(void *)(v44 + 16)) {
        goto LABEL_20;
      }
      id v19 = *(id *)(v43 + 8 * v17);
    }
    unint64_t v20 = v19;
    objc_msgSend(v19, sel_rangeAtIndex_, 0);
    sub_26278E380();
    if (v21) {
      break;
    }
    id v54 = v20;
    uint64_t v22 = sub_26278E2B0();
    uint64_t v23 = MEMORY[0x263E53000](v22);
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    uint64_t v59 = v23;
    unint64_t v60 = v25;
    uint64_t v26 = v52;
    sub_26278DC70();
    uint64_t v27 = sub_26278E410();
    uint64_t v29 = v28;
    (*v46)(v26, v53);
    uint64_t v59 = v23;
    unint64_t v60 = v25;
    uint64_t v57 = v27;
    uint64_t v58 = v29;
    uint64_t v55 = 0;
    unint64_t v56 = 0xE000000000000000;
    uint64_t v30 = sub_26278E420();
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_26278E380();
    LOBYTE(v29) = v33;
    swift_bridgeObjectRelease();
    if ((v29 & 1) == 0)
    {
      uint64_t v59 = v30;
      unint64_t v60 = v32;
      sub_262785200();
      sub_26278E210();
    }
    swift_bridgeObjectRelease();

    a1 = v48;
    id v8 = v49;
    a2 = v47;
    if (!v17) {
      goto LABEL_22;
    }
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_262784914(void *a1, uint64_t a2, int a3)
{
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E390);
  uint64_t v6 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v34 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = a1;
  uint64_t v39 = a2;
  sub_262785254();
  uint64_t v8 = sub_26278E450();
  uint64_t v9 = *(void *)(v8 + 16);
  uint64_t v32 = v8;
  if (v9)
  {
    uint64_t v10 = a3;
    char v33 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v11 = (uint64_t *)(v8 + 56);
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
    do
    {
      char v21 = (void *)*(v11 - 3);
      uint64_t v20 = *(v11 - 2);
      uint64_t v22 = *(v11 - 1);
      uint64_t v23 = *v11;
      swift_bridgeObjectRetain();
      if (sub_26278E3E0() < v10) {
        goto LABEL_7;
      }
      unint64_t v38 = v21;
      uint64_t v39 = v20;
      uint64_t v40 = v22;
      uint64_t v41 = v23;
      uint64_t v37 = v12;
      uint64_t v13 = v34;
      sub_26278DFD0();
      unint64_t v36 = sub_2627852A8();
      sub_2627852FC(&qword_26A95E3A8, &qword_26A95E390);
      uint64_t v14 = v10;
      uint64_t v15 = v35;
      uint64_t v16 = sub_26278E120();
      unint64_t v17 = v13;
      uint64_t v12 = v37;
      uint64_t v18 = v15;
      uint64_t v10 = v14;
      (*v33)(v17, v18);
      uint64_t v19 = *(void *)(v16 + 16);
      swift_bridgeObjectRelease();
      if (v19)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
LABEL_7:
        uint64_t v24 = MEMORY[0x263E53000](v21, v20, v22, v23);
        uint64_t v26 = v25;
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v12 = sub_262789988(0, v12[2] + 1, 1, v12);
        }
        unint64_t v28 = v12[2];
        unint64_t v27 = v12[3];
        if (v28 >= v27 >> 1) {
          uint64_t v12 = sub_262789988((void *)(v27 > 1), v28 + 1, 1, v12);
        }
        id v12[2] = v28 + 1;
        uint64_t v29 = &v12[2 * v28];
        v29[4] = v24;
        v29[5] = v26;
      }
      v11 += 4;
      --v9;
    }
    while (v9);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  unint64_t v38 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E3D0);
  sub_2627852FC(&qword_26A95E3D8, &qword_26A95E3D0);
  uint64_t v30 = sub_26278E140();
  swift_bridgeObjectRelease();
  return v30;
}

uint64_t sub_262784C58()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E388);
  uint64_t v43 = *(void *)(v0 - 8);
  uint64_t v44 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v42 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E390);
  uint64_t v45 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v39 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v37 - v5;
  uint64_t v7 = sub_2627830B8();
  sub_2627834F8(v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_2627837F4();
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_2627839AC(v8, v10);
  unint64_t v13 = v12;
  swift_bridgeObjectRelease();
  uint64_t v48 = v11;
  unint64_t v49 = v13;
  sub_26278DFD0();
  uint64_t v46 = 32;
  unint64_t v47 = 0xE100000000000000;
  unint64_t v14 = sub_2627851AC();
  unint64_t v15 = sub_262785200();
  sub_2627852FC(&qword_26A95E3A8, &qword_26A95E390);
  uint64_t v37 = v2;
  sub_26278E370();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v45 + 8);
  v45 += 8;
  unint64_t v38 = v16;
  v16(v6, v2);
  swift_bridgeObjectRelease();
  uint64_t v48 = 2621;
  unint64_t v49 = 0xE200000000000000;
  uint64_t v46 = 0;
  unint64_t v47 = 0xE000000000000000;
  sub_262785254();
  uint64_t v17 = sub_26278E420();
  unint64_t v19 = v18;
  uint64_t v20 = v39;
  sub_26278DFD0();
  uint64_t v48 = v17;
  unint64_t v49 = v19;
  unint64_t v40 = v15;
  unint64_t v41 = v14;
  uint64_t v21 = v37;
  sub_26278E360();
  swift_bridgeObjectRelease();
  sub_26278E430();
  uint64_t v23 = v22;
  v38(v20, v21);
  swift_bridgeObjectRelease();
  if (v23) {
    swift_bridgeObjectRelease();
  }
  uint64_t v24 = sub_262783D68();
  unint64_t v26 = v25;
  swift_bridgeObjectRelease();
  uint64_t v48 = v24;
  unint64_t v49 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E3B8);
  unint64_t v27 = v42;
  sub_26278DFD0();
  uint64_t v46 = 10;
  unint64_t v47 = 0xE100000000000000;
  sub_2627852FC(&qword_26A95E3C0, &qword_26A95E388);
  uint64_t v28 = v44;
  sub_26278E370();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v27, v28);
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_2627830B8();
  unint64_t v31 = v30;
  swift_bridgeObjectRelease();
  uint64_t v32 = (void *)sub_2627842B4(v29, v31);
  uint64_t v34 = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = sub_262784914(v32, v34, 5);
  swift_bridgeObjectRelease();
  return v35;
}

unint64_t sub_2627851AC()
{
  unint64_t result = qword_26A95E398;
  if (!qword_26A95E398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95E398);
  }
  return result;
}

unint64_t sub_262785200()
{
  unint64_t result = qword_26A95E3A0;
  if (!qword_26A95E3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95E3A0);
  }
  return result;
}

unint64_t sub_262785254()
{
  unint64_t result = qword_26A95E3B0;
  if (!qword_26A95E3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95E3B0);
  }
  return result;
}

unint64_t sub_2627852A8()
{
  unint64_t result = qword_26A95E3C8;
  if (!qword_26A95E3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95E3C8);
  }
  return result;
}

uint64_t sub_2627852FC(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_262785340()
{
  unint64_t result = qword_26A95E3F0;
  if (!qword_26A95E3F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A95E3F0);
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

uint64_t sub_2627853E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E400);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_26278544C()
{
  unint64_t result = qword_26A95E410;
  if (!qword_26A95E410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95E410);
  }
  return result;
}

uint64_t sub_2627854A0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_262782720(a1, a2);
  }
  return a1;
}

uint64_t sub_2627854B4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_26278025C(a1, a2);
  }
  return a1;
}

unint64_t sub_2627854C8()
{
  unint64_t result = qword_26A95E328;
  if (!qword_26A95E328)
  {
    type metadata accessor for DocumentReadingOptionKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95E328);
  }
  return result;
}

unint64_t sub_262785520(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E520);
  uint64_t v2 = sub_26278E520();
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
    sub_26278D9EC(v6, (uint64_t)&v13, &qword_26A95E528);
    uint64_t v7 = v13;
    unint64_t result = sub_262789D58(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_26278DA50(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_262785650(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E4D0);
  uint64_t v2 = (void *)sub_26278E520();
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
    unint64_t result = sub_262789DEC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
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

uint64_t MessageExtractor.init(lastDays:maxMessages:maxLength:cleanupText:lastMessageDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  BOOL v12 = (int *)type metadata accessor for MessageExtractor();
  *(void *)(a6 + v12[12]) = 0;
  *(void *)(a6 + v12[13]) = MEMORY[0x263F8EE78];
  *(void *)a6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3B160]), sel_init);
  id v13 = objc_allocWithZone(MEMORY[0x263F3B158]);
  v17[4] = sub_2627896E4;
  v17[5] = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = sub_2627896E8;
  v17[3] = &block_descriptor;
  long long v14 = _Block_copy(v17);
  id v15 = objc_msgSend(v13, sel_initWithBuilder_, v14);
  _Block_release(v14);
  swift_release();
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a6 + 8) = v15;
    *(void *)(a6 + 16) = 49;
    *(void *)(a6 + 24) = a1;
    *(void *)(a6 + 32) = a2;
    *(void *)(a6 + 40) = a3;
    *(unsigned char *)(a6 + 48) = a4 & 1;
    return sub_262789754(a5, a6 + v12[11]);
  }
  return result;
}

uint64_t type metadata accessor for MessageExtractor()
{
  uint64_t result = qword_26A95E498;
  if (!qword_26A95E498) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_262785938(void *a1)
{
  objc_msgSend(a1, sel_setRequestedRepresentation_, *MEMORY[0x263F3B120]);
  objc_msgSend(a1, sel_setNetworkUsage_, 1);
  objc_msgSend(a1, sel_setRequestAllHeaders_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E538);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_26278EB90;
  uint64_t v3 = (void *)*MEMORY[0x263F3B1D8];
  *(void *)(v2 + 32) = *MEMORY[0x263F3B1D8];
  type metadata accessor for ECMessageHeaderKey(0);
  id v4 = v3;
  id v5 = (id)sub_26278E2C0();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setRequestedHeaderKeys_, v5);
}

uint64_t MessageExtractor.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  return sub_2627897BC(v1, a1);
}

uint64_t MessageExtractor.isDataAccessible()()
{
  v1[18] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E438);
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_262785B00, 0, 0);
}

uint64_t sub_262785B00()
{
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 152);
  id v4 = objc_msgSend(**(id **)(v0 + 144), sel_messageRepository);
  *(void *)(v0 + 176) = v4;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 184;
  *(void *)(v0 + 24) = sub_262785C9C;
  swift_continuation_init();
  *(void *)(v0 + 136) = v3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 112));
  sub_26278E310();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v2 + 32))(boxed_opaque_existential_1, v1, v3);
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 1107296256;
  *(void *)(v0 + 96) = sub_262785DEC;
  *(void *)(v0 + 104) = &block_descriptor_3;
  objc_msgSend(v4, sel_isDataAccessible_, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_262785C9C()
{
  return MEMORY[0x270FA2498](sub_262785D7C, 0, 0);
}

uint64_t sub_262785D7C()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 184);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_262785DEC(uint64_t a1)
{
  return sub_26278E330();
}

uint64_t sub_262785E44()
{
  v1[19] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E4E0);
  v1[20] = v2;
  v1[21] = *(void *)(v2 - 8);
  v1[22] = swift_task_alloc();
  uint64_t v3 = sub_26278DDD0();
  v1[23] = v3;
  v1[24] = *(void *)(v3 - 8);
  v1[25] = swift_task_alloc();
  uint64_t v4 = sub_26278DDE0();
  v1[26] = v4;
  v1[27] = *(void *)(v4 - 8);
  v1[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E428);
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  uint64_t v5 = sub_26278DDA0();
  v1[31] = v5;
  v1[32] = *(void *)(v5 - 8);
  v1[33] = swift_task_alloc();
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_262786090, 0, 0);
}

uint64_t sub_262786090()
{
  uint64_t v2 = v0[24];
  uint64_t v1 = v0[25];
  uint64_t v3 = v0[23];
  uint64_t v4 = v0[19];
  id v5 = objc_msgSend(self, sel_currentCalendar);
  sub_26278DDB0();

  uint64_t v6 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F07870], v3);
  if (__OFSUB__(0, *(void *)(v4 + 24)))
  {
    __break(1u);
    return MEMORY[0x270FA23F0](v6);
  }
  uint64_t v7 = v0[36];
  uint64_t v8 = v0[31];
  uint64_t v9 = v0[32];
  uint64_t v10 = v0[30];
  uint64_t v12 = v0[27];
  uint64_t v11 = v0[28];
  uint64_t v13 = v0[25];
  uint64_t v14 = v0[24];
  uint64_t v51 = v0[23];
  uint64_t v54 = v0[26];
  sub_26278DD90();
  sub_26278DDC0();
  id v15 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v0[38] = v15;
  v0[39] = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  unint64_t v49 = v15;
  v15(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v51);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v54);
  uint64_t v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v16(v10, 1, v8) != 1)
  {
    uint64_t v19 = v0[37];
    uint64_t v20 = v0[35];
    uint64_t v21 = v0[31];
    uint64_t v22 = v0[32];
    uint64_t v23 = v0[29];
    uint64_t v24 = v0[19];
    uint64_t v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32);
    v52(v19, v0[30], v21);
    uint64_t v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16);
    v48(v20, v19, v21);
    uint64_t v25 = type metadata accessor for MessageExtractor();
    sub_26278D9EC(v24 + *(int *)(v25 + 44), v23, &qword_26A95E428);
    if (v16(v23, 1, v21) == 1)
    {
      sub_26277E9C4(v0[29], &qword_26A95E428);
    }
    else
    {
      uint64_t v26 = v0[37];
      uint64_t v28 = v0[34];
      uint64_t v27 = v0[35];
      uint64_t v29 = v0[33];
      uint64_t v30 = v0[31];
      v52(v28, v0[29], v30);
      sub_26278D968(&qword_26A95E508, MEMORY[0x263F07490]);
      if (sub_26278E150()) {
        uint64_t v31 = v28;
      }
      else {
        uint64_t v31 = v26;
      }
      v48(v29, v31, v30);
      v49(v28, v30);
      v49(v27, v30);
      v52(v27, v29, v30);
    }
    uint64_t v50 = v0[22];
    uint64_t v32 = v0[20];
    uint64_t v53 = v0[21];
    uint64_t v33 = v0[19];
    uint64_t v34 = self;
    uint64_t v35 = (void *)sub_26278DD60();
    id v36 = objc_msgSend(v34, sel_predicateForMessagesNewerThanDate_, v35);
    v0[40] = v36;

    id v37 = objc_msgSend(v34, sel_sortDescriptorForDateAscending_, 0);
    v0[41] = v37;
    sub_26278D9B0(0, &qword_26A95E4E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E4F0);
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_26278F2E0;
    *(void *)(v38 + 32) = v37;
    sub_26278E2E0();
    id v39 = objc_allocWithZone(MEMORY[0x263F3B1A0]);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    sub_26278D9B0(0, &qword_26A95E4F8);
    id v41 = v36;
    id v42 = v37;
    uint64_t v43 = (void *)sub_26278E2C0();
    swift_bridgeObjectRelease();
    id v44 = objc_msgSend(v39, sel_initWithTargetClass_predicate_sortDescriptors_, ObjCClassFromMetadata, v41, v43);
    v0[42] = v44;

    id v45 = objc_msgSend(*(id *)v33, sel_messageRepository);
    v0[43] = v45;
    uint64_t v46 = *(void *)(v33 + 32);
    v0[2] = v0;
    v0[7] = v0 + 18;
    v0[3] = sub_262786724;
    swift_continuation_init();
    v0[17] = v32;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E500);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E4B0);
    sub_26278E310();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v53 + 32))(boxed_opaque_existential_1, v50, v32);
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 1107296256;
    v0[12] = sub_262786A9C;
    v0[13] = &block_descriptor_15;
    objc_msgSend(v45, sel_performQuery_limit_completionHandler_, v44, v46);
    uint64_t v6 = (uint64_t)(v0 + 2);
    return MEMORY[0x270FA23F0](v6);
  }
  sub_26277E9C4(v0[30], &qword_26A95E428);
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
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17(0);
}

uint64_t sub_262786724()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 352) = v1;
  if (v1) {
    uint64_t v2 = sub_262786960;
  }
  else {
    uint64_t v2 = sub_262786834;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_262786834()
{
  uint64_t v1 = *(void **)(v0 + 344);
  uint64_t v3 = *(void **)(v0 + 320);
  uint64_t v2 = *(void **)(v0 + 328);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
  uint64_t v5 = *(void *)(v0 + 296);
  uint64_t v6 = *(void *)(v0 + 280);
  uint64_t v7 = *(void *)(v0 + 248);

  v4(v6, v7);
  v4(v5, v7);
  uint64_t v10 = *(void *)(v0 + 144);

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
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v8(v10);
}

uint64_t sub_262786960()
{
  uint64_t v1 = (void *)v0[44];
  uint64_t v3 = (void *)v0[41];
  uint64_t v2 = (void *)v0[42];
  uint64_t v4 = (void *)v0[40];
  uint64_t v5 = (void (*)(uint64_t, uint64_t))v0[38];
  uint64_t v10 = v0[37];
  uint64_t v11 = (void *)v0[43];
  uint64_t v6 = v0[35];
  uint64_t v7 = v0[31];
  swift_willThrow();

  v5(v6, v7);
  v5(v10, v7);

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
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8(0);
}

void sub_262786A9C(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a3)
  {
    id v4 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E4E0);
    sub_26278E320();
  }
  else
  {
    sub_26278D9B0(0, &qword_26A95E510);
    sub_26278E2D0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E4E0);
    sub_26278E330();
  }
}

uint64_t MessageExtractor.next()(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  sub_26278DDA0();
  v2[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_262786BE8, 0, 0);
}

uint64_t sub_262786BE8()
{
  sub_26278E340();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_262786CCC;
  return MessageExtractor.isDataAccessible()();
}

uint64_t sub_262786CCC(char a1)
{
  *(unsigned char *)(*(void *)v1 + 140) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_262786DCC, 0, 0);
}

uint64_t sub_262786DCC()
{
  if (*(unsigned char *)(v0 + 140) != 1)
  {
LABEL_16:
    uint64_t v21 = *(void *)(v0 + 56);
    uint64_t v22 = sub_26278DFA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
    swift_task_dealloc();
    uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
    return v23();
  }
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = type metadata accessor for MessageExtractor();
  *(void *)(v0 + 88) = v2;
  uint64_t v10 = *(int *)(v2 + 48);
  *(_DWORD *)(v0 + 136) = v10;
  uint64_t v11 = *(void *)(v1 + v10);
  if (v11)
  {
    unint64_t v12 = *(void *)(v1 + *(int *)(v2 + 52));
    if (v12 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_26278E4F0();
      uint64_t v2 = swift_bridgeObjectRelease();
      if (v11 < v20)
      {
LABEL_5:
        if ((v12 & 0xC000000000000001) == 0)
        {
          if (v11 < 0)
          {
            __break(1u);
          }
          else if ((unint64_t)v11 < *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v13 = *(id *)(v12 + 8 * v11 + 32);
            goto LABEL_9;
          }
          __break(1u);
          return MEMORY[0x270FA2318](v2, v3, v4, v5, v6, v7, v8, v9);
        }
        id v13 = (id)MEMORY[0x263E532B0](v11, v12);
LABEL_9:
        id v14 = v13;
        *(void *)(v0 + 112) = v13;
        uint64_t v15 = *(void *)(v0 + 64);
        uint64_t v16 = swift_task_alloc();
        *(void *)(v0 + 120) = v16;
        *(void *)(v16 + 16) = v14;
        *(void *)(v16 + 24) = v15;
        uint64_t v17 = (void *)swift_task_alloc();
        *(void *)(v0 + 128) = v17;
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E448);
        void *v17 = v0;
        v17[1] = sub_26278751C;
        uint64_t v7 = sub_262789D18;
        uint64_t v2 = v0 + 16;
        uint64_t v3 = 0;
        uint64_t v4 = 0;
        uint64_t v5 = 0x29287478656ELL;
        unint64_t v6 = 0xE600000000000000;
        uint64_t v8 = v16;
        return MEMORY[0x270FA2318](v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
    else if (v11 < *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
  unint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v18;
  *unint64_t v18 = v0;
  v18[1] = sub_26278707C;
  return sub_262785E44();
}

uint64_t sub_26278707C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 104) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_26278717C, 0, 0);
}

uint64_t sub_26278717C()
{
  uint64_t v1 = *(void *)(v0 + 104);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 64);
    uint64_t v3 = *(int *)(*(void *)(v0 + 88) + 52);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v2 + v3) = v1;
    if (qword_26A95E230 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_26278E050();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A95F1D0);
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_26278E030();
    os_log_type_t v6 = sub_26278E390();
    if (os_log_type_enabled(v5, v6))
    {
      unint64_t v7 = *(void *)(v0 + 104);
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 134217984;
      if (v7 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v9 = sub_26278E4F0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      *(void *)(v0 + 48) = v9;
      sub_26278E400();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_26277C000, v5, v6, "Queried %ld messages.", v8, 0xCu);
      MEMORY[0x263E538B0](v8, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v18 = *(void *)(v0 + 64);
    uint64_t v19 = *(void *)(v18 + *(int *)(v0 + 136));
    unint64_t v20 = *(void *)(v18 + *(int *)(*(void *)(v0 + 88) + 52));
    if (v20 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_26278E4F0();
      uint64_t v10 = swift_bridgeObjectRelease();
      if (v19 < v26)
      {
LABEL_11:
        if ((v20 & 0xC000000000000001) == 0)
        {
          if (v19 < 0)
          {
            __break(1u);
          }
          else if ((unint64_t)v19 < *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v21 = *(id *)(v20 + 8 * v19 + 32);
            goto LABEL_15;
          }
          __break(1u);
          return MEMORY[0x270FA2318](v10, v11, v12, v13, v14, v15, v16, v17);
        }
        id v21 = (id)MEMORY[0x263E532B0](v19, v20);
LABEL_15:
        id v22 = v21;
        *(void *)(v0 + 112) = v21;
        uint64_t v23 = *(void *)(v0 + 64);
        uint64_t v24 = swift_task_alloc();
        *(void *)(v0 + 120) = v24;
        *(void *)(v24 + 16) = v22;
        *(void *)(v24 + 24) = v23;
        uint64_t v25 = (void *)swift_task_alloc();
        *(void *)(v0 + 128) = v25;
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E448);
        *uint64_t v25 = v0;
        v25[1] = sub_26278751C;
        uint64_t v15 = sub_262789D18;
        uint64_t v10 = v0 + 16;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = 0x29287478656ELL;
        unint64_t v14 = 0xE600000000000000;
        uint64_t v16 = v24;
        return MEMORY[0x270FA2318](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    else if (v19 < *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_11;
    }
  }
  uint64_t v27 = *(void *)(v0 + 56);
  uint64_t v28 = sub_26278DFA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v27, 1, 1, v28);
  swift_task_dealloc();
  uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
  return v29();
}

uint64_t sub_26278751C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_262787634, 0, 0);
}

uint64_t sub_262787634()
{
  if (!*(void *)(v0 + 24))
  {
    if (qword_26A95E230 == -1)
    {
LABEL_5:
      uint64_t v3 = sub_26278E050();
      __swift_project_value_buffer(v3, (uint64_t)qword_26A95F1D0);
      uint64_t v4 = sub_26278E030();
      os_log_type_t v5 = sub_26278E3A0();
      if (os_log_type_enabled(v4, v5))
      {
        os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v6 = 0;
        _os_log_impl(&dword_26277C000, v4, v5, "Failed to extract message content. Terminated extraction loop.", v6, 2u);
        MEMORY[0x263E538B0](v6, -1, -1);
        unint64_t v7 = *(NSObject **)(v0 + 112);
      }
      else
      {
        unint64_t v7 = v4;
        uint64_t v4 = *(NSObject **)(v0 + 112);
      }
      uint64_t v25 = *(void *)(v0 + 56);

      uint64_t v26 = sub_26278DFA0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 1, 1, v26);
      goto LABEL_15;
    }
LABEL_19:
    swift_once();
    goto LABEL_5;
  }
  id v1 = objc_msgSend(*(id *)(v0 + 112), sel_senderAddress);
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_stringValue);
    swift_unknownObjectRelease();
    sub_26278E1A0();
  }
  id v8 = objc_msgSend(*(id *)(v0 + 112), sel_subject);
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = objc_msgSend(v8, sel_subjectString);

    sub_26278E1A0();
  }
  uint64_t v11 = *(int *)(v0 + 136);
  uint64_t v12 = *(void *)(v0 + 64);
  uint64_t v13 = self;
  unint64_t v14 = (void *)sub_26278E170();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v13, sel_snippetFromHTMLBody_options_maxLength_preservingQuotedForwardedContent_, v14, *(void *)(v12 + 16), *(void *)(v12 + 40), 0);

  sub_26278E1A0();
  uint64_t v16 = *(void *)(v12 + v11);
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v19 = *(void **)(v0 + 112);
  uint64_t v20 = *(void *)(v0 + 64);
  *(void *)(v20 + *(int *)(v0 + 136)) = v18;
  id v21 = objc_msgSend(v19, sel_date);
  sub_26278DD80();

  if (*(unsigned char *)(v20 + 48) == 1)
  {
    sub_262784C58();
    swift_bridgeObjectRelease();
  }
  id v22 = *(void **)(v0 + 112);
  uint64_t v23 = *(void *)(v0 + 56);
  objc_msgSend(v22, sel_conversationID);
  sub_26278DF80();

  uint64_t v24 = sub_26278DFA0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 0, 1, v24);
LABEL_15:
  swift_task_dealloc();
  uint64_t v27 = *(uint64_t (**)(void))(v0 + 8);
  return v27();
}

void sub_262787A28(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E530);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = *(void **)(a3 + 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_26278DAF4;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_262787F94;
  aBlock[3] = &block_descriptor_18;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = v9;
  swift_release();
  id v14 = objc_msgSend(a2, sel_requestRepresentationWithOptions_completionHandler_, v13, v12);
  _Block_release(v12);
}

void sub_262787BFC(void *a1)
{
  uint64_t v2 = sub_26278E1E0();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E338);
  MEMORY[0x270FA5388](v3 - 8);
  os_log_type_t v5 = &v25[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_26278DD10();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v10 = &v25[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v25[-v11];
  if (!a1)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E530);
    sub_26278E330();
    return;
  }
  id v13 = a1;
  id v14 = objc_msgSend(v13, sel_contentURL);
  if (v14)
  {
    id v15 = v14;
    sub_26278DD00();

    uint64_t v16 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 32);
    v16(v5, v10, v6);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      v16(v12, v5, v6);
      sub_26278E1D0();
      uint64_t v17 = sub_26278E160();
      uint64_t v19 = v18;
      id v20 = objc_msgSend(v13, sel_requestedHeaders);
      id v21 = v20;
      if (v20)
      {
        id v22 = objc_msgSend(v20, sel_firstHeaderForKey_, *MEMORY[0x263F3B1D8]);

        if (v22)
        {
          id v21 = (void *)sub_26278E1A0();
          uint64_t v24 = v23;

LABEL_14:
          *(void *)&long long v26 = v17;
          *((void *)&v26 + 1) = v19;
          *(void *)&long long v27 = v21;
          *((void *)&v27 + 1) = v24;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E530);
          sub_26278E330();

          (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
          return;
        }
        id v21 = 0;
      }
      uint64_t v24 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  sub_26277E9C4((uint64_t)v5, &qword_26A95E338);
  long long v26 = 0u;
  long long v27 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E530);
  sub_26278E330();
}

void sub_262787F94(uint64_t a1, void *a2, void *a3)
{
  os_log_type_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_262788020@<X0>(uint64_t a1@<X8>)
{
  return sub_26278D79C(v1, a1);
}

uint64_t sub_26278802C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2627880C4;
  return MessageExtractor.next()(a1);
}

uint64_t sub_2627880C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2627881B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[3] = a2;
  id v6 = (void *)swift_task_alloc();
  v4[6] = v6;
  void *v6 = v4;
  v6[1] = sub_262788258;
  return MessageExtractor.next()(a1);
}

uint64_t sub_262788258()
{
  uint64_t v2 = (void *)*v1;
  v2[7] = v0;
  swift_task_dealloc();
  if (v0)
  {
    if (v2[3])
    {
      swift_getObjectType();
      uint64_t v3 = sub_26278E300();
      uint64_t v5 = v4;
    }
    else
    {
      uint64_t v3 = 0;
      uint64_t v5 = 0;
    }
    return MEMORY[0x270FA2498](sub_2627883C8, v3, v5);
  }
  else
  {
    id v6 = (uint64_t (*)(void))v2[1];
    return v6();
  }
}

uint64_t sub_2627883C8()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = (void *)v0[5];
  v0[2] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E4B0);
  swift_willThrowTypedImpl();
  void *v2 = v1;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

Swift::String __swiftcall joinMessages(_:)(Swift::OpaquePointer a1)
{
  uint64_t v2 = sub_26278DFA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (void *)MEMORY[0x263F8EE78];
  id v7 = (void *)sub_262785650(MEMORY[0x263F8EE78]);
  uint64_t v8 = *((void *)a1._rawValue + 2);
  if (!v8)
  {
LABEL_30:
    uint64_t v55 = (uint64_t)v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E3D0);
    sub_2627852FC(&qword_26A95E3D8, &qword_26A95E3D0);
    uint64_t v41 = sub_26278E140();
    uint64_t v43 = v42;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v44 = v41;
    id v45 = v43;
    goto LABEL_34;
  }
  unint64_t v10 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  uint64_t v9 = v3 + 16;
  uint64_t v11 = (char *)a1._rawValue
      + ((*(unsigned __int8 *)(v9 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 64));
  uint64_t v50 = *(void *)(v9 + 56);
  uint64_t v51 = v10;
  unint64_t v49 = (void (**)(char *, uint64_t))(v9 - 8);
  v47[1] = a1._rawValue;
  swift_bridgeObjectRetain();
  uint64_t v53 = v5;
  v47[2] = v9;
  uint64_t v48 = v2;
  while (1)
  {
    v51(v5, v11, v2);
    uint64_t v12 = sub_26278DF90();
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    uint64_t v15 = HIBYTE(v14) & 0xF;
    if ((v14 & 0x2000000000000000) == 0) {
      uint64_t v15 = v12 & 0xFFFFFFFFFFFFLL;
    }
    if (v15)
    {
      sub_26278DF90();
      uint64_t v16 = sub_26278E1F0();
      uint64_t v18 = v17;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = 0xE700000000000000;
      uint64_t v16 = 0x6E776F6E6B6E75;
    }
    uint64_t v19 = v7[2];
    uint64_t v52 = v6;
    if (v19)
    {
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_262789DEC(v16, v18);
      if (v21)
      {
        uint64_t v22 = *(void *)(v7[7] + 8 * v20);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v22 = v7[2];
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v55 = (uint64_t)v7;
    unint64_t v25 = sub_262789DEC(v16, v18);
    uint64_t v26 = v7[2];
    BOOL v27 = (v24 & 1) == 0;
    uint64_t v28 = v26 + v27;
    if (__OFADD__(v26, v27)) {
      break;
    }
    char v29 = v24;
    if (v7[3] >= v28)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        id v7 = (void *)v55;
        if (v24) {
          goto LABEL_20;
        }
      }
      else
      {
        sub_26278A764();
        id v7 = (void *)v55;
        if (v29) {
          goto LABEL_20;
        }
      }
    }
    else
    {
      sub_26278A1A0(v28, isUniquelyReferenced_nonNull_native);
      unint64_t v30 = sub_262789DEC(v16, v18);
      if ((v29 & 1) != (v31 & 1)) {
        goto LABEL_33;
      }
      unint64_t v25 = v30;
      id v7 = (void *)v55;
      if (v29)
      {
LABEL_20:
        *(void *)(v7[7] + 8 * v25) = v22;
        goto LABEL_24;
      }
    }
    v7[(v25 >> 6) + 8] |= 1 << v25;
    uint64_t v32 = (uint64_t *)(v7[6] + 16 * v25);
    *uint64_t v32 = v16;
    v32[1] = v18;
    *(void *)(v7[7] + 8 * v25) = v22;
    uint64_t v33 = v7[2];
    BOOL v34 = __OFADD__(v33, 1);
    uint64_t v35 = v33 + 1;
    if (v34) {
      goto LABEL_32;
    }
    v7[2] = v35;
    swift_bridgeObjectRetain();
LABEL_24:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v54 = v22;
    uint64_t v55 = 0x207265646E6553;
    unint64_t v56 = 0xE700000000000000;
    sub_26278E560();
    sub_26278E250();
    swift_bridgeObjectRelease();
    sub_26278E250();
    sub_26278DF60();
    sub_26278E250();
    swift_bridgeObjectRelease();
    uint64_t v36 = v55;
    unint64_t v37 = v56;
    id v6 = v52;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v6 = sub_262789988(0, v6[2] + 1, 1, v6);
    }
    uint64_t v2 = v48;
    unint64_t v39 = v6[2];
    unint64_t v38 = v6[3];
    if (v39 >= v38 >> 1) {
      id v6 = sub_262789988((void *)(v38 > 1), v39 + 1, 1, v6);
    }
    v6[2] = v39 + 1;
    unint64_t v40 = &v6[2 * v39];
    v40[4] = v36;
    v40[5] = v37;
    uint64_t v5 = v53;
    (*v49)(v53, v2);
    v11 += v50;
    if (!--v8)
    {
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  uint64_t v44 = sub_26278E5A0();
  __break(1u);
LABEL_34:
  result._object = v45;
  result._countAndFlagsBits = v44;
  return result;
}

uint64_t groupAndSortMessages(_:)(uint64_t a1)
{
  uint64_t v2 = sub_26278DFA0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v50 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v42 - v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    unint64_t v10 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
    uint64_t v9 = v3 + 16;
    unint64_t v49 = v10;
    unint64_t v46 = (*(unsigned __int8 *)(v9 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 64);
    uint64_t v11 = (char *)(a1 + v46);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v44 = (void (**)(unint64_t, char *, uint64_t))(v9 + 16);
    uint64_t v45 = v12;
    uint64_t v42 = a1;
    uint64_t v43 = (void (**)(char *, uint64_t))(v9 - 8);
    swift_bridgeObjectRetain();
    unint64_t v13 = 0;
    unint64_t v14 = (void *)MEMORY[0x263F8EE80];
    uint64_t v15 = v50;
    uint64_t v47 = v2;
    uint64_t v48 = v7;
    while (1)
    {
      uint64_t v16 = v49;
      v49(v7, v11, v2);
      uint64_t v17 = sub_26278DF50();
      uint64_t v18 = v2;
      uint64_t v19 = v9;
      v16(v15, v7, v18);
      sub_26278CB28((uint64_t)v13);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v51 = v14;
      unint64_t v22 = sub_262789E64(v17);
      uint64_t v23 = v14[2];
      BOOL v24 = (v21 & 1) == 0;
      uint64_t v25 = v23 + v24;
      if (__OFADD__(v23, v24)) {
        break;
      }
      char v26 = v21;
      if (v14[3] >= v25)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_26278A914();
          unint64_t v14 = v51;
        }
      }
      else
      {
        sub_26278A4AC(v25, isUniquelyReferenced_nonNull_native);
        unint64_t v14 = v51;
        unint64_t v27 = sub_262789E64(v17);
        if ((v26 & 1) != (v28 & 1)) {
          goto LABEL_26;
        }
        unint64_t v22 = v27;
      }
      swift_bridgeObjectRelease();
      if (v26)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        v14[(v22 >> 6) + 8] |= 1 << v22;
        *(void *)(v14[6] + 8 * v22) = v17;
        *(void *)(v14[7] + 8 * v22) = MEMORY[0x263F8EE78];
        uint64_t v29 = v14[2];
        uint64_t v30 = v29 + 1;
        BOOL v31 = __OFADD__(v29, 1);
        swift_bridgeObjectRetain();
        if (v31) {
          goto LABEL_25;
        }
        v14[2] = v30;
      }
      uint64_t v32 = v14[7];
      swift_bridgeObjectRelease();
      unint64_t v33 = *(void *)(v32 + 8 * v22);
      char v34 = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v32 + 8 * v22) = v33;
      if ((v34 & 1) == 0)
      {
        unint64_t v33 = sub_262789A98(0, *(void *)(v33 + 16) + 1, 1, v33, &qword_26A95E478, MEMORY[0x263F88120], MEMORY[0x263F88120]);
        *(void *)(v32 + 8 * v22) = v33;
      }
      unint64_t v36 = *(void *)(v33 + 16);
      unint64_t v35 = *(void *)(v33 + 24);
      if (v36 >= v35 >> 1)
      {
        unint64_t v33 = sub_262789A98(v35 > 1, v36 + 1, 1, v33, &qword_26A95E478, MEMORY[0x263F88120], MEMORY[0x263F88120]);
        *(void *)(v32 + 8 * v22) = v33;
      }
      uint64_t v9 = v19;
      *(void *)(v33 + 16) = v36 + 1;
      uint64_t v37 = v45;
      uint64_t v15 = v50;
      uint64_t v2 = v47;
      (*v44)(v33 + v46 + v36 * v45, v50, v47);
      id v7 = v48;
      (*v43)(v48, v2);
      v11 += v37;
      unint64_t v13 = sub_262788D1C;
      if (!--v8)
      {
        swift_bridgeObjectRelease();
        unint64_t v38 = sub_262788D1C;
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    uint64_t result = sub_26278E5A0();
    __break(1u);
  }
  else
  {
    unint64_t v38 = 0;
LABEL_23:
    uint64_t v39 = swift_bridgeObjectRetain();
    uint64_t v40 = sub_262788D2C(v39);
    swift_bridgeObjectRelease_n();
    sub_26278CB28((uint64_t)v38);
    return v40;
  }
  return result;
}

void sub_262788D1C(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
}

uint64_t sub_262788D2C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v31 = sub_26278DFC0();
  uint64_t v4 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (!v7) {
    return v8;
  }
  uint64_t v35 = MEMORY[0x263F8EE78];
  sub_26278C5FC(0, v7, 0);
  uint64_t v8 = v35;
  uint64_t v10 = sub_26278C880(a1);
  uint64_t v11 = 0;
  uint64_t v12 = a1 + 64;
  uint64_t v29 = v4 + 32;
  uint64_t v30 = a1;
  uint64_t v25 = a1 + 80;
  int64_t v26 = v7;
  uint64_t v27 = v9;
  uint64_t v28 = a1 + 64;
  while ((v10 & 0x8000000000000000) == 0 && v10 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v16 = (unint64_t)v10 >> 6;
    if ((*(void *)(v12 + 8 * ((unint64_t)v10 >> 6)) & (1 << v10)) == 0) {
      goto LABEL_24;
    }
    if (*(_DWORD *)(a1 + 36) != v9) {
      goto LABEL_25;
    }
    uint64_t v32 = v11;
    v34._rawValue = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain_n();
    sub_26278AAB8(&v34);
    uint64_t v33 = v2;
    if (v2) {
      goto LABEL_29;
    }
    joinMessages(_:)(v34);
    sub_26278DFB0();
    swift_bridgeObjectRelease();
    uint64_t v35 = v8;
    unint64_t v18 = *(void *)(v8 + 16);
    unint64_t v17 = *(void *)(v8 + 24);
    if (v18 >= v17 >> 1)
    {
      sub_26278C5FC(v17 > 1, v18 + 1, 1);
      uint64_t v8 = v35;
    }
    *(void *)(v8 + 16) = v18 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v18, v6, v31);
    a1 = v30;
    int64_t v13 = 1 << *(unsigned char *)(v30 + 32);
    if (v10 >= v13) {
      goto LABEL_26;
    }
    uint64_t v12 = v28;
    uint64_t v19 = *(void *)(v28 + 8 * v16);
    if ((v19 & (1 << v10)) == 0) {
      goto LABEL_27;
    }
    LODWORD(v9) = v27;
    if (*(_DWORD *)(v30 + 36) != v27) {
      goto LABEL_28;
    }
    unint64_t v20 = v19 & (-2 << (v10 & 0x3F));
    if (v20)
    {
      int64_t v13 = __clz(__rbit64(v20)) | v10 & 0xFFFFFFFFFFFFFFC0;
      uint64_t v14 = v32;
      uint64_t v2 = v33;
      int64_t v15 = v26;
    }
    else
    {
      unint64_t v21 = v16 + 1;
      unint64_t v22 = (unint64_t)(v13 + 63) >> 6;
      uint64_t v14 = v32;
      uint64_t v2 = v33;
      int64_t v15 = v26;
      if (v16 + 1 < v22)
      {
        unint64_t v23 = *(void *)(v28 + 8 * v21);
        if (v23)
        {
LABEL_21:
          int64_t v13 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v16)
          {
            unint64_t v23 = *(void *)(v25 + 8 * v16++);
            if (v23)
            {
              unint64_t v21 = v16 + 1;
              goto LABEL_21;
            }
          }
        }
      }
    }
    uint64_t v11 = v14 + 1;
    uint64_t v10 = v13;
    if (v11 == v15) {
      return v8;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t filterBySender(_:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E458);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26278E010();
  sub_26278DF90();
  uint64_t v4 = sub_26278E1F0();
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  v9[1] = v4;
  v9[2] = v6;
  sub_26278CB38();
  sub_2627852FC(&qword_26A95E468, &qword_26A95E458);
  char v7 = sub_26278E130();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v7 & 1;
}

unint64_t convertSingleMessagesToConversations(_:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E470);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_26278DFC0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v33 = (char *)v31 - v10;
  uint64_t v47 = sub_26278DFA0();
  MEMORY[0x270FA5388](v47);
  int64_t v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v35 = v5;
  unint64_t v16 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 16);
  uint64_t v15 = v11 + 16;
  uint64_t v17 = *(unsigned __int8 *)(v15 + 64);
  uint64_t v18 = (v17 + 32) & ~v17;
  uint64_t v19 = (char *)(a1 + v18);
  uint64_t v20 = *(void *)(v15 + 56);
  uint64_t v43 = v18;
  uint64_t v44 = v16;
  uint64_t v41 = v20 + v18;
  uint64_t v42 = v20;
  uint64_t v39 = (void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  uint64_t v40 = v17 | 7;
  uint64_t v45 = v15;
  uint64_t v37 = (unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  unint64_t v38 = (void (**)(char *, uint64_t))(v15 - 8);
  v31[1] = a1;
  uint64_t v32 = v6;
  unint64_t v36 = (void (**)(char *, char *, uint64_t))(v6 + 32);
  swift_bridgeObjectRetain();
  unint64_t v21 = MEMORY[0x263F8EE78];
  long long v34 = xmmword_26278EB90;
  unint64_t v46 = v9;
  do
  {
    uint64_t v22 = v47;
    unint64_t v23 = v44;
    v44((uint64_t)v13, v19, v47);
    sub_26278DF50();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E478);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = v34;
    v23(v24 + v43, v13, v22);
    sub_26278DF60();
    sub_26278DFB0();
    uint64_t v25 = v35;
    (*v39)(v4, 0, 1, v35);
    (*v38)(v13, v22);
    if ((*v37)(v4, 1, v25) == 1)
    {
      sub_26277E9C4((uint64_t)v4, &qword_26A95E470);
    }
    else
    {
      int64_t v26 = *v36;
      uint64_t v27 = v33;
      (*v36)(v33, v4, v25);
      v26(v46, v27, v25);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v21 = sub_262789A98(0, *(void *)(v21 + 16) + 1, 1, v21, &qword_26A95E4B8, MEMORY[0x263F88128], MEMORY[0x263F88128]);
      }
      unint64_t v29 = *(void *)(v21 + 16);
      unint64_t v28 = *(void *)(v21 + 24);
      if (v29 >= v28 >> 1) {
        unint64_t v21 = sub_262789A98(v28 > 1, v29 + 1, 1, v21, &qword_26A95E4B8, MEMORY[0x263F88128], MEMORY[0x263F88128]);
      }
      *(void *)(v21 + 16) = v29 + 1;
      v26((char *)(v21+ ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80))+ *(void *)(v32 + 72) * v29), v46, v25);
    }
    v19 += v42;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_2627896E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
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

uint64_t sub_262789754(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E428);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2627897BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageExtractor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  return sub_262789830(a2 + 32, a1 + 32);
}

uint64_t sub_262789830(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_26278988C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E518);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_26278C94C(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_262789988(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E4D8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      int64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      int64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_26278CA34(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_262789A98(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_26278E4E0();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_26278D800(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

void sub_262789D18(uint64_t a1)
{
  sub_262787A28(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_262789D58(uint64_t a1)
{
  sub_26278E1A0();
  sub_26278E5C0();
  sub_26278E110();
  uint64_t v2 = sub_26278E5D0();
  swift_bridgeObjectRelease();
  return sub_262789EA8(a1, v2);
}

unint64_t sub_262789DEC(uint64_t a1, uint64_t a2)
{
  sub_26278E5C0();
  sub_26278E110();
  uint64_t v4 = sub_26278E5D0();
  return sub_26278A020(a1, a2, v4);
}

unint64_t sub_262789E64(uint64_t a1)
{
  uint64_t v2 = sub_26278E5B0();
  return sub_26278A104(a1, v2);
}

unint64_t sub_262789EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_26278E1A0();
    uint64_t v8 = v7;
    if (v6 == sub_26278E1A0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_26278E580();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_26278E1A0();
          uint64_t v15 = v14;
          if (v13 == sub_26278E1A0() && v15 == v16) {
            break;
          }
          char v18 = sub_26278E580();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_26278A020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_26278E580() & 1) == 0)
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
      while (!v14 && (sub_26278E580() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_26278A104(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_26278A1A0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E4D0);
  char v37 = a2;
  uint64_t v6 = sub_26278E510();
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
  long long v34 = v2;
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
    unint64_t v22 = (void *)(v5 + 64);
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
          uint64_t v3 = v34;
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
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_26278E5C0();
    sub_26278E110();
    uint64_t result = sub_26278E5D0();
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
    char v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *char v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_26278A4AC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E4C0);
  uint64_t result = sub_26278E510();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *uint64_t v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_26278E5B0();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_26278A764()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E4D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_26278E500();
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    unint64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_26278A914()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E4C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_26278E500();
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
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_26278AAB8(void **a1)
{
  uint64_t v2 = *(void *)(sub_26278DFA0() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_26278C908(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_26278AB60(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_26278AB60(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v170 = sub_26278DDA0();
  uint64_t v4 = *(void *)(v170 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v170);
  v169 = (char *)&v149 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v168 = (char *)&v149 - v7;
  uint64_t v8 = sub_26278DFA0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v155 = (char *)&v149 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v174 = (char *)&v149 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v167 = (char *)&v149 - v15;
  MEMORY[0x270FA5388](v14);
  v166 = (char *)&v149 - v16;
  uint64_t v17 = a1[1];
  uint64_t result = sub_26278E550();
  if (result >= v17)
  {
    if (v17 < 0) {
      goto LABEL_137;
    }
    if (v17) {
      return sub_26278B8C8(0, v17, 1, a1);
    }
    return result;
  }
  if (v17 >= 0) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v17 + 1;
  }
  if (v17 < -1) {
    goto LABEL_145;
  }
  uint64_t v20 = result;
  v172 = a1;
  v158 = (void *)v9;
  if (v17 < 2)
  {
    uint64_t v25 = v4;
    BOOL v26 = (char *)MEMORY[0x263F8EE78];
    unint64_t v157 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v149 = MEMORY[0x263F8EE78];
    if (v17 != 1)
    {
      unint64_t v29 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_103:
      if (v29 >= 2)
      {
        uint64_t v142 = *a1;
        do
        {
          unint64_t v143 = v29 - 2;
          if (v29 < 2) {
            goto LABEL_132;
          }
          if (!v142) {
            goto LABEL_144;
          }
          v144 = v26;
          uint64_t v145 = *(void *)&v26[16 * v143 + 32];
          uint64_t v146 = *(void *)&v26[16 * v29 + 24];
          sub_26278BCA4(v142 + v158[9] * v145, v142 + v158[9] * *(void *)&v26[16 * v29 + 16], v142 + v158[9] * v146, v157);
          if (v2) {
            break;
          }
          if (v146 < v145) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v144 = sub_26278C5E8((uint64_t)v26);
          }
          if (v143 >= *((void *)v144 + 2)) {
            goto LABEL_134;
          }
          v147 = &v144[16 * v143 + 32];
          *(void *)v147 = v145;
          *((void *)v147 + 1) = v146;
          unint64_t v148 = *((void *)v144 + 2);
          if (v29 > v148) {
            goto LABEL_135;
          }
          memmove(&v144[16 * v29 + 16], &v144[16 * v29 + 32], 16 * (v148 - v29));
          *((void *)v144 + 2) = v148 - 1;
          unint64_t v29 = v148 - 1;
          BOOL v26 = v144;
        }
        while (v148 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)(v149 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v21 = 1;
    uint64_t v4 = v25;
  }
  else
  {
    uint64_t v21 = v17;
    uint64_t v22 = v19 >> 1;
    uint64_t v23 = sub_26278E2F0();
    *(void *)(v23 + 16) = v22;
    unint64_t v24 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v149 = v23;
    unint64_t v157 = v23 + v24;
  }
  uint64_t v27 = 0;
  v164 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v165 = v9 + 16;
  v163 = (void (**)(char *, uint64_t))(v9 + 8);
  v178 = (uint64_t *)(v9 + 32);
  BOOL v26 = (char *)MEMORY[0x263F8EE78];
  uint64_t v173 = v8;
  uint64_t v151 = v20;
  uint64_t v28 = v21;
  while (1)
  {
    uint64_t v30 = v27 + 1;
    uint64_t v156 = v27;
    if (v27 + 1 >= v28)
    {
      a1 = v172;
    }
    else
    {
      v150 = v26;
      uint64_t v31 = *v172;
      uint64_t v152 = v31;
      uint64_t v32 = v158[9];
      uint64_t v176 = v32;
      uint64_t v177 = v27 + 1;
      uint64_t v33 = v31 + v32 * v30;
      long long v34 = (void (*)(char *, uint64_t, uint64_t))v158[2];
      int64_t v35 = v166;
      v175 = (char *)v28;
      v34(v166, v33, v8);
      uint64_t v36 = v31 + v32 * v27;
      char v37 = v167;
      v162 = v34;
      v34(v167, v36, v8);
      unint64_t v38 = v168;
      sub_26278DF70();
      uint64_t v39 = v169;
      sub_26278DF70();
      LODWORD(v171) = sub_26278DD70();
      uint64_t v40 = (char *)*v164;
      uint64_t v41 = v170;
      (*v164)(v39, v170);
      v161 = v40;
      ((void (*)(char *, uint64_t))v40)(v38, v41);
      uint64_t v42 = (void (*)(char *, uint64_t))v158[1];
      uint64_t v43 = v37;
      uint64_t v27 = v156;
      v42(v43, v8);
      v160 = (char *)v42;
      v42(v35, v8);
      uint64_t v28 = (uint64_t)v175;
      uint64_t v30 = v27 + 2;
      if (v27 + 2 < (uint64_t)v175)
      {
        uint64_t v154 = v2;
        uint64_t v159 = v176 * v177;
        uint64_t v44 = v152;
        uint64_t v153 = v176 * v30;
        while (1)
        {
          uint64_t v45 = v30;
          unint64_t v46 = v166;
          uint64_t v47 = v173;
          uint64_t v48 = v162;
          v162(v166, v44 + v153, v173);
          unint64_t v49 = v167;
          v48(v167, v44 + v159, v47);
          uint64_t v50 = v168;
          sub_26278DF70();
          uint64_t v51 = v169;
          sub_26278DF70();
          LODWORD(v177) = sub_26278DD70();
          uint64_t v52 = v51;
          uint64_t v53 = v170;
          uint64_t v54 = (void (*)(char *, uint64_t))v161;
          ((void (*)(char *, uint64_t))v161)(v52, v170);
          v54(v50, v53);
          uint64_t v55 = (void (*)(char *, uint64_t))v160;
          ((void (*)(char *, uint64_t))v160)(v49, v47);
          v55(v46, v47);
          if ((v171 ^ v177)) {
            break;
          }
          uint64_t v30 = v45 + 1;
          uint64_t v28 = (uint64_t)v175;
          v44 += v176;
          if (v175 == (char *)(v45 + 1))
          {
            uint64_t v30 = (uint64_t)v175;
            uint64_t v8 = v173;
            uint64_t v2 = v154;
            uint64_t v27 = v156;
            goto LABEL_24;
          }
        }
        uint64_t v8 = v173;
        uint64_t v2 = v154;
        uint64_t v30 = v45;
        uint64_t v27 = v156;
        uint64_t v28 = (uint64_t)v175;
      }
LABEL_24:
      a1 = v172;
      BOOL v26 = v150;
      uint64_t v20 = v151;
      if (v171)
      {
        if (v30 < v27) {
          goto LABEL_138;
        }
        if (v27 < v30)
        {
          uint64_t v56 = 0;
          uint64_t v57 = v176;
          uint64_t v58 = v176 * (v30 - 1);
          uint64_t v59 = v30 * v176;
          uint64_t v60 = v27 * v176;
          do
          {
            if (v27 != v30 + v56 - 1)
            {
              if (!v152) {
                goto LABEL_143;
              }
              uint64_t v154 = v2;
              unint64_t v62 = v152 + v60;
              uint64_t v63 = v152 + v58;
              uint64_t v64 = v152;
              uint64_t v177 = *v178;
              ((void (*)(char *, uint64_t, uint64_t))v177)(v155, v152 + v60, v173);
              if (v60 < v58 || v62 >= v64 + v59)
              {
                uint64_t v61 = v173;
                swift_arrayInitWithTakeFrontToBack();
              }
              else
              {
                uint64_t v61 = v173;
                if (v60 != v58) {
                  swift_arrayInitWithTakeBackToFront();
                }
              }
              ((void (*)(uint64_t, char *, uint64_t))v177)(v63, v155, v61);
              a1 = v172;
              uint64_t v2 = v154;
              uint64_t v57 = v176;
            }
            ++v27;
            --v56;
            v58 -= v57;
            v59 -= v57;
            v60 += v57;
          }
          while (v27 < v30 + v56);
          BOOL v26 = v150;
          uint64_t v8 = v173;
          uint64_t v20 = v151;
          uint64_t v27 = v156;
          uint64_t v28 = (uint64_t)v175;
        }
      }
    }
    if (v30 < v28)
    {
      if (__OFSUB__(v30, v27)) {
        goto LABEL_136;
      }
      if (v30 - v27 < v20) {
        break;
      }
    }
LABEL_55:
    if (v30 < v27) {
      goto LABEL_131;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v171 = v30;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      BOOL v26 = sub_26278C3AC(0, *((void *)v26 + 2) + 1, 1, v26);
    }
    unint64_t v90 = *((void *)v26 + 2);
    unint64_t v89 = *((void *)v26 + 3);
    unint64_t v29 = v90 + 1;
    if (v90 >= v89 >> 1) {
      BOOL v26 = sub_26278C3AC((char *)(v89 > 1), v90 + 1, 1, v26);
    }
    *((void *)v26 + 2) = v29;
    v91 = v26 + 32;
    v92 = &v26[16 * v90 + 32];
    uint64_t v93 = v171;
    *(void *)v92 = v156;
    *((void *)v92 + 1) = v93;
    if (v90)
    {
      while (1)
      {
        unint64_t v94 = v29 - 1;
        if (v29 >= 4)
        {
          v99 = &v91[16 * v29];
          uint64_t v100 = *((void *)v99 - 8);
          uint64_t v101 = *((void *)v99 - 7);
          BOOL v105 = __OFSUB__(v101, v100);
          uint64_t v102 = v101 - v100;
          if (v105) {
            goto LABEL_120;
          }
          uint64_t v104 = *((void *)v99 - 6);
          uint64_t v103 = *((void *)v99 - 5);
          BOOL v105 = __OFSUB__(v103, v104);
          uint64_t v97 = v103 - v104;
          char v98 = v105;
          if (v105) {
            goto LABEL_121;
          }
          unint64_t v106 = v29 - 2;
          v107 = &v91[16 * v29 - 32];
          uint64_t v109 = *(void *)v107;
          uint64_t v108 = *((void *)v107 + 1);
          BOOL v105 = __OFSUB__(v108, v109);
          uint64_t v110 = v108 - v109;
          if (v105) {
            goto LABEL_123;
          }
          BOOL v105 = __OFADD__(v97, v110);
          uint64_t v111 = v97 + v110;
          if (v105) {
            goto LABEL_126;
          }
          if (v111 >= v102)
          {
            v129 = &v91[16 * v94];
            uint64_t v131 = *(void *)v129;
            uint64_t v130 = *((void *)v129 + 1);
            BOOL v105 = __OFSUB__(v130, v131);
            uint64_t v132 = v130 - v131;
            if (v105) {
              goto LABEL_130;
            }
            BOOL v122 = v97 < v132;
            goto LABEL_92;
          }
        }
        else
        {
          if (v29 != 3)
          {
            uint64_t v123 = *((void *)v26 + 4);
            uint64_t v124 = *((void *)v26 + 5);
            BOOL v105 = __OFSUB__(v124, v123);
            uint64_t v116 = v124 - v123;
            char v117 = v105;
            goto LABEL_86;
          }
          uint64_t v96 = *((void *)v26 + 4);
          uint64_t v95 = *((void *)v26 + 5);
          BOOL v105 = __OFSUB__(v95, v96);
          uint64_t v97 = v95 - v96;
          char v98 = v105;
        }
        if (v98) {
          goto LABEL_122;
        }
        unint64_t v106 = v29 - 2;
        v112 = &v91[16 * v29 - 32];
        uint64_t v114 = *(void *)v112;
        uint64_t v113 = *((void *)v112 + 1);
        BOOL v115 = __OFSUB__(v113, v114);
        uint64_t v116 = v113 - v114;
        char v117 = v115;
        if (v115) {
          goto LABEL_125;
        }
        v118 = &v91[16 * v94];
        uint64_t v120 = *(void *)v118;
        uint64_t v119 = *((void *)v118 + 1);
        BOOL v105 = __OFSUB__(v119, v120);
        uint64_t v121 = v119 - v120;
        if (v105) {
          goto LABEL_128;
        }
        if (__OFADD__(v116, v121)) {
          goto LABEL_129;
        }
        if (v116 + v121 >= v97)
        {
          BOOL v122 = v97 < v121;
LABEL_92:
          if (v122) {
            unint64_t v94 = v106;
          }
          goto LABEL_94;
        }
LABEL_86:
        if (v117) {
          goto LABEL_124;
        }
        v125 = &v91[16 * v94];
        uint64_t v127 = *(void *)v125;
        uint64_t v126 = *((void *)v125 + 1);
        BOOL v105 = __OFSUB__(v126, v127);
        uint64_t v128 = v126 - v127;
        if (v105) {
          goto LABEL_127;
        }
        if (v128 < v116) {
          goto LABEL_15;
        }
LABEL_94:
        unint64_t v133 = v94 - 1;
        if (v94 - 1 >= v29)
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
        uint64_t v134 = *a1;
        if (!*a1) {
          goto LABEL_142;
        }
        v135 = v26;
        v136 = &v91[16 * v133];
        uint64_t v137 = *(void *)v136;
        v138 = v91;
        v139 = &v91[16 * v94];
        uint64_t v140 = *((void *)v139 + 1);
        sub_26278BCA4(v134 + v158[9] * *(void *)v136, v134 + v158[9] * *(void *)v139, v134 + v158[9] * v140, v157);
        if (v2) {
          goto LABEL_114;
        }
        if (v140 < v137) {
          goto LABEL_117;
        }
        if (v94 > *((void *)v135 + 2)) {
          goto LABEL_118;
        }
        *(void *)v136 = v137;
        *(void *)&v138[16 * v133 + 8] = v140;
        unint64_t v141 = *((void *)v135 + 2);
        if (v94 >= v141) {
          goto LABEL_119;
        }
        BOOL v26 = v135;
        unint64_t v29 = v141 - 1;
        memmove(v139, v139 + 16, 16 * (v141 - 1 - v94));
        v91 = v138;
        *((void *)v135 + 2) = v141 - 1;
        a1 = v172;
        uint64_t v8 = v173;
        if (v141 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v29 = 1;
LABEL_15:
    uint64_t v28 = a1[1];
    uint64_t v27 = v171;
    uint64_t v20 = v151;
    if (v171 >= v28) {
      goto LABEL_103;
    }
  }
  if (__OFADD__(v27, v20)) {
    goto LABEL_139;
  }
  if (v27 + v20 < v28) {
    uint64_t v28 = v27 + v20;
  }
  if (v28 >= v27)
  {
    if (v30 != v28)
    {
      v150 = v26;
      uint64_t v154 = v2;
      v65 = (char *)v158[9];
      uint64_t v159 = v158[2];
      v160 = v65;
      uint64_t v66 = (void)v65 * (v30 - 1);
      v67 = (char *)(v30 * (void)v65);
      uint64_t v153 = v28;
      do
      {
        uint64_t v69 = 0;
        uint64_t v70 = v156;
        uint64_t v171 = v30;
        v161 = v67;
        v162 = (void (*)(char *, uint64_t, uint64_t))v66;
        while (1)
        {
          uint64_t v176 = v70;
          uint64_t v71 = *a1;
          v175 = &v67[v69];
          v72 = &v67[v69 + v71];
          v73 = v166;
          v74 = (void (*)(char *, uint64_t, uint64_t))v159;
          ((void (*)(char *, char *, uint64_t))v159)(v166, v72, v8);
          uint64_t v75 = v66 + v69 + v71;
          v76 = v167;
          v74(v167, v75, v8);
          v77 = v168;
          sub_26278DF70();
          v78 = a1;
          v79 = v169;
          sub_26278DF70();
          LODWORD(v177) = sub_26278DD70();
          v80 = *v164;
          v81 = v79;
          uint64_t v82 = v170;
          (*v164)(v81, v170);
          v83 = v77;
          uint64_t v8 = v173;
          v80(v83, v82);
          v84 = *v163;
          (*v163)(v76, v8);
          v84(v73, v8);
          if ((v177 & 1) == 0) {
            break;
          }
          uint64_t v85 = *v78;
          if (!*v78) {
            goto LABEL_141;
          }
          v67 = v161;
          uint64_t v66 = (uint64_t)v162;
          v86 = (char *)v162 + v85 + v69;
          v87 = (void (*)(char *, char *, uint64_t))*v178;
          ((void (*)(char *, char *, uint64_t))*v178)(v174, &v161[v85 + v69], v8);
          swift_arrayInitWithTakeFrontToBack();
          v87(v86, v174, v8);
          v69 -= (uint64_t)v160;
          uint64_t v70 = v176 + 1;
          uint64_t v68 = v171;
          a1 = v172;
          if (v171 == v176 + 1) {
            goto LABEL_48;
          }
        }
        uint64_t v68 = v171;
        a1 = v78;
        v67 = v161;
        uint64_t v66 = (uint64_t)v162;
LABEL_48:
        uint64_t v30 = v68 + 1;
        v66 += (uint64_t)v160;
        v67 = &v160[(void)v67];
      }
      while (v30 != v153);
      uint64_t v30 = v153;
      uint64_t v2 = v154;
      BOOL v26 = v150;
      uint64_t v27 = v156;
    }
    goto LABEL_55;
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
  uint64_t result = sub_26278E4E0();
  __break(1u);
  return result;
}

uint64_t sub_26278B8C8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v46 = a1;
  uint64_t v56 = sub_26278DDA0();
  uint64_t v7 = *(void *)(v56 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v56);
  uint64_t v55 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v54 = (char *)&v44 - v10;
  uint64_t v11 = sub_26278DFA0();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  unint64_t v62 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v53 = (char *)&v44 - v15;
  uint64_t result = MEMORY[0x270FA5388](v14);
  uint64_t v52 = (char *)&v44 - v18;
  uint64_t v60 = a3;
  uint64_t v45 = a2;
  if (a3 != a2)
  {
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
    uint64_t v19 = v17 + 16;
    uint64_t v21 = *(void *)(v19 + 56);
    uint64_t v48 = (void (**)(char *, uint64_t))(v7 + 8);
    unint64_t v49 = v20;
    uint64_t v47 = (void (**)(char *, uint64_t))(v19 - 8);
    uint64_t v50 = v11;
    uint64_t v51 = v19;
    uint64_t v61 = (void (**)(char *, uint64_t, uint64_t))(v19 + 16);
    uint64_t v22 = v21 * (v60 - 1);
    uint64_t v57 = v21;
    uint64_t v23 = v21 * v60;
LABEL_5:
    uint64_t v24 = 0;
    uint64_t v64 = v46;
    uint64_t v58 = v23;
    uint64_t v59 = v22;
    while (1)
    {
      uint64_t v25 = *a4;
      uint64_t v63 = v23 + v24;
      uint64_t v26 = v23 + v24 + v25;
      uint64_t v27 = v52;
      uint64_t v28 = v49;
      v49(v52, v26, v11);
      uint64_t v29 = v22 + v24 + v25;
      uint64_t v30 = v53;
      v28(v53, v29, v11);
      uint64_t v31 = v54;
      sub_26278DF70();
      uint64_t v32 = a4;
      uint64_t v33 = v55;
      sub_26278DF70();
      int v65 = sub_26278DD70();
      long long v34 = *v48;
      int64_t v35 = v33;
      uint64_t v36 = v56;
      (*v48)(v35, v56);
      uint64_t v37 = v36;
      a4 = v32;
      uint64_t v11 = v50;
      v34(v31, v37);
      unint64_t v38 = *v47;
      uint64_t v39 = v30;
      uint64_t v22 = v59;
      (*v47)(v39, v11);
      uint64_t v40 = v27;
      uint64_t v23 = v58;
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v38)(v40, v11);
      if ((v65 & 1) == 0)
      {
LABEL_4:
        v22 += v57;
        v23 += v57;
        if (++v60 == v45) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v41 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v42 = v41 + v22 + v24;
      uint64_t v43 = *v61;
      (*v61)(v62, v41 + v23 + v24, v11);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v43)(v42, v62, v11);
      v24 -= v57;
      if (v60 == ++v64) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_26278BCA4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v75 = sub_26278DDA0();
  uint64_t v8 = *(void *)(v75 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v75);
  v74 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v73 = (char *)&v61 - v11;
  uint64_t v77 = sub_26278DFA0();
  uint64_t v12 = *(void *)(v77 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v77);
  v72 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v71 = (char *)&v61 - v15;
  uint64_t v17 = *(void *)(v16 + 72);
  if (!v17)
  {
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (a2 - a1 == 0x8000000000000000 && v17 == -1) {
    goto LABEL_61;
  }
  int64_t v18 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v17 == -1) {
    goto LABEL_62;
  }
  uint64_t v19 = (uint64_t)(a2 - a1) / v17;
  unint64_t v80 = a1;
  unint64_t v79 = a4;
  uint64_t v20 = v18 / v17;
  if (v19 >= v18 / v17)
  {
    if ((v20 & 0x8000000000000000) == 0)
    {
      uint64_t v22 = v20 * v17;
      if (a4 < a2 || a2 + v22 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v41 = a4 + v22;
      unint64_t v78 = a4 + v22;
      unint64_t v80 = a2;
      if (v22 >= 1 && a1 < a2)
      {
        uint64_t v43 = -v17;
        uint64_t v44 = *(void (**)(void))(v12 + 16);
        uint64_t v63 = (void (**)(char *, uint64_t))(v8 + 8);
        uint64_t v64 = (void (*)(char *))v44;
        uint64_t v70 = v12 + 16;
        unint64_t v62 = (void (**)(char *, uint64_t))(v12 + 8);
        int v65 = (void (**)(char *, uint64_t))a1;
        unint64_t v66 = a4;
        uint64_t v45 = v71;
        do
        {
          v76 = (void (**)(char *, uint64_t))a3;
          uint64_t v68 = (void (**)(char *, uint64_t))a2;
          unint64_t v69 = a3 + v43;
          uint64_t v46 = v77;
          uint64_t v47 = v64;
          ((void (*)(char *, unint64_t, uint64_t))v64)(v45, v41 + v43, v77);
          uint64_t v48 = v72;
          v67 = (void (**)(char *, uint64_t))(a2 + v43);
          v47(v72);
          unint64_t v49 = v73;
          sub_26278DF70();
          uint64_t v50 = v74;
          sub_26278DF70();
          LOBYTE(v47) = sub_26278DD70();
          uint64_t v51 = v43;
          uint64_t v52 = *v63;
          uint64_t v53 = v50;
          uint64_t v54 = v75;
          (*v63)(v53, v75);
          v52(v49, v54);
          uint64_t v55 = *v62;
          (*v62)(v48, v46);
          v55(v45, v46);
          if (v47)
          {
            a3 = v69;
            if (v76 < v68 || v69 >= (unint64_t)v68)
            {
              uint64_t v58 = v67;
              swift_arrayInitWithTakeFrontToBack();
              uint64_t v57 = v65;
              unint64_t v56 = v66;
              uint64_t v43 = v51;
            }
            else
            {
              uint64_t v57 = v65;
              unint64_t v56 = v66;
              uint64_t v43 = v51;
              uint64_t v58 = v67;
              if (v76 != v68) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v80 += v43;
          }
          else
          {
            uint64_t v58 = v68;
            a3 = v69;
            unint64_t v59 = v78;
            v78 += v51;
            uint64_t v43 = v51;
            if ((unint64_t)v76 < v59 || v69 >= v59)
            {
              swift_arrayInitWithTakeFrontToBack();
              uint64_t v57 = v65;
              unint64_t v56 = v66;
            }
            else
            {
              uint64_t v57 = v65;
              unint64_t v56 = v66;
              if (v76 != (void (**)(char *, uint64_t))v59) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
          }
          unint64_t v41 = v78;
          if (v78 <= v56) {
            break;
          }
          a2 = (unint64_t)v58;
        }
        while (v58 > v57);
      }
      goto LABEL_59;
    }
  }
  else if ((v19 & 0x8000000000000000) == 0)
  {
    uint64_t v21 = v19 * v17;
    if (a4 < a1 || a1 + v21 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v69 = a4 + v21;
    unint64_t v78 = a4 + v21;
    if (v21 >= 1 && a2 < a3)
    {
      uint64_t v24 = *(void (***)(char *, uint64_t))(v12 + 16);
      v67 = (void (**)(char *, uint64_t))(v8 + 8);
      uint64_t v68 = v24;
      uint64_t v70 = v12 + 16;
      uint64_t v64 = (void (*)(char *))v17;
      int v65 = (void (**)(char *, uint64_t))(v12 + 8);
      v76 = (void (**)(char *, uint64_t))a3;
      uint64_t v26 = v71;
      uint64_t v25 = v72;
      do
      {
        unint64_t v27 = a4;
        uint64_t v28 = v77;
        uint64_t v29 = v68;
        ((void (*)(char *, unint64_t, uint64_t))v68)(v26, a2, v77);
        ((void (*)(char *, unint64_t, uint64_t))v29)(v25, v27, v28);
        uint64_t v30 = v73;
        sub_26278DF70();
        uint64_t v31 = v74;
        sub_26278DF70();
        LOBYTE(v27) = sub_26278DD70();
        uint64_t v32 = *v67;
        uint64_t v33 = v31;
        uint64_t v34 = v75;
        (*v67)(v33, v75);
        v32(v30, v34);
        int64_t v35 = *v65;
        (*v65)(v25, v28);
        v35(v26, v28);
        unint64_t v36 = v80;
        if (v27)
        {
          uint64_t v37 = (void (*)(void))v64;
          unint64_t v38 = (unint64_t)v64 + a2;
          if (v80 < a2 || v80 >= v38)
          {
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v39 = (unint64_t)v76;
          }
          else
          {
            unint64_t v39 = (unint64_t)v76;
            if (v80 == a2) {
              unint64_t v36 = a2;
            }
            else {
              swift_arrayInitWithTakeBackToFront();
            }
          }
        }
        else
        {
          uint64_t v37 = (void (*)(void))v64;
          unint64_t v40 = (unint64_t)v64 + v79;
          if (v80 < v79 || v80 >= v40)
          {
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v39 = (unint64_t)v76;
          }
          else
          {
            unint64_t v39 = (unint64_t)v76;
            if (v80 != v79) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          unint64_t v79 = v40;
          unint64_t v38 = a2;
        }
        unint64_t v80 = (unint64_t)v37 + v36;
        a4 = v79;
        if (v79 >= v69) {
          break;
        }
        a2 = v38;
      }
      while (v38 < v39);
    }
LABEL_59:
    sub_26278C4A8(&v80, &v79, (uint64_t *)&v78);
    return 1;
  }
LABEL_63:
  uint64_t result = sub_26278E530();
  __break(1u);
  return result;
}

char *sub_26278C3AC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E4C8);
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

uint64_t sub_26278C4A8(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_26278DFA0();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_26278E530();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_26278C5E8(uint64_t a1)
{
  return sub_26278C3AC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_26278C5FC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_26278C638(a1, a2, a3, (void *)*v3, &qword_26A95E4B8, MEMORY[0x263F88128]);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_26278C638(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_26278E530();
  __break(1u);
  return result;
}

uint64_t sub_26278C880(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
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
  unint64_t v9 = (unint64_t *)(a1 + 80);
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

uint64_t sub_26278C908(void *a1)
{
  return sub_26278C638(0, a1[2], 0, a1, &qword_26A95E478, MEMORY[0x263F88120]);
}

char *sub_26278C94C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + a1 + 32);
    unsigned int v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_26278E530();
  __break(1u);
  return result;
}

uint64_t sub_26278CA34(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_26278E530();
  __break(1u);
  return result;
}

uint64_t sub_26278CB28(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_26278CB38()
{
  unint64_t result = qword_26A95E460;
  if (!qword_26A95E460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A95E460);
  }
  return result;
}

uint64_t sub_26278CB8C()
{
  return sub_26278D968(qword_26A95E480, (void (*)(uint64_t))type metadata accessor for MessageExtractor);
}

uint64_t sub_26278CBD4()
{
  return MEMORY[0x263F8E4E0];
}

char *initializeBufferWithCopyOfBuffer for MessageExtractor(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    unint64_t v7 = a1;
    unint64_t v8 = a2[1];
    *((void *)a1 + 1) = v8;
    long long v9 = *((_OWORD *)a2 + 2);
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    *((_OWORD *)a1 + 2) = v9;
    a1[48] = *((unsigned char *)a2 + 48);
    uint64_t v10 = a3[11];
    __dst = &a1[v10];
    uint64_t v11 = (char *)a2 + v10;
    uint64_t v12 = sub_26278DDA0();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    unint64_t v15 = v4;
    uint64_t v16 = v8;
    if (v14(v11, 1, v12))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E428);
      memcpy(__dst, v11, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    uint64_t v18 = a3[13];
    *(void *)&v7[a3[12]] = *(char **)((char *)a2 + a3[12]);
    *(void *)&v7[v18] = *(char **)((char *)a2 + v18);
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t destroy for MessageExtractor(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 44);
  uint64_t v5 = sub_26278DDA0();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MessageExtractor(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  unint64_t v7 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v7;
  long long v8 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v9 = a3[11];
  __dst = (void *)(a1 + v9);
  uint64_t v10 = (const void *)(a2 + v9);
  uint64_t v11 = sub_26278DDA0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  id v14 = v6;
  id v15 = v7;
  if (v13(v10, 1, v11))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E428);
    memcpy(__dst, v10, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(__dst, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
  }
  uint64_t v17 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MessageExtractor(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  unint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  uint64_t v9 = *(void **)(a2 + 8);
  uint64_t v10 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v9;
  id v11 = v9;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v12 = a3[11];
  uint64_t v13 = (void *)(a1 + v12);
  id v14 = (void *)(a2 + v12);
  uint64_t v15 = sub_26278DDA0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 24))(v13, v14, v15);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E428);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_7:
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MessageExtractor(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = a3[11];
  id v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_26278DDA0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E428);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  return a1;
}

uint64_t assignWithTake for MessageExtractor(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  long long v8 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v9 = a3[11];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = sub_26278DDA0();
  uint64_t v13 = *(void *)(v12 - 8);
  id v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E428);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  uint64_t v18 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + v18) = *(void *)(a2 + v18);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageExtractor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_26278D504);
}

uint64_t sub_26278D504(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E428);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 44);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for MessageExtractor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_26278D5CC);
}

void *sub_26278D5CC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E428);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 44);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_26278D678()
{
  sub_26278D744();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_26278D744()
{
  if (!qword_26A95E4A8)
  {
    sub_26278DDA0();
    unint64_t v0 = sub_26278E3C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A95E4A8);
    }
  }
}

uint64_t sub_26278D79C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageExtractor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_26278D800(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_26278E530();
  __break(1u);
  return result;
}

uint64_t block_destroy_helper_14(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 32);
}

uint64_t sub_26278D968(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_26278D9B0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_26278D9EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_26278DA50(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_26278DA60()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E530);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_26278DAF4(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A95E530);
  sub_262787BFC(a1);
}

uint64_t sub_26278DB88()
{
  uint64_t v0 = sub_26278E050();
  __swift_allocate_value_buffer(v0, qword_26A95F1D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A95F1D0);
  return sub_26278E040();
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

uint64_t sub_26278DC70()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_26278DC80()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_26278DC90()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_26278DCA0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_26278DCB0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_26278DCC0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_26278DCD0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_26278DCE0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_26278DCF0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_26278DD00()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_26278DD10()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_26278DD20()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_26278DD30()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_26278DD40()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_26278DD50()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_26278DD60()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_26278DD70()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_26278DD80()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_26278DD90()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_26278DDA0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_26278DDB0()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_26278DDC0()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_26278DDD0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_26278DDE0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_26278DE00()
{
  return MEMORY[0x270F7EBE8]();
}

uint64_t sub_26278DE10()
{
  return MEMORY[0x270F7EBF8]();
}

uint64_t sub_26278DE20()
{
  return MEMORY[0x270F7EC08]();
}

uint64_t sub_26278DE30()
{
  return MEMORY[0x270F7EC48]();
}

uint64_t sub_26278DE40()
{
  return MEMORY[0x270F7EC50]();
}

uint64_t sub_26278DE50()
{
  return MEMORY[0x270F7EC60]();
}

uint64_t sub_26278DE60()
{
  return MEMORY[0x270F7EC78]();
}

uint64_t sub_26278DE70()
{
  return MEMORY[0x270F7EE70]();
}

uint64_t sub_26278DE80()
{
  return MEMORY[0x270F7EE90]();
}

uint64_t sub_26278DE90()
{
  return MEMORY[0x270F7EEB0]();
}

uint64_t sub_26278DEA0()
{
  return MEMORY[0x270F7EEE8]();
}

uint64_t sub_26278DEB0()
{
  return MEMORY[0x270F7EF00]();
}

uint64_t sub_26278DEC0()
{
  return MEMORY[0x270F7EF18]();
}

uint64_t sub_26278DED0()
{
  return MEMORY[0x270F7EF88]();
}

uint64_t sub_26278DEE0()
{
  return MEMORY[0x270F7EFE8]();
}

uint64_t sub_26278DEF0()
{
  return MEMORY[0x270F7F200]();
}

uint64_t sub_26278DF00()
{
  return MEMORY[0x270F7F228]();
}

uint64_t sub_26278DF10()
{
  return MEMORY[0x270F7F248]();
}

uint64_t sub_26278DF20()
{
  return MEMORY[0x270F7F250]();
}

uint64_t sub_26278DF30()
{
  return MEMORY[0x270F7F268]();
}

uint64_t sub_26278DF40()
{
  return MEMORY[0x270F7F5E0]();
}

uint64_t sub_26278DF50()
{
  return MEMORY[0x270F874C0]();
}

uint64_t sub_26278DF60()
{
  return MEMORY[0x270F874C8]();
}

uint64_t sub_26278DF70()
{
  return MEMORY[0x270F874D0]();
}

uint64_t sub_26278DF80()
{
  return MEMORY[0x270F874D8]();
}

uint64_t sub_26278DF90()
{
  return MEMORY[0x270F874E0]();
}

uint64_t sub_26278DFA0()
{
  return MEMORY[0x270F874E8]();
}

uint64_t sub_26278DFB0()
{
  return MEMORY[0x270F874F0]();
}

uint64_t sub_26278DFC0()
{
  return MEMORY[0x270F874F8]();
}

uint64_t sub_26278DFD0()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_26278DFE0()
{
  return MEMORY[0x270FA2AA0]();
}

uint64_t sub_26278DFF0()
{
  return MEMORY[0x270FA2AA8]();
}

uint64_t sub_26278E000()
{
  return MEMORY[0x270FA2AB8]();
}

uint64_t sub_26278E010()
{
  return MEMORY[0x270FA2AD8]();
}

uint64_t sub_26278E020()
{
  return MEMORY[0x270F2F458]();
}

uint64_t sub_26278E030()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_26278E040()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_26278E050()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_26278E060()
{
  return MEMORY[0x270EEA998]();
}

uint64_t sub_26278E070()
{
  return MEMORY[0x270EEA9E8]();
}

uint64_t sub_26278E080()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_26278E090()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_26278E0A0()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_26278E0B0()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_26278E0C0()
{
  return MEMORY[0x270EEAB00]();
}

uint64_t sub_26278E0D0()
{
  return MEMORY[0x270EEAB30]();
}

uint64_t sub_26278E0E0()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_26278E0F0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_26278E100()
{
  return MEMORY[0x270F9D3A8]();
}

uint64_t sub_26278E110()
{
  return MEMORY[0x270F9D3C0]();
}

uint64_t sub_26278E120()
{
  return MEMORY[0x270FA2B78]();
}

uint64_t sub_26278E130()
{
  return MEMORY[0x270FA2B80]();
}

uint64_t sub_26278E140()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_26278E150()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_26278E160()
{
  return MEMORY[0x270EF1870]();
}

uint64_t sub_26278E170()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_26278E180()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_26278E190()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_26278E1A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_26278E1B0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_26278E1C0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_26278E1D0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_26278E1E0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_26278E1F0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_26278E200()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_26278E210()
{
  return MEMORY[0x270F9D660]();
}

uint64_t sub_26278E220()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_26278E230()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_26278E240()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_26278E250()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_26278E260()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_26278E270()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_26278E280()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_26278E290()
{
  return MEMORY[0x270F9D890]();
}

uint64_t sub_26278E2A0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_26278E2B0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_26278E2C0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_26278E2D0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_26278E2E0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_26278E2F0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_26278E300()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_26278E310()
{
  return MEMORY[0x270FA1E10]();
}

uint64_t sub_26278E320()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_26278E330()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_26278E340()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_26278E350()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_26278E360()
{
  return MEMORY[0x270FA2BE0]();
}

uint64_t sub_26278E370()
{
  return MEMORY[0x270FA2BE8]();
}

uint64_t sub_26278E380()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_26278E390()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_26278E3A0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_26278E3B0()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_26278E3C0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_26278E3D0()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_26278E3E0()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_26278E3F0()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_26278E400()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_26278E410()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_26278E420()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_26278E430()
{
  return MEMORY[0x270EF24E0]();
}

uint64_t sub_26278E440()
{
  return MEMORY[0x270EF2530]();
}

uint64_t sub_26278E450()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_26278E470()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_26278E480()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_26278E4A0()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_26278E4B0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_26278E4C0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_26278E4D0()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_26278E4E0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_26278E4F0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_26278E500()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_26278E510()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_26278E520()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_26278E530()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_26278E550()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_26278E560()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_26278E580()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_26278E590()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_26278E5A0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_26278E5B0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_26278E5C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_26278E5D0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_26278E5E0()
{
  return MEMORY[0x270F9FED0]();
}

uint64_t sub_26278E5F0()
{
  return MEMORY[0x270F9FEE0]();
}

uint64_t sub_26278E600()
{
  return MEMORY[0x270F9FF20]();
}

uint64_t sub_26278E610()
{
  return MEMORY[0x270F9FF30]();
}

uint64_t sub_26278E620()
{
  return MEMORY[0x270F9FF38]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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